
(SDEFUN |CYCLOT2;filter_prods|
        ((|p| #1=(|Integer|)) (|pl| (|List| (|Integer|)))
         (|ev_odd| (|Boolean|)) (|mp| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|pr| NIL) (#2=#:G47 NIL) (|c| (|Integer|)) (#3=#:G46 NIL)
          (|res| (|List| #1#)))
         (SEQ (LETT |res| (COND (|ev_odd| (LIST (- |p|))) ('T (LIST |p|))))
              (SEQ (LETT |pr| NIL) (LETT #2# |pl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |pr| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |c| (- (* |p| |pr|)))
                          (EXIT
                           (COND
                            ((> (ABS |c|) |mp|)
                             (PROGN (LETT #3# |$NoValue|) (GO #4=#:G41)))
                            ('T (LETT |res| (CONS |c| |res|)))))))
                    #4# (EXIT #3#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;recursive_check2|
        ((|p| (|Integer|)) (|pa| (|PrimitiveArray| (|Integer|)))
         (|mp| (|Integer|)) (|m| (|Integer|)) (|res| (|Integer|))
         (|rl| (|List| (|Integer|))) (|ev_odd| (|Boolean|))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((|mu| (|Union| (|Integer|) "failed")) (|pl1| (|List| (|Integer|)))
          (#1=#:G65 NIL) (#2=#:G66 NIL) (|i| NIL) (#3=#:G67 NIL))
         (SEQ
          (COND ((NULL (SPADCALL |p| (QREFELT % 8))) (CONS 1 "failed"))
                ('T
                 (SEQ (LETT |res| (* |res| |p|)) (LETT |rl| (CONS |p| |rl|))
                      (LETT |mu| (|exquo_INT| |m| (- |p| 1)))
                      (EXIT
                       (COND ((QEQCAR |mu| 1) (CONS 1 "failed"))
                             (#4='T
                              (SEQ (LETT |m| (QCDR |mu|))
                                   (EXIT
                                    (COND ((< |m| (+ |p| 1)) (CONS 1 "failed"))
                                          (#4#
                                           (SEQ (LETT |mp| (MIN |mp| |m|))
                                                (LETT |pl1|
                                                      (|CYCLOT2;filter_prods|
                                                       |p| |pl| |ev_odd| |mp|
                                                       %))
                                                (SEQ (LETT #1# |pl1|) G190
                                                     (COND
                                                      ((OR (ATOM #1#)
                                                           (PROGN
                                                            (LETT |p|
                                                                  (CAR #1#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (COND
                                                        ((> |p| 0)
                                                         (SEQ (LETT |i| |p|)
                                                              (LETT #2# |mp|)
                                                              G190
                                                              (COND
                                                               ((> |i| #2#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (QSETAREF1 |pa|
                                                                           |i|
                                                                           (+
                                                                            (QAREF1
                                                                             |pa|
                                                                             |i|)
                                                                            (QAREF1
                                                                             |pa|
                                                                             (-
                                                                              |i|
                                                                              |p|))))))
                                                              (LETT |i|
                                                                    (+ |i| 1))
                                                              (GO G190) G191
                                                              (EXIT NIL)))
                                                        ('T
                                                         (SEQ (LETT |i| |mp|)
                                                              (LETT #3#
                                                                    (- |p|))
                                                              G190
                                                              (COND
                                                               ((< |i| #3#)
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (QSETAREF1 |pa|
                                                                           |i|
                                                                           (-
                                                                            (QAREF1
                                                                             |pa|
                                                                             |i|)
                                                                            (QAREF1
                                                                             |pa|
                                                                             (+
                                                                              |i|
                                                                              |p|))))))
                                                              (LETT |i|
                                                                    (+ |i| -1))
                                                              (GO G190) G191
                                                              (EXIT NIL))))))
                                                     (LETT #1# (CDR #1#))
                                                     (GO G190) G191 (EXIT NIL))
                                                (LETT |pl|
                                                      (SPADCALL |pl1| |pl|
                                                                (QREFELT %
                                                                         13)))
                                                (EXIT
                                                 (COND
                                                  (|ev_odd|
                                                   (|CYCLOT2;recursive_check_even|
                                                    |pa| |mp| |m| |res| |rl|
                                                    |pl| %))
                                                  (#4#
                                                   (|CYCLOT2;recursive_check_odd|
                                                    |pa| |mp| |m| |res| |rl|
                                                    |pl| %)))))))))))))))))) 

(SDEFUN |CYCLOT2;recursive_check_even|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (|res| (|Integer|)) (|rl| (|List| (|Integer|)))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG ((|i| (|PositiveInteger|)))
               (SEQ (LETT |i| 3)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((< |i| |mp|) (EQL (QAREF1 |pa| |i|) 0))
                                  ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |i| |mp|)
                       (SEQ
                        (COND
                         ((EQL (QAREF1 |pa| |i|) 0)
                          (COND
                           ((SPADCALL (+ |m| 1) (QREFELT % 8))
                            (EXIT
                             (CONS 0
                                   (CONS (* |res| (+ |m| 1))
                                         (CONS (+ |m| 1) |rl|))))))))
                        (EXIT (CONS 1 "failed"))))
                      ((NULL (EQL (QAREF1 |pa| |i|) 1)) (CONS 1 "failed"))
                      ('T
                       (|CYCLOT2;recursive_check2| |i| |pa| |mp| |m| |res| |rl|
                        'T |pl| %))))))) 

(SDEFUN |CYCLOT2;recursive_check_odd|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (|res| (|Integer|)) (|rl| (|List| (|Integer|)))
         (|pl| (|List| (|Integer|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG ((|i| (|PositiveInteger|)))
               (SEQ (LETT |i| 3)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((< |i| |mp|) (EQL (QAREF1 |pa| |i|) 1))
                                  ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |i| (+ |i| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |i| |mp|)
                       (SEQ
                        (COND
                         ((EQL (QAREF1 |pa| |i|) 1)
                          (COND
                           ((SPADCALL (+ |m| 1) (QREFELT % 8))
                            (EXIT
                             (CONS 0
                                   (CONS (* |res| (+ |m| 1))
                                         (CONS (+ |m| 1) |rl|))))))))
                        (EXIT (CONS 1 "failed"))))
                      ((NULL (EQL (QAREF1 |pa| |i|) 0)) (CONS 1 "failed"))
                      ('T
                       (|CYCLOT2;recursive_check2| |i| |pa| |mp| |m| |res| |rl|
                        NIL |pl| %))))))) 

(SDEFUN |CYCLOT2;maybe_cyclotomic2?|
        ((|pa| (|PrimitiveArray| (|Integer|))) (|mp| (|Integer|))
         (|m| (|Integer|)) (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((|two_fac| (|Boolean|)) (|res| (|PositiveInteger|)) (|i| NIL)
          (#1=#:G96 NIL))
         (SEQ
          (LETT |two_fac|
                (COND
                 ((EQL (QAREF1 |pa| 1) 1)
                  (COND ((EQL (QAREF1 |pa| 2) 0) 'T)
                        ((EQL (QAREF1 |pa| 1) -1) (EQL (QAREF1 |pa| 2) 1))
                        (#2='T NIL)))
                 ((EQL (QAREF1 |pa| 1) -1) (EQL (QAREF1 |pa| 2) 1)) (#2# NIL)))
          (LETT |res| (COND (|two_fac| 2) (#2# 1)))
          (EXIT
           (COND ((EQL |m| 2) (CONS 0 (LIST (* |res| 3) 3)))
                 (#2#
                  (SEQ
                   (COND
                    (|two_fac|
                     (SEQ (LETT |i| 1) (LETT #1# |mp|) G190
                          (COND ((> |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT (QSETAREF1 |pa| |i| (- (QAREF1 |pa| |i|)))))
                          (LETT |i| (+ |i| 2)) (GO G190) G191 (EXIT NIL))))
                   (EXIT
                    (COND
                     ((EQL (QAREF1 |pa| 2) 1)
                      (|CYCLOT2;recursive_check_odd| |pa| |mp| |m| |res| NIL
                       NIL %))
                     ((EQL (QAREF1 |pa| 2) 0)
                      (|CYCLOT2;recursive_check_even| |pa| |mp| |m| |res| NIL
                       NIL %))
                     (#2# (CONS 1 "failed"))))))))))) 

(SDEFUN |CYCLOT2;maybe_cyclotomic?|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|))) (|m1| (|Integer|))
         (|m2| (|Integer|)) (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((|mp| (|Integer|)) (#1=#:G97 NIL)
          (|pa| (|PrimitiveArray| (|Integer|))) (|i| NIL) (#2=#:G106 NIL)
          (#3=#:G105 NIL) (|m| (|Integer|)))
         (SEQ
          (EXIT
           (SEQ (LETT |mp| (MIN (+ (SPADCALL |m2| (QREFELT % 15)) 3) |m2|))
                (LETT |pa|
                      (MAKEARR1
                       (PROG1 (LETT #1# (+ |mp| 1))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))
                       0))
                (LETT |m| (* |m1| |m2|))
                (SEQ (LETT |i| 0) (LETT #2# |mp|) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((< (SPADCALL |p| (QREFELT % 18)) |m|)
                         (LETT |m| (- |m| |m1|)))
                        ((> (SPADCALL |p| (QREFELT % 18)) |m|)
                         (PROGN (LETT #3# (CONS 1 "failed")) (GO #4=#:G104)))
                        ('T
                         (SEQ
                          (QSETAREF1 |pa| |i| (SPADCALL |p| (QREFELT % 19)))
                          (LETT |p| (SPADCALL |p| (QREFELT % 20)))
                          (EXIT (LETT |m| (- |m| |m1|))))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (|CYCLOT2;maybe_cyclotomic2?| |pa| |mp| |m2| %))))
          #4# (EXIT #3#)))) 

(SDEFUN |CYCLOT2;cyclotomic?;SupU;7|
        ((|p| (|SparseUnivariatePolynomial| (|Integer|)))
         (% (|Union| (|Integer|) #1="failed")))
        (SPROG
         ((|p1| (|SparseUnivariatePolynomial| (|Integer|)))
          (|m1| #2=(|Integer|)) (|m2u| (|Union| (|Integer|) "failed"))
          (|m2| (|Integer|)) (|c0| (|Integer|))
          (|r1u| (|Union| (|List| (|Integer|)) "failed"))
          (|rl| (|List| (|Integer|))) (|r1| (|Integer|))
          (|fl| (|List| (|Integer|))) (|mm1| (|Integer|)) (#3=#:G108 NIL)
          (|mm| #2#) (#4=#:G117 NIL) (|pa| (|PrimitiveArray| (|Integer|)))
          (|two_fac| (|Integer|)) (#5=#:G145 NIL) (|i| NIL) (#6=#:G146 NIL)
          (#7=#:G144 NIL) (|tcf| (|Integer|)) (|m| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((NULL (EQL (SPADCALL |p| (QREFELT % 19)) 1)) (CONS 1 "failed"))
            ('T
             (SEQ (LETT |m| (SPADCALL |p| (QREFELT % 18)))
                  (LETT |p1| (SPADCALL |p| (QREFELT % 20)))
                  (EXIT
                   (COND
                    ((EQL |m| 1)
                     (SEQ (LETT |c0| (SPADCALL |p1| (QREFELT % 19)))
                          (EXIT
                           (COND ((EQL |c0| -1) (CONS 0 1))
                                 ((EQL |c0| 1) (CONS 0 2))
                                 (#8='T (CONS 1 "failed"))))))
                    ((ODDP |m|) (CONS 1 "failed"))
                    (#8#
                     (SEQ (LETT |m1| (- |m| (SPADCALL |p1| (QREFELT % 18))))
                          (LETT |m2u| (|exquo_INT| |m| |m1|))
                          (EXIT
                           (COND ((QEQCAR |m2u| 1) (CONS 1 "failed"))
                                 (#8#
                                  (SEQ (LETT |m2| (QCDR |m2u|))
                                       (LETT |r1u|
                                             (COND
                                              ((EQL |m2| 1)
                                               (SEQ
                                                (LETT |c0|
                                                      (SPADCALL |p1|
                                                                (QREFELT %
                                                                         19)))
                                                (EXIT
                                                 (COND
                                                  ((EQL |c0| 1)
                                                   (CONS 0 (LIST 2)))
                                                  (#8#
                                                   (PROGN
                                                    (LETT #7#
                                                          (CONS 1 "failed"))
                                                    (GO #9=#:G143)))))))
                                              (#8#
                                               (|CYCLOT2;maybe_cyclotomic?| |p|
                                                |m1| |m2| %))))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |r1u| 1) (CONS 1 "failed"))
                                         (#8#
                                          (SEQ (LETT |rl| (QCDR |r1u|))
                                               (LETT |r1| (|SPADfirst| |rl|))
                                               (LETT |fl| (CDR |rl|))
                                               (LETT |mm| |m1|)
                                               (SEQ G190
                                                    (COND
                                                     ((NULL (> |mm| 1))
                                                      (GO G191)))
                                                    (SEQ
                                                     (LETT |mm1|
                                                           (GCD |r1| |mm|))
                                                     (EXIT
                                                      (COND
                                                       ((EQL |mm1| 1)
                                                        (PROGN
                                                         (LETT #7#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (LETT |mm|
                                                              (PROG2
                                                                  (LETT #3#
                                                                        (|exquo_INT|
                                                                         |mm|
                                                                         |mm1|))
                                                                  (QCDR #3#)
                                                                (|check_union2|
                                                                 (QEQCAR #3# 0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #1#)
                                                                 #3#)))))))
                                                    NIL (GO G190) G191
                                                    (EXIT NIL))
                                               (COND
                                                ((EQL |m2| 1)
                                                 (COND
                                                  ((NULL |fl|)
                                                   (EXIT
                                                    (CONS 0 (* |r1| |m1|)))))))
                                               (LETT |mm|
                                                     (|quotient_INT| |m2| 2))
                                               (LETT |pa|
                                                     (MAKEARR1
                                                      (PROG1
                                                          (LETT #4# (+ |mm| 1))
                                                        (|check_subtype2|
                                                         (>= #4# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #4#))
                                                      0))
                                               (|CYCLOT2;cyclotomic_SPS2| |mm|
                                                (LENGTH |fl|) |pa| |fl| 1 %)
                                               (LETT |two_fac|
                                                     (COND ((ODDP |r1|) 1)
                                                           (#8# -1)))
                                               (LETT |tcf| 1)
                                               (SEQ (LETT |i| 0)
                                                    (LETT #5# |mm|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #5#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((<
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            18))
                                                         |m|)
                                                        (COND
                                                         ((NULL
                                                           (EQL
                                                            (QAREF1 |pa| |i|)
                                                            0))
                                                          (PROGN
                                                           (LETT #7#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #9#)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |tcf|
                                                                 (* |two_fac|
                                                                    |tcf|))
                                                           (EXIT
                                                            (LETT |m|
                                                                  (- |m|
                                                                     |m1|)))))))
                                                       ((OR
                                                         (>
                                                          (SPADCALL |p|
                                                                    (QREFELT %
                                                                             18))
                                                          |m|)
                                                         (NULL
                                                          (EQL
                                                           (* |tcf|
                                                              (QAREF1 |pa|
                                                                      |i|))
                                                           (SPADCALL |p|
                                                                     (QREFELT %
                                                                              19)))))
                                                        (PROGN
                                                         (LETT #7#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |tcf|
                                                               (* |two_fac|
                                                                  |tcf|))
                                                         (LETT |p|
                                                               (SPADCALL |p|
                                                                         (QREFELT
                                                                          %
                                                                          20)))
                                                         (EXIT
                                                          (LETT |m|
                                                                (- |m|
                                                                   |m1|))))))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (SEQ (LETT |i| (+ |mm| 1))
                                                    (LETT #6# |m2|) G190
                                                    (COND
                                                     ((> |i| #6#) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((<
                                                         (SPADCALL |p|
                                                                   (QREFELT %
                                                                            18))
                                                         |m|)
                                                        (COND
                                                         ((NULL
                                                           (EQL
                                                            (QAREF1 |pa|
                                                                    (- |m2|
                                                                       |i|))
                                                            0))
                                                          (PROGN
                                                           (LETT #7#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #9#)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |tcf|
                                                                 (* |two_fac|
                                                                    |tcf|))
                                                           (EXIT
                                                            (LETT |m|
                                                                  (- |m|
                                                                     |m1|)))))))
                                                       ((OR
                                                         (>
                                                          (SPADCALL |p|
                                                                    (QREFELT %
                                                                             18))
                                                          |m|)
                                                         (NULL
                                                          (EQL
                                                           (* |tcf|
                                                              (QAREF1 |pa|
                                                                      (- |m2|
                                                                         |i|)))
                                                           (SPADCALL |p|
                                                                     (QREFELT %
                                                                              19)))))
                                                        (PROGN
                                                         (LETT #7#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #9#)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |tcf|
                                                               (* |two_fac|
                                                                  |tcf|))
                                                         (LETT |p|
                                                               (SPADCALL |p|
                                                                         (QREFELT
                                                                          %
                                                                          20)))
                                                         (EXIT
                                                          (LETT |m|
                                                                (- |m|
                                                                   |m1|))))))))
                                                    (LETT |i| (+ |i| 1))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (CONS 0
                                                      (* |r1|
                                                         |m1|)))))))))))))))))))
          #9# (EXIT #7#)))) 

(SDEFUN |CYCLOT2;expand_prods|
        ((|fl| (|List| (|Integer|))) (|k| (|Integer|))
         (% #1=(|List| (|Integer|))))
        (SPROG
         ((|pk| (|Integer|)) (|plk| #1#) (|pr1| NIL) (#2=#:G152 NIL)
          (|res| (|List| (|Integer|))))
         (SEQ
          (COND ((EQL |k| 1) (CONS -1 |fl|))
                ('T
                 (SEQ (LETT |pk| (|SPADfirst| |fl|)) (LETT |fl| (CDR |fl|))
                      (LETT |plk| (|CYCLOT2;expand_prods| |fl| (- |k| 1) %))
                      (LETT |res| NIL)
                      (SEQ (LETT |pr1| NIL) (LETT #2# |plk|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |pr1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |res| (CONS (- |pr1|) |res|))
                                (EXIT
                                 (LETT |res| (CONS (* |pk| |pr1|) |res|))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |res|))))))) 

(SDEFUN |CYCLOT2;cyclotomic_SPS2|
        ((|m| (|Integer|)) (|k| (|Integer|))
         (|pa| (|PrimitiveArray| (|Integer|))) (|fl| (|List| (|Integer|)))
         (|do_inv| (|Integer|)) (% (|Void|)))
        (SPROG
         ((#1=#:G171 NIL) (#2=#:G172 NIL) (|pk| (|Integer|)) (|mk| (|Integer|))
          (|pl| (|List| (|Integer|))) (#3=#:G173 NIL) (|p| (|Integer|))
          (#4=#:G174 NIL) (|i| NIL) (#5=#:G175 NIL))
         (SEQ
          (COND
           ((EQL |k| 1)
            (COND
             ((EQL |do_inv| -1)
              (SEQ (QSETAREF1 |pa| 0 1)
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ (EXIT (QSETAREF1 |pa| |i| 0)))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT NIL)))))
             (#6='T
              (SEQ (LETT |i| 0) (LETT #2# |m|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (EXIT (QSETAREF1 |pa| |i| 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
           (#6#
            (SEQ (LETT |pk| (|SPADfirst| |fl|)) (LETT |fl| (CDR |fl|))
                 (LETT |mk| (|quotient_INT| |m| |pk|))
                 (|CYCLOT2;cyclotomic_SPS2| |mk| (- |k| 1) |pa| |fl| |do_inv|
                  %)
                 (SEQ (LETT |i| |mk|) G190 (COND ((< |i| 1) (GO G191)))
                      (SEQ (QSETAREF1 |pa| (* |pk| |i|) (QAREF1 |pa| |i|))
                           (EXIT (QSETAREF1 |pa| |i| 0)))
                      (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                 (LETT |pl| (|CYCLOT2;expand_prods| |fl| (- |k| 1) %))
                 (EXIT
                  (SEQ (LETT #3# |pl|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |p| (* |do_inv| |p|))
                            (EXIT
                             (COND
                              ((> |p| 0)
                               (SEQ (LETT |i| |p|) (LETT #4# |m|) G190
                                    (COND ((> |i| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF1 |pa| |i|
                                                 (+ (QAREF1 |pa| |i|)
                                                    (QAREF1 |pa|
                                                            (- |i| |p|))))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL)))
                              ('T
                               (SEQ (LETT |i| |m|) (LETT #5# (- |p|)) G190
                                    (COND ((< |i| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF1 |pa| |i|
                                                 (- (QAREF1 |pa| |i|)
                                                    (QAREF1 |pa|
                                                            (+ |i| |p|))))))
                                    (LETT |i| (+ |i| -1)) (GO G190) G191
                                    (EXIT NIL))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))))))))) 

(SDEFUN |CYCLOT2;gen_poly|
        ((|m| (|Integer|)) (|m2| (|Integer|))
         (|pa| (|PrimitiveArray| (|Integer|))) (|two_fac| (|Integer|))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((#1=#:G185 NIL) (|i| NIL) (#2=#:G186 NIL) (#3=#:G180 NIL)
          (|res| (|SparseUnivariatePolynomial| (|Integer|)))
          (|tcf| (|Integer|)))
         (SEQ (LETT |tcf| 1) (LETT |res| (|spadConstant| % 23))
              (SEQ (LETT |i| 0) (LETT #1# |m2|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL (* |tcf| (QAREF1 |pa| |i|)) |i|
                                              (QREFELT % 24))
                                    (QREFELT % 25)))
                    (EXIT (LETT |tcf| (* |two_fac| |tcf|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (+ |m2| 1)) (LETT #2# |m|) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |res|
                          (SPADCALL |res|
                                    (SPADCALL
                                     (* |tcf| (QAREF1 |pa| (- |m| |i|)))
                                     (PROG1 (LETT #3# |i|)
                                       (|check_subtype2| (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                     (QREFELT % 24))
                                    (QREFELT % 25)))
                    (EXIT (LETT |tcf| (* |two_fac| |tcf|))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;cyclotomic_SPS1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|))) (|two_fac| (|Integer|))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|m2| (|Integer|)) (#1=#:G187 NIL)
          (|pa| (|PrimitiveArray| (|Integer|))))
         (SEQ (LETT |m2| (|quotient_INT| |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #1# (+ |m2| 1))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     0))
              (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl|) |pa| |fl| 1 %)
              (EXIT (|CYCLOT2;gen_poly| |m| |m2| |pa| |two_fac| %))))) 

(SDEFUN |CYCLOT2;cyclotomic_array;IPa;12|
        ((|n| (|Integer|)) (% (|PrimitiveArray| (|Integer|))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fac| NIL) (#2=#:G205 NIL) (|f1| #1#) (|m| (|Integer|))
          (|m2| (|Integer|)) (#3=#:G202 NIL)
          (|pa| (|PrimitiveArray| (|Integer|))) (|fl1| (|List| (|Integer|))))
         (SEQ
          (COND ((< |n| 3) (|error| "cyclotomic_array: n must be >= 3"))
                ('T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 27))
                                  (QREFELT % 31)))
                  (LETT |m| 1) (LETT |fl1| NIL)
                  (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (EXIT
                             (COND
                              ((> (QVELT |fac| 2) 1)
                               (|error|
                                "cyclotomic_array: n must be squarefree"))
                              ((EQL |f1| 2)
                               (|error| "cyclotomic_array: n must be odd"))
                              ('T
                               (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                    (EXIT (LETT |m| (* (- |f1| 1) |m|))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |m2| (|quotient_INT| |m| 2))
                  (LETT |pa|
                        (MAKEARR1
                         (PROG1 (LETT #3# (+ |m2| 1))
                           (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #3#))
                         0))
                  (LETT |fl1| (REVERSE (SPADCALL |fl1| (QREFELT % 32))))
                  (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl1|) |pa| |fl1| 1
                   %)
                  (EXIT |pa|))))))) 

(SDEFUN |CYCLOT2;cyclotomic;ISup;13|
        ((|n| (|Integer|)) (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fac| NIL) (#2=#:G219 NIL) (|f1| #1#) (|n1| (|Integer|))
          (|two_fac| (|Integer|)) (|fl1| (|List| (|Integer|)))
          (|m1| (|Integer|)) (|r1| (|SparseUnivariatePolynomial| (|Integer|)))
          (#3=#:G213 NIL) (|n2| (|Integer|)) (#4=#:G216 NIL))
         (SEQ
          (COND ((<= |n| 0) (|error| "cyclotomic: n must be positive"))
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 24)) (|spadConstant| % 35)
                           (QREFELT % 36)))
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 24)) (|spadConstant| % 35)
                           (QREFELT % 25)))
                (#5='T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 27))
                                  (QREFELT % 31)))
                  (LETT |n1| 1) (LETT |m1| 1) (LETT |fl1| NIL)
                  (LETT |two_fac| 1)
                  (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (LETT |n1| (* |f1| |n1|))
                            (EXIT
                             (COND ((EQL |f1| 2) (LETT |two_fac| -1))
                                   ('T
                                    (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                         (EXIT
                                          (LETT |m1| (* (- |f1| 1) |m1|))))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |r1|
                        (COND
                         ((NULL |fl1|)
                          (SPADCALL (SPADCALL 1 1 (QREFELT % 24))
                                    (|spadConstant| % 35) (QREFELT % 25)))
                         (#5#
                          (|CYCLOT2;cyclotomic_SPS1| |m1|
                           (REVERSE (SPADCALL |fl1| (QREFELT % 32))) |two_fac|
                           %))))
                  (LETT |n2|
                        (PROG2 (LETT #3# (|exquo_INT| |n| |n1|))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                          (|Union| (|Integer|) "failed") #3#)))
                  (EXIT
                   (COND
                    ((> |n2| 1)
                     (SPADCALL |r1|
                               (PROG1 (LETT #4# |n2|)
                                 (|check_subtype2| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #4#))
                               (QREFELT % 37)))
                    (#5# |r1|))))))))) 

(SDEFUN |CYCLOT2;inverse_cyclotomic_SPS1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|)))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|m2| (|Integer|)) (#1=#:G220 NIL)
          (|pa| (|PrimitiveArray| (|Integer|))) (#2=#:G228 NIL) (|i| NIL)
          (#3=#:G229 NIL) (#4=#:G224 NIL)
          (|res| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |m2| (|quotient_INT| |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #1# (+ |m2| 1))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     0))
              (|CYCLOT2;cyclotomic_SPS2| |m2| (LENGTH |fl|) |pa| |fl| -1 %)
              (LETT |res| (|spadConstant| % 23))
              (SEQ (LETT |i| 0) (LETT #2# |m2|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL (- (QAREF1 |pa| |i|)) |i|
                                               (QREFELT % 24))
                                     (QREFELT % 25)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| (- |m| |m2|)) (LETT #3# |m|) G190
                   (COND ((> |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL |res|
                                     (SPADCALL (QAREF1 |pa| (- |m| |i|))
                                               (PROG1 (LETT #4# |i|)
                                                 (|check_subtype2| (>= #4# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #4#))
                                               (QREFELT % 24))
                                     (QREFELT % 25)))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;inverse_cyclotomic;ISup;15|
        ((|n| (|Integer|)) (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fac| NIL) (#2=#:G241 NIL) (|f1| #1#) (|n1| (|Integer|))
          (|fl1| (|List| (|Integer|))) (|m1| (|Integer|))
          (|r1| (|SparseUnivariatePolynomial| (|Integer|))) (#3=#:G235 NIL)
          (|n2| (|Integer|)) (#4=#:G238 NIL))
         (SEQ
          (COND ((<= |n| 0) (|error| "inverse_cyclotomic: n must be positive"))
                ((EQL |n| 1) (|spadConstant| % 35))
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL 1 1 (QREFELT % 24)) (|spadConstant| % 35)
                           (QREFELT % 36)))
                (#5='T
                 (SEQ
                  (LETT |fl|
                        (SPADCALL (SPADCALL |n| (QREFELT % 27))
                                  (QREFELT % 31)))
                  (LETT |n1| 1) (LETT |m1| 1) (LETT |fl1| NIL)
                  (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |f1| (QVELT |fac| 1))
                            (LETT |n1| (* |f1| |n1|))
                            (LETT |fl1| (CONS |f1| |fl1|))
                            (EXIT (LETT |m1| (* (- |f1| 1) |m1|))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |r1|
                        (|CYCLOT2;inverse_cyclotomic_SPS1| (- |n1| |m1|)
                         (REVERSE (SPADCALL |fl1| (QREFELT % 32))) %))
                  (LETT |n2|
                        (PROG2 (LETT #3# (|exquo_INT| |n| |n1|))
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                          (|Union| (|Integer|) "failed") #3#)))
                  (EXIT
                   (COND
                    ((> |n2| 1)
                     (SPADCALL |r1|
                               (PROG1 (LETT #4# |n2|)
                                 (|check_subtype2| (>= #4# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #4#))
                               (QREFELT % 37)))
                    (#5# |r1|))))))))) 

(SDEFUN |CYCLOT2;mult_lst1|
        ((|f1| (|Integer|)) (|e| (|Integer|)) (|res| (|List| (|Integer|)))
         (|nres| (|List| (|Integer|))) (% (|List| (|Integer|))))
        (SPROG
         ((|m| NIL) (#1=#:G250 NIL) (|i| NIL) (#2=#:G251 NIL)
          (|fp| (|Integer|)))
         (SEQ
          (SEQ (LETT |m| NIL) (LETT #1# |res|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |m| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |fp| 1)
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #2# |e|) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ (LETT |fp| (* |f1| |fp|))
                               (EXIT (LETT |nres| (CONS (* |fp| |m|) |nres|))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |nres|)))) 

(SDEFUN |CYCLOT2;mult_lst|
        ((|fli| (|List| (|Integer|)))
         (|fl|
          (|List|
           (|Record| (|:| |factor| #1=(|Integer|))
                     (|:| |exponent| #2=(|NonNegativeInteger|)))))
         (|co| (|Boolean|)) (|two_fac| (|Integer|)) (% (|List| (|Integer|))))
        (SPROG
         ((|fac| NIL) (#3=#:G264 NIL) (|e| #2#) (|f1| #1#) (#4=#:G263 NIL)
          (#5=#:G262 NIL) (|res| (|List| (|Integer|))))
         (SEQ
          (EXIT
           (SEQ (LETT |res| (LIST 1))
                (SEQ (LETT |fac| NIL) (LETT #3# |fl|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |e| (QCDR |fac|)) (LETT |f1| (QCAR |fac|))
                            (COND
                             ((EQL |f1| 2)
                              (COND
                               (|co|
                                (EXIT
                                 (PROGN
                                  (LETT #4#
                                        (|CYCLOT2;mult_lst1| (EXPT 2 |e|) 1
                                         |res| NIL %))
                                  (GO #6=#:G261)))))))
                            (COND
                             ((EQL |f1| 2)
                              (COND
                               ((EQL |two_fac| -1)
                                (COND
                                 ((> |e| 1)
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|CYCLOT2;mult_lst1| 2 (- |e| 1)
                                           |res| |res| %))
                                    (GO #6#)))))))))
                            (EXIT
                             (COND
                              ((OR (NULL |fli|) (< (|SPADfirst| |fli|) |f1|))
                               (PROGN (LETT #5# |$NoValue|) (GO #7=#:G253)))
                              ((< |f1| (|SPADfirst| |fli|))
                               (|error| "wrong order of factors"))
                              ('T
                               (SEQ (LETT |fli| (CDR |fli|))
                                    (EXIT
                                     (COND
                                      ((EQL |e| 1)
                                       (PROGN (LETT #5# |$NoValue|) (GO #7#)))
                                      ('T
                                       (LETT |res|
                                             (|CYCLOT2;mult_lst1| |f1|
                                              (- |e| 1) |res| |res|
                                              %)))))))))))
                      #7# (EXIT #5#))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |res|)))
          #6# (EXIT #4#)))) 

(SDEFUN |CYCLOT2;gen_lists|
        ((|fl| (|List| (|Integer|))) (% (|List| (|List| (|Integer|)))))
        (SPROG
         ((|f1| NIL) (#1=#:G272 NIL) (|l1| NIL) (#2=#:G273 NIL)
          (|nres| #3=(|List| (|List| (|Integer|)))) (|res| #3#))
         (SEQ (LETT |res| (LIST NIL))
              (SEQ (LETT |f1| NIL) (LETT #1# |fl|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |f1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nres| |res|)
                        (SEQ (LETT |l1| NIL) (LETT #2# |res|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |l1| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |nres| (CONS (CONS |f1| |l1|) |nres|))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |res| |nres|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;add_mults|
        ((|p1| (|SparseUnivariatePolynomial| (|Integer|)))
         (|res| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|co| (|Boolean|)) (|two_fac| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|ml| (|List| (|Integer|))) (|mi| NIL) (#1=#:G282 NIL)
          (#2=#:G277 NIL) (|pi| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |ml| (|CYCLOT2;mult_lst| |fl| |fl0| |co| |two_fac| %))
              (SEQ (LETT |mi| NIL) (LETT #1# |ml|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mi| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pi|
                          (SPADCALL |p1|
                                    (PROG1 (LETT #2# |mi|)
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    (QREFELT % 37)))
                    (EXIT (LETT |res| (CONS |pi| |res|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;add_factors|
        ((|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|two_fac| (|Integer|)) (|co| (|Boolean|))
         (|pa| (|PrimitiveArray| (|Integer|)))
         (|res| (|List| (|SparseUnivariatePolynomial| (|Integer|))))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|nn| (|NonNegativeInteger|))
          (|fac|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (#1=#:G304 NIL) (|f1| NIL) (#2=#:G305 NIL) (|m| (|Integer|))
          (|m2| (|Integer|)) (|k| (|NonNegativeInteger|)) (|i| NIL)
          (#3=#:G306 NIL) (|p1| (|SparseUnivariatePolynomial| (|Integer|))))
         (SEQ (LETT |m| 1)
              (EXIT
               (COND
                ((NULL |fl|)
                 (COND
                  (|co|
                   (SEQ (LETT |fac| (SPADCALL |fl0| (QREFELT % 42)))
                        (LETT |nn|
                              (COND
                               ((EQL (QCAR |fac|) 2) (EXPT 2 (QCDR |fac|)))
                               (#4='T 1)))
                        (LETT |p1|
                              (SPADCALL (SPADCALL 1 |nn| (QREFELT % 24))
                                        (|spadConstant| % 35) (QREFELT % 25)))
                        (EXIT (CONS |p1| |res|))))
                  (#4#
                   (SEQ
                    (LETT |p1|
                          (SPADCALL (SPADCALL 1 1 (QREFELT % 24))
                                    (SPADCALL |two_fac| (QREFELT % 43))
                                    (QREFELT % 36)))
                    (LETT |res| (CONS |p1| |res|))
                    (EXIT
                     (COND
                      ((EQL |two_fac| -1)
                       (SEQ (LETT |fac| (SPADCALL |fl0| (QREFELT % 42)))
                            (COND
                             ((NULL (EQL (QCAR |fac|) 2))
                              (EXIT (|error| "impossible factor"))))
                            (SEQ (LETT |i| 2) (LETT #1# (QCDR |fac|)) G190
                                 (COND ((|greater_SI| |i| #1#) (GO G191)))
                                 (SEQ
                                  (LETT |p1| (SPADCALL |p1| 2 (QREFELT % 37)))
                                  (EXIT (LETT |res| (CONS |p1| |res|))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |p1|
                                  (SPADCALL (SPADCALL 1 1 (QREFELT % 24))
                                            (|spadConstant| % 35)
                                            (QREFELT % 36)))
                            (EXIT (CONS |p1| |res|))))
                      (#4# |res|)))))))
                (#4#
                 (SEQ
                  (SEQ (LETT |f1| NIL) (LETT #2# |fl|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT |m| (* (- |f1| 1) |m|))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (LETT |m2| (|quotient_INT| |m| 2)) (LETT |k| (LENGTH |fl|))
                  (SEQ (LETT |i| 0) (LETT #3# |m2|) G190
                       (COND ((|greater_SI| |i| #3#) (GO G191)))
                       (SEQ (EXIT (QSETAREF1 |pa| |i| 0)))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (|CYCLOT2;cyclotomic_SPS2| |m2| |k| |pa| |fl| 1 %)
                  (EXIT
                   (COND
                    (|co|
                     (SEQ (LETT |p1| (|CYCLOT2;gen_poly| |m| |m2| |pa| -1 %))
                          (EXIT
                           (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co| -1
                            %))))
                    (#4#
                     (SEQ (LETT |p1| (|CYCLOT2;gen_poly| |m| |m2| |pa| 1 %))
                          (LETT |res|
                                (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co|
                                 1 %))
                          (EXIT
                           (COND
                            ((EQL |two_fac| -1)
                             (SEQ
                              (LETT |p1|
                                    (|CYCLOT2;gen_poly| |m| |m2| |pa| -1 %))
                              (EXIT
                               (|CYCLOT2;add_mults| |p1| |res| |fl| |fl0| |co|
                                -1 %))))
                            (#4# |res|)))))))))))))) 

(SDEFUN |CYCLOT2;cyclo_decomposition1|
        ((|m| (|Integer|)) (|fl| (|List| (|Integer|)))
         (|fl0|
          (|List|
           (|Record| (|:| |factor| (|Integer|))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (|two_fac| (|Integer|)) (|co| (|Boolean|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|m2| (|Integer|)) (#1=#:G308 NIL)
          (|pa| (|PrimitiveArray| (|Integer|)))
          (|ll| (|List| (|List| (|Integer|)))) (|fl1| NIL) (#2=#:G313 NIL)
          (|res| (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
         (SEQ (LETT |m2| (|quotient_INT| |m| 2))
              (LETT |pa|
                    (MAKEARR1
                     (PROG1 (LETT #1# (+ |m2| 1))
                       (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #1#))
                     0))
              (LETT |ll| (|CYCLOT2;gen_lists| (REVERSE |fl|) %))
              (LETT |res| NIL)
              (SEQ (LETT |fl1| NIL) (LETT #2# |ll|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fl1| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|CYCLOT2;add_factors| |fl1| |fl0| |two_fac| |co|
                            |pa| |res| %))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |CYCLOT2;cyclo_decomposition|
        ((|n| (|Integer|)) (|co| (|Boolean|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (SPROG
         ((|fl|
           (|List|
            (|Record| (|:| |factor| #1=(|Integer|))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fac| NIL) (#2=#:G322 NIL) (|f1| #1#) (|two_fac| #3=(|Integer|))
          (|fl1| (|List| (|Integer|))) (|m1| #3#))
         (SEQ
          (LETT |fl| (SPADCALL (SPADCALL |n| (QREFELT % 27)) (QREFELT % 44)))
          (LETT |fl1| NIL) (LETT |m1| 1) (LETT |two_fac| 1)
          (SEQ (LETT |fac| NIL) (LETT #2# |fl|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL)) (GO G191)))
               (SEQ (LETT |f1| (QCAR |fac|))
                    (EXIT
                     (COND ((EQL |f1| 2) (LETT |two_fac| -1))
                           ('T
                            (SEQ (LETT |fl1| (CONS |f1| |fl1|))
                                 (EXIT (LETT |m1| (* (- |f1| 1) |m1|))))))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (|CYCLOT2;cyclo_decomposition1| |m1| |fl1| (REVERSE |fl|) |two_fac|
            |co| %))))) 

(SDEFUN |CYCLOT2;cyclotomic_decomposition;IL;23|
        ((|n| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (COND
         ((<= |n| 0) (|error| "cyclotomic_decomposition: n must be positive"))
         ((EQL |n| 1)
          (LIST
           (SPADCALL (SPADCALL 1 1 (QREFELT % 24)) (|spadConstant| % 35)
                     (QREFELT % 36))))
         ('T (|CYCLOT2;cyclo_decomposition| |n| NIL %)))) 

(SDEFUN |CYCLOT2;cocyclotomic_decomposition;IL;24|
        ((|n| (|Integer|))
         (% (|List| (|SparseUnivariatePolynomial| (|Integer|)))))
        (COND
         ((<= |n| 0)
          (|error| "cocyclotomic_decomposition: n must be positive"))
         ((EQL |n| 1)
          (LIST
           (SPADCALL (SPADCALL 1 1 (QREFELT % 24)) (|spadConstant| % 35)
                     (QREFELT % 25))))
         ('T (|CYCLOT2;cyclo_decomposition| |n| 'T %)))) 

(DECLAIM (NOTINLINE |CyclotomicUtilities;|)) 

(DEFUN |CyclotomicUtilities;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CyclotomicUtilities|))
          (LETT % (GETREFV 48))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CyclotomicUtilities| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |CyclotomicUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G326)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CyclotomicUtilities|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CyclotomicUtilities|
                             (LIST
                              (CONS NIL (CONS 1 (|CyclotomicUtilities;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CyclotomicUtilities|)))))))))) 

(MAKEPROP '|CyclotomicUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Boolean|) (|Integer|) (0 . |prime?|)
              (|Factored| 7) (5 . |1|) (9 . |0|) (|List| 7) (13 . |append|)
              (|IntegerRoots| 7) (19 . |approxSqrt|) (|NonNegativeInteger|)
              (|SparseUnivariatePolynomial| 7) (24 . |degree|)
              (29 . |leadingCoefficient|) (34 . |reductum|)
              (|Union| 7 '#1="failed") |CYCLOT2;cyclotomic?;SupU;7| (39 . |0|)
              (43 . |monomial|) (49 . +) (|IntegerFactorizationPackage| 7)
              (55 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 28) (|:| |factor| 7) (|:| |exponent| 16))
              (|List| 29) (60 . |factorList|) (65 . |sort|)
              (|PrimitiveArray| 7) |CYCLOT2;cyclotomic_array;IPa;12| (70 . |1|)
              (74 . -) (80 . |multiplyExponents|) |CYCLOT2;cyclotomic;ISup;13|
              |CYCLOT2;inverse_cyclotomic;ISup;15|
              (|Record| (|:| |factor| 7) (|:| |exponent| 16)) (|List| 40)
              (86 . |last|) (91 . |coerce|) (96 . |factors|) (|List| 17)
              |CYCLOT2;cyclotomic_decomposition;IL;23|
              |CYCLOT2;cocyclotomic_decomposition;IL;24|)
           '#(|inverse_cyclotomic| 101 |cyclotomic_decomposition| 106
              |cyclotomic_array| 111 |cyclotomic?| 116 |cyclotomic| 121
              |cocyclotomic_decomposition| 126)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|cyclotomic|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|cyclotomic_array|
                                 ((|PrimitiveArray| (|Integer|)) (|Integer|)))
                                T)
                              '((|inverse_cyclotomic|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|Integer|)))
                                T)
                              '((|cyclotomic?|
                                 ((|Union| (|Integer|) #1#)
                                  (|SparseUnivariatePolynomial| (|Integer|))))
                                T)
                              '((|cyclotomic_decomposition|
                                 ((|List|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T)
                              '((|cocyclotomic_decomposition|
                                 ((|List|
                                   (|SparseUnivariatePolynomial| (|Integer|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 47
                                            '(1 7 6 0 8 0 9 0 10 0 9 0 11 2 12
                                              0 0 0 13 1 14 7 7 15 1 17 16 0 18
                                              1 17 7 0 19 1 17 0 0 20 0 17 0 23
                                              2 17 0 7 16 24 2 17 0 0 0 25 1 26
                                              9 7 27 1 9 30 0 31 1 12 0 0 32 0
                                              17 0 35 2 17 0 0 0 36 2 17 0 0 16
                                              37 1 41 40 0 42 1 17 0 7 43 1 9
                                              41 0 44 1 0 17 7 39 1 0 45 7 46 1
                                              0 33 7 34 1 0 21 17 22 1 0 17 7
                                              38 1 0 45 7 47)))))
           '|lookupComplete|)) 
