module Site exposing (config)

import DataSource
import Head
import Helpers exposing (..)
import Pages.Manifest as Manifest
import Route
import SiteConfig exposing (SiteConfig)


type alias Data =
    ()


config : SiteConfig Data
config =
    \_ ->
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
    [-- Head.sitemapLink "/sitemap.xml"
    ]


manifest : Data -> Manifest.Config
manifest static =
    Manifest.init
        { name = "Elmcraft"
        , description = "The place for all things Elm"
        , startUrl = Route.SPLAT__ { splat = [] } |> Route.toPath
        , icons = []
        }
