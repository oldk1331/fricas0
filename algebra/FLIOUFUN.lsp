
(SDEFUN |FLIOUFUN;gamma;C;1| ((% (|Complex| (|Float|))))
        (SPROG ((|obits| (|Integer|)) (|nbits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((<= (LETT |obits| (SPADCALL (QREFELT % 10)))
                      (QCAR (QREFELT % 8)))
                  (SPADCALL (QCDR (QREFELT % 8)) (|spadConstant| % 7)
                            (QREFELT % 12)))
                 ('T
                  (SEQ (LETT |nbits| (MAX |obits| (* 2 (QCAR (QREFELT % 8)))))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL |nbits| (QREFELT % 13))
                              (PROGN
                               (RPLACD (QREFELT % 8)
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 14)
                                                  (QREFELT % 16))
                                        (QREFELT % 17)))
                               (QCDR (QREFELT % 8)))
                              (PROGN
                               (RPLACA (QREFELT % 8) |nbits|)
                               (QCAR (QREFELT % 8)))
                              (EXIT
                               (SPADCALL (QCDR (QREFELT % 8))
                                         (|spadConstant| % 7) (QREFELT % 12))))
                         (SPADCALL |obits| (QREFELT % 13)))))))))) 

(SDEFUN |FLIOUFUN;erf_series|
        ((|z| #1=(|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z2| (|Complex| (|Float|))) (|i| NIL) (#2=#:G29 NIL)
          (|k1| #3=(|NonNegativeInteger|)) (|term| (|Complex| (|Float|)))
          (|res| (|Complex| (|Float|))) (|k2| #3#) (|tk| #1#))
         (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19))) (LETT |tk| |z|)
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |k1| (+ (* 2 |i|) 1))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (+ |i| 1))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 14)
                                            (SPADCALL |k2| (QREFELT % 22))
                                            (QREFELT % 23))
                                  (QREFELT % 17))
                                 |z2| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL 2 (QREFELT % 22))
                          (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 30))
                          (QREFELT % 23))
                |res| (QREFELT % 27)))))) 

(SDEFUN |FLIOUFUN;erfc_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z2| (|Complex| (|Float|)))
          (|z2_inv| (|Complex| (|Float|))) (|k| NIL)
          (|res| (|Complex| (|Float|))) (|term| (|Complex| (|Float|))))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |term| (|spadConstant| % 26))
              (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19)))
              (LETT |z2_inv|
                    (SPADCALL (|spadConstant| % 26)
                              (SPADCALL (SPADCALL 2 (QREFELT % 22)) |z2|
                                        (QREFELT % 27))
                              (QREFELT % 32)))
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ (* 2 |k|) 1) (QREFELT % 22))
                                  |z2_inv| (QREFELT % 27))
                                 |term| (QREFELT % 19))
                                (QREFELT % 36)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |z2| (QREFELT % 36)) (QREFELT % 37)) |res|
                 (QREFELT % 19))
                (SPADCALL |z|
                          (SPADCALL (SPADCALL (QREFELT % 29)) (QREFELT % 30))
                          (QREFELT % 38))
                (QREFELT % 32)))))) 

(SDEFUN |FLIOUFUN;erf_z|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G41 NIL)
          (#3=#:G40 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 20))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 500)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT % 41)))
                             (LETT |sp|
                                   (SPADCALL |prec|
                                             (SPADCALL
                                              (SPADCALL 694 1000
                                                        (QREFELT % 42))
                                              (QREFELT % 43))
                                             (QREFELT % 45)))
                             (EXIT
                              (COND
                               ((SPADCALL |sp| |dnz| (QREFELT % 46))
                                (PROGN
                                 (LETT #3#
                                       (SEQ
                                        (LETT |npf|
                                              (|add_DF|
                                               (|mul_DF|
                                                (SPADCALL
                                                 (SPADCALL 2000 693
                                                           (QREFELT % 42))
                                                 (QREFELT % 43))
                                                |dnz|)
                                               (FLOAT |prec|
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))
                                        (LETT |np|
                                              (SPADCALL
                                               (SPADCALL |npf| (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (LETT |nf|
                                              (|add_DF|
                                               (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                               |sp|))
                                        (LETT |n|
                                              (SPADCALL
                                               (SPADCALL |nf| (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (SPADCALL |np| (QREFELT % 13))
                                        (LETT |res|
                                              (|FLIOUFUN;erf_series| |z| |n|
                                               %))
                                        (SPADCALL |obits| (QREFELT % 13))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# |res|)
                                          (GO #5=#:G39)))))
                                 (GO #6=#:G36)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |z| (QREFELT % 49))
                                 (|spadConstant| % 7) (QREFELT % 35))
                       (SPADCALL (|spadConstant| % 26)
                                 (|FLIOUFUN;erfc_asymptotic| |z| (+ |obits| 5)
                                  %)
                                 (QREFELT % 50)))
                      (#4#
                       (SPADCALL
                        (|FLIOUFUN;erfc_asymptotic|
                         (SPADCALL |z| (QREFELT % 36)) (+ |obits| 5) %)
                        (|spadConstant| % 26) (QREFELT % 50)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;erf;2C;5|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                    (EXIT
                     (|finally| (|FLIOUFUN;erf_z| |z| %)
                                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;erf;2F;6| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 7) (QREFELT % 12))
                   (QREFELT % 51))
         (QREFELT % 49))) 

(SDEFUN |FLIOUFUN;erfi;2C;7|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL (|spadConstant| % 7)
                   (SPADCALL (|spadConstant| % 14) (QREFELT % 17))
                   (QREFELT % 12))
         (SPADCALL
          (SPADCALL
           (SPADCALL (|spadConstant| % 7) (|spadConstant| % 14) (QREFELT % 12))
           |z| (QREFELT % 19))
          (QREFELT % 51))
         (QREFELT % 19))) 

(SDEFUN |FLIOUFUN;erfi;2F;8| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 12))
                   (QREFELT % 51))
         (QREFELT % 54))) 

(SDEFUN |FLIOUFUN;fresnel_c_series|
        ((|z| #1=(|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z2| #2=(|Complex| (|Float|))) (|z4| #2#) (|i| NIL) (#3=#:G52 NIL)
          (|k1| (|NonNegativeInteger|)) (|term| (|Complex| (|Float|)))
          (|res| (|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|tk| #1#))
         (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19))) (LETT |tk| |z|)
              (LETT |z4| (SPADCALL |z2| |z2| (QREFELT % 19)))
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ (LETT |k1| (+ (* 4 |i|) 1))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (* (+ (* 2 |i|) 1) (+ (* 2 |i|) 2)))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 14)
                                            (SPADCALL |k2| (QREFELT % 22))
                                            (QREFELT % 23))
                                  (QREFELT % 17))
                                 |z4| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;fresnel_c_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z_inv| #1=(|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|z2_inv| #1#) (|k| NIL)
          (|res_s| #2=(|Complex| (|Float|))) (|res_c| #2#)
          (|term| (|Complex| (|Float|))))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |z_inv|
                    (SPADCALL (|spadConstant| % 26) |z| (QREFELT % 32)))
              (LETT |term| (|spadConstant| % 26))
              (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19)))
              (LETT |z2_inv|
                    (SPADCALL (|spadConstant| % 26)
                              (SPADCALL (SPADCALL 2 (QREFELT % 22)) |z2|
                                        (QREFELT % 27))
                              (QREFELT % 32)))
              (LETT |res_c| (|spadConstant| % 20))
              (LETT |res_s| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT % 50)))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (+ (* 4 |k|) 1) (QREFELT % 22))
                                |z2_inv| (QREFELT % 27))
                               |term| (QREFELT % 19)))
                        (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ (* 4 |k|) 3) (QREFELT % 22))
                                  |z2_inv| (QREFELT % 27))
                                 |term| (QREFELT % 19))
                                (QREFELT % 36)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 2 (QREFELT % 42)) (QREFELT % 56))
                 |z_inv| (QREFELT % 27))
                (SPADCALL
                 (SPADCALL (SPADCALL |z2| (QREFELT % 57)) |res_c|
                           (QREFELT % 19))
                 (SPADCALL (SPADCALL |z2| (QREFELT % 58)) |res_s|
                           (QREFELT % 19))
                 (QREFELT % 28))
                (QREFELT % 19)))))) 

(SDEFUN |FLIOUFUN;fresnel_c_z|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G67 NIL)
          (#3=#:G66 NIL) (|pi_fac| (|Float|)) (|re_z| (|Float|))
          (|im_z| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 10))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 500)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT % 41)))
                             (LETT |sp|
                                   (SPADCALL |prec|
                                             (SPADCALL
                                              (SPADCALL 694 1000
                                                        (QREFELT % 42))
                                              (QREFELT % 43))
                                             (QREFELT % 45)))
                             (EXIT
                              (COND
                               ((SPADCALL |sp| |dnz| (QREFELT % 46))
                                (PROGN
                                 (LETT #3#
                                       (SEQ
                                        (LETT |npf|
                                              (|add_DF|
                                               (|mul_DF|
                                                (SPADCALL
                                                 (SPADCALL 2000 693
                                                           (QREFELT % 42))
                                                 (QREFELT % 43))
                                                |dnz|)
                                               (FLOAT |prec|
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))
                                        (LETT |np|
                                              (SPADCALL
                                               (SPADCALL |npf| (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (LETT |nf|
                                              (|add_DF|
                                               (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                               |sp|))
                                        (LETT |n|
                                              (SPADCALL
                                               (SPADCALL
                                                (|div_DF| |nf|
                                                          (FLOAT 2
                                                                 MOST-POSITIVE-DOUBLE-FLOAT))
                                                (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (SPADCALL |np| (QREFELT % 13))
                                        (LETT |res|
                                              (|FLIOUFUN;fresnel_c_series| |z|
                                               |n| %))
                                        (SPADCALL |obits| (QREFELT % 13))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# |res|)
                                          (GO #5=#:G65)))))
                                 (GO #6=#:G59)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (LETT |pi_fac|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT % 29))
                                     (SPADCALL 8 (QREFELT % 22))
                                     (QREFELT % 23))
                           (QREFELT % 30)))
                    (LETT |re_z| (SPADCALL |z| (QREFELT % 49)))
                    (LETT |im_z| (SPADCALL |z| (QREFELT % 54)))
                    (EXIT
                     (COND
                      ((SPADCALL |re_z| (|spadConstant| % 7) (QREFELT % 35))
                       (COND
                        ((SPADCALL |im_z| (|spadConstant| % 7) (QREFELT % 35))
                         (COND
                          ((SPADCALL |re_z| |im_z| (QREFELT % 35))
                           (SPADCALL
                            (SPADCALL |pi_fac| (|spadConstant| % 7)
                                      (QREFELT % 12))
                            (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                            (QREFELT % 50)))
                          (#4#
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 7) |pi_fac|
                                      (QREFELT % 12))
                            (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                            (QREFELT % 50)))))
                        ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT % 17))
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL |pi_fac| (|spadConstant| % 7)
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL |pi_fac| (QREFELT % 17))
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))
                      ((SPADCALL |im_z| (|spadConstant| % 7) (QREFELT % 35))
                       (COND
                        ((SPADCALL (SPADCALL |re_z| (QREFELT % 17)) |im_z|
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL (SPADCALL |pi_fac| (QREFELT % 17))
                                    (|spadConstant| % 7) (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7) |pi_fac|
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))
                      (#4#
                       (COND
                        ((SPADCALL (SPADCALL |re_z| (QREFELT % 17))
                                   (SPADCALL |im_z| (QREFELT % 17))
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL (SPADCALL |pi_fac| (QREFELT % 17))
                                    (|spadConstant| % 7) (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL |pi_fac| (QREFELT % 17))
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_c_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;fresnelC;2C;12|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|pi_fac| (|Float|))
          (|res| (|Complex| (|Float|))))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
              (EXIT
               (|finally|
                (SEQ (SPADCALL (+ |obits| 10) (QREFELT % 13))
                     (LETT |pi_fac|
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT % 29))
                                      (SPADCALL 2 (QREFELT % 22))
                                      (QREFELT % 23))
                            (QREFELT % 30)))
                     (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT % 27)))
                     (LETT |res| (|FLIOUFUN;fresnel_c_z| |z| %))
                     (SPADCALL (+ |obits| 10) (QREFELT % 13))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 14) |pi_fac| (QREFELT % 23))
                       |res| (QREFELT % 27))))
                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;fresnelC;2F;13| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 7) (QREFELT % 12))
                   (QREFELT % 59))
         (QREFELT % 49))) 

(SDEFUN |FLIOUFUN;fresnel_s_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z2| #1=(|Complex| (|Float|))) (|z4| #1#) (|i| NIL) (#2=#:G77 NIL)
          (|k1| (|NonNegativeInteger|)) (|term| (|Complex| (|Float|)))
          (|res| (|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|tk| #1#))
         (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19)))
              (LETT |tk| (SPADCALL |z2| |z| (QREFELT % 19)))
              (LETT |z4| (SPADCALL |z2| |z2| (QREFELT % 19)))
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |k1| (+ (* 4 |i|) 3))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (* (+ (* 2 |i|) 2) (+ (* 2 |i|) 3)))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 14)
                                            (SPADCALL |k2| (QREFELT % 22))
                                            (QREFELT % 23))
                                  (QREFELT % 17))
                                 |z4| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;fresnel_s_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z_inv| #1=(|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|z2_inv| #1#) (|k| NIL)
          (|res_c| #2=(|Complex| (|Float|))) (|res_s| #2#)
          (|term| (|Complex| (|Float|))))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |z_inv|
                    (SPADCALL (|spadConstant| % 26) |z| (QREFELT % 32)))
              (LETT |term| (|spadConstant| % 26))
              (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19)))
              (LETT |z2_inv|
                    (SPADCALL (|spadConstant| % 26)
                              (SPADCALL (SPADCALL 2 (QREFELT % 22)) |z2|
                                        (QREFELT % 27))
                              (QREFELT % 32)))
              (LETT |res_c| (|spadConstant| % 20))
              (LETT |res_s| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT % 28)))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (+ (* 4 |k|) 1) (QREFELT % 22))
                                |z2_inv| (QREFELT % 27))
                               |term| (QREFELT % 19)))
                        (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ (* 4 |k|) 3) (QREFELT % 22))
                                  |z2_inv| (QREFELT % 27))
                                 |term| (QREFELT % 19))
                                (QREFELT % 36)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL 1 2 (QREFELT % 42)) (QREFELT % 56))
                 |z_inv| (QREFELT % 27))
                (SPADCALL
                 (SPADCALL (SPADCALL |z2| (QREFELT % 57)) |res_c|
                           (QREFELT % 19))
                 (SPADCALL (SPADCALL |z2| (QREFELT % 58)) |res_s|
                           (QREFELT % 19))
                 (QREFELT % 28))
                (QREFELT % 19)))))) 

(SDEFUN |FLIOUFUN;fresnel_s_z|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G92 NIL)
          (#3=#:G91 NIL) (|pi_fac| (|Float|)) (|re_z| (|Float|))
          (|im_z| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 10))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 500)
                      (SEQ
                       (EXIT
                        (SEQ (LETT |dnz| (SPADCALL |nz| (QREFELT % 41)))
                             (LETT |sp|
                                   (SPADCALL |prec|
                                             (SPADCALL
                                              (SPADCALL 694 1000
                                                        (QREFELT % 42))
                                              (QREFELT % 43))
                                             (QREFELT % 45)))
                             (EXIT
                              (COND
                               ((SPADCALL |sp| |dnz| (QREFELT % 46))
                                (PROGN
                                 (LETT #3#
                                       (SEQ
                                        (LETT |npf|
                                              (|add_DF|
                                               (|mul_DF|
                                                (SPADCALL
                                                 (SPADCALL 2000 693
                                                           (QREFELT % 42))
                                                 (QREFELT % 43))
                                                |dnz|)
                                               (FLOAT |prec|
                                                      MOST-POSITIVE-DOUBLE-FLOAT)))
                                        (LETT |np|
                                              (SPADCALL
                                               (SPADCALL |npf| (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (LETT |nf|
                                              (|add_DF|
                                               (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                               |sp|))
                                        (LETT |n|
                                              (SPADCALL
                                               (SPADCALL
                                                (|div_DF| |nf|
                                                          (FLOAT 2
                                                                 MOST-POSITIVE-DOUBLE-FLOAT))
                                                (QREFELT % 47))
                                               (QREFELT % 48)))
                                        (SPADCALL |np| (QREFELT % 13))
                                        (LETT |res|
                                              (|FLIOUFUN;fresnel_s_series| |z|
                                               |n| %))
                                        (SPADCALL |obits| (QREFELT % 13))
                                        (EXIT
                                         (PROGN
                                          (LETT #2# |res|)
                                          (GO #5=#:G90)))))
                                 (GO #6=#:G84)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (LETT |pi_fac|
                          (SPADCALL
                           (SPADCALL (SPADCALL (QREFELT % 29))
                                     (SPADCALL 8 (QREFELT % 22))
                                     (QREFELT % 23))
                           (QREFELT % 30)))
                    (LETT |re_z| (SPADCALL |z| (QREFELT % 49)))
                    (LETT |im_z| (SPADCALL |z| (QREFELT % 54)))
                    (EXIT
                     (COND
                      ((SPADCALL |re_z| (|spadConstant| % 7) (QREFELT % 35))
                       (COND
                        ((SPADCALL |im_z| (|spadConstant| % 7) (QREFELT % 35))
                         (COND
                          ((SPADCALL |re_z| |im_z| (QREFELT % 35))
                           (SPADCALL
                            (SPADCALL |pi_fac| (|spadConstant| % 7)
                                      (QREFELT % 12))
                            (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                            (QREFELT % 50)))
                          (#4#
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 7)
                                      (SPADCALL |pi_fac| (QREFELT % 17))
                                      (QREFELT % 12))
                            (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                            (QREFELT % 50)))))
                        ((SPADCALL |re_z| (SPADCALL |im_z| (QREFELT % 17))
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL |pi_fac| (|spadConstant| % 7)
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7) |pi_fac|
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))
                      ((SPADCALL |im_z| (|spadConstant| % 7) (QREFELT % 35))
                       (COND
                        ((SPADCALL (SPADCALL |re_z| (QREFELT % 17)) |im_z|
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL (SPADCALL |pi_fac| (QREFELT % 17))
                                    (|spadConstant| % 7) (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL |pi_fac| (QREFELT % 17))
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))
                      (#4#
                       (COND
                        ((SPADCALL (SPADCALL |re_z| (QREFELT % 17))
                                   (SPADCALL |im_z| (QREFELT % 17))
                                   (QREFELT % 35))
                         (SPADCALL
                          (SPADCALL (SPADCALL |pi_fac| (QREFELT % 17))
                                    (|spadConstant| % 7) (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7) |pi_fac|
                                    (QREFELT % 12))
                          (|FLIOUFUN;fresnel_s_asymptotic| |z| |obits| %)
                          (QREFELT % 50)))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;fresnelS;2C;17|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|pi_fac| (|Float|))
          (|res| (|Complex| (|Float|))))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
              (EXIT
               (|finally|
                (SEQ (SPADCALL (+ |obits| 10) (QREFELT % 13))
                     (LETT |pi_fac|
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT % 29))
                                      (SPADCALL 2 (QREFELT % 22))
                                      (QREFELT % 23))
                            (QREFELT % 30)))
                     (LETT |z| (SPADCALL |pi_fac| |z| (QREFELT % 27)))
                     (LETT |res| (|FLIOUFUN;fresnel_s_z| |z| %))
                     (SPADCALL (+ |obits| 10) (QREFELT % 13))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 14) |pi_fac| (QREFELT % 23))
                       |res| (QREFELT % 27))))
                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;fresnelS;2F;18| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 7) (QREFELT % 12))
                   (QREFELT % 61))
         (QREFELT % 49))) 

(SDEFUN |FLIOUFUN;ei_series|
        ((|z| #1=(|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|i| NIL) (#2=#:G102 NIL) (|k1| #3=(|NonNegativeInteger|))
          (|term| (|Complex| (|Float|))) (|res| (|Complex| (|Float|)))
          (|k2| #3#) (|tk| #1#))
         (SEQ (LETT |tk| |z|) (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |k1| (+ |i| 1))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (+ |i| 2))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 14)
                                           (SPADCALL |k2| (QREFELT % 22))
                                           (QREFELT % 23))
                                 |z| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;ei_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z_inv| #1=(|Complex| (|Float|))) (|k| NIL)
          (|res| (|Complex| (|Float|))) (|term| #1#))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |z_inv|
                    (SPADCALL (|spadConstant| % 26) |z| (QREFELT % 32)))
              (LETT |term| |z_inv|) (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL (SPADCALL (+ |k| 1) (QREFELT % 22))
                                          |z_inv| (QREFELT % 27))
                                |term| (QREFELT % 19)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (SPADCALL |z| (QREFELT % 37)) |res| (QREFELT % 19)))))) 

(SDEFUN |FLIOUFUN;ei_z| ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G116 NIL)
          (#3=#:G115 NIL) (|pii| (|Float|)) (|im_z| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 20))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT % 41))
                                         (QREFELT % 63)))
                         (LETT |sp|
                               (SPADCALL |prec|
                                         (SPADCALL
                                          (SPADCALL 694 1000 (QREFELT % 42))
                                          (QREFELT % 43))
                                         (QREFELT % 45)))
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT % 46))
                            (PROGN
                             (LETT #3#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT % 42))
                                             (QREFELT % 43))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT)))
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|))
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (SPADCALL |np| (QREFELT % 13))
                                    (LETT |res|
                                          (|FLIOUFUN;ei_series| |z| |n| %))
                                    (SPADCALL |obits| (QREFELT % 13))
                                    (EXIT
                                     (PROGN
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (QREFELT % 18))
                                              (SPADCALL |z| (QREFELT % 64))
                                              (QREFELT % 28))
                                             |res| (QREFELT % 28)))
                                      (GO #5=#:G114)))))
                             (GO #6=#:G109)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (LETT |pii| (SPADCALL (QREFELT % 29)))
                    (LETT |im_z| (SPADCALL |z| (QREFELT % 54)))
                    (EXIT
                     (COND
                      ((SPADCALL |im_z| (|spadConstant| % 7) (QREFELT % 65))
                       (COND
                        ((SPADCALL (SPADCALL |z| (QREFELT % 49))
                                   (SPADCALL |im_z| (QREFELT % 17))
                                   (QREFELT % 35))
                         (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) %))
                        (#4#
                         (SPADCALL
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL |pii| (QREFELT % 17))
                                    (QREFELT % 12))
                          (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) %)
                          (QREFELT % 28)))))
                      ((SPADCALL (SPADCALL |z| (QREFELT % 49)) |im_z|
                                 (QREFELT % 35))
                       (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) %))
                      (#4#
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 7) |pii| (QREFELT % 12))
                        (|FLIOUFUN;ei_asymptotic| |z| (+ |obits| 5) %)
                        (QREFELT % 28)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Ei;2C;22|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                    (EXIT
                     (|finally| (|FLIOUFUN;ei_z| |z| %)
                                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;Ei;2F;23| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 7) (QREFELT % 67))
          (|error| "Ei: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 12))
                     (QREFELT % 66))
           (QREFELT % 49))))) 

(SDEFUN |FLIOUFUN;li;2C;24|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)) (|z1| (|Complex| (|Float|))))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL (+ |obits| 5) (QREFELT % 13))
                           (LETT |z1| (SPADCALL |z| (QREFELT % 64)))
                           (EXIT (SPADCALL |z1| (QREFELT % 66))))
                      (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;li;2F;25| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 14) (QREFELT % 67))
          (|error| "li: x <= 1"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 12))
                     (QREFELT % 69))
           (QREFELT % 49))))) 

(SDEFUN |FLIOUFUN;ci_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z2| (|Complex| (|Float|))) (|i| NIL) (#1=#:G129 NIL)
          (|k1| (|NonNegativeInteger|)) (|term| #2=(|Complex| (|Float|)))
          (|res| (|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|tk| #2#))
         (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19)))
              (LETT |tk|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 14)
                                (SPADCALL 2 (QREFELT % 22)) (QREFELT % 23))
                      (QREFELT % 17))
                     |z2| (QREFELT % 27)))
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |k1| (* 2 |i|))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (* (+ (* 2 |i|) 1) (+ (* 2 |i|) 2)))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 14)
                                            (SPADCALL |k2| (QREFELT % 22))
                                            (QREFELT % 23))
                                  (QREFELT % 17))
                                 |z2| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;ci_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z_inv| (|Complex| (|Float|))) (|k| NIL)
          (|res_s| #1=(|Complex| (|Float|))) (|res_c| #1#)
          (|term| (|Complex| (|Float|))))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |z_inv|
                    (SPADCALL (|spadConstant| % 26) |z| (QREFELT % 32)))
              (LETT |term| (|spadConstant| % 26))
              (LETT |res_c| (|spadConstant| % 20))
              (LETT |res_s| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT % 28)))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (+ (* 2 |k|) 1) (QREFELT % 22))
                                 |z_inv| (QREFELT % 27))
                                |term| (QREFELT % 19))
                               (QREFELT % 36)))
                        (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (+ (* 2 |k|) 2) (QREFELT % 22))
                                 |z_inv| (QREFELT % 27))
                                |term| (QREFELT % 19)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z_inv|
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 57)) |res_c|
                                    (QREFELT % 19))
                          (SPADCALL (SPADCALL |z| (QREFELT % 58)) |res_s|
                                    (QREFELT % 19))
                          (QREFELT % 28))
                         (QREFELT % 19)))))) 

(SDEFUN |FLIOUFUN;ci_z| ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G142 NIL)
          (#3=#:G141 NIL) (|pi_fac| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 20))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT % 41))
                                         (QREFELT % 63)))
                         (LETT |sp|
                               (SPADCALL |prec|
                                         (SPADCALL
                                          (SPADCALL 694 1000 (QREFELT % 42))
                                          (QREFELT % 43))
                                         (QREFELT % 45)))
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT % 46))
                            (PROGN
                             (LETT #3#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT % 42))
                                             (QREFELT % 43))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT)))
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|))
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (SPADCALL |np| (QREFELT % 13))
                                    (LETT |res|
                                          (|FLIOUFUN;ci_series| |z| |n| %))
                                    (SPADCALL |obits| (QREFELT % 13))
                                    (EXIT
                                     (PROGN
                                      (LETT #2#
                                            (SPADCALL
                                             (SPADCALL |res|
                                                       (SPADCALL
                                                        (QREFELT % 18))
                                                       (QREFELT % 28))
                                             (SPADCALL |z| (QREFELT % 64))
                                             (QREFELT % 28)))
                                      (GO #5=#:G140)))))
                             (GO #6=#:G136)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |z| (QREFELT % 49))
                                 (|spadConstant| % 7) (QREFELT % 35))
                       (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) %))
                      (#4#
                       (SEQ (LETT |pi_fac| (SPADCALL (QREFELT % 29)))
                            (EXIT
                             (COND
                              ((SPADCALL (SPADCALL |z| (QREFELT % 54))
                                         (|spadConstant| % 7) (QREFELT % 65))
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 7)
                                          (SPADCALL |pi_fac| (QREFELT % 17))
                                          (QREFELT % 12))
                                (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) %)
                                (QREFELT % 28)))
                              (#4#
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 7) |pi_fac|
                                          (QREFELT % 12))
                                (|FLIOUFUN;ci_asymptotic| |z| (+ |obits| 5) %)
                                (QREFELT % 28)))))))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Ci;2C;29|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                    (EXIT
                     (|finally| (|FLIOUFUN;ci_z| |z| %)
                                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;Ci;2F;30| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 7) (QREFELT % 67))
          (|error| "Ci: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 12))
                     (QREFELT % 71))
           (QREFELT % 49))))) 

(SDEFUN |FLIOUFUN;Chi;2C;31|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL
            (SPADCALL (|spadConstant| % 7) (|spadConstant| % 14)
                      (QREFELT % 12))
            |z| (QREFELT % 19))
           (QREFELT % 71))
          (SPADCALL |z| (QREFELT % 64)) (QREFELT % 28))
         (SPADCALL
          (SPADCALL
           (SPADCALL (|spadConstant| % 7) (|spadConstant| % 14) (QREFELT % 12))
           |z| (QREFELT % 19))
          (QREFELT % 64))
         (QREFELT % 50))) 

(SDEFUN |FLIOUFUN;Chi;2F;32| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 7) (QREFELT % 67))
          (|error| "Chi: x <= 0"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 12))
                     (QREFELT % 73))
           (QREFELT % 49))))) 

(SDEFUN |FLIOUFUN;si_series|
        ((|z| #1=(|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z2| (|Complex| (|Float|))) (|i| NIL) (#2=#:G153 NIL)
          (|k1| (|NonNegativeInteger|)) (|term| (|Complex| (|Float|)))
          (|res| (|Complex| (|Float|))) (|k2| (|NonNegativeInteger|))
          (|tk| #1#))
         (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 19))) (LETT |tk| |z|)
              (LETT |res| (|spadConstant| % 20))
              (SEQ (LETT |i| 0) (LETT #2# |n|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ (LETT |k1| (+ (* 2 |i|) 1))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 14)
                                         (SPADCALL |k1| (QREFELT % 22))
                                         (QREFELT % 23))
                               |tk| (QREFELT % 27)))
                        (LETT |res| (SPADCALL |res| |term| (QREFELT % 28)))
                        (LETT |k2| (* (+ (* 2 |i|) 2) (+ (* 2 |i|) 3)))
                        (EXIT
                         (LETT |tk|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 14)
                                            (SPADCALL |k2| (QREFELT % 22))
                                            (QREFELT % 23))
                                  (QREFELT % 17))
                                 |z2| (QREFELT % 27))
                                |tk| (QREFELT % 19)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FLIOUFUN;si_asymptotic|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|eps| (|Float|)) (|z_inv| (|Complex| (|Float|))) (|k| NIL)
          (|res_c| #1=(|Complex| (|Float|))) (|res_s| #1#)
          (|term| (|Complex| (|Float|))))
         (SEQ (LETT |eps| (SPADCALL 1 (- (* 2 |prec|)) 2 (QREFELT % 31)))
              (LETT |z_inv|
                    (SPADCALL (|spadConstant| % 26) |z| (QREFELT % 32)))
              (LETT |term| (|spadConstant| % 26))
              (LETT |res_c| (|spadConstant| % 20))
              (LETT |res_s| (|spadConstant| % 20))
              (SEQ (LETT |k| 0) G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |term| (QREFELT % 33)) |eps|
                                (QREFELT % 35)))
                     (GO G191)))
                   (SEQ (LETT |res_c| (SPADCALL |res_c| |term| (QREFELT % 28)))
                        (LETT |term|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (+ (* 2 |k|) 1) (QREFELT % 22))
                                |z_inv| (QREFELT % 27))
                               |term| (QREFELT % 19)))
                        (LETT |res_s| (SPADCALL |res_s| |term| (QREFELT % 28)))
                        (EXIT
                         (LETT |term|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (+ (* 2 |k|) 2) (QREFELT % 22))
                                  |z_inv| (QREFELT % 27))
                                 |term| (QREFELT % 19))
                                (QREFELT % 36)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z_inv|
                         (SPADCALL
                          (SPADCALL (SPADCALL |z| (QREFELT % 57)) |res_c|
                                    (QREFELT % 19))
                          (SPADCALL (SPADCALL |z| (QREFELT % 58)) |res_s|
                                    (QREFELT % 19))
                          (QREFELT % 28))
                         (QREFELT % 19)))))) 

(SDEFUN |FLIOUFUN;si_z| ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nz| (|Float|))
          (|prec| (|PositiveInteger|)) (|oz| (|Integer|))
          (|dnz| (|DoubleFloat|)) (|sp| (|DoubleFloat|))
          (|npf| #1=(|DoubleFloat|)) (|np| (|PositiveInteger|)) (|nf| #1#)
          (|n| (|Integer|)) (|res| (|Complex| (|Float|))) (#2=#:G165 NIL)
          (#3=#:G164 NIL) (|pi_fac| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                (LETT |nz| (SPADCALL |z| (QREFELT % 33)))
                (LETT |prec| (+ |obits| 20))
                (LETT |oz| (SPADCALL |nz| (QREFELT % 39)))
                (EXIT
                 (COND
                  ((> (INTEGER-LENGTH |prec|) 500)
                   (|error| "requested too high precision"))
                  (#4='T
                   (SEQ
                    (COND
                     ((< |oz| 1000)
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |dnz|
                               (SPADCALL (SPADCALL |nz| (QREFELT % 41))
                                         (QREFELT % 63)))
                         (LETT |sp|
                               (SPADCALL |prec|
                                         (SPADCALL
                                          (SPADCALL 694 1000 (QREFELT % 42))
                                          (QREFELT % 43))
                                         (QREFELT % 45)))
                         (EXIT
                          (COND
                           ((SPADCALL |sp| |dnz| (QREFELT % 46))
                            (PROGN
                             (LETT #3#
                                   (SEQ
                                    (LETT |npf|
                                          (|add_DF|
                                           (|mul_DF|
                                            (SPADCALL
                                             (SPADCALL 2000 693 (QREFELT % 42))
                                             (QREFELT % 43))
                                            |dnz|)
                                           (FLOAT |prec|
                                                  MOST-POSITIVE-DOUBLE-FLOAT)))
                                    (LETT |np|
                                          (SPADCALL
                                           (SPADCALL |npf| (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (LETT |nf|
                                          (|add_DF|
                                           (|mul_DF| (|exp_DF| 1.0) |dnz|)
                                           |sp|))
                                    (LETT |n|
                                          (SPADCALL
                                           (SPADCALL
                                            (|div_DF| |nf|
                                                      (FLOAT 2
                                                             MOST-POSITIVE-DOUBLE-FLOAT))
                                            (QREFELT % 47))
                                           (QREFELT % 48)))
                                    (SPADCALL |np| (QREFELT % 13))
                                    (LETT |res|
                                          (|FLIOUFUN;si_series| |z| |n| %))
                                    (SPADCALL |obits| (QREFELT % 13))
                                    (EXIT
                                     (PROGN (LETT #2# |res|) (GO #5=#:G163)))))
                             (GO #6=#:G160)))))))
                       #6# (EXIT #3#))))
                    (SPADCALL |prec| (QREFELT % 13))
                    (LETT |pi_fac|
                          (SPADCALL (SPADCALL (QREFELT % 29))
                                    (SPADCALL 2 (QREFELT % 22))
                                    (QREFELT % 23)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |z| (QREFELT % 49))
                                 (|spadConstant| % 7) (QREFELT % 35))
                       (SPADCALL
                        (SPADCALL |pi_fac| (|spadConstant| % 7) (QREFELT % 12))
                        (|FLIOUFUN;si_asymptotic| |z| (+ |obits| 5) %)
                        (QREFELT % 50)))
                      (#4#
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL |pi_fac| (|spadConstant| % 7)
                                   (QREFELT % 12))
                         (|FLIOUFUN;si_asymptotic|
                          (SPADCALL |z| (QREFELT % 36)) (+ |obits| 5) %)
                         (QREFELT % 50))
                        (QREFELT % 36)))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |FLIOUFUN;Si;2C;36|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 10)))
                    (EXIT
                     (|finally| (|FLIOUFUN;si_z| |z| %)
                                (SPADCALL |obits| (QREFELT % 13))))))) 

(SDEFUN |FLIOUFUN;Si;2F;37| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 7) (QREFELT % 12))
                   (QREFELT % 75))
         (QREFELT % 49))) 

(SDEFUN |FLIOUFUN;Shi;2C;38|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|spadConstant| % 7) (|spadConstant| % 14) (QREFELT % 12))
          (SPADCALL
           (SPADCALL
            (SPADCALL (|spadConstant| % 7) (|spadConstant| % 14)
                      (QREFELT % 12))
            |z| (QREFELT % 19))
           (QREFELT % 75))
          (QREFELT % 19))
         (QREFELT % 36))) 

(SDEFUN |FLIOUFUN;Shi;2F;39| ((|x| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 12))
                   (QREFELT % 77))
         (QREFELT % 49))) 

(DECLAIM (NOTINLINE |FloatLiouvilianFunctions;|)) 

(DEFUN |FloatLiouvilianFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatLiouvilianFunctions|))
          (LETT % (GETREFV 79))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatLiouvilianFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 (CONS -1 (|spadConstant| % 7)))
          %))) 

(DEFUN |FloatLiouvilianFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G172)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatLiouvilianFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatLiouvilianFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatLiouvilianFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|FloatLiouvilianFunctions|)))))))))) 

(MAKEPROP '|FloatLiouvilianFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |0|) 'G
              (|PositiveInteger|) (4 . |bits|) (|Complex| 6) (8 . |complex|)
              (14 . |bits|) (19 . |1|) (|FloatSpecialFunctions|)
              (23 . |digamma|) (28 . -) |FLIOUFUN;gamma;C;1| (33 . *)
              (39 . |0|) (|Integer|) (43 . |coerce|) (48 . /) (|Fraction| 21)
              (54 . |1|) (58 . |1|) (62 . *) (68 . +) (74 . |pi|) (78 . |sqrt|)
              (83 . |float|) (90 . /) (96 . |norm|) (|Boolean|) (101 . >)
              (107 . -) (112 . |exp|) (117 . *) (123 . |order|) (|DoubleFloat|)
              (128 . |coerce|) (133 . /) (139 . |coerce|)
              (|NonNegativeInteger|) (144 . *) (150 . >) (156 . |round|)
              (161 . |retract|) (166 . |real|) (171 . -) |FLIOUFUN;erf;2C;5|
              |FLIOUFUN;erf;2F;6| |FLIOUFUN;erfi;2C;7| (177 . |imag|)
              |FLIOUFUN;erfi;2F;8| (182 . |coerce|) (187 . |cos|) (192 . |sin|)
              |FLIOUFUN;fresnelC;2C;12| |FLIOUFUN;fresnelC;2F;13|
              |FLIOUFUN;fresnelS;2C;17| |FLIOUFUN;fresnelS;2F;18|
              (197 . |sqrt|) (202 . |log|) (207 . <) |FLIOUFUN;Ei;2C;22|
              (213 . <=) |FLIOUFUN;Ei;2F;23| |FLIOUFUN;li;2C;24|
              |FLIOUFUN;li;2F;25| |FLIOUFUN;Ci;2C;29| |FLIOUFUN;Ci;2F;30|
              |FLIOUFUN;Chi;2C;31| |FLIOUFUN;Chi;2F;32| |FLIOUFUN;Si;2C;36|
              |FLIOUFUN;Si;2F;37| |FLIOUFUN;Shi;2C;38| |FLIOUFUN;Shi;2F;39|)
           '#(|li| 219 |gamma| 229 |fresnelS| 233 |fresnelC| 243 |erfi| 253
              |erf| 263 |Si| 273 |Shi| 283 |Ei| 293 |Ci| 303 |Chi| 313)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|gamma| ((|Complex| (|Float|)))) T)
                                   '((|erf| ((|Float|) (|Float|))) T)
                                   '((|erf|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|erfi| ((|Float|) (|Float|))) T)
                                   '((|erfi|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|fresnelC| ((|Float|) (|Float|))) T)
                                   '((|fresnelC|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|fresnelS| ((|Float|) (|Float|))) T)
                                   '((|fresnelS|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Ei| ((|Float|) (|Float|))) T)
                                   '((|Ei|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|li| ((|Float|) (|Float|))) T)
                                   '((|li|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Ci| ((|Float|) (|Float|))) T)
                                   '((|Ci|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Si| ((|Float|) (|Float|))) T)
                                   '((|Si|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Chi| ((|Float|) (|Float|))) T)
                                   '((|Chi|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Shi| ((|Float|) (|Float|))) T)
                                   '((|Shi|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 78
                                            '(0 6 0 7 0 6 9 10 2 11 0 6 6 12 1
                                              6 9 9 13 0 6 0 14 1 15 6 6 16 1 6
                                              0 0 17 2 11 0 0 0 19 0 11 0 20 1
                                              6 0 21 22 2 6 0 0 0 23 0 24 0 25
                                              0 11 0 26 2 11 0 6 0 27 2 11 0 0
                                              0 28 0 6 0 29 1 6 0 0 30 3 6 0 21
                                              21 9 31 2 11 0 0 0 32 1 11 6 0 33
                                              2 6 34 0 0 35 1 11 0 0 36 1 11 0
                                              0 37 2 11 0 0 6 38 1 6 21 0 39 1
                                              6 40 0 41 2 24 0 21 21 42 1 40 0
                                              24 43 2 40 0 44 0 45 2 40 34 0 0
                                              46 1 40 0 0 47 1 40 21 0 48 1 11
                                              6 0 49 2 11 0 0 0 50 1 11 6 0 54
                                              1 6 0 24 56 1 11 0 0 57 1 11 0 0
                                              58 1 40 0 0 63 1 11 0 0 64 2 6 34
                                              0 0 65 2 6 34 0 0 67 1 0 11 11 69
                                              1 0 6 6 70 0 0 11 18 1 0 11 11 61
                                              1 0 6 6 62 1 0 6 6 60 1 0 11 11
                                              59 1 0 6 6 55 1 0 11 11 53 1 0 11
                                              11 51 1 0 6 6 52 1 0 11 11 75 1 0
                                              6 6 76 1 0 6 6 78 1 0 11 11 77 1
                                              0 11 11 66 1 0 6 6 68 1 0 6 6 72
                                              1 0 11 11 71 1 0 11 11 73 1 0 6 6
                                              74)))))
           '|lookupComplete|)) 
