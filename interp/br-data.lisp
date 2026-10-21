
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $tick := char '_`            --field separator for database files

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$tick| (|char| '|`|)))

; getConstructorForm(name) ==
;     name = 'Union   => '(Union  (_: a A) (_: b B))
;     name = 'UntaggedUnion => '(Union A B)
;     name = 'Record  => '(Record (_: a A) (_: b B))
;     name = 'Mapping => '(Mapping T S)
;     name = 'Enumeration => '(Enumeration a b)
;     get_database(name, 'CONSTRUCTORFORM)

(DEFUN |getConstructorForm| (|name|)
  (PROG ()
    (RETURN
     (COND ((EQ |name| '|Union|) '(|Union| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|UntaggedUnion|) '(|Union| A B))
           ((EQ |name| '|Record|) '(|Record| (|:| |a| A) (|:| |b| B)))
           ((EQ |name| '|Mapping|) '(|Mapping| T S))
           ((EQ |name| '|Enumeration|) '(|Enumeration| |a| |b|))
           ('T (|get_database| |name| 'CONSTRUCTORFORM))))))

; dbInfovec(name) ==
;     'category = get_database(name, 'CONSTRUCTORKIND) => nil
;     get_database(name, 'ASHARP?) => nil
;     loadLibIfNotLoaded(name)
;     u := GET(name, 'infovec) => u

(DEFUN |dbInfovec| (|name|)
  (PROG (|u|)
    (RETURN
     (COND ((EQ '|category| (|get_database| |name| 'CONSTRUCTORKIND)) NIL)
           ((|get_database| |name| 'ASHARP?) NIL)
           ('T
            (PROGN
             (|loadLibIfNotLoaded| |name|)
             (COND ((SETQ |u| (GET |name| '|infovec|)) |u|))))))))

; extractHasArgs(pred) ==
;     x := find(pred) or return nil where find(x) ==
;         x is [op, :argl] =>
;             op = 'hasArgs => x
;             MEMQ(op, '(AND OR NOT)) => or/[find(y) for y in argl]
;             nil
;         nil
;     [rest(x), :simpBool(substitute('T, x, pred))]

(DEFUN |extractHasArgs| (|pred|)
  (PROG (|x|)
    (RETURN
     (PROGN
      (SETQ |x| (OR (|extractHasArgs,find| |pred|) (RETURN NIL)))
      (CONS (CDR |x|) (|simpBool| (|substitute| 'T |x| |pred|)))))))
(DEFUN |extractHasArgs,find| (|x|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
       (COND ((EQ |op| '|hasArgs|) |x|)
             ((MEMQ |op| '(AND OR NOT))
              ((LAMBDA (|bfVar#2| |bfVar#1| |y|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#1|)
                        (PROGN (SETQ |y| (CAR |bfVar#1|)) NIL))
                    (RETURN |bfVar#2|))
                   (#1#
                    (PROGN
                     (SETQ |bfVar#2| (|extractHasArgs,find| |y|))
                     (COND (|bfVar#2| (RETURN |bfVar#2|))))))
                  (SETQ |bfVar#1| (CDR |bfVar#1|))))
               NIL |argl| NIL))
             (#1# NIL)))
      (#1# NIL)))))

; augmentHasArgs(alist,conform) ==
;     conname := opOf(conform)
;     args := IFCDR(conform) or return alist
;     n := #args
;     [[name, :pred] for [name, :p] in alist] where pred ==
;          extractHasArgs(p) is [a,:b] => p
;          quickAnd(p, ['hasArgs,
;                       :TAKE(n, IFCDR(getConstructorForm(opOf(name))))])

(DEFUN |augmentHasArgs| (|alist| |conform|)
  (PROG (|conname| |args| |n| |name| |p| |ISTMP#1| |a| |b|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |args| (OR (IFCDR |conform|) (RETURN |alist|)))
      (SETQ |n| (LENGTH |args|))
      ((LAMBDA (|bfVar#5| |bfVar#4| |bfVar#3|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#4|) (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
            (RETURN (NREVERSE |bfVar#5|)))
           (#1='T
            (AND (CONSP |bfVar#3|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#3|))
                  (SETQ |p| (CDR |bfVar#3|))
                  #1#)
                 (SETQ |bfVar#5|
                         (CONS
                          (CONS |name|
                                (COND
                                 ((PROGN
                                   (SETQ |ISTMP#1| (|extractHasArgs| |p|))
                                   (AND (CONSP |ISTMP#1|)
                                        (PROGN
                                         (SETQ |a| (CAR |ISTMP#1|))
                                         (SETQ |b| (CDR |ISTMP#1|))
                                         #1#)))
                                  |p|)
                                 (#1#
                                  (|quickAnd| |p|
                                   (CONS '|hasArgs|
                                         (TAKE |n|
                                          (IFCDR
                                           (|getConstructorForm|
                                            (|opOf| |name|)))))))))
                          |bfVar#5|)))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       NIL |alist| NIL)))))

; evalDomainOpPred(dom, pred, preds) ==
;     u := convert_pred(dom, pred)
;     eval_pred(dom, u, preds)

(DEFUN |evalDomainOpPred| (|dom| |pred| |preds|)
  (PROG (|u|)
    (RETURN
     (PROGN
      (SETQ |u| (|convert_pred| |dom| |pred|))
      (|eval_pred| |dom| |u| |preds|)))))

; convert_pred(dom, pred) ==
;     pred = 'T => true
;     pred is [op, :argl] =>
;         op = 'AND or op = 'OR => [op, :[convert_pred(dom, x) for x in argl]]
;         op = 'NOT => ['NOT, convert_pred(dom, first(argl))]
;         op = 'has =>
;             [arg, p] := argl
;             ['HasCategory, arg, convert_cat_arg(p)]
;         systemError '"unknown predicate form"
;     systemError([])

(DEFUN |convert_pred| (|dom| |pred|)
  (PROG (|op| |argl| |arg| |p|)
    (RETURN
     (COND ((EQ |pred| 'T) T)
           ((AND (CONSP |pred|)
                 (PROGN
                  (SETQ |op| (CAR |pred|))
                  (SETQ |argl| (CDR |pred|))
                  #1='T))
            (COND
             ((OR (EQ |op| 'AND) (EQ |op| 'OR))
              (CONS |op|
                    ((LAMBDA (|bfVar#7| |bfVar#6| |x|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#6|)
                              (PROGN (SETQ |x| (CAR |bfVar#6|)) NIL))
                          (RETURN (NREVERSE |bfVar#7|)))
                         (#1#
                          (SETQ |bfVar#7|
                                  (CONS (|convert_pred| |dom| |x|)
                                        |bfVar#7|))))
                        (SETQ |bfVar#6| (CDR |bfVar#6|))))
                     NIL |argl| NIL)))
             ((EQ |op| 'NOT) (LIST 'NOT (|convert_pred| |dom| (CAR |argl|))))
             ((EQ |op| '|has|)
              (PROGN
               (SETQ |arg| (CAR |argl|))
               (SETQ |p| (CADR |argl|))
               (LIST '|HasCategory| |arg| (|convert_cat_arg| |p|))))
             (#1# (|systemError| "unknown predicate form"))))
           (#1# (|systemError| NIL))))))

; convert_cat_arg(p) ==
;     SYMBOLP(p) and member(p, $FormalMapVariableList) => ["devaluate", p]
;     ATOM(p) or #p = 1 => MKQ(p)
;     ['LIST, MKQ(first(p)), :[convert_cat_arg(x) for x in rest p]]

(DEFUN |convert_cat_arg| (|p|)
  (PROG ()
    (RETURN
     (COND
      ((AND (SYMBOLP |p|) (|member| |p| |$FormalMapVariableList|))
       (LIST '|devaluate| |p|))
      ((OR (ATOM |p|) (EQL (LENGTH |p|) 1)) (MKQ |p|))
      (#1='T
       (CONS 'LIST
             (CONS (MKQ (CAR |p|))
                   ((LAMBDA (|bfVar#9| |bfVar#8| |x|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#8|)
                             (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
                         (RETURN (NREVERSE |bfVar#9|)))
                        (#1#
                         (SETQ |bfVar#9|
                                 (CONS (|convert_cat_arg| |x|) |bfVar#9|))))
                       (SETQ |bfVar#8| (CDR |bfVar#8|))))
                    NIL (CDR |p|) NIL))))))))

; eval_pred(dom, pred, preds) ==
;     pred = 'T => true
;     k := POSN1(pred, preds) => testBitVector(dom.3, k + 1)
;     eval_pred1(dom, pred, preds)

(DEFUN |eval_pred| (|dom| |pred| |preds|)
  (PROG (|k|)
    (RETURN
     (COND ((EQ |pred| 'T) T)
           ((SETQ |k| (POSN1 |pred| |preds|))
            (|testBitVector| (ELT |dom| 3) (+ |k| 1)))
           ('T (|eval_pred1| |dom| |pred| |preds|))))))

; eval_pred1(dom, pred, preds) ==
;     pred is [op,:argl] =>
;         op = 'AND => "and"/[eval_pred(dom, x, preds) for x in argl]
;         op = 'OR  => "or"/[eval_pred(dom, x, preds) for x in argl]
;         op = 'NOT => not eval_pred(dom, first(argl), preds)
;         nil
;     systemError '"unknown atomic predicate form"

(DEFUN |eval_pred1| (|dom| |pred| |preds|)
  (PROG (|op| |argl|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |argl| (CDR |pred|)) #1='T))
       (COND
        ((EQ |op| 'AND)
         ((LAMBDA (|bfVar#11| |bfVar#10| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#10|) (PROGN (SETQ |x| (CAR |bfVar#10|)) NIL))
               (RETURN |bfVar#11|))
              (#1#
               (PROGN
                (SETQ |bfVar#11| (|eval_pred| |dom| |x| |preds|))
                (COND ((NOT |bfVar#11|) (RETURN NIL))))))
             (SETQ |bfVar#10| (CDR |bfVar#10|))))
          T |argl| NIL))
        ((EQ |op| 'OR)
         ((LAMBDA (|bfVar#13| |bfVar#12| |x|)
            (LOOP
             (COND
              ((OR (ATOM |bfVar#12|) (PROGN (SETQ |x| (CAR |bfVar#12|)) NIL))
               (RETURN |bfVar#13|))
              (#1#
               (PROGN
                (SETQ |bfVar#13| (|eval_pred| |dom| |x| |preds|))
                (COND (|bfVar#13| (RETURN |bfVar#13|))))))
             (SETQ |bfVar#12| (CDR |bfVar#12|))))
          NIL |argl| NIL))
        ((EQ |op| 'NOT) (NULL (|eval_pred| |dom| (CAR |argl|) |preds|)))
        (#1# NIL)))
      (#1# (|systemError| "unknown atomic predicate form"))))))

; kFormatSlotDomain1(x, infovec) ==
;               fn(formatSlotDomain1(x, infovec)) where fn(x) ==
;     ATOM(x) => x
;     (op := first(x)) = '_% => '_%
;     op = 'local => CADR(x)
;     op = ":" => [":", CADR(x), fn(CADDR(x))]
;     MEMQ(op, $Primitives) or constructor?(op) =>
;         [fn(y) for y in x]
;     INTEGERP(op) => op
;     op = 'QUOTE and ATOM(CADR(x)) => CADR(x)
;     x

(DEFUN |kFormatSlotDomain1| (|x| |infovec|)
  (PROG ()
    (RETURN (|kFormatSlotDomain1,fn| (|formatSlotDomain1| |x| |infovec|)))))
(DEFUN |kFormatSlotDomain1,fn| (|x|)
  (PROG (|op|)
    (RETURN
     (COND ((ATOM |x|) |x|) ((EQ (SETQ |op| (CAR |x|)) '%) '%)
           ((EQ |op| '|local|) (CADR |x|))
           ((EQ |op| '|:|)
            (LIST '|:| (CADR |x|) (|kFormatSlotDomain1,fn| (CADDR |x|))))
           ((OR (MEMQ |op| |$Primitives|) (|constructor?| |op|))
            ((LAMBDA (|bfVar#15| |bfVar#14| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#14|)
                      (PROGN (SETQ |y| (CAR |bfVar#14|)) NIL))
                  (RETURN (NREVERSE |bfVar#15|)))
                 (#1='T
                  (SETQ |bfVar#15|
                          (CONS (|kFormatSlotDomain1,fn| |y|) |bfVar#15|))))
                (SETQ |bfVar#14| (CDR |bfVar#14|))))
             NIL |x| NIL))
           ((INTEGERP |op|) |op|)
           ((AND (EQ |op| 'QUOTE) (ATOM (CADR |x|))) (CADR |x|)) (#1# |x|)))))

; dbSearchOrder(conform, domname, domain) == --domain = nil or set to live domain
;     conform := domname or conform
;     name := opOf(conform)
;     infovec := dbInfovec(name) or return nil  --exit for categories
;     u := infovec.3
;     predvec :=
;         domain => domain.3
;         get_database(name, 'PREDICATES)
;     catpredvec := first(u)
;     catinfo := CADR(u)
;     catvec := CADDR(u)
;     catforms := [[pakform, :pred] for i in 0..MAXINDEX(catvec) | test ] where
;         test ==
;             p := SUBLISLIS(rest(conform), $FormalMapVariableList,
;                            kTestPred(catpredvec.i, domain, predvec))
;             if domain then p := EVAL(p)
;             pred := simpCatPredicate(p)
;             if domname and CONTAINED('%, pred) then
;                 pred := SUBST(domname, '%, pred)
;             (pak := catinfo.i) and pred   --only those with default packages
;         pakform ==
;             -- in case it has been instantiated
;             pak and not(IDENTP(pak)) => devaluate(pak)
;             catform := kFormatSlotDomain1(catvec.i, infovec)
;             res := dbSubConform(rest(conform), [pak, "%", :rest(catform)])
;             domname => SUBST(domname, '%, res)
;             res
;     [:dbAddChain(conform), :catforms]

(DEFUN |dbSearchOrder| (|conform| |domname| |domain|)
  (PROG (|name| |infovec| |u| |predvec| |catpredvec| |catinfo| |catvec| |p|
         |pred| |pak| |catform| |res| |catforms|)
    (RETURN
     (PROGN
      (SETQ |conform| (OR |domname| |conform|))
      (SETQ |name| (|opOf| |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |u| (ELT |infovec| 3))
      (SETQ |predvec|
              (COND (|domain| (ELT |domain| 3))
                    (#1='T (|get_database| |name| 'PREDICATES))))
      (SETQ |catpredvec| (CAR |u|))
      (SETQ |catinfo| (CADR |u|))
      (SETQ |catvec| (CADDR |u|))
      (SETQ |catforms|
              ((LAMBDA (|bfVar#17| |bfVar#16| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#16|) (RETURN (NREVERSE |bfVar#17|)))
                        (#1#
                         (AND
                          (PROGN
                           (SETQ |p|
                                   (SUBLISLIS (CDR |conform|)
                                    |$FormalMapVariableList|
                                    (|kTestPred| (ELT |catpredvec| |i|)
                                     |domain| |predvec|)))
                           (COND (|domain| (SETQ |p| (EVAL |p|))))
                           (SETQ |pred| (|simpCatPredicate| |p|))
                           (COND
                            ((AND |domname| (CONTAINED '% |pred|))
                             (SETQ |pred| (SUBST |domname| '% |pred|))))
                           (AND (SETQ |pak| (ELT |catinfo| |i|)) |pred|))
                          (SETQ |bfVar#17|
                                  (CONS
                                   (CONS
                                    (COND
                                     ((AND |pak| (NULL (IDENTP |pak|)))
                                      (|devaluate| |pak|))
                                     (#1#
                                      (PROGN
                                       (SETQ |catform|
                                               (|kFormatSlotDomain1|
                                                (ELT |catvec| |i|) |infovec|))
                                       (SETQ |res|
                                               (|dbSubConform| (CDR |conform|)
                                                (CONS |pak|
                                                      (CONS '%
                                                            (CDR |catform|)))))
                                       (COND
                                        (|domname| (SUBST |domname| '% |res|))
                                        (#1# |res|)))))
                                    |pred|)
                                   |bfVar#17|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |catvec|) 0))
      (APPEND (|dbAddChain| |conform|) |catforms|)))))

; kisValidType(typeForm) ==
;     $ProcessInteractiveValue: fluid := true
;     $noEvalTypeMsg: fluid := true
;     $printTimeIfTrue : local := false
;     $printStorageIfTrue : local := false
;     $BreakMode : local := 'throw_reader
;     CATCH('SPAD_READER, CATCH('top_level, processInteractive(typeForm, nil)))
;         is [[h, :.], :t] and member(h, '(Type Category)) => t
;     false

(DEFUN |kisValidType| (|typeForm|)
  (PROG (|$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue| |$noEvalTypeMsg|
         |$ProcessInteractiveValue| |t| |h| |ISTMP#2| |ISTMP#1|)
    (DECLARE
     (SPECIAL |$BreakMode| |$printStorageIfTrue| |$printTimeIfTrue|
      |$noEvalTypeMsg| |$ProcessInteractiveValue|))
    (RETURN
     (PROGN
      (SETQ |$ProcessInteractiveValue| T)
      (SETQ |$noEvalTypeMsg| T)
      (SETQ |$printTimeIfTrue| NIL)
      (SETQ |$printStorageIfTrue| NIL)
      (SETQ |$BreakMode| '|throw_reader|)
      (COND
       ((AND
         (PROGN
          (SETQ |ISTMP#1|
                  (CATCH 'SPAD_READER
                    (CATCH '|top_level|
                      (|processInteractive| |typeForm| NIL))))
          (AND (CONSP |ISTMP#1|)
               (PROGN
                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                (AND (CONSP |ISTMP#2|)
                     (PROGN (SETQ |h| (CAR |ISTMP#2|)) #1='T)))
               (PROGN (SETQ |t| (CDR |ISTMP#1|)) #1#)))
         (|member| |h| '(|Type| |Category|)))
        |t|)
       (#1# NIL))))))

; parseNoMacroFromString(s) ==
;     s := next(function ncloopParse,
;               next(function lineoftoks, incString(s)))
;     StreamNull(s) => nil
;     pf2Sex(first(rest(first(s))))

(DEFUN |parseNoMacroFromString| (|s|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |s|
              (|next| #'|ncloopParse|
               (|next| #'|lineoftoks| (|incString| |s|))))
      (COND ((|StreamNull| |s|) NIL) ('T (|pf2Sex| (CAR (CDR (CAR |s|))))))))))

; mkConform(kind, name, argString) ==
;     kind ~= '"default package" =>
;         form := STRCONC(name, argString)
;         parse := parseNoMacroFromString(form)
;         null(parse) =>
;             sayBrightlyNT '"Won't parse: "
;             pp(form)
;             systemError('"Keywords in argument list?")
;         ATOM(parse) => [parse]
;         parse
;     -- & case
;     [INTERN(name), :rest(ncParseFromString(STRCONC(char('d), argString)))]

(DEFUN |mkConform| (|kind| |name| |argString|)
  (PROG (|form| |parse|)
    (RETURN
     (COND
      ((NOT (EQUAL |kind| "default package"))
       (PROGN
        (SETQ |form| (STRCONC |name| |argString|))
        (SETQ |parse| (|parseNoMacroFromString| |form|))
        (COND
         ((NULL |parse|)
          (PROGN
           (|sayBrightlyNT| "Won't parse: ")
           (|pp| |form|)
           (|systemError| "Keywords in argument list?")))
         ((ATOM |parse|) (LIST |parse|)) (#1='T |parse|))))
      (#1#
       (CONS (INTERN |name|)
             (CDR
              (|ncParseFromString| (STRCONC (|char| '|d|) |argString|)))))))))

; kTestPred(n, dom, preds) ==
;     n = 0 => true
;     dom => testBitVector(preds, n)
;     simpHasPred(preds.(n - 1))

(DEFUN |kTestPred| (|n| |dom| |preds|)
  (PROG ()
    (RETURN
     (COND ((EQL |n| 0) T) (|dom| (|testBitVector| |preds| |n|))
           ('T (|simpHasPred| (ELT |preds| (- |n| 1))))))))

; dbAddChainDomain(conform) ==
;     [name, :args] := conform
;     infovec := dbInfovec(name) or return nil  --exit for categories
;     template := infovec.0
;     null(form := template.5) => nil
;     dbSubConform(args, kFormatSlotDomain1(devaluate(form), infovec))

(DEFUN |dbAddChainDomain| (|conform|)
  (PROG (|name| |args| |infovec| |template| |form|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |infovec| (OR (|dbInfovec| |name|) (RETURN NIL)))
      (SETQ |template| (ELT |infovec| 0))
      (COND ((NULL (SETQ |form| (ELT |template| 5))) NIL)
            ('T
             (|dbSubConform| |args|
              (|kFormatSlotDomain1| (|devaluate| |form|) |infovec|))))))))

; dbSubConform(args, u) ==
;     ATOM(u) =>
;         (n := position(u,$FormalMapVariableList)) >= 0 => args.n
;         u
;     u is ['local, y] => dbSubConform(args, y)
;     [dbSubConform(args,x) for x in u]

(DEFUN |dbSubConform| (|args| |u|)
  (PROG (|n| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((ATOM |u|)
       (COND
        ((NOT (MINUSP (SETQ |n| (|position| |u| |$FormalMapVariableList|))))
         (ELT |args| |n|))
        (#1='T |u|)))
      ((AND (CONSP |u|) (EQ (CAR |u|) '|local|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                  (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#))))
       (|dbSubConform| |args| |y|))
      (#1#
       ((LAMBDA (|bfVar#19| |bfVar#18| |x|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#18|) (PROGN (SETQ |x| (CAR |bfVar#18|)) NIL))
             (RETURN (NREVERSE |bfVar#19|)))
            (#1#
             (SETQ |bfVar#19| (CONS (|dbSubConform| |args| |x|) |bfVar#19|))))
           (SETQ |bfVar#18| (CDR |bfVar#18|))))
        NIL |u| NIL))))))

; dbAddChain(conform) ==
;     u := dbAddChainDomain(conform) =>
;         ATOM(u) => nil
;         [[u, :true], :dbAddChain(u)]
;     nil

(DEFUN |dbAddChain| (|conform|)
  (PROG (|u|)
    (RETURN
     (COND
      ((SETQ |u| (|dbAddChainDomain| |conform|))
       (COND ((ATOM |u|) NIL) (#1='T (CONS (CONS |u| T) (|dbAddChain| |u|)))))
      (#1# NIL)))))

; buildGloss() ==  --called by buildDatabase (database.boot)
; --starting with gloss.text, build glosskey.text and glossdef.text
;   $constructorName : local := nil
;   $exposeFlag : local := true
;   $x : local := nil
;   $attribute? : local := true     --do not surround first word
;   pathname := '"gloss.text"
;   instream := MAKE_INSTREAM(pathname)
;   keypath  := '"glosskey.text"
;   maybe_delete_file(keypath)
;   outstream := MAKE_OUTSTREAM(keypath)
;   htpath   := '"gloss.ht"
;   maybe_delete_file(htpath)
;   htstream := MAKE_OUTSTREAM(htpath)
;   defpath  := '"glossdef.text"
;   defstream := MAKE_OUTSTREAM(defpath)
;   pairs := getGlossLines instream
;   PRINTEXP('"\begin{page}{GlossaryPage}{G l o s s a r y}\beginscroll\beginmenu",htstream)
;   for [name,:line] in pairs repeat
;     outP  := FILE_-POSITION outstream
;     defP  := FILE_-POSITION defstream
;     n_line := transformAndRecheckComments(name,[line])
;     PRINTEXP(name, outstream)
;     PRINTEXP($tick,outstream)
;     PRINTEXP(defP, outstream)
;     TERPRI(outstream)
;     PRINTEXP('"\item\newline{\em \menuitemstyle{}}{\em ",htstream)
;     PRINTEXP(name,        htstream)
;     PRINTEXP('"}\space{}",htstream)
;     TERPRI(htstream)
;     PRINTEXP(outP, defstream)
;     PRINTEXP($tick,defstream)
;     PRINTEXP(n_line, defstream)
;     TERPRI defstream
;     PRINTEXP(n_line, htstream)
;     TERPRI htstream
;   PRINTEXP('"\endmenu\endscroll",htstream)
;   PRINTEXP('"\lispdownlink{Search}{(|htGloss| _"\stringvalue{pattern}_")} for glossary entry matching \inputstring{pattern}{24}{*}",htstream)
;   PRINTEXP('"\end{page}",htstream)
;   CLOSE(instream)
;   CLOSE(outstream)
;   CLOSE(defstream)
;   CLOSE(htstream)

(DEFUN |buildGloss| ()
  (PROG (|$attribute?| |$x| |$exposeFlag| |$constructorName| |pathname|
         |instream| |keypath| |outstream| |htpath| |htstream| |defpath|
         |defstream| |pairs| |name| |line| |outP| |defP| |n_line|)
    (DECLARE (SPECIAL |$attribute?| |$x| |$exposeFlag| |$constructorName|))
    (RETURN
     (PROGN
      (SETQ |$constructorName| NIL)
      (SETQ |$exposeFlag| T)
      (SETQ |$x| NIL)
      (SETQ |$attribute?| T)
      (SETQ |pathname| "gloss.text")
      (SETQ |instream| (MAKE_INSTREAM |pathname|))
      (SETQ |keypath| "glosskey.text")
      (|maybe_delete_file| |keypath|)
      (SETQ |outstream| (MAKE_OUTSTREAM |keypath|))
      (SETQ |htpath| "gloss.ht")
      (|maybe_delete_file| |htpath|)
      (SETQ |htstream| (MAKE_OUTSTREAM |htpath|))
      (SETQ |defpath| "glossdef.text")
      (SETQ |defstream| (MAKE_OUTSTREAM |defpath|))
      (SETQ |pairs| (|getGlossLines| |instream|))
      (PRINTEXP
       "\\begin{page}{GlossaryPage}{G l o s s a r y}\\beginscroll\\beginmenu"
       |htstream|)
      ((LAMBDA (|bfVar#21| |bfVar#20|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#21|)
                (PROGN (SETQ |bfVar#20| (CAR |bfVar#21|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#20|)
                 (PROGN
                  (SETQ |name| (CAR |bfVar#20|))
                  (SETQ |line| (CDR |bfVar#20|))
                  #1#)
                 (PROGN
                  (SETQ |outP| (FILE-POSITION |outstream|))
                  (SETQ |defP| (FILE-POSITION |defstream|))
                  (SETQ |n_line|
                          (|transformAndRecheckComments| |name| (LIST |line|)))
                  (PRINTEXP |name| |outstream|)
                  (PRINTEXP |$tick| |outstream|)
                  (PRINTEXP |defP| |outstream|)
                  (TERPRI |outstream|)
                  (PRINTEXP "\\item\\newline{\\em \\menuitemstyle{}}{\\em "
                   |htstream|)
                  (PRINTEXP |name| |htstream|)
                  (PRINTEXP "}\\space{}" |htstream|)
                  (TERPRI |htstream|)
                  (PRINTEXP |outP| |defstream|)
                  (PRINTEXP |$tick| |defstream|)
                  (PRINTEXP |n_line| |defstream|)
                  (TERPRI |defstream|)
                  (PRINTEXP |n_line| |htstream|)
                  (TERPRI |htstream|)))))
          (SETQ |bfVar#21| (CDR |bfVar#21|))))
       |pairs| NIL)
      (PRINTEXP "\\endmenu\\endscroll" |htstream|)
      (PRINTEXP
       "\\lispdownlink{Search}{(|htGloss| \"\\stringvalue{pattern}\")} for glossary entry matching \\inputstring{pattern}{24}{*}"
       |htstream|)
      (PRINTEXP "\\end{page}" |htstream|)
      (CLOSE |instream|)
      (CLOSE |outstream|)
      (CLOSE |defstream|)
      (CLOSE |htstream|)))))

; getGlossLines instream ==
; --instream has text of the form:
; ----- key1`this is the first line
; ----- and this is the second
; ----- key2'and this is the third
; --result is
; ----- key1'this is the first line and this is the second
; ----- key2'and this is the third
;   keys := nil
;   text := nil
;   lastLineHadTick := false
;   while (line := read_line(instream)) repeat
;     #line = 0 => 'skip
;     n := charPosition($tick,line,0)
;     last := IFCAR text
;     n > MAXINDEX line =>  --this line is continuation of previous line; concat it
;       fill :=
;         #last = 0 =>
;           lastLineHadTick => '""
;           '"\blankline "
;         #last > 0 and last.(MAXINDEX last) ~= $charBlank => $charBlank
;         '""
;       lastLineHadTick := false
;       text := [STRCONC(last,fill,line),:rest text]
;     lastLineHadTick := true
;     keys := [SUBSTRING(line,0,n),:keys]
;     text := [SUBSTRING(line,n + 1,nil),:text]
;   ASSOCRIGHT listSort(function GLESSEQP,[[DOWNCASE key,key,:def] for key in keys for def in text])

(DEFUN |getGlossLines| (|instream|)
  (PROG (|keys| |text| |lastLineHadTick| |line| |n| |last| |fill|)
    (RETURN
     (PROGN
      (SETQ |keys| NIL)
      (SETQ |text| NIL)
      (SETQ |lastLineHadTick| NIL)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT (SETQ |line| (|read_line| |instream|))) (RETURN NIL))
                (#1='T
                 (COND ((EQL (LENGTH |line|) 0) '|skip|)
                       (#1#
                        (PROGN
                         (SETQ |n| (|charPosition| |$tick| |line| 0))
                         (SETQ |last| (IFCAR |text|))
                         (COND
                          ((< (MAXINDEX |line|) |n|)
                           (PROGN
                            (SETQ |fill|
                                    (COND
                                     ((EQL (LENGTH |last|) 0)
                                      (COND (|lastLineHadTick| "")
                                            (#1# "\\blankline ")))
                                     ((AND (< 0 (LENGTH |last|))
                                           (NOT
                                            (EQUAL
                                             (ELT |last| (MAXINDEX |last|))
                                             |$charBlank|)))
                                      |$charBlank|)
                                     (#1# "")))
                            (SETQ |lastLineHadTick| NIL)
                            (SETQ |text|
                                    (CONS (STRCONC |last| |fill| |line|)
                                          (CDR |text|)))))
                          (#1#
                           (PROGN
                            (SETQ |lastLineHadTick| T)
                            (SETQ |keys|
                                    (CONS (SUBSTRING |line| 0 |n|) |keys|))
                            (SETQ |text|
                                    (CONS (SUBSTRING |line| (+ |n| 1) NIL)
                                          |text|)))))))))))))
      (ASSOCRIGHT
       (|listSort| #'GLESSEQP
        ((LAMBDA (|bfVar#24| |bfVar#22| |key| |bfVar#23| |def|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#22|) (PROGN (SETQ |key| (CAR |bfVar#22|)) NIL)
                  (ATOM |bfVar#23|) (PROGN (SETQ |def| (CAR |bfVar#23|)) NIL))
              (RETURN (NREVERSE |bfVar#24|)))
             (#1#
              (SETQ |bfVar#24|
                      (CONS (CONS (DOWNCASE |key|) (CONS |key| |def|))
                            |bfVar#24|))))
            (SETQ |bfVar#22| (CDR |bfVar#22|))
            (SETQ |bfVar#23| (CDR |bfVar#23|))))
         NIL |keys| NIL |text| NIL)))))))

; mkUsersHashTable() ==  --called by make-databases (daase.lisp)
;   usersTb := MAKE_HASHTABLE('EQUAL)
;   for x in allConstructors() repeat
;     for conform in getImports x repeat
;       name := opOf conform
;       if not MEMQ(name,'(QUOTE)) then
;                 HPUT(usersTb, name, insert(x, HGET(usersTb, name)))
;   for k in HKEYS(usersTb) repeat
;         HPUT(usersTb, k, listSort(function GLESSEQP, HGET(usersTb, k)))
;   for x in allConstructors() | isDefaultPackageName x repeat
;         HPUT(usersTb, x, getDefaultPackageClients(x))
;   usersTb

(DEFUN |mkUsersHashTable| ()
  (PROG (|name| |usersTb|)
    (RETURN
     (PROGN
      (SETQ |usersTb| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#25| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#25|) (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#26| |conform|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#26|)
                      (PROGN (SETQ |conform| (CAR |bfVar#26|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (PROGN
                   (SETQ |name| (|opOf| |conform|))
                   (COND
                    ((NULL (MEMQ |name| '(QUOTE)))
                     (HPUT |usersTb| |name|
                           (|insert| |x| (HGET |usersTb| |name|))))))))
                (SETQ |bfVar#26| (CDR |bfVar#26|))))
             (|getImports| |x|) NIL)))
          (SETQ |bfVar#25| (CDR |bfVar#25|))))
       (|allConstructors|) NIL)
      ((LAMBDA (|bfVar#27| |k|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#27|) (PROGN (SETQ |k| (CAR |bfVar#27|)) NIL))
            (RETURN NIL))
           (#1#
            (HPUT |usersTb| |k| (|listSort| #'GLESSEQP (HGET |usersTb| |k|)))))
          (SETQ |bfVar#27| (CDR |bfVar#27|))))
       (HKEYS |usersTb|) NIL)
      ((LAMBDA (|bfVar#28| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#28|) (PROGN (SETQ |x| (CAR |bfVar#28|)) NIL))
            (RETURN NIL))
           (#1#
            (AND (|isDefaultPackageName| |x|)
                 (HPUT |usersTb| |x| (|getDefaultPackageClients| |x|)))))
          (SETQ |bfVar#28| (CDR |bfVar#28|))))
       (|allConstructors|) NIL)
      |usersTb|))))

; getDefaultPackageClients con ==  --called by mkUsersHashTable
;   catname := INTERN SUBSTRING(s := PNAME con,0,MAXINDEX s)
;   for [catAncestor,:.] in childrenOf([catname]) repeat
;     pakname := INTERN STRCONC(PNAME catAncestor,'"&")
;     if get_database(pakname, 'ABBREVIATION) then acc := [pakname,:acc]
;     acc := union([CAAR x for x in domainsOf([catAncestor],nil)],acc)
;   listSort(function GLESSEQP,acc)

(DEFUN |getDefaultPackageClients| (|con|)
  (PROG (|s| |catname| |catAncestor| |pakname| |acc|)
    (RETURN
     (PROGN
      (SETQ |catname|
              (INTERN (SUBSTRING (SETQ |s| (PNAME |con|)) 0 (MAXINDEX |s|))))
      ((LAMBDA (|bfVar#30| |bfVar#29|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#30|)
                (PROGN (SETQ |bfVar#29| (CAR |bfVar#30|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#29|)
                 (PROGN (SETQ |catAncestor| (CAR |bfVar#29|)) #1#)
                 (PROGN
                  (SETQ |pakname| (INTERN (STRCONC (PNAME |catAncestor|) "&")))
                  (COND
                   ((|get_database| |pakname| 'ABBREVIATION)
                    (SETQ |acc| (CONS |pakname| |acc|))))
                  (SETQ |acc|
                          (|union|
                           ((LAMBDA (|bfVar#32| |bfVar#31| |x|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#31|)
                                     (PROGN (SETQ |x| (CAR |bfVar#31|)) NIL))
                                 (RETURN (NREVERSE |bfVar#32|)))
                                (#1#
                                 (SETQ |bfVar#32|
                                         (CONS (CAAR |x|) |bfVar#32|))))
                               (SETQ |bfVar#31| (CDR |bfVar#31|))))
                            NIL (|domainsOf| (LIST |catAncestor|) NIL) NIL)
                           |acc|))))))
          (SETQ |bfVar#30| (CDR |bfVar#30|))))
       (|childrenOf| (LIST |catname|)) NIL)
      (|listSort| #'GLESSEQP |acc|)))))

; mkDependentsHashTable() == --called by make-databases (database.boot)
;     depTb := MAKE_HASHTABLE('EQUAL)
;     for nam in allConstructors() repeat
;         for con in getArgumentConstructors nam repeat
;             HPUT(depTb, con, [nam, :HGET(depTb, con)])
;     for k in HKEYS(depTb) repeat
;         HPUT(depTb, k, listSort(function GLESSEQP, HGET(depTb, k)))
;     depTb

(DEFUN |mkDependentsHashTable| ()
  (PROG (|depTb|)
    (RETURN
     (PROGN
      (SETQ |depTb| (MAKE_HASHTABLE 'EQUAL))
      ((LAMBDA (|bfVar#33| |nam|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#33|) (PROGN (SETQ |nam| (CAR |bfVar#33|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#34| |con|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#34|)
                      (PROGN (SETQ |con| (CAR |bfVar#34|)) NIL))
                  (RETURN NIL))
                 (#1# (HPUT |depTb| |con| (CONS |nam| (HGET |depTb| |con|)))))
                (SETQ |bfVar#34| (CDR |bfVar#34|))))
             (|getArgumentConstructors| |nam|) NIL)))
          (SETQ |bfVar#33| (CDR |bfVar#33|))))
       (|allConstructors|) NIL)
      ((LAMBDA (|bfVar#35| |k|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#35|) (PROGN (SETQ |k| (CAR |bfVar#35|)) NIL))
            (RETURN NIL))
           (#1# (HPUT |depTb| |k| (|listSort| #'GLESSEQP (HGET |depTb| |k|)))))
          (SETQ |bfVar#35| (CDR |bfVar#35|))))
       (HKEYS |depTb|) NIL)
      |depTb|))))

; getArgumentConstructors con == --called by mkDependentsHashTable
;   argtypes := IFCDR IFCAR getConstructorModemap con or return nil
;   fn argtypes where
;     fn(u) == "union"/[gn x for x in u]
;     gn(x) ==
;       atom x => nil
;       x is ['Join,:r] => fn(r)
;       x is ['CATEGORY,:.] => nil
;       constructor? first x => [first x,:fn rest x]
;       fn rest x

(DEFUN |getArgumentConstructors| (|con|)
  (PROG (|argtypes|)
    (RETURN
     (PROGN
      (SETQ |argtypes|
              (OR (IFCDR (IFCAR (|getConstructorModemap| |con|)))
                  (RETURN NIL)))
      (|getArgumentConstructors,fn| |argtypes|)))))
(DEFUN |getArgumentConstructors,fn| (|u|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#37| |bfVar#36| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#36|) (PROGN (SETQ |x| (CAR |bfVar#36|)) NIL))
           (RETURN |bfVar#37|))
          ('T
           (SETQ |bfVar#37|
                   (|union| |bfVar#37| (|getArgumentConstructors,gn| |x|)))))
         (SETQ |bfVar#36| (CDR |bfVar#36|))))
      NIL |u| NIL))))
(DEFUN |getArgumentConstructors,gn| (|x|)
  (PROG (|r|)
    (RETURN
     (COND ((ATOM |x|) NIL)
           ((AND (CONSP |x|) (EQ (CAR |x|) '|Join|)
                 (PROGN (SETQ |r| (CDR |x|)) #1='T))
            (|getArgumentConstructors,fn| |r|))
           ((AND (CONSP |x|) (EQ (CAR |x|) 'CATEGORY)) NIL)
           ((|constructor?| (CAR |x|))
            (CONS (CAR |x|) (|getArgumentConstructors,fn| (CDR |x|))))
           (#1# (|getArgumentConstructors,fn| (CDR |x|)))))))

; getImports conname == --called by mkUsersHashTable
;   conform := get_database(conname, 'CONSTRUCTORFORM)
;   infovec := dbInfovec conname or return nil
;   template := infovec.0
;   u := [import(i,template)
;           for i in 5..(MAXINDEX template) | test]  where
;     test == template.i is [op,:.] and IDENTP op
;               and not MEMQ(op,'(Mapping Union Record Enumeration CONS QUOTE local))
;     import(x,template) ==
;       x is [op,:args] =>
;         op = 'QUOTE or op = 'NRTEVAL => first args
;         op = 'local => first args
;         op = 'Record =>
;           ['Record,:[[":",CADR y,import(CADDR y,template)] for y in args]]
;
; --TTT next three lines: handles some tagged/untagged Union case.
;         op = 'Union=>
;           args is [['_:,:x1],:x2] =>
;                -- tagged!
;                ['Union,:[[":",CADR y,import(CADDR y,template)] for y in args]]
;           [op,:[import(y,template) for y in args]]
;
;         [op,:[import(y,template) for y in args]]
;       INTEGERP x => import(template.x,template)
;       x = '% => '%
;       x = "$$" => "$$"
;       STRINGP x => x
;       systemError '"bad argument in template"
;   listSort(function GLESSEQP,SUBLISLIS(rest conform,$FormalMapVariableList,u))

(DEFUN |getImports| (|conname|)
  (PROG (|conform| |infovec| |template| |ISTMP#1| |op| |u|)
    (RETURN
     (PROGN
      (SETQ |conform| (|get_database| |conname| 'CONSTRUCTORFORM))
      (SETQ |infovec| (OR (|dbInfovec| |conname|) (RETURN NIL)))
      (SETQ |template| (ELT |infovec| 0))
      (SETQ |u|
              ((LAMBDA (|bfVar#39| |bfVar#38| |i|)
                 (LOOP
                  (COND ((> |i| |bfVar#38|) (RETURN (NREVERSE |bfVar#39|)))
                        (#1='T
                         (AND
                          (AND
                           (PROGN
                            (SETQ |ISTMP#1| (ELT |template| |i|))
                            (AND (CONSP |ISTMP#1|)
                                 (PROGN (SETQ |op| (CAR |ISTMP#1|)) #1#)))
                           (IDENTP |op|)
                           (NULL
                            (MEMQ |op|
                                  '(|Mapping| |Union| |Record| |Enumeration|
                                    CONS QUOTE |local|))))
                          (SETQ |bfVar#39|
                                  (CONS (|getImports,import| |i| |template|)
                                        |bfVar#39|)))))
                  (SETQ |i| (+ |i| 1))))
               NIL (MAXINDEX |template|) 5))
      (|listSort| #'GLESSEQP
       (SUBLISLIS (CDR |conform|) |$FormalMapVariableList| |u|))))))
(DEFUN |getImports,import| (|x| |template|)
  (PROG (|op| |args| |ISTMP#1| |x1| |x2|)
    (RETURN
     (COND
      ((AND (CONSP |x|)
            (PROGN (SETQ |op| (CAR |x|)) (SETQ |args| (CDR |x|)) #1='T))
       (COND ((OR (EQ |op| 'QUOTE) (EQ |op| 'NRTEVAL)) (CAR |args|))
             ((EQ |op| '|local|) (CAR |args|))
             ((EQ |op| '|Record|)
              (CONS '|Record|
                    ((LAMBDA (|bfVar#41| |bfVar#40| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#40|)
                              (PROGN (SETQ |y| (CAR |bfVar#40|)) NIL))
                          (RETURN (NREVERSE |bfVar#41|)))
                         (#1#
                          (SETQ |bfVar#41|
                                  (CONS
                                   (LIST '|:| (CADR |y|)
                                         (|getImports,import| (CADDR |y|)
                                          |template|))
                                   |bfVar#41|))))
                        (SETQ |bfVar#40| (CDR |bfVar#40|))))
                     NIL |args| NIL)))
             ((EQ |op| '|Union|)
              (COND
               ((AND (CONSP |args|)
                     (PROGN
                      (SETQ |ISTMP#1| (CAR |args|))
                      (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)
                           (PROGN (SETQ |x1| (CDR |ISTMP#1|)) #1#)))
                     (PROGN (SETQ |x2| (CDR |args|)) #1#))
                (CONS '|Union|
                      ((LAMBDA (|bfVar#43| |bfVar#42| |y|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#42|)
                                (PROGN (SETQ |y| (CAR |bfVar#42|)) NIL))
                            (RETURN (NREVERSE |bfVar#43|)))
                           (#1#
                            (SETQ |bfVar#43|
                                    (CONS
                                     (LIST '|:| (CADR |y|)
                                           (|getImports,import| (CADDR |y|)
                                            |template|))
                                     |bfVar#43|))))
                          (SETQ |bfVar#42| (CDR |bfVar#42|))))
                       NIL |args| NIL)))
               (#1#
                (CONS |op|
                      ((LAMBDA (|bfVar#45| |bfVar#44| |y|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#44|)
                                (PROGN (SETQ |y| (CAR |bfVar#44|)) NIL))
                            (RETURN (NREVERSE |bfVar#45|)))
                           (#1#
                            (SETQ |bfVar#45|
                                    (CONS (|getImports,import| |y| |template|)
                                          |bfVar#45|))))
                          (SETQ |bfVar#44| (CDR |bfVar#44|))))
                       NIL |args| NIL)))))
             (#1#
              (CONS |op|
                    ((LAMBDA (|bfVar#47| |bfVar#46| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#46|)
                              (PROGN (SETQ |y| (CAR |bfVar#46|)) NIL))
                          (RETURN (NREVERSE |bfVar#47|)))
                         (#1#
                          (SETQ |bfVar#47|
                                  (CONS (|getImports,import| |y| |template|)
                                        |bfVar#47|))))
                        (SETQ |bfVar#46| (CDR |bfVar#46|))))
                     NIL |args| NIL)))))
      ((INTEGERP |x|) (|getImports,import| (ELT |template| |x|) |template|))
      ((EQ |x| '%) '%) ((EQ |x| '$$) '$$) ((STRINGP |x|) |x|)
      (#1# (|systemError| "bad argument in template"))))))

; getParentsFor(cname,formalParams,constructorCategory) ==
; --called by compDefineFunctor1
;   acc := nil
;   formals := TAKE(#formalParams,$TriangleVariableList)
;   constructorForm := get_database(cname, 'CONSTRUCTORFORM)
;   for x in folks constructorCategory repeat
;     x := SUBLISLIS(formalParams,formals,x)
;     x := SUBLISLIS(IFCDR constructorForm,formalParams,x)
;     acc := [:explodeIfs x,:acc]
;   NREVERSE acc

(DEFUN |getParentsFor| (|cname| |formalParams| |constructorCategory|)
  (PROG (|acc| |formals| |constructorForm|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      (SETQ |formals| (TAKE (LENGTH |formalParams|) |$TriangleVariableList|))
      (SETQ |constructorForm| (|get_database| |cname| 'CONSTRUCTORFORM))
      ((LAMBDA (|bfVar#48| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#48|) (PROGN (SETQ |x| (CAR |bfVar#48|)) NIL))
            (RETURN NIL))
           ('T
            (PROGN
             (SETQ |x| (SUBLISLIS |formalParams| |formals| |x|))
             (SETQ |x|
                     (SUBLISLIS (IFCDR |constructorForm|) |formalParams| |x|))
             (SETQ |acc| (APPEND (|explodeIfs| |x|) |acc|)))))
          (SETQ |bfVar#48| (CDR |bfVar#48|))))
       (|folks| |constructorCategory|) NIL)
      (NREVERSE |acc|)))))

; parentsOf con == --called by kcpPage, ancestorsRecur
;   if null BOUNDP '$parentsCache then SETQ($parentsCache, MAKE_HASHTABLE('EQ))
;   HGET($parentsCache,con) or
;     parents := getParentsForDomain con
;     HPUT($parentsCache,con,parents)
;     parents

(DEFUN |parentsOf| (|con|)
  (PROG (|parents|)
    (RETURN
     (PROGN
      (COND
       ((NULL (BOUNDP '|$parentsCache|))
        (SETQ |$parentsCache| (MAKE_HASHTABLE 'EQ))))
      (OR (HGET |$parentsCache| |con|)
          (PROGN
           (SETQ |parents| (|getParentsForDomain| |con|))
           (HPUT |$parentsCache| |con| |parents|)
           |parents|))))))

; parentsOfForm [op,:argl] ==
;   parents := parentsOf op
;   null argl or argl = (newArgl := rest get_database(op, 'CONSTRUCTORFORM)) =>
;     parents
;   SUBLISLIS(argl, newArgl, parents)

(DEFUN |parentsOfForm| (|bfVar#49|)
  (PROG (|op| |argl| |parents| |newArgl|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#49|))
      (SETQ |argl| (CDR |bfVar#49|))
      (SETQ |parents| (|parentsOf| |op|))
      (COND
       ((OR (NULL |argl|)
            (EQUAL |argl|
                   (SETQ |newArgl|
                           (CDR (|get_database| |op| 'CONSTRUCTORFORM)))))
        |parents|)
       ('T (SUBLISLIS |argl| |newArgl| |parents|)))))))

; getParentsForDomain domname  == --called by parentsOf
;   acc := nil
;   for x in folks(get_database(domname, 'CONSTRUCTORCATEGORY)) repeat
;     x :=
;       get_database(domname,'CONSTRUCTORKIND) = 'category =>
;         sublisFormal(IFCDR getConstructorForm domname,x,$TriangleVariableList)
;       sublisFormal(IFCDR getConstructorForm domname,x)
;     acc := [:explodeIfs x,:acc]
;   NREVERSE acc

(DEFUN |getParentsForDomain| (|domname|)
  (PROG (|acc|)
    (RETURN
     (PROGN
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#50| |x|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#50|) (PROGN (SETQ |x| (CAR |bfVar#50|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |x|
                     (COND
                      ((EQ (|get_database| |domname| 'CONSTRUCTORKIND)
                           '|category|)
                       (|sublisFormal| (IFCDR (|getConstructorForm| |domname|))
                        |x| |$TriangleVariableList|))
                      (#1#
                       (|sublisFormal| (IFCDR (|getConstructorForm| |domname|))
                        |x|))))
             (SETQ |acc| (APPEND (|explodeIfs| |x|) |acc|)))))
          (SETQ |bfVar#50| (CDR |bfVar#50|))))
       (|folks| (|get_database| |domname| 'CONSTRUCTORCATEGORY)) NIL)
      (NREVERSE |acc|)))))

; explodeIfs x == main where  --called by getParents, getParentsForDomain
;   main ==
;     x is ['IF,p,a,b] => fn(p,a,b)
;     [[x,:true]]
;   fn(p,a,b) ==
;     [:"append"/[gn(p,y) for y in a],:"append"/[gn(['NOT,p],y) for y in b]]
;   gn(p,a) ==
;     a is ['IF,q,b,:.] => fn(MKPF([p,q],'AND),b,nil)
;     [[a,:p]]

(DEFUN |explodeIfs| (|x|)
  (PROG (|ISTMP#1| |p| |ISTMP#2| |a| |ISTMP#3| |b|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |x|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |p| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#2|))
                         (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                         (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                              (PROGN (SETQ |b| (CAR |ISTMP#3|)) #1='T))))))))
       (|explodeIfs,fn| |p| |a| |b|))
      (#1# (LIST (CONS |x| T)))))))
(DEFUN |explodeIfs,fn| (|p| |a| |b|)
  (PROG ()
    (RETURN
     (APPEND
      ((LAMBDA (|bfVar#52| |bfVar#51| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#51|) (PROGN (SETQ |y| (CAR |bfVar#51|)) NIL))
            (RETURN |bfVar#52|))
           (#1='T
            (SETQ |bfVar#52| (APPEND |bfVar#52| (|explodeIfs,gn| |p| |y|)))))
          (SETQ |bfVar#51| (CDR |bfVar#51|))))
       NIL |a| NIL)
      ((LAMBDA (|bfVar#54| |bfVar#53| |y|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#53|) (PROGN (SETQ |y| (CAR |bfVar#53|)) NIL))
            (RETURN |bfVar#54|))
           (#1#
            (SETQ |bfVar#54|
                    (APPEND |bfVar#54|
                            (|explodeIfs,gn| (LIST 'NOT |p|) |y|)))))
          (SETQ |bfVar#53| (CDR |bfVar#53|))))
       NIL |b| NIL)))))
(DEFUN |explodeIfs,gn| (|p| |a|)
  (PROG (|ISTMP#1| |q| |ISTMP#2| |b|)
    (RETURN
     (COND
      ((AND (CONSP |a|) (EQ (CAR |a|) 'IF)
            (PROGN
             (SETQ |ISTMP#1| (CDR |a|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |q| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|)
                        (PROGN (SETQ |b| (CAR |ISTMP#2|)) #1='T))))))
       (|explodeIfs,fn| (MKPF (LIST |p| |q|) 'AND) |b| NIL))
      (#1# (LIST (CONS |a| |p|)))))))

; folks u == --called by getParents and getParentsForDomain
;   atom u => nil
;   u is [op,:v] and MEMQ(op,'(Join PROGN))
;     or u is ['CATEGORY,a,:v] => "append"/[folks x for x in v]
;   u is ['SIGNATURE,:.] => nil
;   u is ['ATTRIBUTE,a] =>
;     PAIRP a and constructor? opOf a => folks a
;     nil
;   u is ['IF,p,q,r] =>
;     q1 := folks q
;     r1 := folks r
;     q1 or r1 => [['IF,p,q1,r1]]
;     nil
;   [u]

(DEFUN |folks| (|u|)
  (PROG (|op| |v| |ISTMP#1| |a| |p| |ISTMP#2| |q| |ISTMP#3| |r| |q1| |r1|)
    (RETURN
     (COND ((ATOM |u|) NIL)
           ((OR
             (AND (CONSP |u|)
                  (PROGN (SETQ |op| (CAR |u|)) (SETQ |v| (CDR |u|)) #1='T)
                  (MEMQ |op| '(|Join| PROGN)))
             (AND (CONSP |u|) (EQ (CAR |u|) 'CATEGORY)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |u|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN
                         (SETQ |a| (CAR |ISTMP#1|))
                         (SETQ |v| (CDR |ISTMP#1|))
                         #1#)))))
            ((LAMBDA (|bfVar#56| |bfVar#55| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#55|)
                      (PROGN (SETQ |x| (CAR |bfVar#55|)) NIL))
                  (RETURN |bfVar#56|))
                 (#1# (SETQ |bfVar#56| (APPEND |bfVar#56| (|folks| |x|)))))
                (SETQ |bfVar#55| (CDR |bfVar#55|))))
             NIL |v| NIL))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'SIGNATURE)) NIL)
           ((AND (CONSP |u|) (EQ (CAR |u|) 'ATTRIBUTE)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                       (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
            (COND
             ((AND (CONSP |a|) (|constructor?| (|opOf| |a|))) (|folks| |a|))
             (#1# NIL)))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'IF)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |p| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |q| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |r| (CAR |ISTMP#3|))
                                    #1#))))))))
            (PROGN
             (SETQ |q1| (|folks| |q|))
             (SETQ |r1| (|folks| |r|))
             (COND ((OR |q1| |r1|) (LIST (LIST 'IF |p| |q1| |r1|)))
                   (#1# NIL))))
           (#1# (LIST |u|))))))

; descendantsOf(conform,domform) ==  --called by kcdPage
;   'category = get_database((conname := opOf conform), 'CONSTRUCTORKIND) =>
;     cats := catsOf(conform,domform)
;     [op,:argl] := conform
;     null argl or argl = (newArgl := rest(get_database(op, 'CONSTRUCTORFORM)))
;         => cats
;     SUBLISLIS(argl, newArgl, cats)
;   'notAvailable

(DEFUN |descendantsOf| (|conform| |domform|)
  (PROG (|conname| |cats| |op| |argl| |newArgl|)
    (RETURN
     (COND
      ((EQ '|category|
           (|get_database| (SETQ |conname| (|opOf| |conform|))
            'CONSTRUCTORKIND))
       (PROGN
        (SETQ |cats| (|catsOf| |conform| |domform|))
        (SETQ |op| (CAR |conform|))
        (SETQ |argl| (CDR |conform|))
        (COND
         ((OR (NULL |argl|)
              (EQUAL |argl|
                     (SETQ |newArgl|
                             (CDR (|get_database| |op| 'CONSTRUCTORFORM)))))
          |cats|)
         (#1='T (SUBLISLIS |argl| |newArgl| |cats|)))))
      (#1# '|notAvailable|)))))

; childrenOf conform ==
;   [pair for pair in descendantsOf(conform,nil) |
;     childAssoc(conform,parentsOfForm first pair)]

(DEFUN |childrenOf| (|conform|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#58| |bfVar#57| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#57|) (PROGN (SETQ |pair| (CAR |bfVar#57|)) NIL))
           (RETURN (NREVERSE |bfVar#58|)))
          ('T
           (AND (|childAssoc| |conform| (|parentsOfForm| (CAR |pair|)))
                (SETQ |bfVar#58| (CONS |pair| |bfVar#58|)))))
         (SETQ |bfVar#57| (CDR |bfVar#57|))))
      NIL (|descendantsOf| |conform| NIL) NIL))))

; childAssoc(form,alist) ==
;   null (argl := rest form) => assoc(form, alist)
;   u := assocCar(opOf form, alist) => childArgCheck(argl, rest first u) and u
;   nil

(DEFUN |childAssoc| (|form| |alist|)
  (PROG (|argl| |u|)
    (RETURN
     (COND ((NULL (SETQ |argl| (CDR |form|))) (|assoc| |form| |alist|))
           ((SETQ |u| (|assocCar| (|opOf| |form|) |alist|))
            (AND (|childArgCheck| |argl| (CDR (CAR |u|))) |u|))
           ('T NIL)))))

; assocCar(x, al) == or/[pair for pair in al | x = CAAR pair]

(DEFUN |assocCar| (|x| |al|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#60| |bfVar#59| |pair|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#59|) (PROGN (SETQ |pair| (CAR |bfVar#59|)) NIL))
           (RETURN |bfVar#60|))
          ('T
           (AND (EQUAL |x| (CAAR |pair|))
                (PROGN
                 (SETQ |bfVar#60| |pair|)
                 (COND (|bfVar#60| (RETURN |bfVar#60|)))))))
         (SETQ |bfVar#59| (CDR |bfVar#59|))))
      NIL |al| NIL))))

; childArgCheck(argl, nargl) ==
;   and/[fn for x in argl for y in nargl for i in 0..] where
;     fn ==
;       x = y or constructor? opOf y => true
;       isSharpVar y => i = POSN1(y, $FormalMapVariableList)
;       false

(DEFUN |childArgCheck| (|argl| |nargl|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#63| |bfVar#61| |x| |bfVar#62| |y| |i|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#61|) (PROGN (SETQ |x| (CAR |bfVar#61|)) NIL)
               (ATOM |bfVar#62|) (PROGN (SETQ |y| (CAR |bfVar#62|)) NIL))
           (RETURN |bfVar#63|))
          (#1='T
           (PROGN
            (SETQ |bfVar#63|
                    (COND
                     ((OR (EQUAL |x| |y|) (|constructor?| (|opOf| |y|))) T)
                     ((|isSharpVar| |y|)
                      (EQUAL |i| (POSN1 |y| |$FormalMapVariableList|)))
                     (#1# NIL)))
            (COND ((NOT |bfVar#63|) (RETURN NIL))))))
         (SETQ |bfVar#61| (CDR |bfVar#61|))
         (SETQ |bfVar#62| (CDR |bfVar#62|))
         (SETQ |i| (+ |i| 1))))
      T |argl| NIL |nargl| NIL 0))))

; ancestors_of_cat(conform, domform) ==
;        conname := opOf(conform)
;        alist := get_database(conname, 'ANCESTORS)
;        argl := IFCDR domform or IFCDR conform
;        [pair for [a,:b] in alist | pair] where pair ==
;          left :=  sublisFormal(argl,a)
;          right := sublisFormal(argl,b)
;          if domform then right := simpHasPred right
;          null right => false
;          [left,:right]

(DEFUN |ancestors_of_cat| (|conform| |domform|)
  (PROG (|conname| |alist| |argl| |a| |b| |left| |right|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |alist| (|get_database| |conname| 'ANCESTORS))
      (SETQ |argl| (OR (IFCDR |domform|) (IFCDR |conform|)))
      ((LAMBDA (|bfVar#66| |bfVar#65| |bfVar#64|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#65|)
                (PROGN (SETQ |bfVar#64| (CAR |bfVar#65|)) NIL))
            (RETURN (NREVERSE |bfVar#66|)))
           (#1='T
            (AND (CONSP |bfVar#64|)
                 (PROGN
                  (SETQ |a| (CAR |bfVar#64|))
                  (SETQ |b| (CDR |bfVar#64|))
                  #1#)
                 #2=(PROGN
                     (SETQ |left| (|sublisFormal| |argl| |a|))
                     (SETQ |right| (|sublisFormal| |argl| |b|))
                     (COND (|domform| (SETQ |right| (|simpHasPred| |right|))))
                     (COND ((NULL |right|) NIL) (#1# (CONS |left| |right|))))
                 (SETQ |bfVar#66| (CONS #2# |bfVar#66|)))))
          (SETQ |bfVar#65| (CDR |bfVar#65|))))
       NIL |alist| NIL)))))

; ancestorsOf(conform,domform) ==  --called by kcaPage, originsInOrder,...
;   'category = get_database((conname := opOf(conform)), 'CONSTRUCTORKIND) =>
;        ancestors_of_cat(conform, domform)
;   computeAncestorsOf(conform,domform)

(DEFUN |ancestorsOf| (|conform| |domform|)
  (PROG (|conname|)
    (RETURN
     (COND
      ((EQ '|category|
           (|get_database| (SETQ |conname| (|opOf| |conform|))
            'CONSTRUCTORKIND))
       (|ancestors_of_cat| |conform| |domform|))
      ('T (|computeAncestorsOf| |conform| |domform|))))))

; computeAncestorsOf(conform,domform) ==
;   $done : local := MAKE_HASHTABLE('EQUAL)
;   $if :   local := MAKE_HASHTABLE('EQ)
;   ancestorsRecur(conform, domform, true, true)
;   acc := nil
;   for op in listSort(function GLESSEQP,HKEYS $if) repeat
;     for pair in HGET($if,op) repeat acc := [pair,:acc]
;   NREVERSE acc

(DEFUN |computeAncestorsOf| (|conform| |domform|)
  (PROG (|$if| |$done| |acc|)
    (DECLARE (SPECIAL |$if| |$done|))
    (RETURN
     (PROGN
      (SETQ |$done| (MAKE_HASHTABLE 'EQUAL))
      (SETQ |$if| (MAKE_HASHTABLE 'EQ))
      (|ancestorsRecur| |conform| |domform| T T)
      (SETQ |acc| NIL)
      ((LAMBDA (|bfVar#67| |op|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#67|) (PROGN (SETQ |op| (CAR |bfVar#67|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#68| |pair|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#68|)
                      (PROGN (SETQ |pair| (CAR |bfVar#68|)) NIL))
                  (RETURN NIL))
                 (#1# (SETQ |acc| (CONS |pair| |acc|))))
                (SETQ |bfVar#68| (CDR |bfVar#68|))))
             (HGET |$if| |op|) NIL)))
          (SETQ |bfVar#67| (CDR |bfVar#67|))))
       (|listSort| #'GLESSEQP (HKEYS |$if|)) NIL)
      (NREVERSE |acc|)))))

; ancestorsRecur(conform, domform, pred, firstTime?) ==
;   op      := opOf conform
;   pred = HGET($done, conform) => nil   --skip if already processed
;   parents :=
;     firstTime? and ($insideCategoryIfTrue or $insideFunctorIfTrue) =>
;         getParentsFor($op, $FormalMapVariableList, $lisplibCategory)
;     parentsOf op
;   originalConform :=
;     firstTime? and ($insideCategoryIfTrue or $insideFunctorIfTrue) =>
;         $functorForm
;     getConstructorForm op
;   if conform ~= originalConform then
;     parents := SUBLISLIS(IFCDR conform,IFCDR originalConform,parents)
;   for [newform,:p] in parents repeat
;     p is ['has, '%, newform] => "iterate"
;     if domform and rest domform then
;       newdomform := SUBLISLIS(rest domform,rest conform,newform)
;       p          := SUBLISLIS(rest domform,rest conform,p)
;     newPred := quickAnd(pred,p)
;     ancestorsAdd(simpHasPred newPred,newdomform or newform)
;     ancestorsRecur(newform,newdomform,newPred,false)
;   HPUT($done, conform, pred)                  --mark as already processed

(DEFUN |ancestorsRecur| (|conform| |domform| |pred| |firstTime?|)
  (PROG (|op| |parents| |originalConform| |newform| |p| |ISTMP#1| |ISTMP#2|
         |newdomform| |newPred|)
    (RETURN
     (PROGN
      (SETQ |op| (|opOf| |conform|))
      (COND ((EQUAL |pred| (HGET |$done| |conform|)) NIL)
            (#1='T
             (PROGN
              (SETQ |parents|
                      (COND
                       ((AND |firstTime?|
                             (OR |$insideCategoryIfTrue|
                                 |$insideFunctorIfTrue|))
                        (|getParentsFor| |$op| |$FormalMapVariableList|
                         |$lisplibCategory|))
                       (#1# (|parentsOf| |op|))))
              (SETQ |originalConform|
                      (COND
                       ((AND |firstTime?|
                             (OR |$insideCategoryIfTrue|
                                 |$insideFunctorIfTrue|))
                        |$functorForm|)
                       (#1# (|getConstructorForm| |op|))))
              (COND
               ((NOT (EQUAL |conform| |originalConform|))
                (SETQ |parents|
                        (SUBLISLIS (IFCDR |conform|) (IFCDR |originalConform|)
                         |parents|))))
              ((LAMBDA (|bfVar#70| |bfVar#69|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#70|)
                        (PROGN (SETQ |bfVar#69| (CAR |bfVar#70|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (AND (CONSP |bfVar#69|)
                         (PROGN
                          (SETQ |newform| (CAR |bfVar#69|))
                          (SETQ |p| (CDR |bfVar#69|))
                          #1#)
                         (COND
                          ((AND (CONSP |p|) (EQ (CAR |p|) '|has|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |p|))
                                 (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '%)
                                      (PROGN
                                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CDR |ISTMP#2|) NIL)
                                            (PROGN
                                             (SETQ |newform| (CAR |ISTMP#2|))
                                             #1#))))))
                           '|iterate|)
                          (#1#
                           (PROGN
                            (COND
                             ((AND |domform| (CDR |domform|))
                              (SETQ |newdomform|
                                      (SUBLISLIS (CDR |domform|)
                                       (CDR |conform|) |newform|))
                              (SETQ |p|
                                      (SUBLISLIS (CDR |domform|)
                                       (CDR |conform|) |p|))))
                            (SETQ |newPred| (|quickAnd| |pred| |p|))
                            (|ancestorsAdd| (|simpHasPred| |newPred|)
                             (OR |newdomform| |newform|))
                            (|ancestorsRecur| |newform| |newdomform| |newPred|
                             NIL)))))))
                  (SETQ |bfVar#70| (CDR |bfVar#70|))))
               |parents| NIL)
              (HPUT |$done| |conform| |pred|))))))))

; ancestorsAdd(pred,form) == --called by ancestorsRecur
;   null pred => nil
;   op := IFCAR form or form
;   alist := HGET($if,op)
;   existingNode := assoc(form,alist) =>
;     RPLACD(existingNode, quickOr(rest existingNode, pred))
;   HPUT($if,op,[[form,:pred],:alist])

(DEFUN |ancestorsAdd| (|pred| |form|)
  (PROG (|op| |alist| |existingNode|)
    (RETURN
     (COND ((NULL |pred|) NIL)
           (#1='T
            (PROGN
             (SETQ |op| (OR (IFCAR |form|) |form|))
             (SETQ |alist| (HGET |$if| |op|))
             (COND
              ((SETQ |existingNode| (|assoc| |form| |alist|))
               (RPLACD |existingNode| (|quickOr| (CDR |existingNode|) |pred|)))
              (#1# (HPUT |$if| |op| (CONS (CONS |form| |pred|) |alist|))))))))))

; domainsOf(conform, domname) ==
;   conname := opOf conform
;   u := [key for key in HKEYS $has_category_hash
;     | key is [anc,: =conname]]
;   --u is list of pairs (a . b) where b = conname
;   --we sort u then replace each b by the predicate for which this is true
;   s := listSort(function GLESSEQP,COPY u)
;   s := [[first pair, :get_database(pair, 'HASCATEGORY)] for pair in s]
;   transKCatAlist(conform,domname,listSort(function GLESSEQP,s))

(DEFUN |domainsOf| (|conform| |domname|)
  (PROG (|conname| |anc| |u| |s|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |u|
              ((LAMBDA (|bfVar#72| |bfVar#71| |key|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#71|)
                        (PROGN (SETQ |key| (CAR |bfVar#71|)) NIL))
                    (RETURN (NREVERSE |bfVar#72|)))
                   (#1='T
                    (AND (CONSP |key|) (PROGN (SETQ |anc| (CAR |key|)) #1#)
                         (EQUAL (CDR |key|) |conname|)
                         (SETQ |bfVar#72| (CONS |key| |bfVar#72|)))))
                  (SETQ |bfVar#71| (CDR |bfVar#71|))))
               NIL (HKEYS |$has_category_hash|) NIL))
      (SETQ |s| (|listSort| #'GLESSEQP (COPY |u|)))
      (SETQ |s|
              ((LAMBDA (|bfVar#74| |bfVar#73| |pair|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#73|)
                        (PROGN (SETQ |pair| (CAR |bfVar#73|)) NIL))
                    (RETURN (NREVERSE |bfVar#74|)))
                   (#1#
                    (SETQ |bfVar#74|
                            (CONS
                             (CONS (CAR |pair|)
                                   (|get_database| |pair| 'HASCATEGORY))
                             |bfVar#74|))))
                  (SETQ |bfVar#73| (CDR |bfVar#73|))))
               NIL |s| NIL))
      (|transKCatAlist| |conform| |domname| (|listSort| #'GLESSEQP |s|))))))

; catsOf(conform, domname) ==
;   conname := opOf conform
;   alist := nil
;   for key in allConstructors() repeat
;     for item in get_database(key, 'ANCESTORS) | conname = CAAR item repeat
;       [[op,:args],:pred] := item
;       newItem :=
;         args => [[args,:pred],:LASSOC(key,alist)]
;         pred
;       alist := insertShortAlist(key,newItem,alist)
;   transKCatAlist(conform,domname,listSort(function GLESSEQP,alist))

(DEFUN |catsOf| (|conform| |domname|)
  (PROG (|conname| |alist| |op| |args| |pred| |newItem|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#75| |key|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#75|) (PROGN (SETQ |key| (CAR |bfVar#75|)) NIL))
            (RETURN NIL))
           (#1='T
            ((LAMBDA (|bfVar#76| |item|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#76|)
                      (PROGN (SETQ |item| (CAR |bfVar#76|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (AND (EQUAL |conname| (CAAR |item|))
                       (PROGN
                        (SETQ |op| (CAAR . #2=(|item|)))
                        (SETQ |args| (CDAR . #2#))
                        (SETQ |pred| (CDR |item|))
                        (SETQ |newItem|
                                (COND
                                 (|args|
                                  (CONS (CONS |args| |pred|)
                                        (LASSOC |key| |alist|)))
                                 (#1# |pred|)))
                        (SETQ |alist|
                                (|insertShortAlist| |key| |newItem|
                                 |alist|))))))
                (SETQ |bfVar#76| (CDR |bfVar#76|))))
             (|get_database| |key| 'ANCESTORS) NIL)))
          (SETQ |bfVar#75| (CDR |bfVar#75|))))
       (|allConstructors|) NIL)
      (|transKCatAlist| |conform| |domname| (|listSort| #'GLESSEQP |alist|))))))

; transKCatAlist(conform, domname, s) ==
;     domname => --accept only exact matches after substitution
;       domargs := rest domname
;       acc := nil
;       rest conform =>
;         for pair in s repeat --pair has form [con,[conargs,:pred],...]]
;           leftForm := getConstructorForm first pair
;           for (ap := [args, :pred]) in rest pair repeat
;             match? :=
;               domargs = args => true
;               HAS_SHARP_VAR args => domargs = sublisFormal(IFCDR domname, args)
;               nil
;             null match? => 'skip
;             npred := sublisFormal(IFCDR leftForm, pred)
;             acc := [[leftForm,:npred],:acc]
;         NREVERSE acc
;       --conform has no arguments so each pair has form [con,:pred]
;       for pair in s repeat
;         leftForm := getConstructorForm first pair or systemError nil
;         RPLACA(pair,leftForm)
;         RPLACD(pair, sublisFormal(IFCDR leftForm, rest pair))
;       s
;     --no domname, so look for special argument combinations
;     acc := nil
;     IFCDR conform =>
;       farglist := TAKE(#rest conform,$FormalMapVariableList)
;       for pair in s repeat --pair has form [con,[conargs,:pred],...]]
;         leftForm := getConstructorForm first pair
;         for (ap := [args, :pred]) in rest pair repeat
;           hasArgsForm? := args ~= farglist
;           npred := sublisFormal(IFCDR leftForm, pred)
;           if hasArgsForm? then
;             subargs := sublisFormal(IFCDR leftForm, args)
;             hpred :=
;               ['hasArgs,:subargs]
;             npred := quickAnd(hpred,npred)
;           acc := [[leftForm,:npred],:acc]
;       NREVERSE acc
;     for pair in s repeat --pair has form [con,:pred]
;       leftForm := getConstructorForm first pair
;       RPLACA(pair,leftForm)
;       RPLACD(pair, sublisFormal(IFCDR leftForm, rest pair))
;     s

(DEFUN |transKCatAlist| (|conform| |domname| |s|)
  (PROG (|domargs| |acc| |leftForm| |args| |pred| |match?| |npred| |farglist|
         |hasArgsForm?| |subargs| |hpred|)
    (RETURN
     (COND
      (|domname|
       (PROGN
        (SETQ |domargs| (CDR |domname|))
        (SETQ |acc| NIL)
        (COND
         ((CDR |conform|)
          (PROGN
           ((LAMBDA (|bfVar#77| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#77|)
                     (PROGN (SETQ |pair| (CAR |bfVar#77|)) NIL))
                 (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  ((LAMBDA (|bfVar#78| |ap|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#78|)
                            (PROGN (SETQ |ap| (CAR |bfVar#78|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |ap|)
                             (PROGN
                              (SETQ |args| (CAR |ap|))
                              (SETQ |pred| (CDR |ap|))
                              #1#)
                             (PROGN
                              (SETQ |match?|
                                      (COND ((EQUAL |domargs| |args|) T)
                                            ((HAS_SHARP_VAR |args|)
                                             (EQUAL |domargs|
                                                    (|sublisFormal|
                                                     (IFCDR |domname|)
                                                     |args|)))
                                            (#1# NIL)))
                              (COND ((NULL |match?|) '|skip|)
                                    (#1#
                                     (PROGN
                                      (SETQ |npred|
                                              (|sublisFormal|
                                               (IFCDR |leftForm|) |pred|))
                                      (SETQ |acc|
                                              (CONS (CONS |leftForm| |npred|)
                                                    |acc|)))))))))
                      (SETQ |bfVar#78| (CDR |bfVar#78|))))
                   (CDR |pair|) NIL))))
               (SETQ |bfVar#77| (CDR |bfVar#77|))))
            |s| NIL)
           (NREVERSE |acc|)))
         (#1#
          (PROGN
           ((LAMBDA (|bfVar#79| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#79|)
                     (PROGN (SETQ |pair| (CAR |bfVar#79|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm|
                          (OR (|getConstructorForm| (CAR |pair|))
                              (|systemError| NIL)))
                  (RPLACA |pair| |leftForm|)
                  (RPLACD |pair|
                          (|sublisFormal| (IFCDR |leftForm|) (CDR |pair|))))))
               (SETQ |bfVar#79| (CDR |bfVar#79|))))
            |s| NIL)
           |s|)))))
      (#1#
       (PROGN
        (SETQ |acc| NIL)
        (COND
         ((IFCDR |conform|)
          (PROGN
           (SETQ |farglist|
                   (TAKE (LENGTH (CDR |conform|)) |$FormalMapVariableList|))
           ((LAMBDA (|bfVar#80| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#80|)
                     (PROGN (SETQ |pair| (CAR |bfVar#80|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  ((LAMBDA (|bfVar#81| |ap|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#81|)
                            (PROGN (SETQ |ap| (CAR |bfVar#81|)) NIL))
                        (RETURN NIL))
                       (#1#
                        (AND (CONSP |ap|)
                             (PROGN
                              (SETQ |args| (CAR |ap|))
                              (SETQ |pred| (CDR |ap|))
                              #1#)
                             (PROGN
                              (SETQ |hasArgsForm?|
                                      (NOT (EQUAL |args| |farglist|)))
                              (SETQ |npred|
                                      (|sublisFormal| (IFCDR |leftForm|)
                                       |pred|))
                              (COND
                               (|hasArgsForm?|
                                (SETQ |subargs|
                                        (|sublisFormal| (IFCDR |leftForm|)
                                         |args|))
                                (SETQ |hpred| (CONS '|hasArgs| |subargs|))
                                (SETQ |npred| (|quickAnd| |hpred| |npred|))))
                              (SETQ |acc|
                                      (CONS (CONS |leftForm| |npred|)
                                            |acc|))))))
                      (SETQ |bfVar#81| (CDR |bfVar#81|))))
                   (CDR |pair|) NIL))))
               (SETQ |bfVar#80| (CDR |bfVar#80|))))
            |s| NIL)
           (NREVERSE |acc|)))
         (#1#
          (PROGN
           ((LAMBDA (|bfVar#82| |pair|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#82|)
                     (PROGN (SETQ |pair| (CAR |bfVar#82|)) NIL))
                 (RETURN NIL))
                (#1#
                 (PROGN
                  (SETQ |leftForm| (|getConstructorForm| (CAR |pair|)))
                  (RPLACA |pair| |leftForm|)
                  (RPLACD |pair|
                          (|sublisFormal| (IFCDR |leftForm|) (CDR |pair|))))))
               (SETQ |bfVar#82| (CDR |bfVar#82|))))
            |s| NIL)
           |s|)))))))))

; sublisFormal(args,exp,:options) == main where
;   main ==  --use only on LIST structures; see also sublisFormalAlist
;     $formals: local := IFCAR options or $FormalMapVariableList
;     null args => exp
;     sublisFormal1(args,exp,#args - 1)
;   sublisFormal1(args,x,n) ==    --[sublisFormal1(args,y) for y in x]
;     x is [.,:.] =>
;       acc := nil
;       y := x
;       while null atom y repeat
;         acc := [sublisFormal1(args,QCAR y,n),:acc]
;         y := QCDR y
;       r := NREVERSE acc
;       if y then
;         nd := LASTNODE r
;         RPLACD(nd,sublisFormal1(args,y,n))
;       r
;     IDENTP x =>
;       j := or/[i for f in $formals for i in 0..n | EQ(f,x)] =>
;           args.j
;       x
;     x

(DEFUN |sublisFormal| (|args| |exp| &REST |options|)
  (PROG (|$formals|)
    (DECLARE (SPECIAL |$formals|))
    (RETURN
     (PROGN
      (SETQ |$formals| (OR (IFCAR |options|) |$FormalMapVariableList|))
      (COND ((NULL |args|) |exp|)
            ('T
             (|sublisFormal,sublisFormal1| |args| |exp|
              (- (LENGTH |args|) 1))))))))
(DEFUN |sublisFormal,sublisFormal1| (|args| |x| |n|)
  (PROG (DOT |acc| |y| |r| |nd| |j|)
    (RETURN
     (COND
      ((AND (CONSP |x|) (PROGN (SETQ DOT (CDR |x|)) #1='T))
       (PROGN
        (SETQ |acc| NIL)
        (SETQ |y| |x|)
        ((LAMBDA ()
           (LOOP
            (COND ((ATOM |y|) (RETURN NIL))
                  (#1#
                   (PROGN
                    (SETQ |acc|
                            (CONS
                             (|sublisFormal,sublisFormal1| |args| (QCAR |y|)
                              |n|)
                             |acc|))
                    (SETQ |y| (QCDR |y|))))))))
        (SETQ |r| (NREVERSE |acc|))
        (COND
         (|y| (SETQ |nd| (LASTNODE |r|))
          (RPLACD |nd| (|sublisFormal,sublisFormal1| |args| |y| |n|))))
        |r|))
      ((IDENTP |x|)
       (COND
        ((SETQ |j|
                 ((LAMBDA (|bfVar#84| |bfVar#83| |f| |i|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#83|)
                           (PROGN (SETQ |f| (CAR |bfVar#83|)) NIL) (> |i| |n|))
                       (RETURN |bfVar#84|))
                      (#1#
                       (AND (EQ |f| |x|)
                            (PROGN
                             (SETQ |bfVar#84| |i|)
                             (COND (|bfVar#84| (RETURN |bfVar#84|)))))))
                     (SETQ |bfVar#83| (CDR |bfVar#83|))
                     (SETQ |i| (+ |i| 1))))
                  NIL |$formals| NIL 0))
         (ELT |args| |j|))
        (#1# |x|)))
      (#1# |x|)))))

; MAKEPROP('Record, 'documentation, '(
;   (_=  (((Boolean) _% _%)
;    "\spad{r = s} tests for equality of two records \spad{r} and \spad{s}"))
;   (coerce (((OutputForm) _%)
;    "\spad{coerce(r)} returns a representation of \spad{r} as an output form")
;          ((_% (List (Any)))
;    "\spad{coerce(u)}, where \spad{u} is the list \spad{[x,y]} for \spad{x} of type \spad{A} and \spad{y} of type \spad{B}, returns the record \spad{[a:x,b:y]}"))
;   (construct ((_% A B)
;    "\spad{construct(x, y)} returns the record \spad{[a:x,b:y]}"))
;   (elt ((A % "a")
;    "\spad{r . a} returns the value stored in record \spad{r} under selector \spad{a}.")
;       ((B % "b")
;    "\spad{r . b} returns the value stored in record \spad{r} under selector \spad{b}."))
;   (setelt_! ((A % "a" A)
;    "\spad{r . a := x} destructively replaces the value stored in record \spad{r} under selector \spad{a} by the value of \spad{x}. Error: if \spad{r} has not been previously assigned a value.")
;          ((B % "b" B)
;    "\spad{r . b := y} destructively replaces the value stored in record \spad{r} under selector \spad{b} by the value of \spad{y}. Error: if \spad{r} has not been previously assigned a value."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Record| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{r = s} tests for equality of two records \\spad{r} and \\spad{s}"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(r)} returns a representation of \\spad{r} as an output form")
         ((% (|List| (|Any|)))
          "\\spad{coerce(u)}, where \\spad{u} is the list \\spad{[x,y]} for \\spad{x} of type \\spad{A} and \\spad{y} of type \\spad{B}, returns the record \\spad{[a:x,b:y]}"))
        (|construct|
         ((% A B)
          "\\spad{construct(x, y)} returns the record \\spad{[a:x,b:y]}"))
        (|elt|
         ((A % "a")
          "\\spad{r . a} returns the value stored in record \\spad{r} under selector \\spad{a}.")
         ((B % "b")
          "\\spad{r . b} returns the value stored in record \\spad{r} under selector \\spad{b}."))
        (|setelt!|
         ((A % "a" A)
          "\\spad{r . a := x} destructively replaces the value stored in record \\spad{r} under selector \\spad{a} by the value of \\spad{x}. Error: if \\spad{r} has not been previously assigned a value.")
         ((B % "b" B)
          "\\spad{r . b := y} destructively replaces the value stored in record \\spad{r} under selector \\spad{b} by the value of \\spad{y}. Error: if \\spad{r} has not been previously assigned a value.")))))))

; MAKEPROP('UntaggedUnion, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
;   (case (((Boolean) % A)
;     "\spad{u case A} tests if \spad{u} is of the type \spad{A} branch of the union.")
;         (((Boolean) % B)
;     "\spad{u case B} tests if \spad{u} is of the \spad{B} branch of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the \spad{A} branch of the union. Error: if \spad{u} is of the \spad{B} branch of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the \spad{B} branch of the union. Error: if \spad{u} is of the \spad{A} branch of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|UntaggedUnion| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, u and v are hold objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % A)
             "\\spad{u case A} tests if \\spad{u} is of the type \\spad{A} branch of the union.")
          (((|Boolean|) % B)
           "\\spad{u case B} tests if \\spad{u} is of the \\spad{B} branch of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the \\spad{A} branch of the union. Error: if \\spad{u} is of the \\spad{B} branch of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the \\spad{B} branch of the union. Error: if \\spad{u} is of the \\spad{A} branch of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; MAKEPROP('Union, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if two objects of the union are equal, that is, \spad{u} and \spad{v} are objects of same branch which are equal."))
;   (case (((Boolean) % "a")
;     "\spad{u case a} tests if \spad{u} is of branch \spad{a} of the union.")
;         (((Boolean) % "b")
;     "\spad{u case b} tests if \spad{u} is of branch \spad{b} of the union."))
;   (coerce ((A %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{A} if \spad{x} is of the branch \spad{a} of the union. Error: if \spad{u} is of the branch \spad{b} of the union.")
;           ((B %)
;     "\spad{coerce(u)} returns \spad{x} of type \spad{B} if \spad{x} is of the branch \spad{b} of the union. Error: if \spad{u} is of the branch \spad{a} of the union.")
;           ((% A)
;     "\spad{coerce(x)}, where \spad{x} has type \spad{A}, returns \spad{x} as a union type.")
;           ((% B)
;     "\spad{coerce(y)}, where \spad{y} has type \spad{B}, returns \spad{y} as a union type."))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Union| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if two objects of the union are equal, that is, \\spad{u} and \\spad{v} are objects of same branch which are equal."))
        (CASE
            (((|Boolean|) % "a")
             "\\spad{u case a} tests if \\spad{u} is of branch \\spad{a} of the union.")
          (((|Boolean|) % "b")
           "\\spad{u case b} tests if \\spad{u} is of branch \\spad{b} of the union."))
        (|coerce|
         ((A %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{A} if \\spad{x} is of the branch \\spad{a} of the union. Error: if \\spad{u} is of the branch \\spad{b} of the union.")
         ((B %)
          "\\spad{coerce(u)} returns \\spad{x} of type \\spad{B} if \\spad{x} is of the branch \\spad{b} of the union. Error: if \\spad{u} is of the branch \\spad{a} of the union.")
         ((% A)
          "\\spad{coerce(x)}, where \\spad{x} has type \\spad{A}, returns \\spad{x} as a union type.")
         ((% B)
          "\\spad{coerce(y)}, where \\spad{y} has type \\spad{B}, returns \\spad{y} as a union type.")))))))

; MAKEPROP('Mapping, 'documentation, '(
;   (_=  (((Boolean) % %)
;     "\spad{u = v} tests if mapping objects are equal."))
;    ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Mapping| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{u = v} tests if mapping objects are equal.")))))))

; MAKEPROP('Enumeration, 'documentation, '(
;   (_= (((Boolean) _% _%)
;     "\spad{e = f} tests for equality of two enumerations \spad{e} and \spad{f}"))
;   (_^_= (((Boolean) _% _%)
;     "\spad{e ~= f} tests that two enumerations \spad{e} and \spad{f} are not equal"))
;   (coerce (((OutputForm) _%)
;      "\spad{coerce(e)} returns a representation of enumeration \spad{r} as an output form")
;           ((_% (Symbol))
;      "\spad{coerce(s)} converts a symbol \spad{s} into an enumeration which has \spad{s} as a member symbol"))
;   ))

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL)
  (PROG ()
    (RETURN
     (MAKEPROP '|Enumeration| '|documentation|
      '((=
         (((|Boolean|) % %)
          "\\spad{e = f} tests for equality of two enumerations \\spad{e} and \\spad{f}"))
        (^=
         (((|Boolean|) % %)
          "\\spad{e ~= f} tests that two enumerations \\spad{e} and \\spad{f} are not equal"))
        (|coerce|
         (((|OutputForm|) %)
          "\\spad{coerce(e)} returns a representation of enumeration \\spad{r} as an output form")
         ((% (|Symbol|))
          "\\spad{coerce(s)} converts a symbol \\spad{s} into an enumeration which has \\spad{s} as a member symbol")))))))
