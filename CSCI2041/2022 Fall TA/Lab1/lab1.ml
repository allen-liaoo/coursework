(*
  Tests for CSci 2041 Computer Laboratory 1
  James Moen
  25 Jan 21

  This is worth 30 points.
*)


open Printf ;;
open List;;

let rec howMany e l =
  if l = []
    then 0
  else if e = (hd l)
    then howMany e (tl l) + 1
  else
    howMany e (tl l)

let rec delete e l =
  if l = []
    then l
  else if e = (hd l)
    then delete e (tl l)
  else
    (hd l) :: delete e (tl l)

let rec mean l =
  let rec sum l =
    if l = []
      then 0.0
    else (hd l) +. sum (tl l)
  in
  let rec length l =
    if l = []
      then 0.0
    else 1.0 +. length (tl l)
  in
  sum l /. length l