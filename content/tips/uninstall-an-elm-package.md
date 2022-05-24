---
type: page
title: How to uninstall a package in Elm
description: The elm-json tool can do this for us!
published: true
---

Currently the Elm compiler doesn't have a package uninstall command.

### Option 1: `elm-json`

The [`elm-json`](https://github.com/zwilias/elm-json) tool can help:

```
npm install --global elm-json

$ elm-json uninstall elm/file

-- PACKAGE CHANGES READY -------------------------------------------------------

I want to make some changes to your direct dependencies

- [DEL] elm/file 1.0.5

I want to make some changes to your indirect dependencies

- [DEL] elm/bytes 1.0.8

Should I make these changes? yes
Saved updated elm.json!
```

Check out the [`elm-json` Usage](https://github.com/zwilias/elm-json#usage) for other helpful things it can do!


### Option 2: `elm-review-unused`

For extra style, and the ability to remove much more than just unused packages, [`elm-review`](https://package.elm-lang.org/packages/jfmengels/elm-review/latest/) can help with the [`elm-review-unused`](https://package.elm-lang.org/packages/jfmengels/elm-review-unused/latest/) rules:

```
elm-review --template jfmengels/elm-review-unused/example
```
