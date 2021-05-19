module Metadata exposing (Metadata(..), PageMetadata, decoder)

import Date exposing (Date)
import Json.Decode as D exposing (Decoder)
import Json.Decode.Pipeline exposing (required)
import List.Extra
import Pages
import Pages.ImagePath as ImagePath exposing (ImagePath)


type Metadata
    = Homepage PageMetadata
    | Page PageMetadata


type alias PageMetadata =
    { title : String
    , description : String
    , published : Bool
    }


decoder : Decoder Metadata
decoder =
    D.field "type" D.string
        |> D.andThen
            (\pageType ->
                case pageType of
                    "homepage" ->
                        D.succeed (\title description published -> Homepage (PageMetadata title description published))
                            |> required "title" D.string
                            |> required "description" D.string
                            |> required "published" D.bool

                    "page" ->
                        D.succeed (\title description published -> Page (PageMetadata title description published))
                            |> required "title" D.string
                            |> required "description" D.string
                            |> required "published" D.bool

                    _ ->
                        D.fail ("Unexpected page type " ++ pageType)
            )


imageDecoder : Decoder (ImagePath Pages.PathKey)
imageDecoder =
    D.string
        |> D.andThen
            (\imageAssetPath ->
                case findMatchingImage imageAssetPath of
                    Nothing ->
                        "I couldn't find that. Available images are:\n"
                            :: List.map
                                ((\x -> "\t\"" ++ x ++ "\"") << ImagePath.toString)
                                Pages.allImages
                            |> String.join "\n"
                            |> D.fail

                    Just imagePath ->
                        D.succeed imagePath
            )


findMatchingImage : String -> Maybe (ImagePath Pages.PathKey)
findMatchingImage imageAssetPath =
    Pages.allImages
        |> List.Extra.find
            (\image ->
                ImagePath.toString image
                    == imageAssetPath
            )
