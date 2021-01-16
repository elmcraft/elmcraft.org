module Templates.Homepage exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Pages
import Templates.Feature
import Templates.Footer
import Templates.UI exposing (..)


view model _ =
    column [ width fill ]
        [ column [ width fill, spacing 20 ]
            [ heading1 "World of Elmcraft"
            , littleTitle [] "A place for all things Elm"
            , paragraph [] [ text "Welcome! We're just getting started here. Something missing? Got ideas? ", pageHover [] "Discuss them with us!" Pages.pages.discuss ]
            , spacer 20
            , heading2 [] "Find your path"
            , rowToColumnWhen 700
                model
                [ width fill, spacing 20 ]
                [ box "Elm Curious"
                    "Curious what Elm is about? Whether you're a Developer, Manager, or just generally interested, start here!"
                    [ wrappedRow [ width fill, spacing 10 ]
                        [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I'm new to code"
                        , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code"
                        , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code JS"
                        , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I don't code"
                        ]
                    ]
                , box "Elm Beginner"
                    "Starting out with Elm? Find all the resources and support here!"
                    [ wrappedRow [ width fill, spacing 10 ]
                        [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I'm new to code"
                        , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code"
                        , buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "I code JS"
                        ]
                    ]
                , box "Elm Developer"
                    "Already familiar with Elm? Delve deeper into the world of Elmcraft here!"
                    [ buttonLinkSmall [ Font.size 16 ] (asPath Pages.pages.discover.beginner) "Let's go!" ]
                ]
            , paragraph []
                [ Templates.UI.markdown """

Ideas that need a home:

Learning Elm

- Starting out
- > The Elm Guide
- > …
- Coming from Javascript
- > JS Clean Presentation (Intro to Elm for JS devs)
- > …

Areas

- UI Frameworks
- > elm-ui
- Games
- Static sites & SSR
- > elm-pages et all

Contributing

- Elm Core development
- > How Elm language development works
- Ways to contribute
- > Write a Package
- > Projects welcoming help

Backend

- Elm with Javascript
- Elm with TypeScript
- Elm with Node.js
- Elm with Haskell
- Elm on the server

Lore
- History of Elm
- Roadmap

Misc

- Is Elm Dead?
- Bus Factor Insurance

                """
                ]
            ]
        ]


box title desc extra =
    column [ width fill, spacing 20, alignTop ] <|
        [ littleTitle [] title
        , paragraph [] [ text desc ]
        ]
            ++ extra
