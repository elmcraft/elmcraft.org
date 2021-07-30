module Templates.UI exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Region as Region
import Html
import Html.Attributes
import Html.Events
import Json.Decode as D
import Markdown.Block exposing (HeadingLevel(..), ListItem(..), headingLevelToInt)
import Markdown.Parser
import Markdown.Renderer
import Route exposing (Route)
import Templates.Layout
import Types exposing (Msg(..))



-- Shared elements
-- Layout elements


standardCenteredSectionColumns model background attrs children =
    standardCenteredSectionAdaptiveAt 1000 model background attrs children


standardCenteredSectionAdaptiveAt breakpoint model background attrs children =
    column
        ([ Background.color background
         , width fill
         , paddingEach { bottom = 0, left = 0, right = 0, top = 0 }
         ]
            ++ attrs
        )
        [ column
            [ centerX
            , width (fill |> maximum Templates.Layout.maxWidth)
            , paddingXY 30 0
            ]
            children
        ]


standardCenteredSection model background attrs children =
    column
        ([ Background.color background
         , width fill
         ]
            ++ attrs
        )
        [ column
            [ centerX
            , width (fill |> maximum Templates.Layout.maxWidth)
            , paddingXY 30 0
            ]
            children
        ]


buttonPrimary attrs msg label =
    el
        ([ Background.color purple
         , width shrink
         , paddingXY 20 12
         , Border.rounded 4
         , Font.medium
         , Font.color white
         , mouseOver [ Background.color white ]
         , onClick msg
         , pointer
         ]
            ++ attrs
        )
    <|
        el [ Font.center, width fill ] (text <| String.toUpper label)


buttonLinkPrimary attrs url label =
    prefetchLink
        ([ Background.color purple
         , width shrink
         , paddingXY 20 12
         , Border.rounded 4
         , Font.medium
         , Font.color white
         , mouseOver [ Background.color <| alpha80 purple ]
         ]
            ++ attrs
        )
        { url = url
        , label = el [ Font.center, width fill ] (text <| String.toUpper label)
        }


buttonSecondary attrs msg label =
    el
        ([ width shrink
         , paddingXY 20 12
         , Border.rounded 4
         , Border.width 1

         -- , Border.color grey
         , mouseOver [ Background.color purple, Font.color white ]
         , onClick msg
         , pointer
         ]
            ++ attrs
        )
    <|
        -- el [ Font.center, width fill ] (text <| String.toUpper label)
        el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text <| String.toUpper label)


buttonLinkSecondary attrs url label =
    prefetchLink
        ([ width shrink
         , Border.rounded 4
         , Border.width 1

         -- , Border.color grey
         , mouseOver [ Background.color purple ]
         ]
            ++ attrs
        )
        { url = url
        , label =
            el
                [ Font.color charcoal
                , Font.medium
                , Font.center
                , width fill
                , paddingXY 10 6
                , mouseOver [ Font.color white ]
                ]
                (text <| String.toUpper label)
        }


buttonLinkSmall attrs url label =
    prefetchLink
        ([ width shrink
         , paddingXY 5 5
         , Border.rounded 4
         , Border.width 1

         -- , Border.color grey
         , mouseOver [ Background.color purple ]
         ]
            ++ attrs
        )
        { url = url
        , label = el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text <| label)
        }


badge color label =
    el
        [ width shrink
        , paddingXY 5 5
        , Border.rounded 4
        , Border.width 1
        , Border.color color
        , mouseOver [ Background.color purple ]
        ]
    <|
        el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text label)


rowToColumnWhen width model attrs children =
    if model.window.width > width then
        row attrs children

    else
        column attrs children


heading : { level : HeadingLevel, rawText : String, children : List (Element msg) } -> Element msg
heading { level, rawText, children } =
    paragraph
        ((case headingLevelToInt level of
            1 ->
                [ Font.size 35
                , Font.bold
                , Font.color charcoal
                , paddingXY 0 40
                ]

            2 ->
                [ Font.color purple
                , Font.size 24
                , Font.bold
                , paddingEach { top = 50, right = 0, bottom = 20, left = 0 }
                ]

            3 ->
                [ Font.color purpleLight
                , Font.size 20
                , Font.bold
                , paddingXY 0 20
                ]

            4 ->
                [ Font.color charcoal
                , Font.size 18
                , Font.bold
                , paddingXY 0 20
                ]

            _ ->
                [ Font.size 36
                , Font.bold
                , Font.center
                , paddingXY 0 20
                ]
         )
            ++ [ Region.heading (headingLevelToInt level)
               , htmlAttribute
                    (Html.Attributes.attribute "name" (rawTextToId rawText))
               , htmlAttribute
                    (Html.Attributes.id (rawTextToId rawText))
               ]
        )
        children


heading1 label =
    heading
        { level = H1
        , rawText = label
        , children = [ text label ]
        }


headingLargest attrs children =
    paragraph
        ([ Font.medium
         , Font.color purple
         , class "headingLargest"
         ]
            ++ attrs
        )
        children


rawTextToId rawText =
    rawText
        |> String.toLower
        |> String.replace " " "-"
        |> String.replace "." ""


heading2 attrs label =
    paragraph ([ Font.color charcoal, Font.size 26, Font.bold ] ++ attrs) [ text label ]


littleTitle attrs label =
    paragraph ([ Font.color purple, Font.size 14, Font.bold ] ++ attrs) [ text <| String.toUpper label ]


externalLink attrs label url =
    link [ Font.underline, mouseOver [ Font.color purple ] ] { url = url, label = text label }


routeLinkBare : List (Attribute msg) -> String -> Route -> Element msg
routeLinkBare attrs label route =
    let
        elmPagesAttrs =
            route |> Route.toLink (List.map htmlAttribute)

        url =
            Route.routeToPath route |> String.join "/"
    in
    link ([ mouseOver [ Font.color purple ] ] ++ elmPagesAttrs ++ attrs) { url = url, label = text label }


routeLink attrs label route =
    routeLinkBare (attrs ++ [ Font.underline ]) label route


prefetchLink attrs { url, label } =
    let
        elmPagesAttrs =
            [ Html.Attributes.href url
            , Html.Attributes.attribute "elm-pages:prefetch" ""
            ]
                |> List.map htmlAttribute
    in
    link (elmPagesAttrs ++ attrs) { url = url, label = label }


spacer h =
    el [ height (px h), width (px h) ] none


cssStyle name val =
    htmlAttribute <| Html.Attributes.style name val


class name =
    htmlAttribute <| Html.Attributes.class name


childJustifyCenter =
    class "childJustifyCenter"


blueBorderBottomRight =
    class "blueBorderBottomRight"


blueBorderTopLeft =
    class "blueBorderTopLeft"


uppercase =
    class "uppercase"


padding_ t r b l =
    paddingEach { top = t, right = r, bottom = b, left = l }


whenMoreThan w model elem =
    if model.window.width >= w then
        elem

    else
        none


whenLessThan w model elem =
    if model.window.width < w then
        elem

    else
        none


whenLessThan_ w model attr =
    if model.window.width < w then
        attr

    else
        attrNone


attrNone =
    cssStyle "" ""


stopPropagation =
    htmlAttribute <| Html.Events.stopPropagationOn "click" (D.succeed ( Noop, True ))


{-| Experimental!
-}
responsiveStyle ref name default brackets =
    ( class ref
    , \fn attrs children ->
        let
            selector =
                "." ++ ref ++ ", ." ++ ref ++ " > * { "

            addBracket ( w, value ) =
                [ " @media (min-width: ", String.fromInt w, "px) { ", selector, name, ": ", value, "; }" ]

            gen =
                brackets
                    |> List.map addBracket
                    |> List.concat
                    |> (++) [ selector, name, ": ", default, "; }" ]
                    |> String.join ""

            styleNode =
                html <| Html.node "style" [] [ Html.text gen ]

            -- debug =
            --     Debug.log ("responsiveStyle:" ++ ref) gen
        in
        fn (attrs ++ [ inFront styleNode ]) children
    )
