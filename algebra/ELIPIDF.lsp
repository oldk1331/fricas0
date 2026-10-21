
(SDEFUN |ELIPIDF;rabs| ((|x| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL |x| (QREFELT % 35))) 

(SDEFUN |ELIPIDF;ellipticRC;3Df;2|
        ((|x| (|DoubleFloat|)) (|y| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|mu_inv| (|DoubleFloat|)) (|sn| #1=(|DoubleFloat|)) (|sn2| #1#)
          (S1 #2=(|DoubleFloat|)) (S0 #2#) (#3=#:G12 NIL) (|lambda| #2#)
          (|mu| #1#) (Q #1#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mu|
                  (|mul_DF| (QREFELT % 7) (|add_DF| (|add_DF| |x| |y|) |y|)))
            (LETT Q (|mul_DF| (QREFELT % 16) (|abs_DF| (|sub_DF| |mu| |x|))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (|abs_DF| |mu|))
                      (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|))
                           (LETT |sn| (|mul_DF| |mu_inv| (|sub_DF| |y| |mu|)))
                           (LETT |sn2| (|mul_DF| |sn| |sn|))
                           (LETT S1
                                 (|add_DF| (QREFELT % 11)
                                           (|mul_DF| |sn2|
                                                     (|add_DF| (QREFELT % 13)
                                                               (|mul_DF| |sn2|
                                                                         (QREFELT
                                                                          %
                                                                          15))))))
                           (LETT S0
                                 (|add_DF| (QREFELT % 10)
                                           (|mul_DF| |sn2|
                                                     (|add_DF| (QREFELT % 12)
                                                               (|mul_DF| |sn2|
                                                                         (QREFELT
                                                                          %
                                                                          14))))))
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (|mul_DF| (|qsqrt_DF| |mu_inv|)
                                             (|add_DF| 1.0
                                                       (|mul_DF| |sn2|
                                                                 (|add_DF| S0
                                                                           (|mul_DF|
                                                                            |sn|
                                                                            S1))))))
                             (GO #4=#:G11)))))
                     ('T
                      (SEQ
                       (LETT |lambda|
                             (|add_DF|
                              (|mul_DF|
                               (|mul_DF| (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                         (|qsqrt_DF| |x|))
                               (|qsqrt_DF| |y|))
                              |y|))
                       (LETT |x|
                             (|mul_DF| (QREFELT % 8) (|add_DF| |x| |lambda|)))
                       (LETT |y|
                             (|mul_DF| (QREFELT % 8) (|add_DF| |y| |lambda|)))
                       (LETT |mu|
                             (|mul_DF| (QREFELT % 8) (|add_DF| |mu| |lambda|)))
                       (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #3#)))) 

(SDEFUN |ELIPIDF;ellipticRF;4Df;3|
        ((|x| (|DoubleFloat|)) (|y| (|DoubleFloat|)) (|z| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|mu_inv| (|DoubleFloat|)) (|xndev| #2=(|DoubleFloat|)) (|yndev| #2#)
          (|zndev| #2#) (|e2| (|DoubleFloat|)) (|e3| #2#)
          (|s| #3=(|DoubleFloat|)) (#4=#:G20 NIL) (|xnroot| #5=(|DoubleFloat|))
          (|ynroot| #5#) (|znroot| #5#) (|lambda| #3#) (|mu| #2#) (Q #2#))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mu|
                  (|mul_DF| (QREFELT % 7) (|add_DF| (|add_DF| |x| |y|) |z|)))
            (LETT |xadev| (|abs_DF| (|sub_DF| |mu| |x|)))
            (LETT |yadev| (|abs_DF| (|sub_DF| |mu| |y|)))
            (LETT |zadev| (|abs_DF| (|sub_DF| |mu| |z|)))
            (LETT Q
                  (|mul_DF| (QREFELT % 21)
                            (|max_DF| |xadev| (|max_DF| |yadev| |zadev|))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (|abs_DF| |mu|))
                      (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|))
                           (LETT |xndev|
                                 (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|))
                           (LETT |yndev|
                                 (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|))
                           (LETT |zndev|
                                 (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|))
                           (LETT |e2|
                                 (|sub_DF| (|mul_DF| |xndev| |yndev|)
                                           (|mul_DF| |zndev| |zndev|)))
                           (LETT |e3|
                                 (|mul_DF| (|mul_DF| |xndev| |yndev|) |zndev|))
                           (LETT |s|
                                 (|add_DF|
                                  (|add_DF| 1.0
                                            (|mul_DF|
                                             (|sub_DF|
                                              (|sub_DF|
                                               (|mul_DF| (QREFELT % 17) |e2|)
                                               (QREFELT % 18))
                                              (|mul_DF| (QREFELT % 11) |e3|))
                                             |e2|))
                                  (|mul_DF| (QREFELT % 20) |e3|)))
                           (EXIT
                            (PROGN
                             (LETT #4# (|mul_DF| |s| (|qsqrt_DF| |mu_inv|)))
                             (GO #6=#:G19)))))
                     ('T
                      (SEQ (LETT |xnroot| (|qsqrt_DF| |x|))
                           (LETT |ynroot| (|qsqrt_DF| |y|))
                           (LETT |znroot| (|qsqrt_DF| |z|))
                           (LETT |lambda|
                                 (|add_DF|
                                  (|mul_DF| |xnroot|
                                            (|add_DF| |ynroot| |znroot|))
                                  (|mul_DF| |ynroot| |znroot|)))
                           (LETT |x|
                                 (|mul_DF| (QREFELT % 8)
                                           (|add_DF| |x| |lambda|)))
                           (LETT |y|
                                 (|mul_DF| (QREFELT % 8)
                                           (|add_DF| |y| |lambda|)))
                           (LETT |z|
                                 (|mul_DF| (QREFELT % 8)
                                           (|add_DF| |z| |lambda|)))
                           (LETT |mu|
                                 (|mul_DF| (QREFELT % 8)
                                           (|add_DF| |mu| |lambda|)))
                           (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |ELIPIDF;ellipticRD;4Df;4|
        ((|x| (|DoubleFloat|)) (|y| (|DoubleFloat|)) (|z| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|mu_inv| (|DoubleFloat|)) (|xndev| #2=(|DoubleFloat|)) (|yndev| #2#)
          (|zndev| #2#) (|ea| #2#) (|eb| #2#) (|ec| #3=(|DoubleFloat|))
          (|ed| #3#) (|ef| #4=(|DoubleFloat|)) (|s1| #2#) (|s2| #2#) (|ss| #2#)
          (#5=#:G28 NIL) (|xnroot| #6=(|DoubleFloat|)) (|ynroot| #6#)
          (|znroot| #6#) (|lambda| #4#) (|sigma| (|DoubleFloat|))
          (|power4| (|DoubleFloat|)) (|mu| #2#) (Q #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |sigma| 0.0) (LETT |power4| 1.0)
                (LETT |mu|
                      (|mul_DF| (QREFELT % 9)
                                (|add_DF| (|add_DF| |x| |y|)
                                          (|mul_DF|
                                           (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                           |z|))))
                (LETT |xadev| (|abs_DF| (|sub_DF| |mu| |x|)))
                (LETT |yadev| (|abs_DF| (|sub_DF| |mu| |y|)))
                (LETT |zadev| (|abs_DF| (|sub_DF| |mu| |z|)))
                (LETT Q
                      (|mul_DF| (QREFELT % 27)
                                (|max_DF| |xadev| (|max_DF| |yadev| |zadev|))))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((|less_DF| Q (|abs_DF| |mu|))
                          (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|))
                               (LETT |xndev|
                                     (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|))
                               (LETT |yndev|
                                     (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|))
                               (LETT |zndev|
                                     (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|))
                               (LETT |ea| (|mul_DF| |xndev| |yndev|))
                               (LETT |eb| (|mul_DF| |zndev| |zndev|))
                               (LETT |ec| (|sub_DF| |ea| |eb|))
                               (LETT |ed|
                                     (|sub_DF| |ea|
                                               (|mul_DF|
                                                (FLOAT 6
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                |eb|)))
                               (LETT |ef| (|add_DF| (|add_DF| |ed| |ec|) |ec|))
                               (LETT |s1|
                                     (|mul_DF| |ed|
                                               (|sub_DF|
                                                (|add_DF| (QREFELT % 22)
                                                          (|mul_DF|
                                                           (|mul_DF|
                                                            (QREFELT % 8)
                                                            (QREFELT % 24))
                                                           |ed|))
                                                (|mul_DF|
                                                 (|mul_DF|
                                                  (|mul_DF| (QREFELT % 26)
                                                            (QREFELT % 25))
                                                  |zndev|)
                                                 |ef|))))
                               (LETT |s2|
                                     (|mul_DF| |zndev|
                                               (|add_DF|
                                                (|mul_DF| (QREFELT % 23) |ef|)
                                                (|mul_DF| |zndev|
                                                          (|add_DF|
                                                           (|minus_DF|
                                                            (|mul_DF|
                                                             (QREFELT % 24)
                                                             |ec|))
                                                           (|mul_DF|
                                                            (|mul_DF| |zndev|
                                                                      (QREFELT
                                                                       % 25))
                                                            |ea|))))))
                               (LETT |ss|
                                     (|mul_DF|
                                      (|mul_DF|
                                       (|add_DF| 1.0 (|add_DF| |s1| |s2|))
                                       |mu_inv|)
                                      (|qsqrt_DF| |mu_inv|)))
                               (EXIT
                                (PROGN
                                 (LETT #5#
                                       (|add_DF|
                                        (|mul_DF|
                                         (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                         |sigma|)
                                        (|mul_DF| |power4| |ss|)))
                                 (GO #7=#:G27)))))
                         ('T
                          (SEQ (LETT |xnroot| (|qsqrt_DF| |x|))
                               (LETT |ynroot| (|qsqrt_DF| |y|))
                               (LETT |znroot| (|qsqrt_DF| |z|))
                               (LETT |lambda|
                                     (|add_DF|
                                      (|mul_DF| |xnroot|
                                                (|add_DF| |ynroot| |znroot|))
                                      (|mul_DF| |ynroot| |znroot|)))
                               (LETT |sigma|
                                     (|add_DF| |sigma|
                                               (|div_DF| |power4|
                                                         (|mul_DF| |znroot|
                                                                   (|add_DF|
                                                                    |z|
                                                                    |lambda|)))))
                               (LETT |power4|
                                     (|mul_DF| (QREFELT % 8) |power4|))
                               (LETT |x|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |x| |lambda|)))
                               (LETT |y|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |y| |lambda|)))
                               (LETT |z|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |z| |lambda|)))
                               (LETT |mu|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |mu| |lambda|)))
                               (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |ELIPIDF;ellipticRJ;5Df;5|
        ((|x| (|DoubleFloat|)) (|y| (|DoubleFloat|)) (|z| (|DoubleFloat|))
         (|p| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|padev| #1#) (|mu_inv| (|DoubleFloat|)) (|xndev| #2=(|DoubleFloat|))
          (|yndev| #2#) (|zndev| #2#) (|pndev| #2#) (|ea| #3=(|DoubleFloat|))
          (|eb| #2#) (|ec| #2#) (|e2| #4=(|DoubleFloat|)) (|e3| #3#) (|s1| #2#)
          (|s2| #2#) (|s3| #4#) (|ss| #2#) (#5=#:G36 NIL)
          (|xnroot| #6=(|DoubleFloat|)) (|ynroot| #6#) (|znroot| #6#)
          (|lambda| #3#) (|alfa| #3#) (|beta| #2#) (|sigma| (|DoubleFloat|))
          (|power4| (|DoubleFloat|)) (|mu| #2#) (Q #2#))
         (SEQ
          (EXIT
           (SEQ (LETT |sigma| 0.0) (LETT |power4| 1.0)
                (LETT |mu|
                      (|mul_DF| (QREFELT % 9)
                                (|add_DF|
                                 (|add_DF| (|add_DF| (|add_DF| |x| |y|) |z|)
                                           |p|)
                                 |p|)))
                (LETT |xadev| (|abs_DF| (|sub_DF| |mu| |x|)))
                (LETT |yadev| (|abs_DF| (|sub_DF| |mu| |y|)))
                (LETT |zadev| (|abs_DF| (|sub_DF| |mu| |z|)))
                (LETT |padev| (|abs_DF| (|sub_DF| |mu| |p|)))
                (LETT Q
                      (|mul_DF| (QREFELT % 27)
                                (|max_DF| (|max_DF| |xadev| |yadev|)
                                          (|max_DF| |zadev| |padev|))))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((|less_DF| Q (|abs_DF| |mu|))
                          (SEQ (LETT |mu_inv| (|div_DF| 1.0 |mu|))
                               (LETT |xndev|
                                     (|mul_DF| (|sub_DF| |mu| |x|) |mu_inv|))
                               (LETT |yndev|
                                     (|mul_DF| (|sub_DF| |mu| |y|) |mu_inv|))
                               (LETT |zndev|
                                     (|mul_DF| (|sub_DF| |mu| |z|) |mu_inv|))
                               (LETT |pndev|
                                     (|mul_DF| (|sub_DF| |mu| |p|) |mu_inv|))
                               (LETT |ea|
                                     (|add_DF|
                                      (|mul_DF| |xndev|
                                                (|add_DF| |yndev| |zndev|))
                                      (|mul_DF| |yndev| |zndev|)))
                               (LETT |eb|
                                     (|mul_DF| (|mul_DF| |xndev| |yndev|)
                                               |zndev|))
                               (LETT |ec| (|mul_DF| |pndev| |pndev|))
                               (LETT |e2|
                                     (|sub_DF| |ea|
                                               (|mul_DF|
                                                (FLOAT 3
                                                       MOST-POSITIVE-DOUBLE-FLOAT)
                                                |ec|)))
                               (LETT |e3|
                                     (|add_DF| |eb|
                                               (|mul_DF|
                                                (|mul_DF|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 |pndev|)
                                                (|sub_DF| |ea| |ec|))))
                               (LETT |s1|
                                     (|mul_DF| |e2|
                                               (|sub_DF|
                                                (|add_DF|
                                                 (|minus_DF| (QREFELT % 28))
                                                 (|mul_DF| (QREFELT % 31)
                                                           |e2|))
                                                (|mul_DF| (QREFELT % 32)
                                                          |e3|))))
                               (LETT |s2|
                                     (|mul_DF| |eb|
                                               (|add_DF|
                                                (|mul_DF| (QREFELT % 6)
                                                          (QREFELT % 7))
                                                (|mul_DF| |pndev|
                                                          (|add_DF|
                                                           (|minus_DF|
                                                            (|add_DF|
                                                             (QREFELT % 29)
                                                             (QREFELT % 29)))
                                                           (|mul_DF| |pndev|
                                                                     (QREFELT %
                                                                              30)))))))
                               (LETT |s3|
                                     (|sub_DF|
                                      (|mul_DF| (|mul_DF| |pndev| |ea|)
                                                (|sub_DF| (QREFELT % 7)
                                                          (|mul_DF| |pndev|
                                                                    (QREFELT %
                                                                             29))))
                                      (|mul_DF|
                                       (|mul_DF| (QREFELT % 7) |pndev|) |ec|)))
                               (LETT |ss|
                                     (|mul_DF|
                                      (|mul_DF|
                                       (|add_DF| 1.0
                                                 (|add_DF| (|add_DF| |s1| |s2|)
                                                           |s3|))
                                       |mu_inv|)
                                      (|qsqrt_DF| |mu_inv|)))
                               (EXIT
                                (PROGN
                                 (LETT #5#
                                       (|add_DF|
                                        (|mul_DF|
                                         (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                         |sigma|)
                                        (|mul_DF| |power4| |ss|)))
                                 (GO #7=#:G35)))))
                         ('T
                          (SEQ (LETT |xnroot| (|qsqrt_DF| |x|))
                               (LETT |ynroot| (|qsqrt_DF| |y|))
                               (LETT |znroot| (|qsqrt_DF| |z|))
                               (LETT |lambda|
                                     (|add_DF|
                                      (|mul_DF| |xnroot|
                                                (|add_DF| |ynroot| |znroot|))
                                      (|mul_DF| |ynroot| |znroot|)))
                               (LETT |alfa|
                                     (|add_DF|
                                      (|mul_DF| |p|
                                                (|add_DF|
                                                 (|add_DF| |xnroot| |ynroot|)
                                                 |znroot|))
                                      (|mul_DF| (|mul_DF| |xnroot| |ynroot|)
                                                |znroot|)))
                               (LETT |alfa| (|mul_DF| |alfa| |alfa|))
                               (LETT |beta|
                                     (|mul_DF|
                                      (|mul_DF| |p| (|add_DF| |p| |lambda|))
                                      (|add_DF| |p| |lambda|)))
                               (LETT |sigma|
                                     (|add_DF| |sigma|
                                               (|mul_DF| |power4|
                                                         (SPADCALL |alfa|
                                                                   |beta|
                                                                   (QREFELT %
                                                                            38)))))
                               (LETT |power4|
                                     (|mul_DF| (QREFELT % 8) |power4|))
                               (LETT |x|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |x| |lambda|)))
                               (LETT |y|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |y| |lambda|)))
                               (LETT |z|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |z| |lambda|)))
                               (LETT |p|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |p| |lambda|)))
                               (LETT |mu|
                                     (|mul_DF| (QREFELT % 8)
                                               (|add_DF| |mu| |lambda|)))
                               (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |ELIPIDF;ellipticF;3Df;6|
        ((|z| (|DoubleFloat|)) (|m| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|mul_DF| |z|
                  (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                            (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|))
                            1.0 (QREFELT % 39)))) 

(SDEFUN |ELIPIDF;ellipticK;2Df;7| ((|m| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0 (QREFELT % 39))) 

(SDEFUN |ELIPIDF;ellipticE;3Df;8|
        ((|z| (|DoubleFloat|)) (|m| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|sub_DF|
         (|mul_DF| |z|
                   (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                             (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|))
                             1.0 (QREFELT % 39)))
         (|mul_DF|
          (|mul_DF|
           (|mul_DF|
            (|mul_DF| (|div_DF| |m| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)) |z|)
            |z|)
           |z|)
          (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                    (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
                    (QREFELT % 40))))) 

(SDEFUN |ELIPIDF;ellipticE;2Df;9| ((|m| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|sub_DF| (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0 (QREFELT % 39))
                  (|mul_DF| (|div_DF| |m| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT))
                            (SPADCALL 0.0 (|sub_DF| 1.0 |m|) 1.0
                                      (QREFELT % 40))))) 

(SDEFUN |ELIPIDF;ellipticPi;4Df;10|
        ((|z| (|DoubleFloat|)) (|n| (|DoubleFloat|)) (|m| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (|add_DF|
         (|mul_DF| |z|
                   (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                             (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|))
                             1.0 (QREFELT % 39)))
         (|mul_DF|
          (|mul_DF|
           (|mul_DF|
            (|mul_DF| (|div_DF| |n| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)) |z|)
            |z|)
           |z|)
          (SPADCALL (|sub_DF| 1.0 (|mul_DF| |z| |z|))
                    (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |m| |z|) |z|)) 1.0
                    (|sub_DF| 1.0 (|mul_DF| (|mul_DF| |n| |z|) |z|))
                    (QREFELT % 41))))) 

(SDEFUN |ELIPIDF;ellipticRC;3C;11|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|mu_inv| (|Complex| (|DoubleFloat|)))
          (|sn| #1=(|Complex| (|DoubleFloat|))) (|sn2| #1#)
          (S1 #2=(|Complex| (|DoubleFloat|))) (S0 #2#) (#3=#:G49 NIL)
          (|lambda| #2#) (|mu| (|Complex| (|DoubleFloat|)))
          (Q (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mu|
                  (SPADCALL (QREFELT % 7)
                            (SPADCALL (SPADCALL |x| |y| (QREFELT % 47)) |y|
                                      (QREFELT % 47))
                            (QREFELT % 48)))
            (LETT Q
                  (|mul_DF| (QREFELT % 16)
                            (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT % 49))
                             %)))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (|ELIPIDF;rabs| |mu| %))
                      (SEQ
                       (LETT |mu_inv|
                             (SPADCALL (|spadConstant| % 50) |mu|
                                       (QREFELT % 51)))
                       (LETT |sn|
                             (SPADCALL |mu_inv|
                                       (SPADCALL |y| |mu| (QREFELT % 49))
                                       (QREFELT % 52)))
                       (LETT |sn2| (SPADCALL |sn| |sn| (QREFELT % 52)))
                       (LETT S1
                             (SPADCALL (SPADCALL (QREFELT % 11) (QREFELT % 53))
                                       (SPADCALL |sn2|
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 13)
                                                            (QREFELT % 53))
                                                  (SPADCALL |sn2|
                                                            (SPADCALL
                                                             (QREFELT % 15)
                                                             (QREFELT % 53))
                                                            (QREFELT % 52))
                                                  (QREFELT % 47))
                                                 (QREFELT % 52))
                                       (QREFELT % 47)))
                       (LETT S0
                             (SPADCALL (SPADCALL (QREFELT % 10) (QREFELT % 53))
                                       (SPADCALL |sn2|
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 12)
                                                            (QREFELT % 53))
                                                  (SPADCALL |sn2|
                                                            (SPADCALL
                                                             (QREFELT % 14)
                                                             (QREFELT % 53))
                                                            (QREFELT % 52))
                                                  (QREFELT % 47))
                                                 (QREFELT % 52))
                                       (QREFELT % 47)))
                       (EXIT
                        (PROGN
                         (LETT #3#
                               (SPADCALL (SPADCALL |mu_inv| (QREFELT % 54))
                                         (SPADCALL (|spadConstant| % 50)
                                                   (SPADCALL |sn2|
                                                             (SPADCALL S0
                                                                       (SPADCALL
                                                                        |sn| S1
                                                                        (QREFELT
                                                                         % 52))
                                                                       (QREFELT
                                                                        % 47))
                                                             (QREFELT % 52))
                                                   (QREFELT % 47))
                                         (QREFELT % 52)))
                         (GO #4=#:G48)))))
                     ('T
                      (SEQ
                       (LETT |lambda|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 (QREFELT % 56))
                                         (SPADCALL |x| (QREFELT % 54))
                                         (QREFELT % 52))
                               (SPADCALL |y| (QREFELT % 54)) (QREFELT % 52))
                              |y| (QREFELT % 47)))
                       (LETT |x|
                             (SPADCALL (QREFELT % 8)
                                       (SPADCALL |x| |lambda| (QREFELT % 47))
                                       (QREFELT % 48)))
                       (LETT |y|
                             (SPADCALL (QREFELT % 8)
                                       (SPADCALL |y| |lambda| (QREFELT % 47))
                                       (QREFELT % 48)))
                       (LETT |mu|
                             (SPADCALL (QREFELT % 8)
                                       (SPADCALL |mu| |lambda| (QREFELT % 47))
                                       (QREFELT % 48)))
                       (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #4# (EXIT #3#)))) 

(SDEFUN |ELIPIDF;ellipticRF;4C;12|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|mu_inv| (|Complex| (|DoubleFloat|)))
          (|xndev| #2=(|Complex| (|DoubleFloat|))) (|yndev| #2#) (|zndev| #2#)
          (|e2| (|Complex| (|DoubleFloat|))) (|e3| #2#)
          (|s| #3=(|Complex| (|DoubleFloat|))) (#4=#:G57 NIL)
          (|xnroot| #5=(|Complex| (|DoubleFloat|))) (|ynroot| #5#)
          (|znroot| #5#) (|lambda| #3#) (|mu| (|Complex| (|DoubleFloat|)))
          (Q (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mu|
                  (SPADCALL (QREFELT % 7)
                            (SPADCALL (SPADCALL |x| |y| (QREFELT % 47)) |z|
                                      (QREFELT % 47))
                            (QREFELT % 48)))
            (LETT |xadev|
                  (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT % 49)) %))
            (LETT |yadev|
                  (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT % 49)) %))
            (LETT |zadev|
                  (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT % 49)) %))
            (LETT Q
                  (|mul_DF| (QREFELT % 21)
                            (|max_DF| |xadev| (|max_DF| |yadev| |zadev|))))
            (EXIT
             (SEQ G190 NIL
                  (SEQ
                   (EXIT
                    (COND
                     ((|less_DF| Q (|ELIPIDF;rabs| |mu| %))
                      (SEQ
                       (LETT |mu_inv|
                             (SPADCALL (|spadConstant| % 50) |mu|
                                       (QREFELT % 51)))
                       (LETT |xndev|
                             (SPADCALL (SPADCALL |mu| |x| (QREFELT % 49))
                                       |mu_inv| (QREFELT % 52)))
                       (LETT |yndev|
                             (SPADCALL (SPADCALL |mu| |y| (QREFELT % 49))
                                       |mu_inv| (QREFELT % 52)))
                       (LETT |zndev|
                             (SPADCALL (SPADCALL |mu| |z| (QREFELT % 49))
                                       |mu_inv| (QREFELT % 52)))
                       (LETT |e2|
                             (SPADCALL
                              (SPADCALL |xndev| |yndev| (QREFELT % 52))
                              (SPADCALL |zndev| |zndev| (QREFELT % 52))
                              (QREFELT % 49)))
                       (LETT |e3|
                             (SPADCALL
                              (SPADCALL |xndev| |yndev| (QREFELT % 52)) |zndev|
                              (QREFELT % 52)))
                       (LETT |s|
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 50)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (QREFELT % 17) |e2|
                                                     (QREFELT % 48))
                                           (SPADCALL (QREFELT % 18)
                                                     (QREFELT % 53))
                                           (QREFELT % 49))
                                          (SPADCALL (QREFELT % 11) |e3|
                                                    (QREFELT % 48))
                                          (QREFELT % 49))
                                         |e2| (QREFELT % 52))
                                        (QREFELT % 47))
                              (SPADCALL (QREFELT % 20) |e3| (QREFELT % 48))
                              (QREFELT % 47)))
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (SPADCALL |s| (SPADCALL |mu_inv| (QREFELT % 54))
                                         (QREFELT % 52)))
                         (GO #6=#:G56)))))
                     ('T
                      (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT % 54)))
                           (LETT |ynroot| (SPADCALL |y| (QREFELT % 54)))
                           (LETT |znroot| (SPADCALL |z| (QREFELT % 54)))
                           (LETT |lambda|
                                 (SPADCALL
                                  (SPADCALL |xnroot|
                                            (SPADCALL |ynroot| |znroot|
                                                      (QREFELT % 47))
                                            (QREFELT % 52))
                                  (SPADCALL |ynroot| |znroot| (QREFELT % 52))
                                  (QREFELT % 47)))
                           (LETT |x|
                                 (SPADCALL (QREFELT % 8)
                                           (SPADCALL |x| |lambda|
                                                     (QREFELT % 47))
                                           (QREFELT % 48)))
                           (LETT |y|
                                 (SPADCALL (QREFELT % 8)
                                           (SPADCALL |y| |lambda|
                                                     (QREFELT % 47))
                                           (QREFELT % 48)))
                           (LETT |z|
                                 (SPADCALL (QREFELT % 8)
                                           (SPADCALL |z| |lambda|
                                                     (QREFELT % 47))
                                           (QREFELT % 48)))
                           (LETT |mu|
                                 (SPADCALL (QREFELT % 8)
                                           (SPADCALL |mu| |lambda|
                                                     (QREFELT % 47))
                                           (QREFELT % 48)))
                           (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                  NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #4#)))) 

(SDEFUN |ELIPIDF;ellipticRD;4C;13|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (|z| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|mu_inv| (|Complex| (|DoubleFloat|)))
          (|xndev| #2=(|Complex| (|DoubleFloat|))) (|yndev| #2#) (|zndev| #2#)
          (|ea| #2#) (|eb| #2#) (|ec| #3=(|Complex| (|DoubleFloat|)))
          (|ed| #3#) (|ef| #4=(|Complex| (|DoubleFloat|))) (|s1| #2#)
          (|s2| #2#) (|ss| #2#) (#5=#:G65 NIL)
          (|xnroot| #6=(|Complex| (|DoubleFloat|))) (|ynroot| #6#)
          (|znroot| #6#) (|lambda| #4#) (|sigma| (|Complex| (|DoubleFloat|)))
          (|power4| (|Complex| (|DoubleFloat|)))
          (|mu| (|Complex| (|DoubleFloat|))) (Q (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |sigma| (|spadConstant| % 59))
                (LETT |power4| (|spadConstant| % 50))
                (LETT |mu|
                      (SPADCALL (QREFELT % 9)
                                (SPADCALL (SPADCALL |x| |y| (QREFELT % 47))
                                          (SPADCALL (SPADCALL 3 (QREFELT % 56))
                                                    |z| (QREFELT % 52))
                                          (QREFELT % 47))
                                (QREFELT % 48)))
                (LETT |xadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT % 49)) %))
                (LETT |yadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT % 49)) %))
                (LETT |zadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT % 49)) %))
                (LETT Q
                      (|mul_DF| (QREFELT % 27)
                                (|max_DF| |xadev| (|max_DF| |yadev| |zadev|))))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((|less_DF| Q (|ELIPIDF;rabs| |mu| %))
                          (SEQ
                           (LETT |mu_inv|
                                 (SPADCALL (|spadConstant| % 50) |mu|
                                           (QREFELT % 51)))
                           (LETT |xndev|
                                 (SPADCALL (SPADCALL |mu| |x| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |yndev|
                                 (SPADCALL (SPADCALL |mu| |y| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |zndev|
                                 (SPADCALL (SPADCALL |mu| |z| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |ea|
                                 (SPADCALL |xndev| |yndev| (QREFELT % 52)))
                           (LETT |eb|
                                 (SPADCALL |zndev| |zndev| (QREFELT % 52)))
                           (LETT |ec| (SPADCALL |ea| |eb| (QREFELT % 49)))
                           (LETT |ed|
                                 (SPADCALL |ea|
                                           (SPADCALL
                                            (FLOAT 6
                                                   MOST-POSITIVE-DOUBLE-FLOAT)
                                            |eb| (QREFELT % 48))
                                           (QREFELT % 49)))
                           (LETT |ef|
                                 (SPADCALL (SPADCALL |ed| |ec| (QREFELT % 47))
                                           |ec| (QREFELT % 47)))
                           (LETT |s1|
                                 (SPADCALL |ed|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QREFELT % 22)
                                                       (QREFELT % 53))
                                             (SPADCALL
                                              (|mul_DF| (QREFELT % 8)
                                                        (QREFELT % 24))
                                              |ed| (QREFELT % 48))
                                             (QREFELT % 47))
                                            (SPADCALL
                                             (SPADCALL
                                              (|mul_DF| (QREFELT % 26)
                                                        (QREFELT % 25))
                                              |zndev| (QREFELT % 48))
                                             |ef| (QREFELT % 52))
                                            (QREFELT % 49))
                                           (QREFELT % 52)))
                           (LETT |s2|
                                 (SPADCALL |zndev|
                                           (SPADCALL
                                            (SPADCALL (QREFELT % 23) |ef|
                                                      (QREFELT % 48))
                                            (SPADCALL |zndev|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 24) |ec|
                                                         (QREFELT % 48))
                                                        (QREFELT % 60))
                                                       (SPADCALL
                                                        (SPADCALL |zndev|
                                                                  (QREFELT %
                                                                           25)
                                                                  (QREFELT %
                                                                           61))
                                                        |ea| (QREFELT % 52))
                                                       (QREFELT % 47))
                                                      (QREFELT % 52))
                                            (QREFELT % 47))
                                           (QREFELT % 52)))
                           (LETT |ss|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 50)
                                             (SPADCALL |s1| |s2|
                                                       (QREFELT % 47))
                                             (QREFELT % 47))
                                   |mu_inv| (QREFELT % 52))
                                  (SPADCALL |mu_inv| (QREFELT % 54))
                                  (QREFELT % 52)))
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL
                                    (SPADCALL
                                     (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                     |sigma| (QREFELT % 48))
                                    (SPADCALL |power4| |ss| (QREFELT % 52))
                                    (QREFELT % 47)))
                             (GO #7=#:G64)))))
                         ('T
                          (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT % 54)))
                               (LETT |ynroot| (SPADCALL |y| (QREFELT % 54)))
                               (LETT |znroot| (SPADCALL |z| (QREFELT % 54)))
                               (LETT |lambda|
                                     (SPADCALL
                                      (SPADCALL |xnroot|
                                                (SPADCALL |ynroot| |znroot|
                                                          (QREFELT % 47))
                                                (QREFELT % 52))
                                      (SPADCALL |ynroot| |znroot|
                                                (QREFELT % 52))
                                      (QREFELT % 47)))
                               (LETT |sigma|
                                     (SPADCALL |sigma|
                                               (SPADCALL |power4|
                                                         (SPADCALL |znroot|
                                                                   (SPADCALL
                                                                    |z|
                                                                    |lambda|
                                                                    (QREFELT %
                                                                             47))
                                                                   (QREFELT %
                                                                            52))
                                                         (QREFELT % 51))
                                               (QREFELT % 47)))
                               (LETT |power4|
                                     (SPADCALL (QREFELT % 8) |power4|
                                               (QREFELT % 48)))
                               (LETT |x|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |x| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |y|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |y| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |z|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |z| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |mu|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |mu| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |ELIPIDF;ellipticRJ;5C;14|
        ((|x| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
         (|z| (|Complex| (|DoubleFloat|))) (|p| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|xadev| #1=(|DoubleFloat|)) (|yadev| #1#) (|zadev| #1#)
          (|padev| #1#) (|mu_inv| (|Complex| (|DoubleFloat|)))
          (|xndev| #2=(|Complex| (|DoubleFloat|))) (|yndev| #2#) (|zndev| #2#)
          (|pndev| #2#) (|ea| #3=(|Complex| (|DoubleFloat|))) (|eb| #2#)
          (|ec| #2#) (|e2| #4=(|Complex| (|DoubleFloat|))) (|e3| #3#)
          (|s1| #2#) (|s2| #2#) (|s3| #4#) (|ss| #2#) (#5=#:G73 NIL)
          (|xnroot| #6=(|Complex| (|DoubleFloat|))) (|ynroot| #6#)
          (|znroot| #6#) (|lambda| #3#) (|alfa| #3#) (|beta| #2#)
          (|sigma| (|Complex| (|DoubleFloat|)))
          (|power4| (|Complex| (|DoubleFloat|)))
          (|mu| (|Complex| (|DoubleFloat|))) (Q (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |sigma| (|spadConstant| % 59))
                (LETT |power4| (|spadConstant| % 50))
                (LETT |mu|
                      (SPADCALL (QREFELT % 9)
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |x| |y| (QREFELT % 47))
                                            |z| (QREFELT % 47))
                                  |p| (QREFELT % 47))
                                 |p| (QREFELT % 47))
                                (QREFELT % 48)))
                (LETT |xadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |x| (QREFELT % 49)) %))
                (LETT |yadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |y| (QREFELT % 49)) %))
                (LETT |zadev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |z| (QREFELT % 49)) %))
                (LETT |padev|
                      (|ELIPIDF;rabs| (SPADCALL |mu| |p| (QREFELT % 49)) %))
                (LETT Q
                      (|mul_DF| (QREFELT % 27)
                                (|max_DF| (|max_DF| |xadev| |yadev|)
                                          (|max_DF| |zadev| |padev|))))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((|less_DF| Q (|ELIPIDF;rabs| |mu| %))
                          (SEQ
                           (LETT |mu_inv|
                                 (SPADCALL (|spadConstant| % 50) |mu|
                                           (QREFELT % 51)))
                           (LETT |xndev|
                                 (SPADCALL (SPADCALL |mu| |x| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |yndev|
                                 (SPADCALL (SPADCALL |mu| |y| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |zndev|
                                 (SPADCALL (SPADCALL |mu| |z| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |pndev|
                                 (SPADCALL (SPADCALL |mu| |p| (QREFELT % 49))
                                           |mu_inv| (QREFELT % 52)))
                           (LETT |ea|
                                 (SPADCALL
                                  (SPADCALL |xndev|
                                            (SPADCALL |yndev| |zndev|
                                                      (QREFELT % 47))
                                            (QREFELT % 52))
                                  (SPADCALL |yndev| |zndev| (QREFELT % 52))
                                  (QREFELT % 47)))
                           (LETT |eb|
                                 (SPADCALL
                                  (SPADCALL |xndev| |yndev| (QREFELT % 52))
                                  |zndev| (QREFELT % 52)))
                           (LETT |ec|
                                 (SPADCALL |pndev| |pndev| (QREFELT % 52)))
                           (LETT |e2|
                                 (SPADCALL |ea|
                                           (SPADCALL
                                            (FLOAT 3
                                                   MOST-POSITIVE-DOUBLE-FLOAT)
                                            |ec| (QREFELT % 48))
                                           (QREFELT % 49)))
                           (LETT |e3|
                                 (SPADCALL |eb|
                                           (SPADCALL
                                            (SPADCALL
                                             (FLOAT 2
                                                    MOST-POSITIVE-DOUBLE-FLOAT)
                                             |pndev| (QREFELT % 48))
                                            (SPADCALL |ea| |ec| (QREFELT % 49))
                                            (QREFELT % 52))
                                           (QREFELT % 47)))
                           (LETT |s1|
                                 (SPADCALL |e2|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QREFELT % 28)
                                                        (QREFELT % 53))
                                              (QREFELT % 60))
                                             (SPADCALL (QREFELT % 31) |e2|
                                                       (QREFELT % 48))
                                             (QREFELT % 47))
                                            (SPADCALL (QREFELT % 32) |e3|
                                                      (QREFELT % 48))
                                            (QREFELT % 49))
                                           (QREFELT % 52)))
                           (LETT |s2|
                                 (SPADCALL |eb|
                                           (SPADCALL
                                            (SPADCALL (QREFELT % 6)
                                                      (SPADCALL (QREFELT % 7)
                                                                (QREFELT % 53))
                                                      (QREFELT % 48))
                                            (SPADCALL |pndev|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|add_DF|
                                                          (QREFELT % 29)
                                                          (QREFELT % 29))
                                                         (QREFELT % 53))
                                                        (QREFELT % 60))
                                                       (SPADCALL |pndev|
                                                                 (QREFELT % 30)
                                                                 (QREFELT %
                                                                          61))
                                                       (QREFELT % 47))
                                                      (QREFELT % 52))
                                            (QREFELT % 47))
                                           (QREFELT % 52)))
                           (LETT |s3|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |pndev| |ea| (QREFELT % 52))
                                   (SPADCALL
                                    (SPADCALL (QREFELT % 7) (QREFELT % 53))
                                    (SPADCALL |pndev| (QREFELT % 29)
                                              (QREFELT % 61))
                                    (QREFELT % 49))
                                   (QREFELT % 52))
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 7) |pndev|
                                             (QREFELT % 48))
                                   |ec| (QREFELT % 52))
                                  (QREFELT % 49)))
                           (LETT |ss|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 50)
                                             (SPADCALL
                                              (SPADCALL |s1| |s2|
                                                        (QREFELT % 47))
                                              |s3| (QREFELT % 47))
                                             (QREFELT % 47))
                                   |mu_inv| (QREFELT % 52))
                                  (SPADCALL |mu_inv| (QREFELT % 54))
                                  (QREFELT % 52)))
                           (EXIT
                            (PROGN
                             (LETT #5#
                                   (SPADCALL
                                    (SPADCALL
                                     (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                                     |sigma| (QREFELT % 48))
                                    (SPADCALL |power4| |ss| (QREFELT % 52))
                                    (QREFELT % 47)))
                             (GO #7=#:G72)))))
                         ('T
                          (SEQ (LETT |xnroot| (SPADCALL |x| (QREFELT % 54)))
                               (LETT |ynroot| (SPADCALL |y| (QREFELT % 54)))
                               (LETT |znroot| (SPADCALL |z| (QREFELT % 54)))
                               (LETT |lambda|
                                     (SPADCALL
                                      (SPADCALL |xnroot|
                                                (SPADCALL |ynroot| |znroot|
                                                          (QREFELT % 47))
                                                (QREFELT % 52))
                                      (SPADCALL |ynroot| |znroot|
                                                (QREFELT % 52))
                                      (QREFELT % 47)))
                               (LETT |alfa|
                                     (SPADCALL
                                      (SPADCALL |p|
                                                (SPADCALL
                                                 (SPADCALL |xnroot| |ynroot|
                                                           (QREFELT % 47))
                                                 |znroot| (QREFELT % 47))
                                                (QREFELT % 52))
                                      (SPADCALL
                                       (SPADCALL |xnroot| |ynroot|
                                                 (QREFELT % 52))
                                       |znroot| (QREFELT % 52))
                                      (QREFELT % 47)))
                               (LETT |alfa|
                                     (SPADCALL |alfa| |alfa| (QREFELT % 52)))
                               (LETT |beta|
                                     (SPADCALL
                                      (SPADCALL |p|
                                                (SPADCALL |p| |lambda|
                                                          (QREFELT % 47))
                                                (QREFELT % 52))
                                      (SPADCALL |p| |lambda| (QREFELT % 47))
                                      (QREFELT % 52)))
                               (LETT |sigma|
                                     (SPADCALL |sigma|
                                               (SPADCALL |power4|
                                                         (SPADCALL |alfa|
                                                                   |beta|
                                                                   (QREFELT %
                                                                            57))
                                                         (QREFELT % 52))
                                               (QREFELT % 47)))
                               (LETT |power4|
                                     (SPADCALL (QREFELT % 8) |power4|
                                               (QREFELT % 48)))
                               (LETT |x|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |x| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |y|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |y| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |z|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |z| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |p|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |p| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (LETT |mu|
                                     (SPADCALL (QREFELT % 8)
                                               (SPADCALL |mu| |lambda|
                                                         (QREFELT % 47))
                                               (QREFELT % 48)))
                               (EXIT (LETT Q (|mul_DF| (QREFELT % 8) Q))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |ELIPIDF;ellipticF;3C;15|
        ((|z| (|Complex| (|DoubleFloat|))) (|m| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPADCALL |z|
                  (SPADCALL
                   (SPADCALL (|spadConstant| % 50)
                             (SPADCALL |z| |z| (QREFELT % 52)) (QREFELT % 49))
                   (SPADCALL (|spadConstant| % 50)
                             (SPADCALL (SPADCALL |m| |z| (QREFELT % 52)) |z|
                                       (QREFELT % 52))
                             (QREFELT % 49))
                   (|spadConstant| % 50) (QREFELT % 58))
                  (QREFELT % 52))) 

(SDEFUN |ELIPIDF;ellipticK;2C;16|
        ((|m| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL (|spadConstant| % 59)
                  (SPADCALL (|spadConstant| % 50) |m| (QREFELT % 49))
                  (|spadConstant| % 50) (QREFELT % 58))) 

(SDEFUN |ELIPIDF;ellipticE;3C;17|
        ((|z| (|Complex| (|DoubleFloat|))) (|m| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 50)
                              (SPADCALL |z| |z| (QREFELT % 52)) (QREFELT % 49))
                    (SPADCALL (|spadConstant| % 50)
                              (SPADCALL (SPADCALL |m| |z| (QREFELT % 52)) |z|
                                        (QREFELT % 52))
                              (QREFELT % 49))
                    (|spadConstant| % 50) (QREFELT % 58))
                   (QREFELT % 52))
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |m| (SPADCALL 3 (QREFELT % 56)) (QREFELT % 51))
                      |z| (QREFELT % 52))
            |z| (QREFELT % 52))
           |z| (QREFELT % 52))
          (SPADCALL
           (SPADCALL (|spadConstant| % 50) (SPADCALL |z| |z| (QREFELT % 52))
                     (QREFELT % 49))
           (SPADCALL (|spadConstant| % 50)
                     (SPADCALL (SPADCALL |m| |z| (QREFELT % 52)) |z|
                               (QREFELT % 52))
                     (QREFELT % 49))
           (|spadConstant| % 50) (QREFELT % 62))
          (QREFELT % 52))
         (QREFELT % 49))) 

(SDEFUN |ELIPIDF;ellipticE;2C;18|
        ((|m| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL (|spadConstant| % 59)
                   (SPADCALL (|spadConstant| % 50) |m| (QREFELT % 49))
                   (|spadConstant| % 50) (QREFELT % 58))
         (SPADCALL (SPADCALL |m| (SPADCALL 3 (QREFELT % 56)) (QREFELT % 51))
                   (SPADCALL (|spadConstant| % 59)
                             (SPADCALL (|spadConstant| % 50) |m|
                                       (QREFELT % 49))
                             (|spadConstant| % 50) (QREFELT % 62))
                   (QREFELT % 52))
         (QREFELT % 49))) 

(SDEFUN |ELIPIDF;ellipticPi;4C;19|
        ((|z| (|Complex| (|DoubleFloat|))) (|n| (|Complex| (|DoubleFloat|)))
         (|m| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPADCALL
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 50)
                              (SPADCALL |z| |z| (QREFELT % 52)) (QREFELT % 49))
                    (SPADCALL (|spadConstant| % 50)
                              (SPADCALL (SPADCALL |m| |z| (QREFELT % 52)) |z|
                                        (QREFELT % 52))
                              (QREFELT % 49))
                    (|spadConstant| % 50) (QREFELT % 58))
                   (QREFELT % 52))
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL (SPADCALL |n| (SPADCALL 3 (QREFELT % 56)) (QREFELT % 51))
                      |z| (QREFELT % 52))
            |z| (QREFELT % 52))
           |z| (QREFELT % 52))
          (SPADCALL
           (SPADCALL (|spadConstant| % 50) (SPADCALL |z| |z| (QREFELT % 52))
                     (QREFELT % 49))
           (SPADCALL (|spadConstant| % 50)
                     (SPADCALL (SPADCALL |m| |z| (QREFELT % 52)) |z|
                               (QREFELT % 52))
                     (QREFELT % 49))
           (|spadConstant| % 50)
           (SPADCALL (|spadConstant| % 50)
                     (SPADCALL (SPADCALL |n| |z| (QREFELT % 52)) |z|
                               (QREFELT % 52))
                     (QREFELT % 49))
           (QREFELT % 63))
          (QREFELT % 52))
         (QREFELT % 47))) 

(DECLAIM (NOTINLINE |DoubleFloatEllipticIntegrals;|)) 

(DEFUN |DoubleFloatEllipticIntegrals;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|DoubleFloatEllipticIntegrals|))
          (LETT % (GETREFV 69))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DoubleFloatEllipticIntegrals| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|div_DF| 1.0 (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 7 (|div_DF| 1.0 (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 8 (|div_DF| 1.0 (FLOAT 4 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 9 (|div_DF| 1.0 (FLOAT 5 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 10
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 11 (|div_DF| 1.0 (FLOAT 7 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 12
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 13
                    (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 14
                    (|div_DF| (FLOAT 159 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 208 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 15
                    (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 8 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 16 (FLOAT 94 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV % 17 (|div_DF| 1.0 (FLOAT 24 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 18 (|div_DF| 1.0 (FLOAT 10 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 19
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 44 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 20 (|div_DF| 1.0 (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 21 (FLOAT 427 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV % 22
                    (|minus_DF|
                     (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                               (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT))))
          (QSETREFV % 23 (|div_DF| 1.0 (FLOAT 6 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 24
                    (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 25
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 26 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 26
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 27 (FLOAT 646 MOST-POSITIVE-DOUBLE-FLOAT))
          (QSETREFV % 28
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 14 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 29
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 22 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 30
                    (|div_DF| (FLOAT 3 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 26 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 31
                    (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 88 MOST-POSITIVE-DOUBLE-FLOAT)))
          (QSETREFV % 32
                    (|div_DF| (FLOAT 9 MOST-POSITIVE-DOUBLE-FLOAT)
                              (FLOAT 52 MOST-POSITIVE-DOUBLE-FLOAT)))
          %))) 

(DEFUN |DoubleFloatEllipticIntegrals| ()
  (SPROG NIL
         (PROG (#1=#:G80)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|DoubleFloatEllipticIntegrals|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|DoubleFloatEllipticIntegrals|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|DoubleFloatEllipticIntegrals;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|DoubleFloatEllipticIntegrals|)))))))))) 

(MAKEPROP '|DoubleFloatEllipticIntegrals| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|half| '|one_third| '|one_fourth|
              '|one_fifth| '|c2_RC| '|c3_RC| '|c4_RC| '|c5_RC| '|c6_RC|
              '|c7_RC| '|inv_err_RC| '|c1_RF| '|c2_RF| '|c3_RF| '|c4_RF|
              '|inv_err_RF| '|c1_RD| '|c2_RD| '|c3_RD| '|c4_RD| '|c5_RD|
              '|inv_err_RJ| '|c1_RJ| '|c3_RJ| '|c4_RJ| '|c5_RJ| '|c6_RJ|
              (|DoubleFloat|) (|Complex| 33) (0 . |abs|) (|Fraction| 55)
              (5 . |1|) |ELIPIDF;ellipticRC;3Df;2| |ELIPIDF;ellipticRF;4Df;3|
              |ELIPIDF;ellipticRD;4Df;4| |ELIPIDF;ellipticRJ;5Df;5|
              |ELIPIDF;ellipticF;3Df;6| |ELIPIDF;ellipticK;2Df;7|
              |ELIPIDF;ellipticE;3Df;8| |ELIPIDF;ellipticE;2Df;9|
              |ELIPIDF;ellipticPi;4Df;10| (9 . +) (15 . *) (21 . -) (27 . |1|)
              (31 . /) (37 . *) (43 . |coerce|) (48 . |sqrt|) (|Integer|)
              (53 . |coerce|) |ELIPIDF;ellipticRC;3C;11|
              |ELIPIDF;ellipticRF;4C;12| (58 . |0|) (62 . -) (67 . *)
              |ELIPIDF;ellipticRD;4C;13| |ELIPIDF;ellipticRJ;5C;14|
              |ELIPIDF;ellipticF;3C;15| |ELIPIDF;ellipticK;2C;16|
              |ELIPIDF;ellipticE;3C;17| |ELIPIDF;ellipticE;2C;18|
              |ELIPIDF;ellipticPi;4C;19|)
           '#(|ellipticRJ| 73 |ellipticRF| 89 |ellipticRD| 103 |ellipticRC| 117
              |ellipticPi| 129 |ellipticK| 143 |ellipticF| 153 |ellipticE| 165)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|ellipticRC|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|ellipticRD|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|ellipticRF|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|ellipticRJ|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|ellipticF|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|ellipticK| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|ellipticE|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|)))
                                T)
                              '((|ellipticE| ((|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|ellipticPi|
                                 ((|DoubleFloat|) (|DoubleFloat|)
                                  (|DoubleFloat|) (|DoubleFloat|)))
                                T)
                              '((|ellipticRC|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticRD|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticRF|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticRJ|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticF|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticK|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticE|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticE|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T)
                              '((|ellipticPi|
                                 ((|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))
                                  (|Complex| (|DoubleFloat|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 68
                                            '(1 34 33 0 35 0 36 0 37 2 34 0 0 0
                                              47 2 34 0 33 0 48 2 34 0 0 0 49 0
                                              34 0 50 2 34 0 0 0 51 2 34 0 0 0
                                              52 1 34 0 33 53 1 34 0 0 54 1 34
                                              0 55 56 0 34 0 59 1 34 0 0 60 2
                                              34 0 0 33 61 4 0 34 34 34 34 34
                                              63 4 0 33 33 33 33 33 41 3 0 34
                                              34 34 34 58 3 0 33 33 33 33 39 3
                                              0 34 34 34 34 62 3 0 33 33 33 33
                                              40 2 0 34 34 34 57 2 0 33 33 33
                                              38 3 0 34 34 34 34 68 3 0 33 33
                                              33 33 46 1 0 34 34 65 1 0 33 33
                                              43 2 0 34 34 34 64 2 0 33 33 33
                                              42 1 0 34 34 67 2 0 34 34 34 66 1
                                              0 33 33 45 2 0 33 33 33 44)))))
           '|lookupComplete|)) 
