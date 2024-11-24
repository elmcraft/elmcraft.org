module DataStatic.Videos exposing (..)

import Types exposing (..)


all =
    [ { categories = [ ElmPhilosophy, Iconic ]
      , description = "In the mythology of open source, programming languages are created by people who seemingly have no direct economic function. They are just really good at compilers (somehow) and have a house to live in (somehow) and have a lifetime to devote to creating a useful programming language (somehow!)\nWe will examine specific organizations that create programming languages. Where do the salaries for compiler engineers come from? How does Go end up with 5 engineers and Dart end up with 30? Who signs off on these expenses and why? Does this put any boundaries on language design or development practices? And how do the economics work for people outside of the major tech corporations?\nMy goal is to give the talk I needed to hear 10 years ago when I was just starting on Elm. By clearly delineating the many variations of corporate funding and independent funding, I hope users will come away with a better foundation for evaluating and comparing programming languages."
      , event = EventUnknown "Strange Loop 2023"
      , name = "The Economics of Programming Languages"
      , speaker = "Evan Czaplicki"
      , url = "https://www.youtube.com/watch?v=XZ3w_jec1v8"
      , year = "2023"
      }
    , { categories = [ Hobby, Project, WebGL, Games, Concept, Learn ]
      , description = ""
      , event = EventUnknown "Func Prog Sweden"
      , name = "Making a game with Elm and Lamdera"
      , speaker = "Martin Stewart"
      , url = "https://www.youtube.com/watch?v=pZ_WqwRwwao"
      , year = "2023"
      }
    , { categories = [ Technique ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Yet another way to manage\nshared state in Elm SPAs"
      , speaker = "Jeremy Brown"
      , url = "https://www.youtube.com/watch?v=-mT8ikoIQeI"
      , year = "2022"
      }
    , { categories = [ Technique ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "The joy of stateless\nUI components"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=tmUuHOYKH1Y"
      , year = "2022"
      }
    , { categories = [ Project, Technique ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Foolproof* multiplayer* games in Elm*"
      , speaker = "Martin Stewart"
      , url = "https://youtu.be/Fkj2Is6jxCE"
      , year = "2022"
      }
    , { categories = [ ExperienceReport ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Let Github Copilot write\nyour Elm for you"
      , speaker = "Charles Assus"
      , url = "https://youtu.be/CxVJDcNLbao"
      , year = "2022"
      }
    , { categories = [ Project, Concept ]
      , description = "A linter is a very useful tool that developers use to find problems in their code and make sure it works correctly. But contrary to compiler errors which are followed to the letter, developers often ignore the errors reported by the linter even though both have the same goal: make sure your code works well.\nDevelopers don't actually trust their linter, and a substantial number of developers even stop using them altogether because of that. In this talk, we'll explore the underlying reasons and how to solve them. We'll look at the problem from the design aspect of the tool, as well as from the users' side."
      , event = EventUnknown "GOTO Copenhagen 2022"
      , name = "Why you don’t trust your linter"
      , speaker = "Jeroen Engels"
      , url = "https://www.youtube.com/watch?v=XjwJeHRa53A"
      , year = "2022"
      }
    , { categories = [ Project ]
      , description = "The Enigma machine was an encryption device that was used by German forces during WW2 to send secret messages. In this talk, we will explain exactly how the encryption process works and go through an implementation of it in Elm. We will demonstrate how to encrypt and decrypt a message. Then we will go over the weaknesses that made it exploitable by Alan Turing and the other fine folks in Bletchley Park. By the end of the talk, you'll be able to point out all the inaccuracies in \"The Imitation Game\"."
      , event = EventUnknown "Lambda Days 2022"
      , name = "An Enigma Machine in Elm"
      , speaker = "Ju Liu"
      , url = "https://www.youtube.com/watch?v=EDFCRPG9wio"
      , year = "2022"
      }
    , { categories = [ Project ]
      , description = "With functional languages like Elm that target the browser, one can parse and render both classical and novel markup languages in real time, providing authors a pleasant, zero-config tool for writing and distributing mathematical text. The talk will outline how one designs and builds a fault-tolerant parser that provides high-quality, real-time error messages in-place in the rendered text. As case studies we consider two markup languages: MiniLaTeX, a subset of LaTeX, and L1, an experimental markup with a syntax inspired by Lisp."
      , event = EventUnknown "Lambda Days 2022"
      , name = "Functional Parsing for Novel Markup Languages"
      , speaker = "James Carlson"
      , url = "https://www.youtube.com/watch?v=AE_QzSIsmMI"
      , year = "2022"
      }
    , { categories = [ Teaching, Project ]
      , description = "The McMaster Start Coding program has taught over 26,000 K-12 students programming using Elm over the last five years. Collectively, they have compiled nearly 4 million programs in our online learning platform. The COVID-19 pandemic has necessitated the switch to a fully virtual setup, which continues as schools have strict visitor limits. Virtual learning also necessitates upgrades to the online code compilation and mentoring software we use. In particular, we need to determine when a student is stuck so as to be able to make better use of mentor resources and proactively help students who are struggling. This presentation details data mining efforts to predict metrics such as the length of time that a student is likely to struggle if they are receiving an error in their program, in order to dispatch mentors and help the students who need the most attention.\nAuthors: Chinmay Sheth, Vaitheeka Nallasamy, Kruthiga Karunakaran and Christopher K. Anand - McMaster University, Hamilton, Ontario, Canada"
      , event = EventUnknown "Lambda Days 2022"
      , name = "Towards Smart E-Learning Mentor Dispatch"
      , speaker = "Christopher Schankula"
      , url = "https://www.youtube.com/watch?v=ERUu8mEPdUM"
      , year = "2022"
      }
    , { categories = [ Project, Design, Animation, Visualisation, Graphs, Teaching ]
      , description = "Diagrams are crucial for communication and learning in STEM fields. Creating them involves repeated patterns, consistent components, exact positioning, and, ideally, user interaction. A programming language has right the tools to do all of the above, but much of its power is only available to career programmers, gated behind the complexity of things like SVG, CSS, JS, and handling user input.\nDiagrammar is a tool for creating interactive diagrams, that aims to be much simpler, while retaining the power of a full programming language (Elm). It was designed for making online STEM courses at Brilliant, and we make full use of this power: parametric reusable diagrams, authors sharing toolkits and styles, precise positioning -- and any diagram can be interactive!\nIn this talk, I will give you a quick tour of Diagrammar and its primitives, share ideas for designing simple, learnable tools, and tell you what we've learned from authors creating thousands of diagrams across dozens of courses.\nPontus Granström\nNamna, Brilliant\n@pnutus"
      , event = EventUnknown "Strange Loop 2022"
      , name = "Diagrammar: Simply Make Interactive Diagrams"
      , speaker = "Pontus Granström"
      , url = "https://www.youtube.com/watch?v=gT9Xu-ctNqI"
      , year = "2022"
      }
    , { categories = [ Project ]
      , description = "Functional programming languages have many benefits that are often explained from the developer's point of view, such as how easy it is to maintain a codebase. But we rarely look at it from the point of view of tools. Static analysis tools try to infer meaning and intent in order to find bugs and code smells, but they can be very hard to write depending on the features of the analyzed language. We will look at how explicitness, the lack of side-effects and dynamic constructs in pure FP languages empower tools to trivially achieve surprising results that would be nearly impossible with other paradigms."
      , event = EventUnknown "Lambda Days 2022"
      , name = "Static analysis tools love pure FP"
      , speaker = "Jeroen Engels"
      , url = "https://www.youtube.com/watch?v=_rzoyBq4hJ0"
      , year = "2022"
      }
    , { categories = [ Project, Concept ]
      , description = "At Vendr we use a lot of Elm and have a number of problems that need code generation (notably for GraphQL), but we needed the generated code to be readable, typesafe, and easy to maintain.\nSo, we built a codegen engine in Elm that automatically handles imports, formatting, has a builtin typechecker for the generated code. It can even generate example usage.\nLet's take a look at how it works and what you can build with it!"
      , event = EventUnknown "Strange Loop 2022"
      , name = "CodeGen with Types, for Humans, by Humans"
      , speaker = "Matthew Griffith"
      , url = "https://www.youtube.com/watch?v=PYdgy5-zhiU"
      , year = "2022"
      }
    , { categories = [ Learn, Concept ]
      , description = ""
      , event = EventUnknown ""
      , name = "The store pattern in Elm"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=BCmNX2Tx5xY"
      , year = "2022"
      }
    , { categories = [ Learn, Testing ]
      , description = "This is a recording of an internal talk I gave at Permutive, to a mostly Scala + Elm developer audience.\nThe aim is to tell you what PBT is, why do it, and teach you just enough basics, principles and examples to be able to apply it in your day-to-day job."
      , event = EventUnknown ""
      , name = "Property based testing: primer and examples"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=oEdZbjBaRGw"
      , year = "2022"
      }
    , { categories = [ Hobby, ExperienceReport, Project ]
      , description = ""
      , event = EventUnknown "GOTO Aarhus 2022"
      , name = "Hobby scale: making web apps with minimal fuss"
      , speaker = "Martin Stewart"
      , url = "https://youtu.be/WAS-qRdsvik"
      , year = "2022"
      }
    , { categories = [ Iconic, Community ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Celebrating 10 years of Elm"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/Vexdf-Rd-AE"
      , year = "2022"
      }
    , { categories = [ Learn, Project ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Applications as Libraries: Building elm-book and elm-admin"
      , speaker = "Georges Boris"
      , url = "https://youtu.be/XakEn9ylVEI"
      , year = "2022"
      }
    , { categories = [ Games ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Game programming and creative coding with Elm"
      , speaker = "Erkal Selman"
      , url = "https://youtu.be/AswmCDETyAo"
      , year = "2022"
      }
    , { categories = [ Community ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "A janitor for Elm"
      , speaker = "Rupert Smith"
      , url = "https://youtu.be/uCA5VL8SeDY"
      , year = "2022"
      }
    , { categories = [ ExperienceReport, Project ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Learning Elm while launching a project, good idea?"
      , speaker = "Loïc Knuchel"
      , url = "https://youtu.be/9yCw_ut9Ik8"
      , year = "2022"
      }
    , { categories = [ Graphics ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Look Ma no graphics card! Software-based 3D rendering in Elm"
      , speaker = "Julian Antonielli"
      , url = "https://youtu.be/-4lyp9pVKE0"
      , year = "2022"
      }
    , { categories = [ Project ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "elm interreactor - Clickable compiler messages for the lazy"
      , speaker = "Jan Wirth"
      , url = "https://youtu.be/I0zhcetpXzg"
      , year = "2022"
      }
    , { categories = [ Charts ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Introduction to elm-charts"
      , speaker = "Tereza Sokol"
      , url = "https://youtu.be/D-WaKYJLsFU"
      , year = "2022"
      }
    , { categories = [ Guide ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Peeling zeroes in Idris"
      , speaker = "Ju Liu"
      , url = "https://youtu.be/paiA71sG5Pc"
      , year = "2022"
      }
    , { categories = [ Acesssibility ]
      , description = ""
      , event = EventUnknown "Elm Online Meetup"
      , name = "Color accessibility with elm-hsluv"
      , speaker = "Austin Erlandson"
      , url = "https://youtu.be/E3LvpziCs0U"
      , year = "2022"
      }
    , { categories = [ Concept ]
      , description = "Jeroen Engels talks about The phantom builder pattern at the Elm Online Meetup on October 6th 2021."
      , event = EventUnknown ""
      , name = "The phantom builder pattern"
      , speaker = "Jeroen Mengels"
      , url = "https://www.youtube.com/watch?v=Trp3tmpMb-o"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "Do you care more about how well code works than how conceptually elegant it feels? Are you more interested in how effectively you can build and maintain software than how buzzword-compliant it is? Then this is the talk for you!\n\nPeople like functional programming for different reasons. Some like it for the conceptual elegance, or the mathematical properties. Richard? He likes to build things. He likes it when the software he builds works well and is easy to maintain. For the past decade he's been using functional programming both professionally and as a hobbyist, and has found it has helped him ship higher quality software in less time than in the decade he spent writing object-oriented code before.\n\nIn this talk, he'll share the practical benefits he's enjoyed in FP, and the benefits other pragmatists like him can expect from it too!"
      , event = EventUnknown ""
      , name = "Functional Programming for Pragmatists - GOTO Copenhagen 2021"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=3n17wHe5wEw"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "Just imagine: thousands of crabs, blasting their way through the ocean.\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 7"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=8wp830YFV5M"
      , year = "2021"
      }
    , { categories = [ ExperienceReport ]
      , description = "Is Elm updating too often or too seldom? Is Elm dead?\nElm is a simple language but there are always new things to learn about it. In this event, Luca will talk about some stories from his learning path.\nThis talk will also mention topics from the following list: Pitching fatigue. Objective guarantees, Developer experience, Code generation, Dead code elimination, Enforced discipline, Patterns, Domain-Driven Design."
      , event = EventUnknown ""
      , name = "3 years of Elm: lessons learned"
      , speaker = "Luca Mugnaini"
      , url = "https://www.youtube.com/watch?v=bmo9GV14Rm8"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "These fish made so many babies, my browser crashed!\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 6"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=9c2H-H3xgBk"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "It's Day 5, and I used my newfound reading skills to predict the future.\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 5"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=DnGQ2MOrb-w"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "Wait... why are elves playing bingo with a squid?\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 4"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=o_GgboNxvcE"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "Your boy measures gamma ratings, oxygen, CO2 and all kinds of invisible stuff– one bit at a time!\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 3"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=wwG5G4U-5hc"
      , year = "2021"
      }
    , { categories = [ Learn, Introduction ]
      , description = "Here we look at writing a Hangman game in Elm as an example of a basic Elm app with some interactivity, an HTTP request, a very small JSON decoder and some custom types. Hopefully it is a good introduction to writing an app in Elm and getting a sense of how it all works."
      , event = EventUnknown ""
      , name = "Introduction to writing an Elm app - Hangman Game"
      , speaker = "Michael Jones"
      , url = "https://youtu.be/BktE_8qYXqI"
      , year = "2020"
      }
    , { categories = [ Art ]
      , description = "This is a live coding session based on a classic 1982 paper by Peter Henderson. The paper shows the decomposition and reconstruction of Escher's woodcutting \"Square Limit\", a beautiful recursive tessellation of interleaving fish, using functional programming. If we think of a picture not as a collection of colored pixels but rather as a function from a bounding rectangle to a rendering, we can define very simple yet powerful picture combinators that allow us accomplish our task with ease and elegance. Using Elm as the implementation language, we will follow in Henderson's footsteps to create a replica of Escher's Square Limit as an SVG."
      , event = Conf OsloElmDay2019
      , name = "Picture combinators and recursive fish"
      , speaker = "Einar W. Høst"
      , url = "https://youtu.be/jOu2hISeO5M?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, Commercial ]
      , description = "The UI client of our ARIC Fraud Hub product is a 100k LOC Elm app. Over the last 18 months we ported it from Agnular 1 to Elm, and added many new features. On the way we learned a lot. We’ll present a summary of that story: How we chose and adopted Elm. How we made Elm and Angular play nice together during the migration. What we learned from using Elm with a team of ~6 engineers on a large complex project. And what we want in the future: from Elm and from ourselves."
      , event = Conf ElmEurope2018
      , name = "Lessons from 100k LOC elm at Futurespace"
      , speaker = "Mark Skipper and Decio Ferreira"
      , url = "https://www.youtube.com/watch?v=0AosqGTEa0Q"
      , year = "2018"
      }
    , { categories = [ Guide, Interop ]
      , description = "While Elm pretty much solves the tool and framework fatigue when starting a new front-end project, we still have the same issue for the back-end. Using Horizon in your Elm app can help alleviate the pain by reducing the amount of work you have to do in the back-end, so you can write more Elm code.\nWhen starting a new project in JavaScript, you’re most likely going to spend a lot of time choosing the tools and frameworks to use, and then spend more time configuring them. Elm pretty much solves this problem by providing all the tooling you need out of the box, and by The Elm Community’s preference to have one way to do things, so you don’t have choose between 100 different packages just to solve 1 problem.\nBut, how about the back-end? You still have to choose all the stacks; from database, web server, programming language, and the framework. At least, until we have server side Elm, we still have the same problem here.\nWouldn’t it be great if you don’t have to worry about the back-end, and can just focus on writing Elm code and be happy? We can do that with Horizon. Horizon is an open source server designed for building real time application without writing any back-end code. With Horizon, all you need to do is to run the Horizon server, start writing Elm code, and be happy and productive."
      , event = Conf ElmConf2016
      , name = "0-60 in 15 Minutes: Building a Realtime App With Elm and Horizon"
      , speaker = "Abadi Kurniawan"
      , url = "https://youtu.be/fTHHn7NhU3w"
      , year = "2016"
      }
    , { categories = [ Keynote ]
      , description = ""
      , event = Conf ElmConf2018
      , name = "Immutable Relational Data"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/28OdemxhfbU"
      , year = "2018"
      }
    , { categories = [ Project, Games, Iconic ]
      , description = "Emulators can look like dark magic, especially for programmers that are mostly doing high-level programming. In this talk, you can take a glimpse into the world of emulation and will discover how surpisingly well Elm is suited for writing easy-to-understand CPU emulation code that is not too different from the Elm code you are used to."
      , event = Conf OsloElmDay2019
      , name = "Emulating the Nintendo Game Boy CPU with Elm"
      , speaker = "Manuel Fuchs"
      , url = "https://youtu.be/vI30OvU3QW0?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Guide ]
      , description = "Have you come into grips with Elm as a language and prolific enough to start using it in a real project? Awesome! Did you already have an idea of how you would structure your application, handle authentication and maybe show toast-like pop up messages in the UI? If not, this talk is for you.\nMany people know how to create small apps for fun in Elm. Some have crafted larger things but felt they were missing something. Having done two larger customer projects in Elm, I have some solid experience under my belt about building big applications for production. In both projects, the initial folder structure and the initial module architecture became untenable in a few months. This talk is a down-to-earth lessons learned aimed for everyone who has done or is planning on doing production applications using the language. I will introduce strategies to overcome some of the common problems we have as frontend engineers, but also share some war stories of times when things didn’t quite go as planned."
      , event = Conf ElmConf2016
      , name = "Beyond Hello World and Todo Lists"
      , speaker = "Ossi Hanhinen"
      , url = "https://youtu.be/vpc80c5iC6k"
      , year = "2016"
      }
    , { categories = [ Learn ]
      , description = "Join me as I do Advent of Code: Day 1 using Elm!\nAdvent of Code: "
      , event = EventUnknown ""
      , name = "Advent of Code 2021: Day 1"
      , speaker = "Ryan Haskell-Glatz"
      , url = "https://www.youtube.com/watch?v=ewgMjZAwvhY"
      , year = "2021"
      }
    , { categories = [ Audio, Project, Graphics ]
      , description = "Through a series of animated demos and funny failed experiments, join me on my journey towards building a musical game where the controller is a digital piano!\nHighlights include:\n- Using the Web MIDI API with Elm via JavaScript interop to get input from a digital piano directly in the web browser - Exploring SVG animations in the Elm ecosystem - Elm’s best features from the perspective of a beginner who recently fell in love with the language - Silly and instructive beginner mistakes (how not to use Elm!)\nBuilding my first Elm app was a two-for-one deal: learn functional programming and learn to sight-read sheet music! By the end of this talk, I hope you’ll be equally excited to combine these web technologies in your own creative adventures."
      , event = Conf ElmConf2019
      , name = "Building a Music Learning Game with Elm, Web MIDI, and SVG Animation"
      , speaker = "Liz Krane"
      , url = "https://youtu.be/XsV3EK2cFJU"
      , year = "2019"
      }
    , { categories = [ Keynote ]
      , description = ""
      , event = Conf ElmEurope2019
      , name = "Sum Types All The Way Down"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=nNdISs1wgs8"
      , year = "2019"
      }
    , { categories = [ Keynote, Iconic, ElmPhilosophy ]
      , description = ""
      , event = Conf ElmConf2016
      , name = "Code is the easy part"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/DSjbTC-hvqQ"
      , year = "2016"
      }
    , { categories = [ Learn, Project ]
      , description = "For the V2 of my personal website, I'm using DatoCMS (a headless CMS) which uses a custom format for its Structured Text editor called DAST."
      , event = EventUnknown ""
      , name = "Creating a Elm package for DatoCMS (part 2)"
      , speaker = "Jordane Grenat"
      , url = "https://www.youtube.com/watch?v=fXoFiW_nIgw"
      , year = "2021"
      }
    , { categories = [ Learn, Iconic ]
      , description = "Fetching data from the server should be one of the easiest things frontend programmers do. And yet even big names like Twitter and Slack make a simple mistake that consistently spoils the UX of their sites.\nIn this talk we’ll look afresh at the simple act of loading remote data, and how it’s just slightly more complicated than people think. Then we’ll see how Elm’s excellent data modeling capabilities let you capture this complexity and banish the bug permanently.\nYou’ll learn how to improve the user experience of every HTTP call you make, and pick up some wider ideas on how Elm’s type system can guide you to clearer, more useful designs that make for better software."
      , event = Conf OsloElmDay2019
      , name = "Slaying a UI Antipattern"
      , speaker = "Kris Jenkins"
      , url = "https://youtu.be/NLcRzOyrH08?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Keynote, Iconic, ElmPhilosophy, Technique ]
      , description = ""
      , event = Conf ElmEurope2017
      , name = "The life of a file"
      , speaker = "Evan Czaplicki"
      , url = "https://www.youtube.com/watch/XpDsk374LDE"
      , year = "2017"
      }
    , { categories = [ Guide, Technique, Testing ]
      , description = "In this talk, we’ll discuss how we manage to unblock ourselves whenever we encounter an edge in Elm at NoRedInk. I’ll discuss many of the experiments that I have done, and how best to go about being a productive member of a Elm workforce to enable others to use it. I’ll also explain how our custom testing tooling works, and how you can do it too. I’ll also briefly go over some potential problems you might face, and how to avoid them."
      , event = Conf ElmEurope2017
      , name = "How to unblock yourself with elm"
      , speaker = "Noah Hall"
      , url = "https://www.youtube.com/watch?v=OgH3pPXXSkY"
      , year = "2017"
      }
    , { categories = [ Hobby, Project ]
      , description = "On Elm’s website Prezi is featured for using Elm. However, as of December 2016, Prezi presentations are still based on Flash. So in this talk I introduce Dive, a programming framework written in Elm for building visual and animated presentations like Prezi’s. After explaining the API, I describe the internals of the framework and compare two rendering approaches, Canvas vs. SVG. Along the way, I also demonstrate why it was easy to create Dive with Elm, since the core of the framework took me just a couple of hours. And of course, the presentation slides of this talk are built with Dive itself."
      , event = Conf ElmEurope2017
      , name = "Dive: building Prezi-like presentations with elm"
      , speaker = "Matthias Rella"
      , url = "https://www.youtube.com/watch?v=TRATeS93bsA"
      , year = "2017"
      }
    , { categories = [ Concept ]
      , description = "In 1999, NASA’s Mars probe infamously crashed due to a unit of measure error. Twenty years later, we still write the same bug. Join Joël as we leverage Elm’s type system to catch these, get better errors, and improve readability. Along the way we’ll challenge some common assumptions we have around numbers."
      , event = Conf ElmintheSpring2019
      , name = "A Number by Any Other Name"
      , speaker = "Joël Quenneville"
      , url = "https://youtu.be/WnTw0z7rD3E"
      , year = "2019"
      }
    , { categories = [ Learn ]
      , description = "Parsers have a name for being an esoteric domain, but it's a misleading notion. In this talk, I'll teach you what I learned from starting out as a novice to making a full fledged YAML parser in Elm. A journey during which I discovered that parsers are super interesting and fun, and once you understand the fundamentals, they are a breeze thanks to the tooling available in Elm."
      , event = Conf ElmConf2018
      , name = "Demystifying Parsers"
      , speaker = "Tereza Sokol"
      , url = "https://youtu.be/M9ulswr1z0E"
      , year = "2018"
      }
    , { categories = [ Project, Guide, UI ]
      , description = "Elm helps us to think in terms of algorithms, not just in terms of “let’s make it work”. We can focus on one task at a time, without having the overhead of having to think in terms of “the whole app”.\nAnd it allows us to pick highly complex subjects and tackle them for fun and profit.\nCreating a date picker like https://developer.apple.com/documentation/uikit/uidatepicker is very complex. We have to model the display with inline css 3d and requestanimationframe, the touch with touch events, the physics of the date picker with some physics theory. And doing that is javascript would mean handling every aspect of it in a “global” way.\nCreating a native looking date picker in elm means we can concentrate on the bigger vision (the date picker), one little function at a time, and it means we can do it in a reusable manner.\nThis talk will outline how we did it and what the result looks like, and it’ll emphasise how we designed it."
      , event = Conf ElmEurope2018
      , name = "How to build a native looking date picker with elm"
      , speaker = "Thibaut Assus"
      , url = "https://www.youtube.com/watch?v=nal1MUgZ8Tc"
      , year = "2018"
      }
    , { categories = [ ElmPhilosophy ]
      , description = "What would Chanel say if inquired about the design choices of Elm? How do packages resemble wardrobes? What makes a good outfit and why is it relevant for you? The questions are many and seemingly nonsensical, but from the right perspective, the fashion and software industry are more alike than most would think. In this talk, we’ll examine these parallels in order to explore the nature of design."
      , event = Conf ElmConf2017
      , name = "If Coco Chanel Reviewed Elm"
      , speaker = "Tereza Sokol"
      , url = "https://www.youtube.com/watch?v=Wiw3YcwGwrU"
      , year = "2017"
      }
    , { categories = [ Learn ]
      , description = "Everyone knows that Elm has great error messages, but do you know all of the kinds of error messages you can get? In this talk, we will:\n1. Categorize all of Elm’s error messages.\n2. Learn how to produce some of the more obscure errors.\n3. Learn how to get the most out of your error messages."
      , event = Conf ElmintheSpring2019
      , name = "Exploring Elm's Compiler Messages"
      , speaker = "Nik Sharma"
      , url = "https://youtu.be/So60QXXl-cc"
      , year = "2019"
      }
    , { categories = [ Learn ]
      , description = "Squirrel Girl, Squirrel Girl! She’s a human and also squirrel! Does she have lots of pals? Well let’s ask GraphQL! 6 degrees of the Squirrel Girl.\nGraphQL? Listen, friend. It’s a Marvel backend. Will it be performant? Caching will make a dent. Hey there! Let’s talk Squirrel Girl!\nUsing the MarvelQL api, let’s learn about using an external GraphQL with elm-graphql, keeping your application performant with caching, and find out how connected everyone’s favorite squirrel based hero is."
      , event = Conf ElmConf2019
      , name = "GraphQSquirrel"
      , speaker = "Katie Hughes"
      , url = "https://youtu.be/XgA-nn-BL4M"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, PanelDiscussion, Introduction ]
      , description = "Elm is a purely functional language that compiles to JavaScript in less than 4 seconds. We sat down with Richard Feldman, author of the book Elm in Action to understand how learning to code in Elm can help software developers whether they work with it on a daily basis or not.\nThe interview is based on Richard Feldman's new book \"Elm in Action\":"
      , event = EventUnknown "GOTO Book Club 2020"
      , name = "Upgrade Your Frontend Game – Be an Elm Wizard"
      , speaker = "Richard Feldman & Thomas Anagrius"
      , url = "https://youtu.be/X2e_zZa5OnE"
      , year = "2020"
      }
    , { categories = [ Learn, Project, Interop ]
      , description = "As a language that compiles to JavaScript, Elm has the potential to be used for building more than front-end applications. In this talk, we’ll explore using Elm to build browser extensions and bookmarklets by reviewing a couple of projects and considering the advantages of using Elm for these kinds of uses. Let's bring the delight of programming Elm to browser-adjacent functionality!"
      , event = Conf ElmintheSpring2019
      , name = "Customizing Browsers with Elm"
      , speaker = "Emma Cunningham"
      , url = "https://youtu.be/fA09a6gCHBI"
      , year = "2019"
      }
    , { categories = [ Commercial, ExperienceReport ]
      , description = "Elm started its journey at Veepee in 2017. Since then, multiple teams have adopted it and pushed it in production. In this talk, we will tell you the technical and human story of our products through multiple anecdata:\n- How we managed to convince people to give Elm a try, and how we onboard newcomers on Elm,\nWhat our projects are, what they do, and how this translates into Elm code,\nOur not-elm technical environment: the backends, the operations and how it meshes with Elm.\nThe mistakes we made when starting Elm, and how we recovered.\nThe hope is that after this talk, you will find your own way to start Elm in your company and build successful production stories"
      , event = Conf ElmEurope2019
      , name = "From experiment to production: stories of Elm at Veepee"
      , speaker = "Benoît Chiquet & Radwane Hassen "
      , url = "https://www.youtube.com/watch?v=mQiVN9huSKA"
      , year = "2019"
      }
    , { categories = [ Graphics, Games ]
      , description = "There is no doubt that the Elm architecture and Virtual DOM make Elm enjoyable for building web apps. When it comes to the domain of real-time graphics, it still remains underdeveloped. Even though this opens up a whole new range of opportunities, is Elm ready for such experiments?\nHaving accepted a challenge of building a dice roller game, I ended up rolling my own physics engine. With no prior experience in computational physics, I studied existing implementations. Through a try and error, I programmed the necessary bits in pure Elm.\nFrom this talk you will learn how it was possible because of existing tooling. You will see how types and immutability make complex algorithms easier to comprehend. And of course, you will share my excitement of watching the demos on the big screen!"
      , event = Conf ElmEurope2019
      , name = "Fighting the Laws of Physics"
      , speaker = "Andrey Kuzmin "
      , url = "https://www.youtube.com/watch?v=pJ1i0iHxf58"
      , year = "2019"
      }
    , { categories = [ Learn ]
      , description = "The talk will cover basic concepts of binary encoding, and then look in detail at how using binary decoders with elm/bytes is similar to using elm/json and elm/parser, and in particular where it is different. The questions I want to answer are:\nin broad strokes, how can elm data be encoded as bytes, and decoded again\ncompared to Json decoding, what is different\nwhat are the trade-offs between using binary encodings and (for instance) Json\nwhat kinds of binary data can we now work with (and does it makes sense to do that)\nThe content is based on my experience decoding font files. I’ve written about the topic (and some of the pitfalls) in these discourse threads:\n"
      , event = Conf ElmEurope2019
      , name = "Working with Bytes"
      , speaker = "Folkert de Vries "
      , url = "https://www.youtube.com/watch?v=inhfdRrh5NM"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "Hayleigh Thompson talks about If it's broke, fix it: programming language development in Elm at the Elm Online Meetup on September 1st 2021."
      , event = EventUnknown "Elm Online Meetup"
      , name = "If it's broke, fix it: programming language development in Elm"
      , speaker = "Hayleigh Thompson"
      , url = "https://youtu.be/aM4rj4e65ZM"
      , year = "2021"
      }
    , { categories = [ Learn ]
      , description = "Elm code tends to favour few abstractions and concrete data types, but writing code in this way can make your code inflexible and require more work in the face of changes. Writing code in a more open way can be a solution to this, but can also make your code harder to understand and easier to get wrong.\nRobin will show some common pitfalls of writing concrete code and how these can be avoided by writing with a more open mindset. There will also be an exploration on how a common tool for extensibility, type classes, could work in Elm and why it might not be a good idea."
      , event = Conf OsloElmDay2019
      , name = "The Extensibility Problem"
      , speaker = "Robin Heggelund Hansen"
      , url = "https://youtu.be/4QwI_QWoUK0?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Learn, Charts ]
      , description = "Tereza talks about Introduction to elm-charts at the Elm Online Meetup on November 3rd 2021."
      , event = EventUnknown "Elm Online Meetup"
      , name = "Introduction to elm-charts"
      , speaker = "Tereza Sokol"
      , url = "https://youtu.be/D-WaKYJLsFU"
      , year = "2021"
      }
    , { categories = [ Animation, UI ]
      , description = "Elm’s basis in immutability presents a unique set of challenges to animators.\nIn a language that allows mutation we can get away with hiding all our details behind local state, but in Elm we have to capture every detail in our model. This means many of the APIs we may be familiar with in languages like Javascript don’t translate directly over to Elm in the nicest way. Or they do translate, but require a lot of manual wiring and record keeping.\nHowever immutability is an incredible advantage and there’s no reason that advantage doesn’t translate into the realm of animation. The main challenge is adjusting our thinking around animation in Elm. So, what does an immutable animator’s toolkit look like?\nBy slightly shifting our thinking and embracing Elm’s design decisions we can arrive at a unique set of tools and techniques that provides high level control over our animations and feels unique to the Elm language."
      , event = Conf ElmEurope2018
      , name = "The immutable animator's toolkit"
      , speaker = "Matthew Griffith"
      , url = "https://www.youtube.com/watch?v=Nf4rElfA8SE"
      , year = "2018"
      }
    , { categories = [ Learn ]
      , description = "Some things can’t be done with Elm. It’s a young language with so much potential to be realized in the years ahead. If a program you are writing today falls outside of Elm’s capabilities, like writing a server, it can better to choose a different language. When it comes to fancy UI features, though, you might be able to have your cake and eat it too. In this talk you will learn about when and how to use web components in your Elm views. The most common inquiry we’ll cover is interop with fancy JS UI packages that are not economically viable to replicate in Elm, like rich text editors. We’ll also talk about components that make visual changes outside of the Elm update cycle for performance-critical UI behaviors, and more. The examples covered in this talk are based on production experience, fully compatible with Elm and all WHATWG specs, and can be polyfilled at least as far back as IE 11 and Safari 9."
      , event = Conf ElmEurope2018
      , name = "When and how to use Web Components with elm"
      , speaker = "Luke Westby"
      , url = "https://www.youtube.com/watch?v=tyFe9Pw6TVE"
      , year = "2018"
      }
    , { categories = [ Acesssibility ]
      , description = "Creating positive change can feel daunting. While many in our community care deeply about crafting an accessible web, it can feel difficult to know where to start, especially when working in a codebase where accessibility standards have been left by the wayside. Lately, I’ve been excited about the power of tiny monthly habits to create positive change, both in my personal life and in the world at large. I decided to commit to a small month-long habit to write only Elm integration tests that would help someone using a screen reader navigate the site. I’ll delve into the thoughtful Elm Packages that laid the groundwork for this project, resources I used when researching accessibility, and the results of my month of accessible testing. My hope is that attendees will leave this talk inspired to adopt positive habits of their own, excited about the ways in which Elm nudges us towards accessible code, and empowered to learn more about accessibility."
      , event = Conf ElmConf2019
      , name = "A Month of Accessible Elm"
      , speaker = "Brooke Angel"
      , url = "https://youtu.be/yHBUKYl3gjc"
      , year = "2019"
      }
    , { categories = [ UI ]
      , description = "As we build out user interfaces, we make choices about color that involve us in a vivid history of experimentation and exploration. We benefit from the bountiful attention that painters, designers, physicists, biologists, doctors, mathematicians, makeup artists, and so many others have paid to studying color and its perception. Within our field as software engineers, we can be confident in the strengths of the color spaces we've defined, like RGB and HSL. However, we may also find that these color spaces, while they perfectly describe how we want our colors to render, don't actually reflect what we want our users to see. In this talk, we'll turn our gaze towards our users' perception of colors: how can we make palette choices that work for our users? My hope is that you leave this talk feeling excited about colors, and maybe even like your attitude toward them just slipped on a pair of rosy glasses."
      , event = Conf OsloElmDay2019
      , name = "Color Coding with Elm"
      , speaker = "Tessa Kelly"
      , url = "https://youtu.be/UzvCX-8bTDs?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Guide, Acesssibility ]
      , description = "Learn about accessibility, the elm-html-a11y library, and delve into patterns enforcing good development habits.\nElm’s core library makes writing HTML a lovely experience, but making that HTML accessible can still be hard. The WAI-ARIA spec provides many modes of communication and interaction for users–but these largely attribute-based avenues are easy to ignore. Adding type-safety, an exhaustive set of attributes and tags, and friendly function names, elm-html-a11y makes writing accessible HTML nicer."
      , event = Conf ElmConf2017
      , name = "Accessibility with Elm"
      , speaker = "Tessa Kelly"
      , url = "https://www.youtube.com/watch?v=G_TNRuoF3FE"
      , year = "2017"
      }
    , { categories = []
      , description = "On the surface, Elm and Fable (the F# to JavaScript compiler) look very similar - functional, ML based languages with a focus on pragmatism over complexity. In fact, the most common way of writing JavaScript in Fable is via the \"\"Elmish\"\" library which implements the, well, Elm architecture. But the philosophy behind the two languages is very different. Take a tour of the two languages with someone who's used both professionally, and we'll investigate how the different ideas behind them have lead to different features, different ecosystems, and even differences in how teams work with them."
      , event = EventUnknown "Lambda Days 2019"
      , name = "ELM, FABLE, AND THE PRACTICAL IMPLICATIONS OF PROGRAMMING LANGUAGE PHILOSOPHY"
      , speaker = "Michael Newton"
      , url = "https://youtu.be/g3o06k4ADis"
      , year = "2019"
      }
    , { categories = [ Introduction, Learn ]
      , description = ""
      , event = EventUnknown ""
      , name = "Elm Tutorial - Why use Elm?"
      , speaker = "Grace Hopper"
      , url = "https://youtu.be/um0jxfgboNo"
      , year = "2017"
      }
    , { categories = [ Project ]
      , description = "Elm Markup brings static types, beautiful error messages, and easy extensibility to a markup language!\nParse a document to Html, Elm UI Elements, or anything you'd like. Or make it dynamic by parsing to a view function!\nLet's intermix structured data with human formatted text for an experience much more like an interactive notebook than just writing static markdown."
      , event = Conf OsloElmDay2019
      , name = "A Markup for the Statically Typed"
      , speaker = "Matthew Griffith"
      , url = "https://youtu.be/8Zd3ocr9Di8?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, Design ]
      , description = "I’m a product designer that always hit early roadblocks when learning code. Where do I start? How do I make changes without breaking everything? Because of the challenges, I assumed “my brain must not be wired for programming.”\nThis changed when I found Elm. The experience of learning Elm gave me the confidence to add code to my design toolkit. Now I use Elm in client work and to experiment with new kinds of design tools. Designers can write more than just views: learning to think like a developer has changed the way I approach work as a designer.\nMy goal is to help developers and designers work better together using Elm, and see more designers join the Elm community.\nMy talk will cover: -How Elm became a valuable part of my design toolkit -Specific learning roadblocks and how I overcame them -How these lessons reveal opportunities for better shared tooling between developers & designers -What design tooling can steal from Elm"
      , event = Conf ElmEurope2019
      , name = "Designing with Elm"
      , speaker = "Jono Mallanyk "
      , url = "https://www.youtube.com/watch?v=_KUcclVTY8g"
      , year = "2019"
      }
    , { categories = [ Animation, UI ]
      , description = "Games and rich applications present a compelling use-case for Elm, but managing dynamic animations can quickly become complicated. Here’s how to succinctly express animation pipelines using the elm-style-animation library and how to architect your animation code in a readable, extensible manner.\nIn this talk we’ll cover…\nWhat options are available for animation in Elm and when it makes sense to use them.\nHow to tackle real-world animation using the elm-style-animation library.\nA straightforward way to organize animations so that they are readable, extensible, and easily integrated into the Elm architecture.\nIf you’re here, you probably already know that Elm is a solid base for building complex applications. You’ll come away from this talk with the tools to make those applications gorgeous as well."
      , event = Conf ElmConf2016
      , name = "Rich Animation"
      , speaker = "Matthew Griffith"
      , url = "https://youtu.be/DsDwYqsLU3E"
      , year = "2016"
      }
    , { categories = [ Learn, Project, Audio ]
      , description = ""
      , event = EventUnknown "Stockholm Elm"
      , name = "Audio, Elm style!"
      , speaker = "Martin Stewart"
      , url = "https://www.youtube.com/watch?v=lw1E9sPbq28"
      , year = "2021"
      }
    , { categories = [ Iconic, ElmPhilosophy ]
      , description = "As more people enter /r/elm and the Elm discourse, I have thought a lot about how \"online communities\" work. Patterns of conflict. Why those patterns exist. Structures that would diffuse that conflict in healthy ways. Initially I just wanted to get yelled at less, but I instead stumbled upon \"a cultural history of open source\" that may reveal a path to more civil and productive online communication in general.\nAttendees will leave with (1) an inside perspective on open source projects, (2) a historical and cultural framework that I think can improve online communities right now, and (3) some interesting references and ideas to explore further in their own projects and interactions."
      , event = EventUnknown "Strange Loop 2018"
      , name = "The Hard Parts of Open Source"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/o_4EX4dPppA"
      , year = "2018"
      }
    , { categories = [ Project, Games ]
      , description = "Mogee is a side-scroller that I created with my wife Nadya in three days for the #lowrezjam 2016. Since then we’ve been working on this game on our free time: added a music theme and improved the visuals.\nYou will learn how to evolve a simple time-travelling Mario example into a full fledged game. Even though Elm makes it easy and joyful, there are a few challenges to overcome:\ngrowing complexity of the code;\ninteractions between different game objects in the game loop;\nrendering animated objects with WebGL.\nIn the end you will witness yet another milestone of our game, and it’s going to be remarkable!"
      , event = Conf ElmConf2017
      , name = "Mogee or how we fit Elm in a 64×64 grid"
      , speaker = "Andrey Kuzmin"
      , url = "https://www.youtube.com/watch?v=NRXTMaXO15I"
      , year = "2017"
      }
    , { categories = [ Learn, Project ]
      , description = "Elm makes it incredibly easy to add a \"cancel\" feature to any application, even when I've never seen the codebase in my life!\nLet's add that feature to a chess game for the easiest episode of Code in the Unknown so far! 😅"
      , event = EventUnknown ""
      , name = "[Code in the Unknown] Adding a \"cancel\" action to a chess game"
      , speaker = "Jordane Grenat"
      , url = "https://www.youtube.com/watch?v=Zp4p7DiWMuA"
      , year = "2021"
      }
    , { categories = [ Teaching ]
      , description = "Ten Tuesdays. Eleven kids. Ages twelve to sixteen. They have grit. And they have Elm.\nWill they use front-end as a creative platform? Will they surpass the javascripters?\nOnly this experience report will tell."
      , event = Conf OsloElmDay2019
      , name = "Lessons learned teaching Elm to kids"
      , speaker = "Teodor Lunaas Heggelund"
      , url = "https://youtu.be/FSec8QmgEWo?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Project, Maps ]
      , description = "Web applications often need interactive UI elements, e.g. slippy maps. Currently one has to interface with existing JS libraries with some trickery to have a map in an Elm app.\nIn this talk we will explore a different approach: a slippy map library written in pure Elm. You will hear about the initial motivation, see how it is implemented, learn about API decisions and get to know how to use, customize and extend a slippy map.\nThis will not only give you an additional UI widget in your Elm tool belt, but will hopefully teach you about how to build and use stateful UI elements in Elm in general."
      , event = Conf ElmConf2017
      , name = "Building a Slippy Map Library in Pure Elm"
      , speaker = "Jonas Coch"
      , url = "https://www.youtube.com/watch?v=kWIiXbn1FXU"
      , year = "2017"
      }
    , { categories = [ Project, Hobby ]
      , description = "We all already know that Elm is a great language for building reliable web apps, but it turns out it’s also great for prototyping Domain Specific Languages. Recently I’ve combined two of my hobbies by using Elm to begin creating a reusable data format for cooking recipes.\nAll recipes can be broken down into a number of raw ingredients which, when combined with various techniques, form a dish. In this talk I will explain why Elm’s straightforward yet robust type system is a perfect use case for modeling out these recipes. Thanks to Elm’s knack for taking a data model and translating it into HTML, it’s easy to generate a human-readable version of any one recipe.\nBut wait, there’s more! Elm’s decoder system makes it super easy to translate Elm models to and from JSON, allowing us to import and export them.\nFinally, I’ll show a few examples leveraging this framework to generate both pretty, human-readable recipes and interesting visualizations of them!"
      , event = Conf ElmEurope2017
      , name = "Cooking with elm"
      , speaker = "Noah Zachary Gordon"
      , url = "https://www.youtube.com/watch?v=C3mnyJlCqMk"
      , year = "2017"
      }
    , { categories = [ Interop ]
      , description = "We love the feeling we get writing Elm code where \"if it compiles it works™.\" But what happens when we need to interact with the outside world from Elm? Our API throws a curve ball and gives us an unexpected null. Or we're not sure what keys an object returned from a javascript library has. So we have to keep tweaking the code and refreshing the page to see if our decoders fail at runtime. Can't we do better than that!?\nWe can! In this talk you'll learn about 3 packages that enforce contracts with the outside world and give us confidence that things will work the FIRST time we load our app."
      , event = Conf ElmConf2018
      , name = "Types Without Borders"
      , speaker = "Dillon Kearns"
      , url = "https://youtu.be/memIRXFSNkU"
      , year = "2018"
      }
    , { categories = [ Project, Games ]
      , description = "Emulating a retro game console is a many-faceted task. Besides emulating the central processing unit, there are many other components that need to be emulated and integrated before games become really playable. This talk will focus on the Game Boy’s APU, the Audio Processing Unit.\nAs the Game Boy is limited in memory, computing power and storage, simply playing audio files is out of the question. To accomplish this task, the Game Boy synthesizes audio out of thin air, based on control instructions.\nYou will learn what sound actually is, how computers work with it, what tradeoffs can be made and why retro computers have their own distinct sound.\nLast but not least, we will take a deep-dive into the Game Boy specifics and how its APU can be emulated with Elm."
      , event = Conf ElmEurope2019
      , name = "Emulating the Nintendo Game Boy Audio Hardware in Elm"
      , speaker = "Manuel Fuchs "
      , url = "https://www.youtube.com/watch?v=a52p6ji1WZs"
      , year = "2019"
      }
    , { categories = [ Animation, UI ]
      , description = "Animation is fun, and if done properly can help improve user experience and increase accessibility. Writing a good and performant animation in a pure functional language like Elm can be a challenge. In this talk, I will explore 2 ideas on how to build a good API for doing animation in Elm that perform well using browser’s optimized animation engine and ports. We’ll compare each the pros and cons of each techniques. After this talk, you’ll be equipped with both the tools, the confidence, and the inspiration, to build fun and cool animations in Elm. As an added bonus, you get to see some cool animations along the way :)"
      , event = Conf ElmConf2019
      , name = "Building highly performant animations in Elm."
      , speaker = "Abadi Kurniawan"
      , url = "https://youtu.be/OjpwLAOOLG4"
      , year = "2019"
      }
    , { categories = [ Media, Project ]
      , description = "The most difficult part of directing a live, multi-camera video production, is avoiding mistakes. You mean to switch to Camera A, but put up the title card, instead, requiring difficult work to go back in and edit.\nBut Elm’s type system lets us model our data such that we can make such mistakes impossible. Using Algebraic Data Types to model my video layers and State Machines to model my transitions, I can effectively make impossible video states impossible.\nThe talk will include a live-streamed demo of controlling robotic cameras, switching video cameras, adding graphics, all from a web front-end built in Elm, while I’m speaking. It will all go out on the Elm Europe 2019 Livestream feed."
      , event = Conf ElmEurope2019
      , name = "Making Impossible Video States Impossible: Streamlining a Livestream"
      , speaker = "Dan Abrams"
      , url = "https://www.youtube.com/watch?v=fvb1MjYQik8"
      , year = "2019"
      }
    , { categories = [ Guide ]
      , description = "While powerful in its simplicity and important to computation, the boolean can be extremely limiting in Elm applications. In this talk, we will briefly explore the history of boolean logic in computation and look at how booleans can become misused in Elm. We will look at examples where booleans obscure the meaning of code, make code harder to maintain, and hinder usability for our teammates and users. You will learn how to harness union types to write cleaner, clearer code. More importantly, you will learn how to place usability at the forefront of the APIs and UIs you build."
      , event = Conf ElmConf2017
      , name = "Solving the Boolean Identity Crisis"
      , speaker = "Jeremy Fairbank"
      , url = "https://www.youtube.com/watch?v=6TDKHGtAxeg"
      , year = "2017"
      }
    , { categories = [ Project, Art ]
      , description = "In this talk we will use the amazing powers of Elm to live code a Mondrian Art Generator. We will do a deep dive on building complex random generators and see how we can combine them to generate conceptual art. After that, we will go through a proof of concept that uses recursive random generators to achieve a similar effect."
      , event = Conf ElmEurope2018
      , name = "Live coding a Mondrian generator"
      , speaker = "Ju Liu"
      , url = "https://www.youtube.com/watch?v=xAZLceCZGks"
      , year = "2018"
      }
    , { categories = [ Introduction, Learn ]
      , description = ""
      , event = EventUnknown ""
      , name = "Elm for beginners: Creating your first Elm program."
      , speaker = "Brodey Newman"
      , url = "https://youtu.be/9Zl0m4rPl3s"
      , year = "2018"
      }
    , { categories = [ Learn, Teaching, Introduction ]
      , description = "Elm is a delightful functional language for reliable webapps. It compiles to JavaScript, has great performance, no runtime exceptions, and can be embeded easily into existing JS projects without the need for huge rewrites or time investment.\nWe'll be taking a practically focused crash course tour of Elm, ideally you'll walk away being able to put Elm into production either from scratch or in an existing project."
      , event = EventUnknown "Reactivate London 2018"
      , name = "Elm crash course - Building unbreakable webapps fast"
      , speaker = "Mario Rogic"
      , url = "https://www.youtube.com/watch?v=kEitFAY7Gc8"
      , year = "2018"
      }
    , { categories = [ PanelDiscussion ]
      , description = ""
      , event = Conf ElmConf2016
      , name = "elm-conf 2016 speaker Q&A"
      , speaker = "All Speakers"
      , url = "https://youtu.be/LCNs92YQjhw"
      , year = "2016"
      }
    , { categories = [ Project ]
      , description = "Parsing lexical ambiguity in natural language has always been a tricky endeavor, both from the perspective of formal linguistics as well as natural language processing. In this talk, we'll consider one of the canonical examples from linguistics, the \"Buffalo buffalo Buffalo buffalo buffalo buffalo Buffalo buffalo.\" sentence from Dmitri Borgmann's 1967 \"Beyond Language: Adventures in Word and Thought.\"\nIn particular, we'll look at an implementation of parsing ambiguity using Elm, whose expressive type system can be used not just for verification but also as a tool for changing the way we think and approach solving problems in code. This talk presents a case study of how type-driven development can reveal new insights into the problems we endeavor to solve in our applications. We'll compare the implementation in Elm to one in JavaScript to demonstrate the difference in the development process when you have an expressive type system that allows you to think first about the ontology of your application as opposed to how you will encode such an ontology.\nFinally, we'll discuss the lessons learned from this particular project and how you, too, can use expressive types to solve problems you're not sure you fully understand yet."
      , event = Conf OsloElmDay2019
      , name = "Parsing lexical ambiguity with Elm and expressive types"
      , speaker = "Emma Tsujimoto Cunningham"
      , url = "https://youtu.be/sLh-7E-iOto?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Learn, Teaching ]
      , description = ""
      , event = Conf ElmEurope2019
      , name = "How I learned Elm in 9 hours"
      , speaker = "Jordan Reinhardt "
      , url = "https://www.youtube.com/watch?v=7u9HUP-5Kc8"
      , year = "2019"
      }
    , { categories = [ ExperienceReport ]
      , description = "Functional programming is beloved by developers because it allows us to efficiently produce code that is easy to work with, stable, and reliable. But what if that's also our biggest weakness? What if our own brilliance is killing us on the market? Working in Elm, we produced an app that was fast, quick to develop in, and incredibly stable ... so stable that there was no need to keep paying me to maintain it anymore. What's a consultant to do?"
      , event = EventUnknown "ClojuTRE 2018"
      , name = "I used Elm in production and it cost me my job"
      , speaker = "Annaia Berry"
      , url = "https://youtu.be/RFrKffrKCeU"
      , year = "2018"
      }
    , { categories = [ DatesTime, Learn ]
      , description = "Manipulating Dates can quickly become a problem, even for simple things like getting the current Date, obtaining the start of the week (especially with different date systems). How can we manage these problems with Elm, keeping our sanity in check.\nThis talk will try to give an overview of the standard pitfall that can occurs when dealing with dates and how to overcome them with the Elm ecosystem."
      , event = Conf ElmEurope2017
      , name = "Date manipulation with elm"
      , speaker = "Vincent Billey"
      , url = "https://www.youtube.com/watch?v=ztqEIchSDgM"
      , year = "2017"
      }
    , { categories = [ Project, Design ]
      , description = "We are drawn to Elm for many reasons: ‘compiler as assistant’, friendly error messages, pedagogic documentation, static typing, immutable data structures, pure functions. Yet the whole is more than the sum of its parts resulting in a programming philosophy that is declarative, task focussed and beginner-friendly. This talk considers how that philosophy influenced the design of elm-vega and the adoption of Elm as the primary language to illustrate Literate Visualization (LitVis).\nLitVis combines declarative specification of a visualization with a narrative that justifies its design. Elm and Vega are ideal languages for expression of the design and we describe how we integrated them with markdown to create a LitVis environment in Atom and VS Code. We describe how the Elm philosophy has influenced the design of LitVis and lessons learned. This has relevance not only for those interested in visualization with Elm but also anyone designing new packages and programming environments."
      , event = Conf ElmEurope2018
      , name = "Infecting the visualization design process with the elm philosophy"
      , speaker = "Alexander Kachkaev"
      , url = "https://www.youtube.com/watch?v=K-yoLxnm95A"
      , year = "2018"
      }
    , { categories = [ Commercial, ExperienceReport ]
      , description = "We all know writing code isn’t the hard part. The most important decision we make is what to build - not how to build it. Once we start building, we should continuously reflect on our users, and concentrate on laying good foundations for our future selves. We can better do that as a team of equals.\nIt’s great to have Elm in the ecosystem making it less risky than ever for all members of the team to contribute lines of code. I’m on a mission to break down the barrier between those who git and those who do not. We can achieve (or aim for) the ultimate [insert meaningful word for ’agile’ here] collaboration. I’ll share my story about how my team iterated on a small Elm project over a couple of years and how we experienced continuous small benefits from allowing each other to contribute in our own ways."
      , event = Conf ElmConf2019
      , name = "Growing an Elm project with the whole team"
      , speaker = "Katja Mordaunt"
      , url = "https://youtu.be/1CyaP4zkANc"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "Jim talks about Fault-tolerant parsing and\nthe L1 markup language at the Elm Online Meetup on August 4th 2021."
      , event = EventUnknown "Elm Online Meetup"
      , name = "Fault-tolerant parsing and the L1 markup language"
      , speaker = "Jim Carlson"
      , url = "https://youtu.be/gqeqtZeDp18"
      , year = "2021"
      }
    , { categories = [ Keynote ]
      , description = ""
      , event = Conf ElmConf2017
      , name = "Teaching Elm to Beginners"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=G-GhUxeYc1U"
      , year = "2017"
      }
    , { categories = [ Project ]
      , description = "There are a lot of hidden and forgotten gems in Smalltalk. One of them is the System Browser: the main way to develop Smalltalk, and a way to explore and evolve the environment. elm-browser explores the usability of such tool in the Elm ecosystem, hopefully allowing for a faster and more to-the-point development cycle."
      , event = Conf ElmEurope2018
      , name = "Elm-browser: Smalltalk goodness for elm"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=As_vGSvjz_c"
      , year = "2018"
      }
    , { categories = [ Project, Learn ]
      , description = "The elm/file and elm/bytes packages were recently released. They open up many new possibilities for Elm. One is to write a library elm-tar to encode a list of data—binary or text—as a tar archive, then download it to the user's machine. I'll describe the challenges of developing this little library, the bumps in the road to making it work, and a few use cases, ending with brief speculation on what else might be done with these new packages."
      , event = Conf OsloElmDay2019
      , name = "Tarring files with Elm"
      , speaker = "James (Jim) Carlson "
      , url = "https://youtu.be/ir4sZLIznNI?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Technique ]
      , description = "Messages are a fundamental piece of the Elm Architecture, defining exactly how the world can interact with your program. But often we choose message names without precision. In this talk, Noah Zachary Gordon outlines a set of message naming conventions that can make your code more flexible and resilient to change."
      , event = Conf ElmintheSpring2019
      , name = "Message Naming Conventions"
      , speaker = "Noah Zachary Gordon"
      , url = "https://youtu.be/w6OVDBqergc"
      , year = "2019"
      }
    , { categories = [ Project, Art ]
      , description = "Elm’s not just great for web development – it’s also a wonderful tool that you can use to make interactive, creative visuals! By following the same fundamental principles established in the Elm Architecture, you can start making HTML-based art in a matter of minutes.\nI will start my talk by giving a brief history of generative computer art from its inception. Then I will describe more modern forms of computer art, including “algorave”-style live coding.\nI will go on to explain the framework I use to achieve different effects and how Elm’s type system simplifies the production of recursive art.\nThen I will introduce some of the art that I’ve worked on in Elm, which combines the live coding style with a slider interface that allows the viewer to directly manipulate the parameters of the piece and layer many complementary effects.\nI will conclude with a live demonstration, hopefully set to music :)"
      , event = Conf ElmEurope2019
      , name = "Using Elm to Make Interactive, Generative Art"
      , speaker = "Noah Z Gordon "
      , url = "https://www.youtube.com/watch?v=H_cXdR4JtXk"
      , year = "2019"
      }
    , { categories = [ Commercial, ExperienceReport ]
      , description = "This talk is about the story of converting the way of thinking front-end in Rakuten, the largest e-commerce company in Japan and among the largest in the world.\nWhen I joined the Registration & Authentication department in Rakuten in Tokyo one year ago, almost all our products were server-side rendered using JSP or JSF.\nNow we have around 10 former back-end engineer happily coding in Elm, 12 interns learning Functional Programming and 3 major products actively developed in Elm.\nWe create a front-end environment without Html/CSS/Javascript (leveraging elm-ui) and we build several tools along the way.\nI will share the tools and some of the internal materials that I used to pitch Elm and to train back-end engineers.\nThese are the tools:\nelm-style-framework, a layer on top of elm-ui (we are big fan of the \"CSS as Bytecode\" concept) that is both a style framework and a style guide generator\nhttp-boxed, a tool for testing APIs directly from Elm without the need to install a mock server\nThe takeaway of the talk will be: Is is possible to convert, with little effort and in short time, the way of thinking front-end in large organisations."
      , event = Conf OsloElmDay2019
      , name = "Elm at large (companies)"
      , speaker = "Luca Mugnaini "
      , url = "https://youtu.be/yH6o322S8XQ?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Games, Guide ]
      , description = "Games are fun to play and fun to make! Elm is a great way to get started building games. We’ll take a whistlestop tour of 2d-game math, visuals, dealing with time, common data modeling solutions, and more. You will be equiped with the knowledge to participate in a game jam and turn your ideas into a playable game."
      , event = Conf ElmEurope2019
      , name = "Gamedev in Elm From Zero to Game Jam"
      , speaker = "Joël Quenneville "
      , url = "https://www.youtube.com/watch?v=Q1BDjeTKEdk"
      , year = "2019"
      }
    , { categories = [ ExperienceReport ]
      , description = "I was the first IT employee at COYA AG I decide to choose elm vs other alternatives in November of 2016"
      , event = Conf ElmEurope2019
      , name = "Elmwinism The Evolution of Elm By Natural Selection"
      , speaker = "Juan Fraire "
      , url = "https://www.youtube.com/watch?v=UOnuEavtubY"
      , year = "2019"
      }
    , { categories = [ Games ]
      , description = "What under water stones is when you try use Elm for games, that renders 60FPS, what must be done different. How use patterns designed for imperative programming in FP."
      , event = Conf ElmEurope2019
      , name = "Is performance enough in Elm to create full fledged video games"
      , speaker = "Roman Potasovs "
      , url = "https://www.youtube.com/watch?v=_flFAV0_TeY"
      , year = "2019"
      }
    , { categories = [ Graphics, WebGL ]
      , description = "Elm has some of the safest, friendliest WebGL support around, but has been missing a high-level 3D rendering engine - until now! This talk will introduce elm-3d-scene, a designed-for-Elm 3D rendering package for making dynamic, interactive, high-performance 3D applications such as games, scientific visualizations and computer-aided design tools.\nWe’ll look at how elm-3d-scene makes it easy to build up nice 3D graphics using intuitive concepts like shapes, materials, lights and cameras - no previous WebGL or 3D rendering experience required. We’ll explore the design principles behind the package, a bit of how it works behind the scenes, and some sample code showing how it’s used. And yes, there will be demos =)"
      , event = Conf ElmConf2019
      , name = "A 3D Rendering Engine for Elm"
      , speaker = "Ian Mackenzie"
      , url = "https://youtu.be/Htqc64s5qYU"
      , year = "2019"
      }
    , { categories = [ Learn, Testing ]
      , description = "Writing Elm applications is a joy, but do you feel the same way when you go to write or modify your test code? In this talk, we’ll explore techniques for writing easily testable Elm code. We’ll cover testing decoders and initialization logic, testing complex user flows, testing modules (inlcuding those taking advantage of the benefits of opaque types), and adding property testing.\nComing away from this talk, you should be able to identify the traits that make some Elm code challenging to test, and you should feel empowered to refactor with testability in mind.\nWhether you’re excited or nervous about testing, this talk will have something for you. Get ready to verify some behavior!"
      , event = Conf ElmConf2019
      , name = "Writing Testable Elm"
      , speaker = "Tessa Kelly"
      , url = "https://youtu.be/rIxCwPPA-D8"
      , year = "2019"
      }
    , { categories = [ Keynote ]
      , description = "Elm achieves a lot by paradoxically “doing less”. It’s a really interesting effect!\nWe have been experimenting for 1.5 years on expanding the “do less” ideology. Instead of a backend with an API, database, interchange format, hosting, deployment, migrations… what if we had none of those? Could we think of web development differently? While lots of discussion has been had about “putting Elm on the server” over the years – we’ve tried to explore in a different direction entirely.\nThis talk will explore our soon to be released project, Lamdera; the first language-as-a-service platform (as far as we’re aware!). We’ll share discoveries we made while building it, why the web development approach we have today is as it is, and what “truths” we might be able to reconsider as we approach 2020.\nWe’ll be doing some live coding in Elm and have audience participation in order to demonstrate our ideas and get live feedback from the community."
      , event = Conf ElmEurope2019
      , name = "Elm as a Service"
      , speaker = "Mario Rogic"
      , url = "https://www.youtube.com/watch?v=nSrucNcwlA8"
      , year = "2019"
      }
    , { categories = [ Games ]
      , description = "Do you want to play your own levels in Boulder Dash? Well, you actually can! And I can tell you how it is made. This combination of gaming, functional programming, and a nip of nostalgia will give us an interesting and addictive result where you can unleash all your creativity.\nIn this talk, we will discuss how you can apply the tricks of game programming to make a funny game in Elm. As kind of a fun experiment, I recreated the game Boulder Dash with my love of game programming to better learn Elm. The experiment got “a bit out of hand” and the game turned more into a game engine. Not only can we play Boulder Dash, but we can also watch the Game of Life and solve the challenge of day 15 of the Advent of Code 2018. Because why not? I would like to share my enthusiasm for the project and share how things are done. How are some challenges solved functionally? And how can you create your own games using JSON? The goal is to inspire people and to also make something funny."
      , event = Conf ElmEurope2019
      , name = "The Tricks of Game Programming in a Pure Functional Language"
      , speaker = "Jordy Moos "
      , url = "https://www.youtube.com/watch?v=3CE2X7jkoBg"
      , year = "2019"
      }
    , { categories = [ Learn, Project, Audio ]
      , description = "In this talk we build a program that reads a guitar chord sheet and emits a beautiful page. Instead of parsing the guitar chord data using regular expressions, we will use elm/parser and show that it's not as hard as it sounds. We will then proceed to implement some more advanced features for our parser and check out some edge cases of our implementation. By the end of the talk, you should be prepared to write your own parser and unleash it into the world!"
      , event = Conf OsloElmDay2019
      , name = "Do Parsers dream of Electric Guitars?"
      , speaker = "Ju Liu"
      , url = "https://youtu.be/suSAfow2rmM?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = []
      , description = "Keynotes"
      , event = Conf ElmintheSpring2019
      , name = "Types and Tests at The Gilded Rose"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/51O63Sb-Ae0"
      , year = "2019"
      }
    , { categories = [ Testing ]
      , description = "Many of us are familiar with the situation: you want to refactor some code, but it has no tests! Elm gives us confidence that the types fit, but how can we be sure we haven’t changed or broken behavior? In this talk you’ll learn about a testing workflow that uses types to guarantee refactors.\n"
      , event = Conf ElmintheSpring2019
      , name = "Guaranteed Refactors: Generating Tests from Types"
      , speaker = "Kofi Gumbs"
      , url = "https://youtu.be/Eb3pfaFwvi4"
      , year = "2019"
      }
    , { categories = [ Commercial, Product, Project ]
      , description = "Preparing an agenda for a big conference with many sessions and parallel tracks is extremely hard to do manually. NoConf is an automated agenda scheduler, which uses AI techniques to solve this problem. It has a frontend implemented in Elm and in this talk we will see how the decision to use Elm was a crucial factor of the transition from a small side project of a complete newbie in web programming into a real world application.\nWe will take a look at Elm’s learning curve. How it’s like to not have a JS background, or any web programming related knowledge for that matter, and still being able to face the challenge. Which pain points are most significant in this case and which advantages a non-web developer is getting from the start. How problems and solutions evolve along with project development and gained experience in Elm."
      , event = Conf OsloElmDay2019
      , name = "Automated conference scheduling powered by Elm"
      , speaker = "Viktor Tymoshenko "
      , url = "https://youtu.be/9V61aJVQXv0?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "elm-search provides a unique way to search exposed values of all published packages by approximate type signature.\nIn this I will share my story of implementing the initial version to learn the language Elm with its tooling, ecosystem and community. We will have a look at the search algorithm and then explore what lead me to write a new version with an improved search and more features. Finally we’ll have some fun with package statistics and see how elm-search can help in learning and teaching Elm and what it might do to improve the developer experience."
      , event = Conf ElmEurope2019
      , name = "Elm Search From Pet Project to Productivity Tool"
      , speaker = "Jonas Coch "
      , url = "https://www.youtube.com/watch?v=jFJxbCble1g"
      , year = "2019"
      }
    , { categories = [ Games, Graphics, Project ]
      , description = "Three years ago, Andrew got inspired to build a game for the browser. Since then, it’s lived and died as a React app and re-emerged as an Elm app. His talk is an experience report on this journey - pain points, surprises, the joys of using Elm and a whole lot of learning"
      , event = Conf ElmintheSpring2019
      , name = "Building Seeds: A Smartphone Game for the Browser"
      , speaker = "Andrew MacMurry"
      , url = "https://youtu.be/HaKDiAKt3ZA"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "We built an interpreter for Elm, so we could run hundreds of thousands of Elm workers side-by-side. I'll tell you why we did it, what we found along the way, and what we plan to do going forward. The talk goes into how the Elm compiler works, how to build an interpreter, how we decided to build our interpreter, why it isn't as straightforward as it sounds, and why you shouldn't build an interpreter for Elm."
      , event = Conf OsloElmDay2019
      , name = "A native interpreter for Elm"
      , speaker = "Filip Haglund"
      , url = "https://youtu.be/afMD-hkWPsQ?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Learn ]
      , description = "It's been almost 2 years since the widely referenced elm-spa-example's release in 2017, and a lot has changed! Where did all those new techniques come from? Why did the module structure change? What tips and tricks emerged over time? This talk explores the modernized Elm SPA in depth!"
      , event = Conf OsloElmDay2019
      , name = "Exploring elm-spa-example"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/RN2_NchjrJQ?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Design ]
      , description = "Developer and Designer collaboration has always been a challenging subject. Designer:” Can you please make the red background slightly darker?” Dev.: “You mean #FF3300 or #FF9922 ?” What if we had a tool that designers and developers could use in order to create an efficient collaboration and avoid these kind of impediments ?\nThis tool is called a Design System and has been a buzz word in the digital world for a couple of years. Material Design, IBM Carbon etc… All these are shared design rules and principle that are provided by leading tech companies in order to help their teams build cohesive and qualitative products.\nIn this talk, we will see how through Elm and its great ecosystem we can build a DSM that can help Developers and Designers build great products. We will define a Design Language made of colors, typography and layouts thanks to the expressiveness of the Elm Type System.Then we will make reusable views and combine them in order to build a Pattern Library."
      , event = Conf ElmEurope2019
      , name = "Building a Design System with Elm"
      , speaker = "Théophile Kalumbu "
      , url = "https://www.youtube.com/watch?v=bJmWCmMgs8c"
      , year = "2019"
      }
    , { categories = [ Visualisation, Graphics ]
      , description = "Particles are wonderful and joyful: think about catching snowflakes on your tongue, relaxing at a fireworks show, or a celebrating an astronaut's triumphant return home with a ticker tape parade! Can we capture some of that joy and give it to our users? What if we set off confetti cannons when a student turns in a paper, or flew through a starry night in our loading screen?\nWith elm-particle, you can easily add these effects – or anything else you can dream up – to your Elm app. Elm-particle integrates with The Elm Architecture to give you buttery-smooth rendering and easy integration with the rest of your code.\nIn this talk, we'll walk through creating a particle effect from scratch to highlight the best ways to make convincing particles. You will come away knowing how to move your idea out of your head and into the browser.\nLet's go!"
      , event = Conf OsloElmDay2019
      , name = "Joyful Particles in Elm"
      , speaker = "Brian Hicks"
      , url = "https://youtu.be/goL7LeDHFi4?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "Writing a Specialized WYSIWYG Editor Using Elm-UI and elm/parser\nI was unhappy with the existing tools for writing screenplays…but I know how to build my own. Building a web text editor isn’t easy to do: but formats that work with monospaced fonts, like code editors– or screenplays– can work without the nonsense."
      , event = Conf ElmintheSpring2019
      , name = "Screenplay by Elm"
      , speaker = "Dan Abrams"
      , url = "https://youtu.be/hdBo1pZCfBo"
      , year = "2019"
      }
    , { categories = [ Games ]
      , description = "Building games is in Elm is a joy. The safety makes defining your rules easy, but what about defining your “magic numbers”, like enemy speed, jump height, or explosion duration? While traditional web development involves fairly static expectations, game development is an exploratory and boundless journey. Getting that “juicy” game feel is tricky using just a text editor. Without game engine tooling you’d find in frameworks like Unity, how can we shorten the feedback loop? Build our own tooling!\nIn this talk, you’ll learn the benefits of having immediate feedback, and how to introduce tooling to your project to get that perfect look’n’feel."
      , event = Conf ElmConf2019
      , name = "Game Development in Elm: Build your own tooling"
      , speaker = "James Gary"
      , url = "https://youtu.be/766aYfUY7Js"
      , year = "2019"
      }
    , { categories = [ Maps ]
      , description = "More and more of our data is location aware and we are starting to care about showing and visualizing geospatial data. In this talk I will introduce a library for decoding, storing, measuring, transforming, generating, aggregating and interpolating that kind of data along with real world examples from the domain of disaster recovery using satellite technology and how these techniques can be used to build clever geospatial dashboards in Elm. I will also briefly demonstrate how one might visualize this kind of data using gampleman/elm-mapbox."
      , event = Conf ElmEurope2019
      , name = "Geospatial Analysis in Elm"
      , speaker = "Jakub Hampl "
      , url = "https://www.youtube.com/watch?v=cwTwnIoX8N4"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "Markdown is an ideal tool for documenting and thus a suitable format for Open Educational Resources, but as a static markup language it is also boring. So the idea was born to create a DSL that is based on Markdown but intended to be used for developing online courses, that look like screen-cast with various interactive elements. Starting this project with Elm, it was more or less an explorative journey, with rapid changes in the DSL and the interpreter that were guided by the elm compiler. Code-blocks are now executable and editable, quizzes can be defined in various ways, images are generated from ASCII-art, effects and transitions combined with text2speech that enable interactive storytelling, among other features. But the course itself is still a valid Markdown document that can be edited by any ordinary person, even without programming skills. The interpreter build around the Elm-architecture hides all complexity, such as code evaluation, internal message routing, lazy parsing, etc. - "
      , event = Conf ElmEurope2019
      , name = "Open Course Development with Liascript"
      , speaker = "André Dietrich "
      , url = "https://www.youtube.com/watch?v=w_CRABsJNKA"
      , year = "2019"
      }
    , { categories = [ Project ]
      , description = "What do you do when Elm is too slow? This can easily happen when running simulations of physical processes, agent-based models in the social sciences, statistical computations, or just a very large and complex version of the Game of Life. Fear not! There is a solution: Futhark, a statically typed, pure functional language that compiles to optimized GPU code. And that means FAST! In this talk, we’ll give a quick overview of Futhark, describe how to rig up a Futhark compute server, and how to wire it to an Elm front end."
      , event = Conf ElmConf2019
      , name = "Making Elm talk to your personal Supercomputer"
      , speaker = "James Carlson"
      , url = "https://youtu.be/FVP8zxpZKV8"
      , year = "2019"
      }
    , { categories = [ Commercial, Product, Project ]
      , description = ""
      , event = Conf ElmEurope2019
      , name = "Not Only Meetings"
      , speaker = "Thibaut Assus "
      , url = "https://www.youtube.com/watch?v=SICGPEbw2jU"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, Commercial ]
      , description = "It is no doubt that all Elmers are making an application that is going to be LARGE! We are also the same. The bigger our application got, the more severe, challenging decisions we were required to make in viewpoint of software architecture, design pattern - you name it.\nMy talk shows a long journey of our product with Elm including decisions we have made, troubles we dealt with, and so on.\nAudience can learn how to make their application scalable all the way around blunders in the viewpoint of real world use of Elm.\nThis is the true story which comes from the largest Elm application in Japan."
      , event = Conf ElmEurope2019
      , name = "Our Journey with the Biggest Elm App in Japan"
      , speaker = "Seiya Izumi "
      , url = "https://www.youtube.com/watch?v=A-MqLntcyp0"
      , year = "2019"
      }
    , { categories = [ Project, Art ]
      , description = "In this talk, we will look at a project where we read data from an audio file using the WebAudio API and use the data to generate browser-based art, evolving through time. We’ll do some live coding with the project to show how to start with a small idea and build upon it. After demonstrating the project, we’ll then dig into the code and review the use of opaque types, looking specifically at how they are used in the project to expose an API that can be used to change elements in response to audio events. Let’s have a bit of fun and make some surprising, delightful art for the web!"
      , event = Conf ElmEurope2019
      , name = "Generative Multimedia Experiences and Opaque Types"
      , speaker = "Emma Cunningham "
      , url = "https://www.youtube.com/watch?v=GIJ_XBvQ8Z8"
      , year = "2019"
      }
    , { categories = [ Learn, Introduction ]
      , description = ""
      , event = EventUnknown ""
      , name = "Building apps in Elm part 1: Getting started"
      , speaker = "Jack Franklin"
      , url = "https://youtu.be/r44D650szpg"
      , year = "2019"
      }
    , { categories = [ ElmPhilosophy, ExperienceReport ]
      , description = "“A function or expression is said to have a side effect if it modifies some state or has an observable interaction with calling functions or the outside world.” - Wikipedia\nThis is the story of how we adopted Elm in our young startup, and how we evolved alongside our growing codebase.\nI’ll try to debug several side effects Elm had on our world. Some that can be directly traced to Elm: how we managed to avoid writing CSS ever again, or how our quality code standards took a step up when developing our second product, and some more insidious: how functional programming sneakily influenced our coding style, how we changed our way of writing tests, or how our application backend changed as Elm took more and more place."
      , event = Conf ElmEurope2019
      , name = "Elm Side Effects: How Adopting Elm Modified our State"
      , speaker = "Diane Maniere "
      , url = "https://www.youtube.com/watch?v=-8zwuUKldYw"
      , year = "2019"
      }
    , { categories = [ Audio ]
      , description = "I have written a lot of code (including some Elm code) that deals with generating audio and simulating realistic sounding musical instruments. It’s been a deep dive for me into fascinating different theories of sound. I’d like to share what I have picked up. Here is an outline:\nAdditive synthesis is really simple: just combine many sine waves\nSaw tooth waves, square waves (show and explain a cool fourier series gif)\nTalk about bells a little bit, and show how different bell sounds really just come down to a certain profile of sine waves\nTalk about the really basic mechanics of whats happening in a bell as it vibrates\nGrainular syntehesis: modelling sound as atomic sound “grains”\nShow how a vibrating bell is more like a “grain” of sound traveling through the bell itself, and that sounds generally can be modelled as atoms expressing themselves in a medium\nChanging a sounds speed without changing its tone is really tricky, but grainular synthesis makes it simple."
      , event = Conf ElmEurope2019
      , name = "What has Excited Me About Audio Synthesis Theory"
      , speaker = "Chad Stearns "
      , url = "https://www.youtube.com/watch?v=RFCPAw5C5hQ"
      , year = "2019"
      }
    , { categories = []
      , description = ""
      , event = EventUnknown "ClojuTRE 2019"
      , name = "Why Isn't Functional Programming the Norm? "
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/QyJZzq0v7Z4"
      , year = "2019"
      }
    , { categories = [ Teaching, Design, Audio ]
      , description = "Music teachers need great music theory teaching tools. In this talk you will see that Elm’s type system is a great way to model music theory concepts. Music theory is full of nuance and exceptions to rules. Using types and leveraging the Elm compiler we can reduce the number of tests needed to validate a correct solution.\nI am building an app that drills students on theory concepts such as notes, intervals, and chords. The brain of the exercises is the music theory API built in Elm."
      , event = Conf ElmConf2019
      , name = "Building a Music Theory API with Types"
      , speaker = "Ryan Frazier"
      , url = "https://youtu.be/y9SDEu7hCx4"
      , year = "2019"
      }
    , { categories = [ Project, Meta ]
      , description = "The (reference) Elm compiler as we know it right now is currently implemented in Haskell, and emits JavaScript code. I’ll be talking about my side-project: an Elm compiler written in Elm, emitting JavaScript—sure—but hopefully allowing for native code, WebAssembly and other possibilities!\nTopics include:\nwhat it will allow us to do (hint: a lot of exciting stuff! prepack-like optimizations, interpreter, debugger, eval…)\nhow to structure a compiler\nhow it can then be exposed as a library to allow experimentation and cool extensions!"
      , event = Conf ElmEurope2019
      , name = "Elm compiler in Elm!"
      , speaker = "Martin Janiczek "
      , url = "https://www.youtube.com/watch?v=62khGXfh8zg"
      , year = "2019"
      }
    , { categories = [ ElmPhilosophy ]
      , description = "Test-Driven Development is a powerful programming technique because it:\nTightens feedback loops\nHelps you get one small use case fully working before moving on to the next one\nLet’s you start with your intention before doing the implementation\nIn this talk, you’ll learn how to get those same benefits using elm’s compiler like a test framework. This isn’t a replacement for Test-Driven Development in elm, but rather a complementary technique.\nKent Beck says that our goal is to write “clean code, that works,” but that we make it harder on ourselves by trying to start with clean code, and then make it work. Similarly, in elm it’s a lot more difficult when we try to get clean working code, and then get it compiling. Start by finding the Shortest Path to Compile. Once we’re compiling, getting the correct values (getting it working) becomes far easier! And once we have correct values, refactoring (getting it clean) becomes far easier!"
      , event = Conf ElmEurope2019
      , name = "Incremental Type Driven Development"
      , speaker = "Dillon Kearns "
      , url = "https://www.youtube.com/watch?v=mrwn2HuWUiA"
      , year = "2019"
      }
    , { categories = [ Media ]
      , description = "Rich audio and video support is one of the most beloved features of the modern web. In Elm, we don’t have to miss out on the fun. But the HTML5 Media API brings some unique challenges, especially since media playback itself is a side effect!\nIn this talk, I’ll cover the basics of building your own audio and video players in Elm—managing state, choosing the best version for each user, synching subtitles or other rich content. I’ll also cover the two gotchas that most people run into right away when working with the Media API, and which can cause hours of debugging consternation if you’re not careful.\nTime allowing, I’ll show off working with live streams, capturing from a webcam or generating and manipulating music and audio"
      , event = Conf OsloElmDay2019
      , name = "Audio, Video, and Elm - Best Practices for Multimedia"
      , speaker = "Dan Abrams"
      , url = "https://youtu.be/8jW58fXuuOk?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Concept, Technique ]
      , description = "Working with HTML in Elm is a joy: creating little reusable functions like 'button' is so fun! But what happens when options invade? Icons? Sizes? Loading states? In this talk, we introduce options for dealing with the inevitable complexity in your style guide and get back to the joy of creation."
      , event = Conf ElmintheSpring2019
      , name = "Robot Buttons from Mars"
      , speaker = "Brian Hicks"
      , url = "https://youtu.be/PDyWP-0H4Zo"
      , year = "2019"
      }
    , { categories = []
      , description = "Having written React for 2 years and done 1.5 side projects using Elm, Katie suddenly found herself waist deep in productionalized Elm. Wade through these waters with her as she learns to build my sense of direction in an unfamiliar project, not to mention one of the biggest Elm code bases."
      , event = Conf ElmintheSpring2019
      , name = "Where the Elm Am I"
      , speaker = "Katie Hughes"
      , url = "https://youtu.be/-zVnK7N8VCI"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, Commercial ]
      , description = "At my company we are mainly building E-Commerce websites using Elm. Some examples in production are: - "
      , event = Conf ElmEurope2019
      , name = "Moving to the Actor Model in Elm "
      , speaker = "Albert Dahlin "
      , url = "https://www.youtube.com/watch?v=YV_qrjN8bRA"
      , year = "2019"
      }
    , { categories = [ Project, Audio ]
      , description = "Building my first Elm app was a two-for-one deal: learn functional programming and learn to sight-read sheet music! I’ll share my greatest challenges and most valuable lessons from building this musical side project, with Elm as my first introduction to purely functional programming.\nHighlights include:\nUsing the Web MIDI API with Elm via JavaScript interop to get input from a digital piano directly in the web browser\nVisualizing the music with Elm’s SVG package\nExploring SVG animations in the Elm ecosystem\nElm’s best features from the perspective of a beginner\nFunny beginner mistakes (how not to use Elm!)\nTagline for this personal project: learn to hear with your eyes and play from your heart!"
      , event = Conf ElmEurope2019
      , name = "Building a Music Learning Game with Elm, Web Midi, and SVG Animation"
      , speaker = "Liz Krane "
      , url = "https://www.youtube.com/watch?v=D2SVvXAmdt8"
      , year = "2019"
      }
    , { categories = [ Community ]
      , description = "Elm and the community around it have a very peculiar characteristic: they embrace being human. I think this is one of the biggest strengths of this beautiful little language and I want to show you why.\nAs programmers, we often forget that it's okay to be human. It's okay to ask basic questions, to make mistakes and take a break from GitHub once a while. These values are much more present in the Elm community than any other programming community I've been a part of.\nIt all starts with the language design itself, with difficult syntax and concepts being phased out each release. The compiler errors are incredibly human, and so are the messages you get for trying to install not-yet-updated packages. But this goes far beyond the command line messages. People discuss ideas on the super friendly Elm Slack. Beginners' problems are solved in a respectful way, welcoming and including them in the community.\nThe way packages are versioned helps alleviate the pains of breaking changes both for the users and the authors. When a competing package comes around, people involved in the more mature package applaud the effort and share their knowledge.\nAll this means the Elm community is nice for people, which is crucial, and that it is also great for the package ecosystem as a whole. The open attitudes and trust people have, along with the courage to iterate through the breaking changes, is what results in the insigthful designs we see in the packages."
      , event = Conf OsloElmDay2019
      , name = "Being human in the Elm community"
      , speaker = "Ossi Hanhinen"
      , url = "https://youtu.be/l-brxQKJnfw?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ Commercial, ExperienceReport ]
      , description = "In 2017 NSB, one of Norways largest providers of public transport, faced a situation where large and continuous changes to their young but already dated web platform were needed.The choice was made to move the code base to Elm, and now, one and a half year later, all the most critical parts of the platform is built in Elm.\nIn this talk I will share our team's experience from this process. I will talk about why we ended up building many medium sized applications instead of a large one and how we have created private libraries and a view-function library to reuse code between applications, boost our productivity and make the applications better.\nAlong the way I will share which things we have found to be simple thanks to Elm, and the pain points we have encountered."
      , event = Conf OsloElmDay2019
      , name = "On the Elm Track with NSB"
      , speaker = "Jonas Berdal"
      , url = "https://youtu.be/yE9PKFI19RM?list=PLcAzxXzXQlPbalOfueVbHCRSo26ksIXiF"
      , year = "2019"
      }
    , { categories = [ ExperienceReport, Commercial ]
      , description = "The UI client of our ARIC Fraud Hub product is a 100k LOC Elm app. Over the last 18 months we ported it from Agnular 1 to Elm, and added many new features. On the way we learned a lot. We’ll present a summary of that story: How we chose and adopted Elm. How we made Elm and Angular play nice together during the migration. What we learned from using Elm with a team of ~6 engineers on a large complex project. And what we want in the future: from Elm and from ourselves."
      , event = Conf ElmEurope2018
      , name = "Lessons from 100k LOC elm at Futurespace"
      , speaker = "Mark Skipper and Decio Ferreira"
      , url = "https://www.youtube.com/watch?v=0AosqGTEa0Q"
      , year = "2018"
      }
    , { categories = [ Keynote ]
      , description = ""
      , event = Conf ElmConf2018
      , name = "Immutable Relational Data"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/28OdemxhfbU"
      , year = "2018"
      }
    , { categories = [ Learn ]
      , description = "Parsers have a name for being an esoteric domain, but it's a misleading notion. In this talk, I'll teach you what I learned from starting out as a novice to making a full fledged YAML parser in Elm. A journey during which I discovered that parsers are super interesting and fun, and once you understand the fundamentals, they are a breeze thanks to the tooling available in Elm."
      , event = Conf ElmConf2018
      , name = "Demystifying Parsers"
      , speaker = "Tereza Sokol"
      , url = "https://youtu.be/M9ulswr1z0E"
      , year = "2018"
      }
    , { categories = [ Project, Guide, UI ]
      , description = "Elm helps us to think in terms of algorithms, not just in terms of “let’s make it work”. We can focus on one task at a time, without having the overhead of having to think in terms of “the whole app”.\nAnd it allows us to pick highly complex subjects and tackle them for fun and profit.\nCreating a date picker like https://developer.apple.com/documentation/uikit/uidatepicker is very complex. We have to model the display with inline css 3d and requestanimationframe, the touch with touch events, the physics of the date picker with some physics theory. And doing that is javascript would mean handling every aspect of it in a “global” way.\nCreating a native looking date picker in elm means we can concentrate on the bigger vision (the date picker), one little function at a time, and it means we can do it in a reusable manner.\nThis talk will outline how we did it and what the result looks like, and it’ll emphasise how we designed it."
      , event = Conf ElmEurope2018
      , name = "How to build a native looking date picker with elm"
      , speaker = "Thibaut Assus"
      , url = "https://www.youtube.com/watch?v=nal1MUgZ8Tc"
      , year = "2018"
      }
    , { categories = [ Animation, UI ]
      , description = "Elm’s basis in immutability presents a unique set of challenges to animators.\nIn a language that allows mutation we can get away with hiding all our details behind local state, but in Elm we have to capture every detail in our model. This means many of the APIs we may be familiar with in languages like Javascript don’t translate directly over to Elm in the nicest way. Or they do translate, but require a lot of manual wiring and record keeping.\nHowever immutability is an incredible advantage and there’s no reason that advantage doesn’t translate into the realm of animation. The main challenge is adjusting our thinking around animation in Elm. So, what does an immutable animator’s toolkit look like?\nBy slightly shifting our thinking and embracing Elm’s design decisions we can arrive at a unique set of tools and techniques that provides high level control over our animations and feels unique to the Elm language."
      , event = Conf ElmEurope2018
      , name = "The immutable animator's toolkit"
      , speaker = "Matthew Griffith"
      , url = "https://www.youtube.com/watch?v=Nf4rElfA8SE"
      , year = "2018"
      }
    , { categories = [ Learn ]
      , description = "Some things can’t be done with Elm. It’s a young language with so much potential to be realized in the years ahead. If a program you are writing today falls outside of Elm’s capabilities, like writing a server, it can better to choose a different language. When it comes to fancy UI features, though, you might be able to have your cake and eat it too. In this talk you will learn about when and how to use web components in your Elm views. The most common inquiry we’ll cover is interop with fancy JS UI packages that are not economically viable to replicate in Elm, like rich text editors. We’ll also talk about components that make visual changes outside of the Elm update cycle for performance-critical UI behaviors, and more. The examples covered in this talk are based on production experience, fully compatible with Elm and all WHATWG specs, and can be polyfilled at least as far back as IE 11 and Safari 9."
      , event = Conf ElmEurope2018
      , name = "When and how to use Web Components with elm"
      , speaker = "Luke Westby"
      , url = "https://www.youtube.com/watch?v=tyFe9Pw6TVE"
      , year = "2018"
      }
    , { categories = [ Iconic, ElmPhilosophy ]
      , description = "As more people enter /r/elm and the Elm discourse, I have thought a lot about how \"online communities\" work. Patterns of conflict. Why those patterns exist. Structures that would diffuse that conflict in healthy ways. Initially I just wanted to get yelled at less, but I instead stumbled upon \"a cultural history of open source\" that may reveal a path to more civil and productive online communication in general.\nAttendees will leave with (1) an inside perspective on open source projects, (2) a historical and cultural framework that I think can improve online communities right now, and (3) some interesting references and ideas to explore further in their own projects and interactions."
      , event = EventUnknown "Strange Loop 2018"
      , name = "The Hard Parts of Open Source"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/o_4EX4dPppA"
      , year = "2018"
      }
    , { categories = [ Interop ]
      , description = "We love the feeling we get writing Elm code where \"if it compiles it works™.\" But what happens when we need to interact with the outside world from Elm? Our API throws a curve ball and gives us an unexpected null. Or we're not sure what keys an object returned from a javascript library has. So we have to keep tweaking the code and refreshing the page to see if our decoders fail at runtime. Can't we do better than that!?\nWe can! In this talk you'll learn about 3 packages that enforce contracts with the outside world and give us confidence that things will work the FIRST time we load our app."
      , event = Conf ElmConf2018
      , name = "Types Without Borders"
      , speaker = "Dillon Kearns"
      , url = "https://youtu.be/memIRXFSNkU"
      , year = "2018"
      }
    , { categories = [ Project, Art ]
      , description = "In this talk we will use the amazing powers of Elm to live code a Mondrian Art Generator. We will do a deep dive on building complex random generators and see how we can combine them to generate conceptual art. After that, we will go through a proof of concept that uses recursive random generators to achieve a similar effect."
      , event = Conf ElmEurope2018
      , name = "Live coding a Mondrian generator"
      , speaker = "Ju Liu"
      , url = "https://www.youtube.com/watch?v=xAZLceCZGks"
      , year = "2018"
      }
    , { categories = [ Introduction, Learn ]
      , description = ""
      , event = EventUnknown ""
      , name = "Elm for beginners: Creating your first Elm program."
      , speaker = "Brodey Newman"
      , url = "https://youtu.be/9Zl0m4rPl3s"
      , year = "2018"
      }
    , { categories = [ Learn, Teaching, Introduction ]
      , description = "Elm is a delightful functional language for reliable webapps. It compiles to JavaScript, has great performance, no runtime exceptions, and can be embeded easily into existing JS projects without the need for huge rewrites or time investment.\nWe'll be taking a practically focused crash course tour of Elm, ideally you'll walk away being able to put Elm into production either from scratch or in an existing project."
      , event = EventUnknown "Reactivate London 2018"
      , name = "Elm crash course - Building unbreakable webapps fast"
      , speaker = "Mario Rogic"
      , url = "https://www.youtube.com/watch?v=kEitFAY7Gc8"
      , year = "2018"
      }
    , { categories = [ ExperienceReport ]
      , description = "Functional programming is beloved by developers because it allows us to efficiently produce code that is easy to work with, stable, and reliable. But what if that's also our biggest weakness? What if our own brilliance is killing us on the market? Working in Elm, we produced an app that was fast, quick to develop in, and incredibly stable ... so stable that there was no need to keep paying me to maintain it anymore. What's a consultant to do?"
      , event = EventUnknown "ClojuTRE 2018"
      , name = "I used Elm in production and it cost me my job"
      , speaker = "Annaia Berry"
      , url = "https://youtu.be/RFrKffrKCeU"
      , year = "2018"
      }
    , { categories = [ Project, Design ]
      , description = "We are drawn to Elm for many reasons: ‘compiler as assistant’, friendly error messages, pedagogic documentation, static typing, immutable data structures, pure functions. Yet the whole is more than the sum of its parts resulting in a programming philosophy that is declarative, task focussed and beginner-friendly. This talk considers how that philosophy influenced the design of elm-vega and the adoption of Elm as the primary language to illustrate Literate Visualization (LitVis).\nLitVis combines declarative specification of a visualization with a narrative that justifies its design. Elm and Vega are ideal languages for expression of the design and we describe how we integrated them with markdown to create a LitVis environment in Atom and VS Code. We describe how the Elm philosophy has influenced the design of LitVis and lessons learned. This has relevance not only for those interested in visualization with Elm but also anyone designing new packages and programming environments."
      , event = Conf ElmEurope2018
      , name = "Infecting the visualization design process with the elm philosophy"
      , speaker = "Alexander Kachkaev"
      , url = "https://www.youtube.com/watch?v=K-yoLxnm95A"
      , year = "2018"
      }
    , { categories = [ Project ]
      , description = "There are a lot of hidden and forgotten gems in Smalltalk. One of them is the System Browser: the main way to develop Smalltalk, and a way to explore and evolve the environment. elm-browser explores the usability of such tool in the Elm ecosystem, hopefully allowing for a faster and more to-the-point development cycle."
      , event = Conf ElmEurope2018
      , name = "Elm-browser: Smalltalk goodness for elm"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=As_vGSvjz_c"
      , year = "2018"
      }
    , { categories = [ Community, Learn ]
      , description = "Have you wanted to publish a package, but don’t know where to begin? The Elm package ecosystem is filled with wonderful and useful packages, and it can be intimidating to try and add to that. But while it can take real effort to create something good, it doesn’t have to feel so overwhelming! In this talk, I’ll show you small, concrete steps to take so you can finally publish that code you’ve been sitting on. You’ll leave with the confidence that you can make something really nice!"
      , event = Conf ElmEurope2018
      , name = "Let's publish nice packages"
      , speaker = "Brian Hicks"
      , url = "https://www.youtube.com/watch?v=yVn7FOQuwDM"
      , year = "2018"
      }
    , { categories = [ Community ]
      , description = "Regardless of your knowledge level, writing a course is a good way to improve your skills. Explaining a concept lets you watch it under a different point of view, out of habits based on practice! Shall we wait to be an “expert” to publish a tutorial? How to explain what seems so simple or, by contrast, so complicated? Come to discover it!"
      , event = Conf ElmEurope2018
      , name = "Teaching is learning"
      , speaker = "Céline Martinet Sanchez"
      , url = "https://www.youtube.com/watch?v=vDdd7Gnwlmc"
      , year = "2018"
      }
    , { categories = [ Commercial ]
      , description = "In this talk, I will share how my team at Second Spectrum went from the first group that was using Elm in production to how we spread excitement for Elm to other groups within our organization. Through the talk, I will share lessons learned in terms of the challenges involved in onboarding those new to Elm (and functional programming) and the benefits we saw on our team after we started using Elm, as well as suggestions for those looking to use Elm in their organizations. Finally, I’ll explain how, once we had lots of folks within our company using Elm, we leveraged that energy to start Elm LA, a local meetup that we started last year in Los Angeles, CA. The audience will come away from the talk with actionable strategies on how to get buy-in within their organizations to start using Elm."
      , event = Conf ElmEurope2018
      , name = "Getting your organization onboard with elm"
      , speaker = "Emma Cunningham"
      , url = "https://www.youtube.com/watch?v=iZH5QyCB-Hg"
      , year = "2018"
      }
    , { categories = [ Learn ]
      , description = "I’m a (co-)founder of Syncrypt, an open source, zero-knowledge, client-side & end-to-end encrypted file backup and sharing service. We started out with a CLI client & daemon written in Python, that does all encryption and uploading. Later we started working on a GUI written in JS, React and Electron. Since we’re all mostly backend engineers by trade, we got tired of using JS (& React to be honest) after a short while of using it and decided to look for alternatives. I found out about Elm due to researching alternatives to React. It took me about 3 days to fully get the hang of the language but I felt productive from day 1. I’ll talk about the learning curve, about how great the development tools are in learning the language itself and how I ended up with a working prototype (including JSON parsing!) after the first 3 days of working on the Elm based rewrite. The Elm UI talks to the python daemon via HTTP & JSON."
      , event = Conf ElmEurope2018
      , name = "Learning elm in 3 days using the compiler"
      , speaker = "Christopher Bertels"
      , url = "https://www.youtube.com/watch?v=ulki9D2OKN8"
      , year = "2018"
      }
    , { categories = [ ElmPhilosophy ]
      , description = "This talk will look at some of the lessons learned from migrating the codebase of the elm-geometry package from its object-oriented origins in C++ and Scala to its current implementation in Elm.\nWe’ll show how to take code that depends on various features found in object-oriented languages and rewrite that code in idiomatic Elm. For example, in a language without overloading or implicit conversions, how do you write functions that work with both vectors and unit vectors? Without inheritance, how do you share 3D transformation functionality between different types of geometry? Answering these questions carefully can require some significant “conceptual refactoring”, but often results in Elm code that is simpler, clearer and more flexible than the original! We’ll show how to take code that depends on various features found in object-oriented languages and rewrite that code in idiomatic Elm. For example, in a language without overloading or implicit conversions, how do you write functions that work with both vectors and unit vectors? Without inheritance, how do you share 3D transformation functionality between different types of geometry? Answering these questions carefully can require some significant “conceptual refactoring”, but often results in Elm code that is simpler, clearer and more flexible than the original!"
      , event = Conf ElmEurope2018
      , name = "Now you're thinking in functions"
      , speaker = "Ian Mackenzie"
      , url = "https://www.youtube.com/watch?v=F4fuVJNnQoo"
      , year = "2018"
      }
    , { categories = [ Iconic, ElmPhilosophy, ExperienceReport, Introduction ]
      , description = "When I got into Elm as a React developer in 2014, I only expected to learn a pleasant functional programming language. I never thought I would discover a whole new programming flow—a flow where I could spend hours productively writing UI code without slowing down to open a browser and visually check my progress. What kind of bizarro front-end Web development world is that? What is it about Elm's design that makes this kind of flow possible, and what assumptions does it challenge about the most effective ways to write code? Does it take a whole different programming language to pull this off, or are there ways to get the same benefits in any language? We'll explore all of these questions and more in this talk. Come find out!"
      , event = EventUnknown "Øredev 2018"
      , name = "Crafting faster in the dark"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/V_HveL2OVkc"
      , year = "2018"
      }
    , { categories = [ Learn, Technique ]
      , description = "One of the selling points of Elm is that you cannot get null errors. Maybe is what allows Elm to avoid this billion-dollar problem entirely. It’s a beautiful solution.\nBut it doesn’t take too long before your code is one long ugly nested case statement checking Maybes at every level. Surely this can’t be right. There must be a better way.\nWe have an array of tools at our disposal to solve this problem, from simple convenience functions all the way to eliminating Maybe altogether in favor of other constructs. Join me on a whirlwind tour of these solutions and take back control of your codebase."
      , event = Conf ElmEurope2018
      , name = "Working with Maybe"
      , speaker = "Joël Quenneville"
      , url = "https://www.youtube.com/watch?v=43eM4kNbb6c"
      , year = "2018"
      }
    , { categories = [ Guide ]
      , description = "An average person can hold entire libraries worth of information in their head without even trying. Why is it then, that when I am working on an Elm app, I find myself flipping back and forth from tab to tab and scrolling through the hundreds of lines of code trying to find a few lines I've already read? While we may be able to hold vast amount of data in our brains, this does not apply to our \"working memory\". As programmers, we have to be picky about what we dive into within a codebase. This is why naming in Elm, though often taken for granted as styling choices, becomes an integral part of working memory preservation. Reducing the amount of names we have to parse, or making those names more expected, can lower the number of assumptions we have to make and the space we need in our memory to hold them. I hope to introduce some small stylistic changes as well as grander design approach suggestions, so that people can write their Elm apps with greater confidence and velocity."
      , event = Conf ElmConf2018
      , name = "Naming Things in Elm"
      , speaker = "Ally Kelly McKnight"
      , url = "https://youtu.be/trgET9YU37M"
      , year = "2018"
      }
    , { categories = [ ExperienceReport ]
      , description = ""
      , event = EventUnknown ""
      , name = "Elm at Scale: More Surprises, More Pain Points"
      , speaker = "Kevin Yank"
      , url = "https://youtu.be/uQjivmLan0E"
      , year = "2018"
      }
    , { categories = [ Project ]
      , description = "Imagine Alice and Bob editing the same text document at the same time from different devices – but both being offline. How could their changes be merged eventually so that both ends yield the same result and the intention of both probably conflicting editions is preserved? Conflict-free replicated data types (CRDTs) to the rescue! In a mobile world with unreliable network connectivity, CRDTs allow for distributed offline-first applications integrating concurrent changes in a lightweight way. Data replicas are guaranteed to be eventually consistent among peers while keeping the context and order of merged operations. In this talk I will briefly describe CRDTs in general and why they matter to reactive Web development. Furthermore, I will present an Elm implementation of LSEQ - a CRDT for sequential data like text - and its binary serialization format. Finally, I will demo a collaborative Web app built on top of it."
      , event = Conf ElmEurope2018
      , name = "ElmSEQ: A conflict-free replicated data type for elm"
      , speaker = "Matthias Rella"
      , url = "https://www.youtube.com/watch?v=r_QmENb-TAA"
      , year = "2018"
      }
    , { categories = [ Robotics ]
      , description = "Elm is most often used to make webapps, but by using ports and a bit of glue code Elm can be embedded anywhere we can use Javascript. This opens up a lot of possibilities.\nIn this talk we will use Elm to program a robot. This will involve both imperative and functional programming, and play to the strengths of each of them. We'll also discover how the patterns we use in webapps translate to other domains."
      , event = Conf ElmConf2018
      , name = "Programming Robots with Elm"
      , speaker = "Anthony Deschamps"
      , url = "https://youtu.be/WQFwnKVLDdI"
      , year = "2018"
      }
    , { categories = [ Keynote, Community, Iconic, ElmPhilosophy ]
      , description = ""
      , event = Conf ElmEurope2018
      , name = "What is Success? "
      , speaker = "Evan Czaplicki"
      , url = "https://www.youtube.com/watch?v=uGlzRt-FYto"
      , year = "2018"
      }
    , { categories = [ Meta, Project ]
      , description = "Github is a vast collection of code which could give us insights into how people are using Elm. The problem is that all the code is represented as text which limits our ability to analyze it automatically. In this talk, you will learn how we can leverage Elms statically typed nature to parse all public elm code on Github into a structured form which allows us to ask interesting questions like:\n1) Give me examples how to use a specific library function?\n2) How many people would be affected by changing some library functionality?\n3) Is this library still used in recent code?"
      , event = Conf ElmEurope2018
      , name = "3.9 million lines later: Analyzing all open source elm code"
      , speaker = "Paul Sonnentag"
      , url = "https://www.youtube.com/watch?v=HLeQ8OmdJRk"
      , year = "2018"
      }
    , { categories = [ ExperienceReport ]
      , description = "When we discuss how to help teams adopt new technologies or paradigms like Elm of Functional Programming, we often focus on a technical glide path. Not enough attention is given to building a team culture that is open to experimenting with new technologies and adopting them if the experiments go well. This talk will explore strategies and tactics to build such a culture through the lens of my team's experiences at Ford Motor Company. Building such a culture has produced a number of pleasant side effects, including allowing our team to adopt Elm for all of our front-end development."
      , event = Conf ElmConf2018
      , name = "Facilitating Technology Change Through Cultural Change"
      , speaker = "Grant Maki"
      , url = "https://youtu.be/5WVXCy1Q88o"
      , year = "2018"
      }
    , { categories = [ UI, Design ]
      , description = "Style Elements has evolved enormously over the past year in pursuit of building a better toolkit for design.\nThis has meant figuring out a way to test a new layout language, coming to a greater understanding of what makes a good design primitive, and researching how style can scale nicely as a codebase grows.\nLet's look at how each part unfolded."
      , event = Conf ElmConf2018
      , name = "Building a Toolkit for Design"
      , speaker = "Matthew Griffith"
      , url = "https://youtu.be/Ie-gqwSHQr0"
      , year = "2018"
      }
    , { categories = [ Project ]
      , description = "We are building a code editor, called Deuce, that adds support for structured editing to a conventional text editor. Deuce supports an Elm-like language and is implemented in Elm.\nIn this editor, the user can hover over and select expressions and other code items of interest (using direct manipulation). Then, the editor displays a menu of context-sensitive program transformations, such as Introduce Variable, Introduce Function, and Refactor Data Type. We will demonstrate the kinds of interactions enabled by this combination of text- and structured-editing."
      , event = Conf ElmConf2018
      , name = "Structured Editing for Elm* in Elm"
      , speaker = "Ravi Chugh"
      , url = "https://youtu.be/-TFL6E1uSHE"
      , year = "2018"
      }
    , { categories = [ Project, Concept ]
      , description = "Having total type-safety within an application in Elm makes working on projects a joy, especially long term when things get increasingly complicated and changing requirements abound.\nHowever what about type safety between versions of our apps?\nOnce our applications are out in the wild, how do we get our users from version A to version B without throwing everything away in the transition? Could we use Elm’s guarantees somehow to help us make this process smooth and enjoyable?\nThis talk will explore 12 months of research and prototyping on turning “decidious” Elm deployments into an “evergreen” affair."
      , event = Conf ElmEurope2018
      , name = "Evergreen elm"
      , speaker = "Mario Rogic"
      , url = "https://www.youtube.com/watch?v=4T6nZffnfzg"
      , year = "2018"
      }
    , { categories = [ Project ]
      , description = "minilatex is an Elm package for converting a subset of LaTeX into Html – a way to put LaTeX into the browser. We will talk about the design and implementation of the parser and renderer, and how the package is used in a web app to create and publish technical documents. The package itself is pure Elm and relies on Evan Czaplicki’s elm-tools/parser. It uses a diffing strategy suggested by Ilias van Peer which make performance in a day-to-day editing environment extremely fast (yay!)\nThe app ( under development at "
      , event = Conf ElmEurope2018
      , name = "Making a LaTeX-to-Html parser in elm"
      , speaker = "James Carlson"
      , url = "https://www.youtube.com/watch?v=dmDA7iziSgs"
      , year = "2018"
      }
    , { categories = [ Graphics ]
      , description = "We get a lot for free from using the web platform. Rendering text is one of such things that browsers do well. But what if we wanted to implement this ourselves from scratch? Then we would not only have to learn typographic terms, but also understand their true behavior.\nHaving implemented the rendering of a typeface, that my wife designed, I would like to share the challenges of modelling the text flow in Elm. Even though this has a limited practical applicability, my hope is that you would not only get some insights into typeface properties, but also learn to appreciate the tools we have. And of course you will see how good it fits with Elm!"
      , event = Conf ElmEurope2018
      , name = "Rendering text with WebGL"
      , speaker = "Andrey Kuzmin"
      , url = "https://www.youtube.com/watch?v=qasFxsOCfpA"
      , year = "2018"
      }
    , { categories = [ Animation, UI ]
      , description = "High quality animations are essential to an engaging UI, but at first glance Elm's restrictions on side effects and DOM apis makes this appear challenging. For example, when removing an item from a list how can we elegantly animate that item and its neighbours?\nIn this talk you'll learn how to create complex and performant animations, whilst keeping your animation code separate from your business logic."
      , event = Conf ElmConf2018
      , name = "Complex Animations Done Well"
      , speaker = "Sam Rowe"
      , url = "https://youtu.be/DBVHxkMBfF4"
      , year = "2018"
      }
    , { categories = [ Keynote, Concept, Technique, Iconic ]
      , description = ""
      , event = Conf ElmEurope2018
      , name = "Make Data Structures"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=x1FU3e0sT1I"
      , year = "2018"
      }
    , { categories = [ Keynote, Iconic, ElmPhilosophy, Technique ]
      , description = ""
      , event = Conf ElmEurope2017
      , name = "The life of a file"
      , speaker = "Evan Czaplicki"
      , url = "https://www.youtube.com/watch/XpDsk374LDE"
      , year = "2017"
      }
    , { categories = [ Guide, Technique, Testing ]
      , description = "In this talk, we’ll discuss how we manage to unblock ourselves whenever we encounter an edge in Elm at NoRedInk. I’ll discuss many of the experiments that I have done, and how best to go about being a productive member of a Elm workforce to enable others to use it. I’ll also explain how our custom testing tooling works, and how you can do it too. I’ll also briefly go over some potential problems you might face, and how to avoid them."
      , event = Conf ElmEurope2017
      , name = "How to unblock yourself with elm"
      , speaker = "Noah Hall"
      , url = "https://www.youtube.com/watch?v=OgH3pPXXSkY"
      , year = "2017"
      }
    , { categories = [ Hobby, Project ]
      , description = "On Elm’s website Prezi is featured for using Elm. However, as of December 2016, Prezi presentations are still based on Flash. So in this talk I introduce Dive, a programming framework written in Elm for building visual and animated presentations like Prezi’s. After explaining the API, I describe the internals of the framework and compare two rendering approaches, Canvas vs. SVG. Along the way, I also demonstrate why it was easy to create Dive with Elm, since the core of the framework took me just a couple of hours. And of course, the presentation slides of this talk are built with Dive itself."
      , event = Conf ElmEurope2017
      , name = "Dive: building Prezi-like presentations with elm"
      , speaker = "Matthias Rella"
      , url = "https://www.youtube.com/watch?v=TRATeS93bsA"
      , year = "2017"
      }
    , { categories = [ ElmPhilosophy ]
      , description = "What would Chanel say if inquired about the design choices of Elm? How do packages resemble wardrobes? What makes a good outfit and why is it relevant for you? The questions are many and seemingly nonsensical, but from the right perspective, the fashion and software industry are more alike than most would think. In this talk, we’ll examine these parallels in order to explore the nature of design."
      , event = Conf ElmConf2017
      , name = "If Coco Chanel Reviewed Elm"
      , speaker = "Tereza Sokol"
      , url = "https://www.youtube.com/watch?v=Wiw3YcwGwrU"
      , year = "2017"
      }
    , { categories = [ Guide, Acesssibility ]
      , description = "Learn about accessibility, the elm-html-a11y library, and delve into patterns enforcing good development habits.\nElm’s core library makes writing HTML a lovely experience, but making that HTML accessible can still be hard. The WAI-ARIA spec provides many modes of communication and interaction for users–but these largely attribute-based avenues are easy to ignore. Adding type-safety, an exhaustive set of attributes and tags, and friendly function names, elm-html-a11y makes writing accessible HTML nicer."
      , event = Conf ElmConf2017
      , name = "Accessibility with Elm"
      , speaker = "Tessa Kelly"
      , url = "https://www.youtube.com/watch?v=G_TNRuoF3FE"
      , year = "2017"
      }
    , { categories = [ Introduction, Learn ]
      , description = ""
      , event = EventUnknown ""
      , name = "Elm Tutorial - Why use Elm?"
      , speaker = "Grace Hopper"
      , url = "https://youtu.be/um0jxfgboNo"
      , year = "2017"
      }
    , { categories = [ Project, Games ]
      , description = "Mogee is a side-scroller that I created with my wife Nadya in three days for the #lowrezjam 2016. Since then we’ve been working on this game on our free time: added a music theme and improved the visuals.\nYou will learn how to evolve a simple time-travelling Mario example into a full fledged game. Even though Elm makes it easy and joyful, there are a few challenges to overcome:\ngrowing complexity of the code;\ninteractions between different game objects in the game loop;\nrendering animated objects with WebGL.\nIn the end you will witness yet another milestone of our game, and it’s going to be remarkable!"
      , event = Conf ElmConf2017
      , name = "Mogee or how we fit Elm in a 64×64 grid"
      , speaker = "Andrey Kuzmin"
      , url = "https://www.youtube.com/watch?v=NRXTMaXO15I"
      , year = "2017"
      }
    , { categories = [ Project, Maps ]
      , description = "Web applications often need interactive UI elements, e.g. slippy maps. Currently one has to interface with existing JS libraries with some trickery to have a map in an Elm app.\nIn this talk we will explore a different approach: a slippy map library written in pure Elm. You will hear about the initial motivation, see how it is implemented, learn about API decisions and get to know how to use, customize and extend a slippy map.\nThis will not only give you an additional UI widget in your Elm tool belt, but will hopefully teach you about how to build and use stateful UI elements in Elm in general."
      , event = Conf ElmConf2017
      , name = "Building a Slippy Map Library in Pure Elm"
      , speaker = "Jonas Coch"
      , url = "https://www.youtube.com/watch?v=kWIiXbn1FXU"
      , year = "2017"
      }
    , { categories = [ Project, Hobby ]
      , description = "We all already know that Elm is a great language for building reliable web apps, but it turns out it’s also great for prototyping Domain Specific Languages. Recently I’ve combined two of my hobbies by using Elm to begin creating a reusable data format for cooking recipes.\nAll recipes can be broken down into a number of raw ingredients which, when combined with various techniques, form a dish. In this talk I will explain why Elm’s straightforward yet robust type system is a perfect use case for modeling out these recipes. Thanks to Elm’s knack for taking a data model and translating it into HTML, it’s easy to generate a human-readable version of any one recipe.\nBut wait, there’s more! Elm’s decoder system makes it super easy to translate Elm models to and from JSON, allowing us to import and export them.\nFinally, I’ll show a few examples leveraging this framework to generate both pretty, human-readable recipes and interesting visualizations of them!"
      , event = Conf ElmEurope2017
      , name = "Cooking with elm"
      , speaker = "Noah Zachary Gordon"
      , url = "https://www.youtube.com/watch?v=C3mnyJlCqMk"
      , year = "2017"
      }
    , { categories = [ Guide ]
      , description = "While powerful in its simplicity and important to computation, the boolean can be extremely limiting in Elm applications. In this talk, we will briefly explore the history of boolean logic in computation and look at how booleans can become misused in Elm. We will look at examples where booleans obscure the meaning of code, make code harder to maintain, and hinder usability for our teammates and users. You will learn how to harness union types to write cleaner, clearer code. More importantly, you will learn how to place usability at the forefront of the APIs and UIs you build."
      , event = Conf ElmConf2017
      , name = "Solving the Boolean Identity Crisis"
      , speaker = "Jeremy Fairbank"
      , url = "https://www.youtube.com/watch?v=6TDKHGtAxeg"
      , year = "2017"
      }
    , { categories = [ DatesTime, Learn ]
      , description = "Manipulating Dates can quickly become a problem, even for simple things like getting the current Date, obtaining the start of the week (especially with different date systems). How can we manage these problems with Elm, keeping our sanity in check.\nThis talk will try to give an overview of the standard pitfall that can occurs when dealing with dates and how to overcome them with the Elm ecosystem."
      , event = Conf ElmEurope2017
      , name = "Date manipulation with elm"
      , speaker = "Vincent Billey"
      , url = "https://www.youtube.com/watch?v=ztqEIchSDgM"
      , year = "2017"
      }
    , { categories = [ Keynote ]
      , description = ""
      , event = Conf ElmConf2017
      , name = "Teaching Elm to Beginners"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=G-GhUxeYc1U"
      , year = "2017"
      }
    , { categories = [ Introduction ]
      , description = "In times where a jungle of JavaScript frameworks wants to solve every conceivable problem in web app development, creating headaches and javascript fatigue in the process, Elm offers a different approach.\n\nIn this talk you'll see how Elm works and learn how to use it to build a web app. I will emphasize the advantages and disadvantages it brings compared to the traditional JavaScript tech stack used at my most recent project.\nThis talk is not aimed at experienced functional programmers coming from languages such as Haskell, but rather JavaScript developers seeking a more functional approach in their daily work. It serves both as a introduction to Elm and typed, ML-style functional programming."
      , event = EventUnknown "NDC Oslo 2017"
      , name = "Beyond JavaScript Frameworks: Writing Reliable Web Apps With Elm"
      , speaker = "Erik Wendel"
      , url = "https://youtu.be/sHWexPRFuUw"
      , year = "2017"
      }
    , { categories = [ Learn ]
      , description = "Choosing the right technologies when starting a project is super important. It’s almost impossible to change the stack later on. Betting on Elm is therefore a bit risky. Right?\nNot anymore! Now we can use frontend microservices to pick the right tool for every job!\nTraditionally, single page apps are monoliths. Here’s a React app, that’s an Angular app and this one is in Vue.js. This way, early stack choices turn into a strong tie-in as the project grows. It’s pretty tricky to introduce Elm to a mature project running on a different technology.\nIn this talk, we’ll see how web components change the game. Finally, we can use the right tool for every job! We can introduce Elm bit by bit to any JavaScript app – or neatly embed JavaScript UI nuggets in an Elm app.\nWe’ll learn from the ups and downs of regular microservices, catch a glimpse of the culture that this approach has brought about at Kalo and leave with a strong toolset to make things happen."
      , event = Conf ElmEurope2017
      , name = "How frontend microservices help us stay flexible"
      , speaker = "Tomek Wiszniewski"
      , url = "https://www.youtube.com/watch?v=U_5XKPe4fZM"
      , year = "2017"
      }
    , { categories = [ Visualisation, Graphs, Charts ]
      , description = "Brief overview of the available technologies for visualizing data. We’ll dive deep into elm-visualization and show how we can use its features to create rich and interactive data visualization apps."
      , event = Conf ElmEurope2017
      , name = "Visualizing data with elm"
      , speaker = "Jakub Hampl"
      , url = "https://www.youtube.com/watch?v=Pf1xQ76JgmQ"
      , year = "2017"
      }
    , { categories = [ Project, Hobby ]
      , description = "This talk is about music but is not restricted to musicians!\nWhen playing an instrument in a jam session, musicians sometimes need to see the chords of the tune they are playing. A chords chart is a convenient way to represent a music tune as a table, containing chord names in “Jazz notation”, but not music notes. Chords charts are scattered on forums, are static images most of the time, and there are many versions of which some are wrong.\nThese drawbacks led me to start the Open Chords Charts project. The backend is a centralized and collaborative database of chords charts. The frontend, written in Elm, allows to browse charts, add/edit them, fork other users charts, fix errors and make links between charts. I’ll show some features such as changing the key in which the song is displayed – a killer feature for musicians who dislike to do the transformation in their head. The frontend is responsive and offline-first, so that musicians can build a set-list and follow the songs on their"
      , event = Conf ElmEurope2017
      , name = "Music chords charts in elm"
      , speaker = "Christophe Benz"
      , url = "https://www.youtube.com/watch?v=c3BFNqk9jF0"
      , year = "2017"
      }
    , { categories = [ Community ]
      , description = "The State of Elm 2017 Survey is over and the results have been collected. Let’s look at them together! Where are new people in the community coming from? Where are they going? What’s great about Elm, and what could use improvement? In this talk, we’ll discuss these questions and what they mean for the Elm community at large."
      , event = Conf ElmEurope2017
      , name = "The State of Elm 2017"
      , speaker = "Brian Hicks"
      , url = "https://www.youtube.com/watch?v=BAtql6ZbvpU"
      , year = "2017"
      }
    , { categories = [ Animation, UI ]
      , description = "Have you wanted to add interface features to your Elm app like accordions, expandable help boxes and permanent and temporary notifications (AKA “alerts” or “flash” messages) but haven’t found a useful or general-purpose Elm library? Fret not, you can roll your own or adopt the modules from this talk!\nAt this talk you will learn how the development team for an Elm SPA used CSS styles and transitions in cooperation with Elm’s Html.Keyed and Html.Events modules to make it happen."
      , event = Conf ElmConf2017
      , name = "Activate Your Interface with CSS Animations"
      , speaker = "Peter Zingg"
      , url = "https://www.youtube.com/watch?v=Zje8MN9whF0"
      , year = "2017"
      }
    , { categories = [ UI ]
      , description = "thoughtbot has launched the first ever production Elm Native UI app! In this talk, I’ll discuss my journey building the app and contributing back to Elm Native UI, the benefits of using Elm Native UI over other technologies, and the existing hurdles. I’ll also compare using the library to Swift/Cocoa Touch and React Native. Hopefully, the talk will inspire others to start playing with Elm on mobile."
      , event = Conf ElmEurope2017
      , name = "Elm native UI in production"
      , speaker = "Josh Steiner"
      , url = "https://www.youtube.com/watch?v=Dr3kQB8byEo"
      , year = "2017"
      }
    , { categories = [ Games, Project ]
      , description = "About a year ago, I used Elm to make a simple multiplayer word game called Lettero. It worked alright, but more importantly, it left me wondering: is Elm awesome enough to allow me to abstract the game into a framework so we can churn out other multiplayer games in a matter of hours?\nIn this talk, I’ll present the way the original game was refactored to split out its wordgame-specific parts from its core framework, discovering ever more flexibility within Elm’s typed functional rigor. I will also walk through the way game state is reconciled by one of the clients designated as host, allowing the app to run on generic realtime backends such as Google Firebase, without any custom server-side code."
      , event = Conf ElmEurope2017
      , name = "Multiplayer games by the boatloads. Making elm-gameroom"
      , speaker = "Peter Szerzo"
      , url = "https://www.youtube.com/watch?v=sBCz6atTRZk"
      , year = "2017"
      }
    , { categories = [ UI ]
      , description = "There are many products today that need drag and drop. Variants of drag and drop include: dragging and dropping between buckets, reordering in 1D, and reordering in 2D. We’ll focus on reordering along one axis.\nQuestions with reordering include:\nDoes the user need a styled preview of the drop zone? Should the dropping action animate the placeholder into its drop destination? Do the reorderable items resize dynamically? Does the placeholder resize while dragging? Can the reorderable axis change between x and y while dragging?\nCan we account for all or most of the above with a clean API?\nI will answer the above questions with small examples, build audience knowledge, and then demo a very complex reorderable feature!"
      , event = Conf ElmEurope2017
      , name = "Building Reorderable UI in Elm"
      , speaker = "Greg Ziegan"
      , url = "https://www.youtube.com/watch?v=UiLGIQUGFQg"
      , year = "2017"
      }
    , { categories = [ Visualisation, Graphs, Charts ]
      , description = "I began using Elm in the spring of 2016 and pushed my first commit to Elm-plot in June. Being new to functional programming, I was fighting the old habits of my component-based mindset, which over time resulted in several complete rewrites of the library and many aha!-moments. In this talk, I will tell the story of Elm-plot, including the issues resolved, the compromises made and the challenges yet to be overcome."
      , event = Conf ElmEurope2017
      , name = "Elm-plot : the big picture"
      , speaker = "Tereza Sokol"
      , url = "https://www.youtube.com/watch?v=qTdXFRloYWU"
      , year = "2017"
      }
    , { categories = [ PanelDiscussion ]
      , description = ""
      , event = Conf ElmConf2017
      , name = "elm-conf 2017 Closing Q&A"
      , speaker = "All Speakers"
      , url = "https://www.youtube.com/watch?v=iCvvSqCnvWY"
      , year = "2017"
      }
    , { categories = [ Project, Hobby ]
      , description = "Four months ago at ElmConf2016, I debuted my interactive story-telling framework, the Elm Narrative Engine. I spoke of the challenges of building a framework, and how it took full control away from the client code after being initialized.\nSince then, after using the framework more, getting feedback from both developers and story writers, and an api-design session with Evan, I have completely inverted the framework, allowing for some really cool things.\nThe framework still works like a “run-time,” but now it is embedded in a “component” inside of the client’s app, and control flows between the two every update cycle. A framework as a component? Yes, it works, and surprisingly, it is much more versatile and makes for great separation of concerns.\nThis talk will look at the conceptual differences and implications, touch on some of the big-ticket technical refactors necessary to make the switch, and explore some fun and interesting demos that would not have been possible before."
      , event = Conf ElmEurope2017
      , name = "Turning the elm narrative engine inside-out"
      , speaker = "Jeff Schomay"
      , url = "https://www.youtube.com/watch?v=4H7iH_kymig"
      , year = "2017"
      }
    , { categories = [ Commercial ]
      , description = "In Gizra, we run an unusual stack that helps us reach blazing fast websites - Drupal runs our backends, Elm in the front, and most recently Yesod (a Haskell framework).\nThere’s a certain mindset in choosing these technologies - it’s about the idea of “correctness”; making sure we can move quickly without breaking stuff.\nIn this session, I’ll explain in depth about this mindset both from the development perspective, and the business one."
      , event = Conf ElmEurope2017
      , name = "Elm from a business perspective"
      , speaker = "Amitai Burstein"
      , url = "https://www.youtube.com/watch?v=DvQI1KntMhk"
      , year = "2017"
      }
    , { categories = [ Introduction ]
      , description = "Based in Melbourne, Australia, the team at Culture Amp has built the world's most powerful people analytics platform—a web application used by the world's most innovative companies to measure and drive improvements to their company culture, employee engagement and individual effectiveness.\nCulture Amp's product team values developer happiness, and therefore chooses Ruby and Elixir on the back end. On the front end there hasn’t been much choice but to use JavaScript, but Elm changes all that. In this talk, Kevin Yank provides an introduction to Elm—“a delightful language for reliable web apps”—and explores why Elm’s loveable compiler and radical simplicity have made it Culture Amp’s choice for developer happiness on the front end."
      , event = EventUnknown ""
      , name = "Developer Happiness on the Front End with Elm"
      , speaker = "Kevin Yank"
      , url = "https://youtu.be/kuOCx0QeQ5c"
      , year = "2017"
      }
    , { categories = [ Project ]
      , description = "I wanted it to be easier for folks to try the Elm platform and share it with each other, so I made Ellie and put it in the browser! Since its release in January of this year people have shared about 5000 revisions, but this is only the beginning. I want you all to share in my appreciation for this community and my desire for it to grow, so in this talk I’m going to share the life story of Ellie. You’ll feel like you were there on the day Ellie was first released, take an adventure through some of its inner workings, and learn exactly where Ellie is headed and what we can do together to bring more tools like it to the community."
      , event = Conf ElmConf2017
      , name = "Putting the Elm Platform in the Browser"
      , speaker = "Luke Westby"
      , url = "https://www.youtube.com/watch?v=gNWx-zWxUd4"
      , year = "2017"
      }
    , { categories = [ Project, Hobby ]
      , description = "Presentations are one-sided by design. Someone talks, people listen, a lucky confident few might pipe up to ask questions at the end. Speakers struggle to read the audience without disrupting to ask questions, and the audience has no way to give feedback without disrupting the speaker.\nPresentations are slow, single-threaded and syncronous affairs!\nWhat if we could improve these problems with Elm?\nThis talk will involve the audience in a live experiment in having realtime engagement using Elm. We’ll engage in dialogue concurrently, we’ll have instant relevant and screen-visible feedback.\nAside from a scene-setting introduction, the audience will democratically determine, in realtime, both the order and selection of talking points, allowing the presentation to mould itself to be the most relevant it can be for this particular audience and point in time.\nWe’ll use Elm, to talk about using Elm, to talk about Elm. It will be Elm all the way down!"
      , event = Conf ElmEurope2017
      , name = "Elmception: supercharging presentations with elm"
      , speaker = "Mario Rogic"
      , url = "https://www.youtube.com/watch?v=EyBtz8xZz7U"
      , year = "2017"
      }
    , { categories = [ Learn ]
      , description = "The larger an Elm application grows, the more likely it is that interaction with unsupported Web Platform APIs, or interaction with 3rd party Javascript libraries will be necessary. Elm offers a feature called “ports” for passing information back and forth between Elm and JS safely.\nBut ports are often misunderstood and underutilized. Ports are asynchronous communicators, and the tendency is to think of them as another form of AJAX request. But thinking of them in that way leads to an incorrect understanding of their power. A correct mental model for ports, and an understanding of the power available they offer when paired with semantic data will be presented in this talk. Hopefully, by the end everyone will have a smile on their face and new superpowers in their brain."
      , event = Conf ElmConf2017
      , name = "The Importance of Ports"
      , speaker = "Murphy Randle"
      , url = "https://www.youtube.com/watch?v=P3pL85n9_5s"
      , year = "2017"
      }
    , { categories = [ Learn, Testing ]
      , description = "In Elm world we have both unit tests and fuzz (property based) tests - this is great! But both of these often focus mainly on the small helper functions that create your app (and single Msgs at best). But there’s a whole lot of untested long-term scenarios the user could get into using multiple Msgs.\nIn this talk I’ll tackle this idea: testing your app more thoroughly using sequences of Msgs and finding unexpected “loopholes” in your system, using techniques first envisioned by Quviq’s QuickCheck."
      , event = Conf ElmEurope2017
      , name = "Testing your Msgs fully"
      , speaker = "Martin Janiczek"
      , url = "https://www.youtube.com/watch?v=baRcusTHc8E"
      , year = "2017"
      }
    , { categories = [ Graphics, WebGL ]
      , description = "Graphics programming is hard. That’s definitely the case when you try to use WebGL in plain JavaScript. Elm can make graphics programming on the web easy and robust in the same way as it made building UI’s easy.\nThe WebGL library got a new home in the Elm Community organization. Version 2.0 came with lots of new features and improvements to the API. It’s now much more friendly for newcomers.\nI’ll show you cool graphics demos as well as explain some of the basics. My hope is that you leave feeling inspired to start some of your own WebGL projects using our new library."
      , event = Conf ElmEurope2017
      , name = "Bringing the fun to graphics programming"
      , speaker = "Andrey Kuzmin"
      , url = "https://www.youtube.com/watch?v=Z-6ETEBNlMs"
      , year = "2017"
      }
    , { categories = [ Learn ]
      , description = "Most applications, in any language, requires the use of collections. Elm has several collection types built-in: Lists, Arrays, Sets and Dicts. When is it better to use a List instead of an Array, and when do you use Sets? In this talk, Robin explains how the different collections are implemented under the hood, with the hope that this knowledge will make it painfully obvious when to use the different collection types."
      , event = Conf ElmEurope2017
      , name = "Persistent collections: how they work and when to use them"
      , speaker = "Robin H Hansen"
      , url = "https://www.youtube.com/watch?v=mmiNobpx7eI"
      , year = "2017"
      }
    , { categories = [ UI ]
      , description = "What could the future of styling look like with elm?\nWriting CSS is still one of the biggest challenges for front end development. CSS can be written that’s valid, but produces unexpected and hard-to-debug results.\nBut it doesn’t have to be that way.\nWe can take all the mental discipline that good, organized, well behaved CSS requires and make the compiler responsible for it, instead!\nBy describing our styles in elm, we can be nuanced about what CSS we allow to be written. Surprisingly, completely disallowing some CSS properties can make our styles much more predictable with no practical loss in functionality.\nWe can use elm to limit access to the brittle parts of CSS, and make it easier to write the best parts (like flex-box, animations, and media queries). We can make best-practices the compiler’s job.\nLet’s make style and layout as refactorable, productive, and typesafe as elm itself."
      , event = Conf ElmEurope2017
      , name = "Understanding style"
      , speaker = "Matthew Griffith"
      , url = "https://www.youtube.com/watch?v=NYb2GDWMIm0"
      , year = "2017"
      }
    , { categories = [ Commercial, ExperienceReport ]
      , description = "In this talk i will talk about Year and a half building a software with 80% Elm based code and a team commited to ELm. From the experimentation to the production going through Elm communities and recruitement, i will share experience about how we ended with a almost full Elm stack from client to server and compares to the rise of scala and play i was involved in."
      , event = Conf ElmEurope2017
      , name = "Elm from a CTO perspective"
      , speaker = "Sébastien Crème"
      , url = "https://www.youtube.com/watch?v=8KWVl0D00SM"
      , year = "2017"
      }
    , { categories = [ Keynote, Guide, Iconic, Technique ]
      , description = ""
      , event = Conf ElmEurope2017
      , name = "Scaling Elm Apps"
      , speaker = "Richard Feldman"
      , url = "https://www.youtube.com/watch?v=DoA4Txr4GUs"
      , year = "2017"
      }
    , { categories = [ Guide, Interop ]
      , description = "While Elm pretty much solves the tool and framework fatigue when starting a new front-end project, we still have the same issue for the back-end. Using Horizon in your Elm app can help alleviate the pain by reducing the amount of work you have to do in the back-end, so you can write more Elm code.\nWhen starting a new project in JavaScript, you’re most likely going to spend a lot of time choosing the tools and frameworks to use, and then spend more time configuring them. Elm pretty much solves this problem by providing all the tooling you need out of the box, and by The Elm Community’s preference to have one way to do things, so you don’t have choose between 100 different packages just to solve 1 problem.\nBut, how about the back-end? You still have to choose all the stacks; from database, web server, programming language, and the framework. At least, until we have server side Elm, we still have the same problem here.\nWouldn’t it be great if you don’t have to worry about the back-end, and can just focus on writing Elm code and be happy? We can do that with Horizon. Horizon is an open source server designed for building real time application without writing any back-end code. With Horizon, all you need to do is to run the Horizon server, start writing Elm code, and be happy and productive."
      , event = Conf ElmConf2016
      , name = "0-60 in 15 Minutes: Building a Realtime App With Elm and Horizon"
      , speaker = "Abadi Kurniawan"
      , url = "https://youtu.be/fTHHn7NhU3w"
      , year = "2016"
      }
    , { categories = [ Guide ]
      , description = "Have you come into grips with Elm as a language and prolific enough to start using it in a real project? Awesome! Did you already have an idea of how you would structure your application, handle authentication and maybe show toast-like pop up messages in the UI? If not, this talk is for you.\nMany people know how to create small apps for fun in Elm. Some have crafted larger things but felt they were missing something. Having done two larger customer projects in Elm, I have some solid experience under my belt about building big applications for production. In both projects, the initial folder structure and the initial module architecture became untenable in a few months. This talk is a down-to-earth lessons learned aimed for everyone who has done or is planning on doing production applications using the language. I will introduce strategies to overcome some of the common problems we have as frontend engineers, but also share some war stories of times when things didn’t quite go as planned."
      , event = Conf ElmConf2016
      , name = "Beyond Hello World and Todo Lists"
      , speaker = "Ossi Hanhinen"
      , url = "https://youtu.be/vpc80c5iC6k"
      , year = "2016"
      }
    , { categories = [ Keynote, Iconic, ElmPhilosophy ]
      , description = ""
      , event = Conf ElmConf2016
      , name = "Code is the easy part"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/DSjbTC-hvqQ"
      , year = "2016"
      }
    , { categories = [ Animation, UI ]
      , description = "Games and rich applications present a compelling use-case for Elm, but managing dynamic animations can quickly become complicated. Here’s how to succinctly express animation pipelines using the elm-style-animation library and how to architect your animation code in a readable, extensible manner.\nIn this talk we’ll cover…\nWhat options are available for animation in Elm and when it makes sense to use them.\nHow to tackle real-world animation using the elm-style-animation library.\nA straightforward way to organize animations so that they are readable, extensible, and easily integrated into the Elm architecture.\nIf you’re here, you probably already know that Elm is a solid base for building complex applications. You’ll come away from this talk with the tools to make those applications gorgeous as well."
      , event = Conf ElmConf2016
      , name = "Rich Animation"
      , speaker = "Matthew Griffith"
      , url = "https://youtu.be/DsDwYqsLU3E"
      , year = "2016"
      }
    , { categories = [ PanelDiscussion ]
      , description = ""
      , event = Conf ElmConf2016
      , name = "elm-conf 2016 speaker Q&A"
      , speaker = "All Speakers"
      , url = "https://youtu.be/LCNs92YQjhw"
      , year = "2016"
      }
    , { categories = [ Introduction ]
      , description = "Watch this talk to explore Elm, the programming language that brings an entirely new approach to front-end development. You will study the language but, more importantly, the characteristics that make it such a great language to build reliable, robust client-side applications and how we can take these properties and apply them to JavaScript applications."
      , event = EventUnknown "Full Stack Fest 2016"
      , name = "Why Elm?"
      , speaker = "Jack Franklin"
      , url = "https://youtu.be/rU-W6557Dos"
      , year = "2016"
      }
    , { categories = [ ExperienceReport ]
      , description = "I have ADHD and struggle to stay focused on things. This has actually been helpful in learning JS since things change as quickly as my attention does, but it makes it hard to finish things. Elm pushes out distractions so I can focus, and at last the first side-project I’ve ever completed is in Elm!\nI’ve lived with ADHD my whole life. There are certainly worse things to live with, but our world is tailored to people who can concentrate – tasks and deadlines drive our working society. I’ve spent most of my illustrious career working with JS, where things change just as quickly as my attention, and it’s been hard to feel a sense of grounding or belonging. Then I found Elm. Even though Elm wasn’t designed for people with ADHD explicitly, it is the best language for those who do to build applications. With Elm, the distractions fall away and I am able to channel more of the craziness that I experience in my head into useful work. In this talk I will share my experiences as such a person with all of you. I hope you’ll come away understanding that using Elm isn’t just good for applications, it’s good for people. If we can keep the developer’s personal experiences in mind when building tools and libraries we will have a more inclusive and accessible community!"
      , event = Conf ElmConf2016
      , name = "Compilers as Therapists, or Why Elm is Good for ADHD"
      , speaker = "Luke Westby"
      , url = "https://youtu.be/wpYFTG-uViE"
      , year = "2016"
      }
    , { categories = [ Learn ]
      , description = "Elegant data structures are different across programming languages, and creating them should be approached differently. Leverage Elm’s union types to build simple and readable structures, beginning with binary trees.\nWriting a binary tree might be a familiar task in JavaScript or Ruby, and it might seem like a very similar problem in Elm. While it’s possible to create data structures in Elm that are very similar to ones written in languages that aren’t strictly functional and that don’t have types, there are better approaches. This talk will explore a few different implementations and recommendations, and assumes an audience without extensive academic ML-family language experience."
      , event = Conf ElmConf2016
      , name = "Functional Data Structures"
      , speaker = "Tessa Kelly"
      , url = "https://youtu.be/UBuFHCsz16A"
      , year = "2016"
      }
    , { categories = [ ElmPhilosophy, Iconic, Technique ]
      , description = "Among the most time-consuming bugs to track down are the ones where we look at our application state and say “this shouldn’t be possible.”\nWe can use Elm’s compiler to rule out many of these bugs in the first place—but only if we design our Models using the right techniques! This talk explores how.\nWhen I first started using Elm, I wrote my Models roughly the same way I would have in JavaScript. I was happy that I no longer got type mismatches, but I still often found myself debugging how I’d gotten into an application state that I’d thought was impossible. Over time I learned I could rule out many of these bugs with more careful Model design, and my applications got more reliable as a result.\nThis talk will explore the techniques I’ve learned to do exactly that. We’ll look at how to use union types for more fine-grained control than records, how to rule out the possibility of collections being unexpectedly empty, and how exposing the right things within modules can preserve these guarantees across a large code base.\nCome see how we can use Elm’s compiler to take undesirable application states from “ought to be impossible” to “actually impossible!”"
      , event = Conf ElmConf2016
      , name = "Making Impossible States Impossible"
      , speaker = "Richard Feldman"
      , url = "https://youtu.be/IcgmSRJHu_8"
      , year = "2016"
      }
    , { categories = [ Learn ]
      , description = "Dive into Elm’s random generators on a quest to build a historically accurate Roman random name generator for the goddess Juno, based on a series of dependent and independent constraints.\nYou are an ancient software engineer. Juno, the Roman goddess of marriage and fertility, surprises you by walking into your office and offering you an assignment. Overseeing the birth and naming of all Roman children is becoming a large and monotonous task. She is looking to modernize and automate. Will you build her a piece of software to randomly generate valid information for a Roman child?\nJoin us on the quest to complete this project using Elm’s random generators. Along the way, we will see how to create complex generators out of simple ones, how to handle dependent and independent constraints, and how to work with percentages and Maybe. You will leave with a firm grasp of how Elm handles randomness in a functional manner and the confidence to implement your own generators."
      , event = Conf ElmConf2016
      , name = "Rolling Random Romans"
      , speaker = "Joël Quenneville"
      , url = "https://youtu.be/YxGWQdFo2Yc"
      , year = "2016"
      }
    , { categories = [ Project ]
      , description = "The Elm Architecture works great for apps, but how about for building a game framework? This talk looks at using the strengths of Elm to build the open source “Elm Narrative Engine,” including an example interactive story and the challenges and solutions faced in using Elm to make a framework.\nAs a programmer by profession and passion, but with a background and schooling in film production and screenwriting, I have forever been drawn to playing and making games with strong narrative components.\nI have played, studied and written screenplays, classic text adventures, visual novels, point-and-click adventures, and other storytelling game mediums and tools, comparing and contrasting the different types of stories each affords.\nAs a self-described “Ambassador of Elm,” I decided to use the strengths of Elm to build a storytelling game framework called the “Elm Narrative Engine” for telling the types of interactive stories I want to tell based on all of my research in this area. The games it makes would be less about modeling spacial navigation and branching narratives over time, and more about modeling a story that unfolds like a puzzle, like a cross between a traditional novel and a point-and-click adventure. The design goals include a clean and simple way to author stories as a developer, and a simple interaction style for players, keeping the focus squarely on the text-based narrative.\nThis talk looks briefly at some of existing options in this area, such as Inform 7 for writing text adventures, RenPy for making visual novels, and Twine for “non-linear hypertext narratives,” comparing and contrasting their approaches to the Elm Narrative Engine.\nAfter a demo of a fully-featured story written on the Elm Narrative Engine, I will dive into the code and the technical considerations and challenges faced in approaching building the engine with Elm. I will give a lot of attention to the differences of building a framework in Elm, as opposed to an app or library and the challenges this brings, including these topics:\nHow The Elm Architecture applies to designing a framework\nTreating the engine as a “run time” and the client as an “embedded app”\nHow to make use of types to build a clean client “api”\nData structures and state-machines for narrative data and internationalization consideration\nUsing the “time traveling debugger” technique for “rewinding” narrative branches\nUsing Elm’s Commands for adding multi-media to a story\nBy the end of the talk, the audience should have a good appreciation for the technical and design decisions in interactive storytelling, and a concrete grasp on designing a framework in Elm and how to define the boundaries between client and framework code. As the engine is open source, I encourage pull requests, and my hope is that some of the members of the audience will create their own narrative stories on the Elm Narrative Engine for myself an the rest of the community to play!"
      , event = Conf ElmConf2016
      , name = "Building an Interactive Storytelling Framework in Elm"
      , speaker = "Jeff Schomay"
      , url = "https://youtu.be/t8RSxzpw1Yw"
      , year = "2016"
      }
    , { categories = [ Project ]
      , description = "I love the explicitness and structure of Elm. I don’t love typing.\nA mechanical friend can help with both: smart templates modify code to perform common tasks, and Github PRs keep this safe and editor-independent.\nSee an Elm project created and grown with strategically placed automation.\nI love the explicitness and the consistent structure of Elm code and the Elm Architecture. Sometimes I don’t love the typing involved.\nElm is well-suited to code generation. We like to generate code (like with html2elm) and modify it. The automation doesn’t have to end there!\nThis session will demonstrate growing an Elm app with the help of a smarter templating engine and Github pull requests. Tasks like “add a new component” or “start using elm-test” or “change a service contract” happen safely and mechanically, outside of your favorite editor.\nKeep all the structure, skip some of the tedium. See another reason that Elm can be our most productive language system yet."
      , event = Conf ElmConf2016
      , name = "The Clockwork Gardener: Growing an Elm App With Templates"
      , speaker = "Jessica Kerr"
      , url = "https://youtu.be/jJ4e6cIBgYM"
      , year = "2016"
      }
    , { categories = [ Project, Audio, Interop ]
      , description = "This talk combines the power of Elm and Elixir’s Phoenix to turn Twitter into a platform for live crowd-sourced music composition. We’ll cover Elm and Elixir channels, custom DSL parsing in Elm, and driving the Web Audio API through Elm’s native inter-op abstraction: ports.\nThis talk aims to demonstrate the power of coordinating:\nParser combinators, and Elm’s bogdanp/elm-combine library for transforming strings into data\nElm’s standard application architecture\nPorts (Elm’s abstraction for interacting with its host language, in this case, Javascript)\nThe Phoenix Web framework and its real-time channels\nElm’s integration with Phoenix channels\nTone.js for making music with the Web Audio API\nFor illustrative purposes we’ll suppose we are a consultancy, and a client has just approached us with the need to turn tweets into music. She has come up with a compact musical notation that will fit a good chunk of music into 140 characters, and she wants us to teach the browser to play the music encoded in that notation. But that’s not all. Her vision includes a client that streams in tweets, parsing them and queueing them up to be played as they happen, ultimately allowing users to listen to a never-ending piece of real-time music, composed by a symphony of twitter users world-wide."
      , event = Conf ElmConf2016
      , name = "Elm and Crowd-Source Music-Making"
      , speaker = "Murphy Randle"
      , url = "https://youtu.be/lPXVfqwYmEA"
      , year = "2016"
      }
    , { categories = [ ElmPhilosophy, Iconic ]
      , description = "Everyone knows that writing concurrent systems is difficult. The trouble is that nearly all programs are accidentally concurrent!\nSure, you do not use locks or semaphores. But are you are using the event loop in JavaScript? Are you mutating any local state? Do you use objects? Do you have dynamic event streams? This talk will reframe these extraordinarily common patterns as concurrent systems. This reframing is a shockingly powerful way of understand \"accidental complexity\" in your code base. It often reveals a truly insane concurrent system that no benevolent coder would knowingly design.\nThis talk will start by exploring \"message-passing concurrency\" as a foundation. This is very sane approach to concurrency as seen in Concurrent ML, Go, and Clojure. With this foundation, we will go through some seemingly simple examples and tease out the underlying concurrent system. The goal of this talk is for you to walk away being able to recognize concurrency and use this reframing to avoid \"accidental complexity\" as much as possible. Message-passing concurrency is also the foundation of interactivity in Elm as well, so we will also see how Elm guides you towards using concurrency appropriately in your front-end code without you even thinking about it.\nThese ideas should be applicable in nearly every code base you see, and this perspective should help you write better code whether you are writing JavaScript or Elm or anything else!"
      , event = EventUnknown ""
      , name = "Accidentally Concurrent"
      , speaker = "Evan Czaplicki"
      , url = "https://www.youtube.com/watch?v=DfLvDFxcAIA"
      , year = "2015"
      }
    , { categories = [ ElmPhilosophy, Iconic ]
      , description = ""
      , event = EventUnknown "Curry On Prague 2015"
      , name = "Let's be mainstream! User focused design in Elm"
      , speaker = "Evan Czaplicki"
      , url = "https://youtu.be/oYk8CKH7OhE"
      , year = "2015"
      }
    ]
