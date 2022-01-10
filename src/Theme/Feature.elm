module Theme.Feature exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes
import Theme.UI exposing (..)
import Types exposing (Model)


leftRaw model src bordered children =
    let
        imageCol =
            column [ width fill ]
                [ el
                    [ centerX
                    , if bordered then
                        class "circleGreyBottomRightLower"

                      else
                        class "circleGreyBottomRight"
                    ]
                  <|
                    image
                        [ width (fill |> maximum 600)
                        , centerX
                        , if bordered then
                            blueBorderBottomRight

                          else
                            attrNone
                        ]
                        { src = src, description = imageDescription }
                ]

        imageDescription =
            src
                |> String.replace "-" " "
                |> String.replace ".png" ""
                |> String.replace ".jpg" ""
                |> String.replace "/images/pictures/" ""

        contentCol =
            column [ width fill, spacing 20 ] children
    in
    standardCenteredSection model
        transparent_
        []
        [ if model.window.width > 1000 then
            row [ width fill, height (shrink |> minimum 535), paddingXY 0 80, spacing 50 ]
                [ contentCol, imageCol ]

          else
            column [ width fill, paddingXY 0 40, spacing 50 ] [ contentCol, imageCol ]
        ]


rightRaw model src bordered children =
    let
        imageCol =
            column [ width fill ]
                [ el
                    [ centerX
                    , if bordered then
                        class "circleGreyBottomLeftLower"

                      else
                        class "circleGreyBottomLeft"
                    ]
                  <|
                    image
                        [ width (fill |> maximum 600)
                        , centerX
                        , if bordered then
                            blueBorderBottomRight

                          else
                            attrNone
                        ]
                        { src = src, description = imageDescription }
                ]

        imageDescription =
            src
                |> String.replace "-" " "
                |> String.replace ".png" ""
                |> String.replace ".jpg" ""
                |> String.replace "/images/pictures/" ""

        contentCol =
            column [ width fill, spacing 20 ] children
    in
    standardCenteredSection model
        transparent_
        []
        [ if model.window.width > 1000 then
            row [ width fill, height (shrink |> minimum 535), paddingXY 0 80, spacing 50 ]
                [ imageCol, contentCol ]

          else
            column [ width fill, paddingXY 0 40, spacing 50 ] [ contentCol, imageCol ]
        ]
