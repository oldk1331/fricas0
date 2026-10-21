
(SDEFUN |FRAC;coerce;S%;1| ((|d| (S)) (% (%))) (CONS |d| (|spadConstant| % 9))) 

(SDEFUN |FRAC;zero?;%B;2| ((|x| (%)) (% (|Boolean|)))
        (SPADCALL (QCAR |x|) (QREFELT % 12))) 

(SDEFUN |FRAC;factorFraction;%F;3| ((|p| (%)) (% (|Fraction| (|Factored| S))))
        (SPADCALL (SPADCALL (QCAR |p|) (QREFELT % 15))
                  (SPADCALL (QCDR |p|) (QREFELT % 15)) (QREFELT % 18))) 

(SDEFUN |FRAC;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 20))
          (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |FRAC;hashUpdate!;Hs%Hs;5| ((|s| #1=(|HashState|)) (|x| (%)) (% #1#))
        (SEQ (LETT |s| (SPADCALL |s| (QCAR |x|) (QREFELT % 23)))
             (EXIT (SPADCALL |s| (QCDR |x|) (QREFELT % 23))))) 

(SDEFUN |FRAC;one?;%B;6| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| % 9) (QREFELT % 20))
          (SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |FRAC;retract;%S;7| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ('T (|error| "Denominator not equal to 1")))) 

(SDEFUN |FRAC;retractIfCan;%U;8| ((|x| (%)) (% (|Union| S "failed")))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20))
          (CONS 0 (QCAR |x|)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FRAC;retract;%S;9| ((|x| (%)) (% (S)))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                      ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;%U;10| ((|x| (%)) (% (|Union| S "failed")))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30))) 

(SDEFUN |FRAC;retract;%S;11| ((|x| (%)) (% (S)))
        (SPROG ((|a| (|Union| S "failed")))
               (SEQ (LETT |a| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30)))
                    (EXIT
                     (COND
                      ((QEQCAR |a| 1) (|error| "Denominator not equal to 1"))
                      ('T (QCDR |a|))))))) 

(SDEFUN |FRAC;retractIfCan;%U;12| ((|x| (%)) (% (|Union| S "failed")))
        (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 30))) 

(SDEFUN |FRAC;wholePart;%S;13| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ('T (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 31))))) 

(SDEFUN |FRAC;floor;%S;14| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| % 33) (QREFELT % 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 36)) (QREFELT % 37))
                    (QREFELT % 38)))
         ('T (SPADCALL |x| (QREFELT % 32))))) 

(SDEFUN |FRAC;ceiling;%S;15| ((|x| (%)) (% (S)))
        (COND
         ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) (QCAR |x|))
         ((SPADCALL |x| (|spadConstant| % 33) (QREFELT % 35))
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 36)) (QREFELT % 39))
                    (QREFELT % 38)))
         ('T
          (SPADCALL (|spadConstant| % 9) (SPADCALL |x| (QREFELT % 32))
                    (QREFELT % 40))))) 

(SDEFUN |FRAC;writeOMFrac| ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ (SPADCALL |dev| (QREFELT % 43))
             (SPADCALL |dev| "nums1" "rational" (QREFELT % 45))
             (SPADCALL |dev| (QCAR |x|) NIL (QREFELT % 46))
             (SPADCALL |dev| (QCDR |x|) NIL (QREFELT % 46))
             (EXIT (SPADCALL |dev| (QREFELT % 47))))) 

(SDEFUN |FRAC;OMwrite;Omd%BV;17|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 48))))
             (|FRAC;writeOMFrac| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 49))))))) 

(SDEFUN |FRAC;normalize| ((|x| (%)) (% (%)))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| S) (|:| |canonical| S) (|:| |associate| S))))
         (SEQ
          (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (|spadConstant| % 33))
                ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20)) |x|)
                (#1='T
                 (SEQ (LETT |uca| (SPADCALL (QCDR |x|) (QREFELT % 52)))
                      (EXIT
                       (COND
                        ((SPADCALL
                          (PROGN (RPLACD |x| (QVELT |uca| 1)) (QCDR |x|))
                          (QREFELT % 12))
                         (|error| "division by zero"))
                        (#1#
                         (SEQ
                          (PROGN
                           (RPLACA |x|
                                   (SPADCALL (QCAR |x|) (QVELT |uca| 2)
                                             (QREFELT % 53)))
                           (QCAR |x|))
                          (EXIT |x|))))))))))) 

(SDEFUN |FRAC;recip;%U;19| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (CONS 1 "failed"))
              ('T (CONS 0 (|FRAC;normalize| (CONS (QCDR |x|) (QCAR |x|)) %))))) 

(SDEFUN |FRAC;cancelGcd| ((|x| (%)) (% (S)))
        (SPROG ((|d| (S)) (|xn| #1=(|Union| S "failed")) (|xd| #1#))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |x|) (|spadConstant| % 9) (QREFELT % 20))
                  (QCDR |x|))
                 (#2='T
                  (SEQ
                   (LETT |d| (SPADCALL (QCAR |x|) (QCDR |x|) (QREFELT % 55)))
                   (EXIT
                    (COND ((SPADCALL |d| (QREFELT % 56)) |d|)
                          (#2#
                           (SEQ
                            (LETT |xn|
                                  (SPADCALL (QCAR |x|) |d| (QREFELT % 30)))
                            (EXIT
                             (COND
                              ((QEQCAR |xn| 1)
                               (|error|
                                "gcd not gcd in QF cancelGcd (numerator)"))
                              (#2#
                               (SEQ
                                (LETT |xd|
                                      (SPADCALL (QCDR |x|) |d| (QREFELT % 30)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |xd| 1)
                                   (|error|
                                    "gcd not gcd in QF cancelGcd (denominator)"))
                                  (#2#
                                   (SEQ
                                    (PROGN (RPLACA |x| (QCDR |xn|)) (QCAR |x|))
                                    (PROGN (RPLACD |x| (QCDR |xd|)) (QCDR |x|))
                                    (EXIT |d|))))))))))))))))))) 

(SDEFUN |FRAC;/;2S%;21| ((|nn| (S)) (|dd| (S)) (% (%)))
        (SPROG ((|z| (%)))
               (SEQ
                (COND
                 ((SPADCALL |dd| (QREFELT % 12)) (|error| "division by zero"))
                 ('T
                  (SEQ (|FRAC;cancelGcd| (LETT |z| (CONS |nn| |dd|)) %)
                       (EXIT (|FRAC;normalize| |z| %)))))))) 

(SDEFUN |FRAC;+;3%;22| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|z| (%)) (|d| (S)) (|g| (%)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 13)) |x|)
                      ((SPADCALL |x| (QREFELT % 13)) |y|)
                      ('T
                       (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)))
                            (LETT |d| (|FRAC;cancelGcd| |z| %))
                            (LETT |g|
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCDR |z|) (QCAR |x|)
                                              (QREFELT % 53))
                                    (SPADCALL (QCAR |z|) (QCAR |y|)
                                              (QREFELT % 53))
                                    (QREFELT % 40))
                                   |d|))
                            (|FRAC;cancelGcd| |g| %)
                            (PROGN
                             (RPLACD |g|
                                     (SPADCALL
                                      (SPADCALL (QCDR |g|) (QCAR |z|)
                                                (QREFELT % 53))
                                      (QCDR |z|) (QREFELT % 53)))
                             (QCDR |g|))
                            (EXIT (|FRAC;normalize| |g| %)))))))) 

(SDEFUN |FRAC;-;3%;23| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|z| (%)) (|d| (S)) (|g| (%)))
               (SEQ
                (COND ((SPADCALL |y| (QREFELT % 13)) |x|)
                      ('T
                       (SEQ (LETT |z| (CONS (QCDR |x|) (QCDR |y|)))
                            (LETT |d| (|FRAC;cancelGcd| |z| %))
                            (LETT |g|
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCDR |z|) (QCAR |x|)
                                              (QREFELT % 53))
                                    (SPADCALL (QCAR |z|) (QCAR |y|)
                                              (QREFELT % 53))
                                    (QREFELT % 59))
                                   |d|))
                            (|FRAC;cancelGcd| |g| %)
                            (PROGN
                             (RPLACD |g|
                                     (SPADCALL
                                      (SPADCALL (QCDR |g|) (QCAR |z|)
                                                (QREFELT % 53))
                                      (QCDR |z|) (QREFELT % 53)))
                             (QCDR |g|))
                            (EXIT (|FRAC;normalize| |g| %)))))))) 

(SDEFUN |FRAC;*;3%;24| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|#G36| (%)) (|#G37| (%)))
               (SEQ
                (COND
                 ((OR (SPADCALL |x| (QREFELT % 13))
                      (SPADCALL |y| (QREFELT % 13)))
                  (|spadConstant| % 33))
                 ('T
                  (COND
                   ((SPADCALL |x| (|spadConstant| % 8) (QREFELT % 21)) |y|)
                   ((SPADCALL |y| (|spadConstant| % 8) (QREFELT % 21)) |x|)
                   ('T
                    (SEQ
                     (PROGN
                      (LETT |#G36| (CONS (QCAR |x|) (QCDR |y|)))
                      (LETT |#G37| (CONS (QCAR |y|) (QCDR |x|)))
                      (LETT |x| |#G36|)
                      (LETT |y| |#G37|))
                     (|FRAC;cancelGcd| |x| %) (|FRAC;cancelGcd| |y| %)
                     (EXIT
                      (|FRAC;normalize|
                       (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                             (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 53)))
                       %)))))))))) 

(SDEFUN |FRAC;*;I2%;25| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((|y| (%)))
               (SEQ (LETT |y| (CONS (SPADCALL |n| (QREFELT % 63)) (QCDR |x|)))
                    (|FRAC;cancelGcd| |y| %)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                            (QCDR |y|))
                      %))))) 

(SDEFUN |FRAC;*;S2%;26| ((|nn| (S)) (|x| (%)) (% (%)))
        (SPROG ((|y| (%)))
               (SEQ (LETT |y| (CONS |nn| (QCDR |x|))) (|FRAC;cancelGcd| |y| %)
                    (EXIT
                     (|FRAC;normalize|
                      (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                            (QCDR |y|))
                      %))))) 

(SDEFUN |FRAC;differentiate;%M%;27|
        ((|x| (%)) (|deriv| (|Mapping| S S)) (% (%)))
        (SPROG ((|y| (%)) (|#G44| (S)) (|#G45| (S)) (|d| (S)))
               (SEQ (LETT |y| (CONS (SPADCALL (QCDR |x|) |deriv|) (QCDR |x|)))
                    (LETT |d| (|FRAC;cancelGcd| |y| %))
                    (PROGN
                     (RPLACA |y|
                             (SPADCALL
                              (SPADCALL (SPADCALL (QCAR |x|) |deriv|)
                                        (QCDR |y|) (QREFELT % 53))
                              (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 53))
                              (QREFELT % 59)))
                     (QCAR |y|))
                    (PROGN
                     (LETT |#G44| (QCDR |y|))
                     (LETT |#G45| |d|)
                     (LETT |d| |#G44|)
                     (PROGN (RPLACD |y| |#G45|) (QCDR |y|)))
                    (|FRAC;cancelGcd| |y| %)
                    (PROGN
                     (RPLACD |y|
                             (SPADCALL (SPADCALL (QCDR |y|) |d| (QREFELT % 53))
                                       |d| (QREFELT % 53)))
                     (QCDR |y|))
                    (EXIT (|FRAC;normalize| |y| %))))) 

(SDEFUN |FRAC;/;2S%;28| ((|nn| (S)) (|dd| (S)) (% (%)))
        (COND ((SPADCALL |dd| (QREFELT % 12)) (|error| "division by zero"))
              ('T (CONS |nn| |dd|)))) 

(SDEFUN |FRAC;recip;%U;29| ((|x| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL (QCAR |x|) (QREFELT % 12)) (CONS 1 "failed"))
              ('T (CONS 0 (CONS (QCDR |x|) (QCAR |x|)))))) 

(SDEFUN |FRAC;retract;%F;30| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 69))) 

(SDEFUN |FRAC;retractIfCan;%U;31|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 28)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |u|) (QREFELT % 72)))))))) 

(SDEFUN |FRAC;retract;%F;32| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 74)) (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 76)) (QREFELT % 75))
                  (QREFELT % 77))) 

(SDEFUN |FRAC;retractIfCan;%U;33|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (SPROG ((|n| #1=(|Union| (|Integer|) "failed")) (|d| #1#))
               (SEQ
                (LETT |n|
                      (SPADCALL (SPADCALL |x| (QREFELT % 74)) (QREFELT % 79)))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#2='T
                        (SEQ
                         (LETT |d|
                               (SPADCALL (SPADCALL |x| (QREFELT % 76))
                                         (QREFELT % 79)))
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#2#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT % 77))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (|qq| #1#) (% #1#))
        (SPROG
         ((#2=#:G197 NIL) (#3=#:G183 (S)) (#4=#:G181 (S)) (#5=#:G182 NIL)
          (|denpp| (S)) (|ppD| #6=(|SparseUnivariatePolynomial| S)) (|u| NIL)
          (#7=#:G198 NIL) (#8=#:G188 (S)) (#9=#:G186 (S)) (#10=#:G187 NIL)
          (|denqq| (S)) (|qqD| #6#) (|g| (|SparseUnivariatePolynomial| S))
          (|lc| (S)))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) |qq|)
                ((SPADCALL |qq| (QREFELT % 81)) |pp|)
                ((OR (ZEROP (SPADCALL |pp| (QREFELT % 83)))
                     (ZEROP (SPADCALL |qq| (QREFELT % 83))))
                 (|spadConstant| % 84))
                ('T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #2# (SPADCALL |pp| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |u| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #3# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#5#
                                   (LETT #4#
                                         (SPADCALL #4# #3# (QREFELT % 87))))
                                  ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#11='T (|spadConstant| % 9)))))
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!0|
                               (VECTOR % |denpp|))
                         |pp| (QREFELT % 92)))
                  (LETT |denqq|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #7# (SPADCALL |qq| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |u| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #8# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#10#
                                   (LETT #9#
                                         (SPADCALL #9# #8# (QREFELT % 87))))
                                  ('T
                                   (PROGN (LETT #9# #8#) (LETT #10# 'T)))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (COND (#10# #9#) (#11# (|spadConstant| % 9)))))
                  (LETT |qqD|
                        (SPADCALL
                         (CONS #'|FRAC;gcdPolynomial;3Sup;34!1|
                               (VECTOR % |denqq|))
                         |qq| (QREFELT % 92)))
                  (LETT |g| (SPADCALL |ppD| |qqD| (QREFELT % 94)))
                  (EXIT
                   (COND
                    ((ZEROP (SPADCALL |g| (QREFELT % 95)))
                     (|spadConstant| % 84))
                    (#11#
                     (SEQ (LETT |lc| (SPADCALL |g| (QREFELT % 96)))
                          (EXIT
                           (COND
                            ((SPADCALL |lc| (|spadConstant| % 9)
                                       (QREFELT % 20))
                             (SPADCALL (ELT % 10) |g| (QREFELT % 99)))
                            (#11#
                             (SPADCALL
                              (CONS #'|FRAC;gcdPolynomial;3Sup;34!2|
                                    (VECTOR % |lc|))
                              |g| (QREFELT % 99))))))))))))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!2| ((|x| NIL) ($$ NIL))
        (PROG (|lc| %)
          (LETT |lc| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |lc| (QREFELT % 57)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!1| ((|x| NIL) ($$ NIL))
        (PROG (|denqq| %)
          (LETT |denqq| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denqq| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;gcdPolynomial;3Sup;34!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;charthRoot;%U;35| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|n| #2=(|Union| S #1#)) (|d| #2#))
               (SEQ (LETT |n| (SPADCALL (QCAR |x|) (QREFELT % 101)))
                    (EXIT
                     (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                           (#3='T
                            (SEQ
                             (LETT |d| (SPADCALL (QCDR |x|) (QREFELT % 101)))
                             (EXIT
                              (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                    (#3#
                                     (CONS 0
                                           (SPADCALL (QCDR |n|) (QCDR |d|)
                                                     (QREFELT % 57))))))))))))) 

(SDEFUN |FRAC;charthRoot;%U;36| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((#2=#:G224 NIL) (|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL
                                                       (QREFELT % 103))
                                                      1))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT % 104))
                                 (QREFELT % 53))
                       (QREFELT % 101)))
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT % 57))))))))) 

(SDEFUN |FRAC;charthRoot;%U;37| ((|x| (%)) (% (|Union| % #1="failed")))
        (SPROG ((#2=#:G245 NIL) (|ans| (|Union| S #1#)))
               (SEQ
                (LETT |ans|
                      (SPADCALL
                       (SPADCALL (QCAR |x|)
                                 (SPADCALL (QCDR |x|)
                                           (PROG1
                                               (LETT #2#
                                                     (-
                                                      (SPADCALL
                                                       (QREFELT % 103))
                                                      1))
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QREFELT % 104))
                                 (QREFELT % 53))
                       (QREFELT % 101)))
                (EXIT
                 (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |ans|) (QCDR |x|)
                                        (QREFELT % 57))))))))) 

(SDEFUN |FRAC;clear| ((|l| (|List| %)) (% (|List| S)))
        (SPROG
         ((#1=#:G261 NIL) (#2=#:G253 (S)) (#3=#:G251 (S)) (#4=#:G252 NIL)
          (|d| (S)) (#5=#:G262 NIL) (|x| NIL) (#6=#:G263 NIL) (#7=#:G256 NIL))
         (SEQ
          (LETT |d|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2# (QCDR |x|))
                         (COND
                          (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 87))))
                          ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#4# #3#) ('T (|spadConstant| % 9)))))
          (EXIT
           (PROGN
            (LETT #5# NIL)
            (SEQ (LETT |x| NIL) (LETT #6# |l|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |x| (CAR #6#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #5#
                         (CONS
                          (SPADCALL (QCAR |x|)
                                    (PROG2
                                        (LETT #7#
                                              (SPADCALL |d| (QCDR |x|)
                                                        (QREFELT % 30)))
                                        (QCDR #7#)
                                      (|check_union2| (QEQCAR #7# 0)
                                                      (QREFELT % 6)
                                                      (|Union| (QREFELT % 6)
                                                               "failed")
                                                      #7#))
                                    (QREFELT % 53))
                          #5#))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |FRAC;conditionP;MU;39|
        ((|mat| (|Matrix| %)) (% (|Union| (|Vector| %) #1="failed")))
        (SPROG
         ((#2=#:G281 NIL) (|l| NIL) (#3=#:G282 NIL) (|matD| (|Matrix| S))
          (|ansD| (|Union| (|Vector| S) #1#)) (|ansDD| (|Vector| S))
          (#4=#:G284 NIL) (|i| NIL) (#5=#:G285 NIL) (#6=#:G283 NIL))
         (SEQ
          (LETT |matD|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |l| NIL)
                       (LETT #3# (SPADCALL |mat| (QREFELT % 107))) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |l| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #2# (CONS (|FRAC;clear| |l| %) #2#))))
                       (LETT #3# (CDR #3#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 110)))
          (LETT |ansD| (SPADCALL |matD| (QREFELT % 113)))
          (EXIT
           (COND ((QEQCAR |ansD| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ansDD| (QCDR |ansD|))
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #4# (GETREFV #7=(QVSIZE |ansDD|)))
                               (SEQ (LETT |i| 1) (LETT #5# #7#) (LETT #6# 0)
                                    G190
                                    (COND ((|greater_SI| |i| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SETELT #4# #6#
                                              (SPADCALL
                                               (SPADCALL |ansDD| |i|
                                                         (QREFELT % 115))
                                               (QREFELT % 10)))))
                                    (LETT #6#
                                          (PROG1 (|inc_SI| #6#)
                                            (LETT |i| (|inc_SI| |i|))))
                                    (GO G190) G191 (EXIT NIL))
                               #4#)))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPROG
         ((|u| NIL) (#2=#:G316 NIL) (#3=#:G288 (S)) (#4=#:G286 (S))
          (#5=#:G287 NIL) (|denpp| (S))
          (|ppD| (|SparseUnivariatePolynomial| S))
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S))) (#6=#:G317 NIL)
          (|w| NIL) (#7=#:G318 NIL) (|lc| (%)) (|den1| (%))
          (|lfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| %))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) (|spadConstant| % 118))
                (#8='T
                 (SEQ
                  (LETT |denpp|
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |u| NIL)
                              (LETT #2# (SPADCALL |pp| (QREFELT % 86))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |u| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #3# (SPADCALL |u| (QREFELT % 76)))
                                 (COND
                                  (#5#
                                   (LETT #4#
                                         (SPADCALL #4# #3# (QREFELT % 87))))
                                  ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#8# (|spadConstant| % 9)))))
                  (LETT |ppD|
                        (SPADCALL
                         (CONS #'|FRAC;factorPolynomial;SupF;40!0|
                               (VECTOR % |denpp|))
                         |pp| (QREFELT % 92)))
                  (LETT |ff| (SPADCALL |ppD| (QREFELT % 120)))
                  (LETT |den1| (SPADCALL |denpp| (QREFELT % 10)))
                  (LETT |lfact|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |w| NIL)
                              (LETT #7# (SPADCALL |ff| (QREFELT % 125))) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |w| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (VECTOR (QVELT |w| 0)
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL (QVELT |w| 1)
                                                            (QREFELT % 96))
                                                  (|spadConstant| % 9)
                                                  (QREFELT % 20))
                                                 (SPADCALL (ELT % 10)
                                                           (QVELT |w| 1)
                                                           (QREFELT % 99)))
                                                ('T
                                                 (SEQ
                                                  (LETT |lc|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QVELT |w| 1)
                                                          (QREFELT % 96))
                                                         (QREFELT % 10)))
                                                  (LETT |den1|
                                                        (SPADCALL |den1|
                                                                  (SPADCALL
                                                                   |lc|
                                                                   (QVELT |w|
                                                                          2)
                                                                   (QREFELT %
                                                                            126))
                                                                  (QREFELT %
                                                                           127)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (CONS
                                                     #'|FRAC;factorPolynomial;SupF;40!1|
                                                     (VECTOR |lc| %))
                                                    (QVELT |w| 1)
                                                    (QREFELT % 99))))))
                                               (QVELT |w| 2))
                                       #6#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #6#)))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL
                     (CONS #'|FRAC;factorPolynomial;SupF;40!2|
                           (VECTOR |den1| %))
                     (SPADCALL |ff| (QREFELT % 128)) (QREFELT % 99))
                    |lfact| (QREFELT % 131))))))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!2| ((|x| NIL) ($$ NIL))
        (PROG (% |den1|)
          (LETT % (QREFELT $$ 1))
          (LETT |den1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |den1| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!1| ((|x| NIL) ($$ NIL))
        (PROG (% |lc|)
          (LETT % (QREFELT $$ 1))
          (LETT |lc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |lc| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorPolynomial;SupF;40!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41|
        ((|pp| #1=(|SparseUnivariatePolynomial| %)) (% (|Factored| #1#)))
        (SPROG
         ((|lcpp| (%)) (|u| NIL) (#2=#:G341 NIL) (#3=#:G323 (S))
          (#4=#:G321 (S)) (#5=#:G322 NIL) (|denpp| (S))
          (|ppD| (|SparseUnivariatePolynomial| S))
          (|ff| (|Factored| (|SparseUnivariatePolynomial| S))) (#6=#:G342 NIL)
          (|w| NIL) (#7=#:G343 NIL) (|lc| (%)) (|den1| (%))
          (|lfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| %))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((SPADCALL |pp| (QREFELT % 81)) (|spadConstant| % 118))
                ((EQL (SPADCALL |pp| (QREFELT % 83)) 0)
                 (SPADCALL |pp| NIL (QREFELT % 131)))
                (#8='T
                 (SEQ (LETT |lcpp| (SPADCALL |pp| (QREFELT % 133)))
                      (LETT |pp| (SPADCALL |pp| |lcpp| (QREFELT % 134)))
                      (LETT |denpp|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |u| NIL)
                                  (LETT #2# (SPADCALL |pp| (QREFELT % 86)))
                                  G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |u| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #3# (SPADCALL |u| (QREFELT % 76)))
                                     (COND
                                      (#5#
                                       (LETT #4#
                                             (SPADCALL #4# #3#
                                                       (QREFELT % 87))))
                                      ('T
                                       (PROGN
                                        (LETT #4# #3#)
                                        (LETT #5# 'T)))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#5# #4#) (#8# (|spadConstant| % 9)))))
                      (LETT |ppD|
                            (SPADCALL
                             (CONS
                              #'|FRAC;factorSquareFreePolynomial;SupF;41!0|
                              (VECTOR % |denpp|))
                             |pp| (QREFELT % 92)))
                      (LETT |ff| (SPADCALL |ppD| (QREFELT % 135)))
                      (LETT |den1|
                            (SPADCALL (SPADCALL |denpp| (QREFELT % 10)) |lcpp|
                                      (QREFELT % 127)))
                      (LETT |lfact|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |w| NIL)
                                  (LETT #7# (SPADCALL |ff| (QREFELT % 125)))
                                  G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |w| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (VECTOR (QVELT |w| 0)
                                                   (COND
                                                    ((SPADCALL
                                                      (SPADCALL (QVELT |w| 1)
                                                                (QREFELT % 96))
                                                      (|spadConstant| % 9)
                                                      (QREFELT % 20))
                                                     (SPADCALL (ELT % 10)
                                                               (QVELT |w| 1)
                                                               (QREFELT % 99)))
                                                    ('T
                                                     (SEQ
                                                      (LETT |lc|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QVELT |w| 1)
                                                              (QREFELT % 96))
                                                             (QREFELT % 10)))
                                                      (LETT |den1|
                                                            (SPADCALL |den1|
                                                                      (SPADCALL
                                                                       |lc|
                                                                       (QVELT
                                                                        |w| 2)
                                                                       (QREFELT
                                                                        % 126))
                                                                      (QREFELT
                                                                       % 127)))
                                                      (EXIT
                                                       (SPADCALL
                                                        (CONS
                                                         #'|FRAC;factorSquareFreePolynomial;SupF;41!1|
                                                         (VECTOR |lc| %))
                                                        (QVELT |w| 1)
                                                        (QREFELT % 99))))))
                                                   (QVELT |w| 2))
                                           #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (CONS #'|FRAC;factorSquareFreePolynomial;SupF;41!2|
                               (VECTOR |den1| %))
                         (SPADCALL |ff| (QREFELT % 128)) (QREFELT % 99))
                        |lfact| (QREFELT % 131))))))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!2| ((|x| NIL) ($$ NIL))
        (PROG (% |den1|)
          (LETT % (QREFELT $$ 1))
          (LETT |den1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |den1| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!1| ((|x| NIL) ($$ NIL))
        (PROG (% |lc|)
          (LETT % (QREFELT $$ 1))
          (LETT |lc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 10)) |lc| (QREFELT % 127)))))) 

(SDEFUN |FRAC;factorSquareFreePolynomial;SupF;41!0| ((|x| NIL) ($$ NIL))
        (PROG (|denpp| %)
          (LETT |denpp| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| |denpp| (QREFELT % 88)) (QREFELT % 26)))))) 

(DECLAIM (NOTINLINE |Fraction;|)) 

(DEFUN |Fraction;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G366 NIL) (#2=#:G367 NIL)
    (#3=#:G365 NIL) (#4=#:G364 NIL) (#5=#:G363 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Fraction| DV$1))
    (LETT % (GETREFV 168))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1| '(|OrderedRing|))
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (AND
                                         (|HasCategory| |#1| '(|Canonical|))
                                         (|HasCategory| |#1| '(|GcdDomain|))
                                         (|HasCategory| |#1|
                                                        '(|canonicalUnitNormal|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|IntegerNumberSystem|))
                                               (|HasCategory| |#1|
                                                              '(|OpenMath|))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|Pattern|
                                                           (|Integer|))))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|PatternMatchable|
                                                          (|Integer|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|))))
                                        (OR #3# #2#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|ComparableRepresentation|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|OrderedRing|)))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|))))
                                        (OR #5# #2#)
                                        (|HasCategory| |#1|
                                                       '(|UniqueFactorizationDomain|))))))
    (|haddProp| |$ConstructorCache| '|Fraction| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|CharacteristicZero|))
         (|augmentPredVector| % 2147483648))
    (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
         (|HasCategory| % '(|CharacteristicNonZero|))
         (|augmentPredVector| % 4294967296))
    (AND (|HasCategory| |#1| '(|OrderedRing|))
         (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 8589934592))
    (AND (|HasCategory| |#1| '(|OrderedRing|))
         (|HasCategory| % '(|AbelianGroup|))
         (|augmentPredVector| % 17179869184))
    (AND (OR #5# (|HasCategory| % '(|CharacteristicZero|)))
         (|augmentPredVector| % 34359738368))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |num| |#1|) (|:| |den| |#1|)))
    (COND
     ((|testBitVector| |pv$| 31)
      (QSETREFV % 19
                (CONS (|dispatchFunction| |FRAC;factorFraction;%F;3|) %))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (COND
       ((|HasCategory| |#1| '(|canonicalUnitNormal|))
        (PROGN
         (QSETREFV % 21 (CONS (|dispatchFunction| |FRAC;=;2%B;4|) %))
         (COND
          ((|testBitVector| |pv$| 16)
           (QSETREFV % 24
                     (CONS (|dispatchFunction| |FRAC;hashUpdate!;Hs%Hs;5|)
                           %))))
         (QSETREFV % 25 (CONS (|dispatchFunction| |FRAC;one?;%B;6|) %))
         (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;7|) %))
         (QSETREFV % 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;8|) %))))
       ('T
        (PROGN
         (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;9|) %))
         (QSETREFV % 28
                   (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;10|) %))))))
     ('T
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |FRAC;retract;%S;11|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;12|) %)))))
    (COND
     ((|testBitVector| |pv$| 20)
      (QSETREFV % 32 (CONS (|dispatchFunction| |FRAC;wholePart;%S;13|) %))))
    (COND
     ((|testBitVector| |pv$| 21)
      (PROGN
       (QSETREFV % 39 (CONS (|dispatchFunction| |FRAC;floor;%S;14|) %))
       (QSETREFV % 37 (CONS (|dispatchFunction| |FRAC;ceiling;%S;15|) %))
       (COND
        ((|HasCategory| |#1| '(|OpenMath|))
         (PROGN
          (QSETREFV % 50
                    (CONS (|dispatchFunction| |FRAC;OMwrite;Omd%BV;17|)
                          %))))))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (PROGN
       (QSETREFV % 54 (CONS (|dispatchFunction| |FRAC;recip;%U;19|) %))
       (QSETREFV % 57 (CONS (|dispatchFunction| |FRAC;/;2S%;21|) %))
       (QSETREFV % 58 (CONS (|dispatchFunction| |FRAC;+;3%;22|) %))
       (QSETREFV % 60 (CONS (|dispatchFunction| |FRAC;-;3%;23|) %))
       (QSETREFV % 61 (CONS (|dispatchFunction| |FRAC;*;3%;24|) %))
       (QSETREFV % 64 (CONS (|dispatchFunction| |FRAC;*;I2%;25|) %))
       (QSETREFV % 65 (CONS (|dispatchFunction| |FRAC;*;S2%;26|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |FRAC;differentiate;%M%;27|) %))))
     ('T
      (PROGN
       (QSETREFV % 57 (CONS (|dispatchFunction| |FRAC;/;2S%;28|) %))
       (QSETREFV % 54 (CONS (|dispatchFunction| |FRAC;recip;%U;29|) %)))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
      (PROGN
       (QSETREFV % 70 (CONS (|dispatchFunction| |FRAC;retract;%F;30|) %))
       (QSETREFV % 73
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;31|) %))))
     ((|testBitVector| |pv$| 29)
      (PROGN
       (QSETREFV % 70 (CONS (|dispatchFunction| |FRAC;retract;%F;32|) %))
       (QSETREFV % 73
                 (CONS (|dispatchFunction| |FRAC;retractIfCan;%U;33|) %)))))
    (COND
     ((|HasCategory| |#1| '(|GcdDomain|))
      (QSETREFV % 100
                (CONS (|dispatchFunction| |FRAC;gcdPolynomial;3Sup;34|) %))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 4)
         (PROGN
          (COND
           ((|HasCategory| |#1| '(|canonicalUnitNormal|))
            (COND
             ((|HasCategory| |#1| '(|GcdDomain|))
              (QSETREFV % 102
                        (CONS (|dispatchFunction| |FRAC;charthRoot;%U;35|) %)))
             ('T
              (QSETREFV % 102
                        (CONS (|dispatchFunction| |FRAC;charthRoot;%U;36|)
                              %)))))
           ('T
            (QSETREFV % 102
                      (CONS (|dispatchFunction| |FRAC;charthRoot;%U;37|) %))))
          NIL
          NIL
          (QSETREFV % 116
                    (CONS (|dispatchFunction| |FRAC;conditionP;MU;39|) %)))))
       (QSETREFV % 132
                 (CONS (|dispatchFunction| |FRAC;factorPolynomial;SupF;40|) %))
       (QSETREFV % 136
                 (CONS
                  (|dispatchFunction|
                   |FRAC;factorSquareFreePolynomial;SupF;41|)
                  %)))))
    %))) 

(DEFUN |Fraction| (#1=#:G368)
  (SPROG NIL
         (PROG (#2=#:G369)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Fraction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Fraction;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Fraction|)))))))))) 

(MAKEPROP '|Fraction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|LocalAlgebra| 6 6) (|local| |#1|) '|Rep|
              (0 . |1|) (4 . |1|) |FRAC;coerce;S%;1| (|Boolean|) (8 . |zero?|)
              |FRAC;zero?;%B;2| (|Factored| %) (13 . |factor|) (|Factored| 6)
              (|Fraction| 16) (18 . /) (24 . |factorFraction|) (29 . =)
              (35 . =) (|HashState|) (41 . |hashUpdate!|) (47 . |hashUpdate!|)
              (53 . |one?|) (58 . |retract|) (|Union| 6 '"failed")
              (63 . |retractIfCan|) (|Union| % '"failed") (68 . |exquo|)
              (74 . |quo|) (80 . |wholePart|) (85 . |0|) (89 . |0|) (93 . <)
              (99 . -) (104 . |ceiling|) (109 . -) (114 . |floor|) (119 . +)
              (|Void|) (|OpenMathDevice|) (125 . |OMputApp|) (|String|)
              (130 . |OMputSymbol|) (137 . |OMwrite|) (144 . |OMputEndApp|)
              (149 . |OMputObject|) (154 . |OMputEndObject|) (159 . |OMwrite|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (166 . |unitNormal|) (171 . *) (177 . |recip|) (182 . |gcd|)
              (188 . |one?|) (193 . /) (199 . +) (205 . -) (211 . -) (217 . *)
              (|Integer|) (223 . |coerce|) (228 . *) (234 . *) (|Mapping| 6 6)
              (240 . |differentiate|) (|Fraction| 62) (246 . |retract|)
              (251 . |retract|) (|Union| 68 '#1="failed")
              (256 . |retractIfCan|) (261 . |retractIfCan|) (266 . |numer|)
              (271 . |retract|) (276 . |denom|) (281 . /) (|Union| 62 '#1#)
              (287 . |retractIfCan|) (|SparseUnivariatePolynomial| $$)
              (292 . |zero?|) (|NonNegativeInteger|) (297 . |degree|)
              (302 . |1|) (|List| $$) (306 . |coefficients|) (311 . |lcm|)
              (317 . *) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 80 6 89)
              (323 . |map|) (|SparseUnivariatePolynomial| %)
              (329 . |gcdPolynomial|) (335 . |degree|)
              (340 . |leadingCoefficient|) (|Mapping| $$ 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 89 $$ 80)
              (345 . |map|) (351 . |gcdPolynomial|) (357 . |charthRoot|)
              (362 . |charthRoot|) (367 . |characteristic|) (371 . ^)
              (|List| 85) (|Matrix| $$) (377 . |listOfLists|) (|List| 152)
              (|Matrix| 6) (382 . |matrix|) (|Union| 148 '#2="failed")
              (|Matrix| %) (387 . |conditionP|) (|Vector| 6) (392 . |elt|)
              (398 . |conditionP|) (|Factored| 80) (403 . |0|) (|Factored| 93)
              (407 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 121) (|:| |factor| 89) (|:| |exponent| 82))
              (|List| 122) (|Factored| 89) (412 . |factorList|) (417 . ^)
              (423 . /) (429 . |unit|)
              (|Record| (|:| |flag| 121) (|:| |factor| 80) (|:| |exponent| 82))
              (|List| 129) (434 . |makeFR|) (440 . |factorPolynomial|)
              (445 . |leadingCoefficient|) (450 . /)
              (456 . |factorSquareFreePolynomial|)
              (461 . |factorSquareFreePolynomial|) (|OutputForm|)
              (|PositiveInteger|)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|Union| 140 '"failed")
              (|Record| (|:| |coef| 140) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 144 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |mat| 109) (|:| |vec| 114)) (|Vector| %)
              (|InputForm|) (|Pattern| 166) (|Pattern| 62) (|List| 6)
              (|List| 154) (|Equation| 6) (|SingleInteger|) (|Symbol|)
              (|List| 156) (|Matrix| 62)
              (|Record| (|:| |mat| 158) (|:| |vec| (|Vector| 62))) (|List| 82)
              (|PatternMatchResult| 166 %) (|PatternMatchResult| 62 %)
              (|Union| 164 '#2#) (|List| 93) (|DoubleFloat|) (|Float|)
              (|Union| 156 '#1#))
           '#(|zero?| 466 |wholePart| 471 |retractIfCan| 476 |retract| 486
              |recip| 496 |one?| 501 |numer| 506 |hashUpdate!| 511
              |gcdPolynomial| 517 |floor| 523 |factorSquareFreePolynomial| 528
              |factorPolynomial| 533 |factorFraction| 538 |differentiate| 543
              |denom| 549 |conditionP| 554 |coerce| 559 |charthRoot| 564
              |characteristic| 569 |ceiling| 573 ^ 578 |OMwrite| 584 = 591 <
              597 |1| 603 |0| 607 / 611 - 623 + 634 * 640)
           'NIL
           (CONS
            (|makeByteWordVec2| 30
                                '(0 0 2 0 0 0 0 0 0 0 0 0 12 11 6 1 0 0 0 0 1 0
                                  0 0 0 1 0 0 0 0 13 1 0 0 0 0 13 1 1 0 0 0 0 0
                                  6 6 0 6 0 0 0 6 6 0 0 0 0 0 24 15 7 28 0 0 0
                                  0 16 9 30 30 5 3 0 0 0 0 22 17 23 14 10 9 8
                                  30 30 6 5 5 26 1 4 3 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|QuotientFieldCategory&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL NIL NIL
                |DivisionRing&| |DifferentialExtension&| |DifferentialRing&|
                |PartialDifferentialRing&| NIL |Algebra&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |Rng&| |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL |OrderedAbelianSemiGroup&|
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL NIL NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyEvalableOver&| |Hashable&| |Evalable&| |RetractableTo&|
                |RetractableTo&| NIL |RetractableTo&| |SetCategory&| NIL
                |RetractableTo&| NIL |OpenMath&| NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL |PartialOrder&| NIL
                NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL NIL
                NIL)
             (CONS
              '#((|QuotientFieldCategory| 6) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 156) (|OrderedRing|) (|Algebra| 68)
                 (|Algebra| $$) (|EntireRing|) (|Algebra| 6) (|Ring|)
                 (|NonAssociativeAlgebra| 68) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|Module| 68) (|SemiRng|) (|Module| $$) (|Module| 6)
                 (|FullyLinearlyExplicitOver| 6) (|LinearlyExplicitOver| 62)
                 (|BiModule| 68 68) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|LinearlyExplicitOver| 6) (|RightModule| 62)
                 (|RightModule| 68) (|LeftModule| 68) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|OrderedMagmaWithZero|)
                 (|OrderedAbelianSemiGroup|) (|AbelianGroup|) (|OrderedSet|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|MagmaWithZero|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|FullyPatternMatchable| 6) (|PatternMatchable| 62)
                 (|PatternMatchable| 166) (|StepThrough|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyEvalableOver| 6) (|Hashable|)
                 (|Evalable| 6) (|RetractableTo| 62) (|RetractableTo| 68)
                 (|RealConstant|) (|RetractableTo| 156) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 6) (|Patternable| 6)
                 (|OpenMath|) (|Canonical|) (|ConvertibleTo| 151)
                 (|ConvertibleTo| 150) (|Eltable| 6 $$) (|InnerEvalable| 6 6)
                 (|InnerEvalable| 156 6) (|CoercibleFrom| 62)
                 (|CoercibleFrom| 68) (|PartialOrder|) (|ConvertibleTo| 166)
                 (|ConvertibleTo| 165) (|ConvertibleTo| 149)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|CoercibleFrom| 156) (|CoercibleTo| 137) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 6) (|Type|))
              (|makeByteWordVec2| 136
                                  '(0 0 0 8 0 6 0 9 1 6 11 0 12 1 6 14 0 15 2
                                    17 0 16 16 18 1 0 17 0 19 2 6 11 0 0 20 2 0
                                    11 0 0 21 2 6 22 22 0 23 2 0 22 22 0 24 1 0
                                    11 0 25 1 0 6 0 26 1 0 27 0 28 2 6 29 0 0
                                    30 2 6 0 0 0 31 1 0 6 0 32 0 0 0 33 0 6 0
                                    34 2 0 11 0 0 35 1 0 0 0 36 1 0 6 0 37 1 6
                                    0 0 38 1 0 6 0 39 2 6 0 0 0 40 1 42 41 0 43
                                    3 42 41 0 44 44 45 3 6 41 42 0 11 46 1 42
                                    41 0 47 1 42 41 0 48 1 42 41 0 49 3 0 41 42
                                    0 11 50 1 6 51 0 52 2 6 0 0 0 53 1 0 29 0
                                    54 2 6 0 0 0 55 1 6 11 0 56 2 0 0 6 6 57 2
                                    0 0 0 0 58 2 6 0 0 0 59 2 0 0 0 0 60 2 0 0
                                    0 0 61 1 6 0 62 63 2 0 0 62 0 64 2 0 0 6 0
                                    65 2 0 0 0 66 67 1 6 68 0 69 1 0 68 0 70 1
                                    6 71 0 72 1 0 71 0 73 1 0 6 0 74 1 6 62 0
                                    75 1 0 6 0 76 2 68 0 62 62 77 1 6 78 0 79 1
                                    80 11 0 81 1 80 82 0 83 0 80 0 84 1 80 85 0
                                    86 2 6 0 0 0 87 2 0 0 0 6 88 2 91 89 90 80
                                    92 2 6 93 93 93 94 1 89 82 0 95 1 89 6 0 96
                                    2 98 80 97 89 99 2 0 93 93 93 100 1 6 29 0
                                    101 1 0 29 0 102 0 0 82 103 2 6 0 0 82 104
                                    1 106 105 0 107 1 109 0 108 110 1 6 111 112
                                    113 2 114 6 0 62 115 1 0 111 112 116 0 117
                                    0 118 1 6 119 93 120 1 124 123 0 125 2 0 0
                                    0 82 126 2 0 0 0 0 127 1 124 89 0 128 2 117
                                    0 80 130 131 1 0 119 93 132 1 80 2 0 133 2
                                    80 0 0 2 134 1 6 119 93 135 1 0 119 93 136
                                    1 0 11 0 13 1 20 6 0 32 1 0 27 0 28 1 29 71
                                    0 73 1 0 6 0 26 1 29 68 0 70 1 0 29 0 54 1
                                    0 11 0 25 1 0 6 0 74 2 16 22 22 0 24 2 0 93
                                    93 93 100 1 21 6 0 39 1 2 119 93 136 1 2
                                    119 93 132 1 31 17 0 19 2 0 0 0 66 67 1 0 6
                                    0 76 1 33 111 112 116 1 0 0 6 10 1 33 29 0
                                    102 0 0 82 103 1 21 6 0 37 2 0 0 0 82 126 3
                                    22 41 42 0 11 50 2 0 11 0 0 21 2 6 11 0 0
                                    35 0 0 0 8 0 0 0 33 2 0 0 0 0 127 2 0 0 6 6
                                    57 2 0 0 0 0 60 1 0 0 0 36 2 0 0 0 0 58 2 0
                                    0 0 0 61 2 0 0 62 0 64 2 0 0 6 0 65 2 0 0 0
                                    6 88)))))
           '|lookupIncomplete|)) 
