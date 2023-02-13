(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast

type t1 = Ast.AstSyntax.programme
type t2 = Ast.AstTds.programme


let rec analyse_tds_affect tds modif aff =
  match aff with
   | AstSyntax.Deref a -> AstTds.Deref (analyse_tds_affect tds modif a)
   | AstSyntax.Ident s -> 
    begin
    match Tds.chercherGlobalement tds s with
     | None -> raise (IdentifiantNonDeclare s)
     | Some info -> 
      begin
      match (Tds.info_ast_to_info info) with
        |InfoFun _ -> raise (MauvaiseUtilisationIdentifiant s)
        |InfoVar _ -> AstTds.Ident(info)
        |InfoConst _ -> if modif then raise (MauvaiseUtilisationIdentifiant s) (*failwith "erreur"*)else AstTds.Ident(info)
        | _ -> failwith "erreur"
      end
    end

(* analyse_tds_expression : tds -> AstSyntax.expression -> AstTds.expression *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre e : l'expression à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'expression
en une expression de type AstTds.expression *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_expression tds e =
  match e with
   | AstSyntax.Ident(a) -> AstTds.Ident(analyse_tds_affect tds false a)
   | AstSyntax.Booleen(b) -> AstTds.Booleen(b)
   | AstSyntax.Entier(n) -> AstTds.Entier(n)
   | AstSyntax.Unaire(u,e1) -> AstTds.Unaire(u, analyse_tds_expression tds e1)
   | AstSyntax.Binaire(bin,e1,e2) -> AstTds.Binaire(bin, analyse_tds_expression tds e1, analyse_tds_expression tds e2)
   | AstSyntax.Ternaire(exp,exp1,exp2) -> AstTds.Ternaire((analyse_tds_expression tds exp), (analyse_tds_expression tds exp1), (analyse_tds_expression tds exp2))
   | AstSyntax.AppelFonction(id,l) -> 
    begin
     match (chercherGlobalement tds id) with
      | None -> raise (IdentifiantNonDeclare id)
      | Some ia -> 
        begin
          match (info_ast_to_info ia) with
           | InfoFun (_,_,_) -> AstTds.AppelFonction(ia,(List.map(analyse_tds_expression tds) l))
           | _ -> raise (MauvaiseUtilisationIdentifiant id)
        end
    end
   | AstSyntax.Adresse(id) ->
    begin
      match (chercherGlobalement tds id) with
      | None -> raise (IdentifiantNonDeclare id)
      | Some ia ->
        begin
          match (info_ast_to_info ia) with
          | InfoVar _ ->
              (* Retourner l'adresse de la variable *)
            AstTds.Adresse (ia)
          | _ -> raise (MauvaiseUtilisationIdentifiant id)
        end
    end
   | AstSyntax.New(t) ->AstTds.New(t)
   | AstSyntax.Null -> AstTds.Null

(* analyse_tds_instruction : tds -> info_ast option -> AstSyntax.instruction -> AstTds.instruction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si l'instruction i est dans le bloc principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est l'instruction i sinon *)
(* Paramètre i : l'instruction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme l'instruction
en une instruction de type AstTds.instruction *)
(* Erreur si mauvaise utilisation des identifiants *)
let rec analyse_tds_instruction tds oia i =
  match i with
  | AstSyntax.Declaration (t, n, e) ->
      begin
        match chercherLocalement tds n with
        | None ->
            (* L'identifiant n'est pas trouvé dans la tds locale,
            il n'a donc pas été déclaré dans le bloc courant *)
            (* Vérification de la bonne utilisation des identifiants dans l'expression *)
            (* et obtention de l'expression transformée *)
            let ne = analyse_tds_expression tds e in
            (* Création de l'information associée à l'identfiant *)
            let info = InfoVar (n,Undefined, 0, "") in
            (* Création du pointeur sur l'information *)
            let ia = info_to_info_ast info in
            (* Ajout de l'information (pointeur) dans la tds *)
            ajouter tds n ia;
            (* Renvoie de la nouvelle déclaration où le nom a été remplacé par l'information
            et l'expression remplacée par l'expression issue de l'analyse *)
            AstTds.Declaration (t, ia, ne)
        | Some _ ->
            (* L'identifiant est trouvé dans la tds locale,
            il a donc déjà été déclaré dans le bloc courant *)
            raise (DoubleDeclaration n)
      end
  | AstSyntax.Affectation (a,e) ->
    let na = analyse_tds_affect tds true a in
    let ne = analyse_tds_expression tds e in
    AstTds.Affectation(na,ne)
  | AstSyntax.Constante (n,v) ->
      begin
        match chercherLocalement tds n with
        | None ->
          (* L'identifiant n'est pas trouvé dans la tds locale,
             il n'a donc pas été déclaré dans le bloc courant *)
          (* Ajout dans la tds de la constante *)
          ajouter tds n (info_to_info_ast (InfoConst (n,v)));
          (* Suppression du noeud de déclaration des constantes devenu inutile *)
          AstTds.Empty
        | Some _ ->
          (* L'identifiant est trouvé dans la tds locale,
          il a donc déjà été déclaré dans le bloc courant *)
          raise (DoubleDeclaration n)
      end
  | AstSyntax.Affichage e ->
      (* Vérification de la bonne utilisation des identifiants dans l'expression *)
      (* et obtention de l'expression transformée *)
      let ne = analyse_tds_expression tds e in
      (* Renvoie du nouvel affichage où l'expression remplacée par l'expression issue de l'analyse *)
      AstTds.Affichage (ne)
  | AstSyntax.Conditionnelle (c,t,e) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds oia t in
      (* Analyse du bloc else *)
      let east = analyse_tds_bloc tds oia e in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      AstTds.Conditionnelle (nc, tast, east)
  | AstSyntax.TantQue (c,b) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc *)
      let bast = analyse_tds_bloc tds oia b in
      (* Renvoie la nouvelle structure de la boucle *)
      AstTds.TantQue (nc, bast)
  | AstSyntax.Retour (e) ->
      begin
      (* On récupère l'information associée à la fonction à laquelle le return est associée *)
      match oia with
        (* Il n'y a pas d'information -> l'instruction est dans le bloc principal : erreur *)
      | None -> raise RetourDansMain
        (* Il y a une information -> l'instruction est dans une fonction *)
      | Some ia ->
        (* Analyse de l'expression *)
        let ne = analyse_tds_expression tds e in
        AstTds.Retour (ne,ia)
      end
  | AstSyntax.Loop (b) -> AstTds.Loop(analyse_tds_bloc tds oia b)
  | AstSyntax.LoopId(id,b) -> 
    begin
      match chercherLocalement tds id with
        | None -> 
          let tdsFille = creerTDSFille tds in
          (*Ajout de l'identifiant id à la tds courante avec le type loop pour indiquer qu'il s'agit d'un identifiant de boucle*)
          ajouter tdsFille id (info_to_info_ast (InfoLoop (id)));
          AstTds.LoopId(info_to_info_ast (InfoLoop (id)),analyse_tds_bloc tdsFille oia b)
        | Some _ -> raise (DoubleDeclaration id)
    end
  | AstSyntax.Break -> AstTds.Break
  | AstSyntax.BreakId(id) -> (* Vérifier si id est bien déclaré comme un identifiant de boucle dans la TDS *)
    begin
      match chercherGlobalement tds id with
      | Some ia ->
          (* Vérifier si ia est bien une information de type InfoLoop *)
          begin
            match info_ast_to_info ia with
            | InfoLoop _ -> AstTds.BreakId (ia)
            | _ -> raise (MauvaiseUtilisationIdentifiant id)
          end
      | None -> raise (IdentifiantNonDeclare id)
    end
  | AstSyntax.Conditionnelleopt (c,t) ->
      (* Analyse de la condition *)
      let nc = analyse_tds_expression tds c in
      (* Analyse du bloc then *)
      let tast = analyse_tds_bloc tds oia t in
      (* Renvoie la nouvelle structure de la conditionnelle *)
      Conditionnelleopt (nc,tast)



(* analyse_tds_bloc : tds -> info_ast option -> AstSyntax.bloc -> AstTds.bloc *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre oia : None si le bloc li est dans le programme principal,
                   Some ia où ia est l'information associée à la fonction dans laquelle est le bloc li sinon *)
(* Paramètre li : liste d'instructions à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le bloc en un bloc de type AstTds.bloc *)
(* Erreur si mauvaise utilisation des identifiants *)
and analyse_tds_bloc tds oia li =
  (* Entrée dans un nouveau bloc, donc création d'une nouvelle tds locale
  pointant sur la table du bloc parent *)
  let tdsbloc = creerTDSFille tds in
  (* Analyse des instructions du bloc avec la tds du nouveau bloc.
     Cette tds est modifiée par effet de bord *)
   let nli = List.map (analyse_tds_instruction tdsbloc oia) li in
   (* afficher_locale tdsbloc ; *) (* décommenter pour afficher la table locale *)
   nli


(* analyse_tds_fonction : tds -> AstSyntax.fonction -> AstTds.fonction *)
(* Paramètre tds : la table des symboles courante *)
(* Paramètre : la fonction à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme la fonction
en une fonction de type AstTds.fonction *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyse_tds_fonction maintds (AstSyntax.Fonction(t,n,lp,li))  =
begin
  (* On vérifie que la fonction n'est pas déjà déclarée *)
  match chercherLocalement maintds n with
  | Some _ ->
      raise (DoubleDeclaration n)
  | None ->
    (* Création de la tds de la fonction *)
    let tdsfonction = creerTDSFille maintds in
    (* Création de l'info associée à la fonction *)
    let info = InfoFun (n, t, (List.map fst lp)) in

    (* Création du pointeur sur l'information *)
    let ia = info_to_info_ast info in

    (* Ajout de l'information (pointeur) dans la tds *)
    ajouter maintds n ia;
    
    (* Conversion des paramètres en paramètres de l'AstDTS *)
    let nlp = List.map (fun (typ, name) ->
                begin
                  (* On vérifie que ce paremètre n'est pas déjà déclaré *)
                  match chercherLocalement tdsfonction name with
                    | Some _ ->
                      raise (DoubleDeclaration name)
                    | None ->
                      let info = InfoVar (name, Undefined, 0, "") in
                      (* Création du pointeur sur l'information *)
                      let ia = info_to_info_ast info in
                      (* Ajout de l'information (pointeur) dans la tds *)
                      ajouter tdsfonction name ia;
                      (typ, ia) 
                end) lp in
    (* Renvoie de la fonction tdsnom a été remplacé par l'information
    et les paramètres par leur information *)
    AstTds.Fonction (t, ia, nlp, analyse_tds_bloc tdsfonction (Some ia) li)
end

(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et tranforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstSyntax.Programme (fonctions,prog)) =
  let tds = creerTDSMere () in
  let nf = List.map (analyse_tds_fonction tds) fonctions in
  let nb = analyse_tds_bloc tds None prog in
  AstTds.Programme (nf,nb)
