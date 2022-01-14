module DataSource.PodcastRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import OptimizedDecoder as Optimized
import Pages.Secrets as Secrets
import Serialize as S
import Xml.Decode exposing (..)


episodes : DataSource (List Episode)
episodes =
    withElmRadioPodcastsUnoptimized podcastEpisodesDecoder
        |> DataSource.distillSerializeCodec "elmRadioEpisodeLatest" (S.list episodeCodec)


episodesTotal : DataSource Int
episodesTotal =
    withElmRadioPodcastsUnoptimized podcastEpisodesTotalDecoder
        |> DataSource.distillSerializeCodec "elmRadioPodcastsEpisodesTotal" S.int


episodeLatest : DataSource Episode
episodeLatest =
    withElmRadioPodcastsUnoptimized postcastEpisodeLatestDecoder
        |> DataSource.distillSerializeCodec "elmRadioEpisodeLatest" episodeCodec


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


type alias Episode =
    { title : String
    , published : String
    , link : String
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


episodeCodec =
    S.record Episode
        |> S.field .title S.string
        |> S.field .published S.string
        |> S.field .link S.string
        |> S.finishRecord
