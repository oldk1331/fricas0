
(SDEFUN |UP;coerce;%Of;1| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL |p| (SPADCALL (QREFELT % 6) (QREFELT % 11)) (QREFELT % 12))) 

(SDEFUN |UP;convert;%If;2| ((|p| (%)) (% (|InputForm|)))
        (SPROG ((|xi| (|InputForm|)))
               (SEQ (LETT |xi| (SPADCALL (QREFELT % 6) (QREFELT % 15)))
                    (EXIT
                     (SPADCALL (CONS #'|UP;convert;%If;2!0| |xi|) (ELT % 16)
                               |p| (QREFELT % 20)))))) 

(SDEFUN |UP;convert;%If;2!0| ((|c| NIL) (|xi| NIL)) |xi|) 

(SDEFUN |UP;coerce;V%;3| ((|v| (|Variable| |x|)) (% (%)))
        (SPADCALL (|spadConstant| % 23) 1 (QREFELT % 25))) 

(DECLAIM (NOTINLINE |UnivariatePolynomial;|)) 

(DEFUN |UnivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G70 NIL) (#2=#:G69 NIL)
    (#3=#:G68 NIL) (#4=#:G67 NIL) (#5=#:G66 NIL) (#6=#:G65 NIL) (#7=#:G64 NIL)
    (#8=#:G62 NIL) (#9=#:G63 NIL) (#10=#:G61 NIL) (#11=#:G60 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|UnivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 84))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#2|
                                                       '(|CharacteristicNonZero|))
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
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#2|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND (|HasCategory| |#2| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#2| '(|SemiRing|))
                                        (|HasCategory| |#2| '(|Field|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|EntireRing|))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#2| '(|Field|)) #2#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#2| '(|Field|)) #2#
                                            #3#
                                            (|HasCategory| |#2|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #2# #3#)
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
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|EntireRing|))
                                         (|HasCategory| |#2| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#2|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|Canonical|))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
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
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#2|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #4#
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
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #3#
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
                                         #4#)
                                        (LETT #5#
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
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #3#
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
                                         #5#)
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
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #3#
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
                                        (LETT #7#
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
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #3#
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
                                         #7#)
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #9#
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
                                          #8#)
                                         (AND #8#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #8#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #8#
                                              (|HasCategory| |#2| '(|Field|)))
                                         (AND #8# #2#) (AND #8# #3#)
                                         (AND #8#
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #9#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #10#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #11#
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
                                         #10# #11#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #11#)))))
    (|haddProp| |$ConstructorCache| '|UnivariatePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 1125899906842624))
    (AND (|HasCategory| |#2| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#2| '(|EntireRing|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (|HasCategory| |#2| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#2| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|SemiRing|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#2| '(|Ring|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #8# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #10#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #8# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|CommutativeRing|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      #11#
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #8# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 1152921504606846976))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseUnivariatePolynomial| |#2|))
    (COND
     ((|testBitVector| |pv$| 28)
      (QSETREFV % 21 (CONS (|dispatchFunction| |UP;convert;%If;2|) %))))
    %))) 

(DEFUN |UnivariatePolynomial| (&REST #1=#:G71)
  (SPROG NIL
         (PROG (#2=#:G72)
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

(MAKEPROP '|UnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Symbol|) (|OutputForm|)
              (0 . |outputForm|) (5 . |outputForm|) |UP;coerce;%Of;1|
              (|InputForm|) (11 . |convert|) (16 . |convert|) (|Mapping| 14 39)
              (|Mapping| 14 7) (|PolynomialCategoryLifting| 24 39 7 $$ 14)
              (21 . |map|) (28 . |convert|) (33 . |1|) (37 . |1|)
              (|NonNegativeInteger|) (41 . |monomial|)
              (|Variable| (NRTEVAL (QREFELT % 6))) |UP;coerce;V%;3| (|Boolean|)
              (|String|) (|PositiveInteger|)
              (|Record| (|:| |k| 24) (|:| |c| 7)) (|List| 31) (|Mapping| 7 7)
              (|List| 24) (|List| %) (|List| 7) (|Union| 7 '#1="failed")
              (|Mapping| 24 24) (|SingletonAsOrderedSet|) (|List| 39)
              (|Union| 39 '"failed") (|SparseUnivariatePolynomial| %)
              (|Union| 35 '#2="failed") (|Vector| 7) (|Union| % '#3="failed")
              (|Union| 54 '#4="failed") (|Matrix| %) (|Pattern| (|Float|))
              (|Pattern| 52) (|SingleInteger|) (|HashState|) (|Integer|)
              (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 52))) (|Vector| %)
              (|Matrix| 52) (|List| 9) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 52 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 52) (|Mapping| 7 24) (|Fraction| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 63 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 35) (|:| |generator| %)) (|Factored| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 62 '#3#)
              (|Record| (|:| |coef| 7) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 74 '#4#) (|List| 42) (|Factored| 42) (|Union| 60 '#1#)
              (|Union| 52 '#1#) (|Matrix| 7)
              (|Record| (|:| |mat| 78) (|:| |vec| 44))
              (|Record| (|:| |var| 39) (|:| |exponent| 24)) (|Union| 80 '#2#)
              (|Equation| %) (|List| 82))
           '#(~= 47 |zero?| 53 |vectorise| 58 |variables| 64 |unvectorise| 75
              |unmakeSUP| 80 |univariate| 85 |unitNormal| 96 |unitCanonical|
              101 |unit?| 106 |totalDegreeSorted| 111 |totalDegree| 117
              |support| 128 |subtractIfCan| 133 |subResultantGcd| 139
              |squareFreePolynomial| 145 |squareFreePart| 150 |squareFree| 155
              |solveLinearPolynomialEquation| 160 |smaller?| 166 |sizeLess?|
              172 |shiftRight| 178 |shiftLeft| 184 |separate| 190 |sample| 196
              |rightRecip| 200 |rightPower| 205 |retractIfCan| 217 |retract|
              237 |resultant| 257 |rem| 270 |reductum| 276 |reducedSystem| 281
              |recip| 303 |quo| 308 |pseudoRemainder| 314 |pseudoQuotient| 320
              |pseudoDivide| 326 |principalIdeal| 332 |primitivePart| 337
              |primitiveMonomials| 348 |prime?| 353 |pomopo!| 358
              |plenaryPower| 366 |patternMatch| 372 |order| 386 |opposite?| 392
              |one?| 398 |numberOfMonomials| 403 |nextItem| 408 |multivariate|
              413 |multiplyExponents| 425 |multiEuclidean| 431 |monomials| 437
              |monomial?| 442 |monomial| 447 |monicDivide| 467 |minimumDegree|
              480 |mapExponents| 497 |map| 503 |makeSUP| 509 |mainVariable| 514
              |listOfTerms| 519 |linearExtend| 524 |leftRecip| 530 |leftPower|
              535 |leadingTerm| 547 |leadingSupport| 552 |leadingMonomial| 557
              |leadingCoefficient| 562 |lcmCoef| 567 |lcm| 573 |latex| 584
              |karatsubaDivide| 589 |isTimes| 595 |isPlus| 600 |isExpt| 605
              |integrate| 610 |init| 615 |hashUpdate!| 619 |hash| 625 |ground?|
              630 |ground| 635 |gcdPolynomial| 640 |gcd| 646 |fmecg| 657
              |factorSquareFreePolynomial| 665 |factorPolynomial| 670 |factor|
              675 |extendedEuclidean| 680 |exquo| 693 |expressIdealMember| 705
              |eval| 711 |euclideanSize| 765 |elt| 770 |divideExponents| 800
              |divide| 806 |discriminant| 812 |differentiate| 823 |degree| 906
              |convert| 923 |content| 938 |constructOrdered| 949 |construct|
              954 |conditionP| 959 |composite| 964 |commutator| 976 |coerce|
              982 |coefficients| 1017 |coefficient| 1022 |charthRoot| 1042
              |characteristic| 1047 |binomThmExpt| 1051 |associator| 1058
              |associates?| 1065 |antiCommutator| 1071 |annihilate?| 1077 ^
              1083 D 1095 = 1171 |1| 1177 |0| 1181 / 1185 - 1191 + 1202 * 1208)
           'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 0 14 11 0 14 11 0 18 0 22 4 17 21 4 25 19
                                  23 4 21 1 26 26 23 13 21 1 0 23 4 5 1 0 0 43
                                  4 4 1 0 0 0 26 43 1 1 0 0 0 0 0 15 13 13 50
                                  13 49 9 0 0 24 46 35 33 10 0 0 0 23 13 13 12
                                  7 6 0 0 28 27 20 16 23 14 13 13 39 37 8 7 6 4
                                  3 2 0 0 0 0 0 0 0 0))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| NIL |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL |DifferentialExtension&| NIL NIL |DifferentialRing&|
                |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |PartialDifferentialRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL
                |MagmaWithUnit&| |AbelianMonoid&| NIL NIL
                |NonAssociativeSemiRng&| NIL |SetWithZero&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&| NIL
                |RetractableTo&| |Evalable&| |Hashable&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| |RetractableTo&| NIL NIL NIL
                NIL NIL NIL NIL |InnerEvalable&| NIL NIL NIL NIL NIL NIL NIL
                NIL NIL |BasicType&| NIL |InnerEvalable&| |InnerEvalable&| NIL
                NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 7)
                 (|PolynomialCategory| 7 24 39) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 7 24 39)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 7 24) (|GcdDomain|)
                 (|AbelianMonoidRing| 7 24) (|IntegralDomain|)
                 (|DifferentialExtension| 7) (|LeftOreRing|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 9) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 39) (|Algebra| 7) (|Algebra| 60)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 7) (|NonAssociativeAlgebra| 60)
                 (|FreeModuleCategory| 7 24) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| 60)
                 (|IndexedDirectProductCategory| 7 24) (|SemiRng|)
                 (|LinearlyExplicitOver| 52) (|LinearlyExplicitOver| 7)
                 (|NonAssociativeRing|) (|BiModule| 60 60) (|BiModule| $$ $$)
                 (|BiModule| 7 7) (|IndexedProductCategory| 7 24)
                 (|NonAssociativeRng|) (|RightModule| 52) (|RightModule| 60)
                 (|LeftModule| 60) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 7) (|LeftModule| 7)
                 (|AbelianProductCategory| 7) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|StepThrough|)
                 (|SetWithZero|) (|PatternMatchable| 52)
                 (|PatternMatchable| (|Float|)) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 7)
                 (|CommutativeStar|) (|RetractableTo| 39) (|Evalable| $$)
                 (|Hashable|) (|RetractableTo| 52) (|RetractableTo| 60)
                 (|SetCategory|) (|RetractableTo| 7) (|ConvertibleTo| 14)
                 (|Canonical|) (|Eltable| (|Fraction| $$) (|Fraction| $$))
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|additiveValuation|)
                 (|CoercibleFrom| 39) (|InnerEvalable| $$ $$)
                 (|ConvertibleTo| 49) (|ConvertibleTo| 48)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 52)
                 (|CoercibleFrom| 60) (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 10) (|BasicType|)
                 (|CoercibleFrom| 7) (|InnerEvalable| 39 7)
                 (|InnerEvalable| 39 $$) (|VariablesCommuteWithCoefficients|)
                 (|Eltable| 7 7) (|Eltable| $$ $$))
              (|makeByteWordVec2| 83
                                  '(1 10 0 9 11 2 8 10 0 10 12 1 9 14 0 15 1 7
                                    14 0 16 3 19 14 17 18 2 20 1 0 14 0 21 0 0
                                    0 22 0 7 0 23 2 0 0 7 24 25 2 0 28 0 0 1 1
                                    59 28 0 1 2 0 44 0 24 1 2 0 40 0 0 1 1 0 40
                                    0 1 1 0 0 44 1 1 0 0 5 1 2 0 42 0 39 1 1 0
                                    5 0 1 1 53 59 0 1 1 53 0 0 1 1 53 28 0 1 2
                                    0 24 0 40 1 1 0 24 0 1 2 0 24 0 40 1 1 0 34
                                    0 1 2 60 45 0 0 1 2 20 0 0 0 1 1 11 75 42 1
                                    1 17 0 0 1 1 17 68 0 1 2 11 73 74 42 1 2 31
                                    28 0 0 1 2 14 28 0 0 1 2 4 0 0 24 1 2 0 0 0
                                    24 1 2 17 69 0 0 1 0 59 0 1 1 57 45 0 1 2 0
                                    0 0 30 1 2 57 0 0 24 1 1 0 37 0 1 1 6 76 0
                                    1 1 7 77 0 1 1 13 41 0 1 1 0 7 0 1 1 6 60 0
                                    1 1 7 52 0 1 1 13 39 0 1 3 5 0 0 0 39 1 2 5
                                    7 0 0 1 2 14 0 0 0 1 1 29 0 0 1 2 42 53 47
                                    54 1 1 42 55 47 1 1 4 78 47 1 2 4 79 47 54
                                    1 1 57 45 0 1 2 14 0 0 0 1 2 4 0 0 0 1 2 20
                                    0 0 0 1 2 20 72 0 0 1 1 14 67 35 1 1 17 0 0
                                    1 2 17 0 0 39 1 1 13 35 0 1 1 11 28 0 1 4 0
                                    0 0 7 24 0 1 2 54 0 0 30 1 3 32 57 0 48 57
                                    1 3 34 58 0 49 58 1 2 20 24 0 0 1 2 59 28 0
                                    0 1 1 57 28 0 1 1 0 24 0 1 1 24 45 0 1 2 0
                                    0 42 39 1 2 0 0 5 39 1 2 0 0 0 24 1 2 14 43
                                    35 0 1 1 0 35 0 1 1 0 28 0 1 2 0 0 7 24 25
                                    3 0 0 0 40 34 1 3 0 0 0 39 24 1 3 4 66 0 0
                                    39 1 2 4 66 0 0 1 1 0 24 0 1 2 0 34 0 40 1
                                    2 0 24 0 39 1 2 0 0 38 0 1 2 0 0 33 0 1 1 0
                                    5 0 1 1 0 41 0 1 1 0 32 0 1 2 5 7 61 0 1 1
                                    57 45 0 1 2 0 0 0 30 1 2 57 0 0 24 1 1 29
                                    31 0 1 1 29 24 0 1 1 29 0 0 1 1 29 7 0 1 2
                                    17 70 0 0 1 1 17 0 35 1 2 17 0 0 0 1 1 0 29
                                    0 1 2 4 66 0 24 1 1 13 43 0 1 1 0 43 0 1 1
                                    13 81 0 1 1 1 0 0 1 0 24 0 1 2 12 51 51 0 1
                                    1 12 50 0 1 1 0 28 0 1 1 0 7 0 1 2 17 42 42
                                    42 1 2 17 0 0 0 1 1 17 0 35 1 4 4 0 0 24 7
                                    0 1 1 11 75 42 1 1 11 75 42 1 1 11 68 0 1 3
                                    14 64 0 0 0 1 2 14 65 0 0 1 2 53 45 0 0 1 2
                                    16 45 0 7 1 2 14 43 35 0 1 3 0 0 0 40 36 1
                                    3 0 0 0 39 7 1 3 0 0 0 39 0 1 3 0 0 0 40 35
                                    1 2 13 0 0 82 1 2 13 0 0 83 1 3 13 0 0 35
                                    35 1 3 13 0 0 0 0 1 1 14 24 0 1 2 0 0 0 0 1
                                    2 0 7 0 7 1 2 14 7 62 7 1 2 20 62 62 62 1 2
                                    20 62 0 62 1 2 0 45 0 24 1 2 14 66 0 0 1 2
                                    5 0 0 39 1 1 5 7 0 1 2 40 0 0 9 1 3 40 0 0
                                    9 24 1 2 40 0 0 56 1 3 40 0 0 56 34 1 3 4 0
                                    0 40 34 1 2 4 0 0 40 1 3 4 0 0 39 24 1 2 4
                                    0 0 39 1 3 4 0 0 33 0 1 3 4 0 0 33 24 1 2 4
                                    0 0 33 1 2 4 0 0 24 1 1 4 0 0 1 1 0 24 0 1
                                    2 0 24 0 39 1 2 0 34 0 40 1 1 36 48 0 1 1
                                    38 49 0 1 1 28 14 0 21 1 17 7 0 1 2 17 0 0
                                    39 1 1 29 0 32 1 1 0 0 32 1 1 52 46 47 1 2
                                    20 45 0 0 1 2 20 71 62 0 1 2 58 0 0 0 1 1 0
                                    10 0 13 1 0 0 7 1 1 0 0 26 27 1 55 0 0 1 1
                                    56 0 52 1 1 30 0 60 1 1 13 0 39 1 1 0 36 0
                                    1 2 0 7 0 24 1 3 0 0 0 39 24 1 3 0 0 0 40
                                    34 1 1 52 45 0 1 0 58 24 1 3 51 0 0 0 24 1
                                    3 58 0 0 0 0 1 2 53 28 0 0 1 2 0 0 0 0 1 2
                                    58 28 0 0 1 2 0 0 0 30 1 2 57 0 0 24 1 2 40
                                    0 0 9 1 3 40 0 0 9 24 1 2 40 0 0 56 1 3 40
                                    0 0 56 34 1 3 4 0 0 40 34 1 2 4 0 0 40 1 3
                                    4 0 0 39 24 1 2 4 0 0 39 1 2 4 0 0 33 1 3 4
                                    0 0 33 24 1 2 4 0 0 24 1 1 4 0 0 1 2 0 28 0
                                    0 1 0 57 0 22 0 59 0 1 2 14 0 0 7 1 1 61 0
                                    0 1 2 61 0 0 0 1 2 0 0 0 0 1 2 0 0 30 0 1 2
                                    0 0 0 0 1 2 0 0 7 0 1 2 0 0 0 7 1 2 42 0 0
                                    52 1 2 61 0 52 0 1 2 59 0 24 0 1 2 1 0 0 60
                                    1 2 1 0 60 0 1)))))
           '|lookupComplete|)) 
