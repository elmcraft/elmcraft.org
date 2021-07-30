module Theme exposing (..)

import Colors exposing (..)
import DateFormat
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html exposing (Html)
import Route
import Templates.Footer
import Templates.Layout
import Templates.Navigation
import Templates.UI exposing (..)
import Time
import Timestamps
import Types
import View exposing (..)


view : a -> (Types.Msg -> wrapperMsg) -> Types.Model -> View.View wrapperMsg -> Html wrapperMsg
view x toWrapperMsg model static =
    layout
        [ width fill
        , Font.size 18
        , Font.family [ Font.typeface Templates.Layout.fontFace ]
        , Font.color charcoal
        , width fill
        ]
    <|
        column
            [ width fill
            , spacing 20
            ]
            [ Templates.Navigation.navigation model static.route
                |> Element.map toWrapperMsg

            -- , el [ width fill ] <| html <| Html.pre [] [ Html.text <| Debug.toString x ]
            , if static.route == Route.SPLAT__ { splat = [] } then
                none

              else
                standardCenteredSectionAdaptiveAt
                    Templates.Layout.maxWidth
                    model
                    white
                    []
                    [ heading1 static.title
                    , el [ Background.color grey, width fill, height (px 2) ] none
                    , let
                        statusToString status =
                            case status of
                                Budding ->
                                    "Seedling 🌱"

                                Seedling ->
                                    "Budding \u{1FAB4}"

                                Evergreen ->
                                    "Evergreen 🌳"
                      in
                      case static.status of
                        Just status ->
                            el [ paddingXY 0 10 ] <|
                                paragraph [ Font.color charcoalLight, Font.size 14 ] <|
                                    [ el [ Font.color <| fromHex "#98B68F" ] <| text <| statusToString status
                                    , text <| " Planted " ++ format static.timestamps.created ++ " - Last tended " ++ format static.timestamps.updated
                                    ]

                        Nothing ->
                            -- For now, if we don't have a status, don't show dates either (covers us for pages like indexes where it's a bit odd?)
                            -- [ text <| "Planted " ++ format static.timestamps.created ++ " - Last tended " ++ format static.timestamps.updated ]
                            none
                    ]
                    |> Element.map toWrapperMsg
            , standardCenteredSection
                model
                white
                [ Region.mainContent ]
                static.content
            , Templates.Footer.view model
                |> Element.map toWrapperMsg
            ]


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
