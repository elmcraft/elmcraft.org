module DataSource.ElmRadio exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (required)
import Time


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
    DataSource.Http.get "https://elm-radio.com/episodes.json" decoder


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
    list episodeDecoder



-- New


episodeDecoder =
    succeed Episode
        |> required "title" string
        |> required "description" string
        |> required "url" string
        |> required "number" int
        |> required "published" (int |> map Time.millisToPosix)
