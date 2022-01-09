module Api exposing (routes)

import ApiRoute
import DataSource exposing (DataSource)
import DataSource.Markdown
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
                    DataSource.Markdown.routeAsLoadedPageAndThen routeParams
                        (\path d ->
                            DataSource.succeed ( path, d, route )
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
