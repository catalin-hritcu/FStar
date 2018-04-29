open Prims
type assoc =
  | ILeft 
  | IRight 
  | Left 
  | Right 
  | NonAssoc [@@deriving show]
let (uu___is_ILeft : assoc -> Prims.bool) =
  fun projectee  -> match projectee with | ILeft  -> true | uu____6 -> false 
let (uu___is_IRight : assoc -> Prims.bool) =
  fun projectee  ->
    match projectee with | IRight  -> true | uu____12 -> false
  
let (uu___is_Left : assoc -> Prims.bool) =
  fun projectee  -> match projectee with | Left  -> true | uu____18 -> false 
let (uu___is_Right : assoc -> Prims.bool) =
  fun projectee  -> match projectee with | Right  -> true | uu____24 -> false 
let (uu___is_NonAssoc : assoc -> Prims.bool) =
  fun projectee  ->
    match projectee with | NonAssoc  -> true | uu____30 -> false
  
type fixity =
  | Prefix 
  | Postfix 
  | Infix of assoc [@@deriving show]
let (uu___is_Prefix : fixity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Prefix  -> true | uu____41 -> false
  
let (uu___is_Postfix : fixity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Postfix  -> true | uu____47 -> false
  
let (uu___is_Infix : fixity -> Prims.bool) =
  fun projectee  ->
    match projectee with | Infix _0 -> true | uu____54 -> false
  
let (__proj__Infix__item___0 : fixity -> assoc) =
  fun projectee  -> match projectee with | Infix _0 -> _0 
type opprec = (Prims.int,fixity) FStar_Pervasives_Native.tuple2[@@deriving
                                                                 show]
type level = (opprec,assoc) FStar_Pervasives_Native.tuple2[@@deriving show]
let (t_prio_fun : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "10"), (Infix Right)) 
let (t_prio_tpl : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "20"), (Infix NonAssoc)) 
let (t_prio_name : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "30"), Postfix) 
let (e_bin_prio_lambda : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "5"), Prefix) 
let (e_bin_prio_if : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "15"), Prefix) 
let (e_bin_prio_letin : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "19"), Prefix) 
let (e_bin_prio_or : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "20"), (Infix Left)) 
let (e_bin_prio_and : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "25"), (Infix Left)) 
let (e_bin_prio_eq : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "27"), (Infix NonAssoc)) 
let (e_bin_prio_order : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "29"), (Infix NonAssoc)) 
let (e_bin_prio_op1 : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "30"), (Infix Left)) 
let (e_bin_prio_op2 : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "40"), (Infix Left)) 
let (e_bin_prio_op3 : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "50"), (Infix Left)) 
let (e_bin_prio_op4 : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "60"), (Infix Left)) 
let (e_bin_prio_comb : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "70"), (Infix Left)) 
let (e_bin_prio_seq : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "100"), (Infix Left)) 
let (e_app_prio : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((Prims.parse_int "10000"), (Infix Left)) 
let (min_op_prec : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  ((~- (Prims.parse_int "1")), (Infix NonAssoc)) 
let (max_op_prec : (Prims.int,fixity) FStar_Pervasives_Native.tuple2) =
  (FStar_Util.max_int, (Infix NonAssoc)) 
let rec in_ns :
  'a .
    ('a Prims.list,'a Prims.list) FStar_Pervasives_Native.tuple2 ->
      Prims.bool
  =
  fun x  ->
    match x with
    | ([],uu____173) -> true
    | (x1::t1,x2::t2) when x1 = x2 -> in_ns (t1, t2)
    | (uu____196,uu____197) -> false
  
let (path_of_ns :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    Prims.string Prims.list -> Prims.string Prims.list)
  =
  fun currentModule  ->
    fun ns  ->
      let ns' = FStar_Extraction_ML_Util.flatten_ns ns  in
      if ns' = currentModule
      then []
      else
        (let cg_libs = FStar_Options.codegen_libs ()  in
         let ns_len = FStar_List.length ns  in
         let found =
           FStar_Util.find_map cg_libs
             (fun cg_path  ->
                let cg_len = FStar_List.length cg_path  in
                if (FStar_List.length cg_path) < ns_len
                then
                  let uu____259 = FStar_Util.first_N cg_len ns  in
                  match uu____259 with
                  | (pfx,sfx) ->
                      (if pfx = cg_path
                       then
                         let uu____292 =
                           let uu____295 =
                             let uu____298 =
                               FStar_Extraction_ML_Util.flatten_ns sfx  in
                             [uu____298]  in
                           FStar_List.append pfx uu____295  in
                         FStar_Pervasives_Native.Some uu____292
                       else FStar_Pervasives_Native.None)
                else FStar_Pervasives_Native.None)
            in
         match found with
         | FStar_Pervasives_Native.None  -> [ns']
         | FStar_Pervasives_Native.Some x -> x)
  
let (mlpath_of_mlpath :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlpath)
  =
  fun currentModule  ->
    fun x  ->
      let uu____326 = FStar_Extraction_ML_Syntax.string_of_mlpath x  in
      match uu____326 with
      | "Prims.Some" -> ([], "Some")
      | "Prims.None" -> ([], "None")
      | uu____331 ->
          let uu____332 = x  in
          (match uu____332 with
           | (ns,x1) ->
               let uu____339 = path_of_ns currentModule ns  in
               (uu____339, x1))
  
let (ptsym_of_symbol :
  FStar_Extraction_ML_Syntax.mlsymbol -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun s  ->
    let uu____349 =
      let uu____350 =
        let uu____352 = FStar_String.get s (Prims.parse_int "0")  in
        FStar_Char.lowercase uu____352  in
      let uu____354 = FStar_String.get s (Prims.parse_int "0")  in
      uu____350 <> uu____354  in
    if uu____349 then Prims.strcat "l__" s else s
  
let (ptsym :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun currentModule  ->
    fun mlp  ->
      if FStar_List.isEmpty (FStar_Pervasives_Native.fst mlp)
      then ptsym_of_symbol (FStar_Pervasives_Native.snd mlp)
      else
        (let uu____373 = mlpath_of_mlpath currentModule mlp  in
         match uu____373 with
         | (p,s) ->
             let uu____380 =
               let uu____383 =
                 let uu____386 = ptsym_of_symbol s  in [uu____386]  in
               FStar_List.append p uu____383  in
             FStar_String.concat "." uu____380)
  
let (ptctor :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath -> FStar_Extraction_ML_Syntax.mlsymbol)
  =
  fun currentModule  ->
    fun mlp  ->
      let uu____397 = mlpath_of_mlpath currentModule mlp  in
      match uu____397 with
      | (p,s) ->
          let s1 =
            let uu____405 =
              let uu____406 =
                let uu____408 = FStar_String.get s (Prims.parse_int "0")  in
                FStar_Char.uppercase uu____408  in
              let uu____410 = FStar_String.get s (Prims.parse_int "0")  in
              uu____406 <> uu____410  in
            if uu____405 then Prims.strcat "U__" s else s  in
          FStar_String.concat "." (FStar_List.append p [s1])
  
let (infix_prim_ops :
  (Prims.string,(Prims.int,fixity) FStar_Pervasives_Native.tuple2,Prims.string)
    FStar_Pervasives_Native.tuple3 Prims.list)
  =
  [("op_Addition", e_bin_prio_op1, "+");
  ("op_Subtraction", e_bin_prio_op1, "-");
  ("op_Multiply", e_bin_prio_op1, "*");
  ("op_Division", e_bin_prio_op1, "/");
  ("op_Equality", e_bin_prio_eq, "=");
  ("op_Colon_Equals", e_bin_prio_eq, ":=");
  ("op_disEquality", e_bin_prio_eq, "<>");
  ("op_AmpAmp", e_bin_prio_and, "&&");
  ("op_BarBar", e_bin_prio_or, "||");
  ("op_LessThanOrEqual", e_bin_prio_order, "<=");
  ("op_GreaterThanOrEqual", e_bin_prio_order, ">=");
  ("op_LessThan", e_bin_prio_order, "<");
  ("op_GreaterThan", e_bin_prio_order, ">");
  ("op_Modulus", e_bin_prio_order, "mod")] 
let (prim_uni_ops :
  unit ->
    (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun uu____642  ->
    let op_minus =
      let uu____644 =
        let uu____645 = FStar_Options.codegen ()  in
        uu____645 = (FStar_Pervasives_Native.Some FStar_Options.FSharp)  in
      if uu____644 then "-" else "~-"  in
    [("op_Negation", "not");
    ("op_Minus", op_minus);
    ("op_Bang", "Support.ST.read")]
  
let prim_types : 'Auu____669 . unit -> 'Auu____669 Prims.list =
  fun uu____672  -> [] 
let (prim_constructors :
  (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 Prims.list) =
  [("Some", "Some"); ("None", "None"); ("Nil", "[]"); ("Cons", "::")] 
let (is_prims_ns :
  FStar_Extraction_ML_Syntax.mlsymbol Prims.list -> Prims.bool) =
  fun ns  -> ns = ["Prims"] 
let (as_bin_op :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol,(Prims.int,fixity)
                                           FStar_Pervasives_Native.tuple2,
      Prims.string) FStar_Pervasives_Native.tuple3
      FStar_Pervasives_Native.option)
  =
  fun uu____726  ->
    match uu____726 with
    | (ns,x) ->
        if is_prims_ns ns
        then
          FStar_List.tryFind
            (fun uu____771  ->
               match uu____771 with | (y,uu____783,uu____784) -> x = y)
            infix_prim_ops
        else FStar_Pervasives_Native.None
  
let (is_bin_op : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p  ->
    let uu____809 = as_bin_op p  in uu____809 <> FStar_Pervasives_Native.None
  
let (as_uni_op :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol,Prims.string)
      FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
  =
  fun uu____854  ->
    match uu____854 with
    | (ns,x) ->
        if is_prims_ns ns
        then
          let uu____873 = prim_uni_ops ()  in
          FStar_List.tryFind
            (fun uu____887  -> match uu____887 with | (y,uu____893) -> x = y)
            uu____873
        else FStar_Pervasives_Native.None
  
let (is_uni_op : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p  ->
    let uu____904 = as_uni_op p  in uu____904 <> FStar_Pervasives_Native.None
  
let (is_standard_type : FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p  -> false 
let (as_standard_constructor :
  FStar_Extraction_ML_Syntax.mlpath ->
    (FStar_Extraction_ML_Syntax.mlsymbol,Prims.string)
      FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option)
  =
  fun uu____936  ->
    match uu____936 with
    | (ns,x) ->
        if is_prims_ns ns
        then
          FStar_List.tryFind
            (fun uu____962  -> match uu____962 with | (y,uu____968) -> x = y)
            prim_constructors
        else FStar_Pervasives_Native.None
  
let (is_standard_constructor :
  FStar_Extraction_ML_Syntax.mlpath -> Prims.bool) =
  fun p  ->
    let uu____979 = as_standard_constructor p  in
    uu____979 <> FStar_Pervasives_Native.None
  
let (maybe_paren :
  ((Prims.int,fixity) FStar_Pervasives_Native.tuple2,assoc)
    FStar_Pervasives_Native.tuple2 ->
    (Prims.int,fixity) FStar_Pervasives_Native.tuple2 ->
      FStar_Format.doc -> FStar_Format.doc)
  =
  fun uu____1020  ->
    fun inner  ->
      fun doc1  ->
        match uu____1020 with
        | (outer,side) ->
            let noparens _inner _outer side1 =
              let uu____1077 = _inner  in
              match uu____1077 with
              | (pi,fi) ->
                  let uu____1084 = _outer  in
                  (match uu____1084 with
                   | (po,fo) ->
                       (pi > po) ||
                         ((match (fi, side1) with
                           | (Postfix ,Left ) -> true
                           | (Prefix ,Right ) -> true
                           | (Infix (Left ),Left ) ->
                               (pi = po) && (fo = (Infix Left))
                           | (Infix (Right ),Right ) ->
                               (pi = po) && (fo = (Infix Right))
                           | (Infix (Left ),ILeft ) ->
                               (pi = po) && (fo = (Infix Left))
                           | (Infix (Right ),IRight ) ->
                               (pi = po) && (fo = (Infix Right))
                           | (uu____1091,NonAssoc ) -> (pi = po) && (fi = fo)
                           | (uu____1092,uu____1093) -> false)))
               in
            if noparens inner outer side
            then doc1
            else FStar_Format.parens doc1
  
let (escape_byte_hex : FStar_BaseTypes.byte -> Prims.string) =
  fun x  -> Prims.strcat "\\x" (FStar_Util.hex_string_of_byte x) 
let (escape_char_hex : FStar_BaseTypes.char -> Prims.string) =
  fun x  -> escape_byte_hex (FStar_Util.byte_of_char x) 
let (escape_or :
  (FStar_Char.char -> Prims.string) -> FStar_Char.char -> Prims.string) =
  fun fallback  ->
    fun uu___65_1119  ->
      match uu___65_1119 with
      | c when c = 92 -> "\\\\"
      | c when c = 32 -> " "
      | c when c = 8 -> "\\b"
      | c when c = 9 -> "\\t"
      | c when c = 13 -> "\\r"
      | c when c = 10 -> "\\n"
      | c when c = 39 -> "\\'"
      | c when c = 34 -> "\\\""
      | c when FStar_Util.is_letter_or_digit c -> FStar_Util.string_of_char c
      | c when FStar_Util.is_punctuation c -> FStar_Util.string_of_char c
      | c when FStar_Util.is_symbol c -> FStar_Util.string_of_char c
      | c -> fallback c
  
let (string_of_mlconstant :
  FStar_Extraction_ML_Syntax.mlconstant -> Prims.string) =
  fun sctt  ->
    match sctt with
    | FStar_Extraction_ML_Syntax.MLC_Unit  -> "()"
    | FStar_Extraction_ML_Syntax.MLC_Bool (true ) -> "true"
    | FStar_Extraction_ML_Syntax.MLC_Bool (false ) -> "false"
    | FStar_Extraction_ML_Syntax.MLC_Char c ->
        let nc = FStar_Char.int_of_char c  in
        let uu____1171 = FStar_Util.string_of_int nc  in
        Prims.strcat uu____1171
          (if
             ((nc >= (Prims.parse_int "32")) &&
                (nc <= (Prims.parse_int "127")))
               && (nc <> (Prims.parse_int "34"))
           then
             Prims.strcat " (*"
               (Prims.strcat (FStar_Util.string_of_char c) "*)")
           else "")
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s,FStar_Pervasives_Native.Some
         (FStar_Const.Signed ,FStar_Const.Int32 ))
        -> Prims.strcat s "l"
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s,FStar_Pervasives_Native.Some
         (FStar_Const.Signed ,FStar_Const.Int64 ))
        -> Prims.strcat s "L"
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s,FStar_Pervasives_Native.Some (uu____1218,FStar_Const.Int8 )) -> s
    | FStar_Extraction_ML_Syntax.MLC_Int
        (s,FStar_Pervasives_Native.Some (uu____1230,FStar_Const.Int16 )) -> s
    | FStar_Extraction_ML_Syntax.MLC_Int (s,FStar_Pervasives_Native.None ) ->
        Prims.strcat "(Prims.parse_int \"" (Prims.strcat s "\")")
    | FStar_Extraction_ML_Syntax.MLC_Float d -> FStar_Util.string_of_float d
    | FStar_Extraction_ML_Syntax.MLC_Bytes bytes ->
        let uu____1256 =
          let uu____1257 =
            FStar_Compiler_Bytes.f_encode escape_byte_hex bytes  in
          Prims.strcat uu____1257 "\""  in
        Prims.strcat "\"" uu____1256
    | FStar_Extraction_ML_Syntax.MLC_String chars ->
        let uu____1259 =
          let uu____1260 =
            FStar_String.collect (escape_or FStar_Util.string_of_char) chars
             in
          Prims.strcat uu____1260 "\""  in
        Prims.strcat "\"" uu____1259
    | uu____1261 ->
        failwith "TODO: extract integer constants properly into OCaml"
  
let rec (doc_of_mltype' :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlty -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun outer  ->
      fun ty  ->
        match ty with
        | FStar_Extraction_ML_Syntax.MLTY_Var x ->
            let escape_tyvar s =
              if FStar_Util.starts_with s "'_"
              then FStar_Util.replace_char s 95 117
              else s  in
            FStar_Format.text (escape_tyvar x)
        | FStar_Extraction_ML_Syntax.MLTY_Tuple tys ->
            let doc1 =
              FStar_List.map (doc_of_mltype currentModule (t_prio_tpl, Left))
                tys
               in
            let doc2 =
              let uu____1306 =
                let uu____1307 =
                  FStar_Format.combine (FStar_Format.text " * ") doc1  in
                FStar_Format.hbox uu____1307  in
              FStar_Format.parens uu____1306  in
            doc2
        | FStar_Extraction_ML_Syntax.MLTY_Named (args,name) ->
            let args1 =
              match args with
              | [] -> FStar_Format.empty
              | arg::[] ->
                  doc_of_mltype currentModule (t_prio_name, Left) arg
              | uu____1316 ->
                  let args1 =
                    FStar_List.map
                      (doc_of_mltype currentModule (min_op_prec, NonAssoc))
                      args
                     in
                  let uu____1322 =
                    let uu____1323 =
                      FStar_Format.combine (FStar_Format.text ", ") args1  in
                    FStar_Format.hbox uu____1323  in
                  FStar_Format.parens uu____1322
               in
            let name1 = ptsym currentModule name  in
            let uu____1325 =
              FStar_Format.reduce1 [args1; FStar_Format.text name1]  in
            FStar_Format.hbox uu____1325
        | FStar_Extraction_ML_Syntax.MLTY_Fun (t1,uu____1327,t2) ->
            let d1 = doc_of_mltype currentModule (t_prio_fun, Left) t1  in
            let d2 = doc_of_mltype currentModule (t_prio_fun, Right) t2  in
            let uu____1331 =
              let uu____1332 =
                FStar_Format.reduce1 [d1; FStar_Format.text " -> "; d2]  in
              FStar_Format.hbox uu____1332  in
            maybe_paren outer t_prio_fun uu____1331
        | FStar_Extraction_ML_Syntax.MLTY_Top  ->
            let uu____1333 = FStar_Extraction_ML_Util.codegen_fsharp ()  in
            if uu____1333
            then FStar_Format.text "obj"
            else FStar_Format.text "Obj.t"
        | FStar_Extraction_ML_Syntax.MLTY_Erased  -> FStar_Format.text "unit"

and (doc_of_mltype :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlty -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun outer  ->
      fun ty  ->
        let uu____1338 = FStar_Extraction_ML_Util.resugar_mlty ty  in
        doc_of_mltype' currentModule outer uu____1338

let rec (doc_of_expr :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    level -> FStar_Extraction_ML_Syntax.mlexpr -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun outer  ->
      fun e  ->
        match e.FStar_Extraction_ML_Syntax.expr with
        | FStar_Extraction_ML_Syntax.MLE_Coerce (e1,t,t') ->
            let doc1 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1
               in
            let uu____1422 = FStar_Extraction_ML_Util.codegen_fsharp ()  in
            if uu____1422
            then
              let uu____1423 =
                FStar_Format.reduce
                  [FStar_Format.text "Prims.unsafe_coerce "; doc1]
                 in
              FStar_Format.parens uu____1423
            else
              (let uu____1425 =
                 FStar_Format.reduce
                   [FStar_Format.text "Obj.magic "; FStar_Format.parens doc1]
                  in
               FStar_Format.parens uu____1425)
        | FStar_Extraction_ML_Syntax.MLE_Seq es ->
            let docs =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) es
               in
            let docs1 =
              FStar_List.map
                (fun d  ->
                   FStar_Format.reduce
                     [d; FStar_Format.text ";"; FStar_Format.hardline]) docs
               in
            let uu____1437 = FStar_Format.reduce docs1  in
            FStar_Format.parens uu____1437
        | FStar_Extraction_ML_Syntax.MLE_Const c ->
            let uu____1439 = string_of_mlconstant c  in
            FStar_Format.text uu____1439
        | FStar_Extraction_ML_Syntax.MLE_Var x -> FStar_Format.text x
        | FStar_Extraction_ML_Syntax.MLE_Name path ->
            let uu____1442 = ptsym currentModule path  in
            FStar_Format.text uu____1442
        | FStar_Extraction_ML_Syntax.MLE_Record (path,fields) ->
            let for1 uu____1470 =
              match uu____1470 with
              | (name,e1) ->
                  let doc1 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1  in
                  let uu____1478 =
                    let uu____1481 =
                      let uu____1482 = ptsym currentModule (path, name)  in
                      FStar_Format.text uu____1482  in
                    [uu____1481; FStar_Format.text "="; doc1]  in
                  FStar_Format.reduce1 uu____1478
               in
            let uu____1485 =
              let uu____1486 = FStar_List.map for1 fields  in
              FStar_Format.combine (FStar_Format.text "; ") uu____1486  in
            FStar_Format.cbrackets uu____1485
        | FStar_Extraction_ML_Syntax.MLE_CTor (ctor,[]) ->
            let name =
              let uu____1497 = is_standard_constructor ctor  in
              if uu____1497
              then
                let uu____1498 =
                  let uu____1503 = as_standard_constructor ctor  in
                  FStar_Option.get uu____1503  in
                FStar_Pervasives_Native.snd uu____1498
              else ptctor currentModule ctor  in
            FStar_Format.text name
        | FStar_Extraction_ML_Syntax.MLE_CTor (ctor,args) ->
            let name =
              let uu____1522 = is_standard_constructor ctor  in
              if uu____1522
              then
                let uu____1523 =
                  let uu____1528 = as_standard_constructor ctor  in
                  FStar_Option.get uu____1528  in
                FStar_Pervasives_Native.snd uu____1523
              else ptctor currentModule ctor  in
            let args1 =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) args
               in
            let doc1 =
              match (name, args1) with
              | ("::",x::xs::[]) ->
                  FStar_Format.reduce
                    [FStar_Format.parens x; FStar_Format.text "::"; xs]
              | (uu____1550,uu____1551) ->
                  let uu____1556 =
                    let uu____1559 =
                      let uu____1562 =
                        let uu____1563 =
                          FStar_Format.combine (FStar_Format.text ", ") args1
                           in
                        FStar_Format.parens uu____1563  in
                      [uu____1562]  in
                    (FStar_Format.text name) :: uu____1559  in
                  FStar_Format.reduce1 uu____1556
               in
            maybe_paren outer e_app_prio doc1
        | FStar_Extraction_ML_Syntax.MLE_Tuple es ->
            let docs =
              FStar_List.map
                (fun x  ->
                   let uu____1573 =
                     doc_of_expr currentModule (min_op_prec, NonAssoc) x  in
                   FStar_Format.parens uu____1573) es
               in
            let docs1 =
              let uu____1575 =
                FStar_Format.combine (FStar_Format.text ", ") docs  in
              FStar_Format.parens uu____1575  in
            docs1
        | FStar_Extraction_ML_Syntax.MLE_Let ((rec_,lets),body) ->
            let pre =
              if
                e.FStar_Extraction_ML_Syntax.loc <>
                  FStar_Extraction_ML_Syntax.dummy_loc
              then
                let uu____1594 =
                  let uu____1597 =
                    let uu____1600 =
                      doc_of_loc e.FStar_Extraction_ML_Syntax.loc  in
                    [uu____1600]  in
                  FStar_Format.hardline :: uu____1597  in
                FStar_Format.reduce uu____1594
              else FStar_Format.empty  in
            let doc1 = doc_of_lets currentModule (rec_, false, lets)  in
            let body1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) body  in
            let uu____1606 =
              let uu____1607 =
                let uu____1610 =
                  let uu____1613 =
                    let uu____1616 =
                      FStar_Format.reduce1 [FStar_Format.text "in"; body1]
                       in
                    [uu____1616]  in
                  doc1 :: uu____1613  in
                pre :: uu____1610  in
              FStar_Format.combine FStar_Format.hardline uu____1607  in
            FStar_Format.parens uu____1606
        | FStar_Extraction_ML_Syntax.MLE_App (e1,args) ->
            (match ((e1.FStar_Extraction_ML_Syntax.expr), args) with
             | (FStar_Extraction_ML_Syntax.MLE_Name
                p,{
                    FStar_Extraction_ML_Syntax.expr =
                      FStar_Extraction_ML_Syntax.MLE_Fun
                      (uu____1626::[],scrutinee);
                    FStar_Extraction_ML_Syntax.mlty = uu____1628;
                    FStar_Extraction_ML_Syntax.loc = uu____1629;_}::{
                                                                    FStar_Extraction_ML_Syntax.expr
                                                                    =
                                                                    FStar_Extraction_ML_Syntax.MLE_Fun
                                                                    ((arg,uu____1631)::[],possible_match);
                                                                    FStar_Extraction_ML_Syntax.mlty
                                                                    =
                                                                    uu____1633;
                                                                    FStar_Extraction_ML_Syntax.loc
                                                                    =
                                                                    uu____1634;_}::[])
                 when
                 let uu____1669 =
                   FStar_Extraction_ML_Syntax.string_of_mlpath p  in
                 uu____1669 = "FStar.All.try_with" ->
                 let branches =
                   match possible_match with
                   | {
                       FStar_Extraction_ML_Syntax.expr =
                         FStar_Extraction_ML_Syntax.MLE_Match
                         ({
                            FStar_Extraction_ML_Syntax.expr =
                              FStar_Extraction_ML_Syntax.MLE_Var arg';
                            FStar_Extraction_ML_Syntax.mlty = uu____1692;
                            FStar_Extraction_ML_Syntax.loc = uu____1693;_},branches);
                       FStar_Extraction_ML_Syntax.mlty = uu____1695;
                       FStar_Extraction_ML_Syntax.loc = uu____1696;_} when
                       arg = arg' -> branches
                   | e2 ->
                       [(FStar_Extraction_ML_Syntax.MLP_Wild,
                          FStar_Pervasives_Native.None, e2)]
                    in
                 doc_of_expr currentModule outer
                   {
                     FStar_Extraction_ML_Syntax.expr =
                       (FStar_Extraction_ML_Syntax.MLE_Try
                          (scrutinee, branches));
                     FStar_Extraction_ML_Syntax.mlty =
                       (possible_match.FStar_Extraction_ML_Syntax.mlty);
                     FStar_Extraction_ML_Syntax.loc =
                       (possible_match.FStar_Extraction_ML_Syntax.loc)
                   }
             | (FStar_Extraction_ML_Syntax.MLE_Name p,e11::e2::[]) when
                 is_bin_op p -> doc_of_binop currentModule p e11 e2
             | (FStar_Extraction_ML_Syntax.MLE_App
                ({
                   FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.MLE_Name p;
                   FStar_Extraction_ML_Syntax.mlty = uu____1752;
                   FStar_Extraction_ML_Syntax.loc = uu____1753;_},unitVal::[]),e11::e2::[])
                 when
                 (is_bin_op p) &&
                   (unitVal = FStar_Extraction_ML_Syntax.ml_unit)
                 -> doc_of_binop currentModule p e11 e2
             | (FStar_Extraction_ML_Syntax.MLE_Name p,e11::[]) when
                 is_uni_op p -> doc_of_uniop currentModule p e11
             | (FStar_Extraction_ML_Syntax.MLE_App
                ({
                   FStar_Extraction_ML_Syntax.expr =
                     FStar_Extraction_ML_Syntax.MLE_Name p;
                   FStar_Extraction_ML_Syntax.mlty = uu____1766;
                   FStar_Extraction_ML_Syntax.loc = uu____1767;_},unitVal::[]),e11::[])
                 when
                 (is_uni_op p) &&
                   (unitVal = FStar_Extraction_ML_Syntax.ml_unit)
                 -> doc_of_uniop currentModule p e11
             | uu____1774 ->
                 let e2 = doc_of_expr currentModule (e_app_prio, ILeft) e1
                    in
                 let args1 =
                   FStar_List.map
                     (doc_of_expr currentModule (e_app_prio, IRight)) args
                    in
                 let uu____1785 = FStar_Format.reduce1 (e2 :: args1)  in
                 FStar_Format.parens uu____1785)
        | FStar_Extraction_ML_Syntax.MLE_Proj (e1,f) ->
            let e2 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1  in
            let doc1 =
              let uu____1790 = FStar_Extraction_ML_Util.codegen_fsharp ()  in
              if uu____1790
              then
                FStar_Format.reduce
                  [e2;
                  FStar_Format.text ".";
                  FStar_Format.text (FStar_Pervasives_Native.snd f)]
              else
                (let uu____1794 =
                   let uu____1797 =
                     let uu____1800 =
                       let uu____1803 =
                         let uu____1804 = ptsym currentModule f  in
                         FStar_Format.text uu____1804  in
                       [uu____1803]  in
                     (FStar_Format.text ".") :: uu____1800  in
                   e2 :: uu____1797  in
                 FStar_Format.reduce uu____1794)
               in
            doc1
        | FStar_Extraction_ML_Syntax.MLE_Fun (ids,body) ->
            let bvar_annot x xt =
              let uu____1834 = FStar_Extraction_ML_Util.codegen_fsharp ()  in
              if uu____1834
              then
                let uu____1835 =
                  let uu____1838 =
                    let uu____1841 =
                      let uu____1844 =
                        match xt with
                        | FStar_Pervasives_Native.Some xxt ->
                            let uu____1846 =
                              let uu____1849 =
                                let uu____1852 =
                                  doc_of_mltype currentModule outer xxt  in
                                [uu____1852]  in
                              (FStar_Format.text " : ") :: uu____1849  in
                            FStar_Format.reduce1 uu____1846
                        | uu____1853 -> FStar_Format.text ""  in
                      [uu____1844; FStar_Format.text ")"]  in
                    (FStar_Format.text x) :: uu____1841  in
                  (FStar_Format.text "(") :: uu____1838  in
                FStar_Format.reduce1 uu____1835
              else FStar_Format.text x  in
            let ids1 =
              FStar_List.map
                (fun uu____1867  ->
                   match uu____1867 with
                   | (x,xt) -> bvar_annot x (FStar_Pervasives_Native.Some xt))
                ids
               in
            let body1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) body  in
            let doc1 =
              let uu____1876 =
                let uu____1879 =
                  let uu____1882 = FStar_Format.reduce1 ids1  in
                  [uu____1882; FStar_Format.text "->"; body1]  in
                (FStar_Format.text "fun") :: uu____1879  in
              FStar_Format.reduce1 uu____1876  in
            FStar_Format.parens doc1
        | FStar_Extraction_ML_Syntax.MLE_If
            (cond,e1,FStar_Pervasives_Native.None ) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond  in
            let doc1 =
              let uu____1889 =
                let uu____1892 =
                  FStar_Format.reduce1
                    [FStar_Format.text "if";
                    cond1;
                    FStar_Format.text "then";
                    FStar_Format.text "begin"]
                   in
                let uu____1893 =
                  let uu____1896 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1  in
                  [uu____1896; FStar_Format.text "end"]  in
                uu____1892 :: uu____1893  in
              FStar_Format.combine FStar_Format.hardline uu____1889  in
            maybe_paren outer e_bin_prio_if doc1
        | FStar_Extraction_ML_Syntax.MLE_If
            (cond,e1,FStar_Pervasives_Native.Some e2) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond  in
            let doc1 =
              let uu____1904 =
                let uu____1907 =
                  FStar_Format.reduce1
                    [FStar_Format.text "if";
                    cond1;
                    FStar_Format.text "then";
                    FStar_Format.text "begin"]
                   in
                let uu____1908 =
                  let uu____1911 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e1  in
                  let uu____1912 =
                    let uu____1915 =
                      FStar_Format.reduce1
                        [FStar_Format.text "end";
                        FStar_Format.text "else";
                        FStar_Format.text "begin"]
                       in
                    let uu____1916 =
                      let uu____1919 =
                        doc_of_expr currentModule (min_op_prec, NonAssoc) e2
                         in
                      [uu____1919; FStar_Format.text "end"]  in
                    uu____1915 :: uu____1916  in
                  uu____1911 :: uu____1912  in
                uu____1907 :: uu____1908  in
              FStar_Format.combine FStar_Format.hardline uu____1904  in
            maybe_paren outer e_bin_prio_if doc1
        | FStar_Extraction_ML_Syntax.MLE_Match (cond,pats) ->
            let cond1 =
              doc_of_expr currentModule (min_op_prec, NonAssoc) cond  in
            let pats1 = FStar_List.map (doc_of_branch currentModule) pats  in
            let doc1 =
              let uu____1957 =
                FStar_Format.reduce1
                  [FStar_Format.text "match";
                  FStar_Format.parens cond1;
                  FStar_Format.text "with"]
                 in
              uu____1957 :: pats1  in
            let doc2 = FStar_Format.combine FStar_Format.hardline doc1  in
            FStar_Format.parens doc2
        | FStar_Extraction_ML_Syntax.MLE_Raise (exn,[]) ->
            let uu____1962 =
              let uu____1965 =
                let uu____1968 =
                  let uu____1969 = ptctor currentModule exn  in
                  FStar_Format.text uu____1969  in
                [uu____1968]  in
              (FStar_Format.text "raise") :: uu____1965  in
            FStar_Format.reduce1 uu____1962
        | FStar_Extraction_ML_Syntax.MLE_Raise (exn,args) ->
            let args1 =
              FStar_List.map
                (doc_of_expr currentModule (min_op_prec, NonAssoc)) args
               in
            let uu____1979 =
              let uu____1982 =
                let uu____1985 =
                  let uu____1986 = ptctor currentModule exn  in
                  FStar_Format.text uu____1986  in
                let uu____1987 =
                  let uu____1990 =
                    let uu____1991 =
                      FStar_Format.combine (FStar_Format.text ", ") args1  in
                    FStar_Format.parens uu____1991  in
                  [uu____1990]  in
                uu____1985 :: uu____1987  in
              (FStar_Format.text "raise") :: uu____1982  in
            FStar_Format.reduce1 uu____1979
        | FStar_Extraction_ML_Syntax.MLE_Try (e1,pats) ->
            let uu____2014 =
              let uu____2017 =
                let uu____2020 =
                  doc_of_expr currentModule (min_op_prec, NonAssoc) e1  in
                let uu____2021 =
                  let uu____2024 =
                    let uu____2027 =
                      let uu____2028 =
                        FStar_List.map (doc_of_branch currentModule) pats  in
                      FStar_Format.combine FStar_Format.hardline uu____2028
                       in
                    [uu____2027]  in
                  (FStar_Format.text "with") :: uu____2024  in
                uu____2020 :: uu____2021  in
              (FStar_Format.text "try") :: uu____2017  in
            FStar_Format.combine FStar_Format.hardline uu____2014
        | FStar_Extraction_ML_Syntax.MLE_TApp (head1,ty_args) ->
            doc_of_expr currentModule outer head1

and (doc_of_binop :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath ->
      FStar_Extraction_ML_Syntax.mlexpr ->
        FStar_Extraction_ML_Syntax.mlexpr -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun p  ->
      fun e1  ->
        fun e2  ->
          let uu____2049 =
            let uu____2060 = as_bin_op p  in FStar_Option.get uu____2060  in
          match uu____2049 with
          | (uu____2083,prio,txt) ->
              let e11 = doc_of_expr currentModule (prio, Left) e1  in
              let e21 = doc_of_expr currentModule (prio, Right) e2  in
              let doc1 =
                FStar_Format.reduce1 [e11; FStar_Format.text txt; e21]  in
              FStar_Format.parens doc1

and (doc_of_uniop :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpath ->
      FStar_Extraction_ML_Syntax.mlexpr -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun p  ->
      fun e1  ->
        let uu____2100 =
          let uu____2105 = as_uni_op p  in FStar_Option.get uu____2105  in
        match uu____2100 with
        | (uu____2116,txt) ->
            let e11 = doc_of_expr currentModule (min_op_prec, NonAssoc) e1
               in
            let doc1 =
              FStar_Format.reduce1
                [FStar_Format.text txt; FStar_Format.parens e11]
               in
            FStar_Format.parens doc1

and (doc_of_pattern :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlpattern -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun pattern  ->
      match pattern with
      | FStar_Extraction_ML_Syntax.MLP_Wild  -> FStar_Format.text "_"
      | FStar_Extraction_ML_Syntax.MLP_Const c ->
          let uu____2123 = string_of_mlconstant c  in
          FStar_Format.text uu____2123
      | FStar_Extraction_ML_Syntax.MLP_Var x -> FStar_Format.text x
      | FStar_Extraction_ML_Syntax.MLP_Record (path,fields) ->
          let for1 uu____2152 =
            match uu____2152 with
            | (name,p) ->
                let uu____2159 =
                  let uu____2162 =
                    let uu____2163 = ptsym currentModule (path, name)  in
                    FStar_Format.text uu____2163  in
                  let uu____2166 =
                    let uu____2169 =
                      let uu____2172 = doc_of_pattern currentModule p  in
                      [uu____2172]  in
                    (FStar_Format.text "=") :: uu____2169  in
                  uu____2162 :: uu____2166  in
                FStar_Format.reduce1 uu____2159
             in
          let uu____2173 =
            let uu____2174 = FStar_List.map for1 fields  in
            FStar_Format.combine (FStar_Format.text "; ") uu____2174  in
          FStar_Format.cbrackets uu____2173
      | FStar_Extraction_ML_Syntax.MLP_CTor (ctor,[]) ->
          let name =
            let uu____2185 = is_standard_constructor ctor  in
            if uu____2185
            then
              let uu____2186 =
                let uu____2191 = as_standard_constructor ctor  in
                FStar_Option.get uu____2191  in
              FStar_Pervasives_Native.snd uu____2186
            else ptctor currentModule ctor  in
          FStar_Format.text name
      | FStar_Extraction_ML_Syntax.MLP_CTor (ctor,pats) ->
          let name =
            let uu____2210 = is_standard_constructor ctor  in
            if uu____2210
            then
              let uu____2211 =
                let uu____2216 = as_standard_constructor ctor  in
                FStar_Option.get uu____2216  in
              FStar_Pervasives_Native.snd uu____2211
            else ptctor currentModule ctor  in
          let doc1 =
            match (name, pats) with
            | ("::",x::xs::[]) ->
                let uu____2235 =
                  let uu____2238 =
                    let uu____2239 = doc_of_pattern currentModule x  in
                    FStar_Format.parens uu____2239  in
                  let uu____2240 =
                    let uu____2243 =
                      let uu____2246 = doc_of_pattern currentModule xs  in
                      [uu____2246]  in
                    (FStar_Format.text "::") :: uu____2243  in
                  uu____2238 :: uu____2240  in
                FStar_Format.reduce uu____2235
            | (uu____2247,(FStar_Extraction_ML_Syntax.MLP_Tuple
               uu____2248)::[]) ->
                let uu____2253 =
                  let uu____2256 =
                    let uu____2259 =
                      let uu____2260 = FStar_List.hd pats  in
                      doc_of_pattern currentModule uu____2260  in
                    [uu____2259]  in
                  (FStar_Format.text name) :: uu____2256  in
                FStar_Format.reduce1 uu____2253
            | uu____2261 ->
                let uu____2268 =
                  let uu____2271 =
                    let uu____2274 =
                      let uu____2275 =
                        let uu____2276 =
                          FStar_List.map (doc_of_pattern currentModule) pats
                           in
                        FStar_Format.combine (FStar_Format.text ", ")
                          uu____2276
                         in
                      FStar_Format.parens uu____2275  in
                    [uu____2274]  in
                  (FStar_Format.text name) :: uu____2271  in
                FStar_Format.reduce1 uu____2268
             in
          maybe_paren (min_op_prec, NonAssoc) e_app_prio doc1
      | FStar_Extraction_ML_Syntax.MLP_Tuple ps ->
          let ps1 = FStar_List.map (doc_of_pattern currentModule) ps  in
          let uu____2289 = FStar_Format.combine (FStar_Format.text ", ") ps1
             in
          FStar_Format.parens uu____2289
      | FStar_Extraction_ML_Syntax.MLP_Branch ps ->
          let ps1 = FStar_List.map (doc_of_pattern currentModule) ps  in
          let ps2 = FStar_List.map FStar_Format.parens ps1  in
          FStar_Format.combine (FStar_Format.text " | ") ps2

and (doc_of_branch :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlbranch -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun uu____2300  ->
      match uu____2300 with
      | (p,cond,e) ->
          let case =
            match cond with
            | FStar_Pervasives_Native.None  ->
                let uu____2309 =
                  let uu____2312 =
                    let uu____2315 = doc_of_pattern currentModule p  in
                    [uu____2315]  in
                  (FStar_Format.text "|") :: uu____2312  in
                FStar_Format.reduce1 uu____2309
            | FStar_Pervasives_Native.Some c ->
                let c1 = doc_of_expr currentModule (min_op_prec, NonAssoc) c
                   in
                let uu____2318 =
                  let uu____2321 =
                    let uu____2324 = doc_of_pattern currentModule p  in
                    [uu____2324; FStar_Format.text "when"; c1]  in
                  (FStar_Format.text "|") :: uu____2321  in
                FStar_Format.reduce1 uu____2318
             in
          let uu____2325 =
            let uu____2328 =
              FStar_Format.reduce1
                [case; FStar_Format.text "->"; FStar_Format.text "begin"]
               in
            let uu____2329 =
              let uu____2332 =
                doc_of_expr currentModule (min_op_prec, NonAssoc) e  in
              [uu____2332; FStar_Format.text "end"]  in
            uu____2328 :: uu____2329  in
          FStar_Format.combine FStar_Format.hardline uu____2325

and (doc_of_lets :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    (FStar_Extraction_ML_Syntax.mlletflavor,Prims.bool,FStar_Extraction_ML_Syntax.mllb
                                                         Prims.list)
      FStar_Pervasives_Native.tuple3 -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun uu____2334  ->
      match uu____2334 with
      | (rec_,top_level,lets) ->
          let for1 uu____2355 =
            match uu____2355 with
            | { FStar_Extraction_ML_Syntax.mllb_name = name;
                FStar_Extraction_ML_Syntax.mllb_tysc = tys;
                FStar_Extraction_ML_Syntax.mllb_add_unit = uu____2358;
                FStar_Extraction_ML_Syntax.mllb_def = e;
                FStar_Extraction_ML_Syntax.mllb_meta = uu____2360;
                FStar_Extraction_ML_Syntax.print_typ = pt;_} ->
                let e1 = doc_of_expr currentModule (min_op_prec, NonAssoc) e
                   in
                let ids = []  in
                let ty_annot =
                  if Prims.op_Negation pt
                  then FStar_Format.text ""
                  else
                    (let uu____2370 =
                       (FStar_Extraction_ML_Util.codegen_fsharp ()) &&
                         ((rec_ = FStar_Extraction_ML_Syntax.Rec) ||
                            top_level)
                        in
                     if uu____2370
                     then
                       match tys with
                       | FStar_Pervasives_Native.Some
                           (uu____2371::uu____2372,uu____2373) ->
                           FStar_Format.text ""
                       | FStar_Pervasives_Native.None  ->
                           FStar_Format.text ""
                       | FStar_Pervasives_Native.Some ([],ty) ->
                           let ty1 =
                             doc_of_mltype currentModule
                               (min_op_prec, NonAssoc) ty
                              in
                           FStar_Format.reduce1 [FStar_Format.text ":"; ty1]
                     else
                       if top_level
                       then
                         (match tys with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Format.text ""
                          | FStar_Pervasives_Native.Some ([],ty) ->
                              let ty1 =
                                doc_of_mltype currentModule
                                  (min_op_prec, NonAssoc) ty
                                 in
                              FStar_Format.reduce1
                                [FStar_Format.text ":"; ty1]
                          | FStar_Pervasives_Native.Some (vs,ty) ->
                              let ty1 =
                                doc_of_mltype currentModule
                                  (min_op_prec, NonAssoc) ty
                                 in
                              let vars =
                                let uu____2385 =
                                  FStar_All.pipe_right vs
                                    (FStar_List.map
                                       (fun x  ->
                                          doc_of_mltype currentModule
                                            (min_op_prec, NonAssoc)
                                            (FStar_Extraction_ML_Syntax.MLTY_Var
                                               x)))
                                   in
                                FStar_All.pipe_right uu____2385
                                  FStar_Format.reduce1
                                 in
                              FStar_Format.reduce1
                                [FStar_Format.text ":";
                                vars;
                                FStar_Format.text ".";
                                ty1])
                       else FStar_Format.text "")
                   in
                let uu____2397 =
                  let uu____2400 =
                    let uu____2403 = FStar_Format.reduce1 ids  in
                    [uu____2403; ty_annot; FStar_Format.text "="; e1]  in
                  (FStar_Format.text name) :: uu____2400  in
                FStar_Format.reduce1 uu____2397
             in
          let letdoc =
            if rec_ = FStar_Extraction_ML_Syntax.Rec
            then
              FStar_Format.reduce1
                [FStar_Format.text "let"; FStar_Format.text "rec"]
            else FStar_Format.text "let"  in
          let lets1 = FStar_List.map for1 lets  in
          let lets2 =
            FStar_List.mapi
              (fun i  ->
                 fun doc1  ->
                   FStar_Format.reduce1
                     [if i = (Prims.parse_int "0")
                      then letdoc
                      else FStar_Format.text "and";
                     doc1]) lets1
             in
          FStar_Format.combine FStar_Format.hardline lets2

and (doc_of_loc : FStar_Extraction_ML_Syntax.mlloc -> FStar_Format.doc) =
  fun uu____2417  ->
    match uu____2417 with
    | (lineno,file) ->
        let uu____2420 =
          ((FStar_Options.no_location_info ()) ||
             (FStar_Extraction_ML_Util.codegen_fsharp ()))
            || (file = "<dummy>")
           in
        if uu____2420
        then FStar_Format.empty
        else
          (let file1 = FStar_Util.basename file  in
           FStar_Format.reduce1
             [FStar_Format.text "#";
             FStar_Format.num lineno;
             FStar_Format.text (Prims.strcat "\"" (Prims.strcat file1 "\""))])

let (doc_of_mltydecl :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mltydecl -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun decls  ->
      let for1 uu____2456 =
        match uu____2456 with
        | (uu____2475,x,mangle_opt,tparams,uu____2479,body) ->
            let x1 =
              match mangle_opt with
              | FStar_Pervasives_Native.None  -> x
              | FStar_Pervasives_Native.Some y -> y  in
            let tparams1 =
              match tparams with
              | [] -> FStar_Format.empty
              | x2::[] -> FStar_Format.text x2
              | uu____2497 ->
                  let doc1 =
                    FStar_List.map (fun x2  -> FStar_Format.text x2) tparams
                     in
                  let uu____2505 =
                    FStar_Format.combine (FStar_Format.text ", ") doc1  in
                  FStar_Format.parens uu____2505
               in
            let forbody body1 =
              match body1 with
              | FStar_Extraction_ML_Syntax.MLTD_Abbrev ty ->
                  doc_of_mltype currentModule (min_op_prec, NonAssoc) ty
              | FStar_Extraction_ML_Syntax.MLTD_Record fields ->
                  let forfield uu____2529 =
                    match uu____2529 with
                    | (name,ty) ->
                        let name1 = FStar_Format.text name  in
                        let ty1 =
                          doc_of_mltype currentModule (min_op_prec, NonAssoc)
                            ty
                           in
                        FStar_Format.reduce1
                          [name1; FStar_Format.text ":"; ty1]
                     in
                  let uu____2538 =
                    let uu____2539 = FStar_List.map forfield fields  in
                    FStar_Format.combine (FStar_Format.text "; ") uu____2539
                     in
                  FStar_Format.cbrackets uu____2538
              | FStar_Extraction_ML_Syntax.MLTD_DType ctors ->
                  let forctor uu____2574 =
                    match uu____2574 with
                    | (name,tys) ->
                        let uu____2599 = FStar_List.split tys  in
                        (match uu____2599 with
                         | (_names,tys1) ->
                             (match tys1 with
                              | [] -> FStar_Format.text name
                              | uu____2618 ->
                                  let tys2 =
                                    FStar_List.map
                                      (doc_of_mltype currentModule
                                         (t_prio_tpl, Left)) tys1
                                     in
                                  let tys3 =
                                    FStar_Format.combine
                                      (FStar_Format.text " * ") tys2
                                     in
                                  FStar_Format.reduce1
                                    [FStar_Format.text name;
                                    FStar_Format.text "of";
                                    tys3]))
                     in
                  let ctors1 = FStar_List.map forctor ctors  in
                  let ctors2 =
                    FStar_List.map
                      (fun d  ->
                         FStar_Format.reduce1 [FStar_Format.text "|"; d])
                      ctors1
                     in
                  FStar_Format.combine FStar_Format.hardline ctors2
               in
            let doc1 =
              let uu____2644 =
                let uu____2647 =
                  let uu____2650 =
                    let uu____2651 = ptsym currentModule ([], x1)  in
                    FStar_Format.text uu____2651  in
                  [uu____2650]  in
                tparams1 :: uu____2647  in
              FStar_Format.reduce1 uu____2644  in
            (match body with
             | FStar_Pervasives_Native.None  -> doc1
             | FStar_Pervasives_Native.Some body1 ->
                 let body2 = forbody body1  in
                 let uu____2656 =
                   let uu____2659 =
                     FStar_Format.reduce1 [doc1; FStar_Format.text "="]  in
                   [uu____2659; body2]  in
                 FStar_Format.combine FStar_Format.hardline uu____2656)
         in
      let doc1 = FStar_List.map for1 decls  in
      let doc2 =
        if (FStar_List.length doc1) > (Prims.parse_int "0")
        then
          let uu____2664 =
            let uu____2667 =
              let uu____2670 =
                FStar_Format.combine (FStar_Format.text " \n and ") doc1  in
              [uu____2670]  in
            (FStar_Format.text "type") :: uu____2667  in
          FStar_Format.reduce1 uu____2664
        else FStar_Format.text ""  in
      doc2
  
let rec (doc_of_sig1 :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlsig1 -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun s  ->
      match s with
      | FStar_Extraction_ML_Syntax.MLS_Mod (x,subsig) ->
          let uu____2696 =
            let uu____2699 =
              FStar_Format.reduce1
                [FStar_Format.text "module";
                FStar_Format.text x;
                FStar_Format.text "="]
               in
            let uu____2700 =
              let uu____2703 = doc_of_sig currentModule subsig  in
              let uu____2704 =
                let uu____2707 =
                  FStar_Format.reduce1 [FStar_Format.text "end"]  in
                [uu____2707]  in
              uu____2703 :: uu____2704  in
            uu____2699 :: uu____2700  in
          FStar_Format.combine FStar_Format.hardline uu____2696
      | FStar_Extraction_ML_Syntax.MLS_Exn (x,[]) ->
          FStar_Format.reduce1
            [FStar_Format.text "exception"; FStar_Format.text x]
      | FStar_Extraction_ML_Syntax.MLS_Exn (x,args) ->
          let args1 =
            FStar_List.map
              (doc_of_mltype currentModule (min_op_prec, NonAssoc)) args
             in
          let args2 =
            let uu____2721 =
              FStar_Format.combine (FStar_Format.text " * ") args1  in
            FStar_Format.parens uu____2721  in
          FStar_Format.reduce1
            [FStar_Format.text "exception";
            FStar_Format.text x;
            FStar_Format.text "of";
            args2]
      | FStar_Extraction_ML_Syntax.MLS_Val (x,(uu____2723,ty)) ->
          let ty1 = doc_of_mltype currentModule (min_op_prec, NonAssoc) ty
             in
          FStar_Format.reduce1
            [FStar_Format.text "val";
            FStar_Format.text x;
            FStar_Format.text ": ";
            ty1]
      | FStar_Extraction_ML_Syntax.MLS_Ty decls ->
          doc_of_mltydecl currentModule decls

and (doc_of_sig :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlsig -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun s  ->
      let docs = FStar_List.map (doc_of_sig1 currentModule) s  in
      let docs1 =
        FStar_List.map
          (fun x  ->
             FStar_Format.reduce
               [x; FStar_Format.hardline; FStar_Format.hardline]) docs
         in
      FStar_Format.reduce docs1

let (doc_of_mod1 :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlmodule1 -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun m  ->
      match m with
      | FStar_Extraction_ML_Syntax.MLM_Exn (x,[]) ->
          FStar_Format.reduce1
            [FStar_Format.text "exception"; FStar_Format.text x]
      | FStar_Extraction_ML_Syntax.MLM_Exn (x,args) ->
          let args1 = FStar_List.map FStar_Pervasives_Native.snd args  in
          let args2 =
            FStar_List.map
              (doc_of_mltype currentModule (min_op_prec, NonAssoc)) args1
             in
          let args3 =
            let uu____2783 =
              FStar_Format.combine (FStar_Format.text " * ") args2  in
            FStar_Format.parens uu____2783  in
          FStar_Format.reduce1
            [FStar_Format.text "exception";
            FStar_Format.text x;
            FStar_Format.text "of";
            args3]
      | FStar_Extraction_ML_Syntax.MLM_Ty decls ->
          doc_of_mltydecl currentModule decls
      | FStar_Extraction_ML_Syntax.MLM_Let (rec_,lets) ->
          doc_of_lets currentModule (rec_, true, lets)
      | FStar_Extraction_ML_Syntax.MLM_Top e ->
          let uu____2794 =
            let uu____2797 =
              let uu____2800 =
                let uu____2803 =
                  let uu____2806 =
                    doc_of_expr currentModule (min_op_prec, NonAssoc) e  in
                  [uu____2806]  in
                (FStar_Format.text "=") :: uu____2803  in
              (FStar_Format.text "_") :: uu____2800  in
            (FStar_Format.text "let") :: uu____2797  in
          FStar_Format.reduce1 uu____2794
      | FStar_Extraction_ML_Syntax.MLM_Loc loc -> doc_of_loc loc
  
let (doc_of_mod :
  FStar_Extraction_ML_Syntax.mlsymbol ->
    FStar_Extraction_ML_Syntax.mlmodule -> FStar_Format.doc)
  =
  fun currentModule  ->
    fun m  ->
      let docs =
        FStar_List.map
          (fun x  ->
             let doc1 = doc_of_mod1 currentModule x  in
             [doc1;
             (match x with
              | FStar_Extraction_ML_Syntax.MLM_Loc uu____2830 ->
                  FStar_Format.empty
              | uu____2831 -> FStar_Format.hardline);
             FStar_Format.hardline]) m
         in
      FStar_Format.reduce (FStar_List.flatten docs)
  
let rec (doc_of_mllib_r :
  FStar_Extraction_ML_Syntax.mllib ->
    (Prims.string,FStar_Format.doc) FStar_Pervasives_Native.tuple2 Prims.list)
  =
  fun uu____2842  ->
    match uu____2842 with
    | FStar_Extraction_ML_Syntax.MLLib mllib ->
        let rec for1_sig uu____2908 =
          match uu____2908 with
          | (x,sigmod,FStar_Extraction_ML_Syntax.MLLib sub1) ->
              let x1 = FStar_Extraction_ML_Util.flatten_mlpath x  in
              let head1 =
                FStar_Format.reduce1
                  [FStar_Format.text "module";
                  FStar_Format.text x1;
                  FStar_Format.text ":";
                  FStar_Format.text "sig"]
                 in
              let tail1 = FStar_Format.reduce1 [FStar_Format.text "end"]  in
              let doc1 =
                FStar_Option.map
                  (fun uu____2963  ->
                     match uu____2963 with
                     | (s,uu____2969) -> doc_of_sig x1 s) sigmod
                 in
              let sub2 = FStar_List.map for1_sig sub1  in
              let sub3 =
                FStar_List.map
                  (fun x2  ->
                     FStar_Format.reduce
                       [x2; FStar_Format.hardline; FStar_Format.hardline])
                  sub2
                 in
              let uu____2990 =
                let uu____2993 =
                  let uu____2996 =
                    let uu____2999 = FStar_Format.reduce sub3  in
                    [uu____2999;
                    FStar_Format.cat tail1 FStar_Format.hardline]  in
                  (match doc1 with
                   | FStar_Pervasives_Native.None  -> FStar_Format.empty
                   | FStar_Pervasives_Native.Some s ->
                       FStar_Format.cat s FStar_Format.hardline)
                    :: uu____2996
                   in
                (FStar_Format.cat head1 FStar_Format.hardline) :: uu____2993
                 in
              FStar_Format.reduce uu____2990
        
        and for1_mod istop uu____3002 =
          match uu____3002 with
          | (mod_name1,sigmod,FStar_Extraction_ML_Syntax.MLLib sub1) ->
              let target_mod_name =
                FStar_Extraction_ML_Util.flatten_mlpath mod_name1  in
              let maybe_open_pervasives =
                match mod_name1 with
                | ("FStar"::[],"Pervasives") -> []
                | uu____3070 ->
                    let pervasives1 =
                      FStar_Extraction_ML_Util.flatten_mlpath
                        (["FStar"], "Pervasives")
                       in
                    [FStar_Format.hardline;
                    FStar_Format.text (Prims.strcat "open " pervasives1)]
                 in
              let head1 =
                let uu____3081 =
                  let uu____3084 = FStar_Extraction_ML_Util.codegen_fsharp ()
                     in
                  if uu____3084
                  then
                    [FStar_Format.text "module";
                    FStar_Format.text target_mod_name]
                  else
                    if Prims.op_Negation istop
                    then
                      [FStar_Format.text "module";
                      FStar_Format.text target_mod_name;
                      FStar_Format.text "=";
                      FStar_Format.text "struct"]
                    else []
                   in
                FStar_Format.reduce1 uu____3081  in
              let tail1 =
                if Prims.op_Negation istop
                then FStar_Format.reduce1 [FStar_Format.text "end"]
                else FStar_Format.reduce1 []  in
              let doc1 =
                FStar_Option.map
                  (fun uu____3103  ->
                     match uu____3103 with
                     | (uu____3108,m) -> doc_of_mod target_mod_name m) sigmod
                 in
              let sub2 = FStar_List.map (for1_mod false) sub1  in
              let sub3 =
                FStar_List.map
                  (fun x  ->
                     FStar_Format.reduce
                       [x; FStar_Format.hardline; FStar_Format.hardline])
                  sub2
                 in
              let prefix1 =
                let uu____3133 = FStar_Extraction_ML_Util.codegen_fsharp ()
                   in
                if uu____3133
                then
                  [FStar_Format.cat (FStar_Format.text "#light \"off\"")
                     FStar_Format.hardline]
                else []  in
              let uu____3137 =
                let uu____3140 =
                  let uu____3143 =
                    let uu____3146 =
                      let uu____3149 =
                        let uu____3152 =
                          let uu____3155 = FStar_Format.reduce sub3  in
                          [uu____3155;
                          FStar_Format.cat tail1 FStar_Format.hardline]  in
                        (match doc1 with
                         | FStar_Pervasives_Native.None  ->
                             FStar_Format.empty
                         | FStar_Pervasives_Native.Some s ->
                             FStar_Format.cat s FStar_Format.hardline)
                          :: uu____3152
                         in
                      FStar_Format.hardline :: uu____3149  in
                    FStar_List.append maybe_open_pervasives uu____3146  in
                  FStar_List.append
                    [head1;
                    FStar_Format.hardline;
                    FStar_Format.text "open Prims"] uu____3143
                   in
                FStar_List.append prefix1 uu____3140  in
              FStar_All.pipe_left FStar_Format.reduce uu____3137
         in
        let docs =
          FStar_List.map
            (fun uu____3194  ->
               match uu____3194 with
               | (x,s,m) ->
                   let uu____3244 = FStar_Extraction_ML_Util.flatten_mlpath x
                      in
                   let uu____3245 = for1_mod true (x, s, m)  in
                   (uu____3244, uu____3245)) mllib
           in
        docs
  
let (doc_of_mllib :
  FStar_Extraction_ML_Syntax.mllib ->
    (Prims.string,FStar_Format.doc) FStar_Pervasives_Native.tuple2 Prims.list)
  = fun mllib  -> doc_of_mllib_r mllib 
let (string_of_mlexpr :
  FStar_Extraction_ML_Syntax.mlpath ->
    FStar_Extraction_ML_Syntax.mlexpr -> Prims.string)
  =
  fun cmod  ->
    fun e  ->
      let doc1 =
        let uu____3280 = FStar_Extraction_ML_Util.flatten_mlpath cmod  in
        doc_of_expr uu____3280 (min_op_prec, NonAssoc) e  in
      FStar_Format.pretty (Prims.parse_int "0") doc1
  
let (string_of_mlty :
  FStar_Extraction_ML_Syntax.mlpath ->
    FStar_Extraction_ML_Syntax.mlty -> Prims.string)
  =
  fun cmod  ->
    fun e  ->
      let doc1 =
        let uu____3292 = FStar_Extraction_ML_Util.flatten_mlpath cmod  in
        doc_of_mltype uu____3292 (min_op_prec, NonAssoc) e  in
      FStar_Format.pretty (Prims.parse_int "0") doc1
  