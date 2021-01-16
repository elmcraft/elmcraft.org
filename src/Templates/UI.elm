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
import Pages.PagePath
import Types exposing (Msg(..))


fontFace =
    "inter"


asPath page =
    page
        |> Pages.PagePath.toPath
        |> String.join "/"
        |> (++) "/"



-- Shared elements
-- Layout elements


standardCenteredSectionColumns model background attrs children =
    standardCenteredSectionAdaptiveAt 1000 model background attrs children


standardCenteredSectionAdaptiveAt breakpoint model background attrs children =
    column
        ([ Background.color background
         , width fill
         , paddingEach { bottom = 0, left = 0, right = 0, top = 60 }
         ]
            ++ attrs
        )
        [ rowToColumnWhen breakpoint
            model
            [ centerX
            , width (fill |> maximum 1440)
            , paddingXY 30 0
            , spacing 50
            ]
            children
        ]


standardCenteredSection model background children =
    column
        [ Background.color background
        , width fill
        ]
        [ column
            [ centerX
            , width (fill |> maximum 1440)
            , paddingXY 30 0
            , spacing 50
            ]
            children
        ]


buttonPrimary attrs msg label =
    el
        ([ Background.color elmTeal
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
    link
        ([ Background.color elmTeal
         , width shrink
         , paddingXY 20 12
         , Border.rounded 4
         , Font.medium
         , Font.color white
         , mouseOver [ Background.color white ]
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
         , mouseOver [ Background.color elmTeal ]
         , onClick msg
         , pointer
         ]
            ++ attrs
        )
    <|
        -- el [ Font.center, width fill ] (text <| String.toUpper label)
        el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text <| String.toUpper label)


buttonLinkSecondary attrs url label =
    link
        ([ width shrink
         , paddingXY 20 12
         , Border.rounded 4
         , Border.width 1

         -- , Border.color grey
         , mouseOver [ Background.color elmTeal ]
         ]
            ++ attrs
        )
        { url = url
        , label = el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text <| String.toUpper label)
        }


buttonLinkSmall attrs url label =
    link
        ([ width shrink
         , paddingXY 5 5
         , Border.rounded 4
         , Border.width 1

         -- , Border.color grey
         , mouseOver [ Background.color elmTeal ]
         ]
            ++ attrs
        )
        { url = url
        , label = el [ Font.color charcoal, Font.medium, Font.center, width fill ] (text <| label)
        }


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
                [ Font.size 48
                , Font.bold
                , Font.color green
                ]

            2 ->
                [ Font.color elmTeal
                , Font.size 14
                , Font.bold
                , uppercase
                ]

            _ ->
                [ Font.size 36
                , Font.bold
                , Font.center
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
        ([ Font.size 48
         , Font.medium
         , Font.color elmTeal
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
    paragraph ([ Font.color elmTeal, Font.size 14, Font.bold ] ++ attrs) [ text <| String.toUpper label ]


linkHover attrs label url =
    link [ Font.underline, mouseOver [ Font.color elmTeal ] ] { url = url, label = text label }


pageHover attrs label page =
    link [ Font.underline, mouseOver [ Font.color elmTeal ] ] { url = asPath page, label = text label }


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


markdown markdownBody =
    Markdown.Parser.parse markdownBody
        -- |> Debug.log "parse result"
        -- @TODO show markdown parsing errors, i.e. malformed html?
        |> Result.withDefault []
        -- |> Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer
        |> (\parsed ->
                parsed
                    |> Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer
                    |> (\res ->
                            case res of
                                Ok htmlElements ->
                                    List.map html htmlElements

                                Err err ->
                                    [ text "Oops! Something went wrong rendering this page:", text err ]
                       )
                    |> column
                        [ width fill
                        ]
           )
