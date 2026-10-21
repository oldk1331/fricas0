
(SDEFUN |CARTEN;sample;%;1| ((% (%))) (SPADCALL (QREFELT % 13))) 

(SDEFUN |CARTEN;int2index|
        ((|n| (|Integer|)) (|indv| (|Vector| (|Integer|)))
         (% (|Vector| (|Integer|))))
        (SPROG
         ((|rnk| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G33 NIL)
          (|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND ((< |n| 0) (|error| "Index error (too small)"))
                (#2='T
                 (SEQ (LETT |rnk| (QVSIZE |indv|))
                      (SEQ (LETT |i| 1) (LETT #1# |rnk|) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ (LETT |qr| (|divide_INT| |n| (QREFELT % 7)))
                                (LETT |n| (QCAR |qr|))
                                (EXIT
                                 (SPADCALL |indv| (+ (- |rnk| |i|) 1)
                                           (+ (QCDR |qr|) (QREFELT % 6))
                                           (QREFELT % 17))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |n| 0 (QREFELT % 19))
                         (|error| "Index error (too big)"))
                        (#2# |indv|))))))))) 

(SDEFUN |CARTEN;index2int| ((|indv| (|Vector| (|Integer|))) (% (|Integer|)))
        (SPROG ((|i| NIL) (#1=#:G40 NIL) (|ix| (|Integer|)) (|n| (|Integer|)))
               (SEQ (LETT |n| 0)
                    (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |indv|)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (LETT |ix|
                                (- (SPADCALL |indv| |i| (QREFELT % 20))
                                   (QREFELT % 6)))
                          (COND
                           ((OR (< |ix| 0) (> |ix| (- (QREFELT % 7) 1)))
                            (EXIT (|error| "Index error (out of range)"))))
                          (EXIT (LETT |n| (+ (* (QREFELT % 7) |n|) |ix|))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |n|)))) 

(SDEFUN |CARTEN;lengthRankOrElse|
        ((|v| (|Integer|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|rx| (|NonNegativeInteger|)))
         (SEQ
          (COND ((EQL |v| 1) 0) ((EQL |v| (QREFELT % 7)) 1)
                ((EQL |v| (QREFELT % 10)) 2) ((EQL |v| (QREFELT % 11)) 3)
                ((EQL |v| (QREFELT % 12)) 4)
                ('T
                 (SEQ (LETT |rx| 0)
                      (SEQ G190
                           (COND
                            ((NULL (SPADCALL |v| 0 (QREFELT % 19))) (GO G191)))
                           (SEQ (LETT |qr| (|divide_INT| |v| (QREFELT % 7)))
                                (LETT |v| (QCAR |qr|))
                                (EXIT
                                 (COND
                                  ((SPADCALL |v| 0 (QREFELT % 19))
                                   (COND
                                    ((SPADCALL (QCDR |qr|) 0 (QREFELT % 19))
                                     (|error| "Rank is not a whole number"))
                                    ('T (LETT |rx| (+ |rx| 1))))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |rx|))))))) 

(SDEFUN |CARTEN;mkPerm|
        ((|n| (|NonNegativeInteger|)) (|l| (|List| (|Integer|)))
         (% (|Vector| (|Integer|))))
        (SPROG
         ((|p| (|Vector| (|Integer|))) (|seen| (|Vector| (|Boolean|)))
          (#1=#:G59 NIL) (|i| NIL) (#2=#:G58 NIL) (|e| NIL) (#3=#:G60 NIL)
          (#4=#:G57 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |l|) |n| (QREFELT % 22))
            (|error| "The list is not a permutation."))
           ('T
            (SEQ (LETT |p| (MAKEARR1 |n| 0)) (LETT |seen| (MAKEARR1 |n| NIL))
                 (SEQ (LETT |e| NIL) (LETT #1# |l|) (LETT |i| 1) (LETT #2# |n|)
                      G190
                      (COND
                       ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                            (PROGN (LETT |e| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (< |e| 1) (> |e| |n|))
                          (|error| "The list is not a permutation."))
                         ('T
                          (SEQ (SPADCALL |p| |i| |e| (QREFELT % 17))
                               (EXIT
                                (SPADCALL |seen| |e| 'T (QREFELT % 24))))))))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                      (GO G190) G191 (EXIT NIL))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |e| 1) (LETT #3# |n|) G190
                        (COND ((|greater_SI| |e| #3#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (SPADCALL |seen| |e| (QREFELT % 25)))
                            (PROGN
                             (LETT #4#
                                   (|error| "The list is not a permutation."))
                             (GO #5=#:G53))))))
                        (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #4#))
                 (EXIT |p|))))))) 

(SDEFUN |CARTEN;permute!|
        ((|t| (|Vector| (|Integer|))) (|s| (|Vector| (|Integer|)))
         (|p| (|Vector| (|Integer|))) (% (|Vector| (|Integer|))))
        (SPROG ((|i| NIL) (#1=#:G65 NIL))
               (SEQ
                (SEQ (LETT |i| 1) (LETT #1# (QVSIZE |p|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |t| |i|
                                 (SPADCALL |s|
                                           (SPADCALL |p| |i| (QREFELT % 20))
                                           (QREFELT % 20))
                                 (QREFELT % 17))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |t|)))) 

(SDEFUN |CARTEN;permsign!| ((|v| (|Vector| (|Integer|))) (% (|Integer|)))
        (SPROG
         ((|maxix| (|Integer|)) (#1=#:G67 NIL) (|psum| (|Integer|))
          (#2=#:G85 NIL) (|n| (|Integer|)) (|j| NIL) (#3=#:G87 NIL)
          (#4=#:G86 NIL) (|nTrans| (|Integer|)) (|e| (|Integer|))
          (|totTrans| (|Integer|)) (|i| NIL) (#5=#:G88 NIL) (#6=#:G84 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |maxix| (- (+ (QREFELT % 6) (QVSIZE |v|)) 1))
                (LETT |psum|
                      (PROG2
                          (LETT #1#
                                (|exquo_INT|
                                 (- (* (+ |maxix| 1) |maxix|)
                                    (* (QREFELT % 6) (- (QREFELT % 6) 1)))
                                 2))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                        (|Union| (|Integer|) "failed") #1#)))
                (LETT |n| 0)
                (SEQ (LETT |i| 1) (LETT #2# (QVSIZE |v|)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |n| (+ |n| (SPADCALL |v| |i| (QREFELT % 20))))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n| |psum| (QREFELT % 19)) 0)
                       (#7='T
                        (SEQ (LETT |totTrans| 0) (LETT |nTrans| 1)
                             (SEQ G190
                                  (COND
                                   ((NULL (SPADCALL |nTrans| 0 (QREFELT % 19)))
                                    (GO G191)))
                                  (SEQ (LETT |nTrans| 0)
                                       (SEQ (LETT |j| 2)
                                            (LETT #3# (QVSIZE |v|))
                                            (LETT |i| 1)
                                            (LETT #4# (- (QVSIZE |v|) 1)) G190
                                            (COND
                                             ((OR (|greater_SI| |i| #4#)
                                                  (|greater_SI| |j| #3#))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((>
                                                 (SPADCALL |v| |i|
                                                           (QREFELT % 20))
                                                 (SPADCALL |v| |j|
                                                           (QREFELT % 20)))
                                                (SEQ
                                                 (LETT |nTrans| (+ |nTrans| 1))
                                                 (LETT |e|
                                                       (SPADCALL |v| |i|
                                                                 (QREFELT %
                                                                          20)))
                                                 (SPADCALL |v| |i|
                                                           (SPADCALL |v| |j|
                                                                     (QREFELT %
                                                                              20))
                                                           (QREFELT % 17))
                                                 (EXIT
                                                  (SPADCALL |v| |j| |e|
                                                            (QREFELT %
                                                                     17))))))))
                                            (LETT |i|
                                                  (PROG1 (|inc_SI| |i|)
                                                    (LETT |j| (|inc_SI| |j|))))
                                            (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (LETT |totTrans|
                                              (+ |totTrans| |nTrans|))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| 1) (LETT #5# (QREFELT % 7)) G190
                                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |v| |i| (QREFELT % 20))
                                       (- (+ (QREFELT % 6) |i|) 1)
                                       (QREFELT % 19))
                                      (PROGN (LETT #6# 0) (GO #8=#:G83))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT (COND ((ODDP |totTrans|) -1) (#7# 1)))))))))
          #8# (EXIT #6#)))) 

(SDEFUN |CARTEN;ravel;%L;8| ((|x| (%)) (% (|List| R)))
        (SPROG ((#1=#:G92 NIL) (|i| NIL) (#2=#:G93 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0)
                      (LETT #2# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |x| |i| (QREFELT % 27)) #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |CARTEN;unravel;L%;9| ((|l| (|List| R)) (% (%)))
        (SPROG
         ((|nz| (|NonNegativeInteger|)) (|z| (%)) (|r| NIL) (#1=#:G99 NIL)
          (|i| NIL) (#2=#:G98 NIL))
         (SEQ (LETT |nz| (LENGTH |l|)) (|CARTEN;lengthRankOrElse| |nz| %)
              (LETT |z| (SPADCALL |nz| (|spadConstant| % 30) (QREFELT % 31)))
              (SEQ (LETT |r| NIL) (LETT #1# |l|) (LETT |i| 0)
                   (LETT #2# (- |nz| 1)) G190
                   (COND
                    ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                         (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT % 32))))
                   (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;kroneckerDelta;%;10| ((% (%)))
        (SPROG ((|z| (%)) (|zi| NIL) (#1=#:G105 NIL) (|i| NIL) (#2=#:G104 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT % 10) (|spadConstant| % 30)
                                (QREFELT % 31)))
                (SEQ (LETT |zi| 0) (LETT #1# (+ (QREFELT % 7) 1)) (LETT |i| 1)
                     (LETT #2# (QREFELT % 7)) G190
                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |zi| (|spadConstant| % 34)
                                 (QREFELT % 32))))
                     (LETT |i|
                           (PROG1 (|inc_SI| |i|)
                             (LETT |zi| (|add_SI| |zi| #1#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;leviCivitaSymbol;%;11| ((% (%)))
        (SPROG
         ((|nz| (|NonNegativeInteger|)) (|z| (%))
          (|indv| (|Vector| (|Integer|))) (|i| NIL) (#1=#:G110 NIL))
         (SEQ (LETT |nz| (EXPT (QREFELT % 7) (QREFELT % 7)))
              (LETT |z| (SPADCALL |nz| (|spadConstant| % 30) (QREFELT % 31)))
              (LETT |indv| (MAKEARR1 (QREFELT % 7) 0))
              (SEQ (LETT |i| 0) (LETT #1# (- |nz| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |z| |i|
                               (SPADCALL
                                (|CARTEN;permsign!|
                                 (|CARTEN;int2index| |i| |indv| %) %)
                                (QREFELT % 35))
                               (QREFELT % 32))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;degree;%Nni;12| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 37))) 

(SDEFUN |CARTEN;rank;%Nni;13| ((|x| (%)) (% (|NonNegativeInteger|)))
        (|CARTEN;lengthRankOrElse| (SPADCALL |x| (QREFELT % 26)) %)) 

(SDEFUN |CARTEN;elt;%R;14| ((|x| (%)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 26)) 1 (QREFELT % 22))
          (|error| "Index error (the rank is not 0)"))
         ('T (SPADCALL |x| 0 (QREFELT % 27))))) 

(SDEFUN |CARTEN;elt;%IR;15| ((|x| (%)) (|i| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 7) (QREFELT % 22))
          (|error| "Index error (the rank is not 1)"))
         ('T (SPADCALL |x| (- |i| (QREFELT % 6)) (QREFELT % 27))))) 

(SDEFUN |CARTEN;elt;%2IR;16|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 10)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 2)"))
         ('T
          (SPADCALL |x|
                    (+ (* (QREFELT % 7) (- |i| (QREFELT % 6)))
                       (- |j| (QREFELT % 6)))
                    (QREFELT % 27))))) 

(SDEFUN |CARTEN;elt;%3IR;17|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 11)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 3)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+ (* (QREFELT % 10) (- |i| (QREFELT % 6)))
                        (* (QREFELT % 7) (- |j| (QREFELT % 6))))
                     (- |k| (QREFELT % 6)))
                    (QREFELT % 27))))) 

(SDEFUN |CARTEN;elt;%4IR;18|
        ((|x| (%)) (|i| (|Integer|)) (|j| (|Integer|)) (|k| (|Integer|))
         (|l| (|Integer|)) (% (R)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 12)
                    (QREFELT % 22))
          (|error| "Index error (the rank is not 4)"))
         ('T
          (SPADCALL |x|
                    (+
                     (+
                      (+ (* (QREFELT % 11) (- |i| (QREFELT % 6)))
                         (* (QREFELT % 10) (- |j| (QREFELT % 6))))
                      (* (QREFELT % 7) (- |k| (QREFELT % 6))))
                     (- |l| (QREFELT % 6)))
                    (QREFELT % 27))))) 

(SDEFUN |CARTEN;elt;%LR;19| ((|x| (%)) (|i| (|List| (|Integer|))) (% (R)))
        (SPROG
         ((|ii| NIL) (#1=#:G130 NIL) (|ix| (|Integer|)) (|n| (|Integer|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |i|) (SPADCALL |x| (QREFELT % 37))
                      (QREFELT % 22))
            (|error| "Index error (wrong rank)"))
           ('T
            (SEQ (LETT |n| 0)
                 (SEQ (LETT |ii| NIL) (LETT #1# |i|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |ii| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |ix| (- |ii| (QREFELT % 6)))
                           (COND
                            ((OR (< |ix| 0) (> |ix| (- (QREFELT % 7) 1)))
                             (EXIT (|error| "Index error (out of range)"))))
                           (EXIT (LETT |n| (+ (* (QREFELT % 7) |n|) |ix|))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL |x| |n| (QREFELT % 27))))))))) 

(SDEFUN |CARTEN;coerce;L%;20| ((|lr| (|List| R)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G137 NIL) (|r| NIL) (#2=#:G136 NIL))
               (SEQ
                (COND
                 ((SPADCALL (LENGTH |lr|) (QREFELT % 7) (QREFELT % 22))
                  (|error| "Incorrect number of components"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (QREFELT % 7) (|spadConstant| % 30)
                                   (QREFELT % 31)))
                   (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 7) 1))
                        (LETT |r| NIL) (LETT #2# |lr|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL)
                              (|greater_SI| |i| #1#))
                          (GO G191)))
                        (SEQ (EXIT (SPADCALL |z| |i| |r| (QREFELT % 32))))
                        (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                        (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;coerce;L%;21| ((|lx| (|List| %)) (% (%)))
        (SPROG
         ((|rx| (|NonNegativeInteger|)) (#1=#:G149 NIL) (#2=#:G148 NIL)
          (|nx| (|NonNegativeInteger|)) (|z| (%)) (|offz| NIL) (#3=#:G151 NIL)
          (|x| NIL) (#4=#:G150 NIL) (|i| NIL) (#5=#:G152 NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |lx| (QREFELT % 48)) (QREFELT % 7)
                      (QREFELT % 22))
            (|error| "Incorrect number of slices"))
           ('T
            (SEQ
             (LETT |rx|
                   (SPADCALL (SPADCALL |lx| (QREFELT % 49)) (QREFELT % 37)))
             (SEQ
              (EXIT
               (SEQ (LETT |x| NIL) (LETT #1# |lx|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((SPADCALL (SPADCALL |x| (QREFELT % 37)) |rx|
                                  (QREFELT % 22))
                        (PROGN
                         (LETT #2# (|error| "Inhomogeneous slice ranks"))
                         (GO #6=#:G140))))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
              #6# (EXIT #2#))
             (LETT |nx|
                   (SPADCALL (SPADCALL |lx| (QREFELT % 49)) (QREFELT % 26)))
             (LETT |z|
                   (SPADCALL (* (QREFELT % 7) |nx|) (|spadConstant| % 30)
                             (QREFELT % 31)))
             (SEQ (LETT |offz| 0) (LETT #3# |nx|) (LETT |x| NIL)
                  (LETT #4# |lx|) G190
                  (COND
                   ((OR (ATOM #4#) (PROGN (LETT |x| (CAR #4#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |i| 0) (LETT #5# (- |nx| 1)) G190
                         (COND ((|greater_SI| |i| #5#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |z| (+ |offz| |i|)
                                     (SPADCALL |x| |i| (QREFELT % 27))
                                     (QREFELT % 32))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
                  (LETT #4#
                        (PROG1 (CDR #4#) (LETT |offz| (|add_SI| |offz| #3#))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT |z|))))))) 

(SDEFUN |CARTEN;retractIfCan;%U;22| ((|x| (%)) (% (|Union| R "failed")))
        (COND
         ((ZEROP (SPADCALL |x| (QREFELT % 37)))
          (CONS 0 (SPADCALL |x| (QREFELT % 39))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |CARTEN;mkOutf|
        ((|x| (%)) (|i0| (|Integer|)) (|rnk| (|NonNegativeInteger|))
         (% (|OutputForm|)))
        (SPROG
         ((#1=#:G172 NIL) (#2=#:G173 NIL) (|rnk1| (|NonNegativeInteger|))
          (|nskip| (|NonNegativeInteger|)) (#3=#:G174 NIL) (|i| NIL)
          (#4=#:G175 NIL) (#5=#:G176 NIL) (|j| NIL) (#6=#:G177 NIL))
         (SEQ
          (COND
           ((ODDP |rnk|)
            (SEQ (LETT |rnk1| (- |rnk| 1))
                 (LETT |nskip| (EXPT (QREFELT % 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| 0) (LETT #2# (- (QREFELT % 7) 1)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS
                                  (|CARTEN;mkOutf| |x| (+ |i0| (* |nskip| |i|))
                                   |rnk1| %)
                                  #1#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))
                   (QREFELT % 56)))))
           ((EQL |rnk| 0)
            (SPADCALL (SPADCALL |x| |i0| (QREFELT % 27)) (QREFELT % 57)))
           ('T
            (SEQ (LETT |rnk1| (- |rnk| 2))
                 (LETT |nskip| (EXPT (QREFELT % 7) |rnk1|))
                 (EXIT
                  (SPADCALL
                   (PROGN
                    (LETT #3# NIL)
                    (SEQ (LETT |i| 0) (LETT #4# (- (QREFELT % 7) 1)) G190
                         (COND ((|greater_SI| |i| #4#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #3#
                                 (CONS
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |j| 0)
                                        (LETT #6# (- (QREFELT % 7) 1)) G190
                                        (COND
                                         ((|greater_SI| |j| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (|CARTEN;mkOutf| |x|
                                                  (+ |i0|
                                                     (* |nskip|
                                                        (+
                                                         (* (QREFELT % 7) |i|)
                                                         |j|)))
                                                  |rnk1| %)
                                                 #5#))))
                                        (LETT |j| (|inc_SI| |j|)) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))
                                  #3#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #3#))))
                   (QREFELT % 59))))))))) 

(SDEFUN |CARTEN;coerce;%Of;24| ((|x| (%)) (% (|OutputForm|)))
        (|CARTEN;mkOutf| |x| 0 (SPADCALL |x| (QREFELT % 37)) %)) 

(SDEFUN |CARTEN;0;%;25| ((% (%)))
        (SPADCALL (|spadConstant| % 30) (QREFELT % 61))) 

(SDEFUN |CARTEN;1;%;26| ((% (%)))
        (SPADCALL (|spadConstant| % 34) (QREFELT % 61))) 

(SDEFUN |CARTEN;coerce;R%;27| ((|r| (R)) (% (%)))
        (SPADCALL 1 |r| (QREFELT % 31))) 

(SDEFUN |CARTEN;coerce;Dp%;28| ((|v| (|DirectProduct| |dim| R)) (% (%)))
        (SPROG ((|z| (%)) (|j| NIL) (#1=#:G187 NIL) (|i| NIL) (#2=#:G186 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (QREFELT % 7) (|spadConstant| % 30)
                                (QREFELT % 31)))
                (SEQ (LETT |j| (SPADCALL |v| (QREFELT % 65)))
                     (LETT #1# (SPADCALL |v| (QREFELT % 66))) (LETT |i| 0)
                     (LETT #2# (- (QREFELT % 7) 1)) G190
                     (COND ((OR (|greater_SI| |i| #2#) (> |j| #1#)) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i| (SPADCALL |v| |j| (QREFELT % 67))
                                 (QREFELT % 32))))
                     (LETT |i| (PROG1 (|inc_SI| |i|) (LETT |j| (+ |j| 1))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;coerce;Sm%;29| ((|m| (|SquareMatrix| |dim| R)) (% (%)))
        (SPROG
         ((|z| (%)) (|i| NIL) (#1=#:G195 NIL) (|j| NIL) (#2=#:G196 NIL)
          (|offz| (|NonNegativeInteger|)))
         (SEQ
          (LETT |z|
                (SPADCALL (EXPT (QREFELT % 7) 2) (|spadConstant| % 30)
                          (QREFELT % 31)))
          (LETT |offz| 0)
          (SEQ (LETT |i| 0) (LETT #1# (- (QREFELT % 7) 1)) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (SEQ (LETT |j| 0) (LETT #2# (- (QREFELT % 7) 1)) G190
                     (COND ((|greater_SI| |j| #2#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| (+ |offz| |j|)
                                 (SPADCALL |m| (+ |i| 1) (+ |j| 1)
                                           (QREFELT % 70))
                                 (QREFELT % 32))))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                (EXIT (LETT |offz| (+ |offz| (QREFELT % 7)))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (EXIT |z|)))) 

(SDEFUN |CARTEN;=;2%B;30| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G204 NIL) (#2=#:G203 NIL))
               (SEQ
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |x| (QREFELT % 26))
                             (SPADCALL |y| (QREFELT % 26)) (QREFELT % 22))
                   NIL)
                  ('T
                   (SEQ
                    (SEQ (LETT |i| 0)
                         (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |x| |i| (QREFELT % 27))
                                       (SPADCALL |y| |i| (QREFELT % 27))
                                       (QREFELT % 72))
                             (PROGN (LETT #2# NIL) (GO #3=#:G202))))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT 'T)))))
                #3# (EXIT #2#)))) 

(SDEFUN |CARTEN;+;3%;31| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G210 NIL))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 26))
                            (SPADCALL |y| (QREFELT % 26)) (QREFELT % 22))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                   (|spadConstant| % 30) (QREFELT % 31)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT % 27))
                                              (SPADCALL |y| |i| (QREFELT % 27))
                                              (QREFELT % 74))
                                    (QREFELT % 32))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;3%;32| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G216 NIL))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |x| (QREFELT % 26))
                            (SPADCALL |y| (QREFELT % 26)) (QREFELT % 22))
                  (|error| "Rank mismatch"))
                 ('T
                  (SEQ
                   (LETT |z|
                         (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                   (|spadConstant| % 30) (QREFELT % 31)))
                   (SEQ (LETT |i| 0)
                        (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SPADCALL |z| |i|
                                    (SPADCALL (SPADCALL |x| |i| (QREFELT % 27))
                                              (SPADCALL |y| |i| (QREFELT % 27))
                                              (QREFELT % 76))
                                    (QREFELT % 32))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   (EXIT |z|))))))) 

(SDEFUN |CARTEN;-;2%;33| ((|x| (%)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G221 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                (|spadConstant| % 30) (QREFELT % 31)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL (SPADCALL |x| |i| (QREFELT % 27))
                                           (QREFELT % 78))
                                 (QREFELT % 32))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;I2%;34| ((|n| (|Integer|)) (|x| (%)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G226 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                (|spadConstant| % 30) (QREFELT % 31)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT % 27))
                                           (QREFELT % 80))
                                 (QREFELT % 32))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;%I%;35| ((|x| (%)) (|n| (|Integer|)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G231 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                (|spadConstant| % 30) (QREFELT % 31)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |n|
                                           (SPADCALL |x| |i| (QREFELT % 27))
                                           (QREFELT % 80))
                                 (QREFELT % 32))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;R2%;36| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G236 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                (|spadConstant| % 30) (QREFELT % 31)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT % 27))
                                           (QREFELT % 83))
                                 (QREFELT % 32))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;*;%R%;37| ((|x| (%)) (|r| (R)) (% (%)))
        (SPROG ((|z| (%)) (|i| NIL) (#1=#:G241 NIL))
               (SEQ
                (LETT |z|
                      (SPADCALL (SPADCALL |x| (QREFELT % 26))
                                (|spadConstant| % 30) (QREFELT % 31)))
                (SEQ (LETT |i| 0)
                     (LETT #1# (- (SPADCALL |x| (QREFELT % 26)) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |z| |i|
                                 (SPADCALL |r|
                                           (SPADCALL |x| |i| (QREFELT % 27))
                                           (QREFELT % 83))
                                 (QREFELT % 32))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |z|)))) 

(SDEFUN |CARTEN;product;3%;38| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG
         ((|nx| #1=(|NonNegativeInteger|)) (|ny| #1#) (|z| (%)) (|ioff| NIL)
          (#2=#:G249 NIL) (|i| NIL) (#3=#:G248 NIL) (|j| NIL) (#4=#:G250 NIL))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT % 26)))
              (LETT |ny| (SPADCALL |y| (QREFELT % 26)))
              (LETT |z|
                    (SPADCALL (* |nx| |ny|) (|spadConstant| % 30)
                              (QREFELT % 31)))
              (SEQ (LETT |ioff| 0) (LETT #2# |ny|) (LETT |i| 0)
                   (LETT #3# (- |nx| 1)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| 0) (LETT #4# (- |ny| 1)) G190
                          (COND ((|greater_SI| |j| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |z| (+ |ioff| |j|)
                                      (SPADCALL
                                       (SPADCALL |x| |i| (QREFELT % 27))
                                       (SPADCALL |y| |j| (QREFELT % 27))
                                       (QREFELT % 83))
                                      (QREFELT % 32))))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i|
                         (PROG1 (|inc_SI| |i|)
                           (LETT |ioff| (|add_SI| |ioff| #2#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;*;3%;39| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((|rx| #1=(|NonNegativeInteger|)) (|ry| #1#))
               (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 37)))
                    (LETT |ry| (SPADCALL |y| (QREFELT % 37)))
                    (EXIT
                     (COND
                      ((EQL |rx| 0)
                       (SPADCALL (SPADCALL |x| 0 (QREFELT % 27)) |y|
                                 (QREFELT % 84)))
                      ((EQL |ry| 0)
                       (SPADCALL |x| (SPADCALL |y| 0 (QREFELT % 27))
                                 (QREFELT % 85)))
                      ('T (SPADCALL |x| |rx| |y| 1 (QREFELT % 87)))))))) 

(SDEFUN |CARTEN;contract;%2I%;40|
        ((|x| (%)) (|i| #1=(|Integer|)) (|j| #2=(|Integer|)) (% (%)))
        (SPROG
         ((|rx| (|NonNegativeInteger|)) (|#G110| #2#) (|#G111| #1#)
          (|rl| (|NonNegativeInteger|)) (|nl| #3=(|NonNegativeInteger|))
          (|zol| #4=(|PositiveInteger|)) (|xol| #4#)
          (|rm| (|NonNegativeInteger|)) (|nm| #3#) (|zom| #3#)
          (|xom| #5=(|NonNegativeInteger|)) (|rh| (|NonNegativeInteger|))
          (|nh| #3#) (|zoh| #5#) (|xoh| #5#) (|xok| #5#) (|z| (%)) (|zh| NIL)
          (#6=#:G266 NIL) (|xh| NIL) (#7=#:G265 NIL) (|h| NIL) (#8=#:G264 NIL)
          (|zm| NIL) (#9=#:G269 NIL) (|xm| NIL) (#10=#:G268 NIL) (|m| NIL)
          (#11=#:G267 NIL) (|zl| NIL) (#12=#:G272 NIL) (|xl| NIL)
          (#13=#:G271 NIL) (|l| NIL) (#14=#:G270 NIL) (|xk| NIL)
          (#15=#:G274 NIL) (|k| NIL) (#16=#:G273 NIL))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 37)))
              (COND
               ((OR
                 (OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |rx|))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper index for contraction"))))
              (COND
               ((> |i| |j|)
                (PROGN
                 (LETT |#G110| |j|)
                 (LETT |#G111| |i|)
                 (LETT |i| |#G110|)
                 (LETT |j| |#G111|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT % 7) |rl|))
              (LETT |zol| 1) (LETT |xol| |zol|) (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT % 7) |rm|)) (LETT |zom| |nl|)
              (LETT |xom| (* |zom| (QREFELT % 7))) (LETT |rh| (- |i| 1))
              (LETT |nh| (EXPT (QREFELT % 7) |rh|)) (LETT |zoh| (* |nl| |nm|))
              (LETT |xoh| (* |zoh| (EXPT (QREFELT % 7) 2)))
              (LETT |xok| (* |nl| (+ 1 (* |nm| (QREFELT % 7)))))
              (LETT |z|
                    (SPADCALL (* (* |nl| |nm|) |nh|) (|spadConstant| % 30)
                              (QREFELT % 31)))
              (SEQ (LETT |zh| 0) (LETT #6# |zoh|) (LETT |xh| 0)
                   (LETT #7# |xoh|) (LETT |h| 1) (LETT #8# |nh|) G190
                   (COND ((|greater_SI| |h| #8#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zm| |zh|) (LETT #9# |zom|) (LETT |xm| |xh|)
                          (LETT #10# |xom|) (LETT |m| 1) (LETT #11# |nm|) G190
                          (COND ((|greater_SI| |m| #11#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zl| |zm|) (LETT #12# |zol|)
                                 (LETT |xl| |xm|) (LETT #13# |xol|)
                                 (LETT |l| 1) (LETT #14# |nl|) G190
                                 (COND ((|greater_SI| |l| #14#) (GO G191)))
                                 (SEQ
                                  (SPADCALL |z| |zl| (|spadConstant| % 30)
                                            (QREFELT % 32))
                                  (EXIT
                                   (SEQ (LETT |xk| |xl|) (LETT #15# |xok|)
                                        (LETT |k| 1) (LETT #16# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |k| #16#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |z| |zl|
                                                    (SPADCALL
                                                     (SPADCALL |z| |zl|
                                                               (QREFELT % 27))
                                                     (SPADCALL |x| |xk|
                                                               (QREFELT % 27))
                                                     (QREFELT % 74))
                                                    (QREFELT % 32))))
                                        (LETT |k|
                                              (PROG1 (|inc_SI| |k|)
                                                (LETT |xk| (+ |xk| #15#))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |l|
                                       (PROG1 (|inc_SI| |l|)
                                         (LETT |xl|
                                               (PROG1 (+ |xl| #13#)
                                                 (LETT |zl| (+ |zl| #12#))))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |m|
                                (PROG1 (|inc_SI| |m|)
                                  (LETT |xm|
                                        (PROG1 (+ |xm| #10#)
                                          (LETT |zm| (+ |zm| #9#))))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |h|
                         (PROG1 (|inc_SI| |h|)
                           (LETT |xh|
                                 (PROG1 (|add_SI| |xh| #7#)
                                   (LETT |zh| (|add_SI| |zh| #6#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;contract;%I%I%;41|
        ((|x| (%)) (|i| (|Integer|)) (|y| (%)) (|j| (|Integer|)) (% (%)))
        (SPROG
         ((|rx| #1=(|NonNegativeInteger|)) (|ry| #1#)
          (|rly| (|NonNegativeInteger|)) (|nly| #2=(|NonNegativeInteger|))
          (|oly| #3=(|PositiveInteger|)) (|zoly| #3#)
          (|rhy| (|NonNegativeInteger|)) (|nhy| #2#)
          (|ohy| #4=(|NonNegativeInteger|)) (|zohy| (|NonNegativeInteger|))
          (|rlx| (|NonNegativeInteger|)) (|nlx| #2#) (|olx| #3#) (|zolx| #4#)
          (|rhx| (|NonNegativeInteger|)) (|nhx| #2#) (|ohx| #4#) (|zohx| #4#)
          (|z| (%)) (|zhx| NIL) (#5=#:G290 NIL) (|xh| NIL) (#6=#:G289 NIL)
          (|dxh| NIL) (#7=#:G288 NIL) (|zlx| NIL) (#8=#:G293 NIL) (|xl| NIL)
          (#9=#:G292 NIL) (|dxl| NIL) (#10=#:G291 NIL) (|zhy| NIL)
          (#11=#:G296 NIL) (|yh| NIL) (#12=#:G295 NIL) (|dyh| NIL)
          (#13=#:G294 NIL) (|zly| NIL) (#14=#:G299 NIL) (|yl| NIL)
          (#15=#:G298 NIL) (|dyl| NIL) (#16=#:G297 NIL) (|yk| NIL)
          (#17=#:G302 NIL) (|xk| NIL) (#18=#:G301 NIL) (|k| NIL)
          (#19=#:G300 NIL))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 37)))
              (LETT |ry| (SPADCALL |y| (QREFELT % 37)))
              (COND
               ((OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |ry|))
                (EXIT (|error| "Improper index for contraction"))))
              (LETT |rly| (- |ry| |j|)) (LETT |nly| (EXPT (QREFELT % 7) |rly|))
              (LETT |oly| 1) (LETT |zoly| 1) (LETT |rhy| (- |j| 1))
              (LETT |nhy| (EXPT (QREFELT % 7) |rhy|))
              (LETT |ohy| (* |nly| (QREFELT % 7)))
              (LETT |zohy| (* |zoly| |nly|)) (LETT |rlx| (- |rx| |i|))
              (LETT |nlx| (EXPT (QREFELT % 7) |rlx|)) (LETT |olx| 1)
              (LETT |zolx| (* |zohy| |nhy|)) (LETT |rhx| (- |i| 1))
              (LETT |nhx| (EXPT (QREFELT % 7) |rhx|))
              (LETT |ohx| (* |nlx| (QREFELT % 7)))
              (LETT |zohx| (* |zolx| |nlx|))
              (LETT |z|
                    (SPADCALL (* (* (* |nlx| |nhx|) |nly|) |nhy|)
                              (|spadConstant| % 30) (QREFELT % 31)))
              (SEQ (LETT |zhx| 0) (LETT #5# |zohx|) (LETT |xh| 0)
                   (LETT #6# |ohx|) (LETT |dxh| 1) (LETT #7# |nhx|) G190
                   (COND ((|greater_SI| |dxh| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zlx| |zhx|) (LETT #8# |zolx|) (LETT |xl| |xh|)
                          (LETT #9# |olx|) (LETT |dxl| 1) (LETT #10# |nlx|)
                          G190 (COND ((|greater_SI| |dxl| #10#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zhy| |zlx|) (LETT #11# |zohy|)
                                 (LETT |yh| 0) (LETT #12# |ohy|) (LETT |dyh| 1)
                                 (LETT #13# |nhy|) G190
                                 (COND ((|greater_SI| |dyh| #13#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |zly| |zhy|) (LETT #14# |zoly|)
                                        (LETT |yl| |yh|) (LETT #15# |oly|)
                                        (LETT |dyl| 1) (LETT #16# |nly|) G190
                                        (COND
                                         ((|greater_SI| |dyl| #16#) (GO G191)))
                                        (SEQ
                                         (SPADCALL |z| |zly|
                                                   (|spadConstant| % 30)
                                                   (QREFELT % 32))
                                         (EXIT
                                          (SEQ (LETT |yk| |yl|)
                                               (LETT #17# |nly|)
                                               (LETT |xk| |xl|)
                                               (LETT #18# |nlx|) (LETT |k| 1)
                                               (LETT #19# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |k| #19#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zly|
                                                           (SPADCALL
                                                            (SPADCALL |z| |zly|
                                                                      (QREFELT
                                                                       % 27))
                                                            (SPADCALL
                                                             (SPADCALL |x| |xk|
                                                                       (QREFELT
                                                                        % 27))
                                                             (SPADCALL |y| |yk|
                                                                       (QREFELT
                                                                        % 27))
                                                             (QREFELT % 83))
                                                            (QREFELT % 74))
                                                           (QREFELT % 32))))
                                               (LETT |k|
                                                     (PROG1 (|inc_SI| |k|)
                                                       (LETT |xk|
                                                             (PROG1
                                                                 (+ |xk| #18#)
                                                               (LETT |yk|
                                                                     (+ |yk|
                                                                        #17#))))))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |dyl|
                                              (PROG1 (|inc_SI| |dyl|)
                                                (LETT |yl|
                                                      (PROG1 (+ |yl| #15#)
                                                        (LETT |zly|
                                                              (+ |zly|
                                                                 #14#))))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |dyh|
                                       (PROG1 (|inc_SI| |dyh|)
                                         (LETT |yh|
                                               (PROG1 (|add_SI| |yh| #12#)
                                                 (LETT |zhy|
                                                       (+ |zhy| #11#))))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |dxl|
                                (PROG1 (|inc_SI| |dxl|)
                                  (LETT |xl|
                                        (PROG1 (+ |xl| #9#)
                                          (LETT |zlx| (+ |zlx| #8#))))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |dxh|
                         (PROG1 (|inc_SI| |dxh|)
                           (LETT |xh|
                                 (PROG1 (|add_SI| |xh| #6#)
                                   (LETT |zhx| (|add_SI| |zhx| #5#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;transpose;2%;42| ((|x| (%)) (% (%)))
        (SPADCALL |x| 1 (SPADCALL |x| (QREFELT % 37)) (QREFELT % 90))) 

(SDEFUN |CARTEN;transpose;%2I%;43|
        ((|x| (%)) (|i| #1=(|Integer|)) (|j| #2=(|Integer|)) (% (%)))
        (SPROG
         ((|rx| (|NonNegativeInteger|)) (|#G146| #2#) (|#G147| #1#)
          (|rl| (|NonNegativeInteger|)) (|nl| #3=(|NonNegativeInteger|))
          (|zol| (|PositiveInteger|)) (|zoi| (|NonNegativeInteger|))
          (|rm| (|NonNegativeInteger|)) (|nm| #3#)
          (|zom| #4=(|NonNegativeInteger|)) (|zoj| #4#)
          (|rh| (|NonNegativeInteger|)) (|nh| #3#) (|zoh| #4#) (|z| (%))
          (|zh| NIL) (#5=#:G317 NIL) (|h| NIL) (#6=#:G316 NIL) (|zm| NIL)
          (#7=#:G319 NIL) (|m| NIL) (#8=#:G318 NIL) (|zl| NIL) (#9=#:G321 NIL)
          (|l| NIL) (#10=#:G320 NIL) (|xp| NIL) (#11=#:G324 NIL) (|zp| NIL)
          (#12=#:G323 NIL) (|p| NIL) (#13=#:G322 NIL) (|xq| NIL)
          (#14=#:G327 NIL) (|zq| NIL) (#15=#:G326 NIL) (|q| NIL)
          (#16=#:G325 NIL))
         (SEQ (LETT |rx| (SPADCALL |x| (QREFELT % 37)))
              (COND
               ((OR
                 (OR (OR (OR (< |i| 1) (> |i| |rx|)) (< |j| 1)) (> |j| |rx|))
                 (EQL |i| |j|))
                (EXIT (|error| "Improper indices for transposition"))))
              (COND
               ((> |i| |j|)
                (PROGN
                 (LETT |#G146| |j|)
                 (LETT |#G147| |i|)
                 (LETT |i| |#G146|)
                 (LETT |j| |#G147|))))
              (LETT |rl| (- |rx| |j|)) (LETT |nl| (EXPT (QREFELT % 7) |rl|))
              (LETT |zol| 1) (LETT |zoi| (* |zol| |nl|))
              (LETT |rm| (- (- |j| |i|) 1))
              (LETT |nm| (EXPT (QREFELT % 7) |rm|))
              (LETT |zom| (* |nl| (QREFELT % 7))) (LETT |zoj| (* |zom| |nm|))
              (LETT |rh| (- |i| 1)) (LETT |nh| (EXPT (QREFELT % 7) |rh|))
              (LETT |zoh| (* (* |nl| |nm|) (EXPT (QREFELT % 7) 2)))
              (LETT |z|
                    (SPADCALL (SPADCALL |x| (QREFELT % 26))
                              (|spadConstant| % 30) (QREFELT % 31)))
              (SEQ (LETT |zh| 0) (LETT #5# |zoh|) (LETT |h| 1) (LETT #6# |nh|)
                   G190 (COND ((|greater_SI| |h| #6#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |zm| |zh|) (LETT #7# |zom|) (LETT |m| 1)
                          (LETT #8# |nm|) G190
                          (COND ((|greater_SI| |m| #8#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |zl| |zm|) (LETT #9# |zol|) (LETT |l| 1)
                                 (LETT #10# |nl|) G190
                                 (COND ((|greater_SI| |l| #10#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |xp| |zl|) (LETT #11# |zoj|)
                                        (LETT |zp| |zl|) (LETT #12# |zoi|)
                                        (LETT |p| 1) (LETT #13# (QREFELT % 7))
                                        G190
                                        (COND
                                         ((|greater_SI| |p| #13#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ (LETT |xq| |xp|)
                                               (LETT #14# |zoi|)
                                               (LETT |zq| |zp|)
                                               (LETT #15# |zoj|) (LETT |q| 1)
                                               (LETT #16# (QREFELT % 7)) G190
                                               (COND
                                                ((|greater_SI| |q| #16#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (SPADCALL |z| |zq|
                                                           (SPADCALL |x| |xq|
                                                                     (QREFELT %
                                                                              27))
                                                           (QREFELT % 32))))
                                               (LETT |q|
                                                     (PROG1 (|inc_SI| |q|)
                                                       (LETT |zq|
                                                             (PROG1
                                                                 (+ |zq| #15#)
                                                               (LETT |xq|
                                                                     (+ |xq|
                                                                        #14#))))))
                                               (GO G190) G191 (EXIT NIL))))
                                        (LETT |p|
                                              (PROG1 (|inc_SI| |p|)
                                                (LETT |zp|
                                                      (PROG1 (+ |zp| #12#)
                                                        (LETT |xp|
                                                              (+ |xp|
                                                                 #11#))))))
                                        (GO G190) G191 (EXIT NIL))))
                                 (LETT |l|
                                       (PROG1 (|inc_SI| |l|)
                                         (LETT |zl| (+ |zl| #9#))))
                                 (GO G190) G191 (EXIT NIL))))
                          (LETT |m|
                                (PROG1 (|inc_SI| |m|)
                                  (LETT |zm| (+ |zm| #7#))))
                          (GO G190) G191 (EXIT NIL))))
                   (LETT |h|
                         (PROG1 (|inc_SI| |h|)
                           (LETT |zh| (|add_SI| |zh| #5#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(SDEFUN |CARTEN;reindex;%L%;44| ((|x| (%)) (|l| (|List| (|Integer|))) (% (%)))
        (SPROG
         ((|nx| (|NonNegativeInteger|)) (|z| (%)) (|rx| (|NonNegativeInteger|))
          (|p| (|Vector| (|Integer|))) (|xiv| #1=(|Vector| (|Integer|)))
          (|ziv| #1#) (|i| NIL) (#2=#:G333 NIL) (|pi| (|Integer|)))
         (SEQ (LETT |nx| (SPADCALL |x| (QREFELT % 26)))
              (LETT |z| (SPADCALL |nx| (|spadConstant| % 30) (QREFELT % 31)))
              (LETT |rx| (SPADCALL |x| (QREFELT % 37)))
              (LETT |p| (|CARTEN;mkPerm| |rx| |l| %))
              (LETT |xiv| (MAKEARR1 |rx| 0)) (LETT |ziv| (MAKEARR1 |rx| 0))
              (SEQ (LETT |i| 0) (LETT #2# (- (SPADCALL |x| (QREFELT % 26)) 1))
                   G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |pi|
                          (|CARTEN;index2int|
                           (|CARTEN;permute!| |ziv|
                            (|CARTEN;int2index| |i| |xiv| %) |p| %)
                           %))
                    (EXIT
                     (SPADCALL |z| |pi| (SPADCALL |x| |i| (QREFELT % 27))
                               (QREFELT % 32))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |z|)))) 

(DECLAIM (NOTINLINE |CartesianTensor;|)) 

(DEFUN |CartesianTensor;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 |#2|)
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|CartesianTensor| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 94))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CartesianTensor|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|IndexedVector| |#3| 0))
          (QSETREFV % 10 (EXPT |#2| 2))
          (QSETREFV % 11 (EXPT |#2| 3))
          (QSETREFV % 12 (EXPT |#2| 4))
          %))) 

(DEFUN |CartesianTensor| (&REST #1=#:G334)
  (SPROG NIL
         (PROG (#2=#:G335)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL NIL T))
                     (HGET |$ConstructorCache| '|CartesianTensor|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |CartesianTensor;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CartesianTensor|)))))))))) 

(MAKEPROP '|CartesianTensor| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| '|dim2| '|dim3| '|dim4|
              |CARTEN;kroneckerDelta;%;10| |CARTEN;sample;%;1| (|Integer|)
              (|Vector| 15) (0 . |setelt!|) (|Boolean|) (7 . ~=) (13 . |elt|)
              (|NonNegativeInteger|) (19 . ~=) (|Vector| 18) (25 . |setelt!|)
              (32 . |elt|) (38 . |#|) (43 . |elt|) (|List| 8)
              |CARTEN;ravel;%L;8| (49 . |0|) (53 . |new|) (59 . |setelt!|)
              |CARTEN;unravel;L%;9| (66 . |1|) (70 . |coerce|)
              |CARTEN;leviCivitaSymbol;%;11| |CARTEN;rank;%Nni;13|
              |CARTEN;degree;%Nni;12| |CARTEN;elt;%R;14| |CARTEN;elt;%IR;15|
              |CARTEN;elt;%2IR;16| |CARTEN;elt;%3IR;17| |CARTEN;elt;%4IR;18|
              (|List| 15) |CARTEN;elt;%LR;19| |CARTEN;coerce;L%;20| (|List| $$)
              (75 . |#|) (80 . |first|) (|List| %) |CARTEN;coerce;L%;21|
              (|Union| 8 '"failed") |CARTEN;retractIfCan;%U;22| (|OutputForm|)
              (|List| 54) (85 . |coerce|) (90 . |coerce|) (|List| 50)
              (95 . |matrix|) |CARTEN;coerce;%Of;24| |CARTEN;coerce;R%;27|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARTEN;0;%;25|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARTEN;1;%;26|) %))
              (|DirectProduct| (NRTEVAL (QREFELT % 7)) 8) (100 . |minIndex|)
              (105 . |maxIndex|) (110 . |elt|) |CARTEN;coerce;Dp%;28|
              (|SquareMatrix| (NRTEVAL (QREFELT % 7)) 8) (116 . |elt|)
              |CARTEN;coerce;Sm%;29| (123 . ~=) |CARTEN;=;2%B;30| (129 . +)
              |CARTEN;+;3%;31| (135 . -) |CARTEN;-;3%;32| (141 . -)
              |CARTEN;-;2%;33| (146 . *) |CARTEN;*;I2%;34| |CARTEN;*;%I%;35|
              (152 . *) |CARTEN;*;R2%;36| |CARTEN;*;%R%;37|
              |CARTEN;product;3%;38| |CARTEN;contract;%I%I%;41|
              |CARTEN;*;3%;39| |CARTEN;contract;%2I%;40|
              |CARTEN;transpose;%2I%;43| |CARTEN;transpose;2%;42|
              |CARTEN;reindex;%L%;44| (|String|))
           '#(~= 158 |unravel| 164 |transpose| 169 |sample| 181 |retractIfCan|
              185 |retract| 190 |reindex| 195 |ravel| 201 |rank| 206 |product|
              211 |leviCivitaSymbol| 217 |latex| 221 |kroneckerDelta| 226 |elt|
              230 |degree| 271 |contract| 276 |coerce| 291 = 321 |1| 327 |0|
              331 - 335 + 346 * 352)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|GradedAlgebra&| |GradedModule&| |GradedModule&|
                     |RetractableTo&| |SetCategory&| NIL NIL |BasicType&|)
                  (CONS
                   '#((|GradedAlgebra| 8 21) (|GradedModule| 15 21)
                      (|GradedModule| 8 21) (|RetractableTo| 8) (|SetCategory|)
                      (|CoercibleTo| 54) (|CoercibleFrom| 8) (|BasicType|))
                   (|makeByteWordVec2| 93
                                       '(3 16 15 0 15 15 17 2 15 18 0 0 19 2 16
                                         15 0 15 20 2 21 18 0 0 22 3 23 18 0 15
                                         18 24 2 23 18 0 15 25 1 9 21 0 26 2 9
                                         8 0 15 27 0 8 0 30 2 9 0 21 8 31 3 9 8
                                         0 15 8 32 0 8 0 34 1 8 0 15 35 1 47 21
                                         0 48 1 47 2 0 49 1 55 54 0 56 1 8 54 0
                                         57 1 54 0 58 59 1 64 15 0 65 1 64 15 0
                                         66 2 64 8 0 15 67 3 69 8 0 15 15 70 2
                                         8 18 0 0 72 2 8 0 0 0 74 2 8 0 0 0 76
                                         1 8 0 0 78 2 8 0 15 0 80 2 8 0 0 0 83
                                         2 0 18 0 0 1 1 0 0 28 33 1 0 0 0 91 3
                                         0 0 0 15 15 90 0 0 0 14 1 0 52 0 53 1
                                         0 8 0 1 2 0 0 0 44 92 1 0 28 0 29 1 0
                                         21 0 37 2 0 0 0 0 86 0 0 0 36 1 0 93 0
                                         1 0 0 0 13 2 0 8 0 15 40 1 0 8 0 39 4
                                         0 8 0 15 15 15 42 3 0 8 0 15 15 41 5 0
                                         8 0 15 15 15 15 43 2 0 8 0 44 45 1 0
                                         21 0 38 3 0 0 0 15 15 89 4 0 0 0 15 0
                                         15 87 1 0 54 0 60 1 0 0 8 61 1 0 0 69
                                         71 1 0 0 64 68 1 0 0 50 51 1 0 0 28 46
                                         2 0 18 0 0 73 0 0 0 63 0 0 0 62 1 0 0
                                         0 79 2 0 0 0 0 77 2 0 0 0 0 75 2 0 0 8
                                         0 84 2 0 0 0 8 85 2 0 0 0 15 82 2 0 0
                                         15 0 81 2 0 0 0 0 88)))))
           '|lookupComplete|)) 
