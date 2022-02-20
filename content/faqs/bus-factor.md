---
type: page
title: Elm's Bus Factor
description: A deeper look at a common question
published: false
status: seedling
---

<img width="200" src="/images/pictures/bus-factor.png" />

Upon first discovering that Elm is predominantly designed and developed by its single author Evan Czaplicki, newcomers to Elm often ask:

> What about the (hit by a) Bus Factor? What happens if Evan disappears?"


Elm's Bus Factor is low risk, though if you're new to the community that may not be apparent given the indicators you might look for in other projects.

Let's look at the areas that might be considered a risk.


## 1. Ongoing development of the Elm compiler

The [Elm compiler source code is publicly available](TODO).

The compiler Haskell source is not enormous, and people who've worked with it found it is particularly clean and pleasant Haskell code.

- 26,492 LOC: `src/compiler` - the core compiler code: parser, lexer, canonicalization, type-inference, type-checking, etc.
- 5,500 LOC: `src/builder` - the compiler support code: CLI, package dependencies, Javascript output, HTTP/File helpers, etc.

There are a number of [people who work with the Elm compiler source code](TODO).

There are [companies who provide services for modifying and maintaining a custom Elm compiler](TODO).

Most users and companies are using Elm as it is today without any major compiler issues.

Overall, if Evan disappeared tomorrow, users would not be impacted, and compiler maintenance could be picked up by others.

<pill color="green">Risk: Low</pill>


See also: [When will Elm be v1.0?](TOOD).



## 2. Ongoing development of elm/* packages

All Elm package source is publicly available, with links to source code on each package page.

A [modified Elm compiler that queries a different package URL](TODO) already exists.


<pill color="green">Risk: Low</pill>



## 3. Ongoing design of Elm

Elm is not a community or committee-designed language. Elm is the way it is today because of [Evan's design approach](TODO).

There is no mitigation to the bus factor of this design approach – our goal is to preserve it, not change it.

"Add more people" would change Evan's design approach _**now**_, forcing the bus factor before the bus!

Our best bet is to wish Evan a long and healthy life, and know the design process won't be the same again without him.

<pill color="grey">Risk: N/A</pill>


See also: [Elm's roadmap](/faqs/elm-roadmap).



## 4. Package Manager

The [Elm package manager source code is publicly available](TODO).

A [modified Elm compiler that queries a different package URL](TODO) already exists.

An [offline cache of the entire Elm package index](TODO) already exists.

<pill color="green">Risk: Low</pill>
