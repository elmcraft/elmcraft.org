---
type: page
title: "Lore: Elm Core Team"
description: "Lore: Elm Core team community history & cultural knowledge "
published: true
status: seedling
authors: "@supermario"
---

<lore></lore>


## Who is on the Elm core team?

The Elm core team is effectively [Evan Czaplicki](https://twitter.com/evancz). He works alongside his wife, [Tereza Sokol](https://twitter.com/tereza_sokol) under [elm.studio](https://elm.studio/).


## What happened to the core team?

There never really was a core team in the sense you might expect.

Earlier in Elm's history, Evan was in a phase that was more collaborative in discussions before Elm developed towards the relative stability that is present today.

The Elm language and [compiler work from a code perspective has always been predominantly Evan's work, as witnessed by the public contribution log](https://github.com/elm/compiler/graphs/contributors). Code contributions were mostly centered around packages.

See the page on [Elm Core Development](/lore/elm-core-development) for more info.


## What about the `elm-explorations/*` repositories and maintainers?

There are people maintaining repos in the elm-explorations organization, who have access to kernel JS modules, but that access is not being used by those people to make interfaces for Web APIs.

These repos mostly exist in elm-explorations to have access to some escape hatch:

- `elm-explorations/test` uses JS for try…catch
- `elm-explorations/linear-algebra` uses JS for fast math over Float64Arrays
- `elm-explorations/benchmark` uses JS for high-precision timestamps
- `elm-explorations/webgl` uses JS to interface with WebGL
- `elm-explorations/markdown` uses JS to wrap an old version of the [marked](https://github.com/markedjs/marked/commit/cd2f6f5b7091154c5526e79b5f3bfb4d15995a51) library

These repos are also largely stable and most work is done in Elm not kernel JS.

There are no contributors who have indiscriminate access to kernel JS on any/all projects.


## What about the blog post about Bekk sponsoring a core team member, Robin?

The [September 2019 - Elm + Bekk](https://elm-lang.org/news/elm-and-bekk) blog post by Evan celebrated [Bekk](https://www.bekk.no/)'s investment in Robin spending 1 day a week working on Elm.

Robin had previously [done performance work on `Dict`, `Array` and `List` Elm core package primitives](https://groups.google.com/g/elm-dev/c/--fK-wMoDig/m/p6zF4-5sAgAJ), which was done in consultation with Evan.

According to Robin:

> If I remember correctly, the result of Bekk's sponsorship was improvements to the time travelling debugger, and a proof of concept of styled-elements but for android and ios.
>
> Bekk stopped sponsoring me at my own request, as I wanted to focus more on my family and my new role as a parent.
>
> Bekk did sponsor me again later, but in part due to Evan beeing super busy at the time, I spent most of that time exploring things that ended up in [elm-optimize-level-2](https://github.com/mdgriffith/elm-optimize-level-2), and improving [elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest), all of which was [explained in blogs](https://blogg.bekk.no/search?q=robin).
>
> That same sponsorship carried over when I started working on [Gren](https://gren-lang.org/news/220530_first_release).
