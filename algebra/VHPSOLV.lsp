
(SDEFUN |VHPSOLV;power_action|
        ((|m| (|NonNegativeInteger|))
         (%
          (|Mapping| (|Expression| (|Integer|)) (|NonNegativeInteger|)
                     (|NonNegativeInteger|)
                     (|SparseUnivariatePolynomial|
                      (|Expression| (|Integer|))))))
        (SPROG NIL (CONS #'|VHPSOLV;power_action!0| (VECTOR % |m|)))) 

(SDEFUN |VHPSOLV;power_action!0| ((|k| NIL) (|l| NIL) (|g| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |k| (SPADCALL |m| |l| (QREFELT % 7)) |g|
                      (QREFELT % 11)))))) 

(SDEFUN |VHPSOLV;hp_solve;LLNniM;2|
        ((|lv|
          (|List|
           (|Vector|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
         (|eta| (|List| (|NonNegativeInteger|))) (K (|NonNegativeInteger|))
         (%
          (|Matrix|
           (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))))
        (SPROG
         ((|m| (|NonNegativeInteger|)) (|v| NIL) (#1=#:G35 NIL) (#2=#:G36 NIL)
          (|pp1| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (#3=#:G12 NIL)
          (|pp| (|SparseUnivariatePolynomial| (|Expression| (|Integer|))))
          (|lpp|
           (|List| (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (#4=#:G37 NIL) (|ei| NIL) (#5=#:G38 NIL)
          (|vd| (|Vector| (|Integer|))) (#6=#:G39 NIL) (#7=#:G40 NIL)
          (C (|List| (|Expression| (|Integer|))))
          (|res1|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|n| (|NonNegativeInteger|)) (#8=#:G41 NIL)
          (|n1| #9=(|NonNegativeInteger|))
          (|res|
           (|Matrix|
            (|SparseUnivariatePolynomial| (|Expression| (|Integer|)))))
          (|i| NIL) (#10=#:G42 NIL) (|i1| #9#) (|j| NIL) (#11=#:G43 NIL))
         (SEQ (LETT |m| (QVSIZE (|SPADfirst| |lv|))) (LETT |lpp| NIL)
              (SEQ (LETT |v| NIL) (LETT #1# |lv|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVSIZE |v|) |m| (QREFELT % 13))
                       (|error|
                        "hp_solve: vectors must be of the same length"))
                      ('T
                       (SEQ (LETT |pp| (|spadConstant| % 14))
                            (SEQ (LETT |i| 1) (LETT #2# |m|) G190
                                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                                 (SEQ
                                  (LETT |pp1|
                                        (SPADCALL
                                         (SPADCALL |v| |i| (QREFELT % 17)) |m|
                                         (QREFELT % 18)))
                                  (EXIT
                                   (LETT |pp|
                                         (SPADCALL |pp|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (|spadConstant| % 20)
                                                     (PROG1
                                                         (LETT #3# (- |i| 1))
                                                       (|check_subtype2|
                                                        (>= #3# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #3#))
                                                     (QREFELT % 21))
                                                    |pp1| (QREFELT % 22))
                                                   (QREFELT % 23)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |lpp| (CONS |pp| |lpp|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |lpp| (NREVERSE |lpp|))
              (LETT |vd|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ei| NIL) (LETT #5# |eta|) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |ei| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ (EXIT (LETT #4# (CONS |ei| #4#))))
                           (LETT #5# (CDR #5#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (QREFELT % 26)))
              (LETT C
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |i| 1) (LETT #7# K) G190
                          (COND ((|greater_SI| |i| #7#) (GO G191)))
                          (SEQ
                           (EXIT (LETT #6# (CONS (|spadConstant| % 27) #6#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #6#)))))
              (LETT |res1|
                    (SPADCALL C (|VHPSOLV;power_action| |m| %)
                              (SPADCALL |lpp| (QREFELT % 29)) |vd| K
                              (QREFELT % 33)))
              (LETT |n| (QVSIZE |vd|)) (LETT |n1| 0)
              (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((>= (SPADCALL |vd| |i| (QREFELT % 34)) 0)
                       (LETT |n1| (+ |n1| 1))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (MAKE_MATRIX1 |n| |n1| (|spadConstant| % 14)))
              (LETT |i1| 0)
              (SEQ (LETT |i| 1) (LETT #10# |n|) G190
                   (COND ((|greater_SI| |i| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((>= (SPADCALL |vd| |i| (QREFELT % 34)) 0)
                       (SEQ (LETT |i1| (+ |i1| 1))
                            (EXIT
                             (SEQ (LETT |j| 1) (LETT #11# |n|) G190
                                  (COND ((|greater_SI| |j| #11#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |res| |j| |i1|
                                              (SPADCALL |res1| |j| |i|
                                                        (QREFELT % 35))
                                              (QREFELT % 36))))
                                  (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                  (EXIT NIL))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(DECLAIM (NOTINLINE |VectorHermitePadeSolver;|)) 

(DEFUN |VectorHermitePadeSolver;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|VectorHermitePadeSolver|))
          (LETT % (GETREFV 40))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|VectorHermitePadeSolver| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |VectorHermitePadeSolver| ()
  (SPROG NIL
         (PROG (#1=#:G45)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|VectorHermitePadeSolver|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|VectorHermitePadeSolver|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|VectorHermitePadeSolver;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|VectorHermitePadeSolver|)))))))))) 

(MAKEPROP '|VectorHermitePadeSolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (0 . *)
              (|Expression| 15) (|SparseUnivariatePolynomial| 8)
              (|FractionFreeFastGaussian| 8 9) (6 . |DiffAction|) (|Boolean|)
              (13 . ~=) (19 . |0|) (|Integer|) (|Vector| 9) (23 . |elt|)
              (29 . |multiplyExponents|) (35 . |1|) (39 . |1|)
              (43 . |monomial|) (49 . *) (55 . +) (|List| 15) (|Vector| 15)
              (61 . |vector|) (66 . |0|) (|List| 9) (70 . |vector|)
              (|Matrix| 9) (|List| 8) (|Mapping| 8 6 6 9)
              (75 . |generalInterpolation|) (84 . |elt|) (90 . |elt|)
              (97 . |setelt!|) (|List| 16) (|List| 6)
              |VHPSOLV;hp_solve;LLNniM;2|)
           '#(|hp_solve| 105) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|hp_solve|
                                 ((|Matrix|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| (|Integer|))))
                                  (|List|
                                   (|Vector|
                                    (|SparseUnivariatePolynomial|
                                     (|Expression| (|Integer|)))))
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 39
                                            '(2 6 0 6 0 7 3 10 8 6 6 9 11 2 6
                                              12 0 0 13 0 9 0 14 2 16 9 0 15 17
                                              2 9 0 0 6 18 0 9 0 19 0 8 0 20 2
                                              9 0 8 6 21 2 9 0 0 0 22 2 9 0 0 0
                                              23 1 25 0 24 26 0 8 0 27 1 16 0
                                              28 29 5 10 30 31 32 16 25 6 33 2
                                              25 15 0 15 34 3 30 9 0 15 15 35 4
                                              30 9 0 15 15 9 36 3 0 30 37 38 6
                                              39)))))
           '|lookupComplete|)) 
