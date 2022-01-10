---
type: page
title: Elm tuples with more than three values
description: How do you have more than 3 values in a tuple in Elm?
published: true
status: seedling
---

People often run into the tuple size limit of 3 and wonder why Elm doesn't allow 4+, especially if you're coming from Haskell.

In Elm, we use a record instead.

### Comparison

Here are some before/after refactoring examples in moving from a Tuple with 3 fields (a Triple) to a record with 4 fields.

### Changing the type definition

```
type alias Coords = ( Int, Int, Int )
type alias Coords = { x: Int, y: Int, z: Int, q: Int )
```

The main change is we now explicitly label the values.

#### Creating a value

Creating a value is not much different:

```
myCoord = ( x, y, z )
myCoord = Coords x y z q
```

Instead of `( .. , .. , ..)` we use `AliasName .. .. .. ..`.


#### De-structuring a value

Using Record de-structuring is almost the same as Tuple de-structuring:

```
someFn ( x, y, z ) = ...
someFn { x, y, z, q } = ...
```

The main difference is now `x/y/z/q` must be used (as they are the specified names).

```
let
  ( x1, y1, z1 ) = ...
  ( x2, y2, z2 ) = ...
  newCoords = (x1 + x2, y1 + y2, z1 + z2)

let
  c1 = ...                                                         -- -12 chars
  c2 = ...                                                         -- -12 chars
  newCoords = (c1.x + c2.x, c1.y + c2.y, c1.z + c2.z, c1.q + c1.q) -- +25 chars
```

Note that overall the record version ends up with 1 char more than the tuple version... but we added another field!
