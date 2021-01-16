module Colors exposing (..)

import Color exposing (rgb)
import Color.Convert exposing (hexToColor)
import Element exposing (..)


elmTeal =
    fromHex "#5DAEC6"


yellow =
    fromHex "#E9A702"


green =
    fromHex "#2C9879"


charcoal =
    fromHex "#333"


white =
    fromHex "#FFF"


transparent_ =
    fromHex "#ffffff00"


red =
    Element.rgb 255 0 0


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
