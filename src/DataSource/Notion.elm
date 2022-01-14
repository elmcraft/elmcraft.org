module DataSource.Notion exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import DataStatic.Conferences exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as E
import Pages.Secrets as Secrets
import Serialize as S
import Theme.Videos exposing (..)
import Types exposing (..)



-- curl 'https://api.notion.com/v1/databases/22332946dc144ade9cf97174ea0ecdea/query' \
--   -H 'Authorization: Bearer secret_OXpMW30Ddljjh5sarOqFUnZkj2kyQ4qQjol7DR5INB8' \
--   -H 'Notion-Version: 2021-08-16' | jq


videosDbQueryReq body =
    Secrets.succeed
        (\bearer ->
            { url = "https://api.notion.com/v1/databases/edeac665f6f8436e89aacc6482a0690e/query"
            , method = "POST"
            , headers =
                [ ( "Authorization", bearer )
                , ( "Notion-Version", "2021-08-16" )
                ]
            , body = DataSource.Http.jsonBody body
            }
        )
        |> Secrets.with "NOTION_TOKEN"


getVideos : Int -> DataSource (List Video)
getVideos number =
    -- DataSource.Http.request
    DataSource.Http.unoptimizedRequest
        (videosDbQueryReq <|
            E.object
                [ ( "page_size", E.int number )
                , defaultSort
                ]
        )
        -- decodeNotionVideos
        (DataSource.Http.expectUnoptimizedJson decodeNotionVideos)
        |> DataSource.distillSerializeCodec "getVideos" (S.list videoCodec)


defaultSort : ( String, E.Value )
defaultSort =
    ( "sorts"
    , E.list identity
        [ E.object
            [ ( "property", E.string "Year" )
            , ( "direction", E.string "descending" )
            ]
        ]
    )


getVideosCount : DataSource Int
getVideosCount =
    recursiveGetVideos Nothing
        |> DataSource.map List.length
        |> DataSource.distillSerializeCodec "getVideosCount" S.int


recursiveGetVideos : Maybe String -> DataSource (List Video)
recursiveGetVideos startCursor =
    getVideosResponse startCursor
        |> DataSource.andThen
            (\response ->
                case response.nextCursor of
                    Just nextCursor ->
                        recursiveGetVideos (Just nextCursor)
                            |> DataSource.map (List.append response.videos)

                    Nothing ->
                        DataSource.succeed response.videos
            )
        |> DataSource.map (List.filter (\v -> v.name /= ""))


getVideosResponse : Maybe String -> DataSource VideosResponse
getVideosResponse startCursor =
    -- DataSource.Http.request
    DataSource.Http.unoptimizedRequest
        (videosDbQueryReq <|
            case startCursor of
                Just cursor ->
                    E.object
                        [ ( "start_cursor", E.string cursor )
                        , defaultSort
                        ]

                Nothing ->
                    E.object []
        )
        -- decodeNotionVideosResponse
        (DataSource.Http.expectUnoptimizedJson decodeNotionVideosResponse)


decodeNotionVideos : Decoder (List Video)
decodeNotionVideos =
    field "results" (list decodeVideo)


decodeNotionVideosResponse : Decoder VideosResponse
decodeNotionVideosResponse =
    succeed VideosResponse
        |> required "results" (list decodeVideo)
        |> optional "next_cursor" (maybe string) Nothing


type alias VideosResponse =
    { videos : List Video
    , nextCursor : Maybe String
    }


videoCodec =
    S.record Video
        |> S.field .name S.string
        |> S.field .url S.string
        |> S.field .speaker S.string
        |> S.field .event eventCodec
        |> S.field .year S.string
        |> S.field .categories (S.list categoryCodec)
        |> S.field .description S.string
        |> S.finishRecord


eventCodec : S.Codec e Event
eventCodec =
    S.customType
        (\e1 e2 e3 value ->
            case value of
                Conf conf ->
                    e1 conf

                OnlineMeetup s ->
                    e2 s

                EventUnknown s ->
                    e3 s
        )
        |> S.variant1 Conf conferenceCodec
        |> S.variant1 OnlineMeetup S.string
        |> S.variant1 EventUnknown S.string
        |> S.finishCustomType


conferenceCodec : S.Codec e Conference
conferenceCodec =
    S.customType
        (\elmConf2016 elmEurope2017 elmConf2017 esloElmDay2017 elmEurope2018 elmConf2018 esloElmDay2019 elmintheSpring2019 elmEurope2019 elmConf2019 elmJapan2020 elmConf2020 elmintheSpring2020 value ->
            case value of
                ElmConf2016 ->
                    elmConf2016

                ElmEurope2017 ->
                    elmEurope2017

                ElmConf2017 ->
                    elmConf2017

                OsloElmDay2017 ->
                    esloElmDay2017

                ElmEurope2018 ->
                    elmEurope2018

                ElmConf2018 ->
                    elmConf2018

                OsloElmDay2019 ->
                    esloElmDay2019

                ElmintheSpring2019 ->
                    elmintheSpring2019

                ElmEurope2019 ->
                    elmEurope2019

                ElmConf2019 ->
                    elmConf2019

                ElmJapan2020 ->
                    elmJapan2020

                ElmConf2020 ->
                    elmConf2020

                ElmintheSpring2020 ->
                    elmintheSpring2020
        )
        |> S.variant0 ElmConf2016
        |> S.variant0 ElmEurope2017
        |> S.variant0 ElmConf2017
        |> S.variant0 OsloElmDay2017
        |> S.variant0 ElmEurope2018
        |> S.variant0 ElmConf2018
        |> S.variant0 OsloElmDay2019
        |> S.variant0 ElmintheSpring2019
        |> S.variant0 ElmEurope2019
        |> S.variant0 ElmConf2019
        |> S.variant0 ElmJapan2020
        |> S.variant0 ElmConf2020
        |> S.variant0 ElmintheSpring2020
        |> S.finishCustomType


categoryCodec : S.Codec e Category
categoryCodec =
    S.customType
        (\elmPhilosophy iconic keynote pannelDiscussion guide introduction learn community meta commercial hobby experienceReport interop project uI animation visualisation charts graphics games webGL graphs maps datesTime robotics acesssibility audio media art design concept technique unknown product teaching testing value ->
            case value of
                ElmPhilosophy ->
                    elmPhilosophy

                Iconic ->
                    iconic

                Keynote ->
                    keynote

                PannelDiscussion ->
                    pannelDiscussion

                Guide ->
                    guide

                Introduction ->
                    introduction

                Learn ->
                    learn

                Community ->
                    community

                Meta ->
                    meta

                Commercial ->
                    commercial

                Hobby ->
                    hobby

                ExperienceReport ->
                    experienceReport

                Interop ->
                    interop

                Project ->
                    project

                UI ->
                    uI

                Animation ->
                    animation

                Visualisation ->
                    visualisation

                Charts ->
                    charts

                Graphics ->
                    graphics

                Games ->
                    games

                WebGL ->
                    webGL

                Graphs ->
                    graphs

                Maps ->
                    maps

                DatesTime ->
                    datesTime

                Robotics ->
                    robotics

                Acesssibility ->
                    acesssibility

                Audio ->
                    audio

                Media ->
                    media

                Art ->
                    art

                Design ->
                    design

                Concept ->
                    concept

                Technique ->
                    technique

                Unknown ->
                    unknown

                Product ->
                    product

                Teaching ->
                    teaching

                Testing ->
                    testing
        )
        |> S.variant0 ElmPhilosophy
        |> S.variant0 Iconic
        |> S.variant0 Keynote
        |> S.variant0 PannelDiscussion
        |> S.variant0 Guide
        |> S.variant0 Introduction
        |> S.variant0 Learn
        |> S.variant0 Community
        |> S.variant0 Meta
        |> S.variant0 Commercial
        |> S.variant0 Hobby
        |> S.variant0 ExperienceReport
        |> S.variant0 Interop
        |> S.variant0 Project
        |> S.variant0 UI
        |> S.variant0 Animation
        |> S.variant0 Visualisation
        |> S.variant0 Charts
        |> S.variant0 Graphics
        |> S.variant0 Games
        |> S.variant0 WebGL
        |> S.variant0 Graphs
        |> S.variant0 Maps
        |> S.variant0 DatesTime
        |> S.variant0 Robotics
        |> S.variant0 Acesssibility
        |> S.variant0 Audio
        |> S.variant0 Media
        |> S.variant0 Art
        |> S.variant0 Design
        |> S.variant0 Concept
        |> S.variant0 Technique
        |> S.variant0 Unknown
        |> S.variant0 Product
        |> S.variant0 Teaching
        |> S.variant0 Testing
        |> S.finishCustomType



--
-- Fusion
-- https://api.notion.com/v1/databases/22332946dc144ade9cf97174ea0ecdea/query
-- Authorization: Bearer secret_OXpMW30Ddljjh5sarOqFUnZkj2kyQ4qQjol7DR5INB8
-- Notion-Version: 2021-08-16
-- {}


decodeVideo =
    succeed Video
        |> requiredAt [ "properties", "Name", "title" ] decodeRichText
        |> optionalAt [ "properties", "URL", "url" ] string ""
        |> requiredAt [ "properties", "Author", "rich_text" ] decodeRichText
        |> requiredAt [ "properties", "Event", "select" ] (decodeSelectText |> map decodeEvent)
        |> requiredAt [ "properties", "Year", "select" ] decodeSelectText
        |> requiredAt [ "properties", "Categories", "multi_select" ] (list decodeCategory)
        |> requiredAt [ "properties", "Description", "rich_text" ] decodeRichText


decodeRichText : Decoder String
decodeRichText =
    list (at [ "text", "content" ] string)
        |> map (List.head >> Maybe.withDefault "")


decodeSelectText : Decoder String
decodeSelectText =
    maybe (field "name" (nullable string))
        |> map (Maybe.withDefault Nothing >> Maybe.withDefault "")


decodeEvent s =
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

        string ->
            EventUnknown string


decodeCategory =
    field "name" string
        |> map categoryFromString
