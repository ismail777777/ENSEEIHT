%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_MACHINE
%token UL_ACCOUV UL_ACCFER
%token UL_PT 
%token UL_EVENT UL_STATE UL_REGION UL_TO UL_FROM UL_ON UL_STARTS UL_ENDS
/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_IDENT

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> machine

/* Le non terminal document est l'axiome */
%start machine

%% /* Regles de productions */

machine : UL_MACHINE UL_IDENT UL_ACCOUV UL_ACCFER suite_machine UL_FIN { (print_endline "machine : MACHINE IDENT { suite_machine } FIN ") }

suite_machine : { (print_endline "suite_machine : mot vide") }
                | machine_bis suite_machine { (print_endline "suite_machine : machine_bis suite_machine")}

machine_bis : UL_IDENT UL_EVENT { (print_endline "machine_bis : UL_IDENT UL_EVENT") }
             | transition { (print_endline "machine_bis : transition") }
             | region { (print_endline "machine_bis : region") }
transition : UL_FROM nomQualifie UL_TO nomQualifie UL_ON UL_IDENT { (print_endline "transition : from nomQualifie to nomQualifie on ident") }

nomQualifie : UL_IDENT { (print_endline "nomQualifie : UL_IDENT") }
             | UL_IDENT UL_PT nomQualifie { (print_endline "nomQualifie : UL_IDENT UL_PT nomQualifie") }
region : UL_REGION UL_IDENT UL_ACCOUV suite_etat UL_ACCFER { (print_endline "region : UL_REGION UL_IDENT UL_ACCOUV suite_etat UL_ACCFER") }

suite_etat : etat { (print_endline "suite_etat : etat ") }
            | etat suite_etat { (print_endline "suite_etat : etat suite_etat") }

etat : UL_STATE UL_IDENT starts_bis ends_bis region_bis { (print_endline "etat : UL_STATE UL_IDENT starts_bis ends_bis region_bis") }

starts_bis : { (print_endline "starts_bis : mot vide") }
            | UL_STARTS { (print_endline "starts_bis : UL_STARTS") }

ends_bis : { (print_endline "ends_bis : mot vide") }
            | UL_ENDS { (print_endline "ends_bis : UL_ENDS") }

region_bis : { (print_endline "region_bis : mot vide") }
            | UL_ACCOUV liste_regions UL_ACCFER { (print_endline "region_bis : UL_ACCOUV liste_regions UL_ACCFER") }

liste_regions : { (print_endline "liste_regions : mot vide") }
            | region liste_regions { (print_endline "liste_regions : region liste_regions") }

%%
