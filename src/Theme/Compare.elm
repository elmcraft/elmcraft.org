module Theme.Compare exposing (view)

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
    column [ width fill, spacing 20 ]
        [ MarkdownPlain.fromString <|
            """
- testing
            """
        ]


type Solution
    = Lamdera
    | ElmPages
    | ElmLand
    | ElmReview
    | ESLint


type BuildTools
    = ElmVanilla
    | Vite


type Areas
    = Frontend
    | Backend
    | PreRendering


type Kinds
    = Language
    | Tooling
    | Framework
    | Library


type Compare
    = WIP Solution Solution String
    | Warning Solution Solution String
    | Equivalent Solution Solution String


incompatibilities =
    [ WIP Lamdera
        ElmPages
        "elm-pages v3 integrates with the Lamdera compiler, a future Lamdera release may bring elm-pages native support."
    , WIP ElmLand
        ElmPages
        "These tools have a bunch of overlap and they're not built with the intent to be used together."
    , Equivalent ElmReview
        ESLint
        "elm-review is the eslint equivalent for Elm. See the deep comparison at /compare/javascript/eslint"
    ]
