
(DECLAIM (NOTINLINE |SequentialDifferentialPolynomial;|)) 

(DEFUN |SequentialDifferentialPolynomial;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G54 NIL) (#2=#:G53 NIL) (#3=#:G52 NIL)
    (#4=#:G51 NIL) (#5=#:G50 NIL) (#6=#:G49 NIL) (#7=#:G48 NIL) (#8=#:G47 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SequentialDifferentialPolynomial| DV$1))
    (LETT % (GETREFV 65))
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
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SequentialDifferentialVariable|
                                           (|Symbol|))
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SequentialDifferentialVariable|
                                               (|Symbol|))
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory|
                                         (|IndexedExponents|
                                          (|SequentialDifferentialVariable|
                                           (|Symbol|)))
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|IndexedExponents|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|)))
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
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
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #4#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #2# #4#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #4#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #2#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         #5#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         #6#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #2#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #7#)
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SequentialDifferentialVariable|
                                                 (|Symbol|))
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|DifferentialRing|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #2#
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #8#)))))
    (|haddProp| |$ConstructorCache| '|SequentialDifferentialPolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 549755813888))
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 1099511627776))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2199023255552))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2# (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4398046511104))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #2# (AND #4# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8796093022208))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |SequentialDifferentialPolynomial| (#1=#:G55)
  (SPROG NIL
         (PROG (#2=#:G56)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SequentialDifferentialPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SequentialDifferentialPolynomial;| #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SequentialDifferentialPolynomial|)))))))))) 

(MAKEPROP '|SequentialDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 30 21)
              (|local| |#1|) (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 13) (|:| |c| 6))
              (|List| 11) (|IndexedExponents| 21) (|Mapping| 6 6) (|List| %)
              (|List| 13) (|List| 6) (|NonNegativeInteger|)
              (|Union| 6 '#1="failed") (|Mapping| 13 13)
              (|SequentialDifferentialVariable| 30) (|List| 18) (|List| 21)
              (|Union| 21 '"failed") (|SparseUnivariatePolynomial| %)
              (|SparseUnivariatePolynomial| 6) (|Union| 15 '#2="failed")
              (|Union| % '"failed") (|Integer|) (|Symbol|) (|Union| 30 '#1#)
              (|Mapping| % 18) (|List| 30) (|Union| 35 '#1#)
              (|SparseMultivariatePolynomial| 6 30) (|Union| 45 '#3="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 29)
              (|SingleInteger|) (|HashState|) (|Matrix| 29)
              (|Record| (|:| |mat| 43) (|:| |vec| (|Vector| 29))) (|Vector| %)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 29 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 29) (|Mapping| 6 13) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 54 '#3#) (|List| 25) (|Factored| 25) (|Union| 49 '#1#)
              (|Union| 29 '#1#)
              (|Record| (|:| |mat| 59) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 21) (|:| |exponent| 18)) (|Union| 61 '#2#)
              (|List| 64) (|Equation| %))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 39
                                '(0 0 11 0 11 0 15 0 30 13 29 0 20 21 10 16 31
                                  14 1 0 31 14 1 0 0 0 31 10 4 1 0 0 27 10 1 0
                                  0 0 0 27 1 1 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 35
                                  33 9 0 0 0 0 19 19 18 31 6 5 0 0 0 0 20 20 19
                                  19 17 39 37 12 31 7 6 5 3 2 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| |PartialDifferentialRing&|
                |EntireRing&| |Algebra&| |Algebra&| |Algebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Rng&| NIL
                |Module&| |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL
                NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&| NIL
                NIL NIL NIL |NonAssociativeSemiRng&| |AbelianMonoid&|
                |MagmaWithUnit&| NIL NIL NIL NIL |AbelianSemiGroup&|
                |FullyRetractableTo&| |SetWithZero&| |Magma&| |Evalable&|
                |RetractableTo&| |Hashable&| NIL |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&| |InnerEvalable&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL |BasicType&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 30 21 13)
                 (|PolynomialCategory| 6 13 21)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 13 21)
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 6 13)
                 (|GcdDomain|) (|AbelianMonoidRing| 6 13) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 30) (|PartialDifferentialRing| 21)
                 (|EntireRing|) (|Algebra| $$) (|Algebra| 6) (|Algebra| 49)
                 (|Ring|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 49)
                 (|FreeModuleCategory| 6 13) (|Rng|) (|SemiRing|) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 49)
                 (|IndexedDirectProductCategory| 6 13) (|SemiRng|)
                 (|LinearlyExplicitOver| 29) (|LinearlyExplicitOver| 6)
                 (|BiModule| 49 49) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 13) (|NonAssociativeRing|)
                 (|RightModule| 29) (|RightModule| 49) (|LeftModule| 49)
                 (|LeftModule| $$) (|RightModule| $$) (|RightModule| 6)
                 (|LeftModule| 6) (|AbelianProductCategory| 6)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|PatternMatchable| 29) (|PatternMatchable| (|Float|))
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 6) (|SetWithZero|) (|Magma|)
                 (|Evalable| $$) (|RetractableTo| 21) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 29) (|RetractableTo| 49)
                 (|SetCategory|) (|RetractableTo| 6) (|RetractableTo| 30)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 30))
                 (|InnerEvalable| 30 6) (|InnerEvalable| 30 $$)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 21)
                 (|ConvertibleTo| 38) (|ConvertibleTo| 40) (|ConvertibleTo| 39)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 29) (|CoercibleFrom| 49)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 9) (|BasicType|) (|CoercibleFrom| 6)
                 (|InnerEvalable| 21 6) (|InnerEvalable| 21 $$)
                 (|VariablesCommuteWithCoefficients|) (|unitsKnown|)
                 (|CoercibleFrom| 30)
                 (|CoercibleFrom| (|SparseMultivariatePolynomial| 6 30)))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
