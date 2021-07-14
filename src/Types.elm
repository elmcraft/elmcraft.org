module Types exposing (..)

import Dict exposing (Dict)
import Path exposing (Path)
import Time


type alias Model =
    { window : { width : Int, height : Int }
    , cookieConsent : Consent
    , navExpanded : Bool
    , navItemExpanded : Dict String Bool
    }


initTemporary : Model
initTemporary =
    { window = { width = 600, height = 800 }
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
