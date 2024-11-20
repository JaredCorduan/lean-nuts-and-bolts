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

# Step 1 - Add a Dependency (batteries)

This step will add the 
[batteries](https://github.com/leanprover-community/batteries) library to our package.

First notice that (as of the time of this writing) the batteries library is
using Lean version `leanprover/lean4:v4.14.0-rc1`.
This can been seen by viewing the `lean-toolchain` file in the batteries repository.

Use `elan`, to see which versions of Lean are available locally:

```shell
elan show
```

Use `elan`, to install any needed versions:

```shell
elan toolchain install leanprover/lean4:v4.14.0-rc1
```

It is okay if, for example, `leanprover/lean4:v4.14.0-rc1` is not listed as the default.
Set the default version of lean for this package by editing `lean-toolchain` to contain:

```
leanprover/lean4:v4.14.0-rc1
```

The command `elan show` will now list `leanprover/lean4:v4.14.0-rc1` as active.

Build and execute this new package with lake to make sure everything still works:

```shell
lake exec lean-nuts-and-bolts
```

Add a dependency to the batteries library to this package by editing `lakefile.lean` to contain the line:

```
require "leanprover-community" / "batteries" @ git "main"
```

Building again will prompt you to update:

```shell
$ lake build
error: missing manifest; use `lake update` to generate one
```

Running `lake update` will generate the file `lake-manifest.json`, and the package will build correctly again.

Now create a `HashMap` from the batteries library.

Edit `LeanNutsAndBolts/Basic.lean` so that it contains:

```
import Batteries

def aa : Batteries.HashMap String String :=
  let e := Batteries.HashMap.empty
  e.insert "battery" "powered!"
```

Edit `Main.lean` so that it contains:

```
import LeanNutsAndBolts

def main : IO Unit :=
  IO.println s!"Hello, {aa.toList}!"
```

Build and execute to see the results:

```shell
lake exec lean-nuts-and-bolts
```
