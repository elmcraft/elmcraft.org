module Theme.Code exposing (..)

import Element exposing (..)
import Html
import Html.Attributes
import SyntaxHighlight
import Theme.UI exposing (..)


elmCodeBlock : String -> Element msg
elmCodeBlock string =
    string
        |> String.trim
        |> SyntaxHighlight.elm
        |> Result.map (SyntaxHighlight.toBlockHtml Nothing)
        |> Result.withDefault
            (Html.code [] [ Html.text string ])
        |> html


textCodeBlock : String -> Element msg
textCodeBlock string =
    string
        |> String.trim
        |> (\body ->
                Html.code [ Html.Attributes.class "text" ] [ Html.text body ]
           )
        |> html
        |> (\v ->
                column
                    [ width fill
                    , class "code-text"
                    , padding 10
                    ]
                    [ v ]
           )
