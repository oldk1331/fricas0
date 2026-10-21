
(SDEFUN |JBLF;monom| ((|c| (D)) (|jv| (JB)) (% (|OutputForm|)))
        (COND ((SPADCALL |c| (QREFELT % 13)) (SPADCALL |jv| (QREFELT % 15)))
              ((SPADCALL |jv| (QREFELT % 16)) (SPADCALL |c| (QREFELT % 17)))
              ('T
               (SPADCALL (SPADCALL |c| (QREFELT % 17))
                         (SPADCALL |jv| (QREFELT % 15)) (QREFELT % 18))))) 

(SDEFUN |JBLF;coerce;%Of;2| ((|l| (%)) (% (|OutputForm|)))
        (SPROG
         ((|jv| NIL) (#1=#:G65 NIL) (|c| NIL) (#2=#:G64 NIL)
          (|res| (|OutputForm|)))
         (SEQ
          (COND ((SPADCALL |l| (QREFELT % 19)) (SPADCALL 0 (QREFELT % 21)))
                ('T
                 (SEQ
                  (LETT |res|
                        (|JBLF;monom| (|SPADfirst| (QCAR |l|))
                         (|SPADfirst| (QCDR |l|)) %))
                  (SEQ (LETT |jv| NIL) (LETT #1# (CDR (QCDR |l|)))
                       (LETT |c| NIL) (LETT #2# (CDR (QCAR |l|))) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL)
                             (ATOM #1#) (PROGN (LETT |jv| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res| (|JBLF;monom| |c| |jv| %)
                                         (QREFELT % 22)))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(SDEFUN |JBLF;coerce;JB%;3| ((|jv| (JB)) (% (%)))
        (SPROG ((|jt| (|Symbol|)))
               (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
                    (EXIT
                     (COND ((EQUAL |jt| '|Const|) (|spadConstant| % 26))
                           ((EQUAL |jt| '|Indep|)
                            (CONS (LIST (SPADCALL |jv| (QREFELT % 27)))
                                  (LIST (|spadConstant| % 28))))
                           ('T
                            (CONS (LIST (|spadConstant| % 29))
                                  (LIST |jv|)))))))) 

(SDEFUN |JBLF;coerce;D%;4| ((|ex| (D)) (% (%)))
        (COND ((SPADCALL |ex| (QREFELT % 31)) (|spadConstant| % 32))
              ('T (CONS (LIST |ex|) (LIST (|spadConstant| % 28)))))) 

(SDEFUN |JBLF;coerce;SemL;5|
        ((|jm| (|SparseEchelonMatrix| JB D)) (% (|List| %)))
        (SPROG
         ((|i| NIL) (#1=#:G78 NIL)
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| D))))
          (|res| (|List| %)))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |jm| (QREFELT % 35))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |r| (SPADCALL |jm| |i| (QREFELT % 38)))
                        (EXIT
                         (COND
                          ((NULL (NULL (QCAR |r|)))
                           (LETT |res|
                                 (SPADCALL (CONS (QCDR |r|) (QCAR |r|)) |res|
                                           (QREFELT % 40)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 41)))))) 

(SDEFUN |JBLF;coerce;LSem;6|
        ((|ll| (|List| %)) (% (|SparseEchelonMatrix| JB D)))
        (SPROG
         ((#1=#:G88 NIL) (|inds| (|List| JB))
          (|res| (|SparseEchelonMatrix| JB D)) (|i| NIL) (|l| NIL)
          (#2=#:G89 NIL))
         (SEQ (LETT |inds| NIL)
              (SEQ (LETT |l| NIL) (LETT #1# |ll|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |l| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT % 44) |inds| (QCDR |l|)
                                      (QREFELT % 47))
                            (QREFELT % 48)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |ll| (QREFELT % 49))
                              (QREFELT % 50)))
              (SEQ (LETT |i| 1) (LETT |l| NIL) (LETT #2# |ll|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |l| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |res| |i| (QCDR |l|) (QCAR |l|)
                               (QREFELT % 53))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;ground?;%B;7| ((|l| (%)) (% (|Boolean|)))
        (COND ((SPADCALL |l| (QREFELT % 19)) 'T)
              ('T (SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT % 16))))) 

(SDEFUN |JBLF;ground;2%;8| ((|l| (%)) (% (%)))
        (COND
         ((NULL (SPADCALL (|spadConstant| % 28) (QCDR |l|) (QREFELT % 56)))
          (|spadConstant| % 32))
         ('T
          (CONS (LIST (SPADCALL (QCAR |l|) (QREFELT % 57)))
                (LIST (|spadConstant| % 28)))))) 

(SDEFUN |JBLF;retractIfCan;%U;9| ((|l| (%)) (% (|Union| D "failed")))
        (COND ((SPADCALL |l| (QREFELT % 19)) (CONS 0 (|spadConstant| % 59)))
              ((SPADCALL (|SPADfirst| (QCDR |l|)) (QREFELT % 16))
               (CONS 0 (|SPADfirst| (QCAR |l|))))
              ('T (CONS 1 "failed")))) 

(MAKEPROP '|JBLF;numerator;2%;10| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |JBLF;numerator;2%;10| ((|l| (%)) (% (%))) |l|) 

(SDEFUN |JBLF;denominator;2%;11| ((|l| (%)) (% (%))) (|spadConstant| % 26)) 

(SDEFUN |JBLF;retractIfCan;JbeU;12|
        ((|ex| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG
         ((|pd| #1=(|Union| D "failed")) (|resJ| (|List| JB)) (|jv| NIL)
          (#2=#:G123 NIL) (|cd| #1#) (#3=#:G122 NIL) (|resC| (|List| D)))
         (SEQ
          (EXIT
           (SEQ (LETT |pd| (SPADCALL |ex| (QREFELT % 66)))
                (EXIT
                 (COND
                  ((QEQCAR |pd| 0)
                   (CONS 0
                         (CONS (LIST (QCDR |pd|))
                               (LIST (|spadConstant| % 28)))))
                  ('T
                   (SEQ (LETT |resJ| (SPADCALL |ex| (QREFELT % 67)))
                        (LETT |resC| NIL)
                        (SEQ (LETT |jv| NIL) (LETT #2# |resJ|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |jv| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |cd|
                                    (SPADCALL
                                     (SPADCALL |ex| |jv| (QREFELT % 68))
                                     (QREFELT % 66)))
                              (EXIT
                               (COND
                                ((QEQCAR |cd| 1)
                                 (PROGN
                                  (LETT #3# (CONS 1 "failed"))
                                  (GO #4=#:G121)))
                                ('T (LETT |resC| (CONS (QCDR |cd|) |resC|))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 0 (CONS (NREVERSE |resC|) |resJ|)))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |JBLF;retract;Jbe%;13| ((|ex| (|JetBundleExpression| JB)) (% (%)))
        (SPROG ((|pl| (|Union| % "failed")))
               (SEQ (LETT |pl| (SPADCALL |ex| (QREFELT % 69)))
                    (EXIT
                     (COND ((QEQCAR |pl| 1) (|error| "non-linear function"))
                           ('T (QCDR |pl|))))))) 

(SDEFUN |JBLF;coerce;%Jbe;14| ((|l| (%)) (% (|JetBundleExpression| JB)))
        (SPROG
         ((#1=#:G135 NIL) (|v| NIL) (#2=#:G137 NIL) (|c| NIL) (#3=#:G136 NIL))
         (SEQ
          (SPADCALL (ELT % 71)
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |v| NIL) (LETT #2# (QCDR |l|)) (LETT |c| NIL)
                          (LETT #3# (QCAR |l|)) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |c| (CAR #3#)) NIL)
                                (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (SPADCALL (SPADCALL |c| (QREFELT % 72))
                                             (SPADCALL |v| (QREFELT % 73))
                                             (QREFELT % 74))
                                   #1#))))
                          (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#))))
                          (GO G190) G191 (EXIT (NREVERSE #1#))))
                    (|spadConstant| % 75) (QREFELT % 79))))) 

(SDEFUN |JBLF;zero?;%B;15| ((|l| (%)) (% (|Boolean|))) (NULL (QCDR |l|))) 

(SDEFUN |JBLF;=;2%B;16| ((|l1| (%)) (|l2| (%)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |l1| |l2| (QREFELT % 81)) (QREFELT % 19))) 

(MAKEPROP '|JBLF;0;%;17| '|SPADreplace| '(XLAM NIL (CONS NIL NIL))) 

(SDEFUN |JBLF;0;%;17| ((% (%))) (CONS NIL NIL)) 

(SDEFUN |JBLF;1;%;18| ((% (%)))
        (CONS (LIST (|spadConstant| % 29)) (LIST (|spadConstant| % 28)))) 

(SDEFUN |JBLF;-;2%;19| ((|l| (%)) (% (%)))
        (SPROG ((#1=#:G145 NIL) (|c| NIL) (#2=#:G146 NIL))
               (SEQ
                (CONS
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |c| NIL) (LETT #2# (QCAR |l|)) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1# (CONS (SPADCALL |c| (QREFELT % 83)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QCDR |l|))))) 

(SDEFUN |JBLF;+;3%;20| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG
         ((|j1| NIL) (#1=#:G166 NIL) (|c1| NIL) (#2=#:G165 NIL) (|sum| (D))
          (|resC| (|List| D)) (|resJ| (|List| JB)) (|lc2| (|List| D))
          (|lj2| (|List| JB)))
         (SEQ
          (COND ((SPADCALL |l1| (QREFELT % 19)) |l2|)
                ((SPADCALL |l2| (QREFELT % 19)) |l1|)
                ('T
                 (SEQ (LETT |lc2| (SPADCALL (QCAR |l2|) (QREFELT % 85)))
                      (LETT |lj2| (SPADCALL (QCDR |l2|) (QREFELT % 86)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j1| NIL) (LETT #1# (QCDR |l1|))
                           (LETT |c1| NIL) (LETT #2# (QCAR |l1|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |c1| (CAR #2#)) NIL)
                                 (ATOM #1#) (PROGN (LETT |j1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (COND ((NULL |lj2|) NIL)
                                          ('T
                                           (SPADCALL (|SPADfirst| |lj2|) |j1|
                                                     (QREFELT % 44)))))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |resC|
                                        (CONS (|SPADfirst| |lc2|) |resC|))
                                  (LETT |resJ|
                                        (CONS (|SPADfirst| |lj2|) |resJ|))
                                  (LETT |lc2| (CDR |lc2|))
                                  (EXIT (LETT |lj2| (CDR |lj2|))))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((OR (NULL |lj2|)
                                   (NULL
                                    (SPADCALL (|SPADfirst| |lj2|) |j1|
                                              (QREFELT % 87))))
                               (SEQ (LETT |resC| (CONS |c1| |resC|))
                                    (EXIT (LETT |resJ| (CONS |j1| |resJ|)))))
                              ('T
                               (SEQ
                                (LETT |sum|
                                      (SPADCALL |c1| (|SPADfirst| |lc2|)
                                                (QREFELT % 88)))
                                (COND
                                 ((NULL (SPADCALL |sum| (QREFELT % 31)))
                                  (SEQ (LETT |resC| (CONS |sum| |resC|))
                                       (EXIT
                                        (LETT |resJ| (CONS |j1| |resJ|))))))
                                (LETT |lc2| (CDR |lc2|))
                                (EXIT (LETT |lj2| (CDR |lj2|))))))))
                           (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (CONS (SPADCALL (NREVERSE |resC|) |lc2| (QREFELT % 89))
                             (SPADCALL (NREVERSE |resJ|) |lj2|
                                       (QREFELT % 90)))))))))) 

(SDEFUN |JBLF;*;I2%;21| ((|i| (|Integer|)) (|l| (%)) (% (%)))
        (SPROG ((#1=#:G172 NIL) (|c| NIL) (#2=#:G173 NIL))
               (SEQ
                (COND ((ZEROP |i|) (|spadConstant| % 32)) ((EQL |i| 1) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |c| NIL) (LETT #2# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |i| |c| (QREFELT % 92))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;D2%;22| ((|ex| (D)) (|l| (%)) (% (%)))
        (SPROG ((#1=#:G179 NIL) (|c| NIL) (#2=#:G180 NIL))
               (SEQ
                (COND ((SPADCALL |ex| (QREFELT % 31)) (|spadConstant| % 32))
                      ((SPADCALL |ex| (QREFELT % 13)) |l|)
                      ('T
                       (CONS
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |c| NIL) (LETT #2# (QCAR |l|)) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |c| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |ex| |c| (QREFELT % 94))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))
                        (QCDR |l|))))))) 

(SDEFUN |JBLF;*;3%;23| ((|l1| (%)) (|l2| (%)) (% (%)))
        (COND
         ((OR (SPADCALL |l1| (QREFELT % 19)) (SPADCALL |l2| (QREFELT % 19)))
          (|spadConstant| % 32))
         ('T
          (COND
           ((SPADCALL (QCDR |l1|) (LIST (|spadConstant| % 28)) (QREFELT % 96))
            (SPADCALL (|SPADfirst| (QCAR |l1|)) |l2| (QREFELT % 95)))
           ((SPADCALL (QCDR |l2|) (LIST (|spadConstant| % 28)) (QREFELT % 96))
            (SPADCALL (|SPADfirst| (QCAR |l2|)) |l1| (QREFELT % 95)))
           ('T (|error| "non-linear function")))))) 

(SDEFUN |JBLF;recip;%U;24| ((|l| (%)) (% (|Union| % "failed")))
        (SPROG ((|rc| (|Union| D "failed")))
               (SEQ
                (COND
                 ((SPADCALL (QCDR |l|) (LIST (|spadConstant| % 28))
                            (QREFELT % 96))
                  (SEQ
                   (LETT |rc|
                         (SPADCALL (|SPADfirst| (QCAR |l|)) (QREFELT % 98)))
                   (EXIT
                    (COND
                     ((QEQCAR |rc| 0)
                      (CONS 0 (SPADCALL (QCDR |rc|) (QREFELT % 33))))
                     (#1='T (CONS 1 "failed"))))))
                 (#1# (CONS 1 "failed")))))) 

(SDEFUN |JBLF;exquo;2%U;25| ((|l1| (%)) (|l2| (%)) (% (|Union| % #1="failed")))
        (SPROG
         ((|d| (D)) (|c| NIL) (#2=#:G211 NIL) (|e| (|Union| D #1#))
          (#3=#:G210 NIL) (|newC| (|List| D)))
         (SEQ
          (EXIT
           (COND
            ((NULL (SPADCALL (|SPADfirst| (QCDR |l2|)) (QREFELT % 16)))
             (CONS 1 "failed"))
            ('T
             (SEQ (LETT |d| (|SPADfirst| (QCAR |l2|))) (LETT |newC| NIL)
                  (SEQ (LETT |c| NIL) (LETT #2# (QCAR |l1|)) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |e| (SPADCALL |c| |d| (QREFELT % 100)))
                            (EXIT
                             (COND
                              ((QEQCAR |e| 1)
                               (PROGN
                                (LETT #3# (CONS 1 "failed"))
                                (GO #4=#:G209)))
                              ('T (LETT |newC| (CONS (QCDR |e|) |newC|))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS 0 (CONS (NREVERSE |newC|) (QCDR |l1|))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |JBLF;gcd;3%;26| ((|l1| (%)) (|l2| (%)) (% (%)))
        (SPROG ((|g| (D)))
               (SEQ
                (COND
                 ((OR (> (LENGTH (QCDR |l1|)) 1) (> (LENGTH (QCDR |l2|)) 1))
                  (|spadConstant| % 26))
                 ('T
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|SPADfirst| (QCAR |l1|))
                                   (|SPADfirst| (QCAR |l2|)) (QREFELT % 102)))
                   (EXIT
                    (COND
                     ((SPADCALL (|SPADfirst| (QCDR |l1|))
                                (|SPADfirst| (QCDR |l2|)) (QREFELT % 87))
                      (CONS (LIST |g|) (QCDR |l1|)))
                     ('T (SPADCALL |g| (QREFELT % 33))))))))))) 

(SDEFUN |JBLF;jetVariables;%L;27| ((|l| (%)) (% (|List| JB)))
        (SPROG ((|c| NIL) (#1=#:G225 NIL) (|res| (|List| JB)))
               (SEQ
                (COND ((SPADCALL |l| (QREFELT % 19)) NIL)
                      (#2='T
                       (SEQ (LETT |res| NIL)
                            (SEQ (LETT |c| NIL) (LETT #1# (QCAR |l|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |c| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |res|
                                         (SPADCALL (ELT % 44) |res|
                                                   (SPADCALL |c|
                                                             (QREFELT % 104))
                                                   (QREFELT % 47)))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |res| (SPADCALL |res| (QREFELT % 48)))
                            (COND
                             ((SPADCALL (|spadConstant| % 28) (QCDR |l|)
                                        (QREFELT % 56))
                              (LETT |res|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 28) (QCDR |l|)
                                               (QREFELT % 105))
                                     |res| (QREFELT % 90))))
                             (#2#
                              (LETT |res|
                                    (SPADCALL (QCDR |l|) |res|
                                              (QREFELT % 106)))))
                            (EXIT |res|))))))) 

(SDEFUN |JBLF;differentiate;%S%;28| ((|l| (%)) (|s| (|Symbol|)) (% (%)))
        (SPROG
         ((|j| NIL) (#1=#:G233 NIL) (|c| NIL) (#2=#:G232 NIL) (|dc| (D))
          (|resC| (|List| D)) (|resJ| (|List| JB)))
         (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
              (SEQ (LETT |j| NIL) (LETT #1# (QCDR |l|)) (LETT |c| NIL)
                   (LETT #2# (QCAR |l|)) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |j| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |dc| (SPADCALL |c| |s| (QREFELT % 108)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |dc| (QREFELT % 31)))
                           (SEQ (LETT |resC| (CONS |dc| |resC|))
                                (EXIT (LETT |resJ| (CONS |j| |resJ|))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))) 

(SDEFUN |JBLF;differentiate;%JB%;29| ((|l| (%)) (|jv| (JB)) (% (%)))
        (SPROG
         ((|jt| (|Symbol|)) (|j| NIL) (#1=#:G243 NIL) (|c| NIL) (#2=#:G242 NIL)
          (|dc| (D)) (|resC| (|List| D)) (|resJ| (|List| JB))
          (|pos| (|Integer|)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |j| NIL) (LETT #1# (QCDR |l|)) (LETT |c| NIL)
                           (LETT #2# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL)
                                 (ATOM #1#) (PROGN (LETT |j| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dc| (SPADCALL |c| |jv| (QREFELT % 110)))
                                (EXIT
                                 (COND
                                  ((NULL (SPADCALL |dc| (QREFELT % 31)))
                                   (SEQ (LETT |resC| (CONS |dc| |resC|))
                                        (EXIT
                                         (LETT |resJ| (CONS |j| |resJ|))))))))
                           (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 111)))
                      (EXIT
                       (COND
                        ((< |pos| (PROGN (QCDR |l|) 1)) (|spadConstant| % 32))
                        (#3#
                         (CONS
                          (LIST (SPADCALL (QCAR |l|) |pos| (QREFELT % 112)))
                          (LIST (|spadConstant| % 28))))))))))))) 

(SDEFUN |JBLF;jacobiMatrix;LSem;30|
        ((|sys| (|List| %)) (% (|SparseEchelonMatrix| JB %)))
        (SPROG
         ((#1=#:G275 NIL) (|inds| (|List| JB)) (#2=#:G276 NIL)
          (|cinds| (|List| JB)) (#3=#:G277 NIL) (#4=#:G278 NIL) (#5=#:G279 NIL)
          (|res| (|SparseEchelonMatrix| JB %)) (|i| NIL) (|eq| NIL)
          (#6=#:G280 NIL) (#7=#:G281 NIL) (#8=#:G282 NIL) (|ents| (|List| %))
          (|cjv| NIL) (#9=#:G283 NIL) (|jv| NIL) (#10=#:G285 NIL) (|co| NIL)
          (#11=#:G284 NIL) (|dco| (D)) (|dJV| (|List| JB)) (|dCo| (|List| D))
          (|rowJ| (|List| JB)) (|rowC| (|List| %)))
         (SEQ (LETT |inds| NIL) (LETT |cinds| NIL)
              (SEQ (LETT |eq| NIL) (LETT #1# |sys|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |eq| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |inds|
                          (SPADCALL
                           (SPADCALL (ELT % 44) |inds| (QCDR |eq|)
                                     (QREFELT % 47))
                           (QREFELT % 48)))
                    (EXIT
                     (SEQ (LETT |co| NIL) (LETT #2# (QCAR |eq|)) G190
                          (COND
                           ((OR (NULL (< (LENGTH |cinds|) (QREFELT % 11)))
                                (ATOM #2#) (PROGN (LETT |co| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT |cinds|
                                  (SPADCALL
                                   (SPADCALL (ELT % 44) |cinds|
                                             (SPADCALL |co| (QREFELT % 104))
                                             (QREFELT % 47))
                                   (QREFELT % 48)))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |cinds|)
                 (SEQ
                  (LETT |res|
                        (SPADCALL |inds| (SPADCALL |sys| (QREFELT % 49))
                                  (QREFELT % 115)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #3# |sys|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |eq| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QCDR |eq|)
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |co| NIL) (LETT #5# (QCAR |eq|))
                                         G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |co| (CAR #5#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL |co|
                                                            (QREFELT % 33))
                                                  #4#))))
                                         (LETT #5# (CDR #5#)) (GO G190) G191
                                         (EXIT (NREVERSE #4#))))
                                   (QREFELT % 116))))
                       (LETT #3# (PROG1 (CDR #3#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))
                ('T
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |inds| |cinds| (QREFELT % 106))
                                  (SPADCALL |sys| (QREFELT % 49))
                                  (QREFELT % 115)))
                  (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #6# |sys|) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |eq| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |ents|
                              (PROGN
                               (LETT #7# NIL)
                               (SEQ (LETT |co| NIL) (LETT #8# (QCAR |eq|)) G190
                                    (COND
                                     ((OR (ATOM #8#)
                                          (PROGN (LETT |co| (CAR #8#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #7#
                                            (CONS
                                             (SPADCALL |co| (QREFELT % 33))
                                             #7#))))
                                    (LETT #8# (CDR #8#)) (GO G190) G191
                                    (EXIT (NREVERSE #7#)))))
                        (LETT |rowJ| NIL) (LETT |rowC| NIL)
                        (SEQ (LETT |cjv| NIL) (LETT #9# |cinds|) G190
                             (COND
                              ((OR (ATOM #9#)
                                   (PROGN (LETT |cjv| (CAR #9#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                  (SEQ (LETT |jv| NIL) (LETT #10# (QCDR |eq|))
                                       (LETT |co| NIL) (LETT #11# (QCAR |eq|))
                                       G190
                                       (COND
                                        ((OR (ATOM #11#)
                                             (PROGN (LETT |co| (CAR #11#)) NIL)
                                             (ATOM #10#)
                                             (PROGN
                                              (LETT |jv| (CAR #10#))
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (LETT |dco|
                                              (SPADCALL |co| |cjv|
                                                        (QREFELT % 110)))
                                        (EXIT
                                         (COND
                                          ((NULL
                                            (SPADCALL |dco| (QREFELT % 31)))
                                           (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                       (LETT #11#
                                             (PROG1 (CDR #11#)
                                               (LETT #10# (CDR #10#))))
                                       (GO G190) G191 (EXIT NIL))
                                  (EXIT
                                   (COND
                                    ((NULL (NULL |dJV|))
                                     (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                          (EXIT
                                           (LETT |rowC|
                                                 (SPADCALL
                                                  (CONS (NREVERSE |dCo|)
                                                        (NREVERSE |dJV|))
                                                  |rowC| (QREFELT % 40)))))))))
                             (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (SPADCALL |res| |i|
                                   (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                             (QREFELT % 106))
                                   (SPADCALL |ents|
                                             (SPADCALL |rowC| (QREFELT % 41))
                                             (QREFELT % 117))
                                   (QREFELT % 116))))
                       (LETT #6# (PROG1 (CDR #6#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT |res|)))))))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;31|
        ((|sys| (|List| %)) (|varlist| (|List| (|List| JB)))
         (% (|SparseEchelonMatrix| JB %)))
        (SPROG
         ((#1=#:G313 NIL) (|inds| (|List| JB))
          (|res| (|SparseEchelonMatrix| JB %)) (|i| NIL) (|vars| NIL)
          (#2=#:G315 NIL) (|eq| NIL) (#3=#:G314 NIL) (#4=#:G316 NIL)
          (#5=#:G317 NIL) (|ents| (|List| %)) (|ivars| (|List| JB)) (|ijv| NIL)
          (#6=#:G318 NIL) (|jv| NIL) (#7=#:G320 NIL) (|co| NIL) (#8=#:G319 NIL)
          (|dco| (D)) (|dJV| (|List| JB)) (|dCo| (|List| D))
          (|rowJ| (|List| JB)) (|rowC| (|List| %)))
         (SEQ (LETT |inds| (|SPADfirst| |varlist|))
              (SEQ (LETT |vars| NIL) (LETT #1# (CDR |varlist|)) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |vars| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |inds|
                           (SPADCALL
                            (SPADCALL (ELT % 44) |inds| |vars| (QREFELT % 47))
                            (QREFELT % 48)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL |inds| (SPADCALL |sys| (QREFELT % 49))
                              (QREFELT % 115)))
              (SEQ (LETT |i| 1) (LETT |vars| NIL) (LETT #2# |varlist|)
                   (LETT |eq| NIL) (LETT #3# |sys|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |eq| (CAR #3#)) NIL)
                         (ATOM #2#) (PROGN (LETT |vars| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |ents|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |co| NIL) (LETT #5# (QCAR |eq|)) G190
                                (COND
                                 ((OR (ATOM #5#)
                                      (PROGN (LETT |co| (CAR #5#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #4#
                                        (CONS (SPADCALL |co| (QREFELT % 33))
                                              #4#))))
                                (LETT #5# (CDR #5#)) (GO G190) G191
                                (EXIT (NREVERSE #4#)))))
                    (LETT |ivars|
                          (SPADCALL (ELT % 120)
                                    (SPADCALL
                                     (CONS #'|JBLF;jacobiMatrix;LLSem;31!0| %)
                                     |vars| (QREFELT % 123))
                                    (QREFELT % 124)))
                    (EXIT
                     (COND
                      ((NULL |ivars|)
                       (SPADCALL |res| |i| (QCDR |eq|) |ents| (QREFELT % 116)))
                      ('T
                       (SEQ (LETT |rowJ| NIL) (LETT |rowC| NIL)
                            (SEQ (LETT |ijv| NIL) (LETT #6# |ivars|) G190
                                 (COND
                                  ((OR (ATOM #6#)
                                       (PROGN (LETT |ijv| (CAR #6#)) NIL))
                                   (GO G191)))
                                 (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                      (SEQ (LETT |jv| NIL)
                                           (LETT #7# (QCDR |eq|))
                                           (LETT |co| NIL)
                                           (LETT #8# (QCAR |eq|)) G190
                                           (COND
                                            ((OR (ATOM #8#)
                                                 (PROGN
                                                  (LETT |co| (CAR #8#))
                                                  NIL)
                                                 (ATOM #7#)
                                                 (PROGN
                                                  (LETT |jv| (CAR #7#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |dco|
                                                  (SPADCALL |co| |ijv|
                                                            (QREFELT % 110)))
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (SPADCALL |dco|
                                                          (QREFELT % 31)))
                                               (SEQ
                                                (LETT |dJV| (CONS |jv| |dJV|))
                                                (EXIT
                                                 (LETT |dCo|
                                                       (CONS |dco|
                                                             |dCo|))))))))
                                           (LETT #8#
                                                 (PROG1 (CDR #8#)
                                                   (LETT #7# (CDR #7#))))
                                           (GO G190) G191 (EXIT NIL))
                                      (EXIT
                                       (COND
                                        ((NULL (NULL |dJV|))
                                         (SEQ (LETT |rowJ| (CONS |ijv| |rowJ|))
                                              (EXIT
                                               (LETT |rowC|
                                                     (SPADCALL
                                                      (CONS (NREVERSE |dCo|)
                                                            (NREVERSE |dJV|))
                                                      |rowC|
                                                      (QREFELT % 40)))))))))
                                 (LETT #6# (CDR #6#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (SPADCALL |res| |i|
                                       (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                                 (QREFELT % 106))
                                       (SPADCALL |ents|
                                                 (SPADCALL |rowC|
                                                           (QREFELT % 41))
                                                 (QREFELT % 117))
                                       (QREFELT % 116))))))))
                   (LETT #3#
                         (PROG1 (CDR #3#)
                           (LETT #2#
                                 (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBLF;jacobiMatrix;LLSem;31!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 25)) '|Indep| (QREFELT % 121))) 

(SDEFUN |JBLF;leadingDer;%JB;32| ((|l| (%)) (% (JB)))
        (COND ((SPADCALL |l| (QREFELT % 19)) (|spadConstant| % 28))
              ('T (|SPADfirst| (QCDR |l|))))) 

(SDEFUN |JBLF;freeOf?;%JBB;33| ((|l| (%)) (|jv| (JB)) (% (|Boolean|)))
        (SPROG ((#1=#:G334 NIL) (|c| NIL) (#2=#:G335 NIL))
               (SEQ
                (COND
                 ((EQUAL (SPADCALL |jv| (QREFELT % 25)) '|Indep|)
                  (SPADCALL (ELT % 129)
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |c| NIL) (LETT #2# (QCAR |l|)) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |c| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL |c| |jv| (QREFELT % 128))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#))))
                            'T (QREFELT % 132)))
                 ('T (NULL (SPADCALL |jv| (QCDR |l|) (QREFELT % 56)))))))) 

(SDEFUN |JBLF;solveFor;%JBU;34|
        ((|l| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG
         ((|jt| (|Symbol|)) (|pos| (|Integer|)) (|rc| (|Union| D "failed"))
          (#1=#:G349 NIL) (|c| NIL) (#2=#:G350 NIL))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (COND
               ((OR (EQUAL |jt| '|Const|) (EQUAL |jt| '|Indep|))
                (EXIT (CONS 1 "failed"))))
              (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 111)))
              (EXIT
               (COND ((< |pos| (PROGN (QCDR |l|) 1)) (CONS 1 "failed"))
                     ((EQL (LENGTH (QCDR |l|)) 1)
                      (CONS 0 (|spadConstant| % 32)))
                     (#3='T
                      (SEQ
                       (LETT |rc|
                             (SPADCALL
                              (SPADCALL (QCAR |l|) |pos| (QREFELT % 134))
                              (QREFELT % 98)))
                       (EXIT
                        (COND ((QEQCAR |rc| 1) (CONS 1 "failed"))
                              (#3#
                               (CONS 0
                                     (CONS
                                      (PROGN
                                       (LETT #1# NIL)
                                       (SEQ (LETT |c| NIL)
                                            (LETT #2#
                                                  (SPADCALL (QCAR |l|) |pos|
                                                            (QREFELT % 135)))
                                            G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |c| (CAR #2#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |c| (QCDR |rc|)
                                                                (QREFELT % 94))
                                                      (QREFELT % 83))
                                                     #1#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT % 136)))))))))))))) 

(SDEFUN |JBLF;subst;%JB2%;35| ((|l| (%)) (|jv| (JB)) (|exp| (%)) (% (%)))
        (SPROG
         ((|jt| (|Symbol|)) (|xexp| (D)) (|cj| NIL) (#1=#:G361 NIL)
          (#2=#:G360 NIL) (|nc| (D)) (|resC| (|List| D)) (|resJ| (|List| JB))
          (|pos| (|Integer|)) (|c| (D)) (|nl| (%)))
         (SEQ (LETT |jt| (SPADCALL |jv| (QREFELT % 25)))
              (EXIT
               (COND
                ((EQUAL |jt| '|Const|)
                 (|error| "Substitution for 1 not allowed"))
                ((EQUAL |jt| '|Indep|)
                 (SEQ (LETT |xexp| (SPADCALL |exp| (QREFELT % 138)))
                      (LETT |resC| NIL) (LETT |resJ| NIL)
                      (SEQ (LETT |cj| NIL) (LETT #1# (QCDR |l|))
                           (LETT #2# (QCAR |l|)) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |c| (CAR #2#)) NIL)
                                 (ATOM #1#) (PROGN (LETT |cj| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (LETT |nc|
                                  (SPADCALL |c| |jv| |xexp| (QREFELT % 139)))
                            (EXIT
                             (COND
                              ((NULL (SPADCALL |nc| (QREFELT % 31)))
                               (SEQ (LETT |resC| (CONS |nc| |resC|))
                                    (EXIT
                                     (LETT |resJ| (CONS |cj| |resJ|))))))))
                           (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT (CONS (NREVERSE |resC|) (NREVERSE |resJ|)))))
                (#3='T
                 (SEQ (LETT |pos| (SPADCALL |jv| (QCDR |l|) (QREFELT % 111)))
                      (EXIT
                       (COND ((ZEROP |pos|) |l|)
                             (#3#
                              (SEQ
                               (LETT |c|
                                     (SPADCALL (QCAR |l|) |pos|
                                               (QREFELT % 112)))
                               (LETT |nl|
                                     (CONS
                                      (SPADCALL (QCAR |l|) |pos|
                                                (QREFELT % 135))
                                      (SPADCALL (QCDR |l|) |pos|
                                                (QREFELT % 136))))
                               (EXIT
                                (SPADCALL |nl|
                                          (SPADCALL |c| |exp| (QREFELT % 95))
                                          (QREFELT % 91)))))))))))))) 

(SDEFUN |JBLF;simplify;LSemR;36|
        ((|sys| (|List| %)) (|jm| (|SparseEchelonMatrix| JB %))
         (%
          (|Record| (|:| |Sys| (|List| %))
                    (|:| JM (|SparseEchelonMatrix| JB %))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((|RRec|
           (|Record| (|:| |Ech| (|SparseEchelonMatrix| JB D))
                     (|:| |Lt| #1=(|Matrix| (|Fraction| D)))
                     (|:| |Pivots| (|List| D))
                     (|:| |Rank| (|NonNegativeInteger|))))
          (|newSys| (|List| %)) (|Trafo| #1#) (|minR| (|Integer|))
          (|maxR| (|Integer|)) (|inds| (|List| JB)) (|cinds| (|List| JB))
          (|newJM| (|SparseEchelonMatrix| JB %)) (|j| NIL) (|eq| NIL)
          (#2=#:G401 NIL) (#3=#:G402 NIL) (#4=#:G403 NIL) (#5=#:G404 NIL)
          (#6=#:G405 NIL) (|ents| (|List| %)) (|cjv| NIL) (#7=#:G406 NIL)
          (|jv| NIL) (#8=#:G408 NIL) (|co| NIL) (#9=#:G407 NIL) (|dco| (D))
          (|dJV| (|List| JB)) (|dCo| (|List| D)) (|rowJ| (|List| JB))
          (|rowC| (|List| %)) (|k| NIL) (#10=#:G409 NIL) (#11=#:G389 NIL)
          (|depj| (|List| (|NonNegativeInteger|)))
          (|dep| (|List| (|List| (|NonNegativeInteger|)))))
         (SEQ
          (COND
           ((EQL (SPADCALL |sys| (QREFELT % 49)) 1)
            (VECTOR |sys| |jm| (CONS 1 (LIST (LIST 1)))))
           ('T
            (SEQ
             (LETT |RRec|
                   (SPADCALL (SPADCALL |sys| (QREFELT % 54)) (QREFELT % 142)))
             (LETT |newSys| (SPADCALL (QVELT |RRec| 0) (QREFELT % 43)))
             (LETT |Trafo| (QVELT |RRec| 1)) (LETT |minR| (PROGN |Trafo| 1))
             (LETT |maxR| (SPADCALL |Trafo| (QREFELT % 144)))
             (LETT |inds| (SPADCALL |jm| (QREFELT % 145)))
             (LETT |cinds| (SPADCALL |inds| (QREFELT % 86)))
             (SEQ G190
                  (COND
                   ((NULL
                     (COND ((NULL |cinds|) NIL)
                           ('T
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |cinds|) (QREFELT % 25))
                             '|Indep| (QREFELT % 146)))))
                    (GO G191)))
                  (SEQ (EXIT (LETT |cinds| (CDR |cinds|)))) NIL (GO G190) G191
                  (EXIT NIL))
             (COND ((NULL (NULL |cinds|)) (LETT |cinds| (NREVERSE |cinds|))))
             (LETT |newJM|
                   (SPADCALL |inds| (SPADCALL |newSys| (QREFELT % 49))
                             (QREFELT % 115)))
             (LETT |dep| NIL)
             (SEQ (LETT |j| 1) (LETT |eq| NIL) (LETT #2# |newSys|) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (COND
                    ((NULL |cinds|)
                     (SPADCALL |newJM| |j| (QCDR |eq|)
                               (PROGN
                                (LETT #3# NIL)
                                (SEQ (LETT |co| NIL) (LETT #4# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #4#)
                                           (PROGN (LETT |co| (CAR #4#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #3#
                                             (CONS
                                              (SPADCALL |co| (QREFELT % 33))
                                              #3#))))
                                     (LETT #4# (CDR #4#)) (GO G190) G191
                                     (EXIT (NREVERSE #3#))))
                               (QREFELT % 116)))
                    ('T
                     (SEQ
                      (LETT |ents|
                            (PROGN
                             (LETT #5# NIL)
                             (SEQ (LETT |co| NIL) (LETT #6# (QCAR |eq|)) G190
                                  (COND
                                   ((OR (ATOM #6#)
                                        (PROGN (LETT |co| (CAR #6#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #5#
                                          (CONS (SPADCALL |co| (QREFELT % 33))
                                                #5#))))
                                  (LETT #6# (CDR #6#)) (GO G190) G191
                                  (EXIT (NREVERSE #5#)))))
                      (LETT |rowJ| NIL) (LETT |rowC| NIL)
                      (SEQ (LETT |cjv| NIL) (LETT #7# |cinds|) G190
                           (COND
                            ((OR (ATOM #7#) (PROGN (LETT |cjv| (CAR #7#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |dJV| NIL) (LETT |dCo| NIL)
                                (SEQ (LETT |jv| NIL) (LETT #8# (QCDR |eq|))
                                     (LETT |co| NIL) (LETT #9# (QCAR |eq|))
                                     G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |co| (CAR #9#)) NIL)
                                           (ATOM #8#)
                                           (PROGN (LETT |jv| (CAR #8#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (LETT |dco|
                                            (SPADCALL |co| |cjv|
                                                      (QREFELT % 110)))
                                      (EXIT
                                       (COND
                                        ((NULL (SPADCALL |dco| (QREFELT % 31)))
                                         (SEQ (LETT |dJV| (CONS |jv| |dJV|))
                                              (EXIT
                                               (LETT |dCo|
                                                     (CONS |dco| |dCo|))))))))
                                     (LETT #9#
                                           (PROG1 (CDR #9#)
                                             (LETT #8# (CDR #8#))))
                                     (GO G190) G191 (EXIT NIL))
                                (EXIT
                                 (COND
                                  ((NULL (NULL |dJV|))
                                   (SEQ (LETT |rowJ| (CONS |cjv| |rowJ|))
                                        (EXIT
                                         (LETT |rowC|
                                               (SPADCALL
                                                (CONS (NREVERSE |dCo|)
                                                      (NREVERSE |dJV|))
                                                |rowC| (QREFELT % 40)))))))))
                           (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL |newJM| |j|
                                 (SPADCALL (QCDR |eq|) (NREVERSE |rowJ|)
                                           (QREFELT % 106))
                                 (SPADCALL |ents|
                                           (SPADCALL |rowC| (QREFELT % 41))
                                           (QREFELT % 117))
                                 (QREFELT % 116))))))
                   (LETT |depj| NIL)
                   (SEQ (LETT |k| |maxR|) (LETT #10# |minR|) G190
                        (COND ((< |k| #10#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (QAREF2O |Trafo| |j| |k| 1 1)
                                       (QREFELT % 148)))
                            (LETT |depj|
                                  (CONS
                                   (PROG1
                                       (LETT #11#
                                             (+ (- |k| |minR|)
                                                (PROGN |depj| 1)))
                                     (|check_subtype2| (>= #11# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #11#))
                                   |depj|))))))
                        (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
                   (EXIT (LETT |dep| (CONS |depj| |dep|))))
                  (LETT #2# (PROG1 (CDR #2#) (LETT |j| (|inc_SI| |j|))))
                  (GO G190) G191 (EXIT NIL))
             (EXIT (VECTOR |newSys| |newJM| (CONS 1 (NREVERSE |dep|)))))))))) 

(SDEFUN |JBLF;simpOne;2%;37| ((|f| (%)) (% (%)))
        (COND
         ((EQL (LENGTH (QCDR |f|)) 1)
          (CONS (LIST (|spadConstant| % 29)) (QCDR |f|)))
         ('T |f|))) 

(DECLAIM (NOTINLINE |JetBundleLinearFunction;|)) 

(DEFUN |JetBundleLinearFunction;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|JetBundleLinearFunction| DV$1 DV$2))
          (LETT % (GETREFV 162))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             (LIST
                                                              '|RetractableFrom|
                                                              (LIST
                                                               '|JetBundleExpression|
                                                               (|devaluate|
                                                                |#1|))))
                                              (|HasCategory| |#2|
                                                             '(|lazyRepresentation|))))))
          (|haddProp| |$ConstructorCache| '|JetBundleLinearFunction|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8
                    (|Record| (|:| |Coeffs| (|List| |#2|))
                              (|:| |JVars| (|List| |#1|))))
          (QSETREFV % 11 (SPADCALL (QREFELT % 10)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 69
                       (CONS (|dispatchFunction| |JBLF;retractIfCan;JbeU;12|)
                             %))
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |JBLF;retract;Jbe%;13|) %))
             (QSETREFV % 80
                       (CONS (|dispatchFunction| |JBLF;coerce;%Jbe;14|) %)))))
          %))) 

(DEFUN |JetBundleLinearFunction| (&REST #1=#:G420)
  (SPROG NIL
         (PROG (#2=#:G421)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleLinearFunction|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |JetBundleLinearFunction;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleLinearFunction|)))))))))) 

(MAKEPROP '|JetBundleLinearFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|PositiveInteger|) (0 . |numIndVar|) '|nn| (|Boolean|)
              (4 . |one?|) (|OutputForm|) (9 . |coerce|) (14 . |one?|)
              (19 . |coerce|) (24 . *) |JBLF;zero?;%B;15|
              (|NonNegativeInteger|) (30 . |coerce|) (35 . +)
              |JBLF;coerce;%Of;2| (|Symbol|) (41 . |type|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;1;%;18|) %))
              (46 . |coerce|) (51 . |1|) (55 . |1|) |JBLF;coerce;JB%;3|
              (59 . |zero?|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |JBLF;0;%;17|) %))
              |JBLF;coerce;D%;4| (|SparseEchelonMatrix| 6 7) (64 . |nrows|)
              (|Record| (|:| |Indices| 46) (|:| |Entries| 52)) (|Integer|)
              (69 . |row|) (|List| $$) (75 . |cons|) (81 . |reverse!|)
              (|List| %) |JBLF;coerce;SemL;5| (86 . >) (|Mapping| 12 6 6)
              (|List| 6) (92 . |merge|) (99 . |removeDuplicates!|) (104 . |#|)
              (109 . |new|) (|Void|) (|List| 7) (115 . |setRow!|)
              |JBLF;coerce;LSem;6| |JBLF;ground?;%B;7| (123 . |member?|)
              (129 . |last|) |JBLF;ground;2%;8| (134 . |0|)
              (|Union| 7 '"failed") |JBLF;retractIfCan;%U;9|
              |JBLF;numerator;2%;10| |JBLF;denominator;2%;11|
              (|Union| % '"failed") (|JetBundleExpression| 6)
              (138 . |retractIfCan|) (143 . |jetVariables|)
              (148 . |differentiate|) (154 . |retractIfCan|) (159 . |retract|)
              (164 . +) (170 . |coerce|) (175 . |coerce|) (180 . *) (186 . |0|)
              (|Mapping| 65 65 65) (|List| 65) (|ListFunctions2| 65 65)
              (190 . |reduce|) (197 . |coerce|) (202 . -) |JBLF;=;2%B;16|
              (208 . -) |JBLF;-;2%;19| (213 . |copy|) (218 . |copy|) (223 . =)
              (229 . +) (235 . |concat!|) (241 . |concat!|) |JBLF;+;3%;20|
              (247 . *) |JBLF;*;I2%;21| (253 . *) |JBLF;*;D2%;22| (259 . =)
              |JBLF;*;3%;23| (265 . |recip|) |JBLF;recip;%U;24| (270 . |exquo|)
              |JBLF;exquo;2%U;25| (276 . |gcd|) |JBLF;gcd;3%;26|
              (282 . |jetVariables|) (287 . |remove|) (293 . |append|)
              |JBLF;jetVariables;%L;27| (299 . |differentiate|)
              |JBLF;differentiate;%S%;28| (305 . |differentiate|)
              (311 . |position|) (317 . |qelt|) |JBLF;differentiate;%JB%;29|
              (|SparseEchelonMatrix| 6 $$) (323 . |new|) (329 . |setRow!|)
              (337 . |append|) (|SparseEchelonMatrix| 6 %)
              |JBLF;jacobiMatrix;LSem;30| (343 . <) (349 . =) (|Mapping| 12 6)
              (355 . |select|) (361 . |sort!|) (|List| 46)
              |JBLF;jacobiMatrix;LLSem;31| |JBLF;leadingDer;%JB;32|
              (367 . |freeOf?|) (373 . |and|) (|Mapping| 12 12 12) (|List| 12)
              (379 . |reduce|) |JBLF;freeOf?;%JBB;33| (386 . |elt|)
              (392 . |delete|) (398 . |delete|) |JBLF;solveFor;%JBU;34|
              (404 . |retract|) (409 . |subst|) |JBLF;subst;%JB2%;35|
              (|Record| (|:| |Ech| %) (|:| |Lt| 143) (|:| |Pivots| 52)
                        (|:| |Rank| 20))
              (416 . |primitiveRowEchelon|) (|Matrix| 147)
              (421 . |maxRowIndex|) (426 . |allIndices|) (431 . ~=)
              (|Fraction| 7) (437 . |zero?|) (|Union| '"failed" (|List| 155))
              (|Record| (|:| |Sys| 42) (|:| JM 118) (|:| |Depend| 149))
              |JBLF;simplify;LSemR;36| |JBLF;simpOne;2%;37| (|String|)
              (|List| 24) (|List| 20) (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '"failed") (|Record| (|:| |DPhi| %) (|:| |JVars| 46))
              (|Record| (|:| |DSys| 42) (|:| |JVars| 125)))
           '#(~= 442 |zero?| 448 |unitNormal| 453 |unitCanonical| 458 |unit?|
              463 |symbol| 468 |subtractIfCan| 473 |subst| 479 |sortLD| 486
              |solveFor| 491 |simplify| 497 |simpOne| 503 |simpMod| 508
              |setNotation| 521 |sample| 526 |rightRecip| 530 |rightPower| 535
              |retractIfCan| 547 |retract| 562 |reduceMod| 577 |recip| 583
              |plenaryPower| 588 |orderDim| 594 |order| 601 |opposite?| 606
              |one?| 612 |numerator| 617 |numIndVar| 622 |numDepVar| 626
              |leftRecip| 630 |leftPower| 635 |leadingDer| 647 |lcmCoef| 652
              |lcm| 658 |latex| 669 |jetVariables| 674 |jacobiMatrix| 679
              |ground?| 690 |ground| 695 |getNotation| 700 |gcdPolynomial| 704
              |gcd| 710 |freeOf?| 721 |formalDiff2| 727 |formalDiff| 741
              |extractSymbol| 759 |exquo| 764 |dimension| 770 |differentiate|
              777 |denominator| 809 |dSubst| 814 |const?| 821 |commutator| 826
              |coerce| 832 |class| 872 |characteristic| 877 |autoReduce| 881
              |associator| 886 |associates?| 893 |antiCommutator| 899
              |annihilate?| 905 ^ 911 X 923 U 932 P 941 = 963 |1| 969 |0| 973 -
              977 + 988 * 994 |#2| 1030)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 2 1 0 0 0 0 0
                                  0 0 0))
            (CONS
             '#(|JetBundleFunctionCategory&| |GcdDomain&| NIL NIL NIL
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| NIL NIL
                |Rng&| |NonAssociativeAlgebra&| NIL |Module&| |Module&|
                |NonAssociativeRing&| NIL NIL NIL |NonAssociativeRng&| NIL NIL
                NIL |AbelianGroup&| NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |RetractableFrom&|
                |SetCategory&| NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL |BasicType&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|JetBundleFunctionCategory| 6) (|GcdDomain|)
                 (|IntegralDomain|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| $$) (|EntireRing|) (|PartialDifferentialRing| 24)
                 (|Ring|) (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|SemiRng|) (|Module| $$) (|Module| 7) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 7 7) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|LeftModule| 7)
                 (|RightModule| 7) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|)
                 (|RetractableFrom| (|JetBundleExpression| 6)) (|SetCategory|)
                 (|CommutativeStar|) (|RetractableTo| 6) (|RetractableTo| 7)
                 (|lazyRepresentation|)
                 (|CoercibleTo| (|JetBundleExpression| 6)) (|CoercibleTo| 14)
                 (|BasicType|) (|unitsKnown|) (|JetBundleOperationsCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleFrom| 7))
              (|makeByteWordVec2| 161
                                  '(0 6 9 10 1 7 12 0 13 1 6 14 0 15 1 6 12 0
                                    16 1 7 14 0 17 2 14 0 0 0 18 1 20 14 0 21 2
                                    14 0 0 0 22 1 6 24 0 25 1 7 0 6 27 0 6 0 28
                                    0 7 0 29 1 7 12 0 31 1 34 20 0 35 2 34 36 0
                                    37 38 2 39 0 2 0 40 1 39 0 0 41 2 6 12 0 0
                                    44 3 46 0 45 0 0 47 1 46 0 0 48 1 39 20 0
                                    49 2 34 0 46 37 50 4 34 51 0 37 46 52 53 2
                                    46 12 6 0 56 1 52 7 0 57 0 7 0 59 1 7 64 65
                                    66 1 65 46 0 67 2 65 0 0 6 68 1 0 64 65 69
                                    1 0 0 65 70 2 65 0 0 0 71 1 7 65 0 72 1 65
                                    0 6 73 2 65 0 0 0 74 0 65 0 75 3 78 65 76
                                    77 65 79 1 0 65 0 80 2 0 0 0 0 81 1 7 0 0
                                    83 1 52 0 0 85 1 46 0 0 86 2 6 12 0 0 87 2
                                    7 0 0 0 88 2 52 0 0 0 89 2 46 0 0 0 90 2 7
                                    0 37 0 92 2 7 0 0 0 94 2 46 12 0 0 96 1 7
                                    64 0 98 2 7 64 0 0 100 2 7 0 0 0 102 1 7 46
                                    0 104 2 46 0 6 0 105 2 46 0 0 0 106 2 7 0 0
                                    24 108 2 7 0 0 6 110 2 46 37 6 0 111 2 52 7
                                    0 37 112 2 114 0 46 37 115 4 114 51 0 37 46
                                    39 116 2 39 0 0 0 117 2 6 12 0 0 120 2 24
                                    12 0 0 121 2 46 0 122 0 123 2 46 0 45 0 124
                                    2 7 12 0 6 128 2 12 0 0 0 129 3 131 12 130
                                    0 12 132 2 52 7 0 37 134 2 52 0 0 37 135 2
                                    46 0 0 37 136 1 0 7 0 138 3 7 0 0 6 0 139 1
                                    34 141 0 142 1 143 37 0 144 1 114 46 0 145
                                    2 24 12 0 0 146 1 147 12 0 148 2 0 12 0 0 1
                                    1 0 12 0 19 1 0 158 0 1 1 0 0 0 1 1 0 12 0
                                    1 1 0 118 42 1 2 0 64 0 0 1 3 0 0 0 6 0 140
                                    1 0 42 42 1 2 0 64 0 6 137 2 0 150 42 118
                                    151 1 0 0 0 152 3 0 150 42 118 42 1 2 0 42
                                    42 42 1 1 0 24 24 1 0 0 0 1 1 0 64 0 1 2 0
                                    0 0 9 1 2 0 0 0 20 1 1 0 159 0 1 1 0 60 0
                                    61 1 1 64 65 69 1 0 6 0 1 1 0 7 0 138 1 1 0
                                    65 70 2 0 42 42 42 1 1 0 64 0 99 2 0 0 0 9
                                    1 3 0 20 42 118 20 1 1 0 20 0 1 2 0 12 0 0
                                    1 1 0 12 0 1 1 0 0 0 62 0 0 9 1 0 0 9 1 1 0
                                    64 0 1 2 0 0 0 9 1 2 0 0 0 20 1 1 0 6 0 127
                                    2 0 157 0 0 1 1 0 0 42 1 2 0 0 0 0 1 1 0
                                    153 0 1 1 0 46 0 107 1 0 118 42 119 2 0 118
                                    42 125 126 1 0 12 0 55 1 0 0 0 58 0 0 24 1
                                    2 0 156 156 156 1 2 0 0 0 0 103 1 0 0 42 1
                                    2 0 12 0 6 133 3 0 160 0 9 118 1 3 0 161 42
                                    9 118 1 2 0 0 0 9 1 2 0 42 42 9 1 2 0 0 0
                                    155 1 1 0 118 118 1 2 0 64 0 0 101 3 0 20
                                    42 118 20 1 2 0 0 0 24 109 2 0 0 0 154 1 3
                                    0 0 0 154 155 1 3 0 0 0 24 20 1 2 0 0 0 6
                                    113 1 0 0 0 63 3 0 0 0 6 0 1 1 0 12 0 1 2 0
                                    0 0 0 1 1 0 14 0 23 1 0 0 37 1 1 0 0 0 1 1
                                    0 0 6 30 1 0 0 7 33 1 0 34 42 54 1 0 42 34
                                    43 1 1 65 0 80 1 0 20 0 1 0 0 20 1 1 0 42
                                    42 1 3 0 0 0 0 0 1 2 0 12 0 0 1 2 0 0 0 0 1
                                    2 0 12 0 0 1 2 0 0 0 9 1 2 0 0 0 20 1 1 0 0
                                    9 1 0 0 0 1 1 0 0 9 1 0 0 0 1 2 0 0 9 155 1
                                    1 0 0 155 1 1 0 0 20 1 2 0 0 9 20 1 2 0 12
                                    0 0 82 0 0 0 26 0 0 0 32 2 0 0 0 0 81 1 0 0
                                    0 84 2 0 0 0 0 91 2 0 0 9 0 1 2 0 0 0 0 97
                                    2 0 0 37 0 93 2 0 0 20 0 1 2 0 0 0 7 1 2 0
                                    0 7 0 95 2 0 0 0 154 1 2 0 0 0 24 1 3 0 0 0
                                    154 155 1 3 0 0 0 24 20 1)))))
           '|lookupComplete|)) 
