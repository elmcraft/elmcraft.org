module DataSource.Meta exposing (..)

import Route


type Status
    = Seedling
    | Budding
    | Evergreen


type alias Meta =
    { title : String
    , description : String
    , published : Bool
    , status : Maybe Status
    , route : Route.Route
    , authors : List String
    , editors : List String
    }


empty =
    { title = "empty"
    , description = "empty"
    , published = False
    , status = Nothing
    , route = Route.NotFound
    , authors = []
    , editors = []
    }
