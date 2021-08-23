module Colors exposing (..)

import Color exposing (rgb)
import Color.Convert exposing (hexToColor)
import Element exposing (..)


elmTeal =
    fromHex "#5DAEC6"


elmTealDark =
    fromHex "#448294"


purple =
    fromHex "#5b5cf1"


purpleLight =
    fromHex "#8485D6"


yellow =
    fromHex "#E9A702"


green =
    fromHex "#2C9879"


charcoal =
    fromHex "#333"


charcoalLight =
    fromHex "#666"


white =
    fromHex "#FFF"


transparent_ =
    fromHex "#ffffff00"


red =
    Element.rgb 255 0 0


pink =
    fromHex "#f9eceb"


pinkDarker =
    fromHex "#e7b0c8"


grey =
    fromHex "#eee"


greyDark =
    fromHex "#ccc"


fromHex : String -> Color
fromHex str =
    case hexToColor str of
        Ok col ->
            let
                x =
                    Color.toRgba col
            in
            Element.rgba x.red x.green x.blue x.alpha

        Err _ ->
            Element.rgb 255 0 0


alpha80 : Color -> Color
alpha80 c =
    c |> Element.toRgb |> (\c_ -> { c_ | alpha = 0.8 }) |> Element.fromRgb
