module BackendTask.Helpers exposing (..)

import BackendTask exposing (BackendTask)
import FatalError


type alias BTask v =
    BackendTask FatalError.FatalError v


type alias FatalError =
    FatalError.FatalError


fromResultFatal : Result String a -> BTask a
fromResultFatal result =
    case result of
        Ok value ->
            BackendTask.succeed value

        Err err ->
            BackendTask.fail (FatalError.fromString "failed")
