fun unfold f state =
    case f state of
        NONE => []
      | SOME (state', x) => x :: unfold f state'


(*
fun facList n = 
	unfold (fn x => if x = 0 then NONE else SOME (x - 1, x)) n
val multi = List.foldl (fn(x, acc) => x*acc ) 1
val y = multi [1,2,3,4,5]
val x = facList 5;
*)

(*
val factorial = List.foldl (fn(x, acc) => x*acc ) 1 o unfold (fn x => if x = 0 then NONE else SOME (x - 1, x)) 
val test = factorial 4;
val test2 = factorial 5;

*)
unfold_map = 