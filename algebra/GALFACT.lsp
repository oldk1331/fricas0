
(SDEFUN |GALFACT;useEisensteinCriterion?;B;1| ((% (|Boolean|))) (QREFELT % 11)) 

(SDEFUN |GALFACT;useEisensteinCriterion;2B;2|
        ((|b| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|#G4| (|Boolean|)) (|#G5| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G4| |b|)
                 (LETT |#G5| (QREFELT % 11))
                 (SETELT % 11 |#G4|)
                 (LETT |b| |#G5|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;tryFunctionalDecomposition?;B;3| ((% (|Boolean|)))
        (QREFELT % 10)) 

(SDEFUN |GALFACT;tryFunctionalDecomposition;2B;4|
        ((|b| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|#G7| (|Boolean|)) (|#G8| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G7| |b|)
                 (LETT |#G8| (QREFELT % 10))
                 (SETELT % 10 |#G7|)
                 (LETT |b| |#G8|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;useSingleFactorBound?;B;5| ((% (|Boolean|))) (QREFELT % 9)) 

(SDEFUN |GALFACT;useSingleFactorBound;2B;6| ((|b| (|Boolean|)) (% (|Boolean|)))
        (SPROG ((|#G10| (|Boolean|)) (|#G11| (|Boolean|)))
               (SEQ
                (PROGN
                 (LETT |#G10| |b|)
                 (LETT |#G11| (QREFELT % 9))
                 (SETELT % 9 |#G10|)
                 (LETT |b| |#G11|))
                (EXIT |b|)))) 

(SDEFUN |GALFACT;stopMusserTrials;Pi;7| ((% (|PositiveInteger|))) (QREFELT % 8)) 

(SDEFUN |GALFACT;stopMusserTrials;2Pi;8|
        ((|n| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((|#G13| (|PositiveInteger|)) (|#G14| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G13| |n|)
                 (LETT |#G14| (QREFELT % 8))
                 (SETELT % 8 |#G13|)
                 (LETT |n| |#G14|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;musserTrials;Pi;9| ((% (|PositiveInteger|))) (QREFELT % 7)) 

(SDEFUN |GALFACT;musserTrials;2Pi;10|
        ((|n| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((|#G16| (|PositiveInteger|)) (|#G17| (|PositiveInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G16| |n|)
                 (LETT |#G17| (QREFELT % 7))
                 (SETELT % 7 |#G16|)
                 (LETT |n| |#G17|))
                (EXIT |n|)))) 

(SDEFUN |GALFACT;eisenstein_test|
        ((|f| (UP)) (|n| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((|c| (|Integer|)) (|lc| #1=(|Integer|)) (|tc| #1#) (|rf| (UP))
          (|p| NIL) (#2=#:G92 NIL) (#3=#:G91 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |rf| (SPADCALL |f| (QREFELT % 24)))
                (LETT |c| (SPADCALL |rf| (QREFELT % 26)))
                (EXIT
                 (COND ((OR (ZEROP |c|) (SPADCALL |c| (QREFELT % 27))) NIL)
                       ('T
                        (SEQ
                         (COND
                          ((> |n| 0)
                           (COND
                            ((OR (> |c| |n|) (> (- |c|) |n|)) (EXIT NIL)))))
                         (LETT |lc| (SPADCALL |f| (QREFELT % 29)))
                         (LETT |tc| |lc|)
                         (SEQ G190
                              (COND
                               ((NULL (NULL (SPADCALL |rf| (QREFELT % 30))))
                                (GO G191)))
                              (SEQ (LETT |tc| (SPADCALL |rf| (QREFELT % 29)))
                                   (EXIT
                                    (LETT |rf|
                                          (SPADCALL |rf| (QREFELT % 24)))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (SEQ (LETT |p| NIL)
                              (LETT #2#
                                    (SPADCALL (SPADCALL |c| (QREFELT % 32))
                                              (QREFELT % 37)))
                              G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |p| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((EQL (QVELT |p| 2) 1)
                                  (COND
                                   ((NULL (ZEROP (REM |lc| (QVELT |p| 1))))
                                    (COND
                                     ((NULL
                                       (ZEROP
                                        (REM |tc| (EXPT (QVELT |p| 1) 2))))
                                      (PROGN
                                       (LETT #3# 'T)
                                       (GO #4=#:G90))))))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))))
          #4# (EXIT #3#)))) 

(SDEFUN |GALFACT;eisensteinIrreducible?;UPB;12| ((|f| (UP)) (% (|Boolean|)))
        (|GALFACT;eisenstein_test| |f| 0 %)) 

(SDEFUN |GALFACT;eisensteinIrreducible2?| ((|f| (UP)) (% (|Boolean|)))
        (|GALFACT;eisenstein_test| |f|
         (* 1000 (EXPT (SPADCALL |f| (QREFELT % 40)) 4)) %)) 

(SDEFUN |GALFACT;numberOfFactors;LNni;14|
        ((|ddlist|
          (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
         (% (|NonNegativeInteger|)))
        (SPROG
         ((|dd| NIL) (#1=#:G104 NIL) (|d| (|Integer|)) (#2=#:G97 NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| 0) (LETT |d| 0)
              (SEQ (LETT |dd| NIL) (LETT #1# |ddlist|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |dd| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |n|
                           (+ |n|
                              (COND
                               ((ZEROP
                                 (LETT |d|
                                       (SPADCALL (QCAR |dd|) (QREFELT % 40))))
                                1)
                               ('T
                                (PROG1
                                    (LETT #2# (|quotient_INT| |d| (QCDR |dd|)))
                                  (|check_subtype2| (>= #2# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #2#))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |n|)))) 

(SDEFUN |GALFACT;shiftSet|
        ((|s| (|Set| (|NonNegativeInteger|))) (|shift| (|NonNegativeInteger|))
         (% (|Set| (|NonNegativeInteger|))))
        (SPROG NIL
               (SPADCALL (CONS #'|GALFACT;shiftSet!0| (VECTOR % |shift|)) |s|
                         (QREFELT % 47)))) 

(SDEFUN |GALFACT;shiftSet!0| ((|e| NIL) ($$ NIL))
        (PROG (|shift| %)
          (LETT |shift| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |shift| (QREFELT % 44)))))) 

(SDEFUN |GALFACT;reductum| ((|n| (|Integer|)) (% (|Integer|)))
        (- |n| (ASH 1 (- (INTEGER-LENGTH |n|) 1)))) 

(SDEFUN |GALFACT;seed| ((|level| (|Integer|)) (% (|Integer|)))
        (- (ASH 1 |level|) 1)) 

(SDEFUN |GALFACT;nextRecNum|
        ((|levels| (|NonNegativeInteger|)) (|level| (|Integer|))
         (|n| (|Integer|)) (% (|Union| (|Integer|) "End of level")))
        (SPROG
         ((|l| #1=(|Integer|)) (#2=#:G119 NIL) (|lr| #1#) (|b| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| (INTEGER-LENGTH |n|))
                 (EXIT
                  (COND
                   ((< |l| |levels|)
                    (PROGN
                     (LETT #2# (CONS 0 (+ |n| (ASH 1 (- |l| 1)))))
                     (GO #3=#:G118))))))
            (EXIT
             (COND
              ((EQL |n| (ASH (|GALFACT;seed| |level| %) (- |levels| |level|)))
               (CONS 1 "End of level"))
              ('T
               (SEQ (LETT |b| 1)
                    (SEQ G190
                         (COND
                          ((NULL
                            (EQL (- |l| |b|)
                                 (LETT |lr|
                                       (INTEGER-LENGTH
                                        (LETT |n|
                                              (|GALFACT;reductum| |n| %))))))
                           (GO G191)))
                         (SEQ (EXIT (LETT |b| (+ |b| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (CONS 0
                           (+ (|GALFACT;reductum| |n| %)
                              (ASH (|GALFACT;seed| (+ |b| 1) %) |lr|))))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |GALFACT;fullSet|
        ((|n| (|NonNegativeInteger|)) (% (|Set| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G123 NIL) (|i| NIL) (#2=#:G124 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (EXIT (LETT #1# (CONS |i| #1#))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 50))))) 

(SDEFUN |GALFACT;is_mod_coprime?|
        ((|pol1| (UP)) (|pol2| (UP)) (|p| (|Integer|)) (|small| (|Boolean|))
         (% (|Boolean|)))
        (SPROG
         ((#1=#:G126 NIL) (|pp| (|PositiveInteger|))
          (|pF|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| %)
                   (|ConvertibleTo| (|Integer|)) (|Canonical|)
                   (CATEGORY |domain| (SIGNATURE |sqrt| (% %)))))
          (|pV|
           (CATEGORY |package|
            (SIGNATURE |degree|
             ((|Integer|) (|PrimitiveArray| (|PrimeField| |pp|))))
            (SIGNATURE |to_mod_pa|
             ((|PrimitiveArray| (|PrimeField| |pp|))
              (|SparseUnivariatePolynomial| (|Integer|))))
            (SIGNATURE |pa_to_sup|
             ((|SparseUnivariatePolynomial| (|Integer|))
              (|PrimitiveArray| (|PrimeField| |pp|))))))
          (|v1| #2=(|PrimitiveArray| (|PrimeField| |pp|))) (|v2| #2#)
          (|mD| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
          (|vg| (|PrimitiveArray| |pF|)))
         (SEQ
          (COND
           (|small|
            (SEQ
             (LETT |v1|
                   (SPADCALL (SPADCALL |pol1| (QREFELT % 52)) |p|
                             (QREFELT % 55)))
             (LETT |v2|
                   (SPADCALL (SPADCALL |pol2| (QREFELT % 52)) |p|
                             (QREFELT % 55)))
             (LETT |vg| (SPADCALL |v1| |v2| |p| (QREFELT % 56)))
             (EXIT (<= (SPADCALL |vg| (QREFELT % 57)) 0))))
           ('T
            (SEQ
             (LETT |pp|
                   (PROG1 (LETT #1# |p|)
                     (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                       '(|Integer|) #1#)))
             (LETT |pF| (|PrimeField| |pp|))
             (LETT |pV| (|VectorPolynomialOperationsP| |pp|))
             (LETT |v1|
                   (SPADCALL (SPADCALL |pol1| (QREFELT % 52))
                             (|compiledLookupCheck| '|to_mod_pa|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Integer|)))
                                                    |pV|)))
             (LETT |v2|
                   (SPADCALL (SPADCALL |pol2| (QREFELT % 52))
                             (|compiledLookupCheck| '|to_mod_pa|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST '|Integer|)))
                                                    |pV|)))
             (LETT |mD| (CONS |p| 1))
             (LETT |vg|
                   (SPADCALL |v1| |v2| |mD|
                             (|compiledLookupCheck| '|gcd|
                                                    (LIST
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                     (LIST '|Record|
                                                           (LIST '|:| '|i_mod|
                                                                 (LIST
                                                                  '|Integer|))
                                                           (LIST '|:| '|deg|
                                                                 (LIST
                                                                  '|Integer|))))
                                                    (|ModularFactorizationTools3|
                                                     |pF|))))
             (EXIT
              (<=
               (SPADCALL |vg|
                         (|compiledLookupCheck| '|degree|
                                                (LIST (LIST '|Integer|)
                                                      (LIST '|PrimitiveArray|
                                                            (LIST '|PrimeField|
                                                                  |pp|)))
                                                |pV|))
               0)))))))) 

(SDEFUN |GALFACT;add_degs|
        ((|deg1| (|NonNegativeInteger|)) (|deg2| (|NonNegativeInteger|))
         (|res| (|List| (|NonNegativeInteger|)))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((|i| NIL) (#1=#:G134 NIL))
               (SEQ
                (COND ((EQL |deg2| 0) |res|)
                      ('T
                       (SEQ
                        (SEQ (LETT |i| 1)
                             (LETT #1# (|quotient_INT| |deg1| |deg2|)) G190
                             (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ (EXIT (LETT |res| (CONS |deg2| |res|))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |res|))))))) 

(SDEFUN |GALFACT;do_separate|
        ((|sfl| (|List| (|Mapping| #1=(|List| (|U32Vector|)))))
         (|c| (|Integer|)) (% (|List| UP)))
        (SPROG
         ((|sf| NIL) (#2=#:G142 NIL) (|vl| #1#) (|v| NIL) (#3=#:G143 NIL)
          (|res| (|List| UP)))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sf| NIL) (LETT #2# |sfl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |sf| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |vl| (SPADCALL |sf|))
                        (EXIT
                         (SEQ (LETT |v| NIL) (LETT #3# |vl|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |v| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (SPADCALL (SPADCALL |v| (QREFELT % 58))
                                                 (QREFELT % 59))
                                       |res|))))
                              (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL |c| (QREFELT % 60)) |res|))))) 

(SDEFUN |GALFACT;do_ddfact|
        ((|pol| (UP)) (|p| (|Integer|)) (|small| (|Boolean|))
         (%
          (|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                    (|:| |separate_factors| (|Mapping| (|List| UP))))))
        (SPROG
         ((|v| (|U32Vector|))
          (|ul1|
           (|List|
            (|Record| (|:| |poly| (|U32Vector|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|U32Vector|)))))))
          (|fr| NIL) (#1=#:G170 NIL) (#2=#:G152 NIL)
          (|sfl| (|List| (|Mapping| (|List| (|U32Vector|))))) (#3=#:G157 NIL)
          (|pp| (|PositiveInteger|))
          (|pF|
           (|Join| (|FiniteFieldCategory|) (|FiniteAlgebraicExtensionField| %)
                   (|ConvertibleTo| (|Integer|)) (|Canonical|)
                   (CATEGORY |domain| (SIGNATURE |sqrt| (% %)))))
          (|pV|
           (CATEGORY |package|
            (SIGNATURE |degree|
             ((|Integer|) (|PrimitiveArray| (|PrimeField| |pp|))))
            (SIGNATURE |to_mod_pa|
             ((|PrimitiveArray| (|PrimeField| |pp|))
              (|SparseUnivariatePolynomial| (|Integer|))))
            (SIGNATURE |pa_to_sup|
             ((|SparseUnivariatePolynomial| (|Integer|))
              (|PrimitiveArray| (|PrimeField| |pp|))))))
          (|vv| (|PrimitiveArray| (|PrimeField| |pp|))) (|dpol| (|Integer|))
          (|c| (|Integer|)) (|ci| (|Integer|)) (|cki| (|pF|))
          (|mD| (|Record| (|:| |i_mod| (|Integer|)) (|:| |deg| (|Integer|))))
          (|uul1|
           (|List|
            (|Record| (|:| |poly| (|PrimitiveArray| |pF|))
                      (|:| |degree| (|NonNegativeInteger|))
                      (|:| |separate_factors|
                           (|Mapping| (|List| (|PrimitiveArray| |pF|)))))))
          (|ffr| NIL) (#4=#:G171 NIL) (#5=#:G163 NIL)
          (|degs| (|List| (|NonNegativeInteger|)))
          (|ssfl| (|List| (|Mapping| (|List| (|PrimitiveArray| |pF|))))))
         (SEQ (LETT |degs| NIL)
              (EXIT
               (COND
                (|small|
                 (SEQ
                  (LETT |v|
                        (SPADCALL (SPADCALL |pol| (QREFELT % 52)) |p|
                                  (QREFELT % 55)))
                  (LETT |dpol| (SPADCALL |v| (QREFELT % 57)))
                  (LETT |c| (ELT_U32 |v| |dpol|))
                  (COND
                   ((SPADCALL |c| 1 (QREFELT % 61))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT % 62)))
                         (EXIT
                          (SPADCALL |v| |dpol| |ci| |p| (QREFELT % 64))))))
                  (LETT |ul1| (SPADCALL |v| |p| (QREFELT % 69)))
                  (LETT |sfl| NIL)
                  (SEQ (LETT |fr| NIL) (LETT #1# |ul1|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |fr| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #2#
                                         (SPADCALL (QVELT |fr| 0)
                                                   (QREFELT % 57)))
                                 (|check_subtype2| (>= #2# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #2#))
                               (QVELT |fr| 1) |degs| %))
                        (EXIT (LETT |sfl| (CONS (QVELT |fr| 2) |sfl|))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!0|
                               (VECTOR % |c| |sfl|))))))
                ('T
                 (SEQ
                  (LETT |pp|
                        (PROG1 (LETT #3# |p|)
                          (|check_subtype2| (> #3# 0) '(|PositiveInteger|)
                                            '(|Integer|) #3#)))
                  (LETT |pF| (|PrimeField| |pp|))
                  (LETT |pV| (|VectorPolynomialOperationsP| |pp|))
                  (LETT |vv|
                        (SPADCALL (SPADCALL |pol| (QREFELT % 52))
                                  (|compiledLookupCheck| '|to_mod_pa|
                                                         (LIST
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|))
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (LIST '|Integer|)))
                                                         |pV|)))
                  (LETT |dpol|
                        (SPADCALL |vv|
                                  (|compiledLookupCheck| '|degree|
                                                         (LIST
                                                          (LIST '|Integer|)
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|)))
                                                         |pV|)))
                  (LETT |c|
                        (SPADCALL (QAREF1 |vv| |dpol|)
                                  (|compiledLookupCheck| '|convert|
                                                         (LIST
                                                          (LIST '|Integer|) '%)
                                                         |pF|)))
                  (COND
                   ((SPADCALL |c| 1 (QREFELT % 61))
                    (SEQ (LETT |ci| (SPADCALL |c| |p| (QREFELT % 62)))
                         (LETT |cki|
                               (SPADCALL |ci|
                                         (|compiledLookupCheck| '|coerce|
                                                                (LIST '%
                                                                      (LIST
                                                                       '|Integer|))
                                                                |pF|)))
                         (EXIT
                          (SPADCALL |vv| |dpol| |cki|
                                    (|compiledLookupCheck| '|mul_by_scalar|
                                                           (LIST (LIST '|Void|)
                                                                 (LIST
                                                                  '|PrimitiveArray|
                                                                  (|devaluate|
                                                                   |pF|))
                                                                 (LIST
                                                                  '|Integer|)
                                                                 (|devaluate|
                                                                  |pF|))
                                                           (|ModularFactorizationTools3|
                                                            |pF|)))))))
                  (LETT |mD| (CONS |p| 1))
                  (LETT |uul1|
                        (SPADCALL |vv| |mD|
                                  (|compiledLookupCheck| '|ddfact|
                                                         (LIST
                                                          (LIST '|List|
                                                                (LIST '|Record|
                                                                      (LIST
                                                                       '|:|
                                                                       '|poly|
                                                                       (LIST
                                                                        '|PrimitiveArray|
                                                                        (|devaluate|
                                                                         |pF|)))
                                                                      (LIST
                                                                       '|:|
                                                                       '|degree|
                                                                       (LIST
                                                                        '|NonNegativeInteger|))
                                                                      (LIST
                                                                       '|:|
                                                                       '|separate_factors|
                                                                       (LIST
                                                                        '|Mapping|
                                                                        (LIST
                                                                         '|List|
                                                                         (LIST
                                                                          '|PrimitiveArray|
                                                                          (|devaluate|
                                                                           |pF|)))))))
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (|devaluate| |pF|))
                                                          (LIST '|Record|
                                                                (LIST '|:|
                                                                      '|i_mod|
                                                                      (LIST
                                                                       '|Integer|))
                                                                (LIST '|:|
                                                                      '|deg|
                                                                      (LIST
                                                                       '|Integer|))))
                                                         (|ModularFactorizationK|
                                                          |pF|))))
                  (LETT |ssfl| NIL)
                  (SEQ (LETT |ffr| NIL) (LETT #4# |uul1|) G190
                       (COND
                        ((OR (ATOM #4#) (PROGN (LETT |ffr| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |degs|
                              (|GALFACT;add_degs|
                               (PROG1
                                   (LETT #5#
                                         (SPADCALL (QVELT |ffr| 0)
                                                   (|compiledLookupCheck|
                                                    '|degree|
                                                    (LIST (LIST '|Integer|)
                                                          (LIST
                                                           '|PrimitiveArray|
                                                           (LIST '|PrimeField|
                                                                 |pp|)))
                                                    |pV|)))
                                 (|check_subtype2| (>= #5# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #5#))
                               (QVELT |ffr| 1) |degs| %))
                        (EXIT (LETT |ssfl| (CONS (QVELT |ffr| 2) |ssfl|))))
                       (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (CONS |degs|
                         (CONS #'|GALFACT;do_ddfact!1|
                               (VECTOR |pp| % |c| |ssfl|))))))))))) 

(SDEFUN |GALFACT;do_ddfact!1| (($$ NIL))
        (PROG (|ssfl| |c| % |pp|)
          (LETT |ssfl| (QREFELT $$ 3))
          (LETT |c| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |pp| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |ssfl| |c|
                      (|compiledLookupCheck| '|separate_factors|
                                             (LIST
                                              (LIST '|List|
                                                    (|devaluate| (ELT % 6)))
                                              (LIST '|List|
                                                    (LIST '|Mapping|
                                                          (LIST '|List|
                                                                (LIST
                                                                 '|PrimitiveArray|
                                                                 (LIST
                                                                  '|PrimeField|
                                                                  |pp|)))))
                                              (LIST '|Integer|))
                                             (|GaloisGroupFactorizerSeparate|
                                              |pp| (ELT % 6)))))))) 

(SDEFUN |GALFACT;do_ddfact!0| (($$ NIL))
        (PROG (|sfl| |c| %)
          (LETT |sfl| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GALFACT;do_separate| |sfl| |c| %))))) 

(SDEFUN |GALFACT;modularFactor;UPSR;24|
        ((|p| (UP)) (|d| (|Set| (|NonNegativeInteger|)))
         (% (|Record| (|:| |prime| (|Integer|)) (|:| |factors| (|List| UP)))))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|))
          (|dirred| (|Set| (|NonNegativeInteger|)))
          (|degfact| (|NonNegativeInteger|)) (|degp| #1#) (|diffp| (UP))
          (|i| NIL) (#2=#:G192 NIL) (|small| (|Boolean|))
          (|dd_res1|
           #3=(|Record| (|:| |dd_list| (|List| (|NonNegativeInteger|)))
                        (|:| |separate_factors| (|Mapping| (|List| UP)))))
          (|ddlist| (|List| (|NonNegativeInteger|))) (#4=#:G193 NIL)
          (|s| (|Set| (|NonNegativeInteger|))) (#5=#:G191 NIL)
          (|nf1| (|NonNegativeInteger|)) (|nf| (|NonNegativeInteger|))
          (|dd_res| #3#) (|res_prime| (|Integer|)) (|cprime| (|Integer|))
          (|fl| (|List| UP)))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (ABS (SPADCALL |p| (QREFELT % 26))) 1))
             (|error| "modularFactor: the polynomial is not primitive."))
            ('T
             (COND
              ((ZEROP (LETT |n| (SPADCALL |p| (QREFELT % 40))))
               (CONS 0 (LIST |p|)))
              ('T
               (SEQ (LETT |cprime| 2)
                    (LETT |dirred| (SPADCALL (LIST 0 |n|) (QREFELT % 50)))
                    (LETT |s| (SPADCALL (QREFELT % 70))) (LETT |ddlist| NIL)
                    (LETT |degfact| 0)
                    (LETT |degp| (SPADCALL |p| (QREFELT % 40)))
                    (LETT |nf| (+ (+ |degp| (QREFELT % 8)) 1))
                    (LETT |diffp| (SPADCALL |p| (QREFELT % 71)))
                    (LETT |small| 'T)
                    (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((> |nf| (QREFELT % 8))
                             (SEQ
                              (COND
                               (|small|
                                (COND
                                 ((NULL
                                   (< (* (* |degp| |cprime|) |cprime|)
                                      18446744073709551616))
                                  (LETT |small| NIL)))))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND
                                       ((ZEROP
                                         (REM (SPADCALL |p| (QREFELT % 29))
                                              |cprime|))
                                        'T)
                                       ('T
                                        (NULL
                                         (|GALFACT;is_mod_coprime?| |p| |diffp|
                                          |cprime| |small| %)))))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |cprime|
                                           (SPADCALL |cprime|
                                                     (QREFELT % 73)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |dd_res1|
                                    (|GALFACT;do_ddfact| |p| |cprime| |small|
                                     %))
                              (LETT |ddlist| (QCAR |dd_res1|))
                              (LETT |s| (SPADCALL (LIST 0) (QREFELT % 50)))
                              (SEQ (LETT #4# |ddlist|) G190
                                   (COND
                                    ((OR (ATOM #4#)
                                         (PROGN
                                          (LETT |degfact| (CAR #4#))
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |s|
                                           (SPADCALL |s|
                                                     (|GALFACT;shiftSet| |s|
                                                      |degfact| %)
                                                     (QREFELT % 74)))))
                                   (LETT #4# (CDR #4#)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |d| (SPADCALL |d| |s| (QREFELT % 75)))
                              (EXIT
                               (COND
                                ((SPADCALL |d| |dirred| (QREFELT % 76))
                                 (PROGN
                                  (LETT #5# (CONS 0 (LIST |p|)))
                                  (GO #6=#:G190)))
                                ('T
                                 (SEQ
                                  (LETT |nf1|
                                        (SPADCALL |ddlist| (QREFELT % 77)))
                                  (COND
                                   ((< |nf1| |nf|)
                                    (SEQ (LETT |nf| |nf1|)
                                         (LETT |dd_res| |dd_res1|)
                                         (EXIT (LETT |res_prime| |cprime|))))
                                   ((EQL |nf1| |nf|)
                                    (COND
                                     ((> |cprime| |res_prime|)
                                      (SEQ (LETT |nf| |nf1|)
                                           (LETT |dd_res| |dd_res1|)
                                           (EXIT
                                            (LETT |res_prime| |cprime|)))))))
                                  (EXIT
                                   (LETT |cprime|
                                         (SPADCALL |cprime|
                                                   (QREFELT % 73)))))))))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |fl| (SPADCALL (QCDR |dd_res|)))
                    (EXIT (CONS |res_prime| |fl|))))))))
          #6# (EXIT #5#)))) 

(SDEFUN |GALFACT;degreePartition;LM;25|
        ((|ddlist|
          (|List| (|Record| (|:| |factor| UP) (|:| |degree| (|Integer|)))))
         (% (|Multiset| (|NonNegativeInteger|))))
        (SPROG
         ((|f| NIL) (#1=#:G202 NIL) (|d| #2=(|NonNegativeInteger|))
          (#3=#:G196 NIL) (|dd| #2#)
          (|dp| (|Multiset| (|NonNegativeInteger|))))
         (SEQ (LETT |dp| (SPADCALL (QREFELT % 81))) (LETT |d| 0) (LETT |dd| 0)
              (SEQ (LETT |f| NIL) (LETT #1# |ddlist|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((ZEROP (LETT |d| (SPADCALL (QCAR |f|) (QREFELT % 40))))
                       (LETT |dp| (SPADCALL 0 |dp| (QREFELT % 82))))
                      ('T
                       (SEQ
                        (LETT |dd|
                              (PROG1 (LETT #3# (QCDR |f|))
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#)))
                        (EXIT
                         (LETT |dp|
                               (SPADCALL |dd| |dp| (|quotient_INT| |d| |dd|)
                                         (QREFELT % 83)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |dp|)))) 

(SDEFUN |GALFACT;sel_set|
        ((|d| (|Set| (|NonNegativeInteger|))) (|n| (|NonNegativeInteger|))
         (|m| (|NonNegativeInteger|)) (% (|Set| (|NonNegativeInteger|))))
        (SPROG ((|nm| (|NonNegativeInteger|)))
               (SEQ
                (COND ((EQL |n| 0) (SPADCALL (LIST 0) (QREFELT % 50)))
                      ('T
                       (SEQ (LETT |nm| (* |n| |m|))
                            (EXIT
                             (SPADCALL
                              (CONS #'|GALFACT;sel_set!0| (VECTOR |n| % |nm|))
                              |d| (QREFELT % 90))))))))) 

(SDEFUN |GALFACT;sel_set!0| ((|x| NIL) ($$ NIL))
        (PROG (|nm| % |n|)
          (LETT |nm| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |x| |nm| (QREFELT % 85))
              (SPADCALL (SPADCALL |x| |n| (QREFELT % 86)) (|spadConstant| % 87)
                        (QREFELT % 88)))
             ('T NIL)))))) 

(SDEFUN |GALFACT;henselfact|
        ((|f| (UP)) (|pdecomp| (|Boolean|))
         (|d| (|Set| (|NonNegativeInteger|))) (% #1=(|List| UP)))
        (SPROG
         ((#2=#:G227 NIL)
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|m|
           (|Record| (|:| |prime| #3=(|Integer|)) (|:| |factors| (|List| UP))))
          (|cprime| #3#) (#4=#:G218 NIL) (|b| (|PositiveInteger|))
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|dh| (|NonNegativeInteger|)) (|d1| (|Set| (|NonNegativeInteger|)))
          (|g| NIL) (#5=#:G228 NIL) (#6=#:G223 #1#) (#7=#:G221 #1#)
          (#8=#:G222 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |f| (QREFELT % 92))
              (PROGN (LETT #2# (LIST |f|)) (GO #9=#:G226)))
             ((QREFELT % 11)
              (COND
               ((|GALFACT;eisensteinIrreducible2?| |f| %)
                (PROGN (LETT #2# (LIST |f|)) (GO #9#))))))
            (COND
             (|pdecomp|
              (COND ((QREFELT % 10) (LETT |cf| (SPADCALL |f| (QREFELT % 96))))
                    (#10='T (LETT |cf| (CONS 1 #11="failed")))))
             (#10# (LETT |cf| (CONS 1 #11#))))
            (EXIT
             (COND
              ((QEQCAR |cf| 1)
               (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT % 79)))
                    (EXIT
                     (COND ((ZEROP (LETT |cprime| (QCAR |m|))) (QCDR |m|))
                           (#10#
                            (SEQ
                             (LETT |b|
                                   (PROG1
                                       (LETT #4#
                                             (*
                                              (* 2
                                                 (SPADCALL |f| (QREFELT % 29)))
                                              (SPADCALL |f| (QREFELT % 98))))
                                     (|check_subtype2| (> #4# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #4#)))
                             (EXIT
                              (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                        (QREFELT % 101)))))))))
              (#10#
               (SEQ (LETT |lrf| (QCDR |cf|))
                    (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT % 40)))
                    (LETT |d1| (|GALFACT;divideSet| |d| |dh| %))
                    (EXIT
                     (PROGN
                      (LETT #8# NIL)
                      (SEQ (LETT |g| NIL)
                           (LETT #5#
                                 (|GALFACT;henselfact| (QCAR |lrf|) 'T |d1| %))
                           G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #6#
                                    (|GALFACT;henselfact|
                                     (SPADCALL |g| (QCDR |lrf|)
                                               (QREFELT % 102))
                                     NIL
                                     (|GALFACT;sel_set| |d|
                                      (SPADCALL |g| (QREFELT % 40)) |dh| %)
                                     %))
                              (COND
                               (#8#
                                (LETT #7# (SPADCALL #7# #6# (QREFELT % 103))))
                               ('T (PROGN (LETT #7# #6#) (LETT #8# 'T)))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (COND (#8# #7#) (#10# NIL))))))))))
          #9# (EXIT #2#)))) 

(SDEFUN |GALFACT;henselfact1|
        ((|f| (UP)) (|pdecomp| (|Boolean|)) (% (|List| UP)))
        (|GALFACT;henselfact| |f| |pdecomp|
         (|GALFACT;fullSet| (SPADCALL |f| (QREFELT % 40)) %) %)) 

(SDEFUN |GALFACT;completeFactor|
        ((|f| (UP)) (|lf| (|List| UP)) (|cprime| (|Integer|))
         (|pk| (|PositiveInteger|)) (|r| (|NonNegativeInteger|))
         (|d| (|Set| (|NonNegativeInteger|))) (% (|List| UP)))
        (SPROG
         ((#1=#:G111 NIL) (|i| (|Integer|)) (#2=#:G304 NIL)
          (|degg| #3=(|NonNegativeInteger|)) (|g0| (|Integer|)) (#4=#:G305 NIL)
          (|g| (UP)) (|f1| (|Union| UP "failed")) (|j| NIL) (#5=#:G306 NIL)
          (|nb| (|Integer|)) (#6=#:G254 NIL) (#7=#:G256 NIL) (|lc| (|Integer|))
          (|f0| (|Integer|)) (|dg| (|Set| (|NonNegativeInteger|)))
          (#8=#:G266 NIL) (|rg| #3#) (#9=#:G267 NIL) (#10=#:G269 NIL)
          (#11=#:G272 NIL) (|gpk| (|PositiveInteger|)) (|lg| #12=(|List| UP))
          (#13=#:G285 NIL) (|degf| #3#) (|ltrue| #12#) (#14=#:G288 NIL)
          (|b| (|PositiveInteger|))
          (|llg|
           (|Record| (|:| |plist| (|List| UP)) (|:| |modulo| (|Integer|))))
          (#15=#:G289 NIL) (#16=#:G303 NIL)
          (|ic| (|Union| (|Integer|) "End of level"))
          (|levels| (|NonNegativeInteger|)) (|found?| (|Boolean|))
          (|level| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lc| (SPADCALL |f| (QREFELT % 29)))
                (LETT |f0| (SPADCALL |f| 0 (QREFELT % 104))) (LETT |ltrue| NIL)
                (LETT |found?| 'T) (LETT |degf| 0) (LETT |degg| 0)
                (LETT |g0| 0) (LETT |g| (|spadConstant| % 28)) (LETT |rg| 0)
                (LETT |nb| 0) (LETT |lg| NIL) (LETT |b| 1)
                (LETT |dg| (SPADCALL (QREFELT % 70))) (LETT |llg| (CONS NIL 0))
                (LETT |levels| (LENGTH |lf|)) (LETT |level| 1)
                (LETT |ic| (CONS 0 0)) (LETT |i| 0)
                (SEQ G190 (COND ((NULL (< |level| |levels|)) (GO G191)))
                     (SEQ (LETT |ic| (CONS 0 (|GALFACT;seed| |level| %)))
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND (|found?| NIL) ('T (QEQCAR |ic| 0))))
                                 (GO G191)))
                               (SEQ
                                (LETT |i|
                                      (PROG2 (LETT #1# |ic|)
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (|Integer|)
                                                        (|Union| (|Integer|)
                                                                 "End of level")
                                                        #1#)))
                                (LETT |degg| 0) (LETT |g0| 1)
                                (SEQ (LETT |j| 1) (LETT #2# |levels|) G190
                                     (COND ((|greater_SI| |j| #2#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (COND
                                        ((SPADCALL |i| (- |j| 1)
                                                   (QREFELT % 105))
                                         (SEQ
                                          (LETT |degg|
                                                (+ |degg|
                                                   (SPADCALL
                                                    (SPADCALL |lf| |j|
                                                              (QREFELT % 106))
                                                    (QREFELT % 40))))
                                          (EXIT
                                           (LETT |g0|
                                                 (* |g0|
                                                    (SPADCALL
                                                     (SPADCALL |lf| |j|
                                                               (QREFELT % 106))
                                                     0 (QREFELT % 104))))))))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))
                                (LETT |g0|
                                      (SPADCALL (* |lc| |g0|) |pk|
                                                (QREFELT % 107)))
                                (COND
                                 ((SPADCALL |degg| |d| (QREFELT % 108))
                                  (COND
                                   ((QEQCAR (|exquo_INT| (* |lc| |f0|) |g0|) 0)
                                    (SEQ
                                     (LETT |g| (SPADCALL |lc| (QREFELT % 60)))
                                     (SEQ (LETT |j| 1) (LETT #4# |levels|) G190
                                          (COND
                                           ((|greater_SI| |j| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |i| (- |j| 1)
                                                        (QREFELT % 105))
                                              (LETT |g|
                                                    (SPADCALL |g|
                                                              (SPADCALL |lf|
                                                                        |j|
                                                                        (QREFELT
                                                                         %
                                                                         106))
                                                              (QREFELT %
                                                                       109)))))))
                                          (LETT |j| (|inc_SI| |j|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (LETT |g|
                                           (SPADCALL
                                            (SPADCALL |g| |pk| (QREFELT % 110))
                                            (QREFELT % 111)))
                                     (LETT |f1|
                                           (SPADCALL |f| |g| (QREFELT % 113)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |f1| 0)
                                        (SEQ (LETT |found?| 'T) (LETT |nb| 1)
                                             (SEQ (LETT |j| 1)
                                                  (LETT #5# |levels|) G190
                                                  (COND
                                                   ((|greater_SI| |j| #5#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (COND
                                                     ((SPADCALL |i| (- |j| 1)
                                                                (QREFELT %
                                                                         105))
                                                      (SEQ
                                                       (SPADCALL |lf| |j| |nb|
                                                                 (QREFELT %
                                                                          114))
                                                       (EXIT
                                                        (LETT |nb|
                                                              (+ |nb| 1))))))))
                                                  (LETT |j| (|inc_SI| |j|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |lg| |lf|)
                                             (LETT |lf|
                                                   (SPADCALL |lf|
                                                             (PROG1
                                                                 (LETT #6#
                                                                       |level|)
                                                               (|check_subtype2|
                                                                (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))
                                                             (QREFELT % 115)))
                                             (SPADCALL
                                              (SPADCALL |lg|
                                                        (PROG1
                                                            (LETT #7#
                                                                  (- |level|
                                                                     1))
                                                          (|check_subtype2|
                                                           (>= #7# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #7#))
                                                        (QREFELT % 115))
                                              NIL (QREFELT % 116))
                                             (LETT |f| (QCDR |f1|))
                                             (LETT |lc|
                                                   (SPADCALL |f|
                                                             (QREFELT % 29)))
                                             (LETT |f0|
                                                   (SPADCALL |f| 0
                                                             (QREFELT % 104)))
                                             (LETT |dg|
                                                   (SPADCALL
                                                    (CONS
                                                     #'|GALFACT;completeFactor!0|
                                                     (VECTOR % |degg|))
                                                    |d| (QREFELT % 90)))
                                             (COND
                                              ((SPADCALL |dg|
                                                         (SPADCALL
                                                          (LIST 0 |degg|)
                                                          (QREFELT % 50))
                                                         (QREFELT % 76))
                                               (LETT |lg| (LIST |g|)))
                                              ('T
                                               (SEQ
                                                (LETT |rg|
                                                      (PROG1
                                                          (LETT #8#
                                                                (MAX 2
                                                                     (-
                                                                      (+ |r|
                                                                         |level|)
                                                                      |levels|)))
                                                        (|check_subtype2|
                                                         (>= #8# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #8#)))
                                                (LETT |b|
                                                      (PROG1
                                                          (LETT #9#
                                                                (*
                                                                 (* 2
                                                                    (SPADCALL
                                                                     |g|
                                                                     (QREFELT %
                                                                              29)))
                                                                 (SPADCALL |g|
                                                                           |rg|
                                                                           (QREFELT
                                                                            %
                                                                            117))))
                                                        (|check_subtype2|
                                                         (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#)))
                                                (EXIT
                                                 (COND
                                                  ((> |b| |pk|)
                                                   (COND
                                                    ((SPADCALL |g|
                                                               (QREFELT % 92))
                                                     (LETT |lg| (LIST |g|)))
                                                    ((QREFELT % 11)
                                                     (COND
                                                      ((|GALFACT;eisensteinIrreducible2?|
                                                        |g| %)
                                                       (LETT |lg| (LIST |g|)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |llg|
                                                              (SPADCALL |g|
                                                                        |lg|
                                                                        |cprime|
                                                                        |b|
                                                                        (QREFELT
                                                                         %
                                                                         119)))
                                                        (LETT |gpk|
                                                              (PROG1
                                                                  (LETT #10#
                                                                        (QCDR
                                                                         |llg|))
                                                                (|check_subtype2|
                                                                 (> #10# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|Integer|)
                                                                 #10#)))
                                                        (EXIT
                                                         (COND
                                                          ((< |gpk| |b|)
                                                           (LETT |lg|
                                                                 (QCAR |llg|)))
                                                          ('T
                                                           (LETT |lg|
                                                                 (|GALFACT;completeFactor|
                                                                  |g|
                                                                  (QCAR |llg|)
                                                                  |cprime|
                                                                  |gpk| |rg|
                                                                  |dg|
                                                                  %)))))))))
                                                    ('T
                                                     (SEQ
                                                      (LETT |llg|
                                                            (SPADCALL |g| |lg|
                                                                      |cprime|
                                                                      |b|
                                                                      (QREFELT
                                                                       % 119)))
                                                      (LETT |gpk|
                                                            (PROG1
                                                                (LETT #11#
                                                                      (QCDR
                                                                       |llg|))
                                                              (|check_subtype2|
                                                               (> #11# 0)
                                                               '(|PositiveInteger|)
                                                               '(|Integer|)
                                                               #11#)))
                                                      (EXIT
                                                       (COND
                                                        ((< |gpk| |b|)
                                                         (LETT |lg|
                                                               (QCAR |llg|)))
                                                        ('T
                                                         (LETT |lg|
                                                               (|GALFACT;completeFactor|
                                                                |g|
                                                                (QCAR |llg|)
                                                                |cprime| |gpk|
                                                                |rg| |dg|
                                                                %)))))))))
                                                  ('T
                                                   (LETT |lg| (LIST |g|))))))))
                                             (LETT |ltrue|
                                                   (SPADCALL |ltrue| |lg|
                                                             (QREFELT % 103)))
                                             (LETT |r|
                                                   (PROG1
                                                       (LETT #13#
                                                             (MAX 2
                                                                  (- |r|
                                                                     (LENGTH
                                                                      |lg|))))
                                                     (|check_subtype2|
                                                      (>= #13# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #13#)))
                                             (LETT |degf|
                                                   (SPADCALL |f|
                                                             (QREFELT % 40)))
                                             (LETT |d|
                                                   (SPADCALL
                                                    (CONS
                                                     #'|GALFACT;completeFactor!1|
                                                     (VECTOR % |degf|))
                                                    |d| (QREFELT % 90)))
                                             (EXIT
                                              (COND
                                               ((<= |degf| 1)
                                                (SEQ
                                                 (COND
                                                  ((EQL |degf| 1)
                                                   (LETT |ltrue|
                                                         (CONS |f| |ltrue|))))
                                                 (EXIT
                                                  (PROGN
                                                   (LETT #16# |ltrue|)
                                                   (GO #17=#:G302)))))
                                               ('T
                                                (SEQ
                                                 (LETT |b|
                                                       (PROG1
                                                           (LETT #14#
                                                                 (* (* 2 |lc|)
                                                                    (SPADCALL
                                                                     |f| |r|
                                                                     (QREFELT %
                                                                              117))))
                                                         (|check_subtype2|
                                                          (> #14# 0)
                                                          '(|PositiveInteger|)
                                                          '(|Integer|) #14#)))
                                                 (EXIT
                                                  (COND
                                                   ((> |b| |pk|)
                                                    (SEQ
                                                     (LETT |llg|
                                                           (SPADCALL |f| |lf|
                                                                     |cprime|
                                                                     |b|
                                                                     (QREFELT %
                                                                              119)))
                                                     (LETT |lf| (QCAR |llg|))
                                                     (LETT |pk|
                                                           (PROG1
                                                               (LETT #15#
                                                                     (QCDR
                                                                      |llg|))
                                                             (|check_subtype2|
                                                              (> #15# 0)
                                                              '(|PositiveInteger|)
                                                              '(|Integer|)
                                                              #15#)))
                                                     (COND
                                                      ((< |pk| |b|)
                                                       (PROGN
                                                        (LETT #16#
                                                              (SPADCALL |lf|
                                                                        |ltrue|
                                                                        (QREFELT
                                                                         %
                                                                         103)))
                                                        (GO #17#))))
                                                     (EXIT
                                                      (LETT |level|
                                                            1)))))))))))))))))))
                                (EXIT
                                 (LETT |ic|
                                       (|GALFACT;nextRecNum| |levels| |level|
                                        |i| %))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (COND
                           (|found?|
                            (SEQ (LETT |levels| (LENGTH |lf|))
                                 (EXIT (LETT |found?| NIL)))))
                          (EXIT
                           (COND
                            ((NULL (QEQCAR |ic| 0))
                             (LETT |level| (+ |level| 1))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |f| |ltrue|))))
          #17# (EXIT #16#)))) 

(SDEFUN |GALFACT;completeFactor!1| ((|x| NIL) ($$ NIL))
        (PROG (|degf| %)
          (LETT |degf| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |degf| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;completeFactor!0| ((|x| NIL) ($$ NIL))
        (PROG (|degg| %)
          (LETT |degg| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |degg| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;divideSet|
        ((|s| (|Set| (|NonNegativeInteger|))) (|n| (|NonNegativeInteger|))
         (% (|Set| (|NonNegativeInteger|))))
        (SPROG
         ((|e| NIL) (#1=#:G315 NIL)
          (|ee| (|Union| (|NonNegativeInteger|) "failed"))
          (|l| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |l| (LIST 0))
              (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |s| (QREFELT % 120)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ee| (|exquo_INT| |e| |n|))
                        (EXIT
                         (COND
                          ((QEQCAR |ee| 0)
                           (LETT |l| (CONS (QCDR |ee|) |l|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |l| (QREFELT % 50)))))) 

(SDEFUN |GALFACT;btwFactor|
        ((|f| (UP)) (|d| (|Set| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) (|pdecomp| (|Boolean|))
         (% #1=(|List| UP)))
        (SPROG
         ((|reverse?| #2=(|Boolean|)) (|negativelc?| #2#)
          (|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|m|
           (|Record| (|:| |prime| #3=(|Integer|)) (|:| |factors| (|List| UP))))
          (|cprime| #3#) (#4=#:G368 NIL) (|lc| (|Integer|)) (#5=#:G329 NIL)
          (|b| (|PositiveInteger|))
          (|lm|
           (|Record| (|:| |plist| #6=(|List| UP)) (|:| |modulo| (|Integer|))))
          (#7=#:G331 NIL) (|pk| (|PositiveInteger|))
          (|lrf| (|Record| (|:| |left| UP) (|:| |right| UP)))
          (|dh| #8=(|NonNegativeInteger|)) (|lg| #1#) (#9=#:G369 NIL)
          (|g| (UP)) (|dg| #8#) (|dgh| (|NonNegativeInteger|)) (#10=#:G337 NIL)
          (|df| #8#) (#11=#:G347 NIL) (|lfg| #1#) (#12=#:G356 NIL)
          (#13=#:G370 NIL) (|fact| NIL) (#14=#:G371 NIL) (|lf| #6#) (|i| NIL)
          (#15=#:G372 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT % 40)))
                (COND
                 ((NULL (EQL (SPADCALL |d| (QREFELT % 121)) |df|))
                  (EXIT (|error| "btwFact: Bad arguments"))))
                (LETT |reverse?| NIL) (LETT |negativelc?| NIL)
                (EXIT
                 (COND
                  ((SPADCALL |d| (SPADCALL (LIST 0 |df|) (QREFELT % 50))
                             (QREFELT % 76))
                   (LIST |f|))
                  (#16='T
                   (SEQ
                    (COND
                     ((< (ABS (SPADCALL |f| 0 (QREFELT % 104)))
                         (ABS (SPADCALL |f| (QREFELT % 29))))
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT % 123)))
                           (EXIT (LETT |reverse?| 'T)))))
                    (COND
                     ((SPADCALL |f| (QREFELT % 92))
                      (EXIT
                       (COND (|reverse?| (LIST (SPADCALL |f| (QREFELT % 123))))
                             (#16# (LIST |f|)))))
                     ((QREFELT % 11)
                      (COND
                       ((|GALFACT;eisensteinIrreducible2?| |f| %)
                        (EXIT
                         (COND
                          (|reverse?| (LIST (SPADCALL |f| (QREFELT % 123))))
                          (#16# (LIST |f|))))))))
                    (COND
                     ((< (SPADCALL |f| (QREFELT % 29)) 0)
                      (SEQ (LETT |f| (SPADCALL |f| (QREFELT % 124)))
                           (EXIT (LETT |negativelc?| 'T)))))
                    (COND
                     (|pdecomp|
                      (COND
                       ((QREFELT % 10)
                        (LETT |cf| (SPADCALL |f| (QREFELT % 96))))
                       (#16# (LETT |cf| (CONS 1 #17="failed")))))
                     (#16# (LETT |cf| (CONS 1 #17#))))
                    (COND
                     ((QEQCAR |cf| 1)
                      (SEQ (LETT |m| (SPADCALL |f| |d| (QREFELT % 79)))
                           (EXIT
                            (COND
                             ((ZEROP (LETT |cprime| (QCAR |m|)))
                              (COND
                               (|reverse?|
                                (COND
                                 (|negativelc?|
                                  (PROGN
                                   (LETT #4#
                                         (LIST
                                          (SPADCALL
                                           (SPADCALL |f| (QREFELT % 123))
                                           (QREFELT % 124))))
                                   (GO #18=#:G367)))
                                 (#16#
                                  (PROGN
                                   (LETT #4#
                                         (LIST (SPADCALL |f| (QREFELT % 123))))
                                   (GO #18#)))))
                               (|negativelc?|
                                (PROGN
                                 (LETT #4#
                                       (LIST (SPADCALL |f| (QREFELT % 124))))
                                 (GO #18#)))
                               (#16# (PROGN (LETT #4# (LIST |f|)) (GO #18#)))))
                             (#16#
                              (SEQ
                               (COND
                                ((SPADCALL |f| (QREFELT % 125))
                                 (LETT |d| (SPADCALL 1 |d| (QREFELT % 126)))))
                               (LETT |lc| (SPADCALL |f| (QREFELT % 29)))
                               (LETT |b|
                                     (PROG1
                                         (LETT #5#
                                               (* (* 2 |lc|)
                                                  (SPADCALL |f| |r|
                                                            (QREFELT % 117))))
                                       (|check_subtype2| (> #5# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #5#)))
                               (LETT |lm|
                                     (SPADCALL |f| (QCDR |m|) |cprime| |b|
                                               (QREFELT % 119)))
                               (LETT |lf| (QCAR |lm|))
                               (LETT |pk|
                                     (PROG1 (LETT #7# (QCDR |lm|))
                                       (|check_subtype2| (> #7# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #7#)))
                               (COND
                                ((SPADCALL (|SPADfirst| |lf|) (QREFELT % 127))
                                 (LETT |lf| (CDR |lf|))))
                               (EXIT
                                (COND
                                 ((NULL (< |pk| |b|))
                                  (LETT |lf|
                                        (|GALFACT;completeFactor| |f| |lf|
                                         |cprime| |pk| |r| |d| %)))))))))))
                     (#16#
                      (SEQ (LETT |lrf| (QCDR |cf|))
                           (LETT |dh| (SPADCALL (QCDR |lrf|) (QREFELT % 40)))
                           (LETT |lg|
                                 (|GALFACT;btwFactor| (QCAR |lrf|)
                                  (|GALFACT;divideSet| |d| |dh| %) 2 'T %))
                           (LETT |lf| NIL)
                           (EXIT
                            (SEQ (LETT |i| 1) (LETT #9# (LENGTH |lg|)) G190
                                 (COND ((|greater_SI| |i| #9#) (GO G191)))
                                 (SEQ
                                  (LETT |g|
                                        (SPADCALL |lg| |i| (QREFELT % 106)))
                                  (LETT |dg| (SPADCALL |g| (QREFELT % 40)))
                                  (LETT |dgh| (* |dg| |dh|))
                                  (LETT |df|
                                        (PROG2
                                            (LETT #10#
                                                  (SPADCALL |df| |dgh|
                                                            (QREFELT % 128)))
                                            (QCDR #10#)
                                          (|check_union2| (QEQCAR #10# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           "failed")
                                                          #10#)))
                                  (LETT |lfg|
                                        (|GALFACT;btwFactor|
                                         (SPADCALL |g| (QCDR |lrf|)
                                                   (QREFELT % 102))
                                         (|GALFACT;sel_set| |d| |dg| |dh| %)
                                         (PROG1
                                             (LETT #11# (MAX 2 (- |r| |df|)))
                                           (|check_subtype2| (>= #11# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #11#))
                                         NIL %))
                                  (LETT |lf|
                                        (SPADCALL |lf| |lfg| (QREFELT % 103)))
                                  (EXIT
                                   (LETT |r|
                                         (PROG1
                                             (LETT #12#
                                                   (MAX 2
                                                        (- |r|
                                                           (LENGTH |lfg|))))
                                           (|check_subtype2| (>= #12# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #12#)))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))))))
                    (COND
                     (|reverse?|
                      (LETT |lf|
                            (PROGN
                             (LETT #13# NIL)
                             (SEQ (LETT |fact| NIL) (LETT #14# |lf|) G190
                                  (COND
                                   ((OR (ATOM #14#)
                                        (PROGN (LETT |fact| (CAR #14#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #13#
                                          (CONS
                                           (SPADCALL |fact| (QREFELT % 123))
                                           #13#))))
                                  (LETT #14# (CDR #14#)) (GO G190) G191
                                  (EXIT (NREVERSE #13#)))))))
                    (SEQ (LETT |i| 1) (LETT #15# (LENGTH |lf|)) G190
                         (COND ((|greater_SI| |i| #15#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((<
                              (SPADCALL (SPADCALL |lf| |i| (QREFELT % 106))
                                        (QREFELT % 29))
                              0)
                             (SPADCALL |lf| |i|
                                       (SPADCALL
                                        (SPADCALL |lf| |i| (QREFELT % 106))
                                        (QREFELT % 124))
                                       (QREFELT % 129))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |lf|)))))))
          #18# (EXIT #4#)))) 

(SDEFUN |GALFACT;makeFR;RF;32|
        ((|flist|
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         (% (|Factored| UP)))
        (SPROG
         ((|ctp| (|Factored| (|Integer|))) (|ff| NIL) (#1=#:G392 NIL)
          (|fc| NIL) (#2=#:G393 NIL)
          (|fflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |ctp| (SPADCALL (QCAR |flist|) (QREFELT % 32)))
              (LETT |fflist| NIL)
              (SEQ (LETT |ff| NIL) (LETT #1# (QCDR |flist|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ff| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |fflist|
                           (CONS
                            (VECTOR (CONS 3 "prime") (QCAR |ff|) (QCDR |ff|))
                            |fflist|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |fc| NIL) (LETT #2# (SPADCALL |ctp| (QREFELT % 37)))
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fc| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |fflist|
                           (CONS
                            (VECTOR (QVELT |fc| 0)
                                    (SPADCALL (QVELT |fc| 1) (QREFELT % 60))
                                    (QVELT |fc| 2))
                            |fflist|))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL |ctp| (QREFELT % 130)) (QREFELT % 60))
                |fflist| (QREFELT % 134)))))) 

(SDEFUN |GALFACT;quadratic| ((|p| (UP)) (% (|List| UP)))
        (SPROG
         ((|r| (|Union| (|Integer|) "failed")) (|d| (|Integer|))
          (|a| (|Integer|)) (|b| (|Integer|)) (|f| (UP)) (#1=#:G402 NIL))
         (SEQ (LETT |a| (SPADCALL |p| (QREFELT % 29)))
              (LETT |b| (SPADCALL |p| 1 (QREFELT % 104)))
              (LETT |d|
                    (- (EXPT |b| 2)
                       (* (* 4 |a|) (SPADCALL |p| 0 (QREFELT % 104)))))
              (LETT |r| (SPADCALL |d| (QREFELT % 140)))
              (EXIT
               (COND ((QEQCAR |r| 1) (LIST |p|))
                     ('T
                      (SEQ (LETT |b| (+ |b| (QCDR |r|))) (LETT |a| (* 2 |a|))
                           (LETT |d| (GCD |a| |b|))
                           (COND
                            ((NULL (EQL |d| 1))
                             (SEQ (LETT |a| (|quotient_INT| |a| |d|))
                                  (EXIT (LETT |b| (|quotient_INT| |b| |d|))))))
                           (LETT |f|
                                 (SPADCALL (SPADCALL |a| 1 (QREFELT % 141))
                                           (SPADCALL |b| 0 (QREFELT % 141))
                                           (QREFELT % 142)))
                           (EXIT
                            (CONS |f|
                                  (LIST
                                   (PROG2
                                       (LETT #1#
                                             (SPADCALL |p| |f|
                                                       (QREFELT % 113)))
                                       (QCDR #1#)
                                     (|check_union2| (QEQCAR #1# 0)
                                                     (QREFELT % 6)
                                                     (|Union| (QREFELT % 6)
                                                              "failed")
                                                     #1#)))))))))))) 

(SDEFUN |GALFACT;isPowerOf2| ((|n| (|Integer|)) (% (|Boolean|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((EQL |n| 1) 'T)
                (#1='T
                 (SEQ (LETT |qr| (|divide_INT| |n| 2))
                      (EXIT
                       (COND ((EQL (QCDR |qr|) 1) NIL)
                             (#1# (|GALFACT;isPowerOf2| (QCAR |qr|) %)))))))))) 

(SDEFUN |GALFACT;subMinusX|
        ((|supPol| (|SparseUnivariatePolynomial| (|Integer|))) (% (UP)))
        (SPROG ((|minusX| (|SparseUnivariatePolynomial| (|Integer|))))
               (SEQ (LETT |minusX| (SPADCALL -1 1 (QREFELT % 143)))
                    (EXIT
                     (SPADCALL (SPADCALL |supPol| |minusX| (QREFELT % 144))
                               (QREFELT % 59)))))) 

(SDEFUN |GALFACT;gen_fact1|
        ((|f| (UP))
         (%
          (|Union|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| UP)
                                     (|:| |pow| (|NonNegativeInteger|))))))
           (|Record| (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| UP)
                                     (|:| |pow| (|NonNegativeInteger|)))))))))
        (SPROG
         ((#1=#:G419 NIL) (|c| (|Integer|)) (|d| (|NonNegativeInteger|))
          (|lcPol| (UP)) (#2=#:G438 NIL)
          (|cfl| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
          (|fac| NIL) (#3=#:G439 NIL)
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|))))))
         (SEQ (LETT |factorlist| NIL) (LETT |c| (SPADCALL |f| (QREFELT % 26)))
              (LETT |f|
                    (PROG2 (LETT #1# (SPADCALL |f| |c| (QREFELT % 145)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                      (|Union| (QREFELT % 6) "failed") #1#)))
              (COND
               ((< (SPADCALL |f| (QREFELT % 29)) 0)
                (SEQ (LETT |c| (- |c|))
                     (EXIT (LETT |f| (SPADCALL |f| (QREFELT % 124)))))))
              (SEQ (LETT |d| (SPADCALL |f| (QREFELT % 146)))
                   (EXIT
                    (COND
                     ((> |d| 0)
                      (SEQ
                       (LETT |f|
                             (QCAR
                              (SPADCALL |f| (SPADCALL 1 |d| (QREFELT % 141))
                                        (QREFELT % 148))))
                       (EXIT
                        (LETT |factorlist|
                              (LIST
                               (CONS (SPADCALL 1 1 (QREFELT % 141))
                                     |d|)))))))))
              (LETT |d| (SPADCALL |f| (QREFELT % 40)))
              (EXIT
               (COND ((ZEROP |d|) (CONS 1 (CONS |c| |factorlist|)))
                     ((EQL |d| 1)
                      (CONS 1 (CONS |c| (CONS (CONS |f| 1) |factorlist|))))
                     (#4='T
                      (SEQ
                       (LETT |lcPol|
                             (SPADCALL (SPADCALL |f| (QREFELT % 29))
                                       (QREFELT % 60)))
                       (EXIT
                        (COND
                         ((SPADCALL (SPADCALL |lcPol| (QREFELT % 124))
                                    (SPADCALL |f| (QREFELT % 24))
                                    (QREFELT % 149))
                          (SEQ (LETT |cfl| (SPADCALL |d| (QREFELT % 152)))
                               (SEQ (LETT |fac| NIL)
                                    (LETT #2#
                                          (SPADCALL (ELT % 59) |cfl|
                                                    (QREFELT % 155)))
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |fac| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS (CONS |fac| 1)
                                                  |factorlist|))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS 1 (CONS |c| |factorlist|)))))
                         ((SPADCALL |lcPol| (SPADCALL |f| (QREFELT % 24))
                                    (QREFELT % 149))
                          (SEQ (LETT |cfl| (SPADCALL |d| (QREFELT % 156)))
                               (SEQ (LETT |fac| NIL)
                                    (LETT #3#
                                          (SPADCALL (ELT % 59) |cfl|
                                                    (QREFELT % 155)))
                                    G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |fac| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |factorlist|
                                            (CONS (CONS |fac| 1)
                                                  |factorlist|))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (CONS 1 (CONS |c| |factorlist|)))))
                         (#4# (CONS 0 (VECTOR |f| |c| |factorlist|)))))))))))) 

(SDEFUN |GALFACT;henselFact;UPBR;37|
        ((|f| (UP)) (|sqf| (|Boolean|))
         (%
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|ru|
           (|Union|
            (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))
            (|Record| (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))))
          (|#G130|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           #1=(|Record| (|:| |irr| UP)
                                        (|:| |pow| (|NonNegativeInteger|)))))))
          (|c| (|Integer|)) (#2=#:G456 NIL) (#3=#:G457 NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| #4=(|NonNegativeInteger|)))))
          (|sqfr| NIL) (#5=#:G458 NIL) (|mult| #4#) (|sqff| (UP))
          (|d| (|NonNegativeInteger|)) (|fl1| (|List| UP)) (#6=#:G459 NIL)
          (|pf| NIL) (#7=#:G460 NIL) (|fla| (|List| #1#))
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|))))))
         (SEQ (LETT |ru| (|GALFACT;gen_fact1| |f| %))
              (EXIT
               (COND ((QEQCAR |ru| 1) (QCDR |ru|))
                     (#8='T
                      (SEQ
                       (PROGN
                        (LETT |#G130| (QCDR |ru|))
                        (LETT |f| (QVELT |#G130| 0))
                        (LETT |c| (QVELT |#G130| 1))
                        (LETT |factorlist| (QVELT |#G130| 2))
                        |#G130|)
                       (EXIT
                        (COND
                         (|sqf|
                          (SEQ
                           (LETT |fla|
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |pf| NIL)
                                       (LETT #3#
                                             (|GALFACT;henselfact1| |f| 'T %))
                                       G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |pf| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2# (CONS (CONS |pf| 1) #2#))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (EXIT
                            (CONS |c|
                                  (SPADCALL |fla| |factorlist|
                                            (QREFELT % 158))))))
                         (#8#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT % 159))
                                           (QREFELT % 160)))
                           (SEQ (LETT |sqfr| NIL) (LETT #5# |sqfflist|) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |sqfr| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                     (LETT |sqff| (QVELT |sqfr| 1))
                                     (LETT |d|
                                           (SPADCALL |sqff| (QREFELT % 40)))
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (LETT |factorlist|
                                              (CONS (CONS |sqff| |mult|)
                                                    |factorlist|)))
                                       ('T
                                        (SEQ
                                         (LETT |fl1|
                                               (COND
                                                ((EQL |d| 2)
                                                 (|GALFACT;quadratic| |sqff|
                                                  %))
                                                ('T
                                                 (|GALFACT;henselfact1| |sqff|
                                                  'T %))))
                                         (LETT |fla|
                                               (PROGN
                                                (LETT #6# NIL)
                                                (SEQ (LETT |pf| NIL)
                                                     (LETT #7# |fl1|) G190
                                                     (COND
                                                      ((OR (ATOM #7#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #7#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #6#
                                                             (CONS
                                                              (CONS |pf|
                                                                    |mult|)
                                                              #6#))))
                                                     (LETT #7# (CDR #7#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #6#)))))
                                         (EXIT
                                          (LETT |factorlist|
                                                (SPADCALL |fla| |factorlist|
                                                          (QREFELT %
                                                                   158)))))))))
                                (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;38|
        ((|f| (UP)) (|sqf| (|Boolean|)) (|fd| (|Set| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |contp| (|Integer|))
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| UP)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|ru|
           (|Union|
            (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))
            (|Record| (|:| |contp| (|Integer|))
                      (|:| |factors|
                           (|List|
                            (|Record| (|:| |irr| UP)
                                      (|:| |pow| (|NonNegativeInteger|))))))))
          (|#G140|
           (|Record| (|:| |f| UP) (|:| |contp| (|Integer|))
                     (|:| |factors|
                          (|List|
                           #1=(|Record| (|:| |irr| UP)
                                        (|:| |pow| (|NonNegativeInteger|)))))))
          (|c| (|Integer|)) (|d1| #2=(|NonNegativeInteger|))
          (|del_d| (|Integer|)) (#3=#:G471 NIL) (#4=#:G497 NIL) (#5=#:G498 NIL)
          (|sqfflist|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| UP)
                      (|:| |exponent| #6=(|NonNegativeInteger|)))))
          (|sqfr| NIL) (#7=#:G499 NIL) (|mult| #6#) (|sqff| (UP)) (|d| #2#)
          (#8=#:G482 NIL) (|fl1| (|List| UP)) (#9=#:G500 NIL) (|pf| NIL)
          (#10=#:G501 NIL) (|fla| (|List| #1#))
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (#11=#:G488 NIL) (|maxd| (|NonNegativeInteger|)))
         (SEQ (LETT |d| (SPADCALL |f| (QREFELT % 40)))
              (COND
               ((NULL (EQL (SPADCALL |fd| (QREFELT % 121)) |d|))
                (EXIT (|error| "btwFact: Bad arguments"))))
              (LETT |ru| (|GALFACT;gen_fact1| |f| %))
              (EXIT
               (COND ((QEQCAR |ru| 1) (QCDR |ru|))
                     (#12='T
                      (SEQ
                       (PROGN
                        (LETT |#G140| (QCDR |ru|))
                        (LETT |f| (QVELT |#G140| 0))
                        (LETT |c| (QVELT |#G140| 1))
                        (LETT |factorlist| (QVELT |#G140| 2))
                        |#G140|)
                       (SEQ (LETT |d1| (SPADCALL |f| (QREFELT % 40)))
                            (EXIT
                             (COND
                              ((< |d1| |d|)
                               (SEQ (LETT |del_d| (- |d| |d1|))
                                    (LETT |r|
                                          (PROG1
                                              (LETT #3#
                                                    (MAX 2 (- |r| |del_d|)))
                                            (|check_subtype2| (>= #3# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #3#)))
                                    (LETT |d| |d1|)
                                    (EXIT
                                     (LETT |fd|
                                           (SPADCALL
                                            (CONS
                                             #'|GALFACT;btwFact;UPBSNniR;38!0|
                                             (VECTOR % |d|))
                                            |fd| (QREFELT % 90)))))))))
                       (EXIT
                        (COND
                         (|sqf|
                          (SEQ
                           (LETT |fla|
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT |pf| NIL)
                                       (LETT #5#
                                             (|GALFACT;btwFactor| |f| |fd| |r|
                                              'T %))
                                       G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN (LETT |pf| (CAR #5#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4# (CONS (CONS |pf| 1) #4#))))
                                       (LETT #5# (CDR #5#)) (GO G190) G191
                                       (EXIT (NREVERSE #4#)))))
                           (EXIT
                            (CONS |c|
                                  (SPADCALL |fla| |factorlist|
                                            (QREFELT % 158))))))
                         (#12#
                          (SEQ
                           (LETT |sqfflist|
                                 (SPADCALL (SPADCALL |f| (QREFELT % 159))
                                           (QREFELT % 160)))
                           (COND
                            ((EQL (LENGTH |sqfflist|) 1)
                             (LETT |r|
                                   (MAX
                                    (|quotient_INT| |r|
                                                    (QVELT
                                                     (|SPADfirst| |sqfflist|)
                                                     2))
                                    2)))
                            (#12# (LETT |r| 2)))
                           (SEQ (LETT |sqfr| NIL) (LETT #7# |sqfflist|) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |sqfr| (CAR #7#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |mult| (QVELT |sqfr| 2))
                                     (LETT |sqff| (QVELT |sqfr| 1))
                                     (LETT |d|
                                           (SPADCALL |sqff| (QREFELT % 40)))
                                     (EXIT
                                      (COND
                                       ((EQL |d| 1)
                                        (SEQ
                                         (LETT |factorlist|
                                               (CONS (CONS |sqff| |mult|)
                                                     |factorlist|))
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #8#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT %
                                                                             121))
                                                          |mult|))
                                                 (|check_subtype2| (>= #8# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #8#)))
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;38!1|
                                                  (VECTOR % |maxd|))
                                                 |fd| (QREFELT % 90))))))
                                       ('T
                                        (SEQ
                                         (LETT |fl1|
                                               (COND
                                                ((EQL |d| 2)
                                                 (|GALFACT;quadratic| |sqff|
                                                  %))
                                                ('T
                                                 (|GALFACT;btwFactor| |sqff|
                                                  (SPADCALL
                                                   (CONS
                                                    #'|GALFACT;btwFact;UPBSNniR;38!2|
                                                    (VECTOR % |d|))
                                                   |fd| (QREFELT % 90))
                                                  |r| 'T %))))
                                         (LETT |fla|
                                               (PROGN
                                                (LETT #9# NIL)
                                                (SEQ (LETT |pf| NIL)
                                                     (LETT #10# |fl1|) G190
                                                     (COND
                                                      ((OR (ATOM #10#)
                                                           (PROGN
                                                            (LETT |pf|
                                                                  (CAR #10#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #9#
                                                             (CONS
                                                              (CONS |pf|
                                                                    |mult|)
                                                              #9#))))
                                                     (LETT #10# (CDR #10#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #9#)))))
                                         (LETT |factorlist|
                                               (SPADCALL |fla| |factorlist|
                                                         (QREFELT % 158)))
                                         (LETT |maxd|
                                               (PROG1
                                                   (LETT #11#
                                                         (-
                                                          (SPADCALL |fd|
                                                                    (QREFELT %
                                                                             121))
                                                          (* |d| |mult|)))
                                                 (|check_subtype2| (>= #11# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #11#)))
                                         (EXIT
                                          (LETT |fd|
                                                (SPADCALL
                                                 (CONS
                                                  #'|GALFACT;btwFact;UPBSNniR;38!3|
                                                  (VECTOR % |maxd|))
                                                 |fd| (QREFELT % 90)))))))))
                                (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |c| |factorlist|))))))))))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;38!3| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| %)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;38!2| ((|x| NIL) ($$ NIL))
        (PROG (|d| %)
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;38!1| ((|x| NIL) ($$ NIL))
        (PROG (|maxd| %)
          (LETT |maxd| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |maxd| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;btwFact;UPBSNniR;38!0| ((|x| NIL) ($$ NIL))
        (PROG (|d| %)
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |d| (QREFELT % 85)))))) 

(SDEFUN |GALFACT;factor;UPF;39| ((|f| (UP)) (% (|Factored| UP)))
        (SPADCALL
         (COND
          ((QREFELT % 9)
           (SPADCALL |f| NIL
                     (|GALFACT;fullSet| (SPADCALL |f| (QREFELT % 40)) %) 2
                     (QREFELT % 162)))
          ('T (SPADCALL |f| NIL (QREFELT % 161))))
         (QREFELT % 137))) 

(SDEFUN |GALFACT;errorsum?|
        ((|d| (|NonNegativeInteger|)) (|ld| (|List| #1=(|NonNegativeInteger|)))
         (% (|Boolean|)))
        (SPROG
         ((#2=#:G0 NIL) (#3=#:G508 NIL) (#4=#:G505 #1#) (#5=#:G503 #1#)
          (#6=#:G504 NIL))
         (SEQ
          (NULL
           (EQL |d|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT #2# NIL) (LETT #3# |ld|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT #2# (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #2#)
                         (COND (#6# (LETT #5# (+ #5# #4#)))
                               ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (COND (#6# #5#) ('T 0)))))))) 

(SDEFUN |GALFACT;makeSet|
        ((|ld| (|List| (|NonNegativeInteger|)))
         (% (|Set| (|NonNegativeInteger|))))
        (SPROG ((|d| NIL) (#1=#:G513 NIL) (|s| (|Set| (|NonNegativeInteger|))))
               (SEQ (LETT |s| (SPADCALL (LIST 0) (QREFELT % 50)))
                    (SEQ (LETT |d| NIL) (LETT #1# |ld|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |s|
                                 (SPADCALL |s| (|GALFACT;shiftSet| |s| |d| %)
                                           (QREFELT % 74)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(SDEFUN |GALFACT;factor;UPLNniF;42|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) (% (|Factored| UP)))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT % 40)) |ld| %)
          (|error| "factor: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| NIL (|GALFACT;makeSet| |ld| %) |r| (QREFELT % 162))
           (QREFELT % 137))))) 

(SDEFUN |GALFACT;factor;UPNniF;43|
        ((|f| (UP)) (|r| (|NonNegativeInteger|)) (% (|Factored| UP)))
        (SPADCALL
         (SPADCALL |f| NIL (|GALFACT;fullSet| (SPADCALL |f| (QREFELT % 40)) %)
                   |r| (QREFELT % 162))
         (QREFELT % 137))) 

(SDEFUN |GALFACT;factor;UPLF;44|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|))) (% (|Factored| UP)))
        (SPADCALL |f| |ld| 2 (QREFELT % 164))) 

(SDEFUN |GALFACT;factor;UP2NniF;45|
        ((|f| (UP)) (|d| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
         (% (|Factored| UP)))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ (LETT |n| (|exquo_INT| (SPADCALL |f| (QREFELT % 40)) |d|))
                    (EXIT
                     (COND ((QEQCAR |n| 1) (|error| "factor: Bad arguments"))
                           ('T
                            (SPADCALL |f|
                                      (SPADCALL (QCDR |n|) |d| (QREFELT % 167))
                                      |r| (QREFELT % 164)))))))) 

(SDEFUN |GALFACT;factorSquareFree;UPF;46| ((|f| (UP)) (% (|Factored| UP)))
        (SPADCALL
         (COND
          ((QREFELT % 9)
           (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT % 40)) %)
                     2 (QREFELT % 162)))
          ('T (SPADCALL |f| 'T (QREFELT % 161))))
         (QREFELT % 137))) 

(SDEFUN |GALFACT;factorSquareFree;UPLNniF;47|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|)))
         (|r| (|NonNegativeInteger|)) (% (|Factored| UP)))
        (COND
         ((|GALFACT;errorsum?| (SPADCALL |f| (QREFELT % 40)) |ld| %)
          (|error| "factorSquareFree: Bad arguments"))
         ('T
          (SPADCALL
           (SPADCALL |f| 'T (|GALFACT;makeSet| |ld| %) |r| (QREFELT % 162))
           (QREFELT % 137))))) 

(SDEFUN |GALFACT;factorSquareFree;UPNniF;48|
        ((|f| (UP)) (|r| (|NonNegativeInteger|)) (% (|Factored| UP)))
        (SPADCALL
         (SPADCALL |f| 'T (|GALFACT;fullSet| (SPADCALL |f| (QREFELT % 40)) %)
                   |r| (QREFELT % 162))
         (QREFELT % 137))) 

(SDEFUN |GALFACT;factorSquareFree;UPLF;49|
        ((|f| (UP)) (|ld| (|List| (|NonNegativeInteger|))) (% (|Factored| UP)))
        (SPADCALL |f| |ld| 2 (QREFELT % 170))) 

(SDEFUN |GALFACT;factorSquareFree;UP2NniF;50|
        ((|f| (UP)) (|d| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|))
         (% (|Factored| UP)))
        (SPROG ((|n| (|Union| (|NonNegativeInteger|) "failed")))
               (SEQ (LETT |n| (|exquo_INT| (SPADCALL |f| (QREFELT % 40)) |d|))
                    (EXIT
                     (COND
                      ((QEQCAR |n| 1)
                       (|error| "factorSquareFree: Bad arguments"))
                      ('T
                       (SPADCALL |f| (SPADCALL (QCDR |n|) |d| (QREFELT % 167))
                                 |r| (QREFELT % 170)))))))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniBU;51|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) (|r| (|NonNegativeInteger|))
         (|sqf| (|Boolean|)) (% (|Union| UP "failed")))
        (SPROG
         ((|dp| (|NonNegativeInteger|))
          (|lf|
           (|List|
            (|Record| (|:| |irr| UP) (|:| |pow| (|NonNegativeInteger|)))))
          (|f| NIL) (#1=#:G549 NIL) (#2=#:G548 NIL) (#3=#:G547 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |dp| (SPADCALL |p| (QREFELT % 40)))
                (EXIT
                 (COND
                  ((|GALFACT;errorsum?| |dp| |ld| %)
                   (|error| "factorOfDegree: Bad arguments"))
                  ('T
                   (SEQ
                    (COND
                     ((EQL |d| 1)
                      (COND
                       ((SPADCALL |p| (QREFELT % 125))
                        (EXIT (CONS 1 "failed"))))))
                    (LETT |lf|
                          (QCDR
                           (SPADCALL |p| |sqf| (|GALFACT;makeSet| |ld| %) |r|
                                     (QREFELT % 162))))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |f| NIL) (LETT #1# |lf|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL (QCAR |f|) (QREFELT % 40)) |d|)
                               (PROGN
                                (LETT #3#
                                      (PROGN
                                       (LETT #2# (CONS 0 (QCAR |f|)))
                                       (GO #4=#:G546)))
                                (GO #5=#:G540))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                     #5# (EXIT #3#))
                    (EXIT (CONS 1 "failed"))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLNniU;52|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) (|r| (|NonNegativeInteger|))
         (% (|Union| UP "failed")))
        (SPADCALL |d| |p| |ld| |r| NIL (QREFELT % 175))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPNniU;53|
        ((|d| (|PositiveInteger|)) (|p| (UP)) (|r| (|NonNegativeInteger|))
         (% (|Union| UP "failed")))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT % 40)) 1 (QREFELT % 167))
                  |r| NIL (QREFELT % 175))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPLU;54|
        ((|d| (|PositiveInteger|)) (|p| (UP))
         (|ld| (|List| (|NonNegativeInteger|))) (% (|Union| UP "failed")))
        (SPADCALL |d| |p| |ld| 2 NIL (QREFELT % 175))) 

(SDEFUN |GALFACT;factorOfDegree;PiUPU;55|
        ((|d| (|PositiveInteger|)) (|p| (UP)) (% (|Union| UP "failed")))
        (SPADCALL |d| |p|
                  (SPADCALL (SPADCALL |p| (QREFELT % 40)) 1 (QREFELT % 167)) 2
                  NIL (QREFELT % 175))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizer;|)) 

(DEFUN |GaloisGroupFactorizer;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GaloisGroupFactorizer| DV$1))
          (LETT % (GETREFV 180))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GaloisGroupFactorizer| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 5)
          (QSETREFV % 8 8)
          (QSETREFV % 9 'T)
          (QSETREFV % 10 'T)
          (QSETREFV % 11 'T)
          %))) 

(DEFUN |GaloisGroupFactorizer| (#1=#:G566)
  (SPROG NIL
         (PROG (#2=#:G567)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupFactorizer|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GaloisGroupFactorizer;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GaloisGroupFactorizer|)))))))))) 

(MAKEPROP '|GaloisGroupFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|mussertrials|
              '|stopmussertrials| '|usesinglefactorbound|
              '|tryfunctionaldecomposition| '|useeisensteincriterion|
              (|Boolean|) |GALFACT;useEisensteinCriterion?;B;1|
              |GALFACT;useEisensteinCriterion;2B;2|
              |GALFACT;tryFunctionalDecomposition?;B;3|
              |GALFACT;tryFunctionalDecomposition;2B;4|
              |GALFACT;useSingleFactorBound?;B;5|
              |GALFACT;useSingleFactorBound;2B;6| (|PositiveInteger|)
              |GALFACT;stopMusserTrials;Pi;7| |GALFACT;stopMusserTrials;2Pi;8|
              |GALFACT;musserTrials;Pi;9| |GALFACT;musserTrials;2Pi;10|
              (0 . |reductum|) (|Integer|) (5 . |content|) (10 . |unit?|)
              (15 . |0|) (19 . |leadingCoefficient|) (24 . |zero?|)
              (|Factored| %) (29 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 33) (|:| |factor| 25) (|:| |exponent| 39))
              (|List| 34) (|Factored| 25) (34 . |factorList|)
              |GALFACT;eisensteinIrreducible?;UPB;12| (|NonNegativeInteger|)
              (39 . |degree|) (|Record| (|:| |factor| 6) (|:| |degree| 25))
              (|List| 41) |GALFACT;numberOfFactors;LNni;14| (44 . +)
              (|Mapping| 39 39) (|Set| 39) (50 . |map|) (56 . |1|) (|List| 39)
              (60 . |set|) (|SparseUnivariatePolynomial| 25) (65 . |makeSUP|)
              (|U32Vector|) (|U32VectorPolynomialOperations|)
              (70 . |to_mod_pa|) (76 . |gcd|) (83 . |degree|)
              (88 . |pa_to_sup|) (93 . |unmakeSUP|) (98 . |coerce|) (103 . ~=)
              (109 . |invmod|) (|Void|) (115 . |mul_by_scalar|)
              (|Mapping| (|List| 53))
              (|Record| (|:| |poly| 53) (|:| |degree| 39)
                        (|:| |separate_factors| 65))
              (|List| 66) (|ModularFactorization|) (123 . |ddfact|)
              (129 . |empty|) (133 . |differentiate|)
              (|IntegerPrimesPackage| 25) (138 . |nextPrime|) (143 . |union|)
              (149 . |intersect|) (155 . =) (161 . |#|)
              (|Record| (|:| |prime| 25) (|:| |factors| 99))
              |GALFACT;modularFactor;UPSR;24| (|Multiset| 39) (166 . |empty|)
              (170 . |insert!|) (176 . |insert!|)
              |GALFACT;degreePartition;LM;25| (183 . <=) (189 . |rem|)
              (195 . |0|) (199 . =) (|Mapping| 12 39) (205 . |select|)
              (|BrillhartTests| 6) (211 . |brillhartIrreducible?|)
              (|Record| (|:| |left| 6) (|:| |right| 6)) (|Union| 93 '"failed")
              (|UnivariatePolynomialDecompositionPackage| 25 6)
              (216 . |monicDecomposeIfCan|)
              (|GaloisGroupFactorizationUtilities| 25 6 (|Float|))
              (221 . |beauzamyBound|) (|List| 6) (|GeneralHenselPackage| 25 6)
              (226 . |completeHensel|) (234 . |elt|) (240 . |append|)
              (246 . |coefficient|) (252 . |bit?|) (258 . |elt|)
              (264 . |symmetricRemainder|) (270 . |member?|) (276 . *)
              (282 . |reduction|) (288 . |primitivePart|) (|Union| % '"failed")
              (293 . |exquo|) (299 . |swap!|) (306 . |rest|) (312 . |setrest!|)
              (318 . |singleFactorBound|)
              (|Record| (|:| |plist| 99) (|:| |modulo| 25))
              (324 . |HenselLift|) (332 . |parts|) (337 . |max|)
              (|GaloisGroupPolynomialUtilities| 25 6) (342 . |reverse|)
              (347 . -) (352 . |noLinearFactor?|) (357 . |remove|)
              (363 . |ground?|) (368 . |subtractIfCan|) (374 . |setelt!|)
              (381 . |unit|)
              (|Record| (|:| |flag| 33) (|:| |factor| 6) (|:| |exponent| 39))
              (|List| 131) (|Factored| 6) (386 . |makeFR|)
              (|Record| (|:| |irr| 6) (|:| |pow| 39))
              (|Record| (|:| |contp| 25) (|:| |factors| 157))
              |GALFACT;makeFR;RF;32| (|Union| 25 '"failed") (|IntegerRoots| 25)
              (392 . |perfectSqrt|) (397 . |monomial|) (403 . +)
              (409 . |monomial|) (415 . |elt|) (421 . |exquo|)
              (427 . |minimumDegree|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (432 . |monicDivide|) (438 . =) (|List| 51)
              (|CyclotomicUtilities|) (444 . |cyclotomic_decomposition|)
              (|Mapping| 6 51) (|ListFunctions2| 51 6) (449 . |map|)
              (455 . |cocyclotomic_decomposition|) (|List| 135)
              (460 . |append|) (466 . |squareFree|) (471 . |factorList|)
              |GALFACT;henselFact;UPBR;37| |GALFACT;btwFact;UPBSNniR;38|
              |GALFACT;factor;UPF;39| |GALFACT;factor;UPLNniF;42|
              |GALFACT;factor;UPNniF;43| |GALFACT;factor;UPLF;44| (476 . |new|)
              |GALFACT;factor;UP2NniF;45| |GALFACT;factorSquareFree;UPF;46|
              |GALFACT;factorSquareFree;UPLNniF;47|
              |GALFACT;factorSquareFree;UPNniF;48|
              |GALFACT;factorSquareFree;UPLF;49|
              |GALFACT;factorSquareFree;UP2NniF;50| (|Union| 6 '"failed")
              |GALFACT;factorOfDegree;PiUPLNniBU;51|
              |GALFACT;factorOfDegree;PiUPLNniU;52|
              |GALFACT;factorOfDegree;PiUPNniU;53|
              |GALFACT;factorOfDegree;PiUPLU;54|
              |GALFACT;factorOfDegree;PiUPU;55|)
           '#(|useSingleFactorBound?| 482 |useSingleFactorBound| 486
              |useEisensteinCriterion?| 491 |useEisensteinCriterion| 495
              |tryFunctionalDecomposition?| 500 |tryFunctionalDecomposition|
              504 |stopMusserTrials| 509 |numberOfFactors| 518 |musserTrials|
              523 |modularFactor| 532 |makeFR| 538 |henselFact| 543
              |factorSquareFree| 549 |factorOfDegree| 580 |factor| 617
              |eisensteinIrreducible?| 648 |degreePartition| 653 |btwFact| 658)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|makeFR|
                                 ((|Factored| |#1|)
                                  (|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))))
                                T)
                              '((|degreePartition|
                                 ((|Multiset| (|NonNegativeInteger|))
                                  (|List|
                                   (|Record| (|:| |factor| |#1|)
                                             (|:| |degree| (|Integer|))))))
                                T)
                              '((|musserTrials| ((|PositiveInteger|))) T)
                              '((|musserTrials|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|stopMusserTrials| ((|PositiveInteger|))) T)
                              '((|stopMusserTrials|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|numberOfFactors|
                                 ((|NonNegativeInteger|)
                                  (|List|
                                   (|Record| (|:| |factor| |#1|)
                                             (|:| |degree| (|Integer|))))))
                                T)
                              '((|modularFactor|
                                 ((|Record| (|:| |prime| (|Integer|))
                                            (|:| |factors| (|List| |#1|)))
                                  |#1| (|Set| (|NonNegativeInteger|))))
                                T)
                              '((|useSingleFactorBound?| ((|Boolean|))) T)
                              '((|useSingleFactorBound|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|useEisensteinCriterion?| ((|Boolean|))) T)
                              '((|useEisensteinCriterion|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|eisensteinIrreducible?| ((|Boolean|) |#1|))
                                T)
                              '((|tryFunctionalDecomposition?| ((|Boolean|)))
                                T)
                              '((|tryFunctionalDecomposition|
                                 ((|Boolean|) (|Boolean|)))
                                T)
                              '((|factor| ((|Factored| |#1|) |#1|)) T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factor|
                                 ((|Factored| |#1|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree| ((|Factored| |#1|) |#1|))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1|
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorSquareFree|
                                 ((|Factored| |#1|) |#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1|))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|factorOfDegree|
                                 ((|Union| |#1| "failed") (|PositiveInteger|)
                                  |#1| (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|) (|Boolean|)))
                                T)
                              '((|henselFact|
                                 ((|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))
                                  |#1| (|Boolean|)))
                                T)
                              '((|btwFact|
                                 ((|Record| (|:| |contp| (|Integer|))
                                            (|:| |factors|
                                                 (|List|
                                                  (|Record| (|:| |irr| |#1|)
                                                            (|:| |pow|
                                                                 (|NonNegativeInteger|))))))
                                  |#1| (|Boolean|)
                                  (|Set| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 179
                                            '(1 6 0 0 24 1 6 25 0 26 1 25 12 0
                                              27 0 6 0 28 1 6 25 0 29 1 6 12 0
                                              30 1 25 31 0 32 1 36 35 0 37 1 6
                                              39 0 40 2 39 0 0 0 44 2 46 0 45 0
                                              47 0 6 0 48 1 46 0 49 50 1 6 51 0
                                              52 2 54 53 51 25 55 3 54 53 53 53
                                              25 56 1 54 25 53 57 1 54 51 53 58
                                              1 6 0 51 59 1 6 0 25 60 2 25 12 0
                                              0 61 2 25 0 0 0 62 4 54 63 53 25
                                              25 25 64 2 68 67 53 25 69 0 46 0
                                              70 1 6 0 0 71 1 72 25 25 73 2 46
                                              0 0 0 74 2 46 0 0 0 75 2 46 12 0
                                              0 76 1 49 39 0 77 0 80 0 81 2 80
                                              0 39 0 82 3 80 0 39 0 39 83 2 39
                                              12 0 0 85 2 39 0 0 0 86 0 39 0 87
                                              2 39 12 0 0 88 2 46 0 89 0 90 1
                                              91 12 6 92 1 95 94 6 96 1 97 25 6
                                              98 4 100 99 6 99 25 19 101 2 6 0
                                              0 0 102 2 99 0 0 0 103 2 6 25 0
                                              39 104 2 25 12 0 0 105 2 99 6 0
                                              25 106 2 25 0 0 0 107 2 46 12 39
                                              0 108 2 6 0 0 0 109 2 100 6 6 25
                                              110 1 6 0 0 111 2 6 112 0 0 113 3
                                              99 63 0 25 25 114 2 99 0 0 39 115
                                              2 99 0 0 0 116 2 97 25 6 39 117 4
                                              100 118 6 99 25 19 119 1 46 49 0
                                              120 1 46 39 0 121 1 122 6 6 123 1
                                              6 0 0 124 1 91 12 6 125 2 46 0 39
                                              0 126 1 6 12 0 127 2 39 112 0 0
                                              128 3 99 6 0 25 6 129 1 36 25 0
                                              130 2 133 0 6 132 134 1 139 138
                                              25 140 2 6 0 25 39 141 2 6 0 0 0
                                              142 2 51 0 25 39 143 2 51 0 0 0
                                              144 2 6 112 0 25 145 1 6 39 0 146
                                              2 6 147 0 0 148 2 6 12 0 0 149 1
                                              151 150 25 152 2 154 99 153 150
                                              155 1 151 150 25 156 2 157 0 0 0
                                              158 1 6 31 0 159 1 133 132 0 160
                                              2 49 0 39 39 167 0 0 12 17 1 0 12
                                              12 18 0 0 12 13 1 0 12 12 14 0 0
                                              12 15 1 0 12 12 16 0 0 19 20 1 0
                                              19 19 21 1 0 39 42 43 0 0 19 22 1
                                              0 19 19 23 2 0 78 6 46 79 1 0 133
                                              136 137 2 0 136 6 12 161 3 0 133
                                              6 39 39 173 2 0 133 6 49 172 3 0
                                              133 6 49 39 170 1 0 133 6 169 2 0
                                              133 6 39 171 4 0 174 19 6 49 39
                                              176 5 0 174 19 6 49 39 12 175 3 0
                                              174 19 6 39 177 3 0 174 19 6 49
                                              178 2 0 174 19 6 179 3 0 133 6 49
                                              39 164 3 0 133 6 39 39 168 2 0
                                              133 6 39 165 2 0 133 6 49 166 1 0
                                              133 6 163 1 0 12 6 38 1 0 80 42
                                              84 4 0 136 6 12 46 39 162)))))
           '|lookupComplete|)) 
