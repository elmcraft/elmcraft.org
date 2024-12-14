---
type: page
title: Elm Native Apps
description: How to write or turn your Elm app into a native app.
status: budding
published: true
---

<meta>Needs review</meta>

Elm was designed for the web, but with a few modern tools that help bridge the gap between Web and Native, there are ways to get your Elm app working as a native app.


<toc></toc>

## Elm + Tauri

Tauri is a toolkit for using web technologies to build desktop and mobile (in alpha) apps. It uses Rust for the backend and web technologies for the frontend. Elm can be used as the frontend technology.

### Handling CORS and HTTP Requests

Elm’s `elm/http` uses XHR, while Tauri prefers `fetch`. To manage CORS, developers proxy HTTP requests through Rust.

The [`node-xhr2`](https://github.com/lamdera/node-xhr2) polyfill may help bridge XHR gaps with `fetch`, but [it's not perfect](https://github.com/pwnall/node-xhr2/pull/42) and flat out won't work for some features (i.e. FormData and Blob support).

### Guides and Templates

- [Announcing “Tauri Elm App” - A template for building desktop apps with Tauri](https://discourse.elm-lang.org/t/announcing-tauri-elm-app-a-template-for-building-desktop-apps-with-tauri/9460) – by ad-si
- [Elm + Tauri (Scripta Desktop)](https://jxxcarlson.medium.com/elm-tauri-befa59eab403) - by jxxcarlson

### Examples Apps

- [try-tauri](https://github.com/tsukimizake/try-tauri) – by tsukimizake
- [ElmTauriGUI](https://github.com/Andrew-Clow/ElmTauriGUI) – by AndrewC
- [ucm-desktop](https://github.com/unisonweb/ucm-desktop) – by hojberg

## Elm + Capacitor

Capacitor is a cross-platform app runtime that makes it easy to build web apps that run natively on iOS, Android, Electron, and the web.

Unlike Tauri, Capacitor's philosophy is that past abstraction efforts over platforms (i.e. Cordova) failed because the platforms (Android, iOS, Desktop) are fundamentally different, so Capacitor seeks to expose first class access to underlying platforms, and doesn't trying hide away the full native project + build process.

Note: The team behind Capacitor also makes the Ionic UI framework and pushes it heavily, which can cause confusion. Ionic won't play nice with Elm (it relies on JS componentry and behaviours), but you don't need Ionic to use Capacitor!

- [elm-todomvc-capacitor](https://github.com/jmpavlick/elm-todomvc-capacitor) - by jmpavlick


## Past Projects

Other projects that might be abandoned now, but could be worth looking into:

- [elm-native](https://github.com/hariroshan/elm-native) - by hariroshan, early exploration of using Nativescript with Elm
- [elm-ios](https://github.com/pzp1997/elm-ios) - GSOC 2017 project by pzp1997, early exploration of using Elm with iOS
- 🪦 [elm-expo](https://github.com/akavel/elm-expo) - by akavel,


