module Page.SPLAT_ exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import DataSource.File
import DataSource.Glob as Glob
import Document exposing (Document)
import Element
import Head
import Head.Seo as Seo
import Html
import Markdown.Parser
import Markdown.Renderer
import OptimizedDecoder
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.ImagePath as ImagePath
import Shared


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    { splat : ( String, List String ) }


page : Page RouteParams Data
page =
    Page.prerenderedRoute
        { head = head
        , routes = routes
        , data = data
        }
        |> Page.buildNoState { view = view }


routes : DataSource (List RouteParams)
routes =
    content
        |> DataSource.map
            (List.map
                (\contentPage ->
                    -- contentPage
                    { splat =
                        contentPage

                    -- case String.split "/" contentPage of
                    --     root :: pages ->
                    --         ( root, pages ) |> Debug.log "route"
                    --     _ ->
                    --         ( "nope", [] )
                    }
                )
            )



-- DataSource.succeed
--     [ { splat = ( "hello", [] )
--       }
--     , { splat = ( "elm-loves", [ "community" ] )
--       }
--     ]


content : DataSource (List ( String, List String ))
content =
    Glob.succeed (\firstPart secondPart -> ( firstPart, [ secondPart ] ))
        |> Glob.ignore (Glob.literal "content/")
        |> Glob.capture Glob.wildcard
        |> Glob.ignore (Glob.literal "/")
        |> Glob.capture Glob.wildcard
        |> Glob.ignore (Glob.literal ".md")
        |> Glob.toDataSource


data : RouteParams -> DataSource Data
data routeParams =
    case routeParams.splat of
        ( root, parts ) ->
            DataSource.File.request (([ "content", root ] ++ parts |> String.join "/") ++ ".md")
                (DataSource.File.body
                    |> OptimizedDecoder.andThen
                        (\rawMarkdown ->
                            rawMarkdown
                                |> Markdown.Parser.parse
                                |> Result.mapError (\_ -> "Markdown parsing error")
                                |> Result.andThen (Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer)
                                |> Result.mapError (\_ -> "Markdown parsing error")
                                |> OptimizedDecoder.fromResult
                        )
                )


head :
    StaticPayload Data RouteParams
    -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = ImagePath.build [ "TODO" ]
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "TODO"
        , locale = Nothing
        , title = "TODO title" -- metadata.title -- TODO
        }
        |> Seo.website


type alias Data =
    List (Html.Html Never)


view :
    StaticPayload Data RouteParams
    -> Document Msg
view static =
    { title = "TODO"
    , body =
        [ Element.html (Html.div [] static.data)
        ]
    }
