
(SDEFUN |RADFF;discriminant;F;1| ((% (|Fraction| UP)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 19)))) 

(SDEFUN |RADFF;radcand| ((% (UP)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 21)))) 

(SDEFUN |RADFF;integralBasis;V;3| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (|RADFF;diag| (QREFELT % 24) %)))) 

(SDEFUN |RADFF;integralBasisAtInfinity;V;4| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (|RADFF;diag| (QREFELT % 26) %)))) 

(SDEFUN |RADFF;basisvec| ((% (|Vector| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (QREFELT % 24)))) 

(SDEFUN |RADFF;integralMatrix;M;6| ((% (|Matrix| (|Fraction| UP))))
        (SPADCALL (|RADFF;basisvec| %) (QREFELT % 37))) 

(SDEFUN |RADFF;integralMatrixAtInfinity;M;7| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 26) (QREFELT % 37))))) 

(SDEFUN |RADFF;inverseIntegralMatrix;M;8| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 25) (QREFELT % 37))))) 

(SDEFUN |RADFF;inverseIntegralMatrixAtInfinity;M;9|
        ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 17) (|RADFF;startUp| NIL %)))
             (EXIT (SPADCALL (QREFELT % 27) (QREFELT % 37))))) 

(SDEFUN |RADFF;definingPolynomial;UPUP;10| ((% (UPUP))) (QREFELT % 23)) 

(SDEFUN |RADFF;ramified?;FB;11| ((|point| (F)) (% (|Boolean|)))
        (SPADCALL (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))) 

(SDEFUN |RADFF;branchPointAtInfinity?;B;12| ((% (|Boolean|)))
        (QEQCAR
         (|exquo_INT| (SPADCALL (|RADFF;radcand| %) (QREFELT % 47))
                      (QREFELT % 10))
         1)) 

(SDEFUN |RADFF;elliptic;U;13| ((% (|Union| UP "failed")))
        (SEQ
         (COND
          ((EQL (QREFELT % 10) 2)
           (COND
            ((EQL (SPADCALL (|RADFF;radcand| %) (QREFELT % 47)) 3)
             (EXIT (CONS 0 (|RADFF;radcand| %)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;hyperelliptic;U;14| ((% (|Union| UP "failed")))
        (SEQ
         (COND
          ((EQL (QREFELT % 10) 2)
           (COND
            ((ODDP (SPADCALL (|RADFF;radcand| %) (QREFELT % 47)))
             (EXIT (CONS 0 (|RADFF;radcand| %)))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |RADFF;diag| ((|v| (|Vector| (|Fraction| UP))) (% (|Vector| %)))
        (SPROG ((#1=#:G52 NIL) (|i| NIL) (#2=#:G53 NIL))
               (SEQ
                (PROGN
                 (LETT #1# (GETREFV (|inc_SI| #3=(QREFELT % 22))))
                 (SEQ (LETT |i| 0) (LETT #2# #3#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# |i|
                                (SPADCALL
                                 (SPADCALL
                                  (QAREF1O |v| (+ |i| (QREFELT % 31)) 1) |i|
                                  (QREFELT % 14))
                                 (QREFELT % 52)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(SDEFUN |RADFF;integralRepresents;VUP%;16|
        ((|v| (|Vector| UP)) (|d| (UP)) (% (%)))
        (SPROG
         ((|ib| (|Vector| (|Fraction| UP))) (#1=#:G59 NIL) (|i| NIL)
          (#2=#:G60 NIL) (#3=#:G58 NIL))
         (SEQ (LETT |ib| (|RADFF;basisvec| %))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #1#
                       (GETREFV
                        (|inc_SI| (- #4=(QVSIZE |ib|) #5=(QREFELT % 31)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL (QAREF1O |ib| |i| 1)
                                          (SPADCALL (QAREF1O |v| |i| 1) |d|
                                                    (QREFELT % 53))
                                          (QREFELT % 54)))))
                      (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)
                (QREFELT % 55)))))) 

(SDEFUN |RADFF;integralCoordinates;%R;17|
        ((|f| (%)) (% (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
        (SPROG
         ((|v| (|Vector| (|Fraction| UP))) (|ib| (|Vector| (|Fraction| UP)))
          (#1=#:G68 NIL) (|i| NIL) (#2=#:G69 NIL) (#3=#:G67 NIL))
         (SEQ (LETT |v| (SPADCALL |f| (QREFELT % 58)))
              (LETT |ib| (|RADFF;basisvec| %))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #1#
                       (GETREFV
                        (|inc_SI| (- #4=(QVSIZE |ib|) #5=(QREFELT % 31)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL (QAREF1O |v| |i| 1)
                                          (QAREF1O |ib| |i| 1)
                                          (QREFELT % 59)))))
                      (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)
                (QREFELT % 62)))))) 

(SDEFUN |RADFF;integralDerivationMatrix;MR;18|
        ((|d| (|Mapping| UP UP))
         (% (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP))))
        (SPROG
         ((|dlogp| (|Fraction| UP)) (|v| (|Vector| (|Fraction| UP)))
          (#1=#:G81 NIL) (|i| NIL) (#2=#:G82 NIL) (#3=#:G80 NIL)
          (|cd| (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
         (SEQ
          (LETT |dlogp|
                (SPADCALL (SPADCALL (QREFELT % 9) |d| (QREFELT % 65))
                          (SPADCALL (QREFELT % 10) (QREFELT % 9)
                                    (QREFELT % 66))
                          (QREFELT % 59)))
          (LETT |v| (|RADFF;basisvec| %))
          (LETT |cd|
                (SPADCALL
                 (PROGN
                  (LETT #1#
                        (GETREFV
                         (|inc_SI| (- #4=(QVSIZE |v|) #5=(QREFELT % 31)))))
                  (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                       (COND ((> |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SETELT #1# #3#
                                 (SPADCALL
                                  (SPADCALL (- |i| (QREFELT % 31)) |dlogp|
                                            (QREFELT % 67))
                                  (SPADCALL
                                   (SPADCALL (QAREF1O |v| |i| 1) |d|
                                             (QREFELT % 65))
                                   (QAREF1O |v| |i| 1) (QREFELT % 59))
                                  (QREFELT % 68)))))
                       (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                       (GO G190) G191 (EXIT NIL))
                  #1#)
                 (QREFELT % 62)))
          (EXIT (CONS (SPADCALL (QCAR |cd|) (QREFELT % 70)) (QCDR |cd|)))))) 

(SDEFUN |RADFF;iBasis|
        ((|p| (UP)) (|d| (|NonNegativeInteger|)) (% (|Vector| UP)))
        (SPROG
         ((|pl| (|PrimitiveArray| UP)) (#1=#:G83 NIL)
          (|d1| (|NonNegativeInteger|)) (#2=#:G91 NIL) (|i| NIL) (#3=#:G92 NIL)
          (|j| NIL) (#4=#:G93 NIL) (#5=#:G87 (UP)) (#6=#:G85 (UP))
          (#7=#:G86 NIL))
         (SEQ
          (LETT |pl| (|RADFF;fullVector| (SPADCALL |p| (QREFELT % 74)) |d| %))
          (LETT |d1|
                (PROG1 (LETT #1# (- |d| 1))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (EXIT
           (PROGN
            (LETT #2# (GETREFV (|inc_SI| |d1|)))
            (SEQ (LETT |i| 0) (LETT #3# |d1|) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SETELT #2# |i|
                           (PROGN
                            (LETT #7# NIL)
                            (SEQ (LETT |j| 0) (LETT #4# |d1|) G190
                                 (COND ((|greater_SI| |j| #4#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #5#
                                          (SPADCALL (QAREF1 |pl| |j|)
                                                    (|quotient_INT| (* |i| |j|)
                                                                    |d|)
                                                    (QREFELT % 75)))
                                    (COND
                                     (#7#
                                      (LETT #6#
                                            (SPADCALL #6# #5# (QREFELT % 76))))
                                     ('T
                                      (PROGN (LETT #6# #5#) (LETT #7# 'T)))))))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#7# #6#) ('T (|spadConstant| % 77)))))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
            #2#))))) 

(SDEFUN |RADFF;fullVector|
        ((|p| (|Factored| UP)) (|m| (|NonNegativeInteger|))
         (% (|PrimitiveArray| UP)))
        (SPROG
         ((|ans| (|PrimitiveArray| UP))
          (|l|
           (|List|
            (|Record| (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|i| NIL) (#1=#:G112 NIL)
          (|u|
           (|Union|
            (|Record| (|:| |factor| UP)
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ (LETT |ans| (MAKEARR1 |m| (|spadConstant| % 20)))
              (QSETAREF1 |ans| 0 (SPADCALL |p| (QREFELT % 79)))
              (LETT |l| (SPADCALL |p| (QREFELT % 82)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |ans| (QREFELT % 84))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |ans| |i|
                                (SEQ
                                 (LETT |u|
                                       (SPADCALL
                                        (CONS #'|RADFF;fullVector!0|
                                              (VECTOR % |i|))
                                        |l| (QREFELT % 88)))
                                 (EXIT
                                  (COND ((QEQCAR |u| 1) (|spadConstant| % 77))
                                        ('T (QCAR (QCDR |u|)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |RADFF;fullVector!0| ((|s| NIL) ($$ NIL))
        (PROG (|i| %)
          (LETT |i| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (QCDR |s|) |i| (QREFELT % 85)))))) 

(SDEFUN |RADFF;inftyBasis|
        ((|p| (|Fraction| UP)) (|m| (|NonNegativeInteger|))
         (% (|Vector| (|Fraction| UP))))
        (SPROG
         ((|x| (|Fraction| UP))
          (|rt|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
          (|a| (|Fraction| UP)) (|v| (|Vector| UP))
          (|w| (|Vector| (|Fraction| UP))) (|i| NIL) (#1=#:G121 NIL)
          (|b| (|Fraction| UP)))
         (SEQ
          (LETT |rt|
                (SPADCALL
                 (SPADCALL |p|
                           (LETT |x|
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 89) 1
                                             (QREFELT % 90))
                                   (QREFELT % 91))
                                  (QREFELT % 92)))
                           (QREFELT % 94))
                 |m| (QREFELT % 97)))
          (EXIT
           (COND
            ((SPADCALL |m| (QVELT |rt| 0) (QREFELT % 98))
             (|error|
              "Curve not irreducible after change of variable 0 -> infinity"))
            ('T
             (SEQ (LETT |a| (SPADCALL (QVELT |rt| 1) |x| (QREFELT % 94)))
                  (LETT |b| (|spadConstant| % 12))
                  (LETT |v| (|RADFF;iBasis| (QVELT |rt| 2) |m| %))
                  (LETT |w| (MAKEARR1 |m| (|spadConstant| % 18)))
                  (SEQ (LETT |i| (QREFELT % 31)) (LETT #1# (QVSIZE |v|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O |w| |i|
                                    (SPADCALL |b|
                                              (SPADCALL
                                               (SPADCALL (QAREF1O |v| |i| 1)
                                                         (QREFELT % 91))
                                               |x| (QREFELT % 94))
                                              (QREFELT % 59))
                                    1)
                        (EXIT (LETT |b| (SPADCALL |b| |a| (QREFELT % 54)))))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT |w|)))))))) 

(SDEFUN |RADFF;charPintbas|
        ((|p| (UPUP)) (|c| (|Fraction| UP)) (|v| (|Vector| (|Fraction| UP)))
         (|w| (|Vector| (|Fraction| UP))) (% (|Void|)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| UP))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (|k| NIL) (#1=#:G133 NIL) (|j| NIL) (#2=#:G132 NIL) (|i| NIL)
          (#3=#:G131 NIL) (|a| (|Fraction| UP)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |p| (QREFELT % 99)) (QREFELT % 10)
                      (QREFELT % 98))
            (|error| "charPintbas: should not happen"))
           ('T
            (SEQ (LETT |q| (SPADCALL (ELT % 100) |p| (QREFELT % 104)))
                 (LETT |ib|
                       (SPADCALL
                        (|compiledLookupCheck| '|integralBasis|
                                               (LIST
                                                (LIST '|Record|
                                                      (LIST '|:| '|basis|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   (ELT % 7))))
                                                      (LIST '|:| '|basisDen|
                                                            (|devaluate|
                                                             (ELT % 7)))
                                                      (LIST '|:| '|basisInv|
                                                            (LIST '|Matrix|
                                                                  (|devaluate|
                                                                   (ELT %
                                                                        7))))))
                                               (|FunctionFieldIntegralBasis|
                                                (ELT % 7)
                                                (|SparseUnivariatePolynomial|
                                                 (ELT % 7))
                                                (|SimpleAlgebraicExtension|
                                                 (ELT % 7)
                                                 (|SparseUnivariatePolynomial|
                                                  (ELT % 7))
                                                 |q|)))))
                 (COND
                  ((NULL (SPADCALL (QVELT |ib| 0) (QREFELT % 105)))
                   (EXIT
                    (|error| "charPintbas: integral basis not diagonal"))))
                 (LETT |a| (|spadConstant| % 12))
                 (SEQ (LETT |k| (QREFELT % 31)) (LETT #1# (QVSIZE |v|))
                      (LETT |j| (PROGN (QVELT |ib| 0) 1))
                      (LETT #2# (SPADCALL (QVELT |ib| 0) (QREFELT % 107)))
                      (LETT |i| (PROGN (QVELT |ib| 0) 1))
                      (LETT #3# (SPADCALL (QVELT |ib| 0) (QREFELT % 106))) G190
                      (COND
                       ((OR (> |i| #3#) (> |j| #2#) (> |k| #1#)) (GO G191)))
                      (SEQ
                       (QSETAREF1O |v| |k|
                                   (SPADCALL
                                    (SPADCALL
                                     (QAREF2O (QVELT |ib| 0) |i| |j| 1 1)
                                     (QVELT |ib| 1) (QREFELT % 53))
                                    |a| (QREFELT % 54))
                                   1)
                       (QSETAREF1O |w| |k|
                                   (SPADCALL
                                    (QAREF2O (QVELT |ib| 2) |i| |j| 1 1)
                                    (SPADCALL |a| (QREFELT % 92))
                                    (QREFELT % 108))
                                   1)
                       (EXIT (LETT |a| (SPADCALL |a| |c| (QREFELT % 54)))))
                      (LETT |i|
                            (PROG1 (+ |i| 1)
                              (LETT |j|
                                    (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1))))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT (SPADCALL (QREFELT % 110))))))))) 

(SDEFUN |RADFF;charPStartUp| ((% (|Void|)))
        (SPROG
         ((|x| (|Fraction| UP)) (|invmod| (UPUP))
          (|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP))))
         (SEQ (LETT |r| (SPADCALL (QREFELT % 23) (QREFELT % 112)))
              (|RADFF;charPintbas| (QCDR |r|) (QCAR |r|) (QREFELT % 24)
               (QREFELT % 25) %)
              (LETT |x|
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL (|spadConstant| % 89) 1 (QREFELT % 90))
                      (QREFELT % 91))
                     (QREFELT % 92)))
              (LETT |invmod|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 12) (QREFELT % 10)
                               (QREFELT % 14))
                     (SPADCALL (SPADCALL (QREFELT % 9) |x| (QREFELT % 94))
                               (QREFELT % 15))
                     (QREFELT % 16)))
              (LETT |r| (SPADCALL |invmod| (QREFELT % 112)))
              (EXIT
               (|RADFF;charPintbas| (QCDR |r|)
                (SPADCALL (QCAR |r|) |x| (QREFELT % 94)) (QREFELT % 26)
                (QREFELT % 27) %))))) 

(SDEFUN |RADFF;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|p| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G156 NIL)
          (#2=#:G153 #3=(|Fraction| UP)) (#4=#:G151 #3#) (#5=#:G152 NIL)
          (|dsc| (|Fraction| UP)))
         (SEQ (SETELT % 17 |b|)
              (COND
               ((OR (ZEROP (LETT |p| (SPADCALL (QREFELT % 113))))
                    (> |p| (QREFELT % 10)))
                (|RADFF;char0StartUp| %))
               ('T (|RADFF;charPStartUp| %)))
              (LETT |dsc|
                    (SPADCALL
                     (SPADCALL
                      (*
                       (EXPT -1
                             (|quotient_INT| (* (QREFELT % 10) (QREFELT % 22))
                                             2))
                       (EXPT (QREFELT % 10) (QREFELT % 10)))
                      (SPADCALL (QREFELT % 9) (QREFELT % 22) (QREFELT % 114))
                      (QREFELT % 67))
                     (PROGN
                      (LETT #5# NIL)
                      (SEQ (LETT |i| (QREFELT % 31))
                           (LETT #1# (QVSIZE (QREFELT % 24))) G190
                           (COND ((> |i| #1#) (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #2#
                                    (SPADCALL (QAREF1O (QREFELT % 24) |i| 1) 2
                                              (QREFELT % 115)))
                              (COND
                               (#5#
                                (LETT #4# (SPADCALL #4# #2# (QREFELT % 54))))
                               ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (COND (#5# #4#) ('T (|spadConstant| % 12))))
                     (QREFELT % 54)))
              (SETELT % 19
                      (SPADCALL
                       (SPADCALL (SPADCALL |dsc| (QREFELT % 116))
                                 (QREFELT % 117))
                       (SPADCALL |dsc| (QREFELT % 118)) (QREFELT % 53)))
              (EXIT (SPADCALL (QREFELT % 110)))))) 

(SDEFUN |RADFF;char0StartUp| ((% (|Void|)))
        (SPROG
         ((|rp|
           (|Record| (|:| |exponent| (|NonNegativeInteger|))
                     (|:| |coef| (|Fraction| UP)) (|:| |radicand| UP)))
          (|ib| (|Vector| UP)) (|infb| (|Vector| (|Fraction| UP))) (|i| NIL)
          (#1=#:G164 NIL) (|invden| (|Fraction| UP)) (|a| (|Fraction| UP)))
         (SEQ
          (LETT |rp| (SPADCALL (QREFELT % 9) (QREFELT % 10) (QREFELT % 97)))
          (EXIT
           (COND
            ((SPADCALL (QVELT |rp| 0) (QREFELT % 10) (QREFELT % 98))
             (|error| "RadicalFunctionField: curve is not irreducible"))
            ('T
             (SEQ (SETELT % 21 (QVELT |rp| 2))
                  (LETT |ib| (|RADFF;iBasis| (QREFELT % 21) (QREFELT % 10) %))
                  (LETT |infb|
                        (|RADFF;inftyBasis| (QREFELT % 9) (QREFELT % 10) %))
                  (LETT |invden| (|spadConstant| % 12))
                  (SEQ (LETT |i| (QREFELT % 31)) (LETT #1# (QVSIZE |ib|)) G190
                       (COND ((> |i| #1#) (GO G191)))
                       (SEQ
                        (QSETAREF1O (QREFELT % 25) |i|
                                    (LETT |a|
                                          (SPADCALL (QAREF1O |ib| |i| 1)
                                                    |invden| (QREFELT % 108)))
                                    1)
                        (QSETAREF1O (QREFELT % 24) |i|
                                    (SPADCALL |a| (QREFELT % 92)) 1)
                        (LETT |invden|
                              (SPADCALL |invden| (QVELT |rp| 1)
                                        (QREFELT % 59)))
                        (QSETAREF1O (QREFELT % 26) |i|
                                    (LETT |a| (QAREF1O |infb| |i| 1)) 1)
                        (EXIT
                         (QSETAREF1O (QREFELT % 27) |i|
                                     (SPADCALL |a| (QREFELT % 92)) 1)))
                       (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                  (EXIT (SPADCALL (QREFELT % 110)))))))))) 

(SDEFUN |RADFF;ramified?;UPB;26| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 120)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 121)))
                      ('T
                       (QEQCAR
                        (SPADCALL (|RADFF;radcand| %) |p| (QREFELT % 123))
                        0))))))) 

(SDEFUN |RADFF;singular?;UPB;27| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 120)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 121)))
                      ('T
                       (QEQCAR
                        (SPADCALL (|RADFF;radcand| %)
                                  (SPADCALL |p| 2 (QREFELT % 126))
                                  (QREFELT % 123))
                        0))))))) 

(SDEFUN |RADFF;branchPoint?;UPB;28| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")) (|q| (|Union| UP "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 120)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 128)))
                      (#1='T
                       (SEQ
                        (LETT |q|
                              (SPADCALL (|RADFF;radcand| %) |p|
                                        (QREFELT % 123)))
                        (EXIT
                         (COND
                          ((QEQCAR |q| 0)
                           (QEQCAR (SPADCALL (QCDR |q|) |p| (QREFELT % 123))
                                   1))
                          (#1# NIL)))))))))) 

(SDEFUN |RADFF;singular?;FB;29| ((|point| (F)) (% (|Boolean|)))
        (SPROG ((#1=#:G197 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (|RADFF;radcand| %)
                                       (SPADCALL
                                        (SPADCALL (|spadConstant| % 89) 1
                                                  (QREFELT % 90))
                                        (SPADCALL |point| (QREFELT % 130))
                                        (QREFELT % 131))
                                       (QREFELT % 123)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                     (|Union| (QREFELT % 7) "failed") #1#))
                   |point| (QREFELT % 43))
                  (QREFELT % 45)))
                ('T NIL)))) 

(SDEFUN |RADFF;branchPoint?;FB;30| ((|point| (F)) (% (|Boolean|)))
        (SPROG ((#1=#:G202 NIL))
               (COND
                ((SPADCALL
                  (SPADCALL (|RADFF;radcand| %) |point| (QREFELT % 43))
                  (QREFELT % 45))
                 (NULL
                  (SPADCALL
                   (SPADCALL
                    (PROG2
                        (LETT #1#
                              (SPADCALL (|RADFF;radcand| %)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 89) 1
                                                   (QREFELT % 90))
                                         (SPADCALL |point| (QREFELT % 130))
                                         (QREFELT % 131))
                                        (QREFELT % 123)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                      (|Union| (QREFELT % 7) "failed") #1#))
                    |point| (QREFELT % 43))
                   (QREFELT % 45))))
                ('T NIL)))) 

(DECLAIM (NOTINLINE |RadicalFunctionField;|)) 

(DEFUN |RadicalFunctionField;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G249 NIL) (#2=#:G248 NIL) (|pv$| NIL) (#3=#:G10 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT DV$5 |#5|)
    (LETT |dv$| (LIST '|RadicalFunctionField| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 174))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #1#
                                              (|HasCategory| (|Fraction| |#2|)
                                                             '(|Field|)))
                                        (OR #1#
                                            (|HasCategory| (|Fraction| |#2|)
                                                           '(|FiniteFieldCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|CharacteristicZero|))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|FiniteFieldCategory|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Finite|))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|Hashable|))
                                        (OR
                                         (AND
                                          (|HasCategory| (|Fraction| |#2|)
                                                         '(|DifferentialRing|))
                                          #1#)
                                         (|HasCategory| (|Fraction| |#2|)
                                                        '(|FiniteFieldCategory|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Fraction| |#2|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|PartialDifferentialRing|
                                                                (|Symbol|)))
                                               (|HasCategory| (|Fraction| |#2|)
                                                              '(|Field|))))
                                        (OR #2#
                                            (AND
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|PartialDifferentialRing|
                                                              (|Symbol|)))
                                             (|HasCategory| (|Fraction| |#2|)
                                                            '(|FiniteFieldCategory|))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|Finite|))))))
    (|haddProp| |$ConstructorCache| '|RadicalFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (AND (|HasCategory| % '(|CharacteristicNonZero|))
         (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))
         (|augmentPredVector| % 65536))
    (AND
     (OR (AND (|HasCategory| % '(|CharacteristicZero|)) #1#)
         (AND (|HasCategory| % '(|CharacteristicZero|))
              (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|)))
         (|HasCategory| (|Fraction| |#2|)
                        '(|RetractableTo| (|Fraction| (|Integer|)))))
     (|augmentPredVector| % 131072))
    (AND
     (OR (AND (|HasCategory| % '(|CharacteristicZero|)) #1#)
         (AND (|HasCategory| % '(|CharacteristicZero|))
              (|HasCategory| (|Fraction| |#2|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| % 262144))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 17 'T)
    (QSETREFV % 19 (|spadConstant| % 18))
    (QSETREFV % 21 (|spadConstant| % 20))
    (QSETREFV % 22
              (PROG1 (LETT #3# (- |#5| 1))
                (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #3#)))
    (QSETREFV % 23
              (SPADCALL (SPADCALL (|spadConstant| % 12) |#5| (QREFELT % 14))
                        (SPADCALL |#4| (QREFELT % 15)) (QREFELT % 16)))
    (QSETREFV % 24 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 25 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 26 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 27 (MAKEARR1 |#5| (|spadConstant| % 18)))
    (QSETREFV % 31 (SPADCALL (QREFELT % 24) (QREFELT % 30)))
    %))) 

(DEFUN |RadicalFunctionField| (&REST #1=#:G250)
  (SPROG NIL
         (PROG (#2=#:G251)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL NIL))
                     (HGET |$ConstructorCache| '|RadicalFunctionField|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |RadicalFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|RadicalFunctionField|)))))))))) 

(MAKEPROP '|RadicalFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 11 8
                                          (NRTEVAL
                                           (SPADCALL
                                            (SPADCALL (|spadConstant| % 12)
                                                      (QREFELT % 10)
                                                      (QREFELT % 14))
                                            (SPADCALL (QREFELT % 9)
                                                      (QREFELT % 15))
                                            (QREFELT % 16))))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|local| |#5|) (|Fraction| 7) (0 . |1|) (|NonNegativeInteger|)
              (4 . |monomial|) (10 . |coerce|) (15 . -) '|brandNew?| (21 . |0|)
              '|discPoly| (25 . |0|) '|newrad| '|n1| '|modulus| '|ibasis|
              '|invibasis| '|infbasis| '|invinfbasis| (|Integer|) (|Vector| 11)
              (29 . |minIndex|) '|mini| |RADFF;discriminant;F;1| (|Vector| %)
              |RADFF;integralBasis;V;3| |RADFF;integralBasisAtInfinity;V;4|
              (|Matrix| 11) (34 . |diagonalMatrix|) |RADFF;integralMatrix;M;6|
              |RADFF;integralMatrixAtInfinity;M;7|
              |RADFF;inverseIntegralMatrix;M;8|
              |RADFF;inverseIntegralMatrixAtInfinity;M;9|
              |RADFF;definingPolynomial;UPUP;10| (39 . |elt|) (|Boolean|)
              (45 . |zero?|) |RADFF;ramified?;FB;11| (50 . |degree|)
              |RADFF;branchPointAtInfinity?;B;12| (|Union| 7 '"failed")
              |RADFF;elliptic;U;13| |RADFF;hyperelliptic;U;14| (55 . |reduce|)
              (60 . /) (66 . *) (72 . |represents|) (|Vector| 7)
              |RADFF;integralRepresents;VUP%;16| (77 . |coordinates|) (82 . /)
              (|Record| (|:| |num| 56) (|:| |den| 7))
              (|InnerCommonDenominator| 7 11 56 29) (88 . |splitDenominator|)
              |RADFF;integralCoordinates;%R;17| (|Mapping| 7 7)
              (93 . |differentiate|) (99 . *) (105 . *) (111 . +) (|Matrix| 7)
              (117 . |diagonalMatrix|) (|Record| (|:| |num| 69) (|:| |den| 7))
              |RADFF;integralDerivationMatrix;MR;18| (|Factored| %)
              (122 . |squareFree|) (127 . ^) (133 . *) (139 . |1|)
              (|Factored| 7) (143 . |unit|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 13)) (|List| 80)
              (148 . |factors|) (|PrimitiveArray| 7) (153 . |maxIndex|)
              (158 . =) (|Union| 80 '"failed") (|Mapping| 44 80) (164 . |find|)
              (170 . |1|) (174 . |monomial|) (180 . |coerce|) (185 . |inv|)
              (|Fraction| %) (190 . |elt|)
              (|Record| (|:| |exponent| 13) (|:| |coef| 11) (|:| |radicand| 7))
              (|ChangeOfVariable| 6 7 8) (196 . |rootPoly|) (202 . ~=)
              (208 . |degree|) (213 . |retract|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 11)
              (|UnivariatePolynomialCategoryFunctions2| 11 8 7 101)
              (218 . |map|) (224 . |diagonal?|) (229 . |maxRowIndex|)
              (234 . |maxColIndex|) (239 . *) (|Void|) (245 . |void|)
              (|Record| (|:| |coef| 11) (|:| |poly| 8)) (249 . |mkIntegral|)
              (254 . |characteristic|) (258 . ^) (264 . ^) (270 . |numer|)
              (275 . |primitivePart|) (280 . |denom|) (|Union| 6 '#1="failed")
              (285 . |retractIfCan|) |RADFF;singular?;FB;29|
              (|Union| % '"failed") (290 . |exquo|) |RADFF;ramified?;UPB;26|
              (|PositiveInteger|) (296 . ^) |RADFF;singular?;UPB;27|
              |RADFF;branchPoint?;FB;30| |RADFF;branchPoint?;UPB;28|
              (302 . |coerce|) (307 . -) (|String|) (|OutputForm|)
              (|Union| 11 '#1#) (|Record| (|:| |mat| 36) (|:| |vec| 29))
              (|Matrix| %) (|List| 7)
              (|Record| (|:| |num| %) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 33 '#2="failed") (|Symbol|) (|List| 140) (|List| 13)
              (|Fraction| 28) (|List| (|Polynomial| 6)) (|List| (|List| 6))
              (|Fraction| 8) (|Mapping| 11 11) (|Union| 149 '#3="failed")
              (|List| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 151 '#3#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 149) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Table| 125 13) (|Record| (|:| |factor| 28) (|:| |exponent| 13))
              (|List| 161) (|Factored| 155) (|Union| 165 '#2#) (|List| 155)
              (|Union| 13 '"failed") (|OnePointCompletion| 125) (|HashState|)
              (|SingleInteger|) (|Matrix| 28)
              (|Record| (|:| |mat| 170) (|:| |vec| (|Vector| 28)))
              (|Union| 143 '#1#) (|Union| 28 '#1#))
           '#(~= 313 |zero?| 319 |yCoordinates| 324 |unitNormal| 329
              |unitCanonical| 334 |unit?| 339 |traceMatrix| 344 |trace| 353
              |tableForDiscreteLogarithm| 358 |subtractIfCan| 363
              |squareFreePolynomial| 369 |squareFreePart| 374 |squareFree| 379
              |special_order| 384 |solveLinearPolynomialEquation| 390
              |smaller?| 396 |sizeLess?| 402 |size| 408 |singularAtInfinity?|
              412 |singular?| 416 |sample| 426 |rightRecip| 430 |rightPower|
              435 |retractIfCan| 447 |retract| 462 |represents| 477
              |representationType| 494 |rem| 498 |regularRepresentation| 504
              |reducedSystem| 515 |reduceBasisAtInfinity| 537 |reduce| 542
              |recip| 552 |rationalPoints| 557 |rationalPoint?| 561 |rank| 567
              |random| 571 |ramifiedAtInfinity?| 575 |ramified?| 579 |quo| 589
              |principalIdeal| 595 |primitivePart| 600 |primitiveElement| 605
              |primitive?| 609 |primeFrobenius| 614 |prime?| 625 |plenaryPower|
              630 |order| 636 |opposite?| 646 |one?| 652 |numberOfComponents|
              657 |normalizeAtInfinity| 661 |norm| 666 |nonSingularModel| 671
              |nextItem| 676 |multiEuclidean| 681 |minimalPolynomial| 687
              |lookup| 692 |lift| 697 |leftRecip| 702 |leftPower| 707 |lcmCoef|
              719 |lcm| 725 |latex| 736 |inverseIntegralMatrixAtInfinity| 741
              |inverseIntegralMatrix| 745 |inv| 749 |integralRepresents| 754
              |integralMatrixAtInfinity| 760 |integralMatrix| 764
              |integralDerivationMatrix| 768 |integralCoordinates| 773
              |integralBasisAtInfinity| 778 |integralBasis| 782
              |integralAtInfinity?| 786 |integral?| 791 |init| 808 |index| 812
              |hyperelliptic| 817 |hashUpdate!| 821 |hash| 827 |genus| 832
              |generator| 836 |gcdPolynomial| 840 |gcd| 846
              |factorsOfCyclicGroupSize| 857 |factorSquareFreePolynomial| 861
              |factorPolynomial| 866 |factor| 871 |extendedEuclidean| 876
              |exquo| 889 |expressIdealMember| 895 |euclideanSize| 901
              |enumerate| 906 |elt| 910 |elliptic| 917 |divide| 921
              |discriminant| 927 |discreteLog| 936 |differentiate| 947
              |derivationCoordinates| 1003 |definingPolynomial| 1009
              |createPrimitiveElement| 1013 |coordinates| 1017 |convert| 1039
              |conditionP| 1064 |complementaryBasis| 1069 |commutator| 1074
              |coerce| 1080 |charthRoot| 1105 |characteristicPolynomial| 1115
              |characteristic| 1120 |branchPointAtInfinity?| 1124
              |branchPoint?| 1128 |basis| 1138 |associator| 1142 |associates?|
              1149 |antiCommutator| 1155 |annihilate?| 1161 |algSplitSimple|
              1167 |absolutelyIrreducible?| 1173 ^ 1177 D 1195 = 1245 |1| 1251
              |0| 1255 / 1259 - 1265 + 1276 * 1282)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 2 2 4 2 4 4 4 4 4 0 3 3 3 0 0 14 9 5 3 0
                                  0 0 5 0 0 0 0 5 0 0 0 0 12 5 0 0 0 0 0 12 5 5
                                  0 0 0 0 0 0 7 0 0 0 7 0 0 0 0 2 7 0 0 0 0 11
                                  10 8 0 0 0 11 10 7 6 3 3 3 1 0 0 0 0 0 0))
            (CONS
             '#(|FunctionFieldCategory&| |MonogenicAlgebra&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| NIL
                |FramedAlgebra&| |DifferentialExtension&| |DivisionRing&| NIL
                NIL |FiniteRankAlgebra&| |PartialDifferentialRing&|
                |DifferentialRing&| |Algebra&| |EntireRing&| |Algebra&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&|
                |Module&| NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                NIL NIL |NonAssociativeRing&| NIL |FramedModule&| NIL NIL NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&|
                |Finite&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |Hashable&| |SetCategory&| NIL |RetractableTo&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|FunctionFieldCategory| 6 7 8)
                 (|MonogenicAlgebra| (|Fraction| 7) 8) (|FiniteFieldCategory|)
                 (|FieldOfPrimeCharacteristic|) (|Field|)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FramedAlgebra| (|Fraction| 7) 8)
                 (|DifferentialExtension| (|Fraction| 7)) (|DivisionRing|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|FiniteRankAlgebra| (|Fraction| 7) 8)
                 (|PartialDifferentialRing| 140) (|DifferentialRing|)
                 (|Algebra| 143) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| (|Fraction| 7)) (|Ring|)
                 (|NonAssociativeAlgebra| 143) (|SemiRing|)
                 (|NonAssociativeAlgebra| (|Fraction| 7)) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|Module| 143) (|SemiRng|)
                 (|Module| (|Fraction| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|LinearlyExplicitOver| 28) (|BiModule| 143 143)
                 (|NonAssociativeRing|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|FramedModule| (|Fraction| 7)) (|BiModule| $$ $$)
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|RightModule| 28)
                 (|RightModule| 143) (|LeftModule| 143) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| (|Fraction| 7))
                 (|LeftModule| $$) (|RightModule| (|Fraction| 7))
                 (|AbelianGroup|) (|Finite|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Comparable|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|RetractableTo| 28)
                 (|RetractableTo| 143) (|Hashable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| (|Fraction| 7))
                 (|CoercibleFrom| 28) (|CoercibleFrom| 143)
                 (|ConvertibleTo| 158) (|CharacteristicNonZero|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CharacteristicZero|) (|CoercibleTo| 133)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 8) (|CoercibleFrom| (|Fraction| 7)))
              (|makeByteWordVec2| 173
                                  '(0 11 0 12 2 8 0 11 13 14 1 8 0 11 15 2 8 0
                                    0 0 16 0 11 0 18 0 7 0 20 1 29 28 0 30 1 36
                                    0 29 37 2 7 6 0 6 43 1 6 44 0 45 1 7 13 0
                                    47 1 0 0 8 52 2 11 0 7 7 53 2 11 0 0 0 54 1
                                    0 0 29 55 1 0 29 0 58 2 11 0 0 0 59 1 61 60
                                    29 62 2 11 0 0 64 65 2 11 0 13 0 66 2 11 0
                                    28 0 67 2 11 0 0 0 68 1 69 0 56 70 1 7 73 0
                                    74 2 7 0 0 13 75 2 7 0 0 0 76 0 7 0 77 1 78
                                    7 0 79 1 78 81 0 82 1 83 28 0 84 2 13 44 0
                                    0 85 2 81 86 87 0 88 0 6 0 89 2 7 0 6 13 90
                                    1 11 0 7 91 1 11 0 0 92 2 7 93 93 93 94 2
                                    96 95 11 13 97 2 13 44 0 0 98 1 8 13 0 99 1
                                    11 7 0 100 2 103 101 102 8 104 1 69 44 0
                                    105 1 69 28 0 106 1 69 28 0 107 2 11 0 7 0
                                    108 0 109 0 110 1 96 111 8 112 0 6 13 113 2
                                    11 0 0 13 114 2 11 0 0 28 115 1 11 7 0 116
                                    1 7 0 0 117 1 11 7 0 118 1 7 119 0 120 2 7
                                    122 0 0 123 2 7 0 0 125 126 1 7 0 6 130 2 7
                                    0 0 0 131 2 0 44 0 0 1 1 0 44 0 1 1 0 60 0
                                    1 1 3 157 0 1 1 3 0 0 1 1 3 44 0 1 1 0 36
                                    33 1 0 0 36 1 1 0 11 0 1 1 2 160 28 1 2 0
                                    122 0 0 1 1 2 163 155 1 1 3 0 0 1 1 3 73 0
                                    1 2 0 28 0 137 1 2 2 164 165 155 1 2 7 44 0
                                    0 1 2 3 44 0 0 1 0 7 13 1 0 0 44 1 1 0 44 6
                                    121 1 0 44 7 127 0 0 0 1 1 0 122 0 1 2 0 0
                                    0 125 1 2 0 0 0 13 1 1 0 134 0 1 1 10 172 0
                                    1 1 11 173 0 1 1 0 11 0 1 1 10 143 0 1 1 11
                                    28 0 1 2 0 0 29 33 1 1 0 0 29 55 2 0 0 56 7
                                    1 0 2 159 1 2 3 0 0 0 1 2 0 36 0 33 1 1 0
                                    36 0 1 2 0 135 136 33 1 1 0 36 136 1 1 12
                                    170 136 1 2 12 171 136 33 1 1 0 33 33 1 1 0
                                    0 8 52 1 3 122 146 1 1 0 122 0 1 0 16 145 1
                                    2 0 44 6 6 1 0 0 125 1 0 7 0 1 0 0 44 1 1 0
                                    44 6 46 1 0 44 7 124 2 3 0 0 0 1 1 3 154
                                    149 1 1 0 0 0 1 0 2 0 1 1 2 44 0 1 2 2 0 0
                                    13 1 1 2 0 0 1 1 3 44 0 1 2 0 0 0 125 1 1 2
                                    125 0 1 1 2 167 0 1 2 0 44 0 0 1 1 0 44 0 1
                                    0 0 13 1 1 0 33 33 1 1 0 11 0 1 1 15 144
                                    140 1 1 2 122 0 1 2 3 148 149 0 1 1 3 8 0 1
                                    1 7 125 0 1 1 0 8 0 1 1 0 122 0 1 2 0 0 0
                                    125 1 2 0 0 0 13 1 2 3 156 0 0 1 1 3 0 149
                                    1 2 3 0 0 0 1 1 0 132 0 1 0 0 36 41 0 0 36
                                    40 1 3 0 0 1 2 0 0 56 7 57 0 0 36 39 0 0 36
                                    38 1 0 71 64 72 1 0 60 0 63 0 0 33 35 0 0
                                    33 34 1 0 44 0 1 1 0 44 0 1 2 0 44 0 6 1 2
                                    0 44 0 7 1 0 2 0 1 1 7 0 125 1 0 0 49 51 2
                                    8 168 168 0 1 1 8 169 0 1 0 0 13 1 0 0 0 1
                                    2 3 155 155 155 1 2 3 0 0 0 1 1 3 0 149 1 0
                                    2 162 1 1 2 163 155 1 1 2 163 155 1 1 3 73
                                    0 1 2 3 150 0 0 1 3 3 152 0 0 0 1 2 3 122 0
                                    0 1 2 3 148 149 0 1 1 3 13 0 1 0 7 149 1 3
                                    0 6 0 6 6 1 0 0 49 50 2 3 153 0 0 1 1 0 11
                                    33 1 0 0 11 32 1 2 13 0 1 2 2 166 0 0 1 2 0
                                    0 0 64 1 2 13 0 0 140 1 2 13 0 0 141 1 3 13
                                    0 0 141 142 1 3 13 0 0 140 13 1 1 9 0 0 1 2
                                    9 0 0 13 1 3 3 0 0 147 13 1 2 3 0 0 147 1 2
                                    3 36 33 147 1 0 0 8 42 0 2 0 1 2 0 29 0 33
                                    1 2 0 36 33 33 1 1 0 36 33 1 1 0 29 0 58 1
                                    0 0 29 1 1 0 29 0 1 1 0 8 0 1 1 0 0 8 1 1 7
                                    158 0 1 1 17 139 136 1 1 0 33 33 1 2 0 0 0
                                    0 1 1 0 133 0 1 1 0 0 28 1 1 0 0 11 1 1 0 0
                                    0 1 1 18 0 143 1 1 17 122 0 1 1 2 0 0 1 1 0
                                    8 0 1 0 0 13 1 0 0 44 48 1 0 44 6 128 1 0
                                    44 7 129 0 0 33 1 3 0 0 0 0 0 1 2 3 44 0 0
                                    1 2 0 0 0 0 1 2 0 44 0 0 1 2 0 138 0 64 1 0
                                    0 44 1 2 0 0 0 125 1 2 0 0 0 13 1 2 3 0 0
                                    28 1 2 13 0 0 140 1 3 13 0 0 140 13 1 2 13
                                    0 0 141 1 3 13 0 0 141 142 1 1 9 0 0 1 2 9
                                    0 0 13 1 2 3 0 0 147 1 3 3 0 0 147 13 1 2 0
                                    44 0 0 1 0 0 0 1 0 0 0 1 2 3 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 125 0 1 2
                                    0 0 0 0 1 2 0 0 28 0 1 2 0 0 13 0 1 2 0 0 0
                                    11 1 2 0 0 11 0 1 2 19 0 0 143 1 2 19 0 143
                                    0 1 2 12 0 0 28 1)))))
           '|lookupComplete|)) 
