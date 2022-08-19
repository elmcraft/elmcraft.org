---
type: page
title: Why does Elm sometimes require I define a function in a let?
description: The explanation for let polymorphism in Elm.
published: true
status: seedling
author: @janiczek
editor: @supermario
---

One of Elm's key goals is that type signatures are completely optional, and Elm will still infer all your types for you.

Here is an example that can cause problems:

```elm
usingFunction : (a -> a) -> (Int, String)
usingFunction id = (id 1, id "Hello")
```

This :arrow_up: won't work because with the first usage the a -> a transforms to Int -> Int and then it's incompatible with String -> String for the other usage.

But on the other hand

```elm
usingLet : (Int, String)
usingLet =
  let
    id : a -> a
    id = identity
  in
  (id 1, id "Hello")
```

does work because `id 1` and `id "Hello"` each get their own version of `id : a -> a`.


As for why this weird distinction happens, it's because if both `let`'s and lambdas had this generalization behaviour, the type system wouldn't be able to always infer all the types*, and so you'd sometimes have to provide type annotations.

Currently you don't need to use type annotations ever.


*There's a paper somewhere... if you know of it, [let us know!](/discuss).
