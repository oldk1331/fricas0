
(SDEFUN |SOLVESER;unvectorise;VFIF;1|
        ((|vect| (|Vector| (|Expression| R)))
         (|var| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|n| (|Integer|))
         (% (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
        (SPROG
         ((Z (|Symbol|)) (|i| NIL) (#1=#:G11 NIL)
          (|vecti|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (#2=#:G6 NIL)
          (|polyvar|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
         (SEQ (LETT Z (SPADCALL (QREFELT % 8)))
              (LETT |polyvar| (|spadConstant| % 10))
              (SEQ (LETT |i| 1) (LETT #1# (+ |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |vecti|
                          (SPADCALL (SPADCALL |vect| |i| (QREFELT % 17))
                                    (SPADCALL Z (QREFELT % 19))
                                    (QREFELT % 22)))
                    (EXIT
                     (LETT |polyvar|
                           (SPADCALL |polyvar|
                                     (SPADCALL |vecti|
                                               (SPADCALL |var|
                                                         (PROG1
                                                             (LETT #2#
                                                                   (+
                                                                    (- |n| |i|)
                                                                    1))
                                                           (|check_subtype2|
                                                            (>= #2# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #2#))
                                                         (QREFELT % 23))
                                               (QREFELT % 24))
                                     (QREFELT % 25)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |polyvar|)))) 

(SDEFUN |SOLVESER;decomposeFunc;4F;2|
        ((|exprf| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|exprg| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (|newH| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (% (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
        (SPROG
         ((|f1| #1=(|SparseUnivariatePolynomial| (|Expression| R)))
          (|f2| #2=(|SparseUnivariatePolynomial| (|Expression| R))) (|g1| #1#)
          (|g2| #2#) (|degF| #3=(|NonNegativeInteger|)) (|degG| #3#)
          (N (|Union| (|NonNegativeInteger|) "failed")) (|m| (|Integer|))
          (|newF1|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (|newF2|
           (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed"))
          (#4=#:G21 NIL)
          (|newF|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R)))))
         (SEQ
          (EXIT
           (SEQ (LETT |f1| (SPADCALL |exprf| (QREFELT % 28)))
                (LETT |f2| (SPADCALL |exprf| (QREFELT % 29)))
                (LETT |g1| (SPADCALL |exprg| (QREFELT % 28)))
                (LETT |g2| (SPADCALL |exprg| (QREFELT % 29)))
                (LETT |degF|
                      (MAX
                       (SPADCALL (SPADCALL |exprf| (QREFELT % 28))
                                 (QREFELT % 31))
                       (SPADCALL (SPADCALL |exprf| (QREFELT % 29))
                                 (QREFELT % 31))))
                (LETT |degG|
                      (MAX (SPADCALL |g1| (QREFELT % 31))
                           (SPADCALL |g2| (QREFELT % 31))))
                (LETT N (|exquo_INT| |degF| |degG|))
                (EXIT
                 (COND ((QEQCAR N 1) (PROGN (LETT #4# |exprf|) (GO #5=#:G20)))
                       (#6='T
                        (SEQ (LETT |m| (QCDR N))
                             (LETT |newF1|
                                   (|SOLVESER;subsSolve| |f1| |degF| |g1| |g2|
                                    |m| |newH| %))
                             (COND
                              ((SPADCALL |f2| (|spadConstant| % 32)
                                         (QREFELT % 34))
                               (LETT |newF2| (CONS 0 (|spadConstant| % 32))))
                              (#6#
                               (LETT |newF2|
                                     (|SOLVESER;subsSolve| |f2| |degF| |g1|
                                      |g2| |m| |newH| %))))
                             (EXIT
                              (COND
                               ((OR (QEQCAR |newF1| 1) (QEQCAR |newF2| 1))
                                (PROGN (LETT #4# |exprf|) (GO #5#)))
                               ('T
                                (LETT |newF|
                                      (SPADCALL (QCDR |newF1|) (QCDR |newF2|)
                                                (QREFELT % 35))))))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |SOLVESER;subsSolve|
        ((F (|SparseUnivariatePolynomial| (|Expression| R)))
         (|DegF| (|NonNegativeInteger|))
         (G1 (|SparseUnivariatePolynomial| (|Expression| R)))
         (G2 (|SparseUnivariatePolynomial| (|Expression| R))) (M (|Integer|))
         (HH (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
         (%
          (|Union| (|SparseUnivariatePolynomial| (|Expression| R)) "failed")))
        (SPROG
         ((|i| NIL) (#1=#:G91 NIL) (#2=#:G77 NIL)
          (|coeffmat| (|Matrix| (|Expression| R)))
          (|vec| (|Vector| (|Expression| R)))
          (|coeffma| (|Matrix| (|Expression| R)))
          (|solvar|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #3="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (#4=#:G90 NIL) (#5=#:G85 NIL)
          (|solvevarlist| (|Vector| (|Expression| R)))
          (|resul| (|SparseUnivariatePolynomial| (|Expression| R))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |coeffmat|
                  (MAKE_MATRIX1 (+ |DegF| 1) 1 (|spadConstant| % 37)))
            (SEQ (LETT |i| 0) (LETT #1# M) G190
                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |coeffmat|
                         (SPADCALL |coeffmat|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL G1
                                                (PROG1 (LETT #2# (- M |i|))
                                                  (|check_subtype2| (>= #2# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #2#))
                                                (QREFELT % 38))
                                      (SPADCALL G2 |i| (QREFELT % 38))
                                      (QREFELT % 39))
                                     (+ |DegF| 1) (QREFELT % 40))
                                    (QREFELT % 42))
                                   (QREFELT % 43)))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (LETT |vec| (SPADCALL F (+ |DegF| 1) (QREFELT % 40)))
            (LETT |coeffma|
                  (SPADCALL |coeffmat| 1 (+ |DegF| 1) 2 (+ M 2)
                            (QREFELT % 44)))
            (LETT |solvar| (SPADCALL |coeffma| |vec| (QREFELT % 48)))
            (EXIT
             (COND
              ((QEQCAR (QCAR |solvar|) 1)
               (PROGN (LETT #4# (CONS 1 "failed")) (GO #6=#:G89)))
              ('T
               (SEQ
                (LETT |solvevarlist|
                      (PROG2 (LETT #5# (QCAR |solvar|))
                          (QCDR #5#)
                        (|check_union2| (QEQCAR #5# 0)
                                        (|Vector| (|Expression| (QREFELT % 6)))
                                        (|Union|
                                         (|Vector|
                                          (|Expression| (QREFELT % 6)))
                                         #3#)
                                        #5#)))
                (LETT |resul|
                      (SPADCALL (SPADCALL |solvevarlist| HH M (QREFELT % 26))
                                (QREFELT % 28)))
                (EXIT (CONS 0 |resul|))))))))
          #6# (EXIT #4#)))) 

(DECLAIM (NOTINLINE |TransSolvePackageService;|)) 

(DEFUN |TransSolvePackageService;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TransSolvePackageService| DV$1))
          (LETT % (GETREFV 49))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TransSolvePackageService|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |TransSolvePackageService| (#1=#:G92)
  (SPROG NIL
         (PROG (#2=#:G93)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TransSolvePackageService|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|TransSolvePackageService;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TransSolvePackageService|)))))))))) 

(MAKEPROP '|TransSolvePackageService| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|) (0 . |new|)
              (|Fraction| 27) (4 . |0|) (8 . |1|)
              (|SparseUnivariatePolynomial| 6) (12 . |1|) (|Expression| 6)
              (|Integer|) (|Vector| 14) (16 . |elt|) (|Kernel| 14)
              (22 . |kernel|) (|Fraction| (|SparseUnivariatePolynomial| %))
              (|Kernel| %) (27 . |univariate|) (33 . ^) (39 . *) (45 . +)
              |SOLVESER;unvectorise;VFIF;1| (|SparseUnivariatePolynomial| 14)
              (51 . |numer|) (56 . |denom|) (|NonNegativeInteger|)
              (61 . |degree|) (66 . |1|) (|Boolean|) (70 . =) (76 . /)
              |SOLVESER;decomposeFunc;4F;2| (82 . |0|) (86 . ^) (92 . *)
              (98 . |vectorise|) (|Matrix| 14) (104 . |coerce|)
              (109 . |horizConcat|) (115 . |subMatrix|) (|Union| 16 '"failed")
              (|Record| (|:| |particular| 45) (|:| |basis| (|List| 16)))
              (|LinearSystemMatrixPackage| 14 16 16 41) (124 . |solve|))
           '#(|unvectorise| 130 |decomposeFunc| 137) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|decomposeFunc|
                                 ((|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))))
                                T)
                              '((|unvectorise|
                                 ((|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))
                                  (|Vector| (|Expression| |#1|))
                                  (|Fraction|
                                   (|SparseUnivariatePolynomial|
                                    (|Expression| |#1|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 48
                                            '(0 7 0 8 0 9 0 10 0 6 0 11 0 12 0
                                              13 2 16 14 0 15 17 1 18 0 7 19 2
                                              14 20 0 21 22 2 9 0 0 15 23 2 9 0
                                              0 0 24 2 9 0 0 0 25 1 9 27 0 28 1
                                              9 27 0 29 1 27 30 0 31 0 27 0 32
                                              2 27 33 0 0 34 2 9 0 27 27 35 0
                                              14 0 37 2 27 0 0 30 38 2 27 0 0 0
                                              39 2 27 16 0 30 40 1 41 0 16 42 2
                                              41 0 0 0 43 5 41 0 0 15 15 15 15
                                              44 2 47 46 41 16 48 3 0 9 16 9 15
                                              26 3 0 9 9 9 9 36)))))
           '|lookupComplete|)) 
