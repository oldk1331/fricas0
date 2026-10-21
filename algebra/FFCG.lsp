
(DECLAIM (NOTINLINE |FiniteFieldCyclicGroup;|)) 

(DEFUN |FiniteFieldCyclicGroup;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G37 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|FiniteFieldCyclicGroup| DV$1 DV$2))
          (LETT % (GETREFV 51))
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
          (|haddProp| |$ConstructorCache| '|FiniteFieldCyclicGroup|
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

(DEFUN |FiniteFieldCyclicGroup| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldCyclicGroup|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FiniteFieldCyclicGroup;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FiniteFieldCyclicGroup|)))))))))) 

(MAKEPROP '|FiniteFieldCyclicGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldCyclicGroupExtensionByPolynomial| 29
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 29)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 29)
              (0 . |createPrimitivePoly|) (|Boolean|) (|OutputForm|) (|String|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 20 '"failed")
              (|Record| (|:| |coef| 20) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 25 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|PrimeField| (NRTEVAL (QREFELT % 6)))
              (|Union| 29 '"failed") (|OnePointCompletion| 9) (|Matrix| 29)
              (|Vector| 29) (|Vector| %) (|PrimitiveArray| 50)
              (|Union| 34 '#1="failed") (|Matrix| %) (|Union| 17 '"failed")
              (|Fraction| 15) (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 8 '"failed") (|Table| 9 17)
              (|Record| (|:| |factor| 15) (|:| |exponent| 17)) (|List| 44)
              (|Factored| 21) (|Union| 48 '#1#) (|List| 21) (|HashState|)
              (|SingleInteger|))
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
                 (|DifferentialRing|) (|Algebra| 39) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| (|PrimeField| 6)) (|Ring|)
                 (|NonAssociativeAlgebra| 39) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| (|PrimeField| 6)) (|Module| 39)
                 (|SemiRng|) (|Module| $$) (|Module| (|PrimeField| 6))
                 (|BiModule| 39 39) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|FramedModule| (|PrimeField| 6)) (|RightModule| 39)
                 (|LeftModule| 39) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| (|PrimeField| 6))
                 (|RightModule| (|PrimeField| 6)) (|AbelianGroup|) (|Finite|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|Hashable|)
                 (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|PrimeField| 6)) (|ConvertibleTo| 40)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleTo| 13) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|PrimeField| 6)))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
