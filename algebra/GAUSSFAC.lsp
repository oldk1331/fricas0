
(SDEFUN |GAUSSFAC;reduction|
        ((|u| (|Integer|)) (|p| (|Integer|)) (% (|Integer|)))
        (COND ((EQL |p| 0) |u|) ('T (SPADCALL |u| |p| (QREFELT % 7))))) 

(SDEFUN |GAUSSFAC;merge|
        ((|p| (|Integer|)) (|q| (|Integer|))
         (% (|Union| (|Integer|) "failed")))
        (COND ((EQL |p| |q|) (CONS 0 |p|)) ((EQL |p| 0) (CONS 0 |q|))
              ((EQL |q| 0) (CONS 0 |p|)) ('T (CONS 1 "failed")))) 

(SDEFUN |GAUSSFAC;exactquo|
        ((|u| (|Integer|)) (|v| (|Integer|)) (|p| (|Integer|))
         (% (|Union| (|Integer|) "failed")))
        (SPROG ((#1=#:G21 NIL))
               (COND ((EQL |p| 0) (|exquo_INT| |u| |v|))
                     ((EQL (REM |v| |p|) 0) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL
                             (QCAR
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |v| |p| |u| (QREFELT % 10)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|Record|
                                                 (|:| |coef1| (|Integer|))
                                                 (|:| |coef2| (|Integer|)))
                                                (|Union|
                                                 (|Record|
                                                  (|:| |coef1| (|Integer|))
                                                  (|:| |coef2| (|Integer|)))
                                                 "failed")
                                                #1#)))
                             |p| (QREFELT % 7))))))) 

(SDEFUN |GAUSSFAC;findelt| ((|q| (|Integer|)) (% (|Integer|)))
        (SPROG
         ((|q1| #1=(|Integer|)) (#2=#:G12 NIL) (|r| #1#)
          (|r1| (|Union| (|Integer|) "failed")) (|qq1| (|FMod|)) (|i| NIL)
          (#3=#:G43 NIL) (|s| (|FMod|)) (|t| (|FMod|)))
         (SEQ (LETT |q1| (- |q| 1)) (LETT |r| |q1|)
              (LETT |r1| (|exquo_INT| |r| 4))
              (SEQ G190 (COND ((NULL (NULL (QEQCAR |r1| 1))) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (PROG2 (LETT #2# |r1|)
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #2#)))
                    (EXIT (LETT |r1| (|exquo_INT| |r| 2))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL 1 |q| (QREFELT % 16)))
              (LETT |qq1| (SPADCALL |q1| |q| (QREFELT % 16)))
              (SEQ (LETT |i| 2) G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |s| (|spadConstant| % 12) (QREFELT % 18)) 'T)
                       ('T (SPADCALL |s| |qq1| (QREFELT % 18)))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |i| |q| (QREFELT % 16))
                                     (PROG1 (LETT #3# |r|)
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (QREFELT % 20)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |t| |s|)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |t| |qq1| (QREFELT % 21))) (GO G191)))
                   (SEQ (LETT |s| |t|)
                        (EXIT (LETT |t| (SPADCALL |t| 2 (QREFELT % 23)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT % 24)))))) 

(SDEFUN |GAUSSFAC;sumsq1| ((|p| #1=(|Integer|)) (% (|List| (|Integer|))))
        (SPROG ((|w| (|Integer|)) (|u| #1#) (|s| (|Integer|)))
               (SEQ (LETT |s| (|GAUSSFAC;findelt| |p| %)) (LETT |u| |p|)
                    (SEQ G190 (COND ((NULL (> (EXPT |u| 2) |p|)) (GO G191)))
                         (SEQ (LETT |w| (REM |u| |s|)) (LETT |u| |s|)
                              (EXIT (LETT |s| |w|)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (LIST |u| |s|))))) 

(SDEFUN |GAUSSFAC;intfactor|
        ((|n| (|Integer|)) (% (|Factored| (|Complex| (|Integer|)))))
        (SPROG
         ((|lfn| (|Factored| (|Integer|))) (|term| NIL) (#1=#:G79 NIL)
          (|exp| (|NonNegativeInteger|)) (|unity| #2=(|Complex| (|Integer|)))
          (|sz| (|List| (|Integer|))) (|z| #2#)
          (|r|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Complex| (|Integer|)))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |lfn| (SPADCALL |n| (QREFELT % 27))) (LETT |r| NIL)
              (LETT |unity|
                    (SPADCALL (SPADCALL |lfn| (QREFELT % 28)) 0
                              (QREFELT % 14)))
              (SEQ (LETT |term| NIL) (LETT #1# (SPADCALL |lfn| (QREFELT % 32)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (QVELT |term| 1))
                        (LETT |exp| (QVELT |term| 2))
                        (EXIT
                         (COND
                          ((EQL |n| 2)
                           (SEQ
                            (LETT |r|
                                  (CONS
                                   (VECTOR (CONS 3 "prime") (QREFELT % 15)
                                           (* 2 |exp|))
                                   |r|))
                            (EXIT
                             (LETT |unity|
                                   (SPADCALL |unity|
                                             (SPADCALL
                                              (SPADCALL 0 -1 (QREFELT % 14))
                                              (REM |exp| 4) (QREFELT % 33))
                                             (QREFELT % 34))))))
                          ((EQL (REM |n| 4) 3)
                           (LETT |r|
                                 (CONS
                                  (VECTOR (CONS 3 "prime")
                                          (SPADCALL |n| 0 (QREFELT % 14))
                                          |exp|)
                                  |r|)))
                          ('T
                           (SEQ (LETT |sz| (|GAUSSFAC;sumsq1| |n| %))
                                (LETT |z|
                                      (SPADCALL
                                       (SPADCALL |sz| 1 (QREFELT % 36))
                                       (SPADCALL |sz| 2 (QREFELT % 36))
                                       (QREFELT % 14)))
                                (EXIT
                                 (LETT |r|
                                       (CONS
                                        (VECTOR (CONS 3 "prime") |z| |exp|)
                                        (CONS
                                         (VECTOR (CONS 3 "prime")
                                                 (SPADCALL |z| (QREFELT % 37))
                                                 |exp|)
                                         |r|)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |unity| |r| (QREFELT % 41)))))) 

(SDEFUN |GAUSSFAC;factor;CF;7|
        ((|m| (|Complex| (|Integer|)))
         (% (|Factored| (|Complex| (|Integer|)))))
        (SPROG
         ((|ris| #1=(|Factored| (|Complex| (|Integer|)))) (|d| (|Integer|))
          (|a| (|Integer|)) (#2=#:G12 NIL) (|b| (|Integer|)) (|r| #1#)
          (|factn|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #3="nil" #4="sqfr" #5="irred" #6="prime"))
             (|:| |factor| (|Integer|))
             (|:| |exponent| #7=(|NonNegativeInteger|)))))
          (|term| NIL) (#8=#:G101 NIL) (|n| (|Integer|)) (|exp| #7#)
          (|g0| (|Complex| (|Integer|)))
          (|part|
           (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#))
                     (|:| |factor| (|Complex| (|Integer|)))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|z| (|Complex| (|Integer|)))
          (|result|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|Complex| (|Integer|)))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|unity| (|Complex| (|Integer|))))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 43) (QREFELT % 44))
            (SPADCALL (|spadConstant| % 43) 1 (QREFELT % 45)))
           (#9='T
            (SEQ (LETT |a| (SPADCALL |m| (QREFELT % 46)))
                 (LETT |b| (SPADCALL |m| (QREFELT % 47)))
                 (EXIT
                  (COND ((EQL |b| 0) (|GAUSSFAC;intfactor| |a| %))
                        ((EQL |a| 0)
                         (SEQ (LETT |ris| (|GAUSSFAC;intfactor| |b| %))
                              (LETT |unity|
                                    (SPADCALL (SPADCALL |ris| (QREFELT % 48))
                                              (SPADCALL 0 1 (QREFELT % 14))
                                              (QREFELT % 34)))
                              (EXIT
                               (SPADCALL |unity|
                                         (SPADCALL |ris| (QREFELT % 49))
                                         (QREFELT % 41)))))
                        (#9#
                         (SEQ (LETT |d| (GCD |a| |b|)) (LETT |result| NIL)
                              (LETT |unity| (|spadConstant| % 50))
                              (COND
                               ((SPADCALL |d| 1 (QREFELT % 51))
                                (SEQ
                                 (LETT |a|
                                       (PROG2 (LETT #2# (|exquo_INT| |a| |d|))
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #10="failed")
                                                         #2#)))
                                 (LETT |b|
                                       (PROG2 (LETT #2# (|exquo_INT| |b| |d|))
                                           (QCDR #2#)
                                         (|check_union2| (QEQCAR #2# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #10#)
                                                         #2#)))
                                 (LETT |r| (|GAUSSFAC;intfactor| |d| %))
                                 (LETT |result| (SPADCALL |r| (QREFELT % 49)))
                                 (LETT |unity| (SPADCALL |r| (QREFELT % 48)))
                                 (EXIT
                                  (LETT |m|
                                        (SPADCALL |a| |b| (QREFELT % 14)))))))
                              (LETT |n| (+ (EXPT |a| 2) (EXPT |b| 2)))
                              (LETT |factn|
                                    (SPADCALL (SPADCALL |n| (QREFELT % 27))
                                              (QREFELT % 32)))
                              (LETT |part|
                                    (VECTOR (CONS 3 "prime")
                                            (|spadConstant| % 43) 0))
                              (SEQ (LETT |term| NIL) (LETT #8# |factn|) G190
                                   (COND
                                    ((OR (ATOM #8#)
                                         (PROGN (LETT |term| (CAR #8#)) NIL))
                                     (GO G191)))
                                   (SEQ (LETT |n| (QVELT |term| 1))
                                        (LETT |exp| (QVELT |term| 2))
                                        (EXIT
                                         (COND
                                          ((EQL |n| 2)
                                           (SEQ
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime")
                                                          (QREFELT % 15)
                                                          |exp|))
                                            (LETT |m|
                                                  (SPADCALL |m|
                                                            (SPADCALL
                                                             (QREFELT % 15)
                                                             |exp|
                                                             (QREFELT % 33))
                                                            (QREFELT % 52)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part| |result|)))))
                                          ((EQL (REM |n| 4) 3)
                                           (SEQ
                                            (LETT |g0|
                                                  (SPADCALL |n| 0
                                                            (QREFELT % 14)))
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime") |g0|
                                                          (|quotient_INT| |exp|
                                                                          2)))
                                            (LETT |m|
                                                  (SPADCALL |m| |g0|
                                                            (QREFELT % 52)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part| |result|)))))
                                          ('T
                                           (SEQ
                                            (LETT |z|
                                                  (SPADCALL |m|
                                                            (SPADCALL |n| 0
                                                                      (QREFELT
                                                                       % 14))
                                                            (QREFELT % 53)))
                                            (LETT |part|
                                                  (VECTOR (CONS 3 "prime") |z|
                                                          |exp|))
                                            (LETT |z|
                                                  (SPADCALL |z| |exp|
                                                            (QREFELT % 33)))
                                            (LETT |m|
                                                  (SPADCALL |m| |z|
                                                            (QREFELT % 52)))
                                            (EXIT
                                             (LETT |result|
                                                   (CONS |part|
                                                         |result|))))))))
                                   (LETT #8# (CDR #8#)) (GO G190) G191
                                   (EXIT NIL))
                              (COND
                               ((SPADCALL |m| (|spadConstant| % 50)
                                          (QREFELT % 54))
                                (LETT |unity|
                                      (SPADCALL |unity| |m| (QREFELT % 34)))))
                              (EXIT
                               (SPADCALL |unity| |result|
                                         (QREFELT % 41))))))))))))) 

(SDEFUN |GAUSSFAC;sumSquares;IL;8| ((|p| (|Integer|)) (% (|List| (|Integer|))))
        (COND ((EQL |p| 2) (LIST 1 1))
              ((SPADCALL (REM |p| 4) 1 (QREFELT % 51))
               (|error| "no solutions"))
              ('T (|GAUSSFAC;sumsq1| |p| %)))) 

(SDEFUN |GAUSSFAC;prime?;CB;9| ((|a| (|Complex| (|Integer|))) (% (|Boolean|)))
        (SPROG
         ((|n| (|Integer|)) (|re| (|Integer|)) (|im| (|Integer|))
          (|p| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL |a| (QREFELT % 57)))
              (EXIT
               (COND ((OR (EQL |n| 0) (EQL |n| 1)) NIL)
                     ((SPADCALL |n| (QREFELT % 59)) 'T)
                     (#1='T
                      (SEQ (LETT |re| (SPADCALL |a| (QREFELT % 46)))
                           (LETT |im| (SPADCALL |a| (QREFELT % 47)))
                           (COND
                            ((SPADCALL |re| 0 (QREFELT % 51))
                             (COND
                              ((SPADCALL |im| 0 (QREFELT % 51)) (EXIT NIL)))))
                           (LETT |p| (ABS (+ |re| |im|)))
                           (EXIT
                            (COND ((SPADCALL (REM |p| 4) 3 (QREFELT % 51)) NIL)
                                  (#1# (SPADCALL |p| (QREFELT % 59)))))))))))) 

(DECLAIM (NOTINLINE |GaussianFactorizationPackage;|)) 

(DEFUN |GaussianFactorizationPackage;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GaussianFactorizationPackage|))
          (LETT % (GETREFV 61))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GaussianFactorizationPackage| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 11
                    (|ModularRing| (|Integer|) (|Integer|)
                                   (CONS (|function| |GAUSSFAC;reduction|) %)
                                   (CONS (|function| |GAUSSFAC;merge|) %)
                                   (CONS (|function| |GAUSSFAC;exactquo|) %)))
          (QSETREFV % 15 (SPADCALL 1 1 (QREFELT % 14)))
          %))) 

(DEFUN |GaussianFactorizationPackage| ()
  (SPROG NIL
         (PROG (#1=#:G111)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|GaussianFactorizationPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|GaussianFactorizationPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|GaussianFactorizationPackage;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|GaussianFactorizationPackage|)))))))))) 

(MAKEPROP '|GaussianFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (0 . |positiveRemainder|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 8 '"failed")
              (6 . |extendedEuclidean|) '|FMod| (13 . |1|) (|Complex| 6)
              (17 . |complex|) '|fact2| (23 . |reduce|) (|Boolean|) (29 . =)
              (|NonNegativeInteger|) (35 . ^) (41 . ~=) (|PositiveInteger|)
              (47 . ^) (53 . |coerce|) (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (58 . |factor|) (63 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 29) (|:| |factor| 6) (|:| |exponent| 19))
              (|List| 30) (68 . |factorList|) (73 . ^) (79 . *) (|List| 6)
              (85 . |elt|) (91 . |conjugate|)
              (|Record| (|:| |flag| 29) (|:| |factor| 13) (|:| |exponent| 19))
              (|List| 38) (|Factored| 13) (96 . |makeFR|) (102 . |0|)
              (106 . |0|) (110 . =) (116 . |primeFactor|) (122 . |real|)
              (127 . |imag|) (132 . |unit|) (137 . |factorList|) (142 . |1|)
              (146 . ~=) (152 . |quo|) (158 . |gcd|) (164 . ~=)
              |GAUSSFAC;factor;CF;7| |GAUSSFAC;sumSquares;IL;8| (170 . |norm|)
              (|IntegerPrimesPackage| 6) (175 . |prime?|)
              |GAUSSFAC;prime?;CB;9|)
           '#(|sumSquares| 180 |prime?| 185 |factor| 190) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factor|
                                 ((|Factored| (|Complex| (|Integer|)))
                                  (|Complex| (|Integer|))))
                                T)
                              '((|sumSquares|
                                 ((|List| (|Integer|)) (|Integer|)))
                                T)
                              '((|prime?|
                                 ((|Boolean|) (|Complex| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 60
                                            '(2 6 0 0 0 7 3 6 9 0 0 0 10 0 11 0
                                              12 2 13 0 6 6 14 2 11 0 6 6 16 2
                                              11 17 0 0 18 2 11 0 0 19 20 2 11
                                              17 0 0 21 2 11 0 0 22 23 1 11 6 0
                                              24 1 26 25 6 27 1 25 6 0 28 1 25
                                              31 0 32 2 13 0 0 19 33 2 13 0 0 0
                                              34 2 35 6 0 6 36 1 13 0 0 37 2 40
                                              0 13 39 41 0 11 0 42 0 13 0 43 2
                                              13 17 0 0 44 2 40 0 13 19 45 1 13
                                              6 0 46 1 13 6 0 47 1 40 13 0 48 1
                                              40 39 0 49 0 13 0 50 2 6 17 0 0
                                              51 2 13 0 0 0 52 2 13 0 0 0 53 2
                                              13 17 0 0 54 1 13 6 0 57 1 58 17
                                              6 59 1 0 35 6 56 1 0 17 13 60 1 0
                                              40 13 55)))))
           '|lookupComplete|)) 
