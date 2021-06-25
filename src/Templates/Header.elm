module Templates.Header exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Templates.UI exposing (..)


view model src description content =
    standardCenteredSectionColumns model
        charcoal
        [ paddingEach { top = 60, right = 0, bottom = 60, left = 0 } ]
        [ column [ width fill, spacing 20 ] content
        , column [ width fill, padding 10 ]
            [ image
                [ width (fill |> maximum 600)
                , blueBorderTopLeft
                , if model.window.width < 1000 then
                    centerX

                  else
                    alignRight
                ]
                { src = src, description = description }
            ]
        ]
