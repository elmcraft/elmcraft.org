module DataStatic.ESLintRules exposing (..)


type alias EslintRule =
    { eslintTags : String
    , eslintName : String
    , eslintDescription : String
    , elmAdvice : Advice
    }


all =
    [ possibleProblems, suggestions, layoutAndFormatting ]


type Advice
    = NotApplicable String
    | NotPartOfTheLanguage String
    | CompilerError String
    | HandledByElmFormat
    | NoAdvice


possibleProblems =
    { name = "Possible problems"
    , description = "These rules relate to possible logic errors in code:"
    , rules =
        [ { eslintTags = ""
          , eslintName = "array-callback-return"
          , eslintDescription = "enforce `return` statements in callbacks of array methods"
          , elmAdvice = NotApplicable "All Elm functions return a value."
          }
        , { eslintTags = "recommended"
          , eslintName = "constructor-super"
          , eslintDescription = "require `super()` calls in constructors"
          , elmAdvice = NotPartOfTheLanguage "There are no classes in Elm."
          }
        , { eslintTags = "recommended"
          , eslintName = "for-direction"
          , eslintDescription = "enforce \" for \" loop update clause moving the counter in the right direction."
          , elmAdvice = NotPartOfTheLanguage "There are no loops in Elm"
          }
        , { eslintTags = "recommended"
          , eslintName = "getter-return"
          , eslintDescription = "enforce `return` statements in getters"
          , elmAdvice = NotPartOfTheLanguage "There are no getters in Elm, and all Elm functions return a value anyway."
          }
        , { eslintTags = "recommended"
          , eslintName = "no-async-promise-executor"
          , eslintDescription = "disallow using an async function as a Promise executor"
          , elmAdvice = NotPartOfTheLanguage "There are no `async` functions in Elm."
          }
        , { eslintTags = ""
          , eslintName = "no-await-in-loop"
          , eslintDescription = "disallow `await` inside of loops"
          , elmAdvice = NotPartOfTheLanguage "There is no `await` in Elm."
          }
        , { eslintTags = "recommended"
          , eslintName = "no-class-assign"
          , eslintDescription = "disallow reassigning class members"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-compare-neg-zero"
          , eslintDescription = "disallow comparing against -0"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-cond-assign"
          , eslintDescription = "disallow assignment operators in conditional expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-const-assign"
          , eslintDescription = "disallow reassigning `const` variables"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-constant-condition"
          , eslintDescription = "disallow constant expressions in conditions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-constructor-return"
          , eslintDescription = "disallow returning value from constructor"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-control-regex"
          , eslintDescription = "disallow control characters in regular expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-debugger"
          , eslintDescription = "disallow the use of `debugger`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-args"
          , eslintDescription = "disallow duplicate arguments in `function` definitions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-class-members"
          , eslintDescription = "disallow duplicate class members"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-else-if"
          , eslintDescription = "disallow duplicate conditions in if-else-if chains"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-keys"
          , eslintDescription = "disallow duplicate keys in object literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-duplicate-case"
          , eslintDescription = "disallow duplicate case labels"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-duplicate-imports"
          , eslintDescription = "disallow duplicate module imports"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty-character-class"
          , eslintDescription = "disallow empty character classes in regular expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty-pattern"
          , eslintDescription = "disallow empty destructuring patterns"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-ex-assign"
          , eslintDescription = "disallow reassigning exceptions in `catch` clauses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-fallthrough"
          , eslintDescription = "disallow fallthrough of `case` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-func-assign"
          , eslintDescription = "disallow reassigning `function` declarations"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-import-assign"
          , eslintDescription = "disallow assigning to imported bindings"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-inner-declarations"
          , eslintDescription = "disallow variable or `function` declarations in nested blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-invalid-regexp"
          , eslintDescription = "disallow invalid regular expression strings in `RegExp` constructors"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-irregular-whitespace"
          , eslintDescription = "disallow irregular whitespace"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-loss-of-precision"
          , eslintDescription = "disallow literal numbers that lose precision"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-misleading-character-class"
          , eslintDescription = "disallow characters which are made with multiple code points in character class syntax"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-new-symbol"
          , eslintDescription = "disallow `new` operators with the `Symbol` object"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-obj-calls"
          , eslintDescription = "disallow calling global object properties as functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-promise-executor-return"
          , eslintDescription = "disallow returning values from Promise executor functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-prototype-builtins"
          , eslintDescription = "disallow calling some `Object.prototype` methods directly on objects"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-self-assign"
          , eslintDescription = "disallow assignments where both sides are exactly the same"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-self-compare"
          , eslintDescription = "disallow comparisons where both sides are exactly the same"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-setter-return"
          , eslintDescription = "disallow returning values from setters"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-sparse-arrays"
          , eslintDescription = "disallow sparse arrays"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-template-curly-in-string"
          , eslintDescription = "disallow template literal placeholder syntax in regular strings"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-this-before-super"
          , eslintDescription = "disallow `this`/`super` before calling `super()` in constructors"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-undef"
          , eslintDescription = "disallow the use of undeclared variables unless mentioned in `/*global */` comments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unexpected-multiline"
          , eslintDescription = "disallow confusing multiline expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-unmodified-loop-condition"
          , eslintDescription = "disallow unmodified loop conditions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unreachable"
          , eslintDescription = "disallow unreachable code after `return`, `throw`, `continue`, and `break` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-unreachable-loop"
          , eslintDescription = "disallow loops with a body that allows only one iteration"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unsafe-finally"
          , eslintDescription = "disallow control flow statements in `finally` blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-unsafe-negation"
          , eslintDescription = "disallow negating the left operand of relational operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unsafe-optional-chaining"
          , eslintDescription = "disallow use of optional chaining in contexts where the `undefined` value is not allowed"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-unused-private-class-members"
          , eslintDescription = "disallow unused private class members"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unused-vars"
          , eslintDescription = "disallow unused variables"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-use-before-define"
          , eslintDescription = "disallow the use of variables before they are defined"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-useless-backreference"
          , eslintDescription = "disallow useless backreferences in regular expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "require-atomic-updates"
          , eslintDescription = "disallow assignments that can lead to race conditions due to usage of `await` or `yield`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "use-isnan"
          , eslintDescription = "require calls to `isNaN()` when checking for `NaN`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "valid-typeof"
          , eslintDescription = "enforce comparing `typeof` expressions against valid strings"
          , elmAdvice = NoAdvice
          }
        ]
    }


suggestions =
    { name = "Suggestions"
    , description = "These rules suggest alternate ways of doing things:"
    , rules =
        [ { eslintTags = ""
          , eslintName = "accessor-pairs"
          , eslintDescription = "enforce getter and setter pairs in objects and classes"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-body-style"
          , eslintDescription = "require braces around arrow function bodies"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "block-scoped-var"
          , eslintDescription = "enforce the use of variables within the scope they are defined"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "camelcase"
          , eslintDescription = "enforce camelcase naming convention"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "capitalized-comments"
          , eslintDescription = "enforce or disallow capitalization of the first letter of a comment"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "class-methods-use-this"
          , eslintDescription = "enforce that class methods utilize `this`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "complexity"
          , eslintDescription = "enforce a maximum cyclomatic complexity allowed in a program"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "consistent-return"
          , eslintDescription = "require `return` statements to either always or never specify values"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "consistent-this"
          , eslintDescription = "enforce consistent naming when capturing the current execution context"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "curly"
          , eslintDescription = "enforce consistent brace style for all control statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "default-case"
          , eslintDescription = "require `default` cases in `switch` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "default-case-last"
          , eslintDescription = "enforce default clauses in switch statements to be last"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "default-param-last"
          , eslintDescription = "enforce default parameters to be last"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "dot-notation"
          , eslintDescription = "enforce dot notation whenever possible"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "eqeqeq"
          , eslintDescription = "require the use of `===` and `!==`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "func-name-matching"
          , eslintDescription = "require function names to match the name of the variable or property to which they are assigned"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "func-names"
          , eslintDescription = "require or disallow named `function` expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "func-style"
          , eslintDescription = "enforce the consistent use of either `function` declarations or expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "grouped-accessor-pairs"
          , eslintDescription = "require grouped accessor pairs in object literals and classes"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "guard-for-in"
          , eslintDescription = "require `for-in` loops to include an `if` statement"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "id-denylist"
          , eslintDescription = "disallow specified identifiers"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "id-length"
          , eslintDescription = "enforce minimum and maximum identifier lengths"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "id-match"
          , eslintDescription = "require identifiers to match a specified regular expression"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "init-declarations"
          , eslintDescription = "require or disallow initialization in variable declarations"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-classes-per-file"
          , eslintDescription = "enforce a maximum number of classes per file"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-depth"
          , eslintDescription = "enforce a maximum depth that blocks can be nested"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-lines"
          , eslintDescription = "enforce a maximum number of lines per file"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-lines-per-function"
          , eslintDescription = "enforce a maximum number of lines of code in a function"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-nested-callbacks"
          , eslintDescription = "enforce a maximum depth that callbacks can be nested"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-params"
          , eslintDescription = "enforce a maximum number of parameters in function definitions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-statements"
          , eslintDescription = "enforce a maximum number of statements allowed in function blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "multiline-comment-style"
          , eslintDescription = "enforce a particular style for multiline comments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "new-cap"
          , eslintDescription = "require constructor names to begin with a capital letter"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-alert"
          , eslintDescription = "disallow the use of `alert`, `confirm`, and `prompt`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-array-constructor"
          , eslintDescription = "disallow `Array` constructors"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-bitwise"
          , eslintDescription = "disallow bitwise operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-caller"
          , eslintDescription = "disallow the use of `arguments.caller` or `arguments.callee`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-case-declarations"
          , eslintDescription = "disallow lexical declarations in case clauses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-confusing-arrow"
          , eslintDescription = "disallow arrow functions where they could be confused with comparisons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-console"
          , eslintDescription = "disallow the use of `console`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-continue"
          , eslintDescription = "disallow `continue` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-delete-var"
          , eslintDescription = "disallow deleting variables"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-div-regex"
          , eslintDescription = "disallow division operators explicitly at the beginning of regular expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-else-return"
          , eslintDescription = "disallow `else` blocks after `return` statements in `if` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty"
          , eslintDescription = "disallow empty block statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-empty-function"
          , eslintDescription = "disallow empty functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-eq-null"
          , eslintDescription = "disallow `null` comparisons without type-checking operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-eval"
          , eslintDescription = "disallow the use of `eval()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-extend-native"
          , eslintDescription = "disallow extending native types"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-bind"
          , eslintDescription = "disallow unnecessary calls to `.bind()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-extra-boolean-cast"
          , eslintDescription = "disallow unnecessary boolean casts"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-label"
          , eslintDescription = "disallow unnecessary labels"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-extra-semi"
          , eslintDescription = "disallow unnecessary semicolons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-floating-decimal"
          , eslintDescription = "disallow leading or trailing decimal points in numeric literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-global-assign"
          , eslintDescription = "disallow assignments to native objects or read-only global variables"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-implicit-coercion"
          , eslintDescription = "disallow shorthand type conversions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-implicit-globals"
          , eslintDescription = "disallow declarations in the global scope"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-implied-eval"
          , eslintDescription = "disallow the use of `eval()`-like methods"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-inline-comments"
          , eslintDescription = "disallow inline comments after code"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-invalid-this"
          , eslintDescription = "disallow `this` keywords outside of classes or class-like objects"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-iterator"
          , eslintDescription = "disallow the use of the `__iterator__` property"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-label-var"
          , eslintDescription = "disallow labels that share a name with a variable"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-labels"
          , eslintDescription = "disallow labeled statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-lone-blocks"
          , eslintDescription = "disallow unnecessary nested blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-lonely-if"
          , eslintDescription = "disallow `if` statements as the only statement in `else` blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-loop-func"
          , eslintDescription = "disallow function declarations that contain unsafe references inside loop statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-magic-numbers"
          , eslintDescription = "disallow magic numbers"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-mixed-operators"
          , eslintDescription = "disallow mixed binary operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-multi-assign"
          , eslintDescription = "disallow use of chained assignment expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-multi-str"
          , eslintDescription = "disallow multiline strings"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-negated-condition"
          , eslintDescription = "disallow negated conditions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-nested-ternary"
          , eslintDescription = "disallow nested ternary expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-new"
          , eslintDescription = "disallow `new` operators outside of assignments or comparisons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-new-func"
          , eslintDescription = "disallow `new` operators with the `Function` object"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-new-object"
          , eslintDescription = "disallow `Object` constructors"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-new-wrappers"
          , eslintDescription = "disallow `new` operators with the `String`, `Number`, and `Boolean` objects"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-nonoctal-decimal-escape"
          , eslintDescription = "disallow `\\8` and `\\9` escape sequences in string literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-octal"
          , eslintDescription = "disallow octal literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-octal-escape"
          , eslintDescription = "disallow octal escape sequences in string literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-param-reassign"
          , eslintDescription = "disallow reassigning `function` parameters"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-plusplus"
          , eslintDescription = "disallow the unary operators `++` and `--`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-proto"
          , eslintDescription = "disallow the use of the `__proto__` property"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-redeclare"
          , eslintDescription = "disallow variable redeclaration"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-regex-spaces"
          , eslintDescription = "disallow multiple spaces in regular expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-exports"
          , eslintDescription = "disallow specified names in exports"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-globals"
          , eslintDescription = "disallow specified global variables"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-imports"
          , eslintDescription = "disallow specified modules when loaded by `import`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-properties"
          , eslintDescription = "disallow certain properties on certain objects"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-syntax"
          , eslintDescription = "disallow specified syntax"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-return-assign"
          , eslintDescription = "disallow assignment operators in `return` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-return-await"
          , eslintDescription = "disallow unnecessary `return await`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-script-url"
          , eslintDescription = "disallow `javascript:` urls"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-sequences"
          , eslintDescription = "disallow comma operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-shadow"
          , eslintDescription = "disallow variable declarations from shadowing variables declared in the outer scope"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-shadow-restricted-names"
          , eslintDescription = "disallow identifiers from shadowing restricted names"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-ternary"
          , eslintDescription = "disallow ternary operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-throw-literal"
          , eslintDescription = "disallow throwing literals as exceptions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-undef-init"
          , eslintDescription = "disallow initializing variables to `undefined`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-undefined"
          , eslintDescription = "disallow the use of `undefined` as an identifier"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-underscore-dangle"
          , eslintDescription = "disallow dangling underscores in identifiers"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-unneeded-ternary"
          , eslintDescription = "disallow ternary operators when simpler alternatives exist"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-unused-expressions"
          , eslintDescription = "disallow unused expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-unused-labels"
          , eslintDescription = "disallow unused labels"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-useless-call"
          , eslintDescription = "disallow unnecessary calls to `.call()` and `.apply()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-useless-catch"
          , eslintDescription = "disallow unnecessary `catch` clauses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-computed-key"
          , eslintDescription = "disallow unnecessary computed property keys in objects and classes"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-useless-concat"
          , eslintDescription = "disallow unnecessary concatenation of literals or template literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-useless-constructor"
          , eslintDescription = "disallow unnecessary constructors"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-useless-escape"
          , eslintDescription = "disallow unnecessary escape characters"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-rename"
          , eslintDescription = "disallow renaming import, export, and destructured assignments to the same name"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-return"
          , eslintDescription = "disallow redundant return statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-var"
          , eslintDescription = "require `let` or `const` instead of `var`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-void"
          , eslintDescription = "disallow `void` operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-warning-comments"
          , eslintDescription = "disallow specified warning terms in comments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-with"
          , eslintDescription = "disallow `with` statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "object-shorthand"
          , eslintDescription = "require or disallow method and property shorthand syntax for object literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "one-var"
          , eslintDescription = "enforce variables to be declared either together or separately in functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "one-var-declaration-per-line"
          , eslintDescription = "require or disallow newlines around variable declarations"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "operator-assignment"
          , eslintDescription = "require or disallow assignment operator shorthand where possible"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-arrow-callback"
          , eslintDescription = "require using arrow functions for callbacks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-const"
          , eslintDescription = "require `const` declarations for variables that are never reassigned after declared"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-destructuring"
          , eslintDescription = "require destructuring from arrays and/or objects"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-exponentiation-operator"
          , eslintDescription = "disallow the use of `Math.pow` in favor of the `**` operator"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "prefer-named-capture-group"
          , eslintDescription = "enforce using named capture group in regular expression"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-numeric-literals"
          , eslintDescription = "disallow `parseInt()` and `Number.parseInt()` in favor of binary, octal, and hexadecimal literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-object-has-own"
          , eslintDescription = "disallow use of `Object.prototype.hasOwnProperty.call()` and prefer use of `Object.hasOwn()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-object-spread"
          , eslintDescription = "disallow using Object.assign with an object literal as the first argument and prefer the use of object spread instead."
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "prefer-promise-reject-errors"
          , eslintDescription = "require using Error objects as Promise rejection reasons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "hasSuggestions"
          , eslintName = "prefer-regex-literals"
          , eslintDescription = "disallow use of the `RegExp` constructor in favor of regular expression literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "prefer-rest-params"
          , eslintDescription = "require rest parameters instead of `arguments`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "prefer-spread"
          , eslintDescription = "require spread operators instead of `.apply()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-template"
          , eslintDescription = "require template literals instead of string concatenation"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "quote-props"
          , eslintDescription = "require quotes around object literal property names"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "hasSuggestions"
          , eslintName = "radix"
          , eslintDescription = "enforce the consistent use of the radix argument when using `parseInt()`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "require-await"
          , eslintDescription = "disallow async functions which have no `await` expression"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "require-unicode-regexp"
          , eslintDescription = "enforce the use of `u` flag on RegExp"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "require-yield"
          , eslintDescription = "require generator functions to contain `yield`"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "sort-imports"
          , eslintDescription = "enforce sorted import declarations within modules"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "sort-keys"
          , eslintDescription = "require object keys to be sorted"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "sort-vars"
          , eslintDescription = "require variables within the same declaration block to be sorted"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "spaced-comment"
          , eslintDescription = "enforce consistent spacing after the `//` or `/*` in a comment"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "strict"
          , eslintDescription = "require or disallow strict mode directives"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "symbol-description"
          , eslintDescription = "require symbol descriptions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "vars-on-top"
          , eslintDescription = "require `var` declarations be placed at the top of their containing scope"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "yoda"
          , eslintDescription = "require or disallow \" Yoda \" conditions"
          , elmAdvice = NoAdvice
          }
        ]
    }


layoutAndFormatting =
    { name = "Layout & Formatting"
    , description = "These rules care about how the code looks rather than how it executes:"
    , rules =
        [ { eslintTags = "fixable"
          , eslintName = "array-bracket-newline"
          , eslintDescription = "enforce linebreaks after opening and before closing array brackets"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "array-bracket-spacing"
          , eslintDescription = "enforce consistent spacing inside array brackets"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "array-element-newline"
          , eslintDescription = "enforce line breaks after each array element"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-parens"
          , eslintDescription = "require parentheses around arrow function arguments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-spacing"
          , eslintDescription = "enforce consistent spacing before and after the arrow in arrow functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "block-spacing"
          , eslintDescription = "disallow or enforce spaces inside of blocks after opening block and before closing block"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "brace-style"
          , eslintDescription = "enforce consistent brace style for blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-dangle"
          , eslintDescription = "require or disallow trailing commas"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-spacing"
          , eslintDescription = "enforce consistent spacing before and after commas"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-style"
          , eslintDescription = "enforce consistent comma style"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "computed-property-spacing"
          , eslintDescription = "enforce consistent spacing inside computed property brackets"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "dot-location"
          , eslintDescription = "enforce consistent newlines before and after dots"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "eol-last"
          , eslintDescription = "require or disallow newline at the end of files"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "func-call-spacing"
          , eslintDescription = "require or disallow spacing between function identifiers and their invocations"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "function-call-argument-newline"
          , eslintDescription = "enforce line breaks between arguments of a function call"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "function-paren-newline"
          , eslintDescription = "enforce consistent line breaks inside function parentheses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "generator-star-spacing"
          , eslintDescription = "enforce consistent spacing around `*` operators in generator functions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "implicit-arrow-linebreak"
          , eslintDescription = "enforce the location of arrow function bodies"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "indent"
          , eslintDescription = "enforce consistent indentation"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "jsx-quotes"
          , eslintDescription = "enforce the consistent use of either double or single quotes in JSX attributes"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "key-spacing"
          , eslintDescription = "enforce consistent spacing between keys and values in object literal properties"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "keyword-spacing"
          , eslintDescription = "enforce consistent spacing before and after keywords"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "line-comment-position"
          , eslintDescription = "enforce position of line comments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "linebreak-style"
          , eslintDescription = "enforce consistent linebreak style"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "lines-around-comment"
          , eslintDescription = "require empty lines around comments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "lines-between-class-members"
          , eslintDescription = "require or disallow an empty line between class members"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-len"
          , eslintDescription = "enforce a maximum line length"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "max-statements-per-line"
          , eslintDescription = "enforce a maximum number of statements allowed per line"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "multiline-ternary"
          , eslintDescription = "enforce newlines between operands of ternary expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "new-parens"
          , eslintDescription = "enforce or disallow parentheses when invoking a constructor with no arguments"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "newline-per-chained-call"
          , eslintDescription = "require a newline after each call in a method chain"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-parens"
          , eslintDescription = "disallow unnecessary parentheses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "recommended"
          , eslintName = "no-mixed-spaces-and-tabs"
          , eslintDescription = "disallow mixed spaces and tabs for indentation"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-multi-spaces"
          , eslintDescription = "disallow multiple spaces"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-multiple-empty-lines"
          , eslintDescription = "disallow multiple empty lines"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = ""
          , eslintName = "no-tabs"
          , eslintDescription = "disallow all tabs"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-trailing-spaces"
          , eslintDescription = "disallow trailing whitespace at the end of lines"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "no-whitespace-before-property"
          , eslintDescription = "disallow whitespace before properties"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "nonblock-statement-body-position"
          , eslintDescription = "enforce the location of single-line statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "object-curly-newline"
          , eslintDescription = "enforce consistent line breaks after opening and before closing braces"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "object-curly-spacing"
          , eslintDescription = "enforce consistent spacing inside braces"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "object-property-newline"
          , eslintDescription = "enforce placing object properties on separate lines"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "operator-linebreak"
          , eslintDescription = "enforce consistent linebreak style for operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "padded-blocks"
          , eslintDescription = "require or disallow padding within blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "padding-line-between-statements"
          , eslintDescription = "require or disallow padding lines between statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "quotes"
          , eslintDescription = "enforce the consistent use of either backticks, double, or single quotes"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "rest-spread-spacing"
          , eslintDescription = "enforce spacing between rest and spread operators and their expressions"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "semi"
          , eslintDescription = "require or disallow semicolons instead of ASI"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "semi-spacing"
          , eslintDescription = "enforce consistent spacing before and after semicolons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "semi-style"
          , eslintDescription = "enforce location of semicolons"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "space-before-blocks"
          , eslintDescription = "enforce consistent spacing before blocks"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "space-before-function-paren"
          , eslintDescription = "enforce consistent spacing before `function` definition opening parenthesis"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "space-in-parens"
          , eslintDescription = "enforce consistent spacing inside parentheses"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "space-infix-ops"
          , eslintDescription = "require spacing around infix operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "space-unary-ops"
          , eslintDescription = "enforce consistent spacing before or after unary operators"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "switch-colon-spacing"
          , eslintDescription = "enforce spacing around colons of switch statements"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "template-curly-spacing"
          , eslintDescription = "require or disallow spacing around embedded expressions of template strings"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "template-tag-spacing"
          , eslintDescription = "require or disallow spacing between template tags and their literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "unicode-bom"
          , eslintDescription = "require or disallow Unicode byte order mark (BOM)"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "wrap-iife"
          , eslintDescription = "require parentheses around immediate `function` invocations"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "wrap-regex"
          , eslintDescription = "require parenthesis around regex literals"
          , elmAdvice = NoAdvice
          }
        , { eslintTags = "fixable"
          , eslintName = "yield-star-spacing"
          , eslintDescription = "require or disallow spacing around the `*` in `yield*` expressions"
          , elmAdvice = NoAdvice
          }
        ]
    }
