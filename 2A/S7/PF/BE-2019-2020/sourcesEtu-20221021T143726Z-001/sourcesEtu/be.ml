(*  Exercice 1 **)

let p0 = [2.5]
let p1 = [2.;3.]
let p2 = [2.;5.5;-2.]
let p3 = [4.5;6.;-3.5;-8.]


(* evalue : float -> float list -> float          *)
(* Evalue un polynome pour une valeur donnée de x *)
(* Paramètres : - x : float, la valeur pour laquelle on veut évaluer le polynome *)
(*              - l : float list, liste des coefficients du polynome *)
(* Résultat : float, la valeur du polynome en x   *)
let evalue x l = (List.fold_right(fun t y-> (t +. y) *. x) (List.tl l) 0.) +. (List.hd l)


(* retract : float list -> float list
Prend un polynome et supprime les coéfficients nuls inutiles (ceux de la fin de la liste)
poly : un polynome codé avec une float list
Retour : équivalent à poly sans zéro superflu
*)

let retract l = List.fold_right(fun t l -> match l with
                                  |[] -> if t = 0. then []
                                  else [t]
                                  |x::q -> t::x::q) l []

let%test _ = retract p0 = p0
let%test _ = retract p1 = p1
let%test _ = retract p2 = p2
let%test _ = retract p3 = p3
let%test _ = retract [2.;0.;0.;0.;0.;0.] = [2.]
let%test _ = retract [2.;0.;0.;0.;0.;2.] = [2.;0.;0.;0.;0.;2.]
let%test _ = retract [2.;0.;0.;0.;0.;2.;0.;0.] = [2.;0.;0.;0.;0.;2.]
let%test _ = retract [2.;0.;0.;0.;0.;2.;0.] = [2.;0.;0.;0.;0.;2.]
let%test _ = retract [2.;3.;0.;0.;0.;0.] = [2.;3.]
let%test _ = retract [2.;5.;-2.;0.;0.;0.] = [2.;5.;-2.]
let%test _ = retract [4.;6.;-3.;-8.;0.;0.] = [4.;6.;-3.;-8.]


(* scal_mult : float -> float liste -> float list
Fonction qui multiplie un polynome par un scalaire
Parametre x : un réel
Paramètre poly : un polynome codé avec une float list
Résultat : x * poly, un polynome
*)

let scal_mult a l = List.map(fun t -> a*.t) l

let%test _ = scal_mult 0. p0 = []
let%test _ = scal_mult 0. p1 = []
let%test _ = scal_mult 0. p2 = []
let%test _ = scal_mult 0. p3 = []
let%test _ = scal_mult 1. p0 = p0
let%test _ = scal_mult 1. p1 = p1
let%test _ = scal_mult 1. p2 = p2
let%test _ = scal_mult 1. p3 = p3
let%test _ = scal_mult 2. p0 = [5.]
let%test _ = scal_mult 2. p1 = [4.;6.]
let%test _ = scal_mult 2. p2 = [4.;11.;-4.]
let%test _ = scal_mult 2. p3 = [9.;12.;-7.;-16.]

(* plus : float list -> float list -> float list
Fonction qui fait la somme de deux polynomes
Paramètre poly1, poly2 : deux polynomes codés avec une float list
Resultat : un polynome, somme de poly1 et poly2
*)

let rec plus l1 l2 =
match l1,l2 with
 |[],[] -> []
 |[],_ -> l2
 |_,[] -> l1
 |t1::q1,t2::q2 -> (t1+.t2)::(plus q1 q2)

let%test _ = plus p0 p0 = [5.]
let%test _ = plus p0 p1 = [4.5;3.]
let%test _ = plus p0 p2 = [4.5;5.5;-2.]
let%test _ = plus p0 p3 = [7.;6.;-3.5;-8.]
let%test _ = plus p1 p0 = plus p0 p1
let%test _ = plus p1 p1 = [4.;6.]
let%test _ = plus p1 p2 = [4.;8.5;-2.]
let%test _ = plus p1 p3 = [6.5;9.;-3.5;-8.]
let%test _ = plus p2 p0 = plus p0 p2
let%test _ = plus p2 p1 = plus p1 p2
let%test _ = plus p2 p2 = [4.;11.;-4.]
let%test _ = plus p2 p3 = [6.5;11.5;-5.5;-8.]
let%test _ = plus p3 p0 = plus p0 p3
let%test _ = plus p3 p1 = plus p1 p3
let%test _ = plus p3 p2 = plus p2 p3
let%test _ = plus p3 p3 = [9.;12.;-7.;-16.]
let%test _ = plus p3 [-4.5;-6.;3.5;8.] = []
let%test _ = plus p3 [-4.5;-6.;3.5] = [0.;0.;0.;-8.]
let%test _ = plus p3 [0.;-6.;3.5;8.] = [4.5]
let%test _ = plus p3 [0.;0.;3.5;8.] = [4.5;6.]
let%test _ = plus p3 [0.;0.;0.;8.] = [4.5;6.;-3.5]


(* Exercice 2 *)

open Util

(* Arbre d'encodage : arbre ternaire *)
type arbre_encodage = Vide | Lettre of char | Noeud of arbre_encodage * arbre_encodage * arbre_encodage

(* Arbre d'encodage complexe du sujet 
Permet de coder les mots sur {'a','b','c','d','e','f'} 
en codant le 'a' par 3, le 'b' par 12, le 'c' par 212, le 'd' par 22, le 'e' par 11 et le 'f' par 213
*)
let arbre_sujet =
  Noeud (
          Noeud (Lettre 'e',Lettre 'b',Vide) ,
          Noeud (
                Noeud (Vide, Lettre 'c', Lettre 'f'),
                Lettre 'd',
                Vide),
          Lettre 'a'
        )

(* Arbre d'encodage simple du sujet
Permet de coder les mots sur {'a','b','c'} 
en codant le 'a' par 1, le 'b' par 2 et le 'c' par 3*)
let arbre_simple =
  Noeud (Lettre 'a', Lettre 'b', Lettre 'c')


(* Exception levée quand le code ne peut pas être décodé avec l'arbre d'encodage *)
exception CodeNonValide

(* decoder : int -> arbre_encodage -> string
Décode un entier en utilisant l'abre d'encodage
Paramètre code : l'entier à décoder
Paramètre arbre : l'arbre d'encodage
Retour : la chaîne de caractère correspondant à l'entier
Erreur si le code ne peut pas être décodé avec l'arbre d'encodage
*)
(*let rec decoder code abr = let a0=abr in let rec aux_decoder l a =
  match l with
   |[] ->  (match a with
             |Lettre char -> [char]
             |_ -> [])
   |t::q -> match a with
             |Vide -> []
             |Lettre char -> [char]@(aux_decoder (t::q) a0)
             |Noeud(a1,a2,a3) -> if t=1 then (aux_decoder q a1)
                                 else if t=2 then (aux_decoder q a2)
                                 else if t=3 then (aux_decoder q a3)
                                 else
                                  raise CodeNonValide
  (*match l,a with
   |_,Vide -> raise CodeNonValide
   |[],Lettre char -> [char]
   |i::q,Lettre char -> [char]@(aux_decoder l a0)
   |1::q,Noeud(a1,a2,a3) -> aux_decoder q a1
   |2::q,Noeud(a1,a2,a3) -> aux_decoder q a2
   |3::q,Noeud(a1,a2,a3) -> aux_decoder q a3
   |_ -> raise CodeNonValide*)
in recompose_chaine (aux_decoder (decompose_int code) abr)*)
let rec decoder code abr = let a0=abr in let rec aux_decoder l a =
  match a with
  |Vide -> raise CodeNonValide
  |Lettre x -> if l = [] then [x]
      else if a0 = a then raise CodeNonValide
      else [x]@(aux_decoder l a0)
  |Noeud(a1,a2,a3) -> match l with
    |[] -> raise CodeNonValide
    |t::q -> if t=1 then (aux_decoder q a1)
        else if t=2 then (aux_decoder q a2)
        else if t=3 then (aux_decoder q a3)
        else
          raise CodeNonValide
in recompose_chaine (aux_decoder (decompose_int code) abr)



let%test _ = decoder 123212 arbre_simple = "abcbab"
let%test _ = decoder 123212 arbre_sujet = "bac"
let%test _ = decoder 123 arbre_simple = "abc"
let%test _ = decoder 123 arbre_sujet = "ba"
let%test _ = decoder 321321 arbre_simple = "cbacba"
let%test _ = try let _ = decoder 321321 arbre_sujet in false with CodeNonValide -> true
let%test _ = try let _ = decoder 457 arbre_simple in false with CodeNonValide -> true

(* arbre_to_liste : arbre_encodage -> (char*int) list
  Converti un arbre d'encodage en une liste associative (caractère, code)
  Paramètre a : l'abre à convertir
  Retour la liste  associative (caractère, code)
*)
let rec arbre_to_liste a = let rec aux_arbre2liste abr =
  match abr with
   |Vide -> []
   |Lettre c -> [(c,[])]
   |Noeud(a1,a2,a3) -> let ajout e l = List.map(fun (x,y) -> (x,e::y)) l in 
    (ajout 1 (aux_arbre2liste a1))@(ajout 2 (aux_arbre2liste a2))@(ajout 3 (aux_arbre2liste a3))
in List.map(fun (x,y) -> (x,recompose_int y)) (aux_arbre2liste a)
let liste_arbre_simple = arbre_to_liste arbre_simple
let%test _ = List.length liste_arbre_simple =3
let%test _ = List.mem ('a',1) liste_arbre_simple
let%test _ = List.mem ('b',2) liste_arbre_simple
let%test _ = List.mem ('c',3) liste_arbre_simple

let liste_arbre_sujet = arbre_to_liste arbre_sujet
let%test _ = List.length liste_arbre_sujet =6
let%test _ = List.mem ('a',3) liste_arbre_sujet
let%test _ = List.mem ('b',12) liste_arbre_sujet
let%test _ = List.mem ('c',212) liste_arbre_sujet
let%test _ = List.mem ('d',22) liste_arbre_sujet
let%test _ = List.mem ('e',11) liste_arbre_sujet
let%test _ = List.mem ('f',213) liste_arbre_sujet

(* Exception levée quand le mot ne peut pas être encodé avec l'arbre d'encodage *)
exception MotNonValide


(* encoder : string -> arbre_encodage -> int
Encode un mot à l'aide d'un arbre d'encodage
Paramètre mot : le mot à encoder
Paramètre arbre : l'arbre d'encodage
Retour : le code associé au mot
Erreur si le mot ne peut pas être encodé avec l'arbre d'encodage
*)
let rec encoder1 c a = let rec encoder_char ch l =
    match l with
    |[] -> raise MotNonValide
    |(tc,te)::q ->  if ch=tc then te
                    else encoder_char ch q

in match (decompose_chaine c) with
 |[] -> []
 |t::q -> [encoder_char t (arbre_to_liste a)]@(encoder1 (recompose_chaine q) a)

 let encoder c a = recompose_int (encoder1 c a)
(*int_of_string(string_of_int n1 ^ string of int n2)*)

let%test _ = encoder "abcbab" arbre_simple = 123212
let%test _ = encoder "bac" arbre_sujet = 123212
let%test _ = encoder "abc" arbre_simple = 123
let%test _ = encoder "ba" arbre_sujet = 123
let%test _ = encoder "cbacba" arbre_simple = 321321
let%test _ = try let _ = encoder "dab" arbre_simple in false with MotNonValide -> true 
let%test _ = try let _ = encoder "zut" arbre_simple in false with MotNonValide -> true 


(* fold :  COMPLETER
Itérateur fold pour les arbres d'encodage
*)
let fold  = fun _ -> assert false

(* arbre_encodage : arbre_encodage -> int
Fonction qui calcule le nombre de lettres présentent dans un arbre d'encodage
Paramètre : l'arbre d'encodage
Retour : le nombre de lettre
*)

let nbLettres  = fun _ -> assert false

let%test _ = nbLettres arbre_simple = 3
let%test _ = nbLettres arbre_sujet = 6


(* lettres :  arbre_encodage -> char list
Fonction qui renvoie la liste des lettres présentent dans un arbre d'encodage
Paramètre : l'arbre d'encodage
Retour : la liste de lettre
*)
let lettres  = fun _ -> []

let lettres_arbre_simple = lettres arbre_simple
let%test _ = List.length lettres_arbre_simple = 3
let%test _ = List.mem 'a' lettres_arbre_simple
let%test _ = List.mem 'b' lettres_arbre_simple
let%test _ = List.mem 'c' lettres_arbre_simple

let lettres_arbre_sujet = lettres arbre_sujet
let%test _ = List.length lettres_arbre_sujet = 6
let%test _ = List.mem 'a' lettres_arbre_sujet
let%test _ = List.mem 'b' lettres_arbre_sujet
let%test _ = List.mem 'c' lettres_arbre_sujet
let%test _ = List.mem 'd' lettres_arbre_sujet
let%test _ = List.mem 'e' lettres_arbre_sujet
let%test _ = List.mem 'f' lettres_arbre_sujet


(* arbre_to_liste_2 : arbre_encodage -> (char*int) list
  Converti un arbre d'encodage en une liste associative (caractère, code)
  Paramètre a : l'abre à convertir
  Retour la liste  associative (caractère, code)
*)
let arbre_to_liste_2 = fun _ -> []


let liste_arbre_simple_2 = arbre_to_liste_2 arbre_simple
let%test _ = List.length liste_arbre_simple_2 =3
let%test _ = List.mem ('a',1) liste_arbre_simple_2
let%test _ = List.mem ('b',2) liste_arbre_simple_2
let%test _ = List.mem ('c',3) liste_arbre_simple_2

let liste_arbre_sujet_2 = arbre_to_liste_2 arbre_sujet
let%test _ = List.length liste_arbre_sujet_2 =6
let%test _ = List.mem ('a',3) liste_arbre_sujet_2
let%test _ = List.mem ('b',12) liste_arbre_sujet_2
let%test _ = List.mem ('c',212) liste_arbre_sujet_2
let%test _ = List.mem ('d',22) liste_arbre_sujet_2
let%test _ = List.mem ('e',11) liste_arbre_sujet_2
let%test _ = List.mem ('f',213) liste_arbre_sujet_2
