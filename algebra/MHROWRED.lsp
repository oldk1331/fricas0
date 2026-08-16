(in-package "BOOT")

(SDEFUN |MHROWRED;nonzero?| ((|v| (|Vector| R)) (% (|Boolean|)))
        (SPADCALL (CONS #'|MHROWRED;nonzero?!0| %) |v| (QREFELT % 12))) 

(SDEFUN |MHROWRED;nonzero?!0| ((|s| NIL) (% NIL))
        (SPADCALL |s| (|spadConstant| % 7) (QREFELT % 9))) 

(SDEFUN |MHROWRED;non0|
        ((|v| (|Vector| R)) (|rown| (|Integer|))
         (%
          (|Union|
           #1=(|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                        (|:| |rw| (|Integer|)))
           "failed")))
        (SPROG
         ((|i| NIL) (#2=#:G994 NIL) (|allZero| (|Boolean|)) (|ans| #1#)
          (#3=#:G993 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |allZero| 'T)
                (SEQ (LETT |i| (SPADCALL |v| (QREFELT % 14)))
                     (LETT #2# (QVSIZE |v|)) G190
                     (COND ((> |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (QAREF1O |v| |i| 1) (|spadConstant| % 7)
                                   (QREFELT % 9))
                         (COND
                          (|allZero|
                           (SEQ (LETT |allZero| NIL)
                                (EXIT
                                 (LETT |ans|
                                       (VECTOR (QAREF1O |v| |i| 1) |i|
                                               |rown|)))))
                          ('T
                           (PROGN
                            (LETT #3# (CONS 1 "failed"))
                            (GO #4=#:G992))))))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND (|allZero| (CONS 1 "failed")) ('T (CONS 0 |ans|))))))
          #4# (EXIT #3#)))) 

(SDEFUN |MHROWRED;mkMat|
        ((|x| (|Matrix| R)) (|l| (|List| (|Integer|))) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G1018 NIL) (|i| NIL) (#2=#:G1019 NIL)
          (|ll| (|List| (|List| R))))
         (SEQ
          (COND
           ((NULL
             (LETT |ll|
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| (PROGN |x| 1))
                         (LETT #2# (SPADCALL |x| (QREFELT % 16))) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((COND ((SPADCALL |i| |l| (QREFELT % 18)) NIL)
                                   (#3='T
                                    (|MHROWRED;nonzero?|
                                     (SPADCALL |x| |i| (QREFELT % 19)) %)))
                             (LETT #1#
                                   (CONS
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT % 19))
                                              (QREFELT % 21))
                                    #1#))))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))))
            (SPADCALL 1 (ANCOLS |x|) (QREFELT % 24)))
           (#3# (SPADCALL |ll| (QREFELT % 26))))))) 

(SDEFUN |MHROWRED;diagSubMatrix|
        ((|x| (|Matrix| R))
         (%
          (|Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
                   "failed")))
        (SPROG
         ((#1=#:G1107 NIL) (|i| NIL) (#2=#:G1108 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                      (|:| |rw| (|Integer|)))
            #3="failed"))
          (#4=#:G1027 NIL)
          (|l|
           (|List|
            (|Record| (|:| |val| R) (|:| |cl| (|Integer|))
                      (|:| |rw| (|Integer|)))))
          (|a| NIL) (#5=#:G1110 NIL) (#6=#:G1111 NIL) (#7=#:G1109 NIL)
          (#8=#:G1112 NIL) (#9=#:G1113 NIL) (#10=#:G1114 NIL) (|z| NIL)
          (#11=#:G1115 NIL) (#12=#:G1116 NIL) (|r| NIL) (#13=#:G1117 NIL)
          (#14=#:G1106 NIL) (#15=#:G1105 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |i| (PROGN |x| 1))
                        (LETT #2# (SPADCALL |x| (QREFELT % 16))) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((QEQCAR
                             (LETT |u|
                                   (|MHROWRED;non0|
                                    (SPADCALL |x| |i| (QREFELT % 19)) |i| %))
                             0)
                            (LETT #1#
                                  (CONS
                                   (PROG2 (LETT #4# |u|)
                                       (QCDR #4#)
                                     (|check_union2| (QEQCAR #4# 0)
                                                     (|Record|
                                                      (|:| |val| (QREFELT % 6))
                                                      (|:| |cl| (|Integer|))
                                                      (|:| |rw| (|Integer|)))
                                                     (|Union|
                                                      (|Record|
                                                       (|:| |val|
                                                            (QREFELT % 6))
                                                       (|:| |cl| (|Integer|))
                                                       (|:| |rw| (|Integer|)))
                                                      #3#)
                                                     #4#))
                                   #1#))))))
                        (LETT |i| (+ |i| 1)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (SEQ
             (EXIT
              (SEQ (LETT |a| NIL)
                   (LETT #7#
                         (SPADCALL
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |r| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |r| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #5# (CONS (QVELT |r| 0) #5#))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT (NREVERSE #5#))))
                          (QREFELT % 27)))
                   G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |a| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL
                        (SPADCALL
                         (PROGN
                          (LETT #8# NIL)
                          (SEQ (LETT |r| NIL) (LETT #9# |l|) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |r| (CAR #9#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (QVELT |r| 0) |a| (QREFELT % 28))
                                   (LETT #8# (CONS (QVELT |r| 1) #8#))))))
                               (LETT #9# (CDR #9#)) (GO G190) G191
                               (EXIT (NREVERSE #8#))))
                         (QREFELT % 30))
                        (SPADCALL
                         (PROGN
                          (LETT #10# NIL)
                          (SEQ (LETT |z| (PROGN |x| 1))
                               (LETT #11# (SPADCALL |x| (QREFELT % 31))) G190
                               (COND ((> |z| #11#) (GO G191)))
                               (SEQ (EXIT (LETT #10# (CONS |z| #10#))))
                               (LETT |z| (+ |z| 1)) (GO G190) G191
                               (EXIT (NREVERSE #10#))))
                         (QREFELT % 30))
                        (QREFELT % 32))
                       (PROGN
                        (LETT #15#
                              (PROGN
                               (LETT #14#
                                     (CONS 0
                                           (CONS |a|
                                                 (|MHROWRED;mkMat| |x|
                                                  (PROGN
                                                   (LETT #12# NIL)
                                                   (SEQ (LETT |r| NIL)
                                                        (LETT #13# |l|) G190
                                                        (COND
                                                         ((OR (ATOM #13#)
                                                              (PROGN
                                                               (LETT |r|
                                                                     (CAR
                                                                      #13#))
                                                               NIL))
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (COND
                                                           ((SPADCALL |a|
                                                                      (QVELT
                                                                       |r| 0)
                                                                      (QREFELT
                                                                       % 28))
                                                            (LETT #12#
                                                                  (CONS
                                                                   (QVELT |r|
                                                                          2)
                                                                   #12#))))))
                                                        (LETT #13# (CDR #13#))
                                                        (GO G190) G191
                                                        (EXIT
                                                         (NREVERSE #12#))))
                                                  %))))
                               (GO #16=#:G1104)))
                        (GO #17=#:G1102))))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL)))
             #17# (EXIT #15#))
            (EXIT (CONS 1 "failed"))))
          #16# (EXIT #14#)))) 

(SDEFUN |MHROWRED;determinantOfMinor| ((|x| (|Matrix| R)) (% (R)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|))
          (#1=#:G1131 NIL) (#2=#:G1132 NIL) (|lc| (|List| (|Integer|)))
          (#3=#:G1133 NIL) (#4=#:G1134 NIL) (|lr| (|List| (|Integer|)))
          (|i| NIL) (|n| (|Integer|)) (#5=#:G1135 NIL) (|d| (R))
          (|j| (|Integer|)) (#6=#:G1130 NIL) (#7=#:G1129 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nr| (ANROWS |x|)) (LETT |nc| (ANCOLS |x|))
                (EXIT
                 (COND ((<= |nr| |nc|) (|spadConstant| % 7))
                       ('T
                        (SEQ
                         (LETT |lc|
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |i| (PROGN |x| 1))
                                     (LETT #2# (SPADCALL |x| (QREFELT % 31)))
                                     G190 (COND ((> |i| #2#) (GO G191)))
                                     (SEQ (EXIT (LETT #1# (CONS |i| #1#))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #1#)))))
                         (LETT |lr|
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |i| (PROGN |x| 1))
                                     (LETT #4# (SPADCALL |x| (QREFELT % 16)))
                                     G190 (COND ((> |i| #4#) (GO G191)))
                                     (SEQ (EXIT (LETT #3# (CONS |i| #3#))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #3#)))))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |i| 1)
                                (LETT #5#
                                      (LETT |n|
                                            (SPADCALL |nr| |nc|
                                                      (QREFELT % 33))))
                                G190 (COND ((|greater_SI| |i| #5#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL
                                     (LETT |d|
                                           (SPADCALL
                                            (SPADCALL |x|
                                                      (|MHROWRED;enumerateBinomial|
                                                       |lr| |nc| |i| %)
                                                      |lc| (QREFELT % 34))
                                            (QREFELT % 35)))
                                     (|spadConstant| % 7) (QREFELT % 9))
                                    (PROGN
                                     (LETT #7#
                                           (SEQ
                                            (LETT |j|
                                                  (+ (+ |i| 1)
                                                     (RANDOM (- |n| |i|))))
                                            (EXIT
                                             (PROGN
                                              (LETT #6#
                                                    (SPADCALL |d|
                                                              (SPADCALL
                                                               (SPADCALL |x|
                                                                         (|MHROWRED;enumerateBinomial|
                                                                          |lr|
                                                                          |nc|
                                                                          |j|
                                                                          %)
                                                                         |lc|
                                                                         (QREFELT
                                                                          %
                                                                          34))
                                                               (QREFELT % 35))
                                                              (QREFELT % 36)))
                                              (GO #8=#:G1128)))))
                                     (GO #9=#:G1125))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL)))
                          #9# (EXIT #7#))
                         (EXIT (|spadConstant| % 7))))))))
          #8# (EXIT #6#)))) 

(SDEFUN |MHROWRED;enumerateBinomial|
        ((|l| (|List| (|Integer|))) (|m| (|Integer|)) (|i| (|Integer|))
         (% (|List| (|Integer|))))
        (SPROG
         ((|m1| (|Integer|)) (|j| NIL) (|n| (|Integer|)) (#1=#:G1143 NIL)
          (|b| (|Integer|)) (#2=#:G1142 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |m1| (- (PROGN |l| 1) 1))
                (EXIT
                 (COND
                  ((ZEROP (LETT |m| (- |m| 1)))
                   (LIST (SPADCALL |l| (+ |m1| |i|) (QREFELT % 37))))
                  ('T
                   (SEQ
                    (SEQ (LETT |j| 1) (LETT #1# (LETT |n| (LENGTH |l|))) G190
                         (COND ((|greater_SI| |j| #1#) (GO G191)))
                         (SEQ
                          (LETT |b| (SPADCALL (- |n| |j|) |m| (QREFELT % 33)))
                          (EXIT
                           (COND
                            ((<= |i| |b|)
                             (PROGN
                              (LETT #2#
                                    (CONS
                                     (SPADCALL |l| (+ |m1| |j|) (QREFELT % 37))
                                     (|MHROWRED;enumerateBinomial|
                                      (SPADCALL |l| |j| (QREFELT % 38)) |m| |i|
                                      %)))
                              (GO #3=#:G1141)))
                            ('T (LETT |i| (- |i| |b|))))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (|error| "Should not happen"))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |MHROWRED;rowEch;2M;7| ((|x| (|Matrix| R)) (% (|Matrix| R)))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
                    "failed"))
          (|d| (R)))
         (SEQ (LETT |u| (|MHROWRED;diagSubMatrix| |x| %))
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL (LETT |d| (|MHROWRED;determinantOfMinor| |x| %))
                             (QREFELT % 39))
                   (SPADCALL |x| (QREFELT % 40)))
                  (#1='T (SPADCALL |x| |d| (QREFELT % 41)))))
                (#1#
                 (SPADCALL (QCDR (QCDR |u|)) (QCAR (QCDR |u|))
                           (QREFELT % 42)))))))) 

(SDEFUN |MHROWRED;vconc| ((|y| (|Matrix| R)) (|m| (R)) (% (|Matrix| R)))
        (SPROG NIL
               (SPADCALL (SPADCALL (MAKEARR1 (ANCOLS |y|) |m|) (QREFELT % 44))
                         (SPADCALL (CONS #'|MHROWRED;vconc!0| (VECTOR % |m|))
                                   |y| (QREFELT % 47))
                         (QREFELT % 48)))) 

(SDEFUN |MHROWRED;vconc!0| ((|s| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |m| (QREFELT % 45)))))) 

(SDEFUN |MHROWRED;order| ((|m| (R)) (|p| (R)) (% (|Integer|)))
        (SPROG ((|i| NIL) (|mm| (|Union| R "failed")) (#1=#:G1161 NIL))
               (SEQ
                (EXIT
                 (COND ((SPADCALL |m| (QREFELT % 39)) -1)
                       ('T
                        (SEQ (LETT |i| 0) G190 NIL
                             (SEQ (LETT |mm| (SPADCALL |m| |p| (QREFELT % 50)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |mm| 1)
                                     (PROGN (LETT #1# |i|) (GO #2=#:G1160)))
                                    ('T (LETT |m| (QCDR |mm|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL)))))
                #2# (EXIT #1#)))) 

(SDEFUN |MHROWRED;normalizedDivide;2RR;10|
        ((|n| (R)) (|d| (R))
         (% (|Record| (|:| |quotient| R) (|:| |remainder| R))))
        (SPROG ((|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))))
               (SEQ (LETT |qr| (SPADCALL |n| |d| (QREFELT % 52)))
                    (EXIT
                     (COND
                      ((SPADCALL (QCDR |qr|) (|spadConstant| % 7)
                                 (QREFELT % 53))
                       |qr|)
                      ((SPADCALL |d| (|spadConstant| % 7) (QREFELT % 54))
                       (SEQ
                        (PROGN
                         (RPLACD |qr|
                                 (SPADCALL (QCDR |qr|) |d| (QREFELT % 55)))
                         (QCDR |qr|))
                        (PROGN
                         (RPLACA |qr|
                                 (SPADCALL (QCAR |qr|) (|spadConstant| % 22)
                                           (QREFELT % 56)))
                         (QCAR |qr|))
                        (EXIT |qr|)))
                      ('T
                       (SEQ
                        (PROGN
                         (RPLACD |qr|
                                 (SPADCALL (QCDR |qr|) |d| (QREFELT % 56)))
                         (QCDR |qr|))
                        (PROGN
                         (RPLACA |qr|
                                 (SPADCALL (QCAR |qr|) (|spadConstant| % 22)
                                           (QREFELT % 55)))
                         (QCAR |qr|))
                        (EXIT |qr|)))))))) 

(SDEFUN |MHROWRED;normalizedDivide;2RR;11|
        ((|n| (R)) (|d| (R))
         (% (|Record| (|:| |quotient| R) (|:| |remainder| R))))
        (SPADCALL |n| |d| (QREFELT % 52))) 

(SDEFUN |MHROWRED;rowEchLocal;MRM;12|
        ((|x| (|Matrix| R)) (|p| (R)) (% (|Matrix| R)))
        (SPROG
         ((|u|
           (|Union| (|Record| (|:| |val| R) (|:| |mat| (|Matrix| R)))
                    "failed"))
          (|d| (R)))
         (SEQ (LETT |u| (|MHROWRED;diagSubMatrix| |x| %))
              (EXIT
               (COND
                ((QEQCAR |u| 1)
                 (COND
                  ((SPADCALL (LETT |d| (|MHROWRED;determinantOfMinor| |x| %))
                             (QREFELT % 39))
                   (SPADCALL |x| (QREFELT % 40)))
                  (#1='T (SPADCALL |x| |d| |p| (QREFELT % 59)))))
                (#1#
                 (SPADCALL (QCDR (QCDR |u|)) (QCAR (QCDR |u|)) |p|
                           (QREFELT % 59)))))))) 

(SDEFUN |MHROWRED;rowEchelonLocal;M2RM;13|
        ((|y| (|Matrix| R)) (|m| (R)) (|p| (R)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G1178 NIL) (|nrows| (|Integer|)) (|ncols| (|Integer|))
          (|minr| #2=(|Integer|)) (|j| NIL) (#3=#:G1213 NIL) (#4=#:G1212 NIL)
          (#5=#:G1214 NIL) (|npivord| #6=(|Integer|)) (|rown| (|Integer|))
          (|pivord| #6#) (#7=#:G1211 NIL) (|x| (|Matrix| R))
          (|#G79|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|a| (R)) (|b| (R)) (|d| (R)) (|pivot| (R)) (#8=#:G1215 NIL)
          (#9=#:G1216 NIL) (#10=#:G1191 NIL) (|q| (R)) (#11=#:G1217 NIL)
          (|v2| (R)) (|k| NIL) (#12=#:G1218 NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))) (|k1| NIL)
          (#13=#:G1219 NIL) (|i| #2#))
         (SEQ
          (LETT |m|
                (SPADCALL |p|
                          (PROG1 (LETT #1# (|MHROWRED;order| |m| |p| %))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT % 61)))
          (LETT |x| (|MHROWRED;vconc| |y| |m| %))
          (LETT |nrows| (SPADCALL |x| (QREFELT % 16)))
          (LETT |ncols| (SPADCALL |x| (QREFELT % 31)))
          (LETT |minr| (LETT |i| (PROGN |x| 1)))
          (SEQ
           (EXIT
            (SEQ (LETT |j| (PROGN |x| 1)) (LETT #3# |ncols|) G190
                 (COND ((> |j| #3#) (GO G191)))
                 (SEQ
                  (COND
                   ((> |i| |nrows|)
                    (PROGN (LETT #4# |$NoValue|) (GO #14=#:G1208))))
                  (LETT |rown| (- |minr| 1))
                  (SEQ (LETT |k| |i|) (LETT #5# |nrows|) G190
                       (COND ((> |k| #5#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                     (|spadConstant| % 7) (QREFELT % 28))
                           "next k")
                          ('T
                           (SEQ
                            (EXIT
                             (SEQ
                              (LETT |npivord|
                                    (|MHROWRED;order| (QAREF2O |x| |k| |j| 1 1)
                                     |p| %))
                              (EXIT
                               (COND
                                ((OR (EQL |rown| (- |minr| 1))
                                     (< |npivord| |pivord|))
                                 (PROGN
                                  (LETT #7#
                                        (SEQ (LETT |rown| |k|)
                                             (EXIT (LETT |pivord| |npivord|))))
                                  (GO #15=#:G1183)))))))
                            #15# (EXIT #7#))))))
                       (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |rown| (- |minr| 1)) "enuf")
                         ('T
                          (SEQ
                           (LETT |x| (SPADCALL |x| |i| |rown| (QREFELT % 62)))
                           (PROGN
                            (LETT |#G79|
                                  (SPADCALL (QAREF2O |x| |i| |j| 1 1) |m|
                                            (QREFELT % 64)))
                            (LETT |a| (QVELT |#G79| 0))
                            (LETT |b| (QVELT |#G79| 1))
                            (LETT |d| (QVELT |#G79| 2))
                            |#G79|)
                           (QSETAREF2O |x| |i| |j| |d| 1 1) (LETT |pivot| |d|)
                           (SEQ (LETT |k| (+ |j| 1)) (LETT #8# |ncols|) G190
                                (COND ((> |k| #8#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |x| |i| |k|
                                              (SPADCALL
                                               (SPADCALL |a|
                                                         (QAREF2O |x| |i| |k| 1
                                                                  1)
                                                         (QREFELT % 65))
                                               |m| (QREFELT % 45))
                                              1 1)))
                                (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                           (SEQ (LETT |k| (+ |i| 1)) (LETT #9# |nrows|) G190
                                (COND ((> |k| #9#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                              (QREFELT % 39))
                                    "next k")
                                   ('T
                                    (SEQ
                                     (LETT |q|
                                           (PROG2
                                               (LETT #10#
                                                     (SPADCALL
                                                      (QAREF2O |x| |k| |j| 1 1)
                                                      |pivot| (QREFELT % 50)))
                                               (QCDR #10#)
                                             (|check_union2| (QEQCAR #10# 0)
                                                             (QREFELT % 6)
                                                             (|Union|
                                                              (QREFELT % 6)
                                                              "failed")
                                                             #10#)))
                                     (SEQ (LETT |k1| (+ |j| 1))
                                          (LETT #11# |ncols|) G190
                                          (COND ((> |k1| #11#) (GO G191)))
                                          (SEQ
                                           (LETT |v2|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (QAREF2O |x| |k| |k1| 1 1)
                                                   (SPADCALL |q|
                                                             (QAREF2O |x| |i|
                                                                      |k1| 1 1)
                                                             (QREFELT % 65))
                                                   (QREFELT % 56))
                                                  |m| (QREFELT % 45)))
                                           (EXIT
                                            (QSETAREF2O |x| |k| |k1| |v2| 1
                                                        1)))
                                          (LETT |k1| (+ |k1| 1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (QSETAREF2O |x| |k| |j|
                                                  (|spadConstant| % 7) 1
                                                  1)))))))
                                (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                           (SEQ (LETT |k| |minr|) (LETT #12# (- |i| 1)) G190
                                (COND ((> |k| #12#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                              (QREFELT % 39))
                                    "enuf")
                                   ('T
                                    (SEQ
                                     (LETT |qr|
                                           (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                     |pivot| (QREFELT % 58)))
                                     (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1 1)
                                     (EXIT
                                      (SEQ (LETT |k1| (+ |j| 1))
                                           (LETT #13# (ANCOLS |x|)) G190
                                           (COND ((> |k1| #13#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |x| |k| |k1|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (QAREF2O |x| |k|
                                                                    |k1| 1 1)
                                                           (SPADCALL
                                                            (QCAR |qr|)
                                                            (QAREF2O |x| |i|
                                                                     |k1| 1 1)
                                                            (QREFELT % 65))
                                                           (QREFELT % 56))
                                                          |m| (QREFELT % 45))
                                                         1 1)))
                                           (LETT |k1| (+ |k1| 1)) (GO G190)
                                           G191 (EXIT NIL))))))))
                                (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT (LETT |i| (+ |i| 1))))))))
                 (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
           #14# (EXIT #4#))
          (EXIT |x|)))) 

(SDEFUN |MHROWRED;rowEchelon;MRM;14|
        ((|y| (|Matrix| R)) (|m| (R)) (% (|Matrix| R)))
        (SPADCALL |y| |m| (QREFELT % 41))) 

(SDEFUN |MHROWRED;rowEchelon1;MRM;15|
        ((|y| (|Matrix| R)) (|m| (R)) (% (|Matrix| R)))
        (SPADCALL (|MHROWRED;vconc| |y| |m| %) (QREFELT % 40))) 

(SDEFUN |MHROWRED;rowEchelon;MRM;16|
        ((|y| (|Matrix| R)) (|m| (R)) (% (|Matrix| R)))
        (SPROG
         ((|nr| (|NonNegativeInteger|)) (|nc| (|NonNegativeInteger|)) (|d| (R))
          (|m1| (R)))
         (SEQ (LETT |nr| (ANROWS |y|)) (LETT |nc| (ANCOLS |y|))
              (EXIT
               (COND
                ((EQL |nr| |nc|)
                 (SEQ (LETT |d| (SPADCALL |y| (QREFELT % 35)))
                      (LETT |m1| (SPADCALL |d| |m| (QREFELT % 36)))
                      (EXIT (SPADCALL |y| |m1| (QREFELT % 41)))))
                ('T (SPADCALL |y| |m| (QREFELT % 41)))))))) 

(SDEFUN |MHROWRED;rowEchelon1;MRM;17|
        ((|y| (|Matrix| R)) (|m| (R)) (% (|Matrix| R)))
        (SPROG
         ((|nrows| (|Integer|)) (|ncols| (|Integer|)) (|minr| #1=(|Integer|))
          (|j| NIL) (#2=#:G1259 NIL) (#3=#:G1258 NIL) (#4=#:G1260 NIL)
          (|rown| (|Integer|)) (|x| (|Matrix| R)) (#5=#:G1261 NIL)
          (|#G96|
           (|Record| (|:| |coef1| R) (|:| |coef2| R) (|:| |generator| R)))
          (|a| (R)) (|b| (R)) (|d| (R)) (|#G97| (R)) (#6=#:G1234 NIL)
          (|#G98| (R)) (|b1| (R)) (|a1| (R)) (#7=#:G1262 NIL) (|v1| (R))
          (|v2| (R))
          (|un|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|jj| NIL) (#8=#:G1263 NIL) (|xij| (R)) (|k| NIL) (#9=#:G1264 NIL)
          (|qr| (|Record| (|:| |quotient| R) (|:| |remainder| R))) (|k1| NIL)
          (#10=#:G1265 NIL) (|i| #1#))
         (SEQ (LETT |x| (|MHROWRED;vconc| |y| |m| %))
              (LETT |nrows| (SPADCALL |x| (QREFELT % 16)))
              (LETT |ncols| (SPADCALL |x| (QREFELT % 31)))
              (LETT |minr| (LETT |i| (PROGN |x| 1)))
              (SEQ
               (EXIT
                (SEQ (LETT |j| (PROGN |x| 1)) (LETT #2# |ncols|) G190
                     (COND ((> |j| #2#) (GO G191)))
                     (SEQ
                      (COND
                       ((> |i| |nrows|)
                        (PROGN (LETT #3# |$NoValue|) (GO #11=#:G1255))))
                      (LETT |rown| (- |minr| 1))
                      (SEQ (LETT |k| |i|) (LETT #4# |nrows|) G190
                           (COND ((> |k| #4#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                         (|spadConstant| % 7) (QREFELT % 9))
                               (COND
                                ((OR (EQL |rown| (- |minr| 1))
                                     (SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                               (QAREF2O |x| |rown| |j| 1 1)
                                               (QREFELT % 66)))
                                 (LETT |rown| |k|)))))))
                           (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |rown| (- |minr| 1)) "next j")
                             ('T
                              (SEQ
                               (LETT |x|
                                     (SPADCALL |x| |i| |rown| (QREFELT % 62)))
                               (SEQ (LETT |k| (+ |i| 1)) (LETT #5# |nrows|)
                                    G190 (COND ((> |k| #5#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                  (QREFELT % 39))
                                        "next k")
                                       ('T
                                        (SEQ
                                         (PROGN
                                          (LETT |#G96|
                                                (SPADCALL
                                                 (QAREF2O |x| |i| |j| 1 1)
                                                 (QAREF2O |x| |k| |j| 1 1)
                                                 (QREFELT % 64)))
                                          (LETT |a| (QVELT |#G96| 0))
                                          (LETT |b| (QVELT |#G96| 1))
                                          (LETT |d| (QVELT |#G96| 2))
                                          |#G96|)
                                         (PROGN
                                          (LETT |#G97|
                                                (PROG2
                                                    (LETT #6#
                                                          (SPADCALL
                                                           (QAREF2O |x| |i| |j|
                                                                    1 1)
                                                           |d| (QREFELT % 50)))
                                                    (QCDR #6#)
                                                  (|check_union2|
                                                   (QEQCAR #6# 0) (QREFELT % 6)
                                                   (|Union| (QREFELT % 6)
                                                            #12="failed")
                                                   #6#)))
                                          (LETT |#G98|
                                                (PROG2
                                                    (LETT #6#
                                                          (SPADCALL
                                                           (QAREF2O |x| |k| |j|
                                                                    1 1)
                                                           |d| (QREFELT % 50)))
                                                    (QCDR #6#)
                                                  (|check_union2|
                                                   (QEQCAR #6# 0) (QREFELT % 6)
                                                   (|Union| (QREFELT % 6) #12#)
                                                   #6#)))
                                          (LETT |b1| |#G97|)
                                          (LETT |a1| |#G98|))
                                         (SEQ (LETT |k1| (+ |j| 1))
                                              (LETT #7# |ncols|) G190
                                              (COND ((> |k1| #7#) (GO G191)))
                                              (SEQ
                                               (LETT |v1|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |a|
                                                                 (QAREF2O |x|
                                                                          |i|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT %
                                                                          65))
                                                       (SPADCALL |b|
                                                                 (QAREF2O |x|
                                                                          |k|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT %
                                                                          65))
                                                       (QREFELT % 55))
                                                      |m| (QREFELT % 45)))
                                               (LETT |v2|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |b1|
                                                                 (QAREF2O |x|
                                                                          |k|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT %
                                                                          65))
                                                       (SPADCALL |a1|
                                                                 (QAREF2O |x|
                                                                          |i|
                                                                          |k1|
                                                                          1 1)
                                                                 (QREFELT %
                                                                          65))
                                                       (QREFELT % 56))
                                                      |m| (QREFELT % 45)))
                                               (QSETAREF2O |x| |i| |k1| |v1| 1
                                                           1)
                                               (EXIT
                                                (QSETAREF2O |x| |k| |k1| |v2| 1
                                                            1)))
                                              (LETT |k1| (+ |k1| 1)) (GO G190)
                                              G191 (EXIT NIL))
                                         (QSETAREF2O |x| |i| |j| |d| 1 1)
                                         (EXIT
                                          (QSETAREF2O |x| |k| |j|
                                                      (|spadConstant| % 7) 1
                                                      1)))))))
                                    (LETT |k| (+ |k| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (LETT |un|
                                     (SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                               (QREFELT % 68)))
                               (QSETAREF2O |x| |i| |j| (QVELT |un| 1) 1 1)
                               (COND
                                ((SPADCALL (QVELT |un| 2) (|spadConstant| % 22)
                                           (QREFELT % 9))
                                 (SEQ (LETT |jj| (+ |j| 1)) (LETT #8# |ncols|)
                                      G190 (COND ((> |jj| #8#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETAREF2O |x| |i| |jj|
                                                    (SPADCALL (QVELT |un| 2)
                                                              (QAREF2O |x| |i|
                                                                       |jj| 1
                                                                       1)
                                                              (QREFELT % 65))
                                                    1 1)))
                                      (LETT |jj| (+ |jj| 1)) (GO G190) G191
                                      (EXIT NIL))))
                               (LETT |xij| (QAREF2O |x| |i| |j| 1 1))
                               (SEQ (LETT |k| |minr|) (LETT #9# (- |i| 1)) G190
                                    (COND ((> |k| #9#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QAREF2O |x| |k| |j| 1 1)
                                                  (QREFELT % 39))
                                        "next k")
                                       ('T
                                        (SEQ
                                         (LETT |qr|
                                               (SPADCALL
                                                (QAREF2O |x| |k| |j| 1 1) |xij|
                                                (QREFELT % 58)))
                                         (QSETAREF2O |x| |k| |j| (QCDR |qr|) 1
                                                     1)
                                         (EXIT
                                          (SEQ (LETT |k1| (+ |j| 1))
                                               (LETT #10# (ANCOLS |x|)) G190
                                               (COND ((> |k1| #10#) (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (QSETAREF2O |x| |k| |k1|
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QAREF2O |x| |k|
                                                                        |k1| 1
                                                                        1)
                                                               (SPADCALL
                                                                (QCAR |qr|)
                                                                (QAREF2O |x|
                                                                         |i|
                                                                         |k1| 1
                                                                         1)
                                                                (QREFELT % 65))
                                                               (QREFELT % 56))
                                                              |m|
                                                              (QREFELT % 45))
                                                             1 1)))
                                               (LETT |k1| (+ |k1| 1)) (GO G190)
                                               G191 (EXIT NIL))))))))
                                    (LETT |k| (+ |k| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT (LETT |i| (+ |i| 1))))))))
                     (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
               #11# (EXIT #3#))
              (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ModularHermitianRowReduction;|)) 

(DEFUN |ModularHermitianRowReduction;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ModularHermitianRowReduction| DV$1))
          (LETT % (GETREFV 69))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularHermitianRowReduction|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV % 58
                      (CONS
                       (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;10|)
                       %)))
           ('T
            (QSETREFV % 58
                      (CONS
                       (|dispatchFunction| |MHROWRED;normalizedDivide;2RR;11|)
                       %))))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV % 42
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;14|)
                             %))
             (QSETREFV % 41
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon1;MRM;15|)
                             %))))
           ('T
            (PROGN
             (QSETREFV % 42
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon;MRM;16|)
                             %))
             (QSETREFV % 41
                       (CONS (|dispatchFunction| |MHROWRED;rowEchelon1;MRM;17|)
                             %)))))
          %))) 

(DEFUN |ModularHermitianRowReduction| (#1=#:G1266)
  (SPROG NIL
         (PROG (#2=#:G1267)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ModularHermitianRowReduction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ModularHermitianRowReduction;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ModularHermitianRowReduction|)))))))))) 

(MAKEPROP '|ModularHermitianRowReduction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |0|) (|Boolean|)
              (4 . ~=) (|Mapping| 8 6) (|Vector| 6) (10 . |any?|) (|Integer|)
              (16 . |minIndex|) (|Matrix| 6) (21 . |maxRowIndex|) (|List| 13)
              (26 . |member?|) (32 . |row|) (|List| 6) (38 . |parts|)
              (43 . |1|) (|NonNegativeInteger|) (47 . |zero|) (|List| 20)
              (53 . |matrix|) (58 . |removeDuplicates|) (63 . =) (|Set| 13)
              (69 . |set|) (74 . |maxColIndex|) (79 . =) (85 . |binomial|)
              (91 . |elt|) (98 . |determinant|) (103 . |gcd|) (109 . |elt|)
              (115 . |rest|) (121 . |zero?|) (126 . |rowEchelon|)
              (131 . |rowEchelon1|) (137 . |rowEchelon|) |MHROWRED;rowEch;2M;7|
              (143 . |diagonalMatrix|) (148 . |rem|) (|Mapping| 6 6)
              (154 . |map|) (160 . |vertConcat|) (|Union| % '"failed")
              (166 . |exquo|) (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (172 . |divide|) (178 . >=) (184 . >) (190 . +) (196 . -)
              (|Record| (|:| |quotient| 6) (|:| |remainder| 6))
              (202 . |normalizedDivide|) |MHROWRED;rowEchelonLocal;M2RM;13|
              |MHROWRED;rowEchLocal;MRM;12| (208 . ^) (214 . |swapRows!|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (221 . |extendedEuclidean|) (227 . *) (233 . |sizeLess?|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (239 . |unitNormal|))
           '#(|rowEchelonLocal| 244 |rowEchelon1| 251 |rowEchelon| 257
              |rowEchLocal| 263 |rowEch| 269 |normalizedDivide| 274)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rowEch| ((|Matrix| |#1|) (|Matrix| |#1|))) T)
                              '((|rowEchelon|
                                 ((|Matrix| |#1|) (|Matrix| |#1|) |#1|))
                                T)
                              '((|rowEchelon1|
                                 ((|Matrix| |#1|) (|Matrix| |#1|) |#1|))
                                T)
                              '((|rowEchLocal|
                                 ((|Matrix| |#1|) (|Matrix| |#1|) |#1|))
                                T)
                              '((|rowEchelonLocal|
                                 ((|Matrix| |#1|) (|Matrix| |#1|) |#1| |#1|))
                                T)
                              '((|normalizedDivide|
                                 ((|Record| (|:| |quotient| |#1|)
                                            (|:| |remainder| |#1|))
                                  |#1| |#1|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 68
                                            '(0 6 0 7 2 6 8 0 0 9 2 11 8 10 0
                                              12 1 11 13 0 14 1 15 13 0 16 2 17
                                              8 13 0 18 2 15 11 0 13 19 1 11 20
                                              0 21 0 6 0 22 2 15 0 23 23 24 1
                                              15 0 25 26 1 20 0 0 27 2 6 8 0 0
                                              28 1 29 0 17 30 1 15 13 0 31 2 29
                                              8 0 0 32 2 13 0 0 0 33 3 15 0 0
                                              17 17 34 1 15 6 0 35 2 6 0 0 0 36
                                              2 17 13 0 13 37 2 17 0 0 23 38 1
                                              6 8 0 39 1 15 0 0 40 2 0 15 15 6
                                              41 2 0 15 15 6 42 1 15 0 11 44 2
                                              6 0 0 0 45 2 15 0 46 0 47 2 15 0
                                              0 0 48 2 6 49 0 0 50 2 6 51 0 0
                                              52 2 6 8 0 0 53 2 6 8 0 0 54 2 6
                                              0 0 0 55 2 6 0 0 0 56 2 0 57 6 6
                                              58 2 6 0 0 23 61 3 15 0 0 13 13
                                              62 2 6 63 0 0 64 2 6 0 0 0 65 2 6
                                              8 0 0 66 1 6 67 0 68 3 0 15 15 6
                                              6 59 2 0 15 15 6 41 2 0 15 15 6
                                              42 2 0 15 15 6 60 1 0 15 15 43 2
                                              0 57 6 6 58)))))
           '|lookupComplete|)) 
