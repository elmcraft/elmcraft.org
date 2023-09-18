module Api exposing (routes)

import ApiRoute exposing (ApiRoute)
import BackendTask exposing (BackendTask)
import BackendTask.Helpers exposing (..)
import DataSource.MarkdownElmUi
import Element
import FatalError exposing (FatalError)
import Head
import Html exposing (Html)
import Pages.Manifest as Manifest
import Route exposing (Route)
import Site
import Sitemap


routes :
    BackendTask FatalError (List Route)
    -> (Maybe { indent : Int, newLines : Bool } -> Html Never -> String)
    -> List (ApiRoute ApiRoute.Response)
routes getStaticRoutes htmlToString =
    [ Site.manifest |> Manifest.generator Site.config.canonicalUrl
    , sitemap getStaticRoutes |> ApiRoute.withGlobalHeadTags Site.head
    ]


sitemap getStaticRoutes =
    let
        routeToEntry route =
            case route of
                Route.SPLAT__ routeParams ->
                    DataSource.MarkdownElmUi.routeAsLoadedPageAndThen routeParams
                        (\path d ->
                            BackendTask.succeed ( path, d, route )
                        )
    in
    ApiRoute.succeed
        (getStaticRoutes
            |> BackendTask.andThen
                (\allRoutes ->
                    allRoutes
                        |> List.map routeToEntry
                        |> BackendTask.succeed
                        |> BackendTask.resolve
                        |> BackendTask.map
                            (\pages ->
                                let
                                    entries =
                                        pages
                                            |> List.filter
                                                (\( path, d, route ) ->
                                                    d.meta.published
                                                )
                                            |> List.map
                                                (\( path, d, route ) ->
                                                    { path = Route.routeToPath route |> String.join "/"
                                                    , lastMod = Nothing
                                                    }
                                                )
                                in
                                Sitemap.build { siteUrl = "https://elmcraft.org" } entries
                            )
                )
        )
        |> ApiRoute.literal "sitemap.xml"
        |> ApiRoute.single
