module Templates.Markdown exposing (..)

-- import Feed
-- import Palette
-- import Time

import Browser.Dom
import Browser.Events
import Color
import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Region as Region
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes
import Json.Decode
import Markdown.Block exposing (ListItem(..))
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer
import Templates.All
import Templates.UI exposing (..)
import Types exposing (..)


renderer : Model -> Markdown.Renderer.Renderer (Element msg)
renderer model =
    { heading = \data -> row [] [ heading data ]
    , paragraph = \children -> paragraph [ paddingXY 0 15, spacing 15 ] children
    , blockQuote =
        \children ->
            -- fromHtml <| Html.blockquote [] (asHtml children)
            column [ paddingXY 0 20, width fill ]
                [ column
                    [ Font.size 20
                    , Font.italic
                    , Border.widthEach { bottom = 0, left = 4, right = 0, top = 0 }
                    , Border.color grey
                    , Font.color charcoal
                    , paddingXY 15 0
                    , width fill
                    ]
                    children
                ]
    , html = Templates.All.htmlMapping model

    -- @TODO preserve newlines on... new lines?
    , text = \s -> el [] <| text s
    , codeSpan =
        \content -> fromHtml <| Html.code [] [ Html.text content ]
    , strong = \list -> paragraph [ Font.bold ] list
    , emphasis = \list -> paragraph [ Font.italic ] list
    , hardLineBreak = fromHtml <| Html.br [] []
    , link =
        \{ title, destination } list ->
            link [ Font.underline, Font.color elmTealDark ]
                { url = destination
                , label =
                    case title of
                        Just title_ ->
                            text title_

                        Nothing ->
                            paragraph [] list
                }
    , image =
        \{ alt, src, title } ->
            let
                attrs =
                    [ title |> Maybe.map (\title_ -> htmlAttribute <| Html.Attributes.attribute "title" title_) ]
                        |> justs
            in
            image
                attrs
                { src = src
                , description = alt
                }
    , unorderedList =
        \items ->
            --     none
            column [ spacing 15, width fill, paddingXY 0 20 ]
                (items
                    |> List.map
                        (\listItem ->
                            case listItem of
                                ListItem task children ->
                                    wrappedRow
                                        [ spacing 5
                                        , paddingEach { top = 0, right = 0, bottom = 0, left = 20 }
                                        , width fill
                                        ]
                                        [ paragraph [ alignTop ] (text " • " :: children)
                                        ]
                        )
                )
    , orderedList =
        \startingIndex items ->
            column [ spacing 15, width fill, paddingXY 0 20 ]
                (items
                    |> List.indexedMap
                        (\index itemBlocks ->
                            wrappedRow
                                [ spacing 5
                                , paddingEach { top = 0, right = 0, bottom = 0, left = 20 }
                                , width fill
                                ]
                                [ paragraph
                                    [ alignTop ]
                                    (text (String.fromInt (startingIndex + index) ++ ". ") :: itemBlocks)
                                ]
                        )
                )
    , codeBlock =
        \{ body, language } ->
            column
                [ Font.family [ Font.monospace ]
                , Background.color grey
                , Border.rounded 5
                , padding 10
                , width fill
                ]
                [ paragraph [] [ text body ] ]
    , thematicBreak = el [ Background.color grey, height (px 2), width fill ] none
    , table = \children -> column [ width fill ] children
    , tableHeader = \children -> column [] children
    , tableBody = \children -> column [] children
    , tableRow = \children -> row [ width fill ] children
    , tableCell = \alignment children -> column [ width fill ] children
    , tableHeaderCell = \alignmentM children -> column [ width fill ] children
    , strikethrough = \children -> paragraph [ Font.strike ] children
    }


fromHtml =
    html


asHtml children =
    children
        |> List.map toHtml


toHtml e =
    layout [] e


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
