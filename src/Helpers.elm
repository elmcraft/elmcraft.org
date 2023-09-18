module Helpers exposing (..)

import Route exposing (..)
import UrlPath exposing (UrlPath)


home =
    -- @TODO fix when / route works again
    SPLAT__ { splat = [] }


splat_ : String -> Route
splat_ s =
    splat s []


splat : String -> List String -> Route
splat s parts =
    SPLAT__ { splat = s :: parts }


toPath route =
    route |> Route.toPath |> UrlPath.toAbsolute
