(* Module de la passe de placement mémoire *)
(* doit être conforme à l'interface Passe *)
open Type 
open Exceptions
open Ast
open Tds

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme

let getRetour (InfoFun(_,tr,_)) = tr

let getTypeParam (InfoFun(_,_,tp)) = tp

let getType ia =
  match info_ast_to_info ia with
  | InfoVar(_,t,_,_) ->  t
  | InfoConst _ -> Int
  | _ -> failwith "erreur"


let get_taille i = 
  match i with
   |AstType.Declaration(info,e) -> getTaille(getType info)
   | _ -> 0

  let rec analyse_placement_affect a =
   match a with
    | AstType.Deref aff -> AstPlacement.Deref (analyse_placement_affect aff)
    | AstType.Ident info -> AstPlacement.Ident info

let rec analyse_placement_instruction dep reg i = 
  match i with
   |AstType.Declaration(ia,e) -> 
    modifier_adresse_variable dep reg ia;
    (AstPlacement.Declaration(ia,e),get_taille i)
   |AstType.Conditionnelle(e,b1,b2) ->
    let nb1 = analyse_placement_bloc dep reg b1 in
    let nb2 = analyse_placement_bloc dep reg b2 in 
    (AstPlacement.Conditionnelle(e,nb1,nb2),0)
   |AstType.TantQue(e,b) -> 
    let nb = analyse_placement_bloc dep reg b in
    (AstPlacement.TantQue(e,nb),0)
   |AstType.Retour(e,ia) -> 
    begin
    match info_ast_to_info ia with
     |InfoFun(_,t,tp) -> (AstPlacement.Retour(e,getTaille t,List.fold_left (+) 0 (List.map(getTaille) tp)),0)
     |_ -> failwith "erreur"
    end
   |AstType.Affectation(a,e) -> (AstPlacement.Affectation(analyse_placement_affect a,e),0)
   |AstType.AffichageBool(e) -> (AstPlacement.AffichageBool(e),0)
   |AstType.AffichageInt(e) -> (AstPlacement.AffichageInt(e),0)
   |AstType.AffichageRat(e) -> (AstPlacement.AffichageRat(e),0)
   |AstType.Empty -> (AstPlacement.Empty,0)
   |AstType.Loop(b) ->
    let nb = analyse_placement_bloc dep reg b in 
    (AstPlacement.Loop(nb),0)
   |AstType.LoopId(n,b) -> 
    let nb = analyse_placement_bloc dep reg b in 
    (AstPlacement.LoopId(n,nb),0)
   |AstType.Break -> (AstPlacement.Break,0)
   |AstType.BreakId(n) -> (AstPlacement.BreakId(n),0)
   |AstType.Conditionnelleopt(e,b1) ->
    let nb1 = analyse_placement_bloc dep reg b1 in
    (AstPlacement.Conditionnelleopt(e,nb1),0)


and analyse_placement_bloc dep reg b = 
begin
match b with
 |[] -> ([],0)
 |ti::q-> 
  let (ni,_) = analyse_placement_instruction dep reg ti in 
  let (nq,nt) = analyse_placement_bloc ((get_taille ti)+dep) reg q in
  (ni::nq,nt+(get_taille ti))
  (*match ti with
  | AstType.Loop(b) -> 
   let nb = analyse_placement_bloc dep reg b in 
   (AstPlacement.Loop(nb)::nq,nt+(get_taille ti))
  | AstType.LoopId(n,b) -> 
   let nb = analyse_placement_bloc dep reg b in 
   (AstPlacement.LoopId(n,nb)::nq,nt+(get_taille ti))
  | AstType.Break -> (AstPlacement.Break::nq,nt+(get_taille ti))
  | AstType.BreakId(n) -> (AstPlacement.BreakId(n)::nq,nt+(get_taille ti))
  | _ -> (ni::nq,nt+(get_taille ti))*)
end

let analyse_placement_fonction (AstType.Fonction(info, lp, b)) =
  let rec placer_parametres params offset =
    match params with
      | [] -> ()
      | p::q ->
        begin
          match info_ast_to_info p with
            | InfoVar(_, t, _, _) ->
              modifier_adresse_variable (offset - getTaille t) "LB" p;
              placer_parametres q (offset - getTaille t)
            | _ -> failwith "Erreur interne"
        end
  in
  placer_parametres (List.rev lp) 0;
  let nb = analyse_placement_bloc 3 "LB" b in
  (AstPlacement.Fonction(info, lp, nb))


let analyser (AstType.Programme (fonctions,prog)) =
  let nf = List.map (analyse_placement_fonction) fonctions in
  let nb = analyse_placement_bloc 0 "SB" prog in
  AstPlacement.Programme (nf,nb)
