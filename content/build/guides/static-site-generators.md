---
type: page
title: Elm Static Site Generators
description: How to design, develop, and maintain websites and web applications with static site generators in Elm
status: budding
authors: "@novid"
editors: "@supermario"
published: true
---

[Static Site Generators (SSGs)](https://jamstack.org/generators) provide a structured way to create fast, maintainable websites. Unlike traditional dynamic sites, static sites are pre-rendered at build time, making them efficient and secure. In this guide, we’ll explore three static site generators in Elm: **elm-starter**, **Elmstatic**, and **elm-pages**. Each tool offers unique features and workflows, helping developers choose the best fit for their projects.

<toc></toc>

## lucamug/elm-starter

[elm-starter](https://github.com/lucamug/elm-starter) is an experimental Elm-based bootstrapper designed to generate Progressive Web Applications (PWAs). It focuses on pre-rendering pages at build time, ensuring offline functionality and search engine optimization.

### Basic Workflow

```sh
# clone the repository
git clone https://github.com/lucamug/elm-starter.git project-elm-starter
cd project-elm-starter
rm -rf .git

# install dependencies
npm install

# start the development server
npm start

# build for production
npm run build
```

### Pros and Cons

- ✅ Generates PWAs with offline support.
- ✅ Works without JavaScript.
- ✅ High SEO levels with Lighthouse.
- ✅ Basic documentation available.
- ❌ Lack of CLI tooling.
- ❌ Requires manual setup for existing Elm projects.

## alexkorban/elmstatic

[Elmstatic](https://korban.net/elm/elmstatic) is a static site generator that allows you to write page layouts in Elm, and content in Markdown. You're free to use whatever you like for layouts: elm/html, elm-css, elm-ui etc. It can generate sites with pages and blog posts, post tags and post lists for each tag, subsections with their own post streams, and RSS feeds.

### Basic Workflow

```sh
# install the package
npm install -g elmstatic browser-sync

# initialize a project
mkdir project-elm-static
cd project-elm-static
elmstatic init

# start the development server
elmstatic watch
cd _site
browser-sync start --server --files "." --no-ui  --reload-delay 500 --reload-debounce 500

# build for production
elmstatic build
```

### Pros and Cons

- ✅ Minimalistic and easy to use.
- ✅ Direct Elm-to-HTML conversion.
- ✅ CLI tooling available.
- ✅ Basic documentation available.
- ❌ Limited flexibility for dynamic content.
- ❌ Requires additional tooling for complex projects.

## dillonkearns/elm-pages

[elm-pages](https://elm-pages.com) is a framework for building an Elm single-page app that is able to seamlessly interface with data from an Elm Backend. elm-pages is a hybrid framework, allowing you to define Routes that are either server-rendered (for more dynamic content with user-specific or request-specific data) or pre-rendered at build-time (for generating static HTML files that are hosted through a CDN). You can mix and match server-rendered and pre-rendered routes in your app.

### Basic Workflow

```sh
# initialize a project
npx elm-pages init project-elm-pages
cd project-elm-pages

# install dependencies
npm install

# start the development server
npx elm-pages dev

# build for production
npx elm-pages build
```

### Pros and Cons

- ✅ Supports both static and dynamic routes.
- ✅ Strong integration with Elm backend.
- ✅ CLI tooling available.
- ✅ Well-maintained and actively developed.
- ❌ More complex setup compared to other tools.
- ❌ Requires understanding of Elm’s backend integration.

## Conclusion

Each of these tools offers unique advantages. **elm-starter** is great for PWAs, **Elmstatic** is simple and direct, while **elm-pages** provides a hybrid approach for more complex applications. Choosing the right tool depends on your project’s needs and desired level of flexibility.
