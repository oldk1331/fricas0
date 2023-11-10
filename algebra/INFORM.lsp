
(PUT '|INFORM;convert;2%;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;2%;1| ((|x| (%)) (% (%))) |x|) 

(SDEFUN |INFORM;Zero;%;2| ((% (%))) (SPADCALL 0 (QREFELT % 9))) 

(SDEFUN |INFORM;One;%;3| ((% (%))) (SPADCALL 1 (QREFELT % 9))) 

(PUT '|INFORM;convert;%Se;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;%Se;4| ((|x| (%)) (% (|SExpression|))) |x|) 

(PUT '|INFORM;convert;Se%;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |INFORM;convert;Se%;5| ((|x| (|SExpression|)) (% (%))) |x|) 

(SDEFUN |INFORM;convert;S%;6| ((|x| (|Symbol|)) (% (%)))
        (SPADCALL |x| (QREFELT % 16))) 

(SDEFUN |INFORM;conv| ((|ll| (|List| %)) (% (%)))
        (SPADCALL |ll| (QREFELT % 19))) 

(SDEFUN |INFORM;lambda;%L%;8| ((|f| (%)) (|l| (|List| (|Symbol|))) (% (%)))
        (|INFORM;conv|
         (LIST (SPADCALL '+-> (QREFELT % 17)) (|INFORM;tuplify| |l| %) |f|) %)) 

(SDEFUN |INFORM;interpret;%A;9| ((|x| (%)) (% (|Any|)))
        (SPROG ((|v| (|None|)))
               (SEQ (LETT |v| (|interpret| |x| NIL))
                    (EXIT
                     (|mkObj| (|unwrap| (|objVal| |v|)) (|objMode| |v|)))))) 

(SDEFUN |INFORM;convert;Df%;10| ((|x| (|DoubleFloat|)) (% (%)))
        (COND ((|zero?_DF| |x|) (|spadConstant| % 10))
              ((|eql_DF| |x| 1.0) (|spadConstant| % 11))
              ('T (SPADCALL |x| (QREFELT % 25))))) 

(SDEFUN |INFORM;flatten;2%;11| ((|s| (%)) (% (%)))
        (SPROG
         ((#1=#:G486 NIL) (|u| NIL) (#2=#:G485 NIL) (#3=#:G484 NIL)
          (#4=#:G483 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
          (|n| (|NonNegativeInteger|)) (#5=#:G482 NIL) (|l| (|List| %))
          (|x| NIL) (#6=#:G481 NIL) (|sy| (|Symbol|)))
         (SEQ
          (COND
           ((OR (SPADCALL |s| (QREFELT % 28))
                (SPADCALL (ELT % 28) (SPADCALL |s| (QREFELT % 29))
                          (QREFELT % 32)))
            |s|)
           ('T
            (SEQ (LETT |sy| (SPADCALL (QREFELT % 33))) (LETT |n| 0)
                 (LETT |l2|
                       (PROGN
                        (LETT #6# NIL)
                        (SEQ (LETT |x| NIL)
                             (LETT #5#
                                   (SPADCALL
                                    (LETT |l| (SPADCALL |s| (QREFELT % 29)))
                                    (QREFELT % 34)))
                             G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS
                                      (|INFORM;flatten0| |x| |sy|
                                       (LETT |n| (+ |n| 1)) %)
                                      #6#))))
                             (LETT #5# (CDR #5#)) (GO G190) G191
                             (EXIT (NREVERSE #6#)))))
                 (EXIT
                  (|INFORM;conv|
                   (SPADCALL (SPADCALL 'SEQ (QREFELT % 17))
                             (SPADCALL
                              (SPADCALL
                               (PROGN
                                (LETT #4# NIL)
                                (SEQ (LETT |u| NIL) (LETT #3# |l2|) G190
                                     (COND
                                      ((OR (ATOM #3#)
                                           (PROGN (LETT |u| (CAR #3#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #4# (CONS (QCAR |u|) #4#))))
                                     (LETT #3# (CDR #3#)) (GO G190) G191
                                     (EXIT (NREVERSE #4#))))
                               (QREFELT % 35))
                              (|INFORM;conv|
                               (LIST (SPADCALL '|exit| (QREFELT % 17))
                                     (|spadConstant| % 11)
                                     (|INFORM;conv|
                                      (SPADCALL (SPADCALL |l| (QREFELT % 36))
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (SEQ (LETT |u| NIL)
                                                      (LETT #1# |l2|) G190
                                                      (COND
                                                       ((OR (ATOM #1#)
                                                            (PROGN
                                                             (LETT |u|
                                                                   (CAR #1#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (LETT #2#
                                                              (CONS (QCDR |u|)
                                                                    #2#))))
                                                      (LETT #1# (CDR #1#))
                                                      (GO G190) G191
                                                      (EXIT (NREVERSE #2#))))
                                                (QREFELT % 37))
                                      %))
                               %)
                              (QREFELT % 38))
                             (QREFELT % 37))
                   %)))))))) 

(SDEFUN |INFORM;flatten0|
        ((|s| (%)) (|sy| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
        (SPROG
         ((#1=#:G502 NIL) (|u| NIL) (#2=#:G501 NIL) (#3=#:G500 NIL)
          (#4=#:G499 NIL)
          (|l2| (|List| (|Record| (|:| |lst| (|List| %)) (|:| |symb| %))))
          (#5=#:G498 NIL) (|l| (|List| %)) (|x| NIL) (#6=#:G497 NIL) (|a| (%)))
         (SEQ
          (COND ((SPADCALL |s| (QREFELT % 28)) (CONS NIL |s|))
                ('T
                 (SEQ
                  (LETT |a|
                        (SPADCALL
                         (SPADCALL
                          (STRCONC (SPADCALL |sy| (QREFELT % 41))
                                   (STRINGIMAGE |n|))
                          (QREFELT % 42))
                         (QREFELT % 17)))
                  (LETT |l2|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #5#
                                    (SPADCALL
                                     (LETT |l| (SPADCALL |s| (QREFELT % 29)))
                                     (QREFELT % 34)))
                              G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |x| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (|INFORM;flatten0| |x| |sy|
                                        (LETT |n| (+ |n| 1)) %)
                                       #6#))))
                              (LETT #5# (CDR #5#)) (GO G190) G191
                              (EXIT (NREVERSE #6#)))))
                  (EXIT
                   (CONS
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #4# NIL)
                       (SEQ (LETT |u| NIL) (LETT #3# |l2|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |u| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #4# (CONS (QCAR |u|) #4#))))
                            (LETT #3# (CDR #3#)) (GO G190) G191
                            (EXIT (NREVERSE #4#))))
                      (QREFELT % 35))
                     (|INFORM;conv|
                      (LIST (SPADCALL 'LET (QREFELT % 17)) |a|
                            (|INFORM;conv|
                             (SPADCALL (SPADCALL |l| (QREFELT % 36))
                                       (PROGN
                                        (LETT #2# NIL)
                                        (SEQ (LETT |u| NIL) (LETT #1# |l2|)
                                             G190
                                             (COND
                                              ((OR (ATOM #1#)
                                                   (PROGN
                                                    (LETT |u| (CAR #1#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #2#
                                                     (CONS (QCDR |u|) #2#))))
                                             (LETT #1# (CDR #1#)) (GO G190)
                                             G191 (EXIT (NREVERSE #2#))))
                                       (QREFELT % 37))
                             %))
                      %)
                     (QREFELT % 38))
                    |a|)))))))) 

(SDEFUN |INFORM;strsym| ((|s| (%)) (% (|String|)))
        (COND ((SPADCALL |s| (QREFELT % 43)) (SPADCALL |s| (QREFELT % 44)))
              ((SPADCALL |s| (QREFELT % 45))
               (SPADCALL (SPADCALL |s| (QREFELT % 46)) (QREFELT % 41)))
              ('T (|error| "strsym: form is neither a string or symbol")))) 

(SDEFUN |INFORM;unparse;%S;14| ((|x| (%)) (% (|String|)))
        (SPROG ((#1=#:G511 NIL) (|a| NIL) (#2=#:G510 NIL) (|s| (%)))
               (SEQ
                (COND
                 ((SPADCALL (LETT |s| (|unparseInputForm| |x|)) (QREFELT % 28))
                  (|INFORM;strsym| |s| %))
                 ('T
                  (SPADCALL
                   (PROGN
                    (LETT #2# NIL)
                    (SEQ (LETT |a| NIL)
                         (LETT #1# (SPADCALL |s| (QREFELT % 29))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT (LETT #2# (CONS (|INFORM;strsym| |a| %) #2#))))
                         (LETT #1# (CDR #1#)) (GO G190) G191
                         (EXIT (NREVERSE #2#))))
                   (QREFELT % 47))))))) 

(PUT '|INFORM;parse;S%;15| '|SPADreplace| '|ncParseFromString|) 

(SDEFUN |INFORM;parse;S%;15| ((|s| (|String|)) (% (%)))
        (|ncParseFromString| |s|)) 

(SDEFUN |INFORM;declare;LS;16| ((|signature| (|List| %)) (% (|Symbol|)))
        (SPROG ((|name| (|Symbol|)))
               (SEQ
                (|declare| (LETT |name| (SPADCALL (QREFELT % 33))) |signature|)
                (EXIT |name|)))) 

(SDEFUN |INFORM;compile;SLS;17|
        ((|name| (|Symbol|)) (|types| (|List| %)) (% (|Symbol|)))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (|selectLocalMms| (|INFORM;mkProperOp| |name| %)
                              (SPADCALL |name| (QREFELT % 17)) |types| NIL)
            (QREFELT % 51))
           (QREFELT % 52))
          (QREFELT % 51))
         (QREFELT % 46))) 

(SDEFUN |INFORM;mkProperOp| ((|name| (|Symbol|)) (% (%)))
        (SPROG ((|op| (%)) (|nme| (%)))
               (SEQ
                (LETT |op|
                      (|mkAtree|
                       (LETT |nme| (SPADCALL |name| (QREFELT % 17)))))
                (|transferPropsToNode| |nme| |op|) (EXIT |op|)))) 

(SDEFUN |INFORM;binary;%L%;19| ((|op| (%)) (|args| (|List| %)) (% (%)))
        (SPROG ((|n| (|NonNegativeInteger|)))
               (SEQ (LETT |n| (SPADCALL |args| (QREFELT % 55)))
                    (EXIT
                     (COND ((< |n| 2) (|error| "Need at least 2 arguments"))
                           ((EQL |n| 2)
                            (SPADCALL
                             (LIST |op| (SPADCALL |args| (QREFELT % 36))
                                   (SPADCALL |args| (QREFELT % 56)))
                             (QREFELT % 57)))
                           ('T
                            (SPADCALL
                             (LIST |op| (SPADCALL |args| (QREFELT % 36))
                                   (SPADCALL |op|
                                             (SPADCALL |args| (QREFELT % 34))
                                             (QREFELT % 58)))
                             (QREFELT % 57)))))))) 

(SDEFUN |INFORM;tuplify| ((|l| (|List| (|Symbol|))) (% (%)))
        (SPROG ((#1=#:G525 NIL) (|x| NIL) (#2=#:G524 NIL))
               (SEQ
                (COND
                 ((NULL (CDR |l|)) (SPADCALL (|SPADfirst| |l|) (QREFELT % 17)))
                 ('T
                  (|INFORM;conv|
                   (SPADCALL (SPADCALL '|Tuple| (QREFELT % 17))
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |x| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |x| (QREFELT % 17))
                                                 #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT % 37))
                   %)))))) 

(SDEFUN |INFORM;function;%LS%;21|
        ((|f| (%)) (|l| (|List| (|Symbol|))) (|name| (|Symbol|)) (% (%)))
        (SPROG ((#1=#:G531 NIL) (|x| NIL) (#2=#:G530 NIL) (|nn| (%)))
               (SEQ
                (LETT |nn|
                      (SPADCALL
                       (SPADCALL (+ 1 (LENGTH |l|))
                                 (SPADCALL NIL (QREFELT % 57)) (QREFELT % 59))
                       (QREFELT % 57)))
                (EXIT
                 (|INFORM;conv|
                  (LIST (SPADCALL 'DEF (QREFELT % 17))
                        (|INFORM;conv|
                         (SPADCALL (SPADCALL |name| (QREFELT % 17))
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |x| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT % 17))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   (QREFELT % 60))
                         %)
                        |nn| |nn| |f|)
                  %))))) 

(SDEFUN |INFORM;+;3%;22| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND ((SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 62)) |s2|)
              ((SPADCALL |s2| (|spadConstant| % 10) (QREFELT % 62)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '+ (QREFELT % 17)) |s1| |s2|)
                %)))) 

(SDEFUN |INFORM;*;3%;23| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 62))
              (SPADCALL |s2| (|spadConstant| % 10) (QREFELT % 62)))
          (|spadConstant| % 10))
         ('T
          (COND ((SPADCALL |s1| (|spadConstant| % 11) (QREFELT % 62)) |s2|)
                ((SPADCALL |s2| (|spadConstant| % 11) (QREFELT % 62)) |s1|)
                ('T
                 (|INFORM;conv| (LIST (SPADCALL '* (QREFELT % 17)) |s1| |s2|)
                  %)))))) 

(SDEFUN |INFORM;^;%I%;24| ((|s1| (%)) (|n| (|Integer|)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |s1| (|spadConstant| % 10) (QREFELT % 62))
           (COND ((> |n| 0) (EXIT (|spadConstant| % 10))))))
         (COND
          ((OR (SPADCALL |s1| (|spadConstant| % 11) (QREFELT % 62))
               (ZEROP |n|))
           (EXIT (|spadConstant| % 11))))
         (EXIT
          (COND ((EQL |n| 1) |s1|)
                ('T
                 (|INFORM;conv|
                  (LIST (SPADCALL '^ (QREFELT % 17)) |s1|
                        (SPADCALL |n| (QREFELT % 9)))
                  %)))))) 

(SDEFUN |INFORM;^;%Nni%;25| ((|s1| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |s1| |n| (QREFELT % 65))) 

(SDEFUN |INFORM;/;3%;26| ((|s1| (%)) (|s2| (%)) (% (%)))
        (COND ((SPADCALL |s2| (|spadConstant| % 11) (QREFELT % 62)) |s1|)
              ('T
               (|INFORM;conv| (LIST (SPADCALL '/ (QREFELT % 17)) |s1| |s2|)
                %)))) 

(DECLAIM (NOTINLINE |InputForm;|)) 

(DEFUN |InputForm| ()
  (SPROG NIL
         (PROG (#1=#:G541)
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

(DEFUN |InputForm;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|InputForm|))
          (LETT % (GETREFV 72))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InputForm| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|SExpression|))
          %))) 

(MAKEPROP '|InputForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SExpression|) '|Rep| |INFORM;convert;2%;1|
              (|Integer|) (0 . |convert|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |INFORM;Zero;%;2|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |INFORM;One;%;3|) %))
              |INFORM;convert;%Se;4| |INFORM;convert;Se%;5| (|InputForm|)
              (|Symbol|) (5 . |convert|) |INFORM;convert;S%;6| (|List| %)
              (10 . |convert|) (|List| 15) |INFORM;lambda;%L%;8| (|Any|)
              |INFORM;interpret;%A;9| (|DoubleFloat|) (15 . |convert|)
              |INFORM;convert;Df%;10| (|Boolean|) (20 . |atom?|)
              (25 . |destruct|) (|Mapping| 27 $$) (|List| $$) (30 . |every?|)
              (36 . |new|) (40 . |rest|) (45 . |concat|) (50 . |first|)
              (55 . |concat|) (61 . |concat|) |INFORM;flatten;2%;11| (|String|)
              (67 . |string|) (72 . |coerce|) (77 . |string?|) (82 . |string|)
              (87 . |symbol?|) (92 . |symbol|) (97 . |concat|)
              |INFORM;unparse;%S;14| |INFORM;parse;S%;15|
              |INFORM;declare;LS;16| (102 . |car|) (107 . |cdr|)
              |INFORM;compile;SLS;17| (|NonNegativeInteger|) (112 . |#|)
              (117 . |last|) (122 . |convert|) |INFORM;binary;%L%;19|
              (127 . |new|) (133 . |cons|) |INFORM;function;%LS%;21| (139 . =)
              |INFORM;+;3%;22| |INFORM;*;3%;23| |INFORM;^;%I%;24|
              |INFORM;^;%Nni%;25| |INFORM;/;3%;26| (|List| 8) (|HashState|)
              (|SingleInteger|) (|OutputForm|))
           '#(|unparse| 145 |symbol?| 150 |symbol| 155 |string?| 160 |string|
              165 |parse| 170 |lambda| 175 |interpret| 181 |function| 186
              |flatten| 193 |destruct| 198 |declare| 203 |convert| 208
              |compile| 243 |cdr| 249 |car| 254 |binary| 259 |atom?| 265 ^ 270
              |Zero| 282 |One| 286 = 290 / 296 + 302 * 308)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |SetCategory&| |Hashable&| NIL NIL |BasicType&| NIL)
                  (CONS
                   '#((|SExpressionCategory| 40 15 8 24) (|SetCategory|)
                      (|Hashable|) (|ConvertibleTo| $$) (|ConvertibleTo| 5)
                      (|BasicType|) (|CoercibleTo| 71))
                   (|makeByteWordVec2| 67
                                       '(1 0 0 8 9 1 15 14 0 16 1 5 0 18 19 1 6
                                         0 24 25 1 0 27 0 28 1 0 18 0 29 2 31
                                         27 30 0 32 0 15 0 33 1 31 0 0 34 1 31
                                         0 18 35 1 31 2 0 36 2 31 0 2 0 37 2 31
                                         0 0 2 38 1 15 40 0 41 1 15 0 40 42 1 0
                                         27 0 43 1 0 40 0 44 1 0 27 0 45 1 0 15
                                         0 46 1 40 0 18 47 1 0 0 0 51 1 0 0 0
                                         52 1 31 54 0 55 1 31 2 0 56 1 0 0 18
                                         57 2 31 0 54 2 59 2 31 0 2 0 60 2 0 27
                                         0 0 62 1 0 40 0 48 1 0 27 0 45 1 0 15
                                         0 46 1 0 27 0 43 1 0 40 0 44 1 0 0 40
                                         49 2 0 0 0 20 21 1 0 22 0 23 3 0 0 0
                                         20 15 61 1 0 0 0 39 1 0 18 0 29 1 0 15
                                         18 50 1 0 0 5 13 1 0 0 0 7 1 0 5 0 12
                                         1 0 0 24 26 1 0 0 15 17 1 0 0 8 9 1 0
                                         0 18 57 2 0 15 15 18 53 1 0 0 0 52 1 0
                                         0 0 51 2 0 0 0 18 58 1 0 27 0 28 2 0 0
                                         0 54 66 2 0 0 0 8 65 0 0 0 10 0 0 0 11
                                         2 0 27 0 0 62 2 0 0 0 0 67 2 0 0 0 0
                                         63 2 0 0 0 0 64)))))
           '|lookupIncomplete|)) 

(MAKEPROP '|InputForm| 'NILADIC T) 
