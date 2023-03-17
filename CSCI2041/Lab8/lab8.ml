(* Allen Liao *)

(*
  Tests for CSci 2041 Lab 8
  45 points.
*)

type ('key, 'value) pair =
  NoPair |
  Pair of 'key * 'value ref * ('key, 'value) pair ref;;

  exception NoSuchKey;;

(* HASH. Return the index of a bucket in TABLE where KEY may be found. TABLE is
   made by calling HASH MAKE. *)

  let hash table key =
    abs ((Hashtbl.hash key) mod (Array.length table)) ;;
  
  (* HASH MAKE. Return an array to be used as a hash table. It contains MODULUS
     buckets. For various obscure reasons involving number theory, the hash table
     works best if MODULUS is a "large" prime number. *)
  
  let hashMake modulus =
    Array.make modulus NoPair ;;
  
  (*
  
    YOUR CODE GOES HERE!
  
  *)

  let hashDelete table key =
    let rec hashDeleting bucket =
      match bucket with 
          NoPair -> bucket
        | Pair (k, v, rest) ->
          if k = key
            then !rest
          else let r = hashDeleting !rest in
            (rest := r;
            bucket)
    in table.(hash table key) <- hashDeleting table.(hash table key);;

  let hashGet table key =
    let rec hashGetting bucket =
      match bucket with 
          NoPair -> raise NoSuchKey
        | Pair (k, v, rest) ->
          if k = key
            then !v
          else hashGetting !rest
    in hashGetting table.(hash table key);;

  let hashHas table key =
    let rec hashHasing bucket =
      match bucket with 
          NoPair -> false
        | Pair (k, v, rest) ->
          if k = key
            then true
          else hashHasing !rest
    in hashHasing table.(hash table key);;
  
    let hashPut table key value =
      let rec hashPutting bucket =
        match bucket with 
            NoPair -> 
              (table.(hash table key) <- Pair (key, ref value, ref table.(hash table key)); 
              ())
          | Pair (k, v, rest) ->
            if k = key
              then (v := value; ())
            else hashPutting !rest
      in hashPutting table.(hash table key);;  

  (* Tests, worth 45 points. Note that the table size is small enough that you
     can see the entire table by typing "table ;;" to the OCaml REPL. *)
  
  let table = hashMake 23 ;;                        (* [| NoPair ... |] 0 pt. *)
  
  hashHas table "uno" ;;                            (* false            3 pt. *)
  
  hashPut table "uno" "one" ;;                      (* ()               3 pt. *)
  
  hashHas table "uno" ;;                            (* true             3 pt. *)
  
  hashGet table "uno" ;;                            (* "one"            3 pt. *)
  
  hashPut table "duo" "two" ;;                      (* ()               3 pt. *)
  
  hashPut table "trio" "three" ;;                   (* ()               3 pt. *)
  
  hashHas table "trio" ;;                           (* true             3 pt. *)
  
  hashDelete table "duo" ;;                         (* ()               3 pt. *)
  
  hashHas table "duo" ;;                            (* false            3 pt. *)
  
  hashPut table "duo" "bleen" ;;                    (* ()               3 pt. *)
  
  hashGet table "duo" ;;                            (* "bleen"          3 pt. *)
  
  hashGet table "trio" ;;                           (* "three"          3 pt. *)
  
  hashHas table "bleen" ;;                          (* false            3 pt. *)
  
  hashDelete table "bleen" ;;                       (* ()               3 pt. *)
  
  hashGet table "uno" ;;                            (* "one"            3 pt. *)


  (* Test Results 
  type ('key, 'value) pair =
    NoPair
  | Pair of 'key * 'value ref * ('key, 'value) pair ref
exception NoSuchKey
val hash : 'a array -> 'b -> int = <fun>
val hashMake : int -> ('a, 'b) pair array = <fun>
val hashDelete : ('a, 'b) pair array -> 'a -> unit = <fun>
val hashGet : ('a, 'b) pair array -> 'a -> 'b = <fun>
val hashHas : ('a, 'b) pair array -> 'a -> bool = <fun>
val hashPut : ('a, 'b) pair array -> 'a -> 'b -> unit = <fun>
val table : ('_weak45, '_weak46) pair array =
  [|NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair;
    NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair; NoPair;
    NoPair; NoPair; NoPair; NoPair; NoPair|]
- : bool = false
- : unit = ()
- : bool = true
- : string = "one"
- : unit = ()
- : unit = ()
- : bool = true
- : unit = ()
- : bool = false
- : unit = ()
- : string = "bleen"
- : string = "three"
- : bool = false
- : unit = ()
- : string = "one"
*)