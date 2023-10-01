module Markdown.Footnotes exposing (..)

import Parser exposing (..)


formatFootnotes s =
    let
        res =
            s
                |> Parser.run statements

        footnotes =
            res
                |> Result.toMaybe
                |> Maybe.withDefault []
                |> List.filterMap
                    (\section ->
                        case section of
                            Footnote c ->
                                Just c

                            _ ->
                                Nothing
                    )

        footnotesMarkdown =
            footnotes
                |> List.indexedMap
                    (\i footnote ->
                        ("{num}. <ref name='ref-{num}'></ref>" ++ footnote ++ " [↑](#note-{num})")
                            |> String.replace "{num}" (String.fromInt (i + 1))
                    )
                |> String.join "\n"

        modifiedCopy =
            case res of
                Ok x ->
                    x
                        -- Fold back over our list accumulating an index to replace the footnotes with references
                        |> List.foldl
                            (\section ( i, acc ) ->
                                case section of
                                    Copy c ->
                                        ( i, acc ++ c )

                                    Footnote c ->
                                        ( i + 1
                                        , acc
                                            ++ ("<ref name='note-1'></ref><sup>[#{num}](#ref-{num})</sup>"
                                                    |> String.replace "{num}" (String.fromInt (i + 1))
                                               )
                                        )
                            )
                            ( 0, "" )
                        |> Tuple.second

                Err err ->
                    deadEndsToString err
    in
    if List.length footnotes > 0 then
        modifiedCopy ++ "\n\n ### Footnotes\n\n" ++ footnotesMarkdown

    else
        s


type Section
    = Copy String
    | Footnote String


statements : Parser (List Section)
statements =
    loop [] statementsHelp


statementsHelp : List Section -> Parser (Step (List Section) (List Section))
statementsHelp revStmts =
    oneOf
        [ succeed (\stmt -> Loop (stmt :: revStmts))
            |= sectionsParser
        , remainingCopy
            |> map (\stmt -> Done (List.reverse (stmt :: revStmts)))
        ]


remainingCopy : Parser Section
remainingCopy =
    succeed Copy
        |= (chompWhile (always True) |> getChompedString)
        |. end


sectionsParser : Parser Section
sectionsParser =
    oneOf
        [ footnoteParser
        , succeed Copy
            |= (chompUntil "<note>" |> getChompedString)
        ]


footnoteParser : Parser Section
footnoteParser =
    -- Parse <note>contents</note>, contents can be any string
    -- including newlines
    -- Can't use this as it ignores the content
    -- multiComment "<note>" "</note>" NotNestable
    --     |> map Footnote
    succeed Footnote
        |. symbol "<note>"
        |= (chompUntil "</note>" |> getChompedString)
        |. symbol "</note>"
