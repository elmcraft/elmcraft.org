module DataSource.ElmTown exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import Iso8601
import OptimizedDecoder exposing (..)
import OptimizedDecoder.Pipeline exposing (optional, required)
import Pages.Secrets as Secrets
import Serialize as S
import Time


episodes : DataSource (List Episode)
episodes =
    withElmTownPodcasts podcastEpisodesDecoder
        |> DataSource.distillSerializeCodec "elmTownEpisodes" (S.list episodeCodec)


episodesTotal : DataSource Int
episodesTotal =
    withElmTownPodcasts podcastEpisodesTotalDecoder
        |> DataSource.distillSerializeCodec "elmTownPodcastsEpisodesTotal" S.int


episodeLatest : DataSource Episode
episodeLatest =
    withElmTownPodcasts postcastEpisodeLatestDecoder
        |> DataSource.distillSerializeCodec "elmTownEpisodeLatest" episodeCodec


withElmTownPodcasts : Decoder a -> DataSource a
withElmTownPodcasts decoder =
    DataSource.Http.request
        (Secrets.succeed
            -- { url = "https://api.simplecast.com/podcasts/95e70bbb-d8ba-4137-9f3a-077d493167ec/episodes?status=published"
            { url = "https://api.simplecast.com/podcasts/95e70bbb-d8ba-4137-9f3a-077d493167ec/episodes?status=published&sort=latest&search="
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
    field "collection" (list episodeDecoder)


episodeCodec =
    S.record Episode
        |> S.field .title S.string
        |> S.field .description S.string
        |> S.field .url S.string
        |> S.field .number S.int
        |> S.field .published timeCodec
        |> S.finishRecord


timeCodec : S.Codec String Time.Posix
timeCodec =
    S.int
        |> S.mapValid
            (\i -> Ok <| Time.millisToPosix i)
            Time.posixToMillis



-- New


episodeDecoder =
    succeed Episode
        |> required "title" string
        |> optional "description" string ""
        |> required "slug" (string |> map (\slug -> "https://elm.town/episodes/" ++ slug))
        |> optional "number" int 0
        |> required "published_at" (string |> map (Iso8601.toTime >> Result.withDefault (Time.millisToPosix 0)))
