
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_VIRG
    | UL_VARIABLE of (
# 17 "Parser.mly"
       (string)
# 16 "Parser.ml"
  )
    | UL_SYMBOLE of (
# 16 "Parser.mly"
       (string)
# 21 "Parser.ml"
  )
    | UL_PT
    | UL_PAROUV
    | UL_PARFER
    | UL_NEGATION
    | UL_FIN
    | UL_ECHEC
    | UL_DEDUCTION
    | UL_COUPURE
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 44 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_programme) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: programme. *)

  | MenhirState02 : (('s, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE, _menhir_box_programme) _menhir_state
    (** State 02.
        Stack shape : UL_SYMBOLE.
        Start symbol: programme. *)

  | MenhirState04 : (('s, _menhir_box_programme) _menhir_cell1_UL_VARIABLE, _menhir_box_programme) _menhir_state
    (** State 04.
        Stack shape : UL_VARIABLE.
        Start symbol: programme. *)

  | MenhirState07 : (('s, _menhir_box_programme) _menhir_cell1_terme, _menhir_box_programme) _menhir_state
    (** State 07.
        Stack shape : terme.
        Start symbol: programme. *)

  | MenhirState18 : (('s, _menhir_box_programme) _menhir_cell1_predicat, _menhir_box_programme) _menhir_state
    (** State 18.
        Stack shape : predicat.
        Start symbol: programme. *)

  | MenhirState19 : (('s, _menhir_box_programme) _menhir_cell1_UL_NEGATION, _menhir_box_programme) _menhir_state
    (** State 19.
        Stack shape : UL_NEGATION.
        Start symbol: programme. *)

  | MenhirState24 : (('s, _menhir_box_programme) _menhir_cell1_suite_predicat, _menhir_box_programme) _menhir_state
    (** State 24.
        Stack shape : suite_predicat.
        Start symbol: programme. *)


and ('s, 'r) _menhir_cell1_predicat = 
  | MenhirCell1_predicat of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_suite_predicat = 
  | MenhirCell1_suite_predicat of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_terme = 
  | MenhirCell1_terme of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_UL_NEGATION = 
  | MenhirCell1_UL_NEGATION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_SYMBOLE = 
  | MenhirCell1_UL_SYMBOLE of 's * ('s, 'r) _menhir_state * (
# 16 "Parser.mly"
       (string)
# 99 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_VARIABLE = 
  | MenhirCell1_UL_VARIABLE of 's * ('s, 'r) _menhir_state * (
# 17 "Parser.mly"
       (string)
# 106 "Parser.ml"
)

and _menhir_box_programme = 
  | MenhirBox_programme of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 40 "Parser.mly"
                        ( (print_endline "axiome : predicat UL_PT") )
# 117 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 42 "Parser.mly"
                                                        ( (print_endline "deduction : predicat UL_DEDUCTION suite_deduction UL_PT") )
# 125 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 50 "Parser.mly"
                                                         ( (print_endline "predicat : UL_SYMBOLE UL_PAROUV suite_variable UL_PARFER") )
# 133 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 35 "Parser.mly"
                         ( (print_endline "programme : regle suite_regle FIN ") )
# 141 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 37 "Parser.mly"
               ( (print_endline "regle : axiome") )
# 149 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 38 "Parser.mly"
                    ( (print_endline "regle : deduction") )
# 157 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 44 "Parser.mly"
                                 ( (print_endline "suite_deduction : suite_predicat") )
# 165 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 45 "Parser.mly"
                                                         ( (print_endline "suite_deduction : suite_predicat UL_VIRG suite_deduction") )
# 173 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 46 "Parser.mly"
                          ( (print_endline "suite_predicat : predicat") )
# 181 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 47 "Parser.mly"
                                       ( (print_endline "suite_predicat : UL_NEGATION predicat") )
# 189 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 48 "Parser.mly"
                           ( (print_endline "suite_predicat : UL_ECHEC") )
# 197 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 49 "Parser.mly"
                             ( (print_endline "suite_predicat : UL_COUPURE") )
# 205 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 52 "Parser.mly"
                                                    ( (print_endline "suite_variable : variable UL_VIRG suite_variable") )
# 213 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 53 "Parser.mly"
                        ( (print_endline "suite_variable : terme") )
# 221 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 54 "Parser.mly"
                                               ( (print_endline "suite_variable : terme UL_VIRG suite_variable") )
# 229 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 55 "Parser.mly"
                              ( (print_endline "suite_variable : UL_VARIABLE") )
# 237 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 57 "Parser.mly"
                   ( (print_endline "terme : UL_SYMBOLE") )
# 245 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 58 "Parser.mly"
                 ( (print_endline "terme : predicat") )
# 253 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_COUPURE ->
        "UL_COUPURE"
    | UL_DEDUCTION ->
        "UL_DEDUCTION"
    | UL_ECHEC ->
        "UL_ECHEC"
    | UL_FIN ->
        "UL_FIN"
    | UL_NEGATION ->
        "UL_NEGATION"
    | UL_PARFER ->
        "UL_PARFER"
    | UL_PAROUV ->
        "UL_PAROUV"
    | UL_PT ->
        "UL_PT"
    | UL_SYMBOLE _ ->
        "UL_SYMBOLE"
    | UL_VARIABLE _ ->
        "UL_VARIABLE"
    | UL_VIRG ->
        "UL_VIRG"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_goto_regle : type  ttv_stack. ttv_stack -> _ -> _menhir_box_programme =
    fun _menhir_stack _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_FIN ->
          let _v = _menhir_action_04 () in
          MenhirBox_programme _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_27 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_predicat -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_predicat (_menhir_stack, _, _) = _menhir_stack in
      let _ = _menhir_action_02 () in
      let _ = _menhir_action_06 () in
      _menhir_goto_regle _menhir_stack _tok
  
  let rec _menhir_goto_suite_deduction : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState18 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_suite_predicat -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_suite_predicat (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_08 () in
      _menhir_goto_suite_deduction _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VARIABLE _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | UL_SYMBOLE _v ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_UL_VARIABLE (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_VARIABLE _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04
          | UL_SYMBOLE _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04
          | _ ->
              _eRR ())
      | UL_PARFER ->
          let _ = _menhir_action_16 () in
          _menhir_goto_suite_variable _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PAROUV ->
          let _menhir_stack = MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _v) in
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer
      | UL_PARFER | UL_VIRG ->
          let _v = _menhir_action_17 () in
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_terme (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_VARIABLE _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
          | UL_SYMBOLE _v ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07
          | _ ->
              _eRR ())
      | UL_PARFER ->
          let _ = _menhir_action_14 () in
          _menhir_goto_suite_variable _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_suite_variable : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState02 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState04 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState07 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_UL_SYMBOLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_03 () in
      _menhir_goto_predicat _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_predicat : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState18 ->
          _menhir_run_26_spec_18 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState24 ->
          _menhir_run_26_spec_24 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState19 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState00 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_09_spec_02 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState04 ->
          _menhir_run_09_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState07 ->
          _menhir_run_09_spec_07 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_run_26_spec_18 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_predicat -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_09 () in
      _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
  
  and _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_VIRG ->
          let _menhir_stack = MenhirCell1_suite_predicat (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYMBOLE _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState24
          | UL_NEGATION ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState24
          | UL_ECHEC ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_11 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | UL_COUPURE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_12 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
          | _ ->
              _eRR ())
      | UL_PT ->
          let _ = _menhir_action_07 () in
          _menhir_goto_suite_deduction _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_NEGATION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | _ ->
          _eRR ()
  
  and _menhir_run_26_spec_24 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_suite_predicat -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_09 () in
      _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState24 _tok
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_NEGATION -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_NEGATION (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_10 () in
      _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_programme) _menhir_state -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_PT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _ = _menhir_action_01 () in
          let _ = _menhir_action_05 () in
          _menhir_goto_regle _menhir_stack _tok
      | UL_DEDUCTION ->
          let _menhir_stack = MenhirCell1_predicat (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_SYMBOLE _v_0 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState18
          | UL_NEGATION ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState18
          | UL_ECHEC ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_11 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
          | UL_COUPURE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_12 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState18 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_09_spec_02 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_SYMBOLE -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_18 () in
      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
  
  and _menhir_run_09_spec_04 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_VARIABLE -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_18 () in
      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_09_spec_07 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_terme -> _ -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_18 () in
      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
  
  and _menhir_run_10 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_UL_VARIABLE -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_UL_VARIABLE (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_13 () in
      _menhir_goto_suite_variable _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_08 : type  ttv_stack. (ttv_stack, _menhir_box_programme) _menhir_cell1_terme -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_terme (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_15 () in
      _menhir_goto_suite_variable _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_programme =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_SYMBOLE _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | _ ->
          _eRR ()
  
end

let programme =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_programme v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 61 "Parser.mly"
  

# 563 "Parser.ml"
