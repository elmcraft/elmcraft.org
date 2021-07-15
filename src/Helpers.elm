module Helpers exposing (..)

import Path
import Route exposing (..)


home =
    -- @TODO fix when / route works again
    splat_ "index"


splat_ s =
    splat s []


splat s parts =
    SPLAT_ { splat = ( s, parts ) }


toPath route =
    route |> Route.toPath |> Path.toAbsolute
