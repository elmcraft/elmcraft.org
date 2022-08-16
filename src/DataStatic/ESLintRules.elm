module DataStatic.ESLintRules exposing (..)


type alias EslintRule =
    { eslintName : String
    , eslintDescription : String
    , elmAdvice : Advice
    , recommended : Bool
    , fixable : Bool
    , hasSuggestions : Bool
    }


rules : List { name : String, description : String, rules : List EslintRule }
rules =
    [ possibleProblems
    , suggestions
    , layoutAndFormatting
    ]


isPointlessInElm : EslintRule -> Bool
isPointlessInElm rule =
    case rule.elmAdvice of
        EnforcedByLanguageDesign _ ->
            True

        HandledByElmFormat ->
            True

        NotPartOfTheLanguage _ ->
            True

        _ ->
            False


filterEnforcedByLanguageDesign advice =
    case advice of
        EnforcedByLanguageDesign _ ->
            True

        _ ->
            False


filterNotPartOfTheLanguage advice =
    case advice of
        NotPartOfTheLanguage _ ->
            True

        _ ->
            False


filterHandledByElmFormat advice =
    case advice of
        HandledByElmFormat ->
            True

        _ ->
            False


filterHasCorrespondingRules advice =
    case advice of
        HasCorrespondingRules _ ->
            True

        _ ->
            False


filterPotentialIdea advice =
    case advice of
        PotentialIdeaForElmFormat _ ->
            True

        _ ->
            False


filterNoEquivalent advice =
    case advice of
        NoEquivalent ->
            True

        _ ->
            False


filterByAdvice advice =
    case advice of
        EnforcedByLanguageDesign _ ->
            filterEnforcedByLanguageDesign

        NotPartOfTheLanguage _ ->
            filterNotPartOfTheLanguage

        HandledByElmFormat ->
            filterHandledByElmFormat

        HasCorrespondingRules _ ->
            filterHasCorrespondingRules

        PotentialIdeaForElmFormat _ ->
            filterPotentialIdea

        NoEquivalent ->
            filterNoEquivalent


type Advice
    = EnforcedByLanguageDesign LanguageDesign
    | NotPartOfTheLanguage MissingFeature
    | HandledByElmFormat
    | HasCorrespondingRules (List String)
    | PotentialIdeaForElmFormat String
    | NoEquivalent


type LanguageDesign
    = NoMutation
    | FunctionsAlwaysReturnValues
    | NoVariableNumberOfArguments
    | NoShadowing
    | EverythingIsAnExpression_NoStatements
    | TypeChecking String
    | ExhaustivePatternMatching
    | CantExtendTypes
    | NoCoercion
    | NoNullOrUndefined
    | CustomRationale String


type MissingFeature
    = Classes
    | Prototypes
    | This
    | Loops
    | AsyncAwait
    | Generators
    | Exceptions
    | GetterSetters
    | DynamicProperties
    | TemplateLiterals
    | OctalOrBinary
    | Eval
    | FunctionsDontExist
    | Symbol
    | Labels
    | Jsx
    | SpecialSupportForRegex
    | CustomFeatureDescription String


possibleProblems : { name : String, description : String, rules : List EslintRule }
possibleProblems =
    { name = "Possible problems"
    , description = "These rules relate to possible logic errors in code:"
    , rules =
        [ { eslintName = "array-callback-return"
          , eslintDescription = "enforce `return` statements in callbacks of array methods"
          , elmAdvice = EnforcedByLanguageDesign FunctionsAlwaysReturnValues
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "constructor-super"
          , eslintDescription = "require `super()` calls in constructors"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "for-direction"
          , eslintDescription = "enforce \" for \" loop update clause moving the counter in the right direction."
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "getter-return"
          , eslintDescription = "enforce `return` statements in getters"
          , elmAdvice = EnforcedByLanguageDesign FunctionsAlwaysReturnValues
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-async-promise-executor"
          , eslintDescription = "disallow using an async function as a Promise executor"
          , elmAdvice = NotPartOfTheLanguage AsyncAwait
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-await-in-loop"
          , eslintDescription = "disallow `await` inside of loops"
          , elmAdvice = NotPartOfTheLanguage AsyncAwait
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-class-assign"
          , eslintDescription = "disallow reassigning class members"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-compare-neg-zero"
          , eslintDescription = "disallow comparing against -0"
          , elmAdvice = HandledByElmFormat
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-cond-assign"
          , eslintDescription = "disallow assignment operators in conditional expressions"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-const-assign"
          , eslintDescription = "disallow reassigning `const` variables"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-constant-condition"
          , eslintDescription = "disallow constant expressions in conditions"
          , elmAdvice = HasCorrespondingRules [ "[Simplify](https://package.elm-lang.org/packages/jfmengels/elm-review-simplify/latest/Simplify)" ]
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-constructor-return"
          , eslintDescription = "disallow returning value from constructor"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-control-regex"
          , eslintDescription = "disallow control characters in regular expressions"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-debugger"
          , eslintDescription = "disallow the use of `debugger`"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "The compiler will report the usages of debugging functions in optimized mode.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-dupe-args"
          , eslintDescription = "disallow duplicate arguments in `function` definitions"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-dupe-class-members"
          , eslintDescription = "disallow duplicate class members"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-dupe-else-if"
          , eslintDescription = "disallow duplicate conditions in if-else-if chains"
          , elmAdvice = HasCorrespondingRules [ "[Simplify](https://package.elm-lang.org/packages/jfmengels/elm-review-simplify/latest/Simplify)" ]
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-dupe-keys"
          , eslintDescription = "disallow duplicate keys in object literals"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "The compiler will report duplicate keys.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-duplicate-case"
          , eslintDescription = "disallow duplicate case labels"
          , elmAdvice = EnforcedByLanguageDesign ExhaustivePatternMatching
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-duplicate-imports"
          , eslintDescription = "disallow duplicate module imports"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-empty-character-class"
          , eslintDescription = "disallow empty character classes in regular expressions"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-empty-pattern"
          , eslintDescription = "disallow empty destructuring patterns"
          , elmAdvice =
                HasCorrespondingRules
                    [ "[NoUnused.Parameters](https://package.elm-lang.org/packages/jfmengels/elm-review-unused/latest/NoUnused-Parameters)"
                    , "[NoUnused.Patterns](https://package.elm-lang.org/packages/jfmengels/elm-review-unused/latest/NoUnused-Patterns)"
                    ]
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-ex-assign"
          , eslintDescription = "disallow reassigning exceptions in `catch` clauses"
          , elmAdvice = NotPartOfTheLanguage Exceptions
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-fallthrough"
          , eslintDescription = "disallow fallthrough of `case` statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-func-assign"
          , eslintDescription = "disallow reassigning `function` declarations"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-import-assign"
          , eslintDescription = "disallow assigning to imported bindings"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-inner-declarations"
          , eslintDescription = "disallow variable or `function` declarations in nested blocks"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "The underlying scoping problems don't apply to Elm.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-invalid-regexp"
          , eslintDescription = "disallow invalid regular expression strings in `RegExp` constructors"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-irregular-whitespace"
          , eslintDescription = "disallow irregular whitespace"
          , elmAdvice = HandledByElmFormat
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-loss-of-precision"
          , eslintDescription = "disallow literal numbers that lose precision"
          , elmAdvice = HandledByElmFormat
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-misleading-character-class"
          , eslintDescription = "disallow characters which are made with multiple code points in character class syntax"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-new-symbol"
          , eslintDescription = "disallow `new` operators with the `Symbol` object"
          , elmAdvice = NotPartOfTheLanguage Symbol
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-obj-calls"
          , eslintDescription = "disallow calling global object properties as functions"
          , elmAdvice = EnforcedByLanguageDesign (TypeChecking "Only functions are allowed to be called.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-promise-executor-return"
          , eslintDescription = "disallow returning values from Promise executor functions"
          , elmAdvice = NotPartOfTheLanguage FunctionsDontExist
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-prototype-builtins"
          , eslintDescription = "disallow calling some `Object.prototype` methods directly on objects"
          , elmAdvice = NotPartOfTheLanguage Prototypes
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-self-assign"
          , eslintDescription = "disallow assignments where both sides are exactly the same"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "The compiler will report variable definitions that depend on themselves, and there is no syntax for re-assigning variables.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-self-compare"
          , eslintDescription = "disallow comparisons where both sides are exactly the same"
          , elmAdvice = HasCorrespondingRules [ "[Simplify](https://package.elm-lang.org/packages/jfmengels/elm-review-simplify/latest/Simplify)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-setter-return"
          , eslintDescription = "disallow returning values from setters"
          , elmAdvice = NotPartOfTheLanguage GetterSetters
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-sparse-arrays"
          , eslintDescription = "disallow sparse arrays"
          , elmAdvice = EnforcedByLanguageDesign (TypeChecking "All elements in a List must be of the same type in Elm, you can't have empty elements in a list.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-template-curly-in-string"
          , eslintDescription = "disallow template literal placeholder syntax in regular strings"
          , elmAdvice = NotPartOfTheLanguage TemplateLiterals
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-this-before-super"
          , eslintDescription = "disallow `this`/`super` before calling `super()` in constructors"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-undef"
          , eslintDescription = "disallow the use of undeclared variables unless mentioned in `/*global */` comments"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Can't use variables not in scope.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unexpected-multiline"
          , eslintDescription = "disallow confusing multiline expressions"
          , elmAdvice = HandledByElmFormat
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unmodified-loop-condition"
          , eslintDescription = "disallow unmodified loop conditions"
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unreachable"
          , eslintDescription = "disallow unreachable code after `return`, `throw`, `continue`, and `break` statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unreachable-loop"
          , eslintDescription = "disallow loops with a body that allows only one iteration"
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unsafe-finally"
          , eslintDescription = "disallow control flow statements in `finally` blocks"
          , elmAdvice = NotPartOfTheLanguage Exceptions
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unsafe-negation"
          , eslintDescription = "disallow negating the left operand of relational operators"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no relational operators in Elm.")
          , recommended = True
          , fixable = False
          , hasSuggestions = True
          }
        , { eslintName = "no-unsafe-optional-chaining"
          , eslintDescription = "disallow use of optional chaining in contexts where the `undefined` value is not allowed"
          , elmAdvice = EnforcedByLanguageDesign NoNullOrUndefined
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unused-private-class-members"
          , eslintDescription = "disallow unused private class members"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unused-vars"
          , eslintDescription = "disallow unused variables"
          , elmAdvice = HasCorrespondingRules [ "[NoUnused.Variables](https://package.elm-lang.org/packages/jfmengels/elm-review-unused/latest/NoUnused-Variables)" ]
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-use-before-define"
          , eslintDescription = "disallow the use of variables before they are defined"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Elm allows using things before they are defined")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-backreference"
          , eslintDescription = "disallow useless backreferences in regular expressions"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "require-atomic-updates"
          , eslintDescription = "disallow assignments that can lead to race conditions due to usage of `await` or `yield`"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "use-isnan"
          , eslintDescription = "require calls to `isNaN()` when checking for `NaN`"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only a single function to check for `NaN`.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "valid-typeof"
          , eslintDescription = "enforce comparing `typeof` expressions against valid strings"
          , elmAdvice = EnforcedByLanguageDesign ExhaustivePatternMatching
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        ]
    }


suggestions : { name : String, description : String, rules : List EslintRule }
suggestions =
    { name = "Suggestions"
    , description = "These rules suggest alternate ways of doing things:"
    , rules =
        [ { eslintName = "accessor-pairs"
          , eslintDescription = "enforce getter and setter pairs in objects and classes"
          , elmAdvice = NotPartOfTheLanguage GetterSetters
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "arrow-body-style"
          , eslintDescription = "require braces around arrow function bodies"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "block-scoped-var"
          , eslintDescription = "enforce the use of variables within the scope they are defined"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Can't use variables not in scope.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "camelcase"
          , eslintDescription = "enforce camelcase naming convention"
          , elmAdvice = HasCorrespondingRules [ "[UseCamelCase](https://package.elm-lang.org/packages/sparksp/elm-review-camelcase/latest/UseCamelCase)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "capitalized-comments"
          , eslintDescription = "enforce or disallow capitalization of the first letter of a comment"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "class-methods-use-this"
          , eslintDescription = "enforce that class methods utilize `this`"
          , elmAdvice = NotPartOfTheLanguage This
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "complexity"
          , eslintDescription = "enforce a maximum cyclomatic complexity allowed in a program"
          , elmAdvice = HasCorrespondingRules [ "[CognitiveComplexity](https://package.elm-lang.org/packages/jfmengels/elm-review-cognitive-complexity/latest/CognitiveComplexity)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "consistent-return"
          , eslintDescription = "require `return` statements to either always or never specify values"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "consistent-this"
          , eslintDescription = "enforce consistent naming when capturing the current execution context"
          , elmAdvice = NotPartOfTheLanguage This
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "curly"
          , eslintDescription = "enforce consistent brace style for all control statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "default-case"
          , eslintDescription = "require `default` cases in `switch` statements"
          , elmAdvice = EnforcedByLanguageDesign ExhaustivePatternMatching
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "default-case-last"
          , eslintDescription = "enforce default clauses in switch statements to be last"
          , elmAdvice = EnforcedByLanguageDesign ExhaustivePatternMatching
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "default-param-last"
          , eslintDescription = "enforce default parameters to be last"
          , elmAdvice = EnforcedByLanguageDesign NoVariableNumberOfArguments
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "dot-notation"
          , eslintDescription = "enforce dot notation whenever possible"
          , elmAdvice = NotPartOfTheLanguage DynamicProperties
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "eqeqeq"
          , eslintDescription = "require the use of `===` and `!==`"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only one operator to check for equality.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "func-name-matching"
          , eslintDescription = "require function names to match the name of the variable or property to which they are assigned"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "func-names"
          , eslintDescription = "require or disallow named `function` expressions"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Anonymous functions can't have names.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "func-style"
          , eslintDescription = "enforce the consistent use of either `function` declarations or expressions"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only one way of defining functions.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "grouped-accessor-pairs"
          , eslintDescription = "require grouped accessor pairs in object literals and classes"
          , elmAdvice = NotPartOfTheLanguage GetterSetters
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "guard-for-in"
          , eslintDescription = "require `for-in` loops to include an `if` statement"
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "id-denylist"
          , eslintDescription = "disallow specified identifiers"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "id-length"
          , eslintDescription = "enforce minimum and maximum identifier lengths"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "id-match"
          , eslintDescription = "require identifiers to match a specified regular expression"
          , elmAdvice = HasCorrespondingRules [ "[UseCamelCase](https://package.elm-lang.org/packages/sparksp/elm-review-camelcase/latest/UseCamelCase)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "init-declarations"
          , eslintDescription = "require or disallow initialization in variable declarations"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "All values need to be initialized when they are declared.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-classes-per-file"
          , eslintDescription = "enforce a maximum number of classes per file"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-depth"
          , eslintDescription = "enforce a maximum depth that blocks can be nested"
          , elmAdvice = HasCorrespondingRules [ "[CognitiveComplexity](https://package.elm-lang.org/packages/jfmengels/elm-review-cognitive-complexity/latest/CognitiveComplexity)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-lines"
          , eslintDescription = "enforce a maximum number of lines per file"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-lines-per-function"
          , eslintDescription = "enforce a maximum number of lines of code in a function"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-nested-callbacks"
          , eslintDescription = "enforce a maximum depth that callbacks can be nested"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-params"
          , eslintDescription = "enforce a maximum number of parameters in function definitions"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-statements"
          , eslintDescription = "enforce a maximum number of statements allowed in function blocks"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "multiline-comment-style"
          , eslintDescription = "enforce a particular style for multiline comments"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "new-cap"
          , eslintDescription = "require constructor names to begin with a capital letter"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-alert"
          , eslintDescription = "disallow the use of `alert`, `confirm`, and `prompt`"
          , elmAdvice = NotPartOfTheLanguage FunctionsDontExist
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-array-constructor"
          , eslintDescription = "disallow `Array` constructors"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-bitwise"
          , eslintDescription = "disallow bitwise operators"
          , elmAdvice = EnforcedByLanguageDesign (TypeChecking "The underlying problem would result in a type error.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-caller"
          , eslintDescription = "disallow the use of `arguments.caller` or `arguments.callee`"
          , elmAdvice = NotPartOfTheLanguage FunctionsDontExist
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-case-declarations"
          , eslintDescription = "disallow lexical declarations in case clauses"
          , elmAdvice = EnforcedByLanguageDesign ExhaustivePatternMatching
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-confusing-arrow"
          , eslintDescription = "disallow arrow functions where they could be confused with comparisons"
          , elmAdvice = EnforcedByLanguageDesign (TypeChecking "This would be a type error.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-console"
          , eslintDescription = "disallow the use of `console`"
          , elmAdvice = NotPartOfTheLanguage FunctionsDontExist
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-continue"
          , eslintDescription = "disallow `continue` statements"
          , elmAdvice = NotPartOfTheLanguage Labels
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-delete-var"
          , eslintDescription = "disallow deleting variables"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no `delete` keyword.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-div-regex"
          , eslintDescription = "disallow division operators explicitly at the beginning of regular expressions"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-else-return"
          , eslintDescription = "disallow `else` blocks after `return` statements in `if` statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-empty"
          , eslintDescription = "disallow empty block statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-empty-function"
          , eslintDescription = "disallow empty functions"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-eq-null"
          , eslintDescription = "disallow `null` comparisons without type-checking operators"
          , elmAdvice = EnforcedByLanguageDesign NoNullOrUndefined
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-eval"
          , eslintDescription = "disallow the use of `eval()`"
          , elmAdvice = NotPartOfTheLanguage Eval
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-extend-native"
          , eslintDescription = "disallow extending native types"
          , elmAdvice = EnforcedByLanguageDesign CantExtendTypes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-extra-bind"
          , eslintDescription = "disallow unnecessary calls to `.bind()`"
          , elmAdvice = NotPartOfTheLanguage This
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-extra-boolean-cast"
          , eslintDescription = "disallow unnecessary boolean casts"
          , elmAdvice = HasCorrespondingRules [ "[Simplify](https://package.elm-lang.org/packages/jfmengels/elm-review-simplify/latest/Simplify)" ]
          , recommended = True
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-extra-label"
          , eslintDescription = "disallow unnecessary labels"
          , elmAdvice = NotPartOfTheLanguage Labels
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-extra-semi"
          , eslintDescription = "disallow unnecessary semicolons"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = True
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-floating-decimal"
          , eslintDescription = "disallow leading or trailing decimal points in numeric literals"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Floating numbers need to have numbers before the dot.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-global-assign"
          , eslintDescription = "disallow assignments to native objects or read-only global variables"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-implicit-coercion"
          , eslintDescription = "disallow shorthand type conversions"
          , elmAdvice = EnforcedByLanguageDesign NoCoercion
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-implicit-globals"
          , eslintDescription = "disallow declarations in the global scope"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Can't use variables not in scope.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-implied-eval"
          , eslintDescription = "disallow the use of `eval()`-like methods"
          , elmAdvice = NotPartOfTheLanguage Eval
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-inline-comments"
          , eslintDescription = "disallow inline comments after code"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-invalid-this"
          , eslintDescription = "disallow `this` keywords outside of classes or class-like objects"
          , elmAdvice = NotPartOfTheLanguage This
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-iterator"
          , eslintDescription = "disallow the use of the `__iterator__` property"
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-label-var"
          , eslintDescription = "disallow labels that share a name with a variable"
          , elmAdvice = NotPartOfTheLanguage Labels
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-labels"
          , eslintDescription = "disallow labeled statements"
          , elmAdvice = NotPartOfTheLanguage Labels
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-lone-blocks"
          , eslintDescription = "disallow unnecessary nested blocks"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-lonely-if"
          , eslintDescription = "disallow `if` statements as the only statement in `else` blocks"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Can't have a lonely `if` that doesn't have an `else`")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-loop-func"
          , eslintDescription = "disallow function declarations that contain unsafe references inside loop statements"
          , elmAdvice = NotPartOfTheLanguage Loops
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-magic-numbers"
          , eslintDescription = "disallow magic numbers"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-mixed-operators"
          , eslintDescription = "disallow mixed binary operators"
          , elmAdvice = PotentialIdeaForElmFormat "This is a proposal for [`elm-format`](https://github.com/avh4/elm-format/issues/375)."
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-multi-assign"
          , eslintDescription = "disallow use of chained assignment expressions"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Can't declare multiple variables at once.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-multi-str"
          , eslintDescription = "disallow multiline strings"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "This is not a valid way of writing strings in Elm.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-negated-condition"
          , eslintDescription = "disallow negated conditions"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-nested-ternary"
          , eslintDescription = "disallow nested ternary expressions"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no ternary operators, only if expressions which are more readable when nested.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-new"
          , eslintDescription = "disallow `new` operators outside of assignments or comparisons"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-new-func"
          , eslintDescription = "disallow `new` operators with the `Function` object"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-new-object"
          , eslintDescription = "disallow `Object` constructors"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-new-wrappers"
          , eslintDescription = "disallow `new` operators with the `String`, `Number`, and `Boolean` objects"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-nonoctal-decimal-escape"
          , eslintDescription = "disallow `\\8` and `\\9` escape sequences in string literals"
          , elmAdvice = NotPartOfTheLanguage OctalOrBinary
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-octal"
          , eslintDescription = "disallow octal literals"
          , elmAdvice = NotPartOfTheLanguage OctalOrBinary
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-octal-escape"
          , eslintDescription = "disallow octal escape sequences in string literals"
          , elmAdvice = NotPartOfTheLanguage OctalOrBinary
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-param-reassign"
          , eslintDescription = "disallow reassigning `function` parameters"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-plusplus"
          , eslintDescription = "disallow the unary operators `++` and `--`"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-proto"
          , eslintDescription = "disallow the use of the `__proto__` property"
          , elmAdvice = NotPartOfTheLanguage Prototypes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-redeclare"
          , eslintDescription = "disallow variable redeclaration"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-regex-spaces"
          , eslintDescription = "disallow multiple spaces in regular expressions"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = True
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-restricted-exports"
          , eslintDescription = "disallow specified names in exports"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-restricted-globals"
          , eslintDescription = "disallow specified global variables"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-restricted-imports"
          , eslintDescription = "disallow specified modules when loaded by `import`"
          , elmAdvice = HasCorrespondingRules [ "[ForbidSpecificImports](https://package.elm-lang.org/packages/webbhuset/elm-review-forbid-specific-imports/latest/ForbidSpecificImports)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-restricted-properties"
          , eslintDescription = "disallow certain properties on certain objects"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-restricted-syntax"
          , eslintDescription = "disallow specified syntax"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-return-assign"
          , eslintDescription = "disallow assignment operators in `return` statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-return-await"
          , eslintDescription = "disallow unnecessary `return await`"
          , elmAdvice = NotPartOfTheLanguage AsyncAwait
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-script-url"
          , eslintDescription = "disallow `javascript:` urls"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "The virtual-dom implementation prevents the execution of arbitrary JavaScript code.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-sequences"
          , eslintDescription = "disallow comma operators"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no such comma operator in Elm.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-shadow"
          , eslintDescription = "disallow variable declarations from shadowing variables declared in the outer scope"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-shadow-restricted-names"
          , eslintDescription = "disallow identifiers from shadowing restricted names"
          , elmAdvice = EnforcedByLanguageDesign NoShadowing
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-ternary"
          , eslintDescription = "disallow ternary operators"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no ternary operators, only if expressions.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-throw-literal"
          , eslintDescription = "disallow throwing literals as exceptions"
          , elmAdvice = NotPartOfTheLanguage Exceptions
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-undef-init"
          , eslintDescription = "disallow initializing variables to `undefined`"
          , elmAdvice = EnforcedByLanguageDesign NoNullOrUndefined
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-undefined"
          , eslintDescription = "disallow the use of `undefined` as an identifier"
          , elmAdvice = EnforcedByLanguageDesign NoNullOrUndefined
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-underscore-dangle"
          , eslintDescription = "disallow dangling underscores in identifiers"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unneeded-ternary"
          , eslintDescription = "disallow ternary operators when simpler alternatives exist"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no ternary operators, only if expressions.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-unused-expressions"
          , eslintDescription = "disallow unused expressions"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-unused-labels"
          , eslintDescription = "disallow unused labels"
          , elmAdvice = NotPartOfTheLanguage Labels
          , recommended = True
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-call"
          , eslintDescription = "disallow unnecessary calls to `.call()` and `.apply()`"
          , elmAdvice = NotPartOfTheLanguage FunctionsDontExist
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-catch"
          , eslintDescription = "disallow unnecessary `catch` clauses"
          , elmAdvice = NotPartOfTheLanguage Exceptions
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-computed-key"
          , eslintDescription = "disallow unnecessary computed property keys in objects and classes"
          , elmAdvice = NotPartOfTheLanguage DynamicProperties
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-concat"
          , eslintDescription = "disallow unnecessary concatenation of literals or template literals"
          , elmAdvice = HasCorrespondingRules [ "[Simplify](https://package.elm-lang.org/packages/jfmengels/elm-review-simplify/latest/Simplify)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-constructor"
          , eslintDescription = "disallow unnecessary constructors"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-escape"
          , eslintDescription = "disallow unnecessary escape characters"
          , elmAdvice = HandledByElmFormat
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-rename"
          , eslintDescription = "disallow renaming import, export, and destructured assignments to the same name"
          , elmAdvice = HasCorrespondingRules [ "[NoUnused.Variables](https://package.elm-lang.org/packages/jfmengels/elm-review-unused/latest/NoUnused-Variables)" ]
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-useless-return"
          , eslintDescription = "disallow redundant return statements"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-var"
          , eslintDescription = "require `let` or `const` instead of `var`"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Variables are not defined using a keyword.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-void"
          , eslintDescription = "disallow `void` operators"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no `void` operator.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-warning-comments"
          , eslintDescription = "disallow specified warning terms in comments"
          , elmAdvice = HasCorrespondingRules [ "[NoForbiddenWords](https://package.elm-lang.org/packages/sparksp/elm-review-forbidden-words/latest/NoForbiddenWords)" ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-with"
          , eslintDescription = "disallow `with` statements"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no `with` command.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "object-shorthand"
          , eslintDescription = "require or disallow method and property shorthand syntax for object literals"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "Shorthands are not available")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "one-var"
          , eslintDescription = "enforce variables to be declared either together or separately in functions"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Every variable is declared separately.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "one-var-declaration-per-line"
          , eslintDescription = "require or disallow newlines around variable declarations"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "operator-assignment"
          , eslintDescription = "require or disallow assignment operator shorthand where possible"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-arrow-callback"
          , eslintDescription = "require using arrow functions for callbacks"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only one way to define function expressions.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-const"
          , eslintDescription = "require `const` declarations for variables that are never reassigned after declared"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Variables are not defined using a keyword.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-destructuring"
          , eslintDescription = "require destructuring from arrays and/or objects"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-exponentiation-operator"
          , eslintDescription = "disallow the use of `Math.pow` in favor of the `**` operator"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only the `(^)` operator in the core language.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-named-capture-group"
          , eslintDescription = "enforce using named capture group in regular expression"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "prefer-numeric-literals"
          , eslintDescription = "disallow `parseInt()` and `Number.parseInt()` in favor of binary, octal, and hexadecimal literals"
          , elmAdvice = NotPartOfTheLanguage OctalOrBinary
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-object-has-own"
          , eslintDescription = "disallow use of `Object.prototype.hasOwnProperty.call()` and prefer use of `Object.hasOwn()`"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Available properties are always known, no need for these functions.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-object-spread"
          , eslintDescription = "disallow using Object.assign with an object literal as the first argument and prefer the use of object spread instead."
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "prefer-promise-reject-errors"
          , eslintDescription = "require using Error objects as Promise rejection reasons"
          , elmAdvice = NotPartOfTheLanguage Exceptions
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "prefer-regex-literals"
          , eslintDescription = "disallow use of the `RegExp` constructor in favor of regular expression literals"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is only one function to create a regular expression.")
          , recommended = False
          , fixable = False
          , hasSuggestions = True
          }
        , { eslintName = "prefer-rest-params"
          , eslintDescription = "require rest parameters instead of `arguments`"
          , elmAdvice = EnforcedByLanguageDesign NoVariableNumberOfArguments
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "prefer-spread"
          , eslintDescription = "require spread operators instead of `.apply()`"
          , elmAdvice = EnforcedByLanguageDesign NoVariableNumberOfArguments
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "prefer-template"
          , eslintDescription = "require template literals instead of string concatenation"
          , elmAdvice = NotPartOfTheLanguage TemplateLiterals
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "quote-props"
          , eslintDescription = "require quotes around object literal property names"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Property names can't be surrounded with quotes.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "radix"
          , eslintDescription = "enforce the consistent use of the radix argument when using `parseInt()`"
          , elmAdvice = EnforcedByLanguageDesign NoVariableNumberOfArguments
          , recommended = False
          , fixable = False
          , hasSuggestions = True
          }
        , { eslintName = "require-await"
          , eslintDescription = "disallow async functions which have no `await` expression"
          , elmAdvice = NotPartOfTheLanguage AsyncAwait
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "require-unicode-regexp"
          , eslintDescription = "enforce the use of `u` flag on RegExp"
          , elmAdvice = NotPartOfTheLanguage SpecialSupportForRegex
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "require-yield"
          , eslintDescription = "require generator functions to contain `yield`"
          , elmAdvice = NotPartOfTheLanguage Generators
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "sort-imports"
          , eslintDescription = "enforce sorted import declarations within modules"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "sort-keys"
          , eslintDescription = "require object keys to be sorted"
          , elmAdvice =
                HasCorrespondingRules
                    [ "[NoUnsortedRecords](https://package.elm-lang.org/packages/SiriusStarr/elm-review-no-unsorted/latest/NoUnsortedRecords)"
                    , "[NoUnsortedRecordFields](https://package.elm-lang.org/packages/fysiweb/elm-review-sorted/latest/NoUnsortedRecordFields)"
                    ]
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "sort-vars"
          , eslintDescription = "require variables within the same declaration block to be sorted"
          , elmAdvice =
                HasCorrespondingRules
                    [ "[NoUnsortedLetDeclarations](https://package.elm-lang.org/packages/SiriusStarr/elm-review-no-unsorted/latest/NoUnsortedLetDeclarations)"
                    ]
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "spaced-comment"
          , eslintDescription = "enforce consistent spacing after the `//` or `/*` in a comment"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "strict"
          , eslintDescription = "require or disallow strict mode directives"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "There is no strict mode in Elm.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "symbol-description"
          , eslintDescription = "require symbol descriptions"
          , elmAdvice = NotPartOfTheLanguage Symbol
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "vars-on-top"
          , eslintDescription = "require `var` declarations be placed at the top of their containing scope"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "This is somewhat enforced by the design of let declarations.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "yoda"
          , eslintDescription = "require or disallow \" Yoda \" conditions"
          , elmAdvice = EnforcedByLanguageDesign NoMutation
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        ]
    }


layoutAndFormatting : { name : String, description : String, rules : List EslintRule }
layoutAndFormatting =
    { name = "Layout & Formatting"
    , description = "These rules care about how the code looks rather than how it executes:"
    , rules =
        [ { eslintName = "array-bracket-newline"
          , eslintDescription = "enforce linebreaks after opening and before closing array brackets"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "array-bracket-spacing"
          , eslintDescription = "enforce consistent spacing inside array brackets"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "array-element-newline"
          , eslintDescription = "enforce line breaks after each array element"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "arrow-parens"
          , eslintDescription = "require parentheses around arrow function arguments"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "arrow-spacing"
          , eslintDescription = "enforce consistent spacing before and after the arrow in arrow functions"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "block-spacing"
          , eslintDescription = "disallow or enforce spaces inside of blocks after opening block and before closing block"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no blocks in Elm.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "brace-style"
          , eslintDescription = "enforce consistent brace style for blocks"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no blocks in Elm.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "comma-dangle"
          , eslintDescription = "require or disallow trailing commas"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There are no trailing commas in Elm.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "comma-spacing"
          , eslintDescription = "enforce consistent spacing before and after commas"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "comma-style"
          , eslintDescription = "enforce consistent comma style"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "computed-property-spacing"
          , eslintDescription = "enforce consistent spacing inside computed property brackets"
          , elmAdvice = NotPartOfTheLanguage DynamicProperties
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "dot-location"
          , eslintDescription = "enforce consistent newlines before and after dots"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "eol-last"
          , eslintDescription = "require or disallow newline at the end of files"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "func-call-spacing"
          , eslintDescription = "require or disallow spacing between function identifiers and their invocations"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "function-call-argument-newline"
          , eslintDescription = "enforce line breaks between arguments of a function call"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "function-paren-newline"
          , eslintDescription = "enforce consistent line breaks inside function parentheses"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "generator-star-spacing"
          , eslintDescription = "enforce consistent spacing around `*` operators in generator functions"
          , elmAdvice = NotPartOfTheLanguage Generators
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "implicit-arrow-linebreak"
          , eslintDescription = "enforce the location of arrow function bodies"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "indent"
          , eslintDescription = "enforce consistent indentation"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "jsx-quotes"
          , eslintDescription = "enforce the consistent use of either double or single quotes in JSX attributes"
          , elmAdvice = NotPartOfTheLanguage Jsx
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "key-spacing"
          , eslintDescription = "enforce consistent spacing between keys and values in object literal properties"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "keyword-spacing"
          , eslintDescription = "enforce consistent spacing before and after keywords"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "line-comment-position"
          , eslintDescription = "enforce position of line comments"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "linebreak-style"
          , eslintDescription = "enforce consistent linebreak style"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "lines-around-comment"
          , eslintDescription = "require empty lines around comments"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "lines-between-class-members"
          , eslintDescription = "require or disallow an empty line between class members"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "max-len"
          , eslintDescription = "enforce a maximum line length"
          , elmAdvice = NoEquivalent
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "max-statements-per-line"
          , eslintDescription = "enforce a maximum number of statements allowed per line"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "multiline-ternary"
          , eslintDescription = "enforce newlines between operands of ternary expressions"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "new-parens"
          , eslintDescription = "enforce or disallow parentheses when invoking a constructor with no arguments"
          , elmAdvice = NotPartOfTheLanguage Classes
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "newline-per-chained-call"
          , eslintDescription = "require a newline after each call in a method chain"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-extra-parens"
          , eslintDescription = "disallow unnecessary parentheses"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-mixed-spaces-and-tabs"
          , eslintDescription = "disallow mixed spaces and tabs for indentation"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Tabs are forbidden in Elm.")
          , recommended = True
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-multi-spaces"
          , eslintDescription = "disallow multiple spaces"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-multiple-empty-lines"
          , eslintDescription = "disallow multiple empty lines"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-tabs"
          , eslintDescription = "disallow all tabs"
          , elmAdvice = EnforcedByLanguageDesign (CustomRationale "Tabs are forbidden in Elm.")
          , recommended = False
          , fixable = False
          , hasSuggestions = False
          }
        , { eslintName = "no-trailing-spaces"
          , eslintDescription = "disallow trailing whitespace at the end of lines"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "no-whitespace-before-property"
          , eslintDescription = "disallow whitespace before properties"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "nonblock-statement-body-position"
          , eslintDescription = "enforce the location of single-line statements"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "object-curly-newline"
          , eslintDescription = "enforce consistent line breaks after opening and before closing braces"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "object-curly-spacing"
          , eslintDescription = "enforce consistent spacing inside braces"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "object-property-newline"
          , eslintDescription = "enforce placing object properties on separate lines"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "operator-linebreak"
          , eslintDescription = "enforce consistent linebreak style for operators"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "padded-blocks"
          , eslintDescription = "require or disallow padding within blocks"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "padding-line-between-statements"
          , eslintDescription = "require or disallow padding lines between statements"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "quotes"
          , eslintDescription = "enforce the consistent use of either backticks, double, or single quotes"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "rest-spread-spacing"
          , eslintDescription = "enforce spacing between rest and spread operators and their expressions"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no spread operator.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "semi"
          , eslintDescription = "require or disallow semicolons instead of ASI"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "semi-spacing"
          , eslintDescription = "enforce consistent spacing before and after semicolons"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "semi-style"
          , eslintDescription = "enforce location of semicolons"
          , elmAdvice = EnforcedByLanguageDesign EverythingIsAnExpression_NoStatements
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "space-before-blocks"
          , eslintDescription = "enforce consistent spacing before blocks"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "space-before-function-paren"
          , eslintDescription = "enforce consistent spacing before `function` definition opening parenthesis"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "space-in-parens"
          , eslintDescription = "enforce consistent spacing inside parentheses"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "space-infix-ops"
          , eslintDescription = "require spacing around infix operators"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "space-unary-ops"
          , eslintDescription = "enforce consistent spacing before or after unary operators"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "switch-colon-spacing"
          , eslintDescription = "enforce spacing around colons of switch statements"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "template-curly-spacing"
          , eslintDescription = "require or disallow spacing around embedded expressions of template strings"
          , elmAdvice = NotPartOfTheLanguage TemplateLiterals
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "template-tag-spacing"
          , eslintDescription = "require or disallow spacing between template tags and their literals"
          , elmAdvice = NotPartOfTheLanguage TemplateLiterals
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "unicode-bom"
          , eslintDescription = "require or disallow Unicode byte order mark (BOM)"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "wrap-iife"
          , eslintDescription = "require parentheses around immediate `function` invocations"
          , elmAdvice = NotPartOfTheLanguage (CustomFeatureDescription "There is no iife in Elm.")
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "wrap-regex"
          , eslintDescription = "require parenthesis around regex literals"
          , elmAdvice = HandledByElmFormat
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        , { eslintName = "yield-star-spacing"
          , eslintDescription = "require or disallow spacing around the `*` in `yield*` expressions"
          , elmAdvice = NotPartOfTheLanguage Generators
          , recommended = False
          , fixable = True
          , hasSuggestions = False
          }
        ]
    }
