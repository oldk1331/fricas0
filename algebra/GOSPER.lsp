
(SDEFUN |GOSPER;deg0|
        ((|p| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|v| (V)) (% (|Integer|)))
        (COND ((SPADCALL |p| (QREFELT % 13)) -1)
              ('T (SPADCALL |p| |v| (QREFELT % 17))))) 

(SDEFUN |GOSPER;rat?| ((|x| (R)) (% (|Boolean|)))
        (QEQCAR
         (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 19))
                   (QREFELT % 21))
         0)) 

(SDEFUN |GOSPER;RFQ2R|
        ((|f|
          (|Fraction|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (% (Q)))
        (SPADCALL (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT % 23)) %)
                  (|GOSPER;PQ2R| (SPADCALL |f| (QREFELT % 24)) %)
                  (QREFELT % 25))) 

(SDEFUN |GOSPER;PQ2R|
        ((|p| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (% (Q)))
        (SPADCALL (CONS #'|GOSPER;PQ2R!0| %) (ELT % 28) |p| (QREFELT % 32))) 

(SDEFUN |GOSPER;PQ2R!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 19))) 

(SDEFUN |GOSPER;GospersMethod;QVMU;5|
        ((|aquo| (Q)) (|n| (V)) (|newV| (|Mapping| V))
         (% (|Union| Q "failed")))
        (SPROG
         ((|q|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed"))
          (|u|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed"))
          (#1=#:G33 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |q| (|GOSPER;RF2QIfCan| |aquo| %))
                 (EXIT
                  (COND
                   ((QEQCAR |q| 1)
                    (PROGN (LETT #1# (CONS 1 #2="failed")) (GO #3=#:G27)))
                   ('T
                    (SEQ
                     (LETT |u|
                           (|GOSPER;InnerGospersMethod| (QCDR |q|) |n| |newV|
                            %))
                     (EXIT
                      (COND
                       ((QEQCAR |u| 1)
                        (PROGN (LETT #1# (CONS 1 #2#)) (GO #3#))))))))))
            (EXIT (CONS 0 (|GOSPER;RFQ2R| (QCDR |u|) %)))))
          #3# (EXIT #1#)))) 

(SDEFUN |GOSPER;RF2QIfCan|
        ((|f| (Q))
         (%
          (|Union|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
           "failed")))
        (SPROG
         ((|n|
           #1=(|Union|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
               "failed"))
          (|d| #1#))
         (SEQ (LETT |n| (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT % 36)) %))
              (EXIT
               (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                     (#2='T
                      (SEQ
                       (LETT |d|
                             (|GOSPER;UP2QIfCan| (SPADCALL |f| (QREFELT % 37))
                              %))
                       (EXIT
                        (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                              (#2#
                               (CONS 0
                                     (SPADCALL (QCDR |n|) (QCDR |d|)
                                               (QREFELT % 38))))))))))))) 

(SDEFUN |GOSPER;UP2QIfCan|
        ((|p| (P))
         (%
          (|Union| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)
                   "failed")))
        (COND
         ((SPADCALL (CONS (|function| |GOSPER;rat?|) %)
                    (SPADCALL |p| (QREFELT % 40)) (QREFELT % 42))
          (CONS 0
                (SPADCALL (ELT % 43) (CONS #'|GOSPER;UP2QIfCan!0| %) |p|
                          (QREFELT % 48))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |GOSPER;UP2QIfCan!0| ((|y| NIL) (% NIL))
        (SPROG ((#1=#:G49 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (SPADCALL |y| (QREFELT % 18))
                                     (QREFELT % 19))
                           (QREFELT % 21)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Fraction| (|Integer|))
                                  (|Union| (|Fraction| (|Integer|)) "failed")
                                  #1#))
                (QREFELT % 44)))) 

(SDEFUN |GOSPER;InnerGospersMethod|
        ((|aquo|
          (|Fraction|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (|n| (V)) (|newV| (|Mapping| V))
         (%
          (|Union|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
           "failed")))
        (SPROG
         ((|an| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|anm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|pqr|
           (|List|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|rn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|k| (|Integer|))
          (|ufn|
           (|Union|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
            "failed"))
          (|fn|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|qn1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (SEQ (LETT |an| (SPADCALL |aquo| (QREFELT % 23)))
              (LETT |anm1| (SPADCALL |aquo| (QREFELT % 24)))
              (LETT |pqr| (|GOSPER;GosperPQR| |an| |anm1| |n| |newV| %))
              (LETT |pn| (|SPADfirst| |pqr|))
              (LETT |qn| (SPADCALL |pqr| (QREFELT % 50)))
              (LETT |rn| (SPADCALL |pqr| (QREFELT % 51)))
              (LETT |k| (|GOSPER;GosperDegBd| |pn| |qn| |rn| |n| |newV| %))
              (EXIT
               (COND ((< |k| 0) (CONS 1 "failed"))
                     (#1='T
                      (SEQ
                       (LETT |ufn|
                             (|GOSPER;GosperF| |k| |pn| |qn| |rn| |n| |newV|
                              %))
                       (EXIT
                        (COND ((QEQCAR |ufn| 1) (CONS 1 "failed"))
                              (#1#
                               (SEQ (LETT |fn| (QCDR |ufn|))
                                    (LETT |qn1|
                                          (SPADCALL |qn| |n|
                                                    (SPADCALL
                                                     (SPADCALL |n|
                                                               (QREFELT % 43))
                                                     (|spadConstant| % 54)
                                                     (QREFELT % 55))
                                                    (QREFELT % 56)))
                                    (EXIT
                                     (CONS 0
                                           (SPADCALL
                                            (SPADCALL |qn1| |pn|
                                                      (QREFELT % 38))
                                            |fn| (QREFELT % 57))))))))))))))) 

(SDEFUN |GOSPER;GosperF|
        ((|k| (|Integer|))
         (|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|qn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|rn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|n| (V)) (|newV| (|Mapping| V))
         (%
          (|Union|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
           "failed")))
        (SPROG
         ((|mv| (V))
          (|mp| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#1=#:G88 NIL)
          (#2=#:G68
           #3=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#4=#:G66 #3#) (#5=#:G67 NIL) (|fn| #3#)
          (|fnminus1|
           #6=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qnplus1| #6#)
          (|zro| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#7=#:G69 NIL)
          (|mat|
           (|Matrix|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
          (|cz| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|dz| #8=(|NonNegativeInteger|))
          (|zron|
           #9=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|cmz|
           (|Fraction|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|dmz| #8#) (|mz| #9#)
          (|soln|
           (|Union|
            (|Vector|
             (|Fraction|
              (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
            "failed"))
          (|vec|
           (|Vector|
            (|Fraction|
             (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
          (|i| NIL) (#10=#:G89 NIL)
          (#11=#:G84
           #12=(|Fraction|
                (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (#13=#:G82 #12#) (#14=#:G83 NIL))
         (SEQ (LETT |mv| (SPADCALL |newV|))
              (LETT |mp| (SPADCALL |mv| (QREFELT % 43)))
              (LETT |np| (SPADCALL |n| (QREFELT % 43)))
              (LETT |fn|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |i| 0) (LETT #1# |k|) G190
                          (COND ((|greater_SI| |i| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (SPADCALL
                                    (SPADCALL |mp| (+ |i| 1) (QREFELT % 58))
                                    (SPADCALL |np| |i| (QREFELT % 58))
                                    (QREFELT % 59)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 55))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#15='T (|spadConstant| % 60)))))
              (LETT |fnminus1|
                    (SPADCALL |fn| |n|
                              (SPADCALL |np| (|spadConstant| % 54)
                                        (QREFELT % 61))
                              (QREFELT % 56)))
              (LETT |qnplus1|
                    (SPADCALL |qn| |n|
                              (SPADCALL |np| (|spadConstant| % 54)
                                        (QREFELT % 55))
                              (QREFELT % 56)))
              (LETT |zro|
                    (SPADCALL
                     (SPADCALL (SPADCALL |qnplus1| |fn| (QREFELT % 59))
                               (SPADCALL |rn| |fnminus1| (QREFELT % 59))
                               (QREFELT % 61))
                     |pn| (QREFELT % 61)))
              (LETT |zron| (SPADCALL |zro| |n| (QREFELT % 63)))
              (LETT |dz| (SPADCALL |zron| (QREFELT % 65)))
              (LETT |mat|
                    (SPADCALL (+ |dz| 1)
                              (PROG1 (LETT #7# (+ |k| 1))
                                (|check_subtype2| (>= #7# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #7#))
                              (QREFELT % 67)))
              (LETT |vec| (MAKEARR1 (+ |dz| 1) (|spadConstant| % 68)))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |zron| (|spadConstant| % 69) (QREFELT % 70)))
                     (GO G191)))
                   (SEQ (LETT |cz| (SPADCALL |zron| (QREFELT % 71)))
                        (LETT |dz| (SPADCALL |zron| (QREFELT % 65)))
                        (LETT |zron| (SPADCALL |zron| (QREFELT % 72)))
                        (LETT |mz| (SPADCALL |cz| |mv| (QREFELT % 63)))
                        (EXIT
                         (SEQ G190
                              (COND
                               ((NULL
                                 (SPADCALL |mz| (|spadConstant| % 69)
                                           (QREFELT % 70)))
                                (GO G191)))
                              (SEQ
                               (LETT |cmz|
                                     (SPADCALL (SPADCALL |mz| (QREFELT % 71))
                                               (QREFELT % 73)))
                               (LETT |dmz| (SPADCALL |mz| (QREFELT % 65)))
                               (LETT |mz| (SPADCALL |mz| (QREFELT % 72)))
                               (EXIT
                                (COND
                                 ((EQL |dmz| 0)
                                  (SPADCALL |vec|
                                            (+ |dz|
                                               (SPADCALL |vec| (QREFELT % 76)))
                                            (SPADCALL |cmz| (QREFELT % 77))
                                            (QREFELT % 78)))
                                 ('T
                                  (QSETAREF2O |mat| (+ |dz| (PROGN |mat| 1))
                                              (- (+ |dmz| (PROGN |mat| 1)) 1)
                                              |cmz| 1 1)))))
                              NIL (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |soln| (SPADCALL |mat| |vec| (QREFELT % 81)))
              (EXIT
               (COND ((QEQCAR |soln| 1) (CONS 1 "failed"))
                     (#15#
                      (SEQ (LETT |vec| (QCDR |soln|))
                           (EXIT
                            (CONS 0
                                  (PROGN
                                   (LETT #14# NIL)
                                   (SEQ (LETT |i| 0) (LETT #10# |k|) G190
                                        (COND
                                         ((|greater_SI| |i| #10#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (PROGN
                                           (LETT #11#
                                                 (SPADCALL
                                                  (SPADCALL |np| |i|
                                                            (QREFELT % 58))
                                                  (SPADCALL |vec|
                                                            (+ |i|
                                                               (SPADCALL |vec|
                                                                         (QREFELT
                                                                          %
                                                                          76)))
                                                            (QREFELT % 82))
                                                  (QREFELT % 83)))
                                           (COND
                                            (#14#
                                             (LETT #13#
                                                   (SPADCALL #13# #11#
                                                             (QREFELT % 84))))
                                            ('T
                                             (PROGN
                                              (LETT #13# #11#)
                                              (LETT #14# 'T)))))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT NIL))
                                   (COND (#14# #13#)
                                         (#15# (|spadConstant| % 68))))))))))))) 

(SDEFUN |GOSPER;GosperPQR|
        ((|an| #1=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|anm1|
          #2=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|n| (V)) (|newV| (|Mapping| V))
         (%
          (|List|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))))
        (SPROG
         ((|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|j| (V))
          (|rnj|
           #3=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|res| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|fres|
           (|Factored|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (#4=#:G123 NIL) (|fe| NIL) (#5=#:G124 NIL)
          (|rt| (|Union| (|Integer|) #6="failed")) (#7=#:G100 NIL)
          (|js| (|List| (|Integer|))) (#8=#:G125 NIL)
          (|rtp| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|gn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qn| #1#) (#9=#:G108 NIL) (|rn| #2#) (|i| NIL) (#10=#:G126 NIL)
          (#11=#:G118 #3#) (#12=#:G116 #3#) (#13=#:G117 NIL)
          (|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
         (SEQ (LETT |np| (SPADCALL |n| (QREFELT % 43)))
              (LETT |pn| (|spadConstant| % 54)) (LETT |qn| |an|)
              (LETT |rn| |anm1|) (LETT |j| (SPADCALL |newV|))
              (LETT |rnj|
                    (SPADCALL |rn| |n|
                              (SPADCALL |np| (SPADCALL |j| (QREFELT % 43))
                                        (QREFELT % 55))
                              (QREFELT % 56)))
              (LETT |res| (SPADCALL |qn| |rnj| |n| (QREFELT % 85)))
              (LETT |fres| (SPADCALL |res| (QREFELT % 88)))
              (LETT |js|
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |fe| NIL)
                          (LETT #5# (SPADCALL |fres| (QREFELT % 92))) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |fe| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((QEQCAR
                               (LETT |rt|
                                     (|GOSPER;linearAndNNIntRoot|
                                      (QVELT |fe| 1) |j| %))
                               0)
                              (LETT #4#
                                    (CONS
                                     (PROG2 (LETT #7# |rt|)
                                         (QCDR #7#)
                                       (|check_union2| (QEQCAR #7# 0)
                                                       (|Integer|)
                                                       (|Union| (|Integer|)
                                                                #6#)
                                                       #7#))
                                     #4#))))))
                          (LETT #5# (CDR #5#)) (GO G190) G191
                          (EXIT (NREVERSE #4#)))))
              (SEQ (LETT #8# |js|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |rt| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rtp| (SPADCALL |rt| (QREFELT % 93)))
                        (LETT |gn|
                              (SPADCALL |qn|
                                        (SPADCALL |rn| |n|
                                                  (SPADCALL |np| |rtp|
                                                            (QREFELT % 55))
                                                  (QREFELT % 56))
                                        (QREFELT % 94)))
                        (LETT |qn|
                              (PROG2
                                  (LETT #9#
                                        (SPADCALL |qn| |gn| (QREFELT % 96)))
                                  (QCDR #9#)
                                (|check_union2| (QEQCAR #9# 0)
                                                (|SparseMultivariatePolynomial|
                                                 (|Fraction| (|Integer|))
                                                 (QREFELT % 7))
                                                (|Union|
                                                 (|SparseMultivariatePolynomial|
                                                  (|Fraction| (|Integer|))
                                                  (QREFELT % 7))
                                                 #14="failed")
                                                #9#)))
                        (LETT |rn|
                              (PROG2
                                  (LETT #9#
                                        (SPADCALL |rn|
                                                  (SPADCALL |gn| |n|
                                                            (SPADCALL |np|
                                                                      |rtp|
                                                                      (QREFELT
                                                                       % 61))
                                                            (QREFELT % 56))
                                                  (QREFELT % 96)))
                                  (QCDR #9#)
                                (|check_union2| (QEQCAR #9# 0)
                                                (|SparseMultivariatePolynomial|
                                                 (|Fraction| (|Integer|))
                                                 (QREFELT % 7))
                                                (|Union|
                                                 (|SparseMultivariatePolynomial|
                                                  (|Fraction| (|Integer|))
                                                  (QREFELT % 7))
                                                 #14#)
                                                #9#)))
                        (EXIT
                         (LETT |pn|
                               (SPADCALL |pn|
                                         (PROGN
                                          (LETT #13# NIL)
                                          (SEQ (LETT |i| 0)
                                               (LETT #10# (- |rt| 1)) G190
                                               (COND
                                                ((|greater_SI| |i| #10#)
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (PROGN
                                                  (LETT #11#
                                                        (SPADCALL |gn| |n|
                                                                  (SPADCALL
                                                                   |np|
                                                                   (SPADCALL
                                                                    |i|
                                                                    (QREFELT %
                                                                             93))
                                                                   (QREFELT %
                                                                            61))
                                                                  (QREFELT %
                                                                           56)))
                                                  (COND
                                                   (#13#
                                                    (LETT #12#
                                                          (SPADCALL #12# #11#
                                                                    (QREFELT %
                                                                             59))))
                                                   ('T
                                                    (PROGN
                                                     (LETT #12# #11#)
                                                     (LETT #13# 'T)))))))
                                               (LETT |i| (|inc_SI| |i|))
                                               (GO G190) G191 (EXIT NIL))
                                          (COND (#13# #12#)
                                                ('T (|spadConstant| % 54))))
                                         (QREFELT % 59)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (EXIT (LIST |pn| |qn| |rn|))))) 

(SDEFUN |GOSPER;GosperDegBd|
        ((|pn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|qn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|rn| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|n| (V)) (|newV| (|Mapping| V)) (% (|Integer|)))
        (SPROG
         ((|np| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|qnplus1|
           (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|lplus| #1=(|Integer|)) (|lminus| #1#) (|degp| #1#)
          (|k| (|Integer|))
          (|kk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|ck| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|ckm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|nkm1| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|nk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|headfn|
           #2=(|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|headfnm1| #2#)
          (|pk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (|lcpk| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
          (#3=#:G131 NIL) (|k0| (|Union| (|Integer|) "failed")))
         (SEQ (LETT |np| (SPADCALL |n| (QREFELT % 43)))
              (LETT |qnplus1|
                    (SPADCALL |qn| |n|
                              (SPADCALL |np| (|spadConstant| % 54)
                                        (QREFELT % 55))
                              (QREFELT % 56)))
              (LETT |lplus|
                    (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT % 55)) |n|
                     %))
              (LETT |lminus|
                    (|GOSPER;deg0| (SPADCALL |qnplus1| |rn| (QREFELT % 61)) |n|
                     %))
              (LETT |degp| (|GOSPER;deg0| |pn| |n| %))
              (LETT |k| (- |degp| (MAX (- |lplus| 1) |lminus|)))
              (EXIT
               (COND ((<= |lplus| |lminus|) |k|)
                     (#4='T
                      (SEQ
                       (LETT |kk| (SPADCALL (SPADCALL |newV|) (QREFELT % 43)))
                       (LETT |ck| (SPADCALL (SPADCALL |newV|) (QREFELT % 43)))
                       (LETT |ckm1|
                             (SPADCALL (SPADCALL |newV|) (QREFELT % 43)))
                       (LETT |nkm1|
                             (SPADCALL (SPADCALL |newV|) (QREFELT % 43)))
                       (LETT |nk| (SPADCALL |np| |nkm1| (QREFELT % 59)))
                       (LETT |headfn|
                             (SPADCALL (SPADCALL |ck| |nk| (QREFELT % 59))
                                       (SPADCALL |ckm1| |nkm1| (QREFELT % 59))
                                       (QREFELT % 55)))
                       (LETT |headfnm1|
                             (SPADCALL (SPADCALL |ck| |nk| (QREFELT % 59))
                                       (SPADCALL
                                        (SPADCALL |ckm1|
                                                  (SPADCALL |kk| |ck|
                                                            (QREFELT % 59))
                                                  (QREFELT % 61))
                                        |nkm1| (QREFELT % 59))
                                       (QREFELT % 55)))
                       (LETT |pk|
                             (SPADCALL
                              (SPADCALL |qnplus1| |headfn| (QREFELT % 59))
                              (SPADCALL |rn| |headfnm1| (QREFELT % 59))
                              (QREFELT % 61)))
                       (LETT |lcpk|
                             (|GOSPER;pCoef| |pk|
                              (SPADCALL (SPADCALL |ck| |np| (QREFELT % 59))
                                        |nkm1| (QREFELT % 59))
                              %))
                       (LETT |k0|
                             (|GOSPER;linearAndNNIntRoot| |lcpk|
                              (PROG2 (LETT #3# (SPADCALL |kk| (QREFELT % 98)))
                                  (QCDR #3#)
                                (|check_union2| (QEQCAR #3# 0) (QREFELT % 7)
                                                (|Union| (QREFELT % 7)
                                                         "failed")
                                                #3#))
                              %))
                       (EXIT
                        (COND ((QEQCAR |k0| 1) |k|)
                              (#4# (MAX (QCDR |k0|) |k|))))))))))) 

(SDEFUN |GOSPER;pCoef|
        ((|p| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|nom| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (% (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
        (SPROG
         ((|vlist| (|List| V)) (|v| NIL) (#1=#:G145 NIL)
          (|unom|
           #2=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|pow| (|NonNegativeInteger|)) (|up| #2#))
         (SEQ
          (COND
           ((NULL (SPADCALL |nom| (QREFELT % 99)))
            (|error| "pCoef requires a monomial 2nd arg"))
           ('T
            (SEQ (LETT |vlist| (SPADCALL |nom| (QREFELT % 101)))
                 (SEQ (LETT |v| NIL) (LETT #1# |vlist|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL)
                            (NULL
                             (SPADCALL |p| (|spadConstant| % 60)
                                       (QREFELT % 102))))
                        (GO G191)))
                      (SEQ (LETT |unom| (SPADCALL |nom| |v| (QREFELT % 63)))
                           (LETT |pow| (SPADCALL |unom| (QREFELT % 65)))
                           (LETT |nom| (SPADCALL |unom| (QREFELT % 71)))
                           (LETT |up| (SPADCALL |p| |v| (QREFELT % 63)))
                           (EXIT
                            (LETT |p| (SPADCALL |up| |pow| (QREFELT % 103)))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT |p|))))))) 

(SDEFUN |GOSPER;linearAndNNIntRoot|
        ((|mp| (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V))
         (|v| (V)) (% (|Union| (|Integer|) "failed")))
        (SPROG
         ((|p|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|Fraction| (|Integer|)) V)))
          (|p1| #1=(|Union| (|Fraction| (|Integer|)) "failed")) (|p0| #1#)
          (#2=#:G158 NIL) (|rt| (|Fraction| (|Integer|))))
         (SEQ (LETT |p| (SPADCALL |mp| |v| (QREFELT % 63)))
              (EXIT
               (COND
                ((SPADCALL (SPADCALL |p| (QREFELT % 65)) 1 (QREFELT % 104))
                 (CONS 1 "failed"))
                (#3='T
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |p1|
                           (SPADCALL (SPADCALL |p| 1 (QREFELT % 103))
                                     (QREFELT % 105)))
                     (EXIT
                      (COND
                       ((QEQCAR |p1| 1)
                        (PROGN (LETT #2# (CONS 1 #4="failed")) (GO #5=#:G155)))
                       (#3#
                        (SEQ
                         (LETT |p0|
                               (SPADCALL (SPADCALL |p| 0 (QREFELT % 103))
                                         (QREFELT % 105)))
                         (EXIT
                          (COND
                           ((QEQCAR |p0| 1)
                            (PROGN (LETT #2# (CONS 1 #4#)) (GO #5#))))))))))
                    (LETT |rt|
                          (SPADCALL
                           (SPADCALL (QCDR |p0|) (QCDR |p1|) (QREFELT % 106))
                           (QREFELT % 107)))
                    (COND
                     ((OR
                       (SPADCALL |rt| (|spadConstant| % 108) (QREFELT % 109))
                       (SPADCALL (SPADCALL |rt| (QREFELT % 110)) 1
                                 (QREFELT % 104)))
                      (EXIT (CONS 1 "failed"))))
                    (EXIT (CONS 0 (SPADCALL |rt| (QREFELT % 111))))))
                  #5# (EXIT #2#)))))))) 

(DECLAIM (NOTINLINE |GosperSummationMethod;|)) 

(DEFUN |GosperSummationMethod;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|GosperSummationMethod| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 112))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|GosperSummationMethod|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |GosperSummationMethod| (&REST #1=#:G159)
  (SPROG NIL
         (PROG (#2=#:G160)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GosperSummationMethod|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GosperSummationMethod;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GosperSummationMethod|)))))))))) 

(MAKEPROP '|GosperSummationMethod| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|Boolean|)
              (|SparseMultivariatePolynomial| 27 7) (0 . |zero?|) (5 . |1|)
              (9 . |1|) (|NonNegativeInteger|) (13 . |degree|) (19 . |coerce|)
              (24 . |coerce|) (|Union| 27 '"failed") (29 . |retractIfCan|)
              (|Fraction| 12) (34 . |numer|) (39 . |denom|) (44 . /)
              (50 . |coerce|) (|Fraction| 74) (55 . |coerce|) (|Mapping| 10 7)
              (|Mapping| 10 27)
              (|PolynomialCategoryLifting| (|IndexedExponents| 7) 7 27 12 10)
              (60 . |map|) (|Union| 10 '#1="failed") (|Mapping| 7)
              |GOSPER;GospersMethod;QVMU;5| (67 . |numer|) (72 . |denom|)
              (77 . /) (|List| 8) (83 . |coefficients|) (|Mapping| 11 8)
              (88 . |every?|) (94 . |coerce|) (99 . |coerce|) (|Mapping| 12 7)
              (|Mapping| 12 8) (|PolynomialCategoryLifting| 6 7 8 9 12)
              (104 . |map|) (|List| 12) (111 . |second|) (116 . |third|)
              (121 . |0|) (125 . |0|) (129 . |1|) (133 . +) (139 . |eval|)
              (146 . *) (152 . ^) (158 . *) (164 . |0|) (168 . -)
              (|SparseUnivariatePolynomial| %) (174 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (180 . |degree|) (|Matrix| 22)
              (185 . |zero|) (191 . |0|) (195 . |0|) (199 . ~=)
              (205 . |leadingCoefficient|) (210 . |reductum|) (215 . |coerce|)
              (|Integer|) (|Vector| 22) (220 . |minIndex|) (225 . -)
              (230 . |setelt!|) (|Union| 75 '"failed")
              (|LinearSystemMatrixPackage| 22 75 75 66)
              (237 . |particularSolution|) (243 . |elt|) (249 . *) (255 . +)
              (261 . |resultant|) (|Factored| 12)
              (|MRationalFactorize| (|IndexedExponents| 7) 7 74 12)
              (268 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 89) (|:| |factor| 12) (|:| |exponent| 16))
              (|List| 90) (273 . |factorList|) (278 . |coerce|) (283 . |gcd|)
              (|Union| % '"failed") (289 . |exquo|) (|Union| 7 '"failed")
              (295 . |mainVariable|) (300 . |monomial?|) (|List| 7)
              (305 . |variables|) (310 . ~=) (316 . |coefficient|) (322 . ~=)
              (328 . |retractIfCan|) (333 . /) (339 . -) (344 . |0|) (348 . <)
              (354 . |denom|) (359 . |numer|))
           '#(|GospersMethod| 364) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|GospersMethod|
                                 ((|Union| |#5| #1#) |#5| |#2|
                                  (|Mapping| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 111
                                            '(1 12 11 0 13 0 8 0 14 0 9 0 15 2
                                              12 16 0 7 17 1 9 0 8 18 1 10 0 9
                                              19 1 10 20 0 21 1 22 12 0 23 1 22
                                              12 0 24 2 10 0 0 0 25 1 9 0 7 26
                                              1 10 0 27 28 3 31 10 29 30 12 32
                                              1 10 9 0 36 1 10 9 0 37 2 22 0 12
                                              12 38 1 9 39 0 40 2 39 11 41 0 42
                                              1 12 0 7 43 1 12 0 27 44 3 47 12
                                              45 46 9 48 1 49 12 0 50 1 49 12 0
                                              51 0 6 0 52 0 8 0 53 0 12 0 54 2
                                              12 0 0 0 55 3 12 0 0 7 0 56 2 22
                                              0 0 0 57 2 12 0 0 16 58 2 12 0 0
                                              0 59 0 12 0 60 2 12 0 0 0 61 2 12
                                              62 0 7 63 1 64 16 0 65 2 66 0 16
                                              16 67 0 22 0 68 0 64 0 69 2 64 11
                                              0 0 70 1 64 12 0 71 1 64 0 0 72 1
                                              22 0 12 73 1 75 74 0 76 1 22 0 0
                                              77 3 75 22 0 74 22 78 2 80 79 66
                                              75 81 2 75 22 0 74 82 2 22 0 12 0
                                              83 2 22 0 0 0 84 3 12 0 0 0 7 85
                                              1 87 86 12 88 1 86 91 0 92 1 12 0
                                              74 93 2 12 0 0 0 94 2 12 95 0 0
                                              96 1 12 97 0 98 1 12 11 0 99 1 12
                                              100 0 101 2 12 11 0 0 102 2 64 12
                                              0 16 103 2 74 11 0 0 104 1 12 20
                                              0 105 2 27 0 0 0 106 1 27 0 0 107
                                              0 27 0 108 2 27 11 0 0 109 1 27
                                              74 0 110 1 27 74 0 111 3 0 33 10
                                              7 34 35)))))
           '|lookupComplete|)) 
