module Notion exposing (..)

-- import Json.Decode exposing (..)
-- import Json.Decode.Pipeline exposing (..)

import Data.Conferences exposing (..)
import Data.Videos exposing (..)
import DataSource.Http
import Json.Encode as E
import OptimizedDecoder exposing (..)
import OptimizedDecoder.Pipeline exposing (..)
import Pages.Secrets as Secrets
import Types exposing (..)


getVideos =
    DataSource.Http.request
        (Secrets.succeed
            { url = "https://api.notion.com/v1/databases/22332946dc144ade9cf97174ea0ecdea/query"
            , method = "POST"
            , headers =
                [ ( "Authorization", "Bearer secret_OXpMW30Ddljjh5sarOqFUnZkj2kyQ4qQjol7DR5INB8" )
                , ( "Notion-Version", "2021-08-16" )
                ]
            , body = DataSource.Http.jsonBody (E.object [])
            }
        )
        decodeNotionVideos


decodeNotionVideos : Decoder (List Video)
decodeNotionVideos =
    field "results" (list decodeVideo)



-- curl 'https://api.notion.com/v1/databases/668d797c-76fa-4934-9b05-ad288df2d136' \
--   -H 'Authorization: Bearer '"$NOTION_API_KEY"'' \
--   -H 'Notion-Version: 2021-05-13'
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
    optionalField "name" (nullable string)
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
