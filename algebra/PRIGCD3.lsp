
(SDEFUN |PRIGCD3;lcx0;SmpLR;1|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|xvars| (|List| (|Symbol|)))
         (%
          (|Record|
           (|:| |lcx0lc|
                (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
           (|:| |lcx0m|
                (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))))
        (SPROG
         ((|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|SparseMultivariatePolynomial|
                                                    (|Integer|)
                                                    (|Symbol|)))))))))
          (|vx| (|Symbol|))
          (|t0|
           (|Record| (|:| |k| (|NonNegativeInteger|))
                     (|:| |c|
                          (|SparseMultivariatePolynomial| (|Integer|)
                                                          (|Symbol|)))))
          (|pr|
           (|Record|
            (|:| |lcx0lc|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
            (|:| |lcx0m|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))))
          (#1=#:G25 NIL))
         (SEQ
          (EXIT
           (COND ((NULL |xvars|) (CONS |p| (|spadConstant| % 7)))
                 (#2='T
                  (SEQ (LETT |xr| |p|)
                       (EXIT
                        (COND ((QEQCAR |xr| 0) (CONS |p| (|spadConstant| % 7)))
                              (#2#
                               (SEQ (LETT |vx| (QCAR (QCDR |xr|)))
                                    (SEQ G190
                                         (COND
                                          ((NULL (NULL (NULL |xvars|)))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (COND
                                            ((EQUAL |vx| (|SPADfirst| |xvars|))
                                             (SEQ
                                              (LETT |t0|
                                                    (|SPADfirst|
                                                     (QCDR (QCDR |xr|))))
                                              (LETT |pr|
                                                    (SPADCALL (QCDR |t0|)
                                                              (CDR |xvars|)
                                                              (QREFELT % 10)))
                                              (EXIT
                                               (PROGN
                                                (LETT #1#
                                                      (CONS (QCAR |pr|)
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (|spadConstant| %
                                                                              7)
                                                              |vx| (QCAR |t0|)
                                                              (QREFELT % 13))
                                                             (QCDR |pr|)
                                                             (QREFELT % 14))))
                                                (GO #3=#:G24)))))
                                            ('T
                                             (LETT |xvars| (CDR |xvars|))))))
                                         NIL (GO G190) G191 (EXIT NIL))
                                    (EXIT
                                     (CONS |p| (|spadConstant| % 7)))))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |PRIGCD3;lcz;SmpSR;2|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|z| (|Symbol|))
         (%
          (|Record|
           (|:| |lczlc|
                (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
           (|:| |k| (|Integer|)))))
        (SPROG
         ((|vx| (|Symbol|))
          (|xu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c|
                           (|SparseMultivariatePolynomial| (|Integer|)
                                                           (|Symbol|))))))
          (|t0|
           (|Record| (|:| |k| (|NonNegativeInteger|))
                     (|:| |c|
                          (|SparseMultivariatePolynomial| (|Integer|)
                                                          (|Symbol|)))))
          (#1=#:G46 NIL)
          (|pr|
           (|Record|
            (|:| |lczlc|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
            (|:| |k| (|Integer|))))
          (#2=#:G45 NIL) (|zdeg| (|Integer|))
          (|yu|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c|
                           (|SparseMultivariatePolynomial| (|Integer|)
                                                           (|Symbol|))))))
          (|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|SparseMultivariatePolynomial|
                                                    (|Integer|)
                                                    (|Symbol|))))))))))
         (SEQ (LETT |xr| |p|)
              (EXIT
               (COND ((QEQCAR |xr| 0) (CONS |p| 0))
                     (#3='T
                      (SEQ (LETT |vx| (QCAR (QCDR |xr|)))
                           (LETT |xu| (QCDR (QCDR |xr|)))
                           (EXIT
                            (COND
                             ((EQUAL |vx| |z|)
                              (SEQ (LETT |t0| (|SPADfirst| |xu|))
                                   (EXIT (CONS (QCDR |t0|) (QCAR |t0|)))))
                             (#3#
                              (SEQ (LETT |zdeg| 0) (LETT |yu| NIL)
                                   (SEQ (LETT #1# |xu|) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |t0| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SEQ
                                           (LETT |pr|
                                                 (SPADCALL (QCDR |t0|) |z|
                                                           (QREFELT % 17)))
                                           (EXIT
                                            (COND
                                             ((> |zdeg| (QCDR |pr|))
                                              (PROGN
                                               (LETT #2# |$NoValue|)
                                               (GO #4=#:G33)))
                                             ('T
                                              (SEQ
                                               (COND
                                                ((< |zdeg| (QCDR |pr|))
                                                 (SEQ (LETT |yu| NIL)
                                                      (EXIT
                                                       (LETT |zdeg|
                                                             (QCDR |pr|))))))
                                               (EXIT
                                                (LETT |yu|
                                                      (CONS
                                                       (CONS (QCAR |t0|)
                                                             (QCAR |pr|))
                                                       |yu|)))))))))
                                         #4# (EXIT #2#))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT NIL))
                                   (LETT |xr|
                                         (CONS 1 (CONS |vx| (REVERSE |yu|))))
                                   (EXIT (CONS |xr| |zdeg|))))))))))))) 

(SDEFUN |PRIGCD3;coeffs0;SmpL2L;3|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|xvars| (|List| (|Symbol|)))
         (|acc|
          (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (% (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))))
        (SPROG
         ((|xr|
           (|Union| (|Integer|)
                    (|Record| (|:| |v| (|Symbol|))
                              (|:| |ts|
                                   (|List|
                                    (|Record| (|:| |k| (|NonNegativeInteger|))
                                              (|:| |c|
                                                   (|SparseMultivariatePolynomial|
                                                    (|Integer|)
                                                    (|Symbol|)))))))))
          (|vx| (|Symbol|))
          (|lp|
           (|List|
            (|Record| (|:| |k| (|NonNegativeInteger|))
                      (|:| |c|
                           (|SparseMultivariatePolynomial| (|Integer|)
                                                           (|Symbol|))))))
          (|t0| NIL) (#1=#:G63 NIL) (#2=#:G62 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |p|)
                (EXIT
                 (COND ((QEQCAR |xr| 0) (CONS |p| |acc|))
                       ('T
                        (SEQ (LETT |vx| (QCAR (QCDR |xr|)))
                             (SEQ G190
                                  (COND
                                   ((NULL (NULL (NULL |xvars|))) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((EQUAL |vx| (|SPADfirst| |xvars|))
                                      (SEQ (LETT |lp| (QCDR (QCDR |xr|)))
                                           (SEQ (LETT |t0| NIL) (LETT #1# |lp|)
                                                G190
                                                (COND
                                                 ((OR (ATOM #1#)
                                                      (PROGN
                                                       (LETT |t0| (CAR #1#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |acc|
                                                        (SPADCALL (QCDR |t0|)
                                                                  (CDR |xvars|)
                                                                  |acc|
                                                                  (QREFELT %
                                                                           19)))))
                                                (LETT #1# (CDR #1#)) (GO G190)
                                                G191 (EXIT NIL))
                                           (EXIT
                                            (PROGN
                                             (LETT #2# |acc|)
                                             (GO #3=#:G61)))))
                                     ('T (LETT |xvars| (CDR |xvars|))))))
                                  NIL (GO G190) G191 (EXIT NIL))
                             (EXIT (CONS |p| |acc|))))))))
          #3# (EXIT #2#)))) 

(SDEFUN |PRIGCD3;coeffs1;SmpLL;4|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|xvars| (|List| (|Symbol|)))
         (% (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))))
        (SPADCALL |p| |xvars| NIL (QREFELT % 19))) 

(SDEFUN |PRIGCD3;alg_reduce0;2SmpLSSmp;5|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|m| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|xvars| (|List| (|Symbol|))) (|z| (|Symbol|))
         (% (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
        (SPROG
         ((|mlcr|
           #1=(|Record|
               (|:| |lczlc|
                    #2=(|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
               (|:| |k| #3=(|Integer|))))
          (|degm| #3#) (|mlc| #2#) (|plcr| #1#) (|degp| #3#) (#4=#:G90 NIL)
          (|g| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
          (|alc| #2#) (#5=#:G71 NIL)
          (|mlc1| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
          (#6=#:G84 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |mlcr| (SPADCALL |m| |z| (QREFELT % 17)))
                (LETT |degm| (QCDR |mlcr|)) (LETT |mlc| (QCAR |mlcr|))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |plcr| (SPADCALL |p| |z| (QREFELT % 17)))
                           (LETT |degp| (QCDR |plcr|))
                           (EXIT
                            (COND
                             ((< |degp| |degm|)
                              (PROGN (LETT #4# |p|) (GO #7=#:G89)))
                             ('T
                              (SEQ (LETT |alc| (QCAR |plcr|))
                                   (LETT |g|
                                         (SPADCALL
                                          (CONS |mlc|
                                                (SPADCALL |alc| |xvars|
                                                          (QREFELT % 20)))
                                          (QREFELT % 22)))
                                   (LETT |alc|
                                         (PROG2
                                             (LETT #5#
                                                   (SPADCALL |alc| |g|
                                                             (QREFELT % 24)))
                                             (QCDR #5#)
                                           (|check_union2| (QEQCAR #5# 0)
                                                           (|SparseMultivariatePolynomial|
                                                            (|Integer|)
                                                            (|Symbol|))
                                                           (|Union|
                                                            (|SparseMultivariatePolynomial|
                                                             (|Integer|)
                                                             (|Symbol|))
                                                            #8="failed")
                                                           #5#)))
                                   (LETT |mlc1|
                                         (PROG2
                                             (LETT #5#
                                                   (SPADCALL |mlc| |g|
                                                             (QREFELT % 24)))
                                             (QCDR #5#)
                                           (|check_union2| (QEQCAR #5# 0)
                                                           (|SparseMultivariatePolynomial|
                                                            (|Integer|)
                                                            (|Symbol|))
                                                           (|Union|
                                                            (|SparseMultivariatePolynomial|
                                                             (|Integer|)
                                                             (|Symbol|))
                                                            #8#)
                                                           #5#)))
                                   (EXIT
                                    (LETT |p|
                                          (SPADCALL
                                           (SPADCALL |mlc1| |p| (QREFELT % 14))
                                           (SPADCALL
                                            (SPADCALL |alc|
                                                      (SPADCALL
                                                       (|spadConstant| % 7) |z|
                                                       (PROG1
                                                           (LETT #6#
                                                                 (- |degp|
                                                                    |degm|))
                                                         (|check_subtype2|
                                                          (>= #6# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #6#))
                                                       (QREFELT % 13))
                                                      (QREFELT % 14))
                                            |m| (QREFELT % 14))
                                           (QREFELT % 25)))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #4#)))) 

(SDEFUN |PRIGCD3;alg_reduce;SmpL2LSmp;6|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|lm|
          (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (|xvars| (|List| (|Symbol|))) (|zvars| (|List| (|Symbol|)))
         (% (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
        (SPROG ((|z| NIL) (#1=#:G96 NIL) (|m| NIL) (#2=#:G95 NIL))
               (SEQ
                (SEQ (LETT |z| NIL) (LETT #1# |zvars|) (LETT |m| NIL)
                     (LETT #2# |lm|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL)
                           (ATOM #1#) (PROGN (LETT |z| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |p|
                             (SPADCALL |p| |m| |xvars| |z| (QREFELT % 26)))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |PRIGCD3;trial_div0|
        ((|a| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|b| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|lm|
          (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (|xvars| (|List| (|Symbol|))) (|zvars| (|List| (|Symbol|)))
         (|do_quo| (|Boolean|))
         (%
          (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))
                   #1="failed")))
        (SPROG
         ((|blcr|
           #2=(|Record|
               (|:| |lcx0lc|
                    #3=(|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
               (|:| |lcx0m|
                    #4=(|SparseMultivariatePolynomial| (|Integer|)
                                                       (|Symbol|)))))
          (|blc| #3#) (|blm| #4#) (|alcr| #2#) (|alm| #4#)
          (|mquo|
           (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))
                    "failed"))
          (#5=#:G107 NIL)
          (|g| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
          (|alc| #3#) (#6=#:G98 NIL)
          (|s| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
          (|res| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (SEQ
          (EXIT
           (SEQ (LETT |blcr| (SPADCALL |b| |xvars| (QREFELT % 10)))
                (LETT |blc| (QCAR |blcr|)) (LETT |blm| (QCDR |blcr|))
                (LETT |res| (|spadConstant| % 15))
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |a| (|spadConstant| % 15) (QREFELT % 29))
                          (PROGN (LETT #5# (CONS 0 |res|)) (GO #7=#:G106)))
                         ('T
                          (SEQ
                           (LETT |alcr| (SPADCALL |a| |xvars| (QREFELT % 10)))
                           (LETT |alc| (QCAR |alcr|))
                           (LETT |alm| (QCDR |alcr|))
                           (LETT |mquo| (SPADCALL |alm| |blm| (QREFELT % 24)))
                           (EXIT
                            (COND
                             ((QEQCAR |mquo| 1)
                              (PROGN (LETT #5# (CONS 1 "failed")) (GO #7#)))
                             ('T
                              (SEQ
                               (LETT |g|
                                     (SPADCALL
                                      (CONS |blc|
                                            (SPADCALL |alc| |zvars|
                                                      (QREFELT % 20)))
                                      (QREFELT % 22)))
                               (LETT |alc|
                                     (PROG2
                                         (LETT #6#
                                               (SPADCALL |alc| |g|
                                                         (QREFELT % 24)))
                                         (QCDR #6#)
                                       (|check_union2| (QEQCAR #6# 0)
                                                       (|SparseMultivariatePolynomial|
                                                        (|Integer|) (|Symbol|))
                                                       (|Union|
                                                        (|SparseMultivariatePolynomial|
                                                         (|Integer|)
                                                         (|Symbol|))
                                                        #1#)
                                                       #6#)))
                               (LETT |s|
                                     (PROG2
                                         (LETT #6#
                                               (SPADCALL |blc| |g|
                                                         (QREFELT % 24)))
                                         (QCDR #6#)
                                       (|check_union2| (QEQCAR #6# 0)
                                                       (|SparseMultivariatePolynomial|
                                                        (|Integer|) (|Symbol|))
                                                       (|Union|
                                                        (|SparseMultivariatePolynomial|
                                                         (|Integer|)
                                                         (|Symbol|))
                                                        #1#)
                                                       #6#)))
                               (COND
                                (|do_quo|
                                 (LETT |res|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |alc| (QCDR |mquo|)
                                                   (QREFELT % 14))
                                         (SPADCALL |s| |res| (QREFELT % 14))
                                         (QREFELT % 30))
                                        |lm| |xvars| |zvars| (QREFELT % 27)))))
                               (EXIT
                                (LETT |a|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |s| |a| (QREFELT % 14))
                                        (SPADCALL
                                         (SPADCALL |alc| (QCDR |mquo|)
                                                   (QREFELT % 14))
                                         |b| (QREFELT % 14))
                                        (QREFELT % 25))
                                       |lm| |xvars| |zvars|
                                       (QREFELT % 27)))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #7# (EXIT #5#)))) 

(SDEFUN |PRIGCD3;alg_trial_division;2SmpL2LB;8|
        ((|a| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|b| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|lm|
          (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (|xvars| (|List| (|Symbol|))) (|zvars| (|List| (|Symbol|)))
         (% (|Boolean|)))
        (NULL
         (QEQCAR (|PRIGCD3;trial_div0| |a| |b| |lm| |xvars| |zvars| NIL %) 1))) 

(SDEFUN |PRIGCD3;alg_exquo;2SmpL2LU;9|
        ((|a| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|b| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|)))
         (|lm|
          (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))))
         (|xvars| (|List| (|Symbol|))) (|zvars| (|List| (|Symbol|)))
         (%
          (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Symbol|))
                   "failed")))
        (|PRIGCD3;trial_div0| |a| |b| |lm| |xvars| |zvars| 'T %)) 

(DECLAIM (NOTINLINE |PrimGCD;|)) 

(DEFUN |PrimGCD;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PrimGCD|))
          (LETT % (GETREFV 34))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PrimGCD| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |PrimGCD| ()
  (SPROG NIL
         (PROG (#1=#:G115)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PrimGCD|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PrimGCD|
                             (LIST (CONS NIL (CONS 1 (|PrimGCD;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|PrimGCD|)))))))))) 

(MAKEPROP '|PrimGCD| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL
              (|SparseMultivariatePolynomial| (|Integer|) 11) (0 . |1|)
              (|Record| (|:| |lcx0lc| 6) (|:| |lcx0m| 6)) (|List| 11)
              |PRIGCD3;lcx0;SmpLR;1| (|Symbol|) (|NonNegativeInteger|)
              (4 . |monomial|) (11 . *) (17 . |0|)
              (|Record| (|:| |lczlc| 6) (|:| |k| (|Integer|)))
              |PRIGCD3;lcz;SmpSR;2| (|List| 6) |PRIGCD3;coeffs0;SmpL2L;3|
              |PRIGCD3;coeffs1;SmpLL;4| (|List| %) (21 . |gcd|)
              (|Union| % '"failed") (26 . |exquo|) (32 . -)
              |PRIGCD3;alg_reduce0;2SmpLSSmp;5|
              |PRIGCD3;alg_reduce;SmpL2LSmp;6| (|Boolean|) (38 . =) (44 . +)
              |PRIGCD3;alg_trial_division;2SmpL2LB;8| (|Union| 6 '"failed")
              |PRIGCD3;alg_exquo;2SmpL2LU;9|)
           '#(|lcz| 50 |lcx0| 56 |coeffs1| 62 |coeffs0| 68 |alg_trial_division|
              75 |alg_reduce0| 84 |alg_reduce| 92 |alg_exquo| 100)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|lcx0|
                                 ((|Record|
                                   (|:| |lcx0lc|
                                        (|SparseMultivariatePolynomial|
                                         (|Integer|) (|Symbol|)))
                                   (|:| |lcx0m|
                                        (|SparseMultivariatePolynomial|
                                         (|Integer|) (|Symbol|))))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List| (|Symbol|))))
                                T)
                              '((|lcz|
                                 ((|Record|
                                   (|:| |lczlc|
                                        (|SparseMultivariatePolynomial|
                                         (|Integer|) (|Symbol|)))
                                   (|:| |k| (|Integer|)))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|Symbol|)))
                                T)
                              '((|coeffs0|
                                 ((|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List| (|Symbol|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))))
                                T)
                              '((|coeffs1|
                                 ((|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List| (|Symbol|))))
                                T)
                              '((|alg_reduce0|
                                 ((|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List| (|Symbol|)) (|Symbol|)))
                                T)
                              '((|alg_reduce|
                                 ((|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))
                                  (|List| (|Symbol|)) (|List| (|Symbol|))))
                                T)
                              '((|alg_trial_division|
                                 ((|Boolean|)
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))
                                  (|List| (|Symbol|)) (|List| (|Symbol|))))
                                T)
                              '((|alg_exquo|
                                 ((|Union|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|))
                                   "failed")
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|SparseMultivariatePolynomial| (|Integer|)
                                                                  (|Symbol|))
                                  (|List|
                                   (|SparseMultivariatePolynomial| (|Integer|)
                                                                   (|Symbol|)))
                                  (|List| (|Symbol|)) (|List| (|Symbol|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 33
                                            '(0 6 0 7 3 6 0 0 11 12 13 2 6 0 0
                                              0 14 0 6 0 15 1 6 0 21 22 2 6 23
                                              0 0 24 2 6 0 0 0 25 2 6 28 0 0 29
                                              2 6 0 0 0 30 2 0 16 6 11 17 2 0 8
                                              6 9 10 2 0 18 6 9 20 3 0 18 6 9
                                              18 19 5 0 28 6 6 18 9 9 31 4 0 6
                                              6 6 9 11 26 4 0 6 6 18 9 9 27 5 0
                                              32 6 6 18 9 9 33)))))
           '|lookupComplete|)) 
