
(SDEFUN |SMP;Zero;%;1| ((% (%))) (CONS 0 (|spadConstant| % 11))) 

(SDEFUN |SMP;One;%;2| ((% (%))) (CONS 0 (|spadConstant| % 13))) 

(SDEFUN |SMP;zero?;%B;3| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 17))) ('T NIL))) 

(SDEFUN |SMP;one?;%B;4| ((|p| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (QCDR |p|) (QCDR (|spadConstant| % 14)) (QREFELT % 20)))
         ('T NIL))) 

(SDEFUN |SMP;red| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
              ((SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                         (QREFELT % 23))
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                         (QREFELT % 24)))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))))))) 

(SDEFUN |SMP;numberOfMonomials;%Nni;6| ((|p| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G557 NIL) (#2=#:G556 #3=(|NonNegativeInteger|)) (#4=#:G558 #3#)
          (#5=#:G560 NIL) (|q| NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT % 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #1# NIL)
             (SEQ (LETT |q| NIL)
                  (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |q| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (SPADCALL |q| (QREFELT % 28)))
                     (COND (#1# (LETT #2# (+ #2# #4#)))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6# 0)))))))) 

(SDEFUN |SMP;coerce;VarSet%;7| ((|mvar| (|VarSet|)) (% (%)))
        (CONS 1
              (CONS |mvar| (SPADCALL (|spadConstant| % 14) 1 (QREFELT % 29))))) 

(SDEFUN |SMP;monomial1?| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|sup| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) 'T)
                      ('T
                       (SEQ (LETT |sup| (QCDR (QCDR |p|)))
                            (COND
                             ((NULL (SPADCALL |sup| (QREFELT % 31)))
                              (EXIT NIL)))
                            (EXIT
                             (|SMP;monomial1?| (SPADCALL |sup| (QREFELT % 24))
                              %)))))))) 

(SDEFUN |SMP;monomial?;%B;9| ((|p| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |p| (|spadConstant| % 12) (QREFELT % 32)) NIL)
              ('T (|SMP;monomial1?| |p| %)))) 

(SDEFUN |SMP;moreThanOneVariable?| ((|p| (%)) (% (|Boolean|)))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      (#1='T
                       (SEQ (LETT |q| (QCDR (QCDR |p|)))
                            (EXIT
                             (COND
                              ((SPADCALL
                                (CONS #'|SMP;moreThanOneVariable?!0| %)
                                (SPADCALL |q| (QREFELT % 26)) (QREFELT % 36))
                               'T)
                              (#1# NIL))))))))) 

(SDEFUN |SMP;moreThanOneVariable?!0| ((|x1| NIL) (% NIL))
        (NULL (SPADCALL |x1| (QREFELT % 34)))) 

(SDEFUN |SMP;univariateKnown| ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 39)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |p| (QREFELT % 37))
                     (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                     (QREFELT % 41))
           (|SMP;univariateKnown| (|SMP;red| |p| %) %) (QREFELT % 42))))) 

(SDEFUN |SMP;univariate;%Sup;12|
        ((|p| (%)) (% (|SparseUnivariatePolynomial| R)))
        (COND
         ((QEQCAR |p| 0)
          (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 39)))
         ((|SMP;moreThanOneVariable?| |p| %) (|error| "not univariate"))
         ('T (SPADCALL (ELT % 37) (QCDR (QCDR |p|)) (QREFELT % 45))))) 

(SDEFUN |SMP;multivariate;SupVarSet%;13|
        ((|u| (|SparseUnivariatePolynomial| R)) (|var| (|VarSet|)) (% (%)))
        (COND
         ((SPADCALL |u| (QREFELT % 47)) (CONS 0 (SPADCALL |u| (QREFELT % 48))))
         ('T
          (SPADCALL
           (CONS 1
                 (CONS |var|
                       (SPADCALL (CONS 0 (SPADCALL |u| (QREFELT % 48)))
                                 (SPADCALL |u| (QREFELT % 49))
                                 (QREFELT % 29))))
           (SPADCALL (SPADCALL |u| (QREFELT % 50)) |var| (QREFELT % 51))
           (QREFELT % 52))))) 

(SDEFUN |SMP;mon_mul|
        ((|p| (%)) (|var| (|VarSet|)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|pt| (D)))
               (SEQ (LETT |pt| (SPADCALL |p| |n| (QREFELT % 29)))
                    (EXIT (CONS 1 (CONS |var| |pt|)))))) 

(SDEFUN |SMP;univariate;%VarSetSup;15|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|ulc| (D)) (|ulc0| (|SparseUnivariatePolynomial| %)) (|pt| (D)))
         (SEQ
          (COND
           ((OR (QEQCAR |p| 0)
                (SPADCALL (QCAR (QCDR |p|)) |mvar| (QREFELT % 53)))
            (SPADCALL |p| 0 (QREFELT % 29)))
           ('T
            (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                 (EXIT
                  (COND
                   ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54)) |pt|)
                   ('T
                    (SEQ
                     (LETT |ulc0|
                           (SPADCALL (SPADCALL |pt| (QREFELT % 24)) |mvar|
                                     (QREFELT % 56)))
                     (LETT |ulc|
                           (SPADCALL
                            (CONS #'|SMP;univariate;%VarSetSup;15!0|
                                  (VECTOR % |pt| |p|))
                            |ulc0| (QREFELT % 58)))
                     (EXIT
                      (SPADCALL |ulc|
                                (SPADCALL (|SMP;red| |p| %) |mvar|
                                          (QREFELT % 56))
                                (QREFELT % 59))))))))))))) 

(SDEFUN |SMP;univariate;%VarSetSup;15!0| ((|c| NIL) ($$ NIL))
        (PROG (|p| |pt| %)
          (LETT |p| (QREFELT $$ 2))
          (LETT |pt| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|SMP;mon_mul| |c| (QCAR (QCDR |p|)) (SPADCALL |pt| (QREFELT % 40))
             %))))) 

(SDEFUN |SMP;unlikeUnivReconstruct|
        ((|u| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (COND
                ((ZEROP (LETT |d| (SPADCALL |u| (QREFELT % 61))))
                 (SPADCALL |u| 0 (QREFELT % 62)))
                ('T
                 (SPADCALL
                  (SPADCALL (SPADCALL |u| (QREFELT % 63)) |mvar| |d|
                            (QREFELT % 64))
                  (|SMP;unlikeUnivReconstruct| (SPADCALL |u| (QREFELT % 65))
                   |mvar| %)
                  (QREFELT % 52)))))) 

(SDEFUN |SMP;multivariate;SupVarSet%;17|
        ((|u| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG
         ((#1=#:G601 NIL) (|uu| (|SparseUnivariatePolynomial| %)) (|cc| (%)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (QREFELT % 66)) (SPADCALL |u| 0 (QREFELT % 62)))
            ('T
             (SEQ (LETT |uu| |u|)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |uu| (QREFELT % 67))))
                         (GO G191)))
                       (SEQ (LETT |cc| (SPADCALL |uu| (QREFELT % 63)))
                            (COND
                             ((OR (QEQCAR |cc| 0)
                                  (SPADCALL |mvar| (QCAR (QCDR |cc|))
                                            (QREFELT % 68)))
                              (EXIT
                               (LETT |uu| (SPADCALL |uu| (QREFELT % 65))))))
                            (EXIT
                             (PROGN
                              (LETT #1#
                                    (|SMP;unlikeUnivReconstruct| |u| |mvar| %))
                              (GO #2=#:G600))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SMP;construct;L%;18|
        ((|lt|
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
         (% (%)))
        (SPROG ((|res| (%)) (#1=#:G609 NIL) (|t| NIL))
               (SEQ (LETT |res| (|spadConstant| % 12))
                    (SEQ (LETT |t| NIL) (LETT #1# |lt|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL (QCDR |t|) (QCAR |t|)
                                                     (QREFELT % 71))
                                           (QREFELT % 52)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |SMP;constructOrdered;L%;19|
        ((|lt|
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
         (% (%)))
        (SPADCALL |lt| (QREFELT % 74))) 

(SDEFUN |SMP;leadingSupport;%Ie;20|
        ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (SPADCALL |p| (QREFELT % 76))) 

(SDEFUN |SMP;leadingTerm;%R;21|
        ((|p| (%))
         (% (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
        (CONS (SPADCALL |p| (QREFELT % 76)) (SPADCALL |p| (QREFELT % 37)))) 

(SDEFUN |SMP;linearExtend;M%R;22|
        ((|f| (|Mapping| R (|IndexedExponents| |VarSet|))) (|p| (%)) (% (R)))
        (SPROG ((|res| (%)))
               (SEQ (LETT |res| (|spadConstant| % 12))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT % 18))))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (SPADCALL
                                 (SPADCALL
                                  (CONS 0 (SPADCALL |p| (QREFELT % 37)))
                                  (CONS 0
                                        (SPADCALL (SPADCALL |p| (QREFELT % 76))
                                                  |f|))
                                  (QREFELT % 79))
                                 |res| (QREFELT % 52)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (QCDR |res|))))) 

(SDEFUN |SMP;listOfTerms;%L;23|
        ((|p| (%))
         (%
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R)))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R)))))
         (SEQ (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (NULL (SPADCALL |p| (QREFELT % 18)))) (GO G191)))
                   (SEQ (LETT |res| (CONS (SPADCALL |p| (QREFELT % 78)) |res|))
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |res|))))) 

(SDEFUN |SMP;support;%L;24|
        ((|p| (%)) (% (|List| (|IndexedExponents| |VarSet|))))
        (SPROG ((|res| (|List| (|IndexedExponents| |VarSet|))))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT % 18))))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (CONS (SPADCALL |p| (QREFELT % 76)) |res|))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(SDEFUN |SMP;ground?;%B;25| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) 'T) ('T NIL))) 

(SDEFUN |SMP;monomial;%VarSetNni%;26|
        ((|p| (%)) (|mvar| (|VarSet|)) (|k1| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|pt1| (D)) (|pt| (D)))
               (SEQ
                (COND ((OR (ZEROP |k1|) (SPADCALL |p| (QREFELT % 18))) |p|)
                      ((OR (QEQCAR |p| 0)
                           (SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68)))
                       (CONS 1
                             (CONS |mvar| (SPADCALL |p| |k1| (QREFELT % 29)))))
                      ('T
                       (SEQ (LETT |pt| (QCDR (QCDR |p|)))
                            (LETT |pt1|
                                  (COND
                                   ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                              (QREFELT % 53))
                                    (SPADCALL
                                     (CONS #'|SMP;monomial;%VarSetNni%;26!0|
                                           (VECTOR % |k1| |mvar|))
                                     |pt| (QREFELT % 58)))
                                   ('T (SPADCALL |pt| |k1| (QREFELT % 86)))))
                            (EXIT (CONS 1 (CONS (QCAR (QCDR |p|)) |pt1|))))))))) 

(SDEFUN |SMP;monomial;%VarSetNni%;26!0| ((|c| NIL) ($$ NIL))
        (PROG (|mvar| |k1| %)
          (LETT |mvar| (QREFELT $$ 2))
          (LETT |k1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |c| |mvar| |k1| (QREFELT % 64)))))) 

(SDEFUN |SMP;monomial;RIe%;27|
        ((|c| (R)) (|e| (|IndexedExponents| |VarSet|)) (% (%)))
        (SPROG ((|m1| (D)) (|p1| (%)))
               (SEQ
                (COND ((SPADCALL |e| (QREFELT % 87)) (CONS 0 |c|))
                      ('T
                       (SEQ
                        (LETT |p1|
                              (SPADCALL |c| (SPADCALL |e| (QREFELT % 88))
                                        (QREFELT % 71)))
                        (LETT |m1|
                              (SPADCALL |p1| (SPADCALL |e| (QREFELT % 89))
                                        (QREFELT % 29)))
                        (EXIT
                         (CONS 1
                               (CONS (SPADCALL |e| (QREFELT % 90)) |m1|))))))))) 

(SDEFUN |SMP;coefficient;%IeR;28|
        ((|p| (%)) (|e| (|IndexedExponents| |VarSet|)) (% (R)))
        (SPROG ((|vp| (|VarSet|)) (|ve| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |e| (QREFELT % 87))
                  (COND ((QEQCAR |p| 0) (QCDR |p|))
                        (#1='T
                         (SPADCALL
                          (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT % 91)) |e|
                          (QREFELT % 92)))))
                 ((QEQCAR |p| 0) (QCDR (|spadConstant| % 12)))
                 (#1#
                  (SEQ (LETT |ve| (SPADCALL |e| (QREFELT % 90)))
                       (LETT |vp| (QCAR (QCDR |p|)))
                       (EXIT
                        (COND
                         ((SPADCALL |ve| |vp| (QREFELT % 53))
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) 0 (QREFELT % 91)) |e|
                           (QREFELT % 92)))
                         ((SPADCALL |ve| |vp| (QREFELT % 68))
                          (QCDR (|spadConstant| % 12)))
                         (#1#
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|))
                                     (SPADCALL |e| (QREFELT % 89))
                                     (QREFELT % 91))
                           (SPADCALL |e| (QREFELT % 88))
                           (QREFELT % 92))))))))))) 

(SDEFUN |SMP;coerce;I%;29| ((|n| (|Integer|)) (% (%)))
        (CONS 0 (SPADCALL |n| (QREFELT % 94)))) 

(SDEFUN |SMP;characteristic;Nni;30| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 96))) 

(PUT '|SMP;coerce;R%;31| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

(SDEFUN |SMP;coerce;R%;31| ((|c| (R)) (% (%))) (CONS 0 |c|)) 

(SDEFUN |SMP;recip;%U;32| ((|p| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|uu| (|Union| R #1#)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (SEQ (LETT |uu| (SPADCALL (QCDR |p|) (QREFELT % 100)))
                       (EXIT
                        (COND ((QEQCAR |uu| 1) (CONS 1 "failed"))
                              (#2='T (CONS 0 (CONS 0 (QCDR |uu|))))))))
                 (#2# (CONS 1 "failed")))))) 

(SDEFUN |SMP;-;2%;33| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 102))))
              ('T
               (CONS 1
                     (CONS (QCAR (QCDR |p|))
                           (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 103))))))) 

(SDEFUN |SMP;*;I2%;34| ((|n| (|Integer|)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |n| (QCDR |p|) (QREFELT % 105))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL |n| (QCDR (QCDR |p|)) (QREFELT % 106)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;*;R2%;35| ((|c| (R)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((SPADCALL |c| (QCDR (|spadConstant| % 12)) (QREFELT % 20))
                  (|spadConstant| % 12))
                 ((SPADCALL |c| (QREFELT % 15) (QREFELT % 20)) |p|)
                 ((QEQCAR |p| 0)
                  (CONS 0 (SPADCALL |c| (QCDR |p|) (QREFELT % 108))))
                 (#1='T
                  (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                       (LETT |up|
                             (SPADCALL (CONS 0 |c|) (QCDR (QCDR |p|))
                                       (QREFELT % 109)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3%;36| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT % 111))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                         (QCDR (QCDR |p2|)) (QREFELT % 59)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 112))
                                         (QREFELT % 59)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT % 59)))
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT % 23))
                             (SPADCALL |up| (QREFELT % 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 59)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 112))
                                           (QREFELT % 59)))))))))))) 

(SDEFUN |SMP;-;3%;37| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT % 113))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                         (QCDR (QCDR |p2|)) (QREFELT % 114)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 112))
                                         (QREFELT % 114)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT % 114)))
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT % 23))
                             (SPADCALL |up| (QREFELT % 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 112))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 114)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 112))
                                           (QREFELT % 114)))))))))))) 

(SDEFUN |SMP;=;2%B;38| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 20)))
           (#1='T NIL)))
         ((QEQCAR |p2| 0) NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 116)))
           (#1# NIL))))) 

(SDEFUN |SMP;*;3%;39| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT % 110)))
                 ((QEQCAR |p2| 0)
                  (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                       (LETT |up|
                             (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                       (QREFELT % 117)))
                       (EXIT
                        (COND
                         ((SPADCALL |up| (QREFELT % 23))
                          (SPADCALL |up| (QREFELT % 24)))
                         (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 54))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 118)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) |p2|
                                         (QREFELT % 117)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|)))))))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p2|)))
                         (LETT |up|
                               (SPADCALL |p1| (QCDR (QCDR |p2|))
                                         (QREFELT % 109)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;pow_aux| ((|p| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)) (|kp| (|PositiveInteger|)))
               (SEQ
                (COND ((EQL |k| 0) (CONS 0 (QREFELT % 15)))
                      (#1='T
                       (SEQ (LETT |kp| |k|)
                            (EXIT
                             (COND
                              ((QEQCAR |p| 0)
                               (CONS 0
                                     (SPADCALL (QCDR |p|) |kp|
                                               (QREFELT % 119))))
                              ((NULL (|SMP;moreThanOneVariable?| |p| %))
                               (SPADCALL
                                (SPADCALL (|SMP;univariateKnown| |p| %) |kp|
                                          (QREFELT % 120))
                                (QCAR (QCDR |p|)) (QREFELT % 51)))
                              ('T
                               (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                                    (LETT |up|
                                          (SPADCALL (QCDR (QCDR |p|)) |kp|
                                                    (QREFELT % 121)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |up| (QREFELT % 23))
                                       (SPADCALL |up| (QREFELT % 24)))
                                      (#1#
                                       (CONS 1 (CONS |mvar| |up|))))))))))))))) 

(SDEFUN |SMP;^;%Nni%;41| ((|p| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |k| %)) 

(SDEFUN |SMP;^;%Pi%;42| ((|p| (%)) (|kp| (|PositiveInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |kp| %)) 

(SDEFUN |SMP;hashUpdate!;Hs%Hs;43|
        ((|s| (|HashState|)) (|p| (%)) (% (|HashState|)))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT % 126)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT % 127)))
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT % 128)))))))) 

(SDEFUN |SMP;unitNormal;%R;44|
        ((|p| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G76|
           #1=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G75| #1#))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G75| (SPADCALL (QCDR |p|) (QREFELT % 131)))
              (LETT |u| (QVELT |#G75| 0))
              (LETT |c| (QVELT |#G75| 1))
              (LETT |a| (QVELT |#G75| 2))
              |#G75|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G76|
                    (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 131)))
              (LETT |u| (QVELT |#G76| 0))
              (LETT |c| (QVELT |#G76| 1))
              (LETT |a| (QVELT |#G76| 2))
              |#G76|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT % 110))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2%;45| ((|p| (%)) (% (%)))
        (SPROG
         ((|a| (R)) (|c| (R)) (|u| (R))
          (|#G81|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R))))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 133))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G81|
                         (SPADCALL (SPADCALL |p| (QREFELT % 37))
                                   (QREFELT % 131)))
                   (LETT |u| (QVELT |#G81| 0))
                   (LETT |c| (QVELT |#G81| 1))
                   (LETT |a| (QVELT |#G81| 2))
                   |#G81|)
                  (EXIT (SPADCALL |a| |p| (QREFELT % 110))))))))) 

(SDEFUN |SMP;unit?;%B;46| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 135))) ('T NIL))) 

(SDEFUN |SMP;associates?;2%B;47| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 137)))
           (#1='T NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 138)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |SMP;exquo;2%U;48| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 140)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT % 18))
                 (SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT % 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT % 112))
                                  (QREFELT % 141)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (EXIT
               (COND
                ((SPADCALL |p1| |p2| (QREFELT % 32))
                 (CONS 0 (|spadConstant| % 14)))
                (#1#
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                  (QREFELT % 141)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                               (LETT |up| (QCDR |a|))
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT % 66))
                                  (CONS 0 (SPADCALL |up| (QREFELT % 63))))
                                 (#1#
                                  (CONS 0
                                        (CONS 1
                                              (CONS |mvar|
                                                    |up|))))))))))))))))))))) 

(SDEFUN |SMP;exquo;2%U;49| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| %)) (|mvar| (|VarSet|))
          (|a| (|Union| D "failed")))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 140)))
                (EXIT
                 (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                       (#1='T (CONS 0 (CONS 0 (QCDR |a|))))))))))))
          (EXIT
           (COND
            ((OR (SPADCALL |p1| (QREFELT % 18))
                 (SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 32)))
             (CONS 0 |p1|))
            ('T
             (SEQ
              (COND ((QEQCAR |p1| 0) (EXIT (CONS 1 #2="failed")))
                    ((QEQCAR |p2| 1)
                     (COND
                      ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                                 (QREFELT % 53))
                       (EXIT (CONS 1 #2#))))))
              (COND
               ((OR (QEQCAR |p2| 0)
                    (SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68)))
                (EXIT
                 (SEQ
                  (LETT |a|
                        (SPADCALL (QCDR (QCDR |p1|))
                                  (SPADCALL |p2| (QREFELT % 112))
                                  (QREFELT % 141)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT % 141)))
              (EXIT
               (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                     (#1#
                      (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                           (LETT |up| (QCDR |a|))
                           (EXIT
                            (COND
                             ((SPADCALL |up| (QREFELT % 66))
                              (CONS 0 (SPADCALL |up| (QREFELT % 63))))
                             (#1#
                              (CONS 0 (CONS 1 (CONS |mvar| |up|))))))))))))))))) 

(SDEFUN |SMP;map;M2%;50| ((|fn| (|Mapping| R R)) (|p| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                            (LETT |up|
                                  (SPADCALL
                                   (CONS #'|SMP;map;M2%;50!0| (VECTOR % |fn|))
                                   (QCDR (QCDR |p|)) (QREFELT % 58)))
                            (EXIT
                             (COND
                              ((SPADCALL |up| (QREFELT % 23))
                               (SPADCALL |up| (QREFELT % 24)))
                              (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2%;50!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| %)
          (LETT |fn| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT % 144)))))) 

(SDEFUN |SMP;/;%R%;51| ((|p| (%)) (|r| (R)) (% (%)))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT % 145))) |p| (QREFELT % 79))) 

(SDEFUN |SMP;content;%R;52| ((|p| (%)) (% (R)))
        (SPROG ((|up| (D)) (|c| (R)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |c| (QCDR (|spadConstant| % 12)))
                            (LETT |up| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT % 147))
                                         (SPADCALL |c|
                                                   (QCDR (|spadConstant| % 14))
                                                   (QREFELT % 20)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |c|
                                        (SPADCALL |c|
                                                  (SPADCALL
                                                   (SPADCALL |up|
                                                             (QREFELT % 24))
                                                   (QREFELT % 148))
                                                  (QREFELT % 149)))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT % 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |c|))))))) 

(SDEFUN |SMP;content;%VarSet%;53| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 150))))) 

(SDEFUN |SMP;gcd;3%;54| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 149))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 150))
                                   (QREFELT % 152)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 150))
                              |p2| (QREFELT % 152)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 153)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;55|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G797 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 154)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 154)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 152))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 158)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 159)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 158)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 159)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;56| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (QREFELT % 26))
                (QREFELT % 162))))) 

(SDEFUN |SMP;gcd;3%;57| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 163))) 

(SDEFUN |SMP;gcd;L%;58| ((|lp| (|List| %)) (% (%)))
        (SPADCALL |lp| (QREFELT % 162))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;59|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |a| |b| (QREFELT % 166))) 

(SDEFUN |SMP;content;%VarSet%;60| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 150))))) 

(SDEFUN |SMP;gcd;3%;61| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 149))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 150))
                                   (QREFELT % 152)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 150))
                              |p2| (QREFELT % 152)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 153)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;62|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G829 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 154)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 154)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 152))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 158)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 159)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 158)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 159)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;63| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 150))))) 

(SDEFUN |SMP;gcd;3%;64| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|up| (D)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 149))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 150))
                                   (QREFELT % 152)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 150))
                              (QREFELT % 152)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 150))
                              |p2| (QREFELT % 152)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 153)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;65|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|mong| (|SparseUnivariatePolynomial| %)) (#2=#:G857 NIL)
          (|monb| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|mona| (|SparseUnivariatePolynomial| %)) (|conta| (%)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 154)) (QREFELT % 152))
                    (QREFELT % 155)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 154)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 154)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 156))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 157))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 158)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 152))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 158)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 159)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 158)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 159)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;coerce;%Of;66| ((|p| (%)) (% (|OutputForm|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 168)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT % 169))
                         (QREFELT % 170))))) 

(SDEFUN |SMP;coefficients;%L;67| ((|p| (%)) (% (|List| R)))
        (SPROG
         ((#1=#:G874 NIL) (#2=#:G873 #3=(|List| R)) (#4=#:G875 #3#)
          (#5=#:G877 NIL) (|p1| NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 173)))
                (#6='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |p1| NIL)
                       (LETT #5# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26)))
                       G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |p1| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4# (SPADCALL |p1| (QREFELT % 174)))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #4# (QREFELT % 175))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;%R;68| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;%U;69| ((|p| (%)) (% (|Union| R "failed")))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;mymerge|
        ((|l| (|List| |VarSet|)) (|m| (|List| |VarSet|)) (% (|List| |VarSet|)))
        (SEQ
         (COND ((NULL |l|) |m|) ((NULL |m|) |l|)
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT % 54))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| (CDR |m|) (QREFELT % 180)) (EXIT |l|)))
                 ((NULL (CDR |m|)) |l|)
                 (#1='T
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) (CDR |m|) %)
                             (QREFELT % 180))
                   (EXIT |l|)))))
               ((SPADCALL (|SPADfirst| |l|) (|SPADfirst| |m|) (QREFELT % 68))
                (COND
                 ((NULL (CDR |l|))
                  (SEQ (SPADCALL |l| |m| (QREFELT % 180)) (EXIT |l|)))
                 (#1#
                  (SEQ
                   (SPADCALL |l| (|SMP;mymerge| (CDR |l|) |m| %)
                             (QREFELT % 180))
                   (EXIT |l|)))))
               ((NULL (CDR |m|))
                (SEQ (SPADCALL |m| |l| (QREFELT % 180)) (EXIT |m|)))
               (#1#
                (SEQ
                 (SPADCALL |m| (|SMP;mymerge| |l| (CDR |m|) %) (QREFELT % 180))
                 (EXIT |m|)))))) 

(SDEFUN |SMP;variables;%L;71| ((|p| (%)) (% (|List| |VarSet|)))
        (SPROG ((|q| (D)) (|lv| (|List| |VarSet|)))
               (SEQ
                (COND ((QEQCAR |p| 0) NIL)
                      ('T
                       (SEQ (LETT |lv| NIL) (LETT |q| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL (NULL (SPADCALL |q| (QREFELT % 147))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |lv|
                                        (|SMP;mymerge| |lv|
                                         (SPADCALL
                                          (SPADCALL |q| (QREFELT % 24))
                                          (QREFELT % 181))
                                         %))
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| (QREFELT % 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT (CONS (QCAR (QCDR |p|)) |lv|)))))))) 

(SDEFUN |SMP;mainVariable;%U;72| ((|p| (%)) (% (|Union| |VarSet| "failed")))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;%VarSet2%;73|
        ((|p| (%)) (|mvar| (|VarSet|)) (|pval| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) |pval| (QREFELT % 184))) 

(SDEFUN |SMP;eval;%VarSetR%;74|
        ((|p| (%)) (|mvar| (|VarSet|)) (|val| (R)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (CONS 0 |val|)
                  (QREFELT % 184))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG ((|pts| (D)) (|pval| (%)) (|mvar| (|VarSet|)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT % 187))))
                  |p|)
                 ('T
                  (SEQ (LETT |mvar| (|SPADfirst| |Lvar|))
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68))
                          (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                           (SPADCALL |Lpval| '|rest| (QREFELT % 189)) %))
                         (#1='T
                          (SEQ
                           (LETT |pval|
                                 (SPADCALL |Lpval| '|first| (QREFELT % 191)))
                           (LETT |pts|
                                 (SPADCALL
                                  (CONS #'|SMP;evalSortedVarlist!0|
                                        (VECTOR % |Lpval| |Lvar|))
                                  (QCDR (QCDR |p|)) (QREFELT % 58)))
                           (EXIT
                            (COND
                             ((SPADCALL |mvar| (QCAR (QCDR |p|))
                                        (QREFELT % 54))
                              (COND
                               ((QEQCAR |pval| 0)
                                (SPADCALL |pts| (CONS 0 (QCDR |pval|))
                                          (QREFELT % 184)))
                               (#1# (SPADCALL |pts| |pval| (QREFELT % 184)))))
                             (#1#
                              (SPADCALL |pts| (QCAR (QCDR |p|))
                                        (QREFELT % 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| %)
          (LETT |Lvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| %))))) 

(SDEFUN |SMP;eval;%LL%;76|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|nlpval| (|List| %)) (#1=#:G936 NIL) (|mvar| NIL) (#2=#:G935 NIL)
          (|nlvar| (|List| |VarSet|)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT % 68) |Lvar| (QREFELT % 193)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| %))
           ('T
            (SEQ (LETT |nlvar| (SPADCALL (ELT % 68) |Lvar| (QREFELT % 194)))
                 (LETT |nlpval|
                       (COND
                        ((SPADCALL |Lvar| |nlvar| (QREFELT % 195)) |Lpval|)
                        ('T
                         (LETT |nlpval|
                               (PROGN
                                (LETT #2# NIL)
                                (SEQ (LETT |mvar| NIL) (LETT #1# |nlvar|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |mvar| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #2#
                                             (CONS
                                              (SPADCALL |Lpval|
                                                        (SPADCALL |mvar| |Lvar|
                                                                  (QREFELT %
                                                                           196))
                                                        (QREFELT % 197))
                                              #2#))))
                                     (LETT #1# (CDR #1#)) (GO G190) G191
                                     (EXIT (NREVERSE #2#))))))))
                 (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| %)))))))) 

(SDEFUN |SMP;eval;%LL%;77|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lval| (|List| R)) (% (%)))
        (SPROG ((#1=#:G941 NIL) (|val| NIL) (#2=#:G940 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |val| NIL) (LETT #1# |Lval|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |val| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #2# (CONS (CONS 0 |val|) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 198))))) 

(SDEFUN |SMP;degree;%VarSetNni;78|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24)) |mvar|
                          (QREFELT % 200))
                (SPADCALL (|SMP;red| |p| %) |mvar| (QREFELT % 200)))))) 

(SDEFUN |SMP;degree;%LL;79|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G952 NIL) (|mvar| NIL) (#2=#:G951 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #1# |Lvar|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 200))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;degree;%Ie;80| ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (COND ((QEQCAR |p| 0) (|spadConstant| % 203))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 76))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                          (QCAR (QCDR |p|)) (QREFELT % 204))
                (QREFELT % 205))))) 

(SDEFUN |SMP;minimumDegree;%Ie;81|
        ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 203))
                      ('T
                       (SEQ
                        (LETT |md|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 206)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT % 91))
                           (QREFELT % 207))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT % 204))
                          (QREFELT % 205))))))))) 

(SDEFUN |SMP;minimumDegree;%VarSetNni;82|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG ((|p1| (%)) (|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 206)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                               |mvar| (QREFELT % 208)))
                        (LETT |p1| (|SMP;red| |p| %))
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT % 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT % 208)))))))))))) 

(SDEFUN |SMP;minimumDegree;%LL;83|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G972 NIL) (|mvar| NIL) (#2=#:G971 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #1# |Lvar|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |mvar| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 208))
                                    #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;84| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SEQ
                        (LETT |up|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 210)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#1#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;%VarSet%;84!0|
                                     (VECTOR % |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT % 58)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;84!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| %)
          (LETT |mvar| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT % 211)))))) 

(SDEFUN |SMP;leadingCoefficient;%R;85| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                         (QREFELT % 37))))) 

(SDEFUN |SMP;leadingMonomial;2%;86| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 212))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                (QREFELT % 64))))) 

(SDEFUN |SMP;reductum;2%;87| ((|p| (%)) (% (%)))
        (SPROG ((|ptr| (D)) (|rlc| (%)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
                      (#1='T
                       (SEQ
                        (LETT |rlc|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                               (QREFELT % 80)))
                        (LETT |ptr|
                              (SPADCALL
                               (SPADCALL |rlc|
                                         (SPADCALL (QCDR (QCDR |p|))
                                                   (QREFELT % 40))
                                         (QREFELT % 29))
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 22))
                               (QREFELT % 59)))
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |ptr| (QREFELT % 40)) 0)
                           (SPADCALL |ptr| (QREFELT % 213)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| (|VPoly|)) (|vars| #1=(|List| |VarSet|))
         (|degs| #2=(|List| (|NonNegativeInteger|))) (|res| (|List| %))
         (% (|List| %)))
        (SPROG
         ((|degs1| #2#) (|vars1| #1#) (|mon| (%))
          (|mon1|
           #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| %)))
          (#5=#:G1009 NIL) (|var| NIL) (#6=#:G1010 NIL) (|deg| NIL) (|k1| #4#)
          (|p1| (%)) (#7=#:G1008 NIL) (|t| NIL) (|v1| (|VarSet|))
          (|tl| (|List| #3#)))
         (SEQ (LETT |tl| (QCDR |p|)) (LETT |v1| (QCAR |p|))
              (SEQ (LETT |t| NIL) (LETT #7# |tl|) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |t| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |p1| (QCDR |t|)) (LETT |k1| (QCAR |t|))
                        (EXIT
                         (COND
                          ((QEQCAR |p1| 0)
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((> |k1| 0) (CONS 1 (CONS |v1| (LIST |t|))))
                                   ('T |p1|)))
                            (SEQ (LETT |deg| NIL) (LETT #6# |degs|)
                                 (LETT |var| NIL) (LETT #5# |vars|) G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |var| (CAR #5#)) NIL)
                                       (ATOM #6#)
                                       (PROGN (LETT |deg| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |mon1| (CONS |deg| |mon|))
                                      (EXIT
                                       (LETT |mon|
                                             (CONS 1
                                                   (CONS |var|
                                                         (LIST |mon1|))))))
                                 (LETT #5#
                                       (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |mon| |res| (QREFELT % 214))))))
                          ('T
                           (SEQ
                            (LETT |vars1|
                                  (COND ((> |k1| 0) (CONS |v1| |vars|))
                                        ('T |vars|)))
                            (LETT |degs1|
                                  (COND ((> |k1| 0) (CONS |k1| |degs|))
                                        ('T |degs|)))
                            (EXIT
                             (LETT |res|
                                   (|SMP;monomials1| (QCDR |p1|) |vars1|
                                    |degs1| |res| %))))))))
                   (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;%L;89| ((|p| (%)) (% (|List| %)))
        (COND ((SPADCALL |p| (|spadConstant| % 12) (QREFELT % 32)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL %)
                         (QREFELT % 215))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G1046)
  (SPROG NIL
         (PROG (#2=#:G1047)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseMultivariatePolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseMultivariatePolynomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseMultivariatePolynomial|)))))))))) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G1045 NIL) (|pv$| NIL) (#2=#:G1036 NIL) (#3=#:G1038 NIL)
    (#4=#:G1037 NIL) (#5=#:G1039 NIL) (#6=#:G1040 NIL) (#7=#:G1041 NIL)
    (#8=#:G1042 NIL) (#9=#:G1043 NIL) (#10=#:G1044 NIL) (% NIL) (|dv$| NIL)
    (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 246))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
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
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #10#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10#)
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory| |#2|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| |#2|
                                                            '(|Hashable|)))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
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
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|)))
                                        (OR #10# #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         #10# #9#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #10# #9#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #8#
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #10#
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
                                         #8#)
                                        (LETT #7#
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
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory| |#2|
                                                         '(|PatternMatchable|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
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
                                          #10#
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
                                         #7#)
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #10#
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
                                        (LETT #5#
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
                                                         '(|CharacteristicNonZero|))
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
                                                         '(|CharacteristicZero|))
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
                                          #10#
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
                                         #5#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #3#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|)))
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #4# #10#)
                                         (AND #4#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                         #3#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17592186044416))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 35184372088832))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| % 70368744177664))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 140737488355328))
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #10#
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 281474976710656))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      #10# (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 562949953421312))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 1125899906842624))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|AbelianMonoid|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #2#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #4# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND #9# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 36028797018963968))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8 (|SparseUnivariatePolynomial| %))
    (QSETREFV % 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT % 8))))
    (QSETREFV % 10 (|Union| |#1| (QREFELT % 9)))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;One;%;2|) % 14)))))
    (QSETREFV % 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| % 14)))
               ('T (QCDR (|spadConstant| % 12)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 21 (CONS (|dispatchFunction| |SMP;one?;%B;4|) %))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet%;7|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 95 (CONS (|dispatchFunction| |SMP;coerce;I%;29|) %))
       (QSETREFV % 97
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;30|) %)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV % 101 (CONS (|dispatchFunction| |SMP;recip;%U;32|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 104 (CONS (|dispatchFunction| |SMP;-;2%;33|) %))
       (QSETREFV % 107 (CONS (|dispatchFunction| |SMP;*;I2%;34|) %)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 115 (CONS (|dispatchFunction| |SMP;-;3%;37|) %))))
    (COND
     ((|HasCategory| |#1| '(|Hashable|))
      (COND
       ((|HasCategory| |#2| '(|Hashable|))
        (QSETREFV % 129
                  (CONS (|dispatchFunction| |SMP;hashUpdate!;Hs%Hs;43|) %))))))
    (COND
     ((|testBitVector| |pv$| 23)
      (PROGN
       (QSETREFV % 132 (CONS (|dispatchFunction| |SMP;unitNormal;%R;44|) %))
       (QSETREFV % 134 (CONS (|dispatchFunction| |SMP;unitCanonical;2%;45|) %))
       (QSETREFV % 136 (CONS (|dispatchFunction| |SMP;unit?;%B;46|) %))
       (QSETREFV % 139 (CONS (|dispatchFunction| |SMP;associates?;2%B;47|) %))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV % 142 (CONS (|dispatchFunction| |SMP;exquo;2%U;48|) %)))
        ('T
         (QSETREFV % 142 (CONS (|dispatchFunction| |SMP;exquo;2%U;49|) %)))))))
    (COND
     ((|testBitVector| |pv$| 21)
      (QSETREFV % 146 (CONS (|dispatchFunction| |SMP;/;%R%;51|) %))))
    (COND
     ((|testBitVector| |pv$| 14)
      (QSETREFV % 148 (CONS (|dispatchFunction| |SMP;content;%R;52|) %))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|testBitVector| |pv$| 3)
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 151
                       (CONS (|dispatchFunction| |SMP;content;%VarSet%;53|) %))
             (QSETREFV % 152 (CONS (|dispatchFunction| |SMP;gcd;3%;54|) %))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV % 160
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;55|)
                               %))))))))
         ('T
          (PROGN
           (QSETREFV % 151
                     (CONS (|dispatchFunction| |SMP;content;%VarSet%;56|) %))
           (QSETREFV % 152 (CONS (|dispatchFunction| |SMP;gcd;3%;57|) %))
           (QSETREFV % 165 (CONS (|dispatchFunction| |SMP;gcd;L%;58|) %))
           (QSETREFV % 160
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;59|)
                           %))))))
       ((|testBitVector| |pv$| 14)
        (PROGN
         (QSETREFV % 151
                   (CONS (|dispatchFunction| |SMP;content;%VarSet%;60|) %))
         (QSETREFV % 152 (CONS (|dispatchFunction| |SMP;gcd;3%;61|) %))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV % 160
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;62|)
                           %))))))))
     ((|testBitVector| |pv$| 14)
      (PROGN
       (QSETREFV % 151 (CONS (|dispatchFunction| |SMP;content;%VarSet%;63|) %))
       (QSETREFV % 152 (CONS (|dispatchFunction| |SMP;gcd;3%;64|) %))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV % 160
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;65|)
                         %)))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV % 211
                (CONS (|dispatchFunction| |SMP;differentiate;%VarSet%;84|)
                      %))))
    %))) 

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;Zero;%;1|) %))
              (4 . |One|) (8 . |One|) '|m_one| (|Boolean|) (12 . |zero?|)
              |SMP;zero?;%B;3| (17 . |One|) (21 . =) (27 . |one?|)
              (32 . |reductum|) (37 . |ground?|) (42 . |leadingCoefficient|)
              (|List| $$) (47 . |coefficients|) (|NonNegativeInteger|)
              |SMP;numberOfMonomials;%Nni;6| (52 . |monomial|) (58 . |coerce|)
              (63 . |monomial?|) |SMP;=;2%B;38| |SMP;monomial?;%B;9|
              |SMP;ground?;%B;25| (|Mapping| 16 $$) (68 . |any?|)
              |SMP;leadingCoefficient;%R;85| (|SparseUnivariatePolynomial| 6)
              (74 . |coerce|) (79 . |degree|) (84 . |monomial|) (90 . +)
              (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 38) (96 . |map|)
              |SMP;univariate;%Sup;12| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet%;13| |SMP;+;3%;36| (122 . <)
              (128 . =) (|SparseUnivariatePolynomial| %)
              |SMP;univariate;%VarSetSup;15| (|Mapping| $$ $$) (134 . |map|)
              (140 . +) (|SparseUnivariatePolynomial| $$) (146 . |degree|)
              (151 . |coefficient|) (157 . |leadingCoefficient|)
              |SMP;monomial;%VarSetNni%;26| (162 . |reductum|)
              (167 . |ground?|) (172 . |zero?|) (177 . >)
              |SMP;multivariate;SupVarSet%;17| (|IndexedExponents| 7)
              |SMP;monomial;RIe%;27| (|Record| (|:| |k| 70) (|:| |c| 6))
              (|List| 72) |SMP;construct;L%;18| |SMP;constructOrdered;L%;19|
              |SMP;degree;%Ie;80| |SMP;leadingSupport;%Ie;20|
              |SMP;leadingTerm;%R;21| |SMP;*;3%;39| |SMP;reductum;2%;87|
              (|Mapping| 6 70) |SMP;linearExtend;M%R;22|
              |SMP;listOfTerms;%L;23| (|List| 70) |SMP;support;%L;24|
              (183 . |shiftLeft|) (189 . |zero?|) (194 . |reductum|)
              (199 . |leadingCoefficient|) (204 . |leadingSupport|)
              (209 . |coefficient|) |SMP;coefficient;%IeR;28| (|Integer|)
              (215 . |coerce|) (220 . |coerce|) (225 . |characteristic|)
              (229 . |characteristic|) |SMP;coerce;R%;31| (|Union| % '"failed")
              (233 . |recip|) (238 . |recip|) (243 . -) (248 . -) (253 . -)
              (258 . *) (264 . *) (270 . *) (276 . *) (282 . *) |SMP;*;R2%;35|
              (288 . +) (294 . |coerce|) (299 . -) (305 . -) (311 . -)
              (317 . =) (323 . *) (329 . *) (335 . ^) (341 . ^) (347 . ^)
              |SMP;^;%Nni%;41| (|PositiveInteger|) |SMP;^;%Pi%;42|
              (|HashState|) (353 . |hashUpdate!|) (359 . |hashUpdate!|)
              (365 . |hashUpdate!|) (371 . |hashUpdate!|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (377 . |unitNormal|) (382 . |unitNormal|) (387 . |unitCanonical|)
              (392 . |unitCanonical|) (397 . |unit?|) (402 . |unit?|)
              (407 . |associates?|) (413 . |associates?|) (419 . |associates?|)
              (425 . |exquo|) (431 . |exquo|) (437 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2%;50| (443 . |inv|) (448 . /) (454 . |zero?|)
              (459 . |content|) (464 . |gcd|) (470 . |content|)
              (475 . |content|) (481 . |gcd|) (487 . |gcd|) (493 . |content|)
              (498 . |coerce|) (503 . |minimumDegree|) (508 . ~=)
              (514 . |exquo|) (520 . *) (526 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 70 7 6 $$) (532 . |gcd|) (537 . |gcd|)
              (|List| %) (543 . |gcd|) (548 . |gcd|) (|OutputForm|)
              (554 . |coerce|) (559 . |coerce|) (564 . |outputForm|)
              |SMP;coerce;%Of;66| (|List| 6) (570 . |list|)
              |SMP;coefficients;%L;67| (575 . |append|) |SMP;retract;%R;68|
              (|Union| 6 '"failed") |SMP;retractIfCan;%U;69| (|List| 7)
              (581 . |setrest!|) |SMP;variables;%L;71| (|Union| 7 '"failed")
              |SMP;mainVariable;%U;72| (587 . |elt|) |SMP;eval;%VarSet2%;73|
              |SMP;eval;%VarSetR%;74| (593 . |empty?|) '"rest" (598 . |elt|)
              '"first" (604 . |elt|) (|Mapping| 16 7 7) (610 . |sorted?|)
              (616 . |sort|) (622 . =) (628 . |position|) (634 . |elt|)
              |SMP;eval;%LL%;76| |SMP;eval;%LL%;77| |SMP;degree;%VarSetNni;78|
              (|List| 27) |SMP;degree;%LL;79| (640 . |Zero|) (644 . |monomial|)
              (650 . +) (656 . |minimumDegree|) |SMP;minimumDegree;%Ie;81|
              |SMP;minimumDegree;%VarSetNni;82| |SMP;minimumDegree;%LL;83|
              (661 . |differentiate|) (666 . |differentiate|)
              |SMP;leadingMonomial;2%;86| (672 . |ground|) (677 . |cons|)
              (683 . |reverse!|) |SMP;monomials;%L;89|
              (|Union| 224 '#1="failed") (|Matrix| %) (|InputForm|)
              (|Pattern| (|Float|)) (|Pattern| 93) (|SingleInteger|)
              (|Record| (|:| |mat| 225) (|:| |vec| (|Vector| 93))) (|Vector| %)
              (|Matrix| 93) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 93 %) (|Fraction| 93)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Factored| %) (|Factored| 55) (|Union| 233 '#1#) (|List| 55)
              (|Union| 228 '#2="failed") (|Union| 93 '#2#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)) (|Matrix| 6)
              (|Record| (|:| |mat| 237) (|:| |vec| (|Vector| 6)))
              (|Equation| %) (|List| 239)
              (|Record| (|:| |var| 7) (|:| |exponent| 27))
              (|Union| 241 '#3="failed") (|Union| 164 '#3#) (|Mapping| 70 70)
              (|String|))
           '#(~= 688 |zero?| 694 |variables| 699 |univariate| 704 |unitNormal|
              715 |unitCanonical| 720 |unit?| 725 |totalDegreeSorted| 730
              |totalDegree| 736 |support| 747 |subtractIfCan| 752
              |squareFreePolynomial| 758 |squareFreePart| 763 |squareFree| 768
              |solveLinearPolynomialEquation| 773 |smaller?| 779 |sample| 785
              |rightRecip| 789 |rightPower| 794 |retractIfCan| 806 |retract|
              826 |resultant| 846 |reductum| 853 |reducedSystem| 858 |recip|
              880 |primitivePart| 885 |primitiveMonomials| 896 |prime?| 901
              |pomopo!| 906 |plenaryPower| 914 |patternMatch| 920 |opposite?|
              934 |one?| 940 |numberOfMonomials| 945 |multivariate| 950
              |monomials| 962 |monomial?| 967 |monomial| 972 |monicDivide| 992
              |minimumDegree| 999 |mapExponents| 1016 |map| 1022 |mainVariable|
              1028 |listOfTerms| 1033 |linearExtend| 1038 |leftRecip| 1044
              |leftPower| 1049 |leadingTerm| 1061 |leadingSupport| 1066
              |leadingMonomial| 1071 |leadingCoefficient| 1076 |lcmCoef| 1081
              |lcm| 1087 |latex| 1098 |isTimes| 1103 |isPlus| 1108 |isExpt|
              1113 |hashUpdate!| 1118 |hash| 1124 |ground?| 1129 |ground| 1134
              |gcdPolynomial| 1139 |gcd| 1145 |fmecg| 1156
              |factorSquareFreePolynomial| 1164 |factorPolynomial| 1169
              |factor| 1174 |exquo| 1179 |eval| 1191 |discriminant| 1245
              |differentiate| 1251 |degree| 1277 |convert| 1294 |content| 1309
              |constructOrdered| 1320 |construct| 1325 |conditionP| 1330
              |commutator| 1335 |coerce| 1341 |coefficients| 1371 |coefficient|
              1376 |charthRoot| 1396 |characteristic| 1401 |binomThmExpt| 1405
              |associator| 1412 |associates?| 1419 |antiCommutator| 1425
              |annihilate?| 1431 ^ 1437 |Zero| 1449 |One| 1453 D 1457 = 1483 /
              1489 - 1495 + 1506 * 1512)
           'NIL
           (CONS
            (|makeByteWordVec2| 44
                                '(0 0 10 0 10 0 16 25 24 14 1 2 3 15 26 17 4 27
                                  0 1 15 12 26 27 0 0 1 5 4 24 0 0 0 1 4 4 38 0
                                  0 0 0 0 1 1 38 27 11 44 12 12 0 0 43 12 0 0 0
                                  9 29 31 0 0 6 7 26 19 12 12 0 0 0 0 0 0 4 6 7
                                  8 26 13 33 35 18 12 12))
            (CONS
             '#(|PolynomialCategory&| |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |FiniteAbelianMonoidRing&|
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL NIL NIL |Algebra&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| |PartialDifferentialRing&| NIL
                |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&| |Rng&|
                NIL NIL |Module&| |Module&| |FullyLinearlyExplicitOver&|
                |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| |AbelianGroup&|
                NIL NIL NIL |NonAssociativeSemiRng&| NIL |AbelianMonoid&|
                |MagmaWithUnit&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL |RetractableTo&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL |Hashable&| |Evalable&|
                |RetractableTo&| NIL |InnerEvalable&| |InnerEvalable&| NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|UniqueFactorizationDomain|)
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7)) (|GcdDomain|)
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 228) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|Algebra| $$)
                 (|EntireRing|) (|PartialDifferentialRing| 7) (|Ring|)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeAlgebra| 228) (|NonAssociativeAlgebra| 6)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|Module| 228) (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|Module| $$)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 228 228)
                 (|NonAssociativeRing|) (|LinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 93) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 228) (|RightModule| 228)
                 (|RightModule| 93) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|PatternMatchable| (|Float|)) (|PatternMatchable| 93)
                 (|RetractableTo| 6) (|SetCategory|) (|RetractableTo| 228)
                 (|RetractableTo| 93) (|CommutativeStar|) (|Hashable|)
                 (|Evalable| $$) (|RetractableTo| 7)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 7 $$)
                 (|InnerEvalable| 7 6) (|CoercibleFrom| 6) (|BasicType|)
                 (|CoercibleTo| 167) (|unitsKnown|) (|CoercibleFrom| 228)
                 (|CoercibleFrom| 93) (|canonicalUnitNormal|) (|TwoSidedRecip|)
                 (|noZeroDivisors|) (|ConvertibleTo| 220) (|ConvertibleTo| 221)
                 (|ConvertibleTo| 219) (|InnerEvalable| $$ $$)
                 (|CoercibleFrom| 7))
              (|makeByteWordVec2| 245
                                  '(0 6 0 11 0 6 0 13 0 0 0 14 1 6 16 0 17 0 8
                                    0 19 2 6 16 0 0 20 1 0 16 0 21 1 8 0 0 22 1
                                    8 16 0 23 1 8 2 0 24 1 8 25 0 26 2 8 0 2 27
                                    29 1 0 0 7 30 1 8 16 0 31 2 25 16 35 0 36 1
                                    38 0 6 39 1 8 27 0 40 2 38 0 6 27 41 2 38 0
                                    0 0 42 2 44 38 43 8 45 1 38 16 0 47 1 38 6
                                    0 48 1 38 27 0 49 1 38 0 0 50 2 7 16 0 0 53
                                    2 7 16 0 0 54 2 8 0 57 0 58 2 8 0 0 0 59 1
                                    60 27 0 61 2 60 2 0 27 62 1 60 2 0 63 1 60
                                    0 0 65 1 60 16 0 66 1 60 16 0 67 2 7 16 0 0
                                    68 2 8 0 0 27 86 1 70 16 0 87 1 70 0 0 88 1
                                    70 27 0 89 1 70 7 0 90 2 8 2 0 27 91 1 6 0
                                    93 94 1 0 0 93 95 0 6 27 96 0 0 27 97 1 6
                                    99 0 100 1 0 99 0 101 1 6 0 0 102 1 8 0 0
                                    103 1 0 0 0 104 2 6 0 93 0 105 2 8 0 93 0
                                    106 2 0 0 93 0 107 2 6 0 0 0 108 2 8 0 2 0
                                    109 2 6 0 0 0 111 1 8 0 2 112 2 6 0 0 0 113
                                    2 8 0 0 0 114 2 0 0 0 0 115 2 8 16 0 0 116
                                    2 8 0 0 2 117 2 8 0 0 0 118 2 6 0 0 27 119
                                    2 38 0 0 27 120 2 8 0 0 27 121 2 6 125 125
                                    0 126 2 7 125 125 0 127 2 8 125 125 0 128 2
                                    0 125 125 0 129 1 6 130 0 131 1 0 130 0 132
                                    1 6 0 0 133 1 0 0 0 134 1 6 16 0 135 1 0 16
                                    0 136 2 6 16 0 0 137 2 8 16 0 0 138 2 0 16
                                    0 0 139 2 6 99 0 0 140 2 8 99 0 0 141 2 0
                                    99 0 0 142 1 6 0 0 145 2 0 0 0 6 146 1 8 16
                                    0 147 1 0 6 0 148 2 6 0 0 0 149 1 8 2 0 150
                                    2 0 0 0 7 151 2 0 0 0 0 152 2 8 0 0 0 153 1
                                    60 2 0 154 1 60 0 2 155 1 60 27 0 156 2 60
                                    16 0 0 157 2 60 99 0 0 158 2 60 0 0 0 159 2
                                    0 55 55 55 160 1 161 2 25 162 2 161 2 2 2
                                    163 1 0 0 164 165 2 161 60 60 60 166 1 6
                                    167 0 168 1 7 167 0 169 2 8 167 0 167 170 1
                                    172 0 6 173 2 172 0 0 0 175 2 179 0 0 0 180
                                    2 8 2 0 2 184 1 25 16 0 187 2 25 0 0 188
                                    189 2 25 2 0 190 191 2 179 16 192 0 193 2
                                    179 0 192 0 194 2 179 16 0 0 195 2 179 93 7
                                    0 196 2 25 2 0 93 197 0 70 0 203 2 70 0 27
                                    7 204 2 70 0 0 0 205 1 8 27 0 206 1 8 0 0
                                    210 2 0 0 0 7 211 1 8 2 0 213 2 25 0 2 0
                                    214 1 25 0 0 215 2 0 16 0 0 1 1 54 16 0 18
                                    1 0 179 0 181 2 0 55 0 7 56 1 0 38 0 46 1
                                    48 130 0 132 1 48 0 0 134 1 48 16 0 136 2 0
                                    27 0 179 1 1 0 27 0 1 2 0 27 0 179 1 1 0 84
                                    0 85 2 55 99 0 0 1 1 10 231 55 1 1 14 0 0 1
                                    1 14 230 0 1 2 10 232 233 55 1 2 9 16 0 0 1
                                    0 54 0 1 1 52 99 0 1 2 52 0 0 27 1 2 0 0 0
                                    123 1 1 6 234 0 1 1 7 235 0 1 1 12 182 0 1
                                    1 0 177 0 178 1 6 228 0 1 1 7 93 0 1 1 12 7
                                    0 1 1 0 6 0 176 3 5 0 0 0 7 1 1 20 0 0 80 2
                                    37 223 218 224 1 1 37 225 218 1 1 4 237 218
                                    1 2 4 238 218 224 1 1 52 99 0 101 2 14 0 0
                                    7 1 1 14 0 0 1 1 12 164 0 1 1 10 16 0 1 4 0
                                    0 0 6 70 0 1 2 49 0 0 123 1 3 28 226 0 220
                                    226 1 3 30 227 0 221 227 1 2 54 16 0 0 1 1
                                    52 16 0 21 1 0 27 0 28 2 0 0 55 7 69 2 0 0
                                    38 7 51 1 0 164 0 216 1 0 16 0 33 3 0 0 0 7
                                    27 64 3 0 0 0 179 201 1 2 0 0 6 70 71 3 4
                                    236 0 0 7 1 2 0 27 0 7 208 2 0 201 0 179
                                    209 1 0 70 0 207 2 0 0 244 0 1 2 0 0 143 0
                                    144 1 0 182 0 183 1 0 73 0 83 2 5 6 81 0 82
                                    1 52 99 0 1 2 52 0 0 27 1 2 0 0 0 123 1 1
                                    20 72 0 78 1 20 70 0 77 1 20 0 0 212 1 20 6
                                    0 37 2 14 229 0 0 1 2 14 0 0 0 1 1 14 0 164
                                    1 1 0 245 0 1 1 12 243 0 1 1 0 243 0 1 1 12
                                    242 0 1 2 19 125 125 0 129 1 19 222 0 1 1 0
                                    16 0 34 1 0 6 0 1 2 14 55 55 55 160 1 14 0
                                    164 165 2 14 0 0 0 152 4 4 0 0 70 6 0 1 1
                                    10 231 55 1 1 10 231 55 1 1 10 230 0 1 2 48
                                    99 0 0 142 2 13 99 0 6 1 3 12 0 0 164 164 1
                                    2 12 0 0 239 1 3 12 0 0 0 0 1 2 12 0 0 240
                                    1 3 0 0 0 7 0 185 3 0 0 0 179 164 198 3 0 0
                                    0 179 172 199 3 0 0 0 7 6 186 2 5 0 0 7 1 2
                                    4 0 0 7 211 2 4 0 0 179 1 3 4 0 0 179 201 1
                                    3 4 0 0 7 27 1 2 0 27 0 7 200 2 0 201 0 179
                                    202 1 0 70 0 76 1 18 219 0 1 1 32 220 0 1 1
                                    34 221 0 1 2 14 0 0 7 151 1 14 6 0 148 1 20
                                    0 73 75 1 0 0 73 74 1 46 217 218 1 2 53 0 0
                                    0 1 1 50 0 0 1 1 51 0 93 95 1 22 0 228 1 1
                                    12 0 7 30 1 0 0 6 98 1 0 167 0 171 1 0 172
                                    0 174 3 0 0 0 7 27 1 3 0 0 0 179 201 1 2 0
                                    6 0 70 92 1 47 99 0 1 0 53 27 97 3 45 0 0 0
                                    27 1 3 53 0 0 0 0 1 2 48 16 0 0 139 2 0 0 0
                                    0 1 2 53 16 0 0 1 2 52 0 0 27 122 2 0 0 0
                                    123 124 0 54 0 12 0 52 0 14 2 4 0 0 179 1 2
                                    4 0 0 7 1 3 4 0 0 7 27 1 3 4 0 0 179 201 1
                                    2 0 16 0 0 32 2 21 0 0 6 146 2 56 0 0 0 115
                                    1 56 0 0 104 2 0 0 0 0 52 2 37 0 0 93 1 2
                                    56 0 93 0 107 2 54 0 27 0 1 2 1 0 228 0 1 2
                                    1 0 0 228 1 2 0 0 6 0 110 2 0 0 0 6 1 2 0 0
                                    0 0 79 2 0 0 123 0 1)))))
           '|lookupComplete|)) 
