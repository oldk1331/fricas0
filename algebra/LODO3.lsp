
(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator3;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator3| (&REST #1=#:G49)
  (SPROG NIL
         (PROG (#2=#:G50)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator3|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |LinearOrdinaryDifferentialOperator3;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator3|)))))))))) 

(DEFUN |LinearOrdinaryDifferentialOperator3;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G46 NIL) (#2=#:G48 NIL) (#3=#:G47 NIL) (% NIL)
    (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator3| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 43))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#3|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#3| '(|EntireRing|))
                                        (|HasCategory| |#3|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#3|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#3|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#3| '(|Comparable|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#3| '(|EntireRing|))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#3|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#3| '(|GcdDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CharacteristicZero|)))
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#3| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator3|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#3| '(|EntireRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (|HasCategory| |#3| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#3| '(|CommutativeRing|))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#3| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#3| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#3| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#3| '(|SemiRing|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#3| '(|Ring|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#3| '(|AbelianMonoid|))
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|CommutativeRing|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|Ring|)))
      #1#
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#3| '(|AbelianGroup|))
      (AND (|HasCategory| |#3| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#3| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator3| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 8 (NRTEVAL (ELT % 10)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|)
              (|LinearOrdinaryDifferentialOperator3Aux| 6 7 8)
              (0 . |delta_deriv|)
              (|Record| (|:| |mat| 15) (|:| |vec| (|Vector| 14))) (|Matrix| %)
              (|Vector| %) (|Integer|) (|Matrix| 14) (|Boolean|)
              (|NonNegativeInteger|) (|Union| % '"failed") (|PositiveInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 14) (|Record| (|:| |k| 17) (|:| |c| 8)) (|List| 22)
              (|Mapping| 8 17)
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 21 '#1="failed") (|Union| 14 '#1#) (|Matrix| 8)
              (|Record| (|:| |mat| 30) (|:| |vec| (|Vector| 8))) (|List| %)
              (|List| 34) (|SingletonAsOrderedSet|) (|List| 17)
              (|Union| 34 '"failed") (|Mapping| 17 17) (|Union| 8 '#1#)
              (|List| 8) (|Mapping| 8 8) (|OutputForm|) (|String|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 26
                                '(0 0 0 0 0 1 2 3 4 5 11 0 1 11 13 5 0 0 1 5 10
                                  0 0 0 1 10 20 10 0 0 0 0 0 1 1 20 11 12 26 13
                                  13 0 0 25 13 0 0 0 9 0 0 6 7 0 0 0 0 4 6 7 8
                                  10))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| NIL NIL |EntireRing&|
                |Algebra&| NIL |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |Rng&| NIL |NonAssociativeAlgebra&| NIL NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 8)
                 (|UnivariateSkewPolynomialCategory| 8)
                 (|MaybeSkewPolynomialCategory| 8 17 34)
                 (|FiniteAbelianMonoidRing| 8 17) (|AbelianMonoidRing| 8 17)
                 (|Algebra| 21) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 8) (|Ring|)
                 (|FreeModuleCategory| 8 17) (|NonAssociativeAlgebra| 21)
                 (|Rng|) (|SemiRing|) (|NonAssociativeAlgebra| 8) (|SemiRng|)
                 (|IndexedDirectProductCategory| 8 17) (|Module| 21)
                 (|Module| 8) (|FullyLinearlyExplicitOver| 8)
                 (|IndexedProductCategory| 8 17) (|BiModule| 8 8)
                 (|BiModule| $$ $$) (|BiModule| 21 21)
                 (|LinearlyExplicitOver| 8) (|LinearlyExplicitOver| 14)
                 (|NonAssociativeRing|) (|AbelianProductCategory| 8)
                 (|LeftModule| 8) (|RightModule| 8) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 21) (|RightModule| 21)
                 (|RightModule| 14) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 8)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| 8) (|SetCategory|) (|RetractableTo| 21)
                 (|RetractableTo| 14) (|Eltable| 8 8) (|CoercibleFrom| 8)
                 (|BasicType|) (|CoercibleTo| 41) (|noZeroDivisors|)
                 (|CoercibleFrom| 21) (|CoercibleFrom| 14)
                 (|canonicalUnitNormal|) (|unitsKnown|))
              (|makeByteWordVec2| 10 '(1 9 8 8 10)))))
           '|lookupIncomplete|)) 
