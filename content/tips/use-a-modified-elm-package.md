---
type: page
title: How to use a modified Elm package in your app
description: There are a number of ways to use a modified Elm package in your app
published: true
---

There are a number of ways to use a modified Elm package in your app.


## Publishing a new package

The official route is publishing your own package. The `elm publish` command should guide you through what's needed.

You can also check out these user-guides:

- [The basic steps to publish a package with Elm 0.19](https://korban.net/posts/elm/2018-10-02-basic-steps-publish-package-elm-19/)
- [How to publish an Elm package](https://medium.com/@Max_Goldstein/how-to-publish-an-elm-package-3053b771e545)


## Alternative ways to use a modified Elm package

Sometimes you don't want to publish another Elm package (i.e. when you've made  PR to the original author, but would still like to use your modifications immediately).

Alternative approaches are:

### 1. Vendor the package

I.e. move all the package source code directly into your project. You can do this by:

- Adding the source directly into `src/`
- Using `source-directories:` in `elm.json` to include additional code
    - I.e. `source-directories: [src/, ../../../that_lib/src]`
    - This approach also works with `git submodule`s if you'd like to ensure the included source is also under git control.

This approach requires you to also install the package's sub-dependencies into your project

### 2. Use [`elm-git-install`](https://github.com/robinheghan/elm-git-install)

This helps automate approach (1) by the addition of an `elm-git.json` file.

Check out the [`elm-git-install README`](https://github.com/robinheghan/elm-git-install#readme) for instructions.
