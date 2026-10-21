
(SDEFUN |JBP;jetVariables;%L;1| ((|p| (%)) (% (|List| JB)))
        (SPADCALL |p| (QREFELT % 10))) 

(SDEFUN |JBP;subst;%JB2%;2| ((|p| (%)) (|jv| (JB)) (|exp| (%)) (% (%)))
        (SPADCALL |p| |jv| |exp| (QREFELT % 12))) 

(MAKEPROP '|JBP;numerator;2%;3| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |JBP;numerator;2%;3| ((|l| (%)) (% (%))) |l|) 

(SDEFUN |JBP;denominator;2%;4| ((|l| (%)) (% (%))) (|spadConstant| % 15)) 

(SDEFUN |JBP;solveFor;%JBU;5| ((|p| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG ((|c| (%)) (|cc| (R)))
               (SEQ (LETT |c| (SPADCALL |p| |jv| (QREFELT % 17)))
                    (EXIT
                     (COND
                      ((SPADCALL |c| (QREFELT % 19))
                       (SEQ (LETT |cc| (SPADCALL |c| (QREFELT % 20)))
                            (EXIT
                             (CONS 0
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 15) |cc|
                                               (QREFELT % 22))
                                     |p| (QREFELT % 23))
                                    (SPADCALL |jv| (QREFELT % 24))
                                    (QREFELT % 25))))))
                      ('T (CONS 1 "failed"))))))) 

(SDEFUN |JBP;solveFor;%JBU;6| ((|p| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG ((|c| (%)) (|cc| (R)) (|rc| (|Union| R "failed")))
               (SEQ (LETT |c| (SPADCALL |p| |jv| (QREFELT % 17)))
                    (EXIT
                     (COND
                      ((SPADCALL |c| (QREFELT % 19))
                       (SEQ (LETT |cc| (SPADCALL |c| (QREFELT % 20)))
                            (LETT |rc| (SPADCALL |cc| (QREFELT % 28)))
                            (EXIT
                             (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                                   (#1='T
                                    (CONS 0
                                          (SPADCALL
                                           (SPADCALL (QCDR |rc|) |p|
                                                     (QREFELT % 29))
                                           (SPADCALL |jv| (QREFELT % 24))
                                           (QREFELT % 25))))))))
                      (#1# (CONS 1 "failed"))))))) 

(SDEFUN |JBP;groebner;2L;7| ((|lp| (|List| %)) (% (|List| %)))
        (SPROG
         ((#1=#:G31 NIL) (|p| NIL) (#2=#:G32 NIL) (|lj| (|List| (|List| JB)))
          (LJV (|List| JB)))
         (SEQ (SPADCALL (SPADCALL "groebner" (QREFELT % 32)) (QREFELT % 34))
              (LETT |lj|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |p| NIL) (LETT #2# |lp|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |p| (QREFELT % 11)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT LJV (SPADCALL (ELT % 35) |lj| NIL (QREFELT % 38)))
              (SPADCALL
               (SPADCALL (SPADCALL "LJV" (QREFELT % 32))
                         (SPADCALL LJV (QREFELT % 39)) (QREFELT % 40))
               (QREFELT % 34))
              (EXIT
               (SPADCALL |lp|
                         (|compiledLookupCheck| '|groebner|
                                                (LIST
                                                 (LIST '|List| (|devaluate| %))
                                                 (LIST '|List|
                                                       (|devaluate| %)))
                                                (|JetGroebner| (ELT % 6)
                                                               (ELT % 7) LJV %
                                                               (|DirectProduct|
                                                                (|#| LJV)
                                                                (|NonNegativeInteger|))))))))) 

(DECLAIM (NOTINLINE |JetBundlePolynomial;|)) 

(DEFUN |JetBundlePolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G76 NIL) (#2=#:G75 NIL)
    (#3=#:G74 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|JetBundlePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 95))
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
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Integer|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#2|
                                                        '(|PatternMatchable|
                                                          (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #2#
                                              (|HasCategory|
                                               (|IndexedExponents| |#2|)
                                               '(|Comparable|)))
                                        (OR (AND #1# #2#)
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
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
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
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
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #3#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
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
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #3#
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))))
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
                                          (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #3#
                                          (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
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
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #3#
                                          (|HasCategory| |#2|
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
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))))))))
    (|haddProp| |$ConstructorCache| '|JetBundlePolynomial| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 2147483648))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 4294967296))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseMultivariatePolynomial| |#1| |#2|))
    (COND
     ((|testBitVector| |pv$| 22)
      (QSETREFV % 27 (CONS (|dispatchFunction| |JBP;solveFor;%JBU;5|) %)))
     ('T (QSETREFV % 27 (CONS (|dispatchFunction| |JBP;solveFor;%JBU;6|) %))))
    (COND
     ((|testBitVector| |pv$| 25)
      (QSETREFV % 42 (CONS (|dispatchFunction| |JBP;groebner;2L;7|) %))))
    %))) 

(DEFUN |JetBundlePolynomial| (&REST #1=#:G77)
  (SPROG NIL
         (PROG (#2=#:G78)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundlePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundlePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundlePolynomial|)))))))))) 

(MAKEPROP '|JetBundlePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|List| 7) (0 . |variables|)
              |JBP;jetVariables;%L;1| (5 . |eval|) |JBP;subst;%JB2%;2|
              |JBP;numerator;2%;3| (12 . |1|) |JBP;denominator;2%;4|
              (16 . |differentiate|) (|Boolean|) (22 . |ground?|)
              (27 . |retract|) (32 . |1|) (36 . /) (42 . *) (48 . |coerce|)
              (53 . -) (|Union| % '"failed") (59 . |solveFor|) (65 . |recip|)
              (70 . *) (|String|) (|OutputForm|) (76 . |message|) (|Void|)
              (81 . |print|) (86 . |setUnion|) (|Mapping| 9 9 9) (|List| 9)
              (92 . |reduce|) (99 . |coerce|) (104 . |assign|) (|List| %)
              (110 . |groebner|) (|PositiveInteger|) (|Integer|)
              (|NonNegativeInteger|) (|List| 47) (|Symbol|) (|List| 45)
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 7 '#1="failed") (|SparseEchelonMatrix| 7 %)
              (|Record| (|:| |DPhi| %) (|:| |JVars| 9))
              (|Record| (|:| |DSys| 41) (|:| |JVars| 37))
              (|Union| '"failed" (|List| 48))
              (|Record| (|:| |Sys| 41) (|:| JM 53) (|:| |Depend| 56))
              (|Union| 41 '#2="failed") (|SparseUnivariatePolynomial| 6)
              (|List| 6) (|IndexedExponents| 7) (|Mapping| 61 61)
              (|Union| 6 '#1#) (|Record| (|:| |k| 61) (|:| |c| 6)) (|List| 64)
              (|List| 61) (|Mapping| 6 6) (|Union| 78 '#3="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 44)
              (|HashState|) (|SingleInteger|)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 44 %)
              (|Record| (|:| |mat| 79) (|:| |vec| (|Vector| 44))) (|Vector| %)
              (|Matrix| 44) (|Fraction| 44) (|Mapping| 6 61) (|Factored| %)
              (|Factored| 49) (|Union| 85 '#3#) (|List| 49) (|Union| 80 '#1#)
              (|Union| 44 '#1#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)) (|Matrix| 6)
              (|Record| (|:| |mat| 89) (|:| |vec| (|Vector| 6))) (|Equation| %)
              (|List| 91) (|Record| (|:| |var| 7) (|:| |exponent| 45))
              (|Union| 93 '#2#))
           '#(|variables| 115 |subst| 120 |solveFor| 127 |retract| 133
              |numerator| 138 |jetVariables| 143 |ground?| 148 |groebner| 153
              |eval| 158 |differentiate| 165 |denominator| 171 |coerce| 176 |1|
              181 / 185 - 191 * 197)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 11 0 11 0 0 0 0 0 0 0 10 26 1 0 0 0 0 26 1
                                  0 0 0 0 10 4 1 0 0 0 27 10 1 0 0 0 0 27 1 1 0
                                  0 0 0 0 0 0 0 0 0 8 0 0 0 0 29 28 9 0 0 0 0
                                  14 13 6 5 0 0 0 0 14 12 31 30 7 6 5 3 2 0 0 0
                                  0 0 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |JetBundleFunctionCategory&|
                |GcdDomain&| |AbelianMonoidRing&| NIL NIL NIL
                |PartialDifferentialRing&| |Algebra&| |Algebra&| |Algebra&|
                |EntireRing&| |PartialDifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |Module&| NIL
                NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                NIL |NonAssociativeRng&| NIL NIL NIL NIL |AbelianGroup&| NIL
                NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL NIL NIL NIL |AbelianSemiGroup&|
                |SetWithZero&| |Magma&| |FullyRetractableTo&| |Evalable&|
                |Hashable&| |RetractableTo&| |RetractableTo&| |SetCategory&|
                NIL |RetractableTo&| |RetractableTo&| |InnerEvalable&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                NIL |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|JetBundleFunctionCategory| 7) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|PartialDifferentialRing| 7) (|Algebra| 6) (|Algebra| 80)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 47)
                 (|Ring|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 80) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 80)
                 (|Module| $$) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|LinearlyExplicitOver| 44) (|LinearlyExplicitOver| 6)
                 (|BiModule| 80 80) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|RightModule| 44) (|RightModule| 80) (|LeftModule| 80)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|PatternMatchable| 44) (|PatternMatchable| (|Float|))
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyRetractableTo| 6)
                 (|Evalable| $$) (|Hashable|) (|RetractableTo| 44)
                 (|RetractableTo| 80) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 7) (|RetractableTo| 6)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 70)
                 (|ConvertibleTo| 72) (|ConvertibleTo| 71)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 44)
                 (|CoercibleFrom| 80) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 31) (|BasicType|)
                 (|unitsKnown|) (|JetBundleOperationsCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| 6) (|InnerEvalable| 7 6)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 42
                                  '(1 0 9 0 10 3 0 0 0 7 0 12 0 0 0 15 2 0 0 0
                                    7 17 1 0 18 0 19 1 0 6 0 20 0 6 0 21 2 0 0
                                    0 6 22 2 0 0 0 0 23 1 0 0 7 24 2 0 0 0 0 25
                                    2 0 26 0 7 27 1 6 26 0 28 2 0 0 6 0 29 1 31
                                    0 30 32 1 31 33 0 34 2 9 0 0 0 35 3 37 9 36
                                    0 9 38 1 9 31 0 39 2 31 0 0 0 40 1 0 41 41
                                    42 1 0 9 0 10 3 0 0 0 7 0 13 2 0 26 0 7 27
                                    1 0 6 0 20 1 0 0 0 14 1 0 9 0 11 1 0 18 0
                                    19 1 25 41 41 42 3 0 0 0 7 0 12 2 0 0 0 7
                                    17 1 0 0 0 16 1 0 0 7 24 0 0 0 15 2 22 0 0
                                    6 22 2 0 0 0 0 25 2 0 0 0 0 23 2 0 0 6 0
                                    29)))))
           '|lookupIncomplete|)) 
