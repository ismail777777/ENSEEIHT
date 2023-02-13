(*** Combinaisons d'une liste ***)

(* CONTRAT 
Fonction qui génère toutes les combinaisons de k éléments dans une liste l
Paramètre k : le nombre d'éléments des combinaisons générées
Paramètre l : une liste d'entiers
Résultat : liste de toutes les combinaisons de k éléments possibles dans la liste l

*)
let rec combinaison k l =
  match k with 
    | 0 -> [[]]
    | _ -> if k < 0 then 
             failwith "erreur k < 0"
           else
             match l with
              |[] -> []
              |t::q -> (List.map(fun l0 -> t::l0) (combinaison (k-1) q))@(combinaison k q)
           
             


(* TESTS *)
(* TO DO *)
let%test _ = combinaison 0 [1;2;3;4] = [[]]
let%test _ = combinaison 2 [] = []
let%test _ = combinaison 3 [1;2;3;4] = [[1;2;3];[1;2;4];[1;3;4];[2;3;4]]
let%test _ = combinaison 2 [1;2;3;4] = [[1;2];[1;3];[1;4];[2;3];[2;4];[3;4]]
let%test _ = combinaison 4 [1;2;3;4] = [[1;2;3;4]]
let%test _ = combinaison 3 [1;2;3;4;5] = [[1; 2; 3]; [1; 2; 4]; [1; 2; 5]; [1; 3; 4]; [1; 3; 5]; [1; 4; 5]; [2; 3; 4];
 [2; 3; 5]; [2; 4; 5]; [3; 4; 5]]