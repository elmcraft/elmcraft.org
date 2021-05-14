---
type: page
title: How to upgrade a package in Elm
description: The elm-json tool can do this for us!
published: false
---

Currently the Elm compiler doesn't have a package upgrade command.

However, the [`elm-json`](https://github.com/zwilias/elm-json) tool can do this for us!

```
npm install --global elm-json

$ elm-json upgrade

-- PACKAGE UPGRADES FOUND ------------------------------------------------------

I want to make some changes to your direct dependencies

- [CHG] elm/browser 1.0.1 -> 1.0.2
- [CHG] elm/core 1.0.2 -> 1.0.5

I want to make some changes to your indirect dependencies

- [CHG] elm/json 1.1.2 -> 1.1.3

Should I make these changes? yes
Saved updated elm.json!
```

Check out the [`elm-json` Usage](https://github.com/zwilias/elm-json#usage) for other helpful things it can do!
