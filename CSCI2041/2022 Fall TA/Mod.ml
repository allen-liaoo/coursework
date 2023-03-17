open List

let rec howMany e l =
    if l = []
        then 0
    else if e = hd l
        then 1 + howMany e (tl l)
    else howMany e (tl l)

let rec delete e l =
    if l = []
        then l
    else if e = hd l
        then delete e (tl l)
    else (hd l)::delete e (tl l)

(* undefined when length of l is 0 *)
let rec mean l =
    let rec meaning len sum list =
        if list = []
            then sum /. len
        else meaning (len+.1.) (sum+.(hd list)) (tl list)
      in meaning 0. 0. l