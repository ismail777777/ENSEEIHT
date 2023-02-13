
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VOID
    | VIRG
    | VIDE
    | TYPEIDENT of (
# 16 "parserJava.mly"
       (string)
# 18 "parserJava.ml"
  )
    | TANTQUE
    | STRING
    | SINON
    | SI
    | RETOUR
    | PTVIRG
    | PAROUV
    | PARFER
    | OPSUPEG
    | OPSUP
    | OPPT
    | OPPLUS
    | OPOU
    | OPNONEG
    | OPNON
    | OPMULT
    | OPMOINS
    | OPMOD
    | OPINFEG
    | OPINF
    | OPET
    | OPEG
    | OPDIV
    | NOUVEAU
    | INT
    | IMPORT of (
# 15 "parserJava.mly"
       (string)
# 48 "parserJava.ml"
  )
    | IDENT of (
# 16 "parserJava.mly"
       (string)
# 53 "parserJava.ml"
  )
    | FLOTTANT of (
# 23 "parserJava.mly"
       (float)
# 58 "parserJava.ml"
  )
    | FLOAT
    | FIN
    | ENTIER of (
# 22 "parserJava.mly"
       (int)
# 65 "parserJava.ml"
  )
    | CROOUV
    | CROFER
    | CHAR
    | CHAINE of (
# 26 "parserJava.mly"
       (string)
# 73 "parserJava.ml"
  )
    | CARACTERE of (
# 25 "parserJava.mly"
       (char)
# 78 "parserJava.ml"
  )
    | BOOLEEN of (
# 24 "parserJava.mly"
       (bool)
# 83 "parserJava.ml"
  )
    | BOOL
    | ASSIGN
    | ACCOUV
    | ACCFER
  
end

include MenhirBasics

# 1 "parserJava.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)

(* let nbrVariables = ref 0;; *)

let nbrFonctions = ref 0;;


# 106 "parserJava.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_fichier) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: fichier. *)

  | MenhirState003 : (('s, _menhir_box_fichier) _menhir_cell1_VOID _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 003.
        Stack shape : VOID IDENT.
        Start symbol: fichier. *)

  | MenhirState011 : (('s _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 011.
        Stack shape : IDENT typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState012 : ((('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_state
    (** State 012.
        Stack shape : typeStruct IDENT VIRG.
        Start symbol: fichier. *)

  | MenhirState014 : (((('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 014.
        Stack shape : typeStruct IDENT VIRG typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState023 : (('s, _menhir_box_fichier) _menhir_cell1_IMPORT, _menhir_box_fichier) _menhir_state
    (** State 023.
        Stack shape : IMPORT.
        Start symbol: fichier. *)

  | MenhirState027 : (('s, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 027.
        Stack shape : typeStruct IDENT.
        Start symbol: fichier. *)

  | MenhirState032 : (('s, _menhir_box_fichier) _menhir_cell1_import, _menhir_box_fichier) _menhir_state
    (** State 032.
        Stack shape : import.
        Start symbol: fichier. *)

  | MenhirState035 : (('s, _menhir_box_fichier) _menhir_cell1_fonction, _menhir_box_fichier) _menhir_state
    (** State 035.
        Stack shape : fonction.
        Start symbol: fichier. *)

  | MenhirState037 : (('s, _menhir_box_fichier) _menhir_cell1_entete, _menhir_box_fichier) _menhir_state
    (** State 037.
        Stack shape : entete.
        Start symbol: fichier. *)

  | MenhirState038 : (('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_state
    (** State 038.
        Stack shape : ACCOUV.
        Start symbol: fichier. *)

  | MenhirState039 : ((('s, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables, _menhir_box_fichier) _menhir_state
    (** State 039.
        Stack shape : ACCOUV variables.
        Start symbol: fichier. *)

  | MenhirState042 : (('s, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_state
    (** State 042.
        Stack shape : TANTQUE.
        Start symbol: fichier. *)

  | MenhirState043 : (('s, _menhir_box_fichier) _menhir_cell1_PAROUV, _menhir_box_fichier) _menhir_state
    (** State 043.
        Stack shape : PAROUV.
        Start symbol: fichier. *)

  | MenhirState063 : (('s, _menhir_box_fichier) _menhir_cell1_NOUVEAU _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_state
    (** State 063.
        Stack shape : NOUVEAU IDENT.
        Start symbol: fichier. *)

  | MenhirState076 : ((('s, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 076.
        Stack shape : TANTQUE expression.
        Start symbol: fichier. *)

  | MenhirState079 : (('s, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_state
    (** State 079.
        Stack shape : SI.
        Start symbol: fichier. *)

  | MenhirState081 : ((('s, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_state
    (** State 081.
        Stack shape : SI expression.
        Start symbol: fichier. *)

  | MenhirState083 : (((('s, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_bloc, _menhir_box_fichier) _menhir_state
    (** State 083.
        Stack shape : SI expression bloc.
        Start symbol: fichier. *)

  | MenhirState085 : (('s, _menhir_box_fichier) _menhir_cell1_RETOUR, _menhir_box_fichier) _menhir_state
    (** State 085.
        Stack shape : RETOUR.
        Start symbol: fichier. *)

  | MenhirState091 : (('s, _menhir_box_fichier) _menhir_cell1_instruction, _menhir_box_fichier) _menhir_state
    (** State 091.
        Stack shape : instruction.
        Start symbol: fichier. *)

  | MenhirState095 : (('s, _menhir_box_fichier) _menhir_cell1_variable, _menhir_box_fichier) _menhir_state
    (** State 095.
        Stack shape : variable.
        Start symbol: fichier. *)


and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_entete = 
  | MenhirCell1_entete of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_expression = 
  | MenhirCell1_expression of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_fonction = 
  | MenhirCell1_fonction of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_import = 
  | MenhirCell1_import of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_instruction = 
  | MenhirCell1_instruction of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typeBase = 
  | MenhirCell1_typeBase of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_typeStruct = 
  | MenhirCell1_typeStruct of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_variable = 
  | MenhirCell1_variable of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_variables = 
  | MenhirCell1_variables of 's * ('s, 'r) _menhir_state * (int)

and ('s, 'r) _menhir_cell1_ACCOUV = 
  | MenhirCell1_ACCOUV of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 16 "parserJava.mly"
       (string)
# 257 "parserJava.ml"
)

and ('s, 'r) _menhir_cell1_IMPORT = 
  | MenhirCell1_IMPORT of 's * ('s, 'r) _menhir_state * (
# 15 "parserJava.mly"
       (string)
# 264 "parserJava.ml"
)

and ('s, 'r) _menhir_cell1_NOUVEAU = 
  | MenhirCell1_NOUVEAU of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PAROUV = 
  | MenhirCell1_PAROUV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETOUR = 
  | MenhirCell1_RETOUR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SI = 
  | MenhirCell1_SI of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TANTQUE = 
  | MenhirCell1_TANTQUE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VIRG = 
  | MenhirCell1_VIRG of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_VOID = 
  | MenhirCell1_VOID of 's * ('s, 'r) _menhir_state

and _menhir_box_fichier = 
  | MenhirBox_fichier of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 148 "parserJava.mly"
                 ( (print_endline "binaire : =") )
# 296 "parserJava.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 149 "parserJava.mly"
               ( (print_endline "binaire : .") )
# 304 "parserJava.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 150 "parserJava.mly"
           ( (print_endline "binaire : +") )
# 312 "parserJava.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 151 "parserJava.mly"
            ( (print_endline "binaire : -") )
# 320 "parserJava.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 152 "parserJava.mly"
           ( (print_endline "binaire : *") )
# 328 "parserJava.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 153 "parserJava.mly"
          ( (print_endline "binaire : /") )
# 336 "parserJava.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 154 "parserJava.mly"
          ( (print_endline "binaire : %") )
# 344 "parserJava.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 155 "parserJava.mly"
         ( (print_endline "binaire : ||") )
# 352 "parserJava.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 156 "parserJava.mly"
         ( (print_endline "binaire : &&") )
# 360 "parserJava.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 157 "parserJava.mly"
         ( (print_endline "binaire : ==") )
# 368 "parserJava.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 158 "parserJava.mly"
            ( (print_endline "binaire : !=") )
# 376 "parserJava.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 159 "parserJava.mly"
          ( (print_endline "binaire : <") )
# 384 "parserJava.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 160 "parserJava.mly"
          ( (print_endline "binaire : >") )
# 392 "parserJava.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 161 "parserJava.mly"
            ( (print_endline "binaire : <=") )
# 400 "parserJava.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 162 "parserJava.mly"
            ( (print_endline "binaire : >=") )
# 408 "parserJava.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 163 "parserJava.mly"
          ( (print_endline "binaire : !") )
# 416 "parserJava.ml"
     : (unit))

let _menhir_action_17 =
  fun _2 ->
    (
# 91 "parserJava.mly"
     (
	(print_endline "bloc : ACCOUV variables instructions ACCFER");
	(print_string "Nombre de variables = ");
	(print_int _2);
	(print_newline ());
	(print_string "Nombre d'instructions = ");
	)
# 430 "parserJava.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 76 "parserJava.mly"
                                 ( (print_endline "declTab : /* Lambda, mot vide */") )
# 438 "parserJava.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 77 "parserJava.mly"
                        ( (print_endline "declTab : CROOUV CROFER") )
# 446 "parserJava.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 81 "parserJava.mly"
                                                    ( (print_endline "entete : typeStruct IDENT PAROUV parsFormels PARFER") )
# 454 "parserJava.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 82 "parserJava.mly"
                                              ( (print_endline "entete : VOID IDENT PAROUV parsFormels PARFER") )
# 462 "parserJava.ml"
     : (unit))

let _menhir_action_22 =
  fun () ->
    (
# 129 "parserJava.mly"
                    ( (print_endline "expression : ENTIER") )
# 470 "parserJava.ml"
     : (unit))

let _menhir_action_23 =
  fun () ->
    (
# 130 "parserJava.mly"
               ( (print_endline "expression : FLOTTANT") )
# 478 "parserJava.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 131 "parserJava.mly"
                ( (print_endline "expression : CARACTERE") )
# 486 "parserJava.ml"
     : (unit))

let _menhir_action_25 =
  fun () ->
    (
# 132 "parserJava.mly"
              ( (print_endline "expression : BOOLEEN") )
# 494 "parserJava.ml"
     : (unit))

let _menhir_action_26 =
  fun () ->
    (
# 133 "parserJava.mly"
           ( (print_endline "expression : NULL") )
# 502 "parserJava.ml"
     : (unit))

let _menhir_action_27 =
  fun () ->
    (
# 134 "parserJava.mly"
                                  ( (print_endline "expression : new ident ()") )
# 510 "parserJava.ml"
     : (unit))

let _menhir_action_28 =
  fun () ->
    (
# 135 "parserJava.mly"
                                             ( (print_endline "expression : new ident [expression]") )
# 518 "parserJava.ml"
     : (unit))

let _menhir_action_29 =
  fun () ->
    (
# 136 "parserJava.mly"
            ( (print_endline "expression : ident") )
# 526 "parserJava.ml"
     : (unit))

let _menhir_action_30 =
  fun () ->
    (
# 137 "parserJava.mly"
                               ( (print_endline "expression : (expression)"))
# 534 "parserJava.ml"
     : (unit))

let _menhir_action_31 =
  fun () ->
    (
# 138 "parserJava.mly"
              ( (print_endline "expression : BINAIRE"))
# 542 "parserJava.ml"
     : (unit))

let _menhir_action_32 =
  fun () ->
    (
# 62 "parserJava.mly"
                        ( (print_endline "fichier : programme FIN");(print_string "Nombre de fonctions : ");(print_int !nbrFonctions);(print_newline()) )
# 550 "parserJava.ml"
     : (unit))

let _menhir_action_33 =
  fun () ->
    (
# 63 "parserJava.mly"
                         ( (print_endline "fichier : programme FIN");(print_string "Nombre de fonctions : ");(print_int !nbrFonctions);(print_newline()) )
# 558 "parserJava.ml"
     : (unit))

let _menhir_action_34 =
  fun () ->
    (
# 79 "parserJava.mly"
                        ( (print_endline "fonction : entete bloc") )
# 566 "parserJava.ml"
     : (unit))

let _menhir_action_35 =
  fun () ->
    (
# 59 "parserJava.mly"
                                ( (print_endline "import : /* Lambda, mot vide */"); )
# 574 "parserJava.ml"
     : (unit))

let _menhir_action_36 =
  fun () ->
    (
# 60 "parserJava.mly"
                  ( (print_endline "import : IMPORT import"); )
# 582 "parserJava.ml"
     : (unit))

let _menhir_action_37 =
  fun () ->
    (
# 120 "parserJava.mly"
                                ( (print_endline "instruction : expression PTVIRG") )
# 590 "parserJava.ml"
     : (unit))

let _menhir_action_38 =
  fun () ->
    (
# 121 "parserJava.mly"
                                      ( (print_endline "instruction : SI PAROUV expression PARFER corps") )
# 598 "parserJava.ml"
     : (unit))

let _menhir_action_39 =
  fun () ->
    (
# 122 "parserJava.mly"
                                                 ( (print_endline "instruction : SI PAROUV expression PARFER corps SINON corps") )
# 606 "parserJava.ml"
     : (unit))

let _menhir_action_40 =
  fun () ->
    (
# 123 "parserJava.mly"
                                           ( (print_endline "instruction : TANTQUE PAROUV expression PARFER corps") )
# 614 "parserJava.ml"
     : (unit))

let _menhir_action_41 =
  fun () ->
    (
# 124 "parserJava.mly"
                                        ( (print_endline "instruction : RETURN expression PTVIRG") )
# 622 "parserJava.ml"
     : (unit))

let _menhir_action_42 =
  fun () ->
    (
# 126 "parserJava.mly"
                                       ( (print_endline "instruction_b : /* Lambda, mot vide */"); 0 )
# 630 "parserJava.ml"
     : (int))

let _menhir_action_43 =
  fun _2 ->
    (
# 127 "parserJava.mly"
                                ( (print_endline "instruction_b : instruction"); _2+1)
# 638 "parserJava.ml"
     : (int))

let _menhir_action_44 =
  fun _1 ->
    (
# 113 "parserJava.mly"
                             ( (print_endline "instructions : instructions");
			                (print_string "Nombre d'instructions : ");
							(print_int _1);
							(print_newline());
							)
# 650 "parserJava.ml"
     : (unit))

let _menhir_action_45 =
  fun () ->
    (
# 84 "parserJava.mly"
                                     ( (print_endline "parsFormels : /* Lambda, mot vide */") )
# 658 "parserJava.ml"
     : (unit))

let _menhir_action_46 =
  fun () ->
    (
# 85 "parserJava.mly"
                                                ( (print_endline "parsFormels : typeStruct IDENT suiteParsFormels") )
# 666 "parserJava.ml"
     : (unit))

let _menhir_action_47 =
  fun () ->
    (
# 64 "parserJava.mly"
                                   ( (nbrFonctions := 0); (print_endline "programme : /* Lambda, mot vide */") )
# 674 "parserJava.ml"
     : (unit))

let _menhir_action_48 =
  fun () ->
    (
# 65 "parserJava.mly"
                               ( (nbrFonctions := !nbrFonctions + 1);(print_endline "programme : fonction programme") )
# 682 "parserJava.ml"
     : (unit))

let _menhir_action_49 =
  fun () ->
    (
# 87 "parserJava.mly"
                                          ( (print_endline "suiteParsFormels : /* Lambda, mot vide */") )
# 690 "parserJava.ml"
     : (unit))

let _menhir_action_50 =
  fun () ->
    (
# 88 "parserJava.mly"
                                                          ( (print_endline "suiteParsFormels : VIRG typeStruct IDENT suiteParsFormels") )
# 698 "parserJava.ml"
     : (unit))

let _menhir_action_51 =
  fun () ->
    (
# 69 "parserJava.mly"
               ( (print_endline "typeBase : INT") )
# 706 "parserJava.ml"
     : (unit))

let _menhir_action_52 =
  fun () ->
    (
# 70 "parserJava.mly"
                 ( (print_endline "typeBase : FLOAT") )
# 714 "parserJava.ml"
     : (unit))

let _menhir_action_53 =
  fun () ->
    (
# 71 "parserJava.mly"
                ( (print_endline "typeBase : BOOL") )
# 722 "parserJava.ml"
     : (unit))

let _menhir_action_54 =
  fun () ->
    (
# 72 "parserJava.mly"
                ( (print_endline "typeBase : CHAR") )
# 730 "parserJava.ml"
     : (unit))

let _menhir_action_55 =
  fun () ->
    (
# 73 "parserJava.mly"
                  ( (print_endline "typeBase : STRING") )
# 738 "parserJava.ml"
     : (unit))

let _menhir_action_56 =
  fun () ->
    (
# 74 "parserJava.mly"
                     ( (print_endline "typeBase : TYPEIDENT") )
# 746 "parserJava.ml"
     : (unit))

let _menhir_action_57 =
  fun () ->
    (
# 67 "parserJava.mly"
                              ( (print_endline "typeStruct : typeBase declTab") )
# 754 "parserJava.ml"
     : (unit))

let _menhir_action_58 =
  fun () ->
    (
# 110 "parserJava.mly"
                                   ( (print_endline "variable : typeStruct IDENT PTVIRG") )
# 762 "parserJava.ml"
     : (unit))

let _menhir_action_59 =
  fun () ->
    (
# 100 "parserJava.mly"
   (
		(print_endline "variables : /* Lambda, mot vide */");
		0
		)
# 773 "parserJava.ml"
     : (int))

let _menhir_action_60 =
  fun _2 ->
    (
# 105 "parserJava.mly"
   (
		(print_endline "variables : variable variables");
		(_2 + 1)
		)
# 784 "parserJava.ml"
     : (int))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ACCFER ->
        "ACCFER"
    | ACCOUV ->
        "ACCOUV"
    | ASSIGN ->
        "ASSIGN"
    | BOOL ->
        "BOOL"
    | BOOLEEN _ ->
        "BOOLEEN"
    | CARACTERE _ ->
        "CARACTERE"
    | CHAINE _ ->
        "CHAINE"
    | CHAR ->
        "CHAR"
    | CROFER ->
        "CROFER"
    | CROOUV ->
        "CROOUV"
    | ENTIER _ ->
        "ENTIER"
    | FIN ->
        "FIN"
    | FLOAT ->
        "FLOAT"
    | FLOTTANT _ ->
        "FLOTTANT"
    | IDENT _ ->
        "IDENT"
    | IMPORT _ ->
        "IMPORT"
    | INT ->
        "INT"
    | NOUVEAU ->
        "NOUVEAU"
    | OPDIV ->
        "OPDIV"
    | OPEG ->
        "OPEG"
    | OPET ->
        "OPET"
    | OPINF ->
        "OPINF"
    | OPINFEG ->
        "OPINFEG"
    | OPMOD ->
        "OPMOD"
    | OPMOINS ->
        "OPMOINS"
    | OPMULT ->
        "OPMULT"
    | OPNON ->
        "OPNON"
    | OPNONEG ->
        "OPNONEG"
    | OPOU ->
        "OPOU"
    | OPPLUS ->
        "OPPLUS"
    | OPPT ->
        "OPPT"
    | OPSUP ->
        "OPSUP"
    | OPSUPEG ->
        "OPSUPEG"
    | PARFER ->
        "PARFER"
    | PAROUV ->
        "PAROUV"
    | PTVIRG ->
        "PTVIRG"
    | RETOUR ->
        "RETOUR"
    | SI ->
        "SI"
    | SINON ->
        "SINON"
    | STRING ->
        "STRING"
    | TANTQUE ->
        "TANTQUE"
    | TYPEIDENT _ ->
        "TYPEIDENT"
    | VIDE ->
        "VIDE"
    | VIRG ->
        "VIRG"
    | VOID ->
        "VOID"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_fichier : type  ttv_stack. ttv_stack -> _ -> _menhir_box_fichier =
    fun _menhir_stack _v ->
      MenhirBox_fichier _v
  
  let rec _menhir_run_033 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_import -> _menhir_box_fichier =
    fun _menhir_stack ->
      let MenhirCell1_import (_menhir_stack, _, _) = _menhir_stack in
      let _v = _menhir_action_33 () in
      _menhir_goto_fichier _menhir_stack _v
  
  let rec _menhir_run_030 : type  ttv_stack. ttv_stack -> _menhir_box_fichier =
    fun _menhir_stack ->
      let _v = _menhir_action_32 () in
      _menhir_goto_fichier _menhir_stack _v
  
  let rec _menhir_run_036 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_fonction -> _menhir_box_fichier =
    fun _menhir_stack ->
      let MenhirCell1_fonction (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_48 () in
      _menhir_goto_programme _menhir_stack _menhir_s
  
  and _menhir_goto_programme : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_s ->
      match _menhir_s with
      | MenhirState035 ->
          _menhir_run_036 _menhir_stack
      | MenhirState032 ->
          _menhir_run_033 _menhir_stack
      | MenhirState000 ->
          _menhir_run_030 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VOID (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_56 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_55 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_51 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_52 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_54 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_53 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
              | PARFER ->
                  let _ = _menhir_action_45 () in
                  _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeBase (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | CROOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CROFER ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_19 () in
              _menhir_goto_declTab _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | IDENT _ ->
          let _ = _menhir_action_18 () in
          _menhir_goto_declTab _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_declTab : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_typeBase -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_typeBase (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_57 () in
      _menhir_goto_typeStruct _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typeStruct : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState038 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState035 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState032 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState012 ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState027 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_097 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PTVIRG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_58 () in
              let _menhir_stack = MenhirCell1_variable (_menhir_stack, _menhir_s, _v) in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_56 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_55 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_51 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_52 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_54 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_53 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState095 _tok
              | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
                  let _v = _menhir_action_59 () in
                  _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_variable -> _ -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_variable (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_60 _2 in
      _menhir_goto_variables _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_variables : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState038 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_039 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_variables (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | TANTQUE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
      | SI ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
      | RETOUR ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
      | PAROUV ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_15 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_13 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_02 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_03 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_08 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_11 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_16 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_05 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_04 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_07 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_14 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_12 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_09 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_10 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_06 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | NOUVEAU ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_29 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | FLOTTANT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_23 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_22 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | CARACTERE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_24 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | BOOLEEN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_25 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          _menhir_run_072_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ACCFER ->
          let _v = _menhir_action_42 () in
          _menhir_run_090_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_093 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_37 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_instruction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_instruction (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | TANTQUE ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | SI ->
          _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | RETOUR ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | PAROUV ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_15 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_13 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_02 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_03 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_08 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_11 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_16 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_05 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_04 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_07 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_14 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_12 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_09 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_10 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_06 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | NOUVEAU ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_29 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | FLOTTANT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_23 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_22 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | CARACTERE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_24 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | BOOLEEN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_25 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          _menhir_run_072_spec_091 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ACCFER ->
          let _v = _menhir_action_42 () in
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TANTQUE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIDE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_26 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | PAROUV ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | OPSUPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_15 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPSUP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_13 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPPT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_02 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPPLUS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_03 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPOU ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_08 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPNONEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_11 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPNON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_16 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMULT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_05 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMOINS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_04 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMOD ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_07 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPINFEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_14 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPINF ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_12 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_09 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_10 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPDIV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_06 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | NOUVEAU ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
          | IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_29 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | FLOTTANT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_23 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_22 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | CARACTERE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_24 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | BOOLEEN _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_25 () in
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
          | ASSIGN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_01 () in
              _menhir_run_072_spec_042 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_TANTQUE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_ACCOUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_56 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_51 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_52 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
          let _v = _menhir_action_59 () in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState038 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PAROUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | PAROUV ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_15 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_13 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_02 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_03 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_08 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_11 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_16 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_05 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_04 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_07 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_14 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_12 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_09 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_10 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_06 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | NOUVEAU ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_29 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | FLOTTANT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_23 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_22 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | CARACTERE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_24 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | BOOLEEN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_25 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          _menhir_run_072_spec_043 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PAROUV (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_30 () in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_expression : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState039 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
      | MenhirState085 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState042 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState063 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_086 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_RETOUR -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | PTVIRG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETOUR (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_41 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_SI as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expression (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PARFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState081
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_NOUVEAU _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | CROFER ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_NOUVEAU (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_28 () in
          _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072_spec_043 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_PAROUV -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_31 () in
      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | PARFER ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_27 () in
                  _menhir_goto_expression _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | CROOUV ->
              let _menhir_stack = MenhirCell1_NOUVEAU (_menhir_stack, _menhir_s) in
              let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VIDE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_26 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | PAROUV ->
                  _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
              | OPSUPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_15 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPSUP ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_13 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPPT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_02 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPPLUS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_03 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPOU ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_08 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPNONEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_11 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPNON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_16 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPMULT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_05 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPMOINS ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_04 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPMOD ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_07 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPINFEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_14 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPINF ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_12 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPET ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_09 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPEG ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_10 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | OPDIV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_06 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | NOUVEAU ->
                  _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
              | IDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_29 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | FLOTTANT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_23 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | ENTIER _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_22 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | CARACTERE _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_24 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | BOOLEEN _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_25 () in
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | ASSIGN ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _ = _menhir_action_01 () in
                  _menhir_run_072_spec_063 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_072_spec_063 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_NOUVEAU _menhir_cell0_IDENT -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_31 () in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_072_spec_042 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_TANTQUE -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_31 () in
      _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState042 _tok
  
  and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SI (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PAROUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIDE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_26 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | PAROUV ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
          | OPSUPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_15 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPSUP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_13 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPPT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_02 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPPLUS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_03 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPOU ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_08 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPNONEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_11 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPNON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_16 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMULT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_05 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMOINS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_04 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPMOD ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_07 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPINFEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_14 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPINF ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_12 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPET ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_09 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPEG ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_10 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | OPDIV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_06 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | NOUVEAU ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState079
          | IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_29 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | FLOTTANT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_23 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_22 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | CARACTERE _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_24 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | BOOLEEN _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_25 () in
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
          | ASSIGN ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _ = _menhir_action_01 () in
              _menhir_run_072_spec_079 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_072_spec_079 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_SI -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_31 () in
      _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState079 _tok
  
  and _menhir_run_085 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETOUR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VIDE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_26 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | PAROUV ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | OPSUPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_15 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPSUP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_13 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_02 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPPLUS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_03 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPOU ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_08 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNONEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_11 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPNON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_16 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMULT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_05 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOINS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_04 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPMOD ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_07 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINFEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_14 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPINF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_12 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_09 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPEG ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_10 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | OPDIV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_06 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | NOUVEAU ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
      | IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_29 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | FLOTTANT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_23 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_22 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | CARACTERE _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_24 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | BOOLEEN _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_25 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | ASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          _menhir_run_072_spec_085 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072_spec_085 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_RETOUR -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_31 () in
      _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_072_spec_091 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_instruction -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_31 () in
      _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState091 _tok
  
  and _menhir_run_092 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_instruction -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_instruction (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_43 _2 in
      _menhir_goto_instruction_b _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_instruction_b : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState091 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState039 ->
          _menhir_run_090_spec_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_090_spec_039 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _ =
        let _1 = _v in
        _menhir_action_44 _1
      in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_variables (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_ACCOUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_17 _2 in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState037 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState083 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState081 ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_100 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_entete -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_entete (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_34 () in
      let _menhir_stack = MenhirCell1_fonction (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState035
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_56 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_51 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_52 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState035 _tok
      | FIN ->
          let _ = _menhir_action_47 () in
          _menhir_run_036 _menhir_stack
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression, _menhir_box_fichier) _menhir_cell1_bloc -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_SI (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_39 () in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_082 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_SI, _menhir_box_fichier) _menhir_cell1_expression as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SINON ->
          let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ACCOUV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState083
          | _ ->
              _eRR ())
      | ACCFER | ASSIGN | BOOLEEN _ | CARACTERE _ | ENTIER _ | FLOTTANT _ | IDENT _ | NOUVEAU | OPDIV | OPEG | OPET | OPINF | OPINFEG | OPMOD | OPMOINS | OPMULT | OPNON | OPNONEG | OPOU | OPPLUS | OPPT | OPSUP | OPSUPEG | PAROUV | RETOUR | SI | TANTQUE | VIDE ->
          let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell1_SI (_menhir_stack, _menhir_s) = _menhir_stack in
          let _v = _menhir_action_38 () in
          _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_077 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_TANTQUE, _menhir_box_fichier) _menhir_cell1_expression -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_expression (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_TANTQUE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_40 () in
      _menhir_goto_instruction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_072_spec_039 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_ACCOUV, _menhir_box_fichier) _menhir_cell1_variables -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _ = _menhir_action_31 () in
      _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState039 _tok
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAROUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TYPEIDENT _ ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_56 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | STRING ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_55 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_51 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | FLOAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_52 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | CHAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_54 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_53 () in
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState027 _tok
              | PARFER ->
                  let _ = _menhir_action_45 () in
                  _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_028 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_20 () in
      _menhir_goto_entete _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_entete : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_entete (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ACCOUV ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
      | _ ->
          _eRR ()
  
  and _menhir_run_013 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
          | PARFER ->
              let _ = _menhir_action_49 () in
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_VIRG (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_56 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_51 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_52 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState012 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. (((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_VIRG, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_VIRG (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_50 () in
      _menhir_goto_suiteParsFormels _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_suiteParsFormels : type  ttv_stack. ((ttv_stack, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState011 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_020 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT, _menhir_box_fichier) _menhir_cell1_typeStruct _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_46 () in
      _menhir_goto_parsFormels _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_parsFormels : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState027 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState003 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_021 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_VOID _menhir_cell0_IDENT -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_VOID (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_21 () in
      _menhir_goto_entete _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typeStruct (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VIRG ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
          | PARFER ->
              let _ = _menhir_action_49 () in
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let rec _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_import (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_56 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_51 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_52 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState032 _tok
      | FIN ->
          let _ = _menhir_action_47 () in
          _menhir_run_033 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_024 : type  ttv_stack. (ttv_stack, _menhir_box_fichier) _menhir_cell1_IMPORT -> _ -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_IMPORT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_36 () in
      _menhir_goto_import _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_import : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_fichier) _menhir_state -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_IMPORT (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IMPORT _v ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState023
      | BOOL | CHAR | FIN | FLOAT | INT | STRING | TYPEIDENT _ | VOID ->
          let _ = _menhir_action_35 () in
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_fichier =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | TYPEIDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_56 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | STRING ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_55 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_51 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | IMPORT _v ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000
      | FLOAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_52 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | CHAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_54 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_53 () in
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | FIN ->
          let _v = _menhir_action_35 () in
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let fichier =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_fichier v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 171 "parserJava.mly"
  

# 2388 "parserJava.ml"
