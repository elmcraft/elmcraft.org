module Theme exposing (..)

import Colors exposing (..)
import DataSource.Meta exposing (..)
import DateFormat
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html exposing (Html)
import Html.Attributes as Html
import Icon
import Route
import Theme.Footer
import Theme.Layout
import Theme.Navigation
import Theme.Tooltip
import Theme.UI exposing (..)
import Time
import Timestamps
import Types
import View exposing (..)


view : { a | isDev : Bool } -> (Types.Msg -> wrapperMsg) -> Types.Model -> View.View wrapperMsg -> Html wrapperMsg
view global toWrapperMsg model static =
    layout
        [ width fill
        , Font.size 17
        , Font.color charcoal
        , Font.family [ Font.typeface "Inter var" ]
        , width fill
        ]
    <|
        column [ width fill ]
            [ fontPreload
            , manualCss
            , column
                [ width fill
                , spacing 20
                ]
                [ Theme.Navigation.navigation model static.route
                    |> Element.map toWrapperMsg

                -- , el [ width fill ] <| html <| Html.pre [] [ Html.text <| Debug.toString x ]
                , if static.route == Route.SPLAT__ { splat = [] } then
                    none

                  else
                    standardCenteredSectionAdaptiveAt
                        Theme.Layout.maxWidth
                        model
                        white
                        []
                        [ heading1 static.title
                        , el [ Background.color grey, width fill, height (px 2) ] none
                        , let
                            statusToString status =
                                case status of
                                    Seedling ->
                                        "Seedling 🌱"

                                    Budding ->
                                        "Budding 🪴"

                                    Evergreen ->
                                        "Evergreen 🌳"

                            contributorCircle contribution color name =
                                let
                                    tooltipWidth =
                                        160

                                    githubUsername =
                                        name |> String.replace "@" ""
                                in
                                link
                                    [ Border.rounded 30
                                    , Border.width 3
                                    , Border.color color
                                    , Font.color white
                                    , width (px 36)
                                    , height (px 36)
                                    , Theme.Tooltip.add
                                        { hitboxSize = 30
                                        , el =
                                            el
                                                [ Background.color color
                                                , paddingXY 4 8
                                                , Border.rounded 5
                                                , width (px tooltipWidth)
                                                , moveLeft (tooltipWidth - 30 - 10)
                                                , Font.center
                                                , alignRight
                                                , moveUp 34
                                                , inFront <|
                                                    el
                                                        [ class "triangle-down"
                                                        , moveRight (tooltipWidth - 30)
                                                        , moveDown 30
                                                        , Border.color color
                                                        ]
                                                        none
                                                ]
                                                (text <| Theme.UI.titleCase contribution ++ ": " ++ name)
                                        }
                                    ]
                                    { url = "https://github.com/" ++ githubUsername
                                    , label =
                                        image
                                            [ width (px 30)
                                            , height (px 30)
                                            , Border.rounded 30
                                            , clip
                                            ]
                                            { src = "https://github.com/" ++ githubUsername ++ ".png?size=200", description = name ++ "'s Github profile pic" }
                                    }
                          in
                          case static.status of
                            Just status ->
                                row [ width fill ]
                                    [ el [ paddingXY 0 10, width fill ] <|
                                        paragraph [ Font.color charcoalLight, Font.size 14 ] <|
                                            [ prefetchLink [ Font.color <| fromHex "#98B68F" ] { url = "/about/markers", label = text <| statusToString status }
                                            , text <| " Planted " ++ format static.timestamps.created ++ " - Last tended " ++ format static.timestamps.updated
                                            , Theme.UI.externalLink_ [ paddingXY 10 0 ] (Icon.editSmall []) ("https://github.com/elmcraft/elmcraft.org/edit/main/" ++ static.meta.markdownPath)
                                            , row [ alignRight, spacing 5 ]
                                                ((static.meta.authors |> List.map (contributorCircle "author" purple))
                                                    ++ (static.meta.editors |> List.map (contributorCircle "editor" charcoal))
                                                )
                                            ]
                                    , if not static.published && global.isDev then
                                        el [ Background.color elmcraftNude, padding 4, Border.rounded 5, Font.size 12 ] <| text "not published"

                                      else
                                        none
                                    ]

                            Nothing ->
                                -- For now, if we don't have a status, don't show dates either (covers us for pages like indexes where it's a bit odd?)
                                none
                        ]
                        |> Element.map toWrapperMsg
                , standardCenteredSection
                    model
                    white
                    [ Region.mainContent ]
                    static.content
                , Theme.Footer.view model
                    |> Element.map toWrapperMsg
                ]
            ]


manualCss =
    html <|
        Html.node "style"
            []
            [ Html.text <|
                """
            @font-face {
              font-family: "Inter var";
              src: url("/fonts/inter-var.woff2") format('woff2');
              font-weight: 100 1000;
            }

            html, body { font-family: 'Inter var', system-ui, sans-serif; width: 100%; }

            .eslint-sticky {
                position: relative;
            }
            /* hack but it'll have to do for now...! */
            .eslint-sticky > :nth-child(1),
            .eslint-sticky > :nth-child(2),
            .eslint-sticky > :nth-child(3) {
                position: sticky;
                top: 0;
                z-index: 100;
            }


            """
            ]


fontPreload : Element msg
fontPreload =
    Html.node "link"
        [ Html.attribute "rel" "preload"
        , Html.attribute "href" "/fonts/inter-var.woff2"
        , Html.attribute "as" "font"
        , Html.attribute "type" "font/woff2"
        , Html.attribute "crossorigin" ""
        ]
        []
        |> html


format : Time.Posix -> String
format posix =
    DateFormat.format
        [ DateFormat.monthNameAbbreviated
        , DateFormat.text " "
        , DateFormat.dayOfMonthNumber
        , DateFormat.text ", "
        , DateFormat.yearNumber
        ]
        Time.utc
        posix
