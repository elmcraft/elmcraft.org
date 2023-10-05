# Elmcraft.org Website

Before contributing please see the [Discuss](https://elmcraft.org/discuss) page.

---

Built with [elm-pages](https://elm-pages.com/).

The entrypoint file is `index.ts`. That file imports the generated elm-pages harness.

The `content` folder markdown files are currently turned into static pages entirely via the single `Route.SPLAT__` module mapping.

Pretty much everything else about the site, from theming to functionality, is done from Elm.


## Development

```
git submodule init && git submodule update
npm install
# starts a local live-reloading dev server
npx elm-pages dev
```

From there you can tweak `content/` files or change the Elm code.

:warning: On the homepage and video pages you'll get an error about a `NOTION_TOKEN` being missing – please skip those pages for now we're going to migrate away from Notion. Ping @supermario if this is a blocker for what you're working on.


## Pages

To make a new page, simply add a new `your-path/your-page.md` in `content/`.

The 'frontmatter' (bits between `---` at the top of the markdown file) drives other static gen config i.e. SEO, and can be extended if needed (see [`DataSource.MarkdownElmUi`](https://github.com/elmcraft/elmcraft.org/blob/main/src/DataSource/MarkdownElmUi.elm#L24)).

`elm-pages` will pick up new pages, compile them and type check them.

Navigation UI can be updated in `src/Theme/Navigation.elm`.


## Theme

`src/Theme/*` has most of the UI components split up.

See `src/Theme/All.elm` for which markdown/html tags end up being rendered by which components.

All the UI is built with [`elm-ui`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/).

## Data Sources

(Note: these are conceptually [`BackendTask`](https://package.elm-lang.org/packages/dillonkearns/elm-pages/latest/BackendTask) in elm-pages-v3, but we've not renamed them here yet)

- `src/DataSource` contains elm-pages data sources
- `src/DataStatic` contains hardcoded data in Elm format

Generally err towards static data and if it becomes high churn then we can move it to Notion or elsewhere


## Static files

All static files including images should go into `public/`.
