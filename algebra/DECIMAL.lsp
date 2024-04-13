
(SDEFUN |DECIMAL;decimal;F%;1| ((|r| (|Fraction| (|Integer|))) (% (%)))
        (SPADCALL |r| (QREFELT % 7))) 

(PUT '|DECIMAL;coerce;%Re;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DECIMAL;coerce;%Re;2| ((|x| (%)) (% (|RadixExpansion| 10))) |x|) 

(DECLAIM (NOTINLINE |DecimalExpansion;|)) 

(DEFUN |DecimalExpansion| ()
  (SPROG NIL
         (PROG (#1=#:G69)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|DecimalExpansion|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|DecimalExpansion|
                             (LIST (CONS NIL (CONS 1 (|DecimalExpansion;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|DecimalExpansion|)))))))))) 

(DEFUN |DecimalExpansion;| ()
  (SPROG ((|dv$| NIL) (% NIL) (#1=#:G67 NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DecimalExpansion|))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Symbol|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|RealConstant|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedIntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedIntegralDomain|))
                                               (|HasCategory| (|Integer|)
                                                              '(|OrderedSet|)))
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
                                                                   '(|Comparable|)))
                                              (OR #1#
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedIntegralDomain|))
                                                  (|HasCategory| (|Integer|)
                                                                 '(|OrderedSet|)))))))
          (|haddProp| |$ConstructorCache| '|DecimalExpansion| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|Integer|) '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 33554432))
          (AND
           (OR
            (AND (|HasCategory| % '(|CharacteristicNonZero|))
                 (|HasCategory| (|Integer|)
                                '(|PolynomialFactorizationExplicit|)))
            (|HasCategory| (|Integer|) '(|CharacteristicNonZero|)))
           (|augmentPredVector| % 67108864))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|DecimalExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|RadixExpansion| '10) (|Fraction| 18)
              (0 . |coerce|) |DECIMAL;decimal;F%;1| |DECIMAL;coerce;%Re;2|
              (|Union| 25 '#1="failed") (|Matrix| %) (|Union| % '"failed")
              (|Boolean|) (|InputForm|) (|Pattern| 35) (|Pattern| 18)
              (|NonNegativeInteger|) (|Integer|) (|List| 20) (|Equation| 18)
              (|List| 18) (|List| 23) (|Symbol|)
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 18))) (|Vector| %)
              (|Matrix| 18) (|List| 17) (|PatternMatchResult| 35 %)
              (|PatternMatchResult| 18 %) (|Factored| 31)
              (|SparseUnivariatePolynomial| %) (|Union| 33 '#1#) (|List| 31)
              (|DoubleFloat|) (|Float|) (|Union| 18 '#2="failed")
              (|Union| 6 '#2#) (|Union| 23 '#2#) (|Mapping| 18 18)
              (|Factored| %) (|Union| 42 '#3="failed") (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 44 '#3#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 42) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|PositiveInteger|) (|String|) (|OutputForm|))
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
              |latex| 304 |inv| 309 |init| 314 |gcdPolynomial| 318 |gcd| 324
              |fractionPart| 335 |floor| 345 |factorSquareFreePolynomial| 350
              |factorPolynomial| 355 |factor| 360 |extendedEuclidean| 365
              |exquo| 378 |expressIdealMember| 384 |eval| 390 |euclideanSize|
              430 |elt| 435 |divide| 441 |differentiate| 447 |denominator| 497
              |denom| 502 |decimal| 507 |convert| 512 |conditionP| 537
              |commutator| 542 |coerce| 548 |charthRoot| 583 |characteristic|
              588 |ceiling| 592 |associator| 597 |associates?| 604
              |antiCommutator| 610 |annihilate?| 616 |abs| 622 ^ 627 |Zero| 645
              |One| 649 D 653 >= 703 > 709 = 715 <= 721 < 727 / 733 - 745 + 756
              * 762)
           'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 0 1 0 0 0 7 0 0 0 0 0 7 0 0 0 0 3 4 15 16
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 7 0 0 0 0 0 0
                                  0 7 0 7 0 0 0 7 0 0 0 0 0 9 0 0 0 25 11 19 20
                                  0 0 0 0 2 6 10 13 0 0 0 0 0 0 0 0 0 2 5 6 6 8
                                  10 12 13 14 17 18))
            (CONS
             '#(|QuotientFieldCategory&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DifferentialExtension&| |DivisionRing&| NIL NIL |OrderedRing&|
                |Algebra&| |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |Rng&| NIL
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&| NIL
                NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |OrderedSet&| |FullyEvalableOver&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |RetractableTo&| NIL
                |SetCategory&| |RetractableTo&| NIL |RetractableTo&|
                |Evalable&| NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL
                NIL NIL NIL |PartialOrder&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| 18) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|OrderedIntegralDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 18) (|DivisionRing|)
                 (|CommutativeRing|) (|LeftOreRing|) (|OrderedRing|)
                 (|Algebra| 18) (|Algebra| 6) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|PartialDifferentialRing| 23) (|DifferentialRing|) (|Ring|)
                 (|NonAssociativeAlgebra| 18) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 18) (|Module| 18) (|Module| 6)
                 (|Module| $$) (|SemiRng|) (|LinearlyExplicitOver| 18)
                 (|BiModule| 18 18) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|OrderedAbelianGroup|)
                 (|RightModule| 18) (|LeftModule| 18) (|RightModule| 6)
                 (|LeftModule| 6) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|OrderedCancellationAbelianMonoid|)
                 (|AbelianGroup|) (|OrderedAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedAbelianSemiGroup|) (|FullyPatternMatchable| 18)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|OrderedSet|) (|FullyEvalableOver| 18)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|PatternMatchable| 35) (|PatternMatchable| 18)
                 (|Patternable| 18) (|RetractableTo| 18) (|CommutativeStar|)
                 (|SetCategory|) (|RetractableTo| 23) (|RealConstant|)
                 (|RetractableTo| 6) (|Evalable| 18) (|Type|)
                 (|CoercibleFrom| 18) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 52)
                 (|CoercibleFrom| 23) (|ConvertibleTo| 14) (|ConvertibleTo| 34)
                 (|ConvertibleTo| 35) (|PartialOrder|) (|CoercibleFrom| 6)
                 (|InnerEvalable| 23 18) (|InnerEvalable| 18 18)
                 (|Eltable| 18 $$) (|ConvertibleTo| 15) (|ConvertibleTo| 16))
              (|makeByteWordVec2| 52
                                  '(1 0 0 6 7 2 0 13 0 0 1 1 0 13 0 1 1 22 18 0
                                    1 1 0 49 0 1 1 0 0 0 1 1 0 13 0 1 2 0 12 0
                                    0 1 1 1 30 31 1 1 0 0 0 1 1 0 40 0 1 2 1 32
                                    33 31 1 2 24 13 0 0 1 2 0 13 0 0 1 1 7 18 0
                                    1 0 0 0 1 1 0 12 0 1 2 0 0 0 17 1 2 0 0 0
                                    50 1 1 10 36 0 1 1 10 37 0 1 1 2 38 0 1 1 0
                                    36 0 1 1 10 18 0 1 1 10 6 0 1 1 2 23 0 1 1
                                    0 18 0 1 2 0 0 0 0 1 2 21 24 11 25 1 1 21
                                    26 11 1 1 0 26 11 1 2 0 24 11 25 1 1 0 12 0
                                    1 2 0 0 0 0 1 1 0 47 42 1 1 0 13 0 1 1 7 13
                                    0 1 2 0 0 0 50 1 3 19 28 0 15 28 1 3 20 29
                                    0 16 29 1 2 0 13 0 0 1 1 0 13 0 1 1 0 0 0 1
                                    1 0 18 0 1 1 11 12 0 1 1 7 13 0 1 2 0 41 42
                                    0 1 2 8 0 0 0 1 2 8 0 0 0 1 2 0 0 39 0 1 1
                                    0 12 0 1 2 0 0 0 17 1 2 0 0 0 50 1 2 0 48 0
                                    0 1 1 0 0 42 1 2 0 0 0 0 1 1 0 51 0 1 1 0 0
                                    0 1 0 11 0 1 2 0 31 31 31 1 1 0 0 42 1 2 0
                                    0 0 0 1 1 22 0 0 1 1 0 6 0 1 1 23 18 0 1 1
                                    1 30 31 1 1 1 30 31 1 1 0 40 0 1 2 0 43 0 0
                                    1 3 0 45 0 0 0 1 2 0 12 0 0 1 2 0 41 42 0 1
                                    2 13 0 0 19 1 3 13 0 0 18 18 1 2 13 0 0 20
                                    1 3 13 0 0 21 21 1 3 12 0 0 22 21 1 3 12 0
                                    0 23 18 1 1 0 17 0 1 2 14 0 0 18 1 2 0 46 0
                                    0 1 2 16 0 0 17 1 1 16 0 0 1 3 15 0 0 22 27
                                    1 3 15 0 0 23 17 1 2 15 0 0 23 1 2 15 0 0
                                    22 1 2 0 0 0 39 1 3 0 0 0 39 17 1 1 0 0 0 1
                                    1 0 18 0 1 1 0 0 6 8 1 5 14 0 1 1 17 15 0 1
                                    1 18 16 0 1 1 6 34 0 1 1 6 35 0 1 1 26 10
                                    11 1 2 0 0 0 0 1 1 2 0 23 1 1 0 6 0 1 1 0 5
                                    0 9 1 0 0 18 1 1 0 0 6 7 1 0 0 0 1 1 0 52 0
                                    1 1 27 12 0 1 0 0 17 1 1 23 18 0 1 3 0 0 0
                                    0 0 1 2 0 13 0 0 1 2 0 0 0 0 1 2 0 13 0 0 1
                                    1 7 0 0 1 2 0 0 0 18 1 2 0 0 0 17 1 2 0 0 0
                                    50 1 0 0 0 1 0 0 0 1 2 16 0 0 17 1 1 16 0 0
                                    1 3 15 0 0 22 27 1 2 15 0 0 22 1 3 15 0 0
                                    23 17 1 2 15 0 0 23 1 2 0 0 0 39 1 3 0 0 0
                                    39 17 1 2 8 13 0 0 1 2 8 13 0 0 1 2 0 13 0
                                    0 1 2 8 13 0 0 1 2 8 13 0 0 1 2 0 0 18 18 1
                                    2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 21 0 0 18 1 2 0 0 0 18 1 2 0 0 18 0 1 2
                                    0 0 6 0 1 2 0 0 0 6 1 2 0 0 17 0 1 2 0 0 0
                                    0 1 2 0 0 50 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|DecimalExpansion| 'NILADIC T) 
