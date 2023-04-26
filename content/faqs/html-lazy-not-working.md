---
type: page
title: Why is my use of Html.Lazy not working?
description: We explore some common gotcha's for Html.Lazy
published: true
status: seedling
---

The [Elm guide on Html.Lazy](https://guide.elm-lang.org/optimization/lazy.html) is the best place to start.

Here are some additional gotcha's that are helped by examples.

<toc></toc>


Don't want to remember these gotchas? You don't have to! Let `elm-review` remember for you:

```
npx elm-review --template jfmengels/elm-review-performance/preview#lazy --rules NoMisusingLazy
```


### Understand what constitutes a changed value

The Elm guide has the following note:

> Note: When are two values “the same” though? To optimize for performance, we use JavaScript’s `===` operator behind the scenes:
>
> Structural equality is used for `Int`, `Float`, `String`, `Char`, and `Bool`.
> Reference equality is used for records, lists, custom types, dictionaries, etc.
> Structural equality means that `4` is the same as `4` no matter how you produced those values. Reference equality means the actual pointer in memory has to be the same. Using reference equality is always cheap `O(1)`, even when the data structure has thousands or millions of entries. So this is mostly about making sure that using `lazy` will never slow your code down a bunch by accident. All the checks are super cheap!

Sometimes it's not clear however when we're ending up with new references. Here are a few common pitfalls:


### Gotcha: New references created for the arguments

Here is a lazy that works:

```
import Html
import Html.Lazy

showUserLazy model =
  Html.Lazy.lazy2 showUser model.user.firstname model.user.age

showUser firstname age =
  Html.div [] [
    Html.text <| firstname ++ " is " ++ String.fromInt age ++ " years old."
  ]
```

Here is a refactor that doesn't:

```
import Html
import Html.Lazy

showUserLazy model =
  let
    userInfo = { firstname = model.user.firstname, age = model.user.age }
  in
  Html.Lazy.lazy showUser userInfo

showUser userInfo =
  Html.div [] [
    Html.text <| userInfo.firstname ++ " is " ++ String.fromInt userInfo.age ++ " years old."
  ]
```

Here the `userInfo` value is being created every time `showUserLazy` is called, so the `lazy` always sees it as changed, because records are compared by reference.


### Gotcha: New view function passed to Html.Lazy functions

What if we wanted to force a view to be computed once with some dynamic values, and never again?

Maybe we could apply this trick, and use a static value that we ignore?

```
showUserLazy model =
  Html.Lazy.lazy (\_ -> showUser model.user) "never changes, right?"
```

This doesn't work, because `lazy` also checks that the function being passed is the same reference as before!

Here `(\_ -> showUser model.user)` is an anonymous function value that gets created every single time `showUserLazy` is called, so even though our argument is a static string, `Html.Lazy.lazy` is noticing our function is changing and busting the cache.



### Hack: dynamic values and > 8 lazy arguments

The largest arity function provided by `Html.Lazy` is `lazy8`.

Usually this is more than sufficient, and if not, you may be able to combine multiple data points into a record in your model, and then pass the single record in to `lazy`.

There may be situations where reworking your model for this is onerous. We can modify the code from our first gotcha to use serialisers and take advantage of Strings being compared by value:

```
import Html
import Html.Lazy

showUserLazy model =
  let
    userInfoString = userInfoToString { firstname = model.user.firstname, age = model.user.age }
  in
  Html.Lazy.lazy showUser userInfoString

showUser userInfoString =
  let
    userInfo = userInfoFromString userInfoString
  in
  Html.div [] [
    Html.text <| userInfo.firstname ++ " is " ++ String.fromInt userInfo.age ++ " years old."
  ]
```

We can now have as many arguments dynamically added as we'd like, at the expense of:

- Needing to write an encoder/decoder to/from strings (can be made a little easier with a serializer/codec package)
- Needing to execute the the `userInfoToString` encoder every single time the view is recalculated – this may make this trick not worth it at all
