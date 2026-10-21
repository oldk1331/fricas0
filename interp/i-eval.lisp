
; )package "BOOT"

(IN-PACKAGE "BOOT")

; $genValue := false

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$genValue| NIL))

; quoteNontypeArgs(t) ==
;     STRINGP(t) => t
;     t is [.] => t
;     op := opOf t
;     args := rest t
;     op = "Record" or isTaggedUnion(t) =>
;         [op, :[[":", ["QUOTE", n], quoteNontypeArgs(a)]
;                for [":", n, a] in args]]
;     op = "Union" or op = "Mapping" =>
;         [op, :[quoteNontypeArgs(a) for a in args]]
;     cs := rest(get_database(op, 'COSIG))
;     op = "Enumeration" => [op, :[["QUOTE", a] for a in args]]
;     nargs := [if c then quoteNontypeArgs(a) else ["QUOTE", a]
;                 for a in args for c in cs]
;     [op, :nargs]

(DEFUN |quoteNontypeArgs| (|t|)
  (PROG (|op| |args| |ISTMP#1| |n| |ISTMP#2| |a| |cs| |nargs|)
    (RETURN
     (COND ((STRINGP |t|) |t|) ((AND (CONSP |t|) (EQ (CDR |t|) NIL)) |t|)
           (#1='T
            (PROGN
             (SETQ |op| (|opOf| |t|))
             (SETQ |args| (CDR |t|))
             (COND
              ((OR (EQ |op| '|Record|) (|isTaggedUnion| |t|))
               (CONS |op|
                     ((LAMBDA (|bfVar#3| |bfVar#2| |bfVar#1|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#2|)
                               (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                           (RETURN (NREVERSE |bfVar#3|)))
                          (#1#
                           (AND (CONSP |bfVar#1|) (EQ (CAR |bfVar#1|) '|:|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |bfVar#1|))
                                 (AND (CONSP |ISTMP#1|)
                                      (PROGN
                                       (SETQ |n| (CAR |ISTMP#1|))
                                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CDR |ISTMP#2|) NIL)
                                            (PROGN
                                             (SETQ |a| (CAR |ISTMP#2|))
                                             #1#)))))
                                (SETQ |bfVar#3|
                                        (CONS
                                         (LIST '|:| (LIST 'QUOTE |n|)
                                               (|quoteNontypeArgs| |a|))
                                         |bfVar#3|)))))
                         (SETQ |bfVar#2| (CDR |bfVar#2|))))
                      NIL |args| NIL)))
              ((OR (EQ |op| '|Union|) (EQ |op| '|Mapping|))
               (CONS |op|
                     ((LAMBDA (|bfVar#5| |bfVar#4| |a|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#4|)
                               (PROGN (SETQ |a| (CAR |bfVar#4|)) NIL))
                           (RETURN (NREVERSE |bfVar#5|)))
                          (#1#
                           (SETQ |bfVar#5|
                                   (CONS (|quoteNontypeArgs| |a|) |bfVar#5|))))
                         (SETQ |bfVar#4| (CDR |bfVar#4|))))
                      NIL |args| NIL)))
              (#1#
               (PROGN
                (SETQ |cs| (CDR (|get_database| |op| 'COSIG)))
                (COND
                 ((EQ |op| '|Enumeration|)
                  (CONS |op|
                        ((LAMBDA (|bfVar#7| |bfVar#6| |a|)
                           (LOOP
                            (COND
                             ((OR (ATOM |bfVar#6|)
                                  (PROGN (SETQ |a| (CAR |bfVar#6|)) NIL))
                              (RETURN (NREVERSE |bfVar#7|)))
                             (#1#
                              (SETQ |bfVar#7|
                                      (CONS (LIST 'QUOTE |a|) |bfVar#7|))))
                            (SETQ |bfVar#6| (CDR |bfVar#6|))))
                         NIL |args| NIL)))
                 (#1#
                  (PROGN
                   (SETQ |nargs|
                           ((LAMBDA (|bfVar#10| |bfVar#8| |a| |bfVar#9| |c|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#8|)
                                     (PROGN (SETQ |a| (CAR |bfVar#8|)) NIL)
                                     (ATOM |bfVar#9|)
                                     (PROGN (SETQ |c| (CAR |bfVar#9|)) NIL))
                                 (RETURN (NREVERSE |bfVar#10|)))
                                (#1#
                                 (SETQ |bfVar#10|
                                         (CONS
                                          (COND (|c| (|quoteNontypeArgs| |a|))
                                                (#1# (LIST 'QUOTE |a|)))
                                          |bfVar#10|))))
                               (SETQ |bfVar#8| (CDR |bfVar#8|))
                               (SETQ |bfVar#9| (CDR |bfVar#9|))))
                            NIL |args| NIL |cs| NIL))
                   (CONS |op| |nargs|)))))))))))))

; evalType(t) == EVAL(quoteNontypeArgs(t))

(DEFUN |evalType| (|t|) (PROG () (RETURN (EVAL (|quoteNontypeArgs| |t|)))))

; $noEvalTypeMsg := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$noEvalTypeMsg| NIL))

; $evalDomain := nil

(EVAL-WHEN (:EXECUTE :LOAD-TOPLEVEL) (SETQ |$evalDomain| NIL))

; evalDomain form ==
;   if $evalDomain then
;     sayMSG concat('"   instantiating","%b",prefix2String form,"%d")
;   startTimingProcess 'instantiation
;   result := eval mkEvalable form
;   stopTimingProcess 'instantiation
;   result

(DEFUN |evalDomain| (|form|)
  (PROG (|result|)
    (RETURN
     (PROGN
      (COND
       (|$evalDomain|
        (|sayMSG|
         (|concat| "   instantiating" '|%b| (|prefix2String| |form|) '|%d|))))
      (|startTimingProcess| '|instantiation|)
      (SETQ |result| (|eval| (|mkEvalable| |form|)))
      (|stopTimingProcess| '|instantiation|)
      |result|))))

; mkEvalable form ==
;   form is [op,:argl] =>
;     op="QUOTE" => form
;     op="WRAPPED" => mkEvalable devaluate argl
;     op="Record" => mkEvalableRecord form
;     op="Union"  => mkEvalableUnion  form
;     op="Mapping"=> mkEvalableMapping form
;     op="Enumeration" => form
;     kind := get_database(op, 'CONSTRUCTORKIND)
;     cosig := get_database(op, 'COSIG) =>
;       [op,:[val for x in argl for typeFlag in rest cosig]] where val ==
;         typeFlag =>
;           kind = 'category => MKQ x
;           VECP x => MKQ x
;           mkEvalable x
;         x is ['QUOTE,:.] => x
;         x is ['_#, y] => ['LENGTH, MKQ(y)]
;         MKQ x
;     [op,:[mkEvalable x for x in argl]]
;   form=$EmptyMode => $Integer
;   IDENTP form and constructor?(form) => [form]
;   form

(DEFUN |mkEvalable| (|form|)
  (PROG (|op| |argl| |kind| |cosig| |ISTMP#1| |y|)
    (RETURN
     (COND
      ((AND (CONSP |form|)
            (PROGN (SETQ |op| (CAR |form|)) (SETQ |argl| (CDR |form|)) #1='T))
       (COND ((EQ |op| 'QUOTE) |form|)
             ((EQ |op| 'WRAPPED) (|mkEvalable| (|devaluate| |argl|)))
             ((EQ |op| '|Record|) (|mkEvalableRecord| |form|))
             ((EQ |op| '|Union|) (|mkEvalableUnion| |form|))
             ((EQ |op| '|Mapping|) (|mkEvalableMapping| |form|))
             ((EQ |op| '|Enumeration|) |form|)
             (#1#
              (PROGN
               (SETQ |kind| (|get_database| |op| 'CONSTRUCTORKIND))
               (COND
                ((SETQ |cosig| (|get_database| |op| 'COSIG))
                 (CONS |op|
                       ((LAMBDA
                            (|bfVar#13| |bfVar#11| |x| |bfVar#12| |typeFlag|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#11|)
                                 (PROGN (SETQ |x| (CAR |bfVar#11|)) NIL)
                                 (ATOM |bfVar#12|)
                                 (PROGN
                                  (SETQ |typeFlag| (CAR |bfVar#12|))
                                  NIL))
                             (RETURN (NREVERSE |bfVar#13|)))
                            (#1#
                             (SETQ |bfVar#13|
                                     (CONS
                                      (COND
                                       (|typeFlag|
                                        (COND
                                         ((EQ |kind| '|category|) (MKQ |x|))
                                         ((VECP |x|) (MKQ |x|))
                                         (#1# (|mkEvalable| |x|))))
                                       ((AND (CONSP |x|) (EQ (CAR |x|) 'QUOTE))
                                        |x|)
                                       ((AND (CONSP |x|) (EQ (CAR |x|) '|#|)
                                             (PROGN
                                              (SETQ |ISTMP#1| (CDR |x|))
                                              (AND (CONSP |ISTMP#1|)
                                                   (EQ (CDR |ISTMP#1|) NIL)
                                                   (PROGN
                                                    (SETQ |y| (CAR |ISTMP#1|))
                                                    #1#))))
                                        (LIST 'LENGTH (MKQ |y|)))
                                       (#1# (MKQ |x|)))
                                      |bfVar#13|))))
                           (SETQ |bfVar#11| (CDR |bfVar#11|))
                           (SETQ |bfVar#12| (CDR |bfVar#12|))))
                        NIL |argl| NIL (CDR |cosig|) NIL)))
                (#1#
                 (CONS |op|
                       ((LAMBDA (|bfVar#15| |bfVar#14| |x|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#14|)
                                 (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
                             (RETURN (NREVERSE |bfVar#15|)))
                            (#1#
                             (SETQ |bfVar#15|
                                     (CONS (|mkEvalable| |x|) |bfVar#15|))))
                           (SETQ |bfVar#14| (CDR |bfVar#14|))))
                        NIL |argl| NIL))))))))
      ((EQUAL |form| |$EmptyMode|) |$Integer|)
      ((AND (IDENTP |form|) (|constructor?| |form|)) (LIST |form|))
      (#1# |form|)))))

; mkEvalableMapping form ==
;   [first form,:[mkEvalable d for d in rest form]]

(DEFUN |mkEvalableMapping| (|form|)
  (PROG ()
    (RETURN
     (CONS (CAR |form|)
           ((LAMBDA (|bfVar#17| |bfVar#16| |d|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#16|) (PROGN (SETQ |d| (CAR |bfVar#16|)) NIL))
                 (RETURN (NREVERSE |bfVar#17|)))
                ('T (SETQ |bfVar#17| (CONS (|mkEvalable| |d|) |bfVar#17|))))
               (SETQ |bfVar#16| (CDR |bfVar#16|))))
            NIL (CDR |form|) NIL)))))

; mkEvalableRecord form ==
;   [first form,:[[":",n,mkEvalable d] for [":",n,d] in rest form]]

(DEFUN |mkEvalableRecord| (|form|)
  (PROG (|ISTMP#1| |n| |ISTMP#2| |d|)
    (RETURN
     (CONS (CAR |form|)
           ((LAMBDA (|bfVar#20| |bfVar#19| |bfVar#18|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#19|)
                     (PROGN (SETQ |bfVar#18| (CAR |bfVar#19|)) NIL))
                 (RETURN (NREVERSE |bfVar#20|)))
                (#1='T
                 (AND (CONSP |bfVar#18|) (EQ (CAR |bfVar#18|) '|:|)
                      (PROGN
                       (SETQ |ISTMP#1| (CDR |bfVar#18|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN
                             (SETQ |n| (CAR |ISTMP#1|))
                             (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                             (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                  (PROGN (SETQ |d| (CAR |ISTMP#2|)) #1#)))))
                      (SETQ |bfVar#20|
                              (CONS (LIST '|:| |n| (|mkEvalable| |d|))
                                    |bfVar#20|)))))
               (SETQ |bfVar#19| (CDR |bfVar#19|))))
            NIL (CDR |form|) NIL)))))

; mkEvalableUnion form ==
;   isTaggedUnion form =>
;     [first form,:[[":",n,mkEvalable d] for [":",n,d] in rest form]]
;   [first form,:[mkEvalable d for d in rest form]]

(DEFUN |mkEvalableUnion| (|form|)
  (PROG (|ISTMP#1| |n| |ISTMP#2| |d|)
    (RETURN
     (COND
      ((|isTaggedUnion| |form|)
       (CONS (CAR |form|)
             ((LAMBDA (|bfVar#23| |bfVar#22| |bfVar#21|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#22|)
                       (PROGN (SETQ |bfVar#21| (CAR |bfVar#22|)) NIL))
                   (RETURN (NREVERSE |bfVar#23|)))
                  (#1='T
                   (AND (CONSP |bfVar#21|) (EQ (CAR |bfVar#21|) '|:|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |bfVar#21|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |n| (CAR |ISTMP#1|))
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN (SETQ |d| (CAR |ISTMP#2|)) #1#)))))
                        (SETQ |bfVar#23|
                                (CONS (LIST '|:| |n| (|mkEvalable| |d|))
                                      |bfVar#23|)))))
                 (SETQ |bfVar#22| (CDR |bfVar#22|))))
              NIL (CDR |form|) NIL)))
      (#1#
       (CONS (CAR |form|)
             ((LAMBDA (|bfVar#25| |bfVar#24| |d|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#24|)
                       (PROGN (SETQ |d| (CAR |bfVar#24|)) NIL))
                   (RETURN (NREVERSE |bfVar#25|)))
                  (#1# (SETQ |bfVar#25| (CONS (|mkEvalable| |d|) |bfVar#25|))))
                 (SETQ |bfVar#24| (CDR |bfVar#24|))))
              NIL (CDR |form|) NIL)))))))

; evaluateType form ==
;   -- Takes a parsed, unabbreviated type and evaluates it, replacing
;   --  type valued variables with their values, and calling bottomUp
;   --  on non-type valued arguments to the constructor
;   --  and finally checking to see whether the type satisfies the
;   --  conditions of its modemap
;   domain:= isDomainValuedVariable form => domain
;   form = $EmptyMode => form
;   form = "?"        => $EmptyMode
;   STRINGP form => form
;   form = "%" => form
;   form is ['typeOf,.] =>
;     form' := mkAtree form
;     bottomUp form'
;     objVal getValue(form')
;   form is [op,:argl] =>
;     op='CATEGORY =>
;       argl is [x,:sigs] => [op,x,:[evaluateSignature(s) for s in sigs]]
;       form
;     op in '(Join Mapping) =>
;       [op,:[evaluateType arg for arg in argl]]
;     op='Union  =>
;       argl and first argl is [x,.,.] and member(x,'(_: Declare)) =>
;         [op,:[['_:,sel,evaluateType type] for ['_:,sel,type] in argl]]
;       [op,:[evaluateType arg for arg in argl]]
;     op='Record =>
;       [op,:[['_:,sel,evaluateType type] for ['_:,sel,type] in argl]]
;     op='Enumeration => form
;     evaluateFormAsType form
;   constructor? form =>
;         ATOM(form) => evaluateType([form])
;         throw_eval_msg_not_full([form, form])
;   throw_msg_eval_invalid_type(form)

(DEFUN |evaluateType| (|form|)
  (PROG (|domain| |ISTMP#1| |form'| |op| |argl| |x| |sigs| |ISTMP#2| |ISTMP#3|
         |sel| |type|)
    (RETURN
     (COND ((SETQ |domain| (|isDomainValuedVariable| |form|)) |domain|)
           ((EQUAL |form| |$EmptyMode|) |form|) ((EQ |form| '?) |$EmptyMode|)
           ((STRINGP |form|) |form|) ((EQ |form| '%) |form|)
           ((AND (CONSP |form|) (EQ (CAR |form|) '|typeOf|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |form|))
                  (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL))))
            (PROGN
             (SETQ |form'| (|mkAtree| |form|))
             (|bottomUp| |form'|)
             (|objVal| (|getValue| |form'|))))
           ((AND (CONSP |form|)
                 (PROGN
                  (SETQ |op| (CAR |form|))
                  (SETQ |argl| (CDR |form|))
                  #1='T))
            (COND
             ((EQ |op| 'CATEGORY)
              (COND
               ((AND (CONSP |argl|)
                     (PROGN
                      (SETQ |x| (CAR |argl|))
                      (SETQ |sigs| (CDR |argl|))
                      #1#))
                (CONS |op|
                      (CONS |x|
                            ((LAMBDA (|bfVar#27| |bfVar#26| |s|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#26|)
                                      (PROGN (SETQ |s| (CAR |bfVar#26|)) NIL))
                                  (RETURN (NREVERSE |bfVar#27|)))
                                 (#1#
                                  (SETQ |bfVar#27|
                                          (CONS (|evaluateSignature| |s|)
                                                |bfVar#27|))))
                                (SETQ |bfVar#26| (CDR |bfVar#26|))))
                             NIL |sigs| NIL))))
               (#1# |form|)))
             ((|member| |op| '(|Join| |Mapping|))
              (CONS |op|
                    ((LAMBDA (|bfVar#29| |bfVar#28| |arg|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#28|)
                              (PROGN (SETQ |arg| (CAR |bfVar#28|)) NIL))
                          (RETURN (NREVERSE |bfVar#29|)))
                         (#1#
                          (SETQ |bfVar#29|
                                  (CONS (|evaluateType| |arg|) |bfVar#29|))))
                        (SETQ |bfVar#28| (CDR |bfVar#28|))))
                     NIL |argl| NIL)))
             ((EQ |op| '|Union|)
              (COND
               ((AND |argl|
                     (PROGN
                      (SETQ |ISTMP#1| (CAR |argl|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |x| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|)
                                 (PROGN
                                  (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                  (AND (CONSP |ISTMP#3|)
                                       (EQ (CDR |ISTMP#3|) NIL)))))))
                     (|member| |x| '(|:| |Declare|)))
                (CONS |op|
                      ((LAMBDA (|bfVar#32| |bfVar#31| |bfVar#30|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#31|)
                                (PROGN (SETQ |bfVar#30| (CAR |bfVar#31|)) NIL))
                            (RETURN (NREVERSE |bfVar#32|)))
                           (#1#
                            (AND (CONSP |bfVar#30|) (EQ (CAR |bfVar#30|) '|:|)
                                 (PROGN
                                  (SETQ |ISTMP#1| (CDR |bfVar#30|))
                                  (AND (CONSP |ISTMP#1|)
                                       (PROGN
                                        (SETQ |sel| (CAR |ISTMP#1|))
                                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                        (AND (CONSP |ISTMP#2|)
                                             (EQ (CDR |ISTMP#2|) NIL)
                                             (PROGN
                                              (SETQ |type| (CAR |ISTMP#2|))
                                              #1#)))))
                                 (SETQ |bfVar#32|
                                         (CONS
                                          (LIST '|:| |sel|
                                                (|evaluateType| |type|))
                                          |bfVar#32|)))))
                          (SETQ |bfVar#31| (CDR |bfVar#31|))))
                       NIL |argl| NIL)))
               (#1#
                (CONS |op|
                      ((LAMBDA (|bfVar#34| |bfVar#33| |arg|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#33|)
                                (PROGN (SETQ |arg| (CAR |bfVar#33|)) NIL))
                            (RETURN (NREVERSE |bfVar#34|)))
                           (#1#
                            (SETQ |bfVar#34|
                                    (CONS (|evaluateType| |arg|) |bfVar#34|))))
                          (SETQ |bfVar#33| (CDR |bfVar#33|))))
                       NIL |argl| NIL)))))
             ((EQ |op| '|Record|)
              (CONS |op|
                    ((LAMBDA (|bfVar#37| |bfVar#36| |bfVar#35|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#36|)
                              (PROGN (SETQ |bfVar#35| (CAR |bfVar#36|)) NIL))
                          (RETURN (NREVERSE |bfVar#37|)))
                         (#1#
                          (AND (CONSP |bfVar#35|) (EQ (CAR |bfVar#35|) '|:|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |bfVar#35|))
                                (AND (CONSP |ISTMP#1|)
                                     (PROGN
                                      (SETQ |sel| (CAR |ISTMP#1|))
                                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (EQ (CDR |ISTMP#2|) NIL)
                                           (PROGN
                                            (SETQ |type| (CAR |ISTMP#2|))
                                            #1#)))))
                               (SETQ |bfVar#37|
                                       (CONS
                                        (LIST '|:| |sel|
                                              (|evaluateType| |type|))
                                        |bfVar#37|)))))
                        (SETQ |bfVar#36| (CDR |bfVar#36|))))
                     NIL |argl| NIL)))
             ((EQ |op| '|Enumeration|) |form|)
             (#1# (|evaluateFormAsType| |form|))))
           ((|constructor?| |form|)
            (COND ((ATOM |form|) (|evaluateType| (LIST |form|)))
                  (#1# (|throw_eval_msg_not_full| (LIST |form| |form|)))))
           (#1# (|throw_msg_eval_invalid_type| |form|))))))

; evaluateFormAsType form ==
;   form is [op,:args] and constructor? op => evaluateType1 form
;   t := mkAtree form
;   -- ??? Maybe we should be more careful about generalized types.
;   bottomUp t is [m] and (m = ["Mode"] or isCategoryForm(m)) =>
;     objVal getValue t
;   throw_msg_eval_invalid_type(form)

(DEFUN |evaluateFormAsType| (|form|)
  (PROG (|op| |args| |t| |ISTMP#1| |m|)
    (RETURN
     (COND
      ((AND (CONSP |form|)
            (PROGN (SETQ |op| (CAR |form|)) (SETQ |args| (CDR |form|)) #1='T)
            (|constructor?| |op|))
       (|evaluateType1| |form|))
      (#1#
       (PROGN
        (SETQ |t| (|mkAtree| |form|))
        (COND
         ((AND
           (PROGN
            (SETQ |ISTMP#1| (|bottomUp| |t|))
            (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                 (PROGN (SETQ |m| (CAR |ISTMP#1|)) #1#)))
           (OR (EQUAL |m| (LIST '|Mode|)) (|isCategoryForm| |m|)))
          (|objVal| (|getValue| |t|)))
         (#1# (|throw_msg_eval_invalid_type| |form|)))))))))

; evaluateType1 form ==
;   --evaluates the arguments passed to a constructor
;   [op,:argl]:= form
;   constructor? op =>
;     null (sig := getConstructorSignature form) =>
;         throw_eval_type_msg("S2IE0005",
;             '"You cannot now use %1bp in the context you have it.",
;             [form])
;     [.,:ml] := sig
;     ml := replaceSharps(ml,form)
;     #argl ~= #ml => throw_eval_msg_not_full([form, form])
;     for x in argl for m in ml for argnum in 1.. repeat
;       typeList := [v,:typeList] where v ==
;         categoryForm?(m) =>
;           m := evaluateType(SUBST(x, '%, m))
;           evalCategory(x' := (evaluateType x), m) => x'
;           throw_msg_eval_invalid_type(form)
;         m := evaluateType m
;         get_database(opOf(m), 'CONSTRUCTORKIND) = 'domain and
;             (tree := mkAtree x) and  putTarget(tree,m) and ((bottomUp tree) is [m1]) =>
;                 [zt,:zv]:= z1:= getAndEvalConstructorArgument tree
;                 (v1 := coerceOrRetract(z1, m)) => objValUnwrap v1
;                 throwMsgCannotCoerceWithValue(zv, zt, m)
;         throw_eval_type_msg("S2IE0006",
;             '"Cannot convert the %1 argument of %3p to the type %2p .",
;             [makeOrdinal(argnum), m, form])
;     [op,:NREVERSE typeList]
;   throw_eval_type_msg("S2IE0007",
;       '"Category, domain or package constructor %1b is not available.", [op])

(DEFUN |evaluateType1| (|form|)
  (PROG (|op| |argl| |sig| |ml| |x'| |tree| |ISTMP#1| |m1| |z1| |zt| |zv| |v1|
         |typeList|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |form|))
      (SETQ |argl| (CDR |form|))
      (COND
       ((|constructor?| |op|)
        (COND
         ((NULL (SETQ |sig| (|getConstructorSignature| |form|)))
          (|throw_eval_type_msg| 'S2IE0005
           "You cannot now use %1bp in the context you have it."
           (LIST |form|)))
         (#1='T
          (PROGN
           (SETQ |ml| (CDR |sig|))
           (SETQ |ml| (|replaceSharps| |ml| |form|))
           (COND
            ((NOT (EQL (LENGTH |argl|) (LENGTH |ml|)))
             (|throw_eval_msg_not_full| (LIST |form| |form|)))
            (#1#
             (PROGN
              ((LAMBDA (|bfVar#38| |x| |bfVar#39| |m| |argnum|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#38|)
                        (PROGN (SETQ |x| (CAR |bfVar#38|)) NIL)
                        (ATOM |bfVar#39|)
                        (PROGN (SETQ |m| (CAR |bfVar#39|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (SETQ |typeList|
                            (CONS
                             (COND
                              ((|categoryForm?| |m|)
                               (PROGN
                                (SETQ |m| (|evaluateType| (SUBST |x| '% |m|)))
                                (COND
                                 ((|evalCategory|
                                   (SETQ |x'| (|evaluateType| |x|)) |m|)
                                  |x'|)
                                 (#1#
                                  (|throw_msg_eval_invalid_type| |form|)))))
                              (#1#
                               (PROGN
                                (SETQ |m| (|evaluateType| |m|))
                                (COND
                                 ((AND
                                   (EQ
                                    (|get_database| (|opOf| |m|)
                                     'CONSTRUCTORKIND)
                                    '|domain|)
                                   (SETQ |tree| (|mkAtree| |x|))
                                   (|putTarget| |tree| |m|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (|bottomUp| |tree|))
                                    (AND (CONSP |ISTMP#1|)
                                         (EQ (CDR |ISTMP#1|) NIL)
                                         (PROGN
                                          (SETQ |m1| (CAR |ISTMP#1|))
                                          #1#))))
                                  (PROGN
                                   (SETQ |z1|
                                           (|getAndEvalConstructorArgument|
                                            |tree|))
                                   (SETQ |zt| (CAR |z1|))
                                   (SETQ |zv| (CDR |z1|))
                                   (COND
                                    ((SETQ |v1| (|coerceOrRetract| |z1| |m|))
                                     (|objValUnwrap| |v1|))
                                    (#1#
                                     (|throwMsgCannotCoerceWithValue| |zv| |zt|
                                      |m|)))))
                                 (#1#
                                  (|throw_eval_type_msg| 'S2IE0006
                                   "Cannot convert the %1 argument of %3p to the type %2p ."
                                   (LIST (|makeOrdinal| |argnum|) |m|
                                         |form|)))))))
                             |typeList|))))
                  (SETQ |bfVar#38| (CDR |bfVar#38|))
                  (SETQ |bfVar#39| (CDR |bfVar#39|))
                  (SETQ |argnum| (+ |argnum| 1))))
               |argl| NIL |ml| NIL 1)
              (CONS |op| (NREVERSE |typeList|)))))))))
       (#1#
        (|throw_eval_type_msg| 'S2IE0007
         "Category, domain or package constructor %1b is not available."
         (LIST |op|))))))))

; throw_eval_type_msg(key, msg, args) ==
;   $justUnparseType : local := true
;   $noEvalTypeMsg => spadThrow()
;   throw_msg(key, msg, args)

(DEFUN |throw_eval_type_msg| (|key| |msg| |args|)
  (PROG (|$justUnparseType|)
    (DECLARE (SPECIAL |$justUnparseType|))
    (RETURN
     (PROGN
      (SETQ |$justUnparseType| T)
      (COND (|$noEvalTypeMsg| (|spadThrow|))
            ('T (|throw_msg| |key| |msg| |args|)))))))

; throw_eval_msg_not_full(l) == throw_eval_type_msg("S2IE0003", CONCAT(
;     '"Although %1b is the name of a constructor, a full type must be ",
;     '"specified in the context you have used it.  Issue %b )show %2 %d ",
;     '"for more information."), l)

(DEFUN |throw_eval_msg_not_full| (|l|)
  (PROG ()
    (RETURN
     (|throw_eval_type_msg| 'S2IE0003
      (CONCAT "Although %1b is the name of a constructor, a full type must be "
              "specified in the context you have used it.  Issue %b )show %2 %d "
              "for more information.")
      |l|))))

; throw_type_msg(key, msg, args, eval?, pos) ==
;     eval? => throw_eval_type_msg(key, msg, args)
;     throw_msg_pos(key, msg, args, pos)

(DEFUN |throw_type_msg| (|key| |msg| |args| |eval?| |pos|)
  (PROG ()
    (RETURN
     (COND (|eval?| (|throw_eval_type_msg| |key| |msg| |args|))
           ('T (|throw_msg_pos| |key| |msg| |args| |pos|))))))

; throw_msg_invalid_type2(t, eval?, pos) == throw_type_msg("S2IE0004",
;     '"%1bp is not a valid type.", [t], eval?, pos)

(DEFUN |throw_msg_invalid_type2| (|t| |eval?| |pos|)
  (PROG ()
    (RETURN
     (|throw_type_msg| 'S2IE0004 "%1bp is not a valid type." (LIST |t|) |eval?|
      |pos|))))

; throw_msg_eval_invalid_type(t) == throw_msg_invalid_type2(t, true, nil)

(DEFUN |throw_msg_eval_invalid_type| (|t|)
  (PROG () (RETURN (|throw_msg_invalid_type2| |t| T NIL))))

; throw_msg_invalid_type(t) == throw_msg_invalid_type2(t, false, nil)

(DEFUN |throw_msg_invalid_type| (|t|)
  (PROG () (RETURN (|throw_msg_invalid_type2| |t| NIL NIL))))

; throw_msg_unknown_type(t, eval?) == throw_type_msg("S2IL0015", CONCAT(
;     '"%1b is an unknown constructor and so is unavailable. Did you ",
;     '"mean to use %b -> %d but type something different instead?"), [t],
;     eval?, nil)

(DEFUN |throw_msg_unknown_type| (|t| |eval?|)
  (PROG ()
    (RETURN
     (|throw_type_msg| 'S2IL0015
      (CONCAT "%1b is an unknown constructor and so is unavailable. Did you "
              "mean to use %b -> %d but type something different instead?")
      (LIST |t|) |eval?| NIL))))

; makeOrdinal i ==
;   ('(first second third fourth fifth sixth seventh eighth ninth tenth)).(i-1)

(DEFUN |makeOrdinal| (|i|)
  (PROG ()
    (RETURN
     (ELT
      '(|first| |second| |third| |fourth| |fifth| |sixth| |seventh| |eighth|
        |ninth| |tenth|)
      (- |i| 1)))))

; evaluateSignature sig ==
;   -- calls evaluateType on a signature
;   sig is [ ='SIGNATURE,fun,sigl] =>
;     ['SIGNATURE,fun,
;       [(t = '% => t; evaluateType(t)) for t in sigl]]
;   sig

(DEFUN |evaluateSignature| (|sig|)
  (PROG (|ISTMP#1| |fun| |ISTMP#2| |sigl|)
    (RETURN
     (COND
      ((AND (CONSP |sig|) (EQUAL (CAR |sig|) 'SIGNATURE)
            (PROGN
             (SETQ |ISTMP#1| (CDR |sig|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |fun| (CAR |ISTMP#1|))
                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                   (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                        (PROGN (SETQ |sigl| (CAR |ISTMP#2|)) #1='T))))))
       (LIST 'SIGNATURE |fun|
             ((LAMBDA (|bfVar#41| |bfVar#40| |t|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#40|)
                       (PROGN (SETQ |t| (CAR |bfVar#40|)) NIL))
                   (RETURN (NREVERSE |bfVar#41|)))
                  (#1#
                   (SETQ |bfVar#41|
                           (CONS
                            (COND ((EQ |t| '%) |t|) (#1# (|evaluateType| |t|)))
                            |bfVar#41|))))
                 (SETQ |bfVar#40| (CDR |bfVar#40|))))
              NIL |sigl| NIL)))
      (#1# |sig|)))))

; splitIntoBlocksOf200 a ==
;   null a => nil
;   [[first (r:=x) for x in tails a for i in 1..200],
;     :splitIntoBlocksOf200 rest r]

(DEFUN |splitIntoBlocksOf200| (|a|)
  (PROG (|r|)
    (RETURN
     (COND ((NULL |a|) NIL)
           (#1='T
            (CONS
             ((LAMBDA (|bfVar#42| |x| |i|)
                (LOOP
                 (COND
                  ((OR (ATOM |x|) (> |i| 200)) (RETURN (NREVERSE |bfVar#42|)))
                  (#1#
                   (SETQ |bfVar#42| (CONS (CAR (SETQ |r| |x|)) |bfVar#42|))))
                 (SETQ |x| (CDR |x|))
                 (SETQ |i| (+ |i| 1))))
              NIL |a| 1)
             (|splitIntoBlocksOf200| (CDR |r|))))))))

; evalForm(op,opName,argl,mmS) ==
;   -- applies the first applicable function
;
;   for mm in mmS until form repeat
;     [sig,fun,cond]:= mm
;     (CAR sig) = 'interpOnly => form := CAR sig
;     #argl ~= #CDDR sig => 'skip ---> RDJ 6/95
;     form:=
;       $genValue or null cond =>
;         [getArgValue2(x,t,sideEffectedArg?(t,sig,opName),opName) or return NIL
;          for x in argl for t in CDDR sig]
;       [getArgValueComp2(x,t,c,sideEffectedArg?(t,sig,opName),opName) or return NIL
;         for x in argl for t in CDDR sig for c in cond]
;     form or null argl =>
;       dc:= CAR sig
;       form :=
;         dc='local => --[fun,:form]
;           atom fun =>
;             fun in $localVars => ['SPADCALL,:form,fun]
;             [fun,:form,NIL]
;           ['SPADCALL,:form,fun]
;         dc is ["__FreeFunction__",:freeFun] =>
;           ['SPADCALL,:form,freeFun]
;         fun is ['XLAM,xargs,:xbody] =>
;           rec :=  first form
;           xbody is [['RECORDELT,.,ind,len]] =>
;             optRECORDELT([CAAR xbody,rec,ind,len])
;           xbody is [['SETRECORDELT,.,ind,len,.]] =>
;             optSETRECORDELT([CAAR xbody,rec,ind,len,CADDR form])
;           xbody is [['RECORDCOPY,.,len]] =>
;             optRECORDCOPY([CAAR xbody,rec,len])
;           ['FUNCALL,['function , ['LAMBDA,xargs,:xbody]],:TAKE(#xargs, form)]
;         dcVector := evalDomain dc
;         fun0 := NRTcompileEvalForm(opName,fun,dcVector)
;         null fun0 => throw_msg("S2IE0008", CONCAT(
;            '"Cannot find an applicable defined function %1b for the given",
;            '" arguments."), [opName])
;         [bpi,:domain] := fun0
;         EQ(bpi,function Undef) =>
;          say_msg("S2IE0009",
;              '"Operation %b %1 : %2 %d is not implemented in %3bp .",
;                  [opName, formatSignature(rest(sig)), first(sig)])
;          NIL
;         if $NRTmonitorIfTrue = true then
;           sayBrightlyNT ['"Applying ",first fun0,'" to:"]
;           pp [devaluateDeeply x for x in form]
;         _% : fluid := domain
;         ['SPADCALL, :form, fun0]
;   not form => nil
;   form='interpOnly => rewriteMap(op,opName,argl)
;   targetType := CADR sig
;   if CONTAINED('_#,targetType) then targetType := NRTtypeHack targetType
;   evalFormMkValue(op,form,targetType)

(DEFUN |evalForm| (|op| |opName| |argl| |mmS|)
  (PROG (% |targetType| |domain| |bpi| |fun0| |dcVector| |ISTMP#5| |len|
         |ISTMP#4| |ind| |ISTMP#3| |ISTMP#2| |rec| |xbody| |xargs| |ISTMP#1|
         |freeFun| |dc| |form| |cond| |fun| |sig|)
    (DECLARE (SPECIAL %))
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#43| |mm| |bfVar#44|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#43|) (PROGN (SETQ |mm| (CAR |bfVar#43|)) NIL)
                |bfVar#44|)
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |sig| (CAR |mm|))
             (SETQ |fun| (CADR . #2=(|mm|)))
             (SETQ |cond| (CADDR . #2#))
             (COND ((EQ (CAR |sig|) '|interpOnly|) (SETQ |form| (CAR |sig|)))
                   ((NOT (EQL (LENGTH |argl|) (LENGTH (CDDR |sig|)))) '|skip|)
                   (#1#
                    (PROGN
                     (SETQ |form|
                             (COND
                              ((OR |$genValue| (NULL |cond|))
                               ((LAMBDA
                                    (|bfVar#47| |bfVar#45| |x| |bfVar#46| |t|)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#45|)
                                         (PROGN
                                          (SETQ |x| (CAR |bfVar#45|))
                                          NIL)
                                         (ATOM |bfVar#46|)
                                         (PROGN
                                          (SETQ |t| (CAR |bfVar#46|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#47|)))
                                    (#1#
                                     (SETQ |bfVar#47|
                                             (CONS
                                              (OR
                                               (|getArgValue2| |x| |t|
                                                (|sideEffectedArg?| |t| |sig|
                                                 |opName|)
                                                |opName|)
                                               (RETURN NIL))
                                              |bfVar#47|))))
                                   (SETQ |bfVar#45| (CDR |bfVar#45|))
                                   (SETQ |bfVar#46| (CDR |bfVar#46|))))
                                NIL |argl| NIL (CDDR |sig|) NIL))
                              (#1#
                               ((LAMBDA
                                    (|bfVar#51| |bfVar#48| |x| |bfVar#49| |t|
                                     |bfVar#50| |c|)
                                  (LOOP
                                   (COND
                                    ((OR (ATOM |bfVar#48|)
                                         (PROGN
                                          (SETQ |x| (CAR |bfVar#48|))
                                          NIL)
                                         (ATOM |bfVar#49|)
                                         (PROGN
                                          (SETQ |t| (CAR |bfVar#49|))
                                          NIL)
                                         (ATOM |bfVar#50|)
                                         (PROGN
                                          (SETQ |c| (CAR |bfVar#50|))
                                          NIL))
                                     (RETURN (NREVERSE |bfVar#51|)))
                                    (#1#
                                     (SETQ |bfVar#51|
                                             (CONS
                                              (OR
                                               (|getArgValueComp2| |x| |t| |c|
                                                (|sideEffectedArg?| |t| |sig|
                                                 |opName|)
                                                |opName|)
                                               (RETURN NIL))
                                              |bfVar#51|))))
                                   (SETQ |bfVar#48| (CDR |bfVar#48|))
                                   (SETQ |bfVar#49| (CDR |bfVar#49|))
                                   (SETQ |bfVar#50| (CDR |bfVar#50|))))
                                NIL |argl| NIL (CDDR |sig|) NIL |cond| NIL))))
                     (COND
                      ((OR |form| (NULL |argl|))
                       (PROGN
                        (SETQ |dc| (CAR |sig|))
                        (SETQ |form|
                                (COND
                                 ((EQ |dc| '|local|)
                                  (COND
                                   ((ATOM |fun|)
                                    (COND
                                     ((|member| |fun| |$localVars|)
                                      (CONS 'SPADCALL
                                            (APPEND |form| (CONS |fun| NIL))))
                                     (#1#
                                      (CONS |fun|
                                            (APPEND |form| (CONS NIL NIL))))))
                                   (#1#
                                    (CONS 'SPADCALL
                                          (APPEND |form| (CONS |fun| NIL))))))
                                 ((AND (CONSP |dc|)
                                       (EQ (CAR |dc|) '|_FreeFunction_|)
                                       (PROGN (SETQ |freeFun| (CDR |dc|)) #1#))
                                  (CONS 'SPADCALL
                                        (APPEND |form| (CONS |freeFun| NIL))))
                                 ((AND (CONSP |fun|) (EQ (CAR |fun|) 'XLAM)
                                       (PROGN
                                        (SETQ |ISTMP#1| (CDR |fun|))
                                        (AND (CONSP |ISTMP#1|)
                                             (PROGN
                                              (SETQ |xargs| (CAR |ISTMP#1|))
                                              (SETQ |xbody| (CDR |ISTMP#1|))
                                              #1#))))
                                  (PROGN
                                   (SETQ |rec| (CAR |form|))
                                   (COND
                                    ((AND (CONSP |xbody|)
                                          (EQ (CDR |xbody|) NIL)
                                          (PROGN
                                           (SETQ |ISTMP#1| (CAR |xbody|))
                                           (AND (CONSP |ISTMP#1|)
                                                (EQ (CAR |ISTMP#1|) 'RECORDELT)
                                                (PROGN
                                                 (SETQ |ISTMP#2|
                                                         (CDR |ISTMP#1|))
                                                 (AND (CONSP |ISTMP#2|)
                                                      (PROGN
                                                       (SETQ |ISTMP#3|
                                                               (CDR |ISTMP#2|))
                                                       (AND (CONSP |ISTMP#3|)
                                                            (PROGN
                                                             (SETQ |ind|
                                                                     (CAR
                                                                      |ISTMP#3|))
                                                             (SETQ |ISTMP#4|
                                                                     (CDR
                                                                      |ISTMP#3|))
                                                             (AND
                                                              (CONSP |ISTMP#4|)
                                                              (EQ
                                                               (CDR |ISTMP#4|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |len|
                                                                       (CAR
                                                                        |ISTMP#4|))
                                                               #1#))))))))))
                                     (|optRECORDELT|
                                      (LIST (CAAR |xbody|) |rec| |ind| |len|)))
                                    ((AND (CONSP |xbody|)
                                          (EQ (CDR |xbody|) NIL)
                                          (PROGN
                                           (SETQ |ISTMP#1| (CAR |xbody|))
                                           (AND (CONSP |ISTMP#1|)
                                                (EQ (CAR |ISTMP#1|)
                                                    'SETRECORDELT)
                                                (PROGN
                                                 (SETQ |ISTMP#2|
                                                         (CDR |ISTMP#1|))
                                                 (AND (CONSP |ISTMP#2|)
                                                      (PROGN
                                                       (SETQ |ISTMP#3|
                                                               (CDR |ISTMP#2|))
                                                       (AND (CONSP |ISTMP#3|)
                                                            (PROGN
                                                             (SETQ |ind|
                                                                     (CAR
                                                                      |ISTMP#3|))
                                                             (SETQ |ISTMP#4|
                                                                     (CDR
                                                                      |ISTMP#3|))
                                                             (AND
                                                              (CONSP |ISTMP#4|)
                                                              (PROGN
                                                               (SETQ |len|
                                                                       (CAR
                                                                        |ISTMP#4|))
                                                               (SETQ |ISTMP#5|
                                                                       (CDR
                                                                        |ISTMP#4|))
                                                               (AND
                                                                (CONSP
                                                                 |ISTMP#5|)
                                                                (EQ
                                                                 (CDR
                                                                  |ISTMP#5|)
                                                                 NIL))))))))))))
                                     (|optSETRECORDELT|
                                      (LIST (CAAR |xbody|) |rec| |ind| |len|
                                            (CADDR |form|))))
                                    ((AND (CONSP |xbody|)
                                          (EQ (CDR |xbody|) NIL)
                                          (PROGN
                                           (SETQ |ISTMP#1| (CAR |xbody|))
                                           (AND (CONSP |ISTMP#1|)
                                                (EQ (CAR |ISTMP#1|)
                                                    'RECORDCOPY)
                                                (PROGN
                                                 (SETQ |ISTMP#2|
                                                         (CDR |ISTMP#1|))
                                                 (AND (CONSP |ISTMP#2|)
                                                      (PROGN
                                                       (SETQ |ISTMP#3|
                                                               (CDR |ISTMP#2|))
                                                       (AND (CONSP |ISTMP#3|)
                                                            (EQ (CDR |ISTMP#3|)
                                                                NIL)
                                                            (PROGN
                                                             (SETQ |len|
                                                                     (CAR
                                                                      |ISTMP#3|))
                                                             #1#))))))))
                                     (|optRECORDCOPY|
                                      (LIST (CAAR |xbody|) |rec| |len|)))
                                    (#1#
                                     (CONS 'FUNCALL
                                           (CONS
                                            (LIST '|function|
                                                  (CONS 'LAMBDA
                                                        (CONS |xargs|
                                                              |xbody|)))
                                            (TAKE (LENGTH |xargs|)
                                             |form|)))))))
                                 (#1#
                                  (PROGN
                                   (SETQ |dcVector| (|evalDomain| |dc|))
                                   (SETQ |fun0|
                                           (|NRTcompileEvalForm| |opName| |fun|
                                            |dcVector|))
                                   (COND
                                    ((NULL |fun0|)
                                     (|throw_msg| 'S2IE0008
                                      (CONCAT
                                       "Cannot find an applicable defined function %1b for the given"
                                       " arguments.")
                                      (LIST |opName|)))
                                    (#1#
                                     (PROGN
                                      (SETQ |bpi| (CAR |fun0|))
                                      (SETQ |domain| (CDR |fun0|))
                                      (COND
                                       ((EQ |bpi| #'|Undef|)
                                        (PROGN
                                         (|say_msg| 'S2IE0009
                                          "Operation %b %1 : %2 %d is not implemented in %3bp ."
                                          (LIST |opName|
                                                (|formatSignature| (CDR |sig|))
                                                (CAR |sig|)))
                                         NIL))
                                       (#1#
                                        (PROGN
                                         (COND
                                          ((EQUAL |$NRTmonitorIfTrue| T)
                                           (|sayBrightlyNT|
                                            (LIST "Applying " (CAR |fun0|)
                                                  " to:"))
                                           (|pp|
                                            ((LAMBDA
                                                 (|bfVar#53| |bfVar#52| |x|)
                                               (LOOP
                                                (COND
                                                 ((OR (ATOM |bfVar#52|)
                                                      (PROGN
                                                       (SETQ |x|
                                                               (CAR
                                                                |bfVar#52|))
                                                       NIL))
                                                  (RETURN
                                                   (NREVERSE |bfVar#53|)))
                                                 (#1#
                                                  (SETQ |bfVar#53|
                                                          (CONS
                                                           (|devaluateDeeply|
                                                            |x|)
                                                           |bfVar#53|))))
                                                (SETQ |bfVar#52|
                                                        (CDR |bfVar#52|))))
                                             NIL |form| NIL))))
                                         (SETQ % |domain|)
                                         (CONS 'SPADCALL
                                               (APPEND |form|
                                                       (CONS |fun0|
                                                             NIL))))))))))))))))))))))
          (SETQ |bfVar#43| (CDR |bfVar#43|))
          (SETQ |bfVar#44| |form|)))
       |mmS| NIL NIL)
      (COND ((NULL |form|) NIL)
            ((EQ |form| '|interpOnly|) (|rewriteMap| |op| |opName| |argl|))
            (#1#
             (PROGN
              (SETQ |targetType| (CADR |sig|))
              (COND
               ((CONTAINED '|#| |targetType|)
                (SETQ |targetType| (|NRTtypeHack| |targetType|))))
              (|evalFormMkValue| |op| |form| |targetType|))))))))

; sideEffectedArg?(t,sig,opName) ==
;   opString := SYMBOL_-NAME opName
;   (opName ~= "setelt!") and (ELT(opString, #opString-1) ~= char '_!) => nil
;   dc := first sig
;   t = dc

(DEFUN |sideEffectedArg?| (|t| |sig| |opName|)
  (PROG (|opString| |dc|)
    (RETURN
     (PROGN
      (SETQ |opString| (SYMBOL-NAME |opName|))
      (COND
       ((AND (NOT (EQ |opName| '|setelt!|))
             (NOT
              (EQUAL (ELT |opString| (- (LENGTH |opString|) 1)) (|char| '!))))
        NIL)
       ('T (PROGN (SETQ |dc| (CAR |sig|)) (EQUAL |t| |dc|))))))))

; getArgValue(a, t) ==
;   atom a and not VECP a =>
;     t' := coerceOrRetract(getBasicObject a,t)
;     t' and wrapped2Quote objVal t'
;   v := getArgValue1(a, t) => v
;   alt := altTypeOf(objMode getValue a, a, nil) =>
;     t' := coerceInt(getValue a, alt)
;     t' := coerceOrRetract(t',t)
;     t' and wrapped2Quote objVal t'
;   nil

(DEFUN |getArgValue| (|a| |t|)
  (PROG (|t'| |v| |alt|)
    (RETURN
     (COND
      ((AND (ATOM |a|) (NULL (VECP |a|)))
       (PROGN
        (SETQ |t'| (|coerceOrRetract| (|getBasicObject| |a|) |t|))
        (AND |t'| (|wrapped2Quote| (|objVal| |t'|)))))
      ((SETQ |v| (|getArgValue1| |a| |t|)) |v|)
      ((SETQ |alt| (|altTypeOf| (|objMode| (|getValue| |a|)) |a| NIL))
       (PROGN
        (SETQ |t'| (|coerceInt| (|getValue| |a|) |alt|))
        (SETQ |t'| (|coerceOrRetract| |t'| |t|))
        (AND |t'| (|wrapped2Quote| (|objVal| |t'|)))))
      ('T NIL)))))

; getArgValue1(a,t) ==
;   -- creates a value for a, coercing to t
;   t' := getValue(a) =>
;     (m := getMode a) and (m is ['Mapping,:ml]) and (m = t) and
;       objValUnwrap(t') is ['SPADMAP, :.] =>
;         getMappingArgValue(a,t,m)
;     t' := coerceOrRetract(t',t)
;     t' and wrapped2Quote objVal t'
;   systemErrorHere '"getArgValue"

(DEFUN |getArgValue1| (|a| |t|)
  (PROG (|t'| |m| |ml| |ISTMP#1|)
    (RETURN
     (COND
      ((SETQ |t'| (|getValue| |a|))
       (COND
        ((AND (SETQ |m| (|getMode| |a|)) (CONSP |m|) (EQ (CAR |m|) '|Mapping|)
              (PROGN (SETQ |ml| (CDR |m|)) #1='T) (EQUAL |m| |t|)
              (PROGN
               (SETQ |ISTMP#1| (|objValUnwrap| |t'|))
               (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'SPADMAP))))
         (|getMappingArgValue| |a| |t| |m|))
        (#1#
         (PROGN
          (SETQ |t'| (|coerceOrRetract| |t'| |t|))
          (AND |t'| (|wrapped2Quote| (|objVal| |t'|)))))))
      (#1# (|systemErrorHere| "getArgValue"))))))

; throw_msg_convert(l) == throw_msg("S2IE0013", CONCAT(
;     '"The argument to the side-effect producing operation %1b is not ",
;     '"allowed to be converted from type %2bp to type %3bp ."), l)

(DEFUN |throw_msg_convert| (|l|)
  (PROG ()
    (RETURN
     (|throw_msg| 'S2IE0013
      (CONCAT "The argument to the side-effect producing operation %1b is not "
              "allowed to be converted from type %2bp to type %3bp .")
      |l|))))

; getArgValue2(a,t,se?,opName) ==
;   se? and (objMode(getValue a) ~= t) =>
;         throw_msg_convert([opName, objMode(getValue a), t])
;   getArgValue(a,t)

(DEFUN |getArgValue2| (|a| |t| |se?| |opName|)
  (PROG ()
    (RETURN
     (COND
      ((AND |se?| (NOT (EQUAL (|objMode| (|getValue| |a|)) |t|)))
       (|throw_msg_convert| (LIST |opName| (|objMode| (|getValue| |a|)) |t|)))
      ('T (|getArgValue| |a| |t|))))))

; getArgValueOrThrow(x, type) ==
;     getArgValue(x, type) or err_cannot_convert(type)

(DEFUN |getArgValueOrThrow| (|x| |type|)
  (PROG ()
    (RETURN (OR (|getArgValue| |x| |type|) (|err_cannot_convert| |type|)))))

; getMappingArgValue(a,t,m is ['Mapping,:ml]) ==
;   (una := getUnname a) in $localVars =>
;     $genValue =>
;       name := get0(una, 'name, $env)
;       a.0 := name
;       mmS := selectLocalMms(a,name,rest ml, nil)
;       or/[mm for mm in mmS |
;         (mm is [[., :ml1],oldName,:.] and ml=ml1)] =>
;             MKQ [COERCE(oldName, 'FUNCTION)]
;       NIL
;     una
;   mmS := selectLocalMms(a,una,rest ml, nil)
;   or/[mm for mm in mmS |
;     (mm is [[., :ml1],oldName,:.] and ml=ml1)] =>
;         MKQ [COERCE(oldName, 'FUNCTION)]
;   NIL

(DEFUN |getMappingArgValue| (|a| |t| |m|)
  (PROG (|ml| |una| |name| |mmS| |ISTMP#1| |ml1| |ISTMP#2| |oldName|)
    (RETURN
     (PROGN
      (SETQ |ml| (CDR |m|))
      (COND
       ((|member| (SETQ |una| (|getUnname| |a|)) |$localVars|)
        (COND
         (|$genValue|
          (PROGN
           (SETQ |name| (|get0| |una| '|name| |$env|))
           (SETF (ELT |a| 0) |name|)
           (SETQ |mmS| (|selectLocalMms| |a| |name| (CDR |ml|) NIL))
           (COND
            (((LAMBDA (|bfVar#55| |bfVar#54| |mm|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#54|)
                       (PROGN (SETQ |mm| (CAR |bfVar#54|)) NIL))
                   (RETURN |bfVar#55|))
                  (#1='T
                   (AND (CONSP |mm|)
                        (PROGN
                         (SETQ |ISTMP#1| (CAR |mm|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN (SETQ |ml1| (CDR |ISTMP#1|)) #1#)))
                        (PROGN
                         (SETQ |ISTMP#2| (CDR |mm|))
                         (AND (CONSP |ISTMP#2|)
                              (PROGN (SETQ |oldName| (CAR |ISTMP#2|)) #1#)))
                        (EQUAL |ml| |ml1|)
                        (PROGN
                         (SETQ |bfVar#55| |mm|)
                         (COND (|bfVar#55| (RETURN |bfVar#55|)))))))
                 (SETQ |bfVar#54| (CDR |bfVar#54|))))
              NIL |mmS| NIL)
             (MKQ (LIST (COERCE |oldName| 'FUNCTION))))
            (#1# NIL))))
         (#1# |una|)))
       (#1#
        (PROGN
         (SETQ |mmS| (|selectLocalMms| |a| |una| (CDR |ml|) NIL))
         (COND
          (((LAMBDA (|bfVar#57| |bfVar#56| |mm|)
              (LOOP
               (COND
                ((OR (ATOM |bfVar#56|)
                     (PROGN (SETQ |mm| (CAR |bfVar#56|)) NIL))
                 (RETURN |bfVar#57|))
                (#1#
                 (AND (CONSP |mm|)
                      (PROGN
                       (SETQ |ISTMP#1| (CAR |mm|))
                       (AND (CONSP |ISTMP#1|)
                            (PROGN (SETQ |ml1| (CDR |ISTMP#1|)) #1#)))
                      (PROGN
                       (SETQ |ISTMP#2| (CDR |mm|))
                       (AND (CONSP |ISTMP#2|)
                            (PROGN (SETQ |oldName| (CAR |ISTMP#2|)) #1#)))
                      (EQUAL |ml| |ml1|)
                      (PROGN
                       (SETQ |bfVar#57| |mm|)
                       (COND (|bfVar#57| (RETURN |bfVar#57|)))))))
               (SETQ |bfVar#56| (CDR |bfVar#56|))))
            NIL |mmS| NIL)
           (MKQ (LIST (COERCE |oldName| 'FUNCTION))))
          (#1# NIL)))))))))

; getArgValueComp2(arg, type, cond, se?, opName) ==
;   se? and (objMode(getValue arg) ~= type) =>
;         throw_msg_convert([opName, objMode(getValue arg), type])
;   getArgValueComp(arg, type, cond)

(DEFUN |getArgValueComp2| (|arg| |type| |cond| |se?| |opName|)
  (PROG ()
    (RETURN
     (COND
      ((AND |se?| (NOT (EQUAL (|objMode| (|getValue| |arg|)) |type|)))
       (|throw_msg_convert|
        (LIST |opName| (|objMode| (|getValue| |arg|)) |type|)))
      ('T (|getArgValueComp| |arg| |type| |cond|))))))

; getArgValueComp(arg,type,cond) ==
;   -- getArgValue for compiled case.  if there is a condition then
;   --  v must be data to verify that coerceInteractive succeeds.
;   v:= getArgValue(arg,type)
;   null v => nil
;   null cond => v
;   v is ['QUOTE,:.] or getBasicMode v => v
;   n := getUnnameIfCan arg
;   if num := isSharpVarWithNum n then
;     not $compilingMap => n := 'unknownVar
;     alias := get0($mapName, 'alias, $e)
;     n := alias.(num - 1)
;   msg_comp_failure("S2IE0010", CONCAT(
;     '"Your expression cannot be fully compiled because it contains an",
;     '" integer expression (for %1b ) whose sign cannot be determined (in",
;     '" general) and so must be specified by you.",
;     '" Perhaps you can try substituting something like %ceon %b ( %1 :: PI )",
;     '" %d %l or %l %b ( %1 ::  NNI ) %d %ceoff into your expression for",
;     '" %1b ."), [n])

(DEFUN |getArgValueComp| (|arg| |type| |cond|)
  (PROG (|v| |n| |num| |alias|)
    (RETURN
     (PROGN
      (SETQ |v| (|getArgValue| |arg| |type|))
      (COND ((NULL |v|) NIL) ((NULL |cond|) |v|)
            ((OR (AND (CONSP |v|) (EQ (CAR |v|) 'QUOTE)) (|getBasicMode| |v|))
             |v|)
            (#1='T
             (PROGN
              (SETQ |n| (|getUnnameIfCan| |arg|))
              (COND
               ((SETQ |num| (|isSharpVarWithNum| |n|))
                (COND ((NULL |$compilingMap|) (SETQ |n| '|unknownVar|))
                      (#1#
                       (PROGN
                        (SETQ |alias| (|get0| |$mapName| '|alias| |$e|))
                        (SETQ |n| (ELT |alias| (- |num| 1))))))))
              (|msg_comp_failure| 'S2IE0010
               (CONCAT
                "Your expression cannot be fully compiled because it contains an"
                " integer expression (for %1b ) whose sign cannot be determined (in"
                " general) and so must be specified by you."
                " Perhaps you can try substituting something like %ceon %b ( %1 :: PI )"
                " %d %l or %l %b ( %1 ::  NNI ) %d %ceoff into your expression for"
                " %1b .")
               (LIST |n|)))))))))

; evalFormMkValue(op,form,tm) ==
;   val:=
;     u:=
;       $genValue => wrap timedEVALFUN form
;       form
;     objNew(u,tm)
;   if $NRTmonitorIfTrue = true then
;     sayBrightlyNT ['"Value of ",op.0,'" ===> "]
;     pp unwrap u
;   putValue(op,val)
;   [tm]

(DEFUN |evalFormMkValue| (|op| |form| |tm|)
  (PROG (|u| |val|)
    (RETURN
     (PROGN
      (SETQ |val|
              (PROGN
               (SETQ |u|
                       (COND (|$genValue| (|wrap| (|timedEVALFUN| |form|)))
                             ('T |form|)))
               (|objNew| |u| |tm|)))
      (COND
       ((EQUAL |$NRTmonitorIfTrue| T)
        (|sayBrightlyNT| (LIST "Value of " (ELT |op| 0) " ===> "))
        (|pp| (|unwrap| |u|))))
      (|putValue| |op| |val|)
      (LIST |tm|)))))
