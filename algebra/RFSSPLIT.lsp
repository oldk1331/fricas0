
(SDEFUN |RFSSPLIT;alg_split_root0;FKIL;1|
        ((|f| (F)) (|r| (|Kernel| F)) (|n| (|Integer|)) (% (|List| F)))
        (SPROG
         ((|ef| (F)) (|f0| (F)) (|f1| (F))
          (|q| (|SparseUnivariatePolynomial| F)) (#1=#:G14 NIL) (|i| NIL)
          (#2=#:G15 NIL))
         (SEQ
          (COND
           ((EQL |n| 2)
            (SEQ
             (LETT |ef|
                   (SPADCALL |f| |r|
                             (SPADCALL (SPADCALL |r| (QREFELT % 9))
                                       (QREFELT % 10))
                             (QREFELT % 11)))
             (LETT |f0|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT % 12))
                             (SPADCALL 2 (QREFELT % 14)) (QREFELT % 15)))
             (LETT |f1|
                   (SPADCALL (SPADCALL |f| |ef| (QREFELT % 16))
                             (SPADCALL 2 (QREFELT % 14)) (QREFELT % 15)))
             (EXIT
              (COND
               ((SPADCALL |r| (SPADCALL |f0| (QREFELT % 18)) (QREFELT % 22))
                (SEQ (SPADCALL (SPADCALL |f0| (QREFELT % 24)) (QREFELT % 26))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 1"))))
               (#3='T
                (SEQ
                 (LETT |f1|
                       (SPADCALL |f1| (SPADCALL |r| (QREFELT % 9))
                                 (QREFELT % 15)))
                 (EXIT
                  (COND
                   ((SPADCALL |r| (SPADCALL |f1| (QREFELT % 18))
                              (QREFELT % 22))
                    (SEQ
                     (SPADCALL (SPADCALL |f1| (QREFELT % 24)) (QREFELT % 26))
                     (EXIT
                      (|error| "alg_split_root0: roots did not cancel 2"))))
                   (#3# (LIST |f0| |f1|))))))))))
           (#3#
            (SEQ
             (LETT |q|
                   (SPADCALL |f| |r| (SPADCALL |r| (QREFELT % 28))
                             (QREFELT % 31)))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1# (CONS (SPADCALL |q| |i| (QREFELT % 35)) #1#))))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                    (EXIT (NREVERSE #1#))))))))))) 

(SDEFUN |RFSSPLIT;alg_split_root2|
        ((|lf| (|List| F)) (|r| (|Kernel| F)) (|n| (|Integer|))
         (% (|List| (|List| F))))
        (SPROG
         ((#1=#:G27 NIL) (|f| NIL) (#2=#:G28 NIL)
          (|nlf0| #3=(|List| (|List| F))) (|pow1| NIL) (#4=#:G29 NIL)
          (|lf1| (|List| F)) (|nlf1| #3#) (|resi| (|List| F))
          (|res| (|List| (|List| F))))
         (SEQ
          (LETT |nlf0|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |lf|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |f| |r| |n| (QREFELT % 37))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |res| NIL)
          (SEQ (LETT |pow1| 0) (LETT #4# (- |n| 1)) G190
               (COND ((|greater_SI| |pow1| #4#) (GO G191)))
               (SEQ (LETT |nlf1| |nlf0|) (LETT |resi| NIL)
                    (SEQ G190 (COND ((NULL (NULL (NULL |nlf1|))) (GO G191)))
                         (SEQ (LETT |lf1| (|SPADfirst| |nlf1|))
                              (LETT |resi| (CONS (|SPADfirst| |lf1|) |resi|))
                              (SPADCALL |nlf1| (CDR |lf1|) (QREFELT % 39))
                              (EXIT (LETT |nlf1| (CDR |nlf1|))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (LETT |resi| (NREVERSE |resi|))
                    (EXIT (LETT |res| (CONS |resi| |res|))))
               (LETT |pow1| (|inc_SI| |pow1|)) (GO G190) G191 (EXIT NIL))
          (EXIT (NREVERSE |res|))))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3|
        ((|lf| (|List| F)) (|r1| (|Kernel| F)) (|r2| (|Kernel| F))
         (%
          (|List|
           (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                     (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|))))))
        (SPROG
         ((|a1| #1=(|List| F)) (|a2| #1#) (|n1| #2=(|Integer|)) (|b1| (F))
          (|n2| #2#) (|b2| (F)) (|ll1| #3=(|List| (|List| F)))
          (|rop| (|BasicOperator|)) (|pow1| NIL) (#4=#:G55 NIL) (|l1| NIL)
          (#5=#:G54 NIL) (#6=#:G53 NIL) (|ll2| #3#) (|g1| #7=(|Integer|))
          (|nn1| (|Integer|)) (|np1| (|Integer|)) (|pow2| NIL) (#8=#:G57 NIL)
          (|l2| NIL) (#9=#:G56 NIL) (#10=#:G52 NIL) (|g2| #7#)
          (|nn2| (|Integer|)) (|np2| (|Integer|)) (|nn| (|Integer|))
          (|bb1| (F)) (#11=#:G35 NIL) (|bb2| (F)) (|nrr| (F)) (#12=#:G58 NIL)
          (|f1| NIL) (#13=#:G59 NIL) (|nl| (|List| F))
          (|res|
           (|List|
            (|Record| (|:| |funs| (|List| F)) (|:| |nroot| F)
                      (|:| |npow1| (|Integer|)) (|:| |npow2| (|Integer|))))))
         (SEQ (LETT |a1| (SPADCALL |r1| (QREFELT % 40)))
              (LETT |a2| (SPADCALL |r2| (QREFELT % 40)))
              (LETT |n1|
                    (SPADCALL (SPADCALL |a1| 2 (QREFELT % 41)) (QREFELT % 42)))
              (LETT |b1| (SPADCALL |a1| 1 (QREFELT % 41)))
              (LETT |n2|
                    (SPADCALL (SPADCALL |a2| 2 (QREFELT % 41)) (QREFELT % 42)))
              (LETT |b2| (SPADCALL |a2| 1 (QREFELT % 41)))
              (LETT |ll1| (|RFSSPLIT;alg_split_root2| |lf| |r1| |n1| %))
              (LETT |res| NIL) (LETT |rop| (SPADCALL |r1| (QREFELT % 44)))
              (SEQ (LETT |pow1| 0) (LETT #4# (- |n1| 1)) (LETT |l1| NIL)
                   (LETT #5# |ll1|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |l1| (CAR #5#)) NIL)
                         (|greater_SI| |pow1| #4#))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (CONS #'|RFSSPLIT;alg_split_roots;L2KL;3!0| %)
                                 |l1| (QREFELT % 49))
                       (PROGN (LETT #6# |$NoValue|) (GO #14=#:G31)))
                      ('T
                       (SEQ
                        (LETT |ll2|
                              (|RFSSPLIT;alg_split_root2| |l1| |r2| |n2| %))
                        (LETT |g1| (GCD |n1| |pow1|))
                        (LETT |nn1|
                              (PROG2 (LETT #11# (|exquo_INT| |n1| |g1|))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 0) (|Integer|)
                                                (|Union| (|Integer|)
                                                         #15="failed")
                                                #11#)))
                        (LETT |np1|
                              (PROG2 (LETT #11# (|exquo_INT| |pow1| |g1|))
                                  (QCDR #11#)
                                (|check_union2| (QEQCAR #11# 0) (|Integer|)
                                                (|Union| (|Integer|) #15#)
                                                #11#)))
                        (EXIT
                         (SEQ (LETT |pow2| 0) (LETT #8# (- |n2| 1))
                              (LETT |l2| NIL) (LETT #9# |ll2|) G190
                              (COND
                               ((OR (ATOM #9#)
                                    (PROGN (LETT |l2| (CAR #9#)) NIL)
                                    (|greater_SI| |pow2| #8#))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (CONS #'|RFSSPLIT;alg_split_roots;L2KL;3!1|
                                         %)
                                   |l2| (QREFELT % 49))
                                  (PROGN
                                   (LETT #10# |$NoValue|)
                                   (GO #16=#:G37)))
                                 ('T
                                  (SEQ (LETT |g2| (GCD |n2| |pow2|))
                                       (LETT |nn2|
                                             (PROG2
                                                 (LETT #11#
                                                       (|exquo_INT| |n2| |g2|))
                                                 (QCDR #11#)
                                               (|check_union2| (QEQCAR #11# 0)
                                                               (|Integer|)
                                                               (|Union|
                                                                (|Integer|)
                                                                #15#)
                                                               #11#)))
                                       (LETT |np2|
                                             (PROG2
                                                 (LETT #11#
                                                       (|exquo_INT| |pow2|
                                                                    |g2|))
                                                 (QCDR #11#)
                                               (|check_union2| (QEQCAR #11# 0)
                                                               (|Integer|)
                                                               (|Union|
                                                                (|Integer|)
                                                                #15#)
                                                               #11#)))
                                       (LETT |nn|
                                             (SPADCALL |nn1| |nn2|
                                                       (QREFELT % 50)))
                                       (LETT |bb1|
                                             (SPADCALL |b1|
                                                       (* |np1|
                                                          (PROG2
                                                              (LETT #11#
                                                                    (|exquo_INT|
                                                                     |nn|
                                                                     |nn1|))
                                                              (QCDR #11#)
                                                            (|check_union2|
                                                             (QEQCAR #11# 0)
                                                             (|Integer|)
                                                             (|Union|
                                                              (|Integer|) #15#)
                                                             #11#)))
                                                       (QREFELT % 51)))
                                       (LETT |bb2|
                                             (SPADCALL |b2|
                                                       (* |np2|
                                                          (PROG2
                                                              (LETT #11#
                                                                    (|exquo_INT|
                                                                     |nn|
                                                                     |nn2|))
                                                              (QCDR #11#)
                                                            (|check_union2|
                                                             (QEQCAR #11# 0)
                                                             (|Integer|)
                                                             (|Union|
                                                              (|Integer|) #15#)
                                                             #11#)))
                                                       (QREFELT % 51)))
                                       (LETT |nrr|
                                             (COND
                                              ((> (+ |pow1| |pow2|) 0)
                                               (SPADCALL |rop|
                                                         (LIST
                                                          (SPADCALL |bb1| |bb2|
                                                                    (QREFELT %
                                                                             52))
                                                          (SPADCALL |nn|
                                                                    (QREFELT %
                                                                             14)))
                                                         (QREFELT % 54)))
                                              ('T (|spadConstant| % 33))))
                                       (LETT |nl|
                                             (PROGN
                                              (LETT #12# NIL)
                                              (SEQ (LETT |f1| NIL)
                                                   (LETT #13# |l2|) G190
                                                   (COND
                                                    ((OR (ATOM #13#)
                                                         (PROGN
                                                          (LETT |f1|
                                                                (CAR #13#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #12#
                                                           (CONS
                                                            (SPADCALL |f1|
                                                                      |nrr|
                                                                      (QREFELT
                                                                       % 52))
                                                            #12#))))
                                                   (LETT #13# (CDR #13#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #12#)))))
                                       (EXIT
                                        (LETT |res|
                                              (CONS
                                               (VECTOR |nl| |nrr| |pow1|
                                                       |pow2|)
                                               |res|)))))))
                               #16# (EXIT #10#))
                              (LETT #9#
                                    (PROG1 (CDR #9#)
                                      (LETT |pow2| (|inc_SI| |pow2|))))
                              (GO G190) G191 (EXIT NIL)))))))
                    #14# (EXIT #6#))
                   (LETT #5# (PROG1 (CDR #5#) (LETT |pow1| (|inc_SI| |pow1|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3!1| ((|f1| NIL) (% NIL))
        (SPADCALL |f1| (|spadConstant| % 46) (QREFELT % 47))) 

(SDEFUN |RFSSPLIT;alg_split_roots;L2KL;3!0| ((|f1| NIL) (% NIL))
        (SPADCALL |f1| (|spadConstant| % 46) (QREFELT % 47))) 

(DECLAIM (NOTINLINE |RootFSSplit;|)) 

(DEFUN |RootFSSplit;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|RootFSSplit| DV$1 DV$2))
          (LETT % (GETREFV 58))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RootFSSplit| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |RootFSSplit| (&REST #1=#:G60)
  (SPROG NIL
         (PROG (#2=#:G61)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|RootFSSplit|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RootFSSplit;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|RootFSSplit|)))))))))) 

(MAKEPROP '|RootFSSplit| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Kernel| %) (0 . |coerce|) (5 . -) (10 . |eval|) (17 . +)
              (|Integer|) (23 . |coerce|) (28 . /) (34 . -) (|List| 8)
              (40 . |kernels|) (|Boolean|) (|Kernel| 7) (|List| 20)
              (45 . |member?|) (|OutputForm|) (51 . |coerce|) (|Void|)
              (56 . |print|) (|SparseUnivariatePolynomial| %) (61 . |minPoly|)
              (|SparseUnivariatePolynomial| 7)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 20) 20
                                                     6
                                                     (|SparseMultivariatePolynomial|
                                                      6 20)
                                                     7)
              (66 . |univariate|) (73 . |1|) (77 . |1|) (|NonNegativeInteger|)
              (81 . |coefficient|) (|List| 7) |RFSSPLIT;alg_split_root0;FKIL;1|
              (|List| 36) (87 . |setfirst!|) (93 . |argument|) (98 . |elt|)
              (104 . |retract|) (|BasicOperator|) (109 . |operator|)
              (114 . |0|) (118 . |0|) (122 . =) (|Mapping| 19 7)
              (128 . |every?|) (134 . |lcm|) (140 . ^) (146 . *) (|List| %)
              (152 . |kernel|)
              (|Record| (|:| |funs| 36) (|:| |nroot| 7) (|:| |npow1| 13)
                        (|:| |npow2| 13))
              (|List| 55) |RFSSPLIT;alg_split_roots;L2KL;3|)
           '#(|alg_split_roots| 158 |alg_split_root0| 165) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|alg_split_roots|
                                 ((|List|
                                   (|Record| (|:| |funs| (|List| |#2|))
                                             (|:| |nroot| |#2|)
                                             (|:| |npow1| (|Integer|))
                                             (|:| |npow2| (|Integer|))))
                                  (|List| |#2|) (|Kernel| |#2|)
                                  (|Kernel| |#2|)))
                                T)
                              '((|alg_split_root0|
                                 ((|List| |#2|) |#2| (|Kernel| |#2|)
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 57
                                            '(1 7 0 8 9 1 7 0 0 10 3 7 0 0 8 0
                                              11 2 7 0 0 0 12 1 7 0 13 14 2 7 0
                                              0 0 15 2 7 0 0 0 16 1 7 17 0 18 2
                                              21 19 20 0 22 1 7 23 0 24 1 23 25
                                              0 26 1 7 27 8 28 3 30 29 7 20 29
                                              31 0 6 0 32 0 7 0 33 2 29 7 0 34
                                              35 2 38 36 0 36 39 1 20 36 0 40 2
                                              36 7 0 13 41 1 7 13 0 42 1 20 43
                                              0 44 0 6 0 45 0 7 0 46 2 7 19 0 0
                                              47 2 36 19 48 0 49 2 13 0 0 0 50
                                              2 7 0 0 13 51 2 7 0 0 0 52 2 7 0
                                              43 53 54 3 0 56 36 20 20 57 3 0
                                              36 7 20 13 37)))))
           '|lookupComplete|)) 
