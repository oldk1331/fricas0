
(SDEFUN |POLYCAT-;eval;SLS;1| ((|p| (S)) (|l| (|List| (|Equation| S))) (% (S)))
        (SPROG
         ((#1=#:G49 NIL) (#2=#:G48 NIL) (#3=#:G50 NIL) (#4=#:G51 NIL)
          (|lvar| (|List| |VarSet|)) (#5=#:G52 NIL) (|e| NIL) (#6=#:G53 NIL))
         (SEQ
          (COND ((NULL |l|) |p|)
                ('T
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((QEQCAR
                              (SPADCALL (SPADCALL |e| (QREFELT % 11))
                                        (QREFELT % 13))
                              1)
                             (PROGN
                              (LETT #2#
                                    (|error|
                                     "cannot find a variable to evaluate"))
                              (GO #7=#:G40))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #7# (EXIT #2#))
                  (LETT |lvar|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |e| NIL) (LETT #4# |l|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |e| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL (SPADCALL |e| (QREFELT % 11))
                                                 (QREFELT % 14))
                                       #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (SPADCALL |p| |lvar|
                             (PROGN
                              (LETT #5# NIL)
                              (SEQ (LETT |e| NIL) (LETT #6# |l|) G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |e| (CAR #6#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #5#
                                           (CONS (SPADCALL |e| (QREFELT % 15))
                                                 #5#))))
                                   (LETT #6# (CDR #6#)) (GO G190) G191
                                   (EXIT (NREVERSE #5#))))
                             (QREFELT % 18))))))))) 

(SDEFUN |POLYCAT-;isPlus;SU;2| ((|p| (S)) (% (|Union| (|List| S) "failed")))
        (SPROG ((|l| (|List| S)))
               (COND
                ((NULL (CDR (LETT |l| (SPADCALL |p| (QREFELT % 21)))))
                 (CONS 1 "failed"))
                ('T (CONS 0 |l|))))) 

(SDEFUN |POLYCAT-;isTimes;SU;3| ((|p| (S)) (% (|Union| (|List| S) "failed")))
        (SPROG
         ((|lv| (|List| |VarSet|)) (#1=#:G72 NIL) (|v| NIL) (#2=#:G73 NIL)
          (|l| (|List| S)) (|r| (R)))
         (SEQ
          (COND
           ((OR (NULL (LETT |lv| (SPADCALL |p| (QREFELT % 24))))
                (NULL (SPADCALL |p| (QREFELT % 26))))
            (CONS 1 "failed"))
           ('T
            (SEQ
             (LETT |l|
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |v| NIL) (LETT #2# |lv|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS
                                  (SPADCALL (|spadConstant| % 27) |v|
                                            (SPADCALL |p| |v| (QREFELT % 31))
                                            (QREFELT % 32))
                                  #1#))))
                         (LETT #2# (CDR #2#)) (GO G190) G191
                         (EXIT (NREVERSE #1#)))))
             (LETT |r| (SPADCALL |p| (QREFELT % 33)))
             (EXIT
              (COND
               ((SPADCALL |r| (|spadConstant| % 34) (QREFELT % 35))
                (COND ((NULL (CDR |lv|)) (CONS 1 "failed"))
                      (#3='T (CONS 0 |l|))))
               (#3# (CONS 0 (CONS (SPADCALL |r| (QREFELT % 36)) |l|))))))))))) 

(SDEFUN |POLYCAT-;isExpt;SU;4|
        ((|p| (S))
         (%
          (|Union|
           (|Record| (|:| |var| |VarSet|)
                     (|:| |exponent| (|NonNegativeInteger|)))
           "failed")))
        (SPROG ((|u| (|Union| |VarSet| "failed")) (|d| (|NonNegativeInteger|)))
               (SEQ (LETT |u| (SPADCALL |p| (QREFELT % 38)))
                    (EXIT
                     (COND
                      ((OR (QEQCAR |u| 1)
                           (NULL
                            (SPADCALL |p|
                                      (SPADCALL (|spadConstant| % 27)
                                                (QCDR |u|)
                                                (LETT |d|
                                                      (SPADCALL |p| (QCDR |u|)
                                                                (QREFELT %
                                                                         31)))
                                                (QREFELT % 32))
                                      (QREFELT % 39))))
                       (CONS 1 "failed"))
                      ('T (CONS 0 (CONS (QCDR |u|) |d|)))))))) 

(SDEFUN |POLYCAT-;coefficient;SVarSetNniS;5|
        ((|p| (S)) (|v| (|VarSet|)) (|n| (|NonNegativeInteger|)) (% (S)))
        (SPADCALL (SPADCALL |p| |v| (QREFELT % 44)) |n| (QREFELT % 46))) 

(SDEFUN |POLYCAT-;coefficient;SLLS;6|
        ((|p| (S)) (|lv| (|List| |VarSet|))
         (|ln| (|List| (|NonNegativeInteger|))) (% (S)))
        (COND
         ((NULL |lv|)
          (COND ((NULL |ln|) |p|)
                (#1='T (|error| "mismatched lists in coefficient"))))
         ((NULL |ln|) (|error| "mismatched lists in coefficient"))
         (#1#
          (SPADCALL
           (SPADCALL (SPADCALL |p| (|SPADfirst| |lv|) (QREFELT % 44))
                     (|SPADfirst| |ln|) (QREFELT % 46))
           (CDR |lv|) (CDR |ln|) (QREFELT % 49))))) 

(SDEFUN |POLYCAT-;retract;SVarSet;7| ((|p| (S)) (% (|VarSet|)))
        (SPROG ((#1=#:G94 NIL) (|q| (|VarSet|)))
               (SEQ
                (LETT |q|
                      (PROG2 (LETT #1# (SPADCALL |p| (QREFELT % 38)))
                          (QCDR #1#)
                        (|check_union2| (QEQCAR #1# 0) (QREFELT % 9)
                                        (|Union| (QREFELT % 9) "failed") #1#)))
                (EXIT
                 (COND
                  ((SPADCALL (SPADCALL |q| (QREFELT % 51)) |p| (QREFELT % 39))
                   |q|)
                  ('T (|error| "Polynomial is not a single variable"))))))) 

(SDEFUN |POLYCAT-;retractIfCan;SU;8|
        ((|p| (S)) (% (|Union| |VarSet| "failed")))
        (SPROG ((|q| (|Union| |VarSet| "failed")) (#1=#:G105 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |q| (SPADCALL |p| (QREFELT % 38)))
                       (EXIT
                        (COND
                         ((QEQCAR |q| 0)
                          (COND
                           ((SPADCALL (SPADCALL (QCDR |q|) (QREFELT % 51)) |p|
                                      (QREFELT % 39))
                            (PROGN (LETT #1# |q|) (GO #2=#:G103))))))))
                  (EXIT (CONS 1 "failed"))))
                #2# (EXIT #1#)))) 

(SDEFUN |POLYCAT-;totalDegree;SNni;9| ((|p| (S)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G107 NIL) (|d| (|NonNegativeInteger|))
          (|u| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 54)) 0)
                ('T
                 (SEQ
                  (LETT |u|
                        (SPADCALL |p|
                                  (PROG2
                                      (LETT #1# (SPADCALL |p| (QREFELT % 38)))
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0)
                                                    (QREFELT % 9)
                                                    (|Union| (QREFELT % 9)
                                                             "failed")
                                                    #1#))
                                  (QREFELT % 44)))
                  (LETT |d| 0)
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |u| (|spadConstant| % 57) (QREFELT % 58)))
                         (GO G191)))
                       (SEQ
                        (LETT |d|
                              (MAX |d|
                                   (+ (SPADCALL |u| (QREFELT % 59))
                                      (SPADCALL (SPADCALL |u| (QREFELT % 60))
                                                (QREFELT % 61)))))
                        (EXIT (LETT |u| (SPADCALL |u| (QREFELT % 62)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |d|))))))) 

(SDEFUN |POLYCAT-;totalDegreeSorted;SLNni;10|
        ((|p| (S)) (|lv| (|List| |VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G118 NIL) (|v| (|VarSet|)) (#2=#:G131 NIL) (|v0| (|VarSet|))
          (|w| #3=(|NonNegativeInteger|)) (|d| #3#)
          (|u| (|SparseUnivariatePolynomial| S)))
         (SEQ
          (EXIT
           (COND ((OR (SPADCALL |p| (QREFELT % 54)) (NULL |lv|)) 0)
                 ('T
                  (SEQ
                   (LETT |u|
                         (SPADCALL |p|
                                   (LETT |v|
                                         (PROG2
                                             (LETT #1#
                                                   (SPADCALL |p|
                                                             (QREFELT % 38)))
                                             (QCDR #1#)
                                           (|check_union2| (QEQCAR #1# 0)
                                                           (QREFELT % 9)
                                                           (|Union|
                                                            (QREFELT % 9)
                                                            "failed")
                                                           #1#)))
                                   (QREFELT % 44)))
                   (LETT |d| 0) (LETT |w| 0) (LETT |v0| (|SPADfirst| |lv|))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |v| |v0| (QREFELT % 64))) (GO G191)))
                        (SEQ (LETT |lv| (CDR |lv|))
                             (EXIT
                              (COND
                               ((NULL |lv|)
                                (PROGN (LETT #2# 0) (GO #4=#:G130)))
                               ('T (LETT |v0| (|SPADfirst| |lv|))))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (COND
                    ((SPADCALL |v0| |v| (QREFELT % 65))
                     (SEQ (LETT |w| 1) (EXIT (LETT |lv| (CDR |lv|))))))
                   (SEQ G190
                        (COND
                         ((NULL
                           (SPADCALL |u| (|spadConstant| % 57) (QREFELT % 58)))
                          (GO G191)))
                        (SEQ
                         (LETT |d|
                               (MAX |d|
                                    (+ (* |w| (SPADCALL |u| (QREFELT % 59)))
                                       (SPADCALL (SPADCALL |u| (QREFELT % 60))
                                                 |lv| (QREFELT % 66)))))
                         (EXIT (LETT |u| (SPADCALL |u| (QREFELT % 62)))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (EXIT |d|)))))
          #4# (EXIT #2#)))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11|
        ((|p| (S)) (|lv| (|List| |VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG ((|lv1| (|List| |VarSet|)))
               (SEQ
                (LETT |lv1|
                      (SPADCALL (CONS #'|POLYCAT-;totalDegree;SLNni;11!0| %)
                                |lv| (QREFELT % 69)))
                (EXIT (SPADCALL |p| |lv1| (QREFELT % 66)))))) 

(SDEFUN |POLYCAT-;totalDegree;SLNni;11!0| ((|v1| NIL) (|v2| NIL) (% NIL))
        (SPADCALL |v2| |v1| (QREFELT % 64))) 

(SDEFUN |POLYCAT-;resultant;2SVarSetS;12|
        ((|p1| (S)) (|p2| (S)) (|mvar| (|VarSet|)) (% (S)))
        (SPADCALL (SPADCALL |p1| |mvar| (QREFELT % 44))
                  (SPADCALL |p2| |mvar| (QREFELT % 44)) (QREFELT % 71))) 

(SDEFUN |POLYCAT-;discriminant;SVarSetS;13|
        ((|p| (S)) (|var| (|VarSet|)) (% (S)))
        (SPADCALL (SPADCALL |p| |var| (QREFELT % 44)) (QREFELT % 73))) 

(SDEFUN |POLYCAT-;allMonoms| ((|l| (|List| S)) (% (|List| S)))
        (SPROG ((#1=#:G143 NIL) (|p| NIL) (#2=#:G144 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |p| NIL) (LETT #2# |l|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1# (CONS (SPADCALL |p| (QREFELT % 75)) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#))))
                  (QREFELT % 77))
                 (QREFELT % 78))))) 

(SDEFUN |POLYCAT-;P2R|
        ((|p| (S)) (|b| (|List| E)) (|n| (|NonNegativeInteger|))
         (% (|Vector| R)))
        (SPROG
         ((|w| (|Vector| R)) (|bj| NIL) (#1=#:G150 NIL) (|i| NIL)
          (#2=#:G149 NIL))
         (SEQ (LETT |w| (MAKEARR1 |n| (|spadConstant| % 56)))
              (SEQ (LETT |bj| NIL) (LETT #1# |b|)
                   (LETT |i| (SPADCALL |w| (QREFELT % 81)))
                   (LETT #2# (QVSIZE |w|)) G190
                   (COND
                    ((OR (> |i| #2#) (ATOM #1#)
                         (PROGN (LETT |bj| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1O |w| |i| (SPADCALL |p| |bj| (QREFELT % 82))
                                 1)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |w|)))) 

(SDEFUN |POLYCAT-;eq2R| ((|l| (|List| S)) (|b| (|List| E)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G156 NIL) (|bj| NIL) (#2=#:G157 NIL) (#3=#:G158 NIL) (|p| NIL)
          (#4=#:G159 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |bj| NIL) (LETT #2# |b|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |bj| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #1#
                         (CONS
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |p| NIL) (LETT #4# |l|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |p| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (SPADCALL |p| |bj| (QREFELT % 82))
                                         #3#))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          #1#))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #1#))))
           (QREFELT % 85))))) 

(SDEFUN |POLYCAT-;reducedSystem;MM;17| ((|m| (|Matrix| S)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G175 NIL) (|r| NIL) (#2=#:G176 NIL) (|b| (|List| S))
          (#3=#:G177 NIL) (|bj| NIL) (#4=#:G178 NIL) (|d| (|List| E))
          (|mm| (|Matrix| R)) (|l| (|List| (|List| S))))
         (SEQ (LETT |l| (SPADCALL |m| (QREFELT % 88)))
              (LETT |b|
                    (SPADCALL
                     (SPADCALL
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |r| NIL) (LETT #2# |l|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS (|POLYCAT-;allMonoms| |r| %) #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#))))
                      (QREFELT % 77))
                     (QREFELT % 78)))
              (EXIT
               (COND
                ((NULL |b|)
                 (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| % 56)))
                ('T
                 (SEQ
                  (LETT |d|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |bj| NIL) (LETT #4# |b|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |bj| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS (SPADCALL |bj| (QREFELT % 89))
                                            #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| %))
                  (LETT |l| (CDR |l|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (LETT |mm|
                              (SPADCALL |mm|
                                        (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d|
                                         %)
                                        (QREFELT % 90)))
                        (EXIT (LETT |l| (CDR |l|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |mm|)))))))) 

(SDEFUN |POLYCAT-;reducedSystem;MVR;18|
        ((|m| (|Matrix| S)) (|v| (|Vector| S))
         (% (|Record| (|:| |mat| (|Matrix| R)) (|:| |vec| (|Vector| R)))))
        (SPROG
         ((#1=#:G196 NIL) (|s| NIL) (#2=#:G197 NIL) (|b| (|List| S))
          (#3=#:G198 NIL) (|bj| NIL) (#4=#:G199 NIL) (|d| (|List| E))
          (|n| (|NonNegativeInteger|)) (|mm| (|Matrix| R)) (|w| (|Vector| R))
          (|l| (|List| (|List| S))) (|r| (|List| S)))
         (SEQ (LETT |l| (SPADCALL |m| (QREFELT % 88)))
              (LETT |r| (SPADCALL |v| (QREFELT % 94)))
              (LETT |b|
                    (SPADCALL
                     (SPADCALL (|POLYCAT-;allMonoms| |r| %)
                               (SPADCALL
                                (PROGN
                                 (LETT #1# NIL)
                                 (SEQ (LETT |s| NIL) (LETT #2# |l|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |s| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #1#
                                              (CONS
                                               (|POLYCAT-;allMonoms| |s| %)
                                               #1#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #1#))))
                                (QREFELT % 77))
                               (QREFELT % 95))
                     (QREFELT % 78)))
              (EXIT
               (COND
                ((NULL |b|)
                 (CONS (MAKE_MATRIX1 0 (ANCOLS |m|) (|spadConstant| % 56))
                       (MAKEARR1 0 (|spadConstant| % 56))))
                ('T
                 (SEQ
                  (LETT |d|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |bj| NIL) (LETT #4# |b|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |bj| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS (SPADCALL |bj| (QREFELT % 89))
                                            #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))
                  (LETT |n| (LENGTH |d|))
                  (LETT |mm| (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d| %))
                  (LETT |w| (|POLYCAT-;P2R| (|SPADfirst| |r|) |d| |n| %))
                  (LETT |l| (CDR |l|)) (LETT |r| (CDR |r|))
                  (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                       (SEQ
                        (LETT |mm|
                              (SPADCALL |mm|
                                        (|POLYCAT-;eq2R| (|SPADfirst| |l|) |d|
                                         %)
                                        (QREFELT % 90)))
                        (LETT |w|
                              (SPADCALL |w|
                                        (|POLYCAT-;P2R| (|SPADfirst| |r|) |d|
                                         |n| %)
                                        (QREFELT % 96)))
                        (LETT |l| (CDR |l|)) (EXIT (LETT |r| (CDR |r|))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |mm| |w|))))))))) 

(SDEFUN |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|
        ((|lpp| (|List| (|SparseUnivariatePolynomial| S)))
         (|pp| (|SparseUnivariatePolynomial| S))
         (% (|Union| (|List| (|SparseUnivariatePolynomial| S)) "failed")))
        (SPADCALL |lpp| |pp| (QREFELT % 103))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;20|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 109))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;21|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 109))) 

(SDEFUN |POLYCAT-;factor;SF;22| ((|p| (S)) (% (|Factored| S)))
        (SPADCALL |p| (QREFELT % 113))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;23|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (ELT % 116) (QREFELT % 119))) 

(SDEFUN |POLYCAT-;factor;SF;24| ((|p| (S)) (% (|Factored| S)))
        (SPADCALL |p| (ELT % 116) (QREFELT % 120))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;25|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (ELT % 116) (QREFELT % 119))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;26|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (|qq| (|SparseUnivariatePolynomial| S))
         (% (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| |qq| (QREFELT % 122))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;27|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 124))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;28|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 125))) 

(SDEFUN |POLYCAT-;factor;SF;29| ((|p| (S)) (% (|Factored| S)))
        (SPROG
         ((|v| (|Union| |VarSet| "failed")) (|ansR| (|Factored| R))
          (#1=#:G253 NIL) (|w| NIL) (#2=#:G254 NIL)
          (|up| (|SparseUnivariatePolynomial| S))
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (#3=#:G255 NIL) (|ww| NIL) (#4=#:G256 NIL))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 38)))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ
                  (LETT |ansR|
                        (SPADCALL (SPADCALL |p| (QREFELT % 33))
                                  (QREFELT % 126)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansR| (QREFELT % 128)) (QREFELT % 36))
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |w| NIL)
                          (LETT #2# (SPADCALL |ansR| (QREFELT % 132))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |w| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (SPADCALL (QVELT |w| 1)
                                                     (QREFELT % 36))
                                           (QVELT |w| 2))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT % 135)))))
                ('T
                 (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT % 44)))
                      (LETT |ansSUP| (SPADCALL |up| (QREFELT % 124)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |ansSUP| (QREFELT % 136))
                                  (QCDR |v|) (QREFELT % 137))
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |ww| NIL)
                              (LETT #4# (SPADCALL |ansSUP| (QREFELT % 140)))
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |ww| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |ww| 0)
                                               (SPADCALL (QVELT |ww| 1)
                                                         (QCDR |v|)
                                                         (QREFELT % 137))
                                               (QVELT |ww| 2))
                                       #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        (QREFELT % 135)))))))))) 

(SDEFUN |POLYCAT-;gcdPolynomial;3Sup;30|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (|qq| (|SparseUnivariatePolynomial| S))
         (% (|SparseUnivariatePolynomial| S)))
        (SPADCALL |pp| |qq| (QREFELT % 122))) 

(SDEFUN |POLYCAT-;factorPolynomial;SupF;31|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 124))) 

(SDEFUN |POLYCAT-;factorSquareFreePolynomial;SupF;32|
        ((|pp| (|SparseUnivariatePolynomial| S))
         (% (|Factored| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |pp| (QREFELT % 125))) 

(SDEFUN |POLYCAT-;factor;SF;33| ((|p| (S)) (% (|Factored| S)))
        (SPROG
         ((|v| (|Union| |VarSet| "failed")) (|ansR| (|Factored| R))
          (#1=#:G279 NIL) (|w| NIL) (#2=#:G280 NIL)
          (|up| (|SparseUnivariatePolynomial| S))
          (|ansSUP| (|Factored| (|SparseUnivariatePolynomial| S)))
          (#3=#:G281 NIL) (|ww| NIL) (#4=#:G282 NIL))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 38)))
              (EXIT
               (COND
                ((QEQCAR |v| 1)
                 (SEQ
                  (LETT |ansR|
                        (SPADCALL (SPADCALL |p| (QREFELT % 33))
                                  (QREFELT % 126)))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |ansR| (QREFELT % 128)) (QREFELT % 36))
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |w| NIL)
                          (LETT #2# (SPADCALL |ansR| (QREFELT % 132))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |w| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (VECTOR (QVELT |w| 0)
                                           (SPADCALL (QVELT |w| 1)
                                                     (QREFELT % 36))
                                           (QVELT |w| 2))
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#))))
                    (QREFELT % 135)))))
                ('T
                 (SEQ (LETT |up| (SPADCALL |p| (QCDR |v|) (QREFELT % 44)))
                      (LETT |ansSUP| (SPADCALL |up| (QREFELT % 124)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |ansSUP| (QREFELT % 136))
                                  (QCDR |v|) (QREFELT % 137))
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |ww| NIL)
                              (LETT #4# (SPADCALL |ansSUP| (QREFELT % 140)))
                              G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |ww| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (VECTOR (QVELT |ww| 0)
                                               (SPADCALL (QVELT |ww| 1)
                                                         (QCDR |v|)
                                                         (QREFELT % 137))
                                               (QVELT |ww| 2))
                                       #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#))))
                        (QREFELT % 135)))))))))) 

(SDEFUN |POLYCAT-;conditionP;MU;34|
        ((|mat| (|Matrix| S)) (% (|Union| (|Vector| S) #1="failed")))
        (SPROG
         ((|ll| (|List| (|List| S))) (#2=#:G321 NIL) (|z| NIL) (#3=#:G322 NIL)
          (|ch| (|Integer|)) (|l| NIL) (#4=#:G323 NIL) (#5=#:G324 NIL)
          (#6=#:G291 #7=(|List| S)) (#8=#:G289 #7#) (#9=#:G290 NIL)
          (|mons| #7#) (#10=#:G325 NIL) (|vars| (|List| |VarSet|))
          (|degs| (|List| (|NonNegativeInteger|))) (#11=#:G326 NIL) (|d| NIL)
          (#12=#:G327 NIL) (|nd| (|Union| (|Integer|) "failed"))
          (#13=#:G320 NIL) (#14=#:G297 NIL)
          (|deg1| (|List| (|NonNegativeInteger|))) (|redmons| (|List| S))
          (#15=#:G328 NIL) (|v| NIL) (#16=#:G330 NIL) (|u| NIL)
          (#17=#:G329 NIL) (|llR| (|List| (|List| R)))
          (|monslist| (|List| (|List| S))) (|ans| (|Union| (|Vector| R) #1#))
          (#18=#:G332 NIL) (#19=#:G333 NIL) (#20=#:G331 NIL) (|m| NIL)
          (#21=#:G334 NIL) (|i| (|NonNegativeInteger|)) (#22=#:G315 (S))
          (#23=#:G313 (S)) (#24=#:G314 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ll|
                  (SPADCALL (SPADCALL |mat| (QREFELT % 141)) (QREFELT % 88)))
            (LETT |llR|
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |z| NIL) (LETT #3# (|SPADfirst| |ll|)) G190
                        (COND
                         ((OR (ATOM #3#) (PROGN (LETT |z| (CAR #3#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #2# (CONS NIL #2#))))
                        (LETT #3# (CDR #3#)) (GO G190) G191
                        (EXIT (NREVERSE #2#)))))
            (LETT |monslist| NIL) (LETT |ch| (SPADCALL (QREFELT % 142)))
            (SEQ (LETT |l| NIL) (LETT #4# |ll|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |l| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (LETT |mons|
                        (PROGN
                         (LETT #9# NIL)
                         (SEQ (LETT |u| NIL) (LETT #5# |l|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |u| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# (SPADCALL |u| (QREFELT % 75)))
                                 (COND
                                  (#9#
                                   (LETT #8#
                                         (SPADCALL #8# #6# (QREFELT % 143))))
                                  ('T (PROGN (LETT #8# #6#) (LETT #9# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#9# #8#) ('T (|IdentityError| '|setUnion|)))))
                  (LETT |redmons| NIL)
                  (SEQ (LETT |m| NIL) (LETT #10# |mons|) G190
                       (COND
                        ((OR (ATOM #10#) (PROGN (LETT |m| (CAR #10#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |vars| (SPADCALL |m| (QREFELT % 24)))
                            (LETT |degs| (SPADCALL |m| |vars| (QREFELT % 144)))
                            (LETT |deg1|
                                  (PROGN
                                   (LETT #11# NIL)
                                   (SEQ (LETT |d| NIL) (LETT #12# |degs|) G190
                                        (COND
                                         ((OR (ATOM #12#)
                                              (PROGN
                                               (LETT |d| (CAR #12#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #11#
                                                (CONS
                                                 (SEQ
                                                  (LETT |nd|
                                                        (|exquo_INT| |d| |ch|))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |nd| 1)
                                                     (PROGN
                                                      (LETT #13#
                                                            (CONS 1 "failed"))
                                                      (GO #25=#:G319)))
                                                    ('T
                                                     (PROG1
                                                         (LETT #14#
                                                               (QCDR |nd|))
                                                       (|check_subtype2|
                                                        (>= #14# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #14#))))))
                                                 #11#))))
                                        (LETT #12# (CDR #12#)) (GO G190) G191
                                        (EXIT (NREVERSE #11#)))))
                            (LETT |redmons|
                                  (CONS
                                   (SPADCALL (|spadConstant| % 27) |vars|
                                             |deg1| (QREFELT % 145))
                                   |redmons|))
                            (EXIT
                             (LETT |llR|
                                   (PROGN
                                    (LETT #15# NIL)
                                    (SEQ (LETT |v| NIL) (LETT #16# |llR|)
                                         (LETT |u| NIL) (LETT #17# |l|) G190
                                         (COND
                                          ((OR (ATOM #17#)
                                               (PROGN
                                                (LETT |u| (CAR #17#))
                                                NIL)
                                               (ATOM #16#)
                                               (PROGN
                                                (LETT |v| (CAR #16#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #15#
                                                 (CONS
                                                  (CONS
                                                   (SPADCALL
                                                    (SPADCALL |u| |vars| |degs|
                                                              (QREFELT % 49))
                                                    (QREFELT % 146))
                                                   |v|)
                                                  #15#))))
                                         (LETT #17#
                                               (PROG1 (CDR #17#)
                                                 (LETT #16# (CDR #16#))))
                                         (GO G190) G191
                                         (EXIT (NREVERSE #15#)))))))
                       (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (LETT |monslist| (CONS |redmons| |monslist|))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (LETT |ans|
                  (SPADCALL
                   (SPADCALL (SPADCALL |llR| (QREFELT % 85)) (QREFELT % 147))
                   (QREFELT % 149)))
            (EXIT
             (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |i| 0)
                         (EXIT
                          (CONS 0
                                (PROGN
                                 (LETT #18# (GETREFV (LENGTH |monslist|)))
                                 (SEQ (LETT #19# |monslist|) (LETT #20# 0) G190
                                      (COND
                                       ((OR (ATOM #19#)
                                            (PROGN
                                             (LETT |mons| (CAR #19#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT #18# #20#
                                                (PROGN
                                                 (LETT #24# NIL)
                                                 (SEQ (LETT |m| NIL)
                                                      (LETT #21# |mons|) G190
                                                      (COND
                                                       ((OR (ATOM #21#)
                                                            (PROGN
                                                             (LETT |m|
                                                                   (CAR #21#))
                                                             NIL))
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #22#
                                                               (SPADCALL |m|
                                                                         (SPADCALL
                                                                          (SPADCALL
                                                                           (QCDR
                                                                            |ans|)
                                                                           (LETT
                                                                            |i|
                                                                            (+
                                                                             |i|
                                                                             1))
                                                                           (QREFELT
                                                                            %
                                                                            150))
                                                                          (QREFELT
                                                                           %
                                                                           36))
                                                                         (QREFELT
                                                                          %
                                                                          151)))
                                                         (COND
                                                          (#24#
                                                           (LETT #23#
                                                                 (SPADCALL #23#
                                                                           #22#
                                                                           (QREFELT
                                                                            %
                                                                            152))))
                                                          ('T
                                                           (PROGN
                                                            (LETT #23# #22#)
                                                            (LETT #24#
                                                                  'T)))))))
                                                      (LETT #21# (CDR #21#))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (COND (#24# #23#)
                                                       ('T
                                                        (|spadConstant| %
                                                                        55)))))))
                                      (LETT #20#
                                            (PROG1 (|inc_SI| #20#)
                                              (LETT #19# (CDR #19#))))
                                      (GO G190) G191 (EXIT NIL))
                                 #18#)))))))))
          #25# (EXIT #13#)))) 

(SDEFUN |POLYCAT-;charthRoot;SU;35| ((|p| (S)) (% (|Union| S #1="failed")))
        (SPROG
         ((|vars| (|List| |VarSet|)) (|ans| (|Union| R #1#))
          (|ch| (|NonNegativeInteger|)))
         (SEQ (LETT |vars| (SPADCALL |p| (QREFELT % 24)))
              (EXIT
               (COND
                ((NULL |vars|)
                 (SEQ
                  (LETT |ans|
                        (SPADCALL (SPADCALL |p| (QREFELT % 146))
                                  (QREFELT % 155)))
                  (EXIT
                   (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                         (#2='T
                          (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT % 36))))))))
                (#2#
                 (SEQ (LETT |ch| (SPADCALL (QREFELT % 142)))
                      (EXIT (|POLYCAT-;charthRootlv| |p| |vars| |ch| %))))))))) 

(SDEFUN |POLYCAT-;charthRootlv|
        ((|p| (S)) (|vars| (|List| |VarSet|)) (|ch| (|NonNegativeInteger|))
         (% (|Union| S #1="failed")))
        (SPROG
         ((|v| (|VarSet|)) (|dd| (|Union| (|Integer|) "failed")) (|cp| (S))
          (|d| (|NonNegativeInteger|)) (#2=#:G359 NIL) (|ans| (S))
          (|ansx| (|Union| S #1#)) (#3=#:G367 NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL |vars|)
             (SEQ
              (LETT |ans|
                    (SPADCALL (SPADCALL |p| (QREFELT % 146)) (QREFELT % 155)))
              (EXIT
               (COND ((QEQCAR |ans| 1) (CONS 1 "failed"))
                     (#4='T
                      (CONS 0 (SPADCALL (QCDR |ans|) (QREFELT % 36))))))))
            (#4#
             (SEQ (LETT |v| (|SPADfirst| |vars|)) (LETT |vars| (CDR |vars|))
                  (LETT |d| (SPADCALL |p| |v| (QREFELT % 31)))
                  (LETT |ans| (|spadConstant| % 55))
                  (SEQ G190 (COND ((NULL (> |d| 0)) (GO G191)))
                       (SEQ (LETT |dd| (|exquo_INT| |d| |ch|))
                            (EXIT
                             (COND
                              ((QEQCAR |dd| 1)
                               (PROGN
                                (LETT #3# (CONS 1 "failed"))
                                (GO #5=#:G366)))
                              ('T
                               (SEQ
                                (LETT |cp|
                                      (SPADCALL |p| |v| |d| (QREFELT % 157)))
                                (LETT |p|
                                      (SPADCALL |p|
                                                (SPADCALL |cp| |v| |d|
                                                          (QREFELT % 32))
                                                (QREFELT % 158)))
                                (LETT |ansx|
                                      (|POLYCAT-;charthRootlv| |cp| |vars| |ch|
                                       %))
                                (EXIT
                                 (COND
                                  ((QEQCAR |ansx| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed"))
                                    (GO #5#)))
                                  ('T
                                   (SEQ
                                    (LETT |d|
                                          (SPADCALL |p| |v| (QREFELT % 31)))
                                    (EXIT
                                     (LETT |ans|
                                           (SPADCALL |ans|
                                                     (SPADCALL (QCDR |ansx|)
                                                               |v|
                                                               (PROG1
                                                                   (LETT #2#
                                                                         (QCDR
                                                                          |dd|))
                                                                 (|check_subtype2|
                                                                  (>= #2# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #2#))
                                                               (QREFELT % 32))
                                                     (QREFELT %
                                                              152)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (LETT |ansx| (|POLYCAT-;charthRootlv| |p| |vars| |ch| %))
                  (EXIT
                   (COND
                    ((QEQCAR |ansx| 1)
                     (PROGN (LETT #3# (CONS 1 "failed")) (GO #5#)))
                    (#4#
                     (PROGN
                      (LETT #3#
                            (CONS 0
                                  (SPADCALL |ans| (QCDR |ansx|)
                                            (QREFELT % 152))))
                      (GO #5#)))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |POLYCAT-;monicDivide;2SVarSetR;37|
        ((|p1| (S)) (|p2| (S)) (|mvar| (|VarSet|))
         (% (|Record| (|:| |quotient| S) (|:| |remainder| S))))
        (SPROG
         ((|result|
           (|Record| (|:| |quotient| (|SparseUnivariatePolynomial| S))
                     (|:| |remainder| (|SparseUnivariatePolynomial| S)))))
         (SEQ
          (LETT |result|
                (SPADCALL (SPADCALL |p1| |mvar| (QREFELT % 44))
                          (SPADCALL |p2| |mvar| (QREFELT % 44))
                          (QREFELT % 160)))
          (EXIT
           (CONS (SPADCALL (QCAR |result|) |mvar| (QREFELT % 137))
                 (SPADCALL (QCDR |result|) |mvar| (QREFELT % 137))))))) 

(SDEFUN |POLYCAT-;squareFree;SF;38| ((|p| (S)) (% (|Factored| S)))
        (SPADCALL |p| (QREFELT % 163))) 

(SDEFUN |POLYCAT-;squareFree;SF;39| ((|p| (S)) (% (|Factored| S)))
        (SPADCALL |p| (QREFELT % 166))) 

(SDEFUN |POLYCAT-;squareFree;SF;40| ((|p| (S)) (% (|Factored| S)))
        (SPADCALL |p| (QREFELT % 166))) 

(SDEFUN |POLYCAT-;squareFreePart;2S;41| ((|p| (S)) (% (S)))
        (SPROG
         ((|s| (|Factored| S)) (|f| NIL) (#1=#:G381 NIL) (#2=#:G379 (S))
          (#3=#:G377 (S)) (#4=#:G378 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL (LETT |s| (SPADCALL |p| (QREFELT % 167))) (QREFELT % 168))
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |f| NIL) (LETT #1# (SPADCALL |s| (QREFELT % 169))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #2# (QVELT |f| 1))
                    (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 151))))
                          ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (COND (#4# #3#) ('T (|spadConstant| % 27))))
           (QREFELT % 151))))) 

(SDEFUN |POLYCAT-;content;SVarSetS;42| ((|p| (S)) (|v| (|VarSet|)) (% (S)))
        (SPADCALL (SPADCALL |p| |v| (QREFELT % 44)) (QREFELT % 171))) 

(SDEFUN |POLYCAT-;primitivePart;2S;43| ((|p| (S)) (% (S)))
        (SPROG ((#1=#:G384 NIL))
               (COND ((SPADCALL |p| (QREFELT % 173)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p| (SPADCALL |p| (QREFELT % 174))
                                            (QREFELT % 175)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                          (|Union| (QREFELT % 6) "failed")
                                          #1#))
                        (QREFELT % 177))
                       1))))) 

(SDEFUN |POLYCAT-;primitivePart;SVarSetS;44|
        ((|p| (S)) (|v| (|VarSet|)) (% (S)))
        (SPROG ((#1=#:G391 NIL))
               (COND ((SPADCALL |p| (QREFELT % 173)) |p|)
                     ('T
                      (QVELT
                       (SPADCALL
                        (PROG2
                            (LETT #1#
                                  (SPADCALL |p|
                                            (SPADCALL |p| |v| (QREFELT % 179))
                                            (QREFELT % 180)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                          (|Union| (QREFELT % 6) "failed")
                                          #1#))
                        (QREFELT % 177))
                       1))))) 

(SDEFUN |POLYCAT-;smaller?;2SB;45| ((|p| (S)) (|q| (S)) (% (|Boolean|)))
        (SPROG ((|dp| (E)) (|dq| (E)) (|lp| (R)) (|lq| (R)) (#1=#:G404 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND
                           ((SPADCALL |p| (|spadConstant| % 55)
                                      (QREFELT % 182))
                            (SPADCALL |q| (|spadConstant| % 55)
                                      (QREFELT % 182)))
                           ('T NIL)))
                         (GO G191)))
                       (SEQ (LETT |dp| (SPADCALL |p| (QREFELT % 89)))
                            (LETT |dq| (SPADCALL |q| (QREFELT % 89)))
                            (EXIT
                             (COND
                              ((SPADCALL |dp| |dq| (QREFELT % 183))
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (|spadConstant| % 56)
                                                (SPADCALL |q| (QREFELT % 33))
                                                (QREFELT % 185)))
                                (GO #2=#:G403)))
                              ((SPADCALL |dq| |dp| (QREFELT % 183))
                               (PROGN
                                (LETT #1#
                                      (SPADCALL (SPADCALL |p| (QREFELT % 33))
                                                (|spadConstant| % 56)
                                                (QREFELT % 185)))
                                (GO #2#)))
                              ('T
                               (SEQ (LETT |lp| (SPADCALL |p| (QREFELT % 33)))
                                    (LETT |lq| (SPADCALL |q| (QREFELT % 33)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |lp| |lq| (QREFELT % 186))
                                       (PROGN
                                        (LETT #1#
                                              (SPADCALL |lp| |lq|
                                                        (QREFELT % 185)))
                                        (GO #2#)))
                                      ('T
                                       (SEQ
                                        (LETT |p|
                                              (SPADCALL |p| (QREFELT % 187)))
                                        (EXIT
                                         (LETT |q|
                                               (SPADCALL |q|
                                                         (QREFELT %
                                                                  187)))))))))))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((SPADCALL |p| (|spadConstant| % 55) (QREFELT % 39))
                     (SPADCALL (|spadConstant| % 56)
                               (SPADCALL |q| (QREFELT % 33)) (QREFELT % 185)))
                    ('T
                     (SPADCALL (SPADCALL |p| (QREFELT % 33))
                               (|spadConstant| % 56) (QREFELT % 185)))))))
                #2# (EXIT #1#)))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;46|
        ((|p| (S)) (|pat| (|Pattern| (|Integer|)))
         (|l| (|PatternMatchResult| (|Integer|) S))
         (% (|PatternMatchResult| (|Integer|) S)))
        (SPADCALL |p| |pat| |l| (QREFELT % 192))) 

(SDEFUN |POLYCAT-;patternMatch;SP2Pmr;47|
        ((|p| (S)) (|pat| (|Pattern| (|Float|)))
         (|l| (|PatternMatchResult| (|Float|) S))
         (% (|PatternMatchResult| (|Float|) S)))
        (SPADCALL |p| |pat| |l| (QREFELT % 198))) 

(SDEFUN |POLYCAT-;convert;SP;48| ((|x| (S)) (% (|Pattern| (|Integer|))))
        (SPROG
         ((|r| (|Union| R #1="failed")) (|vu| (|Union| |VarSet| #1#))
          (|ex|
           (|Union|
            (|Record| (|:| |var| |VarSet|)
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|exr|
           (|Record| (|:| |var| |VarSet|)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|tx| NIL) (#2=#:G436 NIL) (|lx| (|Union| (|List| S) "failed"))
          (|mx| NIL) (#3=#:G437 NIL) (|res| (|Pattern| (|Integer|))))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 202)))
              (EXIT
               (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 203)))
                     (#4='T
                      (SEQ (LETT |vu| (SPADCALL |x| (QREFELT % 13)))
                           (EXIT
                            (COND
                             ((QEQCAR |vu| 0)
                              (SPADCALL (QCDR |vu|) (QREFELT % 204)))
                             (#4#
                              (SEQ (LETT |ex| (SPADCALL |x| (QREFELT % 205)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |ex| 0)
                                      (SEQ (LETT |exr| (QCDR |ex|))
                                           (EXIT
                                            (SPADCALL
                                             (SPADCALL (QCAR |exr|)
                                                       (QREFELT % 204))
                                             (QCDR |exr|) (QREFELT % 206)))))
                                     (#4#
                                      (SEQ
                                       (LETT |lx|
                                             (SPADCALL |x| (QREFELT % 207)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |lx| 0)
                                          (SEQ
                                           (LETT |res| (|spadConstant| % 208))
                                           (SEQ (LETT |tx| NIL)
                                                (LETT #2#
                                                      (REVERSE (QCDR |lx|)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #2#)
                                                      (PROGN
                                                       (LETT |tx| (CAR #2#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |res|
                                                        (SPADCALL
                                                         (SPADCALL |tx|
                                                                   (QREFELT %
                                                                            209))
                                                         |res|
                                                         (QREFELT % 210)))))
                                                (LETT #2# (CDR #2#)) (GO G190)
                                                G191 (EXIT NIL))
                                           (EXIT |res|)))
                                         (#4#
                                          (SEQ
                                           (LETT |lx|
                                                 (SPADCALL |x|
                                                           (QREFELT % 211)))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |lx| 0)
                                              (SEQ
                                               (LETT |res|
                                                     (|spadConstant| % 212))
                                               (SEQ (LETT |mx| NIL)
                                                    (LETT #3#
                                                          (REVERSE
                                                           (QCDR |lx|)))
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #3#)
                                                          (PROGN
                                                           (LETT |mx|
                                                                 (CAR #3#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT |res|
                                                            (SPADCALL
                                                             (SPADCALL |mx|
                                                                       (QREFELT
                                                                        % 209))
                                                             |res|
                                                             (QREFELT %
                                                                      213)))))
                                                    (LETT #3# (CDR #3#))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT |res|)))
                                             (#4#
                                              (|error|
                                               "conv_def: impossible"))))))))))))))))))))))) 

(SDEFUN |POLYCAT-;convert;SP;49| ((|x| (S)) (% (|Pattern| (|Float|))))
        (SPROG
         ((|r| (|Union| R #1="failed")) (|vu| (|Union| |VarSet| #1#))
          (|ex|
           (|Union|
            (|Record| (|:| |var| |VarSet|)
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|exr|
           (|Record| (|:| |var| |VarSet|)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|tx| NIL) (#2=#:G464 NIL) (|lx| (|Union| (|List| S) "failed"))
          (|mx| NIL) (#3=#:G465 NIL) (|res| (|Pattern| (|Float|))))
         (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 202)))
              (EXIT
               (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 215)))
                     (#4='T
                      (SEQ (LETT |vu| (SPADCALL |x| (QREFELT % 13)))
                           (EXIT
                            (COND
                             ((QEQCAR |vu| 0)
                              (SPADCALL (QCDR |vu|) (QREFELT % 216)))
                             (#4#
                              (SEQ (LETT |ex| (SPADCALL |x| (QREFELT % 205)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |ex| 0)
                                      (SEQ (LETT |exr| (QCDR |ex|))
                                           (EXIT
                                            (SPADCALL
                                             (SPADCALL (QCAR |exr|)
                                                       (QREFELT % 216))
                                             (QCDR |exr|) (QREFELT % 217)))))
                                     (#4#
                                      (SEQ
                                       (LETT |lx|
                                             (SPADCALL |x| (QREFELT % 207)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |lx| 0)
                                          (SEQ
                                           (LETT |res| (|spadConstant| % 218))
                                           (SEQ (LETT |tx| NIL)
                                                (LETT #2#
                                                      (REVERSE (QCDR |lx|)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #2#)
                                                      (PROGN
                                                       (LETT |tx| (CAR #2#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |res|
                                                        (SPADCALL
                                                         (SPADCALL |tx|
                                                                   (QREFELT %
                                                                            219))
                                                         |res|
                                                         (QREFELT % 220)))))
                                                (LETT #2# (CDR #2#)) (GO G190)
                                                G191 (EXIT NIL))
                                           (EXIT |res|)))
                                         (#4#
                                          (SEQ
                                           (LETT |lx|
                                                 (SPADCALL |x|
                                                           (QREFELT % 211)))
                                           (EXIT
                                            (COND
                                             ((QEQCAR |lx| 0)
                                              (SEQ
                                               (LETT |res|
                                                     (|spadConstant| % 221))
                                               (SEQ (LETT |mx| NIL)
                                                    (LETT #3#
                                                          (REVERSE
                                                           (QCDR |lx|)))
                                                    G190
                                                    (COND
                                                     ((OR (ATOM #3#)
                                                          (PROGN
                                                           (LETT |mx|
                                                                 (CAR #3#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT |res|
                                                            (SPADCALL
                                                             (SPADCALL |mx|
                                                                       (QREFELT
                                                                        % 219))
                                                             |res|
                                                             (QREFELT %
                                                                      222)))))
                                                    (LETT #3# (CDR #3#))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT |res|)))
                                             (#4#
                                              (|error|
                                               "conv_def: impossible"))))))))))))))))))))))) 

(SDEFUN |POLYCAT-;convert;SIf;50| ((|p| (S)) (% (|InputForm|)))
        (SPADCALL (ELT % 225) (ELT % 226) |p| (QREFELT % 230))) 

(SDEFUN |POLYCAT-;hashUpdate!;HsSHs;51|
        ((|s| (|HashState|)) (|x| (S)) (% (|HashState|)))
        (SPROG
         ((|vu| (|Union| |VarSet| "failed")) (|v| (|VarSet|))
          (|d| (|NonNegativeInteger|)) (|xu| (|SparseUnivariatePolynomial| S)))
         (SEQ (LETT |vu| (SPADCALL |x| (QREFELT % 38)))
              (EXIT
               (COND
                ((QEQCAR |vu| 1)
                 (SPADCALL |s| (SPADCALL |x| (QREFELT % 146)) (QREFELT % 233)))
                ('T
                 (SEQ (LETT |v| (QCDR |vu|))
                      (LETT |s| (SPADCALL |s| |v| (QREFELT % 234)))
                      (LETT |xu| (SPADCALL |x| |v| (QREFELT % 44)))
                      (SEQ G190
                           (COND
                            ((NULL
                              (> (LETT |d| (SPADCALL |xu| (QREFELT % 59))) 0))
                             (GO G191)))
                           (SEQ (LETT |s| (SPADCALL |s| |d| (QREFELT % 235)))
                                (LETT |s|
                                      (SPADCALL |s|
                                                (SPADCALL |xu| (QREFELT % 60))
                                                (QREFELT % 236)))
                                (EXIT
                                 (LETT |xu| (SPADCALL |xu| (QREFELT % 62)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |s| (SPADCALL |xu| (QREFELT % 237))
                                 (QREFELT % 236)))))))))) 

(DECLAIM (NOTINLINE |PolynomialCategory&;|)) 

(DEFUN |PolynomialCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PolynomialCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 246))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#2| '(|GcdDomain|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#4|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#2|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#4|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#2|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#4| '(|Hashable|))
                                        (|HasCategory| |#2| '(|Hashable|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|SemiRing|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|testBitVector| |pv$| 17)
      (QSETREFV % 20 (CONS (|dispatchFunction| |POLYCAT-;eval;SLS;1|) %))))
    (COND
     ((|testBitVector| |pv$| 17)
      (PROGN
       (QSETREFV % 37 (CONS (|dispatchFunction| |POLYCAT-;isTimes;SU;3|) %))
       (QSETREFV % 42 (CONS (|dispatchFunction| |POLYCAT-;isExpt;SU;4|) %)))))
    (COND
     ((|HasCategory| |#1| '(|CommutativeRing|))
      (COND
       ((|testBitVector| |pv$| 3)
        (PROGN
         (QSETREFV % 72
                   (CONS (|dispatchFunction| |POLYCAT-;resultant;2SVarSetS;12|)
                         %))
         (QSETREFV % 74
                   (CONS
                    (|dispatchFunction| |POLYCAT-;discriminant;SVarSetS;13|)
                    %)))))))
    (COND
     ((|HasCategory| |#2| '(|IntegralDomain|))
      (PROGN
       (QSETREFV % 92
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MM;17|) %))
       (QSETREFV % 99
                 (CONS (|dispatchFunction| |POLYCAT-;reducedSystem;MVR;18|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 106
                 (CONS
                  (|dispatchFunction|
                   |POLYCAT-;solveLinearPolynomialEquation;LSupU;19|)
                  %))
       (COND
        ((|HasCategory| |#2| '(|FiniteFieldCategory|))
         (PROGN
          (QSETREFV % 111
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;20|)
                     %))
          (QSETREFV % 112
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;21|)
                     %))
          (QSETREFV % 115
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;22|) %))))
        ((|HasCategory| |#2| '(|CharacteristicZero|))
         (COND
          ((|HasCategory| |#2| '(|EuclideanDomain|))
           (PROGN
            (QSETREFV % 111
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;23|)
                       %))
            (QSETREFV % 115
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;24|) %))
            (QSETREFV % 112
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;25|)
                       %))))
          ('T
           (PROGN
            (QSETREFV % 123
                      (CONS
                       (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;26|)
                       %))
            (QSETREFV % 111
                      (CONS
                       (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;27|)
                       %))
            (QSETREFV % 112
                      (CONS
                       (|dispatchFunction|
                        |POLYCAT-;factorSquareFreePolynomial;SupF;28|)
                       %))
            (QSETREFV % 115
                      (CONS (|dispatchFunction| |POLYCAT-;factor;SF;29|)
                            %))))))
        ('T
         (PROGN
          (QSETREFV % 123
                    (CONS (|dispatchFunction| |POLYCAT-;gcdPolynomial;3Sup;30|)
                          %))
          (QSETREFV % 111
                    (CONS
                     (|dispatchFunction| |POLYCAT-;factorPolynomial;SupF;31|)
                     %))
          (QSETREFV % 112
                    (CONS
                     (|dispatchFunction|
                      |POLYCAT-;factorSquareFreePolynomial;SupF;32|)
                     %))
          (QSETREFV % 115
                    (CONS (|dispatchFunction| |POLYCAT-;factor;SF;33|) %)))))
       (COND
        ((|HasCategory| |#2| '(|CharacteristicNonZero|))
         (PROGN
          (QSETREFV % 153
                    (CONS (|dispatchFunction| |POLYCAT-;conditionP;MU;34|) %))
          NIL
          (QSETREFV % 156
                    (CONS (|dispatchFunction| |POLYCAT-;charthRoot;SU;35|)
                          %))))))))
    (COND
     ((|testBitVector| |pv$| 16)
      (QSETREFV % 161
                (CONS (|dispatchFunction| |POLYCAT-;monicDivide;2SVarSetR;37|)
                      %))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (COND
        ((|HasCategory| |#2| '(|EuclideanDomain|))
         (COND
          ((|HasCategory| |#2| '(|CharacteristicZero|))
           (QSETREFV % 164
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;38|)
                           %)))
          ('T
           (QSETREFV % 164
                     (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;39|)
                           %)))))
        ('T
         (QSETREFV % 164
                   (CONS (|dispatchFunction| |POLYCAT-;squareFree;SF;40|) %))))
       (QSETREFV % 170
                 (CONS (|dispatchFunction| |POLYCAT-;squareFreePart;2S;41|) %))
       (QSETREFV % 172
                 (CONS (|dispatchFunction| |POLYCAT-;content;SVarSetS;42|) %))
       (QSETREFV % 178
                 (CONS (|dispatchFunction| |POLYCAT-;primitivePart;2S;43|) %))
       (QSETREFV % 181
                 (CONS
                  (|dispatchFunction| |POLYCAT-;primitivePart;SVarSetS;44|)
                  %)))))
    (COND
     ((|HasCategory| |#2| '(|ComparableRepresentation|))
      (PROGN
       (QSETREFV % 188
                 (CONS (|dispatchFunction| |POLYCAT-;smaller?;2SB;45|) %))
       (COND
        ((|testBitVector| |pv$| 16)
         (PROGN
          (COND
           ((|testBitVector| |pv$| 7)
            (COND
             ((|testBitVector| |pv$| 6)
              (QSETREFV % 194
                        (CONS
                         (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;46|)
                         %))))))
          (COND
           ((|testBitVector| |pv$| 5)
            (COND
             ((|testBitVector| |pv$| 4)
              (QSETREFV % 200
                        (CONS
                         (|dispatchFunction| |POLYCAT-;patternMatch;SP2Pmr;47|)
                         %))))))))))))
    (COND
     ((|testBitVector| |pv$| 16)
      (PROGN
       (COND
        ((|testBitVector| |pv$| 11)
         (COND
          ((|testBitVector| |pv$| 10)
           (QSETREFV % 214
                     (CONS (|dispatchFunction| |POLYCAT-;convert;SP;48|)
                           %))))))
       (COND
        ((|testBitVector| |pv$| 9)
         (COND
          ((|testBitVector| |pv$| 8)
           (QSETREFV % 223
                     (CONS (|dispatchFunction| |POLYCAT-;convert;SP;49|)
                           %)))))))))
    (COND
     ((|testBitVector| |pv$| 13)
      (COND
       ((|testBitVector| |pv$| 12)
        (QSETREFV % 231
                  (CONS (|dispatchFunction| |POLYCAT-;convert;SIf;50|) %))))))
    (COND
     ((|testBitVector| |pv$| 15)
      (COND
       ((|testBitVector| |pv$| 14)
        (QSETREFV % 238
                  (CONS (|dispatchFunction| |POLYCAT-;hashUpdate!;HsSHs;51|)
                        %))))))
    %))) 

(MAKEPROP '|PolynomialCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Equation| 6) (0 . |lhs|)
              (|Union| 9 '#1="failed") (5 . |retractIfCan|) (10 . |retract|)
              (15 . |rhs|) (|List| 9) (|List| %) (20 . |eval|) (|List| 245)
              (27 . |eval|) (33 . |monomials|) (|Union| 17 '#2="failed")
              |POLYCAT-;isPlus;SU;2| (38 . |variables|) (|Boolean|)
              (43 . |monomial?|) (48 . |1|) (|Factored| 6) (52 . |1|)
              (|NonNegativeInteger|) (56 . |degree|) (62 . |monomial|)
              (69 . |leadingCoefficient|) (74 . |1|) (78 . =) (84 . |coerce|)
              (89 . |isTimes|) (94 . |mainVariable|) (99 . =)
              (|Record| (|:| |var| 9) (|:| |exponent| 30))
              (|Union| 40 '#3="failed") (105 . |isExpt|)
              (|SparseUnivariatePolynomial| %) (110 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (116 . |coefficient|)
              |POLYCAT-;coefficient;SVarSetNniS;5| (|List| 30)
              (122 . |coefficient|) |POLYCAT-;coefficient;SLLS;6|
              (129 . |coerce|) |POLYCAT-;retract;SVarSet;7|
              |POLYCAT-;retractIfCan;SU;8| (134 . |ground?|) (139 . |0|)
              (143 . |0|) (147 . |0|) (151 . ~=) (157 . |degree|)
              (162 . |leadingCoefficient|) (167 . |totalDegree|)
              (172 . |reductum|) |POLYCAT-;totalDegree;SNni;9| (177 . <)
              (183 . =) (189 . |totalDegreeSorted|)
              |POLYCAT-;totalDegreeSorted;SLNni;10| (|Mapping| 25 9 9)
              (195 . |sort|) |POLYCAT-;totalDegree;SLNni;11|
              (201 . |resultant|) (207 . |resultant|) (214 . |discriminant|)
              (219 . |discriminant|) (225 . |primitiveMonomials|) (|List| 6)
              (230 . |concat|) (235 . |removeDuplicates!|) (|Integer|)
              (|Vector| 7) (240 . |minIndex|) (245 . |coefficient|)
              (|List| 244) (|Matrix| 7) (251 . |matrix|) (|List| 76)
              (|Matrix| 6) (256 . |listOfLists|) (261 . |degree|)
              (266 . |vertConcat|) (|Matrix| %) (272 . |reducedSystem|)
              (|Vector| 6) (277 . |entries|) (282 . |concat|) (288 . |concat|)
              (|Record| (|:| |mat| 84) (|:| |vec| 80)) (|Vector| %)
              (294 . |reducedSystem|) (|Union| 101 '"failed") (|List| 45)
              (|PolynomialFactorizationByRecursion| 7 8 9 6)
              (300 . |solveLinearPolynomialEquationByRecursion|)
              (|Union| 105 '#4="failed") (|List| 43)
              (306 . |solveLinearPolynomialEquation|) (|Factored| 45)
              (|MultFiniteFactorize| 9 8 7 6) (312 . |factor|) (|Factored| 43)
              (317 . |factorPolynomial|) (322 . |factorSquareFreePolynomial|)
              (327 . |factor|) (|Factored| %) (332 . |factor|)
              (337 . |factorPolynomial|)
              (|Mapping| (|Factored| (|SparseUnivariatePolynomial| 7))
                         (|SparseUnivariatePolynomial| 7))
              (|InnerMultFact| 9 8 7 6) (342 . |factor|) (348 . |factor|)
              (|GeneralPolynomialGcdPackage| 8 9 7 6) (354 . |gcdPolynomial|)
              (360 . |gcdPolynomial|) (366 . |factorByRecursion|)
              (371 . |factorSquareFreeByRecursion|) (376 . |factor|)
              (|Factored| 7) (381 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 129) (|:| |factor| 7) (|:| |exponent| 30))
              (|List| 130) (386 . |factorList|)
              (|Record| (|:| |flag| 129) (|:| |factor| 6) (|:| |exponent| 30))
              (|List| 133) (391 . |makeFR|) (397 . |unit|)
              (402 . |multivariate|)
              (|Record| (|:| |flag| 129) (|:| |factor| 45) (|:| |exponent| 30))
              (|List| 138) (408 . |factorList|) (413 . |transpose|)
              (418 . |characteristic|) (422 . |setUnion|) (428 . |degree|)
              (434 . |monomial|) (441 . |ground|) (446 . |transpose|)
              (|Union| 98 '#4#) (451 . |conditionP|) (456 . |elt|) (462 . *)
              (468 . +) (474 . |conditionP|) (|Union| % '#4#)
              (479 . |charthRoot|) (484 . |charthRoot|) (489 . |coefficient|)
              (496 . -) (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (502 . |monicDivide|) (508 . |monicDivide|)
              (|MultivariateSquareFree| 8 9 7 6) (515 . |squareFree|)
              (520 . |squareFree|) (|PolynomialSquareFree| 9 8 7 6)
              (525 . |squareFree|) (530 . |squareFree|) (535 . |unit|)
              (540 . |factorList|) (545 . |squareFreePart|) (550 . |content|)
              (555 . |content|) (561 . |zero?|) (566 . |content|)
              (571 . |exquo|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (577 . |unitNormal|) (582 . |primitivePart|) (587 . |content|)
              (593 . |exquo|) (599 . |primitivePart|) (605 . ~=) (611 . <)
              (617 . |0|) (621 . |smaller?|) (627 . ~=) (633 . |reductum|)
              (638 . |smaller?|) (|PatternMatchResult| 79 6) (|Pattern| 79)
              (|PatternMatchPolynomialCategory| 79 8 9 7 6)
              (644 . |patternMatch|) (|PatternMatchResult| 79 %)
              (651 . |patternMatch|) (|PatternMatchResult| (|Float|) 6)
              (|Pattern| (|Float|))
              (|PatternMatchPolynomialCategory| (|Float|) 8 9 7 6)
              (658 . |patternMatch|) (|PatternMatchResult| (|Float|) %)
              (665 . |patternMatch|) (|Union| 7 '#1#) (672 . |retractIfCan|)
              (677 . |convert|) (682 . |convert|) (687 . |isExpt|) (692 . ^)
              (698 . |isTimes|) (703 . |1|) (707 . |convert|) (712 . *)
              (718 . |isPlus|) (723 . |0|) (727 . +) (733 . |convert|)
              (738 . |convert|) (743 . |convert|) (748 . ^) (754 . |1|)
              (758 . |convert|) (763 . *) (769 . |0|) (773 . +)
              (779 . |convert|) (|InputForm|) (784 . |convert|)
              (789 . |convert|) (|Mapping| 224 9) (|Mapping| 224 7)
              (|PolynomialCategoryLifting| 8 9 7 6 224) (794 . |map|)
              (801 . |convert|) (|HashState|) (806 . |hashUpdate!|)
              (812 . |hashUpdate!|) (818 . |hashUpdate!|) (824 . |hashUpdate!|)
              (830 . |ground|) (835 . |hashUpdate!|) (|Union| 79 '#1#)
              (|Union| 241 '#1#) (|Fraction| 79)
              (|Record| (|:| |mat| 243) (|:| |vec| (|Vector| 79)))
              (|Matrix| 79) (|List| 7) (|Equation| %))
           '#(|totalDegreeSorted| 841 |totalDegree| 847 |squareFreePart| 858
              |squareFree| 863 |solveLinearPolynomialEquation| 868 |smaller?|
              874 |retractIfCan| 880 |retract| 885 |resultant| 890
              |reducedSystem| 897 |primitivePart| 908 |patternMatch| 919
              |monicDivide| 933 |isTimes| 940 |isPlus| 945 |isExpt| 950
              |hashUpdate!| 955 |gcdPolynomial| 961
              |factorSquareFreePolynomial| 967 |factorPolynomial| 972 |factor|
              977 |eval| 982 |discriminant| 988 |convert| 994 |content| 1009
              |conditionP| 1015 |coefficient| 1020 |charthRoot| 1034)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|retractIfCan| ((|Union| |#4| #1#) |#1|)) T)
                              '((|retract| (|#4| |#1|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                T)
                              '((|eval| (|#1| |#1| |#1| |#1|)) T)
                              '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                              '((|eval| (|#1| |#1| (|List| (|Equation| |#1|))))
                                T)
                              '((|hashUpdate!|
                                 ((|HashState|) (|HashState|) |#1|))
                                T)
                              '((|convert| ((|InputForm|) |#1|)) T)
                              '((|convert| ((|Pattern| (|Integer|)) |#1|)) T)
                              '((|convert| ((|Pattern| (|Float|)) |#1|)) T)
                              '((|patternMatch|
                                 ((|PatternMatchResult| (|Integer|) |#1|) |#1|
                                  (|Pattern| (|Integer|))
                                  (|PatternMatchResult| (|Integer|) |#1|)))
                                T)
                              '((|patternMatch|
                                 ((|PatternMatchResult| (|Float|) |#1|) |#1|
                                  (|Pattern| (|Float|))
                                  (|PatternMatchResult| (|Float|) |#1|)))
                                T)
                              '((|gcdPolynomial|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|squareFree| ((|Factored| |#1|) |#1|)) T)
                              '((|squareFreePart| (|#1| |#1|)) T)
                              '((|factor| ((|Factored| |#1|) |#1|)) T)
                              '((|factorPolynomial|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial| |#1|))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|factorSquareFreePolynomial|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial| |#1|))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|solveLinearPolynomialEquation|
                                 ((|Union|
                                   (|List| (|SparseUnivariatePolynomial| |#1|))
                                   #4#)
                                  (|List| (|SparseUnivariatePolynomial| |#1|))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|conditionP|
                                 ((|Union| (|Vector| |#1|) #4#)
                                  (|Matrix| |#1|)))
                                T)
                              '((|charthRoot| ((|Union| |#1| #4#) |#1|)) T)
                              '((|primitivePart| (|#1| |#1| |#4|)) T)
                              '((|content| (|#1| |#1| |#4|)) T)
                              '((|discriminant| (|#1| |#1| |#4|)) T)
                              '((|resultant| (|#1| |#1| |#1| |#4|)) T)
                              '((|isExpt|
                                 ((|Union|
                                   (|Record| (|:| |var| |#4|)
                                             (|:| |exponent|
                                                  (|NonNegativeInteger|)))
                                   #3#)
                                  |#1|))
                                T)
                              '((|isTimes|
                                 ((|Union| (|List| |#1|) "failed") |#1|))
                                T)
                              '((|isPlus| ((|Union| (|List| |#1|) #2#) |#1|))
                                T)
                              '((|monicDivide|
                                 ((|Record| (|:| |quotient| |#1|)
                                            (|:| |remainder| |#1|))
                                  |#1| |#1| |#4|))
                                T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#4|) (|List| |#1|)))
                                T)
                              '((|eval| (|#1| |#1| |#4| |#1|)) T)
                              '((|eval|
                                 (|#1| |#1| (|List| |#4|) (|List| |#2|)))
                                T)
                              '((|eval| (|#1| |#1| |#4| |#2|)) T)
                              '((|reducedSystem|
                                 ((|Matrix| |#2|) (|Matrix| |#1|)))
                                T)
                              '((|reducedSystem|
                                 ((|Record| (|:| |mat| (|Matrix| |#2|))
                                            (|:| |vec| (|Vector| |#2|)))
                                  (|Matrix| |#1|) (|Vector| |#1|)))
                                T)
                              '((|reducedSystem|
                                 ((|Record| (|:| |mat| (|Matrix| (|Integer|)))
                                            (|:| |vec| (|Vector| (|Integer|))))
                                  (|Matrix| |#1|) (|Vector| |#1|)))
                                T)
                              '((|reducedSystem|
                                 ((|Matrix| (|Integer|)) (|Matrix| |#1|)))
                                T)
                              '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                              '((|totalDegreeSorted|
                                 ((|NonNegativeInteger|) |#1| (|List| |#4|)))
                                T)
                              '((|totalDegree|
                                 ((|NonNegativeInteger|) |#1| (|List| |#4|)))
                                T)
                              '((|totalDegree| ((|NonNegativeInteger|) |#1|))
                                T)
                              '((|coefficient|
                                 (|#1| |#1| (|List| |#4|)
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|coefficient|
                                 (|#1| |#1| |#4| (|NonNegativeInteger|)))
                                T)
                              '((|primitivePart| (|#1| |#1|)) T)
                              '((|content| (|#2| |#1|)) T)
                              '((|retractIfCan| ((|Union| |#2| #1#) |#1|)) T)
                              '((|retract| (|#2| |#1|)) T)
                              '((|retract| ((|Fraction| (|Integer|)) |#1|)) T)
                              '((|retractIfCan|
                                 ((|Union| (|Fraction| (|Integer|)) #1#) |#1|))
                                T)
                              '((|retract| ((|Integer|) |#1|)) T)
                              '((|retractIfCan|
                                 ((|Union| (|Integer|) #1#) |#1|))
                                T)
                              '((|coefficient| (|#2| |#1| |#3|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 238
                                            '(1 10 6 0 11 1 6 12 0 13 1 6 9 0
                                              14 1 10 6 0 15 3 6 0 0 16 17 18 2
                                              0 0 0 19 20 1 6 17 0 21 1 6 16 0
                                              24 1 6 25 0 26 0 6 0 27 0 28 0 29
                                              2 6 30 0 9 31 3 6 0 0 9 30 32 1 6
                                              7 0 33 0 7 0 34 2 7 25 0 0 35 1 6
                                              0 7 36 1 0 22 0 37 1 6 12 0 38 2
                                              6 25 0 0 39 1 0 41 0 42 2 6 43 0
                                              9 44 2 45 6 0 30 46 3 6 0 0 16 48
                                              49 1 6 0 9 51 1 6 25 0 54 0 6 0
                                              55 0 7 0 56 0 45 0 57 2 45 25 0 0
                                              58 1 45 30 0 59 1 45 6 0 60 1 6
                                              30 0 61 1 45 0 0 62 2 9 25 0 0 64
                                              2 9 25 0 0 65 2 6 30 0 16 66 2 16
                                              0 68 0 69 2 45 6 0 0 71 3 0 0 0 0
                                              9 72 1 45 6 0 73 2 0 0 0 9 74 1 6
                                              17 0 75 1 76 0 17 77 1 76 0 0 78
                                              1 80 79 0 81 2 6 7 0 8 82 1 84 0
                                              83 85 1 87 86 0 88 1 6 8 0 89 2
                                              84 0 0 0 90 1 0 84 91 92 1 93 76
                                              0 94 2 76 0 0 0 95 2 80 0 0 0 96
                                              2 0 97 91 98 99 2 102 100 101 45
                                              103 2 0 104 105 43 106 1 108 107
                                              45 109 1 0 110 43 111 1 0 110 43
                                              112 1 108 28 6 113 1 0 114 0 115
                                              1 7 110 43 116 2 118 107 45 117
                                              119 2 118 28 6 117 120 2 121 45
                                              45 45 122 2 0 43 43 43 123 1 102
                                              107 45 124 1 102 107 45 125 1 7
                                              114 0 126 1 127 7 0 128 1 127 131
                                              0 132 2 28 0 6 134 135 1 107 45 0
                                              136 2 6 0 43 9 137 1 107 139 0
                                              140 1 87 0 0 141 0 6 30 142 2 76
                                              0 0 0 143 2 6 48 0 16 144 3 6 0 0
                                              16 48 145 1 6 7 0 146 1 84 0 0
                                              147 1 7 148 91 149 2 80 7 0 79
                                              150 2 6 0 0 0 151 2 6 0 0 0 152 1
                                              0 148 91 153 1 7 154 0 155 1 0
                                              154 0 156 3 6 0 0 9 30 157 2 6 0
                                              0 0 158 2 45 159 0 0 160 3 0 159
                                              0 0 9 161 1 162 28 6 163 1 0 114
                                              0 164 1 165 28 6 166 1 6 114 0
                                              167 1 28 6 0 168 1 28 134 0 169 1
                                              0 0 0 170 1 45 6 0 171 2 0 0 0 9
                                              172 1 6 25 0 173 1 6 7 0 174 2 6
                                              154 0 7 175 1 6 176 0 177 1 0 0 0
                                              178 2 6 0 0 9 179 2 6 154 0 0 180
                                              2 0 0 0 9 181 2 6 25 0 0 182 2 8
                                              25 0 0 183 0 8 0 184 2 7 25 0 0
                                              185 2 7 25 0 0 186 1 6 0 0 187 2
                                              0 25 0 0 188 3 191 189 6 190 189
                                              192 3 0 193 0 190 193 194 3 197
                                              195 6 196 195 198 3 0 199 0 196
                                              199 200 1 6 201 0 202 1 7 190 0
                                              203 1 9 190 0 204 1 6 41 0 205 2
                                              190 0 0 30 206 1 6 22 0 207 0 190
                                              0 208 1 6 190 0 209 2 190 0 0 0
                                              210 1 6 22 0 211 0 190 0 212 2
                                              190 0 0 0 213 1 0 190 0 214 1 7
                                              196 0 215 1 9 196 0 216 2 196 0 0
                                              30 217 0 196 0 218 1 6 196 0 219
                                              2 196 0 0 0 220 0 196 0 221 2 196
                                              0 0 0 222 1 0 196 0 223 1 9 224 0
                                              225 1 7 224 0 226 3 229 224 227
                                              228 6 230 1 0 224 0 231 2 7 232
                                              232 0 233 2 9 232 232 0 234 2 30
                                              232 232 0 235 2 6 232 232 0 236 1
                                              45 6 0 237 2 0 232 232 0 238 2 0
                                              30 0 16 67 1 0 30 0 63 2 0 30 0
                                              16 70 1 0 0 0 170 1 0 114 0 164 2
                                              0 104 105 43 106 2 0 25 0 0 188 1
                                              0 12 0 53 1 0 9 0 52 3 0 0 0 0 9
                                              72 1 0 84 91 92 2 0 97 91 98 99 1
                                              0 0 0 178 2 0 0 0 9 181 3 0 199 0
                                              196 199 200 3 0 193 0 190 193 194
                                              3 0 159 0 0 9 161 1 0 22 0 37 1 0
                                              22 0 23 1 0 41 0 42 2 0 232 232 0
                                              238 2 0 43 43 43 123 1 0 110 43
                                              112 1 0 110 43 111 1 0 114 0 115
                                              2 0 0 0 19 20 2 0 0 0 9 74 1 0
                                              196 0 223 1 0 224 0 231 1 0 190 0
                                              214 2 0 0 0 9 172 1 0 148 91 153
                                              3 0 0 0 9 30 47 3 0 0 0 16 48 50
                                              1 0 154 0 156)))))
           '|lookupComplete|)) 
