module DataSource.ElmPackagesRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.RSS as RSS


url =
    "https://releases.elm.dmy.fr/.rss"


packages : DataSource (List RSS.Item)
packages =
    RSS.items url


packagesTotal : DataSource Int
packagesTotal =
    RSS.itemsTotal url


packagesLatest : Int -> DataSource (List RSS.Item)
packagesLatest count =
    RSS.itemsLatest url count
