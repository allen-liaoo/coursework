(* Allen Liao *)

(*
  CSci 2041 Lab Assignment 5

    James Moen
    12 Oct 21

  It's worth 30 points.
*)

(* PROPOSITION. An expression in propositional logic using '¬', '∧', and '∨'.

   false        ↝  False
   true         ↝  True
   a, b, c ...  ↝  Var "a", Var "b", Var "c" ...
   α ∧ β        ↝  And (α, β)
   α ∨ β        ↝  Or (α, β)
   ¬ α          ↝  Not α

   The squiggly arrow '↝' means "represented as." *)

   type proposition =
   False |
   True |
   Var of string |
   And of proposition * proposition |
   Or of proposition * proposition |
   Not of proposition ;;
 
 (*
 
    YOUR DEFINITION FOR UNORIFY GOES HERE!
 
 *)
 
 let unorify prop =
  let rec unorifying p =
    match p with
      Not(Not np) -> unorifying np
      | Not(np) -> Not (unorifying np)
      | And(left, right) -> And(unorifying left, unorifying right)
      | Or(left, right) -> Not(And(Not(unorifying left), Not(unorifying right)))
      | _ -> p
  in unorifying (unorifying prop);;   
  (* unorify twice to reduce Not-Not propositions that resulted from introducing new Not propositions *)
 
 
 (* Unorify the proposition a. *)

 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Var "a");;
 (* 2 points if you get: Var "a" *)
 
 
 
 
 (* Unorify the proposition ¬ a. *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Not (Var "a"));;
 (* 3 points if you get: Not (Var "a") *)
 
 
 
 
 (* Unorify the proposition ¬ ¬ a. *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Not (Not (Var "a")));;
 (* 5 points if you get: Var "a" *)
 
 
 
 
 (* Unorify the proposition ¬ (a ∨ b). *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Not (Or (Var "a", Var "b")));;
 (* 5 points if you get: And (Not (Var "a"), Not (Var "b")) *)
 
 
 
 
 (* Unorify the proposition ¬ (a ∧ b). *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Not (And (Var "a", Var "b")));;
 (* 5 points if you get: Not (And (Var "a", Var "b")) *)
 
 
 
 
 (* Unorify the proposition ¬ a ∨ ¬ b. *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Or (Not (Var "a"), Not (Var "b")));;
 (* 5 points if you get: Not (And (Var "a", Var "b")) *)
 
 
 
 
 (* Unorify the proposition ¬ ¬ a ∨ ¬ b. *)
 
 (* YOUR CALL TO UNORIFY GOES HERE! *)
 unorify (Or (Not (Not (Var "a")), Not (Var "b")));;
 (* 5 points if you get: Not (And (Not (Var "a"), Var "b")) *)

(*
type proposition =
    False
  | True
  | Var of string
  | And of proposition * proposition
  | Or of proposition * proposition
  | Not of proposition
val unorify : proposition -> proposition = <fun>
- : proposition = Var "a"
- : proposition = Not (Var "a")
- : proposition = Var "a"
- : proposition = And (Not (Var "a"), Not (Var "b"))
- : proposition = Not (And (Var "a", Var "b"))
- : proposition = Not (And (Var "a", Var "b"))
- : proposition = Not (And (Not (Var "a"), Var "b"))
*)