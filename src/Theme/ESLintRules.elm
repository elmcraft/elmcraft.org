module Theme.ESLintRules exposing (..)

import DataStatic.ESLintRules exposing (EslintRule)
import Element exposing (..)
import MarkdownPlain
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
                        MarkdownPlain.fromString (viewAdvice rule.elmAdvice)
              }
            ]
        }


viewAdvice : DataStatic.ESLintRules.Advice -> String
viewAdvice advice =
    case advice of
        DataStatic.ESLintRules.NotPartOfTheLanguage missingFeature ->
            viewMissingFeature missingFeature

        DataStatic.ESLintRules.CompilerError string ->
            string

        DataStatic.ESLintRules.SyntaxError ->
            "This would be a syntax error in Elm."

        DataStatic.ESLintRules.HandledByElmFormat ->
            "This is automatically handled by elm-format."

        DataStatic.ESLintRules.EnforcedByLanguageDesign languageDesign ->
            viewLanguageDesign languageDesign

        DataStatic.ESLintRules.HasCorrespondingRules rules ->
            String.join "\n"
                ("There are corresponding rules for this:"
                    :: List.map (\rule -> "- " ++ rule) rules
                )

        DataStatic.ESLintRules.PotentialIdea string ->
            String.trimRight ("This could potentially be added as an `elm-review` rule." ++ string)


viewLanguageDesign : DataStatic.ESLintRules.LanguageDesign -> String
viewLanguageDesign languageDesign =
    case languageDesign of
        DataStatic.ESLintRules.NoMutation ->
            "Elm doesn't support mutating values."

        DataStatic.ESLintRules.FunctionsAlwaysReturnValues ->
            "Elm functions always return values, there is no optional `return` statement."

        DataStatic.ESLintRules.NoVariableNumberOfArguments ->
            "Each Elm function has a fixed number of parameters and takes a fixed number of arguments when called."

        DataStatic.ESLintRules.NoShadowing ->
            "Elm forbids name shadowing."

        DataStatic.ESLintRules.EverythingIsAnExpression_NoStatements ->
            "All Elm expressions are expressions, and there are no individual statements."

        DataStatic.ESLintRules.TypeChecking string ->
            string

        DataStatic.ESLintRules.ExhaustivePatternMatching ->
            "This would be handled using Elm's pattern matching syntax, which makes sure that all cases are handled."

        DataStatic.ESLintRules.CantExtendTypes ->
            "Elm doesn't allow you to extend existing types."

        DataStatic.ESLintRules.NoCoercion ->
            "There is no syntax for coercion. Elm requires explicit type conversions."

        DataStatic.ESLintRules.CustomRationale string ->
            string


viewMissingFeature : DataStatic.ESLintRules.MissingFeature -> String
viewMissingFeature missingFeature =
    case missingFeature of
        DataStatic.ESLintRules.Classes ->
            "There are no classes in Elm."

        DataStatic.ESLintRules.Prototypes ->
            "There are no prototypes in Elm."

        DataStatic.ESLintRules.This ->
            "There are no concept of `this` in Elm."

        DataStatic.ESLintRules.Loops ->
            "There are no loops in Elm."

        DataStatic.ESLintRules.AsyncAwait ->
            "There are no async/await syntax in Elm."

        DataStatic.ESLintRules.Generators ->
            "There are no generators in Elm."

        DataStatic.ESLintRules.Exceptions ->
            "There are no exceptions in Elm."

        DataStatic.ESLintRules.GetterSetters ->
            "There are no getters or setters in Elm."

        DataStatic.ESLintRules.DynamicProperties ->
            "There are no dynamic or computed properties in Elm."

        DataStatic.ESLintRules.TemplateLiterals ->
            "There are no template literals in Elm."

        DataStatic.ESLintRules.NullOrUndefined ->
            "There is no `null` or `undefined` in Elm."

        DataStatic.ESLintRules.OctalOrBinary ->
            "There is no syntax for literal octal or binary in Elm."

        DataStatic.ESLintRules.Eval ->
            "There is no `eval` function in Elm."

        DataStatic.ESLintRules.FunctionsDontExist ->
            "These functions don't exist in Elm."

        DataStatic.ESLintRules.Symbol ->
            "There are no symbols in Elm."

        DataStatic.ESLintRules.Labels ->
            "There are no labels in Elm."

        DataStatic.ESLintRules.Jsx ->
            "There is no support for a JSX-like syntax in Elm."

        DataStatic.ESLintRules.SpecialSupportForRegex ->
            "There is no special support for regular expressions in Elm."

        DataStatic.ESLintRules.CustomFeatureDescription string ->
            string
