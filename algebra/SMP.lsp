
(SDEFUN |SMP;0;%;1| ((% (%))) (CONS 0 (|spadConstant| % 11))) 

(SDEFUN |SMP;1;%;2| ((% (%))) (CONS 0 (|spadConstant| % 13))) 

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
         ((|q| NIL) (#1=#:G118 NIL) (#2=#:G116 #3=(|NonNegativeInteger|))
          (#4=#:G114 #3#) (#5=#:G115 NIL))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (COND ((SPADCALL (QCDR |p|) (QREFELT % 17)) 0) (#6='T 1)))
           (#6#
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |q| NIL)
                  (LETT #1# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26))) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |q| (CAR #1#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #2# (SPADCALL |q| (QREFELT % 28)))
                     (COND (#5# (LETT #4# (+ #4# #2#)))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                  (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#6# 0)))))))) 

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
         ((|pt| (D)) (|ulc0| (|SparseUnivariatePolynomial| %)) (|ulc| (D)))
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
         ((|cc| (%)) (|uu| (|SparseUnivariatePolynomial| %)) (#1=#:G162 NIL))
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
                              (GO #2=#:G161))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 1 (CONS |mvar| |u|)))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SMP;construct;L%;18|
        ((|lt|
          (|List|
           (|Record| (|:| |k| (|IndexedExponents| |VarSet|)) (|:| |c| R))))
         (% (%)))
        (SPROG ((|t| NIL) (#1=#:G170 NIL) (|res| (%)))
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
        (SPROG ((|res| (R)))
               (SEQ (LETT |res| (QCDR (|spadConstant| % 12)))
                    (SEQ G190
                         (COND
                          ((NULL (NULL (SPADCALL |p| (QREFELT % 18))))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (QCDR
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS 0 (SPADCALL |p| (QREFELT % 37)))
                                   (CONS 0
                                         (SPADCALL
                                          (SPADCALL |p| (QREFELT % 76)) |f|))
                                   (QREFELT % 79))
                                  (CONS 0 |res|) (QREFELT % 52))))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 80)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

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
        (SPROG ((|pt| (D)) (|pt1| (D)))
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
        (SPROG ((|p1| (%)) (|m1| (D)))
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
        (SPROG ((|ve| (|VarSet|)) (|vp| (|VarSet|)))
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

(MAKEPROP '|SMP;coerce;R%;31| '|SPADreplace| '(XLAM (|c|) (CONS 0 |c|))) 

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
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
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
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND ((SPADCALL |c| (QREFELT % 17)) (|spadConstant| % 12))
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

(SDEFUN |SMP;*;%R%;36| ((|p| (%)) (|c| (R)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND ((SPADCALL |c| (QREFELT % 17)) (|spadConstant| % 12))
                      ((SPADCALL |c| (QREFELT % 15) (QREFELT % 20)) |p|)
                      ((QEQCAR |p| 0)
                       (CONS 0 (SPADCALL (QCDR |p|) |c| (QREFELT % 108))))
                      (#1='T
                       (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                            (LETT |up|
                                  (SPADCALL (QCDR (QCDR |p|)) (CONS 0 |c|)
                                            (QREFELT % 111)))
                            (EXIT
                             (COND
                              ((SPADCALL |up| (QREFELT % 23))
                               (SPADCALL |up| (QREFELT % 24)))
                              (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;+;3%;37| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
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
                               (SPADCALL (SPADCALL |p1| (QREFELT % 114))
                                         (QCDR (QCDR |p2|)) (QREFELT % 59)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 114))
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
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 114))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 59)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 114))
                                           (QREFELT % 59)))))))))))) 

(SDEFUN |SMP;-;3%;38| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (EXIT
                     (CONS 0
                           (SPADCALL (QCDR |p1|) (QCDR |p2|)
                                     (QREFELT % 115))))))))
                (EXIT
                 (COND
                  ((QEQCAR |p1| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p2|))
                               (SPADCALL (SPADCALL |p1| (QREFELT % 114))
                                         (QCDR (QCDR |p2|)) (QREFELT % 116)))))
                  ((QEQCAR |p2| 0)
                   (CONS 1
                         (CONS (QCAR (QCDR |p1|))
                               (SPADCALL (QCDR (QCDR |p1|))
                                         (SPADCALL |p2| (QREFELT % 114))
                                         (QREFELT % 116)))))
                  (#1='T
                   (COND
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 54))
                     (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                          (LETT |up|
                                (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                          (QREFELT % 116)))
                          (EXIT
                           (COND
                            ((SPADCALL |up| (QREFELT % 23))
                             (SPADCALL |up| (QREFELT % 24)))
                            (#1# (CONS 1 (CONS |mvar| |up|)))))))
                    ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                               (QREFELT % 53))
                     (CONS 1
                           (CONS (QCAR (QCDR |p2|))
                                 (SPADCALL (SPADCALL |p1| (QREFELT % 114))
                                           (QCDR (QCDR |p2|))
                                           (QREFELT % 116)))))
                    (#1#
                     (CONS 1
                           (CONS (QCAR (QCDR |p1|))
                                 (SPADCALL (QCDR (QCDR |p1|))
                                           (SPADCALL |p2| (QREFELT % 114))
                                           (QREFELT % 116)))))))))))) 

(SDEFUN |SMP;=;2%B;39| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 20)))
           (#1='T NIL)))
         ((QEQCAR |p2| 0) NIL)
         (#1#
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 118)))
           (#1# NIL))))) 

(SDEFUN |SMP;*;3%;40| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0) (SPADCALL (QCDR |p1|) |p2| (QREFELT % 110)))
                 ((QEQCAR |p2| 0) (SPADCALL |p1| (QCDR |p2|) (QREFELT % 112)))
                 (#1='T
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 54))
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 119)))
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
                                         (QREFELT % 111)))
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
        (SPROG ((|kp| (|PositiveInteger|)) (|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND ((EQL |k| 0) (CONS 0 (QREFELT % 15)))
                      (#1='T
                       (SEQ (LETT |kp| |k|)
                            (EXIT
                             (COND
                              ((QEQCAR |p| 0)
                               (CONS 0
                                     (SPADCALL (QCDR |p|) |kp|
                                               (QREFELT % 120))))
                              ((NULL (|SMP;moreThanOneVariable?| |p| %))
                               (SPADCALL
                                (SPADCALL (|SMP;univariateKnown| |p| %) |kp|
                                          (QREFELT % 121))
                                (QCAR (QCDR |p|)) (QREFELT % 51)))
                              ('T
                               (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                                    (LETT |up|
                                          (SPADCALL (QCDR (QCDR |p|)) |kp|
                                                    (QREFELT % 122)))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |up| (QREFELT % 23))
                                       (SPADCALL |up| (QREFELT % 24)))
                                      (#1#
                                       (CONS 1 (CONS |mvar| |up|))))))))))))))) 

(SDEFUN |SMP;^;%Nni%;42| ((|p| (%)) (|k| (|NonNegativeInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |k| %)) 

(SDEFUN |SMP;^;%Pi%;43| ((|p| (%)) (|kp| (|PositiveInteger|)) (% (%)))
        (|SMP;pow_aux| |p| |kp| %)) 

(SDEFUN |SMP;hashUpdate!;Hs%Hs;44|
        ((|s| (|HashState|)) (|p| (%)) (% (|HashState|)))
        (SEQ
         (COND ((QEQCAR |p| 0) (SPADCALL |s| (QCDR |p|) (QREFELT % 127)))
               ('T
                (SEQ
                 (LETT |s| (SPADCALL |s| (QCAR (QCDR |p|)) (QREFELT % 128)))
                 (EXIT (SPADCALL |s| (QCDR (QCDR |p|)) (QREFELT % 129)))))))) 

(SDEFUN |SMP;triage| ((|p| (%)) (|q| (%)) (% #1=(|SingleInteger|)))
        (SPROG
         ((|pv| (|VPoly|)) (|qv| (|VPoly|)) (|dp| #2=(|NonNegativeInteger|))
          (|dq| #2#) (|lcp| (%)) (|lcq| (%)) (|tr1| #1#) (#3=#:G300 NIL)
          (|pu| (D)) (|qu| (D)))
         (SEQ
          (EXIT
           (COND
            ((QEQCAR |p| 0)
             (COND
              ((QEQCAR |q| 0)
               (COND ((SPADCALL (QCDR |p|) (QCDR |q|) (QREFELT % 20)) 0)
                     ((SPADCALL (QCDR |p|) (QCDR |q|) (QREFELT % 131)) 1)
                     (#4='T -1)))
              ((SPADCALL (|spadConstant| % 11) (SPADCALL |q| (QREFELT % 37))
                         (QREFELT % 131))
               1)
              (#4# -1)))
            ((QEQCAR |q| 0)
             (COND
              ((SPADCALL (SPADCALL |p| (QREFELT % 37)) (|spadConstant| % 11)
                         (QREFELT % 131))
               1)
              (#4# -1)))
            (#4#
             (SEQ (LETT |pv| (QCDR |p|)) (LETT |qv| (QCDR |q|))
                  (EXIT
                   (COND
                    ((SPADCALL (QCAR |pv|) (QCAR |qv|) (QREFELT % 53))
                     (COND
                      ((SPADCALL (|spadConstant| % 11)
                                 (SPADCALL |q| (QREFELT % 37)) (QREFELT % 131))
                       1)
                      (#4# -1)))
                    ((NULL (SPADCALL (QCAR |pv|) (QCAR |qv|) (QREFELT % 54)))
                     (COND
                      ((SPADCALL (SPADCALL |p| (QREFELT % 37))
                                 (|spadConstant| % 11) (QREFELT % 131))
                       1)
                      (#4# -1)))
                    ('T
                     (SEQ (LETT |pu| (QCDR |pv|)) (LETT |qu| (QCDR |qv|))
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ (LETT |dp| (SPADCALL |pu| (QREFELT % 40)))
                                     (LETT |dq| (SPADCALL |qu| (QREFELT % 40)))
                                     (EXIT
                                      (COND
                                       ((< |dp| |dq|)
                                        (PROGN
                                         (LETT #3#
                                               (SEQ
                                                (LETT |lcq|
                                                      (SPADCALL |qu|
                                                                (QREFELT %
                                                                         24)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (|spadConstant| % 11)
                                                    (SPADCALL |lcq|
                                                              (QREFELT % 37))
                                                    (QREFELT % 131))
                                                   1)
                                                  ('T -1)))))
                                         (GO #5=#:G299)))
                                       ((< |dq| |dp|)
                                        (PROGN
                                         (LETT #3#
                                               (SEQ
                                                (LETT |lcp|
                                                      (SPADCALL |pu|
                                                                (QREFELT %
                                                                         24)))
                                                (EXIT
                                                 (COND
                                                  ((SPADCALL
                                                    (SPADCALL |lcp|
                                                              (QREFELT % 37))
                                                    (|spadConstant| % 11)
                                                    (QREFELT % 131))
                                                   1)
                                                  ('T -1)))))
                                         (GO #5#)))
                                       ('T
                                        (SEQ
                                         (LETT |lcp|
                                               (SPADCALL |pu| (QREFELT % 24)))
                                         (LETT |lcq|
                                               (SPADCALL |qu| (QREFELT % 24)))
                                         (LETT |tr1|
                                               (|SMP;triage| |lcp| |lcq| %))
                                         (COND
                                          ((|eql_SI| |tr1| 0)
                                           (COND
                                            ((EQL |dp| 0)
                                             (EXIT
                                              (PROGN
                                               (LETT #3# |tr1|)
                                               (GO #5#))))))
                                          ('T
                                           (EXIT
                                            (PROGN
                                             (LETT #3# |tr1|)
                                             (GO #5#)))))
                                         (LETT |pu|
                                               (SPADCALL |pu| (QREFELT % 22)))
                                         (EXIT
                                          (LETT |qu|
                                                (SPADCALL |qu|
                                                          (QREFELT %
                                                                   22)))))))))
                                NIL (GO G190) G191 (EXIT NIL)))))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |SMP;smaller?;2%B;46| ((|p| (%)) (|q| (%)) (% (|Boolean|)))
        (|eql_SI| (|SMP;triage| |p| |q| %) 1)) 

(SDEFUN |SMP;unitNormal;%R;47|
        ((|p| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (SPROG
         ((|#G79|
           #1=(|Record| (|:| |unit| R) (|:| |canonical| R)
                        (|:| |associate| R)))
          (|#G80| #1#) (|u| (R)) (|c| (R)) (|a| (R)))
         (SEQ
          (COND
           ((QEQCAR |p| 0)
            (SEQ
             (PROGN
              (LETT |#G79| (SPADCALL (QCDR |p|) (QREFELT % 134)))
              (LETT |u| (QVELT |#G79| 0))
              (LETT |c| (QVELT |#G79| 1))
              (LETT |a| (QVELT |#G79| 2))
              |#G79|)
             (EXIT (VECTOR (CONS 0 |u|) (CONS 0 |c|) (CONS 0 |a|)))))
           ('T
            (SEQ
             (PROGN
              (LETT |#G80|
                    (SPADCALL (SPADCALL |p| (QREFELT % 37)) (QREFELT % 134)))
              (LETT |u| (QVELT |#G80| 0))
              (LETT |c| (QVELT |#G80| 1))
              (LETT |a| (QVELT |#G80| 2))
              |#G80|)
             (EXIT
              (VECTOR (CONS 0 |u|) (SPADCALL |a| |p| (QREFELT % 110))
                      (CONS 0 |a|))))))))) 

(SDEFUN |SMP;unitCanonical;2%;48| ((|p| (%)) (% (%)))
        (SPROG
         ((|#G85|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|u| (R)) (|c| (R)) (|a| (R)))
         (SEQ
          (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 136))))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G85|
                         (SPADCALL (SPADCALL |p| (QREFELT % 37))
                                   (QREFELT % 134)))
                   (LETT |u| (QVELT |#G85| 0))
                   (LETT |c| (QVELT |#G85| 1))
                   (LETT |a| (QVELT |#G85| 2))
                   |#G85|)
                  (EXIT (SPADCALL |a| |p| (QREFELT % 110))))))))) 

(SDEFUN |SMP;unit?;%B;49| ((|p| (%)) (% (|Boolean|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 138))) ('T NIL))) 

(SDEFUN |SMP;associates?;2%B;50| ((|p1| (%)) (|p2| (%)) (% (|Boolean|)))
        (COND
         ((QEQCAR |p1| 0)
          (COND
           ((QEQCAR |p2| 0) (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 140)))
           (#1='T NIL)))
         ((QEQCAR |p2| 1)
          (COND
           ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|)) (QREFELT % 54))
            (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|)) (QREFELT % 141)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |SMP;exquo;2%U;51| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|a| (|Union| D "failed")) (|mvar| (|VarSet|))
          (|up| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 143)))
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
                                  (SPADCALL |p2| (QREFELT % 114))
                                  (QREFELT % 144)))
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
                                  (QREFELT % 144)))
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

(SDEFUN |SMP;exquo;2%U;52| ((|p1| (%)) (|p2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|a| (|Union| D "failed")) (|mvar| (|VarSet|))
          (|up| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (COND
           ((QEQCAR |p1| 0)
            (COND
             ((QEQCAR |p2| 0)
              (EXIT
               (SEQ
                (LETT |a| (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 143)))
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
                                  (SPADCALL |p2| (QREFELT % 114))
                                  (QREFELT % 144)))
                  (EXIT
                   (COND ((QEQCAR |a| 1) (CONS 1 "failed"))
                         (#1#
                          (CONS 0
                                (CONS 1
                                      (CONS (QCAR (QCDR |p1|))
                                            (QCDR |a|)))))))))))
              (LETT |a|
                    (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                              (QREFELT % 144)))
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

(SDEFUN |SMP;map;M2%;53| ((|fn| (|Mapping| R R)) (|p| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (CONS 0 (SPADCALL (QCDR |p|) |fn|)))
                      (#1='T
                       (SEQ (LETT |mvar| (QCAR (QCDR |p|)))
                            (LETT |up|
                                  (SPADCALL
                                   (CONS #'|SMP;map;M2%;53!0| (VECTOR % |fn|))
                                   (QCDR (QCDR |p|)) (QREFELT % 58)))
                            (EXIT
                             (COND
                              ((SPADCALL |up| (QREFELT % 23))
                               (SPADCALL |up| (QREFELT % 24)))
                              (#1# (CONS 1 (CONS |mvar| |up|))))))))))) 

(SDEFUN |SMP;map;M2%;53!0| ((|x1| NIL) ($$ NIL))
        (PROG (|fn| %)
          (LETT |fn| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |fn| |x1| (QREFELT % 147)))))) 

(SDEFUN |SMP;/;%R%;54| ((|p| (%)) (|r| (R)) (% (%)))
        (SPADCALL (CONS 0 (SPADCALL |r| (QREFELT % 148))) |p| (QREFELT % 79))) 

(SDEFUN |SMP;content;%R;55| ((|p| (%)) (% (R)))
        (SPROG ((|c| (R)) (|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (QCDR |p|))
                      ('T
                       (SEQ (LETT |c| (QCDR (|spadConstant| % 12)))
                            (LETT |up| (QCDR (QCDR |p|)))
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (NULL
                                     (OR (SPADCALL |up| (QREFELT % 150))
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
                                                   (QREFELT % 151))
                                                  (QREFELT % 152)))
                                  (EXIT
                                   (LETT |up| (SPADCALL |up| (QREFELT % 22)))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT |c|))))))) 

(SDEFUN |SMP;content;%VarSet%;56| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 153))))) 

(SDEFUN |SMP;gcd;3%;57| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 152))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 153))
                                   (QREFELT % 155)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 153))
                              |p2| (QREFELT % 155)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 156)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;58|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|conta| (%)) (|mona| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|monb| (|SparseUnivariatePolynomial| %)) (#2=#:G393 NIL)
          (|mong| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 157)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 157)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 155))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 161)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 162)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 161)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 162)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;59| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (QREFELT % 26))
                (QREFELT % 165))))) 

(SDEFUN |SMP;gcd;3%;60| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPADCALL |p1| |p2| (QREFELT % 166))) 

(SDEFUN |SMP;gcd;L%;61| ((|lp| (|List| %)) (% (%)))
        (SPADCALL |lp| (QREFELT % 165))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;62|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPADCALL |a| |b| (QREFELT % 169))) 

(SDEFUN |SMP;content;%VarSet%;63| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 153))))) 

(SDEFUN |SMP;gcd;3%;64| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 152))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 153))
                                   (QREFELT % 155)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 153))
                              |p2| (QREFELT % 155)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 156)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;65|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|conta| (%)) (|mona| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|monb| (|SparseUnivariatePolynomial| %)) (#2=#:G425 NIL)
          (|mong| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 157)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 157)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 155))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 161)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 162)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 161)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 162)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;content;%VarSet%;66| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56))
                         (QREFELT % 153))))) 

(SDEFUN |SMP;gcd;3%;67| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|up| (D)))
               (SEQ
                (COND
                 ((QEQCAR |p1| 0)
                  (COND
                   ((QEQCAR |p2| 0)
                    (CONS 0
                          (SPADCALL (QCDR |p1|) (QCDR |p2|) (QREFELT % 152))))
                   ((SPADCALL |p1| (QREFELT % 18)) |p2|)
                   (#1='T
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))))
                 ((QEQCAR |p2| 0)
                  (COND ((SPADCALL |p2| (QREFELT % 18)) |p1|)
                        (#1#
                         (SPADCALL |p2|
                                   (SPADCALL (QCDR (QCDR |p1|))
                                             (QREFELT % 153))
                                   (QREFELT % 155)))))
                 (#1#
                  (COND
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 53))
                    (SPADCALL |p1|
                              (SPADCALL (QCDR (QCDR |p2|)) (QREFELT % 153))
                              (QREFELT % 155)))
                   ((SPADCALL (QCAR (QCDR |p1|)) (QCAR (QCDR |p2|))
                              (QREFELT % 68))
                    (SPADCALL (SPADCALL (QCDR (QCDR |p1|)) (QREFELT % 153))
                              |p2| (QREFELT % 155)))
                   (#1#
                    (SEQ (LETT |mvar| (QCAR (QCDR |p1|)))
                         (LETT |up|
                               (SPADCALL (QCDR (QCDR |p1|)) (QCDR (QCDR |p2|))
                                         (QREFELT % 156)))
                         (EXIT
                          (COND
                           ((SPADCALL |up| (QREFELT % 23))
                            (SPADCALL |up| (QREFELT % 24)))
                           (#1# (CONS 1 (CONS |mvar| |up|))))))))))))) 

(SDEFUN |SMP;gcdPolynomial;3Sup;68|
        ((|a| #1=(|SparseUnivariatePolynomial| %)) (|b| #1#)
         (% (|SparseUnivariatePolynomial| %)))
        (SPROG
         ((|conta| (%)) (|mona| (|SparseUnivariatePolynomial| %)) (|contb| (%))
          (|monb| (|SparseUnivariatePolynomial| %)) (#2=#:G453 NIL)
          (|mong| (|SparseUnivariatePolynomial| %)))
         (SEQ
          (COND
           ((SPADCALL |a| (QREFELT % 66))
            (COND ((SPADCALL |a| (QREFELT % 67)) |b|)
                  (#3='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |a| (QREFELT % 63))
                              (SPADCALL |b| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           ((SPADCALL |b| (QREFELT % 66))
            (COND ((SPADCALL |b| (QREFELT % 67)) |b|)
                  (#3#
                   (SPADCALL
                    (SPADCALL (SPADCALL |b| (QREFELT % 63))
                              (SPADCALL |a| (QREFELT % 157)) (QREFELT % 155))
                    (QREFELT % 158)))))
           (#3#
            (SEQ (LETT |conta| (SPADCALL |a| (QREFELT % 157)))
                 (LETT |mona|
                       (SPADCALL |conta| (SPADCALL |a| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |mona| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |a|
                         (PROG2
                             (LETT #2# (SPADCALL |a| |mona| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4="failed")
                                           #2#)))))
                 (LETT |contb| (SPADCALL |b| (QREFELT % 157)))
                 (LETT |monb|
                       (SPADCALL |contb| (SPADCALL |b| (QREFELT % 159))
                                 (QREFELT % 29)))
                 (COND
                  ((SPADCALL |monb| (|spadConstant| % 19) (QREFELT % 160))
                   (LETT |b|
                         (PROG2
                             (LETT #2# (SPADCALL |b| |monb| (QREFELT % 161)))
                             (QCDR #2#)
                           (|check_union2| (QEQCAR #2# 0)
                                           (|SparseUnivariatePolynomial| %)
                                           (|Union|
                                            (|SparseUnivariatePolynomial| %)
                                            #4#)
                                           #2#)))))
                 (LETT |mong|
                       (SPADCALL (SPADCALL |conta| |contb| (QREFELT % 155))
                                 (MIN (SPADCALL |mona| (QREFELT % 61))
                                      (SPADCALL |monb| (QREFELT % 61)))
                                 (QREFELT % 29)))
                 (EXIT
                  (COND
                   ((>= (SPADCALL |a| (QREFELT % 61))
                        (SPADCALL |b| (QREFELT % 61)))
                    (COND
                     ((NULL (QEQCAR (SPADCALL |a| |b| (QREFELT % 161)) 1))
                      (SPADCALL |mong| |b| (QREFELT % 162)))
                     (#5='T |mong|)))
                   ((NULL (QEQCAR (SPADCALL |b| |a| (QREFELT % 161)) 1))
                    (SPADCALL |mong| |a| (QREFELT % 162)))
                   (#5# |mong|))))))))) 

(SDEFUN |SMP;coerce;%Of;69| ((|p| (%)) (% (|OutputForm|)))
        (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 171)))
              ('T
               (SPADCALL (QCDR (QCDR |p|))
                         (SPADCALL (QCAR (QCDR |p|)) (QREFELT % 172))
                         (QREFELT % 173))))) 

(SDEFUN |SMP;coefficients;%L;70| ((|p| (%)) (% (|List| R)))
        (SPROG
         ((|p1| NIL) (#1=#:G473 NIL) (#2=#:G471 #3=(|List| R)) (#4=#:G469 #3#)
          (#5=#:G470 NIL))
         (SEQ
          (COND ((QEQCAR |p| 0) (SPADCALL (QCDR |p|) (QREFELT % 176)))
                (#6='T
                 (PROGN
                  (LETT #5# NIL)
                  (SEQ (LETT |p1| NIL)
                       (LETT #1# (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 26)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #2# (SPADCALL |p1| (QREFELT % 177)))
                          (COND
                           (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 178))))
                           ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#5# #4#) (#6# NIL)))))))) 

(SDEFUN |SMP;retract;%R;71| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T (|error| "cannot retract nonconstant polynomial")))) 

(SDEFUN |SMP;retractIfCan;%U;72| ((|p| (%)) (% (|Union| R "failed")))
        (COND ((QEQCAR |p| 0) (CONS 0 (QCDR |p|))) ('T (CONS 1 "failed")))) 

(SDEFUN |SMP;myinsert|
        ((|v| (|VarSet|)) (|l| (|List| |VarSet|)) (% (|List| |VarSet|)))
        (SEQ
         (COND ((NULL |l|) (LIST |v|))
               ((SPADCALL (|SPADfirst| |l|) |v| (QREFELT % 54)) |l|)
               ((SPADCALL |v| (|SPADfirst| |l|) (QREFELT % 53)) (CONS |v| |l|))
               ('T
                (SEQ
                 (SPADCALL |l| (|SMP;myinsert| |v| (CDR |l|) %)
                           (QREFELT % 183))
                 (EXIT |l|)))))) 

(SDEFUN |SMP;collect_variables|
        ((|p| (%)) (|acc| (|List| |VarSet|)) (% (|List| |VarSet|)))
        (SPROG ((|q| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) |acc|)
                      ('T
                       (SEQ
                        (LETT |acc| (|SMP;myinsert| (QCAR (QCDR |p|)) |acc| %))
                        (LETT |q| (QCDR (QCDR |p|)))
                        (SEQ G190
                             (COND
                              ((NULL (NULL (SPADCALL |q| (QREFELT % 150))))
                               (GO G191)))
                             (SEQ
                              (LETT |acc|
                                    (|SMP;collect_variables|
                                     (SPADCALL |q| (QREFELT % 24)) |acc| %))
                              (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 22)))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT |acc|))))))) 

(SDEFUN |SMP;variables;%L;75| ((|p| (%)) (% (|List| |VarSet|)))
        (NREVERSE (|SMP;collect_variables| |p| NIL %))) 

(SDEFUN |SMP;variables;2%L;76| ((|p| (%)) (|q| (%)) (% (|List| |VarSet|)))
        (SPROG ((|acc| (|List| |VarSet|)))
               (SEQ (LETT |acc| (|SMP;collect_variables| |p| NIL %))
                    (LETT |acc| (|SMP;collect_variables| |q| |acc| %))
                    (EXIT (NREVERSE |acc|))))) 

(SDEFUN |SMP;mainVariable;%U;77| ((|p| (%)) (% (|Union| |VarSet| "failed")))
        (COND ((QEQCAR |p| 0) (CONS 1 "failed"))
              ('T (CONS 0 (QCAR (QCDR |p|)))))) 

(SDEFUN |SMP;eval;%VarSet2%;78|
        ((|p| (%)) (|mvar| (|VarSet|)) (|pval| (%)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) |pval| (QREFELT % 188))) 

(SDEFUN |SMP;eval;%VarSetR%;79|
        ((|p| (%)) (|mvar| (|VarSet|)) (|val| (R)) (% (%)))
        (SPADCALL (SPADCALL |p| |mvar| (QREFELT % 56)) (CONS 0 |val|)
                  (QREFELT % 188))) 

(SDEFUN |SMP;evalSortedVarlist|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG ((|mvar| (|VarSet|)) (|pval| (%)) (|pts| (D)))
               (SEQ
                (COND
                 ((OR (QEQCAR |p| 0)
                      (OR (NULL |Lvar|) (SPADCALL |Lpval| (QREFELT % 191))))
                  |p|)
                 ('T
                  (SEQ (LETT |mvar| (|SPADfirst| |Lvar|))
                       (EXIT
                        (COND
                         ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68))
                          (|SMP;evalSortedVarlist| |p| (CDR |Lvar|)
                           (SPADCALL |Lpval| '|rest| (QREFELT % 193)) %))
                         (#1='T
                          (SEQ
                           (LETT |pval|
                                 (SPADCALL |Lpval| '|first| (QREFELT % 195)))
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
                                          (QREFELT % 188)))
                               (#1# (SPADCALL |pts| |pval| (QREFELT % 188)))))
                             (#1#
                              (SPADCALL |pts| (QCAR (QCDR |p|))
                                        (QREFELT % 69))))))))))))))) 

(SDEFUN |SMP;evalSortedVarlist!0| ((|x1| NIL) ($$ NIL))
        (PROG (|Lvar| |Lpval| %)
          (LETT |Lvar| (QREFELT $$ 2))
          (LETT |Lpval| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|SMP;evalSortedVarlist| |x1| |Lvar| |Lpval| %))))) 

(SDEFUN |SMP;eval;%LL%;81|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lpval| (|List| %)) (% (%)))
        (SPROG
         ((|nlvar| (|List| |VarSet|)) (#1=#:G525 NIL) (|mvar| NIL)
          (#2=#:G526 NIL) (|nlpval| (|List| %)))
         (SEQ
          (COND
           ((OR (NULL (CDR |Lvar|))
                (SPADCALL (ELT % 68) |Lvar| (QREFELT % 197)))
            (|SMP;evalSortedVarlist| |p| |Lvar| |Lpval| %))
           ('T
            (SEQ (LETT |nlvar| (SPADCALL (ELT % 68) |Lvar| (QREFELT % 198)))
                 (LETT |nlpval|
                       (COND
                        ((SPADCALL |Lvar| |nlvar| (QREFELT % 199)) |Lpval|)
                        ('T
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |mvar| NIL) (LETT #2# |nlvar|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |mvar| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS
                                        (SPADCALL |Lpval|
                                                  (SPADCALL |mvar| |Lvar|
                                                            (QREFELT % 200))
                                                  (QREFELT % 201))
                                        #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#)))))))
                 (EXIT (|SMP;evalSortedVarlist| |p| |nlvar| |nlpval| %)))))))) 

(SDEFUN |SMP;eval;%LL%;82|
        ((|p| (%)) (|Lvar| (|List| |VarSet|)) (|Lval| (|List| R)) (% (%)))
        (SPROG ((#1=#:G530 NIL) (|val| NIL) (#2=#:G531 NIL))
               (SEQ
                (SPADCALL |p| |Lvar|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |val| NIL) (LETT #2# |Lval|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |val| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (LETT #1# (CONS (CONS 0 |val|) #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 202))))) 

(SDEFUN |SMP;degree;%VarSetNni;83|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (COND ((QEQCAR |p| 0) 0)
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40)))
              ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 68)) 0)
              ('T
               (MAX
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24)) |mvar|
                          (QREFELT % 204))
                (SPADCALL (|SMP;red| |p| %) |mvar| (QREFELT % 204)))))) 

(SDEFUN |SMP;degree;%LL;84|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G541 NIL) (|mvar| NIL) (#2=#:G542 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #2# |Lvar|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |mvar| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 204))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SMP;degree;%Ie;85| ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (COND ((QEQCAR |p| 0) (|spadConstant| % 207))
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 76))
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                          (QCAR (QCDR |p|)) (QREFELT % 208))
                (QREFELT % 209))))) 

(SDEFUN |SMP;minimumDegree;%Ie;86|
        ((|p| (%)) (% (|IndexedExponents| |VarSet|)))
        (SPROG ((|md| (|NonNegativeInteger|)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 207))
                      ('T
                       (SEQ
                        (LETT |md|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 210)))
                        (EXIT
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (QCDR (QCDR |p|)) |md| (QREFELT % 91))
                           (QREFELT % 211))
                          (SPADCALL |md| (QCAR (QCDR |p|)) (QREFELT % 208))
                          (QREFELT % 209))))))))) 

(SDEFUN |SMP;minimumDegree;%VarSetNni;87|
        ((|p| (%)) (|mvar| (|VarSet|)) (% (|NonNegativeInteger|)))
        (SPROG ((|md| (|NonNegativeInteger|)) (|p1| (%)))
               (SEQ
                (COND ((QEQCAR |p| 0) 0)
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 210)))
                      (#1='T
                       (SEQ
                        (LETT |md|
                              (SPADCALL
                               (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                               |mvar| (QREFELT % 212)))
                        (LETT |p1| (|SMP;red| |p| %))
                        (EXIT
                         (COND ((SPADCALL |p1| (QREFELT % 18)) |md|)
                               (#1#
                                (MIN |md|
                                     (SPADCALL |p1| |mvar|
                                               (QREFELT % 212)))))))))))) 

(SDEFUN |SMP;minimumDegree;%LL;88|
        ((|p| (%)) (|Lvar| (|List| |VarSet|))
         (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G561 NIL) (|mvar| NIL) (#2=#:G562 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |mvar| NIL) (LETT #2# |Lvar|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |mvar| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |p| |mvar| (QREFELT % 212))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;89| ((|p| (%)) (|mvar| (|VarSet|)) (% (%)))
        (SPROG ((|up| (D)))
               (SEQ
                (COND ((QEQCAR |p| 0) (|spadConstant| % 12))
                      ((SPADCALL |mvar| (QCAR (QCDR |p|)) (QREFELT % 54))
                       (SEQ
                        (LETT |up|
                              (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 214)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1='T (CONS 1 (CONS |mvar| |up|)))))))
                      (#1#
                       (SEQ
                        (LETT |up|
                              (SPADCALL
                               (CONS #'|SMP;differentiate;%VarSet%;89!0|
                                     (VECTOR % |mvar|))
                               (QCDR (QCDR |p|)) (QREFELT % 58)))
                        (EXIT
                         (COND
                          ((SPADCALL |up| (QREFELT % 23))
                           (SPADCALL |up| (QREFELT % 24)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |up|))))))))))) 

(SDEFUN |SMP;differentiate;%VarSet%;89!0| ((|x1| NIL) ($$ NIL))
        (PROG (|mvar| %)
          (LETT |mvar| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x1| |mvar| (QREFELT % 215)))))) 

(SDEFUN |SMP;leadingCoefficient;%R;90| ((|p| (%)) (% (R)))
        (COND ((QEQCAR |p| 0) (QCDR |p|))
              ('T
               (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                         (QREFELT % 37))))) 

(SDEFUN |SMP;leadingMonomial;2%;91| ((|p| (%)) (% (%)))
        (COND ((QEQCAR |p| 0) |p|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 24))
                          (QREFELT % 216))
                (QCAR (QCDR |p|)) (SPADCALL (QCDR (QCDR |p|)) (QREFELT % 40))
                (QREFELT % 64))))) 

(SDEFUN |SMP;reductum;2%;92| ((|p| (%)) (% (%)))
        (SPROG ((|rlc| (%)) (|ptr| (D)))
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
                           (SPADCALL |ptr| (QREFELT % 217)))
                          (#1# (CONS 1 (CONS (QCAR (QCDR |p|)) |ptr|))))))))))) 

(SDEFUN |SMP;monomials1|
        ((|p| (|VPoly|)) (|vars| #1=(|List| |VarSet|))
         (|degs| #2=(|List| (|NonNegativeInteger|))) (|res| (|List| %))
         (% (|List| %)))
        (SPROG
         ((|tl|
           (|List|
            #3=(|Record| (|:| |k| #4=(|NonNegativeInteger|)) (|:| |c| %))))
          (|v1| (|VarSet|)) (|t| NIL) (#5=#:G598 NIL) (|p1| (%)) (|k1| #4#)
          (|deg| NIL) (#6=#:G600 NIL) (|var| NIL) (#7=#:G599 NIL) (|mon1| #3#)
          (|mon| (%)) (|vars1| #1#) (|degs1| #2#))
         (SEQ (LETT |tl| (QCDR |p|)) (LETT |v1| (QCAR |p|))
              (SEQ (LETT |t| NIL) (LETT #5# |tl|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |t| (CAR #5#)) NIL))
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
                                 (LETT |var| NIL) (LETT #7# |vars|) G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |var| (CAR #7#)) NIL)
                                       (ATOM #6#)
                                       (PROGN (LETT |deg| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |mon1| (CONS |deg| |mon|))
                                      (EXIT
                                       (LETT |mon|
                                             (CONS 1
                                                   (CONS |var|
                                                         (LIST |mon1|))))))
                                 (LETT #7#
                                       (PROG1 (CDR #7#) (LETT #6# (CDR #6#))))
                                 (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL |mon| |res| (QREFELT % 218))))))
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
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |SMP;monomials;%L;94| ((|p| (%)) (% (|List| %)))
        (COND ((SPADCALL |p| (|spadConstant| % 12) (QREFELT % 32)) NIL)
              ((QEQCAR |p| 0) (LIST |p|))
              ('T
               (SPADCALL (|SMP;monomials1| (QCDR |p|) NIL NIL NIL %)
                         (QREFELT % 219))))) 

(DECLAIM (NOTINLINE |SparseMultivariatePolynomial;|)) 

(DEFUN |SparseMultivariatePolynomial;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G636 NIL) (#2=#:G635 NIL)
    (#3=#:G634 NIL) (#4=#:G633 NIL) (#5=#:G632 NIL) (#6=#:G631 NIL)
    (#7=#:G630 NIL) (#8=#:G628 NIL) (#9=#:G629 NIL) (#10=#:G627 NIL)
    (#11=#:G626 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|SparseMultivariatePolynomial| DV$1 DV$2))
    (LETT % (GETREFV 250))
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
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|IndexedExponents| |#2|)
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
                                               (|HasCategory| |#1| '(|Ring|))))
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #10# #11#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #11#)))))
    (|haddProp| |$ConstructorCache| '|SparseMultivariatePolynomial|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
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
         #2# (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
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
    (QSETREFV % 8 (|SparseUnivariatePolynomial| %))
    (QSETREFV % 9 (|Record| (|:| |v| |#2|) (|:| |ts| (QREFELT % 8))))
    (QSETREFV % 10 (|Union| |#1| (QREFELT % 9)))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 14
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |SMP;1;%;2|) % 14)))))
    (QSETREFV % 15
              (COND
               ((|HasCategory| |#1| '(|SemiRing|))
                (QCDR (|spadConstant| % 14)))
               ('T (QCDR (|spadConstant| % 12)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 21 (CONS (|dispatchFunction| |SMP;one?;%B;4|) %))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 30 (CONS (|dispatchFunction| |SMP;coerce;VarSet%;7|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 95 (CONS (|dispatchFunction| |SMP;coerce;I%;29|) %))
       (QSETREFV % 97
                 (CONS (|dispatchFunction| |SMP;characteristic;Nni;30|) %)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (QSETREFV % 101 (CONS (|dispatchFunction| |SMP;recip;%U;32|) %))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 104 (CONS (|dispatchFunction| |SMP;-;2%;33|) %))
       (QSETREFV % 107 (CONS (|dispatchFunction| |SMP;*;I2%;34|) %)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV % 117 (CONS (|dispatchFunction| |SMP;-;3%;38|) %))))
    (COND
     ((|HasCategory| |#1| '(|Hashable|))
      (COND
       ((|HasCategory| |#2| '(|Hashable|))
        (QSETREFV % 130
                  (CONS (|dispatchFunction| |SMP;hashUpdate!;Hs%Hs;44|) %))))))
    (COND
     ((|testBitVector| |pv$| 9)
      (PROGN
       (QSETREFV % 132 (CONS (|dispatchFunction| |SMP;smaller?;2%B;46|) %)))))
    (COND
     ((|testBitVector| |pv$| 25)
      (PROGN
       (QSETREFV % 135 (CONS (|dispatchFunction| |SMP;unitNormal;%R;47|) %))
       (QSETREFV % 137 (CONS (|dispatchFunction| |SMP;unitCanonical;2%;48|) %))
       (QSETREFV % 139 (CONS (|dispatchFunction| |SMP;unit?;%B;49|) %))
       (QSETREFV % 142 (CONS (|dispatchFunction| |SMP;associates?;2%B;50|) %))
       (COND
        ((|HasCategory| |#1| '(|Approximate|))
         (QSETREFV % 145 (CONS (|dispatchFunction| |SMP;exquo;2%U;51|) %)))
        ('T
         (QSETREFV % 145 (CONS (|dispatchFunction| |SMP;exquo;2%U;52|) %)))))))
    (COND
     ((|testBitVector| |pv$| 22)
      (QSETREFV % 149 (CONS (|dispatchFunction| |SMP;/;%R%;54|) %))))
    (COND
     ((|testBitVector| |pv$| 15)
      (QSETREFV % 151 (CONS (|dispatchFunction| |SMP;content;%R;55|) %))))
    (COND
     ((|HasCategory| |#1| '(|EuclideanDomain|))
      (COND
       ((|HasCategory| |#1| '(|CharacteristicZero|))
        (COND
         ((|HasCategory| |#1| '(|FloatingPointSystem|))
          (COND
           ((|testBitVector| |pv$| 15)
            (PROGN
             (QSETREFV % 154
                       (CONS (|dispatchFunction| |SMP;content;%VarSet%;56|) %))
             (QSETREFV % 155 (CONS (|dispatchFunction| |SMP;gcd;3%;57|) %))
             (COND
              ((|HasCategory| |#1| '(|FloatingPointSystem|))
               (QSETREFV % 163
                         (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;58|)
                               %))))))))
         ('T
          (PROGN
           (QSETREFV % 154
                     (CONS (|dispatchFunction| |SMP;content;%VarSet%;59|) %))
           (QSETREFV % 155 (CONS (|dispatchFunction| |SMP;gcd;3%;60|) %))
           (QSETREFV % 168 (CONS (|dispatchFunction| |SMP;gcd;L%;61|) %))
           (QSETREFV % 163
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;62|)
                           %))))))
       ((|testBitVector| |pv$| 15)
        (PROGN
         (QSETREFV % 154
                   (CONS (|dispatchFunction| |SMP;content;%VarSet%;63|) %))
         (QSETREFV % 155 (CONS (|dispatchFunction| |SMP;gcd;3%;64|) %))
         (COND
          ((|HasCategory| |#1| '(|FloatingPointSystem|))
           (QSETREFV % 163
                     (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;65|)
                           %))))))))
     ((|testBitVector| |pv$| 15)
      (PROGN
       (QSETREFV % 154 (CONS (|dispatchFunction| |SMP;content;%VarSet%;66|) %))
       (QSETREFV % 155 (CONS (|dispatchFunction| |SMP;gcd;3%;67|) %))
       (COND
        ((|HasCategory| |#1| '(|FloatingPointSystem|))
         (QSETREFV % 163
                   (CONS (|dispatchFunction| |SMP;gcdPolynomial;3Sup;68|)
                         %)))))))
    (COND
     ((|testBitVector| |pv$| 5)
      (QSETREFV % 215
                (CONS (|dispatchFunction| |SMP;differentiate;%VarSet%;89|)
                      %))))
    %))) 

(DEFUN |SparseMultivariatePolynomial| (&REST #1=#:G637)
  (SPROG NIL
         (PROG (#2=#:G638)
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

(MAKEPROP '|SparseMultivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'D '|VPoly|
              '|Rep| (0 . |0|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SMP;0;%;1|) %))
              (4 . |1|) (8 . |1|) '|m_one| (|Boolean|) (12 . |zero?|)
              |SMP;zero?;%B;3| (17 . |1|) (21 . =) (27 . |one?|)
              (32 . |reductum|) (37 . |ground?|) (42 . |leadingCoefficient|)
              (|List| $$) (47 . |coefficients|) (|NonNegativeInteger|)
              |SMP;numberOfMonomials;%Nni;6| (52 . |monomial|) (58 . |coerce|)
              (63 . |monomial?|) |SMP;=;2%B;39| |SMP;monomial?;%B;9|
              |SMP;ground?;%B;25| (|Mapping| 16 $$) (68 . |any?|)
              |SMP;leadingCoefficient;%R;90| (|SparseUnivariatePolynomial| 6)
              (74 . |coerce|) (79 . |degree|) (84 . |monomial|) (90 . +)
              (|Mapping| 6 $$)
              (|UnivariatePolynomialCategoryFunctions2| $$ 8 6 38) (96 . |map|)
              |SMP;univariate;%Sup;12| (102 . |ground?|)
              (107 . |leadingCoefficient|) (112 . |degree|) (117 . |reductum|)
              |SMP;multivariate;SupVarSet%;13| |SMP;+;3%;37| (122 . <)
              (128 . =) (|SparseUnivariatePolynomial| %)
              |SMP;univariate;%VarSetSup;15| (|Mapping| $$ $$) (134 . |map|)
              (140 . +) (|SparseUnivariatePolynomial| $$) (146 . |degree|)
              (151 . |coefficient|) (157 . |leadingCoefficient|)
              |SMP;monomial;%VarSetNni%;26| (162 . |reductum|)
              (167 . |ground?|) (172 . |zero?|) (177 . >)
              |SMP;multivariate;SupVarSet%;17| (|IndexedExponents| 7)
              |SMP;monomial;RIe%;27| (|Record| (|:| |k| 70) (|:| |c| 6))
              (|List| 72) |SMP;construct;L%;18| |SMP;constructOrdered;L%;19|
              |SMP;degree;%Ie;85| |SMP;leadingSupport;%Ie;20|
              |SMP;leadingTerm;%R;21| |SMP;*;3%;40| |SMP;reductum;2%;92|
              (|Mapping| 6 70) |SMP;linearExtend;M%R;22|
              |SMP;listOfTerms;%L;23| (|List| 70) |SMP;support;%L;24|
              (183 . |shiftLeft|) (189 . |zero?|) (194 . |reductum|)
              (199 . |leadingCoefficient|) (204 . |leadingSupport|)
              (209 . |coefficient|) |SMP;coefficient;%IeR;28| (|Integer|)
              (215 . |coerce|) (220 . |coerce|) (225 . |characteristic|)
              (229 . |characteristic|) |SMP;coerce;R%;31| (|Union| % '"failed")
              (233 . |recip|) (238 . |recip|) (243 . -) (248 . -) (253 . -)
              (258 . *) (264 . *) (270 . *) (276 . *) (282 . *) |SMP;*;R2%;35|
              (288 . *) |SMP;*;%R%;36| (294 . +) (300 . |coerce|) (305 . -)
              (311 . -) (317 . -) (323 . =) (329 . *) (335 . ^) (341 . ^)
              (347 . ^) |SMP;^;%Nni%;42| (|PositiveInteger|) |SMP;^;%Pi%;43|
              (|HashState|) (353 . |hashUpdate!|) (359 . |hashUpdate!|)
              (365 . |hashUpdate!|) (371 . |hashUpdate!|) (377 . |smaller?|)
              (383 . |smaller?|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (389 . |unitNormal|) (394 . |unitNormal|) (399 . |unitCanonical|)
              (404 . |unitCanonical|) (409 . |unit?|) (414 . |unit?|)
              (419 . |associates?|) (425 . |associates?|) (431 . |associates?|)
              (437 . |exquo|) (443 . |exquo|) (449 . |exquo|) (|Mapping| 6 6)
              |SMP;map;M2%;53| (455 . |inv|) (460 . /) (466 . |zero?|)
              (471 . |content|) (476 . |gcd|) (482 . |content|)
              (487 . |content|) (493 . |gcd|) (499 . |gcd|) (505 . |content|)
              (510 . |coerce|) (515 . |minimumDegree|) (520 . ~=)
              (526 . |exquo|) (532 . *) (538 . |gcdPolynomial|)
              (|PolynomialGcdPackage| 70 7 6 $$) (544 . |gcd|) (549 . |gcd|)
              (|List| %) (555 . |gcd|) (560 . |gcd|) (|OutputForm|)
              (566 . |coerce|) (571 . |coerce|) (576 . |outputForm|)
              |SMP;coerce;%Of;69| (|List| 6) (582 . |list|)
              |SMP;coefficients;%L;70| (587 . |append|) |SMP;retract;%R;71|
              (|Union| 6 '"failed") |SMP;retractIfCan;%U;72| (|List| 7)
              (593 . |setrest!|) |SMP;variables;%L;75| |SMP;variables;2%L;76|
              (|Union| 7 '"failed") |SMP;mainVariable;%U;77| (599 . |elt|)
              |SMP;eval;%VarSet2%;78| |SMP;eval;%VarSetR%;79| (605 . |empty?|)
              '"rest" (610 . |elt|) '"first" (616 . |elt|) (|Mapping| 16 7 7)
              (622 . |sorted?|) (628 . |sort|) (634 . =) (640 . |position|)
              (646 . |elt|) |SMP;eval;%LL%;81| |SMP;eval;%LL%;82|
              |SMP;degree;%VarSetNni;83| (|List| 27) |SMP;degree;%LL;84|
              (652 . |0|) (656 . |monomial|) (662 . +) (668 . |minimumDegree|)
              |SMP;minimumDegree;%Ie;86| |SMP;minimumDegree;%VarSetNni;87|
              |SMP;minimumDegree;%LL;88| (673 . |differentiate|)
              (678 . |differentiate|) |SMP;leadingMonomial;2%;91|
              (684 . |ground|) (689 . |cons|) (695 . |reverse!|)
              |SMP;monomials;%L;94| (|String|) (|Mapping| 70 70)
              (|Union| 167 '#1="failed") (|Union| 231 '#2="failed")
              (|Matrix| %) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 93)
              (|SingleInteger|)
              (|Record| (|:| |mat| 232) (|:| |vec| (|Vector| 93))) (|Vector| %)
              (|Matrix| 93) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 93 %) (|Fraction| 93) (|Factored| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Factored| 55) (|Union| 240 '#2#) (|List| 55)
              (|Union| 235 '#3="failed") (|Union| 93 '#3#) (|Matrix| 6)
              (|Record| (|:| |mat| 243) (|:| |vec| (|Vector| 6)))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |var| 7) (|:| |exponent| 27)) (|Union| 246 '#1#)
              (|List| 249) (|Equation| %))
           '#(~= 700 |zero?| 706 |variables| 711 |univariate| 722 |unitNormal|
              733 |unitCanonical| 738 |unit?| 743 |totalDegreeSorted| 748
              |totalDegree| 754 |support| 765 |subtractIfCan| 770
              |squareFreePolynomial| 776 |squareFreePart| 781 |squareFree| 786
              |solveLinearPolynomialEquation| 791 |smaller?| 797 |sample| 803
              |rightRecip| 807 |rightPower| 812 |retractIfCan| 824 |retract|
              844 |resultant| 864 |reductum| 871 |reducedSystem| 876 |recip|
              898 |primitivePart| 903 |primitiveMonomials| 914 |prime?| 919
              |pomopo!| 924 |plenaryPower| 932 |patternMatch| 938 |opposite?|
              952 |one?| 958 |numberOfMonomials| 963 |multivariate| 968
              |monomials| 980 |monomial?| 985 |monomial| 990 |monicDivide| 1010
              |minimumDegree| 1017 |mapExponents| 1034 |map| 1040
              |mainVariable| 1046 |listOfTerms| 1051 |linearExtend| 1056
              |leftRecip| 1062 |leftPower| 1067 |leadingTerm| 1079
              |leadingSupport| 1084 |leadingMonomial| 1089 |leadingCoefficient|
              1094 |lcmCoef| 1099 |lcm| 1105 |latex| 1116 |isTimes| 1121
              |isPlus| 1126 |isExpt| 1131 |hashUpdate!| 1136 |hash| 1142
              |ground?| 1147 |ground| 1152 |gcdPolynomial| 1157 |gcd| 1163
              |fmecg| 1174 |factorSquareFreePolynomial| 1182 |factorPolynomial|
              1187 |factor| 1192 |exquo| 1197 |eval| 1209 |discriminant| 1263
              |differentiate| 1269 |degree| 1295 |convert| 1312 |content| 1327
              |constructOrdered| 1338 |construct| 1343 |conditionP| 1348
              |commutator| 1353 |coerce| 1359 |coefficients| 1389 |coefficient|
              1394 |charthRoot| 1414 |characteristic| 1419 |binomThmExpt| 1423
              |associator| 1430 |associates?| 1437 |antiCommutator| 1443
              |annihilate?| 1449 ^ 1455 D 1467 = 1493 |1| 1499 |0| 1503 / 1507
              - 1513 + 1524 * 1530)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 11 0 11 0 17 0 27 15 26 4 18 26 16 1 29 29
                                  26 13 16 1 0 26 4 5 1 0 0 40 4 4 1 0 0 0 29
                                  40 1 1 0 0 0 0 0 12 13 13 47 13 46 9 0 0 33
                                  31 43 10 0 0 0 13 13 20 28 7 6 0 0 13 13 19
                                  37 35 14 28 8 7 6 4 3 2 0 0 0 0 0 0))
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
                |InnerEvalable&| NIL)
             (CONS
              '#((|PolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|PolynomialFactorizationExplicit|)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|UniqueFactorizationDomain|)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|GcdDomain|) (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|IntegralDomain|) (|LeftOreRing|) (|CommutativeRing|)
                 (|PartialDifferentialRing| 7) (|EntireRing|) (|Algebra| $$)
                 (|Algebra| 6) (|Algebra| 235) (|Ring|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|NonAssociativeAlgebra| 6) (|NonAssociativeAlgebra| 235)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7)) (|Module| $$)
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 235)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|LinearlyExplicitOver| 93)
                 (|LinearlyExplicitOver| 6) (|NonAssociativeRing|)
                 (|BiModule| 235 235) (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeRng|) (|RightModule| 93) (|RightModule| 235)
                 (|LeftModule| 235) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|PatternMatchable| 93) (|PatternMatchable| (|Float|))
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|RetractableTo| 7) (|Evalable| $$) (|Hashable|)
                 (|CommutativeStar|) (|RetractableTo| 93) (|RetractableTo| 235)
                 (|SetCategory|) (|RetractableTo| 6) (|CoercibleFrom| 7)
                 (|InnerEvalable| $$ $$) (|ConvertibleTo| 226)
                 (|ConvertibleTo| 228) (|ConvertibleTo| 227) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|canonicalUnitNormal|) (|CoercibleFrom| 93)
                 (|CoercibleFrom| 235) (|unitsKnown|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 170) (|BasicType|)
                 (|CoercibleFrom| 6) (|InnerEvalable| 7 6)
                 (|InnerEvalable| 7 $$) (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 249
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
                                    109 2 8 0 0 2 111 2 6 0 0 0 113 1 8 0 2 114
                                    2 6 0 0 0 115 2 8 0 0 0 116 2 0 0 0 0 117 2
                                    8 16 0 0 118 2 8 0 0 0 119 2 6 0 0 27 120 2
                                    38 0 0 27 121 2 8 0 0 27 122 2 6 126 126 0
                                    127 2 7 126 126 0 128 2 8 126 126 0 129 2 0
                                    126 126 0 130 2 6 16 0 0 131 2 0 16 0 0 132
                                    1 6 133 0 134 1 0 133 0 135 1 6 0 0 136 1 0
                                    0 0 137 1 6 16 0 138 1 0 16 0 139 2 6 16 0
                                    0 140 2 8 16 0 0 141 2 0 16 0 0 142 2 6 99
                                    0 0 143 2 8 99 0 0 144 2 0 99 0 0 145 1 6 0
                                    0 148 2 0 0 0 6 149 1 8 16 0 150 1 0 6 0
                                    151 2 6 0 0 0 152 1 8 2 0 153 2 0 0 0 7 154
                                    2 0 0 0 0 155 2 8 0 0 0 156 1 60 2 0 157 1
                                    60 0 2 158 1 60 27 0 159 2 60 16 0 0 160 2
                                    60 99 0 0 161 2 60 0 0 0 162 2 0 55 55 55
                                    163 1 164 2 25 165 2 164 2 2 2 166 1 0 0
                                    167 168 2 164 60 60 60 169 1 6 170 0 171 1
                                    7 170 0 172 2 8 170 0 170 173 1 175 0 6 176
                                    2 175 0 0 0 178 2 182 0 0 0 183 2 8 2 0 2
                                    188 1 25 16 0 191 2 25 0 0 192 193 2 25 2 0
                                    194 195 2 182 16 196 0 197 2 182 0 196 0
                                    198 2 182 16 0 0 199 2 182 93 7 0 200 2 25
                                    2 0 93 201 0 70 0 207 2 70 0 27 7 208 2 70
                                    0 0 0 209 1 8 27 0 210 1 8 0 0 214 2 0 0 0
                                    7 215 1 8 2 0 217 2 25 0 2 0 218 1 25 0 0
                                    219 2 0 16 0 0 1 1 56 16 0 18 2 0 182 0 0
                                    185 1 0 182 0 184 2 0 55 0 7 56 1 0 38 0 46
                                    1 50 133 0 135 1 50 0 0 137 1 50 16 0 139 2
                                    0 27 0 182 1 2 0 27 0 182 1 1 0 27 0 1 1 0
                                    84 0 85 2 57 99 0 0 1 1 11 238 55 1 1 15 0
                                    0 1 1 15 236 0 1 2 11 239 240 55 1 2 24 16
                                    0 0 132 0 56 0 1 1 54 99 0 1 2 0 0 0 124 1
                                    2 54 0 0 27 1 1 0 180 0 181 1 6 241 0 1 1 7
                                    242 0 1 1 13 186 0 1 1 0 6 0 179 1 6 235 0
                                    1 1 7 93 0 1 1 13 7 0 1 3 5 0 0 0 7 1 1 21
                                    0 0 80 2 39 230 225 231 1 1 39 232 225 1 1
                                    4 243 225 1 2 4 244 225 231 1 1 54 99 0 101
                                    1 15 0 0 1 2 15 0 0 7 1 1 13 167 0 1 1 11
                                    16 0 1 4 0 0 0 6 70 0 1 2 51 0 0 124 1 3 30
                                    233 0 227 233 1 3 32 234 0 228 234 1 2 56
                                    16 0 0 1 1 54 16 0 21 1 0 27 0 28 2 0 0 38
                                    7 51 2 0 0 55 7 69 1 0 167 0 220 1 0 16 0
                                    33 2 0 0 6 70 71 3 0 0 0 182 205 1 3 0 0 0
                                    7 27 64 3 4 245 0 0 7 1 1 0 70 0 211 2 0 27
                                    0 7 212 2 0 205 0 182 213 2 0 0 222 0 1 2 0
                                    0 146 0 147 1 0 186 0 187 1 0 73 0 83 2 5 6
                                    81 0 82 1 54 99 0 1 2 0 0 0 124 1 2 54 0 0
                                    27 1 1 21 72 0 78 1 21 70 0 77 1 21 0 0 216
                                    1 21 6 0 37 2 15 237 0 0 1 1 15 0 167 1 2
                                    15 0 0 0 1 1 0 221 0 1 1 13 223 0 1 1 0 223
                                    0 1 1 13 247 0 1 2 20 126 126 0 130 1 20
                                    229 0 1 1 0 16 0 34 1 0 6 0 1 2 15 55 55 55
                                    163 1 15 0 167 168 2 15 0 0 0 155 4 4 0 0
                                    70 6 0 1 1 11 238 55 1 1 11 238 55 1 1 11
                                    236 0 1 2 50 99 0 0 145 2 14 99 0 6 1 3 0 0
                                    0 7 6 190 3 0 0 0 7 0 189 3 0 0 0 182 175
                                    203 3 0 0 0 182 167 202 2 13 0 0 248 1 3 13
                                    0 0 0 0 1 2 13 0 0 249 1 3 13 0 0 167 167 1
                                    2 5 0 0 7 1 3 4 0 0 182 205 1 3 4 0 0 7 27
                                    1 2 4 0 0 7 215 2 4 0 0 182 1 1 0 70 0 76 2
                                    0 205 0 182 206 2 0 27 0 7 204 1 19 226 0 1
                                    1 34 227 0 1 1 36 228 0 1 1 15 6 0 151 2 15
                                    0 0 7 154 1 21 0 73 75 1 0 0 73 74 1 49 224
                                    225 1 2 55 0 0 0 1 1 0 170 0 174 1 0 0 6 98
                                    1 52 0 0 1 1 53 0 93 95 1 23 0 235 1 1 13 0
                                    7 30 1 0 175 0 177 2 0 6 0 70 92 3 0 0 0
                                    182 205 1 3 0 0 0 7 27 1 1 49 99 0 1 0 55
                                    27 97 3 48 0 0 0 27 1 3 55 0 0 0 0 1 2 50
                                    16 0 0 142 2 0 0 0 0 1 2 55 16 0 0 1 2 0 0
                                    0 124 125 2 54 0 0 27 123 3 4 0 0 182 205 1
                                    2 4 0 0 182 1 3 4 0 0 7 27 1 2 4 0 0 7 1 2
                                    0 16 0 0 32 0 54 0 14 0 56 0 12 2 22 0 0 6
                                    149 1 58 0 0 104 2 58 0 0 0 117 2 0 0 0 0
                                    52 2 0 0 124 0 1 2 0 0 0 0 79 2 0 0 0 6 112
                                    2 0 0 6 0 110 2 39 0 0 93 1 2 58 0 93 0 107
                                    2 56 0 27 0 1 2 1 0 0 235 1 2 1 0 235 0
                                    1)))))
           '|lookupComplete|)) 
