
(SDEFUN |ODESYS;solve;MLMR;1|
        ((|mm| (|Matrix| F)) (|lv| (|List| (|Vector| F)))
         (|solf|
          (|Mapping|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| F)))
           LO (|List| F)))
         (%
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))))
        (SPROG
         ((|rec|
           (|Record| (|:| A #1=(|Matrix| F))
                     (|:| |eqs|
                          (|List|
                           (|Record| (|:| C (|Matrix| F))
                                     (|:| |lg| (|List| (|Vector| F)))
                                     (|:| |eq| LO) (|:| |lrh| (|List| F)))))))
          (|nv| (|NonNegativeInteger|)) (|mA| #1#) (|n| (|NonNegativeInteger|))
          (#2=#:G46 NIL) (#3=#:G47 NIL) (#4=#:G48 NIL) (|v| NIL) (#5=#:G49 NIL)
          (#6=#:G51 NIL) (|i| #7=(|NonNegativeInteger|)) (#8=#:G50 NIL)
          (|e| NIL) (#9=#:G52 NIL) (#10=#:G53 NIL) (#11=#:G54 NIL)
          (|crh| (|List| F))
          (|u|
           (|Record|
            (|:| |particular|
                 #12=(|List|
                      (|Record| (|:| |ratpart| F)
                                (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| F))))
          (|np1| #12#) (#13=#:G55 NIL) (#14=#:G56 NIL)
          (|ncb| (|List| #15=(|Vector| F))) (|nn| (|NonNegativeInteger|))
          (|s| NIL) (#16=#:G57 NIL) (|base_vec| (|Vector| F)) (#17=#:G58 NIL)
          (#18=#:G59 NIL) (#19=#:G60 NIL) (|npl| (|List| #15#)) (#20=#:G63 NIL)
          (#21=#:G62 NIL) (|be| NIL) (#22=#:G61 NIL) (|g1| #15#) (|l| NIL)
          (#23=#:G64 NIL) (|k| #7#) (|pl| (|List| (|Vector| F)))
          (|cb| (|List| (|Vector| F))) (|base_vecs| (|List| (|Vector| F)))
          (#24=#:G65 NIL) (|bv| NIL) (#25=#:G67 NIL) (|np| NIL) (#26=#:G66 NIL)
          (#27=#:G68 NIL) (|bvec| NIL) (#28=#:G69 NIL))
         (SEQ (LETT |rec| (SPADCALL |mm| |lv| (QREFELT % 14)))
              (LETT |nv| (LENGTH |lv|)) (LETT |mA| (QCAR |rec|))
              (LETT |n| (ANCOLS |mA|)) (LETT |k| 0) (LETT |i| 0)
              (LETT |cb|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |v| NIL) (LETT #3# |lv|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (MAKEARR1 |nv| (|spadConstant| % 15))
                                        #2#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |pl|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |v| NIL) (LETT #5# |lv|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #4#
                                  (CONS (MAKEARR1 |n| (|spadConstant| % 15))
                                        #4#))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (LETT |base_vecs| NIL)
              (SEQ (LETT |bv| NIL) (LETT #6# |cb|) (LETT |i| 1) (LETT #8# |nv|)
                   G190
                   (COND
                    ((OR (|greater_SI| |i| #8#) (ATOM #6#)
                         (PROGN (LETT |bv| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |bv| |i| (|spadConstant| % 17) (QREFELT % 21))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #6# (CDR #6#))))
                   (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |e| NIL) (LETT #9# (QCDR |rec|)) G190
                   (COND
                    ((OR (ATOM #9#) (PROGN (LETT |e| (CAR #9#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |crh|
                          (PROGN
                           (LETT #10# NIL)
                           (SEQ (LETT |bv| NIL) (LETT #11# |cb|) G190
                                (COND
                                 ((OR (ATOM #11#)
                                      (PROGN (LETT |bv| (CAR #11#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #10#
                                        (CONS
                                         (SPADCALL |bv| (QVELT |e| 3)
                                                   (QREFELT % 24))
                                         #10#))))
                                (LETT #11# (CDR #11#)) (GO G190) G191
                                (EXIT (NREVERSE #10#)))))
                    (LETT |u| (SPADCALL (QVELT |e| 2) |crh| |solf|))
                    (LETT |np1| (QCAR |u|))
                    (LETT |ncb|
                          (PROGN
                           (LETT #13# NIL)
                           (SEQ (LETT |be| NIL) (LETT #14# |np1|) G190
                                (COND
                                 ((OR (ATOM #14#)
                                      (PROGN (LETT |be| (CAR #14#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #13#
                                        (CONS
                                         (SPADCALL (QCDR |be|) |cb|
                                                   (QREFELT % 25))
                                         #13#))))
                                (LETT #14# (CDR #14#)) (GO G190) G191
                                (EXIT (NREVERSE #13#)))))
                    (LETT |nn| (ANROWS (QVELT |e| 0)))
                    (SEQ (LETT |s| NIL) (LETT #16# (QCDR |u|)) G190
                         (COND
                          ((OR (ATOM #16#) (PROGN (LETT |s| (CAR #16#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |base_vec|
                                (MAKEARR1 |n| (|spadConstant| % 15)))
                          (SPADCALL |base_vec| (+ |k| 1) |s| (QREFELT % 21))
                          (SEQ (LETT |l| 2) (LETT #17# |nn|) G190
                               (COND ((|greater_SI| |l| #17#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (SPADCALL |base_vec| (+ |k| |l|)
                                           (SPADCALL (QREFELT % 9)
                                                     (SPADCALL |base_vec|
                                                               (- (+ |k| |l|)
                                                                  1)
                                                               (QREFELT % 26))
                                                     (QREFELT % 27))
                                           (QREFELT % 21))))
                               (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT
                           (LETT |base_vecs| (CONS |base_vec| |base_vecs|))))
                         (LETT #16# (CDR #16#)) (GO G190) G191 (EXIT NIL))
                    (LETT |npl|
                          (PROGN
                           (LETT #18# NIL)
                           (SEQ (LETT |be| NIL) (LETT #19# |np1|) G190
                                (COND
                                 ((OR (ATOM #19#)
                                      (PROGN (LETT |be| (CAR #19#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #18#
                                        (CONS
                                         (SPADCALL (QCDR |be|) |pl|
                                                   (QREFELT % 25))
                                         #18#))))
                                (LETT #19# (CDR #19#)) (GO G190) G191
                                (EXIT (NREVERSE #18#)))))
                    (SEQ (LETT |bv| NIL) (LETT #20# |ncb|) (LETT |np| NIL)
                         (LETT #21# |npl|) (LETT |be| NIL) (LETT #22# |np1|)
                         G190
                         (COND
                          ((OR (ATOM #22#) (PROGN (LETT |be| (CAR #22#)) NIL)
                               (ATOM #21#) (PROGN (LETT |np| (CAR #21#)) NIL)
                               (ATOM #20#) (PROGN (LETT |bv| (CAR #20#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |g1|
                                (SPADCALL |bv| (QVELT |e| 1) (QREFELT % 25)))
                          (SPADCALL |np| (+ |k| 1) (QCAR |be|) (QREFELT % 21))
                          (EXIT
                           (SEQ (LETT |l| 2) (LETT #23# |nn|) G190
                                (COND ((|greater_SI| |l| #23#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |np| (+ |k| |l|)
                                            (SPADCALL
                                             (SPADCALL (QREFELT % 9)
                                                       (SPADCALL |np|
                                                                 (- (+ |k| |l|)
                                                                    1)
                                                                 (QREFELT %
                                                                          26))
                                                       (QREFELT % 27))
                                             (SPADCALL |g1| (- |l| 1)
                                                       (QREFELT % 26))
                                             (QREFELT % 28))
                                            (QREFELT % 21))))
                                (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #22#
                               (PROG1 (CDR #22#)
                                 (LETT #21#
                                       (PROG1 (CDR #21#)
                                         (LETT #20# (CDR #20#))))))
                         (GO G190) G191 (EXIT NIL))
                    (LETT |k| (+ |k| |nn|)) (LETT |pl| |npl|)
                    (EXIT (LETT |cb| |ncb|)))
                   (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
              (LETT |base_vecs| (NREVERSE |base_vecs|))
              (EXIT
               (CONS
                (PROGN
                 (LETT #24# NIL)
                 (SEQ (LETT |bv| NIL) (LETT #25# |cb|) (LETT |np| NIL)
                      (LETT #26# |pl|) G190
                      (COND
                       ((OR (ATOM #26#) (PROGN (LETT |np| (CAR #26#)) NIL)
                            (ATOM #25#) (PROGN (LETT |bv| (CAR #25#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #24#
                              (CONS
                               (CONS (SPADCALL |mA| |np| (QREFELT % 29)) |bv|)
                               #24#))))
                      (LETT #26# (PROG1 (CDR #26#) (LETT #25# (CDR #25#))))
                      (GO G190) G191 (EXIT (NREVERSE #24#))))
                (PROGN
                 (LETT #27# NIL)
                 (SEQ (LETT |bvec| NIL) (LETT #28# |base_vecs|) G190
                      (COND
                       ((OR (ATOM #28#) (PROGN (LETT |bvec| (CAR #28#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #27#
                              (CONS (SPADCALL |mA| |bvec| (QREFELT % 29))
                                    #27#))))
                      (LETT #28# (CDR #28#)) (GO G190) G191
                      (EXIT (NREVERSE #27#))))))))) 

(SDEFUN |ODESYS;USL_to_FPL|
        ((|u|
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed"))
         (%
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| F)))))
        (SPROG
         ((|us| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))))
         (SEQ
          (COND ((QEQCAR |u| 1) (CONS NIL NIL))
                ('T
                 (SEQ (LETT |us| (QCDR |u|))
                      (EXIT
                       (CONS
                        (LIST
                         (CONS (QCAR |us|) (MAKEARR1 1 (|spadConstant| % 17))))
                        (QCDR |us|))))))))) 

(SDEFUN |ODESYS;solve;MVMU;3|
        ((|mm| (|Matrix| F)) (|v| (|Vector| F))
         (|solf|
          (|Mapping|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                    "failed")
           LO F))
         (%
          (|Union|
           (|Record| (|:| |particular| (|Vector| F))
                     (|:| |basis| (|Matrix| F)))
           "failed")))
        (SPROG
         ((|res1|
           (|Record|
            (|:| |particular|
                 #1=(|List|
                     (|Record| (|:| |ratpart| (|Vector| F))
                               (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| (|Vector| F)))))
          (|part| #1#)
          (|part1|
           (|Record| (|:| |ratpart| (|Vector| F)) (|:| |coeffs| (|Vector| F))))
          (|c1inv| (F)) (|s1| (|Vector| F)) (#2=#:G103 NIL) (|bv| NIL)
          (#3=#:G104 NIL) (|bm| (|Matrix| F)))
         (SEQ
          (LETT |res1|
                (SPADCALL |mm| (LIST |v|)
                          (CONS #'|ODESYS;solve;MVMU;3!0| (VECTOR |solf| %))
                          (QREFELT % 35)))
          (LETT |part| (QCAR |res1|))
          (EXIT
           (COND ((NULL |part|) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |part1| (|SPADfirst| |part|))
                       (LETT |c1inv|
                             (SPADCALL
                              (SPADCALL (QCDR |part1|) 1 (QREFELT % 26))
                              (QREFELT % 37)))
                       (LETT |s1|
                             (SPADCALL |c1inv| (QCAR |part1|) (QREFELT % 38)))
                       (LETT |bm|
                             (SPADCALL
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |bv| NIL) (LETT #3# (QCDR |res1|))
                                    G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |bv| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (SPADCALL |bv| (QREFELT % 39))
                                             #2#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#))))
                              (QREFELT % 41)))
                       (EXIT
                        (CONS 0
                              (CONS |s1|
                                    (SPADCALL |bm| (QREFELT % 42)))))))))))) 

(SDEFUN |ODESYS;solve;MVMU;3!0| ((|lo| NIL) (|lf| NIL) ($$ NIL))
        (PROG (% |solf|)
          (LETT % (QREFELT $$ 1))
          (LETT |solf| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|ODESYS;USL_to_FPL|
             (SPADCALL |lo| (SPADCALL |lf| (QREFELT % 36)) |solf|) %))))) 

(SDEFUN |ODESYS;triangulate;MLR;4|
        ((|m| (|Matrix| F)) (|lv| (|List| (|Vector| F)))
         (%
          (|Record| (|:| A (|Matrix| F))
                    (|:| |eqs|
                         (|List|
                          (|Record| (|:| C (|Matrix| F))
                                    (|:| |lg| (|List| (|Vector| F)))
                                    (|:| |eq| LO) (|:| |lrh| (|List| F))))))))
        (SPROG
         ((|rat|
           (|Record| (|:| R (|Matrix| F)) (|:| A (|Matrix| F))
                     (|:| |Ainv| (|Matrix| F))))
          (#1=#:G130 NIL) (|v| NIL) (#2=#:G131 NIL)
          (|l|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |lg| (|List| (|Vector| F))))))
          (|er| NIL) (#3=#:G132 NIL) (|n| (|NonNegativeInteger|))
          (#4=#:G133 NIL) (|op| (LO)) (|g| NIL) (#5=#:G134 NIL)
          (|sum| (|Vector| F)) (#6=#:G135 NIL) (|j| NIL) (#7=#:G136 NIL)
          (|h0| (F)) (|lh| (|List| F))
          (|ler|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |lg| (|List| (|Vector| F)))
                      (|:| |eq| LO) (|:| |lrh| (|List| F)))))
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| 0)
              (LETT |rat|
                    (SPADCALL |m| (|spadConstant| % 50)
                              (CONS #'|ODESYS;triangulate;MLR;4!0|
                                    (VECTOR % (QREFELT % 9)))
                              (QREFELT % 55)))
              (LETT |l|
                    (SPADCALL (QVELT |rat| 0)
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |v| NIL) (LETT #2# |lv|) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |v| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL (QVELT |rat| 2) |v|
                                                       (QREFELT % 29))
                                             #1#))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#))))
                              (QREFELT % 58)))
              (LETT |ler| NIL)
              (SEQ (LETT |er| NIL) (LETT #3# |l|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |er| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |n| (ANROWS (QCAR |er|)))
                        (LETT |op| (|spadConstant| % 16))
                        (SEQ (LETT |j| 0) (LETT #4# (- |n| 1)) G190
                             (COND ((|greater_SI| |j| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |op|
                                     (SPADCALL |op|
                                               (SPADCALL
                                                (SPADCALL (QCAR |er|) |n|
                                                          (+ |j| 1)
                                                          (QREFELT % 59))
                                                |j| (QREFELT % 61))
                                               (QREFELT % 62)))))
                             (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |op|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 17) |n|
                                         (QREFELT % 61))
                               |op| (QREFELT % 63)))
                        (LETT |lh| NIL)
                        (SEQ (LETT |g| NIL) (LETT #5# (QCDR |er|)) G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |g| (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |sum| (MAKEARR1 |n| (|spadConstant| % 15)))
                              (SEQ (LETT |j| 1) (LETT #6# (- |n| 1)) G190
                                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SPADCALL |sum| (+ |j| 1)
                                               (SPADCALL
                                                (SPADCALL (QREFELT % 9)
                                                          (SPADCALL |sum| |j|
                                                                    (QREFELT %
                                                                             26))
                                                          (QREFELT % 27))
                                                (SPADCALL |g| |j|
                                                          (QREFELT % 26))
                                                (QREFELT % 64))
                                               (QREFELT % 21))))
                                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |h0| (|spadConstant| % 15))
                              (SEQ (LETT |j| 1) (LETT #7# |n|) G190
                                   (COND ((|greater_SI| |j| #7#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |h0|
                                           (SPADCALL |h0|
                                                     (SPADCALL
                                                      (SPADCALL (QCAR |er|) |n|
                                                                |j|
                                                                (QREFELT % 59))
                                                      (SPADCALL |sum| |j|
                                                                (QREFELT % 26))
                                                      (QREFELT % 65))
                                                     (QREFELT % 28)))))
                                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                   (EXIT NIL))
                              (LETT |h0|
                                    (SPADCALL
                                     (SPADCALL |h0|
                                               (SPADCALL (QREFELT % 9)
                                                         (SPADCALL |sum| |n|
                                                                   (QREFELT %
                                                                            26))
                                                         (QREFELT % 27))
                                               (QREFELT % 64))
                                     (SPADCALL |g| |n| (QREFELT % 26))
                                     (QREFELT % 64)))
                              (EXIT (LETT |lh| (CONS |h0| |lh|))))
                             (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                        (LETT |lh| (NREVERSE |lh|))
                        (LETT |ler|
                              (CONS (VECTOR (QCAR |er|) (QCDR |er|) |op| |lh|)
                                    |ler|))
                        (EXIT (LETT |k| (+ |k| |n|))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (QVELT |rat| 1) |ler|))))) 

(SDEFUN |ODESYS;triangulate;MLR;4!0| ((|f1| NIL) ($$ NIL))
        (PROG (|diff| %)
          (LETT |diff| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |diff| |f1| (QREFELT % 27)) (QREFELT % 51)))))) 

(SDEFUN |ODESYS;triangulate;MVR;5|
        ((|m| (|Matrix| F)) (|v| (|Vector| F))
         (%
          (|Record| (|:| A (|Matrix| F))
                    (|:| |eqs|
                         (|List|
                          (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F))
                                    (|:| |eq| LO) (|:| |rh| F)))))))
        (SPROG
         ((|res1|
           (|Record| (|:| A (|Matrix| F))
                     (|:| |eqs|
                          (|List|
                           (|Record| (|:| C (|Matrix| F))
                                     (|:| |lg| (|List| (|Vector| F)))
                                     (|:| |eq| LO) (|:| |lrh| (|List| F)))))))
          (|er2| NIL) (#1=#:G149 NIL)
          (|ler|
           (|List|
            (|Record| (|:| C (|Matrix| F)) (|:| |g| (|Vector| F)) (|:| |eq| LO)
                      (|:| |rh| F)))))
         (SEQ (LETT |res1| (SPADCALL |m| (LIST |v|) (QREFELT % 14)))
              (LETT |ler| NIL)
              (SEQ (LETT |er2| NIL) (LETT #1# (QCDR |res1|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |er2| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ler|
                           (CONS
                            (VECTOR (QVELT |er2| 0)
                                    (|SPADfirst| (QVELT |er2| 1))
                                    (QVELT |er2| 2)
                                    (|SPADfirst| (QVELT |er2| 3)))
                            |ler|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ler| (NREVERSE |ler|)) (EXIT (CONS (QCAR |res1|) |ler|))))) 

(SDEFUN |ODESYS;solveInField;MLMR;6|
        ((|m| (|Matrix| LO)) (|lv| (|List| (|Vector| F)))
         (|solf|
          (|Mapping|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| F)))
           LO (|List| F)))
         (%
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Vector| F))
                           (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| (|Vector| F))))))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (#1=#:G172 NIL) (|i| NIL)
          (#2=#:G173 NIL) (#3=#:G171 NIL) (|u| (|Union| (|Matrix| F) "failed"))
          (#4=#:G170 NIL)
          (|rec|
           (|Union|
            (|Record|
             (|:| |particular|
                  (|List|
                   (|Record| (|:| |ratpart| (|Vector| F))
                             (|:| |coeffs| (|Vector| F)))))
             (|:| |basis| (|List| (|Vector| F))))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((EQL (LETT |n| (ANROWS |m|)) (ANCOLS |m|))
              (SEQ
               (LETT |u|
                     (|ODESYS;M2F|
                      (SPADCALL
                       (SPADCALL
                        (PROGN
                         (LETT #1# (GETREFV |n|))
                         (SEQ (LETT |i| 1) (LETT #2# |n|) (LETT #3# 0) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ (EXIT (SETELT #1# #3# (QREFELT % 9))))
                              (LETT #3#
                                    (PROG1 (|inc_SI| #3#)
                                      (LETT |i| (|inc_SI| |i|))))
                              (GO G190) G191 (EXIT NIL))
                         #1#)
                        (QREFELT % 71))
                       |m| (QREFELT % 72))
                      %))
               (EXIT
                (COND
                 ((QEQCAR |u| 0)
                  (PROGN
                   (LETT #4# (SPADCALL (QCDR |u|) |lv| |solf| (QREFELT % 35)))
                   (GO #5=#:G168))))))))
            (LETT |rec|
                  (SPADCALL |m| (|spadConstant| % 15) |lv| |solf|
                            (QREFELT % 75)))
            (EXIT
             (COND
              ((QEQCAR |rec| 1)
               (|error| "solveInField: system is underdetermined"))
              ('T (QCDR |rec|))))))
          #5# (EXIT #4#)))) 

(SDEFUN |ODESYS;M2F| ((|m| (|Matrix| LO)) (% (|Union| (|Matrix| F) "failed")))
        (SPROG
         ((|mf| (|Matrix| F)) (|i| NIL) (#1=#:G191 NIL) (|j| NIL)
          (#2=#:G192 NIL) (|u| (|Union| F "failed")) (#3=#:G190 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |mf|
                  (MAKE_MATRIX1 (ANROWS |m|) (ANCOLS |m|)
                                (|spadConstant| % 15)))
            (SEQ (LETT |i| (PROGN |m| 1))
                 (LETT #1# (SPADCALL |m| (QREFELT % 77))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (PROGN |m| 1))
                        (LETT #2# (SPADCALL |m| (QREFELT % 78))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |u|
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 79))
                                         (QREFELT % 81)))
                         (EXIT
                          (COND
                           ((QEQCAR |u| 1)
                            (PROGN
                             (LETT #3# (CONS 1 "failed"))
                             (GO #4=#:G189)))
                           ('T
                            (SPADCALL |mf| |i| |j| (QCDR |u|)
                                      (QREFELT % 82))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |mf|))))
          #4# (EXIT #3#)))) 

(SDEFUN |ODESYS;triangulate;MLR;8|
        ((|m| (|Matrix| LO)) (|lv| (|List| (|Vector| F)))
         (%
          (|Record| (|:| |mat| (|Matrix| LO))
                    (|:| |vecs| (|List| (|Vector| F))))))
        (SPADCALL |m| (|spadConstant| % 15) |lv| (QREFELT % 84))) 

(SDEFUN |ODESYS;triangulate;MVR;9|
        ((|m| (|Matrix| LO)) (|v| (|Vector| F))
         (% (|Record| (|:| |mat| (|Matrix| LO)) (|:| |vec| (|Vector| F)))))
        (SPROG
         ((|res1|
           (|Record| (|:| |mat| (|Matrix| LO))
                     (|:| |vecs| (|List| (|Vector| F))))))
         (SEQ (LETT |res1| (SPADCALL |m| (LIST |v|) (QREFELT % 85)))
              (EXIT (CONS (QCAR |res1|) (|SPADfirst| (QCDR |res1|))))))) 

(DECLAIM (NOTINLINE |SystemODESolver;|)) 

(DEFUN |SystemODESolver;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|SystemODESolver| DV$1 DV$2))
          (LETT % (GETREFV 92))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SystemODESolver| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (SPADCALL (QREFELT % 8)))
          %))) 

(DEFUN |SystemODESolver| (&REST #1=#:G207)
  (SPROG NIL
         (PROG (#2=#:G208)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SystemODESolver|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SystemODESolver;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SystemODESolver|)))))))))) 

(MAKEPROP '|SystemODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . D)
              '|diff|
              (|Record| (|:| C 12) (|:| |lg| 13) (|:| |eq| 7) (|:| |lrh| 22))
              (|Record| (|:| A 12) (|:| |eqs| (|List| 10))) (|Matrix| 6)
              (|List| 20) |ODESYS;triangulate;MLR;4| (4 . |0|) (8 . |0|)
              (12 . |1|) (16 . |1|) (|Integer|) (|Vector| 6) (20 . |setelt!|)
              (|List| 6)
              (|LinearCombinationUtilities| 6 (|SparseUnivariatePolynomial| 6))
              (27 . |lin_comb|) (33 . |lin_comb|) (39 . |elt|) (45 . |elt|)
              (51 . -) (57 . *) (|Record| (|:| |ratpart| 20) (|:| |coeffs| 20))
              (|Record| (|:| |particular| (|List| 30)) (|:| |basis| 13))
              (|Record| (|:| |ratpart| 6) (|:| |coeffs| 20))
              (|Record| (|:| |particular| (|List| 32)) (|:| |basis| 22))
              (|Mapping| 33 7 22) |ODESYS;solve;MLMR;1| (63 . |first|)
              (68 . |inv|) (73 . *) (79 . |entries|) (|List| 22)
              (84 . |matrix|) (89 . |transpose|)
              (|Record| (|:| |particular| 20) (|:| |basis| 12))
              (|Union| 43 '#1="failed")
              (|Record| (|:| |particular| 6) (|:| |basis| 22))
              (|Union| 45 '#2="failed") (|Mapping| 46 7 6)
              |ODESYS;solve;MVMU;3| (|Automorphism| 6) (94 . |1|) (98 . -)
              (|Record| (|:| R 12) (|:| A 12) (|:| |Ainv| 12)) (|Mapping| 6 6)
              (|PseudoLinearNormalForm| 6) (103 . |normalForm|)
              (|Record| (|:| C 12) (|:| |lg| 13)) (|List| 56)
              (110 . |companionBlocks|) (116 . |elt|) (|NonNegativeInteger|)
              (123 . |monomial|) (129 . +) (135 . -) (141 . +) (147 . *)
              (|Record| (|:| C 12) (|:| |g| 20) (|:| |eq| 7) (|:| |rh| 6))
              (|Record| (|:| A 12) (|:| |eqs| (|List| 66)))
              |ODESYS;triangulate;MVR;5| (|Vector| 7) (|Matrix| 7)
              (153 . |diagonalMatrix|) (158 . -) (|Union| 31 '"failed")
              (|OrePolynomialMatrixOperations| 6 7) (164 . |solve|)
              |ODESYS;solveInField;MLMR;6| (172 . |maxRowIndex|)
              (177 . |maxColIndex|) (182 . |elt|) (|Union| 6 '"failed")
              (189 . |retractIfCan|) (194 . |setelt!|)
              (|Record| (|:| |mat| 70) (|:| |vecs| 13)) (202 . |rowEchelon|)
              |ODESYS;triangulate;MLR;8|
              (|Record| (|:| |mat| 70) (|:| |vec| 20))
              |ODESYS;triangulate;MVR;9| (|Union| 20 '#3="failed")
              (|Record| (|:| |particular| 88) (|:| |basis| 13))
              (|Record| (|:| |particular| 80) (|:| |basis| 22))
              (|Mapping| 90 7 6))
           '#(|triangulate| 209 |solveInField| 233 |solve| 247) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|triangulate|
                                 ((|Record| (|:| A (|Matrix| |#1|))
                                            (|:| |eqs|
                                                 (|List|
                                                  (|Record|
                                                   (|:| C (|Matrix| |#1|))
                                                   (|:| |g| (|Vector| |#1|))
                                                   (|:| |eq| |#2|)
                                                   (|:| |rh| |#1|)))))
                                  (|Matrix| |#1|) (|Vector| |#1|)))
                                T)
                              '((|triangulate|
                                 ((|Record| (|:| A (|Matrix| |#1|))
                                            (|:| |eqs|
                                                 (|List|
                                                  (|Record|
                                                   (|:| C (|Matrix| |#1|))
                                                   (|:| |lg|
                                                        (|List|
                                                         (|Vector| |#1|)))
                                                   (|:| |eq| |#2|)
                                                   (|:| |lrh|
                                                        (|List| |#1|))))))
                                  (|Matrix| |#1|) (|List| (|Vector| |#1|))))
                                T)
                              '((|triangulate|
                                 ((|Record| (|:| |mat| (|Matrix| |#2|))
                                            (|:| |vec| (|Vector| |#1|)))
                                  (|Matrix| |#2|) (|Vector| |#1|)))
                                T)
                              '((|triangulate|
                                 ((|Record| (|:| |mat| (|Matrix| |#2|))
                                            (|:| |vecs|
                                                 (|List| (|Vector| |#1|))))
                                  (|Matrix| |#2|) (|List| (|Vector| |#1|))))
                                T)
                              '((|solve|
                                 ((|Union|
                                   (|Record| (|:| |particular| (|Vector| |#1|))
                                             (|:| |basis| (|Matrix| |#1|)))
                                   #1#)
                                  (|Matrix| |#1|) (|Vector| |#1|)
                                  (|Mapping|
                                   (|Union|
                                    (|Record| (|:| |particular| |#1|)
                                              (|:| |basis| (|List| |#1|)))
                                    #2#)
                                   |#2| |#1|)))
                                T)
                              '((|solve|
                                 ((|Record|
                                   (|:| |particular|
                                        (|List|
                                         (|Record|
                                          (|:| |ratpart| (|Vector| |#1|))
                                          (|:| |coeffs| (|Vector| |#1|)))))
                                   (|:| |basis| (|List| (|Vector| |#1|))))
                                  (|Matrix| |#1|) (|List| (|Vector| |#1|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |particular|
                                         (|List|
                                          (|Record| (|:| |ratpart| |#1|)
                                                    (|:| |coeffs|
                                                         (|Vector| |#1|)))))
                                    (|:| |basis| (|List| |#1|)))
                                   |#2| (|List| |#1|))))
                                T)
                              '((|solveInField|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| |#1|) #3#))
                                   (|:| |basis| (|List| (|Vector| |#1|))))
                                  (|Matrix| |#2|) (|Vector| |#1|)
                                  (|Mapping|
                                   (|Record|
                                    (|:| |particular| (|Union| |#1| "failed"))
                                    (|:| |basis| (|List| |#1|)))
                                   |#2| |#1|)))
                                T)
                              '((|solveInField|
                                 ((|Record|
                                   (|:| |particular|
                                        (|List|
                                         (|Record|
                                          (|:| |ratpart| (|Vector| |#1|))
                                          (|:| |coeffs| (|Vector| |#1|)))))
                                   (|:| |basis| (|List| (|Vector| |#1|))))
                                  (|Matrix| |#2|) (|List| (|Vector| |#1|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |particular|
                                         (|List|
                                          (|Record| (|:| |ratpart| |#1|)
                                                    (|:| |coeffs|
                                                         (|Vector| |#1|)))))
                                    (|:| |basis| (|List| |#1|)))
                                   |#2| (|List| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 91
                                            '(0 7 0 8 0 6 0 15 0 7 0 16 0 6 0
                                              17 0 7 0 18 3 20 6 0 19 6 21 2 23
                                              6 20 22 24 2 23 20 20 13 25 2 20
                                              6 0 19 26 2 7 6 0 6 27 2 6 0 0 0
                                              28 2 12 20 0 20 29 1 22 6 0 36 1
                                              6 0 0 37 2 20 0 6 0 38 1 20 22 0
                                              39 1 12 0 40 41 1 12 0 0 42 0 49
                                              0 50 1 6 0 0 51 3 54 52 12 49 53
                                              55 2 54 57 12 13 58 3 12 6 0 19
                                              19 59 2 7 0 6 60 61 2 7 0 0 0 62
                                              2 7 0 0 0 63 2 6 0 0 0 64 2 6 0 0
                                              0 65 1 70 0 69 71 2 70 0 0 0 72 4
                                              74 73 70 6 13 34 75 1 70 19 0 77
                                              1 70 19 0 78 3 70 7 0 19 19 79 1
                                              7 80 0 81 4 12 6 0 19 19 6 82 3
                                              74 83 70 6 13 84 2 0 86 70 20 87
                                              2 0 83 70 13 85 2 0 67 12 20 68 2
                                              0 11 12 13 14 3 0 89 70 20 91 1 3
                                              0 31 70 13 34 76 3 0 44 12 20 47
                                              48 3 0 31 12 13 34 35)))))
           '|lookupComplete|)) 
