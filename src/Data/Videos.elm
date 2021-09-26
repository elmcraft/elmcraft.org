module Data.Videos exposing (..)

import Colors exposing (..)
import Data.Conferences exposing (Conference)
import Dict exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes as Html


type Event
    = Conf Conference
    | OnlineMeetup String
    | EventUnknown String


index videos =
    column [ width fill, spacing 20 ]
        [ text <| String.fromInt (List.length videos) ++ " Elm Videos"
        , videos |> categoryView
        , videos |> List.map embed |> wrappedRow [ spacing 30 ]
        ]


categoryView videos =
    videos
        |> List.map .categories
        |> List.concat
        |> List.map categoryToString
        |> distribution
        |> Dict.toList
        |> List.map
            (\( categoryString, count ) ->
                let
                    category =
                        categoryFromString categoryString
                in
                categoryPill (Just count) category
            )
        |> wrappedRow [ spacing 5 ]


distribution : List comparable -> Dict comparable Int
distribution values =
    List.foldl
        (\v acc ->
            acc
                |> Dict.update
                    v
                    (\mv ->
                        case mv of
                            Nothing ->
                                Just 1

                            Just x ->
                                Just (x + 1)
                    )
        )
        Dict.empty
        values


test =
    embed
        { name = "Analytics and Architecture in Elm"
        , url = "https://www.youtube.com/watch?v=XlJuICG2kFU"
        , speaker = "Chad"
        , event = OnlineMeetup "2021-07-07"
        , year = "2021"
        , categories = []
        , description = "testing"
        }


embed : Video -> Element msg
embed video =
    column
        [ width (px 250)
        , spacing 4
        , Background.color grey
        , padding 10
        , Border.roundEach
            { topLeft = 10
            , topRight = 10
            , bottomLeft = 10
            , bottomRight = 10
            }
        ]
        [ videoThumbnail video
        , paragraph [ Font.bold, Font.size 10 ] [ text video.name ]
        , el [ Font.size 10 ] <| text video.speaker
        , el [ Font.size 10 ] <| text <| eventToString video.event
        , video.categories
            |> List.map (categoryPill Nothing)
            |> row [ spacing 5, width fill ]
        ]



--
-- element [ attribute, attribute ]
--     [ element [ attribute, attribute ]
--         [ element [ attribute, attribute ]
--             [ element [ attribute, attribute ] []
--             ]
--         ]
--     , element [ attribute, attribute ] []
--     ]


categoryPill mCount category =
    let
        pill x =
            ""
    in
    case mCount of
        Just count ->
            row
                [ Border.rounded 8
                , Background.color <| categoryToBackground category
                , paddingXY 6 4
                , Font.size 10
                , spacing 4
                , Font.color white
                ]
                [ text <|
                    categoryToString category
                , el [ Border.rounded 10, Background.color white, paddingXY 5 2, Font.color charcoal ] <| text <| String.fromInt count
                ]

        Nothing ->
            el
                [ Border.rounded 10
                , Background.color <| categoryToBackground category
                , paddingXY 6 4
                , Font.size 10
                , Font.color white
                ]
            <|
                text <|
                    categoryToString category


eventToString event =
    case event of
        Conf conference ->
            let
                conf =
                    Data.Conferences.conferenceDetails conference
            in
            conf.name

        OnlineMeetup date ->
            "Elm Online Meetup " ++ date

        EventUnknown s ->
            s


videoThumbnail : Video -> Element msg
videoThumbnail video =
    let
        youtubeId =
            if String.contains "youtube.com/watch/" video.url then
                video.url |> String.split "/watch/" |> List.reverse |> List.head |> Maybe.withDefault ""

            else if String.contains "youtube.com" video.url then
                video.url |> String.split "watch?v=" |> List.reverse |> List.head |> Maybe.withDefault ""

            else if String.contains "youtu.be" video.url then
                video.url
                    |> String.split "/"
                    |> List.reverse
                    |> List.head
                    |> Maybe.withDefault ""
                    |> String.split "?list="
                    |> List.head
                    |> Maybe.withDefault ""

            else
                "unknown"

        thumbnail =
            "https://i.ytimg.com/vi/" ++ youtubeId ++ "/maxresdefault.jpg"
    in
    newTabLink [ width fill ]
        { url = video.url
        , label =
            image [ width fill, centerX ]
                { src = thumbnail, description = "youtube" }
        }


safeObject =
    el [ width fill, height (px 400) ] <|
        html <|
            Html.node "object"
                [ Html.style "width" "100%"
                , Html.style "height" "100%"
                ]
                [ Html.node "param"
                    [ Html.name "movie"
                    , Html.value "https://www.youtube-nocookie.com/embed/Sdg0ef2PpBw"
                    ]
                    []
                , Html.node "embed"
                    [ Html.src <| "https://www.youtube-nocookie.com/embed/Sdg0ef2PpBw"
                    , Html.style "width" "100%"
                    , Html.style "height" "100%"
                    ]
                    []
                ]



-- <object width="100%" height="333">
--   <param name="movie" value="https://www.youtube-nocookie.com/embed/Sdg0ef2PpBw">
--   <embed src="https://www.youtube-nocookie.com/embed/Sdg0ef2PpBw" width="100%" height="333">
-- </object>


type alias Video =
    { name : String
    , url : String
    , speaker : String
    , event : Event
    , year : String
    , categories : List Category
    , description : String
    }


type Category
    = ElmPhilosophy
    | Keynote
    | PannelDiscussion
    | Guide
    | Learn
    | Community
    | Meta
    | Commercial
    | Hobby
    | ExperienceReport
    | Interop
    | Project
    | UI
    | Animation
    | Visualisation
    | Charts
    | Graphics
    | Games
    | WebGL
    | Graphs
    | Maps
    | DatesTime
    | Robotics
    | Acesssibility
    | Audio
    | Media
    | Art
    | Design
    | Concept
    | Unknown
    | Product
    | Teaching
    | Testing


categoryToString c =
    case c of
        ElmPhilosophy ->
            "Elm Philosophy"

        Keynote ->
            "Keynote"

        PannelDiscussion ->
            "Pannel Discussion"

        Guide ->
            "Guide"

        Learn ->
            "Learn"

        Community ->
            "Community"

        Meta ->
            "Meta"

        Commercial ->
            "Commercial"

        Hobby ->
            "Hobby"

        ExperienceReport ->
            "Experience Report"

        Interop ->
            "Interop"

        Project ->
            "Project"

        UI ->
            "UI"

        Animation ->
            "Animation"

        Visualisation ->
            "Visualisation"

        Charts ->
            "Charts"

        Graphics ->
            "Graphics"

        Games ->
            "Games"

        WebGL ->
            "WebGL"

        Graphs ->
            "Graphs"

        Maps ->
            "Maps"

        DatesTime ->
            "Dates/Time"

        Robotics ->
            "Robotics"

        Acesssibility ->
            "Acesssibility"

        Audio ->
            "Audio"

        Media ->
            "Media"

        Art ->
            "Art"

        Design ->
            "Design"

        Concept ->
            "Concept"

        Unknown ->
            "Unknown"

        Product ->
            "Product"

        Teaching ->
            "Teaching"

        Testing ->
            "Testing"


categoryFromString s =
    case s of
        "Elm Philosophy" ->
            ElmPhilosophy

        "Keynote" ->
            Keynote

        "Pannel Discussion" ->
            PannelDiscussion

        "Guide" ->
            Guide

        "Learn" ->
            Learn

        "Community" ->
            Community

        "Meta" ->
            Meta

        "Commercial" ->
            Commercial

        "Hobby" ->
            Hobby

        "Experience Report" ->
            ExperienceReport

        "Interop" ->
            Interop

        "Project" ->
            Project

        "UI" ->
            UI

        "Animation" ->
            Animation

        "Visualisation" ->
            Visualisation

        "Charts" ->
            Charts

        "Graphics" ->
            Graphics

        "Games" ->
            Games

        "WebGL" ->
            WebGL

        "Graphs" ->
            Graphs

        "Maps" ->
            Maps

        "Dates/Time" ->
            DatesTime

        "Robotics" ->
            Robotics

        "Acesssibility" ->
            Acesssibility

        "Audio" ->
            Audio

        "Media" ->
            Media

        "Art" ->
            Art

        "Design" ->
            Design

        "Concept" ->
            Concept

        "Unknown" ->
            Unknown

        "Product" ->
            Product

        "Teaching" ->
            Teaching

        "Testing" ->
            Testing

        _ ->
            Unknown


categoryToBackground c =
    case c of
        Art ->
            colourCategory1

        Design ->
            colourCategory1

        UI ->
            colourCategory2

        Acesssibility ->
            colourCategory2

        Charts ->
            colourCategory3

        Graphs ->
            colourCategory3

        Visualisation ->
            colourCategory3

        Maps ->
            colourCategory3

        Animation ->
            colourCategory4

        Graphics ->
            colourCategory4

        WebGL ->
            colourCategory4

        Media ->
            colourCategory4

        Audio ->
            colourCategory4

        Games ->
            colourCategory4

        DatesTime ->
            colourCategory5

        ElmPhilosophy ->
            colourCategory6

        Community ->
            colourCategory6

        Meta ->
            colourCategory6

        PannelDiscussion ->
            colourCategory6

        Keynote ->
            colourCategory6

        Learn ->
            colourCategory7

        Guide ->
            colourCategory7

        Concept ->
            colourCategory7

        Interop ->
            colourCategory7

        Testing ->
            colourCategory7

        Teaching ->
            colourCategory7

        ExperienceReport ->
            colourCategory8

        Hobby ->
            colourCategory8

        Product ->
            colourCategory8

        Project ->
            colourCategory8

        Robotics ->
            colourCategory8

        Commercial ->
            colourCategory8

        Unknown ->
            colourCategory9
