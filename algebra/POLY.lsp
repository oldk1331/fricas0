
(SDEFUN |POLY;coerce;%Of;1| ((|p| (%)) (% (|OutputForm|)))
        (SPROG ((|r| (|Union| R "failed")) (#1=#:G10 NIL) (|a| (|Symbol|)))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 8)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 10)))
                      (#2='T
                       (SEQ
                        (LETT |a|
                              (COND
                               ((SPADCALL (QREFELT % 13))
                                (SPADCALL (SPADCALL |p| (QREFELT % 15))
                                          (QREFELT % 17)))
                               (#2#
                                (PROG2 (LETT #1# (SPADCALL |p| (QREFELT % 19)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                                  (|Union| (|Symbol|) "failed")
                                                  #1#)))))
                        (EXIT
                         (SPADCALL (SPADCALL |p| |a| (QREFELT % 21))
                                   (SPADCALL |a| (QREFELT % 22))
                                   (QREFELT % 24)))))))))) 

(SDEFUN |POLY;integrate;%S%;2| ((|p| (%)) (|x| (|Symbol|)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |p| |x| (QREFELT % 21)) (QREFELT % 26))
                  (SPADCALL |x| (QREFELT % 27)) (QREFELT % 28))) 

(DECLAIM (NOTINLINE |Polynomial;|)) 

(DEFUN |Polynomial;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G59 NIL) (#2=#:G58 NIL) (#3=#:G57 NIL)
    (#4=#:G56 NIL) (#5=#:G55 NIL) (#6=#:G54 NIL) (#7=#:G53 NIL) (#8=#:G51 NIL)
    (#9=#:G52 NIL) (#10=#:G50 NIL) (#11=#:G49 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Polynomial| DV$1))
    (LETT % (GETREFV 75))
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
                                        (|HasCategory| |#1| '(|Ring|))
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
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
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
                                         (|HasCategory| (|Symbol|)
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| (|Symbol|)
                                                            '(|Hashable|)))
                                        (|HasCategory| |#1| '(|Canonical|))
                                        (|HasCategory|
                                         (|IndexedExponents| (|Symbol|))
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
                                               (|IndexedExponents| (|Symbol|))
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #2# #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #2#
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         #4#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| (|Symbol|)
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         #5#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| (|Symbol|)
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))))
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #2#
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         #6#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory| (|Symbol|)
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))))
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
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #2#
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| (|Symbol|)
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         #7#)
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #9#
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
                                          #8#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #8# #2#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #9#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #10#
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
                                         #10#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #11#
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
                                         #10# #11#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #11#)))))
    (|haddProp| |$ConstructorCache| '|Polynomial| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 281474976710656))
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #10#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #11#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 288230376151711744))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 29 (CONS (|dispatchFunction| |POLY;integrate;%S%;2|) %))))
    %))) 

(DEFUN |Polynomial| (#1=#:G60)
  (SPROG NIL
         (PROG (#2=#:G61)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Polynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Polynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|Polynomial|)))))))))) 

(MAKEPROP '|Polynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 16)
              (|local| |#1|) (|Union| 6 '#1="failed") (0 . |retractIfCan|)
              (|OutputForm|) (5 . |coerce|) (|Boolean|)
              (|UserDefinedPartialOrdering| 16) (10 . |userOrdered?|)
              (|List| 16) (14 . |variables|) (|Symbol|) (19 . |largest|)
              (|Union| 16 '"failed") (24 . |mainVariable|)
              (|SparseUnivariatePolynomial| %) (29 . |univariate|)
              (35 . |coerce|) (|SparseUnivariatePolynomial| $$)
              (40 . |outputForm|) |POLY;coerce;%Of;1| (46 . |integrate|)
              (51 . |coerce|) (56 . |elt|) (62 . |integrate|) (|String|)
              (|PositiveInteger|) (|Record| (|:| |k| 34) (|:| |c| 6))
              (|List| 32) (|IndexedExponents| 16) (|Mapping| 6 6) (|List| %)
              (|List| 6) (|List| 34) (|NonNegativeInteger|) (|Mapping| 34 34)
              (|List| 39) (|SparseUnivariatePolynomial| 6)
              (|Union| 36 '#2="failed") (|Union| 55 '#3="failed") (|Matrix| %)
              (|Union| % '#3#) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 52) (|HashState|) (|SingleInteger|) (|Integer|)
              (|Matrix| 52) (|Record| (|:| |mat| 53) (|:| |vec| (|Vector| 52)))
              (|Vector| %) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 52 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 52) (|Mapping| 6 34) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 64 '#3#) (|List| 20) (|Factored| 20) (|Union| 59 '#1#)
              (|Union| 52 '#1#)
              (|Record| (|:| |mat| 69) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 16) (|:| |exponent| 39)) (|Union| 71 '#2#)
              (|List| 74) (|Equation| %))
           '#(|variables| 68 |univariate| 73 |retractIfCan| 79 |mainVariable|
              84 |integrate| 89 |coerce| 95)
           'NIL
           (CONS
            (|makeByteWordVec2| 48
                                '(0 11 0 11 0 17 0 28 15 27 4 18 29 16 1 30 30
                                  29 13 16 1 0 29 4 5 1 0 0 41 4 4 1 0 0 0 30
                                  41 1 1 0 0 0 0 0 12 13 13 48 13 47 9 0 0 34
                                  32 44 10 0 0 0 13 13 20 29 7 6 0 0 21 13 13
                                  19 38 36 14 29 8 7 6 4 3 2 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FreeModuleCategory&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                NIL |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&|
                |AbelianMonoid&| NIL NIL |NonAssociativeSemiRng&| NIL NIL
                |SetWithZero&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |Evalable&| |Hashable&|
                NIL |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL |InnerEvalable&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 34 16)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 34 16)
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 6 34)
                 (|GcdDomain|) (|AbelianMonoidRing| 6 34) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 16) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|Algebra| 59) (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 59)
                 (|FreeModuleCategory| 6 34) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 59)
                 (|IndexedDirectProductCategory| 6 34) (|SemiRng|)
                 (|LinearlyExplicitOver| 52) (|LinearlyExplicitOver| 6)
                 (|NonAssociativeRing|) (|BiModule| 59 59) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 34)
                 (|NonAssociativeRng|) (|RightModule| 52) (|RightModule| 59)
                 (|LeftModule| 59) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 52) (|PatternMatchable| (|Float|))
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 16) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 52) (|RetractableTo| 59)
                 (|SetCategory|) (|RetractableTo| 6) (|Canonical|)
                 (|CoercibleFrom| 16) (|InnerEvalable| $$ $$)
                 (|ConvertibleTo| 47) (|ConvertibleTo| 49) (|ConvertibleTo| 48)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 52) (|CoercibleFrom| 59) (|unitsKnown|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 9) (|BasicType|) (|CoercibleFrom| 6)
                 (|InnerEvalable| 16 6) (|InnerEvalable| 16 $$)
                 (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 29
                                  '(1 0 7 0 8 1 6 9 0 10 0 12 11 13 1 0 14 0 15
                                    1 12 16 14 17 1 0 18 0 19 2 0 20 0 16 21 1
                                    16 9 0 22 2 23 9 0 9 24 1 23 0 0 26 1 0 0
                                    16 27 2 23 2 0 2 28 2 0 0 0 16 29 1 0 14 0
                                    15 2 0 20 0 16 21 1 0 7 0 8 1 0 18 0 19 2 1
                                    0 0 16 29 1 0 9 0 25 1 13 0 16 27)))))
           '|lookupIncomplete|)) 
