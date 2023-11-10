
(DECLAIM (NOTINLINE |FiniteFieldNormalBasis;|)) 

(DEFUN |FiniteFieldNormalBasis| (&REST #1=#:G491)
  (SPROG NIL
         (PROG (#2=#:G492)
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

(DEFUN |FiniteFieldNormalBasis;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G490 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
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
                                        (|HasCategory| (|PrimeField| |#1|)
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|PrimeField| |#1|)
                                               '(|Finite|)))
                                        (OR
                                         (|HasCategory| (|PrimeField| |#1|)
                                                        '(|CharacteristicNonZero|))
                                         #1#)
                                        (|HasCategory| (|PrimeField| |#1|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|PrimeField| |#1|)
                                                       '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasis| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CharacteristicNonZero|)) #1#
         (|augmentPredVector| % 32))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|FiniteFieldNormalBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 38
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 38) (|:| |index| 34)) (|Union| 19 37)
              (|PositiveInteger|) (|FiniteFieldFunctions| 38)
              (0 . |createLowComplexityNormalBasis|) (|Union| 31 '#1="failed")
              (|Matrix| %) (|Union| % '"failed") (|Union| 18 '"failed")
              (|OnePointCompletion| 10) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 38) (|Factored| 21)
              (|SparseUnivariatePolynomial| %) (|Union| 23 '#1#) (|List| 21)
              (|Record| (|:| |factor| 27) (|:| |exponent| 18)) (|List| 24)
              (|Table| 10 18) (|Integer|) (|Boolean|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 19 '"failed") (|Vector| %) (|InputForm|) (|List| %)
              (|SingleInteger|) (|HashState|) (|Matrix| 38)
              (|Vector| (|List| 8)) (|PrimeField| (NRTEVAL (QREFELT % 6)))
              (|Vector| 38) (|Union| 38 '"failed") (|Fraction| 27)
              (|Factored| %) (|Union| 33 '#2="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 45 '#2#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 33) (|:| |generator| %))
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
                 (|Algebra| (|PrimeField| 6)) (|Algebra| 41) (|EntireRing|)
                 (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|DifferentialRing|) (|Ring|)
                 (|NonAssociativeAlgebra| (|PrimeField| 6))
                 (|NonAssociativeAlgebra| 41) (|NonAssociativeAlgebra| $$)
                 (|Rng|) (|SemiRing|) (|Module| (|PrimeField| 6)) (|Module| 41)
                 (|Module| $$) (|SemiRng|) (|FramedModule| (|PrimeField| 6))
                 (|BiModule| (|PrimeField| 6) (|PrimeField| 6))
                 (|BiModule| 41 41) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| (|PrimeField| 6))
                 (|LeftModule| (|PrimeField| 6)) (|RightModule| 41)
                 (|LeftModule| 41) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|)
                 (|RetractableTo| (|PrimeField| 6)) (|CommutativeStar|)
                 (|SetCategory|) (|Hashable|)
                 (|CoercibleFrom| (|PrimeField| 6)) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 52)
                 (|ConvertibleTo| 32))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
