module Site exposing (config)

import DataSource
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



-- type alias SiteConfig =
--     { canonicalUrl : String
--     , head : DataSource (List Head.Tag)
--     }


config : SiteConfig
config =
    { canonicalUrl = "https://elmcraft.org"
    , head = head
    }


head : DataSource.DataSource (List Head.Tag)
head =
    DataSource.succeed
        [-- Head.sitemapLink "/sitemap.xml"
        ]



-- manifest : Data -> Manifest.Config
-- manifest static =
--     Manifest.init
--         { name = "Elmcraft"
--         , description = "The place for all things Elm"
--         , startUrl = Route.SPLAT__ { splat = [] } |> Route.toPath
--         , icons = []
--         }
