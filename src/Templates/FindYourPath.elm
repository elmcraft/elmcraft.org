module Templates.FindYourPath exposing (..)

import Element exposing (..)
import Element.Font as Font
import Pages
import Templates.UI exposing (..)


view model =
    column
        [ width fill, spacing 20 ]
        [ heading2 [] "Find your path"
        , rowToColumnWhen 700
            model
            [ width fill, spacing 20 ]
            [ box "Elm Curious"
                "Curious what Elm is about? Whether you're a Developer, Manager, or just generally interested, start here!"
                [ wrappedRow [ width fill, spacing 10 ]
                    -- [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I'm new to code"
                    -- , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code"
                    -- , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code JS"
                    -- , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I don't code"
                    -- ]
                    [ none ]
                ]
            , box "Elm Beginner"
                "Starting out with Elm? Find all the resources and support here!"
                [ wrappedRow [ width fill, spacing 10 ]
                    -- [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I'm new to code"
                    -- , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code"
                    -- , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code JS"
                    -- ]
                    [ none ]
                ]

            -- , box "Elm Developer"
            --     "Already familiar with Elm? Delve deeper into the world of Elmcraft here!"
            --     [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "Let's go!" ]
            ]
        ]


box title desc extra =
    column [ width fill, spacing 20, alignTop ] <|
        [ littleTitle [] title
        , paragraph [] [ text desc ]
        ]
            ++ extra
