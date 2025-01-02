module Theme.Videos exposing (..)

import Colors exposing (..)
import DataStatic.Conferences
import Dict exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes as Html
import Set
import Types exposing (..)


index : Model -> List Video -> Maybe String -> Maybe String -> Element Msg
index model videos mTagged mLimit =
    column [ width fill, spacing 20 ]
        [ text <| String.fromInt (List.length videos) ++ " Elm Videos"
        , videos |> categoryView
        , if List.length model.appliedVideoFilters > 0 then
            wrappedRow [ width fill, spacing 10 ]
                ([ text "Applied filters:"
                 ]
                    ++ (model.appliedVideoFilters
                            |> List.map
                                (\category ->
                                    categoryPillFilter category
                                )
                       )
                )

          else
            none
        , videos
            |> applyFilters model
            |> List.map embed
            |> wrappedRow [ spacing 30 ]
        ]


applyFilters model videos =
    if List.length model.appliedVideoFilters > 0 then
        videos
            |> List.filter
                (\video ->
                    video.categories
                        |> List.any (\category -> List.member category model.appliedVideoFilters)
                )

    else
        videos


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


embed : Video -> Element Msg
embed video =
    el [ alignTop, width fill ] <|
        column
            [ spacing 4
            , width (px 250)
            , centerX
            , alignTop
            ]
            [ videoThumbnail video
            , paragraph [ Font.bold, Font.size 14 ] [ text video.name ]
            , el [ Font.size 12 ] <| text video.speaker
            , el [ Font.size 10 ] <| text <| eventToString video.event
            , video.categories
                |> List.map (categoryPill Nothing)
                |> wrappedRow [ spacing 5, width fill ]
            ]


categoryPill mCount category =
    case mCount of
        Just count ->
            row
                [ Border.rounded 8
                , Background.color <| categoryToBackground category
                , paddingXY 6 4
                , Font.size 12
                , spacing 4
                , Font.color white
                , onClick (VideosAddCategoryFilter category)
                , pointer
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
                , Font.size 12
                , Font.color white
                , onClick (VideosAddCategoryFilter category)
                , pointer
                ]
            <|
                text <|
                    categoryToString category


categoryPillFilter category =
    row
        [ Border.rounded 8
        , Background.color <| categoryToBackground category
        , paddingXY 6 4
        , Font.size 12
        , spacing 4
        , Font.color white
        ]
        [ text <|
            categoryToString category
        , el
            [ Border.rounded 10
            , Background.color white
            , paddingXY 5 2
            , Font.color charcoal
            , onClick (VideosRemoveCategoryFilter category)
            , pointer
            ]
          <|
            text "x"
        ]


eventToString event =
    case event of
        Conf conference ->
            let
                conf =
                    DataStatic.Conferences.conferenceDetails conference
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

            else if String.contains "youtube.com/shorts/" video.url then
                video.url
                    |> String.split "/shorts/"
                    |> List.reverse
                    |> List.head
                    |> Maybe.withDefault ""
                    |> String.split "?si="
                    |> List.head
                    |> Maybe.withDefault ""

            else if String.contains "youtube.com/live/" video.url then
                video.url
                    |> String.split "/live/"
                    |> List.reverse
                    |> List.head
                    |> Maybe.withDefault ""
                    |> String.split "?si="
                    |> List.head
                    |> Maybe.withDefault ""

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
                    |> String.split "?si="
                    |> List.head
                    |> Maybe.withDefault ""

            else
                "unknown"

        thumbnail =
            -- "https://i.ytimg.com/vi/" ++ youtubeId ++ "/hqdefault.jpg"
            "http://img.youtube.com/vi/" ++ youtubeId ++ "/mqdefault.jpg"
    in
    newTabLink
        [ width fill
        , Background.color grey
        , padding 3
        ]
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


categoryToString c =
    case c of
        ElmPhilosophy ->
            "Elm Philosophy"

        Iconic ->
            "Iconic"

        Keynote ->
            "Keynote"

        PanelDiscussion ->
            "Panel Discussion"

        Guide ->
            "Guide"

        Introduction ->
            "Introduction"

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

        Technique ->
            "Technique"

        Unknown s ->
            "Unknown: " ++ s

        Product ->
            "Product"

        Teaching ->
            "Teaching"

        Testing ->
            "Testing"

        LiveStream ->
            "Live Stream"

        Short ->
            "Short"


categoryFromString s =
    case s of
        "Elm Philosophy" ->
            ElmPhilosophy

        "Iconic" ->
            Iconic

        "Keynote" ->
            Keynote

        "Panel Discussion" ->
            PanelDiscussion

        "Guide" ->
            Guide

        "Introduction" ->
            Introduction

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

        "Technique" ->
            Technique

        "Unknown" ->
            Unknown ""

        "Product" ->
            Product

        "Teaching" ->
            Teaching

        "Testing" ->
            Testing

        "Live Stream" ->
            LiveStream

        "Short" ->
            Short

        _ ->
            Unknown s


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

        Iconic ->
            colourCategory6

        Community ->
            colourCategory6

        Meta ->
            colourCategory6

        PanelDiscussion ->
            colourCategory6

        Keynote ->
            colourCategory6

        Learn ->
            colourCategory7

        Introduction ->
            colourCategory7

        Guide ->
            colourCategory7

        Concept ->
            colourCategory7

        Technique ->
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

        LiveStream ->
            colourCategory8

        Short ->
            colourCategory8

        Unknown s ->
            colourCategory9
