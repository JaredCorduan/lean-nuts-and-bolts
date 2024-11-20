import Lake
open Lake DSL

require "leanprover-community" / "batteries" @ git "main"

package "lean-nuts-and-bolts" where
  -- add package configuration options here

lean_lib «LeanNutsAndBolts» where
  -- add library configuration options here

@[default_target]
lean_exe "lean-nuts-and-bolts" where
  root := `Main
