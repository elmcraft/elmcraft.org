port module Shared exposing (..)

import Browser.Dom
import Browser.Events
import Browser.Navigation
import DataSource
import DataSource.Notion
import Dict
import Element exposing (..)
import Html exposing (Html)
import List.Extra as List
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import Task
import Templates.Videos
import Theme
import Types exposing (..)
import Url
import View exposing (View)


port setDev : (Bool -> msg) -> Sub msg


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    }


type alias Msg =
    Types.Msg


type alias Data =
    { videos : List Video }


type alias SharedMsg =
    Types.SharedMsg


type alias Model =
    Types.Model


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path : { path : Path, query : Maybe String, fragment : Maybe String }
            , metadata : Maybe Route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
    -- @TODO need a better way to inject this isDev var...
    ( Types.init { isDev = False, key = navigationKey }
    , Cmd.batch
        [ Task.perform (\vp -> WindowResized (round vp.viewport.width) (round vp.viewport.height)) Browser.Dom.getViewport
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | navExpanded = False }, Cmd.none )

        SharedMsg globalMsg ->
            ( model, Cmd.none )

        WindowResized width height ->
            ( { model | window = { width = width, height = height } }, Cmd.none )

        SetDev bool ->
            ( { model | isDev = bool }, Cmd.none )

        NewTime newTime ->
            -- ( { model | currentTime = newTime }, Cmd.none )
            ( model, Cmd.none )

        CookieConsentValueReceived consented ->
            ( { model
                | cookieConsent =
                    case consented of
                        Just True ->
                            ConsentApproved

                        Just False ->
                            ConsentRejected

                        Nothing ->
                            ConsentAsk
              }
            , Cmd.none
            )

        CookieConsentSet bool ->
            ( { model
                | cookieConsent =
                    case bool of
                        True ->
                            ConsentApproved

                        False ->
                            ConsentRejected
              }
              -- , cookieConsentSet bool
            , Cmd.none
            )

        ToggleNav ->
            ( { model | navExpanded = not model.navExpanded }, Cmd.none )

        ClearNav ->
            ( { model | navExpanded = False, navItemExpanded = Dict.empty }, Cmd.none )

        ToggleNavItem title ->
            ( { model
                | navItemExpanded =
                    model.navItemExpanded
                        |> Dict.update title
                            (\mv ->
                                case mv of
                                    Just b ->
                                        Just <| not b

                                    Nothing ->
                                        Just True
                            )
              }
            , Cmd.none
            )

        -- Videos
        VideosAddCategoryFilter category ->
            -- ( { model | appliedVideoFilters = category :: model.appliedVideoFilters |> List.uniqueBy Data.Videos.categoryToString }, Cmd.none )
            ( { model | appliedVideoFilters = [ category ] }
            , model.key |> Maybe.map (\key -> Browser.Navigation.pushUrl key "/media/videos") |> Maybe.withDefault Cmd.none
            )

        VideosRemoveCategoryFilter category ->
            ( { model | appliedVideoFilters = model.appliedVideoFilters |> List.filter (\category_ -> category_ /= category) }, Cmd.none )

        Noop ->
            ( model, Cmd.none )

        Debug ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.batch
        [ Browser.Events.onResize Types.WindowResized
        , setDev SetDev
        ]


data : DataSource.DataSource Data
data =
    -- @TODO figure out how we can use this globally and swap for SPLAT__ usage of Notion.getVideos
    -- Notion.getVideos
    --     |> DataSource.map (\videos -> { videos = videos })
    DataSource.succeed { videos = [] }


view :
    Data
    ->
        { path : Path
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { title = pageView.title
    , body =
        -- @NOTE: the sharedData is not helpful here, as pageView already contains rendered page
        Theme.view { page = page, pageView = pageView, sharedData = sharedData } toMsg model pageView
    }
