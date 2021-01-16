module Templates.All exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes
import Markdown.Html
import Templates.Feature
import Templates.Header
import Templates.Homepage
import Templates.UI exposing (..)


htmlMapping model =
    Markdown.Html.oneOf
        [ Markdown.Html.tag "img" (\src content -> image [] { src = src, description = "" })
            |> Markdown.Html.withAttribute "src"
        , Markdown.Html.tag "header"
            (\src description content ->
                Templates.Header.view model src description content
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
            (\src content -> Templates.Feature.leftRaw model src False content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featureleftbordered"
            (\src content -> Templates.Feature.leftRaw model src True content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featureright"
            (\src content -> Templates.Feature.rightRaw model src False content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "featurerightbordered"
            (\src content -> Templates.Feature.rightRaw model src True content)
            |> Markdown.Html.withAttribute "image"
        , Markdown.Html.tag "button"
            (\label url content ->
                buttonLinkPrimary [ Font.size 16, paddingXY 19 11 ] url label
            )
            |> Markdown.Html.withAttribute "label"
            |> Markdown.Html.withAttribute "url"
        , Markdown.Html.tag "title" (\content -> headingLargest [] content)
        , Markdown.Html.tag "row" (\content -> row [ spacing 20 ] content)
        , Markdown.Html.tag "arrowlink"
            (\href label _ ->
                wrappedRow [ Font.color charcoal, Font.underline, mouseOver [ Font.color elmTeal ], centerX ]
                    [ paragraph [] [ link [] { url = href, label = text label } ]
                    , spacer 8
                    , image [ height (px 15), centerX ]
                        { src = "/images/icons/icon-arrow-large.png", description = "icon arrow right" }
                    ]
            )
            |> Markdown.Html.withAttribute "href"
            |> Markdown.Html.withAttribute "text"
        , Markdown.Html.tag "homepagecontent" <| Templates.Homepage.view model
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
        ]


fromHtml =
    html
