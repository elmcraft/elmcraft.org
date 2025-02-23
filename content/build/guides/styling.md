---
type: page
title: Elm Styling
description: How to style your app with different packages
status: budding
published: false
---

<meta>Needs review</meta>

Styling in Elm is an exciting blend of functional programming and web development that offers several approaches to achieve visually appealing and responsive designs. Elm, known for its strong emphasis on simplicity, reliability, and maintainability, provides different packages to handle styling needs, catering to various preferences and workflows. Whether you're comfortable with traditional HTML and CSS, or looking for more type-safe or declarative approaches, Elm has you covered. The primary packages used for styling in Elm are `elm/html`, `rtfeldman/elm-css`, and `mdgriffith/elm-ui`. Each of these packages offers unique features and benefits, allowing you to choose the one that best fits your project's requirements and your personal coding style. By leveraging Elm's powerful type system and functional programming paradigm, you can create styles that are both robust and easy to maintain.

## elm/html
The [elm-html](https://package.elm-lang.org/packages/elm/html/latest/) package allows you to write HTML directly in Elm. It provides a way to create HTML elements and attributes using Elm's functional programming paradigm. This package is backed by `elm/virtual-dom`, which handles the rendering of DOM nodes efficiently.

**Example with inline styles:**
```elm
module Main exposing (..)

import Html exposing (div, text)
import Html.Attributes exposing (style)


main =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "height" "100vh"
        ]
        [ text "Centered Element" ]
```

**Example with external styles:**
```elm
module Main exposing (..)

import Html exposing (div, text)
import Html.Attributes exposing (class)


main =
    div
        [ class "center" ]
        [ text "Centered Element" ]
```
```css
.center {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
```

**Pros:**
- Directly integrates with HTML, making it easy to use for those familiar with HTML and CSS.
- Efficient rendering with `elm/virtual-dom`.
- Flexibility to use any CSS properties.

**Cons:**
- Requires manual handling of CSS, which can lead to inconsistencies.
- Limited abstraction compared to other packages.

## rtfeldman/elm-css
The [elm-css](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/) package provides a way to write CSS in Elm with type safety. It allows you to define CSS styles using Elm's type system, ensuring that your styles are valid and reducing runtime errors. This package is inspired by CSS preprocessors like Sass and styled-components.

**Example:**
```elm
module Main exposing (..)

import Css exposing (..)
import Html.Styled exposing (div, text, toUnstyled)
import Html.Styled.Attributes exposing (css)


main =
    toUnstyled <|
        div
            [ css
                [ displayFlex
                , justifyContent center
                , alignItems center
                , height (vh 100)
                ]
            ]
            [ text "Centered Element" ]
```

**Pros:**
- Type-safe CSS, reducing runtime errors.
- Reusable styles and mixins.
- Integration with Elm's type system.

**Cons:**
- Requires learning the set of `elm-css` functions.
- Can be verbose compared to traditional CSS.

## mdgriffith/elm-ui
The [elm-ui](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/) package is a complete alternative to HTML and CSS. It allows you to build UIs in pure Elm, with HTML and CSS generated behind the scenes. The goal of `elm-ui` is to simplify the process of creating layouts and styles by providing a more intuitive and error-free approach.

**Example:**
```elm
module Main exposing (..)

import Element exposing (Element, centerX, centerY, el, fill, height, text)


main =
    Element.layout [] <|
        el
            [ centerX, centerY ]
            (text "Centered Element")
```

**Pros:**
- Simplifies layout and styling with a more intuitive API.
- Reduces common CSS errors.
- Encourages a more consistent and maintainable codebase.

**Cons:**
- Limited flexibility compared to raw HTML and CSS.
- Learning curve for those used to traditional HTML and CSS.

## Summary

| Package   | Pros                                                                 | Cons                                                            |
|-----------|----------------------------------------------------------------------|-----------------------------------------------------------------|
| elm/html  | - Directly integrates with HTML <br> - Efficient rendering <br> - Flexible to use any CSS properties | - Requires manual handling of CSS <br> - Limited abstraction    |
| rtfeldman/elm-css   | - Type-safe CSS <br> - Reusable styles and mixins <br> - Integration with Elm's type system | - Requires learning the set of `elm-css` functions <br> - Can be verbose      |
| mdgriffith/elm-ui    | - Simplifies layout and styling <br> - Reduces common CSS errors <br> - Encourages consistency | - Limited flexibility <br> - Learning curve for traditional HTML/CSS users |
