module Theme.ESLintRules exposing (..)

import DataStatic.ESLintRules exposing (EslintRule)
import Element exposing (..)
import Element.Font as Font
import MarkdownPlain
import Pages
import Theme.UI exposing (..)


view =
    DataStatic.ESLintRules.all
        |> List.map showRuleSection
        |> column [ width fill, spacing 20 ]


showRuleSection : { a | name : String, description : String, rules : List EslintRule } -> Element msg
showRuleSection section =
    column [ width fill ]
        [ heading3 [] section.name
        , paragraph [] [ text section.description ]
        , viewRules section.rules
        ]


viewRules : List EslintRule -> Element msg
viewRules rules =
    Element.table [ width fill ]
        { data = rules
        , columns =
            [ { header = text "ESLint rule"
              , width = fill
              , view =
                    \rule ->
                        text rule.eslintName
              }
            , { header = text "Description"
              , width = fill
              , view =
                    \rule ->
                        text rule.eslintDescription
              }
            , { header = text "Elm advice"
              , width = fill
              , view =
                    \rule ->
                        text rule.elmAdvice
              }
            ]
        }
