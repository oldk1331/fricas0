
(SDEFUN |MAGCD2;algebraicGcd1a|
        ((|x| (MP)) (|y| (MP)) (|mu| (MD)) (|vx| (|Symbol|))
         (|lvz| (|List| (|Symbol|))) (% (|Union| MPT "failed")))
        (SPROG
         ((|xuu| #1=(|Union| MPT "failed")) (|yuu| #1#) (|w1| (MPT))
          (#2=#:G45 NIL) (|xu| (MPT)) (|yu| (MPT)))
         (SEQ
          (EXIT
           (SEQ (LETT |xuu| (SPADCALL |x| |vx| |lvz| |mu| (QREFELT % 15)))
                (EXIT
                 (COND ((QEQCAR |xuu| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ (LETT |xu| (QCDR |xuu|))
                             (LETT |yuu|
                                   (SPADCALL |y| |vx| |lvz| |mu|
                                             (QREFELT % 15)))
                             (EXIT
                              (COND ((QEQCAR |yuu| 1) (CONS 1 "failed"))
                                    (#3#
                                     (SEQ (LETT |yu| (QCDR |yuu|))
                                          (EXIT
                                           (SEQ G190 NIL
                                                (SEQ
                                                 (LETT |w1|
                                                       (SPADCALL |xu| |yu| |mu|
                                                                 (QREFELT %
                                                                          16)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL |w1|
                                                              (QREFELT % 18))
                                                    (PROGN
                                                     (LETT #2#
                                                           (SPADCALL |yu| |mu|
                                                                     (QREFELT %
                                                                              19)))
                                                     (GO #4=#:G44)))
                                                   ('T
                                                    (SEQ (LETT |xu| |yu|)
                                                         (EXIT
                                                          (LETT |yu|
                                                                |w1|)))))))
                                                NIL (GO G190) G191
                                                (EXIT NIL)))))))))))))
          #4# (EXIT #2#)))) 

(SDEFUN |MAGCD2;compare_coeff1|
        ((|nv| (|Integer|)) (|exps| (|SortedExponentVector|))
         (|nexps| (|SortedExponentVector|)) (% (|Integer|)))
        (SPROG
         ((|ne| #1=(|Integer|)) (|nn| #1#) (|i| NIL) (#2=#:G54 NIL)
          (#3=#:G53 NIL) (#4=#:G52 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ne| (- (QV_LEN_U32 |exps|) |nv|))
                (LETT |nn| (- (QV_LEN_U32 |nexps|) |nv|))
                (SEQ (LETT |i| 0) (LETT #2# (- |nv| 1)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((< (ELT_U32 |nexps| (+ |nn| |i|))
                            (ELT_U32 |exps| (+ |ne| |i|)))
                         (PROGN (LETT #3# -1) (GO #5=#:G51)))
                        ('T
                         (SEQ
                          (EXIT
                           (COND
                            ((> (ELT_U32 |nexps| (+ |nn| |i|))
                                (ELT_U32 |exps| (+ |ne| |i|)))
                             (PROGN
                              (LETT #4# (PROGN (LETT #3# 1) (GO #5#)))
                              (GO #6=#:G47)))))
                          #6# (EXIT #4#))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 0)))
          #5# (EXIT #3#)))) 

(SDEFUN |MAGCD2;algebraicGcd1|
        ((|x| (MP)) (|y| (MP)) (|lm| (|List| MP))
         (|pss|
          (|Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
                    (|:| |degg| (|Integer|)) (|:| |sizem| #1=(|Integer|))
                    (|:| |sldeg| (|List| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #2=(|Symbol|))
                    (|:| |svz| #3=(|List| (|Symbol|)))
                    (|:| |offsetdata| #4=(|Vector| (|Integer|)))
                    (|:| |pss1|
                         (|Record| (|:| |prime| #5=(|Integer|))
                                   (|:| |eval1coeffbuf| (|U32Vector|))
                                   (|:| |eval1expbuf|
                                        (|SortedExponentVector|))))))
         (%
          (|Union|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|)))
           "failed")))
        (SPROG
         ((|p| #5#) (|vx| #2#) (|lvz| #3#) (|mdp| (|Union| MD "failed"))
          (|mu| (MD)) (|pres| (|Union| MPT "failed")) (|res1| (MPT))
          (|dg| (|Integer|)) (|msize| #1#) (|nsize| (|NonNegativeInteger|))
          (|offsets| #4#))
         (SEQ (LETT |p| (QVELT (QVELT |pss| 10) 0)) (LETT |vx| (QVELT |pss| 7))
              (LETT |lvz| (QVELT |pss| 8))
              (LETT |mdp| (SPADCALL |lm| |lvz| |p| (QREFELT % 23)))
              (EXIT
               (COND ((QEQCAR |mdp| 1) (CONS 1 "failed"))
                     (#6='T
                      (SEQ (LETT |mu| (QCDR |mdp|))
                           (LETT |pres|
                                 (|MAGCD2;algebraicGcd1a| |x| |y| |mu| |vx|
                                  |lvz| %))
                           (EXIT
                            (COND ((QEQCAR |pres| 1) (CONS 1 "failed"))
                                  (#6#
                                   (SEQ (LETT |res1| (QCDR |pres|))
                                        (LETT |dg|
                                              (SPADCALL |res1| (QREFELT % 24)))
                                        (EXIT
                                         (COND
                                          ((> |dg| (QVELT |pss| 2))
                                           (CONS 1 "failed"))
                                          (#6#
                                           (SEQ (LETT |msize| (QVELT |pss| 3))
                                                (COND
                                                 ((< |dg| (QVELT |pss| 2))
                                                  (SEQ (QSETVELT |pss| 2 |dg|)
                                                       (LETT |nsize|
                                                             (* (+ |dg| 1)
                                                                |msize|))
                                                       (QSETVELT |pss| 5
                                                                 (SPADCALL |dg|
                                                                           |msize|
                                                                           |mu|
                                                                           (QREFELT
                                                                            %
                                                                            26)))
                                                       (EXIT
                                                        (QSETVELT |pss| 6
                                                                  (GETREFV_U32
                                                                   |nsize|
                                                                   0))))))
                                                (SPADCALL |res1|
                                                          (QVELT |pss| 6) |dg|
                                                          |mu| (QREFELT % 29))
                                                (LETT |offsets|
                                                      (QVELT |pss| 9))
                                                (EXIT
                                                 (CONS 0
                                                       (VECTOR 1 |offsets|
                                                               (QVELT |pss| 5)
                                                               (QVELT |pss|
                                                                      6))))))))))))))))))) 

(SDEFUN |MAGCD2;algebraicGcd2|
        ((|x| (MP)) (|y| (MP)) (|lm| (|List| MP)) (|lv| (|List| (|Symbol|)))
         (|pss|
          (|Record| (|:| |degx| #1=(|Integer|)) (|:| |degy| #2=(|Integer|))
                    (|:| |degg| #3=(|Integer|)) (|:| |sizem| (|Integer|))
                    (|:| |sldeg| (|List| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
                    (|:| |svz| (|List| (|Symbol|)))
                    (|:| |offsetdata| #5=(|Vector| (|Integer|)))
                    (|:| |pss1|
                         #6=(|Record| (|:| |prime| #7=(|Integer|))
                                      (|:| |eval1coeffbuf| (|U32Vector|))
                                      (|:| |eval1expbuf|
                                           (|SortedExponentVector|))))))
         (%
          #8=(|Union|
              (|Record| (|:| |nvars| (|Integer|))
                        (|:| |offsetdata| (|Vector| (|Integer|)))
                        (|:| |expdata| (|SortedExponentVector|))
                        (|:| |coeffdata| (|U32Vector|)))
              "failed")))
        (SPROG
         ((|nv| #9=(|NonNegativeInteger|)) (|pss1| #6#) (|p| #7#) (|vx| #4#)
          (|offsets| #5#) (|dx| #1#) (|dy| #2#) (|vt| (|Symbol|))
          (|nlv| (|List| (|Symbol|))) (|nbv| #9#) (|t| (|Integer|))
          (|lt| (|List| (|Integer|))) (|xtu| #10=(|Union| MP #11="failed"))
          (|xt| (MP)) (|ytu| #10#) (#12=#:G85 NIL) (|yt| (MP)) (#13=#:G135 NIL)
          (|lmtu| #10#) (|lmt| (|List| MP)) (|z| NIL) (#14=#:G138 NIL)
          (|deg| NIL) (#15=#:G137 NIL) (|m| NIL) (#16=#:G136 NIL)
          (|bad_ev| (|Boolean|)) (#17=#:G131 NIL) (|gtfp| #8#) (#18=#:G130 NIL)
          (|gtf|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|nexps| (|SortedExponentVector|)) (|dg| #3#) (|cc| (|Integer|))
          (|bad_cnt| (|Integer|)) (|dl| (|List| (|List| (|Integer|))))
          (|odl| #19=(|List| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|exps| (|SortedExponentVector|)) (|ncc| (|NonNegativeInteger|))
          (|rstate| (|VectorModularReconstructor|))
          (|n0| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|n1| (|NonNegativeInteger|)) (|ncoeffs| (|U32Vector|)) (|j| NIL)
          (#20=#:G139 NIL) (|ndl| #19#) (|jl| (|Integer|)) (|i| (|Integer|))
          (|coeffs| (|U32Vector|)) (|good_cnt| (|Integer|))
          (|pp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (#21=#:G133 NIL) (#22=#:G134 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nv| (LENGTH |lv|))
                (EXIT
                 (COND
                  ((EQL |nv| 0) (|MAGCD2;algebraicGcd1| |x| |y| |lm| |pss| %))
                  ('T
                   (SEQ (LETT |pss1| (QVELT |pss| 10))
                        (LETT |p| (QVELT |pss1| 0)) (LETT |vx| (QVELT |pss| 7))
                        (LETT |offsets| (QVELT |pss| 9)) (LETT |lt| NIL)
                        (LETT |exps| (GETREFV_U32 0 0))
                        (LETT |dx| (QVELT |pss| 0)) (LETT |dy| (QVELT |pss| 1))
                        (LETT |dg| (QVELT |pss| 2))
                        (LETT |vt| (|SPADfirst| |lv|)) (LETT |nlv| (CDR |lv|))
                        (LETT |nbv| (LENGTH (QVELT |pss| 8)))
                        (LETT |good_cnt| 0) (LETT |bad_cnt| 0)
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (EXIT
                                (SEQ (LETT |t| (RANDOM |p|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |t| |lt| (QREFELT % 31))
                                        (PROGN
                                         (LETT #21# |$NoValue|)
                                         (GO #23=#:G79)))
                                       ('T
                                        (SEQ (LETT |lt| (CONS |t| |lt|))
                                             (LETT |lmt| NIL)
                                             (LETT |bad_ev| NIL)
                                             (LETT |xtu|
                                                   (SPADCALL |x| |vt| |t|
                                                             |pss1|
                                                             (QREFELT % 34)))
                                             (LETT |bad_ev| (QEQCAR |xtu| 1))
                                             (COND
                                              ((NULL |bad_ev|)
                                               (SEQ
                                                (LETT |xt|
                                                      (PROG2 (LETT #12# |xtu|)
                                                          (QCDR #12#)
                                                        (|check_union2|
                                                         (QEQCAR #12# 0)
                                                         (QREFELT % 7)
                                                         (|Union| (QREFELT % 7)
                                                                  #11#)
                                                         #12#)))
                                                (LETT |ytu|
                                                      (SPADCALL |y| |vt| |t|
                                                                |pss1|
                                                                (QREFELT %
                                                                         34)))
                                                (LETT |bad_ev|
                                                      (QEQCAR |ytu| 1))
                                                (EXIT
                                                 (COND
                                                  ((NULL |bad_ev|)
                                                   (LETT |yt|
                                                         (PROG2
                                                             (LETT #12# |ytu|)
                                                             (QCDR #12#)
                                                           (|check_union2|
                                                            (QEQCAR #12# 0)
                                                            (QREFELT % 7)
                                                            (|Union|
                                                             (QREFELT % 7)
                                                             #11#)
                                                            #12#)))))))))
                                             (SEQ (LETT |m| NIL)
                                                  (LETT #13# |lm|) G190
                                                  (COND
                                                   ((OR (ATOM #13#)
                                                        (PROGN
                                                         (LETT |m| (CAR #13#))
                                                         NIL)
                                                        (NULL (NULL |bad_ev|)))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |lmtu|
                                                         (SPADCALL |m| |vt| |t|
                                                                   |pss1|
                                                                   (QREFELT %
                                                                            34)))
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |lmtu| 1)
                                                      (LETT |bad_ev| 'T))
                                                     ('T
                                                      (LETT |lmt|
                                                            (CONS (QCDR |lmtu|)
                                                                  |lmt|))))))
                                                  (LETT #13# (CDR #13#))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |lmt| (NREVERSE |lmt|))
                                             (COND
                                              ((NULL |bad_ev|)
                                               (SEQ (LETT |z| NIL)
                                                    (LETT #14# (QVELT |pss| 8))
                                                    (LETT |deg| NIL)
                                                    (LETT #15# (QVELT |pss| 4))
                                                    (LETT |m| NIL)
                                                    (LETT #16# |lmt|) G190
                                                    (COND
                                                     ((OR (ATOM #16#)
                                                          (PROGN
                                                           (LETT |m|
                                                                 (CAR #16#))
                                                           NIL)
                                                          (ATOM #15#)
                                                          (PROGN
                                                           (LETT |deg|
                                                                 (CAR #15#))
                                                           NIL)
                                                          (ATOM #14#)
                                                          (PROGN
                                                           (LETT |z|
                                                                 (CAR #14#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (COND
                                                       ((<
                                                         (SPADCALL |m| |z|
                                                                   (QREFELT %
                                                                            36))
                                                         |deg|)
                                                        (LETT |bad_ev| 'T)))))
                                                    (LETT #16#
                                                          (PROG1 (CDR #16#)
                                                            (LETT #15#
                                                                  (PROG1
                                                                      (CDR
                                                                       #15#)
                                                                    (LETT #14#
                                                                          (CDR
                                                                           #14#))))))
                                                    (GO G190) G191
                                                    (EXIT NIL))))
                                             (COND
                                              ((OR |bad_ev|
                                                   (<
                                                    (SPADCALL |xt| |vx|
                                                              (QREFELT % 36))
                                                    |dx|))
                                               (EXIT
                                                (SEQ
                                                 (EXIT
                                                  (SEQ
                                                   (LETT |bad_cnt|
                                                         (+ |bad_cnt| 1))
                                                   (EXIT
                                                    (COND
                                                     ((> |bad_cnt|
                                                         (+ |good_cnt| 2))
                                                      (PROGN
                                                       (LETT #17#
                                                             (PROGN
                                                              (LETT #22#
                                                                    (CONS 1
                                                                          #24="failed"))
                                                              (GO #25=#:G129)))
                                                       (GO #26=#:G94)))))))
                                                 #26# (EXIT #17#))))
                                              ((<
                                                (SPADCALL |yt| |vx|
                                                          (QREFELT % 36))
                                                |dy|)
                                               (EXIT
                                                (SEQ
                                                 (LETT |bad_cnt|
                                                       (+ |bad_cnt| 1))
                                                 (EXIT
                                                  (COND
                                                   ((> |bad_cnt|
                                                       (+ |good_cnt| 2))
                                                    (PROGN
                                                     (LETT #22# (CONS 1 #24#))
                                                     (GO #25#)))))))))
                                             (LETT |gtfp|
                                                   (|MAGCD2;algebraicGcd2| |xt|
                                                    |yt| |lmt| |nlv| |pss| %))
                                             (EXIT
                                              (COND
                                               ((QEQCAR |gtfp| 1)
                                                (SEQ
                                                 (EXIT
                                                  (SEQ
                                                   (LETT |bad_cnt|
                                                         (+ |bad_cnt| 1))
                                                   (EXIT
                                                    (COND
                                                     ((> |bad_cnt|
                                                         (+ |good_cnt| 2))
                                                      (PROGN
                                                       (LETT #18#
                                                             (PROGN
                                                              (LETT #22#
                                                                    (CONS 1
                                                                          "failed"))
                                                              (GO #25#)))
                                                       (GO #27=#:G99)))))))
                                                 #27# (EXIT #18#)))
                                               ('T
                                                (SEQ (LETT |gtf| (QCDR |gtfp|))
                                                     (LETT |nexps|
                                                           (QVELT |gtf| 2))
                                                     (LETT |coeffs|
                                                           (QVELT |gtf| 3))
                                                     (EXIT
                                                      (COND
                                                       ((EQL (QVELT |pss| 2) 0)
                                                        (PROGN
                                                         (LETT #22#
                                                               (CONS 0
                                                                     (VECTOR
                                                                      (+
                                                                       (+ |nv|
                                                                          |nbv|)
                                                                       1)
                                                                      (MAKEARR1
                                                                       1 0)
                                                                      (GETREFV_U32
                                                                       (+
                                                                        (+ |nv|
                                                                           |nbv|)
                                                                        1)
                                                                       0)
                                                                      (GETREFV_U32
                                                                       1 1))))
                                                         (GO #25#)))
                                                       ('T
                                                        (SEQ
                                                         (COND
                                                          ((OR
                                                            (< (QVELT |pss| 2)
                                                               |dg|)
                                                            (SPADCALL |exps|
                                                                      (QREFELT
                                                                       % 39)))
                                                           (SEQ
                                                            (LETT |exps|
                                                                  |nexps|)
                                                            (LETT |rstate|
                                                                  (SPADCALL
                                                                   (QV_LEN_U32
                                                                    |coeffs|)
                                                                   (QVELT
                                                                    |pss1| 0)
                                                                   (QREFELT %
                                                                            38)))
                                                            (LETT |bad_cnt| 0)
                                                            (EXIT
                                                             (LETT |good_cnt|
                                                                   0)))))
                                                         (COND
                                                          ((< (QVELT |pss| 2)
                                                              |dg|)
                                                           (LETT |dg|
                                                                 (QVELT |pss|
                                                                        2))))
                                                         (LETT |cc|
                                                               (|MAGCD2;compare_coeff1|
                                                                (+ |nv| |nbv|)
                                                                |exps| |nexps|
                                                                %))
                                                         (EXIT
                                                          (COND
                                                           ((< |cc| 0)
                                                            (SEQ
                                                             (LETT |bad_cnt|
                                                                   (+ |bad_cnt|
                                                                      1))
                                                             (EXIT
                                                              (COND
                                                               ((> |bad_cnt|
                                                                   (+
                                                                    |good_cnt|
                                                                    2))
                                                                (PROGN
                                                                 (LETT #22#
                                                                       (CONS 1
                                                                             "failed"))
                                                                 (GO
                                                                  #25#)))))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |dl|
                                                                   (SPADCALL
                                                                    (+ |nv|
                                                                       |nbv|)
                                                                    |offsets|
                                                                    |exps|
                                                                    |offsets|
                                                                    |nexps|
                                                                    (QREFELT %
                                                                             43)))
                                                             (LETT |odl|
                                                                   (SPADCALL
                                                                    |dl| 1
                                                                    (QREFELT %
                                                                             44)))
                                                             (LETT |ndl|
                                                                   (SPADCALL
                                                                    |dl| 2
                                                                    (QREFELT %
                                                                             44)))
                                                             (COND
                                                              ((SPADCALL |odl|
                                                                         NIL
                                                                         (QREFELT
                                                                          %
                                                                          45))
                                                               (SEQ
                                                                (LETT |oer|
                                                                      (SPADCALL
                                                                       (+ |nv|
                                                                          |nbv|)
                                                                       |odl|
                                                                       |ndl|
                                                                       |offsets|
                                                                       |exps|
                                                                       |offsets|
                                                                       |nexps|
                                                                       (QREFELT
                                                                        % 47)))
                                                                (LETT |exps|
                                                                      (QCDR
                                                                       |oer|))
                                                                (LETT |ncc|
                                                                      (|quotient_INT|
                                                                       (QV_LEN_U32
                                                                        |exps|)
                                                                       (+ |nv|
                                                                          |nbv|)))
                                                                (LETT |rstate|
                                                                      (SPADCALL
                                                                       |ncc|
                                                                       |p|
                                                                       (QREFELT
                                                                        % 38)))
                                                                (EXIT
                                                                 (LETT
                                                                  |good_cnt|
                                                                  0)))))
                                                             (COND
                                                              ((SPADCALL |ndl|
                                                                         NIL
                                                                         (QREFELT
                                                                          %
                                                                          45))
                                                               (SEQ
                                                                (LETT |n0|
                                                                      (QV_LEN_U32
                                                                       |coeffs|))
                                                                (LETT |nn|
                                                                      (LENGTH
                                                                       |ndl|))
                                                                (LETT |n1|
                                                                      (+ |n0|
                                                                         |nn|))
                                                                (LETT |ncoeffs|
                                                                      (GETREFV_U32
                                                                       |n1| 0))
                                                                (LETT |i| 0)
                                                                (LETT |jl|
                                                                      (|SPADfirst|
                                                                       |ndl|))
                                                                (SEQ
                                                                 (LETT |j| 0)
                                                                 (LETT #20#
                                                                       (- |n1|
                                                                          1))
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #20#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (COND
                                                                    ((EQL |j|
                                                                          |jl|)
                                                                     (SEQ
                                                                      (SETELT_U32
                                                                       |ncoeffs|
                                                                       |j| 0)
                                                                      (LETT
                                                                       |ndl|
                                                                       (CDR
                                                                        |ndl|))
                                                                      (EXIT
                                                                       (LETT
                                                                        |jl|
                                                                        (COND
                                                                         ((NULL
                                                                           |ndl|)
                                                                          |n1|)
                                                                         ('T
                                                                          (|SPADfirst|
                                                                           |ndl|)))))))
                                                                    ('T
                                                                     (SEQ
                                                                      (SETELT_U32
                                                                       |ncoeffs|
                                                                       |j|
                                                                       (ELT_U32
                                                                        |coeffs|
                                                                        |i|))
                                                                      (EXIT
                                                                       (LETT
                                                                        |i|
                                                                        (+ |i|
                                                                           1))))))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                                (EXIT
                                                                 (LETT |coeffs|
                                                                       |ncoeffs|)))))
                                                             (SPADCALL |coeffs|
                                                                       |t|
                                                                       |rstate|
                                                                       (QREFELT
                                                                        % 48))
                                                             (LETT |good_cnt|
                                                                   (+
                                                                    |good_cnt|
                                                                    1))
                                                             (LETT |pp|
                                                                   (SPADCALL
                                                                    |rstate|
                                                                    (+ |nv|
                                                                       |nbv|)
                                                                    |offsets|
                                                                    |offsets|
                                                                    |exps|
                                                                    (QREFELT %
                                                                             51)))
                                                             (EXIT
                                                              (COND
                                                               ((QEQCAR |pp| 1)
                                                                (PROGN
                                                                 (LETT #21#
                                                                       |$NoValue|)
                                                                 (GO #23#)))
                                                               ('T
                                                                (PROGN
                                                                 (LETT #22#
                                                                       (CONS 0
                                                                             (QCDR
                                                                              |pp|)))
                                                                 (GO
                                                                  #25#)))))))))))))))))))))))
                               #23# (EXIT #21#))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #25# (EXIT #22#)))) 

(SDEFUN |MAGCD2;reconstruct3|
        ((|lv| (|List| (|Symbol|))) (|vx| (|Symbol|))
         (|lvz| (|List| (|Symbol|))) (|exps| (|SortedExponentVector|))
         (|pp| (|PrimitiveArray| (|Integer|))) (% (|Polynomial| (|Integer|))))
        (SPROG
         ((|nlv| (|List| (|Symbol|)))
          (|pres| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |nlv| (SPADCALL |lv| (REVERSE |lvz|) (QREFELT % 57)))
              (LETT |pres|
                    (SPADCALL |nlv| |exps| |pp| 0 (- (QVSIZE |pp|) 1)
                              (QREFELT % 61)))
              (EXIT (SPADCALL |pres| |vx| (QREFELT % 64)))))) 

(SDEFUN |MAGCD2;algebraicGcd3a|
        ((|x| (MP)) (|y| (MP)) (|lm| (|List| MP)) (|lv| (|List| (|Symbol|)))
         (|pss|
          (|Record| (|:| |degx| #1=(|Integer|)) (|:| |degy| #2=(|Integer|))
                    (|:| |degg| #3=(|Integer|)) (|:| |sizem| (|Integer|))
                    (|:| |sldeg| (|List| (|Integer|)))
                    (|:| |expdata| (|SortedExponentVector|))
                    (|:| |coeffdata| (|U32Vector|)) (|:| |svx| #4=(|Symbol|))
                    (|:| |svz| #5=(|List| (|Symbol|)))
                    (|:| |offsetdata| #6=(|Vector| (|Integer|)))
                    (|:| |pss1|
                         #7=(|Record| (|:| |prime| (|Integer|))
                                      (|:| |eval1coeffbuf| (|U32Vector|))
                                      (|:| |eval1expbuf|
                                           (|SortedExponentVector|))))))
         (% (|Polynomial| (|Integer|))))
        (SPROG
         ((|dx| #1#) (|dy| #2#) (|vx| #4#) (|pss1| #7#) (|lvz| #5#)
          (|nbv| #8=(|NonNegativeInteger|)) (|nv| (|NonNegativeInteger|))
          (|p| (|Integer|)) (|lp| (|List| (|Integer|)))
          (|xpu| #9=(|Union| MP "failed")) (|xp| (MP)) (|ypu| #9#) (|yp| (MP))
          (#10=#:G190 NIL) (|lmp1| #9#) (|lmp| (|List| MP)) (|z| NIL)
          (#11=#:G193 NIL) (|deg| NIL) (#12=#:G192 NIL) (|m| NIL)
          (#13=#:G191 NIL) (|bad_ev| (|Boolean|))
          (|gtpp|
           (|Union|
            (|Record| (|:| |nvars| (|Integer|))
                      (|:| |offsetdata| (|Vector| (|Integer|)))
                      (|:| |expdata| (|SortedExponentVector|))
                      (|:| |coeffdata| (|U32Vector|)))
            "failed"))
          (|gtp|
           (|Record| (|:| |nvars| (|Integer|))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|))))
          (|nexps| (|SortedExponentVector|)) (|dg| #3#)
          (|dl| (|List| (|List| (|Integer|)))) (|odl| #14=(|List| (|Integer|)))
          (|oer|
           (|Record| (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))))
          (|offsets| #6#) (|exps| (|SortedExponentVector|))
          (|ncc| (|NonNegativeInteger|))
          (|rstate| (|VectorIntegerReconstructor|))
          (|n0| (|NonNegativeInteger|)) (|nn| (|NonNegativeInteger|))
          (|n1| #8#) (|ncoeffs| (|U32Vector|)) (|j| NIL) (#15=#:G194 NIL)
          (|ndl| #14#) (|jl| (|Integer|)) (|i| (|Integer|))
          (|coeffs| (|U32Vector|))
          (|pp| (|Union| (|PrimitiveArray| (|Integer|)) "failed"))
          (#16=#:G188 NIL) (|res| (|Polynomial| (|Integer|))) (#17=#:G189 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lp| NIL) (LETT |dx| (QVELT |pss| 0))
                (LETT |dy| (QVELT |pss| 1)) (LETT |dg| (QVELT |pss| 2))
                (LETT |vx| (QVELT |pss| 7)) (LETT |pss1| (QVELT |pss| 10))
                (LETT |lvz| (QVELT |pss| 8)) (LETT |nbv| (+ (LENGTH |lvz|) 1))
                (LETT |nv| (LENGTH |lv|)) (LETT |offsets| (QVELT |pss| 9))
                (LETT |exps| (GETREFV_U32 0 0))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (SEQ
                         (LETT |p|
                               (SPADCALL (+ (RANDOM 1000000) 500000)
                                         (QREFELT % 66)))
                         (EXIT
                          (COND
                           ((SPADCALL |p| |lp| (QREFELT % 31))
                            (PROGN (LETT #16# |$NoValue|) (GO #18=#:G144)))
                           ('T
                            (SEQ (LETT |lp| (CONS |p| |lp|))
                                 (QSETVELT |pss1| 0 |p|)
                                 (LETT |xpu| (SPADCALL |x| |p| (QREFELT % 67)))
                                 (EXIT
                                  (COND
                                   ((QEQCAR |xpu| 1)
                                    (PROGN (LETT #16# |$NoValue|) (GO #18#)))
                                   ('T
                                    (SEQ (LETT |xp| (QCDR |xpu|))
                                         (LETT |ypu|
                                               (SPADCALL |y| |p|
                                                         (QREFELT % 67)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |ypu| 1)
                                            (PROGN
                                             (LETT #16# |$NoValue|)
                                             (GO #18#)))
                                           ('T
                                            (SEQ (LETT |yp| (QCDR |ypu|))
                                                 (COND
                                                  ((<
                                                    (SPADCALL |xp| |vx|
                                                              (QREFELT % 36))
                                                    |dx|)
                                                   (COND
                                                    ((<
                                                      (SPADCALL |yp| |vx|
                                                                (QREFELT % 36))
                                                      |dy|)
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #16# |$NoValue|)
                                                       (GO #18#)))))))
                                                 (LETT |lmp| NIL)
                                                 (LETT |bad_ev| NIL)
                                                 (SEQ (LETT |m| NIL)
                                                      (LETT #10# |lm|) G190
                                                      (COND
                                                       ((OR (ATOM #10#)
                                                            (PROGN
                                                             (LETT |m|
                                                                   (CAR #10#))
                                                             NIL)
                                                            (NULL
                                                             (NULL |bad_ev|)))
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |lmp1|
                                                             (SPADCALL |m| |p|
                                                                       (QREFELT
                                                                        % 67)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |lmp1| 1)
                                                          (LETT |bad_ev| 'T))
                                                         ('T
                                                          (LETT |lmp|
                                                                (CONS
                                                                 (QCDR |lmp1|)
                                                                 |lmp|))))))
                                                      (LETT #10# (CDR #10#))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (LETT |lmp| (NREVERSE |lmp|))
                                                 (COND
                                                  ((NULL |bad_ev|)
                                                   (SEQ (LETT |z| NIL)
                                                        (LETT #11# |lvz|)
                                                        (LETT |deg| NIL)
                                                        (LETT #12#
                                                              (QVELT |pss| 4))
                                                        (LETT |m| NIL)
                                                        (LETT #13# |lmp|) G190
                                                        (COND
                                                         ((OR (ATOM #13#)
                                                              (PROGN
                                                               (LETT |m|
                                                                     (CAR
                                                                      #13#))
                                                               NIL)
                                                              (ATOM #12#)
                                                              (PROGN
                                                               (LETT |deg|
                                                                     (CAR
                                                                      #12#))
                                                               NIL)
                                                              (ATOM #11#)
                                                              (PROGN
                                                               (LETT |z|
                                                                     (CAR
                                                                      #11#))
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (COND
                                                           ((<
                                                             (SPADCALL |m| |z|
                                                                       (QREFELT
                                                                        % 36))
                                                             |deg|)
                                                            (LETT |bad_ev|
                                                                  'T)))))
                                                        (LETT #13#
                                                              (PROG1 (CDR #13#)
                                                                (LETT #12#
                                                                      (PROG1
                                                                          (CDR
                                                                           #12#)
                                                                        (LETT
                                                                         #11#
                                                                         (CDR
                                                                          #11#))))))
                                                        (GO G190) G191
                                                        (EXIT NIL))))
                                                 (EXIT
                                                  (COND
                                                   (|bad_ev|
                                                    (PROGN
                                                     (LETT #16# |$NoValue|)
                                                     (GO #18#)))
                                                   ('T
                                                    (SEQ
                                                     (LETT |gtpp|
                                                           (|MAGCD2;algebraicGcd2|
                                                            |xp| |yp| |lmp|
                                                            |lv| |pss| %))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |gtpp| 1)
                                                        (PROGN
                                                         (LETT #16# |$NoValue|)
                                                         (GO #18#)))
                                                       ('T
                                                        (SEQ
                                                         (LETT |gtp|
                                                               (QCDR |gtpp|))
                                                         (LETT |nexps|
                                                               (QVELT |gtp| 2))
                                                         (LETT |coeffs|
                                                               (QVELT |gtp| 3))
                                                         (COND
                                                          ((OR
                                                            (< (QVELT |pss| 2)
                                                               |dg|)
                                                            (SPADCALL |exps|
                                                                      (QREFELT
                                                                       % 39)))
                                                           (SEQ
                                                            (LETT |exps|
                                                                  |nexps|)
                                                            (EXIT
                                                             (LETT |rstate|
                                                                   (SPADCALL
                                                                    (QV_LEN_U32
                                                                     |coeffs|)
                                                                    (QREFELT %
                                                                             69)))))))
                                                         (COND
                                                          ((< (QVELT |pss| 2)
                                                              |dg|)
                                                           (LETT |dg|
                                                                 (QVELT |pss|
                                                                        2))))
                                                         (LETT |dl|
                                                               (SPADCALL
                                                                (+ |nv| |nbv|)
                                                                |offsets|
                                                                |exps|
                                                                |offsets|
                                                                |nexps|
                                                                (QREFELT %
                                                                         43)))
                                                         (LETT |odl|
                                                               (SPADCALL |dl| 1
                                                                         (QREFELT
                                                                          %
                                                                          44)))
                                                         (LETT |ndl|
                                                               (SPADCALL |dl| 2
                                                                         (QREFELT
                                                                          %
                                                                          44)))
                                                         (COND
                                                          ((SPADCALL |odl| NIL
                                                                     (QREFELT %
                                                                              45))
                                                           (SEQ
                                                            (LETT |oer|
                                                                  (SPADCALL
                                                                   (+ |nv|
                                                                      |nbv|)
                                                                   |odl| |ndl|
                                                                   |offsets|
                                                                   |exps|
                                                                   |offsets|
                                                                   |nexps|
                                                                   (QREFELT %
                                                                            47)))
                                                            (LETT |offsets|
                                                                  (QCAR |oer|))
                                                            (LETT |exps|
                                                                  (QCDR |oer|))
                                                            (LETT |ncc|
                                                                  (|quotient_INT|
                                                                   (QV_LEN_U32
                                                                    |exps|)
                                                                   (+ |nv|
                                                                      |nbv|)))
                                                            (EXIT
                                                             (LETT |rstate|
                                                                   (SPADCALL
                                                                    |ncc|
                                                                    (QREFELT %
                                                                             69)))))))
                                                         (COND
                                                          ((SPADCALL |ndl| NIL
                                                                     (QREFELT %
                                                                              45))
                                                           (SEQ
                                                            (LETT |n0|
                                                                  (QV_LEN_U32
                                                                   |coeffs|))
                                                            (LETT |nn|
                                                                  (LENGTH
                                                                   |ndl|))
                                                            (LETT |n1|
                                                                  (+ |n0|
                                                                     |nn|))
                                                            (LETT |ncoeffs|
                                                                  (GETREFV_U32
                                                                   |n1| 0))
                                                            (LETT |i| 0)
                                                            (LETT |jl|
                                                                  (|SPADfirst|
                                                                   |ndl|))
                                                            (SEQ (LETT |j| 0)
                                                                 (LETT #15#
                                                                       (- |n1|
                                                                          1))
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #15#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (EXIT
                                                                   (COND
                                                                    ((EQL |j|
                                                                          |jl|)
                                                                     (SEQ
                                                                      (SETELT_U32
                                                                       |ncoeffs|
                                                                       |j| 0)
                                                                      (LETT
                                                                       |ndl|
                                                                       (CDR
                                                                        |ndl|))
                                                                      (EXIT
                                                                       (LETT
                                                                        |jl|
                                                                        (COND
                                                                         ((NULL
                                                                           |ndl|)
                                                                          |n1|)
                                                                         ('T
                                                                          (|SPADfirst|
                                                                           |ndl|)))))))
                                                                    ('T
                                                                     (SEQ
                                                                      (SETELT_U32
                                                                       |ncoeffs|
                                                                       |j|
                                                                       (ELT_U32
                                                                        |coeffs|
                                                                        |i|))
                                                                      (EXIT
                                                                       (LETT
                                                                        |i|
                                                                        (+ |i|
                                                                           1))))))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |coeffs|
                                                                   |ncoeffs|)))))
                                                         (SPADCALL |coeffs| |p|
                                                                   |rstate|
                                                                   (QREFELT %
                                                                            70))
                                                         (LETT |pp|
                                                               (SPADCALL
                                                                |rstate|
                                                                |offsets|
                                                                (QREFELT %
                                                                         72)))
                                                         (EXIT
                                                          (COND
                                                           ((QEQCAR |pp| 1)
                                                            (PROGN
                                                             (LETT #16#
                                                                   |$NoValue|)
                                                             (GO #18#)))
                                                           ('T
                                                            (SEQ
                                                             (LETT |res|
                                                                   (|MAGCD2;reconstruct3|
                                                                    |lv| |vx|
                                                                    |lvz|
                                                                    |exps|
                                                                    (QCDR |pp|)
                                                                    %))
                                                             (EXIT
                                                              (COND
                                                               ((SPADCALL |x|
                                                                          |res|
                                                                          |lm|
                                                                          |vx|
                                                                          |lvz|
                                                                          (QREFELT
                                                                           %
                                                                           73))
                                                                (COND
                                                                 ((SPADCALL |y|
                                                                            |res|
                                                                            |lm|
                                                                            |vx|
                                                                            |lvz|
                                                                            (QREFELT
                                                                             %
                                                                             73))
                                                                  (PROGN
                                                                   (LETT #17#
                                                                         |res|)
                                                                   (GO
                                                                    #19=#:G187)))))))))))))))))))))))))))))))))
                       #18# (EXIT #16#))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #19# (EXIT #17#)))) 

(SDEFUN |MAGCD2;algebraicGcd;2PTLLSLP;7|
        ((|x| (PT)) (|y| (PT)) (|lm| (|List| PT)) (|lv| (|List| (|Symbol|)))
         (|vx| (|Symbol|)) (|lvz| (|List| (|Symbol|)))
         (% (|Polynomial| (|Integer|))))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (|na| #1#)
          (|tv0| (|List| (|Symbol|))) (|tvx| (|Symbol|))
          (|tvz| (|List| (|Symbol|))) (|tv| (|List| (|Symbol|)))
          (|sv| (|List| (|Symbol|))) (|nx| (MP)) (|ny| (MP)) (#2=#:G217 NIL)
          (#3=#:G218 NIL) (|nlm| (|List| MP)) (#4=#:G219 NIL) (|vz| NIL)
          (#5=#:G221 NIL) (|m| NIL) (#6=#:G220 NIL)
          (|ldeg| (|List| (|Integer|))) (|msize| (|Integer|))
          (|pss|
           (|Record| (|:| |degx| (|Integer|)) (|:| |degy| (|Integer|))
                     (|:| |degg| (|Integer|)) (|:| |sizem| (|Integer|))
                     (|:| |sldeg| (|List| (|Integer|)))
                     (|:| |expdata| (|SortedExponentVector|))
                     (|:| |coeffdata| (|U32Vector|)) (|:| |svx| (|Symbol|))
                     (|:| |svz| (|List| (|Symbol|)))
                     (|:| |offsetdata| (|Vector| (|Integer|)))
                     (|:| |pss1|
                          (|Record| (|:| |prime| (|Integer|))
                                    (|:| |eval1coeffbuf| (|U32Vector|))
                                    (|:| |eval1expbuf|
                                         (|SortedExponentVector|))))))
          (|ress| (|Polynomial| (|Integer|))) (#7=#:G222 NIL) (|v| NIL)
          (#8=#:G223 NIL) (|sval| (|List| (|Polynomial| (|Integer|)))))
         (SEQ (LETT |n| (LENGTH |lv|)) (LETT |na| (LENGTH |lvz|))
              (EXIT
               (COND ((> |n| (QREFELT % 56)) (|error| "Too many variables"))
                     ((> |na| (QREFELT % 55))
                      (|error| "Too many algebraic parameters"))
                     ('T
                      (SEQ
                       (LETT |tv0|
                             (SPADCALL (QREFELT % 54) |n| (QREFELT % 74)))
                       (LETT |tvx| (|SPADfirst| (QREFELT % 52)))
                       (LETT |tvz|
                             (REVERSE
                              (SPADCALL (QREFELT % 53) |na| (QREFELT % 74))))
                       (LETT |tv| (SPADCALL |tvz| |tv0| (QREFELT % 57)))
                       (LETT |tv| (CONS |tvx| |tv|))
                       (LETT |sv|
                             (CONS |vx| (SPADCALL |lvz| |lv| (QREFELT % 57))))
                       (LETT |nx| (SPADCALL |x| |sv| |tv| (QREFELT % 75)))
                       (LETT |ny| (SPADCALL |y| |sv| |tv| (QREFELT % 75)))
                       (LETT |nlm|
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |m| NIL) (LETT #3# |lm|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |m| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SPADCALL |m| |sv| |tv|
                                                      (QREFELT % 75))
                                            #2#))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (LETT |ldeg|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |vz| NIL) (LETT #5# |lvz|)
                                   (LETT |m| NIL) (LETT #6# |lm|) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |m| (CAR #6#)) NIL)
                                         (ATOM #5#)
                                         (PROGN (LETT |vz| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |m| |vz| (QREFELT % 76))
                                            #4#))))
                                   (LETT #6#
                                         (PROG1 (CDR #6#)
                                           (LETT #5# (CDR #5#))))
                                   (GO G190) G191 (EXIT (NREVERSE #4#)))))
                       (LETT |msize|
                             (SPADCALL (ELT % 77) |ldeg| 1 (QREFELT % 79)))
                       (LETT |pss|
                             (VECTOR (SPADCALL |nx| |tvx| (QREFELT % 36))
                                     (SPADCALL |ny| |tvx| (QREFELT % 36)) 0
                                     |msize| |ldeg| (GETREFV_U32 0 0)
                                     (GETREFV_U32 0 0) |tvx| |tvz| (VECTOR 0)
                                     (VECTOR 0 (GETREFV_U32 10 0)
                                             (GETREFV_U32 10 0))))
                       (QSETVELT |pss| 2
                                 (+ (MIN (QVELT |pss| 0) (QVELT |pss| 1)) 1))
                       (LETT |ress|
                             (|MAGCD2;algebraicGcd3a| |nx| |ny| |nlm| |tv0|
                              |pss| %))
                       (LETT |sval|
                             (PROGN
                              (LETT #7# NIL)
                              (SEQ (LETT |v| NIL) (LETT #8# |sv|) G190
                                   (COND
                                    ((OR (ATOM #8#)
                                         (PROGN (LETT |v| (CAR #8#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #7#
                                           (CONS
                                            (SPADCALL (|spadConstant| % 80) |v|
                                                      1 (QREFELT % 81))
                                            #7#))))
                                   (LETT #8# (CDR #8#)) (GO G190) G191
                                   (EXIT (NREVERSE #7#)))))
                       (EXIT
                        (SPADCALL |ress| |tv| |sval| (QREFELT % 83)))))))))) 

(DECLAIM (NOTINLINE |ModularAlgebraicGcd2;|)) 

(DEFUN |ModularAlgebraicGcd2;| (|#1| |#2| |#3| |#4| |#5| |#6|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (DV$6 NIL)
    (|dv$| NIL) (% NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT DV$6 (|devaluate| |#6|))
    (LETT |dv$| (LIST '|ModularAlgebraicGcd2| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6))
    (LETT % (GETREFV 86))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|ModularAlgebraicGcd2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (QSETREFV % 11 |#6|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 52
              '(|u0| |u1| |u2| |u3| |u4| |u5| |u6| |u7| |u8| |u9| |v0| |v1|
                |v2| |v3| |v4| |v5| |v6| |v7| |v8| |v9| |w0| |w1| |w2| |w3|
                |w4| |w5| |w6| |w7| |w8| |w9|))
    (QSETREFV % 53
              '(|p0| |p1| |p2| |p3| |p4| |p5| |p6| |p7| |p8| |p9| |q0| |q1|
                |q2| |q3| |q4| |q5| |q6| |q7| |q8| |q9| |r0| |r1| |r2| |r3|
                |r4| |r5| |r6| |r7| |r8| |r9|))
    (QSETREFV % 54
              '(|a0| |a1| |a2| |a3| |a4| |a5| |a6| |a7| |a8| |a9| |b0| |b1|
                |b2| |b3| |b4| |b5| |b6| |b7| |b8| |b9| |c0| |c1| |c2| |c3|
                |c4| |c5| |c6| |c7| |c8| |c9| |d0| |d1| |d2| |d3| |d4| |d5|
                |d6| |d7| |d8| |d9| |e0| |e1| |e2| |e3| |e4| |e5| |e6| |e7|
                |e8| |e9|))
    (QSETREFV % 55 (LENGTH (QREFELT % 53)))
    (QSETREFV % 56 (LENGTH (QREFELT % 54)))
    %))) 

(DEFUN |ModularAlgebraicGcd2| (&REST #1=#:G224)
  (SPROG NIL
         (PROG (#2=#:G225)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ModularAlgebraicGcd2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModularAlgebraicGcd2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModularAlgebraicGcd2|)))))))))) 

(MAKEPROP '|ModularAlgebraicGcd2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|Union| 8 '#1="failed") (|Symbol|) (|List| 13) (0 . |MPtoMPT|)
              (8 . |pseudoRem|) (|Boolean|) (15 . |zero?|)
              (20 . |canonicalIfCan|) (|Union| 9 '#1#) (|List| 7) (|Integer|)
              (26 . |pack_modulus|) (33 . |degree|) (|SortedExponentVector|)
              (38 . |pack_exps|) (|Void|) (|U32Vector|) (45 . |repack1|)
              (|List| 22) (53 . |member?|) (|Union| 7 '"failed")
              (|Record| (|:| |prime| 22) (|:| |eval1coeffbuf| 28)
                        (|:| |eval1expbuf| 25))
              (59 . |eval1|) (|NonNegativeInteger|) (67 . |degree|)
              (|VectorModularReconstructor|) (73 . |empty|) (79 . |empty?|)
              (|List| 30) (|Vector| 22) (|InnerModularHermitePade|)
              (84 . |merge_exponents|) (93 . |elt|) (99 . ~=)
              (|Record| (|:| |offsetdata| 41) (|:| |expdata| 25))
              (105 . |merge2|) (116 . |chinese_update|)
              (|Record| (|:| |nvars| 22) (|:| |offsetdata| 41)
                        (|:| |expdata| 25) (|:| |coeffdata| 28))
              (|Union| 49 '"failed") (123 . |reconstruct|) '|base_vars|
              '|alg_vars| '|param_vars| '|max_avars| '|max_pvars|
              (132 . |concat|) (|SparseUnivariatePolynomial| 63)
              (|PrimitiveArray| 22) (|ModularHermitePade|)
              (138 . |unpack_poly|) (|SparseUnivariatePolynomial| %)
              (|Polynomial| 22) (147 . |multivariate|)
              (|IntegerPrimesPackage| 22) (153 . |nextPrime|)
              (158 . |modpreduction|) (|VectorIntegerReconstructor|)
              (164 . |empty|) (169 . |chinese_update|) (|Union| 59 '"failed")
              (176 . |reconstruct|) (182 . |trial_division|) (191 . |first|)
              (197 . |subst_vars|) (204 . |ldegree|) (210 . *)
              (|Mapping| 22 22 22) (216 . |reduce|) (223 . |1|)
              (227 . |monomial|) (|List| %) (234 . |eval|) (|List| 6)
              |MAGCD2;algebraicGcd;2PTLLSLP;7|)
           '#(|algebraicGcd| 241) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algebraicGcd|
                                 ((|Polynomial| (|Integer|)) |#1| |#1|
                                  (|List| |#1|) (|List| (|Symbol|)) (|Symbol|)
                                  (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 85
                                            '(4 11 12 7 13 14 9 15 3 11 8 8 8 9
                                              16 1 11 17 8 18 2 11 12 8 9 19 3
                                              11 20 21 14 22 23 1 11 22 8 24 3
                                              11 25 22 22 9 26 4 11 27 8 28 22
                                              9 29 2 30 17 22 0 31 4 10 32 7 13
                                              22 33 34 2 10 35 7 13 36 2 37 0
                                              22 22 38 1 25 17 0 39 5 42 40 22
                                              41 25 41 25 43 2 40 30 0 22 44 2
                                              30 17 0 0 45 7 42 46 22 30 30 41
                                              25 41 25 47 3 37 27 28 22 0 48 5
                                              37 50 0 22 41 41 25 51 2 14 0 0 0
                                              57 5 60 58 14 25 59 22 22 61 2 63
                                              0 62 13 64 1 65 22 22 66 2 10 32
                                              7 22 67 1 68 0 22 69 3 68 27 28
                                              22 0 70 2 68 71 0 41 72 5 10 17 7
                                              63 21 13 14 73 2 14 0 0 35 74 3
                                              10 7 6 14 14 75 2 10 35 6 13 76 2
                                              22 0 0 22 77 3 30 22 78 0 22 79 0
                                              63 0 80 3 63 0 0 13 35 81 3 63 0
                                              0 14 82 83 6 0 63 6 6 84 14 13 14
                                              85)))))
           '|lookupComplete|)) 
