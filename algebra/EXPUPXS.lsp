
(SDEFUN |EXPUPXS;exponential;Ups%;1|
        ((|f| (|UnivariatePuiseuxSeries| FE |var| |cen|)) (% (%)))
        (SPADCALL |f| (QREFELT % 10))) 

(MAKEPROP '|EXPUPXS;exponent;%Ups;2| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |EXPUPXS;exponent;%Ups;2|
        ((|f| (%)) (% (|UnivariatePuiseuxSeries| FE |var| |cen|))) |f|) 

(SDEFUN |EXPUPXS;exponentialOrder;%F;3|
        ((|f| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL |f| (QREFELT % 12)) (|spadConstant| % 14)
                  (QREFELT % 15))) 

(SDEFUN |EXPUPXS;zero?;%B;4| ((|f| (%)) (% (|Boolean|)))
        (NULL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22)))) 

(SDEFUN |EXPUPXS;=;2%B;5| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22))
         (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 19)) (QREFELT % 20))
                   (QREFELT % 22))
         (QREFELT % 25))) 

(SDEFUN |EXPUPXS;<;2%B;6| ((|f| (%)) (|g| (%)) (% (|Boolean|)))
        (SPROG
         ((|ordf| #1=(|Fraction| (|Integer|))) (|ordg| #1#) (|fCoef| (FE))
          (|gCoef| (FE)))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT % 24)) (NULL (SPADCALL |g| (QREFELT % 24))))
           ((SPADCALL |g| (QREFELT % 24)) NIL)
           (#2='T
            (SEQ (LETT |ordf| (SPADCALL |f| (QREFELT % 16)))
                 (LETT |ordg| (SPADCALL |g| (QREFELT % 16)))
                 (EXIT
                  (COND ((SPADCALL |ordf| |ordg| (QREFELT % 27)) 'T)
                        ((SPADCALL |ordf| |ordg| (QREFELT % 28)) NIL)
                        (#2#
                         (SEQ
                          (LETT |fCoef| (SPADCALL |f| |ordf| (QREFELT % 29)))
                          (LETT |gCoef| (SPADCALL |g| |ordg| (QREFELT % 29)))
                          (EXIT
                           (COND
                            ((SPADCALL |fCoef| |gCoef| (QREFELT % 30))
                             (SPADCALL (SPADCALL |f| (QREFELT % 31))
                                       (SPADCALL |g| (QREFELT % 31))
                                       (QREFELT % 32)))
                            (#2#
                             (SPADCALL |fCoef| |gCoef|
                                       (QREFELT % 33))))))))))))))) 

(SDEFUN |EXPUPXS;coerce;%Of;7| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL "%e" (QREFELT % 36))
                  (SPADCALL (SPADCALL |f| (QREFELT % 10)) (QREFELT % 37))
                  (QREFELT % 38))) 

(DECLAIM (NOTINLINE |ExponentialOfUnivariatePuiseuxSeries;|)) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G48 NIL)
    (#2=#:G47 NIL) (#3=#:G45 NIL) (#4=#:G44 NIL) (#5=#:G43 NIL) (#6=#:G42 NIL)
    (|pv$| NIL) (#7=#:G50 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|ExponentialOfUnivariatePuiseuxSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 60))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|))
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|SemiGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))))
                                        (|HasCategory| (|Fraction| (|Integer|))
                                                       '(|Comparable|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #2#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Fraction|
                                                                 (|Integer|)))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Fraction|
                                                                  (|Integer|)))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (AND #1#
                                             (|HasSignature| |#1|
                                                             (LIST '|integrate|
                                                                   (LIST
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    (|devaluate|
                                                                     |#1|)
                                                                    '(|Symbol|))))
                                             (|HasSignature| |#1|
                                                             (LIST '|variables|
                                                                   (LIST
                                                                    '(|List|
                                                                      (|Symbol|))
                                                                    (|devaluate|
                                                                     |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #2# (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #3#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #1# #4#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #5#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #1# #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #2#
                                            (|HasCategory| |#1| '(|Field|)) #3#
                                            #5#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR #1# #6#
                                            (|HasCategory| |#1|
                                                           '(|AbelianMonoid|))
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianMonoid|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #6#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1# #6#
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|CharacteristicNonZero|)))
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|CharacteristicZero|)))
                                            (AND #6# #2#)
                                            (AND #6#
                                                 (|HasCategory| |#1|
                                                                '(|Field|)))
                                            (AND #6# #3#) (AND #6# #5#)
                                            (AND #6# #4#)
                                            (AND #6#
                                                 (|HasCategory|
                                                  (|Fraction| (|Integer|))
                                                  '(|SemiGroup|)))
                                            (|HasCategory| |#1|
                                                           '(|AbelianMonoid|))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianGroup|)))
                                            (AND
                                             (|HasCategory| |#1|
                                                            '(|CharacteristicZero|))
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|Fraction| (|Integer|))
                                              '(|AbelianMonoid|)))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Fraction|
                                                                     (|Integer|))
                                                                   (|devaluate|
                                                                    |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|ExponentialOfUnivariatePuiseuxSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 536870912))
    (AND
     (OR #1#
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR #1# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #4#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #5#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 68719476736))
    (AND (LETT #7# (|HasCategory| % '(|AbelianGroup|)))
         (|augmentPredVector| % 137438953472))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #7#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR #6# (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #7#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|)
                                     '(|Fraction| (|Integer|))
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 549755813888))
    (AND (|HasCategory| % '(|SetWithZero|))
         (|augmentPredVector| % 1099511627776))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|UnivariatePuiseuxSeries| |#1| |#2| |#3|))
    %))) 

(DEFUN |ExponentialOfUnivariatePuiseuxSeries| (&REST #1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|ExponentialOfUnivariatePuiseuxSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ExponentialOfUnivariatePuiseuxSeries;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExponentialOfUnivariatePuiseuxSeries|)))))))))) 

(MAKEPROP '|ExponentialOfUnivariatePuiseuxSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariatePuiseuxSeries| 6 (NRTEVAL (QREFELT % 7))
                                         (NRTEVAL (QREFELT % 8)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep|
              (0 . |complete|) |EXPUPXS;exponential;Ups%;1|
              |EXPUPXS;exponent;%Ups;2| (|Fraction| 46) (5 . |0|) (9 . |order|)
              |EXPUPXS;exponentialOrder;%F;3|
              (|Record| (|:| |k| 13) (|:| |c| 6)) (|Stream| 17) (15 . |terms|)
              (20 . |complete|) (|List| 17) (25 . |entries|) (|Boolean|)
              |EXPUPXS;zero?;%B;4| (30 . =) |EXPUPXS;=;2%B;5| (36 . >) (42 . <)
              (48 . |coefficient|) (54 . =) (60 . |reductum|) |EXPUPXS;<;2%B;6|
              (65 . |smaller?|) (|String|) (|OutputForm|) (71 . |message|)
              (76 . |coerce|) (81 . ^) |EXPUPXS;coerce;%Of;7|
              (|PositiveInteger|) (|Mapping| 6 6) (|Symbol|)
              (|NonNegativeInteger|) (|List| 42) (|List| 43) (|Integer|)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Factored| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 50 '#1="failed") (|Union| 53 '#1#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 53) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Stream| 6))
           '#(~= 87 |zero?| 93 |variable| 98 |unitNormal| 103 |unitCanonical|
              108 |unit?| 113 |truncate| 118 |terms| 131 |tanh| 136 |tan| 141
              |subtractIfCan| 146 |squareFreePart| 152 |squareFree| 157 |sqrt|
              162 |smaller?| 167 |sizeLess?| 173 |sinh| 179 |sin| 184 |sign|
              189 |series| 194 |sech| 200 |sec| 205 |sample| 210 |rightRecip|
              214 |rightPower| 219 |rem| 231 |reductum| 237 |recip| 242 |quo|
              247 |principalIdeal| 253 |prime?| 258 |positive?| 263 |pole?| 268
              |plenaryPower| 273 |pi| 279 |order| 283 |opposite?| 294 |one?|
              300 |nthRoot| 305 |negative?| 311 |multiplyExponents| 316
              |multiEuclidean| 328 |monomial?| 334 |monomial| 339 |min| 345
              |max| 351 |map| 357 |log| 363 |leftRecip| 368 |leftPower| 373
              |leadingTerm| 385 |leadingSupport| 390 |leadingMonomial| 395
              |leadingCoefficient| 400 |lcmCoef| 405 |lcm| 411 |latex| 422
              |inv| 427 |integrate| 432 |gcdPolynomial| 443 |gcd| 449 |factor|
              460 |extendedEuclidean| 465 |extend| 478 |exquo| 484
              |expressIdealMember| 490 |exponentialOrder| 496 |exponential| 501
              |exponent| 506 |exp| 511 |eval| 516 |euclideanSize| 522 |elt| 527
              |divide| 539 |differentiate| 545 |degree| 582 |csch| 587 |csc|
              592 |coth| 597 |cot| 602 |cosh| 607 |cos| 612 |constructOrdered|
              617 |construct| 622 |complete| 627 |commutator| 632 |coerce| 638
              |coefficient| 663 |characteristic| 669 |center| 673 |atanh| 678
              |atan| 683 |associator| 688 |associates?| 695 |asinh| 701 |asin|
              706 |asech| 711 |asec| 716 |approximate| 721 |antiCommutator| 727
              |annihilate?| 733 |acsch| 739 |acsc| 744 |acoth| 749 |acot| 754
              |acosh| 759 |acos| 764 |abs| 769 ^ 774 D 804 >= 841 > 847 = 853
              <= 859 < 865 |1| 871 |0| 875 / 879 - 891 + 902 * 908)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 7 0 7 0 7 7 0 7 0 17 7 16 7 8 17 16 2 3 11
                                  22 8 22 16 19 11 8 16 11 0 8 21 0 0 0 8 8 22
                                  0 0 0 0 0 28 0 19 19 27 0 19 26 0 0 0 29 0 0
                                  0 16 5 0 7 7 17 16 21 5 5 5 5 5 5 4 1 6 0 0 0
                                  0))
            (CONS
             '#(NIL |Field&| NIL |EuclideanDomain&|
                |UnivariatePowerSeriesCategory&| |UniqueFactorizationDomain&|
                NIL |PowerSeriesCategory&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DivisionRing&| NIL NIL |Algebra&| |EntireRing&| |Algebra&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Module&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL |AbelianGroup&| |OrderedAbelianSemiGroup&|
                NIL NIL NIL |OrderedSet&| |MagmaWithUnit&| |AbelianMonoid&| NIL
                NIL |NonAssociativeSemiRng&| |SetWithZero&| |AbelianSemiGroup&|
                |Magma&| NIL NIL |TranscendentalFunctionCategory&|
                |SetCategory&| NIL NIL NIL NIL NIL |RadicalCategory&|
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL NIL NIL |BasicType&|
                NIL |PartialOrder&|)
             (CONS
              '#((|UnivariatePuiseuxSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 13)
                 (|EuclideanDomain|) (|UnivariatePowerSeriesCategory| 6 13)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 13 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 13) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 13) (|EntireRing|) (|Algebra| $$)
                 (|DifferentialRing|) (|PartialDifferentialRing| 42)
                 (|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 13) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|Module| 13) (|Module| $$)
                 (|Module| 6) (|SemiRng|) (|BiModule| 13 13)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 13) (|RightModule| 13)
                 (|LeftModule| 13) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|SemiGroup|) (|Comparable|) (|NonAssociativeSemiRng|)
                 (|SetWithZero|) (|AbelianSemiGroup|) (|Magma|)
                 (|ComparableRepresentation|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 35) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|) (|PartialOrder|))
              (|makeByteWordVec2| 59
                                  '(1 0 0 0 10 0 13 0 14 2 0 13 0 13 15 1 0 18
                                    0 19 1 18 0 0 20 1 18 21 0 22 2 21 23 0 0
                                    25 2 13 23 0 0 27 2 13 23 0 0 28 2 0 6 0 13
                                    29 2 6 23 0 0 30 1 0 0 0 31 2 6 23 0 0 33 1
                                    35 0 34 36 1 9 35 0 37 2 35 0 0 0 38 2 0 23
                                    0 0 1 1 37 23 0 24 1 0 42 0 1 1 32 48 0 1 1
                                    32 0 0 1 1 32 23 0 1 2 0 0 0 13 1 3 0 0 0
                                    13 13 1 1 0 18 0 19 1 5 0 0 1 1 5 0 0 1 2
                                    39 47 0 0 1 1 7 0 0 1 1 7 49 0 1 1 5 0 0 1
                                    2 0 23 0 0 1 2 7 23 0 0 1 1 5 0 0 1 1 5 0 0
                                    1 1 41 46 0 1 2 0 0 43 18 1 1 5 0 0 1 1 5 0
                                    0 1 0 37 0 1 1 35 47 0 1 2 0 0 0 40 1 2 35
                                    0 0 43 1 2 7 0 0 0 1 1 9 0 0 31 1 35 47 0 1
                                    2 7 0 0 0 1 1 7 56 53 1 1 7 23 0 1 1 41 23
                                    0 1 1 0 23 0 1 2 33 0 0 40 1 0 5 0 1 1 0 13
                                    0 1 2 0 13 0 13 15 2 37 23 0 0 1 1 35 23 0
                                    1 2 5 0 0 46 1 1 41 23 0 1 2 0 0 0 40 1 2 0
                                    0 0 13 1 2 7 52 53 0 1 1 0 23 0 1 2 0 0 6
                                    13 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 41 0 1 1
                                    5 0 0 1 1 35 47 0 1 2 0 0 0 40 1 2 35 0 0
                                    43 1 1 9 17 0 1 1 9 13 0 1 1 0 0 0 1 1 0 6
                                    0 1 2 7 58 0 0 1 1 7 0 53 1 2 7 0 0 0 1 1 0
                                    34 0 1 1 7 0 0 1 2 14 0 0 42 1 1 5 0 0 1 2
                                    7 57 57 57 1 2 7 0 0 0 1 1 7 0 53 1 1 7 49
                                    0 1 3 7 51 0 0 0 1 2 7 54 0 0 1 2 0 0 0 13
                                    1 2 32 47 0 0 1 2 7 52 53 0 1 1 0 13 0 16 1
                                    0 0 5 11 1 0 5 0 12 1 5 0 0 1 2 12 59 0 6 1
                                    1 7 43 0 1 2 0 6 0 13 1 2 4 0 0 0 1 2 7 55
                                    0 0 1 3 3 0 0 42 43 1 3 3 0 0 44 45 1 2 3 0
                                    0 44 1 2 3 0 0 42 1 2 2 0 0 43 1 1 2 0 0 1
                                    1 0 13 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1
                                    5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 9 0 21 1 1 0
                                    0 21 1 1 0 0 0 10 2 36 0 0 0 1 1 0 35 0 39
                                    1 30 0 6 1 1 31 0 13 1 1 34 0 0 1 1 36 0 46
                                    1 2 0 6 0 13 29 0 36 43 1 1 0 6 0 1 1 5 0 0
                                    1 1 5 0 0 1 3 36 0 0 0 0 1 2 32 23 0 0 1 1
                                    5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 2 13
                                    6 0 13 1 2 0 0 0 0 1 2 36 23 0 0 1 1 5 0 0
                                    1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1 5 0 0 1 1
                                    5 0 0 1 1 38 0 0 1 2 0 0 0 40 1 2 35 0 0 43
                                    1 2 5 0 0 0 1 2 5 0 0 13 1 2 7 0 0 46 1 3 3
                                    0 0 44 45 1 3 3 0 0 42 43 1 2 3 0 0 42 1 2
                                    3 0 0 44 1 2 2 0 0 43 1 1 2 0 0 1 2 0 23 0
                                    0 1 2 0 23 0 0 1 2 0 23 0 0 26 2 0 23 0 0 1
                                    2 0 23 0 0 32 0 35 0 1 0 37 0 1 2 7 0 0 6 1
                                    2 7 0 0 0 1 1 40 0 0 1 2 40 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 40 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2
                                    0 0 6 0 1 2 31 0 0 13 1 2 31 0 13 0 1 2 40
                                    0 46 0 1 2 37 0 43 0 1)))))
           '|lookupComplete|)) 
