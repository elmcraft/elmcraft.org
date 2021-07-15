module Theme exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html exposing (Html)
import Route
import Templates.Footer
import Templates.Layout
import Templates.Navigation
import Templates.UI exposing (..)
import Types
import View


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
