---
type: page
title: Elm online tools
description: Tools we can use in the browser to work with Elm.
status: seedling
published: false
---
There are a number of online Elm tools that let you interact with the Elm language without requiring any local installation.

## REPL
Where a read-evaluate-print-loop UI is available to execute Elm code.

* The REPL in the [official Elm guide](https://guide.elm-lang.org/core_language) is surrounded by tutorial code and explanations.
* On [elmrepl.de](https://elmrepl.de/) you can edit one Elm file and also access its declarations from a REPL input field. You can create links for sharing and also import/export state.


## Editor
Where you can edit at least one Elm file, trigger compilation and view the result.

* [elm-lang.org/try](https://elm-lang.org/try) lets you edit one Elm file. It has an interface to browse and install any Elm package.
* [Ellie (Elm Live Editor)](https://ellie-app.com/) lets you edit one Elm and one Html file. You can also save your program on the server and share a permalink to it. It has an interface to browse and install any Elm package.
* [Elm Editor](https://elm-editor.com/) can import projects from public git repositories and import/export projects from/to zip files. It supports multiple Elm files. It can install any Elm package, but you need to edit the elm.json file.


## Literate/Notebook programming
Where you write a (text) document, and can have interactive code segments inside.

* [elm-notebook.org](https://elm-notebook.org/) comes with user management and allows to store private and public notebooks.
* The UI of [miniBill/elm-interpreter](https://elm.run/minibill-elm-interpreter) can be used to visualize the flow of Elm code and is also useful as a step-by-step debugger. This helps greatly with understanding complex algorithms.


## Code Generation

* [json2elm](https://korban.net/elm/json2elm/) lets you paste a JSON sample and it will generate decoders and encoders for you. You can switch between different styles and packages.

* [Fusion](https://fusion.lamdera.app/) allows you to interactively explore GET or POST requests, pick which fields you are interested in from the response, and receive generated query and decoder Elm code.
