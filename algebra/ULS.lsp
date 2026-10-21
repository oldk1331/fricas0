
(SDEFUN |ULS;variable;%S;1| ((|x| (%)) (% (|Symbol|))) (QREFELT % 7)) 

(SDEFUN |ULS;center;%Coef;2| ((|x| (%)) (% (|Coef|))) (QREFELT % 8)) 

(SDEFUN |ULS;coerce;V%;3| ((|v| (|Variable| |var|)) (% (%)))
        (COND
         ((SPADCALL (QREFELT % 8) (QREFELT % 13))
          (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 17)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 17))
                    (SPADCALL (QREFELT % 8) 0 (QREFELT % 17)) (QREFELT % 20))))) 

(SDEFUN |ULS;differentiate;%V%;4| ((|x| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |x| (QREFELT % 23))) 

(SDEFUN |ULS;integrate;%V%;5| ((|x| (%)) (|v| (|Variable| |var|)) (% (%)))
        (SPADCALL |x| (QREFELT % 25))) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeries;|)) 

(DEFUN |UnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G61 NIL)
    (#2=#:G59 NIL) (#3=#:G58 NIL) (#4=#:G56 NIL) (#5=#:G57 NIL) (#6=#:G55 NIL)
    (#7=#:G53 NIL) (#8=#:G52 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|UnivariateLaurentSeries| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 79))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicNonZero|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|RealConstant|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|UnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|Comparable|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #1#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR #1# (|HasCategory| |#1| '(|Field|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|RetractableTo| (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #3#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|ComparableRepresentation|)))
                                        (LETT #4#
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|OrderedRing|)))
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|UnivariateTaylorSeries| |#1|
                                                                          |#2|
                                                                          |#3|)
                                                '(|OrderedRing|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         #5#)
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
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         #5#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|ComparableRepresentation|)))
                                         #5#)
                                        (LETT #6#
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|PolynomialFactorizationExplicit|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #6#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|UnivariateTaylorSeries| |#1|
                                                                        |#2|
                                                                        |#3|)
                                              '(|EuclideanDomain|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|SemiRing|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #7#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #7#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1# (|HasCategory| |#1| '(|Field|))
                                         #2# #7#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #8#
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #8# #1#)
                                         (AND #8#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #8# #2#) (AND #8# #7#)
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                         (AND #8#
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|)))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianGroup|))
                                              #4#)
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              (|HasCategory|
                                               (|UnivariateTaylorSeries| |#1|
                                                                         |#2|
                                                                         |#3|)
                                               '(|CharacteristicZero|)))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|Fraction| (|Integer|))
                                               '(|AbelianMonoid|))
                                              #4#)
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))))))
    (|haddProp| |$ConstructorCache| '|UnivariateLaurentSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|)))
         (AND (|HasCategory| |#1| '(|Field|)) #3#))
     (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#1| '(|Field|)) (|HasCategory| % '(|AbelianGroup|))
         #4# (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| |#1| '(|Field|)) (|HasCategory| % '(|SetWithZero|)) #4#
         (|augmentPredVector| % 36028797018963968))
    (AND (|HasCategory| |#1| '(|Field|))
         (|HasCategory| % '(|CharacteristicNonZero|)) #6#
         (|augmentPredVector| % 72057594037927936))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Field|))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 2305843009213693952))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))) #7#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 4611686018427387904))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 9223372036854775808))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 18446744073709551616))
    (AND
     (OR #8# (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #2# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| % 36893488147419103232))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 26 (CONS (|dispatchFunction| |ULS;integrate;%V%;5|) %))))
    %))) 

(DEFUN |UnivariateLaurentSeries| (&REST #1=#:G62)
  (SPROG NIL
         (PROG (#2=#:G63)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|UnivariateLaurentSeries|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateLaurentSeries;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariateLaurentSeries|)))))))))) 

(MAKEPROP '|UnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|UnivariateLaurentSeriesConstructor| 6 36)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|Symbol|)
              |ULS;variable;%S;1| |ULS;center;%Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |1|) (9 . |1|) (|Integer|) (13 . |monomial|)
              (19 . |0|) (23 . |0|) (27 . +)
              (|Variable| (NRTEVAL (QREFELT % 7))) |ULS;coerce;V%;3|
              (33 . |differentiate|) |ULS;differentiate;%V%;4|
              (38 . |integrate|) (43 . |integrate|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 16) (|:| |c| 6))
              (|List| 30) (|Mapping| 6 6) (|Stream| 30) (|Mapping| 6 16)
              (|Stream| 6)
              (|UnivariateTaylorSeries| 6 (NRTEVAL (QREFELT % 7))
                                        (NRTEVAL (QREFELT % 8)))
              (|Union| 36 '#1="failed") (|Union| % '#2="failed")
              (|Union| 49 '#2#) (|Matrix| %) (|InputForm|) (|Pattern| 58)
              (|Pattern| 16) (|Equation| 36) (|List| 44) (|List| 36) (|List| 9)
              (|Record| (|:| |mat| 50) (|:| |vec| (|Vector| 16))) (|Vector| %)
              (|Matrix| 16) (|PatternMatchResult| 58 %)
              (|PatternMatchResult| 16 %) (|Factored| 54)
              (|SparseUnivariatePolynomial| %) (|Union| 56 '#2#) (|List| 54)
              (|DoubleFloat|) (|Float|) (|Union| 16 '#1#) (|Fraction| 16)
              (|Union| 60 '#1#) (|Union| 9 '#1#) (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 63) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 67 '#3="failed") (|Union| 70 '#3#) (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 70) (|:| |generator| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Matrix| 36) (|Record| (|:| |mat| 75) (|:| |vec| (|Vector| 36)))
              (|Mapping| 36 36) (|Fraction| (|Polynomial| 6)))
           '#(|variable| 49 |monomial| 54 |integrate| 60 |differentiate| 71
              |coerce| 82 |center| 87 |1| 92 |0| 96 + 100)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 3 0 3 0 35 3 0 3 3 0 3 0 25 3 24 3 3 42 41
                                  3 30 31 25 24 19 45 45 3 40 31 24 19 3 3 31
                                  24 19 0 12 3 3 44 31 0 0 0 12 3 45 3 31 31 0
                                  0 0 0 0 30 30 51 30 40 40 50 3 30 30 40 49 0
                                  0 16 15 3 8 33 52 0 0 3 10 27 27 7 4 24 2 0 0
                                  3 14 13 11 10 9 27 27 30 7 7 6 32 5 4 44 3 3
                                  25 24 2 2 2 2 2 2 1 0 0 0 0))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |QuotientFieldCategory&| |UnivariateLaurentSeriesCategory&|
                |Field&| NIL |PolynomialFactorizationExplicit&|
                |EuclideanDomain&| |UnivariatePowerSeriesCategory&|
                |UniqueFactorizationDomain&| NIL |PowerSeriesCategory&|
                |GcdDomain&| |AbelianMonoidRing&| NIL |DifferentialExtension&|
                NIL |DivisionRing&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| NIL |Algebra&|
                |EntireRing&| |Algebra&| |Algebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                NIL |OrderedAbelianSemiGroup&| |AbelianGroup&| |OrderedSet&|
                NIL NIL NIL NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&| NIL
                |NonAssociativeSemiRng&| NIL NIL |FullyEvalableOver&| NIL NIL
                |SetWithZero&| |AbelianSemiGroup&| |Magma&| NIL |Evalable&|
                |RetractableTo&| |RetractableTo&| NIL |RetractableTo&| NIL
                |TranscendentalFunctionCategory&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL |PartialOrder&| NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |RadicalCategory&|
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|UnivariateTaylorSeries|
                                                                6 7 8))
                 (|QuotientFieldCategory| (|UnivariateTaylorSeries| 6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6) (|Field|)
                 (|UnivariateSeriesWithRationalExponents| 6 16)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UnivariatePowerSeriesCategory| 6 16)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|PowerSeriesCategory| 6 16 (|SingletonAsOrderedSet|))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 16) (|IntegralDomain|)
                 (|DifferentialExtension| (|UnivariateTaylorSeries| 6 7 8))
                 (|CommutativeRing|) (|DivisionRing|) (|LeftOreRing|)
                 (|DifferentialRing|) (|PartialDifferentialRing| 9)
                 (|Algebra| (|UnivariateTaylorSeries| 6 7 8)) (|OrderedRing|)
                 (|Algebra| 60) (|EntireRing|) (|Algebra| $$) (|Algebra| 6)
                 (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| (|UnivariateTaylorSeries| 6 7 8))
                 (|SemiRing|) (|NonAssociativeAlgebra| 60)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|FullyLinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|Module| (|UnivariateTaylorSeries| 6 7 8)) (|Module| 60)
                 (|Module| $$) (|Module| 6) (|SemiRng|)
                 (|LinearlyExplicitOver| 16)
                 (|LinearlyExplicitOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|BiModule| (|UnivariateTaylorSeries| 6 7 8)
                             (|UnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRing|) (|BiModule| 60 60) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 16)
                 (|RightModule| 16)
                 (|RightModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|NonAssociativeRng|)
                 (|LeftModule| (|UnivariateTaylorSeries| 6 7 8))
                 (|RightModule| 60) (|LeftModule| 60) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|OrderedMagmaWithZero|)
                 (|OrderedAbelianSemiGroup|) (|AbelianGroup|) (|OrderedSet|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| (|UnivariateTaylorSeries| 6 7 8))
                 (|MagmaWithZero|) (|Comparable|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 16) (|PatternMatchable| 58)
                 (|FullyEvalableOver| (|UnivariateTaylorSeries| 6 7 8))
                 (|StepThrough|) (|ComparableRepresentation|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|Magma|)
                 (|Patternable| (|UnivariateTaylorSeries| 6 7 8))
                 (|Evalable| (|UnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| 16) (|RetractableTo| 60) (|RealConstant|)
                 (|RetractableTo| 9) (|CommutativeStar|)
                 (|TranscendentalFunctionCategory|) (|SetCategory|)
                 (|RetractableTo| (|UnivariateTaylorSeries| 6 7 8)) (|Type|)
                 (|ConvertibleTo| 43) (|ConvertibleTo| 42)
                 (|Eltable| (|UnivariateTaylorSeries| 6 7 8) $$)
                 (|InnerEvalable| (|UnivariateTaylorSeries| 6 7 8)
                                  (|UnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| 9 (|UnivariateTaylorSeries| 6 7 8))
                 (|CoercibleFrom| 16) (|CoercibleFrom| 60) (|PartialOrder|)
                 (|ConvertibleTo| 58) (|ConvertibleTo| 57) (|ConvertibleTo| 41)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleFrom| 9) (|unitsKnown|) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|RadicalCategory|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|Eltable| $$ $$)
                 (|CoercibleTo| 28) (|BasicType|)
                 (|VariablesCommuteWithCoefficients|)
                 (|CoercibleFrom| (|UnivariateTaylorSeries| 6 7 8)))
              (|makeByteWordVec2| 64
                                  '(1 6 12 0 13 0 6 0 14 0 0 0 15 2 0 0 6 16 17
                                    0 6 0 18 0 0 0 19 2 0 0 0 0 20 1 0 0 0 23 1
                                    0 0 0 25 2 0 0 0 21 26 1 0 9 0 10 2 0 0 6
                                    16 17 1 2 0 0 25 2 2 0 0 21 26 2 0 0 0 21
                                    24 1 42 0 0 23 1 0 0 21 22 1 0 6 0 11 0 62
                                    0 15 0 64 0 19 2 0 0 0 0 20)))))
           '|lookupIncomplete|)) 
