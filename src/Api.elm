module Api exposing (routes)

import ApiRoute
import DataSource exposing (DataSource)
import DataSource.MarkdownElmUi
import Element
import Html exposing (Html)
import Route exposing (Route)
import Sitemap


routes :
    DataSource (List Route)
    -> (Html Never -> String)
    -> List (ApiRoute.ApiRoute ApiRoute.Response)
routes getStaticRoutes htmlToString =
    let
        routeToEntry route =
            case route of
                Route.SPLAT__ routeParams ->
                    DataSource.MarkdownElmUi.routeAsLoadedPageAndThen routeParams
                        (\path d ->
                            DataSource.succeed ( path, d, route )
                        )

                Route.NotFound ->
                    let
                        meta =
                            { title = "Not found"
                            , description = "Page not found"
                            , published = True
                            , status = Nothing
                            , route = route
                            , authors = []
                            , editors = []
                            }
                    in
                    DataSource.succeed
                        ( "/not-found"
                        , { ui = \model gdata -> [ Element.text "unused" ], meta = meta, markdown = "" }
                        , route
                        )
    in
    [ ApiRoute.succeed
        (getStaticRoutes
            |> DataSource.andThen
                (\allRoutes ->
                    allRoutes
                        |> List.map routeToEntry
                        |> DataSource.succeed
                        |> DataSource.resolve
                        |> DataSource.map
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
                                { body = Sitemap.build { siteUrl = "https://elmcraft.org" } entries }
                            )
                )
        )
        |> ApiRoute.literal "sitemap.xml"
        |> ApiRoute.single
    ]
