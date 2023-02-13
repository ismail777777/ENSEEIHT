(* ex2 *)

let rec ajout e l =
 match l with
  |[] -> []
  |t::q -> t::(e::t)::(ajout e q)

let rec parties l =
 match l with
  |[] -> [[]]
  |t::q -> ajout t (parties q)

(* ex4 *)

let rec insertions e l =
 match l with
  |[] -> [[e]]
  |t::q -> (e::t::q)::List.map(fun x -> t::x) (insertions e q)

let rec permutations l =
 match l with
  |[] -> [[]]
  |t::q -> List.flatten(List.map(fun l0 -> insertions t l0) (permutations q))