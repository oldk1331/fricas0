
(SDEFUN |OREUP;coerce;V%;1| ((|v| (|Variable| |x|)) (% (%)))
        (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 16))) 

(SDEFUN |OREUP;coerce;%Of;2| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL (QREFELT % 6) (QREFELT % 21)) (QREFELT % 22))) 

(DECLAIM (NOTINLINE |UnivariateSkewPolynomial;|)) 

(DEFUN |UnivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G37 NIL) (#2=#:G35 NIL) (#3=#:G36 NIL) (#4=#:G34 NIL) (#5=#:G33 NIL)
    (|pv$| NIL))
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
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
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
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#2|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
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
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#2|
                                                        '(|ComparableRepresentation|)))
                                        (|HasCategory| |#2| '(|Field|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
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
                                          #2#)
                                         (AND #2#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
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
                                         #4# #5#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#)))))
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
     (|augmentPredVector| % 1073741824))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#2| '(|CommutativeRing|))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#2| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND #2# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #4#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND #2# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #5#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND #2# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#2| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 549755813888))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|SparseUnivariateSkewPolynomial| |#2| |#3| |#4|))
    %))) 

(DEFUN |UnivariateSkewPolynomial| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
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

(MAKEPROP '|UnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseUnivariateSkewPolynomial| 7 (NRTEVAL (QREFELT % 8))
                                                (NRTEVAL (QREFELT % 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Automorphism| 7) (0 . |1|) (4 . |1|) (8 . |1|)
              (|NonNegativeInteger|) (12 . |monomial|)
              (|Variable| (NRTEVAL (QREFELT % 6))) |OREUP;coerce;V%;1|
              (|Symbol|) (|OutputForm|) (18 . |outputForm|) (23 . |outputForm|)
              |OREUP;coerce;%Of;2| (|Boolean|) (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 15) (|:| |c| 7)) (|List| 27) (|Mapping| 7 7)
              (|List| 15) (|List| %) (|List| 7) (|Union| 7 '#1="failed")
              (|Mapping| 15 15) (|List| 36) (|SingletonAsOrderedSet|)
              (|Union| 36 '"failed") (|Integer|)
              (|Record| (|:| |mat| 42) (|:| |vec| (|Vector| 38))) (|Matrix| %)
              (|Vector| %) (|Matrix| 38) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 38) (|Mapping| 7 15)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 45 '#1#) (|Union| 38 '#1#)
              (|Record| (|:| |mat| 53) (|:| |vec| (|Vector| 7))) (|Matrix| 7))
           '#(~= 29 |zero?| 35 |variables| 40 |unitNormal| 51 |unitCanonical|
              56 |unit?| 61 |totalDegreeSorted| 66 |totalDegree| 72 |support|
              83 |subtractIfCan| 88 |smaller?| 94 |sample| 100
              |right_ext_ext_GCD| 104 |rightRemainder| 110 |rightRecip| 116
              |rightQuotient| 121 |rightPower| 127 |rightLcm| 139 |rightGcd|
              145 |rightExtendedGcd| 151 |rightExactQuotient| 157 |rightDivide|
              163 |retractIfCan| 169 |retract| 184 |reductum| 199
              |reducedSystem| 204 |recip| 226 |primitivePart| 231
              |primitiveMonomials| 236 |pomopo!| 241 |plenaryPower| 249
              |opposite?| 255 |one?| 261 |numberOfMonomials| 266 |monomials|
              271 |monomial?| 276 |monomial| 281 |monicRightDivide| 301
              |monicLeftDivide| 307 |minimumDegree| 313 |mapExponents| 318
              |map| 324 |mainVariable| 330 |listOfTerms| 335 |linearExtend| 340
              |leftRemainder| 346 |leftRecip| 352 |leftQuotient| 357
              |leftPower| 363 |leftLcm| 375 |leftGcd| 381 |leftExtendedGcd| 387
              |leftExactQuotient| 393 |leftDivide| 399 |leadingTerm| 405
              |leadingSupport| 410 |leadingMonomial| 415 |leadingCoefficient|
              420 |latex| 425 |ground?| 430 |ground| 435 |fmecg| 440 |exquo|
              448 |degree| 460 |content| 477 |constructOrdered| 482 |construct|
              487 |commutator| 492 |coerce| 498 |coefficients| 528
              |coefficient| 533 |characteristic| 553 |binomThmExpt| 557
              |associator| 564 |associates?| 571 |apply| 577 |antiCommutator|
              584 |annihilate?| 590 ^ 596 = 608 |1| 614 |0| 618 / 622 - 628 +
              639 * 645)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(0 0 0 0 5 4 1 12 5 14 12 1 0 11 5 1 0 0 11 23
                                  11 1 0 0 0 12 23 1 1 0 0 0 0 0 13 14 14 30 14
                                  29 9 0 0 26 10 0 0 0 7 6 0 0 11 8 7 6 4 3 2 0
                                  0 0))
            (CONS
             '#(|UnivariateSkewPolynomialCategory&|
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
                NIL)
             (CONS
              '#((|UnivariateSkewPolynomialCategory| 7)
                 (|MaybeSkewPolynomialCategory| 7 15 36)
                 (|FiniteAbelianMonoidRing| 7 15) (|AbelianMonoidRing| 7 15)
                 (|Algebra| 7) (|EntireRing|) (|Algebra| 45) (|Ring|)
                 (|NonAssociativeAlgebra| 7) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 45) (|FreeModuleCategory| 7 15)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| 45)
                 (|IndexedDirectProductCategory| 7 15) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 38)
                 (|LinearlyExplicitOver| 7) (|BiModule| 45 45)
                 (|BiModule| $$ $$) (|BiModule| 7 7)
                 (|IndexedProductCategory| 7 15) (|NonAssociativeRng|)
                 (|RightModule| 38) (|RightModule| 45) (|LeftModule| 45)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 7)
                 (|LeftModule| 7) (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 7) (|RetractableTo| 38)
                 (|RetractableTo| 45) (|SetCategory|) (|RetractableTo| 7)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 38)
                 (|CoercibleFrom| 45) (|noZeroDivisors|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 20) (|BasicType|) (|CoercibleFrom| 7))
              (|makeByteWordVec2| 53
                                  '(0 11 0 12 0 0 0 13 0 7 0 14 2 0 0 7 15 16 1
                                    20 0 19 21 2 10 20 0 20 22 2 0 24 0 0 1 1
                                    38 24 0 1 1 0 35 0 1 2 0 35 0 0 1 1 33 44 0
                                    1 1 33 0 0 1 1 33 24 0 1 2 0 15 0 35 1 2 0
                                    15 0 35 1 1 0 15 0 1 1 0 30 0 1 2 39 43 0 0
                                    1 2 19 24 0 0 1 0 38 0 1 2 20 49 0 0 1 2 20
                                    0 0 0 1 1 36 43 0 1 2 20 0 0 0 1 2 0 0 0 26
                                    1 2 36 0 0 15 1 2 20 0 0 0 1 2 20 0 0 0 1 2
                                    20 48 0 0 1 2 20 43 0 0 1 2 20 47 0 0 1 1 0
                                    33 0 1 1 6 50 0 1 1 7 51 0 1 1 0 7 0 1 1 6
                                    45 0 1 1 7 38 0 1 1 15 0 0 1 2 22 39 40 41
                                    1 1 22 42 40 1 2 11 52 40 41 1 1 11 53 40 1
                                    1 36 43 0 1 1 18 0 0 1 1 14 31 0 1 4 0 0 0
                                    7 15 0 1 2 34 0 0 26 1 2 38 24 0 0 1 1 36
                                    24 0 1 1 0 15 0 1 1 0 31 0 1 1 0 24 0 1 2 0
                                    0 7 15 16 3 0 0 0 35 30 1 3 0 0 0 36 15 1 2
                                    16 47 0 0 1 2 16 47 0 0 1 1 0 15 0 1 2 0 0
                                    34 0 1 2 0 0 29 0 1 1 0 37 0 1 1 0 28 0 1 2
                                    5 7 46 0 1 2 20 0 0 0 1 1 36 43 0 1 2 20 0
                                    0 0 1 2 0 0 0 26 1 2 36 0 0 15 1 2 20 0 0 0
                                    1 2 20 0 0 0 1 2 20 48 0 0 1 2 20 43 0 0 1
                                    2 20 47 0 0 1 1 15 27 0 1 1 15 15 0 1 1 15
                                    0 0 1 1 15 7 0 1 1 0 25 0 1 1 0 24 0 1 1 0
                                    7 0 1 4 11 0 0 15 7 0 1 2 33 43 0 0 1 2 4
                                    43 0 7 1 1 0 15 0 1 2 0 30 0 35 1 2 0 15 0
                                    36 1 1 18 7 0 1 1 15 0 28 1 1 0 0 28 1 2 37
                                    0 0 0 1 1 0 20 0 23 1 0 0 7 1 1 0 0 17 18 1
                                    31 0 0 1 1 35 0 38 1 1 17 0 45 1 1 0 32 0 1
                                    2 0 7 0 15 1 3 0 0 0 36 15 1 3 0 0 0 35 30
                                    1 0 37 15 1 3 32 0 0 0 15 1 3 37 0 0 0 0 1
                                    2 33 24 0 0 1 3 0 7 0 7 7 1 2 0 0 0 0 1 2
                                    37 24 0 0 1 2 0 0 0 26 1 2 36 0 0 15 1 2 0
                                    24 0 0 1 0 36 0 13 0 38 0 1 2 20 0 0 7 1 1
                                    40 0 0 1 2 40 0 0 0 1 2 0 0 0 0 1 2 0 0 26
                                    0 1 2 0 0 0 0 1 2 0 0 0 7 1 2 0 0 7 0 1 2
                                    22 0 0 38 1 2 40 0 38 0 1 2 38 0 15 0 1 2 1
                                    0 0 45 1 2 1 0 45 0 1)))))
           '|lookupComplete|)) 
