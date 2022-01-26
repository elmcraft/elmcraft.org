module DataSource.ElmWeeklyRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import Json.Decode as Optimized
import Pages.Secrets as Secrets
import Xml.Decode exposing (..)


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


withNewsletters : Decoder a -> DataSource a
withNewsletters decoder =
    DataSource.Http.unoptimizedRequest
        (Secrets.succeed
            -- This is the canonical URL but it does a redirect that shows HTML and confuses our decoder...
            -- { url = "https://www.elmweekly.nl/?format=rss"
            { url = "https://s3.amazonaws.com/revue/accounts/rss_feeds/000/046/105/original/rss_feed_46105.xml"
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        (DataSource.Http.expectString (decodeString decoder))


totalDecoder : Decoder Int
totalDecoder =
    itemsDecoder |> map (\episodes -> List.length episodes)


latestNewsletterDecoder : Decoder Newsletter
latestNewsletterDecoder =
    itemsDecoder
        |> andThen
            (\episodes ->
                case List.head episodes of
                    Just episode ->
                        succeed episode

                    Nothing ->
                        fail "latestNewsletterDecoder expects at least one item in the feed, found none"
            )


itemsDecoder : Decoder (List Newsletter)
itemsDecoder =
    path [ "channel", "item" ] (list newsletterDecoder)


newsletterDecoder =
    map4 Newsletter
        (path [ "title" ] (single string))
        (path [ "description" ] (single string))
        (path [ "pubDate" ] (single string))
        (path [ "link" ] (single string))
