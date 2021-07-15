module View exposing (View, map, placeholder)

import Element exposing (Element)
import Html exposing (Html)
import Route exposing (Route)


type alias View msg =
    { title : String
    , content : List (Element msg)
    , route : Route
    }


map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn doc =
    { title = doc.title
    , content = List.map (Element.map fn) doc.content
    , route = doc.route
    }


placeholder : String -> View msg
placeholder moduleName =
    { title = "Placeholder - " ++ moduleName
    , content = [ Element.text moduleName ]
    , route = Route.SPLAT__ { splat = [ "placeholder" ] }
    }
