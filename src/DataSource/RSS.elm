module DataSource.RSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import OptimizedDecoder as Optimized
import Pages.Secrets as Secrets
import Serialize as S
import Xml.Decode exposing (..)


items : String -> DataSource (List Item)
items url =
    withFeed url itemsDecoder
        |> DataSource.distillSerializeCodec ("items:" ++ url) (S.list itemCodec)


itemsTotal : String -> DataSource Int
itemsTotal url =
    withFeed url totalDecoder
        |> DataSource.distillSerializeCodec ("itemTotal:" ++ url) S.int


itemLatest : String -> DataSource Item
itemLatest url =
    withFeed url latestItemDecoder
        |> DataSource.distillSerializeCodec ("itemLatest:" ++ url) itemCodec


itemsLatest : String -> Int -> DataSource (List Item)
itemsLatest url count =
    withFeed url itemsDecoder
        |> DataSource.map (List.take count)
        |> DataSource.distillSerializeCodec ("itemLatest:" ++ String.fromInt count ++ ":" ++ url) (S.list itemCodec)


withFeed : String -> Decoder a -> DataSource a
withFeed url decoder =
    DataSource.Http.unoptimizedRequest
        (Secrets.succeed
            { url = url
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        (DataSource.Http.expectString (decodeString decoder))


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
