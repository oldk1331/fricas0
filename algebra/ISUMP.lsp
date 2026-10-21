
(SDEFUN |ISUMP;pmul|
        ((|c| (P))
         (|p| (|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
         (%
          (|Record| (|:| |num| (|SparseUnivariatePolynomial| P))
                    (|:| |den| (|Integer|)))))
        (SPROG
         ((|rec|
           (|Record|
            (|:| |num|
                 #1=(|SparseUnivariatePolynomial| (|Fraction| (|Integer|))))
            (|:| |den| (|Integer|))))
          (|pn| #1#))
         (SEQ (LETT |pn| (QCAR (LETT |rec| (SPADCALL |p| (QREFELT % 13)))))
              (EXIT
               (CONS
                (SPADCALL (CONS #'|ISUMP;pmul!0| (VECTOR |c| %)) |pn|
                          (QREFELT % 21))
                (QCDR |rec|)))))) 

(SDEFUN |ISUMP;pmul!0| ((|x| NIL) ($$ NIL))
        (PROG (% |c|)
          (LETT % (QREFELT $$ 1))
          (LETT |c| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 16)) |c| (QREFELT % 17)))))) 

(SDEFUN |ISUMP;sum;PVSR;2|
        ((|p| (P)) (|v| (V)) (|s| (|Segment| P))
         (% (|Record| (|:| |num| P) (|:| |den| (|Integer|)))))
        (SPROG ((|indef| (|Record| (|:| |num| P) (|:| |den| (|Integer|)))))
               (SEQ (LETT |indef| (SPADCALL |p| |v| (QREFELT % 23)))
                    (EXIT
                     (CONS
                      (SPADCALL
                       (SPADCALL (QCAR |indef|) |v|
                                 (SPADCALL (|spadConstant| % 25)
                                           (SPADCALL |s| (QREFELT % 27))
                                           (QREFELT % 28))
                                 (QREFELT % 29))
                       (SPADCALL (QCAR |indef|) |v|
                                 (SPADCALL |s| (QREFELT % 30)) (QREFELT % 29))
                       (QREFELT % 31))
                      (QCDR |indef|)))))) 

(SDEFUN |ISUMP;sum;PVR;3|
        ((|p| (P)) (|v| (V))
         (% (|Record| (|:| |num| P) (|:| |den| (|Integer|)))))
        (SPROG
         ((|ud| (|NonNegativeInteger|)) (|uc| (P))
          (|up| (|SparseUnivariatePolynomial| P))
          (|rec|
           (|Record| (|:| |num| (|SparseUnivariatePolynomial| P))
                     (|:| |den| (|Integer|))))
          (|lp| (|List| (|SparseUnivariatePolynomial| P)))
          (|ld| (|List| (|Integer|))) (|d| (|Integer|)) (|pi| NIL)
          (#1=#:G25 NIL) (|di| NIL) (#2=#:G24 NIL) (#3=#:G20 NIL)
          (#4=#:G18 #5=(|SparseUnivariatePolynomial| P)) (#6=#:G16 #5#)
          (#7=#:G17 NIL) (|vp| #5#))
         (SEQ (LETT |up| (SPADCALL |p| |v| (QREFELT % 34))) (LETT |lp| NIL)
              (LETT |ld| NIL)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |up| (|spadConstant| % 37) (QREFELT % 39)))
                     (GO G191)))
                   (SEQ (LETT |ud| (SPADCALL |up| (QREFELT % 41)))
                        (LETT |uc| (SPADCALL |up| (QREFELT % 42)))
                        (LETT |up| (SPADCALL |up| (QREFELT % 43)))
                        (LETT |rec|
                              (|ISUMP;pmul| |uc|
                               (SPADCALL (SPADCALL 1 (+ |ud| 1) (QREFELT % 45))
                                         (SPADCALL (+ |ud| 1) (QREFELT % 47))
                                         (QREFELT % 48))
                               %))
                        (LETT |lp| (CONS (QCAR |rec|) |lp|))
                        (EXIT (LETT |ld| (CONS (QCDR |rec|) |ld|))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |d| (SPADCALL |ld| (QREFELT % 50)))
              (LETT |vp|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |pi| NIL) (LETT #1# |lp|) (LETT |di| NIL)
                          (LETT #2# |ld|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |di| (CAR #2#)) NIL)
                                (ATOM #1#) (PROGN (LETT |pi| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #4#
                                   (SPADCALL
                                    (PROG2 (LETT #3# (|exquo_INT| |d| |di|))
                                        (QCDR #3#)
                                      (|check_union2| (QEQCAR #3# 0)
                                                      (|Integer|)
                                                      (|Union| (|Integer|)
                                                               "failed")
                                                      #3#))
                                    |pi| (QREFELT % 51)))
                             (COND
                              (#7#
                               (LETT #6# (SPADCALL #6# #4# (QREFELT % 52))))
                              ('T (PROGN (LETT #6# #4#) (LETT #7# 'T)))))))
                          (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                          (GO G190) G191 (EXIT NIL))
                     (COND (#7# #6#) ('T (|spadConstant| % 37)))))
              (EXIT (CONS (SPADCALL |vp| |v| (QREFELT % 53)) |d|))))) 

(DECLAIM (NOTINLINE |InnerPolySum;|)) 

(DEFUN |InnerPolySum;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerPolySum| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 54))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerPolySum| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |InnerPolySum| (&REST #1=#:G26)
  (SPROG NIL
         (PROG (#2=#:G27)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerPolySum|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerPolySum;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerPolySum|)))))))))) 

(MAKEPROP '|InnerPolySum| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |num| 11) (|:| |den| 14))
              (|SparseUnivariatePolynomial| 15)
              (|UnivariatePolynomialCommonDenominator| 14 15 11)
              (0 . |splitDenominator|) (|Integer|) (|Fraction| 14)
              (5 . |numer|) (10 . *) (|SparseUnivariatePolynomial| 9)
              (|Mapping| 9 15) (|SparseUnivariatePolynomialFunctions2| 15 9)
              (16 . |map|) (|Record| (|:| |num| 9) (|:| |den| 14))
              |ISUMP;sum;PVR;3| (22 . |1|) (26 . |1|) (|Segment| 9)
              (30 . |high|) (35 . +) (41 . |eval|) (48 . |low|) (53 . -)
              |ISUMP;sum;PVSR;2| (|SparseUnivariatePolynomial| %)
              (59 . |univariate|) (65 . |0|) (69 . |0|) (73 . |0|) (|Boolean|)
              (77 . ~=) (|NonNegativeInteger|) (83 . |degree|)
              (88 . |leadingCoefficient|) (93 . |reductum|) (98 . |1|)
              (102 . /) (|PolynomialNumberTheoryFunctions|) (108 . |bernoulli|)
              (113 . *) (|List| %) (119 . |lcm|) (124 . *) (130 . +)
              (136 . |multivariate|))
           '#(|sum| 142) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|sum|
                                 ((|Record| (|:| |num| |#4|)
                                            (|:| |den| (|Integer|)))
                                  |#4| |#2| (|Segment| |#4|)))
                                T)
                              '((|sum|
                                 ((|Record| (|:| |num| |#4|)
                                            (|:| |den| (|Integer|)))
                                  |#4| |#2|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 53
                                            '(1 12 10 11 13 1 15 14 0 16 2 9 0
                                              14 0 17 2 20 18 19 11 21 0 8 0 24
                                              0 9 0 25 1 26 9 0 27 2 9 0 0 0 28
                                              3 9 0 0 7 0 29 1 26 9 0 30 2 9 0
                                              0 0 31 2 9 33 0 7 34 0 6 0 35 0 8
                                              0 36 0 18 0 37 2 18 38 0 0 39 1
                                              18 40 0 41 1 18 9 0 42 1 18 0 0
                                              43 0 11 0 44 2 15 0 14 14 45 1 46
                                              11 14 47 2 11 0 15 0 48 1 14 0 49
                                              50 2 18 0 14 0 51 2 18 0 0 0 52 2
                                              9 0 33 7 53 3 0 22 9 7 26 32 2 0
                                              22 9 7 23)))))
           '|lookupComplete|)) 
