
(SDEFUN |FSFUN;bernoulli_gamma_series|
        ((|z| (|Complex| (|Float|))) (|n| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|s| #1=(|Complex| (|Float|))) (|bk| (|Float|)) (|kinv| (|Float|))
          (|zk| #2=(|Complex| (|Float|))) (#3=#:G487 NIL) (|k| NIL)
          (|z2inv| #1#) (|zinv| #2#))
         (SEQ (LETT |zinv| (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 8)))
              (LETT |zk| |zinv|)
              (LETT |z2inv| (SPADCALL |zinv| |zinv| (QREFELT % 9)))
              (LETT |s|
                    (SPADCALL |zk|
                              (SPADCALL (SPADCALL 1 12 (QREFELT % 12))
                                        (QREFELT % 13))
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
                     (SPADCALL (SPADCALL 1 2 (QREFELT % 12)) (QREFELT % 13))
                     (QREFELT % 25))
           (SPADCALL |z| (QREFELT % 26)) (QREFELT % 9))
          |z| (QREFELT % 25))
         (SPADCALL (SPADCALL (SPADCALL 1 2 (QREFELT % 12)) (QREFELT % 13))
                   (SPADCALL
                    (SPADCALL (SPADCALL 2 (QREFELT % 16))
                              (SPADCALL (QREFELT % 27)) (QREFELT % 28))
                    (QREFELT % 26))
                   (QREFELT % 9))
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
         ((|s| #1=(|Complex| (|Float|))) (|tk| #1#) (#2=#:G496 NIL) (|k| NIL))
         (SEQ
          (LETT |tk|
                (SPADCALL
                 (SPADCALL
                  (SPADCALL |z|
                            (SPADCALL (SPADCALL |l| (QREFELT % 29))
                                      (QREFELT % 22))
                            (QREFELT % 9))
                  (QREFELT % 30))
                 |z| (QREFELT % 8)))
          (LETT |s| |tk|)
          (SEQ (LETT |k| 1) (LETT #2# |n|) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (LETT |tk|
                      (SPADCALL
                       (SPADCALL |tk| (SPADCALL |l| (QREFELT % 22))
                                 (QREFELT % 9))
                       (SPADCALL |z| (SPADCALL |k| (QREFELT % 31))
                                 (QREFELT % 23))
                       (QREFELT % 8)))
                (EXIT (LETT |s| (SPADCALL |s| |tk| (QREFELT % 23)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL |s|
                     (SPADCALL
                      (SPADCALL (SPADCALL |l| (QREFELT % 32)) (QREFELT % 33))
                      (QREFELT % 22))
                     (QREFELT % 9)))))) 

(SDEFUN |FSFUN;Gamma;2C;5|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#1=#:G507 NIL) (|llog| (|PositiveInteger|)) (#2=#:G505 NIL)
          (#3=#:G503 NIL) (|l1a| (|Integer|)) (|len| (|Float|))
          (|loss| (|Float|)) (|lz| (|PositiveInteger|)) (#4=#:G502 NIL)
          (|oz| (|PositiveInteger|)) (#5=#:G501 NIL) (|abs_z| #6=(|Float|))
          (|one| (|Complex| (|Float|))) (|c_pi| (|Complex| (|Float|)))
          (|sign| (|Float|)) (|z1| (|Complex| (|Float|))) (|re_zint| (|Float|))
          (|re_z| #6#) (|l| (|PositiveInteger|)) (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 35)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 36)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 37)))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 38))
                              (QREFELT % 40))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 41))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 42)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 25)))
                         (LETT |sign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 43)))
                                 (SPADCALL (|spadConstant| % 15)
                                           (QREFELT % 32)))
                                (#7='T (|spadConstant| % 15))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 44)
                                      (QREFELT % 45))
                            (SEQ (SPADCALL |l0| (QREFELT % 41))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#7#
                            (SEQ (LETT |c_pi| (SPADCALL (QREFELT % 27)))
                                 (LETT |one| (|spadConstant| % 7))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL |sign| |c_pi| (QREFELT % 28))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 25))
                                          (QREFELT % 46))
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 47))
                                         (QREFELT % 9))
                                        (QREFELT % 8)))
                                 (SPADCALL |l0| (QREFELT % 41))
                                 (EXIT |result|)))))))
                   (#7#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 48))
                                     (QREFELT % 37)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 49))
                                  (QREFELT % 50))
                        (SEQ
                         (LETT |oz|
                               (PROG1
                                   (LETT #5#
                                         (MAX (SPADCALL |abs_z| (QREFELT % 51))
                                              5))
                                 (|check_subtype2| (> #5# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #5#)))
                         (LETT |lz|
                               (PROG1 (LETT #4# (INTEGER-LENGTH |oz|))
                                 (|check_subtype2| (> #4# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #4#)))
                         (SPADCALL (+ (+ |oz| |lz|) 30) (QREFELT % 41))
                         (LETT |loss|
                               (SPADCALL
                                (SPADCALL
                                 (|FSFUN;logGamma_a1|
                                  (SPADCALL (SPADCALL |z| (QREFELT % 37))
                                            (QREFELT % 22))
                                  %)
                                 (QREFELT % 37))
                                (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                          (QREFELT % 37))
                                (QREFELT % 52)))
                         (LETT |len|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |z| (QREFELT % 37))
                                           (QREFELT % 49))
                                 (SPADCALL 2
                                           (SPADCALL |loss|
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 53))
                                                      (SPADCALL |l|
                                                                (QREFELT % 16))
                                                      (QREFELT % 21))
                                                     (QREFELT % 54))
                                           (QREFELT % 49))
                                 (QREFELT % 54))
                                (SPADCALL 3 (QREFELT % 16)) (QREFELT % 54)))
                         (LETT |l1a|
                               (+
                                (+ (+ |l| (SPADCALL |len| (QREFELT % 51)))
                                   (SPADCALL
                                    (SPADCALL |loss| (SPADCALL (QREFELT % 53))
                                              (QREFELT % 17))
                                    (QREFELT % 55)))
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
                                                                     (QREFELT %
                                                                              29))
                                                           (QREFELT % 21))
                                                 (SPADCALL (QREFELT % 53))
                                                 (QREFELT % 17))
                                                (QREFELT % 55))
                                               10)))
                                 (|check_subtype2| (> #3# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #3#)))
                         (SPADCALL |l1| (QREFELT % 41))
                         (LETT |result|
                               (|FSFUN;gamma_series| |z| |len|
                                (+ (* 3 (SPADCALL |len| (QREFELT % 55))) 6) %))
                         (SPADCALL |l0| (QREFELT % 41)) (EXIT |result|)))
                       (#7#
                        (SEQ
                         (LETT |llog|
                               (PROG1
                                   (LETT #2#
                                         (MAX
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL
                                             (|FSFUN;logGamma_a1| |z| %)
                                             (QREFELT % 48))
                                            (QREFELT % 37))
                                           (QREFELT % 51))
                                          5))
                                 (|check_subtype2| (> #2# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #2#)))
                         (LETT |l1|
                               (+
                                (+ (+ |l| |llog|)
                                   (PROG1 (LETT #1# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 41))
                         (LETT |result|
                               (SPADCALL
                                (|FSFUN;logGamma_asymptotic| |z|
                                 (+ (QUOTIENT2 |l| 6) 1) %)
                                (QREFELT % 30)))
                         (SPADCALL |l0| (QREFELT % 41))
                         (EXIT |result|)))))))))))
           (#7# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;logGamma_lift|
        ((|z| (|Complex| (|Float|))) (|lg2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|k| (|Float|)) (|lg2i| (|Float|)))
               (SEQ (LETT |lg2i| (SPADCALL |lg2| (QREFELT % 56)))
                    (LETT |k|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|FSFUN;logGamma_a1| |z| %)
                                       (QREFELT % 56))
                             |lg2i| (QREFELT % 52))
                            (SPADCALL 2 (SPADCALL (QREFELT % 57))
                                      (QREFELT % 49))
                            (QREFELT % 17))
                           (QREFELT % 42)))
                    (EXIT
                     (SPADCALL |lg2|
                               (SPADCALL (SPADCALL (QREFELT % 58))
                                         (SPADCALL
                                          (SPADCALL |k|
                                                    (SPADCALL 2 (QREFELT % 16))
                                                    (QREFELT % 21))
                                          (SPADCALL (QREFELT % 27))
                                          (QREFELT % 28))
                                         (QREFELT % 9))
                               (QREFELT % 23)))))) 

(SDEFUN |FSFUN;logGamma;2C;7|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|result| #1=(|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (#2=#:G522 NIL) (|l| (|PositiveInteger|)) (|abs_z| #3=(|Float|))
          (|c_pi| (|Complex| (|Float|))) (|lsign| (|Float|)) (|z1| #1#)
          (|re_zint| (|Float|)) (|one| (|Complex| (|Float|))) (|re_z| #3#)
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 35)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 36)))
                 (LETT |l| (MAX (+ |l0| 5) 20))
                 (LETT |re_z| (SPADCALL |z| (QREFELT % 37)))
                 (LETT |one| (|spadConstant| % 7))
                 (EXIT
                  (COND
                   ((SPADCALL |re_z|
                              (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 38))
                              (QREFELT % 40))
                    (SEQ (SPADCALL (+ |l| 5) (QREFELT % 41))
                         (LETT |re_zint| (SPADCALL |re_z| (QREFELT % 42)))
                         (LETT |z1|
                               (SPADCALL |z|
                                         (SPADCALL |re_zint| (QREFELT % 22))
                                         (QREFELT % 25)))
                         (LETT |lsign|
                               (COND
                                ((ODDP (SPADCALL |re_zint| (QREFELT % 43)))
                                 (|spadConstant| % 15))
                                (#4='T (|spadConstant| % 59))))
                         (EXIT
                          (COND
                           ((SPADCALL |z1| (|spadConstant| % 44)
                                      (QREFELT % 45))
                            (SEQ (SPADCALL |l0| (QREFELT % 41))
                                 (EXIT (|error| "Pole of Gamma"))))
                           (#4#
                            (SEQ (SPADCALL (+ |l| 5) (QREFELT % 41))
                                 (LETT |c_pi| (SPADCALL (QREFELT % 27)))
                                 (LETT |result|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| (QREFELT % 26))
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| % 59)
                                                     |lsign| (QREFELT % 60))
                                           |c_pi| (QREFELT % 9))
                                          (QREFELT % 23))
                                         (SPADCALL
                                          (SPADCALL |one| |z| (QREFELT % 25))
                                          (QREFELT % 61))
                                         (QREFELT % 25))
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |c_pi| |z1| (QREFELT % 9))
                                          (QREFELT % 47))
                                         (QREFELT % 26))
                                        (QREFELT % 25)))
                                 (LETT |result|
                                       (|FSFUN;logGamma_lift| |z| |result| %))
                                 (SPADCALL |l0| (QREFELT % 41))
                                 (EXIT |result|)))))))
                   (#4#
                    (SEQ
                     (LETT |abs_z|
                           (SPADCALL (SPADCALL |z| (QREFELT % 48))
                                     (QREFELT % 37)))
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                                  (SPADCALL 6 |abs_z| (QREFELT % 49))
                                  (QREFELT % 50))
                        (SEQ (LETT |l| (+ |l| 5))
                             (COND
                              ((OR
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |z| |one| (QREFELT % 25))
                                            (QREFELT % 48))
                                  (QREFELT % 37))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 38))
                                 (QREFELT % 40))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |z| |one| (QREFELT % 25)) |one|
                                    (QREFELT % 25))
                                   (QREFELT % 48))
                                  (QREFELT % 37))
                                 (SPADCALL (|spadConstant| % 15) 4
                                           (QREFELT % 38))
                                 (QREFELT % 40)))
                               (LETT |l| (* 2 |l|))))
                             (SPADCALL |l| (QREFELT % 41))
                             (LETT |result|
                                   (|FSFUN;logGamma_lift| |z|
                                    (SPADCALL (SPADCALL |z| (QREFELT % 46))
                                              (QREFELT % 26))
                                    %))
                             (SPADCALL |l0| (QREFELT % 41)) (EXIT |result|)))
                       (#4#
                        (SEQ
                         (LETT |l1|
                               (+
                                (+ |l|
                                   (PROG1 (LETT #2# (INTEGER-LENGTH |l|))
                                     (|check_subtype2| (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#)))
                                12))
                         (SPADCALL |l1| (QREFELT % 41))
                         (LETT |result|
                               (|FSFUN;logGamma_asymptotic| |z|
                                (+ (QUOTIENT2 |l| 6) 1) %))
                         (SPADCALL |l0| (QREFELT % 41))
                         (EXIT |result|)))))))))))
           (#4# (|error| "Gamma can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Gamma;2F;8| ((|x| (|Float|)) (% (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 46))
                  (QREFELT % 37))) 

(SDEFUN |FSFUN;logGamma;2F;9| ((|x| (|Float|)) (% (|Float|)))
        (COND
         ((SPADCALL |x| (|spadConstant| % 59) (QREFELT % 63))
          (|error| "Argument to logGamma <= 0"))
         ('T
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 22)) (QREFELT % 61))
                    (QREFELT % 37))))) 

(SDEFUN |FSFUN;Beta;3C;10|
        ((|x| (|Complex| (|Float|))) (|y| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|l1| (|PositiveInteger|))
          (|l0| (|PositiveInteger|)))
         (SEQ
          (COND
           ((EQL (SPADCALL (QREFELT % 35)) 2)
            (SEQ (LETT |l0| (SPADCALL (QREFELT % 36)))
                 (LETT |l1| (MAX 30 (+ |l0| 10)))
                 (SPADCALL |l1| (QREFELT % 41))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL |x| (QREFELT % 46))
                                  (SPADCALL |y| (QREFELT % 46)) (QREFELT % 9))
                        (SPADCALL (SPADCALL |x| |y| (QREFELT % 23))
                                  (QREFELT % 46))
                        (QREFELT % 8)))
                 (SPADCALL |l0| (QREFELT % 41)) (EXIT |res|)))
           ('T (|error| "Beta can only handle base 2 Float-s")))))) 

(SDEFUN |FSFUN;Beta;3F;11| ((|x| (|Float|)) (|y| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 22)) (SPADCALL |y| (QREFELT % 22))
                   (QREFELT % 65))
         (QREFELT % 37))) 

(SDEFUN |FSFUN;rabs;2F;12| ((|r| (|Float|)) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 67))) 

(SDEFUN |FSFUN;rabs;CF;13| ((|r| (|Complex| (|Float|))) (% (|Float|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 48)) (QREFELT % 37))) 

(PUT '|FSFUN;rabs;2Df;14| '|SPADreplace| '|abs_DF|) 

(SDEFUN |FSFUN;rabs;2Df;14| ((|r| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (|abs_DF| |r|)) 

(SDEFUN |FSFUN;rabs;CDf;15|
        ((|r| (|Complex| (|DoubleFloat|))) (% (|DoubleFloat|)))
        (SPADCALL (SPADCALL |r| (QREFELT % 73)) (QREFELT % 74))) 

(SDEFUN |FSFUN;digamma_euler_maclaurin|
        ((|a| (|Complex| (|Float|))) (|n| (|Integer|)) (|m| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|bk| (|Float|))
          (|ns1| (|Complex| (|Float|))) (|kfac| (|Float|)) (#1=#:G545 NIL)
          (|k| NIL) (|n2_inv| #2=(|Complex| (|Float|))) (|ns| #2#)
          (|na| (|Complex| (|Float|))) (|n1| (|Integer|)) (|ck| #2#)
          (#3=#:G544 NIL))
         (SEQ (LETT |res| (|spadConstant| % 44))
              (SEQ (LETT |k| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (LETT |ck|
                          (SPADCALL (|spadConstant| % 7)
                                    (SPADCALL (SPADCALL |k| (QREFELT % 31)) |a|
                                              (QREFELT % 23))
                                    (QREFELT % 8)))
                    (EXIT (LETT |res| (SPADCALL |res| |ck| (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |n1| (+ |n| 1))
              (LETT |na|
                    (SPADCALL (SPADCALL |n1| (QREFELT % 31)) |a|
                              (QREFELT % 23)))
              (LETT |ns| (SPADCALL (|spadConstant| % 7) |na| (QREFELT % 8)))
              (LETT |ns1| (|spadConstant| % 7))
              (LETT |res|
                    (SPADCALL
                     (SPADCALL |res|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 15) 2
                                          (QREFELT % 38))
                                |ns| (QREFELT % 28))
                               (QREFELT % 23))
                     (SPADCALL |na| (QREFELT % 26)) (QREFELT % 25)))
              (LETT |n2_inv|
                    (SPADCALL (|spadConstant| % 7)
                              (SPADCALL |na| |na| (QREFELT % 9))
                              (QREFELT % 8)))
              (SEQ (LETT |k| 1) (LETT #1# |m|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
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
                                          |ns1| (QREFELT % 28))
                                         (QREFELT % 23)))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 76)))))) 

(SDEFUN |FSFUN;digamma_aux|
        ((|a| (|Complex| (|Float|))) (|l| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG ((|abs_a| (|Float|)))
               (SEQ
                (LETT |abs_a|
                      (SPADCALL (SPADCALL |a| (QREFELT % 77)) (QREFELT % 78)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |l| (QREFELT % 16))
                             (SPADCALL 6 |abs_a| (QREFELT % 49))
                             (QREFELT % 50))
                   (|FSFUN;digamma_euler_maclaurin| |a| (+ (QUOTIENT2 |l| 6) 1)
                    (+ (QUOTIENT2 |l| 6) 1) %))
                  ('T
                   (|FSFUN;digamma_euler_maclaurin| |a| -1
                    (+ (QUOTIENT2 |l| 6) 1) %))))))) 

(SDEFUN |FSFUN;digamma;2C;18|
        ((|a| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|ap| (|Complex| (|Float|))) (|r_pi| (|Float|))
          (|a1| (|Complex| (|Float|))) (|re_aint| (|Float|))
          (|l| (|PositiveInteger|)) (|re_a| (|Float|))
          (|l0| (|PositiveInteger|)))
         (SEQ (LETT |l0| (SPADCALL (QREFELT % 36)))
              (LETT |l| (MAX (+ |l0| 10) 61))
              (EXIT
               (|finally|
                (SEQ (LETT |re_a| (SPADCALL |a| (QREFELT % 37)))
                     (EXIT
                      (COND
                       ((SPADCALL |re_a|
                                  (SPADCALL (|spadConstant| % 15) 2
                                            (QREFELT % 38))
                                  (QREFELT % 40))
                        (SEQ (LETT |l| (+ |l| 5))
                             (SPADCALL
                              (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                              (QREFELT % 41))
                             (LETT |re_aint| (SPADCALL |re_a| (QREFELT % 42)))
                             (LETT |a1|
                                   (SPADCALL |a|
                                             (SPADCALL |re_aint|
                                                       (|spadConstant| % 59)
                                                       (QREFELT % 60))
                                             (QREFELT % 25)))
                             (EXIT
                              (COND
                               ((SPADCALL |a1| (|spadConstant| % 44)
                                          (QREFELT % 45))
                                (|error| "Pole of Gamma"))
                               (#1='T
                                (SEQ (LETT |r_pi| (SPADCALL (QREFELT % 57)))
                                     (LETT |ap|
                                           (SPADCALL |r_pi| |a1|
                                                     (QREFELT % 28)))
                                     (EXIT
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |r_pi|
                                                   (SPADCALL |ap|
                                                             (QREFELT % 79))
                                                   (QREFELT % 28))
                                         (SPADCALL |ap| (QREFELT % 47))
                                         (QREFELT % 8))
                                        (QREFELT % 76))
                                       (|FSFUN;digamma_aux|
                                        (SPADCALL (|spadConstant| % 7) |a|
                                                  (QREFELT % 25))
                                        |l| %)
                                       (QREFELT % 23)))))))))
                       (#1#
                        (SEQ
                         (SPADCALL (+ (+ |l| (* 3 (INTEGER-LENGTH |l|))) 10)
                                   (QREFELT % 41))
                         (EXIT (|FSFUN;digamma_aux| |a| |l| %)))))))
                (SPADCALL |l0| (QREFELT % 41))))))) 

(SDEFUN |FSFUN;digamma;2F;19| ((|z| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |z| (|spadConstant| % 59) (QREFELT % 60))
                   (QREFELT % 80))
         (QREFELT % 37))) 

(SDEFUN |FSFUN;li2_series|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|ck| (|Float|)) (|k2| (|Integer|))
          (|k| (|Integer|)) (#1=#:G561 NIL) (|i| NIL) (|n| (|Integer|))
          (|oz| (|Integer|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 77)))
              (LETT |oz| (SPADCALL |nz| (QREFELT % 51)))
              (LETT |n|
                    (COND
                     ((< |oz| -200)
                      (+ (QUOTIENT2 (* 2 |prec|) (- (- |oz|) 1)) 1))
                     ('T
                      (+
                       (SPADCALL
                        (SPADCALL
                         (|mul_DF|
                          (FLOAT (* 2 |prec|) MOST-POSITIVE-DOUBLE-FLOAT)
                          (|minus_DF|
                           (|div_DF|
                            (SPADCALL (FLOAT 2 MOST-POSITIVE-DOUBLE-FLOAT)
                                      (QREFELT % 82))
                            (SPADCALL (SPADCALL |nz| (QREFELT % 83))
                                      (QREFELT % 82)))))
                         (QREFELT % 84))
                        (QREFELT % 85))
                       1))))
              (LETT |res| (|spadConstant| % 44))
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
                                                                             59)
                                                             (QREFELT % 60))
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
         ((|lz1| #1=(|Complex| (|Float|))) (|nz1| #2=(|Float|)) (|lz| #1#)
          (|lmz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|))
          (|z1| (|Complex| (|Float|))) (|nz| #2#) (|dd| #2#)
          (|w| (|Complex| (|Float|))) (|siz| (|Float|)) (|iz| (|Float|))
          (|rz| (|Float|)))
         (SEQ (LETT |rz| (SPADCALL |z| (QREFELT % 37)))
              (LETT |iz| (SPADCALL |z| (QREFELT % 56)))
              (LETT |siz|
                    (COND
                     ((SPADCALL |iz| (|spadConstant| % 59) (QREFELT % 50))
                      (|spadConstant| % 15))
                     (#3='T (SPADCALL (|spadConstant| % 15) (QREFELT % 32)))))
              (LETT |w|
                    (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 38))
                              (SPADCALL
                               (SPADCALL |siz|
                                         (SPADCALL (|spadConstant| % 15) 2
                                                   (QREFELT % 38))
                                         (QREFELT % 21))
                               (SPADCALL (SPADCALL 3 (QREFELT % 16))
                                         (QREFELT % 78))
                               (QREFELT % 21))
                              (QREFELT % 60)))
              (LETT |dd|
                    (SPADCALL (SPADCALL |z| |w| (QREFELT % 25))
                              (QREFELT % 77)))
              (EXIT
               (COND
                ((SPADCALL |dd|
                           (SPADCALL (|spadConstant| % 15) 8 (QREFELT % 38))
                           (QREFELT % 40))
                 (SPADCALL
                  (SPADCALL (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 38))
                            (|FSFUN;li2_aux| (SPADCALL |z| |z| (QREFELT % 9))
                             (+ |prec| 2) %)
                            (QREFELT % 28))
                  (|FSFUN;li2_aux| (SPADCALL |z| (QREFELT % 76)) (+ |prec| 2)
                   %)
                  (QREFELT % 25)))
                (#3#
                 (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 77)))
                      (LETT |z1|
                            (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 25)))
                      (LETT |rpi| (SPADCALL (QREFELT % 57)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 38))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |rz|
                                   (SPADCALL (|spadConstant| % 15) 2
                                             (QREFELT % 38))
                                   (QREFELT % 50))
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 77)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 86))
                                 (SEQ
                                  (LETT |lmz|
                                        (SPADCALL (SPADCALL |z| (QREFELT % 76))
                                                  (QREFELT % 26)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |pi_fac| (QREFELT % 22))
                                      (QREFELT % 76))
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 38))
                                       |lmz| (QREFELT % 28))
                                      |lmz| (QREFELT % 9))
                                     (QREFELT % 25))
                                    (|FSFUN;li2_series|
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 8))
                                     |prec| %)
                                    (QREFELT % 25)))))
                                (#3#
                                 (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 26)))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |z1| (|spadConstant| % 44)
                                                   (QREFELT % 45))
                                         (SPADCALL |pi_fac| (QREFELT % 22)))
                                        (#3#
                                         (SEQ
                                          (LETT |lz1|
                                                (SPADCALL |z1| (QREFELT % 26)))
                                          (EXIT
                                           (COND
                                            ((SPADCALL |nz|
                                                       (|spadConstant| % 15)
                                                       (QREFELT % 86))
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
                                                            2 (QREFELT % 38))
                                                           |lz| (QREFELT % 28))
                                                          |lz1| (QREFELT % 25))
                                                         (QREFELT % 9))
                                               (QREFELT % 23))
                                              (|FSFUN;li2_series|
                                               (SPADCALL
                                                (SPADCALL |z1| |z|
                                                          (QREFELT % 8))
                                                (QREFELT % 76))
                                               |prec| %)
                                              (QREFELT % 23)))
                                            (#3#
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |pi_fac|
                                                         (QREFELT % 22))
                                               (SPADCALL |lz| |lz1|
                                                         (QREFELT % 9))
                                               (QREFELT % 25))
                                              (|FSFUN;li2_series| |z1| |prec|
                                               %)
                                              (QREFELT % 25)))))))))))))))
                        ((SPADCALL |nz| (|spadConstant| % 15) (QREFELT % 86))
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |pi_fac| (QREFELT % 22))
                                     (QREFELT % 76))
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 15) 2 (QREFELT % 38))
                             (SPADCALL |z1| (QREFELT % 26)) (QREFELT % 28))
                            (SPADCALL
                             (SPADCALL |z1| (SPADCALL |z| |z| (QREFELT % 9))
                                       (QREFELT % 8))
                             (QREFELT % 26))
                            (QREFELT % 9))
                           (QREFELT % 23))
                          (|FSFUN;li2_series|
                           (SPADCALL (|spadConstant| % 7) |z1| (QREFELT % 8))
                           |prec| %)
                          (QREFELT % 23)))
                        (#3#
                         (SEQ (LETT |nz1| (SPADCALL |z1| (QREFELT % 77)))
                              (EXIT
                               (COND
                                ((SPADCALL |nz1| (|spadConstant| % 15)
                                           (QREFELT % 86))
                                 (SEQ
                                  (LETT |lz1| (SPADCALL |z1| (QREFELT % 26)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 15) 2
                                                 (QREFELT % 38))
                                       |lz1| (QREFELT % 28))
                                      |lz1| (QREFELT % 9))
                                     (QREFELT % 76))
                                    (|FSFUN;li2_series|
                                     (SPADCALL
                                      (SPADCALL |z| |z1| (QREFELT % 8))
                                      (QREFELT % 76))
                                     |prec| %)
                                    (QREFELT % 25)))))
                                (#3#
                                 (|FSFUN;li2_series| |z| |prec| %))))))))))))))) 

(SDEFUN |FSFUN;li2;2C;22|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 36)))
                    (LETT |prec| (+ |obits| 5))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 41))
                           (EXIT (|FSFUN;li2_aux| |z| |prec| %)))
                      (SPADCALL |obits| (QREFELT % 41))))))) 

(SDEFUN |FSFUN;dilog_aux|
        ((|z| (|Complex| (|Float|))) (|prec| (|Integer|))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|lz1| #1=(|Complex| (|Float|)))
          (|lz| #1#) (|pi_fac| (|Float|)) (|rpi| (|Float|)) (|nz| (|Float|)))
         (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 77)))
              (EXIT
               (COND
                ((SPADCALL |nz|
                           (SPADCALL (|spadConstant| % 15) 4 (QREFELT % 38))
                           (QREFELT % 40))
                 (SEQ (LETT |rpi| (SPADCALL (QREFELT % 57)))
                      (LETT |pi_fac|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 15) 6 (QREFELT % 38))
                              |rpi| (QREFELT % 21))
                             |rpi| (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((SPADCALL |z| (|spadConstant| % 44) (QREFELT % 45))
                         (SPADCALL |pi_fac| (QREFELT % 22)))
                        (#2='T
                         (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 26)))
                              (LETT |lz1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 7) |z|
                                               (QREFELT % 25))
                                     (QREFELT % 26)))
                              (EXIT
                               (LETT |res|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |pi_fac| (QREFELT % 22))
                                       (SPADCALL |lz| |lz1| (QREFELT % 9))
                                       (QREFELT % 25))
                                      (|FSFUN;li2_series| |z| |prec| %)
                                      (QREFELT % 25))))))))))
                (#2#
                 (|FSFUN;li2_aux|
                  (SPADCALL (|spadConstant| % 7) |z| (QREFELT % 25)) |prec|
                  %))))))) 

(SDEFUN |FSFUN;dilog;2C;24|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|prec| (|PositiveInteger|)) (|obits| (|PositiveInteger|)))
               (SEQ (LETT |obits| (SPADCALL (QREFELT % 36)))
                    (LETT |prec| (+ |obits| 5))
                    (EXIT
                     (|finally|
                      (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 41))
                           (EXIT (|FSFUN;dilog_aux| |z| |prec| %)))
                      (SPADCALL |obits| (QREFELT % 41))))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4F;25|
        ((|x| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G586 NIL) (|dw| (|Float|)) (|ew| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 33)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 17))
                                            (QREFELT % 52))
                                  (SPADCALL |w| (|spadConstant| % 15)
                                            (QREFELT % 54))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 52)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 40))
                              (PROGN (LETT #1# |w|) (GO #2=#:G585)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 68)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4F;26|
        ((|lz| (|Float|)) (|w| (|Float|)) (|eps| (|Float|)) (% (|Float|)))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G592 NIL) (|dw| (|Float|)) (|lw| (|Float|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 29)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 54))
                                            |lz| (QREFELT % 52))
                                  (SPADCALL (|spadConstant| % 15)
                                            (SPADCALL (|spadConstant| % 15) |w|
                                                      (QREFELT % 17))
                                            (QREFELT % 54))
                                  (QREFELT % 17)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 52)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 40))
                              (PROGN (LETT #1# |w|) (GO #2=#:G591)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 68)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3F;27|
        ((|h| (|Float|)) (|h2| (|Float|)) (% (|Float|)))
        (SPROG ((|res| (|Float|)) (|h4| #1=(|Float|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (SPADCALL |h|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 12))
                                           (QREFELT % 20))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 52)))
                (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 12))
                                           (QREFELT % 20))
                                 |h3| (QREFELT % 21))
                                (QREFELT % 54)))
                (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 21)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 12))
                                           (QREFELT % 20))
                                 |h4| (QREFELT % 21))
                                (QREFELT % 52)))
                (LETT |res|
                      (SPADCALL |res|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 12))
                                            (QREFELT % 20))
                                  |h3| (QREFELT % 21))
                                 |h2| (QREFELT % 21))
                                (QREFELT % 54)))
                (EXIT
                 (SPADCALL |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 12))
                                       (QREFELT % 20))
                             |h4| (QREFELT % 21))
                            |h2| (QREFELT % 21))
                           (QREFELT % 52)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CFC;28|
        ((|x| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G600 NIL) (|dw| (|Complex| (|Float|)))
          (|ew| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 30)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 8))
                                            (QREFELT % 25))
                                  (SPADCALL |w| (|spadConstant| % 7)
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 25)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 40))
                              (PROGN (LETT #1# |w|) (GO #2=#:G599)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CFC;29|
        ((|lz| (|Complex| (|Float|))) (|w| (|Complex| (|Float|)))
         (|eps| (|Float|)) (% (|Complex| (|Float|))))
        (SPROG
         ((|odw| (|Float|)) (#1=#:G606 NIL) (|dw| (|Complex| (|Float|)))
          (|lw| (|Complex| (|Float|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 26)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 23))
                                            |lz| (QREFELT % 25))
                                  (SPADCALL (|spadConstant| % 7)
                                            (SPADCALL (|spadConstant| % 7) |w|
                                                      (QREFELT % 8))
                                            (QREFELT % 23))
                                  (QREFELT % 8)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 25)))
                           (EXIT
                            (COND
                             ((SPADCALL |odw| |eps| (QREFELT % 40))
                              (PROGN (LETT #1# |w|) (GO #2=#:G605)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 69)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;30|
        ((|h| (|Complex| (|Float|))) (|h2| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|res| (|Complex| (|Float|))) (|h4| #1=(|Complex| (|Float|)))
          (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 12))
                                     (QREFELT % 13))
                           |h2| (QREFELT % 9))
                          (QREFELT % 25)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 12))
                                     (QREFELT % 13))
                           |h3| (QREFELT % 9))
                          (QREFELT % 23)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 9)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 12))
                                     (QREFELT % 13))
                           |h4| (QREFELT % 9))
                          (QREFELT % 25)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 12))
                                      (QREFELT % 13))
                            |h3| (QREFELT % 9))
                           |h2| (QREFELT % 9))
                          (QREFELT % 23)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 12))
                                 (QREFELT % 13))
                       |h4| (QREFELT % 9))
                      |h2| (QREFELT % 9))
                     (QREFELT % 25)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;4Df;31|
        ((|x| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G614 NIL) (|dw| (|DoubleFloat|))
          (|ew| (|DoubleFloat|)))
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
                              (PROGN (LETT #1# |w|) (GO #2=#:G613)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 71)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;4Df;32|
        ((|lz| (|DoubleFloat|)) (|w| (|DoubleFloat|)) (|eps| (|DoubleFloat|))
         (% (|DoubleFloat|)))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G620 NIL) (|dw| (|DoubleFloat|))
          (|lw| (|DoubleFloat|)))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 82)))
                           (LETT |dw|
                                 (|div_DF| (|sub_DF| (|add_DF| |w| |lw|) |lz|)
                                           (|add_DF| 1.0 (|div_DF| 1.0 |w|))))
                           (LETT |w| (|sub_DF| |w| |dw|))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G619)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 71)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3Df;33|
        ((|h| (|DoubleFloat|)) (|h2| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG ((|res| (|DoubleFloat|)) (|h4| #1=(|DoubleFloat|)) (|h3| #1#))
               (SEQ
                (LETT |res|
                      (|sub_DF| |h|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 1 3 (QREFELT % 12))
                                           (QREFELT % 97))
                                 |h2|)))
                (LETT |h3| (|mul_DF| |h| |h2|))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 11 72 (QREFELT % 12))
                                           (QREFELT % 97))
                                 |h3|)))
                (LETT |h4| (|mul_DF| |h2| |h2|))
                (LETT |res|
                      (|sub_DF| |res|
                                (|mul_DF|
                                 (SPADCALL (SPADCALL 43 540 (QREFELT % 12))
                                           (QREFELT % 97))
                                 |h4|)))
                (LETT |res|
                      (|add_DF| |res|
                                (|mul_DF|
                                 (|mul_DF|
                                  (SPADCALL (SPADCALL 769 17280 (QREFELT % 12))
                                            (QREFELT % 97))
                                  |h3|)
                                 |h2|)))
                (EXIT
                 (|sub_DF| |res|
                           (|mul_DF|
                            (|mul_DF|
                             (SPADCALL (SPADCALL 221 8505 (QREFELT % 12))
                                       (QREFELT % 97))
                             |h4|)
                            |h2|)))))) 

(SDEFUN |FSFUN;lambert_via_newton1;2CDfC;34|
        ((|x| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G628 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|ew| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |ew| (SPADCALL |w| (QREFELT % 99)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL |w|
                                            (SPADCALL |x| |ew| (QREFELT % 100))
                                            (QREFELT % 101))
                                  (SPADCALL |w| (|spadConstant| % 102)
                                            (QREFELT % 103))
                                  (QREFELT % 100)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 101)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G627)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 75)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_via_newton2;2CDfC;35|
        ((|lz| (|Complex| (|DoubleFloat|))) (|w| (|Complex| (|DoubleFloat|)))
         (|eps| (|DoubleFloat|)) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|odw| (|DoubleFloat|)) (#1=#:G634 NIL)
          (|dw| (|Complex| (|DoubleFloat|)))
          (|lw| (|Complex| (|DoubleFloat|))))
         (SEQ
          (EXIT
           (SEQ (LETT |odw| 1.0)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |lw| (SPADCALL |w| (QREFELT % 105)))
                           (LETT |dw|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |w| |lw| (QREFELT % 103))
                                            |lz| (QREFELT % 101))
                                  (SPADCALL (|spadConstant| % 102)
                                            (SPADCALL (|spadConstant| % 102)
                                                      |w| (QREFELT % 100))
                                            (QREFELT % 103))
                                  (QREFELT % 100)))
                           (LETT |w| (SPADCALL |w| |dw| (QREFELT % 101)))
                           (EXIT
                            (COND
                             ((|less_DF| |odw| |eps|)
                              (PROGN (LETT #1# |w|) (GO #2=#:G633)))
                             ('T
                              (LETT |odw| (SPADCALL |dw| (QREFELT % 75)))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSFUN;lambert_inverse_series;3C;36|
        ((|h| (|Complex| (|DoubleFloat|))) (|h2| (|Complex| (|DoubleFloat|)))
         (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|res| (|Complex| (|DoubleFloat|)))
          (|h4| #1=(|Complex| (|DoubleFloat|))) (|h3| #1#))
         (SEQ
          (LETT |res|
                (SPADCALL |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL 1 3 (QREFELT % 12))
                                     (QREFELT % 107))
                           |h2| (QREFELT % 108))
                          (QREFELT % 101)))
          (LETT |h3| (SPADCALL |h| |h2| (QREFELT % 108)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 11 72 (QREFELT % 12))
                                     (QREFELT % 107))
                           |h3| (QREFELT % 108))
                          (QREFELT % 103)))
          (LETT |h4| (SPADCALL |h2| |h2| (QREFELT % 108)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 43 540 (QREFELT % 12))
                                     (QREFELT % 107))
                           |h4| (QREFELT % 108))
                          (QREFELT % 101)))
          (LETT |res|
                (SPADCALL |res|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL 769 17280 (QREFELT % 12))
                                      (QREFELT % 107))
                            |h3| (QREFELT % 108))
                           |h2| (QREFELT % 108))
                          (QREFELT % 103)))
          (EXIT
           (SPADCALL |res|
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL 221 8505 (QREFELT % 12))
                                 (QREFELT % 107))
                       |h4| (QREFELT % 108))
                      |h2| (QREFELT % 108))
                     (QREFELT % 101)))))) 

(SDEFUN |FSFUN;lambertW;2Df;37| ((|x| (|DoubleFloat|)) (% (|DoubleFloat|)))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|ax| (|DoubleFloat|)) (|h| (|DoubleFloat|))
          (|h2| (|DoubleFloat|)) (|e1| (|DoubleFloat|)) (|w| (|DoubleFloat|))
          (|y| #1=(|DoubleFloat|)) (|lx| #1#) (|ox| (|Integer|)))
         (SEQ
          (COND ((|eql_DF| |x| 0.0) |x|)
                (#2='T
                 (SEQ (LETT |eps| (SPADCALL 1 -35 (QREFELT % 110)))
                      (LETT |ox| (SPADCALL |x| (QREFELT % 111)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((> |ox| 200)
                                 (COND
                                  ((SPADCALL |x| 0.0 (QREFELT % 112))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT % 82)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT % 96)))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |x|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 112))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 82)))
                                        (EXIT
                                         (|sub_DF| |y|
                                                   (SPADCALL |y|
                                                             (QREFELT %
                                                                      82))))))
                                      (#2# (|mul_DF| (|div_DF_I| 1.0 2) |x|))))
                               (EXIT
                                (COND
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190436 517656
                                                         (QREFELT % 12))
                                               (QREFELT % 113))
                                              (QREFELT % 97)))
                                  (|error| "x < -exp(-1)"))
                                 ((|less_DF| |x|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 231087 628160
                                                         (QREFELT % 12))
                                               (QREFELT % 113))
                                              (QREFELT % 97)))
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
                                                            (QREFELT % 114))
                                                  |e1|))
                                           (LETT |h|
                                                 (SPADCALL |h2|
                                                           (QREFELT % 115)))
                                           (EXIT
                                            (|sub_DF|
                                             (SPADCALL |h| |h2| (QREFELT % 98))
                                             1.0))))))))
                                 (#2#
                                  (SEQ
                                   (COND
                                    ((|less_DF| (LETT |ax| (|abs_DF| |x|))
                                                (|div_DF_I| 1.0 2))
                                     (LETT |eps| (|mul_DF| |ax| |eps|))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT % 95))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;38|
        ((|x| (|Complex| (|DoubleFloat|))) (% (|Complex| (|DoubleFloat|))))
        (SPROG
         ((|eps| (|DoubleFloat|)) (|w| #1=(|Complex| (|DoubleFloat|)))
          (|y| (|Complex| (|DoubleFloat|))) (|h| (|Complex| (|DoubleFloat|)))
          (|h2| #1#) (|e1| (|DoubleFloat|)) (|lz| (|Complex| (|DoubleFloat|)))
          (|ox| (|Integer|)) (|ax| (|DoubleFloat|)) (|ix| (|DoubleFloat|))
          (|rx| (|DoubleFloat|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 117) (QREFELT % 118)) |x|)
                (#2='T
                 (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 74)))
                      (LETT |ix| (SPADCALL |x| (QREFELT % 119)))
                      (LETT |ax| (|add_DF| (|abs_DF| |rx|) (|abs_DF| |ix|)))
                      (LETT |eps| (SPADCALL 1 -35 (QREFELT % 110)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT % 111)))
                      (EXIT
                       (COND ((< |ox| -70) |x|)
                             ((> |ox| 200)
                              (SEQ
                               (LETT |lz|
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |ax| (QREFELT % 82))
                                                0.0 (QREFELT % 120))
                                      (SPADCALL
                                       (SPADCALL (|div_DF| |rx| |ax|)
                                                 (|div_DF| |ix| |ax|)
                                                 (QREFELT % 120))
                                       (QREFELT % 105))
                                      (QREFELT % 103)))
                               (EXIT
                                (SPADCALL |lz| |lz| |eps| (QREFELT % 106)))))
                             (#2#
                              (SEQ
                               (COND
                                ((|less_DF| (|abs_DF| |ix|)
                                            (SPADCALL
                                             (SPADCALL 1 4194304
                                                       (QREFELT % 12))
                                             (QREFELT % 97)))
                                 (COND
                                  ((|less_DF| |rx|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 231087 628160
                                                          (QREFELT % 12))
                                                (QREFELT % 113))
                                               (QREFELT % 97)))
                                   (COND
                                    ((|less_DF|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 56258 152925 (QREFELT % 12))
                                        (QREFELT % 113))
                                       (QREFELT % 97))
                                      |rx|)
                                     (EXIT
                                      (SEQ
                                       (LETT |e1| (|exp_DF| (|minus_DF| 1.0)))
                                       (LETT |h2|
                                             (SPADCALL
                                              (SPADCALL 2 (|div_DF| 1.0 |e1|)
                                                        (QREFELT % 114))
                                              (SPADCALL |x|
                                                        (SPADCALL |e1| 0.0
                                                                  (QREFELT %
                                                                           120))
                                                        (QREFELT % 103))
                                              (QREFELT % 121)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT % 122)))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |h| |h2| (QREFELT % 109))
                                         (|spadConstant| % 102)
                                         (QREFELT % 101)))))))))))
                               (LETT |w|
                                     (COND
                                      ((SPADCALL |ax|
                                                 (FLOAT 2
                                                        MOST-POSITIVE-DOUBLE-FLOAT)
                                                 (QREFELT % 112))
                                       (SEQ
                                        (LETT |y|
                                              (SPADCALL |x| (QREFELT % 105)))
                                        (EXIT
                                         (SPADCALL |y|
                                                   (SPADCALL |y|
                                                             (QREFELT % 105))
                                                   (QREFELT % 101)))))
                                      (#2#
                                       (SPADCALL (|div_DF_I| 1.0 2) |x|
                                                 (QREFELT % 121)))))
                               (COND
                                ((|less_DF| |ax| (|div_DF_I| 1.0 2))
                                 (LETT |eps| (|mul_DF| |ax| |eps|))))
                               (EXIT
                                (SPADCALL |x| |w| |eps|
                                          (QREFELT % 104))))))))))))) 

(SDEFUN |FSFUN;lambertW;2F;39| ((|x| (|Float|)) (% (|Float|)))
        (SPROG
         ((|eps| (|Float|)) (|w| (|Float|)) (|y| #1=(|Float|)) (|w1| (|Float|))
          (|h| (|Float|)) (|h2| (|Float|)) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|lx| #1#) (|ox| (|Integer|))
          (|ax| (|Float|)) (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |x| (|spadConstant| % 59) (QREFELT % 124)) |x|)
                (#2='T
                 (SEQ (LETT |cbit| (SPADCALL (QREFELT % 36)))
                      (LETT |eps|
                            (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                      (QREFELT % 125)))
                      (LETT |ax| (SPADCALL |x| (QREFELT % 67)))
                      (LETT |ox| (SPADCALL |ax| (QREFELT % 51)))
                      (EXIT
                       (COND ((< |ox| (- (- |cbit|) 10)) |x|)
                             (#2#
                              (SEQ
                               (COND
                                ((> |ox| 200)
                                 (COND
                                  ((SPADCALL |x| (|spadConstant| % 59)
                                             (QREFELT % 50))
                                   (EXIT
                                    (SEQ
                                     (LETT |lx| (SPADCALL |x| (QREFELT % 29)))
                                     (EXIT
                                      (SPADCALL |lx| |lx| |eps|
                                                (QREFELT % 90)))))))))
                               (EXIT
                                (COND
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL 190436 517656
                                                        (QREFELT % 12))
                                              (QREFELT % 113))
                                             (QREFELT % 20))
                                            (QREFELT % 40))
                                  (|error| "x < -exp(-1)"))
                                 ((SPADCALL |x|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL 190434 517656
                                                        (QREFELT % 12))
                                              (QREFELT % 113))
                                             (QREFELT % 20))
                                            (QREFELT % 40))
                                  (SEQ (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                                       (SPADCALL (+ |cbit| |cbit2|)
                                                 (QREFELT % 41))
                                       (LETT |e1|
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 15)
                                                        (QREFELT % 32))
                                              (QREFELT % 33)))
                                       (LETT |h2|
                                             (SPADCALL |x| |e1|
                                                       (QREFELT % 54)))
                                       (LETT |h|
                                             (SPADCALL |h2| (QREFELT % 78)))
                                       (SPADCALL |cbit| (QREFELT % 41))
                                       (EXIT
                                        (COND
                                         ((SPADCALL |h2| (|spadConstant| % 59)
                                                    (QREFELT % 40))
                                          (|error| "x < -exp(-1)"))
                                         (#2#
                                          (SEQ
                                           (LETT |w1|
                                                 (SPADCALL |h| |h2|
                                                           (QREFELT % 91)))
                                           (EXIT
                                            (COND
                                             ((< (SPADCALL |w1| (QREFELT % 51))
                                                 (- |cbit2|))
                                              (SPADCALL |w1|
                                                        (|spadConstant| % 15)
                                                        (QREFELT % 52)))
                                             (#2#
                                              (SPADCALL |x|
                                                        (SPADCALL |w1|
                                                                  (|spadConstant|
                                                                   % 15)
                                                                  (QREFELT %
                                                                           52))
                                                        |eps|
                                                        (QREFELT %
                                                                 89)))))))))))
                                 (#2#
                                  (SEQ
                                   (LETT |w|
                                         (COND
                                          ((SPADCALL |x|
                                                     (SPADCALL 2
                                                               (QREFELT % 16))
                                                     (QREFELT % 50))
                                           (SEQ
                                            (LETT |y|
                                                  (SPADCALL |x|
                                                            (QREFELT % 29)))
                                            (EXIT
                                             (SPADCALL |y|
                                                       (SPADCALL |y|
                                                                 (QREFELT %
                                                                          29))
                                                       (QREFELT % 52)))))
                                          (#2#
                                           (SPADCALL
                                            (SPADCALL 5 -1 10 (QREFELT % 126))
                                            |x| (QREFELT % 21)))))
                                   (COND
                                    ((SPADCALL (SPADCALL |x| (QREFELT % 67))
                                               (SPADCALL
                                                (SPADCALL 1 2 (QREFELT % 12))
                                                (QREFELT % 20))
                                               (QREFELT % 40))
                                     (LETT |eps|
                                           (SPADCALL |ax| |eps|
                                                     (QREFELT % 21)))))
                                   (EXIT
                                    (SPADCALL |x| |w| |eps|
                                              (QREFELT % 89))))))))))))))))) 

(SDEFUN |FSFUN;lambertW;2C;40|
        ((|z| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|w1| (|Complex| (|Float|))) (|h| (|Complex| (|Float|)))
          (|h2| (|Complex| (|Float|))) (|e1| (|Float|))
          (|cbit2| (|NonNegativeInteger|)) (|eps| (|Float|))
          (|w| (|Complex| (|Float|))) (|wd| (|Complex| (|DoubleFloat|)))
          (|izd| (|DoubleFloat|)) (|rzd| (|DoubleFloat|))
          (|lz| (|Complex| (|Float|))) (|oz| (|Integer|)) (|abs_z| (|Float|))
          (|cbit| (|PositiveInteger|)))
         (SEQ
          (COND ((SPADCALL |z| (|spadConstant| % 44) (QREFELT % 45)) |z|)
                (#1='T
                 (SEQ (LETT |cbit| (SPADCALL (QREFELT % 36)))
                      (LETT |eps|
                            (SPADCALL 1 (- (QUOTIENT2 (* 2 |cbit|) 3))
                                      (QREFELT % 125)))
                      (LETT |abs_z| (SPADCALL |z| (QREFELT % 69)))
                      (LETT |oz| (SPADCALL |abs_z| (QREFELT % 51)))
                      (EXIT
                       (COND ((< |oz| (- (- |cbit|) 10)) |z|)
                             ((> |oz| 200)
                              (SEQ (LETT |lz| (SPADCALL |z| (QREFELT % 26)))
                                   (EXIT
                                    (SPADCALL |lz| |lz| |eps|
                                              (QREFELT % 93)))))
                             (#1#
                              (SEQ
                               (LETT |rzd|
                                     (SPADCALL (SPADCALL |z| (QREFELT % 37))
                                               (QREFELT % 128)))
                               (COND
                                ((OR
                                  (SPADCALL (SPADCALL |z| (QREFELT % 56))
                                            (SPADCALL (|spadConstant| % 15)
                                                      1000000 (QREFELT % 38))
                                            (QREFELT % 50))
                                  (OR
                                   (|less_DF| |rzd|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL 190436 517656
                                                          (QREFELT % 12))
                                                (QREFELT % 113))
                                               (QREFELT % 97)))
                                   (SPADCALL |rzd|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL 190434 517656
                                                         (QREFELT % 12))
                                               (QREFELT % 113))
                                              (QREFELT % 97))
                                             (QREFELT % 112))))
                                 (EXIT
                                  (SEQ
                                   (LETT |izd|
                                         (SPADCALL
                                          (SPADCALL |z| (QREFELT % 56))
                                          (QREFELT % 128)))
                                   (LETT |wd|
                                         (SPADCALL
                                          (SPADCALL |rzd| |izd|
                                                    (QREFELT % 120))
                                          (QREFELT % 123)))
                                   (LETT |w|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |wd| (QREFELT % 74))
                                           (QREFELT % 129))
                                          (SPADCALL
                                           (SPADCALL |wd| (QREFELT % 119))
                                           (QREFELT % 129))
                                          (QREFELT % 60)))
                                   (COND
                                    ((SPADCALL |abs_z|
                                               (SPADCALL (|spadConstant| % 15)
                                                         2 (QREFELT % 38))
                                               (QREFELT % 40))
                                     (LETT |eps|
                                           (SPADCALL |abs_z| |eps|
                                                     (QREFELT % 21)))))
                                   (EXIT
                                    (SPADCALL |z| |w| |eps|
                                              (QREFELT % 92)))))))
                               (LETT |cbit2| (QUOTIENT2 |cbit| 2))
                               (SPADCALL (+ |cbit| |cbit2|) (QREFELT % 41))
                               (LETT |e1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 15)
                                                (QREFELT % 32))
                                      (QREFELT % 33)))
                               (LETT |h2|
                                     (SPADCALL |z|
                                               (SPADCALL |e1|
                                                         (|spadConstant| % 59)
                                                         (QREFELT % 60))
                                               (QREFELT % 23)))
                               (LETT |h| (SPADCALL |h2| (QREFELT % 130)))
                               (SPADCALL |cbit| (QREFELT % 41))
                               (LETT |w1| (SPADCALL |h| |h2| (QREFELT % 94)))
                               (EXIT
                                (COND
                                 ((<
                                   (SPADCALL (SPADCALL |h2| (QREFELT % 69))
                                             (QREFELT % 51))
                                   (- |cbit2|))
                                  (SPADCALL |w1| (|spadConstant| % 7)
                                            (QREFELT % 25)))
                                 (#1#
                                  (SPADCALL |z|
                                            (SPADCALL |w1| (|spadConstant| % 7)
                                                      (QREFELT % 25))
                                            |eps| (QREFELT % 92))))))))))))))) 

(DECLAIM (NOTINLINE |FloatSpecialFunctions;|)) 

(DEFUN |FloatSpecialFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G681)
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

(DEFUN |FloatSpecialFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatSpecialFunctions|))
          (LETT % (GETREFV 132))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatSpecialFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FloatSpecialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Complex| 14) (0 . |One|) (4 . /)
              (10 . *) (|Integer|) (|Fraction| 10) (16 . /) (22 . |coerce|)
              (|Float|) (27 . |One|) (31 . |coerce|) (36 . /)
              (|IntegerNumberTheoryFunctions|) (42 . |bernoulli|)
              (47 . |coerce|) (52 . *) (58 . |coerce|) (63 . +) (69 . |One|)
              (73 . -) (79 . |log|) (84 . |pi|) (88 . *) (94 . |log|)
              (99 . |exp|) (104 . |coerce|) (109 . -) (114 . |exp|)
              (|PositiveInteger|) (119 . |base|) (123 . |bits|) (127 . |real|)
              (132 . /) (|Boolean|) (138 . <) (144 . |bits|) (149 . |round|)
              (154 . |retract|) (159 . |Zero|) (163 . =) |FSFUN;Gamma;2C;5|
              (169 . |sin|) (174 . |abs|) (179 . *) (185 . >) (191 . |order|)
              (196 . -) (202 . |log2|) (206 . +) (212 . |wholePart|)
              (217 . |imag|) (222 . |pi|) (226 . |imaginary|) (230 . |Zero|)
              (234 . |complex|) |FSFUN;logGamma;2C;7| |FSFUN;Gamma;2F;8|
              (240 . <=) |FSFUN;logGamma;2F;9| |FSFUN;Beta;3C;10|
              |FSFUN;Beta;3F;11| (246 . |abs|) |FSFUN;rabs;2F;12|
              |FSFUN;rabs;CF;13| (|DoubleFloat|) |FSFUN;rabs;2Df;14|
              (|Complex| 70) (251 . |abs|) (256 . |real|) |FSFUN;rabs;CDf;15|
              (261 . -) (266 . |norm|) (271 . |sqrt|) (276 . |cos|)
              |FSFUN;digamma;2C;18| |FSFUN;digamma;2F;19| (281 . |log|)
              (286 . |convert|) (291 . |round|) (296 . |retract|) (301 . >=)
              |FSFUN;li2;2C;22| |FSFUN;dilog;2C;24|
              |FSFUN;lambert_via_newton1;4F;25|
              |FSFUN;lambert_via_newton2;4F;26|
              |FSFUN;lambert_inverse_series;3F;27|
              |FSFUN;lambert_via_newton1;2CFC;28|
              |FSFUN;lambert_via_newton2;2CFC;29|
              |FSFUN;lambert_inverse_series;3C;30|
              |FSFUN;lambert_via_newton1;4Df;31|
              |FSFUN;lambert_via_newton2;4Df;32| (307 . |coerce|)
              |FSFUN;lambert_inverse_series;3Df;33| (312 . |exp|) (317 . /)
              (323 . -) (329 . |One|) (333 . +)
              |FSFUN;lambert_via_newton1;2CDfC;34| (339 . |log|)
              |FSFUN;lambert_via_newton2;2CDfC;35| (344 . |coerce|) (349 . *)
              |FSFUN;lambert_inverse_series;3C;36| (355 . |float|)
              (361 . |order|) (366 . >) (372 . -) (377 . *) (383 . |sqrt|)
              |FSFUN;lambertW;2Df;37| (388 . |Zero|) (392 . =) (398 . |imag|)
              (403 . |complex|) (409 . *) (415 . |sqrt|) |FSFUN;lambertW;2C;38|
              (420 . =) (426 . |float|) (432 . |float|) |FSFUN;lambertW;2F;39|
              (439 . |coerce|) (444 . |convert|) (449 . |sqrt|)
              |FSFUN;lambertW;2C;40|)
           '#(|rabs| 454 |logGamma| 474 |li2| 484 |lambert_via_newton2| 489
              |lambert_via_newton1| 517 |lambert_inverse_series| 545 |lambertW|
              569 |dilog| 589 |digamma| 594 |Gamma| 604 |Beta| 614)
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
                                   '((|dilog|
                                      ((|Complex| (|Float|))
                                       (|Complex| (|Float|))))
                                     T)
                                   '((|li2|
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
                        (|makeByteWordVec2| 131
                                            '(0 6 0 7 2 6 0 0 0 8 2 6 0 0 0 9 2
                                              11 0 10 10 12 1 6 0 11 13 0 14 0
                                              15 1 14 0 10 16 2 14 0 0 0 17 1
                                              18 11 10 19 1 14 0 11 20 2 14 0 0
                                              0 21 1 6 0 14 22 2 6 0 0 0 23 0
                                              11 0 24 2 6 0 0 0 25 1 6 0 0 26 0
                                              6 0 27 2 6 0 14 0 28 1 14 0 0 29
                                              1 6 0 0 30 1 6 0 10 31 1 14 0 0
                                              32 1 14 0 0 33 0 14 34 35 0 14 34
                                              36 1 6 14 0 37 2 14 0 0 10 38 2
                                              14 39 0 0 40 1 14 34 34 41 1 14 0
                                              0 42 1 14 10 0 43 0 6 0 44 2 6 39
                                              0 0 45 1 6 0 0 47 1 6 0 0 48 2 14
                                              0 34 0 49 2 14 39 0 0 50 1 14 10
                                              0 51 2 14 0 0 0 52 0 14 0 53 2 14
                                              0 0 0 54 1 14 10 0 55 1 6 14 0 56
                                              0 14 0 57 0 6 0 58 0 14 0 59 2 6
                                              0 14 14 60 2 14 39 0 0 63 1 14 0
                                              0 67 1 72 0 0 73 1 72 70 0 74 1 6
                                              0 0 76 1 6 14 0 77 1 14 0 0 78 1
                                              6 0 0 79 1 70 0 0 82 1 14 70 0 83
                                              1 70 0 0 84 1 70 10 0 85 2 14 39
                                              0 0 86 1 70 0 11 97 1 72 0 0 99 2
                                              72 0 0 0 100 2 72 0 0 0 101 0 72
                                              0 102 2 72 0 0 0 103 1 72 0 0 105
                                              1 72 0 11 107 2 72 0 0 0 108 2 70
                                              0 10 10 110 1 70 10 0 111 2 70 39
                                              0 0 112 1 11 0 0 113 2 70 0 34 0
                                              114 1 70 0 0 115 0 72 0 117 2 72
                                              39 0 0 118 1 72 70 0 119 2 72 0
                                              70 70 120 2 72 0 70 0 121 1 72 0
                                              0 122 2 14 39 0 0 124 2 14 0 10
                                              10 125 3 14 0 10 10 34 126 1 14
                                              70 0 128 1 14 0 70 129 1 6 0 0
                                              130 1 0 14 14 68 1 0 14 6 69 1 0
                                              70 72 75 1 0 70 70 71 1 0 14 14
                                              64 1 0 6 6 61 1 0 6 6 87 3 0 70
                                              70 70 70 96 3 0 14 14 14 14 90 3
                                              0 72 72 72 70 106 3 0 6 6 6 14 93
                                              3 0 70 70 70 70 95 3 0 14 14 14
                                              14 89 3 0 72 72 72 70 104 3 0 6 6
                                              6 14 92 2 0 70 70 70 98 2 0 14 14
                                              14 91 2 0 72 72 72 109 2 0 6 6 6
                                              94 1 0 14 14 127 1 0 6 6 131 1 0
                                              70 70 116 1 0 72 72 123 1 0 6 6
                                              88 1 0 14 14 81 1 0 6 6 80 1 0 14
                                              14 62 1 0 6 6 46 2 0 14 14 14 66
                                              2 0 6 6 6 65)))))
           '|lookupComplete|)) 

(MAKEPROP '|FloatSpecialFunctions| 'NILADIC T) 
