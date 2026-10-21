
(SDEFUN |CMPLXRT;complexZeros;UPParL;1|
        ((|p| (UP)) (|eps| (|Par|)) (% (|List| (|Complex| |Par|))))
        (SPROG
         ((|x1| #1=(|Symbol|)) (|x2| #1#) (|vv| #1#)
          (|np| (|SparseUnivariatePolynomial| (|Complex| (|Integer|))))
          (|lpf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor|
                           #2=(|SparseUnivariatePolynomial|
                               (|Complex| (|Integer|))))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|pf| NIL) (#3=#:G19 NIL) (|pp| #2#)
          (|q| (|Polynomial| (|Complex| (|Integer|))))
          (|p1| #4=(|Polynomial| (|Integer|))) (|p2| #4#)
          (|lz| (|List| (|List| |Par|))) (#5=#:G20 NIL) (|z| NIL)
          (#6=#:G21 NIL) (|ris| (|List| (|Complex| |Par|))))
         (SEQ (LETT |x1| (SPADCALL (QREFELT % 9)))
              (LETT |x2| (SPADCALL (QREFELT % 9)))
              (LETT |vv| (SPADCALL (QREFELT % 9)))
              (LETT |np| (SPADCALL |p| (QREFELT % 11)))
              (LETT |lpf|
                    (SPADCALL (SPADCALL |np| (QREFELT % 13)) (QREFELT % 18)))
              (LETT |ris| NIL)
              (SEQ (LETT |pf| NIL) (LETT #3# |lpf|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |pf| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |pp| (QVELT |pf| 1))
                        (LETT |q| (SPADCALL |pp| |vv| (QREFELT % 20)))
                        (LETT |q|
                              (SPADCALL |q| |vv|
                                        (SPADCALL
                                         (SPADCALL |x1| (QREFELT % 21))
                                         (SPADCALL
                                          (SPADCALL 0 1 (QREFELT % 27))
                                          (SPADCALL |x2| (QREFELT % 21))
                                          (QREFELT % 28))
                                         (QREFELT % 29))
                                        (QREFELT % 30)))
                        (LETT |p1| (SPADCALL (ELT % 31) |q| (QREFELT % 35)))
                        (LETT |p2| (SPADCALL (ELT % 36) |q| (QREFELT % 35)))
                        (LETT |lz|
                              (SPADCALL (LIST |p1| |p2|) NIL (LIST |x1| |x2|)
                                        |eps| (QREFELT % 41)))
                        (EXIT
                         (LETT |ris|
                               (SPADCALL
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |z| NIL) (LETT #6# |lz|) G190
                                      (COND
                                       ((OR (ATOM #6#)
                                            (PROGN (LETT |z| (CAR #6#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (SPADCALL (|SPADfirst| |z|)
                                                         (SPADCALL |z|
                                                                   (QREFELT %
                                                                            43))
                                                         (QREFELT % 45))
                                               #5#))))
                                      (LETT #6# (CDR #6#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#))))
                                |ris| (QREFELT % 47)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ris|)))) 

(DECLAIM (NOTINLINE |ComplexRootPackage;|)) 

(DEFUN |ComplexRootPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ComplexRootPackage| DV$1 DV$2))
          (LETT % (GETREFV 49))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ComplexRootPackage|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ComplexRootPackage| (&REST #1=#:G22)
  (SPROG NIL
         (PROG (#2=#:G23)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ComplexRootPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ComplexRootPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ComplexRootPackage|)))))))))) 

(MAKEPROP '|ComplexRootPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (|SparseUnivariatePolynomial| 26) (4 . |makeSUP|)
              (|Factored| %) (9 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 14) (|:| |factor| 10)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 15) (|Factored| 10) (14 . |factorList|) (|Polynomial| 26)
              (19 . |multivariate|) (25 . |coerce|) (30 . |0|) (34 . |0|)
              (38 . |1|) (|Integer|) (|Complex| 25) (42 . |complex|) (48 . *)
              (54 . +) (60 . |eval|) (67 . |real|) (|Polynomial| 25)
              (|Mapping| 25 26) (|PolynomialFunctions2| 26 25) (72 . |map|)
              (78 . |imag|) (|List| 42) (|List| 32) (|List| 8)
              (|InnerNumericFloatSolvePackage| 25 7 7) (83 . |innerSolve|)
              (|List| 7) (91 . |second|) (|Complex| 7) (96 . |complex|)
              (|List| 44) (102 . |append|) |CMPLXRT;complexZeros;UPParL;1|)
           '#(|complexZeros| 108) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|complexZeros|
                                 ((|List| (|Complex| |#2|)) |#1| |#2|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 48
                                            '(0 8 0 9 1 6 10 0 11 1 10 12 0 13
                                              1 17 16 0 18 2 19 0 10 8 20 1 19
                                              0 8 21 0 6 0 22 0 7 0 23 0 6 0 24
                                              2 26 0 25 25 27 2 19 0 26 0 28 2
                                              19 0 0 0 29 3 19 0 0 8 0 30 1 26
                                              25 0 31 2 34 32 33 19 35 1 26 25
                                              0 36 4 40 37 38 38 39 7 41 1 42 7
                                              0 43 2 44 0 7 7 45 2 46 0 0 0 47
                                              2 0 46 6 7 48)))))
           '|lookupComplete|)) 
