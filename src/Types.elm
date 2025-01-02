module Types exposing (..)

import Browser.Navigation
import DataSource.ElmRadio
import DataSource.ElmTown
import DataSource.RSS
import DataStatic.ESLintRules
import Dict exposing (Dict)
import Route exposing (Route)
import Time
import UrlPath exposing (UrlPath)


type alias Model =
    { window : { width : Int, height : Int }
    , cookieConsent : Consent
    , navExpanded : Bool
    , navItemExpanded : Dict String Bool
    , appliedVideoFilters : List Category
    , appliedEslintFilter : Maybe DataStatic.ESLintRules.Advice
    , appliedEslintRecommendedFilter : Bool
    }


type alias GlobalData =
    { isDev : Bool
    , videos : List Video
    , videosCount : Int
    , latestElmRadio : Maybe DataSource.ElmRadio.Episode
    , latestElmTown : Maybe DataSource.ElmTown.Episode
    , latestNewsletter : Maybe DataSource.RSS.Item
    , latestPackage : Maybe (List DataSource.RSS.Item)
    }


init : Model
init =
    { window = { width = 600, height = 800 }
    , cookieConsent = ConsentApproved
    , navExpanded = False
    , navItemExpanded = Dict.empty
    , appliedVideoFilters = []
    , appliedEslintFilter = Nothing
    , appliedEslintRecommendedFilter = False
    }


type Consent
    = ConsentUnloaded
    | ConsentAsk
    | ConsentRejected
    | ConsentApproved


type Msg
    = OnPageChange
        { path : UrlPath
        , query : Maybe String
        , fragment : Maybe String
        }
    | SharedMsg SharedMsg
    | WindowResized Int Int
    | NewTime Time.Posix
    | CookieConsentValueReceived (Maybe Bool)
    | CookieConsentSet Bool
    | ToggleNav
    | ClearNav
    | ToggleNavItem String
      -- Videos
    | VideosAddCategoryFilter Category
    | VideosRemoveCategoryFilter Category
    | EslintToggleCategoryFilter DataStatic.ESLintRules.Advice
    | EslintRemoveCategoryFilter
    | EslintToggleRecommendedFilter
    | Noop
    | Debug


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
    | Iconic
    | Keynote
    | PanelDiscussion
    | Guide
    | Introduction
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
    | Technique
    | Unknown String
    | Product
    | Teaching
    | Testing
    | LiveStream
    | Short


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
