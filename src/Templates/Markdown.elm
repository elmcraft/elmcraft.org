module Templates.Markdown exposing (..)

import Browser.Dom
import Browser.Events
import Color
import Colors exposing (..)
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
import Palette
import Templates.All
import Templates.UI exposing (..)
import Time
import Types exposing (..)


renderer : Model -> Markdown.Renderer.Renderer (Element msg)
renderer model =
    { heading = \data -> row [] [ heading data ]
    , paragraph = \children -> paragraph [] children
    , blockQuote =
        \children ->
            fromHtml <| Html.blockquote [] (asHtml children)
    , html = Templates.All.htmlMapping model
    , text = text
    , codeSpan =
        \content -> fromHtml <| Html.code [] [ Html.text content ]
    , strong = \list -> paragraph [ Font.bold ] list
    , emphasis = \list -> paragraph [ Font.color elmTeal ] list
    , hardLineBreak = fromHtml <| Html.br [] []
    , link =
        \{ title, destination } list ->
            link [ Font.underline ]
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
                    case title of
                        Just title_ ->
                            [ htmlAttribute <| Html.Attributes.attribute "title" title_ ]

                        Nothing ->
                            []
            in
            image
                attrs
                { src = src
                , description = alt
                }
    , unorderedList =
        \items ->
            --     none
            column [ spacing 15, width fill ]
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
                                        [ paragraph
                                            [ alignTop ]
                                            (text " • " :: children)
                                        ]
                        )
                )
    , orderedList =
        \startingIndex items ->
            column [ spacing 15, width fill ]
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
            text "[UNIMPLEMENTED:codeblock]"
    , thematicBreak = text "[UNIMPLEMENTED:thematicBreak]"
    , table = \list -> text "[UNIMPLEMENTED:table]"
    , tableHeader = \list -> text "[UNIMPLEMENTED:tableHeader]"
    , tableBody = \list -> text "[UNIMPLEMENTED:tableBody]"
    , tableRow = \list -> text "[UNIMPLEMENTED:tableRow]"
    , tableCell = \list -> text "[UNIMPLEMENTED:tableCell]"
    , tableHeaderCell = \alignmentM list -> text "[UNIMPLEMENTED:tableHeaderCell]"
    }


fromHtml =
    html


asHtml children =
    children
        |> List.map toHtml


toHtml e =
    layout [] e
