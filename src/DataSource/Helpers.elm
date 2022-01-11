module DataSource.Helpers exposing (..)

import DataSource exposing (DataSource)
import Json.Decode
import Json.Encode


distillInt : String -> DataSource Int -> DataSource Int
distillInt identifier datasource =
    datasource
        |> DataSource.distill identifier
            (String.fromInt >> Json.Encode.string)
            (\json ->
                Json.Decode.decodeValue Json.Decode.string json
                    |> Result.map (String.toInt >> Maybe.withDefault -1)
                    |> Result.mapError Json.Decode.errorToString
            )


distillString : String -> DataSource String -> DataSource String
distillString identifier datasource =
    datasource
        |> DataSource.distill identifier
            Json.Encode.string
            (\json ->
                Json.Decode.decodeValue Json.Decode.string json
                    |> Result.mapError Json.Decode.errorToString
            )
