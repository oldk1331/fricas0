
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $historyDisplayWidth := 120

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$historyDisplayWidth| 120))

; htSystemVariables() ==
;     not $fullScreenSysVars => htSetVars()
;     classlevel := $UserLevel
;     $levels : local := '(compiler development interpreter)
;     $heading  : local := nil
;     while classlevel ~= first $levels repeat $levels := rest $levels
;     table := NREVERSE(hsv_fn($setOptions, nil, true))
;     page := htInitPage('"System Variables", nil)
;     ht_add_string(page, '"\beginmenu")
;     lastHeading := nil
;     for [heading,name,message,.,key,variable,options,func] in table repeat
;       ht_add_string(page, '"\newline\item ")
;       if heading = lastHeading then ht_add_string(page, '"\tab{8}") else
;           ht_add_strings(page, [PNAME(heading), '"\tab{8}"])
;           lastHeading := heading
;       ht_add_strings(page, ['"{\em ", PNAME(name), "}\tab{22}", message])
;       ht_add_string(page, '"\tab{80}")
;       key = 'FUNCTION =>
;          null options => ht_add_to_page(page,
;                                      [['bcLinks, ['"reset", '"", func]]])
;          [msg,class,var,valuesOrFunction,:.] := first options  --skip first message
;          functionTail(page, name, class, var, valuesOrFunction)
;          for option in rest options repeat
;            option is ['break,:.] => 'skip
;            [msg,class,var,valuesOrFunction,:.] := option
;            ht_add_strings(page, ['"\newline\tab{22}", msg,'"\tab{80}"])
;            functionTail(page, name, class, var, valuesOrFunction)
;       val := eval variable
;       displayOptions(page, name, key, variable, val, options)
;     ht_add_string(page, '"\endmenu")
;     htShowPage1(page)

(DEFUN |htSystemVariables| ()
  (PROG (|$heading| |$levels| |classlevel| |table| |page| |lastHeading|
         |heading| |ISTMP#1| |name| |ISTMP#2| |message| |ISTMP#3| |ISTMP#4|
         |key| |ISTMP#5| |variable| |ISTMP#6| |options| |ISTMP#7| |func|
         |LETTMP#1| |msg| |class| |var| |valuesOrFunction| |val|)
    (DECLARE (SPECIAL |$heading| |$levels|))
    (RETURN
     (COND ((NULL |$fullScreenSysVars|) (|htSetVars|))
           (#1='T
            (PROGN
             (SETQ |classlevel| |$UserLevel|)
             (SETQ |$levels| '(|compiler| |development| |interpreter|))
             (SETQ |$heading| NIL)
             ((LAMBDA ()
                (LOOP
                 (COND ((EQUAL |classlevel| (CAR |$levels|)) (RETURN NIL))
                       (#1# (SETQ |$levels| (CDR |$levels|)))))))
             (SETQ |table| (NREVERSE (|hsv_fn| |$setOptions| NIL T)))
             (SETQ |page| (|htInitPage| "System Variables" NIL))
             (|ht_add_string| |page| "\\beginmenu")
             (SETQ |lastHeading| NIL)
             ((LAMBDA (|bfVar#2| |bfVar#1|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#2|)
                       (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#1|)
                        (PROGN
                         (SETQ |heading| (CAR |bfVar#1|))
                         (SETQ |ISTMP#1| (CDR |bfVar#1|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |name| (CAR |ISTMP#1|))
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|)
                                    (PROGN
                                     (SETQ |message| (CAR |ISTMP#2|))
                                     (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                     (AND (CONSP |ISTMP#3|)
                                          (PROGN
                                           (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                           (AND (CONSP |ISTMP#4|)
                                                (PROGN
                                                 (SETQ |key| (CAR |ISTMP#4|))
                                                 (SETQ |ISTMP#5|
                                                         (CDR |ISTMP#4|))
                                                 (AND (CONSP |ISTMP#5|)
                                                      (PROGN
                                                       (SETQ |variable|
                                                               (CAR |ISTMP#5|))
                                                       (SETQ |ISTMP#6|
                                                               (CDR |ISTMP#5|))
                                                       (AND (CONSP |ISTMP#6|)
                                                            (PROGN
                                                             (SETQ |options|
                                                                     (CAR
                                                                      |ISTMP#6|))
                                                             (SETQ |ISTMP#7|
                                                                     (CDR
                                                                      |ISTMP#6|))
                                                             (AND
                                                              (CONSP |ISTMP#7|)
                                                              (EQ
                                                               (CDR |ISTMP#7|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |func|
                                                                       (CAR
                                                                        |ISTMP#7|))
                                                               #1#)))))))))))))))
                        (PROGN
                         (|ht_add_string| |page| "\\newline\\item ")
                         (COND
                          ((EQUAL |heading| |lastHeading|)
                           (|ht_add_string| |page| "\\tab{8}"))
                          (#1#
                           (|ht_add_strings| |page|
                            (LIST (PNAME |heading|) "\\tab{8}"))
                           (SETQ |lastHeading| |heading|)))
                         (|ht_add_strings| |page|
                          (LIST "{\\em " (PNAME |name|) '|}\\tab{22}|
                                |message|))
                         (|ht_add_string| |page| "\\tab{80}")
                         (COND
                          ((EQ |key| 'FUNCTION)
                           (COND
                            ((NULL |options|)
                             (|ht_add_to_page| |page|
                              (LIST
                               (LIST '|bcLinks| (LIST "reset" "" |func|)))))
                            (#1#
                             (PROGN
                              (SETQ |LETTMP#1| (CAR |options|))
                              (SETQ |msg| (CAR |LETTMP#1|))
                              (SETQ |class| (CADR . #2=(|LETTMP#1|)))
                              (SETQ |var| (CADDR . #2#))
                              (SETQ |valuesOrFunction| (CADDDR . #2#))
                              (|functionTail| |page| |name| |class| |var|
                               |valuesOrFunction|)
                              ((LAMBDA (|bfVar#3| |option|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#3|)
                                        (PROGN
                                         (SETQ |option| (CAR |bfVar#3|))
                                         NIL))
                                    (RETURN NIL))
                                   (#1#
                                    (COND
                                     ((AND (CONSP |option|)
                                           (EQ (CAR |option|) '|break|))
                                      '|skip|)
                                     (#1#
                                      (PROGN
                                       (SETQ |msg| (CAR |option|))
                                       (SETQ |class| (CADR . #3=(|option|)))
                                       (SETQ |var| (CADDR . #3#))
                                       (SETQ |valuesOrFunction| (CADDDR . #3#))
                                       (|ht_add_strings| |page|
                                        (LIST "\\newline\\tab{22}" |msg|
                                              "\\tab{80}"))
                                       (|functionTail| |page| |name| |class|
                                        |var| |valuesOrFunction|))))))
                                  (SETQ |bfVar#3| (CDR |bfVar#3|))))
                               (CDR |options|) NIL)))))
                          (#1#
                           (PROGN
                            (SETQ |val| (|eval| |variable|))
                            (|displayOptions| |page| |name| |key| |variable|
                             |val| |options|))))))))
                 (SETQ |bfVar#2| (CDR |bfVar#2|))))
              |table| NIL)
             (|ht_add_string| |page| "\\endmenu")
             (|htShowPage1| |page|)))))))

; functionTail(page, name, class, var, valuesOrFunction) ==
;     val := eval var
;     atom valuesOrFunction =>
;         ht_add_to_page(page, '((domainConditions (isDomain STR (String)))))
;         ht_add_to_page(page, [['bcLinks,
;             ['"reset", '"", 'htSetSystemVariableKind, [var, name, nil]]]])
;         ht_add_to_page(page, [['bcStrings,
;             [30, STRINGIMAGE(val), name, valuesOrFunction]]])
;     displayOptions(page, name, class, var, val, valuesOrFunction)

(DEFUN |functionTail| (|page| |name| |class| |var| |valuesOrFunction|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (SETQ |val| (|eval| |var|))
      (COND
       ((ATOM |valuesOrFunction|)
        (PROGN
         (|ht_add_to_page| |page|
          '((|domainConditions| (|isDomain| STR (|String|)))))
         (|ht_add_to_page| |page|
          (LIST
           (LIST '|bcLinks|
                 (LIST "reset" "" '|htSetSystemVariableKind|
                       (LIST |var| |name| NIL)))))
         (|ht_add_to_page| |page|
          (LIST
           (LIST '|bcStrings|
                 (LIST 30 (STRINGIMAGE |val|) |name| |valuesOrFunction|))))))
       ('T
        (|displayOptions| |page| |name| |class| |var| |val|
         |valuesOrFunction|)))))))

; displayOptions(page, name, class, variable, val, options) ==
;     class = 'INTEGER =>
;         opt1_str :=
;             options.1 => STRINGIMAGE(options.1)
;             ""
;         ht_add_to_page(page, [['bcLispLinks,
;             [STRCONC(STRINGIMAGE(options.0), '"-", opt1_str), '"",
;              'htSetSystemVariableKind, [variable, name, 'PARSE_-INTEGER]]]])
;         ht_add_to_page(page, '((domainConditions (isDomain INT (Integer)))))
;         ht_add_to_page(page, [['bcStrings, [5, STRINGIMAGE(val), name, 'INT]]])
;     class = 'STRING =>
;         ht_add_strings(page, ['"{\em ", val, '"}\space{1}"])
;     for x in options repeat
;       val = x or val = true and x = 'on or null val and x = 'off =>
;             ht_add_strings(page, ['"{\em ", STRINGIMAGE(x), '"}\space{1}"])
;       ht_add_to_page(page, [['bcLispLinks,
;                     [x, '" ", 'htSetSystemVariable, [variable, x]]]])

(DEFUN |displayOptions| (|page| |name| |class| |variable| |val| |options|)
  (PROG (|opt1_str|)
    (RETURN
     (COND
      ((EQ |class| 'INTEGER)
       (PROGN
        (SETQ |opt1_str|
                (COND ((ELT |options| 1) (STRINGIMAGE (ELT |options| 1)))
                      (#1='T '||)))
        (|ht_add_to_page| |page|
         (LIST
          (LIST '|bcLispLinks|
                (LIST (STRCONC (STRINGIMAGE (ELT |options| 0)) "-" |opt1_str|)
                      "" '|htSetSystemVariableKind|
                      (LIST |variable| |name| 'PARSE-INTEGER)))))
        (|ht_add_to_page| |page|
         '((|domainConditions| (|isDomain| INT (|Integer|)))))
        (|ht_add_to_page| |page|
         (LIST (LIST '|bcStrings| (LIST 5 (STRINGIMAGE |val|) |name| 'INT))))))
      ((EQ |class| 'STRING)
       (|ht_add_strings| |page| (LIST "{\\em " |val| "}\\space{1}")))
      (#1#
       ((LAMBDA (|bfVar#4| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
             (RETURN NIL))
            (#1#
             (COND
              ((OR (EQUAL |val| |x|) (AND (EQUAL |val| T) (EQ |x| '|on|))
                   (AND (NULL |val|) (EQ |x| '|off|)))
               (|ht_add_strings| |page|
                (LIST "{\\em " (STRINGIMAGE |x|) "}\\space{1}")))
              (#1#
               (|ht_add_to_page| |page|
                (LIST
                 (LIST '|bcLispLinks|
                       (LIST |x| " " '|htSetSystemVariable|
                             (LIST |variable| |x|)))))))))
           (SETQ |bfVar#4| (CDR |bfVar#4|))))
        |options| NIL))))))

; hsv_fn(lt, al, firstTime) ==
;     for t in lt repeat
;         if firstTime then $heading := opOf(t)
;         al := hsv_gn(t, al)
;     al

(DEFUN |hsv_fn| (|lt| |al| |firstTime|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#5| |t|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#5|) (PROGN (SETQ |t| (CAR |bfVar#5|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (COND (|firstTime| (SETQ |$heading| (|opOf| |t|))))
             (SETQ |al| (|hsv_gn| |t| |al|)))))
          (SETQ |bfVar#5| (CDR |bfVar#5|))))
       |lt| NIL)
      |al|))))

; hsv_gn(t, al) ==
;     [.,.,class,key,.,options,:.] := t
;     not MEMQ(class,$levels) => al
;     key = 'LITERALS or key = 'INTEGER or key = 'STRING => [[$heading,:t],:al]
;     key = 'TREE => hsv_fn(options, al, false)
;     key = 'FUNCTION => [[$heading,:t],:al]
;     systemError key

(DEFUN |hsv_gn| (|t| |al|)
  (PROG (|class| |key| |options|)
    (RETURN
     (PROGN
      (SETQ |class| (CADDR . #1=(|t|)))
      (SETQ |key| (CADDDR . #1#))
      (SETQ |options| (CADR (CDDDDR . #1#)))
      (COND ((NULL (MEMQ |class| |$levels|)) |al|)
            ((OR (EQ |key| 'LITERALS) (EQ |key| 'INTEGER) (EQ |key| 'STRING))
             (CONS (CONS |$heading| |t|) |al|))
            ((EQ |key| 'TREE) (|hsv_fn| |options| |al| NIL))
            ((EQ |key| 'FUNCTION) (CONS (CONS |$heading| |t|) |al|))
            ('T (|systemError| |key|)))))))

; htSetSystemVariableKind(htPage,[variable,name,fun]) ==
;   value := htpLabelInputString(htPage,name)
;   if STRINGP value and fun then value := FUNCALL(fun,value)
; --SCM::what to do???  if not FIXP value then userError ???
;   SET(variable,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariableKind| (|htPage| |bfVar#6|)
  (PROG (|variable| |name| |fun| |value|)
    (RETURN
     (PROGN
      (SETQ |variable| (CAR |bfVar#6|))
      (SETQ |name| (CADR . #1=(|bfVar#6|)))
      (SETQ |fun| (CADDR . #1#))
      (SETQ |value| (|htpLabelInputString| |htPage| |name|))
      (COND
       ((AND (STRINGP |value|) |fun|) (SETQ |value| (FUNCALL |fun| |value|))))
      (SET |variable| |value|)
      (|htSystemVariables|)))))

; htSetSystemVariable(htPage,[name,value]) ==
;   value :=
;     value = 'on => true
;     value = 'off => nil
;     value
;   SET(name,value)
;   htSystemVariables ()

(DEFUN |htSetSystemVariable| (|htPage| |bfVar#7|)
  (PROG (|name| |value|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |bfVar#7|))
      (SETQ |value| (CADR |bfVar#7|))
      (SETQ |value|
              (COND ((EQ |value| '|on|) T) ((EQ |value| '|off|) NIL)
                    ('T |value|)))
      (SET |name| |value|)
      (|htSystemVariables|)))))

; htSetVars() ==
;   $path := nil
;   $lastTree := nil
;   htShowSetTree($setOptions)

(DEFUN |htSetVars| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$path| NIL)
      (SETQ |$lastTree| NIL)
      (|htShowSetTree| |$setOptions|)))))

; htShowSetTree(setTree) ==
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page, 'setTree, setTree)
;   links := nil
;   maxWidth1 := maxWidth2 := 0
;   for setData in setTree repeat
;     satisfiesUserLevel setData.setLevel =>
;       okList := [setData,:okList]
;       maxWidth1 := MAX(# PNAME setData.setName,maxWidth1)
;       maxWidth2 := MAX(htShowCount STRINGIMAGE setData.setLabel,maxWidth2)
;   maxWidth1 := MAX(9,maxWidth1)
;   maxWidth2 := MAX(41,maxWidth2)
;   tabset1 := STRINGIMAGE (maxWidth1)
;   tabset2 := STRINGIMAGE (maxWidth2 + maxWidth1 + 1)
;   ht_add_strings(page, ['"\tab{2}\newline Variable\tab{",
;     STRINGIMAGE (maxWidth1 + quotient_INT(maxWidth2, 3)),
;      '"}Description\tab{",STRINGIMAGE(maxWidth2 + maxWidth1 + 2),
;       '"}Value\newline\beginitems "])
;   for setData in REVERSE okList repeat
;       ht_add_string(page, '"\item")
;       label := STRCONC('"\menuitemstyle{",setData.setName,'"}")
;       vv := htShowSetTreeValue(setData)
;       if vv = '"" then
;           vv := '"????"
;       links := [label,[['text,'"\tab{",tabset1,'"}",setData.setLabel,'"\tab{",tabset2,'"}{\em ", vv, '"}"]],
;                 'htShowSetPage, setData.setName]
;       ht_add_to_page(page, [['bcLispLinks, links, 'options, '(indent . 0)]])
;   ht_add_string(page, '"\enditems")
;   htShowPage1(page)

(DEFUN |htShowSetTree| (|setTree|)
  (PROG (|page| |links| |maxWidth2| |maxWidth1| |okList| |tabset1| |tabset2|
         |label| |vv|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
      (|htpSetProperty| |page| '|setTree| |setTree|)
      (SETQ |links| NIL)
      (SETQ |maxWidth1| (SETQ |maxWidth2| 0))
      ((LAMBDA (|bfVar#8| |setData|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |setData| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((|satisfiesUserLevel| (ELT |setData| 2))
              (IDENTITY
               (PROGN
                (SETQ |okList| (CONS |setData| |okList|))
                (SETQ |maxWidth1|
                        (MAX (LENGTH (PNAME (ELT |setData| 0))) |maxWidth1|))
                (SETQ |maxWidth2|
                        (MAX (|htShowCount| (STRINGIMAGE (ELT |setData| 1)))
                             |maxWidth2|))))))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))))
       |setTree| NIL)
      (SETQ |maxWidth1| (MAX 9 |maxWidth1|))
      (SETQ |maxWidth2| (MAX 41 |maxWidth2|))
      (SETQ |tabset1| (STRINGIMAGE |maxWidth1|))
      (SETQ |tabset2| (STRINGIMAGE (+ (+ |maxWidth2| |maxWidth1|) 1)))
      (|ht_add_strings| |page|
       (LIST "\\tab{2}\\newline Variable\\tab{"
             (STRINGIMAGE (+ |maxWidth1| (|quotient_INT| |maxWidth2| 3)))
             "}Description\\tab{"
             (STRINGIMAGE (+ (+ |maxWidth2| |maxWidth1|) 2))
             "}Value\\newline\\beginitems "))
      ((LAMBDA (|bfVar#9| |setData|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#9|) (PROGN (SETQ |setData| (CAR |bfVar#9|)) NIL))
            (RETURN NIL))
           (#1#
            (PROGN
             (|ht_add_string| |page| "\\item")
             (SETQ |label| (STRCONC "\\menuitemstyle{" (ELT |setData| 0) "}"))
             (SETQ |vv| (|htShowSetTreeValue| |setData|))
             (COND ((EQUAL |vv| "") (SETQ |vv| "????")))
             (SETQ |links|
                     (LIST |label|
                           (LIST
                            (LIST '|text| "\\tab{" |tabset1| "}"
                                  (ELT |setData| 1) "\\tab{" |tabset2|
                                  "}{\\em " |vv| "}"))
                           '|htShowSetPage| (ELT |setData| 0)))
             (|ht_add_to_page| |page|
              (LIST
               (LIST '|bcLispLinks| |links| '|options| '(|indent| . 0)))))))
          (SETQ |bfVar#9| (CDR |bfVar#9|))))
       (REVERSE |okList|) NIL)
      (|ht_add_string| |page| "\\enditems")
      (|htShowPage1| |page|)))))

; htShowCount s == --# discounting {\em .. }
;   m := #s
;   m < 8 => m - 1
;   i := 0
;   count := 0
;   while i < m - 7 repeat
;     s.i = char '_{ and  s.(i+1) = char '_\ and s.(i+2) = char 'e
;       and s.(i+3) = char 'm => i := i + 6     --discount {\em }
;     i := i + 1
;     count := count + 1
;   count + (m - i)

(DEFUN |htShowCount| (|s|)
  (PROG (|m| |i| |count|)
    (RETURN
     (PROGN
      (SETQ |m| (LENGTH |s|))
      (COND ((< |m| 8) (- |m| 1))
            (#1='T
             (PROGN
              (SETQ |i| 0)
              (SETQ |count| 0)
              ((LAMBDA ()
                 (LOOP
                  (COND ((NOT (< |i| (- |m| 7))) (RETURN NIL))
                        (#1#
                         (COND
                          ((AND (EQUAL (ELT |s| |i|) (|char| '{))
                                (EQUAL (ELT |s| (+ |i| 1)) (|char| '|\\|))
                                (EQUAL (ELT |s| (+ |i| 2)) (|char| '|e|))
                                (EQUAL (ELT |s| (+ |i| 3)) (|char| '|m|)))
                           (SETQ |i| (+ |i| 6)))
                          (#1#
                           (PROGN
                            (SETQ |i| (+ |i| 1))
                            (SETQ |count| (+ |count| 1))))))))))
              (+ |count| (- |m| |i|)))))))))

; htShowSetTreeValue(setData) ==
;   st := setData.setType
;   st = 'FUNCTION => object2String FUNCALL(setData.setVar,"%display%")
;   st = 'INTEGER  => object2String eval setData.setVar
;   st = 'STRING  => object2String eval setData.setVar
;   st = 'LITERALS =>
;     object2String translateTrueFalse2YesNo eval setData.setVar
;   st = 'TREE     => '"..."
;   systemError([])

(DEFUN |htShowSetTreeValue| (|setData|)
  (PROG (|st|)
    (RETURN
     (PROGN
      (SETQ |st| (ELT |setData| 3))
      (COND
       ((EQ |st| 'FUNCTION)
        (|object2String| (FUNCALL (ELT |setData| 4) '|%display%|)))
       ((EQ |st| 'INTEGER) (|object2String| (|eval| (ELT |setData| 4))))
       ((EQ |st| 'STRING) (|object2String| (|eval| (ELT |setData| 4))))
       ((EQ |st| 'LITERALS)
        (|object2String|
         (|translateTrueFalse2YesNo| (|eval| (ELT |setData| 4)))))
       ((EQ |st| 'TREE) "...") ('T (|systemError| NIL)))))))

; mkSetTitle() == STRCONC('"Command {\em )set ",listOfStrings2String $path,'"}")

(DEFUN |mkSetTitle| ()
  (PROG ()
    (RETURN
     (STRCONC "Command {\\em )set " (|listOfStrings2String| |$path|) "}"))))

; listOfStrings2String u ==
;   null u => '""
;   STRCONC(listOfStrings2String rest u,'" ",stringize first u)

(DEFUN |listOfStrings2String| (|u|)
  (PROG ()
    (RETURN
     (COND ((NULL |u|) "")
           ('T
            (STRCONC (|listOfStrings2String| (CDR |u|)) " "
             (|stringize| (CAR |u|))))))))

; htShowSetPage(htPage, branch) ==
;   setTree := htpProperty(htPage, 'setTree)
;   $path := [branch]
;   setData := assoc(branch, setTree)
;   null setData =>
;     systemError('"No Set Data")
;   st := setData.setType
;   st = 'FUNCTION => htShowFunctionPage(htPage, setData)
;   st = 'INTEGER  =>  htShowIntegerPage(htPage,setData)
;   st = 'LITERALS => htShowLiteralsPage(htPage, setData)
;   st = 'TREE     => htShowSetTree(setData.setLeaf)
;
;   st = 'STRING   =>  -- have to add this
;      htSetNotAvailable(htPage,'")set compiler")
;
;   systemError '"Unknown data type"

(DEFUN |htShowSetPage| (|htPage| |branch|)
  (PROG (|setTree| |setData| |st|)
    (RETURN
     (PROGN
      (SETQ |setTree| (|htpProperty| |htPage| '|setTree|))
      (SETQ |$path| (LIST |branch|))
      (SETQ |setData| (|assoc| |branch| |setTree|))
      (COND ((NULL |setData|) (|systemError| "No Set Data"))
            (#1='T
             (PROGN
              (SETQ |st| (ELT |setData| 3))
              (COND
               ((EQ |st| 'FUNCTION) (|htShowFunctionPage| |htPage| |setData|))
               ((EQ |st| 'INTEGER) (|htShowIntegerPage| |htPage| |setData|))
               ((EQ |st| 'LITERALS) (|htShowLiteralsPage| |htPage| |setData|))
               ((EQ |st| 'TREE) (|htShowSetTree| (ELT |setData| 5)))
               ((EQ |st| 'STRING)
                (|htSetNotAvailable| |htPage| ")set compiler"))
               (#1# (|systemError| "Unknown data type"))))))))))

; htShowLiteralsPage(htPage, setData) ==
;   htSetLiterals(htPage,setData.setName,setData.setLabel,
;                 setData.setVar,setData.setLeaf,'htSetLiteral)

(DEFUN |htShowLiteralsPage| (|htPage| |setData|)
  (PROG ()
    (RETURN
     (|htSetLiterals| |htPage| (ELT |setData| 0) (ELT |setData| 1)
      (ELT |setData| 4) (ELT |setData| 5) '|htSetLiteral|))))

; htSetLiterals(htPage,name,message,variable,values,functionToCall) ==
;   page := htInitPage('"Set Command", htpPropertyList htPage)
;   htpSetProperty(page, 'variable, variable)
;   htSetLiterals2(page, name, message, EVAL(variable), values, functionToCall)

(DEFUN |htSetLiterals|
       (|htPage| |name| |message| |variable| |values| |functionToCall|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| "Set Command" (|htpPropertyList| |htPage|)))
      (|htpSetProperty| |page| '|variable| |variable|)
      (|htSetLiterals2| |page| |name| |message| (EVAL |variable|) |values|
       |functionToCall|)))))

; ht_set_description(page, name, message) ==
;     ht_add_strings(page, ['"\centerline{Set {\em ", PNAME(name),
;                           '"}}\newline"])
;     ht_add_strings(page, ['"{\em Description: } ", message,
;                           '"\newline\vspace{1} "])

(DEFUN |ht_set_description| (|page| |name| |message|)
  (PROG ()
    (RETURN
     (PROGN
      (|ht_add_strings| |page|
       (LIST "\\centerline{Set {\\em " (PNAME |name|) "}}\\newline"))
      (|ht_add_strings| |page|
       (LIST "{\\em Description: } " |message| "\\newline\\vspace{1} "))))))

; htSetLiterals2(page, name, message, cval, values, functionToCall) ==
;   ht_set_description(page, name, message)
;   ht_add_string(page, '"Select one of the following: \newline\tab{3} ")
;   links := [[STRCONC('"",STRINGIMAGE opt), '"\newline\tab{3}", functionToCall, opt] for opt in values]
;   ht_add_to_page(page, [['bcLispLinks, :links]])
;   bcHt2(page, ['"\indent{0}\newline\vspace{1} The current setting is: {\em ",
;         translateTrueFalse2YesNo(cval), '"} "])
;   htShowPage1(page)

(DEFUN |htSetLiterals2|
       (|page| |name| |message| |cval| |values| |functionToCall|)
  (PROG (|links|)
    (RETURN
     (PROGN
      (|ht_set_description| |page| |name| |message|)
      (|ht_add_string| |page|
       "Select one of the following: \\newline\\tab{3} ")
      (SETQ |links|
              ((LAMBDA (|bfVar#11| |bfVar#10| |opt|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#10|)
                        (PROGN (SETQ |opt| (CAR |bfVar#10|)) NIL))
                    (RETURN (NREVERSE |bfVar#11|)))
                   ('T
                    (SETQ |bfVar#11|
                            (CONS
                             (LIST (STRCONC "" (STRINGIMAGE |opt|))
                                   "\\newline\\tab{3}" |functionToCall| |opt|)
                             |bfVar#11|))))
                  (SETQ |bfVar#10| (CDR |bfVar#10|))))
               NIL |values| NIL))
      (|ht_add_to_page| |page| (LIST (CONS '|bcLispLinks| |links|)))
      (|bcHt2| |page|
       (LIST "\\indent{0}\\newline\\vspace{1} The current setting is: {\\em "
             (|translateTrueFalse2YesNo| |cval|) "} "))
      (|htShowPage1| |page|)))))

; htSetLiteral(htPage, val) ==
;   SET(htpProperty(htPage, 'variable), translateYesNo2TrueFalse val)
;   htKill(htPage,val)

(DEFUN |htSetLiteral| (|htPage| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (SET (|htpProperty| |htPage| '|variable|)
           (|translateYesNo2TrueFalse| |val|))
      (|htKill| |htPage| |val|)))))

; htShowIntegerPage(htPage, setData) ==
;   page := htInitPage(mkSetTitle(), htpPropertyList htPage)
;   htpSetProperty(page, 'variable, setData.setVar)
;   ht_set_description(page, setData.setName, setData.setLabel)
;   [$htInitial,$htFinal] := setData.setLeaf
;   if $htFinal = $htInitial + 1 then
;       ht_add_strings(page, ['"Enter the integer {\em ", stringize($htInitial),
;                             '"} or {\em ", stringize($htFinal), '"}:"])
;   else if null $htFinal then
;       ht_add_strings(page, ['"Enter an integer greater than {\em ",
;                             stringize($htInitial - 1), '"}:"])
;   else
;       ht_add_strings(page, ['"Enter an integer between {\em ",
;          stringize($htInitial), '"} and {\em ", stringize($htFinal), '"}:"])
;   ht_add_to_page(page, [
;     '(domainConditions (Satisfies S chkRange)),
;       ['bcStrings, [5, eval(setData.setVar), 'value, 'S]]])
;   htMakeDoneButton(page, '"Select to Set Value", 'htSetInteger)
;   htShowPage1(page)

(DEFUN |htShowIntegerPage| (|htPage| |setData|)
  (PROG (|page| |LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) (|htpPropertyList| |htPage|)))
      (|htpSetProperty| |page| '|variable| (ELT |setData| 4))
      (|ht_set_description| |page| (ELT |setData| 0) (ELT |setData| 1))
      (SETQ |LETTMP#1| (ELT |setData| 5))
      (SETQ |$htInitial| (CAR |LETTMP#1|))
      (SETQ |$htFinal| (CADR |LETTMP#1|))
      (COND
       ((EQUAL |$htFinal| (+ |$htInitial| 1))
        (|ht_add_strings| |page|
         (LIST "Enter the integer {\\em " (|stringize| |$htInitial|)
               "} or {\\em " (|stringize| |$htFinal|) "}:")))
       ((NULL |$htFinal|)
        (|ht_add_strings| |page|
         (LIST "Enter an integer greater than {\\em "
               (|stringize| (- |$htInitial| 1)) "}:")))
       ('T
        (|ht_add_strings| |page|
         (LIST "Enter an integer between {\\em " (|stringize| |$htInitial|)
               "} and {\\em " (|stringize| |$htFinal|) "}:"))))
      (|ht_add_to_page| |page|
       (LIST '(|domainConditions| (|Satisfies| S |chkRange|))
             (LIST '|bcStrings|
                   (LIST 5 (|eval| (ELT |setData| 4)) '|value| 'S))))
      (|htMakeDoneButton| |page| "Select to Set Value" '|htSetInteger|)
      (|htShowPage1| |page|)))))

; htSetInteger(htPage) ==
;   htInitPage(mkSetTitle(), nil)
;   val := chkRange htpLabelInputString(htPage,'value)
;   not INTEGERP val =>
;     errorPage(['"Value Error",nil,'"\vspace{3}\centerline{{\em ",val,'"}}\vspace{2}\newline\centerline{Click on \UpBitmap{} to re-enter value}"])
;   SET(htpProperty(htPage, 'variable), val)
;   htKill(htPage,val)

(DEFUN |htSetInteger| (|htPage|)
  (PROG (|val|)
    (RETURN
     (PROGN
      (|htInitPage| (|mkSetTitle|) NIL)
      (SETQ |val| (|chkRange| (|htpLabelInputString| |htPage| '|value|)))
      (COND
       ((NULL (INTEGERP |val|))
        (|errorPage|
         (LIST "Value Error" NIL "\\vspace{3}\\centerline{{\\em " |val|
               "}}\\vspace{2}\\newline\\centerline{Click on \\UpBitmap{} to re-enter value}")))
       ('T
        (PROGN
         (SET (|htpProperty| |htPage| '|variable|) |val|)
         (|htKill| |htPage| |val|))))))))

; htShowFunctionPage(htPage,setData) ==
;   htpSetProperty(htPage, 'setData, setData)
;   fn := setData.setDef => FUNCALL(fn,htPage)
;   htpSetProperty(htPage,'parts, setData.setLeaf)
;   htShowFunctionPageContinued(htPage)

(DEFUN |htShowFunctionPage| (|htPage| |setData|)
  (PROG (|fn|)
    (RETURN
     (PROGN
      (|htpSetProperty| |htPage| '|setData| |setData|)
      (COND ((SETQ |fn| (ELT |setData| 6)) (FUNCALL |fn| |htPage|))
            ('T
             (PROGN
              (|htpSetProperty| |htPage| '|parts| (ELT |setData| 5))
              (|htShowFunctionPageContinued| |htPage|))))))))

; htShowFunctionPageContinued(htPage) ==
;   parts := htpProperty(htPage,'parts)
;   setData := htpProperty(htPage,'setData)
;   [[phrase,kind,variable,checker,initValue,:.],:restParts] := parts
;   htpSetProperty(htPage, 'variable, variable)
;   htpSetProperty(htPage, 'checker, checker)
;   htpSetProperty(htPage, 'parts, restParts)
;   kind = 'LITERALS => htSetLiterals(htPage,setData.setName,
;                                     phrase,variable,checker,'htFunctionSetLiteral)
;   htShowFunctionPageContinued2(htPage, setData, EVAL(variable), checker,
;                                phrase, 'htSetFunCommand)

(DEFUN |htShowFunctionPageContinued| (|htPage|)
  (PROG (|parts| |setData| |phrase| |kind| |variable| |checker| |initValue|
         |restParts|)
    (RETURN
     (PROGN
      (SETQ |parts| (|htpProperty| |htPage| '|parts|))
      (SETQ |setData| (|htpProperty| |htPage| '|setData|))
      (SETQ |phrase| (CAAR . #1=(|parts|)))
      (SETQ |kind| (CADAR . #1#))
      (SETQ |variable| (CADDAR . #1#))
      (SETQ |checker| (CAR #2=(CDDDAR . #1#)))
      (SETQ |initValue| (CADR #2#))
      (SETQ |restParts| (CDR |parts|))
      (|htpSetProperty| |htPage| '|variable| |variable|)
      (|htpSetProperty| |htPage| '|checker| |checker|)
      (|htpSetProperty| |htPage| '|parts| |restParts|)
      (COND
       ((EQ |kind| 'LITERALS)
        (|htSetLiterals| |htPage| (ELT |setData| 0) |phrase| |variable|
         |checker| '|htFunctionSetLiteral|))
       ('T
        (|htShowFunctionPageContinued2| |htPage| |setData| (EVAL |variable|)
         |checker| |phrase| '|htSetFunCommand|)))))))

; htShowFunctionPageContinued2(htPage, setData, cval, checker, phrase,
;                              fun_to_call) ==
;   page := htInitPage(mkSetTitle(), htpPropertyList htPage)
;   ht_set_description(page, setData.setName, setData.setLabel)
;   ht_add_to_page(page,
;     [ ['domainConditions, ['Satisfies,'S,checker]],
;       ['text,:phrase],
;         ['inputStrings,
;           [ '"", '"", 60, cval, 'value, 'S]]])
;   htMakeDoneButton(page, '"Select to Set Value", fun_to_call)
;   htShowPage1(page)

(DEFUN |htShowFunctionPageContinued2|
       (|htPage| |setData| |cval| |checker| |phrase| |fun_to_call|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) (|htpPropertyList| |htPage|)))
      (|ht_set_description| |page| (ELT |setData| 0) (ELT |setData| 1))
      (|ht_add_to_page| |page|
       (LIST (LIST '|domainConditions| (LIST '|Satisfies| 'S |checker|))
             (CONS '|text| |phrase|)
             (LIST '|inputStrings| (LIST "" "" 60 |cval| '|value| 'S))))
      (|htMakeDoneButton| |page| "Select to Set Value" |fun_to_call|)
      (|htShowPage1| |page|)))))

; htFunctionSetLiteral(htPage, val) ==
;   htInitPage('"Set Command", nil)
;   SET(htpProperty(htPage, 'variable), translateYesNo2TrueFalse val)
;   htSetFunCommandContinue(htPage,val)

(DEFUN |htFunctionSetLiteral| (|htPage| |val|)
  (PROG ()
    (RETURN
     (PROGN
      (|htInitPage| "Set Command" NIL)
      (SET (|htpProperty| |htPage| '|variable|)
           (|translateYesNo2TrueFalse| |val|))
      (|htSetFunCommandContinue| |htPage| |val|)))))

; htSetFunCommand(htPage) ==
;   variable := htpProperty(htPage,'variable)
;   checker := htpProperty(htPage,'checker)
;   value := htCheck(checker,htpLabelInputString(htPage,'value))
;   SET(variable,value) --kill this later
;   htSetFunCommandContinue(htPage,value)

(DEFUN |htSetFunCommand| (|htPage|)
  (PROG (|variable| |checker| |value|)
    (RETURN
     (PROGN
      (SETQ |variable| (|htpProperty| |htPage| '|variable|))
      (SETQ |checker| (|htpProperty| |htPage| '|checker|))
      (SETQ |value|
              (|htCheck| |checker| (|htpLabelInputString| |htPage| '|value|)))
      (SET |variable| |value|)
      (|htSetFunCommandContinue| |htPage| |value|)))))

; htSetFunCommandContinue(htPage,value) ==
;   parts := htpProperty(htPage,'parts)
;   continue :=
;     null parts => false
;     parts is [['break,predicate],:restParts] => eval predicate
;     true
;   continue =>
;     htpSetProperty(htPage,'parts,restParts)
;     htShowFunctionPageContinued(htPage)
;   htKill(htPage,value)

(DEFUN |htSetFunCommandContinue| (|htPage| |value|)
  (PROG (|parts| |ISTMP#1| |ISTMP#2| |predicate| |restParts| |continue|)
    (RETURN
     (PROGN
      (SETQ |parts| (|htpProperty| |htPage| '|parts|))
      (SETQ |continue|
              (COND ((NULL |parts|) NIL)
                    ((AND (CONSP |parts|)
                          (PROGN
                           (SETQ |ISTMP#1| (CAR |parts|))
                           (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|break|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |predicate| (CAR |ISTMP#2|))
                                       #1='T)))))
                          (PROGN (SETQ |restParts| (CDR |parts|)) #1#))
                     (|eval| |predicate|))
                    (#1# T)))
      (COND
       (|continue|
        (PROGN
         (|htpSetProperty| |htPage| '|parts| |restParts|)
         (|htShowFunctionPageContinued| |htPage|)))
       (#1# (|htKill| |htPage| |value|)))))))

; htKill(htPage,value) ==
;   page := htInitPage('"System Command", nil)
;   string := STRCONC('"{\em )set ",listOfStrings2String [value,:$path],'"}")
;   ht_add_to_page(page, [
;      '(text
;         "{Here is the FriCAS system command you could have issued:}"
;             "\vspace{2}\newline\centerline{\tt"),
;       ['text,:string]])
;   ht_add_to_page(page, '((text . "}\vspace{1}\newline\rm")))
;   ht_add_string(page, '"\vspace{2}{Select \  \UpButton{} \  to go back.}")
;   ht_add_string(page,
;       '"\newline{Select \  \ExitButton{QuitPage} \  to remove this window.}")
;   htShowPage1(page)

(DEFUN |htKill| (|htPage| |value|)
  (PROG (|page| |string|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| "System Command" NIL))
      (SETQ |string|
              (STRCONC "{\\em )set "
               (|listOfStrings2String| (CONS |value| |$path|)) "}"))
      (|ht_add_to_page| |page|
       (LIST
        '(|text| "{Here is the FriCAS system command you could have issued:}"
          "\\vspace{2}\\newline\\centerline{\\tt")
        (CONS '|text| |string|)))
      (|ht_add_to_page| |page| '((|text| . "}\\vspace{1}\\newline\\rm")))
      (|ht_add_string| |page|
       "\\vspace{2}{Select \\  \\UpButton{} \\  to go back.}")
      (|ht_add_string| |page|
       "\\newline{Select \\  \\ExitButton{QuitPage} \\  to remove this window.}")
      (|htShowPage1| |page|)))))

; htSetNotAvailable(htPage,whatToType) ==
;   page := htInitPage('"Unavailable system command", nil)
;   string := STRCONC('"{\em ",whatToType,'"}")
;   ht_add_to_page(page, [
;      '(text "\vspace{1}\newline"
;         "{Sorry, but this system command is not available through HyperDoc. Please directly issue this command in a FriCAS window for more information:}"
;             "\vspace{2}\newline\centerline{\tt"),
;       ['text,:string]])
;   ht_add_to_page(page, '((text . "}\vspace{1}\newline")))
;   htShowPage1(page)

(DEFUN |htSetNotAvailable| (|htPage| |whatToType|)
  (PROG (|page| |string|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| "Unavailable system command" NIL))
      (SETQ |string| (STRCONC "{\\em " |whatToType| "}"))
      (|ht_add_to_page| |page|
       (LIST
        '(|text| "\\vspace{1}\\newline"
          "{Sorry, but this system command is not available through HyperDoc. Please directly issue this command in a FriCAS window for more information:}"
          "\\vspace{2}\\newline\\centerline{\\tt")
        (CONS '|text| |string|)))
      (|ht_add_to_page| |page| '((|text| . "}\\vspace{1}\\newline")))
      (|htShowPage1| |page|)))))

; htDoNothing(htPage,command) == nil

(DEFUN |htDoNothing| (|htPage| |command|) (PROG () (RETURN NIL)))

; htCheck(checker,value) ==
;   PAIRP checker => htCheckList(checker,parseWord value)
;   FUNCALL(checker,value)

(DEFUN |htCheck| (|checker| |value|)
  (PROG ()
    (RETURN
     (COND ((CONSP |checker|) (|htCheckList| |checker| (|parseWord| |value|)))
           ('T (FUNCALL |checker| |value|))))))

; parseWord x ==
;   STRINGP x =>
;     and/[char_to_digit(x.i) for i in 0..MAXINDEX(x)] => PARSE_-INTEGER(x)
;     INTERN x
;   x

(DEFUN |parseWord| (|x|)
  (PROG ()
    (RETURN
     (COND
      ((STRINGP |x|)
       (COND
        (((LAMBDA (|bfVar#13| |bfVar#12| |i|)
            (LOOP
             (COND ((> |i| |bfVar#12|) (RETURN |bfVar#13|))
                   (#1='T
                    (PROGN
                     (SETQ |bfVar#13| (|char_to_digit| (ELT |x| |i|)))
                     (COND ((NOT |bfVar#13|) (RETURN NIL))))))
             (SETQ |i| (+ |i| 1))))
          T (MAXINDEX |x|) 0)
         (PARSE-INTEGER |x|))
        (#1# (INTERN |x|))))
      (#1# |x|)))))

; htCheckList(checker,value) ==
;   if value in '(y ye yes Y YE YES) then value := 'yes
;   if value in '(n no N NO) then value := 'no
;   checker is [n,m] and INTEGERP n =>
;     m = n + 1 =>
;       value in checker => value
;       n
;     null m =>
;       INTEGERP value and value >= n => value
;       n
;     INTEGERP m =>
;       INTEGERP value and value >= n and value <= m => value
;       n
;   value in checker => value
;   first checker

(DEFUN |htCheckList| (|checker| |value|)
  (PROG (|n| |ISTMP#1| |m|)
    (RETURN
     (PROGN
      (COND
       ((|member| |value| '(|y| |ye| |yes| Y YE YES)) (SETQ |value| '|yes|)))
      (COND ((|member| |value| '(|n| |no| N NO)) (SETQ |value| '|no|)))
      (COND
       ((AND (CONSP |checker|)
             (PROGN
              (SETQ |n| (CAR |checker|))
              (SETQ |ISTMP#1| (CDR |checker|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |m| (CAR |ISTMP#1|)) #1='T)))
             (INTEGERP |n|))
        (COND
         ((EQUAL |m| (+ |n| 1))
          (COND ((|member| |value| |checker|) |value|) (#1# |n|)))
         ((NULL |m|)
          (COND ((AND (INTEGERP |value|) (NOT (< |value| |n|))) |value|)
                (#1# |n|)))
         ((INTEGERP |m|)
          (COND
           ((AND (INTEGERP |value|) (NOT (< |value| |n|))
                 (NOT (< |m| |value|)))
            |value|)
           (#1# |n|)))))
       ((|member| |value| |checker|) |value|) (#1# (CAR |checker|)))))))

; translateYesNoToTrueFalse x ==
;   x = 'yes => true
;   x = 'no => false
;   x

(DEFUN |translateYesNoToTrueFalse| (|x|)
  (PROG () (RETURN (COND ((EQ |x| '|yes|) T) ((EQ |x| '|no|) NIL) ('T |x|)))))

; chkNameList x ==
;   u := bcString2ListWords x
;   parsedNames := [ncParseFromString x for x in u]
;   and/[IDENTP x for x in parsedNames] => parsedNames
;   '"Please enter a list of identifiers separated by blanks"

(DEFUN |chkNameList| (|x|)
  (PROG (|u| |parsedNames|)
    (RETURN
     (PROGN
      (SETQ |u| (|bcString2ListWords| |x|))
      (SETQ |parsedNames|
              ((LAMBDA (|bfVar#15| |bfVar#14| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#14|)
                        (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
                    (RETURN (NREVERSE |bfVar#15|)))
                   (#1='T
                    (SETQ |bfVar#15|
                            (CONS (|ncParseFromString| |x|) |bfVar#15|))))
                  (SETQ |bfVar#14| (CDR |bfVar#14|))))
               NIL |u| NIL))
      (COND
       (((LAMBDA (|bfVar#17| |bfVar#16| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#16|) (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
              (RETURN |bfVar#17|))
             (#1#
              (PROGN
               (SETQ |bfVar#17| (IDENTP |x|))
               (COND ((NOT |bfVar#17|) (RETURN NIL))))))
            (SETQ |bfVar#16| (CDR |bfVar#16|))))
         T |parsedNames| NIL)
        |parsedNames|)
       (#1# "Please enter a list of identifiers separated by blanks"))))))

; chkPosInteger s ==
;   (u := parseOnly s) and INTEGERP u and u > 0 => u
;   '"Please enter a positive integer"

(DEFUN |chkPosInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (COND ((AND (SETQ |u| (|parseOnly| |s|)) (INTEGERP |u|) (< 0 |u|)) |u|)
           ('T "Please enter a positive integer")))))

; chkOutputFileName s ==
;     u := find_symbol(s)
;     first(u) = 0 and rest(u) = 'console => 'console
;     s

(DEFUN |chkOutputFileName| (|s|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|find_symbol| |s|))
      (COND ((AND (EQL (CAR |u|) 0) (EQ (CDR |u|) '|console|)) '|console|)
            ('T |s|))))))

; chkDirectory s == s

(DEFUN |chkDirectory| (|s|) (PROG () (RETURN |s|)))

; chkNonNegativeInteger s ==
;   (u := ncParseFromString s) and INTEGERP u and u >= 0 => u
;   '"Please enter a non-negative integer"

(DEFUN |chkNonNegativeInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (COND
      ((AND (SETQ |u| (|ncParseFromString| |s|)) (INTEGERP |u|)
            (NOT (MINUSP |u|)))
       |u|)
      ('T "Please enter a non-negative integer")))))

; chkRange s ==
;   (u := ncParseFromString s) and INTEGERP u
;     and u >= $htInitial and (NULL $htFinal or u <= $htFinal)
;       => u
;   null $htFinal =>
;     STRCONC('"Please enter an integer greater than ",stringize ($htInitial - 1))
;   STRCONC('"Please enter an integer between ",stringize $htInitial,'" and ",
;             stringize $htFinal)

(DEFUN |chkRange| (|s|)
  (PROG (|u|)
    (RETURN
     (COND
      ((AND (SETQ |u| (|ncParseFromString| |s|)) (INTEGERP |u|)
            (NOT (< |u| |$htInitial|))
            (OR (NULL |$htFinal|) (NOT (< |$htFinal| |u|))))
       |u|)
      ((NULL |$htFinal|)
       (STRCONC "Please enter an integer greater than "
        (|stringize| (- |$htInitial| 1))))
      ('T
       (STRCONC "Please enter an integer between " (|stringize| |$htInitial|)
        " and " (|stringize| |$htFinal|)))))))

; chkAllNonNegativeInteger s ==
;   (u := ncParseFromString s) and u in '(a al all A AL ALL) and 'ALL
;     or chkNonNegativeInteger s
;        or '"Please enter {\em all} or a non-negative integer"

(DEFUN |chkAllNonNegativeInteger| (|s|)
  (PROG (|u|)
    (RETURN
     (OR
      (AND (SETQ |u| (|ncParseFromString| |s|))
           (|member| |u| '(|a| |al| |all| A AL ALL)) 'ALL)
      (|chkNonNegativeInteger| |s|)
      "Please enter {\\em all} or a non-negative integer"))))

; htMakePathKey path ==
;   null path => systemError '"path is not set"
;   INTERN fn(PNAME first path,rest path) where
;     fn(a,b) ==
;       null b => a
;       fn(STRCONC(a,'".",PNAME first b),rest b)

(DEFUN |htMakePathKey| (|path|)
  (PROG ()
    (RETURN
     (COND ((NULL |path|) (|systemError| "path is not set"))
           ('T
            (INTERN (|htMakePathKey,fn| (PNAME (CAR |path|)) (CDR |path|))))))))
(DEFUN |htMakePathKey,fn| (|a| |b|)
  (PROG ()
    (RETURN
     (COND ((NULL |b|) |a|)
           ('T
            (|htMakePathKey,fn| (STRCONC |a| "." (PNAME (CAR |b|)))
             (CDR |b|)))))))

; htSetHistory htPage ==
;   msg := '"when the history facility is on (yes), results of computations are saved in memory"
;   data := ['history,msg,'history,'LITERALS,'$HiFiAccess,'(on off yes no)]
;   htShowLiteralsPage(htPage,data)

(DEFUN |htSetHistory| (|htPage|)
  (PROG (|msg| |data|)
    (RETURN
     (PROGN
      (SETQ |msg|
              "when the history facility is on (yes), results of computations are saved in memory")
      (SETQ |data|
              (LIST '|history| |msg| '|history| 'LITERALS '|$HiFiAccess|
                    '(|on| |off| |yes| |no|)))
      (|htShowLiteralsPage| |htPage| |data|)))))

; htSetOutputLibrary htPage ==
;   htSetNotAvailable(htPage,'")set compiler output")

(DEFUN |htSetOutputLibrary| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set compiler output"))))

; htSetInputLibrary htPage ==
;   htSetNotAvailable(htPage,'")set compiler input")

(DEFUN |htSetInputLibrary| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set compiler input"))))

; htSetExpose htPage ==
;   htSetNotAvailable(htPage,'")set expose")

(DEFUN |htSetExpose| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set expose"))))

; htSetOutputCharacters htPage ==
;   htSetNotAvailable(htPage,'")set output characters")

(DEFUN |htSetOutputCharacters| (|htPage|)
  (PROG () (RETURN (|htSetNotAvailable| |htPage| ")set output characters"))))

; htSetOutputPage(page) ==
;     setData := htpProperty(page, 'setData)
;     branch := first(setData)
;     rec := get_out_rec(branch)
;     htpSetProperty(page, 'output_rec, rec)
;     page := htInitPage('"Set Command", htpPropertyList(page))
;     htSetLiterals2(page, setData.setName, setData.setLabel,
;                    (rec.$on_off => 'on; 'off), '(on off),
;                    'htSetOutputPage2)

(DEFUN |htSetOutputPage| (|page|)
  (PROG (|setData| |branch| |rec|)
    (RETURN
     (PROGN
      (SETQ |setData| (|htpProperty| |page| '|setData|))
      (SETQ |branch| (CAR |setData|))
      (SETQ |rec| (|get_out_rec| |branch|))
      (|htpSetProperty| |page| '|output_rec| |rec|)
      (SETQ |page| (|htInitPage| "Set Command" (|htpPropertyList| |page|)))
      (|htSetLiterals2| |page| (ELT |setData| 0) (ELT |setData| 1)
       (COND ((ELT |rec| |$on_off|) '|on|) ('T '|off|)) '(|on| |off|)
       '|htSetOutputPage2|)))))

; htSetOutputPage2(page, val) ==
;     rec := htpProperty(page, 'output_rec)
;     rec.$on_off := translateYesNo2TrueFalse(val)
;     rec.$on_off =>
;         setData := htpProperty(page, 'setData)
;         branch := first(setData)
;         phrase := CONCAT('"where ", STRINGIMAGE(branch),
;                     '" printing goes (enter {\em console} or a pathname)?")
;         checker := 'chkOutputFileName
;         htpSetProperty(page, 'checker, checker)
;         htShowFunctionPageContinued2(page, setData, rec.$file_off,
;                                      checker, phrase,
;                                      'htSetOutputPage3)
;     htKill(page, val)

(DEFUN |htSetOutputPage2| (|page| |val|)
  (PROG (|rec| |setData| |branch| |phrase| |checker|)
    (RETURN
     (PROGN
      (SETQ |rec| (|htpProperty| |page| '|output_rec|))
      (SETF (ELT |rec| |$on_off|) (|translateYesNo2TrueFalse| |val|))
      (COND
       ((ELT |rec| |$on_off|)
        (PROGN
         (SETQ |setData| (|htpProperty| |page| '|setData|))
         (SETQ |branch| (CAR |setData|))
         (SETQ |phrase|
                 (CONCAT "where " (STRINGIMAGE |branch|)
                         " printing goes (enter {\\em console} or a pathname)?"))
         (SETQ |checker| '|chkOutputFileName|)
         (|htpSetProperty| |page| '|checker| |checker|)
         (|htShowFunctionPageContinued2| |page| |setData|
          (ELT |rec| |$file_off|) |checker| |phrase| '|htSetOutputPage3|)))
       ('T (|htKill| |page| |val|)))))))

; htSetOutputPage3(page) ==
;     setData := htpProperty(page, 'setData)
;     checker := htpProperty(page, 'checker)
;     val := htCheck(checker, htpLabelInputString(page, 'value))
;     FUNCALL(setData.setVar, [val])
;     htKill(page, val)

(DEFUN |htSetOutputPage3| (|page|)
  (PROG (|setData| |checker| |val|)
    (RETURN
     (PROGN
      (SETQ |setData| (|htpProperty| |page| '|setData|))
      (SETQ |checker| (|htpProperty| |page| '|checker|))
      (SETQ |val|
              (|htCheck| |checker| (|htpLabelInputString| |page| '|value|)))
      (FUNCALL (ELT |setData| 4) (LIST |val|))
      (|htKill| |page| |val|)))))

; htSetCache(htPage) ==
;   $path := '(cache functions)
;   page := htInitPage(mkSetTitle(), nil)
;   $valueList := nil
;   ht_add_to_page(page, '(
;    (text
;     "Use this system command to cause the FriCAS interpreter to `remember' "
;     "past values of interpreter functions. "
;     "To remember a past value of a function, the interpreter "
;     "sets up a {\em cache} for that function based on argument values. "
;     "When a value is cached for a given argument value, its value is gotten "
;     "from the cache and not recomputed. Caching can often save much "
;     "computing time, particularly with recursive functions or functions that "
;     "are expensive to compute and that are called repeatedly "
;     "with the same argument."
;     "\vspace{1}\newline ")
;    (domainConditions (Satisfies S chkNameList))
;    (text
;       "Enter below a list of interpreter functions you would like specially cached. "
;       "Use the name {\em all} to give a default setting for all "
;       "interpreter functions. "
;       "\vspace{1}\newline "
;       "Enter {\em all} or a list of names (separate names by blanks):")
;    (inputStrings ("" "" 60 "all" names S))
;    (doneButton "Push to enter names" htCacheAddChoice)))
;   htShowPage1(page)

(DEFUN |htSetCache| (|htPage|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |$path| '(|cache| |functions|))
      (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
      (SETQ |$valueList| NIL)
      (|ht_add_to_page| |page|
       '((|text|
          "Use this system command to cause the FriCAS interpreter to `remember' "
          "past values of interpreter functions. "
          "To remember a past value of a function, the interpreter "
          "sets up a {\\em cache} for that function based on argument values. "
          "When a value is cached for a given argument value, its value is gotten "
          "from the cache and not recomputed. Caching can often save much "
          "computing time, particularly with recursive functions or functions that "
          "are expensive to compute and that are called repeatedly "
          "with the same argument." "\\vspace{1}\\newline ")
         (|domainConditions| (|Satisfies| S |chkNameList|))
         (|text|
          "Enter below a list of interpreter functions you would like specially cached. "
          "Use the name {\\em all} to give a default setting for all "
          "interpreter functions. " "\\vspace{1}\\newline "
          "Enter {\\em all} or a list of names (separate names by blanks):")
         (|inputStrings| ("" "" 60 "all" |names| S))
         (|doneButton| "Push to enter names" |htCacheAddChoice|)))
      (|htShowPage1| |page|)))))

; htCacheAddChoice htPage ==
;   names := bcString2WordList htpLabelInputString(htPage,'names)
;   $valueList := [listOfStrings2String names,:$valueList]
;   null names => htCacheAddQuery()
;   null rest names => htCacheOne names
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page,'names,names)
;   ht_add_to_page(page, '(
;     (domainConditions (Satisfies ALLPI chkAllPositiveInteger))
;     (text
;       "For each function, enter below a {\em cache length}, a positive integer. "
;       "This number tells how many past values will "
;       "be cached. "
;       "A cache length of {\em 0} means the function won't be cached. "
;       "To cache all past values, "
;       "enter {\em all}."
;       "\vspace{1}\newline "
;       "For each function name, enter {\em all} or a positive integer:")))
;   for i in 1.. for name in names repeat ht_add_to_page(page, [
;       ['inputStrings,
;         [STRCONC('"Function {\em ", name, '"} will cache"),
;           '"values", 5, 10, htMakeLabel('"c", i), 'ALLPI]]])
;   htMakeDoneButton(page, '"Select to Set Values", 'htCacheSet)
;   htShowPage1(page)

(DEFUN |htCacheAddChoice| (|htPage|)
  (PROG (|names| |page|)
    (RETURN
     (PROGN
      (SETQ |names|
              (|bcString2WordList| (|htpLabelInputString| |htPage| '|names|)))
      (SETQ |$valueList| (CONS (|listOfStrings2String| |names|) |$valueList|))
      (COND ((NULL |names|) (|htCacheAddQuery|))
            ((NULL (CDR |names|)) (|htCacheOne| |names|))
            (#1='T
             (PROGN
              (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
              (|htpSetProperty| |page| '|names| |names|)
              (|ht_add_to_page| |page|
               '((|domainConditions|
                  (|Satisfies| ALLPI |chkAllPositiveInteger|))
                 (|text|
                  "For each function, enter below a {\\em cache length}, a positive integer. "
                  "This number tells how many past values will " "be cached. "
                  "A cache length of {\\em 0} means the function won't be cached. "
                  "To cache all past values, " "enter {\\em all}."
                  "\\vspace{1}\\newline "
                  "For each function name, enter {\\em all} or a positive integer:")))
              ((LAMBDA (|i| |bfVar#18| |name|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#18|)
                        (PROGN (SETQ |name| (CAR |bfVar#18|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (|ht_add_to_page| |page|
                     (LIST
                      (LIST '|inputStrings|
                            (LIST
                             (STRCONC "Function {\\em " |name| "} will cache")
                             "values" 5 10 (|htMakeLabel| "c" |i|) 'ALLPI))))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#18| (CDR |bfVar#18|))))
               1 |names| NIL)
              (|htMakeDoneButton| |page| "Select to Set Values" '|htCacheSet|)
              (|htShowPage1| |page|))))))))

; htMakeLabel(prefix,i) == INTERN STRCONC(prefix,stringize i)

(DEFUN |htMakeLabel| (|prefix| |i|)
  (PROG () (RETURN (INTERN (STRCONC |prefix| (|stringize| |i|))))))

; htCacheSet htPage ==
;   names := htpProperty(htPage,'names)
;   for i in 1.. for name in names repeat
;     num := chkAllNonNegativeInteger
;              htpLabelInputString(htPage,htMakeLabel('"c",i))
;     $cacheAlist := assoc_add(INTERN(name), num, $cacheAlist)
;   if (n := LASSOC('all,$cacheAlist)) then
;     $cacheCount := n
;     $cacheAlist := deleteAssoc('all,$cacheAlist)
;   page := htInitPage('"Cache Summary", nil)
;   ht_add_string(page, '"In general, interpreter functions ")
;   if $cacheCount = 0 then
;       ht_add_string(page, '"will {\em not} be cached.")
;   else
;       ht_add_string(page, '"cache ");
;       htAllOrNum(page, $cacheCount);
;       ht_add_string(page, '"} values.")
;   ht_add_string(page, '"\vspace{1}\newline ")
;   if $cacheAlist then
;       for [name, :val] in $cacheAlist | val ~= $cacheCount repeat
;           ht_add_strings(page, ['"\newline function {\em ", stringize(name),
;                                 '"} will cache "])
;           htAllOrNum(page, val)
;           ht_add_string(page, '"} values")
;   htShowPage1(page)

(DEFUN |htCacheSet| (|htPage|)
  (PROG (|names| |num| |n| |page| |name| |val|)
    (RETURN
     (PROGN
      (SETQ |names| (|htpProperty| |htPage| '|names|))
      ((LAMBDA (|i| |bfVar#19| |name|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#19|) (PROGN (SETQ |name| (CAR |bfVar#19|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |num|
                     (|chkAllNonNegativeInteger|
                      (|htpLabelInputString| |htPage|
                       (|htMakeLabel| "c" |i|))))
             (SETQ |$cacheAlist|
                     (|assoc_add| (INTERN |name|) |num| |$cacheAlist|)))))
          (SETQ |i| (+ |i| 1))
          (SETQ |bfVar#19| (CDR |bfVar#19|))))
       1 |names| NIL)
      (COND
       ((SETQ |n| (LASSOC '|all| |$cacheAlist|)) (SETQ |$cacheCount| |n|)
        (SETQ |$cacheAlist| (|deleteAssoc| '|all| |$cacheAlist|))))
      (SETQ |page| (|htInitPage| "Cache Summary" NIL))
      (|ht_add_string| |page| "In general, interpreter functions ")
      (COND
       ((EQL |$cacheCount| 0)
        (|ht_add_string| |page| "will {\\em not} be cached."))
       (#1# (|ht_add_string| |page| "cache ")))
      (|htAllOrNum| |page| |$cacheCount|)
      (|ht_add_string| |page| "} values.")
      (|ht_add_string| |page| "\\vspace{1}\\newline ")
      (COND
       (|$cacheAlist|
        ((LAMBDA (|bfVar#21| |bfVar#20|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#21|)
                  (PROGN (SETQ |bfVar#20| (CAR |bfVar#21|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#20|)
                   (PROGN
                    (SETQ |name| (CAR |bfVar#20|))
                    (SETQ |val| (CDR |bfVar#20|))
                    #1#)
                   (NOT (EQUAL |val| |$cacheCount|))
                   (PROGN
                    (|ht_add_strings| |page|
                     (LIST "\\newline function {\\em " (|stringize| |name|)
                           "} will cache "))
                    (|htAllOrNum| |page| |val|)
                    (|ht_add_string| |page| "} values")))))
            (SETQ |bfVar#21| (CDR |bfVar#21|))))
         |$cacheAlist| NIL)))
      (|htShowPage1| |page|)))))

; htAllOrNum(page, val) ==
;     str :=
;         val = 'all => '"{\em all"
;         val = 0 => '"{\em no"
;         STRCONC('"the last {\em ",stringize val)
;     ht_add_string(page, str)

(DEFUN |htAllOrNum| (|page| |val|)
  (PROG (|str|)
    (RETURN
     (PROGN
      (SETQ |str|
              (COND ((EQ |val| '|all|) "{\\em all") ((EQL |val| 0) "{\\em no")
                    ('T (STRCONC "the last {\\em " (|stringize| |val|)))))
      (|ht_add_string| |page| |str|)))))

; htCacheOne names ==
;   page := htInitPage(mkSetTitle(),nil)
;   htpSetProperty(page,'names,names)
;   ht_add_to_page(page, '(
;     (domainConditions (Satisfies ALLPI chkAllPositiveInteger))
;     (text
;       "Enter below a {\em cache length}, a positive integer. "
;       "This number tells how many past values will "
;       "be cached. To cache all past values, "
;       "enter {\em all}."
;       "\vspace{1}\newline ")
;     (inputStrings
;       ("Enter {\em all} or a positive integer:"
;        "" 5 10 c1 ALLPI))))
;   htMakeDoneButton(page, '"Select to Set Value", 'htCacheSet)
;   htShowPage1(page)

(DEFUN |htCacheOne| (|names|)
  (PROG (|page|)
    (RETURN
     (PROGN
      (SETQ |page| (|htInitPage| (|mkSetTitle|) NIL))
      (|htpSetProperty| |page| '|names| |names|)
      (|ht_add_to_page| |page|
       '((|domainConditions| (|Satisfies| ALLPI |chkAllPositiveInteger|))
         (|text| "Enter below a {\\em cache length}, a positive integer. "
          "This number tells how many past values will "
          "be cached. To cache all past values, " "enter {\\em all}."
          "\\vspace{1}\\newline ")
         (|inputStrings|
          ("Enter {\\em all} or a positive integer:" "" 5 10 |c1| ALLPI))))
      (|htMakeDoneButton| |page| "Select to Set Value" '|htCacheSet|)
      (|htShowPage1| |page|)))))
