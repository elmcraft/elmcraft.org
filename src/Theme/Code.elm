module Theme.Code exposing (..)

import Element exposing (..)
import Html
import SyntaxHighlight


elmCodeBlock : String -> Element msg
elmCodeBlock string =
    string
        |> String.trim
        |> SyntaxHighlight.elm
        |> Result.map (SyntaxHighlight.toBlockHtml Nothing)
        |> Result.withDefault
            (Html.code [] [ Html.text string ])
        |> html
