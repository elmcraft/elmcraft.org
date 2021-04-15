---
type: page
title: "Elm ❤️ Engineering"
description: Discover elm-ui, A New Language for Layout and Interface
---

Elm is not just a pleasant "beginner" language. It can be used to build powerful real-world web applications<sup>[1](???)</sup>, that are tiny and fast to download<sup>[2](https://medium.com/dailyjs/a-realworld-comparison-of-front-end-frameworks-2020-4e50655fe4c1)</sup>, and best of all: that are really hard to crash while your users are using it<sup>[3](https://www.infoq.com/news/2017/05/elm-zero-runtime-exception/)</sup>. But how does it manage this?

### Real World Applications

Elm is ready to create single-page apps without _any_ extra dependencies, no need to select a state management library, or a router library, or anything else really, it's all part of the package. That being said, there are useful libraries that you can use to get you running faster – for instance, check out [elm-spa](https://www.elm-spa.dev) for one of the simplest Elm experiences available.

If your application requires static files for better SEO and faster rendering time, [elm-pages](https://elm-pages.com) is your tool for the job. Want to work with 3d in the browser? Check out [elm-webgl](https://package.elm-lang.org/packages/elm-explorations/webgl/latest) – some people creating really interesting things with it<sup>[4](https://erkal.github.io/elm-3d-playground-exploration/multiple-shadows-from-ianmackenzie/)</sup>.

### Small Assets

Elm's [dead code elimination](https://elm-lang.org/news/small-assets-without-the-headache) is one of the best friends of an Elm developer. Since Elm is a purely functional language, there are no hidden dependencies for your functions, so everything that is not used is removed from your production code. After removing all of this dead code, the Elm compiler will optimize everything even more and produce a single javascript file.

Want to take things one step further? Then check out [elm-review](https://jfmengels.net/safe-dead-code-removal/) – it will analyse your code and let you know if there are any things that are being referenced to but not really being used, more dead code elimination.

### Safety

With Elm's strong type system, it's almost impossible to create runtime exceptions. The compiler will warn you whenever some part of your code will possibly cause issues and it will guide you step by step on how to fix it. This is part of the reason Elm's compiler got so famous and is now inspiring other languages like Rust and Rescript to create friendly compilers.

!(Elm Compiler suggestions)[TODO]
