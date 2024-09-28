---
type: page
title: Elm online tools
description: Tools we can use in the browser to work with Elm.
status: seedling
published: false
---

## REPL
Where a read-evaluate-print-loop UI is available to execute Elm code.

* The REPL in the [official Elm guide](https://guide.elm-lang.org/core_language) is surrounded by tutorial code and explanations.
* On [elmrepl.de](https://elmrepl.de/) you can edit one Elm file and also access its declarations from a REPL input field. You can create links for sharing and also import/export state.


## Editor
Where you can edit at least one Elm file, trigger compilation and view the result.

* On [elm-lang.org/try](https://elm-lang.org/try) you can edit one Elm file. It has an interface to browse and install any Elm package.
* With [Ellie (Elm Live Editor)](https://ellie-app.com/), you can edit one Elm and one Html file. You can also store your program on the server and share a link to it. It has an interface to browse and install any Elm package.
* The [Elm Editor](https://elm-editor.com/) can import projects from public git repositories and import and export projects from/to zip files. It supports multiple Elm files. It can install any Elm package, but you need to edit the elm.json file.


## Literate/Notebook programming
Where you write a (text) document, and can have interactive code segments inside.

* [elm-notebook.org](https://elm-notebook.org/) comes with user management and allows to store private and public notebooks.


## Code Generation

* With Alex Korban's [json2elm](https://korban.net/elm/json2elm/) you can paste a JSON sample and it will generate decoders and encoders for you. You can switch between different styles and packages.

* The exploration tool [fusion.lamdera.app](https://fusion.lamdera.app/) allows you to send GET or POST requests with or without additional headers or HTTP basic auth. Then you can pick which fields you are interested in and it will generate sample code and decoders for you.
