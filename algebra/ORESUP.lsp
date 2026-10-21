
(SDEFUN |ORESUP;^;%Pi%;1| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (SPADCALL |x| |n| (QREFELT % 11))) 

(SDEFUN |ORESUP;^;%Nni%;2| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((ZEROP |n|) (|spadConstant| % 13))
              ('T (SPADCALL |x| |n| (QREFELT % 11))))) 

(SDEFUN |ORESUP;*;3%;3| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))) 

(SDEFUN |ORESUP;*;%R%;4| ((|x| (%)) (|r| (R)) (% (%)))
        (SPADCALL |x| (SPADCALL |r| (|spadConstant| % 13) (QREFELT % 22))
                  (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))) 

(SDEFUN |ORESUP;apply;%3R;5| ((|p| (%)) (|c| (R)) (|r| (R)) (% (R)))
        (SPADCALL |p| |c| |r| (QREFELT % 7) (QREFELT % 8) (QREFELT % 24))) 

(SDEFUN |ORESUP;monicLeftDivide;2%R;6|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 27))) 

(SDEFUN |ORESUP;monicRightDivide;2%R;7|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 30))) 

(SDEFUN |ORESUP;leftDivide;2%R;8|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 32))) 

(SDEFUN |ORESUP;rightDivide;2%R;9|
        ((|a| (%)) (|b| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPADCALL |a| |b| (QREFELT % 7) (QREFELT % 34))) 

(DECLAIM (NOTINLINE |SparseUnivariateSkewPolynomial;|)) 

(DEFUN |SparseUnivariateSkewPolynomial;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G51 NIL)
    (#2=#:G49 NIL) (#3=#:G50 NIL) (#4=#:G48 NIL) (#5=#:G47 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|SparseUnivariateSkewPolynomial| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 64))
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
                                        (|HasCategory| |#1| '(|Field|))
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
                                         #5#)))))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
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
    (COND
     ((|testBitVector| |pv$| 16)
      (PROGN
       (QSETREFV % 29
                 (CONS (|dispatchFunction| |ORESUP;monicLeftDivide;2%R;6|) %))
       (QSETREFV % 31
                 (CONS (|dispatchFunction| |ORESUP;monicRightDivide;2%R;7|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 20)
      (PROGN
       (QSETREFV % 33 (CONS (|dispatchFunction| |ORESUP;leftDivide;2%R;8|) %))
       (QSETREFV % 35
                 (CONS (|dispatchFunction| |ORESUP;rightDivide;2%R;9|) %)))))
    %))) 

(DEFUN |SparseUnivariateSkewPolynomial| (&REST #1=#:G52)
  (SPROG NIL
         (PROG (#2=#:G53)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseUnivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateSkewPolynomial|)))))))))) 

(MAKEPROP '|SparseUnivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|PositiveInteger|)
              (|RepeatedSquaring| $$) (0 . |expt|) |ORESUP;^;%Pi%;1| (6 . |1|)
              (|NonNegativeInteger|) |ORESUP;^;%Nni%;2| (|Automorphism| 6)
              (|Mapping| 6 6) (|UnivariateSkewPolynomialCategoryOps| 6 $$)
              (10 . |times|) |ORESUP;*;3%;3| (18 . |1|) (22 . *)
              |ORESUP;*;%R%;4| (28 . |apply|) |ORESUP;apply;%3R;5|
              (|Record| (|:| |quotient| $$) (|:| |remainder| $$))
              (37 . |monicLeftDivide|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (44 . |monicLeftDivide|) (50 . |monicRightDivide|)
              (57 . |monicRightDivide|) (63 . |leftDivide|) (70 . |leftDivide|)
              (76 . |rightDivide|) (83 . |rightDivide|) (|Boolean|) (|String|)
              (|OutputForm|) (|Record| (|:| |k| 14) (|:| |c| 6)) (|List| 39)
              (|List| 14) (|List| %) (|List| 6) (|Union| 6 '#1="failed")
              (|Mapping| 14 14) (|List| 47) (|SingletonAsOrderedSet|)
              (|Union| 47 '"failed") (|Integer|)
              (|Record| (|:| |mat| 53) (|:| |vec| (|Vector| 49))) (|Matrix| %)
              (|Vector| %) (|Matrix| 49) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 49) (|Mapping| 6 14)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 56 '#1#) (|Union| 49 '#1#)
              (|Record| (|:| |mat| 63) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 89 |zero?| 95 |variables| 100 |unitNormal| 111 |unitCanonical|
              116 |unit?| 121 |totalDegreeSorted| 126 |totalDegree| 132
              |support| 143 |subtractIfCan| 148 |smaller?| 154 |sample| 160
              |right_ext_ext_GCD| 164 |rightRemainder| 170 |rightRecip| 176
              |rightQuotient| 181 |rightPower| 187 |rightLcm| 199 |rightGcd|
              205 |rightExtendedGcd| 211 |rightExactQuotient| 217 |rightDivide|
              223 |retractIfCan| 229 |retract| 244 |reductum| 259
              |reducedSystem| 264 |recip| 286 |primitivePart| 291
              |primitiveMonomials| 296 |pomopo!| 301 |plenaryPower| 309
              |outputForm| 315 |opposite?| 321 |one?| 327 |numberOfMonomials|
              332 |monomials| 337 |monomial?| 342 |monomial| 347
              |monicRightDivide| 367 |monicLeftDivide| 373 |minimumDegree| 379
              |mapExponents| 384 |map| 390 |mainVariable| 396 |listOfTerms| 401
              |linearExtend| 406 |leftRemainder| 412 |leftRecip| 418
              |leftQuotient| 423 |leftPower| 429 |leftLcm| 441 |leftGcd| 447
              |leftExtendedGcd| 453 |leftExactQuotient| 459 |leftDivide| 465
              |leadingTerm| 471 |leadingSupport| 476 |leadingMonomial| 481
              |leadingCoefficient| 486 |latex| 491 |ground?| 496 |ground| 501
              |fmecg| 506 |exquo| 514 |degree| 526 |content| 543
              |constructOrdered| 548 |construct| 553 |commutator| 558 |coerce|
              564 |coefficients| 589 |coefficient| 594 |characteristic| 614
              |binomThmExpt| 618 |associator| 625 |associates?| 632 |apply| 638
              |antiCommutator| 645 |annihilate?| 651 ^ 657 = 669 |1| 675 |0|
              679 / 683 - 689 + 700 * 706)
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
              '#((|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 14 47)
                 (|FiniteAbelianMonoidRing| 6 14) (|AbelianMonoidRing| 6 14)
                 (|Algebra| 6) (|EntireRing|) (|Algebra| 56) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 56) (|FreeModuleCategory| 6 14)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 56)
                 (|IndexedDirectProductCategory| 6 14) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 49)
                 (|LinearlyExplicitOver| 6) (|BiModule| 56 56)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 14) (|NonAssociativeRng|)
                 (|RightModule| 49) (|RightModule| 56) (|LeftModule| 56)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 49)
                 (|RetractableTo| 56) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 49)
                 (|CoercibleFrom| 56) (|noZeroDivisors|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 38) (|BasicType|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 63
                                  '(2 10 2 2 9 11 0 0 0 13 4 18 2 2 2 16 17 19
                                    0 16 0 21 2 0 0 6 0 22 5 18 6 2 6 6 16 17
                                    24 3 18 26 2 2 16 27 2 0 28 0 0 29 3 18 26
                                    2 2 16 30 2 0 28 0 0 31 3 18 26 2 2 16 32 2
                                    0 28 0 0 33 3 18 26 2 2 16 34 2 0 28 0 0 35
                                    2 0 36 0 0 1 1 38 36 0 1 1 0 46 0 1 2 0 46
                                    0 0 1 1 33 55 0 1 1 33 0 0 1 1 33 36 0 1 2
                                    0 14 0 46 1 2 0 14 0 46 1 1 0 14 0 1 1 0 41
                                    0 1 2 39 54 0 0 1 2 19 36 0 0 1 0 38 0 1 2
                                    20 59 0 0 1 2 20 0 0 0 1 1 36 54 0 1 2 20 0
                                    0 0 1 2 0 0 0 9 1 2 36 0 0 14 1 2 20 0 0 0
                                    1 2 20 0 0 0 1 2 20 58 0 0 1 2 20 54 0 0 1
                                    2 20 28 0 0 35 1 0 44 0 1 1 6 60 0 1 1 7 61
                                    0 1 1 0 6 0 1 1 6 56 0 1 1 7 49 0 1 1 15 0
                                    0 1 2 22 50 51 52 1 1 22 53 51 1 2 11 62 51
                                    52 1 1 11 63 51 1 1 36 54 0 1 1 18 0 0 1 1
                                    14 42 0 1 4 0 0 0 6 14 0 1 2 34 0 0 9 1 2 0
                                    38 0 38 1 2 38 36 0 0 1 1 36 36 0 1 1 0 14
                                    0 1 1 0 42 0 1 1 0 36 0 1 2 0 0 6 14 1 3 0
                                    0 0 46 41 1 3 0 0 0 47 14 1 2 16 28 0 0 31
                                    2 16 28 0 0 29 1 0 14 0 1 2 0 0 45 0 1 2 0
                                    0 17 0 1 1 0 48 0 1 1 0 40 0 1 2 5 6 57 0 1
                                    2 20 0 0 0 1 1 36 54 0 1 2 20 0 0 0 1 2 0 0
                                    0 9 1 2 36 0 0 14 1 2 20 0 0 0 1 2 20 0 0 0
                                    1 2 20 58 0 0 1 2 20 54 0 0 1 2 20 28 0 0
                                    33 1 15 39 0 1 1 15 14 0 1 1 15 0 0 1 1 15
                                    6 0 1 1 0 37 0 1 1 0 36 0 1 1 0 6 0 1 4 11
                                    0 0 14 6 0 1 2 33 54 0 0 1 2 4 54 0 6 1 1 0
                                    14 0 1 2 0 41 0 46 1 2 0 14 0 47 1 1 18 6 0
                                    1 1 15 0 40 1 1 0 0 40 1 2 37 0 0 0 1 1 0
                                    38 0 1 1 0 0 6 1 1 31 0 0 1 1 35 0 49 1 1
                                    17 0 56 1 1 0 43 0 1 2 0 6 0 14 1 3 0 0 0
                                    47 14 1 3 0 0 0 46 41 1 0 37 14 1 3 32 0 0
                                    0 14 1 3 37 0 0 0 0 1 2 33 36 0 0 1 3 0 6 0
                                    6 6 25 2 0 0 0 0 1 2 37 36 0 0 1 2 0 0 0 9
                                    12 2 36 0 0 14 15 2 0 36 0 0 1 0 36 0 13 0
                                    38 0 1 2 20 0 0 6 1 1 40 0 0 1 2 40 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 9 0 1 2 0 0 0 0 20 2 0 0
                                    0 6 23 2 0 0 6 0 22 2 22 0 0 49 1 2 40 0 49
                                    0 1 2 38 0 14 0 1 2 1 0 0 56 1 2 1 0 56 0
                                    1)))))
           '|lookupComplete|)) 
