module Pages.Homepage exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import Html exposing (Html)
import Html.Attributes
import Pages
import Theme
import Theme.Feature
import Theme.FindYourPath
import Theme.Footer
import Theme.UI exposing (..)
import Theme.Videos as Videos
import Types exposing (..)


view : Model -> GlobalData -> List (Element Msg) -> Element Msg
view model global _ =
    column [ width fill ]
        [ column [ width fill, spacing 50 ]
            [ none

            -- , heading1 "World of Elmcraft"
            , column [ width fill, spacing 15 ]
                [ heading2 [ Font.center ] "A place for all things Elm"
                , paragraph [ Font.center ]
                    [ text "Welcome! We're just getting started here. "
                    , image [ height (px 20) ] { src = "/images/elmcraft-heart-transparent.png", description = "Elmcraft Heart" }
                    ]
                ]
            , spacer 0
            , column [ spacing 30 ]
                [ heading3 [] "Featured article"
                , let
                    v opts =
                        boxNoPadding
                            [ rowToColumnWhen 650
                                model
                                [ width fill, spacing 10 ]
                                [ el
                                    [ centerX
                                    , width (fillPortion 1)
                                    , height opts.height
                                    , opts.border
                                    , clip
                                    ]
                                  <|
                                    link [] { url = "https://dev.to/lucamug/elm-2021-a-year-in-review-4pho", label = image [ width fill ] { src = "/articles/2021-in-review.webp", description = "2021 in review mosaic" } }
                                , column [ spacing 10, width (fillPortion 1), padding 20 ]
                                    [ paragraph [ Font.size 20, Font.bold ] [ externalLink [] "Elm 2021, a year in review" "https://dev.to/lucamug/elm-2021-a-year-in-review-4pho" ]
                                    , paragraph [] [ text "Check out Luca's writeup of ", externalLink [] "252 things that happened in Elm in 2021!" "https://dev.to/lucamug/elm-2021-a-year-in-review-4pho" ]
                                    ]
                                ]
                            ]
                  in
                  adaptiveAt 650
                    model
                    (v
                        { border = Border.roundEach { topLeft = 10, topRight = 0, bottomLeft = 10, bottomRight = 0 }
                        , height = fill
                        }
                    )
                    (v
                        { border = Border.roundEach { topLeft = 10, topRight = 10, bottomLeft = 0, bottomRight = 0 }
                        , height = fill |> minimum 160
                        }
                    )
                ]
            , column [ width fill, spacing 30 ]
                [ row [ width fill ]
                    [ heading3 [] "Latest Elm videos"
                    , routeLink [] ("See all (" ++ String.fromInt global.videosCount ++ ")") (splat "media" [ "videos" ])
                    ]
                , global.videos
                    |> List.take 3
                    |> List.map
                        (\v ->
                            Videos.embed v
                        )
                    |> wrappedRow [ spacing 30, width fill ]
                ]
            , case global.latestPodcast of
                Nothing ->
                    none

                Just episode ->
                    column [ width fill, spacing 30 ]
                        [ row [ width fill ]
                            [ heading3 [] "Latest Elm Podcast"
                            , routeLink [] "See all" (splat "media" [ "podcasts" ])
                            ]
                        , let
                            url =
                                episode.url

                            v opts =
                                boxNoPadding
                                    [ rowToColumnWhen 500
                                        model
                                        [ width fill, spacing 10 ]
                                        [ el
                                            [ centerX
                                            , width (fillPortion 1)
                                            , height fill
                                            , Background.color <| fromHex "#002329"
                                            , padding 20
                                            , opts.border
                                            ]
                                          <|
                                            link [ centerY, centerX ]
                                                { url = url
                                                , label =
                                                    image [ width fill, centerY ]
                                                        { src = "/images/logos/elm-radio.svg", description = "Elm Radio Logo" }
                                                }
                                        , column [ spacing 10, width (fillPortion 3), padding 20 ]
                                            [ heading3 [] <| "Elm Radio - Episode " ++ String.fromInt episode.number
                                            , paragraph [ Font.size 20, Font.bold ] [ externalLink [] episode.title url ]

                                            -- , paragraph [] [ text <| Theme.format episode.published ]
                                            -- @TODO parse and format the odd time format nicely
                                            , paragraph []
                                                [ episode.published
                                                    |> Theme.format
                                                    |> text
                                                ]
                                            , paragraph [] [ externalLink [] "Hosted by Dillon and Jeroen" "https://elm-radio.com/" ]
                                            ]
                                        ]
                                    ]
                          in
                          adaptiveAt 500
                            model
                            (v
                                { border = Border.roundEach { topLeft = 10, topRight = 0, bottomLeft = 10, bottomRight = 0 }
                                , height = fill
                                }
                            )
                            (v
                                { border = Border.roundEach { topLeft = 10, topRight = 10, bottomLeft = 0, bottomRight = 0 }
                                , height = fill |> minimum 160
                                }
                            )
                        ]
            , case global.latestNewsletter of
                Nothing ->
                    none

                Just newsletter ->
                    column [ width fill, spacing 30 ]
                        [ row [ width fill ]
                            [ heading3 [] "Latest Elm Newsletter"
                            , externalLink [] "See all" "https://www.elmweekly.nl/#archive"
                            ]
                        , let
                            url =
                                newsletter.link

                            v opts =
                                boxNoPadding
                                    [ rowToColumnWhen 500
                                        model
                                        [ width fill, spacing 10 ]
                                        [ el
                                            [ centerX
                                            , width (fillPortion 1)
                                            , height fill
                                            , Background.color <| fromHex "#FFF"
                                            , padding 20
                                            , opts.border
                                            ]
                                          <|
                                            link [ centerY, centerX ]
                                                { url = url
                                                , label =
                                                    image [ width fill, centerY ]
                                                        { src = "/images/logos/elm-weekly.png", description = "Elm Weekly Logo" }
                                                }
                                        , column [ spacing 10, width (fillPortion 3), padding 20 ]
                                            [ paragraph [ Font.size 20, Font.bold ] [ externalLink [] newsletter.title url ]
                                            , paragraph [] [ textHtml newsletter.description ]

                                            -- , paragraph [] [ text <| Theme.format newsletter.published ]
                                            -- @TODO parse and format the odd time format nicely
                                            , paragraph []
                                                [ newsletter.published
                                                    |> String.split " "
                                                    |> List.take 4
                                                    |> String.join " "
                                                    |> text
                                                ]
                                            , paragraph [] [ externalLink [] "By Wolfgang Schuster" "https://www.elmweekly.nl/" ]
                                            ]
                                        ]
                                    ]
                          in
                          adaptiveAt 500
                            model
                            (v
                                { border = Border.roundEach { topLeft = 10, topRight = 0, bottomLeft = 10, bottomRight = 0 }
                                , height = fill
                                }
                            )
                            (v
                                { border = Border.roundEach { topLeft = 10, topRight = 10, bottomLeft = 0, bottomRight = 0 }
                                , height = fill |> minimum 160
                                }
                            )
                        ]

            -- , column
            --     [ width fill, spacing 20 ]
            --     [ heading2 [] "Elm ❤️'s"
            --     , externalLink [] "Elm ❤️ Engineering" "/elm-loves/engineering"
            --     , externalLink [] "Elm ❤️ Testing" "/elm-loves/testing"
            --     , externalLink [] "Elm ❤️ Humans" "/elm-loves/humans"
            --     , externalLink [] "Elm ❤️ Community" "/elm-loves/community"
            --     , externalLink [] "Elm ❤️ Hiring" "/elm-loves/hiring"
            --     ]
            ]
        ]


view_old model _ =
    column [ width fill ]
        [ column [ width fill, spacing 20 ]
            [ none

            -- , heading1 "World of Elmcraft"
            , heading2 [] "A place for all things Elm"

            -- , paragraph [] [ text "Welcome! We're just getting started here. Something missing? Got ideas? ", pageHover [] "Discuss them with us!" Pages.pages.discuss ]
            , spacer 20
            , column
                [ width fill, spacing 20 ]
                [ heading2 [] "What's new"
                , column
                    [ width fill, spacing 20 ]
                    [ row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "News", paragraph [] [ text "2021-02-03 - An update from Evan" ] ]
                    , row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "Package", paragraph [] [ text "2021-02-02 - BrianHicks/elm-csv 3.0.1 is out! For maximum boredom, it can now encode CSVs as well as decoding them." ] ]
                    , row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "News", paragraph [] [ text "2021-02-01 - Arrival has hired @unsoundscapes to expand their use of Elm for 3D intensive UIs!" ] ]
                    ]
                ]
            , spacer 20
            , column
                [ width fill, spacing 20 ]
                [ heading2 [] "Spotlight"
                , column
                    [ width fill, spacing 20 ]
                    [ row [ spacing 20 ] [ el [ width (px 100) ] <| badge grey "Tooling", paragraph [] [ text "This month we're looking at Elm Language Server, and the incredible work being put in to make the Elm IDE experience a dream!" ] ]
                    ]
                ]
            , spacer 20
            , Theme.FindYourPath.view model
            , spacer 20
            , column [ Border.width 1, Border.color elmTeal, padding 20, Border.rounded 10, width fill, spacing 20 ]
                [ paragraph [ Font.center, Font.size 18, Font.bold ] [ text "Is Elm for me?" ]
                , paragraph [ Font.center ] [ text "A short quiz to find answers about the parts of Elm that matter to you." ]
                , buttonLinkSmall [ centerX ] "/quiz/is-elm-for-me" "Take the Quiz"
                ]
            ]
        ]
