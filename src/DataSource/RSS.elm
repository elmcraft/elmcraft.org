module DataSource.RSS exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Helpers exposing (..)
import BackendTask.Http
import Serialize as S
import Xml.Decode exposing (..)


items : String -> BTask (List Item)
items url =
    withFeed url itemsDecoder


itemsTotal : String -> BTask Int
itemsTotal url =
    withFeed url totalDecoder


itemLatest : String -> BTask Item
itemLatest url =
    withFeed url latestItemDecoder


itemsLatest : String -> Int -> BTask (List Item)
itemsLatest url count =
    withFeed url itemsDecoder
        |> BackendTask.map (List.take count)


withFeed : String -> Decoder a -> BTask a
withFeed url decoder =
    BackendTask.Http.get url BackendTask.Http.expectString
        |> BackendTask.allowFatal
        |> BackendTask.andThen (decodeString decoder >> fromResultFatal)


type alias Item =
    { title : String
    , description : String
    , published : String
    , link : String
    }


totalDecoder : Decoder Int
totalDecoder =
    itemsDecoder |> map (\episodes -> List.length episodes)


latestItemDecoder : Decoder Item
latestItemDecoder =
    itemsDecoder
        |> andThen
            (\episodes ->
                case List.head episodes of
                    Just episode ->
                        succeed episode

                    Nothing ->
                        fail "RSS latestItemDecoder expects at least one item in the feed, found none"
            )


itemsDecoder : Decoder (List Item)
itemsDecoder =
    path [ "channel", "item" ] (list itemDecoder)


itemDecoder =
    map4 Item
        (path [ "title" ] (single string))
        (path [ "description" ] (single string))
        (path [ "pubDate" ] (single string))
        (path [ "link" ] (single string))


itemCodec =
    S.record Item
        |> S.field .title S.string
        |> S.field .description S.string
        |> S.field .published S.string
        |> S.field .link S.string
        |> S.finishRecord
