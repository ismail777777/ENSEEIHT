(* ex 1 *)

let deuxieme l =
 match l with
  |[] -> failwith "liste vide"
  |[t] -> failwith "liste à un élt"
  |_::q -> List.hd(q)

let rec n_a_zero n =
 match n with
  |0 -> [0]
  |_ -> n::(n_a_zero n-1)

let zero_a_n =
 let rec p_a_n p = 
 if p=n then [n]
 else p::(p_a_n p+1)
in p_a_n 0

let rec indices e l =
 match l with
  |[] -> failwith "liste vide"
  |t::q -> if e=t then 0::List.map(fun x -> x+1) (indices e q)
	     else List.map(fun x -> x+1) (indices e q)

(* ex2 *)

let rec map f l =
 match l with
  |[] -> []
  |t::q -> f t::(map f q)

let flatten l = List.fold_right(fun t flat_q -> t@flat_q) l []

let rec fsts l =
 match l with
  |[] -> []
  |(t,_)::q -> t::fsts q

let fsts l = List.fold_right(fun (t,_) fsts_q -> t::fsts_q) l []

let rec split l = 
 match l with
  |[] -> []
  |(t,x)::q -> let (qf,qs) = split q in (t::qf,x::qs)

let split l = (List.map fsts l,List.map scds l)

let sup_doub l = List.fold_right(fun t q_sup -> if List.mem(q_sup,t) then q_sup
								  else t::q_sup) l []

 