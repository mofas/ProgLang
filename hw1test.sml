(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

(*use "hw1.sml";*)

val test1 = is_older((1,2,3),(2,3,4)) = true
val test1_1 = is_older((1,2,3),(1,2,4)) = true;
val test1_2 = is_older((1,2,3),(1,3,3)) = true;
val test1_3 = is_older((1,2,3),(1,2,3)) = true;
val test1_4 = is_older((1,2,3),(1,3,1)) = true;
val test1_5 = is_older((1,2,3),(2,1,1)) = true;

val test2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1;
val test2_1 = number_in_month([(2012,1,1),(2013,1,2)],1) = 2;
val test2_2 = number_in_month([(2012,1,1),(2013,2,3)],1) = 1;
val test2_3 = number_in_month([(2012,1,1),(2013,2,1),(2013,2,2),(2013,2,4)],2) = 3;
val test2_4 = number_in_month([(2012,1,1),(2013,2,2)],3) = 0;
val test2_5 = number_in_month([(2012,11,30),(2013,12,31)],4) = 0;

val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val test3_1 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0;
val test3_2 = number_in_months([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[1]) = 1;
val test3_3 = number_in_months([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[5,6,7]) = 0;
val test3_4 = number_in_months([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[3,5,7]) = 1;
val test3_5 = number_in_months([(2012,1,1),(2013,2,2),(2014,3,3),(2014,3,4)],[2,3,4]) = 3;
val test3_6 = number_in_months([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[1,2,3,4]) = 4;

val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val test4_1 = dates_in_month([],2) = [];
val test4_2 = dates_in_month([(2012,2,28),(2013,12,1)],3) = [];
val test4_3 = dates_in_month([(2012,1,1),(2013,1,2)],1) = [(2012,1,1),(2013,1,2)];
val test4_4 = dates_in_month([(2012,1,1),(2013,2,1),(2014,3,3)],2) = [(2013,2,1)];
val test4_5 = dates_in_month([(2012,1,1),(2013,2,2),(2012,3,3),(2013,3,4)],3) = [(2012,3,3),(2013,3,4)];

val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val test5_1 = dates_in_months([],[2,3,4]) = [];
val test5_2 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = [];
val test5_3 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = [(2012,2,28)];
val test5_4 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4]) = [(2011,3,31),(2011,4,28)];

val test6 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi";
val test6_1 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there";
val test6_2 = get_nth(["hi", "there", "how", "are", "you"], 3) = "how";
val test6_3 = get_nth(["hi", "there", "how", "are", "you"], 4) = "are";
val test6_4 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you";

val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013";
val test7_1 = date_to_string((2010, 1, 1)) = "January 1, 2010";
val test7_2 = date_to_string((2011, 2, 2)) = "February 2, 2011";
val test7_3 = date_to_string((2012, 4, 4)) = "April 4, 2012";
val test7_4 = date_to_string((2013, 11, 11)) = "November 11, 2013";
val test7_5 = date_to_string((2014, 12, 31)) = "December 31, 2014";

val test8 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3;
val test8_1 = number_before_reaching_sum(1, [1,2,3,4,5]) = 0;
val test8_2 = number_before_reaching_sum(2, [1,2,3,4,5]) = 1;
val test8_3 = number_before_reaching_sum(3, [1,2,3,4,5]) = 1;
val test8_4 = number_before_reaching_sum(4, [1,2,3,4,5]) = 2;
val test8_5 = number_before_reaching_sum(5, [1,2,3,4,5]) = 2;
val test8_6 = number_before_reaching_sum(6, [1,2,3,4,5]) = 2;
val test8_7 = number_before_reaching_sum(7, [1,2,3,4,5]) = 3;
val test8_8 = number_before_reaching_sum(8, [1,2,3,4,5]) = 3;
val test8_9 = number_before_reaching_sum(11, [1,2,3,4,5]) = 4;

val test9 = what_month(70) = 3;
val test9_1 = what_month(1) = 1;
val test9_2 = what_month(32) = 2;
val test9_3 = what_month(35) = 2;
val test9_4 = what_month(60) = 3;
val test9_5 = what_month(91) = 4;
val test9_6 = what_month(121) = 5;
val test9_7 = what_month(365) = 12;

val test10 = month_range(31, 34) = [1,2,2,2];
val test10_1 = month_range(58, 59) = [2,2];
val test10_2 = month_range(58, 60) = [2,2,3];
val test10_3 = month_range(58, 61) = [2,2,3,3];
val test10_4 = month_range(58, 62) = [2,2,3,3,3];
val test10_5 = month_range(333, 335) = [11,11,12];
val test10_6 = month_range(364, 365) = [12,12];
val test10_7 = month_range(5, 3) = [];

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);
val test11_1 = oldest([]) = NONE;
val test11_2 = oldest([(2011,12,31),(2012,1,1),(2012,1,2)]) = SOME (2011,12,31);
val test11_3 = oldest([(2012,2,27),(2012,2,28),(2011,3,1)]) = SOME (2011,3,1);
val test11_4 = oldest([(2012,1,1),(2013,1,1),(2011,1,1)]) = SOME (2011,1,1);
val test11_5 = oldest([(2014,11,30),(2014,11,29),(2014,11,28)]) = SOME (2014,11,28);

val test12_1 = has([], 1) = false;
val test12_2 = has([1], 1) = true;
val test12_3 = has([1,2,3], 1) = true;
val test12_4 = has([1,2,3], 2) = true;
val test12_5 = has([1,2,3], 4) = false;
val test12_6 = has([1,2,3,4,5], 3) = true;
val test12_7 = has([1,2,3,4,5], 6) = false;

val test13_1 = removeDuplicate([1,2,3]) = [1,2,3];
val test13_2 = removeDuplicate([1,2,3,1]) = [2,3,1];
val test13_3 = removeDuplicate([1,2,3,1,2]) = [3,1,2];
val test13_4 = removeDuplicate([1,2,3,3,3]) = [1,2,3];
val test13_5 = removeDuplicate([1,2,3,1,2,3,4]) = [1,2,3,4];

val test14 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3,4]) = 3;
val test14_2 = number_in_months_challenge([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[1,1]) = 1;
val test14_3 = number_in_months_challenge([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[5,6,7]) = 0;
val test14_4 = number_in_months_challenge([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[3,5,7,3]) = 1;
val test14_5 = number_in_months_challenge([(2012,1,1),(2013,2,2),(2014,3,3),(2014,3,4)],[2,3,4,2,2,2]) = 3;
val test14_6 = number_in_months_challenge([(2012,1,1),(2013,2,2),(2014,3,3),(2014,4,4)],[1,2,3,4,1,2,3,4,1,2,3,4]) = 4;

val test15 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val test15_3 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,2,2]) = [(2012,2,28)];
val test15_4 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,3,3,4]) = [(2011,3,31),(2011,4,28)];

val test16_1 = reasonable_date((2014,1,0)) = false;
val test16_2 = reasonable_date((0,1,1)) = false;
val test16_3 = reasonable_date((2014,13,1)) = false;
val test16_4 = reasonable_date((2014,0,1)) = false;
val test16_5 = reasonable_date((2014,2,29)) = false;
val test16_6 = reasonable_date((2100,2,29)) = false;

val test16_7 = reasonable_date((2014,1,1)) = true;
val test16_8 = reasonable_date((2014,12,31)) = true;
val test16_9 = reasonable_date((2016,2,29)) = true;
val test16_10 = reasonable_date((2014,4,31)) = false;
val test16_11 = reasonable_date((2014,5,30)) = true;
val test16_12 = reasonable_date((2014,7,31)) = true;


