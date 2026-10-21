
(SDEFUN |ALGPKG;convVM| ((|v| (|Vector| R)) (% (|Matrix| R)))
        (SPROG
         ((|cond| (|Matrix| R)) (|i| NIL) (#1=#:G9 NIL) (|j| NIL)
          (#2=#:G10 NIL) (|z| (|Integer|)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 10) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1))
                           (EXIT
                            (SPADCALL |cond| |i| |j|
                                      (SPADCALL |v| |z| (QREFELT % 20))
                                      (QREFELT % 22))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |cond|)))) 

(SDEFUN |ALGPKG;radicalOfLeftTraceForm;L;2| ((% (|List| A)))
        (SPROG ((|ma| (|Matrix| R)))
               (SEQ (LETT |ma| (SPADCALL (QREFELT % 23)))
                    (EXIT
                     (SPADCALL (ELT % 24) (SPADCALL |ma| (QREFELT % 26))
                               (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftAnnihilator;AL;3| ((|a| (A)) (% (|List| A)))
        (SPROG
         ((|ca| (|Matrix| R)) (#1=#:G24 NIL) (|i| NIL) (#2=#:G25 NIL)
          (#3=#:G23 NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |ca|
                (SPADCALL
                 (SPADCALL (SPADCALL |a| (QREFELT % 32)) (QREFELT % 33))
                 (QREFELT % 34)))
          (LETT |cond|
                (SPADCALL (ELT % 35)
                          (PROGN
                           (LETT #1# (GETREFV #4=(QVSIZE (QREFELT % 15))))
                           (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #1# #3#
                                          (SPADCALL |ca|
                                                    (SPADCALL
                                                     (SPADCALL (QREFELT % 15)
                                                               |i|
                                                               (QREFELT % 36))
                                                     (QREFELT % 34))
                                                    (QREFELT % 37)))))
                                (LETT #3#
                                      (PROG1 (|inc_SI| #3#)
                                        (LETT |i| (|inc_SI| |i|))))
                                (GO G190) G191 (EXIT NIL))
                           #1#)
                          (QREFELT % 39)))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |cond| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfRightAnnihilator;AL;4| ((|a| (A)) (% (|List| A)))
        (SPROG
         ((|ca| (|Matrix| R)) (#1=#:G34 NIL) (|i| NIL) (#2=#:G35 NIL)
          (#3=#:G33 NIL) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |ca|
                (SPADCALL
                 (SPADCALL (SPADCALL |a| (QREFELT % 32)) (QREFELT % 33))
                 (QREFELT % 34)))
          (LETT |cond|
                (SPADCALL (ELT % 35)
                          (PROGN
                           (LETT #1# (GETREFV #4=(QVSIZE (QREFELT % 15))))
                           (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #1# #3#
                                          (SPADCALL |ca|
                                                    (SPADCALL (QREFELT % 15)
                                                              |i|
                                                              (QREFELT % 36))
                                                    (QREFELT % 37)))))
                                (LETT #3#
                                      (PROG1 (|inc_SI| #3#)
                                        (LETT |i| (|inc_SI| |i|))))
                                (GO G190) G191 (EXIT NIL))
                           #1#)
                          (QREFELT % 39)))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |cond| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftNucloid;L;5| ((% (|List| (|Matrix| R))))
        (SPROG
         ((|cond| #1=(|Matrix| R)) (|condo| #1#) (|i| NIL) (#2=#:G51 NIL)
          (|j| NIL) (#3=#:G52 NIL) (|k| NIL) (#4=#:G53 NIL) (|z| (|Integer|))
          (|r| NIL) (#5=#:G54 NIL) (|r1| (|Integer|)) (|r2| (|Integer|))
          (#6=#:G55 NIL) (|sol| NIL) (#7=#:G56 NIL))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 10)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #3# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #3#) (GO G191)))
                      (SEQ (LETT |r1| 0)
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #4# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1)) (LETT |r2| |i|)
                                      (EXIT
                                       (SEQ (LETT |r| 1)
                                            (LETT #5# (QREFELT % 10)) G190
                                            (COND
                                             ((|greater_SI| |r| #5#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1))
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |r|
                                                             (QREFELT % 36))
                                                            |i| |j|
                                                            (QREFELT % 42))
                                                           (QREFELT % 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                             |r| |j|
                                                             (QREFELT % 42))
                                                            (QREFELT % 43))
                                                           (QREFELT % 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2|
                                                           (QREFELT % 10)))))
                                            (LETT |r| (|inc_SI| |r|)) (GO G190)
                                            G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #6# NIL)
            (SEQ (LETT |sol| NIL)
                 (LETT #7#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT % 44))
                                 (QREFELT % 26)))
                 G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |sol| (CAR #7#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #6# (CONS (|ALGPKG;convVM| |sol| %) #6#))))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT (NREVERSE #6#)))))))) 

(SDEFUN |ALGPKG;basisOfCommutingElements;L;6| ((% (|List| A)))
        (SPROG
         ((#1=#:G65 NIL) (|i| NIL) (#2=#:G66 NIL) (#3=#:G64 NIL)
          (|gam| (|Matrix| R)) (|cond| (|Matrix| R)))
         (SEQ
          (LETT |cond|
                (SPADCALL (ELT % 35)
                          (PROGN
                           (LETT #1# (GETREFV #4=(QVSIZE (QREFELT % 15))))
                           (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SETELT #1# #3#
                                          (SPADCALL
                                           (LETT |gam|
                                                 (SPADCALL (QREFELT % 15) |i|
                                                           (QREFELT % 36)))
                                           (SPADCALL |gam| (QREFELT % 34))
                                           (QREFELT % 47)))))
                                (LETT #3#
                                      (PROG1 (|inc_SI| #3#)
                                        (LETT |i| (|inc_SI| |i|))))
                                (GO G190) G191 (EXIT NIL))
                           #1#)
                          (QREFELT % 39)))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |cond| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfLeftNucleus;L;7| ((% (|List| A)))
        (SPROG
         ((|condi| (|Matrix| R)) (|k| NIL) (#1=#:G82 NIL) (|j| NIL)
          (#2=#:G83 NIL) (|s| NIL) (#3=#:G84 NIL) (|z| (|Integer|)) (|i| NIL)
          (#4=#:G85 NIL) (|l| NIL) (#5=#:G86 NIL) (|entry| (R)))
         (SEQ
          (LETT |condi|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1) (LETT #3# (QREFELT % 10)) G190
                             (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1))
                                  (EXIT
                                   (SEQ (LETT |i| 1) (LETT #4# (QREFELT % 10))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| % 16))
                                         (SEQ (LETT |l| 1)
                                              (LETT #5# (QREFELT % 10)) G190
                                              (COND
                                               ((|greater_SI| |l| #5#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |l|
                                                                    (QREFELT %
                                                                             36))
                                                                   |j| |k|
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |s|
                                                                    (QREFELT %
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT %
                                                                            42))
                                                                  (QREFELT %
                                                                           49))
                                                                 (QREFELT %
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |l|
                                                          (QREFELT % 36))
                                                         |i| |j|
                                                         (QREFELT % 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |s|
                                                          (QREFELT % 36))
                                                         |l| |k|
                                                         (QREFELT % 42))
                                                        (QREFELT % 49))
                                                       (QREFELT % 51)))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |condi| |z| |i| |entry|
                                                    (QREFELT % 22))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |condi| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfRightNucleus;L;8| ((% (|List| A)))
        (SPROG
         ((|condo| (|Matrix| R)) (|k| NIL) (#1=#:G102 NIL) (|j| NIL)
          (#2=#:G103 NIL) (|s| NIL) (#3=#:G104 NIL) (|z| (|Integer|)) (|i| NIL)
          (#4=#:G105 NIL) (|l| NIL) (#5=#:G106 NIL) (|entry| (R)))
         (SEQ
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1) (LETT #3# (QREFELT % 10)) G190
                             (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1))
                                  (EXIT
                                   (SEQ (LETT |i| 1) (LETT #4# (QREFELT % 10))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| % 16))
                                         (SEQ (LETT |l| 1)
                                              (LETT #5# (QREFELT % 10)) G190
                                              (COND
                                               ((|greater_SI| |l| #5#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |l|
                                                                    (QREFELT %
                                                                             36))
                                                                   |k| |i|
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |s|
                                                                    (QREFELT %
                                                                             36))
                                                                   |j| |l|
                                                                   (QREFELT %
                                                                            42))
                                                                  (QREFELT %
                                                                           49))
                                                                 (QREFELT %
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |l|
                                                          (QREFELT % 36))
                                                         |j| |k|
                                                         (QREFELT % 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |s|
                                                          (QREFELT % 36))
                                                         |l| |i|
                                                         (QREFELT % 42))
                                                        (QREFELT % 49))
                                                       (QREFELT % 51)))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |condo| |z| |i| |entry|
                                                    (QREFELT % 22))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |condo| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfMiddleNucleus;L;9| ((% (|List| A)))
        (SPROG
         ((|conda| (|Matrix| R)) (|k| NIL) (#1=#:G122 NIL) (|j| NIL)
          (#2=#:G123 NIL) (|s| NIL) (#3=#:G124 NIL) (|z| (|Integer|)) (|i| NIL)
          (#4=#:G125 NIL) (|l| NIL) (#5=#:G126 NIL) (|entry| (R)))
         (SEQ
          (LETT |conda|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1) (LETT #3# (QREFELT % 10)) G190
                             (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1))
                                  (EXIT
                                   (SEQ (LETT |i| 1) (LETT #4# (QREFELT % 10))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| % 16))
                                         (SEQ (LETT |l| 1)
                                              (LETT #5# (QREFELT % 10)) G190
                                              (COND
                                               ((|greater_SI| |l| #5#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |entry|
                                                      (SPADCALL
                                                       (SPADCALL |entry|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |l|
                                                                    (QREFELT %
                                                                             36))
                                                                   |j| |i|
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |s|
                                                                    (QREFELT %
                                                                             36))
                                                                   |l| |k|
                                                                   (QREFELT %
                                                                            42))
                                                                  (QREFELT %
                                                                           49))
                                                                 (QREFELT %
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |l|
                                                          (QREFELT % 36))
                                                         |i| |k|
                                                         (QREFELT % 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |s|
                                                          (QREFELT % 36))
                                                         |j| |l|
                                                         (QREFELT % 42))
                                                        (QREFELT % 49))
                                                       (QREFELT % 51)))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL))
                                         (EXIT
                                          (SPADCALL |conda| |z| |i| |entry|
                                                    (QREFELT % 22))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |conda| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfNucleus;L;10| ((% (|List| A)))
        (SPROG
         ((|condi| (|Matrix| R)) (|k| NIL) (#1=#:G143 NIL) (|j| NIL)
          (#2=#:G144 NIL) (|s| NIL) (#3=#:G145 NIL) (|z| (|Integer|))
          (|u| (|Integer|)) (|w| (|Integer|)) (|i| NIL) (#4=#:G146 NIL)
          (|l| NIL) (#5=#:G147 NIL) (|entry| (R)) (|enter| (R)) (|ent| (R)))
         (SEQ
          (LETT |condi|
                (MAKE_MATRIX1 (* 3 (QREFELT % 12)) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0) (LETT |u| (QREFELT % 12))
          (LETT |w| (* 2 (QREFELT % 12)))
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |s| 1) (LETT #3# (QREFELT % 10)) G190
                             (COND ((|greater_SI| |s| #3#) (GO G191)))
                             (SEQ (LETT |z| (+ |z| 1)) (LETT |u| (+ |u| 1))
                                  (LETT |w| (+ |w| 1))
                                  (EXIT
                                   (SEQ (LETT |i| 1) (LETT #4# (QREFELT % 10))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #4#) (GO G191)))
                                        (SEQ
                                         (LETT |entry| (|spadConstant| % 16))
                                         (LETT |enter| (|spadConstant| % 16))
                                         (LETT |ent| (|spadConstant| % 16))
                                         (SEQ (LETT |l| 1)
                                              (LETT #5# (QREFELT % 10)) G190
                                              (COND
                                               ((|greater_SI| |l| #5#)
                                                (GO G191)))
                                              (SEQ
                                               (LETT |entry|
                                                     (SPADCALL
                                                      (SPADCALL |entry|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT %
                                                                            15)
                                                                   |l|
                                                                   (QREFELT %
                                                                            36))
                                                                  |j| |k|
                                                                  (QREFELT %
                                                                           42))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT %
                                                                            15)
                                                                   |s|
                                                                   (QREFELT %
                                                                            36))
                                                                  |i| |l|
                                                                  (QREFELT %
                                                                           42))
                                                                 (QREFELT %
                                                                          49))
                                                                (QREFELT % 50))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 15) |l|
                                                         (QREFELT % 36))
                                                        |i| |j| (QREFELT % 42))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 15) |s|
                                                         (QREFELT % 36))
                                                        |l| |k| (QREFELT % 42))
                                                       (QREFELT % 49))
                                                      (QREFELT % 51)))
                                               (LETT |enter|
                                                     (SPADCALL
                                                      (SPADCALL |enter|
                                                                (SPADCALL
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT %
                                                                            15)
                                                                   |l|
                                                                   (QREFELT %
                                                                            36))
                                                                  |k| |i|
                                                                  (QREFELT %
                                                                           42))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (QREFELT %
                                                                            15)
                                                                   |s|
                                                                   (QREFELT %
                                                                            36))
                                                                  |j| |l|
                                                                  (QREFELT %
                                                                           42))
                                                                 (QREFELT %
                                                                          49))
                                                                (QREFELT % 50))
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 15) |l|
                                                         (QREFELT % 36))
                                                        |j| |k| (QREFELT % 42))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 15) |s|
                                                         (QREFELT % 36))
                                                        |l| |i| (QREFELT % 42))
                                                       (QREFELT % 49))
                                                      (QREFELT % 51)))
                                               (EXIT
                                                (LETT |ent|
                                                      (SPADCALL
                                                       (SPADCALL |ent|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |l|
                                                                    (QREFELT %
                                                                             36))
                                                                   |j| |k|
                                                                   (QREFELT %
                                                                            42))
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    (QREFELT %
                                                                             15)
                                                                    |s|
                                                                    (QREFELT %
                                                                             36))
                                                                   |i| |l|
                                                                   (QREFELT %
                                                                            42))
                                                                  (QREFELT %
                                                                           49))
                                                                 (QREFELT %
                                                                          50))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |l|
                                                          (QREFELT % 36))
                                                         |j| |i|
                                                         (QREFELT % 42))
                                                        (SPADCALL
                                                         (SPADCALL
                                                          (QREFELT % 15) |s|
                                                          (QREFELT % 36))
                                                         |l| |k|
                                                         (QREFELT % 42))
                                                        (QREFELT % 49))
                                                       (QREFELT % 51)))))
                                              (LETT |l| (|inc_SI| |l|))
                                              (GO G190) G191 (EXIT NIL))
                                         (SPADCALL |condi| |z| |i| |entry|
                                                   (QREFELT % 22))
                                         (SPADCALL |condi| |u| |i| |enter|
                                                   (QREFELT % 22))
                                         (EXIT
                                          (SPADCALL |condi| |w| |i| |ent|
                                                    (QREFELT % 22))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))))
                             (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (ELT % 24) (SPADCALL |condi| (QREFELT % 26))
                     (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfCenter;L;11| ((% (|List| A)))
        (SPROG
         ((|gamma1| (|Matrix| R)) (#1=#:G167 NIL) (|gammak| (|Matrix| R))
          (|cond| (|Matrix| R)) (B #2=(|Matrix| R)) (|condi| (|Matrix| R))
          (|k| NIL) (#3=#:G168 NIL) (|j| NIL) (#4=#:G169 NIL) (|s| NIL)
          (#5=#:G170 NIL) (|z| (|Integer|)) (|u| (|Integer|)) (|i| NIL)
          (#6=#:G171 NIL) (|l| NIL) (#7=#:G172 NIL) (|entry| (R)) (|enter| (R))
          (D #2#))
         (SEQ (LETT |gamma1| (SPADCALL (QREFELT % 15) (QREFELT % 56)))
              (LETT |gamma1|
                    (SPADCALL |gamma1| (SPADCALL |gamma1| (QREFELT % 34))
                              (QREFELT % 47)))
              (LETT |cond| |gamma1|)
              (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 10)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |gammak|
                          (SPADCALL (QREFELT % 15) |i| (QREFELT % 36)))
                    (LETT |gammak|
                          (SPADCALL |gammak| (SPADCALL |gammak| (QREFELT % 34))
                                    (QREFELT % 47)))
                    (EXIT
                     (LETT |cond| (SPADCALL |cond| |gammak| (QREFELT % 35)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT B |cond|)
              (LETT |condi|
                    (MAKE_MATRIX1 (* 2 (QREFELT % 12)) (QREFELT % 10)
                                  (|spadConstant| % 16)))
              (LETT |z| 0) (LETT |u| (QREFELT % 12))
              (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 10)) G190
                   (COND ((|greater_SI| |k| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #4# (QREFELT % 10)) G190
                          (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |s| 1) (LETT #5# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |s| #5#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1)) (LETT |u| (+ |u| 1))
                                      (EXIT
                                       (SEQ (LETT |i| 1)
                                            (LETT #6# (QREFELT % 10)) G190
                                            (COND
                                             ((|greater_SI| |i| #6#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |entry|
                                                   (|spadConstant| % 16))
                                             (LETT |enter|
                                                   (|spadConstant| % 16))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #7# (QREFELT % 10))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |l| #7#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |entry|
                                                         (SPADCALL
                                                          (SPADCALL |entry|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 15)
                                                                       |l|
                                                                       (QREFELT
                                                                        % 36))
                                                                      |j| |k|
                                                                      (QREFELT
                                                                       % 42))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 15)
                                                                       |s|
                                                                       (QREFELT
                                                                        % 36))
                                                                      |i| |l|
                                                                      (QREFELT
                                                                       % 42))
                                                                     (QREFELT %
                                                                              49))
                                                                    (QREFELT %
                                                                             50))
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |l|
                                                             (QREFELT % 36))
                                                            |i| |j|
                                                            (QREFELT % 42))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |s|
                                                             (QREFELT % 36))
                                                            |l| |k|
                                                            (QREFELT % 42))
                                                           (QREFELT % 49))
                                                          (QREFELT % 51)))
                                                   (EXIT
                                                    (LETT |enter|
                                                          (SPADCALL
                                                           (SPADCALL |enter|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 15)
                                                                        |l|
                                                                        (QREFELT
                                                                         % 36))
                                                                       |k| |i|
                                                                       (QREFELT
                                                                        % 42))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 15)
                                                                        |s|
                                                                        (QREFELT
                                                                         % 36))
                                                                       |j| |l|
                                                                       (QREFELT
                                                                        % 42))
                                                                      (QREFELT
                                                                       % 49))
                                                                     (QREFELT %
                                                                              50))
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |l|
                                                              (QREFELT % 36))
                                                             |j| |k|
                                                             (QREFELT % 42))
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |s|
                                                              (QREFELT % 36))
                                                             |l| |i|
                                                             (QREFELT % 42))
                                                            (QREFELT % 49))
                                                           (QREFELT % 51)))))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (SPADCALL |condi| |z| |i| |entry|
                                                       (QREFELT % 22))
                                             (EXIT
                                              (SPADCALL |condi| |u| |i| |enter|
                                                        (QREFELT % 22))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT NIL))))
                                 (LETT |s| (|inc_SI| |s|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT D (SPADCALL |condi| B (QREFELT % 35)))
              (EXIT
               (SPADCALL (ELT % 24) (SPADCALL D (QREFELT % 26))
                         (QREFELT % 30)))))) 

(SDEFUN |ALGPKG;basisOfRightNucloid;L;12| ((% (|List| (|Matrix| R))))
        (SPROG
         ((|cond| #1=(|Matrix| R)) (|condo| #1#) (|i| NIL) (#2=#:G188 NIL)
          (|j| NIL) (#3=#:G189 NIL) (|k| NIL) (#4=#:G190 NIL) (|z| (|Integer|))
          (|r| NIL) (#5=#:G191 NIL) (|r1| (|Integer|)) (|r2| (|Integer|))
          (#6=#:G192 NIL) (|sol| NIL) (#7=#:G193 NIL))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |condo|
                (MAKE_MATRIX1 (QREFELT % 12) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 10)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #3# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #3#) (GO G191)))
                      (SEQ (LETT |r1| 0)
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #4# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1)) (LETT |r2| |i|)
                                      (EXIT
                                       (SEQ (LETT |r| 1)
                                            (LETT #5# (QREFELT % 10)) G190
                                            (COND
                                             ((|greater_SI| |r| #5#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1))
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |r|
                                                             (QREFELT % 36))
                                                            |j| |i|
                                                            (QREFELT % 42))
                                                           (QREFELT % 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                             |j| |r|
                                                             (QREFELT % 42))
                                                            (QREFELT % 43))
                                                           (QREFELT % 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2|
                                                           (QREFELT % 10)))))
                                            (LETT |r| (|inc_SI| |r|)) (GO G190)
                                            G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #6# NIL)
            (SEQ (LETT |sol| NIL)
                 (LETT #7#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT % 44))
                                 (QREFELT % 26)))
                 G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |sol| (CAR #7#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #6# (CONS (|ALGPKG;convVM| |sol| %) #6#))))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT (NREVERSE #6#)))))))) 

(SDEFUN |ALGPKG;basisOfCentroid;L;13| ((% (|List| (|Matrix| R))))
        (SPROG
         ((|cond| #1=(|Matrix| R)) (|condo| #1#) (|i| NIL) (#2=#:G209 NIL)
          (|j| NIL) (#3=#:G210 NIL) (|k| NIL) (#4=#:G211 NIL) (|z| (|Integer|))
          (|u| (|Integer|)) (|r| NIL) (#5=#:G212 NIL) (|r1| (|Integer|))
          (|r2| (|Integer|)) (#6=#:G213 NIL) (|sol| NIL) (#7=#:G214 NIL))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (* 2 (QREFELT % 12)) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |condo|
                (MAKE_MATRIX1 (* 2 (QREFELT % 12)) (QREFELT % 11)
                              (|spadConstant| % 16)))
          (LETT |z| 0) (LETT |u| (QREFELT % 12))
          (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 10)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #3# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #3#) (GO G191)))
                      (SEQ (LETT |r1| 0)
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #4# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |k| #4#) (GO G191)))
                                 (SEQ (LETT |z| (+ |z| 1)) (LETT |u| (+ |u| 1))
                                      (LETT |r2| |i|)
                                      (EXIT
                                       (SEQ (LETT |r| 1)
                                            (LETT #5# (QREFELT % 10)) G190
                                            (COND
                                             ((|greater_SI| |r| #5#)
                                              (GO G191)))
                                            (SEQ (LETT |r1| (+ |r1| 1))
                                                 (SPADCALL |cond| |z| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |r|
                                                             (QREFELT % 36))
                                                            |i| |j|
                                                            (QREFELT % 42))
                                                           (QREFELT % 22))
                                                 (SPADCALL |cond| |u| |r1|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (QREFELT % 15) |r|
                                                             (QREFELT % 36))
                                                            |j| |i|
                                                            (QREFELT % 42))
                                                           (QREFELT % 22))
                                                 (SPADCALL |condo| |z| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                             |r| |j|
                                                             (QREFELT % 42))
                                                            (QREFELT % 43))
                                                           (QREFELT % 22))
                                                 (SPADCALL |condo| |u| |r2|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                             |j| |r|
                                                             (QREFELT % 42))
                                                            (QREFELT % 43))
                                                           (QREFELT % 22))
                                                 (EXIT
                                                  (LETT |r2|
                                                        (+ |r2|
                                                           (QREFELT % 10)))))
                                            (LETT |r| (|inc_SI| |r|)) (GO G190)
                                            G191 (EXIT NIL))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (PROGN
            (LETT #6# NIL)
            (SEQ (LETT |sol| NIL)
                 (LETT #7#
                       (SPADCALL (SPADCALL |cond| |condo| (QREFELT % 44))
                                 (QREFELT % 26)))
                 G190
                 (COND
                  ((OR (ATOM #7#) (PROGN (LETT |sol| (CAR #7#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #6# (CONS (|ALGPKG;convVM| |sol| %) #6#))))
                 (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT (NREVERSE #6#)))))))) 

(SDEFUN |ALGPKG;doubleRank;ANni;14| ((|x| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cond| (|Matrix| R)) (|k| NIL) (#1=#:G226 NIL) (|j| NIL)
          (#2=#:G227 NIL) (|z| (|Integer|)) (|u| (|Integer|)) (|i| NIL)
          (#3=#:G228 NIL) (|entry| (R)) (|enter| (R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (* 2 (QREFELT % 10)) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (LETT |z| 0) (LETT |u| (QREFELT % 10))
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ (LETT |z| (+ |z| 1)) (LETT |u| (+ |u| 1))
                               (LETT |entry| (|spadConstant| % 16))
                               (LETT |enter| (|spadConstant| % 16))
                               (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 10)) G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (LETT |entry|
                                           (SPADCALL |entry|
                                                     (SPADCALL
                                                      (SPADCALL |x| |i|
                                                                (QREFELT % 60))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT % 15)
                                                                 |k|
                                                                 (QREFELT %
                                                                          36))
                                                       |j| |i| (QREFELT % 42))
                                                      (QREFELT % 49))
                                                     (QREFELT % 50)))
                                     (EXIT
                                      (LETT |enter|
                                            (SPADCALL |enter|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i|
                                                                 (QREFELT %
                                                                          60))
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (QREFELT % 15) |k|
                                                         (QREFELT % 36))
                                                        |i| |j| (QREFELT % 42))
                                                       (QREFELT % 49))
                                                      (QREFELT % 50)))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (SPADCALL |cond| |z| |k| |entry| (QREFELT % 22))
                               (EXIT
                                (SPADCALL |cond| |u| |k| |enter|
                                          (QREFELT % 22))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT % 62)))))) 

(SDEFUN |ALGPKG;weakBiRank;ANni;15| ((|x| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cond| (|Matrix| R)) (|i| NIL) (#1=#:G243 NIL) (|j| NIL)
          (#2=#:G244 NIL) (|z| (|Integer|)) (|k| NIL) (#3=#:G245 NIL) (|l| NIL)
          (#4=#:G246 NIL) (|s| NIL) (#5=#:G247 NIL) (|entry| (R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 11) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1))
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ (LETT |entry| (|spadConstant| % 16))
                                      (SEQ (LETT |l| 1)
                                           (LETT #4# (QREFELT % 10)) G190
                                           (COND
                                            ((|greater_SI| |l| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |s| 1)
                                                  (LETT #5# (QREFELT % 10))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |s| #5#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |entry|
                                                          (SPADCALL |entry|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x| |l|
                                                                       (QREFELT
                                                                        % 60))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 15)
                                                                        |s|
                                                                        (QREFELT
                                                                         % 36))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 42))
                                                                      (QREFELT
                                                                       % 49))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 15)
                                                                       |k|
                                                                       (QREFELT
                                                                        % 36))
                                                                      |s| |j|
                                                                      (QREFELT
                                                                       % 42))
                                                                     (QREFELT %
                                                                              49))
                                                                    (QREFELT %
                                                                             50)))))
                                                  (LETT |s| (|inc_SI| |s|))
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT |l| (|inc_SI| |l|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL |cond| |z| |k| |entry|
                                                 (QREFELT % 22))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT % 62)))))) 

(SDEFUN |ALGPKG;biRank;ANni;16| ((|x| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cond| (|Matrix| R)) (#1=#:G271 NIL) (#2=#:G272 NIL)
          (|z| (|Integer|)) (#3=#:G273 NIL) (|l| NIL) (#4=#:G274 NIL) (|s| NIL)
          (#5=#:G275 NIL) (|c| (|PositiveInteger|)) (|j| NIL) (#6=#:G276 NIL)
          (|u| (|Integer|)) (|w| (|Integer|)) (|k| NIL) (#7=#:G277 NIL)
          (|i| NIL) (#8=#:G278 NIL) (|entry| (R)) (|enter| (R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (+ (+ (QREFELT % 11) (* 2 (QREFELT % 10))) 1)
                              (QREFELT % 10) (|spadConstant| % 16)))
          (LETT |z| 0)
          (SEQ (LETT |j| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |j| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (LETT |z| (+ |z| 1))
                           (EXIT
                            (SEQ (LETT |k| 1) (LETT #3# (QREFELT % 10)) G190
                                 (COND ((|greater_SI| |k| #3#) (GO G191)))
                                 (SEQ (LETT |entry| (|spadConstant| % 16))
                                      (SEQ (LETT |l| 1)
                                           (LETT #4# (QREFELT % 10)) G190
                                           (COND
                                            ((|greater_SI| |l| #4#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (SEQ (LETT |s| 1)
                                                  (LETT #5# (QREFELT % 10))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |s| #5#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |entry|
                                                          (SPADCALL |entry|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |x| |l|
                                                                       (QREFELT
                                                                        % 60))
                                                                      (SPADCALL
                                                                       (SPADCALL
                                                                        (QREFELT
                                                                         % 15)
                                                                        |s|
                                                                        (QREFELT
                                                                         % 36))
                                                                       |i| |l|
                                                                       (QREFELT
                                                                        % 42))
                                                                      (QREFELT
                                                                       % 49))
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       (QREFELT
                                                                        % 15)
                                                                       |k|
                                                                       (QREFELT
                                                                        % 36))
                                                                      |s| |j|
                                                                      (QREFELT
                                                                       % 42))
                                                                     (QREFELT %
                                                                              49))
                                                                    (QREFELT %
                                                                             50)))))
                                                  (LETT |s| (|inc_SI| |s|))
                                                  (GO G190) G191 (EXIT NIL))))
                                           (LETT |l| (|inc_SI| |l|)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (SPADCALL |cond| |z| |k| |entry|
                                                 (QREFELT % 22))))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (LETT |u| (* (QREFELT % 10) (QREFELT % 10)))
          (LETT |w| (* (QREFELT % 10) (+ (QREFELT % 10) 1)))
          (LETT |c| (+ (+ (QREFELT % 11) (* 2 (QREFELT % 10))) 1))
          (SEQ (LETT |j| 1) (LETT #6# (QREFELT % 10)) G190
               (COND ((|greater_SI| |j| #6#) (GO G191)))
               (SEQ (LETT |u| (+ |u| 1)) (LETT |w| (+ |w| 1))
                    (SEQ (LETT |k| 1) (LETT #7# (QREFELT % 10)) G190
                         (COND ((|greater_SI| |k| #7#) (GO G191)))
                         (SEQ (LETT |entry| (|spadConstant| % 16))
                              (LETT |enter| (|spadConstant| % 16))
                              (SEQ (LETT |i| 1) (LETT #8# (QREFELT % 10)) G190
                                   (COND ((|greater_SI| |i| #8#) (GO G191)))
                                   (SEQ
                                    (LETT |entry|
                                          (SPADCALL |entry|
                                                    (SPADCALL
                                                     (SPADCALL |x| |i|
                                                               (QREFELT % 60))
                                                     (SPADCALL
                                                      (SPADCALL (QREFELT % 15)
                                                                |k|
                                                                (QREFELT % 36))
                                                      |j| |i| (QREFELT % 42))
                                                     (QREFELT % 49))
                                                    (QREFELT % 50)))
                                    (EXIT
                                     (LETT |enter|
                                           (SPADCALL |enter|
                                                     (SPADCALL
                                                      (SPADCALL |x| |i|
                                                                (QREFELT % 60))
                                                      (SPADCALL
                                                       (SPADCALL (QREFELT % 15)
                                                                 |k|
                                                                 (QREFELT %
                                                                          36))
                                                       |i| |j| (QREFELT % 42))
                                                      (QREFELT % 49))
                                                     (QREFELT % 50)))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))
                              (SPADCALL |cond| |u| |k| |entry| (QREFELT % 22))
                              (EXIT
                               (SPADCALL |cond| |w| |k| |enter|
                                         (QREFELT % 22))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SPADCALL |cond| |c| |j| (SPADCALL |x| |j| (QREFELT % 60))
                               (QREFELT % 22))))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT % 62)))))) 

(SDEFUN |ALGPKG;leftRank;ANni;17| ((|x| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cond| (|Matrix| R)) (|k| NIL) (#1=#:G288 NIL) (|j| NIL)
          (#2=#:G289 NIL) (|i| NIL) (#3=#:G290 NIL) (|entry| (R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 10) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |entry| (|spadConstant| % 16))
                           (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 10)) G190
                                (COND ((|greater_SI| |i| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |entry|
                                        (SPADCALL |entry|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i|
                                                             (QREFELT % 60))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                    |i| |j| (QREFELT % 42))
                                                   (QREFELT % 49))
                                                  (QREFELT % 50)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL |cond| |j| |k| |entry| (QREFELT % 22))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT % 62)))))) 

(SDEFUN |ALGPKG;rightRank;ANni;18| ((|x| (A)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|cond| (|Matrix| R)) (|k| NIL) (#1=#:G300 NIL) (|j| NIL)
          (#2=#:G301 NIL) (|i| NIL) (#3=#:G302 NIL) (|entry| (R)))
         (SEQ
          (LETT |cond|
                (MAKE_MATRIX1 (QREFELT % 10) (QREFELT % 10)
                              (|spadConstant| % 16)))
          (SEQ (LETT |k| 1) (LETT #1# (QREFELT % 10)) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| 1) (LETT #2# (QREFELT % 10)) G190
                      (COND ((|greater_SI| |j| #2#) (GO G191)))
                      (SEQ (LETT |entry| (|spadConstant| % 16))
                           (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 10)) G190
                                (COND ((|greater_SI| |i| #3#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |entry|
                                        (SPADCALL |entry|
                                                  (SPADCALL
                                                   (SPADCALL |x| |i|
                                                             (QREFELT % 60))
                                                   (SPADCALL
                                                    (SPADCALL (QREFELT % 15)
                                                              |k|
                                                              (QREFELT % 36))
                                                    |j| |i| (QREFELT % 42))
                                                   (QREFELT % 49))
                                                  (QREFELT % 50)))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (EXIT
                            (SPADCALL |cond| |j| |k| |entry| (QREFELT % 22))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |cond| (QREFELT % 62)))))) 

(SDEFUN |ALGPKG;basis;2V;19| ((|va| (|Vector| A)) (% (|Vector| A)))
        (SPROG
         ((|v| (|Vector| A)) (|i| NIL) (#1=#:G319 NIL) (|m| (|Matrix| R))
          (|mRI| (|Integer|)) (|mCI| (|Integer|)) (|lj| (|List| (|Integer|)))
          (|h| (|Integer|)) (|j| (|Integer|)) (|finished?| (|Boolean|))
          (#2=#:G321 NIL) (#3=#:G322 NIL) (#4=#:G320 NIL))
         (SEQ (LETT |v| (SPADCALL (ELT % 69) |va| (QREFELT % 72)))
              (LETT |v| (SPADCALL |v| (QREFELT % 73)))
              (EXIT
               (COND
                ((SPADCALL |v| (QREFELT % 74)) (VECTOR (|spadConstant| % 75)))
                ('T
                 (SEQ
                  (LETT |m|
                        (SPADCALL
                         (SPADCALL (SPADCALL |v| 1 (QREFELT % 76))
                                   (QREFELT % 32))
                         (QREFELT % 33)))
                  (SEQ (LETT |i| 2) (LETT #1# (QVSIZE |v|)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |m|
                               (SPADCALL |m|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |v| |i| (QREFELT % 76))
                                           (QREFELT % 32))
                                          (QREFELT % 33))
                                         (QREFELT % 77)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (LETT |m| (SPADCALL |m| (QREFELT % 78))) (LETT |lj| NIL)
                  (LETT |h| 1) (LETT |mRI| (SPADCALL |m| (QREFELT % 79)))
                  (LETT |mCI| (SPADCALL |m| (QREFELT % 80)))
                  (LETT |finished?| NIL) (LETT |j| 1)
                  (SEQ G190 (COND ((NULL (NULL |finished?|)) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |m| |h| |j| (QREFELT % 42))
                                      (QREFELT % 81)))
                           (SEQ (LETT |lj| (CONS |j| |lj|)) (LETT |h| |mRI|)
                                (SEQ G190
                                     (COND
                                      ((NULL
                                        (SPADCALL
                                         (SPADCALL |m| |h| |j| (QREFELT % 42))
                                         (QREFELT % 81)))
                                       (GO G191)))
                                     (SEQ (EXIT (LETT |h| (- |h| 1)))) NIL
                                     (GO G190) G191 (EXIT NIL))
                                (LETT |finished?| (EQL |h| |mRI|))
                                (EXIT
                                 (COND
                                  ((NULL |finished?|) (LETT |h| (+ |h| 1)))))))
                          ((< |j| |mCI|) (LETT |j| (+ |j| 1)))
                          ('T (LETT |finished?| 'T)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (PROGN
                    (LETT #2# (GETREFV (LENGTH #5=(REVERSE |lj|))))
                    (SEQ (LETT #3# #5#) (LETT #4# 0) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |j| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #2# #4# (SPADCALL |v| |j| (QREFELT % 76)))))
                         (LETT #4# (PROG1 (|inc_SI| #4#) (LETT #3# (CDR #3#))))
                         (GO G190) G191 (EXIT NIL))
                    #2#))))))))) 

(DECLAIM (NOTINLINE |AlgebraPackage;|)) 

(DEFUN |AlgebraPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|AlgebraPackage| DV$1 DV$2))
          (LETT % (GETREFV 83))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|EuclideanDomain|))))))
          (|haddProp| |$ConstructorCache| '|AlgebraPackage| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL (QREFELT % 9)))
          (QSETREFV % 11 (* (QREFELT % 10) (QREFELT % 10)))
          (QSETREFV % 12 (* (QREFELT % 10) (QREFELT % 11)))
          (QSETREFV % 15 (SPADCALL (QREFELT % 14)))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 82
                      (CONS (|dispatchFunction| |ALGPKG;basis;2V;19|) %))))
          %))) 

(DEFUN |AlgebraPackage| (&REST #1=#:G323)
  (SPROG NIL
         (PROG (#2=#:G324)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AlgebraPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraPackage|)))))))))) 

(MAKEPROP '|AlgebraPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|PositiveInteger|) (0 . |rank|) '|n| '|n2| '|n3| (|Vector| 21)
              (4 . |structuralConstants|) '|gamma| (8 . |0|) (12 . |1|)
              (|Integer|) (|Vector| 6) (16 . |elt|) (|Matrix| 6)
              (22 . |setelt!|) (30 . |leftTraceMatrix|) (34 . |represents|)
              (|List| 19) (39 . |nullSpace|) (|List| 7) (|Mapping| 7 19)
              (|ListFunctions2| 19 7) (44 . |map|)
              |ALGPKG;radicalOfLeftTraceForm;L;2| (50 . |coordinates|)
              (55 . |coerce|) (60 . |transpose|) (65 . |vertConcat|)
              (71 . |elt|) (77 . *) (|Mapping| 21 21 21) (83 . |reduce|)
              |ALGPKG;basisOfLeftAnnihilator;AL;3|
              |ALGPKG;basisOfRightAnnihilator;AL;4| (89 . |elt|) (96 . -)
              (101 . +) (|List| 21) |ALGPKG;basisOfLeftNucloid;L;5| (107 . -)
              |ALGPKG;basisOfCommutingElements;L;6| (113 . *) (119 . +)
              (125 . -) |ALGPKG;basisOfLeftNucleus;L;7|
              |ALGPKG;basisOfRightNucleus;L;8|
              |ALGPKG;basisOfMiddleNucleus;L;9| |ALGPKG;basisOfNucleus;L;10|
              (131 . |first|) |ALGPKG;basisOfCenter;L;11|
              |ALGPKG;basisOfRightNucloid;L;12| |ALGPKG;basisOfCentroid;L;13|
              (136 . |elt|) (|NonNegativeInteger|) (142 . |rank|)
              |ALGPKG;doubleRank;ANni;14| |ALGPKG;weakBiRank;ANni;15|
              |ALGPKG;biRank;ANni;16| |ALGPKG;leftRank;ANni;17|
              |ALGPKG;rightRank;ANni;18| (|Boolean|) (147 . |zero?|)
              (|Mapping| 68 7) (|Vector| 7) (152 . |remove|)
              (158 . |removeDuplicates|) (163 . |empty?|) (168 . |0|)
              (172 . |elt|) (178 . |horizConcat|) (184 . |rowEchelon|)
              (189 . |maxRowIndex|) (194 . |maxColIndex|) (199 . |zero?|)
              (204 . |basis|))
           '#(|weakBiRank| 209 |rightRank| 214 |radicalOfLeftTraceForm| 219
              |leftRank| 223 |doubleRank| 228 |biRank| 233
              |basisOfRightNucloid| 238 |basisOfRightNucleus| 242
              |basisOfRightAnnihilator| 246 |basisOfNucleus| 251
              |basisOfMiddleNucleus| 255 |basisOfLeftNucloid| 259
              |basisOfLeftNucleus| 263 |basisOfLeftAnnihilator| 267
              |basisOfCommutingElements| 272 |basisOfCentroid| 276
              |basisOfCenter| 280 |basis| 284)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|leftRank| ((|NonNegativeInteger|) |#2|)) T)
                              '((|rightRank| ((|NonNegativeInteger|) |#2|)) T)
                              '((|doubleRank| ((|NonNegativeInteger|) |#2|)) T)
                              '((|weakBiRank| ((|NonNegativeInteger|) |#2|)) T)
                              '((|biRank| ((|NonNegativeInteger|) |#2|)) T)
                              '((|basisOfCommutingElements| ((|List| |#2|))) T)
                              '((|basisOfLeftAnnihilator| ((|List| |#2|) |#2|))
                                T)
                              '((|basisOfRightAnnihilator|
                                 ((|List| |#2|) |#2|))
                                T)
                              '((|basisOfLeftNucleus| ((|List| |#2|))) T)
                              '((|basisOfRightNucleus| ((|List| |#2|))) T)
                              '((|basisOfMiddleNucleus| ((|List| |#2|))) T)
                              '((|basisOfNucleus| ((|List| |#2|))) T)
                              '((|basisOfCenter| ((|List| |#2|))) T)
                              '((|basisOfLeftNucloid|
                                 ((|List| (|Matrix| |#1|))))
                                T)
                              '((|basisOfRightNucloid|
                                 ((|List| (|Matrix| |#1|))))
                                T)
                              '((|basisOfCentroid| ((|List| (|Matrix| |#1|))))
                                T)
                              '((|radicalOfLeftTraceForm| ((|List| |#2|))) T)
                              '((|basis| ((|Vector| |#2|) (|Vector| |#2|)))
                                (|has| 6 (|EuclideanDomain|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 82
                                            '(0 7 8 9 0 7 13 14 0 6 0 16 0 6 0
                                              17 2 19 6 0 18 20 4 21 6 0 18 18
                                              6 22 0 7 21 23 1 7 0 19 24 1 21
                                              25 0 26 2 29 27 28 25 30 1 7 19 0
                                              32 1 21 0 19 33 1 21 0 0 34 2 21
                                              0 0 0 35 2 13 21 0 18 36 2 21 0 0
                                              0 37 2 13 21 38 0 39 3 21 6 0 18
                                              18 42 1 6 0 0 43 2 21 0 0 0 44 2
                                              21 0 0 0 47 2 6 0 0 0 49 2 6 0 0
                                              0 50 2 6 0 0 0 51 1 13 21 0 56 2
                                              7 6 0 18 60 1 21 61 0 62 1 7 68 0
                                              69 2 71 0 70 0 72 1 71 0 0 73 1
                                              71 68 0 74 0 7 0 75 2 71 7 0 18
                                              76 2 21 0 0 0 77 1 21 0 0 78 1 21
                                              18 0 79 1 21 18 0 80 1 6 68 0 81
                                              1 0 71 71 82 1 0 61 7 64 1 0 61 7
                                              67 0 0 27 31 1 0 61 7 66 1 0 61 7
                                              63 1 0 61 7 65 0 0 45 58 0 0 27
                                              53 1 0 27 7 41 0 0 27 55 0 0 27
                                              54 0 0 45 46 0 0 27 52 1 0 27 7
                                              40 0 0 27 48 0 0 45 59 0 0 27 57
                                              1 1 71 71 82)))))
           '|lookupComplete|)) 
