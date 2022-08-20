module Site exposing (config)

import DataSource
import Examples
import Head
import Helpers exposing (..)
import MimeType
import Pages.Manifest as Manifest
import Pages.Url
import Path
import Route
import SiteConfig exposing (SiteConfig)


type alias Data =
    ()


config : SiteConfig Data
config =
    { data = data
    , canonicalUrl = "https://elmcraft.org"
    , manifest = manifest
    , head = head
    }


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


head : Data -> List Head.Tag
head static =
    [ Head.icon [ ( 512, 512 ) ] MimeType.Png (Pages.Url.fromPath <| Path.fromString "images/favicon.png")
    , Head.sitemapLink "/sitemap.xml"
    ]


manifest : Data -> Manifest.Config
manifest static =
    Manifest.init
        { name = "Elmcraft"
        , description = "The place for all things Elm"
        , startUrl = Route.SPLAT__ { splat = [] } |> Route.toPath
        , icons =
            [ { src = Pages.Url.fromPath <| Path.fromString "images/favicon.png"
              , sizes = [ ( 512, 512 ) ]
              , mimeType = Just MimeType.Png
              , purposes = [ Manifest.IconPurposeAny ]
              }
            ]
        }
