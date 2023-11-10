
(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtension;|)) 

(DEFUN |FiniteFieldNormalBasisExtension| (&REST #1=#:G491)
  (SPROG NIL
         (PROG (#2=#:G492)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtension|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FiniteFieldNormalBasisExtension;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtension|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtension;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G490 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|FiniteFieldNormalBasisExtension| DV$1 DV$2))
    (LETT % (GETREFV 52))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Finite|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         #1#)
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|FiniteFieldNormalBasisExtension|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND #1# (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 32))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|FiniteFieldNormalBasisExtension| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|FiniteFieldNormalBasisExtensionByPolynomial| 6
                                                             (NRTEVAL
                                                              (SPADCALL
                                                               (QREFELT % 7)
                                                               (QREFELT %
                                                                        12))))
              (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |value| 6) (|:| |index| 34)) (|Union| 19 37)
              (|PositiveInteger|) (|FiniteFieldFunctions| 6)
              (0 . |createLowComplexityNormalBasis|) (|Union| 31 '#1="failed")
              (|Matrix| %) (|Union| % '"failed") (|Union| 18 '"failed")
              (|OnePointCompletion| 10) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 6) (|Factored| 21)
              (|SparseUnivariatePolynomial| %) (|Union| 23 '#1#) (|List| 21)
              (|Record| (|:| |factor| 27) (|:| |exponent| 18)) (|List| 24)
              (|Table| 10 18) (|Integer|) (|Boolean|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Union| 19 '"failed") (|Vector| %) (|InputForm|) (|List| %)
              (|SingleInteger|) (|HashState|) (|Matrix| 6)
              (|Vector| (|List| 8)) (|Vector| 6) (|Union| 6 '"failed")
              (|Fraction| 27) (|Factored| %) (|Union| 33 '#2="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 44 '#2#)
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
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|IntegralDomain|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 6) (|Algebra| 40) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 40) (|NonAssociativeAlgebra| $$)
                 (|Rng|) (|SemiRing|) (|Module| 6) (|Module| 40) (|Module| $$)
                 (|SemiRng|) (|FramedModule| 6) (|BiModule| 6 6)
                 (|BiModule| 40 40) (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|RightModule| 6) (|LeftModule| 6) (|RightModule| 40)
                 (|LeftModule| 40) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|StepThrough|) (|RetractableTo| 6)
                 (|CommutativeStar|) (|SetCategory|) (|Hashable|)
                 (|CoercibleFrom| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 51)
                 (|ConvertibleTo| 32))
              (|makeByteWordVec2| 12 '(1 11 9 10 12)))))
           '|lookupIncomplete|)) 
