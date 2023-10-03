module Theme.All exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Icon
import Markdown.Html
import Pages.Homepage
import Theme.Articles
import Theme.Compare
import Theme.CuratedBy
import Theme.ESLintRules
import Theme.Feature
import Theme.FindYourPath
import Theme.Header
import Theme.QuizIsElmForMe
import Theme.Testimonial
import Theme.UI exposing (..)
import Theme.Videos
import Types exposing (..)


htmlMapping : Types.Model -> Types.GlobalData -> Markdown.Html.Renderer (List (Element Msg) -> Element Msg)
htmlMapping model global =
    Markdown.Html.oneOf
        [ Markdown.Html.tag "img"
            (\src width_ maxWidth_ bg_ content ->
                let
                    attrs =
                        case maxWidth_ of
                            Just maxWidth ->
                                [ maxWidth
                                    |> String.toInt
                                    |> Maybe.map (\w -> width (fill |> maximum w))
                                    |> Maybe.withDefault (width fill)
                                , centerX
                                ]

                            Nothing ->
                                [ width_
                                    |> Maybe.andThen String.toInt
                                    |> Maybe.map (\w -> width (px w))
                                    |> Maybe.withDefault (width fill)
                                ]
                in
                case bg_ of
                    Just bg ->
                        el [ Background.color <| fromHex bg, Border.rounded 10, padding 20 ] <| image attrs { src = src, description = "" }

                    Nothing ->
                        image attrs { src = src, description = "" }
            )
            |> Markdown.Html.withAttribute "src"
            |> Markdown.Html.withOptionalAttribute "width"
            |> Markdown.Html.withOptionalAttribute "maxwidth"
            |> Markdown.Html.withOptionalAttribute "bg"
        , Markdown.Html.tag "header"
            (\src description content ->
                Theme.Header.view model src description content
            )
            |> Markdown.Html.withAttribute "image"
            |> Markdown.Html.withAttribute "imagedescription"
        , Markdown.Html.tag "intro"
            (\content ->
                column [ width fill, Font.color charcoal ]
                    [ column
                        [ centerX
                        , width (shrink |> maximum 900)
                        , paddingXY 30 60
                        , spacing 30
                        , Font.center
                        ]
                        content
                    ]
            )
        , Markdown.Html.tag "featureleft"
            (\src content -> Theme.Feature.leftRaw model src False content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featureleftbordered"
            (\src content -> Theme.Feature.leftRaw model src True content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featureright"
            (\src content -> Theme.Feature.rightRaw model src False content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featurerightbordered"
            (\src content -> Theme.Feature.rightRaw model src True content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "button"
            (\label url content ->
                el [ paddingXY 0 20 ] <| buttonLinkPrimary [ Font.size 16, paddingXY 19 11 ] url label
            )
            |> Markdown.Html.withAttribute "label"
            |> Markdown.Html.withAttribute "url"
        , Markdown.Html.tag "buttonsecondary"
            (\label url content ->
                buttonLinkSecondary [ Font.size 16 ] url label
            )
            |> Markdown.Html.withAttribute "label"
            |> Markdown.Html.withAttribute "url"
        , Markdown.Html.tag "title" (\content -> headingLargest [] content)
        , Markdown.Html.tag "small" (\content -> paragraph [ Font.size 14 ] content)
        , Markdown.Html.tag "row" (\content -> row [ spacing 20, width fill ] content)
        , Markdown.Html.tag "column"
            (\spacingM children ->
                let
                    spacing_ =
                        spacingM |> Maybe.andThen String.toInt |> Maybe.withDefault 20
                in
                column [ width fill, spacing spacing_ ] children
            )
            |> Markdown.Html.withOptionalAttribute "spacing"
        , Markdown.Html.tag "rowtocolumnwhensmall" (\content -> rowToColumnWhenSmall model [ spacing 20, width fill ] content)
        , Markdown.Html.tag "center" (\content -> column [ centerX, paddingXY 0 20 ] content)
        , Markdown.Html.tag "arrowlink"
            (\href label _ ->
                wrappedRow [ Font.color charcoal, Font.underline, mouseOver [ Font.color purple ], centerX ]
                    [ paragraph [] [ link [] { url = href, label = text label } ]
                    , spacer 8
                    , image [ height (px 15), centerX ]
                        { src = "/images/icons/icon-arrow-large.png", description = "icon arrow right" }
                    ]
            )
            |> Markdown.Html.withAttribute "href"
            |> Markdown.Html.withAttribute "text"
        , Markdown.Html.tag "homepagecontent" <| Pages.Homepage.view model global
        , Markdown.Html.tag "space"
            (\sizeM _ ->
                let
                    size =
                        sizeM |> Maybe.andThen String.toInt |> Maybe.withDefault 10
                in
                el [ height (px size), width (px size) ] none
            )
            |> Markdown.Html.withOptionalAttribute "size"
        , Markdown.Html.tag "nospacing" (\content -> column [] content)
        , Markdown.Html.tag "br" (\content -> fromHtml <| Html.br [] [])
        , Markdown.Html.tag "pill"
            (\color children ->
                row [ Background.color <| translateColloquialNames color, paddingXY 10 5, Border.rounded 5 ] children
            )
            |> Markdown.Html.withAttribute "color"
        , Markdown.Html.tag "view"
            (\module_ children ->
                case module_ of
                    "Theme.FindYourPath" ->
                        Theme.FindYourPath.view model

                    "Theme.QuizIsElmForMe" ->
                        Theme.QuizIsElmForMe.view model

                    _ ->
                        text <| "Oops! View for '" ++ module_ ++ "' not mapped!"
            )
            |> Markdown.Html.withAttribute "module"
        , Markdown.Html.tag "sup" (\content -> row [ htmlAttribute <| Html.Attributes.class "sup" ] content)
        , Markdown.Html.tag "curatedby"
            (\authors children ->
                Theme.CuratedBy.view model authors
            )
            |> Markdown.Html.withAttribute "authors"
        , Markdown.Html.tag "testimonial"
            (\name pic children ->
                Theme.Testimonial.view model name pic children
            )
            |> Markdown.Html.withAttribute "name"
            |> Markdown.Html.withAttribute "pic"
        , Markdown.Html.tag "testimonials"
            (\children ->
                row [ width fill, spacing 20 ] children
            )
        , Markdown.Html.tag "paragraph"
            (\children ->
                paragraph [ spacing 5 ] children
            )
        , Markdown.Html.tag "box"
            (\children ->
                box children
            )
        , Markdown.Html.tag "teaser"
            (\children ->
                column [ padding 20, spacing 10, Font.size 11, Font.italic ]
                    [ paragraph [ spacing 3 ] children ]
            )
        , Markdown.Html.tag "internal"
            (\children ->
                if global.isDev then
                    column [ Background.color grey, padding 20, spacing 10 ]
                        [ el [ Font.bold ] <| text "Internal note:"
                        , column [] children
                        ]

                else
                    none
            )
        , Markdown.Html.tag "ref"
            (\ref children ->
                el [ htmlAttribute <| Html.Attributes.id ref ] none
            )
            |> Markdown.Html.withAttribute "name"
        , Markdown.Html.tag "wip"
            (\mNotes children ->
                if global.isDev then
                    column
                        [ Background.color pink
                        , width fill
                        , inFront <|
                            el [ padding 5, alignRight ] <|
                                el
                                    [ Background.color red
                                    , Border.rounded 10
                                    , alignRight
                                    , padding 5
                                    , Font.size 10
                                    , Font.color white
                                    ]
                                <|
                                    text "WIP"
                        ]
                        (children
                            ++ [ case mNotes of
                                    Just notes ->
                                        "WIP note: " ++ notes |> text |> el [ Border.color red, Border.width 2, width fill, padding 5 ]

                                    Nothing ->
                                        none
                               ]
                        )

                else
                    none
            )
            |> Markdown.Html.withOptionalAttribute "note"
        , Markdown.Html.tag "articles"
            (\tagged mLimit children ->
                Theme.Articles.list model tagged mLimit
            )
            |> Markdown.Html.withAttribute "tagged"
            |> Markdown.Html.withOptionalAttribute "limit"
        , Markdown.Html.tag "videos"
            (\tagged mLimit children ->
                Theme.Videos.index model
                    global.videos
                    tagged
                    mLimit
            )
            |> Markdown.Html.withOptionalAttribute "tagged"
            |> Markdown.Html.withOptionalAttribute "limit"
        , Markdown.Html.tag "discord"
            (\children ->
                textHtml
                    """
                    <iframe src="https://discord.com/widget?id=810480359791132702" width="350" height="500" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
                    """
            )
        , Markdown.Html.tag "icon"
            (\type_ children ->
                Icon.fromString type_
            )
            |> Markdown.Html.withAttribute "type"
        , Markdown.Html.tag "lore"
            (\children ->
                row [ paddingEach { bottom = 20, top = 0, left = 0, right = 0 } ]
                    [ row [ width fill, Background.color loreBg, paddingXY 10 8, Border.rounded 10 ]
                        [ paragraph []
                            [ prefetchLink []
                                { url = "/lore"
                                , label =
                                    paragraph []
                                        [ el [] <| text "📜 Lore – "
                                        , text " "
                                        , paragraph [ Font.italic, Font.underline ] [ text "Unofficial Elm community history & cultural knowledge" ]
                                        ]
                                }
                            ]
                        ]
                    ]
            )
        , Markdown.Html.tag "tldr"
            (\children ->
                row [ paddingXY 0 20, width fill, spacing 10 ]
                    ([ image [ width (px 50), height (px 50), centerX, centerY ] { src = "/images/tldr-teal-deer.png", description = "TLDR Teal Deer: Deer by Iconic from NounProject.com" }
                     ]
                        ++ children
                    )
            )
        , Markdown.Html.tag "eslint-compare-elm"
            (\children ->
                Theme.ESLintRules.view model
            )
        , Markdown.Html.tag "compare"
            (\children ->
                Theme.Compare.view model
            )
        ]


translateColloquialNames colorName =
    case colorName of
        "green" ->
            green

        "grey" ->
            grey

        _ ->
            fromHex colorName


fromHtml =
    html


justs =
    List.foldl
        (\v acc ->
            case v of
                Just el ->
                    [ el ] ++ acc

                Nothing ->
                    acc
        )
        []
