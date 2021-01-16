# Elmcraft.org Website

Built with [elm-pages](https://elm-pages.com/).

The entrypoint file is `index.js`. That file imports `src/Main.elm`. The `content` folder is turned into static pages. The rest is mostly determined by logic in the Elm code! Learn more with the resources below.

## Development

```
npm install
npm start # starts a local dev server using `elm-pages develop`
```

From there you can tweak the `content` folder or change the `src/Main.elm` file.


## Pages

To make a new page, simply add a new `your-path/your-page.md` in `content/`.

The 'frontmatter' (bits between `---` at the top of the markdown file) drives other static gen config i.e. SEO, and can be extended if desired (see `src/Metadata.elm` for the mappings).

`elm-pages` will pick up new pages, compile them and type check them.

Navigation UI can be updated in `src/Templates/Navigation.elm`.


## Templates

`src/Templates/*` has most of the UI components split up.

See `src/Templates/All.elm` for which markdown/html tags end up being rendered by which components.

The UI on the Elm side is built with the [`elm-ui`](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/) library.


## Static files

Images should go into `images/` – elm-pages picks these up and generates optimised versions in final build.

Also anything static placed inside `public` will be [copied to in root](package.json#L8) at deploy.
