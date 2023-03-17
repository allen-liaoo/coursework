(* Allen Liao liao0144*)

let num = fst;;
let den = snd;;

let rec gcd i j =
  if i <> 0
  then if j > i
    then gcd i (j - i)
    else gcd (i - j) j
  else j;;

let rat n d =
  (n / (gcd n d), d / (gcd n d));;

let ratAdd a b =
  rat (num(a)*den(b) + den(a)*num(b)) (den(a)*den(b));;

let ratMul a b =
  rat (num(a)*num(b)) (den(a)*den(b));;

let ratDiv a b =
  rat (num(a)*den(b)) (den(a)*num(b));;

let ratGt a b =
  (num(a)*den(b)) > (den(a)*num(b));;

let epsilon = rat 1 100000;;
let one = rat 1 1;;

let euler () =
  let rec eulering s t c =
    if (ratGt t epsilon)
    then eulering (ratAdd s t) (ratDiv t c) (ratAdd c one)
    else s
  in eulering (rat 0 1) one one;; 

  (*
  CSci 2041 Tests for Lab Assignment 2

    James Moen
    02 Feb 21

  These tests are worth 30 points total.
*)

(* RAT PRINT. Print a pair (N, D) as the fraction N / D. You don't have to know
   how this works. *)

let ratPrint (n, d) =
  Printf.printf "%i / %i\n" n d ;;

(* BOOL PRINT. Print a BOOL B. You don't have to know how this works either. *)

let boolPrint b =
  Printf.printf "%b\n" b ;;

(* Test the rational arithmetic functions. *)

ratPrint (rat 1 2) ;;                                       (* 2 pts: 1 / 2 *)

ratPrint (rat 10 20) ;;                                     (* 2 pts: 1 / 2 *)

ratPrint (ratAdd (rat 1 2) (rat 1 2)) ;;                    (* 2 pts: 1 / 1 *)

ratPrint (ratAdd (rat 1 3) (rat 1 2)) ;;                    (* 2 pts: 5 / 6 *)

ratPrint (ratMul (rat 1 2) (rat 10 1)) ;;                   (* 2 pts: 5 / 1 *)

ratPrint (ratMul (rat 2 3) (rat 4 5)) ;;                    (* 2 pts: 8 / 15 *)

ratPrint (ratDiv (rat 1 2) (rat 10 2)) ;;                   (* 2 pts: 1 / 10 *)

ratPrint (ratDiv (rat 1 2) (rat 1 3)) ;;                    (* 2 pts: 3 / 2 *)

boolPrint (ratGt (rat 1 2) (rat 1 3)) ;;                    (* 2 pts: true *)

boolPrint (ratGt (rat 1 3) (rat 1 2)) ;;                    (* 2 pts: false *)

(* The big finish. Compute E. *)

ratPrint (euler ()) ;;                             (* 20 pts: 109601 / 40320 *)

(* Test Results:
1 / 2
1 / 2
1 / 1
5 / 6
5 / 1
8 / 15
1 / 10
3 / 2
true
false
109601 / 40320
*)