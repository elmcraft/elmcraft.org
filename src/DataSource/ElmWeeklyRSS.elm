module DataSource.ElmWeeklyRSS exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Helpers exposing (..)
import BackendTask.Http
import FatalError
import Json.Decode as Optimized
import Xml.Decode as Xml


type alias Newsletter =
    { title : String
    , description : String
    , published : String
    , link : String
    }


newsletters : BTask (List Newsletter)
newsletters =
    withNewsletters itemsDecoder


newslettersTotal : BTask Int
newslettersTotal =
    withNewsletters totalDecoder


newsletterLatest : BTask Newsletter
newsletterLatest =
    withNewsletters latestNewsletterDecoder


withNewsletters : Xml.Decoder a -> BTask a
withNewsletters decoder =
    BackendTask.Http.request
        -- This is the canonical URL but it does a redirect that shows HTML and confuses our decoder...
        -- { url = "https://www.elmweekly.nl/?format=rss"
        { url = "https://www.elmweekly.nl/feed"
        , method = "GET"
        , headers = []
        , body = BackendTask.Http.emptyBody
        , retries = Just 2
        , timeoutInMs = Just 5000
        }
        BackendTask.Http.expectString
        |> BackendTask.allowFatal
        |> BackendTask.andThen (Xml.decodeString decoder >> fromResultFatal)


totalDecoder : Xml.Decoder Int
totalDecoder =
    itemsDecoder |> Xml.map (\episodes -> List.length episodes)


latestNewsletterDecoder : Xml.Decoder Newsletter
latestNewsletterDecoder =
    itemsDecoder
        |> Xml.andThen
            (\episodes ->
                case List.head episodes of
                    Just episode ->
                        Xml.succeed episode

                    Nothing ->
                        Xml.fail "latestNewsletterDecoder expects at least one item in the feed, found none"
            )


itemsDecoder : Xml.Decoder (List Newsletter)
itemsDecoder =
    Xml.path [ "channel", "item" ] (Xml.list newsletterDecoder)


newsletterDecoder =
    Xml.map4 Newsletter
        (Xml.path [ "title" ] (Xml.single Xml.string))
        (Xml.path [ "description" ] (Xml.single Xml.string))
        (Xml.path [ "pubDate" ] (Xml.single Xml.string))
        (Xml.path [ "link" ] (Xml.single Xml.string))
