let rec gcd i j =
 if i <> 0 
 then if j > i
   then gcd i (j - i)
   else gcd (i - j) j
 else j ;;
let rat n d = (* Return the rational number whose numerator is 
the integer n and whose denominator is the integer d. The type of
rat is int -> int -> int  0 and d > 0. *)
 let b = gcd n d in ((n / b) , (d / b));;
let ratAdd a b = (* Return the rational number that is the sum of
the rational numbers a and b. The type of ratAdd is int  int -> 
int  int -> int  int. Hint: use rat. *)
 rat (fst a * snd b + snd a * fst b) (snd a * snd b);;
 
let ratDiv a b = (* Return the rational number that is the 
quotient of the rational numbers a and b. The type of ratDiv is 
int  int -> int  0. Hint: use rat. *)
 rat (fst a * snd b) (fst b * snd a);;
let ratGt a b = (* If the rational number a is greater than the 
rational number b, then return true, otherwise return false. The 
type of ratGt is int  int -> bool. *)
 if fst a * snd b > fst b * snd a then true
 else false;;
 
let rec eulering s t c =
 if ratGt t (rat 1 100000)
   then eulering (ratAdd s t) (ratDiv t c) (ratAdd c (1, 1))
 else s;;
let euler () = eulering (0, 1) (1, 1) (1, 1);;
(* Results:
val ratPrint : int * int -> unit = <fun>
val boolPrint : bool -> unit = <fun>
1 / 2
- : unit = ()
1 / 2
- : unit = ()
1 / 1
- : unit = ()
5 / 6
- : unit = ()
5 / 1
- : unit = ()
8 / 15
- : unit = ()
1 / 10
- : unit = ()
3 / 2
- : unit = ()
true
- : unit = ()
false
- : unit = ()
109601 / 40320
- : unit = ()
*)
