let makeStream this state next =
  ((this, state), next) ;;

(* FIRST. Return the first element of a stream. *)

let first ((this, state), next) =
  this ;;

(* REST. Return a stream with its first element removed. *)

let rest ((this, state), next) =
  (next this state, next) ;;


let map func stream =
  makeStream (func (first stream)) (rest stream) 
      (fun first state -> ((func (first state)), (rest state)));;

let naturals =
  makeStream 0 () (fun this state -> (this + 1, ())) ;;

let m = map (fun a -> a+1) naturals;;

Printf.printf "%i\n" (first m);
Printf.printf "%i\n" (first (rest m));