
(SDEFUN |FRNAALG-;min_poly_from_matrix|
        ((|mx| (|Matrix| (|Polynomial| R))) (|x| (|Matrix| (|Polynomial| R)))
         (% (|SparseUnivariatePolynomial| (|Polynomial| R))))
        (SPROG
         ((|k| (|PositiveInteger|)) (|cond| (|Matrix| (|Polynomial| R)))
          (|vectorOfCoef| (|Vector| (|Polynomial| R))) (|i| NIL) (#1=#:G18 NIL)
          (|res| (|SparseUnivariatePolynomial| (|Polynomial| R))))
         (SEQ (LETT |k| 1) (LETT |cond| (SPADCALL |x| (QREFELT % 9)))
              (SEQ G190
                   (COND
                    ((NULL (EQL (SPADCALL |cond| (QREFELT % 11)) |k|))
                     (GO G191)))
                   (SEQ (LETT |k| (+ |k| 1))
                        (LETT |x| (SPADCALL |mx| |x| (QREFELT % 15)))
                        (EXIT
                         (LETT |cond| (SPADCALL |cond| |x| (QREFELT % 16)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |vectorOfCoef|
                    (|SPADfirst| (SPADCALL |cond| (QREFELT % 18))))
              (LETT |res| (|spadConstant| % 19))
              (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL
                                      (SPADCALL |vectorOfCoef| |i|
                                                (QREFELT % 23))
                                      |i| (QREFELT % 24))
                                     (QREFELT % 25)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FRNAALG-;rank_polynomial|
        ((|left| (|Boolean|))
         (% (|SparseUnivariatePolynomial| (|Polynomial| R))))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S))
          (|gamma| (|Vector| (|Matrix| R))) (#1=#:G34 NIL) (|q| NIL)
          (#2=#:G35 NIL) (|listOfNumbers| (|List| (|String|))) (#3=#:G37 NIL)
          (#4=#:G38 NIL) (#5=#:G36 NIL)
          (|symbolsForCoef| (|Vector| (|Symbol|)))
          (|x| #6=(|Matrix| (|Polynomial| R))) (|mx| #6#) (|i| NIL)
          (#7=#:G39 NIL) (|mo| (|Polynomial| R)) (|j| NIL) (#8=#:G40 NIL)
          (|k| NIL) (#9=#:G41 NIL) (|mxjk| (|Polynomial| R)) (|cijk| (R)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 27)))
              (LETT |b| (SPADCALL (QREFELT % 29)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 31)))
              (LETT |listOfNumbers|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |q| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |q| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                          (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |symbolsForCoef|
                    (PROGN
                     (LETT #3# (GETREFV (LENGTH |listOfNumbers|)))
                     (SEQ (LETT |i| NIL) (LETT #4# |listOfNumbers|)
                          (LETT #5# 0) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #5#
                                    (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                              (QREFELT % 34)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT NIL))
                     #3#))
              (LETT |x| (MAKE_MATRIX1 |n| 1 (|spadConstant| % 35)))
              (LETT |mx| (MAKE_MATRIX1 |n| |n| (|spadConstant| % 35)))
              (SEQ (LETT |i| 1) (LETT #7# |n|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (LETT |mo|
                          (SPADCALL (|spadConstant| % 38)
                                    (LIST
                                     (SPADCALL |symbolsForCoef| |i|
                                               (QREFELT % 40)))
                                    (LIST 1) (QREFELT % 43)))
                    (QSETAREF2O |x| |i| 1 |mo| 1 1)
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #8# |n|) G190
                          (COND ((|greater_SI| |j| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #9# |n|) G190
                                 (COND ((|greater_SI| |k| #9#) (GO G191)))
                                 (SEQ (LETT |mxjk| (QAREF2O |mx| |j| |k| 1 1))
                                      (LETT |cijk|
                                            (COND
                                             ((OR |left| 'T)
                                              (SPADCALL
                                               (SPADCALL |gamma| |j|
                                                         (QREFELT % 45))
                                               |i| |k| (QREFELT % 46)))))
                                      (EXIT
                                       (QSETAREF2O |mx| |j| |k|
                                                   (SPADCALL |mxjk|
                                                             (SPADCALL |mo|
                                                                       |cijk|
                                                                       (QREFELT
                                                                        % 47))
                                                             (QREFELT % 48))
                                                   1 1)))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (|FRNAALG-;min_poly_from_matrix| |mx| |x| %))))) 

(SDEFUN |FRNAALG-;leftRankPolynomial;Sup;3|
        ((% (|SparseUnivariatePolynomial| (|Polynomial| R))))
        (|FRNAALG-;rank_polynomial| 'T %)) 

(SDEFUN |FRNAALG-;rightRankPolynomial;Sup;4|
        ((% (|SparseUnivariatePolynomial| (|Polynomial| R))))
        (|FRNAALG-;rank_polynomial| NIL %)) 

(SDEFUN |FRNAALG-;leftUnitsInternal|
        ((%
          (|Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
                    (|:| |basis| (|List| (|Vector| R))))))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S))
          (|gamma| (|Vector| (|Matrix| R))) (|cond| (|Matrix| R))
          (|rhs| (|Vector| R)) (|k| NIL) (#1=#:G58 NIL) (|i| NIL)
          (#2=#:G59 NIL) (|z| (|Integer|)) (|addOn| (R)) (|j| NIL)
          (#3=#:G60 NIL))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 27)))
              (LETT |b| (SPADCALL (QREFELT % 29)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 31)))
              (LETT |cond|
                    (MAKE_MATRIX1 (EXPT |n| 2) |n| (|spadConstant| % 37)))
              (LETT |rhs| (MAKEARR1 (EXPT |n| 2) (|spadConstant| % 37)))
              (LETT |z| 0) (LETT |addOn| (|spadConstant| % 37))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1))
                               (LETT |addOn|
                                     (COND
                                      ((EQL |k| |i|) (|spadConstant| % 12))
                                      ('T (|spadConstant| % 37))))
                               (SPADCALL |rhs| |z| |addOn| (QREFELT % 52))
                               (EXIT
                                (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SPADCALL |cond| |z| |j|
                                                 (SPADCALL
                                                  (SPADCALL |gamma| |k|
                                                            (QREFELT % 45))
                                                  |j| |i| (QREFELT % 46))
                                                 (QREFELT % 53))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cond| |rhs| (QREFELT % 57)))))) 

(SDEFUN |FRNAALG-;leftUnit;U;6| ((% (|Union| S "failed")))
        (SPROG
         ((|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #1="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G66 NIL))
         (SEQ (LETT |res| (|FRNAALG-;leftUnitsInternal| %))
              (EXIT
               (COND ((QEQCAR (QCAR |res|) 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL
                             (PROG2 (LETT #2# (QCAR |res|))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Vector| (QREFELT % 7))
                                               (|Union|
                                                (|Vector| (QREFELT % 7)) #1#)
                                               #2#))
                             (QREFELT % 58))))))))) 

(SDEFUN |FRNAALG-;leftUnits;U;7|
        ((%
          (|Union| (|Record| (|:| |particular| S) (|:| |basis| (|List| S)))
                   "failed")))
        (SPROG
         ((|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #1="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G79 NIL))
         (SEQ (LETT |res| (|FRNAALG-;leftUnitsInternal| %))
              (EXIT
               (COND ((QEQCAR (QCAR |res|) 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (CONS
                             (SPADCALL
                              (PROG2 (LETT #2# (QCAR |res|))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|Vector| (QREFELT % 7))
                                                (|Union|
                                                 (|Vector| (QREFELT % 7)) #1#)
                                                #2#))
                              (QREFELT % 58))
                             (SPADCALL (ELT % 58) (QCDR |res|)
                                       (QREFELT % 65)))))))))) 

(SDEFUN |FRNAALG-;rightUnitsInternal|
        ((%
          (|Record| (|:| |particular| (|Union| (|Vector| R) "failed"))
                    (|:| |basis| (|List| (|Vector| R))))))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S))
          (|gamma| (|Vector| (|Matrix| R))) (|condo| (|Matrix| R))
          (|rhs| (|Vector| R)) (|k| NIL) (#1=#:G99 NIL) (|i| NIL)
          (#2=#:G100 NIL) (|z| (|Integer|)) (|addOn| (R)) (|j| NIL)
          (#3=#:G101 NIL))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 27)))
              (LETT |b| (SPADCALL (QREFELT % 29)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 31)))
              (LETT |condo|
                    (MAKE_MATRIX1 (EXPT |n| 2) |n| (|spadConstant| % 37)))
              (LETT |rhs| (MAKEARR1 (EXPT |n| 2) (|spadConstant| % 37)))
              (LETT |z| 0) (LETT |addOn| (|spadConstant| % 37))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1))
                               (LETT |addOn|
                                     (COND
                                      ((EQL |k| |i|) (|spadConstant| % 12))
                                      ('T (|spadConstant| % 37))))
                               (SPADCALL |rhs| |z| |addOn| (QREFELT % 52))
                               (EXIT
                                (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (SPADCALL |condo| |z| |j|
                                                 (SPADCALL
                                                  (SPADCALL |gamma| |k|
                                                            (QREFELT % 45))
                                                  |i| |j| (QREFELT % 46))
                                                 (QREFELT % 53))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |condo| |rhs| (QREFELT % 57)))))) 

(SDEFUN |FRNAALG-;rightUnit;U;9| ((% (|Union| S "failed")))
        (SPROG
         ((|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #1="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G107 NIL))
         (SEQ (LETT |res| (|FRNAALG-;rightUnitsInternal| %))
              (EXIT
               (COND ((QEQCAR (QCAR |res|) 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL
                             (PROG2 (LETT #2# (QCAR |res|))
                                 (QCDR #2#)
                               (|check_union2| (QEQCAR #2# 0)
                                               (|Vector| (QREFELT % 7))
                                               (|Union|
                                                (|Vector| (QREFELT % 7)) #1#)
                                               #2#))
                             (QREFELT % 58))))))))) 

(SDEFUN |FRNAALG-;rightUnits;U;10|
        ((%
          (|Union| (|Record| (|:| |particular| S) (|:| |basis| (|List| S)))
                   "failed")))
        (SPROG
         ((|res|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #1="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (#2=#:G117 NIL))
         (SEQ (LETT |res| (|FRNAALG-;rightUnitsInternal| %))
              (EXIT
               (COND ((QEQCAR (QCAR |res|) 1) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (CONS
                             (SPADCALL
                              (PROG2 (LETT #2# (QCAR |res|))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0)
                                                (|Vector| (QREFELT % 7))
                                                (|Union|
                                                 (|Vector| (QREFELT % 7)) #1#)
                                                #2#))
                              (QREFELT % 58))
                             (SPADCALL (ELT % 58) (QCDR |res|)
                                       (QREFELT % 65)))))))))) 

(SDEFUN |FRNAALG-;unit;U;11| ((% (|Union| S "failed")))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S))
          (|gamma| (|Vector| (|Matrix| R))) (|cond| (|Matrix| R))
          (|rhs| (|Vector| R)) (|u| (|Integer|)) (|k| NIL) (#1=#:G138 NIL)
          (|i| NIL) (#2=#:G139 NIL) (|z| (|Integer|)) (|addOn| (R)) (|j| NIL)
          (#3=#:G140 NIL) (|res| (|Union| (|Vector| R) "failed")))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 27)))
              (LETT |b| (SPADCALL (QREFELT % 29)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 31)))
              (LETT |cond|
                    (MAKE_MATRIX1 (* 2 (EXPT |n| 2)) |n|
                                  (|spadConstant| % 37)))
              (LETT |rhs| (MAKEARR1 (* 2 (EXPT |n| 2)) (|spadConstant| % 37)))
              (LETT |z| 0) (LETT |u| (* |n| |n|))
              (LETT |addOn| (|spadConstant| % 37))
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1))
                               (LETT |addOn|
                                     (COND
                                      ((EQL |k| |i|) (|spadConstant| % 12))
                                      ('T (|spadConstant| % 37))))
                               (SPADCALL |rhs| |z| |addOn| (QREFELT % 52))
                               (SPADCALL |rhs| |u| |addOn| (QREFELT % 52))
                               (EXIT
                                (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                                     (COND ((|greater_SI| |j| #3#) (GO G191)))
                                     (SEQ
                                      (SPADCALL |cond| |z| |j|
                                                (SPADCALL
                                                 (SPADCALL |gamma| |k|
                                                           (QREFELT % 45))
                                                 |j| |i| (QREFELT % 46))
                                                (QREFELT % 53))
                                      (EXIT
                                       (SPADCALL |cond| |u| |j|
                                                 (SPADCALL
                                                  (SPADCALL |gamma| |k|
                                                            (QREFELT % 45))
                                                  |i| |j| (QREFELT % 46))
                                                 (QREFELT % 53))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |cond| |rhs| (QREFELT % 72)))
              (EXIT
               (COND ((QEQCAR |res| 1) (CONS 1 "failed"))
                     ('T (CONS 0 (SPADCALL (QCDR |res|) (QREFELT % 58))))))))) 

(SDEFUN |FRNAALG-;apply;M2S;12| ((|m| (|Matrix| R)) (|a| (S)) (% (S)))
        (SPROG ((|v| (|Vector| R)))
               (SEQ (LETT |v| (SPADCALL |a| (QREFELT % 74)))
                    (LETT |v| (SPADCALL |m| |v| (QREFELT % 75)))
                    (EXIT (SPADCALL |v| (QREFELT % 76)))))) 

(SDEFUN |FRNAALG-;structuralConstants;V;13| ((% (|Vector| (|Matrix| R))))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 31))) 

(SDEFUN |FRNAALG-;conditionsForIdempotents;L;14|
        ((% (|List| (|Polynomial| R))))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 80))) 

(SDEFUN |FRNAALG-;leftTraceMatrix;M;15| ((% (|Matrix| R)))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 82))) 

(SDEFUN |FRNAALG-;rightTraceMatrix;M;16| ((% (|Matrix| R)))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 84))) 

(SDEFUN |FRNAALG-;leftDiscriminant;R;17| ((% (R)))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 86))) 

(SDEFUN |FRNAALG-;rightDiscriminant;R;18| ((% (R)))
        (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 88))) 

(SDEFUN |FRNAALG-;leftRegularRepresentation;SM;19| ((|x| (S)) (% (|Matrix| R)))
        (SPADCALL |x| (SPADCALL (QREFELT % 29)) (QREFELT % 90))) 

(SDEFUN |FRNAALG-;rightRegularRepresentation;SM;20|
        ((|x| (S)) (% (|Matrix| R)))
        (SPADCALL |x| (SPADCALL (QREFELT % 29)) (QREFELT % 92))) 

(SDEFUN |FRNAALG-;coordinates;SV;21| ((|x| (S)) (% (|Vector| R)))
        (SPADCALL |x| (SPADCALL (QREFELT % 29)) (QREFELT % 94))) 

(SDEFUN |FRNAALG-;represents;VS;22| ((|v| (|Vector| R)) (% (S)))
        (SPADCALL |v| (SPADCALL (QREFELT % 29)) (QREFELT % 96))) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebra&;|)) 

(DEFUN |FramedNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FramedNonAssociativeAlgebra&| DV$1 DV$2))
          (LETT % (GETREFV 98))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|Field|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 49
                       (CONS
                        (|dispatchFunction|
                         |FRNAALG-;leftRankPolynomial;Sup;3|)
                        %))
             (QSETREFV % 50
                       (CONS
                        (|dispatchFunction|
                         |FRNAALG-;rightRankPolynomial;Sup;4|)
                        %))
             NIL
             (QSETREFV % 60
                       (CONS (|dispatchFunction| |FRNAALG-;leftUnit;U;6|) %))
             (QSETREFV % 68
                       (CONS (|dispatchFunction| |FRNAALG-;leftUnits;U;7|) %))
             NIL
             (QSETREFV % 69
                       (CONS (|dispatchFunction| |FRNAALG-;rightUnit;U;9|) %))
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |FRNAALG-;rightUnits;U;10|)
                             %)))))
          (COND
           ((|HasCategory| |#2| '(|IntegralDomain|))
            (PROGN
             (QSETREFV % 73
                       (CONS (|dispatchFunction| |FRNAALG-;unit;U;11|) %)))))
          %))) 

(MAKEPROP '|FramedNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Matrix| 20) (0 . |copy|) (|NonNegativeInteger|) (5 . |rank|)
              (10 . |1|) (|SparseUnivariatePolynomial| 20) (14 . |1|) (18 . *)
              (24 . |horizConcat|) (|List| 22) (30 . |nullSpace|) (35 . |0|)
              (|Polynomial| 7) (|Integer|) (|Vector| 20) (39 . |elt|)
              (45 . |monomial|) (51 . +) (|PositiveInteger|) (57 . |rank|)
              (|Vector| %) (61 . |basis|) (|Vector| 44)
              (65 . |structuralConstants|) (|String|) (|Symbol|)
              (70 . |coerce|) (75 . |0|) (79 . |0|) (83 . |0|) (87 . |1|)
              (|Vector| 33) (91 . |elt|) (|List| 33) (|List| 10)
              (97 . |monomial|) (|Matrix| 7) (104 . |elt|) (110 . |elt|)
              (117 . *) (123 . +) (129 . |leftRankPolynomial|)
              (133 . |rightRankPolynomial|) (|Vector| 7) (137 . |setelt!|)
              (144 . |setelt!|) (|Union| 51 '"failed")
              (|Record| (|:| |particular| 54) (|:| |basis| 63))
              (|LinearSystemMatrixPackage| 7 51 51 44) (152 . |solve|)
              (158 . |represents|) (|Union| % '#1="failed") (163 . |leftUnit|)
              (|List| 6) (|Mapping| 6 51) (|List| 51) (|ListFunctions2| 51 6)
              (167 . |map|)
              (|Record| (|:| |particular| %) (|:| |basis| (|List| %)))
              (|Union| 66 '#1#) (173 . |leftUnits|) (177 . |rightUnit|)
              (181 . |rightUnits|) (|LinearSystemMatrixPackage2| 7)
              (185 . |solveUniquely|) (191 . |unit|) (195 . |coordinates|)
              (200 . *) (206 . |convert|) |FRNAALG-;apply;M2S;12|
              |FRNAALG-;structuralConstants;V;13| (|List| 20)
              (211 . |conditionsForIdempotents|)
              |FRNAALG-;conditionsForIdempotents;L;14|
              (216 . |leftTraceMatrix|) |FRNAALG-;leftTraceMatrix;M;15|
              (221 . |rightTraceMatrix|) |FRNAALG-;rightTraceMatrix;M;16|
              (226 . |leftDiscriminant|) |FRNAALG-;leftDiscriminant;R;17|
              (231 . |rightDiscriminant|) |FRNAALG-;rightDiscriminant;R;18|
              (236 . |leftRegularRepresentation|)
              |FRNAALG-;leftRegularRepresentation;SM;19|
              (242 . |rightRegularRepresentation|)
              |FRNAALG-;rightRegularRepresentation;SM;20| (248 . |coordinates|)
              |FRNAALG-;coordinates;SV;21| (254 . |represents|)
              |FRNAALG-;represents;VS;22|)
           '#(|unit| 260 |structuralConstants| 264 |rightUnits| 268 |rightUnit|
              272 |rightTraceMatrix| 276 |rightRegularRepresentation| 280
              |rightRankPolynomial| 285 |rightDiscriminant| 289 |represents|
              293 |leftUnits| 298 |leftUnit| 302 |leftTraceMatrix| 306
              |leftRegularRepresentation| 310 |leftRankPolynomial| 315
              |leftDiscriminant| 319 |coordinates| 323
              |conditionsForIdempotents| 328 |apply| 332)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|apply| (|#1| (|Matrix| |#2|) |#1|)) T)
                                   '((|rightRankPolynomial|
                                      ((|SparseUnivariatePolynomial|
                                        (|Polynomial| |#2|))))
                                     T)
                                   '((|leftRankPolynomial|
                                      ((|SparseUnivariatePolynomial|
                                        (|Polynomial| |#2|))))
                                     T)
                                   '((|rightRegularRepresentation|
                                      ((|Matrix| |#2|) |#1|))
                                     T)
                                   '((|leftRegularRepresentation|
                                      ((|Matrix| |#2|) |#1|))
                                     T)
                                   '((|rightTraceMatrix| ((|Matrix| |#2|))) T)
                                   '((|leftTraceMatrix| ((|Matrix| |#2|))) T)
                                   '((|rightDiscriminant| (|#2|)) T)
                                   '((|leftDiscriminant| (|#2|)) T)
                                   '((|conditionsForIdempotents|
                                      ((|List| (|Polynomial| |#2|))))
                                     T)
                                   '((|structuralConstants|
                                      ((|Vector| (|Matrix| |#2|))))
                                     T)
                                   '((|coordinates| ((|Vector| |#2|) |#1|)) T)
                                   '((|coordinates|
                                      ((|Matrix| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|represents| (|#1| (|Vector| |#2|))) T)
                                   '((|unit| ((|Union| |#1| #1#))) T)
                                   '((|rightUnit| ((|Union| |#1| #1#))) T)
                                   '((|leftUnit| ((|Union| |#1| #1#))) T)
                                   '((|rightUnits|
                                      ((|Union|
                                        (|Record| (|:| |particular| |#1|)
                                                  (|:| |basis| (|List| |#1|)))
                                        #1#)))
                                     T)
                                   '((|leftUnits|
                                      ((|Union|
                                        (|Record| (|:| |particular| |#1|)
                                                  (|:| |basis| (|List| |#1|)))
                                        #1#)))
                                     T)
                                   '((|rightTraceMatrix|
                                      ((|Matrix| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|leftTraceMatrix|
                                      ((|Matrix| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|rightDiscriminant|
                                      (|#2| (|Vector| |#1|)))
                                     T)
                                   '((|leftDiscriminant|
                                      (|#2| (|Vector| |#1|)))
                                     T)
                                   '((|represents|
                                      (|#1| (|Vector| |#2|) (|Vector| |#1|)))
                                     T)
                                   '((|coordinates|
                                      ((|Matrix| |#2|) (|Vector| |#1|)
                                       (|Vector| |#1|)))
                                     T)
                                   '((|coordinates|
                                      ((|Vector| |#2|) |#1| (|Vector| |#1|)))
                                     T)
                                   '((|rightRegularRepresentation|
                                      ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                     T)
                                   '((|leftRegularRepresentation|
                                      ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                     T)
                                   '((|structuralConstants|
                                      ((|Vector| (|Matrix| |#2|))
                                       (|Vector| |#1|)))
                                     T)
                                   '((|conditionsForIdempotents|
                                      ((|List| (|Polynomial| |#2|))
                                       (|Vector| |#1|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 97
                                            '(1 8 0 0 9 1 8 10 0 11 0 7 0 12 0
                                              13 0 14 2 8 0 0 0 15 2 8 0 0 0 16
                                              1 8 17 0 18 0 13 0 19 2 22 20 0
                                              21 23 2 13 0 20 10 24 2 13 0 0 0
                                              25 0 6 26 27 0 6 28 29 1 6 30 28
                                              31 1 33 0 32 34 0 20 0 35 0 6 0
                                              36 0 7 0 37 0 20 0 38 2 39 33 0
                                              21 40 3 20 0 0 41 42 43 2 30 44 0
                                              21 45 3 44 7 0 21 21 46 2 20 0 0
                                              7 47 2 20 0 0 0 48 0 0 13 49 0 0
                                              13 50 3 51 7 0 21 7 52 4 44 7 0
                                              21 21 7 53 2 56 55 44 51 57 1 6 0
                                              51 58 0 0 59 60 2 64 61 62 63 65
                                              0 0 67 68 0 0 59 69 0 0 67 70 2
                                              71 54 44 51 72 0 0 59 73 1 6 51 0
                                              74 2 44 51 0 51 75 1 6 0 51 76 1
                                              6 79 28 80 1 6 44 28 82 1 6 44 28
                                              84 1 6 7 28 86 1 6 7 28 88 2 6 44
                                              0 28 90 2 6 44 0 28 92 2 6 51 0
                                              28 94 2 6 0 51 28 96 0 0 59 73 0
                                              0 30 78 0 0 67 70 0 0 59 69 0 0
                                              44 85 1 0 44 0 93 0 0 13 50 0 0 7
                                              89 1 0 0 51 97 0 0 67 68 0 0 59
                                              60 0 0 44 83 1 0 44 0 91 0 0 13
                                              49 0 0 7 87 1 0 51 0 95 0 0 79 81
                                              2 0 0 44 0 77)))))
           '|lookupComplete|)) 
