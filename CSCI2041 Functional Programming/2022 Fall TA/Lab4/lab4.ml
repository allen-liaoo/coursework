let rec choose etc things = 
  match things with 
    [] -> ()
    | t::ts ->
      etc t;
      choose etc ts;;

let rec allbut things thing = 
  match things with 
    [] -> []
    | t::ts ->
      if t = thing
        then ts
      else t::(allbut ts thing);;

(* let rec permuting etc permutedThings unpermutedThings =
  if unpermutedThings = []
    then (etc permutedThings; ())
  else let rec perPermuting pthings unpthings =
    match unpthings with
      [] -> ()
      | t::ts ->
        permuting etc (t::pthings) (allbut unpermutedThings t);
        perPermuting pthings ts
    in perPermuting permutedThings unpermutedThings;;

let permute etc things = permuting etc [] things;; *)

let permute etc things = 
  let rec permuting permutedThings unpermutedThings =
    if unpermutedThings = []
      then etc permutedThings
    else choose (fun a -> permuting (a::permutedThings) (allbut unpermutedThings a)) unpermutedThings
  in permuting [] things;;