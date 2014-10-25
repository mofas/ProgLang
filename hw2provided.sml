(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option(s, xs) = 
  case xs of
    [] => NONE
    | y::ys' => 
      if same_string(s, y) then SOME ys' 
      else 
        case all_except_option(s, ys') of
          NONE => NONE
          | SOME z => SOME (y :: z)


fun get_substitutions1(xs, s) =
  case xs of
    [] => []
    | x::xs' => 
      case all_except_option(s, x) of
        NONE => get_substitutions1(xs', s)
        | SOME y => y @ get_substitutions1(xs', s)


fun get_substitutions2(xs, s) = 
  let
    fun helper(xs, acc) = 
      case xs of
        [] => acc
        | y::ys' => 
          case all_except_option(s, y) of
            NONE => helper(ys', acc)
            | SOME y => helper(ys', y @ acc)
  in
    helper(xs, [])
  end
  

fun similar_names(xs, {first, middle, last}) = 
  let
    fun helper(first' , acc) = 
      case first' of
        [] => acc
        | y::ys => {first = y, middle = middle, last = last} :: helper(ys, acc)
  in
    helper( first::get_substitutions2(xs, first), [])
  end
  


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color(suit, rank) = 
  case suit of
    Clubs => Black
    | Diamonds => Red
    | Hearts => Red
    | Spades => Black


fun card_value(suit, rank) =
  case rank of
    Jack => 10
    | Queen => 10
    | King => 10
    | Ace => 11
    | Num num => num


fun remove_card(cs, c, e) =
  case cs of
    [] => raise e
    | c'::cs' => 
      if c' = c then cs'
      else c' :: remove_card(cs', c, e)


fun all_same_color(cs) =
  case cs of
    [] => true
    | c1::[] => true
    | c1::c2::cs' =>
      if card_color c1 = card_color c2
        then all_same_color( c2:: cs' )
      else false


fun sum_cards(cs) =
  let
    fun helper(cs, acc) =
      case cs of
        [] => acc
        | c::cs' =>
          helper(cs', acc + card_value c)
  in
    helper(cs, 0)
  end


fun score(cs, goal) = 
  let
    val sum = sum_cards(cs)
    val preliminary = 
      if sum > goal then (sum - goal)*3
      else goal - sum
  in
    if all_same_color(cs) then preliminary div 2 else preliminary
  end
  

fun officiate(cards, moves, goal) =
  let
    fun run(_, [], held_cards) = 
        score (held_cards, goal)

      | run([], Draw::_, held_cards) =
         score (held_cards, goal)

      | run(c::cs, Draw::moves, held_cards) =
        if sum_cards held_cards + card_value c > goal
          then score(c::held_cards, goal)
        else
          run(cs, moves,  c::held_cards)

      | run(cards, Discard dc::moves, held_cards) =
        run(cards, moves, remove_card(held_cards, dc, IllegalMove))
      
  in
    run(cards, moves, [])
  end


(*helper function*)
fun possible_sum(cs) = 
  let
    val raw_sum = sum_cards cs
    fun get_possible_sums(xs, acc, prev) =
      case xs of
        [] => acc
        | (_, Ace)::xs' => get_possible_sums(xs', (prev-10)::acc, prev-10)
        | _::xs' => get_possible_sums(xs', acc, prev)
  in
    get_possible_sums(cs, [raw_sum], raw_sum)
  end  


     
fun score_challenge(cs, goal) =
  let
    val raw_score = score(cs, goal);
    fun get_score_by_sum(sum) = 
      let
        val preliminary = 
          if sum > goal then (sum - goal)*3 else goal - sum
      in
        if all_same_color(cs) then preliminary div 2 else preliminary
      end
    fun best_score(sums, best) =       
      case sums of
        [] => best
        | x::xs => 
          let
            val current = get_score_by_sum(x)
          in
            if current < best 
              then best_score(xs, current) 
            else best_score(xs, best)
          end
  in
    best_score(possible_sum(cs), raw_score)
  end


fun officiate_challenge(cards, moves, goal) =
  let
    fun run(_, [], held_cards) = 
        score_challenge (held_cards, goal)

      | run([], Draw::_, held_cards) =
         score_challenge (held_cards, goal)

      | run(c::cs, Draw::moves, held_cards) =
        (case c of
          (_, Ace) => 
            if sum_cards held_cards + 1 > goal
              then score_challenge(c::held_cards, goal)
            else
              run(cs, moves,  c::held_cards)

          | c' =>
            if sum_cards held_cards + card_value c' > goal
              then score_challenge(c'::held_cards, goal)
            else
              run(cs, moves,  c'::held_cards)
        )

      | run(cards, Discard dc::moves, held_cards) =
        run(cards, moves, remove_card(held_cards, dc, IllegalMove))
      
  in
    run(cards, moves, [])
  end

