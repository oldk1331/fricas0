
(SDEFUN |STTAYLOR;zro| ((% (|Stream| A))) (SPADCALL (QREFELT % 8))) 

(SDEFUN |STTAYLOR;revSum| ((|ra| (|Stream| A)) (|rvc| (|List| A)) (% (A)))
        (SPROG ((|cc| (A)) (#1=#:G46 NIL) (|c| NIL))
               (SEQ (LETT |cc| (|spadConstant| % 9))
                    (SEQ (LETT |c| NIL) (LETT #1# |rvc|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)
                               (NULL (NULL (SPADCALL |ra| (QREFELT % 11)))))
                           (GO G191)))
                         (SEQ
                          (LETT |cc|
                                (SPADCALL |cc|
                                          (SPADCALL |c|
                                                    (SPADCALL |ra|
                                                              (QREFELT % 12))
                                                    (QREFELT % 13))
                                          (QREFELT % 14)))
                          (EXIT (LETT |ra| (SPADCALL |ra| (QREFELT % 15)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |cc|)))) 

(SDEFUN |STTAYLOR;restRecip|
        ((|a| (|Stream| A)) (|u| (A)) (|n| (|Integer|)) (|k| (|Integer|))
         (|ra| (|Stream| A)) (|revc| (|List| A)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;restRecip!0|
                       (VECTOR |k| |n| |a| |u| |revc| % |ra|))
                 (QREFELT % 29))))) 

(SDEFUN |STTAYLOR;restRecip!0| (($$ NIL))
        (PROG (|ra| % |revc| |u| |a| |n| |k|)
          (LETT |ra| (QREFELT $$ 6))
          (LETT % (QREFELT $$ 5))
          (LETT |revc| (QREFELT $$ 4))
          (LETT |u| (QREFELT $$ 3))
          (LETT |a| (QREFELT $$ 2))
          (LETT |n| (QREFELT $$ 1))
          (LETT |k| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|cn| NIL) (|i| NIL) (#1=#:G63 NIL) (|rvc| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |ra| (QREFELT % 11)) (SPADCALL (QREFELT % 8)))
                     ('T
                      (SEQ (LETT |rvc| |revc|)
                           (LETT |cn|
                                 (SPADCALL |u| (|STTAYLOR;revSum| |ra| |rvc| %)
                                           (QREFELT % 13)))
                           (EXIT
                            (COND
                             ((SPADCALL |cn| (QREFELT % 16))
                              (SPADCALL |cn|
                                        (|STTAYLOR;restRecip| |a| |u|
                                         (SPADCALL |n| (|spadConstant| % 23)
                                                   (QREFELT % 20))
                                         |k| (SPADCALL |ra| (QREFELT % 15))
                                         |rvc| %)
                                        (QREFELT % 21)))
                             ('T
                              (SEQ
                               (SEQ (LETT |i| |k|)
                                    (LETT #1#
                                          (SPADCALL |n| (|spadConstant| % 23)
                                                    (QREFELT % 24)))
                                    G190 (COND ((> |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |rvc|
                                            (SPADCALL (|spadConstant| % 9)
                                                      |rvc| (QREFELT % 27)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL |cn|
                                          (|STTAYLOR;restRecip| |a| |u|
                                           (SPADCALL |n| (|spadConstant| % 23)
                                                     (QREFELT % 20))
                                           (SPADCALL |n| (|spadConstant| % 23)
                                                     (QREFELT % 20))
                                           |a|
                                           (SPADCALL |cn| |rvc| (QREFELT % 27))
                                           %)
                                          (QREFELT % 21)))))))))))))))) 

(SDEFUN |STTAYLOR;recip;SU;4|
        ((|x| (|Stream| A)) (% (|Union| (|Stream| A) "failed")))
        (SPROG ((|c0| (A)) (|ua| (|Union| A "failed")))
               (SEQ
                (COND ((SPADCALL |x| (QREFELT % 11)) (CONS 1 "failed"))
                      (#1='T
                       (SEQ
                        (LETT |ua|
                              (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                        (QREFELT % 31)))
                        (EXIT
                         (COND ((QEQCAR |ua| 1) (CONS 1 "failed"))
                               (#1#
                                (SEQ (LETT |c0| (QCDR |ua|))
                                     (EXIT
                                      (CONS 0
                                            (SPADCALL |c0|
                                                      (|STTAYLOR;restRecip|
                                                       (SPADCALL |x|
                                                                 (QREFELT %
                                                                          15))
                                                       (SPADCALL |c0|
                                                                 (QREFELT %
                                                                          32))
                                                       1 1
                                                       (SPADCALL |x|
                                                                 (QREFELT %
                                                                          15))
                                                       (LIST |c0|) %)
                                                      (QREFELT %
                                                               21)))))))))))))) 

(SDEFUN |STTAYLOR;restDiv|
        ((|a| (|Stream| A)) (|u| (A)) (|n| (|Integer|)) (|k| (|Integer|))
         (|ra| (|Stream| A)) (|b| (|Stream| A)) (|revc| (|List| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;restDiv!0|
                       (VECTOR |revc| |ra| |k| |n| |u| |a| % |b|))
                 (QREFELT % 29))))) 

(SDEFUN |STTAYLOR;restDiv!0| (($$ NIL))
        (PROG (|b| % |a| |u| |n| |k| |ra| |revc|)
          (LETT |b| (QREFELT $$ 7))
          (LETT % (QREFELT $$ 6))
          (LETT |a| (QREFELT $$ 5))
          (LETT |u| (QREFELT $$ 4))
          (LETT |n| (QREFELT $$ 3))
          (LETT |k| (QREFELT $$ 2))
          (LETT |ra| (QREFELT $$ 1))
          (LETT |revc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|cn| NIL) (|i| NIL) (#1=#:G94 NIL) (|rvc| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |b| (QREFELT % 11))
                      (|STTAYLOR;restRecip| |a| |u| |n| |k| |ra| |revc| %))
                     ('T
                      (SEQ (LETT |rvc| |revc|)
                           (LETT |cn|
                                 (SPADCALL
                                  (SPADCALL (|STTAYLOR;revSum| |ra| |rvc| %)
                                            (SPADCALL |b| (QREFELT % 12))
                                            (QREFELT % 35))
                                  |u| (QREFELT % 13)))
                           (EXIT
                            (COND
                             ((SPADCALL |cn| (QREFELT % 16))
                              (SPADCALL |cn|
                                        (|STTAYLOR;restDiv| |a| |u|
                                         (SPADCALL |n| (|spadConstant| % 37)
                                                   (QREFELT % 20))
                                         |k| (SPADCALL |ra| (QREFELT % 15))
                                         (SPADCALL |b| (QREFELT % 15)) |rvc| %)
                                        (QREFELT % 21)))
                             ('T
                              (SEQ
                               (SEQ (LETT |i| |k|)
                                    (LETT #1#
                                          (SPADCALL |n| (|spadConstant| % 37)
                                                    (QREFELT % 24)))
                                    G190 (COND ((> |i| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |rvc|
                                            (SPADCALL (|spadConstant| % 9)
                                                      |rvc| (QREFELT % 27)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (SPADCALL |cn|
                                          (|STTAYLOR;restDiv| |a| |u|
                                           (SPADCALL |n| (|spadConstant| % 37)
                                                     (QREFELT % 20))
                                           (SPADCALL |n| (|spadConstant| % 37)
                                                     (QREFELT % 20))
                                           |a| (SPADCALL |b| (QREFELT % 15))
                                           (SPADCALL |cn| |rvc| (QREFELT % 27))
                                           %)
                                          (QREFELT % 21)))))))))))))))) 

(SDEFUN |STTAYLOR;exquo;2SU;6|
        ((|x| (|Stream| A)) (|y| (|Stream| A))
         (% (|Union| (|Stream| A) "failed")))
        (SPROG
         ((|c0| (A)) (|u| (A)) (|ua| (|Union| A "failed")) (#1=#:G113 NIL)
          (#2=#:G112 NIL) (|n| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (EXIT
              (SEQ (LETT |n| 1) G190 (COND ((|greater_SI| |n| 1000) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |y| (QREFELT % 11))
                       (PROGN (LETT #1# (CONS 1 "failed")) (GO #3=#:G111)))
                      ((SPADCALL |x| (QREFELT % 11))
                       (PROGN
                        (LETT #1# (CONS 0 (SPADCALL (QREFELT % 8))))
                        (GO #3#)))
                      ((NULL
                        (SPADCALL (SPADCALL |y| (QREFELT % 12))
                                  (QREFELT % 16)))
                       (PROGN (LETT #2# |$NoValue|) (GO #4=#:G105)))
                      ((NULL
                        (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                  (QREFELT % 16)))
                       (PROGN (LETT #1# (CONS 1 "failed")) (GO #3#)))
                      ('T
                       (SEQ (LETT |x| (SPADCALL |x| (QREFELT % 15)))
                            (EXIT
                             (LETT |y| (SPADCALL |y| (QREFELT % 15)))))))))
                   (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL)))
             #4# (EXIT #2#))
            (LETT |ua| (SPADCALL (SPADCALL |y| (QREFELT % 12)) (QREFELT % 31)))
            (EXIT
             (COND ((QEQCAR |ua| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |u| (QCDR |ua|))
                         (LETT |c0|
                               (SPADCALL (SPADCALL |x| (QREFELT % 12)) |u|
                                         (QREFELT % 13)))
                         (EXIT
                          (CONS 0
                                (SPADCALL |c0|
                                          (|STTAYLOR;restDiv|
                                           (SPADCALL |y| (QREFELT % 15))
                                           (SPADCALL |u| (QREFELT % 32)) 1 1
                                           (SPADCALL |y| (QREFELT % 15))
                                           (SPADCALL |x| (QREFELT % 15))
                                           (LIST |c0|) %)
                                          (QREFELT % 21))))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |STTAYLOR;/;3S;7|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;/;3S;7!0| (VECTOR |x| % |y|))
                          (QREFELT % 29))))) 

(SDEFUN |STTAYLOR;/;3S;7!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|ua| NIL) (|u| NIL) (|c0| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |y| (QREFELT % 11))
                      (|error| "/: division by zero"))
                     ((SPADCALL |x| (QREFELT % 11)) (SPADCALL (QREFELT % 8)))
                     ('T
                      (SEQ
                       (LETT |ua|
                             (SPADCALL (SPADCALL |y| (QREFELT % 12))
                                       (QREFELT % 31)))
                       (EXIT
                        (COND
                         ((QEQCAR |ua| 1)
                          (|error| "/: second argument is not invertible"))
                         ('T
                          (SEQ (LETT |u| (QCDR |ua|))
                               (LETT |c0|
                                     (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                               |u| (QREFELT % 13)))
                               (EXIT
                                (SPADCALL |c0|
                                          (|STTAYLOR;restDiv|
                                           (SPADCALL |y| (QREFELT % 15))
                                           (SPADCALL |u| (QREFELT % 32))
                                           (|spadConstant| % 37)
                                           (|spadConstant| % 37)
                                           (SPADCALL |y| (QREFELT % 15))
                                           (SPADCALL |x| (QREFELT % 15))
                                           (LIST |c0|) %)
                                          (QREFELT % 21)))))))))))))))) 

(SDEFUN |STTAYLOR;rp| ((|z| (|Integer|)) (|s| (A)) (% (|List| A)))
        (COND ((<= |z| 0) NIL) ('T (CONS |s| (|STTAYLOR;rp| (- |z| 1) |s| %))))) 

(SDEFUN |STTAYLOR;rpSt| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rpSt!0| (VECTOR |s| % |z|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;rpSt!0| (($$ NIL))
        (PROG (|z| % |s|)
          (LETT |z| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |s| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43))
              (SPADCALL (QREFELT % 8)))
             ('T
              (SPADCALL |s|
                        (|STTAYLOR;rpSt|
                         (SPADCALL |z| (|spadConstant| % 19) (QREFELT % 24))
                         |s| %)
                        (QREFELT % 21)))))))) 

(SDEFUN |STTAYLOR;lagrangere|
        ((|x| (|Stream| A)) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrangere!0| (VECTOR |c| |x| %))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;lagrangere!0| (($$ NIL))
        (PROG (% |x| |c|)
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |c| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 9) (SPADCALL |x| |c| (QREFELT % 44))
                      (QREFELT % 21)))))) 

(SDEFUN |STTAYLOR;lagrange;2S;11| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lagrange;2S;11!0| (VECTOR % |x|))
                         (QREFELT % 47)))) 

(SDEFUN |STTAYLOR;lagrange;2S;11!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;lagrangere| |x| |y| %))))) 

(SDEFUN |STTAYLOR;revert;2S;12| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG ((|y| (|Union| (|Stream| A) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 11))
                  (|error| "revert: should be nonzero"))
                 ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 16))
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 11))
                    (|error| "revert: should be nonzero"))
                   (#1='T
                    (SEQ
                     (LETT |y|
                           (SPADCALL (SPADCALL |x| (QREFELT % 15))
                                     (QREFELT % 34)))
                     (EXIT
                      (COND
                       ((QEQCAR |y| 0) (SPADCALL (QCDR |y|) (QREFELT % 48)))
                       (#1#
                        (|error|
                         "revert: should start 0, x, ... with invertible x"))))))))
                 (#1# (|error| "revert: should start 0, x, ...")))))) 

(SDEFUN |STTAYLOR;prodiag1|
        ((|ststa| (|Stream| (|Stream| A))) (|n| (|Integer|)) (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|STTAYLOR;prodiag1!0| (VECTOR |n| % |ststa|))
                          (QREFELT % 29))))) 

(SDEFUN |STTAYLOR;prodiag1!0| (($$ NIL))
        (PROG (|ststa| % |n|)
          (LETT |ststa| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f1| NIL) (|r1| NIL) (|p1| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |ststa| (QREFELT % 51)) (|STTAYLOR;zro| %))
                     ('T
                      (SEQ (LETT |f1| (SPADCALL |ststa| (QREFELT % 52)))
                           (LETT |r1| (SPADCALL |ststa| (QREFELT % 53)))
                           (LETT |p1|
                                 (|STTAYLOR;prodiag1| |r1|
                                  (SPADCALL |n| (|spadConstant| % 37)
                                            (QREFELT % 20))
                                  %))
                           (EXIT
                            (COND
                             ((SPADCALL |f1| (QREFELT % 11))
                              (SPADCALL (|spadConstant| % 9) |p1|
                                        (QREFELT % 21)))
                             ('T
                              (SPADCALL (SPADCALL |f1| (QREFELT % 12))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f1| (QREFELT % 15)) |p1|
                                          (QREFELT % 54))
                                         (SPADCALL
                                          (|STTAYLOR;rpSt| |n|
                                           (|spadConstant| % 9) %)
                                          (SPADCALL |f1| |p1| (QREFELT % 55))
                                          (QREFELT % 56))
                                         (QREFELT % 54))
                                        (QREFELT % 21)))))))))))))) 

(SDEFUN |STTAYLOR;prodiag;SS;14|
        ((|ststa| (|Stream| (|Stream| A))) (% (|Stream| A)))
        (SPADCALL (|spadConstant| % 17) (|STTAYLOR;prodiag1| |ststa| 1 %)
                  (QREFELT % 21))) 

(SDEFUN |STTAYLOR;rptg1| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPADCALL (CONS |s| (|STTAYLOR;rp| |z| (|spadConstant| % 9) %))
                  (QREFELT % 58))) 

(SDEFUN |STTAYLOR;rptg2| ((|z| (|Integer|)) (|s| (A)) (% (|Stream| A)))
        (SPADCALL
         (SPADCALL (|STTAYLOR;rp| |z| (|spadConstant| % 9) %)
                   (CONS |s| (|STTAYLOR;rp| (- |z| 1) (|spadConstant| % 9) %))
                   (QREFELT % 59))
         (QREFELT % 58))) 

(SDEFUN |STTAYLOR;rptg3|
        ((|a| (|Integer|)) (|d| (|Integer|)) (|n| (|Integer|)) (|s| (A))
         (% (|Stream| A)))
        (SPADCALL (|STTAYLOR;rpSt| (* |n| (- |a| 1)) (|spadConstant| % 9) %)
                  (SPADCALL
                   (CONS |s|
                         (|STTAYLOR;rp| (- (* |d| |n|) 1) (|spadConstant| % 9)
                          %))
                   (QREFELT % 58))
                  (QREFELT % 56))) 

(SDEFUN |STTAYLOR;lambert;2S;18| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;lambert;2S;18!0| (VECTOR % |x|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;lambert;2S;18!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 16))
                   (SPADCALL (|spadConstant| % 9)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) %)
                                        (SPADCALL (|spadConstant| % 42)
                                                  (QREFELT % 61))
                                        (SPADCALL |x| (QREFELT % 15))
                                        (QREFELT % 64))
                              (QREFELT % 65))
                             (QREFELT % 21)))
                  ('T
                   (|error| "lambert:constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;oddlambert;2S;19| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;oddlambert;2S;19!0| (VECTOR % |x|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;oddlambert;2S;19!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 16))
                   (SPADCALL (|spadConstant| % 9)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg1|) %)
                                        (SPADCALL (|spadConstant| % 19)
                                                  (QREFELT % 67))
                                        (SPADCALL |x| (QREFELT % 15))
                                        (QREFELT % 64))
                              (QREFELT % 65))
                             (QREFELT % 21)))
                  ('T
                   (|error|
                    "oddlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;evenlambert;2S;20| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;evenlambert;2S;20!0| (VECTOR % |x|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;evenlambert;2S;20!0| (($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 16))
                   (SPADCALL (|spadConstant| % 9)
                             (SPADCALL
                              (SPADCALL (CONS (|function| |STTAYLOR;rptg2|) %)
                                        (SPADCALL (|spadConstant| % 19)
                                                  (QREFELT % 61))
                                        (SPADCALL |x| (QREFELT % 15))
                                        (QREFELT % 64))
                              (QREFELT % 65))
                             (QREFELT % 21)))
                  ('T
                   (|error|
                    "evenlambert: constant coefficient should be zero"))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;21|
        ((|st| (|Stream| A)) (|a| (|Integer|)) (|d| (|Integer|))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|STTAYLOR;generalLambert;S2IS;21!1|
                      (VECTOR |st| |d| % |a|))
                (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;21!1| (($$ NIL))
        (PROG (|a| % |d| |st|)
          (LETT |a| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT |st| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((OR (SPADCALL |a| (|spadConstant| % 19) (QREFELT % 70))
                         (SPADCALL |d| (|spadConstant| % 19) (QREFELT % 70)))
                     (|error|
                      "generalLambert: both integer arguments must be positive"))
                    ('T
                     (COND ((SPADCALL |st| (QREFELT % 11)) (|STTAYLOR;zro| %))
                           ((SPADCALL (SPADCALL |st| (QREFELT % 12))
                                      (QREFELT % 16))
                            (SPADCALL (|spadConstant| % 9)
                                      (SPADCALL
                                       (SPADCALL
                                        (CONS
                                         #'|STTAYLOR;generalLambert;S2IS;21!0|
                                         (VECTOR % |d| |a|))
                                        (SPADCALL (|spadConstant| % 19)
                                                  (QREFELT % 61))
                                        (SPADCALL |st| (QREFELT % 15))
                                        (QREFELT % 64))
                                       (QREFELT % 65))
                                      (QREFELT % 21)))
                           ('T
                            (|error|
                             "generalLambert: constant coefficient should be zero")))))))))) 

(SDEFUN |STTAYLOR;generalLambert;S2IS;21!0| ((|x| NIL) (|y| NIL) ($$ NIL))
        (PROG (|a| |d| %)
          (LETT |a| (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;rptg3| |a| |d| |x| |y| %))))) 

(SDEFUN |STTAYLOR;rptg4|
        ((|a| (|Integer|)) (|d| (|Integer|)) (|st| (|Stream| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;rptg4!0| (VECTOR |d| |a| % |st|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;rptg4!0| (($$ NIL))
        (PROG (|st| % |a| |d|)
          (LETT |st| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |a| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |st| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ('T
                   (SPADCALL (|STTAYLOR;rpSt| |a| (|spadConstant| % 9) %)
                             (SPADCALL (SPADCALL |st| (QREFELT % 12))
                                       (|STTAYLOR;rptg4| |d| |d|
                                        (SPADCALL |st| (QREFELT % 15)) %)
                                       (QREFELT % 21))
                             (QREFELT % 56)))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;23|
        ((|st| (|Stream| A)) (|a| (|Integer|)) (|d| (|Integer|))
         (% (|Stream| A)))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|STTAYLOR;general_Lambert_product;S2IS;23!1|
                       (VECTOR |st| |d| % |a|))
                 (QREFELT % 29))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;23!1| (($$ NIL))
        (PROG (|a| % |d| |st|)
          (LETT |a| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |d| (QREFELT $$ 1))
          (LETT |st| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|st1| NIL))
                   (SEQ
                    (COND
                     ((OR (SPADCALL |a| (|spadConstant| % 19) (QREFELT % 70))
                          (SPADCALL |d| (|spadConstant| % 19) (QREFELT % 70)))
                      (|error|
                       "general_Lambert_product: both integer arguments must be positive"))
                     ((OR (SPADCALL |st| (QREFELT % 11))
                          (SPADCALL (SPADCALL |st| (QREFELT % 12))
                                    (|spadConstant| % 17) (QREFELT % 72)))
                      (|error|
                       "general_Lambert_product: constant coefficient should be one"))
                     ('T
                      (SEQ (LETT |st1| (SPADCALL |st| (QREFELT % 15)))
                           (EXIT
                            (SPADCALL
                             (SPADCALL
                              (CONS
                               #'|STTAYLOR;general_Lambert_product;S2IS;23!0|
                               (VECTOR |st1| % |d| |a|))
                              (SPADCALL (|spadConstant| % 42) (QREFELT % 61))
                              (QREFELT % 76))
                             (QREFELT % 57)))))))))))) 

(SDEFUN |STTAYLOR;general_Lambert_product;S2IS;23!0| ((|n| NIL) ($$ NIL))
        (PROG (|a| |d| % |st1|)
          (LETT |a| (QREFELT $$ 3))
          (LETT |d| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |st1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;rptg4|
             (SPADCALL
              (SPADCALL
               (SPADCALL |a| (SPADCALL |n| |d| (QREFELT % 73)) (QREFELT % 20))
               |n| (QREFELT % 24))
              (|spadConstant| % 19) (QREFELT % 24))
             (SPADCALL
              (SPADCALL |a| (SPADCALL |n| |d| (QREFELT % 73)) (QREFELT % 20))
              (|spadConstant| % 19) (QREFELT % 24))
             |st1| %))))) 

(SDEFUN |STTAYLOR;comps|
        ((|ststa| (|Stream| (|Stream| A))) (|x| (|Stream| A))
         (% (|Stream| (|Stream| A))))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;comps!1| (VECTOR |x| % |ststa|))
                         (QREFELT % 82)))) 

(SDEFUN |STTAYLOR;comps!1| (($$ NIL))
        (PROG (|ststa| % |x|)
          (LETT |ststa| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (COND
                    ((SPADCALL |ststa| (QREFELT % 51))
                     (SPADCALL (QREFELT % 78)))
                    ((SPADCALL |x| (QREFELT % 11))
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 52))
                               (SPADCALL (QREFELT % 78)) (QREFELT % 79)))
                    ('T
                     (SPADCALL (SPADCALL |ststa| (QREFELT % 52))
                               (SPADCALL
                                (CONS #'|STTAYLOR;comps!0| (VECTOR % |x|))
                                (|STTAYLOR;comps|
                                 (SPADCALL |ststa| (QREFELT % 53)) |x| %)
                                (QREFELT % 81))
                               (QREFELT % 79))))))))) 

(SDEFUN |STTAYLOR;comps!0| ((|y| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |x| (QREFELT % 15)) |y| (QREFELT % 55)))))) 

(SDEFUN |STTAYLOR;integre|
        ((|x| (|Stream| A)) (|n| (|Integer|)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;integre!0| (VECTOR |n| % |x|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;integre!0| (($$ NIL))
        (PROG (|x| % |n|)
          (LETT |x| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ('T
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 19) |n| (QREFELT % 84))
                     (SPADCALL |x| (QREFELT % 12)) (QREFELT % 85))
                    (|STTAYLOR;integre| (SPADCALL |x| (QREFELT % 15))
                     (SPADCALL |n| (|spadConstant| % 19) (QREFELT % 20)) %)
                    (QREFELT % 21)))))))) 

(SDEFUN |STTAYLOR;integ| ((|x| (|Stream| A)) (% (|Stream| A)))
        (|STTAYLOR;integre| |x| 1 %)) 

(SDEFUN |STTAYLOR;nldere|
        ((|lslsa| (|Stream| (|Stream| A))) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (|spadConstant| % 9)
                         (CONS #'|STTAYLOR;nldere!0| (VECTOR % |c| |lslsa|))
                         (QREFELT % 87)))) 

(SDEFUN |STTAYLOR;nldere!0| (($$ NIL))
        (PROG (|lslsa| |c| %)
          (LETT |lslsa| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN (SPADCALL (|STTAYLOR;comps| |lslsa| |c| %) (QREFELT % 65)))))) 

(SDEFUN |STTAYLOR;nlde;SS;28|
        ((|lslsa| (|Stream| (|Stream| A))) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;nlde;SS;28!0| (VECTOR % |lslsa|))
                         (QREFELT % 47)))) 

(SDEFUN |STTAYLOR;nlde;SS;28!0| ((|y| NIL) ($$ NIL))
        (PROG (|lslsa| %)
          (LETT |lslsa| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;nldere| |lslsa| |y| %))))) 

(SDEFUN |STTAYLOR;smult|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;smult!0| (VECTOR % |rn|)) |x|
                         (QREFELT % 91)))) 

(SDEFUN |STTAYLOR;smult!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| %)
          (LETT |rn| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |rn| |y| (QREFELT % 85)))))) 

(SDEFUN |STTAYLOR;powerrn|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (|c| (|Stream| A))
         (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerrn!0| (VECTOR |x| |c| |rn| %))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;powerrn!0| (($$ NIL))
        (PROG (% |rn| |c| |x|)
          (LETT % (QREFELT $$ 3))
          (LETT |rn| (QREFELT $$ 2))
          (LETT |c| (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (|spadConstant| % 17)
                      (SPADCALL
                       (|STTAYLOR;integ|
                        (|STTAYLOR;smult|
                         (SPADCALL |rn| (|spadConstant| % 92) (QREFELT % 93))
                         (SPADCALL |c| (SPADCALL |x| (QREFELT % 94))
                                   (QREFELT % 55))
                         %)
                        %)
                       (SPADCALL (SPADCALL |x| (QREFELT % 15)) |c|
                                 (QREFELT % 55))
                       (QREFELT % 95))
                      (QREFELT % 21)))))) 

(SDEFUN |STTAYLOR;powern;F2S;31|
        ((|rn| (|Fraction| (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG
         ((|power| (|Stream| A)) (#1=#:G278 NIL) (#2=#:G272 NIL)
          (|num| (|Integer|)) (|invCo| (|Union| A "failed")) (|co| (A))
          (|ord| (|Union| (|Integer|) "failed")) (#3=#:G287 NIL)
          (|order| (|Integer|)) (#4=#:G288 NIL) (|n| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |order| 0)
                (SEQ
                 (EXIT
                  (SEQ (LETT |n| 0) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |x| (QREFELT % 11))
                           (PROGN
                            (LETT #4# (|STTAYLOR;zro| %))
                            (GO #5=#:G286)))
                          ((NULL
                            (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                      (QREFELT % 16)))
                           (SEQ (LETT |order| |n|)
                                (EXIT
                                 (PROGN
                                  (LETT #3# |$NoValue|)
                                  (GO #6=#:G260)))))
                          ('T
                           (SEQ (LETT |x| (SPADCALL |x| (QREFELT % 15)))
                                (EXIT
                                 (COND
                                  ((EQL |n| 1000)
                                   (|error|
                                    "^: series with many leading zero coefficients")))))))))
                       (LETT |n| (|inc_SI| |n|)) (GO G190) G191 (EXIT NIL)))
                 #6# (EXIT #3#))
                (LETT |ord|
                      (SPADCALL |order| (SPADCALL |rn| (QREFELT % 96))
                                (QREFELT % 97)))
                (EXIT
                 (COND
                  ((QEQCAR |ord| 1)
                   (|error| "^: rational power does not exist"))
                  (#7='T
                   (SEQ (LETT |co| (SPADCALL |x| (QREFELT % 12)))
                        (COND
                         ((> (QCDR |ord|) 0)
                          (COND
                           ((SPADCALL |rn| (|spadConstant| % 98)
                                      (QREFELT % 99))
                            (|error| "^: negative power does not exist")))))
                        (LETT |invCo| (SPADCALL |co| (QREFELT % 31)))
                        (EXIT
                         (COND
                          ((QEQCAR |invCo| 1)
                           (|error|
                            "^ rational power of coefficient undefined"))
                          (#7#
                           (SEQ
                            (LETT |power|
                                  (COND
                                   ((SPADCALL |co| (|spadConstant| % 17)
                                              (QREFELT % 100))
                                    (SPADCALL
                                     (CONS #'|STTAYLOR;powern;F2S;31!0|
                                           (VECTOR % |x| |rn|))
                                     (QREFELT % 47)))
                                   ((EQL (SPADCALL |rn| (QREFELT % 96)) 1)
                                    (COND
                                     ((NULL
                                       (MINUSP
                                        (LETT |num|
                                              (SPADCALL |rn|
                                                        (QREFELT % 101)))))
                                      (SPADCALL
                                       (SPADCALL |co|
                                                 (PROG1 (LETT #2# |num|)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 (QREFELT % 102))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;31!1|
                                              (VECTOR % |x| |invCo| |rn|))
                                        (QREFELT % 47))
                                       (QREFELT % 103)))
                                     ('T
                                      (SPADCALL
                                       (SPADCALL (QCDR |invCo|)
                                                 (PROG1 (LETT #1# (- |num|))
                                                   (|check_subtype2| (>= #1# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #1#))
                                                 (QREFELT % 102))
                                       (SPADCALL
                                        (CONS #'|STTAYLOR;powern;F2S;31!2|
                                              (VECTOR % |x| |invCo| |rn|))
                                        (QREFELT % 47))
                                       (QREFELT % 103)))))
                                   ((QREFELT % 89)
                                    (SPADCALL
                                     (SPADCALL |co| |rn| (QREFELT % 104))
                                     (SPADCALL
                                      (CONS #'|STTAYLOR;powern;F2S;31!3|
                                            (VECTOR % |x| |invCo| |rn|))
                                      (QREFELT % 47))
                                     (QREFELT % 103)))
                                   (#7#
                                    (|error|
                                     "^ rational power of coefficient undefined"))))
                            (EXIT
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 17)
                                        (* (QCDR |ord|)
                                           (SPADCALL |rn| (QREFELT % 101)))
                                        (QREFELT % 105))
                              |power| (QREFELT % 55)))))))))))))
          #5# (EXIT #4#)))) 

(SDEFUN |STTAYLOR;powern;F2S;31!3| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 103)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;31!2| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 103)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;31!1| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |invCo| |x| %)
          (LETT |rn| (QREFELT $$ 3))
          (LETT |invCo| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|STTAYLOR;powerrn| |rn|
             (SPADCALL (QCDR |invCo|) |x| (QREFELT % 103)) |y| %))))) 

(SDEFUN |STTAYLOR;powern;F2S;31!0| ((|y| NIL) ($$ NIL))
        (PROG (|rn| |x| %)
          (LETT |rn| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;powerrn| |rn| |x| |y| %))))) 

(SDEFUN |STTAYLOR;mapdiv;3S;32|
        ((|x| (|Stream| A)) (|y| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;mapdiv;3S;32!0| (VECTOR |x| % |y|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;mapdiv;3S;32!0| (($$ NIL))
        (PROG (|y| % |x|)
          (LETT |y| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND
             ((SPADCALL |y| (QREFELT % 11))
              (|error| "stream division by zero"))
             ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
             ('T
              (SPADCALL
               (SPADCALL (SPADCALL |x| (QREFELT % 12))
                         (SPADCALL |y| (QREFELT % 12)) (QREFELT % 107))
               (SPADCALL (SPADCALL |x| (QREFELT % 15))
                         (SPADCALL |y| (QREFELT % 15)) (QREFELT % 108))
               (QREFELT % 21)))))))) 

(SDEFUN |STTAYLOR;ginteg|
        ((|f| (|Mapping| A (|Integer|))) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL |x|
                  (SPADCALL |f| (SPADCALL 1 (QREFELT % 61)) (QREFELT % 111))
                  (QREFELT % 108))) 

(SDEFUN |STTAYLOR;lazyGintegrate;MAMS;34|
        ((|fntoa| (|Mapping| A (|Integer|))) (|s| (A))
         (|xf| (|Mapping| (|Stream| A))) (% (|Stream| A)))
        (SPADCALL |s|
                  (|STTAYLOR;ginteg| |fntoa| (SPADCALL |xf| (QREFELT % 29)) %)
                  (QREFELT % 21))) 

(SDEFUN |STTAYLOR;finteg| ((|x| (|Stream| A)) (% (|Stream| A)))
        (SPADCALL |x| (SPADCALL (|spadConstant| % 17) (QREFELT % 113))
                  (QREFELT % 108))) 

(SDEFUN |STTAYLOR;powerre|
        ((|s| (A)) (|x| (|Stream| A)) (|c| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;powerre!0| (VECTOR |c| |s| % |x|))
                         (QREFELT % 29)))) 

(SDEFUN |STTAYLOR;powerre!0| (($$ NIL))
        (PROG (|x| % |s| |c|)
          (LETT |x| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |s| (QREFELT $$ 1))
          (LETT |c| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (COND ((SPADCALL |x| (QREFELT % 11)) (|STTAYLOR;zro| %))
                  ((SPADCALL (SPADCALL |x| (QREFELT % 12))
                             (|spadConstant| % 17) (QREFELT % 72))
                   (|error| "^:constant coefficient should be 1"))
                  ('T
                   (SPADCALL (SPADCALL |x| (QREFELT % 12))
                             (SPADCALL
                              (|STTAYLOR;finteg|
                               (SPADCALL
                                (SPADCALL |s| (|spadConstant| % 17)
                                          (QREFELT % 14))
                                (SPADCALL |c| (SPADCALL |x| (QREFELT % 94))
                                          (QREFELT % 55))
                                (QREFELT % 103))
                               %)
                              (SPADCALL (SPADCALL |x| (QREFELT % 15)) |c|
                                        (QREFELT % 55))
                              (QREFELT % 95))
                             (QREFELT % 21)))))))) 

(SDEFUN |STTAYLOR;power;A2S;37| ((|s| (A)) (|x| (|Stream| A)) (% (|Stream| A)))
        (SPROG NIL
               (SPADCALL (CONS #'|STTAYLOR;power;A2S;37!0| (VECTOR % |x| |s|))
                         (QREFELT % 47)))) 

(SDEFUN |STTAYLOR;power;A2S;37!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| |x| %)
          (LETT |s| (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|STTAYLOR;powerre| |s| |x| |y| %))))) 

(DECLAIM (NOTINLINE |StreamTaylorSeriesOperations;|)) 

(DEFUN |StreamTaylorSeriesOperations;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|StreamTaylorSeriesOperations| DV$1))
          (LETT % (GETREFV 115))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             (LIST
                                                              '|RightModule|
                                                              (|devaluate|
                                                               |#1|)))
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|StreamTaylorSeriesOperations|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 88
                       (CONS (|dispatchFunction| |STTAYLOR;nlde;SS;28|) %))
             (QSETREFV % 89
                       (|HasSignature| |#1|
                                       (LIST '^
                                             (LIST (|devaluate| |#1|)
                                                   (|devaluate| |#1|)
                                                   '(|Fraction|
                                                     (|Integer|))))))
             NIL
             NIL
             (QSETREFV % 106
                       (CONS (|dispatchFunction| |STTAYLOR;powern;F2S;31|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV % 108
                       (CONS (|dispatchFunction| |STTAYLOR;mapdiv;3S;32|) %))
             NIL
             (QSETREFV % 112
                       (CONS
                        (|dispatchFunction| |STTAYLOR;lazyGintegrate;MAMS;34|)
                        %))
             NIL
             NIL
             (QSETREFV % 114
                       (CONS (|dispatchFunction| |STTAYLOR;power;A2S;37|)
                             %)))))
          %))) 

(DEFUN |StreamTaylorSeriesOperations| (#1=#:G312)
  (SPROG NIL
         (PROG (#2=#:G313)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|StreamTaylorSeriesOperations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|StreamTaylorSeriesOperations;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|StreamTaylorSeriesOperations|)))))))))) 

(MAKEPROP '|StreamTaylorSeriesOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|StreamTaylorSeriesOperations2| 6 6)
              (|local| |#1|) (|Stream| 6) (0 . |empty|) (4 . |Zero|)
              (|Boolean|) (8 . |empty?|) (13 . |frst|) (18 . *) (24 . +)
              (30 . |rst|) (35 . |zero?|) (40 . |One|) (|Integer|) (44 . |One|)
              (48 . +) (54 . |concat|) (|SingleInteger|) (60 . |One|) (64 . -)
              (70 . |Zero|) (|List| 6) (74 . |cons|) (|Mapping| %)
              (80 . |delay|) (|Union| % '"failed") (85 . |recip|) (90 . -)
              (|Union| 7 '"failed") |STTAYLOR;recip;SU;4| (95 . -)
              (|PositiveInteger|) (101 . |One|) (|NonNegativeInteger|)
              (105 . |Zero|) |STTAYLOR;exquo;2SU;6| |STTAYLOR;/;3S;7|
              (109 . |Zero|) (113 . <=) (119 . |compose|) (|Mapping| 7 7)
              (|ParadoxicalCombinatorsForStreams| 6) (125 . Y)
              |STTAYLOR;lagrange;2S;11| |STTAYLOR;revert;2S;12| (|Stream| 7)
              (130 . |empty?|) (135 . |frst|) (140 . |rst|) (145 . +) (151 . *)
              (157 . |concat|) |STTAYLOR;prodiag;SS;14| (163 . |repeating|)
              (168 . |concat|) (|Stream| 18) (174 . |integers|)
              (|Mapping| 7 18 6) (|StreamFunctions3| 18 6 7) (179 . |map|)
              (186 . |addiag|) |STTAYLOR;lambert;2S;18| (191 . |oddintegers|)
              |STTAYLOR;oddlambert;2S;19| |STTAYLOR;evenlambert;2S;20|
              (196 . <) |STTAYLOR;generalLambert;S2IS;21| (202 . ~=) (208 . *)
              (|Mapping| 7 18) (|StreamFunctions2| 18 7) (214 . |map|)
              |STTAYLOR;general_Lambert_product;S2IS;23| (220 . |empty|)
              (224 . |concat|) (|StreamFunctions2| 7 7) (230 . |map|)
              (236 . |delay|) (|Fraction| 18) (241 . /) (247 . *) (|Mapping| 7)
              (253 . |lazyIntegrate|) (259 . |nlde|) 'RATPOWERS (|Mapping| 6 6)
              (264 . |map|) (270 . |One|) (274 . +) (280 . |deriv|) (285 . -)
              (291 . |denom|) (296 . |exquo|) (302 . |Zero|) (306 . <)
              (312 . =) (318 . |numer|) (323 . ^) (329 . *) (335 . ^)
              (341 . |monom|) (347 . |powern|) (353 . /) (359 . |mapdiv|)
              (|Mapping| 6 18) (|StreamFunctions2| 18 6) (365 . |map|)
              (371 . |lazyGintegrate|) (378 . |int|) (383 . |power|))
           '#(|revert| 389 |recip| 394 |prodiag| 399 |powern| 404 |power| 410
              |oddlambert| 416 |oddintegers| 421 |nlde| 426 |monom| 431
              |mapdiv| 437 |lazyIntegrate| 443 |lazyGintegrate| 449 |lambert|
              456 |lagrange| 461 |integers| 466 |int| 471
              |general_Lambert_product| 476 |generalLambert| 483 |exquo| 490
              |evenlambert| 496 |deriv| 501 |compose| 506 |addiag| 512 / 517 -
              523 + 529 * 535)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|StreamTaylorSeriesOperationsCategory| 6 6))
                             (|makeByteWordVec2| 114
                                                 '(0 7 0 8 0 6 0 9 1 7 10 0 11
                                                   1 7 6 0 12 2 6 0 0 0 13 2 6
                                                   0 0 0 14 1 7 0 0 15 1 6 10 0
                                                   16 0 6 0 17 0 18 0 19 2 18 0
                                                   0 0 20 2 7 0 6 0 21 0 22 0
                                                   23 2 18 0 0 0 24 0 22 0 25 2
                                                   26 0 6 0 27 1 7 0 28 29 1 6
                                                   30 0 31 1 6 0 0 32 2 6 0 0 0
                                                   35 0 36 0 37 0 38 0 39 0 18
                                                   0 42 2 18 10 0 0 43 2 0 7 7
                                                   7 44 1 46 7 45 47 1 50 10 0
                                                   51 1 50 7 0 52 1 50 0 0 53 2
                                                   0 7 7 7 54 2 0 7 7 7 55 2 7
                                                   0 0 0 56 1 7 0 26 58 2 26 0
                                                   0 0 59 1 0 60 18 61 3 63 50
                                                   62 60 7 64 1 0 7 50 65 1 0
                                                   60 18 67 2 18 10 0 0 70 2 6
                                                   10 0 0 72 2 18 0 0 18 73 2
                                                   75 50 74 60 76 0 50 0 78 2
                                                   50 0 7 0 79 2 80 50 45 50 81
                                                   1 50 0 28 82 2 83 0 18 18 84
                                                   2 6 0 83 0 85 2 0 7 6 86 87
                                                   1 0 7 50 88 2 7 0 90 0 91 0
                                                   83 0 92 2 83 0 0 0 93 1 0 7
                                                   7 94 2 0 7 7 7 95 1 83 18 0
                                                   96 2 18 30 0 0 97 0 83 0 98
                                                   2 83 10 0 0 99 2 6 10 0 0
                                                   100 1 83 18 0 101 2 6 0 0 38
                                                   102 2 0 7 6 7 103 2 6 0 0 83
                                                   104 2 0 7 6 18 105 2 0 7 83
                                                   7 106 2 6 0 0 0 107 2 0 7 7
                                                   7 108 2 110 7 109 60 111 3 0
                                                   7 109 6 86 112 1 0 7 6 113 2
                                                   0 7 6 7 114 1 0 7 7 49 1 0
                                                   33 7 34 1 0 7 50 57 2 2 7 83
                                                   7 106 2 3 7 6 7 114 1 0 7 7
                                                   68 1 0 60 18 67 1 2 7 50 88
                                                   2 0 7 6 18 105 2 3 7 7 7 108
                                                   2 2 7 6 86 87 3 3 7 109 6 86
                                                   112 1 0 7 7 66 1 0 7 7 48 1
                                                   0 60 18 61 1 0 7 6 113 3 0 7
                                                   7 18 18 77 3 0 7 7 18 18 71
                                                   2 0 33 7 7 40 1 0 7 7 69 1 0
                                                   7 7 94 2 1 7 7 7 44 1 0 7 50
                                                   65 2 0 7 7 7 41 2 0 7 7 7 95
                                                   2 0 7 7 7 54 2 0 7 7 7 55 2
                                                   0 7 6 7 103 2 1 7 6 7
                                                   103)))))
           '|lookupIncomplete|)) 
