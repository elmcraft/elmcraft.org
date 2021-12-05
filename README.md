# Elmcraft.org Website

Built with [elm-pages](https://elm-pages.com/).

The entrypoint file is `index.js`. That file imports the generated elm-pages harness.

The `content` folder markdown files are currently turned into static pages entirely via the single `Page.SPLAT__.elm` page mapping.

Pretty much everything else about the site, from theming to functionality, is done from Elm.


## Development

We're currently using some elm-pages v2 pre-release plug-ins via a submodule.

```
git submodule init
git submodule update
npm install
NOTION_TOKEN="<ask mario for token>"
npx elm-pages build
npm start # starts a local live-reloading dev server
```

From there you can tweak the `content` folder or change the Elm code.


## Pages

To make a new page, simply add a new `your-path/your-page.md` in `content/`.

The 'frontmatter' (bits between `---` at the top of the markdown file) drives other static gen config i.e. SEO, and can be extended if desired (follow from [`decodeMeta`](https://github.com/elmcraft/elmcraft.org/blob/main/src/Page/SPLAT__.elm#L55)).

`elm-pages` will pick up new pages, compile them and type check them.

Navigation UI can be updated in `src/Templates/Navigation.elm`.


## Templates

`src/Templates/*` has most of the UI components split up.

See `src/Templates/All.elm` for which markdown/html tags end up being rendered by which components.

The UI on the Elm side is built with the [`elm-ui`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/) library.

## Data Sources

- `src/DataSource` contains elm-pages data sources
- `src/DataStatic` contains hardcoded data in Elm format

Generally err towards static data and if it becomes high churn then we can move it to Notion or elsewhere


## Static files

All static files including images should go into `public/`.
