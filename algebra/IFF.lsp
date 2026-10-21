
(DECLAIM (NOTINLINE |InnerFiniteField;|)) 

(DEFUN |InnerFiniteField;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G37 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT |dv$| (LIST '|InnerFiniteField| DV$1 DV$2))
          (LETT % (GETREFV 48))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|CharacteristicZero|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|InnerPrimeField| |#1|)
                                                     '(|Finite|)))
                                              (OR
                                               (|HasCategory|
                                                (|InnerPrimeField| |#1|)
                                                '(|CharacteristicNonZero|))
                                               #1#)
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Hashable|))
                                              (|HasCategory|
                                               (|InnerPrimeField| |#1|)
                                               '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|InnerFiniteField| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| % '(|CharacteristicNonZero|)) #1#
               (|augmentPredVector| % 32))
          (AND (|HasCategory| % '(|CharacteristicZero|))
               (|augmentPredVector| % 64))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |InnerFiniteField| (&REST #1=#:G38)
  (SPROG NIL
         (PROG (#2=#:G39)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL NIL))
                                               (HGET |$ConstructorCache|
                                                     '|InnerFiniteField|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerFiniteField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InnerFiniteField|)))))))))) 

(MAKEPROP '|InnerFiniteField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldExtension| 26 (NRTEVAL (QREFELT % 7)))
              (|local| |#1|) (|local| |#2|) (|Boolean|) (|OutputForm|)
              (|String|) (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %)
              (|Union| 17 '"failed")
              (|Record| (|:| |coef| 17) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 22 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Factored| %) (|InnerPrimeField| (NRTEVAL (QREFELT % 6)))
              (|Union| 26 '"failed") (|OnePointCompletion| 11) (|Matrix| 26)
              (|Vector| 26) (|Vector| %) (|SparseUnivariatePolynomial| 26)
              (|Union| 31 '#1="failed") (|Matrix| %) (|Union| 14 '"failed")
              (|Fraction| 12) (|InputForm|) (|Union| 32 '"failed")
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 12) (|:| |exponent| 14)) (|List| 40)
              (|Table| 11 14) (|Factored| 18) (|Union| 45 '#1#) (|List| 18)
              (|SingleInteger|) (|HashState|))
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
              '#((|FiniteAlgebraicExtensionField| (|InnerPrimeField| 6))
                 (|FiniteFieldCategory|)
                 (|ExtensionField| (|InnerPrimeField| 6))
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|InnerPrimeField| 6)
                                  (|SparseUnivariatePolynomial|
                                   (|InnerPrimeField| 6)))
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| (|InnerPrimeField| 6)
                                      (|SparseUnivariatePolynomial|
                                       (|InnerPrimeField| 6)))
                 (|DifferentialRing|) (|Algebra| 36) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| (|InnerPrimeField| 6)) (|Ring|)
                 (|NonAssociativeAlgebra| 36) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| (|InnerPrimeField| 6)) (|Module| 36)
                 (|SemiRng|) (|Module| $$) (|Module| (|InnerPrimeField| 6))
                 (|BiModule| 36 36) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| (|InnerPrimeField| 6) (|InnerPrimeField| 6))
                 (|FramedModule| (|InnerPrimeField| 6)) (|RightModule| 36)
                 (|LeftModule| 36) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| $$) (|LeftModule| (|InnerPrimeField| 6))
                 (|RightModule| (|InnerPrimeField| 6)) (|AbelianGroup|)
                 (|Finite|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Comparable|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|) (|Hashable|)
                 (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| (|InnerPrimeField| 6)) (|ConvertibleTo| 37)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleTo| 9) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| (|InnerPrimeField| 6)))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
