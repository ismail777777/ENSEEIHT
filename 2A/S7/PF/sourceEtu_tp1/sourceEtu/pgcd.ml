(* Exercice 5 *)
(* PGCD -> pgcd.ml *)
(* pgcd : int -> int -> int *)
(* calcule le PGCD de deux nombres entiers *)
(* a : int le premier entier *)
(* b : int le deuxième entier*)
(* renvoie int; le pgcd de a et b *)
(* précondition : a!=0 || b!=0 *)

let rec pgcd a b =
  let abs t =
     if t > 0 then
        t
     else
        -t
  in
  if abs a = abs b then
     abs a
  else if abs a > abs b then
     pgcd (abs a - abs b) (abs b)
  else
     pgcd (abs a) (abs b - abs a)

let%test _ = pgcd 5 5 = 5
let%test _ = pgcd 45 5 = 5
let%test _ = pgcd 45 (-56) = 1
let%test _ = pgcd 295 68 = 1
let%test _ = pgcd (-48) 200 = 8

