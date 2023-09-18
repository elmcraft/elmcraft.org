module Route.SPLAT__ exposing (..)

import BackendTask
import BackendTask.Glob as Glob
import BackendTask.Helpers exposing (..)
import DataSource.ElmPackagesRSS
import DataSource.ElmRadio
import DataSource.ElmTown
import DataSource.ElmWeeklyRSS
import DataSource.MarkdownElmUi
import DataSource.Meta
import DataSource.Notion as Notion
import Dict
import Effect
import Element exposing (..)
import Head
import Head.Seo as Seo
import Html
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import List.NonEmpty
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import PagesMsg
import Route
import RouteBuilder exposing (App, StatefulRoute)
import RouteCommon
import Shared
import Theme
import Theme.Videos
import Timestamps exposing (Timestamps)
import Types
import UrlPath exposing (UrlPath)
import View exposing (..)


type alias Model =
    ()


type alias Msg =
    Types.Msg


type alias RouteParams =
    { splat : List String }


type alias Data =
    RouteCommon.Data



-- type alias Data =
--     -- { ui : Types_.Model -> Types_.GlobalData -> List (Element Types_.Msg)
--     { meta : DataSource.Meta.Meta
--     , timestamps : Timestamps
--     , global : Types.GlobalData
--     , rawMarkdown : String
--     , path : String
--     }


route : StatefulRoute RouteParams Data ActionData () Types.Msg
route =
    RouteBuilder.preRender
        { head = head
        , pages = routes
        , data = data
        }
        |> RouteBuilder.buildWithSharedState
            { view =
                \app modelShared modelTemplate ->
                    view app modelShared
            , init =
                \app modelShared ->
                    ( (), Effect.none )
            , update =
                -- , update : PageUrl -> StaticPayload data routeParams -> msg -> model -> Shared.Model -> ( model, Effect msg, Maybe Shared.Msg )
                \app modelShared msgTemplate modelTemplate ->
                    -- SPLAT__ uses Types_.Msg same as shared, so just route all handling up to shared.
                    -- @TODO fix this after type checking....
                    -- ( (), Effect.none, Just msgTemplate )
                    ( (), Effect.none, Just Types.Noop )
            , subscriptions =
                \routeParams path modelShared modelTemplate ->
                    Sub.none
            }


routes : BTask (List RouteParams)
routes =
    content
        |> BackendTask.map
            (List.map
                (\contentPage ->
                    { splat = contentPage }
                )
            )


content : BTask (List (List String))
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
        |> Glob.toBackendTask


data : RouteParams -> BTask Data
data routeParams =
    DataSource.MarkdownElmUi.routeAsLoadedPageAndThen routeParams
        (\path d ->
            let
                getVideos =
                    if d.markdown |> String.contains "<video" then
                        Notion.recursiveGetVideos Nothing

                    else if path == "content/index.md" then
                        Notion.getVideos 3

                    else
                        BackendTask.succeed []

                onlyOn p backendTask default =
                    if path == p then
                        backendTask

                    else
                        BackendTask.succeed default
            in
            BackendTask.map7
                (\ts videos videosCount elmRadioM elmTownM newsletterM packageM ->
                    let
                        data_ : Data
                        data_ =
                            { meta = d.meta
                            , timestamps = ts
                            , global =
                                { videos = videos
                                , videosCount = videosCount
                                , latestElmRadio = elmRadioM
                                , latestElmTown = elmTownM
                                , latestNewsletter = newsletterM
                                , latestPackage = packageM
                                }
                            , rawMarkdown = d.markdown
                            }
                    in
                    data_
                )
                (Timestamps.data path |> BackendTask.allowFatal)
                getVideos
                (onlyOn "content/index.md" Notion.getVideosCount 0)
                (onlyOn "content/index.md" (DataSource.ElmRadio.episodeLatest |> BackendTask.map Just) Nothing)
                (onlyOn "content/index.md" (DataSource.ElmTown.episodeLatest |> BackendTask.map Just) Nothing)
                (onlyOn "content/index.md" (DataSource.ElmWeeklyRSS.newsletterLatest |> BackendTask.map Just) Nothing)
                (onlyOn "content/index.md" (DataSource.ElmPackagesRSS.packagesLatest 3 |> BackendTask.map Just) Nothing)
        )


head : App Data ActionData RouteParams -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elmcraft"
        , image =
            { url = UrlPath.fromString "/images/elmcraft-logo.png" |> Pages.Url.fromPath
            , alt = "Elmcraft logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = static.data.meta.description
        , locale = Nothing
        , title = static.data.meta.title
        }
        |> Seo.website


type alias ActionData =
    {}


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg.PagesMsg Types.Msg)
view app sharedModel =
    { title = app.data.meta.title
    , content =
        DataSource.MarkdownElmUi.markdownRendererDirect
            app.data.rawMarkdown
            app.data.meta.route
            sharedModel
            app.data.global
            |> List.map (Element.map PagesMsg.fromMsg)
    , route = app.data.meta.route
    , timestamps = app.data.timestamps
    , status = app.data.meta.status
    , published = app.data.meta.published
    , meta = app.data.meta
    }
