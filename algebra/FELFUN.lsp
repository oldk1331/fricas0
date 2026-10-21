
(SDEFUN |FELFUN;rabs;2F;1| ((|r| (|Float|)) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 7))) 

(SDEFUN |FELFUN;rabs;CF;2| ((|r| (|Complex| (|Float|))) (% (|Float|)))
        (SPADCALL |r| (QREFELT % 10))) 

(SDEFUN |FELFUN;landen1;F2L;3|
        ((|m1| (|Float|)) (|res| (|List| (|Float|))) (% (|List| (|Float|))))
        (SPROG ((|kp| (|Float|)) (|kn1| (|Float|)))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |m1| (QREFELT % 8))
                                  (SPADCALL 25 -2 10 (QREFELT % 14))
                                  (QREFELT % 16)))
                       (GO G191)))
                     (SEQ (LETT |kp| (SPADCALL |m1| (QREFELT % 17)))
                          (LETT |kn1|
                                (SPADCALL (SPADCALL 2 |kp| (QREFELT % 18))
                                          (SPADCALL (|spadConstant| % 19) |kp|
                                                    (QREFELT % 20))
                                          (QREFELT % 21)))
                          (LETT |res|
                                (CONS
                                 (SPADCALL (|spadConstant| % 19) |kn1|
                                           (QREFELT % 22))
                                 |res|))
                          (EXIT
                           (LETT |m1|
                                 (SPADCALL (SPADCALL 2 |kn1| (QREFELT % 18))
                                           (SPADCALL |kn1| 2 (QREFELT % 23))
                                           (QREFELT % 22)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |m1| |res|))))) 

(SDEFUN |FELFUN;landen2;FLFL;4|
        ((|m| (|Float|)) (|res| (|List| (|Float|))) (|eps| (|Float|))
         (% (|List| (|Float|))))
        (SPROG
         ((|am| (|Float|)) (#1=#:G62 NIL) (|kp| (|Float|)) (|kn| (|Float|)))
         (SEQ
          (SEQ
           (EXIT
            (SEQ G190 NIL
                 (SEQ (LETT |am| (SPADCALL |m| (QREFELT % 8)))
                      (EXIT
                       (COND
                        ((SPADCALL |am| |eps| (QREFELT % 16))
                         (SEQ
                          (LETT |kn|
                                (SPADCALL (SPADCALL 1 4 (QREFELT % 28)) |m|
                                          (QREFELT % 29)))
                          (LETT |res| (CONS |kn| |res|))
                          (EXIT (PROGN (LETT #1# |$NoValue|) (GO #2=#:G59)))))
                        ('T
                         (SEQ
                          (LETT |kp|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 19) |m|
                                           (QREFELT % 22))
                                 (QREFELT % 17)))
                          (LETT |kn|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 19) |kp|
                                           (QREFELT % 22))
                                 (SPADCALL (|spadConstant| % 19) |kp|
                                           (QREFELT % 20))
                                 (QREFELT % 21)))
                          (LETT |res| (CONS |kn| |res|))
                          (EXIT
                           (LETT |m| (SPADCALL |kn| 2 (QREFELT % 23)))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #2# (EXIT #1#))
          (EXIT |res|)))) 

(SDEFUN |FELFUN;landen;2FL;5|
        ((|m| (|Float|)) (|eps| (|Float|)) (% (|List| (|Float|))))
        (SPROG ((|m1| (|Float|)) (|res| (|List| (|Float|))))
               (SEQ (LETT |res| NIL)
                    (COND
                     ((SPADCALL
                       (SPADCALL
                        (LETT |m1|
                              (SPADCALL (|spadConstant| % 19) |m|
                                        (QREFELT % 22)))
                        (QREFELT % 8))
                       (SPADCALL 25 -2 10 (QREFELT % 14)) (QREFELT % 16))
                      (SEQ (LETT |res| (SPADCALL |m1| |res| (QREFELT % 25)))
                           (LETT |m|
                                 (SPADCALL (|spadConstant| % 19)
                                           (|SPADfirst| |res|) (QREFELT % 22)))
                           (EXIT (LETT |res| (CDR |res|))))))
                    (EXIT (SPADCALL |m| |res| |eps| (QREFELT % 30)))))) 

(SDEFUN |FELFUN;kprod;LF;6| ((|ll| (|List| (|Float|))) (% (|Float|)))
        (SPROG ((#1=#:G73 NIL) (|k| NIL) (#2=#:G74 NIL))
               (SEQ
                (SPADCALL (ELT % 33)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |k| NIL) (LETT #2# |ll|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |k| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (SPADCALL (|spadConstant| % 19) |k|
                                                   (QREFELT % 20))
                                         #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 35))))) 

(SDEFUN |FELFUN;sn2;FLF;7|
        ((|z| (|Float|)) (|ll| (|List| (|Float|))) (% (|Float|)))
        (SPROG ((|k| NIL) (#1=#:G79 NIL) (|res| (|Float|)))
               (SEQ (LETT |res| (SPADCALL |z| (QREFELT % 37)))
                    (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 19) |k|
                                             (QREFELT % 20))
                                   |res| (QREFELT % 33))
                                  (SPADCALL (|spadConstant| % 19)
                                            (SPADCALL |k|
                                                      (SPADCALL |res| 2
                                                                (QREFELT % 23))
                                                      (QREFELT % 33))
                                            (QREFELT % 20))
                                  (QREFELT % 21)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |FELFUN;landen1;C2L;8|
        ((|m1| (|Complex| (|Float|))) (|res| (|List| (|Complex| (|Float|))))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG ((|kp| (|Complex| (|Float|))) (|kn1| (|Complex| (|Float|))))
               (SEQ
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |m1| (QREFELT % 11))
                                  (SPADCALL 25 -2 10 (QREFELT % 14))
                                  (QREFELT % 16)))
                       (GO G191)))
                     (SEQ (LETT |kp| (SPADCALL |m1| (QREFELT % 40)))
                          (LETT |kn1|
                                (SPADCALL (SPADCALL 2 |kp| (QREFELT % 41))
                                          (SPADCALL (|spadConstant| % 31) |kp|
                                                    (QREFELT % 42))
                                          (QREFELT % 43)))
                          (LETT |res|
                                (CONS
                                 (SPADCALL (|spadConstant| % 31) |kn1|
                                           (QREFELT % 44))
                                 |res|))
                          (EXIT
                           (LETT |m1|
                                 (SPADCALL (SPADCALL 2 |kn1| (QREFELT % 41))
                                           (SPADCALL |kn1| 2 (QREFELT % 45))
                                           (QREFELT % 44)))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS |m1| |res|))))) 

(SDEFUN |FELFUN;landen2;CLFL;9|
        ((|m| (|Complex| (|Float|))) (|res| (|List| (|Complex| (|Float|))))
         (|eps| (|Float|)) (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|am| (|Float|)) (#1=#:G92 NIL) (|kp| (|Complex| (|Float|)))
          (|kn| (|Complex| (|Float|))))
         (SEQ
          (SEQ
           (EXIT
            (SEQ G190 NIL
                 (SEQ (LETT |am| (SPADCALL |m| (QREFELT % 11)))
                      (EXIT
                       (COND
                        ((SPADCALL |am| |eps| (QREFELT % 16))
                         (SEQ
                          (LETT |kn|
                                (SPADCALL (SPADCALL 1 4 (QREFELT % 28)) |m|
                                          (QREFELT % 48)))
                          (LETT |res| (CONS |kn| |res|))
                          (EXIT (PROGN (LETT #1# |$NoValue|) (GO #2=#:G89)))))
                        ('T
                         (SEQ
                          (LETT |kp|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31) |m|
                                           (QREFELT % 44))
                                 (QREFELT % 40)))
                          (LETT |kn|
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31) |kp|
                                           (QREFELT % 44))
                                 (SPADCALL (|spadConstant| % 31) |kp|
                                           (QREFELT % 42))
                                 (QREFELT % 43)))
                          (LETT |res| (CONS |kn| |res|))
                          (EXIT
                           (LETT |m| (SPADCALL |kn| 2 (QREFELT % 45)))))))))
                 NIL (GO G190) G191 (EXIT NIL)))
           #2# (EXIT #1#))
          (EXIT |res|)))) 

(SDEFUN |FELFUN;landen;CFL;10|
        ((|m| (|Complex| (|Float|))) (|eps| (|Float|))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|m1| (|Complex| (|Float|))) (|res| (|List| (|Complex| (|Float|)))))
         (SEQ (LETT |res| NIL)
              (COND
               ((SPADCALL
                 (SPADCALL
                  (LETT |m1|
                        (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 44)))
                  (QREFELT % 11))
                 (SPADCALL 25 -2 10 (QREFELT % 14)) (QREFELT % 16))
                (SEQ (LETT |res| (SPADCALL |m1| |res| (QREFELT % 47)))
                     (LETT |m|
                           (SPADCALL (|spadConstant| % 31) (|SPADfirst| |res|)
                                     (QREFELT % 44)))
                     (EXIT (LETT |res| (CDR |res|))))))
              (EXIT (SPADCALL |m| |res| |eps| (QREFELT % 49)))))) 

(SDEFUN |FELFUN;kprod;LC;11|
        ((|ll| (|List| (|Complex| (|Float|)))) (% (|Complex| (|Float|))))
        (SPROG ((#1=#:G103 NIL) (|k| NIL) (#2=#:G104 NIL))
               (SEQ
                (SPADCALL (ELT % 51)
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |k| NIL) (LETT #2# |ll|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |k| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (SPADCALL (|spadConstant| % 31) |k|
                                                   (QREFELT % 42))
                                         #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 53))))) 

(SDEFUN |FELFUN;sn2;CLC;12|
        ((|z| (|Complex| (|Float|))) (|ll| (|List| (|Complex| (|Float|))))
         (% (|Complex| (|Float|))))
        (SPROG ((|k| NIL) (#1=#:G109 NIL) (|res| (|Complex| (|Float|))))
               (SEQ (LETT |res| (SPADCALL |z| (QREFELT % 55)))
                    (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 31) |k|
                                             (QREFELT % 42))
                                   |res| (QREFELT % 51))
                                  (SPADCALL (|spadConstant| % 31)
                                            (SPADCALL |k|
                                                      (SPADCALL |res| 2
                                                                (QREFELT % 45))
                                                      (QREFELT % 51))
                                            (QREFELT % 42))
                                  (QREFELT % 43)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |FELFUN;pimod| ((|z| (|Float|)) (% (|Float|)))
        (SPROG ((|pi2| (|Float|)) (|nn| (|Integer|)))
               (SEQ
                (LETT |pi2|
                      (SPADCALL 2 (SPADCALL (QREFELT % 57)) (QREFELT % 18)))
                (LETT |nn|
                      (SPADCALL
                       (SPADCALL (SPADCALL |z| |pi2| (QREFELT % 21))
                                 (QREFELT % 58))
                       (QREFELT % 59)))
                (EXIT
                 (SPADCALL |z| (SPADCALL |nn| |pi2| (QREFELT % 60))
                           (QREFELT % 22)))))) 

(SDEFUN |FELFUN;two_to_minus_n| ((|n| (|Integer|)) (% (|Float|)))
        (COND
         ((SPADCALL (SPADCALL (QREFELT % 61)) 2 (QREFELT % 62))
          (|error| "Only base 2 is supported"))
         ('T (SPADCALL 1 (- |n|) (QREFELT % 63))))) 

(SDEFUN |FELFUN;ellipticK;2F;15| ((|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Float|))) (|res| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT % 14)) (QREFELT % 65))
            (|error| "ellipticK : m >= 1.0"))
           ('T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (LETT |prec| (+ |obits| 20)) (SPADCALL |prec| (QREFELT % 67))
                 (LETT |eps|
                       (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
                 (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT % 28))
                                  (SPADCALL (QREFELT % 57)) (QREFELT % 29))
                        (SPADCALL |ll| (QREFELT % 36)) (QREFELT % 33)))
                 (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|))))))) 

(SDEFUN |FELFUN;ellipticK;2C;16|
        ((|m| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Complex| (|Float|))))
          (|res| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
            (|error| "ellipticK : m = 1.0"))
           ('T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (LETT |prec| (+ |obits| 20)) (SPADCALL |prec| (QREFELT % 67))
                 (LETT |eps|
                       (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
                 (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                 (LETT |res|
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT % 28))
                                  (SPADCALL (QREFELT % 57)) (QREFELT % 29))
                        (SPADCALL |ll| (QREFELT % 54)) (QREFELT % 71)))
                 (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|))))))) 

(SDEFUN |FELFUN;sin1| ((|z| (|Float|)) (% (|Float|)))
        (SPROG ((|z1| (|Float|)))
               (SEQ
                (COND
                 ((OR (SPADCALL |z| (|spadConstant| % 19) (QREFELT % 16))
                      (SPADCALL |z| (SPADCALL 2 0 10 (QREFELT % 14))
                                (QREFELT % 73)))
                  (SPADCALL (|spadConstant| % 19) (SPADCALL |z| (QREFELT % 37))
                            (QREFELT % 22)))
                 ('T
                  (SEQ
                   (LETT |z1|
                         (SPADCALL |z|
                                   (SPADCALL (SPADCALL (QREFELT % 57))
                                             (SPADCALL 2 0 10 (QREFELT % 14))
                                             (QREFELT % 21))
                                   (QREFELT % 22)))
                   (LETT |z1| (SPADCALL |z1| 2 (QREFELT % 26)))
                   (EXIT
                    (SPADCALL 2
                              (SPADCALL (SPADCALL |z1| (QREFELT % 37)) 2
                                        (QREFELT % 74))
                              (QREFELT % 18))))))))) 

(SDEFUN |FELFUN;sn21| ((|z| (|Float|)) (|ll| (|List| (|Float|))) (% (|Float|)))
        (SPROG
         ((|k| NIL) (#1=#:G127 NIL) (|res0| (|Float|)) (|kres| (|Float|))
          (|res| (|Float|)))
         (SEQ (LETT |res| (|FELFUN;sin1| |z| %))
              (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |res0|
                          (SPADCALL (|spadConstant| % 19) |res|
                                    (QREFELT % 22)))
                    (LETT |kres| (SPADCALL |k| |res| (QREFELT % 33)))
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (SPADCALL |res| |kres| (QREFELT % 22))
                                      (SPADCALL |kres| |res| (QREFELT % 33))
                                      (QREFELT % 20))
                            (SPADCALL (|spadConstant| % 19)
                                      (SPADCALL |k|
                                                (SPADCALL |res0| 2
                                                          (QREFELT % 23))
                                                (QREFELT % 33))
                                      (QREFELT % 20))
                            (QREFELT % 21)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FELFUN;sn1|
        ((|z| (|Float|)) (|m| (|Float|)) (|prec| (|PositiveInteger|))
         (% (|Float|)))
        (SPROG
         ((|eps| (|Float|)) (|kp| (|Float|)) (|kp1| #1=(|Float|))
          (|m1| (|Float|)) (|sign| (|Float|)) (|z0| (|Float|))
          (|res| (|Float|)) (|res1| (|Float|)) (|ll| (|List| (|Float|)))
          (|kk| (|Float|)) (|z1| #1#))
         (SEQ
          (COND
           ((OR (SPADCALL |m| (SPADCALL 8 -1 10 (QREFELT % 14)) (QREFELT % 73))
                (SPADCALL |m|
                          (SPADCALL (SPADCALL 4 0 10 (QREFELT % 14))
                                    (QREFELT % 75))
                          (QREFELT % 16)))
            (SEQ (LETT |prec| (+ |prec| 20))
                 (EXIT (SPADCALL |prec| (QREFELT % 67))))))
          (LETT |eps| (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
          (EXIT
           (COND
            ((SPADCALL |m|
                       (SPADCALL (SPADCALL 48 0 10 (QREFELT % 14))
                                 (QREFELT % 75))
                       (QREFELT % 16))
             (SEQ
              (LETT |kp|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 19) |m| (QREFELT % 22))
                     (QREFELT % 17)))
              (LETT |kp1|
                    (SPADCALL (SPADCALL 2 0 10 (QREFELT % 14))
                              (SPADCALL (|spadConstant| % 19) |kp|
                                        (QREFELT % 20))
                              (QREFELT % 21)))
              (LETT |m1|
                    (SPADCALL (SPADCALL 2 |kp1| (QREFELT % 18))
                              (SPADCALL |kp1| 2 (QREFELT % 23))
                              (QREFELT % 22)))
              (LETT |z| (SPADCALL |z| |kp1| (QREFELT % 21))) (LETT |ll| NIL)
              (COND
               ((SPADCALL |m1| (SPADCALL 25 -2 10 (QREFELT % 14))
                          (QREFELT % 16))
                (SEQ (LETT |ll| (SPADCALL |m1| |ll| (QREFELT % 25)))
                     (LETT |m|
                           (SPADCALL (|spadConstant| % 19) (|SPADfirst| |ll|)
                                     (QREFELT % 22)))
                     (EXIT
                      (LETT |ll|
                            (SPADCALL |m| (CDR |ll|) |eps| (QREFELT % 30))))))
               (#2='T
                (LETT |ll|
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 19) |m1| (QREFELT % 22))
                       |eps| (QREFELT % 32)))))
              (LETT |kk| (SPADCALL |ll| (QREFELT % 36)))
              (LETT |z1| (SPADCALL |z| |kk| (QREFELT % 21)))
              (LETT |z1| (|FELFUN;pimod| |z1| %))
              (COND
               ((SPADCALL |z1| (|spadConstant| % 64) (QREFELT % 16))
                (SEQ
                 (LETT |sign| (SPADCALL (|spadConstant| % 19) (QREFELT % 75)))
                 (EXIT (LETT |z1| (SPADCALL |z1| (QREFELT % 75))))))
               (#2# (LETT |sign| (|spadConstant| % 19))))
              (LETT |z0| (SPADCALL |z1| |kk| (QREFELT % 33)))
              (EXIT
               (COND
                ((SPADCALL |z0| (SPADCALL 5 -1 10 (QREFELT % 14))
                           (QREFELT % 16))
                 (SEQ (LETT |res| (SPADCALL |z1| |ll| (QREFELT % 39)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |sign| |kp1| (QREFELT % 33)) |res|
                                  (QREFELT % 33))
                        (SPADCALL (|spadConstant| % 19)
                                  (SPADCALL
                                   (SPADCALL |kp1| (|spadConstant| % 19)
                                             (QREFELT % 22))
                                   (SPADCALL |res| 2 (QREFELT % 23))
                                   (QREFELT % 33))
                                  (QREFELT % 20))
                        (QREFELT % 21)))))
                (#2#
                 (SEQ (LETT |res1| (|FELFUN;sn21| |z1| |ll| %))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |sign| |kp1| (QREFELT % 33))
                                  (SPADCALL (|spadConstant| % 19) |res1|
                                            (QREFELT % 22))
                                  (QREFELT % 33))
                        (SPADCALL |kp1|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |kp1| (|spadConstant| % 19)
                                              (QREFELT % 22))
                                    (SPADCALL |res1|
                                              (SPADCALL 2 0 10 (QREFELT % 14))
                                              (QREFELT % 22))
                                    (QREFELT % 33))
                                   |res1| (QREFELT % 33))
                                  (QREFELT % 20))
                        (QREFELT % 21)))))))))
            (#2#
             (SEQ (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                  (LETT |kk| (SPADCALL |ll| (QREFELT % 36)))
                  (LETT |z1| (SPADCALL |z| |kk| (QREFELT % 21)))
                  (EXIT (SPADCALL |z1| |ll| (QREFELT % 39)))))))))) 

(SDEFUN |FELFUN;cn1|
        ((|z| (|Float|)) (|m| (|Float|)) (|prec| (|PositiveInteger|))
         (% (|Float|)))
        (SPROG
         ((|eps| (|Float|)) (|ll| (|List| (|Float|))) (|kk| (|Float|))
          (|z1| (|Float|)) (|pih| (|Float|)) (|z2| (|Float|))
          (|nn| (|Integer|)) (|sgn| (|Float|)) (|res0| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL |z| (|spadConstant| % 64) (QREFELT % 16))
            (LETT |z| (SPADCALL |z| (QREFELT % 75)))))
          (LETT |prec| (* 2 |prec|))
          (COND
           ((OR (SPADCALL |m| (SPADCALL 8 -1 10 (QREFELT % 14)) (QREFELT % 73))
                (SPADCALL |m|
                          (SPADCALL (SPADCALL 4 0 10 (QREFELT % 14))
                                    (QREFELT % 75))
                          (QREFELT % 16)))
            (LETT |prec| (+ |prec| 20))))
          (SPADCALL |prec| (QREFELT % 67))
          (LETT |eps| (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
          (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
          (LETT |kk| (SPADCALL |ll| (QREFELT % 36)))
          (LETT |z1| (SPADCALL |z| |kk| (QREFELT % 21)))
          (LETT |pih|
                (SPADCALL (SPADCALL 5 -1 10 (QREFELT % 14))
                          (SPADCALL (QREFELT % 57)) (QREFELT % 33)))
          (LETT |nn|
                (SPADCALL
                 (SPADCALL (SPADCALL |z1| |pih| (QREFELT % 21)) (QREFELT % 58))
                 (QREFELT % 59)))
          (COND
           ((ODDP |nn|)
            (SEQ
             (LETT |z2|
                   (SPADCALL |z1| (SPADCALL |nn| |pih| (QREFELT % 60))
                             (QREFELT % 22)))
             (LETT |nn| (|quotient_INT| |nn| 2))
             (LETT |sgn|
                   (COND ((ODDP |nn|) (|spadConstant| % 19))
                         (#1='T
                          (SPADCALL (|spadConstant| % 19) (QREFELT % 75)))))
             (EXIT
              (LETT |sgn|
                    (SPADCALL (SPADCALL |z2| (QREFELT % 76)) |sgn|
                              (QREFELT % 60))))))
           (#1#
            (SEQ (LETT |nn| (|quotient_INT| |nn| 2))
                 (EXIT
                  (LETT |sgn|
                        (COND
                         ((ODDP |nn|)
                          (SPADCALL (|spadConstant| % 19) (QREFELT % 75)))
                         (#1# (|spadConstant| % 19))))))))
          (LETT |res0| (SPADCALL |z1| |ll| (QREFELT % 39)))
          (EXIT
           (SPADCALL |sgn|
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 19)
                                (SPADCALL |res0| 2 (QREFELT % 23))
                                (QREFELT % 22))
                      (QREFELT % 17))
                     (QREFELT % 33)))))) 

(SDEFUN |FELFUN;dn1|
        ((|z| (|Float|)) (|m| (|Float|)) (|prec| (|PositiveInteger|))
         (% (|Float|)))
        (SPROG ((|res0| (|Float|)))
               (SEQ (LETT |prec| (* 2 |prec|)) (SPADCALL |prec| (QREFELT % 67))
                    (LETT |res0| (|FELFUN;sn1| |z| |m| |prec| %))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 19)
                                (SPADCALL |m|
                                          (SPADCALL |res0| 2 (QREFELT % 23))
                                          (QREFELT % 33))
                                (QREFELT % 22))
                      (QREFELT % 17)))))) 

(SDEFUN |FELFUN;jacobi_imaginary|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|iu| (|Complex| (|Float|))) (|pl| (|List| (|Complex| (|Float|))))
          (|cc| (|Complex| (|Float|))))
         (SEQ
          (LETT |iu|
                (SPADCALL (|spadConstant| % 64)
                          (SPADCALL 1 0 10 (QREFELT % 14)) (QREFELT % 78)))
          (LETT |pl|
                (|FELFUN;sn_cn_dn|
                 (SPADCALL (SPADCALL |iu| |z| (QREFELT % 51)) (QREFELT % 79))
                 (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 44)) %))
          (LETT |cc| (SPADCALL |pl| 3 (QREFELT % 80)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80)) (|spadConstant| % 31)
                       (QREFELT % 69))
             (COND
              ((SPADCALL |cc| (|spadConstant| % 77) (QREFELT % 69))
               (SEQ (LETT |cc| (SPADCALL |pl| 2 (QREFELT % 80)))
                    (EXIT
                     (LIST (|spadConstant| % 77) (|spadConstant| % 31)
                           (SPADCALL (|spadConstant| % 31) |cc| (QREFELT % 43))
                           (SPADCALL (SPADCALL |pl| 4 (QREFELT % 80)) |cc|
                                     (QREFELT % 43))))))
              (#1='T
               (LIST (|spadConstant| % 31)
                     (SPADCALL
                      (SPADCALL |iu| (SPADCALL |pl| 2 (QREFELT % 80))
                                (QREFELT % 51))
                      |cc| (QREFELT % 43))
                     (SPADCALL (|spadConstant| % 31) |cc| (QREFELT % 43))
                     (SPADCALL (SPADCALL |pl| 4 (QREFELT % 80)) |cc|
                               (QREFELT % 43))))))
            (#1#
             (LIST (|spadConstant| % 31)
                   (SPADCALL
                    (SPADCALL |iu| (SPADCALL |pl| 2 (QREFELT % 80))
                              (QREFELT % 51))
                    |cc| (QREFELT % 43))
                   (|spadConstant| % 77)
                   (SPADCALL (SPADCALL |pl| 4 (QREFELT % 80)) |cc|
                             (QREFELT % 43))))))))) 

(SDEFUN |FELFUN;sn_cn_dn|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% #1=(|List| (|Complex| (|Float|)))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|cc| (|Complex| (|Float|))) (|k| #2=(|Complex| (|Float|)))
          (|pl| #1#) (|res| (|List| #3=(|Complex| (|Float|))))
          (|eps| (|Float|)) (|ll| (|List| (|Complex| (|Float|))))
          (|kk| #4=(|Complex| (|Float|))) (|m1| #5=(|Complex| (|Float|)))
          (|ms0| #2#) (|mp| #5#) (|kn| #3#)
          (|ll2| (|List| (|Complex| (|Float|)))) (|kk2| #4#) (|ppi| (|Float|))
          (|tau| #3#) (|itau| #6=(|Float|)) (|iz1| #6#) (|z1| #3#)
          (|zz1| (|Complex| (|Float|))) (|ctwo| (|Complex| (|Float|)))
          (|s2| #7=(|Complex| (|Float|))) (|ms2| (|Complex| (|Float|)))
          (|den| #5#) (|iu| (|Complex| (|Float|)))
          (|#G73| #8=(|Complex| (|Float|))) (|#G74| #8#) (|#G75| #3#)
          (|nr| #9=(|Integer|)) (|ms1| #2#) (|#G76| #3#) (|#G77| #8#)
          (|#G78| #3#) (|#G79| #7#) (|#G80| #8#) (|#G81| #8#) (|s1| #7#)
          (|c1| #3#) (|d1| #3#) (|ni| #9#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 77) (QREFELT % 69))
            (LIST (|spadConstant| % 31) (SPADCALL |z| (QREFELT % 55))
                  (SPADCALL |z| (QREFELT % 81)) (|spadConstant| % 31)))
           (#10='T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (LETT |prec| (+ |obits| 20))
                 (EXIT
                  (COND
                   ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
                    (SEQ (LETT |cc| (SPADCALL |z| (QREFELT % 82)))
                         (LETT |res|
                               (COND
                                ((SPADCALL |cc| (|spadConstant| % 77)
                                           (QREFELT % 69))
                                 (SEQ
                                  (LETT |cc|
                                        (SPADCALL (|spadConstant| % 31)
                                                  (SPADCALL |z| (QREFELT % 83))
                                                  (QREFELT % 43)))
                                  (EXIT
                                   (LIST (|spadConstant| % 77)
                                         (|spadConstant| % 31) |cc| |cc|))))
                                (#10#
                                 (SEQ
                                  (LETT |cc|
                                        (SPADCALL (|spadConstant| % 31) |cc|
                                                  (QREFELT % 43)))
                                  (EXIT
                                   (LIST (|spadConstant| % 31)
                                         (SPADCALL |z| (QREFELT % 84)) |cc|
                                         |cc|))))))
                         (EXIT |res|)))
                   ((SPADCALL
                     (SPADCALL
                      (SPADCALL |m| (|spadConstant| % 31) (QREFELT % 44))
                      (QREFELT % 11))
                     (SPADCALL 5 -1 10 (QREFELT % 14)) (QREFELT % 16))
                    (|FELFUN;jacobi_imaginary| |z| |m| %))
                   ((SPADCALL (SPADCALL |m| (QREFELT % 11))
                              (|spadConstant| % 19) (QREFELT % 73))
                    (SEQ
                     (LETT |m|
                           (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 43)))
                     (LETT |k| (SPADCALL |m| (QREFELT % 40)))
                     (LETT |z| (SPADCALL |z| |k| (QREFELT % 43)))
                     (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| %))
                     (LETT |res|
                           (COND
                            ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80))
                                       (|spadConstant| % 31) (QREFELT % 69))
                             (LIST (|spadConstant| % 31)
                                   (SPADCALL |k|
                                             (SPADCALL |pl| 2 (QREFELT % 80))
                                             (QREFELT % 51))
                                   (SPADCALL |pl| 4 (QREFELT % 80))
                                   (SPADCALL |pl| 3 (QREFELT % 80))))
                            (#10#
                             (LIST (|spadConstant| % 77) (|spadConstant| % 31)
                                   (SPADCALL (SPADCALL |pl| 4 (QREFELT % 80))
                                             |k| (QREFELT % 43))
                                   (SPADCALL (SPADCALL |pl| 3 (QREFELT % 80))
                                             |k| (QREFELT % 43))))))
                     (EXIT |res|)))
                   ((SPADCALL (SPADCALL |m| (QREFELT % 85))
                              (SPADCALL 5 -1 10 (QREFELT % 14)) (QREFELT % 73))
                    (|FELFUN;jacobi_imaginary| |z| |m| %))
                   (#10#
                    (SEQ
                     (LETT |eps|
                           (SPADCALL 1 (- (|quotient_INT| |prec| 2))
                                     (QREFELT % 63)))
                     (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                     (LETT |kk| (SPADCALL |ll| (QREFELT % 54)))
                     (LETT |z1| (SPADCALL |z| |kk| (QREFELT % 43)))
                     (LETT |m1|
                           (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 44)))
                     (LETT |ms0| (SPADCALL |m| (QREFELT % 40)))
                     (COND
                      ((SPADCALL (SPADCALL |ms0| (QREFELT % 11))
                                 (SPADCALL 25 -2 10 (QREFELT % 14))
                                 (QREFELT % 16))
                       (SEQ
                        (LETT |kn|
                              (SPADCALL (SPADCALL 2 |ms0| (QREFELT % 41))
                                        (SPADCALL (|spadConstant| % 31) |ms0|
                                                  (QREFELT % 42))
                                        (QREFELT % 43)))
                        (LETT |ll2|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |kn| (QREFELT % 41))
                                         (SPADCALL |kn| 2 (QREFELT % 45))
                                         (QREFELT % 44))
                               (LIST
                                (SPADCALL (|spadConstant| % 31) |kn|
                                          (QREFELT % 44)))
                               (QREFELT % 47)))
                        (LETT |mp|
                              (SPADCALL (|spadConstant| % 31)
                                        (|SPADfirst| |ll2|) (QREFELT % 44)))
                        (EXIT
                         (LETT |ll2|
                               (SPADCALL |mp| (CDR |ll2|) |eps|
                                         (QREFELT % 49))))))
                      (#10#
                       (SEQ
                        (LETT |kn|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 31) |ms0|
                                         (QREFELT % 44))
                               (SPADCALL (|spadConstant| % 31) |ms0|
                                         (QREFELT % 42))
                               (QREFELT % 43)))
                        (EXIT
                         (LETT |ll2|
                               (SPADCALL (SPADCALL |kn| 2 (QREFELT % 45))
                                         (LIST |kn|) |eps| (QREFELT % 49)))))))
                     (LETT |iu|
                           (SPADCALL (|spadConstant| % 64)
                                     (SPADCALL 1 0 10 (QREFELT % 14))
                                     (QREFELT % 78)))
                     (LETT |kk2| (SPADCALL |ll2| (QREFELT % 54)))
                     (LETT |ppi|
                           (SPADCALL (SPADCALL (QREFELT % 57)) 2
                                     (QREFELT % 26)))
                     (LETT |z1|
                           (SPADCALL |z| (SPADCALL |kk| |ppi| (QREFELT % 86))
                                     (QREFELT % 43)))
                     (LETT |tau|
                           (SPADCALL (SPADCALL |iu| |kk2| (QREFELT % 51)) |kk|
                                     (QREFELT % 43)))
                     (LETT |itau| (SPADCALL |tau| (QREFELT % 87)))
                     (LETT |iz1| (SPADCALL |z1| (QREFELT % 87)))
                     (LETT |ni|
                           (SPADCALL
                            (SPADCALL (SPADCALL |iz1| |itau| (QREFELT % 21))
                                      (QREFELT % 58))
                            (QREFELT % 59)))
                     (LETT |z1|
                           (SPADCALL |z1| (SPADCALL |ni| |tau| (QREFELT % 88))
                                     (QREFELT % 44)))
                     (LETT |nr|
                           (SPADCALL
                            (SPADCALL (SPADCALL |z1| (QREFELT % 85))
                                      (QREFELT % 58))
                            (QREFELT % 59)))
                     (LETT |z1|
                           (SPADCALL |z1|
                                     (SPADCALL (SPADCALL |nr| (QREFELT % 89))
                                               (QREFELT % 90))
                                     (QREFELT % 44)))
                     (LETT |zz1| (SPADCALL |ppi| |z1| (QREFELT % 71)))
                     (LETT |s1| (SPADCALL |zz1| |ll| (QREFELT % 56)))
                     (LETT |ctwo|
                           (SPADCALL (SPADCALL 2 0 10 (QREFELT % 14))
                                     (QREFELT % 90)))
                     (LETT |s2|
                           (SPADCALL (SPADCALL |zz1| |ctwo| (QREFELT % 43))
                                     |ll| (QREFELT % 56)))
                     (LETT |s2| (SPADCALL |s2| |s2| (QREFELT % 51)))
                     (LETT |ms2| (SPADCALL |m| |s2| (QREFELT % 51)))
                     (LETT |den|
                           (SPADCALL (|spadConstant| % 31)
                                     (SPADCALL |ms2| |s2| (QREFELT % 51))
                                     (QREFELT % 44)))
                     (LETT |c1|
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 31)
                                      (SPADCALL |s2|
                                                (SPADCALL |ctwo| |ms2|
                                                          (QREFELT % 44))
                                                (QREFELT % 51))
                                      (QREFELT % 44))
                            |den| (QREFELT % 43)))
                     (LETT |d1|
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 31)
                                      (SPADCALL |ms2|
                                                (SPADCALL |ctwo| |s2|
                                                          (QREFELT % 44))
                                                (QREFELT % 51))
                                      (QREFELT % 44))
                            |den| (QREFELT % 43)))
                     (LETT |ni| (SPADCALL |ni| 4 (QREFELT % 91)))
                     (LETT |nr| (SPADCALL |nr| 4 (QREFELT % 91)))
                     (LETT |iu|
                           (SPADCALL (|spadConstant| % 64)
                                     (SPADCALL 1 0 10 (QREFELT % 14))
                                     (QREFELT % 78)))
                     (COND
                      ((>= |nr| 2)
                       (SEQ
                        (PROGN
                         (LETT |#G73| (SPADCALL |s1| (QREFELT % 79)))
                         (LETT |#G74| (SPADCALL |c1| (QREFELT % 79)))
                         (LETT |#G75| |d1|)
                         (LETT |s1| |#G73|)
                         (LETT |c1| |#G74|)
                         (LETT |d1| |#G75|))
                        (EXIT (LETT |nr| (- |nr| 2))))))
                     (COND
                      ((EQL |nr| 1)
                       (SEQ (LETT |ms1| (SPADCALL |m1| (QREFELT % 40)))
                            (EXIT
                             (PROGN
                              (LETT |#G76| (SPADCALL |c1| |d1| (QREFELT % 43)))
                              (LETT |#G77|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |ms1| |s1| (QREFELT % 51)) |d1|
                                      (QREFELT % 43))
                                     (QREFELT % 79)))
                              (LETT |#G78|
                                    (SPADCALL |ms1| |d1| (QREFELT % 43)))
                              (LETT |s1| |#G76|)
                              (LETT |c1| |#G77|)
                              (LETT |d1| |#G78|))))))
                     (COND
                      ((>= |ni| 2)
                       (SEQ
                        (PROGN
                         (LETT |#G79| |s1|)
                         (LETT |#G80| (SPADCALL |c1| (QREFELT % 79)))
                         (LETT |#G81| (SPADCALL |d1| (QREFELT % 79)))
                         (LETT |s1| |#G79|)
                         (LETT |c1| |#G80|)
                         (LETT |d1| |#G81|))
                        (EXIT (LETT |ni| (- |ni| 2))))))
                     (EXIT
                      (COND
                       ((EQL |ni| 0)
                        (LIST (|spadConstant| % 31) |s1| |c1| |d1|))
                       ((SPADCALL |s1| (|spadConstant| % 77) (QREFELT % 69))
                        (LIST (|spadConstant| % 77) (|spadConstant| % 31)
                              (SPADCALL (SPADCALL |iu| |d1| (QREFELT % 51))
                                        (QREFELT % 79))
                              (SPADCALL (SPADCALL |iu| |ms0| (QREFELT % 51))
                                        (QREFELT % 79))))
                       (#10#
                        (LIST (|spadConstant| % 31)
                              (SPADCALL (|spadConstant| % 31)
                                        (SPADCALL |ms0| |s1| (QREFELT % 51))
                                        (QREFELT % 43))
                              (SPADCALL
                               (SPADCALL (SPADCALL |iu| |d1| (QREFELT % 51))
                                         (SPADCALL |ms0| |s1| (QREFELT % 51))
                                         (QREFELT % 43))
                               (QREFELT % 79))
                              (SPADCALL
                               (SPADCALL (SPADCALL |iu| |c1| (QREFELT % 51))
                                         |s1| (QREFELT % 43))
                               (QREFELT % 79)))))))))))))))) 

(SDEFUN |FELFUN;jacobiSn;3C;24|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|pl| (|List| (|Complex| (|Float|)))))
               (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| %))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80))
                                 (|spadConstant| % 77) (QREFELT % 69))
                       (|error| "pole of jacobiSn"))
                      ('T (SPADCALL |pl| 2 (QREFELT % 80)))))))) 

(SDEFUN |FELFUN;jacobiCn;3C;25|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|pl| (|List| (|Complex| (|Float|)))))
               (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| %))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80))
                                 (|spadConstant| % 77) (QREFELT % 69))
                       (|error| "pole of jacobiCn"))
                      ('T (SPADCALL |pl| 3 (QREFELT % 80)))))))) 

(SDEFUN |FELFUN;jacobiDn;3C;26|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|pl| (|List| (|Complex| (|Float|)))))
               (SEQ (LETT |pl| (|FELFUN;sn_cn_dn| |z| |m| %))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80))
                                 (|spadConstant| % 77) (QREFELT % 69))
                       (|error| "pole of jacobiDn"))
                      ('T (SPADCALL |pl| 4 (QREFELT % 80)))))))) 

(SDEFUN |FELFUN;jacobiSn;3F;27| ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|k| (|Float|)) (|res| (|Float|)))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
              (LETT |prec| (+ |obits| 20))
              (EXIT
               (COND
                ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT % 14)) (QREFELT % 95))
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (LETT |res| (SPADCALL |z| (QREFELT % 96)))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))
                (#1='T
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (COND
                       ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                        (SEQ
                         (LETT |m|
                               (SPADCALL (|spadConstant| % 19) |m|
                                         (QREFELT % 21)))
                         (LETT |k| (SPADCALL |m| (QREFELT % 17)))
                         (LETT |z| (SPADCALL |z| |k| (QREFELT % 21)))
                         (EXIT
                          (LETT |res|
                                (SPADCALL |k| (|FELFUN;sn1| |z| |m| |prec| %)
                                          (QREFELT % 33))))))
                       (#1# (LETT |res| (|FELFUN;sn1| |z| |m| |prec| %))))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))))))) 

(SDEFUN |FELFUN;jacobiCn;3F;28| ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|k| (|Float|)) (|res| (|Float|)))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
              (LETT |prec| (+ |obits| 20))
              (EXIT
               (COND
                ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT % 14)) (QREFELT % 95))
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (LETT |res|
                            (SPADCALL (|spadConstant| % 19)
                                      (SPADCALL |z| (QREFELT % 98))
                                      (QREFELT % 21)))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))
                (#1='T
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (COND
                       ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                        (SEQ
                         (LETT |m|
                               (SPADCALL (|spadConstant| % 19) |m|
                                         (QREFELT % 21)))
                         (LETT |k| (SPADCALL |m| (QREFELT % 17)))
                         (LETT |z| (SPADCALL |z| |k| (QREFELT % 21)))
                         (EXIT (LETT |res| (|FELFUN;dn1| |z| |m| |prec| %)))))
                       (#1# (LETT |res| (|FELFUN;cn1| |z| |m| |prec| %))))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))))))) 

(SDEFUN |FELFUN;jacobiDn;3F;29| ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|k| (|Float|)) (|res| (|Float|)))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
              (LETT |prec| (+ |obits| 20))
              (EXIT
               (COND
                ((SPADCALL |m| (SPADCALL 1 0 10 (QREFELT % 14)) (QREFELT % 95))
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (LETT |res|
                            (SPADCALL (|spadConstant| % 19)
                                      (SPADCALL |z| (QREFELT % 98))
                                      (QREFELT % 21)))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))
                (#1='T
                 (SEQ (SPADCALL |prec| (QREFELT % 67))
                      (COND
                       ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                        (SEQ
                         (LETT |m|
                               (SPADCALL (|spadConstant| % 19) |m|
                                         (QREFELT % 21)))
                         (LETT |k| (SPADCALL |m| (QREFELT % 17)))
                         (LETT |z| (SPADCALL |z| |k| (QREFELT % 21)))
                         (EXIT (LETT |res| (|FELFUN;cn1| |z| |m| |prec| %)))))
                       (#1# (LETT |res| (|FELFUN;dn1| |z| |m| |prec| %))))
                      (SPADCALL |obits| (QREFELT % 67)) (EXIT |res|)))))))) 

(SDEFUN |FELFUN;zeta2|
        ((|z| (|Float|)) (|k0| (|Float|)) (|ll| (|List| (|Float|)))
         (% (|Float|)))
        (SPROG
         ((|pii| (|Float|)) (|nn| (|Integer|)) (|z1| (|Float|)) (|k| NIL)
          (#1=#:G198 NIL) (|k1| (|Float|)) (|k1inv| #2=(|Float|))
          (|p| #3=(|Float|)) (|snz2| #3#) (|k_snz2| #3#) (|snf_inv| #2#)
          (|r| (|Float|)) (|res| (|Float|)) (|snz| (|Float|)))
         (SEQ (LETT |res| (|spadConstant| % 64))
              (LETT |pii| (SPADCALL (QREFELT % 57)))
              (LETT |nn|
                    (SPADCALL
                     (SPADCALL (SPADCALL |z| |pii| (QREFELT % 21))
                               (QREFELT % 58))
                     (QREFELT % 59)))
              (LETT |z1|
                    (SPADCALL |z| (SPADCALL |nn| |pii| (QREFELT % 60))
                              (QREFELT % 22)))
              (LETT |snz| (SPADCALL |z1| (QREFELT % 37)))
              (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |k1|
                          (SPADCALL (|spadConstant| % 19) |k| (QREFELT % 20)))
                    (LETT |k1inv|
                          (SPADCALL (|spadConstant| % 19) |k1| (QREFELT % 21)))
                    (LETT |p|
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 19) |k| (QREFELT % 22))
                           |k1inv| (QREFELT % 33)))
                    (LETT |snz2| (SPADCALL |snz| |snz| (QREFELT % 33)))
                    (LETT |k_snz2| (SPADCALL |k| |snz2| (QREFELT % 33)))
                    (LETT |snf_inv|
                          (SPADCALL (|spadConstant| % 19)
                                    (SPADCALL (|spadConstant| % 19) |k_snz2|
                                              (QREFELT % 20))
                                    (QREFELT % 21)))
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 19) |snz2|
                                      (QREFELT % 22))
                            (SPADCALL (|spadConstant| % 19)
                                      (SPADCALL |k| |k_snz2| (QREFELT % 33))
                                      (QREFELT % 22))
                            (QREFELT % 33))
                           (QREFELT % 17)))
                    (LETT |r|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (|spadConstant| % 19) |p|
                                       (QREFELT % 22))
                             |snz| (QREFELT % 33))
                            |r| (QREFELT % 33))
                           |snf_inv| (QREFELT % 33)))
                    (LETT |res|
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |k1inv| (QREFELT % 18)) |res|
                                     (QREFELT % 33))
                           |r| (QREFELT % 20)))
                    (EXIT
                     (LETT |snz|
                           (SPADCALL (SPADCALL |k1| |snz| (QREFELT % 33))
                                     |snf_inv| (QREFELT % 33)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FELFUN;jacobiZeta;3F;31|
        ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Float|))) (|kk| (|Float|))
          (|z1| (|Float|)) (|res| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 64) (QREFELT % 95))
            (|spadConstant| % 64))
           ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 95))
            (SPADCALL |z| (QREFELT % 96)))
           (#1='T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (EXIT
                  (|finally|
                   (SEQ (LETT |prec| (+ |obits| 20))
                        (SPADCALL |prec| (QREFELT % 67))
                        (EXIT
                         (COND
                          ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                           (|error| "jacobiZeta: m > 1"))
                          (#1#
                           (SEQ
                            (LETT |eps|
                                  (|FELFUN;two_to_minus_n|
                                   (|quotient_INT| |prec| 2) %))
                            (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                            (LETT |kk| (SPADCALL |ll| (QREFELT % 36)))
                            (LETT |z1| (SPADCALL |z| |kk| (QREFELT % 21)))
                            (EXIT
                             (LETT |res|
                                   (|FELFUN;zeta2| |z1|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 19) |m|
                                               (QREFELT % 22))
                                     (QREFELT % 17))
                                    |ll| %))))))))
                   (SPADCALL |obits| (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;theta0|
        ((|tau| #1=(|Complex| (|Float|))) (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|prec| (|PositiveInteger|)) (|tresh| (|Float|)) (|otau| #1#)
          (|k| (|Integer|)) (|q2| #2=(|Complex| (|Float|)))
          (|q| #3=(|Complex| (|Float|))) (|rtd| (|Float|)) (#4=#:G217 NIL)
          (|liq2| (|List| (|Complex| (|Float|)))) (|iq2| #2#) (#5=#:G219 NIL)
          (|i| NIL) (#6=#:G218 NIL) (|nt3| #7=(|Complex| (|Float|))) (|pp| #3#)
          (|t2| (|Complex| (|Float|))) (|t3| #7#))
         (SEQ (LETT |prec| (SPADCALL (QREFELT % 66)))
              (LETT |tresh|
                    (SPADCALL
                     (SPADCALL (SPADCALL 38 100 (QREFELT % 28)) |prec|
                               (QREFELT % 102))
                     (QREFELT % 103)))
              (LETT |k| 0)
              (COND
               ((NULL
                 (SPADCALL (SPADCALL (|spadConstant| % 19) 2 (QREFELT % 26))
                           (SPADCALL |tau| (QREFELT % 87)) (QREFELT % 16)))
                (EXIT (|error| "imag(tau) must be bigger than 1/2"))))
              (LETT |otau| |tau|)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (SPADCALL |tau| (QREFELT % 87)) |tresh|
                                (QREFELT % 16)))
                     (GO G191)))
                   (SEQ
                    (LETT |tau|
                          (SPADCALL (SPADCALL 2 (QREFELT % 89)) |tau|
                                    (QREFELT % 71)))
                    (EXIT (LETT |k| (+ |k| 1))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |q2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (|spadConstant| % 19) 2 (QREFELT % 26))
                        (SPADCALL (QREFELT % 57)) (QREFELT % 33))
                       (SPADCALL (QREFELT % 104)) (QREFELT % 71))
                      |tau| (QREFELT % 51))
                     (QREFELT % 105)))
              (LETT |q| (SPADCALL |q2| |q2| (QREFELT % 51)))
              (LETT |t2|
                    (SPADCALL (SPADCALL 2 (QREFELT % 89))
                              (SPADCALL (|spadConstant| % 31)
                                        (SPADCALL |q| |q| (QREFELT % 51))
                                        (QREFELT % 42))
                              (QREFELT % 71)))
              (LETT |t3|
                    (SPADCALL (|spadConstant| % 31)
                              (SPADCALL (SPADCALL 2 (QREFELT % 89)) |q|
                                        (QREFELT % 71))
                              (QREFELT % 42)))
              (LETT |t2|
                    (SPADCALL (SPADCALL |q2| |t2| (QREFELT % 51)) |t2|
                              (QREFELT % 51)))
              (LETT |t3| (SPADCALL |t3| |t3| (QREFELT % 51)))
              (EXIT
               (COND ((EQL |k| 0) (LIST |t2| |t3|))
                     ('T
                      (SEQ
                       (LETT |rtd|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 19) 2
                                         (QREFELT % 26))
                               (SPADCALL (QREFELT % 57)) (QREFELT % 33))
                              (SPADCALL |otau| (QREFELT % 85)) (QREFELT % 33)))
                       (LETT |iq2|
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (SPADCALL (QREFELT % 104)) |rtd|
                                         (QREFELT % 86))
                               (QREFELT % 79))
                              (QREFELT % 105)))
                       (LETT |liq2| NIL)
                       (SEQ (LETT |i| 1) (LETT #4# |k|) G190
                            (COND ((|greater_SI| |i| #4#) (GO G191)))
                            (SEQ (LETT |liq2| (CONS |iq2| |liq2|))
                                 (EXIT
                                  (LETT |iq2|
                                        (SPADCALL |iq2| |iq2|
                                                  (QREFELT % 51)))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (SEQ (LETT #5# |liq2|) (LETT |i| 1) (LETT #6# |k|) G190
                            (COND
                             ((OR (|greater_SI| |i| #6#) (ATOM #5#)
                                  (PROGN (LETT |iq2| (CAR #5#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |nt3| (SPADCALL |t3| |t2| (QREFELT % 42)))
                             (LETT |t2|
                                   (SPADCALL (SPADCALL 2 (QREFELT % 89))
                                             (SPADCALL
                                              (SPADCALL |t2| |t3|
                                                        (QREFELT % 51))
                                              (QREFELT % 40))
                                             (QREFELT % 71)))
                             (LETT |pp| (SPADCALL |t2| |iq2| (QREFELT % 51)))
                             (COND
                              ((SPADCALL (SPADCALL |pp| (QREFELT % 85))
                                         (|spadConstant| % 64) (QREFELT % 16))
                               (LETT |t2| (SPADCALL |t2| (QREFELT % 79)))))
                             (EXIT (LETT |t3| |nt3|)))
                            (LETT |i|
                                  (PROG1 (|inc_SI| |i|) (LETT #5# (CDR #5#))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (LIST |t2| |t3|))))))))) 

(SDEFUN |FELFUN;modularInvariants|
        ((|tau| (|Complex| (|Float|))) (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|td| (|List| (|Complex| (|Float|)))) (|t2| #1=(|Complex| (|Float|)))
          (|t3| #1#) (|k| (|Complex| (|Float|))) (|m| #2=(|Complex| (|Float|)))
          (|m2| #2#) (|g2| #3=(|Complex| (|Float|))) (|g3| #3#))
         (SEQ (LETT |td| (|FELFUN;theta0| |tau| %))
              (LETT |t2| (|SPADfirst| |td|))
              (LETT |t3| (|SPADfirst| (CDR |td|)))
              (LETT |k| (SPADCALL |t2| |t3| (QREFELT % 43)))
              (LETT |m| (SPADCALL |k| |k| (QREFELT % 51)))
              (LETT |m2| (SPADCALL |m| |m| (QREFELT % 51)))
              (LETT |g2|
                    (SPADCALL
                     (SPADCALL (SPADCALL 4 3 (QREFELT % 28)) (QREFELT % 103))
                     (SPADCALL (SPADCALL |m2| |m| (QREFELT % 44))
                               (|spadConstant| % 31) (QREFELT % 42))
                     (QREFELT % 71)))
              (LETT |g3|
                    (SPADCALL
                     (SPADCALL (SPADCALL 4 27 (QREFELT % 28)) (QREFELT % 103))
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL 2 (QREFELT % 89)) |m|
                                   (QREFELT % 71))
                         |m2| (QREFELT % 51))
                        (SPADCALL (SPADCALL 3 (QREFELT % 89)) |m2|
                                  (QREFELT % 71))
                        (QREFELT % 44))
                       (SPADCALL (SPADCALL 3 (QREFELT % 89)) |m|
                                 (QREFELT % 71))
                       (QREFELT % 44))
                      (SPADCALL 2 (QREFELT % 106)) (QREFELT % 42))
                     (QREFELT % 71)))
              (EXIT (LIST |g2| |g3| |t3|))))) 

(SDEFUN |FELFUN;reduce_periods|
        ((|w1| #1=(|Complex| (|Float|))) (|w2| #2=(|Complex| (|Float|)))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|#G113| #2#) (|#G114| #1#) (|#G115| #3=(|Float|)) (|#G116| #3#)
          (|aw2| #3#) (|tau| (|Complex| (|Float|))) (|rit| (|Float|))
          (#4=#:G231 NIL) (|aw1| #3#))
         (SEQ
          (EXIT
           (SEQ (LETT |aw1| (SPADCALL |w1| (QREFELT % 11)))
                (LETT |aw2| (SPADCALL |w2| (QREFELT % 11)))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (COND
                        ((SPADCALL |aw2| |aw1| (QREFELT % 73))
                         (SEQ
                          (PROGN
                           (LETT |#G113| |w2|)
                           (LETT |#G114| |w1|)
                           (LETT |w1| |#G113|)
                           (LETT |w2| |#G114|))
                          (EXIT
                           (PROGN
                            (LETT |#G115| |aw2|)
                            (LETT |#G116| |aw1|)
                            (LETT |aw1| |#G115|)
                            (LETT |aw2| |#G116|))))))
                       (LETT |tau| (SPADCALL |w1| |w2| (QREFELT % 43)))
                       (COND
                        ((SPADCALL (SPADCALL |tau| (QREFELT % 87))
                                   (|spadConstant| % 64) (QREFELT % 16))
                         (SEQ (LETT |tau| (SPADCALL |tau| (QREFELT % 79)))
                              (EXIT
                               (LETT |w1| (SPADCALL |w1| (QREFELT % 79)))))))
                       (LETT |rit|
                             (SPADCALL (SPADCALL |tau| (QREFELT % 85))
                                       (QREFELT % 58)))
                       (EXIT
                        (COND
                         ((SPADCALL |rit| (|spadConstant| % 64) (QREFELT % 95))
                          (PROGN (LETT #4# (LIST |w1| |w2|)) (GO #5=#:G230)))
                         ('T
                          (SEQ
                           (LETT |w1|
                                 (SPADCALL |w1|
                                           (SPADCALL |rit| |w2| (QREFELT % 71))
                                           (QREFELT % 44)))
                           (EXIT
                            (COND
                             ((SPADCALL
                               (SPADCALL (SPADCALL 2 3 (QREFELT % 28))
                                         (QREFELT % 103))
                               (SPADCALL |tau| (QREFELT % 87)) (QREFELT % 16))
                              (PROGN (LETT #4# (LIST |w1| |w2|)) (GO #5#)))
                             ('T
                              (LETT |aw1|
                                    (SPADCALL |w1| (QREFELT % 11)))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #5# (EXIT #4#)))) 

(SDEFUN |FELFUN;modularInvariantJ;2C;35|
        ((|tau| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nw| (|List| (|Complex| (|Float|))))
          (|md| (|List| (|Complex| (|Float|)))) (|g2| #1=(|Complex| (|Float|)))
          (|g3| #1#) (|g2_3| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((NULL
             (SPADCALL (|spadConstant| % 64) (SPADCALL |tau| (QREFELT % 87))
                       (QREFELT % 16)))
            (|error| "need imag(tau) > 0"))
           ('T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (EXIT
                  (|finally|
                   (SEQ (SPADCALL (+ (* 3 |obits|) 20) (QREFELT % 67))
                        (LETT |nw|
                              (|FELFUN;reduce_periods| |tau|
                               (|spadConstant| % 31) %))
                        (SPADCALL (+ |obits| 20) (QREFELT % 67))
                        (LETT |tau|
                              (SPADCALL (SPADCALL |nw| 1 (QREFELT % 80))
                                        (SPADCALL |nw| 2 (QREFELT % 80))
                                        (QREFELT % 43)))
                        (LETT |md| (|FELFUN;modularInvariants| |tau| %))
                        (LETT |g2| (SPADCALL |md| 1 (QREFELT % 80)))
                        (LETT |g3| (SPADCALL |md| 2 (QREFELT % 80)))
                        (LETT |g2_3|
                              (SPADCALL (SPADCALL |g2| |g2| (QREFELT % 51))
                                        |g2| (QREFELT % 51)))
                        (EXIT
                         (SPADCALL (SPADCALL 1728 |g2_3| (QREFELT % 41))
                                   (SPADCALL |g2_3|
                                             (SPADCALL
                                              (SPADCALL 27 |g3| (QREFELT % 41))
                                              |g3| (QREFELT % 51))
                                             (QREFELT % 44))
                                   (QREFELT % 43))))
                   (SPADCALL |obits| (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;weierstrassInvariants;2CL;36|
        ((|w1| (|Complex| (|Float|))) (|w2| (|Complex| (|Float|)))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|nw| (|List| (|Complex| (|Float|))))
          (|tau| #1=(|Complex| (|Float|)))
          (|md| (|List| (|Complex| (|Float|)))) (|g2| #2=(|Complex| (|Float|)))
          (|g3| #2#) (|tf| #2#) (|s| #1#) (|s2| #3=(|Complex| (|Float|)))
          (|s4| #3#))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
              (EXIT
               (|finally|
                (SEQ (SPADCALL (+ (* 3 |obits|) 20) (QREFELT % 67))
                     (LETT |nw| (|FELFUN;reduce_periods| |w1| |w2| %))
                     (SPADCALL (+ |obits| 20) (QREFELT % 67))
                     (LETT |w1| (SPADCALL |nw| 1 (QREFELT % 80)))
                     (LETT |w2| (SPADCALL |nw| 2 (QREFELT % 80)))
                     (LETT |tau| (SPADCALL |w1| |w2| (QREFELT % 43)))
                     (LETT |md| (|FELFUN;modularInvariants| |tau| %))
                     (LETT |g2| (SPADCALL |md| 1 (QREFELT % 80)))
                     (LETT |g3| (SPADCALL |md| 2 (QREFELT % 80)))
                     (LETT |tf| (SPADCALL |md| 3 (QREFELT % 80)))
                     (LETT |s|
                           (SPADCALL
                            (SPADCALL (SPADCALL (QREFELT % 57)) |tf|
                                      (QREFELT % 71))
                            |w2| (QREFELT % 43)))
                     (LETT |s2| (SPADCALL |s| |s| (QREFELT % 51)))
                     (LETT |s4| (SPADCALL |s2| |s2| (QREFELT % 51)))
                     (EXIT
                      (LIST (SPADCALL |s4| |g2| (QREFELT % 51))
                            (SPADCALL (SPADCALL |s2| |s4| (QREFELT % 51)) |g3|
                                      (QREFELT % 51)))))
                (SPADCALL |obits| (QREFELT % 67))))))) 

(SDEFUN |FELFUN;ellipticF;3F;37|
        ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|m2| (|Float|)) (|z2| (|Float|))
          (|prec| (|PositiveInteger|)) (|eps| (|Float|))
          (|ll| (|List| (|Float|))) (|k| NIL) (#1=#:G250 NIL)
          (|delta| (|Float|)) (|res| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 95))
            (SPADCALL |z| (QREFELT % 109)))
           (#2='T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (EXIT
                  (COND
                   ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                    (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                         (LETT |m2| (SPADCALL |m| (QREFELT % 17)))
                         (LETT |z2| (SPADCALL |m2| |z| (QREFELT % 33)))
                         (EXIT
                          (COND
                           ((SPADCALL |z2| (|spadConstant| % 19)
                                      (QREFELT % 73))
                            (SEQ (SPADCALL |obits| (QREFELT % 67))
                                 (EXIT
                                  (|error| "ellipticF: abs(z) > 1/sqrt(m)"))))
                           (#2#
                            (SEQ
                             (LETT |res|
                                   (SPADCALL
                                    (SPADCALL |z2|
                                              (SPADCALL (|spadConstant| % 19)
                                                        |m| (QREFELT % 21))
                                              (QREFELT % 110))
                                    |m2| (QREFELT % 21)))
                             (SPADCALL |obits| (QREFELT % 67))
                             (EXIT |res|)))))))
                   ((SPADCALL |m| (|spadConstant| % 64) (QREFELT % 95))
                    (SPADCALL |z| (QREFELT % 111)))
                   (#2#
                    (COND
                     ((SPADCALL (SPADCALL |z| (QREFELT % 7))
                                (|spadConstant| % 19) (QREFELT % 73))
                      (|error| "ellipticF: abs(z) > 1"))
                     ((SPADCALL |z| (|spadConstant| % 19) (QREFELT % 95))
                      (SPADCALL |m| (QREFELT % 68)))
                     (#2#
                      (COND
                       ((SPADCALL |z|
                                  (SPADCALL (|spadConstant| % 19)
                                            (QREFELT % 75))
                                  (QREFELT % 95))
                        (SPADCALL (SPADCALL |m| (QREFELT % 68))
                                  (QREFELT % 75)))
                       (#2#
                        (SEQ (LETT |prec| (+ |obits| 20))
                             (SPADCALL |prec| (QREFELT % 67))
                             (LETT |eps|
                                   (|FELFUN;two_to_minus_n|
                                    (|quotient_INT| |prec| 2) %))
                             (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                             (LETT |res| (SPADCALL |ll| (QREFELT % 36)))
                             (LETT |ll| (NREVERSE |ll|))
                             (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |k| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (LETT |delta|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL (|spadConstant| % 19) |k|
                                                     (QREFELT % 20))
                                           2 (QREFELT % 74))
                                          (SPADCALL
                                           (SPADCALL 4 |k| (QREFELT % 18))
                                           (SPADCALL |z| 2 (QREFELT % 23))
                                           (QREFELT % 33))
                                          (QREFELT % 22)))
                                   (EXIT
                                    (LETT |z|
                                          (SPADCALL
                                           (SPADCALL 2 |z| (QREFELT % 18))
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 19) |k|
                                                      (QREFELT % 20))
                                            (SPADCALL |delta| (QREFELT % 17))
                                            (QREFELT % 20))
                                           (QREFELT % 21)))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |z| (QREFELT % 111))
                                             (QREFELT % 33)))
                             (SPADCALL |obits| (QREFELT % 67))
                             (EXIT |res|))))))))))))))) 

(SDEFUN |FELFUN;half_z|
        ((|z| #1=(|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|z0| #1#) (|z2| #2=(|Complex| (|Float|)))
          (|cnz| #3=(|Complex| (|Float|))) (|dnz| #3#)
          (|snf| (|Complex| (|Float|))) (|zz| #2#))
         (SEQ (LETT |z0| |z|) (LETT |z2| (SPADCALL |z| |z| (QREFELT % 51)))
              (LETT |z2|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 31)
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 31) |z2|
                                          (QREFELT % 44))
                                (QREFELT % 40))
                               (QREFELT % 44))
                     (SPADCALL (|spadConstant| % 31)
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 31)
                                          (SPADCALL |m| |z2| (QREFELT % 51))
                                          (QREFELT % 44))
                                (QREFELT % 40))
                               (QREFELT % 42))
                     (QREFELT % 43)))
              (LETT |cnz|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 31) |z2| (QREFELT % 44))
                     (QREFELT % 40)))
              (LETT |dnz|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 31)
                               (SPADCALL |m| |z2| (QREFELT % 51))
                               (QREFELT % 44))
                     (QREFELT % 40)))
              (LETT |snf|
                    (SPADCALL (SPADCALL |cnz| |dnz| (QREFELT % 51))
                              (SPADCALL (|spadConstant| % 31)
                                        (SPADCALL
                                         (SPADCALL |m| |z2| (QREFELT % 51))
                                         |z2| (QREFELT % 51))
                                        (QREFELT % 44))
                              (QREFELT % 43)))
              (LETT |z| (SPADCALL |z2| (QREFELT % 40)))
              (LETT |zz| (SPADCALL |z| |snf| (QREFELT % 51)))
              (COND
               ((SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |z0| (QREFELT % 112)) |zz|
                            (QREFELT % 51))
                  (QREFELT % 85))
                 (|spadConstant| % 64) (QREFELT % 16))
                (LETT |z| (SPADCALL |z| (QREFELT % 79)))))
              (EXIT |z|)))) 

(SDEFUN |FELFUN;ellipticF_aux|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|m2| (|Complex| (|Float|)))
          (|z2| (|Complex| (|Float|))) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|res| (|Complex| (|Float|)))
          (|ll| (|List| (|Complex| (|Float|)))) (|nz| (|Float|))
          (|sf| (|Float|)) (|k| NIL) (#1=#:G264 NIL)
          (|delta| (|Complex| (|Float|))))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
            (SPADCALL |z| (QREFELT % 113)))
           (#2='T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (EXIT
                  (COND
                   ((SPADCALL (SPADCALL |m| (QREFELT % 11))
                              (|spadConstant| % 19) (QREFELT % 73))
                    (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                         (LETT |m2| (SPADCALL |m| (QREFELT % 40)))
                         (LETT |z2| (SPADCALL |m2| |z| (QREFELT % 51)))
                         (EXIT
                          (SPADCALL
                           (|FELFUN;ellipticF_aux| |z2|
                            (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 43))
                            %)
                           |m2| (QREFELT % 43)))))
                   ((SPADCALL |m| (|spadConstant| % 77) (QREFELT % 69))
                    (SPADCALL |z| (QREFELT % 114)))
                   ((SPADCALL |z| (|spadConstant| % 31) (QREFELT % 69))
                    (SPADCALL |m| (QREFELT % 72)))
                   (#2#
                    (COND
                     ((SPADCALL |z|
                                (SPADCALL (|spadConstant| % 31) (QREFELT % 79))
                                (QREFELT % 69))
                      (SPADCALL (SPADCALL |m| (QREFELT % 72)) (QREFELT % 79)))
                     (#2#
                      (SEQ (LETT |prec| (+ |obits| 20))
                           (SPADCALL |prec| (QREFELT % 67))
                           (LETT |eps|
                                 (|FELFUN;two_to_minus_n|
                                  (|quotient_INT| |prec| 2) %))
                           (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                           (LETT |res| (SPADCALL |ll| (QREFELT % 54)))
                           (LETT |ll| (NREVERSE |ll|))
                           (LETT |sf| (|spadConstant| % 19))
                           (LETT |nz| (SPADCALL |z| (QREFELT % 115)))
                           (COND
                            ((SPADCALL (|spadConstant| % 19) |nz|
                                       (QREFELT % 16))
                             (SEQ (LETT |z| (|FELFUN;half_z| |z| |m| %))
                                  (EXIT
                                   (LETT |sf| (SPADCALL 2 (QREFELT % 89)))))))
                           (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |k| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |delta|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 31) |k|
                                                   (QREFELT % 42))
                                         2 (QREFELT % 116))
                                        (SPADCALL
                                         (SPADCALL 4 |k| (QREFELT % 41))
                                         (SPADCALL |z| 2 (QREFELT % 45))
                                         (QREFELT % 51))
                                        (QREFELT % 44)))
                                 (EXIT
                                  (LETT |z|
                                        (SPADCALL
                                         (SPADCALL 2 |z| (QREFELT % 41))
                                         (SPADCALL
                                          (SPADCALL (|spadConstant| % 31) |k|
                                                    (QREFELT % 42))
                                          (SPADCALL |delta| (QREFELT % 40))
                                          (QREFELT % 42))
                                         (QREFELT % 43)))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL (SPADCALL |sf| |res| (QREFELT % 71))
                                      (SPADCALL |z| (QREFELT % 114))
                                      (QREFELT % 51))))))))))))))) 

(SDEFUN |FELFUN;ellipticF;3C;40|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
                  (SPADCALL |z| (QREFELT % 113)))
                 ('T
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                       (EXIT
                        (|finally| (|FELFUN;ellipticF_aux| |z| |m| %)
                                   (SPADCALL |obits| (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;ellipticE;2F;41| ((|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Float|))) (|k| NIL) (#1=#:G272 NIL)
          (|k1| (|Float|)) (|f_val| #2=(|Float|)) (|k1inv| (|Float|))
          (|p| (|Float|)) (|e_val| #2#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 65))
            (|error| "ellipticE: m >=1"))
           ((SPADCALL |m| (|spadConstant| % 64) (QREFELT % 95))
            (SPADCALL (SPADCALL (QREFELT % 57)) 2 (QREFELT % 26)))
           ('T
            (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                 (LETT |prec| (+ |obits| 20)) (SPADCALL |prec| (QREFELT % 67))
                 (LETT |eps|
                       (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
                 (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                 (LETT |f_val|
                       (LETT |e_val|
                             (SPADCALL (SPADCALL (QREFELT % 57)) 2
                                       (QREFELT % 26))))
                 (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (LETT |k1|
                             (SPADCALL (|spadConstant| % 19) |k|
                                       (QREFELT % 20)))
                       (LETT |f_val| (SPADCALL |k1| |f_val| (QREFELT % 33)))
                       (LETT |k1inv|
                             (SPADCALL (|spadConstant| % 19) |k1|
                                       (QREFELT % 21)))
                       (LETT |p|
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 19) |k|
                                        (QREFELT % 22))
                              |k1inv| (QREFELT % 33)))
                       (EXIT
                        (LETT |e_val|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |k1inv| (QREFELT % 18))
                                         |e_val| (QREFELT % 33))
                               (SPADCALL |p| |f_val| (QREFELT % 33))
                               (QREFELT % 22)))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (SPADCALL |obits| (QREFELT % 67)) (EXIT |e_val|))))))) 

(SDEFUN |FELFUN;ellipticE;2C;42|
        ((|m| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Complex| (|Float|)))) (|k| NIL)
          (#1=#:G280 NIL) (|k1| (|Complex| (|Float|)))
          (|f_val| #2=(|Complex| (|Float|))) (|k1inv| (|Complex| (|Float|)))
          (|p| (|Complex| (|Float|))) (|e_val| #2#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
            (|error| "ellipticE: m = 1"))
           (#3='T
            (SEQ
             (LETT |e_val|
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT % 57))
                              (SPADCALL 2 (QREFELT % 89)) (QREFELT % 21))
                    (QREFELT % 90)))
             (EXIT
              (COND
               ((SPADCALL |m| (|spadConstant| % 77) (QREFELT % 69)) |e_val|)
               (#3#
                (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                     (EXIT
                      (|finally|
                       (SEQ (LETT |prec| (+ |obits| 20))
                            (SPADCALL |prec| (QREFELT % 67))
                            (LETT |eps|
                                  (|FELFUN;two_to_minus_n|
                                   (|quotient_INT| |prec| 2) %))
                            (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                            (LETT |f_val| |e_val|)
                            (SEQ (LETT |k| NIL) (LETT #1# |ll|) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |k| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |k1|
                                        (SPADCALL (|spadConstant| % 31) |k|
                                                  (QREFELT % 42)))
                                  (LETT |f_val|
                                        (SPADCALL |k1| |f_val| (QREFELT % 51)))
                                  (LETT |k1inv|
                                        (SPADCALL (|spadConstant| % 31) |k1|
                                                  (QREFELT % 43)))
                                  (LETT |p|
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 31) |k|
                                                   (QREFELT % 44))
                                         |k1inv| (QREFELT % 51)))
                                  (EXIT
                                   (LETT |e_val|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL 2 |k1inv| (QREFELT % 41))
                                           |e_val| (QREFELT % 51))
                                          (SPADCALL |p| |f_val| (QREFELT % 51))
                                          (QREFELT % 44)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT |e_val|))
                       (SPADCALL |obits| (QREFELT % 67)))))))))))))) 

(SDEFUN |FELFUN;ellipticE;3F;43|
        ((|z| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|m2| #1=(|Float|))
          (|res| #2=(|Float|)) (|prec| (|PositiveInteger|)) (|eps| (|Float|))
          (|ll| (|List| (|Float|))) (|llr| (|List| (|Float|))) (#3=#:G295 NIL)
          (|delta| #2#) (|lz| (|List| (|Float|))) (#4=#:G297 NIL) (|k| NIL)
          (#5=#:G296 NIL) (|k1| (|Float|)) (|f_val| #6=(|Float|))
          (|k1inv| (|Float|)) (|p| #7=(|Float|)) (|z2| #7#) (|k_z2| #7#)
          (|r| #1#) (|e_val| #6#))
         (SEQ
          (COND ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 95)) |z|)
                (#8='T
                 (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                      (EXIT
                       (COND
                        ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                              (LETT |m2| (SPADCALL |m| (QREFELT % 17)))
                              (LETT |z2| (SPADCALL |m2| |z| (QREFELT % 33)))
                              (EXIT
                               (COND
                                ((SPADCALL |z2| (|spadConstant| % 19)
                                           (QREFELT % 73))
                                 (SEQ (SPADCALL |obits| (QREFELT % 67))
                                      (EXIT
                                       (|error|
                                        "ellipticE: abs(z) > 1/sqrt(m)"))))
                                (#8#
                                 (SEQ
                                  (LETT |res|
                                        (SPADCALL
                                         (SPADCALL |m2|
                                                   (SPADCALL |z2|
                                                             (SPADCALL
                                                              (|spadConstant| %
                                                                              19)
                                                              |m|
                                                              (QREFELT % 21))
                                                             (QREFELT % 120))
                                                   (QREFELT % 33))
                                         (SPADCALL
                                          (SPADCALL |m| (|spadConstant| % 19)
                                                    (QREFELT % 22))
                                          |z| (QREFELT % 33))
                                         (QREFELT % 22)))
                                  (SPADCALL |obits| (QREFELT % 67))
                                  (EXIT |res|)))))))
                        ((SPADCALL |m| (|spadConstant| % 64) (QREFELT % 95))
                         (SPADCALL |z| (QREFELT % 111)))
                        (#8#
                         (COND
                          ((SPADCALL (SPADCALL |z| (QREFELT % 7))
                                     (|spadConstant| % 19) (QREFELT % 73))
                           (|error| "ellipticE: abs(z) > 1"))
                          ((SPADCALL |z| (|spadConstant| % 19) (QREFELT % 95))
                           (SPADCALL |m| (QREFELT % 118)))
                          (#8#
                           (COND
                            ((SPADCALL |z|
                                       (SPADCALL (|spadConstant| % 19)
                                                 (QREFELT % 75))
                                       (QREFELT % 95))
                             (SPADCALL (SPADCALL |m| (QREFELT % 118))
                                       (QREFELT % 75)))
                            (#8#
                             (SEQ (LETT |prec| (+ |obits| 20))
                                  (SPADCALL |prec| (QREFELT % 67))
                                  (LETT |eps|
                                        (|FELFUN;two_to_minus_n|
                                         (|quotient_INT| |prec| 2) %))
                                  (LETT |ll|
                                        (SPADCALL |m| |eps| (QREFELT % 32)))
                                  (LETT |llr| (REVERSE |ll|)) (LETT |lz| NIL)
                                  (SEQ (LETT |k| NIL) (LETT #3# |llr|) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN (LETT |k| (CAR #3#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |delta|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 19)
                                                          |k| (QREFELT % 20))
                                                2 (QREFELT % 74))
                                               (SPADCALL
                                                (SPADCALL 4 |k| (QREFELT % 18))
                                                (SPADCALL |z| 2 (QREFELT % 23))
                                                (QREFELT % 33))
                                               (QREFELT % 22)))
                                        (LETT |z|
                                              (SPADCALL
                                               (SPADCALL 2 |z| (QREFELT % 18))
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 19)
                                                          |k| (QREFELT % 20))
                                                (SPADCALL |delta|
                                                          (QREFELT % 17))
                                                (QREFELT % 20))
                                               (QREFELT % 21)))
                                        (EXIT (LETT |lz| (CONS |z| |lz|))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT NIL))
                                  (LETT |f_val|
                                        (LETT |e_val|
                                              (SPADCALL |z| (QREFELT % 111))))
                                  (SEQ (LETT #4# |lz|) (LETT |k| NIL)
                                       (LETT #5# |ll|) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN (LETT |k| (CAR #5#)) NIL)
                                             (ATOM #4#)
                                             (PROGN (LETT |z| (CAR #4#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |k1|
                                              (SPADCALL (|spadConstant| % 19)
                                                        |k| (QREFELT % 20)))
                                        (LETT |f_val|
                                              (SPADCALL |k1| |f_val|
                                                        (QREFELT % 33)))
                                        (LETT |k1inv|
                                              (SPADCALL (|spadConstant| % 19)
                                                        |k1| (QREFELT % 21)))
                                        (LETT |p|
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| % 19)
                                                         |k| (QREFELT % 22))
                                               |k1inv| (QREFELT % 33)))
                                        (LETT |z2|
                                              (SPADCALL |z| |z|
                                                        (QREFELT % 33)))
                                        (LETT |k_z2|
                                              (SPADCALL |k| |z2|
                                                        (QREFELT % 33)))
                                        (LETT |r|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 19)
                                                          |z2| (QREFELT % 22))
                                                (SPADCALL (|spadConstant| % 19)
                                                          (SPADCALL |k| |k_z2|
                                                                    (QREFELT %
                                                                             33))
                                                          (QREFELT % 22))
                                                (QREFELT % 33))
                                               (QREFELT % 17)))
                                        (LETT |r|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (|spadConstant| % 19) |p|
                                                  (QREFELT % 22))
                                                 |z| (QREFELT % 33))
                                                |r| (QREFELT % 33))
                                               (SPADCALL (|spadConstant| % 19)
                                                         |k_z2| (QREFELT % 20))
                                               (QREFELT % 21)))
                                        (EXIT
                                         (LETT |e_val|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL 2 |k1inv|
                                                            (QREFELT % 18))
                                                  |e_val| (QREFELT % 33))
                                                 (SPADCALL |p| |f_val|
                                                           (QREFELT % 33))
                                                 (QREFELT % 22))
                                                |r| (QREFELT % 20)))))
                                       (LETT #5#
                                             (PROG1 (CDR #5#)
                                               (LETT #4# (CDR #4#))))
                                       (GO G190) G191 (EXIT NIL))
                                  (SPADCALL |obits| (QREFELT % 67))
                                  (EXIT |e_val|))))))))))))))) 

(SDEFUN |FELFUN;ellipticE_aux|
        ((|z| #1=(|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG
         ((|obits| (|PositiveInteger|)) (|m2| #2=(|Complex| (|Float|)))
          (|prec| (|PositiveInteger|)) (|eps| (|Float|))
          (|ll| (|List| (|Complex| (|Float|))))
          (|llr| (|List| (|Complex| (|Float|)))) (|nz| (|Float|))
          (|sf| (|Float|)) (|z0| #1#) (|res0| (|Complex| (|Float|)))
          (#3=#:G311 NIL) (|delta| (|Complex| (|Float|)))
          (|lz| (|List| (|Complex| (|Float|)))) (#4=#:G313 NIL) (|k| NIL)
          (#5=#:G312 NIL) (|k1| (|Complex| (|Float|)))
          (|f_val| #6=(|Complex| (|Float|))) (|k1inv| (|Complex| (|Float|)))
          (|p| #7=(|Complex| (|Float|))) (|z2| #7#) (|k_z2| #7#) (|r| #2#)
          (|e_val| #6#))
         (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |m| (QREFELT % 11)) (|spadConstant| % 19)
                           (QREFELT % 73))
                 (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                      (LETT |m2| (SPADCALL |m| (QREFELT % 40)))
                      (LETT |z2| (SPADCALL |m2| |z| (QREFELT % 51)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL |m2|
                                  (|FELFUN;ellipticE_aux| |z2|
                                   (SPADCALL (|spadConstant| % 31) |m|
                                             (QREFELT % 43))
                                   %)
                                  (QREFELT % 51))
                        (SPADCALL
                         (SPADCALL |m| (|spadConstant| % 31) (QREFELT % 44))
                         |z| (QREFELT % 51))
                        (QREFELT % 44)))))
                ((SPADCALL |m| (|spadConstant| % 77) (QREFELT % 69))
                 (SPADCALL |z| (QREFELT % 114)))
                ((SPADCALL |z| (|spadConstant| % 31) (QREFELT % 69))
                 (SPADCALL |m| (QREFELT % 119)))
                (#8='T
                 (COND
                  ((SPADCALL |z|
                             (SPADCALL (|spadConstant| % 31) (QREFELT % 79))
                             (QREFELT % 69))
                   (SPADCALL (SPADCALL |m| (QREFELT % 119)) (QREFELT % 79)))
                  (#8#
                   (SEQ (LETT |prec| (+ |obits| 20))
                        (SPADCALL |prec| (QREFELT % 67))
                        (LETT |eps|
                              (|FELFUN;two_to_minus_n|
                               (|quotient_INT| |prec| 2) %))
                        (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                        (LETT |llr| (REVERSE |ll|)) (LETT |lz| NIL)
                        (LETT |sf| (|spadConstant| % 19))
                        (LETT |nz| (SPADCALL |z| (QREFELT % 115)))
                        (LETT |res0| (|spadConstant| % 77))
                        (COND
                         ((SPADCALL (|spadConstant| % 19) |nz| (QREFELT % 16))
                          (SEQ (LETT |sf| (SPADCALL 2 (QREFELT % 89)))
                               (LETT |z0| |z|)
                               (LETT |z| (|FELFUN;half_z| |z| |m| %))
                               (EXIT
                                (LETT |res0|
                                      (SPADCALL |z0|
                                                (SPADCALL |z| 2 (QREFELT % 45))
                                                (QREFELT % 51)))))))
                        (SEQ (LETT |k| NIL) (LETT #3# |llr|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |delta|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 31) |k|
                                                (QREFELT % 42))
                                      2 (QREFELT % 116))
                                     (SPADCALL (SPADCALL 4 |k| (QREFELT % 41))
                                               (SPADCALL |z| 2 (QREFELT % 45))
                                               (QREFELT % 51))
                                     (QREFELT % 44)))
                              (LETT |z|
                                    (SPADCALL (SPADCALL 2 |z| (QREFELT % 41))
                                              (SPADCALL
                                               (SPADCALL (|spadConstant| % 31)
                                                         |k| (QREFELT % 42))
                                               (SPADCALL |delta|
                                                         (QREFELT % 40))
                                               (QREFELT % 42))
                                              (QREFELT % 43)))
                              (EXIT (LETT |lz| (CONS |z| |lz|))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (LETT |f_val|
                              (LETT |e_val| (SPADCALL |z| (QREFELT % 114))))
                        (SEQ (LETT #4# |lz|) (LETT |k| NIL) (LETT #5# |ll|)
                             G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#)) NIL)
                                   (ATOM #4#) (PROGN (LETT |z| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |k1|
                                    (SPADCALL (|spadConstant| % 31) |k|
                                              (QREFELT % 42)))
                              (LETT |f_val|
                                    (SPADCALL |k1| |f_val| (QREFELT % 51)))
                              (LETT |k1inv|
                                    (SPADCALL (|spadConstant| % 31) |k1|
                                              (QREFELT % 43)))
                              (LETT |p|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 31) |k|
                                               (QREFELT % 44))
                                     |k1inv| (QREFELT % 51)))
                              (LETT |z2| (SPADCALL |z| |z| (QREFELT % 51)))
                              (LETT |k_z2| (SPADCALL |k| |z2| (QREFELT % 51)))
                              (LETT |r|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 31) |z2|
                                                (QREFELT % 44))
                                      (SPADCALL (|spadConstant| % 31)
                                                (SPADCALL |k| |k_z2|
                                                          (QREFELT % 51))
                                                (QREFELT % 44))
                                      (QREFELT % 51))
                                     (QREFELT % 40)))
                              (LETT |r|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 31) |p|
                                                 (QREFELT % 44))
                                       |z| (QREFELT % 51))
                                      |r| (QREFELT % 51))
                                     (SPADCALL (|spadConstant| % 31) |k_z2|
                                               (QREFELT % 42))
                                     (QREFELT % 43)))
                              (EXIT
                               (LETT |e_val|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL 2 |k1inv| (QREFELT % 41))
                                        |e_val| (QREFELT % 51))
                                       (SPADCALL |p| |f_val| (QREFELT % 51))
                                       (QREFELT % 44))
                                      |r| (QREFELT % 42)))))
                             (LETT #5# (PROG1 (CDR #5#) (LETT #4# (CDR #4#))))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL (SPADCALL |sf| |e_val| (QREFELT % 71))
                                   (SPADCALL |m| |res0| (QREFELT % 51))
                                   (QREFELT % 44)))))))))))) 

(SDEFUN |FELFUN;ellipticE;3C;45|
        ((|z| (|Complex| (|Float|))) (|m| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (COND ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69)) |z|)
                      ('T
                       (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                            (EXIT
                             (|finally| (|FELFUN;ellipticE_aux| |z| |m| %)
                                        (SPADCALL |obits|
                                                  (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;pi0_aux| ((|t| (|Float|)) (|n1| (|Float|)) (% (|Float|)))
        (SPROG ((|ns| (|Float|)))
               (SEQ
                (COND
                 ((SPADCALL |n1| (|spadConstant| % 64) (QREFELT % 95)) |t|)
                 ((SPADCALL (|spadConstant| % 64) |n1| (QREFELT % 16))
                  (SEQ (LETT |ns| (SPADCALL |n1| (QREFELT % 17)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |ns| |t| (QREFELT % 33))
                                   (QREFELT % 122))
                         |ns| (QREFELT % 21)))))
                 ('T
                  (SEQ
                   (LETT |ns|
                         (SPADCALL (SPADCALL |n1| (QREFELT % 75))
                                   (QREFELT % 17)))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |ns| |t| (QREFELT % 33))
                               (QREFELT % 109))
                     |ns| (QREFELT % 21))))))))) 

(SDEFUN |FELFUN;pi0| ((|z| (|Float|)) (|n1| (|Float|)) (% (|Float|)))
        (|FELFUN;pi0_aux|
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 19)
                              (SPADCALL |z| 2 (QREFELT % 23)) (QREFELT % 22))
                    (QREFELT % 17))
                   (QREFELT % 21))
         |n1| %)) 

(SDEFUN |FELFUN;pi0_auxc|
        ((|t| (|Complex| (|Float|))) (|n1| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (SPROG ((|ns| (|Complex| (|Float|))))
               (SEQ
                (COND
                 ((SPADCALL |n1| (|spadConstant| % 77) (QREFELT % 69)) |t|)
                 ('T
                  (SEQ (LETT |ns| (SPADCALL |n1| (QREFELT % 40)))
                       (EXIT
                        (SPADCALL
                         (SPADCALL (SPADCALL |ns| |t| (QREFELT % 51))
                                   (QREFELT % 123))
                         |ns| (QREFELT % 43))))))))) 

(SDEFUN |FELFUN;pi0c|
        ((|z| (|Complex| (|Float|))) (|n1| (|Complex| (|Float|)))
         (% (|Complex| (|Float|))))
        (|FELFUN;pi0_auxc|
         (SPADCALL |z|
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 31)
                              (SPADCALL |z| 2 (QREFELT % 45)) (QREFELT % 44))
                    (QREFELT % 40))
                   (QREFELT % 43))
         |n1| %)) 

(SDEFUN |FELFUN;ellipticPi_r|
        ((|z| #1=(|Float|)) (|n| #2=(|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG
         ((|m1| #3=(|Float|)) (|z2| #4=(|Float|)) (|lzz| #5=(|Float|))
          (|n1| #3#) (|res1| #5#) (|nn| (|Float|)) (|nn1| #4#)
          (|prec| (|PositiveInteger|)) (|eps| (|Float|))
          (|ll| (|List| (|Float|))) (|llr| (|List| (|Float|))) (|z0| #1#)
          (#6=#:G344 NIL) (|delta| (|Float|)) (|lz| (|List| (|Float|)))
          (#7=#:G345 NIL) (|lp| (|List| (|Float|))) (|cc| #5#) (|nk| #2#)
          (|lnk| (|List| (|Float|))) (|p| #3#) (#8=#:G349 NIL) (#9=#:G348 NIL)
          (#10=#:G347 NIL) (|k| NIL) (#11=#:G346 NIL) (|k1| (|Float|))
          (|f_val| (|Float|)) (|p_inv| (|Float|)) (|pi_val| (|Float|)))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 73))
            (COND
             ((SPADCALL
               (SPADCALL |m| (SPADCALL |z| 2 (QREFELT % 23)) (QREFELT % 33))
               (|spadConstant| % 19) (QREFELT % 65))
              (|error| "m*z^2 >= 1"))
             (#12='T
              (SEQ (LETT |m1| (SPADCALL |m| (QREFELT % 17)))
                   (EXIT
                    (SPADCALL
                     (|FELFUN;ellipticPi_r| (SPADCALL |m1| |z| (QREFELT % 33))
                      (SPADCALL |n| |m| (QREFELT % 21))
                      (SPADCALL (|spadConstant| % 19) |m| (QREFELT % 21)) %)
                     |m1| (QREFELT % 21)))))))
           (#12#
            (SEQ (LETT |z2| (SPADCALL |z| |z| (QREFELT % 33)))
                 (EXIT
                  (COND
                   ((SPADCALL |z2| (|spadConstant| % 19) (QREFELT % 65))
                    (|error| "abs(z) >= 1"))
                   ((SPADCALL (SPADCALL |n| |z2| (QREFELT % 33))
                              (|spadConstant| % 19) (QREFELT % 65))
                    (|error| "n*z^2 >= 1"))
                   ((SPADCALL |m| (|spadConstant| % 19) (QREFELT % 95))
                    (SEQ
                     (LETT |lzz|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL (|spadConstant| % 19) |z|
                                        (QREFELT % 20))
                              (SPADCALL (|spadConstant| % 19) |z|
                                        (QREFELT % 22))
                              (QREFELT % 21))
                             (QREFELT % 124))
                            2 (QREFELT % 26)))
                     (EXIT
                      (COND
                       ((SPADCALL |n| (|spadConstant| % 64) (QREFELT % 16))
                        (SEQ
                         (LETT |n1|
                               (SPADCALL (SPADCALL |n| (QREFELT % 75))
                                         (QREFELT % 17)))
                         (EXIT
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL |n1|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |n1| |z| (QREFELT % 33))
                                        (QREFELT % 75))
                                       (QREFELT % 122))
                                      (QREFELT % 33))
                            |lzz| (QREFELT % 22))
                           (SPADCALL |n| (|spadConstant| % 19) (QREFELT % 22))
                           (QREFELT % 21)))))
                       ((SPADCALL |n| (|spadConstant| % 19) (QREFELT % 95))
                        (SPADCALL
                         (SPADCALL |lzz|
                                   (SPADCALL |z|
                                             (SPADCALL |z2|
                                                       (|spadConstant| % 19)
                                                       (QREFELT % 22))
                                             (QREFELT % 21))
                                   (QREFELT % 22))
                         2 (QREFELT % 26)))
                       (#12#
                        (SEQ (LETT |n1| (SPADCALL |n| (QREFELT % 17)))
                             (LETT |res1|
                                   (SPADCALL
                                    (SPADCALL |n1|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 19)
                                                          (SPADCALL |n1| |z|
                                                                    (QREFELT %
                                                                             33))
                                                          (QREFELT % 20))
                                                (SPADCALL (|spadConstant| % 19)
                                                          (SPADCALL |n1| |z|
                                                                    (QREFELT %
                                                                             33))
                                                          (QREFELT % 22))
                                                (QREFELT % 21))
                                               (QREFELT % 124))
                                              (QREFELT % 33))
                                    2 (QREFELT % 26)))
                             (EXIT
                              (SPADCALL (SPADCALL |res1| |lzz| (QREFELT % 22))
                                        (SPADCALL |n| (|spadConstant| % 19)
                                                  (QREFELT % 22))
                                        (QREFELT % 21)))))))))
                   (#12#
                    (SEQ
                     (COND
                      ((SPADCALL (|spadConstant| % 64) |n| (QREFELT % 16))
                       (COND
                        ((SPADCALL |n| |m| (QREFELT % 16))
                         (EXIT
                          (SEQ (LETT |nn| (SPADCALL |m| |n| (QREFELT % 21)))
                               (LETT |nn1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 19) |n|
                                                (QREFELT % 22))
                                      (SPADCALL (|spadConstant| % 19) |nn|
                                                (QREFELT % 22))
                                      (QREFELT % 33)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (SPADCALL |z| |m| (QREFELT % 110))
                                           (|FELFUN;ellipticPi_r| |z| |nn| |m|
                                            %)
                                           (QREFELT % 22))
                                 (|FELFUN;pi0_aux|
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 19)
                                                        (SPADCALL |m| |z2|
                                                                  (QREFELT %
                                                                           33))
                                                        (QREFELT % 22))
                                              (SPADCALL (|spadConstant| % 19)
                                                        |z2| (QREFELT % 22))
                                              (QREFELT % 33))
                                             (QREFELT % 17))
                                            (QREFELT % 21))
                                  |nn1| %)
                                 (QREFELT % 20))))))
                        ((SPADCALL |n| (|spadConstant| % 64) (QREFELT % 16))
                         (COND
                          ((SPADCALL |m| |n| (QREFELT % 16))
                           (EXIT
                            (SEQ (LETT |nn| (SPADCALL |m| |n| (QREFELT % 21)))
                                 (LETT |nn1|
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 19) |n|
                                                  (QREFELT % 22))
                                        (SPADCALL (|spadConstant| % 19) |nn|
                                                  (QREFELT % 22))
                                        (QREFELT % 33)))
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |z| |m| (QREFELT % 110))
                                             (|FELFUN;ellipticPi_r| |z| |nn|
                                              |m| %)
                                             (QREFELT % 22))
                                   (|FELFUN;pi0_aux|
                                    (SPADCALL |z|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (|spadConstant| % 19)
                                                          (SPADCALL |m| |z2|
                                                                    (QREFELT %
                                                                             33))
                                                          (QREFELT % 22))
                                                (SPADCALL (|spadConstant| % 19)
                                                          |z2| (QREFELT % 22))
                                                (QREFELT % 33))
                                               (QREFELT % 17))
                                              (QREFELT % 21))
                                    |nn1| %)
                                   (QREFELT % 20))))))))))
                      ((SPADCALL |n| (|spadConstant| % 64) (QREFELT % 16))
                       (COND
                        ((SPADCALL |m| |n| (QREFELT % 16))
                         (EXIT
                          (SEQ (LETT |nn| (SPADCALL |m| |n| (QREFELT % 21)))
                               (LETT |nn1|
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 19) |n|
                                                (QREFELT % 22))
                                      (SPADCALL (|spadConstant| % 19) |nn|
                                                (QREFELT % 22))
                                      (QREFELT % 33)))
                               (EXIT
                                (SPADCALL
                                 (SPADCALL (SPADCALL |z| |m| (QREFELT % 110))
                                           (|FELFUN;ellipticPi_r| |z| |nn| |m|
                                            %)
                                           (QREFELT % 22))
                                 (|FELFUN;pi0_aux|
                                  (SPADCALL |z|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL (|spadConstant| % 19)
                                                        (SPADCALL |m| |z2|
                                                                  (QREFELT %
                                                                           33))
                                                        (QREFELT % 22))
                                              (SPADCALL (|spadConstant| % 19)
                                                        |z2| (QREFELT % 22))
                                              (QREFELT % 33))
                                             (QREFELT % 17))
                                            (QREFELT % 21))
                                  |nn1| %)
                                 (QREFELT % 20)))))))))
                     (LETT |prec| (SPADCALL (QREFELT % 66)))
                     (LETT |eps|
                           (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2)
                            %))
                     (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 32)))
                     (LETT |llr| (REVERSE |ll|)) (LETT |lz| NIL)
                     (LETT |lp| NIL) (LETT |lnk| NIL) (LETT |z0| |z|)
                     (SEQ (LETT |k| NIL) (LETT #6# |llr|) G190
                          (COND
                           ((OR (ATOM #6#) (PROGN (LETT |k| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |delta|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 19) |k|
                                             (QREFELT % 20))
                                   2 (QREFELT % 74))
                                  (SPADCALL (SPADCALL 4 |k| (QREFELT % 18))
                                            (SPADCALL |z| 2 (QREFELT % 23))
                                            (QREFELT % 33))
                                  (QREFELT % 22)))
                           (LETT |z|
                                 (SPADCALL (SPADCALL 2 |z| (QREFELT % 18))
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 19) |k|
                                                      (QREFELT % 20))
                                            (SPADCALL |delta| (QREFELT % 17))
                                            (QREFELT % 20))
                                           (QREFELT % 21)))
                           (EXIT (LETT |lz| (CONS |z| |lz|))))
                          (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                     (LETT |f_val| (SPADCALL |z| (QREFELT % 111)))
                     (LETT |nk| |n|)
                     (LETT |p|
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 19)
                                      (SPADCALL |m| |nk| (QREFELT % 21))
                                      (QREFELT % 22))
                            (QREFELT % 17)))
                     (SEQ (LETT |k| NIL) (LETT #7# |llr|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |lp| (CONS |p| |lp|))
                               (LETT |cc|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 19) |p|
                                                 (QREFELT % 20))
                                       (SPADCALL (|spadConstant| % 19) |k|
                                                 (QREFELT % 20))
                                       (QREFELT % 33))
                                      2 (QREFELT % 26)))
                               (LETT |nk|
                                     (SPADCALL |nk|
                                               (SPADCALL |cc| 2 (QREFELT % 23))
                                               (QREFELT % 33)))
                               (LETT |lnk| (CONS |nk| |lnk|))
                               (EXIT
                                (LETT |p|
                                      (SPADCALL
                                       (SPADCALL (|spadConstant| % 19)
                                                 (SPADCALL
                                                  (SPADCALL |k| 2
                                                            (QREFELT % 23))
                                                  |nk| (QREFELT % 21))
                                                 (QREFELT % 22))
                                       (QREFELT % 17)))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                     (LETT |pi_val|
                           (|FELFUN;pi0| |z|
                            (SPADCALL (|spadConstant| % 19) |nk|
                                      (QREFELT % 22))
                            %))
                     (LETT |p_inv| (|spadConstant| % 64))
                     (SEQ (LETT #8# |lnk|) (LETT #9# |lp|) (LETT #10# |lz|)
                          (LETT |k| NIL) (LETT #11# |ll|) G190
                          (COND
                           ((OR (ATOM #11#) (PROGN (LETT |k| (CAR #11#)) NIL)
                                (ATOM #10#) (PROGN (LETT |z| (CAR #10#)) NIL)
                                (ATOM #9#) (PROGN (LETT |p| (CAR #9#)) NIL)
                                (ATOM #8#) (PROGN (LETT |nk| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |pi_val|
                                 (SPADCALL |pi_val|
                                           (SPADCALL |p_inv|
                                                     (|FELFUN;pi0| |z|
                                                      (SPADCALL
                                                       (|spadConstant| % 19)
                                                       |nk| (QREFELT % 22))
                                                      %)
                                                     (QREFELT % 33))
                                           (QREFELT % 22)))
                           (LETT |k1|
                                 (SPADCALL (|spadConstant| % 19) |k|
                                           (QREFELT % 20)))
                           (LETT |f_val|
                                 (SPADCALL |k1| |f_val| (QREFELT % 33)))
                           (LETT |pi_val|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL 2 |k1| (QREFELT % 18))
                                            |pi_val| (QREFELT % 33))
                                  (SPADCALL
                                   (SPADCALL |p| (|spadConstant| % 19)
                                             (QREFELT % 22))
                                   |f_val| (QREFELT % 33))
                                  (QREFELT % 20)))
                           (LETT |p_inv|
                                 (SPADCALL (|spadConstant| % 19) |p|
                                           (QREFELT % 21)))
                           (EXIT
                            (LETT |pi_val|
                                  (SPADCALL |p_inv| |pi_val| (QREFELT % 33)))))
                          (LETT #11#
                                (PROG1 (CDR #11#)
                                  (LETT #10#
                                        (PROG1 (CDR #10#)
                                          (LETT #9#
                                                (PROG1 (CDR #9#)
                                                  (LETT #8# (CDR #8#))))))))
                          (GO G190) G191 (EXIT NIL))
                     (EXIT
                      (SPADCALL |pi_val|
                                (SPADCALL |p_inv|
                                          (|FELFUN;pi0| |z0|
                                           (SPADCALL (|spadConstant| % 19) |n|
                                                     (QREFELT % 22))
                                           %)
                                          (QREFELT % 33))
                                (QREFELT % 22))))))))))))) 

(SDEFUN |FELFUN;ellipticPi;4F;51|
        ((|z| (|Float|)) (|n| (|Float|)) (|m| (|Float|)) (% (|Float|)))
        (SPROG ((|obits| (|PositiveInteger|)))
               (SEQ
                (COND
                 ((SPADCALL |n| (|spadConstant| % 64) (QREFELT % 95))
                  (SPADCALL |z| |m| (QREFELT % 110)))
                 ('T
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                              (EXIT (|FELFUN;ellipticPi_r| |z| |n| |m| %)))
                         (SPADCALL |obits| (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;ellipticPi_aux|
        ((|z| #1=(|Complex| (|Float|))) (|n| #2=(|Complex| (|Float|)))
         (|m| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|ctwo| (|Complex| (|Float|))) (|lzz| #3=(|Complex| (|Float|)))
          (|n1| #4=(|Complex| (|Float|))) (|res1| #3#) (|nn| #3#)
          (|nn1| #5=(|Complex| (|Float|))) (|nz| (|Float|)) (|sf| (|Float|))
          (|z2| #5#) (|z12| #5#) (|ss| #5#) (|t| #3#) (|h| #5#) (|h1| #4#)
          (|res0| #6=(|Complex| (|Float|))) (|prec| (|PositiveInteger|))
          (|eps| (|Float|)) (|ll| (|List| (|Complex| (|Float|))))
          (|llr| (|List| (|Complex| (|Float|)))) (|z0| #1#) (#7=#:G372 NIL)
          (|delta| (|Complex| (|Float|))) (|lz| (|List| (|Complex| (|Float|))))
          (#8=#:G373 NIL) (|lp| (|List| (|Complex| (|Float|)))) (|cc| #3#)
          (|nk| #2#) (|lnk| (|List| (|Complex| (|Float|)))) (|p| #4#)
          (#9=#:G377 NIL) (#10=#:G376 NIL) (#11=#:G375 NIL) (|k| NIL)
          (#12=#:G374 NIL) (|k1| (|Complex| (|Float|)))
          (|f_val| (|Complex| (|Float|))) (|p_inv| #6#)
          (|pi_val| (|Complex| (|Float|))))
         (SEQ
          (LETT |ctwo|
                (SPADCALL (SPADCALL 2 0 10 (QREFELT % 14)) (QREFELT % 90)))
          (LETT |z2| (SPADCALL |z| |z| (QREFELT % 51)))
          (EXIT
           (COND
            ((SPADCALL |m| (|spadConstant| % 31) (QREFELT % 69))
             (SEQ
              (LETT |lzz|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 31) |z| (QREFELT % 42))
                       (SPADCALL (|spadConstant| % 31) |z| (QREFELT % 44))
                       (QREFELT % 43))
                      (QREFELT % 126))
                     |ctwo| (QREFELT % 43)))
              (EXIT
               (COND
                ((SPADCALL |n| (|spadConstant| % 31) (QREFELT % 69))
                 (SPADCALL
                  (SPADCALL |lzz|
                            (SPADCALL |z|
                                      (SPADCALL |z2| (|spadConstant| % 31)
                                                (QREFELT % 44))
                                      (QREFELT % 43))
                            (QREFELT % 44))
                  |ctwo| (QREFELT % 43)))
                (#13='T
                 (SEQ (LETT |n1| (SPADCALL |n| (QREFELT % 40)))
                      (LETT |res1|
                            (SPADCALL
                             (SPADCALL |n1|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 31)
                                                   (SPADCALL |n1| |z|
                                                             (QREFELT % 51))
                                                   (QREFELT % 42))
                                         (SPADCALL (|spadConstant| % 31)
                                                   (SPADCALL |n1| |z|
                                                             (QREFELT % 51))
                                                   (QREFELT % 44))
                                         (QREFELT % 43))
                                        (QREFELT % 126))
                                       (QREFELT % 51))
                             |ctwo| (QREFELT % 43)))
                      (EXIT
                       (SPADCALL (SPADCALL |res1| |lzz| (QREFELT % 44))
                                 (SPADCALL |n| (|spadConstant| % 31)
                                           (QREFELT % 44))
                                 (QREFELT % 43)))))))))
            ((SPADCALL (SPADCALL |n| (QREFELT % 11))
                       (SPADCALL |m| (QREFELT % 11)) (QREFELT % 16))
             (SEQ (LETT |nn| (SPADCALL |m| |n| (QREFELT % 43)))
                  (LETT |nn1|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 31) |n| (QREFELT % 44))
                         (SPADCALL (|spadConstant| % 31) |nn| (QREFELT % 44))
                         (QREFELT % 51)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |z| |m| (QREFELT % 117))
                              (|FELFUN;ellipticPi_aux| |z| |nn| |m| %)
                              (QREFELT % 44))
                    (|FELFUN;pi0_auxc|
                     (SPADCALL |z|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31)
                                           (SPADCALL |m| |z2| (QREFELT % 51))
                                           (QREFELT % 44))
                                 (QREFELT % 40))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31) |z2|
                                           (QREFELT % 44))
                                 (QREFELT % 40))
                                (QREFELT % 51))
                               (QREFELT % 43))
                     |nn1| %)
                    (QREFELT % 42)))))
            (#13#
             (SEQ (LETT |nz| (SPADCALL |z| (QREFELT % 115)))
                  (LETT |sf| (|spadConstant| % 19))
                  (LETT |res0| (|spadConstant| % 77))
                  (COND
                   ((SPADCALL (|spadConstant| % 19) |nz| (QREFELT % 16))
                    (SEQ (LETT |z0| |z|)
                         (LETT |sf| (SPADCALL 2 (QREFELT % 89)))
                         (LETT |z| (|FELFUN;half_z| |z| |m| %))
                         (LETT |z2| (SPADCALL |z0| |z0| (QREFELT % 51)))
                         (LETT |z12| (SPADCALL |z| |z| (QREFELT % 51)))
                         (LETT |ss|
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31) |z2|
                                           (QREFELT % 44))
                                 (QREFELT % 40))
                                (SPADCALL
                                 (SPADCALL (|spadConstant| % 31)
                                           (SPADCALL |m| |z2| (QREFELT % 51))
                                           (QREFELT % 44))
                                 (QREFELT % 40))
                                (QREFELT % 51)))
                         (LETT |ss|
                               (SPADCALL |z2|
                                         (SPADCALL |z12| |ss| (QREFELT % 51))
                                         (QREFELT % 44)))
                         (LETT |t|
                               (SPADCALL (SPADCALL |z0| |z12| (QREFELT % 51))
                                         (SPADCALL (|spadConstant| % 31)
                                                   (SPADCALL |n| |ss|
                                                             (QREFELT % 51))
                                                   (QREFELT % 44))
                                         (QREFELT % 43)))
                         (LETT |h|
                               (SPADCALL
                                (SPADCALL |n|
                                          (SPADCALL (|spadConstant| % 31) |n|
                                                    (QREFELT % 44))
                                          (QREFELT % 51))
                                (SPADCALL |n| |m| (QREFELT % 44))
                                (QREFELT % 51)))
                         (LETT |res0|
                               (COND
                                ((SPADCALL |h| (|spadConstant| % 77)
                                           (QREFELT % 69))
                                 |t|)
                                (#13#
                                 (SEQ (LETT |h1| (SPADCALL |h| (QREFELT % 40)))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |t| |h1| (QREFELT % 51))
                                         (QREFELT % 123))
                                        |h1| (QREFELT % 43)))))))
                         (EXIT
                          (LETT |res0|
                                (SPADCALL |n| |res0| (QREFELT % 51)))))))
                  (LETT |prec| (SPADCALL (QREFELT % 66)))
                  (LETT |eps|
                        (|FELFUN;two_to_minus_n| (|quotient_INT| |prec| 2) %))
                  (LETT |ll| (SPADCALL |m| |eps| (QREFELT % 50)))
                  (LETT |llr| (REVERSE |ll|)) (LETT |lz| NIL) (LETT |lp| NIL)
                  (LETT |lnk| NIL) (LETT |nk| |n|) (LETT |z0| |z|)
                  (SEQ (LETT |k| NIL) (LETT #7# |llr|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |delta|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 31) |k|
                                          (QREFELT % 42))
                                2 (QREFELT % 116))
                               (SPADCALL (SPADCALL 4 |k| (QREFELT % 41))
                                         (SPADCALL |z| 2 (QREFELT % 45))
                                         (QREFELT % 51))
                               (QREFELT % 44)))
                        (LETT |z|
                              (SPADCALL (SPADCALL 2 |z| (QREFELT % 41))
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 31) |k|
                                                   (QREFELT % 42))
                                         (SPADCALL |delta| (QREFELT % 40))
                                         (QREFELT % 42))
                                        (QREFELT % 43)))
                        (EXIT (LETT |lz| (CONS |z| |lz|))))
                       (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                  (LETT |f_val| (SPADCALL |z| (QREFELT % 114)))
                  (LETT |p|
                        (SPADCALL
                         (SPADCALL (|spadConstant| % 31)
                                   (SPADCALL |m| |nk| (QREFELT % 43))
                                   (QREFELT % 44))
                         (QREFELT % 40)))
                  (SEQ (LETT |k| NIL) (LETT #8# |llr|) G190
                       (COND
                        ((OR (ATOM #8#) (PROGN (LETT |k| (CAR #8#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |lp| (CONS |p| |lp|))
                            (LETT |cc|
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 31) |p|
                                              (QREFELT % 42))
                                    (SPADCALL (|spadConstant| % 31) |k|
                                              (QREFELT % 42))
                                    (QREFELT % 51))
                                   (SPADCALL 2 (QREFELT % 106))
                                   (QREFELT % 43)))
                            (LETT |nk|
                                  (SPADCALL |nk|
                                            (SPADCALL |cc| 2 (QREFELT % 45))
                                            (QREFELT % 51)))
                            (LETT |lnk| (CONS |nk| |lnk|))
                            (EXIT
                             (LETT |p|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 31)
                                              (SPADCALL
                                               (SPADCALL |k| 2 (QREFELT % 45))
                                               |nk| (QREFELT % 43))
                                              (QREFELT % 44))
                                    (QREFELT % 40)))))
                       (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                  (LETT |pi_val|
                        (|FELFUN;pi0c| |z|
                         (SPADCALL (|spadConstant| % 31) |nk| (QREFELT % 44))
                         %))
                  (LETT |p_inv| (|spadConstant| % 77))
                  (SEQ (LETT #9# |lnk|) (LETT #10# |lp|) (LETT #11# |lz|)
                       (LETT |k| NIL) (LETT #12# |ll|) G190
                       (COND
                        ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#)) NIL)
                             (ATOM #11#) (PROGN (LETT |z| (CAR #11#)) NIL)
                             (ATOM #10#) (PROGN (LETT |p| (CAR #10#)) NIL)
                             (ATOM #9#) (PROGN (LETT |nk| (CAR #9#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |pi_val|
                              (SPADCALL |pi_val|
                                        (SPADCALL |p_inv|
                                                  (|FELFUN;pi0c| |z|
                                                   (SPADCALL
                                                    (|spadConstant| % 31) |nk|
                                                    (QREFELT % 44))
                                                   %)
                                                  (QREFELT % 51))
                                        (QREFELT % 44)))
                        (LETT |k1|
                              (SPADCALL (|spadConstant| % 31) |k|
                                        (QREFELT % 42)))
                        (LETT |f_val| (SPADCALL |k1| |f_val| (QREFELT % 51)))
                        (LETT |pi_val|
                              (SPADCALL
                               (SPADCALL (SPADCALL 2 |k1| (QREFELT % 41))
                                         |pi_val| (QREFELT % 51))
                               (SPADCALL
                                (SPADCALL |p| (|spadConstant| % 31)
                                          (QREFELT % 44))
                                |f_val| (QREFELT % 51))
                               (QREFELT % 42)))
                        (LETT |p_inv|
                              (SPADCALL (|spadConstant| % 31) |p|
                                        (QREFELT % 43)))
                        (EXIT
                         (LETT |pi_val|
                               (SPADCALL |p_inv| |pi_val| (QREFELT % 51)))))
                       (LETT #12#
                             (PROG1 (CDR #12#)
                               (LETT #11#
                                     (PROG1 (CDR #11#)
                                       (LETT #10#
                                             (PROG1 (CDR #10#)
                                               (LETT #9# (CDR #9#))))))))
                       (GO G190) G191 (EXIT NIL))
                  (LETT |pi_val|
                        (SPADCALL |pi_val|
                                  (SPADCALL |p_inv|
                                            (|FELFUN;pi0c| |z0|
                                             (SPADCALL (|spadConstant| % 31)
                                                       |n| (QREFELT % 44))
                                             %)
                                            (QREFELT % 51))
                                  (QREFELT % 44)))
                  (EXIT
                   (SPADCALL (SPADCALL |sf| |pi_val| (QREFELT % 71)) |res0|
                             (QREFELT % 42)))))))))) 

(SDEFUN |FELFUN;ellipticPi;4C;53|
        ((|z| (|Complex| (|Float|))) (|n| (|Complex| (|Float|)))
         (|m| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|obits| (|PositiveInteger|)) (|m1| (|Complex| (|Float|))))
               (SEQ
                (COND
                 ((SPADCALL |n| (|spadConstant| % 77) (QREFELT % 69))
                  (SPADCALL |z| |m| (QREFELT % 117)))
                 (#1='T
                  (SEQ (LETT |obits| (SPADCALL (QREFELT % 66)))
                       (EXIT
                        (|finally|
                         (SEQ (SPADCALL (+ |obits| 20) (QREFELT % 67))
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |m| (QREFELT % 11))
                                           (|spadConstant| % 19)
                                           (QREFELT % 73))
                                 (SEQ (LETT |m1| (SPADCALL |m| (QREFELT % 40)))
                                      (EXIT
                                       (SPADCALL
                                        (|FELFUN;ellipticPi_aux|
                                         (SPADCALL |m1| |z| (QREFELT % 51))
                                         (SPADCALL |n| |m| (QREFELT % 43))
                                         (SPADCALL (|spadConstant| % 31) |m|
                                                   (QREFELT % 43))
                                         %)
                                        |m1| (QREFELT % 43)))))
                                (#1#
                                 (|FELFUN;ellipticPi_aux| |z| |n| |m| %)))))
                         (SPADCALL |obits| (QREFELT % 67)))))))))) 

(SDEFUN |FELFUN;mkr|
        ((|rr| (|Complex| (|Float|))) (|g23| (|Complex| (|Float|)))
         (|r1| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG ((|pr| (|Complex| (|Float|))))
               (SEQ (LETT |pr| (SPADCALL |r1| |rr| (QREFELT % 51)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |pr| 2 (QREFELT % 45)) |g23|
                                (QREFELT % 42))
                      |pr| (QREFELT % 43)))))) 

(SDEFUN |FELFUN;cardano|
        ((|g2| (|Complex| (|Float|))) (|g3| (|Complex| (|Float|)))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|dd| (|Complex| (|Float|))) (|dd1| #1=(|Complex| (|Float|)))
          (|sd| (|Complex| (|Float|))) (|sd1| #1#) (|rr| (|Complex| (|Float|)))
          (|r1| (|Float|)) (|g23| #1#))
         (SEQ
          (LETT |dd|
                (SPADCALL
                 (SPADCALL 27 (SPADCALL |g3| 2 (QREFELT % 45)) (QREFELT % 41))
                 (SPADCALL |g2| 3 (QREFELT % 45)) (QREFELT % 44)))
          (LETT |dd1|
                (SPADCALL |dd|
                          (SPADCALL (SPADCALL 3 0 10 (QREFELT % 14))
                                    (QREFELT % 90))
                          (QREFELT % 43)))
          (LETT |sd| (SPADCALL |dd1| (QREFELT % 40)))
          (LETT |sd1|
                (SPADCALL
                 (SPADCALL |sd| (SPADCALL 3 |g3| (QREFELT % 41))
                           (QREFELT % 42))
                 (SPADCALL (SPADCALL 24 0 10 (QREFELT % 14)) (QREFELT % 90))
                 (QREFELT % 43)))
          (LETT |rr|
                (SPADCALL |sd1| (SPADCALL 1 3 (QREFELT % 28)) (QREFELT % 128)))
          (LETT |r1|
                (SPADCALL (SPADCALL 3 0 10 (QREFELT % 14)) (QREFELT % 17)))
          (LETT |g23|
                (SPADCALL |g2|
                          (SPADCALL (SPADCALL 12 0 10 (QREFELT % 14))
                                    (QREFELT % 90))
                          (QREFELT % 43)))
          (EXIT
           (LIST (|FELFUN;mkr| |rr| |g23| (|spadConstant| % 31) %)
                 (|FELFUN;mkr| |rr| |g23|
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| % 19) (QREFELT % 75))
                             |r1| (QREFELT % 78))
                   (SPADCALL (SPADCALL 2 0 10 (QREFELT % 14)) (QREFELT % 90))
                   (QREFELT % 43))
                  %)
                 (|FELFUN;mkr| |rr| |g23|
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| % 19) (QREFELT % 75))
                             (SPADCALL |r1| (QREFELT % 75)) (QREFELT % 78))
                   (SPADCALL (SPADCALL 2 0 10 (QREFELT % 14)) (QREFELT % 90))
                   (QREFELT % 43))
                  %)))))) 

(SDEFUN |FELFUN;weierstrassHalfPeriods;2CL;56|
        ((|g2| (|Complex| (|Float|))) (|g3| (|Complex| (|Float|)))
         (% (|List| (|Complex| (|Float|)))))
        (SPROG
         ((|rl| (|List| (|Complex| (|Float|)))) (|e13| (|Complex| (|Float|)))
          (|m| #1=(|Complex| (|Float|))) (|zq| (|Complex| (|Float|)))
          (|omega1| #1#) (|omega2| #1#))
         (SEQ (LETT |rl| (|FELFUN;cardano| |g2| |g3| %))
              (LETT |e13|
                    (SPADCALL (SPADCALL |rl| 1 (QREFELT % 80))
                              (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44)))
              (LETT |m|
                    (SPADCALL
                     (SPADCALL (SPADCALL |rl| 2 (QREFELT % 80))
                               (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44))
                     |e13| (QREFELT % 43)))
              (LETT |zq| (SPADCALL |e13| (QREFELT % 40)))
              (LETT |omega1|
                    (SPADCALL
                     (SPADCALL 2 (SPADCALL |m| (QREFELT % 72)) (QREFELT % 41))
                     |zq| (QREFELT % 43)))
              (LETT |omega2|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL 2
                                (SPADCALL (|spadConstant| % 64)
                                          (SPADCALL 1 0 10 (QREFELT % 14))
                                          (QREFELT % 78))
                                (QREFELT % 41))
                      (SPADCALL
                       (SPADCALL (|spadConstant| % 31) |m| (QREFELT % 44))
                       (QREFELT % 72))
                      (QREFELT % 51))
                     |zq| (QREFELT % 43)))
              (EXIT (LIST |omega1| |omega2|))))) 

(SDEFUN |FELFUN;weierstrassP;4C;57|
        ((|g2| (|Complex| (|Float|))) (|g3| (|Complex| (|Float|)))
         (|x| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|rl| (|List| (|Complex| (|Float|)))) (|e13| (|Complex| (|Float|)))
          (|m| (|Complex| (|Float|))) (|zq| (|Complex| (|Float|)))
          (|x1| (|Complex| (|Float|))) (|pp| (|Complex| (|Float|))))
         (SEQ (LETT |rl| (|FELFUN;cardano| |g2| |g3| %))
              (LETT |e13|
                    (SPADCALL (SPADCALL |rl| 1 (QREFELT % 80))
                              (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44)))
              (LETT |m|
                    (SPADCALL
                     (SPADCALL (SPADCALL |rl| 2 (QREFELT % 80))
                               (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44))
                     |e13| (QREFELT % 43)))
              (LETT |zq| (SPADCALL |e13| (QREFELT % 40)))
              (LETT |x1| (SPADCALL |zq| |x| (QREFELT % 51)))
              (LETT |pp| (SPADCALL |x1| |m| (QREFELT % 92)))
              (EXIT
               (SPADCALL (SPADCALL |rl| 3 (QREFELT % 80))
                         (SPADCALL |e13| (SPADCALL |pp| 2 (QREFELT % 45))
                                   (QREFELT % 43))
                         (QREFELT % 42)))))) 

(SDEFUN |FELFUN;weierstrassPPrime;4C;58|
        ((|g2| (|Complex| (|Float|))) (|g3| (|Complex| (|Float|)))
         (|x| (|Complex| (|Float|))) (% (|Complex| (|Float|))))
        (SPROG
         ((|rl| (|List| (|Complex| (|Float|)))) (|e13| (|Complex| (|Float|)))
          (|m| (|Complex| (|Float|))) (|zq| (|Complex| (|Float|)))
          (|x1| (|Complex| (|Float|))) (|pl| (|List| (|Complex| (|Float|))))
          (|s1| #1=(|Complex| (|Float|))) (|c1| #1#) (|d1| #1#))
         (SEQ (LETT |rl| (|FELFUN;cardano| |g2| |g3| %))
              (LETT |e13|
                    (SPADCALL (SPADCALL |rl| 1 (QREFELT % 80))
                              (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44)))
              (LETT |m|
                    (SPADCALL
                     (SPADCALL (SPADCALL |rl| 2 (QREFELT % 80))
                               (SPADCALL |rl| 3 (QREFELT % 80)) (QREFELT % 44))
                     |e13| (QREFELT % 43)))
              (LETT |zq| (SPADCALL |e13| (QREFELT % 40)))
              (LETT |x1| (SPADCALL |zq| |x| (QREFELT % 51)))
              (LETT |pl| (|FELFUN;sn_cn_dn| |x1| |m| %))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |pl| 1 (QREFELT % 80))
                           (|spadConstant| % 77) (QREFELT % 69))
                 (|spadConstant| % 77))
                ('T
                 (SEQ (LETT |s1| (SPADCALL |pl| 2 (QREFELT % 80)))
                      (LETT |c1| (SPADCALL |pl| 3 (QREFELT % 80)))
                      (LETT |d1| (SPADCALL |pl| 4 (QREFELT % 80)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL 2 |zq| (QREFELT % 41)) |e13|
                                     (QREFELT % 51))
                           |c1| (QREFELT % 51))
                          |d1| (QREFELT % 51))
                         (SPADCALL |s1| 3 (QREFELT % 45)) (QREFELT % 43))
                        (QREFELT % 79)))))))))) 

(SDEFUN |FELFUN;weierstrassP;4F;59|
        ((|g2| (|Float|)) (|g3| (|Float|)) (|x| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |g2| (QREFELT % 90))
                   (SPADCALL |g3| (QREFELT % 90)) (SPADCALL |x| (QREFELT % 90))
                   (QREFELT % 130))
         (QREFELT % 85))) 

(SDEFUN |FELFUN;weierstrassPPrime;4F;60|
        ((|g2| (|Float|)) (|g3| (|Float|)) (|x| (|Float|)) (% (|Float|)))
        (SPADCALL
         (SPADCALL (SPADCALL |g2| (QREFELT % 90))
                   (SPADCALL |g3| (QREFELT % 90)) (SPADCALL |x| (QREFELT % 90))
                   (QREFELT % 131))
         (QREFELT % 85))) 

(DECLAIM (NOTINLINE |FloatEllipticFunctions;|)) 

(DEFUN |FloatEllipticFunctions;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|FloatEllipticFunctions|))
          (LETT % (GETREFV 134))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FloatEllipticFunctions| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FloatEllipticFunctions| ()
  (SPROG NIL
         (PROG (#1=#:G396)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|FloatEllipticFunctions|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|FloatEllipticFunctions|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|FloatEllipticFunctions;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|FloatEllipticFunctions|)))))))))) 

(MAKEPROP '|FloatEllipticFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Float|) (0 . |abs|) |FELFUN;rabs;2F;1|
              (|Complex| 6) (5 . |abs|) |FELFUN;rabs;CF;2| (|Integer|)
              (|PositiveInteger|) (10 . |float|) (|Boolean|) (17 . <)
              (23 . |sqrt|) (28 . *) (34 . |1|) (38 . +) (44 . /) (50 . -)
              (56 . ^) (|List| 6) |FELFUN;landen1;F2L;3| (62 . /)
              (|Fraction| 12) (68 . /) (74 . *) |FELFUN;landen2;FLFL;4|
              (80 . |1|) |FELFUN;landen;2FL;5| (84 . *) (|Mapping| 6 6 6)
              (90 . |reduce|) |FELFUN;kprod;LF;6| (96 . |sin|) (101 . |1|)
              |FELFUN;sn2;FLF;7| (105 . |sqrt|) (110 . *) (116 . +) (122 . /)
              (128 . -) (134 . ^) (|List| 9) |FELFUN;landen1;C2L;8| (140 . *)
              |FELFUN;landen2;CLFL;9| |FELFUN;landen;CFL;10| (146 . *)
              (|Mapping| 9 9 9) (152 . |reduce|) |FELFUN;kprod;LC;11|
              (158 . |sin|) |FELFUN;sn2;CLC;12| (163 . |pi|) (167 . |round|)
              (172 . |retract|) (177 . *) (183 . |base|) (187 . ~=)
              (193 . |float|) (199 . |0|) (203 . >=) (209 . |bits|)
              (213 . |bits|) |FELFUN;ellipticK;2F;15| (218 . =) (224 . |pi|)
              (228 . *) |FELFUN;ellipticK;2C;16| (234 . >) (240 . ^) (246 . -)
              (251 . |sign|) (256 . |0|) (260 . |complex|) (266 . -)
              (271 . |elt|) (277 . |cos|) (282 . |cosh|) (287 . |sinh|)
              (292 . |tanh|) (297 . |real|) (302 . *) (308 . |imag|) (313 . *)
              (319 . |coerce|) (324 . |coerce|) (329 . |positiveRemainder|)
              |FELFUN;jacobiSn;3C;24| |FELFUN;jacobiCn;3C;25|
              |FELFUN;jacobiDn;3C;26| (335 . =) (341 . |tanh|)
              |FELFUN;jacobiSn;3F;27| (346 . |cosh|) |FELFUN;jacobiCn;3F;28|
              |FELFUN;jacobiDn;3F;29| |FELFUN;jacobiZeta;3F;31| (351 . *)
              (357 . |coerce|) (362 . |imaginary|) (366 . |exp|)
              (371 . |coerce|) |FELFUN;modularInvariantJ;2C;35|
              |FELFUN;weierstrassInvariants;2CL;36| (376 . |atanh|)
              |FELFUN;ellipticF;3F;37| (381 . |asin|) (386 . |conjugate|)
              (391 . |atanh|) (396 . |asin|) (401 . |norm|) (406 . ^)
              |FELFUN;ellipticF;3C;40| |FELFUN;ellipticE;2F;41|
              |FELFUN;ellipticE;2C;42| |FELFUN;ellipticE;3F;43|
              |FELFUN;ellipticE;3C;45| (412 . |atan|) (417 . |atan|)
              (422 . |log|) |FELFUN;ellipticPi;4F;51| (427 . |log|)
              |FELFUN;ellipticPi;4C;53| (432 . ^)
              |FELFUN;weierstrassHalfPeriods;2CL;56|
              |FELFUN;weierstrassP;4C;57| |FELFUN;weierstrassPPrime;4C;58|
              |FELFUN;weierstrassP;4F;59| |FELFUN;weierstrassPPrime;4F;60|)
           '#(|weierstrassPPrime| 438 |weierstrassP| 452
              |weierstrassInvariants| 466 |weierstrassHalfPeriods| 472 |sn2|
              478 |rabs| 490 |modularInvariantJ| 500 |landen2| 505 |landen1|
              519 |landen| 531 |kprod| 543 |jacobiZeta| 553 |jacobiSn| 559
              |jacobiDn| 571 |jacobiCn| 583 |ellipticPi| 595 |ellipticK| 609
              |ellipticF| 619 |ellipticE| 631)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|jacobiSn| ((|Float|) (|Float|) (|Float|))) T)
                              '((|jacobiSn|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|))))
                                T)
                              '((|jacobiCn| ((|Float|) (|Float|) (|Float|))) T)
                              '((|jacobiCn|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|))))
                                T)
                              '((|jacobiDn| ((|Float|) (|Float|) (|Float|))) T)
                              '((|jacobiDn|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|))))
                                T)
                              '((|jacobiZeta| ((|Float|) (|Float|) (|Float|)))
                                T)
                              '((|weierstrassP|
                                 ((|Float|) (|Float|) (|Float|) (|Float|)))
                                T)
                              '((|weierstrassP|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|weierstrassPPrime|
                                 ((|Float|) (|Float|) (|Float|) (|Float|)))
                                T)
                              '((|weierstrassPPrime|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|weierstrassHalfPeriods|
                                 ((|List| (|Complex| (|Float|)))
                                  (|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|weierstrassInvariants|
                                 ((|List| (|Complex| (|Float|)))
                                  (|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|modularInvariantJ|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|ellipticK| ((|Float|) (|Float|))) T)
                              '((|ellipticK|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|ellipticE| ((|Float|) (|Float|))) T)
                              '((|ellipticE|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|ellipticE| ((|Float|) (|Float|) (|Float|)))
                                T)
                              '((|ellipticE|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|))))
                                T)
                              '((|ellipticF| ((|Float|) (|Float|) (|Float|)))
                                T)
                              '((|ellipticF|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|))))
                                T)
                              '((|ellipticPi|
                                 ((|Float|) (|Float|) (|Float|) (|Float|)))
                                T)
                              '((|ellipticPi|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|Complex| (|Float|)) (|Complex| (|Float|))))
                                T)
                              '((|rabs| ((|Float|) (|Float|))) T)
                              '((|rabs| ((|Float|) (|Complex| (|Float|)))) T)
                              '((|landen1|
                                 ((|List| (|Float|)) (|Float|)
                                  (|List| (|Float|))))
                                T)
                              '((|landen1|
                                 ((|List| (|Complex| (|Float|)))
                                  (|Complex| (|Float|))
                                  (|List| (|Complex| (|Float|)))))
                                T)
                              '((|landen2|
                                 ((|List| (|Float|)) (|Float|)
                                  (|List| (|Float|)) (|Float|)))
                                T)
                              '((|landen2|
                                 ((|List| (|Complex| (|Float|)))
                                  (|Complex| (|Float|))
                                  (|List| (|Complex| (|Float|))) (|Float|)))
                                T)
                              '((|landen|
                                 ((|List| (|Float|)) (|Float|) (|Float|)))
                                T)
                              '((|landen|
                                 ((|List| (|Complex| (|Float|)))
                                  (|Complex| (|Float|)) (|Float|)))
                                T)
                              '((|kprod| ((|Float|) (|List| (|Float|)))) T)
                              '((|kprod|
                                 ((|Complex| (|Float|))
                                  (|List| (|Complex| (|Float|)))))
                                T)
                              '((|sn2|
                                 ((|Float|) (|Float|) (|List| (|Float|))))
                                T)
                              '((|sn2|
                                 ((|Complex| (|Float|)) (|Complex| (|Float|))
                                  (|List| (|Complex| (|Float|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 133
                                            '(1 6 0 0 7 1 9 6 0 10 3 6 0 12 12
                                              13 14 2 6 15 0 0 16 1 6 0 0 17 2
                                              6 0 13 0 18 0 6 0 19 2 6 0 0 0 20
                                              2 6 0 0 0 21 2 6 0 0 0 22 2 6 0 0
                                              13 23 2 6 0 0 12 26 2 27 0 12 12
                                              28 2 6 0 27 0 29 0 9 0 31 2 6 0 0
                                              0 33 2 24 6 34 0 35 1 6 0 0 37 0
                                              27 0 38 1 9 0 0 40 2 9 0 13 0 41
                                              2 9 0 0 0 42 2 9 0 0 0 43 2 9 0 0
                                              0 44 2 9 0 0 13 45 2 9 0 27 0 48
                                              2 9 0 0 0 51 2 46 9 52 0 53 1 9 0
                                              0 55 0 6 0 57 1 6 0 0 58 1 6 12 0
                                              59 2 6 0 12 0 60 0 6 13 61 2 12
                                              15 0 0 62 2 6 0 12 12 63 0 6 0 64
                                              2 6 15 0 0 65 0 6 13 66 1 6 13 13
                                              67 2 9 15 0 0 69 0 9 0 70 2 9 0 6
                                              0 71 2 6 15 0 0 73 2 6 0 0 12 74
                                              1 6 0 0 75 1 6 12 0 76 0 9 0 77 2
                                              9 0 6 6 78 1 9 0 0 79 2 46 9 0 12
                                              80 1 9 0 0 81 1 9 0 0 82 1 9 0 0
                                              83 1 9 0 0 84 1 9 6 0 85 2 9 0 0
                                              6 86 1 9 6 0 87 2 9 0 12 0 88 1 6
                                              0 12 89 1 9 0 6 90 2 12 0 0 0 91
                                              2 6 15 0 0 95 1 6 0 0 96 1 6 0 0
                                              98 2 27 0 0 12 102 1 6 0 27 103 0
                                              9 0 104 1 9 0 0 105 1 9 0 12 106
                                              1 6 0 0 109 1 6 0 0 111 1 9 0 0
                                              112 1 9 0 0 113 1 9 0 0 114 1 9 6
                                              0 115 2 9 0 0 12 116 1 6 0 0 122
                                              1 9 0 0 123 1 6 0 0 124 1 9 0 0
                                              126 2 9 0 0 27 128 3 0 6 6 6 6
                                              133 3 0 9 9 9 9 131 3 0 6 6 6 6
                                              132 3 0 9 9 9 9 130 2 0 46 9 9
                                              108 2 0 46 9 9 129 2 0 6 6 24 39
                                              2 0 9 9 46 56 1 0 6 9 11 1 0 6 6
                                              8 1 0 9 9 107 3 0 46 9 46 6 49 3
                                              0 24 6 24 6 30 2 0 46 9 46 47 2 0
                                              24 6 24 25 2 0 46 9 6 50 2 0 24 6
                                              6 32 1 0 9 46 54 1 0 6 24 36 2 0
                                              6 6 6 101 2 0 6 6 6 97 2 0 9 9 9
                                              92 2 0 6 6 6 100 2 0 9 9 9 94 2 0
                                              6 6 6 99 2 0 9 9 9 93 3 0 6 6 6 6
                                              125 3 0 9 9 9 9 127 1 0 9 9 72 1
                                              0 6 6 68 2 0 6 6 6 110 2 0 9 9 9
                                              117 2 0 6 6 6 120 2 0 9 9 9 121 1
                                              0 6 6 118 1 0 9 9 119)))))
           '|lookupComplete|)) 
