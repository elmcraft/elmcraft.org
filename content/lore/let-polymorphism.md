---
type: page
title: Why does Elm sometimes require I define a function in a let?
description: The explanation for let polymorphism in Elm.
published: true
status: seedling
---

One of Elm's key goals is that type signatures are completely optional, and Elm will still infer all your types for you.

<tldr>tl;dr: It would be nice if let and lambda behaved the same but we'd lose some type inference guarantees.</tldr>

Here is an example that can cause problems:

```elm
usingFunction : (a -> a) -> (Int, String)
usingFunction id = (id 1, id "Hello")
```

This won't work because with the first usage the `a -> a` transforms to `Int -> Int` and then it's incompatible with `String -> String` for the other usage.

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

This is more formally known as [let polymorphism in the Hindley Milner type system](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system#Let-polymorphism).

As for why this weird distinction happens, it's because if both `let`'s and lambdas had this generalization behaviour, the type system wouldn't be able to always infer all the types*, and so you'd sometimes have to provide type annotations.

Currently you don't need to use type annotations ever.

<br/><br/>

<small>*Wells, J.B. (1994). ["Typability and type checking in the second-order lambda-calculus are equivalent and undecidable"](http://www.macs.hw.ac.uk/~jbw/papers/Wells:Typability-and-Type-Checking-in-the-Second-Order-Lambda-Calculus-Are-Equivalent-and-Undecidable:LICS-1994.ps.gz). Proceedings of the 9th Annual IEEE Symposium on Logic in Computer Science (LICS). pp. 176–185. doi:10.1109/LICS.1994.316068. ISBN 0-8186-6310-3. S2CID 15078292.</small>