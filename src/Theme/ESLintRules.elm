module Theme.ESLintRules exposing (view)

import Colors exposing (..)
import DataStatic.ESLintRules exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font exposing (Font)
import List.Extra as List
import MarkdownPlain
import Theme.UI exposing (..)
import Types exposing (..)


view : Model -> Element Msg
view model =
    let
        ruleGroups : List { name : String, description : String, rules : List EslintRule }
        ruleGroups =
            DataStatic.ESLintRules.rules
                |> List.map (\ruleGroup -> { ruleGroup | rules = ruleGroup.rules |> filterRecommended model })

        allRules : List EslintRule
        allRules =
            List.concatMap (.rules >> filterRecommended model) rules

        ( pointlessRules, applicableRules ) =
            List.partition isPointlessInElm allRules

        ruleCountText : String
        ruleCountText =
            if model.appliedEslintRecommendedFilter then
                " _recommended_"

            else
                ""

        percentOfTotal x =
            percentOfTotal_ (List.length x)

        percentOfTotal_ x =
            String.fromInt (round ((toFloat x / toFloat (List.length applicableRules + List.length pointlessRules)) * 100)) ++ "%"
    in
    column [ width fill, spacing 20 ]
        [ paragraph []
            [ MarkdownPlain.fromString <|
                "**"
                    ++ String.fromInt (List.length pointlessRules)
                    ++ "/"
                    ++ String.fromInt (List.length allRules)
                    ++ " ("
                    ++ percentOfTotal pointlessRules
                    ++ ") of the "
                    ++ ruleCountText
                    ++ " core ESLint rules _aren't necessary_ in Elm**:"
            ]
        , buttonSecondary []
            EslintToggleRecommendedFilter
            (if model.appliedEslintRecommendedFilter then
                "Show all ESLint rules"

             else
                "Show only recommended ESLint rules"
            )
        , summarise pointlessRules
            model.appliedEslintFilter
            percentOfTotal_
            [ ( filterEnforcedByLanguageDesign, "are rules are already enforced by either Elm's design, or the compiler." )
            , ( filterHandledByElmFormat, "are related to code style issues handled by elm-format." )
            , ( filterNotPartOfTheLanguage, "relate to features or problems that are not part of the Elm language." )
            ]
        , paragraph [] [ text <| "That leaves " ++ String.fromInt (List.length applicableRules) ++ " (" ++ percentOfTotal applicableRules ++ ") static analysis rules applicable in Elm, of which:" ]
        , summarise applicableRules
            model.appliedEslintFilter
            percentOfTotal_
            [ ( filterHasCorrespondingRules, "exist in elm-review already." )
            , ( filterPotentialIdea, "are ideas for elm-format." )
            , ( filterNoEquivalent, "could be expressed, but are probably bad ideas in Elm." )
            ]
        , ruleGroups
            |> List.map (filterRuleGroup model)
            |> List.map (showRuleSection percentOfTotal)
            |> column [ width fill, spacing 20 ]
        ]


filterRecommended : Model -> List EslintRule -> List EslintRule
filterRecommended model rules =
    if model.appliedEslintRecommendedFilter then
        List.filter .recommended rules

    else
        rules


filterRuleGroup model ruleGroup =
    case model.appliedEslintFilter of
        Just advice ->
            let
                adviceFilter : DataStatic.ESLintRules.Advice -> Bool
                adviceFilter =
                    filterByAdvice advice
            in
            { ruleGroup
                | rules =
                    ruleGroup.rules
                        |> List.filter (.elmAdvice >> adviceFilter)
                        |> filterRecommended model
            }

        Nothing ->
            ruleGroup


summarise rules appliedEslintFilter percentOfTotal filters =
    let
        advices =
            rules |> List.map .elmAdvice
    in
    filters
        |> List.filterMap
            (\( filter, label ) ->
                let
                    candidates =
                        advices |> List.filter filter

                    count =
                        candidates |> List.length
                in
                if count == 0 then
                    Nothing

                else
                    let
                        ( buttonLabel, borderColor, fontColor ) =
                            case candidates |> List.head of
                                Just candidate ->
                                    case appliedEslintFilter of
                                        Just appliedFilter ->
                                            if filterByAdvice candidate appliedFilter then
                                                ( "Clear", adviceColor candidate, Font.color charcoal )

                                            else
                                                ( "Focus", transparent_, Font.color greyDark )

                                        Nothing ->
                                            ( "Focus", adviceColor candidate, Font.color charcoal )

                                Nothing ->
                                    ( "Focus", transparent_, Font.color greyDark )

                        filterCategory =
                            case candidates |> List.head of
                                Just advice ->
                                    onClick (EslintToggleCategoryFilter advice)

                                Nothing ->
                                    attrNone

                        pill =
                            el
                                [ width (px 10)
                                , height fill
                                , Background.color borderColor
                                , Border.rounded 10
                                , moveUp 1
                                ]
                                none
                    in
                    Just <|
                        row
                            [ width fill ]
                            [ pill
                            , paragraph
                                [ Border.rounded 10, Border.color borderColor, padding 10, filterCategory, pointer, fontColor ]
                                [ buttonSecondaryPlain
                                    [ paddingXY 5 3
                                    , alignRight
                                    , Font.color charcoal
                                    , Border.color charcoal
                                    ]
                                    Noop
                                    buttonLabel
                                , text " "
                                , text <| String.fromInt count ++ " (" ++ percentOfTotal count ++ ") " ++ label
                                ]
                            ]
            )
        |> column [ width fill, spacing 2 ]


showRuleSection : (List EslintRule -> String) -> { name : String, description : String, rules : List EslintRule } -> Element msg
showRuleSection percentOfTotal section =
    column [ width fill, spacing 10 ]
        [ heading3 [] (section.name ++ " - " ++ String.fromInt (List.length section.rules) ++ " (" ++ percentOfTotal section.rules ++ ")")
        , paragraph [] [ text <| section.description ]
        , viewRules section.rules
        ]


viewRules : List EslintRule -> Element msg
viewRules rules =
    Element.table [ width fill, class "eslint-sticky", spacing 1 ]
        { data = rules
        , columns =
            [ { header = el [ width fill, padding 10, Background.color grey ] <| paragraph [] [ text "ESLint rule" ]
              , width = fill
              , view = \rule -> el [ padding 10 ] <| paragraph [] (viewRuleName rule)
              }
            , { header = el [ width fill, padding 10, Background.color grey ] <| paragraph [] [ text "Description" ]
              , width = fill
              , view = \rule -> el [ padding 10 ] <| paragraph [] [ text rule.eslintDescription ]
              }
            , { header = el [ width fill, padding 10, Background.color grey ] <| paragraph [] [ text "Elm advice" ]
              , width = fill
              , view = \rule -> viewAdvice rule.elmAdvice
              }
            ]
        }


viewRuleName : EslintRule -> List (Element msg)
viewRuleName rule =
    if rule.recommended then
        [ link [ Font.bold ]
            { url = "https://eslint.org/docs/latest/rules/" ++ rule.eslintName
            , label = text rule.eslintName
            }
        , text " (recommended)"
        ]

    else
        [ text rule.eslintName ]



-- adviceColor : DataStatic.ESLintRules.Advice -> Attribute msg


adviceColor advice =
    case advice of
        DataStatic.ESLintRules.NotPartOfTheLanguage missingFeature ->
            fromHex <| eslintCompareColors.purple

        DataStatic.ESLintRules.HandledByElmFormat ->
            fromHex <| eslintCompareColors.secondGreen

        DataStatic.ESLintRules.EnforcedByLanguageDesign languageDesign ->
            fromHex <| eslintCompareColors.green

        DataStatic.ESLintRules.HasCorrespondingRules rules ->
            fromHex <| eslintCompareColors.blue

        DataStatic.ESLintRules.PotentialIdeaForElmFormat string ->
            fromHex <| eslintCompareColors.amber

        DataStatic.ESLintRules.NoEquivalent ->
            fromHex <| eslintCompareColors.red


border =
    Border.widthEach { bottom = 0, left = 10, top = 0, right = 0 }


viewAdvice : DataStatic.ESLintRules.Advice -> Element msg
viewAdvice advice =
    let
        addPill x =
            row [ width fill, height fill ]
                [ el
                    [ width (px 10)
                    , height fill
                    , Background.color (adviceColor advice)
                    , Border.rounded 10
                    , moveUp 1
                    ]
                    none
                , x
                ]
    in
    case advice of
        DataStatic.ESLintRules.NotPartOfTheLanguage missingFeature ->
            addPill <| el [ width fill, height fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString <| viewMissingFeature missingFeature ]

        DataStatic.ESLintRules.HandledByElmFormat ->
            addPill <| el [ width fill, height fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString "\u{1FA84} This is automatically handled by elm-format." ]

        DataStatic.ESLintRules.EnforcedByLanguageDesign languageDesign ->
            addPill <| el [ width fill, height fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString <| viewLanguageDesign languageDesign ]

        DataStatic.ESLintRules.HasCorrespondingRules rules ->
            addPill <|
                el [ width fill, height fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <|
                    paragraph []
                        [ MarkdownPlain.fromString <|
                            String.join "\n"
                                ("There are corresponding elm-review rules for this:"
                                    :: List.map (\rule -> "- " ++ rule) rules
                                )
                        ]

        DataStatic.ESLintRules.PotentialIdeaForElmFormat string ->
            addPill <| el [ width fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString string ]

        DataStatic.ESLintRules.NoEquivalent ->
            addPill <| el [ width fill, padding 10, Border.rounded 10, Border.color <| adviceColor advice ] <| paragraph [] [ MarkdownPlain.fromString "There is as of yet no equivalent to this rule in the Elm community." ]


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
