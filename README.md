# :nut_and_bolt: Lean Nuts & Bolts :nut_and_bolt:

This repository demonstrates how to build a Lean package and perform
various tasks that are secondary to learning Lean the language.
Such as importing other packages and debugging.
It is intended that each commit demonstrates a single feature,
and will be explained as a single step in this readme.

# Step 0 - New project

Create a new Lean package using `lake`:

```shell
lake new lean-nuts-and-bolts
```

The `new` command creates a directory named `lean-nuts-and-bolts`
and creates several files within the directory.
Alternatively, use the `init` command if the directory already exists.

Build and execute this new package with lake:

```shell
lake build
lake exec lean-nuts-and-bolts
```

Note that the target name `lean-nuts-and-bolts` can be discovered by
inspecting the file `lakefile.lean`, under the `lean_exe`.

The lakefile also specifies that the repository includes a Lean library
named `LeanNutsAndBolts`.
