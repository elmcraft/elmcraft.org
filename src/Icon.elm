module Icon exposing (..)

import Element exposing (..)
import FeatherIcons exposing (..)


video : List (Attribute msg) -> Element msg
video attrs =
    toElement (FeatherIcons.video |> FeatherIcons.withSize 40) attrs


mic : List (Attribute msg) -> Element msg
mic attrs =
    toElement (FeatherIcons.mic |> FeatherIcons.withSize 40) attrs


mail : List (Attribute msg) -> Element msg
mail attrs =
    toElement (FeatherIcons.mail |> FeatherIcons.withSize 40) attrs


book : List (Attribute msg) -> Element msg
book attrs =
    toElement (FeatherIcons.bookOpen |> FeatherIcons.withSize 40) attrs



-- Helpers


fromString type_ =
    case type_ of
        "video" ->
            video []

        "mic" ->
            mic []

        "mail" ->
            mail []

        "book" ->
            book []

        _ ->
            none


toElement icon attrs =
    icon
        |> toHtml []
        |> html
        |> el attrs
