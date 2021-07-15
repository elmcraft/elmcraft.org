module Theme exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Templates.Footer
import Templates.Layout
import Templates.Navigation
import Templates.UI exposing (..)


view x model static =
    { title = static.meta.title
    , body =
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
                ]
                [ Templates.Navigation.navigation model static.meta.route

                -- , text <| Debug.toString x
                , if static.meta.title == "Elmcraft" then
                    -- @TODO figure out how to properly match "is index page"
                    none

                  else
                    standardCenteredSectionAdaptiveAt
                        Templates.Layout.maxWidth
                        model
                        white
                        []
                        [ heading1 static.meta.title
                        ]
                , standardCenteredSection
                    model
                    white
                    [ Region.mainContent ]
                    -- @TODO model arg to content
                    (static.ui model)
                , Templates.Footer.view model
                ]
    }
