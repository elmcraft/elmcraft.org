module DataSource.PodcastRSS exposing (..)

import DataSource
import DataSource.Http
import Pages.Secrets as Secrets
import Types exposing (..)
import Xml.Decode exposing (..)


elmRadioPodcasts : DataSource.DataSource (List Episode)
elmRadioPodcasts =
    withElmRadioPodcasts podcastEpisodesDecoder


elmRadioPodcastsEpisodesTotal : DataSource.DataSource Int
elmRadioPodcastsEpisodesTotal =
    withElmRadioPodcasts podcastEpisodesTotalDecoder


elmRadioPodcastsEpisodeLatest : DataSource.DataSource Episode
elmRadioPodcastsEpisodeLatest =
    withElmRadioPodcasts postcastEpisodeLatestDecoder


withElmRadioPodcasts : Decoder a -> DataSource.DataSource a
withElmRadioPodcasts decoder =
    DataSource.Http.unoptimizedRequest
        (Secrets.succeed
            { url = "https://elm-radio.com/feed.xml"
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        (DataSource.Http.expectString (decodeString decoder))


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
