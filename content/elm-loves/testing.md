---
type: page
title: "Elm ❤️ Testing"
description: Discover Testing in Elm
---

### Elm Delight

# elm-test

## What you need to know

`elm-test` is an Elm package with an accompanying NPM tool to run Elm modules with unit tests in them.

```elm
myFirstTest : Test
    test "" <| \_ ->
        String.toUpper "i expect this string to be in uppercase"
            |> Expect.equal "I EXPECT THIS STRING TO BE IN UPPERCASE"
```

```
elm-test

TEST RUN PASSED

Duration: 116 ms
Passed:   1
Failed:   0
```

The [right pipe operator, `|>`](TODO), is mirrored in the output format when there is a failure.

```elm
validatePhoneNumber : Test
validatePhoneNumber =
    test "normalize phone number" <|
        \_ ->
            normalizePhoneNumber "(123)  456  7890"
                |> Expect.equal "123-456-7890"
```

```shell
✗ normalize phone number

    "TODO - implement this function"
    ╷
    │ Expect.equal
    ╵
    "123-456-7890"

```

## What's unique about testing in Elm

With [The Elm Architecture](TODO), you don't directly get values like the current time, HTTP responses, and other data that can behave differently any time it is run.
Instead, you send a `Cmd` to let Elm know what you need, and that data comes back through the `update` function.

That means that you don't need to worry about your test suite breaking on the first of the month any more! Whatever your test results are in an `elm-test` suite will be the same,
whatever the time or place it's run. The same code will always give you the same test results.

Many other languages and frameworks use [dependency injection](TODO) to avoid this problem, but when testing in Elm, you don't have to worry about it because its built in to the language design!

### Built-In Property-Based Test API

Property-Based Testing, also known as Fuzz Testing, helps you find bugs around edge cases you didn't anticipate.
It uses random generators that you define to generate test input values. Then you make assertions as you would in a regular `elm-test` test case.
The difference is, you don't know the exact input you will be testing, so you need to check _properties_ rather than specific expected values.

A common example is reversible tests.

## Landscape of tools

- `elm-program-test`

## Getting started

Install the Elm package [`elm-explorations/test`](https://package.elm-lang.org/packages/elm-explorations/test/latest/)

```shell
elm install elm-explorations/test
```

Install the NPM package `elm-test`

```shell
npm install --save-dev elm-test
```
