---
type: page
title: Currying vs Partial Function Application
description: What is the difference between partial function application and currying?
published: true
status: seedling
authors: "@supermario"
---

*<small>Created from a Slack discussion with thanks to pete, adauguet, hayleigh, janiczek, mert, perkee, simon, absynce, and maurizio</small>*

**Currying:** the act of taking a function that takes n arguments and turning it into a sequence of n functions that each take only 1 argument

**Partial application:** the ability to provide only some arguments to a function and get back a function that can take the remaining arguments

To expand: Currying is about defining functions, partial application is about calling functions.

Take this function as an example:

```
add3numbers = \a b c -> a + b + c
```

In Elm, all functions are curried automatically, but in Hypothetical Elm™️ the above is a function with 3 parameters (I make the rules of Hypothetical Elm). Now let’s curry that function:

```
add3numbers = \a -> \b -> \c -> a + b + c
```

We changed it like originally described. (But note that in Actual Elm, the first version works exactly the same.)

Some languages have a `curry` function that does that for you. In JavaScript you could define a `curry` function so that you could do stuff like `const add3numbersCurried = curry(add3numbers)`.

Now move on to partial application (calling functions):

```
add3numbers 1 -- partial application
add3numbers 1 2 -- partial application
add3numbers 1 2 3 -- full application
```

Currying gives you easier ability to do partial application, but you could have partial application without currying:

```
const my3argFn = (x,y,z) => x+y+z;
const partiallyApplied = (y,z) => my3argFn(999,y,z)

// Or alternatively
add3numbers.bind(undefined, 1, 2)
```

Here's an Ellie that shows a fairly realistic example of partial application: [https://ellie-app.com/shMGHjnqgtLa1](https://ellie-app.com/shMGHjnqgtLa1).

```
column []
    (List.map
        -- The first argument is partially applied.
        --                vvvvvvvvvvvvvvvvv
        (viewRelativeTime model.currentTime)
        [ Time.millisToPosix 1837548
        , Time.millisToPosix 2737548
        , Time.millisToPosix 3837548
        ]
    )

viewRelativeTime : Time.Posix -> Time.Posix -> Element Msg
viewRelativeTime currentTime time =
    Element.text (DateFormat.Relative.relativeTime currentTime time)
```
There’s an alternative using an anonymous function:
```
column []
    (List.map
        -- Using an anonymous function instead.
        (\time -> viewRelativeTime model.currentTime time)
        [ Time.millisToPosix -1837548
        , Time.millisToPosix -2737548
        , Time.millisToPosix -3837548
        ]
    )
```
