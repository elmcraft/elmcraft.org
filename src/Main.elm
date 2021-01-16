port module Main exposing (main)

import Browser.Dom
import Browser.Events
import Color
import Colors exposing (..)
import Date
import Dict
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Feed
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes
import Json.Decode
import Markdown.Block exposing (ListItem(..))
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer
import Metadata exposing (Metadata)
import Pages exposing (images, pages)
import Pages.Manifest as Manifest
import Pages.Manifest.Category
import Pages.PagePath exposing (PagePath)
import Pages.Platform
import Pages.StaticHttp as StaticHttp
import Palette
import Sitemap_
import Task
import Templates.Footer
import Templates.Markdown
import Templates.Navigation
import Templates.UI exposing (..)
import Time
import Types exposing (..)


port cookieConsentValue : (Maybe Bool -> msg) -> Sub msg


port cookieConsentSet : Bool -> Cmd msg


manifest : Manifest.Config Pages.PathKey
manifest =
    { backgroundColor = Just Color.white
    , categories = [ Pages.Manifest.Category.education ]
    , displayMode = Manifest.Standalone
    , orientation = Manifest.Portrait
    , description = "World of Elmcraft"
    , iarcRatingId = Nothing
    , name = "elmcraft"
    , themeColor = Just Color.white
    , startUrl = pages.index
    , shortName = Just "elmcraft"
    , sourceIcon = images.favicon
    }


type alias PageView =
    Model -> Element Msg


main : Pages.Platform.Program Model Msg Metadata PageView
main =
    Pages.Platform.init
        { init = \_ -> init
        , view =
            \siteMetadata page ->
                StaticHttp.succeed
                    { view = \model viewDocument -> pageView siteMetadata page viewDocument model
                    , head = head page.frontmatter
                    }
        , update = update
        , subscriptions = subscriptions
        , documents = [ markdownDocument ]
        , manifest = manifest
        , canonicalSiteUrl = canonicalSiteUrl
        , onPageChange = Just (\meta -> ClearNav)
        , internals = Pages.internals
        }
        |> Pages.Platform.withFileGenerator generateFiles
        |> Pages.Platform.toProgram


generateFiles :
    List { path : PagePath Pages.PathKey, frontmatter : Metadata, body : String }
    -> StaticHttp.Request (List (Result String { path : List String, content : String }))
generateFiles siteMetadata =
    StaticHttp.succeed
        [ Feed.fileToGenerate { siteTagline = siteTagline, siteUrl = canonicalSiteUrl } siteMetadata |> Ok
        , Sitemap_.build { siteUrl = canonicalSiteUrl } siteMetadata |> Ok
        ]


pageView :
    List ( PagePath Pages.PathKey, Metadata )
    -> { path : PagePath Pages.PathKey, frontmatter : Metadata }
    -> PageView
    -> Model
    -> { title : String, body : Html Msg }
pageView siteMetadata page content model =
    case page.frontmatter of
        Metadata.Homepage metadata ->
            pageView_ page metadata model content

        Metadata.Page metadata ->
            pageView_ page metadata model content


pageView_ page metadata model content =
    { title = metadata.title
    , body =
        layout
            [ width fill
            , Font.size 18
            , Font.family [ Font.typeface Templates.UI.fontFace ]
            , width fill
            ]
        <|
            column
                [ width fill
                ]
                [ Templates.Navigation.navigation model page.path
                , standardCenteredSectionAdaptiveAt
                    1100
                    model
                    white
                    [ Region.mainContent ]
                    [ content model ]
                , Templates.Footer.view model
                ]
    }


markdownDocument :
    { extension : String
    , metadata :
        Json.Decode.Decoder Metadata
    , body : String -> Result error (Model -> Element msg)
    }
markdownDocument =
    { extension = "md"
    , metadata = Metadata.decoder
    , body =
        \markdownBody ->
            Markdown.Parser.parse markdownBody
                -- |> Debug.log "parse result"
                -- @TODO show markdown parsing errors, i.e. malformed html?
                |> Result.withDefault []
                -- |> Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer
                |> (\parsed ->
                        Ok
                            (\model ->
                                parsed
                                    |> Markdown.Renderer.render (Templates.Markdown.renderer model)
                                    |> (\res ->
                                            case res of
                                                Ok elements ->
                                                    elements

                                                Err err ->
                                                    [ text "Oops! Something went wrong rendering this page:", text err ]
                                       )
                                    |> column
                                        [ width fill
                                        ]
                            )
                   )
    }


init : ( Model, Cmd Msg )
init =
    ( { window = { width = 400, height = 800 }
      , cookieConsent = ConsentUnloaded
      , navExpanded = False
      , navItemExpanded = Dict.empty
      }
    , Cmd.batch
        [ Task.perform (\vp -> WindowResized (round vp.viewport.width) (round vp.viewport.height)) Browser.Dom.getViewport
        ]
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- case Debug.log "msg" msg of
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
            , cookieConsentSet bool
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


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Browser.Events.onResize WindowResized
        , cookieConsentValue CookieConsentValueReceived

        -- , Time.every 1000 NewTime
        ]


commonHeadTags : List (Head.Tag Pages.PathKey)
commonHeadTags =
    [ Head.rssLink "/blog/feed.xml"
    , Head.sitemapLink "/sitemap.xml"
    ]



{- Read more about the metadata specs:

   <https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/abouts-cards>
   <https://htmlhead.dev>
   <https://html.spec.whatwg.org/multipage/semantics.html#standard-metadata-names>
   <https://ogp.me/>
-}


head : Metadata -> List (Head.Tag Pages.PathKey)
head metadata =
    commonHeadTags
        ++ (case metadata of
                Metadata.Homepage meta ->
                    Seo.summaryLarge
                        { canonicalUrlOverride = Nothing
                        , siteName = "Elmcraft"
                        , image =
                            { url = images.elmcraftLogo
                            , alt = "Elmcraft Logo"
                            , dimensions = Nothing
                            , mimeType = Nothing
                            }
                        , description = meta.description
                        , locale = Nothing
                        , title = meta.title
                        }
                        |> Seo.website

                Metadata.Page meta ->
                    Seo.summaryLarge
                        { canonicalUrlOverride = Nothing
                        , siteName = "Elmcraft"
                        , image =
                            { url = images.elmcraftLogo
                            , alt = "Elmcraft Logo"
                            , dimensions = Nothing
                            , mimeType = Nothing
                            }
                        , description = meta.description
                        , locale = Nothing
                        , title = meta.title
                        }
                        |> Seo.website
           )


canonicalSiteUrl : String
canonicalSiteUrl =
    "https://elmcraft.org"


siteTagline : String
siteTagline =
    "A place for all things Elm"
