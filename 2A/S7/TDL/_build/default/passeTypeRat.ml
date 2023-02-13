(* Module de la passe de typage           *)
(* doit être conforme à l'interface Passe *)
open Type 
open Exceptions
open Ast
open Tds

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme

let getRetour (InfoFun(_,tr,_)) = tr

let getTypeParam (InfoFun(_,_,tp)) = tp


let rec analyse_type_affect aff =
  match aff with
   | AstTds.Deref a -> 
    let (aa, t) = analyse_type_affect a in
    (AstType.Deref aa, t)
   | AstTds.Ident ia -> 
    match (info_ast_to_info ia) with
       | InfoVar (_,t,_,_) -> (AstType.Ident(ia),t)
       | InfoConst _ -> (AstType.Ident(ia),Int)
       | InfoFun _ -> failwith "éliminé par la passe des identifiants"
       | InfoLoop _ -> failwith "éliminé par la passe des identifiants"

let rec analyse_type_expression e =
  match e with
   |AstTds.AppelFonction(ia,el) ->
    begin
      let i = info_ast_to_info ia in
      let tr = getRetour(i) in
      let tp = getTypeParam(i) in
      let l = List.map (analyse_type_expression) el in 
      let le = List.map (fst) l in
      let lt = List.map (snd) l in
      if (est_compatible_list lt tp) then
        (AstType.AppelFonction(ia,le),tr)
      else
        raise (TypesParametresInattendus(lt, tp))
    end
   |AstTds.Ident(a) -> 
    let (aa,t) = analyse_type_affect a in
    (AstType.Ident(aa),t)
   | AstTds.Booleen(b) -> (AstType.Booleen(b),Bool)
   | AstTds.Entier(n) -> (AstType.Entier(n),Int)
   | AstTds.Binaire(bin, e1, e2) -> 
    begin
      let (a1,t1) = analyse_type_expression e1 in
      let (a2,t2) = analyse_type_expression e2 in
      match bin with
       |Fraction -> if t1!=Int || t2!=Int then 
                      raise (TypeBinaireInattendu (bin,t1,t2))
                    else 
                      (AstType.Binaire(Fraction,a1,a2),Rat)
       |Plus -> if (est_compatible t1 t2) && t1=Int then
                      (AstType.Binaire(PlusInt,a1,a2),Int)
                else if (est_compatible t1 t2) && t1=Rat then
                      (AstType.Binaire(PlusRat,a1,a2),Rat)
                else
                      raise (TypeBinaireInattendu (bin,t1,t2))
       |Mult -> if (est_compatible t1 t2) && t1=Int then
                  (AstType.Binaire(MultInt,a1,a2),Int)
                else if (est_compatible t1 t2) && t1=Rat then
                  (AstType.Binaire(MultRat,a1,a2),Rat)
                else
                  raise (TypeBinaireInattendu (bin,t1,t2))
       |Equ -> if (est_compatible t1 t2) && t1=Int then
                  (AstType.Binaire(EquInt,a1,a2),Bool)
               else if (est_compatible t1 t2) && t1=Bool then
                  (AstType.Binaire(EquBool,a1,a2),Bool)
               else
                  raise (TypeBinaireInattendu (bin,t1,t2))
       |Inf -> if (est_compatible t1 t2) && t1=Int then
                (AstType.Binaire(Inf,a1,a2),Bool)
               else
              raise (TypeBinaireInattendu (bin,t1,t2))
    end
    |AstTds.Ternaire(e1,e2,e3)-> 
    begin
      let (a1,t1) = analyse_type_expression e1 in
      let (a2,t2) = analyse_type_expression e2 in
      let (a3,t3) = analyse_type_expression e3 in
      if (est_compatible t2 t3) &&(t1=Bool) then
      ((AstType.Ternaire(a1,a2,a3),t2))
      else if not(est_compatible t2 t3) then raise (TypeInattendu(t2,t3))
      else raise (TypeInattendu(t1,Bool))
    end

    |Unaire(u,e1) -> let (a,t1) = analyse_type_expression e1 in 
    if est_compatible t1 Rat then 
      begin
      match u with
        | Numerateur -> (AstType.Unaire(Numerateur,a),Int)
        | Denominateur -> (AstType.Unaire(Denominateur,a),Int)
      end
    else 
      raise (TypeInattendu(t1,Rat))
    | Adresse ia ->
      begin 
      match (info_ast_to_info ia) with
      | InfoVar (_,t,_,_) -> (AstType.Ident(AstType.Ident(ia)),t)
      | InfoConst _ -> (AstType.Ident(AstType.Ident(ia)),Int)
      | _-> failwith "éliminé par la passe des identifiants"
      end
    | New(t) -> (AstType.New(t),t)
    | Null -> (AstType.Null,Undefined)

let rec analyse_type_instruction i = 
  match i with
   |AstTds.Declaration(t,info,e) -> 
    let (ne,te) = analyse_type_expression e in 
    if not (est_compatible t te) then
      raise (TypeInattendu (te,t))
    else
      modifier_type_variable te info;
      AstType.Declaration(info,ne)
   |AstTds.Affectation(a,e) ->
    begin
      let (ne,te) = analyse_type_expression e in
      let (na,ta) = analyse_type_affect a in
        if (est_compatible ta te) then
         AstType.Affectation(na,ne)
        else
          raise (TypeInattendu(te,ta))
    end
   |AstTds.Affichage(e) -> 
    begin
      let (ne,te)=analyse_type_expression e in
      match te with
       |Int -> AstType.AffichageInt(ne)
       |Bool -> AstType.AffichageBool(ne)
       |Rat -> AstType.AffichageRat(ne)
       |_ -> failwith "erreur"
    end
   |AstTds.Conditionnelle(e,b1,b2) ->
    begin
      let (ne,te) = analyse_type_expression e in
      if est_compatible te Bool then
        let nb1=analyse_type_bloc b1 in
        let nb2 = analyse_type_bloc b2 in
        AstType.Conditionnelle(ne,nb1,nb2)
      else
        raise (TypeInattendu (te,Bool))
    end
   |AstTds.TantQue(e,b) -> 
    let (ne,te) = analyse_type_expression e in 
    let nb = analyse_type_bloc b in
    if (est_compatible te Bool) then
      AstType.TantQue(ne,nb)
    else
      raise (TypeInattendu (te,Bool))
   |AstTds.Retour(e,ia) -> 
    begin
     let (ne,te) = analyse_type_expression e in 
     match info_ast_to_info ia with
     |InfoFun(_,t,_) -> 
      if (est_compatible t te) then
        AstType.Retour(ne,ia)
      else
        raise (TypeInattendu(te,t))
     |_ -> failwith "erreur"
    end
   |AstTds.Empty -> AstType.Empty
   |AstTds.Loop(b) ->let nb = analyse_type_bloc b in
     AstType.Loop(nb)
   | AstTds.LoopId (ia,b) -> 
    begin
      let nb = analyse_type_bloc b in
      AstType.LoopId(ia,nb)
    end
   | AstTds.Break -> AstType.Break
   | AstTds.BreakId(ia) -> AstType.BreakId ia
   |AstTds.Conditionnelleopt(e,b1)-> 
    begin
    let (ne,te) = analyse_type_expression e in
    if est_compatible te Bool then
      let nb1=analyse_type_bloc b1 in
      AstType.Conditionnelleopt(ne,nb1)
    else
      raise (TypeInattendu (te,Bool))
    end

and analyse_type_bloc b = List.map (analyse_type_instruction) b 

let analyse_type_fonction (AstTds.Fonction(t,ia,l,b)) = 
  let (nt, nlp) = List.fold_right (fun (typ, info) (acc1, acc2) -> modifier_type_variable typ info; (typ::acc1, info::acc2)) l ([], []) in
  modifier_type_fonction t nt ia;
  AstType.Fonction(ia, nlp, analyse_type_bloc b)

let analyser (AstTds.Programme (fonctions,prog)) =
  let nf = List.map (analyse_type_fonction) fonctions in
  let nb = analyse_type_bloc prog in
  AstType.Programme (nf,nb)







