%{

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

%}

/* Declaration des unites lexicales et de leur type si une valeur particuliere leur est associee */

%token UL_CROOUV UL_CROFER
%token UL_PTVIRG UL_VIRG

/* Defini le type des donnees associees a l'unite lexicale */

%token <string> UL_IDENT
%token <int> UL_ENTIER

/* Unite lexicale particuliere qui represente la fin du fichier */

%token UL_FIN

/* Type renvoye pour le nom terminal document */
%type <unit> array

/* Le non terminal document est l'axiome */
%start array

%% /* Regles de productions */

array : UL_CROOUV suite_array UL_CROFER UL_FIN { (print_endline "array : UL_CROOUV suite_array UL_CROFER UL_FIN") }

valeur_array : UL_CROOUV suite_array UL_CROFER { (print_endline " valeur_array : UL_CROOUV suite_array UL_CROFER ") }
suite_array : array_bis { (print_endline "suite_array : array_bis ") }
            | array_bis UL_PTVIRG suite_array { (print_endline "suite_array : array_bis UL_PTVIRG suite_array ") }

array_bis : valeur { (print_endline "array_bis : array") }
          | valeur UL_VIRG array_bis { (print_endline " array_bis: valeur UL_VIRG array_bis") }
          
valeur :  valeur_array { (print_endline "valeur : array ") }
        |UL_IDENT { (print_endline " valeur : UL_IDENT ") }
        | UL_ENTIER { (print_endline "valeur : UL_ENTIER") }
%%
