module Page.SPLAT__ exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.File
import DataSource.Glob as Glob
import Dict
import Element exposing (..)
import Head
import Head.Seo as Seo
import Html
import List.NonEmpty
import Markdown.Parser
import Markdown.Renderer
import OptimizedDecoder as Decode
import OptimizedDecoder.Pipeline exposing (hardcoded, required)
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Parser
import Path
import Route
import Shared
import Templates.Markdown
import Theme
import Types
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Types.Msg


type alias RouteParams =
    { splat : List String }


type alias Data =
    { ui : Types.Model -> List (Element Types.Msg)
    , meta : Meta
    }


type alias Meta =
    { title : String
    , description : String
    , published : Bool
    , route : Route.Route
    }


decodeMeta : List String -> Decode.Decoder Meta
decodeMeta splat =
    Decode.succeed Meta
        |> required "title" Decode.string
        |> required "description" Decode.string
        |> required "published" Decode.bool
        |> hardcoded (Route.SPLAT__ { splat = splat })


page : PageWithState RouteParams Data () Types.Msg
page =
    Page.prerender
        { head = head
        , routes = routes
        , data = data
        }
        |> Page.buildWithSharedState
            { view =
                \pageUrlMaybe modelShared templateModel static ->
                    view pageUrlMaybe modelShared static
            , init =
                \pageUrlMaybe modelShared static ->
                    ( (), Cmd.none )
            , update =
                \pageUrl keyNavigationBrowserMaybe modelShared static templateMsg templateModel ->
                    ( (), Cmd.none, Nothing )
            , subscriptions =
                \pageUrlMaybe routeParams path templateModel modelShared ->
                    Sub.none
            }


routes : DataSource (List RouteParams)
routes =
    content
        |> DataSource.map
            (List.map
                (\contentPage ->
                    { splat = contentPage }
                )
            )


content : DataSource (List (List String))
content =
    Glob.succeed
        (\leadingPath last ->
            if last == "index" then
                leadingPath

            else
                leadingPath ++ [ last ]
        )
        |> Glob.match (Glob.literal "content/")
        |> Glob.capture Glob.recursiveWildcard
        |> Glob.match (Glob.literal "/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toDataSource


data : RouteParams -> DataSource Data
data routeParams =
    let
        model =
            Types.initTemporary
    in
    case routeParams.splat of
        parts ->
            parts
                |> withOrWithoutIndexSegment
                |> DataSource.andThen
                    (\path ->
                        path
                            |> DataSource.File.bodyWithFrontmatter
                                (\rawMarkdown ->
                                    Decode.map2
                                        (\meta renderedMarkdown ->
                                            { ui = renderedMarkdown
                                            , meta = meta
                                            }
                                        )
                                        (decodeMeta routeParams.splat)
                                        (rawMarkdown
                                            |> Markdown.Parser.parse
                                            |> Result.mapError (\errs -> errs |> List.map parserDeadEndToString |> String.join "\n" |> (++) ("Failure in path " ++ ": "))
                                            |> Result.andThen
                                                (\blocks ->
                                                    Ok
                                                        (\model_ ->
                                                            case Markdown.Renderer.render (Templates.Markdown.renderer model_) blocks of
                                                                Ok ui ->
                                                                    ui

                                                                Err err ->
                                                                    [ text <| "Failure in path " ++ ": " ++ err ]
                                                        )
                                                )
                                            |> Result.mapError (\err -> err |> (++) ("Failure in path " ++ ": "))
                                            |> Decode.fromResult
                                        )
                                )
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


head : StaticPayload Data RouteParams -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elmcraft"
        , image =
            { url = Path.fromString "/images/elmcraft-logo.png" |> Pages.Url.fromPath
            , alt = "Elmcraft logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = static.data.meta.description
        , locale = Nothing
        , title = static.data.meta.title
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Types.Msg
view maybeUrl sharedModel static =
    { title = static.data.meta.title
    , content = static.data.ui sharedModel
    , route = static.data.meta.route
    }
