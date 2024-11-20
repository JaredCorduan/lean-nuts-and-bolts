import Batteries

def aa : Batteries.HashMap String String :=
  let e := Batteries.HashMap.empty
  let msg := s!"hello from inside the code! <{2+1}"
  dbg_trace msg
  e.insert "battery" "powered!"

def two_plus_two : Nat :=
  dbgTraceVal 2 + 2
