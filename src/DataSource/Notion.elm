module DataSource.Notion exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.Helpers exposing (..)
import BackendTask.Http
import DataStatic.Conferences exposing (..)
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (..)
import Json.Encode as E
import Theme.Videos exposing (..)
import Types exposing (..)



-- curl 'https://api.notion.com/v1/databases/22332946dc144ade9cf97174ea0ecdea/query' \
--   -H 'Authorization: Bearer secret_OXpMW30Ddljjh5sarOqFUnZkj2kyQ4qQjol7DR5INB8' \
--   -H 'Notion-Version: 2021-08-16' | jq


videosDbQueryReq :
    E.Value
    ->
        BTask
            { url : String
            , method : String
            , headers : List ( String, String )
            , body : BackendTask.Http.Body
            , retries : Maybe Int
            , timeoutInMs : Maybe Int
            }
videosDbQueryReq body =
    BackendTask.Env.expect "NOTION_TOKEN"
        |> BackendTask.map
            (\bearer ->
                { url = "https://api.notion.com/v1/databases/edeac665f6f8436e89aacc6482a0690e/query"
                , method = "POST"
                , headers =
                    [ ( "Authorization", bearer )
                    , ( "Notion-Version", "2021-08-16" )
                    ]
                , body = BackendTask.Http.jsonBody body
                , retries = Just 5
                , timeoutInMs = Just 10000
                }
            )
        |> BackendTask.allowFatal


getVideos : Int -> BTask (List Video)
getVideos number =
    videosDbQueryReq (E.object [ ( "page_size", E.int number ), defaultSort ])
        |> BackendTask.andThen
            (\req ->
                BackendTask.Http.request req
                    (BackendTask.Http.expectJson decodeNotionVideos)
                    |> BackendTask.allowFatal
            )


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


getVideosCount : BTask Int
getVideosCount =
    recursiveGetVideos Nothing
        |> BackendTask.map List.length


recursiveGetVideos : Maybe String -> BTask (List Video)
recursiveGetVideos startCursor =
    getVideosResponse startCursor
        |> BackendTask.andThen
            (\response ->
                case response.nextCursor of
                    Just nextCursor ->
                        recursiveGetVideos (Just nextCursor)
                            |> BackendTask.map (List.append response.videos)

                    Nothing ->
                        BackendTask.succeed response.videos
            )
        |> BackendTask.map (List.filter (\v -> v.name /= ""))


getVideosResponse : Maybe String -> BTask VideosResponse
getVideosResponse startCursor =
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
        |> BackendTask.andThen
            (\reqBody ->
                BackendTask.Http.request reqBody
                    (BackendTask.Http.expectJson decodeNotionVideosResponse)
                    |> BackendTask.allowFatal
            )


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
