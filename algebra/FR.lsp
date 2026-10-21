
(SDEFUN |FR;convert;%If;1| ((|x| (%)) (% (|InputForm|)))
        (SPROG
         ((|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|rec| NIL) (#1=#:G114 NIL) (|iFactor| (|InputForm|))
          (|iExpon| (|InputForm|)) (|iFun| (|List| (|InputForm|)))
          (|l| (|List| (|InputForm|))))
         (SEQ
          (COND
           ((NULL (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT % 11)))))
            (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 14)))
           (#2='T
            (SEQ (LETT |l| NIL)
                 (SEQ (LETT |rec| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |rec| 1) (|spadConstant| % 15)
                                    (QREFELT % 17))
                          (SPADCALL
                           "WARNING (convert$Factored): 1 should not appear as factor."
                           (QREFELT % 21)))
                         ('T
                          (SEQ
                           (LETT |iFactor|
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT % 14))
                                  (QREFELT % 23)))
                           (LETT |iExpon|
                                 (SPADCALL (QVELT |rec| 2) (QREFELT % 25)))
                           (LETT |iFun|
                                 (COND
                                  ((QEQCAR (QVELT |rec| 0) 0)
                                   (LIST (SPADCALL '|nilFactor| (QREFELT % 27))
                                         |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 1)
                                   (LIST
                                    (SPADCALL '|sqfrFactor| (QREFELT % 27))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 3)
                                   (LIST
                                    (SPADCALL '|primeFactor| (QREFELT % 27))
                                    |iFactor| |iExpon|))
                                  ((QEQCAR (QVELT |rec| 0) 2)
                                   (LIST
                                    (SPADCALL '|irreducibleFactor|
                                              (QREFELT % 27))
                                    |iFactor| |iExpon|))
                                  ('T NIL)))
                           (EXIT (LETT |l| (CONS |iFun| |l|))))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 14)))
                   (#2#
                    (SEQ
                     (COND
                      ((SPADCALL (SPADCALL |x| (QREFELT % 12))
                                 (|spadConstant| % 15) (QREFELT % 28))
                       (LETT |l|
                             (CONS
                              (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                        (QREFELT % 14))
                              |l|))))
                     (EXIT
                      (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                            (#2#
                             (SPADCALL (SPADCALL '* (QREFELT % 27)) |l|
                                       (QREFELT % 30))))))))))))))) 

(SDEFUN |FR;compare|
        ((|f1|
          (|Record|
           (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
           (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|))))
         (|f2|
          (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                    (|:| |exponent| (|NonNegativeInteger|))))
         (% (|Boolean|)))
        (COND
         ((QREFELT % 32)
          (SPADCALL (QVELT |f1| 1) (QVELT |f2| 1) (QREFELT % 35)))
         ((QREFELT % 33)
          (SPADCALL (QVELT |f1| 1) (QVELT |f2| 1) (QREFELT % 36)))
         ('T (|error| "unimplemented")))) 

(SDEFUN |FR;group_terms!|
        ((|l|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (%
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SPROG
         ((|t1|
           #5=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|f1| (R)) (|s1| #5#)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|l1|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((QREFELT % 33)
            (LETT |l|
                  (SPADCALL (CONS (|function| |FR;compare|) %) |l|
                            (QREFELT % 38)))))
          (EXIT
           (COND ((QREFELT % 34) |l|)
                 ('T
                  (SEQ (LETT |res| NIL)
                       (SEQ G190 (COND ((NULL (NULL (NULL |l|))) (GO G191)))
                            (SEQ (LETT |t1| (|SPADfirst| |l|))
                                 (LETT |res| (CONS |t1| |res|))
                                 (LETT |f1| (QVELT |t1| 1))
                                 (LETT |l| (CDR |l|)) (LETT |l1| NIL)
                                 (SEQ G190
                                      (COND
                                       ((NULL (NULL (NULL |l|))) (GO G191)))
                                      (SEQ (LETT |s1| (|SPADfirst| |l|))
                                           (LETT |l| (CDR |l|))
                                           (EXIT
                                            (COND
                                             ((SPADCALL (QVELT |s1| 1) |f1|
                                                        (QREFELT % 17))
                                              (LETT |res| (CONS |s1| |res|)))
                                             ('T
                                              (LETT |l1| (CONS |s1| |l1|))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT (LETT |l| (NREVERSE |l1|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT (NREVERSE |res|))))))))) 

(SDEFUN |FR;nilFactor;RNni%;4| ((|r| (R)) (|i| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |r| |i| (CONS 0 "nil") (QREFELT % 40))) 

(SDEFUN |FR;sqfrFactor;RNni%;5|
        ((|r| (R)) (|i| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |r| |i| (CONS 1 "sqfr") (QREFELT % 40))) 

(SDEFUN |FR;irreducibleFactor;RNni%;6|
        ((|r| (R)) (|i| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |r| |i| (CONS 2 "irred") (QREFELT % 40))) 

(SDEFUN |FR;primeFactor;RNni%;7|
        ((|r| (R)) (|i| (|NonNegativeInteger|)) (% (%)))
        (SPADCALL |r| |i| (CONS 3 "prime") (QREFELT % 40))) 

(SDEFUN |FR;unit?;%B;8| ((|u| (%)) (% (|Boolean|)))
        (COND ((NULL (QCDR |u|)) (NULL (SPADCALL (QCAR |u|) (QREFELT % 45))))
              ('T NIL))) 

(MAKEPROP '|FR;factorList;%L;9| '|SPADreplace| 'QCDR) 

(SDEFUN |FR;factorList;%L;9|
        ((|u| (%))
         (%
          (|List|
           (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                     (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (QCDR |u|)) 

(MAKEPROP '|FR;unit;%R;10| '|SPADreplace| 'QCAR) 

(SDEFUN |FR;unit;%R;10| ((|u| (%)) (% (R))) (QCAR |u|)) 

(SDEFUN |FR;numberOfFactors;%Nni;11| ((|u| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (QCDR |u|))) 

(SDEFUN |FR;0;%;12| ((% (%)))
        (CONS (|spadConstant| % 15)
              (LIST (VECTOR (CONS 0 "nil") (|spadConstant| % 50) 1)))) 

(SDEFUN |FR;zero?;%B;13| ((|u| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCDR |u|) 1 (QREFELT % 51))
          (COND
           ((QEQCAR (QVELT (|SPADfirst| (QCDR |u|)) 0) 0)
            (COND
             ((SPADCALL (QVELT (|SPADfirst| (QCDR |u|)) 1) (QREFELT % 45))
              (SPADCALL (QCAR |u|) (|spadConstant| % 15) (QREFELT % 17)))
             (#1='T NIL)))
           (#1# NIL)))
         (#1# NIL))) 

(SDEFUN |FR;1;%;14| ((% (%))) (CONS (|spadConstant| % 15) NIL)) 

(SDEFUN |FR;one?;%B;15| ((|u| (%)) (% (|Boolean|)))
        (COND
         ((NULL (QCDR |u|))
          (SPADCALL (QCAR |u|) (|spadConstant| % 15) (QREFELT % 17)))
         ('T NIL))) 

(MAKEPROP '|FR;mkFF| '|SPADreplace| 'CONS) 

(SDEFUN |FR;mkFF|
        ((|r| (R))
         (|x|
          (|List|
           (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                     (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (% (%)))
        (CONS |r| |x|)) 

(SDEFUN |FR;coerce;I%;17| ((|j| (|Integer|)) (% (%)))
        (SPADCALL (SPADCALL |j| (QREFELT % 54)) (QREFELT % 55))) 

(SDEFUN |FR;characteristic;Nni;18| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 57))) 

(SDEFUN |FR;*;I2%;19| ((|i| (|Integer|)) (|u| (%)) (% (%)))
        (SPADCALL (SPADCALL |i| (QREFELT % 56)) |u| (QREFELT % 59))) 

(SDEFUN |FR;*;R2%;20| ((|r| (R)) (|u| (%)) (% (%)))
        (SPADCALL (SPADCALL |r| (QREFELT % 55)) |u| (QREFELT % 59))) 

(SDEFUN |FR;factors;%L;21|
        ((|u| (%))
         (%
          (|List|
           (|Record| (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SPROG ((#1=#:G205 NIL) (|fe| NIL) (#2=#:G206 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |fe| NIL) (LETT #2# (SPADCALL |u| (QREFELT % 11)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |fe| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (CONS (QVELT |fe| 1) (QVELT |fe| 2))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FR;expand;%R;22| ((|u| (%)) (% (R)))
        (SPROG
         ((|y| NIL) (#1=#:G211 NIL) (#2=#:G209 (R)) (#3=#:G207 (R))
          (#4=#:G208 NIL))
         (SEQ
          (SPADCALL (SPADCALL |u| (QREFELT % 12))
                    (PROGN
                     (LETT #4# NIL)
                     (SEQ (LETT |y| NIL)
                          (LETT #1# (SPADCALL |u| (QREFELT % 11))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |y| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (SPADCALL (QVELT |y| 1) (QVELT |y| 2)
                                             (QREFELT % 65)))
                             (COND
                              (#4#
                               (LETT #3# (SPADCALL #3# #2# (QREFELT % 66))))
                              ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#4# #3#) ('T (|spadConstant| % 15))))
                    (QREFELT % 66))))) 

(SDEFUN |FR;makeFR;RL%;23|
        ((|u| (R))
         (|x|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (% (%)))
        (SPROG
         ((|o|
           #5=(|List|
               (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#))
                         (|:| |factor| R)
                         (|:| |exponent| (|NonNegativeInteger|)))))
          (|f1|
           #6=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (#7=#:G241 NIL) (|p| #5#) (|f| #6#))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |u| (|spadConstant| % 50) (QREFELT % 17))
             (|spadConstant| % 49))
            ((NULL |x|) (|FR;mkFF| |u| NIL %))
            (#8='T
             (SEQ (LETT |x| (|FR;group_terms!| |x| %))
                  (SEQ G190
                       (COND
                        ((NULL
                          (COND ((NULL |x|) NIL)
                                ('T (EQL (QVELT (|SPADfirst| |x|) 2) 0))))
                         (GO G191)))
                       (SEQ (EXIT (LETT |x| (CDR |x|)))) NIL (GO G190) G191
                       (EXIT NIL))
                  (EXIT
                   (COND ((NULL |x|) (|FR;mkFF| |u| NIL %))
                         (#8#
                          (SEQ (LETT |o| |x|) (LETT |p| |x|)
                               (LETT |f| (|SPADfirst| |p|))
                               (EXIT
                                (COND
                                 ((SPADCALL (QVELT |f| 1) (|spadConstant| % 50)
                                            (QREFELT % 17))
                                  (|spadConstant| % 49))
                                 (#8#
                                  (SEQ (LETT |x| (CDR |x|))
                                       (SEQ G190
                                            (COND
                                             ((NULL (NULL (NULL |x|)))
                                              (GO G191)))
                                            (SEQ (LETT |f1| (|SPADfirst| |x|))
                                                 (COND
                                                  ((OR (EQL (QVELT |f1| 2) 0)
                                                       (SPADCALL (QVELT |f1| 1)
                                                                 (|spadConstant|
                                                                  % 15)
                                                                 (QREFELT %
                                                                          17)))
                                                   (EXIT
                                                    (SEQ
                                                     (SPADCALL |p| (CDR |x|)
                                                               (QREFELT % 68))
                                                     (EXIT
                                                      (LETT |x| (CDR |x|)))))))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL (QVELT |f1| 1)
                                                              (|spadConstant| %
                                                                              50)
                                                              (QREFELT % 17))
                                                    (PROGN
                                                     (LETT #7#
                                                           (|spadConstant| %
                                                                           49))
                                                     (GO #9=#:G240)))
                                                   ((SPADCALL (QVELT |f1| 1)
                                                              (QVELT |f| 1)
                                                              (QREFELT % 17))
                                                    (SEQ
                                                     (LETT |f|
                                                           (VECTOR
                                                            (|FR;stricterFlag|
                                                             (QVELT |f| 0)
                                                             (QVELT |f1| 0) %)
                                                            (QVELT |f| 1)
                                                            (+ (QVELT |f| 2)
                                                               (QVELT |f1|
                                                                      2))))
                                                     (SPADCALL |p| |f|
                                                               (QREFELT % 69))
                                                     (SPADCALL |p| (CDR |x|)
                                                               (QREFELT % 68))
                                                     (EXIT
                                                      (LETT |x| (CDR |x|)))))
                                                   ('T
                                                    (SEQ (LETT |p| |x|)
                                                         (LETT |f| |f1|)
                                                         (EXIT
                                                          (LETT |x|
                                                                (CDR
                                                                 |x|))))))))
                                            NIL (GO G190) G191 (EXIT NIL))
                                       (EXIT
                                        (SPADCALL (|FR;mkFF| |u| |o| %)
                                                  (QREFELT % 70)))))))))))))))
          #9# (EXIT #7#)))) 

(MAKEPROP '|FR;rational?;%B;24| '|SPADreplace| '(XLAM (|x|) 'T)) 

(SDEFUN |FR;rational?;%B;24| ((|x| (%)) (% (|Boolean|))) 'T) 

(SDEFUN |FR;rationalIfCan;%U;25|
        ((|x| (%)) (% (|Union| (|Fraction| (|Integer|)) "failed")))
        (CONS 0 (SPADCALL |x| (QREFELT % 74)))) 

(SDEFUN |FR;rational;%F;26| ((|x| (%)) (% (|Fraction| (|Integer|))))
        (SPROG
         ((|f| NIL) (#1=#:G254 NIL) (#2=#:G252 #3=(|Fraction| (|Integer|)))
          (#4=#:G250 #3#) (#5=#:G251 NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 77))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |f| NIL)
                          (LETT #1# (SPADCALL |x| (QREFELT % 11))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QVELT |f| 1) (QREFELT % 77))
                                     (QREFELT % 78))
                                    (QVELT |f| 2) (QREFELT % 79)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 80))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T (|spadConstant| % 81))))
                    (QREFELT % 82))))) 

(SDEFUN |FR;elt;3%;27| ((|x| (%)) (|v| (%)) (% (%)))
        (SPADCALL |x| (SPADCALL |v| (QREFELT % 67)) (QREFELT % 83))) 

(SDEFUN |FR;eval;%L%;28| ((|x| (%)) (|l| (|List| (|Equation| %))) (% (%)))
        (SPROG ((#1=#:G259 NIL) (|e| NIL) (#2=#:G260 NIL))
               (SEQ
                (SPADCALL |x|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |e| NIL) (LETT #2# |l|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |e| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT % 86))
                                           (QREFELT % 67))
                                          (SPADCALL
                                           (SPADCALL |e| (QREFELT % 87))
                                           (QREFELT % 67))
                                          (QREFELT % 89))
                                         #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 91))))) 

(SDEFUN |FR;eval;%LL%;29|
        ((|x| (%)) (|ls| (|List| (|Symbol|))) (|lv| (|List| %)) (% (%)))
        (SPROG ((#1=#:G264 NIL) (|v| NIL) (#2=#:G265 NIL))
               (SEQ
                (SPADCALL |x| |ls|
                          (PROGN
                           (LETT #1# NIL)
                           (SEQ (LETT |v| NIL) (LETT #2# |lv|) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |v| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #1#
                                        (CONS (SPADCALL |v| (QREFELT % 67))
                                              #1#))))
                                (LETT #2# (CDR #2#)) (GO G190) G191
                                (EXIT (NREVERSE #1#))))
                          (QREFELT % 96))))) 

(SDEFUN |FR;convert;%F;30| ((|x| (%)) (% (|Float|)))
        (SPROG
         ((|f| NIL) (#1=#:G274 NIL) (#2=#:G272 #3=(|Float|)) (#4=#:G270 #3#)
          (#5=#:G271 NIL))
         (SEQ
          (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 99))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |f| NIL)
                          (LETT #1# (SPADCALL |x| (QREFELT % 11))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (SPADCALL
                                    (SPADCALL (QVELT |f| 1) (QREFELT % 99))
                                    (QVELT |f| 2) (QREFELT % 100)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 101))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T (|spadConstant| % 102))))
                    (QREFELT % 101))))) 

(SDEFUN |FR;convert;%Df;31| ((|x| (%)) (% (|DoubleFloat|)))
        (SPROG
         ((|f| NIL) (#1=#:G283 NIL) (#2=#:G281 #3=(|DoubleFloat|))
          (#4=#:G279 #3#) (#5=#:G280 NIL))
         (SEQ
          (|mul_DF| (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 105))
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |f| NIL)
                          (LETT #1# (SPADCALL |x| (QREFELT % 11))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2#
                                   (|expt_DF_I|
                                    (SPADCALL (QVELT |f| 1) (QREFELT % 105))
                                    (QVELT |f| 2)))
                             (COND (#5# (LETT #4# (|mul_DF| #4# #2#)))
                                   ('T
                                    (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) ('T 1.0))))))) 

(SDEFUN |FR;ordered_mul|
        ((|lu|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (|lv|
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (%
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SPROG
         ((|u1|
           #5=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|v1| #5#)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |res| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                     (GO G191)))
                   (SEQ (LETT |u1| (|SPADfirst| |lu|))
                        (LETT |v1| (|SPADfirst| |lv|))
                        (EXIT
                         (COND
                          ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                     (QREFELT % 17))
                           (SEQ
                            (LETT |res|
                                  (CONS
                                   (VECTOR
                                    (|FR;stricterFlag| (QVELT |u1| 0)
                                     (QVELT |v1| 0) %)
                                    (QVELT |u1| 1)
                                    (+ (QVELT |u1| 2) (QVELT |v1| 2)))
                                   |res|))
                            (LETT |lu| (CDR |lu|))
                            (EXIT (LETT |lv| (CDR |lv|)))))
                          ((|FR;compare| |u1| |v1| %)
                           (SEQ (LETT |res| (CONS |u1| |res|))
                                (EXIT (LETT |lu| (CDR |lu|)))))
                          ('T
                           (SEQ (LETT |res| (CONS |v1| |res|))
                                (EXIT (LETT |lv| (CDR |lv|))))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (NREVERSE |res|) (COND ((NULL |lu|) |lv|) ('T |lu|))
                         (QREFELT % 107)))))) 

(SDEFUN |FR;unordered_mul|
        ((|lu|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (|lv|
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (%
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))))
        (SPROG
         ((|u1| NIL) (#5=#:G328 NIL) (|f1| (R))
          (|v1|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|factor_done| (|Boolean|)) (#6=#:G327 NIL)
          (|lv1|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#7=#:G329 NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |u1| NIL) (LETT #5# |lu|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |u1| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |f1| (QVELT |u1| 1)) (LETT |lv1| NIL)
                        (LETT |factor_done| NIL)
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND ((NULL (NULL (NULL |lv|))) (GO G191)))
                               (SEQ (LETT |v1| (|SPADfirst| |lv|))
                                    (LETT |lv| (CDR |lv|))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |f1| (QVELT |v1| 1)
                                                 (QREFELT % 17))
                                       (SEQ
                                        (LETT |res|
                                              (CONS
                                               (VECTOR
                                                (|FR;stricterFlag|
                                                 (QVELT |u1| 0) (QVELT |v1| 0)
                                                 %)
                                                (QVELT |u1| 1)
                                                (+ (QVELT |u1| 2)
                                                   (QVELT |v1| 2)))
                                               |res|))
                                        (LETT |factor_done| 'T)
                                        (EXIT
                                         (PROGN (LETT #6# 1) (GO #8=#:G316)))))
                                      ('T (LETT |lv1| (CONS |v1| |lv1|))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #8# (EXIT #6#))
                        (COND
                         ((NULL |factor_done|) (LETT |res| (CONS |u1| |res|))))
                        (EXIT
                         (SEQ (LETT #7# |lv1|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |v1| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ (EXIT (LETT |lv| (CONS |v1| |lv|))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (NREVERSE |res|) |lv| (QREFELT % 107)))))) 

(SDEFUN |FR;*;3%;34| ((|u| (%)) (|v| (%)) (% (%)))
        (SPROG
         ((|lu|
           #1=(|List|
               (|Record|
                (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
                (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|lv| #1#)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #2# #3# #4# #5#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT % 52)) (SPADCALL |v| (QREFELT % 52)))
            (|spadConstant| % 49))
           ('T
            (COND ((SPADCALL |u| (QREFELT % 53)) |v|)
                  ((SPADCALL |v| (QREFELT % 53)) |u|)
                  (#6='T
                   (SEQ
                    (LETT |lu|
                          (SPADCALL (SPADCALL |u| (QREFELT % 11))
                                    (QREFELT % 108)))
                    (LETT |lv|
                          (SPADCALL (SPADCALL |v| (QREFELT % 11))
                                    (QREFELT % 108)))
                    (LETT |res|
                          (COND ((QREFELT % 34) (|FR;ordered_mul| |lu| |lv| %))
                                (#6# (|FR;unordered_mul| |lu| |lv| %))))
                    (EXIT
                     (|FR;mkFF|
                      (SPADCALL (SPADCALL |u| (QREFELT % 12))
                                (SPADCALL |v| (QREFELT % 12)) (QREFELT % 66))
                      |res| %)))))))))) 

(SDEFUN |FR;^;%Nni%;35| ((|u| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G345 NIL) (|x| NIL) (#2=#:G346 NIL))
               (SEQ
                (COND ((EQL |n| 0) (|spadConstant| % 48)) ((EQL |n| 1) |u|)
                      ('T
                       (|FR;mkFF|
                        (SPADCALL (SPADCALL |u| (QREFELT % 12)) |n|
                                  (QREFELT % 65))
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #2# (SPADCALL |u| (QREFELT % 11))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |x| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (VECTOR (QVELT |x| 0) (QVELT |x| 1)
                                               (* |n| (QVELT |x| 2)))
                                       #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))
                        %)))))) 

(SDEFUN |FR;coerce;%Of;36| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|rec| NIL) (#1=#:G363 NIL) (|l| (|List| (|OutputForm|)))
          (|e| (|OutputForm|)))
         (SEQ
          (COND
           ((NULL (LETT |lf| (REVERSE (SPADCALL |x| (QREFELT % 11)))))
            (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 110)))
           (#2='T
            (SEQ (LETT |l| NIL)
                 (SEQ (LETT |rec| NIL) (LETT #1# |lf|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL (QVELT |rec| 1) (|spadConstant| % 15)
                                    (QREFELT % 17))
                          (SPADCALL
                           "WARNING (coerce$Factored): 1 should not appear as factor."
                           (QREFELT % 21)))
                         ((EQL (QVELT |rec| 2) 1)
                          (LETT |l|
                                (CONS
                                 (SPADCALL (QVELT |rec| 1) (QREFELT % 110))
                                 |l|)))
                         ('T
                          (LETT |l|
                                (CONS
                                 (SPADCALL
                                  (SPADCALL (QVELT |rec| 1) (QREFELT % 110))
                                  (SPADCALL (QVELT |rec| 2) (QREFELT % 111))
                                  (QREFELT % 112))
                                 |l|))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND
                   ((NULL |l|)
                    (SPADCALL (SPADCALL |x| (QREFELT % 12)) (QREFELT % 110)))
                   (#2#
                    (SEQ
                     (LETT |e|
                           (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                                 (#2#
                                  (SPADCALL (ELT % 113) |l| (QREFELT % 116)))))
                     (EXIT
                      (COND
                       ((SPADCALL (|spadConstant| % 15)
                                  (SPADCALL |x| (QREFELT % 12)) (QREFELT % 17))
                        |e|)
                       (#2#
                        (SPADCALL
                         (SPADCALL (SPADCALL |x| (QREFELT % 12))
                                   (QREFELT % 110))
                         |e| (QREFELT % 113))))))))))))))) 

(SDEFUN |FR;retract;%R;37| ((|u| (%)) (% (R))) (SPADCALL |u| (QREFELT % 67))) 

(SDEFUN |FR;retractIfCan;%U;38| ((|u| (%)) (% (|Union| R "failed")))
        (CONS 0 (SPADCALL |u| (QREFELT % 67)))) 

(SDEFUN |FR;stricterFlag|
        ((|fl1| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
         (|fl2| (|Union| #1# #2# #3# #4#)) (% (|Union| #1# #2# #3# #4#)))
        (COND ((QEQCAR |fl1| 3) |fl1|)
              ((QEQCAR |fl1| 2) (COND ((QEQCAR |fl2| 3) |fl2|) (#5='T |fl1|)))
              ((QEQCAR |fl1| 1) (COND ((QEQCAR |fl2| 0) |fl1|) (#5# |fl2|)))
              (#5# |fl2|))) 

(SDEFUN |FR;coerce;R%;40| ((|r| (R)) (% (%))) (SPADCALL |r| (QREFELT % 123))) 

(SDEFUN |FR;coerce;R%;41| ((|r| (R)) (% (%)))
        (COND ((SPADCALL |r| (QREFELT % 45)) (|spadConstant| % 49))
              ((SPADCALL |r| (QREFELT % 124)) (|FR;mkFF| |r| NIL %))
              ((|HasCategory| (QREFELT % 6) '(|Field|))
               (|error| "zero divisor in a field"))
              ('T (SPADCALL (SPADCALL |r| (QREFELT % 126)) (QREFELT % 70))))) 

(SDEFUN |FR;coerce;R%;42| ((|r| (R)) (% (%)))
        (COND
         ((SPADCALL |r| (|spadConstant| % 15) (QREFELT % 17))
          (|spadConstant| % 48))
         ('T
          (SPADCALL
           (|FR;mkFF| (|spadConstant| % 15)
            (LIST (VECTOR (CONS 0 "nil") |r| 1)) %)
           (QREFELT % 70))))) 

(SDEFUN |FR;=;2%B;43| ((|u| (%)) (|v| (%)) (% (|Boolean|)))
        (SPROG
         ((|u1|
           #1=(|Record|
               (|:| |flag| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
               (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|))))
          (|v1| #1#) (#6=#:G401 NIL)
          (|lu|
           #7=(|List|
               (|Record| (|:| |flag| (|Union| #2# #3# #4# #5#))
                         (|:| |factor| R)
                         (|:| |exponent| (|NonNegativeInteger|)))))
          (|lv| #7#))
         (SEQ
          (EXIT
           (COND
            ((QREFELT % 34)
             (COND
              ((SPADCALL (SPADCALL |u| (QREFELT % 12))
                         (SPADCALL |v| (QREFELT % 12)) (QREFELT % 28))
               NIL)
              (#8='T
               (SEQ (LETT |lu| (SPADCALL |u| (QREFELT % 11)))
                    (LETT |lv| (SPADCALL |v| (QREFELT % 11)))
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                           (GO G191)))
                         (SEQ (LETT |u1| (|SPADfirst| |lu|))
                              (LETT |v1| (|SPADfirst| |lv|))
                              (EXIT
                               (COND
                                ((OR
                                  (SPADCALL (QVELT |u1| 2) (QVELT |v1| 2)
                                            (QREFELT % 127))
                                  (SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                            (QREFELT % 28)))
                                 (PROGN (LETT #6# NIL) (GO #9=#:G400)))
                                ('T
                                 (SEQ (LETT |lu| (CDR |lu|))
                                      (EXIT (LETT |lv| (CDR |lv|))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT (COND ((NULL |lu|) (NULL |lv|)) (#8# NIL)))))))
            (#8#
             (SPADCALL (SPADCALL |u| (QREFELT % 67))
                       (SPADCALL |v| (QREFELT % 67)) (QREFELT % 17)))))
          #9# (EXIT #6#)))) 

(SDEFUN |FR;-;2%;44| ((|u| (%)) (% (%)))
        (COND ((SPADCALL |u| (QREFELT % 52)) |u|)
              ('T
               (|FR;mkFF|
                (SPADCALL (SPADCALL |u| (QREFELT % 12)) (QREFELT % 129))
                (SPADCALL |u| (QREFELT % 11)) %)))) 

(SDEFUN |FR;recip;%U;45| ((|u| (%)) (% (|Union| % #1="failed")))
        (SPROG ((|r| (|Union| R #1#)))
               (SEQ
                (COND
                 ((NULL (NULL (SPADCALL |u| (QREFELT % 11))))
                  (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (LETT |r|
                         (SPADCALL (SPADCALL |u| (QREFELT % 12))
                                   (QREFELT % 132)))
                   (EXIT
                    (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                          ('T (CONS 0 (|FR;mkFF| (QCDR |r|) NIL %))))))))))) 

(SDEFUN |FR;flagFactor;RNniU%;46|
        ((|r| (R)) (|i| (|NonNegativeInteger|))
         (|fl| (|Union| "nil" "sqfr" "irred" "prime")) (% (%)))
        (COND ((ZEROP |i|) (|spadConstant| % 48))
              ((SPADCALL |r| (QREFELT % 45)) (|spadConstant| % 49))
              ('T
               (SPADCALL
                (|FR;mkFF| (|spadConstant| % 15) (LIST (VECTOR |fl| |r| |i|))
                 %)
                (QREFELT % 70))))) 

(SDEFUN |FR;differentiate;%M%;47| ((|u| (%)) (|deriv| (|Mapping| R R)) (% (%)))
        (SPROG
         ((|ans| (%)) (|fact| NIL) (#1=#:G435 NIL) (#2=#:G430 NIL)
          (#3=#:G428 (%)) (#4=#:G426 (%)) (#5=#:G427 NIL))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 12)) |deriv|)
                          (|FR;mkFF| (|spadConstant| % 15)
                           (SPADCALL |u| (QREFELT % 11)) %)
                          (QREFELT % 61)))
          (EXIT
           (SPADCALL |ans|
                     (PROGN
                      (LETT #5# NIL)
                      (SEQ (LETT |fact| NIL)
                           (LETT #1# (SPADCALL |u| (QREFELT % 11))) G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |fact| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (PROGN
                              (LETT #3#
                                    (SPADCALL
                                     (SPADCALL (QVELT |fact| 2)
                                               (SPADCALL (QVELT |fact| 1)
                                                         |deriv|)
                                               (QREFELT % 134))
                                     (PROG2
                                         (LETT #2#
                                               (SPADCALL |u|
                                                         (SPADCALL
                                                          (QVELT |fact| 1) 1
                                                          (QREFELT % 41))
                                                         (QREFELT % 135)))
                                         (QCDR #2#)
                                       (|check_union2| (QEQCAR #2# 0) %
                                                       (|Union| % "failed")
                                                       #2#))
                                     (QREFELT % 61)))
                              (COND
                               (#5#
                                (LETT #4# (SPADCALL #4# #3# (QREFELT % 136))))
                               ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (COND (#5# #4#) ('T (|spadConstant| % 49))))
                     (QREFELT % 136)))))) 

(SDEFUN |FR;map;M2%;48| ((|fn| (|Mapping| R R)) (|u| (%)) (% (%)))
        (SPROG
         ((#1=#:G445 NIL) (|f| NIL) (#2=#:G446 NIL)
          (|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |l|
                (CONS
                 (VECTOR (CONS 0 "nil")
                         (SPADCALL (SPADCALL |u| (QREFELT % 12)) |fn|) 1)
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |f| NIL) (LETT #2# (SPADCALL |u| (QREFELT % 11)))
                       G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS
                                (VECTOR (CONS 0 "nil")
                                        (SPADCALL (QVELT |f| 1) |fn|)
                                        (QVELT |f| 2))
                                #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))))
          (EXIT (SPADCALL (|spadConstant| % 15) |l| (QREFELT % 71)))))) 

(SDEFUN |FR;mergeFactors;3%;49| ((|f| (%)) (|g| (%)) (% (%)))
        (|FR;mkFF|
         (SPADCALL (SPADCALL |f| (QREFELT % 12)) (SPADCALL |g| (QREFELT % 12))
                   (QREFELT % 66))
         (SPADCALL (CONS (|function| |FR;compare|) %)
                   (SPADCALL |f| (QREFELT % 11)) (SPADCALL |g| (QREFELT % 11))
                   (QREFELT % 140))
         %)) 

(SDEFUN |FR;mergeFactors;3%;50| ((|f| (%)) (|g| (%)) (% (%)))
        (|FR;mkFF|
         (SPADCALL (SPADCALL |f| (QREFELT % 12)) (SPADCALL |g| (QREFELT % 12))
                   (QREFELT % 66))
         (SPADCALL (SPADCALL |f| (QREFELT % 11)) (SPADCALL |g| (QREFELT % 11))
                   (QREFELT % 142))
         %)) 

(SDEFUN |FR;do_ordered_exquo|
        ((|lu|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (|lv|
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (%
          (|Union|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))
           "failed")))
        (SPROG
         ((|u1|
           #5=(|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                        (|:| |exponent| (|NonNegativeInteger|))))
          (|v1| #5#) (|expn| (|Integer|)) (#6=#:G464 NIL)
          (|nf|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#7=#:G479 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |res| NIL)
                (SEQ G190
                     (COND
                      ((NULL (COND ((NULL |lu|) NIL) ('T (NULL (NULL |lv|)))))
                       (GO G191)))
                     (SEQ (LETT |u1| (|SPADfirst| |lu|))
                          (LETT |v1| (|SPADfirst| |lv|))
                          (EXIT
                           (COND
                            ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                       (QREFELT % 17))
                             (SEQ
                              (LETT |expn| (- (QVELT |u1| 2) (QVELT |v1| 2)))
                              (EXIT
                               (COND
                                ((< |expn| 0)
                                 (PROGN
                                  (LETT #7# (CONS 1 "failed"))
                                  (GO #8=#:G478)))
                                ('T
                                 (SEQ
                                  (COND
                                   ((> |expn| 0)
                                    (SEQ
                                     (LETT |nf|
                                           (VECTOR
                                            (|FR;stricterFlag| (QVELT |u1| 0)
                                             (QVELT |v1| 0) %)
                                            (QVELT |u1| 1)
                                            (PROG1 (LETT #6# |expn|)
                                              (|check_subtype2| (>= #6# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #6#))))
                                     (EXIT (LETT |res| (CONS |nf| |res|))))))
                                  (LETT |lu| (CDR |lu|))
                                  (EXIT (LETT |lv| (CDR |lv|)))))))))
                            ((|FR;compare| |u1| |v1| %)
                             (SEQ (LETT |res| (CONS |u1| |res|))
                                  (EXIT (LETT |lu| (CDR |lu|)))))
                            ('T
                             (PROGN (LETT #7# (CONS 1 "failed")) (GO #8#))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND ((NULL (NULL |lv|)) (EXIT (CONS 1 "failed"))))
                (EXIT
                 (CONS 0 (SPADCALL (NREVERSE |res|) |lu| (QREFELT % 107))))))
          #8# (EXIT #7#)))) 

(SDEFUN |FR;exquo;2%U;52| ((|u| (%)) (|v| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((#2=#:G485 NIL) (|newunit| (R))
          (|lv|
           (|List|
            (|Record|
             (|:| |flag| (|Union| #3="nil" #4="sqfr" #5="irred" #6="prime"))
             (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|new_ff|
           (|Union|
            (|List|
             (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                       (|:| |exponent| (|NonNegativeInteger|))))
            "failed"))
          (|v1| NIL) (#7=#:G515 NIL)
          (|u1|
           (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|expn| (|Integer|)) (#8=#:G496 NIL)
          (|nf|
           (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|factor_done| (|Boolean|)) (#9=#:G513 NIL)
          (|lu1|
           (|List|
            (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#10=#:G516 NIL)
          (|lu|
           (|List|
            (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#11=#:G514 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |newunit|
                  (PROG2
                      (LETT #2#
                            (SPADCALL (SPADCALL |u| (QREFELT % 12))
                                      (SPADCALL |v| (QREFELT % 12))
                                      (QREFELT % 143)))
                      (QCDR #2#)
                    (|check_union2| (QEQCAR #2# 0) (QREFELT % 6)
                                    (|Union| (QREFELT % 6) #1#) #2#)))
            (LETT |lu|
                  (SPADCALL (SPADCALL |u| (QREFELT % 11)) (QREFELT % 108)))
            (LETT |lv| (SPADCALL |v| (QREFELT % 11)))
            (EXIT
             (COND ((NULL |lv|) (CONS 0 (|FR;mkFF| |newunit| |lu| %)))
                   ((QREFELT % 34)
                    (SEQ (LETT |new_ff| (|FR;do_ordered_exquo| |lu| |lv| %))
                         (EXIT
                          (COND ((QEQCAR |new_ff| 1) (CONS 1 "failed"))
                                (#12='T
                                 (CONS 0
                                       (|FR;mkFF| |newunit| (QCDR |new_ff|)
                                        %)))))))
                   (#12#
                    (SEQ (LETT |res| NIL)
                         (SEQ (LETT |v1| NIL) (LETT #7# |lv|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |v1| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |factor_done| NIL) (LETT |lu1| NIL)
                                   (SEQ
                                    (EXIT
                                     (SEQ G190
                                          (COND
                                           ((NULL (NULL (NULL |lu|)))
                                            (GO G191)))
                                          (SEQ (LETT |u1| (|SPADfirst| |lu|))
                                               (LETT |lu| (CDR |lu|))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL (QVELT |u1| 1)
                                                            (QVELT |v1| 1)
                                                            (QREFELT % 17))
                                                  (SEQ
                                                   (LETT |expn|
                                                         (- (QVELT |u1| 2)
                                                            (QVELT |v1| 2)))
                                                   (EXIT
                                                    (COND
                                                     ((< |expn| 0)
                                                      (PROGN
                                                       (LETT #11#
                                                             (CONS 1 "failed"))
                                                       (GO #13=#:G512)))
                                                     ('T
                                                      (SEQ
                                                       (COND
                                                        ((> |expn| 0)
                                                         (SEQ
                                                          (LETT |nf|
                                                                (VECTOR
                                                                 (|FR;stricterFlag|
                                                                  (QVELT |u1|
                                                                         0)
                                                                  (QVELT |v1|
                                                                         0)
                                                                  %)
                                                                 (QVELT |u1| 1)
                                                                 (PROG1
                                                                     (LETT #8#
                                                                           |expn|)
                                                                   (|check_subtype2|
                                                                    (>= #8# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #8#))))
                                                          (EXIT
                                                           (LETT |res|
                                                                 (CONS |nf|
                                                                       |res|))))))
                                                       (LETT |factor_done| 'T)
                                                       (EXIT
                                                        (PROGN
                                                         (LETT #9# 1)
                                                         (GO
                                                          #14=#:G501)))))))))
                                                 ('T
                                                  (LETT |lu1|
                                                        (CONS |u1| |lu1|))))))
                                          NIL (GO G190) G191 (EXIT NIL)))
                                    #14# (EXIT #9#))
                                   (EXIT
                                    (COND
                                     (|factor_done|
                                      (SEQ (LETT #10# |lu1|) G190
                                           (COND
                                            ((OR (ATOM #10#)
                                                 (PROGN
                                                  (LETT |u1| (CAR #10#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |lu| (CONS |u1| |lu|))))
                                           (LETT #10# (CDR #10#)) (GO G190)
                                           G191 (EXIT NIL)))
                                     ('T
                                      (PROGN
                                       (LETT #11# (CONS 1 "failed"))
                                       (GO #13#))))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (CONS 0
                                (|FR;mkFF| |newunit|
                                 (SPADCALL (NREVERSE |res|) |lu|
                                           (QREFELT % 107))
                                 %)))))))))
          #13# (EXIT #11#)))) 

(SDEFUN |FR;unitNormal;%R;53|
        ((|u| (%))
         (% (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
        (SPROG
         ((|ur| (|Union| R "failed")) (|x| NIL) (#1=#:G537 NIL)
          (|ucar|
           (|Record| (|:| |unit| R) (|:| |canonical| R) (|:| |associate| R)))
          (|e| (|NonNegativeInteger|)) (|un| (R)) (|as| (R))
          (|vl|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (LETT |ur|
                (SPADCALL (LETT |un| (SPADCALL |u| (QREFELT % 12)))
                          (QREFELT % 132)))
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (VECTOR (|spadConstant| % 48) |u| (|spadConstant| % 48)))
            ('T
             (SEQ (LETT |as| (QCDR |ur|)) (LETT |vl| NIL)
                  (SEQ (LETT |x| NIL) (LETT #1# (SPADCALL |u| (QREFELT % 11)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ucar| (SPADCALL (QVELT |x| 1) (QREFELT % 145)))
                        (LETT |e| (QVELT |x| 2))
                        (LETT |un|
                              (SPADCALL |un|
                                        (SPADCALL (QVELT |ucar| 0) |e|
                                                  (QREFELT % 65))
                                        (QREFELT % 66)))
                        (LETT |as|
                              (SPADCALL |as|
                                        (SPADCALL (QVELT |ucar| 2) |e|
                                                  (QREFELT % 65))
                                        (QREFELT % 66)))
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QVELT |ucar| 1) (|spadConstant| % 15)
                                      (QREFELT % 17)))
                           (LETT |vl|
                                 (CONS
                                  (VECTOR (QVELT |x| 0) (QVELT |ucar| 1) |e|)
                                  |vl|))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (|FR;mkFF| |un| NIL %)
                           (|FR;mkFF| (|spadConstant| % 15) (NREVERSE |vl|) %)
                           (|FR;mkFF| |as| NIL %)))))))))) 

(SDEFUN |FR;unitNormalize;2%;54| ((|u| (%)) (% (%)))
        (SPROG
         ((|uca|
           (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))))
         (SEQ (LETT |uca| (SPADCALL |u| (QREFELT % 146)))
              (EXIT
               (|FR;mkFF|
                (SPADCALL (SPADCALL (QVELT |uca| 0) (QREFELT % 12))
                          (SPADCALL (QVELT |uca| 1) (QREFELT % 12))
                          (QREFELT % 66))
                (SPADCALL (QVELT |uca| 1) (QREFELT % 11)) %))))) 

(SDEFUN |FR;+;3%;55| ((|u| (%)) (|v| (%)) (% (%)))
        (SPROG ((|u1| (%)) (|eu1| (R)) (#1=#:G543 NIL))
               (SEQ
                (COND ((SPADCALL |u| (QREFELT % 52)) |v|)
                      ((SPADCALL |v| (QREFELT % 52)) |u|)
                      ('T
                       (SEQ (LETT |u1| (SPADCALL |u| |v| (QREFELT % 147)))
                            (LETT |eu1| (SPADCALL |u1| (QREFELT % 67)))
                            (EXIT
                             (SPADCALL
                              (SPADCALL
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL |u| (QREFELT % 67)) |eu1|
                                          (QREFELT % 143)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                                 (|Union| (QREFELT % 6)
                                                          #2="failed")
                                                 #1#))
                               (PROG2
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL |v| (QREFELT % 67)) |eu1|
                                          (QREFELT % 143)))
                                   (QCDR #1#)
                                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                                 (|Union| (QREFELT % 6) #2#)
                                                 #1#))
                               (QREFELT % 148))
                              |u1| (QREFELT % 61))))))))) 

(SDEFUN |FR;all_primes|
        ((|lf|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (% (|Boolean|)))
        (SPROG
         ((|f| NIL) (#5=#:G560 NIL) (|fg| (|Union| #1# #2# #3# #4#))
          (#6=#:G559 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |f| NIL) (LETT #5# |lf|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL)) (GO G191)))
                 (SEQ (LETT |fg| (QVELT |f| 0))
                      (EXIT
                       (COND
                        ((NULL (QEQCAR |fg| 3))
                         (COND
                          ((NULL (QEQCAR |fg| 2))
                           (PROGN (LETT #6# NIL) (GO #7=#:G558))))))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #7# (EXIT #6#)))) 

(SDEFUN |FR;all_sqf|
        ((|lf|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (% (|Boolean|)))
        (SPROG
         ((|f| NIL) (#5=#:G572 NIL) (|fg| (|Union| #1# #2# #3# #4#))
          (#6=#:G571 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |f| NIL) (LETT #5# |lf|) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |f| (CAR #5#)) NIL)) (GO G191)))
                 (SEQ (LETT |fg| (QVELT |f| 0))
                      (EXIT
                       (COND
                        ((QEQCAR |fg| 0)
                         (PROGN (LETT #6# NIL) (GO #7=#:G570))))))
                 (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #7# (EXIT #6#)))) 

(SDEFUN |FR;gcd1|
        ((|lu|
          (|List|
           (|Record|
            (|:| |flag| (|Union| #1="nil" #2="sqfr" #3="irred" #4="prime"))
            (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
         (|lv|
          (|List|
           (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (% (%)))
        (SPROG
         ((|#G124| #5=(|NonNegativeInteger|)) (|#G125| #5#) (|nu| #5#)
          (|nv| #5#) (|vr| (|Vector| R)) (#6=#:G603 NIL) (#7=#:G602 NIL)
          (#8=#:G605 NIL) (#9=#:G604 NIL)
          (|dr|
           (|Record| (|:| |basis| #10=(|Vector| R))
                     (|:| |transform| #11=(|Matrix| (|Integer|)))))
          (|nfv| #10#) (|tr| #11#) (|fg| (|Union| #1# #2# #3# #4#)) (|j| NIL)
          (#12=#:G606 NIL) (|nf| (R)) (#13=#:G608 NIL) (#14=#:G607 NIL)
          (|eu| #15=(|NonNegativeInteger|)) (|i| NIL) (#16=#:G610 NIL)
          (|f| NIL) (#17=#:G609 NIL) (|ev| #15#) (#18=#:G601 NIL)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #1# #2# #3# #4#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (PROGN
           (LETT |#G124| (LENGTH |lu|))
           (LETT |#G125| (LENGTH |lv|))
           (LETT |nu| |#G124|)
           (LETT |nv| |#G125|))
          (LETT |vr| (MAKEARR1 (+ |nu| |nv|) (|spadConstant| % 50)))
          (SEQ (LETT |i| 1) (LETT #6# |nu|) (LETT |f| NIL) (LETT #7# |lu|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |f| (CAR #7#)) NIL)
                     (|greater_SI| |i| #6#))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |vr| |i| (QVELT |f| 1) (QREFELT % 150))))
               (LETT #7# (PROG1 (CDR #7#) (LETT |i| (|inc_SI| |i|)))) (GO G190)
               G191 (EXIT NIL))
          (SEQ (LETT |i| (+ |nu| 1)) (LETT #8# (+ |nu| |nv|)) (LETT |f| NIL)
               (LETT #9# |lv|) G190
               (COND
                ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#)) NIL) (> |i| #8#))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |vr| |i| (QVELT |f| 1) (QREFELT % 150))))
               (LETT #9# (PROG1 (CDR #9#) (LETT |i| (+ |i| 1)))) (GO G190) G191
               (EXIT NIL))
          (LETT |dr| (SPADCALL |vr| (QREFELT % 153))) (LETT |nfv| (QCAR |dr|))
          (LETT |tr| (QCDR |dr|)) (LETT |res| NIL)
          (LETT |fg|
                (SEQ
                 (COND
                  ((|FR;all_sqf| |lu| %)
                   (COND ((|FR;all_sqf| |lv| %) (EXIT (CONS 1 "sqfr"))))))
                 (EXIT (CONS 0 "nil"))))
          (SEQ (LETT |j| 1) (LETT #12# (QVSIZE |nfv|)) G190
               (COND ((|greater_SI| |j| #12#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |nf| (SPADCALL |nfv| |j| (QREFELT % 154)))
                      (EXIT
                       (COND
                        ((SPADCALL |nf| (QREFELT % 124))
                         (PROGN (LETT #18# |$NoValue|) (GO #19=#:G590)))
                        ('T
                         (SEQ (LETT |eu| 0)
                              (SEQ (LETT |i| 1) (LETT #13# |nu|) (LETT |f| NIL)
                                   (LETT #14# |lu|) G190
                                   (COND
                                    ((OR (ATOM #14#)
                                         (PROGN (LETT |f| (CAR #14#)) NIL)
                                         (|greater_SI| |i| #13#))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |eu|
                                           (+ |eu|
                                              (* (QVELT |f| 2)
                                                 (SPADCALL |tr| |j| |i|
                                                           (QREFELT %
                                                                    156)))))))
                                   (LETT #14#
                                         (PROG1 (CDR #14#)
                                           (LETT |i| (|inc_SI| |i|))))
                                   (GO G190) G191 (EXIT NIL))
                              (EXIT
                               (COND
                                ((EQL |eu| 0)
                                 (PROGN (LETT #18# |$NoValue|) (GO #19#)))
                                ('T
                                 (SEQ (LETT |ev| 0)
                                      (SEQ (LETT |i| (+ |nu| 1))
                                           (LETT #16# (+ |nu| |nv|))
                                           (LETT |f| NIL) (LETT #17# |lv|) G190
                                           (COND
                                            ((OR (ATOM #17#)
                                                 (PROGN
                                                  (LETT |f| (CAR #17#))
                                                  NIL)
                                                 (> |i| #16#))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |ev|
                                                   (+ |ev|
                                                      (* (QVELT |f| 2)
                                                         (SPADCALL |tr| |j| |i|
                                                                   (QREFELT %
                                                                            156)))))))
                                           (LETT #17#
                                                 (PROG1 (CDR #17#)
                                                   (LETT |i| (+ |i| 1))))
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((EQL |ev| 0)
                                         (PROGN
                                          (LETT #18# |$NoValue|)
                                          (GO #19#)))
                                        ('T
                                         (LETT |res|
                                               (CONS
                                                (VECTOR |fg| |nf|
                                                        (MIN |eu| |ev|))
                                                |res|)))))))))))))))
                #19# (EXIT #18#))
               (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
          (LETT |res|
                (COND ((QREFELT % 34) (|FR;group_terms!| |res| %)) ('T |res|)))
          (EXIT (|FR;mkFF| (|spadConstant| % 15) |res| %))))) 

(SDEFUN |FR;gcd;3%;59| ((|u| (%)) (|v| (%)) (% (%)))
        (SPROG
         ((|#G137| #1=(|NonNegativeInteger|)) (|#G138| #1#) (|nu| #1#)
          (|nv| #1#)
          (|#G139|
           #2=(|List|
               (|Record|
                (|:| |flag| (|Union| #3="nil" #4="sqfr" #5="irred" #6="prime"))
                (|:| |factor| R) (|:| |exponent| (|NonNegativeInteger|)))))
          (|#G140| #2#) (|lu| #2#) (|lv| #2#) (|u1| NIL) (#7=#:G636 NIL)
          (|v1| NIL) (#8=#:G637 NIL)
          (|res|
           (|List|
            (|Record| (|:| |flag| (|Union| #3# #4# #5# #6#)) (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#9=#:G635 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |u| (QREFELT % 53)) (SPADCALL |v| (QREFELT % 53)))
            (|spadConstant| % 48))
           ('T
            (COND ((SPADCALL |u| (QREFELT % 52)) |v|)
                  ((SPADCALL |v| (QREFELT % 52)) |u|)
                  (#10='T
                   (SEQ (LETT |lu| (SPADCALL |u| (QREFELT % 11)))
                        (LETT |lv| (SPADCALL |v| (QREFELT % 11)))
                        (COND
                         ((|FR;all_primes| |lu| %)
                          (COND
                           ((NULL (|FR;all_primes| |lv| %))
                            (EXIT (|FR;gcd1| |lu| |lv| %)))))
                         (#10# (EXIT (|FR;gcd1| |lu| |lv| %))))
                        (LETT |res| NIL)
                        (PROGN
                         (LETT |#G137| (LENGTH |lu|))
                         (LETT |#G138| (LENGTH |lv|))
                         (LETT |nu| |#G137|)
                         (LETT |nv| |#G138|))
                        (COND
                         ((> |nu| |nv|)
                          (PROGN
                           (LETT |#G139| |lv|)
                           (LETT |#G140| |lu|)
                           (LETT |lu| |#G139|)
                           (LETT |lv| |#G140|))))
                        (SEQ (LETT |u1| NIL) (LETT #7# |lu|) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |u1| (CAR #7#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |v1| NIL) (LETT #8# |lv|) G190
                                    (COND
                                     ((OR (ATOM #8#)
                                          (PROGN (LETT |v1| (CAR #8#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL (QVELT |u1| 1) (QVELT |v1| 1)
                                                  (QREFELT % 17))
                                        (SEQ
                                         (LETT |res|
                                               (CONS
                                                (VECTOR
                                                 (|FR;stricterFlag|
                                                  (QVELT |u1| 0) (QVELT |v1| 0)
                                                  %)
                                                 (QVELT |u1| 1)
                                                 (MIN (QVELT |u1| 2)
                                                      (QVELT |v1| 2)))
                                                |res|))
                                         (EXIT
                                          (PROGN
                                           (LETT #9# 1)
                                           (GO #11=#:G627))))))))
                                    (LETT #8# (CDR #8#)) (GO G190) G191
                                    (EXIT NIL)))
                              #11# (EXIT #9#))
                             (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (|FR;mkFF| (|spadConstant| % 15) (NREVERSE |res|)
                          %)))))))))) 

(SDEFUN |FR;+;3%;60| ((|u| (%)) (|v| (%)) (% (%)))
        (COND ((SPADCALL |u| (QREFELT % 52)) |v|)
              ((SPADCALL |v| (QREFELT % 52)) |u|)
              ('T
               (SPADCALL
                (SPADCALL (SPADCALL |u| (QREFELT % 67))
                          (SPADCALL |v| (QREFELT % 67)) (QREFELT % 148))
                1 (QREFELT % 41))))) 

(SDEFUN |FR;prime?;%B;61| ((|u| (%)) (% (|Boolean|)))
        (SPROG
         ((|l|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| R)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |l| (SPADCALL |u| (QREFELT % 11)))
              (EXIT
               (COND
                ((SPADCALL |l| 1 (QREFELT % 51))
                 (COND
                  ((EQL (QVELT (|SPADfirst| |l|) 2) 1)
                   (QEQCAR (QVELT (|SPADfirst| |l|) 0) 3))
                  (#1='T NIL)))
                (#1# NIL)))))) 

(DECLAIM (NOTINLINE |Factored;|)) 

(DEFUN |Factored;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G654 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Factored| DV$1))
          (LETT % (GETREFV 164))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|)))
                                              (|HasCategory| |#1|
                                                             '(|DifferentialRing|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             (LIST
                                                              '|InnerEvalable|
                                                              '(|Symbol|)
                                                              (|devaluate|
                                                               |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Eltable|
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|InnerEvalable|
                                                               (|Symbol|) %))
                                              (|HasCategory| |#1|
                                                             '(|Evalable| %))
                                              (|HasCategory| |#1|
                                                             '(|Eltable| % %))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#1|
                                                             '(|UniqueFactorizationDomain|))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|GcdDomain|)))
                                              (OR #1#
                                                  (|HasCategory| |#1|
                                                                 '(|UniqueFactorizationDomain|)))
                                              (|HasCategory| |#1|
                                                             '(|RealConstant|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))))))
          (|haddProp| |$ConstructorCache| '|Factored| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |unt| |#1|)
                              (|:| |fct|
                                   (|List|
                                    (|Record|
                                     (|:| |flag|
                                          (|Union| "nil" "sqfr" "irred"
                                                   "prime"))
                                     (|:| |factor| |#1|)
                                     (|:| |exponent|
                                          (|NonNegativeInteger|)))))))
          (COND
           ((|testBitVector| |pv$| 12)
            (QSETREFV % 31 (CONS (|dispatchFunction| |FR;convert;%If;1|) %))))
          (QSETREFV % 32 (|HasCategory| |#1| '(|OrderedSet|)))
          (QSETREFV % 33 (|HasCategory| |#1| '(|Comparable|)))
          (QSETREFV % 34
                    (COND ((QREFELT % 32) 'T)
                          ((QREFELT % 33) (|HasCategory| |#1| '(|Canonical|)))
                          ('T NIL)))
          (COND
           ((|testBitVector| |pv$| 17)
            (PROGN
             (QSETREFV % 72 (CONS (|dispatchFunction| |FR;rational?;%B;24|) %))
             (QSETREFV % 76
                       (CONS (|dispatchFunction| |FR;rationalIfCan;%U;25|) %))
             (QSETREFV % 74
                       (CONS (|dispatchFunction| |FR;rational;%F;26|) %)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (QSETREFV % 84 (CONS (|dispatchFunction| |FR;elt;3%;27|) %))))
          (COND
           ((|testBitVector| |pv$| 5)
            (QSETREFV % 93 (CONS (|dispatchFunction| |FR;eval;%L%;28|) %))))
          (COND
           ((|testBitVector| |pv$| 4)
            (QSETREFV % 97 (CONS (|dispatchFunction| |FR;eval;%LL%;29|) %))))
          (COND
           ((|testBitVector| |pv$| 16)
            (PROGN
             (QSETREFV % 103 (CONS (|dispatchFunction| |FR;convert;%F;30|) %))
             (QSETREFV % 106
                       (CONS (|dispatchFunction| |FR;convert;%Df;31|) %)))))
          (COND
           ((|testBitVector| |pv$| 17)
            (QSETREFV % 55 (CONS (|dispatchFunction| |FR;coerce;R%;40|) %)))
           ((|testBitVector| |pv$| 13)
            (QSETREFV % 55 (CONS (|dispatchFunction| |FR;coerce;R%;41|) %)))
           ('T
            (QSETREFV % 55 (CONS (|dispatchFunction| |FR;coerce;R%;42|) %))))
          (COND
           ((|HasCategory| |#1| '(|OrderedSet|))
            (QSETREFV % 141
                      (CONS (|dispatchFunction| |FR;mergeFactors;3%;49|) %)))
           ('T
            (QSETREFV % 141
                      (CONS (|dispatchFunction| |FR;mergeFactors;3%;50|) %))))
          (COND
           ((|testBitVector| |pv$| 14)
            (PROGN
             (QSETREFV % 136 (CONS (|dispatchFunction| |FR;+;3%;55|) %))
             (QSETREFV % 147 (CONS (|dispatchFunction| |FR;gcd;3%;59|) %))))
           ('T (QSETREFV % 136 (CONS (|dispatchFunction| |FR;+;3%;60|) %))))
          (COND
           ((|testBitVector| |pv$| 13)
            (QSETREFV % 157 (CONS (|dispatchFunction| |FR;prime?;%B;61|) %))))
          %))) 

(DEFUN |Factored| (#1=#:G655)
  (SPROG NIL
         (PROG (#2=#:G656)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Factored|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Factored;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Factored|)))))))))) 

(MAKEPROP '|Factored| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 8) (|:| |factor| 6) (|:| |exponent| 39))
              (|List| 9) |FR;factorList;%L;9| |FR;unit;%R;10| (|InputForm|)
              (0 . |convert|) (5 . |1|) (|Boolean|) (9 . =) (|Void|) (|String|)
              (|OutputForm|) (15 . |messagePrint|) (|InputFormFunctions1| 6)
              (20 . |coerceToType|) (|Integer|) (25 . |convert|) (|Symbol|)
              (30 . |convert|) (35 . ~=) (|List| %) (41 . |binary|)
              (47 . |convert|) '|ordered_R?| '|comparable_R?| '|has_order?|
              (52 . <) (58 . |smaller?|) (|Mapping| 16 9 9) (64 . |sort!|)
              (|NonNegativeInteger|) |FR;flagFactor;RNniU%;46|
              |FR;nilFactor;RNni%;4| |FR;sqfrFactor;RNni%;5|
              |FR;irreducibleFactor;RNni%;6| |FR;primeFactor;RNni%;7|
              (70 . |zero?|) |FR;unit?;%B;8| |FR;numberOfFactors;%Nni;11|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;1;%;14|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FR;0;%;12|) %))
              (75 . |0|) (79 . |size?|) |FR;zero?;%B;13| |FR;one?;%B;15|
              (85 . |coerce|) (90 . |coerce|) |FR;coerce;I%;17|
              (95 . |characteristic|) |FR;characteristic;Nni;18| |FR;*;3%;34|
              |FR;*;I2%;19| |FR;*;R2%;20|
              (|Record| (|:| |factor| 6) (|:| |exponent| 39)) (|List| 62)
              |FR;factors;%L;21| (99 . ^) (105 . *) |FR;expand;%R;22|
              (111 . |setrest!|) (117 . |setfirst!|) |FR;unitNormalize;2%;54|
              |FR;makeFR;RL%;23| (123 . |rational?|) (|Fraction| 24)
              (128 . |rational|) (|Union| 73 '"failed") (133 . |rationalIfCan|)
              (138 . |convert|) (143 . |coerce|) (148 . ^) (154 . *)
              (160 . |1|) (164 . *) (170 . |elt|) (176 . |elt|) (|Equation| $$)
              (182 . |lhs|) (187 . |rhs|) (|Equation| 6) (192 . =) (|List| 88)
              (198 . |eval|) (|List| 159) (204 . |eval|) (|List| 26) (|List| 6)
              (210 . |eval|) (217 . |eval|) (|Float|) (224 . |convert|)
              (229 . ^) (235 . *) (241 . |1|) (245 . |convert|) (|DoubleFloat|)
              (250 . |convert|) (255 . |convert|) (260 . |concat!|)
              (266 . |copy|) |FR;^;%Nni%;35| (271 . |coerce|) (276 . |coerce|)
              (281 . ^) (287 . *) (|Mapping| 20 20 20) (|List| 20)
              (293 . |reduce|) |FR;coerce;%Of;36| |FR;retract;%R;37|
              (|Union| 6 '"failed") |FR;retractIfCan;%U;38| (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (299 . |factor|)
              (304 . |unit?|) (|Factored| %) (309 . |squareFree|) (314 . ~=)
              |FR;=;2%B;43| (320 . -) |FR;-;2%;44| (|Union| % '"failed")
              (325 . |recip|) |FR;recip;%U;45| (330 . *) |FR;exquo;2%U;52|
              (336 . +) (|Mapping| 6 6) |FR;differentiate;%M%;47|
              |FR;map;M2%;48| (342 . |merge|) (349 . |mergeFactors|)
              (355 . |append|) (361 . |exquo|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (367 . |unitNormal|) |FR;unitNormal;%R;53| (372 . |gcd|)
              (378 . +) (|Vector| 6) (384 . |setelt!|)
              (|Record| (|:| |basis| 149) (|:| |transform| 155)) (|GcdBasis| 6)
              (391 . |gcdDecomposition|) (396 . |elt|) (|Matrix| 24)
              (402 . |elt|) (409 . |prime?|) (|PositiveInteger|) (|Equation| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|SparseUnivariatePolynomial| %) (|List| 39)
              (|Union| 24 '"failed"))
           '#(~= 414 |zero?| 420 |unitNormalize| 425 |unitNormal| 430
              |unitCanonical| 435 |unit?| 440 |unit| 445 |subtractIfCan| 450
              |squareFreePart| 456 |squareFree| 461 |sqfrFactor| 466 |sample|
              472 |rightRecip| 476 |rightPower| 481 |retractIfCan| 493
              |retract| 508 |recip| 523 |rationalIfCan| 528 |rational?| 533
              |rational| 538 |primeFactor| 543 |prime?| 549 |plenaryPower| 554
              |opposite?| 560 |one?| 566 |numberOfFactors| 571 |nilFactor| 576
              |mergeFactors| 582 |map| 588 |makeFR| 594 |leftRecip| 600
              |leftPower| 605 |lcmCoef| 617 |lcm| 623 |latex| 634
              |irreducibleFactor| 639 |gcdPolynomial| 645 |gcd| 651
              |flagFactor| 662 |factors| 669 |factorList| 674 |factor| 679
              |exquo| 684 |expand| 690 |eval| 695 |elt| 775 |differentiate| 787
              |convert| 837 |commutator| 852 |coerce| 858 |characteristic| 883
              |associator| 887 |associates?| 894 |antiCommutator| 900
              |annihilate?| 906 ^ 912 D 924 = 974 |1| 980 |0| 984 - 988 + 999 *
              1005)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(13 15 0 14 0 0 2 1 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 16 10 8
                                  7 5 0 0 0 16 16 12 11 10 9 8 7 6 5 4 3 0 0 0
                                  0 0 0))
            (CONS
             '#(|UniqueFactorizationDomain&| |GcdDomain&| NIL NIL
                |DifferentialExtension&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| |EntireRing&| |Algebra&|
                NIL NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |Module&| |Module&|
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyEvalableOver&| |FullyRetractableTo&| NIL |Evalable&|
                |RetractableTo&| |RetractableTo&| |Evalable&| |SetCategory&|
                NIL |RetractableTo&| NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL |InnerEvalable&| |InnerEvalable&|
                NIL NIL |BasicType&| NIL NIL NIL NIL)
             (CONS
              '#((|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|DifferentialExtension| 6)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 26) (|Algebra| $$) (|EntireRing|)
                 (|Algebra| 6) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|SemiRng|) (|Module| $$) (|Module| 6) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 6 6) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyEvalableOver| 6)
                 (|FullyRetractableTo| 6) (|RealConstant|) (|Evalable| $$)
                 (|RetractableTo| 24) (|RetractableTo| 73) (|Evalable| 6)
                 (|SetCategory|) (|CommutativeStar|) (|RetractableTo| 6)
                 (|ConvertibleTo| 98) (|ConvertibleTo| 104)
                 (|ConvertibleTo| 13) (|Eltable| $$ $$) (|InnerEvalable| $$ $$)
                 (|InnerEvalable| 26 $$) (|CoercibleFrom| 24)
                 (|CoercibleFrom| 73) (|Eltable| 6 $$) (|InnerEvalable| 6 6)
                 (|InnerEvalable| 26 6) (|CharacteristicZero|)
                 (|CoercibleTo| 20) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 163
                                  '(1 6 13 0 14 0 6 0 15 2 6 16 0 0 17 1 20 18
                                    19 21 1 22 13 13 23 1 13 0 24 25 1 13 0 26
                                    27 2 6 16 0 0 28 2 13 0 0 29 30 1 0 13 0 31
                                    2 6 16 0 0 35 2 6 16 0 0 36 2 10 0 37 0 38
                                    1 6 16 0 45 0 6 0 50 2 10 16 0 39 51 1 6 0
                                    24 54 1 0 0 6 55 0 6 39 57 2 6 0 0 39 65 2
                                    6 0 0 0 66 2 10 0 0 0 68 2 10 9 0 9 69 1 0
                                    16 0 72 1 0 73 0 74 1 0 75 0 76 1 6 24 0 77
                                    1 73 0 24 78 2 73 0 0 24 79 2 73 0 0 73 80
                                    0 73 0 81 2 73 0 24 0 82 2 0 0 0 6 83 2 0 0
                                    0 0 84 1 85 2 0 86 1 85 2 0 87 2 88 0 6 6
                                    89 2 0 0 0 90 91 2 0 0 0 92 93 3 0 0 0 94
                                    95 96 3 0 0 0 94 29 97 1 6 98 0 99 2 98 0 0
                                    24 100 2 98 0 0 0 101 0 98 0 102 1 0 98 0
                                    103 1 6 104 0 105 1 0 104 0 106 2 10 0 0 0
                                    107 1 10 0 0 108 1 6 20 0 110 1 39 20 0 111
                                    2 20 0 0 0 112 2 20 0 0 0 113 2 115 20 114
                                    0 116 1 122 121 6 123 1 6 16 0 124 1 6 125
                                    0 126 2 39 16 0 0 127 1 6 0 0 129 1 6 131 0
                                    132 2 6 0 24 0 134 2 0 0 0 0 136 3 10 0 37
                                    0 0 140 2 0 0 0 0 141 2 10 0 0 0 142 2 6
                                    131 0 0 143 1 6 144 0 145 2 0 0 0 0 147 2 6
                                    0 0 0 148 3 149 6 0 24 6 150 1 152 151 149
                                    153 2 149 6 0 24 154 3 155 24 0 24 24 156 1
                                    0 16 0 157 2 0 16 0 0 1 1 0 16 0 52 1 0 0 0
                                    70 1 0 144 0 146 1 0 0 0 1 1 0 16 0 46 1 0
                                    6 0 12 2 0 131 0 0 1 1 13 0 0 1 1 13 125 0
                                    1 2 0 0 6 39 42 0 0 0 1 1 0 131 0 1 2 0 0 0
                                    158 1 2 0 0 0 39 1 1 0 119 0 120 1 7 75 0 1
                                    1 8 163 0 1 1 0 6 0 118 1 7 73 0 1 1 8 24 0
                                    1 1 0 131 0 133 1 17 75 0 76 1 17 16 0 72 1
                                    17 73 0 74 2 0 0 6 39 44 1 13 16 0 157 2 0
                                    0 0 158 1 2 0 16 0 0 1 1 0 16 0 53 1 0 39 0
                                    47 2 0 0 6 39 41 2 0 0 0 0 141 2 0 0 137 0
                                    139 2 0 0 6 10 71 1 0 131 0 1 2 0 0 0 158 1
                                    2 0 0 0 39 1 2 14 160 0 0 1 2 14 0 0 0 1 1
                                    14 0 29 1 1 0 19 0 1 2 0 0 6 39 43 2 14 161
                                    161 161 1 2 14 0 0 0 147 1 14 0 29 1 3 0 0
                                    6 39 8 40 1 0 63 0 64 1 0 10 0 11 1 13 125
                                    0 1 2 0 131 0 0 135 1 0 6 0 67 3 10 0 0 29
                                    29 1 3 10 0 0 0 0 1 2 10 0 0 92 93 2 10 0 0
                                    159 1 3 5 0 0 95 95 1 3 5 0 0 6 6 1 2 5 0 0
                                    90 91 2 5 0 0 88 1 3 9 0 0 26 0 1 3 9 0 0
                                    94 29 97 3 4 0 0 26 6 1 3 4 0 0 94 95 96 2
                                    11 0 0 0 84 2 6 0 0 6 83 3 0 0 0 137 39 1 2
                                    0 0 0 137 138 1 2 0 0 1 2 2 0 0 39 1 2 1 0
                                    0 94 1 2 1 0 0 26 1 3 1 0 0 94 162 1 3 1 0
                                    0 26 39 1 1 12 13 0 31 1 16 98 0 103 1 16
                                    104 0 106 2 0 0 0 0 1 1 0 20 0 117 1 0 0 24
                                    56 1 0 0 0 1 1 0 0 6 55 1 7 0 73 1 0 0 39
                                    58 3 0 0 0 0 0 1 2 0 16 0 0 1 2 0 0 0 0 1 2
                                    0 16 0 0 1 2 0 0 0 158 1 2 0 0 0 39 109 2 0
                                    0 0 137 1 3 0 0 0 137 39 1 1 2 0 0 1 2 2 0
                                    0 39 1 2 1 0 0 26 1 3 1 0 0 26 39 1 2 1 0 0
                                    94 1 3 1 0 0 94 162 1 2 0 16 0 0 128 0 0 0
                                    48 0 0 0 49 2 0 0 0 0 1 1 0 0 0 130 2 0 0 0
                                    0 136 2 0 0 158 0 1 2 0 0 0 0 59 2 0 0 24 0
                                    60 2 0 0 39 0 1 2 0 0 6 0 61 2 0 0 0 6
                                    1)))))
           '|lookupComplete|)) 
