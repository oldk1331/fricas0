
(SDEFUN |SAE;size;Nni;1| ((% (|NonNegativeInteger|)))
        (EXPT (SPADCALL (QREFELT % 32)) (QREFELT % 17))) 

(SDEFUN |SAE;random;%;2| ((% (%)))
        (SPROG ((#1=#:G465 NIL) (|i| NIL) (#2=#:G464 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 21))))
                  (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT % 34)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  #2#)
                 (QREFELT % 36))))) 

(SDEFUN |SAE;Zero;%;3| ((% (%))) (|spadConstant| % 38)) 

(SDEFUN |SAE;One;%;4| ((% (%))) (|spadConstant| % 40)) 

(SDEFUN |SAE;*;R2%;5| ((|c| (R)) (|x| (%)) (% (%)))
        (SPADCALL |c| |x| (QREFELT % 41))) 

(SDEFUN |SAE;*;I2%;6| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL |n| |x| (QREFELT % 44))) 

(SDEFUN |SAE;coerce;I%;7| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 46))) 

(SDEFUN |SAE;coerce;R%;8| ((|c| (R)) (% (%))) (SPADCALL |c| 0 (QREFELT % 30))) 

(SDEFUN |SAE;coerce;%Of;9| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 51))) 

(PUT '|SAE;lift;%UP;10| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SAE;lift;%UP;10| ((|x| (%)) (% (UP))) |x|) 

(SDEFUN |SAE;reduce;UP%;11| ((|p| (UP)) (% (%)))
        (QCDR (SPADCALL |p| (QREFELT % 8) (QREFELT % 55)))) 

(SDEFUN |SAE;=;2%B;12| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 58))) 

(SDEFUN |SAE;hashUpdate!;Hs%Hs;13| ((|s| #1=(|HashState|)) (|x| (%)) (% #1#))
        (SPADCALL |s| |x| (QREFELT % 61))) 

(SDEFUN |SAE;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 63))) 

(SDEFUN |SAE;-;2%;15| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 65))) 

(SDEFUN |SAE;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 67)) (QREFELT % 56))) 

(SDEFUN |SAE;coordinates;%V;17| ((|x| (%)) (% (|Vector| R)))
        (SPROG ((#1=#:G485 NIL) (|i| NIL) (#2=#:G484 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 21))))
                 (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT % 53)) |i|
                                          (QREFELT % 69)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #2#)))) 

(SDEFUN |SAE;represents;V%;18| ((|vect| (|Vector| R)) (% (%)))
        (SPROG
         ((#1=#:G487 NIL) (#2=#:G486 (%)) (#3=#:G488 (%)) (#4=#:G490 NIL)
          (|i| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |i| 0) (LETT #4# (QREFELT % 21)) G190
                (COND ((|greater_SI| |i| #4#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT % 71))
                                   |i| (QREFELT % 30)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 64))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 39))))))) 

(SDEFUN |SAE;definingPolynomial;UP;19| ((% (UP))) (QREFELT % 8)) 

(SDEFUN |SAE;characteristic;Nni;20| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 73))) 

(SDEFUN |SAE;rank;Pi;21| ((% (|PositiveInteger|)))
        (SPROG ((#1=#:G493 NIL))
               (PROG1 (LETT #1# (QREFELT % 17))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                   '(|NonNegativeInteger|) #1#)))) 

(SDEFUN |SAE;basis;V;22| ((% (|Vector| %)))
        (SPADCALL (QREFELT % 31) (QREFELT % 78))) 

(SDEFUN |SAE;minimalPolynomial;%UP;23| ((|x| (%)) (% (UP)))
        (SPADCALL (SPADCALL |x| (QREFELT % 81)) (QREFELT % 82))) 

(SDEFUN |SAE;coordinates;%VV;24|
        ((|x| (%)) (|bas| (|Vector| %)) (% (|Vector| R)))
        (SPROG ((|m| (|Union| (|Matrix| R) "failed")))
               (SEQ
                (LETT |m|
                      (SPADCALL
                       (SPADCALL (SPADCALL |bas| (QREFELT % 84))
                                 (QREFELT % 85))
                       (QREFELT % 86)))
                (EXIT
                 (COND
                  ((QEQCAR |m| 1)
                   (|error| "coordinates: second argument must be a basis"))
                  ('T
                   (SPADCALL (QCDR |m|) (SPADCALL |x| (QREFELT % 70))
                             (QREFELT % 87)))))))) 

(SDEFUN |SAE;coordinates;%VV;25|
        ((|x| (%)) (|bas| (|Vector| %)) (% (|Vector| R)))
        (SPROG
         ((|xi| (|qf|)) (#1=#:G511 NIL) (|i| NIL) (|vec| (|Vector| R))
          (|vecQF| (|Vector| |qf|)) (|coordsQF| (|Vector| |qf|))
          (|m| (|Union| (|Matrix| |qf|) #2="failed")) (|mat| (|Matrix| R))
          (|imatqf|
           (CATEGORY |package|
            (SIGNATURE |rowEchelon| (#3=(|Matrix| |qf|) #4=(|Matrix| R)))
            (SIGNATURE |inverse| ((|Union| #3# "failed") #4#))
            (IF (|has| (|Vector| |qf|) (|shallowlyMutable|))
                (SIGNATURE |nullSpace| ((|List| (|Vector| R)) #4#))
                |noBranch|)))
          (|qf|
           (|Join| (|QuotientFieldCategory| R)
                   (CATEGORY |domain|
                    (IF (|has| R (|IntegerNumberSystem|))
                        (IF (|has| R (|OpenMath|))
                            (ATTRIBUTE (|OpenMath|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|Canonical|))
                        (IF (|has| R (|GcdDomain|))
                            (IF (|has| R (|canonicalUnitNormal|))
                                (ATTRIBUTE (|Canonical|))
                                |noBranch|)
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|UniqueFactorizationDomain|))
                        (SIGNATURE |factorFraction|
                         ((|Fraction| (|Factored| R)) %))
                        |noBranch|)
                    (IF (|has| R (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|)))))
         (SEQ (LETT |qf| (|Fraction| (QREFELT % 6)))
              (LETT |imatqf|
                    (|InnerMatrixQuotientFieldFunctions| (QREFELT % 6)
                                                         (|Vector|
                                                          (QREFELT % 6))
                                                         (|Vector|
                                                          (QREFELT % 6))
                                                         (|Matrix|
                                                          (QREFELT % 6))
                                                         |qf| (|Vector| |qf|)
                                                         (|Vector| |qf|)
                                                         (|Matrix| |qf|)))
              (LETT |mat|
                    (SPADCALL (SPADCALL |bas| (QREFELT % 84)) (QREFELT % 85)))
              (LETT |m|
                    (SPADCALL |mat|
                              (|compiledLookupCheck| '|inverse|
                                                     (LIST
                                                      (LIST '|Union|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   |qf|))
                                                            '#2#)
                                                      (LIST '|Matrix|
                                                            (|devaluate|
                                                             (ELT % 6))))
                                                     |imatqf|)))
              (EXIT
               (COND
                ((QEQCAR |m| 1)
                 (|error| "coordinates: second argument must be a basis"))
                ('T
                 (SEQ
                  (LETT |coordsQF|
                        (SPADCALL
                         (|compiledLookupCheck| '|coerce|
                                                (LIST '%
                                                      (|devaluate| (ELT % 6)))
                                                |qf|)
                         (SPADCALL |x| (QREFELT % 70))
                         (|compiledLookupCheck| '|map|
                                                (LIST
                                                 (LIST '|Vector|
                                                       (|devaluate| |qf|))
                                                 (LIST '|Mapping|
                                                       (|devaluate| |qf|)
                                                       (|devaluate| (ELT % 6)))
                                                 (LIST '|Vector|
                                                       (|devaluate|
                                                        (ELT % 6))))
                                                (|VectorFunctions2| (ELT % 6)
                                                                    |qf|))))
                  (LETT |vecQF|
                        (SPADCALL (QCDR |m|) |coordsQF|
                                  (|compiledLookupCheck| '*
                                                         (LIST
                                                          (LIST '|Vector|
                                                                (|devaluate|
                                                                 |qf|))
                                                          '%
                                                          (LIST '|Vector|
                                                                (|devaluate|
                                                                 |qf|)))
                                                         (|Matrix| |qf|))))
                  (LETT |vec| (MAKEARR1 (QREFELT % 17) (|spadConstant| % 26)))
                  (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 17)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |xi| (QAREF1O |vecQF| |i| 1))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (SPADCALL |xi|
                                          (|compiledLookupCheck| '|denom|
                                                                 (LIST
                                                                  (|devaluate|
                                                                   (ELT % 6))
                                                                  '%)
                                                                 |qf|))
                                (|spadConstant| % 29) (QREFELT % 89))
                               (QSETAREF1O |vec| |i|
                                           (SPADCALL |xi|
                                                     (|compiledLookupCheck|
                                                      '|numer|
                                                      (LIST
                                                       (|devaluate| (ELT % 6))
                                                       '%)
                                                      |qf|))
                                           1))
                              ('T
                               (|error|
                                "coordinates: coordinates are not integral over ground ring")))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |vec|)))))))) 

(SDEFUN |SAE;reducedSystem;MM;26| ((|m| (|Matrix| %)) (% (|Matrix| R)))
        (SPADCALL (SPADCALL (ELT % 53) |m| (QREFELT % 94)) (QREFELT % 96))) 

(SDEFUN |SAE;reducedSystem;MVR;27|
        ((|m| (|Matrix| %)) (|v| (|Vector| %))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPADCALL (SPADCALL (ELT % 53) |m| (QREFELT % 94))
                  (SPADCALL (ELT % 53) |v| (QREFELT % 100)) (QREFELT % 102))) 

(SDEFUN |SAE;discriminant;R;28| ((% (R)))
        (SEQ (COND ((QREFELT % 28) (|SAE;mkDisc| NIL %)))
             (EXIT (QREFELT % 27)))) 

(SDEFUN |SAE;mkDisc| ((|b| (|Boolean|)) (% (|Void|)))
        (SEQ (SETELT % 28 |b|)
             (SETELT % 27 (SPADCALL (QREFELT % 8) (QREFELT % 105)))
             (EXIT (SPADCALL (QREFELT % 107))))) 

(SDEFUN |SAE;traceMatrix;M;30| ((% (|Matrix| R)))
        (SEQ (COND ((QREFELT % 25) (|SAE;mkDiscMat| NIL %)))
             (EXIT (QREFELT % 24)))) 

(SDEFUN |SAE;mkDiscMat| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((#1=#:G531 NIL) (|j| NIL) (#2=#:G530 NIL) (|i| NIL)
          (|mc| (|Integer|)) (|mr| (|Integer|)))
         (SEQ (SETELT % 25 |b|) (LETT |mr| (PROGN (QREFELT % 24) 1))
              (LETT |mc| (PROGN (QREFELT % 24) 1))
              (SEQ (LETT |i| 0) (LETT #2# (QREFELT % 21)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #1# (QREFELT % 21)) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O (QREFELT % 24) (+ |mr| |i|)
                                        (+ |mc| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 29)
                                                    (+ |i| |j|)
                                                    (QREFELT % 109))
                                          (QREFELT % 56))
                                         (QREFELT % 110))
                                        1 1)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT % 107)))))) 

(SDEFUN |SAE;trace;%R;32| ((|x| (%)) (% (R)))
        (SPROG ((|ans| (R)) (|xn| (%)) (#1=#:G537 NIL) (|n| NIL))
               (SEQ (LETT |xn| |x|)
                    (LETT |ans|
                          (SPADCALL (SPADCALL |xn| (QREFELT % 53)) 0
                                    (QREFELT % 69)))
                    (SEQ (LETT |n| 1) (LETT #1# (QREFELT % 21)) G190
                         (COND ((|greater_SI| |n| #1#) (GO G191)))
                         (SEQ
                          (LETT |xn|
                                (SPADCALL (SPADCALL (QREFELT % 111)) |xn|
                                          (QREFELT % 68)))
                          (EXIT
                           (LETT |ans|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |xn| (QREFELT % 53)) |n|
                                            (QREFELT % 69))
                                  |ans| (QREFELT % 112)))))
                         (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |SAE;fac1| ((|up| (UP)) (% (|Factored| UP)))
        (SPROG ((|f1| (|Factored| (|SparseUnivariatePolynomial| R))))
               (SEQ
                (LETT |f1|
                      (SPADCALL (SPADCALL |up| (QREFELT % 114))
                                (QREFELT % 117)))
                (EXIT (SPADCALL (ELT % 118) |f1| (QREFELT % 123)))))) 

(SDEFUN |SAE;factorPolynomial;SupF;34|
        ((|up| (|SparseUnivariatePolynomial| %))
         (% (|Factored| (|SparseUnivariatePolynomial| %))))
        (SPADCALL |up| (CONS (|function| |SAE;fac1|) %) (QREFELT % 128))) 

(SDEFUN |SAE;index;Pi%;35| ((|k| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((|i| (|Integer|)) (|ans| (%)) (|a| (R)) (#1=#:G545 NIL)
          (|h| (|Integer|)) (|j| NIL) (|p| (|Integer|)))
         (SEQ (LETT |i| (REM |k| (SPADCALL (QREFELT % 33))))
              (LETT |p| (SPADCALL (QREFELT % 32)))
              (LETT |ans| (|spadConstant| % 39))
              (SEQ (LETT |j| 0) G190 (COND ((NULL (> |i| 0)) (GO G191)))
                   (SEQ (LETT |h| (REM |i| |p|))
                        (COND
                         ((SPADCALL |h| 0 (QREFELT % 130))
                          (SEQ
                           (LETT |a|
                                 (SPADCALL
                                  (PROG1 (LETT #1# |h|)
                                    (|check_subtype2| (> #1# 0)
                                                      '(|PositiveInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT % 131)))
                           (EXIT
                            (LETT |ans|
                                  (SPADCALL |ans|
                                            (SPADCALL
                                             (SPADCALL |a| |j| (QREFELT % 109))
                                             (QREFELT % 56))
                                            (QREFELT % 64)))))))
                        (EXIT (LETT |i| (QUOTIENT2 |i| |p|))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |SAE;lookup;%Pi;36| ((|z| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((|co| (|Integer|)) (|n| (|NonNegativeInteger|)) (|p| (|Integer|)))
         (SEQ
          (COND ((SPADCALL |z| (QREFELT % 133)) (SPADCALL (QREFELT % 33)))
                (#1='T
                 (SEQ (LETT |p| (SPADCALL (QREFELT % 32)))
                      (LETT |co|
                            (SPADCALL (SPADCALL |z| (QREFELT % 134))
                                      (QREFELT % 135)))
                      (LETT |n| (SPADCALL |z| (QREFELT % 16)))
                      (SEQ G190
                           (COND
                            ((NULL
                              (NULL
                               (SPADCALL
                                (LETT |z| (SPADCALL |z| (QREFELT % 136)))
                                (QREFELT % 133))))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |co|
                                   (+
                                    (* |co|
                                       (EXPT |p|
                                             (- |n|
                                                (LETT |n|
                                                      (SPADCALL |z|
                                                                (QREFELT %
                                                                         16))))))
                                    (SPADCALL (SPADCALL |z| (QREFELT % 134))
                                              (QREFELT % 135))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |n| 0) |co|)
                             (#1# (* |co| (EXPT |p| |n|))))))))))) 

(DECLAIM (NOTINLINE |SimpleAlgebraicExtension;|)) 

(DEFUN |SimpleAlgebraicExtension| (&REST #1=#:G601)
  (SPROG NIL
         (PROG (#2=#:G602)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|SimpleAlgebraicExtension|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SimpleAlgebraicExtension;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SimpleAlgebraicExtension|)))))))))) 

(DEFUN |SimpleAlgebraicExtension;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G600 NIL) (|i| NIL) (#2=#:G599 NIL) (#3=#:G456 NIL) (#4=#:G453 NIL)
    (|pv$| NIL) (#5=#:G596 NIL) (#6=#:G597 NIL) (#7=#:G598 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 |#3|)
     (LETT |dv$| (LIST '|SimpleAlgebraicExtension| DV$1 DV$2 DV$3))
     (LETT % (GETREFV 170))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         (LETT #7#
                                               (|HasCategory| |#1| '(|Field|)))
                                         (OR #7#
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1| '(|Finite|))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|DifferentialRing|))
                                           #7#)
                                          (|HasCategory| |#1|
                                                         '(|FiniteFieldCategory|)))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (OR (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                         (LETT #6#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PartialDifferentialRing|
                                                                 (|Symbol|)))
                                                (|HasCategory| |#1|
                                                               '(|Field|))))
                                         (OR #6#
                                             (AND
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|))))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (LETT #5#
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                         (OR (AND #7# #5#)
                                             (|HasCategory| |#1|
                                                            '(|FiniteFieldCategory|)))))))
     (|haddProp| |$ConstructorCache| '|SimpleAlgebraicExtension|
                 (LIST DV$1 DV$2 DV$3) (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (QSETREFV % 8 |#3|)
     (AND
      (OR (AND #7# #5# (|HasCategory| % '(|CharacteristicNonZero|)))
          (AND (|HasCategory| |#1| '(|FiniteFieldCategory|))
               (|HasCategory| % '(|CharacteristicNonZero|))))
      (|augmentPredVector| % 65536))
     (AND
      (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
          (AND #7# #5# (|HasCategory| % '(|CharacteristicNonZero|))))
      (|augmentPredVector| % 131072))
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 12 (SPADCALL (SPADCALL |#3| (QREFELT % 9)) (QREFELT % 11)))
     (COND
      ((QEQCAR (QREFELT % 12) 1) (|error| "Modulus cannot be made monic")))
     (QSETREFV % 13 |#2|)
     (SETELT % 8
             (SPADCALL
              (PROG2 (LETT #4# #8=(QREFELT % 12))
                  (QCDR #4#)
                (|check_union2| (QEQCAR #4# 0) #8# (|Union| #8# #9="failed")
                                #4#))
              |#3| (QREFELT % 14)))
     (QSETREFV % 17 (SPADCALL |#3| (QREFELT % 16)))
     (QSETREFV % 21
               (PROG2 (LETT #3# (SPADCALL (QREFELT % 17) 1 (QREFELT % 20)))
                   (QCDR #3#)
                 (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                 (|Union| (|NonNegativeInteger|) #9#) #3#)))
     (QSETREFV % 24 (SPADCALL (QREFELT % 17) (QREFELT % 17) (QREFELT % 23)))
     (QSETREFV % 25 'T)
     (QSETREFV % 27 (|spadConstant| % 26))
     (QSETREFV % 28 'T)
     (QSETREFV % 31
               (PROGN
                (LETT #2# (GETREFV (|inc_SI| #10=(QREFELT % 21))))
                (SEQ (LETT |i| 0) (LETT #1# #10#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SETELT #2# |i|
                               (SPADCALL (|spadConstant| % 29) |i|
                                         (QREFELT % 30)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                #2#))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV % 33 (CONS (|dispatchFunction| |SAE;size;Nni;1|) %))
        (QSETREFV % 37 (CONS (|dispatchFunction| |SAE;random;%;2|) %)))))
     (COND
      ((|HasCategory| (QREFELT % 13) '(|Hashable|))
       (QSETREFV % 62
                 (CONS (|dispatchFunction| |SAE;hashUpdate!;Hs%Hs;13|) %))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV % 83
                 (CONS (|dispatchFunction| |SAE;minimalPolynomial;%UP;23|)
                       %))))
     (COND
      ((|testBitVector| |pv$| 3)
       (QSETREFV % 88 (CONS (|dispatchFunction| |SAE;coordinates;%VV;24|) %)))
      ((|HasCategory| |#1| '(|IntegralDomain|))
       (QSETREFV % 88 (CONS (|dispatchFunction| |SAE;coordinates;%VV;25|) %))))
     (COND
      ((|testBitVector| |pv$| 3)
       (COND
        ((|testBitVector| |pv$| 15)
         (PROGN
          (QSETREFV % 129
                    (CONS (|dispatchFunction| |SAE;factorPolynomial;SupF;34|)
                          %)))))))
     (COND
      ((|testBitVector| |pv$| 6)
       (PROGN
        (QSETREFV % 132 (CONS (|dispatchFunction| |SAE;index;Pi%;35|) %))
        (QSETREFV % 137 (CONS (|dispatchFunction| |SAE;lookup;%Pi;36|) %)))))
     %)))) 

(MAKEPROP '|SimpleAlgebraicExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (0 . |leadingCoefficient|) (|Union| % '"failed")
              (5 . |recip|) '|r| '|Rep| (10 . *) (|NonNegativeInteger|)
              (16 . |degree|) '|d| (21 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;One;%;4|) %))
              (25 . |subtractIfCan|) '|d1| (|Matrix| 6) (31 . |zero|)
              '|discmat| '|nodiscmat?| (37 . |Zero|) '|disc| '|nodisc?|
              (41 . |One|) (45 . |monomial|) '|bsis| (51 . |size|)
              (55 . |size|) (59 . |random|) (|Vector| 6) |SAE;represents;V%;18|
              (63 . |random|) (67 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SAE;Zero;%;3|) %))
              (71 . |One|) (75 . *) |SAE;*;R2%;5| (|Integer|) (81 . *)
              |SAE;*;I2%;6| (87 . |coerce|) |SAE;coerce;I%;7| (92 . |Zero|)
              |SAE;coerce;R%;8| (|OutputForm|) (96 . |coerce|)
              |SAE;coerce;%Of;9| |SAE;lift;%UP;10|
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (101 . |monicDivide|) |SAE;reduce;UP%;11| (|Boolean|) (107 . =)
              |SAE;=;2%B;12| (|HashState|) (113 . |hashUpdate!|)
              (119 . |hashUpdate!|) (125 . +) |SAE;+;3%;14| (131 . -)
              |SAE;-;2%;15| (136 . *) |SAE;*;3%;16| (142 . |coefficient|)
              |SAE;coordinates;%V;17| (148 . |elt|)
              |SAE;definingPolynomial;UP;19| (154 . |characteristic|)
              |SAE;characteristic;Nni;20| (|PositiveInteger|) |SAE;rank;Pi;21|
              (|Vector| $$) (158 . |copy|) (|Vector| %) |SAE;basis;V;22|
              (163 . |characteristicPolynomial|) (168 . |squareFreePart|)
              (173 . |minimalPolynomial|) (178 . |coordinates|)
              (183 . |transpose|) (188 . |inverse|) (193 . *)
              (199 . |coordinates|) (205 . =) (|Matrix| 7) (|Mapping| 7 $$)
              (|Matrix| $$) (|MatrixCategoryFunctions2| $$ 77 77 92 7 98 98 90)
              (211 . |map|) (|Matrix| %) (217 . |reducedSystem|)
              |SAE;reducedSystem;MM;26| (|Vector| 7) (|VectorFunctions2| $$ 7)
              (222 . |map|) (|Record| (|:| |mat| 22) (|:| |vec| 35))
              (228 . |reducedSystem|) |SAE;reducedSystem;MVR;27|
              |SAE;discriminant;R;28| (234 . |discriminant|) (|Void|)
              (239 . |void|) |SAE;traceMatrix;M;30| (243 . |monomial|)
              |SAE;trace;%R;32| (249 . |generator|) (253 . +)
              (|SparseUnivariatePolynomial| 6) (259 . |makeSUP|)
              (|Factored| 116) (|SparseUnivariatePolynomial| %)
              (264 . |factorPolynomial|) (269 . |unmakeSUP|) (|Factored| 7)
              (|Mapping| 7 113) (|Factored| 113) (|FactoredFunctions2| 113 7)
              (274 . |map|) (|Factored| 125) (|SparseUnivariatePolynomial| $$)
              (|Mapping| 119 7) (|InnerAlgFactor| 6 7 $$ 125) (280 . |factor|)
              (286 . |factorPolynomial|) (291 . ~=) (297 . |index|)
              (302 . |index|) (307 . |zero?|) (312 . |leadingCoefficient|)
              (317 . |lookup|) (322 . |reductum|) (327 . |lookup|) (|List| 140)
              (|List| 15) (|Symbol|) (|Union| 79 '#1="failed")
              (|Union| 143 '#1#) (|List| 116) (|Fraction| 43) (|SingleInteger|)
              (|Factored| %) (|List| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 147 '"failed")
              (|Record| (|:| |coef| 147) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 153 '"failed") (|Mapping| 6 6) (|Fraction| 7)
              (|InputForm|) (|Union| 15 '"failed") (|OnePointCompletion| 75)
              (|Record| (|:| |factor| 43) (|:| |exponent| 15)) (|List| 160)
              (|Table| 75 15)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Matrix| 43)
              (|Record| (|:| |mat| 164) (|:| |vec| (|Vector| 43)))
              (|Union| 144 '#2="failed") (|Union| 43 '#2#) (|Union| 6 '#2#)
              (|String|))
           '#(~= 332 |zero?| 338 |unitNormal| 343 |unitCanonical| 348 |unit?|
              353 |traceMatrix| 358 |trace| 367 |tableForDiscreteLogarithm| 372
              |subtractIfCan| 377 |squareFreePolynomial| 383 |squareFreePart|
              388 |squareFree| 393 |solveLinearPolynomialEquation| 398
              |smaller?| 404 |sizeLess?| 410 |size| 416 |sample| 420
              |rightRecip| 424 |rightPower| 429 |retractIfCan| 441 |retract|
              456 |represents| 471 |representationType| 482 |rem| 486
              |regularRepresentation| 492 |reducedSystem| 503 |reduce| 525
              |recip| 535 |rank| 540 |random| 544 |quo| 548 |principalIdeal|
              554 |primitiveElement| 559 |primitive?| 563 |primeFrobenius| 568
              |prime?| 579 |plenaryPower| 584 |order| 590 |opposite?| 600
              |one?| 606 |norm| 611 |nextItem| 616 |multiEuclidean| 621
              |minimalPolynomial| 627 |lookup| 632 |lift| 637 |leftRecip| 642
              |leftPower| 647 |lcmCoef| 659 |lcm| 665 |latex| 676 |inv| 681
              |init| 686 |index| 690 |hashUpdate!| 695 |hash| 701 |generator|
              706 |gcdPolynomial| 710 |gcd| 716 |factorsOfCyclicGroupSize| 727
              |factorSquareFreePolynomial| 731 |factorPolynomial| 736 |factor|
              741 |extendedEuclidean| 746 |exquo| 759 |expressIdealMember| 765
              |euclideanSize| 771 |enumerate| 776 |divide| 780 |discriminant|
              786 |discreteLog| 795 |differentiate| 806 |derivationCoordinates|
              856 |definingPolynomial| 862 |createPrimitiveElement| 866
              |coordinates| 870 |convert| 892 |conditionP| 917 |commutator| 922
              |coerce| 928 |charthRoot| 953 |characteristicPolynomial| 963
              |characteristic| 968 |basis| 972 |associator| 976 |associates?|
              983 |antiCommutator| 989 |annihilate?| 995 ^ 1001 |Zero| 1019
              |One| 1023 D 1027 = 1077 / 1083 - 1089 + 1100 * 1106)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 2 2 4 4 16 4 4 4 0 4 0 0 3 3 3 0 0 1 3 3 5
                                  7 13 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0 3 10 0 0
                                  0 0 0 3 3 10 0 0 0 0 0 0 0 0 6 0 0 0 6 2 0 0
                                  0 8 9 11 0 0 0 0 0 0 3 3 3 6 8 9))
            (CONS
             '#(|MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| NIL NIL |DivisionRing&|
                |DifferentialExtension&| |Algebra&| |Algebra&| NIL
                |EntireRing&| |Algebra&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| NIL |NonAssociativeAlgebra&| |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL |Module&|
                NIL NIL |FramedModule&| NIL |NonAssociativeRing&| NIL NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&|
                NIL NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL |RetractableTo&| NIL |SetCategory&|
                |RetractableTo&| |RetractableTo&| |Hashable&| NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|MonogenicAlgebra| 6 7) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| 6 7) (|IntegralDomain|)
                 (|FiniteRankAlgebra| 6 7) (|CommutativeRing|) (|LeftOreRing|)
                 (|DivisionRing|) (|DifferentialExtension| 6) (|Algebra| 6)
                 (|Algebra| $$) (|CharacteristicZero|) (|EntireRing|)
                 (|Algebra| 144) (|CharacteristicNonZero|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 140) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|Rng|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|NonAssociativeAlgebra| 144) (|FullyLinearlyExplicitOver| 6)
                 (|Module| $$) (|Module| 6) (|SemiRng|) (|Module| 144)
                 (|LinearlyExplicitOver| 6) (|BiModule| $$ $$)
                 (|FramedModule| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| 144 144) (|LinearlyExplicitOver| 43)
                 (|RightModule| 6) (|LeftModule| $$) (|LeftModule| 6)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 144)
                 (|RightModule| 144) (|RightModule| 43) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|FullyRetractableTo| 6) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|RetractableTo| 6)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 144)
                 (|RetractableTo| 43) (|Hashable|) (|CoercibleFrom| 6)
                 (|ConvertibleTo| 7) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 50) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|ConvertibleTo| 157) (|CoercibleFrom| 144)
                 (|CoercibleFrom| 43))
              (|makeByteWordVec2| 169
                                  '(1 7 6 0 9 1 6 10 0 11 2 7 0 6 0 14 1 13 15
                                    0 16 0 7 0 18 2 15 10 0 0 20 2 22 0 15 15
                                    23 0 6 0 26 0 6 0 29 2 13 0 6 15 30 0 6 15
                                    32 0 0 15 33 0 6 0 34 0 0 0 37 0 13 0 38 0
                                    13 0 40 2 13 0 6 0 41 2 13 0 43 0 44 1 13 0
                                    43 46 0 7 0 48 1 13 50 0 51 2 13 54 0 0 55
                                    2 13 57 0 0 58 2 13 60 60 0 61 2 0 60 60 0
                                    62 2 13 0 0 0 63 1 13 0 0 65 2 13 0 0 0 67
                                    2 7 6 0 15 69 2 35 6 0 43 71 0 6 15 73 1 77
                                    0 0 78 1 0 7 0 81 1 7 0 0 82 1 0 7 0 83 1 0
                                    22 79 84 1 22 0 0 85 1 22 10 0 86 2 22 35 0
                                    35 87 2 0 35 0 79 88 2 6 57 0 0 89 2 93 90
                                    91 92 94 1 7 22 95 96 2 99 98 91 77 100 2 7
                                    101 95 79 102 1 13 6 0 105 0 106 0 107 2 7
                                    0 6 15 109 0 0 0 111 2 6 0 0 0 112 1 7 113
                                    0 114 1 6 115 116 117 1 7 0 113 118 2 122
                                    119 120 121 123 2 127 124 125 126 128 1 0
                                    115 116 129 2 43 57 0 0 130 1 6 0 75 131 1
                                    0 0 75 132 1 0 57 0 133 1 13 6 0 134 1 6 75
                                    0 135 1 13 0 0 136 1 0 75 0 137 2 0 57 0 0
                                    1 1 0 57 0 133 1 3 149 0 1 1 3 0 0 1 1 3 57
                                    0 1 0 0 22 108 1 0 22 79 1 1 0 6 0 110 1 2
                                    162 43 1 2 0 10 0 0 1 1 16 115 116 1 1 3 0
                                    0 1 1 3 146 0 1 2 16 142 143 116 1 2 6 57 0
                                    0 1 2 3 57 0 0 1 0 6 15 33 0 0 0 1 1 0 10 0
                                    1 2 0 0 0 15 1 2 0 0 0 75 1 1 8 166 0 1 1 9
                                    167 0 1 1 0 168 0 1 1 8 144 0 1 1 9 43 0 1
                                    1 0 6 0 1 1 0 0 35 36 2 0 0 35 79 1 0 2 163
                                    1 2 3 0 0 0 1 1 0 22 0 1 2 0 22 0 79 1 1 10
                                    164 95 1 2 10 165 95 79 1 2 0 101 95 79 103
                                    1 0 22 95 97 1 3 10 156 1 1 0 0 7 56 1 0 10
                                    0 1 0 0 75 76 0 6 0 37 2 3 0 0 0 1 1 3 151
                                    147 1 0 2 0 1 1 2 57 0 1 2 2 0 0 15 1 1 2 0
                                    0 1 1 3 57 0 1 2 0 0 0 75 1 1 2 159 0 1 1 2
                                    75 0 1 2 0 57 0 0 1 1 0 57 0 1 1 0 6 0 1 1
                                    2 10 0 1 2 3 150 147 0 1 1 3 7 0 83 1 6 75
                                    0 137 1 0 7 0 53 1 0 10 0 1 2 0 0 0 15 1 2
                                    0 0 0 75 1 2 3 148 0 0 1 1 3 0 147 1 2 3 0
                                    0 0 1 1 0 169 0 1 1 3 0 0 1 0 2 0 1 1 6 0
                                    75 132 2 11 60 60 0 62 1 11 145 0 1 0 0 0
                                    111 2 3 116 116 116 1 1 3 0 147 1 2 3 0 0 0
                                    1 0 2 161 1 1 16 115 116 1 1 16 115 116 129
                                    1 3 146 0 1 2 3 152 0 0 1 3 3 154 0 0 0 1 2
                                    3 10 0 0 1 2 3 150 147 0 1 1 3 15 0 1 0 6
                                    147 1 2 3 54 0 0 1 0 0 6 104 1 0 6 79 1 2 2
                                    158 0 0 1 1 2 15 0 1 3 12 0 0 140 15 1 3 12
                                    0 0 138 139 1 2 12 0 0 138 1 2 12 0 0 140 1
                                    2 7 0 0 15 1 1 7 0 0 1 2 3 0 0 155 1 3 3 0
                                    0 155 15 1 2 3 22 79 155 1 0 0 7 72 0 2 0 1
                                    1 0 35 0 70 1 0 22 79 84 2 0 22 79 79 1 2 0
                                    35 0 79 88 1 6 157 0 1 1 0 0 7 1 1 0 7 0 1
                                    1 0 35 0 1 1 0 0 35 1 1 17 141 95 1 2 0 0 0
                                    0 1 1 14 0 144 1 1 0 0 0 1 1 0 0 6 49 1 0 0
                                    43 47 1 0 50 0 52 1 18 10 0 1 1 2 0 0 1 1 0
                                    7 0 81 0 0 15 74 0 0 79 80 3 0 0 0 0 0 1 2
                                    3 57 0 0 1 2 0 0 0 0 1 2 0 57 0 0 1 2 3 0 0
                                    43 1 2 0 0 0 15 1 2 0 0 0 75 1 0 0 0 39 0 0
                                    0 19 3 12 0 0 138 139 1 3 12 0 0 140 15 1 2
                                    12 0 0 140 1 2 12 0 0 138 1 2 7 0 0 15 1 1
                                    7 0 0 1 2 3 0 0 155 1 3 3 0 0 155 15 1 2 0
                                    57 0 0 59 2 3 0 0 0 1 1 0 0 0 66 2 0 0 0 0
                                    1 2 0 0 0 0 64 2 3 0 144 0 1 2 3 0 0 144 1
                                    2 10 0 0 43 1 2 0 0 0 6 1 2 0 0 6 0 42 2 0
                                    0 15 0 1 2 0 0 43 0 45 2 0 0 0 0 68 2 0 0
                                    75 0 1)))))
           '|lookupComplete|)) 
