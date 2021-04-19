module Templates.CuratedBy exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import MarkdownPlain
import Pages
import Templates.UI exposing (..)


view model authors_ =
    let
        authors =
            authors_
                |> String.split ","
                |> List.map String.trim
    in
    column [ alignRight, spacing 5 ]
        [ authors
            |> List.map
                (\author ->
                    el
                        [ width (px 50)
                        , height (px 50)
                        , Background.color grey
                        , Border.rounded 50
                        , Border.width 3
                        , Border.color charcoal
                        ]
                        (author |> String.left 1 |> String.toUpper |> text |> el [ centerX, centerY ])
                )
            |> row [ spacing -15, alignRight ]
        , row
            [ width fill
            , spacing 20
            , Font.size 11
            ]
            [ text <| "Curated by " ++ (authors |> List.map titleCase |> String.join ", ") ]
        ]


titleCase s =
    (s |> String.left 1 |> String.toUpper) ++ String.dropLeft 1 s
