
; )package "BOOT"

(IN-PACKAGE "BOOT")

; get_op_implementation(op, sig, pred, predicates, dom, domname) ==
;     $returnNowhereFromGoGet: local := true
;     predValue := evalDomainOpPred(dom, pred, predicates)
;     null predValue =>
;         'unexported
;     slot := compiledLookup(op, sig, dom) =>
;         [f, :r] := slot
;         f = 'nowhere => 'nowhere           --see replaceGoGetSlot
;         f = function makeSpadConstant => 'constant
;         f = function IDENTITY => 'constant
;         f = function newGoGet =>
;             substitute('_%, domname, devaluate(first(r)))
;         null VECP r => systemError devaluateList r
;         substitute('_%, domname, devaluate(r))
;     'nowhere

(DEFUN |get_op_implementation| (|op| |sig| |pred| |predicates| |dom| |domname|)
  (PROG (|$returnNowhereFromGoGet| |r| |f| |slot| |predValue|)
    (DECLARE (SPECIAL |$returnNowhereFromGoGet|))
    (RETURN
     (PROGN
      (SETQ |$returnNowhereFromGoGet| T)
      (SETQ |predValue| (|evalDomainOpPred| |dom| |pred| |predicates|))
      (COND ((NULL |predValue|) '|unexported|)
            ((SETQ |slot| (|compiledLookup| |op| |sig| |dom|))
             (PROGN
              (SETQ |f| (CAR |slot|))
              (SETQ |r| (CDR |slot|))
              (COND ((EQ |f| '|nowhere|) '|nowhere|)
                    ((EQUAL |f| #'|makeSpadConstant|) '|constant|)
                    ((EQUAL |f| #'IDENTITY) '|constant|)
                    ((EQUAL |f| #'|newGoGet|)
                     (|substitute| '% |domname| (|devaluate| (CAR |r|))))
                    ((NULL (VECP |r|)) (|systemError| (|devaluateList| |r|)))
                    (#1='T (|substitute| '% |domname| (|devaluate| |r|))))))
            (#1# '|nowhere|))))))

; ht_add_strings(page, strings) ==
;     for str in strings repeat
;         ht_add_string(page, str)

(DEFUN |ht_add_strings| (|page| |strings|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#1| |str|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#1|) (PROGN (SETQ |str| (CAR |bfVar#1|)) NIL))
           (RETURN NIL))
          ('T (|ht_add_string| |page| |str|)))
         (SETQ |bfVar#1| (CDR |bfVar#1|))))
      |strings| NIL))))

; mkEvalable2(form) ==
;     [op, :args] := form
;     co_sig := get_database(op, 'COSIG)
;     nargs := []
;     for arg in args for k? in rest(co_sig) repeat
;         narg :=
;             k? => mkEvalable(arg)
;             MKQ(arg)
;         nargs := cons(narg, nargs)
;     nargs := NREVERSE(nargs)
;     [op, :nargs]

(DEFUN |mkEvalable2| (|form|)
  (PROG (|op| |args| |co_sig| |nargs| |narg|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |args| (CDR |form|))
      (SETQ |co_sig| (|get_database| |op| 'COSIG))
      (SETQ |nargs| NIL)
      ((LAMBDA (|bfVar#2| |arg| |bfVar#3| |k?|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#2|) (PROGN (SETQ |arg| (CAR |bfVar#2|)) NIL)
                (ATOM |bfVar#3|) (PROGN (SETQ |k?| (CAR |bfVar#3|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |narg| (COND (|k?| (|mkEvalable| |arg|)) (#1# (MKQ |arg|))))
             (SETQ |nargs| (CONS |narg| |nargs|)))))
          (SETQ |bfVar#2| (CDR |bfVar#2|))
          (SETQ |bfVar#3| (CDR |bfVar#3|))))
       |args| NIL (CDR |co_sig|) NIL)
      (SETQ |nargs| (NREVERSE |nargs|))
      (CONS |op| |nargs|)))))

; make_domain_form(kind, name, argString) ==
;     typeForm := CATCH('SPAD_READER, CATCH('top_level,
;                        unabbrev mkConform(kind, name, argString)))
;     ATOM(typeForm) => $spad_failure
;     null(evaluatedTypeForm := kisValidType typeForm) =>
;         $spad_failure
;     cons(0, mkEvalable2(evaluatedTypeForm))

(DEFUN |make_domain_form| (|kind| |name| |argString|)
  (PROG (|typeForm| |evaluatedTypeForm|)
    (RETURN
     (PROGN
      (SETQ |typeForm|
              (CATCH 'SPAD_READER
                (CATCH '|top_level|
                  (|unabbrev| (|mkConform| |kind| |name| |argString|)))))
      (COND ((ATOM |typeForm|) |$spad_failure|)
            ((NULL (SETQ |evaluatedTypeForm| (|kisValidType| |typeForm|)))
             |$spad_failure|)
            ('T (CONS 0 (|mkEvalable2| |evaluatedTypeForm|))))))))

; quiet_valid_type?(t) ==
;     $ncMsgList : local := []
;     kisValidType(t)

(DEFUN |quiet_valid_type?| (|t|)
  (PROG (|$ncMsgList|)
    (DECLARE (SPECIAL |$ncMsgList|))
    (RETURN (PROGN (SETQ |$ncMsgList| NIL) (|kisValidType| |t|)))))

; clear_hyperdoc_funs() ==
;     $add_description_string_fun := [0, nil]
;     $add_to_noproces_fun := [0, nil]
;     $add_to_page_fun := [0, nil]
;     $destroy_page_fun := [0, nil]
;     $do_gen_fun1_fun := [0, nil]
;     $do_page_fun0_fun := [0, nil]
;     $do_page_fun1_fun := [0, nil]
;     $do_page_fun2_fun := [0, nil]
;     $do_search_fun := [0, nil]
;     $make_page_fun := [0, nil]
;     $set_input_string_fun := [0, nil]
;     $show_page_fun := [0, nil]

(DEFUN |clear_hyperdoc_funs| ()
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$add_description_string_fun| (LIST 0 NIL))
      (SETQ |$add_to_noproces_fun| (LIST 0 NIL))
      (SETQ |$add_to_page_fun| (LIST 0 NIL))
      (SETQ |$destroy_page_fun| (LIST 0 NIL))
      (SETQ |$do_gen_fun1_fun| (LIST 0 NIL))
      (SETQ |$do_page_fun0_fun| (LIST 0 NIL))
      (SETQ |$do_page_fun1_fun| (LIST 0 NIL))
      (SETQ |$do_page_fun2_fun| (LIST 0 NIL))
      (SETQ |$do_search_fun| (LIST 0 NIL))
      (SETQ |$make_page_fun| (LIST 0 NIL))
      (SETQ |$set_input_string_fun| (LIST 0 NIL))
      (SETQ |$show_page_fun| (LIST 0 NIL))))))

; clear_hyperdoc_funs()

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (PROG () (RETURN (|clear_hyperdoc_funs|))))

; ht_add_string(page, s) ==
;     not(STRINGP(s)) => BREAK()
;     fun := SpadFun($add_description_string_fun,
;               getFunctionFromDomain1("add_to_description",
;                 '(HyperdocPage), $Void, '((HyperdocPage) (String))))
;     SPADCALL(page, s, fun)

(DEFUN |ht_add_string| (|page| |s|)
  (PROG (|fun|)
    (RETURN
     (COND ((NULL (STRINGP |s|)) (BREAK))
           ('T
            (PROGN
             (SETQ |fun|
                     (|SpadFun| |$add_description_string_fun|
                      (|getFunctionFromDomain1| '|add_to_description|
                       '(|HyperdocPage|) |$Void|
                       '((|HyperdocPage|) (|String|)))))
             (SPADCALL |page| |s| |fun|)))))))

; ht_add_item(page, line) ==
;     STRINGP line => ht_add_string(page, line)
;     text :=
;       PAIRP line => [['text, :line]]
;       [['text, line]]
;     fun := SpadFun($add_to_noproces_fun,
;               getFunctionFromDomain1("add_to_description",
;             '(HyperdocPage), $Void, '((HyperdocPage) (List (SExpression)))))
;     SPADCALL(page, text, fun)

(DEFUN |ht_add_item| (|page| |line|)
  (PROG (|text| |fun|)
    (RETURN
     (COND ((STRINGP |line|) (|ht_add_string| |page| |line|))
           (#1='T
            (PROGN
             (SETQ |text|
                     (COND ((CONSP |line|) (LIST (CONS '|text| |line|)))
                           (#1# (LIST (LIST '|text| |line|)))))
             (SETQ |fun|
                     (|SpadFun| |$add_to_noproces_fun|
                      (|getFunctionFromDomain1| '|add_to_description|
                       '(|HyperdocPage|) |$Void|
                       '((|HyperdocPage|) (|List| (|SExpression|))))))
             (SPADCALL |page| |text| |fun|)))))))

; ht_show_page(page) ==
;     fun := SpadFun($show_page_fun,
;                getFunctionFromDomain1("show", '(HyperdocPage),
;                                       $Void, '((HyperdocPage))))
;     SPADCALL(page, fun)

(DEFUN |ht_show_page| (|page|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$show_page_fun|
               (|getFunctionFromDomain1| '|show| '(|HyperdocPage|) |$Void|
                '((|HyperdocPage|)))))
      (SPADCALL |page| |fun|)))))

; ht_add_to_page(page, itemList) ==
;     fun := SpadFun($add_to_page_fun,
;               getFunctionFromDomain1("add_to", '(HyperdocPage),
;                 $Void, '((HyperdocPage) (List (SExpression)))))
;     SPADCALL(page, itemList, fun)

(DEFUN |ht_add_to_page| (|page| |itemList|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$add_to_page_fun|
               (|getFunctionFromDomain1| '|add_to| '(|HyperdocPage|) |$Void|
                '((|HyperdocPage|) (|List| (|SExpression|))))))
      (SPADCALL |page| |itemList| |fun|)))))

; ht_new_page(propList) ==
;     fun := SpadFun($make_page_fun,
;               getFunctionFromDomain1("new", '(HyperdocPage),
;                 '(HyperdocPage), '(HyperdocAssociationList)))
;     page := SPADCALL(propList, fun)
;     page

(DEFUN |ht_new_page| (|propList|)
  (PROG (|fun| |page|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$make_page_fun|
               (|getFunctionFromDomain1| '|new| '(|HyperdocPage|)
                '(|HyperdocPage|) '(|HyperdocAssociationList|))))
      (SETQ |page| (SPADCALL |propList| |fun|))
      |page|))))

; htpDestroyPage(name) ==
;     fun := SpadFun($destroy_page_fun,
;               getFunctionFromDomain1("destroy", '(HyperdocPage),
;                 $Void, '(Symbol)))
;     SPADCALL(name, fun)

(DEFUN |htpDestroyPage| (|name|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$destroy_page_fun|
               (|getFunctionFromDomain1| '|destroy| '(|HyperdocPage|) |$Void|
                '(|Symbol|))))
      (SPADCALL |name| |fun|)))))

; htpSetLabelInputString(page, key, val) ==
;     fun := SpadFun($set_input_string_fun,
;               getFunctionFromDomain1("set_input_string", '(HyperdocPage),
;                 $Void, [["HyperdocPage"], ["Symbol"], ["String"]]))
;     SPADCALL(page, key, val, fun)

(DEFUN |htpSetLabelInputString| (|page| |key| |val|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$set_input_string_fun|
               (|getFunctionFromDomain1| '|set_input_string| '(|HyperdocPage|)
                |$Void|
                (LIST (LIST '|HyperdocPage|) (LIST '|Symbol|)
                      (LIST '|String|)))))
      (SPADCALL |page| |key| |val| |fun|)))))

; do_search(pat, tag, desc) ==
;     fun := SpadFun($do_search_fun,
;              getFunctionFromDomain1("do_search", ["HyperdocTopPage"],
;                 $Void, [["String"], ["Symbol"], ["String"]]))
;     SPADCALL(pat, tag, desc, fun)

(DEFUN |do_search| (|pat| |tag| |desc|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$do_search_fun|
               (|getFunctionFromDomain1| '|do_search| (LIST '|HyperdocTopPage|)
                |$Void|
                (LIST (LIST '|String|) (LIST '|Symbol|) (LIST '|String|)))))
      (SPADCALL |pat| |tag| |desc| |fun|)))))

; do_page_fun0(page, tag) ==
;     fun := SpadFun($do_page_fun0_fun,
;              getFunctionFromDomain1("do_page_fun0", ["HyperdocTopPage"],
;                 $Void, [["HyperdocPage"], ["Symbol"]]))
;     SPADCALL(page, tag, fun)

(DEFUN |do_page_fun0| (|page| |tag|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$do_page_fun0_fun|
               (|getFunctionFromDomain1| '|do_page_fun0|
                (LIST '|HyperdocTopPage|) |$Void|
                (LIST (LIST '|HyperdocPage|) (LIST '|Symbol|)))))
      (SPADCALL |page| |tag| |fun|)))))

; do_page_fun1(page, tag, data) ==
;     fun := SpadFun($do_page_fun1_fun,
;              getFunctionFromDomain1("do_page_fun1", ["HyperdocTopPage"],
;                 $Void, [["HyperdocPage"], ["Symbol"], ["SExpression"]]))
;     SPADCALL(page, tag, data, fun)

(DEFUN |do_page_fun1| (|page| |tag| |data|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$do_page_fun1_fun|
               (|getFunctionFromDomain1| '|do_page_fun1|
                (LIST '|HyperdocTopPage|) |$Void|
                (LIST (LIST '|HyperdocPage|) (LIST '|Symbol|)
                      (LIST '|SExpression|)))))
      (SPADCALL |page| |tag| |data| |fun|)))))

; do_page_fun2(page, tag, data1, data2) ==
;     fun := SpadFun($do_page_fun2_fun,
;              getFunctionFromDomain1("do_page_fun2", ["HyperdocTopPage"],
;                 $Void, [["HyperdocPage"], ["Symbol"],
;                     ["SExpression"], ["SExpression"]]))
;     SPADCALL(page, tag, data1, data2, fun)

(DEFUN |do_page_fun2| (|page| |tag| |data1| |data2|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$do_page_fun2_fun|
               (|getFunctionFromDomain1| '|do_page_fun2|
                (LIST '|HyperdocTopPage|) |$Void|
                (LIST (LIST '|HyperdocPage|) (LIST '|Symbol|)
                      (LIST '|SExpression|) (LIST '|SExpression|)))))
      (SPADCALL |page| |tag| |data1| |data2| |fun|)))))

; do_gen_fun1(tag, data) ==
;     fun := SpadFun($do_gen_fun1_fun,
;              getFunctionFromDomain1("do_gen_fun1", ["HyperdocTopPage"],
;                 $Void, [["Symbol"], ["SExpression"]]))
;     SPADCALL(tag, data, fun)

(DEFUN |do_gen_fun1| (|tag| |data|)
  (PROG (|fun|)
    (RETURN
     (PROGN
      (SETQ |fun|
              (|SpadFun| |$do_gen_fun1_fun|
               (|getFunctionFromDomain1| '|do_gen_fun1|
                (LIST '|HyperdocTopPage|) |$Void|
                (LIST (LIST '|Symbol|) (LIST '|SExpression|)))))
      (SPADCALL |tag| |data| |fun|)))))

; aokSearch(filter) == do_search(filter, 'aok, '"aokSearch")

(DEFUN |aokSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|aok| "aokSearch"))))

; cSearch(filter) == do_search(filter, 'c, '"category")

(DEFUN |cSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|c| "category"))))

; detailedSearch(filter) == do_search(filter, 'det, '"detailedSearch")

(DEFUN |detailedSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|det| "detailedSearch"))))

; docSearch(filter) == do_search(filter, 'doc, '"docSearch")

(DEFUN |docSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|doc| "docSearch"))))

; dSearch(filter) == do_search(filter, 'd, '"domain")

(DEFUN |dSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|d| "domain"))))

; genSearch(filter) == do_search(filter, 'gen, '"genSearch")

(DEFUN |genSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|gen| "genSearch"))))

; oSearch(filter) == do_search(filter, 'o, '"operation")

(DEFUN |oSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|o| "operation"))))

; pSearch filter == do_search(filter, 'p, '"package")

(DEFUN |pSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|p| "package"))))

; kSearch filter == do_search(filter, 'k, '"constructor")

(DEFUN |kSearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|k| "constructor"))))

; ySearch filter == do_search(filter, 'y, '"constructor")

(DEFUN |ySearch| (|filter|)
  (PROG () (RETURN (|do_search| |filter| '|y| "constructor"))))

; cons_opts(page, data) == do_page_fun1(page, 'cons_opts, data)

(DEFUN |cons_opts| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|cons_opts| |data|))))

; dbChooseDomainOp(page, data) == do_page_fun1(page, 'dbChooseDomainOp, data)

(DEFUN |dbChooseDomainOp| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbChooseDomainOp| |data|))))

; dbSelectCon(page, data) == do_page_fun1(page, 'dbSelectCon, data)

(DEFUN |dbSelectCon| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbSelectCon| |data|))))

; dbShowCons(page, data) == do_page_fun1(page, 'dbShowCons, data)

(DEFUN |dbShowCons| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbShowCons| |data|))))

; dbShowConsKindsFilter(page, data) ==
;     do_page_fun1(page, 'dbShowConsKindsFilter, data)

(DEFUN |dbShowConsKindsFilter| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbShowConsKindsFilter| |data|))))

; dbShowOps(page, data) == do_page_fun1(page, 'dbShowOps, data)

(DEFUN |dbShowOps| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbShowOps| |data|))))

; generalSearchDo(page, data) == do_page_fun1(page, 'generalSearchDo, data)

(DEFUN |generalSearchDo| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|generalSearchDo| |data|))))

; genSearchSayJump(page, data) == do_page_fun1(page, 'genSearchSayJump, data)

(DEFUN |genSearchSayJump| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|genSearchSayJump| |data|))))

; grepSearchJump(page, data) == do_page_fun1(page, 'grepSearchJump, data)

(DEFUN |grepSearchJump| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|grepSearchJump| |data|))))

; htFilterPage(page, data) == do_page_fun1(page, 'htFilterPage, data)

(DEFUN |htFilterPage| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|htFilterPage| |data|))))

; kArgPage(page, data) == do_page_fun1(page, 'kArgPage, data)

(DEFUN |kArgPage| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|kArgPage| |data|))))

; kxPage(page, data) == do_page_fun1(page, 'kxPage, data)

(DEFUN |kxPage| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|kxPage| |data|))))

; showDoc(page, count) == do_page_fun1(page, 'showDoc, count)

(DEFUN |showDoc| (|page| |count|)
  (PROG () (RETURN (|do_page_fun1| |page| '|showDoc| |count|))))

; showConstruct(page, count) == do_page_fun1(page, 'showConstruct, count)

(DEFUN |showConstruct| (|page| |count|)
  (PROG () (RETURN (|do_page_fun1| |page| '|showConstruct| |count|))))

; conPage(c) == do_gen_fun1('conPage, c)

(DEFUN |conPage| (|c|) (PROG () (RETURN (|do_gen_fun1| '|conPage| |c|))))

; conPageChoose(c) == do_gen_fun1('conPageChoose, c)

(DEFUN |conPageChoose| (|c|)
  (PROG () (RETURN (|do_gen_fun1| '|conPageChoose| |c|))))

; dbSpecialOperations(c) == do_gen_fun1('dbSpecialOperations, c)

(DEFUN |dbSpecialOperations| (|c|)
  (PROG () (RETURN (|do_gen_fun1| '|dbSpecialOperations| |c|))))

; spadType(s) == do_gen_fun1('spadType, s)

(DEFUN |spadType| (|s|) (PROG () (RETURN (|do_gen_fun1| '|spadType| |s|))))

; oPageFrom(opname,conname) == do_search(opname, 'oPageFrom, conname)

(DEFUN |oPageFrom| (|opname| |conname|)
  (PROG () (RETURN (|do_search| |opname| '|oPageFrom| |conname|))))

; repeatSearch(page, newValue) ==
;     $exposedOnlyIfTrue := newValue
;     do_page_fun1(page, 'repeatSearch, newValue)

(DEFUN |repeatSearch| (|page| |newValue|)
  (PROG ()
    (RETURN
     (PROGN
      (SETQ |$exposedOnlyIfTrue| |newValue|)
      (|do_page_fun1| |page| '|repeatSearch| |newValue|)))))

; dbShowCons1(page, data) == do_page_fun1(page, 'dbShowCons1, data)

(DEFUN |dbShowCons1| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|dbShowCons1| |data|))))

; htGloss(pattern) == do_gen_fun1('htGloss, pattern)

(DEFUN |htGloss| (|pattern|)
  (PROG () (RETURN (|do_gen_fun1| '|htGloss| |pattern|))))

; htGlossSearch(page, data) == do_page_fun1(page, 'htGlossSearch, data)

(DEFUN |htGlossSearch| (|page| |data|)
  (PROG () (RETURN (|do_page_fun1| |page| '|htGlossSearch| |data|))))
