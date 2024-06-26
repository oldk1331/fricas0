
(DECLAIM (NOTINLINE |FiniteFieldCyclicGroup;|)) 

(DEFUN |FiniteFieldCyclicGroup| (&REST #1=#:G68)
  (SPROG NIL
         (PROG (#2=#:G69)
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

(DEFUN |FiniteFieldCyclicGroup;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (#1=#:G67 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
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
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FiniteFieldCyclicGroup| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldCyclicGroupExtensionByPolynomial| 35
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        11))))
              (|local| |#1|) (|local| |#2|) (|SparseUnivariatePolynomial| 35)
              (|PositiveInteger|) (|FiniteFieldPolynomialPackage| 35)
              (0 . |createPrimitivePoly|) (|Union| 29 '#1="failed")
              (|Matrix| %) (|Union| % '"failed") (|Union| 17 '"failed")
              (|OnePointCompletion| 9) (|NonNegativeInteger|) (|Union| 19 '#1#)
              (|List| 20) (|SparseUnivariatePolynomial| %) (|Factored| 20)
              (|Table| 9 17) (|Integer|)
              (|Record| (|:| |factor| 23) (|:| |exponent| 17)) (|List| 24)
              (|Boolean|) (|Union| 8 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic") (|Vector| %)
              (|InputForm|) (|List| %) (|SingleInteger|) (|HashState|)
              (|PrimitiveArray| 32) (|PrimeField| (NRTEVAL (QREFELT % 6)))
              (|Matrix| 35) (|Vector| 35) (|Union| 35 '"failed")
              (|Fraction| 23) (|Factored| %) (|Union| 31 '#2="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 43 '#2#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 31) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|String|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 3 1 2
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 2 0 0 2 2 0 0 0 4 0 0 0 0 0 0 0
                                  0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| |FramedAlgebra&| NIL
                |FiniteRankAlgebra&| |DivisionRing&| NIL NIL |Algebra&|
                |Algebra&| |EntireRing&| |Algebra&| NIL NIL |DifferentialRing&|
                NIL |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |Rng&| NIL |Module&| |Module&|
                |Module&| NIL |FramedModule&| NIL NIL NIL |NonAssociativeRing&|
                NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&|
                NIL NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL
                |RetractableTo&| NIL |SetCategory&| |Hashable&| NIL NIL NIL NIL
                NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| (|PrimeField| 6))
                 (|ExtensionField| (|PrimeField| 6)) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| (|PrimeField| 6)
                                  (|SparseUnivariatePolynomial|
                                   (|PrimeField| 6)))
                 (|IntegralDomain|)
                 (|FiniteRankAlgebra| (|PrimeField| 6)
                                      (|SparseUnivariatePolynomial|
                                       (|PrimeField| 6)))
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| (|PrimeField| 6)) (|Algebra| 39) (|EntireRing|)
                 (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|NonAssociativeAlgebra| (|PrimeField| 6))
                 (|NonAssociativeAlgebra| 39) (|NonAssociativeAlgebra| $$)
                 (|Rng|) (|SemiRing|) (|Module| (|PrimeField| 6)) (|Module| 39)
                 (|Module| $$) (|SemiRng|) (|FramedModule| (|PrimeField| 6))
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 39 39) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 39)
                 (|LeftModule| 39) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|RetractableTo| (|PrimeField| 6)) (|CommutativeStar|)
                 (|SetCategory|) (|Hashable|)
                 (|CoercibleFrom| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 50)
                 (|ConvertibleTo| 30))
              (|makeByteWordVec2| 11 '(1 10 8 9 11)))))
           '|lookupIncomplete|)) 
