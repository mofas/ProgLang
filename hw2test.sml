(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


(*use "hw2provided.sml";*)

val test1 = all_except_option("string", ["string"]) = SOME [];
val test1_1 = all_except_option("s1", []) = NONE;
val test1_2 = all_except_option("s1", ["s1","s2"]) = SOME ["s2"];
val test1_3 = all_except_option("s1", ["s2","s3","s4"]) = NONE;
val test1_4 = all_except_option("s1", ["s4","s5","s1"]) = SOME ["s4", "s5"];

val test2 = get_substitutions1([["foo"],["there"]], "foo") = [];
val test_2 = get_substitutions1([
	["Fred","Fredrick"],
	["Elizabeth","Betty"],
	["Freddie","Fred","F"]],
	"Fred") = ["Fredrick","Freddie","F"];
val test2_3 = get_substitutions1([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"A") = ["B","C"];
val test2_4 = get_substitutions1([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"B") = ["A","C","D"];
val test2_5 = get_substitutions1([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"C") = ["A","B","D"];

val test2_6 = get_substitutions1([
	["Fred","Fredrick"],
	["Jeff","Jeffrey"],
	["Geoff","Jeff","Jeffrey"]], 
	"Jeff") = ["Jeffrey","Geoff","Jeffrey"];

val test3 = get_substitutions2([["foo"],["there"]], "foo") = [];
val test3_2 = get_substitutions2([
	["Fred","Fredrick"],
	["Elizabeth","Betty"],
	["Freddie","Fred","F"]],
	"Fred") = ["Freddie","F","Fredrick"];

val test3_3 = get_substitutions2([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"A") = ["C","B"];
val test3_4 = get_substitutions2([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"B") = ["C","D","A"];
val test3_5 = get_substitutions2([
	["A","B"],
	["A","C"],
	["B","C","D"]],
	"C") = ["B","D","A"];

val test3_6 = get_substitutions2([
	["Fred","Fredrick"],
	["Jeff","Jeffrey"],
	["Geoff","Jeff","Jeffrey"]], 
	"Jeff") = ["Geoff","Jeffrey","Jeffrey"];

val test4 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], 
	{first="Fred", middle="W", last="Smith"}) =
	[
		{first="Fred", last="Smith", middle="W"}, 
		{first="Freddie", last="Smith", middle="W"}, 
		{first="F", last="Smith", middle="W"},
		{first="Fredrick", last="Smith", middle="W"}
	];

val test5 = card_color((Clubs, Num 5)) = Black;
val test5_2 = card_color((Spades, Num 7)) = Black;
val test5_3 = card_color((Diamonds, Num 1)) = Red;
val test5_4 = card_color((Hearts, Num 3)) = Red;
val test5_5 = card_color((Clubs, Num 4)) = Black;

val test6 = card_value((Clubs, Num 2)) = 2;
val test6_2 = card_value((Spades, Num 7)) = 7;
val test6_3 = card_value((Diamonds, Ace)) = 11;
val test6_4 = card_value((Hearts, Jack)) = 10;
val test6_5 = card_value((Hearts, Queen)) = 10;
val test6_6 = card_value((Hearts, King)) = 10;
val test6_7 = card_value((Clubs, Num 4)) = 4;

val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [];
val test7_2 = remove_card([(Hearts, Ace),(Hearts, Num 2)], (Hearts, Ace), IllegalMove) = [(Hearts, Num 2)];
val test7_3 = (remove_card([(Hearts, Num 2),(Hearts, Num 3)], (Hearts, Ace), IllegalMove) handle IllegalMove => []) = [];
val test7_4 = remove_card([(Hearts, Ace),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Hearts, Ace)];
val test7_5 = remove_card([(Hearts, Ace),(Hearts, Num 2),(Hearts, Num 3),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = 
	[(Hearts, Num 2),(Hearts, Num 3),(Hearts, Ace)];
val test7_6 = remove_card([(Hearts, Ace),(Hearts, Ace),(Hearts, Ace)], (Hearts, Ace), IllegalMove) = 
	[(Hearts, Ace),(Hearts, Ace)];

val test8 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true;
val test8_2 = all_same_color([(Hearts, Ace), (Diamonds, Num 2)]) = true;
val test8_3 = all_same_color([(Diamonds, Num 4), (Spades, Num 3)]) = false;
val test8_4 = all_same_color([(Hearts, Num 5), (Spades, King)]) = false;
val test8_5 = all_same_color([(Spades, Num 6), (Hearts, Ace)]) = false;
val test8_6 = all_same_color([(Spades, Num 8), (Clubs, Jack)]) = true;

val test9 = sum_cards([(Clubs, Num 2),(Diamonds, Num 2)]) = 4;
val test9_2 = sum_cards([(Clubs, Num 2),(Clubs, Num 3)]) = 5;
val test9_3 = sum_cards([(Diamonds, Num 2),(Clubs, Jack)]) = 12;
val test9_4 = sum_cards([(Spades, Ace),(Hearts, Num 2)]) = 13;
val test9_5 = sum_cards([(Spades, Num 2),(Clubs, Num 2),(Clubs, Num 2)]) = 6;
val test9_6 = sum_cards([(Hearts, Num 2),(Spades, Ace),(Clubs, Ace)]) = 24;
val test9_7 = sum_cards([(Clubs, Queen),(Hearts, King),(Spades, Jack)]) = 30;


val test10 = score([(Clubs, Num 2),(Spades, Num 4)],10) = 2;
val test10_2 = score([(Spades, Num 5),(Clubs, Num 5)],10) = 0;
val test10_3 = score([(Hearts, Num 8),(Diamonds, Num 4)],10) = 3;
val test10_4 = score([(Hearts, Num 4),(Hearts, Num 4)],4) = 6;
val test10_5 = score([(Hearts, Num 2),(Hearts, Num 4),(Hearts, Num 3)],10) = 0;
val test10_6 = score([(Diamonds, Num 2),(Diamonds, Num 4)],10) = 2;
val test10_7 = score([(Spades, Num 4),(Hearts, Num 4),(Hearts, Num 4)],10) = 6;
val test10_8 = score([(Hearts, Num 2),(Hearts, Num 4),(Hearts, Num 2)],10) = 1;

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;
val test11_2 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw, Discard(Hearts, Num 2)], 15) = 7;
val test11_3 = officiate([(Hearts, Num 2),(Clubs, Num 2),(Hearts, Num 2),(Clubs, Num 2)],[Draw, Draw, Draw, Discard(Clubs, Num 2)], 15) = 5;
val test11_4 = officiate([(Hearts, Num 5),(Clubs, Num 4)],[Draw], 15) = 5;
val test11_5 = officiate([(Hearts, Num 3),(Clubs, Num 2),(Clubs, Num 3),(Clubs, Num 3)],[Draw, Draw], 15) = 10;
val test11_6 = officiate([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 15) = 0;
val test11_7 = officiate([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 17) = 1;
val test11_8 = officiate([(Hearts, Ace),(Clubs, Num 4),(Clubs, Num 4)],[Draw,Draw], 17) = 2;

val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test12_2 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true);

             
val test14 = possible_sum([(Clubs, Num 2),(Spades, Num 4)]) = [6];
val test14_2 = possible_sum([(Spades, Num 5),(Clubs, Num 5)]) = [10];
val test14_3 = possible_sum([(Spades, Ace),(Clubs, Num 5)]) = [6,16];
val test14_4 = possible_sum([(Hearts, Ace),(Clubs, Num 7)]) = [8,18];
val test14_5 = possible_sum([(Hearts, Ace),(Hearts, Ace),(Hearts, Num 5)]) = [7,17,27];
val test14_6 = possible_sum([(Hearts, Ace),(Hearts, Ace),(Hearts, Ace)]) = [3,13,23,33];


val test15 = score_challenge([(Clubs, Num 2),(Spades, Num 4)],10) = 2;
val test15_2 = score_challenge([(Spades, Num 5),(Clubs, Num 5)],10) = 0;
val test15_3 = score_challenge([(Hearts, Num 8),(Diamonds, Num 4)],10) = 3;
val test15_4 = score_challenge([(Hearts, Num 4),(Hearts, Num 4)],4) = 6;
val test15_5 = score_challenge([(Hearts, Num 2),(Hearts, Num 4),(Hearts, Num 3)],10) = 0;
val test15_6 = score_challenge([(Diamonds, Num 2),(Diamonds, Num 4)],10) = 2;
val test15_7 = score_challenge([(Spades, Num 4),(Hearts, Num 4),(Hearts, Num 4)],10) = 6;
val test15_8 = score_challenge([(Hearts, Num 2),(Hearts, Num 4),(Hearts, Num 2)],10) = 1;

val test15_9 = score_challenge([(Hearts, Ace),(Hearts, Num 4),(Hearts, Num 3)],8) = 0;
val test15_10 = score_challenge([(Diamonds, Ace),(Diamonds, Num 4)],5) = 0;
val test15_11 = score_challenge([(Spades, Ace),(Hearts, Num 4),(Hearts, Num 4)],19) = 0;
val test15_12 = score_challenge([(Spades, Ace),(Hearts, Num 4),(Hearts, Num 4)],11) = 2;
val test15_13 = score_challenge([(Hearts, Ace),(Hearts, Num 4),(Hearts, Num 4)],11) = 1;
val test15_14 = score_challenge([(Hearts, Ace),(Hearts, Ace),(Clubs, Num 2)],30) = 6;
val test15_15 = score_challenge([(Hearts, Ace),(Hearts, Ace),(Clubs, Num 2)],15) = 1;
val test15_16 = score_challenge([(Hearts, Ace),(Hearts, Ace),(Clubs, Num 2)],6) = 2;

val test16 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6;
val test16_2 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw, Discard(Hearts, Num 2)], 15) = 7;
val test16_3 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 2),(Hearts, Num 2),(Clubs, Num 2)],[Draw, Draw, Draw, Discard(Clubs, Num 2)], 15) = 5;
val test16_4 = officiate_challenge([(Hearts, Num 5),(Clubs, Num 4)],[Draw], 15) = 5;
val test16_5 = officiate_challenge([(Hearts, Num 3),(Clubs, Num 2),(Clubs, Num 3),(Clubs, Num 3)],[Draw, Draw], 15) = 10;
val test16_6 = officiate_challenge([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 15) = 0;

val test16_7 = officiate_challenge([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 5) = 0;
val test16_8 = officiate_challenge([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 7) = 1;
val test16_9 = officiate_challenge([(Hearts, Ace),(Hearts, Num 4),(Clubs, Num 4)],[Draw,Draw], 17) = 1;

val test16_10 = officiate_challenge([(Hearts, Ace),(Clubs, Ace),(Clubs, Num 4)],[Draw,Draw], 5) = 3;
val test16_11 = officiate_challenge([(Hearts, Ace),(Clubs, Ace),(Clubs, Num 4)],[Draw,Draw], 17) = 5;
val test16_12 = officiate_challenge([(Hearts, Ace),(Clubs, Ace),(Clubs, Num 4)],[Draw,Draw], 21) = 3;
val test16_13 = officiate_challenge([(Hearts, Ace),(Hearts, Ace),(Clubs, Num 4)],[Draw,Draw], 14) = 1;
