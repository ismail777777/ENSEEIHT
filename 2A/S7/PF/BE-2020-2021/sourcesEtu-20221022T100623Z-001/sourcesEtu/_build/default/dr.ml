(*  Module qui permet la décomposition et la recomposition de données **)
(*  Passage du type t1 vers une liste d'éléments de type t2 (décompose) **)
(*  et inversement (recopose).**)
module type DecomposeRecompose =
sig
  (*  Type de la donnée **)
  type mot
  (*  Type des symboles de l'alphabet de t1 **)
  type symbole

  val decompose : mot -> symbole list
  val recompose : symbole list -> mot
end

module DRString : DecomposeRecompose with type mot = string and type symbole = char =
struct
  type mot = string
  type symbole = char
  let decompose s = let rec decompose i accu =
    if i < 0 then accu
    else decompose (i-1) (s.[i]::accu)
  in decompose (String.length s - 1) []

  let recompose lc = List.fold_right (fun t q -> String.make 1 t ^ q) lc ""
end

module DRNat : DecomposeRecompose with type mot = int and type symbole = int =
struct
  type mot = int
  type symbole = int
  let rec decompose n =
    if n<10 then [n]
    else decompose (n/10)@[n mod 10]
  let recompose l = int_of_string (List.fold_right(fun a b -> a^b) (List.map string_of_int l) "")
end