---
type: page
title: eslint equivalents in Elm
description: Comparing eslint functionality and the equivalents in the Elm ecosystem
published: true
status: seedling
---


If you're coming to Elm from the Javascript world, you may be familiar with ESLint which is a community standard for modern JS projects, and be looking for the equivalent in Elm.

## Do I need to lint in Elm?

For modern Javascript it may seem obvious a linter is needed.

However in Elm, simply compiling your Elm code will give you a very large portion of what ESLint does!


## Further linting

### Syntax linting / Code formatting:

Covered by `elm-format`, the de-facto standard for formatting Elm code.


### Additional linting / custom rules:

Covered by `elm-review`, which analyzes Elm projects to help find mistakes before your users find them.


### Converting from eslint

Here's the [core set of ESLint rules](https://eslint.org/docs/rules/) and how they translate to Elm.

<eslint-compare-elm></eslint-compare-elm>
