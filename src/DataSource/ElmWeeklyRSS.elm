module DataSource.ElmWeeklyRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import Json.Decode as Optimized
import Xml.Decode as Xml


type alias Newsletter =
    { title : String
    , description : String
    , published : String
    , link : String
    }


newsletters : DataSource (List Newsletter)
newsletters =
    withNewsletters itemsDecoder


newslettersTotal : DataSource Int
newslettersTotal =
    withNewsletters totalDecoder


newsletterLatest : DataSource Newsletter
newsletterLatest =
    withNewsletters latestNewsletterDecoder


withNewsletters : Xml.Decoder a -> DataSource a
withNewsletters decoder =
    DataSource.Http.request
        -- This is the canonical URL but it does a redirect that shows HTML and confuses our decoder...
        -- { url = "https://www.elmweekly.nl/?format=rss"
        { url = "https://s3.amazonaws.com/revue/accounts/rss_feeds/000/046/105/original/rss_feed_46105.xml"
        , method = "GET"
        , headers = []
        , body = DataSource.Http.emptyBody
        }
        DataSource.Http.expectString
        |> DataSource.andThen (Xml.decodeString decoder >> DataSource.fromResult)


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
