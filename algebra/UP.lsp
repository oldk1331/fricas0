
(SDEFUN |UP;coerce;%Of;1| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL (QREFELT % 6) (QREFELT % 11)) (QREFELT % 12))) 

(SDEFUN |UP;coerce;V%;2| ((|v| (|Variable| |x|)) (% (%)))
        (SPADCALL (|spadConstant| % 15) 1 (QREFELT % 17))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G509)
  (SPROG NIL
         (PROG (#2=#:G510)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariatePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariatePolynomial|)))))))))) 

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G508 NIL) (|pv$| NIL) (#2=#:G499 NIL) (#3=#:G501 NIL) (#4=#:G500 NIL)
    (#5=#:G502 NIL) (#6=#:G503 NIL) (#7=#:G504 NIL) (#8=#:G505 NIL)
    (#9=#:G506 NIL) (#10=#:G507 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 77))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#2| '(|Comparable|))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #10#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #10#)
                                        (LETT #9#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#2| '(|Field|))
                                            #10# #9#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (|HasCategory| |#2| '(|StepThrough|))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #10#
                                         #9#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #8#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|))))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #10#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #5#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #4#
                                              (|HasCategory| |#2| '(|Field|)))
                                         (AND #4# #10#) (AND #4# #9#)
                                         (AND #4#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 70368744177664))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 140737488355328))
    (AND (OR (|HasCategory| |#2| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 281474976710656))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #4# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseUnivariatePolynomial| |#2|))
    %))) 

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;%Of;1|
              (11 . |One|) (15 . |One|) (|NonNegativeInteger|)
              (19 . |monomial|) (|Variable| (NRTEVAL (QREFELT % 6)))
              |UP;coerce;V%;2| (|Union| 28 '#1="failed") (|Matrix| %)
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 30) (|HashState|)
              (|SingleInteger|)
              (|Record| (|:| |mat| 29) (|:| |vec| (|Vector| 30))) (|Vector| %)
              (|Matrix| 30) (|Integer|) (|List| 9) (|List| 16)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 30 %)
              (|Union| % '#1#) (|PositiveInteger|) (|Boolean|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 30) (|Record| (|:| |k| 16) (|:| |c| 7)) (|List| 40)
              (|SingletonAsOrderedSet|) (|Mapping| 7 16)
              (|Record| (|:| |coef| 45) (|:| |generator| %)) (|List| %)
              (|Union| 45 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 49 '"failed")
              (|Fraction| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Factored| %)
              (|Record| (|:| |coef| 7) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 51 '"failed") (|Factored| 53) (|Union| 60 '#1#)
              (|List| 53) (|Union| 39 '#2="failed") (|Union| 30 '#2#)
              (|Mapping| 7 7) (|List| 42) (|Matrix| 7)
              (|Record| (|:| |mat| 65) (|:| |vec| 72)) (|Union| 42 '#2#)
              (|List| 69) (|Equation| %)
              (|Record| (|:| |var| 42) (|:| |exponent| 16))
              (|Union| 70 '"failed") (|Vector| 7) (|List| 7) (|Mapping| 16 16)
              (|Union| 7 '#2#) (|String|))
           '#(~= 25 |zero?| 31 |vectorise| 36 |variables| 42 |unvectorise| 47
              |unmakeSUP| 52 |univariate| 57 |unitNormal| 68 |unitCanonical| 73
              |unit?| 78 |totalDegreeSorted| 83 |totalDegree| 89 |support| 100
              |subtractIfCan| 105 |subResultantGcd| 111 |squareFreePolynomial|
              117 |squareFreePart| 122 |squareFree| 127
              |solveLinearPolynomialEquation| 132 |smaller?| 138 |sizeLess?|
              144 |shiftRight| 150 |shiftLeft| 156 |separate| 162 |sample| 168
              |rightRecip| 172 |rightPower| 177 |retractIfCan| 189 |retract|
              209 |resultant| 229 |rem| 242 |reductum| 248 |reducedSystem| 253
              |recip| 275 |quo| 280 |pseudoRemainder| 286 |pseudoQuotient| 292
              |pseudoDivide| 298 |principalIdeal| 304 |primitivePart| 309
              |primitiveMonomials| 320 |prime?| 325 |pomopo!| 330
              |plenaryPower| 338 |patternMatch| 344 |order| 358 |opposite?| 364
              |one?| 370 |numberOfMonomials| 375 |nextItem| 380 |multivariate|
              385 |multiplyExponents| 397 |multiEuclidean| 403 |monomials| 409
              |monomial?| 414 |monomial| 419 |monicDivide| 439 |minimumDegree|
              452 |mapExponents| 469 |map| 475 |makeSUP| 481 |mainVariable| 486
              |listOfTerms| 491 |linearExtend| 496 |leftRecip| 502 |leftPower|
              507 |leadingTerm| 519 |leadingSupport| 524 |leadingMonomial| 529
              |leadingCoefficient| 534 |lcmCoef| 539 |lcm| 545 |latex| 556
              |karatsubaDivide| 561 |isTimes| 567 |isPlus| 572 |isExpt| 577
              |integrate| 582 |init| 587 |hashUpdate!| 591 |hash| 597 |ground?|
              602 |ground| 607 |gcdPolynomial| 612 |gcd| 618 |fmecg| 629
              |factorSquareFreePolynomial| 637 |factorPolynomial| 642 |factor|
              647 |extendedEuclidean| 652 |exquo| 665 |expressIdealMember| 677
              |eval| 683 |euclideanSize| 737 |elt| 742 |divideExponents| 772
              |divide| 778 |discriminant| 784 |differentiate| 795 |degree| 878
              |convert| 895 |content| 910 |constructOrdered| 921 |construct|
              926 |conditionP| 931 |composite| 936 |commutator| 948 |coerce|
              954 |coefficients| 989 |coefficient| 994 |charthRoot| 1014
              |characteristic| 1019 |binomThmExpt| 1023 |associator| 1030
              |associates?| 1037 |antiCommutator| 1043 |annihilate?| 1049 ^
              1055 |Zero| 1067 |One| 1071 D 1075 = 1151 / 1157 - 1163 + 1174 *
              1180)
           'NIL
           (CONS
            (|makeByteWordVec2| 46
                                '(0 0 0 10 14 0 10 14 0 18 22 21 17 4 1 2 3 21
                                  4 23 19 25 4 26 0 1 21 13 23 26 0 0 1 5 4 23
                                  0 0 0 1 4 4 40 0 0 0 0 0 1 1 40 26 15 46 13
                                  13 0 0 45 13 0 0 0 9 30 32 24 0 0 6 7 12 13
                                  13 23 0 0 0 0 0 0 0 0 4 6 7 8 34 36 11 13 13
                                  14 23 16 20))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL NIL NIL
                |DifferentialExtension&| |Algebra&| NIL NIL |Algebra&|
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&| |Rng&|
                NIL NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&|
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| |Hashable&|
                |Evalable&| |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 16 42)
                 (|MaybeSkewPolynomialCategory| 7 16 42)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 7 16) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 7 16)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 7) (|Algebra| 39)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 7)
                 (|PartialDifferentialRing| 42) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 9) (|DifferentialRing|) (|Ring|)
                 (|FreeModuleCategory| 7 16) (|NonAssociativeAlgebra| 39)
                 (|NonAssociativeAlgebra| 7) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 7 16) (|Module| 39)
                 (|Module| 7) (|FullyLinearlyExplicitOver| 7) (|Module| $$)
                 (|IndexedProductCategory| 7 16) (|BiModule| 7 7)
                 (|BiModule| $$ $$) (|BiModule| 39 39) (|NonAssociativeRing|)
                 (|LinearlyExplicitOver| 7) (|LinearlyExplicitOver| 30)
                 (|AbelianProductCategory| 7) (|LeftModule| 7)
                 (|RightModule| 7) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 39) (|RightModule| 39) (|RightModule| 30)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 7)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 30)
                 (|StepThrough|) (|RetractableTo| 7) (|SetCategory|)
                 (|RetractableTo| 39) (|RetractableTo| 30) (|Hashable|)
                 (|Evalable| $$) (|RetractableTo| 42) (|CommutativeStar|)
                 (|Eltable| $$ $$) (|Eltable| 7 7)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 42 $$)
                 (|InnerEvalable| 42 7) (|CoercibleFrom| 7) (|BasicType|)
                 (|CoercibleTo| 10) (|unitsKnown|) (|CoercibleFrom| 39)
                 (|CoercibleFrom| 30) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 23) (|ConvertibleTo| 24) (|ConvertibleTo| 22)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 42)
                 (|additiveValuation|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 76
                                  '(1 10 0 9 11 2 8 10 0 10 12 0 0 0 14 0 7 0
                                    15 2 0 0 7 16 17 2 0 37 0 0 1 1 56 37 0 1 2
                                    0 72 0 16 1 1 0 64 0 1 1 0 0 72 1 1 0 0 5 1
                                    2 0 53 0 42 1 1 0 5 0 1 1 50 38 0 1 1 50 0
                                    0 1 1 50 37 0 1 2 0 16 0 64 1 2 0 16 0 64 1
                                    1 0 16 0 1 1 0 32 0 1 2 57 35 0 0 1 2 20 0
                                    0 0 1 1 10 58 53 1 1 17 0 0 1 1 17 55 0 1 2
                                    10 59 60 53 1 2 9 37 0 0 1 2 14 37 0 0 1 2
                                    4 0 0 16 1 2 0 0 0 16 1 2 17 54 0 0 1 0 56
                                    0 1 1 54 35 0 1 2 54 0 0 16 1 2 0 0 0 36 1
                                    1 6 61 0 1 1 7 62 0 1 1 13 67 0 1 1 0 75 0
                                    1 1 6 39 0 1 1 7 30 0 1 1 13 42 0 1 1 0 7 0
                                    1 2 5 7 0 0 1 3 5 0 0 0 42 1 2 14 0 0 0 1 1
                                    27 0 0 1 2 39 27 21 28 1 1 39 29 21 1 1 4
                                    65 21 1 2 4 66 21 28 1 1 54 35 0 1 2 14 0 0
                                    0 1 2 4 0 0 0 1 2 20 0 0 0 1 2 20 56 0 0 1
                                    1 14 44 45 1 2 17 0 0 42 1 1 17 0 0 1 1 13
                                    45 0 1 1 10 37 0 1 4 0 0 0 7 16 0 1 2 51 0
                                    0 36 1 3 29 33 0 23 33 1 3 31 34 0 24 34 1
                                    2 20 16 0 0 1 2 56 37 0 0 1 1 54 37 0 1 1 0
                                    16 0 1 1 24 35 0 1 2 0 0 53 42 1 2 0 0 5 42
                                    1 2 0 0 0 16 1 2 14 46 45 0 1 1 0 45 0 1 1
                                    0 37 0 1 3 0 0 0 42 16 1 3 0 0 0 64 32 1 2
                                    0 0 7 16 17 2 4 47 0 0 1 3 4 47 0 0 42 1 2
                                    0 32 0 64 1 2 0 16 0 42 1 1 0 16 0 1 2 0 0
                                    74 0 1 2 0 0 63 0 1 1 0 5 0 1 1 0 67 0 1 1
                                    0 41 0 1 2 5 7 43 0 1 1 54 35 0 1 2 54 0 0
                                    16 1 2 0 0 0 36 1 1 27 40 0 1 1 27 16 0 1 1
                                    27 0 0 1 1 27 7 0 1 2 17 52 0 0 1 2 17 0 0
                                    0 1 1 17 0 45 1 1 0 76 0 1 2 4 47 0 16 1 1
                                    13 46 0 1 1 0 46 0 1 1 13 71 0 1 1 1 0 0 1
                                    0 24 0 1 2 12 25 25 0 1 1 12 26 0 1 1 0 37
                                    0 1 1 0 7 0 1 2 17 53 53 53 1 1 17 0 45 1 2
                                    17 0 0 0 1 4 4 0 0 16 7 0 1 1 10 58 53 1 1
                                    10 58 53 1 1 10 55 0 1 2 14 48 0 0 1 3 14
                                    50 0 0 0 1 2 50 35 0 0 1 2 16 35 0 7 1 2 14
                                    46 45 0 1 3 13 0 0 0 0 1 3 13 0 0 45 45 1 2
                                    13 0 0 68 1 2 13 0 0 69 1 3 0 0 0 64 45 1 3
                                    0 0 0 64 73 1 3 0 0 0 42 0 1 3 0 0 0 42 7 1
                                    1 14 16 0 1 2 14 7 51 7 1 2 20 51 0 51 1 2
                                    20 51 51 51 1 2 0 7 0 7 1 2 0 0 0 0 1 2 0
                                    35 0 16 1 2 14 47 0 0 1 1 5 7 0 1 2 5 0 0
                                    42 1 3 37 0 0 9 16 1 3 37 0 0 31 32 1 2 37
                                    0 0 9 1 2 37 0 0 31 1 1 4 0 0 1 2 4 0 0 16
                                    1 3 4 0 0 63 16 1 2 4 0 0 63 1 3 4 0 0 63 0
                                    1 2 4 0 0 42 1 3 4 0 0 42 16 1 2 4 0 0 64 1
                                    3 4 0 0 64 32 1 2 0 32 0 64 1 2 0 16 0 42 1
                                    1 0 16 0 1 1 11 22 0 1 1 33 23 0 1 1 35 24
                                    0 1 2 17 0 0 42 1 1 17 7 0 1 1 27 0 41 1 1
                                    0 0 41 1 1 48 20 21 1 2 20 57 51 0 1 2 20
                                    35 0 0 1 2 55 0 0 0 1 1 52 0 0 1 1 53 0 30
                                    1 1 28 0 39 1 1 13 0 42 1 1 0 0 18 19 1 0 0
                                    7 1 1 0 10 0 13 1 0 73 0 1 3 0 0 0 64 32 1
                                    3 0 0 0 42 16 1 2 0 7 0 16 1 1 49 35 0 1 0
                                    55 16 1 3 47 0 0 0 16 1 3 55 0 0 0 0 1 2 50
                                    37 0 0 1 2 0 0 0 0 1 2 55 37 0 0 1 2 54 0 0
                                    16 1 2 0 0 0 36 1 0 56 0 1 0 54 0 14 3 37 0
                                    0 31 32 1 3 37 0 0 9 16 1 2 37 0 0 9 1 2 37
                                    0 0 31 1 1 4 0 0 1 2 4 0 0 16 1 2 4 0 0 63
                                    1 3 4 0 0 63 16 1 2 4 0 0 42 1 3 4 0 0 42
                                    16 1 2 4 0 0 64 1 3 4 0 0 64 32 1 2 0 37 0
                                    0 1 2 14 0 0 7 1 2 58 0 0 0 1 1 58 0 0 1 2
                                    0 0 0 0 1 2 39 0 0 30 1 2 58 0 30 0 1 2 56
                                    0 16 0 1 2 1 0 39 0 1 2 1 0 0 39 1 2 0 0 0
                                    7 1 2 0 0 7 0 1 2 0 0 0 0 1 2 0 0 36 0
                                    1)))))
           '|lookupComplete|)) 
