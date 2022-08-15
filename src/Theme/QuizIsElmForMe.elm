module Theme.QuizIsElmForMe exposing (..)

import Element exposing (..)
import Element.Font as Font
import MarkdownPlain
import Pages
import Theme.UI exposing (..)


view model =
    column
        [ width fill, spacing 20 ]
        [ heading2 [] "Quiz: Is Elm for me?"
        , MarkdownPlain.fromString """

Stream of thought stuff below. Need to figure out best way to organise it all. Currently thinking a "Yes, No, Unsure" options.

This is just another format effectively for the "Discover" sections, but perhaps a bit more engaging/interactive.

Like a chatbot but for finding out stuff about Elm.


Outcome would be a "report" that might have sectioned results i.e.:

---

### ✅ Elm has excellent maintainability & refactoring

You answered "Yes" to "Is long term maintennance important to you?".

Elm has exceptional maintainability and refactoring compared to other frontend languages & frameworks.

.. carousel of some testimonials about maintainability/refactoring ..

Find out more:

- Explore [How Elm makes refactoring and maintainability a joy](TODO)
- Read [Experience reports from companies maintaining large Elm apps](TODO)
- Read [Experience reports people who undertook 0.18 -> 0.19 major version upgrades](TODO)


### ⚠️ Elm JS interop is not direct FFI

You answered "Unsure" to "Is direct JavaScript FFI or usage of NPM packages on the frontend important to you?"

Elm JS interop works via Ports, an explicit, type-safe and asyncronous in/out binding to JavaScript.

Elm is a pure/effect free language, with function-level dead-code-elimination made possible by this design choice.

It also means Elm has [automatic package semvar](TODO) and better [package code security](TODO) than other frontend languages.

If direct JS interop is important/required for you, or you need syncronous FFI semantics, Elm is not best suited for this. You might like to evaluate [Purescript](https://www.purescript.org/) or [Reason](https://reasonml.github.io/) as alternatives.

### ⚠️ Some other thing ...
etc

### Summary

Want to know more about these results? Feel free to ask questions in the [friendly community channels](/community/formus-chat)!

### See also

Based on your answers, these pages may interest you:

- How to use Elm at work
- Commercial success stories with Elm
- ...


---

Would be cool if such a final report was linkable, so people could ask questions about it, and we can keep it "live" by updating our advisory on things.



### General thoughts / rough notes


Curious / Beginner / Developer


JS developer expectations
- Raw access to JS/Browser APIs
- Wants to use NPM JS libraries?


Frontend Developer
- UI libraries & components? Tailwind etc?
- Wants to use NPM JS libraries?


Backend
- Awareness that Elm is not a backend language?
- Delightful and pain free UI (for those that are looking to avoid JS/HTML/CSS?). Elm-ui etc.


Non-JS developer
- Wants to use NPM JS libraries?


Businesss

- Is hiring hard? (link FAQ)
- What about Evan bus factor? (link FAQ)



        """
        ]
