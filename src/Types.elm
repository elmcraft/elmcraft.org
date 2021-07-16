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
    }


init : { isDev : Bool } -> Model
init { isDev } =
    { window = { width = 600, height = 800 }
    , isDev = isDev
    , cookieConsent = ConsentApproved
    , navExpanded = False
    , navItemExpanded = Dict.empty
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
    | NewTime Time.Posix
    | CookieConsentValueReceived (Maybe Bool)
    | CookieConsentSet Bool
    | ToggleNav
    | ClearNav
    | ToggleNavItem String
    | Noop


type SharedMsg
    = Noop_
