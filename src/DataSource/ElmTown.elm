module DataSource.ElmTown exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Helpers exposing (..)
import BackendTask.Http
import Iso8601
import Json.Decode exposing (..)
import Json.Decode.Pipeline exposing (optional, required)
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
    BackendTask.Http.get "https://api.simplecast.com/podcasts/95e70bbb-d8ba-4137-9f3a-077d493167ec/episodes?status=published&sort=latest&search=" (BackendTask.Http.expectJson decoder)
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
    field "collection" (list episodeDecoder)



-- New


episodeDecoder =
    succeed Episode
        |> required "title" string
        |> optional "description" string ""
        |> required "slug" (string |> map (\slug -> "https://elm.town/episodes/" ++ slug))
        |> optional "number" int 0
        |> required "published_at" (string |> map (Iso8601.toTime >> Result.withDefault (Time.millisToPosix 0)))
