
(SDEFUN |JCT;num1| ((% (|PositiveInteger|)))
        (COND
         ((OR
           (SPADCALL (SPADCALL (QREFELT % 11)) (SPADCALL (QREFELT % 12))
                     (QREFELT % 14))
           (SPADCALL (SPADCALL (QREFELT % 11)) (QVSIZE (QREFELT % 8))
                     (QREFELT % 16)))
          (|error| "Number of variables must match"))
         ('T (SPADCALL (QREFELT % 11))))) 

(SDEFUN |JCT;num2| ((% (|PositiveInteger|)))
        (COND
         ((OR
           (SPADCALL (SPADCALL (QREFELT % 17)) (SPADCALL (QREFELT % 18))
                     (QREFELT % 14))
           (SPADCALL (SPADCALL (QREFELT % 17)) (QVSIZE (QREFELT % 9))
                     (QREFELT % 16)))
          (|error| "Number of variables must match"))
         ('T (SPADCALL (QREFELT % 17))))) 

(SDEFUN |JCT;jacobi|
        ((|y| (|Vector| (|JetBundleExpression| JB2)))
         (% (|Matrix| (|JetBundleExpression| JB2))))
        (SPROG
         ((|ly| (|List| (|JetBundleExpression| JB2)))
          (JM (|SparseEchelonMatrix| JB2 (|JetBundleExpression| JB2)))
          (|i| NIL) (#1=#:G19 NIL) (#2=#:G12 NIL)
          (|tmp|
           (|Record| (|:| |DSys| (|List| (|JetBundleExpression| JB2)))
                     (|:| |JVars| (|List| (|List| JB2)))))
          (|res| (|Matrix| (|JetBundleExpression| JB2))))
         (SEQ (LETT |ly| (SPADCALL |y| (QREFELT % 26)))
              (LETT JM (SPADCALL |ly| (QREFELT % 30)))
              (LETT |res|
                    (MAKE_MATRIX1 (QVSIZE |y|) (QREFELT % 19)
                                  (|spadConstant| % 31)))
              (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 19)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |tmp|
                          (SPADCALL |ly|
                                    (PROG1 (LETT #2# |i|)
                                      (|check_subtype2| (> #2# 0)
                                                        '(|PositiveInteger|)
                                                        '(|NonNegativeInteger|)
                                                        #2#))
                                    JM (QREFELT % 33)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res| |i|
                                     (SPADCALL (QCAR |tmp|) (QREFELT % 34))
                                     (QREFELT % 37)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JCT;transform;JB1Jbe;4| ((|jv| (JB1)) (% (|JetBundleExpression| JB2)))
        (SPROG
         ((|ans| (|Union| (|JetBundleExpression| JB2) "failed"))
          (|jt| (|Symbol|)) (|i| (|NonNegativeInteger|)) (#1=#:G30 NIL)
          (|pint| (JB1)) (|qint| (|JetBundleExpression| JB2)) (#2=#:G49 NIL)
          (|k| NIL) (#3=#:G50 NIL) (#4=#:G48 NIL) (#5=#:G41 NIL)
          (|res| (|JetBundleExpression| JB2)))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |jv| (QREFELT % 43)) (QREFELT % 23)
                          (QREFELT % 45)))
          (EXIT
           (COND ((QEQCAR |ans| 0) (QCDR |ans|))
                 (#6='T
                  (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 47)))
                       (COND
                        ((EQUAL |jt| '|Const|)
                         (LETT |res| (|spadConstant| % 48)))
                        ((EQUAL |jt| '|Indep|)
                         (LETT |res|
                               (QAREF1O (QREFELT % 8)
                                        (-
                                         (+ (SPADCALL |jv| (QREFELT % 49))
                                            (SPADCALL (QREFELT % 8)
                                                      (QREFELT % 50)))
                                         1)
                                        1)))
                        ((EQUAL |jt| '|Dep|)
                         (LETT |res|
                               (QAREF1O (QREFELT % 9)
                                        (-
                                         (+ (SPADCALL |jv| (QREFELT % 49))
                                            (SPADCALL (QREFELT % 9)
                                                      (QREFELT % 50)))
                                         1)
                                        1)))
                        (#6#
                         (SEQ (LETT |i| (SPADCALL |jv| (QREFELT % 51)))
                              (LETT |pint|
                                    (SPADCALL |jv|
                                              (PROG1 (LETT #1# |i|)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT % 52)))
                              (LETT |qint| (SPADCALL |pint| (QREFELT % 53)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL (ELT % 54)
                                               (PROGN
                                                (LETT #2#
                                                      (GETREFV
                                                       #7=(QREFELT % 19)))
                                                (SEQ (LETT |k| 1)
                                                     (LETT #3# #7#)
                                                     (LETT #4# 0) G190
                                                     (COND
                                                      ((|greater_SI| |k| #3#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (SETELT #2# #4#
                                                               (SPADCALL
                                                                (QAREF2O
                                                                 (QCAR
                                                                  (QREFELT %
                                                                           41))
                                                                 |i| |k| 1 1)
                                                                (SPADCALL
                                                                 |qint|
                                                                 (PROG1
                                                                     (LETT #5#
                                                                           |k|)
                                                                   (|check_subtype2|
                                                                    (> #5# 0)
                                                                    '(|PositiveInteger|)
                                                                    '(|NonNegativeInteger|)
                                                                    #5#))
                                                                 (QREFELT %
                                                                          55))
                                                                (QREFELT %
                                                                         56)))))
                                                     (LETT #4#
                                                           (PROG1
                                                               (|inc_SI| #4#)
                                                             (LETT |k|
                                                                   (|inc_SI|
                                                                    |k|))))
                                                     (GO G190) G191 (EXIT NIL))
                                                #2#)
                                               (|spadConstant| % 31)
                                               (QREFELT % 58)))))))
                       (EXIT
                        (SPADCALL (QREFELT % 23) (SPADCALL |jv| (QREFELT % 43))
                                  |res| (QREFELT % 59)))))))))) 

(SDEFUN |JCT;transform;JbeJbe;5|
        ((|e1| (|JetBundleExpression| JB1)) (% (|JetBundleExpression| JB2)))
        (SPROG
         ((JV (|List| JB1)) (#1=#:G57 NIL) (#2=#:G58 NIL)
          (JE (|List| (|JetBundleExpression| JB2))) (|je| NIL) (#3=#:G60 NIL)
          (|jv| NIL) (#4=#:G59 NIL) (|e2| (|JetBundleExpression| JB2)))
         (SEQ (LETT JV (SPADCALL |e1| (QREFELT % 62)))
              (LETT JE
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |jv| NIL) (LETT #2# JV) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |jv| (QREFELT % 43))
                                             (QREFELT % 63))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |e2|
                    (SPADCALL (SPADCALL |e1| (QREFELT % 64)) (QREFELT % 63)))
              (SEQ (LETT |je| NIL) (LETT #3# JE) (LETT |jv| NIL) (LETT #4# JV)
                   G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |jv| (CAR #4#)) NIL)
                         (ATOM #3#) (PROGN (LETT |je| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |e2|
                           (SPADCALL |e2|
                                     (SPADCALL |je|
                                               (SPADCALL |jv| (QREFELT % 53))
                                               (QREFELT % 66))
                                     (QREFELT % 68)))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |e2|)))) 

(DECLAIM (NOTINLINE |JetCoordinateTransformation;|)) 

(DEFUN |JetCoordinateTransformation;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|JetCoordinateTransformation| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 70))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|JetCoordinateTransformation|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 19 (|JCT;num1| %))
    (QSETREFV % 20 (|JCT;num2| %))
    (QSETREFV % 23 (SPADCALL (QREFELT % 22)))
    (QSETREFV % 41 (SPADCALL (|JCT;jacobi| |#3| %) (QREFELT % 40)))
    %))) 

(DEFUN |JetCoordinateTransformation| (&REST #1=#:G61)
  (SPROG NIL
         (PROG (#2=#:G62)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache| '|JetCoordinateTransformation|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |JetCoordinateTransformation;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|JetCoordinateTransformation|)))))))))) 

(MAKEPROP '|JetCoordinateTransformation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|)
              (0 . |numIndVar|) (4 . |numIndVar|) (|Boolean|) (8 . ~=)
              (|NonNegativeInteger|) (14 . ~=) (20 . |numDepVar|)
              (24 . |numDepVar|) '|nn| '|mm| (|Table| 42 29)
              (28 . |dictionary|) '|remember| (|List| 29) (|Vector| 29)
              (32 . |entries|) (|SparseEchelonMatrix| 7 %) (|List| %)
              (|JetBundleExpression| 7) (37 . |jacobiMatrix|) (42 . |0|)
              (|Record| (|:| |DSys| 28) (|:| |JVars| (|List| (|List| 7))))
              (46 . |formalDiff2|) (53 . |vector|) (|Integer|) (|Matrix| 29)
              (58 . |setColumn!|) (|Record| (|:| |Inv| 36) (|:| |Pivots| 24))
              (|LUDecomposition| 29) (65 . |LUInverse|) 'DYI (|Expression| 35)
              (70 . |coerce|) (|Union| 29 '"failed") (75 . |search|) (|Symbol|)
              (81 . |type|) (86 . |1|) (90 . |index|) (95 . |minIndex|)
              (100 . |class|) (105 . |integrate|) |JCT;transform;JB1Jbe;4|
              (111 . +) (117 . |formalDiff|) (123 . *) (|Mapping| 29 29 29)
              (129 . |reduce|) (136 . |setelt!|) (|List| 6)
              (|JetBundleExpression| 6) (143 . |jetVariables|) (148 . |coerce|)
              (153 . |coerce|) (|Equation| 29) (158 . =) (|Equation| %)
              (164 . |eval|) |JCT;transform;JbeJbe;5|)
           '#(|transform| 170) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|transform|
                                 ((|JetBundleExpression| |#2|) |#1|))
                                T)
                              '((|transform|
                                 ((|JetBundleExpression| |#2|)
                                  (|JetBundleExpression| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 69
                                            '(0 6 10 11 0 7 10 12 2 10 13 0 0
                                              14 2 15 13 0 0 16 0 6 10 17 0 7
                                              10 18 0 21 0 22 1 25 24 0 26 1 29
                                              27 28 30 0 29 0 31 3 29 32 28 10
                                              27 33 1 25 0 24 34 3 36 0 0 35 25
                                              37 1 39 38 36 40 1 6 42 0 43 2 21
                                              44 42 0 45 1 6 46 0 47 0 29 0 48
                                              1 6 10 0 49 1 25 35 0 50 1 6 15 0
                                              51 2 6 0 0 10 52 2 29 0 0 0 54 2
                                              29 0 0 10 55 2 29 0 0 0 56 3 25
                                              29 57 0 29 58 3 21 29 0 42 29 59
                                              1 61 60 0 62 1 29 0 42 63 1 61 42
                                              0 64 2 65 0 29 29 66 2 29 0 0 67
                                              68 1 0 29 6 53 1 0 29 61 69)))))
           '|lookupComplete|)) 
