module Examples.LetPolymorphism exposing (..)


usingLet : ( String, Int )
usingLet =
    let
        id : a -> a
        id =
            identity
    in
    ( id "Hello", id 123 )



{- This should fail to compile with this error:

   -- TYPE MISMATCH --------------- /Users/mario/dev/projects/elmcraft-edits/src/Examples/LetPolymorphism.elm

   The 1st argument to `id` is not what I expect:

   6|     ( id "Hello", id 123 )
               ^^^^^^^
   This argument is a string of type:

       String

   But `id` needs the 1st argument to be:

       a

   Hint: Your type annotation uses type variable `a` which means ANY type of value
   can flow through, but your code is saying it specifically wants a `String`
   value. Maybe change your type annotation to be more specific? Maybe change the
   code to be more general?

   Read <https://elm-lang.org/0.19.1/type-annotations> for more advice!

-}
-- usingFunction : (a -> a) -> ( String, Int )
-- usingFunction id =
--     ( id "Hello", id 123 )
