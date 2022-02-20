module DataSource.ElmRadio exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import OptimizedDecoder exposing (..)
import OptimizedDecoder.Pipeline exposing (required)
import Pages.Secrets as Secrets
import Serialize as S
import Time


episodes : DataSource (List Episode)
episodes =
    withElmRadioPodcasts podcastEpisodesDecoder
        |> DataSource.distillSerializeCodec "elmRadioEpisodes" (S.list episodeCodec)


episodesTotal : DataSource Int
episodesTotal =
    withElmRadioPodcasts podcastEpisodesTotalDecoder
        |> DataSource.distillSerializeCodec "elmRadioPodcastsEpisodesTotal" S.int


episodeLatest : DataSource Episode
episodeLatest =
    withElmRadioPodcasts postcastEpisodeLatestDecoder
        |> DataSource.distillSerializeCodec "elmRadioEpisodeLatest" episodeCodec


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
    list episodeDecoder


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
        |> required "description" string
        |> required "url" string
        |> required "number" int
        |> required "published" (int |> map Time.millisToPosix)
