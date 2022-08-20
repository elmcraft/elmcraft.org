---
type: page
title: Why does Elm sometimes require defining a function in a let?
description: An explanation of let polymorphism in Elm.
published: true
status: seedling
authors: "@janiczek"
editors: "@supermario"
---

<tldr>tl;dr: It would be nice if let and lambdas behaved the same, but we'd lose some type inference guarantees.</tldr>

One of Elm's key goals is that type signatures are completely optional, and Elm will still infer all your types for you.

Here is an example where that goal can cause type issues:

```
usingFunction : (a -> a) -> (String, Int)
usingFunction id = (id "Hello", id 123)
```

<wip>
We could also show this example in future, but I think it complicates things.

usingLambda : (Int, String)
usingLambda =
  (\id -> (id 1, id "Hello")) identity
</wip>


```plain
-- TYPE MISMATCH ---------------

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
```

This code fails to compile because with the first usage of `id` the `a -> a` specialises to `String -> String` and then it's incompatible with `Int -> Int` for the second usage.

But on the other hand, if we write this:

```
usingLet : (String, Int)
usingLet =
  let
    id : a -> a
    id = identity
  in
  (id "Hello", id 123)
```

That compiles because `id "Hello"` and `id 123` each get their own version of `id : a -> a`.

It would be nice if let and lambdas/functions behaved the same, but it has been proven<sup>1</sup> that if both had this behaviour, the type system would become undecidable: it wouldn't be possible to _always_ infer a type for an expression.

Limiting lambda expressions is a way out of this problem: you can give a type to any expression, and you still can use `let..in` expressions when you need the behaviour shown above.

This is more formally known as [let polymorphism, originating in the Hindley Milner type system](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system#Let-polymorphism).

Currently in Elm you don't ever _need_ to use type annotations to get exhaustive type checking, and this tradeoff allows that to be the case.

<br/><br/>

<small><sup>1</sup> Wells, J.B. (1994). ["Typability and type checking in the second-order lambda-calculus are equivalent and undecidable"](http://www.macs.hw.ac.uk/~jbw/papers/Wells:Typability-and-Type-Checking-in-the-Second-Order-Lambda-Calculus-Are-Equivalent-and-Undecidable:LICS-1994.ps.gz). Proceedings of the 9th Annual IEEE Symposium on Logic in Computer Science (LICS). pp. 176–185. doi:10.1109/LICS.1994.316068. ISBN 0-8186-6310-3. S2CID 15078292.</small>
