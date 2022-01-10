module Theme.Testimonial exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


view model name pic children =
    column [ width fill, spacing 20, height fill ]
        [ column [ width fill, Font.center ] children
        , column [ width fill, spacing 10 ]
            [ el
                [ Font.center
                , Background.color grey
                , Border.rounded 100
                , width (px 70)
                , height (px 70)
                , centerX
                ]
              <|
                el [ centerY, centerX ] (text "pic")
            , paragraph [ Font.center ] [ text name ]
            ]
        ]
