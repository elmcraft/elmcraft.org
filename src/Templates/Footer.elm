module Templates.Footer exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Pages
import Templates.UI exposing (..)


view model =
    let
        item title page =
            linkHover [] title (asPath page)
    in
    column
        [ Background.color white, width fill, Font.color charcoal ]
        [ column
            [ centerX, width (fill |> maximum 1440), padding_ 60 30 20 30, spacing 50 ]
            [ whenMoreThan 800 model <|
                row [ width fill, spacing 20 ]
                    [ footerGroup "Discover"
                        [ item "Curious" Pages.pages.discover.curious
                        , item "Beginner" Pages.pages.discover.beginner
                        , item "Developer" Pages.pages.discover.developer
                        , item "Manager" Pages.pages.discover.developer
                        ]
                    , footerGroup "Build"
                        [ item "Packages" Pages.pages.placeholder
                        , item "Tooling" Pages.pages.placeholder
                        , item "Design patterns" Pages.pages.placeholder
                        , item "Examples" Pages.pages.placeholder
                        , item "Contributing" Pages.pages.placeholder
                        ]
                    , footerGroup "Media"
                        [ item "Newsletters" Pages.pages.placeholder
                        , item "Podcasts" Pages.pages.placeholder
                        , item "Videos" Pages.pages.placeholder
                        , item "Books" Pages.pages.placeholder
                        ]
                    , footerGroup "Community"
                        [ item "Forums/Chat" Pages.pages.placeholder
                        , item "Meetups" Pages.pages.placeholder
                        , item "Conferences" Pages.pages.placeholder
                        ]
                    , footerGroup "Commercial"
                        [ item "Elm at work" Pages.pages.placeholder
                        , item "Succcess stories" Pages.pages.placeholder
                        , item "Hiring" Pages.pages.placeholder
                        , item "Jobs" Pages.pages.placeholder
                        , item "Support" Pages.pages.placeholder
                        ]
                    , footerGroup "Elmcraft"
                        [ item "About us" Pages.pages.about
                        , item "Chat With Us" Pages.pages.discuss
                        , linkHover [] "Github" "https://github.com/elmcraft/elmcraft.org"
                        ]
                    ]
            , paragraph [ Font.center, spacing 10 ]
                [ text " © elmcraft.org "
                , link [] { url = "http://creativecommons.org/licenses/by-sa/4.0/", label = image [ width (px 50), moveDown 3 ] { src = "https://licensebuttons.net/l/by-sa/4.0/88x31.png", description = "Creative Commons Attribution-ShareAlike 4.0 International License" } }
                , text " - "
                , row [ spacing 10 ]
                    [ pageHover [] "Terms" Pages.pages.placeholder
                    , pageHover [] "Privacy" Pages.pages.placeholder

                    -- , linkHover [] "Github" "https://github.com/elmcraft/elmcraft.org"
                    ]
                ]
            ]
        ]


footerGroup title items =
    column [ alignTop, width fill, spacing 10 ] <|
        [ paragraph [ Font.color charcoal, Font.bold, paddingXY 0 10 ] [ text title ]
        ]
            ++ items
