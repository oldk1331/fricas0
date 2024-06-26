
(DECLAIM (NOTINLINE |UnivariateFormalPowerSeries;|)) 

(DEFUN |UnivariateFormalPowerSeries| (#1=#:G39)
  (SPROG NIL
         (PROG (#2=#:G40)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateFormalPowerSeries|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|UnivariateFormalPowerSeries;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariateFormalPowerSeries|)))))))))) 

(DEFUN |UnivariateFormalPowerSeries;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G33 NIL) (#2=#:G34 NIL) (#3=#:G35 NIL) (#4=#:G38 NIL)
    (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|UnivariateFormalPowerSeries| DV$1))
    (LETT % (GETREFV 29))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|Field|))))))
    (|haddProp| |$ConstructorCache| '|UnivariateFormalPowerSeries| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 33554432))
    (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR #1# (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 8589934592))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|UnivariateFormalPowerSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|UnivariateTaylorSeries| 6 (NRTEVAL '|x|)
                                        (NRTEVAL (|spadConstant| % 7)))
              (|local| |#1|) (0 . |Zero|) (|Boolean|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Symbol|) (|NonNegativeInteger|) (|List| 11) (|List| 12)
              (|PositiveInteger|) (|Integer|)
              (|Record| (|:| |k| 12) (|:| |c| 6)) (|List| 17)
              (|Variable| (NRTEVAL '|x|)) (|Fraction| 16) (|Stream| 6)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6) (|Polynomial| 6)
              (|Mapping| 6 16) (|Stream| 17) (|Mapping| 6 6) (|String|)
              (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 23
                                '(0 0 0 0 0 2 6 1 6 2 3 4 5 8 7 17 1 6 5 14 17
                                  0 1 6 5 0 0 0 1 16 0 0 0 0 0 1 1 17 23 22 14
                                  14 0 0 21 14 0 0 0 6 1 0 0 0 6 2 16 9 1 1 1 1
                                  1 1))
            (CONS
             '#(|UnivariateTaylorSeriesCategory&| NIL
                |UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| NIL NIL |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL
                |TranscendentalFunctionCategory&| NIL |BasicType&| NIL NIL NIL
                NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariateTaylorSeriesCategory| 6)
                 (|UnivariateSeriesWithRationalExponents| 6 12)
                 (|UnivariatePowerSeriesCategory| 6 12)
                 (|PowerSeriesCategory| 6 12 (|SingletonAsOrderedSet|))
                 (|AbelianMonoidRing| 6 12) (|IntegralDomain|)
                 (|CommutativeRing|) (|Algebra| 20) (|Algebra| $$)
                 (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 11) (|DifferentialRing|) (|Ring|)
                 (|NonAssociativeAlgebra| 20) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|) (|Rng|) (|SemiRng|)
                 (|Module| 20) (|Module| $$) (|Module| 6)
                 (|IndexedProductCategory| 6 12) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 20 20) (|NonAssociativeRing|)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 20) (|RightModule| 20) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 28) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 7 '(0 6 0 7)))))
           '|lookupIncomplete|)) 
