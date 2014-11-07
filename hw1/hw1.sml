
(* helper function *)
type date = int*int*int

fun year(d: date) = 
    #1 d

fun month(d: date) = 
    #2 d

fun day(d: date) = 
    #3 d

fun is_older(d1: date, d2: date) = 
    year(d1)*1000+month(d1)*31+day(d1) < year(d2)*1000+month(d2)*31+day(d2)

fun number_in_month(xs: date list, m: int) = 
    if null xs then 0
    else if month(hd xs) = m
    then 1 + number_in_month(tl xs, m)
    else number_in_month(tl xs, m)

fun number_in_months(xs: date list, ms: int list) =
    if null ms then 0
    else number_in_month(xs, hd ms) + number_in_months(xs, tl ms)

fun dates_in_month(xs: date list, m : int) = 
    if null xs then []
    else if month(hd xs) = m
        then hd xs :: dates_in_month(tl xs, m)
    else 
        dates_in_month(tl xs, m)

fun dates_in_months(xs: date list, ms : int list) = 
    if null ms orelse null xs then []
    else dates_in_month(xs, hd ms) @ dates_in_months(xs, tl ms)

fun get_nth(xs : string list, n: int) =
    if n = 1 then hd xs
    else get_nth(tl xs, n-1)

fun date_to_string(d :date) =
    let
        val month_name = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"]    
        fun get_month_name(m : int) = get_nth(month_name, m)
    in
         get_month_name(month d) ^ " " ^ Int.toString(day d) ^ ", " ^ Int.toString(year d)
    end

fun number_before_reaching_sum(sum: int, xs: int list) =
    let
        fun count_sum(count: int, sum: int, xs: int list) = 
            if sum <= hd xs then count
            else count_sum(count+1, sum - hd xs, tl xs)
    in
        count_sum(0, sum, xs)
    end


fun what_month(m: int) =
    let
        val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(m, days_in_month) + 1
    end

fun month_range(from: int, to: int) = 
    if from>to then []
    else if from=to then [what_month(from)]
    else what_month(from) :: month_range(from+1, to)
    
fun oldest(xs: date list) =
    if null xs then NONE
    else
        let
            val the_oldest = oldest(tl xs)
        in
            if isSome(the_oldest) andalso is_older(valOf the_oldest, hd xs)
                then the_oldest
            else
                SOME(hd xs)
        end



fun has(xs: int list, n: int) = 
    if null xs then false
    else if hd(xs) = n 
        then true
    else 
        has(tl xs, n)

fun removeDuplicate(xs: int list) = 
    if null xs then []
    else if null(tl xs) then [hd xs]
    else if has(tl xs, hd xs) then removeDuplicate(tl xs)
    else hd xs :: removeDuplicate(tl xs)


fun number_in_months_challenge(xs: date list, ms: int list) =
    if null xs orelse null ms then 0
    else
    number_in_months(xs, removeDuplicate(ms))


fun dates_in_months_challenge(xs: date list, ms: int list) =
    if null xs orelse null ms then []
    else
    dates_in_months(xs, removeDuplicate(ms))


fun reasonable_date(date: date) =
    let        
        val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        val y = year(date)
        val m = month(date)
        val d = day(date)

        val is_leap_year = (y mod 400 = 0) orelse (y mod 4 = 0 andalso y mod 100 > 0)

        fun get_nth(xs : int list, n: int) =
            if n = 1 then hd xs
            else get_nth(tl xs, n-1)
    in
        if y < 1 orelse m < 1 orelse m > 12 orelse d < 1 orelse d > 31
            then false
        else if m = 2 andalso is_leap_year andalso d = 29
            then true
        else 
            d <= get_nth(month_days, m)
    end
    