---
type: page
title: "Lore: Elm Core Development"
description: "Lore: Elm Core Development community history & cultural knowledge"
published: true
status: seedling
authors: "@supermario,@gampleman"
editors: "@jfmengels,@wolfadex"
---

<lore></lore>

<tldr>**TL;DR:** Elm core dev (Evan) works differently, with tradeoffs some people dislike. Those conversations repeat. Core is considered stable, there are [no critical bugs or blockers](https://github.com/elm-janitor/manifesto). Rare [critical issues get attention](https://github.com/elm/virtual-dom/issues/168#issuecomment-1125076213). [Elm core design won't change for a while](https://discourse.elm-lang.org/t/where-can-we-find-the-roadmap-of-elm/6038/2). [Evan is in a long cycle working on an Elm-DB exploration](/lore/what-is-evan-working-on). The [Elm community is very active](/).</tldr>


> This article describes some of the peculiarities of Elm’s development model and their consequences. This model isn’t to everyone’s taste. We have noticed that there is often a desire to vocally criticise this model. That’s okay - there are certainly aspects worth criticising. We summarise or generalise some of these criticisms and try to respond to them, clearly delineating between productive and unproductive ways to move forward.
>
> **After all, we've had these conversations before. This repeated dialogue causes a lot of stress and emotional work for everyone involved.** This content has been written in the hope we can help future reincarnations of this dialogue resolve or advance, and help everyone find their place in it quickly and without unnecessary drama.

---

*Authored by non-core Elm community members: Mario Rogic and Jakub Hampl. Both Mario and Jakub have been in the Elm Community since 2016. Mario maintains [Lamdera](https://lamdera.com) and Elmcraft. Jakub works on [elm-visualization](https://package.elm-lang.org/packages/gampleman/elm-visualization/latest/). This page expresses our private opinions; however we have some indication that these ideas are not uncommon among the more seasoned members of the community. Editors: Jeroen Engels, Wolfgang Schuster.*

---



## Contents

<toc></toc>


## Current status

Elm is a language designed and developed by Evan Czaplicki. Elm core development functions differently to the average open source project.

Today the “[Elm Core Team](/lore/elm-core-team)” consists of Evan Czaplicki and Tereza Sokol. The projects they cover are:

- [The Elm Compiler](https://github.com/elm/compiler)
- [https://elm-lang.org/]() - [github](https://github.com/elm/elm-lang.org)
- [https://package.elm-lang.org/](https://package.elm-lang.org/) - github
- The `elm/*` Elm packages: [elm/core](https://package.elm-lang.org/packages/elm/core/latest/), [elm/browser](https://package.elm-lang.org/packages/elm/browser/latest/), [elm/bytes](https://package.elm-lang.org/packages/elm/bytes/latest/), [elm/file](https://package.elm-lang.org/packages/elm/file/latest/), [elm/html](https://package.elm-lang.org/packages/elm/html/latest/), [elm/http](https://package.elm-lang.org/packages/elm/http/latest/), [elm/json](https://package.elm-lang.org/packages/elm/json/latest/), [elm/parser](https://package.elm-lang.org/packages/elm/parser/latest/), [elm/random](https://package.elm-lang.org/packages/elm/random/latest/), [elm/regex](https://package.elm-lang.org/packages/elm/regex/latest/), [elm/svg](https://package.elm-lang.org/packages/elm/svg/latest/), [elm/time](https://package.elm-lang.org/packages/elm/time/latest/), [elm/url](https://package.elm-lang.org/packages/elm/url/latest/), [elm/virtual-dom](https://package.elm-lang.org/packages/elm/virtual-dom/latest/), [elm-explorations/markdown](https://package.elm-lang.org/packages/elm-explorations/markdown/latest/)

All these projects (the “Elm core projects”) are released with an open source licence ([BSD-3-Clause](https://github.com/elm/core/blob/master/LICENSE)).

In many open source projects, this generally comes with some **implicit/defacto expectations** that other things will also be open; i.e. design, governance, future direction and contributions.

Evan's approach to these areas diverges from conventional open-source practices. Elm core development uses a [batching development workflow](https://github.com/elm/expectations/blob/master/batching.md), and Evan has spoken about his philosophy for Elm design & development if you’d like to understand it:

- [What is Success?](https://youtu.be/uGlzRt-FYto)
- [Code is the easy part](https://youtu.be/DSjbTC-hvqQ)
- [The Hard Parts of Open Source](https://www.youtube.com/watch?v=o_4EX4dPppA)
- [Costs/Funding in Open-Source Languages](https://discourse.elm-lang.org/t/costs-funding-in-open-source-languages/5722)

Evan's latest status for the Elm core language is: [“If you like what you see now, that’s pretty much what Elm [core] is going to be…”](https://discourse.elm-lang.org/t/where-can-we-find-the-roadmap-of-elm/6038/2).

All the action in the Elm community happens mostly outside the Elm core projects, and that’s where it makes sense to focus your energy.

## Common negative sentiments

Note: for newcomers, many of these questions are natural, and it might be their first time asking them, even though others have heard the sentiment dozens of times.


### Why is there no activity on `<some core repository>`? There have been `<number>` of open PRs for `<long unit of time>`!

Evan chooses to work in a [batching development workflow](https://github.com/elm/expectations/blob/master/batching.md), which means Elm core repositories don’t prioritise consistent activity as a signal for health. Evan’s design philosophy also tends to view issues holistically, not attempting to resolve issues one at a time, as is most common. [“It's better to do it right than to do it right now.”](https://twitter.com/evancz/status/928359227541798912) is the thinking that guides this.

Additionally, because of Elm’s design, many of the core repositories are stable. What this means is that for professional Elm developers, these open issues and PRs tend not to be significant issues in practice.

In the rare case there are security issues, there is [precedence for these being prioritised](https://github.com/elm/virtual-dom/issues/168#issuecomment-1125076213), see [How to report critical issues](/lore/how-to-report-critical-issues).



### I think Evan/”the core team”/”leadership” should just `<some action>`, it would `<good outcome>` for `<good arguments>`.

We often agree, it does *seem* that `<some action>` could lead to the `<good outcome>` and you’ve made some `<good arguments>`.

We don’t control Evan's focus or process however. Elm core is open sourced code, but not open governance. Evan has chosen a process that has a different set of tradeoffs and made his position clear.

To reiterate: a bunch of Elm community members might agree with you! But we’re not in a position to make changes to the Elm core development model. It is also very probable that Evan has heard your `<good argument>` before. He has made it clear that he does not want to change the model and isn’t (as far as we can tell) particularly interested in revisiting these discussions at this time.


### I guess the Elm community just wants to ignore/avoid this problem and not have `<good outcome>`.

While we understand the frustration, ultimately this is a problem with accepting that:

- We cannot control people
- Other people make different choices than we might
- `<good arguments>` and `<good outcomes>` don’t invalidate the prior two points

This creates a fork in the road based on acceptance.

Arguments and debates usually spring up between people who’ve chosen different paths:

- Some people cannot accept Evan’s chosen approach, or the fact it means `<some action>` can’t/won’t happen right now/ever
  - Some of those people have stopped using Elm and/or left the Elm community as a result
  - Some of these departures have been very vocal and critical
  - Some of that criticism has been picked up by people who were never in the community as a reason to never join, or discourage others from doing so
  - This leads to repeated negative dialogue by some people anytime Elm is mentioned in certain forums: Reddit & HackerNews specifically repeats this pattern
  - Some people in this group tend to re-emerge whenever this topic gets brought up and pile on inaccurate characterisations, derailing discussions
- Some people choose to focus on the large area outside of core where they can contribute.
  - **This does not imply everyone loves everything about Evan’s choices and hasn't been frustrated at some point**
  - This is most of the active Elm community
  - Many people choose to participate in building out a rich ecosystem on top of Elm core
    - Some of these people are very excited about the future of Elm
  - Some people choose explore new areas in a way that is compatible with Elm core
    - [Lamdera](https://lamdera.com), a backwards/forwards-compatible soft-fork of the Elm compiler, with features for full-stack Elm and extensions for Elm tooling authors and Elm users
    - [elm-pages](https://elm-pages.com) - JAMstack for elm.
  - Some people take inspiration and start new initiatives not compatible with Elm core
    - [Gren](https://gren-lang.org), a hard fork of Elm by Robin Heggelund Hansen, previous contributor to various Elm projects


The Elm community is not ignorant of the trade-offs of Evan’s choices – we just acknowledge they are the trade-offs he has chosen and communicated repeatedly.

We’re also human: the tradeoffs may not be ideal, they may not be the ones we would have chosen, but there is no choice that pleases everyone: so we respect Evan’s right to choose.


### Why doesn't someone talk to Evan and make him see sense?

Arguments in this line seem to carry a few assumptions:

- That Evan has never had these conversations before / is uninformed / is ignorant
- That because Evan is “obviously wrong”, the only remaining issue is to badger him until he “becomes rational” and changes his mind

Since the second has been tried a lot (unsuccessfully), we can safely conclude the first isn't the case.

Evan spoke directly about this topic in [“The hard parts of Open Source”](https://www.youtube.com/watch?v=o_4EX4dPppA).


### But surely this way of doing things will cause people to abandon Elm? How is Elm going to achieve wide adoption?

There is a certain inconsistency between some early Elm material (notably [“Let’s be mainstream!”](https://www.youtube.com/watch?v=oYk8CKH7OhE)) and some of the later material (notably [“The hard parts of Open Source”](https://www.youtube.com/watch?v=o_4EX4dPppA)). Elm in the more distant past indeed was - and promoted itself to be - more open to participation, and a lot of this was scaled back over time. Humans are like that - we change. Our situations change. Our opinions and the tradeoffs we are willing to make evolve as we get older and get to know ourselves. Elm also matured in that time and became relatively stable compared to other ecosystems.

<wip note="Mario: come back to this when we have a page to link to">The 0.19 Kernel Saga is an example of an event that was difficult for many along this path.</wip>

It is fair to say that modern Elm is far more content to stay in its own niche. Evan's position today isn’t really “You should be using Elm!” but more “Elm is pretty great - but not necessarily for everyone”. This is a pretty important (and perhaps under-acknowledged) change.

Part of enjoying the benefits of Elm is understanding and accepting the constraints on Elm core changes.

There are many individuals and companies who find huge benefit in Elm despite the tradeoffs of the current core design approach, and have no plans to abandon Elm.


### So basically you don't want anyone to talk about this

A number of Elm community members who have seen this discussion in various similar forms over the years are tired because:

- Discussions tend to rarely bring up new discussion points
- Comments are either vaguely addressed to Evan (who is not present in the specific conversation), or to "[the core team](/lore/elm-core-team)" (Evan again)<note>Acknowledging this might also be an instance of [psychological distancing](https://en.wikipedia.org/wiki/Construal_level_theory), which allows for more abstract and comfortable expression of critique & frustration, at the expense of clarity on who should address it.</note> or to "the community" (i.e. no-one in particular).
- There is usually no clear request or suggestion for what authors think should be done that ultimately _isn't_ explicitly or implicitly targeted at Evan
- This ends up feeling (and often reading) like being dragged into a [drama triangle dynamic](https://en.wikipedia.org/wiki/Karpman_drama_triangle) exhausting everyone
- The conversation reaches no conclusion or action
- In a few weeks or months a similar conversation repeats


## How to progress this dialogue <br/>

We don’t want to shut down new conversation, but we do want to respectfully address repeats of old conversations.


### Helpful ways to progress

- A new discussion point
  - That isn’t essentially built on the prerequisite of “making Evan do `<some action>`”
  - That has a clear request or action tied to it directed to a clear recipient
- Taking personal action
  - Start a project that improves the status quo
  - Support existing Elm projects that seek to improve the status quo by contributing to, or [funding them](https://github.com/jfmengels/awesome-elm-sponsorship)
- Seeking understanding
  - Many folks are using Elm in production, and are very happy with it. Many folks are so excited about Elm they spend countless hours building tools, projects, attending events, and supporting other community members with questions.
  - Why? How are they contextualising & managing the downsides of the Elm core process?

This page you're reading now is an example of something some people tried to do to improve the situation.


### Unhelpful ways to progress

- Making longer lists of `<good arguments>` for why Evan should do `<some action>`
- Jumping to negative conclusions about other people's motivations or intent
- Inflaming the discussion with subjective value labels of people (“good”, “bad”, “doesn’t care”, “ignoring”)
- Reiterating subjective value statements or undirected opinions, i.e
  - “This isn’t how open source should work”
  - “This is obviously a bad approach”
  - “Evan is purposely blind to `<bad outcome>` happening”
  - “Clearly Evan doesn’t care about `<bad outcome>`!”
  - “Evan is killing Elm!”
  - “Nobody is going to use Elm anymore!”
- Presenting inaccurate or subjective statements about past events as facts
  - “Evan took away Kernel because he doesn’t trust anyone!” - this is misleading, see [Lore: Elm’s Kernel Code](/lore/elm-kernel-code)
  - “Only the blessed core team get to do X!” - there is no core team and there never really was, see [Lore: Elm’s core team](/lore/elm-core-team)
