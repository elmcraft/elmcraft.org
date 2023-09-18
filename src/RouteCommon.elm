module RouteCommon exposing (..)

import DataSource.Meta exposing (..)
import Element exposing (Element)
import Head
import Head.Seo as Seo
import Pages.Url
import RouteBuilder exposing (App)
import Timestamps exposing (Timestamps)
import Types
import UrlPath


type alias Data =
    { meta : Meta
    , timestamps : Timestamps
    , global : Types.GlobalData
    , rawMarkdown : String
    }


type alias RouteParams =
    { splat : List String }


head : App Data actionData routeParams -> List Head.Tag
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
    { url = UrlPath.fromString "/images/elmcraft-logo.png" |> Pages.Url.fromPath
    , alt = "Elmcraft logo"
    , dimensions = Nothing
    , mimeType = Nothing
    }
