
(SDEFUN |ALGFF;branchPointAtInfinity?;B;1| ((% (|Boolean|)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 11)))) 

(SDEFUN |ALGFF;discriminant;F;2| ((% (|Fraction| UP)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 14)))) 

(SDEFUN |ALGFF;integralBasis;V;3| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (|ALGFF;vect| (QREFELT % 23) %)))) 

(SDEFUN |ALGFF;integralBasisAtInfinity;V;4| ((% (|Vector| %)))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (|ALGFF;vect| (QREFELT % 26) %)))) 

(SDEFUN |ALGFF;integralMatrix;M;5| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 23)))) 

(SDEFUN |ALGFF;inverseIntegralMatrix;M;6| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 25)))) 

(SDEFUN |ALGFF;integralMatrixAtInfinity;M;7| ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 26)))) 

(SDEFUN |ALGFF;branchPoint?;FB;8| ((|a| (F)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL (QREFELT % 30)) (QREFELT % 37)) |a|
                   (QREFELT % 38))
         (QREFELT % 39))) 

(SDEFUN |ALGFF;definingPolynomial;UPUP;9| ((% (UPUP))) (QREFELT % 9)) 

(SDEFUN |ALGFF;inverseIntegralMatrixAtInfinity;M;10|
        ((% (|Matrix| (|Fraction| UP))))
        (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
             (EXIT (QREFELT % 27)))) 

(SDEFUN |ALGFF;vect| ((|m| (|Matrix| (|Fraction| UP))) (% (|Vector| %)))
        (SPROG ((#1=#:G27 NIL) (|i| NIL) (#2=#:G28 NIL) (#3=#:G26 NIL))
               (SEQ
                (PROGN
                 (LETT #1#
                       (GETREFV
                        (|inc_SI|
                         (- #4=(SPADCALL |m| (QREFELT % 44))
                            #5=(PROGN |m| 1)))))
                 (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL (SPADCALL |m| |i| (QREFELT % 46))
                                          (QREFELT % 47)))))
                      (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(SDEFUN |ALGFF;integralCoordinates;%R;12|
        ((|f| (%)) (% (|Record| (|:| |num| (|Vector| UP)) (|:| |den| UP))))
        (SPADCALL
         (SPADCALL (SPADCALL |f| (QREFELT % 48)) (SPADCALL (QREFELT % 35))
                   (QREFELT % 49))
         (QREFELT % 52))) 

(SDEFUN |ALGFF;knownInfBasis;NniV;13|
        ((|d| (|NonNegativeInteger|)) (% (|Void|)))
        (SPROG
         ((#1=#:G44 NIL) (#2=#:G45 NIL) (|alpha| (|Vector| (|Fraction| UP)))
          (#3=#:G47 NIL) (#4=#:G48 NIL) (#5=#:G46 NIL)
          (|ib| #6=(|Matrix| (|Fraction| UP))) (|invib| #6#) (|i| NIL)
          (#7=#:G49 NIL) (|j| NIL) (#8=#:G50 NIL))
         (SEQ
          (COND
           ((QREFELT % 10)
            (SEQ
             (LETT |alpha|
                   (PROGN
                    (LETT #1# (GETREFV (|inc_SI| #9=(QREFELT % 20))))
                    (SEQ (LETT |i| 0) (LETT #2# #9#) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT #1# |i|
                                   (SPADCALL
                                    (SPADCALL (|spadConstant| % 54) (* |d| |i|)
                                              (QREFELT % 55))
                                    (QREFELT % 56)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    #1#))
             (LETT |ib|
                   (SPADCALL
                    (PROGN
                     (LETT #3#
                           (GETREFV
                            (|inc_SI|
                             (- #10=(QVSIZE |alpha|)
                                #11=(SPADCALL |alpha| (QREFELT % 57))))))
                     (SEQ (LETT |i| #11#) (LETT #4# #10#) (LETT #5# 0) G190
                          (COND ((> |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #5#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT % 58)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #3#)
                    (QREFELT % 59)))
             (LETT |invib| (SPADCALL |alpha| (QREFELT % 59)))
             (EXIT
              (SEQ (LETT |i| (PROGN |ib| 1))
                   (LETT #7# (SPADCALL |ib| (QREFELT % 44))) G190
                   (COND ((> |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib| 1))
                          (LETT #8# (SPADCALL |ib| (QREFELT % 60))) G190
                          (COND ((> |j| #8#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (QAREF2O |ib| |i| |j| 1 1) (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL |invib| |i| |j| (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))))
          (EXIT (SPADCALL (QREFELT % 64)))))) 

(SDEFUN |ALGFF;getInfBasis| ((% (|Void|)))
        (SPROG
         ((|x| (|Fraction| UP)) (|invmod| (UPUP))
          (|r| (|Record| (|:| |coef| (|Fraction| UP)) (|:| |poly| UPUP)))
          (|ninvmod| (|SparseUnivariatePolynomial| UP)) (#1=#:G74 NIL)
          (#2=#:G75 NIL) (|alpha| (|Vector| (|Fraction| UP))) (#3=#:G77 NIL)
          (#4=#:G78 NIL) (#5=#:G76 NIL) (|invalpha| (|Vector| (|Fraction| UP)))
          (|invib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (#6=#:G79 NIL) (#7=#:G80 NIL) (|ib2| #8=(|Matrix| (|Fraction| UP)))
          (|invib2| #8#) (|i| NIL) (#9=#:G81 NIL) (|j| NIL) (#10=#:G82 NIL))
         (SEQ
          (LETT |x|
                (SPADCALL
                 (SPADCALL (SPADCALL (|spadConstant| % 54) 1 (QREFELT % 55))
                           (QREFELT % 56))
                 (QREFELT % 58)))
          (LETT |invmod|
                (SPADCALL (CONS #'|ALGFF;getInfBasis!0| (VECTOR % |x|))
                          (QREFELT % 9) (QREFELT % 69)))
          (LETT |r| (SPADCALL |invmod| (QREFELT % 72)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 16)) (QREFELT % 17)
                       (QREFELT % 73))
             (|error| "Should not happen"))
            ('T
             (SEQ
              (LETT |ninvmod| (SPADCALL (ELT % 37) (QCDR |r|) (QREFELT % 77)))
              (LETT |alpha|
                    (PROGN
                     (LETT #1# (GETREFV (|inc_SI| #11=(QREFELT % 20))))
                     (SEQ (LETT |i| 0) (LETT #2# #11#) G190
                          (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #1# |i|
                                    (SPADCALL
                                     (SPADCALL (QCAR |r|) |i| (QREFELT % 78))
                                     |x| (QREFELT % 67)))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                     #1#))
              (LETT |invalpha|
                    (PROGN
                     (LETT #3#
                           (GETREFV
                            (|inc_SI|
                             (- #12=(QVSIZE |alpha|)
                                #13=(SPADCALL |alpha| (QREFELT % 57))))))
                     (SEQ (LETT |i| #13#) (LETT #4# #12#) (LETT #5# 0) G190
                          (COND ((> |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SETELT #3# #5#
                                    (SPADCALL (QAREF1O |alpha| |i| 1)
                                              (QREFELT % 58)))))
                          (LETT #5#
                                (PROG1 (|inc_SI| #5#) (LETT |i| (+ |i| 1))))
                          (GO G190) G191 (EXIT NIL))
                     #3#))
              (LETT |invib|
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
                                                                (ELT % 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT % 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT % 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT % 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT % 7))
                                              |ninvmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT % 23) 1))
                   (LETT #6# (SPADCALL (QREFELT % 23) (QREFELT % 44))) G190
                   (COND ((> |i| #6#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #7# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #7#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 0) |i| |j|
                                                 (QREFELT % 80))
                                       (QVELT |invib| 1) (QREFELT % 81))
                                      |x| (QREFELT % 67))
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |invib| 2) |i| |j|
                                                 (QREFELT % 80))
                                       |x| (QREFELT % 82))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |ib2|
                    (SPADCALL (QREFELT % 26) (SPADCALL |alpha| (QREFELT % 59))
                              (QREFELT % 83)))
              (LETT |invib2|
                    (SPADCALL (SPADCALL |invalpha| (QREFELT % 59))
                              (QREFELT % 27) (QREFELT % 83)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #9# (SPADCALL |ib2| (QREFELT % 44))) G190
                   (COND ((> |i| #9#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #10# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #10#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 26) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 27) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT % 64)))))))))) 

(SDEFUN |ALGFF;getInfBasis!0| ((|s| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |x| (QREFELT % 67)))))) 

(SDEFUN |ALGFF;startUp| ((|b| (|Boolean|)) (% (|Void|)))
        (SPROG
         ((|nmod| (|SparseUnivariatePolynomial| UP))
          (|ib|
           (|Record| (|:| |basis| (|Matrix| UP)) (|:| |basisDen| UP)
                     (|:| |basisInv| (|Matrix| UP))))
          (#1=#:G105 NIL) (#2=#:G106 NIL) (|ib2| (|Matrix| (|Fraction| UP)))
          (#3=#:G95 NIL) (|invib2| (|Matrix| (|Fraction| UP))) (|i| NIL)
          (#4=#:G107 NIL) (|j| NIL) (#5=#:G108 NIL) (|dsc0| (|Fraction| UP))
          (|dsc| (|Fraction| UP)))
         (SEQ (SETELT % 10 |b|)
              (LETT |nmod| (SPADCALL (ELT % 37) (QREFELT % 9) (QREFELT % 77)))
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
                                                                (ELT % 7))))))
                                            (|FunctionFieldIntegralBasis|
                                             (ELT % 7)
                                             (|SparseUnivariatePolynomial|
                                              (ELT % 7))
                                             (|SimpleAlgebraicExtension|
                                              (ELT % 7)
                                              (|SparseUnivariatePolynomial|
                                               (ELT % 7))
                                              |nmod|)))))
              (SEQ (LETT |i| (PROGN (QREFELT % 23) 1))
                   (LETT #1# (SPADCALL (QREFELT % 23) (QREFELT % 44))) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN (QREFELT % 23) 1))
                          (LETT #2# (SPADCALL (QREFELT % 23) (QREFELT % 60)))
                          G190 (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (QSETAREF2O (QREFELT % 23) |i| |j|
                                       (SPADCALL
                                        (SPADCALL (QVELT |ib| 0) |i| |j|
                                                  (QREFELT % 80))
                                        (QVELT |ib| 1) (QREFELT % 81))
                                       1 1)
                           (EXIT
                            (SPADCALL (QREFELT % 25) |i| |j|
                                      (SPADCALL
                                       (SPADCALL (QVELT |ib| 2) |i| |j|
                                                 (QREFELT % 80))
                                       (QREFELT % 56))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL
                 (SPADCALL (QREFELT % 26) (PROGN (QREFELT % 26) 1)
                           (PROGN (QREFELT % 26) 1) (QREFELT % 62))
                 (QREFELT % 84))
                (|ALGFF;getInfBasis| %)))
              (LETT |ib2|
                    (SPADCALL
                     (SPADCALL (|ALGFF;vect| (QREFELT % 23) %) (QREFELT % 85))
                     (QREFELT % 86)))
              (LETT |invib2|
                    (PROG2 (LETT #3# (SPADCALL |ib2| (QREFELT % 88)))
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Matrix| (|Fraction| (QREFELT % 7)))
                                      (|Union|
                                       (|Matrix| (|Fraction| (QREFELT % 7)))
                                       "failed")
                                      #3#)))
              (SEQ (LETT |i| (PROGN |ib2| 1))
                   (LETT #4# (SPADCALL |ib2| (QREFELT % 44))) G190
                   (COND ((> |i| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| (PROGN |ib2| 1))
                          (LETT #5# (SPADCALL |ib2| (QREFELT % 60))) G190
                          (COND ((> |j| #5#) (GO G191)))
                          (SEQ
                           (SPADCALL (QREFELT % 23) |i| |j|
                                     (QAREF2O |ib2| |i| |j| 1 1)
                                     (QREFELT % 61))
                           (EXIT
                            (SPADCALL (QREFELT % 25) |i| |j|
                                      (SPADCALL |invib2| |i| |j|
                                                (QREFELT % 62))
                                      (QREFELT % 61))))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (LETT |dsc|
                    (SPADCALL (QREFELT % 9)
                              (SPADCALL (QREFELT % 9) (QREFELT % 89))
                              (QREFELT % 90)))
              (LETT |dsc0|
                    (SPADCALL |dsc|
                              (SPADCALL
                               (SPADCALL (QREFELT % 26) (QREFELT % 91)) 2
                               (QREFELT % 78))
                              (QREFELT % 92)))
              (EXIT
               (COND
                ((> (SPADCALL (SPADCALL |dsc0| (QREFELT % 93)) (QREFELT % 94))
                    (SPADCALL (SPADCALL |dsc0| (QREFELT % 95)) (QREFELT % 94)))
                 (|error| "Shouldn't happen"))
                ('T
                 (SEQ
                  (SETELT % 11
                          (<
                           (SPADCALL (SPADCALL |dsc0| (QREFELT % 93))
                                     (QREFELT % 94))
                           (SPADCALL (SPADCALL |dsc0| (QREFELT % 95))
                                     (QREFELT % 94))))
                  (LETT |dsc|
                        (SPADCALL |dsc|
                                  (SPADCALL
                                   (SPADCALL (QREFELT % 23) (QREFELT % 91)) 2
                                   (QREFELT % 78))
                                  (QREFELT % 92)))
                  (SETELT % 14
                          (SPADCALL
                           (SPADCALL (SPADCALL |dsc| (QREFELT % 93))
                                     (QREFELT % 96))
                           (SPADCALL |dsc| (QREFELT % 95)) (QREFELT % 81)))
                  (EXIT (SPADCALL (QREFELT % 64)))))))))) 

(SDEFUN |ALGFF;integralDerivationMatrix;MR;16|
        ((|d| (|Mapping| UP UP))
         (% (|Record| (|:| |num| (|Matrix| UP)) (|:| |den| UP))))
        (SPROG
         ((|w| (|Vector| %)) (#1=#:G127 NIL) (|i| NIL) (#2=#:G128 NIL)
          (#3=#:G126 NIL))
         (SEQ (LETT |w| (SPADCALL (QREFELT % 32)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #1#
                         (GETREFV
                          (|inc_SI|
                           (- #4=(SPADCALL |w| (QREFELT % 99))
                              #5=(SPADCALL |w| (QREFELT % 98))))))
                   (SEQ (LETT |i| #5#) (LETT #2# #4#) (LETT #3# 0) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #1# #3#
                                  (SPADCALL (SPADCALL |w| |i| (QREFELT % 100))
                                            |d| (QREFELT % 102)))))
                        (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (+ |i| 1))))
                        (GO G190) G191 (EXIT NIL))
                   #1#)
                  (QREFELT % 86))
                 (SPADCALL (QREFELT % 35)) (QREFELT % 83))
                (QREFELT % 105)))))) 

(SDEFUN |ALGFF;integralRepresents;VUP%;17|
        ((|v| (|Vector| UP)) (|d| (UP)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL (SPADCALL |v| |d| (QREFELT % 108)) (QREFELT % 48))
                   (SPADCALL (QREFELT % 34)) (QREFELT % 49))
         (QREFELT % 47))) 

(SDEFUN |ALGFF;branchPoint?;UPB;18| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|r| (|Union| F "failed")))
               (SEQ (COND ((QREFELT % 10) (|ALGFF;startUp| NIL %)))
                    (LETT |r| (SPADCALL |p| (QREFELT % 111)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 40)))
                      ('T
                       (NULL
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL (QREFELT % 30)) (QREFELT % 37))
                          |p| (QREFELT % 112))
                         (QREFELT % 113))))))))) 

(DECLAIM (NOTINLINE |AlgebraicFunctionField;|)) 

(DEFUN |AlgebraicFunctionField;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G183 NIL) (#2=#:G182 NIL) (|pv$| NIL) (#3=#:G4 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT |dv$| (LIST '|AlgebraicFunctionField| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 159))
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
    (|haddProp| |$ConstructorCache| '|AlgebraicFunctionField|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
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
    (QSETREFV % 10 'T)
    (QSETREFV % 11 'T)
    (QSETREFV % 14 (|spadConstant| % 13))
    (QSETREFV % 17 (SPADCALL |#4| (QREFELT % 16)))
    (QSETREFV % 20
              (PROG1 (LETT #3# (- (QREFELT % 17) 1))
                (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #3#)))
    (QSETREFV % 23 (SPADCALL (QREFELT % 17) (QREFELT % 17) (QREFELT % 22)))
    (QSETREFV % 25 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    (QSETREFV % 26 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    (QSETREFV % 27 (SPADCALL (QREFELT % 23) (QREFELT % 24)))
    %))) 

(DEFUN |AlgebraicFunctionField| (&REST #1=#:G184)
  (SPROG NIL
         (PROG (#2=#:G185)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL))
                     (HGET |$ConstructorCache| '|AlgebraicFunctionField|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AlgebraicFunctionField;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AlgebraicFunctionField|)))))))))) 

(MAKEPROP '|AlgebraicFunctionField| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SimpleAlgebraicExtension| 12 8 (NRTEVAL (QREFELT % 9)))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|brandNew?| '|infBr?| (|Fraction| 7) (0 . |0|) '|discPoly|
              (|NonNegativeInteger|) (4 . |degree|) '|n| (9 . |1|) (13 . |1|)
              '|n1| (|Matrix| 12) (17 . |zero|) '|ibasis| (23 . |copy|)
              '|invibasis| '|infbasis| '|invinfbasis| (|Boolean|)
              |ALGFF;branchPointAtInfinity?;B;1| |ALGFF;discriminant;F;2|
              (|Vector| %) |ALGFF;integralBasis;V;3|
              |ALGFF;integralBasisAtInfinity;V;4| |ALGFF;integralMatrix;M;5|
              |ALGFF;inverseIntegralMatrix;M;6|
              |ALGFF;integralMatrixAtInfinity;M;7| (28 . |retract|)
              (33 . |elt|) (39 . |zero?|) |ALGFF;branchPoint?;FB;8|
              |ALGFF;definingPolynomial;UPUP;9|
              |ALGFF;inverseIntegralMatrixAtInfinity;M;10| (|Integer|)
              (44 . |maxRowIndex|) (|Vector| 12) (49 . |row|)
              (55 . |represents|) (60 . |coordinates|) (65 . *)
              (|Record| (|:| |num| 107) (|:| |den| 7))
              (|InnerCommonDenominator| 7 12 107 45) (71 . |splitDenominator|)
              |ALGFF;integralCoordinates;%R;12| (76 . |1|) (80 . |monomial|)
              (86 . |coerce|) (91 . |minIndex|) (96 . |inv|)
              (101 . |diagonalMatrix|) (106 . |maxColIndex|) (111 . |setelt!|)
              (119 . |elt|) (|Void|) (126 . |void|)
              |ALGFF;knownInfBasis;NniV;13| (|Fraction| %) (130 . |elt|)
              (|Mapping| 12 12) (136 . |map|)
              (|Record| (|:| |coef| 12) (|:| |poly| 8))
              (|ChangeOfVariable| 6 7 8) (142 . |mkIntegral|) (147 . ~=)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 12)
              (|UnivariatePolynomialCategoryFunctions2| 12 8 7 74)
              (153 . |map|) (159 . ^) (|Matrix| 7) (165 . |elt|) (172 . /)
              (178 . |elt|) (184 . *) (190 . |zero?|)
              (195 . |normalizeAtInfinity|) (200 . |coordinates|)
              (|Union| % '"failed") (205 . |inverse|) (210 . |differentiate|)
              (215 . |resultant|) (221 . |determinant|) (226 . *)
              (232 . |numer|) (237 . |degree|) (242 . |denom|)
              (247 . |primitivePart|) (|Vector| $$) (252 . |minIndex|)
              (257 . |maxIndex|) (262 . |elt|) (|Mapping| 7 7)
              (268 . |differentiate|) (|Record| (|:| |num| 79) (|:| |den| 7))
              (|MatrixCommonDenominator| 7 12) (274 . |splitDenominator|)
              |ALGFF;integralDerivationMatrix;MR;16| (|Vector| 7)
              (279 . |represents|) |ALGFF;integralRepresents;VUP%;17|
              (|Union| 6 '#1="failed") (285 . |retractIfCan|) (290 . |gcd|)
              (296 . |ground?|) |ALGFF;branchPoint?;UPB;18| (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Union| 12 '#1#) (|Matrix| %)
              (|Record| (|:| |mat| 21) (|:| |vec| 45)) (|List| 7)
              (|Union| 7 '"failed")
              (|Record| (|:| |num| %) (|:| |den| 7) (|:| |derivden| 7)
                        (|:| |gd| 7))
              (|Union| 31 '#2="failed") (|List| 126) (|Symbol|) (|List| 15)
              (|Fraction| 43) (|List| (|Polynomial| 6)) (|List| (|List| 6))
              (|Fraction| 8) (|Factored| %) (|Union| 134 '#3="failed")
              (|List| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 135 '#3#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 134) (|:| |generator| %))
              (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|InputForm|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 43) (|:| |exponent| 15)) (|List| 145)
              (|Table| 117 15) (|Factored| 140) (|Union| 150 '#2#) (|List| 140)
              (|OnePointCompletion| 117) (|Union| 15 '"failed") (|HashState|)
              (|SingleInteger|) (|Matrix| 43)
              (|Record| (|:| |mat| 155) (|:| |vec| (|Vector| 43)))
              (|Union| 128 '#1#) (|Union| 43 '#1#))
           '#(~= 301 |zero?| 307 |yCoordinates| 312 |unitNormal| 317
              |unitCanonical| 322 |unit?| 327 |traceMatrix| 332 |trace| 341
              |tableForDiscreteLogarithm| 346 |subtractIfCan| 351
              |squareFreePolynomial| 357 |squareFreePart| 362 |squareFree| 367
              |special_order| 372 |solveLinearPolynomialEquation| 378
              |smaller?| 384 |sizeLess?| 390 |size| 396 |singularAtInfinity?|
              400 |singular?| 404 |sample| 414 |rightRecip| 418 |rightPower|
              423 |retractIfCan| 435 |retract| 450 |represents| 465
              |representationType| 482 |rem| 486 |regularRepresentation| 492
              |reducedSystem| 503 |reduceBasisAtInfinity| 525 |reduce| 530
              |recip| 540 |rationalPoints| 545 |rationalPoint?| 549 |rank| 555
              |random| 559 |ramifiedAtInfinity?| 563 |ramified?| 567 |quo| 577
              |principalIdeal| 583 |primitivePart| 588 |primitiveElement| 593
              |primitive?| 597 |primeFrobenius| 602 |prime?| 613 |plenaryPower|
              618 |order| 624 |opposite?| 634 |one?| 640 |numberOfComponents|
              645 |normalizeAtInfinity| 649 |norm| 654 |nonSingularModel| 659
              |nextItem| 664 |multiEuclidean| 669 |minimalPolynomial| 675
              |lookup| 680 |lift| 685 |leftRecip| 690 |leftPower| 695 |lcmCoef|
              707 |lcm| 713 |latex| 724 |knownInfBasis| 729
              |inverseIntegralMatrixAtInfinity| 734 |inverseIntegralMatrix| 738
              |inv| 742 |integralRepresents| 747 |integralMatrixAtInfinity| 753
              |integralMatrix| 757 |integralDerivationMatrix| 761
              |integralCoordinates| 766 |integralBasisAtInfinity| 771
              |integralBasis| 775 |integralAtInfinity?| 779 |integral?| 784
              |init| 801 |index| 805 |hyperelliptic| 810 |hashUpdate!| 814
              |hash| 820 |genus| 825 |generator| 829 |gcdPolynomial| 833 |gcd|
              839 |factorsOfCyclicGroupSize| 850 |factorSquareFreePolynomial|
              854 |factorPolynomial| 859 |factor| 864 |extendedEuclidean| 869
              |exquo| 882 |expressIdealMember| 888 |euclideanSize| 894
              |enumerate| 899 |elt| 903 |elliptic| 910 |divide| 914
              |discriminant| 920 |discreteLog| 929 |differentiate| 940
              |derivationCoordinates| 996 |definingPolynomial| 1002
              |createPrimitiveElement| 1006 |coordinates| 1010 |convert| 1032
              |conditionP| 1057 |complementaryBasis| 1062 |commutator| 1067
              |coerce| 1073 |charthRoot| 1098 |characteristicPolynomial| 1108
              |characteristic| 1113 |branchPointAtInfinity?| 1117
              |branchPoint?| 1121 |basis| 1131 |associator| 1135 |associates?|
              1142 |antiCommutator| 1148 |annihilate?| 1154 |algSplitSimple|
              1160 |absolutelyIrreducible?| 1166 ^ 1170 D 1188 = 1238 |1| 1244
              |0| 1248 / 1252 - 1258 + 1269 * 1275)
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
                 (|PartialDifferentialRing| 126) (|DifferentialRing|)
                 (|Algebra| 128) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| (|Fraction| 7)) (|Ring|)
                 (|NonAssociativeAlgebra| 128) (|SemiRing|)
                 (|NonAssociativeAlgebra| (|Fraction| 7)) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|Module| 128) (|SemiRng|)
                 (|Module| (|Fraction| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| (|Fraction| 7))
                 (|LinearlyExplicitOver| 43) (|BiModule| 128 128)
                 (|NonAssociativeRing|)
                 (|BiModule| (|Fraction| 7) (|Fraction| 7))
                 (|FramedModule| (|Fraction| 7)) (|BiModule| $$ $$)
                 (|LinearlyExplicitOver| (|Fraction| 7)) (|RightModule| 43)
                 (|RightModule| 128) (|LeftModule| 128) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| (|Fraction| 7))
                 (|LeftModule| $$) (|RightModule| (|Fraction| 7))
                 (|AbelianGroup|) (|Finite|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|Comparable|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|StepThrough|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|FullyRetractableTo| (|Fraction| 7)) (|RetractableTo| 43)
                 (|RetractableTo| 128) (|Hashable|) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| (|Fraction| 7))
                 (|CoercibleFrom| 43) (|CoercibleFrom| 128)
                 (|ConvertibleTo| 143) (|CharacteristicNonZero|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|CharacteristicZero|) (|CoercibleTo| 116)
                 (|BasicType|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 8) (|CoercibleFrom| (|Fraction| 7)))
              (|makeByteWordVec2| 158
                                  '(0 12 0 13 1 8 15 0 16 0 8 0 18 0 0 0 19 2
                                    21 0 15 15 22 1 21 0 0 24 1 12 7 0 37 2 7 6
                                    0 6 38 1 6 28 0 39 1 21 43 0 44 2 21 45 0
                                    43 46 1 0 0 45 47 1 0 45 0 48 2 21 45 45 0
                                    49 1 51 50 45 52 0 6 0 54 2 7 0 6 15 55 1
                                    12 0 7 56 1 45 43 0 57 1 12 0 0 58 1 21 0
                                    45 59 1 21 43 0 60 4 21 12 0 43 43 12 61 3
                                    21 12 0 43 43 62 0 63 0 64 2 7 66 66 66 67
                                    2 8 0 68 0 69 1 71 70 8 72 2 15 28 0 0 73 2
                                    76 74 75 8 77 2 12 0 0 43 78 3 79 7 0 43 43
                                    80 2 12 0 7 7 81 2 7 66 0 66 82 2 21 0 0 0
                                    83 1 12 28 0 84 1 0 31 31 85 1 0 21 31 86 1
                                    21 87 0 88 1 8 0 0 89 2 8 12 0 0 90 1 21 12
                                    0 91 2 12 0 0 0 92 1 12 7 0 93 1 7 15 0 94
                                    1 12 7 0 95 1 7 0 0 96 1 97 43 0 98 1 97 43
                                    0 99 2 97 2 0 43 100 2 0 0 0 101 102 1 104
                                    103 21 105 2 0 0 107 7 108 1 7 110 0 111 2
                                    7 0 0 0 112 1 7 28 0 113 2 0 28 0 0 1 1 0
                                    28 0 1 1 0 50 0 1 1 3 142 0 1 1 3 0 0 1 1 3
                                    28 0 1 1 0 21 31 1 0 0 21 1 1 0 12 0 1 1 2
                                    147 43 1 2 0 87 0 0 1 1 2 148 140 1 1 3 0 0
                                    1 1 3 132 0 1 2 0 43 0 121 1 2 2 149 150
                                    140 1 2 7 28 0 0 1 2 3 28 0 0 1 0 7 15 1 0
                                    0 28 1 1 0 28 7 1 1 0 28 6 1 0 0 0 1 1 0 87
                                    0 1 2 0 0 0 117 1 2 0 0 0 15 1 1 0 118 0 1
                                    1 10 157 0 1 1 11 158 0 1 1 0 12 0 1 1 10
                                    128 0 1 1 11 43 0 1 2 0 0 45 31 1 1 0 0 45
                                    47 2 0 0 107 7 108 0 2 144 1 2 3 0 0 0 1 2
                                    0 21 0 31 1 1 0 21 0 1 1 0 21 119 1 2 0 120
                                    119 31 1 1 12 155 119 1 2 12 156 119 31 1 1
                                    0 31 31 1 1 0 0 8 1 1 3 87 131 1 1 0 87 0 1
                                    0 16 130 1 2 0 28 6 6 1 0 0 117 1 0 7 0 1 0
                                    0 28 1 1 0 28 7 1 1 0 28 6 1 2 3 0 0 0 1 1
                                    3 139 134 1 1 0 0 0 1 0 2 0 1 1 2 28 0 1 2
                                    2 0 0 15 1 1 2 0 0 1 1 3 28 0 1 2 0 0 0 117
                                    1 1 2 117 0 1 1 2 151 0 1 2 0 28 0 0 1 1 0
                                    28 0 1 0 0 15 1 1 0 31 31 85 1 0 12 0 1 1
                                    15 129 126 1 1 2 87 0 1 2 3 133 134 0 1 1 3
                                    8 0 1 1 7 117 0 1 1 0 8 0 1 1 0 87 0 1 2 0
                                    0 0 117 1 2 0 0 0 15 1 2 3 141 0 0 1 2 3 0
                                    0 0 1 1 3 0 134 1 1 0 115 0 1 1 0 63 15 65
                                    0 0 21 42 0 0 21 35 1 3 0 0 1 2 0 0 107 7
                                    109 0 0 21 36 0 0 21 34 1 0 103 101 106 1 0
                                    50 0 53 0 0 31 33 0 0 31 32 1 0 28 0 1 1 0
                                    28 0 1 2 0 28 0 7 1 2 0 28 0 6 1 0 2 0 1 1
                                    7 0 117 1 0 0 122 1 2 8 153 153 0 1 1 8 154
                                    0 1 0 0 15 1 0 0 0 1 2 3 140 140 140 1 1 3
                                    0 134 1 2 3 0 0 0 1 0 2 146 1 1 2 148 140 1
                                    1 2 148 140 1 1 3 132 0 1 3 3 136 0 0 0 1 2
                                    3 137 0 0 1 2 3 87 0 0 1 2 3 133 134 0 1 1
                                    3 15 0 1 0 7 134 1 3 0 6 0 6 6 1 0 0 122 1
                                    2 3 138 0 0 1 1 0 12 31 1 0 0 12 30 1 2 15
                                    0 1 2 2 152 0 0 1 2 0 0 0 101 102 2 13 0 0
                                    125 1 2 13 0 0 126 1 3 13 0 0 126 15 1 3 13
                                    0 0 125 127 1 1 9 0 0 1 2 9 0 0 15 1 3 3 0
                                    0 68 15 1 2 3 0 0 68 1 2 3 21 31 68 1 0 0 8
                                    41 0 2 0 1 2 0 45 0 31 1 2 0 21 31 31 1 1 0
                                    45 0 48 1 0 21 31 86 1 0 0 45 1 1 0 45 0 1
                                    1 0 8 0 1 1 0 0 8 1 1 7 143 0 1 1 17 124
                                    119 1 1 0 31 31 1 2 0 0 0 0 1 1 0 116 0 1 1
                                    0 0 43 1 1 0 0 12 1 1 0 0 0 1 1 18 0 128 1
                                    1 17 87 0 1 1 2 0 0 1 1 0 8 0 1 0 0 15 1 0
                                    0 28 29 1 0 28 7 114 1 0 28 6 40 0 0 31 1 3
                                    0 0 0 0 0 1 2 3 28 0 0 1 2 0 0 0 0 1 2 0 28
                                    0 0 1 2 0 123 0 101 1 0 0 28 1 2 0 0 0 117
                                    1 2 0 0 0 15 1 2 3 0 0 43 1 2 13 0 0 126 1
                                    2 13 0 0 125 1 3 13 0 0 125 127 1 3 13 0 0
                                    126 15 1 1 9 0 0 1 2 9 0 0 15 1 3 3 0 0 68
                                    15 1 2 3 0 0 68 1 2 0 28 0 0 1 0 0 0 19 0 0
                                    0 1 2 3 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 117 0 1 2 0 0 0 0 1 2 0 0 43 0
                                    1 2 0 0 15 0 1 2 0 0 0 12 1 2 0 0 12 0 1 2
                                    19 0 0 128 1 2 19 0 128 0 1 2 12 0 0 43
                                    1)))))
           '|lookupComplete|)) 
