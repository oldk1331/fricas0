
(SDEFUN |SMITH;test1|
        ((|sm| (M)) (|b| (|Col|)) (|m1| #1=(|Integer|))
         (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|m0| (|Integer|)) (|m2| (|Integer|)) (#2=#:G23 NIL) (|km| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |m0| (SPADCALL |sm| (QREFELT % 11)))
                (LETT |m2| (SPADCALL |sm| (QREFELT % 12))) (LETT |km| |m1|)
                (SEQ G190 (COND ((NULL (> |km| |m2|)) (GO G191)))
                     (SEQ
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |b| |km| (QREFELT % 13))
                                   (QREFELT % 15)))
                        (PROGN (LETT #2# (CONS 1 "failed")) (GO #3=#:G22))))
                      (EXIT (LETT |km| (- |km| 1))))
                     NIL (GO G190) G191 (EXIT NIL))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((< |km| |m0|) NIL)
                              ('T
                               (SPADCALL
                                (SPADCALL |sm| |km| |km| (QREFELT % 17))
                                (QREFELT % 15)))))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((NULL
                         (SPADCALL (SPADCALL |b| |km| (QREFELT % 13))
                                   (QREFELT % 15)))
                        (PROGN (LETT #2# (CONS 1 "failed")) (GO #3#))))
                      (EXIT (LETT |km| (- |km| 1))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |km|))))
          #3# (EXIT #2#)))) 

(SDEFUN |SMITH;test2|
        ((|sm| (M)) (|b| (|Col|)) (|n1| (|NonNegativeInteger|))
         (|dk| (|Integer|)) (% (|Union| |Col| "failed")))
        (SPROG
         ((|m0| (|Integer|)) (#1=#:G42 NIL) (|c| (|Union| R "failed"))
          (#2=#:G41 NIL) (|k| NIL) (#3=#:G43 NIL) (|sol| (|List| R)))
         (SEQ
          (EXIT
           (SEQ (LETT |sol| NIL) (LETT |m0| (SPADCALL |sm| (QREFELT % 11)))
                (SEQ (LETT |k| |m0|) (LETT #1# |dk|) G190
                     (COND ((> |k| #1#) (GO G191)))
                     (SEQ
                      (SEQ
                       (LETT |c|
                             (SPADCALL (SPADCALL |b| |k| (QREFELT % 13))
                                       (SPADCALL |sm| |k| |k| (QREFELT % 17))
                                       (QREFELT % 19)))
                       (EXIT
                        (COND
                         ((QEQCAR |c| 1)
                          (PROGN
                           (LETT #2# (CONS 1 "failed"))
                           (GO #4=#:G40))))))
                      (EXIT (LETT |sol| (CONS (QCDR |c|) |sol|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (SEQ (LETT |k| (+ (- |dk| |m0|) 2)) (LETT #3# |n1|) G190
                     (COND ((> |k| #3#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |sol| (CONS (|spadConstant| % 20) |sol|))))
                     (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL (NREVERSE |sol|) (QREFELT % 22))))))
          #4# (EXIT #2#)))) 

(SDEFUN |SMITH;isDiagonal?| ((|m| (M)) (% (|Boolean|)))
        (SPROG
         ((|m1| (|NonNegativeInteger|)) (|n1| (|NonNegativeInteger|)) (|i| NIL)
          (#1=#:G52 NIL) (|j| NIL) (#2=#:G53 NIL) (#3=#:G51 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m1| (SPADCALL |m| (QREFELT % 24)))
                (LETT |n1| (SPADCALL |m| (QREFELT % 25)))
                (SEQ (LETT |i| 1) (LETT #1# |m1|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| 1) (LETT #2# |n1|) G190
                            (COND ((|greater_SI| |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((SPADCALL |j| |i| (QREFELT % 26))
                                (COND
                                 ((NULL
                                   (SPADCALL
                                    (SPADCALL |m| |i| |j| (QREFELT % 17))
                                    (QREFELT % 15)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G50))))))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |SMITH;elRow1| ((|m| (M)) (|i| (|Integer|)) (|j| (|Integer|)) (% (M)))
        (SPROG ((|vec| (|Row|)))
               (SEQ (LETT |vec| (SPADCALL |m| |i| (QREFELT % 27)))
                    (SPADCALL |m| |i| (SPADCALL |m| |j| (QREFELT % 27))
                              (QREFELT % 28))
                    (SPADCALL |m| |j| |vec| (QREFELT % 28)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2|
        ((|m| (M)) (|a| (R)) (|i| (|Integer|)) (|j| (|Integer|)) (% (M)))
        (SPROG ((|vec| (|Row|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elRow2!0| (VECTOR % |a|))
                                (SPADCALL |m| |j| (QREFELT % 27))
                                (QREFELT % 31)))
                (LETT |vec|
                      (SPADCALL (ELT % 32) (SPADCALL |m| |i| (QREFELT % 27))
                                |vec| (QREFELT % 34)))
                (SPADCALL |m| |i| |vec| (QREFELT % 28)) (EXIT |m|)))) 

(SDEFUN |SMITH;elRow2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT % 29)))))) 

(SDEFUN |SMITH;elColumn2|
        ((|m| (M)) (|a| (R)) (|i| (|Integer|)) (|j| (|Integer|)) (% (M)))
        (SPROG ((|vec| (|Col|)))
               (SEQ
                (LETT |vec|
                      (SPADCALL (CONS #'|SMITH;elColumn2!0| (VECTOR % |a|))
                                (SPADCALL |m| |j| (QREFELT % 35))
                                (QREFELT % 36)))
                (LETT |vec|
                      (SPADCALL (ELT % 32) (SPADCALL |m| |i| (QREFELT % 35))
                                |vec| (QREFELT % 37)))
                (SPADCALL |m| |i| |vec| (QREFELT % 38)) (EXIT |m|)))) 

(SDEFUN |SMITH;elColumn2!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |x| (QREFELT % 29)))))) 

(SDEFUN |SMITH;ijDivide|
        ((|sf|
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
         (|i| (|Integer|)) (|j| (|Integer|))
         (%
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M))))
        (SPROG
         ((|m| (M))
          (|extGcd|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|d| (R)) (|mii| (R)) (#1=#:G73 NIL) (|mjj| (R)) (|lMat| (M))
          (|rMat| (M)))
         (SEQ (LETT |m| (QVELT |sf| 0))
              (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT % 17)))
              (LETT |mjj| (SPADCALL |m| |j| |j| (QREFELT % 17)))
              (LETT |extGcd| (SPADCALL |mii| |mjj| (QREFELT % 40)))
              (LETT |d| (QVELT |extGcd| 2))
              (LETT |mii|
                    (PROG2 (LETT #1# (SPADCALL |mii| |d| (QREFELT % 19)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                      (|Union| (QREFELT % 6) #2="failed")
                                      #1#)))
              (LETT |mjj|
                    (PROG2 (LETT #1# (SPADCALL |mjj| |d| (QREFELT % 19)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                      (|Union| (QREFELT % 6) #2#) #1#)))
              (LETT |lMat|
                    (|SMITH;elRow2| (QVELT |sf| 1) (QVELT |extGcd| 0) |j| |i|
                     %))
              (LETT |lMat| (|SMITH;elRow1| |lMat| |i| |j| %))
              (LETT |lMat|
                    (|SMITH;elRow2| |lMat| (SPADCALL |mii| (QREFELT % 41)) |j|
                     |i| %))
              (SPADCALL |m| |j| |j|
                        (SPADCALL (SPADCALL |m| |i| |i| (QREFELT % 17)) |mjj|
                                  (QREFELT % 29))
                        (QREFELT % 42))
              (SPADCALL |m| |i| |i| |d| (QREFELT % 42))
              (LETT |rMat|
                    (|SMITH;elColumn2| (QVELT |sf| 2) (QVELT |extGcd| 1) |i|
                     |j| %))
              (LETT |rMat|
                    (|SMITH;elColumn2| |rMat| (SPADCALL |mjj| (QREFELT % 41))
                     |j| |i| %))
              (SPADCALL |rMat| |j|
                        (SPADCALL (CONS #'|SMITH;ijDivide!0| %)
                                  (SPADCALL |rMat| |j| (QREFELT % 35))
                                  (QREFELT % 36))
                        (QREFELT % 38))
              (EXIT (VECTOR |m| |lMat| |rMat|))))) 

(SDEFUN |SMITH;ijDivide!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL (|spadConstant| % 44) |x| (QREFELT % 45))
                  (QREFELT % 41))) 

(SDEFUN |SMITH;lastStep|
        ((|sf|
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
         (%
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M))))
        (SPROG
         ((|m| (M)) (|m1| (|Integer|)) (|i| NIL) (#1=#:G89 NIL) (|mii| (R))
          (|j| NIL) (#2=#:G90 NIL) (#3=#:G88 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m| (QVELT |sf| 0))
                (LETT |m1|
                      (MIN (SPADCALL |m| (QREFELT % 24))
                           (SPADCALL |m| (QREFELT % 25))))
                (SEQ (LETT |i| 1) (LETT #1# |m1|) G190
                     (COND
                      ((OR (|greater_SI| |i| #1#)
                           (NULL
                            (SPADCALL
                             (LETT |mii| (SPADCALL |m| |i| |i| (QREFELT % 17)))
                             (|spadConstant| % 20) (QREFELT % 46))))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| (+ |i| 1)) (LETT #2# |m1|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((QEQCAR
                                 (SPADCALL
                                  (SPADCALL |m| |j| |j| (QREFELT % 17)) |mii|
                                  (QREFELT % 19))
                                 1)
                                (PROGN
                                 (LETT #3#
                                       (|SMITH;lastStep|
                                        (|SMITH;ijDivide| |sf| |i| |j| %) %))
                                 (GO #4=#:G87))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |sf|)))
          #4# (EXIT #3#)))) 

(SDEFUN |SMITH;findEqMat|
        ((|m| (M)) (|t| (M)) (% (|Record| (|:| |Hermite| M) (|:| |eqMat| M))))
        (SPROG
         ((|m1| (|NonNegativeInteger|)) (|n1| (|NonNegativeInteger|))
          (#1=#:G134 NIL) (#2=#:G94 #3=(|Boolean|)) (#4=#:G92 #3#)
          (#5=#:G93 NIL) (#6=#:G135 NIL) (#7=#:G97 #3#) (#8=#:G95 #3#)
          (#9=#:G96 NIL) (#10=#:G133 NIL) (|mmh| (M)) (|u| (M)) (|t1| (M))
          (|mm| (M)) (|t11| (R)) (|i| NIL) (#11=#:G136 NIL)
          (|j| (|NonNegativeInteger|)) (#12=#:G137 NIL) (|tjj| (R))
          (|j0| (|NonNegativeInteger|)) (|k| NIL) (#13=#:G138 NIL)
          (#14=#:G118 (R)) (#15=#:G116 (R)) (#16=#:G117 NIL) (#17=#:G105 NIL)
          (|u1| (|Matrix| (|Fraction| R))) (#18=#:G126 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m1| (SPADCALL |m| (QREFELT % 24)))
                (LETT |n1| (SPADCALL |m| (QREFELT % 25)))
                (EXIT
                 (COND ((EQL |m1| 0) (CONS |m| (SPADCALL 0 0 (QREFELT % 47))))
                       ((PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT |j| 1) (LETT #1# |n1|) G190
                              (COND ((|greater_SI| |j| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #2#
                                       (SPADCALL
                                        (SPADCALL |t| |m1| |j| (QREFELT % 17))
                                        (QREFELT % 15)))
                                 (COND
                                  (#5# (LETT #4# (COND (#4# #2#) ('T NIL))))
                                  ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                              (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                              (EXIT NIL))
                         (COND (#5# #4#) (#19='T 'T)))
                        (SEQ
                         (COND
                          ((PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |j| 1) (LETT #6# |n1|) G190
                                 (COND ((|greater_SI| |j| #6#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #7#
                                          (SPADCALL
                                           (SPADCALL |t| 1 |j| (QREFELT % 17))
                                           (QREFELT % 15)))
                                    (COND
                                     (#9# (LETT #8# (COND (#8# #7#) ('T NIL))))
                                     ('T
                                      (PROGN (LETT #8# #7#) (LETT #9# 'T)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#9# #8#) (#19# 'T)))
                           (PROGN
                            (LETT #10#
                                  (CONS |m|
                                        (SPADCALL |m1| (|spadConstant| % 16)
                                                  (QREFELT % 48))))
                            (GO #20=#:G132))))
                         (LETT |mm|
                               (SPADCALL |m|
                                         (SPADCALL |m1| (|spadConstant| % 16)
                                                   (QREFELT % 48))
                                         (QREFELT % 49)))
                         (LETT |mmh| (SPADCALL |mm| (QREFELT % 50)))
                         (EXIT
                          (CONS (SPADCALL |mmh| 1 |m1| 1 |n1| (QREFELT % 51))
                                (SPADCALL |mmh| 1 |m1| (+ |n1| 1) (+ |n1| |m1|)
                                          (QREFELT % 51))))))
                       (#19#
                        (SEQ (LETT |u| (SPADCALL |m1| |m1| (QREFELT % 47)))
                             (LETT |j| 1)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (SPADCALL
                                      (SPADCALL |t| 1 |j| (QREFELT % 17))
                                      (|spadConstant| % 20) (QREFELT % 52)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (LETT |t1| (SPADCALL |t| (QREFELT % 53)))
                             (LETT |mm| (SPADCALL |m| (QREFELT % 53)))
                             (COND
                              ((> |j| 1)
                               (SEQ
                                (LETT |t1|
                                      (SPADCALL |t| 1 |m1| |j| |n1|
                                                (QREFELT % 51)))
                                (EXIT
                                 (LETT |mm|
                                       (SPADCALL |m| 1 |m1| |j| |n1|
                                                 (QREFELT % 51)))))))
                             (LETT |t11| (SPADCALL |t1| 1 1 (QREFELT % 17)))
                             (SEQ (LETT |i| 1) (LETT #11# |m1|) G190
                                  (COND ((|greater_SI| |i| #11#) (GO G191)))
                                  (SEQ
                                   (SPADCALL |u| |i| 1
                                             (PROG2
                                                 (LETT #17#
                                                       (SPADCALL
                                                        (SPADCALL |mm| |i| 1
                                                                  (QREFELT %
                                                                           17))
                                                        |t11| (QREFELT % 19)))
                                                 (QCDR #17#)
                                               (|check_union2| (QEQCAR #17# 0)
                                                               (QREFELT % 6)
                                                               (|Union|
                                                                (QREFELT % 6)
                                                                #21="failed")
                                                               #17#))
                                             (QREFELT % 42))
                                   (EXIT
                                    (SEQ (LETT |j| 2) (LETT #12# |m1|) G190
                                         (COND
                                          ((|greater_SI| |j| #12#) (GO G191)))
                                         (SEQ (LETT |j0| |j|)
                                              (SEQ G190
                                                   (COND
                                                    ((NULL
                                                      (SPADCALL
                                                       (LETT |tjj|
                                                             (SPADCALL |t1| |j|
                                                                       |j0|
                                                                       (QREFELT
                                                                        % 17)))
                                                       (QREFELT % 15)))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT |j0| (+ |j0| 1))))
                                                   NIL (GO G190) G191
                                                   (EXIT NIL))
                                              (EXIT
                                               (SPADCALL |u| |i| |j|
                                                         (PROG2
                                                             (LETT #17#
                                                                   (SPADCALL
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |mm| |i|
                                                                      |j0|
                                                                      (QREFELT
                                                                       % 17))
                                                                     (PROGN
                                                                      (LETT
                                                                       #16#
                                                                       NIL)
                                                                      (SEQ
                                                                       (LETT
                                                                        |k| 1)
                                                                       (LETT
                                                                        #13#
                                                                        (- |j|
                                                                           1))
                                                                       G190
                                                                       (COND
                                                                        ((|greater_SI|
                                                                          |k|
                                                                          #13#)
                                                                         (GO
                                                                          G191)))
                                                                       (SEQ
                                                                        (EXIT
                                                                         (PROGN
                                                                          (LETT
                                                                           #14#
                                                                           (SPADCALL
                                                                            (SPADCALL
                                                                             |u|
                                                                             |i|
                                                                             |k|
                                                                             (QREFELT
                                                                              %
                                                                              17))
                                                                            (SPADCALL
                                                                             |t1|
                                                                             |k|
                                                                             |j0|
                                                                             (QREFELT
                                                                              %
                                                                              17))
                                                                            (QREFELT
                                                                             %
                                                                             29)))
                                                                          (COND
                                                                           (#16#
                                                                            (LETT
                                                                             #15#
                                                                             (SPADCALL
                                                                              #15#
                                                                              #14#
                                                                              (QREFELT
                                                                               %
                                                                               32))))
                                                                           ('T
                                                                            (PROGN
                                                                             (LETT
                                                                              #15#
                                                                              #14#)
                                                                             (LETT
                                                                              #16#
                                                                              'T)))))))
                                                                       (LETT
                                                                        |k|
                                                                        (|inc_SI|
                                                                         |k|))
                                                                       (GO
                                                                        G190)
                                                                       G191
                                                                       (EXIT
                                                                        NIL))
                                                                      (COND
                                                                       (#16#
                                                                        #15#)
                                                                       ('T
                                                                        (|spadConstant|
                                                                         %
                                                                         20))))
                                                                     (QREFELT %
                                                                              54))
                                                                    |tjj|
                                                                    (QREFELT %
                                                                             19)))
                                                             (QCDR #17#)
                                                           (|check_union2|
                                                            (QEQCAR #17# 0)
                                                            (QREFELT % 6)
                                                            (|Union|
                                                             (QREFELT % 6)
                                                             #21#)
                                                            #17#))
                                                         (QREFELT % 42))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (LETT |u1|
                                   (SPADCALL (ELT % 56) |u| (QREFELT % 60)))
                             (EXIT
                              (CONS |t|
                                    (SPADCALL (ELT % 61)
                                              (PROG2
                                                  (LETT #18#
                                                        (SPADCALL |u1|
                                                                  (QREFELT %
                                                                           62)))
                                                  (QCDR #18#)
                                                (|check_union2| (QEQCAR #18# 0)
                                                                (|Matrix|
                                                                 (|Fraction|
                                                                  (QREFELT %
                                                                           6)))
                                                                (|Union|
                                                                 (|Matrix|
                                                                  (|Fraction|
                                                                   (QREFELT %
                                                                            6)))
                                                                 "failed")
                                                                #18#))
                                              (QREFELT % 65))))))))))
          #20# (EXIT #10#)))) 

(SDEFUN |SMITH;hermite;2M;10| ((|m| (M)) (% (M))) (SPADCALL |m| (QREFELT % 50))) 

(SDEFUN |SMITH;completeHermite;MR;11|
        ((|m| (M)) (% (|Record| (|:| |Hermite| M) (|:| |eqMat| M))))
        (|SMITH;findEqMat| |m| (SPADCALL |m| (QREFELT % 50)) %)) 

(SDEFUN |SMITH;smith0| ((|m| (M)) (% (M)))
        (QVELT (|SMITH;completeSmith0| |m| %) 0)) 

(SDEFUN |SMITH;smith;2M;13| ((|m| (M)) (% (M)))
        (SPADCALL |m| (CONS (|function| |SMITH;smith0|) %) (QREFELT % 72))) 

(SDEFUN |SMITH;completeSmith;MR;14|
        ((|m| (M))
         (%
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M))))
        (SPADCALL |m| (CONS (|function| |SMITH;completeSmith0|) %)
                  (QREFELT % 76))) 

(SDEFUN |SMITH;smith;2M;15| ((|m| (M)) (% (M))) (|SMITH;smith0| |m| %)) 

(SDEFUN |SMITH;completeSmith;MR;16|
        ((|m| (M))
         (%
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M))))
        (|SMITH;completeSmith0| |m| %)) 

(SDEFUN |SMITH;completeSmith0|
        ((|m| (M))
         (%
          (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M))))
        (SPROG
         ((|leftm| (M)) (|nr| (|NonNegativeInteger|))
          (|cm1| (|Record| (|:| |Hermite| M) (|:| |eqMat| M))) (|rightm| (M))
          (|m1| (M))
          (|cm2|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M)
                     (|:| |rightEqMat| M))))
         (SEQ (LETT |cm1| (SPADCALL |m| (QREFELT % 68)))
              (LETT |leftm| (QCDR |cm1|)) (LETT |m1| (QCAR |cm1|))
              (EXIT
               (COND
                ((|SMITH;isDiagonal?| |m1| %)
                 (|SMITH;lastStep|
                  (VECTOR |m1| |leftm|
                          (SPADCALL (SPADCALL |m| (QREFELT % 25))
                                    (|spadConstant| % 16) (QREFELT % 48)))
                  %))
                (#1='T
                 (SEQ (LETT |nr| (SPADCALL |m| (QREFELT % 24)))
                      (LETT |cm1|
                            (SPADCALL (SPADCALL |m1| (QREFELT % 79))
                                      (QREFELT % 68)))
                      (LETT |rightm| (SPADCALL (QCDR |cm1|) (QREFELT % 79)))
                      (LETT |m1| (QCAR |cm1|))
                      (EXIT
                       (COND
                        ((|SMITH;isDiagonal?| |m1| %)
                         (SEQ
                          (LETT |cm2|
                                (|SMITH;lastStep|
                                 (VECTOR |m1| |leftm| |rightm|) %))
                          (EXIT
                           (COND
                            ((EQL
                              (SPADCALL (LETT |m| (QVELT |cm2| 0))
                                        (QREFELT % 24))
                              |nr|)
                             |cm2|)
                            (#1#
                             (VECTOR (SPADCALL |m| (QREFELT % 79))
                                     (QVELT |cm2| 1) (QVELT |cm2| 2)))))))
                        (#1#
                         (SEQ (LETT |cm2| (SPADCALL |m1| (QREFELT % 78)))
                              (LETT |cm2|
                                    (|SMITH;lastStep|
                                     (VECTOR (QVELT |cm2| 0)
                                             (SPADCALL
                                              (SPADCALL (QVELT |cm2| 2)
                                                        (QREFELT % 79))
                                              |leftm| (QREFELT % 80))
                                             (SPADCALL |rightm|
                                                       (SPADCALL
                                                        (QVELT |cm2| 1)
                                                        (QREFELT % 79))
                                                       (QREFELT % 80)))
                                     %))
                              (EXIT
                               (COND
                                ((EQL
                                  (SPADCALL (LETT |m| (QVELT |cm2| 0))
                                            (QREFELT % 24))
                                  |nr|)
                                 |cm2|)
                                (#1#
                                 (VECTOR (SPADCALL |m| (QREFELT % 79))
                                         (QVELT |cm2| 1)
                                         (QVELT |cm2| 2)))))))))))))))) 

(SDEFUN |SMITH;diophantineSystem;MColR;18|
        ((|m| (M)) (|b| (|Col|))
         (%
          (|Record| (|:| |particular| (|Union| |Col| "failed"))
                    (|:| |basis| (|List| |Col|)))))
        (SPROG
         ((|sf|
           (|Record| (|:| |Smith| M) (|:| |leftEqMat| M) (|:| |rightEqMat| M)))
          (|sm| (M)) (|m1| (|NonNegativeInteger|)) (|lm| (M)) (|b1| (|Col|))
          (|t1| (|Union| (|Integer|) "failed")) (|dk| (|Integer|))
          (|n1| (|NonNegativeInteger|)) (|t2| (|Union| |Col| "failed"))
          (|rm| (M)) (|sol| (|Col|)) (#1=#:G170 NIL) (|i| NIL) (#2=#:G171 NIL)
          (|lsol| (|List| |Col|)))
         (SEQ (LETT |sf| (SPADCALL |m| (QREFELT % 78)))
              (LETT |sm| (QVELT |sf| 0))
              (LETT |m1| (SPADCALL |sm| (QREFELT % 24)))
              (LETT |lm| (QVELT |sf| 1))
              (LETT |b1| (SPADCALL |lm| |b| (QREFELT % 81)))
              (LETT |t1| (|SMITH;test1| |sm| |b1| |m1| %))
              (EXIT
               (COND ((QEQCAR |t1| 1) (CONS (CONS 1 "failed") NIL))
                     (#3='T
                      (SEQ (LETT |dk| (QCDR |t1|))
                           (LETT |n1| (SPADCALL |sm| (QREFELT % 25)))
                           (LETT |t2| (|SMITH;test2| |sm| |b1| |n1| |dk| %))
                           (EXIT
                            (COND
                             ((QEQCAR |t2| 1) (CONS (CONS 1 "failed") NIL))
                             (#3#
                              (SEQ (LETT |rm| (QVELT |sf| 2))
                                   (LETT |sol|
                                         (SPADCALL |rm| (QCDR |t2|)
                                                   (QREFELT % 81)))
                                   (LETT |lsol|
                                         (PROGN
                                          (LETT #1# NIL)
                                          (SEQ (LETT |i| (+ |dk| 1))
                                               (LETT #2# |n1|) G190
                                               (COND ((> |i| #2#) (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #1#
                                                       (CONS
                                                        (SPADCALL |rm| |i|
                                                                  (QREFELT %
                                                                           35))
                                                        #1#))))
                                               (LETT |i| (+ |i| 1)) (GO G190)
                                               G191 (EXIT (NREVERSE #1#)))))
                                   (EXIT
                                    (CONS (CONS 0 |sol|) |lsol|))))))))))))) 

(DECLAIM (NOTINLINE |SmithNormalForm;|)) 

(DEFUN |SmithNormalForm;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|SmithNormalForm| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 85))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|SmithNormalForm|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|domainEqual| |#4| (|Matrix| (|Integer|)))
      (PROGN
       (QSETREFV % 73 (CONS (|dispatchFunction| |SMITH;smith;2M;13|) %))
       (QSETREFV % 78
                 (CONS (|dispatchFunction| |SMITH;completeSmith;MR;14|) %))))
     ('T
      (PROGN
       (QSETREFV % 73 (CONS (|dispatchFunction| |SMITH;smith;2M;15|) %))
       (QSETREFV % 78
                 (CONS (|dispatchFunction| |SMITH;completeSmith;MR;16|) %)))))
    %))) 

(DEFUN |SmithNormalForm| (&REST #1=#:G172)
  (SPROG NIL
         (PROG (#2=#:G173)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SmithNormalForm|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |SmithNormalForm;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SmithNormalForm|)))))))))) 

(MAKEPROP '|SmithNormalForm| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (0 . |minColIndex|)
              (5 . |maxColIndex|) (10 . |elt|) (|Boolean|) (16 . |zero?|)
              (21 . |1|) (25 . |elt|) (|Union| % '"failed") (32 . |exquo|)
              (38 . |0|) (|List| 6) (42 . |construct|) (|NonNegativeInteger|)
              (47 . |nrows|) (52 . |ncols|) (57 . ~=) (63 . |row|)
              (69 . |setRow!|) (76 . *) (|Mapping| 6 6) (82 . |map|) (88 . +)
              (|Mapping| 6 6 6) (94 . |map|) (101 . |column|) (107 . |map|)
              (113 . |map|) (120 . |setColumn!|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (127 . |extendedEuclidean|) (133 . -) (138 . |setelt!|)
              (|PositiveInteger|) (146 . |1|) (150 . *) (156 . ~=)
              (162 . |zero|) (168 . |scalarMatrix|) (174 . |horizConcat|)
              (180 . |rowEchelon|) (185 . |subMatrix|) (194 . =) (200 . |copy|)
              (205 . -) (|Fraction| 6) (211 . |coerce|) (|Matrix| 55)
              (|Mapping| 55 6)
              (|MatrixCategoryFunctions2| 6 7 8 9 55 (|Vector| 55)
                                          (|Vector| 55) 57)
              (216 . |map|) (222 . |retract|) (227 . |inverse|)
              (|Mapping| 6 55)
              (|MatrixCategoryFunctions2| 55 (|Vector| 55) (|Vector| 55) 57 6 7
                                          8 9)
              (232 . |map|) |SMITH;hermite;2M;10|
              (|Record| (|:| |Hermite| 9) (|:| |eqMat| 9))
              |SMITH;completeHermite;MR;11| (|Matrix| 10) (|Mapping| 69 69)
              (|IntegerSmithNormalForm|) (238 . |smith|) (244 . |smith|)
              (|Record| (|:| |Smith| 69) (|:| |leftEqMat| 69)
                        (|:| |rightEqMat| 69))
              (|Mapping| 74 69) (249 . |completeSmith|)
              (|Record| (|:| |Smith| 9) (|:| |leftEqMat| 9)
                        (|:| |rightEqMat| 9))
              (255 . |completeSmith|) (260 . |transpose|) (265 . *) (271 . *)
              (|Union| 8 '#1="failed")
              (|Record| (|:| |particular| 82) (|:| |basis| (|List| 8)))
              |SMITH;diophantineSystem;MColR;18|)
           '#(|smith| 277 |hermite| 282 |diophantineSystem| 287 |completeSmith|
              293 |completeHermite| 298)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|hermite| (|#4| |#4|)) T)
                                   '((|completeHermite|
                                      ((|Record| (|:| |Hermite| |#4|)
                                                 (|:| |eqMat| |#4|))
                                       |#4|))
                                     T)
                                   '((|smith| (|#4| |#4|)) T)
                                   '((|completeSmith|
                                      ((|Record| (|:| |Smith| |#4|)
                                                 (|:| |leftEqMat| |#4|)
                                                 (|:| |rightEqMat| |#4|))
                                       |#4|))
                                     T)
                                   '((|diophantineSystem|
                                      ((|Record|
                                        (|:| |particular| (|Union| |#3| #1#))
                                        (|:| |basis| (|List| |#3|)))
                                       |#4| |#3|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 84
                                            '(1 9 10 0 11 1 9 10 0 12 2 8 6 0
                                              10 13 1 6 14 0 15 0 6 0 16 3 9 6
                                              0 10 10 17 2 6 18 0 0 19 0 6 0 20
                                              1 8 0 21 22 1 9 23 0 24 1 9 23 0
                                              25 2 23 14 0 0 26 2 9 7 0 10 27 3
                                              9 0 0 10 7 28 2 6 0 0 0 29 2 7 0
                                              30 0 31 2 6 0 0 0 32 3 7 0 33 0 0
                                              34 2 9 8 0 10 35 2 8 0 30 0 36 3
                                              8 0 33 0 0 37 3 9 0 0 10 8 38 2 6
                                              39 0 0 40 1 6 0 0 41 4 9 6 0 10
                                              10 6 42 0 43 0 44 2 6 0 43 0 45 2
                                              6 14 0 0 46 2 9 0 23 23 47 2 9 0
                                              23 6 48 2 9 0 0 0 49 1 9 0 0 50 5
                                              9 0 0 10 10 10 10 51 2 6 14 0 0
                                              52 1 9 0 0 53 2 6 0 0 0 54 1 55 0
                                              6 56 2 59 57 58 9 60 1 55 6 0 61
                                              1 57 18 0 62 2 64 9 63 57 65 2 71
                                              69 69 70 72 1 0 9 9 73 2 71 74 69
                                              75 76 1 0 77 9 78 1 9 0 0 79 2 9
                                              0 0 0 80 2 9 8 0 8 81 1 0 9 9 73
                                              1 0 9 9 66 2 0 83 9 8 84 1 0 77 9
                                              78 1 0 67 9 68)))))
           '|lookupComplete|)) 
