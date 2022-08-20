module RouteCommon exposing (..)

import DataSource.Meta exposing (..)
import Element exposing (Element)
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.Url
import Path
import Timestamps exposing (Timestamps)
import Types


type alias Data =
    { ui : Types.Model -> Types.GlobalData -> List (Element Types.Msg)
    , meta : Meta
    , timestamps : Timestamps
    , global : Types.GlobalData
    }


type alias RouteParams =
    { splat : List String }


head : StaticPayload Data routeParams -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elmcraft"
        , image = seoImage
        , description = static.data.meta.description
        , locale = Nothing
        , title = static.data.meta.title
        }
        |> Seo.website


seoImage =
    { url = Path.fromString "/images/elmcraft-logo.png" |> Pages.Url.fromPath
    , alt = "Elmcraft logo"
    , dimensions = Nothing
    , mimeType = Nothing
    }
