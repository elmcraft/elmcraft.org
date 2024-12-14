module DataSource.MarkdownElmUi exposing (..)

import BackendTask
import BackendTask.File
import BackendTask.Glob as Glob
import BackendTask.Helpers exposing (..)
import DataSource.Meta exposing (..)
import Element exposing (..)
import Json.Decode as D
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import List.Extra as List
import Markdown.Footnotes
import Markdown.Parser
import Markdown.Renderer
import Parser
import Route
import Theme.Markdown
import Theme.UI
import Types
import UrlPath exposing (UrlPath)
import View exposing (..)


decodeMeta : List String -> String -> D.Decoder Meta
decodeMeta splat markdownPath =
    D.succeed Meta
        |> required "title" D.string
        |> required "description" D.string
        |> required "published" D.bool
        |> optional "status" (decodeStatus |> D.andThen (\v -> D.succeed <| Just v)) Nothing
        |> hardcoded (Route.SPLAT__ { splat = splat })
        |> hardcoded markdownPath
        |> optional "authors" (D.string |> D.map (\v -> String.split "," v)) []
        |> optional "editors" (D.string |> D.map (\v -> String.split "," v)) []


decodeStatus : D.Decoder Status
decodeStatus =
    D.string
        |> D.andThen
            (\s ->
                case s of
                    "seedling" ->
                        D.succeed Seedling

                    "budding" ->
                        D.succeed Budding

                    "evergreen" ->
                        D.succeed Evergreen

                    _ ->
                        D.fail ("Was expecting a Status of evergreen|seedling|budding but got: " ++ s)
            )


routeAsLoadedPageAndThen routeParams fn =
    case routeParams.splat of
        parts ->
            parts
                |> withOrWithoutIndexSegment
                |> BackendTask.andThen
                    (\path ->
                        path
                            |> BackendTask.File.bodyWithFrontmatter
                                (\rawMarkdown ->
                                    -- Remove when improvement merged
                                    -- https://github.com/dillonkearns/elm-pages/pull/421
                                    D.oneOf
                                        [ decodeMeta routeParams.splat path

                                        -- , D.succeed ()
                                        --     |> D.andThen
                                        --         (\_ ->
                                        --             decodeMeta routeParams.splat
                                        --                 |> Debug.log ("❌ Failed to decode metadata for " ++ path)
                                        --         )
                                        ]
                                        |> D.andThen
                                            (\meta ->
                                                D.succeed { meta = meta, markdown = rawMarkdown }
                                            )
                                )
                            |> BackendTask.allowFatal
                            |> BackendTask.andThen (fn path)
                    )


withOrWithoutIndexSegment : List String -> BTask String
withOrWithoutIndexSegment parts =
    Glob.succeed identity
        |> Glob.match (Glob.literal ("content" :: parts |> String.join "/"))
        |> Glob.match
            (Glob.oneOf
                ( ( "/index", () )
                , [ ( "", () ) ]
                )
            )
        |> Glob.match (Glob.literal ".md")
        |> Glob.captureFilePath
        |> Glob.expectUniqueMatch
        |> BackendTask.allowFatal


markdownRendererCore rawMarkdown =
    rawMarkdown
        |> prefixMarkdownTableOfContents
        |> Markdown.Footnotes.formatFootnotes
        |> Markdown.Parser.parse
        |> Result.mapError
            (\errs ->
                errs
                    |> List.map parserDeadEndToString
                    |> String.join "\n"
                    |> (++) ("Failure in path " ++ ": ")
            )


markdownRenderer : String -> String -> Meta -> D.Decoder (Types.Model -> Types.GlobalData -> List (Element Types.Msg))
markdownRenderer rawMarkdown path meta =
    rawMarkdown
        |> markdownRendererCore
        |> Result.andThen
            (\blocks ->
                Ok
                    (\model_ global_ ->
                        case Markdown.Renderer.render (Theme.Markdown.renderer meta model_ global_) blocks of
                            Ok ui ->
                                if not meta.published && not global_.isDev then
                                    [ text "Oops! This page isn't ready for prime-time yet! Check in again soon." ]

                                else
                                    ui

                            Err err ->
                                [ text <| "Failure in path " ++ path ++ ": " ++ err ]
                    )
            )
        |> Result.mapError (\err -> err |> (++) ("Failure in path " ++ ": "))
        |> (\v ->
                case v of
                    Ok value ->
                        D.succeed value

                    Err err ->
                        D.fail err
           )


markdownRendererDirect : String -> Meta -> Types.Model -> Types.GlobalData -> List (Element Types.Msg)
markdownRendererDirect rawMarkdown meta model global =
    rawMarkdown
        |> markdownRendererCore
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render (Theme.Markdown.renderer meta model global) blocks
            )
        |> (\res ->
                case res of
                    Ok ui ->
                        ui

                    Err err ->
                        [ text <| "Failure in path " ++ Route.toString meta.route ++ ": " ++ err ]
           )


parserDeadEndToString err =
    let
        contextToString c =
            [ "row:" ++ String.fromInt err.row
            , "col:" ++ String.fromInt err.col
            ]
    in
    -- { row : Int
    --   , col : Int
    --   , problem : problem
    --   , contextStack :
    --         List
    --             { row : Int
    --             , col : Int
    --             , context : context
    --             }
    --   }
    [ "row:" ++ String.fromInt err.row
    , "col:" ++ String.fromInt err.col
    , "problem:" ++ problemToString err.problem
    ]
        |> String.join "\n"


prefixMarkdownTableOfContents s =
    let
        toc =
            s
                |> String.split "\n"
                |> List.dropWhile (\l -> l /= "<toc></toc>")
                |> List.filter (String.startsWith "##")
                |> List.filter (not << String.startsWith "####")
                |> List.map
                    (\l ->
                        let
                            depth =
                                l
                                    |> String.split "#"
                                    |> List.length
                                    |> (\v -> List.repeat ((v - 3) * 2) " ")
                                    |> String.join ""

                            title =
                                l |> String.replace "#" "" |> String.trim

                            ref =
                                Theme.UI.stringToTitleId title
                                    |> String.replace "(" "\\("
                                    |> String.replace ")" "\\)"
                        in
                        depth ++ "- [" ++ title ++ "](#" ++ ref ++ ")"
                    )
                |> String.join "\n"
                |> (++) "**Contents:**\n\n"

        -- _ =
        --     Debug.log "" (toc |> String.split "\n")
    in
    s |> String.replace "<toc></toc>" toc


problemToString problem =
    case problem of
        Parser.Expecting string ->
            "Expecting:" ++ string

        Parser.ExpectingInt ->
            "ExpectingInt"

        Parser.ExpectingHex ->
            "ExpectingHex"

        Parser.ExpectingOctal ->
            "ExpectingOctal"

        Parser.ExpectingBinary ->
            "ExpectingBinary"

        Parser.ExpectingFloat ->
            "ExpectingFloat"

        Parser.ExpectingNumber ->
            "ExpectingNumber"

        Parser.ExpectingVariable ->
            "ExpectingVariable"

        Parser.ExpectingSymbol string ->
            "ExpectingSymbol:" ++ string

        Parser.ExpectingKeyword string ->
            "ExpectingKeyword:" ++ string

        Parser.ExpectingEnd ->
            "ExpectingEnd"

        Parser.UnexpectedChar ->
            "UnexpectedChar"

        Parser.Problem string ->
            "Problem:" ++ string

        Parser.BadRepeat ->
            "BadRepeat"
