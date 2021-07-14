module Shared exposing (..)

import Browser.Dom
import Browser.Events
import Browser.Navigation
import DataSource
import Dict
import Element
import Html exposing (Html)
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Path exposing (Path)
import SharedTemplate exposing (SharedTemplate)
import Task
import Types exposing (..)
import View exposing (View)


template : SharedTemplate Msg Model Data SharedMsg msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Just OnPageChange
    , sharedMsg = SharedMsg
    }


type alias Msg =
    Types.Msg


type alias Data =
    ()


type alias SharedMsg =
    Types.SharedMsg


type alias Model =
    Types.Model


init :
    Maybe Browser.Navigation.Key
    -> Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : Path
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Cmd Msg )
init navigationKey flags maybePagePath =
    ( Types.initTemporary
    , Cmd.batch
        [ Task.perform (\vp -> WindowResized (round vp.viewport.width) (round vp.viewport.height)) Browser.Dom.getViewport
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "msg" msg of
        OnPageChange _ ->
            ( { model | navExpanded = False }, Cmd.none )

        SharedMsg globalMsg ->
            ( model, Cmd.none )

        WindowResized width height ->
            ( { model | window = { width = width, height = height } }, Cmd.none )

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

        Noop ->
            ( model, Cmd.none )


subscriptions : Path -> Model -> Sub Msg
subscriptions _ _ =
    Sub.batch [ Browser.Events.onResize Types.WindowResized ]


data : DataSource.DataSource Data
data =
    DataSource.succeed ()


view :
    Data
    ->
        { path : Path
        , frontmatter : route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : Html msg, title : String }
view sharedData page model toMsg pageView =
    { title = pageView.title
    , body = pageView.body
    }
