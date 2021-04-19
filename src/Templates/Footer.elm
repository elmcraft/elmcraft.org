module Templates.Footer exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Pages exposing (pages)
import Templates.Layout
import Templates.UI exposing (..)


view model =
    column
        [ Background.color white, width fill, Font.color charcoal ]
        [ column
            [ centerX, width (fill |> maximum Templates.Layout.maxWidth), padding_ 60 30 20 30, spacing 50 ]
            [ none

            -- , footerNav model
            , paragraph [ Font.center, spacing 15 ]
                [ text " © elmcraft.org "
                , link [] { url = "http://creativecommons.org/licenses/by-sa/4.0/", label = image [ width (px 50), moveDown 3 ] { src = "https://licensebuttons.net/l/by-sa/4.0/88x31.png", description = "Creative Commons Attribution-ShareAlike 4.0 International License" } }
                , text " - "
                , row [ spacing 10 ]
                    [ pageHover [] "Terms" pages.placeholder
                    , pageHover [] "Privacy" pages.placeholder

                    -- , linkHover [] "Github" "https://github.com/elmcraft/elmcraft.org"
                    ]
                ]
            ]
        ]


footerNav model =
    let
        item title page =
            linkHover [] title (asPath page)
    in
    whenMoreThan 800 model <|
        row [ width fill, spacing 20 ]
            [ footerGroup "Discover"
                [ item "Curious" pages.discover.curious
                , item "Beginner" pages.discover.beginner
                , item "Developer" pages.discover.developer
                , item "Manager/CTO" pages.discover.manager
                ]
            , footerGroup "Build"
                [ item "Packages" pages.build.packages
                , item "Tooling" pages.build.tooling
                , item "Design patterns" pages.build.designPatterns
                , item "Examples" pages.build.examples
                , item "Contributing" pages.build.contributing
                ]
            , footerGroup "Media"
                [ item "Newsletters" pages.media.newsletters
                , item "Articles" pages.media.articles
                , item "Podcasts" pages.media.podcasts
                , item "Videos" pages.media.videos
                , item "Books" pages.media.books
                ]
            , footerGroup "Community"
                [ item "Forums/Chat" pages.community.forumsChat
                , item "Meetups" pages.community.meetups
                , item "Conferences" pages.community.conferences
                , item "FAQs" pages.faqs.index
                ]
            , footerGroup "Commercial"
                [ item "Elm at work" pages.commercial.elmAtWork
                , item "Succcess stories" pages.commercial.successStories
                , item "Hiring" pages.commercial.hiring
                , item "Jobs" pages.commercial.jobs
                , item "Support" pages.commercial.support
                ]
            , footerGroup "Elmcraft"
                [ item "About" pages.about
                , item "Chat" pages.discuss
                , linkHover [] "Github" "https://github.com/elmcraft/elmcraft.org"
                ]
            ]


footerGroup title items =
    column [ alignTop, width fill, spacing 10 ] <|
        [ paragraph [ Font.color charcoal, Font.bold, paddingXY 0 10 ] [ text title ]
        ]
            ++ items
