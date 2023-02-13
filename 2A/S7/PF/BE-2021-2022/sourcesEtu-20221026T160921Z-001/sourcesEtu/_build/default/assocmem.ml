open Util
open Mem

(* get_assoc: retourne la valeur associée à la clef e dans la liste l
   ou def si la clef n'existe pas
   Type : 'a -> ('a*'b) list -> 'b -> 'b
   Paramètres : e : la clef
                l : liste associative
                def : valeur retournée si la clef n'est pas dans la liste
   Résultat : La valeur associée à la clef e ou def si e n'existe pas
 *)
let rec get_assoc e l def = match l with
 |[] -> def
 |(a,b)::q -> if e=a then b
 else
    get_assoc e q def

(* Tests unitaires : TODO *)
let%test _ = get_assoc 4 [] 'd' = 'd'
let%test _ = get_assoc 2 [(1,'a');(2,'b')] 'e' = 'b'
let%test _ = get_assoc 5 [(1,'r');(3,'y');(5,'g')] 'f' = 'g'
let%test _ = get_assoc 4 [(1,'r');(3,'y');(5,'g')] 'f' = 'f'
(* set_assoc : Remplace la valeur associée à la clef e dans la liste l
   par x, ou ajoute (e,x) si la clef e n'existe pas
   Type : 'a -> ('a*'b) list -> 'b -> ('a*'b) list
   Paramètres : e : la clef
                x : nouvelle valeur associée à la clef e
                l : la liste associative
   Résultat : La liste associative avec la valeur associée à e modifiée ou 
   le couple (e,x) ajoutée si e n'exixstais pas déjà dans l
 *)
let rec set_assoc e l x = match l with
 |[] -> [(e,x)]
 |(a,b)::q -> if e=a then (a,x)::q
 else
    (a,b)::(set_assoc e q x)

(* Tests unitaires : TODO *)
let%test _ = set_assoc 4 [] 'd' = [(4,'d')]
let%test _ = set_assoc 2 [(1,'a');(2,'b')] 'e' = [(1,'a');(2,'e')]
let%test _ = set_assoc 5 [(1,'r');(3,'y');(5,'g')] 'f' = [(1,'r');(3,'y');(5,'f')]
let%test _ = set_assoc 4 [(1,'r');(3,'y');(5,'g')] 'f' = [(1,'r');(3,'y');(5,'g');(4,'f')]

module AssocMemory : Memory =
struct
    (* Type = liste qui associe des adresses (entiers) à des valeurs (caractères) *)
    type mem_type = (int*char) list (* TODO *)

    (* Un type qui contient la mémoire + la taille de son bus d'adressage *)
    type mem = int * mem_type

    (* Nom de l'implémentation *)
    let name = "assoc"

    (* Taille du bus d'adressage *)
    let bussize (bs, _) = bs

    (* Taille maximale de la mémoire *)
    let size (bs, _) = pow2 bs

    (* Taille de la mémoire en mémoire *)
    let allocsize (bs, m) = 2*(List.length m)

    (* Nombre de cases utilisées *)
    let busyness (bs, m) = List.fold_right(fun (_,t) b -> if t = _0 then b
                                                          else
                                                            1+b) m 0

    (* Construire une mémoire vide *)
    let clear bs = let rec clear_aux n = 
      if n=0 then [(0,_0)]
      else
        (n,_0)::clear_aux (n-1)
    in (bs,clear_aux ((pow2 bs)-1))

    (* Lire une valeur *)
    let read (bs, m) addr = if List.mem addr (List.map(fst) m) then get_assoc addr m _0
    else
      raise OutOfBound

    (* Écrire une valeur *)
    let write (bs, m) addr x =
    if List.mem addr (List.map(fst) m) then (bs,set_assoc addr m x)
    else
      raise OutOfBound

end
