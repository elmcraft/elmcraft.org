module DataSource.ElmWeeklyRSS exposing (..)

import DataSource exposing (DataSource)
import DataSource.Http
import DataSource.RSS as RSS
import OptimizedDecoder as Optimized
import Pages.Secrets as Secrets
import Serialize as S
import Xml.Decode exposing (..)


url =
    "https://www.elmweekly.nl/feed"


newsletters : DataSource (List RSS.Item)
newsletters =
    RSS.items url


newslettersTotal : DataSource Int
newslettersTotal =
    RSS.itemsTotal url


newsletterLatest : DataSource RSS.Item
newsletterLatest =
    RSS.itemLatest url
