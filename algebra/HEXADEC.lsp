
(SDEFUN |HEXADEC;hex;F%;1| ((|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |r| (QREFELT % 7))) 

(MAKEPROP '|HEXADEC;coerce;%Re;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |HEXADEC;coerce;%Re;2| ((|x| (%)) (% (|RadixExpansion| 16))) |x|) 

(DECLAIM (NOTINLINE |HexadecimalExpansion;|)) 

(DEFUN |HexadecimalExpansion;| ()
  (SPROG ((|dv$| NIL) (% NIL) (#1=#:G34 NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HexadecimalExpansion|))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|RealConstant|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|StepThrough|))
                                              (|HasCategory| (|Integer|)
                                                             '(|InnerEvalable|
                                                               (|Symbol|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Evalable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|Eltable|
                                                               (|Integer|)
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|DifferentialRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Float|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|EuclideanDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|ComparableRepresentation|)))
                                              (OR #1#
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedRing|)))))))
          (|haddProp| |$ConstructorCache| '|HexadecimalExpansion| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 8388608))
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 16777216))
          (AND (|HasCategory| % '(|SetWithZero|))
               (|HasCategory| (|Integer|) '(|OrderedRing|))
               (|augmentPredVector| % 33554432))
          (AND (|HasCategory| % '(|AbelianGroup|))
               (|HasCategory| (|Integer|) '(|OrderedRing|))
               (|augmentPredVector| % 67108864))
          (AND
           (OR (|HasCategory| % '(|CharacteristicZero|))
               (|HasCategory| (|Integer|) '(|RetractableTo| (|Integer|))))
           (|augmentPredVector| % 134217728))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |HexadecimalExpansion| ()
  (SPROG NIL
         (PROG (#1=#:G36)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HexadecimalExpansion|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HexadecimalExpansion|
                             (LIST
                              (CONS NIL (CONS 1 (|HexadecimalExpansion;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|HexadecimalExpansion|)))))))))) 

(MAKEPROP '|HexadecimalExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|RadixExpansion| (NRTEVAL 16))
              (|Fraction| 14) (0 . |coerce|) |HEXADEC;hex;F%;1|
              |HEXADEC;coerce;%Re;2| (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 19 '"failed")
              (|Record| (|:| |coef| 19) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 24 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|Union| 14 '#1="failed") (|Mapping| 14 14)
              (|Matrix| 14) (|Matrix| %)
              (|Record| (|:| |mat| 30) (|:| |vec| (|Vector| 14))) (|Vector| %)
              (|Union| 33 '#2="failed") (|InputForm|) (|Pattern| 50)
              (|Pattern| 14) (|List| 14) (|List| 40) (|Equation| 14)
              (|List| 42) (|Symbol|) (|List| 16) (|PatternMatchResult| 50 %)
              (|PatternMatchResult| 14 %) (|Union| 47 '#2#) (|List| 20)
              (|Factored| 20) (|DoubleFloat|) (|Float|) (|Union| 6 '#1#)
              (|Union| 42 '#1#))
           '#(~= 5 |zero?| 11 |wholePart| 16 |unitNormal| 21 |unitCanonical| 26
              |unit?| 31 |subtractIfCan| 36 |squareFreePolynomial| 42
              |squareFreePart| 47 |squareFree| 52
              |solveLinearPolynomialEquation| 57 |smaller?| 63 |sizeLess?| 69
              |sign| 75 |sample| 80 |rightRecip| 84 |rightPower| 89
              |retractIfCan| 101 |retract| 121 |rem| 141 |reducedSystem| 147
              |recip| 169 |quo| 174 |principalIdeal| 180 |prime?| 185
              |positive?| 190 |plenaryPower| 195 |patternMatch| 201 |opposite?|
              215 |one?| 221 |numerator| 226 |numer| 231 |nextItem| 236
              |negative?| 241 |multiEuclidean| 246 |min| 252 |max| 258 |map|
              264 |leftRecip| 270 |leftPower| 275 |lcmCoef| 287 |lcm| 293
              |latex| 304 |inv| 309 |init| 314 |hex| 318 |gcdPolynomial| 323
              |gcd| 329 |fractionPart| 340 |floor| 350
              |factorSquareFreePolynomial| 355 |factorPolynomial| 360 |factor|
              365 |extendedEuclidean| 370 |exquo| 383 |expressIdealMember| 389
              |eval| 395 |euclideanSize| 435 |elt| 440 |divide| 446
              |differentiate| 452 |denominator| 502 |denom| 507 |convert| 512
              |conditionP| 537 |commutator| 542 |coerce| 548 |charthRoot| 583
              |characteristic| 588 |ceiling| 592 |associator| 597 |associates?|
              604 |antiCommutator| 610 |annihilate?| 616 |abs| 622 ^ 627 D 645
              >= 695 > 701 = 707 <= 713 < 719 |1| 725 |0| 729 / 733 - 745 + 756
              * 762)
           'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 2 0 0 0 0 0 0 0 0 0 14 13 7 1 0 0 0 0 1 0
                                  0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 7 7 0
                                  7 0 0 0 7 7 0 0 0 0 0 18 17 9 23 0 0 0 0 11 8
                                  6 3 0 0 0 0 16 15 12 11 10 8 7 6 6 5 1 4 3 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL NIL
                |DivisionRing&| |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |OrderedAbelianSemiGroup&|
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&| NIL NIL
                NIL NIL |InnerEvalable&| |InnerEvalable&| NIL |PartialOrder&|
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 14) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|)
                 (|DifferentialExtension| 14) (|DifferentialRing|)
                 (|PartialDifferentialRing| 42) (|OrderedRing|) (|Algebra| 6)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 14) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 14)
                 (|Module| 6) (|SemiRng|) (|Module| $$) (|Module| 14)
                 (|FullyLinearlyExplicitOver| 14) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 14 14)
                 (|LinearlyExplicitOver| 14) (|RightModule| 6) (|LeftModule| 6)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 14) (|RightModule| 14) (|OrderedMagmaWithZero|)
                 (|OrderedAbelianSemiGroup|) (|AbelianGroup|) (|OrderedSet|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|MagmaWithZero|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|FullyPatternMatchable| 14) (|PatternMatchable| 14)
                 (|PatternMatchable| 50) (|StepThrough|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyEvalableOver| 14)
                 (|Evalable| 14) (|RetractableTo| 6) (|RealConstant|)
                 (|RetractableTo| 42) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 14) (|Patternable| 14) (|ConvertibleTo| 37)
                 (|ConvertibleTo| 36) (|Eltable| 14 $$) (|InnerEvalable| 14 14)
                 (|InnerEvalable| 42 14) (|CoercibleFrom| 6) (|PartialOrder|)
                 (|ConvertibleTo| 50) (|ConvertibleTo| 49) (|ConvertibleTo| 35)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleFrom| 42) (|CoercibleTo| 11) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 14) (|Type|))
              (|makeByteWordVec2| 52
                                  '(1 0 0 6 7 2 0 10 0 0 1 1 0 10 0 1 1 20 14 0
                                    1 1 0 17 0 1 1 0 0 0 1 1 0 10 0 1 2 0 15 0
                                    0 1 1 2 48 20 1 1 0 0 0 1 1 0 27 0 1 2 2 46
                                    47 20 1 2 22 10 0 0 1 2 0 10 0 0 1 1 26 14
                                    0 1 0 0 0 1 1 0 15 0 1 2 0 0 0 13 1 2 0 0 0
                                    16 1 1 0 28 0 1 1 8 51 0 1 1 8 28 0 1 1 3
                                    52 0 1 1 0 14 0 1 1 8 6 0 1 1 8 14 0 1 1 3
                                    42 0 1 2 0 0 0 0 1 1 0 30 31 1 2 0 32 31 33
                                    1 2 19 32 31 33 1 1 19 30 31 1 1 0 15 0 1 2
                                    0 0 0 0 1 1 0 22 19 1 1 0 10 0 1 1 26 10 0
                                    1 2 0 0 0 13 1 3 17 44 0 36 44 1 3 18 45 0
                                    37 45 1 2 0 10 0 0 1 1 0 10 0 1 1 0 0 0 1 1
                                    0 14 0 1 1 9 15 0 1 1 26 10 0 1 2 0 21 19 0
                                    1 2 7 0 0 0 1 2 7 0 0 0 1 2 0 0 29 0 1 1 0
                                    15 0 1 2 0 0 0 13 1 2 0 0 0 16 1 2 0 18 0 0
                                    1 2 0 0 0 0 1 1 0 0 19 1 1 0 12 0 1 1 0 0 0
                                    1 0 9 0 1 1 0 0 6 8 2 0 20 20 20 1 2 0 0 0
                                    0 1 1 0 0 19 1 1 0 6 0 1 1 20 0 0 1 1 21 14
                                    0 1 1 2 48 20 1 1 2 48 20 1 1 0 27 0 1 3 0
                                    25 0 0 0 1 2 0 26 0 0 1 2 0 15 0 0 1 2 0 21
                                    19 0 1 3 11 0 0 14 14 1 3 11 0 0 38 38 1 2
                                    11 0 0 39 1 2 11 0 0 40 1 3 10 0 0 41 38 1
                                    3 10 0 0 42 14 1 1 0 16 0 1 2 12 0 0 14 1 2
                                    0 23 0 0 1 2 0 0 0 29 1 3 0 0 0 29 16 1 1
                                    14 0 0 1 2 14 0 0 16 1 2 13 0 0 42 1 3 13 0
                                    0 42 16 1 2 13 0 0 41 1 3 13 0 0 41 43 1 1
                                    0 0 0 1 1 0 14 0 1 1 5 35 0 1 1 15 36 0 1 1
                                    16 37 0 1 1 6 49 0 1 1 6 50 0 1 1 25 34 31
                                    1 2 0 0 0 0 1 1 0 11 0 1 1 0 0 14 1 1 0 0 0
                                    1 1 0 5 0 9 1 0 6 0 1 1 28 0 6 7 1 3 0 42 1
                                    1 25 15 0 1 0 0 16 1 1 21 14 0 1 3 0 0 0 0
                                    0 1 2 0 10 0 0 1 2 0 0 0 0 1 2 0 10 0 0 1 1
                                    27 0 0 1 2 0 0 0 13 1 2 0 0 0 16 1 2 0 0 0
                                    14 1 2 0 0 0 29 1 3 0 0 0 29 16 1 1 14 0 0
                                    1 2 14 0 0 16 1 2 13 0 0 41 1 2 13 0 0 42 1
                                    3 13 0 0 41 43 1 3 13 0 0 42 16 1 2 7 10 0
                                    0 1 2 7 10 0 0 1 2 0 10 0 0 1 2 7 10 0 0 1
                                    2 7 10 0 0 1 0 0 0 1 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 14 14 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 13 0 1 2 0 0 0 0 1 2 0 0 14 0 1 2 0
                                    0 16 0 1 2 0 0 0 14 1 2 24 0 0 6 1 2 24 0 6
                                    0 1 2 19 0 0 14 1)))))
           '|lookupComplete|)) 
