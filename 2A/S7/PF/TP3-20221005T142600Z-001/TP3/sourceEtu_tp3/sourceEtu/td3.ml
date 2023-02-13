(* ex 1 *)

type 'a arbre = Node of (boal*('a branche) list)

type 'a branche = 'a*'a arbre

(* ex 2 *)

let rec recherche a l =
 match l with
  |[] -> None
  |(b,abr)::q -> if a<b then recherche a q
                 else if b>a then None
                 else
                   some abr

let rec appartient l Node(b,abr) =
 match l with
  |[] -> b
  |t::q -> match recherche t abr with
		|None -> false
		|Some a -> appartient q a

(* ex 3 *)

let rec  maj (e,se) l =
 match l with
  |[] -> [(e,se)]
  |(x,a)::q -> if e<x then (e,se)::(x,a)::q
               else if e=x then (e,se)::q
               else
                   (x,a)::(maj (e,se) q)

let rec ajout l Node(b,fils) = 
 match l with
  |[] -> Node(true,fils)
  |t::q -> match recherche t fils with
            |None -> Node(b,maj(t,ajout q Node(false,[]) fils)
            |Some a -> Node(b,maj(t,ajout q a) fils)
