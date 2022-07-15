---
type: page
title: ESLint equivalents in Elm
description: Comparing ESLint functionality and the equivalents in the Elm ecosystem
published: true
status: seedling
---


If you're coming to Elm from the JavaScript world, you may be familiar with [ESLint](https://eslint.org/) which is a community standard for modern JS projects, and be looking for the equivalent in Elm.

## Do I need to lint in Elm?

For modern JavaScript it may seem obvious a linter is needed.

However in Elm, simply compiling your Elm code will give you a very large portion of what ESLint does!


## Further linting

### Syntax linting / Code formatting:

Covered by [`elm-format`](https://github.com/avh4/elm-format), the de-facto standard for formatting Elm code.


### Additional linting / custom rules:

Covered by [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) , which analyzes Elm projects to help find mistakes before your users find them.


### Converting from ESLint

Here's the [core set of ESLint rules](https://eslint.org/docs/rules/) and how they translate to Elm.

<eslint-compare-elm></eslint-compare-elm>
