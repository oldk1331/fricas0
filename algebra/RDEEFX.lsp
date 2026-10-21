
(SDEFUN |RDEEFX;top_kernel|
        ((|f| (F)) (|g| (F)) (|x| (|Symbol|)) (% (|Kernel| F)))
        (SPROG
         ((|lkf| (|List| (|Kernel| F))) (|lk| (|List| (|Kernel| F))) (|k| NIL)
          (#1=#:G229 NIL) (|hk| #2=(|NonNegativeInteger|)) (|htk| #2#)
          (#3=#:G228 NIL) (|tk| (|Kernel| F)) (|extra_tk| (|Boolean|)))
         (SEQ
          (LETT |lkf|
                (SPADCALL (SPADCALL |f| (QREFELT % 11)) |x| (QREFELT % 15)))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |g| (QREFELT % 11)) |x| (QREFELT % 15))
                 |lkf| (QREFELT % 16)))
          (LETT |tk| (|SPADfirst| |lk|))
          (LETT |htk| (SPADCALL |tk| (QREFELT % 19)))
          (LETT |extra_tk| (NULL (SPADCALL |tk| |lkf| (QREFELT % 21))))
          (SEQ (LETT |k| NIL) (LETT #1# (CDR |lk|)) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |hk| (SPADCALL |k| (QREFELT % 19)))
                      (EXIT
                       (COND
                        ((> |hk| |htk|)
                         (SEQ (LETT |tk| |k|) (LETT |htk| |hk|)
                              (EXIT
                               (LETT |extra_tk|
                                     (NULL
                                      (SPADCALL |tk| |lkf| (QREFELT % 21)))))))
                        ((< |hk| |htk|)
                         (PROGN (LETT #3# |$NoValue|) (GO #4=#:G201)))
                        ('T
                         (SEQ
                          (COND
                           ((SPADCALL |tk| '|exp| (QREFELT % 22))
                            (COND
                             (|extra_tk|
                              (EXIT (PROGN (LETT #3# |$NoValue|) (GO #4#)))))))
                          (COND
                           ((SPADCALL |k| '|exp| (QREFELT % 22))
                            (COND
                             ((NULL (SPADCALL |k| |lkf| (QREFELT % 21)))
                              (EXIT
                               (SEQ (LETT |tk| |k|)
                                    (EXIT (LETT |extra_tk| 'T))))))))
                          (EXIT
                           (COND
                            ((SPADCALL |tk| '|exp| (QREFELT % 22))
                             (PROGN (LETT #3# |$NoValue|) (GO #4#)))
                            ((SPADCALL |k| '|exp| (QREFELT % 22))
                             (SEQ (LETT |tk| |k|)
                                  (EXIT (LETT |extra_tk| NIL))))
                            ('T
                             (SEQ
                              (COND
                               ((SPADCALL |tk| '|log| (QREFELT % 22))
                                (COND
                                 (|extra_tk|
                                  (EXIT
                                   (PROGN (LETT #3# |$NoValue|) (GO #4#)))))))
                              (COND
                               ((SPADCALL |k| '|log| (QREFELT % 22))
                                (COND
                                 ((NULL (SPADCALL |k| |lkf| (QREFELT % 21)))
                                  (EXIT
                                   (SEQ (LETT |tk| |k|)
                                        (EXIT (LETT |extra_tk| 'T))))))))
                              (EXIT
                               (COND
                                ((SPADCALL |tk| '|log| (QREFELT % 22))
                                 (PROGN (LETT #3# |$NoValue|) (GO #4#)))
                                ((SPADCALL |k| '|log| (QREFELT % 22))
                                 (SEQ (LETT |tk| |k|)
                                      (EXIT (LETT |extra_tk| NIL))))
                                ((SPADCALL (SPADCALL |tk| (QREFELT % 24))
                                           (QREFELT % 8) (QREFELT % 25))
                                 (COND
                                  ((SPADCALL (SPADCALL |k| (QREFELT % 24))
                                             (QREFELT % 8) (QREFELT % 25))
                                   (COND
                                    (|extra_tk|
                                     (PROGN (LETT #3# |$NoValue|) (GO #4#)))
                                    ((NULL (SPADCALL |k| |lkf| (QREFELT % 21)))
                                     (SEQ (LETT |tk| |k|)
                                          (EXIT (LETT |extra_tk| 'T))))))
                                  ('T
                                   (SEQ (LETT |tk| |k|)
                                        (EXIT
                                         (LETT |extra_tk|
                                               (NULL
                                                (SPADCALL |k| |lkf|
                                                          (QREFELT %
                                                                   21)))))))))))))))))))))
                #4# (EXIT #3#))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |tk|)))) 

(SDEFUN |RDEEFX;genus0_if_can|
        ((|k| (|Kernel| F)) (|kx| (|Kernel| F))
         (%
          (|Union|
           (|Record|
            (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |exponent| (|NonNegativeInteger|)))
           "failed")))
        (SPROG
         ((|args| (|List| F)) (#1=#:G235 NIL) (|n| (|NonNegativeInteger|))
          (|r1| (F)) (|r1rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|nrf| (|SparseUnivariatePolynomial| F))
          (|drf| (|SparseUnivariatePolynomial| F)) (|a| (F)) (|b| (F))
          (|c| (F)) (|d| (F))
          (|c1| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (COND
           ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 22))) (CONS 1 "failed"))
           ('T
            (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 27)))
                 (LETT |n|
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |args| 2 (QREFELT % 29))
                                           (QREFELT % 30)))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#)))
                 (LETT |r1| (SPADCALL |args| 1 (QREFELT % 29)))
                 (LETT |r1rf| (SPADCALL |r1| |kx| (QREFELT % 35)))
                 (LETT |nrf| (SPADCALL |r1rf| (QREFELT % 38)))
                 (LETT |drf| (SPADCALL |r1rf| (QREFELT % 39)))
                 (COND
                  ((OR (> (SPADCALL |nrf| (QREFELT % 40)) 1)
                       (> (SPADCALL |drf| (QREFELT % 40)) 1))
                   (EXIT (CONS 1 "failed"))))
                 (LETT |a| (SPADCALL |nrf| 1 (QREFELT % 41)))
                 (LETT |b| (SPADCALL |nrf| 0 (QREFELT % 41)))
                 (LETT |c| (SPADCALL |drf| 1 (QREFELT % 41)))
                 (LETT |d| (SPADCALL |drf| 0 (QREFELT % 41)))
                 (LETT |c1|
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |d| |n| (QREFELT % 43))
                                   (SPADCALL |b| (QREFELT % 44))
                                   (QREFELT % 45))
                         (QREFELT % 46))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |c| (QREFELT % 47)) |n|
                                    (QREFELT % 43))
                          (SPADCALL |a| (QREFELT % 44)) (QREFELT % 48))
                         (QREFELT % 46))
                        (QREFELT % 49)))
                 (EXIT (CONS 0 (VECTOR |c1| |r1rf| |n|))))))))) 

(SDEFUN |RDEEFX;ei_int_alg|
        ((|f| (F)) (|g| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F)))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|kx| (|Kernel| F))
          (|cvu|
           (|Union|
            (|Record|
             (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
             (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|cv|
           (|Record|
            (|:| |coef1| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |coef2| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |exponent| (|NonNegativeInteger|))))
          (|nx| (|Symbol|)) (|nxk| (|Kernel| F)) (|fx| (F)) (|fy| (F))
          (|dfx| (F)) (|ng| (F)) (|nf| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|kf| (F)) (|r1| (F)) (|a1| (F)) (|ansp| (F)))
         (SEQ (LETT |kx| (SPADCALL |lk| (QREFELT % 50)))
              (COND
               ((NULL (QEQCAR (SPADCALL |kx| (QREFELT % 52)) 0))
                (EXIT (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT % 55)))))
              (LETT |cvu| (|RDEEFX;genus0_if_can| |k| |kx| %))
              (EXIT
               (COND
                ((QEQCAR |cvu| 1)
                 (SPADCALL |f| |g| |x| (CONS |k| |lk|) (QREFELT % 55)))
                ('T
                 (SEQ (LETT |cv| (QCDR |cvu|))
                      (LETT |nx| (SPADCALL (QREFELT % 56)))
                      (LETT |nxk| (SPADCALL |nx| (QREFELT % 57)))
                      (LETT |fx|
                            (SPADCALL (QVELT |cv| 0) |nxk| (QREFELT % 59)))
                      (LETT |fy| (SPADCALL |nxk| (QREFELT % 60)))
                      (LETT |dfx| (SPADCALL |fx| |nx| (QREFELT % 61)))
                      (LETT |ng|
                            (SPADCALL |dfx|
                                      (SPADCALL |g| (LIST |kx| |k|)
                                                (LIST |fx| |fy|)
                                                (QREFELT % 63))
                                      (QREFELT % 64)))
                      (LETT |nf|
                            (SPADCALL |f| (LIST |kx| |k|) (LIST |fx| |fy|)
                                      (QREFELT % 63)))
                      (LETT |res1| (SPADCALL 1 |nf| |ng| |nx| (QREFELT % 65)))
                      (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
                      (LETT |r1|
                            (SPADCALL
                             (SPADCALL (QVELT |res1| 1) |dfx| (QREFELT % 66))
                             |nxk| |kf| (QREFELT % 67)))
                      (LETT |a1|
                            (SPADCALL (QVELT |res1| 0) |nxk| |kf|
                                      (QREFELT % 67)))
                      (LETT |ansp|
                            (SPADCALL (QVELT |res1| 2) |nxk| |kf|
                                      (QREFELT % 67)))
                      (EXIT (VECTOR |a1| |r1| |ansp| (QVELT |res1| 3)))))))))) 

(SDEFUN |RDEEFX;UP_to_UPUP|
        ((|p| (|SparseUnivariatePolynomial| F))
         (% (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (ELT % 44) |p| (QREFELT % 71))) 

(SDEFUN |RDEEFX;get_uv0|
        ((|tt| (F)) (|coeffs| (|List| (|Integer|))) (|vlst| (|List| F))
         (|ulst| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|Record| (|:| |u_part| F) (|:| |v_part| F)
                    (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))))
        (SPROG
         ((#1=#:G275 NIL) (#2=#:G277 NIL) (#3=#:G276 NIL) (|v0| (F))
          (#4=#:G279 NIL) (#5=#:G278 NIL) (|ku| #6=(|Integer|)) (#7=#:G280 NIL)
          (#8=#:G282 NIL) (|ui| NIL) (#9=#:G281 NIL) (|u| (F)) (|kf| (F))
          (|ki| NIL) (#10=#:G284 NIL) (|vi| NIL) (#11=#:G283 NIL) (|kc| #6#))
         (SEQ
          (LETT |v0|
                (SPADCALL |tt|
                          (SPADCALL (ELT % 72)
                                    (PROGN
                                     (LETT #1# NIL)
                                     (SEQ (LETT |ki| NIL) (LETT #2# |coeffs|)
                                          (LETT |vi| NIL) (LETT #3# |vlst|)
                                          G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |vi| (CAR #3#))
                                                 NIL)
                                                (ATOM #2#)
                                                (PROGN
                                                 (LETT |ki| (CAR #2#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #1#
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |ki|
                                                              (QREFELT % 73))
                                                    |vi| (QREFELT % 64))
                                                   #1#))))
                                          (LETT #3#
                                                (PROG1 (CDR #3#)
                                                  (LETT #2# (CDR #2#))))
                                          (GO G190) G191
                                          (EXIT (NREVERSE #1#))))
                                    (|spadConstant| % 74) (QREFELT % 76))
                          (QREFELT % 77)))
          (LETT |ku| 0) (LETT |u| (|spadConstant| % 32))
          (COND
           ((SPADCALL |k| '|exp| (QREFELT % 22))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
                 (EXIT
                  (SEQ (LETT |ki| NIL) (LETT #4# |coeffs|) (LETT |ui| NIL)
                       (LETT #5# |ulst|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |ui| (CAR #5#)) NIL)
                             (ATOM #4#) (PROGN (LETT |ki| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |ui| |kf| (QREFELT % 78))
                           (LETT |ku| |ki|))
                          ('T
                           (LETT |u|
                                 (SPADCALL |u|
                                           (SPADCALL |ui| |ki| (QREFELT % 79))
                                           (QREFELT % 64)))))))
                       (LETT #5# (PROG1 (CDR #5#) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (LETT |u|
                  (SPADCALL (ELT % 64)
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |ki| NIL) (LETT #8# |coeffs|)
                                  (LETT |ui| NIL) (LETT #9# |ulst|) G190
                                  (COND
                                   ((OR (ATOM #9#)
                                        (PROGN (LETT |ui| (CAR #9#)) NIL)
                                        (ATOM #8#)
                                        (PROGN (LETT |ki| (CAR #8#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (SPADCALL |ui| |ki| (QREFELT % 79))
                                           #7#))))
                                  (LETT #9#
                                        (PROG1 (CDR #9#) (LETT #8# (CDR #8#))))
                                  (GO G190) G191 (EXIT (NREVERSE #7#))))
                            (|spadConstant| % 32) (QREFELT % 76)))))
          (LETT |kc| 0)
          (COND
           ((SPADCALL |k| '|log| (QREFELT % 22))
            (SEQ (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
                 (EXIT
                  (SEQ (LETT |ki| NIL) (LETT #10# |coeffs|) (LETT |vi| NIL)
                       (LETT #11# |vlst|) G190
                       (COND
                        ((OR (ATOM #11#) (PROGN (LETT |vi| (CAR #11#)) NIL)
                             (ATOM #10#) (PROGN (LETT |ki| (CAR #10#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |vi| |kf| (QREFELT % 78))
                           (LETT |kc| |ki|)))))
                       (LETT #11# (PROG1 (CDR #11#) (LETT #10# (CDR #10#))))
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT (VECTOR |u| |v0| |ku| |kc|))))) 

(SDEFUN |RDEEFX;get_uv|
        ((|tt| (F)) (|vlst| (|List| F)) (|ulst| (|List| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|))
         (%
          (|Union|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
           "failed")))
        (SPROG
         ((#1=#:G301 NIL) (|vi| NIL) (#2=#:G302 NIL) (|dvvec| (|Vector| F))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|cd|
           (|Record| (|:| |num| (|List| (|Integer|)))
                     (|:| |den| #3=(|Integer|))))
          (|d| #3#))
         (SEQ
          (LETT |dvvec|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |vi| NIL) (LETT #2# |vlst|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |vi| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS (SPADCALL |vi| |x| (QREFELT % 61)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 81)))
          (LETT |su|
                (SPADCALL |dvvec| (SPADCALL |tt| |x| (QREFELT % 61))
                          (QREFELT % 84)))
          (EXIT
           (COND ((QEQCAR |su| 1) (CONS 1 "failed"))
                 (#4='T
                  (SEQ (LETT |sv| (QCDR |su|))
                       (LETT |cd| (SPADCALL |sv| (QREFELT % 88)))
                       (LETT |d| (QCDR |cd|))
                       (EXIT
                        (COND
                         ((SPADCALL |d| 1 (QREFELT % 89)) (CONS 1 "failed"))
                         (#4#
                          (CONS 0
                                (|RDEEFX;get_uv0| |tt| (QCAR |cd|) |vlst|
                                 |ulst| |k| |x| %)))))))))))) 

(SDEFUN |RDEEFX;handle_factor|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|f1| (|SparseUnivariatePolynomial| F)) (|r0| (|Integer|)) (|u0| (F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|)) (|known_dividing| (|Boolean|))
         (%
          (|Union|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F))
           "failed")))
        (SPROG
         ((|deg1| (|NonNegativeInteger|))
          (|f2| #1=(|SparseUnivariatePolynomial| F))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|u_exp| (|Integer|)) (|v0| (F)) (|tt| (F)) (|u| (F))
          (|tt1| #2=(|SparseUnivariatePolynomial| F)) (|f2pp| #1#) (|ff| #2#)
          (|ff2| #3=(|SparseUnivariatePolynomial| F)) (#4=#:G316 NIL)
          (|ff3| (|SparseUnivariatePolynomial| F)) (#5=#:G327 NIL) (|ff1| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |deg1| (SPADCALL |f1| (QREFELT % 40)))
                (LETT |tt|
                      (SPADCALL
                       (SPADCALL (SPADCALL |f1| (- |deg1| 1) (QREFELT % 41))
                                 (SPADCALL (SPADCALL |deg1| (QREFELT % 73))
                                           (SPADCALL |f1| |deg1|
                                                     (QREFELT % 41))
                                           (QREFELT % 64))
                                 (QREFELT % 66))
                       (QREFELT % 47)))
                (LETT |f2|
                      (SPADCALL |f1| (QREFELT % 92)
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 32) 1
                                           (QREFELT % 43))
                                 (SPADCALL |tt| (QREFELT % 44)) (QREFELT % 48))
                                (QREFELT % 93)))
                (COND
                 ((NULL
                   (SPADCALL (CONS #'|RDEEFX;handle_factor!0| (VECTOR % |x|))
                             (SPADCALL |f2| (QREFELT % 94)) (QREFELT % 96)))
                  (EXIT (PROGN (LETT #5# (CONS 1 "failed")) (GO #6=#:G326)))))
                (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| %))
                (EXIT
                 (COND
                  ((QEQCAR |uvu| 1)
                   (PROGN (LETT #5# (CONS 1 "failed")) (GO #6#)))
                  (#7='T
                   (SEQ (LETT |uv| (QCDR |uvu|)) (LETT |u| (QVELT |uv| 0))
                        (LETT |u_exp| (QVELT |uv| 2))
                        (LETT |v0| (QVELT |uv| 1))
                        (COND
                         ((EQL |r0| 0)
                          (SEQ (LETT |r0| (QVELT |uv| 3))
                               (EXIT
                                (LETT |tt|
                                      (SPADCALL |tt|
                                                (SPADCALL
                                                 (SPADCALL |r0| (QREFELT % 73))
                                                 (SPADCALL |k| (QREFELT % 60))
                                                 (QREFELT % 64))
                                                (QREFELT % 77))))))
                         (#7#
                          (LETT |u|
                                (SPADCALL (SPADCALL |u0| |r0| (QREFELT % 79))
                                          |u| (QREFELT % 64)))))
                        (LETT |tt1|
                              (SPADCALL
                               (SPADCALL (SPADCALL |r0| (QREFELT % 73)) 1
                                         (QREFELT % 43))
                               (SPADCALL |tt| (QREFELT % 44)) (QREFELT % 48)))
                        (LETT |ff|
                              (SPADCALL |nf|
                                        (SPADCALL |tt1| |denf| (QREFELT % 97))
                                        (QREFELT % 48)))
                        (COND
                         ((> |deg1| 1)
                          (LETT |ff|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |denf| 1 (QREFELT % 98))
                                           (SPADCALL |ff| (QREFELT % 99))
                                           (QREFELT % 100))
                                 (|RDEEFX;UP_to_UPUP| |f2| %)
                                 (QREFELT % 101)))))
                        (LETT |f2pp|
                              (COND ((EQL |deg1| 1) (|spadConstant| % 102))
                                    (#7# |f2|)))
                        (EXIT
                         (COND
                          (|known_dividing|
                           (SEQ
                            (LETT |ff|
                                  (SPADCALL |ff|
                                            (SPADCALL |ff| (QREFELT % 103))
                                            (QREFELT % 104)))
                            (EXIT
                             (CONS 0
                                   (VECTOR |ff| |r0| |tt| |f2pp| |u| |u_exp|
                                           |v0|)))))
                          (#7#
                           (SEQ
                            (LETT |ff2|
                                  (LETT |ff1|
                                        (SPADCALL |ff| |gd| (QREFELT % 105))))
                            (LETT |ff3|
                                  (PROG2
                                      (LETT #4#
                                            (SPADCALL |ff| |ff1|
                                                      (QREFELT % 107)))
                                      (QCDR #4#)
                                    (|check_union2| (QEQCAR #4# 0)
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT % 7))
                                                    (|Union|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT % 7))
                                                     #8="failed")
                                                    #4#)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL
                                     (LETT |ff2|
                                           (SPADCALL |ff2| |ff3|
                                                     (QREFELT % 105)))
                                     (|spadConstant| % 108) (QREFELT % 109)))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |ff3|
                                         (PROG2
                                             (LETT #4#
                                                   (SPADCALL |ff3| |ff2|
                                                             (QREFELT % 107)))
                                             (QCDR #4#)
                                           (|check_union2| (QEQCAR #4# 0)
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT % 7))
                                                           (|Union|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT % 7))
                                                            #8#)
                                                           #4#)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (COND
                             ((NULL (EQL (SPADCALL |ff3| (QREFELT % 40)) 0))
                              (COND
                               ((SPADCALL |k| '|exp| (QREFELT % 22))
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |ff3| (QREFELT % 110))
                                             (|spadConstant| % 102)
                                             (QREFELT % 111)))
                                  (EXIT
                                   (PROGN
                                    (LETT #5# (CONS 1 #9="failed"))
                                    (GO #6#))))))
                               (#7#
                                (EXIT
                                 (PROGN (LETT #5# (CONS 1 #9#)) (GO #6#)))))))
                            (LETT |ff1|
                                  (SPADCALL |ff1|
                                            (SPADCALL |ff1| (QREFELT % 103))
                                            (QREFELT % 104)))
                            (EXIT
                             (CONS 0
                                   (VECTOR |ff1| |r0| |tt| |f2pp| |u| |u_exp|
                                           |v0|)))))))))))))
          #6# (EXIT #5#)))) 

(SDEFUN |RDEEFX;handle_factor!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 61)) (|spadConstant| % 74)
                      (QREFELT % 78)))))) 

(SDEFUN |RDEEFX;z_basis|
        ((|a| (|Vector| (|Fraction| (|Integer|))))
         (|b| (|List| (|Vector| (|Fraction| (|Integer|)))))
         (%
          (|Union|
           (|Record| (|:| |particular| (|Vector| (|Integer|)))
                     (|:| |basis| (|List| (|Vector| (|Integer|)))))
           "failed")))
        (SPROG
         ((|nn| (|NonNegativeInteger|)) (|da| #1=(|Integer|))
          (|bvp| (|Vector| (|Fraction| (|Integer|))))
          (|cd| (|Record| (|:| |num| #2=(|List| (|Integer|))) (|:| |den| #1#)))
          (|db| #1#) (|bl| #2#) (|gb| (|Integer|))
          (|bv| #3=(|Vector| (|Integer|))) (|n| (|NonNegativeInteger|))
          (#4=#:G356 NIL) (#5=#:G357 NIL) (|ai| #6=(|Integer|)) (|bi| #6#)
          (#7=#:G355 NIL) (|di1| (|Integer|)) (|di2| (|Integer|))
          (#8=#:G354 NIL) (|ki1| (|Integer|))
          (|#G54|
           (|Record| (|:| |coef1| #9=(|Integer|)) (|:| |coef2| #10=(|Integer|))
                     (|:| |generator| #11=(|Integer|))))
          (|c1| #9#) (|c2| #10#) (|g| #11#) (|di| (|Integer|))
          (|ki| (|Integer|)) (|av| #3#) (|i| NIL) (#12=#:G358 NIL)
          (#13=#:G336 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nn| (LENGTH |b|))
                (EXIT
                 (COND ((> |nn| 1) (|error| "#b > 1"))
                       (#14='T
                        (SEQ (LETT |cd| (SPADCALL |a| (QREFELT % 88)))
                             (LETT |da| (QCDR |cd|))
                             (LETT |av| (SPADCALL (QCAR |cd|) (QREFELT % 114)))
                             (EXIT
                              (COND
                               ((EQL |nn| 0)
                                (COND
                                 ((SPADCALL |da| 1 (QREFELT % 89))
                                  (CONS 1 "failed"))
                                 (#14# (CONS 0 (CONS |av| NIL)))))
                               (#14#
                                (SEQ (LETT |bvp| (|SPADfirst| |b|))
                                     (LETT |cd|
                                           (SPADCALL |bvp| (QREFELT % 88)))
                                     (LETT |db| (QCDR |cd|))
                                     (LETT |bl| (QCAR |cd|))
                                     (LETT |gb|
                                           (SPADCALL |bl| (QREFELT % 115)))
                                     (LETT |bv|
                                           (SPADCALL |bl| (QREFELT % 114)))
                                     (LETT |n| (QVSIZE |bv|))
                                     (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                                          (COND
                                           ((|greater_SI| |i| #4#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |bv| |i|
                                                      (PROG2
                                                          (LETT #13#
                                                                (|exquo_INT|
                                                                 (SPADCALL |bv|
                                                                           |i|
                                                                           (QREFELT
                                                                            %
                                                                            116))
                                                                 |gb|))
                                                          (QCDR #13#)
                                                        (|check_union2|
                                                         (QEQCAR #13# 0)
                                                         (|Integer|)
                                                         (|Union| (|Integer|)
                                                                  #15="failed")
                                                         #13#))
                                                      (QREFELT % 117))))
                                          (LETT |i| (|inc_SI| |i|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT
                                      (COND
                                       ((EQL |da| 1)
                                        (CONS 0 (CONS |av| (LIST |bv|))))
                                       ((QEQCAR (|exquo_INT| |db| |da|) 1)
                                        (CONS 1 "failed"))
                                       (#14#
                                        (SEQ (LETT |ki| 0) (LETT |di| 1)
                                             (SEQ (LETT |i| 1) (LETT #5# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #5#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SEQ
                                                     (LETT |ai|
                                                           (SPADCALL |av| |i|
                                                                     (QREFELT %
                                                                              116)))
                                                     (LETT |bi|
                                                           (SPADCALL |bv| |i|
                                                                     (QREFELT %
                                                                              116)))
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL
                                                         (REM
                                                          (- |ai|
                                                             (* |ki| |bi|))
                                                          |di|)
                                                         0 (QREFELT % 89))
                                                        (PROGN
                                                         (LETT #7#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #16=#:G353)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |di1|
                                                               (PROG2
                                                                   (LETT #13#
                                                                         (|exquo_INT|
                                                                          |da|
                                                                          (GCD
                                                                           |bi|
                                                                           |da|)))
                                                                   (QCDR #13#)
                                                                 (|check_union2|
                                                                  (QEQCAR #13#
                                                                          0)
                                                                  (|Integer|)
                                                                  (|Union|
                                                                   (|Integer|)
                                                                   #15#)
                                                                  #13#)))
                                                         (LETT |di2|
                                                               (PROG2
                                                                   (LETT #13#
                                                                         (|exquo_INT|
                                                                          |di1|
                                                                          (GCD
                                                                           |di1|
                                                                           |di|)))
                                                                   (QCDR #13#)
                                                                 (|check_union2|
                                                                  (QEQCAR #13#
                                                                          0)
                                                                  (|Integer|)
                                                                  (|Union|
                                                                   (|Integer|)
                                                                   #15#)
                                                                  #13#)))
                                                         (EXIT
                                                          (COND
                                                           ((EQL |di2| 1)
                                                            (PROGN
                                                             (LETT #8#
                                                                   |$NoValue|)
                                                             (GO #17=#:G339)))
                                                           ('T
                                                            (SEQ
                                                             (LETT |ki1|
                                                                   (SPADCALL
                                                                    |bi| |di2|
                                                                    (QREFELT %
                                                                             118)))
                                                             (PROGN
                                                              (LETT |#G54|
                                                                    (SPADCALL
                                                                     |di| |di2|
                                                                     (QREFELT %
                                                                              120)))
                                                              (LETT |c1|
                                                                    (QVELT
                                                                     |#G54| 0))
                                                              (LETT |c2|
                                                                    (QVELT
                                                                     |#G54| 1))
                                                              (LETT |g|
                                                                    (QVELT
                                                                     |#G54| 2))
                                                              |#G54|)
                                                             (LETT |di|
                                                                   (* |di2|
                                                                      |di|))
                                                             (EXIT
                                                              (LETT |ki|
                                                                    (REM
                                                                     (+
                                                                      (* |ki1|
                                                                         |c1|)
                                                                      (* |ki|
                                                                         |c2|))
                                                                     |di|)))))))))))))
                                                   #17# (EXIT #8#))
                                                  (LETT |i| (|inc_SI| |i|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |av|
                                                   (SPADCALL |av|
                                                             (SPADCALL |ki|
                                                                       |bv|
                                                                       (QREFELT
                                                                        % 121))
                                                             (QREFELT % 122)))
                                             (SEQ (LETT |i| 1) (LETT #12# |n|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |i| #12#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |av| |i|
                                                              (PROG2
                                                                  (LETT #13#
                                                                        (|exquo_INT|
                                                                         (SPADCALL
                                                                          |av|
                                                                          |i|
                                                                          (QREFELT
                                                                           %
                                                                           116))
                                                                         |da|))
                                                                  (QCDR #13#)
                                                                (|check_union2|
                                                                 (QEQCAR #13#
                                                                         0)
                                                                 (|Integer|)
                                                                 (|Union|
                                                                  (|Integer|)
                                                                  #15#)
                                                                 #13#))
                                                              (QREFELT %
                                                                       117))))
                                                  (LETT |i| (|inc_SI| |i|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (CONS 0
                                                    (CONS |av|
                                                          (LIST
                                                           |bv|))))))))))))))))))
          #16# (EXIT #7#)))) 

(SDEFUN |RDEEFX;lin_args|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                     (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                     (|:| |u_part2| F) (|:| |shift_part2| F)))))
        (SPROG
         ((|fgd| (|Factored| (|SparseUnivariatePolynomial| F))) (|a1| (F))
          (|a0| (F)) (|v0| (F)) (|u| NIL) (#1=#:G406 NIL) (#2=#:G405 NIL)
          (|u0| (F)) (|vlst1| (|List| F)) (|ulst1| (|List| F)) (|fac| NIL)
          (#3=#:G407 NIL) (|deg1| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| F)) (|tt| (F)) (|a1p| (F))
          (|has_r0| #4=(|Boolean|)) (|b0| (F)) (|b0p| (F)) (|r0f| (F))
          (|r0u| (|Union| (|Integer|) "failed"))
          (|f2| (|SparseUnivariatePolynomial| F)) (|no_sol| #4#)
          (#5=#:G403 NIL) (|dv1| (F)) (#6=#:G408 NIL) (|v| NIL) (#7=#:G409 NIL)
          (|dvs| (|List| F)) (|dv0| (F)) (|vecf| (|Vector| F))
          (|sol_rec|
           (|Record|
            (|:| |particular|
                 #8=(|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|psolu| #8#) (|psol| (|Vector| (|Fraction| (|Integer|))))
          (|zbu|
           (|Union|
            (|Record| (|:| |particular| (|Vector| (|Integer|)))
                      (|:| |basis| (|List| (|Vector| (|Integer|)))))
            "failed"))
          (#9=#:G404 NIL)
          (|zb|
           (|Record| (|:| |particular| (|Vector| (|Integer|)))
                     (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (|vec1| (|Vector| (|Integer|))) (|r0| (|Integer|)) (|a1n| (F))
          (|tt1| (F))
          (|uv1|
           #10=(|Record| (|:| |u_part| F) (|:| |v_part| F)
                         (|:| |exponent| (|Integer|))
                         (|:| |coeff| (|Integer|))))
          (|u1| (F)) (|v1| (F)) (|bv| (|Vector| (|Integer|)))
          (|r2| (|Integer|)) (|uv2| #10#) (|u2| (F)) (|v2| (F))
          (|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F)))))
         (SEQ (LETT |fgd| (SPADCALL |gd| (QREFELT % 125)))
              (EXIT
               (COND
                ((> (SPADCALL |nf| (QREFELT % 40)) 1)
                 (|error| "lin_args only works for linear nf"))
                (#11='T
                 (SEQ
                  (LETT |a1|
                        (COND
                         ((EQL (SPADCALL |nf| (QREFELT % 40)) 1)
                          (SPADCALL |nf| (QREFELT % 103)))
                         (#11# (|spadConstant| % 74))))
                  (LETT |a0| (SPADCALL |nf| 0 (QREFELT % 41)))
                  (LETT |v0| (SPADCALL |k| (QREFELT % 60))) (LETT |vlst1| NIL)
                  (LETT |ulst1| NIL)
                  (SEQ (LETT |u| NIL) (LETT #1# |ulst|) (LETT |v| NIL)
                       (LETT #2# |vlst|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL)
                             (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |v| |v0| (QREFELT % 78)) (LETT |u0| |u|))
                          ('T
                           (SEQ (LETT |vlst1| (CONS |v| |vlst1|))
                                (EXIT (LETT |ulst1| (CONS |u| |ulst1|))))))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res| NIL)
                  (SEQ (LETT |fac| NIL)
                       (LETT #3# (SPADCALL |fgd| (QREFELT % 129))) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |fac| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |f1| (QVELT |fac| 1))
                              (LETT |deg1| (SPADCALL |f1| (QREFELT % 40)))
                              (EXIT
                               (COND
                                ((EQL |deg1| 0)
                                 (PROGN (LETT #9# |$NoValue|) (GO #12=#:G364)))
                                ('T
                                 (SEQ
                                  (LETT |f1|
                                        (SPADCALL |f1|
                                                  (SPADCALL |f1|
                                                            (QREFELT % 103))
                                                  (QREFELT % 104)))
                                  (LETT |tt|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |f1| (- |deg1| 1)
                                                    (QREFELT % 41))
                                          (SPADCALL |deg1| (QREFELT % 73))
                                          (QREFELT % 66))
                                         (QREFELT % 47)))
                                  (LETT |no_sol| NIL) (LETT |has_r0| NIL)
                                  (LETT |f2| (|spadConstant| % 102))
                                  (LETT |r0| 0)
                                  (LETT |r0f| (|spadConstant| % 74))
                                  (COND
                                   ((> |deg1| 1)
                                    (SEQ
                                     (EXIT
                                      (SEQ
                                       (LETT |f2|
                                             (SPADCALL |f1| (QREFELT % 92)
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (|spadConstant| % 32)
                                                         1 (QREFELT % 43))
                                                        (SPADCALL |tt|
                                                                  (QREFELT %
                                                                           44))
                                                        (QREFELT % 48))
                                                       (QREFELT % 93)))
                                       (LETT |f2|
                                             (SPADCALL |f2|
                                                       (SPADCALL |f2|
                                                                 (QREFELT %
                                                                          103))
                                                       (QREFELT % 104)))
                                       (COND
                                        ((SPADCALL
                                          (LETT |a1p|
                                                (SPADCALL |a1| |x|
                                                          (QREFELT % 61)))
                                          (|spadConstant| % 74)
                                          (QREFELT % 130))
                                         (SEQ (LETT |has_r0| 'T)
                                              (LETT |b0|
                                                    (SPADCALL |f2| 0
                                                              (QREFELT % 41)))
                                              (LETT |b0p|
                                                    (SPADCALL |b0| |x|
                                                              (QREFELT % 61)))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |b0p|
                                                           (|spadConstant| %
                                                                           74)
                                                           (QREFELT % 78))
                                                 (LETT |no_sol| 'T))
                                                ('T
                                                 (SEQ
                                                  (LETT |r0f|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |deg1|
                                                                       (QREFELT
                                                                        % 73))
                                                             |a1p|
                                                             (QREFELT % 64))
                                                            |b0|
                                                            (QREFELT % 64))
                                                           |b0p|
                                                           (QREFELT % 66))
                                                          (QREFELT % 47))
                                                         |a1| (QREFELT % 77)))
                                                  (LETT |r0u|
                                                        (SPADCALL |r0f|
                                                                  (QREFELT %
                                                                           132)))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |r0u| 1)
                                                     (LETT |no_sol| 'T))
                                                    ('T
                                                     (SEQ
                                                      (LETT |r0| (QCDR |r0u|))
                                                      (EXIT
                                                       (LETT |f2|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (SPADCALL |a1|
                                                                         |r0f|
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                               |deg1|
                                                               (QREFELT % 79))
                                                              (SPADCALL |f2|
                                                                        (QREFELT
                                                                         % 92)
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (|spadConstant|
                                                                           %
                                                                           32)
                                                                          (SPADCALL
                                                                           |a1|
                                                                           |r0f|
                                                                           (QREFELT
                                                                            %
                                                                            72))
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          43))
                                                                        (QREFELT
                                                                         % 93))
                                                              (QREFELT %
                                                                       135)))))))))))))))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL
                                            (CONS #'|RDEEFX;lin_args!0|
                                                  (VECTOR % |x|))
                                            (SPADCALL |f2| (QREFELT % 94))
                                            (QREFELT % 96)))
                                          (PROGN
                                           (LETT #5# (LETT |no_sol| 'T))
                                           (GO #13=#:G384)))))))
                                     #13# (EXIT #5#))))
                                  (EXIT
                                   (COND
                                    (|no_sol|
                                     (PROGN (LETT #9# |$NoValue|) (GO #12#)))
                                    ('T
                                     (SEQ
                                      (LETT |dv0|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |a1| |tt|
                                                         (QREFELT % 64))
                                               |a0| (QREFELT % 72))
                                              |x| (QREFELT % 61))
                                             (QREFELT % 47)))
                                      (LETT |dv1|
                                            (SPADCALL |tt| |x| (QREFELT % 61)))
                                      (LETT |dvs|
                                            (PROGN
                                             (LETT #6# NIL)
                                             (SEQ (LETT |v| NIL)
                                                  (LETT #7# |vlst1|) G190
                                                  (COND
                                                   ((OR (ATOM #7#)
                                                        (PROGN
                                                         (LETT |v| (CAR #7#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #6#
                                                          (CONS
                                                           (SPADCALL |v| |x|
                                                                     (QREFELT %
                                                                              61))
                                                           #6#))))
                                                  (LETT #7# (CDR #7#))
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #6#)))))
                                      (LETT |vecf|
                                            (COND
                                             (|has_r0|
                                              (SEQ
                                               (LETT |dv0|
                                                     (SPADCALL |dv0|
                                                               (SPADCALL |r0f|
                                                                         |dv1|
                                                                         (QREFELT
                                                                          %
                                                                          64))
                                                               (QREFELT % 72)))
                                               (EXIT
                                                (SPADCALL |dvs|
                                                          (QREFELT % 81)))))
                                             ('T
                                              (SPADCALL (CONS |dv1| |dvs|)
                                                        (QREFELT % 81)))))
                                      (LETT |sol_rec|
                                            (SPADCALL |vecf| |dv0|
                                                      (QREFELT % 137)))
                                      (LETT |psolu| (QCAR |sol_rec|))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |psolu| 1)
                                         (PROGN
                                          (LETT #9# |$NoValue|)
                                          (GO #12#)))
                                        ('T
                                         (SEQ (LETT |psol| (QCDR |psolu|))
                                              (COND
                                               (|has_r0|
                                                (LETT |psol|
                                                      (SPADCALL
                                                       (CONS
                                                        (SPADCALL |r0|
                                                                  (QREFELT %
                                                                           139))
                                                        (SPADCALL |psol|
                                                                  (QREFELT %
                                                                           141)))
                                                       (QREFELT % 142)))))
                                              (LETT |zbu|
                                                    (|RDEEFX;z_basis| |psol|
                                                     (QCDR |sol_rec|) %))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |zbu| 1)
                                                 (PROGN
                                                  (LETT #9# |$NoValue|)
                                                  (GO #12#)))
                                                ('T
                                                 (SEQ (LETT |zb| (QCDR |zbu|))
                                                      (LETT |vec1| (QCAR |zb|))
                                                      (LETT |r0|
                                                            (SPADCALL |vec1| 1
                                                                      (QREFELT
                                                                       % 116)))
                                                      (LETT |a1n|
                                                            (SPADCALL |a1|
                                                                      (SPADCALL
                                                                       |r0|
                                                                       (QREFELT
                                                                        % 73))
                                                                      (QREFELT
                                                                       % 72)))
                                                      (LETT |tt1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |a1n|
                                                                        |tt|
                                                                        (QREFELT
                                                                         % 64))
                                                              (QREFELT % 47))
                                                             |a0|
                                                             (QREFELT % 77)))
                                                      (LETT |uv1|
                                                            (|RDEEFX;get_uv0|
                                                             |tt1|
                                                             (CDR
                                                              (SPADCALL |vec1|
                                                                        (QREFELT
                                                                         %
                                                                         143)))
                                                             |vlst1| |ulst1|
                                                             |k| |x| %))
                                                      (LETT |u1|
                                                            (SPADCALL
                                                             (QVELT |uv1| 0)
                                                             (SPADCALL |u0|
                                                                       |r0|
                                                                       (QREFELT
                                                                        % 79))
                                                             (QREFELT % 64)))
                                                      (LETT |v1|
                                                            (QVELT |uv1| 1))
                                                      (EXIT
                                                       (COND
                                                        ((NULL (QCDR |zb|))
                                                         (LETT |res|
                                                               (CONS
                                                                (VECTOR |f1|
                                                                        |r0|
                                                                        |tt1|
                                                                        |f2|
                                                                        |u1| 0
                                                                        |v1|
                                                                        NIL 0
                                                                        (|spadConstant|
                                                                         % 74)
                                                                        (|spadConstant|
                                                                         % 32)
                                                                        (|spadConstant|
                                                                         % 74))
                                                                |res|)))
                                                        ('T
                                                         (SEQ
                                                          (LETT |bv|
                                                                (|SPADfirst|
                                                                 (QCDR |zb|)))
                                                          (LETT |r2|
                                                                (SPADCALL |bv|
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           116)))
                                                          (LETT |uv2|
                                                                (|RDEEFX;get_uv0|
                                                                 (SPADCALL |tt|
                                                                           (QREFELT
                                                                            %
                                                                            47))
                                                                 (CDR
                                                                  (SPADCALL
                                                                   |bv|
                                                                   (QREFELT %
                                                                            143)))
                                                                 |vlst1|
                                                                 |ulst1| |k|
                                                                 |x| %))
                                                          (LETT |u2|
                                                                (SPADCALL
                                                                 (QVELT |uv2|
                                                                        0)
                                                                 (SPADCALL |u0|
                                                                           |r2|
                                                                           (QREFELT
                                                                            %
                                                                            79))
                                                                 (QREFELT %
                                                                          64)))
                                                          (LETT |v2|
                                                                (QVELT |uv2|
                                                                       1))
                                                          (EXIT
                                                           (LETT |res|
                                                                 (CONS
                                                                  (VECTOR |f1|
                                                                          |r0|
                                                                          |tt1|
                                                                          |f2|
                                                                          |u1|
                                                                          0
                                                                          |v1|
                                                                          'T
                                                                          |r2|
                                                                          (SPADCALL
                                                                           |tt|
                                                                           (QREFELT
                                                                            %
                                                                            47))
                                                                          |u2|
                                                                          |v2|)
                                                                  |res|)))))))))))))))))))))))))
                        #12# (EXIT #9#))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |RDEEFX;lin_args!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 61)) (|spadConstant| % 74)
                      (QREFELT % 78)))))) 

(SDEFUN |RDEEFX;get_rational_solutions|
        ((|eq1| (|Equation| (|Fraction| (|Polynomial| F)))) (|s1| (|Symbol|))
         (|s2| (|Symbol|)) (% (|List| (|Fraction| (|Integer|)))))
        (SPROG
         ((|rv| (|Fraction| (|Polynomial| F)))
          (|ru0| (|Union| (|Polynomial| F) "failed"))
          (|ru1| (|Union| F "failed"))
          (|ru2| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|eq1p| (|Polynomial| F)) (|k1| (|Kernel| F)) (|eq1f| (F)))
         (SEQ
          (COND
           ((SPADCALL (LETT |rv| (SPADCALL |eq1| (QREFELT % 146)))
                      (|spadConstant| % 147) (QREFELT % 148))
            (COND
             ((SPADCALL |s1|
                        (SPADCALL (SPADCALL |eq1| (QREFELT % 149))
                                  (QREFELT % 150))
                        (QREFELT % 151))
              (|error| "wrong format of solution 1"))
             (#1='T
              (SEQ (LETT |ru0| (SPADCALL |rv| (QREFELT % 153)))
                   (EXIT
                    (COND ((QEQCAR |ru0| 1) NIL)
                          (#1#
                           (SEQ
                            (LETT |ru1|
                                  (SPADCALL (QCDR |ru0|) (QREFELT % 156)))
                            (EXIT
                             (COND ((QEQCAR |ru1| 1) NIL)
                                   (#1#
                                    (SEQ
                                     (LETT |ru2|
                                           (SPADCALL (QCDR |ru1|)
                                                     (QREFELT % 158)))
                                     (EXIT
                                      (COND ((QEQCAR |ru2| 1) NIL)
                                            (#1#
                                             (LIST (QCDR |ru2|)))))))))))))))))
           (#1#
            (SEQ
             (LETT |eq1p|
                   (SPADCALL (SPADCALL |eq1| (QREFELT % 149)) (QREFELT % 159)))
             (EXIT
              (COND
               ((SPADCALL |s2| (SPADCALL |eq1p| (QREFELT % 161))
                          (QREFELT % 162))
                (|error| "wrong format of solution 2"))
               (#1#
                (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT % 57)))
                     (LETT |eq1f|
                           (SPADCALL
                            (SPADCALL |eq1p| |s1|
                                      (SPADCALL |k1| (QREFELT % 60))
                                      (QREFELT % 163))
                            (QREFELT % 164)))
                     (EXIT (SPADCALL |eq1f| |k1| (QREFELT % 166))))))))))))) 

(SDEFUN |RDEEFX;F_to_FP|
        ((|p| (F)) (|ls| (|List| (|Symbol|))) (|lk| (|List| (|Kernel| F)))
         (% (|Polynomial| F)))
        (SPROG
         ((|k1| (|Kernel| F)) (|s1| (|Symbol|))
          (|pu| (|SparseUnivariatePolynomial| F))
          (|pu1| (|SparseUnivariatePolynomial| (|Polynomial| F))))
         (SEQ
          (COND ((NULL |lk|) (SPADCALL |p| (QREFELT % 167)))
                ('T
                 (SEQ (LETT |k1| (|SPADfirst| |lk|))
                      (LETT |s1| (|SPADfirst| |ls|))
                      (LETT |pu|
                            (SPADCALL (SPADCALL |p| |k1| (QREFELT % 35))
                                      (QREFELT % 38)))
                      (LETT |pu1|
                            (SPADCALL
                             (CONS #'|RDEEFX;F_to_FP!0| (VECTOR |lk| % |ls|))
                             |pu| (QREFELT % 173)))
                      (EXIT (SPADCALL |pu1| |s1| (QREFELT % 175))))))))) 

(SDEFUN |RDEEFX;F_to_FP!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls| % |lk|)
          (LETT |ls| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|RDEEFX;F_to_FP| |c| (SPADCALL |ls| (QREFELT % 168))
             (SPADCALL |lk| (QREFELT % 169)) %))))) 

(SDEFUN |RDEEFX;solve_poly_eqs|
        ((|eqs| (|List| F)) (|s1| (|Symbol|)) (|s2| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|k1| #1=(|Kernel| F)) (|k2| #1#) (#2=#:G455 NIL) (|eqi| NIL)
          (#3=#:G456 NIL) (|eqs0| (|List| (|Polynomial| F))) (#4=#:G457 NIL)
          (|ci| NIL) (#5=#:G458 NIL)
          (|lsol0|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| F))))))
          (|sol0| NIL) (#6=#:G459 NIL)
          (|eq0| (|Equation| (|Fraction| (|Polynomial| F))))
          (|eq0p| (|Polynomial| F))
          (|eq1| (|Equation| (|Fraction| (|Polynomial| F)))) (|val1r| NIL)
          (#7=#:G460 NIL) (|val2eq| (|Polynomial| F))
          (|val2alg| (|SparseUnivariatePolynomial| F))
          (|res|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))))))
         (SEQ (LETT |k1| (SPADCALL |s1| (QREFELT % 57)))
              (LETT |k2| (SPADCALL |s2| (QREFELT % 57)))
              (LETT |eqs0|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |eqi| NIL) (LETT #3# |eqs|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |eqi| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (|RDEEFX;F_to_FP|
                                    (SPADCALL (SPADCALL |eqi| (QREFELT % 177))
                                              (QREFELT % 178))
                                    (LIST |s1| |s2|) (LIST |k1| |k2|) %)
                                   #2#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |lsol0|
                    (SPADCALL
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |ci| NIL) (LETT #5# |eqs0|) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |ci| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #4#
                                   (CONS (SPADCALL |ci| (QREFELT % 179))
                                         #4#))))
                           (LETT #5# (CDR #5#)) (GO G190) G191
                           (EXIT (NREVERSE #4#))))
                     (LIST |s2| |s1|) (QREFELT % 183)))
              (LETT |res| NIL)
              (SEQ (LETT |sol0| NIL) (LETT #6# |lsol0|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |sol0| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (LENGTH |sol0|) 2 (QREFELT % 89))
                       (|error| "wrong format of solution 0"))
                      ('T
                       (SEQ (LETT |eq0| (|SPADfirst| |sol0|))
                            (LETT |eq0p|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |eq0| (QREFELT % 149))
                                             (SPADCALL |eq0| (QREFELT % 146))
                                             (QREFELT % 184))
                                   (QREFELT % 159)))
                            (LETT |eq1| (SPADCALL |sol0| (QREFELT % 186)))
                            (EXIT
                             (SEQ (LETT |val1r| NIL)
                                  (LETT #7#
                                        (|RDEEFX;get_rational_solutions| |eq1|
                                         |s1| |s2| %))
                                  G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |val1r| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |val2eq|
                                         (SPADCALL |eq0p| |s1|
                                                   (SPADCALL |val1r|
                                                             (QREFELT % 187))
                                                   (QREFELT % 163)))
                                   (LETT |val2alg|
                                         (SPADCALL |val2eq| (QREFELT % 188)))
                                   (EXIT
                                    (LETT |res|
                                          (CONS (CONS |val1r| |val2alg|)
                                                |res|))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT NIL))))))))
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args0|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst0| (|List| F)) (|ulst0| (|List| F)) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))))
        (SPROG
         ((|kf| (F)) (|u| NIL) (#1=#:G494 NIL) (|v| NIL) (#2=#:G493 NIL)
          (|vlst| (|List| F)) (|ulst| (|List| F)) (|u0| (F))
          (|as| #3=(|Symbol|)) (|a| #4=(|Kernel| F)) (|bs| #3#) (|b| #4#)
          (|qq| (|SparseUnivariatePolynomial| F)) (#5=#:G495 NIL) (|ci| NIL)
          (#6=#:G496 NIL) (|eqs0| (|List| F))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|cc| (F)) (|ccu| (|Union| (|Integer|) "failed"))
          (|has_r_bad| (|Boolean|)) (|r_bad| (|Integer|)) (|sol| NIL)
          (#7=#:G497 NIL)
          (|res1|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (#8=#:G492 NIL) (|nnp| #9=(|SparseUnivariatePolynomial| F))
          (|eq1| (F)) (|ratl| (|List| (|Fraction| (|Integer|))))
          (|degd| #10=(|NonNegativeInteger|)) (|degn| #10#)
          (|degn1| (|NonNegativeInteger|)) (|r0| NIL) (#11=#:G498 NIL)
          (|ru| (|Union| (|Integer|) "failed")) (#12=#:G491 NIL)
          (|ri| (|Integer|)) (|nn| #9#)
          (|res1l|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (#13=#:G499 NIL) (|ap| (|SparseUnivariatePolynomial| F))
          (|fac| (|SparseUnivariatePolynomial| F)) (|dega| (|Integer|))
          (#14=#:G490 NIL)
          (|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F)))))
         (SEQ (LETT |vlst| NIL) (LETT |ulst| NIL)
              (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
              (SEQ (LETT |u| NIL) (LETT #1# |ulst0|) (LETT |v| NIL)
                   (LETT #2# |vlst0|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |u| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |v| |kf| (QREFELT % 130))
                       (SEQ (LETT |vlst| (CONS |v| |vlst|))
                            (EXIT (LETT |ulst| (CONS |u| |ulst|)))))
                      ('T (LETT |u0| |u|)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |as| (SPADCALL (QREFELT % 56)))
              (LETT |a| (SPADCALL |as| (QREFELT % 57)))
              (LETT |bs| (SPADCALL (QREFELT % 56)))
              (LETT |b| (SPADCALL |bs| (QREFELT % 57)))
              (LETT |nn|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |a| (QREFELT % 60)) 1
                                          (QREFELT % 43))
                                (SPADCALL (SPADCALL |b| (QREFELT % 60))
                                          (QREFELT % 44))
                                (QREFELT % 48))
                               |denf| (QREFELT % 97))
                              (QREFELT % 48)))
              (LETT |qq| (SPADCALL |gd| |nn| (QREFELT % 189)))
              (LETT |eqs0|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |ci| NIL)
                          (LETT #6# (SPADCALL |qq| (QREFELT % 94))) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |ci| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL (SPADCALL |ci| (QREFELT % 177))
                                             (QREFELT % 178))
                                   #5#))))
                          (LETT #6# (CDR #6#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |lsol| (|RDEEFX;solve_poly_eqs| |eqs0| |as| |bs| %))
              (LETT |has_r_bad| NIL) (LETT |r_bad| 0)
              (COND
               ((>= (+ (SPADCALL |denf| (QREFELT % 40)) 1)
                    (SPADCALL |nf| (QREFELT % 40)))
                (COND
                 ((> (+ (SPADCALL |denf| (QREFELT % 40)) 1)
                     (SPADCALL |nf| (QREFELT % 40)))
                  (SEQ (LETT |has_r_bad| 'T) (EXIT (LETT |r_bad| 0))))
                 ('T
                  (SEQ
                   (LETT |cc|
                         (SPADCALL
                          (SPADCALL (SPADCALL |nf| (QREFELT % 103))
                                    (SPADCALL |denf| (QREFELT % 103))
                                    (QREFELT % 66))
                          (QREFELT % 47)))
                   (LETT |ccu| (SPADCALL |cc| (QREFELT % 132)))
                   (EXIT
                    (COND
                     ((QEQCAR |ccu| 0)
                      (SEQ (LETT |has_r_bad| 'T)
                           (EXIT (LETT |r_bad| (QCDR |ccu|))))))))))))
              (LETT |res| NIL)
              (SEQ (LETT |sol| NIL) (LETT #7# |lsol|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |sol| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ru| (SPADCALL (QCAR |sol|) (QREFELT % 190)))
                          (EXIT
                           (COND
                            ((QEQCAR |ru| 1)
                             (PROGN (LETT #8# |$NoValue|) (GO #15=#:G475)))
                            ('T
                             (SEQ
                              (COND
                               (|has_r_bad|
                                (COND
                                 ((EQL (QCDR |ru|) |r_bad|)
                                  (EXIT
                                   (PROGN (LETT #8# |$NoValue|) (GO #15#)))))))
                              (LETT |res1|
                                    (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                     (QCDR |sol|) (QCDR |ru|) |u| |vlst| |ulst|
                                     |k| |x| 'T %))
                              (EXIT
                               (COND
                                ((QEQCAR |res1| 1)
                                 (PROGN (LETT #8# |$NoValue|) (GO #15#)))
                                ('T
                                 (LETT |res|
                                       (CONS (QCDR |res1|) |res|)))))))))))
                    #15# (EXIT #8#))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (LETT |nnp|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (SPADCALL |nf| (QREFELT % 191)) |denf|
                                (QREFELT % 97))
                      (SPADCALL (SPADCALL |denf| (QREFELT % 191)) |nf|
                                (QREFELT % 97))
                      (QREFELT % 45))
                     (SPADCALL (SPADCALL |a| (QREFELT % 60)) (QREFELT % 44))
                     (QREFELT % 48)))
              (LETT |eq1| (SPADCALL |nnp| |gd| (QREFELT % 192)))
              (LETT |ratl| (SPADCALL |eq1| |a| (QREFELT % 166)))
              (COND
               (|has_r_bad|
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |r_bad| (QREFELT % 139)) |ratl|
                             (QREFELT % 193)))
                  (LETT |ratl|
                        (CONS (SPADCALL |r_bad| (QREFELT % 139)) |ratl|))))))
              (LETT |degd| (SPADCALL |denf| (QREFELT % 40)))
              (LETT |degn| (SPADCALL |nf| (QREFELT % 40)))
              (LETT |degn1| (MAX |degn| (+ |degd| 1)))
              (SEQ (LETT |r0| NIL) (LETT #11# |ratl|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |r0| (CAR #11#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |ru| (SPADCALL |r0| (QREFELT % 190)))
                          (EXIT
                           (COND
                            ((QEQCAR |ru| 1)
                             (PROGN (LETT #12# |$NoValue|) (GO #16=#:G481)))
                            ('T
                             (SEQ (LETT |ri| (QCDR |ru|))
                                  (LETT |nn|
                                        (SPADCALL |nf|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |ri|
                                                              (QREFELT % 73))
                                                    1 (QREFELT % 43))
                                                   |denf| (QREFELT % 97))
                                                  (QREFELT % 48)))
                                  (LETT |res1l|
                                        (|RDEEFX;ei_args3| |gd| |nn| |denf| |k|
                                         |vlst| |ulst| |x| %))
                                  (EXIT
                                   (SEQ (LETT #13# |res1l|) G190
                                        (COND
                                         ((OR (ATOM #13#)
                                              (PROGN
                                               (LETT |res1| (CAR #13#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |ap| (QVELT |res1| 3))
                                               (LETT |fac| (QVELT |res1| 0))
                                               (LETT |dega|
                                                     (COND
                                                      ((SPADCALL |ap|
                                                                 (|spadConstant|
                                                                  % 102)
                                                                 (QREFELT %
                                                                          111))
                                                       1)
                                                      ('T
                                                       (SPADCALL |ap|
                                                                 (QREFELT %
                                                                          40)))))
                                               (EXIT
                                                (COND
                                                 ((EQL
                                                   (SPADCALL |fac|
                                                             (QREFELT % 40))
                                                   (* |degn1| |dega|))
                                                  (PROGN
                                                   (LETT #14# |$NoValue|)
                                                   (GO #17=#:G482)))
                                                 ('T
                                                  (LETT |res|
                                                        (CONS
                                                         (VECTOR |fac| |ri|
                                                                 (QVELT |res1|
                                                                        2)
                                                                 |ap|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |u0| |ri|
                                                                   (QREFELT %
                                                                            79))
                                                                  (QVELT |res1|
                                                                         4)
                                                                  (QREFELT %
                                                                           64))
                                                                 0
                                                                 (QVELT |res1|
                                                                        6))
                                                         |res|)))))))
                                         #17# (EXIT #14#))
                                        (LETT #13# (CDR #13#)) (GO G190) G191
                                        (EXIT NIL)))))))))
                    #16# (EXIT #12#))
                   (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args1|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|t| (|Kernel| F))
         (% (|Factored| (|SparseUnivariatePolynomial| F))))
        (SPROG ((|r| (F)))
               (SEQ
                (LETT |r|
                      (SPADCALL
                       (SPADCALL |nf|
                                 (SPADCALL (SPADCALL |t| (QREFELT % 60)) |denf|
                                           (QREFELT % 135))
                                 (QREFELT % 48))
                       |gd| (QREFELT % 192)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |r| |t| (QREFELT % 35)) (QREFELT % 38))
                  (QREFELT % 125)))))) 

(SDEFUN |RDEEFX;ei_args2|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|f_res| (|Factored| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|vlst| (|List| F)) (|ulst| (|List| F))
         (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))))
        (SPROG
         ((|rfac|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|fac| NIL) (#2=#:G510 NIL) (|f1| #1#)
          (|deg1| (|NonNegativeInteger|)) (#3=#:G509 NIL)
          (|resu|
           (|Union|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))
            "failed"))
          (|res|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F)))))
         (SEQ (LETT |rfac| (SPADCALL |f_res| (QREFELT % 129))) (LETT |res| NIL)
              (SEQ (LETT |fac| NIL) (LETT #2# |rfac|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |f1| (QVELT |fac| 1))
                          (LETT |deg1| (SPADCALL |f1| (QREFELT % 40)))
                          (EXIT
                           (COND
                            ((EQL |deg1| 0)
                             (PROGN (LETT #3# |$NoValue|) (GO #4=#:G503)))
                            ('T
                             (SEQ
                              (LETT |resu|
                                    (|RDEEFX;handle_factor| |gd| |nf| |denf|
                                     |f1| 0 (|spadConstant| % 32) |vlst| |ulst|
                                     |k| |x| NIL %))
                              (EXIT
                               (COND
                                ((QEQCAR |resu| 0)
                                 (LETT |res|
                                       (CONS (QCDR |resu|) |res|)))))))))))
                    #4# (EXIT #3#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;ei_args3|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))))
        (SPROG
         ((|t| (|Kernel| F))
          (|f_res| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |t| (SPADCALL (SPADCALL (QREFELT % 56)) (QREFELT % 57)))
              (LETT |f_res| (|RDEEFX;ei_args1| |gd| |nf| |denf| |t| %))
              (EXIT
               (|RDEEFX;ei_args2| |gd| |nf| |denf| |f_res| |k| |vlst| |ulst|
                |x| %))))) 

(SDEFUN |RDEEFX;ei_args|
        ((|gd| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))))
        (SPROG
         ((|res1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F)))))
         (SEQ
          (COND ((EQL (SPADCALL |gd| (QREFELT % 40)) 0) NIL)
                (#1='T
                 (SEQ
                  (LETT |res1|
                        (COND
                         ((SPADCALL |k| '|log| (QREFELT % 22))
                          (|RDEEFX;ei_args0| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| %))
                         (#1#
                          (|RDEEFX;ei_args3| |gd| |nf| |denf| |k| |vlst| |ulst|
                           |x| %))))
                  (EXIT |res1|))))))) 

(SDEFUN |RDEEFX;my_exp|
        ((|p| (|SparseUnivariatePolynomial| F)) (|n| (|NonNegativeInteger|))
         (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL |p| |n| (QREFELT % 194))) 

(SDEFUN |RDEEFX;ei_candidate|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|vlst| (|List| F))
         (|ulst| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (|a| (|Integer|)) (|tt| (F))
         (|res|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|nf1| (|SparseUnivariatePolynomial| F))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))))
         (SEQ (LETT |tt| (SPADCALL |tt| (QREFELT % 47)))
              (LETT |nf1|
                    (SPADCALL |nf| (SPADCALL |tt| |denf| (QREFELT % 135))
                              (QREFELT % 48)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |nf1| (QREFELT % 110))
                           (|spadConstant| % 102) (QREFELT % 109))
                 |res|)
                (#1='T
                 (SEQ
                  (COND
                   ((> (SPADCALL |nf1| (QREFELT % 40)) 0)
                    (COND
                     ((NULL (SPADCALL |k| '|exp| (QREFELT % 22)))
                      (EXIT |res|)))))
                  (LETT |uvu| (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| %))
                  (EXIT
                   (COND ((QEQCAR |uvu| 1) |res|)
                         (#1#
                          (SEQ (LETT |uv| (QCDR |uvu|))
                               (EXIT
                                (CONS
                                 (VECTOR 1 |nf1| (|spadConstant| % 32) |a| |tt|
                                         (|spadConstant| % 102)
                                         (SPADCALL |nf1| |denf|
                                                   (QREFELT % 195))
                                         (|spadConstant| % 196) (QVELT |uv| 0)
                                         (QVELT |uv| 2) (QVELT |uv| 1)
                                         (|spadConstant| % 74))
                                 |res|))))))))))))) 

(SDEFUN |RDEEFX;special_ei_candidates|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|vlst| (|List| F))
         (|ulst| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|n1| #1=(|NonNegativeInteger|)) (|n2| #1#)
          (|rnf| #2=(|SparseUnivariatePolynomial| F)) (|rdf| #2#)
          (|res|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|lc| (F)) (|rcu| (|Union| (|Integer|) "failed")) (#3=#:G549 NIL)
          (|a| (|Integer|)) (|tt| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |tt| (|spadConstant| % 74)) (LETT |a| 0)
                (EXIT
                 (COND
                  ((SPADCALL |k| '|exp| (QREFELT % 22))
                   (SEQ (LETT |res| NIL)
                        (LETT |n1| (SPADCALL |nf| (QREFELT % 40)))
                        (LETT |n2| (SPADCALL |denf| (QREFELT % 40)))
                        (LETT |rnf| (SPADCALL |nf| (QREFELT % 110)))
                        (LETT |rdf| (SPADCALL |denf| (QREFELT % 110)))
                        (EXIT
                         (COND
                          ((EQL |n1| |n2|)
                           (SEQ (LETT |tt| (SPADCALL |nf| (QREFELT % 103)))
                                (LETT |res|
                                      (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                       |ulst| |k| |x| |a| |tt| |res| %))
                                (COND
                                 ((SPADCALL |rdf| (|spadConstant| % 102)
                                            (QREFELT % 109))
                                  (COND
                                   ((EQL (SPADCALL |rdf| (QREFELT % 40))
                                         (SPADCALL |rnf| (QREFELT % 40)))
                                    (EXIT
                                     (SEQ
                                      (LETT |tt|
                                            (SPADCALL
                                             (SPADCALL |rnf| (QREFELT % 103))
                                             (SPADCALL |rdf| (QREFELT % 103))
                                             (QREFELT % 66)))
                                      (EXIT
                                       (|RDEEFX;ei_candidate| |nf| |denf|
                                        |vlst| |ulst| |k| |x| |a| |tt| |res|
                                        %))))))))
                                (EXIT |res|)))
                          (#4='T
                           (SEQ
                            (LETT |res|
                                  (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                   |ulst| |k| |x| |a| (|spadConstant| % 74)
                                   |res| %))
                            (COND
                             ((< |n1| |n2|)
                              (COND
                               ((SPADCALL |rdf| (|spadConstant| % 102)
                                          (QREFELT % 109))
                                (COND
                                 ((EQL (SPADCALL |rdf| (QREFELT % 40)) |n1|)
                                  (EXIT
                                   (SEQ
                                    (LETT |tt|
                                          (SPADCALL
                                           (SPADCALL |nf| (QREFELT % 103))
                                           (SPADCALL |rdf| (QREFELT % 103))
                                           (QREFELT % 66)))
                                    (EXIT
                                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                      |ulst| |k| |x| |a| |tt| |res| %))))))))))
                            (COND
                             ((> |n1| |n2|)
                              (COND
                               ((SPADCALL |rnf| (|spadConstant| % 102)
                                          (QREFELT % 109))
                                (COND
                                 ((EQL (SPADCALL |rnf| (QREFELT % 40)) |n2|)
                                  (EXIT
                                   (SEQ
                                    (LETT |tt|
                                          (SPADCALL |rnf| (QREFELT % 103)))
                                    (EXIT
                                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst|
                                      |ulst| |k| |x| |a| |tt| |res| %))))))))))
                            (EXIT |res|)))))))
                  ((> (SPADCALL |nf| (QREFELT % 40))
                      (+ (SPADCALL |denf| (QREFELT % 40)) 1))
                   NIL)
                  (#4#
                   (SEQ
                    (COND
                     ((SPADCALL |k| '|log| (QREFELT % 22))
                      (COND
                       ((EQL (SPADCALL |nf| (QREFELT % 40))
                             (+ (SPADCALL |denf| (QREFELT % 40)) 1))
                        (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT % 103)))
                             (LETT |rcu| (SPADCALL |lc| (QREFELT % 132)))
                             (EXIT
                              (COND
                               ((QEQCAR |rcu| 1)
                                (PROGN (LETT #3# NIL) (GO #5=#:G548)))
                               (#4#
                                (SEQ (LETT |a| (- (QCDR |rcu|)))
                                     (EXIT
                                      (LETT |nf|
                                            (SPADCALL |nf|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |a|
                                                                  (QREFELT %
                                                                           73))
                                                        1 (QREFELT % 43))
                                                       |denf| (QREFELT % 97))
                                                      (QREFELT %
                                                               48)))))))))))))
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT % 40))
                           (SPADCALL |denf| (QREFELT % 40)))
                      (LETT |tt| (SPADCALL |nf| (QREFELT % 103)))))
                    (EXIT
                     (|RDEEFX;ei_candidate| |nf| |denf| |vlst| |ulst| |k| |x|
                      |a| |tt| NIL %))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |RDEEFX;gamma_candidate|
        ((|fnf| (|Factored| (|SparseUnivariatePolynomial| F)))
         (|nf1| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|gden1| (|SparseUnivariatePolynomial| F)) (|gexp| (|Integer|))
         (|a| (|Integer|)) (|tt| (F)) (|f2| (|SparseUnivariatePolynomial| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|))
         (|res|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|nffacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G577 NIL) (#2=#:G578 NIL) (|lexp| (|List| (|Integer|)))
          (|l1| (|Integer|)) (#3=#:G579 NIL) (#4=#:G580 NIL) (#5=#:G554 NIL)
          (|lexp1| (|List| (|NonNegativeInteger|))) (#6=#:G581 NIL)
          (|fac1| NIL) (#7=#:G583 NIL) (|e1| NIL) (#8=#:G582 NIL)
          (#9=#:G561 NIL)
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (#10=#:G563 NIL)
          (|ur|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| F)
                     (|:| |radicand| F)))
          (|mu| (|Union| (|Integer|) "failed")) (#11=#:G576 NIL)
          (|m1| (|Integer|)) (|nf2| (|SparseUnivariatePolynomial| F))
          (|unf| (F)))
         (SEQ
          (EXIT
           (SEQ (LETT |nffacs| (SPADCALL |fnf| (QREFELT % 129)))
                (LETT |lexp|
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |fac1| NIL) (LETT #2# |nffacs|) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |fac1| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #1# (CONS (QVELT |fac1| 2) #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))
                (LETT |l1| (GCD |gexp| (SPADCALL |lexp| (QREFELT % 115))))
                (EXIT
                 (COND ((EQL |l1| 1) |res|)
                       (#12='T
                        (SEQ
                         (LETT |lexp1|
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |e1| NIL) (LETT #4# |lexp|) G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |e1| (CAR #4#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (PROG1
                                                  (LETT #5#
                                                        (|quotient_INT| |e1|
                                                                        |l1|))
                                                (|check_subtype2| (>= #5# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #5#))
                                              #3#))))
                                     (LETT #4# (CDR #4#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#)))))
                         (LETT |nf2|
                               (SPADCALL (ELT % 97)
                                         (PROGN
                                          (LETT #6# NIL)
                                          (SEQ (LETT |fac1| NIL)
                                               (LETT #7# |nffacs|)
                                               (LETT |e1| NIL)
                                               (LETT #8# |lexp1|) G190
                                               (COND
                                                ((OR (ATOM #8#)
                                                     (PROGN
                                                      (LETT |e1| (CAR #8#))
                                                      NIL)
                                                     (ATOM #7#)
                                                     (PROGN
                                                      (LETT |fac1| (CAR #7#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #6#
                                                       (CONS
                                                        (|RDEEFX;my_exp|
                                                         (QVELT |fac1| 1) |e1|
                                                         %)
                                                        #6#))))
                                               (LETT #8#
                                                     (PROG1 (CDR #8#)
                                                       (LETT #7# (CDR #7#))))
                                               (GO G190) G191
                                               (EXIT (NREVERSE #6#))))
                                         (|spadConstant| % 108)
                                         (QREFELT % 199)))
                         (LETT |gden1|
                               (COND ((EQL |gexp| 1) (|spadConstant| % 108))
                                     (#12#
                                      (|RDEEFX;my_exp| |gden1|
                                       (PROG1
                                           (LETT #9#
                                                 (|quotient_INT| |gexp| |l1|))
                                         (|check_subtype2| (>= #9# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #9#))
                                       %))))
                         (LETT |uvu|
                               (|RDEEFX;get_uv| |tt| |vlst| |ulst| |k| |x| %))
                         (EXIT
                          (COND ((QEQCAR |uvu| 1) |res|)
                                (#12#
                                 (SEQ (LETT |uv| (QCDR |uvu|))
                                      (LETT |unf|
                                            (SPADCALL
                                             (SPADCALL |fnf| (QREFELT % 200))
                                             (QREFELT % 201)))
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |unf| |x| (QREFELT % 61))
                                         (|spadConstant| % 74) (QREFELT % 130))
                                        (SEQ
                                         (LETT |ur|
                                               (SPADCALL |unf|
                                                         (PROG1
                                                             (LETT #10# |l1|)
                                                           (|check_subtype2|
                                                            (>= #10# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #10#))
                                                         (QREFELT % 204)))
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL (QVELT |ur| 2) |x|
                                                      (QREFELT % 61))
                                            (|spadConstant| % 74)
                                            (QREFELT % 130))
                                           (PROGN
                                            (LETT #11# |res|)
                                            (GO #13=#:G575))))
                                         (LETT |mu|
                                               (|exquo_INT| |l1|
                                                            (QVELT |ur| 0)))
                                         (COND
                                          ((QEQCAR |mu| 1)
                                           (PROGN
                                            (LETT #11# |res|)
                                            (GO #13#))))
                                         (LETT |m1| (QCDR |mu|))
                                         (LETT |nf2|
                                               (SPADCALL |nf2| (QVELT |ur| 1)
                                                         (QREFELT % 205)))
                                         (EXIT
                                          (LETT |unf|
                                                (SPADCALL (QVELT |ur| 2) |m1|
                                                          (QREFELT % 79)))))))
                                      (EXIT
                                       (CONS
                                        (VECTOR |l1| |nf2| |unf| |a| |tt| |f2|
                                                (SPADCALL |nf1| |denf|
                                                          (QREFELT % 195))
                                                (SPADCALL |nf2| |gden1|
                                                          (QREFELT % 195))
                                                (QVELT |uv| 0) (QVELT |uv| 2)
                                                (QVELT |uv| 1)
                                                (|spadConstant| % 74))
                                        |res|))))))))))))
          #13# (EXIT #11#)))) 

(SDEFUN |RDEEFX;solve_for_ratios| ((|lc| (|List| F)) (% (|List| (|Integer|))))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (|v| (|Vector| (|Integer|)))
          (#2=#:G609 NIL) (#3=#:G608 NIL) (|n1| #1#) (#4=#:G610 NIL)
          (#5=#:G611 NIL) (|c1| (F)) (|nlc| (|List| F)) (#6=#:G592 NIL)
          (|nn1| (|NonNegativeInteger|)) (|m| (|Matrix| F)) (|c| NIL)
          (#7=#:G613 NIL) (#8=#:G612 NIL) (|v0| (|Vector| F))
          (|res|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
            (|:| |basis| #9=(|List| (|Vector| (|Fraction| (|Integer|)))))))
          (|bl| #9#) (|s1| (|Vector| (|Fraction| (|Integer|))))
          (#10=#:G614 NIL) (#11=#:G615 NIL) (|d| (|Integer|)) (|i| NIL)
          (|jj| #12=(|NonNegativeInteger|)) (|j| #12#) (|li| (|Integer|))
          (|rl| (|List| (|Integer|))))
         (SEQ (LETT |n| (LENGTH |lc|)) (LETT |nlc| NIL)
              (LETT |v| (MAKEARR1 |n| 1))
              (SEQ (LETT |c| NIL) (LETT #2# |lc|) (LETT |i| 1) (LETT #3# |n|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #3#) (ATOM #2#)
                         (PROGN (LETT |c| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QEQCAR (SPADCALL |c| (QREFELT % 158)) 0)
                       (SPADCALL |v| |i| 0 (QREFELT % 117)))
                      ('T (LETT |nlc| (CONS |c| |nlc|))))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                   (GO G190) G191 (EXIT NIL))
              (LETT |n1| (LENGTH |nlc|))
              (EXIT
               (COND ((EQL |n1| 0) NIL)
                     ((EQL |n1| 1)
                      (PROGN
                       (LETT #4# NIL)
                       (SEQ (LETT |i| 1) (LETT #5# |n|) G190
                            (COND ((|greater_SI| |i| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #4#
                                    (CONS (SPADCALL |v| 1 (QREFELT % 116))
                                          #4#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #4#)))))
                     (#13='T
                      (SEQ (LETT |c1| (|SPADfirst| |nlc|))
                           (LETT |nlc| (CDR |nlc|))
                           (LETT |nn1|
                                 (PROG1 (LETT #6# (- |n1| 1))
                                   (|check_subtype2| (>= #6# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #6#)))
                           (LETT |m|
                                 (SPADCALL |nn1| (+ (* 2 |nn1|) 1)
                                           (QREFELT % 207)))
                           (SEQ (LETT |c| NIL) (LETT #7# |nlc|) (LETT |i| 1)
                                (LETT #8# |nn1|) G190
                                (COND
                                 ((OR (|greater_SI| |i| #8#) (ATOM #7#)
                                      (PROGN (LETT |c| (CAR #7#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (SPADCALL |m| |i| 1
                                           (SPADCALL |c| (QREFELT % 47))
                                           (QREFELT % 208))
                                 (SPADCALL |m| |i| (+ |i| 1) |c1|
                                           (QREFELT % 208))
                                 (EXIT
                                  (SPADCALL |m| |i| (+ |i| |n1|)
                                            (|spadConstant| % 32)
                                            (QREFELT % 208))))
                                (LETT |i|
                                      (PROG1 (|inc_SI| |i|)
                                        (LETT #7# (CDR #7#))))
                                (GO G190) G191 (EXIT NIL))
                           (LETT |v0| (SPADCALL |nn1| (QREFELT % 209)))
                           (LETT |res| (SPADCALL |m| |v0| (QREFELT % 210)))
                           (LETT |bl| (QCDR |res|))
                           (EXIT
                            (COND ((NULL |bl|) NIL)
                                  (#13#
                                   (SEQ (LETT |s1| (|SPADfirst| |bl|))
                                        (LETT |d|
                                              (SPADCALL
                                               (PROGN
                                                (LETT #10# NIL)
                                                (SEQ (LETT |i| 1)
                                                     (LETT #11# (+ |nn1| 1))
                                                     G190
                                                     (COND
                                                      ((|greater_SI| |i| #11#)
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #10#
                                                             (CONS
                                                              (SPADCALL
                                                               (SPADCALL |s1|
                                                                         |i|
                                                                         (QREFELT
                                                                          %
                                                                          211))
                                                               (QREFELT % 212))
                                                              #10#))))
                                                     (LETT |i| (|inc_SI| |i|))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #10#))))
                                               (QREFELT % 115)))
                                        (LETT |j| 1) (LETT |rl| NIL)
                                        (SEQ (LETT |i| |n|) G190
                                             (COND ((< |i| 1) (GO G191)))
                                             (SEQ
                                              (LETT |li|
                                                    (COND
                                                     ((EQL
                                                       (SPADCALL |v| |i|
                                                                 (QREFELT %
                                                                          116))
                                                       0)
                                                      0)
                                                     ('T
                                                      (SEQ (LETT |jj| |j|)
                                                           (LETT |j| (+ |j| 1))
                                                           (EXIT
                                                            (SPADCALL
                                                             (SPADCALL |d|
                                                                       (SPADCALL
                                                                        |s1|
                                                                        |jj|
                                                                        (QREFELT
                                                                         %
                                                                         211))
                                                                       (QREFELT
                                                                        % 213))
                                                             (QREFELT %
                                                                      214)))))))
                                              (EXIT
                                               (LETT |rl| (CONS |li| |rl|))))
                                             (LETT |i| (+ |i| -1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT |rl|)))))))))))) 

(SDEFUN |RDEEFX;possible_sk|
        ((|w0| (F)) (|f| (F)) (|tk| (|Kernel| F)) (|x| (|Symbol|))
         (% (|List| (|List| (|Fraction| (|Integer|))))))
        (SPROG
         ((|wu| #1=(|Fraction| (|SparseUnivariatePolynomial| F))) (|fu| #1#)
          (|nfu| #2=(|SparseUnivariatePolynomial| F)) (|mindw| (|Integer|))
          (|mindf| (|Integer|)) (|dfu| #3=(|SparseUnivariatePolynomial| F))
          (|ddf| #4=(|NonNegativeInteger|)) (|dwu| #3#) (|ddw| #4#)
          (|mind| (|NonNegativeInteger|)) (#5=#:G617 NIL)
          (|vq| (|Vector| (|Fraction| (|Integer|))))
          (|mq| (|Matrix| (|Fraction| (|Integer|))))
          (|res| (|List| (|List| (|Fraction| (|Integer|)))))
          (|nwu1| (|SparseUnivariatePolynomial| F))
          (|nfu1| (|SparseUnivariatePolynomial| F))
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Fraction| (|Integer|))) #6="failed"))
            (|:| |basis| (|List| (|Vector| (|Fraction| (|Integer|)))))))
          (#7=#:G625 NIL) (|solq| (|Vector| (|Fraction| (|Integer|))))
          (|dnf| #4#) (|g| (|SparseUnivariatePolynomial| F))
          (|s| (|Fraction| (|Integer|))) (#8=#:G645 NIL) (|ss| (|Integer|))
          (|dnw| #4#) (|nwu| #2#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |tk| (QREFELT % 24)) (QREFELT % 8)
                       (QREFELT % 25))
             NIL)
            (#9='T
             (SEQ (LETT |wu| (SPADCALL |w0| |tk| (QREFELT % 35)))
                  (LETT |nwu| (SPADCALL |wu| (QREFELT % 38)))
                  (LETT |dwu| (SPADCALL |wu| (QREFELT % 39)))
                  (LETT |dnw| (SPADCALL |nwu| (QREFELT % 40)))
                  (LETT |ddw| (SPADCALL |dwu| (QREFELT % 40)))
                  (COND
                   ((EQL |dnw| 0)
                    (COND ((EQL |ddw| 0) (EXIT (|error| "impossible"))))))
                  (LETT |fu| (SPADCALL |f| |tk| (QREFELT % 35)))
                  (LETT |nfu| (SPADCALL |fu| (QREFELT % 38)))
                  (LETT |dfu| (SPADCALL |fu| (QREFELT % 39)))
                  (LETT |dnf| (SPADCALL |nfu| (QREFELT % 40)))
                  (LETT |ddf| (SPADCALL |dfu| (QREFELT % 40))) (LETT |mindf| 0)
                  (LETT |mindw| 0)
                  (COND
                   ((SPADCALL |tk| '|exp| (QREFELT % 22))
                    (SEQ (LETT |mindw| (SPADCALL |nwu| (QREFELT % 215)))
                         (LETT |mindw|
                               (COND ((> |mindw| 0) |mindw|)
                                     (#9#
                                      (- (SPADCALL |dwu| (QREFELT % 215))))))
                         (LETT |mind| (SPADCALL |dfu| (QREFELT % 215)))
                         (LETT |mindf|
                               (COND ((> |mind| 0) (- |mind|))
                                     (#9# (SPADCALL |nfu| (QREFELT % 215)))))
                         (EXIT
                          (COND
                           ((> |ddf| |mind|)
                            (SEQ
                             (LETT |dfu|
                                   (PROG2
                                       (LETT #5#
                                             (SPADCALL |dfu|
                                                       (SPADCALL
                                                        (|spadConstant| % 32)
                                                        |mind| (QREFELT % 43))
                                                       (QREFELT % 107)))
                                       (QCDR #5#)
                                     (|check_union2| (QEQCAR #5# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT % 7))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT % 7))
                                                      #10="failed")
                                                     #5#)))
                             (LETT |ddf| (- |ddf| |mind|))
                             (SEQ
                              (LETT |mind| (SPADCALL |dwu| (QREFELT % 215)))
                              (EXIT
                               (COND
                                ((> |mind| 0)
                                 (SEQ
                                  (LETT |dwu|
                                        (PROG2
                                            (LETT #5#
                                                  (SPADCALL |dwu|
                                                            (SPADCALL
                                                             (|spadConstant| %
                                                                             32)
                                                             |mind|
                                                             (QREFELT % 43))
                                                            (QREFELT % 107)))
                                            (QCDR #5#)
                                          (|check_union2| (QEQCAR #5# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 7))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (QREFELT % 7))
                                                           #10#)
                                                          #5#)))
                                  (EXIT
                                   (LETT |ddw|
                                         (SPADCALL |dwu| (QREFELT % 40)))))))))
                             (LETT |mind| (SPADCALL |nwu| (QREFELT % 215)))
                             (EXIT
                              (COND
                               ((> |mind| 0)
                                (SEQ
                                 (LETT |nwu|
                                       (PROG2
                                           (LETT #5#
                                                 (SPADCALL |nwu|
                                                           (SPADCALL
                                                            (|spadConstant| %
                                                                            32)
                                                            |mind|
                                                            (QREFELT % 43))
                                                           (QREFELT % 107)))
                                           (QCDR #5#)
                                         (|check_union2| (QEQCAR #5# 0)
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 7))
                                                         (|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 7))
                                                          #10#)
                                                         #5#)))
                                 (EXIT
                                  (LETT |dnw|
                                        (SPADCALL |nwu| (QREFELT % 40))))))))))
                           (#9#
                            (SEQ
                             (LETT |vq|
                                   (SPADCALL
                                    (LIST (SPADCALL |mindf| (QREFELT % 139))
                                          (SPADCALL (- |dnf| |ddf|)
                                                    (QREFELT % 139)))
                                    (QREFELT % 142)))
                             (LETT |mq|
                                   (SPADCALL
                                    (LIST
                                     (LIST (SPADCALL |mindw| (QREFELT % 139))
                                           (SPADCALL (- |dnw| |ddw|)
                                                     (QREFELT % 139)))
                                     (LIST (|spadConstant| % 216)
                                           (|spadConstant| % 216)))
                                    (QREFELT % 219)))
                             (LETT |sol| (SPADCALL |mq| |vq| (QREFELT % 221)))
                             (LETT |res|
                                   (COND ((QEQCAR (QCAR |sol|) 1) NIL)
                                         (#9#
                                          (SEQ
                                           (LETT |solq|
                                                 (PROG2 (LETT #7# (QCAR |sol|))
                                                     (QCDR #7#)
                                                   (|check_union2|
                                                    (QEQCAR #7# 0)
                                                    (|Vector|
                                                     (|Fraction| (|Integer|)))
                                                    (|Union|
                                                     (|Vector|
                                                      (|Fraction| (|Integer|)))
                                                     #6#)
                                                    #7#)))
                                           (EXIT
                                            (LIST
                                             (SPADCALL |solq|
                                                       (QREFELT % 222))))))))
                             (COND
                              ((< |mindf| 0)
                               (COND
                                ((> (- |dnf| |ddf|) 0)
                                 (EXIT
                                  (PROGN (LETT #8# |res|) (GO #11=#:G644)))))))
                             (COND
                              ((EQL |mindf| 0)
                               (SEQ
                                (LETT |nwu1|
                                      (SPADCALL |nwu|
                                                (SPADCALL
                                                 (SPADCALL |nwu| 0
                                                           (QREFELT % 41))
                                                 0 (QREFELT % 43))
                                                (QREFELT % 45)))
                                (EXIT
                                 (SPADCALL |vq| 1
                                           (SPADCALL
                                            (SPADCALL |nwu1| (QREFELT % 215))
                                            (QREFELT % 139))
                                           (QREFELT % 223)))))
                              ((> |mindf| 0)
                               (SPADCALL |vq| 1 (|spadConstant| % 224)
                                         (QREFELT % 223)))
                              (#9#
                               (COND
                                ((< (- |dnf| |ddf|) 0)
                                 (SPADCALL |vq| 2 (|spadConstant| % 224)
                                           (QREFELT % 223)))
                                (#9#
                                 (SEQ
                                  (LETT |nfu1|
                                        (SPADCALL |nfu| (QREFELT % 110)))
                                  (EXIT
                                   (SPADCALL |vq| 2
                                             (SPADCALL
                                              (-
                                               (SPADCALL |nfu1| (QREFELT % 40))
                                               |ddf|)
                                              (QREFELT % 139))
                                             (QREFELT % 223))))))))
                             (LETT |sol| (SPADCALL |mq| |vq| (QREFELT % 221)))
                             (EXIT
                              (COND
                               ((QEQCAR (QCAR |sol|) 1)
                                (PROGN (LETT #8# |res|) (GO #11#)))
                               (#9#
                                (SEQ
                                 (LETT |solq|
                                       (PROG2 (LETT #7# (QCAR |sol|))
                                           (QCDR #7#)
                                         (|check_union2| (QEQCAR #7# 0)
                                                         (|Vector|
                                                          (|Fraction|
                                                           (|Integer|)))
                                                         (|Union|
                                                          (|Vector|
                                                           (|Fraction|
                                                            (|Integer|)))
                                                          #6#)
                                                         #7#)))
                                 (EXIT
                                  (PROGN
                                   (LETT #8#
                                         (CONS
                                          (SPADCALL |solq| (QREFELT % 222))
                                          |res|))
                                   (GO #11#))))))))))))))
                  (COND
                   ((EQL |dnf| 0)
                    (COND
                     ((EQL |ddf| 0)
                      (COND
                       ((SPADCALL |tk| '|log| (QREFELT % 22)) (LETT |dnf| 1))
                       (#9# (PROGN (LETT #8# NIL) (GO #11#))))))))
                  (EXIT
                   (COND
                    ((> |ddf| 0)
                     (SEQ (LETT |g| (SPADCALL |dfu| |dwu| (QREFELT % 105)))
                          (LETT |s|
                                (COND
                                 ((> (SPADCALL |g| (QREFELT % 40)) 0)
                                  (SPADCALL |ddf| |ddw| (QREFELT % 225)))
                                 (#9# (SPADCALL |ddf| |dnw| (QREFELT % 225)))))
                          (EXIT
                           (LIST
                            (LIST |s|
                                  (SPADCALL (SPADCALL |mindf| (QREFELT % 139))
                                            (SPADCALL |s| |mindw|
                                                      (QREFELT % 226))
                                            (QREFELT % 227)))))))
                    (#9#
                     (SEQ (LETT |ss| 1)
                          (COND
                           ((> |ddw| 0)
                            (COND
                             ((> |dnw| 0) (PROGN (LETT #8# NIL) (GO #11#)))
                             (#9#
                              (SEQ (LETT |ss| -1) (LETT |dnw| |ddw|)
                                   (EXIT (LETT |nwu| |dwu|)))))))
                          (EXIT
                           (LIST
                            (LIST
                             (SPADCALL (* |ss| |dnf|) |dnw| (QREFELT % 225))
                             (|spadConstant| % 224))))))))))))
          #11# (EXIT #8#)))) 

(SDEFUN |RDEEFX;possible_w|
        ((|f2| (F)) (|w1| (F)) (|x| (|Symbol|)) (% (|List| F)))
        (SPROG
         ((|tk| (|Kernel| F))
          (|w1u| #1=(|Fraction| (|SparseUnivariatePolynomial| F))) (|f2u| #1#)
          (|nw1| #2=(|SparseUnivariatePolynomial| F))
          (|dw1| #3=(|SparseUnivariatePolynomial| F)) (|nf2| #2#) (|df2| #3#)
          (|r1| #4=(|SparseUnivariatePolynomial| F)) (|r2| #4#)
          (|w2u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|w2u2| (|Union| F "failed")) (|lc_nf2| (F)) (|lc_nw1| (F))
          (#5=#:G663 NIL) (|w2| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |tk| (|RDEEFX;top_kernel| (|spadConstant| % 32) |w1| |x| %))
            (LETT |w1u| (SPADCALL |w1| |tk| (QREFELT % 35)))
            (LETT |f2u| (SPADCALL |f2| |tk| (QREFELT % 35)))
            (LETT |nw1| (SPADCALL |w1u| (QREFELT % 38)))
            (LETT |dw1| (SPADCALL |w1u| (QREFELT % 39)))
            (LETT |nf2| (SPADCALL |f2u| (QREFELT % 38)))
            (LETT |df2| (SPADCALL |f2u| (QREFELT % 39)))
            (EXIT
             (COND
              ((SPADCALL |df2| |dw1| (QREFELT % 111))
               (SEQ
                (COND
                 ((> (SPADCALL |dw1| (QREFELT % 40)) 0)
                  (SEQ (LETT |r1| (SPADCALL |nw1| |dw1| (QREFELT % 189)))
                       (LETT |r2| (SPADCALL |nf2| |dw1| (QREFELT % 189)))
                       (LETT |w2u| (SPADCALL |r2| |r1| (QREFELT % 107)))
                       (EXIT
                        (COND
                         ((QEQCAR |w2u| 1)
                          (PROGN (LETT #5# NIL) (GO #6=#:G662)))
                         (#7='T
                          (SEQ
                           (LETT |w2u2|
                                 (SPADCALL (QCDR |w2u|) (QREFELT % 228)))
                           (EXIT
                            (COND
                             ((QEQCAR |w2u2| 1)
                              (PROGN (LETT #5# NIL) (GO #6#)))
                             (#7# (LETT |w2| (QCDR |w2u2|)))))))))))
                 (#7#
                  (SEQ (LETT |lc_nf2| (SPADCALL |nf2| (QREFELT % 103)))
                       (LETT |lc_nw1| (SPADCALL |nw1| (QREFELT % 103)))
                       (EXIT
                        (COND
                         ((OR (> (SPADCALL |nw1| (QREFELT % 40)) 1)
                              (NULL (SPADCALL |tk| '|log| (QREFELT % 22))))
                          (LETT |w2|
                                (SPADCALL |lc_nf2| |lc_nw1| (QREFELT % 66))))
                         ('T
                          (SEQ
                           (COND
                            ((EQL (SPADCALL |nf2| (QREFELT % 40)) 1)
                             (COND
                              ((SPADCALL (SPADCALL |lc_nf2| |x| (QREFELT % 61))
                                         (|spadConstant| % 74) (QREFELT % 130))
                               (EXIT (PROGN (LETT #5# NIL) (GO #6#)))))))
                           (EXIT
                            (LETT |w2|
                                  (SPADCALL (|spadConstant| % 32) |lc_nw1|
                                            (QREFELT % 66)))))))))))
                (EXIT
                 (COND
                  ((SPADCALL |w2| (|spadConstant| % 74) (QREFELT % 78)) NIL)
                  (#7# (LIST |w2|))))))
              (#7# NIL)))))
          #6# (EXIT #5#)))) 

(SDEFUN |RDEEFX;gen_irr_log_cands|
        ((|a| (F)) (|f| (F)) (|f2| (F)) (|w1| (F)) (|vlst| (|List| F))
         (|ulst| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (|res|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|lw2| (|List| F)) (|w2| (F)) (|lw2'| (F)) (|v'| (F)) (#1=#:G691 NIL)
          (#2=#:G692 NIL) (|dvvec| (|Vector| F))
          (|coeffs| #3=(|List| (|Integer|))) (|a1| (F)) (|w| (F))
          (|wu| (|Fraction| (|SparseUnivariatePolynomial| F))) (|coeffs2| #3#)
          (#4=#:G696 NIL) (#5=#:G695 NIL) (|k2i| NIL) (#6=#:G694 NIL)
          (#7=#:G693 NIL) (|w_cor| (F))
          (|su| (|Union| (|Vector| (|Fraction| (|Integer|))) "failed"))
          (|sv| (|Vector| (|Fraction| (|Integer|))))
          (|cd| (|Record| (|:| |num| #3#) (|:| |den| #8=(|Integer|))))
          (|d| #8#) (|vli| #3#) (|gl| (|Integer|)) (#9=#:G698 NIL) (|ki| NIL)
          (#10=#:G697 NIL) (|uu1| (F)) (|ui| NIL) (#11=#:G701 NIL) (|vi| NIL)
          (#12=#:G700 NIL) (|li| NIL) (#13=#:G699 NIL) (|tt| (F)) (|i| NIL)
          (#14=#:G702 NIL) (|ai| (F)) (|uu| (F)))
         (SEQ (LETT |lw2| (|RDEEFX;possible_w| |f2| |w1| |x| %))
              (EXIT
               (COND ((NULL |lw2|) |res|)
                     (#15='T
                      (SEQ (LETT |w2| (|SPADfirst| |lw2|))
                           (LETT |lw2'|
                                 (SPADCALL (SPADCALL |w2| |x| (QREFELT % 61))
                                           |w2| (QREFELT % 66)))
                           (LETT |v'|
                                 (SPADCALL |lw2'|
                                           (SPADCALL
                                            (SPADCALL |w1| |x| (QREFELT % 61))
                                            |w1| (QREFELT % 66))
                                           (QREFELT % 72)))
                           (LETT |dvvec|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #1# NIL)
                                   (SEQ (LETT |vi| NIL) (LETT #2# |vlst|) G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN
                                               (LETT |vi| (CAR #2#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #1#
                                                (CONS
                                                 (SPADCALL |vi| |x|
                                                           (QREFELT % 61))
                                                 #1#))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT (NREVERSE #1#))))
                                  (QREFELT % 81)))
                           (LETT |su| (SPADCALL |dvvec| |v'| (QREFELT % 84)))
                           (EXIT
                            (COND ((QEQCAR |su| 1) |res|)
                                  (#15#
                                   (SEQ (LETT |sv| (QCDR |su|))
                                        (LETT |cd|
                                              (SPADCALL |sv| (QREFELT % 88)))
                                        (LETT |d| (QCDR |cd|))
                                        (EXIT
                                         (COND
                                          ((SPADCALL |d| 1 (QREFELT % 89))
                                           |res|)
                                          (#15#
                                           (SEQ (LETT |coeffs| (QCAR |cd|))
                                                (LETT |a1|
                                                      (SPADCALL |a|
                                                                (|spadConstant|
                                                                 % 32)
                                                                (QREFELT %
                                                                         77)))
                                                (LETT |w|
                                                      (SPADCALL
                                                       (SPADCALL |w1| |w2|
                                                                 (QREFELT %
                                                                          64))
                                                       (QREFELT % 47)))
                                                (LETT |tt|
                                                      (SPADCALL |f| |w|
                                                                (QREFELT %
                                                                         72)))
                                                (LETT |wu|
                                                      (SPADCALL |w| |k|
                                                                (QREFELT %
                                                                         35)))
                                                (LETT |su|
                                                      (SPADCALL |dvvec| |lw2'|
                                                                (QREFELT %
                                                                         84)))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |su| 1)
                                                   (|error| "impossible"))
                                                  (#15#
                                                   (SEQ (LETT |sv| (QCDR |su|))
                                                        (LETT |cd|
                                                              (SPADCALL |sv|
                                                                        (QREFELT
                                                                         %
                                                                         88)))
                                                        (LETT |d| (QCDR |cd|))
                                                        (EXIT
                                                         (COND
                                                          ((SPADCALL |d| 1
                                                                     (QREFELT %
                                                                              89))
                                                           (|error|
                                                            "impossible"))
                                                          (#15#
                                                           (SEQ
                                                            (LETT |coeffs2|
                                                                  (QCAR |cd|))
                                                            (LETT |w_cor|
                                                                  (SPADCALL
                                                                   |w2|
                                                                   (QREFELT %
                                                                            47)))
                                                            (SEQ
                                                             (LETT |ui| NIL)
                                                             (LETT #4# |ulst|)
                                                             (LETT |vi| NIL)
                                                             (LETT #5# |vlst|)
                                                             (LETT |k2i| NIL)
                                                             (LETT #6#
                                                                   |coeffs2|)
                                                             (LETT |ki| NIL)
                                                             (LETT #7#
                                                                   |coeffs|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #7#)
                                                                   (PROGN
                                                                    (LETT |ki|
                                                                          (CAR
                                                                           #7#))
                                                                    NIL)
                                                                   (ATOM #6#)
                                                                   (PROGN
                                                                    (LETT |k2i|
                                                                          (CAR
                                                                           #6#))
                                                                    NIL)
                                                                   (ATOM #5#)
                                                                   (PROGN
                                                                    (LETT |vi|
                                                                          (CAR
                                                                           #5#))
                                                                    NIL)
                                                                   (ATOM #4#)
                                                                   (PROGN
                                                                    (LETT |ui|
                                                                          (CAR
                                                                           #4#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (LETT |tt|
                                                                    (SPADCALL
                                                                     |tt|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        |ki|
                                                                        (QREFELT
                                                                         % 73))
                                                                       |a1|
                                                                       (QREFELT
                                                                        % 64))
                                                                      |vi|
                                                                      (QREFELT
                                                                       % 64))
                                                                     (QREFELT %
                                                                              77)))
                                                              (EXIT
                                                               (LETT |w_cor|
                                                                     (SPADCALL
                                                                      |w_cor|
                                                                      (SPADCALL
                                                                       |ui|
                                                                       (-
                                                                        |k2i|)
                                                                       (QREFELT
                                                                        % 79))
                                                                      (QREFELT
                                                                       %
                                                                       64)))))
                                                             (LETT #7#
                                                                   (PROG1
                                                                       (CDR
                                                                        #7#)
                                                                     (LETT #6#
                                                                           (PROG1
                                                                               (CDR
                                                                                #6#)
                                                                             (LETT
                                                                              #5#
                                                                              (PROG1
                                                                                  (CDR
                                                                                   #5#)
                                                                                (LETT
                                                                                 #4#
                                                                                 (CDR
                                                                                  #4#))))))))
                                                             (GO G190) G191
                                                             (EXIT NIL))
                                                            (EXIT
                                                             (COND
                                                              ((SPADCALL
                                                                (SPADCALL
                                                                 |w_cor| |x|
                                                                 (QREFELT %
                                                                          61))
                                                                (|spadConstant|
                                                                 % 74)
                                                                (QREFELT %
                                                                         130))
                                                               (|error|
                                                                "impossible"))
                                                              (#15#
                                                               (SEQ
                                                                (LETT |su|
                                                                      (SPADCALL
                                                                       |dvvec|
                                                                       (SPADCALL
                                                                        |tt|
                                                                        |x|
                                                                        (QREFELT
                                                                         % 61))
                                                                       (QREFELT
                                                                        % 84)))
                                                                (EXIT
                                                                 (COND
                                                                  ((QEQCAR |su|
                                                                           1)
                                                                   |res|)
                                                                  (#15#
                                                                   (SEQ
                                                                    (LETT |sv|
                                                                          (QCDR
                                                                           |su|))
                                                                    (LETT |cd|
                                                                          (SPADCALL
                                                                           |sv|
                                                                           (QREFELT
                                                                            %
                                                                            88)))
                                                                    (LETT |d|
                                                                          (QCDR
                                                                           |cd|))
                                                                    (EXIT
                                                                     (COND
                                                                      ((SPADCALL
                                                                        |d| 1
                                                                        (QREFELT
                                                                         % 89))
                                                                       |res|)
                                                                      (#15#
                                                                       (SEQ
                                                                        (LETT
                                                                         |vli|
                                                                         (QCAR
                                                                          |cd|))
                                                                        (LETT
                                                                         |uu|
                                                                         (SPADCALL
                                                                          (|spadConstant|
                                                                           %
                                                                           32)
                                                                          (QREFELT
                                                                           %
                                                                           47)))
                                                                        (LETT
                                                                         |uu1|
                                                                         (|spadConstant|
                                                                          %
                                                                          32))
                                                                        (LETT
                                                                         |gl|
                                                                         (SPADCALL
                                                                          |coeffs|
                                                                          (QREFELT
                                                                           %
                                                                           115)))
                                                                        (COND
                                                                         ((>
                                                                           |gl|
                                                                           1)
                                                                          (SEQ
                                                                           (LETT
                                                                            |ui|
                                                                            NIL)
                                                                           (LETT
                                                                            #9#
                                                                            |ulst|)
                                                                           (LETT
                                                                            |ki|
                                                                            NIL)
                                                                           (LETT
                                                                            #10#
                                                                            |coeffs|)
                                                                           G190
                                                                           (COND
                                                                            ((OR
                                                                              (ATOM
                                                                               #10#)
                                                                              (PROGN
                                                                               (LETT
                                                                                |ki|
                                                                                (CAR
                                                                                 #10#))
                                                                               NIL)
                                                                              (ATOM
                                                                               #9#)
                                                                              (PROGN
                                                                               (LETT
                                                                                |ui|
                                                                                (CAR
                                                                                 #9#))
                                                                               NIL))
                                                                             (GO
                                                                              G191)))
                                                                           (SEQ
                                                                            (EXIT
                                                                             (LETT
                                                                              |uu1|
                                                                              (SPADCALL
                                                                               (SPADCALL
                                                                                |ui|
                                                                                (|quotient_INT|
                                                                                 |ki|
                                                                                 |gl|)
                                                                                (QREFELT
                                                                                 %
                                                                                 79))
                                                                               |uu1|
                                                                               (QREFELT
                                                                                %
                                                                                64)))))
                                                                           (LETT
                                                                            #10#
                                                                            (PROG1
                                                                                (CDR
                                                                                 #10#)
                                                                              (LETT
                                                                               #9#
                                                                               (CDR
                                                                                #9#))))
                                                                           (GO
                                                                            G190)
                                                                           G191
                                                                           (EXIT
                                                                            NIL))))
                                                                        (SEQ
                                                                         (LETT
                                                                          |ui|
                                                                          NIL)
                                                                         (LETT
                                                                          #11#
                                                                          |ulst|)
                                                                         (LETT
                                                                          |vi|
                                                                          NIL)
                                                                         (LETT
                                                                          #12#
                                                                          |vlst|)
                                                                         (LETT
                                                                          |li|
                                                                          NIL)
                                                                         (LETT
                                                                          #13#
                                                                          |vli|)
                                                                         G190
                                                                         (COND
                                                                          ((OR
                                                                            (ATOM
                                                                             #13#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |li|
                                                                              (CAR
                                                                               #13#))
                                                                             NIL)
                                                                            (ATOM
                                                                             #12#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |vi|
                                                                              (CAR
                                                                               #12#))
                                                                             NIL)
                                                                            (ATOM
                                                                             #11#)
                                                                            (PROGN
                                                                             (LETT
                                                                              |ui|
                                                                              (CAR
                                                                               #11#))
                                                                             NIL))
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (LETT
                                                                           |tt|
                                                                           (SPADCALL
                                                                            |tt|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              |li|
                                                                              (QREFELT
                                                                               %
                                                                               73))
                                                                             |vi|
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (QREFELT
                                                                             %
                                                                             77)))
                                                                          (EXIT
                                                                           (LETT
                                                                            |uu|
                                                                            (SPADCALL
                                                                             |uu|
                                                                             (SPADCALL
                                                                              |ui|
                                                                              (-
                                                                               |li|)
                                                                              (QREFELT
                                                                               %
                                                                               79))
                                                                             (QREFELT
                                                                              %
                                                                              64)))))
                                                                         (LETT
                                                                          #13#
                                                                          (PROG1
                                                                              (CDR
                                                                               #13#)
                                                                            (LETT
                                                                             #12#
                                                                             (PROG1
                                                                                 (CDR
                                                                                  #12#)
                                                                               (LETT
                                                                                #11#
                                                                                (CDR
                                                                                 #11#))))))
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          NIL))
                                                                        (SEQ
                                                                         (LETT
                                                                          |i|
                                                                          0)
                                                                         (LETT
                                                                          #14#
                                                                          (-
                                                                           |gl|
                                                                           1))
                                                                         G190
                                                                         (COND
                                                                          ((|greater_SI|
                                                                            |i|
                                                                            #14#)
                                                                           (GO
                                                                            G191)))
                                                                         (SEQ
                                                                          (LETT
                                                                           |ai|
                                                                           (SPADCALL
                                                                            |a|
                                                                            (SPADCALL
                                                                             (SPADCALL
                                                                              |i|
                                                                              (QREFELT
                                                                               %
                                                                               73))
                                                                             (SPADCALL
                                                                              |gl|
                                                                              (QREFELT
                                                                               %
                                                                               73))
                                                                             (QREFELT
                                                                              %
                                                                              66))
                                                                            (QREFELT
                                                                             %
                                                                             77)))
                                                                          (LETT
                                                                           |res|
                                                                           (CONS
                                                                            (VECTOR
                                                                             0
                                                                             (|spadConstant|
                                                                              %
                                                                              108)
                                                                             |w_cor|
                                                                             0
                                                                             (|spadConstant|
                                                                              %
                                                                              74)
                                                                             (|spadConstant|
                                                                              %
                                                                              102)
                                                                             |wu|
                                                                             (|spadConstant|
                                                                              %
                                                                              196)
                                                                             |uu|
                                                                             0
                                                                             (SPADCALL
                                                                              |tt|
                                                                              (QREFELT
                                                                               %
                                                                               47))
                                                                             |ai|)
                                                                            |res|))
                                                                          (EXIT
                                                                           (LETT
                                                                            |uu|
                                                                            (SPADCALL
                                                                             |uu|
                                                                             |uu1|
                                                                             (QREFELT
                                                                              %
                                                                              66)))))
                                                                         (LETT
                                                                          |i|
                                                                          (|inc_SI|
                                                                           |i|))
                                                                         (GO
                                                                          G190)
                                                                         G191
                                                                         (EXIT
                                                                          NIL))
                                                                        (EXIT
                                                                         |res|)))))))))))))))))))))))))))))))))))) 

(SDEFUN |RDEEFX;irrational_gamma_candidates|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F)) (|vlst| (|List| F))
         (|ulst| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (|res|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|n1| (|NonNegativeInteger|)) (#1=#:G737 NIL) (#2=#:G738 NIL)
          (|nlk| (|List| (|Kernel| F))) (|f| (F)) (#3=#:G739 NIL)
          (|nfr| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|nf1| (|SparseUnivariatePolynomial| F)) (|ck| (F)) (|f2| (F))
          (#4=#:G736 NIL) (|cl| (|List| F)) (|rl| (|List| (|Integer|)))
          (|kk| NIL) (#5=#:G741 NIL) (|li| NIL) (#6=#:G740 NIL) (|ak| (F))
          (|w0| (F)) (|tk| (|Kernel| F))
          (|lsk| (|List| #7=(|List| (|Fraction| (|Integer|))))) (|sk| NIL)
          (#8=#:G742 NIL) (|#G211| #7#) (|sq| NIL) (|#G212| #7#) (|kmq| NIL)
          (|s| #9=(|Integer|)) (|km| #9#) (|a| (F)) (|w1| (F)))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |k| '|log| (QREFELT % 22))
              (COND
               ((SPADCALL |denf| (|spadConstant| % 108) (QREFELT % 111))
                (COND
                 ((EQL (SPADCALL |nf| (QREFELT % 40)) 1)
                  (EXIT
                   (SEQ (LETT |n1| (SPADCALL |k| (QREFELT % 19)))
                        (LETT |nlk|
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |kk| NIL)
                                    (LETT #2#
                                          (SPADCALL
                                           (SPADCALL |nf| 0 (QREFELT % 41))
                                           (QREFELT % 11)))
                                    G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |kk| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((COND
                                         ((SPADCALL
                                           (SPADCALL
                                            (SPADCALL |kk| (QREFELT % 60)) |x|
                                            (QREFELT % 61))
                                           (|spadConstant| % 74)
                                           (QREFELT % 130))
                                          (EQL (SPADCALL |kk| (QREFELT % 19))
                                               |n1|))
                                         (#10='T NIL))
                                        (LETT #1# (CONS |kk| #1#))))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#)))))
                        (LETT |nlk| (CONS |k| |nlk|))
                        (LETT |f|
                              (SPADCALL (SPADCALL |nf| |denf| (QREFELT % 195))
                                        |k| (QREFELT % 59)))
                        (LETT |f2| |f|) (LETT |cl| NIL)
                        (SEQ (LETT |kk| NIL) (LETT #3# |nlk|) G190
                             (COND
                              ((OR (ATOM #3#)
                                   (PROGN (LETT |kk| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL (SPADCALL |kk| '|log| (QREFELT % 22)))
                                 (COND
                                  ((SPADCALL |kk| '|exp| (QREFELT % 22))
                                   (|error| "unimplemented"))
                                  ('T
                                   (PROGN (LETT #4# |res|) (GO #11=#:G735)))))
                                ('T
                                 (SEQ
                                  (LETT |nfr|
                                        (SPADCALL |f2| |kk| (QREFELT % 35)))
                                  (EXIT
                                   (COND
                                    ((SPADCALL (SPADCALL |nfr| (QREFELT % 39))
                                               (|spadConstant| % 108)
                                               (QREFELT % 109))
                                     (PROGN (LETT #4# |res|) (GO #11#)))
                                    ('T
                                     (SEQ
                                      (LETT |nf1|
                                            (SPADCALL |nfr| (QREFELT % 38)))
                                      (EXIT
                                       (COND
                                        ((EQL (SPADCALL |nf1| (QREFELT % 40))
                                              0)
                                         (|error| "impossible"))
                                        ((SPADCALL
                                          (SPADCALL |nf1| (QREFELT % 40)) 1
                                          (QREFELT % 229))
                                         (PROGN (LETT #4# |res|) (GO #11#)))
                                        ('T
                                         (SEQ
                                          (LETT |ck|
                                                (SPADCALL |nf1|
                                                          (QREFELT % 103)))
                                          (LETT |f2|
                                                (SPADCALL |nf1| 0
                                                          (QREFELT % 41)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |ck| |x|
                                                        (QREFELT % 61))
                                              (|spadConstant| % 74)
                                              (QREFELT % 130))
                                             (PROGN
                                              (LETT #4# |res|)
                                              (GO #11#)))
                                            ('T
                                             (LETT |cl|
                                                   (CONS |ck|
                                                         |cl|))))))))))))))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |cl| (NREVERSE |cl|))
                        (LETT |rl| (|RDEEFX;solve_for_ratios| |cl| %))
                        (EXIT
                         (COND
                          ((SPADCALL (ELT % 231) |rl| (QREFELT % 233)) |res|)
                          (#10#
                           (SEQ (LETT |w0| (|spadConstant| % 32))
                                (SEQ (LETT |kk| NIL) (LETT #5# |nlk|)
                                     (LETT |li| NIL) (LETT #6# |rl|) G190
                                     (COND
                                      ((OR (ATOM #6#)
                                           (PROGN (LETT |li| (CAR #6#)) NIL)
                                           (ATOM #5#)
                                           (PROGN (LETT |kk| (CAR #5#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |ak|
                                            (SPADCALL
                                             (SPADCALL |kk| (QREFELT % 27)) 1
                                             (QREFELT % 29)))
                                      (EXIT
                                       (LETT |w0|
                                             (SPADCALL |w0|
                                                       (SPADCALL |ak| |li|
                                                                 (QREFELT %
                                                                          79))
                                                       (QREFELT % 64)))))
                                     (LETT #6#
                                           (PROG1 (CDR #6#)
                                             (LETT #5# (CDR #5#))))
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |tk|
                                      (|RDEEFX;top_kernel|
                                       (|spadConstant| % 32) |w0| |x| %))
                                (LETT |lsk|
                                      (|RDEEFX;possible_sk| |w0| |f2| |tk| |x|
                                       %))
                                (SEQ (LETT |sk| NIL) (LETT #8# |lsk|) G190
                                     (COND
                                      ((OR (ATOM #8#)
                                           (PROGN (LETT |sk| (CAR #8#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (PROGN
                                       (LETT |#G211| |sk|)
                                       (LETT |#G212| |#G211|)
                                       (LETT |sq| (|SPADfirst| |#G212|))
                                       (LETT |#G212| (CDR |#G212|))
                                       (LETT |kmq| (|SPADfirst| |#G212|))
                                       |#G211|)
                                      (EXIT
                                       (COND
                                        ((OR
                                          (SPADCALL |sq| (|spadConstant| % 224)
                                                    (QREFELT % 234))
                                          (OR
                                           (SPADCALL
                                            (SPADCALL |sq| (QREFELT % 212)) 1
                                            (QREFELT % 89))
                                           (SPADCALL
                                            (SPADCALL |kmq| (QREFELT % 212)) 1
                                            (QREFELT % 89))))
                                         "skip")
                                        ('T
                                         (SEQ
                                          (LETT |s|
                                                (SPADCALL |sq|
                                                          (QREFELT % 235)))
                                          (LETT |km|
                                                (SPADCALL |kmq|
                                                          (QREFELT % 235)))
                                          (LETT |a| (|SPADfirst| |cl|))
                                          (LETT |a|
                                                (SPADCALL
                                                 (SPADCALL |a|
                                                           (SPADCALL |s|
                                                                     (SPADCALL
                                                                      (|SPADfirst|
                                                                       |rl|)
                                                                      (QREFELT
                                                                       % 73))
                                                                     (QREFELT %
                                                                              236))
                                                           (QREFELT % 66))
                                                 (|spadConstant| % 32)
                                                 (QREFELT % 72)))
                                          (LETT |w1|
                                                (SPADCALL
                                                 (SPADCALL |w0| |s|
                                                           (QREFELT % 79))
                                                 (SPADCALL
                                                  (SPADCALL |tk|
                                                            (QREFELT % 60))
                                                  |km| (QREFELT % 79))
                                                 (QREFELT % 64)))
                                          (EXIT
                                           (LETT |res|
                                                 (|RDEEFX;gen_irr_log_cands|
                                                  |a| |f| |f2| |w1| |vlst|
                                                  |ulst| |k| |x| |res|
                                                  %))))))))
                                     (LETT #8# (CDR #8#)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |res|)))))))))))))
            (EXIT |res|)))
          #11# (EXIT #4#)))) 

(SDEFUN |RDEEFX;gammas1|
        ((|nf| (|SparseUnivariatePolynomial| F)) (|a| (|Integer|))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|denf1| (|SparseUnivariatePolynomial| F)) (|gexp| (|Integer|))
         (|n2| (|Integer|)) (|vlst| (|List| F)) (|ulst| (|List| F))
         (|k| (|Kernel| F)) (|x| (|Symbol|))
         (|res|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|t| (|Kernel| F)) (|nfp1| (|SparseUnivariatePolynomial| F))
          (|r| (F)) (|f_res| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|rfacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #1=(|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|e_tt| (|List| F)) (|fac| NIL) (#2=#:G761 NIL) (|f1| #1#)
          (|deg1| (|NonNegativeInteger|)) (|tt| (F))
          (|f2| (|SparseUnivariatePolynomial| F)) (#3=#:G760 NIL) (|cfac| (F))
          (|nf1| (|SparseUnivariatePolynomial| F))
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| F))))
         (SEQ (LETT |t| (SPADCALL (SPADCALL (QREFELT % 56)) (QREFELT % 57)))
              (LETT |nfp1|
                    (SPADCALL
                     (SPADCALL (SPADCALL |nf| (QREFELT % 191)) |denf1|
                               (QREFELT % 97))
                     (SPADCALL
                      (SPADCALL (SPADCALL |gexp| (QREFELT % 73)) |nf|
                                (QREFELT % 135))
                      (SPADCALL |denf1| (QREFELT % 191)) (QREFELT % 97))
                     (QREFELT % 45)))
              (LETT |r|
                    (SPADCALL
                     (SPADCALL |nf|
                               (SPADCALL
                                (SPADCALL (SPADCALL |t| (QREFELT % 60))
                                          (QREFELT % 44))
                                |denf| (QREFELT % 97))
                               (QREFELT % 48))
                     |nfp1| (QREFELT % 192)))
              (LETT |f_res|
                    (SPADCALL
                     (SPADCALL (SPADCALL |r| |t| (QREFELT % 35))
                               (QREFELT % 38))
                     (QREFELT % 125)))
              (LETT |rfacs| (SPADCALL |f_res| (QREFELT % 129)))
              (LETT |e_tt|
                    (COND
                     ((EQL (SPADCALL |nf| (QREFELT % 40)) 0)
                      (LIST (|spadConstant| % 74)))
                     ((EQL (SPADCALL |nf| (QREFELT % 40))
                           (SPADCALL |denf| (QREFELT % 40)))
                      (SEQ
                       (LETT |tt|
                             (SPADCALL
                              (SPADCALL (SPADCALL |nf| (QREFELT % 103))
                                        (SPADCALL |denf| (QREFELT % 103))
                                        (QREFELT % 66))
                              (QREFELT % 47)))
                       (LETT |nf1|
                             (SPADCALL |nf|
                                       (SPADCALL (SPADCALL |tt| (QREFELT % 44))
                                                 |denf| (QREFELT % 97))
                                       (QREFELT % 48)))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |nf1| (QREFELT % 40)) 0) (LIST |tt|))
                         (#4='T NIL)))))
                     (#4# NIL)))
              (COND
               ((NULL (NULL |e_tt|))
                (SEQ (LETT |tt| (|SPADfirst| |e_tt|))
                     (LETT |nf1|
                           (SPADCALL |nf|
                                     (SPADCALL (SPADCALL |tt| (QREFELT % 44))
                                               |denf| (QREFELT % 97))
                                     (QREFELT % 48)))
                     (LETT |fnf| (SPADCALL |nf1| NIL (QREFELT % 237)))
                     (EXIT
                      (LETT |res|
                            (|RDEEFX;gamma_candidate| |fnf| |nf1| |denf|
                             |denf1| |gexp| |a| |tt| (|spadConstant| % 102)
                             |vlst| |ulst| |k| |x| |res| %))))))
              (SEQ (LETT |fac| NIL) (LETT #2# |rfacs|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fac| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |f1| (QVELT |fac| 1))
                          (LETT |deg1| (SPADCALL |f1| (QREFELT % 40)))
                          (EXIT
                           (COND
                            ((EQL |deg1| 1)
                             (SEQ
                              (LETT |tt|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |f1| 0 (QREFELT % 41))
                                               (SPADCALL |f1| 1 (QREFELT % 41))
                                               (QREFELT % 66))
                                     (QREFELT % 47)))
                              (LETT |nf1|
                                    (SPADCALL |nf|
                                              (SPADCALL
                                               (SPADCALL |tt| (QREFELT % 44))
                                               |denf| (QREFELT % 97))
                                              (QREFELT % 48)))
                              (EXIT
                               (COND
                                ((< (* 2 (QVELT |fac| 2))
                                    (SPADCALL |nf1| (QREFELT % 40)))
                                 (PROGN (LETT #3# |$NoValue|) (GO #5=#:G749)))
                                ('T
                                 (SEQ
                                  (LETT |fnf| (SPADCALL |nf1| (QREFELT % 239)))
                                  (EXIT
                                   (LETT |res|
                                         (|RDEEFX;gamma_candidate| |fnf| |nf1|
                                          |denf| |denf1| |gexp| |a| |tt|
                                          (|spadConstant| % 102) |vlst| |ulst|
                                          |k| |x| |res| %)))))))))
                            ((< (QVELT |fac| 2) |n2|)
                             (PROGN (LETT #3# |$NoValue|) (GO #5#)))
                            ((EQL |deg1| 2)
                             (SEQ
                              (LETT |tt|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |f1| 1 (QREFELT % 41))
                                               (SPADCALL
                                                (SPADCALL 2 (QREFELT % 73))
                                                (SPADCALL |f1| (QREFELT % 103))
                                                (QREFELT % 64))
                                               (QREFELT % 66))
                                     (QREFELT % 47)))
                              (LETT |f2|
                                    (SPADCALL |f1| (QREFELT % 92)
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| % 32)
                                                         1 (QREFELT % 43))
                                               (SPADCALL |tt| (QREFELT % 44))
                                               (QREFELT % 48))
                                              (QREFELT % 93)))
                              (COND
                               ((NULL
                                 (SPADCALL
                                  (CONS #'|RDEEFX;gammas1!0| (VECTOR % |x|))
                                  (SPADCALL |f2| (QREFELT % 94))
                                  (QREFELT % 96)))
                                (EXIT (PROGN (LETT #3# |$NoValue|) (GO #5#)))))
                              (LETT |cfac| (SPADCALL |f2| (QREFELT % 240)))
                              (LETT |nf1|
                                    (SPADCALL |nf|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |tt| |cfac|
                                                          (QREFELT % 72))
                                                (QREFELT % 44))
                                               |denf| (QREFELT % 97))
                                              (QREFELT % 48)))
                              (LETT |fnf| (SPADCALL |nf1| (QREFELT % 239)))
                              (EXIT
                               (LETT |res|
                                     (|RDEEFX;gamma_candidate| |fnf| |nf1|
                                      |denf| |denf1| |gexp| |a| |tt| |f2|
                                      |vlst| |ulst| |k| |x| |res| %)))))))))
                    #5# (EXIT #3#))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |RDEEFX;gammas1!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |c| |x| (QREFELT % 61)) (|spadConstant| % 74)
                      (QREFELT % 78)))))) 

(SDEFUN |RDEEFX;special_candidates|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|denf1| (|SparseUnivariatePolynomial| F)) (|gexp| (|Integer|))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|))
         (%
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F)))))
        (SPROG
         ((|n2| #1=(|NonNegativeInteger|)) (|lc| (F))
          (|rcu| (|Union| (|Integer|) "failed")) (#2=#:G787 NIL)
          (|a| (|Integer|)) (|n1| #1#) (|n3| (|NonNegativeInteger|))
          (|l| (|Integer|)) (|ts| #3=(|Symbol|)) (|t| #4=(|Kernel| F))
          (|nfp1| #5=(|SparseUnivariatePolynomial| F)) (|denfp1| #5#)
          (|nnp| #6=(|SparseUnivariatePolynomial| F)) (|nfp2| #5#)
          (|denfp2| #5#) (|denf2| (|SparseUnivariatePolynomial| F))
          (|t1| #7=(|SparseUnivariatePolynomial| F)) (|ct1| (F)) (|t2| #7#)
          (|t3| #7#) (|nnp2| (|SparseUnivariatePolynomial| F))
          (|ratl| (|List| (|Fraction| (|Integer|)))) (|r0| NIL) (#8=#:G788 NIL)
          (#9=#:G785 NIL) (|bs| #3#) (|bk| #4#) (|tx_plus_b| #6#)
          (|f_res1| (F))
          (|lsol|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| (|Integer|)))
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F)))))
          (|sol| NIL) (#10=#:G789 NIL) (|ru| (|Union| (|Integer|) "failed"))
          (#11=#:G786 NIL) (|ri| (|Integer|)) (|nn| #6#)
          (|res1|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |res1|
                  (|RDEEFX;special_ei_candidates| |nf| |denf| |vlst| |ulst| |k|
                   |x| %))
            (LETT |res1|
                  (|RDEEFX;irrational_gamma_candidates| |nf| |denf| |vlst|
                   |ulst| |k| |x| |res1| %))
            (LETT |a| 0) (LETT |n1| (SPADCALL |nf| (QREFELT % 40)))
            (LETT |n2| (SPADCALL |denf| (QREFELT % 40)))
            (EXIT
             (COND ((EQL |n1| 1) |res1|)
                   (#12='T
                    (SEQ
                     (COND
                      ((EQL |n1| (+ |n2| 1))
                       (COND
                        ((NULL (SPADCALL |k| '|log| (QREFELT % 22)))
                         (PROGN (LETT #2# |res1|) (GO #13=#:G784)))
                        ('T
                         (SEQ (LETT |lc| (SPADCALL |nf| (QREFELT % 103)))
                              (LETT |rcu| (SPADCALL |lc| (QREFELT % 132)))
                              (EXIT
                               (COND
                                ((QEQCAR |rcu| 1)
                                 (PROGN (LETT #2# |res1|) (GO #13#)))
                                (#12#
                                 (SEQ (LETT |a| (QCDR |rcu|))
                                      (LETT |nf|
                                            (SPADCALL |nf|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL |a|
                                                                  (QREFELT %
                                                                           73))
                                                        1 (QREFELT % 43))
                                                       |denf| (QREFELT % 97))
                                                      (QREFELT % 45)))
                                      (EXIT (LETT |n1| |n2|)))))))))))
                     (LETT |n3| (MAX |n1| |n2|)) (LETT |l| (GCD |gexp| |n3|))
                     (EXIT
                      (COND ((EQL |l| 1) |res1|)
                            (#12#
                             (SEQ (LETT |ts| (SPADCALL (QREFELT % 56)))
                                  (LETT |t| (SPADCALL |ts| (QREFELT % 57)))
                                  (LETT |nfp1| (SPADCALL |nf| (QREFELT % 191)))
                                  (LETT |denfp1|
                                        (SPADCALL |denf1| (QREFELT % 191)))
                                  (COND
                                   ((> |n1| |n2|)
                                    (COND
                                     ((SPADCALL |k| '|log| (QREFELT % 22))
                                      (EXIT
                                       (SEQ
                                        (LETT |nnp|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |nfp1| |denf1|
                                                          (QREFELT % 97))
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |gexp|
                                                            (QREFELT % 73))
                                                  |denfp1| (QREFELT % 135))
                                                 |nf| (QREFELT % 97))
                                                (QREFELT % 45))
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |t| (QREFELT % 60))
                                                  (QREFELT % 44))
                                                 |denf| (QREFELT % 97))
                                                |denf1| (QREFELT % 97))
                                               (QREFELT % 48)))
                                        (EXIT
                                         (COND
                                          ((ODDP |l|)
                                           (SEQ
                                            (LETT |nfp2|
                                                  (SPADCALL |nfp1|
                                                            (QREFELT % 191)))
                                            (LETT |denfp2|
                                                  (SPADCALL |denfp1|
                                                            (QREFELT % 191)))
                                            (LETT |denf2|
                                                  (SPADCALL |denf1| |denf1|
                                                            (QREFELT % 97)))
                                            (LETT |t1|
                                                  (SPADCALL
                                                   (SPADCALL (* 2 |gexp|)
                                                             (QREFELT % 73))
                                                   |denfp1| (QREFELT % 135)))
                                            (LETT |t1|
                                                  (SPADCALL
                                                   (SPADCALL |t1| |nfp1|
                                                             (QREFELT % 97))
                                                   |denf1| (QREFELT % 97)))
                                            (LETT |ct1|
                                                  (SPADCALL
                                                   (* (+ |gexp| 1) |gexp|)
                                                   (QREFELT % 73)))
                                            (LETT |t2|
                                                  (SPADCALL |ct1| |denfp1|
                                                            (QREFELT % 135)))
                                            (LETT |t2|
                                                  (SPADCALL
                                                   (SPADCALL |t2| |denfp1|
                                                             (QREFELT % 97))
                                                   |nf| (QREFELT % 97)))
                                            (LETT |t3|
                                                  (SPADCALL
                                                   (SPADCALL |gexp|
                                                             (QREFELT % 73))
                                                   |denfp2| (QREFELT % 135)))
                                            (LETT |t3|
                                                  (SPADCALL
                                                   (SPADCALL |t3| |nf|
                                                             (QREFELT % 97))
                                                   |denf1| (QREFELT % 97)))
                                            (LETT |nnp2|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |nfp2| |denf2|
                                                               (QREFELT % 97))
                                                     |t1| (QREFELT % 45))
                                                    |t2| (QREFELT % 48))
                                                   |t3| (QREFELT % 45)))
                                            (LETT |f_res1|
                                                  (SPADCALL |nnp| |nnp2|
                                                            (QREFELT % 192)))
                                            (LETT |ratl|
                                                  (SPADCALL |f_res1| |t|
                                                            (QREFELT % 166)))
                                            (SEQ (LETT |r0| NIL)
                                                 (LETT #8# |ratl|) G190
                                                 (COND
                                                  ((OR (ATOM #8#)
                                                       (PROGN
                                                        (LETT |r0| (CAR #8#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |ru|
                                                          (SPADCALL |r0|
                                                                    (QREFELT %
                                                                             190)))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |ru| 1)
                                                       (PROGN
                                                        (LETT #9# |$NoValue|)
                                                        (GO #14=#:G769)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |ri| (QCDR |ru|))
                                                        (LETT |nn|
                                                              (SPADCALL |nf|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |ri|
                                                                           (QREFELT
                                                                            %
                                                                            73))
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           43))
                                                                         |denf|
                                                                         (QREFELT
                                                                          %
                                                                          97))
                                                                        (QREFELT
                                                                         %
                                                                         48)))
                                                        (EXIT
                                                         (LETT |res1|
                                                               (|RDEEFX;gammas1|
                                                                |nn| |ri|
                                                                |denf| |denf1|
                                                                |gexp| |n2|
                                                                |vlst| |ulst|
                                                                |k| |x| |res1|
                                                                %)))))))))
                                                  #14# (EXIT #9#))
                                                 (LETT #8# (CDR #8#)) (GO G190)
                                                 G191 (EXIT NIL))
                                            (EXIT |res1|)))
                                          (#12#
                                           (SEQ
                                            (LETT |bs|
                                                  (SPADCALL (QREFELT % 56)))
                                            (LETT |bk|
                                                  (SPADCALL |bs|
                                                            (QREFELT % 57)))
                                            (LETT |tx_plus_b|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |t|
                                                              (QREFELT % 60))
                                                    1 (QREFELT % 43))
                                                   (SPADCALL
                                                    (SPADCALL |bk|
                                                              (QREFELT % 60))
                                                    (QREFELT % 44))
                                                   (QREFELT % 48)))
                                            (LETT |f_res1|
                                                  (SPADCALL |nnp|
                                                            (SPADCALL |nf|
                                                                      (SPADCALL
                                                                       |tx_plus_b|
                                                                       |denf|
                                                                       (QREFELT
                                                                        % 97))
                                                                      (QREFELT
                                                                       % 48))
                                                            (QREFELT % 192)))
                                            (LETT |lsol|
                                                  (|RDEEFX;solve_poly_eqs|
                                                   (LIST |f_res1|
                                                         (SPADCALL |f_res1|
                                                                   |bs|
                                                                   (QREFELT %
                                                                            61)))
                                                   |ts| |bs| %))
                                            (SEQ (LETT |sol| NIL)
                                                 (LETT #10# |lsol|) G190
                                                 (COND
                                                  ((OR (ATOM #10#)
                                                       (PROGN
                                                        (LETT |sol| (CAR #10#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ
                                                    (LETT |ru|
                                                          (SPADCALL
                                                           (QCAR |sol|)
                                                           (QREFELT % 190)))
                                                    (EXIT
                                                     (COND
                                                      ((QEQCAR |ru| 1)
                                                       (PROGN
                                                        (LETT #11# |$NoValue|)
                                                        (GO #15=#:G774)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |ri| (QCDR |ru|))
                                                        (LETT |nn|
                                                              (SPADCALL |nf|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |ri|
                                                                           (QREFELT
                                                                            %
                                                                            73))
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           43))
                                                                         |denf|
                                                                         (QREFELT
                                                                          %
                                                                          97))
                                                                        (QREFELT
                                                                         %
                                                                         48)))
                                                        (EXIT
                                                         (LETT |res1|
                                                               (|RDEEFX;gammas1|
                                                                |nn| |ri|
                                                                |denf| |denf1|
                                                                |gexp| |n2|
                                                                |vlst| |ulst|
                                                                |k| |x| |res1|
                                                                %)))))))))
                                                  #15# (EXIT #11#))
                                                 (LETT #10# (CDR #10#))
                                                 (GO G190) G191 (EXIT NIL))
                                            (EXIT |res1|)))))))))))
                                  (EXIT
                                   (|RDEEFX;gammas1| |nf| |a| |denf| |denf1|
                                    |gexp| |n2| |vlst| |ulst| |k| |x| |res1|
                                    %))))))))))))
          #13# (EXIT #2#)))) 

(SDEFUN |RDEEFX;finish_special_integrate2|
        ((|rr1f| (F)) (|csol| (|Vector| F)) (|a1p| (F)) (|as| (|Vector| F))
         (|scands|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (|k| (|Kernel| F))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|i| NIL) (#1=#:G797 NIL) (|ansp| (F)) (|cand_prims| (|List| F)))
         (SEQ (LETT |cand_prims| NIL) (LETT |ansp| (|spadConstant| % 74))
              (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |as|)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (COND
                     ((NULL |cand_prims|)
                      (SEQ
                       (LETT |cand_prims|
                             (|RDEEFX;get_prims| (|SPADfirst| |scands|) |k| %))
                       (EXIT (LETT |scands| (CDR |scands|))))))
                    (LETT |a1p|
                          (SPADCALL |a1p|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT % 241))
                                     (SPADCALL |as| |i| (QREFELT % 241))
                                     (QREFELT % 64))
                                    (QREFELT % 77)))
                    (LETT |ansp|
                          (SPADCALL |ansp|
                                    (SPADCALL
                                     (SPADCALL |csol| |i| (QREFELT % 241))
                                     (|SPADfirst| |cand_prims|) (QREFELT % 64))
                                    (QREFELT % 72)))
                    (EXIT (LETT |cand_prims| (CDR |cand_prims|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |a1p| |rr1f| |ansp| 'T))))) 

(SDEFUN |RDEEFX;finish_special_integrate|
        ((|rr1f| (F)) (|a1p| (F)) (|vs| (|Vector| F)) (|as| (|Vector| F))
         (|scands|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|csolu| (|Union| (|Vector| F) "failed")) (|csol| (|Vector| F)))
         (SEQ
          (LETT |csolu|
                (SPADCALL |vs| |rr1f|
                          (LIST
                           (CONS #'|RDEEFX;finish_special_integrate!0|
                                 (VECTOR % |x|)))
                          (QREFELT % 246)))
          (EXIT
           (COND
            ((QEQCAR |csolu| 1)
             (VECTOR (|spadConstant| % 74) (|spadConstant| % 74)
                     (|spadConstant| % 74) NIL))
            ('T
             (SEQ (LETT |csol| (QCDR |csolu|))
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |rr1f| |csol| |a1p| |as|
                    |scands| |k| %))))))))) 

(SDEFUN |RDEEFX;finish_special_integrate!0| ((|c| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |x| (QREFELT % 61)))))) 

(SDEFUN |RDEEFX;exp_lower_bound|
        ((|nfp| (|SparseUnivariatePolynomial| F)) (|eta| (F))
         (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|x| (|Symbol|)) (|lk| (|List| (|Kernel| F))) (% (|Integer|)))
        (SPROG
         ((|logi|
           (|Mapping|
            (|Record| (|:| |logands| (|List| F))
                      (|:| |basis|
                           (|List| (|Vector| (|Fraction| (|Integer|))))))
            (|List| (|Kernel| F)) (|List| F)))
          (|b| (|LaurentPolynomial| F (|SparseUnivariatePolynomial| F)))
          (#1=#:G825 NIL) (|scoeff| NIL) (#2=#:G826 NIL)
          (|c_degs| (|List| (|NonNegativeInteger|))) (|max_deg| (|Integer|))
          (|min_deg| (|Integer|)))
         (SEQ (LETT |logi| (CONS #'|RDEEFX;exp_lower_bound!0| (VECTOR % |x|)))
              (LETT |b| (SPADCALL |nfp| (QREFELT % 251)))
              (LETT |c_degs|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |scoeff| NIL) (LETT #2# |scoeffs|) G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |scoeff| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |scoeff| (QREFELT % 39))
                                             (QREFELT % 40))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |c_degs|
                    (CONS
                     (SPADCALL (SPADCALL |rr1| (QREFELT % 39)) (QREFELT % 40))
                     |c_degs|))
              (LETT |max_deg| (SPADCALL (ELT % 253) |c_degs| (QREFELT % 256)))
              (LETT |min_deg| (SPADCALL |nfp| (QREFELT % 215)))
              (EXIT
               (SPADCALL (|spadConstant| % 108) |b| |min_deg| (- |max_deg|)
                         |lk| |eta| |logi| (QREFELT % 259)))))) 

(SDEFUN |RDEEFX;exp_lower_bound!0| ((|x2| NIL) (|x3| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |x2| |x3| (QREFELT % 249)))))) 

(SDEFUN |RDEEFX;special_integrate2|
        ((|nfp| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|ndenf| (|SparseUnivariatePolynomial| F)) (|f| (F))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|a1| (F))
         (|r1| (F)) (|g| (F))
         (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|scands|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (|gexp| (|Integer|))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((#1=#:G840 NIL) (|scoeff| NIL) (#2=#:G841 NIL) (|lg1| (|List| F))
          (|g1| (F))
          (|partu|
           (|Union| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))
                    "failed"))
          (|part| (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F))))
          (|as| (|Vector| F)))
         (SEQ
          (LETT |lg1|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |scoeff| NIL) (LETT #2# |scoeffs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |scoeff| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |scoeff| |k| (QREFELT % 59))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |g1| (SPADCALL |rr1| |k| (QREFELT % 59)))
          (LETT |partu|
                (SPADCALL |f| |g1| |lg1| |x| (CONS |k| |lk|) (QREFELT % 262)))
          (EXIT
           (COND
            ((QEQCAR |partu| 1)
             (VECTOR (|spadConstant| % 74) (|spadConstant| % 74)
                     (|spadConstant| % 74) NIL))
            ('T
             (SEQ (LETT |part| (QCDR |partu|))
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| % 74)))
                  (EXIT
                   (|RDEEFX;finish_special_integrate2| |g1| (QCDR |part|)
                    (QCAR |part|) |as| |scands| |k| %))))))))) 

(SDEFUN |RDEEFX;do_spde1|
        ((|rr1| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|nfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|der|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|spec1u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|spec1p| (|SparseUnivariatePolynomial| F))
          (|res1|
           (|Record| (|:| |ans| #1=(|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|a1| #1#) (|r2| (|SparseUnivariatePolynomial| F)) (|af| (F))
          (|def_f| (F)))
         (SEQ (LETT |spec1u| (SPADCALL |rr1| (QREFELT % 264)))
              (EXIT
               (COND ((QEQCAR |spec1u| 1) (|error| "impossible 7"))
                     ('T
                      (SEQ (LETT |spec1p| (QCDR |spec1u|))
                           (LETT |res1|
                                 (SPADCALL |nfp| |spec1p| |der|
                                           (QREFELT % 268)))
                           (LETT |a1| (QCAR |res1|))
                           (LETT |r2|
                                 (SPADCALL (SPADCALL |a1| |der|)
                                           (SPADCALL |nfp| |a1| (QREFELT % 97))
                                           (QREFELT % 48)))
                           (LETT |af|
                                 (SPADCALL (SPADCALL |a1| (QREFELT % 46)) |k|
                                           (QREFELT % 59)))
                           (LETT |def_f|
                                 (SPADCALL
                                  (SPADCALL |rr1|
                                            (SPADCALL |r2| (QREFELT % 46))
                                            (QREFELT % 269))
                                  |k| (QREFELT % 59)))
                           (EXIT
                            (VECTOR |af| |def_f|
                                    (SPADCALL (QCDR |res1|)
                                              (|spadConstant| % 102)
                                              (QREFELT % 111))))))))))) 

(SDEFUN |RDEEFX;special_integrate1|
        ((|nfp| #1=(|SparseUnivariatePolynomial| F)) (|f| (F))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|a1| (F))
         (|r1| (F)) (|g| (F)) (|ansp| (F))
         (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|scands|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (|gexp| (|Integer|))
         (|derivation|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((#2=#:G857 NIL) (|eta| (F)) (|neg_deg| (|Integer|)) (#3=#:G861 NIL)
          (|mm| (|SparseUnivariatePolynomial| F)) (#4=#:G874 NIL)
          (#5=#:G875 NIL) (|ak| (F)) (|nfp1| #1#) (|inv_den1| (F)) (|a1p| (F))
          (|rr1f| (F)) (|vs| #6=(|Vector| F)) (|as| #6#) (|i| NIL)
          (#7=#:G877 NIL) (|scoeff| NIL) (#8=#:G876 NIL)
          (|res2|
           (|Record| (|:| |ans| F) (|:| |defect| F) (|:| |sol?| (|Boolean|))))
          (|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|)))))
         (SEQ
          (LETT |neg_deg|
                (COND
                 ((SPADCALL |k| '|exp| (QREFELT % 22))
                  (SEQ
                   (LETT |eta|
                         (SPADCALL
                          (PROG2
                              (LETT #2#
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 32) 1
                                                (QREFELT % 43))
                                      |derivation|)
                                     (SPADCALL (|spadConstant| % 32) 1
                                               (QREFELT % 43))
                                     (QREFELT % 107)))
                              (QCDR #2#)
                            (|check_union2| (QEQCAR #2# 0)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT % 7))
                                            (|Union|
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 7))
                                             "failed")
                                            #2#))
                          (QREFELT % 201)))
                   (EXIT
                    (-
                     (|RDEEFX;exp_lower_bound| |nfp| |eta| |rr1| |scoeffs| |x|
                      |lk| %)))))
                 (#9='T 0)))
          (LETT |nfp1| |nfp|) (LETT |inv_den1| (|spadConstant| % 32))
          (COND
           ((> |neg_deg| 0)
            (SEQ
             (LETT |mm|
                   (SPADCALL (|spadConstant| % 32)
                             (PROG1 (LETT #3# |neg_deg|)
                               (|check_subtype2| (>= #3# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #3#))
                             (QREFELT % 43)))
             (LETT |scoeffs|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |scoeff| NIL) (LETT #5# |scoeffs|) G190
                         (COND
                          ((OR (ATOM #5#)
                               (PROGN (LETT |scoeff| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS (SPADCALL |mm| |scoeff| (QREFELT % 270))
                                       #4#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (LETT |rr1| (SPADCALL |mm| |rr1| (QREFELT % 270)))
             (LETT |ak|
                   (SPADCALL (SPADCALL |k| (QREFELT % 27)) 1 (QREFELT % 29)))
             (LETT |nfp1|
                   (SPADCALL |nfp|
                             (SPADCALL
                              (SPADCALL (SPADCALL |neg_deg| (QREFELT % 73))
                                        (SPADCALL |ak| |x| (QREFELT % 61))
                                        (QREFELT % 64))
                              (QREFELT % 44))
                             (QREFELT % 45)))
             (EXIT
              (LETT |inv_den1|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 271)
                               (SPADCALL |mm| (QREFELT % 46)) (QREFELT % 49))
                     |k| (QREFELT % 59)))))))
          (LETT |res2| (|RDEEFX;do_spde1| |rr1| |nfp1| |k| |derivation| %))
          (LETT |a1p| (SPADCALL |inv_den1| (QVELT |res2| 0) (QREFELT % 64)))
          (EXIT
           (COND
            ((QVELT |res2| 2)
             (VECTOR (SPADCALL |a1| |a1p| (QREFELT % 72)) |g| |ansp| 'T))
            (#9#
             (SEQ (LETT |rr1f| (QVELT |res2| 1))
                  (LETT |vs|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| % 74)))
                  (LETT |as|
                        (MAKEARR1 (LENGTH |scoeffs|) (|spadConstant| % 74)))
                  (SEQ (LETT |i| 1) (LETT #7# (LENGTH |scoeffs|))
                       (LETT |scoeff| NIL) (LETT #8# |scoeffs|) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |scoeff| (CAR #8#)) NIL)
                             (|greater_SI| |i| #7#))
                         (GO G191)))
                       (SEQ
                        (LETT |res2|
                              (|RDEEFX;do_spde1| |scoeff| |nfp1| |k|
                               |derivation| %))
                        (SPADCALL |as| |i|
                                  (SPADCALL |inv_den1| (QVELT |res2| 0)
                                            (QREFELT % 64))
                                  (QREFELT % 272))
                        (EXIT
                         (SPADCALL |vs| |i| (QVELT |res2| 1) (QREFELT % 272))))
                       (LETT #8# (PROG1 (CDR #8#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |res3|
                        (|RDEEFX;finish_special_integrate| |rr1f| |a1p| |vs|
                         |as| |scands| |k| |x| %))
                  (COND
                   ((NULL (QVELT |res3| 3))
                    (EXIT
                     (COND ((> |neg_deg| 0) (VECTOR |a1| |r1| |ansp| NIL))
                           (#9#
                            (VECTOR (SPADCALL |a1| |a1p| (QREFELT % 72))
                                    (SPADCALL |g| |rr1f| (QREFELT % 77)) |ansp|
                                    NIL))))))
                  (EXIT
                   (VECTOR (SPADCALL |a1| (QVELT |res3| 0) (QREFELT % 72)) |g|
                           (SPADCALL |ansp| (QVELT |res3| 2) (QREFELT % 72))
                           'T))))))))) 

(SDEFUN |RDEEFX;mk_pow1| ((|u| (F)) (|i| (|Integer|)) (% (F)))
        (SPADCALL |u| |i| (QREFELT % 79))) 

(SDEFUN |RDEEFX;mk_pow|
        ((|uu| (F)) (|ulst| (|List| F)) (|v| (|Vector| (|Integer|))) (% (F)))
        (SPROG
         ((|res| (F)) (#1=#:G899 NIL) (|i| NIL) (|ui| NIL) (#2=#:G900 NIL)
          (|lp| (|List| F)) (|res2| (F)))
         (SEQ
          (LETT |res|
                (|RDEEFX;mk_pow1| |uu| (SPADCALL |v| 1 (QREFELT % 116)) %))
          (LETT |lp|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 2) (LETT |ui| NIL) (LETT #2# |ulst|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |ui| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (|RDEEFX;mk_pow1| |ui|
                                (SPADCALL |v| |i| (QREFELT % 116)) %)
                               #1#))))
                      (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT (NREVERSE #1#)))))
          (LETT |res2|
                (SPADCALL (ELT % 64) |lp| (|spadConstant| % 32)
                          (QREFELT % 76)))
          (EXIT (SPADCALL |res| |res2| (QREFELT % 64)))))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|a1| (F))
         (|g| (F)) (|ansp| (F))
         (|derivation|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|k| (|Kernel| F))
         (|lk| (|List| (|Kernel| F))) (|x| (|Symbol|))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|spec1u| (|Union| (|SparseUnivariatePolynomial| F) #1="failed"))
          (|res2|
           (|Record| (|:| |ans| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|spec1p| (|SparseUnivariatePolynomial| F)) (|r1| (F)) (|r| (F))
          (|s| (F)) (|t| (F))
          (|f_denr|
           #2=(|Factored| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|f_numr| #2#) (#3=#:G1042 NIL) (#4=#:G1043 NIL) (#5=#:G1044 NIL)
          (#6=#:G1045 NIL)
          (|pip| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|pif| (F))
          (|l_pifp| (F))
          (|uvu0|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|uv0|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (#7=#:G1046 NIL) (#8=#:G1047 NIL) (#9=#:G933 NIL)
          (|fl1| (|List| #10=(|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#11=#:G1048 NIL) (|fac| NIL) (#12=#:G1049 NIL) (|fl2| (|List| #10#))
          (|G_den| #13=(|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|G_num| #13#) (G (F)) (|unG| (R)) (|kf| (F)) (|piv| (F)) (|phi| (F))
          (|u| NIL) (#14=#:G1051 NIL) (#15=#:G1050 NIL) (|vlst1| (|List| F))
          (|ulst1| (|List| F)) (|r4| (F)) (|c0| (F)) (|c1| (F)) (|c2| (F))
          (|lv| (|List| F)) (#16=#:G1052 NIL) (|v| NIL) (#17=#:G1053 NIL)
          (|m1| (|Matrix| F)) (|v1| #18=(|Vector| F))
          (|#G324|
           (|Record| (|:| |mat| #19=(|Matrix| (|Integer|)))
                     (|:| |vec| #20=(|Vector| (|Integer|)))))
          (|m2| #19#) (|v2| #20#)
          (|sol_rec|
           (|Record|
            (|:| |particular| (|Union| (|Vector| (|Integer|)) #21="failed"))
            (|:| |basis| (|List| (|Vector| (|Integer|))))))
          (#22=#:G1003 NIL) (|sol0| (|Vector| (|Integer|))) (#23=#:G1041 NIL)
          (|rcu| (|Union| (|Integer|) #1#)) (|ri| (|Integer|))
          (|nn| (|SparseUnivariatePolynomial| F))
          (|cands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|f| (F)) (|solb1| (|Vector| (|Integer|))) (|uu| (F)) (|u0| (F))
          (|u1| (F)) (|cis| (|Union| (|List| (|List| F)) "failed"))
          (|cil| (|List| (|List| F))) (#24=#:G1054 NIL) (|ii| (|Integer|))
          (|rr| (|Integer|))
          (|cndl|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (#25=#:G1055 NIL) (|ci| NIL) (#26=#:G1056 NIL) (|vc| #18#)
          (|as| (|Vector| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |spec1u| (SPADCALL |rr1| (QREFELT % 264)))
                (EXIT
                 (COND ((QEQCAR |spec1u| 1) (|error| "impossible 10"))
                       (#27='T
                        (SEQ (LETT |spec1p| (QCDR |spec1u|))
                             (LETT |res2|
                                   (SPADCALL |nfp| |spec1p| |derivation|
                                             (QREFELT % 268)))
                             (LETT |a1|
                                   (SPADCALL |a1|
                                             (SPADCALL
                                              (SPADCALL (QCAR |res2|)
                                                        (QREFELT % 46))
                                              |k| (QREFELT % 59))
                                             (QREFELT % 72)))
                             (LETT |spec1p| (QCDR |res2|))
                             (EXIT
                              (COND
                               ((SPADCALL |spec1p| (|spadConstant| % 102)
                                          (QREFELT % 111))
                                (PROGN
                                 (LETT #23# (VECTOR |a1| |g| |ansp| 'T))
                                 (GO #28=#:G1040)))
                               ((>= (SPADCALL |spec1p| (QREFELT % 40))
                                    (SPADCALL |nfp| (QREFELT % 40)))
                                (|error| "impossible 8"))
                               (#27#
                                (SEQ
                                 (LETT |r1|
                                       (SPADCALL |g|
                                                 (SPADCALL
                                                  (SPADCALL |spec1p|
                                                            (QREFELT % 46))
                                                  |k| (QREFELT % 59))
                                                 (QREFELT % 77)))
                                 (LETT |r| (SPADCALL |nf| (QREFELT % 103)))
                                 (LETT |s| (SPADCALL |nf| 1 (QREFELT % 41)))
                                 (LETT |t| (SPADCALL |nf| 0 (QREFELT % 41)))
                                 (LETT |f_denr|
                                       (SPADCALL (SPADCALL |r| (QREFELT % 273))
                                                 (QREFELT % 276)))
                                 (LETT |f_numr|
                                       (SPADCALL (SPADCALL |r| (QREFELT % 177))
                                                 (QREFELT % 276)))
                                 (LETT |fl1|
                                       (PROGN
                                        (LETT #3# NIL)
                                        (SEQ (LETT |fac| NIL)
                                             (LETT #4#
                                                   (SPADCALL |f_denr|
                                                             (QREFELT % 279)))
                                             G190
                                             (COND
                                              ((OR (ATOM #4#)
                                                   (PROGN
                                                    (LETT |fac| (CAR #4#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((ODDP (QVELT |fac| 2))
                                                 (LETT #3#
                                                       (CONS (QVELT |fac| 1)
                                                             #3#))))))
                                             (LETT #4# (CDR #4#)) (GO G190)
                                             G191 (EXIT (NREVERSE #3#)))))
                                 (LETT |fl2|
                                       (PROGN
                                        (LETT #5# NIL)
                                        (SEQ (LETT |fac| NIL)
                                             (LETT #6#
                                                   (SPADCALL |f_numr|
                                                             (QREFELT % 279)))
                                             G190
                                             (COND
                                              ((OR (ATOM #6#)
                                                   (PROGN
                                                    (LETT |fac| (CAR #6#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((ODDP (QVELT |fac| 2))
                                                 (LETT #5#
                                                       (CONS (QVELT |fac| 1)
                                                             #5#))))))
                                             (LETT #6# (CDR #6#)) (GO G190)
                                             G191 (EXIT (NREVERSE #5#)))))
                                 (LETT |pip|
                                       (SPADCALL
                                        (SPADCALL (ELT % 281) |fl1|
                                                  (|spadConstant| % 134)
                                                  (QREFELT % 284))
                                        (SPADCALL (ELT % 281) |fl2|
                                                  (|spadConstant| % 134)
                                                  (QREFELT % 284))
                                        (QREFELT % 281)))
                                 (LETT |pif| (SPADCALL |pip| (QREFELT % 178)))
                                 (LETT |l_pifp|
                                       (SPADCALL
                                        (SPADCALL |pif| |x| (QREFELT % 61))
                                        |pif| (QREFELT % 66)))
                                 (LETT |uvu0|
                                       (|RDEEFX;get_uv| |l_pifp| |vlst| |ulst|
                                        |k| |x| %))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |uvu0| 1)
                                    (VECTOR |a1| |r1| |ansp| NIL))
                                   (#27#
                                    (SEQ (LETT |uv0| (QCDR |uvu0|))
                                         (LETT |fl1|
                                               (PROGN
                                                (LETT #7# NIL)
                                                (SEQ (LETT |fac| NIL)
                                                     (LETT #8#
                                                           (SPADCALL |f_denr|
                                                                     (QREFELT %
                                                                              279)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #8#)
                                                           (PROGN
                                                            (LETT |fac|
                                                                  (CAR #8#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #7#
                                                             (CONS
                                                              (SPADCALL
                                                               (QVELT |fac| 1)
                                                               (PROG1
                                                                   (LETT #9#
                                                                         (|quotient_INT|
                                                                          (-
                                                                           (QVELT
                                                                            |fac|
                                                                            2)
                                                                           1)
                                                                          2))
                                                                 (|check_subtype2|
                                                                  (>= #9# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #9#))
                                                               (QREFELT % 286))
                                                              #7#))))
                                                     (LETT #8# (CDR #8#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #7#)))))
                                         (LETT |fl2|
                                               (PROGN
                                                (LETT #11# NIL)
                                                (SEQ (LETT |fac| NIL)
                                                     (LETT #12#
                                                           (SPADCALL |f_numr|
                                                                     (QREFELT %
                                                                              279)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #12#)
                                                           (PROGN
                                                            (LETT |fac|
                                                                  (CAR #12#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #11#
                                                             (CONS
                                                              (SPADCALL
                                                               (QVELT |fac| 1)
                                                               (|quotient_INT|
                                                                (+
                                                                 (QVELT |fac|
                                                                        2)
                                                                 1)
                                                                2)
                                                               (QREFELT % 286))
                                                              #11#))))
                                                     (LETT #12# (CDR #12#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #11#)))))
                                         (LETT |G_den|
                                               (SPADCALL (ELT % 281) |fl1|
                                                         (|spadConstant| % 134)
                                                         (QREFELT % 284)))
                                         (LETT |G_num|
                                               (SPADCALL (ELT % 281) |fl2|
                                                         (|spadConstant| % 134)
                                                         (QREFELT % 284)))
                                         (LETT G
                                               (SPADCALL
                                                (SPADCALL |G_den|
                                                          (QREFELT % 178))
                                                (SPADCALL |G_num|
                                                          (QREFELT % 178))
                                                (QREFELT % 66)))
                                         (LETT |unG|
                                               (SPADCALL
                                                (SPADCALL |f_numr|
                                                          (QREFELT % 287))
                                                (QREFELT % 288)))
                                         (LETT |kf|
                                               (SPADCALL |k| (QREFELT % 60)))
                                         (LETT |phi|
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |r| |x|
                                                            (QREFELT % 61))
                                                  (|spadConstant| % 74)
                                                  (QREFELT % 130))
                                                 (SEQ
                                                  (LETT |piv|
                                                        (SPADCALL
                                                         (SPADCALL G |x|
                                                                   (QREFELT %
                                                                            61))
                                                         (SPADCALL
                                                          (SPADCALL G |l_pifp|
                                                                    (QREFELT %
                                                                             64))
                                                          (SPADCALL 2
                                                                    (QREFELT %
                                                                             73))
                                                          (QREFELT % 66))
                                                         (QREFELT % 77)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL |spec1p| 1
                                                              (QREFELT % 41))
                                                    |piv| (QREFELT % 66)))))
                                                (#27#
                                                 (SEQ
                                                  (LETT |piv|
                                                        (SPADCALL
                                                         (SPADCALL G
                                                                   (SPADCALL
                                                                    |kf| |x|
                                                                    (QREFELT %
                                                                             61))
                                                                   (QREFELT %
                                                                            64))
                                                         (SPADCALL
                                                          (SPADCALL |unG|
                                                                    (SPADCALL
                                                                     |s| |x|
                                                                     (QREFELT %
                                                                              61))
                                                                    (QREFELT %
                                                                             289))
                                                          (SPADCALL
                                                           (SPADCALL 2
                                                                     (QREFELT %
                                                                              73))
                                                           G (QREFELT % 64))
                                                          (QREFELT % 66))
                                                         (QREFELT % 72)))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL |spec1p| 0
                                                              (QREFELT % 41))
                                                    |piv| (QREFELT % 66)))))))
                                         (LETT |vlst1| NIL) (LETT |ulst1| NIL)
                                         (SEQ (LETT |u| NIL) (LETT #14# |ulst|)
                                              (LETT |v| NIL) (LETT #15# |vlst|)
                                              G190
                                              (COND
                                               ((OR (ATOM #15#)
                                                    (PROGN
                                                     (LETT |v| (CAR #15#))
                                                     NIL)
                                                    (ATOM #14#)
                                                    (PROGN
                                                     (LETT |u| (CAR #14#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |v| |kf|
                                                            (QREFELT % 130))
                                                  (SEQ
                                                   (LETT |vlst1|
                                                         (CONS |v| |vlst1|))
                                                   (EXIT
                                                    (LETT |ulst1|
                                                          (CONS |u|
                                                                |ulst1|))))))))
                                              (LETT #15#
                                                    (PROG1 (CDR #15#)
                                                      (LETT #14# (CDR #14#))))
                                              (GO G190) G191 (EXIT NIL))
                                         (LETT |r4|
                                               (SPADCALL
                                                (SPADCALL 4 (QREFELT % 73)) |r|
                                                (QREFELT % 64)))
                                         (LETT |c0|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |s| 2
                                                           (QREFELT % 291))
                                                 |r4| (QREFELT % 66))
                                                |t| (QREFELT % 77)))
                                         (LETT |c1|
                                               (SPADCALL |s| |r4|
                                                         (QREFELT % 66)))
                                         (LETT |c2|
                                               (SPADCALL (|spadConstant| % 32)
                                                         |r4| (QREFELT % 66)))
                                         (LETT |lv|
                                               (COND
                                                ((SPADCALL
                                                  (SPADCALL |r| |x|
                                                            (QREFELT % 61))
                                                  (|spadConstant| % 74)
                                                  (QREFELT % 130))
                                                 (SPADCALL
                                                  (LIST
                                                   (SPADCALL |c1|
                                                             (QREFELT % 47))
                                                   (SPADCALL |c2|
                                                             (QREFELT % 47)))
                                                  |vlst1| (QREFELT % 292)))
                                                (#27#
                                                 (CONS
                                                  (SPADCALL |c1|
                                                            (QREFELT % 47))
                                                  |vlst1|))))
                                         (LETT |m1|
                                               (SPADCALL
                                                (LIST
                                                 (PROGN
                                                  (LETT #16# NIL)
                                                  (SEQ (LETT |v| NIL)
                                                       (LETT #17# |lv|) G190
                                                       (COND
                                                        ((OR (ATOM #17#)
                                                             (PROGN
                                                              (LETT |v|
                                                                    (CAR #17#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #16#
                                                               (CONS
                                                                (SPADCALL |v|
                                                                          |x|
                                                                          (QREFELT
                                                                           %
                                                                           61))
                                                                #16#))))
                                                       (LETT #17# (CDR #17#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #16#)))))
                                                (QREFELT % 294)))
                                         (LETT |v1|
                                               (SPADCALL
                                                (LIST
                                                 (SPADCALL |c0| |x|
                                                           (QREFELT % 61)))
                                                (QREFELT % 81)))
                                         (PROGN
                                          (LETT |#G324|
                                                (SPADCALL |m1| |v1|
                                                          (QREFELT % 298)))
                                          (LETT |m2| (QCAR |#G324|))
                                          (LETT |v2| (QCDR |#G324|))
                                          |#G324|)
                                         (LETT |sol_rec|
                                               (SPADCALL |m2| |v2|
                                                         (QREFELT % 303)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR (QCAR |sol_rec|) 1)
                                            (VECTOR |a1| |r1| |ansp| NIL))
                                           (#27#
                                            (SEQ
                                             (LETT |sol0|
                                                   (PROG2
                                                       (LETT #22#
                                                             (QCAR |sol_rec|))
                                                       (QCDR #22#)
                                                     (|check_union2|
                                                      (QEQCAR #22# 0)
                                                      (|Vector| (|Integer|))
                                                      (|Union|
                                                       (|Vector| (|Integer|))
                                                       #21#)
                                                      #22#)))
                                             (EXIT
                                              (COND
                                               ((NULL (QCDR |sol_rec|))
                                                (SEQ
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |r| |x|
                                                              (QREFELT % 61))
                                                    (|spadConstant| % 74)
                                                    (QREFELT % 130))
                                                   (COND
                                                    ((SPADCALL
                                                      (EXPT
                                                       (SPADCALL |sol0| 1
                                                                 (QREFELT %
                                                                          116))
                                                       2)
                                                      (SPADCALL |sol0| 2
                                                                (QREFELT %
                                                                         116))
                                                      (QREFELT % 89))
                                                     (PROGN
                                                      (LETT #23#
                                                            (VECTOR |a1| |r1|
                                                                    |ansp|
                                                                    NIL))
                                                      (GO #28#))))))
                                                 (LETT |rcu|
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL |sol0| 1
                                                                    (QREFELT %
                                                                             116))
                                                          (QREFELT % 139))
                                                         (SPADCALL 2
                                                                   (QREFELT %
                                                                            139))
                                                         (QREFELT % 304))
                                                        (QREFELT % 190)))
                                                 (EXIT
                                                  (COND
                                                   ((QEQCAR |rcu| 1)
                                                    (VECTOR |a1| |r1| |ansp|
                                                            NIL))
                                                   (#27#
                                                    (SEQ
                                                     (LETT |ri| (QCDR |rcu|))
                                                     (LETT |nn|
                                                           (SPADCALL |nf|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |ri|
                                                                       (QREFELT
                                                                        % 73))
                                                                      1
                                                                      (QREFELT
                                                                       % 43))
                                                                     (QREFELT %
                                                                              48)))
                                                     (LETT |cands|
                                                           (|RDEEFX;gammas1|
                                                            |nn| (QCDR |rcu|)
                                                            (|spadConstant| %
                                                                            108)
                                                            (|spadConstant| %
                                                                            108)
                                                            0 1 |vlst| |ulst|
                                                            |k| |x| NIL %))
                                                     (LETT |derivation3|
                                                           (CONS
                                                            #'|RDEEFX;quadratic_log_erf_integrate!0|
                                                            (VECTOR
                                                             |derivation| %)))
                                                     (LETT |scoeffs|
                                                           (|RDEEFX;get_scoeffs|
                                                            |cands|
                                                            (|spadConstant| %
                                                                            108)
                                                            |k| |derivation3|
                                                            %))
                                                     (LETT |rr1|
                                                           (SPADCALL |spec1p|
                                                                     (QREFELT %
                                                                              46)))
                                                     (LETT |f|
                                                           (SPADCALL
                                                            (SPADCALL |nf|
                                                                      (QREFELT
                                                                       % 46))
                                                            |k|
                                                            (QREFELT % 59)))
                                                     (EXIT
                                                      (|RDEEFX;special_integrate1|
                                                       |nfp| |f| |k| |lk| |x|
                                                       |rr1| |a1| |r1| |g|
                                                       |ansp| |scoeffs| |cands|
                                                       0 |derivation| %))))))))
                                               (#27#
                                                (SEQ
                                                 (LETT |solb1|
                                                       (|SPADfirst|
                                                        (QCDR |sol_rec|)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |r| |x|
                                                               (QREFELT % 61))
                                                     (|spadConstant| % 74)
                                                     (QREFELT % 78))
                                                    (COND
                                                     ((>
                                                       (LENGTH
                                                        (QCDR |sol_rec|))
                                                       1)
                                                      (|error|
                                                       "impossible 11"))
                                                     (#27#
                                                      (SEQ
                                                       (LETT |uu|
                                                             (|SPADfirst|
                                                              (SPADCALL |k|
                                                                        (QREFELT
                                                                         %
                                                                         27))))
                                                       (LETT |u0|
                                                             (|RDEEFX;mk_pow|
                                                              |uu| |ulst1|
                                                              |sol0| %))
                                                       (LETT |u1|
                                                             (|RDEEFX;mk_pow|
                                                              |uu| |ulst1|
                                                              |solb1| %))
                                                       (LETT |cis|
                                                             (SPADCALL
                                                              (SPADCALL |phi|
                                                                        |u0|
                                                                        (QREFELT
                                                                         % 66))
                                                              |u1| |x|
                                                              (QREFELT % 307)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |cis| 1)
                                                          (VECTOR |a1| |r1|
                                                                  |ansp| NIL))
                                                         (#27#
                                                          (SEQ
                                                           (LETT |cil|
                                                                 (QCDR |cis|))
                                                           (LETT |cndl| NIL)
                                                           (SEQ (LETT |ci| NIL)
                                                                (LETT #24#
                                                                      |cil|)
                                                                G190
                                                                (COND
                                                                 ((OR
                                                                   (ATOM #24#)
                                                                   (PROGN
                                                                    (LETT |ci|
                                                                          (CAR
                                                                           #24#))
                                                                    NIL))
                                                                  (GO G191)))
                                                                (SEQ
                                                                 (LETT |ii|
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         |ci|
                                                                         (QREFELT
                                                                          %
                                                                          308))
                                                                        (QREFELT
                                                                         %
                                                                         30)))
                                                                 (LETT |rr|
                                                                       (+
                                                                        (SPADCALL
                                                                         |sol0|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          116))
                                                                        (* |ii|
                                                                           (SPADCALL
                                                                            |solb1|
                                                                            1
                                                                            (QREFELT
                                                                             %
                                                                             116)))))
                                                                 (EXIT
                                                                  (LETT |cndl|
                                                                        (|RDEEFX;gammas1|
                                                                         (SPADCALL
                                                                          |nf|
                                                                          (SPADCALL
                                                                           (SPADCALL
                                                                            |rr|
                                                                            (QREFELT
                                                                             %
                                                                             73))
                                                                           1
                                                                           (QREFELT
                                                                            %
                                                                            43))
                                                                          (QREFELT
                                                                           %
                                                                           48))
                                                                         |rr|
                                                                         (|spadConstant|
                                                                          %
                                                                          108)
                                                                         (|spadConstant|
                                                                          %
                                                                          108)
                                                                         0 0
                                                                         |vlst|
                                                                         |ulst|
                                                                         |k|
                                                                         |x|
                                                                         |cndl|
                                                                         %))))
                                                                (LETT #24#
                                                                      (CDR
                                                                       #24#))
                                                                (GO G190) G191
                                                                (EXIT NIL))
                                                           (LETT |cndl|
                                                                 (NREVERSE
                                                                  |cndl|))
                                                           (LETT |vc|
                                                                 (SPADCALL
                                                                  (PROGN
                                                                   (LETT #25#
                                                                         NIL)
                                                                   (SEQ
                                                                    (LETT |ci|
                                                                          NIL)
                                                                    (LETT #26#
                                                                          |cil|)
                                                                    G190
                                                                    (COND
                                                                     ((OR
                                                                       (ATOM
                                                                        #26#)
                                                                       (PROGN
                                                                        (LETT
                                                                         |ci|
                                                                         (CAR
                                                                          #26#))
                                                                        NIL))
                                                                      (GO
                                                                       G191)))
                                                                    (SEQ
                                                                     (EXIT
                                                                      (LETT
                                                                       #25#
                                                                       (CONS
                                                                        (|SPADfirst|
                                                                         |ci|)
                                                                        #25#))))
                                                                    (LETT #26#
                                                                          (CDR
                                                                           #26#))
                                                                    (GO G190)
                                                                    G191
                                                                    (EXIT
                                                                     (NREVERSE
                                                                      #25#))))
                                                                  (QREFELT %
                                                                           81)))
                                                           (LETT |as|
                                                                 (MAKEARR1
                                                                  (LENGTH
                                                                   |cil|)
                                                                  (|spadConstant|
                                                                   % 74)))
                                                           (EXIT
                                                            (|RDEEFX;finish_special_integrate2|
                                                             |r1| |vc| |a1|
                                                             |as| |cndl| |k|
                                                             %))))))))))
                                                   ((OR
                                                     (EQL
                                                      (LENGTH (QCDR |sol_rec|))
                                                      1)
                                                     (NULL
                                                      (>
                                                       (LENGTH
                                                        (QCDR |sol_rec|))
                                                       2)))
                                                    (VECTOR |a1| |r1| |ansp|
                                                            NIL))
                                                   ('T
                                                    (|error|
                                                     "impossible 12"))))))))))))))))))))))))))
          #28# (EXIT #23#)))) 

(SDEFUN |RDEEFX;quadratic_log_erf_integrate!0| ((|z1| NIL) ($$ NIL))
        (PROG (% |derivation|)
          (LETT % (QREFELT $$ 1))
          (LETT |derivation| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT % 38)) |derivation|)
                        (SPADCALL |z1| (QREFELT % 39)) (QREFELT % 97))
              (SPADCALL (SPADCALL |z1| (QREFELT % 38))
                        (SPADCALL (SPADCALL |z1| (QREFELT % 39)) |derivation|)
                        (QREFELT % 97))
              (QREFELT % 45))
             (SPADCALL (SPADCALL |z1| (QREFELT % 39))
                       (SPADCALL |z1| (QREFELT % 39)) (QREFELT % 97))
             (QREFELT % 195)))))) 

(SDEFUN |RDEEFX;decompose1|
        ((|num| (|SparseUnivariatePolynomial| F))
         (|den| (|SparseUnivariatePolynomial| F))
         (|eidens| (|List| (|SparseUnivariatePolynomial| F)))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G1060 NIL) (|f1| (|SparseUnivariatePolynomial| F))
          (|res| (|List| (|SparseUnivariatePolynomial| F))))
         (SEQ
          (LETT |f1|
                (PROG2
                    (LETT #1#
                          (SPADCALL |den|
                                    (SPADCALL (ELT % 97) |eidens|
                                              (QREFELT % 309))
                                    (QREFELT % 107)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT % 7))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT % 7))
                                   "failed")
                                  #1#)))
          (COND
           ((SPADCALL |f1| (|spadConstant| % 108) (QREFELT % 109))
            (LETT |eidens| (CONS |f1| |eidens|))))
          (LETT |res| (SPADCALL |num| |eidens| (QREFELT % 311)))
          (EXIT
           (COND
            ((SPADCALL |f1| (|spadConstant| % 108) (QREFELT % 109))
             (CDR |res|))
            ('T |res|)))))) 

(SDEFUN |RDEEFX;get_trace|
        ((|fu| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|k| (|Kernel| F)) (|rf1k| (|Kernel| F))
         (|cfac| (|SparseUnivariatePolynomial| F))
         (% (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((|Sae|
           (|Join| (|MonogenicAlgebra| F #1=(|SparseUnivariatePolynomial| F))
                   (CATEGORY |package|
                    (IF (|has| F (|Field|))
                        (IF (|has| F (|PolynomialFactorizationExplicit|))
                            (ATTRIBUTE (|PolynomialFactorizationExplicit|))
                            |noBranch|)
                        |noBranch|)
                    (IF (|has| #1# (|Hashable|))
                        (ATTRIBUTE (|Hashable|))
                        |noBranch|))))
          (|f| (F)) (|fa| (|SparseUnivariatePolynomial| F)) (|resd| (F)))
         (SEQ
          (LETT |Sae|
                (|SimpleAlgebraicExtension| (QREFELT % 7)
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT % 7))
                                            |cfac|))
          (LETT |f| (SPADCALL |fu| |k| (QREFELT % 59)))
          (LETT |fa| (SPADCALL |f| |rf1k| |cfac| (QREFELT % 312)))
          (LETT |resd|
                (SPADCALL
                 (SPADCALL |fa|
                           (|compiledLookupCheck| '|reduce|
                                                  (LIST '%
                                                        (LIST
                                                         '|SparseUnivariatePolynomial|
                                                         (|devaluate|
                                                          (ELT % 7))))
                                                  |Sae|))
                 (|compiledLookupCheck| '|trace|
                                        (LIST (|devaluate| (ELT % 7)) '%)
                                        |Sae|)))
          (EXIT (SPADCALL |resd| |k| (QREFELT % 35)))))) 

(SDEFUN |RDEEFX;solve_factor1|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|)) (|einum| (|SparseUnivariatePolynomial| F))
         (|bpol| (|SparseUnivariatePolynomial| F))
         (|er|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F)))
         (%
          (|Record| (|:| |primpart| F)
                    (|:| |logpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |polypart| (|SparseUnivariatePolynomial| F))
                    (|:| |specpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|eiden| (|SparseUnivariatePolynomial| F)) (|r0| (|Integer|))
          (|v0| (F)) (|cfac| (|SparseUnivariatePolynomial| F)) (|u0| (F))
          (|u_exp| (|Integer|)) (|vshift| (F)) (|rfc| (F))
          (|rf1k| (|Kernel| F))
          (|eiarg_num| #1=(|SparseUnivariatePolynomial| F))
          (|ei_arg| #2=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|numfp1| #1#) (|coeff1| (|SparseUnivariatePolynomial| F))
          (|coeff1_r| #2#)
          (|dvr|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                     (|:| |remainder| #3=(|SparseUnivariatePolynomial| F))))
          (|min_deg| (|NonNegativeInteger|))
          (|spec_den| (|SparseUnivariatePolynomial| F)) (#4=#:G1073 NIL)
          (|denf1| (|SparseUnivariatePolynomial| F))
          (|auxl| (|List| (|SparseUnivariatePolynomial| F)))
          (|coeff1_rs| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lnum0| #3#) (|reml| (|List| (|SparseUnivariatePolynomial| F)))
          (|lnum1| #3#) (|ddf| (|SparseUnivariatePolynomial| F))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|cu| (|Union| (|SparseUnivariatePolynomial| F) #5="failed"))
          (|cp| (|SparseUnivariatePolynomial| F)) (|cu1| (|Union| F "failed"))
          (|c| (F)) (|ansp1| (F)) (|zzl| (|List| F)) (|zz| NIL)
          (#6=#:G1103 NIL) (|ansp| (F))
          (|lp_cor| #7=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #7#)
          (|poly_cor_rf| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|poly_cor| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |eiden| (QVELT |er| 0)) (LETT |r0| (QVELT |er| 1))
              (LETT |v0| (QVELT |er| 2)) (LETT |cfac| (QVELT |er| 3))
              (LETT |u0| (QVELT |er| 4)) (LETT |u_exp| (QVELT |er| 5))
              (LETT |vshift| (QVELT |er| 6)) (LETT |rfc| (|spadConstant| % 74))
              (COND
               ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT % 240)))
                     (EXIT (LETT |rf1k| (SPADCALL |rfc| (QREFELT % 313)))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |r0| (QREFELT % 73)) 1
                                           (QREFELT % 43))
                                 (SPADCALL |v0| (QREFELT % 44)) (QREFELT % 48))
                                (SPADCALL |rfc| (QREFELT % 44)) (QREFELT % 48))
                               |denf| (QREFELT % 97))
                              (QREFELT % 48)))
              (LETT |ei_arg|
                    (SPADCALL (SPADCALL |eiarg_num| (QREFELT % 46))
                              (SPADCALL |denf| (QREFELT % 46)) (QREFELT % 49)))
              (LETT |numfp1|
                    (SPADCALL |nfp|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL |v0|
                                          (SPADCALL
                                           (SPADCALL |r0| (QREFELT % 73))
                                           (SPADCALL |k| (QREFELT % 60))
                                           (QREFELT % 64))
                                          (QREFELT % 72))
                                |x| (QREFELT % 61))
                               |denfp| (QREFELT % 135))
                              (QREFELT % 48)))
              (LETT |coeff1|
                    (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT % 97)) |u0|
                              (QREFELT % 205)))
              (LETT |coeff1_r|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 32) 1 (QREFELT % 43))
                        (QREFELT % 46))
                       |u_exp| (QREFELT % 314))
                      (SPADCALL |coeff1| (QREFELT % 46)) (QREFELT % 315))
                     (SPADCALL |eiarg_num| (QREFELT % 46)) (QREFELT % 49)))
              (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT % 39)))
              (LETT |coeff1_rs| (|spadConstant| % 196))
              (LETT |dvr|
                    (SPADCALL (SPADCALL |coeff1_r| (QREFELT % 38)) |denf1|
                              (QREFELT % 317)))
              (LETT |lnum1| (QCDR |dvr|))
              (COND
               ((SPADCALL |k| '|exp| (QREFELT % 22))
                (SEQ (LETT |min_deg| (SPADCALL |denf1| (QREFELT % 215)))
                     (EXIT
                      (COND
                       ((> |min_deg| 0)
                        (SEQ
                         (LETT |spec_den|
                               (SPADCALL (|spadConstant| % 32) |min_deg|
                                         (QREFELT % 43)))
                         (LETT |denf1|
                               (PROG2
                                   (LETT #4#
                                         (SPADCALL |denf1| |spec_den|
                                                   (QREFELT % 107)))
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 7))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 7))
                                                  #5#)
                                                 #4#)))
                         (LETT |auxl|
                               (SPADCALL |lnum1| (LIST |denf1| |spec_den|)
                                         (QREFELT % 311)))
                         (LETT |lnum1| (SPADCALL |auxl| 1 (QREFELT % 318)))
                         (EXIT
                          (LETT |coeff1_rs|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |auxl| 2 (QREFELT % 318))
                                           (QREFELT % 46))
                                 (SPADCALL |spec_den| (QREFELT % 46))
                                 (QREFELT % 49)))))))))))
              (LETT |lnum0| |lnum1|)
              (COND
               ((SPADCALL |bpol| |eiden| (QREFELT % 109))
                (SEQ
                 (LETT |reml|
                       (|RDEEFX;decompose1| |lnum1| |denf1| (LIST |bpol|) %))
                 (EXIT (LETT |lnum1| (|SPADfirst| |reml|))))))
              (COND
               ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                (SEQ (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT % 189)))
                     (LETT |ddf|
                           (SPADCALL (SPADCALL |eiden| (QREFELT % 191)) |denf1|
                                     (QREFELT % 189)))
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT % 321)))
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#8='T
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)))
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT % 191))
                                                    (QREFELT % 97))
                                          |denf1| (QREFELT % 189)))))))))))
              (LETT |cu| (SPADCALL |einum| |lnum1| (QREFELT % 107)))
              (EXIT
               (COND
                ((QEQCAR |cu| 1)
                 (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                         (|spadConstant| % 102) (|spadConstant| % 196)))
                (#8#
                 (SEQ (LETT |cp| (QCDR |cu|))
                      (LETT |cu1| (SPADCALL |cp| (QREFELT % 228)))
                      (EXIT
                       (COND
                        ((QEQCAR |cu1| 1)
                         (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                                 (|spadConstant| % 102)
                                 (|spadConstant| % 196)))
                        (#8#
                         (SEQ (LETT |c| (QCDR |cu1|))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |c| |x| (QREFELT % 322))
                                           (|spadConstant| % 74)
                                           (QREFELT % 130))
                                 (VECTOR (|spadConstant| % 74)
                                         (|spadConstant| % 196)
                                         (|spadConstant| % 102)
                                         (|spadConstant| % 196)))
                                (#8#
                                 (SEQ
                                  (LETT |ansp1|
                                        (SPADCALL
                                         (SPADCALL |c|
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vshift|
                                                               (QREFELT % 47))
                                                     |rfc| (QREFELT % 77))
                                                    (QREFELT % 323))
                                                   (QREFELT % 64))
                                         (SPADCALL
                                          (SPADCALL |ei_arg| |k|
                                                    (QREFELT % 59))
                                          (QREFELT % 324))
                                         (QREFELT % 64)))
                                  (LETT |zzl|
                                        (COND
                                         ((SPADCALL |cfac|
                                                    (|spadConstant| % 102)
                                                    (QREFELT % 111))
                                          (LIST (|spadConstant| % 74)))
                                         (#8#
                                          (SPADCALL |cfac| (QREFELT % 325)))))
                                  (LETT |ansp| (|spadConstant| % 74))
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| % 102)
                                              (QREFELT % 111))
                                    (LETT |ansp| |ansp1|))
                                   (#8#
                                    (SEQ (LETT |zz| NIL) (LETT #6# |zzl|) G190
                                         (COND
                                          ((OR (ATOM #6#)
                                               (PROGN
                                                (LETT |zz| (CAR #6#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |ansp|
                                                 (SPADCALL |ansp|
                                                           (SPADCALL |ansp1|
                                                                     |rf1k|
                                                                     |zz|
                                                                     (QREFELT %
                                                                              67))
                                                           (QREFELT % 72)))))
                                         (LETT #6# (CDR #6#)) (GO G190) G191
                                         (EXIT NIL))))
                                  (LETT |lp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT % 44))
                                                  (SPADCALL
                                                   (SPADCALL |lnum0|
                                                             (QREFELT % 46))
                                                   (SPADCALL |denf1|
                                                             (QREFELT % 46))
                                                   (QREFELT % 49))
                                                  (QREFELT % 270)))
                                  (LETT |sp_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT % 44))
                                                  |coeff1_rs| (QREFELT % 270)))
                                  (LETT |poly_cor|
                                        (SPADCALL (SPADCALL |c| (QREFELT % 44))
                                                  (QCAR |dvr|) (QREFELT % 97)))
                                  (COND
                                   ((SPADCALL |cfac| (|spadConstant| % 102)
                                              (QREFELT % 109))
                                    (SEQ
                                     (LETT |lp_cor|
                                           (|RDEEFX;get_trace| |lp_cor| |k|
                                            |rf1k| |cfac| %))
                                     (LETT |sp_cor|
                                           (|RDEEFX;get_trace| |sp_cor| |k|
                                            |rf1k| |cfac| %))
                                     (LETT |poly_cor_rf|
                                           (|RDEEFX;get_trace|
                                            (SPADCALL |poly_cor|
                                                      (QREFELT % 46))
                                            |k| |rf1k| |cfac| %))
                                     (EXIT
                                      (LETT |poly_cor|
                                            (SPADCALL |poly_cor_rf|
                                                      (QREFELT % 326)))))))
                                  (EXIT
                                   (VECTOR |ansp| |lp_cor| |poly_cor|
                                           |sp_cor|))))))))))))))))) 

(SDEFUN |RDEEFX;p_power_in_q|
        ((|q| (|SparseUnivariatePolynomial| F))
         (|p| (|SparseUnivariatePolynomial| F)) (% (|Integer|)))
        (SPROG
         ((|nqu| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (#1=#:G1113 NIL) (|nn| (|Integer|)))
         (SEQ (LETT |nn| 0)
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |nqu| (SPADCALL |q| |p| (QREFELT % 107)))
                          (EXIT
                           (COND
                            ((QEQCAR |nqu| 1)
                             (PROGN (LETT #1# |$NoValue|) (GO #2=#:G1110)))
                            ('T
                             (SEQ (LETT |q| (QCDR |nqu|))
                                  (EXIT (LETT |nn| (+ |nn| 1))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (EXIT |nn|)))) 

(SDEFUN |RDEEFX;solve_linear_factor|
        ((|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|)) (|einum| (|SparseUnivariatePolynomial| F))
         (|er|
          (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                    (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                    (|:| |u_part2| F) (|:| |shift_part2| F)))
         (%
          (|Record| (|:| |primpart| F)
                    (|:| |logpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |polypart| (|SparseUnivariatePolynomial| F))
                    (|:| |specpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|cfac| (|SparseUnivariatePolynomial| F)) (|rfc| (F))
          (|rf1k| (|Kernel| F)) (|r0| (|Integer|)) (|v0| (F)) (|u0| (F))
          (|lc0| (F)) (|eiarg_num| #1=(|SparseUnivariatePolynomial| F))
          (|fac1| (|SparseUnivariatePolynomial| F)) (|nn0| (|Integer|))
          (|numfp1| #1#) (|coeff1| (|SparseUnivariatePolynomial| F))
          (|coeff1_r| #2=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|denf1| (|SparseUnivariatePolynomial| F))
          (|dvr|
           #3=(|Record| (|:| |quotient| (|SparseUnivariatePolynomial| F))
                        (|:| |remainder| (|SparseUnivariatePolynomial| F))))
          (|ddf| (|SparseUnivariatePolynomial| F))
          (|ppu|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|reml| (|List| (|SparseUnivariatePolynomial| F))) (|lnum1| (F))
          (|einum1| (F)) (|u1| (F))
          (|res1u| (|Union| (|List| (|List| F)) "failed"))
          (|res1| (|List| (|List| F)))
          (|eiarg_inc| (|SparseUnivariatePolynomial| F)) (|zzl| (|List| F))
          (|ck| NIL) (#4=#:G1145 NIL) (|kif| (F)) (|ki| (|Integer|))
          (|einumi| (|SparseUnivariatePolynomial| F)) (|nn| (|Integer|))
          (|ci| (F)) (|eiargi_r| #2#) (|eiargi| (F)) (|shifti| (F))
          (|ansp1| (F)) (|coefi| (F))
          (|eiargp| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|lp_cor| (|Fraction| (|SparseUnivariatePolynomial| F))) (|zz| NIL)
          (#5=#:G1146 NIL) (|ansp| (F)) (|dvr2| #3#))
         (SEQ (LETT |cfac| (QVELT |er| 3)) (LETT |rfc| (|spadConstant| % 74))
              (COND
               ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT % 240)))
                     (EXIT (LETT |rf1k| (SPADCALL |rfc| (QREFELT % 313)))))))
              (LETT |r0| (QVELT |er| 1)) (LETT |v0| (QVELT |er| 2))
              (LETT |u0| (QVELT |er| 4))
              (LETT |lc0|
                    (SPADCALL (SPADCALL |nf| (QREFELT % 103))
                              (SPADCALL |r0| (QREFELT % 73)) (QREFELT % 72)))
              (COND
               ((OR (SPADCALL (SPADCALL |nf| (QREFELT % 40)) 1 (QREFELT % 89))
                    (SPADCALL |denf| (|spadConstant| % 108) (QREFELT % 109)))
                (COND
                 ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                  (EXIT (|error| "cfac ~= 0 in nonlinear case"))))))
              (LETT |eiarg_num|
                    (SPADCALL |nf|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |r0| (QREFELT % 73)) 1
                                          (QREFELT % 43))
                                (SPADCALL
                                 (SPADCALL |v0|
                                           (SPADCALL |lc0| |rfc|
                                                     (QREFELT % 64))
                                           (QREFELT % 72))
                                 (QREFELT % 44))
                                (QREFELT % 48))
                               |denf| (QREFELT % 97))
                              (QREFELT % 48)))
              (LETT |fac1| (QVELT |er| 0))
              (LETT |nn0|
                    (COND
                     ((> (SPADCALL |eiarg_num| (QREFELT % 40)) 1)
                      (|RDEEFX;p_power_in_q| |eiarg_num| |fac1| %))
                     (#6='T 1)))
              (EXIT
               (COND
                ((EQL |nn0| 0)
                 (|error|
                  "impossible, eiarg_num is not divisible by its factor"))
                (#6#
                 (SEQ
                  (LETT |numfp1|
                        (SPADCALL |nfp|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |v0|
                                              (SPADCALL
                                               (SPADCALL |r0| (QREFELT % 73))
                                               (SPADCALL |k| (QREFELT % 60))
                                               (QREFELT % 64))
                                              (QREFELT % 72))
                                    |x| (QREFELT % 61))
                                   |denfp| (QREFELT % 135))
                                  (QREFELT % 48)))
                  (LETT |coeff1|
                        (SPADCALL (SPADCALL |numfp1| |denf| (QREFELT % 97))
                                  |u0| (QREFELT % 205)))
                  (LETT |coeff1_r|
                        (SPADCALL (SPADCALL |coeff1| (QREFELT % 46))
                                  (SPADCALL |eiarg_num| (QREFELT % 46))
                                  (QREFELT % 49)))
                  (LETT |denf1| (SPADCALL |coeff1_r| (QREFELT % 39)))
                  (LETT |dvr|
                        (SPADCALL (SPADCALL |coeff1_r| (QREFELT % 38)) |denf1|
                                  (QREFELT % 317)))
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                    (SEQ
                     (LETT |einum| (SPADCALL |einum| |denf1| (QREFELT % 189)))
                     (LETT |ddf|
                           (SPADCALL (SPADCALL (QVELT |er| 0) (QREFELT % 191))
                                     |denf1| (QREFELT % 189)))
                     (LETT |ppu|
                           (SPADCALL |denf1| |ddf| |einum| (QREFELT % 321)))
                     (EXIT
                      (COND ((QEQCAR |ppu| 1) (|error| "impossible 4"))
                            (#6#
                             (SEQ (LETT |einum| (QCDR (QCDR |ppu|)))
                                  (EXIT
                                   (LETT |einum|
                                         (SPADCALL
                                          (SPADCALL |einum|
                                                    (SPADCALL |denf1|
                                                              (QREFELT % 191))
                                                    (QREFELT % 97))
                                          |denf1| (QREFELT % 189)))))))))))
                  (LETT |lnum1|
                        (COND
                         ((> (SPADCALL |fac1| (QREFELT % 40)) 1)
                          (SPADCALL (QCDR |dvr|) (QREFELT % 201)))
                         (#6#
                          (SEQ
                           (LETT |reml|
                                 (|RDEEFX;decompose1| (QCDR |dvr|) |denf1|
                                  (LIST |fac1|) %))
                           (EXIT
                            (SPADCALL (|SPADfirst| |reml|)
                                      (QREFELT % 201)))))))
                  (LETT |einum1| (SPADCALL |einum| (QREFELT % 201)))
                  (LETT |u1| (QVELT |er| 10))
                  (LETT |res1u|
                        (SPADCALL (SPADCALL |einum1| |lnum1| (QREFELT % 66))
                                  |u1| |x| (QREFELT % 307)))
                  (EXIT
                   (COND
                    ((QEQCAR |res1u| 1)
                     (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                             (|spadConstant| % 102) (|spadConstant| % 196)))
                    (#6#
                     (SEQ (LETT |res1| (QCDR |res1u|))
                          (LETT |ansp1| (|spadConstant| % 74))
                          (LETT |lp_cor| (|spadConstant| % 196))
                          (LETT |eiarg_inc|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (QVELT |er| 8) (QREFELT % 73)) 1
                                   (QREFELT % 43))
                                  (SPADCALL (QVELT |er| 9) (QREFELT % 44))
                                  (QREFELT % 48))
                                 |denf| (QREFELT % 97)))
                          (LETT |zzl|
                                (COND
                                 ((SPADCALL |cfac| (|spadConstant| % 102)
                                            (QREFELT % 111))
                                  (LIST (|spadConstant| % 74)))
                                 (#6# (SPADCALL |cfac| (QREFELT % 325)))))
                          (SEQ (LETT |ck| NIL) (LETT #4# |res1|) G190
                               (COND
                                ((OR (ATOM #4#)
                                     (PROGN (LETT |ck| (CAR #4#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (LETT |ci| (SPADCALL |ck| 1 (QREFELT % 29)))
                                (LETT |kif| (SPADCALL |ck| 2 (QREFELT % 29)))
                                (LETT |ki| (SPADCALL |kif| (QREFELT % 30)))
                                (LETT |einumi|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| % 102)
                                                  (QREFELT % 111))
                                        (SPADCALL |eiarg_num|
                                                  (SPADCALL |kif| |eiarg_inc|
                                                            (QREFELT % 135))
                                                  (QREFELT % 48)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT % 72))
                                          |lc0| (QREFELT % 66))
                                         |eiarg_num| (QREFELT % 135)))))
                                (LETT |nn|
                                      (COND
                                       ((> (SPADCALL |einumi| (QREFELT % 40))
                                           1)
                                        (|RDEEFX;p_power_in_q| |einumi| |fac1|
                                         %))
                                       ('T 1)))
                                (COND
                                 ((EQL |nn| 0)
                                  (|error|
                                   "impossible, einumi not divisible by its factor")))
                                (LETT |ci|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |nn0| (QREFELT % 73)) |ci|
                                        (QREFELT % 64))
                                       (SPADCALL |nn| (QREFELT % 73))
                                       (QREFELT % 66)))
                                (LETT |eiargi_r|
                                      (SPADCALL
                                       (SPADCALL |einumi| (QREFELT % 46))
                                       (SPADCALL |denf| (QREFELT % 46))
                                       (QREFELT % 49)))
                                (LETT |eiargi|
                                      (SPADCALL |eiargi_r| |k| (QREFELT % 59)))
                                (LETT |shifti|
                                      (COND
                                       ((SPADCALL |cfac| (|spadConstant| % 102)
                                                  (QREFELT % 111))
                                        (SPADCALL (QVELT |er| 6)
                                                  (SPADCALL |kif|
                                                            (QVELT |er| 11)
                                                            (QREFELT % 64))
                                                  (QREFELT % 72)))
                                       ('T
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lc0| |kif| (QREFELT % 72))
                                          |lc0| (QREFELT % 66))
                                         (SPADCALL (QVELT |er| 6)
                                                   (SPADCALL |lc0| |rfc|
                                                             (QREFELT % 64))
                                                   (QREFELT % 72))
                                         (QREFELT % 64)))))
                                (LETT |ansp1|
                                      (SPADCALL |ansp1|
                                                (SPADCALL
                                                 (SPADCALL |ci|
                                                           (SPADCALL
                                                            (SPADCALL |shifti|
                                                                      (QREFELT
                                                                       % 47))
                                                            (QREFELT % 323))
                                                           (QREFELT % 64))
                                                 (SPADCALL |eiargi|
                                                           (QREFELT % 324))
                                                 (QREFELT % 64))
                                                (QREFELT % 72)))
                                (LETT |coefi|
                                      (SPADCALL
                                       (SPADCALL |ci| |u0| (QREFELT % 64))
                                       (SPADCALL |u1| |ki| (QREFELT % 79))
                                       (QREFELT % 64)))
                                (LETT |eiargp|
                                      (SPADCALL |denfp|
                                                (SPADCALL
                                                 (SPADCALL |eiargi| |x|
                                                           (QREFELT % 61))
                                                 |k| (QREFELT % 35))
                                                (QREFELT % 270)))
                                (EXIT
                                 (LETT |lp_cor|
                                       (SPADCALL |lp_cor|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |coefi|
                                                              (QREFELT % 44))
                                                    (QREFELT % 46))
                                                   |eiargp| (QREFELT % 315))
                                                  |eiargi_r| (QREFELT % 49))
                                                 (QREFELT % 327)))))
                               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                          (LETT |ansp| (|spadConstant| % 74))
                          (COND
                           ((SPADCALL |cfac| (|spadConstant| % 102)
                                      (QREFELT % 111))
                            (LETT |ansp| |ansp1|))
                           (#6#
                            (SEQ
                             (LETT |lp_cor|
                                   (|RDEEFX;get_trace| |lp_cor| |k| |rf1k|
                                    |cfac| %))
                             (EXIT
                              (SEQ (LETT |zz| NIL) (LETT #5# |zzl|) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |zz| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ansp|
                                           (SPADCALL |ansp|
                                                     (SPADCALL |ansp1| |rf1k|
                                                               |zz|
                                                               (QREFELT % 67))
                                                     (QREFELT % 72)))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT NIL))))))
                          (LETT |dvr2|
                                (SPADCALL (SPADCALL |lp_cor| (QREFELT % 38))
                                          (SPADCALL |lp_cor| (QREFELT % 39))
                                          (QREFELT % 317)))
                          (EXIT
                           (VECTOR |ansp|
                                   (SPADCALL
                                    (SPADCALL (QCDR |dvr2|) (QREFELT % 46))
                                    (SPADCALL
                                     (SPADCALL |lp_cor| (QREFELT % 39))
                                     (QREFELT % 46))
                                    (QREFELT % 49))
                                   (QCAR |dvr2|)
                                   (|spadConstant| % 196)))))))))))))) 

(SDEFUN |RDEEFX;linear_log_case|
        ((|num| (|SparseUnivariatePolynomial| F))
         (|den| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|x| (|Symbol|))
         (%
          (|Record| (|:| |primpart| F)
                    (|:| |logpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |polypart| (|SparseUnivariatePolynomial| F))
                    (|:| |specpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|al|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                      (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                      (|:| |u_part2| F) (|:| |shift_part2| F))))
          (#1=#:G1156 NIL) (#2=#:G1157 NIL)
          (|eidens| (|List| (|SparseUnivariatePolynomial| F)))
          (|einums| (|List| (|SparseUnivariatePolynomial| F))) (|er| NIL)
          (#3=#:G1159 NIL) (|einum| NIL) (#4=#:G1158 NIL)
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ansp| (F))
          (|lp_cor| #5=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #5#) (|poly_cor| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (LETT |al| (|RDEEFX;lin_args| |den| |nf| |k| |vlst| |ulst| |x| %))
          (EXIT
           (COND
            ((NULL |al|)
             (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                     (|spadConstant| % 102) (|spadConstant| % 196)))
            ('T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |er| NIL) (LETT #2# |al|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |er| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS (QVELT |er| 0) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| %))
              (LETT |ansp| (|spadConstant| % 74))
              (LETT |lp_cor| (|spadConstant| % 196))
              (LETT |sp_cor| (|spadConstant| % 196))
              (LETT |poly_cor| (|spadConstant| % 102))
              (SEQ (LETT |er| NIL) (LETT #3# |al|) (LETT |einum| NIL)
                   (LETT #4# |einums|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |einum| (CAR #4#)) NIL)
                         (ATOM #3#) (PROGN (LETT |er| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ar1|
                          (COND
                           ((QVELT |er| 7)
                            (|RDEEFX;solve_linear_factor| |nf|
                             (|spadConstant| % 108) |nfp|
                             (|spadConstant| % 108) |k| |x| |einum| |er| %))
                           ('T
                            (|RDEEFX;solve_factor1| |nf| (|spadConstant| % 108)
                             |nfp| (|spadConstant| % 108) |k| |x| |einum|
                             (QVELT |er| 0)
                             (VECTOR (QVELT |er| 0) (QVELT |er| 1)
                                     (QVELT |er| 2) (QVELT |er| 3)
                                     (QVELT |er| 4) (QVELT |er| 5)
                                     (QVELT |er| 6))
                             %))))
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT % 72)))
                    (LETT |lp_cor|
                          (SPADCALL |lp_cor| (QVELT |ar1| 1) (QREFELT % 327)))
                    (LETT |sp_cor|
                          (SPADCALL |sp_cor| (QVELT |ar1| 3) (QREFELT % 327)))
                    (EXIT
                     (LETT |poly_cor|
                           (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                     (QREFELT % 48)))))
                   (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))) 

(SDEFUN |RDEEFX;handle_nonlinear_log|
        ((|num| (|SparseUnivariatePolynomial| F))
         (|den| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|)) (|vlst| (|List| F)) (|ulst| (|List| F))
         (|lei|
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F))))
         (|dbasis| (|Vector| (|SparseUnivariatePolynomial| F)))
         (|dtrans| (|Matrix| (|Integer|)))
         (%
          (|Record| (|:| |primpart| F)
                    (|:| |logpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |polypart| (|SparseUnivariatePolynomial| F))
                    (|:| |specpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|)) (|i| NIL)
          (#1=#:G1186 NIL) (#2=#:G1187 NIL) (|esum| (|Integer|))
          (#3=#:G1185 NIL) (|j0| (|NonNegativeInteger|))
          (|bpols| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G1190 NIL)
          (#5=#:G1189 NIL) (|einum| NIL) (#6=#:G1188 NIL) (|ansp| (F))
          (|lp_cor| #7=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #7#) (|poly_cor| (|SparseUnivariatePolynomial| F))
          (|bpol| (|SparseUnivariatePolynomial| F)) (#8=#:G1192 NIL) (|j| NIL)
          (#9=#:G1191 NIL)
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|er1|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F)))
          (|r0| (|Integer|)) (#10=#:G1193 NIL) (|er| NIL) (#11=#:G1194 NIL)
          (|ril| (|List| (|Integer|))) (|r1| (|Integer|)) (|v0| (F)) (|v1| (F))
          (|uvu|
           (|Union|
            (|Record| (|:| |u_part| F) (|:| |v_part| F)
                      (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|)))
            "failed"))
          (|uv|
           (|Record| (|:| |u_part| F) (|:| |v_part| F)
                     (|:| |exponent| (|Integer|)) (|:| |coeff| (|Integer|))))
          (|u1| (F))
          (|er2|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |has_part2?| (|Boolean|))
                     (|:| |ratpart2| (|Integer|)) (|:| |v_part2| F)
                     (|:| |u_part2| F) (|:| |shift_part2| F)))
          (|einums| (|List| (|SparseUnivariatePolynomial| F)))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F))))))
         (SEQ (LETT |n| (LENGTH |lei|)) (LETT |m| (QVSIZE |dbasis|))
              (LETT |bpols| NIL) (LETT |lei1| NIL)
              (SEQ (LETT |i| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |esum| 0)
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| 1) (LETT #2# |n|) G190
                               (COND ((|greater_SI| |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (SPADCALL |dtrans| |i| |j| (QREFELT % 328))
                                    1)
                                   (SEQ (LETT |esum| (+ |esum| 1))
                                        (EXIT
                                         (COND
                                          ((EQL |esum| 2)
                                           (PROGN
                                            (LETT #3# 1)
                                            (GO #12=#:G1165)))
                                          ('T (LETT |j0| |j|)))))))))
                               (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                               (EXIT NIL)))
                         #12# (EXIT #3#))
                        (EXIT
                         (COND
                          ((EQL |esum| 1)
                           (SEQ
                            (LETT |bpols|
                                  (CONS (SPADCALL |dbasis| |i| (QREFELT % 330))
                                        |bpols|))
                            (EXIT
                             (LETT |lei1|
                                   (CONS (SPADCALL |lei| |j0| (QREFELT % 333))
                                         |lei1|))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ansp| (|spadConstant| % 74))
              (LETT |lp_cor| (|spadConstant| % 196))
              (LETT |sp_cor| (|spadConstant| % 196))
              (LETT |poly_cor| (|spadConstant| % 102))
              (COND
               ((NULL (NULL |bpols|))
                (EXIT
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |bpols| %))
                  (SEQ (LETT |er| NIL) (LETT #4# |lei1|) (LETT #5# |bpols|)
                       (LETT |einum| NIL) (LETT #6# |einums|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |einum| (CAR #6#)) NIL)
                             (ATOM #5#) (PROGN (LETT |bpol| (CAR #5#)) NIL)
                             (ATOM #4#) (PROGN (LETT |er| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| |bpol| |er| %))
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT % 72)))
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT % 327)))
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT % 327)))
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT % 48)))))
                       (LETT #6#
                             (PROG1 (CDR #6#)
                               (LETT #5#
                                     (PROG1 (CDR #5#) (LETT #4# (CDR #4#))))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))
              (LETT |bpol| (SPADCALL |dbasis| 1 (QREFELT % 330)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |bpol| (QREFELT % 40)) 1 (QREFELT % 229))
                 (|error| "degree(bpol) ~= 1"))
                (#13='T
                 (SEQ
                  (SEQ (LETT |er| NIL) (LETT #8# |lei|) (LETT |j| 1)
                       (LETT #9# |n|) G190
                       (COND
                        ((OR (|greater_SI| |j| #9#) (ATOM #8#)
                             (PROGN (LETT |er| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |dtrans| 1 |j| (QREFELT % 328)) 1)
                           (LETT |lei1| (CONS |er| |lei1|))))))
                       (LETT |j| (PROG1 (|inc_SI| |j|) (LETT #8# (CDR #8#))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |er1| (|SPADfirst| |lei1|)) (LETT |r0| (QVELT |er1| 1))
                  (LETT |lei| (CDR |lei1|))
                  (LETT |ril|
                        (PROGN
                         (LETT #10# NIL)
                         (SEQ (LETT |er| NIL) (LETT #11# |lei|) G190
                              (COND
                               ((OR (ATOM #11#)
                                    (PROGN (LETT |er| (CAR #11#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #10#
                                      (CONS (- (QVELT |er| 1) |r0|) #10#))))
                              (LETT #11# (CDR #11#)) (GO G190) G191
                              (EXIT (NREVERSE #10#)))))
                  (LETT |r1| (SPADCALL |ril| (QREFELT % 115)))
                  (LETT |v0| (QVELT |er1| 2))
                  (LETT |v1|
                        (SPADCALL (QVELT (|SPADfirst| |lei|) 2) |v0|
                                  (QREFELT % 77)))
                  (LETT |v1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |r1| (QREFELT % 73))
                                   (SPADCALL
                                    (- (QVELT (|SPADfirst| |lei|) 1) |r0|)
                                    (QREFELT % 73))
                                   (QREFELT % 66))
                         |v1| (QREFELT % 64)))
                  (LETT |uvu| (|RDEEFX;get_uv| |v1| |vlst| |ulst| |k| |x| %))
                  (EXIT
                   (COND
                    ((QEQCAR |uvu| 1) (|error| "impossible, get_uv failed"))
                    (#13#
                     (SEQ (LETT |uv| (QCDR |uvu|))
                          (LETT |u1|
                                (SPADCALL (QVELT |uv| 0)
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT % 27)) 1
                                            (QREFELT % 29))
                                           |r1| (QREFELT % 79))
                                          (QREFELT % 64)))
                          (LETT |er2|
                                (VECTOR |bpol| |r0| |v0| (|spadConstant| % 102)
                                        (QVELT |er1| 4) 0 (QVELT |er1| 6) 'T
                                        |r1| |v1| |u1| (QVELT |uv| 1)))
                          (LETT |einums|
                                (|RDEEFX;decompose1| |num| |den| (LIST |bpol|)
                                 %))
                          (LETT |ar1|
                                (|RDEEFX;solve_linear_factor| |nf| |denf| |nfp|
                                 |denfp| |k| |x| (|SPADfirst| |einums|) |er2|
                                 %))
                          (EXIT |ar1|)))))))))))) 

(SDEFUN |RDEEFX;handle_logpart|
        ((|num| (|SparseUnivariatePolynomial| F))
         (|den| (|SparseUnivariatePolynomial| F))
         (|nf| (|SparseUnivariatePolynomial| F))
         (|denf| (|SparseUnivariatePolynomial| F))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|vlst| (|List| F)) (|ulst| (|List| F)) (|x| (|Symbol|))
         (%
          (|Record| (|:| |primpart| F)
                    (|:| |logpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |polypart| (|SparseUnivariatePolynomial| F))
                    (|:| |specpart|
                         (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((#1=#:G1230 NIL) (#2=#:G1231 NIL)
          (|dr|
           (|Record|
            (|:| |basis| #3=(|Vector| (|SparseUnivariatePolynomial| F)))
            (|:| |transform| #4=(|Matrix| (|Integer|)))))
          (|lp| (|Fraction| (|SparseUnivariatePolynomial| F))) (#5=#:G1229 NIL)
          (|m| (|NonNegativeInteger|)) (#6=#:G1232 NIL)
          (|bi| (|SparseUnivariatePolynomial| F))
          (|ndbl| (|List| (|SparseUnivariatePolynomial| F)))
          (|nidbl| (|List| (|Integer|))) (|n| (|NonNegativeInteger|))
          (#7=#:G1235 NIL) (|eiden| NIL) (#8=#:G1234 NIL) (|i| NIL)
          (#9=#:G1233 NIL)
          (|neidens| (|List| (|SparseUnivariatePolynomial| F)))
          (|lei1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|eidens| (|List| (|SparseUnivariatePolynomial| F)))
          (|ninds| (|List| (|Integer|)))
          (|lei|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |ratpart| (|Integer|)) (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F))))
          (|dbasis| #3#) (|dtrans| #4#)
          (|einums| (|List| (|SparseUnivariatePolynomial| F))) (|er| NIL)
          (#10=#:G1237 NIL) (|einum| NIL) (#11=#:G1236 NIL)
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|ansp| (F))
          (|lp_cor| #12=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|sp_cor| #12#) (|poly_cor| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL |k| '|log| (QREFELT % 22))
            (COND
             ((SPADCALL |denf| (|spadConstant| % 108) (QREFELT % 111))
              (COND
               ((<= (SPADCALL |nf| (QREFELT % 40)) 1)
                (EXIT
                 (|RDEEFX;linear_log_case| |num| |den| |nf| |nfp| |k| |vlst|
                  |ulst| |x| %))))))))
          (COND
           ((SPADCALL |denf| (|spadConstant| % 108) (QREFELT % 111))
            (COND
             ((EQL (SPADCALL |nf| (QREFELT % 40)) 0)
              (EXIT
               (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                       (|spadConstant| % 102) (|spadConstant| % 196)))))))
          (LETT |lei|
                (|RDEEFX;ei_args| |den| |nf| |denf| |k| |vlst| |ulst| |x| %))
          (EXIT
           (COND
            ((NULL |lei|)
             (VECTOR (|spadConstant| % 74) (|spadConstant| % 196)
                     (|spadConstant| % 102) (|spadConstant| % 196)))
            (#13='T
             (SEQ
              (LETT |eidens|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |er| NIL) (LETT #2# |lei|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |er| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS (QVELT |er| 0) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |ansp| (|spadConstant| % 74))
              (LETT |lp_cor| (|spadConstant| % 196))
              (LETT |sp_cor| (|spadConstant| % 196))
              (LETT |poly_cor| (|spadConstant| % 102))
              (EXIT
               (COND
                ((SPADCALL |k| '|log| (QREFELT % 22))
                 (SEQ
                  (LETT |dr|
                        (SPADCALL (SPADCALL |eidens| (QREFELT % 334))
                                  (QREFELT % 337)))
                  (LETT |dbasis| (QCAR |dr|)) (LETT |dtrans| (QCDR |dr|))
                  (LETT |lp|
                        (SPADCALL (SPADCALL |num| (QREFELT % 46))
                                  (SPADCALL |den| (QREFELT % 46))
                                  (QREFELT % 49)))
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (LETT |ar1|
                                (|RDEEFX;handle_nonlinear_log| |num| |den| |nf|
                                 |denf| |nfp| |denfp| |k| |x| |vlst| |ulst|
                                 |lei| |dbasis| |dtrans| %))
                          (LETT |ansp|
                                (SPADCALL |ansp| (QVELT |ar1| 0)
                                          (QREFELT % 72)))
                          (LETT |lp_cor|
                                (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                          (QREFELT % 327)))
                          (LETT |sp_cor|
                                (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                          (QREFELT % 327)))
                          (LETT |poly_cor|
                                (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                          (QREFELT % 48)))
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |ar1| 1) (|spadConstant| % 196)
                                       (QREFELT % 338))
                             (PROGN (LETT #5# 1) (GO #14=#:G1220)))
                            ('T
                             (SEQ
                              (LETT |lp|
                                    (SPADCALL |lp| (QVELT |ar1| 1)
                                              (QREFELT % 269)))
                              (EXIT
                               (COND
                                ((SPADCALL |lp| (|spadConstant| % 196)
                                           (QREFELT % 338))
                                 (PROGN (LETT #5# 1) (GO #14#)))
                                ('T
                                 (SEQ
                                  (LETT |num| (SPADCALL |lp| (QREFELT % 38)))
                                  (LETT |den| (SPADCALL |lp| (QREFELT % 39)))
                                  (LETT |ndbl| NIL) (LETT |nidbl| NIL)
                                  (LETT |m| (QVSIZE |dbasis|))
                                  (SEQ (LETT |i| 1) (LETT #6# |m|) G190
                                       (COND
                                        ((|greater_SI| |i| #6#) (GO G191)))
                                       (SEQ
                                        (LETT |bi|
                                              (SPADCALL |dbasis| |i|
                                                        (QREFELT % 330)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR
                                            (SPADCALL |den| |bi|
                                                      (QREFELT % 107))
                                            0)
                                           (SEQ
                                            (LETT |ndbl| (CONS |bi| |ndbl|))
                                            (EXIT
                                             (LETT |nidbl|
                                                   (CONS |i| |nidbl|))))))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((EQL (LENGTH |ndbl|) |m|)
                                     (|error|
                                      "no progress in handle_nonlinear_log"))
                                    ('T
                                     (SEQ (LETT |ndbl| (NREVERSE |ndbl|))
                                          (LETT |nidbl| (NREVERSE |nidbl|))
                                          (LETT |neidens| NIL)
                                          (LETT |ninds| NIL) (LETT |lei1| NIL)
                                          (LETT |n| (LENGTH |eidens|))
                                          (SEQ (LETT |er| NIL) (LETT #7# |lei|)
                                               (LETT |eiden| NIL)
                                               (LETT #8# |eidens|) (LETT |i| 1)
                                               (LETT #9# |n|) G190
                                               (COND
                                                ((OR (|greater_SI| |i| #9#)
                                                     (ATOM #8#)
                                                     (PROGN
                                                      (LETT |eiden| (CAR #8#))
                                                      NIL)
                                                     (ATOM #7#)
                                                     (PROGN
                                                      (LETT |er| (CAR #7#))
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR
                                                    (SPADCALL |den| |eiden|
                                                              (QREFELT % 107))
                                                    0)
                                                   (SEQ
                                                    (LETT |neidens|
                                                          (CONS |eiden|
                                                                |neidens|))
                                                    (LETT |ninds|
                                                          (CONS |i| |ninds|))
                                                    (EXIT
                                                     (LETT |lei1|
                                                           (CONS |er|
                                                                 |lei1|))))))))
                                               (LETT |i|
                                                     (PROG1 (|inc_SI| |i|)
                                                       (LETT #8#
                                                             (PROG1 (CDR #8#)
                                                               (LETT #7#
                                                                     (CDR
                                                                      #7#))))))
                                               (GO G190) G191 (EXIT NIL))
                                          (LETT |eidens| (NREVERSE |neidens|))
                                          (LETT |ninds| (NREVERSE |ninds|))
                                          (LETT |lei| (NREVERSE |lei1|))
                                          (LETT |dbasis|
                                                (SPADCALL |ndbl|
                                                          (QREFELT % 334)))
                                          (EXIT
                                           (LETT |dtrans|
                                                 (SPADCALL |dtrans| |nidbl|
                                                           |ninds|
                                                           (QREFELT %
                                                                    339)))))))))))))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #14# (EXIT #5#))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))
                (#13#
                 (SEQ
                  (LETT |einums| (|RDEEFX;decompose1| |num| |den| |eidens| %))
                  (SEQ (LETT |er| NIL) (LETT #10# |lei|) (LETT |einum| NIL)
                       (LETT #11# |einums|) G190
                       (COND
                        ((OR (ATOM #11#) (PROGN (LETT |einum| (CAR #11#)) NIL)
                             (ATOM #10#) (PROGN (LETT |er| (CAR #10#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ar1|
                              (|RDEEFX;solve_factor1| |nf| |denf| |nfp| |denfp|
                               |k| |x| |einum| (QVELT |er| 0) |er| %))
                        (LETT |ansp|
                              (SPADCALL |ansp| (QVELT |ar1| 0) (QREFELT % 72)))
                        (LETT |lp_cor|
                              (SPADCALL |lp_cor| (QVELT |ar1| 1)
                                        (QREFELT % 327)))
                        (LETT |sp_cor|
                              (SPADCALL |sp_cor| (QVELT |ar1| 3)
                                        (QREFELT % 327)))
                        (EXIT
                         (LETT |poly_cor|
                               (SPADCALL |poly_cor| (QVELT |ar1| 2)
                                         (QREFELT % 48)))))
                       (LETT #11# (PROG1 (CDR #11#) (LETT #10# (CDR #10#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (VECTOR |ansp| |lp_cor| |poly_cor| |sp_cor|))))))))))))) 

(SDEFUN |RDEEFX;gamma_denominator|
        ((|denf| #1=(|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (%
          (|Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
                    (|:| |exponent| (|Integer|)))))
        (SPROG
         ((|s_deg| (|Integer|)) (#2=#:G1239 NIL) (#3=#:G1241 NIL) (|denf1| #1#)
          (|fnf| (|Factored| (|SparseUnivariatePolynomial| F)))
          (|nffacs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#4=#:G1277 NIL) (#5=#:G1278 NIL) (|lexp| (|List| (|Integer|)))
          (|l1| (|Integer|)) (#6=#:G1279 NIL) (|fac1| NIL) (#7=#:G1280 NIL)
          (#8=#:G1267 NIL) (#9=#:G1272 NIL)
          (|gden1| (|SparseUnivariatePolynomial| F)))
         (SEQ (LETT |s_deg| 0) (LETT |denf1| |denf|)
              (COND
               ((SPADCALL |k| '|exp| (QREFELT % 22))
                (SEQ (LETT |s_deg| (SPADCALL |denf| (QREFELT % 215)))
                     (EXIT
                      (LETT |denf1|
                            (PROG2
                                (LETT #3#
                                      (SPADCALL |denf|
                                                (SPADCALL (|spadConstant| % 32)
                                                          (PROG1
                                                              (LETT #2#
                                                                    |s_deg|)
                                                            (|check_subtype2|
                                                             (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                                          (QREFELT % 43))
                                                (QREFELT % 107)))
                                (QCDR #3#)
                              (|check_union2| (QEQCAR #3# 0)
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 7))
                                              (|Union|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT % 7))
                                               "failed")
                                              #3#)))))))
              (EXIT
               (COND
                ((SPADCALL |denf1| (|spadConstant| % 108) (QREFELT % 111))
                 (COND ((EQL |s_deg| 0) (CONS (|spadConstant| % 108) 0))
                       (#10='T
                        (CONS (SPADCALL (|spadConstant| % 32) 1 (QREFELT % 43))
                              |s_deg|))))
                (#10#
                 (SEQ (LETT |fnf| (SPADCALL |denf1| (QREFELT % 239)))
                      (LETT |nffacs| (SPADCALL |fnf| (QREFELT % 129)))
                      (LETT |lexp|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |fac1| NIL) (LETT #5# |nffacs|) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |fac1| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4# (CONS (QVELT |fac1| 2) #4#))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (LETT |l1|
                            (SPADCALL (CONS |s_deg| |lexp|) (QREFELT % 115)))
                      (EXIT
                       (COND ((EQL |l1| 1) (CONS |denf| 1))
                             (#10#
                              (SEQ
                               (LETT |gden1|
                                     (SPADCALL (ELT % 97)
                                               (PROGN
                                                (LETT #6# NIL)
                                                (SEQ (LETT |fac1| NIL)
                                                     (LETT #7# |nffacs|) G190
                                                     (COND
                                                      ((OR (ATOM #7#)
                                                           (PROGN
                                                            (LETT |fac1|
                                                                  (CAR #7#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #6#
                                                             (CONS
                                                              (|RDEEFX;my_exp|
                                                               (QVELT |fac1| 1)
                                                               (PROG1
                                                                   (LETT #8#
                                                                         (|quotient_INT|
                                                                          (QVELT
                                                                           |fac1|
                                                                           2)
                                                                          |l1|))
                                                                 (|check_subtype2|
                                                                  (>= #8# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #8#))
                                                               %)
                                                              #6#))))
                                                     (LETT #7# (CDR #7#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #6#))))
                                               (QREFELT % 309)))
                               (COND
                                ((> |s_deg| 0)
                                 (LETT |gden1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 32)
                                                  (PROG1
                                                      (LETT #9#
                                                            (|quotient_INT|
                                                             |s_deg| |l1|))
                                                    (|check_subtype2|
                                                     (>= #9# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #9#))
                                                  (QREFELT % 43))
                                        |gden1| (QREFELT % 97)))))
                               (EXIT (CONS |gden1| |l1|))))))))))))) 

(SDEFUN |RDEEFX;special_Hermite|
        ((|r| (|Fraction| (|SparseUnivariatePolynomial| F)))
         (|nfp| (|SparseUnivariatePolynomial| F))
         (|ndenf| (|SparseUnivariatePolynomial| F))
         (|denfp| (|SparseUnivariatePolynomial| F))
         (|deriv|
          (|Mapping| (|SparseUnivariatePolynomial| F)
                     (|SparseUnivariatePolynomial| F)))
         (%
          (|Record|
           (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
           (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|ad| #1=(|SparseUnivariatePolynomial| F))
          (|hh1| (|SparseUnivariatePolynomial| F)) (#2=#:G1295 NIL)
          (#3=#:G1285 NIL)
          (|ee|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                     (|:| |coef2| (|SparseUnivariatePolynomial| F))))
          (|nn| (|SparseUnivariatePolynomial| F))
          (|an| (|SparseUnivariatePolynomial| F))
          (|nfp1| (|SparseUnivariatePolynomial| F))
          (|numr| (|SparseUnivariatePolynomial| F)) (#4=#:G1288 NIL)
          (|denr| #1#) (|mult| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |ad| (LETT |denr| (SPADCALL |r| (QREFELT % 39))))
                (LETT |numr| (SPADCALL |r| (QREFELT % 38)))
                (LETT |an| (|spadConstant| % 102))
                (LETT |mult| (|spadConstant| % 108))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (LETT |hh1| (SPADCALL |denr| |ndenf| (QREFELT % 105)))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |hh1| (QREFELT % 40)) 0)
                          (PROGN
                           (LETT #2#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |denfp| |an| (QREFELT % 97)) |ad|
                                   (QREFELT % 195))
                                  (SPADCALL |numr| |denr| (QREFELT % 195))))
                           (GO #5=#:G1294)))
                         ('T
                          (SEQ
                           (LETT |ee|
                                 (PROG2
                                     (LETT #3#
                                           (SPADCALL |nfp| |hh1| |numr|
                                                     (QREFELT % 321)))
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0)
                                                   (|Record|
                                                    (|:| |coef1|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 7)))
                                                    (|:| |coef2|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 7))))
                                                   (|Union|
                                                    (|Record|
                                                     (|:| |coef1|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 7)))
                                                     (|:| |coef2|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 7))))
                                                    "failed")
                                                   #3#)))
                           (LETT |nn|
                                 (SPADCALL (QCAR |ee|) |hh1| (QREFELT % 189)))
                           (LETT |an|
                                 (SPADCALL |an|
                                           (SPADCALL |mult| |nn|
                                                     (QREFELT % 97))
                                           (QREFELT % 48)))
                           (LETT |nfp1|
                                 (SPADCALL |nfp|
                                           (PROG2
                                               (LETT #4#
                                                     (SPADCALL
                                                      (SPADCALL |denfp|
                                                                (SPADCALL
                                                                 |denr|
                                                                 |deriv|)
                                                                (QREFELT % 97))
                                                      |denr| (QREFELT % 107)))
                                               (QCDR #4#)
                                             (|check_union2| (QEQCAR #4# 0)
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT % 7))
                                                             (|Union|
                                                              (|SparseUnivariatePolynomial|
                                                               (QREFELT % 7))
                                                              #6="failed")
                                                             #4#))
                                           (QREFELT % 45)))
                           (LETT |numr|
                                 (SPADCALL
                                  (SPADCALL |numr|
                                            (SPADCALL |nfp1| |nn|
                                                      (QREFELT % 97))
                                            (QREFELT % 45))
                                  (SPADCALL
                                   (SPADCALL |denfp| |nn| (QREFELT % 97))
                                   |deriv|)
                                  (QREFELT % 45)))
                           (LETT |numr|
                                 (PROG2
                                     (LETT #4#
                                           (SPADCALL |numr| |hh1|
                                                     (QREFELT % 107)))
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 7))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT % 7))
                                                    #6#)
                                                   #4#)))
                           (LETT |denr|
                                 (PROG2
                                     (LETT #4#
                                           (SPADCALL |denr| |hh1|
                                                     (QREFELT % 107)))
                                     (QCDR #4#)
                                   (|check_union2| (QEQCAR #4# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 7))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT % 7))
                                                    #6#)
                                                   #4#)))
                           (EXIT
                            (LETT |mult|
                                  (SPADCALL |mult| |hh1| (QREFELT % 97)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #2#)))) 

(SDEFUN |RDEEFX;ei_int_log|
        ((|f| (F)) (|ng| (|SparseUnivariatePolynomial| F)) (|x| (|Symbol|))
         (|k| (|Kernel| F))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|ngu| (F)) (#1=#:G1305 NIL) (|k1| NIL) (#2=#:G1306 NIL)
          (|lk| (|List| (|Kernel| F))) (|kf| (F)) (|dk| (F)) (|m| NIL)
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|am1| (F)) (|kfm| (F)) (|gm| (F))
          (|res2|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|r1| (F)) (|rh| (F)) (|is_sol| (|Boolean|)))
         (SEQ
          (LETT |ngu|
                (SPADCALL (SPADCALL |ng| (QREFELT % 46)) |k| (QREFELT % 59)))
          (LETT |lk|
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT % 340))
                           (SPADCALL |ngu| (QREFELT % 340)) (QREFELT % 16))
                 |x| (QREFELT % 15)))
          (LETT |lk|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |k1| NIL) (LETT #2# |lk|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k1| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |k1| |k| (QREFELT % 341))
                          (LETT #1# (CONS |k1| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
          (LETT |dk| (SPADCALL |kf| |x| (QREFELT % 61)))
          (LETT |r1| (|spadConstant| % 74)) (LETT |is_sol| 'T)
          (LETT |rh| (|spadConstant| % 74)) (LETT |am1| (|spadConstant| % 74))
          (SEQ (LETT |m| (SPADCALL |ng| (QREFELT % 40))) G190
               (COND ((< |m| 1) (GO G191)))
               (SEQ
                (LETT |gm|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL (+ |m| 1) (QREFELT % 73)) |dk|
                                  (QREFELT % 64))
                        |am1| (QREFELT % 64))
                       (QREFELT % 47)))
                (COND
                 ((EQL |m| (SPADCALL |ng| (QREFELT % 40)))
                  (SEQ
                   (LETT |gm|
                         (SPADCALL |gm| (SPADCALL |ng| (QREFELT % 103))
                                   (QREFELT % 72)))
                   (EXIT (LETT |ng| (SPADCALL |ng| (QREFELT % 110)))))))
                (LETT |res1| (SPADCALL |f| |gm| |x| |lk| (QREFELT % 55)))
                (LETT |is_sol| (COND (|is_sol| (QVELT |res1| 3)) ('T NIL)))
                (LETT |am1| (QVELT |res1| 0))
                (LETT |kfm| (SPADCALL |kf| |m| (QREFELT % 342)))
                (LETT |r1|
                      (SPADCALL |r1| (SPADCALL |kfm| |am1| (QREFELT % 64))
                                (QREFELT % 72)))
                (EXIT
                 (LETT |rh|
                       (SPADCALL
                        (SPADCALL |rh|
                                  (SPADCALL |kfm| (QVELT |res1| 1)
                                            (QREFELT % 64))
                                  (QREFELT % 72))
                        (SPADCALL
                         (SPADCALL (SPADCALL |m| (QREFELT % 73)) |dk|
                                   (QREFELT % 64))
                         |am1| (QREFELT % 64))
                        (QREFELT % 72)))))
               (LETT |m| (+ |m| -1)) (GO G190) G191 (EXIT NIL))
          (LETT |gm|
                (SPADCALL (SPADCALL |ng| (QREFELT % 201))
                          (SPADCALL |dk| |am1| (QREFELT % 64)) (QREFELT % 77)))
          (LETT |res2| (SPADCALL 1 |f| |gm| |x| (QREFELT % 65)))
          (LETT |r1| (SPADCALL |r1| (QVELT |res2| 0) (QREFELT % 72)))
          (LETT |rh| (SPADCALL |rh| (QVELT |res2| 1) (QREFELT % 72)))
          (LETT |is_sol| (COND (|is_sol| (QVELT |res2| 3)) ('T NIL)))
          (EXIT (VECTOR |r1| |rh| (QVELT |res2| 2) |is_sol|))))) 

(SDEFUN |RDEEFX;ei_int_exp|
        ((|f| (F)) (|ng| (|SparseUnivariatePolynomial| F))
         (|degs| (|NonNegativeInteger|)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|ak| (F)) (|kf| (F)) (|m| (|Integer|)) (|gm| (F)) (|f1| (F))
          (|res1|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|kfm| (F)) (|r1| (F)) (|ansp| (F)) (|rh| (F))
          (|is_sol| (|Boolean|)))
         (SEQ
          (LETT |ak| (SPADCALL (SPADCALL |k| (QREFELT % 27)) 1 (QREFELT % 29)))
          (LETT |kf| (SPADCALL |k| (QREFELT % 60)))
          (LETT |r1| (|spadConstant| % 74)) (LETT |ansp| (|spadConstant| % 74))
          (LETT |is_sol| 'T) (LETT |rh| (|spadConstant| % 74))
          (SEQ G190
               (COND
                ((NULL (SPADCALL |ng| (|spadConstant| % 102) (QREFELT % 109)))
                 (GO G191)))
               (SEQ (LETT |m| (- (SPADCALL |ng| (QREFELT % 40)) |degs|))
                    (LETT |gm| (SPADCALL |ng| (QREFELT % 103)))
                    (LETT |ng| (SPADCALL |ng| (QREFELT % 110)))
                    (LETT |f1|
                          (SPADCALL |f|
                                    (SPADCALL (SPADCALL |m| (QREFELT % 73))
                                              |ak| (QREFELT % 64))
                                    (QREFELT % 72)))
                    (LETT |res1| (SPADCALL 1 |f1| |gm| |x| (QREFELT % 65)))
                    (LETT |kfm| (SPADCALL |kf| |m| (QREFELT % 79)))
                    (LETT |r1|
                          (SPADCALL |r1|
                                    (SPADCALL |kfm| (QVELT |res1| 0)
                                              (QREFELT % 64))
                                    (QREFELT % 72)))
                    (LETT |ansp|
                          (SPADCALL |ansp| (QVELT |res1| 2) (QREFELT % 72)))
                    (LETT |rh|
                          (SPADCALL |rh|
                                    (SPADCALL |kfm| (QVELT |res1| 1)
                                              (QREFELT % 64))
                                    (QREFELT % 72)))
                    (EXIT
                     (LETT |is_sol|
                           (COND (|is_sol| (QVELT |res1| 3)) ('T NIL)))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR |r1| |rh| |ansp| |is_sol|))))) 

(SDEFUN |RDEEFX;get_scoeff|
        ((|scand|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|denf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|der|
          (|Mapping| #1=(|Fraction| (|SparseUnivariatePolynomial| F))
                     (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|res| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (% (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|r0| (|Integer|)) (|cfac| (|SparseUnivariatePolynomial| F))
          (|nf1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|ak| (F))
          (|u0| (F)) (|u_exp| (|Integer|)) (|d| (|Integer|)) (|nfp| #1#)
          (|coeff1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|coeff1_r| #2=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|rfc| (F)) (|rf1k| (|Kernel| F)) (#3=#:G1320 NIL)
          (|l1| (|NonNegativeInteger|))
          (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F))) (|i| NIL)
          (#4=#:G1327 NIL)
          (|gt1| (|Fraction| (|SparseUnivariatePolynomial| F))) (|gt| #2#))
         (SEQ (LETT |r0| (QVELT |scand| 3)) (LETT |cfac| (QVELT |scand| 5))
              (LETT |u0| (QVELT |scand| 8)) (LETT |nf1| (QVELT |scand| 6))
              (COND
               ((SPADCALL |r0| 0 (QREFELT % 89))
                (SEQ
                 (LETT |ak|
                       (SPADCALL (SPADCALL |k| (QREFELT % 27)) 1
                                 (QREFELT % 29)))
                 (EXIT
                  (LETT |u0|
                        (SPADCALL |u0| (SPADCALL |ak| |r0| (QREFELT % 79))
                                  (QREFELT % 64)))))))
              (LETT |u_exp| (QVELT |scand| 9)) (LETT |d| (QVELT |scand| 0))
              (EXIT
               (COND
                ((EQL |d| 0)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|))
                      (LETT |coeff1|
                            (SPADCALL (SPADCALL |u0| (QREFELT % 44)) |nfp|
                                      (QREFELT % 270)))
                      (EXIT (CONS |coeff1| |res|))))
                ((EQL |d| 1)
                 (SEQ (LETT |nfp| (SPADCALL |nf1| |der|))
                      (COND
                       ((OR
                         (SPADCALL (QVELT |scand| 2) (|spadConstant| % 32)
                                   (QREFELT % 130))
                         (SPADCALL |cfac| (|spadConstant| % 102)
                                   (QREFELT % 109)))
                        (EXIT (|error| "impossible coeff"))))
                      (LETT |coeff1|
                            (SPADCALL
                             (SPADCALL (SPADCALL |u0| (QREFELT % 44)) |nfp|
                                       (QREFELT % 270))
                             |nf1| (QREFELT % 49)))
                      (LETT |coeff1_r|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 32) 1
                                         (QREFELT % 43))
                               (QREFELT % 46))
                              |u_exp| (QREFELT % 314))
                             |coeff1| (QREFELT % 315)))
                      (EXIT (CONS |coeff1_r| |res|))))
                ((> |d| 1)
                 (SEQ
                  (COND
                   ((SPADCALL |cfac| (|spadConstant| % 102) (QREFELT % 109))
                    (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT % 240)))
                         (EXIT
                          (LETT |rf1k| (SPADCALL |rfc| (QREFELT % 313)))))))
                  (LETT |l1|
                        (PROG1 (LETT #3# (- |d| 1))
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#)))
                  (LETT |nf2| (QVELT |scand| 7))
                  (LETT |gt|
                        (SPADCALL
                         (SPADCALL (SPADCALL |nf2| |der|)
                                   (SPADCALL |u0| (QREFELT % 44))
                                   (QREFELT % 343))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 32) 1 (QREFELT % 43))
                           (QREFELT % 46))
                          |u_exp| (QREFELT % 314))
                         (QREFELT % 315)))
                  (SEQ (LETT |i| 1) (LETT #4# |l1|) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (LETT |gt1|
                              (COND
                               ((SPADCALL |cfac| (|spadConstant| % 102)
                                          (QREFELT % 111))
                                |gt|)
                               ('T
                                (|RDEEFX;get_trace| |gt| |k| |rf1k| |cfac|
                                 %))))
                        (LETT |res| (CONS |gt1| |res|))
                        (EXIT
                         (LETT |gt| (SPADCALL |gt| |nf2| (QREFELT % 315)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;get_scoeffs|
        ((|scands|
          (|List|
           (|Record| (|:| |degree| (|Integer|))
                     (|:| |factor| (|SparseUnivariatePolynomial| F))
                     (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                     (|:| |v_part| F)
                     (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                     (|:| |new_f|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |radicand|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |u_part| F) (|:| |exponent| (|Integer|))
                     (|:| |shift_part| F) (|:| |a_val| F))))
         (|denf| (|SparseUnivariatePolynomial| F)) (|k| (|Kernel| F))
         (|der|
          (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                     (|Fraction| (|SparseUnivariatePolynomial| F))))
         (% (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|scand| NIL) (#1=#:G1333 NIL)
          (|res| (|List| (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |scand| NIL) (LETT #1# |scands|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |scand| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (|RDEEFX;get_scoeff| |scand| |denf| |k| |der| |res|
                            %))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |RDEEFX;mk_erf1| ((|uc| (F)) (|ff| (F)) (% (F)))
        (SPROG ((|uc1| (F)))
               (SEQ (LETT |uc1| (SPADCALL |uc| (QREFELT % 344)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL (QREFELT % 345)) (QREFELT % 344))
                       (SPADCALL (SPADCALL |uc1| |ff| (QREFELT % 64))
                                 (QREFELT % 346))
                       (QREFELT % 64))
                      |uc1| (QREFELT % 66)))))) 

(SDEFUN |RDEEFX;is_imaginary?| ((|c| (F)) (% (|Boolean|)))
        (SPROG
         ((|nc| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|dc| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|nl| (|List| (|Complex| (|Integer|))))
          (|dl| (|List| (|Complex| (|Integer|)))))
         (SEQ (LETT |nc| (SPADCALL |c| (QREFELT % 177)))
              (LETT |dc| (SPADCALL |c| (QREFELT % 273)))
              (LETT |nl| (SPADCALL |nc| (QREFELT % 348)))
              (LETT |dl| (SPADCALL |dc| (QREFELT % 348)))
              (EXIT
               (COND
                ((SPADCALL (CONS #'|RDEEFX;is_imaginary?!0| %) |dl|
                           (QREFELT % 355))
                 (SPADCALL (CONS #'|RDEEFX;is_imaginary?!1| %) |nl|
                           (QREFELT % 355)))
                ('T NIL)))))) 

(SDEFUN |RDEEFX;is_imaginary?!1| ((|c1| NIL) (% NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT % 356)) (|spadConstant| % 351)
                  (QREFELT % 352))) 

(SDEFUN |RDEEFX;is_imaginary?!0| ((|c1| NIL) (% NIL))
        (SPADCALL (SPADCALL |c1| (QREFELT % 350)) (|spadConstant| % 351)
                  (QREFELT % 352))) 

(SDEFUN |RDEEFX;mk_erf;3F;54| ((|uc| (F)) (|ff| (F)) (% (F)))
        (SPROG ((|im| (F)) (|s| (F)) (|uc1| (F)) (|uc2| (F)))
               (SEQ
                (COND
                 ((NULL (|RDEEFX;is_imaginary?| |uc| %))
                  (|RDEEFX;mk_erf1| |uc| |ff| %))
                 ('T
                  (SEQ
                   (LETT |im|
                         (SPADCALL (SPADCALL 0 1 (QREFELT % 357))
                                   (QREFELT % 358)))
                   (LETT |uc1|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 2 (QREFELT % 73)) |im|
                                      (QREFELT % 64))
                            |uc| (QREFELT % 64))
                           (SPADCALL (QREFELT % 345)) (QREFELT % 66))
                          (QREFELT % 47)))
                   (LETT |s| (|spadConstant| % 32))
                   (COND
                    ((SPADCALL |uc1| (SPADCALL |uc1| (QREFELT % 47))
                               (QREFELT % 359))
                     (SEQ
                      (LETT |s|
                            (SPADCALL (|spadConstant| % 32) (QREFELT % 47)))
                      (EXIT (LETT |uc1| (SPADCALL |uc1| (QREFELT % 47)))))))
                   (LETT |uc2| (SPADCALL |uc1| (QREFELT % 344)))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 (QREFELT % 73))
                               (SPADCALL
                                (SPADCALL (SPADCALL |uc2| |ff| (QREFELT % 64))
                                          (QREFELT % 360))
                                (SPADCALL (SPADCALL |im| |s| (QREFELT % 64))
                                          (SPADCALL
                                           (SPADCALL |uc2| |ff| (QREFELT % 64))
                                           (QREFELT % 361))
                                          (QREFELT % 64))
                                (QREFELT % 77))
                               (QREFELT % 64))
                     |uc2| (QREFELT % 66))))))))) 

(SDEFUN |RDEEFX;mk_erf;3F;55| ((|uc| (F)) (|ff| (F)) (% (F)))
        (|RDEEFX;mk_erf1| |uc| |ff| %)) 

(SDEFUN |RDEEFX;get_prims|
        ((|scand|
          (|Record| (|:| |degree| (|Integer|))
                    (|:| |factor| (|SparseUnivariatePolynomial| F))
                    (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                    (|:| |v_part| F)
                    (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                    (|:| |new_f| (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |radicand|
                         (|Fraction| (|SparseUnivariatePolynomial| F)))
                    (|:| |u_part| F) (|:| |exponent| (|Integer|))
                    (|:| |shift_part| F) (|:| |a_val| F)))
         (|k| (|Kernel| F)) (% (|List| F)))
        (SPROG
         ((|cfac| (|SparseUnivariatePolynomial| F)) (|vshift| (F)) (|uc| (F))
          (|nf| (|Fraction| (|SparseUnivariatePolynomial| F))) (|f| (F))
          (|d| (|Integer|)) (|a| (F)) (|rfc| (F)) (|rf1k| (|Kernel| F))
          (|zzl| (|List| F)) (#1=#:G1390 NIL) (|l1| (|NonNegativeInteger|))
          (|lf| (F)) (|nf2| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|j| NIL) (#2=#:G1403 NIL) (|j1| (F)) (|c1s| (F)) (|ff| (F))
          (|f11| (F)) (|zz| NIL) (#3=#:G1404 NIL) (|f1| (F))
          (|res| (|List| F)))
         (SEQ (LETT |cfac| (QVELT |scand| 5))
              (LETT |vshift| (QVELT |scand| 10)) (LETT |uc| (QVELT |scand| 2))
              (LETT |nf| (QVELT |scand| 6))
              (LETT |f| (SPADCALL |nf| |k| (QREFELT % 59)))
              (LETT |d| (QVELT |scand| 0))
              (EXIT
               (COND
                ((EQL |d| 0)
                 (SEQ (LETT |a| (QVELT |scand| 11))
                      (EXIT
                       (LIST
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |vshift| (QREFELT % 47))
                                    (SPADCALL
                                     (SPADCALL |a| (|spadConstant| % 32)
                                               (QREFELT % 77))
                                     (SPADCALL (QVELT |scand| 2)
                                               (QREFELT % 363))
                                     (QREFELT % 64))
                                    (QREFELT % 77))
                          (QREFELT % 323))
                         (SPADCALL |a| |f| (QREFELT % 364)) (QREFELT % 64))))))
                ((EQL |d| 1)
                 (LIST
                  (SPADCALL
                   (SPADCALL (SPADCALL |vshift| (QREFELT % 47))
                             (QREFELT % 323))
                   (SPADCALL |f| (QREFELT % 324)) (QREFELT % 64))))
                ((> |d| 1)
                 (SEQ (LETT |rfc| (|spadConstant| % 74))
                      (COND
                       ((SPADCALL |cfac| (|spadConstant| % 102)
                                  (QREFELT % 109))
                        (SEQ (LETT |rfc| (SPADCALL |cfac| (QREFELT % 240)))
                             (EXIT
                              (LETT |rf1k|
                                    (SPADCALL |rfc| (QREFELT % 313)))))))
                      (LETT |zzl|
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| % 102)
                                        (QREFELT % 111))
                              (LIST (|spadConstant| % 74)))
                             (#4='T (SPADCALL |cfac| (QREFELT % 325)))))
                      (LETT |l1|
                            (PROG1 (LETT #1# (- |d| 1))
                              (|check_subtype2| (>= #1# 0)
                                                '(|NonNegativeInteger|)
                                                '(|Integer|) #1#)))
                      (LETT |lf| (SPADCALL |d| (QREFELT % 73)))
                      (LETT |res| NIL) (LETT |nf2| (QVELT |scand| 7))
                      (SEQ (LETT |j| 1) (LETT #2# |l1|) G190
                           (COND ((|greater_SI| |j| #2#) (GO G191)))
                           (SEQ
                            (LETT |j1|
                                  (SPADCALL (SPADCALL |j| (QREFELT % 73)) |lf|
                                            (QREFELT % 66)))
                            (LETT |c1s|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |vshift| (QREFELT % 47))
                                             (QREFELT % 323))
                                   |lf| (QREFELT % 66)))
                            (LETT |f1|
                                  (COND
                                   ((EQL (* 2 |j|) |d|)
                                    (SEQ
                                     (LETT |ff|
                                           (SPADCALL |nf2| |k| (QREFELT % 59)))
                                     (EXIT
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT % 47))
                                                 (SPADCALL |ff| |j|
                                                           (QREFELT % 342))
                                                 (QREFELT % 362))
                                                (QREFELT % 64)))))
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |c1s|
                                                (SPADCALL
                                                 (SPADCALL |uc| (QREFELT % 47))
                                                 (SPADCALL |j1| (QREFELT % 47))
                                                 (QREFELT % 365))
                                                (QREFELT % 64))
                                      (SPADCALL |j1|
                                                (SPADCALL |f| (QREFELT % 47))
                                                (QREFELT % 364))
                                      (QREFELT % 64))
                                     (QREFELT % 47)))))
                            (COND
                             ((SPADCALL |cfac| (|spadConstant| % 102)
                                        (QREFELT % 109))
                              (SEQ (LETT |f11| |f1|)
                                   (LETT |f1| (|spadConstant| % 74))
                                   (EXIT
                                    (SEQ (LETT |zz| NIL) (LETT #3# |zzl|) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |zz| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |f1|
                                                 (SPADCALL |f1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |zz|
                                                                       (QREFELT
                                                                        % 47))
                                                             (QREFELT % 323))
                                                            (SPADCALL |f11|
                                                                      |rf1k|
                                                                      |zz|
                                                                      (QREFELT
                                                                       % 67))
                                                            (QREFELT % 64))
                                                           (QREFELT % 72)))))
                                         (LETT #3# (CDR #3#)) (GO G190) G191
                                         (EXIT NIL))))))
                            (EXIT (LETT |res| (CONS |f1| |res|))))
                           (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|))))
                (#4# (|error| "unimplemented"))))))) 

(SDEFUN |RDEEFX;ei_int_diff|
        ((|f| (F)) (|g| (F))
         (|gu| (|Fraction| (|SparseUnivariatePolynomial| F))) (|x| (|Symbol|))
         (|k| (|Kernel| F)) (|lk| (|List| (|Kernel| F)))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|fu| #1=(|Fraction| (|SparseUnivariatePolynomial| F)))
          (|ngu| (|SparseUnivariatePolynomial| F)) (|g1| (F))
          (|args| (|List| F)) (|k1| (F)) (|dv| (|Symbol|)) (|dvf| (F))
          (|f2| (F)) (|g2| (F))
          (|nres|
           #2=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                        (|:| |sol?| (|Boolean|))))
          (|kdv| (|Kernel| F)) (|k1f| (F)) (|a1| (F)) (|p1| (F)) (|dp1| (F))
          (|r1| (F)) (|g3| (F)) (|g3u| #1#) (|nres2| #2#))
         (SEQ (LETT |fu| (SPADCALL |f| |k| (QREFELT % 35)))
              (LETT |ngu| (SPADCALL |gu| (QREFELT % 38)))
              (COND
               ((OR
                 (SPADCALL (SPADCALL |gu| (QREFELT % 39))
                           (|spadConstant| % 108) (QREFELT % 109))
                 (OR
                  (SPADCALL (SPADCALL |ngu| (QREFELT % 40)) 1 (QREFELT % 89))
                  (SPADCALL |fu|
                            (SPADCALL (SPADCALL |f| (QREFELT % 44))
                                      (QREFELT % 46))
                            (QREFELT % 366))))
                (EXIT
                 (VECTOR (|spadConstant| % 74) (|spadConstant| % 74)
                         (|spadConstant| % 74) NIL))))
              (LETT |g1| (SPADCALL |ngu| (QREFELT % 103)))
              (LETT |args| (SPADCALL |k| (QREFELT % 27)))
              (EXIT
               (COND
                ((SPADCALL (LENGTH |args|) 3 (QREFELT % 89))
                 (|error| "internal error, k is not a diff"))
                (#3='T
                 (SEQ
                  (LETT |k1|
                        (SPADCALL (SPADCALL |args| 1 (QREFELT % 29))
                                  (SPADCALL (SPADCALL |args| 2 (QREFELT % 29))
                                            (QREFELT % 313))
                                  (SPADCALL |args| 3 (QREFELT % 29))
                                  (QREFELT % 67)))
                  (LETT |dv| (SPADCALL (QREFELT % 56)))
                  (LETT |dvf| (SPADCALL |dv| (QREFELT % 367)))
                  (LETT |f2| (SPADCALL |f| |k1| |dvf| (QREFELT % 368)))
                  (LETT |g2| (SPADCALL |g1| |k1| |dvf| (QREFELT % 368)))
                  (LETT |nres| (SPADCALL 1 |f2| |g2| |dv| (QREFELT % 65)))
                  (COND
                   ((NULL (QVELT |nres| 3))
                    (EXIT
                     (VECTOR (|spadConstant| % 74) (|spadConstant| % 74)
                             (|spadConstant| % 74) NIL))))
                  (LETT |kdv| (SPADCALL |dv| (QREFELT % 57))) (LETT |k1f| |k1|)
                  (LETT |a1|
                        (SPADCALL (QVELT |nres| 0) |kdv| |k1f| (QREFELT % 67)))
                  (LETT |p1|
                        (SPADCALL (QVELT |nres| 2) |kdv| |k1f| (QREFELT % 67)))
                  (LETT |dp1|
                        (COND
                         ((SPADCALL |p1| (|spadConstant| % 74) (QREFELT % 78))
                          (|spadConstant| % 74))
                         (#3#
                          (SPADCALL (SPADCALL |p1| |x| (QREFELT % 322))
                                    (SPADCALL |f| (QREFELT % 323))
                                    (QREFELT % 66)))))
                  (LETT |r1|
                        (SPADCALL
                         (SPADCALL (SPADCALL |a1| |x| (QREFELT % 322))
                                   (SPADCALL |a1|
                                             (SPADCALL |f| |x| (QREFELT % 322))
                                             (QREFELT % 64))
                                   (QREFELT % 72))
                         |dp1| (QREFELT % 72)))
                  (LETT |g3| (SPADCALL |g| |r1| (QREFELT % 77)))
                  (EXIT
                   (COND
                    ((SPADCALL |g3| (|spadConstant| % 74) (QREFELT % 78))
                     (VECTOR |a1| |g| |p1| 'T))
                    (#3#
                     (SEQ (LETT |g3u| (SPADCALL |g3| |k| (QREFELT % 35)))
                          (EXIT
                           (COND
                            ((SPADCALL |g3u|
                                       (SPADCALL (SPADCALL |g3| (QREFELT % 44))
                                                 (QREFELT % 46))
                                       (QREFELT % 366))
                             (SEQ
                              (SPADCALL
                               (SPADCALL
                                "Failed to differentiate nres in ei_int_diff"
                                (QREFELT % 371))
                               (QREFELT % 373))
                              (EXIT
                               (VECTOR (|spadConstant| % 74)
                                       (|spadConstant| % 74)
                                       (|spadConstant| % 74) NIL))))
                            (#3#
                             (SEQ
                              (LETT |nres2|
                                    (SPADCALL 1 |f| |g3| |x| (QREFELT % 65)))
                              (EXIT
                               (VECTOR
                                (SPADCALL (QVELT |nres2| 0) |a1|
                                          (QREFELT % 72))
                                (SPADCALL (QVELT |nres2| 1) |r1|
                                          (QREFELT % 72))
                                (SPADCALL (QVELT |nres2| 2) |p1|
                                          (QREFELT % 72))
                                (QVELT |nres2| 3)))))))))))))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58|
        ((|n| (|Integer|)) (|f| (F)) (|g| (F)) (|x| (|Symbol|))
         (%
          (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                    (|:| |sol?| (|Boolean|)))))
        (SPROG
         ((|fp| (F)) (|k| (|Kernel| F)) (#1=#:G1504 NIL) (#2=#:G1505 NIL)
          (|lk| (|List| (|Kernel| F))) (|c0| (F))
          (|fpu| #3=(|Fraction| (|SparseUnivariatePolynomial| F))) (|gu| #3#)
          (|dku| #3#) (|dk| #4=(|SparseUnivariatePolynomial| F))
          (|denfp| #5=(|SparseUnivariatePolynomial| F)) (|nfp| #4#)
          (|derivation|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|her|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| #6=(|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |polypart| (|SparseUnivariatePolynomial| F))))
          (|lden| #5#) (|lnum| #4#) (|fu| #3#) (|denf| #5#) (|nf| #4#)
          (|ds| #5#) (|degs| #7=(|NonNegativeInteger|))
          (|ng| (|SparseUnivariatePolynomial| F)) (#8=#:G1506 NIL)
          (#9=#:G1507 NIL) (|lk1| (|List| (|Kernel| F))) (#10=#:G1508 NIL)
          (#11=#:G1509 NIL) (|vlst| (|List| F)) (#12=#:G1510 NIL) (|kk| NIL)
          (#13=#:G1511 NIL) (|ulst| (|List| F))
          (|ar1|
           (|Record| (|:| |primpart| F)
                     (|:| |logpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))
                     (|:| |polypart| (|SparseUnivariatePolynomial| F))
                     (|:| |specpart|
                          (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|lp| #6#)
          (|lp1u| #14=(|Union| (|SparseUnivariatePolynomial| F) #15="failed"))
          (|res5|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|#G475|
           (|Record| (|:| |radicand| (|SparseUnivariatePolynomial| F))
                     (|:| |exponent| (|Integer|))))
          (|gden1| (|SparseUnivariatePolynomial| F)) (|gexp| (|Integer|))
          (|derivation2|
           (|Mapping| (|SparseUnivariatePolynomial| F)
                      (|SparseUnivariatePolynomial| F)))
          (|denf_split|
           (|Record| (|:| |normal| #16=(|SparseUnivariatePolynomial| F))
                     (|:| |special| (|SparseUnivariatePolynomial| F))))
          (|ndenf| #16#)
          (|her2|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))))
          (|rr1| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|scands|
           (|List|
            (|Record| (|:| |degree| (|Integer|))
                      (|:| |factor| (|SparseUnivariatePolynomial| F))
                      (|:| |coeff| F) (|:| |ratpart| (|Integer|))
                      (|:| |v_part| F)
                      (|:| |alg_part| (|SparseUnivariatePolynomial| F))
                      (|:| |new_f|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |radicand|
                           (|Fraction| (|SparseUnivariatePolynomial| F)))
                      (|:| |u_part| F) (|:| |exponent| (|Integer|))
                      (|:| |shift_part| F) (|:| |a_val| F))))
          (|derivation3|
           (|Mapping| (|Fraction| (|SparseUnivariatePolynomial| F))
                      (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|scoeffs| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
          (|log_recursion| (|Boolean|)) (|spec1u| #14#) (|d| #7#) (|kf| (F))
          (|dkf| (F)) (|j| NIL) (|gj| (F))
          (|spec1p| (|SparseUnivariatePolynomial| F)) (|ff| (F))
          (#17=#:G1502 NIL)
          (|res7|
           #18=(|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                         (|:| |sol?| (|Boolean|))))
          (|aa| (F)) (#19=#:G1501 NIL) (|rr1f| (F)) (|lc| (F))
          (|rcu1| (|Union| (|Fraction| (|Integer|)) "failed"))
          (|rcq| (|Fraction| (|Integer|))) (|rcu2| (|Union| (|Integer|) #15#))
          (|rc| (|Integer|)) (|u| (F)) (|f1| (F))
          (|res4|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|))))
          (|a1| (F)) (|ansp| (F)) (|r1| (F)) (#20=#:G1503 NIL) (|res6| #18#)
          (|res3|
           (|Record| (|:| |ans| F) (|:| |right| F) (|:| |primpart| F)
                     (|:| |sol?| (|Boolean|)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lk|
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |f| (QREFELT % 340))
                              (SPADCALL |g| (QREFELT % 340)) (QREFELT % 16))
                    |x| (QREFELT % 15))
                   (LIST (SPADCALL |x| (QREFELT % 57))) (QREFELT % 16)))
            (LETT |f| (SPADCALL |n| |f| (QREFELT % 236)))
            (LETT |fp| (SPADCALL |f| |x| (QREFELT % 61)))
            (EXIT
             (COND
              ((SPADCALL |fp| (|spadConstant| % 74) (QREFELT % 78))
               (SPADCALL |f| |g| |x| |lk| (QREFELT % 55)))
              (#21='T
               (SEQ (LETT |k| (|RDEEFX;top_kernel| |f| |g| |x| %))
                    (LETT |lk|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |kk| NIL) (LETT #2# |lk|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |kk| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |kk| |k| (QREFELT % 341))
                                    (LETT #1# (CONS |kk| #1#))))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#)))))
                    (LETT |c0|
                          (SPADCALL (SPADCALL |g| |f| (QREFELT % 64)) |fp|
                                    (QREFELT % 66)))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |c0| |x| (QREFELT % 61))
                                 (|spadConstant| % 74) (QREFELT % 78))
                       (VECTOR (|spadConstant| % 74) |g|
                               (SPADCALL |c0| (SPADCALL |f| (QREFELT % 324))
                                         (QREFELT % 64))
                               'T))
                      ((SPADCALL (SPADCALL |k| (QREFELT % 24)) (QREFELT % 8)
                                 (QREFELT % 25))
                       (|RDEEFX;ei_int_alg| |f| |g| |x| |k| |lk| %))
                      (#21#
                       (SEQ (LETT |fpu| (SPADCALL |fp| |k| (QREFELT % 35)))
                            (LETT |gu| (SPADCALL |g| |k| (QREFELT % 35)))
                            (EXIT
                             (COND
                              ((SPADCALL |k| '|%diff| (QREFELT % 22))
                               (|RDEEFX;ei_int_diff| |f| |g| |gu| |x| |k| |lk|
                                %))
                              (#21#
                               (SEQ
                                (LETT |dku|
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |k| (QREFELT % 60))
                                                 |x| (QREFELT % 322))
                                       |k| (QREFELT % 35)))
                                (EXIT
                                 (COND
                                  ((SPADCALL (SPADCALL |dku| (QREFELT % 39))
                                             (|spadConstant| % 108)
                                             (QREFELT % 109))
                                   (VECTOR (|spadConstant| % 74)
                                           (|spadConstant| % 74)
                                           (|spadConstant| % 74) NIL))
                                  (#21#
                                   (SEQ
                                    (LETT |dk| (SPADCALL |dku| (QREFELT % 38)))
                                    (LETT |denfp|
                                          (SPADCALL |fpu| (QREFELT % 39)))
                                    (LETT |nfp|
                                          (SPADCALL |fpu| (QREFELT % 38)))
                                    (LETT |derivation|
                                          (CONS #'|RDEEFX;ei_int;I2FSR;58!1|
                                                (VECTOR |dk| |x| % |denfp|)))
                                    (LETT |her|
                                          (SPADCALL
                                           (SPADCALL |denfp| |gu|
                                                     (QREFELT % 270))
                                           |derivation| |nfp| (QREFELT % 377)))
                                    (LETT |lp| (QVELT |her| 1))
                                    (LETT |a1|
                                          (SPADCALL (QVELT |her| 0) |k|
                                                    (QREFELT % 59)))
                                    (LETT |rr1|
                                          (SPADCALL
                                           (SPADCALL |lp|
                                                     (SPADCALL (QVELT |her| 3)
                                                               (QREFELT % 46))
                                                     (QREFELT % 327))
                                           (QVELT |her| 2) (QREFELT % 327)))
                                    (LETT |rr1|
                                          (SPADCALL |rr1|
                                                    (SPADCALL |denfp|
                                                              (QREFELT % 46))
                                                    (QREFELT % 49)))
                                    (LETT |r1|
                                          (SPADCALL |g|
                                                    (SPADCALL |rr1| |k|
                                                              (QREFELT % 59))
                                                    (QREFELT % 77)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |rr1| (|spadConstant| % 196)
                                                 (QREFELT % 338))
                                       (VECTOR |a1| |g| (|spadConstant| % 74)
                                               'T))
                                      (#21#
                                       (SEQ
                                        (LETT |lden|
                                              (SPADCALL |lp| (QREFELT % 39)))
                                        (LETT |lnum|
                                              (SPADCALL |lp| (QREFELT % 38)))
                                        (LETT |fu|
                                              (SPADCALL |f| |k|
                                                        (QREFELT % 35)))
                                        (LETT |denf|
                                              (SPADCALL |fu| (QREFELT % 39)))
                                        (LETT |nf|
                                              (SPADCALL |fu| (QREFELT % 38)))
                                        (COND
                                         ((SPADCALL |denf|
                                                    (|spadConstant| % 108)
                                                    (QREFELT % 111))
                                          (COND
                                           ((EQL (SPADCALL |nf| (QREFELT % 40))
                                                 0)
                                            (COND
                                             ((SPADCALL |k| '|exp|
                                                        (QREFELT % 22))
                                              (EXIT
                                               (COND
                                                ((SPADCALL |lp|
                                                           (|spadConstant| %
                                                                           196)
                                                           (QREFELT % 366))
                                                 (VECTOR |a1| |r1|
                                                         (|spadConstant| % 74)
                                                         NIL))
                                                (#21#
                                                 (SEQ
                                                  (LETT |ds|
                                                        (SPADCALL
                                                         (QVELT |her| 2)
                                                         (QREFELT % 39)))
                                                  (COND
                                                   ((OR
                                                     (SPADCALL
                                                      (SPADCALL |ds|
                                                                (QREFELT %
                                                                         110))
                                                      (|spadConstant| % 102)
                                                      (QREFELT % 109))
                                                     (SPADCALL
                                                      (SPADCALL |ds|
                                                                (QREFELT %
                                                                         103))
                                                      (|spadConstant| % 32)
                                                      (QREFELT % 130)))
                                                    (EXIT
                                                     (|error|
                                                      "unexpected special part"))))
                                                  (LETT |degs|
                                                        (SPADCALL |ds|
                                                                  (QREFELT %
                                                                           40)))
                                                  (LETT |ng|
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (|spadConstant| %
                                                                           32)
                                                           |degs|
                                                           (QREFELT % 43))
                                                          (QVELT |her| 3)
                                                          (QREFELT % 97))
                                                         (SPADCALL
                                                          (QVELT |her| 2)
                                                          (QREFELT % 38))
                                                         (QREFELT % 48)))
                                                  (LETT |res5|
                                                        (|RDEEFX;ei_int_exp|
                                                         |f| |ng| |degs| |x|
                                                         |k| %))
                                                  (LETT |a1|
                                                        (SPADCALL |a1|
                                                                  (QVELT |res5|
                                                                         0)
                                                                  (QREFELT %
                                                                           72)))
                                                  (LETT |r1|
                                                        (SPADCALL |r1|
                                                                  (QVELT |res5|
                                                                         1)
                                                                  (QREFELT %
                                                                           72)))
                                                  (EXIT
                                                   (VECTOR |a1| |r1|
                                                           (QVELT |res5| 2)
                                                           (QVELT |res5|
                                                                  3)))))))))))))
                                        (LETT |lk1|
                                              (PROGN
                                               (LETT #8# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #9# (CONS |k| |lk|))
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #9#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #9#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((COND
                                                         ((SPADCALL |kk| '|log|
                                                                    (QREFELT %
                                                                             22))
                                                          'T)
                                                         (#21#
                                                          (SPADCALL |kk| '|exp|
                                                                    (QREFELT %
                                                                             22))))
                                                        (LETT #8#
                                                              (CONS |kk|
                                                                    #8#))))))
                                                    (LETT #9# (CDR #9#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #8#)))))
                                        (LETT |vlst|
                                              (PROGN
                                               (LETT #10# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #11# |lk1|) G190
                                                    (COND
                                                     ((OR (ATOM #11#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #11#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #10#
                                                            (CONS
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         '|log|
                                                                         (QREFELT
                                                                          %
                                                                          22))
                                                               (SPADCALL |kk|
                                                                         (QREFELT
                                                                          %
                                                                          60)))
                                                              ('T
                                                               (SPADCALL
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                1
                                                                (QREFELT %
                                                                         29))))
                                                             #10#))))
                                                    (LETT #11# (CDR #11#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #10#)))))
                                        (LETT |ulst|
                                              (PROGN
                                               (LETT #12# NIL)
                                               (SEQ (LETT |kk| NIL)
                                                    (LETT #13# |lk1|) G190
                                                    (COND
                                                     ((OR (ATOM #13#)
                                                          (PROGN
                                                           (LETT |kk|
                                                                 (CAR #13#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #12#
                                                            (CONS
                                                             (COND
                                                              ((SPADCALL |kk|
                                                                         '|log|
                                                                         (QREFELT
                                                                          %
                                                                          22))
                                                               (SPADCALL
                                                                (SPADCALL |kk|
                                                                          (QREFELT
                                                                           %
                                                                           27))
                                                                1
                                                                (QREFELT %
                                                                         29)))
                                                              ('T
                                                               (SPADCALL |kk|
                                                                         (QREFELT
                                                                          %
                                                                          60))))
                                                             #12#))))
                                                    (LETT #13# (CDR #13#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #12#)))))
                                        (LETT |ar1|
                                              (|RDEEFX;handle_logpart| |lnum|
                                               |lden| |nf| |denf| |nfp| |denfp|
                                               |k| |vlst| |ulst| |x| %))
                                        (LETT |ansp| (QVELT |ar1| 0))
                                        (LETT |lp|
                                              (SPADCALL |lp| (QVELT |ar1| 1)
                                                        (QREFELT % 269)))
                                        (QSETVELT |her| 2
                                                  (SPADCALL (QVELT |her| 2)
                                                            (QVELT |ar1| 3)
                                                            (QREFELT % 269)))
                                        (QSETVELT |her| 3
                                                  (SPADCALL (QVELT |her| 3)
                                                            (QVELT |ar1| 2)
                                                            (QREFELT % 45)))
                                        (LETT |lp1u|
                                              (SPADCALL |lp| (QREFELT % 264)))
                                        (EXIT
                                         (COND
                                          ((QEQCAR |lp1u| 1)
                                           (VECTOR |a1| |r1|
                                                   (|spadConstant| % 74) NIL))
                                          (#21#
                                           (SEQ
                                            (QSETVELT |her| 3
                                                      (SPADCALL (QVELT |her| 3)
                                                                (QCDR |lp1u|)
                                                                (QREFELT %
                                                                         48)))
                                            (COND
                                             ((SPADCALL (QVELT |her| 3)
                                                        (|spadConstant| % 102)
                                                        (QREFELT % 111))
                                              (COND
                                               ((SPADCALL (QVELT |her| 2)
                                                          (|spadConstant| %
                                                                          196)
                                                          (QREFELT % 338))
                                                (EXIT
                                                 (VECTOR |a1| |g| |ansp|
                                                         'T))))))
                                            (COND
                                             ((SPADCALL |denf|
                                                        (|spadConstant| % 108)
                                                        (QREFELT % 111))
                                              (COND
                                               ((EQL
                                                 (SPADCALL |nf| (QREFELT % 40))
                                                 0)
                                                (COND
                                                 ((OR
                                                   (SPADCALL |k| '|log|
                                                             (QREFELT % 22))
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT % 24))
                                                    (QREFELT % 9)
                                                    (QREFELT % 25)))
                                                  (EXIT
                                                   (COND
                                                    ((SPADCALL |lp|
                                                               (|spadConstant|
                                                                % 196)
                                                               (QREFELT % 366))
                                                     (VECTOR |a1| |r1|
                                                             (|spadConstant| %
                                                                             74)
                                                             NIL))
                                                    ((SPADCALL (QVELT |her| 2)
                                                               (|spadConstant|
                                                                % 196)
                                                               (QREFELT % 366))
                                                     (|error|
                                                      "unexpected special part"))
                                                    (#21#
                                                     (SEQ
                                                      (LETT |res5|
                                                            (|RDEEFX;ei_int_log|
                                                             |f|
                                                             (QVELT |her| 3)
                                                             |x| |k| %))
                                                      (LETT |a1|
                                                            (SPADCALL |a1|
                                                                      (QVELT
                                                                       |res5|
                                                                       0)
                                                                      (QREFELT
                                                                       % 72)))
                                                      (LETT |r1|
                                                            (SPADCALL |r1|
                                                                      (QVELT
                                                                       |res5|
                                                                       1)
                                                                      (QREFELT
                                                                       % 72)))
                                                      (EXIT
                                                       (VECTOR |a1| |r1|
                                                               (SPADCALL |ansp|
                                                                         (QVELT
                                                                          |res5|
                                                                          2)
                                                                         (QREFELT
                                                                          %
                                                                          72))
                                                               (QVELT |res5|
                                                                      3)))))))))))))
                                            (LETT |rr1|
                                                  (SPADCALL
                                                   (SPADCALL (QVELT |her| 3)
                                                             (QREFELT % 46))
                                                   (QVELT |her| 2)
                                                   (QREFELT % 327)))
                                            (LETT |rr1|
                                                  (SPADCALL |rr1|
                                                            (SPADCALL |denfp|
                                                                      (QREFELT
                                                                       % 46))
                                                            (QREFELT % 49)))
                                            (PROGN
                                             (LETT |#G475|
                                                   (|RDEEFX;gamma_denominator|
                                                    |denf| |k| %))
                                             (LETT |gden1| (QCAR |#G475|))
                                             (LETT |gexp| (QCDR |#G475|))
                                             |#G475|)
                                            (LETT |derivation2|
                                                  (CONS
                                                   #'|RDEEFX;ei_int;I2FSR;58!3|
                                                   (VECTOR |dk| |x| %)))
                                            (LETT |denf_split|
                                                  (SPADCALL |denf|
                                                            |derivation2|
                                                            (QREFELT % 380)))
                                            (LETT |ndenf| (QCAR |denf_split|))
                                            (LETT |her2|
                                                  (|RDEEFX;special_Hermite|
                                                   |rr1| |nfp| |ndenf| |denfp|
                                                   |derivation2| %))
                                            (LETT |a1|
                                                  (SPADCALL |a1|
                                                            (SPADCALL
                                                             (QCAR |her2|) |k|
                                                             (QREFELT % 59))
                                                            (QREFELT % 72)))
                                            (LETT |rr1| (QCDR |her2|))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |rr1|
                                                         (|spadConstant| % 196)
                                                         (QREFELT % 338))
                                               (VECTOR |a1| |g| |ansp| 'T))
                                              (#21#
                                               (SEQ
                                                (COND
                                                 ((SPADCALL |denf|
                                                            (|spadConstant| %
                                                                            108)
                                                            (QREFELT % 111))
                                                  (COND
                                                   ((EQL
                                                     (SPADCALL |nf|
                                                               (QREFELT % 40))
                                                     2)
                                                    (COND
                                                     ((SPADCALL |k| '|log|
                                                                (QREFELT % 22))
                                                      (EXIT
                                                       (|RDEEFX;quadratic_log_erf_integrate|
                                                        |nf| |nfp| |rr1| |a1|
                                                        |g| |ansp| |derivation|
                                                        |vlst| |ulst| |k| |lk|
                                                        |x| %))))))))
                                                (LETT |scands|
                                                      (|RDEEFX;special_candidates|
                                                       |nf| |denf| |gden1|
                                                       |gexp| |vlst| |ulst| |k|
                                                       |x| %))
                                                (LETT |derivation3|
                                                      (CONS
                                                       #'|RDEEFX;ei_int;I2FSR;58!4|
                                                       (VECTOR |derivation2|
                                                               %)))
                                                (LETT |scoeffs|
                                                      (|RDEEFX;get_scoeffs|
                                                       |scands| |denf| |k|
                                                       |derivation3| %))
                                                (LETT |rr1f|
                                                      (SPADCALL |rr1| |k|
                                                                (QREFELT %
                                                                         59)))
                                                (LETT |r1|
                                                      (SPADCALL |g| |rr1f|
                                                                (QREFELT %
                                                                         77)))
                                                (LETT |log_recursion| NIL)
                                                (COND
                                                 ((SPADCALL |denf|
                                                            (|spadConstant| %
                                                                            108)
                                                            (QREFELT % 111))
                                                  (COND
                                                   ((SPADCALL |k| '|log|
                                                              (QREFELT % 22))
                                                    (COND
                                                     ((EQL
                                                       (SPADCALL |nf|
                                                                 (QREFELT %
                                                                          40))
                                                       1)
                                                      (SEQ
                                                       (LETT |lc|
                                                             (SPADCALL |nf|
                                                                       (QREFELT
                                                                        %
                                                                        103)))
                                                       (LETT |rcu1|
                                                             (SPADCALL |lc|
                                                                       (QREFELT
                                                                        %
                                                                        158)))
                                                       (EXIT
                                                        (LETT |log_recursion|
                                                              (QEQCAR |rcu1|
                                                                      0))))))))))
                                                (EXIT
                                                 (COND
                                                  (|log_recursion|
                                                   (SEQ
                                                    (COND
                                                     (|log_recursion|
                                                      (SEQ
                                                       (LETT |spec1u|
                                                             (SPADCALL |rr1|
                                                                       (QREFELT
                                                                        %
                                                                        264)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |spec1u| 1)
                                                          (|error|
                                                           "impossible 9"))
                                                         (#21#
                                                          (SEQ
                                                           (LETT |spec1p|
                                                                 (QCDR
                                                                  |spec1u|))
                                                           (LETT |d|
                                                                 (SPADCALL
                                                                  |spec1p|
                                                                  (QREFELT %
                                                                           40)))
                                                           (LETT |aa|
                                                                 (|spadConstant|
                                                                  % 74))
                                                           (LETT |kf|
                                                                 (SPADCALL |k|
                                                                           (QREFELT
                                                                            %
                                                                            60)))
                                                           (LETT |dkf|
                                                                 (SPADCALL |dk|
                                                                           (QREFELT
                                                                            %
                                                                            201)))
                                                           (SEQ
                                                            (EXIT
                                                             (SEQ
                                                              (LETT |j| |d|)
                                                              G190
                                                              (COND
                                                               ((< |j| 0)
                                                                (GO G191)))
                                                              (SEQ
                                                               (LETT |gj|
                                                                     (|spadConstant|
                                                                      % 74))
                                                               (COND
                                                                ((EQL |j|
                                                                      (SPADCALL
                                                                       |spec1p|
                                                                       (QREFELT
                                                                        % 40)))
                                                                 (SEQ
                                                                  (LETT |gj|
                                                                        (SPADCALL
                                                                         |spec1p|
                                                                         (QREFELT
                                                                          %
                                                                          103)))
                                                                  (EXIT
                                                                   (LETT
                                                                    |spec1p|
                                                                    (SPADCALL
                                                                     |spec1p|
                                                                     (QREFELT %
                                                                              110)))))))
                                                               (LETT |ff|
                                                                     (SPADCALL
                                                                      |gj|
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (SPADCALL
                                                                         (+ |j|
                                                                            1)
                                                                         (QREFELT
                                                                          %
                                                                          73))
                                                                        |dkf|
                                                                        (QREFELT
                                                                         % 64))
                                                                       |aa|
                                                                       (QREFELT
                                                                        % 64))
                                                                      (QREFELT
                                                                       % 77)))
                                                               (EXIT
                                                                (COND
                                                                 ((EQL |j| 0)
                                                                  (PROGN
                                                                   (LETT #17#
                                                                         |$NoValue|)
                                                                   (GO
                                                                    #22=#:G1479)))
                                                                 ('T
                                                                  (SEQ
                                                                   (EXIT
                                                                    (SEQ
                                                                     (LETT
                                                                      |res7|
                                                                      (SPADCALL
                                                                       |f| |ff|
                                                                       |x|
                                                                       (CONS
                                                                        |k|
                                                                        |lk|)
                                                                       (QREFELT
                                                                        % 55)))
                                                                     (LETT |aa|
                                                                           (QVELT
                                                                            |res7|
                                                                            0))
                                                                     (LETT |a1|
                                                                           (SPADCALL
                                                                            |a1|
                                                                            (SPADCALL
                                                                             |aa|
                                                                             (SPADCALL
                                                                              |kf|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               342))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (QREFELT
                                                                             %
                                                                             72)))
                                                                     (LETT |r1|
                                                                           (SPADCALL
                                                                            |r1|
                                                                            (SPADCALL
                                                                             (QVELT
                                                                              |res7|
                                                                              1)
                                                                             (SPADCALL
                                                                              |kf|
                                                                              |j|
                                                                              (QREFELT
                                                                               %
                                                                               342))
                                                                             (QREFELT
                                                                              %
                                                                              64))
                                                                            (QREFELT
                                                                             %
                                                                             72)))
                                                                     (EXIT
                                                                      (COND
                                                                       ((NULL
                                                                         (QVELT
                                                                          |res7|
                                                                          3))
                                                                        (PROGN
                                                                         (LETT
                                                                          #19#
                                                                          (PROGN
                                                                           (LETT
                                                                            #20#
                                                                            (VECTOR
                                                                             |a1|
                                                                             |r1|
                                                                             |ansp|
                                                                             (QVELT
                                                                              |res7|
                                                                              3)))
                                                                           (GO
                                                                            #23=#:G1500)))
                                                                         (GO
                                                                          #24=#:G1477)))))))
                                                                   #24#
                                                                   (EXIT
                                                                    #19#))))))
                                                              (LETT |j|
                                                                    (+ |j| -1))
                                                              (GO G190) G191
                                                              (EXIT NIL)))
                                                            #22# (EXIT #17#))
                                                           (EXIT
                                                            (COND
                                                             ((SPADCALL |ff|
                                                                        (|spadConstant|
                                                                         % 74)
                                                                        (QREFELT
                                                                         % 78))
                                                              (PROGN
                                                               (LETT #20#
                                                                     (VECTOR
                                                                      |a1| |r1|
                                                                      |ansp|
                                                                      'T))
                                                               (GO #23#)))
                                                             (#21#
                                                              (SEQ
                                                               (LETT |rr1f|
                                                                     |ff|)
                                                               (LETT |lc|
                                                                     (SPADCALL
                                                                      |nf|
                                                                      (QREFELT
                                                                       % 103)))
                                                               (LETT |rcu1|
                                                                     (SPADCALL
                                                                      |lc|
                                                                      (QREFELT
                                                                       % 158)))
                                                               (EXIT
                                                                (COND
                                                                 ((QEQCAR
                                                                   |rcu1| 1)
                                                                  "skip")
                                                                 (#21#
                                                                  (SEQ
                                                                   (LETT |rcq|
                                                                         (QCDR
                                                                          |rcu1|))
                                                                   (LETT |rcu2|
                                                                         (SPADCALL
                                                                          |rcq|
                                                                          (QREFELT
                                                                           %
                                                                           190)))
                                                                   (EXIT
                                                                    (COND
                                                                     ((QEQCAR
                                                                       |rcu2|
                                                                       1)
                                                                      "skip")
                                                                     (#21#
                                                                      (SEQ
                                                                       (LETT
                                                                        |rc|
                                                                        (QCDR
                                                                         |rcu2|))
                                                                       (LETT
                                                                        |u|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           |k|
                                                                           (QREFELT
                                                                            %
                                                                            27))
                                                                          1
                                                                          (QREFELT
                                                                           %
                                                                           29))
                                                                         |rc|
                                                                         (QREFELT
                                                                          %
                                                                          79)))
                                                                       (LETT
                                                                        |f1|
                                                                        (SPADCALL
                                                                         |nf| 0
                                                                         (QREFELT
                                                                          %
                                                                          41)))
                                                                       (LETT
                                                                        |res4|
                                                                        (SPADCALL
                                                                         1 |f1|
                                                                         (SPADCALL
                                                                          |rr1f|
                                                                          |u|
                                                                          (QREFELT
                                                                           %
                                                                           64))
                                                                         |x|
                                                                         (QREFELT
                                                                          %
                                                                          65)))
                                                                       (LETT
                                                                        |a1|
                                                                        (SPADCALL
                                                                         |a1|
                                                                         (SPADCALL
                                                                          (QVELT
                                                                           |res4|
                                                                           0)
                                                                          |u|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (QREFELT
                                                                          %
                                                                          72)))
                                                                       (LETT
                                                                        |ansp|
                                                                        (SPADCALL
                                                                         |ansp|
                                                                         (QVELT
                                                                          |res4|
                                                                          2)
                                                                         (QREFELT
                                                                          %
                                                                          72)))
                                                                       (LETT
                                                                        |r1|
                                                                        (SPADCALL
                                                                         |r1|
                                                                         (SPADCALL
                                                                          (QVELT
                                                                           |res4|
                                                                           1)
                                                                          |u|
                                                                          (QREFELT
                                                                           %
                                                                           66))
                                                                         (QREFELT
                                                                          %
                                                                          72)))
                                                                       (EXIT
                                                                        (PROGN
                                                                         (LETT
                                                                          #20#
                                                                          (VECTOR
                                                                           |a1|
                                                                           |r1|
                                                                           |ansp|
                                                                           (QVELT
                                                                            |res4|
                                                                            3)))
                                                                         (GO
                                                                          #23#))))))))))))))))))))))
                                                    (EXIT
                                                     (COND
                                                      ((SPADCALL |r1| |g|
                                                                 (QREFELT %
                                                                          78))
                                                       (VECTOR |a1| |g| |ansp|
                                                               'T))
                                                      (#21#
                                                       (SEQ
                                                        (LETT |res6|
                                                              (SPADCALL |f|
                                                                        |rr1f|
                                                                        |x|
                                                                        (CONS
                                                                         |k|
                                                                         |lk|)
                                                                        (QREFELT
                                                                         %
                                                                         55)))
                                                        (EXIT
                                                         (VECTOR
                                                          (SPADCALL |a1|
                                                                    (QVELT
                                                                     |res6| 0)
                                                                    (QREFELT %
                                                                             72))
                                                          (SPADCALL |r1|
                                                                    (QVELT
                                                                     |res6| 1)
                                                                    (QREFELT %
                                                                             72))
                                                          |ansp|
                                                          (QVELT |res6|
                                                                 3)))))))))
                                                  (#21#
                                                   (SEQ
                                                    (LETT |res3|
                                                          (|RDEEFX;special_integrate2|
                                                           |nfp| |denfp| |denf|
                                                           |ndenf| |f| |k| |lk|
                                                           |x| |rr1| |a1| |r1|
                                                           |g| |scoeffs|
                                                           |scands| |gexp| %))
                                                    (EXIT
                                                     (VECTOR
                                                      (SPADCALL |a1|
                                                                (QVELT |res3|
                                                                       0)
                                                                (QREFELT % 72))
                                                      (SPADCALL |r1|
                                                                (QVELT |res3|
                                                                       1)
                                                                (QREFELT % 72))
                                                      (SPADCALL |ansp|
                                                                (QVELT |res3|
                                                                       2)
                                                                (QREFELT % 72))
                                                      (QVELT |res3|
                                                             3)))))))))))))))))))))))))))))))))))))
          #23# (EXIT #20#)))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!4| ((|z1| NIL) ($$ NIL))
        (PROG (% |derivation2|)
          (LETT % (QREFELT $$ 1))
          (LETT |derivation2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL
              (SPADCALL (SPADCALL (SPADCALL |z1| (QREFELT % 38)) |derivation2|)
                        (SPADCALL |z1| (QREFELT % 39)) (QREFELT % 97))
              (SPADCALL (SPADCALL |z1| (QREFELT % 38))
                        (SPADCALL (SPADCALL |z1| (QREFELT % 39)) |derivation2|)
                        (QREFELT % 97))
              (QREFELT % 45))
             (SPADCALL (SPADCALL |z1| (QREFELT % 39))
                       (SPADCALL |z1| (QREFELT % 39)) (QREFELT % 97))
             (QREFELT % 195)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!3| ((|z1| NIL) ($$ NIL))
        (PROG (% |x| |dk|)
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |z1|
                             (CONS #'|RDEEFX;ei_int;I2FSR;58!2| (VECTOR % |x|))
                             |dk| (QREFELT % 374))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!2| ((|z2| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT % 322)))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!1| ((|z1| NIL) ($$ NIL))
        (PROG (|denfp| % |x| |dk|)
          (LETT |denfp| (QREFELT $$ 3))
          (LETT % (QREFELT $$ 2))
          (LETT |x| (QREFELT $$ 1))
          (LETT |dk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |denfp|
                             (SPADCALL |z1|
                                       (CONS #'|RDEEFX;ei_int;I2FSR;58!0|
                                             (VECTOR % |x|))
                                       |dk| (QREFELT % 374))
                             (QREFELT % 97))))))) 

(SDEFUN |RDEEFX;ei_int;I2FSR;58!0| ((|z2| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z2| |x| (QREFELT % 322)))))) 

(DECLAIM (NOTINLINE |ElementaryRischDEX;|)) 

(DEFUN |ElementaryRischDEX;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ElementaryRischDEX| DV$1 DV$2))
          (LETT % (GETREFV 381))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ElementaryRischDEX|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|%alg|)
          (QSETREFV % 9 '|prim|)
          (QSETREFV % 92 (SPADCALL (QREFELT % 91)))
          (COND
           ((|domainEqual| |#1| (|Complex| (|Integer|)))
            (PROGN
             (QSETREFV % 362
                       (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;54|) %))))
           ('T
            (QSETREFV % 362
                      (CONS (|dispatchFunction| |RDEEFX;mk_erf;3F;55|) %))))
          %))) 

(DEFUN |ElementaryRischDEX| (&REST #1=#:G1512)
  (SPROG NIL
         (PROG (#2=#:G1513)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryRischDEX|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ElementaryRischDEX;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ElementaryRischDEX|)))))))))) 

(MAKEPROP '|ElementaryRischDEX| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              'PRIM (|List| 34) (0 . |kernels|) (|List| 18) (|Symbol|)
              (|IntegrationTools| 6 7) (5 . |varselect|) (11 . |union|)
              (|NonNegativeInteger|) (|Kernel| 7) (17 . |height|) (|Boolean|)
              (22 . |member?|) (28 . |is?|) (|BasicOperator|) (34 . |operator|)
              (39 . |has?|) (|List| 7) (45 . |argument|) (|Integer|)
              (50 . |elt|) (56 . |retract|) (61 . |1|) (65 . |1|)
              (|Fraction| 174) (|Kernel| %) (69 . |univariate|)
              (|SparseUnivariatePolynomial| 7) (|Fraction| 36) (75 . |numer|)
              (80 . |denom|) (85 . |degree|) (90 . |coefficient|) (96 . |0|)
              (100 . |monomial|) (106 . |coerce|) (111 . -) (117 . |coerce|)
              (122 . -) (127 . +) (133 . /) (139 . |kmax|)
              (|Union| 13 '"failed") (144 . |symbolIfCan|)
              (|Record| (|:| |ans| 7) (|:| |right| 7) (|:| |primpart| 7)
                        (|:| |sol?| 20))
              (|ElementaryRischDEX2| 6 7) (149 . |do_risch_DE|) (157 . |new|)
              (161 . |kernel|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 18) 18
                                                     6 133 7)
              (166 . |multivariate|) (172 . |coerce|) (177 . D) (|List| %)
              (183 . |eval|) (190 . *) |RDEEFX;ei_int;I2FSR;58| (196 . /)
              (202 . |eval|) (|SparseUnivariatePolynomial| 36) (|Mapping| 36 7)
              (|SparseUnivariatePolynomialFunctions2| 7 36) (209 . |map|)
              (215 . +) (221 . |coerce|) (226 . |0|) (|Mapping| 7 7 7)
              (230 . |reduce|) (237 . -) (243 . =) (249 . ^) (|Vector| 7)
              (255 . |vector|) (|Union| 86 '"failed")
              (|IntegerLinearDependence| 7) (260 . |particularSolutionOverQ|)
              (|Record| (|:| |num| 112) (|:| |den| 28)) (|Vector| 138)
              (|InnerCommonDenominator| 28 138 112 86)
              (266 . |splitDenominator|) (271 . ~=) (|SingletonAsOrderedSet|)
              (277 . |create|) '|dummy| (281 . |eval|) (288 . |coefficients|)
              (|Mapping| 20 7) (293 . |every?|) (299 . *) (305 . |monomial|)
              (311 . |coerce|) (316 . +) (322 . |resultant|) (328 . |0|)
              (332 . |leadingCoefficient|) (337 . /) (343 . |gcd|)
              (|Union| % '"failed") (349 . |exquo|) (355 . |1|) (359 . ~=)
              (365 . |reductum|) (370 . =) (|List| 28) (|Vector| 28)
              (376 . |vector|) (381 . |gcd|) (386 . |elt|) (392 . |setelt!|)
              (399 . |invmod|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (405 . |extendedEuclidean|) (411 . *) (417 . +) (|Factored| 36)
              (|ExpressionFactorPolynomial| 6 7) (423 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 126) (|:| |factor| 36) (|:| |exponent| 17))
              (|List| 127) (428 . |factorList|) (433 . ~=)
              (|Union| 28 '#1="failed") (439 . |retractIfCan|)
              (|SparseMultivariatePolynomial| 6 18) (444 . |1|) (448 . *)
              (|Record| (|:| |particular| 82) (|:| |basis| (|List| 86)))
              (454 . |solveLinearlyOverQ|) (|Fraction| 28) (460 . |coerce|)
              (|List| 138) (465 . |entries|) (470 . |vector|) (475 . |entries|)
              (|Fraction| 155) (|Equation| 144) (480 . |rhs|) (485 . |0|)
              (489 . ~=) (495 . |lhs|) (500 . |retract|) (505 . ~=)
              (|Union| 155 '#2="failed") (511 . |retractIfCan|)
              (|Union| 7 '"failed") (|Polynomial| 7) (516 . |retractIfCan|)
              (|Union| 138 '#1#) (521 . |retractIfCan|) (526 . |numer|)
              (|List| 13) (531 . |variables|) (536 . |member?|) (542 . |eval|)
              (549 . |retract|) (|FunctionSpaceRationalRoots| 6 7)
              (554 . |get_rational_roots|) (560 . |coerce|) (565 . |rest|)
              (570 . |rest|) (|SparseUnivariatePolynomial| 155)
              (|Mapping| 155 7) (|SparseUnivariatePolynomialFunctions2| 7 155)
              (575 . |map|) (|SparseUnivariatePolynomial| %)
              (581 . |multivariate|) (|SparseMultivariatePolynomial| 6 34)
              (587 . |numer|) (592 . |coerce|) (597 . |coerce|) (|List| 185)
              (|List| 144) (|SystemSolvePackage| 7) (602 . |solve|) (608 . -)
              (|List| 145) (614 . |last|) (619 . |coerce|) (624 . |univariate|)
              (629 . |rem|) (635 . |retractIfCan|) (640 . |differentiate|)
              (645 . |resultant|) (651 . |member?|) (657 . ^) (663 . /)
              (669 . |0|) (|Mapping| 36 36 36) (|List| 36) (673 . |reduce|)
              (680 . |unit|) (685 . |retract|)
              (|Record| (|:| |exponent| 17) (|:| |coef| 7) (|:| |radicand| 7))
              (|PolynomialRoots| (|IndexedExponents| 18) 18 6 133 7)
              (690 . |froot|) (696 . *) (|Matrix| 7) (702 . |zero|)
              (708 . |setelt!|) (716 . |zero|) (721 . |solveLinearlyOverQ|)
              (727 . |elt|) (733 . |denom|) (738 . *) (744 . |numer|)
              (749 . |minimumDegree|) (754 . |1|) (|List| 140) (|Matrix| 138)
              (758 . |matrix|) (|LinearSystemMatrixPackage| 138 86 86 218)
              (763 . |solve|) (769 . |parts|) (774 . |setelt!|) (781 . |0|)
              (785 . /) (791 . *) (797 . -) (803 . |retractIfCan|) (808 . ~=)
              (814 . |zero?|) (819 . |zero?|) (|Mapping| 20 28)
              (824 . |every?|) (830 . =) (836 . |retract|) (841 . *)
              (847 . |makeFR|) (|Factored| %) (853 . |squareFree|)
              (858 . |rootOf|) (863 . |elt|) (|Union| 80 '"failed")
              (|Mapping| 7 7) (|List| 243) (|ConstantLinearDependence| 6 7)
              (869 . |particularSolutionOverConstants|)
              (|Record| (|:| |logands| 26) (|:| |basis| (|List| 86)))
              (|ParametricIntegration| 6 7) (876 . |logextint|)
              (|LaurentPolynomial| 7 36) (883 . |coerce|) (888 . |max|)
              (894 . |max|) (|Mapping| 17 17 17) (|List| 17) (900 . |reduce|)
              (|Mapping| 247 12 26) (|ParametricRischDE| 6 7)
              (906 . |exp_lower_bound|)
              (|Record| (|:| |ratpart| 7) (|:| |coeffs| 80))
              (|Union| 260 '"failed") (917 . |do_param_RDE|) (|Union| 36 '#2#)
              (926 . |retractIfCan|)
              (|Record| (|:| |ans| 36) (|:| |remainder| 36)) (|Mapping| 36 36)
              (|RDEaux| 7) (931 . SPDE1) (938 . -) (944 . *) (950 . |1|)
              (954 . |setelt!|) (961 . |denom|) (|Factored| 133)
              (|MultivariateFactorize| 18 (|IndexedExponents| 18) 6 133)
              (966 . |factor|)
              (|Record| (|:| |flag| 126) (|:| |factor| 133)
                        (|:| |exponent| 17))
              (|List| 277) (971 . |factorList|) (976 . *) (982 . *)
              (|Mapping| 133 133 133) (|List| 133) (988 . |reduce|) (995 . *)
              (1001 . ^) (1007 . |unit|) (1012 . |retract|) (1017 . *)
              (|PositiveInteger|) (1023 . ^) (1029 . |concat|) (|List| 26)
              (1035 . |matrix|) (|Record| (|:| |mat| 301) (|:| |vec| 113))
              (|Matrix| %) (|Vector| %) (1040 . |reducedSystem|)
              (|Union| 113 '"failed")
              (|Record| (|:| |particular| 299) (|:| |basis| (|List| 113)))
              (|Matrix| 28) (|SmithNormalForm| 28 113 113 301)
              (1046 . |diophantineSystem|) (1052 . /) (|Union| 293 '"failed")
              (|DenominatorIntegration| 6 7) (1058 . |solve_u|)
              (1065 . |second|) (1070 . |reduce|)
              (|PartialFractionUtilities| 7 36) (1076 . |decompose|)
              (1082 . |univariate|) (1089 . |retract|) (1094 . ^) (1100 . *)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (1106 . |divide|) (1112 . |elt|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 319 '"failed") (1118 . |extendedEuclidean|)
              (1125 . |differentiate|) (1131 . |exp|) (1136 . |Ei|)
              (1141 . |zerosOf|) (1146 . |retract|) (1151 . +) (1157 . |elt|)
              (|Vector| 36) (1164 . |elt|)
              (|Record| (|:| |factor| 36) (|:| |ratpart| 28) (|:| |v_part| 7)
                        (|:| |alg_part| 36) (|:| |u_part| 7)
                        (|:| |exponent| 28) (|:| |shift_part| 7))
              (|List| 331) (1170 . |elt|) (1176 . |vector|)
              (|Record| (|:| |basis| 329) (|:| |transform| 301))
              (|GcdBasis| 36) (1181 . |gcdDecomposition|) (1186 . =)
              (1192 . |elt|) (1199 . |tower|) (1204 . ~=) (1210 . ^) (1216 . *)
              (1222 . |sqrt|) (1227 . |pi|) (1231 . |erf|) (|List| 6)
              (1236 . |coefficients|) (|Complex| 28) (1241 . |imag|)
              (1246 . |0|) (1250 . =) (|Mapping| 20 349) (|List| 349)
              (1256 . |every?|) (1262 . |real|) (1267 . |complex|)
              (1273 . |coerce|) (1278 . |smaller?|) (1284 . |fresnelC|)
              (1289 . |fresnelS|) (1294 . |mk_erf|) (1300 . |log|)
              (1305 . |Gamma|) (1311 . ^) (1317 . ~=) (1323 . |coerce|)
              (1328 . |eval|) (|String|) (|OutputForm|) (1335 . |message|)
              (|Void|) (1340 . |print|) (1345 . |differentiate|)
              (|Record| (|:| |answer| 37) (|:| |logpart| 37)
                        (|:| |specpart| 37) (|:| |polypart| 36))
              (|TranscendentalHermiteIntegration| 7 36)
              (1352 . |HermiteIntegrate|)
              (|Record| (|:| |normal| 36) (|:| |special| 36))
              (|MonomialExtensionTools| 7 36) (1359 . |split|))
           '#(|mk_erf| 1365 |ei_int| 1371) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|ei_int|
                                 ((|Record| (|:| |ans| |#2|) (|:| |right| |#2|)
                                            (|:| |primpart| |#2|)
                                            (|:| |sol?| (|Boolean|)))
                                  (|Integer|) |#2| |#2| (|Symbol|)))
                                T)
                              '((|mk_erf| (|#2| |#2| |#2|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 380
                                            '(1 7 10 0 11 2 14 12 12 13 15 2 14
                                              12 12 12 16 1 18 17 0 19 2 12 20
                                              18 0 21 2 18 20 0 13 22 1 18 23 0
                                              24 2 23 20 0 13 25 1 18 26 0 27 2
                                              26 7 0 28 29 1 7 28 0 30 0 6 0 31
                                              0 7 0 32 2 7 33 0 34 35 1 37 36 0
                                              38 1 37 36 0 39 1 36 17 0 40 2 36
                                              7 0 17 41 0 6 0 42 2 36 0 7 17 43
                                              1 36 0 7 44 2 36 0 0 0 45 1 37 0
                                              36 46 1 7 0 0 47 2 36 0 0 0 48 2
                                              37 0 0 0 49 1 14 18 12 50 1 18 51
                                              0 52 4 54 53 7 7 13 12 55 0 13 0
                                              56 1 18 0 13 57 2 58 7 37 18 59 1
                                              7 0 34 60 2 7 0 0 13 61 3 7 0 0
                                              10 62 63 2 7 0 0 0 64 2 7 0 0 0
                                              66 3 7 0 0 34 0 67 2 70 68 69 36
                                              71 2 7 0 0 0 72 1 7 0 28 73 0 7 0
                                              74 3 26 7 75 0 7 76 2 7 0 0 0 77
                                              2 7 20 0 0 78 2 7 0 0 28 79 1 80
                                              0 26 81 2 83 82 80 7 84 1 87 85
                                              86 88 2 28 20 0 0 89 0 90 0 91 3
                                              36 0 0 90 0 93 1 36 26 0 94 2 26
                                              20 95 0 96 2 36 0 0 0 97 2 68 0
                                              36 17 98 1 68 0 36 99 2 68 0 0 0
                                              100 2 68 36 0 0 101 0 36 0 102 1
                                              36 7 0 103 2 36 0 0 7 104 2 36 0
                                              0 0 105 2 36 106 0 0 107 0 36 0
                                              108 2 36 20 0 0 109 1 36 0 0 110
                                              2 36 20 0 0 111 1 113 0 112 114 1
                                              28 0 62 115 2 113 28 0 28 116 3
                                              113 28 0 28 28 117 2 28 0 0 0 118
                                              2 28 119 0 0 120 2 113 0 28 0 121
                                              2 113 0 0 0 122 1 124 123 36 125
                                              1 123 128 0 129 2 7 20 0 0 130 1
                                              7 131 0 132 0 133 0 134 2 36 0 7
                                              0 135 2 83 136 80 7 137 1 138 0
                                              28 139 1 86 140 0 141 1 86 0 140
                                              142 1 113 112 0 143 1 145 144 0
                                              146 0 144 0 147 2 144 20 0 0 148
                                              1 145 144 0 149 1 144 13 0 150 2
                                              13 20 0 0 151 1 144 152 0 153 1
                                              155 154 0 156 1 7 157 0 158 1 144
                                              155 0 159 1 155 160 0 161 2 160
                                              20 13 0 162 3 155 0 0 13 7 163 1
                                              155 7 0 164 2 165 140 7 18 166 1
                                              155 0 7 167 1 160 0 0 168 1 12 0
                                              0 169 2 172 170 171 36 173 2 155
                                              0 174 13 175 1 7 176 0 177 1 7 0
                                              176 178 1 144 0 155 179 2 182 180
                                              181 160 183 2 144 0 0 0 184 1 185
                                              145 0 186 1 7 0 138 187 1 155 36
                                              0 188 2 36 0 0 0 189 1 138 131 0
                                              190 1 36 0 0 191 2 36 7 0 0 192 2
                                              140 20 138 0 193 2 36 0 0 17 194
                                              2 37 0 36 36 195 0 37 0 196 3 198
                                              36 197 0 36 199 1 123 36 0 200 1
                                              36 7 0 201 2 203 202 7 17 204 2
                                              36 0 0 7 205 2 206 0 17 17 207 4
                                              206 7 0 28 28 7 208 1 80 0 17 209
                                              2 83 136 206 80 210 2 86 138 0 28
                                              211 1 138 28 0 212 2 138 0 28 0
                                              213 1 138 28 0 214 1 36 17 0 215
                                              0 138 0 216 1 218 0 217 219 2 220
                                              136 218 86 221 1 86 140 0 222 3
                                              86 138 0 28 138 223 0 138 0 224 2
                                              138 0 28 28 225 2 138 0 0 28 226
                                              2 138 0 0 0 227 1 36 154 0 228 2
                                              17 20 0 0 229 1 138 20 0 230 1 28
                                              20 0 231 2 112 20 232 0 233 2 138
                                              20 0 0 234 1 138 28 0 235 2 7 0
                                              28 0 236 2 123 0 36 128 237 1 36
                                              238 0 239 1 7 0 174 240 2 80 7 0
                                              28 241 3 245 242 80 7 244 246 3
                                              248 247 13 12 26 249 1 250 0 36
                                              251 2 28 0 0 0 252 2 17 0 0 0 253
                                              2 255 17 254 0 256 7 258 28 36
                                              250 28 28 12 7 257 259 5 54 261 7
                                              7 26 13 12 262 1 37 263 0 264 3
                                              267 265 36 36 266 268 2 37 0 0 0
                                              269 2 37 0 36 0 270 0 37 0 271 3
                                              80 7 0 28 7 272 1 7 176 0 273 1
                                              275 274 133 276 1 274 278 0 279 2
                                              28 0 0 28 280 2 133 0 0 0 281 3
                                              283 133 282 0 133 284 2 138 0 0
                                              138 285 2 133 0 0 17 286 1 274
                                              133 0 287 1 133 6 0 288 2 7 0 6 0
                                              289 2 7 0 0 290 291 2 26 0 0 0
                                              292 1 206 0 293 294 2 7 295 296
                                              297 298 2 302 300 301 113 303 2
                                              138 0 0 0 304 3 306 305 7 7 13
                                              307 1 26 7 0 308 2 198 36 197 0
                                              309 2 310 198 36 198 311 3 58 36
                                              7 18 36 312 1 7 34 0 313 2 37 0 0
                                              28 314 2 37 0 0 0 315 2 36 316 0
                                              0 317 2 198 36 0 28 318 3 36 320
                                              0 0 0 321 2 7 0 0 13 322 1 7 0 0
                                              323 1 7 0 0 324 1 7 62 174 325 1
                                              37 36 0 326 2 37 0 0 0 327 3 301
                                              28 0 28 28 328 2 329 36 0 28 330
                                              2 332 331 0 28 333 1 329 0 198
                                              334 1 336 335 329 337 2 37 20 0 0
                                              338 3 301 0 0 112 112 339 1 7 10
                                              0 340 2 18 20 0 0 341 2 7 0 0 17
                                              342 2 37 0 0 36 343 1 7 0 0 344 0
                                              7 0 345 1 7 0 0 346 1 133 347 0
                                              348 1 349 28 0 350 0 28 0 351 2
                                              28 20 0 0 352 2 354 20 353 0 355
                                              1 349 28 0 356 2 349 0 28 28 357
                                              1 7 0 6 358 2 7 20 0 0 359 1 7 0
                                              0 360 1 7 0 0 361 2 0 7 7 7 362 1
                                              7 0 0 363 2 7 0 0 0 364 2 7 0 0 0
                                              365 2 37 20 0 0 366 1 7 0 13 367
                                              3 7 0 0 0 0 368 1 370 0 369 371 1
                                              370 372 0 373 3 36 0 0 243 0 374
                                              3 376 375 37 266 36 377 2 379 378
                                              36 266 380 2 0 7 7 7 362 4 0 53
                                              28 7 7 13 65)))))
           '|lookupComplete|)) 
