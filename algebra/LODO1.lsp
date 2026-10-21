
(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperator1;|)) 

(DEFUN |LinearOrdinaryDifferentialOperator1;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G34 NIL) (#2=#:G32 NIL) (#3=#:G33 NIL)
    (#4=#:G31 NIL) (#5=#:G30 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|LinearOrdinaryDifferentialOperator1| DV$1))
    (LETT % (GETREFV 40))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND #2#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4# #5#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #5#)
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|LinearOrdinaryDifferentialOperator1|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1073741824))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (|HasCategory| |#1| '(|CommutativeRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #4#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #5#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND #2# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 549755813888))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |LinearOrdinaryDifferentialOperator1| (#1=#:G35)
  (SPROG NIL
         (PROG (#2=#:G36)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LinearOrdinaryDifferentialOperator1|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|LinearOrdinaryDifferentialOperator1;| #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearOrdinaryDifferentialOperator1|)))))))))) 

(MAKEPROP '|LinearOrdinaryDifferentialOperator1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|LinearOrdinaryDifferentialOperator| 6 (NRTEVAL (ELT % 7)))
              (|local| |#1|) (0 . |differentiate|) (|Boolean|) (|String|)
              (|OutputForm|) (|PositiveInteger|)
              (|Record| (|:| |k| 14) (|:| |c| 6)) (|List| 12)
              (|NonNegativeInteger|) (|Mapping| 6 6) (|List| 14) (|List| %)
              (|List| 6) (|Union| 6 '#1="failed") (|Mapping| 14 14)
              (|SingletonAsOrderedSet|) (|List| 21) (|Union| 21 '"failed")
              (|Matrix| 26) (|Matrix| %) (|Integer|)
              (|Record| (|:| |mat| 24) (|:| |vec| (|Vector| 26))) (|Vector| %)
              (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 26) (|Mapping| 6 14)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (|Union| 31 '#1#) (|Union| 26 '#1#)
              (|Record| (|:| |mat| 39) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 29
                                '(0 0 0 0 0 5 4 1 12 5 14 12 1 0 11 5 1 0 0 11
                                  22 11 1 0 0 0 12 22 1 1 0 0 0 0 0 13 14 14 29
                                  14 28 9 0 0 25 10 0 0 0 7 6 0 0 11 8 7 6 4 3
                                  2 0 0 0 0))
            (CONS
             '#(|LinearOrdinaryDifferentialOperatorCategory&|
                |UnivariateSkewPolynomialCategory&|
                |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |Algebra&| |EntireRing&| |Algebra&| NIL
                |NonAssociativeAlgebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |FreeModuleCategory&| |FullyLinearlyExplicitOver&| |Module&|
                |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL NIL |NonAssociativeSemiRng&| |SetWithZero&| NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&|
                NIL NIL)
             (CONS
              '#((|LinearOrdinaryDifferentialOperatorCategory| 6)
                 (|UnivariateSkewPolynomialCategory| 6)
                 (|MaybeSkewPolynomialCategory| 6 14 21)
                 (|FiniteAbelianMonoidRing| 6 14) (|AbelianMonoidRing| 6 14)
                 (|Algebra| 6) (|EntireRing|) (|Algebra| 31) (|Ring|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 31) (|FreeModuleCategory| 6 14)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 31)
                 (|IndexedDirectProductCategory| 6 14) (|SemiRng|)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 26)
                 (|LinearlyExplicitOver| 6) (|BiModule| 31 31)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 14) (|NonAssociativeRng|)
                 (|RightModule| 26) (|RightModule| 31) (|LeftModule| 31)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Comparable|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 26)
                 (|RetractableTo| 31) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 26)
                 (|CoercibleFrom| 31) (|noZeroDivisors|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 10) (|BasicType|) (|CoercibleFrom| 6)
                 (|Eltable| 6 6))
              (|makeByteWordVec2| 7 '(1 6 0 0 7)))))
           '|lookupIncomplete|)) 
