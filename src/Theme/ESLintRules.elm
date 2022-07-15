module Theme.ESLintRules exposing (view)

import Colors exposing (..)
import DataStatic.ESLintRules exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Events exposing (onClick)
import List.Extra as List
import MarkdownPlain
import Theme.UI exposing (..)
import Types exposing (..)


view : Model -> Element Msg
view model =
    column [ width fill, spacing 20 ]
        [ paragraph [] [ text <| "We've covered all " ++ String.fromInt (List.length DataStatic.ESLintRules.rulesUngrouped) ++ " core ESLint rules." ]
        , paragraph [] [ MarkdownPlain.fromString <| String.fromInt (List.length DataStatic.ESLintRules.rulesPointlessInElm) ++ " of these ESLint rules **aren't necessary** in Elm:" ]
        , summarise rulesUngrouped
            [ ( filterEnforcedByLanguageDesign, "rules are already enforced by either Elm's design, or the compiler." )
            , ( filterHandledByElmFormat, "are related to code style issues that are handled by Elm's de-facto formatter, elm-format." )
            , ( filterNotPartOfTheLanguage, "relate to features or probelms that are not part of the Elm language." )
            ]
        , paragraph [] [ text <| "That leaves " ++ String.fromInt (List.length DataStatic.ESLintRules.rulesUsefulInElm) ++ " static analysis rules that could make sense in Elm, of which:" ]
        , summarise rulesUngrouped
            [ ( filterHasCorrespondingRules, " are rules that exist in elm-review already." )
            , ( filterPotentialIdea, " are rules that could be expressed as elm-review rules." )
            , ( filterNoEquivalent, " are rules that could be expressed, but are probably bad ideas in Elm." )
            ]
        , DataStatic.ESLintRules.rules
            |> List.map (filterRuleGroup model)
            |> List.map showRuleSection
            |> column [ width fill, spacing 20 ]
        ]


filterRuleGroup model ruleGroup =
    case model.appliedEslintFilter of
        Just advice ->
            let
                adviceFileter : DataStatic.ESLintRules.Advice -> Bool
                adviceFileter =
                    filterByAdvice advice
            in
            { ruleGroup | rules = ruleGroup.rules |> List.filter (.elmAdvice >> adviceFileter) }

        Nothing ->
            ruleGroup


summarise rules filters =
    let
        advices =
            rules |> List.map .elmAdvice
    in
    filters
        |> List.map
            (\( filter, label ) ->
                let
                    candidates =
                        advices |> List.filter filter

                    count =
                        candidates |> List.length

                    bgColor =
                        candidates |> List.head |> Maybe.map adviceColor |> Maybe.withDefault (Background.color transparent_)

                    filterCategory =
                        case candidates |> List.head of
                            Just advice ->
                                onClick (EslintToggleCategoryFilter advice)

                            Nothing ->
                                attrNone
                in
                paragraph [ bgColor, padding 10, filterCategory, pointer ] [ text <| String.fromInt count ++ " " ++ label ]
            )
        |> column []


showRuleSection : { name : String, description : String, rules : List EslintRule } -> Element msg
showRuleSection section =
    column [ width fill, spacing 10 ]
        [ heading3 [] section.name
        , paragraph [] [ text section.description ]
        , viewRules section.rules
        ]


viewRules : List EslintRule -> Element msg
viewRules rules =
    Element.table [ width fill, class "eslint-sticky" ]
        { data = rules
        , columns =
            [ { header = el [ padding 10, Background.color grey ] <| paragraph [] [ text "ESLint rule" ]
              , width = fill
              , view = \rule -> el [ padding 10 ] <| paragraph [] [ text rule.eslintName ]
              }
            , { header = el [ padding 10, Background.color grey ] <| paragraph [] [ text "Description" ]
              , width = fill
              , view = \rule -> el [ padding 10 ] <| paragraph [] [ text rule.eslintDescription ]
              }
            , { header = el [ padding 10, Background.color grey ] <| paragraph [] [ text "Elm advice" ]
              , width = fill

              --   @TODO What uses markdown? Drop this handler lower if important...
              --   , view = \rule -> MarkdownPlain.fromString (viewAdvice rule.elmAdvice)
              , view = \rule -> viewAdvice rule.elmAdvice
              }
            ]
        }


adviceColor : DataStatic.ESLintRules.Advice -> Attribute msg
adviceColor advice =
    case advice of
        DataStatic.ESLintRules.NotPartOfTheLanguage missingFeature ->
            Background.color purpleLight

        DataStatic.ESLintRules.HandledByElmFormat ->
            Background.color green

        DataStatic.ESLintRules.EnforcedByLanguageDesign languageDesign ->
            Background.color green

        DataStatic.ESLintRules.HasCorrespondingRules rules ->
            Background.color elmTeal

        DataStatic.ESLintRules.PotentialIdea string ->
            Background.color yellow

        DataStatic.ESLintRules.NoEquivalent ->
            Background.color pinkDarker


viewAdvice : DataStatic.ESLintRules.Advice -> Element msg
viewAdvice advice =
    case advice of
        DataStatic.ESLintRules.NotPartOfTheLanguage missingFeature ->
            el [ height fill, padding 10, adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString <| viewMissingFeature missingFeature ]

        DataStatic.ESLintRules.HandledByElmFormat ->
            el [ height fill, padding 10, adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString "\u{1FA84} This is automatically handled by elm-format." ]

        DataStatic.ESLintRules.EnforcedByLanguageDesign languageDesign ->
            el [ height fill, padding 10, adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString <| viewLanguageDesign languageDesign ]

        DataStatic.ESLintRules.HasCorrespondingRules rules ->
            el [ height fill, padding 10, adviceColor advice ] <|
                paragraph []
                    [ MarkdownPlain.fromString <|
                        String.join "\n"
                            ("There are corresponding rules for this:"
                                :: List.map (\rule -> "- " ++ rule) rules
                            )
                    ]

        DataStatic.ESLintRules.PotentialIdea string ->
            el [ padding 10, adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString string ]

        DataStatic.ESLintRules.NoEquivalent ->
            el [ padding 10, adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString "There is as of yet no equivalent to this rule in the Elm community." ]


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

        DataStatic.ESLintRules.NoNullOrUndefined ->
            "There is no `null` or `undefined` in Elm."

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
            "There is no async/await syntax in Elm."

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
