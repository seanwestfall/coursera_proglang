(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Homework 1 Sean Westfall Username: Alphonse23 *)

(* 1 *)
fun is_older(date1: (int*int*int), date2: (int*int*int)):bool =
  if (#1 date1) < (#1 date2) then true
  else if ((#1 date1) = (#1 date2)) andalso ((#2 date1) < (#2 date2)) then true
  else if ((#1 date1) = (#1 date2)) andalso ((#2 date1) = (#2 date2)) andalso ((#3 date1) < (#3 date2)) then true
  else false

(* 2 *)
fun number_in_month(dates: (int*int*int) list, month: int):int =
  if null(dates) then 0
  else (if month = (#2 (hd(dates))) then 1 else 0) + number_in_month(tl(dates), month)

(* 3 *)
fun number_in_months(dates: (int*int*int) list, months: int list):int =
  if null(months) then 0
  else if null(dates) then 0
  else number_in_month(dates, hd(months)) + number_in_months(dates, tl(months))

(* 4 *)
fun dates_in_month(dates: (int*int*int) list, month: int):(int*int*int) list =
  if null(dates) then nil
  else (if month = (#2 (hd(dates))) then [hd(dates)] else nil) @ dates_in_month(tl(dates), month)

(* 5 *)
fun dates_in_months(dates: (int*int*int) list, months: int list):(int*int*int) list =
  if null(months) then nil
  else if null(dates) then nil
  else dates_in_month(dates, hd(months)) @ dates_in_months(dates, tl(months))

val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

(* 6 *)
fun get_nth(strings: string list, n: int):string =
  if null(strings) then ""
  else if n = 1 then hd(strings)
  else get_nth(tl(strings), n-1)

(* 7 *)
fun date_to_string(date: int*int*int):string = get_nth(months, (#2 date)) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)

val days_per_month = [31,28,31,30,31,30,31,31,30,31,30,31]

(* 8 *)
fun number_before_reaching_sum(sum: int, intlist: int list):int =
  let fun countdown(sum: int, intlist: int list, n: int):int =
        if ((sum - hd(intlist)) <= 0) then (n-1)
	else countdown(sum-(hd(intlist)), tl(intlist), n+1)
  in
    countdown(sum, intlist, 1)
  end

(* 9 *)
fun what_month(dayinyear: int):int =
  number_before_reaching_sum(dayinyear, days_per_month)+1;

(* 10 *)
fun month_range(day1: int, day2: int):int list =
  if day1 > day2 then nil
  else what_month(day1) :: month_range(day1+1, day2)

(* 11 *)
fun oldest(dates: (int*int*int) list):(int*int*int) option =
  if null(dates) then NONE
  else 
    let val tl_date = oldest(tl(dates))
    in
      if isSome tl_date andalso is_older(valOf(tl_date), hd(dates)) then tl_date
      else SOME (hd(dates))
    end

(* 12 Challenge Problem *)
fun remove_dup(y: int list):int list =
  if (y=nil) then nil
  else let fun remove(x: int, L: int list):int list =
             if (L=nil) then nil
             else if (x=hd(L)) then remove(x,tl(L))
                  else hd(L)::remove(x,tl(L))
       in
         hd(y)::remove(hd(y),remove_dup(tl(y)))
       end

fun number_in_months_challenge(dates: (int*int*int) list, months: int list):int =
  if null(dates) then 0
  else let val months_mod = remove_dup(months)
       in
         number_in_months(dates, months_mod)
       end

fun dates_in_months_challenge(dates: (int*int*int) list, months: int list):(int*int*int) list =
  if null(dates) then nil
  else let val months_mod = remove_dup(months)
       in
         dates_in_months(dates, months_mod)
       end

(* 13 Challenge Problem *)
fun reasonable_date(date: (int*int*int)):bool =
  if ((#1 date) < 1) then false
  else if ((#2 date) < 1) orelse ((#2 date) > 12) then false
  else if let fun getEle(n: int, L: int list):int =
                if null(L) then 0
                else if n = 1 then hd(L)
                else getEle(n-1, tl(L))
            val dayinmonths = if (((#2 date) = 2) andalso (((#1 date) mod 400 = 0) orelse (((#1 date) mod 100 <> 0) andalso ((#1 date) mod 4 = 0)))) then 29 else getEle((#2 date), days_per_month)
          in  
            (((#3 date) < 1) orelse ((#3 date) > dayinmonths))
          end 
          then false
  else true

