module Notion exposing (..)

import Data.Conferences exposing (..)
import Data.Videos exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)


decodeNotionVideos : Decoder (List Video)
decodeNotionVideos =
    field "results" (list decodeVideo)


decodeVideo =
    succeed Video
        |> requiredAt [ "properties", "Name", "title", "plain_text" ] string
        |> requiredAt [ "properties", "URL", "url" ] string
        |> requiredAt [ "properties", "Author", "rich_text", "text", "content" ] string
        |> requiredAt [ "properties", "Event", "select", "name" ] decodeEvent
        |> requiredAt [ "properties", "Year", "select", "name" ] string
        |> requiredAt [ "properties", "Categories", "multi_select" ] (list decodeCategory)
        |> requiredAt [ "properties", "Description", "rich_text", "text", "content" ] string


decodeEvent =
    string
        |> map
            (\s ->
                case s of
                    "Elm Conf 2016" ->
                        Conf ElmConf2016

                    "Elm Europe 2017" ->
                        Conf ElmEurope2017

                    "Elm Conf 2017" ->
                        Conf ElmConf2017

                    "Oslo Elm Day 2017" ->
                        Conf OsloElmDay2017

                    "Elm Europe 2018" ->
                        Conf ElmEurope2018

                    "Elm Conf 2018" ->
                        Conf ElmConf2018

                    "Oslo Elm Day 2019" ->
                        Conf OsloElmDay2019

                    "Elm in the Spring 2019" ->
                        Conf ElmintheSpring2019

                    "Elm Europe 2019" ->
                        Conf ElmEurope2019

                    "Elm Conf 2019" ->
                        Conf ElmConf2019

                    "Elm Japan 2020" ->
                        Conf ElmJapan2020

                    "Elm Conf 2020" ->
                        Conf ElmConf2020

                    "Elm in the Spring 2020" ->
                        Conf ElmintheSpring2020

                    _ ->
                        EventUnknown
            )


decodeCategory =
    field "name" string
        |> map
            (\s ->
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
            )
