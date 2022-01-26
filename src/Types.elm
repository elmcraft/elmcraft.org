module Types exposing (..)

import Bytes exposing (Bytes)
import Lamdera exposing (..)
import Main
import Set exposing (Set)
import Task exposing (Task)
import Time exposing (Posix)


type alias BackendModel =
    ()


type alias FrontendModel =
    { check : Maybe Main.PageData
    }


type FrontendMsg
    = FNoop


type ToBackend
    = ToBackendNoop


type BackendMsg
    = ClientJoin SessionId ClientId
    | Noop


type ToFrontend
    = ToFrontendNoop
