---
type: page
title: How to use a modified Elm package in your app
description: There are a number of ways to use a modified Elm package in your app
published: true
status: budding
---

There are a number of ways to use a modified Elm package in your app.


### 1. Vendor the package

Include the package source code directly in your project. You can do this by:

- Adding the source directly into `src/`, or
- Using `source-directories:` in `elm.json` to include additional code
    - I.e. `"source-directories": [ "src/", "../../your_modified_package/src" ]`
    - This approach also works with `git submodule`s if you'd like to ensure the included source is also under git control

Note: This approach also requires you to install the package's sub-dependency packages directly into your project, which you can solve by following the compiler's suggestions.



### 2. Use [`elm-git-install`](https://github.com/robinheghan/elm-git-install)

This helps automate approach (1) by the addition of an `elm-git.json` file.

Check out the [`elm-git-install README`](https://github.com/robinheghan/elm-git-install#readme) for instructions.



### 3. Publish a new package

Sometimes you don't want to publish another Elm package (i.e. when you've made a PR to the original package, but would still like to use your modifications immediately), so approaches (1) and (2) are suitable.

Otherwise, the final route is publishing your own package. Note: this cannot be undone! Packages published to the Elm package index are permanent.

Publishing a fork of a package makes it harder for everyone in the community to find high-quality packages. If you're looking for a library to resize images and you find `author1/resize-image`, then you can look at the documentation and see if it fits your needs. If you see both `author1/resize-image` and `author2/resize-image` with virtually the same documentation, then that gives users additional work to figure out and decide which package to use. We should try to avoid this as much as possible for everyone's sake.

The `elm publish` command should guide you through what's needed.

You can also check out these user-guides:

- [The basic steps to publish a package with Elm 0.19](https://korban.net/posts/elm/2018-10-02-basic-steps-publish-package-elm-19/)
- [How to publish an Elm package](https://medium.com/@Max_Goldstein/how-to-publish-an-elm-package-3053b771e545)
