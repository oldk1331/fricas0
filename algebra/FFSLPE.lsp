
(SDEFUN |FFSLPE;solveLinearPolynomialEquation;LFPPU;1|
        ((|lp| (|List| FPP)) (|p| (FPP)) (% (|Union| (|List| FPP) "failed")))
        (SPROG
         ((|u| NIL) (#1=#:G36 NIL) (#2=#:G8 #3=(|NonNegativeInteger|))
          (#4=#:G6 #3#) (#5=#:G7 NIL) (|deg| #3#)
          (|ans| (|Union| (|Vector| (|List| FPP)) #6="failed")) (#7=#:G20 NIL)
          (#8=#:G10 NIL) (|answer| (|Union| (|List| FPP) "failed")))
         (SEQ
          (COND
           ((SPADCALL (QREFELT % 9) |lp| (QREFELT % 18))
            (SEQ
             (LETT |deg|
                   (PROGN
                    (LETT #5# NIL)
                    (SEQ (LETT |u| NIL) (LETT #1# |lp|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #2# (SPADCALL |u| (QREFELT % 19)))
                            (COND (#5# (LETT #4# (+ #4# #2#)))
                                  ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (COND (#5# #4#) ('T 0))))
             (LETT |ans| (CONS 1 "failed"))
             (SETELT % 14
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 10) 1 (QREFELT % 13))
                      (SPADCALL (|spadConstant| % 10) 0 (QREFELT % 13))
                      (QREFELT % 20)))
             (SEQ G190 (COND ((NULL (QEQCAR |ans| 1)) (GO G191)))
                  (SEQ
                   (LETT |ans|
                         (SPADCALL |deg| (QREFELT % 14) |lp| (QREFELT % 23)))
                   (EXIT
                    (COND
                     ((QEQCAR |ans| 1)
                      (SEQ
                       (SETELT % 14
                               (PROG2
                                   (LETT #7#
                                         (SPADCALL (QREFELT % 14)
                                                   (QREFELT % 25)))
                                   (QCDR #7#)
                                 (|check_union2| (QEQCAR #7# 0) (QREFELT % 7)
                                                 (|Union| (QREFELT % 7)
                                                          #9="failed")
                                                 #7#)))
                       (EXIT
                        (SEQ G190
                             (COND
                              ((NULL
                                (COND
                                 ((> (SPADCALL (QREFELT % 14) (QREFELT % 26))
                                     1)
                                  (NULL
                                   (SPADCALL (QREFELT % 14) (QREFELT % 28))))
                                 ('T NIL)))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SETELT % 14
                                       (PROG2
                                           (LETT #7#
                                                 (SPADCALL (QREFELT % 14)
                                                           (QREFELT % 25)))
                                           (QCDR #7#)
                                         (|check_union2| (QEQCAR #7# 0)
                                                         (QREFELT % 7)
                                                         (|Union| (QREFELT % 7)
                                                                  #9#)
                                                         #7#)))))
                             NIL (GO G190) G191 (EXIT NIL))))))))
                  NIL (GO G190) G191 (EXIT NIL))
             (SETELT % 15
                     (PROG2 (LETT #8# |ans|)
                         (QCDR #8#)
                       (|check_union2| (QEQCAR #8# 0)
                                       (|Vector| (|List| (QREFELT % 8)))
                                       (|Union|
                                        (|Vector| (|List| (QREFELT % 8))) #6#)
                                       #8#)))
             (EXIT (SETELT % 9 |lp|)))))
          (LETT |answer|
                (SPADCALL |p| (QREFELT % 14) (QREFELT % 15) (QREFELT % 31)))
          (EXIT |answer|)))) 

(DECLAIM (NOTINLINE |FiniteFieldSolveLinearPolynomialEquation;|)) 

(DEFUN |FiniteFieldSolveLinearPolynomialEquation;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$|
                (LIST '|FiniteFieldSolveLinearPolynomialEquation| DV$1 DV$2
                      DV$3))
          (LETT % (GETREFV 33))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|FiniteFieldSolveLinearPolynomialEquation|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 NIL)
          (QSETREFV % 14 (SPADCALL (|spadConstant| % 10) 1 (QREFELT % 13)))
          (QSETREFV % 15 #())
          %))) 

(DEFUN |FiniteFieldSolveLinearPolynomialEquation| (&REST #1=#:G37)
  (SPROG NIL
         (PROG (#2=#:G38)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldSolveLinearPolynomialEquation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FiniteFieldSolveLinearPolynomialEquation;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldSolveLinearPolynomialEquation|)))))))))) 

(MAKEPROP '|FiniteFieldSolveLinearPolynomialEquation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|oldlp| (0 . |1|) (4 . |1|)
              (|NonNegativeInteger|) (8 . |monomial|) '|slpePrime| '|oldtable|
              (|Boolean|) (|List| 8) (14 . ~=) (20 . |degree|) (25 . +)
              (|Union| 30 '"failed") (|GenExEuclid| 7 8) (31 . |tablePow|)
              (|Union| % '"failed") (38 . |nextItem|) (43 . |degree|)
              (|UnivariateFiniteFieldFactorize| 6 7) (48 . |irreducible?|)
              (|Union| 17 '"failed") (|Vector| 17) (53 . |solveid|)
              |FFSLPE;solveLinearPolynomialEquation;LFPPU;1|)
           '#(|solveLinearPolynomialEquation| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solveLinearPolynomialEquation|
                                 ((|Union| (|List| |#3|) "failed")
                                  (|List| |#3|) |#3|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 32
                                            '(0 6 0 10 0 7 0 11 2 7 0 6 12 13 2
                                              17 16 0 0 18 1 8 12 0 19 2 7 0 0
                                              0 20 3 22 21 12 7 17 23 1 7 24 0
                                              25 1 7 12 0 26 1 27 16 7 28 3 22
                                              29 8 7 30 31 2 0 29 17 8 32)))))
           '|lookupComplete|)) 
