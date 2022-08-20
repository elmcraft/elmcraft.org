module View exposing (..)

import DataSource.Meta exposing (Meta, Status)
import Element exposing (Element)
import Html exposing (Html)
import Route exposing (Route)
import Time
import Timestamps exposing (Timestamps)


type alias View msg =
    { title : String
    , status : Maybe Status
    , content : List (Element msg)
    , route : Route
    , timestamps : Timestamps
    , published : Bool
    , meta : Meta
    }


map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn doc =
    { title = doc.title
    , status = doc.status
    , content = List.map (Element.map fn) doc.content
    , route = doc.route
    , timestamps = doc.timestamps
    , published = doc.published
    , meta = doc.meta
    }


placeholder : String -> View msg
placeholder moduleName =
    { title = "Placeholder - " ++ moduleName
    , status = Nothing
    , content = [ Element.text moduleName ]
    , route = Route.SPLAT__ { splat = [ "placeholder" ] }
    , timestamps =
        { updated = Time.millisToPosix 0
        , created = Time.millisToPosix 0
        }
    , published = False
    , meta = DataSource.Meta.empty
    }
