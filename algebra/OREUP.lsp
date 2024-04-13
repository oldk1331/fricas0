
(SDEFUN |OREUP;coerce;V%;1| ((|v| (|Variable| |x|)) (% (%)))
        (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 16))) 

(SDEFUN |OREUP;coerce;%Of;2| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL (QREFELT % 6) (QREFELT % 21)) (QREFELT % 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G53)
  (SPROG NIL
         (PROG (#2=#:G54)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T NIL NIL))
                     (HGET |$ConstructorCache| '|UnivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateSkewPolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateSkewPolynomial|)))))))))) 

(DEFUN |UnivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) (#1=#:G50 NIL) (#2=#:G52 NIL) (#3=#:G51 NIL) (% NIL)
    (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|UnivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 54))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|UnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#2| '(|CommutativeRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|SparseUnivariateSkewPolynomial| |#2| |#3| |#4|))
    %))) 

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 7 (NRTEVAL (QREFELT % 8))
                                                (NRTEVAL (QREFELT % 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |One|) (4 . |One|) (8 . |One|)
              (|NonNegativeInteger|) (12 . |monomial|)
              (|Variable| (NRTEVAL (QREFELT % 6))) |OREUP;coerce;V%;1|
              (|Symbol|) (|OutputForm|) (18 . |outputForm|) (23 . |outputForm|)
              |OREUP;coerce;%Of;2| (|Matrix| 28) (|Matrix| %)
              (|Record| (|:| |mat| 24) (|:| |vec| (|Vector| 28))) (|Vector| %)
              (|Integer|) (|Boolean|) (|Union| % '"failed") (|PositiveInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 28) (|Record| (|:| |k| 15) (|:| |c| 7)) (|List| 34)
              (|Mapping| 7 15)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 33 '#1="failed") (|Union| 28 '#1#) (|Matrix| 7)
              (|Record| (|:| |mat| 42) (|:| |vec| (|Vector| 7))) (|List| %)
              (|List| 48) (|List| 15) (|Union| 48 '"failed")
              (|SingletonAsOrderedSet|) (|Mapping| 15 15) (|Union| 7 '#1#)
              (|List| 7) (|Mapping| 7 7) (|String|))
           '#(~= 29 |zero?| 35 |variables| 40 |unitNormal| 45 |unitCanonical|
              50 |unit?| 55 |totalDegreeSorted| 60 |totalDegree| 66 |support|
              77 |subtractIfCan| 82 |smaller?| 88 |sample| 94
              |right_ext_ext_GCD| 98 |rightRemainder| 104 |rightRecip| 110
              |rightQuotient| 115 |rightPower| 121 |rightLcm| 133 |rightGcd|
              139 |rightExtendedGcd| 145 |rightExactQuotient| 151 |rightDivide|
              157 |retractIfCan| 163 |retract| 178 |reductum| 193
              |reducedSystem| 198 |recip| 220 |primitivePart| 225
              |primitiveMonomials| 230 |pomopo!| 235 |plenaryPower| 243
              |opposite?| 249 |one?| 255 |numberOfMonomials| 260 |monomials|
              265 |monomial?| 270 |monomial| 275 |monicRightDivide| 295
              |monicLeftDivide| 301 |minimumDegree| 307 |mapExponents| 312
              |map| 318 |mainVariable| 324 |listOfTerms| 329 |linearExtend| 334
              |leftRemainder| 340 |leftRecip| 346 |leftQuotient| 351
              |leftPower| 357 |leftLcm| 369 |leftGcd| 375 |leftExtendedGcd| 381
              |leftExactQuotient| 387 |leftDivide| 393 |leadingTerm| 399
              |leadingSupport| 404 |leadingMonomial| 409 |leadingCoefficient|
              414 |latex| 419 |ground?| 424 |ground| 429 |fmecg| 434 |exquo|
              442 |degree| 454 |content| 471 |constructOrdered| 476 |construct|
              481 |commutator| 486 |coerce| 492 |coefficients| 522
              |coefficient| 527 |charthRoot| 547 |characteristic| 552
              |binomThmExpt| 556 |associator| 563 |associates?| 570 |apply| 576
              |antiCommutator| 583 |annihilate?| 589 ^ 595 |Zero| 607 |One| 611
              = 615 / 621 - 627 + 638 * 644)
           'NIL
           (CONS
            (|makeByteWordVec2| 27
                                '(0 0 0 0 1 2 3 4 5 11 0 1 11 13 5 0 0 1 5 10 0
                                  0 0 1 10 21 10 0 0 0 0 0 1 1 21 11 12 27 13
                                  13 0 0 26 13 0 0 0 9 0 0 6 7 0 0 0 4 6 7 8
                                  10))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| NIL NIL |EntireRing&|
                |Algebra&| NIL |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |Rng&| NIL |NonAssociativeAlgebra&| NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 7)
                 (|MaybeSkewPolynomialCategory| 7 15 48)
                 (|FiniteAbelianMonoidRing| 7 15) (|AbelianMonoidRing| 7 15)
                 (|Algebra| 33) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 7) (|Ring|)
                 (|FreeModuleCategory| 7 15) (|NonAssociativeAlgebra| 33)
                 (|Rng|) (|SemiRing|) (|NonAssociativeAlgebra| 7) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7 15) (|Module| 33)
                 (|Module| 7) (|FullyLinearlyExplicitOver| 7)
                 (|IndexedProductCategory| 7 15) (|BiModule| 7 7)
                 (|BiModule| $$ $$) (|BiModule| 33 33)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 28)
                 (|NonAssociativeRing|) (|AbelianProductCategory| 7)
                 (|LeftModule| 7) (|RightModule| 7) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 33) (|RightModule| 33)
                 (|RightModule| 28) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 7)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| 7) (|SetCategory|) (|RetractableTo| 33)
                 (|RetractableTo| 28) (|CoercibleFrom| 7) (|BasicType|)
                 (|CoercibleTo| 20) (|noZeroDivisors|) (|CoercibleFrom| 33)
                 (|CoercibleFrom| 28) (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 53
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 29 0 0 1 1
                                    35 29 0 1 1 0 45 0 1 1 30 32 0 1 1 30 0 0 1
                                    1 30 29 0 1 2 0 15 0 45 1 2 0 15 0 45 1 1 0
                                    15 0 1 1 0 46 0 1 2 36 30 0 0 1 2 9 29 0 0
                                    1 0 35 0 1 2 18 38 0 0 1 2 18 0 0 0 1 1 33
                                    30 0 1 2 18 0 0 0 1 2 33 0 0 15 1 2 0 0 0
                                    31 1 2 18 0 0 0 1 2 18 0 0 0 1 2 18 37 0 0
                                    1 2 18 30 0 0 1 2 18 39 0 0 1 1 6 40 0 1 1
                                    7 41 0 1 1 0 50 0 1 1 6 33 0 1 1 7 28 0 1 1
                                    0 7 0 1 1 14 0 0 1 1 20 24 25 1 2 20 26 25
                                    27 1 1 10 42 25 1 2 10 43 25 27 1 1 33 30 0
                                    1 1 17 0 0 1 1 13 44 0 1 4 0 0 0 7 15 0 1 2
                                    31 0 0 31 1 2 35 29 0 0 1 1 33 29 0 1 1 0
                                    15 0 1 1 0 44 0 1 1 0 29 0 1 3 0 0 0 45 46
                                    1 3 0 0 0 48 15 1 2 0 0 7 15 16 2 15 39 0 0
                                    1 2 15 39 0 0 1 1 0 15 0 1 2 0 0 49 0 1 2 0
                                    0 52 0 1 1 0 47 0 1 1 0 35 0 1 2 5 7 36 0 1
                                    2 18 0 0 0 1 1 33 30 0 1 2 18 0 0 0 1 2 33
                                    0 0 15 1 2 0 0 0 31 1 2 18 0 0 0 1 2 18 0 0
                                    0 1 2 18 37 0 0 1 2 18 30 0 0 1 2 18 39 0 0
                                    1 1 14 34 0 1 1 14 15 0 1 1 14 0 0 1 1 14 7
                                    0 1 1 0 53 0 1 1 0 29 0 1 1 0 7 0 1 4 10 0
                                    0 15 7 0 1 2 30 30 0 0 1 2 4 30 0 7 1 2 0
                                    46 0 45 1 2 0 15 0 48 1 1 0 15 0 1 1 17 7 0
                                    1 1 14 0 35 1 1 0 0 35 1 2 34 0 0 0 1 1 32
                                    0 28 1 1 28 0 0 1 1 16 0 33 1 1 0 0 17 18 1
                                    0 0 7 1 1 0 20 0 23 1 0 51 0 1 3 0 0 0 48
                                    15 1 3 0 0 0 45 46 1 2 0 7 0 15 1 1 2 30 0
                                    1 0 34 15 1 3 29 0 0 0 15 1 3 34 0 0 0 0 1
                                    2 30 29 0 0 1 3 0 7 0 7 7 1 2 0 0 0 0 1 2
                                    34 29 0 0 1 2 33 0 0 15 1 2 0 0 0 31 1 0 35
                                    0 1 0 33 0 13 2 0 29 0 0 1 2 18 0 0 7 1 2
                                    37 0 0 0 1 1 37 0 0 1 2 0 0 0 0 1 2 20 0 0
                                    28 1 2 37 0 28 0 1 2 35 0 15 0 1 2 1 0 33 0
                                    1 2 1 0 0 33 1 2 0 0 7 0 1 2 0 0 0 7 1 2 0
                                    0 0 0 1 2 0 0 31 0 1)))))
           '|lookupComplete|)) 
