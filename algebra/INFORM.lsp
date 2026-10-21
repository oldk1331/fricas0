
(MAKEPROP '|INFORM;convert;2%;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;2%;1| ((|x| (%)) (% (%))) |x|) 

(SDEFUN |INFORM;0;%;2| ((% (%))) (SPADCALL 0 (QREFELT % 9))) 

(SDEFUN |INFORM;1;%;3| ((% (%))) (SPADCALL 1 (QREFELT % 9))) 

(MAKEPROP '|INFORM;convert;%Se;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;%Se;4| ((|x| (%)) (% (|SExpression|))) |x|) 

(MAKEPROP '|INFORM;convert;Se%;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;Se%;5| ((|x| (|SExpression|)) (% (%))) |x|) 

(SDEFUN |INFORM;convert;S%;6| ((|x| (|Symbol|)) (% (%)))
        (SPADCALL |x| (QREFELT % 16))) 

(SDEFUN |INFORM;conv| ((|ll| (|List| %)) (% (%)))
        (SPADCALL |ll| (QREFELT % 19))) 

(SDEFUN |INFORM;lambda;%L%;8| ((|f| (%)) (|l| (|List| (|Symbol|))) (% (%)))
        (|INFORM;conv|
         (LIST (SPADCALL '+-> (QREFELT % 17)) (|INFORM;tuplify| |l| %) |f|) %)) 

(SDEFUN |INFORM;unwrap_obj| ((|v| (|None|)) (% (|Any|)))
        (SPADCALL (|objMode| |v|) (|unwrap| (|objVal| |v|)) (QREFELT % 24))) 

(SDEFUN |INFORM;interpret_in_new_env;%A;10| ((|x| (%)) (% (|Any|)))
        (|INFORM;unwrap_obj| (|interpret_in_new_env| |x|) %)) 

(SDEFUN |INFORM;interpret;%A;11| ((|x| (%)) (% (|Any|)))
        (|INFORM;unwrap_obj| (|interpret| |x| (|construct|)) %)) 

(SDEFUN |INFORM;convert;Df%;12| ((|x| (|DoubleFloat|)) (% (%)))
        (COND ((|zero?_DF| |x|) (|spadConstant| % 10))
              ((|eql_DF| |x| 1.0) (|spadConstant| % 11))
              ('T (SPADCALL |x| (QREFELT % 28))))) 

(SDEFUN |INFORM;flatten;2%;13| ((|s| (%)) (% (%)))
        (SPROG
         ((|sy| (|Symbol|)) (#1=#:G36 NIL) (|x| NIL) (|l| (|List| %))
          (#2=#:G37 NIL) (|n| (|NonNegativeInteger|))
          (|l2| (|List| (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
          (#3=#:G38 NIL) (#4=#:G39 NIL) (#5=#:G40 NIL) (|u| NIL)
          (#6=#:G41 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |s| (QREFELT % 31))
                (SPADCALL (ELT % 31) (SPADCALL |s| (QREFELT % 32))
                          (QREFELT % 35)))
            |s|)
           ('T
            (SEQ (LETT |sy| (SPADCALL (QREFELT % 36))) (LETT |n| 0)
                 (LETT |l2|
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |x| NIL)
                             (LETT #2#
                                   (SPADCALL
                                    (LETT |l| (SPADCALL |s| (QREFELT % 32)))
                                    (QREFELT % 37)))
                             G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (|INFORM;flatten0| |x| |sy|
                                       (LETT |n| (+ |n| 1)) %)
                                      #1#))))
                             (LETT #2# (CDR #2#)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))
                 (EXIT
                  (|INFORM;conv|
                   (SPADCALL (SPADCALL 'SEQ (QREFELT % 17))
                             (SPADCALL
                              (SPADCALL
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |u| NIL) (LETT #4# |l2|) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |u| (CAR #4#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #3# (CONS (QCAR |u|) #3#))))
                                     (LETT #4# (CDR #4#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               (QREFELT % 38))
                              (|INFORM;conv|
                               (LIST (SPADCALL '|exit| (QREFELT % 17))
                                     (|spadConstant| % 11)
                                     (|INFORM;conv|
                                      (SPADCALL (SPADCALL |l| (QREFELT % 39))
                                                (PROGN
                                                 (LETT #5# NIL)
                                                 (SEQ (LETT |u| NIL)
                                                      (LETT #6# |l2|) G190
                                                      (COND
                                                       ((OR (ATOM #6#)
                                                            (PROGN
                                                             (LETT |u|
                                                                   (CAR #6#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #5#
                                                              (CONS (QCDR |u|)
                                                                    #5#))))
                                                      (LETT #6# (CDR #6#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #5#))))
                                                (QREFELT % 40))
                                      %))
                               %)
                              (QREFELT % 41))
                             (QREFELT % 40))
                   %)))))))) 

(SDEFUN |INFORM;flatten0|
        ((|s| (%)) (|sy| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
        (SPROG
         ((|a| (%)) (#1=#:G52 NIL) (|x| NIL) (|l| (|List| %)) (#2=#:G53 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
          (#3=#:G54 NIL) (#4=#:G55 NIL) (#5=#:G56 NIL) (|u| NIL)
          (#6=#:G57 NIL))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT % 31)) (CONS NIL |s|))
                ('T
                 (SEQ
                  (LETT |a|
                        (SPADCALL
                         (SPADCALL
                          (STRCONC (SPADCALL |sy| (QREFELT % 44))
                                   (STRINGIMAGE |n|))
                          (QREFELT % 45))
                         (QREFELT % 17)))
                  (LETT |l2|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #2#
                                    (SPADCALL
                                     (LETT |l| (SPADCALL |s| (QREFELT % 32)))
                                     (QREFELT % 37)))
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |x| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (|INFORM;flatten0| |x| |sy|
                                        (LETT |n| (+ |n| 1)) %)
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (EXIT
                   (CONS
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #3# NIL)
                       (SEQ (LETT |u| NIL) (LETT #4# |l2|) G190
                            (COND
                             ((OR (ATOM #4#) (PROGN (LETT |u| (CAR #4#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #3# (CONS (QCAR |u|) #3#))))
                            (LETT #4# (CDR #4#)) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT % 38))
                     (|INFORM;conv|
                      (LIST (SPADCALL 'LET (QREFELT % 17)) |a|
                            (|INFORM;conv|
                             (SPADCALL (SPADCALL |l| (QREFELT % 39))
                                       (PROGN
                                        (LETT #5# NIL)
                                        (SEQ (LETT |u| NIL) (LETT #6# |l2|)
                                             G190
                                             (COND
                                              ((OR (ATOM #6#)
                                                   (PROGN
                                                    (LETT |u| (CAR #6#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #5#
                                                     (CONS (QCDR |u|) #5#))))
                                             (LETT #6# (CDR #6#)) (GO G190)
                                             G191 (EXIT (NREVERSE #5#))))
                                       (QREFELT % 40))
                             %))
                      %)
                     (QREFELT % 41))
                    |a|)))))))) 

(SDEFUN |INFORM;strsym| ((|s| (%)) (% (|String|)))
        (COND ((SPADCALL |s| (QREFELT % 46)) (SPADCALL |s| (QREFELT % 47)))
              ((SPADCALL |s| (QREFELT % 48))
               (SPADCALL (SPADCALL |s| (QREFELT % 49)) (QREFELT % 44)))
              ('T (|error| "strsym: form is neither a string nor symbol")))) 

(SDEFUN |INFORM;unparse;%S;16| ((|x| (%)) (% (|String|)))
        (SPROG ((|s| (%)) (#1=#:G65 NIL) (|a| NIL) (#2=#:G66 NIL))
               (SEQ
                (COND
                 ((SPADCALL (LETT |s| (|unparseInputForm| |x|)) (QREFELT % 31))
                  (|INFORM;strsym| |s| %))
                 ('T
                  (SPADCALL
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |a| NIL)
                         (LETT #2# (SPADCALL |s| (QREFELT % 32))) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT #1# (CONS (|INFORM;strsym| |a| %) #1#))))
                         (LETT #2# (CDR #2#)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))
                   (QREFELT % 50))))))) 

(MAKEPROP '|INFORM;parse;S%;17| '|SPADreplace| '|ncParseFromString|) 

(SDEFUN |INFORM;parse;S%;17| ((|s| (|String|)) (% (%)))
        (|ncParseFromString| |s|)) 

(SDEFUN |INFORM;declare;LS;18| ((|signature| (|List| %)) (% (|Symbol|)))
        (SPROG ((|name| (|Symbol|)))
               (SEQ
                (|declare| (LETT |name| (SPADCALL (QREFELT % 36))) |signature|)
                (EXIT |name|)))) 

(SDEFUN |INFORM;compile;SLS;19|
        ((|name| (|Symbol|)) (|types| (|List| %)) (% (|Symbol|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (|selectLocalMms| (|INFORM;mkProperOp| |name| %)
                              (SPADCALL |name| (QREFELT % 17)) |types| NIL)
            (QREFELT % 54))
           (QREFELT % 55))
          (QREFELT % 54))
         (QREFELT % 49))) 

(SDEFUN |INFORM;mkProperOp| ((|name| (|Symbol|)) (% (%)))
        (SPROG ((|nme| (%)) (|op| (%)))
               (SEQ
                (LETT |op|
                      (|mkAtree|
                       (LETT |nme| (SPADCALL |name| (QREFELT % 17)))))
                (|transferPropsToNode| |nme| |op|) (EXIT |op|)))) 

(SDEFUN |INFORM;binary;%L%;21| ((|op| (%)) (|args| (|List| %)) (% (%)))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL |args| (QREFELT % 58)))
                    (EXIT
                     (COND ((< |n| 2) (|error| "Need at least 2 arguments"))
                           ((EQL |n| 2)
                            (SPADCALL
                             (LIST |op| (SPADCALL |args| (QREFELT % 39))
                                   (SPADCALL |args| (QREFELT % 59)))
                             (QREFELT % 60)))
                           ('T
                            (SPADCALL
                             (LIST |op| (SPADCALL |args| (QREFELT % 39))
                                   (SPADCALL |op|
                                             (SPADCALL |args| (QREFELT % 37))
                                             (QREFELT % 61)))
                             (QREFELT % 60)))))))) 

(SDEFUN |INFORM;tuplify| ((|l| (|List| (|Symbol|))) (% (%)))
        (SPROG ((#1=#:G79 NIL) (|x| NIL) (#2=#:G80 NIL))
               (SEQ
                (COND
                 ((NULL (CDR |l|)) (SPADCALL (|SPADfirst| |l|) (QREFELT % 17)))
                 ('T
                  (|INFORM;conv|
                   (SPADCALL (SPADCALL '|Tuple| (QREFELT % 17))
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |x| NIL) (LETT #2# |l|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |x| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS (SPADCALL |x| (QREFELT % 17))
                                                 #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#))))
                             (QREFELT % 40))
                   %)))))) 

(SDEFUN |INFORM;function;%LS%;23|
        ((|f| (%)) (|l| (|List| (|Symbol|))) (|name| (|Symbol|)) (% (%)))
        (SPROG ((|nn| (%)) (#1=#:G85 NIL) (|x| NIL) (#2=#:G86 NIL))
               (SEQ
                (LETT |nn|
                      (SPADCALL
                       (SPADCALL (+ 1 (LENGTH |l|))
                                 (SPADCALL NIL (QREFELT % 60)) (QREFELT % 62))
                       (QREFELT % 60)))
                (EXIT
                 (|INFORM;conv|
                  (LIST (SPADCALL 'DEF (QREFELT % 17))
                        (|INFORM;conv|
                         (SPADCALL (SPADCALL |name| (QREFELT % 17))
                                   (PROGN
                                    (LETT #1# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #2# |l|) G190
                                         (COND
                                          ((OR (ATOM #2#)
                                               (PROGN
                                                (LETT |x| (CAR #2#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #1#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT % 17))
                                                  #1#))))
                                         (LETT #2# (CDR #2#)) (GO G190) G191
                                         (EXIT (NREVERSE #1#))))
                                   (QREFELT % 63))
                         %)
                        |nn| |nn| |f|)
                  %))))) 

(SDEFUN |INFORM;+;3%;24| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND ((SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 65)) |s2|)
              ((SPADCALL |s2| (|spadConstant| % 10) (QREFELT % 65)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '+ (QREFELT % 17)) |s1| |s2|)
                %)))) 

(SDEFUN |INFORM;*;3%;25| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 65))
              (SPADCALL |s2| (|spadConstant| % 10) (QREFELT % 65)))
          (|spadConstant| % 10))
         ('T
          (COND ((SPADCALL |s1| (|spadConstant| % 11) (QREFELT % 65)) |s2|)
                ((SPADCALL |s2| (|spadConstant| % 11) (QREFELT % 65)) |s1|)
                ('T
                 (|INFORM;conv| (LIST (SPADCALL '* (QREFELT % 17)) |s1| |s2|)
                  %)))))) 

(SDEFUN |INFORM;^;%I%;26| ((|s1| (%)) (|n| (|Integer|)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 65))
           (COND ((> |n| 0) (EXIT (|spadConstant| % 10))))))
         (COND
          ((OR (SPADCALL |s1| (|spadConstant| % 11) (QREFELT % 65))
               (ZEROP |n|))
           (EXIT (|spadConstant| % 11))))
         (EXIT
          (COND ((EQL |n| 1) |s1|)
                ('T
                 (|INFORM;conv|
                  (LIST (SPADCALL '^ (QREFELT % 17)) |s1|
                        (SPADCALL |n| (QREFELT % 9)))
                  %)))))) 

(SDEFUN |INFORM;^;%Nni%;27| ((|s1| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |s1| |n| (QREFELT % 68))) 

(SDEFUN |INFORM;/;3%;28| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND ((SPADCALL |s2| (|spadConstant| % 11) (QREFELT % 65)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '/ (QREFELT % 17)) |s1| |s2|)
                %)))) 

(DECLAIM (NOTINLINE |InputForm;|)) 

(DEFUN |InputForm;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InputForm|))
          (LETT % (GETREFV 75))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InputForm| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|SExpression|))
          %))) 

(DEFUN |InputForm| ()
  (SPROG NIL
         (PROG (#1=#:G96)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|InputForm|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|InputForm|
                             (LIST (CONS NIL (CONS 1 (|InputForm;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|InputForm|)))))))))) 

(MAKEPROP '|InputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SExpression|) '|Rep| |INFORM;convert;2%;1|
              (|Integer|) (0 . |convert|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INFORM;0;%;2|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INFORM;1;%;3|) %))
              |INFORM;convert;%Se;4| |INFORM;convert;Se%;5| (|InputForm|)
              (|Symbol|) (5 . |convert|) |INFORM;convert;S%;6| (|List| %)
              (10 . |convert|) (|List| 15) |INFORM;lambda;%L%;8| (|None|)
              (|Any|) (15 . |any|) |INFORM;interpret_in_new_env;%A;10|
              |INFORM;interpret;%A;11| (|DoubleFloat|) (21 . |convert|)
              |INFORM;convert;Df%;12| (|Boolean|) (26 . |atom?|)
              (31 . |destruct|) (|Mapping| 30 $$) (|List| $$) (36 . |every?|)
              (42 . |new|) (46 . |rest|) (51 . |concat|) (56 . |first|)
              (61 . |concat|) (67 . |concat|) |INFORM;flatten;2%;13| (|String|)
              (73 . |string|) (78 . |coerce|) (83 . |string?|) (88 . |string|)
              (93 . |symbol?|) (98 . |symbol|) (103 . |concat|)
              |INFORM;unparse;%S;16| |INFORM;parse;S%;17|
              |INFORM;declare;LS;18| (108 . |car|) (113 . |cdr|)
              |INFORM;compile;SLS;19| (|NonNegativeInteger|) (118 . |#|)
              (123 . |last|) (128 . |convert|) |INFORM;binary;%L%;21|
              (133 . |new|) (139 . |cons|) |INFORM;function;%LS%;23| (145 . =)
              |INFORM;+;3%;24| |INFORM;*;3%;25| |INFORM;^;%I%;26|
              |INFORM;^;%Nni%;27| |INFORM;/;3%;28| (|OutputForm|)
              (|SingleInteger|) (|HashState|) (|List| 8))
           '#(|unparse| 151 |symbol?| 156 |symbol| 161 |string?| 166 |string|
              171 |parse| 176 |lambda| 181 |interpret_in_new_env| 187
              |interpret| 192 |function| 197 |flatten| 204 |destruct| 209
              |declare| 214 |convert| 219 |compile| 254 |cdr| 260 |car| 265
              |binary| 270 |atom?| 276 ^ 281 = 293 |1| 299 |0| 303 / 307 + 313
              * 319)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |Hashable&| |SetCategory&| NIL |BasicType&| NIL NIL)
                  (CONS
                   '#((|SExpressionCategory| 43 15 8 27) (|Hashable|)
                      (|SetCategory|) (|CoercibleTo| 71) (|BasicType|)
                      (|ConvertibleTo| 5) (|ConvertibleTo| $$))
                   (|makeByteWordVec2| 70
                                       '(1 0 0 8 9 1 15 14 0 16 1 5 0 18 19 2
                                         23 0 5 22 24 1 6 0 27 28 1 0 30 0 31 1
                                         0 18 0 32 2 34 30 33 0 35 0 15 0 36 1
                                         34 0 0 37 1 34 0 18 38 1 34 2 0 39 2
                                         34 0 2 0 40 2 34 0 0 2 41 1 15 43 0 44
                                         1 15 0 43 45 1 0 30 0 46 1 0 43 0 47 1
                                         0 30 0 48 1 0 15 0 49 1 43 0 18 50 1 0
                                         0 0 54 1 0 0 0 55 1 34 57 0 58 1 34 2
                                         0 59 1 0 0 18 60 2 34 0 57 2 62 2 34 0
                                         2 0 63 2 0 30 0 0 65 1 0 43 0 51 1 0
                                         30 0 48 1 0 15 0 49 1 0 30 0 46 1 0 43
                                         0 47 1 0 0 43 52 2 0 0 0 20 21 1 0 23
                                         0 25 1 0 23 0 26 3 0 0 0 20 15 64 1 0
                                         0 0 42 1 0 18 0 32 1 0 15 18 53 1 0 0
                                         18 60 1 0 0 8 9 1 0 0 15 17 1 0 0 27
                                         29 1 0 5 0 12 1 0 0 0 7 1 0 0 5 13 2 0
                                         15 15 18 56 1 0 0 0 55 1 0 0 0 54 2 0
                                         0 0 18 61 1 0 30 0 31 2 0 0 0 8 68 2 0
                                         0 0 57 69 2 0 30 0 0 65 0 0 0 11 0 0 0
                                         10 2 0 0 0 0 70 2 0 0 0 0 66 2 0 0 0 0
                                         67)))))
           '|lookupIncomplete|)) 
