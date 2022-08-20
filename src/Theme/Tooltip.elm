module Theme.Tooltip exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Simple.Transition as Transition


add config =
    inFront (tooltip config)


tooltip : { hitboxSize : Int, el : Element msg } -> Element msg
tooltip config =
    el
        [ height (px config.hitboxSize)
        , width (px config.hitboxSize)

        -- This is helpful for hitbox debugging
        -- , Background.color red
        , alpha 0
        , moveUp 0
        , mouseOver [ alpha 1, moveUp 5 ]
        , all_ { duration = 300, options = [] }
            [ Transition.opacity
            , Transition.transform
            ]
        ]
        config.el


all_ :
    { duration : Transition.Millis, options : List Transition.Option }
    -> List (Transition.Millis -> List Transition.Option -> Transition.Property)
    -> Element.Attribute msg
all_ options =
    htmlAttribute << Transition.all options
