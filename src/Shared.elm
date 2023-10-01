module Shared exposing (..)

import BackendTask
import BackendTask.Env
import BackendTask.Helpers exposing (..)
import Browser.Dom
import Browser.Events
import Browser.Navigation
import DataSource.Notion
import Dict
import Effect exposing (Effect)
import Element exposing (..)
import Html exposing (Html)
import List.Extra as List
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import Task
import Theme
import Theme.Videos
import Types exposing (..)
import Url
import UrlPath exposing (UrlPath)
import View exposing (View)


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
    { isDev : Bool
    , videos : List Video
    }


type alias SharedMsg =
    Types.SharedMsg


type alias Model =
    Types.Model


init :
    Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : UrlPath
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Effect Msg )
init flags maybePagePath =
    -- @TODO need a better way to inject this isDev var...
    ( Types.init
    , Effect.batch
        [ Task.perform (\vp -> WindowResized (round vp.viewport.width) (round vp.viewport.height)) Browser.Dom.getViewport
            |> Effect.fromCmd
        ]
    )


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        OnPageChange _ ->
            ( { model | navExpanded = False }, Effect.none )

        SharedMsg globalMsg ->
            ( model, Effect.none )

        WindowResized width height ->
            ( { model | window = { width = width, height = height } }, Effect.none )

        NewTime newTime ->
            -- ( { model | currentTime = newTime }, Effect.none )
            ( model, Effect.none )

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
            , Effect.none
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
            , Effect.none
            )

        ToggleNav ->
            ( { model | navExpanded = not model.navExpanded }, Effect.none )

        ClearNav ->
            ( { model | navExpanded = False, navItemExpanded = Dict.empty }, Effect.none )

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
            , Effect.none
            )

        -- Videos
        VideosAddCategoryFilter category ->
            -- ( { model | appliedVideoFilters = category :: model.appliedVideoFilters |> List.uniqueBy Data.Videos.categoryToString }, Effect.none )
            ( { model | appliedVideoFilters = [ category ] }
            , Effect.PushUrl "/media/videos"
            )

        VideosRemoveCategoryFilter category ->
            ( { model | appliedVideoFilters = model.appliedVideoFilters |> List.filter (\category_ -> category_ /= category) }, Effect.none )

        -- ESLint Rules
        EslintToggleCategoryFilter category ->
            ( { model
                | appliedEslintFilter =
                    if Just category == model.appliedEslintFilter then
                        Nothing

                    else
                        Just category
              }
            , Effect.none
            )

        EslintToggleRecommendedFilter ->
            ( { model | appliedEslintRecommendedFilter = not model.appliedEslintRecommendedFilter }
            , Effect.none
            )

        EslintRemoveCategoryFilter ->
            ( { model | appliedEslintFilter = Nothing }, Effect.none )

        Noop ->
            ( model, Effect.none )

        Debug ->
            ( model, Effect.none )


subscriptions : UrlPath -> Model -> Sub Msg
subscriptions _ _ =
    Sub.batch
        [ Browser.Events.onResize Types.WindowResized
        ]


data : BTask Data
data =
    -- @TODO figure out how we can use this globally and swap for SPLAT__ usage of Notion.getVideos
    -- Notion.getVideos
    --     |> DataSource.map (\videos -> { videos = videos })
    map2_
        -- https://docs.netlify.com/configure-builds/environment-variables/
        -- In dev, we can use `CONTEXT=production` to mimic !isDev mode
        (BackendTask.Env.get "CONTEXT")
        -- In Netlify deploys, REVIEW_ID is set to the PR number for any preview deploys, so we treat that as isDev
        (BackendTask.Env.get "REVIEW_ID")
        (\envContext envReviewId ->
            let
                isReview =
                    envReviewId |> Maybe.map (\_ -> True) |> Maybe.withDefault False

                isDev =
                    envContext |> Maybe.map (\c -> c /= "production") |> Maybe.withDefault isReview
            in
            { isDev = isDev
            , videos = []
            }
        )


view :
    Data
    ->
        { path : UrlPath
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : List (Html msg), title : String }
view sharedData page model toMsg pageView =
    { title = pageView.title
    , body =
        -- @NOTE: the sharedData is not helpful here, as pageView already contains rendered page
        [ Theme.view
            { isDev = sharedData.isDev
            , page = page
            , pageView = pageView
            , sharedData = sharedData
            }
            toMsg
            model
            pageView
        ]
    }
