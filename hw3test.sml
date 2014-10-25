(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


use "hw3provided.sml";

(*
val test1 = only_capitals ["A","B","C"] = ["A","B","C"];
val test1_2 = only_capitals ["A","b","C"] = ["A","C"];
val test1_3 = only_capitals ["A","b","c"] = ["A"];
val test1_4 = only_capitals ["Abc","B","C"] = ["Abc","B","C"];
val test1_5 = only_capitals ["Abc","aB","abC"] = ["Abc"];

val test2 = longest_string1 ["A","bc","C"] = "bc";
val test2_2 = longest_string1 ["Ab","bc","C"] = "Ab";
val test2_3 = longest_string1 ["A","bc","Cde"] = "Cde";
val test2_4 = longest_string1 ["A","b","C"] = "A";
val test2_5 = longest_string1 ["Abc","bcde","efghij"] = "efghij";
val test2_6 = longest_string1 [] = "";
val test2_7 = longest_string1 ["","","C"] = "C"

val test3 = longest_string2 ["A","bc","C"] = "bc"
val test3 = longest_string2 ["A","bc","C"] = "bc";
val test3_2 = longest_string2 ["Ab","bc","C"] = "bc";
val test3_3 = longest_string2 ["A","bc","Cde"] = "Cde";
val test3_4 = longest_string2 ["A","b","C"] = "C";
val test3_5 = longest_string2 ["Abc","bcde","efghij"] = "efghij";
val test3_6 = longest_string2 [] = "";
val test3_7 = longest_string2 ["","","C"] = "C"

val test4a= longest_string3 ["A","bc","C"] = "bc"
val test4a_2 = longest_string3 ["Ab","bc","C"] = "Ab";
val test4a_3 = longest_string3 ["A","bc","Cde"] = "Cde";
val test4a_4 = longest_string3 ["A","b","C"] = "A";
val test4a_5 = longest_string3 ["Abc","bcde","efghij"] = "efghij";
val test4a_6 = longest_string3 [] = "";
val test4a_7 = longest_string3 ["","","C"] = "C"

val test4b = longest_string4 ["A","bc","C"] = "bc";
val test4b_2 = longest_string4 ["Ab","bc","C"] = "bc";
val test4b_3 = longest_string4 ["A","bc","Cde"] = "Cde";
val test4b_4 = longest_string4 ["A","b","C"] = "C";
val test4b_5 = longest_string4 ["Abc","bcde","efghij"] = "efghij";
val test4b_6 = longest_string4 [] = "";
val test4b_7 = longest_string4 ["","","C"] = "C"

val test5 = longest_capitalized ["A","bc","C"] = "A";
val test5 = longest_capitalized ["A","bc","C"] = "A";
val test5_2 = longest_capitalized ["Ab","bc","C"] = "Ab";
val test5_3 = longest_capitalized ["A","bc","Cde"] = "Cde";
val test5_4 = longest_capitalized ["A","b","C"] = "A";
val test5_5 = longest_capitalized ["Abc","bcde","efghij"] = "Abc";
val test5_6 = longest_capitalized [] = "";
val test5_7 = longest_capitalized ["abc","def","C"] = "C";

val test6 = rev_string "abc" = "cba";
val test6_2 = rev_string "abcdefg" = "gfedcba";
val test6_3 = rev_string "AaAa" = "aAaA";
val test6_4 = rev_string "c" = "c";

val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4;
val test7_2 = first_answer (fn x => if x > 1 then SOME x else NONE) [1,2,3,4,5] = 2;
val test7_3 = first_answer (fn x => if x < 5 then SOME x else NONE) [1,2,3,4,5] = 1;
val test7_4 = ((first_answer (fn x => if x > 3 then SOME x else NONE) [1,2]) handle NoAnswer => 999) = 999;

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE;
val test8_2 = all_answers (fn x => if x = 2 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE;
val test8_3 = all_answers (fn x => if x < 8 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7];
val test8_4 = all_answers (fn x => if x > 4 then SOME [x] else NONE) [5,6,7] = SOME [5,6,7];
val test8_5 = all_answers (fn x => if x < 3 then SOME [x] else NONE) [] = SOME [];

val test9a = count_wildcards Wildcard = 1;
val test9a_2 = count_wildcards UnitP = 0;
val test9a_2_2 = count_wildcards (ConstP 2) = 0;

val test9a_3 = count_wildcards (TupleP [Wildcard]) = 1;
val test9a_3_2 = count_wildcards (TupleP [UnitP]) = 0;
val test9a_3_3 = count_wildcards (TupleP [(ConstP 2)]) = 0;
val test9a_3_4 = count_wildcards (TupleP [(ConstructorP ("a", UnitP))]) = 0;
val test9a_3_5 = count_wildcards (TupleP [UnitP,Wildcard,Wildcard]) = 2;
val test9a_3_6 = count_wildcards (TupleP [Wildcard,TupleP[Wildcard]]) = 2;

val test9a_4 = count_wildcards (ConstructorP("a", UnitP)) = 0;
val test9a_4_2 = count_wildcards (ConstructorP("a", Wildcard)) = 1;
val test9a_4_3 = count_wildcards (ConstructorP("a", TupleP [UnitP])) = 0;
val test9a_4_4 = count_wildcards (ConstructorP("a", TupleP [Wildcard])) = 1;
val test9a_4_4 = count_wildcards (ConstructorP("a", TupleP [Wildcard, ConstructorP("a", Wildcard)])) = 2;

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_2 = count_wild_and_variable_lengths UnitP = 0;
val test9b_2_2 = count_wild_and_variable_lengths (ConstP 2) = 0;

val test9b_3 = count_wild_and_variable_lengths (TupleP [Wildcard]) = 1;
val test9b_3_2 = count_wild_and_variable_lengths (TupleP [UnitP]) = 0;
val test9b_3_3 = count_wild_and_variable_lengths (TupleP [(ConstP 2)]) = 0;
val test9b_3_4 = count_wild_and_variable_lengths (TupleP [(ConstructorP ("a", UnitP))]) = 1;
val test9b_3_5 = count_wild_and_variable_lengths (TupleP [UnitP,Wildcard,Wildcard]) = 2;
val test9b_3_6 = count_wild_and_variable_lengths (TupleP [Wildcard,TupleP[Wildcard]]) = 2;

val test9b_4 = count_wild_and_variable_lengths (ConstructorP("a", UnitP)) = 1;
val test9b_4_2 = count_wild_and_variable_lengths (ConstructorP("a", Wildcard)) = 1;
val test9b_4_3 = count_wild_and_variable_lengths (ConstructorP("a", TupleP [UnitP])) = 0;
val test9b_4_4 = count_wild_and_variable_lengths (ConstructorP("a", TupleP [Wildcard])) = 1;
val test9b_4_4 = count_wild_and_variable_lengths (ConstructorP("a", TupleP [Wildcard, ConstructorP("a", Wildcard)])) = 2;

val test9b_5 = count_wild_and_variable_lengths (ConstructorP("a", Variable("a"))) = 1;
val test9b_5_2 = count_wild_and_variable_lengths (ConstructorP("a", Variable("aa"))) = 2;
val test9b_5_3 = count_wild_and_variable_lengths (TupleP [Wildcard, ConstructorP("a", Wildcard)]) = 2;
val test9b_5_4 = count_wild_and_variable_lengths (TupleP [Variable("a"), Variable("bb")]) = 3;
val test9b_5_5 = count_wild_and_variable_lengths (TupleP [Variable("aa"),TupleP [Variable("bb")]]) = 4;
*)


(*
val test9c = count_some_var ("x", Variable("x")) = 1;

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []

*)