module Types exposing (..)

import Dict exposing (Dict)
import Time


type alias Model =
    { window : { width : Int, height : Int }
    , cookieConsent : Consent
    , navExpanded : Bool
    , navItemExpanded : Dict String Bool
    }


type Consent
    = ConsentUnloaded
    | ConsentAsk
    | ConsentRejected
    | ConsentApproved


type Msg
    = WindowResized Int Int
    | NewTime Time.Posix
    | CookieConsentValueReceived (Maybe Bool)
    | CookieConsentSet Bool
    | ToggleNav
    | ClearNav
    | ToggleNavItem String
    | Noop
