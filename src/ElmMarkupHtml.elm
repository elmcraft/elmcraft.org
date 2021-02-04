module ElmMarkupHtml exposing (..)

import Browser
import Element exposing (Element)
import Html exposing (Html)
import Html.Attributes as Attr
import Json.Decode
import Mark
import Mark.Error
import Metadata exposing (Metadata)
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
                    Element.column [ Element.width (Element.px 600) ] [ Element.html <| compile elmMarkupBody ]
                )
    }


compile source =
    case Mark.compile markDocument source of
        Mark.Success body ->
            Html.div [ Attr.class "emu" ] body

        Mark.Almost { result, errors } ->
            -- This is the case where there has been an error,
            -- but it has been caught by `Mark.onError` and is still rendereable.
            Html.div []
                [ Html.div [] (viewErrors errors)
                , Html.div [] result
                ]

        Mark.Failure errors ->
            Html.div []
                (viewErrors errors)


markDocument =
    Mark.document
        (\body ->
            Html.node "style" [] [ Html.text stylesheet ]
                :: body
        )
        (Mark.manyOf
            [ header1
            , header2
            , header3
            , image
            , list
            , code
            , blockQuote
            , Mark.map (Html.p []) text
            ]
        )


markDocumentMeta =
    Mark.documentWith
        (\meta body ->
            { metadata = meta
            , body =
                Html.node "style" [] [ Html.text stylesheet ]
                    :: Html.h1 [] meta.title
                    :: body
            }
        )
        -- We have some required metadata that starts our document.
        { metadata = metadata
        , body =
            Mark.manyOf
                [ header1
                , header2
                , header3
                , image
                , list
                , code
                , Mark.map (Html.p []) text
                ]
        }


viewErrors errors =
    List.map
        (Mark.Error.toHtml Mark.Error.Light)
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


text =
    Mark.textWith
        { view =
            \styles string ->
                viewText styles string
        , replacements = Mark.commonReplacements
        , inlines =
            [ Mark.annotation "link"
                (\texts url ->
                    Html.a [ Attr.href url ] (List.map (applyTuple viewText) texts)
                )
                |> Mark.field "url" Mark.string
            , Mark.verbatim "drop"
                (\str ->
                    let
                        drop =
                            String.left 1 str

                        lede =
                            String.dropLeft 1 str
                    in
                    Html.span []
                        [ Html.span [ Attr.class "drop-capital" ]
                            [ Html.text drop ]
                        , Html.span [ Attr.class "lede" ]
                            [ Html.text lede ]
                        ]
                )
            ]
        }


applyTuple fn ( one, two ) =
    fn one two


viewText styles string =
    if styles.bold || styles.italic || styles.strike then
        Html.span
            [ Attr.classList
                [ ( "bold", styles.bold )
                , ( "italic", styles.italic )
                , ( "strike", styles.strike )
                ]
            ]
            [ Html.text string ]

    else
        Html.text string



{- Handle Metadata -}


metadata =
    Mark.record "Article"
        (\author description title ->
            { author = author
            , description = description
            , title = title
            }
        )
        |> Mark.field "author" Mark.string
        |> Mark.field "description" text
        |> Mark.field "title" text
        |> Mark.toBlock



{- Handle Blocks -}


header1 =
    Mark.block "H1"
        (\children ->
            Html.h1 []
                children
        )
        text


header2 =
    Mark.block "H2"
        (\children ->
            Html.h2 []
                children
        )
        text


header3 =
    Mark.block "H3"
        (\children ->
            Html.h3 []
                children
        )
        text


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
                , Attr.style "font-style" "italic"
                , Attr.style "font-size" "22px"
                ]
                [ Html.text str ]
        )
        Mark.string



{- Handling bulleted and numbered lists -}


list : Mark.Block (Html msg)
list =
    Mark.tree "List" renderList (Mark.map (Html.div []) text)



-- Note: we have to define this as a separate function because
-- `Items` and `Node` are a pair of mutually recursive data structures.
-- It's easiest to render them using two separate functions:
-- renderList and renderItem


renderList : Mark.Enumerated (Html msg) -> Html msg
renderList (Mark.Enumerated enum) =
    let
        group =
            case enum.icon of
                Mark.Bullet ->
                    Html.ul

                Mark.Number ->
                    Html.ol
    in
    group []
        (List.map renderItem enum.items)


renderItem : Mark.Item (Html msg) -> Html msg
renderItem (Mark.Item item) =
    Html.li []
        [ Html.div [] item.content
        , renderList item.children
        ]
