module Site exposing (config, head, manifest)

import BackendTask
import BackendTask.Helpers exposing (..)
import Examples
import Head
import Helpers exposing (..)
import MimeType
import Pages.Manifest as Manifest
import Pages.Url
import Route
import SiteConfig exposing (SiteConfig)
import UrlPath exposing (UrlPath)


type alias Data =
    ()


config : SiteConfig
config =
    { canonicalUrl = "https://elmcraft.org"
    , head = head
    }


head : BTask (List Head.Tag)
head =
    [ Head.icon [ ( 512, 512 ) ] MimeType.Png (Pages.Url.fromPath <| UrlPath.fromString "images/favicon.png")
    , Head.sitemapLink "/sitemap.xml"
    ]
        |> BackendTask.succeed


manifest : BTask Manifest.Config
manifest =
    Manifest.init
        { name = "Elmcraft"
        , description = "The place for all things Elm"
        , startUrl = Route.SPLAT__ { splat = [] } |> Route.toPath
        , icons =
            [ { src = Pages.Url.fromPath <| UrlPath.fromString "images/favicon.png"
              , sizes = [ ( 512, 512 ) ]
              , mimeType = Just MimeType.Png
              , purposes = [ Manifest.IconPurposeAny ]
              }
            ]
        }
        |> BackendTask.succeed
