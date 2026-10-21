
(SDEFUN |SKSMP;D;Var%;1| ((|v| (|Var|)) (% (%)))
        (SPADCALL (|spadConstant| % 10) |v| 1 (QREFELT % 13))) 

(SDEFUN |SKSMP;Delta;S%;2| ((|s| (|Symbol|)) (% (%)))
        (SPROG ((|vu| (|Union| |Var| "failed")))
               (SEQ (LETT |vu| (SPADCALL |s| (QREFELT % 17)))
                    (EXIT
                     (COND ((QEQCAR |vu| 1) (|error| "missing variable"))
                           ('T (SPADCALL (QCDR |vu|) (QREFELT % 14)))))))) 

(SDEFUN |SKSMP;lift_map| ((|f| (|Mapping| R R)) (% (|Mapping| % %)))
        (SPROG NIL (CONS #'|SKSMP;lift_map!0| (VECTOR % |f|)))) 

(SDEFUN |SKSMP;lift_map!0| ((|x| NIL) ($$ NIL))
        (PROG (|f| %)
          (LETT |f| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f| |x| (QREFELT % 28)))))) 

(SDEFUN |SKSMP;lift_morphism| ((|m| (|Automorphism| R)) (% (|Automorphism| %)))
        (SPROG NIL
               (SPADCALL
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!0| (VECTOR % |m|)) %)
                (|SKSMP;lift_map|
                 (CONS #'|SKSMP;lift_morphism!1| (VECTOR % |m|)) %)
                (QREFELT % 32)))) 

(SDEFUN |SKSMP;lift_morphism!1| ((|x| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |m| (QREFELT % 31)) |x| (QREFELT % 30)))))) 

(SDEFUN |SKSMP;lift_morphism!0| ((|x| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |x| (QREFELT % 30)))))) 

(SDEFUN |SKSMP;*;3%;5| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((#1=#:G36 NIL) (|v| (|Var|)) (|xu| (|Upol|)) (|yu| (|Upol|))
          (|ru| (|Upol|)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 34))
            (SPADCALL (SPADCALL |x| (QREFELT % 35)) |y| (QREFELT % 36)))
           ('T
            (SEQ
             (LETT |v|
                   (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 38)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                     (|Union| (QREFELT % 7) "failed") #1#)))
             (LETT |xu| (SPADCALL |x| |v| (QREFELT % 40)))
             (LETT |yu| (SPADCALL |y| |v| (QREFELT % 40)))
             (LETT |ru|
                   (SPADCALL |xu| |yu|
                             (|SKSMP;lift_morphism|
                              (SPADCALL |v| (QREFELT % 8)) %)
                             (|SKSMP;lift_map| (SPADCALL |v| (QREFELT % 9)) %)
                             (QREFELT % 42)))
             (EXIT (SPADCALL |ru| |v| (QREFELT % 43))))))))) 

(SDEFUN |SKSMP;*;%R%;6| ((|x| (%)) (|r| (R)) (% (%)))
        (SPADCALL |x| (SPADCALL |r| (QREFELT % 45)) (QREFELT % 44))) 

(SDEFUN |SKSMP;exquo;2%U;7| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|maxd| (|NonNegativeInteger|))
          (|ly| (|SparseMultivariatePolynomial| R |Var|)) (|lx1| (%))
          (|lx| (|SparseMultivariatePolynomial| R |Var|))
          (|cu| (|Union| (|SparseMultivariatePolynomial| R |Var|) "failed"))
          (#1=#:G59 NIL) (|cc| (%)) (|res| (%)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |y| (QREFELT % 34))
             (SPADCALL |x| (SPADCALL |y| (QREFELT % 35)) (QREFELT % 47)))
            ((SPADCALL |x| (QREFELT % 34)) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |maxd| (SPADCALL |x| (QREFELT % 48)))
                  (LETT |ly| (SPADCALL |y| (QREFELT % 49)))
                  (LETT |res| (|spadConstant| % 25))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |x| (|spadConstant| % 25) (QREFELT % 51)))
                         (GO G191)))
                       (SEQ (LETT |lx1| (SPADCALL |x| (QREFELT % 49)))
                            (EXIT
                             (COND
                              ((> (SPADCALL |lx1| (QREFELT % 48)) |maxd|)
                               (PROGN
                                (LETT #1# (CONS 1 "failed"))
                                (GO #2=#:G58)))
                              ('T
                               (SEQ (LETT |lx| |lx1|)
                                    (LETT |cu|
                                          (SPADCALL |lx| |ly| (QREFELT % 52)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |cu| 1)
                                       (PROGN
                                        (LETT #1# (CONS 1 "failed"))
                                        (GO #2#)))
                                      ('T
                                       (SEQ (LETT |cc| (QCDR |cu|))
                                            (LETT |res|
                                                  (SPADCALL |res| |cc|
                                                            (QREFELT % 53)))
                                            (EXIT
                                             (LETT |x|
                                                   (SPADCALL |x|
                                                             (SPADCALL |cc| |y|
                                                                       (QREFELT
                                                                        % 44))
                                                             (QREFELT %
                                                                      54)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 |res|))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SKSMP;^;%Pi%;8| ((|x| (%)) (|n| (|PositiveInteger|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G64 NIL) (|res| (%)))
               (SEQ (LETT |res| |x|)
                    (SEQ (LETT |i| 2) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res| (SPADCALL |res| |x| (QREFELT % 44)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SKSMP;^;%Nni%;9| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (COND ((EQL |n| 0) (|spadConstant| % 10))
              ('T (SPADCALL |x| |n| (QREFELT % 57))))) 

(SDEFUN |SKSMP;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G67 NIL) (|v| (|Var|)) (|xu| (|Upol|)))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 34))
                  (SPADCALL (SPADCALL |x| (QREFELT % 35)) (QREFELT % 60)))
                 ('T
                  (SEQ
                   (LETT |v|
                         (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 38)))
                             (QCDR #1#)
                           (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                           (|Union| (QREFELT % 7) "failed")
                                           #1#)))
                   (LETT |xu| (SPADCALL |x| |v| (QREFELT % 40)))
                   (EXIT
                    (SPADCALL |xu|
                              (SPADCALL (SPADCALL 'D (QREFELT % 61))
                                        (SPADCALL |v| (QREFELT % 62))
                                        (QREFELT % 63))
                              (QREFELT % 64))))))))) 

(DECLAIM (NOTINLINE |SparseMultivariateSkewPolynomial;|)) 

(DEFUN |SparseMultivariateSkewPolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G95 NIL) (#2=#:G94 NIL) (#3=#:G93 NIL) (#4=#:G92 NIL) (#5=#:G91 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|SparseMultivariateSkewPolynomial| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 89))
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
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #1#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #1#)
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
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
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
                                         (AND #2#
                                              (|HasCategory|
                                               (|IndexedExponents| |#2|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4# #3#)
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
                                        (LETT #5#
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
                                                         '(|CommutativeRing|)))
                                         #5#)
                                        (|HasSignature| |#2|
                                                        (LIST '|variable|
                                                              (LIST
                                                               (|devaluate|
                                                                |#2|)
                                                               '(|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariateSkewPolynomial|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 17179869184))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #1#)
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #1#)
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #1#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #1#
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|)) #1#) #3#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 549755813888))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|LinearlyExplicitOver| (|Integer|))) #1#
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #4#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 1099511627776))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasSignature| |#2|
                      (LIST '|variable|
                            (LIST
                             (LIST '|Union| (|devaluate| |#2|)
                                   (|devaluate| "failed"))
                             '(|Symbol|))))
      (QSETREFV % 18 (CONS (|dispatchFunction| |SKSMP;Delta;S%;2|) %))))
    (QSETREFV % 19 (|SparseUnivariatePolynomial| %))
    (QSETREFV % 20
              (|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| |#1| |#2|)))
    (QSETREFV % 24
              (SPADCALL (LIST #'|SparseMultivariateSkewPolynomial!0|)
                        (QREFELT % 23)))
    (QSETREFV % 26
              (|SparseUnivariateSkewPolynomial| % (QREFELT % 24)
                                                (CONS
                                                 #'|SparseMultivariateSkewPolynomial!1|
                                                 %)))
    (COND
     ((|testBitVector| |pv$| 17)
      (QSETREFV % 55 (CONS (|dispatchFunction| |SKSMP;exquo;2%U;7|) %))))
    %))) 

(DEFUN |SparseMultivariateSkewPolynomial| (&REST #1=#:G96)
  (SPROG NIL
         (PROG (#2=#:G97)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL NIL))
                     (HGET |$ConstructorCache|
                           '|SparseMultivariateSkewPolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariateSkewPolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariateSkewPolynomial|)))))))))) 

(DEFUN |SparseMultivariateSkewPolynomial!1| (|x| %) (|spadConstant| % 25)) 

(DEFUN |SparseMultivariateSkewPolynomial!0| (|x| $$) |x|) 

(MAKEPROP '|SparseMultivariateSkewPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseMultivariatePolynomial| 6 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (0 . |1|) (4 . |1|) (|NonNegativeInteger|) (8 . |monomial|)
              |SKSMP;D;Var%;1| (|Union| % '"failed") (|Symbol|)
              (15 . |variable|) (20 . |Delta|) '|Sup| '|Supp| (|Mapping| $$ $$)
              (|Automorphism| $$) (25 . |morphism|) '|id| (30 . |0|) '|Upol|
              (|Mapping| 6 6) (34 . |map|) (|Automorphism| 6) (40 . |elt|)
              (46 . |inv|) (51 . |morphism|) (|Boolean|) (57 . |ground?|)
              (62 . |retract|) (67 . *) (|Union| 7 '"failed")
              (73 . |mainVariable|) (|SparseUnivariatePolynomial| %)
              (78 . |univariate|) (|UnivariateSkewPolynomialCategoryOps| $$ 26)
              (84 . |times|) (92 . |multivariate|) |SKSMP;*;3%;5|
              (98 . |coerce|) |SKSMP;*;%R%;6| (103 . |exquo|)
              (109 . |totalDegree|) (114 . |leadingMonomial|) (119 . |0|)
              (123 . ~=) (129 . |exquo|) (135 . +) (141 . -) (147 . |exquo|)
              (|PositiveInteger|) |SKSMP;^;%Pi%;8| |SKSMP;^;%Nni%;9|
              (|OutputForm|) (153 . |coerce|) (158 . |coerce|) (163 . |coerce|)
              (168 . |sub|) (174 . |outputForm|) |SKSMP;coerce;%Of;10|
              (|String|) (|Record| (|:| |k| 69) (|:| |c| 6)) (|List| 67)
              (|IndexedExponents| 7) (|List| %) (|List| 69) (|List| 6)
              (|Union| 6 '#1="failed") (|Mapping| 69 69) (|List| 12) (|List| 7)
              (|Integer|) (|Record| (|:| |mat| 81) (|:| |vec| (|Vector| 77)))
              (|Matrix| %) (|Vector| %) (|Matrix| 77)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 77) (|Mapping| 6 69) (|Union| 83 '#1#)
              (|Union| 77 '#1#)
              (|Record| (|:| |mat| 88) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 180 |zero?| 186 |variables| 191 |unitNormal| 202
              |unitCanonical| 207 |unit?| 212 |totalDegreeSorted| 217
              |totalDegree| 223 |support| 234 |subtractIfCan| 239 |smaller?|
              245 |sample| 251 |rightRecip| 255 |rightPower| 260 |retractIfCan|
              272 |retract| 287 |reductum| 302 |reducedSystem| 307 |recip| 329
              |primitivePart| 334 |primitiveMonomials| 339 |pomopo!| 344
              |plenaryPower| 352 |opposite?| 358 |one?| 364 |numberOfMonomials|
              369 |monomials| 374 |monomial?| 379 |monomial| 384
              |minimumDegree| 404 |mapExponents| 409 |map| 415 |mainVariable|
              421 |listOfTerms| 426 |linearExtend| 431 |leftRecip| 437
              |leftPower| 442 |leadingTerm| 454 |leadingSupport| 459
              |leadingMonomial| 464 |leadingCoefficient| 469 |latex| 474
              |ground?| 479 |ground| 484 |fmecg| 489 |exquo| 497 |degree| 509
              |content| 526 |constructOrdered| 531 |construct| 536 |commutator|
              541 |coerce| 547 |coefficients| 572 |coefficient| 577
              |characteristic| 597 |binomThmExpt| 601 |associator| 608
              |associates?| 615 |antiCommutator| 621 |annihilate?| 627 ^ 633
              |Delta| 645 D 650 = 655 |1| 661 |0| 665 / 669 - 675 + 686 * 692)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(0 0 0 0 4 1 7 5 7 1 0 6 8 1 0 0 30 6 6 1 0 0
                                  0 30 7 1 1 0 0 0 0 0 14 24 5 5 27 12 5 0 0 28
                                  13 0 0 0 10 9 0 0 11 10 9 4 6 3 2 0 0 0))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| |EntireRing&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL NIL
                NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |AbelianMonoid&| NIL
                |MagmaWithUnit&| NIL |NonAssociativeSemiRng&| |SetWithZero&|
                NIL |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|EntireRing|)
                 (|Algebra| 83) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 83)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 83)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|LinearlyExplicitOver| 77)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 83 83) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|RightModule| 77) (|NonAssociativeRng|) (|RightModule| 83)
                 (|LeftModule| 83) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|AbelianMonoid|) (|Comparable|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 77) (|RetractableTo| 83) (|SetCategory|)
                 (|RetractableTo| 6) (|canonicalUnitNormal|)
                 (|CoercibleFrom| 77) (|CoercibleFrom| 83) (|noZeroDivisors|)
                 (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 59) (|BasicType|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 88
                                  '(0 0 0 10 0 6 0 11 3 0 0 0 7 12 13 1 7 15 16
                                    17 1 0 0 16 18 1 22 0 21 23 0 0 0 25 2 0 0
                                    27 0 28 2 29 6 0 6 30 1 29 0 0 31 2 22 0 21
                                    21 32 1 0 33 0 34 1 0 6 0 35 2 0 0 6 0 36 1
                                    0 37 0 38 2 5 39 0 7 40 4 41 26 26 26 22 21
                                    42 2 5 0 39 7 43 1 0 0 6 45 2 0 15 0 6 47 1
                                    0 12 0 48 1 0 0 0 49 0 6 0 50 2 0 33 0 0 51
                                    2 5 15 0 0 52 2 0 0 0 0 53 2 0 0 0 0 54 2 0
                                    15 0 0 55 1 6 59 0 60 1 16 59 0 61 1 7 59 0
                                    62 2 59 0 0 0 63 2 26 59 0 59 64 2 0 33 0 0
                                    51 1 41 33 0 1 1 0 76 0 1 2 0 76 0 0 1 1 35
                                    82 0 1 1 35 0 0 1 1 35 33 0 1 2 0 12 0 76 1
                                    2 0 12 0 76 1 1 0 12 0 48 1 0 71 0 1 2 40
                                    15 0 0 1 2 20 33 0 0 1 0 41 0 1 1 37 15 0 1
                                    2 0 0 0 56 1 2 37 0 0 12 1 1 0 73 0 1 1 9
                                    85 0 1 1 10 86 0 1 1 0 6 0 35 1 9 83 0 1 1
                                    10 77 0 1 1 15 0 0 1 2 29 78 79 80 1 1 29
                                    81 79 1 2 6 87 79 80 1 1 6 88 79 1 1 37 15
                                    0 1 1 19 0 0 1 1 5 70 0 1 4 0 0 0 6 69 0 1
                                    2 32 0 0 56 1 2 41 33 0 0 1 1 37 33 0 1 1 0
                                    12 0 1 1 0 70 0 1 1 0 33 0 1 2 0 0 6 69 1 3
                                    0 0 0 76 75 1 3 0 0 0 7 12 13 1 0 69 0 1 2
                                    0 0 74 0 1 2 0 0 27 0 28 1 0 37 0 38 1 0 68
                                    0 1 2 8 6 84 0 1 1 37 15 0 1 2 0 0 0 56 1 2
                                    37 0 0 12 1 1 15 67 0 1 1 15 69 0 1 1 15 0
                                    0 49 1 15 6 0 1 1 0 66 0 1 1 0 33 0 34 1 0
                                    6 0 1 4 6 0 0 69 6 0 1 2 35 15 0 0 55 2 4
                                    15 0 6 47 1 0 69 0 1 2 0 12 0 7 1 2 0 75 0
                                    76 1 1 19 6 0 1 1 15 0 68 1 1 0 0 68 1 2 38
                                    0 0 0 1 1 0 59 0 65 1 0 0 6 45 1 33 0 0 1 1
                                    36 0 77 1 1 18 0 83 1 1 0 72 0 1 2 0 6 0 69
                                    1 3 0 0 0 76 75 1 3 0 0 0 7 12 1 0 38 12 1
                                    3 34 0 0 0 12 1 3 38 0 0 0 0 1 2 35 33 0 0
                                    1 2 0 0 0 0 1 2 38 33 0 0 1 2 0 0 0 56 57 2
                                    37 0 0 12 58 1 31 0 16 18 1 0 0 7 14 2 0 33
                                    0 0 1 0 37 0 10 0 41 0 25 2 16 0 0 6 1 2 39
                                    0 0 0 54 1 39 0 0 1 2 0 0 0 0 53 2 0 0 56 0
                                    1 2 0 0 0 0 44 2 0 0 0 6 46 2 0 0 6 0 36 2
                                    29 0 0 77 1 2 39 0 77 0 1 2 41 0 12 0 1 2 1
                                    0 83 0 1 2 1 0 0 83 1)))))
           '|lookupComplete|)) 
