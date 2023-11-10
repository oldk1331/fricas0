
(SDEFUN |MODMON;setPoly;2Rep;1| ((|mon| (|Rep|)) (% (|Rep|)))
        (SPROG
         ((#1=#:G470 NIL) (|i| NIL) (#2=#:G458 NIL) (|copymon| (|Rep|))
          (|oldm| (|Rep|)))
         (SEQ
          (COND ((SPADCALL |mon| (QREFELT % 12) (QREFELT % 25)) |mon|)
                (#3='T
                 (SEQ (LETT |oldm| (QREFELT % 12))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |mon| (QREFELT % 26))
                                   (|spadConstant| % 9) (QREFELT % 27))
                         (|error| "polynomial must be monic"))
                        (#3#
                         (SEQ (LETT |copymon| (|spadConstant| % 18))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (NULL (SPADCALL |mon| (QREFELT % 28))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |copymon|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |mon| (QREFELT % 26))
                                            (SPADCALL |mon| (QREFELT % 29))
                                            (QREFELT % 11))
                                           |copymon| (QREFELT % 30)))
                                    (EXIT
                                     (LETT |mon|
                                           (SPADCALL |mon| (QREFELT % 31)))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (SETELT % 12 |copymon|)
                              (SETELT % 14
                                      (SPADCALL (QREFELT % 12) (QREFELT % 13)))
                              (SETELT % 15
                                      (PROG1 (LETT #2# (- (QREFELT % 14) 1))
                                        (|check_subtype2| (>= #2# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #2#)))
                              (SETELT % 16 (+ (* 2 (QREFELT % 15)) 1))
                              (SETELT % 22 (SPADCALL (QREFELT % 33)))
                              (COND
                               ((QREFELT % 17)
                                (SEQ
                                 (COND
                                  ((> (SPADCALL |oldm| (QREFELT % 29)) 1)
                                   (COND
                                    ((NULL
                                      (QEQCAR
                                       (SPADCALL |oldm| (QREFELT % 12)
                                                 (QREFELT % 35))
                                       1))
                                     (EXIT
                                      (SEQ (LETT |i| 1)
                                           (LETT #1# (QREFELT % 15)) G190
                                           (COND
                                            ((|greater_SI| |i| #1#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SPADCALL (QREFELT % 23) |i|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 23) |i|
                                                          (QREFELT % 37))
                                                         (QREFELT % 38))
                                                        (QREFELT % 39))
                                                       (QREFELT % 40))))
                                           (LETT |i| (|inc_SI| |i|)) (GO G190)
                                           G191 (EXIT NIL)))))))
                                 (EXIT
                                  (SETELT % 23
                                          (|MODMON;computeFrobeniusPowers|
                                           %))))))
                              (EXIT (QREFELT % 12)))))))))))) 

(SDEFUN |MODMON;modulus;Rep;2| ((% (|Rep|))) (QREFELT % 12)) 

(SDEFUN |MODMON;size;Nni;3| ((% (|NonNegativeInteger|)))
        (* (QREFELT % 14) (SPADCALL (QREFELT % 43)))) 

(SDEFUN |MODMON;random;%;4| ((% (%)))
        (SPROG ((#1=#:G477 NIL) (|i| NIL) (#2=#:G476 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 15))))
                  (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (EXIT (SETELT #2# |i| (SPADCALL (QREFELT % 45)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  #2#)
                 (QREFELT % 47))))) 

(SDEFUN |MODMON;Zero;%;5| ((% (%))) (|spadConstant| % 49)) 

(SDEFUN |MODMON;One;%;6| ((% (%))) (|spadConstant| % 50)) 

(SDEFUN |MODMON;*;R2%;7| ((|c| (R)) (|x| (%)) (% (%)))
        (SPADCALL |c| |x| (QREFELT % 51))) 

(SDEFUN |MODMON;*;I2%;8| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPADCALL (SPADCALL |n| (QREFELT % 53)) |x| (QREFELT % 51))) 

(SDEFUN |MODMON;coerce;R%;9| ((|c| (R)) (% (%)))
        (SPADCALL |c| 0 (QREFELT % 11))) 

(SDEFUN |MODMON;coerce;%Of;10| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 57))) 

(SDEFUN |MODMON;coefficient;%NniR;11|
        ((|x| (%)) (|e| (|NonNegativeInteger|)) (% (R)))
        (SPADCALL |x| |e| (QREFELT % 59))) 

(SDEFUN |MODMON;reductum;2%;12| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 61))) 

(SDEFUN |MODMON;leadingCoefficient;%R;13| ((|x| (%)) (% (R)))
        (SPADCALL |x| (QREFELT % 62))) 

(SDEFUN |MODMON;degree;%Nni;14| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 13))) 

(PUT '|MODMON;lift;%Rep;15| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MODMON;lift;%Rep;15| ((|x| (%)) (% (|Rep|))) |x|) 

(SDEFUN |MODMON;reduce;Rep%;16| ((|p| (|Rep|)) (% (%)))
        (QCDR (SPADCALL |p| (QREFELT % 12) (QREFELT % 64)))) 

(SDEFUN |MODMON;coerce;Rep%;17| ((|p| (|Rep|)) (% (%)))
        (SPADCALL |p| (QREFELT % 39))) 

(SDEFUN |MODMON;=;2%B;18| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 25))) 

(SDEFUN |MODMON;+;3%;19| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 67))) 

(SDEFUN |MODMON;-;2%;20| ((|x| (%)) (% (%))) (SPADCALL |x| (QREFELT % 68))) 

(SDEFUN |MODMON;*;3%;21| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|p| (|Rep|)) (|ans| (%)) (|n| (|Integer|)))
               (SEQ (LETT |p| (SPADCALL |x| |y| (QREFELT % 70)))
                    (LETT |ans| (|spadConstant| % 49))
                    (SEQ G190
                         (COND
                          ((NULL
                            (> (LETT |n| (SPADCALL |p| (QREFELT % 29)))
                               (QREFELT % 15)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL |p| (QREFELT % 26))
                                           (SPADCALL (QREFELT % 22)
                                                     (- |n| (QREFELT % 14))
                                                     (QREFELT % 37))
                                           (QREFELT % 52))
                                          (QREFELT % 30)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 31)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |ans| |p| (QREFELT % 30)))))) 

(SDEFUN |MODMON;Vectorise;%V;22| ((|x| (%)) (% (|Vector| R)))
        (SPROG ((#1=#:G504 NIL) (|i| NIL) (#2=#:G503 NIL))
               (SEQ
                (PROGN
                 (LETT #2# (GETREFV (|inc_SI| #3=(QREFELT % 15))))
                 (SEQ (LETT |i| 0) (LETT #1# #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# |i|
                                (SPADCALL (SPADCALL |x| (QREFELT % 38)) |i|
                                          (QREFELT % 60)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #2#)))) 

(SDEFUN |MODMON;UnVectorise;V%;23| ((|vect| (|Vector| R)) (% (%)))
        (SPROG
         ((#1=#:G506 NIL) (#2=#:G505 (|Rep|)) (#3=#:G507 (|Rep|))
          (#4=#:G509 NIL) (|i| NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| 0) (LETT #4# (QREFELT % 15)) G190
                 (COND ((|greater_SI| |i| #4#) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL (SPADCALL |vect| (+ |i| 1) (QREFELT % 73))
                                    |i| (QREFELT % 74)))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 30))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| % 18))))
           (QREFELT % 39))))) 

(SDEFUN |MODMON;computePowers;Pa;24| ((% (|PrimitiveArray| %)))
        (SPROG
         ((#1=#:G515 NIL) (|i| NIL) (|w| (%)) (|mat| (|PrimitiveArray| %)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT % 14) (|spadConstant| % 18) (QREFELT % 21)))
          (SPADCALL |mat| 0
                    (SPADCALL (SPADCALL (QREFELT % 12) (QREFELT % 69))
                              (QREFELT % 61))
                    (QREFELT % 40))
          (LETT |w| (SPADCALL (|spadConstant| % 9) 1 (QREFELT % 11)))
          (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 15)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (SPADCALL |mat| |i|
                          (SPADCALL |w|
                                    (SPADCALL |mat| (- |i| 1) (QREFELT % 37))
                                    (QREFELT % 70))
                          (QREFELT % 40))
                (EXIT
                 (COND
                  ((EQL
                    (SPADCALL (SPADCALL |mat| |i| (QREFELT % 37))
                              (QREFELT % 29))
                    (QREFELT % 14))
                   (SPADCALL |mat| |i|
                             (SPADCALL
                              (SPADCALL (SPADCALL |mat| |i| (QREFELT % 37))
                                        (QREFELT % 31))
                              (SPADCALL
                               (SPADCALL (SPADCALL |mat| |i| (QREFELT % 37))
                                         (QREFELT % 26))
                               (SPADCALL |mat| 0 (QREFELT % 37))
                               (QREFELT % 52))
                              (QREFELT % 30))
                             (QREFELT % 40))))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;computeFrobeniusPowers| ((% (|PrimitiveArray| %)))
        (SPROG
         ((#1=#:G520 NIL) (|i| NIL) (|mult| (%)) (|mat| (|PrimitiveArray| %)))
         (SEQ
          (LETT |mat|
                (SPADCALL (QREFELT % 14) (|spadConstant| % 8) (QREFELT % 21)))
          (SPADCALL |mat| 1
                    (LETT |mult|
                          (SPADCALL (|spadConstant| % 9)
                                    (SPADCALL (QREFELT % 43)) (QREFELT % 74)))
                    (QREFELT % 40))
          (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 15)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |mat| |i|
                           (SPADCALL |mult|
                                     (SPADCALL |mat| (- |i| 1) (QREFELT % 37))
                                     (QREFELT % 71))
                           (QREFELT % 40))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |mat|)))) 

(SDEFUN |MODMON;frobenius;2%;26| ((|a| (%)) (% (%)))
        (SPROG ((|aq| (%)))
               (SEQ (LETT |aq| (|spadConstant| % 18))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |a| (|spadConstant| % 18)
                                      (QREFELT % 75)))
                           (GO G191)))
                         (SEQ
                          (LETT |aq|
                                (SPADCALL |aq|
                                          (SPADCALL
                                           (SPADCALL |a| (QREFELT % 26))
                                           (SPADCALL (QREFELT % 23)
                                                     (SPADCALL |a|
                                                               (QREFELT % 29))
                                                     (QREFELT % 37))
                                           (QREFELT % 52))
                                          (QREFELT % 30)))
                          (EXIT (LETT |a| (SPADCALL |a| (QREFELT % 31)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |aq|)))) 

(SDEFUN |MODMON;pow;Pa;27| ((% (|PrimitiveArray| %))) (QREFELT % 22)) 

(SDEFUN |MODMON;monomial;RNni%;28|
        ((|c| (R)) (|e| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|k2| (|NonNegativeInteger|)) (#1=#:G527 NIL)
          (|k1| (|NonNegativeInteger|)))
         (SEQ
          (COND ((< |e| (QREFELT % 14)) (SPADCALL |c| |e| (QREFELT % 11)))
                ((<= |e| (QREFELT % 16))
                 (SPADCALL |c|
                           (SPADCALL (QREFELT % 22) (- |e| (QREFELT % 14))
                                     (QREFELT % 37))
                           (QREFELT % 52)))
                ('T
                 (SEQ (LETT |k1| (QUOTIENT2 |e| (QREFELT % 16)))
                      (LETT |k2|
                            (PROG1 (LETT #1# (- |e| (* |k1| (QREFELT % 16))))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 22) (QREFELT % 15)
                                    (QREFELT % 37))
                          |k1| (QREFELT % 78))
                         (SPADCALL |c| |k2| (QREFELT % 74)) (QREFELT % 71))
                        (QREFELT % 39))))))))) 

(SDEFUN |MODMON;exquo;2%U;29| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG
         ((#1=#:G539 NIL)
          (|uv| (|Union| (|Record| (|:| |coef1| %) (|:| |coef2| %)) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (LETT |uv|
                  (SPADCALL |y| (SPADCALL (QREFELT % 42)) |x| (QREFELT % 81)))
            (EXIT
             (COND ((QEQCAR |uv| 1) (CONS 1 "failed"))
                   ('T
                    (PROGN
                     (LETT #1#
                           (CONS 0
                                 (SPADCALL (QCAR (QCDR |uv|)) (QREFELT % 39))))
                     (GO #2=#:G538)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |MODMON;recip;%U;30| ((|y| (%)) (% (|Union| % "failed")))
        (SPADCALL (|spadConstant| % 8) |y| (QREFELT % 82))) 

(SDEFUN |MODMON;divide;2%R;31|
        ((|x| (%)) (|y| (%))
         (% (|Record| (|:| |quotient| %) (|:| |remainder| %))))
        (SPROG ((|q| (|Union| % "failed")))
               (SEQ (LETT |q| (SPADCALL |x| |y| (QREFELT % 82)))
                    (EXIT
                     (COND ((QEQCAR |q| 1) (|error| "not divisible"))
                           ('T (CONS (QCDR |q|) (|spadConstant| % 18)))))))) 

(DECLAIM (NOTINLINE |ModMonic;|)) 

(DEFUN |ModMonic| (|#1| |#2|)
  (SPROG
   ((#1=#:G453 NIL) (#2=#:G596 NIL) (|pv$| NIL) (#3=#:G591 NIL) (#4=#:G592 NIL)
    (#5=#:G593 NIL) (#6=#:G594 NIL) (#7=#:G595 NIL) (% NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|ModMonic| DV$1 DV$2))
    (LETT % (GETREFV 137))
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
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #7#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #7#)
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #7#
                                         #6#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR (|HasCategory| |#1| '(|Field|)) #7#
                                            #6#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #7# #6#)
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo| (|InputForm|))))
                                         (|HasCategory| |#1| '(|Finite|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (OR (|HasCategory| |#1| '(|Finite|))
                                            (AND
                                             (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory|
                                              (|SingletonAsOrderedSet|)
                                              '(|Hashable|))))
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
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Float|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Float|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|PatternMatchable| (|Integer|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Float|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Float|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo|
                                            (|Pattern| (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (AND #5#
                                             (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #4#
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
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|FiniteFieldCategory|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #7# #6#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #5#)
                                         (AND #5#
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #5#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #5#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #5#
                                              (|HasCategory| |#1| '(|Field|)))
                                         (AND #5# #3#) (AND #5# #7#)
                                         (AND #5# #6#)
                                         (AND #5#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         (AND #5#
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #7#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #6#
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
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|)))))
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #3#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #7#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #6#
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
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Ring|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|)))))
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #7#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #6#
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #7#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #6#
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
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #3#
                                         #7# #6#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 562949953421312))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 1125899906842624))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #2#)
         (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #7# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #7# (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #5# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #5# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #4#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #5# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #6# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 1152921504606846976))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 12 (SPADCALL (|spadConstant| % 9) 1 (QREFELT % 11)))
    (QSETREFV % 14 (SPADCALL (QREFELT % 12) (QREFELT % 13)))
    (QSETREFV % 15
              (PROG1 (LETT #1# (- (QREFELT % 14) 1))
                (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #1#)))
    (QSETREFV % 16 (+ (* 2 (QREFELT % 15)) 1))
    (QSETREFV % 17 (|HasCategory| |#1| '(|FiniteFieldCategory|)))
    (QSETREFV % 22 (SPADCALL 0 (|spadConstant| % 18) (QREFELT % 21)))
    (QSETREFV % 23 (SPADCALL 0 (|spadConstant| % 18) (QREFELT % 21)))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV % 44 (CONS (|dispatchFunction| |MODMON;size;Nni;3|) %))
       (QSETREFV % 48 (CONS (|dispatchFunction| |MODMON;random;%;4|) %)))))
    (COND
     ((QREFELT % 17)
      (PROGN
       (QSETREFV % 76
                 (CONS (|dispatchFunction| |MODMON;frobenius;2%;26|) %)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (PROGN
       (QSETREFV % 82 (CONS (|dispatchFunction| |MODMON;exquo;2%U;29|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |MODMON;recip;%U;30|) %))
       (QSETREFV % 84 (CONS (|dispatchFunction| |MODMON;divide;2%R;31|) %)))))
    %))) 

(MAKEPROP '|ModMonic| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |MODMON;One;%;6|) %))
              (0 . |One|) (|NonNegativeInteger|) (4 . |monomial|) '|m|
              (10 . |degree|) '|d| '|d1| '|twod| '|frobenius?|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |MODMON;Zero;%;5|) %))
              (15 . |Zero|) (|PrimitiveArray| $$) (19 . |new|) '|power|
              '|frobeniusPower| (|Boolean|) (25 . =)
              |MODMON;leadingCoefficient;%R;13| (31 . ~=) (37 . |zero?|)
              |MODMON;degree;%Nni;14| |MODMON;+;3%;19| |MODMON;reductum;2%;12|
              (|PrimitiveArray| %) |MODMON;computePowers;Pa;24|
              (|Union| % '"failed") (42 . |exquo|) (|Integer|) (48 . |elt|)
              |MODMON;lift;%Rep;15| |MODMON;reduce;Rep%;16| (54 . |setelt!|)
              |MODMON;setPoly;2Rep;1| |MODMON;modulus;Rep;2| (61 . |size|)
              (65 . |size|) (69 . |random|) (|Vector| 6)
              |MODMON;UnVectorise;V%;23| (73 . |random|) (77 . |Zero|)
              (81 . |One|) (85 . *) |MODMON;*;R2%;7| (91 . |coerce|)
              |MODMON;*;I2%;8| |MODMON;coerce;R%;9| (|OutputForm|)
              (96 . |coerce|) |MODMON;coerce;%Of;10| (101 . |coefficient|)
              |MODMON;coefficient;%NniR;11| (107 . |reductum|)
              (112 . |leadingCoefficient|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (117 . |monicDivide|) |MODMON;coerce;Rep%;17| |MODMON;=;2%B;18|
              (123 . +) (129 . -) |MODMON;-;2%;20| (134 . *) |MODMON;*;3%;21|
              |MODMON;Vectorise;%V;22| (140 . |elt|) |MODMON;monomial;RNni%;28|
              (146 . ~=) (152 . |frobenius|) |MODMON;pow;Pa;27| (157 . ^)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 79 '"failed")
              (163 . |extendedEuclidean|) (170 . |exquo|) (176 . |recip|)
              (181 . |divide|) (|Union| 90 '#1="failed") (|Matrix| %)
              (|Pattern| (|Float|)) (|Pattern| 36)
              (|Record| (|:| |mat| 91) (|:| |vec| (|Vector| 36))) (|Vector| %)
              (|Matrix| 36) (|Symbol|) (|List| 92) (|List| 10)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 36 %)
              (|PositiveInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|InputForm|) (|Fraction| 36) (|SingleInteger|) (|HashState|)
              (|Record| (|:| |k| 10) (|:| |c| 6)) (|List| 103)
              (|SingletonAsOrderedSet|) (|Mapping| 6 10)
              (|Record| (|:| |coef| 108) (|:| |generator| %)) (|List| %)
              (|Union| 108 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Fraction| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |primePart| %) (|:| |commonPart| %))
              (|Factored| %)
              (|Record| (|:| |coef| 6) (|:| |quotient| %) (|:| |remainder| %))
              (|Union| 111 '"failed") (|Factored| 113) (|Union| 120 '#1#)
              (|List| 113) (|Union| 100 '#2="failed") (|Union| 36 '#2#)
              (|Mapping| 6 6) (|List| 105) (|Matrix| 6)
              (|Record| (|:| |mat| 125) (|:| |vec| 46)) (|Union| 105 '#2#)
              (|Equation| %) (|List| 128)
              (|Record| (|:| |var| 105) (|:| |exponent| 10))
              (|Union| 130 '"failed") (|SparseUnivariatePolynomial| 6)
              (|List| 6) (|Mapping| 10 10) (|Union| 6 '#2#) (|String|))
           '#(~= 187 |zero?| 193 |vectorise| 198 |variables| 204 |unvectorise|
              209 |unmakeSUP| 214 |univariate| 219 |unitNormal| 230
              |unitCanonical| 235 |unit?| 240 |totalDegreeSorted| 245
              |totalDegree| 251 |support| 262 |subtractIfCan| 267
              |subResultantGcd| 273 |squareFreePolynomial| 279 |squareFreePart|
              284 |squareFree| 289 |solveLinearPolynomialEquation| 294
              |smaller?| 300 |sizeLess?| 306 |size| 312 |shiftRight| 316
              |shiftLeft| 322 |setPoly| 328 |separate| 333 |sample| 339
              |rightRecip| 343 |rightPower| 348 |retractIfCan| 360 |retract|
              380 |resultant| 400 |rem| 413 |reductum| 419 |reducedSystem| 424
              |reduce| 446 |recip| 451 |random| 456 |quo| 460 |pseudoRemainder|
              466 |pseudoQuotient| 472 |pseudoDivide| 478 |principalIdeal| 484
              |primitivePart| 489 |primitiveMonomials| 500 |prime?| 505 |pow|
              510 |pomopo!| 514 |plenaryPower| 522 |patternMatch| 528 |order|
              542 |opposite?| 548 |one?| 554 |numberOfMonomials| 559 |nextItem|
              564 |multivariate| 569 |multiplyExponents| 581 |multiEuclidean|
              587 |monomials| 593 |monomial?| 598 |monomial| 603 |monicDivide|
              623 |modulus| 636 |minimumDegree| 640 |mapExponents| 657 |map|
              663 |makeSUP| 669 |mainVariable| 674 |lookup| 679 |listOfTerms|
              684 |linearExtend| 689 |lift| 695 |leftRecip| 700 |leftPower| 705
              |leadingTerm| 717 |leadingSupport| 722 |leadingMonomial| 727
              |leadingCoefficient| 732 |lcmCoef| 737 |lcm| 743 |latex| 754
              |karatsubaDivide| 759 |isTimes| 765 |isPlus| 770 |isExpt| 775
              |integrate| 780 |init| 785 |index| 789 |hashUpdate!| 794 |hash|
              800 |ground?| 805 |ground| 810 |gcdPolynomial| 815 |gcd| 821
              |frobenius| 832 |fmecg| 837 |factorSquareFreePolynomial| 845
              |factorPolynomial| 850 |factor| 855 |extendedEuclidean| 860
              |exquo| 873 |expressIdealMember| 885 |eval| 891 |euclideanSize|
              945 |enumerate| 950 |elt| 954 |divideExponents| 984 |divide| 990
              |discriminant| 996 |differentiate| 1007 |degree| 1090 |convert|
              1107 |content| 1122 |constructOrdered| 1133 |construct| 1138
              |conditionP| 1143 |computePowers| 1148 |composite| 1152
              |commutator| 1164 |coerce| 1170 |coefficients| 1205 |coefficient|
              1210 |charthRoot| 1230 |characteristic| 1235 |binomThmExpt| 1239
              |associator| 1246 |associates?| 1253 |antiCommutator| 1259
              |annihilate?| 1265 ^ 1271 |Zero| 1283 |Vectorise| 1287
              |UnVectorise| 1292 |One| 1297 D 1301 |An| 1377 = 1382 / 1388 -
              1394 + 1405 * 1411)
           'NIL
           (CONS
            (|makeByteWordVec2| 49
                                '(0 0 0 9 11 0 9 11 0 15 19 18 14 4 1 2 3 43 4
                                  20 16 22 4 49 0 1 43 10 20 49 0 0 1 5 4 20 0
                                  0 0 1 4 4 44 0 0 0 0 0 1 1 44 49 12 41 10 10
                                  0 0 40 10 23 0 0 0 45 46 21 25 0 0 6 7 10 10
                                  20 26 0 0 0 0 0 0 0 0 4 6 7 8 47 48 10 10 11
                                  20 13 17 24))
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
                |MagmaWithUnit&| |Finite&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| |Evalable&|
                |RetractableTo&| NIL |Hashable&| NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL |BasicType&| NIL NIL NIL NIL NIL NIL NIL
                |InnerEvalable&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 10 105)
                 (|MaybeSkewPolynomialCategory| 6 10 105)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 10) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 10)
                 (|GcdDomain|) (|IntegralDomain|) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Algebra| 100)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 105) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 92) (|DifferentialRing|) (|Ring|)
                 (|FreeModuleCategory| 6 10) (|NonAssociativeAlgebra| 100)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 10) (|Module| 100)
                 (|Module| 6) (|FullyLinearlyExplicitOver| 6) (|Module| $$)
                 (|IndexedProductCategory| 6 10) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 100 100) (|NonAssociativeRing|)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 36)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 100) (|RightModule| 100) (|RightModule| 36)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|Finite|)
                 (|FullyRetractableTo| 6) (|Magma|) (|AbelianSemiGroup|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 36)
                 (|StepThrough|) (|Comparable|) (|RetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 100) (|RetractableTo| 36)
                 (|Evalable| $$) (|RetractableTo| 105) (|CommutativeStar|)
                 (|Hashable|) (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 105 $$)
                 (|InnerEvalable| 105 6) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 56) (|unitsKnown|) (|CoercibleFrom| 100)
                 (|CoercibleFrom| 36) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 87) (|ConvertibleTo| 88)
                 (|InnerEvalable| $$ $$) (|CoercibleFrom| 105)
                 (|additiveValuation|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$))
                 (|ConvertibleTo| 99))
              (|makeByteWordVec2| 136
                                  '(0 6 0 9 2 7 0 6 10 11 1 7 10 0 13 0 6 0 19
                                    2 20 0 10 2 21 2 7 24 0 0 25 2 6 24 0 0 27
                                    1 0 24 0 28 2 7 34 0 0 35 2 20 2 0 36 37 3
                                    20 2 0 36 2 40 0 6 10 43 0 0 10 44 0 6 0 45
                                    0 0 0 48 0 7 0 49 0 7 0 50 2 7 0 6 0 51 1 6
                                    0 36 53 1 7 56 0 57 2 7 6 0 10 59 1 7 0 0
                                    61 1 7 6 0 62 2 7 63 0 0 64 2 7 0 0 0 67 1
                                    7 0 0 68 2 7 0 0 0 70 2 46 6 0 36 73 2 0 24
                                    0 0 75 1 0 0 0 76 2 0 0 0 10 78 3 7 80 0 0
                                    0 81 2 0 34 0 0 82 1 0 34 0 83 2 0 63 0 0
                                    84 2 0 24 0 0 75 1 59 24 0 28 2 0 46 0 10 1
                                    1 0 124 0 1 1 0 0 46 1 1 0 0 132 1 2 0 113
                                    0 105 1 1 0 132 0 1 1 53 98 0 1 1 53 0 0 1
                                    1 53 24 0 1 2 0 10 0 124 1 1 0 10 0 1 2 0
                                    10 0 124 1 1 0 94 0 1 2 60 34 0 0 1 2 17 0
                                    0 0 1 1 9 118 113 1 1 14 0 0 1 1 14 115 0 1
                                    2 9 119 120 113 1 2 25 24 0 0 1 2 11 24 0 0
                                    1 0 23 10 44 2 4 0 0 10 1 2 0 0 0 10 1 1 0
                                    7 7 41 2 14 114 0 0 1 0 59 0 1 1 57 34 0 1
                                    2 57 0 0 10 1 2 0 0 0 97 1 1 6 121 0 1 1 7
                                    122 0 1 1 10 127 0 1 1 0 135 0 1 1 6 100 0
                                    1 1 7 36 0 1 1 10 105 0 1 1 0 6 0 1 2 5 6 0
                                    0 1 3 5 0 0 0 105 1 2 11 0 0 0 1 1 27 0 0
                                    31 2 35 89 86 90 1 1 35 91 86 1 1 4 125 86
                                    1 2 4 126 86 90 1 1 0 0 7 39 1 57 34 0 83 0
                                    23 0 48 2 11 0 0 0 1 2 4 0 0 0 1 2 17 0 0 0
                                    1 2 17 116 0 0 1 1 11 107 108 1 2 14 0 0
                                    105 1 1 14 0 0 1 1 10 108 0 1 1 9 24 0 1 0
                                    0 32 77 4 0 0 0 6 10 0 1 2 54 0 0 97 1 3 29
                                    95 0 87 95 1 3 30 96 0 88 96 1 2 17 10 0 0
                                    1 2 59 24 0 0 1 1 57 24 0 1 1 0 10 0 1 1 21
                                    34 0 1 2 0 0 132 105 1 2 0 0 113 105 1 2 0
                                    0 0 10 1 2 11 109 108 0 1 1 0 108 0 1 1 0
                                    24 0 1 3 0 0 0 105 10 1 3 0 0 0 124 94 1 2
                                    0 0 6 10 74 2 4 63 0 0 1 3 4 63 0 0 105 1 0
                                    0 7 42 2 0 10 0 105 1 2 0 94 0 124 1 1 0 10
                                    0 1 2 0 0 134 0 1 2 0 0 123 0 1 1 0 132 0 1
                                    1 0 127 0 1 1 23 97 0 1 1 0 104 0 1 2 5 6
                                    106 0 1 1 0 7 0 38 1 57 34 0 1 2 57 0 0 10
                                    1 2 0 0 0 97 1 1 27 103 0 1 1 27 10 0 1 1
                                    27 0 0 1 1 27 6 0 26 2 14 112 0 0 1 1 14 0
                                    108 1 2 14 0 0 0 1 1 0 136 0 1 2 4 63 0 10
                                    1 1 10 109 0 1 1 0 109 0 1 1 10 131 0 1 1 1
                                    0 0 1 0 21 0 1 1 23 0 97 1 2 26 102 102 0 1
                                    1 26 101 0 1 1 0 24 0 1 1 0 6 0 1 2 14 113
                                    113 113 1 2 14 0 0 0 1 1 14 0 108 1 1 42 0
                                    0 76 4 4 0 0 10 6 0 1 1 9 118 113 1 1 9 118
                                    113 1 1 9 115 0 1 2 11 110 0 0 1 3 11 80 0
                                    0 0 1 2 53 34 0 0 82 2 13 34 0 6 1 2 11 109
                                    108 0 1 3 10 0 0 108 108 1 2 10 0 0 128 1 3
                                    10 0 0 0 0 1 2 10 0 0 129 1 3 0 0 0 105 0 1
                                    3 0 0 0 124 108 1 3 0 0 0 124 133 1 3 0 0 0
                                    105 6 1 1 11 10 0 1 0 23 108 1 2 11 6 111 6
                                    1 2 17 111 0 111 1 2 17 111 111 111 1 2 0 0
                                    0 0 1 2 0 6 0 6 1 2 0 34 0 10 1 2 11 63 0 0
                                    84 1 5 6 0 1 2 5 0 0 105 1 3 33 0 0 92 10 1
                                    3 33 0 0 93 94 1 2 33 0 0 93 1 2 33 0 0 92
                                    1 1 4 0 0 1 2 4 0 0 10 1 2 4 0 0 123 1 3 4
                                    0 0 123 10 1 3 4 0 0 123 0 1 2 4 0 0 105 1
                                    3 4 0 0 105 10 1 2 4 0 0 124 1 3 4 0 0 124
                                    94 1 2 0 10 0 105 1 2 0 94 0 124 1 1 0 10 0
                                    29 1 31 87 0 1 1 32 88 0 1 1 24 99 0 1 2 14
                                    0 0 105 1 1 14 6 0 1 1 27 0 104 1 1 0 0 104
                                    1 1 51 85 86 1 0 0 32 33 2 17 34 0 0 1 2 17
                                    117 111 0 1 2 58 0 0 0 1 1 55 0 0 1 1 56 0
                                    36 1 1 28 0 100 1 1 10 0 105 1 1 0 0 7 65 1
                                    0 0 6 55 1 0 56 0 58 1 0 133 0 1 3 0 0 0
                                    105 10 1 3 0 0 0 124 94 1 2 0 6 0 10 60 1
                                    52 34 0 1 0 58 10 1 3 50 0 0 0 10 1 3 58 0
                                    0 0 0 1 2 53 24 0 0 1 2 0 0 0 0 1 2 58 24 0
                                    0 1 2 57 0 0 10 78 2 0 0 0 97 1 0 59 0 18 1
                                    0 46 0 72 1 0 0 46 47 0 57 0 8 3 33 0 0 92
                                    10 1 3 33 0 0 93 94 1 2 33 0 0 92 1 2 33 0
                                    0 93 1 1 4 0 0 1 2 4 0 0 10 1 2 4 0 0 123 1
                                    3 4 0 0 123 10 1 2 4 0 0 124 1 2 4 0 0 105
                                    1 3 4 0 0 124 94 1 3 4 0 0 105 10 1 1 0 46
                                    0 1 2 0 24 0 0 66 2 11 0 0 6 1 2 61 0 0 0 1
                                    1 61 0 0 69 2 0 0 0 0 30 2 35 0 0 36 1 2 61
                                    0 36 0 54 2 59 0 10 0 1 2 1 0 0 100 1 2 1 0
                                    100 0 1 2 0 0 6 0 52 2 0 0 0 6 1 2 0 0 0 0
                                    71 2 0 0 97 0 1)))))
           '|lookupComplete|)) 
