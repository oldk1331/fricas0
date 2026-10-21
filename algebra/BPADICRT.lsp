
(DECLAIM (NOTINLINE |BalancedPAdicRational;|)) 

(DEFUN |BalancedPAdicRational;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G36 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|BalancedPAdicRational| DV$1))
          (LETT % (GETREFV 56))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|CharacteristicZero|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|RetractableTo| (|Symbol|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|CharacteristicNonZero|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|RealConstant|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|OrderedRing|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|RetractableTo| (|Integer|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|StepThrough|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               (LIST '|InnerEvalable|
                                                     '(|Symbol|)
                                                     (LIST
                                                      '|BalancedPAdicInteger|
                                                      (|devaluate| |#1|))))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               (LIST '|Evalable|
                                                     (LIST
                                                      '|BalancedPAdicInteger|
                                                      (|devaluate| |#1|))))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               (LIST '|Eltable|
                                                     (LIST
                                                      '|BalancedPAdicInteger|
                                                      (|devaluate| |#1|))
                                                     (LIST
                                                      '|BalancedPAdicInteger|
                                                      (|devaluate| |#1|))))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|DifferentialRing|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|LinearlyExplicitOver|
                                                 (|Integer|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|Pattern| (|Float|))))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|ConvertibleTo|
                                                 (|Pattern| (|Integer|))))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|PatternMatchable| (|Float|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|PatternMatchable|
                                                 (|Integer|)))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|EuclideanDomain|))
                                              (|HasCategory|
                                               (|BalancedPAdicInteger| |#1|)
                                               '(|IntegerNumberSystem|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|BalancedPAdicInteger|
                                                      |#1|)
                                                     '(|ComparableRepresentation|)))
                                              (OR #1#
                                                  (|HasCategory|
                                                   (|BalancedPAdicInteger|
                                                    |#1|)
                                                   '(|OrderedRing|)))))))
          (|haddProp| |$ConstructorCache| '|BalancedPAdicRational| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 8388608))
          (AND (|HasCategory| % '(|CharacteristicNonZero|))
               (|HasCategory| (|BalancedPAdicInteger| |#1|)
                              '(|PolynomialFactorizationExplicit|))
               (|augmentPredVector| % 16777216))
          (AND (|HasCategory| % '(|SetWithZero|))
               (|HasCategory| (|BalancedPAdicInteger| |#1|) '(|OrderedRing|))
               (|augmentPredVector| % 33554432))
          (AND (|HasCategory| % '(|AbelianGroup|))
               (|HasCategory| (|BalancedPAdicInteger| |#1|) '(|OrderedRing|))
               (|augmentPredVector| % 67108864))
          (AND
           (OR (|HasCategory| % '(|CharacteristicZero|))
               (|HasCategory| (|BalancedPAdicInteger| |#1|)
                              '(|RetractableTo| (|Integer|))))
           (|augmentPredVector| % 134217728))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |BalancedPAdicRational| (#1=#:G37)
  (SPROG NIL
         (PROG (#2=#:G38)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|BalancedPAdicRational|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BalancedPAdicRational;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BalancedPAdicRational|)))))))))) 

(MAKEPROP '|BalancedPAdicRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|PAdicRationalConstructor| (NRTEVAL (QREFELT % 6)) 25)
              (|local| |#1|) (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 16 '"failed")
              (|Record| (|:| |coef| 16) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 21 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|BalancedPAdicInteger| (NRTEVAL (QREFELT % 6)))
              (|Union| 25 '#1="failed") (|Mapping| 25 25) (|Matrix| 25)
              (|Matrix| %) (|Record| (|:| |mat| 28) (|:| |vec| (|Vector| 25)))
              (|Vector| %) (|ContinuedFraction| 33) (|Fraction| 11)
              (|Union| 31 '#2="failed") (|InputForm|) (|Pattern| 52)
              (|Pattern| 11) (|List| 25) (|List| 40) (|Equation| 25)
              (|List| 42) (|Symbol|)
              (|Record| (|:| |mat| 44) (|:| |vec| (|Vector| 11))) (|Matrix| 11)
              (|List| 13) (|PatternMatchResult| 52 %)
              (|PatternMatchResult| 11 %) (|Union| 49 '#2#) (|List| 17)
              (|Factored| 17) (|DoubleFloat|) (|Float|) (|Union| 33 '#1#)
              (|Union| 11 '#1#) (|Union| 42 '#1#))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 2 0 0 0 0 0 0 0 0 0 14 13 7 1 0 0 0 0 1 0
                                  0 0 0 1 0 0 0 0 15 1 0 0 0 0 15 1 1 0 0 0 0 0
                                  7 7 0 7 0 0 0 7 7 0 0 0 0 0 19 18 9 23 0 0 0
                                  0 11 8 8 6 3 0 0 0 0 17 16 12 11 10 8 8 7 6 6
                                  5 1 4 3 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL NIL
                |DivisionRing&| |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |OrderedAbelianSemiGroup&|
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyEvalableOver&| |Evalable&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |SetCategory&| NIL
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|QuotientFieldCategory| (|BalancedPAdicInteger| 6)) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|)
                 (|DifferentialExtension| (|BalancedPAdicInteger| 6))
                 (|DifferentialRing|) (|PartialDifferentialRing| 42)
                 (|OrderedRing|) (|Algebra| 33) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| (|BalancedPAdicInteger| 6)) (|Ring|)
                 (|NonAssociativeAlgebra| 33) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| (|BalancedPAdicInteger| 6))
                 (|Module| 33) (|SemiRng|) (|Module| $$)
                 (|Module| (|BalancedPAdicInteger| 6))
                 (|FullyLinearlyExplicitOver| (|BalancedPAdicInteger| 6))
                 (|LinearlyExplicitOver| 11) (|BiModule| 33 33)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| (|BalancedPAdicInteger| 6)
                             (|BalancedPAdicInteger| 6))
                 (|LinearlyExplicitOver| (|BalancedPAdicInteger| 6))
                 (|RightModule| 11) (|RightModule| 33) (|LeftModule| 33)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| (|BalancedPAdicInteger| 6))
                 (|RightModule| (|BalancedPAdicInteger| 6))
                 (|OrderedMagmaWithZero|) (|OrderedAbelianSemiGroup|)
                 (|AbelianGroup|) (|OrderedSet|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|MagmaWithZero|)
                 (|Comparable|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|)
                 (|FullyPatternMatchable| (|BalancedPAdicInteger| 6))
                 (|PatternMatchable| 11) (|PatternMatchable| 52)
                 (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|FullyEvalableOver| (|BalancedPAdicInteger| 6))
                 (|Evalable| (|BalancedPAdicInteger| 6)) (|RetractableTo| 11)
                 (|RetractableTo| 33) (|RealConstant|) (|RetractableTo| 42)
                 (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|BalancedPAdicInteger| 6))
                 (|Patternable| (|BalancedPAdicInteger| 6))
                 (|ConvertibleTo| 37) (|ConvertibleTo| 36)
                 (|Eltable| (|BalancedPAdicInteger| 6) $$)
                 (|InnerEvalable| (|BalancedPAdicInteger| 6)
                                  (|BalancedPAdicInteger| 6))
                 (|InnerEvalable| 42 (|BalancedPAdicInteger| 6))
                 (|CoercibleFrom| 11) (|CoercibleFrom| 33) (|PartialOrder|)
                 (|ConvertibleTo| 52) (|ConvertibleTo| 51) (|ConvertibleTo| 35)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleFrom| 42) (|CoercibleTo| 8) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| (|BalancedPAdicInteger| 6)) (|Type|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
