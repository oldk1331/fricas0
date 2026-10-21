
(SDEFUN |PWFFINTB;reducedDiscriminant;UPR;1| ((|f| (UP)) (% (R)))
        (SPROG
         ((|ff| (|SparseUnivariatePolynomial| (|Fraction| R)))
          (|ee|
           (|Record|
            (|:| |coef1| (|SparseUnivariatePolynomial| (|Fraction| R)))
            (|:| |coef2| (|SparseUnivariatePolynomial| (|Fraction| R)))
            (|:| |generator| (|SparseUnivariatePolynomial| (|Fraction| R)))))
          (|cc| (|List| (|Fraction| R)))
          (|cden| (|Record| (|:| |num| (|List| (|Fraction| R))) (|:| |den| R)))
          (|denom| (R)) (|gg| (R)) (|ans| (|Union| R "failed")))
         (SEQ (LETT |ff| (SPADCALL (ELT % 11) |f| (QREFELT % 15)))
              (LETT |ee|
                    (SPADCALL |ff| (SPADCALL |ff| (QREFELT % 16))
                              (QREFELT % 18)))
              (LETT |cc|
                    (SPADCALL (SPADCALL (QVELT |ee| 0) (QREFELT % 20))
                              (SPADCALL (QVELT |ee| 1) (QREFELT % 20))
                              (QREFELT % 21)))
              (LETT |cden| (SPADCALL |cc| (QREFELT % 24)))
              (LETT |denom| (QCDR |cden|))
              (LETT |gg|
                    (SPADCALL
                     (SPADCALL (ELT % 25) (QCAR |cden|) (QREFELT % 29))
                     (QREFELT % 31)))
              (LETT |ans| (SPADCALL |denom| |gg| (QREFELT % 33)))
              (EXIT
               (COND
                ((QEQCAR |ans| 1)
                 (|error|
                  "PWFFINTB: error in reduced discriminant computation"))
                ('T (QCDR |ans|))))))) 

(SDEFUN |PWFFINTB;compLocalBasis|
        ((|poly| (UP)) (|prime| (R))
         (%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)))))
        (SPROG
         ((|sae|
           (|Join| (|MonogenicAlgebra| R UP)
                   (CATEGORY |package|
                    (IF (|has| R (|Field|))
                        (IF (|has| R (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| UP (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|)))))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT % 7) (QREFELT % 8)
                                            |poly|))
          (EXIT
           (SPADCALL |prime|
                     (|compiledLookupCheck| '|localIntegralBasis|
                                            (LIST
                                             (LIST '|Record|
                                                   (LIST '|:| '|basis|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7))))
                                                   (LIST '|:| '|basisDen|
                                                         (|devaluate|
                                                          (ELT % 7)))
                                                   (LIST '|:| '|basisInv|
                                                         (LIST '|Matrix|
                                                               (|devaluate|
                                                                (ELT % 7)))))
                                             (|devaluate| (ELT % 7)))
                                            (|WildFunctionFieldIntegralBasis|
                                             (ELT % 6) (ELT % 7) (ELT % 8)
                                             |sae|))))))) 

(SDEFUN |PWFFINTB;compLocalBasisOverExt|
        ((|poly0| (UP)) (|prime0| (R)) (|irrPoly0| (UP))
         (|k| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)))))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (|disc0| (R)) (|r| #1#)
          (#2=#:G28 NIL) (|irrPoly| (|SparseUnivariatePolynomial| K))
          (E
           (|Join| (|MonogenicAlgebra| K #3=(|SparseUnivariatePolynomial| K))
                   (CATEGORY |package|
                    (IF (|has| K . #4=((|Field|)))
                        (IF (|has| K
                                   . #5=((|PolynomialFactorizationExplicit|)))
                            . #6=((ATTRIBUTE
                                   (|PolynomialFactorizationExplicit|))
                                  |noBranch|))
                        . #7=(|noBranch|))
                    (IF (|has| #3# . #8=((|Hashable|)))
                        . #9=((ATTRIBUTE (|Hashable|)) |noBranch|)))))
          (|poly|
           #10=(|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E)))
          (|redDisc0| (R)) (|redDisc| #11=(|SparseUnivariatePolynomial| E))
          (|prime| #11#)
          (|sae|
           (|Join| (|MonogenicAlgebra| E #12=(|SparseUnivariatePolynomial| E))
                   (CATEGORY |package|
                    (IF (|has| E . #4#)
                        (IF (|has| E . #5#)
                            . #6#)
                        . #7#)
                    (IF (|has| #12# . #8#)
                        . #9#))))
          (|pp| #10#) (|redIrrPoly| (|SparseUnivariatePolynomial| |sae|))
          (|factorListSAE|
           (|List|
            (|Record|
             (|:| |flag|
                  (|Union| #13="nil" #14="sqfr" #15="irred" #16="prime"))
             (|:| |factor| (|SparseUnivariatePolynomial| |sae|))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (#17=#:G56 NIL) (|f| NIL) (#18=#:G57 NIL)
          (|redFactors| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#19=#:G58 NIL) (|ff| NIL) (#20=#:G59 NIL)
          (|primaries|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E))))
          (#21=#:G38 NIL) (|deg| (|PositiveInteger|))
          (|henselInfo|
           (|Record|
            (|:| |plist|
                 #22=(|List|
                      (|SparseUnivariatePolynomial|
                       (|SparseUnivariatePolynomial| E))))
            (|:| |modulo| (|SparseUnivariatePolynomial| E))))
          (|henselFactors| #22#)
          (|psi1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| E)))
          (FF
           (|Join|
            (|MonogenicAlgebra| #23=(|SparseUnivariatePolynomial| E)
                                #24=(|SparseUnivariatePolynomial|
                                     (|SparseUnivariatePolynomial| E)))
            (CATEGORY |package|
             (IF (|has| #23# . #4#)
                 (IF (|has| #23# . #5#)
                     . #6#)
                 . #7#)
             (IF (|has| #24# . #8#)
                 . #9#))))
          (|factorIb|
           (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                     (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                     (|:| |basisInv|
                          (|Matrix| (|SparseUnivariatePolynomial| E)))))
          (|bs|
           (|List|
            (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                      (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                      (|:| |basisInv|
                           (|Matrix| (|SparseUnivariatePolynomial| E))))))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| (|SparseUnivariatePolynomial| E)))
                     (|:| |basisDen| (|SparseUnivariatePolynomial| E))
                     (|:| |basisInv|
                          (|Matrix| (|SparseUnivariatePolynomial| E)))))
          (|b| (|Matrix| R)) (|bas| (|Union| (|Matrix| R) #25="failed"))
          (|bInv| (|Matrix| R)) (|p| (|Union| R #26="failed")) (|bDen| (R)))
         (SEQ (LETT |n| (SPADCALL |poly0| (QREFELT % 36)))
              (LETT |disc0| (SPADCALL |poly0| (QREFELT % 37)))
              (EXIT
               (COND
                ((QEQCAR (SPADCALL |disc0| |prime0| (QREFELT % 33)) 1)
                 (VECTOR (SPADCALL |n| (|spadConstant| % 39) (QREFELT % 41))
                         (|spadConstant| % 39)
                         (SPADCALL |n| (|spadConstant| % 39) (QREFELT % 41))))
                (#27='T
                 (SEQ (LETT |r| (SPADCALL |irrPoly0| (QREFELT % 36)))
                      (LETT |irrPoly|
                            (SPADCALL
                             (PROG1 (LETT #2# |r|)
                               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                 '(|NonNegativeInteger|) #2#))
                             (QREFELT % 45)))
                      (LETT E
                            (|SimpleAlgebraicExtension| (QREFELT % 6)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT % 6))
                                                        |irrPoly|))
                      (LETT |poly|
                            (SPADCALL
                             (|compiledLookupCheck| '|coerce|
                                                    (LIST '%
                                                          (|devaluate|
                                                           (ELT % 6)))
                                                    E)
                             |poly0|
                             (|compiledLookupCheck| '|mapBivariate|
                                                    (LIST
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (LIST
                                                       '|SparseUnivariatePolynomial|
                                                       (|devaluate| E)))
                                                     (LIST '|Mapping|
                                                           (|devaluate| E)
                                                           (|devaluate|
                                                            (ELT % 6)))
                                                     (|devaluate| (ELT % 8)))
                                                    (|IntegralBasisPolynomialTools|
                                                     (ELT % 6) (ELT % 7)
                                                     (ELT % 8) E))))
                      (LETT |redDisc0| (SPADCALL |poly0| (QREFELT % 34)))
                      (LETT |redDisc|
                            (SPADCALL
                             (|compiledLookupCheck| '|coerce|
                                                    (LIST '%
                                                          (|devaluate|
                                                           (ELT % 6)))
                                                    E)
                             |redDisc0|
                             (|compiledLookupCheck| '|mapUnivariate|
                                                    (LIST
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate| E))
                                                     (LIST '|Mapping|
                                                           (|devaluate| E)
                                                           (|devaluate|
                                                            (ELT % 6)))
                                                     (|devaluate| (ELT % 7)))
                                                    (|IntegralBasisPolynomialTools|
                                                     (ELT % 6) (ELT % 7)
                                                     (ELT % 8) E))))
                      (LETT |prime|
                            (SPADCALL
                             (|compiledLookupCheck| '|coerce|
                                                    (LIST '%
                                                          (|devaluate|
                                                           (ELT % 6)))
                                                    E)
                             |prime0|
                             (|compiledLookupCheck| '|mapUnivariate|
                                                    (LIST
                                                     (LIST
                                                      '|SparseUnivariatePolynomial|
                                                      (|devaluate| E))
                                                     (LIST '|Mapping|
                                                           (|devaluate| E)
                                                           (|devaluate|
                                                            (ELT % 6)))
                                                     (|devaluate| (ELT % 7)))
                                                    (|IntegralBasisPolynomialTools|
                                                     (ELT % 6) (ELT % 7)
                                                     (ELT % 8) E))))
                      (LETT |sae|
                            (|SimpleAlgebraicExtension| E
                                                        (|SparseUnivariatePolynomial|
                                                         E)
                                                        |prime|))
                      (LETT |redIrrPoly|
                            (SEQ
                             (LETT |pp|
                                   (SPADCALL
                                    (|compiledLookupCheck| '|coerce|
                                                           (LIST '%
                                                                 (|devaluate|
                                                                  (ELT % 6)))
                                                           E)
                                    |irrPoly0|
                                    (|compiledLookupCheck| '|mapBivariate|
                                                           (LIST
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate| E)))
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   E)
                                                                  (|devaluate|
                                                                   (ELT % 6)))
                                                            (|devaluate|
                                                             (ELT % 8)))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT % 6) (ELT % 7)
                                                            (ELT % 8) E))))
                             (EXIT
                              (SPADCALL
                               (|compiledLookupCheck| '|reduce|
                                                      (LIST '%
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate| E)))
                                                      |sae|)
                               |pp|
                               (|compiledLookupCheck| '|mapUnivariate|
                                                      (LIST
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (|devaluate| |sae|))
                                                       (LIST '|Mapping|
                                                             (|devaluate|
                                                              |sae|)
                                                             (LIST
                                                              '|SparseUnivariatePolynomial|
                                                              (|devaluate| E)))
                                                       (LIST
                                                        '|SparseUnivariatePolynomial|
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate| E))))
                                                      (|IntegralBasisPolynomialTools|
                                                       (|SparseUnivariatePolynomial|
                                                        E)
                                                       (|SparseUnivariatePolynomial|
                                                        (|SparseUnivariatePolynomial|
                                                         E))
                                                       (|SparseUnivariatePolynomial|
                                                        (|SparseUnivariatePolynomial|
                                                         (|SparseUnivariatePolynomial|
                                                          E)))
                                                       |sae|))))))
                      (LETT |factorListSAE|
                            (SPADCALL
                             (SPADCALL |redIrrPoly|
                                       (|compiledLookupCheck| '|factor|
                                                              (LIST
                                                               (LIST
                                                                '|Factored|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  |sae|)))
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 |sae|)))
                                                              (|UnivariateFiniteFieldFactorize|
                                                               |sae|
                                                               (|SparseUnivariatePolynomial|
                                                                |sae|))))
                             (|compiledLookupCheck| '|factorList|
                                                    (LIST
                                                     (LIST '|List|
                                                           (LIST '|Record|
                                                                 (LIST '|:|
                                                                       '|flag|
                                                                       (LIST
                                                                        '|Union|
                                                                        '#13#
                                                                        '#14#
                                                                        '#15#
                                                                        '#16#))
                                                                 (LIST '|:|
                                                                       '|factor|
                                                                       (LIST
                                                                        '|SparseUnivariatePolynomial|
                                                                        (|devaluate|
                                                                         |sae|)))
                                                                 (LIST '|:|
                                                                       '|exponent|
                                                                       (LIST
                                                                        '|NonNegativeInteger|))))
                                                     '%)
                                                    (|Factored|
                                                     (|SparseUnivariatePolynomial|
                                                      |sae|)))))
                      (LETT |redFactors|
                            (PROGN
                             (LETT #17# NIL)
                             (SEQ (LETT |f| NIL) (LETT #18# |factorListSAE|)
                                  G190
                                  (COND
                                   ((OR (ATOM #18#)
                                        (PROGN (LETT |f| (CAR #18#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #17#
                                          (CONS
                                           (SPADCALL (QVELT |f| 1) |k|
                                                     (|compiledLookupCheck| '^
                                                                            (LIST
                                                                             '%
                                                                             '%
                                                                             (LIST
                                                                              '|NonNegativeInteger|))
                                                                            (|SparseUnivariatePolynomial|
                                                                             |sae|)))
                                           #17#))))
                                  (LETT #18# (CDR #18#)) (GO G190) G191
                                  (EXIT (NREVERSE #17#)))))
                      (LETT |primaries|
                            (PROGN
                             (LETT #19# NIL)
                             (SEQ (LETT |ff| NIL) (LETT #20# |redFactors|) G190
                                  (COND
                                   ((OR (ATOM #20#)
                                        (PROGN (LETT |ff| (CAR #20#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #19#
                                          (CONS
                                           (SPADCALL
                                            (|compiledLookupCheck| '|lift|
                                                                   (LIST
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (|devaluate|
                                                                      E))
                                                                    '%)
                                                                   |sae|)
                                            |ff|
                                            (|compiledLookupCheck|
                                             '|mapUnivariate|
                                             (LIST
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| E)))
                                              (LIST '|Mapping|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| E))
                                                    (|devaluate| |sae|))
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|)))
                                             (|IntegralBasisPolynomialTools|
                                              (|SparseUnivariatePolynomial| E)
                                              (|SparseUnivariatePolynomial|
                                               (|SparseUnivariatePolynomial|
                                                E))
                                              (|SparseUnivariatePolynomial|
                                               (|SparseUnivariatePolynomial|
                                                (|SparseUnivariatePolynomial|
                                                 E)))
                                              |sae|)))
                                           #19#))))
                                  (LETT #20# (CDR #20#)) (GO G190) G191
                                  (EXIT (NREVERSE #19#)))))
                      (LETT |deg|
                            (PROG1
                                (LETT #21#
                                      (+ 1
                                         (*
                                          (SPADCALL |redDisc| |prime|
                                                    (|compiledLookupCheck|
                                                     '|order|
                                                     (LIST
                                                      (LIST
                                                       '|NonNegativeInteger|)
                                                      '% '%)
                                                     (|SparseUnivariatePolynomial|
                                                      E)))
                                          (SPADCALL |prime|
                                                    (|compiledLookupCheck|
                                                     '|degree|
                                                     (LIST
                                                      (LIST
                                                       '|NonNegativeInteger|)
                                                      '%)
                                                     (|SparseUnivariatePolynomial|
                                                      E))))))
                              (|check_subtype2| (> #21# 0) '(|PositiveInteger|)
                                                '(|NonNegativeInteger|) #21#)))
                      (LETT |henselInfo|
                            (SPADCALL |poly| |primaries| |prime| |deg|
                                      (|compiledLookupCheck| '|HenselLift|
                                                             (LIST
                                                              (LIST '|Record|
                                                                    (LIST '|:|
                                                                          '|plist|
                                                                          (LIST
                                                                           '|List|
                                                                           (LIST
                                                                            '|SparseUnivariatePolynomial|
                                                                            (LIST
                                                                             '|SparseUnivariatePolynomial|
                                                                             (|devaluate|
                                                                              E)))))
                                                                    (LIST '|:|
                                                                          '|modulo|
                                                                          (LIST
                                                                           '|SparseUnivariatePolynomial|
                                                                           (|devaluate|
                                                                            E))))
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (LIST
                                                                '|SparseUnivariatePolynomial|
                                                                (|devaluate|
                                                                 E)))
                                                              (LIST '|List|
                                                                    (LIST
                                                                     '|SparseUnivariatePolynomial|
                                                                     (LIST
                                                                      '|SparseUnivariatePolynomial|
                                                                      (|devaluate|
                                                                       E))))
                                                              (LIST
                                                               '|SparseUnivariatePolynomial|
                                                               (|devaluate| E))
                                                              (LIST
                                                               '|PositiveInteger|))
                                                             (|GeneralHenselPackage|
                                                              (|SparseUnivariatePolynomial|
                                                               E)
                                                              (|SparseUnivariatePolynomial|
                                                               (|SparseUnivariatePolynomial|
                                                                E))))))
                      (LETT |henselFactors| (QCAR |henselInfo|))
                      (LETT |psi1| (|SPADfirst| |henselFactors|))
                      (LETT FF
                            (|SimpleAlgebraicExtension|
                             (|SparseUnivariatePolynomial| E)
                             (|SparseUnivariatePolynomial|
                              (|SparseUnivariatePolynomial| E))
                             |psi1|))
                      (LETT |factorIb|
                            (SPADCALL |prime|
                                      (|compiledLookupCheck|
                                       '|localIntegralBasis|
                                       (LIST
                                        (LIST '|Record|
                                              (LIST '|:| '|basis|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))))
                                              (LIST '|:| '|basisDen|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| E)))
                                              (LIST '|:| '|basisInv|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))))
                                        (LIST '|SparseUnivariatePolynomial|
                                              (|devaluate| E)))
                                       (|WildFunctionFieldIntegralBasis| E
                                                                         (|SparseUnivariatePolynomial|
                                                                          E)
                                                                         (|SparseUnivariatePolynomial|
                                                                          (|SparseUnivariatePolynomial|
                                                                           E))
                                                                         FF))))
                      (LETT |bs|
                            (SPADCALL |factorIb| (SPADCALL (QREFELT % 48)) |r|
                                      (|compiledLookupCheck|
                                       '|listConjugateBases|
                                       (LIST
                                        (LIST '|List|
                                              (LIST '|Record|
                                                    (LIST '|:| '|basis|
                                                          (LIST '|Matrix|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  E))))
                                                    (LIST '|:| '|basisDen|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))
                                                    (LIST '|:| '|basisInv|
                                                          (LIST '|Matrix|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  E))))))
                                        (LIST '|Record|
                                              (LIST '|:| '|basis|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))))
                                              (LIST '|:| '|basisDen|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| E)))
                                              (LIST '|:| '|basisInv|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))))
                                        (LIST '|NonNegativeInteger|)
                                        (LIST '|NonNegativeInteger|))
                                       (|ChineseRemainderToolsForIntegralBases|
                                        E (|SparseUnivariatePolynomial| E)
                                        (|SparseUnivariatePolynomial|
                                         (|SparseUnivariatePolynomial| E))))))
                      (LETT |ib|
                            (SPADCALL |henselFactors| |bs| |n|
                                      (|compiledLookupCheck|
                                       '|chineseRemainder|
                                       (LIST
                                        (LIST '|Record|
                                              (LIST '|:| '|basis|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E))))
                                              (LIST '|:| '|basisDen|
                                                    (LIST
                                                     '|SparseUnivariatePolynomial|
                                                     (|devaluate| E)))
                                              (LIST '|:| '|basisInv|
                                                    (LIST '|Matrix|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))))
                                        (LIST '|List|
                                              (LIST
                                               '|SparseUnivariatePolynomial|
                                               (LIST
                                                '|SparseUnivariatePolynomial|
                                                (|devaluate| E))))
                                        (LIST '|List|
                                              (LIST '|Record|
                                                    (LIST '|:| '|basis|
                                                          (LIST '|Matrix|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  E))))
                                                    (LIST '|:| '|basisDen|
                                                          (LIST
                                                           '|SparseUnivariatePolynomial|
                                                           (|devaluate| E)))
                                                    (LIST '|:| '|basisInv|
                                                          (LIST '|Matrix|
                                                                (LIST
                                                                 '|SparseUnivariatePolynomial|
                                                                 (|devaluate|
                                                                  E))))))
                                        (LIST '|NonNegativeInteger|))
                                       (|ChineseRemainderToolsForIntegralBases|
                                        E (|SparseUnivariatePolynomial| E)
                                        (|SparseUnivariatePolynomial|
                                         (|SparseUnivariatePolynomial| E))))))
                      (LETT |b|
                            (SEQ
                             (LETT |bas|
                                   (SPADCALL
                                    (|compiledLookupCheck| '|retractIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (|devaluate|
                                                                   (ELT % 6))
                                                                  '#28="failed")
                                                            '%)
                                                           E)
                                    (QVELT |ib| 0)
                                    (|compiledLookupCheck| '|mapMatrixIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (LIST
                                                                   '|Matrix|
                                                                   (|devaluate|
                                                                    (ELT % 7)))
                                                                  '#25#)
                                                            (LIST '|Mapping|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    (ELT % 6))
                                                                   '#29="failed")
                                                                  (|devaluate|
                                                                   E))
                                                            (LIST '|Matrix|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    E))))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT % 6) (ELT % 7)
                                                            (ELT % 8) E))))
                             (EXIT
                              (COND
                               ((QEQCAR |bas| 1)
                                (|error| "retraction of basis failed"))
                               (#27# (QCDR |bas|))))))
                      (LETT |bInv|
                            (SEQ
                             (LETT |bas|
                                   (SPADCALL
                                    (|compiledLookupCheck| '|retractIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (|devaluate|
                                                                   (ELT % 6))
                                                                  '#28#)
                                                            '%)
                                                           E)
                                    (QVELT |ib| 2)
                                    (|compiledLookupCheck| '|mapMatrixIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (LIST
                                                                   '|Matrix|
                                                                   (|devaluate|
                                                                    (ELT % 7)))
                                                                  '#25#)
                                                            (LIST '|Mapping|
                                                                  (LIST
                                                                   '|Union|
                                                                   (|devaluate|
                                                                    (ELT % 6))
                                                                   '#29#)
                                                                  (|devaluate|
                                                                   E))
                                                            (LIST '|Matrix|
                                                                  (LIST
                                                                   '|SparseUnivariatePolynomial|
                                                                   (|devaluate|
                                                                    E))))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT % 6) (ELT % 7)
                                                            (ELT % 8) E))))
                             (EXIT
                              (COND
                               ((QEQCAR |bas| 1)
                                (|error| "retraction of basis inverse failed"))
                               (#27# (QCDR |bas|))))))
                      (LETT |bDen|
                            (SEQ
                             (LETT |p|
                                   (SPADCALL
                                    (|compiledLookupCheck| '|retractIfCan|
                                                           (LIST
                                                            (LIST '|Union|
                                                                  (|devaluate|
                                                                   (ELT % 6))
                                                                  '#28#)
                                                            '%)
                                                           E)
                                    (QVELT |ib| 1)
                                    (|compiledLookupCheck|
                                     '|mapUnivariateIfCan|
                                     (LIST
                                      (LIST '|Union| (|devaluate| (ELT % 7))
                                            '#26#)
                                      (LIST '|Mapping|
                                            (LIST '|Union|
                                                  (|devaluate| (ELT % 6))
                                                  '"failed")
                                            (|devaluate| E))
                                      (LIST '|SparseUnivariatePolynomial|
                                            (|devaluate| E)))
                                     (|IntegralBasisPolynomialTools| (ELT % 6)
                                                                     (ELT % 7)
                                                                     (ELT % 8)
                                                                     E))))
                             (EXIT
                              (COND
                               ((QEQCAR |p| 1)
                                (|error|
                                 "retraction of basis denominator failed"))
                               (#27# (QCDR |p|))))))
                      (EXIT (VECTOR |b| |bDen| |bInv|))))))))) 

(SDEFUN |PWFFINTB;padicLocalIntegralBasis|
        ((|p| (UP)) (|disc| (R)) (|redDisc| (R)) (|prime| (R))
         (%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)) (|:| |discr| R))))
        (SPROG
         ((|sae|
           (|Join| (|MonogenicAlgebra| K R)
                   (CATEGORY |package|
                    (IF (|has| K (|Field|))
                        (IF (|has| K (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| R (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|))))
          (|reducedP| (|SparseUnivariatePolynomial| |sae|))
          (|factorListSAE|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
             (|:| |factor| (|SparseUnivariatePolynomial| |sae|))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (#5=#:G95 NIL) (#6=#:G96 NIL)
          (|redPrimes| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#7=#:G97 NIL) (#8=#:G98 NIL) (|primes| (|List| UP)) (#9=#:G99 NIL)
          (#10=#:G100 NIL) (|expons| (|List| (|NonNegativeInteger|)))
          (#11=#:G101 NIL) (|f| NIL) (#12=#:G102 NIL)
          (|redPrimaries| (|List| (|SparseUnivariatePolynomial| |sae|)))
          (#13=#:G103 NIL) (|ff| NIL) (#14=#:G104 NIL)
          (|primaries| (|List| UP)) (#15=#:G81 NIL) (|deg| (|PositiveInteger|))
          (|henselInfo|
           (|Record| (|:| |plist| #16=(|List| UP)) (|:| |modulo| R)))
          (|henselFactors| #16#) (|degPrime| (|NonNegativeInteger|)) (|qq| NIL)
          (#17=#:G107 NIL) (|k| NIL) (#18=#:G106 NIL) (|pp| NIL)
          (#19=#:G105 NIL) (|degPp| (|NonNegativeInteger|))
          (|base|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R))))
          (|factorBases|
           (|List|
            (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                      (|:| |basisInv| (|Matrix| R)))))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R))))
          (|index| (R)))
         (SEQ
          (LETT |sae|
                (|SimpleAlgebraicExtension| (QREFELT % 6) (QREFELT % 7)
                                            |prime|))
          (LETT |reducedP|
                (SPADCALL
                 (|compiledLookupCheck| '|reduce|
                                        (LIST '% (|devaluate| (ELT % 7)))
                                        |sae|)
                 |p|
                 (|compiledLookupCheck| '|mapUnivariate|
                                        (LIST
                                         (LIST '|SparseUnivariatePolynomial|
                                               (|devaluate| |sae|))
                                         (LIST '|Mapping| (|devaluate| |sae|)
                                               (|devaluate| (ELT % 7)))
                                         (|devaluate| (ELT % 8)))
                                        (|IntegralBasisPolynomialTools|
                                         (ELT % 7) (ELT % 8)
                                         (|SparseUnivariatePolynomial|
                                          (ELT % 8))
                                         |sae|))))
          (LETT |factorListSAE|
                (SPADCALL
                 (SPADCALL |reducedP|
                           (|compiledLookupCheck| '|factor|
                                                  (LIST
                                                   (LIST '|Factored|
                                                         (LIST
                                                          '|SparseUnivariatePolynomial|
                                                          (|devaluate| |sae|)))
                                                   (LIST
                                                    '|SparseUnivariatePolynomial|
                                                    (|devaluate| |sae|)))
                                                  (|UnivariateFiniteFieldFactorize|
                                                   |sae|
                                                   (|SparseUnivariatePolynomial|
                                                    |sae|))))
                 (|compiledLookupCheck| '|factorList|
                                        (LIST
                                         (LIST '|List|
                                               (LIST '|Record|
                                                     (LIST '|:| '|flag|
                                                           (LIST '|Union| '#1#
                                                                 '#2# '#3#
                                                                 '#4#))
                                                     (LIST '|:| '|factor|
                                                           (LIST
                                                            '|SparseUnivariatePolynomial|
                                                            (|devaluate|
                                                             |sae|)))
                                                     (LIST '|:| '|exponent|
                                                           (LIST
                                                            '|NonNegativeInteger|))))
                                         '%)
                                        (|Factored|
                                         (|SparseUnivariatePolynomial|
                                          |sae|)))))
          (EXIT
           (COND
            ((EQL (LENGTH |factorListSAE|) 1)
             (SEQ (LETT |ib| (SPADCALL |prime| (QREFELT % 51)))
                  (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT % 53)))
                  (EXIT
                   (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                           (SPADCALL |disc|
                                     (SPADCALL |index| |index| (QREFELT % 54))
                                     (QREFELT % 55))))))
            ('T
             (SEQ
              (LETT |redPrimes|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |f| NIL) (LETT #6# |factorListSAE|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |f| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #5# (CONS (QVELT |f| 1) #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |primes|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |ff| NIL) (LETT #8# |redPrimes|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |ff| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|lift|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT % 7))
                                                            '%)
                                                           |sae|)
                                    |ff|
                                    (|compiledLookupCheck| '|mapUnivariate|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT % 8))
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   (ELT % 7))
                                                                  (|devaluate|
                                                                   |sae|))
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |sae|)))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT % 7) (ELT % 8)
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT % 8))
                                                            |sae|)))
                                   #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |expons|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |f| NIL) (LETT #10# |factorListSAE|) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |f| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #9# (CONS (QVELT |f| 2) #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |redPrimaries|
                    (PROGN
                     (LETT #11# NIL)
                     (SEQ (LETT |f| NIL) (LETT #12# |factorListSAE|) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |f| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS
                                   (SPADCALL (QVELT |f| 1) (QVELT |f| 2)
                                             (|compiledLookupCheck| '^
                                                                    (LIST '% '%
                                                                          (LIST
                                                                           '|NonNegativeInteger|))
                                                                    (|SparseUnivariatePolynomial|
                                                                     |sae|)))
                                   #11#))))
                          (LETT #12# (CDR #12#)) (GO G190) G191
                          (EXIT (NREVERSE #11#)))))
              (LETT |primaries|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |ff| NIL) (LETT #14# |redPrimaries|) G190
                          (COND
                           ((OR (ATOM #14#) (PROGN (LETT |ff| (CAR #14#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #13#
                                  (CONS
                                   (SPADCALL
                                    (|compiledLookupCheck| '|lift|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT % 7))
                                                            '%)
                                                           |sae|)
                                    |ff|
                                    (|compiledLookupCheck| '|mapUnivariate|
                                                           (LIST
                                                            (|devaluate|
                                                             (ELT % 8))
                                                            (LIST '|Mapping|
                                                                  (|devaluate|
                                                                   (ELT % 7))
                                                                  (|devaluate|
                                                                   |sae|))
                                                            (LIST
                                                             '|SparseUnivariatePolynomial|
                                                             (|devaluate|
                                                              |sae|)))
                                                           (|IntegralBasisPolynomialTools|
                                                            (ELT % 7) (ELT % 8)
                                                            (|SparseUnivariatePolynomial|
                                                             (ELT % 8))
                                                            |sae|)))
                                   #13#))))
                          (LETT #14# (CDR #14#)) (GO G190) G191
                          (EXIT (NREVERSE #13#)))))
              (LETT |deg|
                    (PROG1
                        (LETT #15#
                              (+ 1
                                 (* (SPADCALL |redDisc| |prime| (QREFELT % 56))
                                    (SPADCALL |prime| (QREFELT % 57)))))
                      (|check_subtype2| (> #15# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #15#)))
              (LETT |henselInfo|
                    (SPADCALL |p| |primaries| |prime| |deg| (QREFELT % 61)))
              (LETT |henselFactors| (QCAR |henselInfo|))
              (LETT |factorBases| NIL)
              (LETT |degPrime| (SPADCALL |prime| (QREFELT % 57)))
              (SEQ (LETT |qq| NIL) (LETT #17# |henselFactors|) (LETT |k| NIL)
                   (LETT #18# |expons|) (LETT |pp| NIL) (LETT #19# |primes|)
                   G190
                   (COND
                    ((OR (ATOM #19#) (PROGN (LETT |pp| (CAR #19#)) NIL)
                         (ATOM #18#) (PROGN (LETT |k| (CAR #18#)) NIL)
                         (ATOM #17#) (PROGN (LETT |qq| (CAR #17#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |base|
                          (SEQ (LETT |degPp| (SPADCALL |pp| (QREFELT % 36)))
                               (COND
                                ((> |degPp| 1)
                                 (COND
                                  ((EQL (GCD |degPp| |degPrime|) 1)
                                   (EXIT
                                    (|PWFFINTB;compLocalBasisOverExt| |qq|
                                     |prime| |pp| |k| %))))))
                               (EXIT
                                (|PWFFINTB;compLocalBasis| |qq| |prime| %))))
                    (EXIT (LETT |factorBases| (CONS |base| |factorBases|))))
                   (LETT #19#
                         (PROG1 (CDR #19#)
                           (LETT #18#
                                 (PROG1 (CDR #18#) (LETT #17# (CDR #17#))))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |factorBases| (NREVERSE |factorBases|))
              (LETT |ib|
                    (SPADCALL |henselFactors| |factorBases|
                              (SPADCALL (QREFELT % 62)) (QREFELT % 65)))
              (LETT |index| (SPADCALL (QVELT |ib| 2) (QREFELT % 53)))
              (EXIT
               (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)
                       (SPADCALL |disc|
                                 (SPADCALL |index| |index| (QREFELT % 54))
                                 (QREFELT % 55))))))))))) 

(SDEFUN |PWFFINTB;localIntegralBasis;RR;5|
        ((|prime| (R))
         (%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)))))
        (SPROG
         ((|p| (UP)) (|disc| (R)) (|redDisc| (R))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)) (|:| |discr| R))))
         (SEQ (LETT |p| (SPADCALL (QREFELT % 66)))
              (LETT |disc| (SPADCALL |p| (QREFELT % 37)))
              (LETT |redDisc| (SPADCALL |p| (QREFELT % 34)))
              (LETT |ib|
                    (|PWFFINTB;padicLocalIntegralBasis| |p| |disc| |redDisc|
                     |prime| %))
              (EXIT (VECTOR (QVELT |ib| 0) (QVELT |ib| 1) (QVELT |ib| 2)))))) 

(SDEFUN |PWFFINTB;listSquaredFactors| ((|px| (R)) (% (|List| R)))
        (SPROG
         ((|factored| (|Factored| R)) (|f| NIL) (#1=#:G125 NIL)
          (|ans| (|List| R)))
         (SEQ (LETT |ans| NIL) (LETT |factored| (SPADCALL |px| (QREFELT % 70)))
              (SEQ (LETT |f| NIL)
                   (LETT #1# (SPADCALL |factored| (QREFELT % 74))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((> (QVELT |f| 2) 1)
                       (LETT |ans| (CONS (QVELT |f| 1) |ans|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |PWFFINTB;integralBasis;R;7|
        ((%
          (|Record| (|:| |basis| (|Matrix| R)) (|:| |basisDen| R)
                    (|:| |basisInv| (|Matrix| R)))))
        (SPROG
         ((|p| (UP)) (|n| (|PositiveInteger|)) (|singList| (|List| R))
          (|redDisc| (R)) (|prime| NIL) (#1=#:G134 NIL)
          (|lb|
           (|Record| (|:| |basis| #2=(|Matrix| R)) (|:| |basisDen| R)
                     (|:| |basisInv| (|Matrix| R)) (|:| |discr| R)))
          (|rb| #2#) (|rbden| (R)) (|disc| (R)) (|mat| (|Matrix| R))
          (|runningRbden| (R)) (|runningRb| #3=(|Matrix| R))
          (|runningRbinv| #3#))
         (SEQ (LETT |p| (SPADCALL (QREFELT % 66)))
              (LETT |disc| (SPADCALL |p| (QREFELT % 37)))
              (LETT |n| (SPADCALL (QREFELT % 62)))
              (LETT |singList| (|PWFFINTB;listSquaredFactors| |disc| %))
              (LETT |redDisc| (SPADCALL |p| (QREFELT % 34)))
              (LETT |runningRb|
                    (LETT |runningRbinv|
                          (SPADCALL |n| (|spadConstant| % 39) (QREFELT % 41))))
              (LETT |runningRbden| (|spadConstant| % 39))
              (EXIT
               (COND
                ((NULL |singList|)
                 (VECTOR |runningRb| |runningRbden| |runningRbinv|))
                ('T
                 (SEQ
                  (SEQ (LETT |prime| NIL) (LETT #1# |singList|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |prime| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |lb|
                              (|PWFFINTB;padicLocalIntegralBasis| |p| |disc|
                               |redDisc| |prime| %))
                        (LETT |rb| (QVELT |lb| 0))
                        (LETT |rbden| (QVELT |lb| 1))
                        (LETT |disc| (QVELT |lb| 3))
                        (LETT |mat|
                              (SPADCALL
                               (SPADCALL |rbden| |runningRb| (QREFELT % 75))
                               (SPADCALL |runningRbden| |rb| (QREFELT % 75))
                               (QREFELT % 76)))
                        (LETT |runningRbden|
                              (SPADCALL |runningRbden| |rbden| (QREFELT % 54)))
                        (LETT |runningRb|
                              (SPADCALL
                               (SPADCALL |mat| |runningRbden| (QREFELT % 78))
                               (QREFELT % 79)))
                        (EXIT
                         (LETT |runningRbinv|
                               (SPADCALL |runningRb| |runningRbden|
                                         (QREFELT % 81)))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR |runningRb| |runningRbden| |runningRbinv|))))))))) 

(DECLAIM (NOTINLINE |PAdicWildFunctionFieldIntegralBasis;|)) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$|
          (LIST '|PAdicWildFunctionFieldIntegralBasis| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 83))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PAdicWildFunctionFieldIntegralBasis|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |PAdicWildFunctionFieldIntegralBasis| (&REST #1=#:G135)
  (SPROG NIL
         (PROG (#2=#:G136)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PAdicWildFunctionFieldIntegralBasis|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |PAdicWildFunctionFieldIntegralBasis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PAdicWildFunctionFieldIntegralBasis|)))))))))) 

(MAKEPROP '|PAdicWildFunctionFieldIntegralBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Fraction| 7) (0 . |coerce|)
              (|SparseUnivariatePolynomial| 10) (|Mapping| 10 7)
              (|IntegralBasisPolynomialTools| 7 8
                                              (|SparseUnivariatePolynomial| 8)
                                              10)
              (5 . |mapUnivariate|) (11 . |differentiate|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (16 . |extendedEuclidean|) (|List| 10) (22 . |coefficients|)
              (27 . |concat|) (|Record| (|:| |num| 19) (|:| |den| 7))
              (|CommonDenominator| 7 10 19) (33 . |splitDenominator|)
              (38 . |numer|) (|List| 7) (|Mapping| 7 10)
              (|ListFunctions2| 10 7) (43 . |map|) (|List| %) (49 . |gcd|)
              (|Union| % '"failed") (54 . |exquo|)
              |PWFFINTB;reducedDiscriminant;UPR;1| (|NonNegativeInteger|)
              (60 . |degree|) (65 . |discriminant|) (70 . |1|) (74 . |1|)
              (|Matrix| 7) (78 . |scalarMatrix|)
              (|SparseUnivariatePolynomial| 6) (|PositiveInteger|)
              (|FiniteFieldPolynomialPackage| 6) (84 . |createIrreduciblePoly|)
              (89 . |1|) (93 . |1|) (97 . |size|)
              (|Record| (|:| |basis| 40) (|:| |basisDen| 7)
                        (|:| |basisInv| 40))
              (|WildFunctionFieldIntegralBasis| 6 7 8 9)
              (101 . |localIntegralBasis|) (|IntegralBasisTools| 7 8 9)
              (106 . |diagonalProduct|) (111 . *) (117 . |quo|) (123 . |order|)
              (129 . |degree|) (|Record| (|:| |plist| 59) (|:| |modulo| 7))
              (|List| 8) (|GeneralHenselPackage| 7 8) (134 . |HenselLift|)
              (142 . |rank|) (|List| 49)
              (|ChineseRemainderToolsForIntegralBases| 6 7 8)
              (146 . |chineseRemainder|) (153 . |definingPolynomial|)
              |PWFFINTB;localIntegralBasis;RR;5| (|Factored| 7)
              (|UnivariateFiniteFieldFactorize| 6 7) (157 . |factor|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 71) (|:| |factor| 7) (|:| |exponent| 35))
              (|List| 72) (162 . |factorList|) (167 . *) (173 . |vertConcat|)
              (|ModularHermitianRowReduction| 7) (179 . |rowEchelon|)
              (185 . |squareTop|)
              (|TriangularMatrixOperations| 7 (|Vector| 7) (|Vector| 7) 40)
              (190 . |UpTriBddDenomInv|) |PWFFINTB;integralBasis;R;7|)
           '#(|reducedDiscriminant| 196 |localIntegralBasis| 201
              |integralBasis| 206)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))))
                                T)
                              '((|localIntegralBasis|
                                 ((|Record| (|:| |basis| (|Matrix| |#2|))
                                            (|:| |basisDen| |#2|)
                                            (|:| |basisInv| (|Matrix| |#2|)))
                                  |#2|))
                                T)
                              '((|reducedDiscriminant| (|#2| |#3|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 82
                                            '(1 10 0 7 11 2 14 12 13 8 15 1 12
                                              0 0 16 2 12 17 0 0 18 1 12 19 0
                                              20 2 19 0 0 0 21 1 23 22 19 24 1
                                              10 7 0 25 2 28 26 27 19 29 1 7 0
                                              30 31 2 7 32 0 0 33 1 8 35 0 36 1
                                              8 7 0 37 0 6 0 38 0 7 0 39 2 40 0
                                              35 7 41 1 44 42 43 45 0 8 0 46 0
                                              9 0 47 0 6 35 48 1 50 49 7 51 1
                                              52 7 40 53 2 7 0 0 0 54 2 7 0 0 0
                                              55 2 7 35 0 0 56 1 7 35 0 57 4 60
                                              58 8 59 7 43 61 0 9 43 62 3 64 49
                                              59 63 35 65 0 9 8 66 1 69 68 7 70
                                              1 68 73 0 74 2 40 0 7 0 75 2 40 0
                                              0 0 76 2 77 40 40 7 78 1 40 0 0
                                              79 2 80 40 40 7 81 1 0 7 8 34 1 0
                                              49 7 67 0 0 49 82)))))
           '|lookupComplete|)) 
