(* Module de la passe de placement mémoire *)
(* doit être conforme à l'interface Passe *)
open Type 
open Exceptions
open Ast
open Tds
open Tam
open Code

type t1 = Ast.AstPlacement.programme
type t2 = string

let getType ia =
  match info_ast_to_info ia with
  | InfoVar(_,t,_,_) ->  t
  | InfoConst _ -> Int
  | _ -> failwith "erreur"

let getDep (InfoVar(_,_,dep,_)) = dep 

let getReg (InfoVar(_,_,_,reg)) = reg

let rec analyse_code_instruction i =
  match i with
   |AstPlacement.Empty -> ""
   |AstPlacement.Declaration(ia,e) -> 
    Tam.push (getTaille(getType ia))
    ^ analyse_code_expression e
    ^ Tam.store (getTaille(getType ia)) (getDep(info_ast_to_info ia)) (getReg(info_ast_to_info ia))
   |AstPlacement.Affectation(a,e) ->
    begin
    match a with
    | AstPlacement.Ident ia -> 
      analyse_code_expression e
    ^ Tam.store (getTaille(getType ia)) (getDep(info_ast_to_info ia)) (getReg(info_ast_to_info ia))
    | _ -> failwith "e"
    end

   |AstPlacement.Conditionnelle(e,b1,b2) ->
    let etiqSinon = getEtiquette() in 
    let etiqFin = getEtiquette() in 
    analyse_code_expression e
    ^ Tam.jumpif 0 etiqSinon
    ^ analyse_code_bloc b1
    ^ Tam.jump etiqFin
    ^ etiqSinon ^ "\n"
    ^ analyse_code_bloc b2
    ^ etiqFin ^ "\n"
   |AstPlacement.TantQue(e,b) -> 
    let etiqDebut = getEtiquette() in
    let etiqFin = getEtiquette() in
    etiqDebut ^ "\n"
    ^ analyse_code_expression e
    ^ Tam.jumpif 0 etiqFin
    ^ analyse_code_bloc b
    ^ Tam.jump etiqDebut
    ^ etiqFin ^ "\n"
   |AstPlacement.AffichageBool e ->
    analyse_code_expression e
    ^ Tam.subr "BOut"
   |AstPlacement.AffichageInt e ->
    analyse_code_expression e
    ^ Tam.subr "IOut"
   |AstPlacement.AffichageRat e ->
    analyse_code_expression e
    ^ Tam.call "ST" "ROut"
   |AstPlacement.Retour(e,tr,tp) ->
    analyse_code_expression e
    ^ Tam.return tr tp
   |AstPlacement.Conditionnelleopt(e,b1) ->
      let etiqSinon = getEtiquette() in 
      let etiqFin = getEtiquette() in 
      analyse_code_expression e
      ^ Tam.jumpif 0 etiqSinon
      ^ analyse_code_bloc b1
      ^ Tam.jump etiqFin
      ^ etiqSinon ^ "\n"
      ^ etiqFin ^ "\n"
   |AstPlacement.Loop(b) ->
      let etiqDebut = getEtiquette() in
      let etiqFin = getEtiquette() in
      etiqDebut ^ "\n"
      ^ analyse_code_bloc b
      ^ Tam.jump etiqDebut
      ^ etiqFin ^ "\n"
   |AstPlacement.LoopId(n,b) -> 
    begin
    match info_ast_to_info n with 
     |InfoLoop(id) ->
      let etiqDebut = id in
      let etiqFin = getEtiquette() in
      etiqDebut ^ "\n"
      ^ analyse_code_bloc b
      ^ Tam.jump etiqDebut
      ^ etiqFin ^ "\n"
     |_ -> ""
     end
   |AstPlacement.Break -> ""
   |AstPlacement.BreakId(n) -> ""

and analyse_code_bloc (li,taille) =
    String.concat " " (List.map analyse_code_instruction li)
    ^ Tam.pop 0 taille

and analyse_code_expression e =
    match e with
     |AstType.Booleen(b) -> 
      if b then
        Tam.loadl_int 1
      else
        Tam.loadl_int 0
     |AstType.Entier(n) -> Tam.loadl_int n
     |AstType.Unaire(u,e) ->
      begin
        analyse_code_expression e
        ^ match u with
          |Numerateur -> Tam.pop 0 1
          |Denominateur -> Tam.pop 1 1
      end
     |AstType.Binaire(b,e1,e2) ->
      begin
        analyse_code_expression e1 ^ analyse_code_expression e2
        ^ match b with
         |Fraction -> Tam.call "LB" "norm"
         |PlusInt -> Tam.subr "IAdd"
         |PlusRat -> Tam.call "LB" "RAdd"
         |MultInt -> Tam.subr "IMul"
         |MultRat -> Tam.call "LB" "RMul"
         |Inf -> Tam.subr "ILss"
         |EquBool -> Tam.subr "IEq"
         |EquInt -> Tam.subr "IEq"
      end
     |AstType.Ident(a) -> 
      begin
      analyse_code_aff a
      (*match info_ast_to_info ia with
       |InfoVar(_,t,dep,reg) -> Tam.load (getTaille t) dep reg
       |InfoConst(_,n) -> Tam.loadl_int n
       |_ -> failwith " "*)
      end
     |AstType.AppelFonction(ia,l) ->
      begin
      match info_ast_to_info ia with
       |InfoFun(n,_,_) -> String.concat " " (List.map analyse_code_expression l) ^ Tam.call "ST" n
       |_ -> failwith " "
      end
     | AstType.Adresse ia ->
        begin 
        match (info_ast_to_info ia) with
        | InfoVar (_,t,dep,reg) -> Tam.load (getTaille t) dep reg
        | InfoConst (_,n) -> Tam.loadl_int n
        | _-> failwith "éliminé par la passe des identifiants"
        end
     | AstType.New(t) -> failwith "e"
     | AstType.Null -> failwith "e"
     | AstType.Ternaire(e1,e2,e3) -> failwith "e"
and analyse_code_aff a = match a with
    | AstType.Deref aff -> analyse_code_aff aff
    | AstType.Ident ia -> 
      match (info_ast_to_info ia) with
         | InfoVar(_,t,dep,reg) -> Tam.load (getTaille t) dep reg
         | InfoConst(_,n) -> Tam.loadl_int n
         | _ -> failwith "éliminé par la passe des identifiants"

let analyse_code_fonction (AstPlacement.Fonction(ia, _, (l, _))) =
  match info_ast_to_info ia with
   | InfoFun(n, _, _) ->
    n ^ "\n"
    ^ String.concat "" (List.map analyse_code_instruction l)
    ^ Tam.halt
   | _ -> failwith "erreur"

let analyser (AstPlacement.Programme (fonctions,prog)) =
  getEntete()
  ^ String.concat "" (List.map analyse_code_fonction fonctions)
  ^ "main\n"
  ^ analyse_code_bloc prog
  ^ Tam.halt