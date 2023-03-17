(* Allen Liao liao0144 
  I wrote a function (bstString) that prints the BST, since none was provided. *)

(*
  CSci 2041 Tests for Lab Assignment 3

    James Moen
    26 Sep 21

  It's worth 40 points.
*)
(* BST. An unbalanced Binary Search Tree of KEYs. *)

open Printf;;

type 'key bst = BstEmpty | BstNode of 'key * 'key bst * 'key bst ;;

(* BAD EMPTY BST. Raised when a BST is empty but shouldn't be. Bad. *)

exception BadEmptyBst ;;

(* BST MAX KEY. Return the maximum key in TREE. *)

let rec bstMaxKey tree =
  match tree
  with BstEmpty -> raise BadEmptyBst |
       BstNode(key, _, BstEmpty) -> key |
       BstNode(_, _, rightSubtree) -> bstMaxKey rightSubtree ;;

(* BST INSERT. Return a new BST that's like TREE, but with KEY. *)

let bstInsert tree key =
  let rec inserting subtree =
    match subtree
    with BstEmpty -> BstNode(key, BstEmpty, BstEmpty) |
         BstNode(otherKey, leftSubtree, rightSubtree) ->
           if key < otherKey
           then BstNode(otherKey, inserting leftSubtree, rightSubtree)
           else if key > otherKey
                then BstNode(otherKey, leftSubtree, inserting rightSubtree)
                else subtree
  in inserting tree ;;

(* BST IS IN. Test if KEY is in TREE. It may help with debugging. *)

let bstIsIn key tree =
  let rec isInning subtree =
    match subtree
    with BstEmpty -> false |
         BstNode(otherKey, leftSubtree, rightSubtree) ->
           if key < otherKey
           then isInning leftSubtree
           else if key > otherKey
                then isInning rightSubtree
                else true
  in isInning tree ;;

let rec bstDelete tree key =
    let rec bstDeleting subtree =
      match subtree with
            BstEmpty -> BstEmpty
          | BstNode (k, BstEmpty, BstEmpty) -> 
              if k = key
                  then BstEmpty
              else subtree
          | BstNode (k, BstEmpty, rnode) -> 
              if k < key 
                  then BstNode (k, BstEmpty, bstDeleting rnode)
              else if k = key 
                  then rnode
              else subtree
          | BstNode (k, lnode, BstEmpty) -> 
              if key < k
                  then BstNode (k, bstDeleting lnode, BstEmpty)
              else if k = key
                  then lnode
              else subtree
          | BstNode (k, lnode, rnode) ->
              if k < key
                  then BstNode (k, lnode, bstDeleting rnode)
              else if key < k
                  then BstNode (k, bstDeleting lnode, rnode)
              else let k' = (bstMaxKey lnode) 
                  in BstNode (k', (bstDelete lnode k'), rnode) 
    in bstDeleting tree;;

(* internal to bstString; count the number of tabs needed (based on the depth in the recursion), and return a string accordingly *)
let rec getTabs times =
    if times <> 0
        then "\t" ^ (getTabs (times-1))
    else "";;

(* print the exact same string of a BST as what's in the documentation. need to append "\n" to the returned string *)
let bstString tree =
    let rec bstStringing tree times =
      match tree with
          BstEmpty -> "BstEmpty"
        | BstNode (key, BstEmpty, BstEmpty) -> "BstNode (" ^ string_of_int(key) ^ ", BstEmpty, BstEmpty)"
        | BstNode (key, lnode, rnode) ->
            "BstNode (" ^ string_of_int(key) ^ ",\n" ^ (getTabs times) ^ (bstStringing lnode (times+1)) ^ ",\n" ^ (getTabs times)  ^ (bstStringing rnode (times+1)) ^")"
    in bstStringing tree 1;;

(* Let T be the BST from the assignment. We'll make it by adding nodes one at a
   time, so OCaml will print lots intermediate BST's that we don't care about.
   Just ignore those. *)

let t = BstEmpty        ;;
let t = bstInsert t 100 ;;
let t = bstInsert t 70  ;;
let t = bstInsert t 137 ;;
let t = bstInsert t 53  ;;
let t = bstInsert t 86  ;;
let t = bstInsert t 74  ;;
let t = bstInsert t 212 ;;
let t = bstInsert t 149 ;;
let t = bstInsert t 997 ;;

(* This is the one we care about, but OCaml will indent it less clearly.

   BstNode (100,
     BstNode (70,
       BstNode (53, BstEmpty, BstEmpty),
       BstNode (86,
         BstNode (74, BstEmpty, BstEmpty),
         BstEmpty)),
     BstNode (137,
       BstEmpty,
       BstNode (212,
         BstNode (149, BstEmpty, BstEmpty),
         BstNode (997, BstEmpty, BstEmpty))))

   We'll delete nodes from it, one at a time. We'll start by deleting a node
   from a left subtree, with no children. *)

let t = bstDelete t 149 ;;
print_string "let t = bstDelete t 149 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 5 points if you get this.

   BstNode (100,
     BstNode (70,
       BstNode (53, BstEmpty, BstEmpty),
       BstNode (86,
         BstNode (74, BstEmpty, BstEmpty),
         BstEmpty)),
     BstNode (137,
       BstEmpty,
       BstNode (212,
         BstEmpty,
         BstNode (997, BstEmpty, BstEmpty)))) *)

(* Delete a node from a right subtree, with no children. *)

let t = bstDelete t 997 ;;
print_string "let t = bstDelete t 997 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 5 points if you get this.

   BstNode (100,
     BstNode (70,
       BstNode (53, BstEmpty, BstEmpty),
       BstNode (86,
         BstNode (74, BstEmpty, BstEmpty),
         BstEmpty)),
     BstNode (137,
       BstEmpty,
       BstNode (212, BstEmpty, BstEmpty))) *)

(* Delete a node from a right subtree, with one child. *)

let t = bstDelete t 86 ;;
print_string "let t = bstDelete t 86 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 5 points if you get this.

   BstNode (100,
     BstNode (70,
       BstNode (53, BstEmpty, BstEmpty),
       BstNode (74, BstEmpty, BstEmpty)),
     BstNode (137,
       BstEmpty,
       BstNode (212, BstEmpty, BstEmpty))) *)

(* Delete a node with two children. *)

let t = bstDelete t 100 ;;
print_string "let t = bstDelete t 100 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 10 points if you get this. I'm assuming you replaced 100 with the key from
   the largest node from the left subtree, 74, then deleted that node.

   BstNode (74,
     BstNode (70,
       BstNode (53, BstEmpty, BstEmpty),
       BstEmpty),
     BstNode (137,
       BstEmpty,
       BstNode (212, BstEmpty, BstEmpty))) *)

(* Delete a node from the left subtree, with one child. *)

let t = bstDelete t 70 ;;
print_string "let t = bstDelete t 70 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 5 points if you get this.

   BstNode (74,
     BstNode (53, BstEmpty, BstEmpty),
     BstNode (137,
       BstEmpty,
       BstNode (212, BstEmpty, BstEmpty))) *)

(* Delete a node from the right subtree, with one child. *)

let t = bstDelete t 137 ;;
print_string "let t = bstDelete t 137 ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* 5 points if you get this.

   BstNode (74,
     BstNode (53, BstEmpty, BstEmpty),
     BstNode (212, BstEmpty, BstEmpty)) *)

(* The big finish. Delete all the remaining nodes! *)

let t = bstDelete t 53  ;;
let t = bstDelete t 212 ;;
let t = bstDelete t 74  ;;

(* 5 points if you get BstEmpty in the end. *)
  print_string "let t = bstDelete t 53  ;;
let t = bstDelete t 212 ;;
let t = bstDelete t 74  ;;\n";;
print_string ((bstString t) ^ "\n\n");;

(* Results

let t = bstDelete t 149 ;;
BstNode (100,
        BstNode (70,
                BstNode (53, BstEmpty, BstEmpty),
                BstNode (86,
                        BstNode (74, BstEmpty, BstEmpty),
                        BstEmpty)),
        BstNode (137,
                BstEmpty,
                BstNode (212,
                        BstEmpty,
                        BstNode (997, BstEmpty, BstEmpty))))

let t = bstDelete t 997 ;;
BstNode (100,
        BstNode (70,
                BstNode (53, BstEmpty, BstEmpty),
                BstNode (86,
                        BstNode (74, BstEmpty, BstEmpty),
                        BstEmpty)),
        BstNode (137,
                BstEmpty,
                BstNode (212, BstEmpty, BstEmpty)))

let t = bstDelete t 86 ;;
BstNode (100,
        BstNode (70,
                BstNode (53, BstEmpty, BstEmpty),
                BstNode (74, BstEmpty, BstEmpty)),
        BstNode (137,
                BstEmpty,
                BstNode (212, BstEmpty, BstEmpty)))

let t = bstDelete t 100 ;;
BstNode (74,
        BstNode (70,
                BstNode (53, BstEmpty, BstEmpty),
                BstEmpty),
        BstNode (137,
                BstEmpty,
                BstNode (212, BstEmpty, BstEmpty)))

let t = bstDelete t 70 ;;
BstNode (74,
        BstNode (53, BstEmpty, BstEmpty),
        BstNode (137,
                BstEmpty,
                BstNode (212, BstEmpty, BstEmpty)))

let t = bstDelete t 137 ;;
BstNode (74,
        BstNode (53, BstEmpty, BstEmpty),
        BstNode (212, BstEmpty, BstEmpty))

let t = bstDelete t 53  ;;
let t = bstDelete t 212 ;;
let t = bstDelete t 74  ;;
BstEmpty

*)