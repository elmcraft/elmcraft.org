module View exposing (View, map, placeholder)

import Element exposing (Element)
import Html exposing (Html)


type alias View msg =
    { title : String
    , body : List (Element msg)
    }


map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn doc =
    { title = doc.title
    , body = List.map (Element.map fn) doc.body
    }


placeholder : String -> View msg
placeholder moduleName =
    { title = "Placeholder - " ++ moduleName
    , body = [ Element.text moduleName ]
    }
