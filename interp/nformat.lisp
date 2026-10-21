
; )package "BOOT"

(IN-PACKAGE "BOOT")

; any_to_string(u) == WRITE_-TO_-STRING(u)

(DEFUN |any_to_string| (|u|) (PROG () (RETURN (WRITE-TO-STRING |u|))))

; $outform_to_string_fun := [0, nil]

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (SETQ |$outform_to_string_fun| (LIST 0 NIL)))

; outform_to_string(o) ==
;     fun := SpadFun($outform_to_string_fun,
;               getFunctionFromDomain1("outform_to_string",
;                 '(HyperdocUtilities), '(String), '((OutputForm))))
;     SPADCALL(o, fun)

(DEFUN |outform_to_string| (|o|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$outform_to_string_fun|
               (|getFunctionFromDomain1| '|outform_to_string|
                '(|HyperdocUtilities|) '(|String|) '((|OutputForm|)))))
      (SPADCALL |o| |fun|)))))

; value_to_form(arg, t, kind) ==
;     form :=
;          kind = 'in_form => ["InputForm"]
;          $OutputForm
;     isValidType(t) and PAIRP(t) and
;             (get_database(first(t), 'CONSTRUCTORKIND) = 'domain) =>
;         (val := coerceInteractive(objNewWrap(arg, t), form)) =>
;             res := objValUnwrap(val)
;             kind = 'str_form => outform_to_string(res)
;             res
;         -- Wrong, but we try to produce something
;         kind = 'in_form => ["error", '"Bad value"]
;         any_to_string(arg)
;     -- Wrong, but we try to produce something
;     kind = 'in_form => ["error", '"Bad value"]
;     any_to_string(arg)

(DEFUN |value_to_form| (|arg| |t| |kind|)
  (PROG (|form| |val| |res|)
    (RETURN
     (PROGN
      (SETQ |form|
              (COND ((EQ |kind| '|in_form|) (LIST '|InputForm|))
                    (#1='T |$OutputForm|)))
      (COND
       ((AND (|isValidType| |t|) (CONSP |t|)
             (EQ (|get_database| (CAR |t|) 'CONSTRUCTORKIND) '|domain|))
        (COND
         ((SETQ |val| (|coerceInteractive| (|objNewWrap| |arg| |t|) |form|))
          (PROGN
           (SETQ |res| (|objValUnwrap| |val|))
           (COND ((EQ |kind| '|str_form|) (|outform_to_string| |res|))
                 (#1# |res|))))
         ((EQ |kind| '|in_form|) (LIST '|error| "Bad value"))
         (#1# (|any_to_string| |arg|))))
       ((EQ |kind| '|in_form|) (LIST '|error| "Bad value"))
       (#1# (|any_to_string| |arg|)))))))

; arg_to_form(arg, t, c, kind) ==
;     c => constructor_to_form(arg, kind)
;     value_to_form(arg, t, kind)

(DEFUN |arg_to_form| (|arg| |t| |c| |kind|)
  (PROG ()
    (RETURN
     (COND (|c| (|constructor_to_form| |arg| |kind|))
           ('T (|value_to_form| |arg| |t| |kind|))))))

; prefix_to_string(con) ==
;     u := prefix2String(con)
;     atom(u) => u
;     concatenateStringList([object2String(x) for x in u])

(DEFUN |prefix_to_string| (|con|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|prefix2String| |con|))
      (COND ((ATOM |u|) |u|)
            (#1='T
             (|concatenateStringList|
              ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                    (RETURN (NREVERSE |bfVar#2|)))
                   (#1#
                    (SETQ |bfVar#2| (CONS (|object2String| |x|) |bfVar#2|))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |u| NIL))))))))

; mkCategory_to_OutputForm(argl) ==
;     throwMessage('"mkCategory_to_OutputForm called")

(DEFUN |mkCategory_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "mkCategory_to_OutputForm called"))))

; Join_to_OutputForm(argl) ==
;     throwMessage('"Join_to_OutputForm called")

(DEFUN |Join_to_OutputForm| (|argl|)
  (PROG () (RETURN (|throwMessage| "Join_to_OutputForm called"))))

; record_arg_to_form(at, kind) ==
;     [., name, type] := at
;     kind = 'in_form => [":", name, constructor_to_form(type, kind)]
;     kind = 'str_form =>
;         CONCAT(PNAME(name), '": ", constructor_to_form(type, kind))
;     ['CONCAT, name, '":", constructor_to_form(type, kind)]

(DEFUN |record_arg_to_form| (|at| |kind|)
  (PROG (|name| |type|)
    (RETURN
     (PROGN
      (SETQ |name| (CADR . #1=(|at|)))
      (SETQ |type| (CADDR . #1#))
      (COND
       ((EQ |kind| '|in_form|)
        (LIST '|:| |name| (|constructor_to_form| |type| |kind|)))
       ((EQ |kind| '|str_form|)
        (CONCAT (PNAME |name|) ": " (|constructor_to_form| |type| |kind|)))
       ('T (LIST 'CONCAT |name| ":" (|constructor_to_form| |type| |kind|))))))))

; record_args_to_form(argl, kind) ==
;     res := []
;     for at in argl repeat
;         res := cons(record_arg_to_form(at, kind), res)
;     nreverse(res)

(DEFUN |record_args_to_form| (|argl| |kind|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#3| |at|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#3|) (PROGN (SETQ |at| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           ('T (SETQ |res| (CONS (|record_arg_to_form| |at| |kind|) |res|))))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |argl| NIL)
      (NREVERSE |res|)))))

; comma_separate(sl) ==
;     first := true
;     res := []
;     for s in sl repeat
;         if not(first) then
;             res := cons('",", res)
;         first := false
;         res := cons(s, res)
;     nreverse(res)

(DEFUN |comma_separate| (|sl|)
  (PROG (CAR |res|)
    (RETURN
     (PROGN
      (SETQ CAR T)
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#4| |s|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |s| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (COND ((NULL CAR) (SETQ |res| (CONS "," |res|))))
             (SETQ CAR NIL)
             (SETQ |res| (CONS |s| |res|)))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       |sl| NIL)
      (NREVERSE |res|)))))

; op_with_args(op, sl) ==
;     concatenateStringList([PNAME(op), '"(", :comma_separate(sl), '")"])

(DEFUN |op_with_args| (|op| |sl|)
  (PROG ()
    (RETURN
     (|concatenateStringList|
      (CONS (PNAME |op|)
            (CONS "(" (APPEND (|comma_separate| |sl|) (CONS ")" NIL))))))))

; RU_to_form(op, argl, kind) ==
;     rl := record_args_to_form(argl, kind)
;     kind = 'str_form => op_with_args(op, rl)
;     cons(op, rl)

(DEFUN |RU_to_form| (|op| |argl| |kind|)
  (PROG (|rl|)
    (RETURN
     (PROGN
      (SETQ |rl| (|record_args_to_form| |argl| |kind|))
      (COND ((EQ |kind| '|str_form|) (|op_with_args| |op| |rl|))
            ('T (CONS |op| |rl|)))))))

; Record_to_form(argl, kind) == RU_to_form('Record, argl, kind)

(DEFUN |Record_to_form| (|argl| |kind|)
  (PROG () (RETURN (|RU_to_form| '|Record| |argl| |kind|))))

; Union_to_form(argl, kind) ==
;     not(null(argl)) and (first(argl) is [":", name, type]) =>
;         -- FIXME
;         kind = 'str_form and #argl = 2 and argl.1 = '"..." =>
;             rl := [record_arg_to_form(argl.0, kind), '"..."]
;             op_with_args('Union, rl)
;         -- new style Union
;         RU_to_form('Union, argl, kind)
;     -- old style
;     ul := [constructor_to_form(arg, kind) for arg in argl]
;     kind = 'str_form => op_with_args('Union, ul)
;     cons('Union, ul)

(DEFUN |Union_to_form| (|argl| |kind|)
  (PROG (|ISTMP#1| |ISTMP#2| |name| |ISTMP#3| |type| |rl| |ul|)
    (RETURN
     (COND
      ((AND (NULL (NULL |argl|))
            (PROGN
             (SETQ |ISTMP#1| (CAR |argl|))
             (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                  (PROGN
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |name| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN
                               (SETQ |type| (CAR |ISTMP#3|))
                               #1='T))))))))
       (COND
        ((AND (EQ |kind| '|str_form|) (EQL (LENGTH |argl|) 2)
              (EQUAL (ELT |argl| 1) "..."))
         (PROGN
          (SETQ |rl| (LIST (|record_arg_to_form| (ELT |argl| 0) |kind|) "..."))
          (|op_with_args| '|Union| |rl|)))
        (#1# (|RU_to_form| '|Union| |argl| |kind|))))
      (#1#
       (PROGN
        (SETQ |ul|
                ((LAMBDA (|bfVar#6| |bfVar#5| |arg|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#5|)
                          (PROGN (SETQ |arg| (CAR |bfVar#5|)) NIL))
                      (RETURN (NREVERSE |bfVar#6|)))
                     (#1#
                      (SETQ |bfVar#6|
                              (CONS (|constructor_to_form| |arg| |kind|)
                                    |bfVar#6|))))
                    (SETQ |bfVar#5| (CDR |bfVar#5|))))
                 NIL |argl| NIL))
        (COND ((EQ |kind| '|str_form|) (|op_with_args| '|Union| |ul|))
              (#1# (CONS '|Union| |ul|)))))))))

; Mapping_to_form(argl, kind) ==
;     -- should we allow this ???
;     null(argl) =>
;         kind = 'in_form => ["error", '"Bad mapping"]
;         kind = 'str_form => '"() -> ()"
;         ['PAREN, ["->", '"()", '"()"]]
;     rt := constructor_to_form(first(argl), kind)
;     nargs := [constructor_to_form(arg, kind) for arg in rest(argl)]
;     kind = 'in_form => ["Mapping", rt, :nargs]
;     if #nargs > 1 then
;         nargs :=
;             kind = 'str_form =>
;                 concatenateStringList(['"(", :comma_separate(nargs), '")"])
;             ['PAREN, ['AGGLST, :nargs]]
;     else if null(nargs) then
;         nargs := '"()"
;     else
;         nargs := first(nargs)
;     kind = 'str_form => CONCAT('"(", nargs, " -> ", rt , '")")
;     ['PAREN, ["->", nargs, rt]]

(DEFUN |Mapping_to_form| (|argl| |kind|)
  (PROG (|rt| |nargs|)
    (RETURN
     (COND
      ((NULL |argl|)
       (COND ((EQ |kind| '|in_form|) (LIST '|error| "Bad mapping"))
             ((EQ |kind| '|str_form|) "() -> ()")
             (#1='T (LIST 'PAREN (LIST '-> "()" "()")))))
      (#1#
       (PROGN
        (SETQ |rt| (|constructor_to_form| (CAR |argl|) |kind|))
        (SETQ |nargs|
                ((LAMBDA (|bfVar#8| |bfVar#7| |arg|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#7|)
                          (PROGN (SETQ |arg| (CAR |bfVar#7|)) NIL))
                      (RETURN (NREVERSE |bfVar#8|)))
                     (#1#
                      (SETQ |bfVar#8|
                              (CONS (|constructor_to_form| |arg| |kind|)
                                    |bfVar#8|))))
                    (SETQ |bfVar#7| (CDR |bfVar#7|))))
                 NIL (CDR |argl|) NIL))
        (COND ((EQ |kind| '|in_form|) (CONS '|Mapping| (CONS |rt| |nargs|)))
              (#1#
               (PROGN
                (COND
                 ((< 1 (LENGTH |nargs|))
                  (SETQ |nargs|
                          (COND
                           ((EQ |kind| '|str_form|)
                            (|concatenateStringList|
                             (CONS "("
                                   (APPEND (|comma_separate| |nargs|)
                                           (CONS ")" NIL)))))
                           (#1# (LIST 'PAREN (CONS 'AGGLST |nargs|))))))
                 ((NULL |nargs|) (SETQ |nargs| "()"))
                 (#1# (SETQ |nargs| (CAR |nargs|))))
                (COND
                 ((EQ |kind| '|str_form|)
                  (CONCAT "(" |nargs| '| -> | |rt| ")"))
                 (#1# (LIST 'PAREN (LIST '-> |nargs| |rt|)))))))))))))

; constructor_to_form(con, kind) ==
;     if VECTORP(con) then
;         con := devaluate(con)
;     STRINGP(con) =>
;         kind = 'in_form => con
;         -- FIXME: Interpreter mangles Unions, this should be handled better.
;         kind = 'str_form and con = '"..." => con
;         CONCAT("_"", con, "_"")
;     ATOM(con) =>
;         con = $EmptyMode => '"?"
;         -- Wrong, but we try to produce something
;         kind = 'in_form => ["error", '"Bad type"]
;         any_to_string(con)
;     op := first(con)
;     argl := rest(con)
;
;     op = 'Join => Join_to_OutputForm(argl)
;     op = 'mkCategory => mkCategory_to_OutputForm(argl)
;     op = 'Enumeration =>
;         kind = 'in_form => con
;         prefix_to_string(con)
;     op = 'Record => Record_to_form(argl, kind)
;     op = 'Union => Union_to_form(argl, kind)
;     op = 'Mapping => Mapping_to_form(argl, kind)
;     (abb := constructor?(op)) =>
;         opn :=
;             $abbreviateTypes => abb
;             op
;         null(argl) =>
;             kind = 'in_form => con
;             kind = 'str_form => PNAME(opn)
;             opn
;         con_sig := getConstructorSignature(op)
;         cosig := get_database(op, 'COSIG)
;         null(con_sig) or null(cosig) =>
;             -- Wrong, but we try to produce something
;             kind = 'in_form => ["error", '"Bad type"]
;             prefix_to_string(con)
;         con_sig := rest(con_sig)
;         cosig := rest(cosig)
;         if not freeOfSharpVars(con_sig) then
;             con_sig := SUBLIS([[s_var, :val]
;                                for s_var in $FormalMapVariableList
;                                for val in argl], con_sig)
;         n_argl := [arg_to_form(arg, t, c, kind) for arg in argl
;                    for t in con_sig for c in cosig]
;         kind = 'in_form => cons(op, n_argl)
;         kind = 'str_form =>
;             op_with_args(opn, n_argl)
;         [opn, :n_argl]
;     -- Wrong, but we try to produce something
;     kind = 'in_form => ["error", '"Bad type"]
;     prefix_to_string(con)

(DEFUN |constructor_to_form| (|con| |kind|)
  (PROG (|op| |argl| |abb| |opn| |con_sig| |cosig| |n_argl|)
    (RETURN
     (PROGN
      (COND ((VECTORP |con|) (SETQ |con| (|devaluate| |con|))))
      (COND
       ((STRINGP |con|)
        (COND ((EQ |kind| '|in_form|) |con|)
              ((AND (EQ |kind| '|str_form|) (EQUAL |con| "...")) |con|)
              (#1='T (CONCAT '|"| |con| '|"|))))
       ((ATOM |con|)
        (COND ((EQUAL |con| |$EmptyMode|) "?")
              ((EQ |kind| '|in_form|) (LIST '|error| "Bad type"))
              (#1# (|any_to_string| |con|))))
       (#1#
        (PROGN
         (SETQ |op| (CAR |con|))
         (SETQ |argl| (CDR |con|))
         (COND ((EQ |op| '|Join|) (|Join_to_OutputForm| |argl|))
               ((EQ |op| '|mkCategory|) (|mkCategory_to_OutputForm| |argl|))
               ((EQ |op| '|Enumeration|)
                (COND ((EQ |kind| '|in_form|) |con|)
                      (#1# (|prefix_to_string| |con|))))
               ((EQ |op| '|Record|) (|Record_to_form| |argl| |kind|))
               ((EQ |op| '|Union|) (|Union_to_form| |argl| |kind|))
               ((EQ |op| '|Mapping|) (|Mapping_to_form| |argl| |kind|))
               ((SETQ |abb| (|constructor?| |op|))
                (PROGN
                 (SETQ |opn| (COND (|$abbreviateTypes| |abb|) (#1# |op|)))
                 (COND
                  ((NULL |argl|)
                   (COND ((EQ |kind| '|in_form|) |con|)
                         ((EQ |kind| '|str_form|) (PNAME |opn|)) (#1# |opn|)))
                  (#1#
                   (PROGN
                    (SETQ |con_sig| (|getConstructorSignature| |op|))
                    (SETQ |cosig| (|get_database| |op| 'COSIG))
                    (COND
                     ((OR (NULL |con_sig|) (NULL |cosig|))
                      (COND ((EQ |kind| '|in_form|) (LIST '|error| "Bad type"))
                            (#1# (|prefix_to_string| |con|))))
                     (#1#
                      (PROGN
                       (SETQ |con_sig| (CDR |con_sig|))
                       (SETQ |cosig| (CDR |cosig|))
                       (COND
                        ((NULL (|freeOfSharpVars| |con_sig|))
                         (SETQ |con_sig|
                                 (SUBLIS
                                  ((LAMBDA
                                       (|bfVar#11| |bfVar#9| |s_var| |bfVar#10|
                                        |val|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#9|)
                                            (PROGN
                                             (SETQ |s_var| (CAR |bfVar#9|))
                                             NIL)
                                            (ATOM |bfVar#10|)
                                            (PROGN
                                             (SETQ |val| (CAR |bfVar#10|))
                                             NIL))
                                        (RETURN (NREVERSE |bfVar#11|)))
                                       (#1#
                                        (SETQ |bfVar#11|
                                                (CONS (CONS |s_var| |val|)
                                                      |bfVar#11|))))
                                      (SETQ |bfVar#9| (CDR |bfVar#9|))
                                      (SETQ |bfVar#10| (CDR |bfVar#10|))))
                                   NIL |$FormalMapVariableList| NIL |argl| NIL)
                                  |con_sig|))))
                       (SETQ |n_argl|
                               ((LAMBDA
                                    (|bfVar#15| |bfVar#12| |arg| |bfVar#13| |t|
                                     |bfVar#14| |c|)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#12|)
                                         (PROGN
                                          (SETQ |arg| (CAR |bfVar#12|))
                                          NIL)
                                         (ATOM |bfVar#13|)
                                         (PROGN
                                          (SETQ |t| (CAR |bfVar#13|))
                                          NIL)
                                         (ATOM |bfVar#14|)
                                         (PROGN
                                          (SETQ |c| (CAR |bfVar#14|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#15|)))
                                    (#1#
                                     (SETQ |bfVar#15|
                                             (CONS
                                              (|arg_to_form| |arg| |t| |c|
                                               |kind|)
                                              |bfVar#15|))))
                                   (SETQ |bfVar#12| (CDR |bfVar#12|))
                                   (SETQ |bfVar#13| (CDR |bfVar#13|))
                                   (SETQ |bfVar#14| (CDR |bfVar#14|))))
                                NIL |argl| NIL |con_sig| NIL |cosig| NIL))
                       (COND ((EQ |kind| '|in_form|) (CONS |op| |n_argl|))
                             ((EQ |kind| '|str_form|)
                              (|op_with_args| |opn| |n_argl|))
                             (#1# (CONS |opn| |n_argl|)))))))))))
               ((EQ |kind| '|in_form|) (LIST '|error| "Bad type"))
               (#1# (|prefix_to_string| |con|))))))))))

; constructor_to_String(con) == constructor_to_form(con, 'str_form)

(DEFUN |constructor_to_String| (|con|)
  (PROG () (RETURN (|constructor_to_form| |con| '|str_form|))))

; constructor_to_OutputForm(con) == constructor_to_form(con, 'out_form)

(DEFUN |constructor_to_OutputForm| (|con|)
  (PROG () (RETURN (|constructor_to_form| |con| '|out_form|))))

; constructor_to_InputForm(con) == constructor_to_form(con, 'in_form)

(DEFUN |constructor_to_InputForm| (|con|)
  (PROG () (RETURN (|constructor_to_form| |con| '|in_form|))))
