module Page.NotFound exposing (Data, Model, Msg, page)

import DataSource exposing (DataSource)
import Element exposing (..)
import Element.Font as Font
import Head
import Head.Seo as Seo
import Page exposing (Page, PageWithState, StaticPayload)
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Route
import RouteCommon
import Shared
import Theme.UI exposing (..)
import Time
import View exposing (View)


type alias Model =
    ()


type alias Msg =
    Never


type alias RouteParams =
    {}


page : Page RouteParams Data
page =
    Page.single
        { head = head
        , data = data
        }
        |> Page.buildNoState { view = view }


type alias Data =
    ()


data : DataSource Data
data =
    DataSource.succeed ()


head : StaticPayload Data routeParams -> List Head.Tag
head static =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Elmcraft"
        , image = RouteCommon.seoImage
        , description = "TODO"
        , locale = Nothing
        , title = "Page not found"
        }
        |> Seo.website


view :
    Maybe PageUrl
    -> Shared.Model
    -> StaticPayload Data RouteParams
    -> View Msg
view maybeUrl sharedModel static =
    { title = "Page not found"
    , status = Nothing
    , content =
        [ column [ spacing 30 ]
            [ paragraph [] [ text "Whoops! This page doesn't exist." ]
            , paragraph [] [ text "It might have been removed, had its name changed, or is lost at sea." ]
            , paragraph [] [ text "If you think this is a mistake, please let us know!" ]
            , el [ paddingXY 0 20 ] <| buttonLinkPrimary [ Font.size 16, paddingXY 19 11 ] "/" "GO TO THE HOME PAGE"
            ]
        ]
    , route = Route.NotFound
    , timestamps =
        { updated = Time.millisToPosix 0
        , created = Time.millisToPosix 0
        }
    , published = True
    }
