
(SDEFUN |LGROBP;reduceRow|
        ((M (|Matrix| F)) (|v| (|Vector| F)) (|lastRow| (|Integer|))
         (|pivots| (|Vector| (|Integer|))) (% (|Vector| F)))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (|j| NIL) (#1=#:G26 NIL)
          (|mj| (|Vector| F)) (|k| (|Integer|)) (|b| (F)) (|vk| (F))
          (#2=#:G27 NIL) (|kk| NIL) (#3=#:G28 NIL) (#4=#:G17 NIL) (|a1| (F)))
         (SEQ (LETT |a1| (|spadConstant| % 13))
              (LETT |b| (|spadConstant| % 14)) (LETT |dim| (QVSIZE |v|))
              (SEQ (LETT |j| 1) (LETT #1# |lastRow|) G190
                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                   (SEQ (LETT |mj| (SPADCALL M |j| (QREFELT % 18)))
                        (LETT |k| (SPADCALL |pivots| |j| (QREFELT % 20)))
                        (LETT |b| (SPADCALL |mj| |k| (QREFELT % 21)))
                        (LETT |vk| (SPADCALL |v| |k| (QREFELT % 21)))
                        (SEQ (LETT |kk| 1) (LETT #2# (- |k| 1)) G190
                             (COND ((|greater_SI| |kk| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |v| |kk|
                                         (PROG2
                                             (LETT #4#
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |b|
                                                               (SPADCALL |v|
                                                                         |kk|
                                                                         (QREFELT
                                                                          %
                                                                          21))
                                                               (QREFELT % 22))
                                                     (QREFELT % 23))
                                                    |a1| (QREFELT % 24)))
                                             (QCDR #4#)
                                           (|check_union2| (QEQCAR #4# 0)
                                                           (QREFELT % 7)
                                                           (|Union|
                                                            (QREFELT % 7)
                                                            #5="failed")
                                                           #4#))
                                         (QREFELT % 25))))
                             (LETT |kk| (|inc_SI| |kk|)) (GO G190) G191
                             (EXIT NIL))
                        (SEQ (LETT |kk| |k|) (LETT #3# |dim|) G190
                             (COND ((> |kk| #3#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |v| |kk|
                                         (PROG2
                                             (LETT #4#
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |vk|
                                                               (SPADCALL |mj|
                                                                         |kk|
                                                                         (QREFELT
                                                                          %
                                                                          21))
                                                               (QREFELT % 22))
                                                     (SPADCALL |b|
                                                               (SPADCALL |v|
                                                                         |kk|
                                                                         (QREFELT
                                                                          %
                                                                          21))
                                                               (QREFELT % 22))
                                                     (QREFELT % 26))
                                                    |a1| (QREFELT % 24)))
                                             (QCDR #4#)
                                           (|check_union2| (QEQCAR #4# 0)
                                                           (QREFELT % 7)
                                                           (|Union|
                                                            (QREFELT % 7) #5#)
                                                           #4#))
                                         (QREFELT % 25))))
                             (LETT |kk| (+ |kk| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |a1| |b|)))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |v|)))) 

(SDEFUN |LGROBP;rRedPol|
        ((|f| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (B (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (%
          #1=(|Record|
              (|:| |poly|
                   (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
              (|:| |mult| F))))
        (SPROG
         ((|gm|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|gg| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|ggm| #1#))
         (SEQ (LETT |gm| (SPADCALL |f| B (QREFELT % 31)))
              (EXIT
               (COND
                ((SPADCALL (QCAR |gm|) (|spadConstant| % 32) (QREFELT % 34))
                 |gm|)
                ('T
                 (SEQ (LETT |gg| (SPADCALL (QCAR |gm|) (QREFELT % 35)))
                      (LETT |ggm| (|LGROBP;rRedPol| |gg| B %))
                      (EXIT
                       (CONS
                        (SPADCALL
                         (SPADCALL (QCDR |ggm|)
                                   (SPADCALL (QCAR |gm|) |gg| (QREFELT % 36))
                                   (QREFELT % 37))
                         (QCAR |ggm|) (QREFELT % 38))
                        (SPADCALL (QCDR |ggm|) (QCDR |gm|)
                                  (QREFELT % 22))))))))))) 

(SDEFUN |LGROBP;totolex;LL;3|
        ((B (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (% (|List| (|DistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((|vBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#1=#:G34 NIL) (|ndim| (|PositiveInteger|))
          (|ndim1| #2=(|NonNegativeInteger|)) (|linmat| (|Matrix| F))
          (|pivots| (|Vector| (|Integer|)))
          (|firstmon| #3=(|DistributedMultivariatePolynomial| |lv| F))
          (|v| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|recfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|cc| (F)) (#4=#:G42 NIL) (#5=#:G45 NIL) (|veccoef| (|Vector| F))
          (|ofirstmon| #3#)
          (|orecfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (#6=#:G64 NIL) (|lm| (|Vector| F)) (|j| #2#) (#7=#:G65 NIL) (|k| NIL)
          (#8=#:G66 NIL) (|cordlist| (|List| F)) (|b| NIL) (#9=#:G68 NIL)
          (|c| NIL) (#10=#:G67 NIL)
          (#11=#:G57 #12=(|DistributedMultivariatePolynomial| |lv| F))
          (#13=#:G55 #12#) (#14=#:G56 NIL) (|antc| #12#)
          (|result| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|ltresult| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|i| (|NonNegativeInteger|)) (|nBasis| (|List| #3#)))
         (SEQ (LETT |result| NIL) (LETT |ltresult| NIL)
              (LETT |vBasis| (SPADCALL B (QREFELT % 39)))
              (LETT |nBasis| (LIST (|spadConstant| % 41)))
              (LETT |ndim|
                    (PROG1 (LETT #1# (LENGTH |vBasis|))
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #1#)))
              (LETT |ndim1| (+ |ndim| 1))
              (LETT |linmat|
                    (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT % 44)))
              (SPADCALL |linmat| 1 1 (|spadConstant| % 13) (QREFELT % 45))
              (SPADCALL |linmat| 1 |ndim1| (|spadConstant| % 13)
                        (QREFELT % 45))
              (LETT |pivots| (MAKEARR1 |ndim| 0))
              (SPADCALL |pivots| 1 1 (QREFELT % 46))
              (LETT |firstmon| (|spadConstant| % 41))
              (LETT |ofirstmon| (|spadConstant| % 41))
              (LETT |orecfmon|
                    (CONS (|spadConstant| % 42) (|spadConstant| % 13)))
              (LETT |i| 2)
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |firstmon|
                             (SPADCALL |firstmon| |ltresult| (QREFELT % 48)))
                       (|spadConstant| % 41) (QREFELT % 49)))
                     (GO G191)))
                   (SEQ
                    (SEQ
                     (LETT |v|
                           (SPADCALL |firstmon| |ofirstmon| (QREFELT % 50)))
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (LETT |recfmon|
                              (|LGROBP;rRedPol|
                               (SPADCALL |firstmon| (QREFELT % 51)) B %)))
                       ('T
                        (SEQ
                         (LETT |recfmon|
                               (|LGROBP;rRedPol|
                                (SPADCALL (SPADCALL (QCDR |v|) (QREFELT % 51))
                                          (QCAR |orecfmon|) (QREFELT % 52))
                                B %))
                         (EXIT
                          (PROGN
                           (RPLACD |recfmon|
                                   (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                             (QREFELT % 22)))
                           (QCDR |recfmon|))))))))
                    (LETT |cc|
                          (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT % 53))
                                    (QCDR |recfmon|) (QREFELT % 54)))
                    (PROGN
                     (RPLACA |recfmon|
                             (PROG2
                                 (LETT #4#
                                       (SPADCALL (QCAR |recfmon|) |cc|
                                                 (QREFELT % 55)))
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0)
                                               (|HomogeneousDistributedMultivariatePolynomial|
                                                (QREFELT % 6) (QREFELT % 7))
                                               (|Union|
                                                (|HomogeneousDistributedMultivariatePolynomial|
                                                 (QREFELT % 6) (QREFELT % 7))
                                                "failed")
                                               #4#)))
                     (QCAR |recfmon|))
                    (PROGN
                     (RPLACD |recfmon|
                             (PROG2
                                 (LETT #5#
                                       (SPADCALL (QCDR |recfmon|) |cc|
                                                 (QREFELT % 24)))
                                 (QCDR #5#)
                               (|check_union2| (QEQCAR #5# 0) (QREFELT % 7)
                                               (|Union| (QREFELT % 7) "failed")
                                               #5#)))
                     (QCDR |recfmon|))
                    (LETT |veccoef|
                          (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT % 56)))
                    (LETT |ofirstmon| |firstmon|) (LETT |orecfmon| |recfmon|)
                    (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT % 57)))
                    (SEQ (LETT |j| 1) (LETT #6# |ndim|) G190
                         (COND ((|greater_SI| |j| #6#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |lm| |j|
                                     (SPADCALL |veccoef| |j| (QREFELT % 21))
                                     (QREFELT % 25))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|)
                              (QREFELT % 25))
                    (LETT |lm|
                          (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots|
                           %))
                    (COND ((EQL |i| |ndim1|) (LETT |j| |ndim1|))
                          ('T
                           (SEQ (LETT |j| 1)
                                (EXIT
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |lm| |j| (QREFELT % 21))
                                            (|spadConstant| % 14)
                                            (QREFELT % 58))
                                           (< |j| |ndim1|))
                                          ('T NIL)))
                                        (GO G191)))
                                      (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL
                                      (GO G190) G191 (EXIT NIL))))))
                    (EXIT
                     (COND
                      ((EQL |j| |ndim1|)
                       (SEQ
                        (LETT |cordlist|
                              (PROGN
                               (LETT #7# NIL)
                               (SEQ (LETT |k| |ndim1|)
                                    (LETT #8# (+ |ndim1| (LENGTH |nBasis|)))
                                    G190 (COND ((> |k| #8#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #7#
                                            (CONS
                                             (SPADCALL |lm| |k| (QREFELT % 21))
                                             #7#))))
                                    (LETT |k| (+ |k| 1)) (GO G190) G191
                                    (EXIT (NREVERSE #7#)))))
                        (LETT |antc|
                              (PROGN
                               (LETT #14# NIL)
                               (SEQ (LETT |b| NIL)
                                    (LETT #9# (CONS |firstmon| |nBasis|))
                                    (LETT |c| NIL)
                                    (LETT #10# (REVERSE |cordlist|)) G190
                                    (COND
                                     ((OR (ATOM #10#)
                                          (PROGN (LETT |c| (CAR #10#)) NIL)
                                          (ATOM #9#)
                                          (PROGN (LETT |b| (CAR #9#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #11#
                                             (SPADCALL |c| |b| (QREFELT % 59)))
                                       (COND
                                        (#14#
                                         (LETT #13#
                                               (SPADCALL #13# #11#
                                                         (QREFELT % 60))))
                                        ('T
                                         (PROGN
                                          (LETT #13# #11#)
                                          (LETT #14# 'T)))))))
                                    (LETT #10#
                                          (PROG1 (CDR #10#)
                                            (LETT #9# (CDR #9#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#14# #13#) ('T (|spadConstant| % 61)))))
                        (LETT |antc| (SPADCALL |antc| (QREFELT % 62)))
                        (LETT |result| (CONS |antc| |result|))
                        (EXIT
                         (LETT |ltresult|
                               (CONS
                                (SPADCALL |antc|
                                          (SPADCALL |antc| (QREFELT % 63))
                                          (QREFELT % 64))
                                |ltresult|)))))
                      ('T
                       (SEQ (SPADCALL |pivots| |i| |j| (QREFELT % 46))
                            (SPADCALL |linmat| |i| |lm| (QREFELT % 65))
                            (LETT |i| (+ |i| 1))
                            (EXIT
                             (LETT |nBasis| (CONS |firstmon| |nBasis|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |result|)))) 

(SDEFUN |LGROBP;minPol;LOvlHdmp;4|
        ((|oldBasis|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|x| (|OrderedVariableList| |lv|))
         (% (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|algBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ (LETT |algBasis| (SPADCALL |oldBasis| (QREFELT % 39)))
              (EXIT (SPADCALL |oldBasis| |algBasis| |x| (QREFELT % 67)))))) 

(SDEFUN |LGROBP;minPol;2LOvlHdmp;5|
        ((|oldBasis|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|algBasis|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|x| (|OrderedVariableList| |lv|))
         (% (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|nvp| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#1=#:G71 NIL) (|ndim| (|PositiveInteger|))
          (|ndim1| (|NonNegativeInteger|)) (|linmat| (|Matrix| F))
          (|pivots| (|Vector| (|Integer|))) (|i| NIL) (#2=#:G93 NIL)
          (|recf|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|cc| (F)) (#3=#:G74 NIL)
          (|f| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#4=#:G77 NIL) (|omult| (F)) (|veccoef| (|Vector| F)) (#5=#:G94 NIL)
          (|lm| (|Vector| F)) (|j| (|NonNegativeInteger|)) (|k| NIL)
          (#6=#:G95 NIL) (#7=#:G85 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (#8=#:G92 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nvp| (SPADCALL |x| (QREFELT % 69)))
                (LETT |f| (|spadConstant| % 42))
                (LETT |omult| (|spadConstant| % 13))
                (LETT |ndim|
                      (PROG1 (LETT #1# (LENGTH |algBasis|))
                        (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #1#)))
                (LETT |ndim1| (+ |ndim| 1))
                (LETT |linmat|
                      (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT % 44)))
                (SPADCALL |linmat| 1 1 (|spadConstant| % 13) (QREFELT % 45))
                (SPADCALL |linmat| 1 |ndim1| (|spadConstant| % 13)
                          (QREFELT % 45))
                (LETT |pivots| (MAKEARR1 |ndim| 0))
                (SPADCALL |pivots| 1 1 (QREFELT % 46))
                (EXIT
                 (SEQ (LETT |i| 2) (LETT #2# |ndim1|) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (LETT |recf|
                             (|LGROBP;rRedPol|
                              (SPADCALL |f| |nvp| (QREFELT % 52)) |oldBasis|
                              %))
                       (LETT |omult|
                             (SPADCALL (QCDR |recf|) |omult| (QREFELT % 22)))
                       (LETT |f| (QCAR |recf|))
                       (LETT |cc|
                             (SPADCALL (SPADCALL |f| (QREFELT % 53)) |omult|
                                       (QREFELT % 54)))
                       (LETT |f|
                             (PROG2
                                 (LETT #3# (SPADCALL |f| |cc| (QREFELT % 55)))
                                 (QCDR #3#)
                               (|check_union2| (QEQCAR #3# 0)
                                               (|HomogeneousDistributedMultivariatePolynomial|
                                                (QREFELT % 6) (QREFELT % 7))
                                               (|Union|
                                                (|HomogeneousDistributedMultivariatePolynomial|
                                                 (QREFELT % 6) (QREFELT % 7))
                                                "failed")
                                               #3#)))
                       (LETT |omult|
                             (PROG2
                                 (LETT #4#
                                       (SPADCALL |omult| |cc| (QREFELT % 24)))
                                 (QCDR #4#)
                               (|check_union2| (QEQCAR #4# 0) (QREFELT % 7)
                                               (|Union| (QREFELT % 7) "failed")
                                               #4#)))
                       (LETT |veccoef|
                             (SPADCALL |f| |algBasis| (QREFELT % 56)))
                       (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT % 57)))
                       (SEQ (LETT |j| 1) (LETT #5# |ndim|) G190
                            (COND ((|greater_SI| |j| #5#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |lm| |j|
                                        (SPADCALL |veccoef| |j| (QREFELT % 21))
                                        (QREFELT % 25))))
                            (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                            (EXIT NIL))
                       (SPADCALL |lm| (+ |ndim| |i|) |omult| (QREFELT % 25))
                       (LETT |lm|
                             (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1)
                              |pivots| %))
                       (LETT |j| 1)
                       (SEQ G190
                            (COND
                             ((NULL
                               (COND
                                ((SPADCALL (SPADCALL |lm| |j| (QREFELT % 21))
                                           (|spadConstant| % 14)
                                           (QREFELT % 58))
                                 (< |j| |ndim1|))
                                ('T NIL)))
                              (GO G191)))
                            (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL (GO G190)
                            G191 (EXIT NIL))
                       (COND
                        ((EQL |j| |ndim1|)
                         (PROGN
                          (LETT #8#
                                (SEQ (LETT |g| (|spadConstant| % 32))
                                     (SEQ (LETT |k| |ndim1|)
                                          (LETT #6# (+ (* 2 |ndim|) 1)) G190
                                          (COND ((> |k| #6#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |g|
                                                  (SPADCALL |g|
                                                            (SPADCALL
                                                             (SPADCALL |lm| |k|
                                                                       (QREFELT
                                                                        % 21))
                                                             (SPADCALL |nvp|
                                                                       (PROG1
                                                                           (LETT
                                                                            #7#
                                                                            (-
                                                                             |k|
                                                                             |ndim1|))
                                                                         (|check_subtype2|
                                                                          (>=
                                                                           #7#
                                                                           0)
                                                                          '(|NonNegativeInteger|)
                                                                          '(|Integer|)
                                                                          #7#))
                                                                       (QREFELT
                                                                        % 70))
                                                             (QREFELT % 37))
                                                            (QREFELT % 38)))))
                                          (LETT |k| (+ |k| 1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT (SPADCALL |g| (QREFELT % 71)))))
                          (GO #9=#:G91))))
                       (SPADCALL |pivots| |i| |j| (QREFELT % 46))
                       (EXIT (SPADCALL |linmat| |i| |lm| (QREFELT % 65))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))
          #9# (EXIT #8#)))) 

(SDEFUN |LGROBP;transform;DmpHdmp;6|
        ((|dpol| (|DistributedMultivariatePolynomial| |lv| F))
         (% (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
        (COND
         ((SPADCALL |dpol| (|spadConstant| % 61) (QREFELT % 72))
          (|spadConstant| % 32))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |dpol| (QREFELT % 73))
                     (SPADCALL
                      (SPADCALL (SPADCALL |dpol| (QREFELT % 75))
                                (QREFELT % 77))
                      (QREFELT % 79))
                     (QREFELT % 80))
           (SPADCALL (SPADCALL |dpol| (QREFELT % 63)) (QREFELT % 51))
           (QREFELT % 38))))) 

(SDEFUN |LGROBP;computeBasis;2L;7|
        ((B (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (% (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((#1=#:G104 NIL) (|f| NIL) (#2=#:G105 NIL)
          (|mB|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|var| NIL) (#3=#:G106 NIL)
          (|part|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (|result|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (LETT |mB|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# B) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (|spadConstant| % 13)
                                         (SPADCALL |f| (QREFELT % 81))
                                         (QREFELT % 80))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |result| (LIST (|spadConstant| % 42)))
          (SEQ (LETT |var| NIL) (LETT #3# (QREFELT % 12)) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |var| (CAR #3#)) NIL)) (GO G191)))
               (SEQ (LETT |part| (SPADCALL |var| |result| |mB| (QREFELT % 82)))
                    (EXIT
                     (LETT |result|
                           (SPADCALL |result| |part| (QREFELT % 83)))))
               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
          (EXIT |result|)))) 

(SDEFUN |LGROBP;intcompBasis;Ovl3L;8|
        ((|x| (|OrderedVariableList| |lv|))
         (|lr|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (|mB|
          (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (% (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
        (SPROG
         ((|f| NIL) (#1=#:G112 NIL)
          (|g| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|part|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))))
         (SEQ
          (COND ((SPADCALL |lr| NIL (QREFELT % 84)) |lr|)
                ('T
                 (SEQ (LETT |part| NIL)
                      (SEQ (LETT |f| NIL) (LETT #1# |lr|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |g|
                                  (SPADCALL (SPADCALL |x| (QREFELT % 69)) |f|
                                            (QREFELT % 52)))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (QCAR (SPADCALL |g| |mB| (QREFELT % 31)))
                                (|spadConstant| % 32) (QREFELT % 85))
                               (LETT |part| (CONS |g| |part|))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |part|
                                 (SPADCALL |x| |part| |mB| (QREFELT % 82))
                                 (QREFELT % 83))))))))) 

(SDEFUN |LGROBP;coord;HdmpLV;9|
        ((|f| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
         (B (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (% (|Vector| F)))
        (SPROG
         ((|ndim| (|NonNegativeInteger|)) (|vv| (|Vector| F))
          (|rf| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|lf| (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
          (|lcf| (F)) (|i| (|Integer|)))
         (SEQ (LETT |ndim| (LENGTH B))
              (LETT |vv| (MAKEARR1 |ndim| (|spadConstant| % 14)))
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |f| (|spadConstant| % 32) (QREFELT % 85)))
                     (GO G191)))
                   (SEQ (LETT |rf| (SPADCALL |f| (QREFELT % 35)))
                        (LETT |lf| (SPADCALL |f| |rf| (QREFELT % 36)))
                        (LETT |lcf| (SPADCALL |f| (QREFELT % 86)))
                        (LETT |i|
                              (SPADCALL
                               (SPADCALL (|spadConstant| % 13)
                                         (SPADCALL |lf| (QREFELT % 81))
                                         (QREFELT % 80))
                               B (QREFELT % 87)))
                        (SPADCALL |vv| |i| |lcf| (QREFELT % 25))
                        (EXIT (LETT |f| |rf|)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |vv|)))) 

(SDEFUN |LGROBP;anticoord;LDmpLDmp;10|
        ((|vv| (|List| F)) (|mf| (|DistributedMultivariatePolynomial| |lv| F))
         (B (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (% (|DistributedMultivariatePolynomial| |lv| F)))
        (SPROG ((|c| NIL) (#1=#:G127 NIL) (|f| NIL) (#2=#:G126 NIL))
               (SEQ
                (SEQ (LETT |c| NIL) (LETT #1# |vv|) (LETT |f| NIL) (LETT #2# B)
                     G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL)
                           (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |mf|
                             (SPADCALL |mf| (SPADCALL |c| |f| (QREFELT % 59))
                                       (QREFELT % 64)))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |mf|)))) 

(SDEFUN |LGROBP;choosemon;DmpLDmp;11|
        ((|mf| (|DistributedMultivariatePolynomial| |lv| F))
         (|nB| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (% (|DistributedMultivariatePolynomial| |lv| F)))
        (SPROG
         ((|x| NIL) (#1=#:G140 NIL)
          (|xx| (|DistributedMultivariatePolynomial| |lv| F)) (#2=#:G139 NIL)
          (|dx| (|NonNegativeInteger|)) (#3=#:G133 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |nB| NIL (QREFELT % 90))
             (SPADCALL
              (SPADCALL (SPADCALL (QREFELT % 12) '|last| (QREFELT % 93))
                        (QREFELT % 94))
              |mf| (QREFELT % 95)))
            ('T
             (SEQ
              (SEQ (LETT |x| NIL) (LETT #1# (REVERSE (QREFELT % 12))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |xx| (SPADCALL |x| (QREFELT % 94)))
                        (LETT |mf| (SPADCALL |xx| |mf| (QREFELT % 95)))
                        (COND
                         ((SPADCALL (QCAR (SPADCALL |mf| |nB| (QREFELT % 98)))
                                    (|spadConstant| % 61) (QREFELT % 49))
                          (PROGN (LETT #2# |mf|) (GO #4=#:G138))))
                        (LETT |dx| (SPADCALL |mf| |x| (QREFELT % 99)))
                        (EXIT
                         (LETT |mf|
                               (PROG2
                                   (LETT #3#
                                         (SPADCALL |mf|
                                                   (SPADCALL |xx| |dx|
                                                             (QREFELT % 100))
                                                   (QREFELT % 50)))
                                   (QCDR #3#)
                                 (|check_union2| (QEQCAR #3# 0)
                                                 (|DistributedMultivariatePolynomial|
                                                  (QREFELT % 6) (QREFELT % 7))
                                                 (|Union|
                                                  (|DistributedMultivariatePolynomial|
                                                   (QREFELT % 6) (QREFELT % 7))
                                                  "failed")
                                                 #3#)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |mf|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |LGROBP;linGenPos;LR;12|
        ((B (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
         (%
          (|Record|
           (|:| |gblist| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
           (|:| |gvlist| (|List| (|Integer|))))))
        (SPROG
         ((|vBasis|
           (|List| (|HomogeneousDistributedMultivariatePolynomial| |lv| F)))
          (#1=#:G142 NIL) (|ndim| (|PositiveInteger|))
          (|ndim1| (|NonNegativeInteger|)) (|linmat| (|Matrix| F))
          (|pivots| (|Vector| (|Integer|))) (|ii| NIL) (#2=#:G180 NIL)
          (|c| (|Integer|)) (|rval| (|List| (|Integer|))) (|vv| NIL)
          (#3=#:G182 NIL) (|r| NIL) (#4=#:G181 NIL)
          (#5=#:G150 #6=(|DistributedMultivariatePolynomial| |lv| F))
          (#7=#:G148 #6#) (#8=#:G149 NIL)
          (|nval| (|DistributedMultivariatePolynomial| |lv| F))
          (|lx| (|OrderedVariableList| |lv|))
          (|firstmon| #9=(|DistributedMultivariatePolynomial| |lv| F))
          (|v| (|Union| (|DistributedMultivariatePolynomial| |lv| F) "failed"))
          (|recfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (|cc| (F)) (#10=#:G158 NIL) (#11=#:G161 NIL) (|veccoef| (|Vector| F))
          (|ofirstmon| #9#)
          (|orecfmon|
           (|Record|
            (|:| |poly|
                 (|HomogeneousDistributedMultivariatePolynomial| |lv| F))
            (|:| |mult| F)))
          (#12=#:G183 NIL) (|lm| (|Vector| F)) (#13=#:G184 NIL)
          (|j| (|NonNegativeInteger|)) (#14=#:G185 NIL) (|cordlist| (|List| F))
          (|b| NIL) (#15=#:G187 NIL) (#16=#:G186 NIL)
          (#17=#:G172 #18=(|DistributedMultivariatePolynomial| |lv| F))
          (#19=#:G170 #18#) (#20=#:G171 NIL) (|antc| #18#)
          (|result| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|ltresult| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
          (|i| (|NonNegativeInteger|)) (|nBasis| (|List| #9#)))
         (SEQ (LETT |result| NIL) (LETT |ltresult| NIL)
              (LETT |vBasis| (SPADCALL B (QREFELT % 39)))
              (LETT |nBasis| (LIST (|spadConstant| % 41)))
              (LETT |ndim|
                    (PROG1 (LETT #1# (LENGTH |vBasis|))
                      (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                        '(|NonNegativeInteger|) #1#)))
              (LETT |ndim1| (+ |ndim| 1))
              (LETT |linmat|
                    (SPADCALL |ndim| (+ (* 2 |ndim|) 1) (QREFELT % 44)))
              (SPADCALL |linmat| 1 1 (|spadConstant| % 13) (QREFELT % 45))
              (SPADCALL |linmat| 1 |ndim1| (|spadConstant| % 13)
                        (QREFELT % 45))
              (LETT |pivots| (MAKEARR1 |ndim| 0))
              (SPADCALL |pivots| 1 1 (QREFELT % 46)) (LETT |i| 2)
              (LETT |rval| NIL)
              (SEQ (LETT |ii| 1) (LETT #2# (- (LENGTH (QREFELT % 12)) 1)) G190
                   (COND ((|greater_SI| |ii| #2#) (GO G191)))
                   (SEQ (LETT |c| 0)
                        (SEQ G190 (COND ((NULL (EQL |c| 0)) (GO G191)))
                             (SEQ (EXIT (LETT |c| (RANDOM 11)))) NIL (GO G190)
                             G191 (EXIT NIL))
                        (EXIT (LETT |rval| (CONS |c| |rval|))))
                   (LETT |ii| (|inc_SI| |ii|)) (GO G190) G191 (EXIT NIL))
              (LETT |nval|
                    (SPADCALL
                     (SPADCALL (SPADCALL (QREFELT % 12) (QREFELT % 101))
                               (QREFELT % 94))
                     (PROGN
                      (LETT #8# NIL)
                      (SEQ (LETT |vv| NIL) (LETT #3# (QREFELT % 12))
                           (LETT |r| NIL) (LETT #4# |rval|) G190
                           (COND
                            ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL)
                                 (ATOM #3#) (PROGN (LETT |vv| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #5#
                                    (SPADCALL |r|
                                              (SPADCALL |vv| (QREFELT % 94))
                                              (QREFELT % 102)))
                              (COND
                               (#8#
                                (LETT #7# (SPADCALL #7# #5# (QREFELT % 60))))
                               ('T (PROGN (LETT #7# #5#) (LETT #8# 'T)))))))
                           (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#))))
                           (GO G190) G191 (EXIT NIL))
                      (COND (#8# #7#) ('T (|spadConstant| % 61))))
                     (QREFELT % 64)))
              (LETT |firstmon| (|spadConstant| % 41))
              (LETT |ofirstmon| (|spadConstant| % 41))
              (LETT |orecfmon|
                    (CONS (|spadConstant| % 42) (|spadConstant| % 13)))
              (LETT |lx| (SPADCALL (QREFELT % 12) '|last| (QREFELT % 93)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL
                       (LETT |firstmon|
                             (SPADCALL |firstmon| |ltresult| (QREFELT % 48)))
                       (|spadConstant| % 41) (QREFELT % 49)))
                     (GO G191)))
                   (SEQ
                    (SEQ
                     (LETT |v|
                           (SPADCALL |firstmon| |ofirstmon| (QREFELT % 50)))
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (LETT |recfmon|
                              (|LGROBP;rRedPol|
                               (SPADCALL
                                (SPADCALL |firstmon| |lx| |nval|
                                          (QREFELT % 103))
                                (QREFELT % 51))
                               B %)))
                       ('T
                        (SEQ
                         (LETT |recfmon|
                               (|LGROBP;rRedPol|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (QCDR |v|) |lx| |nval|
                                            (QREFELT % 103))
                                  (QREFELT % 51))
                                 (QCAR |orecfmon|) (QREFELT % 52))
                                B %))
                         (EXIT
                          (PROGN
                           (RPLACD |recfmon|
                                   (SPADCALL (QCDR |recfmon|) (QCDR |orecfmon|)
                                             (QREFELT % 22)))
                           (QCDR |recfmon|))))))))
                    (LETT |cc|
                          (SPADCALL (SPADCALL (QCAR |recfmon|) (QREFELT % 53))
                                    (QCDR |recfmon|) (QREFELT % 54)))
                    (PROGN
                     (RPLACA |recfmon|
                             (PROG2
                                 (LETT #10#
                                       (SPADCALL (QCAR |recfmon|) |cc|
                                                 (QREFELT % 55)))
                                 (QCDR #10#)
                               (|check_union2| (QEQCAR #10# 0)
                                               (|HomogeneousDistributedMultivariatePolynomial|
                                                (QREFELT % 6) (QREFELT % 7))
                                               (|Union|
                                                (|HomogeneousDistributedMultivariatePolynomial|
                                                 (QREFELT % 6) (QREFELT % 7))
                                                "failed")
                                               #10#)))
                     (QCAR |recfmon|))
                    (PROGN
                     (RPLACD |recfmon|
                             (PROG2
                                 (LETT #11#
                                       (SPADCALL (QCDR |recfmon|) |cc|
                                                 (QREFELT % 24)))
                                 (QCDR #11#)
                               (|check_union2| (QEQCAR #11# 0) (QREFELT % 7)
                                               (|Union| (QREFELT % 7) "failed")
                                               #11#)))
                     (QCDR |recfmon|))
                    (LETT |veccoef|
                          (SPADCALL (QCAR |recfmon|) |vBasis| (QREFELT % 56)))
                    (LETT |ofirstmon| |firstmon|) (LETT |orecfmon| |recfmon|)
                    (LETT |lm| (SPADCALL (+ (* 2 |ndim|) 1) (QREFELT % 57)))
                    (SEQ (LETT |j| 1) (LETT #12# |ndim|) G190
                         (COND ((|greater_SI| |j| #12#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |lm| |j|
                                     (SPADCALL |veccoef| |j| (QREFELT % 21))
                                     (QREFELT % 25))))
                         (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                    (SPADCALL |lm| (+ |ndim| |i|) (QCDR |recfmon|)
                              (QREFELT % 25))
                    (LETT |lm|
                          (|LGROBP;reduceRow| |linmat| |lm| (- |i| 1) |pivots|
                           %))
                    (LETT |j| 1)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((SPADCALL (SPADCALL |lm| |j| (QREFELT % 21))
                                        (|spadConstant| % 14) (QREFELT % 58))
                              (< |j| |ndim1|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (COND
                      ((EQL |j| |ndim1|)
                       (SEQ
                        (LETT |cordlist|
                              (PROGN
                               (LETT #13# NIL)
                               (SEQ (LETT |j| |ndim1|)
                                    (LETT #14# (+ |ndim1| (LENGTH |nBasis|)))
                                    G190 (COND ((> |j| #14#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #13#
                                            (CONS
                                             (SPADCALL |lm| |j| (QREFELT % 21))
                                             #13#))))
                                    (LETT |j| (+ |j| 1)) (GO G190) G191
                                    (EXIT (NREVERSE #13#)))))
                        (LETT |antc|
                              (PROGN
                               (LETT #20# NIL)
                               (SEQ (LETT |b| NIL)
                                    (LETT #15# (CONS |firstmon| |nBasis|))
                                    (LETT #16# (REVERSE |cordlist|)) G190
                                    (COND
                                     ((OR (ATOM #16#)
                                          (PROGN (LETT |c| (CAR #16#)) NIL)
                                          (ATOM #15#)
                                          (PROGN (LETT |b| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #17#
                                             (SPADCALL |c| |b| (QREFELT % 59)))
                                       (COND
                                        (#20#
                                         (LETT #19#
                                               (SPADCALL #19# #17#
                                                         (QREFELT % 60))))
                                        ('T
                                         (PROGN
                                          (LETT #19# #17#)
                                          (LETT #20# 'T)))))))
                                    (LETT #16#
                                          (PROG1 (CDR #16#)
                                            (LETT #15# (CDR #15#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#20# #19#) ('T (|spadConstant| % 61)))))
                        (LETT |result|
                              (CONS (SPADCALL |antc| (QREFELT % 62)) |result|))
                        (EXIT
                         (LETT |ltresult|
                               (CONS
                                (SPADCALL |antc|
                                          (SPADCALL |antc| (QREFELT % 63))
                                          (QREFELT % 64))
                                |ltresult|)))))
                      ('T
                       (SEQ (SPADCALL |pivots| |i| |j| (QREFELT % 46))
                            (SPADCALL |linmat| |i| |lm| (QREFELT % 65))
                            (LETT |i| (+ |i| 1))
                            (EXIT
                             (LETT |nBasis| (CONS |firstmon| |nBasis|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (CONS |result| |rval|))))) 

(SDEFUN |LGROBP;groebgen;LR;13|
        ((L (|List| (|DistributedMultivariatePolynomial| |lv| F)))
         (%
          (|Record|
           (|:| |glbase| (|List| (|DistributedMultivariatePolynomial| |lv| F)))
           (|:| |glval| (|List| (|Integer|))))))
        (SPROG
         ((|xn| (|OrderedVariableList| |lv|)) (#1=#:G189 NIL)
          (|nvar1| (|NonNegativeInteger|)) (#2=#:G200 NIL) (#3=#:G201 NIL)
          (|ll| (|List| (|Integer|))) (|i| NIL) (#4=#:G202 NIL)
          (#5=#:G194 #6=(|DistributedMultivariatePolynomial| |lv| F))
          (#7=#:G192 #6#) (#8=#:G193 NIL)
          (|val| (|DistributedMultivariatePolynomial| |lv| F)) (#9=#:G203 NIL)
          (|f| NIL) (#10=#:G204 NIL)
          (LL (|List| (|DistributedMultivariatePolynomial| |lv| F))))
         (SEQ (LETT |xn| (SPADCALL (QREFELT % 12) '|last| (QREFELT % 93)))
              (LETT |val| (SPADCALL |xn| (QREFELT % 94)))
              (LETT |nvar1|
                    (PROG1 (LETT #1# (- (LENGTH (QREFELT % 12)) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |ll|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| 1) (LETT #3# |nvar1|) G190
                          (COND ((|greater_SI| |i| #3#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS (RANDOM 11) #2#))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (LETT |val|
                    (SPADCALL |val|
                              (PROGN
                               (LETT #8# NIL)
                               (SEQ (LETT |i| 1) (LETT #4# |nvar1|) G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #5#
                                             (SPADCALL
                                              (SPADCALL |ll| |i|
                                                        (QREFELT % 107))
                                              (SPADCALL
                                               (SPADCALL (QREFELT % 12) |i|
                                                         (QREFELT % 108))
                                               (QREFELT % 94))
                                              (QREFELT % 102)))
                                       (COND
                                        (#8#
                                         (LETT #7#
                                               (SPADCALL #7# #5#
                                                         (QREFELT % 60))))
                                        ('T
                                         (PROGN
                                          (LETT #7# #5#)
                                          (LETT #8# 'T)))))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#8# #7#) ('T (|spadConstant| % 61))))
                              (QREFELT % 60)))
              (LETT LL
                    (PROGN
                     (LETT #9# NIL)
                     (SEQ (LETT |f| NIL) (LETT #10# L) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |f| (CAR #10#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #9#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL |f| |xn| (QREFELT % 110)) |val|
                                    (QREFELT % 112))
                                   #9#))))
                          (LETT #10# (CDR #10#)) (GO G190) G191
                          (EXIT (NREVERSE #9#)))))
              (LETT LL (SPADCALL LL (QREFELT % 114))) (EXIT (CONS LL |ll|))))) 

(DECLAIM (NOTINLINE |LinGroebnerPackage;|)) 

(DEFUN |LinGroebnerPackage;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G205 NIL)
    (|yx| NIL) (#2=#:G206 NIL) (#3=#:G11 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 |#1|)
     (LETT DV$2 (|devaluate| |#2|))
     (LETT |dv$| (LIST '|LinGroebnerPackage| DV$1 DV$2))
     (LETT % (GETREFV 117))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
     (|haddProp| |$ConstructorCache| '|LinGroebnerPackage| (LIST DV$1 DV$2)
                 (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 12
               (PROGN
                (LETT #1# NIL)
                (SEQ (LETT |yx| NIL) (LETT #2# |#1|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |yx| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #1#
                             (CONS
                              (PROG2 (LETT #3# (SPADCALL |yx| (QREFELT % 11)))
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0)
                                                (|OrderedVariableList|
                                                 (SPADCALL |yx|
                                                           (QREFELT % 11)))
                                                (|Union|
                                                 (|OrderedVariableList|
                                                  (SPADCALL |yx|
                                                            (QREFELT % 11)))
                                                 "failed")
                                                #3#))
                              #1#))))
                     (LETT #2# (CDR #2#)) (GO G190) G191
                     (EXIT (NREVERSE #1#)))))
     %)))) 

(DEFUN |LinGroebnerPackage| (&REST #1=#:G207)
  (SPROG NIL
         (PROG (#2=#:G208)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|LinGroebnerPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LinGroebnerPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LinGroebnerPackage|)))))))))) 

(MAKEPROP '|LinGroebnerPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| % '"failed") (|Symbol|)
              (|OrderedVariableList| (NRTEVAL (QREFELT % 6))) (0 . |variable|)
              '|lvar| (5 . |1|) (9 . |0|) (|Vector| 7) (|Integer|) (|Matrix| 7)
              (13 . |row|) (|Vector| 16) (19 . |elt|) (25 . |elt|) (31 . *)
              (37 . -) (42 . |exquo|) (48 . |setelt!|) (55 . -)
              (|Record| (|:| |poly| 28) (|:| |mult| 7))
              (|HomogeneousDistributedMultivariatePolynomial|
               (NRTEVAL (QREFELT % 6)) 7)
              (|List| 28) (|GroebnerInternalPackage| 7 78 28) (61 . |redPo|)
              (67 . |0|) (|Boolean|) (71 . =) (77 . |reductum|) (82 . -)
              (88 . *) (94 . +) |LGROBP;computeBasis;2L;7|
              (|DistributedMultivariatePolynomial| (NRTEVAL (QREFELT % 6)) 7)
              (100 . |1|) (104 . |1|) (|NonNegativeInteger|) (108 . |zero|)
              (114 . |setelt!|) (122 . |setelt!|) (|List| 40)
              |LGROBP;choosemon;DmpLDmp;11| (129 . ~=) (135 . |exquo|)
              |LGROBP;transform;DmpHdmp;6| (141 . *) (147 . |content|)
              (152 . |gcd|) (158 . |exquo|) |LGROBP;coord;HdmpLV;9|
              (164 . |zero|) (169 . =) (175 . *) (181 . +) (187 . |0|)
              (191 . |primitivePart|) (196 . |reductum|) (201 . -)
              (207 . |setRow!|) |LGROBP;totolex;LL;3|
              |LGROBP;minPol;2LOvlHdmp;5| |LGROBP;minPol;LOvlHdmp;4|
              (214 . |coerce|) (219 . ^) (225 . |primitivePart|) (230 . =)
              (236 . |leadingCoefficient|)
              (|DirectProduct| (NRTEVAL (LENGTH (QREFELT % 6))) 43)
              (241 . |degree|) (|Vector| 43) (246 . |coerce|)
              (|HomogeneousDirectProduct| (NRTEVAL (LENGTH (QREFELT % 6))) 43)
              (251 . |directProduct|) (256 . |monomial|) (262 . |degree|)
              |LGROBP;intcompBasis;Ovl3L;8| (267 . |concat|) (273 . =)
              (279 . ~=) (285 . |leadingCoefficient|) (290 . |position|)
              (|List| 7) |LGROBP;anticoord;LDmpLDmp;10| (296 . =) '"last"
              (|List| 10) (302 . |elt|) (308 . |coerce|) (313 . *)
              (|Record| (|:| |poly| 40) (|:| |mult| 7))
              (|GroebnerInternalPackage| 7 74 40) (319 . |redPo|)
              (325 . |degree|) (331 . ^) (337 . |last|) (342 . *)
              (348 . |eval|) (|Record| (|:| |gblist| 47) (|:| |gvlist| 106))
              |LGROBP;linGenPos;LR;12| (|List| 16) (355 . |elt|) (361 . |elt|)
              (|SparseUnivariatePolynomial| %) (367 . |univariate|)
              (|SparseUnivariatePolynomial| 40) (373 . |elt|)
              (|GroebnerPackage| 7 74 40) (379 . |groebner|)
              (|Record| (|:| |glbase| 47) (|:| |glval| 106))
              |LGROBP;groebgen;LR;13|)
           '#(|transform| 384 |totolex| 389 |minPol| 394 |linGenPos| 407
              |intcompBasis| 412 |groebgen| 419 |coord| 424 |computeBasis| 430
              |choosemon| 435 |anticoord| 441)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|linGenPos|
                                 ((|Record|
                                   (|:| |gblist|
                                        (|List|
                                         (|DistributedMultivariatePolynomial|
                                          |#1| |#2|)))
                                   (|:| |gvlist| (|List| (|Integer|))))
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))))
                                T)
                              '((|groebgen|
                                 ((|Record|
                                   (|:| |glbase|
                                        (|List|
                                         (|DistributedMultivariatePolynomial|
                                          |#1| |#2|)))
                                   (|:| |glval| (|List| (|Integer|))))
                                  (|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))))
                                T)
                              '((|totolex|
                                 ((|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))))
                                T)
                              '((|minPol|
                                 ((|HomogeneousDistributedMultivariatePolynomial|
                                   |#1| |#2|)
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|OrderedVariableList| |#1|)))
                                T)
                              '((|minPol|
                                 ((|HomogeneousDistributedMultivariatePolynomial|
                                   |#1| |#2|)
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|OrderedVariableList| |#1|)))
                                T)
                              '((|computeBasis|
                                 ((|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))))
                                T)
                              '((|coord|
                                 ((|Vector| |#2|)
                                  (|HomogeneousDistributedMultivariatePolynomial|
                                   |#1| |#2|)
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))))
                                T)
                              '((|anticoord|
                                 ((|DistributedMultivariatePolynomial| |#1|
                                                                       |#2|)
                                  (|List| |#2|)
                                  (|DistributedMultivariatePolynomial| |#1|
                                                                       |#2|)
                                  (|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))))
                                T)
                              '((|intcompBasis|
                                 ((|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|OrderedVariableList| |#1|)
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))
                                  (|List|
                                   (|HomogeneousDistributedMultivariatePolynomial|
                                    |#1| |#2|))))
                                T)
                              '((|choosemon|
                                 ((|DistributedMultivariatePolynomial| |#1|
                                                                       |#2|)
                                  (|DistributedMultivariatePolynomial| |#1|
                                                                       |#2|)
                                  (|List|
                                   (|DistributedMultivariatePolynomial| |#1|
                                                                        |#2|))))
                                T)
                              '((|transform|
                                 ((|HomogeneousDistributedMultivariatePolynomial|
                                   |#1| |#2|)
                                  (|DistributedMultivariatePolynomial| |#1|
                                                                       |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 116
                                            '(1 10 8 9 11 0 7 0 13 0 7 0 14 2
                                              17 15 0 16 18 2 19 16 0 16 20 2
                                              15 7 0 16 21 2 7 0 0 0 22 1 7 0 0
                                              23 2 7 8 0 0 24 3 15 7 0 16 7 25
                                              2 7 0 0 0 26 2 30 27 28 29 31 0
                                              28 0 32 2 28 33 0 0 34 1 28 0 0
                                              35 2 28 0 0 0 36 2 28 0 7 0 37 2
                                              28 0 0 0 38 0 40 0 41 0 28 0 42 2
                                              17 0 43 43 44 4 17 7 0 16 16 7 45
                                              3 19 16 0 16 16 46 2 40 33 0 0 49
                                              2 40 8 0 0 50 2 28 0 0 0 52 1 28
                                              7 0 53 2 7 0 0 0 54 2 28 8 0 7 55
                                              1 15 0 43 57 2 7 33 0 0 58 2 40 0
                                              7 0 59 2 40 0 0 0 60 0 40 0 61 1
                                              40 0 0 62 1 40 0 0 63 2 40 0 0 0
                                              64 3 17 0 0 16 15 65 1 28 0 10 69
                                              2 28 0 0 43 70 1 28 0 0 71 2 40
                                              33 0 0 72 1 40 7 0 73 1 40 74 0
                                              75 1 74 76 0 77 1 78 0 76 79 2 28
                                              0 7 78 80 1 28 78 0 81 2 29 0 0 0
                                              83 2 29 33 0 0 84 2 28 33 0 0 85
                                              1 28 7 0 86 2 29 16 28 0 87 2 47
                                              33 0 0 90 2 92 10 0 91 93 1 40 0
                                              10 94 2 40 0 0 0 95 2 97 96 40 47
                                              98 2 40 43 0 10 99 2 40 0 0 43
                                              100 1 92 10 0 101 2 40 0 16 0 102
                                              3 40 0 0 10 0 103 2 106 16 0 16
                                              107 2 92 10 0 16 108 2 40 109 0
                                              10 110 2 111 40 0 40 112 1 113 47
                                              47 114 1 0 28 40 51 1 0 47 29 66
                                              3 0 28 29 29 10 67 2 0 28 29 10
                                              68 1 0 104 29 105 3 0 29 10 29 29
                                              82 1 0 115 47 116 2 0 15 28 29 56
                                              1 0 29 29 39 2 0 40 40 47 48 3 0
                                              40 88 40 47 89)))))
           '|lookupComplete|)) 
