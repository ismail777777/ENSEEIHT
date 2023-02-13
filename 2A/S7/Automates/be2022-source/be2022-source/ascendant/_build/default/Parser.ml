
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_PTVIRG
    | UL_IDENT of (
# 16 "Parser.mly"
       (string)
# 17 "Parser.ml"
  )
    | UL_FIN
    | UL_ENTIER of (
# 17 "Parser.mly"
       (int)
# 23 "Parser.ml"
  )
    | UL_CROOUV
    | UL_CROFER
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 40 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState01 : ('s, _menhir_box_array) _menhir_state
    (** State 01.
        Stack shape : .
        Start symbol: array. *)

  | MenhirState04 : (('s, _menhir_box_array) _menhir_cell1_UL_CROOUV, _menhir_box_array) _menhir_state
    (** State 04.
        Stack shape : UL_CROOUV.
        Start symbol: array. *)

  | MenhirState07 : (('s, _menhir_box_array) _menhir_cell1_valeur, _menhir_box_array) _menhir_state
    (** State 07.
        Stack shape : valeur.
        Start symbol: array. *)

  | MenhirState12 : (('s, _menhir_box_array) _menhir_cell1_array_bis, _menhir_box_array) _menhir_state
    (** State 12.
        Stack shape : array_bis.
        Start symbol: array. *)


and ('s, 'r) _menhir_cell1_array_bis = 
  | MenhirCell1_array_bis of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_valeur = 
  | MenhirCell1_valeur of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_CROOUV = 
  | MenhirCell1_UL_CROOUV of 's * ('s, 'r) _menhir_state

and _menhir_box_array = 
  | MenhirBox_array of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 31 "Parser.mly"
                                               ( (print_endline "array : UL_CROOUV suite_array UL_CROFER UL_FIN") )
# 81 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 37 "Parser.mly"
                   ( (print_endline "array_bis : array") )
# 89 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 38 "Parser.mly"
                                     ( (print_endline " array_bis: valeur UL_VIRG array_bis") )
# 97 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 34 "Parser.mly"
                        ( (print_endline "suite_array : array_bis ") )
# 105 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 35 "Parser.mly"
                                              ( (print_endline "suite_array : array_bis UL_PTVIRG suite_array ") )
# 113 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 40 "Parser.mly"
                       ( (print_endline "valeur : array ") )
# 121 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 41 "Parser.mly"
                  ( (print_endline " valeur : UL_IDENT ") )
# 129 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 42 "Parser.mly"
                    ( (print_endline "valeur : UL_ENTIER") )
# 137 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 33 "Parser.mly"
                                               ( (print_endline " valeur_array : UL_CROOUV suite_array UL_CROFER ") )
# 145 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_CROFER ->
        "UL_CROFER"
    | UL_CROOUV ->
        "UL_CROOUV"
    | UL_ENTIER _ ->
        "UL_ENTIER"
    | UL_FIN ->
        "UL_FIN"
    | UL_IDENT _ ->
        "UL_IDENT"
    | UL_PTVIRG ->
        "UL_PTVIRG"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let _v = _menhir_action_01 () in
          MenhirBox_array _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_array) _menhir_state -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_valeur (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
          | UL_ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
          | UL_CROOUV ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
          | _ ->
              _eRR ())
      | UL_CROFER | UL_PTVIRG ->
          let _v = _menhir_action_02 () in
          _menhir_goto_array_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_array) _menhir_state -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_CROOUV (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | UL_ENTIER _ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_08 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
      | UL_CROOUV ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
      | _ ->
          _eRR ()
  
  and _menhir_goto_array_bis : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_array) _menhir_state -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState04 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_array) _menhir_state -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PTVIRG ->
          let _menhir_stack = MenhirCell1_array_bis (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
          | UL_ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState12 _tok
          | UL_CROOUV ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState12
          | _ ->
              _eRR ())
      | UL_CROFER ->
          let _ = _menhir_action_04 () in
          _menhir_goto_suite_array _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_suite_array : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_array) _menhir_state -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState01 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState12 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState04 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_13 : type  ttv_stack. (ttv_stack, _menhir_box_array) _menhir_cell1_array_bis -> _ -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_array_bis (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_05 () in
      _menhir_goto_suite_array _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_array) _menhir_cell1_UL_CROOUV -> _ -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_CROOUV (_menhir_stack, _menhir_s) = _menhir_stack in
      let _ = _menhir_action_09 () in
      let _v = _menhir_action_06 () in
      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_array) _menhir_cell1_valeur -> _ -> _ -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_valeur (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_03 () in
      _menhir_goto_array_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_array =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_CROOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
          | UL_ENTIER _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_08 () in
              _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01 _tok
          | UL_CROOUV ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let array =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_array v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 43 "Parser.mly"
  

# 330 "Parser.ml"
