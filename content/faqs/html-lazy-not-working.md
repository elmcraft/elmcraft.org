---
type: page
title: Why is my use of Html.Lazy not working?
description: We explore some common gotcha's for Html.Lazy in Elm
published: true
status: seedling
authors: "@supermario"
editors: "@jfmengels"
---

<tldr>tl;dr: You're likely recreating the values or view function on each render.</tldr>

The [Elm guide on `Html.Lazy`](https://guide.elm-lang.org/optimization/lazy.html) is the best place to start.

Here are some additional gotcha's that are helped by examples.

For a deep dive into how `Html.Lazy` works, you can read [the caching behind Elm's `Html.Lazy`](https://jfmengels.net/caching-behind-elm-lazy/).

<toc></toc>

Note: you can use the following `elm-review` rules to help detect issues with `lazy` usage:

```
npx elm-review --template jfmengels/elm-review-performance/preview#lazy --rules NoMisusingLazy
npx elm-review --template noredink/elm-review-html-lazy --rules UseMemoizedLazyLambda
```


## Understand what constitutes a changed value

The Elm guide has the following note:

> Note: When are two values “the same” though? To optimize for performance, we use JavaScript’s `===` operator behind the scenes:
>
> Structural equality is used for `Int`, `Float`, `String`, `Char`, and `Bool`.
> Reference equality is used for records, lists, custom types, dictionaries, etc.
> Structural equality means that `4` is the same as `4` no matter how you produced those values. Reference equality means the actual pointer in memory has to be the same. Using reference equality is always cheap `O(1)`, even when the data structure has thousands or millions of entries. So this is mostly about making sure that using `lazy` will never slow your code down a bunch by accident. All the checks are super cheap!

Sometimes it's not clear however when we're ending up with new references. Here are a few common pitfalls:


## Gotcha: You're recreating your values

Here is a lazy that works:

```
import Html
import Html.Lazy


showUserLazy model =
    Html.Lazy.lazy2 showUser model.user.firstname model.user.age


showUser firstname age =
    Html.div []
        [ Html.text <| firstname ++ " is " ++ String.fromInt age ++ " years old."
        ]
```

Here is a refactor that doesn't:

```
import Html
import Html.Lazy


showUserLazy model =
    let
        userInfo =
            { firstname = model.user.firstname, age = model.user.age }
    in
    Html.Lazy.lazy showUser userInfo


showUser userInfo =
    Html.div []
        [ Html.text <| userInfo.firstname ++ " is " ++ String.fromInt userInfo.age ++ " years old."
        ]
```

Here the `userInfo` value is being created every time `showUserLazy` is called, so the `lazy` always sees it as changed, because records are compared by reference.


## Gotcha: You're recreating your view function

What if we wanted to force a view to be computed once with some dynamic values, and never again?

Maybe we could apply this trick, and use a static value that we ignore?

```
showUserLazy model =
    Html.Lazy.lazy (\_ -> showUser model.user) "never changes, right?"
```

This doesn't work, because `lazy` also checks that the function being passed is the same reference as before!

Here `(\_ -> showUser model.user)` is an anonymous function value that gets created every single time `showUserLazy` is called, so even though our argument is a static string, `Html.Lazy.lazy` is being given a new function each time, with no matching cache.


## Other approaches:

If the regular usage above is not suitable for some reason, there are some further things you can try.

### Group things in your model

The largest arity function provided by `Html.Lazy` is `lazy8`.

Usually this is more than sufficient, and if not, you may be able to combine multiple data points into a record in your model, and then pass the single record in to `lazy`.


### Use `lazy` higher and/or lower down the view tree

Sometimes you may find you can solve your problem by either:

- Pushing `lazy` further down the view tree by using multiple `lazy` calls to wrap around multiple downstream view function calls
- Pushing `lazy` further up the view tree, by wrapping an upstream view function call

Generally speaking the higher up you put a lazy, the more view re-computation you can avoid, but at the risk of including too many values into the lazy cache comparison, which make make the caching inefficient.

The lower down you put a lazy, the more tightly you can narrow the values considered for lazy cache comparison, at the risk of going too low and not gaining much from avoiding the re-computation.


### Use the encoding/decoding hack (as a last resort)

There may be situations where reworking your model for this is onerous and relocating `lazy` unhelpful.

One hack we can apply is to modify the code from our first gotcha to use serialisers and take advantage of `String` being compared by value:

```
import Html exposing (Html)
import Html.Lazy


showUserLazy : Model -> Html msg
showUserLazy model =
    let
        userInfoString : String
        userInfoString =
            userInfoToString { firstname = model.user.firstname, age = model.user.age }
    in
    Html.Lazy.lazy showUser userInfoString


showUser : String -> Html msg
showUser userInfoString =
    let
        userInfo : UserInfo
        userInfo =
            userInfoFromString userInfoString
    in
    Html.div []
        [ Html.text <| userInfo.firstname ++ " is " ++ String.fromInt userInfo.age ++ " years old."
        ]
```

The `userInfoToString` and `userInfoFromString` functions need to be implemented for your particular data types.

We can now have as many arguments dynamically added as we'd like, at the expense of:

- Needing to write an encoder/decoder to/from strings (can be made a little easier with a serializer/codec package)
- Needing to execute the the `userInfoToString` encoder every single time the view is recalculated – this may make this trick not worth it at all
