
module type Regle =
sig
  type tid = int
  type td
  (* identificateur de la règle *)
  val id : tid
  (* appliquer : td -> td list
     Donne le comportement de l'application de la règle à un terme
     Paramètre : td, un terme
     Résultat : td list, une liste des termes produits après l'application de la règle *)
  val appliquer : td -> td list
end

module Regle1 : Regle with type td = char list =
struct
  type tid = int
  type td = char list
  let id = 1
  (* appliquer : td -> td list
     Donne le comportement de l'application de la règle à un terme
     Paramètre : td, un terme
     Résultat : td list, une liste des termes produits après l'application de la règle *)
  let appliquer terme = match List.rev terme with
   |[] -> []
   |t::q -> if t='O' then [List.rev('A'::(List.rev terme))]
            else [terme]
  
  let%test _ = appliquer ['B';'O'] = [['B'; 'O'; 'A']]
end

module Regle2 : Regle with type td = char list =
struct
  type tid = int
  type td = char list
  let id = 2
  (* appliquer : td -> td list
   Donne le comportement de l'application de la règle à un terme
   Paramètre : td, un terme
   Résultat : td list, une liste des termes produits après l'application de la règle *)
  let appliquer terme = match terme with
   |[] -> []
   |t::q -> if t='B' then [terme@q]
            else [terme]
end

module Regle3 : Regle with type td = char list =
struct
  type tid = int
  type td = char list
  let id = 3
  (* appliquer : td -> td list
    Donne le comportement de l'application de la règle à un terme
    Paramètre : td, un terme
    Résultat : td list, une liste des termes produits après l'application de la règle *)
  let rec appliquer terme = match terme with
   
   |t1::t2::t3::q -> if ((t1='O') && (t2='O') && (t3='O')) || ((t1='A') && (t2='O') && (t3='A')) then 
                       ['A'::q]@(List.map(fun l -> t1::l) (appliquer (t2::t3::q)))
                     else
                        List.map(fun l->t1::l) (appliquer (t2::t3::q))
   |_ -> []
  let%test _ = appliquer ['B';'O';'O';'O';'O'] = [['B';'O';'A'];['B';'A';'O']]
end

module Regle4 : Regle with type td = char list =
struct
  type tid = int
  type td = char list
  let id = 4
  let rec appliquer terme =
    match terme with
     |t1::t2::q -> if ((t1='A') && (t2='A')) then [q]@(List.map(fun l -> t1::l) (appliquer (t2::q)))
                   else
                    List.map(fun l -> t1::l) (appliquer (t2::q))
     |_ -> []
  let%test _ = appliquer ['B';'O';'A';'A';'O'] = [['B';'O';'O']]
end


module type ArbreReecriture =
sig
  
  type tid = int
  type td
  type arbre_reecriture = Noeud of td*((tid*arbre_reecriture) list)

  val creer_noeud : td -> (tid*arbre_reecriture) list -> arbre_reecriture

  val racine : arbre_reecriture -> td
  val fils : arbre_reecriture -> (tid*arbre_reecriture) list

  val appartient : td -> arbre_reecriture -> bool
  
end

module ArbreReecritureBOA (*: ArbreReecriture with type td = char list*) =
struct
  type tid = int
  type td = char list
  type  arbre_reecriture = Noeud of td*((tid*arbre_reecriture) list)

  let creer_noeud terme l = Noeud(terme,l)

  let racine (Noeud(terme,l)) = terme

  let fils (Noeud(terme,l)) = l

  let appartient terme (Noeud(rac,l)) = 
    if terme = rac then true
    else
      let rec aux terme1 l0 = 
        match l0 with
         |[] -> false
         |(_,Noeud(t,l1))::q -> if terme1=t then true
                                else
                                  (aux terme1 l1) || (aux terme1 q)
      in aux terme l
end

module SystemeBOA : ArbreReecriture with type td = char list =
struct
  include Regle1
  include Regle2 
  include Regle3
  include Regle4
  include ArbreReecritureBOA 
  let rec construit_arbre n l =
    if n = 0 then (Noeud (l,[]))
    else let rec construit_fils list_mot i = match list_mot with
    |[] -> []
    |t::q -> [(i,construit_arbre (n-1) t)]@(construit_fils q i)
   in let fils = (construit_fils (Regle1.appliquer l) 1)@(construit_fils (Regle2.appliquer l) 2)@(construit_fils (Regle3.appliquer l) 3)@(construit_fils (Regle4.appliquer l) 4)
   in Noeud (l,fils)
end
(*
  let rec chemin (Noeud(rac,l)) lc n =
    if not (appartient lc (Noeud(rac,l))) then None
    else
      match l with 
       |[] -> Some[]
       |(ti,ta)::q -> if racine ta = lc then Some[ti]
                      else Some (ti::(chemin ta lc n))*)

