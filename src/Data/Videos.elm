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
    column [ width fill, spacing 4 ]
        [ videoThumbnail video
        , el [ Font.bold ] <| text video.name
        , el [] <| text video.speaker
        , el [] <| text <| eventToString video.event
        , video.categories |> List.map (categoryPill Nothing) |> row [ spacing 5, width fill ]
        ]


categoryPill mCount category =
    let
        pill x =
            ""
    in
    case mCount of
        Just count ->
            row
                [ Border.rounded 10
                , Background.color <| categoryToBackground category
                , paddingXY 6 4
                , Font.size 13
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
                , Font.size 13
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
        Acesssibility ->
            pinkDarker

        Animation ->
            red

        Art ->
            red

        Audio ->
            red

        Charts ->
            red

        Commercial ->
            red

        Community ->
            elmTeal

        Concept ->
            red

        DatesTime ->
            red

        Design ->
            red

        ElmPhilosophy ->
            elmTeal

        ExperienceReport ->
            red

        Games ->
            red

        Graphics ->
            pinkDarker

        Graphs ->
            pinkDarker

        Guide ->
            green

        Hobby ->
            red

        Interop ->
            red

        Keynote ->
            elmTeal

        Learn ->
            green

        Maps ->
            red

        Media ->
            red

        Meta ->
            red

        PannelDiscussion ->
            green

        Product ->
            red

        Project ->
            red

        Robotics ->
            red

        Teaching ->
            red

        Testing ->
            red

        UI ->
            pinkDarker

        Unknown ->
            greyDark

        Visualisation ->
            pinkDarker

        WebGL ->
            pinkDarker
