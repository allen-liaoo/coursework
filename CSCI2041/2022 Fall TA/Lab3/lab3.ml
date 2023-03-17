type 'key bst = BstEmpty | BstNode of 'key * 'key bst * 'key bst ;;
exception BadEmptyBst;;

let bstDelete tree key = 
  match tree with
    BstEmpty -> tree
    | BstNode(k, BstEmpty, subt) ->
      if key > k
        then BstNode(k, BstEmpty, bstDelete  subt key)
      else tree
    | BstNode(k, subt, BstEmpty) ->
      if key < k
        then BstNode(k, bstDelete  subt key, BstEmpty)
      else tree
    | BstNode(k, left, right) ->
      if key < k
        then BstNode(k, bstDelete left key, BstEmpty)
      else if key > k
        then BstNode(k, BstEmpty, bstDelete right key)
      else 
        (* delete? *)