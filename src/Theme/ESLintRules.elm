module Theme.ESLintRules exposing (..)

import DataStatic.ESLintRules
import Element exposing (..)
import Element.Font as Font
import MarkdownPlain
import Pages
import Theme.UI exposing (..)


view model =
    DataStatic.ESLintRules.all
        |> List.map showRuleSection
            column
            [ width fill, spacing 20 ]


showRuleSection section =
    column [ width fill ]
        [ heading3 [] section.name
        , paragraph [] [ text section.description ]
        , List.map section.rules |> showRule |> column [ width fill ]
        , Element.table [ width fill ]
            { data = section.rules
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
        ]
