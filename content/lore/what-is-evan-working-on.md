---
type: page
title: "Lore: What is Evan working on?"
description: "Lore: summary of community knowledge on Evan's current cycle"
published: true
status: seedling
authors: "@supermario"
---

<lore></lore>

Evan is currently in a deep cycle exploring Elm within a backend/database context.

There are no timelines for this work, but Evan recently ([Elm Camp 2024](https://elm.camp)) indicated he's starting to look at privately working with a few companies, so it appears to be progressing well.

### Summary of public updates

- [Where can we find the roadmap of Elm - Response July 14 2020](https://discourse.elm-lang.org/t/where-can-we-find-the-roadmap-of-elm/6038/2)
- [`elm/compiler` `roadmap.md` – Feb 3 2021](https://github.com/elm/compiler/blob/master/roadmap.md)
- [Status Update 3rd Nov 2021](https://discourse.elm-lang.org/t/status-update-3-nov-2021/7870)
- [Elm on The Backend - GOTO Aarhus May 22 2023](https://gotoaarhus.com/2023/sessions/2529/elm-on-the-backend)
  > NOTE: My goal is to get some early feedback from the in-person audience, so the video will be held back for now. I am not announcing a release, and the roadmap and this status update are still the primary documents for long-time Elm users to set expectations about this work.
  - This video has not yet been released
- [The Economics of Programming Languages](https://www.youtube.com/watch?v=XZ3w_jec1v8)
  - Project status update [at the end of the talk](https://youtu.be/XZ3w_jec1v8?t=2342)

### When will the Elm compiler / `elm/*` packages see updates/releases?

There is no timeframe on this. See [how Elm Core Development works](/lore/elm-core-development) for more info.


### What about other maintenance?

While the complier changes are in a research cycle, Evan has worked with the community on additional
platform support and improved binary distribution for the current release.

- In January 2021, version 0.19.1.-5 of the npm package was published with an [update](https://github.com/elm/compiler/pull/2156) to download x64 binaries for ARM macs to resolve installation issues on the newly released platform.
- In September 2023, the [0.19.1 releases](https://github.com/elm/compiler/releases) were updated to include a 64-bit Mac ARM binary.
- In November 2023, version 0.19.1-6 of the npm package was published with an [update](https://github.com/elm/compiler/pull/2287) to remove third-party download dependencies and include the new ARM binaries.
