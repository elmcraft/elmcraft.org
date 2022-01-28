module DataStatic.ESLintRules exposing (..)


type alias EslintRule =
    { eslintTags : String
    , eslintName : String
    , eslintDescription : String
    , elmAdvice : String
    }


all =
    [ possibleProblems, suggestions, layoutAndFormatting ]


type Advice
    = NotApplicable String
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
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "constructor-super"
          , eslintDescription = "require `super()` calls in constructors"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "for-direction"
          , eslintDescription = "enforce \" for \" loop update clause moving the counter in the right direction."
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "getter-return"
          , eslintDescription = "enforce `return` statements in getters"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-async-promise-executor"
          , eslintDescription = "disallow using an async function as a Promise executor"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-await-in-loop"
          , eslintDescription = "disallow `await` inside of loops"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-class-assign"
          , eslintDescription = "disallow reassigning class members"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-compare-neg-zero"
          , eslintDescription = "disallow comparing against -0"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-cond-assign"
          , eslintDescription = "disallow assignment operators in conditional expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-const-assign"
          , eslintDescription = "disallow reassigning `const` variables"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-constant-condition"
          , eslintDescription = "disallow constant expressions in conditions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-constructor-return"
          , eslintDescription = "disallow returning value from constructor"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-control-regex"
          , eslintDescription = "disallow control characters in regular expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-debugger"
          , eslintDescription = "disallow the use of `debugger`"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-args"
          , eslintDescription = "disallow duplicate arguments in `function` definitions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-class-members"
          , eslintDescription = "disallow duplicate class members"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-else-if"
          , eslintDescription = "disallow duplicate conditions in if-else-if chains"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-dupe-keys"
          , eslintDescription = "disallow duplicate keys in object literals"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-duplicate-case"
          , eslintDescription = "disallow duplicate case labels"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-duplicate-imports"
          , eslintDescription = "disallow duplicate module imports"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty-character-class"
          , eslintDescription = "disallow empty character classes in regular expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty-pattern"
          , eslintDescription = "disallow empty destructuring patterns"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-ex-assign"
          , eslintDescription = "disallow reassigning exceptions in `catch` clauses"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-fallthrough"
          , eslintDescription = "disallow fallthrough of `case` statements"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-func-assign"
          , eslintDescription = "disallow reassigning `function` declarations"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-import-assign"
          , eslintDescription = "disallow assigning to imported bindings"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-inner-declarations"
          , eslintDescription = "disallow variable or `function` declarations in nested blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-invalid-regexp"
          , eslintDescription = "disallow invalid regular expression strings in `RegExp` constructors"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-irregular-whitespace"
          , eslintDescription = "disallow irregular whitespace"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-loss-of-precision"
          , eslintDescription = "disallow literal numbers that lose precision"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-misleading-character-class"
          , eslintDescription = "disallow characters which are made with multiple code points in character class syntax"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-new-symbol"
          , eslintDescription = "disallow `new` operators with the `Symbol` object"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-obj-calls"
          , eslintDescription = "disallow calling global object properties as functions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-promise-executor-return"
          , eslintDescription = "disallow returning values from Promise executor functions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-prototype-builtins"
          , eslintDescription = "disallow calling some `Object.prototype` methods directly on objects"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-self-assign"
          , eslintDescription = "disallow assignments where both sides are exactly the same"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-self-compare"
          , eslintDescription = "disallow comparisons where both sides are exactly the same"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-setter-return"
          , eslintDescription = "disallow returning values from setters"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-sparse-arrays"
          , eslintDescription = "disallow sparse arrays"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-template-curly-in-string"
          , eslintDescription = "disallow template literal placeholder syntax in regular strings"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-this-before-super"
          , eslintDescription = "disallow `this`/`super` before calling `super()` in constructors"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-undef"
          , eslintDescription = "disallow the use of undeclared variables unless mentioned in `/*global */` comments"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unexpected-multiline"
          , eslintDescription = "disallow confusing multiline expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-unmodified-loop-condition"
          , eslintDescription = "disallow unmodified loop conditions"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unreachable"
          , eslintDescription = "disallow unreachable code after `return`, `throw`, `continue`, and `break` statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-unreachable-loop"
          , eslintDescription = "disallow loops with a body that allows only one iteration"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unsafe-finally"
          , eslintDescription = "disallow control flow statements in `finally` blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-unsafe-negation"
          , eslintDescription = "disallow negating the left operand of relational operators"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unsafe-optional-chaining"
          , eslintDescription = "disallow use of optional chaining in contexts where the `undefined` value is not allowed"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-unused-private-class-members"
          , eslintDescription = "disallow unused private class members"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-unused-vars"
          , eslintDescription = "disallow unused variables"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-use-before-define"
          , eslintDescription = "disallow the use of variables before they are defined"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-useless-backreference"
          , eslintDescription = "disallow useless backreferences in regular expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "require-atomic-updates"
          , eslintDescription = "disallow assignments that can lead to race conditions due to usage of `await` or `yield`"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "use-isnan"
          , eslintDescription = "require calls to `isNaN()` when checking for `NaN`"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "valid-typeof"
          , eslintDescription = "enforce comparing `typeof` expressions against valid strings"
          , elmAdvice = ""
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
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-body-style"
          , eslintDescription = "require braces around arrow function bodies"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "block-scoped-var"
          , eslintDescription = "enforce the use of variables within the scope they are defined"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "camelcase"
          , eslintDescription = "enforce camelcase naming convention"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "capitalized-comments"
          , eslintDescription = "enforce or disallow capitalization of the first letter of a comment"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "class-methods-use-this"
          , eslintDescription = "enforce that class methods utilize `this`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "complexity"
          , eslintDescription = "enforce a maximum cyclomatic complexity allowed in a program"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "consistent-return"
          , eslintDescription = "require `return` statements to either always or never specify values"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "consistent-this"
          , eslintDescription = "enforce consistent naming when capturing the current execution context"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "curly"
          , eslintDescription = "enforce consistent brace style for all control statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "default-case"
          , eslintDescription = "require `default` cases in `switch` statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "default-case-last"
          , eslintDescription = "enforce default clauses in switch statements to be last"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "default-param-last"
          , eslintDescription = "enforce default parameters to be last"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "dot-notation"
          , eslintDescription = "enforce dot notation whenever possible"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "eqeqeq"
          , eslintDescription = "require the use of `===` and `!==`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "func-name-matching"
          , eslintDescription = "require function names to match the name of the variable or property to which they are assigned"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "func-names"
          , eslintDescription = "require or disallow named `function` expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "func-style"
          , eslintDescription = "enforce the consistent use of either `function` declarations or expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "grouped-accessor-pairs"
          , eslintDescription = "require grouped accessor pairs in object literals and classes"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "guard-for-in"
          , eslintDescription = "require `for-in` loops to include an `if` statement"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "id-denylist"
          , eslintDescription = "disallow specified identifiers"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "id-length"
          , eslintDescription = "enforce minimum and maximum identifier lengths"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "id-match"
          , eslintDescription = "require identifiers to match a specified regular expression"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "init-declarations"
          , eslintDescription = "require or disallow initialization in variable declarations"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-classes-per-file"
          , eslintDescription = "enforce a maximum number of classes per file"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-depth"
          , eslintDescription = "enforce a maximum depth that blocks can be nested"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-lines"
          , eslintDescription = "enforce a maximum number of lines per file"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-lines-per-function"
          , eslintDescription = "enforce a maximum number of lines of code in a function"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-nested-callbacks"
          , eslintDescription = "enforce a maximum depth that callbacks can be nested"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-params"
          , eslintDescription = "enforce a maximum number of parameters in function definitions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-statements"
          , eslintDescription = "enforce a maximum number of statements allowed in function blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "multiline-comment-style"
          , eslintDescription = "enforce a particular style for multiline comments"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "new-cap"
          , eslintDescription = "require constructor names to begin with a capital letter"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-alert"
          , eslintDescription = "disallow the use of `alert`, `confirm`, and `prompt`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-array-constructor"
          , eslintDescription = "disallow `Array` constructors"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-bitwise"
          , eslintDescription = "disallow bitwise operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-caller"
          , eslintDescription = "disallow the use of `arguments.caller` or `arguments.callee`"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-case-declarations"
          , eslintDescription = "disallow lexical declarations in case clauses"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-confusing-arrow"
          , eslintDescription = "disallow arrow functions where they could be confused with comparisons"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-console"
          , eslintDescription = "disallow the use of `console`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-continue"
          , eslintDescription = "disallow `continue` statements"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-delete-var"
          , eslintDescription = "disallow deleting variables"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-div-regex"
          , eslintDescription = "disallow division operators explicitly at the beginning of regular expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-else-return"
          , eslintDescription = "disallow `else` blocks after `return` statements in `if` statements"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-empty"
          , eslintDescription = "disallow empty block statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-empty-function"
          , eslintDescription = "disallow empty functions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-eq-null"
          , eslintDescription = "disallow `null` comparisons without type-checking operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-eval"
          , eslintDescription = "disallow the use of `eval()`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-extend-native"
          , eslintDescription = "disallow extending native types"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-bind"
          , eslintDescription = "disallow unnecessary calls to `.bind()`"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-extra-boolean-cast"
          , eslintDescription = "disallow unnecessary boolean casts"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-label"
          , eslintDescription = "disallow unnecessary labels"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-extra-semi"
          , eslintDescription = "disallow unnecessary semicolons"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-floating-decimal"
          , eslintDescription = "disallow leading or trailing decimal points in numeric literals"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-global-assign"
          , eslintDescription = "disallow assignments to native objects or read-only global variables"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-implicit-coercion"
          , eslintDescription = "disallow shorthand type conversions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-implicit-globals"
          , eslintDescription = "disallow declarations in the global scope"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-implied-eval"
          , eslintDescription = "disallow the use of `eval()`-like methods"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-inline-comments"
          , eslintDescription = "disallow inline comments after code"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-invalid-this"
          , eslintDescription = "disallow `this` keywords outside of classes or class-like objects"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-iterator"
          , eslintDescription = "disallow the use of the `__iterator__` property"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-label-var"
          , eslintDescription = "disallow labels that share a name with a variable"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-labels"
          , eslintDescription = "disallow labeled statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-lone-blocks"
          , eslintDescription = "disallow unnecessary nested blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-lonely-if"
          , eslintDescription = "disallow `if` statements as the only statement in `else` blocks"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-loop-func"
          , eslintDescription = "disallow function declarations that contain unsafe references inside loop statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-magic-numbers"
          , eslintDescription = "disallow magic numbers"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-mixed-operators"
          , eslintDescription = "disallow mixed binary operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-multi-assign"
          , eslintDescription = "disallow use of chained assignment expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-multi-str"
          , eslintDescription = "disallow multiline strings"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-negated-condition"
          , eslintDescription = "disallow negated conditions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-nested-ternary"
          , eslintDescription = "disallow nested ternary expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-new"
          , eslintDescription = "disallow `new` operators outside of assignments or comparisons"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-new-func"
          , eslintDescription = "disallow `new` operators with the `Function` object"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-new-object"
          , eslintDescription = "disallow `Object` constructors"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-new-wrappers"
          , eslintDescription = "disallow `new` operators with the `String`, `Number`, and `Boolean` objects"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-nonoctal-decimal-escape"
          , eslintDescription = "disallow `\\8` and `\\9` escape sequences in string literals"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-octal"
          , eslintDescription = "disallow octal literals"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-octal-escape"
          , eslintDescription = "disallow octal escape sequences in string literals"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-param-reassign"
          , eslintDescription = "disallow reassigning `function` parameters"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-plusplus"
          , eslintDescription = "disallow the unary operators `++` and `--`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-proto"
          , eslintDescription = "disallow the use of the `__proto__` property"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-redeclare"
          , eslintDescription = "disallow variable redeclaration"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-regex-spaces"
          , eslintDescription = "disallow multiple spaces in regular expressions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-exports"
          , eslintDescription = "disallow specified names in exports"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-globals"
          , eslintDescription = "disallow specified global variables"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-imports"
          , eslintDescription = "disallow specified modules when loaded by `import`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-properties"
          , eslintDescription = "disallow certain properties on certain objects"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-restricted-syntax"
          , eslintDescription = "disallow specified syntax"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-return-assign"
          , eslintDescription = "disallow assignment operators in `return` statements"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-return-await"
          , eslintDescription = "disallow unnecessary `return await`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-script-url"
          , eslintDescription = "disallow `javascript:` urls"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-sequences"
          , eslintDescription = "disallow comma operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-shadow"
          , eslintDescription = "disallow variable declarations from shadowing variables declared in the outer scope"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-shadow-restricted-names"
          , eslintDescription = "disallow identifiers from shadowing restricted names"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-ternary"
          , eslintDescription = "disallow ternary operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-throw-literal"
          , eslintDescription = "disallow throwing literals as exceptions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-undef-init"
          , eslintDescription = "disallow initializing variables to `undefined`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-undefined"
          , eslintDescription = "disallow the use of `undefined` as an identifier"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-underscore-dangle"
          , eslintDescription = "disallow dangling underscores in identifiers"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-unneeded-ternary"
          , eslintDescription = "disallow ternary operators when simpler alternatives exist"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-unused-expressions"
          , eslintDescription = "disallow unused expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable recommended"
          , eslintName = "no-unused-labels"
          , eslintDescription = "disallow unused labels"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-useless-call"
          , eslintDescription = "disallow unnecessary calls to `.call()` and `.apply()`"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-useless-catch"
          , eslintDescription = "disallow unnecessary `catch` clauses"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-computed-key"
          , eslintDescription = "disallow unnecessary computed property keys in objects and classes"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-useless-concat"
          , eslintDescription = "disallow unnecessary concatenation of literals or template literals"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-useless-constructor"
          , eslintDescription = "disallow unnecessary constructors"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended hasSuggestions"
          , eslintName = "no-useless-escape"
          , eslintDescription = "disallow unnecessary escape characters"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-rename"
          , eslintDescription = "disallow renaming import, export, and destructured assignments to the same name"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-useless-return"
          , eslintDescription = "disallow redundant return statements"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-var"
          , eslintDescription = "require `let` or `const` instead of `var`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-void"
          , eslintDescription = "disallow `void` operators"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-warning-comments"
          , eslintDescription = "disallow specified warning terms in comments"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-with"
          , eslintDescription = "disallow `with` statements"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "object-shorthand"
          , eslintDescription = "require or disallow method and property shorthand syntax for object literals"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "one-var"
          , eslintDescription = "enforce variables to be declared either together or separately in functions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "one-var-declaration-per-line"
          , eslintDescription = "require or disallow newlines around variable declarations"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "operator-assignment"
          , eslintDescription = "require or disallow assignment operator shorthand where possible"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-arrow-callback"
          , eslintDescription = "require using arrow functions for callbacks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-const"
          , eslintDescription = "require `const` declarations for variables that are never reassigned after declared"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-destructuring"
          , eslintDescription = "require destructuring from arrays and/or objects"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-exponentiation-operator"
          , eslintDescription = "disallow the use of `Math.pow` in favor of the `**` operator"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "prefer-named-capture-group"
          , eslintDescription = "enforce using named capture group in regular expression"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-numeric-literals"
          , eslintDescription = "disallow `parseInt()` and `Number.parseInt()` in favor of binary, octal, and hexadecimal literals"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-object-has-own"
          , eslintDescription = "disallow use of `Object.prototype.hasOwnProperty.call()` and prefer use of `Object.hasOwn()`"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-object-spread"
          , eslintDescription = "disallow using Object.assign with an object literal as the first argument and prefer the use of object spread instead."
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "prefer-promise-reject-errors"
          , eslintDescription = "require using Error objects as Promise rejection reasons"
          , elmAdvice = ""
          }
        , { eslintTags = "hasSuggestions"
          , eslintName = "prefer-regex-literals"
          , eslintDescription = "disallow use of the `RegExp` constructor in favor of regular expression literals"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "prefer-rest-params"
          , eslintDescription = "require rest parameters instead of `arguments`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "prefer-spread"
          , eslintDescription = "require spread operators instead of `.apply()`"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "prefer-template"
          , eslintDescription = "require template literals instead of string concatenation"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "quote-props"
          , eslintDescription = "require quotes around object literal property names"
          , elmAdvice = ""
          }
        , { eslintTags = "hasSuggestions"
          , eslintName = "radix"
          , eslintDescription = "enforce the consistent use of the radix argument when using `parseInt()`"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "require-await"
          , eslintDescription = "disallow async functions which have no `await` expression"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "require-unicode-regexp"
          , eslintDescription = "enforce the use of `u` flag on RegExp"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "require-yield"
          , eslintDescription = "require generator functions to contain `yield`"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "sort-imports"
          , eslintDescription = "enforce sorted import declarations within modules"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "sort-keys"
          , eslintDescription = "require object keys to be sorted"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "sort-vars"
          , eslintDescription = "require variables within the same declaration block to be sorted"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "spaced-comment"
          , eslintDescription = "enforce consistent spacing after the `//` or `/*` in a comment"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "strict"
          , eslintDescription = "require or disallow strict mode directives"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "symbol-description"
          , eslintDescription = "require symbol descriptions"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "vars-on-top"
          , eslintDescription = "require `var` declarations be placed at the top of their containing scope"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "yoda"
          , eslintDescription = "require or disallow \" Yoda \" conditions"
          , elmAdvice = ""
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
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "array-bracket-spacing"
          , eslintDescription = "enforce consistent spacing inside array brackets"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "array-element-newline"
          , eslintDescription = "enforce line breaks after each array element"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-parens"
          , eslintDescription = "require parentheses around arrow function arguments"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "arrow-spacing"
          , eslintDescription = "enforce consistent spacing before and after the arrow in arrow functions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "block-spacing"
          , eslintDescription = "disallow or enforce spaces inside of blocks after opening block and before closing block"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "brace-style"
          , eslintDescription = "enforce consistent brace style for blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-dangle"
          , eslintDescription = "require or disallow trailing commas"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-spacing"
          , eslintDescription = "enforce consistent spacing before and after commas"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "comma-style"
          , eslintDescription = "enforce consistent comma style"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "computed-property-spacing"
          , eslintDescription = "enforce consistent spacing inside computed property brackets"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "dot-location"
          , eslintDescription = "enforce consistent newlines before and after dots"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "eol-last"
          , eslintDescription = "require or disallow newline at the end of files"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "func-call-spacing"
          , eslintDescription = "require or disallow spacing between function identifiers and their invocations"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "function-call-argument-newline"
          , eslintDescription = "enforce line breaks between arguments of a function call"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "function-paren-newline"
          , eslintDescription = "enforce consistent line breaks inside function parentheses"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "generator-star-spacing"
          , eslintDescription = "enforce consistent spacing around `*` operators in generator functions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "implicit-arrow-linebreak"
          , eslintDescription = "enforce the location of arrow function bodies"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "indent"
          , eslintDescription = "enforce consistent indentation"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "jsx-quotes"
          , eslintDescription = "enforce the consistent use of either double or single quotes in JSX attributes"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "key-spacing"
          , eslintDescription = "enforce consistent spacing between keys and values in object literal properties"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "keyword-spacing"
          , eslintDescription = "enforce consistent spacing before and after keywords"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "line-comment-position"
          , eslintDescription = "enforce position of line comments"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "linebreak-style"
          , eslintDescription = "enforce consistent linebreak style"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "lines-around-comment"
          , eslintDescription = "require empty lines around comments"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "lines-between-class-members"
          , eslintDescription = "require or disallow an empty line between class members"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-len"
          , eslintDescription = "enforce a maximum line length"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "max-statements-per-line"
          , eslintDescription = "enforce a maximum number of statements allowed per line"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "multiline-ternary"
          , eslintDescription = "enforce newlines between operands of ternary expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "new-parens"
          , eslintDescription = "enforce or disallow parentheses when invoking a constructor with no arguments"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "newline-per-chained-call"
          , eslintDescription = "require a newline after each call in a method chain"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-extra-parens"
          , eslintDescription = "disallow unnecessary parentheses"
          , elmAdvice = ""
          }
        , { eslintTags = "recommended"
          , eslintName = "no-mixed-spaces-and-tabs"
          , eslintDescription = "disallow mixed spaces and tabs for indentation"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-multi-spaces"
          , eslintDescription = "disallow multiple spaces"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-multiple-empty-lines"
          , eslintDescription = "disallow multiple empty lines"
          , elmAdvice = ""
          }
        , { eslintTags = ""
          , eslintName = "no-tabs"
          , eslintDescription = "disallow all tabs"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-trailing-spaces"
          , eslintDescription = "disallow trailing whitespace at the end of lines"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "no-whitespace-before-property"
          , eslintDescription = "disallow whitespace before properties"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "nonblock-statement-body-position"
          , eslintDescription = "enforce the location of single-line statements"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "object-curly-newline"
          , eslintDescription = "enforce consistent line breaks after opening and before closing braces"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "object-curly-spacing"
          , eslintDescription = "enforce consistent spacing inside braces"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "object-property-newline"
          , eslintDescription = "enforce placing object properties on separate lines"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "operator-linebreak"
          , eslintDescription = "enforce consistent linebreak style for operators"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "padded-blocks"
          , eslintDescription = "require or disallow padding within blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "padding-line-between-statements"
          , eslintDescription = "require or disallow padding lines between statements"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "quotes"
          , eslintDescription = "enforce the consistent use of either backticks, double, or single quotes"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "rest-spread-spacing"
          , eslintDescription = "enforce spacing between rest and spread operators and their expressions"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "semi"
          , eslintDescription = "require or disallow semicolons instead of ASI"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "semi-spacing"
          , eslintDescription = "enforce consistent spacing before and after semicolons"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "semi-style"
          , eslintDescription = "enforce location of semicolons"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "space-before-blocks"
          , eslintDescription = "enforce consistent spacing before blocks"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "space-before-function-paren"
          , eslintDescription = "enforce consistent spacing before `function` definition opening parenthesis"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "space-in-parens"
          , eslintDescription = "enforce consistent spacing inside parentheses"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "space-infix-ops"
          , eslintDescription = "require spacing around infix operators"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "space-unary-ops"
          , eslintDescription = "enforce consistent spacing before or after unary operators"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "switch-colon-spacing"
          , eslintDescription = "enforce spacing around colons of switch statements"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "template-curly-spacing"
          , eslintDescription = "require or disallow spacing around embedded expressions of template strings"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "template-tag-spacing"
          , eslintDescription = "require or disallow spacing between template tags and their literals"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "unicode-bom"
          , eslintDescription = "require or disallow Unicode byte order mark (BOM)"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "wrap-iife"
          , eslintDescription = "require parentheses around immediate `function` invocations"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "wrap-regex"
          , eslintDescription = "require parenthesis around regex literals"
          , elmAdvice = ""
          }
        , { eslintTags = "fixable"
          , eslintName = "yield-star-spacing"
          , eslintDescription = "require or disallow spacing around the `*` in `yield*` expressions"
          , elmAdvice = ""
          }
        ]
    }
