module DataSource.PodcastRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Helpers
import DataSource.Http
import OptimizedDecoder as Optimized
import Pages.Secrets as Secrets
import Xml.Decode exposing (..)


elmRadioPodcasts : DataSource (List Episode)
elmRadioPodcasts =
    withElmRadioPodcastsUnoptimized podcastEpisodesDecoder


elmRadioPodcastsEpisodesTotal : DataSource Int
elmRadioPodcastsEpisodesTotal =
    withElmRadioPodcastsUnoptimized podcastEpisodesTotalDecoder
        |> DataSource.Helpers.distillInt "elmRadioPodcastsEpisodesTotal"


elmRadioPodcastsEpisodeLatest : DataSource Episode
elmRadioPodcastsEpisodeLatest =
    withElmRadioPodcastsUnoptimized postcastEpisodeLatestDecoder


withElmRadioPodcastsUnoptimized : Decoder a -> DataSource a
withElmRadioPodcastsUnoptimized decoder =
    DataSource.Http.unoptimizedRequest
        (Secrets.succeed
            { url = "https://elm-radio.com/feed.xml"
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        (DataSource.Http.expectString (decodeString decoder))


withElmRadioPodcasts : Decoder a -> DataSource a
withElmRadioPodcasts decoder =
    DataSource.Http.request
        (Secrets.succeed
            { url = "https://elm-radio.com/feed.xml"
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        (asOptimizedDecoder decoder)


asOptimizedDecoder : Decoder a -> Optimized.Decoder a
asOptimizedDecoder decoder =
    -- @TODO this doesn't do what we want it to do, as it always expects JSON but we have a string.
    Optimized.string
        |> Optimized.andThen
            (\s ->
                case decodeString decoder s of
                    Ok value ->
                        Optimized.succeed value

                    Err err ->
                        Optimized.fail err
            )


type alias Episode =
    { title : String
    , published : String
    , link : String
    }


podcastEpisodesTotalDecoder : Decoder Int
podcastEpisodesTotalDecoder =
    podcastEpisodesDecoder |> map (\episodes -> List.length episodes)


postcastEpisodeLatestDecoder : Decoder Episode
postcastEpisodeLatestDecoder =
    podcastEpisodesDecoder
        |> andThen
            (\episodes ->
                case List.head episodes of
                    Just episode ->
                        succeed episode

                    Nothing ->
                        fail "postcastEpisodeLatestDecoder expects at least one episode in the feed, found none"
            )


podcastEpisodesDecoder : Decoder (List Episode)
podcastEpisodesDecoder =
    path [ "channel", "item" ] (list episodeDecoder)


episodeDecoder =
    map3 Episode
        (path [ "title" ] (single string))
        (path [ "pubDate" ] (single string))
        (path [ "link" ] (single string))
