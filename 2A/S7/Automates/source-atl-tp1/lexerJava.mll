{

  open TokenJava
(*  open String *)
(*  open Str *)
  exception LexicalError

}

(* Macro-definitions *)
let minuscule = ['a'-'z']
let majuscule = ['A'-'Z']
let chiffre = ['0'-'9']
let alphabet = minuscule | majuscule
let alphanum = alphabet | chiffre | '_'
let commentaireBloc = (* A COMPLETER *) "/*" _* "*/" "/*" '*'* [^ '*']* ([^ '*' '/'] '*'* [^ '*']*) '/' 
let commentaireLigne = "//" [^'\n']* '\n'

let integerTypeSuffix = 'l' | 'L'


let nonZeroDigit = ['1'-'9']
let underscore = '_'
let underscores = underscore underscore*
let digit = '0' | nonZeroDigit
let digitAndUnderscores = (digit | underscore) (digit | underscore)*
let digits = digit | digit (digitAndUnderscores)? digit
let decimalNumeral = '0' | nonZeroDigit (digits)? | nonZeroDigit underscores digits
(* HexNumeral *)
let hexDigit = ['0'-'9'] | ['a'-'e'] | ['A'-'F']
let hexDigitOrUnderscore = hexDigit | underscore
let hexDigitsAndUnderscores = hexDigitOrUnderscore (hexDigitOrUnderscore)*
let hexDigits = hexDigit | hexDigit (hexDigitsAndUnderscores)? hexDigit
let hexNumeral = '0' ('x'|'X') hexDigits
(* OctalNumeral *)
let octalDigit = ['0'-'7']
let octalDigitOrUnderscore = octalDigit | underscore
let octalDigitsAndUnderscores = octalDigitOrUnderscore (octalDigitOrUnderscore)*
let octalDigits = octalDigit | octalDigit (octalDigitsAndUnderscores)? octalDigit
let octalNumeral = '0' octalDigits | '0' underscores octalDigits
(* BinaryNumeral *)
let binaryDigit = ['0'-'1']
let binaryDigitOrUnderscore = binaryDigit | underscore
let binaryDigitAndUnderscores = binaryDigitOrUnderscore (binaryDigitOrUnderscore)*
let binaryDigits = binaryDigit | binaryDigit (binaryDigitAndUnderscores)? binaryDigit
let binaryNumeral = '0' ('b'|'B') binaryDigits

let floatTypeSuffix = 'f'|'d'|'F'|'D'
(* decimalFloating *)
let sign = '+' | '-'
let signedInteger = (sign)? digits
let exponentIndicator = 'e' | 'E'
let exponentPart = exponentIndicator signedInteger
let decimalFloating = digits '.' (digits)? (exponentPart)? (floatTypeSuffix)? | '.' digits (exponentPart)? (floatTypeSuffix)? | digits exponentPart (floatTypeSuffix)? | digits (exponentPart)? floatTypeSuffix
(* hexadecimalFloating *)
let binaryExponentIndicator = 'p' | 'P'
let binaryExponent = binaryExponentIndicator signedInteger
let hexSignificand = hexNumeral ('.')? | '0' ('x'|'X') (hexDigits)? '.' hexDigits
let hexadecimalFloating = hexSignificand binaryExponent (floatTypeSuffix)

rule lexer = parse
(* Espace, tab, retour à la ligne *)
  | ['\n' '\t' ' ']+ { lexer lexbuf }

(* Commentaires consommes par l'analyse lexicale *)
  | commentaireBloc  	{ lexer lexbuf }
  | commentaireLigne	{ lexer lexbuf }
(* Structures de blocs *)
  | "("                 { PAROUV }
  | ")"                 { PARFER }
  | "["                 { CROOUV }
  | "]"                 { CROFER }
  | "{"                 { ACCOUV }
  | "}"                 { ACCFER }
(* Separateurs *)
  | ","                 { VIRG }
  | ";"                 { PTVIRG }
(* Operateurs booleens *)
  | "||"                { OPOU }
  | "&&"                { OPET }
  | "!"                 { OPNON }
(* Operateurs comparaisons *)
  | "=="                { OPEG }
  | "!="                { OPNONEG }
  | "<="                { OPSUPEG }
  | "<"                 { OPSUP }
  | ">="                { OPINFEG }
  | ">"                 { OPINF }
(* Operateurs arithmetiques *)
  | "+"                 { OPPLUS }
  | "-"                 { OPMOINS }
  | "*"                 { OPMULT }
  | "/"                 { OPDIV }
  | "%"                 { OPMOD }
  | "."                 { OPPT }
  | "="                 { ASSIGN }
  | "new"               { NOUVEAU }
(* Mots cles : types *)
  | "bool"              { BOOL }
  | "char"              { CHAR }
  | "float"             { FLOAT }
  | "int"               { INT }
  | "String"            { STRING }
  | "void"              { VOID }
(* Mots cles : instructions *)
  | "while"		{ TANTQUE }
  | "if"		{ SI }
  | "else"		{ SINON }
  | "return"		{ RETOUR }
(* Mots cles : constantes *)
  | "true"		{ (BOOLEEN true) }
  | "false"		{ (BOOLEEN false) }
  | "null"		{ VIDE }
(* Nombres entiers : A COMPLETER *)
  | decimalNumeral (integerTypeSuffix)? as texte   { (ENTIER (int_of_string texte)) }
  | hexNumeral (integerTypeSuffix)? as texte { (ENTIER (int_of_string texte)) }
  | octalNumeral (integerTypeSuffix)? as texte { (ENTIER (int_of_string texte)) }
  | binaryNumeral (integerTypeSuffix)? as texte { (ENTIER (int_of_string texte))}

(* Nombres flottants : A COMPLETER *)
  | decimalFloating as texte     { (FLOTTANT (float_of_string texte)) }
  | hexadecimalFloating as texte  { (FLOTTANT (float_of_string texte)) }

(* Caracteres : A COMPLETER *)
  | "'" [^'\\'] "'" as texte                   { CARACTERE texte.[1] }
  | "'" ("\\b" | "\\t" | "\\n" | "\\f" | "\\r" | "\\\"" | "\\\'" | "\\\\") "'" as texte { CARACTERE texte.[1] }
(* Chaines de caracteres : A COMPLETER *)
  | '"' _* '"' as texte                  { CHAINE texte }
(* Identificateurs *)
  | majuscule alphanum* as texte              { TYPEIDENT texte }
  | minuscule alphanum* as texte              { IDENT texte }
  | eof                                       { FIN }
  | _                                         { raise LexicalError }

{

}
