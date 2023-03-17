type poly = PolyEmpty | PolyTerm of int * int * poly ;;

let isPolyOk p =
  let rec checkingPoly p prevEx =
    match p with
      PolyEmpty -> true
      | PolyTerm(coef, expo, p') ->
        if coef = 0
          then false
        else if expo < 0
          then false
        else if prevEx <= expo && prevEx >= 0
          then false
        else checkingPoly p' expo
  in checkingPoly p (-1);;

exception MakePolyError;;

let makePoly i =
  let rec makingPoly i = 
    match i with
      [] -> PolyEmpty
      (* | [_] -> raise MakePolyError *)
      | a::b::i' ->
        PolyTerm(a, b, makingPoly i')
  in let poly = makingPoly i
  in if isPolyOk poly
    then poly
else raise MakePolyError;;
        
let rec polyAdd l r =
  match (l, r) with 
    (PolyEmpty, PolyEmpty) -> l
    | (PolyEmpty, _) -> r
    | (_, PolyEmpty) -> l
    | (PolyTerm(lc, le, lp), PolyTerm(rc, re, rp)) ->
      if le > re
        then PolyTerm(lc, le, (polyAdd lp r))
      else if le < re
        then PolyTerm(rc, re, (polyAdd l rp))
      else PolyTerm(lc+rc, le+re, (polyAdd lp rp));;

let rec polyMinus r = 
  match r with
    PolyEmpty -> r
    | PolyTerm(c, e, p) ->
      PolyTerm(-c, e, polyMinus p);;

  (* PRINTF. Define various predefined printing functions. *)
open Printf ;;
(* PRINT POLY. Print POLY so it's allegedly easy to read. You need not know how
   this works. Maybe it will help with debugging. *)
let printPoly poly =
(* PRINTING POLY. Do all the work for PRINT POLY. *)
  let rec printingPoly poly =
    match poly
    with PolyEmpty ->
          () |
         PolyTerm (coef, expo, other) ->
          printf " %c %i x^%i"
            (if coef < 0 then '-' else '+')
            (abs coef) expo ;
          printingPoly other
(* Lost? This is PRINT POLY's body. *)
  in match poly
     with PolyEmpty ->
            printf "0\n" |
          PolyTerm(coef, expo, other) ->
            printf "%i x^%i" coef expo ;
            printingPoly other ;
            printf "\n" ;;