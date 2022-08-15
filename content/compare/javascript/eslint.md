---
type: page
title: ESLint equivalents in Elm
description: Comparing ESLint functionality and the equivalents in the Elm ecosystem
published: true
status: seedling
---


If you're coming to Elm from the JavaScript world, you may be familiar with [ESLint](https://eslint.org/) which is a community standard for modern JS projects, and be looking for the equivalent in Elm.

When it comes to enforcing code style and formatting, the Elm community uses [`elm-format`](https://github.com/avh4/elm-format), the de-facto Elm code formatter. It is similar to [Prettier](https://prettier.io/) for JavaScript in that it rewrites your code in a very opinionated and predictable way, but in Elm it is more widely adopted and is not configurable at all.

`elm-format` covers close to all stylistic rules that one would use ESLint for, therefore you don't need a linter to enforce code style.

When it comes to detecting bugs and problematic patterns, it may seem obvious a linter is needed for modern JavaScript. However in Elm, simply compiling your Elm code will give you a very large portion of what ESLint does! It is therefore not necessary to use a linter in your project, as we'll show in the next section.

It is however still a good idea to use a linter to raise the quality of your code and make it more maintainable. For that, we recommend using [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/).


## Comparing with ESLint

We claimed that you didn't need most of what ESLint provides. To explain why, we've categorized how all of the [core ESLint rules](https://eslint.org/docs/rules/) translate to Elm.

<eslint-compare-elm></eslint-compare-elm>
