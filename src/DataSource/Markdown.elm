module DataSource.Markdown exposing (..)

import DataSource exposing (DataSource)
import DataSource.File
import DataSource.Glob as Glob
import Element exposing (..)
import Json.Decode as Decode
import Json.Decode.Extra
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import Markdown.Parser
import Markdown.Renderer
import Parser
import Route
import Theme.Markdown
import Types_
import View exposing (..)


type alias Meta =
    { title : String
    , description : String
    , published : Bool
    , status : Maybe Status
    , route : Route.Route
    }


routeAsLoadedPageAndThen routeParams fn =
    case routeParams.splat of
        parts ->
            parts
                |> withOrWithoutIndexSegment
                |> DataSource.andThen
                    (\path ->
                        path
                            |> DataSource.File.bodyWithFrontmatter
                                (\rawMarkdown ->
                                    -- Decode.map2
                                    --     (\meta ui ->
                                    --         { meta = meta
                                    --         , rawMarkdown = rawMarkdown
                                    --         , path = path
                                    --         }
                                    --     )
                                    --     (decodeMeta routeParams.splat)
                                    --     (markdownRenderer rawMarkdown path)
                                    decodeMeta routeParams.splat
                                        |> Decode.andThen
                                            (\meta ->
                                                markdownRenderer rawMarkdown path meta
                                                    |> Decode.map
                                                        (\ui ->
                                                            { ui = ui
                                                            , meta = meta
                                                            , path = path
                                                            , rawMarkdown = rawMarkdown
                                                            }
                                                        )
                                            )
                                )
                            |> DataSource.andThen (fn path)
                    )


withOrWithoutIndexSegment : List String -> DataSource String
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


decodeMeta : List String -> Decode.Decoder Meta
decodeMeta splat =
    Decode.succeed Meta
        |> required "title" Decode.string
        |> required "description" Decode.string
        |> required "published" Decode.bool
        |> optional "status" (decodeStatus |> Decode.andThen (\v -> Decode.succeed <| Just v)) Nothing
        |> hardcoded (Route.SPLAT__ { splat = splat })


decodeStatus : Decode.Decoder Status
decodeStatus =
    Decode.string
        |> Decode.andThen
            (\s ->
                case s of
                    "seedling" ->
                        Decode.succeed Seedling

                    "budding" ->
                        Decode.succeed Budding

                    "evergreen" ->
                        Decode.succeed Evergreen

                    _ ->
                        Decode.fail ("Was expecting a Status of evergreen|seedling|budding but got: " ++ s)
            )


markdownRenderer : String -> String -> Meta -> Decode.Decoder (Types_.Model -> Types_.GlobalData -> List (Element Types_.Msg))
markdownRenderer rawMarkdown path meta =
    rawMarkdown
        |> Markdown.Parser.parse
        |> Result.mapError
            (\errs ->
                errs
                    |> List.map parserDeadEndToString
                    |> String.join "\n"
                    |> (++) ("Failure in path " ++ ": ")
            )
        |> Result.andThen
            (\blocks ->
                Ok
                    (\model_ global_ ->
                        case Markdown.Renderer.render (Theme.Markdown.renderer model_ global_) blocks of
                            Ok ui ->
                                if not meta.published && not model_.isDev then
                                    [ text "Oops! This page isn't ready for prime-time yet! Check in again soon." ]

                                else
                                    ui

                            Err err ->
                                [ text <| "Failure in path " ++ path ++ ": " ++ err ]
                    )
            )
        |> Result.mapError (\err -> err |> (++) ("Failure in path " ++ ": "))
        |> Json.Decode.Extra.fromResult


markdownRendererDirect rawMarkdown path model global =
    rawMarkdown
        |> Markdown.Parser.parse
        |> Result.mapError
            (\errs ->
                errs
                    |> List.map parserDeadEndToString
                    |> String.join "\n"
                    |> (++) ("Failure in path " ++ ": ")
            )
        |> Result.andThen
            (\blocks ->
                Markdown.Renderer.render (Theme.Markdown.renderer model global) blocks
            )
        |> (\res ->
                case res of
                    Ok ui ->
                        ui

                    Err err ->
                        [ text <| "Failure in path " ++ path ++ ": " ++ err ]
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
