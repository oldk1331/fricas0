
(SDEFUN |DJBP;lookup| ((|jv| (JB)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|ljv| NIL) (#1=#:G39 NIL) (|i| NIL) (#2=#:G38 NIL) (#3=#:G37 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |ljv| NIL) (LETT #1# (QREFELT % 8)) (LETT |i| 1)
                 (LETT #2# (QREFELT % 13)) G190
                 (COND
                  ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                       (PROGN (LETT |ljv| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |ljv| |jv| (QREFELT % 17))
                     (PROGN (LETT #3# |i|) (GO #4=#:G36))))))
                 (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                 (GO G190) G191 (EXIT NIL))
            (EXIT (|error| "illegal jet variable"))))
          #4# (EXIT #3#)))) 

(SDEFUN |DJBP;monomial;%JBNni%;2|
        ((|p| (%)) (|jv| (JB)) (|e| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|v| (|Vector| (|NonNegativeInteger|))))
         (SEQ (LETT |j| (|DJBP;lookup| |jv| %))
              (LETT |v| (SPADCALL (QREFELT % 13) (QREFELT % 20)))
              (QSETAREF1O |v| |j| |e| 1)
              (EXIT
               (SPADCALL |p|
                         (SPADCALL (|spadConstant| % 23)
                                   (SPADCALL |v| (QREFELT % 24))
                                   (QREFELT % 25))
                         (QREFELT % 26)))))) 

(SDEFUN |DJBP;coerce;JB%;3| ((|jv| (JB)) (% (%)))
        (SPADCALL (|spadConstant| % 22) |jv| 1 (QREFELT % 27))) 

(MAKEPROP '|DJBP;zero?;%B;4| '|SPADreplace| 'NULL) 

(SDEFUN |DJBP;zero?;%B;4| ((|p| (%)) (% (|Boolean|))) (NULL |p|)) 

(SDEFUN |DJBP;ground?;%B;5| ((|p| (%)) (% (|Boolean|)))
        (QEQCAR (SPADCALL |p| (QREFELT % 31)) 1)) 

(SDEFUN |DJBP;monomial?;%B;6| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p|)
                    (EXIT (COND ((NULL |l|) 'T) ('T (NULL (CDR |l|)))))))) 

(SDEFUN |DJBP;numberOfMonomials;%Nni;7| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((|l| (|Rep|)))
               (SEQ (LETT |l| |p|)
                    (EXIT (COND ((NULL |l|) 1) ('T (LENGTH |l|))))))) 

(SDEFUN |DJBP;mainVariable;%U;8| ((|p| (%)) (% (|Union| JB "failed")))
        (SPROG
         ((|tdeg| (E)) (|jv| NIL) (#1=#:G67 NIL) (|i| NIL) (#2=#:G66 NIL)
          (#3=#:G65 NIL))
         (SEQ
          (EXIT
           (COND ((SPADCALL |p| (QREFELT % 29)) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT % 35)))
                       (SEQ (LETT |jv| NIL) (LETT #1# (QREFELT % 8))
                            (LETT |i| 1) (LETT #2# (QREFELT % 13)) G190
                            (COND
                             ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                                  (PROGN (LETT |jv| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (ZEROP (SPADCALL |tdeg| |i| (QREFELT % 37))))
                                (PROGN
                                 (LETT #3# (CONS 0 |jv|))
                                 (GO #4=#:G64))))))
                            (LETT |i|
                                  (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                            (GO G190) G191 (EXIT NIL))
                       (EXIT (CONS 1 "failed"))))))
          #4# (EXIT #3#)))) 

(SDEFUN |DJBP;variables;%L;9| ((|p| (%)) (% (|List| JB)))
        (SPROG
         ((|maxdeg| (|Vector| (|NonNegativeInteger|))) (|tdeg| (E))
          (#1=#:G81 NIL) (#2=#:G82 NIL) (|i| NIL) (#3=#:G84 NIL) (|jv| NIL)
          (#4=#:G83 NIL))
         (SEQ (LETT |maxdeg| (SPADCALL (QREFELT % 13) 0 (QREFELT % 40)))
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 29)))) (GO G191)))
                   (SEQ (LETT |tdeg| (SPADCALL |p| (QREFELT % 35)))
                        (LETT |p| (SPADCALL |p| (QREFELT % 41)))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 13)) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |maxdeg| |i|
                                          (MAX
                                           (SPADCALL |maxdeg| |i|
                                                     (QREFELT % 42))
                                           (SPADCALL |tdeg| |i|
                                                     (QREFELT % 37)))
                                          (QREFELT % 43))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |i| 1) (LETT #3# (QREFELT % 13)) (LETT |jv| NIL)
                     (LETT #4# (QREFELT % 8)) G190
                     (COND
                      ((OR (ATOM #4#) (PROGN (LETT |jv| (CAR #4#)) NIL)
                           (|greater_SI| |i| #3#))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |maxdeg| |i| (QREFELT % 42)) 0
                                   (QREFELT % 44))
                         (LETT #2# (CONS |jv| #2#))))))
                     (LETT #4# (PROG1 (CDR #4#) (LETT |i| (|inc_SI| |i|))))
                     (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |DJBP;coerce;%Of;10| ((|p| (%)) (% (|OutputForm|)))
        (SPROG
         ((|t| NIL) (#1=#:G103 NIL) (|i| NIL) (#2=#:G104 NIL)
          (|l| (|List| (|OutputForm|))) (|lt| (|List| (|OutputForm|))))
         (SEQ
          (COND
           ((SPADCALL |p| (QREFELT % 29))
            (SPADCALL (|spadConstant| % 39) (QREFELT % 47)))
           (#3='T
            (SEQ (LETT |lt| NIL)
                 (SEQ (LETT |t| NIL) (LETT #1# (REVERSE |p|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |l| NIL)
                           (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 13)) G190
                                (COND ((|greater_SI| |i| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT % 37))
                                     0)
                                    |l|)
                                   ((EQL
                                     (SPADCALL (QCAR |t|) |i| (QREFELT % 37))
                                     1)
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL (QREFELT % 12) |i|
                                                     (QREFELT % 49))
                                           |l|)))
                                   ('T
                                    (LETT |l|
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL (QREFELT % 12) |i|
                                                      (QREFELT % 49))
                                            (SPADCALL
                                             (SPADCALL (QCAR |t|) |i|
                                                       (QREFELT % 37))
                                             (QREFELT % 50))
                                            (QREFELT % 51))
                                           |l|))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |l| (REVERSE |l|))
                           (COND
                            ((OR
                              (SPADCALL (QCDR |t|) (|spadConstant| % 23)
                                        (QREFELT % 52))
                              (NULL |l|))
                             (LETT |l|
                                   (CONS (SPADCALL (QCDR |t|) (QREFELT % 47))
                                         |l|))))
                           (EXIT
                            (COND
                             ((EQL (LENGTH |l|) 1)
                              (LETT |lt| (CONS (|SPADfirst| |l|) |lt|)))
                             ('T
                              (LETT |lt|
                                    (CONS
                                     (SPADCALL (ELT % 53) |l| (QREFELT % 55))
                                     |lt|))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND ((EQL (LENGTH |lt|) 1) (|SPADfirst| |lt|))
                        (#3# (SPADCALL (ELT % 56) |lt| (QREFELT % 55))))))))))) 

(SDEFUN |DJBP;convert;Jbp%;11| ((|p| (|JetBundlePolynomial| R JB)) (% (%)))
        (SPROG
         ((|xx| (|Union| JB "failed")) (|cc| (R)) (|x| (JB)) (|res| (%))
          (|up| (|SparseUnivariatePolynomial| (|JetBundlePolynomial| R JB))))
         (SEQ (LETT |xx| (SPADCALL |p| (QREFELT % 59)))
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (SEQ (LETT |cc| (SPADCALL |p| (QREFELT % 60)))
                      (EXIT (SPADCALL |cc| (QREFELT % 61)))))
                ('T
                 (SEQ (LETT |x| (QCDR |xx|))
                      (COND
                       ((NULL (SPADCALL |x| (QREFELT % 8) (QREFELT % 62)))
                        (EXIT (|error| "illegal jet variable"))))
                      (LETT |up| (SPADCALL |p| |x| (QREFELT % 64)))
                      (LETT |res| (|spadConstant| % 38))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |up| (QREFELT % 66))))
                             (GO G191)))
                           (SEQ
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |up| (QREFELT % 67))
                                              (QREFELT % 68))
                                             |x| (SPADCALL |up| (QREFELT % 69))
                                             (QREFELT % 27))
                                            (QREFELT % 70)))
                            (EXIT (LETT |up| (SPADCALL |up| (QREFELT % 71)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |DJBP;convert;%Jbp;12| ((|p| (%)) (% (|JetBundlePolynomial| R JB)))
        (SPROG
         ((|xx| (|Union| JB "failed")) (|cc| (R)) (|x| (JB))
          (|res| (|JetBundlePolynomial| R JB))
          (|up| (|SparseUnivariatePolynomial| %)))
         (SEQ (LETT |xx| (SPADCALL |p| (QREFELT % 31)))
              (EXIT
               (COND
                ((QEQCAR |xx| 1)
                 (SEQ (LETT |cc| (SPADCALL |p| (QREFELT % 72)))
                      (EXIT (SPADCALL |cc| (QREFELT % 73)))))
                ('T
                 (SEQ (LETT |x| (QCDR |xx|))
                      (LETT |up| (SPADCALL |p| |x| (QREFELT % 74)))
                      (LETT |res| (|spadConstant| % 75))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |up| (QREFELT % 77))))
                             (GO G191)))
                           (SEQ
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |up| (QREFELT % 78))
                                              (QREFELT % 79))
                                             |x| (SPADCALL |up| (QREFELT % 80))
                                             (QREFELT % 81))
                                            (QREFELT % 82)))
                            (EXIT (LETT |up| (SPADCALL |up| (QREFELT % 83)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |DJBP;const;%R;13| ((|p| (%)) (% (R)))
        (COND ((NULL (SPADCALL |p| (QREFELT % 32))) (|error| "not a constant"))
              ('T (SPADCALL |p| (QREFELT % 84))))) 

(SDEFUN |DJBP;retractIfCan;%U;14| ((|p| (%)) (% (|Union| R "failed")))
        (COND
         ((SPADCALL |p| (QREFELT % 32)) (CONS 0 (SPADCALL |p| (QREFELT % 84))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |DJBP;retract;%R;15| ((|p| (%)) (% (R))) (SPADCALL |p| (QREFELT % 85))) 

(SDEFUN |DJBP;univariate;%JBSup;16|
        ((|p| (%)) (|jv| (JB)) (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|exp| (E)) (|j| (|NonNegativeInteger|)) (#1=#:G147 NIL) (|i| NIL)
          (#2=#:G148 NIL) (#3=#:G146 NIL) (|deg| (|NonNegativeInteger|))
          (|nexp| (E)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 29)) (|spadConstant| % 88))
                ('T
                 (SEQ (LETT |exp| (SPADCALL |p| (QREFELT % 35)))
                      (LETT |j| (|DJBP;lookup| |jv| %)) (LETT |deg| 0)
                      (LETT |nexp|
                            (SPADCALL
                             (PROGN
                              (LETT #1# (GETREFV #4=(QREFELT % 13)))
                              (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0)
                                   G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (SETELT #1# #3#
                                             (COND
                                              ((EQL |j| |i|)
                                               (SEQ
                                                (LETT |deg|
                                                      (SPADCALL |exp| |i|
                                                                (QREFELT %
                                                                         37)))
                                                (EXIT 0)))
                                              ('T
                                               (SPADCALL |exp| |i|
                                                         (QREFELT % 37)))))))
                                   (LETT #3#
                                         (PROG1 (|inc_SI| #3#)
                                           (LETT |i| (|inc_SI| |i|))))
                                   (GO G190) G191 (EXIT NIL))
                              #1#)
                             (QREFELT % 24)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (SPADCALL (SPADCALL |p| (QREFELT % 84)) |nexp|
                                   (QREFELT % 25))
                         |deg| (QREFELT % 89))
                        (SPADCALL (SPADCALL |p| (QREFELT % 41)) |jv|
                                  (QREFELT % 74))
                        (QREFELT % 90))))))))) 

(SDEFUN |DJBP;univariate;%Sup;17|
        ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|pv| (|Union| JB "failed")) (|res| (|SparseUnivariatePolynomial| R))
          (|up| (|SparseUnivariatePolynomial| %)))
         (SEQ (LETT |pv| (SPADCALL |p| (QREFELT % 31)))
              (EXIT
               (COND
                ((QEQCAR |pv| 1)
                 (SPADCALL (SPADCALL |p| (QREFELT % 84)) 0 (QREFELT % 92)))
                ('T
                 (SEQ (LETT |up| (SPADCALL |p| (QCDR |pv|) (QREFELT % 74)))
                      (LETT |res| (|spadConstant| % 93))
                      (SEQ G190
                           (COND
                            ((NULL (NULL (SPADCALL |up| (QREFELT % 77))))
                             (GO G191)))
                           (SEQ
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |up| (QREFELT % 78))
                                              (QREFELT % 85))
                                             (SPADCALL |up| (QREFELT % 80))
                                             (QREFELT % 92))
                                            (QREFELT % 94)))
                            (EXIT (LETT |up| (SPADCALL |up| (QREFELT % 83)))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |DJBP;multivariate;SupJB%;18|
        ((|p1| (|SparseUnivariatePolynomial| %)) (|jv| (JB)) (% (%)))
        (COND ((SPADCALL |p1| (QREFELT % 77)) (|spadConstant| % 38))
              ((ZEROP (SPADCALL |p1| (QREFELT % 80)))
               (SPADCALL |p1| (QREFELT % 78)))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p1| (QREFELT % 78))
                          (SPADCALL (SPADCALL |jv| (QREFELT % 28))
                                    (SPADCALL |p1| (QREFELT % 80))
                                    (QREFELT % 96))
                          (QREFELT % 26))
                (SPADCALL (SPADCALL |p1| (QREFELT % 83)) |jv| (QREFELT % 97))
                (QREFELT % 70))))) 

(SDEFUN |DJBP;multivariate;SupJB%;19|
        ((|p| (|SparseUnivariatePolynomial| R)) (|jv| (JB)) (% (%)))
        (COND ((SPADCALL |p| (QREFELT % 98)) (|spadConstant| % 38))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| (QREFELT % 99))
                          (SPADCALL (|spadConstant| % 22) |jv|
                                    (SPADCALL |p| (QREFELT % 100))
                                    (QREFELT % 27))
                          (QREFELT % 101))
                (SPADCALL (SPADCALL |p| (QREFELT % 102)) |jv| (QREFELT % 103))
                (QREFELT % 70))))) 

(SDEFUN |DJBP;totalDegree;%Nni;20| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|t| NIL) (#1=#:G172 NIL) (#2=#:G166 #3=(|NonNegativeInteger|))
          (#4=#:G164 #3#) (#5=#:G165 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 29)) 0)
                (#6='T
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2#
                                (SPADCALL (ELT % 104)
                                          (SPADCALL (QCAR |t|) (QREFELT % 105))
                                          0 (QREFELT % 107)))
                          (COND (#5# (LETT #4# (MAX #4# #2#)))
                                ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#5# #4#) (#6# (|IdentityError| '|max|))))))))) 

(SDEFUN |DJBP;degree;%JBNni;21|
        ((|p| (%)) (|jv| (JB)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |p| |jv| (QREFELT % 74)) (QREFELT % 80))) 

(SDEFUN |DJBP;degree;%LL;22|
        ((|p| (%)) (|ljv| (|List| JB)) (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G177 NIL) (|jv| NIL) (#2=#:G178 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |jv| NIL) (LETT #2# |ljv|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |p| |jv| (QREFELT % 109)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |DJBP;minimumDegree;%JBNni;23|
        ((|p| (%)) (|jv| (JB)) (% (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL |p| |jv| (QREFELT % 74)) (QREFELT % 112))) 

(SDEFUN |DJBP;minimumDegree;%LL;24|
        ((|p| (%)) (|ljv| (|List| JB)) (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G183 NIL) (|jv| NIL) (#2=#:G184 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |jv| NIL) (LETT #2# |ljv|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |jv| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |p| |jv| (QREFELT % 113)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |DJBP;eval;%JB2%;25| ((|p| (%)) (|jv| (JB)) (|val| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| |jv| (QREFELT % 74)) |val| (QREFELT % 115))) 

(SDEFUN |DJBP;eval;%JBR%;26| ((|p| (%)) (|jv| (JB)) (|val| (R)) (% (%)))
        (SPADCALL |p| |jv| (SPADCALL |val| (QREFELT % 61)) (QREFELT % 116))) 

(SDEFUN |DJBP;eval;%LL%;27|
        ((|p| (%)) (|ljv| (|List| JB)) (|lval| (|List| R)) (% (%)))
        (COND ((NULL |ljv|) |p|)
              ('T
               (SPADCALL
                (SPADCALL |p| (|SPADfirst| |ljv|)
                          (SPADCALL (|SPADfirst| |lval|) (QREFELT % 61))
                          (QREFELT % 116))
                (CDR |ljv|) (CDR |lval|) (QREFELT % 119))))) 

(SDEFUN |DJBP;evalSortedVarlist|
        ((|p| (%)) (|Ljvar| (|List| JB)) (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|j| (|Union| JB "failed")) (|pv| (JB)) (|mvar| (JB)) (|pval| (%))
          (|pts| (|SparseUnivariatePolynomial| %)))
         (SEQ (LETT |j| (SPADCALL |p| (QREFELT % 31)))
              (EXIT
               (COND ((QEQCAR |j| 1) |p|)
                     (#1='T
                      (SEQ (LETT |pv| (QCDR |j|))
                           (COND
                            ((OR (NULL |Ljvar|)
                                 (SPADCALL |Lpval| (QREFELT % 121)))
                             (EXIT |p|)))
                           (LETT |mvar| (|SPADfirst| |Ljvar|))
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| |pv| (QREFELT % 122))
                              (|DJBP;evalSortedVarlist| |p| (CDR |Ljvar|)
                               (SPADCALL |Lpval| '|rest| (QREFELT % 124)) %))
                             (#1#
                              (SEQ
                               (LETT |pval|
                                     (SPADCALL |Lpval| '|first|
                                               (QREFELT % 126)))
                               (LETT |pts|
                                     (SPADCALL
                                      (CONS #'|DJBP;evalSortedVarlist!0|
                                            (VECTOR % |Lpval| |Ljvar|))
                                      (SPADCALL |p| |pv| (QREFELT % 74))
                                      (QREFELT % 128)))
                               (EXIT
                                (COND
                                 ((SPADCALL |mvar| |pv| (QREFELT % 17))
                                  (SPADCALL |pts| |pval| (QREFELT % 115)))
                                 (#1#
                                  (SPADCALL |pts| |pv|
                                            (QREFELT % 97)))))))))))))))) 

(SDEFUN |DJBP;evalSortedVarlist!0| ((|x| NIL) ($$ NIL))
        (PROG (|Ljvar| |Lpval| %)
          (LETT |Ljvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|DJBP;evalSortedVarlist| |x| |Ljvar| |Lpval| %))))) 

(SDEFUN |DJBP;eval;%LL%;29|
        ((|p| (%)) (|Ljvar| (|List| JB)) (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|nljvar| (|List| JB)) (#1=#:G206 NIL) (|mvar| NIL) (#2=#:G207 NIL)
          (|nlpval| (|List| %)))
         (SEQ
          (LETT |nljvar|
                (SPADCALL (CONS #'|DJBP;eval;%LL%;29!0| %) |Ljvar|
                          (QREFELT % 131)))
          (LETT |nlpval|
                (COND ((SPADCALL |Ljvar| |nljvar| (QREFELT % 132)) |Lpval|)
                      ('T
                       (LETT |nlpval|
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |mvar| NIL) (LETT #2# |nljvar|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |mvar| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (SPADCALL |Lpval|
                                                      (SPADCALL |mvar| |Ljvar|
                                                                (QREFELT %
                                                                         133))
                                                      (QREFELT % 134))
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#))))))))
          (EXIT (|DJBP;evalSortedVarlist| |p| |nljvar| |nlpval| %))))) 

(SDEFUN |DJBP;eval;%LL%;29!0| ((|x| NIL) (|y| NIL) (% NIL))
        (SPADCALL (|DJBP;lookup| |x| %) (|DJBP;lookup| |y| %) (QREFELT % 129))) 

(SDEFUN |DJBP;differentiate;%JB%;30| ((|p| (%)) (|jv| (JB)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |p| |jv| (QREFELT % 74)) (QREFELT % 137))
                  |jv| (QREFELT % 97))) 

(SDEFUN |DJBP;/;%R%;31| ((|p| (%)) (|r| (R)) (% (%)))
        (SPADCALL (SPADCALL |r| (QREFELT % 139)) |p| (QREFELT % 101))) 

(SDEFUN |DJBP;content;%R;32| ((|p| (%)) (% (R)))
        (SPROG
         ((|t| NIL) (#1=#:G215 NIL) (#2=#:G212 (R)) (#3=#:G210 (R))
          (#4=#:G211 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 29)) (|spadConstant| % 39))
                (#5='T
                 (PROGN
                  (LETT #4# NIL)
                  (SEQ (LETT |t| NIL) (LETT #1# |p|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2# (QCDR |t|))
                          (COND
                           (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 141))))
                           ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#4# #3#) (#5# (|spadConstant| % 39))))))))) 

(SDEFUN |DJBP;gcd;3%;33| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|pv1| #1=(|Union| JB "failed")) (|pv2| #1#) (|r| (R)))
               (SEQ (LETT |pv1| (SPADCALL |p1| (QREFELT % 31)))
                    (EXIT
                     (COND
                      ((QEQCAR |pv1| 1)
                       (COND
                        ((SPADCALL (LETT |r| (SPADCALL |p1| (QREFELT % 84)))
                                   (QREFELT % 143))
                         |p2|)
                        (#2='T
                         (SPADCALL
                          (SPADCALL |r| (SPADCALL |p2| (QREFELT % 142))
                                    (QREFELT % 141))
                          (QREFELT % 61)))))
                      (#2#
                       (SEQ (LETT |pv2| (SPADCALL |p2| (QREFELT % 31)))
                            (EXIT
                             (COND
                              ((QEQCAR |pv2| 1)
                               (COND
                                ((SPADCALL
                                  (LETT |r| (SPADCALL |p2| (QREFELT % 84)))
                                  (QREFELT % 143))
                                 |p1|)
                                (#2#
                                 (SPADCALL
                                  (SPADCALL |r| (SPADCALL |p1| (QREFELT % 142))
                                            (QREFELT % 141))
                                  (QREFELT % 61)))))
                              ((SPADCALL (QCDR |pv1|) (QCDR |pv2|)
                                         (QREFELT % 144))
                               (SPADCALL |p1|
                                         (SPADCALL
                                          (SPADCALL |p2| (QCDR |pv2|)
                                                    (QREFELT % 74))
                                          (QREFELT % 145))
                                         (QREFELT % 146)))
                              ((SPADCALL (QCDR |pv2|) (QCDR |pv1|)
                                         (QREFELT % 144))
                               (SPADCALL |p2|
                                         (SPADCALL
                                          (SPADCALL |p1| (QCDR |pv1|)
                                                    (QREFELT % 74))
                                          (QREFELT % 145))
                                         (QREFELT % 146)))
                              (#2#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |p1| (QCDR |pv1|) (QREFELT % 74))
                                 (SPADCALL |p2| (QCDR |pv2|) (QREFELT % 74))
                                 (QREFELT % 147))
                                (QCDR |pv1|) (QREFELT % 97)))))))))))) 

(SDEFUN |DJBP;gcd;3%;34| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 149))) 

(SDEFUN |DJBP;gcd;3%;35| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|pv1| #1=(|Union| JB "failed")) (|pv2| #1#) (|r| (R)))
               (SEQ (LETT |pv1| (SPADCALL |p1| (QREFELT % 31)))
                    (EXIT
                     (COND
                      ((QEQCAR |pv1| 1)
                       (COND
                        ((SPADCALL (LETT |r| (SPADCALL |p1| (QREFELT % 84)))
                                   (QREFELT % 143))
                         |p2|)
                        (#2='T
                         (SPADCALL
                          (SPADCALL |r| (SPADCALL |p2| (QREFELT % 142))
                                    (QREFELT % 141))
                          (QREFELT % 61)))))
                      (#2#
                       (SEQ (LETT |pv2| (SPADCALL |p2| (QREFELT % 31)))
                            (EXIT
                             (COND
                              ((QEQCAR |pv2| 1)
                               (COND
                                ((SPADCALL
                                  (LETT |r| (SPADCALL |p2| (QREFELT % 84)))
                                  (QREFELT % 143))
                                 |p1|)
                                (#2#
                                 (SPADCALL
                                  (SPADCALL |r| (SPADCALL |p1| (QREFELT % 142))
                                            (QREFELT % 141))
                                  (QREFELT % 61)))))
                              ((SPADCALL (QCDR |pv1|) (QCDR |pv2|)
                                         (QREFELT % 144))
                               (SPADCALL |p1|
                                         (SPADCALL
                                          (SPADCALL |p2| (QCDR |pv2|)
                                                    (QREFELT % 74))
                                          (QREFELT % 145))
                                         (QREFELT % 146)))
                              ((SPADCALL (QCDR |pv2|) (QCDR |pv1|)
                                         (QREFELT % 144))
                               (SPADCALL |p2|
                                         (SPADCALL
                                          (SPADCALL |p1| (QCDR |pv1|)
                                                    (QREFELT % 74))
                                          (QREFELT % 145))
                                         (QREFELT % 146)))
                              (#2#
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL |p1| (QCDR |pv1|) (QREFELT % 74))
                                 (SPADCALL |p2| (QCDR |pv2|) (QREFELT % 74))
                                 (QREFELT % 147))
                                (QCDR |pv1|) (QREFELT % 97)))))))))))) 

(SDEFUN |DJBP;groebner;2L;36| ((|lp| (|List| %)) (% (|List| %)))
        (SEQ
         (SPADCALL (SPADCALL "groebner$DJBP" (QREFELT % 151)) (QREFELT % 153))
         (EXIT (SPADCALL |lp| (QREFELT % 155))))) 

(DECLAIM (NOTINLINE |DistributedJetBundlePolynomial;|)) 

(DEFUN |DistributedJetBundlePolynomial;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G277 NIL) (#2=#:G276 NIL) (#3=#:G275 NIL) (#4=#:G274 NIL)
    (#5=#:G273 NIL) (#6=#:G272 NIL) (#7=#:G271 NIL) (#8=#:G269 NIL)
    (#9=#:G270 NIL) (#10=#:G268 NIL) (#11=#:G267 NIL) (|pv$| NIL)
    (#12=#:G278 NIL) (|jv| NIL) (#13=#:G279 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT DV$3 |#3|)
     (LETT DV$4 (|devaluate| |#4|))
     (LETT |dv$| (LIST '|DistributedJetBundlePolynomial| DV$1 DV$2 DV$3 DV$4))
     (LETT % (GETREFV 194))
     (QSETREFV % 0 |dv$|)
     (QSETREFV % 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|Fraction| (|Integer|))
                                            '(|CharacteristicZero|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1| '(|Ring|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|canonicalUnitNormal|))
                                         (LETT #1#
                                               (|HasCategory| |#1|
                                                              '(|Comparable|)))
                                         (OR #1#
                                             (|HasCategory| |#1|
                                                            '(|ComparableRepresentation|)))
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1| '(|SemiRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (LETT #2#
                                               (|HasCategory| |#1|
                                                              '(|GcdDomain|)))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          #2#
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
                                         (OR #2#
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|)))
                                         (OR
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|)))
                                          (|HasCategory| |#2|
                                                         '(|ConvertibleTo|
                                                           (|InputForm|))))
                                         (AND
                                          (|HasCategory| |#1| '(|Hashable|))
                                          (|HasCategory| |#2| '(|Hashable|)))
                                         (|HasCategory| |#4| '(|Comparable|))
                                         (|HasCategory| |#1| '(|Field|))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (OR
                                          (AND #1#
                                               (|HasCategory| |#4|
                                                              '(|Comparable|)))
                                          (|HasCategory| |#1|
                                                         '(|ComparableRepresentation|)))
                                         (LETT #3#
                                               (|HasCategory| |#1|
                                                              '(|IntegralDomain|)))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          #2# #3#
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|)))
                                         (OR #2# #3#
                                             (|HasCategory| |#1|
                                                            '(|PolynomialFactorizationExplicit|)))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          #2# #3#)
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CommutativeRing|))
                                          (|HasCategory| |#1| '(|EntireRing|))
                                          #2# #3#
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory| |#1| '(|Ring|)))
                                         (LETT #4#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PatternMatchable|
                                                                 (|Float|)))
                                                (|HasCategory| |#1| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|PatternMatchable|
                                                                 (|Float|)))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Float|)))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Float|))))
                                          #4#)
                                         (LETT #5#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))
                                                (|HasCategory| |#1| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|PatternMatchable|
                                                                 (|Integer|)))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|PatternMatchable|
                                                            (|Integer|)))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|))
                                           (|HasCategory| |#2|
                                                          '(|PatternMatchable|
                                                            (|Integer|))))
                                          #5#)
                                         (LETT #6#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Float|))))
                                                (|HasCategory| |#1| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Float|))))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|))))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Float|)))))
                                          #6#)
                                         (LETT #7#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| |#1| '(|Ring|))
                                                (|HasCategory| |#2|
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|CommutativeRing|))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           #2#
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|))))
                                           (|HasCategory| |#1|
                                                          '(|PolynomialFactorizationExplicit|))
                                           (|HasCategory| |#2|
                                                          '(|ConvertibleTo|
                                                            (|Pattern|
                                                             (|Integer|)))))
                                          #7#)
                                         (LETT #8#
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|))))
                                         (LETT #9#
                                               (AND
                                                (|HasCategory| |#1|
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| |#1|
                                                               '(|Ring|))))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           #8#)
                                          (AND #8#
                                               (|HasCategory| |#1|
                                                              '(|CommutativeRing|)))
                                          (AND #8# #2#)
                                          (AND #8#
                                               (|HasCategory| |#1|
                                                              '(|PolynomialFactorizationExplicit|)))
                                          #9#)
                                         (|HasCategory| (|Integer|)
                                                        '(|AbelianMonoid|))
                                         (LETT #10#
                                               (|HasCategory| |#1|
                                                              '(|AbelianMonoid|)))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|Fraction| (|Integer|))
                                            '(|AbelianMonoid|)))
                                          #10#)
                                         (|HasCategory| (|Integer|)
                                                        '(|AbelianGroup|))
                                         (LETT #11#
                                               (|HasCategory| |#1|
                                                              '(|CancellationAbelianMonoid|)))
                                         (OR
                                          (AND
                                           (|HasCategory| |#1|
                                                          '(|Algebra|
                                                            (|Fraction|
                                                             (|Integer|))))
                                           (|HasCategory|
                                            (|Fraction| (|Integer|))
                                            '(|AbelianMonoid|)))
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          #10# #11#)
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|AbelianGroup|))
                                          #11#)))))
     (|haddProp| |$ConstructorCache| '|DistributedJetBundlePolynomial|
                 (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
     (|stuffDomainSlots| %)
     (QSETREFV % 6 |#1|)
     (QSETREFV % 7 |#2|)
     (QSETREFV % 8 |#3|)
     (QSETREFV % 9 |#4|)
     (AND (|HasCategory| % '(|CommutativeRing|))
          (|augmentPredVector| % 140737488355328))
     (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
          (|HasCategory| % '(|CharacteristicNonZero|))
          (|augmentPredVector| % 281474976710656))
     (AND
      (OR (|HasCategory| |#1| '(|EntireRing|))
          (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
      (|augmentPredVector| % 562949953421312))
     (AND
      (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
          (AND (|HasCategory| |#1| '(|CommutativeRing|))
               (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
          #2#
          (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
      (|augmentPredVector| % 1125899906842624))
     (AND
      (OR
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
      (|augmentPredVector| % 2251799813685248))
     (AND
      (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
          (AND (|HasCategory| |#1| '(|CommutativeRing|))
               (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
          (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
          (|HasCategory| |#1| '(|Ring|)))
      (|augmentPredVector| % 4503599627370496))
     (AND
      (OR
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (|HasCategory| |#1| '(|SemiRing|)))
      (|augmentPredVector| % 9007199254740992))
     (AND
      (OR
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (|HasCategory| |#1| '(|Ring|)))
      (|augmentPredVector| % 18014398509481984))
     (AND
      (OR
       (AND #8# (|HasCategory| |#1| '(|Ring|))
            (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
       #10#
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (|HasCategory| % '(|AbelianMonoid|)))
      (|augmentPredVector| % 36028797018963968))
     (AND
      (OR
       (AND #8# (|HasCategory| |#1| '(|Ring|))
            (|HasCategory| (|Integer|) '(|AbelianGroup|)))
       (AND (|HasCategory| |#1| '(|AbelianGroup|))
            (|HasCategory| |#1| '(|CommutativeRing|)))
       (AND (|HasCategory| |#1| '(|AbelianGroup|))
            (|HasCategory| |#1| '(|Ring|)))
       #11#
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (|HasCategory| % '(|AbelianGroup|)))
      (|augmentPredVector| % 72057594037927936))
     (AND
      (OR
       (AND #8# (|HasCategory| |#1| '(|Ring|))
            (|HasCategory| (|Integer|) '(|AbelianGroup|)))
       (|HasCategory| |#1| '(|AbelianGroup|))
       (AND (|HasCategory| |#1| '(|CommutativeRing|))
            (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
       (|HasCategory| % '(|AbelianGroup|)))
      (|augmentPredVector| % 144115188075855872))
     (SETF |pv$| (QREFELT % 3))
     (QSETREFV % 12
               (PROGN
                (LETT #12# NIL)
                (SEQ (LETT |jv| NIL) (LETT #13# |#3|) G190
                     (COND
                      ((OR (ATOM #13#) (PROGN (LETT |jv| (CAR #13#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #12# (CONS (SPADCALL |jv| (QREFELT % 11)) #12#))))
                     (LETT #13# (CDR #13#)) (GO G190) G191
                     (EXIT (NREVERSE #12#)))))
     (QSETREFV % 13 (LENGTH |#3|))
     (QSETREFV % 14 (|Record| (|:| |k| |#4|) (|:| |c| |#1|)))
     (QSETREFV % 15 (|List| (QREFELT % 14)))
     (COND
      ((|testBitVector| |pv$| 22)
       (QSETREFV % 140 (CONS (|dispatchFunction| |DJBP;/;%R%;31|) %))))
     (COND
      ((|testBitVector| |pv$| 15)
       (PROGN
        (QSETREFV % 142 (CONS (|dispatchFunction| |DJBP;content;%R;32|) %))
        (COND
         ((|HasCategory| |#1| '(|EuclideanDomain|))
          (COND
           ((|testBitVector| |pv$| 22)
            (QSETREFV % 146 (CONS (|dispatchFunction| |DJBP;gcd;3%;33|) %)))
           ('T
            (QSETREFV % 146 (CONS (|dispatchFunction| |DJBP;gcd;3%;34|) %)))))
         ('T (QSETREFV % 146 (CONS (|dispatchFunction| |DJBP;gcd;3%;35|) %))))
        (QSETREFV % 156 (CONS (|dispatchFunction| |DJBP;groebner;2L;36|) %)))))
     %)))) 

(DEFUN |DistributedJetBundlePolynomial| (&REST #1=#:G280)
  (SPROG NIL
         (PROG (#2=#:G281)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T NIL T))
                     (HGET |$ConstructorCache|
                           '|DistributedJetBundlePolynomial|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |DistributedJetBundlePolynomial;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DistributedJetBundlePolynomial|)))))))))) 

(MAKEPROP '|DistributedJetBundlePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 9) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|) (|OutputForm|)
              (0 . |coerce|) 'LJVO '|nl| '|Term| '|Rep| (|Boolean|) (5 . =)
              (|NonNegativeInteger|) (|Vector| 18) (11 . |zero|) (16 . |1|)
              (20 . |1|) (24 . |1|) (28 . |directProduct|) (33 . |monomial|)
              (39 . *) |DJBP;monomial;%JBNni%;2| |DJBP;coerce;JB%;3|
              |DJBP;zero?;%B;4| (|Union| 7 '"failed") |DJBP;mainVariable;%U;8|
              |DJBP;ground?;%B;5| |DJBP;monomial?;%B;6|
              |DJBP;numberOfMonomials;%Nni;7| (45 . |degree|) (|Integer|)
              (50 . |elt|) (56 . |0|) (60 . |0|) (64 . |new|) (70 . |reductum|)
              (75 . |elt|) (81 . |setelt!|) (88 . ~=) (|List| 7)
              |DJBP;variables;%L;9| (94 . |coerce|) (|List| 10) (99 . |elt|)
              (105 . |coerce|) (110 . ^) (116 . ~=) (122 . *)
              (|Mapping| 10 10 10) (128 . |reduce|) (134 . +)
              |DJBP;coerce;%Of;10| (|JetBundlePolynomial| 6 7)
              (140 . |mainVariable|) (145 . |retract|) (150 . |coerce|)
              (155 . |member?|) (|SparseUnivariatePolynomial| %)
              (161 . |univariate|) (|SparseUnivariatePolynomial| 58)
              (167 . |zero?|) (172 . |leadingCoefficient|)
              |DJBP;convert;Jbp%;11| (177 . |degree|) (182 . +)
              (188 . |reductum|) |DJBP;retract;%R;15| (193 . |coerce|)
              |DJBP;univariate;%JBSup;16| (198 . |0|)
              (|SparseUnivariatePolynomial| $$) (202 . |zero?|)
              (207 . |leadingCoefficient|) |DJBP;convert;%Jbp;12|
              (212 . |degree|) (217 . |monomial|) (224 . +) (230 . |reductum|)
              (235 . |leadingCoefficient|) |DJBP;const;%R;13|
              (|Union| 6 '"failed") |DJBP;retractIfCan;%U;14| (240 . |0|)
              (244 . |monomial|) (250 . +) (|SparseUnivariatePolynomial| 6)
              (256 . |monomial|) (262 . |0|) (266 . +)
              |DJBP;univariate;%Sup;17| (272 . ^) |DJBP;multivariate;SupJB%;18|
              (278 . |zero?|) (283 . |leadingCoefficient|) (288 . |degree|)
              (293 . *) (299 . |reductum|) |DJBP;multivariate;SupJB%;19|
              (304 . +) (310 . |coerce|) (|Mapping| 18 18 18) (315 . |reduce|)
              |DJBP;totalDegree;%Nni;20| |DJBP;degree;%JBNni;21| (|List| 18)
              |DJBP;degree;%LL;22| (322 . |minimumDegree|)
              |DJBP;minimumDegree;%JBNni;23| |DJBP;minimumDegree;%LL;24|
              (327 . |elt|) |DJBP;eval;%JB2%;25| |DJBP;eval;%JBR%;26|
              (|List| 6) |DJBP;eval;%LL%;27| (|List| $$) (333 . |empty?|)
              (338 . >) '"rest" (344 . |elt|) '"first" (350 . |elt|)
              (|Mapping| $$ $$) (356 . |map|) (362 . <) (|Mapping| 16 7 7)
              (368 . |sort|) (374 . =) (380 . |position|) (386 . |elt|)
              (|List| %) |DJBP;eval;%LL%;29| (392 . |differentiate|)
              |DJBP;differentiate;%JB%;30| (397 . |inv|) (402 . /)
              (408 . |gcd|) (414 . |content|) (419 . |zero?|) (424 . <)
              (430 . |content|) (435 . |gcd|) (441 . |gcd|)
              (|PolynomialGcdPackage| 9 7 6 $$) (447 . |gcd|) (|String|)
              (453 . |message|) (|Void|) (458 . |print|)
              (|GroebnerPackage| 6 9 $$) (463 . |groebner|) (468 . |groebner|)
              (|PositiveInteger|) (|Record| (|:| |k| 9) (|:| |c| 6))
              (|List| 158) (|Mapping| 6 6) (|List| 9) (|Mapping| 9 9)
              (|Union| 135 '#1="failed") (|Union| % '#2="failed")
              (|Union| 176 '#2#) (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 36) (|HashState|)
              (|SingleInteger|) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 36 %) (|Matrix| 36)
              (|Record| (|:| |mat| 174) (|:| |vec| (|Vector| 36))) (|Vector| %)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 36) (|Mapping| 6 9) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 183 '#2#) (|List| 63) (|Factored| 63)
              (|Union| 178 '#3="failed") (|Union| 36 '#3#)
              (|Record| (|:| |mat| 188) (|:| |vec| (|Vector| 6))) (|Matrix| 6)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 7) (|:| |exponent| 18)) (|Union| 190 '#1#)
              (|List| 193) (|Equation| %))
           '#(~= 473 |zero?| 479 |variables| 484 |univariate| 495 |unitNormal|
              506 |unitCanonical| 511 |unit?| 516 |totalDegreeSorted| 521
              |totalDegree| 527 |support| 538 |subtractIfCan| 543
              |squareFreePolynomial| 549 |squareFreePart| 554 |squareFree| 559
              |solveLinearPolynomialEquation| 564 |smaller?| 570 |sample| 576
              |rightRecip| 580 |rightPower| 585 |retractIfCan| 597 |retract|
              617 |resultant| 637 |reductum| 644 |reducedSystem| 649 |recip|
              671 |primitivePart| 676 |primitiveMonomials| 687 |prime?| 692
              |pomopo!| 697 |plenaryPower| 705 |patternMatch| 711 |opposite?|
              725 |one?| 731 |numberOfMonomials| 736 |multivariate| 741
              |monomials| 753 |monomial?| 758 |monomial| 763 |monicDivide| 783
              |minimumDegree| 790 |mapExponents| 807 |map| 813 |mainVariable|
              819 |listOfTerms| 824 |linearExtend| 829 |leftRecip| 835
              |leftPower| 840 |leadingTerm| 852 |leadingSupport| 857
              |leadingMonomial| 862 |leadingCoefficient| 867 |lcmCoef| 872
              |lcm| 878 |latex| 889 |isTimes| 894 |isPlus| 899 |isExpt| 904
              |hashUpdate!| 909 |hash| 915 |ground?| 920 |ground| 925
              |groebner| 930 |gcdPolynomial| 935 |gcd| 941 |fmecg| 952
              |factorSquareFreePolynomial| 960 |factorPolynomial| 965 |factor|
              970 |exquo| 975 |eval| 987 |discriminant| 1041 |differentiate|
              1047 |degree| 1073 |convert| 1090 |content| 1115
              |constructOrdered| 1126 |construct| 1131 |const| 1136
              |conditionP| 1141 |commutator| 1146 |coerce| 1152 |coefficients|
              1182 |coefficient| 1187 |charthRoot| 1207 |characteristic| 1212
              |binomThmExpt| 1216 |associator| 1223 |associates?| 1230
              |antiCommutator| 1236 |annihilate?| 1242 ^ 1248 D 1260 = 1286 |1|
              1292 |0| 1296 / 1300 - 1306 + 1317 * 1323)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 11 0 11 0 17 0 27 15 26 4 18 28 16 1 29 29
                                  28 13 16 1 0 28 4 5 1 0 0 40 4 4 1 0 0 0 29
                                  40 1 1 0 0 0 0 0 12 13 13 47 13 46 9 0 0 33
                                  31 43 10 0 0 0 13 13 20 28 7 6 0 0 13 13 19
                                  37 35 14 28 8 7 6 4 3 2 0 0 0 0 0 0 0 0))
            (CONS
             '#(|PolynomialCategory&| |PolynomialFactorizationExplicit&|
                |MaybeSkewPolynomialCategory&| |UniqueFactorizationDomain&|
                |FiniteAbelianMonoidRing&| |GcdDomain&| |AbelianMonoidRing&|
                NIL NIL NIL |PartialDifferentialRing&| |EntireRing&| |Algebra&|
                |Algebra&| |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FreeModuleCategory&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                NIL |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&|
                |AbelianMonoid&| NIL NIL |NonAssociativeSemiRng&| NIL NIL
                |SetWithZero&| NIL |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |RetractableTo&| |Evalable&| |Hashable&|
                NIL |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |BasicType&| NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL)
             (CONS
              '#((|PolynomialCategory| 6 9 7)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 9 7)
                 (|UniqueFactorizationDomain|) (|FiniteAbelianMonoidRing| 6 9)
                 (|GcdDomain|) (|AbelianMonoidRing| 6 9) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 7) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|Algebra| 178) (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 178)
                 (|FreeModuleCategory| 6 9) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 178)
                 (|IndexedDirectProductCategory| 6 9) (|SemiRng|)
                 (|LinearlyExplicitOver| 36) (|LinearlyExplicitOver| 6)
                 (|NonAssociativeRing|) (|BiModule| 178 178) (|BiModule| $$ $$)
                 (|BiModule| 6 6) (|IndexedProductCategory| 6 9)
                 (|NonAssociativeRng|) (|RightModule| 36) (|RightModule| 178)
                 (|LeftModule| 178) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 36) (|PatternMatchable| (|Float|))
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 7) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 36) (|RetractableTo| 178)
                 (|SetCategory|) (|RetractableTo| 6) (|CoercibleFrom| 7)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 167)
                 (|ConvertibleTo| 169) (|ConvertibleTo| 168) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 36)
                 (|CoercibleFrom| 178) (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 10) (|BasicType|)
                 (|CoercibleFrom| 6) (|InnerEvalable| 7 6)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|)
                 (|ConvertibleTo| (|JetBundlePolynomial| 6 7))
                 (|ConvertibleFrom| (|JetBundlePolynomial| 6 7)))
              (|makeByteWordVec2| 193
                                  '(1 7 10 0 11 2 7 16 0 0 17 1 19 0 18 20 0 7
                                    0 21 0 0 0 22 0 6 0 23 1 9 0 19 24 2 0 0 6
                                    9 25 2 0 0 0 0 26 1 0 9 0 35 2 9 18 0 36 37
                                    0 0 0 38 0 6 0 39 2 19 0 18 18 40 1 0 0 0
                                    41 2 19 18 0 36 42 3 19 18 0 36 18 43 2 18
                                    16 0 0 44 1 6 10 0 47 2 48 10 0 36 49 1 18
                                    10 0 50 2 10 0 0 0 51 2 6 16 0 0 52 2 10 0
                                    0 0 53 2 48 10 54 0 55 2 10 0 0 0 56 1 58
                                    30 0 59 1 58 6 0 60 1 0 0 6 61 2 45 16 7 0
                                    62 2 58 63 0 7 64 1 65 16 0 66 1 65 58 0 67
                                    1 65 18 0 69 2 0 0 0 0 70 1 65 0 0 71 1 58
                                    0 6 73 0 58 0 75 1 76 16 0 77 1 76 2 0 78 1
                                    76 18 0 80 3 58 0 0 7 18 81 2 58 0 0 0 82 1
                                    76 0 0 83 1 0 6 0 84 0 76 0 88 2 76 0 2 18
                                    89 2 76 0 0 0 90 2 91 0 6 18 92 0 91 0 93 2
                                    91 0 0 0 94 2 0 0 0 18 96 1 91 16 0 98 1 91
                                    6 0 99 1 91 18 0 100 2 0 0 6 0 101 1 91 0 0
                                    102 2 18 0 0 0 104 1 9 19 0 105 3 19 18 106
                                    0 18 107 1 76 18 0 112 2 76 2 0 2 115 1 120
                                    16 0 121 2 7 16 0 0 122 2 120 0 0 123 124 2
                                    120 2 0 125 126 2 76 0 127 0 128 2 18 16 0
                                    0 129 2 45 0 130 0 131 2 45 16 0 0 132 2 45
                                    36 7 0 133 2 120 2 0 36 134 1 76 0 0 137 1
                                    6 0 0 139 2 0 0 0 6 140 2 6 0 0 0 141 1 0 6
                                    0 142 1 6 16 0 143 2 7 16 0 0 144 1 76 2 0
                                    145 2 0 0 0 0 146 2 76 0 0 0 147 2 148 2 2
                                    2 149 1 10 0 150 151 1 10 152 0 153 1 154
                                    120 120 155 1 0 135 135 156 2 0 16 0 0 1 1
                                    56 16 0 29 1 0 45 0 46 2 0 45 0 0 1 1 0 91
                                    0 95 2 0 63 0 7 74 1 50 177 0 1 1 50 0 0 1
                                    1 50 16 0 1 2 0 18 0 45 1 1 0 18 0 108 2 0
                                    18 0 45 1 1 0 161 0 1 2 57 164 0 0 1 1 11
                                    184 63 1 1 15 0 0 1 1 15 180 0 1 2 11 182
                                    183 63 1 2 24 16 0 0 1 0 56 0 1 1 54 164 0
                                    1 2 0 0 0 157 1 2 54 0 0 18 1 1 0 86 0 87 1
                                    6 185 0 1 1 7 186 0 1 1 13 30 0 1 1 0 6 0
                                    72 1 6 178 0 1 1 7 36 0 1 1 13 7 0 1 3 5 0
                                    0 0 7 1 1 21 0 0 41 1 39 174 166 1 2 39 175
                                    166 176 1 2 4 187 166 176 1 1 4 188 166 1 1
                                    54 164 0 1 1 15 0 0 1 2 15 0 0 7 1 1 13 135
                                    0 1 1 11 16 0 1 4 0 0 0 6 9 0 1 2 51 0 0
                                    157 1 3 30 172 0 168 172 1 3 32 173 0 169
                                    173 1 2 56 16 0 0 1 1 54 16 0 1 1 0 18 0 34
                                    2 0 0 63 7 97 2 0 0 91 7 103 1 0 135 0 1 1
                                    0 16 0 33 2 0 0 6 9 25 3 0 0 0 7 18 27 3 0
                                    0 0 45 110 1 3 4 189 0 0 7 1 1 0 9 0 1 2 0
                                    18 0 7 113 2 0 110 0 45 114 2 0 0 162 0 1 2
                                    0 0 160 0 1 1 0 30 0 31 1 0 159 0 1 2 5 6
                                    179 0 1 1 54 164 0 1 2 0 0 0 157 1 2 54 0 0
                                    18 1 1 21 158 0 1 1 21 9 0 1 1 21 0 0 1 1
                                    21 6 0 84 2 15 181 0 0 1 2 15 0 0 0 1 1 15
                                    0 135 1 1 0 150 0 1 1 13 163 0 1 1 0 163 0
                                    1 1 13 191 0 1 2 20 170 170 0 1 1 20 171 0
                                    1 1 0 16 0 32 1 0 6 0 1 1 15 135 135 156 2
                                    15 63 63 63 1 1 15 0 135 1 2 15 0 0 0 146 4
                                    4 0 0 9 6 0 1 1 11 184 63 1 1 11 184 63 1 1
                                    11 180 0 1 2 50 164 0 0 1 2 14 164 0 6 1 3
                                    0 0 0 7 6 117 3 0 0 0 45 118 119 3 0 0 0 45
                                    135 136 3 0 0 0 7 0 116 2 13 0 0 192 1 3 13
                                    0 0 0 0 1 2 13 0 0 193 1 3 13 0 0 135 135 1
                                    2 5 0 0 7 1 3 4 0 0 7 18 1 3 4 0 0 45 110 1
                                    2 4 0 0 7 138 2 4 0 0 45 1 1 0 9 0 35 2 0
                                    18 0 7 109 2 0 110 0 45 111 1 0 58 0 79 1 0
                                    0 58 68 1 19 167 0 1 1 34 168 0 1 1 36 169
                                    0 1 1 15 6 0 142 2 15 0 0 7 1 1 21 0 159 1
                                    1 0 0 159 1 1 0 6 0 85 1 49 165 166 1 2 55
                                    0 0 0 1 1 0 10 0 57 1 0 0 6 61 1 52 0 0 1 1
                                    53 0 36 1 1 23 0 178 1 1 13 0 7 28 1 0 118
                                    0 1 2 0 6 0 9 1 3 0 0 0 7 18 1 3 0 0 0 45
                                    110 1 1 49 164 0 1 0 55 18 1 3 48 0 0 0 18
                                    1 3 55 0 0 0 0 1 2 50 16 0 0 1 2 0 0 0 0 1
                                    2 55 16 0 0 1 2 0 0 0 157 1 2 54 0 0 18 96
                                    3 4 0 0 45 110 1 2 4 0 0 45 1 3 4 0 0 7 18
                                    1 2 4 0 0 7 1 2 0 16 0 0 1 0 54 0 22 0 56 0
                                    38 2 22 0 0 6 140 1 58 0 0 1 2 58 0 0 0 1 2
                                    0 0 0 0 70 2 0 0 157 0 1 2 0 0 0 0 26 2 0 0
                                    0 6 1 2 0 0 6 0 101 2 39 0 0 36 1 2 58 0 36
                                    0 1 2 56 0 18 0 1 2 1 0 0 178 1 2 1 0 178 0
                                    1)))))
           '|lookupComplete|)) 
