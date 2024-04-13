
(SDEFUN |FINAALG-;leftCharacteristicPolynomial;SSup;1|
        ((|a| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((#1=#:G53 NIL) (|j| NIL) (#2=#:G52 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 13)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
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
         ((#1=#:G61 NIL) (|j| NIL) (#2=#:G60 NIL) (|i| NIL)
          (|mb| (|Matrix| (|SparseUnivariatePolynomial| R)))
          (|ma| (|Matrix| R)) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |ma|
                    (SPADCALL |a| (SPADCALL (QREFELT % 11)) (QREFELT % 26)))
              (LETT |mb| (SPADCALL |n| |n| (QREFELT % 16)))
              (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                          (COND ((|greater_SI| |j| #1#) (GO G191)))
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
        (SPROG ((|t| (R)) (#1=#:G66 NIL) (|i| NIL) (|ma| (|Matrix| R)))
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
        (SPROG ((|t| (R)) (#1=#:G71 NIL) (|i| NIL) (|ma| (|Matrix| R)))
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
         ((#1=#:G84 NIL) (#2=#:G85 NIL) (#3=#:G88 NIL) (|k| NIL) (#4=#:G87 NIL)
          (|j| NIL) (#5=#:G86 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not anti-associative"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G83)))))
                                        (GO #7=#:G79))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is anti-associative" (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;jordanAdmissible?;B;8| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G106 NIL) (#2=#:G107 NIL) (#3=#:G111 NIL) (|l| NIL)
          (#4=#:G110 NIL) (|k| NIL) (#5=#:G109 NIL) (|j| NIL) (#6=#:G108 NIL)
          (|i| NIL) (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 46))
                              (QREFELT % 48))
                    1)
                   (SEQ
                    (SPADCALL
                     "this algebra is not Jordan admissible, as 2 is not invertible in the ground ring"
                     (QREFELT % 44))
                    (EXIT NIL)))
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
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
                                                        (QREFELT % 49))
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 49))
                                                       (QREFELT % 49))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |b| |l|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |j|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 49))
                                                       (SPADCALL
                                                        (SPADCALL |b| |k|
                                                                  (QREFELT %
                                                                           36))
                                                        (SPADCALL |b| |i|
                                                                  (QREFELT %
                                                                           36))
                                                        (QREFELT % 49))
                                                       (QREFELT % 49))
                                                      (QREFELT % 38))
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b| |k|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |j|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 49))
                                                      (SPADCALL
                                                       (SPADCALL |b| |i|
                                                                 (QREFELT %
                                                                          36))
                                                       (SPADCALL |b| |l|
                                                                 (QREFELT %
                                                                          36))
                                                       (QREFELT % 49))
                                                      (QREFELT % 49))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (SEQ
                                                          (SPADCALL
                                                           "this algebra is not Jordan admissible"
                                                           (QREFELT % 44))
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #2# NIL)
                                                            (GO #7=#:G105)))))
                                                   (GO #8=#:G99))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL "this algebra is Jordan admissible"
                              (QREFELT % 44))
                    (EXIT 'T)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAdmissible?;B;9| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G122 NIL) (#2=#:G123 NIL) (#3=#:G126 NIL) (|k| NIL)
          (#4=#:G125 NIL) (|j| NIL) (#5=#:G124 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                             (QREFELT % 51))
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (QREFELT % 51))
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |b| |j| (QREFELT % 36))
                                             (SPADCALL |b| |k| (QREFELT % 36))
                                             (QREFELT % 51))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 51))
                                           (QREFELT % 38))
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |b| |k| (QREFELT % 36))
                                            (SPADCALL |b| |i| (QREFELT % 36))
                                            (QREFELT % 51))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 51))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "this algebra is not Lie admissible"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G121)))))
                                        (GO #7=#:G117))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "this algebra is Lie admissible" (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;conditionsForIdempotents;VL;10|
        ((|b| (|Vector| S)) (% (|List| (|Polynomial| R))))
        (SPROG
         ((|conditions| (|List| (|Polynomial| R))) (|p| (|Polynomial| R))
          (|xj| #1=(|Symbol|)) (|xi| #1#) (#2=#:G156 NIL) (|j| NIL)
          (#3=#:G155 NIL) (|i| NIL) (|xk| #1#) (#4=#:G154 NIL) (|k| NIL)
          (|symbolsForCoef| (|Vector| (|Symbol|))) (#5=#:G151 NIL)
          (#6=#:G153 NIL) (#7=#:G152 NIL) (|listOfNumbers| (|List| (|String|)))
          (#8=#:G150 NIL) (|q| NIL) (#9=#:G149 NIL)
          (|gamma| (|Vector| (|Matrix| R))) (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |gamma| (SPADCALL |b| (QREFELT % 54)))
              (LETT |listOfNumbers|
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |q| 1) (LETT #8# |n|) G190
                          (COND ((|greater_SI| |q| #8#) (GO G191)))
                          (SEQ (EXIT (LETT #9# (CONS (STRINGIMAGE |q|) #9#))))
                          (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT |symbolsForCoef|
                    (PROGN
                     (LETT #7# (GETREFV (SIZE |listOfNumbers|)))
                     (SEQ (LETT |i| NIL) (LETT #6# |listOfNumbers|)
                          (LETT #5# 0) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #7# #5#
                                    (SPADCALL (STRCONC "%" (STRCONC "x" |i|))
                                              (QREFELT % 56)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     #7#))
              (LETT |conditions| NIL)
              (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |xk| (SPADCALL |symbolsForCoef| |k| (QREFELT % 58)))
                    (LETT |p|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 60) (QREFELT % 61))
                           (LIST |xk|) (LIST 1) (QREFELT % 64)))
                    (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                         (COND ((|greater_SI| |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (LETT |xi|
                                       (SPADCALL |symbolsForCoef| |i|
                                                 (QREFELT % 58)))
                                 (LETT |xj|
                                       (SPADCALL |symbolsForCoef| |j|
                                                 (QREFELT % 58)))
                                 (EXIT
                                  (LETT |p|
                                        (SPADCALL |p|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (QAREF2O
                                                     (SPADCALL |gamma| |k|
                                                               (QREFELT % 65))
                                                     |i| |j| 1 1)
                                                    (QREFELT % 66))
                                                   (LIST |xi| |xj|) (LIST 1 1)
                                                   (QREFELT % 64))
                                                  (QREFELT % 67)))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |conditions| (CONS |p| |conditions|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |conditions|)))) 

(SDEFUN |FINAALG-;structuralConstants;VV;11|
        ((|b| (|Vector| S)) (% (|Vector| (|Matrix| R))))
        (SPROG
         ((#1=#:G174 NIL) (|k| NIL) (|covec| (|Vector| R)) (#2=#:G173 NIL)
          (|j| NIL) (#3=#:G172 NIL) (|i| NIL) (|sC| (|Vector| (|Matrix| R)))
          (#4=#:G169 NIL) (#5=#:G171 NIL) (#6=#:G170 NIL)
          (|m| (|NonNegativeInteger|)) (#7=#:G157 NIL))
         (SEQ
          (LETT |m|
                (PROG1 (LETT #7# (QVSIZE |b|))
                  (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #7#)))
          (LETT |sC|
                (PROGN
                 (LETT #6# (GETREFV |m|))
                 (SEQ (LETT |k| 1) (LETT #5# |m|) (LETT #4# 0) G190
                      (COND ((|greater_SI| |k| #5#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #6# #4#
                                (MAKE_MATRIX1 |m| |m| (|spadConstant| % 28)))))
                      (LETT #4#
                            (PROG1 (|inc_SI| #4#) (LETT |k| (|inc_SI| |k|))))
                      (GO G190) G191 (EXIT NIL))
                 #6#))
          (SEQ (LETT |i| 1) (LETT #3# |m|) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# |m|) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (LETT |covec|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                        (SPADCALL |b| |j| (QREFELT % 36))
                                        (QREFELT % 37))
                              |b| (QREFELT % 71)))
                       (EXIT
                        (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                             (COND ((|greater_SI| |k| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL (SPADCALL |sC| |k| (QREFELT % 65)) |i|
                                         |j|
                                         (SPADCALL |covec| |k| (QREFELT % 72))
                                         (QREFELT % 73))))
                             (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |sC|)))) 

(SDEFUN |FINAALG-;leftRecip;SU;12| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((#1=#:G193 NIL) (#2=#:G195 NIL) (|power| NIL) (#3=#:G196 NIL)
          (|i| NIL) (#4=#:G194 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|lu| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |lu| (SPADCALL (QREFELT % 75)))
                      (EXIT
                       (COND ((QEQCAR |lu| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |lu|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 71))
                                          (QREFELT % 76)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 77))
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
                                                                          71))
                                                               (QREFELT % 76))
                                                              (QREFELT %
                                                                       78)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 80))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 72))
                                          (QREFELT % 48)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 81)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                                        (QREFELT
                                                                         % 82))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        83)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT %
                                                                      85)))))))))))))))))) 

(SDEFUN |FINAALG-;rightRecip;SU;13| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG
         ((#1=#:G215 NIL) (#2=#:G217 NIL) (|power| NIL) (#3=#:G218 NIL)
          (|i| NIL) (#4=#:G216 NIL) (|invCR| (R)) (|invC| (|Union| R "failed"))
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R))
          (|listOfPowers| (|List| S)) (|xx| (S)) (|k| (|PositiveInteger|))
          (|b| (|Vector| S)) (|ru| (|Union| S "failed")))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 40)) (CONS 1 "failed"))
                (#5='T
                 (SEQ (LETT |ru| (SPADCALL (QREFELT % 87)))
                      (EXIT
                       (COND ((QEQCAR |ru| 1) (CONS 1 "failed"))
                             (#5#
                              (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                                   (LETT |xx| (QCDR |ru|)) (LETT |k| 1)
                                   (LETT |cond|
                                         (SPADCALL
                                          (SPADCALL |xx| |b| (QREFELT % 71))
                                          (QREFELT % 76)))
                                   (LETT |listOfPowers| (LIST |xx|))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (EQL
                                            (SPADCALL |cond| (QREFELT % 77))
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
                                                                          71))
                                                               (QREFELT % 76))
                                                              (QREFELT %
                                                                       78)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (LETT |vectorOfCoef|
                                         (|SPADfirst|
                                          (SPADCALL |cond| (QREFELT % 80))))
                                   (LETT |invC|
                                         (SPADCALL
                                          (SPADCALL |vectorOfCoef| 1
                                                    (QREFELT % 72))
                                          (QREFELT % 48)))
                                   (EXIT
                                    (COND ((QEQCAR |invC| 1) (CONS 1 "failed"))
                                          (#5#
                                           (SEQ
                                            (LETT |invCR|
                                                  (SPADCALL (QCDR |invC|)
                                                            (QREFELT % 81)))
                                            (EXIT
                                             (CONS 0
                                                   (SPADCALL (ELT % 38)
                                                             (PROGN
                                                              (LETT #4#
                                                                    (GETREFV
                                                                     (MIN
                                                                      (|inc_SI|
                                                                       (-
                                                                        #6=(QVSIZE
                                                                            |vectorOfCoef|)
                                                                        2))
                                                                      (SIZE
                                                                       #7=(REVERSE
                                                                           |listOfPowers|)))))
                                                              (SEQ (LETT |i| 2)
                                                                   (LETT #3#
                                                                         #6#)
                                                                   (LETT
                                                                    |power|
                                                                    NIL)
                                                                   (LETT #2#
                                                                         #7#)
                                                                   (LETT #1# 0)
                                                                   G190
                                                                   (COND
                                                                    ((OR
                                                                      (ATOM
                                                                       #2#)
                                                                      (PROGN
                                                                       (LETT
                                                                        |power|
                                                                        (CAR
                                                                         #2#))
                                                                       NIL)
                                                                      (|greater_SI|
                                                                       |i|
                                                                       #3#))
                                                                     (GO
                                                                      G191)))
                                                                   (SEQ
                                                                    (EXIT
                                                                     (SETELT
                                                                      #4# #1#
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |invCR|
                                                                        (SPADCALL
                                                                         |vectorOfCoef|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                                        (QREFELT
                                                                         % 82))
                                                                       |power|
                                                                       (QREFELT
                                                                        %
                                                                        83)))))
                                                                   (LETT #1#
                                                                         (PROG1
                                                                             (|inc_SI|
                                                                              #1#)
                                                                           (LETT
                                                                            #2#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #2#)
                                                                              (LETT
                                                                               |i|
                                                                               (|inc_SI|
                                                                                |i|))))))
                                                                   (GO G190)
                                                                   G191
                                                                   (EXIT NIL))
                                                              #4#)
                                                             (QREFELT %
                                                                      85)))))))))))))))))) 

(SDEFUN |FINAALG-;recip;SU;14| ((|x| (S)) (% (|Union| S "failed")))
        (SPROG ((|rrx| (|Union| S "failed")) (|lrx| (|Union| S "failed")))
               (SEQ (LETT |lrx| (SPADCALL |x| (QREFELT % 89)))
                    (EXIT
                     (COND ((QEQCAR |lrx| 1) (CONS 1 "failed"))
                           ('T
                            (SEQ (LETT |rrx| (SPADCALL |x| (QREFELT % 90)))
                                 (EXIT
                                  (COND
                                   ((OR (QEQCAR |rrx| 1)
                                        (SPADCALL (QCDR |lrx|) (QCDR |rrx|)
                                                  (QREFELT % 91)))
                                    (CONS 1 "failed"))
                                   ('T (CONS 0 (QCDR |lrx|)))))))))))) 

(SDEFUN |FINAALG-;leftMinimalPolynomial;SSup;15|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G238 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 71))
                                 (QREFELT % 76)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 77)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |x| |xx| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 71))
                                             (QREFELT % 76))
                                            (QREFELT % 78)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 80))))
                 (LETT |res| (|spadConstant| % 93))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 72))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 94)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;rightMinimalPolynomial;SSup;16|
        ((|x| (S)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#1=#:G247 NIL) (|i| NIL)
          (|vectorOfCoef| (|Vector| R)) (|cond| (|Matrix| R)) (|xx| (S))
          (|k| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (COND
           ((SPADCALL |x| (QREFELT % 40))
            (SPADCALL (|spadConstant| % 21) 1 (QREFELT % 20)))
           ('T
            (SEQ (LETT |b| (SPADCALL (QREFELT % 11))) (LETT |xx| |x|)
                 (LETT |k| 1)
                 (LETT |cond|
                       (SPADCALL (SPADCALL |xx| |b| (QREFELT % 71))
                                 (QREFELT % 76)))
                 (SEQ G190
                      (COND
                       ((NULL (EQL (SPADCALL |cond| (QREFELT % 77)) |k|))
                        (GO G191)))
                      (SEQ (LETT |k| (+ |k| 1))
                           (LETT |xx| (SPADCALL |xx| |x| (QREFELT % 37)))
                           (EXIT
                            (LETT |cond|
                                  (SPADCALL |cond|
                                            (SPADCALL
                                             (SPADCALL |xx| |b| (QREFELT % 71))
                                             (QREFELT % 76))
                                            (QREFELT % 78)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (LETT |vectorOfCoef|
                       (|SPADfirst| (SPADCALL |cond| (QREFELT % 80))))
                 (LETT |res| (|spadConstant| % 93))
                 (SEQ (LETT |i| 1) (LETT #1# |k|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT |res|
                              (SPADCALL |res|
                                        (SPADCALL
                                         (SPADCALL |vectorOfCoef| |i|
                                                   (QREFELT % 72))
                                         |i| (QREFELT % 20))
                                        (QREFELT % 94)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT |res|))))))) 

(SDEFUN |FINAALG-;associatorDependence;L;17| ((% (|List| (|Vector| R))))
        (SPROG
         ((|z| (|Integer|)) (#1=#:G263 NIL) (|r| NIL) (|a213| #2=(|Vector| R))
          (|a321| #2#) (|a132| #2#) (|a312| #2#) (|a231| #2#) (|a123| #2#)
          (#3=#:G262 NIL) (|k| NIL) (#4=#:G261 NIL) (|j| NIL) (#5=#:G260 NIL)
          (|i| NIL) (|cond| (|Matrix| R)) (|b| (|Vector| S))
          (|n| (|PositiveInteger|)))
         (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
              (LETT |b| (SPADCALL (QREFELT % 11)))
              (LETT |cond| (MAKE_MATRIX1 (EXPT |n| 4) 6 (|spadConstant| % 28)))
              (LETT |z| 0)
              (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                   (COND ((|greater_SI| |i| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                          (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (LETT |a231|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (LETT |a312|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (LETT |a132|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (LETT |a321|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (LETT |a213|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |b| |j| (QREFELT % 36))
                                          (SPADCALL |b| |i| (QREFELT % 36))
                                          (SPADCALL |b| |k| (QREFELT % 36))
                                          (QREFELT % 97))
                                         |b| (QREFELT % 71)))
                                  (EXIT
                                   (SEQ (LETT |r| 1) (LETT #1# |n|) G190
                                        (COND
                                         ((|greater_SI| |r| #1#) (GO G191)))
                                        (SEQ (LETT |z| (+ |z| 1))
                                             (SPADCALL |cond| |z| 1
                                                       (SPADCALL |a123| |r|
                                                                 (QREFELT %
                                                                          72))
                                                       (QREFELT % 73))
                                             (SPADCALL |cond| |z| 2
                                                       (SPADCALL |a231| |r|
                                                                 (QREFELT %
                                                                          72))
                                                       (QREFELT % 73))
                                             (SPADCALL |cond| |z| 3
                                                       (SPADCALL |a312| |r|
                                                                 (QREFELT %
                                                                          72))
                                                       (QREFELT % 73))
                                             (SPADCALL |cond| |z| 4
                                                       (SPADCALL |a132| |r|
                                                                 (QREFELT %
                                                                          72))
                                                       (QREFELT % 73))
                                             (SPADCALL |cond| |z| 5
                                                       (SPADCALL |a321| |r|
                                                                 (QREFELT %
                                                                          72))
                                                       (QREFELT % 73))
                                             (EXIT
                                              (SPADCALL |cond| |z| 6
                                                        (SPADCALL |a213| |r|
                                                                  (QREFELT %
                                                                           72))
                                                        (QREFELT % 73))))
                                        (LETT |r| (|inc_SI| |r|)) (GO G190)
                                        G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |cond| (QREFELT % 80)))))) 

(SDEFUN |FINAALG-;jacobiIdentity?;B;18| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G274 NIL) (#2=#:G275 NIL) (#3=#:G278 NIL) (|k| NIL)
          (#4=#:G277 NIL) (|j| NIL) (#5=#:G276 NIL) (|i| NIL)
          (|b| (|Vector| S)) (|n| (|PositiveInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (SPADCALL (QREFELT % 9)))
                (LETT |b| (SPADCALL (QREFELT % 11)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "Jacobi identity does not hold"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G273)))))
                                        (GO #7=#:G269))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "Jacobi identity holds" (QREFELT % 44)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;lieAlgebra?;B;19| ((% (|Boolean|)))
        (SEQ
         (COND
          ((SPADCALL (QREFELT % 100))
           (COND
            ((SPADCALL (QREFELT % 101))
             (SEQ (SPADCALL "this is a Lie algebra" (QREFELT % 44)) (EXIT 'T)))
            (#1='T
             (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT % 44))
                  (EXIT NIL)))))
          (#1#
           (SEQ (SPADCALL "this is not a Lie algebra" (QREFELT % 44))
                (EXIT NIL)))))) 

(SDEFUN |FINAALG-;jordanAlgebra?;B;20| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G301 NIL) (#2=#:G302 NIL) (#3=#:G306 NIL) (|l| NIL)
          (#4=#:G305 NIL) (|k| NIL) (#5=#:G304 NIL) (|j| NIL) (#6=#:G303 NIL)
          (|i| NIL) (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (EXIT
                 (COND
                  ((QEQCAR
                    (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 46))
                              (QREFELT % 48))
                    1)
                   (SEQ
                    (SPADCALL
                     "this is not a Jordan algebra, as 2 is not invertible in the ground ring"
                     (QREFELT % 44))
                    (EXIT NIL)))
                  ((SPADCALL (QREFELT % 103))
                   (SEQ
                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                         (COND ((|greater_SI| |i| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #5# |n|) G190
                                (COND ((|greater_SI| |j| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SEQ (LETT |k| 1) (LETT #4# |n|) G190
                                       (COND
                                        ((|greater_SI| |k| #4#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |l| 1) (LETT #3# |n|) G190
                                              (COND
                                               ((|greater_SI| |l| #3#)
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
                                                       (QREFELT % 97))
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
                                                       (QREFELT % 97))
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
                                                      (QREFELT % 97))
                                                     (QREFELT % 38))
                                                    (QREFELT % 40)))
                                                  (PROGN
                                                   (LETT #1#
                                                         (SEQ
                                                          (SPADCALL
                                                           "not a Jordan algebra"
                                                           (QREFELT % 44))
                                                          (EXIT
                                                           (PROGN
                                                            (LETT #2# NIL)
                                                            (GO #7=#:G300)))))
                                                   (GO #8=#:G293))))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL)))
                                        #8# (EXIT #1#))
                                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL "this is a Jordan algebra" (QREFELT % 44))
                    (EXIT 'T)))
                  ('T
                   (SEQ
                    (SPADCALL "this is not a Jordan algebra" (QREFELT % 44))
                    (EXIT NIL)))))))
          #7# (EXIT #2#)))) 

(SDEFUN |FINAALG-;noncommutativeJordanAlgebra?;B;21| ((% (|Boolean|)))
        (SEQ
         (COND
          ((QEQCAR
            (SPADCALL (SPADCALL 2 (|spadConstant| % 21) (QREFELT % 46))
                      (QREFELT % 48))
            1)
           (SEQ
            (SPADCALL
             "this is not a noncommutative Jordan algebra, as 2 is not invertible in the ground ring"
             (QREFELT % 44))
            (EXIT NIL)))
          ((SPADCALL (QREFELT % 105))
           (COND
            ((SPADCALL (QREFELT % 106))
             (SEQ
              (SPADCALL "this is a noncommutative Jordan algebra"
                        (QREFELT % 44))
              (EXIT 'T)))
            (#1='T
             (SEQ
              (SPADCALL
               "this is not a noncommutative Jordan algebra, as it is not Jordan admissible"
               (QREFELT % 44))
              (EXIT NIL)))))
          (#1#
           (SEQ
            (SPADCALL
             "this is not a noncommutative Jordan algebra, as it is not flexible"
             (QREFELT % 44))
            (EXIT NIL)))))) 

(SDEFUN |FINAALG-;antiCommutative?;B;22| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G324 NIL) (#2=#:G325 NIL) (#3=#:G327 NIL) (|j| NIL)
          (#4=#:G326 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |i|) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
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
                                 (LETT #1#
                                       (SEQ
                                        (SPADCALL
                                         "algebra is not anti-commutative"
                                         (QREFELT % 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #5=#:G323)))))
                                 (GO #6=#:G320))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is anti-commutative" (QREFELT % 44))
                (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;commutative?;B;23| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G336 NIL) (#2=#:G337 NIL) (#3=#:G339 NIL) (|j| NIL)
          (#4=#:G338 NIL) (|i| NIL) (|n| (|PositiveInteger|))
          (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                     (COND ((|greater_SI| |i| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #3# |n|) G190
                            (COND ((> |j| #3#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |b| |i| (QREFELT % 36))
                                            (SPADCALL |b| |j| (QREFELT % 36))
                                            (QREFELT % 51))
                                  (QREFELT % 40)))
                                (PROGN
                                 (LETT #1#
                                       (SEQ
                                        (SPADCALL "algebra is not commutative"
                                                  (QREFELT % 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #5=#:G335)))))
                                 (GO #6=#:G332))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                      #6# (EXIT #1#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is commutative" (QREFELT % 44)) (EXIT 'T)))
          #5# (EXIT #2#)))) 

(SDEFUN |FINAALG-;associative?;B;24| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G350 NIL) (#2=#:G351 NIL) (#3=#:G354 NIL) (|k| NIL)
          (#4=#:G353 NIL) (|j| NIL) (#5=#:G352 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                          (QREFELT % 97))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not associative"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G349)))))
                                        (GO #7=#:G345))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra is associative" (QREFELT % 44)) (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftAlternative?;B;25| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G365 NIL) (#2=#:G366 NIL) (#3=#:G369 NIL) (|k| NIL)
          (#4=#:G368 NIL) (|j| NIL) (#5=#:G367 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                           (QREFELT % 97))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not left alternative"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G364)))))
                                        (GO #7=#:G360))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,a,b) = 0"
                          (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;rightAlternative?;B;26| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G380 NIL) (#2=#:G381 NIL) (#3=#:G384 NIL) (|k| NIL)
          (#4=#:G383 NIL) (|j| NIL) (#5=#:G382 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                           (QREFELT % 97))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not right alternative"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G379)))))
                                        (GO #7=#:G375))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,b,b) = 0"
                          (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;flexible?;B;27| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G395 NIL) (#2=#:G396 NIL) (#3=#:G399 NIL) (|k| NIL)
          (#4=#:G398 NIL) (|j| NIL) (#5=#:G397 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                           (QREFELT % 97))
                                          (SPADCALL
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not flexible"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6=#:G394)))))
                                        (GO #7=#:G390))))))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL)))
                             #7# (EXIT #1#))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL "algebra satisfies 2*associator(a,b,a) = 0"
                          (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;alternative?;B;28| ((% (|Boolean|)))
        (SPROG
         ((#1=#:G412 NIL) (#2=#:G413 NIL) (#3=#:G416 NIL) (|k| NIL)
          (#4=#:G415 NIL) (|j| NIL) (#5=#:G414 NIL) (|i| NIL)
          (|n| (|PositiveInteger|)) (|b| (|Vector| S)))
         (SEQ
          (EXIT
           (SEQ (LETT |b| (SPADCALL (QREFELT % 11)))
                (LETT |n| (SPADCALL (QREFELT % 9)))
                (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                            (COND ((|greater_SI| |j| #4#) (GO G191)))
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
                                           (QREFELT % 97))
                                          (SPADCALL
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (SEQ
                                        (SPADCALL "algebra is not alternative"
                                                  (QREFELT % 44))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# NIL)
                                          (GO #6=#:G411)))))
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (SPADCALL
                                           (SPADCALL |b| |i| (QREFELT % 36))
                                           (SPADCALL |b| |k| (QREFELT % 36))
                                           (SPADCALL |b| |j| (QREFELT % 36))
                                           (QREFELT % 97))
                                          (QREFELT % 38))
                                         (QREFELT % 40)))
                                       (PROGN
                                        (LETT #1#
                                              (SEQ
                                               (SPADCALL
                                                "algebra is not alternative"
                                                (QREFELT % 44))
                                               (EXIT
                                                (PROGN
                                                 (LETT #2# NIL)
                                                 (GO #6#)))))
                                        (GO #7=#:G406)))))
                                    #7# (EXIT #1#))
                                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (SPADCALL
                 "algebra satisfies 2*associator(a,b,b) = 0 =  2*associator(a,a,b) = 0"
                 (QREFELT % 44))
                (EXIT 'T)))
          #6# (EXIT #2#)))) 

(SDEFUN |FINAALG-;leftDiscriminant;VR;29| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 115)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;rightDiscriminant;VR;30| ((|v| (|Vector| S)) (% (R)))
        (SPADCALL (SPADCALL |v| (QREFELT % 117)) (QREFELT % 32))) 

(SDEFUN |FINAALG-;coordinates;2VM;31|
        ((|v| (|Vector| S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G423 NIL) (|i| NIL) (|j| NIL) (|m| (|Matrix| R)))
               (SEQ
                (LETT |m|
                      (MAKE_MATRIX1 (QVSIZE |v|) (QVSIZE |b|)
                                    (|spadConstant| % 28)))
                (SEQ (LETT |j| (PROGN |m| 1))
                     (LETT |i| (SPADCALL |v| (QREFELT % 119)))
                     (LETT #1# (QVSIZE |v|)) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |m| |j|
                                 (SPADCALL (QAREF1O |v| |i| 1) |b|
                                           (QREFELT % 71))
                                 (QREFELT % 120))))
                     (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |m|)))) 

(SDEFUN |FINAALG-;represents;VVS;32|
        ((|v| (|Vector| R)) (|b| (|Vector| S)) (% (S)))
        (SPROG
         ((#1=#:G430 NIL) (#2=#:G432 NIL) (|i| NIL) (#3=#:G431 NIL)
          (|m| (|Integer|)))
         (SEQ (LETT |m| (- (SPADCALL |v| (QREFELT % 122)) 1))
              (EXIT
               (SPADCALL (ELT % 38)
                         (PROGN
                          (LETT #3# (GETREFV #4=(QVSIZE |b|)))
                          (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                               (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SETELT #3# #1#
                                         (SPADCALL
                                          (SPADCALL |v| (+ |i| |m|)
                                                    (QREFELT % 72))
                                          (SPADCALL |b| (+ |i| |m|)
                                                    (QREFELT % 36))
                                          (QREFELT % 83)))))
                               (LETT #1#
                                     (PROG1 (|inc_SI| #1#)
                                       (LETT |i| (|inc_SI| |i|))))
                               (GO G190) G191 (EXIT NIL))
                          #3#)
                         (QREFELT % 85)))))) 

(SDEFUN |FINAALG-;leftTraceMatrix;VM;33| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G441 NIL) (|j| NIL) (#2=#:G440 NIL) (#3=#:G439 NIL) (|i| NIL)
          (#4=#:G438 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 119)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 119)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 124))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT % 126))))) 

(SDEFUN |FINAALG-;rightTraceMatrix;VM;34| ((|v| (|Vector| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G450 NIL) (|j| NIL) (#2=#:G449 NIL) (#3=#:G448 NIL) (|i| NIL)
          (#4=#:G447 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 119)))
                 (LETT #3# (QVSIZE |v|)) G190 (COND ((> |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 119)))
                                (LETT #1# (QVSIZE |v|)) G190
                                (COND ((> |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 36))
                                           (SPADCALL |v| |j| (QREFELT % 36))
                                           (QREFELT % 37))
                                          (QREFELT % 128))
                                         #2#))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT (NREVERSE #4#))))
           (QREFELT % 126))))) 

(SDEFUN |FINAALG-;leftRegularRepresentation;SVM;35|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G458 NIL) (|i| NIL) (#2=#:G457 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 119)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |x|
                                                  (SPADCALL |b| (+ |i| |m|)
                                                            (QREFELT % 36))
                                                  (QREFELT % 37))
                                        |b| (QREFELT % 71))
                                       (QREFELT % 131))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 126))
                      (QREFELT % 132)))))) 

(SDEFUN |FINAALG-;rightRegularRepresentation;SVM;36|
        ((|x| (S)) (|b| (|Vector| S)) (% (|Matrix| R)))
        (SPROG ((#1=#:G466 NIL) (|i| NIL) (#2=#:G465 NIL) (|m| (|Integer|)))
               (SEQ (LETT |m| (- (SPADCALL |b| (QREFELT % 119)) 1))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 9)))
                             G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |b| (+ |i| |m|)
                                                   (QREFELT % 36))
                                         |x| (QREFELT % 37))
                                        |b| (QREFELT % 71))
                                       (QREFELT % 131))
                                      #2#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 126))
                      (QREFELT % 132)))))) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra&;|)) 

(DEFUN |FiniteRankNonAssociativeAlgebra&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FiniteRankNonAssociativeAlgebra&| DV$1 DV$2))
          (LETT % (GETREFV 135))
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
             (QSETREFV % 86
                       (CONS (|dispatchFunction| |FINAALG-;leftRecip;SU;12|)
                             %))
             (QSETREFV % 88
                       (CONS (|dispatchFunction| |FINAALG-;rightRecip;SU;13|)
                             %))
             (QSETREFV % 92
                       (CONS (|dispatchFunction| |FINAALG-;recip;SU;14|) %))
             (QSETREFV % 95
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;leftMinimalPolynomial;SSup;15|)
                        %))
             (QSETREFV % 96
                       (CONS
                        (|dispatchFunction|
                         |FINAALG-;rightMinimalPolynomial;SSup;16|)
                        %))
             (QSETREFV % 98
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
              (33 . |One|) (37 . -) (43 . |setelt!|) (51 . |determinant|)
              (56 . |leftCharacteristicPolynomial|)
              (61 . |rightRegularRepresentation|)
              (67 . |rightCharacteristicPolynomial|) (72 . |Zero|) (76 . +)
              |FINAALG-;leftTrace;SR;3| |FINAALG-;rightTrace;SR;4|
              (82 . |determinant|) |FINAALG-;leftNorm;SR;5|
              |FINAALG-;rightNorm;SR;6| (|Vector| 6) (87 . |elt|) (93 . *)
              (99 . +) (|Boolean|) (105 . |zero?|) (|Void|) (|String|)
              (|OutputForm|) (110 . |messagePrint|)
              |FINAALG-;antiAssociative?;B;7| (115 . *) (|Union| % '"failed")
              (121 . |recip|) (126 . |antiCommutator|)
              |FINAALG-;jordanAdmissible?;B;8| (132 . |commutator|)
              |FINAALG-;lieAdmissible?;B;9| (|Vector| 12)
              (138 . |structuralConstants|) (|Symbol|) (143 . |coerce|)
              (|Vector| 55) (148 . |elt|) (|Polynomial| 7) (154 . |One|)
              (158 . -) (|List| 55) (|List| 14) (163 . |monomial|)
              (170 . |elt|) (176 . |coerce|) (181 . +) (|List| 59)
              |FINAALG-;conditionsForIdempotents;VL;10| (|Vector| 7)
              (187 . |coordinates|) (193 . |elt|) (199 . |setelt!|)
              |FINAALG-;structuralConstants;VV;11| (207 . |leftUnit|)
              (211 . |coerce|) (216 . |rank|) (221 . |horizConcat|) (|List| 70)
              (227 . |nullSpace|) (232 . -) (237 . *) (243 . *)
              (|Mapping| 6 6 6) (249 . |reduce|) (255 . |leftRecip|)
              (260 . |rightUnit|) (264 . |rightRecip|) (269 . |leftRecip|)
              (274 . |rightRecip|) (279 . ~=) (285 . |recip|) (290 . |Zero|)
              (294 . +) (300 . |leftMinimalPolynomial|)
              (305 . |rightMinimalPolynomial|) (310 . |associator|)
              (317 . |associatorDependence|) |FINAALG-;jacobiIdentity?;B;18|
              (321 . |antiCommutative?|) (325 . |jacobiIdentity?|)
              |FINAALG-;lieAlgebra?;B;19| (329 . |commutative?|)
              |FINAALG-;jordanAlgebra?;B;20| (333 . |flexible?|)
              (337 . |jordanAdmissible?|)
              |FINAALG-;noncommutativeJordanAlgebra?;B;21|
              |FINAALG-;antiCommutative?;B;22| |FINAALG-;commutative?;B;23|
              |FINAALG-;associative?;B;24| |FINAALG-;leftAlternative?;B;25|
              |FINAALG-;rightAlternative?;B;26| |FINAALG-;flexible?;B;27|
              |FINAALG-;alternative?;B;28| (341 . |leftTraceMatrix|)
              |FINAALG-;leftDiscriminant;VR;29| (346 . |rightTraceMatrix|)
              |FINAALG-;rightDiscriminant;VR;30| (351 . |minIndex|)
              (356 . |setRow!|) |FINAALG-;coordinates;2VM;31|
              (363 . |minIndex|) |FINAALG-;represents;VVS;32|
              (368 . |leftTrace|) (|List| 130) (373 . |matrix|)
              |FINAALG-;leftTraceMatrix;VM;33| (378 . |rightTrace|)
              |FINAALG-;rightTraceMatrix;VM;34| (|List| 7) (383 . |parts|)
              (388 . |transpose|) |FINAALG-;leftRegularRepresentation;SVM;35|
              |FINAALG-;rightRegularRepresentation;SVM;36|)
           '#(|structuralConstants| 393 |rightTraceMatrix| 398 |rightTrace| 403
              |rightRegularRepresentation| 408 |rightRecip| 414 |rightNorm| 419
              |rightMinimalPolynomial| 424 |rightDiscriminant| 429
              |rightCharacteristicPolynomial| 434 |rightAlternative?| 439
              |represents| 443 |recip| 449 |noncommutativeJordanAlgebra?| 454
              |lieAlgebra?| 458 |lieAdmissible?| 462 |leftTraceMatrix| 466
              |leftTrace| 471 |leftRegularRepresentation| 476 |leftRecip| 482
              |leftNorm| 487 |leftMinimalPolynomial| 492 |leftDiscriminant| 497
              |leftCharacteristicPolynomial| 502 |leftAlternative?| 507
              |jordanAlgebra?| 511 |jordanAdmissible?| 515 |jacobiIdentity?|
              519 |flexible?| 523 |coordinates| 527 |conditionsForIdempotents|
              533 |commutative?| 538 |associatorDependence| 542 |associative?|
              546 |antiCommutative?| 550 |antiAssociative?| 554 |alternative?|
              558)
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
                        (|makeByteWordVec2| 134
                                            '(0 6 8 9 0 6 10 11 2 6 12 0 10 13
                                              2 15 0 14 14 16 3 12 7 0 17 17 18
                                              2 19 0 7 14 20 0 7 0 21 2 19 0 0
                                              0 22 4 15 19 0 17 17 19 23 1 15
                                              19 0 24 1 0 19 0 25 2 6 12 0 10
                                              26 1 0 19 0 27 0 7 0 28 2 7 0 0 0
                                              29 1 12 7 0 32 2 35 6 0 17 36 2 6
                                              0 0 0 37 2 6 0 0 0 38 1 6 39 0 40
                                              1 43 41 42 44 2 7 0 8 0 46 1 7 47
                                              0 48 2 6 0 0 0 49 2 6 0 0 0 51 1
                                              6 53 10 54 1 55 0 42 56 2 57 55 0
                                              17 58 0 59 0 60 1 59 0 0 61 3 59
                                              0 0 62 63 64 2 53 12 0 17 65 1 59
                                              0 7 66 2 59 0 0 0 67 2 6 70 0 10
                                              71 2 70 7 0 17 72 4 12 7 0 17 17
                                              7 73 0 6 47 75 1 12 0 70 76 1 12
                                              14 0 77 2 12 0 0 0 78 1 12 79 0
                                              80 1 7 0 0 81 2 7 0 0 0 82 2 6 0
                                              7 0 83 2 35 6 84 0 85 1 0 47 0 86
                                              0 6 47 87 1 0 47 0 88 1 6 47 0 89
                                              1 6 47 0 90 2 6 39 0 0 91 1 0 47
                                              0 92 0 19 0 93 2 19 0 0 0 94 1 0
                                              19 0 95 1 0 19 0 96 3 6 0 0 0 0
                                              97 0 0 79 98 0 6 39 100 0 6 39
                                              101 0 6 39 103 0 6 39 105 0 6 39
                                              106 1 6 12 10 115 1 6 12 10 117 1
                                              35 17 0 119 3 12 0 0 17 70 120 1
                                              70 17 0 122 1 6 7 0 124 1 12 0
                                              125 126 1 6 7 0 128 1 70 130 0
                                              131 1 12 0 0 132 1 0 53 10 74 1 0
                                              12 10 129 1 0 7 0 31 2 0 12 0 10
                                              134 1 0 47 0 88 1 0 7 0 34 1 0 19
                                              0 96 1 0 7 10 118 1 0 19 0 27 0 0
                                              39 112 2 0 0 70 10 123 1 0 47 0
                                              92 0 0 39 107 0 0 39 102 0 0 39
                                              52 1 0 12 10 127 1 0 7 0 30 2 0
                                              12 0 10 133 1 0 47 0 86 1 0 7 0
                                              33 1 0 19 0 95 1 0 7 10 116 1 0
                                              19 0 25 0 0 39 111 0 0 39 104 0 0
                                              39 50 0 0 39 99 0 0 39 113 2 0 12
                                              10 10 121 1 0 68 10 69 0 0 39 109
                                              0 0 79 98 0 0 39 110 0 0 39 108 0
                                              0 39 45 0 0 39 114)))))
           '|lookupComplete|)) 
