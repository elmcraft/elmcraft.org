module MarkdownPlain exposing (..)

-- import Markdown.Block exposing (ListItem(..))
-- import Markdown.Html

import Element exposing (..)
import Markdown.Parser
import Markdown.Renderer


fromString markdownBody =
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
                                    [ text "Oops! Something went wrong rendering this markdown text: ", text err ]
                       )
                    |> column
                        [ width fill
                        ]
           )
