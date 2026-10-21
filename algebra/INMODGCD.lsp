
(SDEFUN |INMODGCD;reduction;BPRBP;1| ((|u| (BP)) (|p| (R)) (% (BP)))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| % 10) (QREFELT % 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;1!0| (VECTOR % |p|))
                       |u| (QREFELT % 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;1!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT % 14)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2| ((|u| (BP)) (|p| (R)) (% (BP)))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| % 10) (QREFELT % 13)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|INMODGCD;reduction;BPRBP;2!0| (VECTOR % |p|))
                       |u| (QREFELT % 16)))))) 

(SDEFUN |INMODGCD;reduction;BPRBP;2!0| ((|r1| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |p| (QREFELT % 18)))))) 

(SDEFUN |INMODGCD;modularGcdPrimitive;LBP;3| ((|listf| (|List| BP)) (% (BP)))
        (SPROG ((|f| NIL) (#1=#:G52 NIL) (|g| (BP)))
               (SEQ
                (COND ((NULL |listf|) (|spadConstant| % 11))
                      ('T
                       (SEQ (LETT |g| (|SPADfirst| |listf|))
                            (SEQ (LETT |f| NIL) (LETT #1# (CDR |listf|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |f| (CAR #1#)) NIL)
                                       (NULL
                                        (> (SPADCALL |g| (QREFELT % 23)) 0)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |f| (QREFELT % 21)))
                                     (LETT |g|
                                           (|INMODGCD;modGcdPrimitive| |g| |f|
                                            %))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |g|))))))) 

(SDEFUN |INMODGCD;lincase|
        ((|listdeg| (|List| (|NonNegativeInteger|))) (|listf| (|List| BP))
         (% (BP)))
        (SPROG
         ((|n| (|Integer|)) (|g| (BP)) (|f| NIL) (#1=#:G66 NIL)
          (|f1| (|Union| BP "failed")) (#2=#:G65 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL 1 |listdeg| (QREFELT % 30)))
                (LETT |g| (SPADCALL |listf| |n| (QREFELT % 31)))
                (SEQ (LETT |f| NIL) (LETT #1# |listf|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |f1| (SPADCALL |f| |g| (QREFELT % 33)))
                          (EXIT
                           (COND
                            ((QEQCAR |f1| 1)
                             (PROGN
                              (LETT #2# (|spadConstant| % 27))
                              (GO #3=#:G64))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |g|)))
          #3# (EXIT #2#)))) 

(SDEFUN |INMODGCD;test| ((|f| (BP)) (|g| (BP)) (|d| (BP)) (% (|Boolean|)))
        (SPROG ((|d0| (R)))
               (SEQ (LETT |d0| (SPADCALL |d| 0 (QREFELT % 34)))
                    (EXIT
                     (COND
                      ((OR
                        (QEQCAR
                         (SPADCALL (SPADCALL |f| 0 (QREFELT % 34)) |d0|
                                   (QREFELT % 35))
                         1)
                        (OR
                         (QEQCAR
                          (SPADCALL (SPADCALL |g| 0 (QREFELT % 34)) |d0|
                                    (QREFELT % 35))
                          1)
                         (QEQCAR (SPADCALL |f| |d| (QREFELT % 33)) 1)))
                       NIL)
                      ('T
                       (NULL (QEQCAR (SPADCALL |g| |d| (QREFELT % 33)) 1)))))))) 

(SDEFUN |INMODGCD;modGcdPrimitive| ((|f| (BP)) (|g| (BP)) (% (BP)))
        (SPROG
         ((|df| #1=(|NonNegativeInteger|)) (|dg| #1#) (|lcf| (R)) (|lcg| (R))
          (|lcd| (R)) (|bound| (|NonNegativeInteger|)) (|prime| (R))
          (|fp| (FP)) (|gp| (FP)) (|dgp| (|NonNegativeInteger|)) (|lcdp| (R))
          (|ldp| (FP)) (|dp| (FP)) (|correction| (BP)) (|cont| (R))
          (#2=#:G83 NIL) (|ans| (BP)) (|correctionFactor| (R))
          (|soFarModulus| (R)) (|soFar| (BP)) (|testdeg| #1#) (|result| (BP))
          (#3=#:G101 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT % 23)))
                (LETT |dg| (SPADCALL |g| (QREFELT % 23)))
                (LETT |lcf| (SPADCALL |f| (QREFELT % 36)))
                (LETT |lcg| (SPADCALL |g| (QREFELT % 36)))
                (LETT |lcd| (SPADCALL |lcf| |lcg| (QREFELT % 37)))
                (LETT |prime| (QREFELT % 8))
                (LETT |bound| (|INMODGCD;mbound| |f| |g| %))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |lcd| |prime| (QREFELT % 18))
                                  (QREFELT % 38)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |prime|
                             (SPADCALL |prime| |bound| (QREFELT % 9)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (LETT |soFar|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f| |prime| (QREFELT % 39))
                                 (SPADCALL |g| |prime| (QREFELT % 39))
                                 (QREFELT % 40))
                       (QREFELT % 41)))
                (LETT |testdeg| (SPADCALL |soFar| (QREFELT % 23)))
                (EXIT
                 (COND
                  ((ZEROP |testdeg|)
                   (PROGN (LETT #3# (|spadConstant| % 27)) (GO #4=#:G100)))
                  (#5='T
                   (SEQ
                    (LETT |ldp|
                          (SEQ (LETT |lcdp| (SPADCALL |soFar| (QREFELT % 36)))
                               (EXIT
                                (COND
                                 ((SPADCALL |lcdp| (|spadConstant| % 26)
                                            (QREFELT % 13))
                                  (SPADCALL (SPADCALL |lcd| (QREFELT % 42))
                                            |prime| (QREFELT % 39)))
                                 (#5#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL
                                     (|INMODGCD;modInverse| |lcdp| |prime| %)
                                     |lcd| (QREFELT % 43))
                                    (QREFELT % 42))
                                   |prime| (QREFELT % 39)))))))
                    (LETT |soFar|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ldp| (QREFELT % 41)) |soFar|
                                      (QREFELT % 44))
                            |prime| (QREFELT % 39))
                           (QREFELT % 41)))
                    (LETT |soFarModulus| |prime|)
                    (EXIT
                     (SEQ G190 (COND ((NULL 'T) (GO G191)))
                          (SEQ
                           (LETT |prime|
                                 (SPADCALL |prime| |bound| (QREFELT % 9)))
                           (EXIT
                            (COND
                             ((SPADCALL (SPADCALL |lcd| |prime| (QREFELT % 18))
                                        (|spadConstant| % 10) (QREFELT % 13))
                              "next prime")
                             ('T
                              (SEQ
                               (LETT |fp|
                                     (SPADCALL |f| |prime| (QREFELT % 39)))
                               (LETT |gp|
                                     (SPADCALL |g| |prime| (QREFELT % 39)))
                               (LETT |dp| (SPADCALL |fp| |gp| (QREFELT % 40)))
                               (LETT |dgp| (SPADCALL |dp| (QREFELT % 45)))
                               (COND
                                ((EQL |dgp| 0)
                                 (PROGN
                                  (LETT #3# (|spadConstant| % 27))
                                  (GO #4#))))
                               (COND
                                ((EQL |dgp| |dg|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |f| |g| (QREFELT % 33))
                                            1))
                                   (PROGN (LETT #3# |g|) (GO #4#))))))
                               (COND
                                ((EQL |dgp| |df|)
                                 (COND
                                  ((NULL
                                    (QEQCAR (SPADCALL |g| |f| (QREFELT % 33))
                                            1))
                                   (PROGN (LETT #3# |f|) (GO #4#))))))
                               (EXIT
                                (COND ((> |dgp| |testdeg|) "next prime")
                                      ('T
                                       (SEQ
                                        (LETT |ldp|
                                              (SEQ
                                               (LETT |lcdp|
                                                     (SPADCALL
                                                      (SPADCALL |dp|
                                                                (QREFELT % 41))
                                                      (QREFELT % 36)))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |lcdp|
                                                            (|spadConstant| %
                                                                            26)
                                                            (QREFELT % 13))
                                                  (SPADCALL
                                                   (SPADCALL |lcd|
                                                             (QREFELT % 42))
                                                   |prime| (QREFELT % 39)))
                                                 ('T
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|INMODGCD;modInverse|
                                                      |lcdp| |prime| %)
                                                     |lcd| (QREFELT % 43))
                                                    (QREFELT % 42))
                                                   |prime| (QREFELT % 39)))))))
                                        (LETT |dp|
                                              (SPADCALL |ldp| |dp|
                                                        (QREFELT % 46)))
                                        (EXIT
                                         (COND
                                          ((EQL |dgp| |testdeg|)
                                           (SEQ
                                            (LETT |correction|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |dp|
                                                               (QREFELT % 41))
                                                     |soFar| (QREFELT % 47))
                                                    |prime| (QREFELT % 39))
                                                   (QREFELT % 41)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |correction|
                                                         (QREFELT % 21))
                                               (SEQ
                                                (LETT |ans|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |lcd|
                                                                   (QREFELT %
                                                                            42))
                                                         |soFar|
                                                         (QREFELT % 44))
                                                        |soFarModulus|
                                                        (QREFELT % 39))
                                                       (QREFELT % 41)))
                                                (LETT |cont|
                                                      (SPADCALL |ans|
                                                                (QREFELT %
                                                                         48)))
                                                (LETT |ans|
                                                      (PROG2
                                                          (LETT #2#
                                                                (SPADCALL |ans|
                                                                          |cont|
                                                                          (QREFELT
                                                                           %
                                                                           49)))
                                                          (QCDR #2#)
                                                        (|check_union2|
                                                         (QEQCAR #2# 0)
                                                         (QREFELT % 7)
                                                         (|Union| (QREFELT % 7)
                                                                  "failed")
                                                         #2#)))
                                                (EXIT
                                                 (COND
                                                  ((|INMODGCD;test| |f| |g|
                                                    |ans| %)
                                                   (PROGN
                                                    (LETT #3# |ans|)
                                                    (GO #4#)))
                                                  ('T
                                                   (LETT |soFarModulus|
                                                         (SPADCALL
                                                          |soFarModulus|
                                                          |prime|
                                                          (QREFELT % 43))))))))
                                              ('T
                                               (SEQ
                                                (LETT |correctionFactor|
                                                      (|INMODGCD;modInverse|
                                                       (SPADCALL |soFarModulus|
                                                                 |prime|
                                                                 (QREFELT %
                                                                          18))
                                                       |prime| %))
                                                (LETT |soFar|
                                                      (SPADCALL |soFar|
                                                                (SPADCALL
                                                                 |soFarModulus|
                                                                 (SPADCALL
                                                                  |correctionFactor|
                                                                  |correction|
                                                                  (QREFELT %
                                                                           50))
                                                                 (QREFELT %
                                                                          50))
                                                                (QREFELT %
                                                                         51)))
                                                (LETT |soFarModulus|
                                                      (SPADCALL |soFarModulus|
                                                                |prime|
                                                                (QREFELT %
                                                                         43)))
                                                (EXIT
                                                 (LETT |soFar|
                                                       (SPADCALL
                                                        (SPADCALL |soFar|
                                                                  |soFarModulus|
                                                                  (QREFELT %
                                                                           39))
                                                        (QREFELT % 41))))))))))
                                          ((< |dgp| |testdeg|)
                                           (SEQ (LETT |soFarModulus| |prime|)
                                                (LETT |soFar|
                                                      (SPADCALL |dp|
                                                                (QREFELT %
                                                                         41)))
                                                (EXIT (LETT |testdeg| |dgp|))))
                                          ((NULL (QREFELT % 20))
                                           (COND
                                            ((>
                                              (SPADCALL |prime| (QREFELT % 52))
                                              1)
                                             (SEQ
                                              (LETT |result|
                                                    (SPADCALL |dp|
                                                              (QREFELT % 41)))
                                              (EXIT
                                               (COND
                                                ((|INMODGCD;test| |f| |g|
                                                  |result| %)
                                                 (PROGN
                                                  (LETT #3# |result|)
                                                  (GO #4#))))))))))))))))))))
                          NIL (GO G190) G191 (EXIT NIL)))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |INMODGCD;merge| ((|p| (R)) (|q| (R)) (% (|Union| R "failed")))
        (COND ((SPADCALL |p| |q| (QREFELT % 13)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| % 10) (QREFELT % 13))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| % 10) (QREFELT % 13))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |INMODGCD;modInverse| ((|c| (R)) (|p| (R)) (% (R)))
        (SPROG ((#1=#:G112 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| % 26)
                                    (QREFELT % 55)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT % 6))
                                            (|:| |coef2| (QREFELT % 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT % 6))
                                             (|:| |coef2| (QREFELT % 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |INMODGCD;exactquo|
        ((|u| (BP)) (|v| (BP)) (|p| (R)) (% (|Union| BP "failed")))
        (SPROG
         ((|invlcv| (R))
          (|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP))))
         (SEQ
          (LETT |invlcv|
                (|INMODGCD;modInverse| (SPADCALL |v| (QREFELT % 36)) |p| %))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT % 50)) |p|
                                    (QREFELT % 17))
                          (QREFELT % 57)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT % 17))
                       (|spadConstant| % 11) (QREFELT % 58))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT % 50)) |p|
                             (QREFELT % 17))))))))) 

(SDEFUN |INMODGCD;height| ((|f| (BP)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cc| NIL) (#1=#:G126 NIL) (#2=#:G124 #3=(|NonNegativeInteger|))
          (#4=#:G122 #3#) (#5=#:G123 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |cc| NIL) (LETT #1# (SPADCALL |f| (QREFELT % 60))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |cc| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2# (SPADCALL |cc| (QREFELT % 52)))
                   (COND (#5# (LETT #4# (MAX #4# #2#)))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|IdentityError| '|max|))))))) 

(SDEFUN |INMODGCD;mbound| ((|f| (BP)) (|g| (BP)) (% (|NonNegativeInteger|)))
        (SPROG ((|hf| #1=(|NonNegativeInteger|)) (|hg| #1#))
               (SEQ (LETT |hf| (|INMODGCD;height| |f| %))
                    (LETT |hg| (|INMODGCD;height| |g| %))
                    (EXIT (* 2 (MIN |hf| |hg|)))))) 

(DECLAIM (NOTINLINE |InnerModularGcd;|)) 

(DEFUN |InnerModularGcd;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|InnerModularGcd| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 61))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerModularGcd|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#1| '(|IntegerNumberSystem|))
      (QSETREFV % 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;1|) %)))
     ('T
      (QSETREFV % 17
                (CONS (|dispatchFunction| |INMODGCD;reduction;BPRBP;2|) %))))
    (QSETREFV % 19
              (|EuclideanModularRing| |#1| |#2| |#1| (ELT % 17)
                                      (CONS (|function| |INMODGCD;merge|) %)
                                      (CONS (|function| |INMODGCD;exactquo|)
                                            %)))
    (QSETREFV % 20 (|HasCategory| |#1| '(|CharacteristicZero|)))
    %))) 

(DEFUN |InnerModularGcd| (&REST #1=#:G129)
  (SPROG NIL
         (PROG (#2=#:G130)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache| '|InnerModularGcd|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerModularGcd;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerModularGcd|)))))))))) 

(MAKEPROP '|InnerModularGcd| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (0 . |0|) (4 . |0|) (|Boolean|)
              (8 . =) (14 . |symmetricRemainder|) (|Mapping| 6 6) (20 . |map|)
              (26 . |reduction|) (32 . |rem|) 'FP '|zeroChar| (38 . |zero?|)
              (|NonNegativeInteger|) (43 . |degree|) (|List| 7)
              |INMODGCD;modularGcdPrimitive;LBP;3| (48 . |1|) (52 . |1|)
              (|Integer|) (|List| 22) (56 . |position|) (62 . |elt|)
              (|Union| % '"failed") (68 . |exquo|) (74 . |coefficient|)
              (80 . |exquo|) (86 . |leadingCoefficient|) (91 . |gcd|)
              (97 . |zero?|) (102 . |reduce|) (108 . |gcd|) (114 . |coerce|)
              (119 . |coerce|) (124 . *) (130 . *) (136 . |euclideanSize|)
              (141 . *) (147 . -) (153 . |content|) (158 . |exquo|) (164 . *)
              (170 . +) (176 . |euclideanSize|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 53 '"failed")
              (181 . |extendedEuclidean|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (188 . |monicDivide|) (194 . ~=) (|List| 6)
              (200 . |coefficients|))
           '#(|reduction| 205 |modularGcdPrimitive| 211) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|modularGcdPrimitive| (|#2| (|List| |#2|))) T)
                              '((|reduction| (|#2| |#2| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(0 6 0 10 0 7 0 11 2 6 12 0 0 13 2
                                              6 0 0 0 14 2 7 0 15 0 16 2 0 7 7
                                              6 17 2 6 0 0 0 18 1 7 12 0 21 1 7
                                              22 0 23 0 6 0 26 0 7 0 27 2 29 28
                                              22 0 30 2 24 7 0 28 31 2 7 32 0 0
                                              33 2 7 6 0 22 34 2 6 32 0 0 35 1
                                              7 6 0 36 2 6 0 0 0 37 1 6 12 0 38
                                              2 19 0 7 6 39 2 19 0 0 0 40 1 19
                                              7 0 41 1 7 0 6 42 2 6 0 0 0 43 2
                                              7 0 0 0 44 1 19 22 0 45 2 19 0 0
                                              0 46 2 7 0 0 0 47 1 7 6 0 48 2 7
                                              32 0 6 49 2 7 0 6 0 50 2 7 0 0 0
                                              51 1 6 22 0 52 3 6 54 0 0 0 55 2
                                              7 56 0 0 57 2 7 12 0 0 58 1 7 59
                                              0 60 2 0 7 7 6 17 1 0 7 24
                                              25)))))
           '|lookupComplete|)) 
