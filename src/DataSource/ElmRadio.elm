module DataSource.ElmRadio exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Helpers exposing (..)
import BackendTask.Http
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (required)
import Time


type alias Episode =
    { title : String
    , description : String
    , url : String
    , number : Int
    , published : Time.Posix
    }


episodes : BTask (List Episode)
episodes =
    withElmRadioPodcasts podcastEpisodesDecoder


episodesTotal : BTask Int
episodesTotal =
    withElmRadioPodcasts podcastEpisodesTotalDecoder


episodeLatest : BTask Episode
episodeLatest =
    withElmRadioPodcasts postcastEpisodeLatestDecoder


withElmRadioPodcasts : Decoder a -> BTask a
withElmRadioPodcasts decoder =
    BackendTask.Http.get "https://elm-radio.com/episodes.json" (BackendTask.Http.expectJson decoder)
        |> BackendTask.allowFatal


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
