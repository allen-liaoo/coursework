open List;;
open Format;;
let rec howManyHelp c e l =
  if l = []
    then c
  else if e = (hd l)
    then howManyHelp (c+1) e (tl l)
  else howManyHelp c e (tl l);;

let howMany e l =
  howManyHelp 0 e l;;

let rec delete e l =
  if l = []
    then []
  else if e = (hd l)
    then delete e (tl l)
    else (hd l) :: delete e (tl l);;



  let printThings f l =
    let rec printingThings l =
      match l with
        [] -> () |
        h :: t -> printf " ; " ; printf f h ; printingThings t
    in printf "[" ;
       (match l with
          [] -> () |
          h :: t -> printf f h ; printingThings t) ;
       printf "]\n" ;;
  
  printThings "%i" (delete 1 [2; 1; 4; 1; 5]) ;;                     (* 2 pt: [] *)