---
type: page
title: "Elm ❤️ Humans"
description: Discover the joy of reading, writing, thinking and designing in Elm
---

SWBAT:

See that Elm is accessible to all levels of experience & expertise

- You don't need to be clever to use it, but you can use it cleverly
- It was designed to be as easy as possble to write without bugs
- Humans need all the help we can get to stop us making logic errors
- It has a minimal set of functionality to learn
- easy to get started
- composable pieces
- Thoughtful language design, led by strong principles
- Lends itself to diverse teams
- It's not over engineering to use on a small app or prototype
- It's not unweildy to use on a large application

Approach:

- Show syntax is not that different to what use to & few variations
- Illustrate state management - as a one way flow rather than web
- Let Evan speak for himself on language design & feature choices
- Demo helpful error messages & no compile on typo etc
- Refactor joy rather than stress
- Fewer conventions to learn - state pattern, syntax, makes projects more globally approachable [Link to hiring page?]
- Examples from the community of how they have found Elm "easy to use"

What makes Elm such a great match for Humans? For starters, it was designed with us in mind, not for the computer's benefit. Computers are great at processing lots of information. Humans as not. You don't learn Elm, you just use it.

<internal>
Quote from Evan - maybe the Storytelling talk (conflict -> shared language -> story -> news!)
</internal>

Other languages focus on adding features. Elm tries to think about how assing features factors into the human experience - making it more delightful to use.

[Evan on storytelling](https://www.deconstructconf.com/2017/evan-czaplicki-on-storytelling)

<internal>

Content type - pandoras box/ explode the universe - the rabbit hole! Evan's sources: Public Opinion (Walter Lippmann), Century of Self (documentary) (Adam Curtis), Nagarjuna, Why all the fighting/misunderstanding about types?

Why other type systems feel like you have to fight them.
[gradual type systems: Video](https://www.thestrangeloop.com/2019/typing-the-untyped-soundness-in-gradual-type-systems.html)

</internal>

## Error messages

It's easy to make mistakes like these.

Can you spot the syntax errors in these code examples.
Bait -> click and we say that you don't need to do that with elm.

<internal>
Interactive example with narrative showing common mistakes like typos or mismatched data queries
</internal>

[Evan on syntax and error message design](https://elm-lang.org/news/the-syntax-cliff)

## One state management system

It's easier to find where the problem is when you don't have a complex multidirectional web of bindings between your effect and state. Every Elm application uses the same pattern, so it's easier to understand projects new to you.

<internal>image</internal>

[Animation and short blog demonstrating The Elm Architecture](https://lucamug.medium.com/the-elm-architecture-tea-animation-3efc555e8faf)

[Official explanation for The Elm Architecture](https://guide.elm-lang.org/architecture/)

<internal>
For when we have TEA page
[Presentation of TEA](https://docs.google.com/presentation/d/14rYuf7BzCZj8qjxGGRWpT1YVWdo_rG-FFiwNSEmFBV4/edit#slide=id.g29715b5cf0_0_257)
</internal>

## Readability and conversations

<internal>

### Custom types we can express our data models and logic with meaningful words.
<internal>This might be too complex for the human page</internal>

Elm makes it easy to to define aliases for primatives so your code is easier to read and use.

This signature does make it clear what the function needs and does:
`String -> Bool -> Int -> String`

This one is much easier to work with:
`Pronouns -> ShareAge -> Age -> BadgeText`

The difference in code is:
todo


<internal>couple of videos - maybe Jono or Joel</internal>

If you need the compiler to be even more helpful, you can dive a bit deeper:
[Phantom Types explained](https://thoughtbot.com/blog/modeling-currency-in-elm-using-phantom-types)

</internal>

### Encourages to name well & easier to read and review

<internal>Emma naming video</internal>
<internal>unipod video big japanese team strategies</internal>

### Lightweight syntax (lack of redundant keywords and extra punctuation)

Elm is a small surface area language.
Slide 9 presentation - in javascript you have to make x decisions and learn x concepts in elm is built into the language so you only have to learn x

<internal>Illustration showing lack of noise</internal>

<internal>
Interactive example - showing it's not as different to other languages when scratch surface
</internal>

### One agreed format, so every project reads the same

Once you get used to reading it you don't have to think about it between projects.

- jumping between elm projects easy to parse
- no debates about which way is easier to read
- single 0 config tool that everyone uses

 <internal>demo elm format</internal>

## Everything is a function 

Less types of base building blocks, less confusion. Everything returns so you don't have to label with `return` and `function` but you can still read as easily because there is only one kind of stuff.

<internal>illustration robot processer - something in something out</internal>

