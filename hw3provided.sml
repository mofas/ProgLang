(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)


val only_capitals = List.filter (fn x => Char.isUpper(String.sub(x,0)))

val longest_string1 = List.foldl (fn (x, y) => if String.size x > String.size y then x else y ) ""

val longest_string2 = List.foldl (fn (x, y) => if String.size x >= String.size y then x else y ) ""



fun	longest_string_helper f = List.foldl ( fn(x, y) => if f(String.size x, String.size y) then x else y) ""

val longest_string3 = longest_string_helper (fn(x,y) => x > y)

val longest_string4 = longest_string_helper (fn(x,y) => x >= y)


val longest_capitalized = longest_string1 o only_capitals 

val rev_string = String.implode o List.rev o String.explode 


fun first_answer f xs = 
	case xs of
		[] => raise NoAnswer
		| x::xs' => (
			case f x of
				NONE => first_answer f xs'
				| SOME v => v
		)


fun all_answers f xs = 
	let
		fun helper xs acc =
			case xs of
				[] => SOME acc
				| x::xs' =>
					case f x of
						NONE => NONE
						| SOME v => helper xs' (acc @ v)
	in
		helper xs []			
	end



val count_wildcards = g (fn _ => 1) (fn _ => 0)
		
val count_wild_and_variable_lengths = g (fn _ => 1) String.size

fun count_some_var (s, pat) = 
	g (fn _ => 0) (fn x => if x = s then 1 else 0) pat


(* helper function for testing: get all variable from pattern *)
fun all_variable pat = 
	let
		fun helper pat acc = 
			case pat of
				Variable x => acc @ [x]
				| TupleP ps => List.foldl (fn (p,acc) => helper p acc) acc ps
				| ConstructorP(_,p) => helper p acc
				| _ => acc
	in
		helper pat []
	end

fun is_dist xs = 
	case xs of
		[] => true
		| x::xs' => not (List.exists (fn y => y=x) xs') andalso is_dist xs'


fun check_pat pat = 
	let
		fun all_variable pat acc = 
			case pat of
				Variable x => x::acc
				| TupleP ps => List.foldl (fn (p,acc) => all_variable p acc) acc ps
				| ConstructorP(_,p) => all_variable p acc
				| _ => acc

		fun is_dist xs = 
			case xs of
				[] => true
				| x::xs' => not (List.exists (fn y => y=x) xs') andalso is_dist xs'
	in
		is_dist (all_variable pat [])
	end

fun match (_, Wildcard) = SOME []
	| match(Unit, UnitP) = SOME []
	| match(Const x, ConstP y) = if x = y then SOME[] else NONE
	| match(Tuple xs, TupleP ys) = 
		if List.length xs = List.length ys 
			then all_answers match (ListPair.zip(xs, ys))
		else NONE
	| match (Constructor (s,v), ConstructorP (s', v')) =
		if s = s' then match(v,v') else NONE
	| match(x, Variable y) = SOME[(y, x)]
	| match(_, _) = NONE


fun first_match v plist = 
	SOME (first_answer (fn pat => match (v, pat)) plist) handle NoAnswer => NONE

