
(DEFPARAMETER |QuotientFieldCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |QuotientFieldCategory;|)) 

(DEFPARAMETER |QuotientFieldCategory;AL| 'NIL) 

(DEFUN |QuotientFieldCategory| (|t#1|)
  (LET (#1=#:G3 (#2=#:G4 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |QuotientFieldCategory;AL|)) (CDR #1#))
          (T
           (SETQ |QuotientFieldCategory;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|QuotientFieldCategory;| #2#)))
                    |QuotientFieldCategory;AL|))
           #1#)))) 

(DEFUN |QuotientFieldCategory;| (|t#1|)
  (SPROG ((#1=#:G2 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (COND (|QuotientFieldCategory;CAT|)
                                         ('T
                                          (LETT |QuotientFieldCategory;CAT|
                                                (|Join| (|Field|)
                                                        (|Algebra| '|t#1|)
                                                        (|RetractableTo|
                                                         '|t#1|)
                                                        (|FullyEvalableOver|
                                                         '|t#1|)
                                                        (|DifferentialExtension|
                                                         '|t#1|)
                                                        (|FullyLinearlyExplicitOver|
                                                         '|t#1|)
                                                        (|Patternable| '|t#1|)
                                                        (|FullyPatternMatchable|
                                                         '|t#1|)
                                                        (|mkCategory|
                                                         '(((/ (% |t#1| |t#1|))
                                                            T)
                                                           ((|numer| (|t#1| %))
                                                            T)
                                                           ((|denom| (|t#1| %))
                                                            T)
                                                           ((|numerator| (% %))
                                                            T)
                                                           ((|denominator|
                                                             (% %))
                                                            T)
                                                           ((|wholePart|
                                                             (|t#1| %))
                                                            (|has| |t#1|
                                                                   (|EuclideanDomain|)))
                                                           ((|fractionPart|
                                                             (% %))
                                                            (|has| |t#1|
                                                                   (|EuclideanDomain|)))
                                                           ((|ceiling|
                                                             (|t#1| %))
                                                            (|has| |t#1|
                                                                   (|IntegerNumberSystem|)))
                                                           ((|floor| (|t#1| %))
                                                            (|has| |t#1|
                                                                   (|IntegerNumberSystem|))))
                                                         '(((|StepThrough|)
                                                            (|has| |t#1|
                                                                   (|StepThrough|)))
                                                           ((|RetractableTo|
                                                             (|Integer|))
                                                            (|has| |t#1|
                                                                   (|RetractableTo|
                                                                    (|Integer|))))
                                                           ((|RetractableTo|
                                                             (|Fraction|
                                                              (|Integer|)))
                                                            (|has| |t#1|
                                                                   (|RetractableTo|
                                                                    (|Integer|))))
                                                           ((|ComparableRepresentation|)
                                                            (|has| |t#1|
                                                                   (|ComparableRepresentation|)))
                                                           ((|OrderedRing|)
                                                            (|has| |t#1|
                                                                   (|OrderedRing|)))
                                                           ((|RealConstant|)
                                                            (|has| |t#1|
                                                                   (|RealConstant|)))
                                                           ((|ConvertibleTo|
                                                             (|InputForm|))
                                                            (|has| |t#1|
                                                                   (|ConvertibleTo|
                                                                    (|InputForm|))))
                                                           ((|CharacteristicZero|)
                                                            (|has| |t#1|
                                                                   (|CharacteristicZero|)))
                                                           ((|CharacteristicNonZero|)
                                                            (|has| |t#1|
                                                                   (|CharacteristicNonZero|)))
                                                           ((|RetractableTo|
                                                             (|Symbol|))
                                                            (|has| |t#1|
                                                                   (|RetractableTo|
                                                                    (|Symbol|))))
                                                           ((|PolynomialFactorizationExplicit|)
                                                            (|has| |t#1|
                                                                   (|PolynomialFactorizationExplicit|))))
                                                         NIL NIL)))))))
           (SETELT #1# 0 (LIST '|QuotientFieldCategory| |t#1|))))) 
