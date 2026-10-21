
(SDEFUN |DFSFUN2;bernoulli_gamma_series_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|zinv| (|Complex| (|DoubleFloat|)))
          (|z2inv| (|Complex| (|DoubleFloat|))) (|k| NIL)
          (|s| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 13) |z| (QREFELT % 14)))
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 15)))
              (LETT |s| (SPADCALL (DELT (QREFELT % 9) 10) 0.0 (QREFELT % 17)))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |z2inv| |s| (QREFELT % 15))
                                     (SPADCALL (DELT (QREFELT % 9) |k|) 0.0
                                               (QREFELT % 17))
                                     (QREFELT % 18)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |zinv| |s| (QREFELT % 15)))))) 

(SDEFUN |DFSFUN2;bernoulli_gamma_series_DF|
        ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|zinv| (|DoubleFloat|)) (|z2inv| (|DoubleFloat|)) (|k| NIL)
          (|s| (|DoubleFloat|)))
         (SEQ (LETT |zinv| (|div_DF| 1.0 |z|))
              (LETT |z2inv| (|mul_DF| |zinv| |zinv|))
              (LETT |s| (DELT (QREFELT % 9) 10))
              (SEQ (LETT |k| 9) G190 (COND ((< |k| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (|add_DF| (|mul_DF| |z2inv| |s|)
                                     (DELT (QREFELT % 9) |k|)))))
                   (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
              (EXIT (|mul_DF| |zinv| |s|))))) 

(SDEFUN |DFSFUN2;logGamma_a1_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z| (SPADCALL (|mk_DF| 5 -1) 0.0 (QREFELT % 17))
                     (QREFELT % 22))
           (SPADCALL |z| (QREFELT % 23)) (QREFELT % 15))
          |z| (QREFELT % 22))
         (SPADCALL (QREFELT % 19) 0.0 (QREFELT % 17)) (QREFELT % 18))) 

(SDEFUN |DFSFUN2;logGamma_a1_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|add_DF|
         (|sub_DF|
          (|mul_DF| (|sub_DF| |z| (|mk_DF| 5 -1))
                    (SPADCALL |z| (QREFELT % 24)))
          |z|)
         (QREFELT % 19))) 

(SDEFUN |DFSFUN2;logGamma1_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL (|DFSFUN2;logGamma_a1_CDF| |z| %)
                  (|DFSFUN2;bernoulli_gamma_series_CDF| |z| %) (QREFELT % 18))) 

(SDEFUN |DFSFUN2;logGamma1_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|add_DF| (|DFSFUN2;logGamma_a1_DF| |z| %)
                  (|DFSFUN2;bernoulli_gamma_series_DF| |z| %))) 

(SDEFUN |DFSFUN2;Gamma_taylor| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|z1| (|DoubleFloat|)) (|z2| (|DoubleFloat|)) (|i| NIL)
          (|s| (|DoubleFloat|)))
         (SEQ (LETT |s| 0.0) (LETT |z1| (|sub_DF| |z| (|mk_DF| 15 -1)))
              (LETT |z2| (|mul_DF| |z1| |z1|))
              (SEQ (LETT |i| 18) G190 (COND ((< |i| 0) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (|add_DF|
                            (|add_DF| (|mul_DF| |z2| |s|)
                                      (|mul_DF| |z1|
                                                (DELT (QREFELT % 25)
                                                      (+ |i| 1))))
                            (DELT (QREFELT % 25) |i|)))))
                   (LETT |i| (+ |i| -2)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (|div_DF| 1.0
                         (|add_DF| 1.0
                                   (|mul_DF| (|mul_DF| |s| (|sub_DF| |z| 1.0))
                                             (|sub_DF| |z|
                                                       (FLOAT 2
                                                              MOST-POSITIVE-DOUBLE-FLOAT))))))))) 

(SDEFUN |DFSFUN2;Gamma1a_DF| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|exp_DF| (|DFSFUN2;logGamma1_DF| |z| %))) 

(SDEFUN |DFSFUN2;Gamma;2Df;9| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|z_int| (|DoubleFloat|)) (|z1| (|DoubleFloat|))
          (|sign| (|DoubleFloat|)) (|p| (|DoubleFloat|)))
         (SEQ
          (COND
           ((|less_DF| |z| 0.0)
            (SEQ (LETT |z_int| (SPADCALL |z| (QREFELT % 27)))
                 (LETT |z1| (|sub_DF| |z| |z_int|))
                 (EXIT
                  (COND ((|eql_DF| |z1| 0.0) (|error| "Pole of Gamma"))
                        (#1='T
                         (SEQ
                          (LETT |sign|
                                (COND
                                 ((ODDP (SPADCALL |z_int| (QREFELT % 29)))
                                  (|minus_DF| 1.0))
                                 (#1# 1.0)))
                          (EXIT
                           (|div_DF| (|mul_DF| |sign| (QREFELT % 20))
                                     (|mul_DF|
                                      (SPADCALL (|sub_DF| 1.0 |z|)
                                                (QREFELT % 30))
                                      (|sin_DF|
                                       (|mul_DF| (QREFELT % 20) |z1|)))))))))))
           ((|less_DF| |z| 1.0)
            (|div_DF| (|DFSFUN2;Gamma_taylor| (|add_DF| |z| 1.0) %) |z|))
           (#1#
            (COND ((|less_DF| (|mk_DF| 9 0) |z|) (|DFSFUN2;Gamma1a_DF| |z| %))
                  ((|less_DF| (|mk_DF| 2 0) |z|)
                   (SEQ (LETT |p| 1.0)
                        (SEQ G190
                             (COND
                              ((NULL (|less_DF| (|mk_DF| 2 0) |z|)) (GO G191)))
                             (SEQ (LETT |z| (|sub_DF| |z| 1.0))
                                  (EXIT (LETT |p| (|mul_DF| |p| |z|))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT (|mul_DF| |p| (|DFSFUN2;Gamma_taylor| |z| %)))))
                  (#1# (|DFSFUN2;Gamma_taylor| |z| %)))))))) 

(SDEFUN |DFSFUN2;Beta;3Df;10|
        ((|a| (|DoubleFloat|)) (|b| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|div_DF|
         (|mul_DF| (SPADCALL |a| (QREFELT % 30)) (SPADCALL |b| (QREFELT % 30)))
         (SPADCALL (|add_DF| |a| |b|) (QREFELT % 30)))) 

(SDEFUN |DFSFUN2;logGamma;2Df;11| ((|z| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (COND
         ((|less_DF| 0.0 |z|)
          (COND ((|less_DF| (|mk_DF| 8 0) |z|) (|DFSFUN2;logGamma1_DF| |z| %))
                (#1='T
                 (SPADCALL (SPADCALL |z| (QREFELT % 30)) (QREFELT % 24)))))
         (#1# (|error| "logGamma: nonpositive z")))) 

(SDEFUN |DFSFUN2;Gamma1a_CDF|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL (|DFSFUN2;logGamma1_CDF| |z| %) (QREFELT % 33))) 

(SDEFUN |DFSFUN2;Gamma1b|
        ((|z| #1=(|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|i| NIL) (|zp| #1#))
               (SEQ (LETT |zp| |z|)
                    (SEQ (LETT |i| 1) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |zp|
                                 (SPADCALL |zp|
                                           (SPADCALL |z|
                                                     (SPADCALL
                                                      (FLOAT |i|
                                                             MOST-POSITIVE-DOUBLE-FLOAT)
                                                      0.0 (QREFELT % 17))
                                                     (QREFELT % 18))
                                           (QREFELT % 15)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL
                      (|DFSFUN2;Gamma1a_CDF|
                       (SPADCALL |z|
                                 (SPADCALL (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                                           0.0 (QREFELT % 17))
                                 (QREFELT % 18))
                       %)
                      |zp| (QREFELT % 14)))))) 

(SDEFUN |DFSFUN2;Gamma;2C;14|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|zi| (|DoubleFloat|)) (|zr| (|DoubleFloat|))
          (|z_int| (|DoubleFloat|)) (|z1| (|Complex| (|DoubleFloat|)))
          (|sign| (|DoubleFloat|)))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT % 34)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;Gamma1a_CDF| |z| %))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 35)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;Gamma1a_CDF| |z| %))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ (LETT |z_int| (SPADCALL |zr| (QREFELT % 27)))
                              (LETT |z1|
                                    (SPADCALL |z|
                                              (SPADCALL |z_int| 0.0
                                                        (QREFELT % 17))
                                              (QREFELT % 22)))
                              (EXIT
                               (COND
                                ((SPADCALL |z1| (|spadConstant| % 36)
                                           (QREFELT % 38))
                                 (|error| "Pole of Gamma"))
                                (#1#
                                 (SEQ
                                  (LETT |sign|
                                        (COND
                                         ((ODDP
                                           (SPADCALL |z_int| (QREFELT % 29)))
                                          (|minus_DF| 1.0))
                                         (#1# 1.0)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (|mul_DF| |sign| (QREFELT % 20))
                                              0.0 (QREFELT % 17))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 13) |z|
                                                (QREFELT % 22))
                                      (QREFELT % 39))
                                     (SPADCALL
                                      (SPADCALL (QREFELT % 20) |z1|
                                                (QREFELT % 40))
                                      (QREFELT % 41))
                                     (QREFELT % 15))
                                    (QREFELT % 14)))))))))
                        (#1# (|DFSFUN2;Gamma1b| |z| %))))))))))) 

(SDEFUN |DFSFUN2;logGamma1b|
        ((|z| #1=(|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|i| NIL) (|p1| #1#) (|lp1| (|Complex| (|DoubleFloat|))))
               (SEQ (LETT |p1| |z|)
                    (SEQ (LETT |i| 1) G190
                         (COND ((|greater_SI| |i| 7) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |p1|
                                 (SPADCALL |p1|
                                           (SPADCALL |z|
                                                     (SPADCALL
                                                      (FLOAT |i|
                                                             MOST-POSITIVE-DOUBLE-FLOAT)
                                                      0.0 (QREFELT % 17))
                                                     (QREFELT % 18))
                                           (QREFELT % 15)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |lp1| (SPADCALL |p1| (QREFELT % 23)))
                    (COND
                     ((|less_DF| (SPADCALL |lp1| (QREFELT % 34)) 0.0)
                      (LETT |lp1|
                            (SPADCALL |lp1|
                                      (SPADCALL 0.0
                                                (|mul_DF| (|mk_DF| 2 0)
                                                          (QREFELT % 20))
                                                (QREFELT % 17))
                                      (QREFELT % 18)))))
                    (EXIT
                     (SPADCALL
                      (|DFSFUN2;logGamma1_CDF|
                       (SPADCALL |z|
                                 (SPADCALL (|mk_DF| 8 0) 0.0 (QREFELT % 17))
                                 (QREFELT % 18))
                       %)
                      |lp1| (QREFELT % 22)))))) 

(SDEFUN |DFSFUN2;log_sin|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|zi| (|DoubleFloat|)) (|n| (|DoubleFloat|))
          (|res1| (|Complex| (|DoubleFloat|))) (|zr| (|DoubleFloat|))
          (|res2| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 35)))
              (LETT |zi| (SPADCALL |z| (QREFELT % 34)))
              (LETT |n| (SPADCALL |zr| (QREFELT % 27)))
              (LETT |res1|
                    (COND
                     ((|less_DF| |zi| 0.0)
                      (SPADCALL 0.0 (|mul_DF| |n| (QREFELT % 20))
                                (QREFELT % 17)))
                     (#1='T
                      (SPADCALL 0.0 (|minus_DF| (|mul_DF| |n| (QREFELT % 20)))
                                (QREFELT % 17)))))
              (LETT |zr| (|sub_DF| |zr| |n|))
              (LETT |z|
                    (SPADCALL (|mul_DF| (QREFELT % 20) |zr|)
                              (|mul_DF| (QREFELT % 20) |zi|) (QREFELT % 17)))
              (LETT |res2|
                    (COND
                     ((|less_DF| |zr| 0.0)
                      (COND
                       ((|less_DF| |zi| 0.0)
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 44))
                                    (QREFELT % 41))
                          (QREFELT % 23))
                         (SPADCALL 0.0 (QREFELT % 20) (QREFELT % 17))
                         (QREFELT % 22)))
                       (#1#
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 44))
                                    (QREFELT % 41))
                          (QREFELT % 23))
                         (SPADCALL 0.0 (QREFELT % 20) (QREFELT % 17))
                         (QREFELT % 18)))))
                     (#1#
                      (SPADCALL (SPADCALL |z| (QREFELT % 41))
                                (QREFELT % 23)))))
              (EXIT (SPADCALL |res1| |res2| (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;logGamma;2C;17|
        ((|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|zi| (|DoubleFloat|)) (|zr| (|DoubleFloat|))
          (|res1| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |zi| (SPADCALL |z| (QREFELT % 34)))
              (EXIT
               (COND
                ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)
                            (|abs_DF| |zi|))
                 (|DFSFUN2;logGamma1_CDF| |z| %))
                (#1='T
                 (SEQ (LETT |zr| (SPADCALL |z| (QREFELT % 35)))
                      (EXIT
                       (COND
                        ((|less_DF| (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT) |zr|)
                         (|DFSFUN2;logGamma1_CDF| |z| %))
                        ((|less_DF| |zr| (|mk_DF| 5 -1))
                         (SEQ
                          (LETT |res1|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1.0 0.0 (QREFELT % 17))
                                           |z| (QREFELT % 22))
                                 (QREFELT % 45)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT % 21) 0.0 (QREFELT % 17))
                             (|DFSFUN2;log_sin| |z| %) (QREFELT % 22))
                            |res1| (QREFELT % 22)))))
                        ((|less_DF| |zi| 0.0)
                         (SPADCALL
                          (|DFSFUN2;logGamma1b| (SPADCALL |z| (QREFELT % 46))
                           %)
                          (QREFELT % 46)))
                        (#1# (|DFSFUN2;logGamma1b| |z| %))))))))))) 

(SDEFUN |DFSFUN2;Beta;3C;18|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 39)) (SPADCALL |y| (QREFELT % 39))
                   (QREFELT % 15))
         (SPADCALL (SPADCALL |x| |y| (QREFELT % 18)) (QREFELT % 39))
         (QREFELT % 14))) 

(SDEFUN |DFSFUN2;psi_W2_DF|
        ((|x| (|DoubleFloat|)) (|s| (|DoubleFloat|))
         (|n| (|NonNegativeInteger|)) (|m| (|Integer|)) (% (|DoubleFloat|)))
        (SPROG
         ((|nn| (|Integer|)) (|i| NIL) (#1=#:G93 NIL) (|xm| (|DoubleFloat|)))
         (SEQ (LETT |nn| (- -1 |n|))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |xm|
                          (|add_DF| |x|
                                    (FLOAT (- |m| |i|)
                                           MOST-POSITIVE-DOUBLE-FLOAT)))
                    (EXIT (LETT |s| (|add_DF| |s| (|expt_DF_I| |xm| |nn|)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling1_DF|
        ((|t| (|DoubleFloat|)) (|x2_inv| (|DoubleFloat|))
         (|r_eps| (|DoubleFloat|)) (|df_n| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|k| NIL) (|ccn| (|DoubleFloat|)) (|tk| (|DoubleFloat|))
          (#1=#:G100 NIL) (|s| (|DoubleFloat|)) (|df_k| (|DoubleFloat|)))
         (SEQ (LETT |s| 0.0) (LETT |df_k| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
              (SEQ
               (EXIT
                (SEQ (LETT |k| 2) G190 (COND ((|greater_SI| |k| 21) (GO G191)))
                     (SEQ
                      (LETT |ccn|
                            (|div_DF|
                             (|mul_DF| (|add_DF| (|add_DF| |df_k| 1.0) |df_n|)
                                       (|add_DF| |df_k| |df_n|))
                             (|mul_DF| (|add_DF| |df_k| 1.0)
                                       (|add_DF| |df_k|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)))))
                      (LETT |t| (|mul_DF| (|mul_DF| |ccn| |t|) |x2_inv|))
                      (LETT |tk| (|mul_DF| (DELT (QREFELT % 48) |k|) |t|))
                      (EXIT
                       (COND
                        ((|less_DF| (|abs_DF| |tk|) |r_eps|)
                         (PROGN (LETT #1# 1) (GO #2=#:G97)))
                        ('T
                         (SEQ (LETT |s| (|add_DF| |s| |tk|))
                              (EXIT
                               (LETT |df_k|
                                     (|add_DF| |df_k|
                                               (FLOAT 2
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling_DF|
        ((|xm| (|DoubleFloat|)) (|n| (|NonNegativeInteger|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|xm_inv| (|DoubleFloat|)) (|x2_inv| #1=(|DoubleFloat|))
          (|df_n| (|DoubleFloat|)) (|t| #1#) (|r_eps| #1#) (|t0| #1#)
          (|t1| #1#) (|s| (|DoubleFloat|)))
         (SEQ (LETT |xm_inv| (|div_DF| 1.0 |xm|))
              (LETT |x2_inv| (|mul_DF| |xm_inv| |xm_inv|))
              (LETT |df_n| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
              (LETT |t0| (|mul_DF| (|mk_DF| 5 -1) |xm_inv|))
              (LETT |t|
                    (|mul_DF| (|mul_DF| (|add_DF| |df_n| 1.0) (|mk_DF| 5 -1))
                              |x2_inv|))
              (LETT |r_eps| (|mul_DF| (|mk_DF| 1 -18) (|abs_DF| |t0|)))
              (COND
               ((> |n| 0) (LETT |t0| (|add_DF| |t0| (|div_DF| 1.0 |df_n|)))))
              (LETT |t1| (|mul_DF| (DELT (QREFELT % 48) 1) |t|))
              (LETT |s|
                    (COND ((|less_DF| (|abs_DF| |t1|) |r_eps|) 0.0)
                          ('T
                           (|add_DF| |t1|
                                     (|DFSFUN2;W_stirling1_DF| |t| |x2_inv|
                                      |r_eps| |df_n| %)))))
              (EXIT (|add_DF| |t0| |s|))))) 

(SDEFUN |DFSFUN2;psi_W1_DF|
        ((|x| (|DoubleFloat|)) (|n| (|NonNegativeInteger|)) (|m| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG ((|xm| (|DoubleFloat|)) (|s| (|DoubleFloat|)))
               (SEQ
                (LETT |xm|
                      (|add_DF| |x| (FLOAT |m| MOST-POSITIVE-DOUBLE-FLOAT)))
                (LETT |s|
                      (|mul_DF| (|expt_DF_I| |xm| (- |n|))
                                (|DFSFUN2;W_stirling_DF| |xm| |n| %)))
                (COND
                 ((EQL |n| 0)
                  (LETT |s| (|sub_DF| |s| (SPADCALL |xm| (QREFELT % 24))))))
                (EXIT (|DFSFUN2;psi_W2_DF| |x| |s| |n| |m| %))))) 

(SDEFUN |DFSFUN2;cabs| ((|z| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL (SPADCALL |z| (QREFELT % 49)) (QREFELT % 50))) 

(SDEFUN |DFSFUN2;psi_W2_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (|s| (|Complex| (|DoubleFloat|)))
         (|n| (|NonNegativeInteger|)) (|m| (|Integer|))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|nn| (|Integer|)) (|i| NIL) (#1=#:G112 NIL)
          (|xm| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |nn| (- -1 |n|))
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |xm|
                          (SPADCALL |x|
                                    (SPADCALL
                                     (FLOAT (- |m| |i|)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (QREFELT % 51))
                                    (QREFELT % 18)))
                    (EXIT
                     (LETT |s|
                           (SPADCALL |s| (SPADCALL |xm| |nn| (QREFELT % 52))
                                     (QREFELT % 18)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling1_CDF|
        ((|t| (|Complex| (|DoubleFloat|)))
         (|x2_inv| (|Complex| (|DoubleFloat|))) (|r_eps| (|DoubleFloat|))
         (|df_n| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|k| NIL) (|ccn| (|DoubleFloat|)) (|tk| (|Complex| (|DoubleFloat|)))
          (#1=#:G119 NIL) (|s| (|Complex| (|DoubleFloat|)))
          (|df_k| (|DoubleFloat|)))
         (SEQ (LETT |s| (|spadConstant| % 36))
              (LETT |df_k| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT))
              (SEQ
               (EXIT
                (SEQ (LETT |k| 2) G190 (COND ((|greater_SI| |k| 21) (GO G191)))
                     (SEQ
                      (LETT |ccn|
                            (|div_DF|
                             (|mul_DF| (|add_DF| (|add_DF| |df_k| 1.0) |df_n|)
                                       (|add_DF| |df_k| |df_n|))
                             (|mul_DF| (|add_DF| |df_k| 1.0)
                                       (|add_DF| |df_k|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)))))
                      (LETT |t|
                            (SPADCALL (SPADCALL |ccn| |t| (QREFELT % 40))
                                      |x2_inv| (QREFELT % 15)))
                      (LETT |tk|
                            (SPADCALL (DELT (QREFELT % 48) |k|) |t|
                                      (QREFELT % 40)))
                      (EXIT
                       (COND
                        ((|less_DF| (|DFSFUN2;cabs| |tk| %) |r_eps|)
                         (PROGN (LETT #1# 1) (GO #2=#:G116)))
                        ('T
                         (SEQ (LETT |s| (SPADCALL |s| |tk| (QREFELT % 18)))
                              (EXIT
                               (LETT |df_k|
                                     (|add_DF| |df_k|
                                               (FLOAT 2
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |s|)))) 

(SDEFUN |DFSFUN2;W_stirling_CDF|
        ((|xm| (|Complex| (|DoubleFloat|))) (|n| (|NonNegativeInteger|))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xm_inv| (|Complex| (|DoubleFloat|)))
          (|x2_inv| (|Complex| (|DoubleFloat|))) (|df_n| (|DoubleFloat|))
          (|t| #1=(|Complex| (|DoubleFloat|))) (|r_eps| (|DoubleFloat|))
          (|t0| #1#) (|t1| #1#) (|s| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |xm_inv| (SPADCALL (|spadConstant| % 13) |xm| (QREFELT % 14)))
          (LETT |x2_inv| (SPADCALL |xm_inv| |xm_inv| (QREFELT % 15)))
          (LETT |df_n| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT))
          (LETT |t0| (SPADCALL (|mk_DF| 5 -1) |xm_inv| (QREFELT % 40)))
          (LETT |t|
                (SPADCALL (|mul_DF| (|add_DF| |df_n| 1.0) (|mk_DF| 5 -1))
                          |x2_inv| (QREFELT % 40)))
          (LETT |r_eps| (|mul_DF| (|mk_DF| 1 -18) (|DFSFUN2;cabs| |t0| %)))
          (COND
           ((> |n| 0)
            (LETT |t0|
                  (SPADCALL |t0|
                            (SPADCALL (|div_DF| 1.0 |df_n|) (QREFELT % 51))
                            (QREFELT % 18)))))
          (LETT |t1| (SPADCALL (DELT (QREFELT % 48) 1) |t| (QREFELT % 40)))
          (LETT |s|
                (COND
                 ((|less_DF| (|DFSFUN2;cabs| |t1| %) |r_eps|)
                  (|spadConstant| % 36))
                 ('T
                  (SPADCALL |t1|
                            (|DFSFUN2;W_stirling1_CDF| |t| |x2_inv| |r_eps|
                             |df_n| %)
                            (QREFELT % 18)))))
          (EXIT (SPADCALL |t0| |s| (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;psi_W1_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (|n| (|NonNegativeInteger|))
         (|m| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xm| (|Complex| (|DoubleFloat|))) (|s| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |xm|
                (SPADCALL |x|
                          (SPADCALL (FLOAT |m| MOST-POSITIVE-DOUBLE-FLOAT)
                                    (QREFELT % 51))
                          (QREFELT % 18)))
          (LETT |s|
                (SPADCALL (SPADCALL |xm| (- |n|) (QREFELT % 52))
                          (|DFSFUN2;W_stirling_CDF| |xm| |n| %)
                          (QREFELT % 15)))
          (COND
           ((EQL |n| 0)
            (LETT |s|
                  (SPADCALL |s| (SPADCALL |xm| (QREFELT % 23))
                            (QREFELT % 22)))))
          (EXIT (|DFSFUN2;psi_W2_CDF| |x| |s| |n| |m| %))))) 

(SDEFUN |DFSFUN2;min_asymp| ((|n| (|NonNegativeInteger|)) (% (|DoubleFloat|)))
        (SPROG ((|slope| #1=(|DoubleFloat|)) (|xm| #1#))
               (SEQ
                (LETT |slope|
                      (|add_DF| (|mk_DF| 21 -2)
                                (|mul_DF| (QREFELT % 53)
                                          (|add_DF|
                                           (|mul_DF| (|mk_DF| 6038 -7)
                                                     (QREFELT % 53))
                                           (|mk_DF| 8677 -6)))))
                (EXIT
                 (LETT |xm|
                       (|add_DF|
                        (|add_DF| (|mk_DF| 350 -2)
                                  (|mul_DF| (QREFELT % 53) (|mk_DF| 40 -2)))
                        (SPADCALL |n| |slope| (QREFELT % 55)))))))) 

(SDEFUN |DFSFUN2;cot_diff|
        ((|x| (|DoubleFloat|)) (|n| (|NonNegativeInteger|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|cot_x| (|DoubleFloat|)) (|nn| #1=(|NonNegativeInteger|))
          (|v| (|DoubleFloatVector|)) (#2=#:G140 NIL) (|j| #1#)
          (|j1| (|Integer|)) (|k| NIL) (#3=#:G141 NIL)
          (|t1| #4=(|DoubleFloat|)) (|t| #5=(|DoubleFloat|))
          (|r0| (|DoubleFloat|)) (|u| #4#) (|i| NIL) (|res| #5#))
         (SEQ (LETT |cot_x| (COT |x|))
              (EXIT
               (COND ((EQL |n| 0) |cot_x|)
                     (#6='T
                      (SEQ (LETT |nn| (|quotient_INT| (+ |n| 1) 2))
                           (LETT |v| (MAKE_DOUBLE_VECTOR1 (+ |nn| 1) 0.0))
                           (DSETELT |v| 0 (DSETELT |v| 1 1.0))
                           (SEQ (LETT |i| 2) (LETT #2# |n|) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ (LETT |j| (|quotient_INT| (+ |i| 1) 2))
                                     (LETT |t| 0.0)
                                     (LETT |j1| (COND ((ODDP |i|) 1) ('T 0)))
                                     (SEQ (LETT |k| |j|) (LETT #3# |j1|) G190
                                          (COND ((< |k| #3#) (GO G191)))
                                          (SEQ
                                           (LETT |t1|
                                                 (|mul_DF|
                                                  (FLOAT (- (* 2 |k|) |j1|)
                                                         MOST-POSITIVE-DOUBLE-FLOAT)
                                                  (DELT |v| (- |k| |j1|))))
                                           (DSETELT |v| |k|
                                                    (|add_DF| |t| |t1|))
                                           (EXIT (LETT |t| |t1|)))
                                          (LETT |k| (+ |k| -1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (COND ((ODDP |i|) (DSETELT |v| 0 |t|)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |r0|
                                 (COND ((ODDP |n|) (|minus_DF| 1.0))
                                       (#6# |cot_x|)))
                           (LETT |u| (|mul_DF| |cot_x| |cot_x|))
                           (LETT |res| 0.0)
                           (SEQ (LETT |i| |nn|) G190
                                (COND ((< |i| 0) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |res|
                                        (|add_DF| (|mul_DF| |u| |res|)
                                                  (DELT |v| |i|)))))
                                (LETT |i| (+ |i| -1)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (|mul_DF| |r0| |res|))))))))) 

(SDEFUN |DFSFUN2;polygamma;Nni2Df;30|
        ((|n| (|NonNegativeInteger|)) (|x| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|x_int| (|DoubleFloat|)) (|x1| (|DoubleFloat|))
          (|x_min| (|DoubleFloat|)) (|m| (|Integer|)) (|res1| (|DoubleFloat|)))
         (SEQ
          (COND
           ((SPADCALL |x| 0.0 (QREFELT % 56))
            (SEQ (LETT |x_int| (SPADCALL |x| (QREFELT % 27)))
                 (LETT |x1| (|sub_DF| |x| |x_int|))
                 (EXIT
                  (COND ((|eql_DF| |x1| 0.0) (|error| "pole of polygamma"))
                        (#1='T
                         (SEQ
                          (LETT |res1|
                                (SPADCALL |n| (|sub_DF| 1.0 |x|)
                                          (QREFELT % 57)))
                          (COND ((ODDP |n|) (LETT |res1| (|minus_DF| |res1|))))
                          (EXIT
                           (|sub_DF| |res1|
                                     (|mul_DF|
                                      (|expt_DF_I| (QREFELT % 20) (+ |n| 1))
                                      (|DFSFUN2;cot_diff|
                                       (|mul_DF| (QREFELT % 20) |x1|) |n|
                                       %))))))))))
           (#1#
            (SEQ (LETT |x_min| (|DFSFUN2;min_asymp| |n| %))
                 (LETT |m|
                       (COND ((|less_DF| |x_min| |x|) 0)
                             (#1#
                              (SPADCALL
                               (SPADCALL (|sub_DF| |x_min| |x|) (QREFELT % 58))
                               (QREFELT % 29)))))
                 (LETT |res1|
                       (|mul_DF|
                        (SPADCALL
                         (|add_DF| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT) 1.0)
                         (QREFELT % 30))
                        (|DFSFUN2;psi_W1_DF| |x| |n| |m| %)))
                 (COND ((EVENP |n|) (LETT |res1| (|minus_DF| |res1|))))
                 (EXIT |res1|))))))) 

(SDEFUN |DFSFUN2;digamma;2Df;31| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPADCALL 0 |x| (QREFELT % 57))) 

(SDEFUN |DFSFUN2;polygamma;Nni2C;32|
        ((|n| (|NonNegativeInteger|)) (|x| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|ix| (|DoubleFloat|)) (|rx| (|DoubleFloat|))
          (|rx_int| (|DoubleFloat|)) (|x1| (|Complex| (|DoubleFloat|)))
          (|cv| (|Complex| (|DoubleFloat|)))
          (|cv1| #1=(|Complex| (|DoubleFloat|))) (|cot_d| #1#)
          (|x_min| (|DoubleFloat|)) (|ax| (|DoubleFloat|))
          (|nrx| (|DoubleFloat|)) (|m| (|Integer|))
          (|res1| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |ix| (SPADCALL |x| (QREFELT % 34)))
              (EXIT
               (COND
                ((|eql_DF| |ix| 0.0)
                 (SPADCALL
                  (SPADCALL |n| (SPADCALL |x| (QREFELT % 35)) (QREFELT % 57))
                  0.0 (QREFELT % 17)))
                ((|less_DF| (LETT |rx| (SPADCALL |x| (QREFELT % 35)))
                            (|minus_DF| 1.0))
                 (COND
                  ((< 2 |n|)
                   (|error|
                    "polygamma not implemented for x with real(x) < -1"))
                  (#2='T
                   (SEQ (LETT |rx_int| (SPADCALL |rx| (QREFELT % 27)))
                        (LETT |x1|
                              (SPADCALL |x|
                                        (SPADCALL |rx_int| 0.0 (QREFELT % 17))
                                        (QREFELT % 22)))
                        (EXIT
                         (COND
                          ((SPADCALL |x1| (|spadConstant| % 36) (QREFELT % 38))
                           (|error| "pole of polygamma"))
                          (#2#
                           (SEQ
                            (LETT |res1|
                                  (SPADCALL |n|
                                            (SPADCALL (|spadConstant| % 13) |x|
                                                      (QREFELT % 22))
                                            (QREFELT % 60)))
                            (COND
                             ((ODDP |n|)
                              (LETT |res1| (SPADCALL |res1| (QREFELT % 44)))))
                            (LETT |cot_d|
                                  (SEQ
                                   (LETT |cv|
                                         (SPADCALL
                                          (SPADCALL (QREFELT % 20) |x1|
                                                    (QREFELT % 40))
                                          (QREFELT % 61)))
                                   (EXIT
                                    (COND
                                     ((EQL |n| 0)
                                      (SPADCALL (QREFELT % 20) |cv|
                                                (QREFELT % 40)))
                                     (#2#
                                      (SEQ
                                       (LETT |cv1|
                                             (SPADCALL (QREFELT % 20)
                                                       (SPADCALL
                                                        (|spadConstant| % 13)
                                                        (SPADCALL |cv| |cv|
                                                                  (QREFELT %
                                                                           15))
                                                        (QREFELT % 18))
                                                       (QREFELT % 40)))
                                       (EXIT
                                        (COND
                                         ((EQL |n| 1)
                                          (SPADCALL
                                           (SPADCALL (QREFELT % 20) |cv1|
                                                     (QREFELT % 40))
                                           (QREFELT % 44)))
                                         ((EQL |n| 2)
                                          (SPADCALL
                                           (SPADCALL
                                            (|mul_DF|
                                             (SPADCALL 2 (QREFELT % 20)
                                                       (QREFELT % 65))
                                             (QREFELT % 20))
                                            |cv| (QREFELT % 40))
                                           |cv1| (QREFELT % 15)))
                                         (#2#
                                          (|error| "unimplemented"))))))))))
                            (EXIT
                             (SPADCALL |res1| |cot_d| (QREFELT % 22)))))))))))
                (#2#
                 (SEQ (LETT |x_min| (|DFSFUN2;min_asymp| |n| %))
                      (LETT |m|
                            (SEQ (LETT |ax| (|DFSFUN2;cabs| |x| %))
                                 (EXIT
                                  (COND ((|less_DF| |x_min| |ax|) 0)
                                        (#2#
                                         (SEQ
                                          (LETT |nrx|
                                                (SPADCALL
                                                 (|sub_DF|
                                                  (|add_DF|
                                                   (|mul_DF| |x_min| |x_min|)
                                                   (|mk_DF| 5 -1))
                                                  (|mul_DF| |ix| |ix|))
                                                 (QREFELT % 50)))
                                          (EXIT
                                           (SPADCALL
                                            (SPADCALL (|sub_DF| |nrx| |rx|)
                                                      (QREFELT % 58))
                                            (QREFELT % 29)))))))))
                      (LETT |res1|
                            (SPADCALL
                             (SPADCALL
                              (|add_DF| (FLOAT |n| MOST-POSITIVE-DOUBLE-FLOAT)
                                        1.0)
                              (QREFELT % 30))
                             (|DFSFUN2;psi_W1_CDF| |x| |n| |m| %)
                             (QREFELT % 40)))
                      (COND
                       ((EVENP |n|)
                        (LETT |res1| (SPADCALL |res1| (QREFELT % 44)))))
                      (EXIT |res1|)))))))) 

(SDEFUN |DFSFUN2;digamma;2C;33|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL 0 |x| (QREFELT % 60))) 

(SDEFUN |DFSFUN2;erf;2Df;34| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 71))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;erf;2C;35|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 75))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;erfi;2Df;36| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 78))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;erfi;2C;37|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 80))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;fresnelC;2Df;38| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 82))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;fresnelC;2C;39|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 84))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;fresnelS;2Df;40| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 86))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;fresnelS;2C;41|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 88))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Ei;2Df;42| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 90))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Ei;2C;43|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 92))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;li;2Df;44| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 94))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;li;2C;45|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 96))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Ci;2Df;46| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 98))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Ci;2C;47|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 100))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Si;2Df;48| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 102))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Si;2C;49|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 104))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Chi;2Df;50| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 106))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Chi;2C;51|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 108))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Shi;2Df;52| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 110))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;Shi;2C;53|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 112))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;dilog;2Df;54| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 115))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;dilog;2C;55|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 117))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;li2;2Df;56| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 119))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;li2;2C;57|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 121))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;riemannZeta;2Df;58|
        ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 69))
                                       (QREFELT % 123))
                             (QREFELT % 72))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;riemannZeta;2C;59|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 67)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL 68 (QREFELT % 68))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |x| (QREFELT % 74))
                                       (QREFELT % 125))
                             (QREFELT % 76))))
                      (SPADCALL |obits| (QREFELT % 68))))))) 

(SDEFUN |DFSFUN2;sum_c_DF|
        ((|uv| (|DoubleFloat|)) (|u2| (|DoubleFloat|)) (|l| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|r0| #1=(|DoubleFloat|)) (|r1| #2=(|DoubleFloat|)) (|k| NIL)
          (#3=#:G245 NIL) (|k21| (|Integer|)) (|ak| #4=(|DoubleFloat|))
          (|a_k3| #1#) (|a_k2| #2#) (|a_k1| #4#) (|res| #4#))
         (SEQ (LETT |r0| (LETT |a_k3| 1.0))
              (LETT |r1|
                    (LETT |a_k2|
                          (|minus_DF|
                           (|div_DF| |uv|
                                     (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))))
              (LETT |res|
                    (LETT |a_k1|
                          (|div_DF|
                           (|mul_DF| (SPADCALL 9 |uv| (QREFELT % 65)) |uv|)
                           (FLOAT 128 MOST-POSITIVE-DOUBLE-FLOAT))))
              (SEQ (LETT |k| 3) (LETT #3# |l|) G190
                   (COND ((> |k| #3#) (GO G191)))
                   (SEQ (LETT |k21| (- (* 2 |k|) 1))
                        (LETT |ak|
                              (|div_DF|
                               (|mul_DF| |uv|
                                         (|add_DF|
                                          (|minus_DF|
                                           (|mul_DF_I| |a_k1| (* |k21| |k21|)))
                                          (|mul_DF|
                                           (|mul_DF_I| |u2|
                                                       (* |k21| (- |k21| 4)))
                                           |a_k3|)))
                               (FLOAT (* 8 |k|) MOST-POSITIVE-DOUBLE-FLOAT)))
                        (LETT |res| (|add_DF| |res| |ak|)) (LETT |a_k3| |a_k2|)
                        (LETT |a_k2| |a_k1|) (EXIT (LETT |a_k1| |ak|)))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (|add_DF| |r1| |res|)) (EXIT (|add_DF| |r0| |res|))))) 

(SDEFUN |DFSFUN2;sum_c_CDF|
        ((|uv| (|Complex| (|DoubleFloat|))) (|u2| (|Complex| (|DoubleFloat|)))
         (|l| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|r0| #1=(|Complex| (|DoubleFloat|)))
          (|r1| #2=(|Complex| (|DoubleFloat|))) (|k| NIL) (#3=#:G251 NIL)
          (|k21| (|Integer|)) (|ak| #4=(|Complex| (|DoubleFloat|)))
          (|a_k3| #1#) (|a_k2| #2#) (|a_k1| #4#) (|res| #4#))
         (SEQ (LETT |r0| (LETT |a_k3| (|spadConstant| % 13)))
              (LETT |r1|
                    (LETT |a_k2|
                          (SPADCALL
                           (SPADCALL |uv| (SPADCALL 8 (QREFELT % 140))
                                     (QREFELT % 14))
                           (QREFELT % 44))))
              (LETT |res|
                    (LETT |a_k1|
                          (SPADCALL
                           (SPADCALL (SPADCALL 9 |uv| (QREFELT % 141)) |uv|
                                     (QREFELT % 15))
                           (SPADCALL 128 (QREFELT % 140)) (QREFELT % 14))))
              (SEQ (LETT |k| 3) (LETT #3# |l|) G190
                   (COND ((> |k| #3#) (GO G191)))
                   (SEQ (LETT |k21| (- (* 2 |k|) 1))
                        (LETT |ak|
                              (SPADCALL
                               (SPADCALL |uv|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (* |k21| |k21|) |a_k1|
                                                     (QREFELT % 142))
                                           (QREFELT % 44))
                                          (SPADCALL
                                           (SPADCALL (* |k21| (- |k21| 4)) |u2|
                                                     (QREFELT % 142))
                                           |a_k3| (QREFELT % 15))
                                          (QREFELT % 18))
                                         (QREFELT % 15))
                               (SPADCALL (* 8 |k|) (QREFELT % 140))
                               (QREFELT % 14)))
                        (LETT |res| (SPADCALL |res| |ak| (QREFELT % 18)))
                        (LETT |a_k3| |a_k2|) (LETT |a_k2| |a_k1|)
                        (EXIT (LETT |a_k1| |ak|)))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |res| (SPADCALL |r1| |res| (QREFELT % 18)))
              (EXIT (SPADCALL |r0| |res| (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;bessKa_DF|
        ((|v| (|DoubleFloat|)) (|z| (|DoubleFloat|)) (|zs| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|vz| #1=(|DoubleFloat|)) (|s| (|DoubleFloat|)) (|u| #1#) (|uv| #1#)
          (|vzeta| (|DoubleFloat|)) (|sc| (|DoubleFloat|)))
         (SEQ (LETT |vz| (|div_DF| |v| |z|))
              (LETT |s|
                    (SPADCALL (|add_DF| 1.0 (SPADCALL |vz| 2 (QREFELT % 143)))
                              (QREFELT % 50)))
              (LETT |u| (|div_DF| |vz| |s|))
              (LETT |uv| (|div_DF| 1.0 (|mul_DF| |z| |s|)))
              (LETT |vzeta|
                    (|add_DF| (|mul_DF| |z| |s|)
                              (|mul_DF| |v|
                                        (SPADCALL
                                         (|div_DF| 1.0 (|add_DF| |s| |vz|))
                                         (QREFELT % 24)))))
              (LETT |sc| (|DFSFUN2;sum_c_DF| |uv| (|mul_DF| |u| |u|) 30 %))
              (EXIT
               (|mul_DF|
                (|mul_DF|
                 (|mul_DF| (|div_DF| 1.0 |zs|)
                           (SPADCALL
                            (|mul_DF| (QREFELT % 20)
                                      (|div_DF| 1.0
                                                (|mul_DF|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |s|)))
                            (QREFELT % 50)))
                 (|exp_DF| (|minus_DF| |vzeta|)))
                |sc|))))) 

(SDEFUN |DFSFUN2;bessKa_CDF|
        ((|v| (|Complex| (|DoubleFloat|))) (|z| (|Complex| (|DoubleFloat|)))
         (|zs| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|vz| #1=(|Complex| (|DoubleFloat|)))
          (|s| (|Complex| (|DoubleFloat|))) (|u| #1#) (|uv| #1#)
          (|vzeta| (|Complex| (|DoubleFloat|)))
          (|sc| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |vz| (SPADCALL |v| |z| (QREFELT % 14)))
              (LETT |s|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 13)
                               (SPADCALL |vz| 2 (QREFELT % 144))
                               (QREFELT % 18))
                     (QREFELT % 145)))
              (LETT |u| (SPADCALL |vz| |s| (QREFELT % 14)))
              (LETT |uv|
                    (SPADCALL (|spadConstant| % 13)
                              (SPADCALL |z| |s| (QREFELT % 15))
                              (QREFELT % 14)))
              (LETT |vzeta|
                    (SPADCALL (SPADCALL |z| |s| (QREFELT % 15))
                              (SPADCALL |v|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 13)
                                                   (SPADCALL |s| |vz|
                                                             (QREFELT % 18))
                                                   (QREFELT % 14))
                                         (QREFELT % 23))
                                        (QREFELT % 15))
                              (QREFELT % 18)))
              (LETT |sc|
                    (|DFSFUN2;sum_c_CDF| |uv| (SPADCALL |u| |u| (QREFELT % 15))
                     30 %))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 13) |zs| (QREFELT % 14))
                           (SPADCALL
                            (SPADCALL (QREFELT % 20)
                                      (SPADCALL (|spadConstant| % 13)
                                                (SPADCALL
                                                 (SPADCALL 2 (QREFELT % 140))
                                                 |s| (QREFELT % 15))
                                                (QREFELT % 14))
                                      (QREFELT % 40))
                            (QREFELT % 145))
                           (QREFELT % 15))
                 (SPADCALL (SPADCALL |vzeta| (QREFELT % 44)) (QREFELT % 33))
                 (QREFELT % 15))
                |sc| (QREFELT % 15)))))) 

(SDEFUN |DFSFUN2;hyp_ser_DF|
        ((|a| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (|n| (|Integer|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|i| NIL) (#1=#:G261 NIL) (|fac| (|DoubleFloat|))
          (|s| (|DoubleFloat|)))
         (SEQ (LETT |s| 0.0) (LETT |fac| 1.0)
              (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |fac|
                          (|div_DF| (|mul_DF| |fac| |x|)
                                    (|mul_DF|
                                     (FLOAT (+ |i| 1)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (|add_DF| |a|
                                               (FLOAT |i|
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))))
                    (EXIT (LETT |s| (|add_DF| |s| |fac|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (|add_DF| |s| 1.0))))) 

(SDEFUN |DFSFUN2;hyp_ser_CDF|
        ((|a| (|Complex| (|DoubleFloat|))) (|x| (|Complex| (|DoubleFloat|)))
         (|n| (|Integer|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|i| NIL) (#1=#:G267 NIL) (|fac| (|Complex| (|DoubleFloat|)))
          (|s| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |s| (|spadConstant| % 36))
              (LETT |fac| (|spadConstant| % 13))
              (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |fac|
                          (SPADCALL (SPADCALL |fac| |x| (QREFELT % 15))
                                    (SPADCALL
                                     (FLOAT (+ |i| 1)
                                            MOST-POSITIVE-DOUBLE-FLOAT)
                                     (SPADCALL |a|
                                               (SPADCALL |i| (QREFELT % 140))
                                               (QREFELT % 18))
                                     (QREFELT % 40))
                                    (QREFELT % 14)))
                    (EXIT (LETT |s| (SPADCALL |s| |fac| (QREFELT % 18)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (|spadConstant| % 13) (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;airyAia_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|x2| (|Complex| (|DoubleFloat|))) (|x3| (|Complex| (|DoubleFloat|)))
          (|x3s| (|Complex| (|DoubleFloat|)))
          (|c13| (|Complex| (|DoubleFloat|))) (|abs_x| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)))
         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 145)))
              (LETT |x3|
                    (SPADCALL (QREFELT % 129)
                              (SPADCALL |x| |x2| (QREFELT % 15))
                              (QREFELT % 40)))
              (LETT |x3s|
                    (SPADCALL |x2|
                              (SPADCALL
                               (SPADCALL (QREFELT % 129) |x2| (QREFELT % 40))
                               (QREFELT % 145))
                              (QREFELT % 15)))
              (LETT |c13| (SPADCALL (QREFELT % 128) 0.0 (QREFELT % 17)))
              (LETT |abs_x| (SPADCALL |x| (QREFELT % 146)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 35)))
              (EXIT
               (COND
                ((|less_DF| (|mul_DF| (|minus_DF| (|mk_DF| 19 -1)) |rx|)
                            |abs_x|)
                 (SPADCALL (SPADCALL (QREFELT % 134) |x2| (QREFELT % 40))
                           (|DFSFUN2;bessKa_CDF| |c13| |x3| |x3s| %)
                           (QREFELT % 15)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT % 134) |x2| (QREFELT % 40))
                            (SPADCALL
                             (|DFSFUN2;bessKa_CDF| |c13| |x3|
                              (SPADCALL |x3s| (QREFELT % 44)) %)
                             (|DFSFUN2;bessKa_CDF| |c13|
                              (SPADCALL |x3| (QREFELT % 44))
                              (SPADCALL (SPADCALL |x3| (QREFELT % 44))
                                        (QREFELT % 145))
                              %)
                             (QREFELT % 22))
                            (QREFELT % 15))
                  (QREFELT % 44)))))))) 

(SDEFUN |DFSFUN2;airyAia_DF| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|x2| (|DoubleFloat|)) (|x3s| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((|less_DF| 0.0 |x|)
                  (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 50)))
                       (LETT |x3s|
                             (|mul_DF| |x2|
                                       (SPADCALL
                                        (|mul_DF| (QREFELT % 129) |x2|)
                                        (QREFELT % 50))))
                       (EXIT
                        (|mul_DF| (QREFELT % 134)
                                  (|DFSFUN2;bessKa_DF| (QREFELT % 128)
                                   (|mul_DF| (|mul_DF| (QREFELT % 129) |x|)
                                             |x2|)
                                   |x3s| %)))))
                 ('T
                  (SPADCALL
                   (|DFSFUN2;airyAia_CDF| (SPADCALL |x| 0.0 (QREFELT % 17)) %)
                   (QREFELT % 35))))))) 

(SDEFUN |DFSFUN2;airyAipa_CDF|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|x2| (|Complex| (|DoubleFloat|))) (|x3| (|Complex| (|DoubleFloat|)))
          (|x3s| (|Complex| (|DoubleFloat|)))
          (|c23| (|Complex| (|DoubleFloat|))) (|abs_x| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)) (|bv1| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 145)))
              (LETT |x3|
                    (SPADCALL (QREFELT % 129)
                              (SPADCALL |x| |x2| (QREFELT % 15))
                              (QREFELT % 40)))
              (LETT |x3s|
                    (SPADCALL |x2|
                              (SPADCALL
                               (SPADCALL (QREFELT % 129) |x2| (QREFELT % 40))
                               (QREFELT % 145))
                              (QREFELT % 15)))
              (LETT |c23| (SPADCALL (QREFELT % 129) 0.0 (QREFELT % 17)))
              (LETT |abs_x| (SPADCALL |x| (QREFELT % 146)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 35)))
              (EXIT
               (COND
                ((|less_DF| (|mul_DF| (|minus_DF| (|mk_DF| 2 0)) |rx|) |abs_x|)
                 (SPADCALL
                  (SPADCALL (SPADCALL (QREFELT % 134) |x| (QREFELT % 40))
                            (|DFSFUN2;bessKa_CDF| |c23| |x3| |x3s| %)
                            (QREFELT % 15))
                  (QREFELT % 44)))
                ('T
                 (SEQ
                  (LETT |bv1|
                        (|DFSFUN2;bessKa_CDF| |c23| |x3|
                         (SPADCALL |x3s| (QREFELT % 44)) %))
                  (EXIT
                   (SPADCALL (SPADCALL (QREFELT % 134) |x| (QREFELT % 40))
                             (SPADCALL |bv1|
                                       (|DFSFUN2;bessKa_CDF| |c23|
                                        (SPADCALL |x3| (QREFELT % 44))
                                        (SPADCALL
                                         (SPADCALL |x3| (QREFELT % 44))
                                         (QREFELT % 145))
                                        %)
                                       (QREFELT % 18))
                             (QREFELT % 15)))))))))) 

(SDEFUN |DFSFUN2;airyAipa_DF| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|x2| (|DoubleFloat|)) (|x3s| (|DoubleFloat|)))
               (SEQ
                (COND
                 ((|less_DF| 0.0 |x|)
                  (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 50)))
                       (LETT |x3s|
                             (|mul_DF| |x2|
                                       (SPADCALL
                                        (|mul_DF| (QREFELT % 129) |x2|)
                                        (QREFELT % 50))))
                       (EXIT
                        (|minus_DF|
                         (|mul_DF| (|mul_DF| (QREFELT % 134) |x|)
                                   (|DFSFUN2;bessKa_DF| (QREFELT % 129)
                                    (|mul_DF| (|mul_DF| (QREFELT % 129) |x|)
                                              |x2|)
                                    |x3s| %))))))
                 ('T
                  (SPADCALL
                   (|DFSFUN2;airyAipa_CDF| (SPADCALL |x| 0.0 (QREFELT % 17)) %)
                   (QREFELT % 35))))))) 

(SDEFUN |DFSFUN2;airyAi;2Df;70| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|abs_x| (|DoubleFloat|)) (|xx| (|DoubleFloat|))
          (|x2| (|DoubleFloat|)))
         (SEQ (LETT |abs_x| (|abs_DF| |x|))
              (EXIT
               (COND
                ((|less_DF| |abs_x| 1.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 132)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 129) |xx| 14 %))
                    (|mul_DF| (|mul_DF| (QREFELT % 133) |x|)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 130) |xx| 14
                               %))))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAia_DF| |x| %))
                ((|less_DF| |x| 0.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 132)
                              (SPADCALL (QREFELT % 129) |xx| (QREFELT % 147)))
                    (|mul_DF| (|mul_DF| (QREFELT % 133) |x|)
                              (SPADCALL (QREFELT % 130) |xx|
                                        (QREFELT % 147)))))))
                ('T
                 (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 50)))
                      (EXIT
                       (|mul_DF| (|mul_DF| (QREFELT % 134) |x2|)
                                 (SPADCALL (QREFELT % 128)
                                           (|mul_DF|
                                            (|mul_DF| (QREFELT % 129) |x|)
                                            |x2|)
                                           (QREFELT % 148))))))))))) 

(SDEFUN |DFSFUN2;airyAi;2C;71|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|abs_x| (|DoubleFloat|)) (|rx| (|DoubleFloat|))
          (|x2| (|Complex| (|DoubleFloat|))) (|x3| (|Complex| (|DoubleFloat|)))
          (|xx| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |abs_x| (SPADCALL |x| (QREFELT % 146)))
              (EXIT
               (COND
                ((|less_DF| |abs_x| 1.0)
                 (SEQ
                  (LETT |xx|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 127) |x| (QREFELT % 40)) |x|
                          (QREFELT % 15))
                         |x| (QREFELT % 15)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (QREFELT % 132)
                              (|DFSFUN2;hyp_ser_CDF|
                               (SPADCALL (QREFELT % 129) 0.0 (QREFELT % 17))
                               |xx| 24 %)
                              (QREFELT % 40))
                    (SPADCALL (SPADCALL (QREFELT % 133) |x| (QREFELT % 40))
                              (|DFSFUN2;hyp_ser_CDF|
                               (SPADCALL (QREFELT % 130) 0.0 (QREFELT % 17))
                               |xx| 24 %)
                              (QREFELT % 15))
                    (QREFELT % 18)))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAia_CDF| |x| %))
                (#1='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 35)))
                      (EXIT
                       (COND
                        ((|less_DF|
                          (|mul_DF| (|minus_DF| (|mk_DF| 20000000001 -10))
                                    |rx|)
                          |abs_x|)
                         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 145)))
                              (LETT |x3|
                                    (SPADCALL (QREFELT % 129)
                                              (SPADCALL |x| |x2|
                                                        (QREFELT % 15))
                                              (QREFELT % 40)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (QREFELT % 134) |x2| (QREFELT % 40))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 128) 0.0 (QREFELT % 17))
                                 |x3| (QREFELT % 151))
                                (QREFELT % 15)))))
                        (#1#
                         (SEQ
                          (LETT |xx|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 127) 0.0
                                             (QREFELT % 17))
                                   |x| (QREFELT % 15))
                                  |x| (QREFELT % 15))
                                 |x| (QREFELT % 15)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (QREFELT % 132)
                                      (SPADCALL
                                       (SPADCALL (QREFELT % 129) 0.0
                                                 (QREFELT % 17))
                                       |xx| (QREFELT % 152))
                                      (QREFELT % 40))
                            (SPADCALL
                             (SPADCALL (QREFELT % 133) |x| (QREFELT % 40))
                             (SPADCALL
                              (SPADCALL (QREFELT % 130) 0.0 (QREFELT % 17))
                              |xx| (QREFELT % 152))
                             (QREFELT % 15))
                            (QREFELT % 18)))))))))))))) 

(SDEFUN |DFSFUN2;airyAiPrime;2Df;72|
        ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|abs_x| (|DoubleFloat|)) (|xx| (|DoubleFloat|))
          (|x2| (|DoubleFloat|)))
         (SEQ (LETT |abs_x| (|abs_DF| |x|))
              (EXIT
               (COND
                ((|less_DF| |abs_x| (|mk_DF| 1 0))
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 133)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 128) |xx| 24 %))
                    (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 135) |x|) |x|)
                              (|DFSFUN2;hyp_ser_DF| (QREFELT % 131) |xx| 24
                               %))))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAipa_DF| |x| %))
                ((|less_DF| |x| 0.0)
                 (SEQ
                  (LETT |xx|
                        (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                  |x|))
                  (EXIT
                   (|add_DF|
                    (|mul_DF| (QREFELT % 133)
                              (SPADCALL (QREFELT % 128) |xx| (QREFELT % 147)))
                    (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 135) |x|) |x|)
                              (SPADCALL (QREFELT % 131) |xx|
                                        (QREFELT % 147)))))))
                ('T
                 (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 50)))
                      (EXIT
                       (|minus_DF|
                        (|mul_DF| (|mul_DF| (QREFELT % 134) |x|)
                                  (SPADCALL (QREFELT % 129)
                                            (|mul_DF|
                                             (|mul_DF| (QREFELT % 129) |x|)
                                             |x2|)
                                            (QREFELT % 148)))))))))))) 

(SDEFUN |DFSFUN2;airyAiPrime;2C;73|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|abs_x| (|DoubleFloat|)) (|rx| (|DoubleFloat|))
          (|x2| (|Complex| (|DoubleFloat|)))
          (|xx| (|Complex| (|DoubleFloat|))))
         (SEQ (LETT |abs_x| (SPADCALL |x| (QREFELT % 146)))
              (EXIT
               (COND
                ((|less_DF| |abs_x| 1.0)
                 (SEQ
                  (LETT |xx|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (QREFELT % 127) |x| (QREFELT % 40)) |x|
                          (QREFELT % 15))
                         |x| (QREFELT % 15)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (QREFELT % 133)
                              (|DFSFUN2;hyp_ser_CDF|
                               (SPADCALL (QREFELT % 128) 0.0 (QREFELT % 17))
                               |xx| 14 %)
                              (QREFELT % 40))
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 135) |x| (QREFELT % 40))
                               |x| (QREFELT % 15))
                     (|DFSFUN2;hyp_ser_CDF|
                      (SPADCALL (QREFELT % 131) 0.0 (QREFELT % 17)) |xx| 14 %)
                     (QREFELT % 15))
                    (QREFELT % 18)))))
                ((|less_DF| (|mk_DF| 12 0) |abs_x|)
                 (|DFSFUN2;airyAipa_CDF| |x| %))
                (#1='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 35)))
                      (EXIT
                       (COND
                        ((|less_DF|
                          (|mul_DF| (|minus_DF| (|mk_DF| 20000000001 -10))
                                    |rx|)
                          |abs_x|)
                         (SEQ (LETT |x2| (SPADCALL |x| (QREFELT % 145)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 134) |x| (QREFELT % 40))
                                 (SPADCALL
                                  (SPADCALL (QREFELT % 129) 0.0 (QREFELT % 17))
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 129) |x|
                                             (QREFELT % 40))
                                   |x2| (QREFELT % 15))
                                  (QREFELT % 151))
                                 (QREFELT % 15))
                                (QREFELT % 44)))))
                        (#1#
                         (SEQ
                          (LETT |xx|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QREFELT % 127) |x| (QREFELT % 40))
                                  |x| (QREFELT % 15))
                                 |x| (QREFELT % 15)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (QREFELT % 133)
                                      (SPADCALL
                                       (SPADCALL (QREFELT % 128) 0.0
                                                 (QREFELT % 17))
                                       |xx| (QREFELT % 152))
                                      (QREFELT % 40))
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (QREFELT % 135) |x| (QREFELT % 40)) |x|
                              (QREFELT % 15))
                             (SPADCALL
                              (SPADCALL (QREFELT % 131) 0.0 (QREFELT % 17))
                              |xx| (QREFELT % 152))
                             (QREFELT % 15))
                            (QREFELT % 18)))))))))))))) 

(SDEFUN |DFSFUN2;airyBi;2Df;74| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|xx| (|DoubleFloat|)))
               (SEQ
                (LETT |xx|
                      (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                |x|))
                (EXIT
                 (|add_DF|
                  (|mul_DF| (QREFELT % 136)
                            (SPADCALL (QREFELT % 129) |xx| (QREFELT % 147)))
                  (|mul_DF| (|mul_DF| (QREFELT % 137) |x|)
                            (SPADCALL (QREFELT % 130) |xx|
                                      (QREFELT % 147)))))))) 

(SDEFUN |DFSFUN2;airyBi;2C;75|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|xx| (|Complex| (|DoubleFloat|))))
               (SEQ
                (LETT |xx|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 127) |x| (QREFELT % 40))
                                 |x| (QREFELT % 15))
                       |x| (QREFELT % 15)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT % 136)
                            (SPADCALL
                             (SPADCALL (QREFELT % 129) 0.0 (QREFELT % 17)) |xx|
                             (QREFELT % 152))
                            (QREFELT % 40))
                  (SPADCALL (SPADCALL (QREFELT % 137) |x| (QREFELT % 40))
                            (SPADCALL
                             (SPADCALL (QREFELT % 130) 0.0 (QREFELT % 17)) |xx|
                             (QREFELT % 152))
                            (QREFELT % 15))
                  (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;airyBiPrime;2Df;76|
        ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|xx| (|DoubleFloat|)))
               (SEQ
                (LETT |xx|
                      (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 127) |x|) |x|)
                                |x|))
                (EXIT
                 (|add_DF|
                  (|mul_DF| (QREFELT % 137)
                            (SPADCALL (QREFELT % 128) |xx| (QREFELT % 147)))
                  (|mul_DF| (|mul_DF| (|mul_DF| (QREFELT % 138) |x|) |x|)
                            (SPADCALL (QREFELT % 131) |xx|
                                      (QREFELT % 147)))))))) 

(SDEFUN |DFSFUN2;airyBiPrime;2C;77|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG ((|xx| (|Complex| (|DoubleFloat|))))
               (SEQ
                (LETT |xx|
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 127) |x| (QREFELT % 40))
                                 |x| (QREFELT % 15))
                       |x| (QREFELT % 15)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (QREFELT % 137)
                            (SPADCALL
                             (SPADCALL (QREFELT % 128) 0.0 (QREFELT % 17)) |xx|
                             (QREFELT % 152))
                            (QREFELT % 40))
                  (SPADCALL
                   (SPADCALL (SPADCALL (QREFELT % 138) |x| (QREFELT % 40)) |x|
                             (QREFELT % 15))
                   (SPADCALL (SPADCALL (QREFELT % 131) 0.0 (QREFELT % 17)) |xx|
                             (QREFELT % 152))
                   (QREFELT % 15))
                  (QREFELT % 18)))))) 

(SDEFUN |DFSFUN2;hypergeometric0F1;3Df;78|
        ((|a| (|DoubleFloat|)) (|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SEQ
         (COND
          ((|less_DF| 0.0 |a|)
           (COND
            ((|less_DF| (|abs_DF| |x|) 1.0)
             (EXIT (|DFSFUN2;hyp_ser_DF| |a| |x| 14 %))))))
         (EXIT
          (SPADCALL
           (SPADCALL (SPADCALL |a| (QREFELT % 51))
                     (SPADCALL |x| (QREFELT % 51)) (QREFELT % 152))
           (QREFELT % 35))))) 

(SDEFUN |DFSFUN2;hypergeometric0F1;3C;79|
        ((|a| (|Complex| (|DoubleFloat|))) (|x| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SEQ
         (COND
          ((|less_DF| 0.0 (SPADCALL |a| (QREFELT % 35)))
           (COND
            ((|less_DF| (SPADCALL |x| (QREFELT % 146)) 1.0)
             (EXIT (|DFSFUN2;hyp_ser_CDF| |a| |x| 14 %))))))
         (EXIT (|c_hyper0f1| |a| |x|)))) 

(DECLAIM (NOTINLINE |DoubleFloatSpecialFunctions2;|)) 

(DEFUN |DoubleFloatSpecialFunctions2;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatSpecialFunctions2|))
          (LETT % (GETREFV 160))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatSpecialFunctions2| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    (SPADCALL
                     (LIST (|mk_DF| 83333333333333333333333 -24)
                           (|minus_DF| (|mk_DF| 27777777777777777777777 -25))
                           (|mk_DF| 7936507936507936507936507 -28)
                           (|minus_DF| (|mk_DF| 595238095238095238095238 -27))
                           (|mk_DF| 8417508417508417508417508 -28)
                           (|minus_DF| (|mk_DF| 1917526917526917526917526 -27))
                           (|mk_DF| 6410256410256410256410256 -27)
                           (|minus_DF| (|mk_DF| 2955065359477124183006535 -26))
                           (|mk_DF| 17964437236883057316493849 -26)
                           (|minus_DF| (|mk_DF| 139243221690590111642743 -23))
                           (|mk_DF| 13402864044168391994478951 -24))
                     (QREFELT % 8)))
          (QSETREFV % 19 (|mk_DF| 91893853320467274178032 -23))
          (QSETREFV % 20 (|mk_DF| 3141592653589793238462643 -24))
          (QSETREFV % 21 (|mk_DF| 1144729885849400174143427 -24))
          (QSETREFV % 25
                    (SPADCALL
                     (LIST (|minus_DF| (|mk_DF| 513516668382050295584635 -24))
                           (|mk_DF| 164698105781132405800989 -24)
                           (|mk_DF| 525510685739767347142894 -25)
                           (|minus_DF| (|mk_DF| 41615681051208622776535 -24))
                           (|mk_DF| 63368333050826317583644 -25)
                           (|mk_DF| 2157953269307912866601 -24)
                           (|minus_DF| (|mk_DF| 11042580869659820728076 -25))
                           (|mk_DF| 148887306939898122356486 -27)
                           (|mk_DF| 2588867051563457724778606 -29)
                           (|minus_DF| (|mk_DF| 138812553103149992363164 -28))
                           (|mk_DF| 2133862367281647878133 -27)
                           (|mk_DF| 6220163039502714260036 -29)
                           (|minus_DF| (|mk_DF| 8936369293009830129057 -29))
                           (|mk_DF| 1703595941800167023239 -29)
                           (|minus_DF| (|mk_DF| 91272698794856299939 -29))
                           (|minus_DF| (|mk_DF| 27003999165481406771 -29))
                           (|mk_DF| 745666263025086298299 -31)
                           (|minus_DF| (|mk_DF| 79703252793912482429 -31))
                           (|minus_DF| (|mk_DF| 90784122618522708038 -33))
                           (|mk_DF| 16992712809388051214 -32))
                     (QREFELT % 8)))
          (QSETREFV % 48
                    (SPADCALL
                     (LIST 0.0 (|mk_DF| 16666666666666666667 -20)
                           (|minus_DF| (|mk_DF| 33333333333333333333 -21))
                           (|mk_DF| 23809523809523809524 -21)
                           (|minus_DF| (|mk_DF| 33333333333333333333 -21))
                           (|mk_DF| 75757575757575757576 -21)
                           (|minus_DF| (|mk_DF| 25311355311355311355 -20))
                           (|mk_DF| 11666666666666666667 -19)
                           (|minus_DF| (|mk_DF| 70921568627450980392 -19))
                           (|mk_DF| 54971177944862155389 -18)
                           (|minus_DF| (|mk_DF| 52912424242424242424 -17))
                           (|mk_DF| 61921231884057971014 -16)
                           (|minus_DF| (|mk_DF| 86580253113553113553 -15))
                           (|mk_DF| 14255171666666666667 -13)
                           (|minus_DF| (|mk_DF| 27298231067816091954 -12))
                           (|mk_DF| 60158087390064236839 -11)
                           (|minus_DF| (|mk_DF| 15116315767092156863 -9))
                           (|mk_DF| 42961464306116666667 -8)
                           (|minus_DF| (|mk_DF| 13711655205088332772 -6))
                           (|mk_DF| 48833231897359316667 -5)
                           (|minus_DF| (|mk_DF| 19296579341940068149 -3))
                           (|mk_DF| 841693047573682615 0))
                     (QREFELT % 8)))
          (QSETREFV % 53 (FLOAT 15 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV % 127 (|div_DF| 1.0 (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 128 (|div_DF| 1.0 (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 129
                    (|div_DF| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 130
                    (|div_DF| (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 131
                    (|div_DF| (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 132 (|mk_DF| 35502805388781723926 -20))
          (QSETREFV % 133 (|minus_DF| (|mk_DF| 25881940379280679840 -20)))
          (QSETREFV % 134 (|mk_DF| 18377629847393068317 -20))
          (QSETREFV % 135 (|mk_DF| 17751402694390861963 -20))
          (QSETREFV % 136 (|mk_DF| 61492662744600073515 -20))
          (QSETREFV % 137 (|mk_DF| 4482883573538263579148 -22))
          (QSETREFV % 138 (|mk_DF| 3074633137230003675754 -22))
          (QSETREFV % 139 (|mk_DF| 5773502691896257645091 -22))
          %))) 

(DEFUN |DoubleFloatSpecialFunctions2| ()
  (SPROG NIL
         (PROG (#1=#:G320)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatSpecialFunctions2|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|DoubleFloatSpecialFunctions2|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatSpecialFunctions2;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatSpecialFunctions2|)))))))))) 

(MAKEPROP '|DoubleFloatSpecialFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 16) (|DoubleFloatVector|)
              (0 . |construct|) '|bernoulli_coeffs| (|Complex| 42) (5 . |1|)
              (|Complex| 16) (9 . |1|) (13 . /) (19 . *) (|DoubleFloat|)
              (25 . |complex|) (31 . +) '|c1| '|c_pi| '|c_lpi| (37 . -)
              (43 . |log|) (48 . |log|) '|gamma_coefs| (53 . |0|)
              (57 . |round|) (|Integer|) (62 . |retract|) |DFSFUN2;Gamma;2Df;9|
              |DFSFUN2;Beta;3Df;10| |DFSFUN2;logGamma;2Df;11| (67 . |exp|)
              (72 . |imag|) (77 . |real|) (82 . |0|) (|Boolean|) (86 . =)
              |DFSFUN2;Gamma;2C;14| (92 . *) (98 . |sin|) (|Float|) (103 . |0|)
              (107 . -) |DFSFUN2;logGamma;2C;17| (112 . |conjugate|)
              |DFSFUN2;Beta;3C;18| '|ber_coeff| (117 . |norm|) (122 . |sqrt|)
              (127 . |coerce|) (132 . ^) '|df_dig| (|NonNegativeInteger|)
              (138 . *) (144 . <=) |DFSFUN2;polygamma;Nni2Df;30|
              (150 . |ceiling|) |DFSFUN2;digamma;2Df;31|
              |DFSFUN2;polygamma;Nni2C;32| (155 . |cot|) (|Fraction| 28)
              (160 . |1|) (|PositiveInteger|) (164 . *) |DFSFUN2;digamma;2C;33|
              (170 . |bits|) (174 . |bits|) (179 . |convert|)
              (|FloatLiouvilianFunctions|) (184 . |erf|) (189 . |convert|)
              |DFSFUN2;erf;2Df;34| (194 . |convert|) (199 . |erf|)
              (204 . |convert|) |DFSFUN2;erf;2C;35| (209 . |erfi|)
              |DFSFUN2;erfi;2Df;36| (214 . |erfi|) |DFSFUN2;erfi;2C;37|
              (219 . |fresnelC|) |DFSFUN2;fresnelC;2Df;38| (224 . |fresnelC|)
              |DFSFUN2;fresnelC;2C;39| (229 . |fresnelS|)
              |DFSFUN2;fresnelS;2Df;40| (234 . |fresnelS|)
              |DFSFUN2;fresnelS;2C;41| (239 . |Ei|) |DFSFUN2;Ei;2Df;42|
              (244 . |Ei|) |DFSFUN2;Ei;2C;43| (249 . |li|) |DFSFUN2;li;2Df;44|
              (254 . |li|) |DFSFUN2;li;2C;45| (259 . |Ci|) |DFSFUN2;Ci;2Df;46|
              (264 . |Ci|) |DFSFUN2;Ci;2C;47| (269 . |Si|) |DFSFUN2;Si;2Df;48|
              (274 . |Si|) |DFSFUN2;Si;2C;49| (279 . |Chi|)
              |DFSFUN2;Chi;2Df;50| (284 . |Chi|) |DFSFUN2;Chi;2C;51|
              (289 . |Shi|) |DFSFUN2;Shi;2Df;52| (294 . |Shi|)
              |DFSFUN2;Shi;2C;53| (|FloatSpecialFunctions|) (299 . |dilog|)
              |DFSFUN2;dilog;2Df;54| (304 . |dilog|) |DFSFUN2;dilog;2C;55|
              (309 . |li2|) |DFSFUN2;li2;2Df;56| (314 . |li2|)
              |DFSFUN2;li2;2C;57| (319 . |riemannZeta|)
              |DFSFUN2;riemannZeta;2Df;58| (324 . |riemannZeta|)
              |DFSFUN2;riemannZeta;2C;59| '|one_over_nine| '|one_over_three|
              '|two_over_three| '|four_over_three| '|five_over_three| '|ai_c1|
              '|ai_c2| '|ai_c3| '|aip_c2| '|bi_c1| '|bi_c2| '|bip_c2| '|s3_inv|
              (329 . |coerce|) (334 . *) (340 . *) (346 . ^) (352 . ^)
              (358 . |sqrt|) (363 . |abs|) |DFSFUN2;hypergeometric0F1;3Df;78|
              (368 . |besselK|) |DFSFUN2;airyAi;2Df;70|
              (|DoubleFloatSpecialFunctions|) (374 . |besselK|)
              |DFSFUN2;hypergeometric0F1;3C;79| |DFSFUN2;airyAi;2C;71|
              |DFSFUN2;airyAiPrime;2Df;72| |DFSFUN2;airyAiPrime;2C;73|
              |DFSFUN2;airyBi;2Df;74| |DFSFUN2;airyBi;2C;75|
              |DFSFUN2;airyBiPrime;2Df;76| |DFSFUN2;airyBiPrime;2C;77|)
           '#(|riemannZeta| 380 |polygamma| 390 |logGamma| 402 |li2| 412 |li|
              422 |hypergeometric0F1| 432 |fresnelS| 444 |fresnelC| 454 |erfi|
              464 |erf| 474 |dilog| 484 |digamma| 494 |airyBiPrime| 504
              |airyBi| 514 |airyAiPrime| 524 |airyAi| 534 |Si| 544 |Shi| 554
              |Gamma| 564 |Ei| 574 |Ci| 584 |Chi| 594 |Beta| 604)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|Beta|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|Beta|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Gamma| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Gamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|digamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|digamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|logGamma| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|logGamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|polygamma|
                                 ((|DoubleFloat|) (|NonNegativeInteger|)
                                  (|DoubleFloat|)))
                                T)
                              '((|polygamma|
                                 ((|Complex| (|DoubleFloat|))
                                  (|NonNegativeInteger|)
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|erf| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|erf|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|erfi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|erfi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|fresnelC| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|fresnelC|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|fresnelS| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|fresnelS|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Ei| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Ei|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|li| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|li|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Ci| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Ci|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Si| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Si|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Chi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Chi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|Shi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|Shi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|dilog| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|dilog|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|li2| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|li2|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|riemannZeta|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|riemannZeta|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyAi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyAi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyAiPrime|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|airyAiPrime|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyBi| ((|DoubleFloat|) (|DoubleFloat|))) T)
                              '((|airyBi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|airyBiPrime|
                                 ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|airyBiPrime|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|hypergeometric0F1|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|hypergeometric0F1|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 159
                                            '(1 7 0 6 8 0 10 0 11 0 12 0 13 2
                                              12 0 0 0 14 2 12 0 0 0 15 2 12 0
                                              16 16 17 2 12 0 0 0 18 2 12 0 0 0
                                              22 1 12 0 0 23 1 16 0 0 24 0 10 0
                                              26 1 16 0 0 27 1 16 28 0 29 1 12
                                              0 0 33 1 12 16 0 34 1 12 16 0 35
                                              0 12 0 36 2 12 37 0 0 38 2 12 0
                                              16 0 40 1 12 0 0 41 0 42 0 43 1
                                              12 0 0 44 1 12 0 0 46 1 12 16 0
                                              49 1 16 0 0 50 1 12 0 16 51 2 12
                                              0 0 28 52 2 16 0 54 0 55 2 16 37
                                              0 0 56 1 16 0 0 58 1 12 0 0 61 0
                                              62 0 63 2 16 0 64 0 65 0 42 64 67
                                              1 42 64 64 68 1 16 42 0 69 1 70
                                              42 42 71 1 42 16 0 72 1 12 10 0
                                              74 1 70 10 10 75 1 10 12 0 76 1
                                              70 42 42 78 1 70 10 10 80 1 70 42
                                              42 82 1 70 10 10 84 1 70 42 42 86
                                              1 70 10 10 88 1 70 42 42 90 1 70
                                              10 10 92 1 70 42 42 94 1 70 10 10
                                              96 1 70 42 42 98 1 70 10 10 100 1
                                              70 42 42 102 1 70 10 10 104 1 70
                                              42 42 106 1 70 10 10 108 1 70 42
                                              42 110 1 70 10 10 112 1 114 42 42
                                              115 1 114 10 10 117 1 114 42 42
                                              119 1 114 10 10 121 1 114 42 42
                                              123 1 114 10 10 125 1 12 0 28 140
                                              2 12 0 64 0 141 2 12 0 28 0 142 2
                                              16 0 0 64 143 2 12 0 0 64 144 1
                                              12 0 0 145 1 12 16 0 146 2 16 0 0
                                              0 148 2 150 12 12 12 151 1 0 12
                                              12 126 1 0 16 16 124 2 0 12 54 12
                                              60 2 0 16 54 16 57 1 0 16 16 32 1
                                              0 12 12 45 1 0 16 16 120 1 0 12
                                              12 122 1 0 12 12 97 1 0 16 16 95
                                              2 0 16 16 16 147 2 0 12 12 12 152
                                              1 0 12 12 89 1 0 16 16 87 1 0 12
                                              12 85 1 0 16 16 83 1 0 16 16 79 1
                                              0 12 12 81 1 0 12 12 77 1 0 16 16
                                              73 1 0 12 12 118 1 0 16 16 116 1
                                              0 12 12 66 1 0 16 16 59 1 0 12 12
                                              159 1 0 16 16 158 1 0 12 12 157 1
                                              0 16 16 156 1 0 16 16 154 1 0 12
                                              12 155 1 0 12 12 153 1 0 16 16
                                              149 1 0 12 12 105 1 0 16 16 103 1
                                              0 12 12 113 1 0 16 16 111 1 0 12
                                              12 39 1 0 16 16 30 1 0 16 16 91 1
                                              0 12 12 93 1 0 12 12 101 1 0 16
                                              16 99 1 0 16 16 107 1 0 12 12 109
                                              2 0 16 16 16 31 2 0 12 12 12
                                              47)))))
           '|lookupComplete|)) 
