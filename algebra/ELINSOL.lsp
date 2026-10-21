
(SDEFUN |ELINSOL;lin_coeff|
        ((|x| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|v| (|Kernel| F)) (% (F)))
        (SPROG
         ((|ux|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|d| (|NonNegativeInteger|)))
         (SEQ (LETT |ux| (SPADCALL |x| |v| (QREFELT % 11)))
              (LETT |d| (SPADCALL |ux| (QREFELT % 14)))
              (EXIT
               (COND ((< |d| 1) (|spadConstant| % 17))
                     ((> |d| 1) (|error| "lin_coeff: x is nonlinear"))
                     ('T
                      (SPADCALL (SPADCALL |ux| (QREFELT % 18))
                                (QREFELT % 20)))))))) 

(SDEFUN |ELINSOL;F_to_LF|
        ((|x| (F)) (|vl| (|List| (|Kernel| F))) (% (|List| F)))
        (SPROG
         ((|nx| (|SparseMultivariatePolynomial| R (|Kernel| F))) (#1=#:G26 NIL)
          (#2=#:G27 NIL) (|res0| (|List| F)) (#3=#:G28 NIL) (|c| NIL)
          (#4=#:G30 NIL) (#5=#:G29 NIL)
          (|ml| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|nx1| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nx0| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#6=#:G31 NIL) (|v| NIL) (#7=#:G32 NIL))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT % 21)))
              (LETT |res0|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |v| NIL) (LETT #2# |vl|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (|ELINSOL;lin_coeff| |nx| |v| %)
                                        #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |ml|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |c| NIL) (LETT #4# |res0|) (LETT |v| NIL)
                          (LETT #5# |vl|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL)
                                (ATOM #4#) (PROGN (LETT |c| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (SPADCALL (SPADCALL |c| (QREFELT % 21))
                                             (SPADCALL (|spadConstant| % 22)
                                                       |v| 1 (QREFELT % 23))
                                             (QREFELT % 24))
                                   #3#))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT (NREVERSE #3#)))))
              (LETT |nx1|
                    (SPADCALL (ELT % 26) |ml| (|spadConstant| % 27)
                              (QREFELT % 30)))
              (LETT |nx0| (SPADCALL |nx| |nx1| (QREFELT % 31)))
              (EXIT
               (COND
                ((>
                  (SPADCALL (ELT % 35)
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |v| NIL) (LETT #7# |vl|) G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |v| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (SPADCALL |nx0| |v| (QREFELT % 33))
                                           #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#))))
                            (QREFELT % 38))
                  0)
                 (|error| "x is nonlinear in vl"))
                ('T (CONS (SPADCALL |nx0| (QREFELT % 20)) |res0|))))))) 

(SDEFUN |ELINSOL;lin_sol;LLU;3|
        ((|eql| (|List| F)) (|vl| (|List| (|Symbol|)))
         (% (|Union| (|List| F) "failed")))
        (SPROG
         ((#1=#:G57 NIL) (|c| NIL) (#2=#:G58 NIL)
          (|coefk| (|List| (|Kernel| F))) (#3=#:G59 NIL) (|p| NIL)
          (#4=#:G60 NIL) (|eqll| (|List| (|List| F))) (#5=#:G61 NIL)
          (#6=#:G62 NIL) (|rh| (|Vector| F)) (#7=#:G63 NIL) (|ll| NIL)
          (#8=#:G64 NIL) (|eqm| (|Matrix| F))
          (|ss|
           (|Record| (|:| |particular| (|Union| (|Vector| F) #9="failed"))
                     (|:| |basis| (|List| (|Vector| F)))))
          (#10=#:G50 NIL))
         (SEQ
          (LETT |coefk|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |c| NIL) (LETT #2# |vl|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |c| (QREFELT % 40))
                                         (QREFELT % 42))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |eqll|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |p| NIL) (LETT #4# |eql|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS (|ELINSOL;F_to_LF| |p| |coefk| %) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |rh|
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |ll| NIL) (LETT #6# |eqll|) G190
                        (COND
                         ((OR (ATOM #6#) (PROGN (LETT |ll| (CAR #6#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #5# (CONS (|SPADfirst| |ll|) #5#))))
                        (LETT #6# (CDR #6#)) (GO G190) G191
                        (EXIT (NREVERSE #5#))))
                  (QREFELT % 45))
                 (QREFELT % 46)))
          (LETT |eqm|
                (SPADCALL
                 (PROGN
                  (LETT #7# NIL)
                  (SEQ (LETT |ll| NIL) (LETT #8# |eqll|) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |ll| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #7# (CONS (CDR |ll|) #7#))))
                       (LETT #8# (CDR #8#)) (GO G190) G191
                       (EXIT (NREVERSE #7#))))
                 (QREFELT % 49)))
          (LETT |ss| (SPADCALL |eqm| |rh| (QREFELT % 53)))
          (EXIT
           (COND ((QEQCAR (QCAR |ss|) 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (SPADCALL
                         (PROG2 (LETT #10# (QCAR |ss|))
                             (QCDR #10#)
                           (|check_union2| (QEQCAR #10# 0)
                                           (|Vector| (QREFELT % 7))
                                           (|Union| (|Vector| (QREFELT % 7))
                                                    #9#)
                                           #10#))
                         (QREFELT % 54))))))))) 

(DECLAIM (NOTINLINE |ExpressionLinearSolve;|)) 

(DEFUN |ExpressionLinearSolve;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ExpressionLinearSolve| DV$1 DV$2))
          (LETT % (GETREFV 58))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ExpressionLinearSolve|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ExpressionLinearSolve| (&REST #1=#:G65)
  (SPROG NIL
         (PROG (#2=#:G66)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionLinearSolve|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionLinearSolve;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ExpressionLinearSolve|)))))))))) 

(MAKEPROP '|ExpressionLinearSolve| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| %) (|Kernel| 7)
              (|SparseMultivariatePolynomial| 6 9) (0 . |univariate|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 10)
              (6 . |degree|) (11 . |1|) (15 . |1|) (19 . |0|)
              (23 . |leadingCoefficient|) (|SparseMultivariatePolynomial| 6 41)
              (28 . |coerce|) (33 . |numer|) (38 . |1|) (42 . |monomial|)
              (49 . *) (55 . +) (61 . +) (67 . |0|) (|Mapping| 10 10 10)
              (|List| 10) (71 . |reduce|) (78 . -) (84 . |max|) (90 . |degree|)
              (|Integer|) (96 . |max|) (|Mapping| 34 34 34) (|List| 34)
              (102 . |reduce|) (|Symbol|) (108 . |coerce|) (|Kernel| %)
              (113 . |retract|) (|List| 7) (|Vector| 7) (118 . |vector|)
              (123 . -) (|List| 43) (|Matrix| 7) (128 . |matrix|)
              (|Union| 44 '"failed")
              (|Record| (|:| |particular| 50) (|:| |basis| (|List| 44)))
              (|LinearSystemMatrixPackage1| 7) (133 . |solve|) (139 . |parts|)
              (|Union| 43 '"failed") (|List| 39) |ELINSOL;lin_sol;LLU;3|)
           '#(|lin_sol| 144) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|lin_sol|
                                 ((|Union| (|List| |#2|) "failed")
                                  (|List| |#2|) (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 57
                                            '(2 10 8 0 9 11 1 13 12 0 14 0 6 0
                                              15 0 7 0 16 0 7 0 17 1 13 10 0 18
                                              1 7 0 19 20 1 7 19 0 21 0 10 0 22
                                              3 10 0 0 9 12 23 2 10 0 0 0 24 2
                                              7 0 0 0 25 2 10 0 0 0 26 0 10 0
                                              27 3 29 10 28 0 10 30 2 10 0 0 0
                                              31 2 9 0 0 0 32 2 10 12 0 9 33 2
                                              34 0 0 0 35 2 37 34 36 0 38 1 7 0
                                              39 40 1 7 41 0 42 1 44 0 43 45 1
                                              44 0 0 46 1 48 0 47 49 2 52 51 48
                                              44 53 1 44 43 0 54 2 0 55 43 56
                                              57)))))
           '|lookupComplete|)) 
