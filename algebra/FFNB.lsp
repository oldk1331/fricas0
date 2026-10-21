
(DECLAIM (NOTINLINE |FiniteFieldNormalBasis;|)) 

(DEFUN |FiniteFieldNormalBasis;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G46 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|FiniteFieldNormalBasis| DV$1 DV$2))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|PrimeField| |#1|)
                                                     '(|Finite|)))
                                              (OR
                                               (|HasCategory|
                                                (|PrimeField| |#1|)
                                                '(|CharacteristicNonZero|))
                                               #1#)
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|Hashable|))
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasis|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|)) #1#
               (|augmentPredVector| % 32))
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 64))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FiniteFieldNormalBasis| (&REST #1=#:G47)
  (SPROG NIL
         (PROG (#2=#:G48)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasis|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldNormalBasis;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldNormalBasis|)))))))))) 

(MAKEPROP '|FiniteFieldNormalBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 30
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 30) (|:| |index| 52)) (|Union| 36 37)
              (|PositiveInteger|) (|FiniteFieldFunctions| 30)
              (0 . |createLowComplexityNormalBasis|) (|Boolean|) (|OutputForm|)
              (|String|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 21 '"failed")
              (|Record| (|:| |coef| 21) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 26 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|PrimeField| (NRTEVAL (QREFELT % 6)))
              (|Union| 30 '"failed") (|OnePointCompletion| 10) (|Matrix| 30)
              (|Vector| %) (|Vector| 30) (|SparseUnivariatePolynomial| 30)
              (|Vector| (|List| 8)) (|Union| 34 '#1="failed") (|Matrix| %)
              (|Union| 18 '"failed") (|Fraction| 16) (|InputForm|)
              (|Union| 36 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 10 18) (|Record| (|:| |factor| 16) (|:| |exponent| 18))
              (|List| 46) (|Factored| 22) (|Union| 50 '#1#) (|List| 22)
              (|HashState|) (|SingleInteger|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 2 0 3 0 2 0 0 0 0 0 0 0 0 0 0 2 1 0 0 0 0 1
                                  0 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 2 0
                                  0 0 2 0 0 0 0 2 2 0 0 0 4 0 0 0 2 1 3 0 0 0 0
                                  0 0 0 0))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |FiniteFieldCategory&|
                |ExtensionField&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialRing&| |Algebra&| |Algebra&| |EntireRing&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Module&| NIL
                |Module&| |Module&| NIL |NonAssociativeRing&| NIL NIL
                |FramedModule&| NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL
                |AbelianGroup&| |Finite&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |Hashable&|
                |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|FiniteFieldCategory|) (|ExtensionField| (|PrimeField| 6))
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|PrimeField| 6)
                                  (|SparseUnivariatePolynomial|
                                   (|PrimeField| 6)))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| (|PrimeField| 6)
                                      (|SparseUnivariatePolynomial|
                                       (|PrimeField| 6)))
                 (|DifferentialRing|) (|Algebra| 41) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| (|PrimeField| 6)) (|Ring|)
                 (|NonAssociativeAlgebra| 41) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| (|PrimeField| 6)) (|Module| 41)
                 (|SemiRng|) (|Module| $$) (|Module| (|PrimeField| 6))
                 (|BiModule| 41 41) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|FramedModule| (|PrimeField| 6)) (|RightModule| 41)
                 (|LeftModule| 41) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| (|PrimeField| 6))
                 (|RightModule| (|PrimeField| 6)) (|AbelianGroup|) (|Finite|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|Hashable|)
                 (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|PrimeField| 6)) (|ConvertibleTo| 42)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleTo| 14) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|PrimeField| 6)))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
