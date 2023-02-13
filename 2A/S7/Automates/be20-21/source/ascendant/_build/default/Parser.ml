
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | UL_TO
    | UL_STATE
    | UL_STARTS
    | UL_REGION
    | UL_PT
    | UL_ON
    | UL_MACHINE
    | UL_IDENT of (
# 17 "Parser.mly"
       (string)
# 22 "Parser.ml"
  )
    | UL_FROM
    | UL_FIN
    | UL_EVENT
    | UL_ENDS
    | UL_ACCOUV
    | UL_ACCFER
  
end

include MenhirBasics

# 1 "Parser.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 43 "Parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState04 : ('s _menhir_cell0_UL_IDENT, _menhir_box_machine) _menhir_state
    (** State 04.
        Stack shape : UL_IDENT.
        Start symbol: machine. *)

  | MenhirState07 : (('s, _menhir_box_machine) _menhir_cell1_UL_REGION _menhir_cell0_UL_IDENT, _menhir_box_machine) _menhir_state
    (** State 07.
        Stack shape : UL_REGION UL_IDENT.
        Start symbol: machine. *)

  | MenhirState14 : (('s, _menhir_box_machine) _menhir_cell1_UL_STATE _menhir_cell0_UL_IDENT _menhir_cell0_starts_bis _menhir_cell0_ends_bis, _menhir_box_machine) _menhir_state
    (** State 14.
        Stack shape : UL_STATE UL_IDENT starts_bis ends_bis.
        Start symbol: machine. *)

  | MenhirState15 : (('s, _menhir_box_machine) _menhir_cell1_region, _menhir_box_machine) _menhir_state
    (** State 15.
        Stack shape : region.
        Start symbol: machine. *)

  | MenhirState22 : (('s, _menhir_box_machine) _menhir_cell1_etat, _menhir_box_machine) _menhir_state
    (** State 22.
        Stack shape : etat.
        Start symbol: machine. *)

  | MenhirState26 : (('s, _menhir_box_machine) _menhir_cell1_UL_FROM, _menhir_box_machine) _menhir_state
    (** State 26.
        Stack shape : UL_FROM.
        Start symbol: machine. *)

  | MenhirState28 : (('s, _menhir_box_machine) _menhir_cell1_UL_IDENT, _menhir_box_machine) _menhir_state
    (** State 28.
        Stack shape : UL_IDENT.
        Start symbol: machine. *)

  | MenhirState31 : ((('s, _menhir_box_machine) _menhir_cell1_UL_FROM, _menhir_box_machine) _menhir_cell1_nomQualifie, _menhir_box_machine) _menhir_state
    (** State 31.
        Stack shape : UL_FROM nomQualifie.
        Start symbol: machine. *)

  | MenhirState39 : (('s, _menhir_box_machine) _menhir_cell1_machine_bis, _menhir_box_machine) _menhir_state
    (** State 39.
        Stack shape : machine_bis.
        Start symbol: machine. *)


and 's _menhir_cell0_ends_bis = 
  | MenhirCell0_ends_bis of 's * (unit)

and ('s, 'r) _menhir_cell1_etat = 
  | MenhirCell1_etat of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_machine_bis = 
  | MenhirCell1_machine_bis of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_nomQualifie = 
  | MenhirCell1_nomQualifie of 's * ('s, 'r) _menhir_state * (unit)

and ('s, 'r) _menhir_cell1_region = 
  | MenhirCell1_region of 's * ('s, 'r) _menhir_state * (unit)

and 's _menhir_cell0_starts_bis = 
  | MenhirCell0_starts_bis of 's * (unit)

and ('s, 'r) _menhir_cell1_UL_FROM = 
  | MenhirCell1_UL_FROM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_IDENT = 
  | MenhirCell1_UL_IDENT of 's * ('s, 'r) _menhir_state * (
# 17 "Parser.mly"
       (string)
# 117 "Parser.ml"
)

and 's _menhir_cell0_UL_IDENT = 
  | MenhirCell0_UL_IDENT of 's * (
# 17 "Parser.mly"
       (string)
# 124 "Parser.ml"
)

and ('s, 'r) _menhir_cell1_UL_REGION = 
  | MenhirCell1_UL_REGION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_UL_STATE = 
  | MenhirCell1_UL_STATE of 's * ('s, 'r) _menhir_state

and _menhir_box_machine = 
  | MenhirBox_machine of (unit) [@@unboxed]

let _menhir_action_01 =
  fun () ->
    (
# 53 "Parser.mly"
           ( (print_endline "ends_bis : mot vide") )
# 141 "Parser.ml"
     : (unit))

let _menhir_action_02 =
  fun () ->
    (
# 54 "Parser.mly"
                      ( (print_endline "ends_bis : UL_ENDS") )
# 149 "Parser.ml"
     : (unit))

let _menhir_action_03 =
  fun () ->
    (
# 48 "Parser.mly"
                                                        ( (print_endline "etat : UL_STATE UL_IDENT starts_bis ends_bis region_bis") )
# 157 "Parser.ml"
     : (unit))

let _menhir_action_04 =
  fun () ->
    (
# 59 "Parser.mly"
                ( (print_endline "liste_regions : mot vide") )
# 165 "Parser.ml"
     : (unit))

let _menhir_action_05 =
  fun () ->
    (
# 60 "Parser.mly"
                                   ( (print_endline "liste_regions : region liste_regions") )
# 173 "Parser.ml"
     : (unit))

let _menhir_action_06 =
  fun () ->
    (
# 31 "Parser.mly"
                                                                       ( (print_endline "machine : MACHINE IDENT { suite_machine } FIN ") )
# 181 "Parser.ml"
     : (unit))

let _menhir_action_07 =
  fun () ->
    (
# 36 "Parser.mly"
                                ( (print_endline "machine_bis : UL_IDENT UL_EVENT") )
# 189 "Parser.ml"
     : (unit))

let _menhir_action_08 =
  fun () ->
    (
# 37 "Parser.mly"
                          ( (print_endline "machine_bis : transition") )
# 197 "Parser.ml"
     : (unit))

let _menhir_action_09 =
  fun () ->
    (
# 38 "Parser.mly"
                      ( (print_endline "machine_bis : region") )
# 205 "Parser.ml"
     : (unit))

let _menhir_action_10 =
  fun () ->
    (
# 41 "Parser.mly"
                       ( (print_endline "nomQualifie : UL_IDENT") )
# 213 "Parser.ml"
     : (unit))

let _menhir_action_11 =
  fun () ->
    (
# 42 "Parser.mly"
                                          ( (print_endline "nomQualifie : UL_IDENT UL_PT nomQualifie") )
# 221 "Parser.ml"
     : (unit))

let _menhir_action_12 =
  fun () ->
    (
# 43 "Parser.mly"
                                                           ( (print_endline "region : UL_REGION UL_IDENT UL_ACCOUV suite_etat UL_ACCFER") )
# 229 "Parser.ml"
     : (unit))

let _menhir_action_13 =
  fun () ->
    (
# 56 "Parser.mly"
             ( (print_endline "region_bis : mot vide") )
# 237 "Parser.ml"
     : (unit))

let _menhir_action_14 =
  fun () ->
    (
# 57 "Parser.mly"
                                                ( (print_endline "region_bis : UL_ACCOUV liste_regions UL_ACCFER") )
# 245 "Parser.ml"
     : (unit))

let _menhir_action_15 =
  fun () ->
    (
# 50 "Parser.mly"
             ( (print_endline "starts_bis : mot vide") )
# 253 "Parser.ml"
     : (unit))

let _menhir_action_16 =
  fun () ->
    (
# 51 "Parser.mly"
                        ( (print_endline "starts_bis : UL_STARTS") )
# 261 "Parser.ml"
     : (unit))

let _menhir_action_17 =
  fun () ->
    (
# 45 "Parser.mly"
                  ( (print_endline "suite_etat : etat ") )
# 269 "Parser.ml"
     : (unit))

let _menhir_action_18 =
  fun () ->
    (
# 46 "Parser.mly"
                              ( (print_endline "suite_etat : etat suite_etat") )
# 277 "Parser.ml"
     : (unit))

let _menhir_action_19 =
  fun () ->
    (
# 33 "Parser.mly"
                ( (print_endline "suite_machine : mot vide") )
# 285 "Parser.ml"
     : (unit))

let _menhir_action_20 =
  fun () ->
    (
# 34 "Parser.mly"
                                            ( (print_endline "suite_machine : machine_bis suite_machine"))
# 293 "Parser.ml"
     : (unit))

let _menhir_action_21 =
  fun () ->
    (
# 39 "Parser.mly"
                                                                  ( (print_endline "transition : from nomQualifie to nomQualifie on ident") )
# 301 "Parser.ml"
     : (unit))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | UL_ACCFER ->
        "UL_ACCFER"
    | UL_ACCOUV ->
        "UL_ACCOUV"
    | UL_ENDS ->
        "UL_ENDS"
    | UL_EVENT ->
        "UL_EVENT"
    | UL_FIN ->
        "UL_FIN"
    | UL_FROM ->
        "UL_FROM"
    | UL_IDENT _ ->
        "UL_IDENT"
    | UL_MACHINE ->
        "UL_MACHINE"
    | UL_ON ->
        "UL_ON"
    | UL_PT ->
        "UL_PT"
    | UL_REGION ->
        "UL_REGION"
    | UL_STARTS ->
        "UL_STARTS"
    | UL_STATE ->
        "UL_STATE"
    | UL_TO ->
        "UL_TO"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_36 : type  ttv_stack. ttv_stack _menhir_cell0_UL_IDENT -> _menhir_box_machine =
    fun _menhir_stack ->
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let _v = _menhir_action_06 () in
      MenhirBox_machine _v
  
  let rec _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_machine_bis -> _menhir_box_machine =
    fun _menhir_stack ->
      let MenhirCell1_machine_bis (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_20 () in
      _menhir_goto_suite_machine _menhir_stack _menhir_s
  
  and _menhir_goto_suite_machine : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_s ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_40 _menhir_stack
      | MenhirState04 ->
          _menhir_run_36 _menhir_stack
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_05 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_REGION (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_ACCOUV ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_STATE ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_STATE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_STARTS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_16 () in
              _menhir_goto_starts_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | UL_ACCFER | UL_ACCOUV | UL_ENDS | UL_STATE ->
              let _v = _menhir_action_15 () in
              _menhir_goto_starts_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_starts_bis : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_STATE _menhir_cell0_UL_IDENT -> _ -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_starts_bis (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_ENDS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_02 () in
          _menhir_goto_ends_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | UL_ACCFER | UL_ACCOUV | UL_STATE ->
          let _v = _menhir_action_01 () in
          _menhir_goto_ends_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_ends_bis : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_STATE _menhir_cell0_UL_IDENT _menhir_cell0_starts_bis -> _ -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_ends_bis (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_ACCOUV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_REGION ->
              _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState14
          | UL_ACCFER ->
              let _ = _menhir_action_04 () in
              _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
          | _ ->
              _eRR ())
      | UL_ACCFER | UL_STATE ->
          let _ = _menhir_action_13 () in
          _menhir_goto_region_bis _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_STATE _menhir_cell0_UL_IDENT _menhir_cell0_starts_bis _menhir_cell0_ends_bis -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _ = _menhir_action_14 () in
      _menhir_goto_region_bis _menhir_stack _menhir_lexbuf _menhir_lexer _tok
  
  and _menhir_goto_region_bis : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_STATE _menhir_cell0_UL_IDENT _menhir_cell0_starts_bis _menhir_cell0_ends_bis -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell0_ends_bis (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_starts_bis (_menhir_stack, _) = _menhir_stack in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_STATE (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_03 () in
      match (_tok : MenhirBasics.token) with
      | UL_STATE ->
          let _menhir_stack = MenhirCell1_etat (_menhir_stack, _menhir_s, _v) in
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
      | UL_ACCFER ->
          let _ = _menhir_action_17 () in
          _menhir_goto_suite_etat _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_suite_etat : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState07 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_23 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_etat -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_etat (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_18 () in
      _menhir_goto_suite_etat _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_run_20 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_REGION _menhir_cell0_UL_IDENT -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_UL_IDENT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_UL_REGION (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_12 () in
      _menhir_goto_region _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_region : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState39 ->
          _menhir_run_38_spec_39 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState04 ->
          _menhir_run_38_spec_04 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState15 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_38_spec_39 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_machine_bis -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_09 () in
      _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState39 _tok
  
  and _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_machine_bis (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_REGION ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | UL_IDENT _ ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | UL_FROM ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | UL_FIN ->
          let _ = _menhir_action_19 () in
          _menhir_run_40 _menhir_stack
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_EVENT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_goto_machine_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_machine_bis : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_26 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_UL_FROM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_IDENT _v ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_PT ->
          let _menhir_stack = MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _v ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState28
          | _ ->
              _eRR ())
      | UL_ON | UL_TO ->
          let _v = _menhir_action_10 () in
          _menhir_goto_nomQualifie _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nomQualifie : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState31 ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState26 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_32 : type  ttv_stack. ((ttv_stack, _menhir_box_machine) _menhir_cell1_UL_FROM, _menhir_box_machine) _menhir_cell1_nomQualifie -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      match (_tok : MenhirBasics.token) with
      | UL_ON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _ ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_nomQualifie (_menhir_stack, _, _) = _menhir_stack in
              let MenhirCell1_UL_FROM (_menhir_stack, _menhir_s) = _menhir_stack in
              let _ = _menhir_action_21 () in
              let _v = _menhir_action_08 () in
              _menhir_goto_machine_bis _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_machine) _menhir_cell1_UL_FROM as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_nomQualifie (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_TO ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _v ->
              _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState31
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_UL_IDENT -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_UL_IDENT (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _v = _menhir_action_11 () in
      _menhir_goto_nomQualifie _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_38_spec_04 : type  ttv_stack. ttv_stack _menhir_cell0_UL_IDENT -> _ -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let _v = _menhir_action_09 () in
      _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState04 _tok
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_region (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | UL_REGION ->
          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | UL_ACCFER ->
          let _ = _menhir_action_04 () in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_machine) _menhir_cell1_region -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let MenhirCell1_region (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _ = _menhir_action_05 () in
      _menhir_goto_liste_regions _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
  
  and _menhir_goto_liste_regions : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_machine) _menhir_state -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      match _menhir_s with
      | MenhirState14 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_machine =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UL_MACHINE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UL_IDENT _v ->
              let _menhir_stack = MenhirCell0_UL_IDENT (_menhir_stack, _v) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | UL_ACCOUV ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | UL_ACCFER ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | UL_REGION ->
                          _menhir_run_05 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
                      | UL_IDENT _ ->
                          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
                      | UL_FROM ->
                          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState04
                      | UL_FIN ->
                          let _ = _menhir_action_19 () in
                          _menhir_run_36 _menhir_stack
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let machine =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_machine v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 62 "Parser.mly"
  

# 699 "Parser.ml"
