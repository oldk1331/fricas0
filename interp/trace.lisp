
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $fromSpadTrace := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$fromSpadTrace| NIL))

; $mapSubNameAlist := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$mapSubNameAlist| NIL))

; $mathTrace := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$mathTrace| NIL))

; $mathTraceList := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$mathTraceList| NIL))

; $tracedSpadModemap := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$tracedSpadModemap| NIL))

; $traceletFunctions := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$traceletFunctions| NIL))

; $letAssoc := []

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$letAssoc| NIL))

; DEFPARAMETER($traceNoisely, NIL)  -- give trace and untrace messages

(DEFPARAMETER |$traceNoisely| NIL)

; DEFVAR($traceDomains, true)

(DEFVAR |$traceDomains| T)

; DEFPARAMETER($reportSpadTrace, NIL)  -- reports traced funs

(DEFPARAMETER |$reportSpadTrace| NIL)

; DEFPARAMETER($optionAlist, NIL)

(DEFPARAMETER |$optionAlist| NIL)

; DEFPARAMETER($tracedMapSignatures, NIL)

(DEFPARAMETER |$tracedMapSignatures| NIL)

; DEFPARAMETER($traceOptionList, '(
;     after _
;     before _
;     break_
;     cond_
;     count_
;     depth_
;     local_
;     mathprint _
;     nonquietly_
;     nt_
;     of_
;     only_
;     ops_
;     restore_
;     timer_
;     varbreak _
;     vars_
;     within _
;     ))

(DEFPARAMETER |$traceOptionList|
  '(|after| |before| |break| |cond| |count| |depth| |local| |mathprint|
    |nonquietly| |nt| OF |only| |ops| |restore| |timer| |varbreak| |vars|
    |within|))

; DEFPARAMETER($domainTraceNameAssoc, NIL)

(DEFPARAMETER |$domainTraceNameAssoc| NIL)

; DEFPARAMETER($lastUntraced, NIL)

(DEFPARAMETER |$lastUntraced| NIL)

; DEFVAR($trace_names, [])

(DEFVAR |$trace_names| NIL)

; DEFVAR($count_list, [])

(DEFVAR |$count_list| NIL)

; DEFVAR($timer_list, [])

(DEFVAR |$timer_list| NIL)

; MAKEPROP('coerce, "/TRANSFORM", ["&", "&", "*"])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP '|coerce| '/TRANSFORM (LIST '& '& '*)))))

; MAKEPROP('comp, "/TRANSFORM", ["&", "*", "*", "&"])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP '|comp| '/TRANSFORM (LIST '& '* '* '&)))))

; MAKEPROP('compIf, "/TRANSFORM", ["&", "*", "*", "&"])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG () (RETURN (MAKEPROP '|compIf| '/TRANSFORM (LIST '& '* '* '&)))))

; MAKEPROP('compFormWithModemap, "/TRANSFORM", ["&", "*", "*", "&", "*"])

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|compFormWithModemap| '/TRANSFORM (LIST '& '* '* '& '*)))))

; SPADSYSNAMEP(s) ==
;     n := MAXINDEX(s)
;     k := charPosition('".".0, s, 1)
;     k > n => false
;     k := charPosition('",".0, s, k + 1)
;     k > n => false
;     res := true
;     for i in (k + 1)..n while res repeat
;         res := char_to_digit(s.i) and res
;     res

(DEFUN SPADSYSNAMEP (|s|)
  (PROG (|n| |k| |res|)
    (RETURN
     (PROGN
      (SETQ |n| (MAXINDEX |s|))
      (SETQ |k| (|charPosition| (ELT "." 0) |s| 1))
      (COND ((< |n| |k|) NIL)
            (#1='T
             (PROGN
              (SETQ |k| (|charPosition| (ELT "," 0) |s| (+ |k| 1)))
              (COND ((< |n| |k|) NIL)
                    (#1#
                     (PROGN
                      (SETQ |res| T)
                      ((LAMBDA (|i|)
                         (LOOP
                          (COND ((OR (> |i| |n|) (NOT |res|)) (RETURN NIL))
                                (#1#
                                 (SETQ |res|
                                         (AND (|char_to_digit| (ELT |s| |i|))
                                              |res|))))
                          (SETQ |i| (+ |i| 1))))
                       (+ |k| 1))
                      |res|))))))))))

; IS_GENVAR(x) ==
;     IDENTP(x) and (y := PNAME(x); #y > 1 and '"$".0 = y.0 and
;                    char_to_digit(y.1))

(DEFUN IS_GENVAR (|x|)
  (PROG (|y|)
    (RETURN
     (AND (IDENTP |x|)
          (PROGN
           (SETQ |y| (PNAME |x|))
           (AND (< 1 (LENGTH |y|)) (EQUAL (ELT "$" 0) (ELT |y| 0))
                (|char_to_digit| (ELT |y| 1))))))))

; trace l == traceSpad2Cmd l

(DEFUN |trace| (|l|) (PROG () (RETURN (|traceSpad2Cmd| |l|))))

; traceSpad2Cmd l ==
;   if l is ['Tuple, l1] then l := l1
;   $mapSubNameAlist:= getMapSubNames(l)
;   trace1(augmentTraceNames(l, $mapSubNameAlist), $options)
;   traceReply()

(DEFUN |traceSpad2Cmd| (|l|)
  (PROG (|ISTMP#1| |l1|)
    (RETURN
     (PROGN
      (COND
       ((AND (CONSP |l|) (EQ (CAR |l|) '|Tuple|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |l|))
              (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                   (PROGN (SETQ |l1| (CAR |ISTMP#1|)) 'T))))
        (SETQ |l| |l1|)))
      (SETQ |$mapSubNameAlist| (|getMapSubNames| |l|))
      (|trace1| (|augmentTraceNames| |l| |$mapSubNameAlist|) |$options|)
      (|traceReply|)))))

; trace1(l, options) ==
;   $traceNoisely: local := NIL
;   if hasOption(options, 'nonquietly) then $traceNoisely := true
;   hasOption(options, 'off) =>
;     (ops := hasOption(options, 'ops)) or
;       (lops := hasOption(options, 'local)) =>
;         null(l) => throw_msg("S2IT0019", CONCAT(
;             '"If you use the %b )off %d option for %b )trace %d and",
;             '" you also use the %b )local %d or %b )ops %d option,",
;             '" you must specify the name of a constructor.",
;             '" You have not done so."), [])
;         constructor := unabbrev
;           atom l => l
;           null rest l =>
;             atom first l => first l
;             first first l
;           NIL
;         not(isFunctor constructor) => throw_msg("S2IT0020", CONCAT(
;             '"If you use the %b )off %d option for %b )trace %d and you",
;             '" also use the %b )local %d or %b )ops %d option, you must",
;             '" specify the name of a constructor.  What you gave after",
;             '" %b )trace %d is not a valid constructor name."), [])
;         if ops then
;           ops := getTraceOption ops
;           NIL
;         if lops then
;           lops := rest getTraceOption lops
;           untraceDomainLocalOps(constructor,lops)
;     (1 < #options) and not hasOption(options, 'nonquietly) =>
;         throw_msg("S2IT0021", CONCAT(
;             '"If you use the %b )off %d option for %b )trace %d then",
;             '" the only other options you can use are %b )nonquietly,",
;             '" )ops %d and %b )local. %d"), [])
;     untrace l
;     clearConstructorCaches()
;   hasOption(options, 'stats) =>
;     (1 < #options) =>
;         throw_msg("S2IT0001", '"%1b can have no other options.",
;                   ['")trace ... )stats"])
;     [., :opt] := first options
;     -- look for )trace )stats       to list the statistics
;     --          )trace )stats reset to reset them
;     null opt =>      -- list the statistics
;       centerAndHighlight('"Traced function execution times",78,"-")
;       ptimers ()
;       SAY '" "
;       centerAndHighlight('"Traced function execution counts",78,"-")
;       pcounters ()
;     selectOption(first opt, '(reset), 'optionError)
;     resetTimers()
;     resetCounters()
;     throw_msg("S2IT0002", CONCAT(
;         '"Trace facility timers, space counts and execution counts have",
;         '" been reset."), [])
;   a:= hasOption(options, 'restore) =>
;     null(oldL:= $lastUntraced) => nil
;     newOptions := delete(a, options)
;     null l => trace1(oldL, options)
;     for x in l repeat
;       x is [domain,:opList] and VECP domain =>
;           say_msg("S2IT0003", '"Please retrace the domain %1b.",
;                   [devaluate(domain)])
;       options := [:newOptions, :LASSOC(x, $optionAlist)]
;       trace1(LIST x, options)
;   null l => nil
;   l is ["?"] => _?t()
;   traceList:= [transTraceItem x for x in l] or return nil
;   for x in traceList repeat $optionAlist:=
;       assoc_add(x, options, $optionAlist)
;   optionList:= getTraceOptions(options)
;   if (domainList := LASSOC("of", optionList)) then
;       LASSOC("ops", optionList) => throw_msg("S2IT0004",
;           '"%b )ops %d and %b )of %d cannot both be options to %b )trace %d",
;           [])
;       opList:=
;         traceList => [["ops", :traceList]]
;         nil
;       varList:=
;         y:= LASSOC("vars", optionList) => [["vars", :y]]
;         nil
;       optionList := [:opList, :varList]
;       traceList := domainList
;   for funName in traceList repeat
;       trace2(funName, [], optionList)
;   saveMapSig(traceList)

(DEFUN |trace1| (|l| |options|)
  (PROG (|$traceNoisely| |varList| |y| |domainList| |optionList| |traceList|
         |opList| |domain| |newOptions| |oldL| |a| |opt| |LETTMP#1|
         |constructor| |lops| |ops|)
    (DECLARE (SPECIAL |$traceNoisely|))
    (RETURN
     (PROGN
      (SETQ |$traceNoisely| NIL)
      (COND ((|hasOption| |options| '|nonquietly|) (SETQ |$traceNoisely| T)))
      (COND
       ((|hasOption| |options| '|off|)
        (COND
         ((OR (SETQ |ops| (|hasOption| |options| '|ops|))
              (SETQ |lops| (|hasOption| |options| '|local|)))
          (COND
           ((NULL |l|)
            (|throw_msg| 'S2IT0019
             (CONCAT "If you use the %b )off %d option for %b )trace %d and"
                     " you also use the %b )local %d or %b )ops %d option,"
                     " you must specify the name of a constructor."
                     " You have not done so.")
             NIL))
           (#1='T
            (PROGN
             (SETQ |constructor|
                     (|unabbrev|
                      (COND ((ATOM |l|) |l|)
                            ((NULL (CDR |l|))
                             (COND ((ATOM (CAR |l|)) (CAR |l|))
                                   (#1# (CAR (CAR |l|)))))
                            (#1# NIL))))
             (COND
              ((NULL (|isFunctor| |constructor|))
               (|throw_msg| 'S2IT0020
                (CONCAT
                 "If you use the %b )off %d option for %b )trace %d and you"
                 " also use the %b )local %d or %b )ops %d option, you must"
                 " specify the name of a constructor.  What you gave after"
                 " %b )trace %d is not a valid constructor name.")
                NIL))
              (#1#
               (PROGN
                (COND (|ops| (SETQ |ops| (|getTraceOption| |ops|)) NIL))
                (COND
                 (|lops| (SETQ |lops| (CDR (|getTraceOption| |lops|)))
                  (|untraceDomainLocalOps| |constructor| |lops|))))))))))
         ((AND (< 1 (LENGTH |options|))
               (NULL (|hasOption| |options| '|nonquietly|)))
          (|throw_msg| 'S2IT0021
           (CONCAT "If you use the %b )off %d option for %b )trace %d then"
                   " the only other options you can use are %b )nonquietly,"
                   " )ops %d and %b )local. %d")
           NIL))
         (#1# (PROGN (|untrace| |l|) (|clearConstructorCaches|)))))
       ((|hasOption| |options| '|stats|)
        (COND
         ((< 1 (LENGTH |options|))
          (|throw_msg| 'S2IT0001 "%1b can have no other options."
           (LIST ")trace ... )stats")))
         (#1#
          (PROGN
           (SETQ |LETTMP#1| (CAR |options|))
           (SETQ |opt| (CDR |LETTMP#1|))
           (COND
            ((NULL |opt|)
             (PROGN
              (|centerAndHighlight| "Traced function execution times" 78 '-)
              (|ptimers|)
              (SAY " ")
              (|centerAndHighlight| "Traced function execution counts" 78 '-)
              (|pcounters|)))
            (#1#
             (PROGN
              (|selectOption| (CAR |opt|) '(|reset|) '|optionError|)
              (|resetTimers|)
              (|resetCounters|)
              (|throw_msg| 'S2IT0002
               (CONCAT
                "Trace facility timers, space counts and execution counts have"
                " been reset.")
               NIL))))))))
       ((SETQ |a| (|hasOption| |options| '|restore|))
        (COND ((NULL (SETQ |oldL| |$lastUntraced|)) NIL)
              (#1#
               (PROGN
                (SETQ |newOptions| (|delete| |a| |options|))
                (COND ((NULL |l|) (|trace1| |oldL| |options|))
                      (#1#
                       ((LAMBDA (|bfVar#1| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#1|)
                                 (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                             (RETURN NIL))
                            (#1#
                             (COND
                              ((AND (CONSP |x|)
                                    (PROGN
                                     (SETQ |domain| (CAR |x|))
                                     (SETQ |opList| (CDR |x|))
                                     #1#)
                                    (VECP |domain|))
                               (|say_msg| 'S2IT0003
                                "Please retrace the domain %1b."
                                (LIST (|devaluate| |domain|))))
                              (#1#
                               (PROGN
                                (SETQ |options|
                                        (APPEND |newOptions|
                                                (LASSOC |x| |$optionAlist|)))
                                (|trace1| (LIST |x|) |options|))))))
                           (SETQ |bfVar#1| (CDR |bfVar#1|))))
                        |l| NIL)))))))
       ((NULL |l|) NIL)
       ((AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '?)) (|?t|))
       (#1#
        (PROGN
         (SETQ |traceList|
                 (OR
                  ((LAMBDA (|bfVar#3| |bfVar#2| |x|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#2|)
                            (PROGN (SETQ |x| (CAR |bfVar#2|)) NIL))
                        (RETURN (NREVERSE |bfVar#3|)))
                       (#1#
                        (SETQ |bfVar#3|
                                (CONS (|transTraceItem| |x|) |bfVar#3|))))
                      (SETQ |bfVar#2| (CDR |bfVar#2|))))
                   NIL |l| NIL)
                  (RETURN NIL)))
         ((LAMBDA (|bfVar#4| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#4|) (PROGN (SETQ |x| (CAR |bfVar#4|)) NIL))
               (RETURN NIL))
              (#1#
               (SETQ |$optionAlist|
                       (|assoc_add| |x| |options| |$optionAlist|))))
             (SETQ |bfVar#4| (CDR |bfVar#4|))))
          |traceList| NIL)
         (SETQ |optionList| (|getTraceOptions| |options|))
         (COND
          ((SETQ |domainList| (LASSOC '|of| |optionList|))
           (COND
            ((LASSOC '|ops| |optionList|)
             (|throw_msg| 'S2IT0004
              "%b )ops %d and %b )of %d cannot both be options to %b )trace %d"
              NIL))
            (#1#
             (PROGN
              (SETQ |opList|
                      (COND (|traceList| (LIST (CONS '|ops| |traceList|)))
                            (#1# NIL)))
              (SETQ |varList|
                      (COND
                       ((SETQ |y| (LASSOC '|vars| |optionList|))
                        (LIST (CONS '|vars| |y|)))
                       (#1# NIL)))
              (SETQ |optionList| (APPEND |opList| |varList|))
              (SETQ |traceList| |domainList|))))))
         ((LAMBDA (|bfVar#5| |funName|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#5|)
                   (PROGN (SETQ |funName| (CAR |bfVar#5|)) NIL))
               (RETURN NIL))
              (#1# (|trace2| |funName| NIL |optionList|)))
             (SETQ |bfVar#5| (CDR |bfVar#5|))))
          |traceList| NIL)
         (|saveMapSig| |traceList|))))))))

; get_trace_option(l, opt) ==
;     res := nil
;     for el in l repeat
;         if EQ(IFCAR(el), opt) then
;             res := el
;     res

(DEFUN |get_trace_option| (|l| |opt|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#6| |el|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#6|) (PROGN (SETQ |el| (CAR |bfVar#6|)) NIL))
            (RETURN NIL))
           ('T (COND ((EQ (IFCAR |el|) |opt|) (SETQ |res| |el|)))))
          (SETQ |bfVar#6| (CDR |bfVar#6|))))
       |l| NIL)
      |res|))))

; COND_UCASE(X) ==
;     INTEGERP(X) => X
;     UPCASE(X)

(DEFUN COND_UCASE (X)
  (PROG () (RETURN (COND ((INTEGERP X) X) ('T (UPCASE X))))))

; OPTIONS2UC1(el) ==
;     ATOM(el) => spadThrowBrightly(
;         FORMAT(nil, '"~A has wrong format for an option", el))
;     CONS(UPCASE(first(el)), rest(el))

(DEFUN OPTIONS2UC1 (|el|)
  (PROG ()
    (RETURN
     (COND
      ((ATOM |el|)
       (|spadThrowBrightly|
        (FORMAT NIL "~A has wrong format for an option" |el|)))
      ('T (CONS (UPCASE (CAR |el|)) (CDR |el|)))))))

; OPTIONS2UC(l) ==
;     [OPTIONS2UC1(el) for el in l]

(DEFUN OPTIONS2UC (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#8| |bfVar#7| |el|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#7|) (PROGN (SETQ |el| (CAR |bfVar#7|)) NIL))
           (RETURN (NREVERSE |bfVar#8|)))
          ('T (SETQ |bfVar#8| (CONS (OPTIONS2UC1 |el|) |bfVar#8|))))
         (SETQ |bfVar#7| (CDR |bfVar#7|))))
      NIL |l| NIL))))

; VARP(test_item) ==
;     IDENTP(test_item) => test_item
;     CONSP(test_item) and
;         (EQ(first(test_item), 'FLUID) or EQ(first(test_item), 'LEX)) and
;       CONSP(rest(test_item)) and IDENTP(first(rest(test_item))) => test_item
;     false

(DEFUN VARP (|test_item|)
  (PROG ()
    (RETURN
     (COND ((IDENTP |test_item|) |test_item|)
           ((AND (CONSP |test_item|)
                 (OR (EQ (CAR |test_item|) 'FLUID) (EQ (CAR |test_item|) 'LEX))
                 (CONSP (CDR |test_item|)) (IDENTP (CAR (CDR |test_item|))))
            |test_item|)
           ('T NIL)))))

; flat_bv_list(bv_list) ==
;     VARP(bv_list) => [bv_list]
;     REFVECP(bv_list) => BREAK()
;     NOT(CONSP(bv_list)) => []
;     EQ("=", (tmp1 := first(bv_list))) => flat_bv_list(rest(bv_list))
;     VARP(tmp1) => [tmp1, :flat_bv_list(rest(bv_list))]
;     NOT(CONSP(tmp1)) and NOT(REFVECP(tmp1)) =>
;         flat_bv_list(rest(bv_list))
;     NCONC(flat_bv_list(tmp1), flat_bv_list(rest(bv_list)))

(DEFUN |flat_bv_list| (|bv_list|)
  (PROG (|tmp1|)
    (RETURN
     (COND ((VARP |bv_list|) (LIST |bv_list|)) ((REFVECP |bv_list|) (BREAK))
           ((NULL (CONSP |bv_list|)) NIL)
           ((EQ '= (SETQ |tmp1| (CAR |bv_list|)))
            (|flat_bv_list| (CDR |bv_list|)))
           ((VARP |tmp1|) (CONS |tmp1| (|flat_bv_list| (CDR |bv_list|))))
           ((AND (NULL (CONSP |tmp1|)) (NULL (REFVECP |tmp1|)))
            (|flat_bv_list| (CDR |bv_list|)))
           ('T
            (NCONC (|flat_bv_list| |tmp1|)
                   (|flat_bv_list| (CDR |bv_list|))))))))

; DEFVAR($embedded_functions, [])

(DEFVAR |$embedded_functions| NIL)

; embeded_function(name, new_def, old_def) ==
;     new_def :=
;         NOT(CONSP(new_def)) => new_def
;         body := IFCDR(IFCDR(new_def))
;         op := first(new_def)
;         body and (bv := first(rest(new_def)))
;           and (EQ(op, 'LAMBDA) or EQ(op, 'MLAMBDA)) =>
;             NOT(MEMQ(name, flat_bv_list(bv))) =>
;                 [op, bv, [['LAMBDA, [name], :body],
;                           ['QUOTE, old_def]]]
;             new_def
;         BREAK()
;     COERCE(new_def, 'FUNCTION)

(DEFUN |embeded_function| (|name| |new_def| |old_def|)
  (PROG (|body| |op| |bv|)
    (RETURN
     (PROGN
      (SETQ |new_def|
              (COND ((NULL (CONSP |new_def|)) |new_def|)
                    (#1='T
                     (PROGN
                      (SETQ |body| (IFCDR (IFCDR |new_def|)))
                      (SETQ |op| (CAR |new_def|))
                      (COND
                       ((AND |body| (SETQ |bv| (CAR (CDR |new_def|)))
                             (OR (EQ |op| 'LAMBDA) (EQ |op| 'MLAMBDA)))
                        (COND
                         ((NULL (MEMQ |name| (|flat_bv_list| |bv|)))
                          (LIST |op| |bv|
                                (LIST
                                 (CONS 'LAMBDA (CONS (LIST |name|) |body|))
                                 (LIST 'QUOTE |old_def|))))
                         (#1# |new_def|)))
                       (#1# (BREAK)))))))
      (COERCE |new_def| 'FUNCTION)))))

; embed2(name, new_def, old_def) ==
;     setSf(name, new_def)
;     PUSH([name, new_def, old_def], $embedded_functions)
;     name

(DEFUN |embed2| (|name| |new_def| |old_def|)
  (PROG ()
    (RETURN
     (PROGN
      (|setSf| |name| |new_def|)
      (PUSH (LIST |name| |new_def| |old_def|) |$embedded_functions|)
      |name|))))

; EMBED(name, new_def) ==
;     if NOT(IDENTP(name)) then
;         ERROR(FORMAT(nil, '"invalid argument ~s to EMBED", name))
;     old_def := SYMBOL_-FUNCTION(name)
;     new_def := embeded_function(name, new_def, old_def)
;     embed2(name, new_def, old_def)

(DEFUN EMBED (|name| |new_def|)
  (PROG (|old_def|)
    (RETURN
     (PROGN
      (COND
       ((NULL (IDENTP |name|))
        (ERROR (FORMAT NIL "invalid argument ~s to EMBED" |name|))))
      (SETQ |old_def| (SYMBOL-FUNCTION |name|))
      (SETQ |new_def| (|embeded_function| |name| |new_def| |old_def|))
      (|embed2| |name| |new_def| |old_def|)))))

; UNEMBED(name) ==
;     tmp := []
;     e_list := $embedded_functions
;     cur_def := SYMBOL_-FUNCTION(name)
;     flag := true
;     e_head := []
;     while flag repeat
;         NULL(e_list) => flag := false
;         e_head := first(e_list)
;         CONSP(e_head) and CONSP(rest(e_head)) and
;           EQ(name, first(e_head)) and EQ(cur_def, e_head.1) =>
;             flag := false
;         tmp := e_list
;         e_list := rest(e_list)
;     e_head =>
;         setSf(name, e_head.2)
;         if NOT(NULL(tmp)) then
;             RPLACD(tmp, rest(e_list))
;         else
;             $embedded_functions := rest(e_list)
;         name
;     false

(DEFUN UNEMBED (|name|)
  (PROG (|tmp| |e_list| |cur_def| |flag| |e_head|)
    (RETURN
     (PROGN
      (SETQ |tmp| NIL)
      (SETQ |e_list| |$embedded_functions|)
      (SETQ |cur_def| (SYMBOL-FUNCTION |name|))
      (SETQ |flag| T)
      (SETQ |e_head| NIL)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |flag|) (RETURN NIL))
                (#1='T
                 (COND ((NULL |e_list|) (SETQ |flag| NIL))
                       (#1#
                        (PROGN
                         (SETQ |e_head| (CAR |e_list|))
                         (COND
                          ((AND (CONSP |e_head|) (CONSP (CDR |e_head|))
                                (EQ |name| (CAR |e_head|))
                                (EQ |cur_def| (ELT |e_head| 1)))
                           (SETQ |flag| NIL))
                          (#1#
                           (PROGN
                            (SETQ |tmp| |e_list|)
                            (SETQ |e_list| (CDR |e_list|)))))))))))))
      (COND
       (|e_head|
        (PROGN
         (|setSf| |name| (ELT |e_head| 2))
         (COND ((NULL (NULL |tmp|)) (RPLACD |tmp| (CDR |e_list|)))
               (#1# (SETQ |$embedded_functions| (CDR |e_list|))))
         |name|))
       (#1# NIL))))))

; trace3(fn, modemap, options, bin_def) ==
;     if MEMQ(fn, $trace_names) then untrace2(fn, [])
;     options := OPTIONS2UC(options)
;     $traceDomains and isFunctor(fn) and ATOM(fn) =>
;         traceDomainConstructor(fn, options)
;     math_trace := get_trace_option(options, 'MATHPRINT)
;     if math_trace and NOT(EQL(ELT(PNAME(fn), 0), char('_$)))
;                and NOT(GENSYMP(fn)) then
;         if RASSOC(fn, $mapSubNameAlist) then
;             $mathTraceList := [fn, :$mathTraceList]
;         else
;             spadThrowBrightly(
;               FORMAT(nil, '"mathprint not available for ~A", fn))
;     vars := get_trace_option(options, 'VARS)
;     if vars then
;         vars :=
;             NOT(rest(vars)) => 'ALL
;             rest(vars)
;         tracelet(fn, bin_def, vars)
;     BREAK := get_trace_option(options, 'BREAK)
;     VARBREAK := get_trace_option(options, 'VARBREAK)
;     if VARBREAK then
;         vars :=
;             NOT(rest(VARBREAK)) => 'ALL
;             rest(VARBREAK)
;         breaklet(fn, bin_def, vars)
;     not(bin_def) and SYMBOLP(fn) and NOT(BOUNDP(fn)) and NOT(FBOUNDP(fn)) =>
;       isUncompiledMap(fn) =>
;           sayBrightly(FORMAT(nil,
;         '"~A must be compiled before it may be traced -- invoke ~A to compile",
;                                             fn, fn))
;       isInterpOnlyMap(fn) =>
;           sayBrightly(FORMAT(nil,
;         '"~A cannot be traced because it is an interpret-only function", fn))
;       sayBrightly(FORMAT(nil, '"~A is not a function", fn))
;     not(bin_def) and SYMBOLP(fn) and BOUNDP(fn)
;       and isDomainOrPackage(FNVAL := EVAL(fn)) =>
;         spadTrace(FNVAL, options)
;     if (U := get_trace_option(options, "MASK=")) then
;         MAKEPROP(fn, '_/TRANSFORM, U.1)
;     $trace_names :=
;         get_trace_option(options, 'ALIAS) => $trace_names
;         [fn, :$trace_names]
;     TRACENAME :=
;         (U := get_trace_option(options, 'ALIAS)) => STRINGIMAGE(U.1)
;         if $traceNoisely and NOT(vars) and
;            NOT(isSubForRedundantMapName(fn)) then
;             sayBrightly(["%b", rassocSub(fn, $mapSubNameAlist),
;                          "%d", '"traced"])
;         STRINGIMAGE(fn)
;     if $fromSpadTrace then
;         if math_trace then PUSH(INTERN(TRACENAME), $mathTraceList)
;         LETFUNCODE := ["EQ", nil, nil] --  No-op
;         BEFORE :=
;             (U := get_trace_option(options, 'BEFORE)) =>
;                 ["PROGN", U.1, LETFUNCODE]
;             LETFUNCODE
;     else
;         BEFORE :=
;             (U := get_trace_option(options, 'BEFORE)) => U.1
;             []
;     AFTER :=
;         (U := get_trace_option(options, 'AFTER)) => U.1
;         []
;     caller := get_trace_option(options, 'CALLER)
;     FROM_CONDITION :=
;         (U := get_trace_option(options, 'FROM)) =>
;             ["EQ", "#9", ["QUOTE", U.1]]
;         true
;     CONDITION :=
;         (U := get_trace_option(options, 'WHEN)) => U.1
;         true
;     WITHIN_CONDITION := true
;     if (U := get_trace_option(options, 'WITHIN)) then
;         G := INTERN(STRCONC(PNAME(fn), '"/", PNAME(U.1)))
;         SET(G, 0)
;         trace2(U.1, [], [['WHEN, false],
;                    ['BEFORE, ["SETQ", G, ["1+", G]]],
;                     ['AFTER, ["SETQ", G, ["1-", G]]]])
;         WITHIN_CONDITION := [">", G, 0]
;     if get_trace_option(options, 'COUNT) then
;         COUNTNAM := INTERN(STRCONC(TRACENAME, ",COUNT"))
;     COUNT_CONDITION :=
;         (U := get_trace_option(options, 'COUNT)) =>
;             $count_list := adjoin_equal(TRACENAME, $count_list)
;             rest(U) and INTEGERP(U.1) =>
;                 ["COND", [["<=", COUNTNAM, U.1], true],
;                          [true, ["untrace2", MKQ(fn), []], false]]
;             true
;         true
;     if get_trace_option(options, 'TIMER) then
;         TIMERNAM := INTERN(STRCONC(TRACENAME, '",TIMER"))
;         $timer_list := adjoin_equal(TRACENAME, $timer_list)
;     DEPTH_CONDITION :=
;         (U := get_trace_option(options, 'DEPTH)) =>
;             rest(U) and INTEGERP(U.1) => ["<=", "$monitor_fun_depth", U.1]
;             TRACE_OPTION_ERROR('DEPTH)
;         true
;     CONDITION := MKPF([CONDITION, WITHIN_CONDITION, FROM_CONDITION,
;                        COUNT_CONDITION, DEPTH_CONDITION], 'AND)
;     ONLYS := get_trace_option(options, 'ONLY)
;     -- TRACECODE meaning:
;     --  0:        Caller (0,1)           print caller if 1
;     --  1:        Value (0,1)            print value if 1
;     --  2...:     Arguments (0,...,9)    stop if 0; print ith if i; all if 9
;     TRACECODE :=
;         get_trace_option(options, 'NT) => '"000"
;         ONLYS := MAPCAR(FUNCTION COND_UCASE, ONLYS)
;         F := member('F, ONLYS) or member('FULL, ONLYS)
;         A := F or member('A, ONLYS) or member('ARGS, ONLYS)
;         V := F or member('V, ONLYS) or member('VALUE, ONLYS)
;         C := F or member('C, ONLYS) or member('CALLER, ONLYS)
;         NL :=
;             A => [char('_9)]
;             [FETCHCHAR(STRINGIMAGE(X), 0) for X in ONLYS |
;                 INTEGERP(X) and 0 < X and X < 9]
;         NOT(A or V or C or NL) =>
;             caller =>  '"119"
;             '"019"
;         NL := APPEND(NL, [char('_0)])
;         buf := filler_spaces(A => 3; 2 + #NL)
;         buf.0 :=
;             (C or caller) => char('_1)
;             char('_0)
;         buf.1 := (V => char('_1); char('_0))
;         A =>
;             buf.2 := char('_9)
;             buf
;         for x in NL for i in 2.. repeat
;             buf.i := x
;         buf
;     G4 := MACRO_-FUNCTION(fn)
;     if COUNTNAM then SET(COUNTNAM, 0)
;     if TIMERNAM then SET(TIMERNAM, 0)
;     ll := ['QUOTE, [INTERN(TRACENAME), if G4 then 'MACRO else false, TRACECODE,
;                     COUNTNAM, TIMERNAM, BEFORE, AFTER, CONDITION,
;                        BREAK, modemap, ['QUOTE, true]]]
;     NEW_DEF := [if G4 then 'MLAMBDA else 'LAMBDA, ["&REST", 'G6],
;                 ["monitor_x", 'G6, fn, ll]]
;     bin_def => embeded_function(fn, NEW_DEF, bin_def)
;     OLD_DEF := SYMBOL_-FUNCTION(fn)
;     NEW_DEF := embeded_function(fn, NEW_DEF, OLD_DEF)
;     embed2(fn, NEW_DEF, OLD_DEF)
;     fn

(DEFUN |trace3| (|fn| |modemap| |options| |bin_def|)
  (PROG (|math_trace| |vars| BREAK VARBREAK FNVAL U TRACENAME LETFUNCODE BEFORE
         AFTER |caller| FROM_CONDITION CONDITION WITHIN_CONDITION G COUNTNAM
         COUNT_CONDITION TIMERNAM DEPTH_CONDITION ONLYS F A V C NL |buf|
         TRACECODE G4 |ll| NEW_DEF OLD_DEF)
    (RETURN
     (PROGN
      (COND ((MEMQ |fn| |$trace_names|) (|untrace2| |fn| NIL)))
      (SETQ |options| (OPTIONS2UC |options|))
      (COND
       ((AND |$traceDomains| (|isFunctor| |fn|) (ATOM |fn|))
        (|traceDomainConstructor| |fn| |options|))
       (#1='T
        (PROGN
         (SETQ |math_trace| (|get_trace_option| |options| 'MATHPRINT))
         (COND
          ((AND |math_trace| (NULL (EQL (ELT (PNAME |fn|) 0) (|char| '$)))
                (NULL (GENSYMP |fn|)))
           (COND
            ((RASSOC |fn| |$mapSubNameAlist|)
             (SETQ |$mathTraceList| (CONS |fn| |$mathTraceList|)))
            (#1#
             (|spadThrowBrightly|
              (FORMAT NIL "mathprint not available for ~A" |fn|))))))
         (SETQ |vars| (|get_trace_option| |options| 'VARS))
         (COND
          (|vars|
           (SETQ |vars| (COND ((NULL (CDR |vars|)) 'ALL) (#1# (CDR |vars|))))
           (|tracelet| |fn| |bin_def| |vars|)))
         (SETQ BREAK (|get_trace_option| |options| 'BREAK))
         (SETQ VARBREAK (|get_trace_option| |options| 'VARBREAK))
         (COND
          (VARBREAK
           (SETQ |vars|
                   (COND ((NULL (CDR VARBREAK)) 'ALL) (#1# (CDR VARBREAK))))
           (|breaklet| |fn| |bin_def| |vars|)))
         (COND
          ((AND (NULL |bin_def|) (SYMBOLP |fn|) (NULL (BOUNDP |fn|))
                (NULL (FBOUNDP |fn|)))
           (COND
            ((|isUncompiledMap| |fn|)
             (|sayBrightly|
              (FORMAT NIL
                      "~A must be compiled before it may be traced -- invoke ~A to compile"
                      |fn| |fn|)))
            ((|isInterpOnlyMap| |fn|)
             (|sayBrightly|
              (FORMAT NIL
                      "~A cannot be traced because it is an interpret-only function"
                      |fn|)))
            (#1# (|sayBrightly| (FORMAT NIL "~A is not a function" |fn|)))))
          ((AND (NULL |bin_def|) (SYMBOLP |fn|) (BOUNDP |fn|)
                (|isDomainOrPackage| (SETQ FNVAL (EVAL |fn|))))
           (|spadTrace| FNVAL |options|))
          (#1#
           (PROGN
            (COND
             ((SETQ U (|get_trace_option| |options| 'MASK=))
              (MAKEPROP |fn| '/TRANSFORM (ELT U 1))))
            (SETQ |$trace_names|
                    (COND
                     ((|get_trace_option| |options| 'ALIAS) |$trace_names|)
                     (#1# (CONS |fn| |$trace_names|))))
            (SETQ TRACENAME
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'ALIAS))
                      (STRINGIMAGE (ELT U 1)))
                     (#1#
                      (PROGN
                       (COND
                        ((AND |$traceNoisely| (NULL |vars|)
                              (NULL (|isSubForRedundantMapName| |fn|)))
                         (|sayBrightly|
                          (LIST '|%b| (|rassocSub| |fn| |$mapSubNameAlist|)
                                '|%d| "traced"))))
                       (STRINGIMAGE |fn|)))))
            (COND
             (|$fromSpadTrace|
              (COND (|math_trace| (PUSH (INTERN TRACENAME) |$mathTraceList|)))
              (SETQ LETFUNCODE (LIST 'EQ NIL NIL))
              (SETQ BEFORE
                      (COND
                       ((SETQ U (|get_trace_option| |options| 'BEFORE))
                        (LIST 'PROGN (ELT U 1) LETFUNCODE))
                       (#1# LETFUNCODE))))
             (#1#
              (SETQ BEFORE
                      (COND
                       ((SETQ U (|get_trace_option| |options| 'BEFORE))
                        (ELT U 1))
                       (#1# NIL)))))
            (SETQ AFTER
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'AFTER)) (ELT U 1))
                     (#1# NIL)))
            (SETQ |caller| (|get_trace_option| |options| 'CALLER))
            (SETQ FROM_CONDITION
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'FROM))
                      (LIST 'EQ '|#9| (LIST 'QUOTE (ELT U 1))))
                     (#1# T)))
            (SETQ CONDITION
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'WHEN)) (ELT U 1))
                     (#1# T)))
            (SETQ WITHIN_CONDITION T)
            (COND
             ((SETQ U (|get_trace_option| |options| 'WITHIN))
              (SETQ G (INTERN (STRCONC (PNAME |fn|) "/" (PNAME (ELT U 1)))))
              (SET G 0)
              (|trace2| (ELT U 1) NIL
               (LIST (LIST 'WHEN NIL)
                     (LIST 'BEFORE (LIST 'SETQ G (LIST '1+ G)))
                     (LIST 'AFTER (LIST 'SETQ G (LIST '1- G)))))
              (SETQ WITHIN_CONDITION (LIST '> G 0))))
            (COND
             ((|get_trace_option| |options| 'COUNT)
              (SETQ COUNTNAM (INTERN (STRCONC TRACENAME '|,COUNT|)))))
            (SETQ COUNT_CONDITION
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'COUNT))
                      (PROGN
                       (SETQ |$count_list|
                               (|adjoin_equal| TRACENAME |$count_list|))
                       (COND
                        ((AND (CDR U) (INTEGERP (ELT U 1)))
                         (LIST 'COND (LIST (LIST '<= COUNTNAM (ELT U 1)) T)
                               (LIST T (LIST '|untrace2| (MKQ |fn|) NIL) NIL)))
                        (#1# T))))
                     (#1# T)))
            (COND
             ((|get_trace_option| |options| 'TIMER)
              (SETQ TIMERNAM (INTERN (STRCONC TRACENAME ",TIMER")))
              (SETQ |$timer_list| (|adjoin_equal| TRACENAME |$timer_list|))))
            (SETQ DEPTH_CONDITION
                    (COND
                     ((SETQ U (|get_trace_option| |options| 'DEPTH))
                      (COND
                       ((AND (CDR U) (INTEGERP (ELT U 1)))
                        (LIST '<= '|$monitor_fun_depth| (ELT U 1)))
                       (#1# (TRACE_OPTION_ERROR 'DEPTH))))
                     (#1# T)))
            (SETQ CONDITION
                    (MKPF
                     (LIST CONDITION WITHIN_CONDITION FROM_CONDITION
                           COUNT_CONDITION DEPTH_CONDITION)
                     'AND))
            (SETQ ONLYS (|get_trace_option| |options| 'ONLY))
            (SETQ TRACECODE
                    (COND ((|get_trace_option| |options| 'NT) "000")
                          (#1#
                           (PROGN
                            (SETQ ONLYS (MAPCAR #'COND_UCASE ONLYS))
                            (SETQ F
                                    (OR (|member| 'F ONLYS)
                                        (|member| 'FULL ONLYS)))
                            (SETQ A
                                    (OR F (|member| 'A ONLYS)
                                        (|member| 'ARGS ONLYS)))
                            (SETQ V
                                    (OR F (|member| 'V ONLYS)
                                        (|member| 'VALUE ONLYS)))
                            (SETQ C
                                    (OR F (|member| 'C ONLYS)
                                        (|member| 'CALLER ONLYS)))
                            (SETQ NL
                                    (COND (A (LIST (|char| '|9|)))
                                          (#1#
                                           ((LAMBDA (|bfVar#10| |bfVar#9| X)
                                              (LOOP
                                               (COND
                                                ((OR (ATOM |bfVar#9|)
                                                     (PROGN
                                                      (SETQ X (CAR |bfVar#9|))
                                                      NIL))
                                                 (RETURN
                                                  (NREVERSE |bfVar#10|)))
                                                (#1#
                                                 (AND (INTEGERP X) (< 0 X)
                                                      (< X 9)
                                                      (SETQ |bfVar#10|
                                                              (CONS
                                                               (FETCHCHAR
                                                                (STRINGIMAGE X)
                                                                0)
                                                               |bfVar#10|)))))
                                               (SETQ |bfVar#9|
                                                       (CDR |bfVar#9|))))
                                            NIL ONLYS NIL))))
                            (COND
                             ((NULL (OR A V C NL))
                              (COND (|caller| "119") (#1# "019")))
                             (#1#
                              (PROGN
                               (SETQ NL (APPEND NL (LIST (|char| '|0|))))
                               (SETQ |buf|
                                       (|filler_spaces|
                                        (COND (A 3) (#1# (+ 2 (LENGTH NL))))))
                               (SETF (ELT |buf| 0)
                                       (COND ((OR C |caller|) (|char| '|1|))
                                             (#1# (|char| '|0|))))
                               (SETF (ELT |buf| 1)
                                       (COND (V (|char| '|1|))
                                             (#1# (|char| '|0|))))
                               (COND
                                (A
                                 (PROGN
                                  (SETF (ELT |buf| 2) (|char| '|9|))
                                  |buf|))
                                (#1#
                                 (PROGN
                                  ((LAMBDA (|bfVar#11| |x| |i|)
                                     (LOOP
                                      (COND
                                       ((OR (ATOM |bfVar#11|)
                                            (PROGN
                                             (SETQ |x| (CAR |bfVar#11|))
                                             NIL))
                                        (RETURN NIL))
                                       (#1# (SETF (ELT |buf| |i|) |x|)))
                                      (SETQ |bfVar#11| (CDR |bfVar#11|))
                                      (SETQ |i| (+ |i| 1))))
                                   NL NIL 2)
                                  |buf|))))))))))
            (SETQ G4 (MACRO-FUNCTION |fn|))
            (COND (COUNTNAM (SET COUNTNAM 0)))
            (COND (TIMERNAM (SET TIMERNAM 0)))
            (SETQ |ll|
                    (LIST 'QUOTE
                          (LIST (INTERN TRACENAME) (COND (G4 'MACRO) (#1# NIL))
                                TRACECODE COUNTNAM TIMERNAM BEFORE AFTER
                                CONDITION BREAK |modemap| (LIST 'QUOTE T))))
            (SETQ NEW_DEF
                    (LIST (COND (G4 'MLAMBDA) (#1# 'LAMBDA)) (LIST '&REST 'G6)
                          (LIST '|monitor_x| 'G6 |fn| |ll|)))
            (COND (|bin_def| (|embeded_function| |fn| NEW_DEF |bin_def|))
                  (#1#
                   (PROGN
                    (SETQ OLD_DEF (SYMBOL-FUNCTION |fn|))
                    (SETQ NEW_DEF (|embeded_function| |fn| NEW_DEF OLD_DEF))
                    (|embed2| |fn| NEW_DEF OLD_DEF)
                    |fn|)))))))))))))

; trace2(fn, modemap, options) ==
;     trace3(fn, modemap, options, false)

(DEFUN |trace2| (|fn| |modemap| |options|)
  (PROG () (RETURN (|trace3| |fn| |modemap| |options| NIL))))

; untrace2(X, options) ==
;     isFunctor(X) and ATOM(X) => untraceDomainConstructor(X)
;     isDomainOrPackage(U := X) or (SYMBOLP(X) and BOUNDP(X)
;                                   and isDomain(U := EVAL(X))) =>
;         spadUntrace(U, options)
;     EQCAR(options, 'ALIAS) =>
;         if $traceNoisely then
;             sayBrightly(["%b", options.1, "%d", '"**untraced"])
;         $timer_list := remove_equal(STRINGIMAGE(options.1), $timer_list)
;         $count_list := remove_equal(STRINGIMAGE(options.1), $count_list)
;         $mathTraceList := remove_equal(options.1, $mathTraceList)
;         UNEMBED(X)
;     NOT(MEMBER(X, $trace_names)) and NOT(isSubForRedundantMapName(X)) =>
;         sayBrightly(["%b", rassocSub(X, $mapSubNameAlist),
;                      "%d", '"not traced"])
;     $trace_names := remove_equal(X, $trace_names)
;     $mathTraceList := REMOVE((STRINGP(X) => INTERN(X); X), $mathTraceList)
;     $letAssoc := assoc_del(X, $letAssoc)
;     Y := (IS_GENVAR(X) => devaluate(EVAL(X)); X)
;     $timer_list := remove_equal(STRINGIMAGE(Y), $timer_list)
;     SET(INTERN(STRCONC(Y, ",TIMER")), 0)
;     $count_list := remove_equal(STRINGIMAGE(Y), $count_list)
;     SET(INTERN(STRCONC(Y, ",COUNT")), 0)
;     if $traceNoisely and NOT(isSubForRedundantMapName(Y)) then
;         sayBrightly(["%b", rassocSub(Y, $mapSubNameAlist),
;                      "%d", '"untraced"])
;     UNEMBED(X)

(DEFUN |untrace2| (X |options|)
  (PROG (U Y)
    (RETURN
     (COND ((AND (|isFunctor| X) (ATOM X)) (|untraceDomainConstructor| X))
           ((OR (|isDomainOrPackage| (SETQ U X))
                (AND (SYMBOLP X) (BOUNDP X) (|isDomain| (SETQ U (EVAL X)))))
            (|spadUntrace| U |options|))
           ((EQCAR |options| 'ALIAS)
            (PROGN
             (COND
              (|$traceNoisely|
               (|sayBrightly|
                (LIST '|%b| (ELT |options| 1) '|%d| "**untraced"))))
             (SETQ |$timer_list|
                     (|remove_equal| (STRINGIMAGE (ELT |options| 1))
                      |$timer_list|))
             (SETQ |$count_list|
                     (|remove_equal| (STRINGIMAGE (ELT |options| 1))
                      |$count_list|))
             (SETQ |$mathTraceList|
                     (|remove_equal| (ELT |options| 1) |$mathTraceList|))
             (UNEMBED X)))
           ((AND (NULL (MEMBER X |$trace_names|))
                 (NULL (|isSubForRedundantMapName| X)))
            (|sayBrightly|
             (LIST '|%b| (|rassocSub| X |$mapSubNameAlist|) '|%d|
                   "not traced")))
           (#1='T
            (PROGN
             (SETQ |$trace_names| (|remove_equal| X |$trace_names|))
             (SETQ |$mathTraceList|
                     (REMOVE (COND ((STRINGP X) (INTERN X)) (#1# X))
                             |$mathTraceList|))
             (SETQ |$letAssoc| (|assoc_del| X |$letAssoc|))
             (SETQ Y (COND ((IS_GENVAR X) (|devaluate| (EVAL X))) (#1# X)))
             (SETQ |$timer_list|
                     (|remove_equal| (STRINGIMAGE Y) |$timer_list|))
             (SET (INTERN (STRCONC Y '|,TIMER|)) 0)
             (SETQ |$count_list|
                     (|remove_equal| (STRINGIMAGE Y) |$count_list|))
             (SET (INTERN (STRCONC Y '|,COUNT|)) 0)
             (COND
              ((AND |$traceNoisely| (NULL (|isSubForRedundantMapName| Y)))
               (|sayBrightly|
                (LIST '|%b| (|rassocSub| Y |$mapSubNameAlist|) '|%d|
                      "untraced"))))
             (UNEMBED X)))))))

; BPITRACE(bin_def, alias, modemap, options) ==
;     trace3(GENSYM(), modemap, [["ALIAS", alias], :options], bin_def)

(DEFUN BPITRACE (|bin_def| |alias| |modemap| |options|)
  (PROG ()
    (RETURN
     (|trace3| (GENSYM) |modemap| (CONS (LIST 'ALIAS |alias|) |options|)
      |bin_def|))))

; getTraceOptions options ==
;   $traceErrorStack: local := nil
;   optionList:= [getTraceOption x for x in options]
;   $traceErrorStack =>
;     null rest $traceErrorStack =>
;       [key, msg, args] := first($traceErrorStack)
;       throw_msg(key, msg, ['"", :args])
;     throw_msg_list("S2IT0017",
;             '"There are %1b problems with your %b )trace %d system command:",
;             [# $traceErrorStack],
;             NREVERSE($traceErrorStack))
;   optionList

(DEFUN |getTraceOptions| (|options|)
  (PROG (|$traceErrorStack| |args| |msg| |key| |LETTMP#1| |optionList|)
    (DECLARE (SPECIAL |$traceErrorStack|))
    (RETURN
     (PROGN
      (SETQ |$traceErrorStack| NIL)
      (SETQ |optionList|
              ((LAMBDA (|bfVar#13| |bfVar#12| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#12|)
                        (PROGN (SETQ |x| (CAR |bfVar#12|)) NIL))
                    (RETURN (NREVERSE |bfVar#13|)))
                   (#1='T
                    (SETQ |bfVar#13|
                            (CONS (|getTraceOption| |x|) |bfVar#13|))))
                  (SETQ |bfVar#12| (CDR |bfVar#12|))))
               NIL |options| NIL))
      (COND
       (|$traceErrorStack|
        (COND
         ((NULL (CDR |$traceErrorStack|))
          (PROGN
           (SETQ |LETTMP#1| (CAR |$traceErrorStack|))
           (SETQ |key| (CAR |LETTMP#1|))
           (SETQ |msg| (CADR . #2=(|LETTMP#1|)))
           (SETQ |args| (CADDR . #2#))
           (|throw_msg| |key| |msg| (CONS "" |args|))))
         (#1#
          (|throw_msg_list| 'S2IT0017
           "There are %1b problems with your %b )trace %d system command:"
           (LIST (LENGTH |$traceErrorStack|)) (NREVERSE |$traceErrorStack|)))))
       (#1# |optionList|))))))

; saveMapSig(funNames) ==
;   for name in funNames repeat
;     map:= rassoc(name,$mapSubNameAlist) =>
;             $tracedMapSignatures := assoc_add(name, getMapSig(map, name),
;                                               $tracedMapSignatures)

(DEFUN |saveMapSig| (|funNames|)
  (PROG (|map|)
    (RETURN
     ((LAMBDA (|bfVar#14| |name|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#14|) (PROGN (SETQ |name| (CAR |bfVar#14|)) NIL))
           (RETURN NIL))
          ('T
           (COND
            ((SETQ |map| (|rassoc| |name| |$mapSubNameAlist|))
             (IDENTITY
              (SETQ |$tracedMapSignatures|
                      (|assoc_add| |name| (|getMapSig| |map| |name|)
                       |$tracedMapSignatures|)))))))
         (SETQ |bfVar#14| (CDR |bfVar#14|))))
      |funNames| NIL))))

; getMapSig(mapName,subName) ==
;   lmms := getI(mapName, 'localModemap) =>
;     for mm in lmms until sig repeat
;       CADR mm = subName => sig:= CDAR mm
;     sig

(DEFUN |getMapSig| (|mapName| |subName|)
  (PROG (|lmms| |sig|)
    (RETURN
     (COND
      ((SETQ |lmms| (|getI| |mapName| '|localModemap|))
       (IDENTITY
        (PROGN
         ((LAMBDA (|bfVar#15| |mm| |bfVar#16|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#15|) (PROGN (SETQ |mm| (CAR |bfVar#15|)) NIL)
                   |bfVar#16|)
               (RETURN NIL))
              ('T
               (COND
                ((EQUAL (CADR |mm|) |subName|)
                 (IDENTITY (SETQ |sig| (CDAR |mm|)))))))
             (SETQ |bfVar#15| (CDR |bfVar#15|))
             (SETQ |bfVar#16| |sig|)))
          |lmms| NIL NIL)
         |sig|)))))))

; getTraceOption (x is [key,:l]) ==
;   key:= selectOption(key, $traceOptionList, 'traceOptionError)
;   x := [key,:l]
;   MEMQ(key,'(nonquietly timer nt)) => x
;   key='break =>
;     null l => ['break,'before]
;     opts := [selectOption(y, '(before after), nil) for y in l]
;     and/[IDENTP y for y in opts] => ['break,:opts]
;     stack_trace_option_error("S2IT0008", CONCAT(
;             '"%1 The %b )trace %d option %b )break %d can only have one",
;             '" or both of %b before %d and %b after %d as arguments."), [])
;   key='restore or key='mathprint =>
;         null l => x
;         stack_trace_option_error("S2IT0009",
;             '"%1 The %b )trace %d option %2b can have no arguments.",
;             [STRCONC('")", object2String(key))])
;   key='only => ['only,:transOnlyOption l]
;   key='within =>
;         l is [a] and IDENTP a => x
;         stack_trace_option_error("S2IT0010", CONCAT(
;             '"%1 The %b )trace %d option %2b takes exactly one name",
;             '" as an argument."), ['")within"])
;   MEMQ(key,'(cond before after)) =>
;     l is [a] =>
;         key:=
;             key="cond" => "when"
;             key
;         [key,:l]
;     stack_trace_option_error("S2IT0011", CONCAT(
;         '"%1 The %b )trace %d option %2b takes exactly one",
;         '" expression as an argument."), [STRCONC('")", object2String(key))])
;   key='depth or key='count =>
;         (key='count and null(l)) or l is [n] and FIXP n => x
;         stack_trace_option_error("S2IT0012", CONCAT(
;             '"%1 The %b )trace %d option %2b takes exactly one integer",
;             '" argument."), ['")depth"])
;   key="of" =>
;         ["of", :[hn(y) for y in l]] where hn(x) ==
;             res :=
;                 atom x and not UPPER_-CASE_-P (STRINGIMAGE x).(0) =>
;                     isDomainOrPackage EVAL x => x
;                     false
;                 domainToGenvar x
;             res => res
;             stack_trace_option_error("S2IT0013", CONCAT(
;                 '"%1 The %b )trace %d option %b )of %d should be followed",
;                 '" by the name of a domain and %2b is not one."), [x])
;   MEMQ(key,'(local ops vars)) =>
;     null l or l is ["all"] => [key,:"all"]
;     isListOfIdentifiersOrStrings l => x
;     stack_trace_option_error("S2IT0015", CONCAT(
;             '"%1 The %b )trace %d option %2b should be followed by a",
;             '" list of names."), [STRCONC('")", object2String(key))])
;   key='varbreak =>
;     null l or l is ["all"] => ["varbreak",:"all"]
;     isListOfIdentifiers l => x
;     stack_trace_option_error("S2IT0016", CONCAT(
;             '"%1 The %b )trace %d option %2b should be followed by a",
;             '" list of variable names."), [STRCONC('")", object2String(key))])
;   key => throw_msg("S2IT0005", '"The %1b option is not implemented yet.",
;                    [key])

(DEFUN |getTraceOption| (|x|)
  (PROG (|key| |l| |opts| |a| |n|)
    (RETURN
     (PROGN
      (SETQ |key| (CAR |x|))
      (SETQ |l| (CDR |x|))
      (SETQ |key|
              (|selectOption| |key| |$traceOptionList| '|traceOptionError|))
      (SETQ |x| (CONS |key| |l|))
      (COND ((MEMQ |key| '(|nonquietly| |timer| |nt|)) |x|)
            ((EQ |key| '|break|)
             (COND ((NULL |l|) (LIST '|break| '|before|))
                   (#1='T
                    (PROGN
                     (SETQ |opts|
                             ((LAMBDA (|bfVar#18| |bfVar#17| |y|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#17|)
                                       (PROGN (SETQ |y| (CAR |bfVar#17|)) NIL))
                                   (RETURN (NREVERSE |bfVar#18|)))
                                  (#1#
                                   (SETQ |bfVar#18|
                                           (CONS
                                            (|selectOption| |y|
                                             '(|before| |after|) NIL)
                                            |bfVar#18|))))
                                 (SETQ |bfVar#17| (CDR |bfVar#17|))))
                              NIL |l| NIL))
                     (COND
                      (((LAMBDA (|bfVar#20| |bfVar#19| |y|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#19|)
                                 (PROGN (SETQ |y| (CAR |bfVar#19|)) NIL))
                             (RETURN |bfVar#20|))
                            (#1#
                             (PROGN
                              (SETQ |bfVar#20| (IDENTP |y|))
                              (COND ((NOT |bfVar#20|) (RETURN NIL))))))
                           (SETQ |bfVar#19| (CDR |bfVar#19|))))
                        T |opts| NIL)
                       (CONS '|break| |opts|))
                      (#1#
                       (|stack_trace_option_error| 'S2IT0008
                        (CONCAT
                         "%1 The %b )trace %d option %b )break %d can only have one"
                         " or both of %b before %d and %b after %d as arguments.")
                        NIL)))))))
            ((OR (EQ |key| '|restore|) (EQ |key| '|mathprint|))
             (COND ((NULL |l|) |x|)
                   (#1#
                    (|stack_trace_option_error| 'S2IT0009
                     "%1 The %b )trace %d option %2b can have no arguments."
                     (LIST (STRCONC ")" (|object2String| |key|)))))))
            ((EQ |key| '|only|) (CONS '|only| (|transOnlyOption| |l|)))
            ((EQ |key| '|within|)
             (COND
              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                    (PROGN (SETQ |a| (CAR |l|)) #1#) (IDENTP |a|))
               |x|)
              (#1#
               (|stack_trace_option_error| 'S2IT0010
                (CONCAT "%1 The %b )trace %d option %2b takes exactly one name"
                        " as an argument.")
                (LIST ")within")))))
            ((MEMQ |key| '(|cond| |before| |after|))
             (COND
              ((AND (CONSP |l|) (EQ (CDR |l|) NIL)
                    (PROGN (SETQ |a| (CAR |l|)) #1#))
               (PROGN
                (SETQ |key| (COND ((EQ |key| '|cond|) '|when|) (#1# |key|)))
                (CONS |key| |l|)))
              (#1#
               (|stack_trace_option_error| 'S2IT0011
                (CONCAT "%1 The %b )trace %d option %2b takes exactly one"
                        " expression as an argument.")
                (LIST (STRCONC ")" (|object2String| |key|)))))))
            ((OR (EQ |key| '|depth|) (EQ |key| '|count|))
             (COND
              ((OR (AND (EQ |key| '|count|) (NULL |l|))
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL)
                        (PROGN (SETQ |n| (CAR |l|)) #1#) (FIXP |n|)))
               |x|)
              (#1#
               (|stack_trace_option_error| 'S2IT0012
                (CONCAT
                 "%1 The %b )trace %d option %2b takes exactly one integer"
                 " argument.")
                (LIST ")depth")))))
            ((EQ |key| '|of|)
             (CONS '|of|
                   ((LAMBDA (|bfVar#22| |bfVar#21| |y|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#21|)
                             (PROGN (SETQ |y| (CAR |bfVar#21|)) NIL))
                         (RETURN (NREVERSE |bfVar#22|)))
                        (#1#
                         (SETQ |bfVar#22|
                                 (CONS (|getTraceOption,hn| |y|) |bfVar#22|))))
                       (SETQ |bfVar#21| (CDR |bfVar#21|))))
                    NIL |l| NIL)))
            ((MEMQ |key| '(|local| |ops| |vars|))
             (COND
              ((OR (NULL |l|)
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '|all|)))
               (CONS |key| '|all|))
              ((|isListOfIdentifiersOrStrings| |l|) |x|)
              (#1#
               (|stack_trace_option_error| 'S2IT0015
                (CONCAT
                 "%1 The %b )trace %d option %2b should be followed by a"
                 " list of names.")
                (LIST (STRCONC ")" (|object2String| |key|)))))))
            ((EQ |key| '|varbreak|)
             (COND
              ((OR (NULL |l|)
                   (AND (CONSP |l|) (EQ (CDR |l|) NIL) (EQ (CAR |l|) '|all|)))
               (CONS '|varbreak| '|all|))
              ((|isListOfIdentifiers| |l|) |x|)
              (#1#
               (|stack_trace_option_error| 'S2IT0016
                (CONCAT
                 "%1 The %b )trace %d option %2b should be followed by a"
                 " list of variable names.")
                (LIST (STRCONC ")" (|object2String| |key|)))))))
            (|key|
             (|throw_msg| 'S2IT0005 "The %1b option is not implemented yet."
              (LIST |key|))))))))
(DEFUN |getTraceOption,hn| (|x|)
  (PROG (|res|)
    (RETURN
     (PROGN
      (SETQ |res|
              (COND
               ((AND (ATOM |x|)
                     (NULL (UPPER-CASE-P (ELT (STRINGIMAGE |x|) 0))))
                (COND ((|isDomainOrPackage| (EVAL |x|)) |x|) (#1='T NIL)))
               (#1# (|domainToGenvar| |x|))))
      (COND (|res| |res|)
            (#1#
             (|stack_trace_option_error| 'S2IT0013
              (CONCAT "%1 The %b )trace %d option %b )of %d should be followed"
                      " by the name of a domain and %2b is not one.")
              (LIST |x|))))))))

; traceOptionError(opt, keys) ==
;   null(keys) => stack_trace_option_error("S2IT0007", CONCAT(
;         '"%1 FriCAS does not understand the %b )trace %d option %2b",
;         '" which you used."), [opt])
;   commandAmbiguityError('"trace option",opt,keys)

(DEFUN |traceOptionError| (|opt| |keys|)
  (PROG ()
    (RETURN
     (COND
      ((NULL |keys|)
       (|stack_trace_option_error| 'S2IT0007
        (CONCAT "%1 FriCAS does not understand the %b )trace %d option %2b"
                " which you used.")
        (LIST |opt|)))
      ('T (|commandAmbiguityError| "trace option" |opt| |keys|))))))

; resetTimers () ==
;   for timer in $timer_list repeat
;     SET(INTERN STRCONC(timer,'"_,TIMER"),0)

(DEFUN |resetTimers| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#23| |timer|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#23|) (PROGN (SETQ |timer| (CAR |bfVar#23|)) NIL))
           (RETURN NIL))
          ('T (SET (INTERN (STRCONC |timer| ",TIMER")) 0)))
         (SETQ |bfVar#23| (CDR |bfVar#23|))))
      |$timer_list| NIL))))

; resetCounters () ==
;   for k in $count_list repeat
;     SET(INTERN STRCONC(k,'"_,COUNT"),0)

(DEFUN |resetCounters| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#24| |k|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#24|) (PROGN (SETQ |k| (CAR |bfVar#24|)) NIL))
           (RETURN NIL))
          ('T (SET (INTERN (STRCONC |k| ",COUNT")) 0)))
         (SETQ |bfVar#24| (CDR |bfVar#24|))))
      |$count_list| NIL))))

; ptimers() ==
;   null $timer_list => sayBrightly '"   no functions are timed"
;   for timer in $timer_list repeat
;     sayBrightly ['"  ",:bright timer,'_:,'" ",
;       EVAL(INTERN STRCONC(timer, '"_,TIMER")) /
;         FLOAT($timerTicksPerSecond, 0.0), '" sec."]

(DEFUN |ptimers| ()
  (PROG ()
    (RETURN
     (COND ((NULL |$timer_list|) (|sayBrightly| "   no functions are timed"))
           (#1='T
            ((LAMBDA (|bfVar#25| |timer|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#25|)
                      (PROGN (SETQ |timer| (CAR |bfVar#25|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (|sayBrightly|
                   (CONS "  "
                         (APPEND (|bright| |timer|)
                                 (CONS '|:|
                                       (CONS " "
                                             (CONS
                                              (/
                                               (EVAL
                                                (INTERN
                                                 (STRCONC |timer| ",TIMER")))
                                               (FLOAT |$timerTicksPerSecond|
                                                      0.0))
                                              (CONS " sec." NIL)))))))))
                (SETQ |bfVar#25| (CDR |bfVar#25|))))
             |$timer_list| NIL))))))

; pcounters() ==
;   null $count_list => sayBrightly '"   no functions are being counted"
;   for k in $count_list repeat
;     sayBrightly ['"  ",:bright k,'_:,'" ",
;       EVAL INTERN STRCONC(k,'"_,COUNT"),'" times"]

(DEFUN |pcounters| ()
  (PROG ()
    (RETURN
     (COND
      ((NULL |$count_list|)
       (|sayBrightly| "   no functions are being counted"))
      (#1='T
       ((LAMBDA (|bfVar#26| |k|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#26|) (PROGN (SETQ |k| (CAR |bfVar#26|)) NIL))
             (RETURN NIL))
            (#1#
             (|sayBrightly|
              (CONS "  "
                    (APPEND (|bright| |k|)
                            (CONS '|:|
                                  (CONS " "
                                        (CONS
                                         (EVAL (INTERN (STRCONC |k| ",COUNT")))
                                         (CONS " times" NIL)))))))))
           (SETQ |bfVar#26| (CDR |bfVar#26|))))
        |$count_list| NIL))))))

; transOnlyOption l ==
;   l is [n,:y] =>
;     FIXP n => [n,:transOnlyOption y]
;     MEMQ(n:= UPCASE n,'(V A C)) => [n,:transOnlyOption y]
;     stack_trace_option_error("S2IT0006", CONCAT(
;             '"%1 The %b )trace %d option %b )only %d does not permit",
;             '" %2b as a legal option."), [n])
;     transOnlyOption y
;   nil

(DEFUN |transOnlyOption| (|l|)
  (PROG (|n| |y|)
    (RETURN
     (COND
      ((AND (CONSP |l|)
            (PROGN (SETQ |n| (CAR |l|)) (SETQ |y| (CDR |l|)) #1='T))
       (COND ((FIXP |n|) (CONS |n| (|transOnlyOption| |y|)))
             ((MEMQ (SETQ |n| (UPCASE |n|)) '(V A C))
              (CONS |n| (|transOnlyOption| |y|)))
             (#1#
              (PROGN
               (|stack_trace_option_error| 'S2IT0006
                (CONCAT
                 "%1 The %b )trace %d option %b )only %d does not permit"
                 " %2b as a legal option.")
                (LIST |n|))
               (|transOnlyOption| |y|)))))
      (#1# NIL)))))

; stack_trace_option_error(key, msg, args) ==
;   $traceErrorStack:= [[key, msg, args], :$traceErrorStack]
;   nil

(DEFUN |stack_trace_option_error| (|key| |msg| |args|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$traceErrorStack|
              (CONS (LIST |key| |msg| |args|) |$traceErrorStack|))
      NIL))))

; removeOption(op,options) ==
;   [optEntry for (optEntry:=[opt,:.]) in options | opt ~= op]

(DEFUN |removeOption| (|op| |options|)
  (PROG (|opt|)
    (RETURN
     ((LAMBDA (|bfVar#28| |bfVar#27| |optEntry|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#27|)
               (PROGN (SETQ |optEntry| (CAR |bfVar#27|)) NIL))
           (RETURN (NREVERSE |bfVar#28|)))
          (#1='T
           (AND (CONSP |optEntry|) (PROGN (SETQ |opt| (CAR |optEntry|)) #1#)
                (NOT (EQUAL |opt| |op|))
                (SETQ |bfVar#28| (CONS |optEntry| |bfVar#28|)))))
         (SETQ |bfVar#27| (CDR |bfVar#27|))))
      NIL |options| NIL))))

; domainToGenvar x ==
;   (y := unabbrevAndLoad(x)) and
;             get_database(opOf(y), 'CONSTRUCTORKIND) = 'domain =>
;     g:= genDomainTraceName y
;     SET(g,evalDomain y)
;     g

(DEFUN |domainToGenvar| (|x|)
  (PROG (|y| |g|)
    (RETURN
     (COND
      ((AND (SETQ |y| (|unabbrevAndLoad| |x|))
            (EQ (|get_database| (|opOf| |y|) 'CONSTRUCTORKIND) '|domain|))
       (IDENTITY
        (PROGN
         (SETQ |g| (|genDomainTraceName| |y|))
         (SET |g| (|evalDomain| |y|))
         |g|)))))))

; genDomainTraceName y ==
;   u:= LASSOC(y,$domainTraceNameAssoc) => u
;   g:= GENVAR()
;   $domainTraceNameAssoc:= [[y,:g],:$domainTraceNameAssoc]
;   g

(DEFUN |genDomainTraceName| (|y|)
  (PROG (|u| |g|)
    (RETURN
     (COND ((SETQ |u| (LASSOC |y| |$domainTraceNameAssoc|)) |u|)
           ('T
            (PROGN
             (SETQ |g| (GENVAR))
             (SETQ |$domainTraceNameAssoc|
                     (CONS (CONS |y| |g|) |$domainTraceNameAssoc|))
             |g|))))))

; untrace l ==
;     null(l) =>
;         $lastUntraced := l := COPY($trace_names)
;         for x in l repeat
;             untrace2(get_name(x), [])
;     $lastUntraced := l
;     untraceList := [transTraceItem(x) for x in l]
;     for funName in untraceList repeat
;         untrace2(lassocSub(funName, $mapSubNameAlist), [])
;     removeTracedMapSigs untraceList

(DEFUN |untrace| (|l|)
  (PROG (|untraceList|)
    (RETURN
     (COND
      ((NULL |l|)
       (PROGN
        (SETQ |$lastUntraced| (SETQ |l| (COPY |$trace_names|)))
        ((LAMBDA (|bfVar#29| |x|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#29|) (PROGN (SETQ |x| (CAR |bfVar#29|)) NIL))
              (RETURN NIL))
             (#1='T (|untrace2| (|get_name| |x|) NIL)))
            (SETQ |bfVar#29| (CDR |bfVar#29|))))
         |l| NIL)))
      (#1#
       (PROGN
        (SETQ |$lastUntraced| |l|)
        (SETQ |untraceList|
                ((LAMBDA (|bfVar#31| |bfVar#30| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#30|)
                          (PROGN (SETQ |x| (CAR |bfVar#30|)) NIL))
                      (RETURN (NREVERSE |bfVar#31|)))
                     (#1#
                      (SETQ |bfVar#31|
                              (CONS (|transTraceItem| |x|) |bfVar#31|))))
                    (SETQ |bfVar#30| (CDR |bfVar#30|))))
                 NIL |l| NIL))
        ((LAMBDA (|bfVar#32| |funName|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#32|)
                  (PROGN (SETQ |funName| (CAR |bfVar#32|)) NIL))
              (RETURN NIL))
             (#1# (|untrace2| (|lassocSub| |funName| |$mapSubNameAlist|) NIL)))
            (SETQ |bfVar#32| (CDR |bfVar#32|))))
         |untraceList| NIL)
        (|removeTracedMapSigs| |untraceList|)))))))

; get_name(x) ==
;     ATOM(x) => x
;     first(x)

(DEFUN |get_name| (|x|)
  (PROG () (RETURN (COND ((ATOM |x|) |x|) ('T (CAR |x|))))))

; transTraceItem x ==
;   atom x =>
;     (value := getI(x, "value")) and
;       (objMode value in '((Mode) (Type) (Category))) =>
;         x := objVal value
;         (y:= domainToGenvar x) => y
;         x
;     UPPER_-CASE_-P (STRINGIMAGE x).(0) =>
;       y := unabbrev x
;       constructor?(y) => y
;       PAIRP(y) and constructor?(first y) => first y
;       (y:= domainToGenvar x) => y
;       x
;     x
;   VECP first x => transTraceItem devaluate first x
;   y:= domainToGenvar x => y
;   throw_msg("S2IT0018", '"FriCAS does not understand the use of %1b here.",
;             [x])

(DEFUN |transTraceItem| (|x|)
  (PROG (|value| |y|)
    (RETURN
     (COND
      ((ATOM |x|)
       (COND
        ((AND (SETQ |value| (|getI| |x| '|value|))
              (|member| (|objMode| |value|) '((|Mode|) (|Type|) (|Category|))))
         (PROGN
          (SETQ |x| (|objVal| |value|))
          (COND ((SETQ |y| (|domainToGenvar| |x|)) |y|) (#1='T |x|))))
        ((UPPER-CASE-P (ELT (STRINGIMAGE |x|) 0))
         (PROGN
          (SETQ |y| (|unabbrev| |x|))
          (COND ((|constructor?| |y|) |y|)
                ((AND (CONSP |y|) (|constructor?| (CAR |y|))) (CAR |y|))
                ((SETQ |y| (|domainToGenvar| |x|)) |y|) (#1# |x|))))
        (#1# |x|)))
      ((VECP (CAR |x|)) (|transTraceItem| (|devaluate| (CAR |x|))))
      ((SETQ |y| (|domainToGenvar| |x|)) |y|)
      (#1#
       (|throw_msg| 'S2IT0018 "FriCAS does not understand the use of %1b here."
        (LIST |x|)))))))

; removeTracedMapSigs untraceList ==
;   for name in untraceList repeat
;     REMPROP(name,$tracedMapSignatures)

(DEFUN |removeTracedMapSigs| (|untraceList|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#33| |name|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#33|) (PROGN (SETQ |name| (CAR |bfVar#33|)) NIL))
           (RETURN NIL))
          ('T (REMPROP |name| |$tracedMapSignatures|)))
         (SETQ |bfVar#33| (CDR |bfVar#33|))))
      |untraceList| NIL))))

; coerceToOutput(value, mode) ==
;     $resolve_level : local := 0
;     -- following binding is to prevent forcing calculation of stream elements
;     $streamCount : local := 0
;     objValUnwrap coerceInteractive(objNewWrap(value, mode), $OutputForm)

(DEFUN |coerceToOutput| (|value| |mode|)
  (PROG (|$streamCount| |$resolve_level|)
    (DECLARE (SPECIAL |$streamCount| |$resolve_level|))
    (RETURN
     (PROGN
      (SETQ |$resolve_level| 0)
      (SETQ |$streamCount| 0)
      (|objValUnwrap|
       (|coerceInteractive| (|objNewWrap| |value| |mode|) |$OutputForm|))))))

; coerceTraceArgs2E(traceName,subName,args) ==
;   MEMQ(name:= subName,$mathTraceList) =>
;     SPADSYSNAMEP PNAME name => coerceSpadArgs2E(reverse rest reverse args)
;     [["=", name, coerceToOutput(arg, type)]
;       for name in '(arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 )
;        for arg in args for type in rest LASSOC(subName,
;         $tracedMapSignatures)]
;   SPADSYSNAMEP PNAME name => reverse rest reverse args
;   args

(DEFUN |coerceTraceArgs2E| (|traceName| |subName| |args|)
  (PROG (|name|)
    (RETURN
     (COND
      ((MEMQ (SETQ |name| |subName|) |$mathTraceList|)
       (COND
        ((SPADSYSNAMEP (PNAME |name|))
         (|coerceSpadArgs2E| (REVERSE (CDR (REVERSE |args|)))))
        (#1='T
         ((LAMBDA
              (|bfVar#37| |bfVar#34| |name| |bfVar#35| |arg| |bfVar#36| |type|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#34|) (PROGN (SETQ |name| (CAR |bfVar#34|)) NIL)
                   (ATOM |bfVar#35|) (PROGN (SETQ |arg| (CAR |bfVar#35|)) NIL)
                   (ATOM |bfVar#36|)
                   (PROGN (SETQ |type| (CAR |bfVar#36|)) NIL))
               (RETURN (NREVERSE |bfVar#37|)))
              (#1#
               (SETQ |bfVar#37|
                       (CONS (LIST '= |name| (|coerceToOutput| |arg| |type|))
                             |bfVar#37|))))
             (SETQ |bfVar#34| (CDR |bfVar#34|))
             (SETQ |bfVar#35| (CDR |bfVar#35|))
             (SETQ |bfVar#36| (CDR |bfVar#36|))))
          NIL
          '(|arg1| |arg2| |arg3| |arg4| |arg5| |arg6| |arg7| |arg8| |arg9|
            |arg10| |arg11| |arg12| |arg13| |arg14| |arg15| |arg16| |arg17|
            |arg18| |arg19|)
          NIL |args| NIL (CDR (LASSOC |subName| |$tracedMapSignatures|))
          NIL))))
      ((SPADSYSNAMEP (PNAME |name|)) (REVERSE (CDR (REVERSE |args|))))
      (#1# |args|)))))

; coerceSpadArgs2E(args) ==
;     [["=", name, coerceToOutput(arg, type)]
;       for name in '(arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 arg11 arg12 arg13 arg14 arg15 arg16 arg17 arg18 arg19 )
;         for arg in args for type in rest $tracedSpadModemap]

(DEFUN |coerceSpadArgs2E| (|args|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#41| |bfVar#38| |name| |bfVar#39| |arg| |bfVar#40| |type|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#38|) (PROGN (SETQ |name| (CAR |bfVar#38|)) NIL)
               (ATOM |bfVar#39|) (PROGN (SETQ |arg| (CAR |bfVar#39|)) NIL)
               (ATOM |bfVar#40|) (PROGN (SETQ |type| (CAR |bfVar#40|)) NIL))
           (RETURN (NREVERSE |bfVar#41|)))
          ('T
           (SETQ |bfVar#41|
                   (CONS (LIST '= |name| (|coerceToOutput| |arg| |type|))
                         |bfVar#41|))))
         (SETQ |bfVar#38| (CDR |bfVar#38|))
         (SETQ |bfVar#39| (CDR |bfVar#39|))
         (SETQ |bfVar#40| (CDR |bfVar#40|))))
      NIL
      '(|arg1| |arg2| |arg3| |arg4| |arg5| |arg6| |arg7| |arg8| |arg9| |arg10|
        |arg11| |arg12| |arg13| |arg14| |arg15| |arg16| |arg17| |arg18|
        |arg19|)
      NIL |args| NIL (CDR |$tracedSpadModemap|) NIL))))

; subTypes(mm,sublist) ==
;   ATOM mm =>
;     (s:= LASSOC(mm,sublist)) => s
;     mm
;   [subTypes(m,sublist) for m in mm]

(DEFUN |subTypes| (|mm| |sublist|)
  (PROG (|s|)
    (RETURN
     (COND
      ((ATOM |mm|)
       (COND ((SETQ |s| (LASSOC |mm| |sublist|)) |s|) (#1='T |mm|)))
      (#1#
       ((LAMBDA (|bfVar#43| |bfVar#42| |m|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#42|) (PROGN (SETQ |m| (CAR |bfVar#42|)) NIL))
             (RETURN (NREVERSE |bfVar#43|)))
            (#1#
             (SETQ |bfVar#43| (CONS (|subTypes| |m| |sublist|) |bfVar#43|))))
           (SETQ |bfVar#42| (CDR |bfVar#42|))))
        NIL |mm| NIL))))))

; coerceTraceFunValue2E(traceName,subName,value) ==
;   MEMQ(name:= subName,$mathTraceList) =>
;     SPADSYSNAMEP PNAME traceName => coerceSpadFunValue2E(value)
;     (u:=LASSOC(subName,$tracedMapSignatures)) =>
;         coerceToOutput(value, first u)
;     value
;   value

(DEFUN |coerceTraceFunValue2E| (|traceName| |subName| |value|)
  (PROG (|name| |u|)
    (RETURN
     (COND
      ((MEMQ (SETQ |name| |subName|) |$mathTraceList|)
       (COND
        ((SPADSYSNAMEP (PNAME |traceName|)) (|coerceSpadFunValue2E| |value|))
        ((SETQ |u| (LASSOC |subName| |$tracedMapSignatures|))
         (|coerceToOutput| |value| (CAR |u|)))
        (#1='T |value|)))
      (#1# |value|)))))

; coerceSpadFunValue2E(value) ==
;     coerceToOutput(value, first $tracedSpadModemap)

(DEFUN |coerceSpadFunValue2E| (|value|)
  (PROG () (RETURN (|coerceToOutput| |value| (CAR |$tracedSpadModemap|)))))

; isListOfIdentifiers l == and/[IDENTP x for x in l]

(DEFUN |isListOfIdentifiers| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#45| |bfVar#44| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#44|) (PROGN (SETQ |x| (CAR |bfVar#44|)) NIL))
           (RETURN |bfVar#45|))
          ('T
           (PROGN
            (SETQ |bfVar#45| (IDENTP |x|))
            (COND ((NOT |bfVar#45|) (RETURN NIL))))))
         (SETQ |bfVar#44| (CDR |bfVar#44|))))
      T |l| NIL))))

; isListOfIdentifiersOrStrings l == and/[IDENTP x or STRINGP x for x in l]

(DEFUN |isListOfIdentifiersOrStrings| (|l|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#47| |bfVar#46| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#46|) (PROGN (SETQ |x| (CAR |bfVar#46|)) NIL))
           (RETURN |bfVar#47|))
          ('T
           (PROGN
            (SETQ |bfVar#47| (OR (IDENTP |x|) (STRINGP |x|)))
            (COND ((NOT |bfVar#47|) (RETURN NIL))))))
         (SETQ |bfVar#46| (CDR |bfVar#46|))))
      T |l| NIL))))

; getMapSubNames(l) ==
;   subs:= nil
;   for mapName in l repeat
;     lmm := getI(mapName, 'localModemap) =>
;       subs:= APPEND([[mapName,:CADR mm] for mm in lmm],subs)
;   union(subs, getPreviousMapSubNames UNIONQ($trace_names,
;     $lastUntraced))

(DEFUN |getMapSubNames| (|l|)
  (PROG (|subs| |lmm|)
    (RETURN
     (PROGN
      (SETQ |subs| NIL)
      ((LAMBDA (|bfVar#48| |mapName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#48|)
                (PROGN (SETQ |mapName| (CAR |bfVar#48|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |lmm| (|getI| |mapName| '|localModemap|))
              (IDENTITY
               (SETQ |subs|
                       (APPEND
                        ((LAMBDA (|bfVar#50| |bfVar#49| |mm|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#49|)
                                  (PROGN (SETQ |mm| (CAR |bfVar#49|)) NIL))
                              (RETURN (NREVERSE |bfVar#50|)))
                             (#1#
                              (SETQ |bfVar#50|
                                      (CONS (CONS |mapName| (CADR |mm|))
                                            |bfVar#50|))))
                            (SETQ |bfVar#49| (CDR |bfVar#49|))))
                         NIL |lmm| NIL)
                        |subs|)))))))
          (SETQ |bfVar#48| (CDR |bfVar#48|))))
       |l| NIL)
      (|union| |subs|
       (|getPreviousMapSubNames| (UNIONQ |$trace_names| |$lastUntraced|)))))))

; getPreviousMapSubNames(traceNames) ==
;   subs:= nil
;   for mapName in ASSOCLEFT CAAR $InteractiveFrame repeat
;     lmm := getI(mapName, 'localModemap) =>
;       MEMQ(CADAR lmm,traceNames) =>
;         for mm in lmm repeat
;           subs:= [[mapName,:CADR mm],:subs]
;   subs

(DEFUN |getPreviousMapSubNames| (|traceNames|)
  (PROG (|subs| |lmm|)
    (RETURN
     (PROGN
      (SETQ |subs| NIL)
      ((LAMBDA (|bfVar#51| |mapName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#51|)
                (PROGN (SETQ |mapName| (CAR |bfVar#51|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |lmm| (|getI| |mapName| '|localModemap|))
              (IDENTITY
               (COND
                ((MEMQ (CADAR |lmm|) |traceNames|)
                 (IDENTITY
                  ((LAMBDA (|bfVar#52| |mm|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#52|)
                            (PROGN (SETQ |mm| (CAR |bfVar#52|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (SETQ |subs|
                                (CONS (CONS |mapName| (CADR |mm|)) |subs|))))
                      (SETQ |bfVar#52| (CDR |bfVar#52|))))
                   |lmm| NIL)))))))))
          (SETQ |bfVar#51| (CDR |bfVar#51|))))
       (ASSOCLEFT (CAAR |$InteractiveFrame|)) NIL)
      |subs|))))

; lassocSub(x,subs)  ==
;   y := QLASSQ(x, subs) => y
;   x

(DEFUN |lassocSub| (|x| |subs|)
  (PROG (|y|) (RETURN (COND ((SETQ |y| (QLASSQ |x| |subs|)) |y|) ('T |x|)))))

; rassocSub(x,subs) ==
;   y:= rassoc(x,subs) => y
;   x

(DEFUN |rassocSub| (|x| |subs|)
  (PROG (|y|) (RETURN (COND ((SETQ |y| (|rassoc| |x| |subs|)) |y|) ('T |x|)))))

; isUncompiledMap(x) ==
;   y := getI(x, 'value) =>
;     (CAAR y) = 'SPADMAP and null getI(x, 'localModemap)

(DEFUN |isUncompiledMap| (|x|)
  (PROG (|y|)
    (RETURN
     (COND
      ((SETQ |y| (|getI| |x| '|value|))
       (IDENTITY
        (AND (EQ (CAAR |y|) 'SPADMAP) (NULL (|getI| |x| '|localModemap|)))))))))

; isInterpOnlyMap(map) ==
;   x := getI(map, 'localModemap) =>
;     (CAAAR x) = 'interpOnly

(DEFUN |isInterpOnlyMap| (|map|)
  (PROG (|x|)
    (RETURN
     (COND
      ((SETQ |x| (|getI| |map| '|localModemap|))
       (IDENTITY (EQ (CAAAR |x|) '|interpOnly|)))))))

; augmentTraceNames(l,mapSubNames) ==
;   res:= nil
;   for traceName in l repeat
;     mml := getI(traceName, 'localModemap) =>
;       res:= APPEND([CADR mm for mm in mml],res)
;     res:= [traceName,:res]
;   res

(DEFUN |augmentTraceNames| (|l| |mapSubNames|)
  (PROG (|res| |mml|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#53| |traceName|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|)
                (PROGN (SETQ |traceName| (CAR |bfVar#53|)) NIL))
            (RETURN NIL))
           (#1='T
            (COND
             ((SETQ |mml| (|getI| |traceName| '|localModemap|))
              (SETQ |res|
                      (APPEND
                       ((LAMBDA (|bfVar#55| |bfVar#54| |mm|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#54|)
                                 (PROGN (SETQ |mm| (CAR |bfVar#54|)) NIL))
                             (RETURN (NREVERSE |bfVar#55|)))
                            (#1#
                             (SETQ |bfVar#55| (CONS (CADR |mm|) |bfVar#55|))))
                           (SETQ |bfVar#54| (CDR |bfVar#54|))))
                        NIL |mml| NIL)
                       |res|)))
             (#1# (SETQ |res| (CONS |traceName| |res|))))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       |l| NIL)
      |res|))))

; isSubForRedundantMapName(subName) ==
;   mapName:= rassocSub(subName,$mapSubNameAlist) =>
;     tail:=member([mapName,:subName],$mapSubNameAlist) =>
;       MEMQ(mapName, rest ASSOCLEFT tail)

(DEFUN |isSubForRedundantMapName| (|subName|)
  (PROG (|mapName| |tail|)
    (RETURN
     (COND
      ((SETQ |mapName| (|rassocSub| |subName| |$mapSubNameAlist|))
       (IDENTITY
        (COND
         ((SETQ |tail|
                  (|member| (CONS |mapName| |subName|) |$mapSubNameAlist|))
          (IDENTITY (MEMQ |mapName| (CDR (ASSOCLEFT |tail|))))))))))))

; untraceMapSubNames traceNames ==
;   null($mapSubNameAlist:local:= getPreviousMapSubNames traceNames) => nil
;   for name in (subs:= ASSOCRIGHT $mapSubNameAlist)
;     | MEMQ(name, $trace_names) repeat
;       untrace2(name, [])
;       $lastUntraced:= SETDIFFERENCE($lastUntraced,subs)

(DEFUN |untraceMapSubNames| (|traceNames|)
  (PROG (|$mapSubNameAlist| |subs|)
    (DECLARE (SPECIAL |$mapSubNameAlist|))
    (RETURN
     (COND
      ((NULL (SETQ |$mapSubNameAlist| (|getPreviousMapSubNames| |traceNames|)))
       NIL)
      (#1='T
       ((LAMBDA (|bfVar#56| |name|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#56|) (PROGN (SETQ |name| (CAR |bfVar#56|)) NIL))
             (RETURN NIL))
            (#1#
             (AND (MEMQ |name| |$trace_names|)
                  (PROGN
                   (|untrace2| |name| NIL)
                   (SETQ |$lastUntraced|
                           (SETDIFFERENCE |$lastUntraced| |subs|))))))
           (SETQ |bfVar#56| (CDR |bfVar#56|))))
        (SETQ |subs| (ASSOCRIGHT |$mapSubNameAlist|)) NIL))))))

; isDomainOrPackage dom ==
;   REFVECP dom and #dom>0 and isFunctor opOf dom.(0)

(DEFUN |isDomainOrPackage| (|dom|)
  (PROG ()
    (RETURN
     (AND (REFVECP |dom|) (< 0 (LENGTH |dom|))
          (|isFunctor| (|opOf| (ELT |dom| 0)))))))

; isTraceGensym x == GENSYMP x

(DEFUN |isTraceGensym| (|x|) (PROG () (RETURN (GENSYMP |x|))))

; spadTrace(domain,options) ==
;   $fromSpadTrace:= true
;   PAIRP domain and REFVECP first domain and (first domain).0 = 0 =>
;       aldorTrace(domain,options)
;   not isDomainOrPackage domain => userError '"bad argument to trace"
;   listOfOperations:=
;     [g x for x in getOption("OPS",options)] where
;       g x ==
;         STRINGP x => INTERN x
;         x
;   if listOfVariables := getOption("VARS",options) then
;     options := removeOption("VARS",options)
;   if listOfBreakVars := getOption("VARBREAK",options) then
;     options := removeOption("VARBREAK",options)
;   anyifTrue:= null listOfOperations
;   domainId:= opOf domain.(0)
;   currentEntry := assoc(domain, $trace_names)
;   currentAlist:= IFCDR currentEntry
;   opStructureList:= flattenOperationAlist getOperationAlistFromLisplib domainId
;   sigSlotNumberAlist:=
;     [triple
;       --new form is (<op> <signature> <slotNumber> <condition> <kind>)
;       for [op,sig,n,.,kind] in opStructureList | kind = 'ELT
;         and (anyifTrue or MEMQ(op,listOfOperations)) and
;          FIXP n and
;           isTraceable(triple:= [op,sig,n],domain)] where
;             isTraceable(x is [.,.,n,:.],domain) ==
;               atom domain.n => nil
;               functionSlot:= first domain.n
;               GENSYMP functionSlot =>
;                 (reportSpadTrace('"Already Traced",x); nil)
;               null (BPINAME functionSlot) =>
;                 (reportSpadTrace('"No function for",x); nil)
;               true
;   if listOfVariables then
;     for [.,.,n] in sigSlotNumberAlist repeat
;       fn := first domain.n
;       $letAssoc := AS_INSERT(BPINAME(fn),
;         listOfVariables,$letAssoc)
;   if listOfBreakVars then
;     for [.,.,n] in sigSlotNumberAlist repeat
;       fn := first domain.n
;       $letAssoc := AS_INSERT(BPINAME(fn),
;         [["BREAK",:listOfBreakVars]],$letAssoc)
;   for (pair:= [op,mm,n]) in sigSlotNumberAlist repeat
;     alias:= spadTraceAlias(domainId,op,n)
;     tracedModemap := subTypes(mm, constructSubst(domain.0))
;     dn1 := first domain.n
;     fgg := FUNCTION newGoGet
;     tf :=
;         dn1 = fgg =>
;             goGetTracerHelper(domain.n, fgg, pair, alias,
;                                 options, tracedModemap)
;         BPITRACE(dn1, alias, tracedModemap, options)
;     NCONC(pair, [listOfVariables, first domain.n])
;     rplac(first domain.n, tf)
;   sigSlotNumberAlist:= [x for x in sigSlotNumberAlist | CDDDR x]
;   if $reportSpadTrace then
;     if $traceNoisely then printDashedLine()
;     for x in orderBySlotNumber sigSlotNumberAlist repeat
;       reportSpadTrace('"TRACING",x)
;   currentEntry =>
;     rplac(rest currentEntry,[:sigSlotNumberAlist,:currentAlist])
;   $trace_names := [[domain, :sigSlotNumberAlist], :$trace_names]
;   spadReply()

(DEFUN |spadTrace| (|domain| |options|)
  (PROG (|listOfOperations| |listOfVariables| |listOfBreakVars| |anyifTrue|
         |domainId| |currentEntry| |currentAlist| |opStructureList| |op|
         |ISTMP#1| |sig| |ISTMP#2| |n| |ISTMP#3| |ISTMP#4| |kind| |triple|
         |sigSlotNumberAlist| |fn| |mm| |alias| |tracedModemap| |dn1| |fgg|
         |tf|)
    (RETURN
     (PROGN
      (SETQ |$fromSpadTrace| T)
      (COND
       ((AND (CONSP |domain|) (REFVECP (CAR |domain|))
             (EQL (ELT (CAR |domain|) 0) 0))
        (|aldorTrace| |domain| |options|))
       ((NULL (|isDomainOrPackage| |domain|))
        (|userError| "bad argument to trace"))
       (#1='T
        (PROGN
         (SETQ |listOfOperations|
                 ((LAMBDA (|bfVar#58| |bfVar#57| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#57|)
                           (PROGN (SETQ |x| (CAR |bfVar#57|)) NIL))
                       (RETURN (NREVERSE |bfVar#58|)))
                      (#1#
                       (SETQ |bfVar#58|
                               (CONS (|spadTrace,g| |x|) |bfVar#58|))))
                     (SETQ |bfVar#57| (CDR |bfVar#57|))))
                  NIL (|getOption| 'OPS |options|) NIL))
         (COND
          ((SETQ |listOfVariables| (|getOption| 'VARS |options|))
           (SETQ |options| (|removeOption| 'VARS |options|))))
         (COND
          ((SETQ |listOfBreakVars| (|getOption| 'VARBREAK |options|))
           (SETQ |options| (|removeOption| 'VARBREAK |options|))))
         (SETQ |anyifTrue| (NULL |listOfOperations|))
         (SETQ |domainId| (|opOf| (ELT |domain| 0)))
         (SETQ |currentEntry| (|assoc| |domain| |$trace_names|))
         (SETQ |currentAlist| (IFCDR |currentEntry|))
         (SETQ |opStructureList|
                 (|flattenOperationAlist|
                  (|getOperationAlistFromLisplib| |domainId|)))
         (SETQ |sigSlotNumberAlist|
                 ((LAMBDA (|bfVar#61| |bfVar#60| |bfVar#59|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#60|)
                           (PROGN (SETQ |bfVar#59| (CAR |bfVar#60|)) NIL))
                       (RETURN (NREVERSE |bfVar#61|)))
                      (#1#
                       (AND (CONSP |bfVar#59|)
                            (PROGN
                             (SETQ |op| (CAR |bfVar#59|))
                             (SETQ |ISTMP#1| (CDR |bfVar#59|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |sig| (CAR |ISTMP#1|))
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (PROGN
                                         (SETQ |n| (CAR |ISTMP#2|))
                                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                         (AND (CONSP |ISTMP#3|)
                                              (PROGN
                                               (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                               (AND (CONSP |ISTMP#4|)
                                                    (EQ (CDR |ISTMP#4|) NIL)
                                                    (PROGN
                                                     (SETQ |kind|
                                                             (CAR |ISTMP#4|))
                                                     #1#)))))))))
                            (EQ |kind| 'ELT)
                            (OR |anyifTrue| (MEMQ |op| |listOfOperations|))
                            (FIXP |n|)
                            (|spadTrace,isTraceable|
                             (SETQ |triple| (LIST |op| |sig| |n|)) |domain|)
                            (SETQ |bfVar#61| (CONS |triple| |bfVar#61|)))))
                     (SETQ |bfVar#60| (CDR |bfVar#60|))))
                  NIL |opStructureList| NIL))
         (COND
          (|listOfVariables|
           ((LAMBDA (|bfVar#63| |bfVar#62|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#63|)
                     (PROGN (SETQ |bfVar#62| (CAR |bfVar#63|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#62|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |bfVar#62|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                  (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                      (PROGN
                       (SETQ |fn| (CAR (ELT |domain| |n|)))
                       (SETQ |$letAssoc|
                               (AS_INSERT (BPINAME |fn|) |listOfVariables|
                                |$letAssoc|))))))
               (SETQ |bfVar#63| (CDR |bfVar#63|))))
            |sigSlotNumberAlist| NIL)))
         (COND
          (|listOfBreakVars|
           ((LAMBDA (|bfVar#65| |bfVar#64|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#65|)
                     (PROGN (SETQ |bfVar#64| (CAR |bfVar#65|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |bfVar#64|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |bfVar#64|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                  (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                      (PROGN
                       (SETQ |fn| (CAR (ELT |domain| |n|)))
                       (SETQ |$letAssoc|
                               (AS_INSERT (BPINAME |fn|)
                                (LIST (CONS 'BREAK |listOfBreakVars|))
                                |$letAssoc|))))))
               (SETQ |bfVar#65| (CDR |bfVar#65|))))
            |sigSlotNumberAlist| NIL)))
         ((LAMBDA (|bfVar#66| |pair|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#66|)
                   (PROGN (SETQ |pair| (CAR |bfVar#66|)) NIL))
               (RETURN NIL))
              (#1#
               (AND (CONSP |pair|)
                    (PROGN
                     (SETQ |op| (CAR |pair|))
                     (SETQ |ISTMP#1| (CDR |pair|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |mm| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                    (PROGN
                     (SETQ |alias| (|spadTraceAlias| |domainId| |op| |n|))
                     (SETQ |tracedModemap|
                             (|subTypes| |mm|
                              (|constructSubst| (ELT |domain| 0))))
                     (SETQ |dn1| (CAR (ELT |domain| |n|)))
                     (SETQ |fgg| #'|newGoGet|)
                     (SETQ |tf|
                             (COND
                              ((EQUAL |dn1| |fgg|)
                               (|goGetTracerHelper| (ELT |domain| |n|) |fgg|
                                |pair| |alias| |options| |tracedModemap|))
                              (#1#
                               (BPITRACE |dn1| |alias| |tracedModemap|
                                |options|))))
                     (NCONC |pair|
                            (LIST |listOfVariables| (CAR (ELT |domain| |n|))))
                     (|rplac| (CAR (ELT |domain| |n|)) |tf|)))))
             (SETQ |bfVar#66| (CDR |bfVar#66|))))
          |sigSlotNumberAlist| NIL)
         (SETQ |sigSlotNumberAlist|
                 ((LAMBDA (|bfVar#68| |bfVar#67| |x|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#67|)
                           (PROGN (SETQ |x| (CAR |bfVar#67|)) NIL))
                       (RETURN (NREVERSE |bfVar#68|)))
                      (#1#
                       (AND (CDDDR |x|)
                            (SETQ |bfVar#68| (CONS |x| |bfVar#68|)))))
                     (SETQ |bfVar#67| (CDR |bfVar#67|))))
                  NIL |sigSlotNumberAlist| NIL))
         (COND
          (|$reportSpadTrace| (COND (|$traceNoisely| (|printDashedLine|)))
           ((LAMBDA (|bfVar#69| |x|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#69|) (PROGN (SETQ |x| (CAR |bfVar#69|)) NIL))
                 (RETURN NIL))
                (#1# (|reportSpadTrace| "TRACING" |x|)))
               (SETQ |bfVar#69| (CDR |bfVar#69|))))
            (|orderBySlotNumber| |sigSlotNumberAlist|) NIL)))
         (COND
          (|currentEntry|
           (|rplac| (CDR |currentEntry|)
            (APPEND |sigSlotNumberAlist| |currentAlist|)))
          (#1#
           (PROGN
            (SETQ |$trace_names|
                    (CONS (CONS |domain| |sigSlotNumberAlist|) |$trace_names|))
            (|spadReply|)))))))))))
(DEFUN |spadTrace,isTraceable| (|x| |domain|)
  (PROG (|n| |functionSlot|)
    (RETURN
     (PROGN
      (SETQ |n| (CADDR |x|))
      (COND ((ATOM (ELT |domain| |n|)) NIL)
            (#1='T
             (PROGN
              (SETQ |functionSlot| (CAR (ELT |domain| |n|)))
              (COND
               ((GENSYMP |functionSlot|)
                (PROGN (|reportSpadTrace| "Already Traced" |x|) NIL))
               ((NULL (BPINAME |functionSlot|))
                (PROGN (|reportSpadTrace| "No function for" |x|) NIL))
               (#1# T)))))))))
(DEFUN |spadTrace,g| (|x|)
  (PROG () (RETURN (COND ((STRINGP |x|) (INTERN |x|)) ('T |x|)))))

; goGetTracer(l, dn, f, tlst, alias, options, modemap) ==
;     rplac(first dn, f)
;     [:arglist, env] := l
;     slot := replaceGoGetSlot env
;     tlst.4 := first slot
;     nf := BPITRACE(first slot, alias, modemap, options)
;     rplac(first slot, nf)
;     APPLY(first slot, [:arglist, rest slot])  --SPADCALL it!

(DEFUN |goGetTracer| (|l| |dn| |f| |tlst| |alias| |options| |modemap|)
  (PROG (|LETTMP#1| |env| |arglist| |slot| |nf|)
    (RETURN
     (PROGN
      (|rplac| (CAR |dn|) |f|)
      (SETQ |LETTMP#1| (REVERSE |l|))
      (SETQ |env| (CAR |LETTMP#1|))
      (SETQ |arglist| (NREVERSE (CDR |LETTMP#1|)))
      (SETQ |slot| (|replaceGoGetSlot| |env|))
      (SETF (ELT |tlst| 4) (CAR |slot|))
      (SETQ |nf| (BPITRACE (CAR |slot|) |alias| |modemap| |options|))
      (|rplac| (CAR |slot|) |nf|)
      (APPLY (CAR |slot|) (APPEND |arglist| (CONS (CDR |slot|) NIL)))))))

; traceDomainLocalOps(dom,lops,options) ==
;  sayMSG ['"  ",'"The )local option has been withdrawn"]
;  sayMSG ['"  ",'"Use )ltr to trace local functions."]
;  NIL

(DEFUN |traceDomainLocalOps| (|dom| |lops| |options|)
  (PROG ()
    (RETURN
     (PROGN
      (|sayMSG| (LIST "  " "The )local option has been withdrawn"))
      (|sayMSG| (LIST "  " "Use )ltr to trace local functions."))
      NIL))))

; untraceDomainLocalOps(dom,lops) ==
;  sayMSG ['"  ",:bright abb,'"has no local functions to untrace."]
;  NIL

(DEFUN |untraceDomainLocalOps| (|dom| |lops|)
  (PROG ()
    (RETURN
     (PROGN
      (|sayMSG|
       (CONS "  "
             (APPEND (|bright| |abb|)
                     (CONS "has no local functions to untrace." NIL))))
      NIL))))

; untraceAllDomainLocalOps(dom) == NIL

(DEFUN |untraceAllDomainLocalOps| (|dom|) (PROG () (RETURN NIL)))

; traceDomainConstructor(domainConstructor,options) ==
;   -- Trace all domains built with the given domain constructor,
;   -- including all presently instantiated domains, and all future
;   -- instantiations, while domain constructor is traced.
;   loadFunctor domainConstructor
;   listOfLocalOps := getOption("LOCAL",options)
;   if listOfLocalOps then
;     traceDomainLocalOps(domainConstructor,listOfLocalOps,
;       [opt for opt in options | opt isnt ['LOCAL,:.]])
;   listOfLocalOps and not getOption("OPS",options) => NIL
;   for [argl,.,:domain] in HGET($ConstructorCache,domainConstructor)
;     repeat spadTrace(domain,options)
;   $trace_names := [domainConstructor, :$trace_names]
;   innerDomainConstructor := INTERN STRCONC(domainConstructor,'";")
;   if FBOUNDP innerDomainConstructor then domainConstructor := innerDomainConstructor
;   EMBED(domainConstructor,
;     ['LAMBDA, ['_&REST, 'args],
;       ['PROG, ['domain],
;         ['SETQ,'domain,['APPLY,domainConstructor,'args]],
;         ['spadTrace,'domain,MKQ options],
;         ['RETURN,'domain]]] )

(DEFUN |traceDomainConstructor| (|domainConstructor| |options|)
  (PROG (|listOfLocalOps| |argl| |ISTMP#1| |domain| |innerDomainConstructor|)
    (RETURN
     (PROGN
      (|loadFunctor| |domainConstructor|)
      (SETQ |listOfLocalOps| (|getOption| 'LOCAL |options|))
      (COND
       (|listOfLocalOps|
        (|traceDomainLocalOps| |domainConstructor| |listOfLocalOps|
         ((LAMBDA (|bfVar#71| |bfVar#70| |opt|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#70|) (PROGN (SETQ |opt| (CAR |bfVar#70|)) NIL))
               (RETURN (NREVERSE |bfVar#71|)))
              (#1='T
               (AND (NOT (AND (CONSP |opt|) (EQ (CAR |opt|) 'LOCAL)))
                    (SETQ |bfVar#71| (CONS |opt| |bfVar#71|)))))
             (SETQ |bfVar#70| (CDR |bfVar#70|))))
          NIL |options| NIL))))
      (COND ((AND |listOfLocalOps| (NULL (|getOption| 'OPS |options|))) NIL)
            (#1#
             (PROGN
              ((LAMBDA (|bfVar#73| |bfVar#72|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#73|)
                        (PROGN (SETQ |bfVar#72| (CAR |bfVar#73|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#72|)
                         (PROGN
                          (SETQ |argl| (CAR |bfVar#72|))
                          (SETQ |ISTMP#1| (CDR |bfVar#72|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN (SETQ |domain| (CDR |ISTMP#1|)) #1#)))
                         (|spadTrace| |domain| |options|))))
                  (SETQ |bfVar#73| (CDR |bfVar#73|))))
               (HGET |$ConstructorCache| |domainConstructor|) NIL)
              (SETQ |$trace_names| (CONS |domainConstructor| |$trace_names|))
              (SETQ |innerDomainConstructor|
                      (INTERN (STRCONC |domainConstructor| ";")))
              (COND
               ((FBOUNDP |innerDomainConstructor|)
                (SETQ |domainConstructor| |innerDomainConstructor|)))
              (EMBED |domainConstructor|
               (LIST 'LAMBDA (LIST '&REST '|args|)
                     (LIST 'PROG (LIST '|domain|)
                           (LIST 'SETQ '|domain|
                                 (LIST 'APPLY |domainConstructor| '|args|))
                           (LIST '|spadTrace| '|domain| (MKQ |options|))
                           (LIST 'RETURN '|domain|)))))))))))

; untraceDomainConstructor domainConstructor ==
;   --untrace all the domains in domainConstructor, and unembed it
;   $trace_names :=
;     [df for df in $trace_names | keepTraced?(df, domainConstructor)] where
;       keepTraced?(df, domainConstructor) ==
;         (df is [dc,:.]) and (isDomainOrPackage dc) and
;            ((IFCAR devaluate dc) = domainConstructor) =>
;                untrace2(dc, [])
;                false
;         true
;   untraceAllDomainLocalOps domainConstructor
;   innerDomainConstructor := INTERN STRCONC(domainConstructor,'";")
;   if FBOUNDP innerDomainConstructor then UNEMBED innerDomainConstructor
;     else UNEMBED domainConstructor
;   $trace_names := delete(domainConstructor, $trace_names)

(DEFUN |untraceDomainConstructor| (|domainConstructor|)
  (PROG (|innerDomainConstructor|)
    (RETURN
     (PROGN
      (SETQ |$trace_names|
              ((LAMBDA (|bfVar#75| |bfVar#74| |df|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#74|)
                        (PROGN (SETQ |df| (CAR |bfVar#74|)) NIL))
                    (RETURN (NREVERSE |bfVar#75|)))
                   (#1='T
                    (AND
                     (|untraceDomainConstructor,keepTraced?| |df|
                      |domainConstructor|)
                     (SETQ |bfVar#75| (CONS |df| |bfVar#75|)))))
                  (SETQ |bfVar#74| (CDR |bfVar#74|))))
               NIL |$trace_names| NIL))
      (|untraceAllDomainLocalOps| |domainConstructor|)
      (SETQ |innerDomainConstructor|
              (INTERN (STRCONC |domainConstructor| ";")))
      (COND
       ((FBOUNDP |innerDomainConstructor|) (UNEMBED |innerDomainConstructor|))
       (#1# (UNEMBED |domainConstructor|)))
      (SETQ |$trace_names| (|delete| |domainConstructor| |$trace_names|))))))
(DEFUN |untraceDomainConstructor,keepTraced?| (|df| |domainConstructor|)
  (PROG (|dc|)
    (RETURN
     (COND
      ((AND (CONSP |df|) (PROGN (SETQ |dc| (CAR |df|)) #1='T)
            (|isDomainOrPackage| |dc|)
            (EQUAL (IFCAR (|devaluate| |dc|)) |domainConstructor|))
       (PROGN (|untrace2| |dc| NIL) NIL))
      (#1# T)))))

; flattenOperationAlist(opAlist) ==
;    res:= nil
;    for [op,:mmList] in opAlist repeat
;      res:=[:res,:[[op,:mm] for mm in mmList]]
;    res

(DEFUN |flattenOperationAlist| (|opAlist|)
  (PROG (|res| |op| |mmList|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#77| |bfVar#76|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#77|)
                (PROGN (SETQ |bfVar#76| (CAR |bfVar#77|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#76|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#76|))
                  (SETQ |mmList| (CDR |bfVar#76|))
                  #1#)
                 (SETQ |res|
                         (APPEND |res|
                                 ((LAMBDA (|bfVar#79| |bfVar#78| |mm|)
                                    (LOOP
                                     (COND
                                      ((OR (ATOM |bfVar#78|)
                                           (PROGN
                                            (SETQ |mm| (CAR |bfVar#78|))
                                            NIL))
                                       (RETURN (NREVERSE |bfVar#79|)))
                                      (#1#
                                       (SETQ |bfVar#79|
                                               (CONS (CONS |op| |mm|)
                                                     |bfVar#79|))))
                                     (SETQ |bfVar#78| (CDR |bfVar#78|))))
                                  NIL |mmList| NIL))))))
          (SETQ |bfVar#77| (CDR |bfVar#77|))))
       |opAlist| NIL)
      |res|))))

; mapLetPrint(x,val,currentFunction) ==
;   x:= getAliasIfTracedMapParameter(x,currentFunction)
;   currentFunction:= getBpiNameIfTracedMap currentFunction
;   letPrint(x,val,currentFunction)

(DEFUN |mapLetPrint| (|x| |val| |currentFunction|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |x| (|getAliasIfTracedMapParameter| |x| |currentFunction|))
      (SETQ |currentFunction| (|getBpiNameIfTracedMap| |currentFunction|))
      (|letPrint| |x| |val| |currentFunction|)))))

; letPrint(x,val,currentFunction) ==
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          sayBrightlyNT [:bright x,'": "]
;          PRIN1(shortenForPrinting(val))
;          TERPRI()
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,'":= ",
;               shortenForPrinting val]
;   val

(DEFUN |letPrint| (|x| |val| |currentFunction|)
  (PROG (|y|)
    (RETURN
     (PROGN
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (|sayBrightlyNT| (APPEND (|bright| |x|) (CONS ": " NIL)))
          (PRIN1 (|shortenForPrinting| |val|)) (TERPRI)))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS ":= "
                                       (CONS (|shortenForPrinting| |val|)
                                             NIL))))))))))
      |val|))))

; letPrint2(x,printform,currentFunction) ==
;   $BreakMode:local := nil
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          $BreakMode:='letPrint2
;          flag := CATCH('letPrint2, mathprint ["=",x,printform], true)
;          if not(flag) then PRINT(printform)
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,'":= ",
;               printform]
;   x

(DEFUN |letPrint2| (|x| |printform| |currentFunction|)
  (PROG (|$BreakMode| |flag| |y|)
    (DECLARE (SPECIAL |$BreakMode|))
    (RETURN
     (PROGN
      (SETQ |$BreakMode| NIL)
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (SETQ |$BreakMode| '|letPrint2|)
          (SETQ |flag|
                  (CATCH '|letPrint2|
                    (|mathprint| (LIST '= |x| |printform|))
                    T))
          (COND ((NULL |flag|) (PRINT |printform|)))))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS ":= " (CONS |printform| NIL))))))))))
      |x|))))

; letPrint3(x,xval,printfn,currentFunction) ==
;   $BreakMode:local := nil
;   if $letAssoc and
;     ((y:= LASSOC(currentFunction,$letAssoc)) or (y:= LASSOC("all",$letAssoc))) then
;       if (y="all" or MEMQ(x,y)) and
;         not (IS_GENVAR(x) or isSharpVarWithNum(x) or GENSYMP x) then
;          $BreakMode:='letPrint2
;          flag := CATCH('letPrint2,
;                        mathprint ["=", x, SPADCALL(xval, printfn)], true)
;          if not(flag) then PRINT(xval)
;       if (y:= hasPair("BREAK",y)) and
;         (y="all" or MEMQ(x,y) and
;           (not MEMQ((PNAME x).(0),'($ _#)) and not GENSYMP x)) then
;             break [:bright currentFunction,'"breaks after",:bright x,'":= ",
;               xval]
;   x

(DEFUN |letPrint3| (|x| |xval| |printfn| |currentFunction|)
  (PROG (|$BreakMode| |flag| |y|)
    (DECLARE (SPECIAL |$BreakMode|))
    (RETURN
     (PROGN
      (SETQ |$BreakMode| NIL)
      (COND
       ((AND |$letAssoc|
             (OR (SETQ |y| (LASSOC |currentFunction| |$letAssoc|))
                 (SETQ |y| (LASSOC '|all| |$letAssoc|))))
        (COND
         ((AND (OR (EQ |y| '|all|) (MEMQ |x| |y|))
               (NULL
                (OR (IS_GENVAR |x|) (|isSharpVarWithNum| |x|) (GENSYMP |x|))))
          (SETQ |$BreakMode| '|letPrint2|)
          (SETQ |flag|
                  (CATCH '|letPrint2|
                    (|mathprint| (LIST '= |x| (SPADCALL |xval| |printfn|)))
                    T))
          (COND ((NULL |flag|) (PRINT |xval|)))))
        (COND
         ((AND (SETQ |y| (|hasPair| 'BREAK |y|))
               (OR (EQ |y| '|all|)
                   (AND (MEMQ |x| |y|)
                        (NULL (MEMQ (ELT (PNAME |x|) 0) '($ |#|)))
                        (NULL (GENSYMP |x|)))))
          (|break|
           (APPEND (|bright| |currentFunction|)
                   (CONS "breaks after"
                         (APPEND (|bright| |x|)
                                 (CONS ":= " (CONS |xval| NIL))))))))))
      |x|))))

; getAliasIfTracedMapParameter(x,currentFunction) ==
;   isSharpVarWithNum x =>
;     aliasList := getI(currentFunction, 'alias) =>
;       aliasList.(STRING2PINT_-N(SUBSTRING(PNAME x,1,NIL),1)-1)
;   x

(DEFUN |getAliasIfTracedMapParameter| (|x| |currentFunction|)
  (PROG (|aliasList|)
    (RETURN
     (COND
      ((|isSharpVarWithNum| |x|)
       (COND
        ((SETQ |aliasList| (|getI| |currentFunction| '|alias|))
         (IDENTITY
          (ELT |aliasList|
               (- (STRING2PINT-N (SUBSTRING (PNAME |x|) 1 NIL) 1) 1))))))
      ('T |x|)))))

; getBpiNameIfTracedMap(name) ==
;   lmm := getI(name, 'localModemap) =>
;       MEMQ(bpiName := CADAR lmm, $trace_names) => bpiName
;   name

(DEFUN |getBpiNameIfTracedMap| (|name|)
  (PROG (|lmm| |bpiName|)
    (RETURN
     (COND
      ((SETQ |lmm| (|getI| |name| '|localModemap|))
       (COND
        ((MEMQ (SETQ |bpiName| (CADAR |lmm|)) |$trace_names|)
         (IDENTITY |bpiName|))))
      ('T |name|)))))

; hasPair(key,l) ==
;   atom l => nil
;   l is [[ =key,:a],:.] => a
;   hasPair(key,rest l)

(DEFUN |hasPair| (|key| |l|)
  (PROG (|ISTMP#1| |a|)
    (RETURN
     (COND ((ATOM |l|) NIL)
           ((AND (CONSP |l|)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |l|))
                  (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |key|)
                       (PROGN (SETQ |a| (CDR |ISTMP#1|)) #1='T))))
            |a|)
           (#1# (|hasPair| |key| (CDR |l|)))))))

; shortenForPrinting val ==
;   isDomainOrPackage val => devaluate val
;   val

(DEFUN |shortenForPrinting| (|val|)
  (PROG ()
    (RETURN
     (COND ((|isDomainOrPackage| |val|) (|devaluate| |val|)) ('T |val|)))))

; spadTraceAlias(domainId,op,n) ==
;   INTERN(CONCAT(domainId, '".", op, '",", STRINGIMAGE(n)))

(DEFUN |spadTraceAlias| (|domainId| |op| |n|)
  (PROG ()
    (RETURN (INTERN (CONCAT |domainId| "." |op| "," (STRINGIMAGE |n|))))))

; getOption(opt,l) ==
;   y:= assoc(opt,l) => rest y

(DEFUN |getOption| (|opt| |l|)
  (PROG (|y|)
    (RETURN (COND ((SETQ |y| (|assoc| |opt| |l|)) (IDENTITY (CDR |y|)))))))

; reportSpadTrace(header,[op,sig,n,:t]) ==
;   null $traceNoisely => nil
;   msg:= [header,'%b,op,'":",'%d,rest sig,'" -> ",first sig,'" in slot ",n]
;   namePart:= nil --(t is (.,.,name,:.) => (" named ",name); NIL)
;   tracePart:=
;     t is [y,:.] and not null y =>
;       (y="all" => ['%b,'"all",'%d,'"vars"]; ['" vars: ",y])
;     NIL
;   sayBrightly [:msg,:namePart,:tracePart]

(DEFUN |reportSpadTrace| (|header| |bfVar#80|)
  (PROG (|op| |sig| |n| |t| |msg| |namePart| |y| |tracePart|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#80|))
      (SETQ |sig| (CADR . #1=(|bfVar#80|)))
      (SETQ |n| (CADDR . #1#))
      (SETQ |t| (CDDDR . #1#))
      (COND ((NULL |$traceNoisely|) NIL)
            (#2='T
             (PROGN
              (SETQ |msg|
                      (LIST |header| '|%b| |op| ":" '|%d| (CDR |sig|) " -> "
                            (CAR |sig|) " in slot " |n|))
              (SETQ |namePart| NIL)
              (SETQ |tracePart|
                      (COND
                       ((AND (CONSP |t|) (PROGN (SETQ |y| (CAR |t|)) #2#)
                             (NULL (NULL |y|)))
                        (COND ((EQ |y| '|all|) (LIST '|%b| "all" '|%d| "vars"))
                              (#2# (LIST " vars: " |y|))))
                       (#2# NIL)))
              (|sayBrightly|
               (APPEND |msg| (APPEND |namePart| |tracePart|))))))))))

; orderBySlotNumber l ==
;   ASSOCRIGHT orderList [[n,:x] for (x:= [.,.,n,:.]) in l]

(DEFUN |orderBySlotNumber| (|l|)
  (PROG (|ISTMP#1| |ISTMP#2| |n|)
    (RETURN
     (ASSOCRIGHT
      (|orderList|
       ((LAMBDA (|bfVar#82| |bfVar#81| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#81|) (PROGN (SETQ |x| (CAR |bfVar#81|)) NIL))
             (RETURN (NREVERSE |bfVar#82|)))
            (#1='T
             (AND (CONSP |x|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN (SETQ |n| (CAR |ISTMP#2|)) #1#)))))
                  (SETQ |bfVar#82| (CONS (CONS |n| |x|) |bfVar#82|)))))
           (SETQ |bfVar#81| (CDR |bfVar#81|))))
        NIL |l| NIL))))))

; spadReply() ==
;   [printName x for x in $trace_names] where
;     printName x ==
;       x is [d,:.] and isDomainOrPackage d => devaluate d
;       x

(DEFUN |spadReply| ()
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#84| |bfVar#83| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#83|) (PROGN (SETQ |x| (CAR |bfVar#83|)) NIL))
           (RETURN (NREVERSE |bfVar#84|)))
          ('T (SETQ |bfVar#84| (CONS (|spadReply,printName| |x|) |bfVar#84|))))
         (SETQ |bfVar#83| (CDR |bfVar#83|))))
      NIL |$trace_names| NIL))))
(DEFUN |spadReply,printName| (|x|)
  (PROG (|d|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) #1='T)
            (|isDomainOrPackage| |d|))
       (|devaluate| |d|))
      (#1# |x|)))))

; spadUntrace(domain,options) ==
;   not isDomainOrPackage domain => userError '"bad argument to untrace"
;   anyifTrue:= null options
;   listOfOperations:= getOption("ops:",options)
;   domainId := devaluate domain
;   null (pair := assoc(domain, $trace_names)) =>
;     sayMSG ['"   No functions in",
;       :bright prefix2String domainId,'"are now traced."]
;   sigSlotNumberAlist:= rest pair
;   for (pair := [op, sig, n, lv, bpiPointer]) in sigSlotNumberAlist |
;     anyifTrue or MEMQ(op,listOfOperations) repeat
;       rplac(first domain.n, bpiPointer)
;       rplac(CDDDR pair, nil)
;       if assoc(key := BPINAME bpiPointer, $letAssoc) then
;                 $letAssoc := assoc_del(key, $letAssoc)
;   newSigSlotNumberAlist:= [x for x in sigSlotNumberAlist | CDDDR x]
;   newSigSlotNumberAlist => rplac(rest pair, newSigSlotNumberAlist)
;   $trace_names := DELASC(domain, $trace_names)
;   spadReply()

(DEFUN |spadUntrace| (|domain| |options|)
  (PROG (|anyifTrue| |listOfOperations| |domainId| |pair| |sigSlotNumberAlist|
         |op| |ISTMP#1| |sig| |ISTMP#2| |n| |ISTMP#3| |lv| |ISTMP#4|
         |bpiPointer| |key| |newSigSlotNumberAlist|)
    (RETURN
     (COND
      ((NULL (|isDomainOrPackage| |domain|))
       (|userError| "bad argument to untrace"))
      (#1='T
       (PROGN
        (SETQ |anyifTrue| (NULL |options|))
        (SETQ |listOfOperations| (|getOption| '|ops:| |options|))
        (SETQ |domainId| (|devaluate| |domain|))
        (COND
         ((NULL (SETQ |pair| (|assoc| |domain| |$trace_names|)))
          (|sayMSG|
           (CONS "   No functions in"
                 (APPEND (|bright| (|prefix2String| |domainId|))
                         (CONS "are now traced." NIL)))))
         (#1#
          (PROGN
           (SETQ |sigSlotNumberAlist| (CDR |pair|))
           ((LAMBDA (|bfVar#85| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#85|)
                     (PROGN (SETQ |pair| (CAR |bfVar#85|)) NIL))
                 (RETURN NIL))
                (#1#
                 (AND (CONSP |pair|)
                      (PROGN
                       (SETQ |op| (CAR |pair|))
                       (SETQ |ISTMP#1| (CDR |pair|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |sig| (CAR |ISTMP#1|))
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|)
                                  (PROGN
                                   (SETQ |n| (CAR |ISTMP#2|))
                                   (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                   (AND (CONSP |ISTMP#3|)
                                        (PROGN
                                         (SETQ |lv| (CAR |ISTMP#3|))
                                         (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                         (AND (CONSP |ISTMP#4|)
                                              (EQ (CDR |ISTMP#4|) NIL)
                                              (PROGN
                                               (SETQ |bpiPointer|
                                                       (CAR |ISTMP#4|))
                                               #1#)))))))))
                      (OR |anyifTrue| (MEMQ |op| |listOfOperations|))
                      (PROGN
                       (|rplac| (CAR (ELT |domain| |n|)) |bpiPointer|)
                       (|rplac| (CDDDR |pair|) NIL)
                       (COND
                        ((|assoc| (SETQ |key| (BPINAME |bpiPointer|))
                          |$letAssoc|)
                         (SETQ |$letAssoc|
                                 (|assoc_del| |key| |$letAssoc|))))))))
               (SETQ |bfVar#85| (CDR |bfVar#85|))))
            |sigSlotNumberAlist| NIL)
           (SETQ |newSigSlotNumberAlist|
                   ((LAMBDA (|bfVar#87| |bfVar#86| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#86|)
                             (PROGN (SETQ |x| (CAR |bfVar#86|)) NIL))
                         (RETURN (NREVERSE |bfVar#87|)))
                        (#1#
                         (AND (CDDDR |x|)
                              (SETQ |bfVar#87| (CONS |x| |bfVar#87|)))))
                       (SETQ |bfVar#86| (CDR |bfVar#86|))))
                    NIL |sigSlotNumberAlist| NIL))
           (COND
            (|newSigSlotNumberAlist|
             (|rplac| (CDR |pair|) |newSigSlotNumberAlist|))
            (#1#
             (PROGN
              (SETQ |$trace_names| (DELASC |domain| |$trace_names|))
              (|spadReply|)))))))))))))

; prTraceNames() ==
;   (for x in $trace_names repeat PRINT fn x; nil) where
;     fn x ==
;       x is [d,:t] and isDomainOrPackage d => [devaluate d,:t]
;       x

(DEFUN |prTraceNames| ()
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#88| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#88|) (PROGN (SETQ |x| (CAR |bfVar#88|)) NIL))
            (RETURN NIL))
           ('T (PRINT (|prTraceNames,fn| |x|))))
          (SETQ |bfVar#88| (CDR |bfVar#88|))))
       |$trace_names| NIL)
      NIL))))
(DEFUN |prTraceNames,fn| (|x|)
  (PROG (|d| |t|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) (SETQ |t| (CDR |x|)) #1='T)
            (|isDomainOrPackage| |d|))
       (CONS (|devaluate| |d|) |t|))
      (#1# |x|)))))

; traceReply() ==
;   $domains: local:= nil
;   $packages: local:= nil
;   $constructors: local:= nil
;   null $trace_names =>
;     sayMessage '"   Nothing is traced now."
;   sayBrightly '" "
;   for x in $trace_names repeat
;     x is [d,:.] and (isDomainOrPackage d) => addTraceItem d
;     atom x =>
;       isFunctor x => addTraceItem x
;       (IS_GENVAR x =>
;         addTraceItem EVAL x; functionList:= [x,:functionList])
;     userError '"bad argument to trace"
;   functionList:= "append"/[[rassocSub(x,$mapSubNameAlist),'" "]
;     for x in functionList | not isSubForRedundantMapName x]
;   if functionList then
;     2 = #functionList =>
;       sayMSG ['"   Function traced: ",:functionList]
;     (22 + sayBrightlyLength functionList) <= $LINELENGTH =>
;       sayMSG ['"   Functions traced: ",:functionList]
;     sayBrightly '"   Functions traced:"
;     sayBrightly flowSegmentedMsg(functionList,$LINELENGTH,6)
;   if $domains then
;     displayList:= concat(prefix2String first $domains,
;           [:concat('", ",prefix2String x) for x in rest $domains])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Domains traced: "
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)
;   if $packages then
;     displayList:= concat(prefix2String first $packages,
;           [:concat('", ",prefix2String x) for x in rest $packages])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Packages traced: "
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)
;   if $constructors then
;     displayList:= concat(abbreviate first $constructors,
;           [:concat('", ",abbreviate x) for x in rest $constructors])
;     if atom displayList then displayList:= [displayList]
;     sayBrightly '"   Parameterized constructors traced:"
;     sayBrightly flowSegmentedMsg(displayList,$LINELENGTH,6)

(DEFUN |traceReply| ()
  (PROG (|$constructors| |$packages| |$domains| |d| |functionList|
         |displayList|)
    (DECLARE (SPECIAL |$constructors| |$packages| |$domains|))
    (RETURN
     (PROGN
      (SETQ |$domains| NIL)
      (SETQ |$packages| NIL)
      (SETQ |$constructors| NIL)
      (COND ((NULL |$trace_names|) (|sayMessage| "   Nothing is traced now."))
            (#1='T
             (PROGN
              (|sayBrightly| " ")
              ((LAMBDA (|bfVar#89| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#89|)
                        (PROGN (SETQ |x| (CAR |bfVar#89|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (COND
                     ((AND (CONSP |x|) (PROGN (SETQ |d| (CAR |x|)) #1#)
                           (|isDomainOrPackage| |d|))
                      (|addTraceItem| |d|))
                     ((ATOM |x|)
                      (COND ((|isFunctor| |x|) (|addTraceItem| |x|))
                            (#1#
                             (COND
                              ((IS_GENVAR |x|) (|addTraceItem| (EVAL |x|)))
                              (#1#
                               (SETQ |functionList|
                                       (CONS |x| |functionList|)))))))
                     (#1# (|userError| "bad argument to trace")))))
                  (SETQ |bfVar#89| (CDR |bfVar#89|))))
               |$trace_names| NIL)
              (SETQ |functionList|
                      ((LAMBDA (|bfVar#91| |bfVar#90| |x|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#90|)
                                (PROGN (SETQ |x| (CAR |bfVar#90|)) NIL))
                            (RETURN |bfVar#91|))
                           (#1#
                            (AND (NULL (|isSubForRedundantMapName| |x|))
                                 (SETQ |bfVar#91|
                                         (APPEND |bfVar#91|
                                                 (LIST
                                                  (|rassocSub| |x|
                                                   |$mapSubNameAlist|)
                                                  " "))))))
                          (SETQ |bfVar#90| (CDR |bfVar#90|))))
                       NIL |functionList| NIL))
              (COND
               (|functionList|
                (COND
                 ((EQL 2 (LENGTH |functionList|))
                  (|sayMSG| (CONS "   Function traced: " |functionList|)))
                 ((NOT
                   (< $LINELENGTH (+ 22 (|sayBrightlyLength| |functionList|))))
                  (|sayMSG| (CONS "   Functions traced: " |functionList|)))
                 (#1#
                  (PROGN
                   (|sayBrightly| "   Functions traced:")
                   (|sayBrightly|
                    (|flowSegmentedMsg| |functionList| $LINELENGTH 6)))))))
              (COND
               (|$domains|
                (SETQ |displayList|
                        (|concat| (|prefix2String| (CAR |$domains|))
                         ((LAMBDA (|bfVar#93| |bfVar#92| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#92|)
                                   (PROGN (SETQ |x| (CAR |bfVar#92|)) NIL))
                               (RETURN (NREVERSE |bfVar#93|)))
                              (#1#
                               (SETQ |bfVar#93|
                                       (APPEND
                                        (REVERSE
                                         (|concat| ", " (|prefix2String| |x|)))
                                        |bfVar#93|))))
                             (SETQ |bfVar#92| (CDR |bfVar#92|))))
                          NIL (CDR |$domains|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Domains traced: ")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6))))
              (COND
               (|$packages|
                (SETQ |displayList|
                        (|concat| (|prefix2String| (CAR |$packages|))
                         ((LAMBDA (|bfVar#95| |bfVar#94| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#94|)
                                   (PROGN (SETQ |x| (CAR |bfVar#94|)) NIL))
                               (RETURN (NREVERSE |bfVar#95|)))
                              (#1#
                               (SETQ |bfVar#95|
                                       (APPEND
                                        (REVERSE
                                         (|concat| ", " (|prefix2String| |x|)))
                                        |bfVar#95|))))
                             (SETQ |bfVar#94| (CDR |bfVar#94|))))
                          NIL (CDR |$packages|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Packages traced: ")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6))))
              (COND
               (|$constructors|
                (SETQ |displayList|
                        (|concat| (|abbreviate| (CAR |$constructors|))
                         ((LAMBDA (|bfVar#97| |bfVar#96| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#96|)
                                   (PROGN (SETQ |x| (CAR |bfVar#96|)) NIL))
                               (RETURN (NREVERSE |bfVar#97|)))
                              (#1#
                               (SETQ |bfVar#97|
                                       (APPEND
                                        (REVERSE
                                         (|concat| ", " (|abbreviate| |x|)))
                                        |bfVar#97|))))
                             (SETQ |bfVar#96| (CDR |bfVar#96|))))
                          NIL (CDR |$constructors|) NIL)))
                (COND
                 ((ATOM |displayList|)
                  (SETQ |displayList| (LIST |displayList|))))
                (|sayBrightly| "   Parameterized constructors traced:")
                (|sayBrightly|
                 (|flowSegmentedMsg| |displayList| $LINELENGTH 6)))))))))))

; addTraceItem d ==
;   constructor? d => $constructors:=[d,:$constructors]
;   isDomain d => $domains:= [devaluate d,:$domains]
;   isDomainOrPackage d => $packages:= [devaluate d,:$packages]

(DEFUN |addTraceItem| (|d|)
  (PROG ()
    (RETURN
     (COND
      ((|constructor?| |d|) (SETQ |$constructors| (CONS |d| |$constructors|)))
      ((|isDomain| |d|) (SETQ |$domains| (CONS (|devaluate| |d|) |$domains|)))
      ((|isDomainOrPackage| |d|)
       (SETQ |$packages| (CONS (|devaluate| |d|) |$packages|)))))))

; _?t() ==
;   null $trace_names => sayMSG bright '"nothing is traced"
;   for x in $trace_names | atom x and not IS_GENVAR x repeat
;     if llm := getI(x, 'localModemap) then
;       x:= (LIST (CADAR llm))
;     sayMSG ['"Function",:bright rassocSub(x,$mapSubNameAlist),'"traced"]
;   for x in $trace_names | x is [d, :l] and isDomainOrPackage d repeat
;     suffix:=
;       isDomain d => '"domain"
;       '"package"
;     sayBrightly ['"   Functions traced in ",suffix,'%b,devaluate d,'%d,":"]
;     for x in orderBySlotNumber l repeat reportSpadTrace('"   ",take(4,x))
;     TERPRI()

(DEFUN |?t| ()
  (PROG (|suffix| |l| |d| |llm|)
    (RETURN
     (COND ((NULL |$trace_names|) (|sayMSG| (|bright| "nothing is traced")))
           (#1='T
            (PROGN
             ((LAMBDA (|bfVar#98| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#98|)
                       (PROGN (SETQ |x| (CAR |bfVar#98|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (ATOM |x|) (NULL (IS_GENVAR |x|))
                        (PROGN
                         (COND
                          ((SETQ |llm| (|getI| |x| '|localModemap|))
                           (SETQ |x| (LIST (CADAR |llm|)))))
                         (|sayMSG|
                          (CONS "Function"
                                (APPEND
                                 (|bright|
                                  (|rassocSub| |x| |$mapSubNameAlist|))
                                 (CONS "traced" NIL))))))))
                 (SETQ |bfVar#98| (CDR |bfVar#98|))))
              |$trace_names| NIL)
             ((LAMBDA (|bfVar#99| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#99|)
                       (PROGN (SETQ |x| (CAR |bfVar#99|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |x|)
                        (PROGN (SETQ |d| (CAR |x|)) (SETQ |l| (CDR |x|)) #1#)
                        (|isDomainOrPackage| |d|)
                        (PROGN
                         (SETQ |suffix|
                                 (COND ((|isDomain| |d|) "domain")
                                       (#1# "package")))
                         (|sayBrightly|
                          (LIST "   Functions traced in " |suffix| '|%b|
                                (|devaluate| |d|) '|%d| '|:|))
                         ((LAMBDA (|bfVar#100| |x|)
                            (LOOP
                             (COND
                              ((OR (ATOM |bfVar#100|)
                                   (PROGN (SETQ |x| (CAR |bfVar#100|)) NIL))
                               (RETURN NIL))
                              (#1# (|reportSpadTrace| "   " (TAKE 4 |x|))))
                             (SETQ |bfVar#100| (CDR |bfVar#100|))))
                          (|orderBySlotNumber| |l|) NIL)
                         (TERPRI)))))
                 (SETQ |bfVar#99| (CDR |bfVar#99|))))
              |$trace_names| NIL)))))))

; tracelet(fn, bin_def, vars) ==
;   if bin_def and stupidIsSpadFunction bin_def then
;     if COMPILED_-FUNCTION_-P bin_def then fn := BPINAME bin_def
;   fn = 'Undef => nil
;   vars:=
;     vars="all" => "all"
;     l:= LASSOC(fn,$letAssoc) => union(vars,l)
;     vars
;   $letAssoc:= [[fn,:vars],:$letAssoc]
;   $TRACELETFLAG : local := true
;   $QuickLet : local := false
;   not MEMQ(fn, $traceletFunctions) and not IS_GENVAR fn and COMPILED_-FUNCTION_-P SYMBOL_-FUNCTION fn
;     and not stupidIsSpadFunction fn and not GENSYMP fn =>
;       ($traceletFunctions:= [fn,:$traceletFunctions]; compileBoot fn ;
;        $traceletFunctions:= delete(fn,$traceletFunctions) )

(DEFUN |tracelet| (|fn| |bin_def| |vars|)
  (PROG (|$QuickLet| $TRACELETFLAG |l|)
    (DECLARE (SPECIAL |$QuickLet| $TRACELETFLAG))
    (RETURN
     (PROGN
      (COND
       ((AND |bin_def| (|stupidIsSpadFunction| |bin_def|))
        (COND
         ((COMPILED-FUNCTION-P |bin_def|) (SETQ |fn| (BPINAME |bin_def|))))))
      (COND ((EQ |fn| '|Undef|) NIL)
            (#1='T
             (PROGN
              (SETQ |vars|
                      (COND ((EQ |vars| '|all|) '|all|)
                            ((SETQ |l| (LASSOC |fn| |$letAssoc|))
                             (|union| |vars| |l|))
                            (#1# |vars|)))
              (SETQ |$letAssoc| (CONS (CONS |fn| |vars|) |$letAssoc|))
              (SETQ $TRACELETFLAG T)
              (SETQ |$QuickLet| NIL)
              (COND
               ((AND (NULL (MEMQ |fn| |$traceletFunctions|))
                     (NULL (IS_GENVAR |fn|))
                     (COMPILED-FUNCTION-P (SYMBOL-FUNCTION |fn|))
                     (NULL (|stupidIsSpadFunction| |fn|))
                     (NULL (GENSYMP |fn|)))
                (PROGN
                 (SETQ |$traceletFunctions| (CONS |fn| |$traceletFunctions|))
                 (|compileBoot| |fn|)
                 (SETQ |$traceletFunctions|
                         (|delete| |fn| |$traceletFunctions|))))))))))))

; breaklet(fn, bin_def, vars) ==
;                        --vars is "all" or a list of variables
;   --$letAssoc ==> (.. (=fn .. (BREAK . all))) OR (.. (=fn .. (BREAK . vl)))
;   if bin_def and stupidIsSpadFunction bin_def then
;     if COMPILED_-FUNCTION_-P bin_def then fn := BPINAME bin_def
;   fn = "Undef" => nil
;   fnEntry:= LASSOC(fn,$letAssoc)
;   vars:=
;     pair:= assoc("BREAK",fnEntry) => union(vars,rest pair)
;     vars
;   $letAssoc:=
;     null fnEntry => [[fn,:LIST ["BREAK",:vars]],:$letAssoc]
;     pair => (RPLACD(pair,vars); $letAssoc)
;   $QuickLet:local := false
;   not MEMQ(fn,$traceletFunctions) and not stupidIsSpadFunction fn
;     and not GENSYMP fn =>
;       $traceletFunctions:= [fn,:$traceletFunctions]
;       compileBoot fn
;       $traceletFunctions:= delete(fn,$traceletFunctions)

(DEFUN |breaklet| (|fn| |bin_def| |vars|)
  (PROG (|$QuickLet| |pair| |fnEntry|)
    (DECLARE (SPECIAL |$QuickLet|))
    (RETURN
     (PROGN
      (COND
       ((AND |bin_def| (|stupidIsSpadFunction| |bin_def|))
        (COND
         ((COMPILED-FUNCTION-P |bin_def|) (SETQ |fn| (BPINAME |bin_def|))))))
      (COND ((EQ |fn| '|Undef|) NIL)
            (#1='T
             (PROGN
              (SETQ |fnEntry| (LASSOC |fn| |$letAssoc|))
              (SETQ |vars|
                      (COND
                       ((SETQ |pair| (|assoc| 'BREAK |fnEntry|))
                        (|union| |vars| (CDR |pair|)))
                       (#1# |vars|)))
              (SETQ |$letAssoc|
                      (COND
                       ((NULL |fnEntry|)
                        (CONS (CONS |fn| (LIST (CONS 'BREAK |vars|)))
                              |$letAssoc|))
                       (|pair| (PROGN (RPLACD |pair| |vars|) |$letAssoc|))))
              (SETQ |$QuickLet| NIL)
              (COND
               ((AND (NULL (MEMQ |fn| |$traceletFunctions|))
                     (NULL (|stupidIsSpadFunction| |fn|))
                     (NULL (GENSYMP |fn|)))
                (PROGN
                 (SETQ |$traceletFunctions| (CONS |fn| |$traceletFunctions|))
                 (|compileBoot| |fn|)
                 (SETQ |$traceletFunctions|
                         (|delete| |fn| |$traceletFunctions|))))))))))))

; stupidIsSpadFunction fn ==
;   -- returns true if the function pname has a semi-colon in it
;   -- eventually, this will use isSpadFunction from luke boot
;     search_str('"_;", PNAME(fn), 0)

(DEFUN |stupidIsSpadFunction| (|fn|)
  (PROG () (RETURN (|search_str| ";" (PNAME |fn|) 0))))

; break msg ==
;   condition := monitor_eval_tran($break_condition, nil)
;   -- The next line is to try to deal with some reported cases of unwanted
;   -- backtraces appearing, MCD.
;   ENABLE_BACKTRACE(nil)
;   EVAL condition =>
;         sayBrightly(msg)
;         BREAK()

(DEFUN |break| (|msg|)
  (PROG (|condition|)
    (RETURN
     (PROGN
      (SETQ |condition| (|monitor_eval_tran| |$break_condition| NIL))
      (ENABLE_BACKTRACE NIL)
      (COND ((EVAL |condition|) (PROGN (|sayBrightly| |msg|) (BREAK))))))))

; compileBoot fn ==
;   SAY('"need to recompile: ", fn)

(DEFUN |compileBoot| (|fn|) (PROG () (RETURN (SAY "need to recompile: " |fn|))))

; monitor_eval_before(x) == EVAL(monitor_eval_tran(x, false))

(DEFUN |monitor_eval_before| (|x|)
  (PROG () (RETURN (EVAL (|monitor_eval_tran| |x| NIL)))))

; monitor_eval_after(x) == EVAL(monitor_eval_tran(x, true))

(DEFUN |monitor_eval_after| (|x|)
  (PROG () (RETURN (EVAL (|monitor_eval_tran| |x| T)))))

; monitor_eval_tran(x, FG) ==
;     HAS_SHARP_VAR(x) => monitor_eval_tran1(x, FG)
;     x

(DEFUN |monitor_eval_tran| (|x| FG)
  (PROG ()
    (RETURN
     (COND ((HAS_SHARP_VAR |x|) (|monitor_eval_tran1| |x| FG)) ('T |x|)))))

; monitor_eval_tran1(x, fg) ==
;     (n := isSharpVarWithNum(x)) => monitor_get_value(n, fg)
;     ATOM(x) => x
;     CONS(monitor_eval_tran1(first(x), fg),
;              monitor_eval_tran1(rest(x), fg))

(DEFUN |monitor_eval_tran1| (|x| |fg|)
  (PROG (|n|)
    (RETURN
     (COND
      ((SETQ |n| (|isSharpVarWithNum| |x|)) (|monitor_get_value| |n| |fg|))
      ((ATOM |x|) |x|)
      ('T
       (CONS (|monitor_eval_tran1| (CAR |x|) |fg|)
             (|monitor_eval_tran1| (CDR |x|) |fg|)))))))

; HAS_SHARP_VAR(x) ==
;     ATOM(x) and IS_SHARP_VAR(x) => true
;     ATOM(x) => false
;     HAS_SHARP_VAR(first(x)) or HAS_SHARP_VAR(rest(x))

(DEFUN HAS_SHARP_VAR (|x|)
  (PROG ()
    (RETURN
     (COND ((AND (ATOM |x|) (IS_SHARP_VAR |x|)) T) ((ATOM |x|) NIL)
           ('T (OR (HAS_SHARP_VAR (CAR |x|)) (HAS_SHARP_VAR (CDR |x|))))))))

; DEFVAR($trace_size, false)

(DEFVAR |$trace_size| NIL)

; DEFVAR($trace_stream, nil)

(DEFVAR |$trace_stream| NIL)

; DEFVAR($monitor_args, nil)

(DEFVAR |$monitor_args| NIL)

; DEFVAR($monitor_pretty, false)

(DEFVAR |$monitor_pretty| NIL)

; DEFPARAMETER($monitor_depth, 0)

(DEFPARAMETER |$monitor_depth| 0)

; DEFPARAMETER($depthAlist, [])

(DEFPARAMETER |$depthAlist| NIL)

; small_enough(x) ==
;     $trace_size => small_enough_count(x, 0, $trace_size) < $trace_size
;     true

(DEFUN |small_enough| (|x|)
  (PROG ()
    (RETURN
     (COND
      (|$trace_size|
       (< (|small_enough_count| |x| 0 |$trace_size|) |$trace_size|))
      ('T T)))))

; small_enough_count(x, n, m) ==
;     not(n < m) => n
;     VECP(x) =>
;         for i in 0..MAXINDEX(x) while n < m repeat
;             n := small_enough_count(x.i, n + 1, m)
;         n
;     ATOM(x) => n
;     n := small_enough_count(first(x), n + 1, m)
;     not(n < m) => n
;     small_enough_count(rest(x), n, m)

(DEFUN |small_enough_count| (|x| |n| |m|)
  (PROG ()
    (RETURN
     (COND ((NULL (< |n| |m|)) |n|)
           ((VECP |x|)
            (PROGN
             ((LAMBDA (|bfVar#101| |i|)
                (LOOP
                 (COND
                  ((OR (> |i| |bfVar#101|) (NOT (< |n| |m|))) (RETURN NIL))
                  (#1='T
                   (SETQ |n|
                           (|small_enough_count| (ELT |x| |i|) (+ |n| 1)
                            |m|))))
                 (SETQ |i| (+ |i| 1))))
              (MAXINDEX |x|) 0)
             |n|))
           ((ATOM |x|) |n|)
           (#1#
            (PROGN
             (SETQ |n| (|small_enough_count| (CAR |x|) (+ |n| 1) |m|))
             (COND ((NULL (< |n| |m|)) |n|)
                   (#1# (|small_enough_count| (CDR |x|) |n| |m|)))))))))

; monitor_print_value(val, name) ==
;     u := GET(name, "/TRANSFORM")
;     u =>
;         EQCAR(u, "&") =>
;             PRINC('"//", $trace_stream)
;             PRIN1(val, $trace_stream)
;             TERPRI($trace_stream)
;         PRINC('"! ", $trace_stream)
;         PRIN1(EVAL(SUBST(MKQ(val), "*", first(u))), $trace_stream)
;         TERPRI($trace_stream)
;     PRINC('": ", $trace_stream)
;     NOT(small_enough(val)) => limited_print1(val, $trace_stream)
;     $monitor_pretty => PRETTYPRINT(val, $trace_stream)
;     if $mathTrace then TERPRI($trace_stream)
;     PRINMATHOR0(val, $trace_stream)

(DEFUN |monitor_print_value| (|val| |name|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (GET |name| '/TRANSFORM))
      (COND
       (|u|
        (COND
         ((EQCAR |u| '&)
          (PROGN
           (PRINC "//" |$trace_stream|)
           (PRIN1 |val| |$trace_stream|)
           (TERPRI |$trace_stream|)))
         (#1='T
          (PROGN
           (PRINC "! " |$trace_stream|)
           (PRIN1 (EVAL (SUBST (MKQ |val|) '* (CAR |u|))) |$trace_stream|)
           (TERPRI |$trace_stream|)))))
       (#1#
        (PROGN
         (PRINC ": " |$trace_stream|)
         (COND
          ((NULL (|small_enough| |val|))
           (|limited_print1| |val| |$trace_stream|))
          (|$monitor_pretty| (PRETTYPRINT |val| |$trace_stream|))
          (#1#
           (PROGN
            (COND (|$mathTrace| (TERPRI |$trace_stream|)))
            (PRINMATHOR0 |val| |$trace_stream|)))))))))))

; monitor_blanks(n) == PRINC(filler_spaces(n), $trace_stream)

(DEFUN |monitor_blanks| (|n|)
  (PROG () (RETURN (PRINC (|filler_spaces| |n|) |$trace_stream|))))

; monitor_get_value(n, fg) ==
;     n = 0 =>
;         fg => MKQ($monitor_value)
;         spadThrowBrightly('"cannot ask for value before execution")
;     n = 9 => MKQ($monitor_caller)
;     n <= #$monitor_args => MKQ(ELT($monitor_args, n - 1))
;     spadThrowBrightly(['"FUNCTION", "%b", $monitor_name, "%d",
;                           '"does not have", "%b", n, "%d", '"arguments"])

(DEFUN |monitor_get_value| (|n| |fg|)
  (PROG ()
    (RETURN
     (COND
      ((EQL |n| 0)
       (COND (|fg| (MKQ |$monitor_value|))
             (#1='T
              (|spadThrowBrightly| "cannot ask for value before execution"))))
      ((EQL |n| 9) (MKQ |$monitor_caller|))
      ((NOT (< (LENGTH |$monitor_args|) |n|))
       (MKQ (ELT |$monitor_args| (- |n| 1))))
      (#1#
       (|spadThrowBrightly|
        (LIST "FUNCTION" '|%b| |$monitor_name| '|%d| "does not have" '|%b| |n|
              '|%d| "arguments")))))))

; monitor_print_args(L, code, trans) ==
;     char_to_digit(code.2) = 0 => []
;     char_to_digit(code.2) = 9 =>
;         trans =>
;             for x in L for y in rest(trans) repeat
;                 EQ(y, "*") =>
;                     PRINC('"\ ", $trace_stream)
;                     monitor_print(x, $trace_stream)
;                 EQ(y, "&") =>
;                     PRINC('"\\", $trace_stream)
;                     TERPRI($trace_stream)
;                     PRINT(x, $trace_stream)
;                 NOT(y) => PRINC('"! ", $trace_stream)
;                 PRINC('"! ", $trace_stream)
;                 monitor_print(
;                     EVAL(SUBST(MKQ(x), "*", y)), $trace_stream)
;         PRINC('": ", $trace_stream)
;         if NOT(ATOM(L)) then
;             if $mathTrace then TERPRI($trace_stream)
;             monitor_print(first(L), $trace_stream)
;             L := rest(L)
;         for el in L repeat
;             monitor_print_rest(el)
;     for istep in 2..MAXINDEX(code) repeat
;         n := char_to_digit(code.istep)
;         if NOT(n = 0) then
;             PRINC('"\", $trace_stream)
;             PRINMATHOR0(n, $trace_stream)
;             PRINC('": ", $trace_stream)
;             monitor_print_arg(L, n)

(DEFUN |monitor_print_args| (L |code| |trans|)
  (PROG (|n|)
    (RETURN
     (COND ((EQL (|char_to_digit| (ELT |code| 2)) 0) NIL)
           ((EQL (|char_to_digit| (ELT |code| 2)) 9)
            (COND
             (|trans|
              ((LAMBDA (|bfVar#102| |x| |bfVar#103| |y|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#102|)
                        (PROGN (SETQ |x| (CAR |bfVar#102|)) NIL)
                        (ATOM |bfVar#103|)
                        (PROGN (SETQ |y| (CAR |bfVar#103|)) NIL))
                    (RETURN NIL))
                   (#1='T
                    (COND
                     ((EQ |y| '*)
                      (PROGN
                       (PRINC "\\ " |$trace_stream|)
                       (|monitor_print| |x| |$trace_stream|)))
                     ((EQ |y| '&)
                      (PROGN
                       (PRINC "\\\\" |$trace_stream|)
                       (TERPRI |$trace_stream|)
                       (PRINT |x| |$trace_stream|)))
                     ((NULL |y|) (PRINC "! " |$trace_stream|))
                     (#1#
                      (PROGN
                       (PRINC "! " |$trace_stream|)
                       (|monitor_print| (EVAL (SUBST (MKQ |x|) '* |y|))
                        |$trace_stream|))))))
                  (SETQ |bfVar#102| (CDR |bfVar#102|))
                  (SETQ |bfVar#103| (CDR |bfVar#103|))))
               L NIL (CDR |trans|) NIL))
             (#1#
              (PROGN
               (PRINC ": " |$trace_stream|)
               (COND
                ((NULL (ATOM L)) (COND (|$mathTrace| (TERPRI |$trace_stream|)))
                 (|monitor_print| (CAR L) |$trace_stream|) (SETQ L (CDR L))))
               ((LAMBDA (|bfVar#104| |el|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#104|)
                         (PROGN (SETQ |el| (CAR |bfVar#104|)) NIL))
                     (RETURN NIL))
                    (#1# (|monitor_print_rest| |el|)))
                   (SETQ |bfVar#104| (CDR |bfVar#104|))))
                L NIL)))))
           (#1#
            ((LAMBDA (|bfVar#105| |istep|)
               (LOOP
                (COND ((> |istep| |bfVar#105|) (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |n| (|char_to_digit| (ELT |code| |istep|)))
                        (COND
                         ((NULL (EQL |n| 0)) (PRINC "\\" |$trace_stream|)
                          (PRINMATHOR0 |n| |$trace_stream|)
                          (PRINC ": " |$trace_stream|)
                          (|monitor_print_arg| L |n|))))))
                (SETQ |istep| (+ |istep| 1))))
             (MAXINDEX |code|) 2))))))

; monitor_print_rest(x) ==
;     NOT(small_enough(x)) =>
;         TERPRI($trace_stream)
;         monitor_blanks($monitor_depth + 1)
;         PRINC('"\", $trace_stream)
;         PRINT(x, $trace_stream)
;     if NOT($mathTrace) then PRINC('"\", $trace_stream)
;     $monitor_pretty => PRETTYPRINT(x, $trace_stream)
;     PRINMATHOR0(x, $trace_stream)

(DEFUN |monitor_print_rest| (|x|)
  (PROG ()
    (RETURN
     (COND
      ((NULL (|small_enough| |x|))
       (PROGN
        (TERPRI |$trace_stream|)
        (|monitor_blanks| (+ |$monitor_depth| 1))
        (PRINC "\\" |$trace_stream|)
        (PRINT |x| |$trace_stream|)))
      (#1='T
       (PROGN
        (COND ((NULL |$mathTrace|) (PRINC "\\" |$trace_stream|)))
        (COND (|$monitor_pretty| (PRETTYPRINT |x| |$trace_stream|))
              (#1# (PRINMATHOR0 |x| |$trace_stream|)))))))))

; monitor_print_arg(l, n) ==
;     for el in l for k in 1..n repeat
;         if k = n then monitor_print(el, $trace_stream)

(DEFUN |monitor_print_arg| (|l| |n|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#106| |el| |k|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#106|) (PROGN (SETQ |el| (CAR |bfVar#106|)) NIL)
               (> |k| |n|))
           (RETURN NIL))
          ('T (COND ((EQUAL |k| |n|) (|monitor_print| |el| |$trace_stream|)))))
         (SETQ |bfVar#106| (CDR |bfVar#106|))
         (SETQ |k| (+ |k| 1))))
      |l| NIL 1))))

; monitor_print(x, trace_str) ==
;     not(small_enough(x)) => limited_print1(x, trace_str)
;     $monitor_pretty => PRETTYPRINT(x, trace_str)
;     PRINMATHOR0(x, trace_str)

(DEFUN |monitor_print| (|x| |trace_str|)
  (PROG ()
    (RETURN
     (COND ((NULL (|small_enough| |x|)) (|limited_print1| |x| |trace_str|))
           (|$monitor_pretty| (PRETTYPRINT |x| |trace_str|))
           ('T (PRINMATHOR0 |x| |trace_str|))))))

; PRINMATHOR0(x, trace_str) ==
;     $mathTrace => maprinSpecial(outputTran2(x), $monitor_depth, $LINELENGTH)
;     PRIN1(x, trace_str)

(DEFUN PRINMATHOR0 (|x| |trace_str|)
  (PROG ()
    (RETURN
     (COND
      (|$mathTrace|
       (|maprinSpecial| (|outputTran2| |x|) |$monitor_depth| $LINELENGTH))
      ('T (PRIN1 |x| |trace_str|))))))

; _/TRACELET_-PRINT(X, Y) ==
;     PRINC(STRCONC(PNAME(X), '": "), $trace_stream)
;     monitor_print(Y, $trace_stream)

(DEFUN /TRACELET-PRINT (X Y)
  (PROG ()
    (RETURN
     (PROGN
      (PRINC (STRCONC (PNAME X) ": ") |$trace_stream|)
      (|monitor_print| Y |$trace_stream|)))))

; DEFPARAMETER($TraceFlag, true)

(DEFPARAMETER |$TraceFlag| T)

; monitor_x0(TRACECODE, C, TYPE, name, name1) ==
;     $TraceFlag : local := false
;     TRACECODE = '"000" => []
;     TAB(0, $trace_stream)
;     monitor_blanks($monitor_depth - 1)
;     PRIN1($monitor_fun_depth, $trace_stream)
;     sayBrightlyNT2(['"<enter", "%b", PNAME(name1), "%d"], $trace_stream)
;     if not(C = 0) then
;         EQ(TYPE, 'MACRO) => PRINT('" expanded", $trace_stream)
;         PRINT('" from ", $trace_stream)
;         PRIN1($monitor_caller, $trace_stream)
;     c_args := coerceTraceArgs2E(name1, name, $monitor_args)
;     if SPADSYSNAMEP(PNAME(name)) then
;          c_args := NREVERSE(REVERSE(c_args))
;     monitor_print_args(c_args, TRACECODE, GET(name, "/TRANSFORM"))
;     if NOT($mathTrace) then TERPRI($trace_stream)

(DEFUN |monitor_x0| (TRACECODE C TYPE |name| |name1|)
  (PROG (|$TraceFlag| |c_args|)
    (DECLARE (SPECIAL |$TraceFlag|))
    (RETURN
     (PROGN
      (SETQ |$TraceFlag| NIL)
      (COND ((EQUAL TRACECODE "000") NIL)
            (#1='T
             (PROGN
              (TAB 0 |$trace_stream|)
              (|monitor_blanks| (- |$monitor_depth| 1))
              (PRIN1 |$monitor_fun_depth| |$trace_stream|)
              (|sayBrightlyNT2| (LIST "<enter" '|%b| (PNAME |name1|) '|%d|)
               |$trace_stream|)
              (COND
               ((NULL (EQL C 0))
                (COND ((EQ TYPE 'MACRO) (PRINT " expanded" |$trace_stream|))
                      (#1#
                       (PROGN
                        (PRINT " from " |$trace_stream|)
                        (PRIN1 |$monitor_caller| |$trace_stream|))))))
              (SETQ |c_args|
                      (|coerceTraceArgs2E| |name1| |name| |$monitor_args|))
              (COND
               ((SPADSYSNAMEP (PNAME |name|))
                (SETQ |c_args| (NREVERSE (REVERSE |c_args|)))))
              (|monitor_print_args| |c_args| TRACECODE
               (GET |name| '/TRANSFORM))
              (COND ((NULL |$mathTrace|) (TERPRI |$trace_stream|))))))))))

; monitor_x1(TRACECODE, name, name1, V, TIMERNAM, EVAL_TIME) ==
;     $TraceFlag : local := false
;     TRACECODE = '"000" => []
;     TAB(0, $trace_stream)
;     monitor_blanks($monitor_depth - 1)
;     PRIN1($monitor_fun_depth, $trace_stream)
;     sayBrightlyNT2(['">exit ", "%b", PNAME(name1), "%d"], $trace_stream)
;     if TIMERNAM then
;         sayBrightlyNT2('"(", $trace_stream) -- )
;         sayBrightlyNT2((EVAL_TIME/60.0), $trace_stream)
;         sayBrightlyNT2('" sec)", $trace_stream)
;     if V = 1 then
;         monitor_print_value(
;               coerceTraceFunValue2E(name1, name, $monitor_value),
;                 name1)
;     if NOT($mathTrace) then TERPRI($trace_stream)

(DEFUN |monitor_x1| (TRACECODE |name| |name1| V TIMERNAM EVAL_TIME)
  (PROG (|$TraceFlag|)
    (DECLARE (SPECIAL |$TraceFlag|))
    (RETURN
     (PROGN
      (SETQ |$TraceFlag| NIL)
      (COND ((EQUAL TRACECODE "000") NIL)
            ('T
             (PROGN
              (TAB 0 |$trace_stream|)
              (|monitor_blanks| (- |$monitor_depth| 1))
              (PRIN1 |$monitor_fun_depth| |$trace_stream|)
              (|sayBrightlyNT2| (LIST ">exit " '|%b| (PNAME |name1|) '|%d|)
               |$trace_stream|)
              (COND
               (TIMERNAM (|sayBrightlyNT2| "(" |$trace_stream|)
                (|sayBrightlyNT2| (/ EVAL_TIME 60.0) |$trace_stream|)
                (|sayBrightlyNT2| " sec)" |$trace_stream|)))
              (COND
               ((EQL V 1)
                (|monitor_print_value|
                 (|coerceTraceFunValue2E| |name1| |name| |$monitor_value|)
                 |name1|)))
              (COND ((NULL |$mathTrace|) (TERPRI |$trace_stream|))))))))))

; monitor_x(args, funct, opts) ==
;     monitor_xx(args, funct, opts, $monitor_depth, $depthAlist)

(DEFUN |monitor_x| (|args| |funct| |opts|)
  (PROG ()
    (RETURN
     (|monitor_xx| |args| |funct| |opts| |$monitor_depth| |$depthAlist|))))

; monitor_xx($monitor_args, funct, opts, old_depth, old_depth_alist) ==
;     stopTimer()
;     x := opts
;     name := IFCAR(x)
;     x := IFCDR(x)
;     TYPE := IFCAR(x)
;     x := IFCDR(x)
;     TRACECODE := IFCAR(x)
;     x := IFCDR(x)
;     COUNTNAM := IFCAR(x)
;     x := IFCDR(x)
;     TIMERNAM := IFCAR(x)
;     x := IFCDR(x)
;     before := IFCAR(x)
;     x := IFCDR(x)
;     AFTER := IFCAR(x)
;     x := IFCDR(x)
;     CONDITION := IFCAR(x)
;     x := IFCDR(x)
;     BREAK := IFCAR(x)
;     x := IFCDR(x)
;     TRACEDMODEMAP := IFCAR(x)
;     x := IFCDR(x)
;     BREAKCONDITION := IFCAR(x)
;     $mathTrace : local := false
;     $tracedSpadModemap : local := TRACEDMODEMAP
;     $monitor_depth : local := old_depth + 1
;     $monitor_name : local := PNAME(name)
;     name1 := rassocSub(name, $mapSubNameAlist)
;     $break_condition : local := BREAKCONDITION
;     $monitor_caller : local := rassocSub(WHOCALLED(6), $mapSubNameAlist)
;     NOT(STRINGP TRACECODE) =>
;         bright_warn(['"set TRACECODE to \'1911\' and restart"])
;     C := char_to_digit(TRACECODE.0)
;     V := char_to_digit(TRACECODE.1)
;     A := char_to_digit(TRACECODE.2)
;     if COUNTNAM then SET(COUNTNAM,  EVAL(COUNTNAM) + 1)
;     $depthAlist : local := COPY_-TREE(old_depth_alist)
;     NOT_TOP_LEVEL := ASSQ(name, $depthAlist)
;     if NOT(NOT_TOP_LEVEL) then
;         $depthAlist := CONS(CONS(name, 1), $depthAlist)
;     else
;         RPLACD(NOT_TOP_LEVEL, CDR(NOT_TOP_LEVEL) + 1)
;     $monitor_fun_depth : local := CDR(ASSQ(name, $depthAlist))
;     CONDITION := monitor_eval_tran(CONDITION, false)
;     YES := EVAL(CONDITION)
;     if MEMQ(name, $mathTraceList) then $mathTrace := true
;     if YES and $TraceFlag then
;         monitor_x0(TRACECODE, C, TYPE, name, name1)
;     if before then monitor_eval_before(before)
;     if MEMQ('before, BREAK) then
;         break(['"Break on entering", "%b", PNAME(name1), "%d", '":"])
;     if TIMERNAM then INIT_TIME := startTimer()
;     $monitor_value : local :=
;         EQ(TYPE, 'MACRO) => MACROEXPAND(funct, $monitor_args)
;         APPLY(funct, $monitor_args)
;     stopTimer()
;     EVAL_TIME := nil
;     if TIMERNAM then
;         EVAL_TIME := timer_value() - INIT_TIME
;     if TIMERNAM and NOT(NOT_TOP_LEVEL) then
;         SET(TIMERNAM, EVAL(TIMERNAM) + EVAL_TIME)
;     if AFTER then monitor_eval_after(AFTER)
;     if YES and $TraceFlag then
;         monitor_x1(TRACECODE, name, name1, V, TIMERNAM, EVAL_TIME)
;     if MEMQ('after, BREAK) then
;         break(['"Break on exiting", "%b", PNAME(name1), "%d", '":"])
;     startTimer()
;     $monitor_value

(DEFUN |monitor_xx|
       (|$monitor_args| |funct| |opts| |old_depth| |old_depth_alist|)
  (DECLARE (SPECIAL |$monitor_args|))
  (PROG (|$monitor_value| |$monitor_fun_depth| |$depthAlist| |$monitor_caller|
         |$break_condition| |$monitor_name| |$monitor_depth|
         |$tracedSpadModemap| |$mathTrace| EVAL_TIME INIT_TIME YES
         NOT_TOP_LEVEL A V C |name1| BREAKCONDITION TRACEDMODEMAP BREAK
         CONDITION AFTER |before| TIMERNAM COUNTNAM TRACECODE TYPE |name| |x|)
    (DECLARE
     (SPECIAL |$monitor_value| |$monitor_fun_depth| |$depthAlist|
      |$monitor_caller| |$break_condition| |$monitor_name| |$monitor_depth|
      |$tracedSpadModemap| |$mathTrace|))
    (RETURN
     (PROGN
      (|stopTimer|)
      (SETQ |x| |opts|)
      (SETQ |name| (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ TYPE (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ TRACECODE (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ COUNTNAM (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ TIMERNAM (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ |before| (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ AFTER (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ CONDITION (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ BREAK (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ TRACEDMODEMAP (IFCAR |x|))
      (SETQ |x| (IFCDR |x|))
      (SETQ BREAKCONDITION (IFCAR |x|))
      (SETQ |$mathTrace| NIL)
      (SETQ |$tracedSpadModemap| TRACEDMODEMAP)
      (SETQ |$monitor_depth| (+ |old_depth| 1))
      (SETQ |$monitor_name| (PNAME |name|))
      (SETQ |name1| (|rassocSub| |name| |$mapSubNameAlist|))
      (SETQ |$break_condition| BREAKCONDITION)
      (SETQ |$monitor_caller| (|rassocSub| (WHOCALLED 6) |$mapSubNameAlist|))
      (COND
       ((NULL (STRINGP TRACECODE))
        (|bright_warn| (LIST "set TRACECODE to \\'1911\\' and restart")))
       (#1='T
        (PROGN
         (SETQ C (|char_to_digit| (ELT TRACECODE 0)))
         (SETQ V (|char_to_digit| (ELT TRACECODE 1)))
         (SETQ A (|char_to_digit| (ELT TRACECODE 2)))
         (COND (COUNTNAM (SET COUNTNAM (+ (EVAL COUNTNAM) 1))))
         (SETQ |$depthAlist| (COPY-TREE |old_depth_alist|))
         (SETQ NOT_TOP_LEVEL (ASSQ |name| |$depthAlist|))
         (COND
          ((NULL NOT_TOP_LEVEL)
           (SETQ |$depthAlist| (CONS (CONS |name| 1) |$depthAlist|)))
          (#1# (RPLACD NOT_TOP_LEVEL (+ (CDR NOT_TOP_LEVEL) 1))))
         (SETQ |$monitor_fun_depth| (CDR (ASSQ |name| |$depthAlist|)))
         (SETQ CONDITION (|monitor_eval_tran| CONDITION NIL))
         (SETQ YES (EVAL CONDITION))
         (COND ((MEMQ |name| |$mathTraceList|) (SETQ |$mathTrace| T)))
         (COND
          ((AND YES |$TraceFlag|)
           (|monitor_x0| TRACECODE C TYPE |name| |name1|)))
         (COND (|before| (|monitor_eval_before| |before|)))
         (COND
          ((MEMQ '|before| BREAK)
           (|break|
            (LIST "Break on entering" '|%b| (PNAME |name1|) '|%d| ":"))))
         (COND (TIMERNAM (SETQ INIT_TIME (|startTimer|))))
         (SETQ |$monitor_value|
                 (COND ((EQ TYPE 'MACRO) (MACROEXPAND |funct| |$monitor_args|))
                       (#1# (APPLY |funct| |$monitor_args|))))
         (|stopTimer|)
         (SETQ EVAL_TIME NIL)
         (COND (TIMERNAM (SETQ EVAL_TIME (- (|timer_value|) INIT_TIME))))
         (COND
          ((AND TIMERNAM (NULL NOT_TOP_LEVEL))
           (SET TIMERNAM (+ (EVAL TIMERNAM) EVAL_TIME))))
         (COND (AFTER (|monitor_eval_after| AFTER)))
         (COND
          ((AND YES |$TraceFlag|)
           (|monitor_x1| TRACECODE |name| |name1| V TIMERNAM EVAL_TIME)))
         (COND
          ((MEMQ '|after| BREAK)
           (|break|
            (LIST "Break on exiting" '|%b| (PNAME |name1|) '|%d| ":"))))
         (|startTimer|)
         |$monitor_value|)))))))

; DEFPARAMETER($oldTime, 0)

(DEFPARAMETER |$oldTime| 0)

; DEFPARAMETER($delay, 0)

(DEFPARAMETER |$delay| 0)

; timer_value() == $oldTime - $delay

(DEFUN |timer_value| () (PROG () (RETURN (- |$oldTime| |$delay|))))

; startTimer() ==
;     $delay := $delay + get_run_time() - $oldTime
;     get_run_time() - $delay

(DEFUN |startTimer| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$delay| (- (+ |$delay| (|get_run_time|)) |$oldTime|))
      (- (|get_run_time|) |$delay|)))))

; stopTimer() == $oldTime := get_run_time()

(DEFUN |stopTimer| () (PROG () (RETURN (SETQ |$oldTime| (|get_run_time|)))))
