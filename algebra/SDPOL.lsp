
(DECLAIM (NOTINLINE |SequentialDifferentialPolynomial;|)) 

(DEFUN |SequentialDifferentialPolynomial| (#1=#:G88)
  (SPROG NIL
         (PROG (#2=#:G89)
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

(DEFUN |SequentialDifferentialPolynomial;| (|#1|)
  (SPROG
   ((#1=#:G87 NIL) (|pv$| NIL) (#2=#:G80 NIL) (#3=#:G81 NIL) (#4=#:G82 NIL)
    (#5=#:G83 NIL) (#6=#:G84 NIL) (#7=#:G85 NIL) (#8=#:G86 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
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
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
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
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #8#)
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
                                        (LETT #7#
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
                                                         '(|CharacteristicNonZero|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
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
                                          #8#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
                                         #7#)
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #8# #6#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #8# #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #8# #6#)
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #8#
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
                                        (LETT #4#
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SequentialDifferentialVariable|
                                            (|Symbol|))
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #8#
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
                                         #4#)
                                        (LETT #3#
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #8#
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
                                         #3#)
                                        (LETT #2#
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #8#
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
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SequentialDifferentialPolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 137438953472))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 274877906944))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 549755813888))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1099511627776))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #8# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2199023255552))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #8# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4398046511104))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|SequentialDifferentialPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|DifferentialSparseMultivariatePolynomial| 6 34 29)
              (|local| |#1|) (|Union| 15 '#1="failed") (|Matrix| %)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 16)
              (|SingleInteger|) (|HashState|)
              (|Record| (|:| |mat| 17) (|:| |vec| (|Vector| 16))) (|Vector| %)
              (|Integer|) (|Matrix| 16) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 16 %) (|Union| % '#1#) (|PositiveInteger|)
              (|Boolean|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 16) (|IndexedExponents| 29)
              (|Record| (|:| |k| 25) (|:| |c| 6)) (|List| 26)
              (|NonNegativeInteger|) (|SequentialDifferentialVariable| 34)
              (|Mapping| 6 25) (|List| 34) (|List| 6) (|List| %) (|Symbol|)
              (|Mapping| % 28)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|Factored| %) (|List| 28)
              (|Factored| 37) (|Union| 42 '#1#) (|List| 37)
              (|Union| 24 '#2="failed") (|Union| 16 '#2#) (|List| 29)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |mat| 48) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Equation| %) (|List| 49) (|Union| 29 '#2#)
              (|Record| (|:| |var| 29) (|:| |exponent| 28))
              (|Union| 52 '#3="failed") (|Union| 33 '#3#)
              (|SparseMultivariatePolynomial| 6 34) (|Union| 55 '#2#)
              (|Union| 34 '#2#) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 25 25)
              (|Union| 6 '#2#) (|List| 25) (|OutputForm|) (|String|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 37
                                '(0 0 0 10 0 10 0 14 28 0 27 12 1 2 3 13 29 15
                                  9 20 19 0 0 0 0 1 13 29 0 0 1 4 9 29 0 0 0 0
                                  1 9 25 0 0 0 0 0 0 1 1 25 0 0 0 0 0 0 0 0 0 0
                                  0 8 31 33 0 0 0 0 5 6 29 17 18 18 0 0 0 0 0 0
                                  0 0 0 5 6 7 29 11 35 37 16 18 18 19 19))
            (CONS
             '#(|DifferentialPolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DifferentialExtension&| NIL NIL |Algebra&| NIL NIL
                |Algebra&| |Algebra&| |EntireRing&| |PartialDifferentialRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL NIL
                |Module&| |Module&| |FullyLinearlyExplicitOver&| |Module&|
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |Magma&|
                |FullyRetractableTo&| |AbelianSemiGroup&| NIL NIL NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| NIL
                |Hashable&| |RetractableTo&| |Evalable&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&|
                |InnerEvalable&|)
             (CONS
              '#((|DifferentialPolynomialCategory| 6 34 29 25)
                 (|PolynomialCategory| 6 25 29)
                 (|MaybeSkewPolynomialCategory| 6 25 29)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 25) (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 25) (|GcdDomain|) (|IntegralDomain|)
                 (|DifferentialExtension| 6) (|CommutativeRing|)
                 (|LeftOreRing|) (|Algebra| 24) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|Algebra| $$)
                 (|EntireRing|) (|PartialDifferentialRing| 29)
                 (|PartialDifferentialRing| 34) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|FreeModuleCategory| 6 25)
                 (|NonAssociativeAlgebra| 24) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| $$) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 25) (|Module| 24)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6) (|Module| $$)
                 (|NonAssociativeRing|) (|IndexedProductCategory| 6 25)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 24 24)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 16)
                 (|NonAssociativeRng|) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 24) (|RightModule| 24)
                 (|RightModule| 16) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|Magma|) (|FullyRetractableTo| 6)
                 (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 16)
                 (|RetractableTo| (|SparseMultivariatePolynomial| 6 34))
                 (|RetractableTo| 34) (|RetractableTo| 6) (|SetCategory|)
                 (|RetractableTo| 24) (|RetractableTo| 16) (|CommutativeStar|)
                 (|Hashable|) (|RetractableTo| 29) (|Evalable| $$)
                 (|CoercibleFrom| (|SparseMultivariatePolynomial| 6 34))
                 (|CoercibleFrom| 34) (|unitsKnown|)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 29 $$)
                 (|InnerEvalable| 29 6) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 63) (|CoercibleFrom| 24) (|CoercibleFrom| 16)
                 (|canonicalUnitNormal|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|ConvertibleTo| 10) (|ConvertibleTo| 11) (|ConvertibleTo| 9)
                 (|CoercibleFrom| 29) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 34 $$) (|InnerEvalable| 34 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
