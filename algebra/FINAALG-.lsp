
(SDEFUN |FINAALG-;leftCharacteristicPolynomial;SSup;1|
        ((|a| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|n| (|PositiveInteger|)) (|ma| (|Matrix| R))
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R))) (|i| NIL)
          (#1=#:G34 NIL) (|j| NIL) (#2=#:G35 NIL))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 13)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT % 18))
                                          0 (QREFELT % 20))
                                         (SPADCALL (|spadConstant| % 21) 1
                                                   (QREFELT % 20))
                                         (QREFELT % 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT % 18))
                                         1 (QREFELT % 20))))
                                      (QREFELT % 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT % 24)))))) 

(SDEFUN |FINAALG-;rightCharacteristicPolynomial;SSup;2|
        ((|a| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|n| (|PositiveInteger|)) (|ma| (|Matrix| R))
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R))) (|i| NIL)
          (#1=#:G42 NIL) (|j| NIL) (#2=#:G43 NIL))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 26)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |mb| |i| |j|
                                      (COND
                                       ((EQL |i| |j|)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |ma| |i| |j|
                                                    (QREFELT % 18))
                                          0 (QREFELT % 20))
                                         (SPADCALL (|spadConstant| % 21) 1
                                                   (QREFELT % 20))
                                         (QREFELT % 22)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL |ma| |i| |j| (QREFELT % 18))
                                         1 (QREFELT % 20))))
                                      (QREFELT % 23))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |mb| (QREFELT % 24)))))) 

(SDEFUN |FINAALG-;leftTrace;SR;3| ((|a| (S)) (% (R)))
        (SPROG ((|ma| (|Matrix| R)) (|i| NIL) (#1=#:G48 NIL) (|t| (R)))
               (SEQ (LETT |t| (|spadConstant| % 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT % 11))
                                    (QREFELT % 13)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT % 18))
                                           (QREFELT % 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;rightTrace;SR;4| ((|a| (S)) (% (R)))
        (SPROG ((|ma| (|Matrix| R)) (|i| NIL) (#1=#:G53 NIL) (|t| (R)))
               (SEQ (LETT |t| (|spadConstant| % 28))
                    (LETT |ma|
                          (SPADCALL |a| (SPADCALL (QREFELT % 11))
                                    (QREFELT % 26)))
                    (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9))) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |t|
                                 (SPADCALL |t|
                                           (SPADCALL |ma| |i| |i|
                                                     (QREFELT % 18))
                                           (QREFELT % 29)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |t|)))) 

(SDEFUN |FINAALG-;leftNorm;SR;5| ((|a| (S)) (% (R)))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 13))
                  (QREFELT % 32))) 

(SDEFUN |FINAALG-;rightNorm;SR;6| ((|a| (S)) (% (R)))
        (SPADCALL (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 26))
                  (QREFELT % 32))) 

(SDEFUN |FINAALG-;antiAssociative?;B;7| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL) (#1=#:G67 NIL)
          (|j| NIL) (#2=#:G68 NIL) (|k| NIL) (#3=#:G69 NIL) (#4=#:G66 NIL)
          (#5=#:G65 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (QREFELT % 37))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G64)))
                                        (GO #7=#:G60))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;jordanAdmissible?;B;8| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL) (#1=#:G90 NIL)
          (|j| NIL) (#2=#:G91 NIL) (|k| NIL) (#3=#:G92 NIL) (|l| NIL)
          (#4=#:G93 NIL) (#5=#:G89 NIL) (#6=#:G88 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                              (QREFELT % 44))
                    1)
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #4# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #4#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (QREFELT % 45))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 45))
                                                       (QREFELT % 45))
                                                      (QREFELT % 38))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |k|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 45))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 45))
                                                      (QREFELT % 45))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #6#
                                                         (PROGN
                                                          (LETT #5# NIL)
                                                          (GO #7=#:G87)))
                                                   (GO #8=#:G81))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #6#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))))
          #7# (EXIT #5#)))) 

(SDEFUN |FINAALG-;lieAdmissible?;B;9| ((% (|Boolean|)))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S)) (|i| NIL)
          (#1=#:G105 NIL) (|j| NIL) (#2=#:G106 NIL) (|k| NIL) (#3=#:G107 NIL)
          (#4=#:G104 NIL) (#5=#:G103 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT % 36))
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (QREFELT % 47))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (SPADCALL |b| |k| (QREFELT % 36))
                                             (QREFELT % 47))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (QREFELT % 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 47))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 47))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G102)))
                                        (GO #7=#:G98))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;conditionsForIdempotents;VL;10|
        ((|b| (|Vector| S)) (% (|List| (|Polynomial| R))))
        (SPROG
         ((|n| (|PositiveInteger|)) (|gamma| (|Vector| (|Matrix| R)))
          (#1=#:G123 NIL) (|q| NIL) (#2=#:G124 NIL)
          (|listOfNumbers| (|List| (|String|))) (#3=#:G126 NIL) (#4=#:G127 NIL)
          (#5=#:G125 NIL) (|symbolsForCoef| (|Vector| (|Symbol|))) (|k| NIL)
          (#6=#:G128 NIL) (|xk| #7=(|Symbol|)) (|i| NIL) (#8=#:G129 NIL)
          (|j| NIL) (#9=#:G130 NIL) (|xi| #7#) (|xj| #7#)
          (|p| (|Polynomial| R)) (|conditions| (|List| (|Polynomial| R))))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 50)))
              (LETT |listOfNumbers|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |q| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |q| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                          (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |symbolsForCoef|
                    (PROGN
                     (LETT #3# (GETREFV (LENGTH |listOfNumbers|)))
                     (SEQ (LETT |i| NIL) (LETT #4# |listOfNumbers|)
                          (LETT #5# 0) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #5#
                                    (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                              (QREFELT % 53)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT #4# (CDR #4#))))
                          (GO G190) G191 (EXIT NIL))
                     #3#))
              (LETT |conditions| NIL)
              (SEQ (LETT |k| 1) (LETT #6# |n|) G190
                   (COND ((|greater_SI| |k| #6#) (GO G191)))
                   (SEQ
                    (LETT |xk| (SPADCALL |symbolsForCoef| |k| (QREFELT % 55)))
                    (LETT |p|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 57) (QREFELT % 58))
                           (LIST |xk|) (LIST 1) (QREFELT % 61)))
                    (SEQ (LETT |i| 1) (LETT #8# |n|) G190
                         (COND ((|greater_SI| |i| #8#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #9# |n|) G190
                                (COND ((|greater_SI| |j| #9#) (GO G191)))
                                (SEQ
                                 (LETT |xi|
                                       (SPADCALL |symbolsForCoef| |i|
                                                 (QREFELT % 55)))
                                 (LETT |xj|
                                       (SPADCALL |symbolsForCoef| |j|
                                                 (QREFELT % 55)))
                                 (EXIT
                                  (LETT |p|
                                        (SPADCALL |p|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (QAREF2O
                                                     (SPADCALL |gamma| |k|
                                                               (QREFELT % 62))
                                                     |i| |j| 1 1)
                                                    (QREFELT % 63))
                                                   (LIST |xi| |xj|) (LIST 1 1)
                                                   (QREFELT % 61))
                                                  (QREFELT % 64)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |conditions| (CONS |p| |conditions|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |conditions|)))) 

(SDEFUN |FINAALG-;structuralConstants;VV;11|
        ((|b| (|Vector| S)) (% (|Vector| (|Matrix| R))))
        (SPROG
         ((#1=#:G131 NIL) (|m| (|NonNegativeInteger|)) (#2=#:G144 NIL)
          (#3=#:G145 NIL) (#4=#:G143 NIL) (|sC| (|Vector| (|Matrix| R)))
          (|i| NIL) (#5=#:G146 NIL) (|j| NIL) (#6=#:G147 NIL)
          (|covec| (|Vector| R)) (|k| NIL) (#7=#:G148 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #1# (QVSIZE |b|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |sC|
                (PROGN
                 (LETT #2# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #3# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #3#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #2# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| % 28)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #2#))
          (SEQ (LETT |i| 1) (LETT #5# |m|) G190
               (COND ((|greater_SI| |i| #5#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #6# |m|) G190
                      (COND ((|greater_SI| |j| #6#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                        (SPADCALL |b| |j| (QREFELT % 36))
                                        (QREFELT % 37))
                              |b| (QREFELT % 68)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #7# |m|) G190
                             (COND ((|greater_SI| |k| #7#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT % 62)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT % 69))
                                         (QREFELT % 70))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |FINAALG-;leftRecip;SU;12| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((|lu| (|Union| S "failed")) (|b| (|Vector| S))
          (|k| (|PositiveInteger|)) (|xx| (S)) (|listOfPowers| (|List| S))
          (|cond| (|Matrix| R)) (|vectorOfCoef| (|Vector| R))
          (|invC| (|Union| R "failed")) (|invCR| (R)) (#1=#:G169 NIL) (|i| NIL)
          (#2=#:G171 NIL) (|power| NIL) (#3=#:G170 NIL) (#4=#:G168 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |lu| (SPADCALL (QREFELT % 72)))
                      (EXIT
                       (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |lu|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 68))
                                          (QREFELT % 73)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 74))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |xx| |x|
                                                             (QREFELT % 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          %
                                                                          68))
                                                               (QREFELT % 73))
                                                              (QREFELT %
                                                                       75)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 77))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 69))
                                          (QREFELT % 44)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 78)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #1#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (LENGTH
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #2#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #3#
                                                                         #7#)
                                                                   (LETT #4# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #3#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #3#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #2#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #1# #4#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                                        (QREFELT
                                                                         % 79))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        80)))))
                                                                   (LETT #4#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #4#)
                                                                           (LETT
                                                                            #3#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #3#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #1#)
                                                             (QREFELT %
                                                                      82)))))))))))))))))) 

(SDEFUN |FINAALG-;rightRecip;SU;13| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((|ru| (|Union| S "failed")) (|b| (|Vector| S))
          (|k| (|PositiveInteger|)) (|xx| (S)) (|listOfPowers| (|List| S))
          (|cond| (|Matrix| R)) (|vectorOfCoef| (|Vector| R))
          (|invC| (|Union| R "failed")) (|invCR| (R)) (#1=#:G191 NIL) (|i| NIL)
          (#2=#:G193 NIL) (|power| NIL) (#3=#:G192 NIL) (#4=#:G190 NIL))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |ru| (SPADCALL (QREFELT % 84)))
                      (EXIT
                       (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |ru|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 68))
                                          (QREFELT % 73)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 74))
                                            |k|))
                                          (GO G191)))
                                        (SEQ (LETT |k| (+ |k| 1))
                                             (LETT |xx|
                                                   (SPADCALL |x| |xx|
                                                             (QREFELT % 37)))
                                             (LETT |listOfPowers|
                                                   (CONS |xx| |listOfPowers|))
                                             (EXIT
                                              (LETT |cond|
                                                    (SPADCALL |cond|
                                                              (SPADCALL
                                                               (SPADCALL |xx|
                                                                         |b|
                                                                         (QREFELT
                                                                          %
                                                                          68))
                                                               (QREFELT % 73))
                                                              (QREFELT %
                                                                       75)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 77))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 69))
                                          (QREFELT % 44)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 78)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #1#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (LENGTH
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #2#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #3#
                                                                         #7#)
                                                                   (LETT #4# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #3#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #3#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #2#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #1# #4#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                                        (QREFELT
                                                                         % 79))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        80)))))
                                                                   (LETT #4#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #4#)
                                                                           (LETT
                                                                            #3#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #3#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #1#)
                                                             (QREFELT %
                                                                      82)))))))))))))))))) 

(SDEFUN |FINAALG-;recip;SU;14| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG ((|lrx| (|Union| S "failed")) (|rrx| (|Union| S "failed")))
               (SEQ (LETT |lrx| (SPADCALL |x| (QREFELT % 86)))
                    (EXIT
                     (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT % 87)))
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |rrx| 1)
                                        (SPADCALL (QCDR |lrx|) (QCDR |rrx|)
                                                  (QREFELT % 88)))
                                    (CONS 1 "failed"))
                                   ('T (CONS 0 (QCDR |lrx|)))))))))))) 

(SDEFUN |FINAALG-;leftMinimalPolynomial;SSup;15|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|b| (|Vector| S)) (|k| (|PositiveInteger|)) (|xx| (S))
          (|cond| (|Matrix| R)) (|vectorOfCoef| (|Vector| R)) (|i| NIL)
          (#1=#:G209 NIL) (|res| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 68))
                                 (QREFELT % 73)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 74)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |x| |xx| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 68))
                                             (QREFELT % 73))
                                            (QREFELT % 75)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 77))))
                 (LETT |res| (|spadConstant| % 90))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 69))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 91)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;rightMinimalPolynomial;SSup;16|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|b| (|Vector| S)) (|k| (|PositiveInteger|)) (|xx| (S))
          (|cond| (|Matrix| R)) (|vectorOfCoef| (|Vector| R)) (|i| NIL)
          (#1=#:G218 NIL) (|res| (|SparseUnivariatePolynomial| R)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 68))
                                 (QREFELT % 73)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 74)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |xx| |x| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 68))
                                             (QREFELT % 73))
                                            (QREFELT % 75)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 77))))
                 (LETT |res| (|spadConstant| % 90))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 69))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 91)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;associatorDependence;L;17| ((% (|List| (|Vector| R))))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S)) (|cond| (|Matrix| R))
          (|i| NIL) (#1=#:G231 NIL) (|j| NIL) (#2=#:G232 NIL) (|k| NIL)
          (#3=#:G233 NIL) (|a123| #4=(|Vector| R)) (|a231| #4#) (|a312| #4#)
          (|a132| #4#) (|a321| #4#) (|a213| #4#) (|r| NIL) (#5=#:G234 NIL)
          (|z| (|Integer|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |b| (SPADCALL (QREFELT % 11)))
              (LETT |cond| (MAKE_MATRIX1 (EXPT |n| 4) 6 (|spadConstant| % 28)))
              (LETT |z| 0)
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ
                                  (LETT |a123|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a231|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a312|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a132|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a321|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (LETT |a213|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         |b| (QREFELT % 68)))
                                  (EXIT
                                   (SEQ (LETT |r| 1) (LETT #5# |n|) G190
                                        (COND
                                         ((|greater_SI| |r| #5#) (GO G191)))
                                        (SEQ (LETT |z| (+ |z| 1))
                                             (SPADCALL |cond| |z| 1
                                                       (SPADCALL |a123| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 2
                                                       (SPADCALL |a231| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 3
                                                       (SPADCALL |a312| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 4
                                                       (SPADCALL |a132| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (SPADCALL |cond| |z| 5
                                                       (SPADCALL |a321| |r|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 70))
                                             (EXIT
                                              (SPADCALL |cond| |z| 6
                                                        (SPADCALL |a213| |r|
                                                                  (QREFELT %
                                                                           69))
                                                        (QREFELT % 70))))
                                        (LETT |r| (|inc_SI| |r|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cond| (QREFELT % 77)))))) 

(SDEFUN |FINAALG-;jacobiIdentity?;B;18| ((% (|Boolean|)))
        (SPROG
         ((|n| (|PositiveInteger|)) (|b| (|Vector| S)) (|i| NIL)
          (#1=#:G246 NIL) (|j| NIL) (#2=#:G247 NIL) (|k| NIL) (#3=#:G248 NIL)
          (#4=#:G245 NIL) (#5=#:G244 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |i| (QREFELT % 36))
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (QREFELT % 37))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (SPADCALL |b| |k| (QREFELT % 36))
                                             (QREFELT % 37))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (QREFELT % 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 37))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G243)))
                                        (GO #7=#:G239))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;lieAlgebra?;B;19| ((% (|Boolean|)))
        (COND
         ((SPADCALL (QREFELT % 97))
          (COND ((SPADCALL (QREFELT % 98)) 'T) (#1='T NIL)))
         (#1# NIL))) 

(SDEFUN |FINAALG-;jordanAlgebra?;B;20| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G267 NIL) (|j| NIL) (#2=#:G268 NIL) (|k| NIL) (#3=#:G269 NIL)
          (|l| NIL) (#4=#:G270 NIL) (#5=#:G266 NIL) (#6=#:G265 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((OR
                    (QEQCAR
                     (SPADCALL
                      (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                      (QREFELT % 44))
                     1)
                    (NULL (SPADCALL (QREFELT % 100))))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #4# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #4#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((NULL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 37))
                                                       (QREFELT % 94))
                                                      (SPADCALL
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 37))
                                                       (QREFELT % 94))
                                                      (QREFELT % 38))
                                                     (SPADCALL
                                                      (SPADCALL |b| |k|
                                                                (QREFELT % 36))
                                                      (SPADCALL |b| |j|
                                                                (QREFELT % 36))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 37))
                                                      (QREFELT % 94))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #6#
                                                         (PROGN
                                                          (LETT #5# NIL)
                                                          (GO #7=#:G264)))
                                                   (GO #8=#:G258))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #6#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))))
          #7# (EXIT #5#)))) 

(SDEFUN |FINAALG-;noncommutativeJordanAlgebra?;B;21| ((% (|Boolean|)))
        (COND
         ((OR
           (OR
            (QEQCAR
             (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 42))
                       (QREFELT % 44))
             1)
            (NULL (SPADCALL (QREFELT % 102))))
           (NULL (SPADCALL (QREFELT % 103))))
          NIL)
         ('T 'T))) 

(SDEFUN |FINAALG-;antiCommutative?;B;22| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G285 NIL) (|j| NIL) (#2=#:G286 NIL) (#3=#:G284 NIL)
          (#4=#:G283 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |i|) (LETT #2# |n|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (COND
                                   ((EQL |i| |j|)
                                    (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                              (SPADCALL |b| |i| (QREFELT % 36))
                                              (QREFELT % 37)))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |b| |i| (QREFELT % 36))
                                      (SPADCALL |b| |j| (QREFELT % 36))
                                      (QREFELT % 37))
                                     (SPADCALL
                                      (SPADCALL |b| |j| (QREFELT % 36))
                                      (SPADCALL |b| |i| (QREFELT % 36))
                                      (QREFELT % 37))
                                     (QREFELT % 38))))
                                  (QREFELT % 40)))
                                (PROGN
                                 (LETT #4#
                                       (PROGN (LETT #3# NIL) (GO #5=#:G282)))
                                 (GO #6=#:G279))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #4#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #3#)))) 

(SDEFUN |FINAALG-;commutative?;B;23| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G296 NIL) (|j| NIL) (#2=#:G297 NIL) (#3=#:G295 NIL)
          (#4=#:G294 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #2# |n|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (QREFELT % 47))
                                  (QREFELT % 40)))
                                (PROGN
                                 (LETT #4#
                                       (PROGN (LETT #3# NIL) (GO #5=#:G293)))
                                 (GO #6=#:G290))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #4#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #5# (EXIT #3#)))) 

(SDEFUN |FINAALG-;associative?;B;24| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G309 NIL) (|j| NIL) (#2=#:G310 NIL) (|k| NIL) (#3=#:G311 NIL)
          (#4=#:G308 NIL) (#5=#:G307 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 94))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G306)))
                                        (GO #7=#:G302))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;leftAlternative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G323 NIL) (|j| NIL) (#2=#:G324 NIL) (|k| NIL) (#3=#:G325 NIL)
          (#4=#:G322 NIL) (#5=#:G321 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G320)))
                                        (GO #7=#:G316))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;rightAlternative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G337 NIL) (|j| NIL) (#2=#:G338 NIL) (|k| NIL) (#3=#:G339 NIL)
          (#4=#:G336 NIL) (#5=#:G335 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G334)))
                                        (GO #7=#:G330))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;flexible?;B;27| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G351 NIL) (|j| NIL) (#2=#:G352 NIL) (|k| NIL) (#3=#:G353 NIL)
          (#4=#:G350 NIL) (#5=#:G349 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN
                                               (LETT #4# NIL)
                                               (GO #6=#:G348)))
                                        (GO #7=#:G344))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #5#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;alternative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((|b| (|Vector| S)) (|n| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G366 NIL) (|j| NIL) (#2=#:G367 NIL) (|k| NIL) (#3=#:G368 NIL)
          (#4=#:G365 NIL) (#5=#:G364 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN (LETT #4# NIL) (GO #6=#:G363)))
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 94))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #5#
                                              (PROGN (LETT #4# NIL) (GO #6#)))
                                        (GO #7=#:G358)))))
                                    #7# (EXIT #5#))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #6# (EXIT #4#)))) 

(SDEFUN |FINAALG-;leftDiscriminant;VR;29| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 112)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;rightDiscriminant;VR;30| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 114)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;coordinates;2VM;31|
        ((|v| (|Vector| S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((|m| (|Matrix| R)) (|j| NIL) (|i| NIL) (#1=#:G375 NIL))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (QVSIZE |b|)
                                    (|spadConstant| % 28)))
                (SEQ (LETT |j| (PROGN |m| 1))
                     (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) |b|
                                           (QREFELT % 68))
                                 (QREFELT % 117))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FINAALG-;represents;VVS;32|
        ((|v| (|Vector| R)) (|b| (|Vector| S)) (% (S)))
        (SPROG
         ((|m| (|Integer|)) (#1=#:G383 NIL) (|i| NIL) (#2=#:G384 NIL)
          (#3=#:G382 NIL))
         (SEQ (LETT |m| (- (SPADCALL |v| (QREFELT % 119)) 1))
              (EXIT
               (SPADCALL (ELT % 38)
                         (PROGN
                          (LETT #1# (GETREFV #4=(QVSIZE |b|)))
                          (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #1# #3#
                                         (SPADCALL
                                          (SPADCALL |v| (+ |i| |m|)
                                                    (QREFELT % 69))
                                          (SPADCALL |b| (+ |i| |m|)
                                                    (QREFELT % 36))
                                          (QREFELT % 80)))))
                               (LETT #3#
                                     (PROG1 (|inc_SI| #3#)
                                       (LETT |i| (|inc_SI| |i|))))
                               (GO G190) G191 (EXIT NIL))
                          #1#)
                         (QREFELT % 82)))))) 

(SDEFUN |FINAALG-;leftTraceMatrix;VM;33| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G390 NIL) (|i| NIL) (#2=#:G391 NIL) (#3=#:G392 NIL) (|j| NIL)
          (#4=#:G393 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                 (LETT #2# (QVSIZE |v|)) G190 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #1#
                         (CONS
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 116)))
                                (LETT #4# (QVSIZE |v|)) G190
                                (COND ((> |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 121))
                                         #3#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          #1#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #1#))))
           (QREFELT % 123))))) 

(SDEFUN |FINAALG-;rightTraceMatrix;VM;34| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G399 NIL) (|i| NIL) (#2=#:G400 NIL) (#3=#:G401 NIL) (|j| NIL)
          (#4=#:G402 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 116)))
                 (LETT #2# (QVSIZE |v|)) G190 (COND ((> |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #1#
                         (CONS
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 116)))
                                (LETT #4# (QVSIZE |v|)) G190
                                (COND ((> |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 125))
                                         #3#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          #1#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #1#))))
           (QREFELT % 123))))) 

(SDEFUN |FINAALG-;leftRegularRepresentation;SVM;35|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((|m| (|Integer|)) (#1=#:G409 NIL) (|i| NIL) (#2=#:G410 NIL))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 116)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |i| 1) (LETT #2# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (SPADCALL |b| (+ |i| |m|)
                                                            (QREFELT % 36))
                                                  (QREFELT % 37))
                                        |b| (QREFELT % 68))
                                       (QREFELT % 128))
                                      #1#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))
                       (QREFELT % 123))
                      (QREFELT % 129)))))) 

(SDEFUN |FINAALG-;rightRegularRepresentation;SVM;36|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((|m| (|Integer|)) (#1=#:G417 NIL) (|i| NIL) (#2=#:G418 NIL))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 116)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |i| 1) (LETT #2# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #1#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |b| (+ |i| |m|)
                                                   (QREFELT % 36))
                                         |x| (QREFELT % 37))
                                        |b| (QREFELT % 68))
                                       (QREFELT % 128))
                                      #1#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #1#))))
                       (QREFELT % 123))
                      (QREFELT % 129)))))) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra&;|)) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2))
          (LETT % (GETREFV 132))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| (|SparseUnivariatePolynomial| |#2|)
                           '(|CommutativeRing|))
            (PROGN
             (QSETREFV % 25
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftCharacteristicPolynomial;SSup;1|)
                        %))
             (QSETREFV % 27
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightCharacteristicPolynomial;SSup;2|)
                        %)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 83
                       (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;12|)
                             %))
             (QSETREFV % 85
                       (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;13|)
                             %))
             (QSETREFV % 89
                       (CONS (|dispatchFunction| |FINAALG-;recip;SU;14|) %))
             (QSETREFV % 92
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftMinimalPolynomial;SSup;15|)
                        %))
             (QSETREFV % 93
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightMinimalPolynomial;SSup;16|)
                        %))
             (QSETREFV % 95
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;associatorDependence;L;17|)
                        %)))))
          %))) 

(MAKEPROP '|FiniteRankNonAssociativeAlgebra&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) (|Vector| %) (4 . |someBasis|)
              (|Matrix| 7) (8 . |leftRegularRepresentation|)
              (|NonNegativeInteger|) (|Matrix| 19) (14 . |zero|) (|Integer|)
              (20 . |elt|) (|SparseUnivariatePolynomial| 7) (27 . |monomial|)
              (33 . |1|) (37 . -) (43 . |setelt!|) (51 . |determinant|)
              (56 . |leftCharacteristicPolynomial|)
              (61 . |rightRegularRepresentation|)
              (67 . |rightCharacteristicPolynomial|) (72 . |0|) (76 . +)
              |FINAALG-;leftTrace;SR;3| |FINAALG-;rightTrace;SR;4|
              (82 . |determinant|) |FINAALG-;leftNorm;SR;5|
              |FINAALG-;rightNorm;SR;6| (|Vector| 6) (87 . |elt|) (93 . *)
              (99 . +) (|Boolean|) (105 . |zero?|)
              |FINAALG-;antiAssociative?;B;7| (110 . *) (|Union| % '"failed")
              (116 . |recip|) (121 . |antiCommutator|)
              |FINAALG-;jordanAdmissible?;B;8| (127 . |commutator|)
              |FINAALG-;lieAdmissible?;B;9| (|Vector| 12)
              (133 . |structuralConstants|) (|String|) (|Symbol|)
              (138 . |coerce|) (|Vector| 52) (143 . |elt|) (|Polynomial| 7)
              (149 . |1|) (153 . -) (|List| 52) (|List| 14) (158 . |monomial|)
              (165 . |elt|) (171 . |coerce|) (176 . +) (|List| 56)
              |FINAALG-;conditionsForIdempotents;VL;10| (|Vector| 7)
              (182 . |coordinates|) (188 . |elt|) (194 . |setelt!|)
              |FINAALG-;structuralConstants;VV;11| (202 . |leftUnit|)
              (206 . |coerce|) (211 . |rank|) (216 . |horizConcat|) (|List| 67)
              (222 . |nullSpace|) (227 . -) (232 . *) (238 . *)
              (|Mapping| 6 6 6) (244 . |reduce|) (250 . |leftRecip|)
              (255 . |rightUnit|) (259 . |rightRecip|) (264 . |leftRecip|)
              (269 . |rightRecip|) (274 . ~=) (280 . |recip|) (285 . |0|)
              (289 . +) (295 . |leftMinimalPolynomial|)
              (300 . |rightMinimalPolynomial|) (305 . |associator|)
              (312 . |associatorDependence|) |FINAALG-;jacobiIdentity?;B;18|
              (316 . |antiCommutative?|) (320 . |jacobiIdentity?|)
              |FINAALG-;lieAlgebra?;B;19| (324 . |commutative?|)
              |FINAALG-;jordanAlgebra?;B;20| (328 . |flexible?|)
              (332 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;21|
              |FINAALG-;antiCommutative?;B;22| |FINAALG-;commutative?;B;23|
              |FINAALG-;associative?;B;24| |FINAALG-;leftAlternative?;B;25|
              |FINAALG-;rightAlternative?;B;26| |FINAALG-;flexible?;B;27|
              |FINAALG-;alternative?;B;28| (336 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;29| (341 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;30| (346 . |minIndex|)
              (351 . |setRow!|) |FINAALG-;coordinates;2VM;31|
              (358 . |minIndex|) |FINAALG-;represents;VVS;32|
              (363 . |leftTrace|) (|List| 127) (368 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;33| (373 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;34| (|List| 7) (378 . |parts|)
              (383 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;35|
              |FINAALG-;rightRegularRepresentation;SVM;36|)
           '#(|structuralConstants| 388 |rightTraceMatrix| 393 |rightTrace| 398
              |rightRegularRepresentation| 403 |rightRecip| 409 |rightNorm| 414
              |rightMinimalPolynomial| 419 |rightDiscriminant| 424
              |rightCharacteristicPolynomial| 429 |rightAlternative?| 434
              |represents| 438 |recip| 444 |noncommutativeJordanAlgebra?| 449
              |lieAlgebra?| 453 |lieAdmissible?| 457 |leftTraceMatrix| 461
              |leftTrace| 466 |leftRegularRepresentation| 471 |leftRecip| 477
              |leftNorm| 482 |leftMinimalPolynomial| 487 |leftDiscriminant| 492
              |leftCharacteristicPolynomial| 497 |leftAlternative?| 502
              |jordanAlgebra?| 506 |jordanAdmissible?| 510 |jacobiIdentity?|
              514 |flexible?| 518 |coordinates| 522 |conditionsForIdempotents|
              528 |commutative?| 533 |associatorDependence| 537 |associative?|
              541 |antiCommutative?| 545 |antiAssociative?| 549 |alternative?|
              553)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rightMinimalPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|leftMinimalPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|associatorDependence|
                                 ((|List| (|Vector| |#2|))))
                                T)
                              '((|rightRecip| ((|Union| |#1| "failed") |#1|))
                                T)
                              '((|leftRecip| ((|Union| |#1| "failed") |#1|)) T)
                              '((|recip| ((|Union| |#1| "failed") |#1|)) T)
                              '((|lieAlgebra?| ((|Boolean|))) T)
                              '((|jordanAlgebra?| ((|Boolean|))) T)
                              '((|noncommutativeJordanAlgebra?| ((|Boolean|)))
                                T)
                              '((|jordanAdmissible?| ((|Boolean|))) T)
                              '((|lieAdmissible?| ((|Boolean|))) T)
                              '((|jacobiIdentity?| ((|Boolean|))) T)
                              '((|alternative?| ((|Boolean|))) T)
                              '((|flexible?| ((|Boolean|))) T)
                              '((|rightAlternative?| ((|Boolean|))) T)
                              '((|leftAlternative?| ((|Boolean|))) T)
                              '((|antiAssociative?| ((|Boolean|))) T)
                              '((|associative?| ((|Boolean|))) T)
                              '((|antiCommutative?| ((|Boolean|))) T)
                              '((|commutative?| ((|Boolean|))) T)
                              '((|rightCharacteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|leftCharacteristicPolynomial|
                                 ((|SparseUnivariatePolynomial| |#2|) |#1|))
                                T)
                              '((|rightTraceMatrix|
                                 ((|Matrix| |#2|) (|Vector| |#1|)))
                                T)
                              '((|leftTraceMatrix|
                                 ((|Matrix| |#2|) (|Vector| |#1|)))
                                T)
                              '((|rightDiscriminant| (|#2| (|Vector| |#1|))) T)
                              '((|leftDiscriminant| (|#2| (|Vector| |#1|))) T)
                              '((|represents|
                                 (|#1| (|Vector| |#2|) (|Vector| |#1|)))
                                T)
                              '((|coordinates|
                                 ((|Matrix| |#2|) (|Vector| |#1|)
                                  (|Vector| |#1|)))
                                T)
                              '((|coordinates|
                                 ((|Vector| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|rightNorm| (|#2| |#1|)) T)
                              '((|leftNorm| (|#2| |#1|)) T)
                              '((|rightTrace| (|#2| |#1|)) T)
                              '((|leftTrace| (|#2| |#1|)) T)
                              '((|rightRegularRepresentation|
                                 ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|leftRegularRepresentation|
                                 ((|Matrix| |#2|) |#1| (|Vector| |#1|)))
                                T)
                              '((|structuralConstants|
                                 ((|Vector| (|Matrix| |#2|)) (|Vector| |#1|)))
                                T)
                              '((|conditionsForIdempotents|
                                 ((|List| (|Polynomial| |#2|))
                                  (|Vector| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 131
                                            '(0 6 8 9 0 6 10 11 2 6 12 0 10 13
                                              2 15 0 14 14 16 3 12 7 0 17 17 18
                                              2 19 0 7 14 20 0 7 0 21 2 19 0 0
                                              0 22 4 15 19 0 17 17 19 23 1 15
                                              19 0 24 1 0 19 0 25 2 6 12 0 10
                                              26 1 0 19 0 27 0 7 0 28 2 7 0 0 0
                                              29 1 12 7 0 32 2 35 6 0 17 36 2 6
                                              0 0 0 37 2 6 0 0 0 38 1 6 39 0 40
                                              2 7 0 8 0 42 1 7 43 0 44 2 6 0 0
                                              0 45 2 6 0 0 0 47 1 6 49 10 50 1
                                              52 0 51 53 2 54 52 0 17 55 0 56 0
                                              57 1 56 0 0 58 3 56 0 0 59 60 61
                                              2 49 12 0 17 62 1 56 0 7 63 2 56
                                              0 0 0 64 2 6 67 0 10 68 2 67 7 0
                                              17 69 4 12 7 0 17 17 7 70 0 6 43
                                              72 1 12 0 67 73 1 12 14 0 74 2 12
                                              0 0 0 75 1 12 76 0 77 1 7 0 0 78
                                              2 7 0 0 0 79 2 6 0 7 0 80 2 35 6
                                              81 0 82 1 0 43 0 83 0 6 43 84 1 0
                                              43 0 85 1 6 43 0 86 1 6 43 0 87 2
                                              6 39 0 0 88 1 0 43 0 89 0 19 0 90
                                              2 19 0 0 0 91 1 0 19 0 92 1 0 19
                                              0 93 3 6 0 0 0 0 94 0 0 76 95 0 6
                                              39 97 0 6 39 98 0 6 39 100 0 6 39
                                              102 0 6 39 103 1 6 12 10 112 1 6
                                              12 10 114 1 35 17 0 116 3 12 0 0
                                              17 67 117 1 67 17 0 119 1 6 7 0
                                              121 1 12 0 122 123 1 6 7 0 125 1
                                              67 127 0 128 1 12 0 0 129 1 0 49
                                              10 71 1 0 12 10 126 1 0 7 0 31 2
                                              0 12 0 10 131 1 0 43 0 85 1 0 7 0
                                              34 1 0 19 0 93 1 0 7 10 115 1 0
                                              19 0 27 0 0 39 109 2 0 0 67 10
                                              120 1 0 43 0 89 0 0 39 104 0 0 39
                                              99 0 0 39 48 1 0 12 10 124 1 0 7
                                              0 30 2 0 12 0 10 130 1 0 43 0 83
                                              1 0 7 0 33 1 0 19 0 92 1 0 7 10
                                              113 1 0 19 0 25 0 0 39 108 0 0 39
                                              101 0 0 39 46 0 0 39 96 0 0 39
                                              110 2 0 12 10 10 118 1 0 65 10 66
                                              0 0 39 106 0 0 76 95 0 0 39 107 0
                                              0 39 105 0 0 39 41 0 0 39
                                              111)))))
           '|lookupComplete|)) 
