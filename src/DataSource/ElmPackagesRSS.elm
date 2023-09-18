module DataSource.ElmPackagesRSS exposing (..)

import BackendTask.Helpers exposing (..)
import DataSource.RSS as RSS


url =
    "https://releases.elm.dmy.fr/.rss"


packages : BTask (List RSS.Item)
packages =
    RSS.items url


packagesTotal : BTask Int
packagesTotal =
    RSS.itemsTotal url


packagesLatest : Int -> BTask (List RSS.Item)
packagesLatest count =
    RSS.itemsLatest url count
