
(SDEFUN |FSFUN;bernoulli_gamma_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|zinv| #1=(|Complex| (|Float|))) (|z2inv| #2=(|Complex| (|Float|)))
          (|k| NIL) (#3=#:G46 NIL) (|zk| #1#) (|kinv| (|Float|))
          (|bk| (|Float|)) (|s| #2#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 8)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 9)))
              (LETT |s|
                    (SPADCALL |zk|
                              (SPADCALL (|spadConstant| % 7)
                                        (SPADCALL 12 (QREFELT % 11))
                                        (QREFELT % 8))
                              (QREFELT % 9)))
              (SEQ (LETT |k| 1) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |zk| (SPADCALL |zk| |z2inv| (QREFELT % 9)))
                        (LETT |kinv|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL
                                         (* (+ (* 2 |k|) 2) (+ (* 2 |k|) 1))
                                         (QREFELT % 16))
                                        (QREFELT % 17)))
                        (LETT |bk|
                              (SPADCALL
                               (SPADCALL (+ (* 2 |k|) 2) (QREFELT % 19))
                               (QREFELT % 20)))
                        (EXIT
                         (LETT |s|
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |bk| |kinv|
                                                     (QREFELT % 21))
                                           (QREFELT % 22))
                                          |zk| (QREFELT % 9))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |s|)))) 

(SDEFUN |FSFUN;logGamma_a1|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPADCALL
         (SPADCALL
          (SPADCALL
           (SPADCALL |z|
                     (SPADCALL (|spadConstant| % 7) (SPADCALL 2 (QREFELT % 11))
                               (QREFELT % 8))
                     (QREFELT % 24))
           (SPADCALL |z| (QREFELT % 25)) (QREFELT % 9))
          |z| (QREFELT % 24))
         (SPADCALL
          (SPADCALL (|spadConstant| % 15) (SPADCALL 2 (QREFELT % 16))
                    (QREFELT % 17))
          (SPADCALL
           (SPADCALL (SPADCALL 2 (QREFELT % 16)) (SPADCALL (QREFELT % 26))
                     (QREFELT % 27))
           (QREFELT % 25))
          (QREFELT % 27))
         (QREFELT % 23))) 

(SDEFUN |FSFUN;logGamma_asymptotic|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|lg1| (|Complex| (|Float|))))
               (SEQ (LETT |lg1| (|FSFUN;logGamma_a1| |z| %))
                    (EXIT
                     (SPADCALL |lg1| (|FSFUN;bernoulli_gamma_series| |z| |n| %)
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;gamma_series|
        ((|z| (|Complex| (|Float|))) (|l| (|Float|)) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|k| NIL) (#1=#:G55 NIL) (|tk| #2=(|Complex| (|Float|))) (|s| #2#))
         (SEQ
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL |l| (QREFELT % 28))
                                      (QREFELT % 22))
                            (QREFELT % 9))
                  (QREFELT % 29))
                 |z| (QREFELT % 8)))
          (LETT |s| |tk|)
          (SEQ (LETT |k| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (LETT |tk|
                      (SPADCALL
                       (SPADCALL |tk| (SPADCALL |l| (QREFELT % 22))
                                 (QREFELT % 9))
                       (SPADCALL |z| (SPADCALL |k| (QREFELT % 11))
                                 (QREFELT % 23))
                       (QREFELT % 8)))
                (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT % 23)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |s|
                     (SPADCALL
                      (SPADCALL (SPADCALL |l| (QREFELT % 30)) (QREFELT % 31))
                      (QREFELT % 22))
                     (QREFELT % 9)))))) 

(SDEFUN |FSFUN;Gamma;2C;5|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|l0| (|PositiveInteger|)) (|l| (|PositiveInteger|))
          (|re_z| (|Float|)) (|re_zint| (|Float|)) (|z1| (|Complex| (|Float|)))
          (|sign| (|Float|)) (|c_pi| (|Complex| (|Float|)))
          (|one| (|Complex| (|Float|))) (|abs_z| (|Float|)) (#1=#:G60 NIL)
          (|oz| (|PositiveInteger|)) (#2=#:G61 NIL) (|lz| (|PositiveInteger|))
          (|loss| (|Float|)) (|len| (|Float|)) (|l1a| (|Integer|))
          (#3=#:G62 NIL) (#4=#:G64 NIL) (|llog| (|PositiveInteger|))
          (#5=#:G66 NIL) (|l1| (|PositiveInteger|))
          (|result| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |sign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (SPADCALL (|spadConstant| % 15)
                                           (QREFELT % 30)))
                                (#6='T (|spadConstant| % 15))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#6#
                            (SEQ (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |one| (|spadConstant| % 7))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL |sign| |c_pi| (QREFELT % 27))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 44))
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 9))
                                        (QREFELT % 8)))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#6#
                    (SEQ (LETT |abs_z| (SPADCALL |z| (QREFELT % 46)))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                      (SPADCALL 6 |abs_z| (QREFELT % 47))
                                      (QREFELT % 48))
                            (SEQ
                             (LETT |oz|
                                   (PROG1
                                       (LETT #1#
                                             (MAX
                                              (SPADCALL |abs_z| (QREFELT % 49))
                                              5))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#)))
                             (LETT |lz|
                                   (PROG1 (LETT #2# (INTEGER-LENGTH |oz|))
                                     (|check_subtype2| (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#)))
                             (SPADCALL (+ (+ |oz| |lz|) 30) (QREFELT % 39))
                             (LETT |loss|
                                   (SPADCALL
                                    (SPADCALL
                                     (|FSFUN;logGamma_a1|
                                      (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                                (QREFELT % 22))
                                      %)
                                     (QREFELT % 35))
                                    (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                              (QREFELT % 35))
                                    (QREFELT % 50)))
                             (LETT |len|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL 2 (SPADCALL |z| (QREFELT % 35))
                                               (QREFELT % 47))
                                     (SPADCALL 2
                                               (SPADCALL |loss|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (QREFELT % 51))
                                                          (SPADCALL |l|
                                                                    (QREFELT %
                                                                             16))
                                                          (QREFELT % 21))
                                                         (QREFELT % 52))
                                               (QREFELT % 47))
                                     (QREFELT % 52))
                                    (SPADCALL 3 (QREFELT % 16))
                                    (QREFELT % 52)))
                             (LETT |l1a|
                                   (+
                                    (+ (+ |l| (SPADCALL |len| (QREFELT % 49)))
                                       (SPADCALL
                                        (SPADCALL |loss|
                                                  (SPADCALL (QREFELT % 51))
                                                  (QREFELT % 17))
                                        (QREFELT % 53)))
                                    12))
                             (LETT |l1|
                                   (PROG1
                                       (LETT #3#
                                             (MAX |l1a|
                                                  (+
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |abs_z|
                                                               (SPADCALL |len|
                                                                         (QREFELT
                                                                          %
                                                                          28))
                                                               (QREFELT % 21))
                                                     (SPADCALL (QREFELT % 51))
                                                     (QREFELT % 17))
                                                    (QREFELT % 53))
                                                   10)))
                                     (|check_subtype2| (> #3# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #3#)))
                             (SPADCALL |l1| (QREFELT % 39))
                             (LETT |result|
                                   (|FSFUN;gamma_series| |z| |len|
                                    (+ (* 3 (SPADCALL |len| (QREFELT % 53))) 6)
                                    %))
                             (SPADCALL |l0| (QREFELT % 39)) (EXIT |result|)))
                           (#6#
                            (SEQ
                             (LETT |llog|
                                   (PROG1
                                       (LETT #4#
                                             (MAX
                                              (SPADCALL
                                               (SPADCALL
                                                (|FSFUN;logGamma_a1| |z| %)
                                                (QREFELT % 46))
                                               (QREFELT % 49))
                                              5))
                                     (|check_subtype2| (> #4# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #4#)))
                             (LETT |l1|
                                   (+
                                    (+ (+ |l| |llog|)
                                       (PROG1 (LETT #5# (INTEGER-LENGTH |l|))
                                         (|check_subtype2| (> #5# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #5#)))
                                    12))
                             (SPADCALL |l1| (QREFELT % 39))
                             (LETT |result|
                                   (SPADCALL
                                    (|FSFUN;logGamma_asymptotic| |z|
                                     (+ (|quotient_INT| |l| 6) 1) %)
                                    (QREFELT % 29)))
                             (SPADCALL |l0| (QREFELT % 39))
                             (EXIT |result|)))))))))))
           (#6# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;logGamma_lift|
        ((|z| (|Complex| (|Float|))) (|lg2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|lg2i| (|Float|)) (|k| (|Float|)))
               (SEQ (LETT |lg2i| (SPADCALL |lg2| (QREFELT % 54)))
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                       (QREFELT % 54))
                             |lg2i| (QREFELT % 50))
                            (SPADCALL 2 (SPADCALL (QREFELT % 55))
                                      (QREFELT % 47))
                            (QREFELT % 17))
                           (QREFELT % 40)))
                    (EXIT
                     (SPADCALL |lg2|
                               (SPADCALL (SPADCALL (QREFELT % 56))
                                         (SPADCALL
                                          (SPADCALL |k|
                                                    (SPADCALL 2 (QREFELT % 16))
                                                    (QREFELT % 21))
                                          (SPADCALL (QREFELT % 26))
                                          (QREFELT % 27))
                                         (QREFELT % 9))
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;logGamma;2C;7|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|l0| (|PositiveInteger|)) (|re_z| (|Float|))
          (|one| (|Complex| (|Float|))) (|re_zint| (|Float|))
          (|z1| #1=(|Complex| (|Float|))) (|lsign| (|Float|))
          (|c_pi| (|Complex| (|Float|))) (|abs_z| (|Float|))
          (|l| (|PositiveInteger|)) (#2=#:G81 NIL) (|l1| (|PositiveInteger|))
          (|result| #1#))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 35)))
                 (LETT |one| (|spadConstant| % 7))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (QREFELT % 38))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 40)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 24)))
                         (LETT |lsign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 41)))
                                 (|spadConstant| % 15))
                                (#3='T (|spadConstant| % 57))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 42)
                                      (QREFELT % 43))
                            (SEQ (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#3#
                            (SEQ (SPADCALL (+ |l| 5) (QREFELT % 39))
                                 (LETT |c_pi| (SPADCALL (QREFELT % 26)))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| (QREFELT % 25))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| % 57)
                                                     |lsign| (QREFELT % 58))
                                           |c_pi| (QREFELT % 9))
                                          (QREFELT % 23))
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 24))
                                          (QREFELT % 59))
                                         (QREFELT % 24))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 45))
                                         (QREFELT % 25))
                                        (QREFELT % 24)))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z| |result| %))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))))))
                   (#3#
                    (SEQ (LETT |abs_z| (SPADCALL |z| (QREFELT % 46)))
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                      (SPADCALL 6 |abs_z| (QREFELT % 47))
                                      (QREFELT % 48))
                            (SEQ (LETT |l| (+ |l| 5))
                                 (COND
                                  ((OR
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |z| |one| (QREFELT % 24))
                                      (QREFELT % 46))
                                     (SPADCALL (|spadConstant| % 15) 4
                                               (QREFELT % 36))
                                     (QREFELT % 38))
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |z| |one| (QREFELT % 24))
                                       |one| (QREFELT % 24))
                                      (QREFELT % 46))
                                     (SPADCALL (|spadConstant| % 15) 4
                                               (QREFELT % 36))
                                     (QREFELT % 38)))
                                   (LETT |l| (* 2 |l|))))
                                 (SPADCALL |l| (QREFELT % 39))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z|
                                        (SPADCALL (SPADCALL |z| (QREFELT % 44))
                                                  (QREFELT % 25))
                                        %))
                                 (SPADCALL |l0| (QREFELT % 39))
                                 (EXIT |result|)))
                           (#3#
                            (SEQ
                             (LETT |l1|
                                   (+
                                    (+ |l|
                                       (PROG1 (LETT #2# (INTEGER-LENGTH |l|))
                                         (|check_subtype2| (> #2# 0)
                                                           '(|PositiveInteger|)
                                                           '(|Integer|) #2#)))
                                    12))
                             (SPADCALL |l1| (QREFELT % 39))
                             (LETT |result|
                                   (|FSFUN;logGamma_asymptotic| |z|
                                    (+ (|quotient_INT| |l| 6) 1) %))
                             (SPADCALL |l0| (QREFELT % 39))
                             (EXIT |result|)))))))))))
           (#3# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Gamma;2F;8| ((|x| (|Float|)) (% (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 44))
                  (QREFELT % 35))) 

(SDEFUN |FSFUN;logGamma;2F;9| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 61))
          (|error| "Argument to logGamma <= 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 59))
                    (QREFELT % 35))))) 

(SDEFUN |FSFUN;Beta;3C;10|
        ((|x| (|Complex| (|Float|))) (|y| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|l0| (|PositiveInteger|)) (|l1| (|PositiveInteger|))
          (|res| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l1| (MAX 30 (+ |l0| 10)))
                 (SPADCALL |l1| (QREFELT % 39))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 44))
                                  (SPADCALL |y| (QREFELT % 44)) (QREFELT % 9))
                        (SPADCALL (SPADCALL |x| |y| (QREFELT % 23))
                                  (QREFELT % 44))
                        (QREFELT % 8)))
                 (SPADCALL |l0| (QREFELT % 39)) (EXIT |res|)))
           ('T (|error| "Beta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Beta;3F;11| ((|x| (|Float|)) (|y| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 22)) (SPADCALL |y| (QREFELT % 22))
                   (QREFELT % 63))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;rabs;2F;12| ((|r| (|Float|)) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 65))) 

(SDEFUN |FSFUN;rabs;CF;13| ((|r| (|Complex| (|Float|))) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 46))) 

(MAKEPROP '|FSFUN;rabs;2Df;14| '|SPADreplace| '|abs_DF|) 

(SDEFUN |FSFUN;rabs;2Df;14| ((|r| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|abs_DF| |r|)) 

(SDEFUN |FSFUN;rabs;CDf;15|
        ((|r| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL |r| (QREFELT % 71))) 

(SDEFUN |FSFUN;digamma_euler_maclaurin|
        ((|a| (|Complex| (|Float|))) (|n| (|Integer|)) (|m| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((#1=#:G103 NIL) (|ck| #2=(|Complex| (|Float|))) (|n1| (|Integer|))
          (|na| (|Complex| (|Float|))) (|ns| #2#) (|n2_inv| #2#) (|k| NIL)
          (#3=#:G104 NIL) (|kfac| (|Float|)) (|ns1| (|Complex| (|Float|)))
          (|bk| (|Float|)) (|res| (|Complex| (|Float|))))
         (SEQ (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |k| 0) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (LETT |ck|
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL (SPADCALL |k| (QREFELT % 11)) |a|
                                              (QREFELT % 23))
                                    (QREFELT % 8)))
                    (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |n1| (+ |n| 1))
              (LETT |na|
                    (SPADCALL (SPADCALL |n1| (QREFELT % 11)) |a|
                              (QREFELT % 23)))
              (LETT |ns| (SPADCALL (|spadConstant| % 7) |na| (QREFELT % 8)))
              (LETT |ns1| (|spadConstant| % 7))
              (LETT |res|
                    (SPADCALL
                     (SPADCALL |res|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) 2
                                          (QREFELT % 36))
                                |ns| (QREFELT % 27))
                               (QREFELT % 23))
                     (SPADCALL |na| (QREFELT % 25)) (QREFELT % 24)))
              (LETT |n2_inv|
                    (SPADCALL (|spadConstant| % 7)
                              (SPADCALL |na| |na| (QREFELT % 9))
                              (QREFELT % 8)))
              (SEQ (LETT |k| 1) (LETT #3# |m|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ (LETT |kfac| (SPADCALL (* 2 |k|) (QREFELT % 16)))
                        (LETT |ns1| (SPADCALL |n2_inv| |ns1| (QREFELT % 9)))
                        (LETT |bk|
                              (SPADCALL (SPADCALL (* 2 |k|) (QREFELT % 19))
                                        (QREFELT % 20)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL
                                          (SPADCALL |bk| |kfac| (QREFELT % 17))
                                          |ns1| (QREFELT % 27))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 73)))))) 

(SDEFUN |FSFUN;digamma_aux|
        ((|a| (|Complex| (|Float|))) (|l| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|abs_a| (|Float|)))
               (SEQ
                (LETT |abs_a|
                      (SPADCALL (SPADCALL |a| (QREFELT % 74)) (QREFELT % 75)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                             (SPADCALL 6 |abs_a| (QREFELT % 47))
                             (QREFELT % 48))
                   (|FSFUN;digamma_euler_maclaurin| |a|
                    (+ (|quotient_INT| |l| 6) 1) (+ (|quotient_INT| |l| 6) 1)
                    %))
                  ('T
                   (|FSFUN;digamma_euler_maclaurin| |a| -1
                    (+ (|quotient_INT| |l| 6) 1) %))))))) 

(SDEFUN |FSFUN;digamma;2C;18|
        ((|a| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|l0| (|PositiveInteger|)) (|re_a| (|Float|))
          (|l| (|PositiveInteger|)) (|re_aint| (|Float|))
          (|a1| (|Complex| (|Float|))) (|r_pi| (|Float|))
          (|ap| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 34)))
                 (LETT |l| (MAX (+ |l0| 10) 61))
                 (EXIT
                  (|finally|
                   (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT % 35)))
                        (EXIT
                         (COND
                          ((SPADCALL |re_a|
                                     (SPADCALL (|spadConstant| % 15) 2
                                               (QREFELT % 36))
                                     (QREFELT % 38))
                           (SEQ (LETT |l| (+ |l| 5))
                                (SPADCALL
                                 (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                 (QREFELT % 39))
                                (LETT |re_aint|
                                      (SPADCALL |re_a| (QREFELT % 40)))
                                (LETT |a1|
                                      (SPADCALL |a|
                                                (SPADCALL |re_aint|
                                                          (|spadConstant| % 57)
                                                          (QREFELT % 58))
                                                (QREFELT % 24)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |a1| (|spadConstant| % 42)
                                             (QREFELT % 43))
                                   (|error| "Pole of Gamma"))
                                  (#1='T
                                   (SEQ (LETT |r_pi| (SPADCALL (QREFELT % 55)))
                                        (LETT |ap|
                                              (SPADCALL |r_pi| |a1|
                                                        (QREFELT % 27)))
                                        (EXIT
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |r_pi|
                                                      (SPADCALL |ap|
                                                                (QREFELT % 76))
                                                      (QREFELT % 27))
                                            (SPADCALL |ap| (QREFELT % 45))
                                            (QREFELT % 8))
                                           (QREFELT % 73))
                                          (|FSFUN;digamma_aux|
                                           (SPADCALL (|spadConstant| % 7) |a|
                                                     (QREFELT % 24))
                                           |l| %)
                                          (QREFELT % 23)))))))))
                          (#1#
                           (SEQ
                            (SPADCALL (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                      (QREFELT % 39))
                            (EXIT (|FSFUN;digamma_aux| |a| |l| %)))))))
                   (SPADCALL |l0| (QREFELT % 39))))))
           (#1# (|error| "digamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;digamma;2F;19| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                   (QREFELT % 77))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;li2_series|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|nz| (|Float|)) (|oz| (|Integer|)) (|n| (|Integer|)) (|i| NIL)
          (#1=#:G120 NIL) (|k| (|Integer|)) (|k2| (|Integer|)) (|ck| (|Float|))
          (|res| (|Complex| (|Float|))))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 74)))
              (LETT |oz| (SPADCALL |nz| (QREFELT % 49)))
              (LETT |n|
                    (COND
                     ((< |oz| -200)
                      (+ (|quotient_INT| (* 2 |prec|) (- (- |oz|) 1)) 1))
                     ('T
                      (+
                       (SPADCALL
                        (SPADCALL
                         (|mul_DF|
                          (FLOAT (* 2 |prec|) MOST-POSITIVE-DOUBLE-FLOAT)
                          (|minus_DF|
                           (|div_DF|
                            (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT % 79))
                            (SPADCALL (SPADCALL |nz| (QREFELT % 80))
                                      (QREFELT % 79)))))
                         (QREFELT % 81))
                        (QREFELT % 82))
                       1))))
              (LETT |res| (|spadConstant| % 42))
              (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |k| (- (+ |n| 2) |i|)) (LETT |k2| (* |k| |k|))
                        (LETT |ck|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL |k2| (QREFELT % 16))
                                        (QREFELT % 17)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |z|
                                         (SPADCALL |res|
                                                   (SPADCALL |ck|
                                                             (|spadConstant| %
                                                                             57)
                                                             (QREFELT % 58))
                                                   (QREFELT % 23))
                                         (QREFELT % 9)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |z|
                         (SPADCALL (|spadConstant| % 7) |res| (QREFELT % 23))
                         (QREFELT % 9)))))) 

(SDEFUN |FSFUN;li2_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|rz| (|Float|)) (|iz| (|Float|)) (|siz| (|Float|))
          (|w| (|Complex| (|Float|))) (|dd| #1=(|Float|)) (|nz| #1#)
          (|z1| (|Complex| (|Float|))) (|rpi| (|Float|)) (|pi_fac| (|Float|))
          (|lmz| #2=(|Complex| (|Float|))) (|lz| #2#) (|nz1| #1#) (|lz1| #2#))
         (SEQ (LETT |rz| (SPADCALL |z| (QREFELT % 35)))
              (LETT |iz| (SPADCALL |z| (QREFELT % 54)))
              (LETT |siz|
                    (COND
                     ((SPADCALL |iz| (|spadConstant| % 57) (QREFELT % 48))
                      (|spadConstant| % 15))
                     (#3='T (SPADCALL (|spadConstant| % 15) (QREFELT % 30)))))
              (LETT |w|
                    (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                              (SPADCALL
                               (SPADCALL |siz|
                                         (SPADCALL (|spadConstant| % 15) 2
                                                   (QREFELT % 36))
                                         (QREFELT % 21))
                               (SPADCALL (SPADCALL 3 (QREFELT % 16))
                                         (QREFELT % 75))
                               (QREFELT % 21))
                              (QREFELT % 58)))
              (LETT |dd|
                    (SPADCALL (SPADCALL |z| |w| (QREFELT % 24))
                              (QREFELT % 74)))
              (EXIT
               (COND
                ((SPADCALL |dd|
                           (SPADCALL (|spadConstant| % 15) 8 (QREFELT % 36))
                           (QREFELT % 38))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                            (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT % 9))
                             (+ |prec| 2) %)
                            (QREFELT % 27))
                  (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT % 73)) (+ |prec| 2)
                   %)
                  (QREFELT % 24)))
                (#3#
                 (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 74)))
                      (LETT |z1|
                            (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)))
                      (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |rz|
                                   (SPADCALL (|spadConstant| % 15) 2
                                             (QREFELT % 36))
                                   (QREFELT % 48))
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 74)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 83))
                                 (SEQ
                                  (LETT |lmz|
                                        (SPADCALL (SPADCALL |z| (QREFELT % 73))
                                                  (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |pi_fac| (QREFELT % 22))
                                      (QREFELT % 73))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lmz| (QREFELT % 27))
                                      |lmz| (QREFELT % 9))
                                     (QREFELT % 24))
                                    (|FSFUN;li2_series|
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 8))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |z1| (|spadConstant| % 42)
                                                   (QREFELT % 43))
                                         (SPADCALL |pi_fac| (QREFELT % 22)))
                                        (#3#
                                         (SEQ
                                          (LETT |lz1|
                                                (SPADCALL |z1| (QREFELT % 25)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |nz|
                                                       (|spadConstant| % 15)
                                                       (QREFELT % 83))
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (|spadConstant| %
                                                                            15)
                                                            2 (QREFELT % 36))
                                                           |lz| (QREFELT % 27))
                                                          |lz1| (QREFELT % 24))
                                                         (QREFELT % 9))
                                               (QREFELT % 23))
                                              (|FSFUN;li2_series|
                                               (SPADCALL
                                                (SPADCALL |z1| |z|
                                                          (QREFELT % 8))
                                                (QREFELT % 73))
                                               |prec| %)
                                              (QREFELT % 23)))
                                            (#3#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz| |lz1|
                                                         (QREFELT % 9))
                                               (QREFELT % 24))
                                              (|FSFUN;li2_series| |z1| |prec|
                                               %)
                                              (QREFELT % 24)))))))))))))))
                        ((SPADCALL |nz| (|spadConstant| % 15) (QREFELT % 83))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pi_fac| (QREFELT % 22))
                                     (QREFELT % 73))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                             (SPADCALL |z1| (QREFELT % 25)) (QREFELT % 27))
                            (SPADCALL
                             (SPADCALL |z1| (SPADCALL |z| |z| (QREFELT % 9))
                                       (QREFELT % 8))
                             (QREFELT % 25))
                            (QREFELT % 9))
                           (QREFELT % 23))
                          (|FSFUN;li2_series|
                           (SPADCALL (|spadConstant| % 7) |z1| (QREFELT % 8))
                           |prec| %)
                          (QREFELT % 23)))
                        (#3#
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 74)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 83))
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT % 25)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 36))
                                       |lz1| (QREFELT % 27))
                                      |lz1| (QREFELT % 9))
                                     (QREFELT % 73))
                                    (|FSFUN;li2_series|
                                     (SPADCALL
                                      (SPADCALL |z| |z1| (QREFELT % 8))
                                      (QREFELT % 73))
                                     |prec| %)
                                    (QREFELT % 24)))))
                                (#3#
                                 (|FSFUN;li2_series| |z| |prec| %))))))))))))))) 

(SDEFUN |FSFUN;li2;2C;22|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;li2_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "li2 can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;li2;2F;23| ((|z| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 15) (QREFELT % 48))
          (|error| "li2 for argument bigger than 1"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                     (QREFELT % 84))
           (QREFELT % 35))))) 

(SDEFUN |FSFUN;dilog_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|nz| (|Float|)) (|rpi| (|Float|)) (|pi_fac| (|Float|))
          (|lz| #1=(|Complex| (|Float|))) (|lz1| #1#)
          (|res| (|Complex| (|Float|))))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 74)))
              (EXIT
               (COND
                ((SPADCALL |nz|
                           (SPADCALL (|spadConstant| % 15) 4 (QREFELT % 36))
                           (QREFELT % 38))
                 (SEQ (LETT |rpi| (SPADCALL (QREFELT % 55)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 36))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43))
                         (SPADCALL |pi_fac| (QREFELT % 22)))
                        (#2='T
                         (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                              (LETT |lz1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 24))
                                     (QREFELT % 25)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT % 22))
                                       (SPADCALL |lz| |lz1| (QREFELT % 9))
                                       (QREFELT % 24))
                                      (|FSFUN;li2_series| |z| |prec| %)
                                      (QREFELT % 24))))))))))
                (#2#
                 (|FSFUN;li2_aux|
                  (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 24)) |prec|
                  %))))))) 

(SDEFUN |FSFUN;dilog;2C;25|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;dilog_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "dilog can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;dilog;2F;26| ((|z| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |z| (|spadConstant| % 57) (QREFELT % 38))
          (|error| "dilog of negative number"))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                     (QREFELT % 86))
           (QREFELT % 35))))) 

(SDEFUN |FSFUN;zeta_borwein|
        ((|s| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|k| NIL) (#1=#:G147 NIL) (|dkd| (|Integer|)) (|dk| #2=(|Float|))
          (|ck| #2#) (|lk| (|Float|)) (|ks| (|Complex| (|Float|)))
          (|res1| #3=(|Complex| (|Float|))) (|res2| #3#) (|sign| (|Integer|))
          (|dn| (|Float|)) (|cn| (|Float|)) (|res| (|Complex| (|Float|))))
         (SEQ (LETT |res1| (|spadConstant| % 7))
              (LETT |res2| (|spadConstant| % 7)) (LETT |sign| -1)
              (LETT |dk| (|spadConstant| % 15))
              (LETT |ck| (|spadConstant| % 15))
              (SEQ (LETT |k| 1) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |dkd| (* (- (* 2 |k|) 1) |k|))
                        (LETT |dk|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 15)
                                         (SPADCALL |dkd| (QREFELT % 16))
                                         (QREFELT % 17))
                               |dk| (QREFELT % 21)))
                        (LETT |dk|
                              (SPADCALL
                               (SPADCALL
                                (* (* 2 (- (+ |n| |k|) 1)) (+ (- |n| |k|) 1))
                                (QREFELT % 16))
                               |dk| (QREFELT % 21)))
                        (LETT |ck| (SPADCALL |ck| |dk| (QREFELT % 52)))
                        (LETT |lk|
                              (SPADCALL (SPADCALL (+ |k| 1) (QREFELT % 16))
                                        (QREFELT % 28)))
                        (LETT |ks|
                              (SPADCALL
                               (SPADCALL (SPADCALL |lk| |s| (QREFELT % 27))
                                         (QREFELT % 73))
                               (QREFELT % 29)))
                        (LETT |res1|
                              (SPADCALL |res1|
                                        (SPADCALL
                                         (SPADCALL |sign| (QREFELT % 16)) |ks|
                                         (QREFELT % 27))
                                        (QREFELT % 23)))
                        (LETT |res2|
                              (SPADCALL |res2|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |sign| (QREFELT % 16)) |ck|
                                          (QREFELT % 21))
                                         |ks| (QREFELT % 27))
                                        (QREFELT % 23)))
                        (EXIT (LETT |sign| (- |sign|))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |dn|
                    (SPADCALL
                     (SPADCALL (SPADCALL 2 (QREFELT % 16))
                               (SPADCALL (|spadConstant| % 15)
                                         (SPADCALL |n| (QREFELT % 16))
                                         (QREFELT % 17))
                               (QREFELT % 21))
                     |dk| (QREFELT % 21)))
              (LETT |cn| (SPADCALL |ck| |dn| (QREFELT % 52)))
              (EXIT
               (LETT |res|
                     (SPADCALL |res1|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) |cn|
                                          (QREFELT % 17))
                                |res2| (QREFELT % 27))
                               (QREFELT % 24))))))) 

(SDEFUN |FSFUN;zeta_aux1|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s2| (|Complex| (|Float|))) (|nt| (|Integer|)) (|n| (|Integer|))
          (|s21| (|Complex| (|Float|))))
         (SEQ
          (LETT |s2| (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s| (QREFELT % 88)))
          (LETT |nt|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |s| (QREFELT % 54)) (QREFELT % 65))
                  (QREFELT % 40))
                 (QREFELT % 41)))
          (LETT |n|
                (+ (|quotient_INT| (+ (+ (* 4 |prec|) (* 9 |nt|)) 9) 10) 5))
          (LETT |s21|
                (SPADCALL (|spadConstant| % 7)
                          (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s2|
                                    (QREFELT % 8))
                          (QREFELT % 24)))
          (EXIT
           (SPADCALL (|FSFUN;zeta_borwein| |s| |n| %) |s21| (QREFELT % 8)))))) 

(SDEFUN |FSFUN;zeta_aux2|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|pi1| (|Float|)) (|l2pi| (|Float|)) (|is1| #1=(|Integer|))
          (|s1| (|Complex| (|Float|))) (|ns1| (|Float|)) (|lb| #1#)
          (|nprec| (|Integer|)) (|h| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL
             (SPADCALL (|spadConstant| % 15) (SPADCALL 4 (QREFELT % 16))
                       (QREFELT % 17))
             (SPADCALL
              (SPADCALL (SPADCALL |s| (|spadConstant| % 7) (QREFELT % 24))
                        (QREFELT % 35))
              (QREFELT % 66))
             (QREFELT % 38))
            (|FSFUN;zeta_aux1| |s| |prec| %))
           (#2='T
            (SEQ (SPADCALL (+ (* 2 |prec|) 15) (QREFELT % 39))
                 (LETT |s1| (SPADCALL (|spadConstant| % 7) |s| (QREFELT % 24)))
                 (LETT |ns1| (SPADCALL |s1| (QREFELT % 74)))
                 (EXIT
                  (COND
                   ((SPADCALL |ns1|
                              (SPADCALL (|spadConstant| % 15)
                                        (SPADCALL 2 (QREFELT % 16))
                                        (QREFELT % 17))
                              (QREFELT % 38))
                    (SEQ
                     (LETT |lb|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (SPADCALL |ns1| (QREFELT % 28))
                                        (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                                  (QREFELT % 28))
                                        (QREFELT % 17))
                              (QREFELT % 30))
                             (QREFELT % 40))
                            (QREFELT % 41)))
                     (EXIT
                      (COND
                       ((< |lb| (+ (|quotient_INT| |prec| 2) 5))
                        (SEQ (LETT |nprec| (+ (+ |prec| |lb|) 10))
                             (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                             (EXIT (|FSFUN;zeta_aux1| |s| |nprec| %))))
                       (#2#
                        (SEQ (SPADCALL (+ |prec| 15) (QREFELT % 39))
                             (EXIT
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 7) |s1|
                                          (QREFELT % 8))
                                (QREFELT % 73))
                               (SPADCALL (QREFELT % 90)) (QREFELT % 23)))))))))
                   (#2#
                    (SEQ (LETT |pi1| (SPADCALL (QREFELT % 55)))
                         (LETT |l2pi|
                               (SPADCALL
                                (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                          (QREFELT % 28))
                                (SPADCALL (SPADCALL 2 (QREFELT % 16)) |pi1|
                                          (QREFELT % 21))
                                (QREFELT % 17)))
                         (LETT |is1|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL |s1| |l2pi| (QREFELT % 91))
                                  (QREFELT % 54))
                                 (QREFELT % 40))
                                (QREFELT % 41)))
                         (LETT |s1|
                               (SPADCALL |s1|
                                         (SPADCALL (|spadConstant| % 57)
                                                   (SPADCALL
                                                    (SPADCALL |is1|
                                                              (QREFELT % 16))
                                                    |l2pi| (QREFELT % 17))
                                                   (QREFELT % 58))
                                         (QREFELT % 24)))
                         (LETT |ns1| (SPADCALL |s1| (QREFELT % 74)))
                         (EXIT
                          (COND
                           ((SPADCALL
                             (SPADCALL (|spadConstant| % 15)
                                       (SPADCALL 4 (QREFELT % 16))
                                       (QREFELT % 17))
                             |ns1| (QREFELT % 38))
                            (SEQ (SPADCALL (+ |prec| 15) (QREFELT % 39))
                                 (EXIT (|FSFUN;zeta_aux1| |s| |prec| %))))
                           (#2#
                            (SEQ
                             (LETT |lb|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ns1| (QREFELT % 28))
                                                (SPADCALL
                                                 (SPADCALL 2 (QREFELT % 16))
                                                 (QREFELT % 28))
                                                (QREFELT % 17))
                                      (QREFELT % 30))
                                     (QREFELT % 40))
                                    (QREFELT % 41)))
                             (EXIT
                              (COND
                               ((< |lb| (+ |prec| 5))
                                (SEQ (LETT |nprec| (+ (+ |prec| |lb|) 5))
                                     (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                                     (EXIT (|FSFUN;zeta_aux1| |s| |nprec| %))))
                               (#2#
                                (SEQ
                                 (LETT |nprec|
                                       (|quotient_INT| (+ (* 3 |prec|) 20) 2))
                                 (SPADCALL (+ |nprec| 15) (QREFELT % 39))
                                 (LETT |h|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 15)
                                                  (SPADCALL 2 (QREFELT % 16))
                                                  (QREFELT % 17))
                                        (|quotient_INT| (- (* 2 |prec|) 5) 3)
                                        (QREFELT % 92)))
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 15)
                                             (SPADCALL 2 (QREFELT % 16))
                                             (QREFELT % 17))
                                   (SPADCALL
                                    (|FSFUN;zeta_aux1|
                                     (SPADCALL |s|
                                               (SPADCALL |h| (QREFELT % 22))
                                               (QREFELT % 23))
                                     |nprec| %)
                                    (|FSFUN;zeta_aux1|
                                     (SPADCALL |s|
                                               (SPADCALL |h| (QREFELT % 22))
                                               (QREFELT % 24))
                                     |nprec| %)
                                    (QREFELT % 23))
                                   (QREFELT % 27))))))))))))))))))))) 

(SDEFUN |FSFUN;zeta_aux|
        ((|s| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|re_s| (|Float|)) (|s1| (|Complex| (|Float|))) (|ns| (|Float|))
          (|pi1| (|Float|)) (|lb| (|Integer|)) (|s2| (|Complex| (|Float|)))
          (|coef| (|Complex| (|Float|))))
         (SEQ (LETT |re_s| (SPADCALL |s| (QREFELT % 35)))
              (EXIT
               (COND
                ((SPADCALL |re_s|
                           (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 36))
                           (QREFELT % 83))
                 (|FSFUN;zeta_aux2| |s| |prec| %))
                (#1='T
                 (SEQ
                  (LETT |s1|
                        (SPADCALL (|spadConstant| % 7) |s| (QREFELT % 24)))
                  (EXIT
                   (COND
                    ((SPADCALL |s| (|spadConstant| % 42) (QREFELT % 43))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 15)
                                 (SPADCALL 2 (QREFELT % 16)) (QREFELT % 17))
                       (QREFELT % 22))
                      (QREFELT % 73)))
                    (#1#
                     (SEQ (LETT |ns| (SPADCALL |s| (QREFELT % 74)))
                          (LETT |pi1| (SPADCALL (QREFELT % 55)))
                          (LETT |lb|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |ns| (QREFELT % 28))
                                             (SPADCALL
                                              (SPADCALL 2 (QREFELT % 16))
                                              (QREFELT % 28))
                                             (QREFELT % 17))
                                   (QREFELT % 30))
                                  (QREFELT % 40))
                                 (QREFELT % 41)))
                          (EXIT
                           (COND
                            ((< (|quotient_INT| |prec| 2) (- |lb| 15))
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 15) 2
                                         (QREFELT % 36))
                               (QREFELT % 30))
                              (SPADCALL (|spadConstant| % 7)
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL (SPADCALL 2 (QREFELT % 16))
                                                    |pi1| (QREFELT % 21))
                                          (QREFELT % 28))
                                         |s| (QREFELT % 27))
                                        (QREFELT % 23))
                              (QREFELT % 27)))
                            (#1#
                             (SEQ
                              (LETT |s2|
                                    (SPADCALL (SPADCALL 2 (QREFELT % 11)) |s|
                                              (QREFELT % 88)))
                              (LETT |coef|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |pi1| (QREFELT % 22))
                                               (SPADCALL |s1| (QREFELT % 73))
                                               (QREFELT % 88))
                                     (SPADCALL |s2|
                                               (SPADCALL |s1| (QREFELT % 44))
                                               (QREFELT % 9))
                                     (QREFELT % 9)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (|spadConstant| % 15)
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          16))
                                                       (QREFELT % 17))
                                             |pi1| (QREFELT % 21))
                                            |s| (QREFELT % 27))
                                           (QREFELT % 45))
                                          (QREFELT % 9))
                                (|FSFUN;zeta_aux2| |s1| |prec| %)
                                (QREFELT % 9)))))))))))))))))) 

(SDEFUN |FSFUN;riemannZeta;2C;31|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((EQL (SPADCALL (QREFELT % 33)) 2)
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 34)))
                       (LETT |prec| (+ |obits| 5))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 39))
                              (EXIT (|FSFUN;zeta_aux| |z| |prec| %)))
                         (SPADCALL |obits| (QREFELT % 39))))))
                 ('T (|error| "riemannZeta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;riemannZeta;2F;32| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 57) (QREFELT % 58))
                   (QREFELT % 93))
         (QREFELT % 35))) 

(SDEFUN |FSFUN;lambert_via_newton1;4F;33|
        ((|x| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|ew| (|Float|)) (|dw| (|Float|)) (#1=#:G175 NIL) (|odw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 31)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 17))
                                            (QREFELT % 50))
                                  (SPADCALL |w| (|spadConstant| % 15)
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G174)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4F;34|
        ((|lz| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|lw| (|Float|)) (|dw| (|Float|)) (#1=#:G181 NIL) (|odw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 28)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 52))
                                            |lz| (QREFELT % 50))
                                  (SPADCALL (|spadConstant| % 15)
                                            (SPADCALL (|spadConstant| % 15) |w|
                                                      (QREFELT % 17))
                                            (QREFELT % 52))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 50)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G180)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 66)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3F;35|
        ((|h| (|Float|)) (|h2| (|Float|)) (% (|Float|)))
        (SPROG ((|h3| #1=(|Float|)) (|h4| #1#) (|res| (|Float|)))
               (SEQ
                (LETT |res|
                      (SPADCALL |h|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 97))
                                           (QREFELT % 20))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 97))
                                           (QREFELT % 20))
                                 |h3| (QREFELT % 21))
                                (QREFELT % 52)))
                (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 97))
                                           (QREFELT % 20))
                                 |h4| (QREFELT % 21))
                                (QREFELT % 50)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 97))
                                            (QREFELT % 20))
                                  |h3| (QREFELT % 21))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 52)))
                (EXIT
                 (SPADCALL |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 97))
                                       (QREFELT % 20))
                             |h4| (QREFELT % 21))
                            |h2| (QREFELT % 21))
                           (QREFELT % 50)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CFC;36|
        ((|x| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|ew| (|Complex| (|Float|))) (|dw| (|Complex| (|Float|)))
          (#1=#:G189 NIL) (|odw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 29)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 8))
                                            (QREFELT % 24))
                                  (SPADCALL |w| (|spadConstant| % 7)
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G188)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CFC;37|
        ((|lz| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|lw| (|Complex| (|Float|))) (|dw| (|Complex| (|Float|)))
          (#1=#:G195 NIL) (|odw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 25)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 23))
                                            |lz| (QREFELT % 24))
                                  (SPADCALL (|spadConstant| % 7)
                                            (SPADCALL (|spadConstant| % 7) |w|
                                                      (QREFELT % 8))
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 38))
                              (PROGN (LETT #1# |w|) (GO #2=#:G194)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 67)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;38|
        ((|h| (|Complex| (|Float|))) (|h2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|h3| #1=(|Complex| (|Float|))) (|h4| #1#)
          (|res| (|Complex| (|Float|))))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 97))
                                     (QREFELT % 101))
                           |h2| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 97))
                                     (QREFELT % 101))
                           |h3| (QREFELT % 9))
                          (QREFELT % 23)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 97))
                                     (QREFELT % 101))
                           |h4| (QREFELT % 9))
                          (QREFELT % 24)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 97))
                                      (QREFELT % 101))
                            |h3| (QREFELT % 9))
                           |h2| (QREFELT % 9))
                          (QREFELT % 23)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 97))
                                 (QREFELT % 101))
                       |h4| (QREFELT % 9))
                      |h2| (QREFELT % 9))
                     (QREFELT % 24)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4Df;39|
        ((|x| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|ew| (|DoubleFloat|)) (|dw| (|DoubleFloat|)) (#1=#:G203 NIL)
          (|odw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (|exp_DF| |w|))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| |w| (|div_DF| |x| |ew|))
                                           (|add_DF| |w| 1.0)))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G202)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4Df;40|
        ((|lz| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|lw| (|DoubleFloat|)) (|dw| (|DoubleFloat|)) (#1=#:G209 NIL)
          (|odw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 79)))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                           (|add_DF| 1.0 (|div_DF| 1.0 |w|))))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G208)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3Df;41|
        ((|h| (|DoubleFloat|)) (|h2| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|h3| #1=(|DoubleFloat|)) (|h4| #1#) (|res| (|DoubleFloat|)))
               (SEQ
                (LETT |res|
                      (|sub_DF| |h|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 97))
                                           (QREFELT % 105))
                                 |h2|)))
                (LETT |h3| (|mul_DF| |h| |h2|))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 97))
                                           (QREFELT % 105))
                                 |h3|)))
                (LETT |h4| (|mul_DF| |h2| |h2|))
                (LETT |res|
                      (|sub_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 97))
                                           (QREFELT % 105))
                                 |h4|)))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (|mul_DF|
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 97))
                                            (QREFELT % 105))
                                  |h3|)
                                 |h2|)))
                (EXIT
                 (|sub_DF| |res|
                           (|mul_DF|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 97))
                                       (QREFELT % 105))
                             |h4|)
                            |h2|)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CDfC;42|
        ((|x| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|ew| (|Complex| (|DoubleFloat|))) (|dw| (|Complex| (|DoubleFloat|)))
          (#1=#:G217 NIL) (|odw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 107)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 108))
                                            (QREFELT % 109))
                                  (SPADCALL |w| (|spadConstant| % 110)
                                            (QREFELT % 111))
                                  (QREFELT % 108)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 109)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G216)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 72)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CDfC;43|
        ((|lz| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|lw| (|Complex| (|DoubleFloat|))) (|dw| (|Complex| (|DoubleFloat|)))
          (#1=#:G223 NIL) (|odw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 113)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 111))
                                            |lz| (QREFELT % 109))
                                  (SPADCALL (|spadConstant| % 110)
                                            (SPADCALL (|spadConstant| % 110)
                                                      |w| (QREFELT % 108))
                                            (QREFELT % 111))
                                  (QREFELT % 108)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 109)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G222)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 72)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;44|
        ((|h| (|Complex| (|DoubleFloat|))) (|h2| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|h3| #1=(|Complex| (|DoubleFloat|))) (|h4| #1#)
          (|res| (|Complex| (|DoubleFloat|))))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 97))
                                     (QREFELT % 115))
                           |h2| (QREFELT % 116))
                          (QREFELT % 109)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 116)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 97))
                                     (QREFELT % 115))
                           |h3| (QREFELT % 116))
                          (QREFELT % 111)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 116)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 97))
                                     (QREFELT % 115))
                           |h4| (QREFELT % 116))
                          (QREFELT % 109)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 97))
                                      (QREFELT % 115))
                            |h3| (QREFELT % 116))
                           |h2| (QREFELT % 116))
                          (QREFELT % 111)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 97))
                                 (QREFELT % 115))
                       |h4| (QREFELT % 116))
                      |h2| (QREFELT % 116))
                     (QREFELT % 109)))))) 

(SDEFUN |FSFUN;lambertW;2Df;45| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|ox| (|Integer|)) (|lx| #1=(|DoubleFloat|)) (|y| #1#)
          (|w| (|DoubleFloat|)) (|e1| (|DoubleFloat|)) (|h2| (|DoubleFloat|))
          (|h| (|DoubleFloat|)) (|ax| (|DoubleFloat|)) (|eps| (|DoubleFloat|)))
         (SEQ
          (COND ((|eql_DF| |x| 0.0) |x|)
                (#2='T
                 (SEQ (LETT |eps| (SPADCALL 1 -35 (QREFELT % 118)))
                      (LETT |ox| (SPADCALL |x| (QREFELT % 119)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((> |ox| 200)
                                 (COND
                                  ((SPADCALL |x| 0.0 (QREFELT % 120))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT % 79)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT % 104)))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |x|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 120))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 79)))
                                        (EXIT
                                         (|sub_DF| |y|
                                                   (SPADCALL |y|
                                                             (QREFELT %
                                                                      79))))))
                                      (#2# (|mul_DF| (|div_DF_I| 1.0 2) |x|))))
                               (EXIT
                                (COND
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190436 517656
                                                         (QREFELT % 97))
                                               (QREFELT % 121))
                                              (QREFELT % 105)))
                                  (|error| "x < -exp(-1)"))
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 231087 628160
                                                         (QREFELT % 97))
                                               (QREFELT % 121))
                                              (QREFELT % 105)))
                                  (SEQ (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2| (|add_DF| |x| |e1|))
                                       (EXIT
                                        (COND
                                         ((|less_DF| |h2| 0.0)
                                          (|error| "x < -exp(-1)"))
                                         (#2#
                                          (SEQ
                                           (LETT |h2|
                                                 (|div_DF|
                                                  (SPADCALL 2 |h2|
                                                            (QREFELT % 122))
                                                  |e1|))
                                           (LETT |h|
                                                 (SPADCALL |h2|
                                                           (QREFELT % 123)))
                                           (EXIT
                                            (|sub_DF|
                                             (SPADCALL |h| |h2|
                                                       (QREFELT % 106))
                                             1.0))))))))
                                 (#2#
                                  (SEQ
                                   (COND
                                    ((|less_DF| (LETT |ax| (|abs_DF| |x|))
                                                (|div_DF_I| 1.0 2))
                                     (LETT |eps| (|mul_DF| |ax| |eps|))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT % 103))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;46|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|rx| (|DoubleFloat|)) (|ix| (|DoubleFloat|)) (|ax| (|DoubleFloat|))
          (|ox| (|Integer|)) (|lz| (|Complex| (|DoubleFloat|)))
          (|e1| (|DoubleFloat|)) (|h2| #1=(|Complex| (|DoubleFloat|)))
          (|h| (|Complex| (|DoubleFloat|))) (|y| (|Complex| (|DoubleFloat|)))
          (|w| #1#) (|eps| (|DoubleFloat|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 125) (QREFELT % 126)) |x|)
                (#2='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 127)))
                      (LETT |ix| (SPADCALL |x| (QREFELT % 128)))
                      (LETT |ax| (|add_DF| (|abs_DF| |rx|) (|abs_DF| |ix|)))
                      (LETT |eps| (SPADCALL 1 -35 (QREFELT % 118)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT % 119)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             ((> |ox| 200)
                              (SEQ
                               (LETT |lz|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ax| (QREFELT % 79))
                                                0.0 (QREFELT % 129))
                                      (SPADCALL
                                       (SPADCALL (|div_DF| |rx| |ax|)
                                                 (|div_DF| |ix| |ax|)
                                                 (QREFELT % 129))
                                       (QREFELT % 113))
                                      (QREFELT % 111)))
                               (EXIT
                                (SPADCALL |lz| |lz| |eps| (QREFELT % 114)))))
                             (#2#
                              (SEQ
                               (COND
                                ((|less_DF| (|abs_DF| |ix|)
                                            (SPADCALL
                                             (SPADCALL 1 4194304
                                                       (QREFELT % 97))
                                             (QREFELT % 105)))
                                 (COND
                                  ((|less_DF| |rx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 231087 628160
                                                          (QREFELT % 97))
                                                (QREFELT % 121))
                                               (QREFELT % 105)))
                                   (COND
                                    ((|less_DF|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 56258 152925 (QREFELT % 97))
                                        (QREFELT % 121))
                                       (QREFELT % 105))
                                      |rx|)
                                     (EXIT
                                      (SEQ
                                       (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2|
                                             (SPADCALL
                                              (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                        (QREFELT % 122))
                                              (SPADCALL |x|
                                                        (SPADCALL |e1| 0.0
                                                                  (QREFELT %
                                                                           129))
                                                        (QREFELT % 111))
                                              (QREFELT % 130)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT % 131)))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |h| |h2| (QREFELT % 117))
                                         (|spadConstant| % 110)
                                         (QREFELT % 109)))))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |ax|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 120))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 113)))
                                        (EXIT
                                         (SPADCALL |y|
                                                   (SPADCALL |y|
                                                             (QREFELT % 113))
                                                   (QREFELT % 109)))))
                                      (#2#
                                       (SPADCALL (|div_DF_I| 1.0 2) |x|
                                                 (QREFELT % 130)))))
                               (COND
                                ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                                 (LETT |eps| (|mul_DF| |ax| |eps|))))
                               (EXIT
                                (SPADCALL |x| |w| |eps|
                                          (QREFELT % 112))))))))))))) 

(SDEFUN |FSFUN;lambertW;2F;47| ((|x| (|Float|)) (% (|Float|)))
        (SPROG
         ((|cbit| (|PositiveInteger|)) (|ax| (|Float|)) (|ox| (|Integer|))
          (|lx| #1=(|Float|)) (|cbit2| (|NonNegativeInteger|)) (|e1| (|Float|))
          (|h2| (|Float|)) (|h| (|Float|)) (|w1| (|Float|)) (|y| #1#)
          (|w| (|Float|)) (|eps| (|Float|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |x| (|spadConstant| % 57) (QREFELT % 133)) |x|)
                  (#2='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (|quotient_INT| (* 2 |cbit|) 3))
                                        (QREFELT % 134)))
                        (LETT |ax| (SPADCALL |x| (QREFELT % 65)))
                        (LETT |ox| (SPADCALL |ax| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                               (#2#
                                (SEQ
                                 (COND
                                  ((> |ox| 200)
                                   (COND
                                    ((SPADCALL |x| (|spadConstant| % 57)
                                               (QREFELT % 48))
                                     (EXIT
                                      (SEQ
                                       (LETT |lx|
                                             (SPADCALL |x| (QREFELT % 28)))
                                       (EXIT
                                        (SPADCALL |lx| |lx| |eps|
                                                  (QREFELT % 96)))))))))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190436 517656
                                                          (QREFELT % 97))
                                                (QREFELT % 121))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (|error| "x < -exp(-1)"))
                                   ((SPADCALL |x|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190434 517656
                                                          (QREFELT % 97))
                                                (QREFELT % 121))
                                               (QREFELT % 20))
                                              (QREFELT % 38))
                                    (SEQ
                                     (LETT |cbit2| (|quotient_INT| |cbit| 2))
                                     (SPADCALL (+ |cbit| |cbit2|)
                                               (QREFELT % 39))
                                     (LETT |e1|
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 15)
                                                      (QREFELT % 30))
                                            (QREFELT % 31)))
                                     (LETT |h2|
                                           (SPADCALL |x| |e1| (QREFELT % 52)))
                                     (LETT |h| (SPADCALL |h2| (QREFELT % 75)))
                                     (SPADCALL |cbit| (QREFELT % 39))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |h2| (|spadConstant| % 57)
                                                  (QREFELT % 38))
                                        (|error| "x < -exp(-1)"))
                                       (#2#
                                        (SEQ
                                         (LETT |w1|
                                               (SPADCALL |h| |h2|
                                                         (QREFELT % 98)))
                                         (EXIT
                                          (COND
                                           ((< (SPADCALL |w1| (QREFELT % 49))
                                               (- |cbit2|))
                                            (SPADCALL |w1|
                                                      (|spadConstant| % 15)
                                                      (QREFELT % 50)))
                                           (#2#
                                            (SPADCALL |x|
                                                      (SPADCALL |w1|
                                                                (|spadConstant|
                                                                 % 15)
                                                                (QREFELT % 50))
                                                      |eps|
                                                      (QREFELT % 95)))))))))))
                                   (#2#
                                    (SEQ
                                     (LETT |w|
                                           (COND
                                            ((SPADCALL |x|
                                                       (SPADCALL 2
                                                                 (QREFELT %
                                                                          16))
                                                       (QREFELT % 48))
                                             (SEQ
                                              (LETT |y|
                                                    (SPADCALL |x|
                                                              (QREFELT % 28)))
                                              (EXIT
                                               (SPADCALL |y|
                                                         (SPADCALL |y|
                                                                   (QREFELT %
                                                                            28))
                                                         (QREFELT % 50)))))
                                            (#2#
                                             (SPADCALL
                                              (SPADCALL 5 -1 10
                                                        (QREFELT % 135))
                                              |x| (QREFELT % 21)))))
                                     (COND
                                      ((SPADCALL (SPADCALL |x| (QREFELT % 65))
                                                 (SPADCALL
                                                  (SPADCALL 1 2 (QREFELT % 97))
                                                  (QREFELT % 20))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |ax| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |x| |w| |eps|
                                                (QREFELT % 95)))))))))))))))
           (#2# (|error| "lambertW can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;lambertW;2C;48|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|cbit| (|PositiveInteger|)) (|abs_z| (|Float|)) (|oz| (|Integer|))
          (|lz| (|Complex| (|Float|))) (|rzd| (|DoubleFloat|))
          (|izd| (|DoubleFloat|)) (|wd| (|Complex| (|DoubleFloat|)))
          (|w| (|Complex| (|Float|))) (|eps| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|e1| (|Float|))
          (|h2| (|Complex| (|Float|))) (|h| (|Complex| (|Float|)))
          (|w1| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 33)) 2)
            (COND ((SPADCALL |z| (|spadConstant| % 42) (QREFELT % 43)) |z|)
                  (#1='T
                   (SEQ (LETT |cbit| (SPADCALL (QREFELT % 34)))
                        (LETT |eps|
                              (SPADCALL 1 (- (|quotient_INT| (* 2 |cbit|) 3))
                                        (QREFELT % 134)))
                        (LETT |abs_z| (SPADCALL |z| (QREFELT % 67)))
                        (LETT |oz| (SPADCALL |abs_z| (QREFELT % 49)))
                        (EXIT
                         (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                               ((> |oz| 200)
                                (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 25)))
                                     (EXIT
                                      (SPADCALL |lz| |lz| |eps|
                                                (QREFELT % 100)))))
                               (#1#
                                (SEQ
                                 (LETT |rzd|
                                       (SPADCALL (SPADCALL |z| (QREFELT % 35))
                                                 (QREFELT % 137)))
                                 (COND
                                  ((OR
                                    (SPADCALL (SPADCALL |z| (QREFELT % 54))
                                              (SPADCALL (|spadConstant| % 15)
                                                        1000000 (QREFELT % 36))
                                              (QREFELT % 48))
                                    (OR
                                     (|less_DF| |rzd|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL 190436 517656
                                                            (QREFELT % 97))
                                                  (QREFELT % 121))
                                                 (QREFELT % 105)))
                                     (SPADCALL |rzd|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL 190434 517656
                                                           (QREFELT % 97))
                                                 (QREFELT % 121))
                                                (QREFELT % 105))
                                               (QREFELT % 120))))
                                   (EXIT
                                    (SEQ
                                     (LETT |izd|
                                           (SPADCALL
                                            (SPADCALL |z| (QREFELT % 54))
                                            (QREFELT % 137)))
                                     (LETT |wd|
                                           (SPADCALL
                                            (SPADCALL |rzd| |izd|
                                                      (QREFELT % 129))
                                            (QREFELT % 132)))
                                     (LETT |w|
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 127))
                                             (QREFELT % 138))
                                            (SPADCALL
                                             (SPADCALL |wd| (QREFELT % 128))
                                             (QREFELT % 138))
                                            (QREFELT % 58)))
                                     (COND
                                      ((SPADCALL |abs_z|
                                                 (SPADCALL
                                                  (|spadConstant| % 15) 2
                                                  (QREFELT % 36))
                                                 (QREFELT % 38))
                                       (LETT |eps|
                                             (SPADCALL |abs_z| |eps|
                                                       (QREFELT % 21)))))
                                     (EXIT
                                      (SPADCALL |z| |w| |eps|
                                                (QREFELT % 99)))))))
                                 (LETT |cbit2| (|quotient_INT| |cbit| 2))
                                 (SPADCALL (+ |cbit| |cbit2|) (QREFELT % 39))
                                 (LETT |e1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 15)
                                                  (QREFELT % 30))
                                        (QREFELT % 31)))
                                 (LETT |h2|
                                       (SPADCALL |z|
                                                 (SPADCALL |e1|
                                                           (|spadConstant| %
                                                                           57)
                                                           (QREFELT % 58))
                                                 (QREFELT % 23)))
                                 (LETT |h| (SPADCALL |h2| (QREFELT % 139)))
                                 (SPADCALL |cbit| (QREFELT % 39))
                                 (LETT |w1|
                                       (SPADCALL |h| |h2| (QREFELT % 102)))
                                 (EXIT
                                  (COND
                                   ((<
                                     (SPADCALL (SPADCALL |h2| (QREFELT % 67))
                                               (QREFELT % 49))
                                     (- |cbit2|))
                                    (SPADCALL |w1| (|spadConstant| % 7)
                                              (QREFELT % 24)))
                                   (#1#
                                    (SPADCALL |z|
                                              (SPADCALL |w1|
                                                        (|spadConstant| % 7)
                                                        (QREFELT % 24))
                                              |eps| (QREFELT % 99)))))))))))))
           (#1# (|error| "lambertW can only handle base 2 Float-s")))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatSpecialFunctions|))
          (LETT % (GETREFV 141))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G270)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatSpecialFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatSpecialFunctions|
                             (LIST
                              (CONS NIL (CONS 1 (|FloatSpecialFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatSpecialFunctions|)))))))))) 

(MAKEPROP '|FloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 14) (0 . |1|) (4 . /) (10 . *)
              (|Integer|) (16 . |coerce|) (|Fraction| 10) (21 . |1|) (|Float|)
              (25 . |1|) (29 . |coerce|) (34 . /)
              (|IntegerNumberTheoryFunctions|) (40 . |bernoulli|)
              (45 . |coerce|) (50 . *) (56 . |coerce|) (61 . +) (67 . -)
              (73 . |log|) (78 . |pi|) (82 . *) (88 . |log|) (93 . |exp|)
              (98 . -) (103 . |exp|) (|PositiveInteger|) (108 . |base|)
              (112 . |bits|) (116 . |real|) (121 . /) (|Boolean|) (127 . <)
              (133 . |bits|) (138 . |round|) (143 . |retract|) (148 . |0|)
              (152 . =) |FSFUN;Gamma;2C;5| (158 . |sin|) (163 . |abs|)
              (168 . *) (174 . >) (180 . |order|) (185 . -) (191 . |log2|)
              (195 . +) (201 . |wholePart|) (206 . |imag|) (211 . |pi|)
              (215 . |imaginary|) (219 . |0|) (223 . |complex|)
              |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8| (229 . <=)
              |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10| |FSFUN;Beta;3F;11|
              (235 . |abs|) |FSFUN;rabs;2F;12| |FSFUN;rabs;CF;13|
              (|DoubleFloat|) |FSFUN;rabs;2Df;14| (|Complex| 68) (240 . |abs|)
              |FSFUN;rabs;CDf;15| (245 . -) (250 . |norm|) (255 . |sqrt|)
              (260 . |cos|) |FSFUN;digamma;2C;18| |FSFUN;digamma;2F;19|
              (265 . |log|) (270 . |convert|) (275 . |round|) (280 . |retract|)
              (285 . >=) |FSFUN;li2;2C;22| |FSFUN;li2;2F;23|
              |FSFUN;dilog;2C;25| |FSFUN;dilog;2F;26| (291 . ^)
              (|FloatLiouvilianFunctions|) (297 . |gamma|) (301 . *) (307 . ^)
              |FSFUN;riemannZeta;2C;31| |FSFUN;riemannZeta;2F;32|
              |FSFUN;lambert_via_newton1;4F;33|
              |FSFUN;lambert_via_newton2;4F;34| (313 . /)
              |FSFUN;lambert_inverse_series;3F;35|
              |FSFUN;lambert_via_newton1;2CFC;36|
              |FSFUN;lambert_via_newton2;2CFC;37| (319 . |coerce|)
              |FSFUN;lambert_inverse_series;3C;38|
              |FSFUN;lambert_via_newton1;4Df;39|
              |FSFUN;lambert_via_newton2;4Df;40| (324 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;41| (329 . |exp|) (334 . /)
              (340 . -) (346 . |1|) (350 . +)
              |FSFUN;lambert_via_newton1;2CDfC;42| (356 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;43| (361 . |coerce|) (366 . *)
              |FSFUN;lambert_inverse_series;3C;44| (372 . |float|)
              (378 . |order|) (383 . >) (389 . -) (394 . *) (400 . |sqrt|)
              |FSFUN;lambertW;2Df;45| (405 . |0|) (409 . =) (415 . |real|)
              (420 . |imag|) (425 . |complex|) (431 . *) (437 . |sqrt|)
              |FSFUN;lambertW;2C;46| (442 . =) (448 . |float|) (454 . |float|)
              |FSFUN;lambertW;2F;47| (461 . |coerce|) (466 . |convert|)
              (471 . |sqrt|) |FSFUN;lambertW;2C;48|)
           '#(|riemannZeta| 476 |rabs| 486 |logGamma| 506 |li2| 516
              |lambert_via_newton2| 526 |lambert_via_newton1| 554
              |lambert_inverse_series| 582 |lambertW| 606 |dilog| 626 |digamma|
              636 |Gamma| 646 |Beta| 656)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|logGamma| ((|Float|) (|Float|))) T)
                                   '((|logGamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Gamma| ((|Float|) (|Float|))) T)
                                   '((|Gamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|digamma| ((|Float|) (|Float|))) T)
                                   '((|digamma|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|Beta| ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|Beta|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW| ((|Float|) (|Float|))) T)
                                   '((|lambertW|
                                      ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambertW|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|dilog| ((|Float|) (|Float|))) T)
                                   '((|dilog|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|li2| ((|Float|) (|Float|))) T)
                                   '((|li2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|riemannZeta| ((|Float|) (|Float|))) T)
                                   '((|riemannZeta|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|Float|) (|Float|))) T)
                                   '((|rabs| ((|Float|) (|Complex| (|Float|))))
                                     T)
                                   '((|rabs| ((|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|rabs|
                                      ((|DoubleFloat|)
                                       (|Complex| (|DoubleFloat|))))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton1|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Float|) (|Float|) (|Float|)
                                       (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|) (|DoubleFloat|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|)) (|Float|)))
                                     T)
                                   '((|lambert_via_newton2|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Float|) (|Float|) (|Float|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|DoubleFloat|) (|DoubleFloat|)
                                       (|DoubleFloat|)))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|lambert_inverse_series|
                                      ((|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))
                                       (|Complex| (|DoubleFloat|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 140
                                            '(0 6 0 7 2 6 0 0 0 8 2 6 0 0 0 9 1
                                              6 0 10 11 0 12 0 13 0 14 0 15 1
                                              14 0 10 16 2 14 0 0 0 17 1 18 12
                                              10 19 1 14 0 12 20 2 14 0 0 0 21
                                              1 6 0 14 22 2 6 0 0 0 23 2 6 0 0
                                              0 24 1 6 0 0 25 0 6 0 26 2 6 0 14
                                              0 27 1 14 0 0 28 1 6 0 0 29 1 14
                                              0 0 30 1 14 0 0 31 0 14 32 33 0
                                              14 32 34 1 6 14 0 35 2 14 0 0 10
                                              36 2 14 37 0 0 38 1 14 32 32 39 1
                                              14 0 0 40 1 14 10 0 41 0 6 0 42 2
                                              6 37 0 0 43 1 6 0 0 45 1 6 14 0
                                              46 2 14 0 32 0 47 2 14 37 0 0 48
                                              1 14 10 0 49 2 14 0 0 0 50 0 14 0
                                              51 2 14 0 0 0 52 1 14 10 0 53 1 6
                                              14 0 54 0 14 0 55 0 6 0 56 0 14 0
                                              57 2 6 0 14 14 58 2 14 37 0 0 61
                                              1 14 0 0 65 1 70 68 0 71 1 6 0 0
                                              73 1 6 14 0 74 1 14 0 0 75 1 6 0
                                              0 76 1 68 0 0 79 1 14 68 0 80 1
                                              68 0 0 81 1 68 10 0 82 2 14 37 0
                                              0 83 2 6 0 0 0 88 0 89 6 90 2 6 0
                                              0 14 91 2 14 0 0 10 92 2 12 0 10
                                              10 97 1 6 0 12 101 1 68 0 12 105
                                              1 70 0 0 107 2 70 0 0 0 108 2 70
                                              0 0 0 109 0 70 0 110 2 70 0 0 0
                                              111 1 70 0 0 113 1 70 0 12 115 2
                                              70 0 0 0 116 2 68 0 10 10 118 1
                                              68 10 0 119 2 68 37 0 0 120 1 12
                                              0 0 121 2 68 0 32 0 122 1 68 0 0
                                              123 0 70 0 125 2 70 37 0 0 126 1
                                              70 68 0 127 1 70 68 0 128 2 70 0
                                              68 68 129 2 70 0 68 0 130 1 70 0
                                              0 131 2 14 37 0 0 133 2 14 0 10
                                              10 134 3 14 0 10 10 32 135 1 14
                                              68 0 137 1 14 0 68 138 1 6 0 0
                                              139 1 0 6 6 93 1 0 14 14 94 1 0
                                              68 70 72 1 0 14 6 67 1 0 68 68 69
                                              1 0 14 14 66 1 0 14 14 62 1 0 6 6
                                              59 1 0 6 6 84 1 0 14 14 85 3 0 70
                                              70 70 68 114 3 0 68 68 68 68 104
                                              3 0 6 6 6 14 100 3 0 14 14 14 14
                                              96 3 0 70 70 70 68 112 3 0 68 68
                                              68 68 103 3 0 6 6 6 14 99 3 0 14
                                              14 14 14 95 2 0 6 6 6 102 2 0 70
                                              70 70 117 2 0 68 68 68 106 2 0 14
                                              14 14 98 1 0 6 6 140 1 0 70 70
                                              132 1 0 14 14 136 1 0 68 68 124 1
                                              0 14 14 87 1 0 6 6 86 1 0 14 14
                                              78 1 0 6 6 77 1 0 14 14 60 1 0 6
                                              6 44 2 0 14 14 14 64 2 0 6 6 6
                                              63)))))
           '|lookupComplete|)) 
