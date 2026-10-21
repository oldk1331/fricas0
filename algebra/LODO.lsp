
(SDEFUN |LODO;coerce;%Of;1| ((|l| (%)) (% (|OutputForm|)))
        (SPADCALL |l| (QREFELT % 16) (QREFELT % 17))) 

(SDEFUN |LODO;elt;%2A;2| ((|p| (%)) (|a| (A)) (% (A)))
        (SPADCALL |p| (|spadConstant| % 20) |a| (QREFELT % 21))) 

(SDEFUN |LODO;symmetricProduct;3%;3| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 25))) 

(SDEFUN |LODO;symmetricPower;%Nni%;4|
        ((|a| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |a| |n| (QREFELT % 7) (QREFELT % 28))) 

(SDEFUN |LODO;directSum;3%;5| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 30))) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G44 NIL) (#2=#:G42 NIL)
    (#3=#:G43 NIL) (#4=#:G41 NIL) (#5=#:G40 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator| DV$1 DV$2))
    (LETT % (GETREFV 61))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4# #5#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #5#)
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#1| '(|CommutativeRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #4#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #5#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 549755813888))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 12
              (|SparseUnivariateSkewPolynomial| |#1| (|spadConstant| % 11)
                                                |#2|))
    (QSETREFV % 16 (SPADCALL 'D (QREFELT % 15)))
    (COND
     ((|testBitVector| |pv$| 30)
      (PROGN
       (QSETREFV % 26
                 (CONS (|dispatchFunction| |LODO;symmetricProduct;3%;3|) %))
       (QSETREFV % 29
                 (CONS (|dispatchFunction| |LODO;symmetricPower;%Nni%;4|) %))
       (QSETREFV % 31 (CONS (|dispatchFunction| |LODO;directSum;3%;5|) %)))))
    %))) 

(DEFUN |LinearOrdinaryDifferentialOperator| (&REST #1=#:G45)
  (SPROG NIL
         (PROG (#2=#:G46)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |LinearOrdinaryDifferentialOperator;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator|)))))))))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 6
                                                (NRTEVAL (|spadConstant| % 11))
                                                (NRTEVAL (QREFELT % 7)))
              (|local| |#1|) (|local| |#2|) (0 . |1|) (4 . |1|)
              (|Automorphism| 6) (8 . |1|) '|Rep| (|OutputForm|) (|Symbol|)
              (12 . |coerce|) '|outputD| (17 . |outputForm|)
              |LODO;coerce;%Of;1| (23 . |0|) (27 . |0|) (31 . |apply|)
              |LODO;elt;%2A;2| (|Mapping| 6 6)
              (|LinearOrdinaryDifferentialOperatorsOps| 6 $$)
              (38 . |symmetricProduct|) (45 . |symmetricProduct|)
              (|NonNegativeInteger|) (51 . |symmetricPower|)
              (58 . |symmetricPower|) (64 . |directSum|) (71 . |directSum|)
              (|Boolean|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 27) (|:| |c| 6)) (|List| 35) (|List| 27)
              (|List| %) (|List| 6) (|Union| 6 '#1="failed") (|Mapping| 27 27)
              (|SingletonAsOrderedSet|) (|List| 42) (|Union| 42 '"failed")
              (|Matrix| 47) (|Matrix| %) (|Integer|)
              (|Record| (|:| |mat| 45) (|:| |vec| (|Vector| 47))) (|Vector| %)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 47) (|Mapping| 6 27)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 52 '#1#) (|Union| 47 '#1#)
              (|Record| (|:| |mat| 60) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 77 |zero?| 83 |variables| 88 |unitNormal| 99 |unitCanonical|
              104 |unit?| 109 |totalDegreeSorted| 114 |totalDegree| 120
              |symmetricSquare| 131 |symmetricProduct| 136 |symmetricPower| 142
              |support| 148 |subtractIfCan| 153 |smaller?| 159 |sample| 165
              |right_ext_ext_GCD| 169 |rightRemainder| 175 |rightRecip| 181
              |rightQuotient| 186 |rightPower| 192 |rightLcm| 204 |rightGcd|
              210 |rightExtendedGcd| 216 |rightExactQuotient| 222 |rightDivide|
              228 |retractIfCan| 234 |retract| 249 |reductum| 264
              |reducedSystem| 269 |recip| 291 |primitivePart| 296
              |primitiveMonomials| 301 |pomopo!| 306 |plenaryPower| 314
              |opposite?| 320 |one?| 326 |numberOfMonomials| 331 |monomials|
              336 |monomial?| 341 |monomial| 346 |monicRightDivide| 366
              |monicLeftDivide| 372 |minimumDegree| 378 |mapExponents| 383
              |map| 389 |mainVariable| 395 |listOfTerms| 400 |linearExtend| 405
              |leftRemainder| 411 |leftRecip| 417 |leftQuotient| 422
              |leftPower| 428 |leftLcm| 440 |leftGcd| 446 |leftExtendedGcd| 452
              |leftExactQuotient| 458 |leftDivide| 464 |leadingTerm| 470
              |leadingSupport| 475 |leadingMonomial| 480 |leadingCoefficient|
              485 |latex| 490 |ground?| 495 |ground| 500 |fmecg| 505 |exquo|
              513 |elt| 525 |directSum| 531 |degree| 537 |content| 554
              |constructOrdered| 559 |construct| 564 |commutator| 569 |coerce|
              575 |coefficients| 600 |coefficient| 605 |characteristic| 625
              |binomThmExpt| 629 |associator| 636 |associates?| 643 |apply| 649
              |antiCommutator| 656 |annihilate?| 662 |adjoint| 668 ^ 673 D 685
              = 689 |1| 695 |0| 699 / 703 - 709 + 720 * 726)
           'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 0 0 0 5 4 1 12 5 14 12 1 0 11 5 1 0 0 11
                                  22 11 1 0 0 0 12 22 1 1 0 0 0 0 0 13 14 14 29
                                  14 28 9 0 0 25 10 0 0 0 7 6 0 0 11 8 7 6 4 3
                                  2 0 0 0 0))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |EntireRing&| |Algebra&| NIL
                |NonAssociativeAlgebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |FreeModuleCategory&| |FullyLinearlyExplicitOver&| |Module&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL NIL |NonAssociativeSemiRng&| |SetWithZero&| NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&|
                NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 27 42)
                 (|FiniteAbelianMonoidRing| 6 27) (|AbelianMonoidRing| 6 27)
                 (|Algebra| 6) (|EntireRing|) (|Algebra| 52) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 52) (|FreeModuleCategory| 6 27)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 52)
                 (|IndexedDirectProductCategory| 6 27) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 47)
                 (|LinearlyExplicitOver| 6) (|BiModule| 52 52)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 27) (|NonAssociativeRng|)
                 (|RightModule| 47) (|RightModule| 52) (|LeftModule| 52)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 47)
                 (|RetractableTo| 52) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 47)
                 (|CoercibleFrom| 52) (|noZeroDivisors|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 13) (|BasicType|) (|CoercibleFrom| 6)
                 (|Eltable| 6 6))
              (|makeByteWordVec2| 60
                                  '(0 0 0 8 0 6 0 9 0 10 0 11 1 14 13 0 15 2 12
                                    13 0 13 17 0 0 0 19 0 6 0 20 3 0 6 0 6 6 21
                                    3 24 2 2 2 23 25 2 0 0 0 0 26 3 24 2 2 27
                                    23 28 2 0 0 0 27 29 3 24 2 2 2 23 30 2 0 0
                                    0 0 31 2 0 32 0 0 1 1 38 32 0 1 2 0 43 0 0
                                    1 1 0 43 0 1 1 33 51 0 1 1 33 0 0 1 1 33 32
                                    0 1 2 0 27 0 43 1 1 0 27 0 1 2 0 27 0 43 1
                                    1 30 0 0 1 2 30 0 0 0 26 2 30 0 0 27 29 1 0
                                    37 0 1 2 39 50 0 0 1 2 19 32 0 0 1 0 38 0 1
                                    2 30 56 0 0 1 2 30 0 0 0 1 1 36 50 0 1 2 30
                                    0 0 0 1 2 0 0 0 34 1 2 36 0 0 27 1 2 30 0 0
                                    0 1 2 30 0 0 0 1 2 30 55 0 0 1 2 30 50 0 0
                                    1 2 30 54 0 0 1 1 0 40 0 1 1 6 57 0 1 1 7
                                    58 0 1 1 0 6 0 1 1 6 52 0 1 1 7 47 0 1 1 15
                                    0 0 1 1 21 45 46 1 2 21 48 46 49 1 2 11 59
                                    46 49 1 1 11 60 46 1 1 36 50 0 1 1 18 0 0 1
                                    1 14 38 0 1 4 0 0 0 6 27 0 1 2 34 0 0 34 1
                                    2 38 32 0 0 1 1 36 32 0 1 1 0 27 0 1 1 0 38
                                    0 1 1 0 32 0 1 2 0 0 6 27 1 3 0 0 0 42 27 1
                                    3 0 0 0 43 37 1 2 16 54 0 0 1 2 16 54 0 0 1
                                    1 0 27 0 1 2 0 0 41 0 1 2 0 0 23 0 1 1 0 44
                                    0 1 1 0 36 0 1 2 5 6 53 0 1 2 30 0 0 0 1 1
                                    36 50 0 1 2 30 0 0 0 1 2 0 0 0 34 1 2 36 0
                                    0 27 1 2 30 0 0 0 1 2 30 0 0 0 1 2 30 55 0
                                    0 1 2 30 50 0 0 1 2 30 54 0 0 1 1 15 35 0 1
                                    1 15 27 0 1 1 15 0 0 1 1 15 6 0 1 1 0 33 0
                                    1 1 0 32 0 1 1 0 6 0 1 4 11 0 0 27 6 0 1 2
                                    33 50 0 0 1 2 4 50 0 6 1 2 0 6 0 6 22 2 30
                                    0 0 0 31 1 0 27 0 1 2 0 27 0 42 1 2 0 37 0
                                    43 1 1 18 6 0 1 1 15 0 36 1 1 0 0 36 1 2 37
                                    0 0 0 1 1 0 13 0 18 1 0 0 6 1 1 31 0 0 1 1
                                    35 0 47 1 1 17 0 52 1 1 0 39 0 1 2 0 6 0 27
                                    1 3 0 0 0 42 27 1 3 0 0 0 43 37 1 0 37 27 1
                                    3 32 0 0 0 27 1 3 37 0 0 0 0 1 2 33 32 0 0
                                    1 3 0 6 0 6 6 21 2 0 0 0 0 1 2 37 32 0 0 1
                                    1 0 0 0 1 2 0 0 0 34 1 2 36 0 0 27 1 0 0 0
                                    1 2 0 32 0 0 1 0 36 0 8 0 38 0 19 2 30 0 0
                                    6 1 1 40 0 0 1 2 40 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 34 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 6 0
                                    1 2 21 0 0 47 1 2 40 0 47 0 1 2 38 0 27 0 1
                                    2 1 0 52 0 1 2 1 0 0 52 1)))))
           '|lookupComplete|)) 
