module Pages.Homepage exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Pages
import Templates.Feature
import Templates.FindYourPath
import Templates.Footer
import Templates.UI exposing (..)


view model _ =
    column [ width fill ]
        [ column [ width fill, spacing 20 ]
            [ none

            -- , heading1 "World of Elmcraft"
            , heading2 [] "A place for all things Elm"
            , paragraph [] [ text "Welcome! We're just getting started here." ]
            , spacer 20
            , column
                [ width fill, spacing 20 ]
                [ heading2 [] "Elm ❤️'s"
                , linkHover [] "Elm ❤️ Engineering" "/elm-loves/engineering"
                , linkHover [] "Elm ❤️ Testing" "/elm-loves/testing"
                , linkHover [] "Elm ❤️ Humans" "/elm-loves/humans"
                , linkHover [] "Elm ❤️ Community" "/elm-loves/community"
                ]
            ]
        ]


view_old model _ =
    column [ width fill ]
        [ column [ width fill, spacing 20 ]
            [ none

            -- , heading1 "World of Elmcraft"
            , heading2 [] "A place for all things Elm"
            , paragraph [] [ text "Welcome! We're just getting started here. Something missing? Got ideas? ", pageHover [] "Discuss them with us!" Pages.pages.discuss ]
            , spacer 20
            , column
                [ width fill, spacing 20 ]
                [ heading2 [] "What's new"
                , column
                    [ width fill, spacing 20 ]
                    [ row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "News", paragraph [] [ text "2021-02-03 - An update from Evan" ] ]
                    , row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "Package", paragraph [] [ text "2021-02-02 - BrianHicks/elm-csv 3.0.1 is out! For maximum boredom, it can now encode CSVs as well as decoding them." ] ]
                    , row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "News", paragraph [] [ text "2021-02-01 - Arrival has hired @unsoundscapes to expand their use of Elm for 3D intensive UIs!" ] ]
                    ]
                ]
            , spacer 20
            , column
                [ width fill, spacing 20 ]
                [ heading2 [] "Spotlight"
                , column
                    [ width fill, spacing 20 ]
                    [ row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "Tooling", paragraph [] [ text "This month we're looking at Elm Language Server, and the incredible work being put in to make the Elm IDE experience a dream!" ] ]
                    ]
                ]
            , spacer 20
            , Templates.FindYourPath.view model
            , spacer 20
            , column [ Border.width 1, Border.color elmTeal, padding 20, Border.rounded 10, width fill, spacing 20 ]
                [ paragraph [ Font.center, Font.size 18, Font.bold ] [ text "Is Elm for me?" ]
                , paragraph [ Font.center ] [ text "A short quiz to find answers about the parts of Elm that matter to you." ]
                , buttonLinkSmall [ centerX ] "/quiz/is-elm-for-me" "Take the Quiz"
                ]
            ]
        ]
