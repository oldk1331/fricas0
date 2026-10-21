
(SDEFUN |DIRPROD;coerce;%V;1| ((|z| (%)) (% (|Vector| R)))
        (SPADCALL |z| (QREFELT % 9))) 

(SDEFUN |DIRPROD;coerce;R%;2| ((|r| (R)) (% (%))) (MAKEARR1 (QREFELT % 6) |r|)) 

(MAKEPROP '|DIRPROD;parts;%L;3| '|SPADreplace| 'VEC2LIST) 

(SDEFUN |DIRPROD;parts;%L;3| ((|x| (%)) (% (|List| R))) (VEC2LIST |x|)) 

(SDEFUN |DIRPROD;directProduct;V%;4| ((|z| (|Vector| R)) (% (%)))
        (COND
         ((SPADCALL |z| (QREFELT % 6) (QREFELT % 16))
          (SPADCALL |z| (QREFELT % 9)))
         ('T (|error| "Not of the correct length")))) 

(SDEFUN |DIRPROD;same?| ((|z| (%)) (% (|Boolean|)))
        (SPROG ((|z1| (R)))
               (SEQ
                (LETT |z1|
                      (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                                (QREFELT % 20)))
                (EXIT
                 (SPADCALL (CONS #'|DIRPROD;same?!0| (VECTOR % |z1|)) |z|
                           (QREFELT % 23)))))) 

(SDEFUN |DIRPROD;same?!0| ((|x| NIL) ($$ NIL))
        (PROG (|z1| %)
          (LETT |z1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |z1| (QREFELT % 21)))))) 

(SDEFUN |DIRPROD;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G21 NIL) (#2=#:G20 NIL) (#3=#:G19 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G18)))
                              (GO #5=#:G16))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G29 NIL) (#2=#:G28 NIL) (#3=#:G27 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G26)))
                              (GO #5=#:G24))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;8| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G37 NIL) (#2=#:G36 NIL) (#3=#:G35 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (EQL (QREFELT |x| |i|) (QREFELT |y| |i|)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G34)))
                              (GO #5=#:G32))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;=;2%B;9| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G45 NIL) (#2=#:G44 NIL) (#3=#:G43 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 6)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF1O |x| |i| 1) (QAREF1O |y| |i| 1)
                                        (QREFELT % 21)))
                             (PROGN
                              (LETT #3# (PROGN (LETT #2# NIL) (GO #4=#:G42)))
                              (GO #5=#:G40))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT 'T)))
                #4# (EXIT #2#)))) 

(SDEFUN |DIRPROD;retract;%R;10| ((|z| (%)) (% (R)))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (SPADCALL |z| (SPADCALL |z| (QREFELT % 19)) (QREFELT % 20)))))))
         (EXIT (|error| "Not retractable")))) 

(SDEFUN |DIRPROD;retractIfCan;%U;11| ((|z| (%)) (% (|Union| R "failed")))
        (SEQ
         (COND
          ((NULL (EQL (QREFELT % 6) 0))
           (COND
            ((|DIRPROD;same?| |z| %)
             (EXIT
              (CONS 0
                    (SPADCALL |z| (SPADCALL |z| (QREFELT % 19))
                              (QREFELT % 20))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |DIRPROD;index;Pi%;12| ((|n| (|PositiveInteger|)) (% (%)))
        (SPROG
         ((N (|Integer|)) (#1=#:G58 NIL) (|i| NIL) (#2=#:G65 NIL)
          (|p| (|Integer|)) (#3=#:G60 NIL) (L (|List| R)))
         (SEQ
          (COND ((EQL (QREFELT % 6) 0) (SPADCALL (QREFELT % 28)))
                ('T
                 (SEQ (LETT N (SPADCALL (QREFELT % 29))) (LETT |p| (- |n| 1))
                      (LETT L
                            (LIST
                             (SPADCALL
                              (PROG1 (LETT #1# (+ (REM |p| N) 1))
                                (|check_subtype2| (> #1# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #1#))
                              (QREFELT % 31))))
                      (SEQ (LETT |i| 2) (LETT #2# (QREFELT % 6)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ (LETT |p| (|quotient_INT| |p| N))
                                (EXIT
                                 (LETT L
                                       (CONS
                                        (SPADCALL
                                         (PROG1 (LETT #3# (+ (REM |p| N) 1))
                                           (|check_subtype2| (> #3# 0)
                                                             '(|PositiveInteger|)
                                                             '(|Integer|) #3#))
                                         (QREFELT % 31))
                                        L))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (SPADCALL L (QREFELT % 32))))))))) 

(SDEFUN |DIRPROD;random;%;13| ((% (%)))
        (SPROG ((#1=#:G70 NIL) (|i| NIL) (#2=#:G71 NIL) (#3=#:G69 NIL))
               (SEQ
                (PROGN
                 (LETT #1# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (SETELT #1# #3# (SPADCALL (QREFELT % 34)))))
                      (LETT #3#
                            (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(SDEFUN |DIRPROD;lookup;%Pi;14| ((|x| (%)) (% (|PositiveInteger|)))
        (SPROG
         ((N (|Integer|)) (|i| NIL) (#1=#:G77 NIL) (L (|Integer|))
          (#2=#:G74 NIL))
         (SEQ
          (COND ((EQL (QREFELT % 6) 0) 1)
                ('T
                 (SEQ (LETT N (SPADCALL (QREFELT % 29)))
                      (LETT L
                            (-
                             (SPADCALL (SPADCALL |x| 1 (QREFELT % 20))
                                       (QREFELT % 36))
                             1))
                      (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 6)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT L
                                   (-
                                    (+ (* L N)
                                       (SPADCALL
                                        (SPADCALL |x| |i| (QREFELT % 20))
                                        (QREFELT % 36)))
                                    1))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (PROG1 (LETT #2# (+ L 1))
                         (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                           '(|Integer|) #2#))))))))) 

(SDEFUN |DIRPROD;0;%;15| ((% (%))) (SPADCALL (QREFELT % 6) (QREFELT % 38))) 

(SDEFUN |DIRPROD;*;3%;16| ((|u| (%)) (|v| (%)) (% (%)))
        (SPADCALL (ELT % 40) |u| |v| (QREFELT % 42))) 

(SDEFUN |DIRPROD;subtractIfCan;2%U;17|
        ((|u| (%)) (|v| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|w| (%)) (|i| NIL) (#1=#:G98 NIL) (|c| (|Union| R "failed"))
          (#2=#:G97 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 45))
                (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL (QAREF1O |u| |i| 1) (QAREF1O |v| |i| 1)
                                      (QREFELT % 47)))
                      (EXIT
                       (COND
                        ((QEQCAR |c| 1)
                         (PROGN (LETT #2# (CONS 1 "failed")) (GO #3=#:G96)))
                        ('T (QSETAREF1O |w| |i| (QCDR |c|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;1;%;18| ((% (%)))
        (MAKEARR1 (QREFELT % 6) (|spadConstant| % 49))) 

(SDEFUN |DIRPROD;recip;%U;19| ((|z| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|w| (%)) (|i| NIL) (#2=#:G112 NIL) (|u| (|Union| R #1#))
          (#3=#:G111 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |w| (QREFELT % 51))
                (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 6)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (LETT |u|
                            (SPADCALL (SPADCALL |z| |i| (QREFELT % 52))
                                      (QREFELT % 53)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 1)
                         (PROGN (LETT #3# (CONS 1 "failed")) (GO #4=#:G110)))
                        ('T (QSETAREF1O |w| |i| (QCDR |u|) 1)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |w| (QREFELT % 9))))))
          #4# (EXIT #3#)))) 

(SDEFUN |DIRPROD;unitVector;Pi%;20| ((|i| (|PositiveInteger|)) (% (%)))
        (SPROG ((|v| (%)))
               (SEQ (LETT |v| (MAKEARR1 (QREFELT % 6) (|spadConstant| % 44)))
                    (SPADCALL |v| |i| (|spadConstant| % 49) (QREFELT % 55))
                    (EXIT |v|)))) 

(SDEFUN |DIRPROD;<;2%B;21| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G121 NIL) (|a| (R)) (|b| (R)) (#2=#:G120 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G119)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;22| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G128 NIL) (|a| (R)) (|b| (R)) (#2=#:G127 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G126)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;23| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G135 NIL) (|a| (R)) (|b| (R)) (#2=#:G134 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((< |a| |b|)
                               (PROGN (LETT #2# 'T) (GO #3=#:G133)))
                              ((< |b| |a|) (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;<;2%B;24| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G142 NIL) (|a| (R)) (|b| (R)) (#2=#:G141 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 6) 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ (LETT |a| (QREFELT |x| |i|))
                            (LETT |b| (QREFELT |y| |i|))
                            (EXIT
                             (COND
                              ((SPADCALL |a| |b| (QREFELT % 58))
                               (PROGN (LETT #2# 'T) (GO #3=#:G140)))
                              ((SPADCALL |b| |a| (QREFELT % 58))
                               (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |DIRPROD;sup;3%;25| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (ELT % 59) |x| |y| (QREFELT % 42))) 

(DECLAIM (NOTINLINE |DirectProduct;|)) 

(DEFUN |DirectProduct;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G163 NIL) (#2=#:G162 NIL)
    (#3=#:G160 NIL) (#4=#:G161 NIL) (#5=#:G159 NIL) (#6=#:G158 NIL)
    (#7=#:G157 NIL) (#8=#:G156 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|DirectProduct| DV$1 DV$2))
    (LETT % (GETREFV 85))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| |#2| '(|unitsKnown|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|)))
                                        (|HasCategory| |#2| '(|Finite|))
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SetCategory|))
                                        (|HasCategory| |#2| '(|Hashable|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|Monoid|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianSemiGroup|)))
                                        (OR (|HasCategory| |#2| '(|Finite|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #2#
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#)
                                        (OR (|HasCategory| |#2| '(|Finite|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))
                                        (AND #1#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #3# #1#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# #2# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #6#
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #5#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #6#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (OR (|HasCategory| |#2| '(|Monoid|))
                                            #6#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Finite|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|))
                                         (|HasCategory| |#2| '(|Ring|)) #6#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Finite|))
                                         (|HasCategory| |#2| '(|Hashable|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|))
                                         (|HasCategory| |#2| '(|Ring|)) #6#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2# (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #5#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #6#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #7#)
                                        (OR #7# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|)))
                                         #4# #8# #7#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #5#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #6#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #8#)))))
    (|haddProp| |$ConstructorCache| '|DirectProduct| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#2| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 36028797018963968))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# (|HasCategory| % '(|SetWithZero|)))
      (AND (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #5#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 2305843009213693952))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|Hashable|)) (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 4611686018427387904))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|Vector| |#2|))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (COND
        ((|domainEqual| |#2| (|NonNegativeInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;6|) %)))
        ((|domainEqual| |#2| (|Integer|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;7|) %)))
        ((|domainEqual| |#2| (|PositiveInteger|))
         (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;8|) %)))
        ('T (QSETREFV % 24 (CONS (|dispatchFunction| |DIRPROD;=;2%B;9|) %))))
       (QSETREFV % 25 (CONS (|dispatchFunction| |DIRPROD;retract;%R;10|) %))
       (QSETREFV % 27
                 (CONS (|dispatchFunction| |DIRPROD;retractIfCan;%U;11|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (PROGN
       (QSETREFV % 33 (CONS (|dispatchFunction| |DIRPROD;index;Pi%;12|) %))
       (QSETREFV % 35 (CONS (|dispatchFunction| |DIRPROD;random;%;13|) %))
       (QSETREFV % 37 (CONS (|dispatchFunction| |DIRPROD;lookup;%Pi;14|) %)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 39
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |DIRPROD;0;%;15|) % 39)))))
    (COND
     ((|testBitVector| |pv$| 41)
      (QSETREFV % 43 (CONS (|dispatchFunction| |DIRPROD;*;3%;16|) %))))
    (COND
     ((|testBitVector| |pv$| 37)
      (PROGN
       (QSETREFV % 45 (MAKEARR1 |#1| (|spadConstant| % 44)))
       (QSETREFV % 48
                 (CONS (|dispatchFunction| |DIRPROD;subtractIfCan;2%U;17|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 9)
      (PROGN
       (QSETREFV % 50
                 (CONS #'|makeSpadConstant|
                       (LIST (|dispatchFunction| |DIRPROD;1;%;18|) % 50)))
       (QSETREFV % 51 (MAKEARR1 |#1| (|spadConstant| % 49)))
       (QSETREFV % 54 (CONS (|dispatchFunction| |DIRPROD;recip;%U;19|) %)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (COND
       ((|testBitVector| |pv$| 9)
        (QSETREFV % 56
                  (CONS (|dispatchFunction| |DIRPROD;unitVector;Pi%;20|)
                        %))))))
    (COND
     ((|testBitVector| |pv$| 2)
      (COND
       ((|domainEqual| |#2| (|NonNegativeInteger|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;21|) %)))
       ((|domainEqual| |#2| (|Integer|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;22|) %)))
       ((|domainEqual| |#2| (|PositiveInteger|))
        (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;23|) %)))
       ('T (QSETREFV % 57 (CONS (|dispatchFunction| |DIRPROD;<;2%B;24|) %))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (QSETREFV % 60 (CONS (|dispatchFunction| |DIRPROD;sup;3%;25|) %))))
    %))) 

(DEFUN |DirectProduct| (&REST #1=#:G164)
  (SPROG NIL
         (PROG (#2=#:G165)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|DirectProduct|)))))))))) 

(MAKEPROP '|DirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Vector| 7) (|local| |#1|) (|local| |#2|)
              '|Rep| (0 . |copy|) |DIRPROD;coerce;%V;1| |DIRPROD;coerce;R%;2|
              (|List| 7) |DIRPROD;parts;%L;3| (|Boolean|)
              (|NonNegativeInteger|) (5 . |size?|) |DIRPROD;directProduct;V%;4|
              (|Integer|) (11 . |minIndex|) (16 . |elt|) (22 . =)
              (|Mapping| 14 7) (28 . |every?|) (34 . =) (40 . |retract|)
              (|Union| 7 '"failed") (45 . |retractIfCan|) (50 . |empty|)
              (54 . |size|) (|PositiveInteger|) (58 . |index|) (63 . |vector|)
              (68 . |index|) (73 . |random|) (77 . |random|) (81 . |lookup|)
              (86 . |lookup|) (91 . |zero|) (96 . |0|) (100 . *)
              (|Mapping| 7 7 7) (106 . |map|) (113 . *) (119 . |0|) '|tmp0|
              (|Union| % '"failed") (123 . |subtractIfCan|)
              (129 . |subtractIfCan|) (135 . |1|) (139 . |1|) '|tmp1|
              (143 . |qelt|) (149 . |recip|) (154 . |recip|) (159 . |setelt!|)
              (166 . |unitVector|) (171 . <) (177 . <) (183 . |sup|)
              (189 . |sup|) (|Mapping| 7 7) (|List| 18) (|Equation| 7)
              (|List| 63) (|Matrix| 18) (|Matrix| %)
              (|Record| (|:| |mat| 65) (|:| |vec| (|Vector| 18))) (|Vector| %)
              (|List| 70) (|Symbol|) (|List| 15) (|Union| 73 '#1="failed")
              (|Fraction| 18) (|Union| 18 '#1#) (|Mapping| 14 7 7) (|Void|)
              (|OutputForm|) (|List| %) (|InputForm|) (|HashState|)
              (|SingleInteger|) (|Record| (|:| |mat| 83) (|:| |vec| 5))
              (|Matrix| 7) (|String|))
           '#(~= 195 |zero?| 201 |unitVector| 206 |swap!| 211 |sup| 218
              |subtractIfCan| 224 |smaller?| 230 |size?| 236 |size| 242 |sign|
              246 |setelt!| 251 |sample| 258 |rightRecip| 262 |rightPower| 267
              |retractIfCan| 279 |retract| 294 |reducedSystem| 309 |recip| 331
              |random| 336 |qsetelt!| 340 |qelt| 347 |positive?| 353
              |plenaryPower| 358 |parts| 364 |opposite?| 369 |one?| 375
              |negative?| 380 |more?| 385 |minIndex| 391 |min| 396 |members|
              407 |member?| 412 |maxIndex| 418 |max| 423 |map!| 440 |map| 446
              |lookup| 452 |less?| 457 |leftRecip| 463 |leftPower| 468 |latex|
              480 |inf| 485 |indices| 491 |index?| 496 |index| 502
              |hashUpdate!| 507 |hash| 513 |first| 518 |fill!| 523 |every?| 529
              |eval| 535 |eq?| 561 |enumerate| 567 |entry?| 571 |entries| 577
              |empty?| 582 |empty| 587 |elt| 591 |dot| 604 |directProduct| 610
              |differentiate| 615 |count| 665 |copy| 677 |convert| 682
              |commutator| 687 |coerce| 693 |characteristic| 723 |associator|
              727 |any?| 734 |antiCommutator| 740 |annihilate?| 746 |abs| 752 ^
              757 D 769 >= 819 > 825 = 831 <= 837 < 843 |1| 849 |0| 853 - 857 +
              868 * 874 |#| 916)
           'NIL
           (CONS
            (|makeByteWordVec2| 53
                                '(0 8 5 15 14 5 5 17 17 5 5 8 8 5 5 7 34 8 10
                                  10 8 17 34 13 10 10 7 1 0 6 28 12 9 8 38 27
                                  16 39 43 9 26 0 18 40 43 3 26 0 19 49 53 18
                                  44 5 42 0 0 45 49 53 18 12 11 5 4 2 52 42 0 0
                                  0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| |OrderedAbelianSemiGroup&| |Finite&| NIL NIL
                NIL |OrderedSet&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                |MagmaWithUnit&| NIL |IndexedAggregate&| |FullyRetractableTo&|
                |AbelianSemiGroup&| |Magma&| |SetWithZero&| NIL
                |HomogeneousAggregate&| |Hashable&| |RetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&| NIL
                |Evalable&| |EltableAggregate&| |Aggregate&| |BasicType&| NIL
                NIL NIL NIL NIL NIL NIL |PartialOrder&| NIL |InnerEvalable&|
                NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|DifferentialExtension| 7)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 70) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 18)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|)
                 (|RightModule| 18) (|RightModule| 7) (|LeftModule| 7)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 7)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|Finite|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|Comparable|) (|IndexedAggregate| 18 7)
                 (|FullyRetractableTo| 7) (|AbelianSemiGroup|) (|Magma|)
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|HomogeneousAggregate| 7) (|Hashable|) (|RetractableTo| 18)
                 (|RetractableTo| 73) (|RetractableTo| 7) (|SetCategory|)
                 (|CommutativeStar|) (|Evalable| 7) (|EltableAggregate| 18 7)
                 (|Aggregate|) (|BasicType|) (|CoercibleFrom| 18)
                 (|CoercibleFrom| 73) (|CoercibleFrom| 7) (|ConvertibleTo| 79)
                 (|CharacteristicZero|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|CoercibleTo| 77) (|InnerEvalable| 7 7)
                 (|Eltable| 18 7) (|CoercibleTo| (|Vector| 7))
                 (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 84
                                  '(1 8 0 0 9 2 0 14 0 15 16 1 0 18 0 19 2 0 7
                                    0 18 20 2 7 14 0 0 21 2 0 14 22 0 23 2 0 14
                                    0 0 24 1 0 7 0 25 1 0 26 0 27 0 0 0 28 0 7
                                    15 29 1 7 0 30 31 1 8 0 12 32 1 0 0 30 33 0
                                    7 0 34 0 0 0 35 1 7 30 0 36 1 0 30 0 37 1 5
                                    0 15 38 0 0 0 39 2 7 0 0 0 40 3 8 0 41 0 0
                                    42 2 0 0 0 0 43 0 7 0 44 2 7 46 0 0 47 2 0
                                    46 0 0 48 0 7 0 49 0 0 0 50 2 0 7 0 18 52 1
                                    7 46 0 53 1 0 46 0 54 3 8 7 0 18 7 55 1 0 0
                                    30 56 2 0 14 0 0 57 2 7 14 0 0 58 2 7 0 0 0
                                    59 2 0 0 0 0 60 2 63 14 0 0 1 1 60 14 0 1 1
                                    23 0 30 56 3 57 76 0 18 18 1 2 1 0 0 0 60 2
                                    61 46 0 0 48 2 29 14 0 0 1 2 0 14 0 15 16 0
                                    12 15 1 1 59 18 0 1 3 57 7 0 18 7 1 0 0 0 1
                                    1 9 46 0 1 2 9 0 0 15 1 2 41 0 0 30 1 1 51
                                    72 0 1 1 48 74 0 1 1 18 26 0 27 1 51 73 0 1
                                    1 48 18 0 1 1 18 7 0 25 1 33 65 66 1 2 33
                                    67 66 68 1 2 8 82 66 68 1 1 8 83 66 1 1 9
                                    46 0 54 0 12 0 35 3 57 7 0 18 7 1 2 0 7 0
                                    18 52 1 59 14 0 1 2 5 0 0 30 1 1 54 12 0 13
                                    2 60 14 0 0 1 1 9 14 0 1 1 59 14 0 1 2 0 14
                                    0 15 1 1 22 18 0 19 1 55 7 0 1 2 2 0 0 0 1
                                    1 54 12 0 1 2 56 14 7 0 1 1 22 18 0 1 1 55
                                    7 0 1 2 54 7 75 0 1 2 2 0 0 0 1 2 57 0 61 0
                                    1 2 0 0 61 0 1 1 12 30 0 37 2 0 14 0 15 1 1
                                    9 46 0 1 2 9 0 0 15 1 2 41 0 0 30 1 1 18 84
                                    0 1 2 1 0 0 0 1 1 0 62 0 1 2 0 14 18 0 1 1
                                    12 0 30 33 2 19 80 80 0 1 1 19 81 0 1 1 22
                                    7 0 1 2 57 0 0 7 1 2 54 14 22 0 23 2 20 0 0
                                    63 1 2 20 0 0 64 1 3 20 0 0 12 12 1 3 20 0
                                    0 7 7 1 2 0 14 0 0 1 0 12 78 1 2 56 14 7 0
                                    1 1 0 12 0 1 1 0 14 0 1 0 0 0 28 3 0 7 0 18
                                    7 1 2 0 7 0 18 20 2 24 7 0 0 1 1 0 0 5 17 1
                                    30 0 0 1 2 30 0 0 15 1 2 31 0 0 69 1 2 31 0
                                    0 70 1 3 31 0 0 69 71 1 3 31 0 0 70 15 1 2
                                    8 0 0 61 1 3 8 0 0 61 15 1 2 56 15 7 0 1 2
                                    54 15 22 0 1 1 0 0 0 1 1 12 79 0 1 2 8 0 0
                                    0 1 1 0 5 0 10 1 51 0 73 1 1 50 0 18 1 1 47
                                    77 0 1 1 5 0 0 1 1 18 0 7 11 0 8 15 1 3 8 0
                                    0 0 0 1 2 54 14 22 0 1 2 7 0 0 0 1 2 8 14 0
                                    0 1 1 58 0 0 1 2 9 0 0 15 1 2 41 0 0 30 1 1
                                    30 0 0 1 2 30 0 0 15 1 2 31 0 0 69 1 2 31 0
                                    0 70 1 3 31 0 0 69 71 1 3 31 0 0 70 15 1 2
                                    8 0 0 61 1 3 8 0 0 61 15 1 2 2 14 0 0 1 2 2
                                    14 0 0 1 2 63 14 0 0 24 2 2 14 0 0 1 2 2 14
                                    0 0 57 0 9 0 50 0 60 0 39 1 62 0 0 1 2 62 0
                                    0 0 1 2 46 0 0 0 1 2 33 0 0 18 1 2 62 0 18
                                    0 1 2 60 0 15 0 1 2 46 0 30 0 1 2 41 0 7 0
                                    1 2 41 0 0 7 1 2 41 0 0 0 43 1 54 15 0
                                    1)))))
           '|lookupComplete|)) 
