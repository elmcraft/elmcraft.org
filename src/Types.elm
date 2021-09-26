module Types exposing (..)

import Dict exposing (Dict)
import Path exposing (Path)
import Route exposing (Route)
import Time


type alias Model =
    { window : { width : Int, height : Int }
    , isDev : Bool
    , cookieConsent : Consent
    , navExpanded : Bool
    , navItemExpanded : Dict String Bool
    , appliedVideoFilters : List Category
    }


type alias GlobalData =
    { videos : List Video }


init : { isDev : Bool } -> Model
init { isDev } =
    { window = { width = 600, height = 800 }
    , isDev = isDev
    , cookieConsent = ConsentApproved
    , navExpanded = False
    , navItemExpanded = Dict.empty
    , appliedVideoFilters = []
    }


type Consent
    = ConsentUnloaded
    | ConsentAsk
    | ConsentRejected
    | ConsentApproved


type Msg
    = OnPageChange
        { path : Path
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg
    | WindowResized Int Int
    | SetDev Bool
    | NewTime Time.Posix
    | CookieConsentValueReceived (Maybe Bool)
    | CookieConsentSet Bool
    | ToggleNav
    | ClearNav
    | ToggleNavItem String
      -- Videos
    | VideosAddCategoryFilter Category
    | VideosRemoveCategoryFilter Category
    | Noop


type SharedMsg
    = Noop_


type Event
    = Conf Conference
    | OnlineMeetup String
    | EventUnknown String


type alias Video =
    { name : String
    , url : String
    , speaker : String
    , event : Event
    , year : String
    , categories : List Category
    , description : String
    }


type Category
    = ElmPhilosophy
    | Keynote
    | PannelDiscussion
    | Guide
    | Learn
    | Community
    | Meta
    | Commercial
    | Hobby
    | ExperienceReport
    | Interop
    | Project
    | UI
    | Animation
    | Visualisation
    | Charts
    | Graphics
    | Games
    | WebGL
    | Graphs
    | Maps
    | DatesTime
    | Robotics
    | Acesssibility
    | Audio
    | Media
    | Art
    | Design
    | Concept
    | Unknown
    | Product
    | Teaching
    | Testing


type Conference
    = ElmConf2016
    | ElmEurope2017
    | ElmConf2017
    | OsloElmDay2017
    | ElmEurope2018
    | ElmConf2018
    | OsloElmDay2019
    | ElmintheSpring2019
    | ElmEurope2019
    | ElmConf2019
    | ElmJapan2020
    | ElmConf2020
    | ElmintheSpring2020


type alias ConferenceDetails =
    { locationFlag : String
    , name : String
    , url : String
    , date : String
    }
