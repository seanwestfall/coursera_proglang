(* Programming Languages, Dan Grossman, Jan-Mar 2013 *)
(* Homework 1 tests-file Sean Westfall Username: Alphonse23 *)

(* 1 *)
val test1 = is_older((2011,5,6),(2012,5,6)) (* -> true *)
val test2 = is_older((2011,3,15),(2010,5,8)) (* -> false *)

(* 3 *)
val test3 = number_in_month([(2013,5,31),(2013,5,5),(2013,4,1),(2013,5,22),(2013,8,5)], 5) (* -> 3 *)
val test4 = number_in_month([(2012,6,3),(2011,7,3),(2013,7,22),(2008,5,4)], 7) (* -> 2 *)

(* 3 *)
val test5 = number_in_months([(2012,6,3),(2011,7,3),(2013,7,22),(2008,5,4)], [7,4]) (* -> 2 *)
val test6 = number_in_months([(2013,4,6),(2011,4,22),(2012,6,1),(2010,3,2),(2013,2,28)], [4,3]) (* -> 3 *)

(* 4 *)
val test7 = dates_in_month([(1990,5,22),(2012,8,1),(2000,10,31),(1998,5,6),(1986,12,1)], 5) (* -> [(1990,5,22),(1998,5,6)] *)
val test8 = dates_in_month([(1996,1,1),(1999,2,3),(2011,5,28),(2006,4,20),(2000,6,1)], 1) (* -> [(1996,1,1)] *)

(* 5 *)
val test9 = dates_in_months([(1997,5,6),(2002,1,2),(2001,12,1),(2012,6,7),(1991,6,30)], [1,6]) (* -> [(2002,1,2)(2012,6,7)(1991,6,30)] *)
val test10 = dates_in_months([(2012,3,22),(1991,1,20),(2010,5,10),(2009,7,1),(2000,10,1)], [3,4]) (* -> [(2012,3,22)] *)

(* 6 *)
val test11 = get_nth(months, 1) (* -> January *)
val test12 = get_nth(months, 12) (* -> December *)

(* 7 *)
val test13 = date_to_string((1990,10,1)) (* -> October 1, 1990 *)
val test14 = date_to_string((2012,1,1)) (* -> January 1, 2012 *)

(* 8 *)
val test15 = number_before_reaching_sum(60, days_per_month) (* -> 2 *)
val test16 = number_before_reaching_sum(222, days_per_month) (* -> 7 *)

(* 9 *)
val test17 = what_month(110) (* -> 4 *)
val test18 = what_month(360) (* -> 12 *)

(* 10 *)
val test19 = month_range(30, 34) (* -> [1,1,2,2,2] *)
val test20 = month_range(58,91) (* -> [2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4] *)

(* 11 *)
val test21 = oldest([(2012,4,3),(2012,5,6),(2011,3,1),(2013,1,1),(2012,4,18)])  (* -> SOME (2011,3,1) *)
val test22 = oldest([]) (* -> NONE *)

(* 12 Challange *)
val test23 = number_in_months_challenge([(2012,6,3),(2011,7,3),(2013,7,22),(2008,5,4)], [7,4,7]) (* -> 2 *)
val test24 = number_in_months_challenge([(2013,4,6),(2011,4,22),(2012,6,1),(2010,3,2),(2013,2,28)], [4,3,3]) (* -> 3 *)

val test25 = dates_in_months_challenge([(1997,5,6),(2002,1,2),(1995,4,23),(2001,12,1),(2012,6,7),(1991,6,30)], [1,6,5,5,1]) (* -> [(2002,1,2),(2012,6,7),(1991,6,30),(1997,5,6) *)
val test26 = dates_in_months_challenge([(2012,3,22),(1991,1,20),(2010,5,10),(2009,7,1),(2000,10,1)], [3,4,3]) (* -> [(2012,3,22)] *)

(* 13 Challange *)
val test27 = reasonable_date((2000,2,29)) (* -> true *)
val test28 = reasonable_date((1904,2,29)) (* -> true *)
val test29 = reasonable_date((1900,2,29)) (* -> false *)
val test30 = reasonable_date((1901,2,29)) (* -> false *)
val test31 = reasonable_date((2012,1,31)) (* -> true *)
val test32 = reasonable_date((2010,5,6)) (* -> true *)
val test33 = reasonable_date((2013,13,1)) (* -> false *)

(*

test1 -> true
test2 -> false
test3 -> 3
test4 -> 2
test5 -> 2
test6 -> 3
test7 -> [(1990,5,22),(1998,5,6)]
test8 -> [(1996,1,1)]
test9 -> [(2002,1,2)(2012,6,7)(1991,6,30)]
test10 -> [(2012,3,22)]
test11 -> January
test12 -> December
test13 -> October 1, 1990 
test14 -> January 1, 2012
test15 -> 2 
test16 -> 7
test17 -> 4
test18 -> 12
test19 -> [1,1,2,2,2]
test20 -> [2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4]
test21 -> SOME (2011,3,1)
test22 -> NONE
test23 -> 2
test24 -> 3
test25 -> [(2002,1,2),(2012,6,7),(1991,6,30),(1997,5,6)
test26 -> [(2012,3,22)] 
test27 -> true
test28 -> true
test29 -> false
test30 -> false 
test31 -> true
test32 -> true
test33 -> false

*)
