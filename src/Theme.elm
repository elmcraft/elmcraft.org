module Theme exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html
import Templates.Footer
import Templates.Layout
import Templates.Navigation
import Templates.UI exposing (..)


view x toMsg model static =
    layout
        [ width fill
        , Font.size 18
        , Font.family [ Font.typeface Templates.Layout.fontFace ]
        , Font.color charcoal
        , width fill
        ]
    <|
        column
            [ width fill
            , spacing 20
            ]
            [ Templates.Navigation.navigation model static.route

            -- , text <| Debug.toString x
            , if static.route == splat_ "" then
                -- @TODO figure out how to properly match "is index page"
                none

              else
                standardCenteredSectionAdaptiveAt
                    Templates.Layout.maxWidth
                    model
                    white
                    []
                    [ heading1 static.title
                    ]
            , standardCenteredSection
                model
                white
                [ Region.mainContent ]
                -- [ text "" ]
                static.content
            , Templates.Footer.view model
            ]
