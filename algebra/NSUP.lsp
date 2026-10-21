
(MAKEPROP '|NSUP;rep| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NSUP;rep|
        ((|s| (%))
         (% (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R)))))
        |s|) 

(MAKEPROP '|NSUP;per| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |NSUP;per|
        ((|l| (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (% (%)))
        |l|) 

(MAKEPROP '|NSUP;coerce;%Sup;3| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;%Sup;3| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        |p|) 

(MAKEPROP '|NSUP;coerce;Sup%;4| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |NSUP;coerce;Sup%;4| ((|p| (|SparseUnivariatePolynomial| R)) (% (%)))
        |p|) 

(MAKEPROP '|NSUP;retractIfCan;%U;5| '|SPADreplace| '(XLAM (|p|) (CONS 0 |p|))) 

(SDEFUN |NSUP;retractIfCan;%U;5|
        ((|p| (%)) (% (|Union| (|SparseUnivariatePolynomial| R) "failed")))
        (CONS 0 |p|)) 

(SDEFUN |NSUP;monicModulo;3%;6| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|yy|
           #1=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|e| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|xx| #1#)
          (#2=#:G52 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in monicModulo$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in monicModulo$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (COND
                  ((NULL
                    (SPADCALL (QCDR (|SPADfirst| |yy|)) (|spadConstant| % 14)
                              (QREFELT % 15)))
                   (EXIT (|error| "in monicModulo$NSUP: not monic #2"))))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) |x|)
                        (#3#
                         (SEQ (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #2# 1)
                                           (GO #4=#:G46))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (|NSUP;per| (CDR |xx|) %)
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #2# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #2#))
                              (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyResidueClass;2%R;7|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |polnum| %) (|:| |polden| R)
                    (|:| |power| (|NonNegativeInteger|)))))
        (SPROG
         ((|yy|
           #1=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|co| (R)) (|e| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|xx| #1#)
          (|pow| (|NonNegativeInteger|)) (#2=#:G67 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyResidueClass$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyResidueClass$NSUP: ground? #2"))
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (EXIT
                  (COND ((NULL |xx|) (VECTOR |x| |co| 0))
                        (#3#
                         (SEQ (LETT |pow| 0)
                              (LETT |e| (QCAR (|SPADfirst| |yy|)))
                              (LETT |y| (|NSUP;per| (CDR |yy|) %))
                              (SEQ
                               (EXIT
                                (SEQ G190 NIL
                                     (SEQ
                                      (SEQ
                                       (LETT |u|
                                             (SPADCALL
                                              (QCAR (|SPADfirst| |xx|)) |e|
                                              (QREFELT % 18)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |u| 1)
                                          (PROGN
                                           (LETT #2# 1)
                                           (GO #4=#:G60))))))
                                      (LETT |xx|
                                            (|NSUP;rep|
                                             (SPADCALL
                                              (SPADCALL |co|
                                                        (|NSUP;per| (CDR |xx|)
                                                         %)
                                                        (QREFELT % 23))
                                              (QCDR |u|)
                                              (QCDR (|SPADfirst| |xx|)) |y|
                                              (QREFELT % 19))
                                             %))
                                      (LETT |pow| (+ |pow| 1))
                                      (EXIT
                                       (COND
                                        ((NULL |xx|)
                                         (PROGN (LETT #2# 1) (GO #4#))))))
                                     NIL (GO G190) G191 (EXIT NIL)))
                               #4# (EXIT #2#))
                              (EXIT
                               (VECTOR (|NSUP;per| |xx| %) |co|
                                       |pow|)))))))))))) 

(SDEFUN |NSUP;lazyPseudoRemainder;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|yy|
           #1=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|co| (R)) (|e| (|NonNegativeInteger|))
          (|u| (|Union| (|NonNegativeInteger|) "failed")) (|xx| #1#)
          (#2=#:G82 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoRemainder$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoRemainder$NSUP: ground? #2"))
           ((SPADCALL |x| (QREFELT % 13)) |x|)
           (#3='T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (EXIT
                  (COND
                   ((SPADCALL |co| (|spadConstant| % 14) (QREFELT % 15))
                    (SPADCALL |x| |y| (QREFELT % 20)))
                   ((SPADCALL |co|
                              (SPADCALL (|spadConstant| % 14) (QREFELT % 27))
                              (QREFELT % 15))
                    (SPADCALL
                     (SPADCALL (SPADCALL |x| (QREFELT % 28))
                               (SPADCALL |y| (QREFELT % 28)) (QREFELT % 20))
                     (QREFELT % 28)))
                   (#3#
                    (SEQ (LETT |xx| (|NSUP;rep| |x| %))
                         (LETT |e| (QCAR (|SPADfirst| |yy|)))
                         (LETT |y| (|NSUP;per| (CDR |yy|) %))
                         (SEQ
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ
                                 (SEQ
                                  (LETT |u|
                                        (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                                  (QREFELT % 18)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |u| 1)
                                     (PROGN (LETT #2# 1) (GO #4=#:G74))))))
                                 (LETT |xx|
                                       (|NSUP;rep|
                                        (SPADCALL
                                         (SPADCALL |co|
                                                   (|NSUP;per| (CDR |xx|) %)
                                                   (QREFELT % 23))
                                         (QCDR |u|) (QCDR (|SPADfirst| |xx|))
                                         |y| (QREFELT % 19))
                                        %))
                                 (EXIT
                                  (COND
                                   ((NULL |xx|)
                                    (PROGN (LETT #2# 1) (GO #4#))))))
                                NIL (GO G190) G191 (EXIT NIL)))
                          #4# (EXIT #2#))
                         (EXIT (|NSUP;per| |xx| %)))))))))))) 

(SDEFUN |NSUP;lazyPseudoDivide;2%R;9|
        ((|x| (%)) (|y| (%))
         (%
          (|Record| (|:| |coef| R) (|:| |gap| (|NonNegativeInteger|))
                    (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG
         ((|yy|
           #1=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|e| (|NonNegativeInteger|)) (|co| (R))
          (|u| (|Union| (|NonNegativeInteger|) #2="failed"))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|xx| #1#) (#3=#:G87 NIL) (|pow| (|NonNegativeInteger|))
          (#4=#:G99 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoDivide$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoDivide$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (VECTOR |co| 0 (|spadConstant| % 21) |x|))))
                 (LETT |pow|
                       (+
                        (PROG2
                            (LETT #3#
                                  (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                            (QREFELT % 18)))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|) #2#)
                                          #3#))
                        1))
                 (LETT |qq| NIL) (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #4# 1) (GO #5=#:G92))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (LETT |pow|
                               (PROG2
                                   (LETT #3# (SPADCALL |pow| 1 (QREFELT % 18)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0)
                                                 (|NonNegativeInteger|)
                                                 (|Union|
                                                  (|NonNegativeInteger|) #2#)
                                                 #3#)))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #4# 1) (GO #5#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #4#))
                 (EXIT
                  (VECTOR |co| |pow| (|NSUP;per| (REVERSE |qq|) %)
                          (|NSUP;per| |xx| %))))))))) 

(SDEFUN |NSUP;lazyPseudoQuotient;3%;10| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|yy|
           #1=(|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|e| (|NonNegativeInteger|)) (|co| (R))
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|qq|
           (|List| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
          (|xx| #1#) (#2=#:G114 NIL))
         (SEQ
          (COND
           ((SPADCALL |y| (QREFELT % 12))
            (|error| "in lazyPseudoQuotient$NSUP: division by 0"))
           ((SPADCALL |y| (QREFELT % 13))
            (|error| "in lazyPseudoQuotient$NSUP: ground? #2"))
           ('T
            (SEQ (LETT |yy| (|NSUP;rep| |y| %))
                 (LETT |e| (QCAR (|SPADfirst| |yy|)))
                 (LETT |xx| (|NSUP;rep| |x| %))
                 (COND
                  ((OR (NULL |xx|) (< (QCAR (|SPADfirst| |xx|)) |e|))
                   (EXIT (|spadConstant| % 21))))
                 (LETT |qq| NIL) (LETT |co| (QCDR (|SPADfirst| |yy|)))
                 (LETT |y| (|NSUP;per| (CDR |yy|) %))
                 (SEQ
                  (EXIT
                   (SEQ G190 NIL
                        (SEQ
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |xx|)) |e|
                                          (QREFELT % 18)))
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN (LETT #2# 1) (GO #3=#:G108))))))
                         (LETT |qq|
                               (CONS
                                (CONS (QCDR |u|) (QCDR (|SPADfirst| |xx|)))
                                (|NSUP;rep|
                                 (SPADCALL |co| (|NSUP;per| |qq| %)
                                           (QREFELT % 23))
                                 %)))
                         (LETT |xx|
                               (|NSUP;rep|
                                (SPADCALL
                                 (SPADCALL |co| (|NSUP;per| (CDR |xx|) %)
                                           (QREFELT % 23))
                                 (QCDR |u|) (QCDR (|SPADfirst| |xx|)) |y|
                                 (QREFELT % 19))
                                %))
                         (EXIT
                          (COND ((NULL |xx|) (PROGN (LETT #2# 1) (GO #3#))))))
                        NIL (GO G190) G191 (EXIT NIL)))
                  #3# (EXIT #2#))
                 (EXIT (|NSUP;per| (REVERSE |qq|) %)))))))) 

(SDEFUN |NSUP;subResultantGcd;3%;11| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 34))) 

(SDEFUN |NSUP;subResultantsChain;2%L;12| ((|p1| (%)) (|p2| (%)) (% (|List| %)))
        (SPADCALL |p1| |p2| (QREFELT % 37))) 

(SDEFUN |NSUP;lastSubResultant;3%;13| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 40))) 

(SDEFUN |NSUP;resultant;2%R;14| ((|p1| (%)) (|p2| (%)) (% (R)))
        (SPADCALL |p1| |p2| (QREFELT % 42))) 

(SDEFUN |NSUP;extendedResultant;2%R;15|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re|
           (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |resultant| R))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 45)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedResultant1;2%R;16|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 49)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedResultant2;2%R;17|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |resultant| R) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |resultant| R))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 53)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;extendedSubResultantGcd;2%R;18|
        ((|p1| (%)) (|p2| (%))
         (% (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))))
        (SPROG
         ((|re| (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |gcd| %))))
         (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 57)))
              (EXIT (VECTOR (QVELT |re| 2) (QVELT |re| 0) (QVELT |re| 1)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd1;2%R;19|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef1| %))))
        (SPROG ((|re| (|Record| (|:| |coef1| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 61)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(SDEFUN |NSUP;halfExtendedSubResultantGcd2;2%R;20|
        ((|p1| (%)) (|p2| (%)) (% (|Record| (|:| |gcd| %) (|:| |coef2| %))))
        (SPROG ((|re| (|Record| (|:| |coef2| %) (|:| |gcd| %))))
               (SEQ (LETT |re| (SPADCALL |p1| |p2| (QREFELT % 65)))
                    (EXIT (CONS (QCDR |re|) (QCAR |re|)))))) 

(DECLAIM (NOTINLINE |NewSparseUnivariatePolynomial;|)) 

(DEFUN |NewSparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G211 NIL) (#2=#:G210 NIL)
    (#3=#:G209 NIL) (#4=#:G208 NIL) (#5=#:G207 NIL) (#6=#:G206 NIL)
    (#7=#:G205 NIL) (#8=#:G203 NIL) (#9=#:G204 NIL) (#10=#:G202 NIL)
    (#11=#:G201 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|NewSparseUnivariatePolynomial| DV$1))
    (LETT % (GETREFV 124))
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
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #2#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #2#
                                            #3#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #2# #3#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #2#
                                         #3#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|Comparable|))
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
                                               (|NonNegativeInteger|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #4#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #5#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #6#)
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #2#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
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
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #7#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
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
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #8#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #8# #2#) (AND #8# #3#)
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
    (|haddProp| |$ConstructorCache| '|NewSparseUnivariatePolynomial|
                (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 562949953421312))
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #10#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 144115188075855872))
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
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #8# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 576460752303423488))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (QSETREFV % 35
                 (CONS (|dispatchFunction| |NSUP;subResultantGcd;3%;11|) %))
       (QSETREFV % 39
                 (CONS (|dispatchFunction| |NSUP;subResultantsChain;2%L;12|)
                       %))
       (QSETREFV % 41
                 (CONS (|dispatchFunction| |NSUP;lastSubResultant;3%;13|) %))
       (QSETREFV % 43 (CONS (|dispatchFunction| |NSUP;resultant;2%R;14|) %))
       (QSETREFV % 47
                 (CONS (|dispatchFunction| |NSUP;extendedResultant;2%R;15|) %))
       (QSETREFV % 51
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant1;2%R;16|) %))
       (QSETREFV % 55
                 (CONS
                  (|dispatchFunction| |NSUP;halfExtendedResultant2;2%R;17|) %))
       (QSETREFV % 59
                 (CONS
                  (|dispatchFunction| |NSUP;extendedSubResultantGcd;2%R;18|)
                  %))
       (QSETREFV % 63
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd1;2%R;19|)
                  %))
       (QSETREFV % 67
                 (CONS
                  (|dispatchFunction|
                   |NSUP;halfExtendedSubResultantGcd2;2%R;20|)
                  %)))))
    %))) 

(DEFUN |NewSparseUnivariatePolynomial| (#1=#:G212)
  (SPROG NIL
         (PROG (#2=#:G213)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewSparseUnivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NewSparseUnivariatePolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|NewSparseUnivariatePolynomial|)))))))))) 

(MAKEPROP '|NewSparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SparseUnivariatePolynomial| 6)
              (|local| |#1|) |NSUP;coerce;%Sup;3| |NSUP;coerce;Sup%;4|
              (|Union| 5 '"failed") |NSUP;retractIfCan;%U;5| (|Boolean|)
              (0 . |zero?|) (5 . |ground?|) (10 . |1|) (14 . =)
              (|Union| % '"failed") (|NonNegativeInteger|)
              (20 . |subtractIfCan|) (26 . |fmecg|) |NSUP;monicModulo;3%;6|
              (34 . |0|) (38 . |0|) (42 . *) (48 . |1|)
              (|Record| (|:| |polnum| %) (|:| |polden| 6) (|:| |power| 17))
              |NSUP;lazyResidueClass;2%R;7| (52 . -) (57 . -)
              |NSUP;lazyPseudoRemainder;3%;8|
              (|Record| (|:| |coef| 6) (|:| |gap| 17) (|:| |quotient| %)
                        (|:| |remainder| %))
              |NSUP;lazyPseudoDivide;2%R;9| |NSUP;lazyPseudoQuotient;3%;10|
              (|PseudoRemainderSequence| 6 $$) (62 . |subResultantGcd|)
              (68 . |subResultantGcd|) (|List| $$) (74 . |chainSubResultants|)
              (|List| %) (80 . |subResultantsChain|) (86 . |lastSubResultant|)
              (92 . |lastSubResultant|) (98 . |resultant|) (104 . |resultant|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |resultant| 6))
              (110 . |resultantEuclidean|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %) (|:| |coef2| %))
              (116 . |extendedResultant|)
              (|Record| (|:| |coef1| $$) (|:| |resultant| 6))
              (122 . |semiResultantEuclidean1|)
              (|Record| (|:| |resultant| 6) (|:| |coef1| %))
              (128 . |halfExtendedResultant1|)
              (|Record| (|:| |coef2| $$) (|:| |resultant| 6))
              (134 . |semiResultantEuclidean2|)
              (|Record| (|:| |resultant| 6) (|:| |coef2| %))
              (140 . |halfExtendedResultant2|)
              (|Record| (|:| |coef1| $$) (|:| |coef2| $$) (|:| |gcd| $$))
              (146 . |subResultantGcdEuclidean|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %) (|:| |coef2| %))
              (152 . |extendedSubResultantGcd|)
              (|Record| (|:| |coef1| $$) (|:| |gcd| $$))
              (158 . |semiSubResultantGcdEuclidean1|)
              (|Record| (|:| |gcd| %) (|:| |coef1| %))
              (164 . |halfExtendedSubResultantGcd1|)
              (|Record| (|:| |coef2| $$) (|:| |gcd| $$))
              (170 . |semiSubResultantGcdEuclidean2|)
              (|Record| (|:| |gcd| %) (|:| |coef2| %))
              (176 . |halfExtendedSubResultantGcd2|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Record| (|:| |k| 17) (|:| |c| 6))
              (|List| 71) (|Mapping| 6 6) (|List| 17) (|List| 6)
              (|Union| 6 '#1="failed") (|Mapping| 17 17) (|List| 79)
              (|SingletonAsOrderedSet|) (|Union| 79 '"failed")
              (|SparseUnivariatePolynomial| %) (|Union| 38 '#2="failed")
              (|Vector| 6) (|Union| 93 '#3="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 91) (|SingleInteger|)
              (|HashState|) (|Integer|)
              (|Record| (|:| |mat| 94) (|:| |vec| (|Vector| 91))) (|Vector| %)
              (|Matrix| 91) (|List| 96) (|Symbol|)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 91 %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 91) (|Mapping| 6 17) (|Fraction| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 103 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 38) (|:| |generator| %)) (|Factored| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 102 '"failed")
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 114 '#3#) (|List| 81) (|Factored| 81) (|Union| 100 '#1#)
              (|Union| 91 '#1#) (|Matrix| 6)
              (|Record| (|:| |mat| 118) (|:| |vec| 83))
              (|Record| (|:| |var| 79) (|:| |exponent| 17)) (|Union| 120 '#2#)
              (|Equation| %) (|List| 122))
           '#(~= 182 |zero?| 188 |vectorise| 193 |variables| 199 |unvectorise|
              210 |unmakeSUP| 215 |univariate| 220 |unitNormal| 231
              |unitCanonical| 236 |unit?| 241 |totalDegreeSorted| 246
              |totalDegree| 252 |support| 263 |subtractIfCan| 268
              |subResultantsChain| 274 |subResultantGcd| 280
              |squareFreePolynomial| 286 |squareFreePart| 291 |squareFree| 296
              |solveLinearPolynomialEquation| 301 |smaller?| 307 |sizeLess?|
              313 |shiftRight| 319 |shiftLeft| 325 |separate| 331 |sample| 337
              |rightRecip| 341 |rightPower| 346 |retractIfCan| 358 |retract|
              383 |resultant| 408 |rem| 421 |reductum| 427 |reducedSystem| 432
              |recip| 454 |quo| 459 |pseudoRemainder| 465 |pseudoQuotient| 471
              |pseudoDivide| 477 |principalIdeal| 483 |primitivePart| 488
              |primitiveMonomials| 499 |prime?| 504 |pomopo!| 509
              |plenaryPower| 517 |patternMatch| 523 |order| 537 |opposite?| 543
              |one?| 549 |numberOfMonomials| 554 |nextItem| 559 |multivariate|
              564 |multiplyExponents| 576 |multiEuclidean| 582 |monomials| 588
              |monomial?| 593 |monomial| 598 |monicModulo| 618 |monicDivide|
              624 |minimumDegree| 637 |mapExponents| 654 |map| 660 |makeSUP|
              666 |mainVariable| 671 |listOfTerms| 676 |linearExtend| 681
              |leftRecip| 687 |leftPower| 692 |leadingTerm| 704
              |leadingSupport| 709 |leadingMonomial| 714 |leadingCoefficient|
              719 |lcmCoef| 724 |lcm| 730 |lazyResidueClass| 741
              |lazyPseudoRemainder| 747 |lazyPseudoQuotient| 753
              |lazyPseudoDivide| 759 |latex| 765 |lastSubResultant| 770
              |karatsubaDivide| 776 |isTimes| 782 |isPlus| 787 |isExpt| 792
              |integrate| 797 |init| 802 |hashUpdate!| 806 |hash| 812
              |halfExtendedSubResultantGcd2| 817 |halfExtendedSubResultantGcd1|
              823 |halfExtendedResultant2| 829 |halfExtendedResultant1| 835
              |ground?| 841 |ground| 846 |gcdPolynomial| 851 |gcd| 857 |fmecg|
              868 |factorSquareFreePolynomial| 876 |factorPolynomial| 881
              |factor| 886 |extendedSubResultantGcd| 891 |extendedResultant|
              897 |extendedEuclidean| 903 |exquo| 916 |expressIdealMember| 928
              |eval| 934 |euclideanSize| 988 |elt| 993 |divideExponents| 1023
              |divide| 1029 |discriminant| 1035 |differentiate| 1046 |degree|
              1129 |convert| 1146 |content| 1161 |constructOrdered| 1172
              |construct| 1177 |conditionP| 1182 |composite| 1187 |commutator|
              1199 |coerce| 1205 |coefficients| 1245 |coefficient| 1250
              |charthRoot| 1270 |characteristic| 1275 |binomThmExpt| 1279
              |associator| 1286 |associates?| 1293 |antiCommutator| 1299
              |annihilate?| 1305 ^ 1311 D 1323 = 1399 |1| 1405 |0| 1409 / 1413
              - 1419 + 1430 * 1436)
           'NIL
           (CONS
            (|makeByteWordVec2| 49
                                '(0 0 15 11 0 15 11 0 19 0 23 4 18 22 4 26 20
                                  24 4 22 1 27 27 24 14 22 1 0 24 4 5 1 0 0 42
                                  4 4 1 0 0 0 27 42 1 1 0 0 0 0 0 16 14 14 49
                                  14 48 9 0 0 25 45 34 32 10 0 0 0 24 14 14 13
                                  7 6 0 0 0 21 17 24 15 14 14 12 38 36 8 7 6 4
                                  3 2 0 0 0 0 0 0 0 0 0 0))
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
                |RetractableTo&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL NIL NIL |InnerEvalable&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 17 79) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 17 79)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 17) (|GcdDomain|)
                 (|AbelianMonoidRing| 6 17) (|IntegralDomain|)
                 (|DifferentialExtension| 6) (|LeftOreRing|)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 96) (|EntireRing|) (|Algebra| $$)
                 (|PartialDifferentialRing| 79) (|Algebra| 6) (|Algebra| 100)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 100)
                 (|FreeModuleCategory| 6 17) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 100)
                 (|IndexedDirectProductCategory| 6 17) (|SemiRng|)
                 (|LinearlyExplicitOver| 91) (|LinearlyExplicitOver| 6)
                 (|NonAssociativeRing|) (|BiModule| 100 100) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 17)
                 (|NonAssociativeRng|) (|RightModule| 91) (|RightModule| 100)
                 (|LeftModule| 100) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|StepThrough|)
                 (|SetWithZero|) (|PatternMatchable| 91)
                 (|PatternMatchable| (|Float|)) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|CommutativeStar|) (|RetractableTo| 79) (|Evalable| $$)
                 (|Hashable|) (|RetractableTo| 91) (|RetractableTo| 100)
                 (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| (|SparseUnivariatePolynomial| 6))
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|additiveValuation|) (|CoercibleFrom| 79)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 86)
                 (|ConvertibleTo| 88) (|ConvertibleTo| 87)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 91)
                 (|CoercibleFrom| 100) (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 69) (|BasicType|)
                 (|CoercibleFrom| 6) (|InnerEvalable| 79 6)
                 (|InnerEvalable| 79 $$) (|VariablesCommuteWithCoefficients|)
                 (|Eltable| 6 6) (|Eltable| $$ $$)
                 (|CoercibleTo| (|SparseUnivariatePolynomial| 6))
                 (|CoercibleFrom| (|SparseUnivariatePolynomial| 6)))
              (|makeByteWordVec2| 123
                                  '(1 0 11 0 12 1 0 11 0 13 0 6 0 14 2 6 11 0 0
                                    15 2 17 16 0 0 18 4 0 0 0 17 6 0 19 0 0 0
                                    21 0 6 0 22 2 0 0 6 0 23 0 0 0 24 1 6 0 0
                                    27 1 0 0 0 28 2 33 2 2 2 34 2 0 0 0 0 35 2
                                    33 36 2 2 37 2 0 38 0 0 39 2 33 2 2 2 40 2
                                    0 0 0 0 41 2 33 6 2 2 42 2 0 6 0 0 43 2 33
                                    44 2 2 45 2 0 46 0 0 47 2 33 48 2 2 49 2 0
                                    50 0 0 51 2 33 52 2 2 53 2 0 54 0 0 55 2 33
                                    56 2 2 57 2 0 58 0 0 59 2 33 60 2 2 61 2 0
                                    62 0 0 63 2 33 64 2 2 65 2 0 66 0 0 67 2 0
                                    11 0 0 1 1 58 11 0 12 2 0 83 0 17 1 1 0 78
                                    0 1 2 0 78 0 0 1 1 0 0 83 1 1 0 0 5 1 2 0
                                    81 0 79 1 1 0 5 0 1 1 52 99 0 1 1 52 0 0 1
                                    1 52 11 0 1 2 0 17 0 78 1 2 0 17 0 78 1 1 0
                                    17 0 1 1 0 74 0 1 2 59 16 0 0 1 2 21 38 0 0
                                    39 2 21 0 0 0 35 1 11 115 81 1 1 18 0 0 1 1
                                    18 108 0 1 2 11 113 114 81 1 2 30 11 0 0 1
                                    2 15 11 0 0 1 2 4 0 0 17 1 2 0 0 0 17 1 2
                                    18 109 0 0 1 0 58 0 1 1 56 16 0 1 2 0 0 0
                                    70 1 2 56 0 0 17 1 1 0 76 0 1 1 0 9 0 10 1
                                    6 116 0 1 1 7 117 0 1 1 14 80 0 1 1 0 6 0 1
                                    1 0 5 0 1 1 6 100 0 1 1 7 91 0 1 1 14 79 0
                                    1 3 5 0 0 0 79 1 2 5 6 0 0 43 2 15 0 0 0 1
                                    1 28 0 0 1 2 41 92 85 93 1 1 41 94 85 1 1 4
                                    118 85 1 2 4 119 85 93 1 1 56 16 0 1 2 15 0
                                    0 0 1 2 4 0 0 0 1 2 21 0 0 0 1 2 21 112 0 0
                                    1 1 15 107 38 1 1 18 0 0 1 2 18 0 0 79 1 1
                                    14 38 0 1 1 11 11 0 1 4 0 0 0 6 17 0 1 2 53
                                    0 0 70 1 3 31 97 0 87 97 1 3 33 98 0 88 98
                                    1 2 21 17 0 0 1 2 58 11 0 0 1 1 56 11 0 1 1
                                    0 17 0 1 1 25 16 0 1 2 0 0 5 79 1 2 0 0 81
                                    79 1 2 0 0 0 17 1 2 15 82 38 0 1 1 0 38 0 1
                                    1 0 11 0 1 2 0 0 6 17 1 3 0 0 0 78 74 1 3 0
                                    0 0 79 17 1 2 0 0 0 0 20 3 4 106 0 0 79 1 2
                                    4 106 0 0 1 1 0 17 0 1 2 0 17 0 79 1 2 0 74
                                    0 78 1 2 0 0 77 0 1 2 0 0 73 0 1 1 0 5 0 1
                                    1 0 80 0 1 1 0 72 0 1 2 5 6 101 0 1 1 56 16
                                    0 1 2 0 0 0 70 1 2 56 0 0 17 1 1 28 71 0 1
                                    1 28 17 0 1 1 28 0 0 1 1 28 6 0 1 2 18 110
                                    0 0 1 1 18 0 38 1 2 18 0 0 0 1 2 0 25 0 0
                                    26 2 0 0 0 0 29 2 0 0 0 0 32 2 0 30 0 0 31
                                    1 0 68 0 1 2 21 0 0 0 41 2 4 106 0 17 1 1
                                    14 82 0 1 1 0 82 0 1 1 14 121 0 1 1 1 0 0 1
                                    0 25 0 1 2 13 90 90 0 1 1 13 89 0 1 2 21 66
                                    0 0 67 2 21 62 0 0 63 2 21 54 0 0 55 2 21
                                    50 0 0 51 1 0 11 0 13 1 0 6 0 1 2 18 81 81
                                    81 1 1 18 0 38 1 2 18 0 0 0 1 4 4 0 0 17 6
                                    0 19 1 11 115 81 1 1 11 115 81 1 1 11 108 0
                                    1 2 21 58 0 0 59 2 21 46 0 0 47 3 15 104 0
                                    0 0 1 2 15 105 0 0 1 2 52 16 0 0 1 2 17 16
                                    0 6 1 2 15 82 38 0 1 3 0 0 0 79 6 1 3 0 0 0
                                    79 0 1 3 0 0 0 78 75 1 3 0 0 0 78 38 1 2 14
                                    0 0 122 1 2 14 0 0 123 1 3 14 0 0 38 38 1 3
                                    14 0 0 0 0 1 1 15 17 0 1 2 0 6 0 6 1 2 0 0
                                    0 0 1 2 15 6 102 6 1 2 21 102 102 102 1 2
                                    21 102 0 102 1 2 0 16 0 17 1 2 15 106 0 0 1
                                    2 5 0 0 79 1 1 5 6 0 1 2 39 0 0 95 1 2 39 0
                                    0 96 1 3 39 0 0 95 74 1 3 39 0 0 96 17 1 3
                                    4 0 0 78 74 1 2 4 0 0 78 1 3 4 0 0 79 17 1
                                    2 4 0 0 79 1 3 4 0 0 73 0 1 2 4 0 0 73 1 3
                                    4 0 0 73 17 1 2 4 0 0 17 1 1 4 0 0 1 1 0 17
                                    0 1 2 0 74 0 78 1 2 0 17 0 79 1 1 12 86 0 1
                                    1 35 87 0 1 1 37 88 0 1 1 18 6 0 1 2 18 0 0
                                    79 1 1 28 0 72 1 1 0 0 72 1 1 51 84 85 1 2
                                    21 111 102 0 1 2 21 16 0 0 1 2 57 0 0 0 1 1
                                    0 69 0 1 1 0 0 6 1 1 0 5 0 7 1 0 0 5 8 1 54
                                    0 0 1 1 55 0 91 1 1 29 0 100 1 1 14 0 79 1
                                    1 0 75 0 1 2 0 6 0 17 1 3 0 0 0 78 74 1 3 0
                                    0 0 79 17 1 1 51 16 0 1 0 57 17 1 3 50 0 0
                                    0 17 1 3 57 0 0 0 0 1 2 52 11 0 0 1 2 0 0 0
                                    0 1 2 57 11 0 0 1 2 0 0 0 70 1 2 56 0 0 17
                                    1 2 39 0 0 95 1 2 39 0 0 96 1 3 39 0 0 95
                                    74 1 3 39 0 0 96 17 1 3 4 0 0 78 74 1 2 4 0
                                    0 78 1 3 4 0 0 79 17 1 2 4 0 0 79 1 2 4 0 0
                                    73 1 3 4 0 0 73 17 1 2 4 0 0 17 1 1 4 0 0 1
                                    2 0 11 0 0 1 0 56 0 24 0 58 0 21 2 15 0 0 6
                                    1 1 60 0 0 28 2 60 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 70 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 6 0
                                    23 2 41 0 0 91 1 2 60 0 91 0 1 2 58 0 17 0
                                    1 2 1 0 100 0 1 2 1 0 0 100 1)))))
           '|lookupComplete|)) 
