
(SDEFUN |REAL0;negate|
        ((|int|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (%
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (CONS (SPADCALL (QCDR |int|) (QREFELT % 8))
              (SPADCALL (QCAR |int|) (QREFELT % 8)))) 

(SDEFUN |REAL0;midpoint;RF;2|
        ((|i|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (% (|Fraction| (|Integer|))))
        (SPADCALL (SPADCALL 1 2 (QREFELT % 12))
                  (SPADCALL (QCAR |i|) (QCDR |i|) (QREFELT % 13))
                  (QREFELT % 14))) 

(SDEFUN |REAL0;midpoints;LL;3|
        ((|li|
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|))))))
         (% (|List| (|Fraction| (|Integer|)))))
        (SPROG ((#1=#:G15 NIL) (|x| NIL) (#2=#:G16 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |x| NIL) (LETT #2# |li|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |x| (QREFELT % 16)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |REAL0;makeSqfr| ((F (|Pol|)) (% (|Pol|)))
        (SPROG
         ((|sqfr| (|Factored| |Pol|)) (|s| NIL) (#1=#:G30 NIL)
          (#2=#:G27 (|Pol|)) (#3=#:G25 (|Pol|)) (#4=#:G26 NIL))
         (SEQ (LETT |sqfr| (SPADCALL F (QREFELT % 21)))
              (EXIT
               (LETT F
                     (PROGN
                      (LETT #4# NIL)
                      (SEQ (LETT |s| NIL)
                           (LETT #1# (SPADCALL |sqfr| (QREFELT % 26))) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #2# (QVELT |s| 1))
                              (COND
                               (#4#
                                (LETT #3# (SPADCALL #3# #2# (QREFELT % 27))))
                               ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (COND (#4# #3#) ('T (|spadConstant| % 9))))))))) 

(SDEFUN |REAL0;realZeros;PolL;5|
        ((F (|Pol|))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (|REAL0;ReZeroSqfr| (|REAL0;makeSqfr| F %) %)) 

(SDEFUN |REAL0;realZeros;PolFL;6|
        ((F (|Pol|)) (|rn| (|Fraction| (|Integer|)))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG ((#1=#:G36 NIL) (|int| NIL) (#2=#:G37 NIL))
               (SEQ (LETT F (|REAL0;makeSqfr| F %))
                    (EXIT
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |int| NIL) (LETT #2# (|REAL0;ReZeroSqfr| F %))
                           G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |int| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS (SPADCALL F |int| |rn| (QREFELT % 29))
                                         #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |REAL0;realZeros;PolRL;7|
        ((F (|Pol|))
         (|bounds|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG
         ((#1=#:G48 NIL) (|int| NIL) (#2=#:G49 NIL)
          (|rint|
           (|Union|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))
            #3="failed"))
          (#4=#:G43 NIL))
         (SEQ (LETT F (|REAL0;makeSqfr| F %))
              (EXIT
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |int| NIL) (LETT #2# (|REAL0;ReZeroSqfr| F %)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |int| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR
                          (LETT |rint|
                                (SPADCALL F |int| |bounds| (QREFELT % 32)))
                          0)
                         (LETT #1#
                               (CONS
                                (PROG2 (LETT #4# |rint|)
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|Record|
                                                   (|:| |left|
                                                        (|Fraction|
                                                         (|Integer|)))
                                                   (|:| |right|
                                                        (|Fraction|
                                                         (|Integer|))))
                                                  (|Union|
                                                   (|Record|
                                                    (|:| |left|
                                                         (|Fraction|
                                                          (|Integer|)))
                                                    (|:| |right|
                                                         (|Fraction|
                                                          (|Integer|))))
                                                   #3#)
                                                  #4#))
                                #1#))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |REAL0;realZeros;PolRFL;8|
        ((F (|Pol|))
         (|bounds|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (|rn| (|Fraction| (|Integer|)))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG ((#1=#:G54 NIL) (|int| NIL) (#2=#:G55 NIL))
               (SEQ (LETT F (|REAL0;makeSqfr| F %))
                    (EXIT
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |int| NIL)
                           (LETT #2# (SPADCALL F |bounds| (QREFELT % 33))) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |int| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS (SPADCALL F |int| |rn| (QREFELT % 29))
                                         #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |REAL0;ReZeroSqfr|
        ((F (|Pol|))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG
         ((|r| (|NonNegativeInteger|))
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|tempF| (|Union| |Pol| "failed")) (#1=#:G70 NIL) (|int| NIL)
          (#2=#:G71 NIL)
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|)))))))
         (SEQ
          (COND
           ((SPADCALL F (|spadConstant| % 35) (QREFELT % 37))
            (|error| "ReZeroSqfr: zero polynomial"))
           (#3='T
            (SEQ (LETT L NIL)
                 (EXIT
                  (COND ((EQL (SPADCALL F (QREFELT % 39)) 0) L)
                        (#3#
                         (SEQ
                          (SEQ (LETT |r| (SPADCALL F (QREFELT % 40)))
                               (EXIT
                                (COND
                                 ((> |r| 0)
                                  (SEQ
                                   (LETT L
                                         (LIST
                                          (CONS (|spadConstant| % 41)
                                                (|spadConstant| % 41))))
                                   (LETT |tempF|
                                         (SPADCALL F
                                                   (SPADCALL 1 |r|
                                                             (QREFELT % 42))
                                                   (QREFELT % 44)))
                                   (EXIT
                                    (COND
                                     ((NULL (QEQCAR |tempF| 1))
                                      (LETT F (QCDR |tempF|))))))))))
                          (LETT J
                                (PROGN
                                 (LETT #1# NIL)
                                 (SEQ (LETT |int| NIL)
                                      (LETT #2#
                                            (REVERSE
                                             (|REAL0;PosZero|
                                              (|REAL0;minus| F %) %)))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |int| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #1#
                                              (CONS (|REAL0;negate| |int| %)
                                                    #1#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #1#)))))
                          (LETT K (|REAL0;PosZero| F %))
                          (EXIT
                           (SPADCALL (SPADCALL J L (QREFELT % 45)) K
                                     (QREFELT % 45))))))))))))) 

(SDEFUN |REAL0;PosZero|
        ((F (|Pol|))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG
         ((|b| (|Integer|)) (#1=#:G76 NIL) (|int| NIL) (#2=#:G77 NIL)
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|)))))))
         (SEQ (LETT |b| (|REAL0;rootBound| F %))
              (LETT F (|REAL0;transMult| |b| F %)) (LETT L (|REAL0;Zero1| F %))
              (EXIT
               (LETT L
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |int| NIL) (LETT #2# L) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |int| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (CONS
                                     (SPADCALL |b| (QCAR |int|) (QREFELT % 46))
                                     (SPADCALL |b| (QCDR |int|)
                                               (QREFELT % 46)))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))))))) 

(SDEFUN |REAL0;Zero1|
        ((F (|Pol|))
         (%
          (|List|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|)))))))
        (SPROG
         ((|v| (|Integer|))
          (L
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (|tempH| #1=(|Union| |Pol| "failed")) (H (|Pol|)) (Q (|Pol|))
          (|tempG| #1#) (G (|Pol|)) (#2=#:G90 NIL) (#3=#:G91 NIL)
          (J
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|))))))
          (#4=#:G92 NIL) (|int| NIL) (#5=#:G93 NIL)
          (K
           (|List|
            (|Record| (|:| |left| (|Fraction| (|Integer|)))
                      (|:| |right| (|Fraction| (|Integer|)))))))
         (SEQ (LETT L NIL)
              (LETT |v|
                    (|REAL0;var| (|REAL0;transAdd1| (|REAL0;invert| F %) %) %))
              (EXIT
               (COND ((EQL |v| 0) NIL)
                     ((EQL |v| 1)
                      (LETT L
                            (LIST
                             (CONS (|spadConstant| % 41)
                                   (|spadConstant| % 10)))))
                     ('T
                      (SEQ (LETT G (|REAL0;transMultInv| 2 F %))
                           (LETT H (|REAL0;transAdd1| G %))
                           (COND
                            ((> (SPADCALL H (QREFELT % 40)) 0)
                             (SEQ
                              (LETT L
                                    (LIST
                                     (CONS (SPADCALL 1 2 (QREFELT % 12))
                                           (SPADCALL 1 2 (QREFELT % 12)))))
                              (LETT Q (SPADCALL 1 1 (QREFELT % 42)))
                              (LETT |tempH| (SPADCALL H Q (QREFELT % 44)))
                              (COND
                               ((NULL (QEQCAR |tempH| 1))
                                (LETT H (QCDR |tempH|))))
                              (LETT Q
                                    (SPADCALL Q (SPADCALL -1 0 (QREFELT % 42))
                                              (QREFELT % 47)))
                              (LETT |tempG| (SPADCALL G Q (QREFELT % 44)))
                              (EXIT
                               (COND
                                ((NULL (QEQCAR |tempG| 1))
                                 (LETT G (QCDR |tempG|))))))))
                           (LETT J
                                 (PROGN
                                  (LETT #2# NIL)
                                  (SEQ (LETT |int| NIL)
                                       (LETT #3# (|REAL0;Zero1| H %)) G190
                                       (COND
                                        ((OR (ATOM #3#)
                                             (PROGN
                                              (LETT |int| (CAR #3#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QCAR |int|)
                                                            (|spadConstant| %
                                                                            10)
                                                            (QREFELT % 13))
                                                  (SPADCALL 1 2 (QREFELT % 12))
                                                  (QREFELT % 14))
                                                 (SPADCALL
                                                  (SPADCALL (QCDR |int|)
                                                            (|spadConstant| %
                                                                            10)
                                                            (QREFELT % 13))
                                                  (SPADCALL 1 2 (QREFELT % 12))
                                                  (QREFELT % 14)))
                                                #2#))))
                                       (LETT #3# (CDR #3#)) (GO G190) G191
                                       (EXIT (NREVERSE #2#)))))
                           (LETT K
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT |int| NIL)
                                       (LETT #5# (|REAL0;Zero1| G %)) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN
                                              (LETT |int| (CAR #5#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #4#
                                               (CONS
                                                (CONS
                                                 (SPADCALL (QCAR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT %
                                                                              12))
                                                           (QREFELT % 14))
                                                 (SPADCALL (QCDR |int|)
                                                           (SPADCALL 1 2
                                                                     (QREFELT %
                                                                              12))
                                                           (QREFELT % 14)))
                                                #4#))))
                                       (LETT #5# (CDR #5#)) (GO G190) G191
                                       (EXIT (NREVERSE #4#)))))
                           (EXIT
                            (SPADCALL (SPADCALL J L (QREFELT % 45)) K
                                      (QREFELT % 45)))))))))) 

(SDEFUN |REAL0;rootBound| ((F (|Pol|)) (% (|Integer|)))
        (SPROG
         ((|lcoef| #1=(|Integer|)) (|an| #1#) (|i| (|Integer|))
          (|b| (|Integer|)))
         (SEQ
          (COND
           ((< (SPADCALL F (QREFELT % 48)) 0)
            (LETT F (SPADCALL F (QREFELT % 49)))))
          (LETT |lcoef| (SPADCALL F (QREFELT % 48)))
          (LETT F (SPADCALL F (QREFELT % 50))) (LETT |i| 0)
          (SEQ G190
               (COND
                ((NULL
                  (NULL (SPADCALL F (|spadConstant| % 35) (QREFELT % 37))))
                 (GO G191)))
               (SEQ
                (SEQ (LETT |an| (SPADCALL F (QREFELT % 48)))
                     (EXIT (COND ((< |an| 0) (LETT |i| (- |i| |an|))))))
                (EXIT (LETT F (SPADCALL F (QREFELT % 50)))))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |b| 1)
          (SEQ G190 (COND ((NULL (<= (* |b| |lcoef|) |i|)) (GO G191)))
               (SEQ (EXIT (LETT |b| (* 2 |b|)))) NIL (GO G190) G191 (EXIT NIL))
          (EXIT |b|)))) 

(SDEFUN |REAL0;transMult| ((|c| (|Integer|)) (F (|Pol|)) (% (|Pol|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (G (|Pol|)))
               (SEQ (LETT G (|spadConstant| % 35))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| % 35)
                                       (QREFELT % 37))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT % 39)))
                              (LETT G
                                    (SPADCALL G
                                              (SPADCALL
                                               (* (EXPT |c| |n|)
                                                  (SPADCALL F (QREFELT % 48)))
                                               |n| (QREFELT % 42))
                                              (QREFELT % 47)))
                              (EXIT (LETT F (SPADCALL F (QREFELT % 50)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;transMultInv| ((|c| (|Integer|)) (F (|Pol|)) (% (|Pol|)))
        (SPROG
         ((|n| #1=(|NonNegativeInteger|)) (#2=#:G110 NIL) (|cc| (|Integer|))
          (G (|Pol|)) (|d| #1#))
         (SEQ (LETT |d| (SPADCALL F (QREFELT % 39))) (LETT |cc| 1)
              (LETT G
                    (SPADCALL (SPADCALL F (QREFELT % 48)) |d| (QREFELT % 42)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT F (SPADCALL F (QREFELT % 50)))
                                (|spadConstant| % 35) (QREFELT % 51)))
                     (GO G191)))
                   (SEQ (LETT |n| (SPADCALL F (QREFELT % 39)))
                        (LETT |cc|
                              (* |cc|
                                 (EXPT |c|
                                       (PROG1 (LETT #2# (- |d| |n|))
                                         (|check_subtype2| (>= #2# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|)
                                                           #2#)))))
                        (LETT G
                              (SPADCALL G
                                        (SPADCALL
                                         (* |cc| (SPADCALL F (QREFELT % 48)))
                                         |n| (QREFELT % 42))
                                        (QREFELT % 47)))
                        (EXIT (LETT |d| |n|)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT G)))) 

(SDEFUN |REAL0;transAdd1| ((F (|Pol|)) (% (|Pol|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|v| (|Vector| (|Integer|)))
          (#1=#:G123 NIL) (|j| NIL) (#2=#:G124 NIL) (|i| NIL) (#3=#:G125 NIL)
          (|ans| (|Pol|)))
         (SEQ (LETT |n| (SPADCALL F (QREFELT % 39)))
              (LETT |v| (SPADCALL F (+ |n| 1) (QREFELT % 53)))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (- |n| |i|)) (LETT #2# |n|) G190
                          (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1O |v| |j|
                                        (+ (QAREF1O |v| |j| 1)
                                           (QAREF1O |v| (+ |j| 1) 1))
                                        1)))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (|spadConstant| % 35))
              (SEQ (LETT |i| 0) (LETT #3# |n|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |ans|
                           (SPADCALL |ans|
                                     (SPADCALL (QAREF1O |v| (+ |i| 1) 1) |i|
                                               (QREFELT % 42))
                                     (QREFELT % 47)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |REAL0;minus| ((F (|Pol|)) (% (|Pol|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (|coef| (|Integer|)) (G (|Pol|)))
               (SEQ (LETT G (|spadConstant| % 35))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| % 35)
                                       (QREFELT % 37))))
                           (GO G191)))
                         (SEQ (LETT |n| (SPADCALL F (QREFELT % 39)))
                              (LETT |coef| (SPADCALL F (QREFELT % 48)))
                              (EXIT
                               (COND
                                ((ODDP |n|)
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL (- |coef|) |n|
                                                            (QREFELT % 42))
                                                  (QREFELT % 47)))
                                  (EXIT (LETT F (SPADCALL F (QREFELT % 50))))))
                                ('T
                                 (SEQ
                                  (LETT G
                                        (SPADCALL G
                                                  (SPADCALL |coef| |n|
                                                            (QREFELT % 42))
                                                  (QREFELT % 47)))
                                  (EXIT
                                   (LETT F (SPADCALL F (QREFELT % 50)))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;invert| ((F (|Pol|)) (% (|Pol|)))
        (SPROG ((|n| (|NonNegativeInteger|)) (#1=#:G134 NIL) (G (|Pol|)))
               (SEQ (LETT G (|spadConstant| % 35))
                    (LETT |n| (SPADCALL F (QREFELT % 39)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (NULL
                             (SPADCALL F (|spadConstant| % 35)
                                       (QREFELT % 37))))
                           (GO G191)))
                         (SEQ
                          (LETT G
                                (SPADCALL G
                                          (SPADCALL (SPADCALL F (QREFELT % 48))
                                                    (PROG1
                                                        (LETT #1#
                                                              (- |n|
                                                                 (SPADCALL F
                                                                           (QREFELT
                                                                            %
                                                                            39))))
                                                      (|check_subtype2|
                                                       (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                                    (QREFELT % 42))
                                          (QREFELT % 47)))
                          (EXIT (LETT F (SPADCALL F (QREFELT % 50)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT G)))) 

(SDEFUN |REAL0;var| ((F (|Pol|)) (% (|Integer|)))
        (SPROG ((|next| #1=(|Boolean|)) (|i| (|Integer|)) (|LastCoef| #1#))
               (SEQ (LETT |i| 0)
                    (LETT |LastCoef| (< (SPADCALL F (QREFELT % 48)) 0))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SEQ (LETT F (SPADCALL F (QREFELT % 50)))
                                 (EXIT
                                  (NULL
                                   (SPADCALL F (|spadConstant| % 35)
                                             (QREFELT % 37))))))
                           (GO G191)))
                         (SEQ (LETT |next| (< (SPADCALL F (QREFELT % 48)) 0))
                              (COND
                               (|LastCoef|
                                (COND
                                 ((NULL |next|)
                                  (COND (|LastCoef| (LETT |i| (+ |i| 1)))))))
                               ((OR |next| |LastCoef|) (LETT |i| (+ |i| 1))))
                              (EXIT (LETT |LastCoef| |next|)))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |i|)))) 

(SDEFUN |REAL0;refine;Pol2RU;19|
        ((F (|Pol|))
         (|int|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (|bounds|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (%
          (|Union|
           (|Record| (|:| |left| (|Fraction| (|Integer|)))
                     (|:| |right| (|Fraction| (|Integer|))))
           "failed")))
        (SPROG
         ((|lseg| (|Fraction| (|Integer|))) (|pt| (|Fraction| (|Integer|))))
         (SEQ
          (LETT |lseg|
                (SPADCALL
                 (SPADCALL (QCDR |int|) (QCDR |bounds|) (QREFELT % 54))
                 (SPADCALL (QCAR |int|) (QCAR |bounds|) (QREFELT % 55))
                 (QREFELT % 56)))
          (EXIT
           (COND
            ((SPADCALL |lseg| (|spadConstant| % 41) (QREFELT % 57))
             (CONS 1 "failed"))
            ((SPADCALL |lseg| (|spadConstant| % 41) (QREFELT % 58))
             (SEQ
              (LETT |pt|
                    (COND
                     ((SPADCALL (QCAR |int|) (QCDR |bounds|) (QREFELT % 58))
                      (QCAR |int|))
                     (#1='T (QCDR |int|))))
              (EXIT
               (COND
                ((EQL
                  (SPADCALL
                   (|REAL0;transMultInv| (SPADCALL |pt| (QREFELT % 59)) F %)
                   (SPADCALL |pt| (QREFELT % 60)) (QREFELT % 61))
                  0)
                 (CONS 0 (CONS |pt| |pt|)))
                (#1# (CONS 1 "failed"))))))
            (#1#
             (COND
              ((SPADCALL |lseg|
                         (SPADCALL (QCDR |int|) (QCAR |int|) (QREFELT % 56))
                         (QREFELT % 58))
               (CONS 0 |int|))
              (#1#
               (SPADCALL F (SPADCALL F |int| |lseg| (QREFELT % 29)) |bounds|
                         (QREFELT % 32)))))))))) 

(SDEFUN |REAL0;refine;PolRFR;20|
        ((F (|Pol|))
         (|int|
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|)))))
         (|eps| (|Fraction| (|Integer|)))
         (%
          (|Record| (|:| |left| (|Fraction| (|Integer|)))
                    (|:| |right| (|Fraction| (|Integer|))))))
        (SPROG
         ((#1=#:G156 NIL) (|u| #2=(|Integer|)) (|mid| (|Fraction| (|Integer|)))
          (|midn| #3=(|Integer|)) (|midd| #4=(|Integer|)) (|v| #2#) (|bn| #3#)
          (|bd| #4#) (|a| (|Fraction| (|Integer|)))
          (|b| (|Fraction| (|Integer|))) (|an| #3#) (|ad| #4#)
          (|xfl| (|Boolean|)))
         (SEQ (LETT |a| (QCAR |int|)) (LETT |b| (QCDR |int|))
              (EXIT
               (COND ((SPADCALL |a| |b| (QREFELT % 58)) (CONS |a| |b|))
                     ('T
                      (SEQ (LETT |an| (SPADCALL |a| (QREFELT % 60)))
                           (LETT |ad| (SPADCALL |a| (QREFELT % 59)))
                           (LETT |bn| (SPADCALL |b| (QREFELT % 60)))
                           (LETT |bd| (SPADCALL |b| (QREFELT % 59)))
                           (LETT |xfl| NIL)
                           (SEQ
                            (LETT |u|
                                  (SPADCALL (|REAL0;transMultInv| |ad| F %)
                                            |an| (QREFELT % 61)))
                            (EXIT
                             (COND
                              ((EQL |u| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |ad| 1
                                                                     (QREFELT %
                                                                              42))
                                                           (SPADCALL |an| 0
                                                                     (QREFELT %
                                                                              42))
                                                           (QREFELT % 62))
                                                          (QREFELT % 44)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT % 6)
                                                        (|Union| (QREFELT % 6)
                                                                 #5="failed")
                                                        #1#)))
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F %) |an|
                                        (QREFELT % 61)))))))))
                           (SEQ
                            (LETT |v|
                                  (SPADCALL (|REAL0;transMultInv| |bd| F %)
                                            |bn| (QREFELT % 61)))
                            (EXIT
                             (COND
                              ((EQL |v| 0)
                               (SEQ
                                (LETT F
                                      (PROG2
                                          (LETT #1#
                                                (SPADCALL F
                                                          (SPADCALL
                                                           (SPADCALL |bd| 1
                                                                     (QREFELT %
                                                                              42))
                                                           (SPADCALL |bn| 0
                                                                     (QREFELT %
                                                                              42))
                                                           (QREFELT % 62))
                                                          (QREFELT % 44)))
                                          (QCDR #1#)
                                        (|check_union2| (QEQCAR #1# 0)
                                                        (QREFELT % 6)
                                                        (|Union| (QREFELT % 6)
                                                                 #5#)
                                                        #1#)))
                                (LETT |v|
                                      (SPADCALL (|REAL0;transMultInv| |bd| F %)
                                                |bn| (QREFELT % 61)))
                                (EXIT
                                 (LETT |u|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |ad| F %) |an|
                                        (QREFELT % 61)))))))))
                           (COND
                            ((> |u| 0)
                             (SEQ (LETT F (SPADCALL F (QREFELT % 49)))
                                  (EXIT (LETT |v| (- |v|))))))
                           (COND
                            ((< |v| 0)
                             (|error|
                              (LIST '|mathprint|
                                    (LIST 'CONCAT
                                          (|coerceRe2E| |int|
                                                        (ELT
                                                         (|Record|
                                                          (|:| |left|
                                                               (|Fraction|
                                                                (|Integer|)))
                                                          (|:| |right|
                                                               (|Fraction|
                                                                (|Integer|))))
                                                         0))
                                          (SPADCALL
                                           "is not a valid isolation interval for"
                                           (QREFELT % 65))
                                          (SPADCALL F (QREFELT % 66)))))))
                           (COND
                            ((SPADCALL |eps| (|spadConstant| % 41)
                                       (QREFELT % 67))
                             (|error| "precision must be positive")))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL (SPADCALL |b| |a| (QREFELT % 56))
                                             |eps| (QREFELT % 68)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |mid|
                                       (SPADCALL
                                        (SPADCALL |b| |a| (QREFELT % 13))
                                        (SPADCALL 1 2 (QREFELT % 12))
                                        (QREFELT % 14)))
                                 (LETT |midn| (SPADCALL |mid| (QREFELT % 60)))
                                 (LETT |midd| (SPADCALL |mid| (QREFELT % 59)))
                                 (LETT |v|
                                       (SPADCALL
                                        (|REAL0;transMultInv| |midd| F %)
                                        |midn| (QREFELT % 61)))
                                 (EXIT
                                  (COND
                                   ((< |v| 0)
                                    (SEQ (LETT |a| |mid|) (LETT |an| |midn|)
                                         (EXIT (LETT |ad| |midd|))))
                                   ((> |v| 0)
                                    (SEQ (LETT |b| |mid|) (LETT |bn| |midn|)
                                         (EXIT (LETT |bd| |midd|))))
                                   ((EQL |v| 0)
                                    (SEQ (LETT |a| |mid|) (LETT |b| |mid|)
                                         (LETT |an| |midn|) (LETT |ad| |midd|)
                                         (EXIT (LETT |xfl| 'T)))))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |a| |b|))))))))) 

(DECLAIM (NOTINLINE |RealZeroPackage;|)) 

(DEFUN |RealZeroPackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|RealZeroPackage| DV$1))
          (LETT % (GETREFV 69))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RealZeroPackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |RealZeroPackage| (#1=#:G173)
  (SPROG NIL
         (PROG (#2=#:G174)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|RealZeroPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|RealZeroPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RealZeroPackage|)))))))))) 

(MAKEPROP '|RealZeroPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Fraction| 11) (0 . -)
              (5 . |1|) (9 . |1|) (|Integer|) (13 . /) (19 . +) (25 . *)
              (|Record| (|:| |left| 7) (|:| |right| 7)) |REAL0;midpoint;RF;2|
              (|List| 7) (|List| 15) |REAL0;midpoints;LL;3| (|Factored| %)
              (31 . |squareFree|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 22) (|:| |factor| 6) (|:| |exponent| 38))
              (|List| 23) (|Factored| 6) (36 . |factorList|) (41 . *)
              |REAL0;realZeros;PolL;5| |REAL0;refine;PolRFR;20|
              |REAL0;realZeros;PolFL;6| (|Union| 15 '#1="failed")
              |REAL0;refine;Pol2RU;19| |REAL0;realZeros;PolRL;7|
              |REAL0;realZeros;PolRFL;8| (47 . |0|) (|Boolean|) (51 . =)
              (|NonNegativeInteger|) (57 . |degree|) (62 . |minimumDegree|)
              (67 . |0|) (71 . |monomial|) (|Union| % '"failed") (77 . |exquo|)
              (83 . |append|) (89 . *) (95 . +) (101 . |leadingCoefficient|)
              (106 . -) (111 . |reductum|) (116 . ~=) (|Vector| 11)
              (122 . |vectorise|) (128 . |min|) (134 . |max|) (140 . -)
              (146 . <) (152 . =) (158 . |denom|) (163 . |numer|) (168 . |elt|)
              (174 . -) (|OutputForm|) (|String|) (180 . |coerce|)
              (185 . |coerce|) (190 . <=) (196 . >=))
           '#(|refine| 202 |realZeros| 216 |midpoints| 240 |midpoint| 245) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1| (|Fraction| (|Integer|))))
                                T)
                              '((|realZeros|
                                 ((|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|refine|
                                 ((|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Fraction| (|Integer|))))
                                T)
                              '((|refine|
                                 ((|Union|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|))))
                                   #1#)
                                  |#1|
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|midpoint|
                                 ((|Fraction| (|Integer|))
                                  (|Record|
                                   (|:| |left| (|Fraction| (|Integer|)))
                                   (|:| |right| (|Fraction| (|Integer|))))))
                                T)
                              '((|midpoints|
                                 ((|List| (|Fraction| (|Integer|)))
                                  (|List|
                                   (|Record|
                                    (|:| |left| (|Fraction| (|Integer|)))
                                    (|:| |right| (|Fraction| (|Integer|)))))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 68
                                            '(1 7 0 0 8 0 6 0 9 0 7 0 10 2 7 0
                                              11 11 12 2 7 0 0 0 13 2 7 0 0 7
                                              14 1 6 20 0 21 1 25 24 0 26 2 6 0
                                              0 0 27 0 6 0 35 2 6 36 0 0 37 1 6
                                              38 0 39 1 6 38 0 40 0 7 0 41 2 6
                                              0 11 38 42 2 6 43 0 0 44 2 18 0 0
                                              0 45 2 7 0 11 0 46 2 6 0 0 0 47 1
                                              6 11 0 48 1 6 0 0 49 1 6 0 0 50 2
                                              6 36 0 0 51 2 6 52 0 38 53 2 7 0
                                              0 0 54 2 7 0 0 0 55 2 7 0 0 0 56
                                              2 7 36 0 0 57 2 7 36 0 0 58 1 7
                                              11 0 59 1 7 11 0 60 2 6 11 0 11
                                              61 2 6 0 0 0 62 1 64 63 0 65 1 6
                                              63 0 66 2 7 36 0 0 67 2 7 36 0 0
                                              68 3 0 15 6 15 7 29 3 0 31 6 15
                                              15 32 2 0 18 6 7 30 3 0 18 6 15 7
                                              34 1 0 18 6 28 2 0 18 6 15 33 1 0
                                              17 18 19 1 0 7 15 16)))))
           '|lookupComplete|)) 
