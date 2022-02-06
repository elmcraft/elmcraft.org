module DataSource.ElmRadio exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import Json.Decode as Optimized
import Xml.Decode exposing (..)


episodes : DataSource (List Episode)
episodes =
    withElmRadioPodcasts podcastEpisodesDecoder


episodesTotal : DataSource Int
episodesTotal =
    withElmRadioPodcasts podcastEpisodesTotalDecoder


episodeLatest : DataSource Episode
episodeLatest =
    withElmRadioPodcasts postcastEpisodeLatestDecoder


withElmRadioPodcasts : Decoder a -> DataSource a
withElmRadioPodcasts decoder =
    DataSource.Http.request
        (Secrets.succeed
            { url = "https://elm-radio.com/episodes.json"
            , method = "GET"
            , headers = []
            , body = DataSource.Http.emptyBody
            }
        )
        decoder


type alias Episode =
    { title : String
    , description : String
    , url : String
    , number : Int
    , published : Time.Posix
    }


podcastEpisodesTotalDecoder : Decoder Int
podcastEpisodesTotalDecoder =
    podcastEpisodesDecoder |> map List.length


postcastEpisodeLatestDecoder : Decoder Episode
postcastEpisodeLatestDecoder =
    podcastEpisodesDecoder
        |> andThen
            (\episodes_ ->
                case List.head episodes_ of
                    Just episode ->
                        succeed episode

                    Nothing ->
                        fail "postcastEpisodeLatestDecoder expects at least one item in the feed, found none"
            )


podcastEpisodesDecoder : Decoder (List Episode)
podcastEpisodesDecoder =
    path [ "channel", "item" ] (list episodeDecoder)


episodeDecoder =
    map3 Episode
        (path [ "title" ] (single string))
        (path [ "pubDate" ] (single string))
        (path [ "link" ] (single string))
