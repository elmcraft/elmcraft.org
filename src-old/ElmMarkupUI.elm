module ElmMarkupUI exposing (..)

import Browser
import DataSource.Metadata exposing (Metadata)
import Element exposing (..)
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)
import Html.Attributes as Attr
import Json.Decode
import Mark
import Mark.Error
import Types exposing (Model)


document :
    { extension : String
    , metadata :
        Json.Decode.Decoder Metadata
    , body : String -> Result error (Model -> Element msg)
    }
document =
    { extension = "emu"
    , metadata = Metadata.decoder
    , body =
        \elmMarkupBody ->
            Ok
                (\model ->
                    Element.column [ Element.width (Element.px 600) ] [ compile elmMarkupBody ]
                )
    }


compile source =
    case Mark.compile markDocument source of
        Mark.Success body ->
            body

        Mark.Almost { result, errors } ->
            -- This is the case where there has been an error,
            -- but it has been caught by `Mark.onError` and is still rendereable.
            column []
                [ viewErrors errors
                , result
                ]

        Mark.Failure errors ->
            viewErrors errors


markDocument =
    Mark.document
        (\body ->
            -- Html.node "style" [] [ Html.text stylesheet ]
            --     :: body
            body
        )
        (Mark.manyOf
            [ header1
            , header2
            , header3

            -- , image
            -- , row
            -- , list
            -- , code
            -- , blockQuote
            -- , Mark.map (paragraph []) text_
            ]
        )



-- markDocumentMeta =
--     Mark.documentWith
--         (\meta body ->
--             { metadata = meta
--             , body =
--                 Html.node "style" [] [ Html.text stylesheet ]
--                     :: Html.h1 [] meta.title
--                     :: body
--             }
--         )
--         -- We have some required metadata that starts our document.
--         { metadata = metadata
--         , body =
--             Mark.manyOf
--                 [ header1
--                 , header2
--                 , header3
--                 , image
--                 , list
--                 , row
--                 , code
--                 , Mark.map (Html.p []) text
--                 ]
--         }


viewErrors errors =
    List.map
        (Element.html << Mark.Error.toHtml Mark.Error.Light)
        errors


stylesheet =
    """
.emu {
  white-space: normal;
  overflow-wrap: break-word;
}
.italic {
    font-style: italic;
}
.bold {
    font-weight: bold;
}
.strike {
    text-decoration: line-through;
}
.drop-capital {
    font-size: 2.95em;
    line-height: 0.89em;
    float:left;
    margin-right: 8px;
}
.lede {
    font-variant: small-caps;
    margin-left: -15px;
}
"""



{- Handle Text -}
--
-- text_ =
--     Mark.textWith
--         { view =
--             \styles string ->
--                 viewText styles string
--         , replacements = Mark.commonReplacements
--         , inlines =
--             [ Mark.annotation "link"
--                 (\texts url ->
--                     Html.a [ Attr.href url ] (List.map (applyTuple viewText) texts)
--                 )
--                 |> Mark.field "url" Mark.string
--
--             -- , Mark.verbatim "drop"
--             --     (\str ->
--             --         let
--             --             drop =
--             --                 String.left 1 str
--             --
--             --             lede =
--             --                 String.dropLeft 1 str
--             --         in
--             --         Html.span []
--             --             [ Html.span [ Attr.class "drop-capital" ]
--             --                 [ Html.text drop ]
--             --             , Html.span [ Attr.class "lede" ]
--             --                 [ Html.text lede ]
--             --             ]
--             --     )
--             ]
--         }


applyTuple fn ( one, two ) =
    fn one two


viewText styles string =
    if styles.bold || styles.italic || styles.strike then
        el
            [ addAttr Font.bold styles.bold
            , addAttr Font.italic styles.italic
            , addAttr Font.strike styles.strike
            ]
        <|
            text string

    else
        text string


addAttr : Element.Attribute msg -> Bool -> Element.Attribute msg
addAttr attr bool =
    if bool then
        attr

    else
        htmlAttribute <| Attr.attribute "" ""



{- Handle Blocks -}
-- header1 =
--     Mark.block "H1" (\children -> el [ Region.heading 1 ] children) text_
--
--
-- header2 =
--     Mark.block "H2" (\children -> el [ Region.heading 2 ] children) text_
--
--
-- header3 =
--     Mark.block "H3" (\children -> el [ Region.heading 3 ] children) text_


image =
    Mark.record "Image"
        (\src description width ->
            Html.img
                [ Attr.src src
                , Attr.alt description

                -- , Attr.style "float" "left"
                , Attr.style "margin-right" "48px"
                , Attr.style "width" (String.fromInt width ++ "px")
                ]
                []
        )
        |> Mark.field "src" Mark.string
        |> Mark.field "description" Mark.string
        |> Mark.field "width" Mark.int
        |> Mark.toBlock


code =
    Mark.block "Code"
        (\str ->
            Html.pre
                [ Attr.style "padding" "12px"
                , Attr.style "background-color" "#eee"
                ]
                [ Html.text str ]
        )
        Mark.string


blockQuote =
    Mark.block "BlockQuote"
        (\str ->
            Html.div
                [ Attr.style "padding" "12px"
                , Attr.style "border-left" "2px solid #eee"
                , Attr.style "border-left" "2px solid #333"
                , Attr.style "font-style" "italic"
                , Attr.style "font-size" "22px"
                ]
                [ Html.text str ]
        )
        Mark.string



-- {- Handling rows / columns -}
--
--
-- row : Mark.Block (Html msg)
-- row =
--     Mark.tree "Row" renderChildren (Mark.map (Html.div []) text_)
--
--
-- renderChildren : Mark.Enumerated (Html msg) -> Html msg
-- renderChildren (Mark.Enumerated enum) =
--     let
--         group =
--             case enum.icon of
--                 Mark.Bullet ->
--                     Html.div
--
--                 Mark.Number ->
--                     Html.div
--     in
--     group []
--         (List.map renderChildItem enum.items)
--
--
-- renderChildItem : Mark.Item (Html msg) -> Html msg
-- renderChildItem (Mark.Item item) =
--     Html.div []
--         [ Html.div [] item.content
--         , renderChildren item.children
--         ]
--
--
--
-- {- Handling bulleted and numbered lists -}
--
--
-- list : Mark.Block (Html msg)
-- list =
--     Mark.tree "List" renderList (Mark.map (Html.div []) text_)
--
--
--
-- -- Note: we have to define this as a separate function because
-- -- `Items` and `Node` are a pair of mutually recursive data structures.
-- -- It's easiest to render them using two separate functions:
-- -- renderList and renderItem
--
--
-- renderList : Mark.Enumerated (Html msg) -> Html msg
-- renderList (Mark.Enumerated enum) =
--     let
--         group =
--             case enum.icon of
--                 Mark.Bullet ->
--                     Html.ul
--
--                 Mark.Number ->
--                     Html.ol
--     in
--     group []
--         (List.map renderItem enum.items)
--
--
-- renderItem : Mark.Item (Html msg) -> Html msg
-- renderItem (Mark.Item item) =
--     Html.li []
--         [ Html.div [] item.content
--         , renderList item.children
--         ]
