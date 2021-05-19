module Document exposing (Document, map, placeholder)

import Element exposing (Element)
import Html exposing (Html)


type alias Document msg =
    { title : String
    , body : List (Element msg)
    }


map : (msg1 -> msg2) -> Document msg1 -> Document msg2
map fn doc =
    { title = doc.title
    , body = List.map (Element.map fn) doc.body
    }


placeholder : String -> Document msg
placeholder moduleName =
    { title = "Placeholder - " ++ moduleName
    , body = [ Element.text moduleName ]
    }
