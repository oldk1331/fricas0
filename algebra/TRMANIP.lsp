
(SDEFUN |TRMANIP;expandTrigProducts;2F;1| ((|e| (F)) (% (F)))
        (SPADCALL (LIST (QREFELT % 29) (QREFELT % 30) (QREFELT % 31)) |e| 10
                  (QREFELT % 35))) 

(SDEFUN |TRMANIP;logArgs| ((|l| (|List| F)) (% (F)))
        (SPROG
         ((|sum| (F)) (|arg| (F))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            "failed"))
          (#1=#:G72 NIL) (|term| NIL))
         (SEQ (LETT |sum| (|spadConstant| % 37))
              (LETT |arg| (|spadConstant| % 38))
              (SEQ (LETT |term| NIL) (LETT #1# |l|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |term| '|log| (QREFELT % 40))
                       (LETT |arg|
                             (SPADCALL |arg|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL
                                          (|SPADfirst|
                                           (SPADCALL |term| (QREFELT % 42)))
                                          (QREFELT % 45)))
                                        (QREFELT % 46))
                                       (QREFELT % 21))))
                      ('T
                       (SEQ (LETT |prod| (SPADCALL |term| (QREFELT % 49)))
                            (COND
                             ((QEQCAR |prod| 0)
                              (COND
                               ((SPADCALL (QCDR (QCDR |prod|)) '|log|
                                          (QREFELT % 50))
                                (EXIT
                                 (LETT |arg|
                                       (SPADCALL |arg|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (|SPADfirst|
                                                    (SPADCALL
                                                     (QCDR (QCDR |prod|))
                                                     (QREFELT % 45)))
                                                   (QCAR (QCDR |prod|))
                                                   (QREFELT % 51))
                                                  (QREFELT % 46))
                                                 (QREFELT % 21))))))))
                            (EXIT
                             (LETT |sum|
                                   (SPADCALL |sum| |term|
                                             (QREFELT % 22)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL |sum| (SPADCALL |arg| (QREFELT % 52))
                         (QREFELT % 22)))))) 

(SDEFUN |TRMANIP;simplifyLog;2F;3| ((|e| (F)) (% (F)))
        (SPADCALL (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT % 53)) %)
                  (|TRMANIP;simplifyLog1| (SPADCALL |e| (QREFELT % 54)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;simplifyLog1| ((|e| (F)) (% (F)))
        (SPROG
         ((#1=#:G120 NIL) (#2=#:G119 (F)) (#3=#:G121 (F)) (#4=#:G132 NIL)
          (#5=#:G2 NIL) (|terms| (|List| F)) (|foundLog| (|Boolean|))
          (#6=#:G112 NIL) (#7=#:G111 (F)) (#8=#:G113 (F)) (#9=#:G131 NIL)
          (#10=#:G1 NIL) (|args| (|List| F)) (|i| (|NonNegativeInteger|))
          (|nterms| (|List| F)) (|exprs| (|List| F)) (#11=#:G130 NIL)
          (|term| NIL) (#12=#:G129 NIL) (#13=#:G128 NIL) (#14=#:G127 NIL)
          (|u| NIL) (#15=#:G126 NIL) (|kers| (|List| (|Kernel| F)))
          (|expt|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                    #16="failed"))
          (|termList| (|Union| (|List| F) #16#))
          (|prod|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| F)))
            #16#)))
         (SEQ
          (COND ((SPADCALL |e| '|log| (QREFELT % 55)) |e|)
                (#17='T
                 (SEQ (LETT |prod| (SPADCALL |e| (QREFELT % 49)))
                      (COND
                       ((QEQCAR |prod| 0)
                        (COND
                         ((SPADCALL (QCDR (QCDR |prod|)) (QREFELT % 14)
                                    (QREFELT % 56))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (|SPADfirst|
                               (SPADCALL (QCDR (QCDR |prod|)) (QREFELT % 45)))
                              (QCAR (QCDR |prod|)) (QREFELT % 51))
                             (QREFELT % 46))
                            (QREFELT % 52)))))))
                      (LETT |termList| (SPADCALL |e| (QREFELT % 58)))
                      (EXIT
                       (COND
                        ((QEQCAR |termList| 1)
                         (SEQ (LETT |terms| (SPADCALL |e| (QREFELT % 59)))
                              (EXIT
                               (COND
                                ((QEQCAR |terms| 1)
                                 (SEQ
                                  (LETT |expt| (SPADCALL |e| (QREFELT % 62)))
                                  (COND
                                   ((QEQCAR |expt| 0)
                                    (COND
                                     ((NULL (EQL (QCDR (QCDR |expt|)) 1))
                                      (EXIT
                                       (SPADCALL
                                        (SPADCALL (QCAR (QCDR |expt|))
                                                  (QREFELT % 46))
                                        (QCDR (QCDR |expt|))
                                        (QREFELT % 51)))))))
                                  (LETT |kers| (SPADCALL |e| (QREFELT % 42)))
                                  (COND
                                   ((NULL (EQL (LENGTH |kers|) 1)) (EXIT |e|)))
                                  (EXIT
                                   (SPADCALL
                                    (SPADCALL (|SPADfirst| |kers|)
                                              (QREFELT % 63))
                                    (PROGN
                                     (LETT #15# NIL)
                                     (SEQ (LETT |u| NIL)
                                          (LETT #14#
                                                (SPADCALL (|SPADfirst| |kers|)
                                                          (QREFELT % 45)))
                                          G190
                                          (COND
                                           ((OR (ATOM #14#)
                                                (PROGN
                                                 (LETT |u| (CAR #14#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #15#
                                                  (CONS
                                                   (SPADCALL |u|
                                                             (QREFELT % 46))
                                                   #15#))))
                                          (LETT #14# (CDR #14#)) (GO G190) G191
                                          (EXIT (NREVERSE #15#))))
                                    (QREFELT % 65)))))
                                (#17# (|TRMANIP;logArgs| (QCDR |terms|) %))))))
                        (#17#
                         (SEQ
                          (LETT |terms|
                                (PROGN
                                 (LETT #13# NIL)
                                 (SEQ (LETT |term| NIL)
                                      (LETT #12# (QCDR |termList|)) G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN
                                             (LETT |term| (CAR #12#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #13#
                                              (CONS
                                               (SPADCALL |term| (QREFELT % 46))
                                               #13#))))
                                      (LETT #12# (CDR #12#)) (GO G190) G191
                                      (EXIT (NREVERSE #13#)))))
                          (LETT |exprs| NIL) (LETT |nterms| NIL)
                          (SEQ (LETT |term| NIL) (LETT #11# |terms|) G190
                               (COND
                                ((OR (ATOM #11#)
                                     (PROGN (LETT |term| (CAR #11#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((QEQCAR (SPADCALL |term| (QREFELT % 67)) 0)
                                   (LETT |exprs| (CONS |term| |exprs|)))
                                  ('T
                                   (LETT |nterms| (CONS |term| |nterms|))))))
                               (LETT #11# (CDR #11#)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |terms| |nterms|)
                          (COND
                           ((NULL (NULL |exprs|))
                            (SEQ (LETT |foundLog| NIL) (LETT |i| 0)
                                 (SEQ G190
                                      (COND
                                       ((NULL
                                         (COND (|foundLog| NIL)
                                               ('T (< |i| (LENGTH |terms|)))))
                                        (GO G191)))
                                      (SEQ (LETT |i| (+ |i| 1))
                                           (EXIT
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |terms| |i|
                                                         (QREFELT % 69))
                                               '|log| (QREFELT % 40))
                                              (SEQ
                                               (LETT |args|
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |terms| |i|
                                                                 (QREFELT %
                                                                          69))
                                                       (QREFELT % 71))
                                                      (QREFELT % 45)))
                                               (SPADCALL |terms| |i|
                                                         (SPADCALL
                                                          (|TRMANIP;simplifyLog1|
                                                           (SPADCALL
                                                            (|SPADfirst|
                                                             |args|)
                                                            (PROGN
                                                             (LETT #6# NIL)
                                                             (SEQ
                                                              (LETT #10# NIL)
                                                              (LETT #9#
                                                                    |exprs|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #9#)
                                                                    (PROGN
                                                                     (LETT #10#
                                                                           (CAR
                                                                            #9#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #8#
                                                                       #10#)
                                                                 (COND
                                                                  (#6#
                                                                   (LETT #7#
                                                                         (SPADCALL
                                                                          #7#
                                                                          #8#
                                                                          (QREFELT
                                                                           %
                                                                           21))))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #7#
                                                                          #8#)
                                                                    (LETT #6#
                                                                          'T)))))))
                                                              (LETT #9#
                                                                    (CDR #9#))
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#6# #7#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     % 38))))
                                                            (QREFELT % 72))
                                                           %)
                                                          (QREFELT % 52))
                                                         (QREFELT % 73))
                                               (EXIT (LETT |foundLog| 'T)))))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (EXIT
                                  (COND
                                   ((NULL |foundLog|)
                                    (LETT |terms|
                                          (SPADCALL |exprs| |terms|
                                                    (QREFELT % 74)))))))))
                          (EXIT
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT #5# NIL) (LETT #4# |terms|) G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT #5# (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #3# #5#)
                                    (COND
                                     (#1#
                                      (LETT #2#
                                            (SPADCALL #2# #3# (QREFELT % 21))))
                                     ('T
                                      (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#1# #2#)
                                  (#17# (|spadConstant| % 38))))))))))))))) 

(SDEFUN |TRMANIP;simplify;2F;5| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;simplify0| |x| %) (QREFELT % 76))) 

(SDEFUN |TRMANIP;simplify;2F;6| ((|x| (F)) (% (F))) (|TRMANIP;simplify0| |x| %)) 

(SDEFUN |TRMANIP;expandpow| ((|k| (|Kernel| F)) (|f| (|Mapping| F F)) (% (F)))
        (SPROG ((|de| (F)) (|ne| (F)) (|b| (F)) (|a| (F)) (|arg| (|List| F)))
               (SEQ
                (LETT |a|
                      (SPADCALL
                       (|SPADfirst| (LETT |arg| (SPADCALL |k| (QREFELT % 45))))
                       |f|))
                (LETT |b| (SPADCALL (SPADCALL |arg| (QREFELT % 78)) |f|))
                (LETT |ne|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 80))
                                  (|spadConstant| % 82) (QREFELT % 83))
                        (|spadConstant| % 38))
                       (#1='T
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT % 80))
                                   (QREFELT % 84))
                         |b| (QREFELT % 72)))))
                (LETT |de|
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 85))
                                  (|spadConstant| % 82) (QREFELT % 83))
                        (|spadConstant| % 38))
                       (#1#
                        (SPADCALL
                         (SPADCALL (SPADCALL |a| (QREFELT % 85))
                                   (QREFELT % 84))
                         (SPADCALL |b| (QREFELT % 86)) (QREFELT % 72)))))
                (EXIT (SPADCALL |ne| |de| (QREFELT % 21)))))) 

(SDEFUN |TRMANIP;termexp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG
         ((|coef| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|newK| (F))
          (#1=#:G158 NIL) (|u| NIL) (#2=#:G157 NIL) (|exponent| (F))
          (|d| (|NonNegativeInteger|)) (#3=#:G156 NIL) (|k| NIL)
          (|lpow| (|List| (|Kernel| F))) (|lk| (|List| (|Kernel| F))))
         (SEQ (LETT |lk| (SPADCALL |p| (QREFELT % 88)))
              (EXIT
               (COND ((NULL |lk|) (SPADCALL |p| (QREFELT % 84)))
                     ('T
                      (SEQ (LETT |exponent| (|spadConstant| % 37))
                           (LETT |coef|
                                 (SPADCALL (SPADCALL |p| (QREFELT % 89))
                                           (QREFELT % 90)))
                           (LETT |lpow|
                                 (SPADCALL (CONS #'|TRMANIP;termexp!0| %) |lk|
                                           (QREFELT % 92)))
                           (SEQ (LETT |k| NIL) (LETT #3# |lk|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |k| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |d| (SPADCALL |p| |k| (QREFELT % 94)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |k| (QREFELT % 13)
                                              (QREFELT % 56))
                                    (LETT |exponent|
                                          (SPADCALL |exponent|
                                                    (SPADCALL |d|
                                                              (|SPADfirst|
                                                               (SPADCALL |k|
                                                                         (QREFELT
                                                                          %
                                                                          45)))
                                                              (QREFELT % 95))
                                                    (QREFELT % 22))))
                                   ((NULL
                                     (SPADCALL |k| '|%power| (QREFELT % 50)))
                                    (SEQ
                                     (LETT |newK|
                                           (SPADCALL
                                            (SPADCALL |k| (QREFELT % 63))
                                            (PROGN
                                             (LETT #2# NIL)
                                             (SEQ (LETT |u| NIL)
                                                  (LETT #1#
                                                        (SPADCALL |k|
                                                                  (QREFELT %
                                                                           45)))
                                                  G190
                                                  (COND
                                                   ((OR (ATOM #1#)
                                                        (PROGN
                                                         (LETT |u| (CAR #1#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT #2#
                                                          (CONS
                                                           (SPADCALL |u|
                                                                     (QREFELT %
                                                                              96))
                                                           #2#))))
                                                  (LETT #1# (CDR #1#))
                                                  (GO G190) G191
                                                  (EXIT (NREVERSE #2#))))
                                            (QREFELT % 97)))
                                     (EXIT
                                      (LETT |coef|
                                            (SPADCALL |coef|
                                                      (SPADCALL
                                                       (|spadConstant| % 82)
                                                       (SPADCALL |newK|
                                                                 (QREFELT %
                                                                          71))
                                                       |d| (QREFELT % 98))
                                                      (QREFELT % 99)))))))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL
                             (SPADCALL (SPADCALL |coef| (QREFELT % 84))
                                       (SPADCALL
                                        (SPADCALL |exponent| (QREFELT % 96))
                                        (QREFELT % 100))
                                       (QREFELT % 21))
                             (|TRMANIP;powersimp| |p| |lpow| %)
                             (QREFELT % 21)))))))))) 

(SDEFUN |TRMANIP;termexp!0| ((|z1| NIL) (% NIL))
        (SPADCALL |z1| '|%power| (QREFELT % 50))) 

(SDEFUN |TRMANIP;expandPower;2F;9| ((|f| (F)) (% (F)))
        (SPROG
         ((#1=#:G166 NIL) (|k| NIL) (#2=#:G165 NIL)
          (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (SPADCALL (CONS #'|TRMANIP;expandPower;2F;9!0| %)
                          (SPADCALL |f| (QREFELT % 42)) (QREFELT % 92)))
          (EXIT
           (SPADCALL |f| |l|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|TRMANIP;expandpow| |k| (ELT % 101) %)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT % 102)))))) 

(SDEFUN |TRMANIP;expandPower;2F;9!0| ((|z1| NIL) (% NIL))
        (SPADCALL |z1| '|%power| (QREFELT % 50))) 

(SDEFUN |TRMANIP;powersimp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|l| (|List| (|Kernel| F))) (% (F)))
        (SPROG
         ((|exponent| (F)) (#1=#:G175 NIL) (|k0| NIL)
          (|lk| (|List| (|Kernel| F))) (|a| (F)) (|arg| (|List| F))
          (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) (|spadConstant| % 38))
                ('T
                 (SEQ (LETT |k| (|SPADfirst| |l|))
                      (LETT |a|
                            (|SPADfirst|
                             (LETT |arg| (SPADCALL |k| (QREFELT % 45)))))
                      (LETT |exponent|
                            (SPADCALL (SPADCALL |p| |k| (QREFELT % 94))
                                      (SPADCALL |arg| (QREFELT % 78))
                                      (QREFELT % 103)))
                      (LETT |lk|
                            (SPADCALL
                             (CONS #'|TRMANIP;powersimp!0| (VECTOR % |a|))
                             (CDR |l|) (QREFELT % 92)))
                      (SEQ (LETT |k0| NIL) (LETT #1# |lk|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |k0| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |exponent|
                                   (SPADCALL |exponent|
                                             (SPADCALL
                                              (SPADCALL |p| |k0|
                                                        (QREFELT % 94))
                                              (SPADCALL
                                               (SPADCALL |k0| (QREFELT % 45))
                                               (QREFELT % 78))
                                              (QREFELT % 103))
                                             (QREFELT % 22)))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |a| (QREFELT % 96))
                                  (SPADCALL |exponent| (QREFELT % 96))
                                  (QREFELT % 72))
                        (|TRMANIP;powersimp| |p|
                         (SPADCALL (CDR |l|) |lk| (QREFELT % 106)) %)
                        (QREFELT % 21))))))))) 

(SDEFUN |TRMANIP;powersimp!0| ((|z1| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |a|
                      (SPADCALL (SPADCALL |z1| (QREFELT % 45)) (QREFELT % 104))
                      (QREFELT % 105)))))) 

(SDEFUN |TRMANIP;t2t| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 20)) (SPADCALL |x| (QREFELT % 19))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;c2t| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 19)) (SPADCALL |x| (QREFELT % 20))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;c2s| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 20)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;s2c| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 19)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;s2c2| ((|x| (F)) (% (F)))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |x| (QREFELT % 19)) 2 (QREFELT % 51))
                  (QREFELT % 23))) 

(SDEFUN |TRMANIP;th2th| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 108)) (SPADCALL |x| (QREFELT % 109))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;ch2th| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 109)) (SPADCALL |x| (QREFELT % 108))
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;ch2sh| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 108)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;sh2ch| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL |x| (QREFELT % 109)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;sh2ch2| ((|x| (F)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 109)) 2 (QREFELT % 51))
                  (|spadConstant| % 38) (QREFELT % 23))) 

(SDEFUN |TRMANIP;ueval|
        ((|x| (F)) (|s| (|Symbol|)) (|f| (|Mapping| F F)) (% (F)))
        (SPADCALL |x| |s| |f| (QREFELT % 111))) 

(SDEFUN |TRMANIP;ueval2|
        ((|x| (F)) (|s| (|Symbol|)) (|f| (|Mapping| F F)) (% (F)))
        (SPADCALL |x| |s| 2 |f| (QREFELT % 112))) 

(SDEFUN |TRMANIP;cos2sec;2F;23| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cos| (CONS #'|TRMANIP;cos2sec;2F;23!0| %) %)) 

(SDEFUN |TRMANIP;cos2sec;2F;23!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 113)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;sin2csc;2F;24| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sin| (CONS #'|TRMANIP;sin2csc;2F;24!0| %) %)) 

(SDEFUN |TRMANIP;sin2csc;2F;24!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 115)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;csc2sin;2F;25| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|csc| (CONS (|function| |TRMANIP;c2s|) %) %)) 

(SDEFUN |TRMANIP;sec2cos;2F;26| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sec| (CONS (|function| |TRMANIP;s2c|) %) %)) 

(SDEFUN |TRMANIP;tan2cot;2F;27| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tan| (CONS #'|TRMANIP;tan2cot;2F;27!0| %) %)) 

(SDEFUN |TRMANIP;tan2cot;2F;27!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 119)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;cot2tan;2F;28| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cot| (CONS #'|TRMANIP;cot2tan;2F;28!0| %) %)) 

(SDEFUN |TRMANIP;cot2tan;2F;28!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 121)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;tan2trig;2F;29| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tan| (CONS (|function| |TRMANIP;t2t|) %) %)) 

(SDEFUN |TRMANIP;cot2trig;2F;30| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cot| (CONS (|function| |TRMANIP;c2t|) %) %)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|cosh| (CONS #'|TRMANIP;cosh2sech;2F;31!0| %) %)) 

(SDEFUN |TRMANIP;cosh2sech;2F;31!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 125)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;sinh2csch;2F;32| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sinh| (CONS #'|TRMANIP;sinh2csch;2F;32!0| %) %)) 

(SDEFUN |TRMANIP;sinh2csch;2F;32!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 127)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;csch2sinh;2F;33| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|csch| (CONS (|function| |TRMANIP;ch2sh|) %) %)) 

(SDEFUN |TRMANIP;sech2cosh;2F;34| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|sech| (CONS (|function| |TRMANIP;sh2ch|) %) %)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tanh| (CONS #'|TRMANIP;tanh2coth;2F;35!0| %) %)) 

(SDEFUN |TRMANIP;tanh2coth;2F;35!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 131)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;coth2tanh;2F;36| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|coth| (CONS #'|TRMANIP;coth2tanh;2F;36!0| %) %)) 

(SDEFUN |TRMANIP;coth2tanh;2F;36!0| ((|z1| NIL) (% NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT % 133)) (QREFELT % 107))) 

(SDEFUN |TRMANIP;tanh2trigh;2F;37| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|tanh| (CONS (|function| |TRMANIP;th2th|) %) %)) 

(SDEFUN |TRMANIP;coth2trigh;2F;38| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval| |x| '|coth| (CONS (|function| |TRMANIP;ch2th|) %) %)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|cos| (CONS #'|TRMANIP;removeCosSq;2F;39!0| %)
         %)) 

(SDEFUN |TRMANIP;removeCosSq;2F;39!0| ((|z1| NIL) (% NIL))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |z1| (QREFELT % 20)) 2 (QREFELT % 51))
                  (QREFELT % 23))) 

(SDEFUN |TRMANIP;removeSinSq;2F;40| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|sin| (CONS (|function| |TRMANIP;s2c2|) %) %)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|cosh| (CONS #'|TRMANIP;removeCoshSq;2F;41!0| %)
         %)) 

(SDEFUN |TRMANIP;removeCoshSq;2F;41!0| ((|z1| NIL) (% NIL))
        (SPADCALL (|spadConstant| % 38)
                  (SPADCALL (SPADCALL |z1| (QREFELT % 108)) 2 (QREFELT % 51))
                  (QREFELT % 22))) 

(SDEFUN |TRMANIP;removeSinhSq;2F;42| ((|x| (F)) (% (F)))
        (|TRMANIP;ueval2| |x| '|sinh| (CONS (|function| |TRMANIP;sh2ch2|) %) %)) 

(SDEFUN |TRMANIP;expandLog;2F;43| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;smplog| (SPADCALL |x| (QREFELT % 80)) %)
                  (|TRMANIP;smplog| (SPADCALL |x| (QREFELT % 85)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;expand;2F;44| ((|x| (F)) (% (F)))
        (SPADCALL (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT % 80)) %)
                  (|TRMANIP;smpexpand| (SPADCALL |x| (QREFELT % 85)) %)
                  (QREFELT % 26))) 

(SDEFUN |TRMANIP;smpexpand|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS (|function| |TRMANIP;kerexpand|) %) (ELT % 143) |p|
                  (QREFELT % 147))) 

(SDEFUN |TRMANIP;smplog|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS (|function| |TRMANIP;logexpand|) %) (ELT % 143) |p|
                  (QREFELT % 147))) 

(SDEFUN |TRMANIP;smp2htrigs|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPADCALL (CONS #'|TRMANIP;smp2htrigs!0| %) (ELT % 143) |p|
                  (QREFELT % 147))) 

(SDEFUN |TRMANIP;smp2htrigs!0| ((|k1| NIL) (% NIL))
        (SPADCALL (SPADCALL |k1| (QREFELT % 148)) (QREFELT % 149))) 

(SDEFUN |TRMANIP;simplifyExp;2F;48| ((|x| (F)) (% (F)))
        (SPROG
         ((#1=#:G256 NIL)
          (|term| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (#2=#:G260 NIL) (|k1| NIL) (#3=#:G257 NIL) (#4=#:G259 NIL)
          (|h| (|NonNegativeInteger|)) (|args| (|List| F))
          (|op| (|BasicOperator|)) (#5=#:G258 NIL) (|k2| NIL)
          (|lk2| #6=(|List| (|Kernel| F))) (|lk1| #6#)
          (|q| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|f| (F)))
         (SEQ
          (LETT |f|
                (SPADCALL (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT % 80)) %)
                          (|TRMANIP;smpexp| (SPADCALL |x| (QREFELT % 85)) %)
                          (QREFELT % 26)))
          (LETT |p| (SPADCALL |f| (QREFELT % 80)))
          (LETT |q| (SPADCALL |f| (QREFELT % 85)))
          (COND
           ((SPADCALL |p| (QREFELT % 150))
            (COND ((NULL (SPADCALL |q| (QREFELT % 150))) (EXIT |f|))))
           ('T (EXIT |f|)))
          (LETT |lk1| (SPADCALL |p| (QREFELT % 88)))
          (LETT |lk2| (SPADCALL |q| (QREFELT % 88)))
          (LETT |term| (|spadConstant| % 82))
          (SEQ (LETT |k2| NIL) (LETT #5# |lk2|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |k2| (CAR #5#)) NIL)) (GO G191)))
               (SEQ (LETT |op| (SPADCALL |k2| (QREFELT % 63)))
                    (LETT |args| (SPADCALL |k2| (QREFELT % 45)))
                    (LETT |h| (SPADCALL |k2| (QREFELT % 151)))
                    (COND
                     ((SPADCALL |op| (QREFELT % 13) (QREFELT % 152))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k1| NIL) (LETT #4# |lk1|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |k1| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((SPADCALL |k1| (QREFELT % 13) (QREFELT % 56))
                                 (SEQ
                                  (LETT |term|
                                        (SPADCALL |term|
                                                  (SPADCALL
                                                   (SPADCALL |op|
                                                             (LIST
                                                              (SPADCALL
                                                               (SPADCALL |args|
                                                                         1
                                                                         (QREFELT
                                                                          %
                                                                          69))
                                                               (QREFELT % 86)))
                                                             |h|
                                                             (QREFELT % 153))
                                                   (QREFELT % 154))
                                                  (QREFELT % 99)))
                                  (EXIT
                                   (PROGN (LETT #3# 1) (GO #7=#:G246))))))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
                       #7# (EXIT #3#))))
                    (EXIT
                     (COND
                      ((SPADCALL |op| '|%power| (QREFELT % 155))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |k1| NIL) (LETT #2# |lk1|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |k1| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |k1| '|%power| (QREFELT % 50))
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |args| 1 (QREFELT % 69))
                                     (|SPADfirst|
                                      (SPADCALL |k1| (QREFELT % 45)))
                                     (QREFELT % 105))
                                    (SEQ
                                     (LETT |term|
                                           (SPADCALL |term|
                                                     (SPADCALL
                                                      (SPADCALL |op|
                                                                (LIST
                                                                 (SPADCALL
                                                                  |args| 1
                                                                  (QREFELT %
                                                                           69))
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   |args| 2
                                                                   (QREFELT %
                                                                            69))
                                                                  (QREFELT %
                                                                           86)))
                                                                |h|
                                                                (QREFELT %
                                                                         153))
                                                      (QREFELT % 154))
                                                     (QREFELT % 99)))
                                     (EXIT
                                      (PROGN
                                       (LETT #1# 1)
                                       (GO #8=#:G251))))))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL)))
                        #8# (EXIT #1#))))))
               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
          (EXIT
           (SPADCALL (|TRMANIP;termexp| (SPADCALL |p| |term| (QREFELT % 99)) %)
                     (|TRMANIP;termexp| (SPADCALL |q| |term| (QREFELT % 99)) %)
                     (QREFELT % 26)))))) 

(SDEFUN |TRMANIP;htrigs;2F;49| ((|f| (F)) (% (F)))
        (SPROG
         ((|g1| (F)) (|b| (|Integer|)) (|g2| (F)) (|a| (F))
          (|den|
           #1=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|num| #1#) (|arg| (|List| F)) (#2=#:G272 NIL) (|x| NIL)
          (#3=#:G271 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| F))
          (|m| (|Union| (|Kernel| F) "failed")))
         (SEQ (LETT |m| (SPADCALL |f| (QREFELT % 157)))
              (EXIT
               (COND ((QEQCAR |m| 1) |f|)
                     (#4='T
                      (SEQ
                       (LETT |op|
                             (SPADCALL (LETT |k| (QCDR |m|)) (QREFELT % 63)))
                       (LETT |arg|
                             (PROGN
                              (LETT #3# NIL)
                              (SEQ (LETT |x| NIL)
                                   (LETT #2# (SPADCALL |k| (QREFELT % 45)))
                                   G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |x| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #3#
                                           (CONS (SPADCALL |x| (QREFELT % 149))
                                                 #3#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #3#)))))
                       (LETT |num|
                             (SPADCALL (SPADCALL |f| (QREFELT % 80)) |k|
                                       (QREFELT % 159)))
                       (LETT |den|
                             (SPADCALL (SPADCALL |f| (QREFELT % 85)) |k|
                                       (QREFELT % 159)))
                       (EXIT
                        (COND
                         ((SPADCALL |op| (QREFELT % 13) (QREFELT % 152))
                          (SEQ
                           (LETT |g1|
                                 (SPADCALL
                                  (SPADCALL (LETT |a| (|SPADfirst| |arg|))
                                            (QREFELT % 109))
                                  (SPADCALL |a| (QREFELT % 108))
                                  (QREFELT % 22)))
                           (LETT |g2|
                                 (SPADCALL (SPADCALL |a| (QREFELT % 109))
                                           (SPADCALL |a| (QREFELT % 108))
                                           (QREFELT % 23)))
                           (EXIT
                            (SPADCALL
                             (|TRMANIP;supexp| |num| |g1| |g2|
                              (LETT |b|
                                    (QUOTIENT2 (SPADCALL |num| (QREFELT % 161))
                                               2))
                              %)
                             (|TRMANIP;supexp| |den| |g1| |g2| |b| %)
                             (QREFELT % 26)))))
                         (#4#
                          (SPADCALL
                           (|TRMANIP;sup2htrigs| |num|
                            (LETT |g1| (SPADCALL |op| |arg| (QREFELT % 65))) %)
                           (|TRMANIP;sup2htrigs| |den| |g1| %)
                           (QREFELT % 26)))))))))))) 

(SDEFUN |TRMANIP;supexp|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|f1| (F)) (|f2| (F)) (|bse| (|Integer|)) (% (F)))
        (SPROG ((|ans| (F)) (|d| (|Integer|)) (|g| (F)))
               (SEQ (LETT |ans| (|spadConstant| % 37))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 163)
                                      (QREFELT % 164)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT % 165))
                                           (QREFELT % 84))
                                 (QREFELT % 149)))
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT % 161)) |bse|))
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT %
                                                                           51))
                                                        (QREFELT % 21))
                                              (QREFELT % 22))))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT %
                                                                           51))
                                                        (QREFELT % 21))
                                              (QREFELT % 22)))))))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 166)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;sup2htrigs|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (|f| (F)) (% (F)))
        (SPADCALL
         (SPADCALL (CONS (|function| |TRMANIP;smp2htrigs|) %) |p|
                   (QREFELT % 170))
         |f| (QREFELT % 171))) 

(SDEFUN |TRMANIP;exlog|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG
         ((#1=#:G293 NIL) (#2=#:G292 (F)) (#3=#:G294 (F)) (#4=#:G296 NIL)
          (|r| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |r| NIL)
                (LETT #4#
                      (SPADCALL (SPADCALL |p| (QREFELT % 173))
                                (QREFELT % 178)))
                G190
                (COND
                 ((OR (ATOM #4#) (PROGN (LETT |r| (CAR #4#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3#
                         (SPADCALL (QCAR |r|)
                                   (SPADCALL
                                    (SPADCALL (QCDR |r|) (QREFELT % 84))
                                    (QREFELT % 52))
                                   (QREFELT % 103)))
                   (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 22))))
                         ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T (|spadConstant| % 37))))))) 

(SDEFUN |TRMANIP;logexpand| ((|k| (|Kernel| F)) (% (F)))
        (SPROG
         ((#1=#:G303 NIL) (#2=#:G302 NIL) (|x| (F)) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |op| (SPADCALL |k| (QREFELT % 63)))
                      (QREFELT % 179))
            (SPADCALL |k| (QREFELT % 148)))
           ((SPADCALL |op| '|log| (QREFELT % 155))
            (SPADCALL
             (|TRMANIP;exlog|
              (SPADCALL
               (LETT |x|
                     (SPADCALL (|SPADfirst| (SPADCALL |k| (QREFELT % 45)))
                               (QREFELT % 141)))
               (QREFELT % 80))
              %)
             (|TRMANIP;exlog| (SPADCALL |x| (QREFELT % 85)) %) (QREFELT % 23)))
           ('T
            (SPADCALL |op|
                      (PROGN
                       (LETT #2# NIL)
                       (SEQ (LETT #1# (SPADCALL |k| (QREFELT % 45))) G190
                            (COND
                             ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #2#
                                    (CONS (SPADCALL |x| (QREFELT % 141))
                                          #2#))))
                            (LETT #1# (CDR #1#)) (GO G190) G191
                            (EXIT (NREVERSE #2#))))
                      (QREFELT % 65))))))) 

(SDEFUN |TRMANIP;kerexpand| ((|k| (|Kernel| F)) (% (F)))
        (SPROG
         ((#1=#:G326 NIL) (#2=#:G325 NIL) (#3=#:G324 NIL) (#4=#:G323 NIL)
          (|ctb| (F)) (|cta| (F)) (|tb| (F)) (|ta| (F)) (|a| (F)) (|b| (F))
          (|den| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|num| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|x| (F))
          (|arg| (F)) (|op| (|BasicOperator|)))
         (SEQ
          (COND
           ((SPADCALL (LETT |op| (SPADCALL |k| (QREFELT % 63)))
                      (QREFELT % 179))
            (SPADCALL |k| (QREFELT % 148)))
           ((SPADCALL |op| '|%power| (QREFELT % 155))
            (|TRMANIP;expandpow| |k| (ELT % 142) %))
           (#5='T
            (SEQ (LETT |arg| (|SPADfirst| (SPADCALL |k| (QREFELT % 45))))
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|sec| (QREFELT % 155))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT % 19)) (QREFELT % 142))
                     (QREFELT % 107)))
                   ((SPADCALL |op| '|csc| (QREFELT % 155))
                    (SPADCALL
                     (SPADCALL (SPADCALL |arg| (QREFELT % 20)) (QREFELT % 142))
                     (QREFELT % 107)))
                   ((SPADCALL |op| '|log| (QREFELT % 155))
                    (SPADCALL
                     (|TRMANIP;exlog|
                      (SPADCALL (LETT |x| (SPADCALL |arg| (QREFELT % 142)))
                                (QREFELT % 80))
                      %)
                     (|TRMANIP;exlog| (SPADCALL |x| (QREFELT % 85)) %)
                     (QREFELT % 23)))
                   (#5#
                    (SEQ (LETT |num| (SPADCALL |arg| (QREFELT % 80)))
                         (LETT |den| (SPADCALL |arg| (QREFELT % 85)))
                         (EXIT
                          (COND
                           ((SPADCALL
                             (LETT |b|
                                   (SPADCALL (SPADCALL |num| (QREFELT % 180))
                                             |den| (QREFELT % 181)))
                             (|spadConstant| % 37) (QREFELT % 182))
                            (SEQ
                             (LETT |a|
                                   (SPADCALL (SPADCALL |num| (QREFELT % 183))
                                             |den| (QREFELT % 181)))
                             (EXIT
                              (COND
                               ((SPADCALL |op| '|exp| (QREFELT % 155))
                                (SPADCALL
                                 (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                           (QREFELT % 100))
                                 (SPADCALL (SPADCALL |b| (QREFELT % 100))
                                           (QREFELT % 142))
                                 (QREFELT % 21)))
                               ((SPADCALL |op| '|sin| (QREFELT % 155))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                            (QREFELT % 20))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 19))
                                            (QREFELT % 142))
                                  (QREFELT % 21))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                            (QREFELT % 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 20))
                                            (QREFELT % 142))
                                  (QREFELT % 21))
                                 (QREFELT % 22)))
                               ((SPADCALL |op| '|cos| (QREFELT % 155))
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                            (QREFELT % 19))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 19))
                                            (QREFELT % 142))
                                  (QREFELT % 21))
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                            (QREFELT % 20))
                                  (SPADCALL (SPADCALL |b| (QREFELT % 20))
                                            (QREFELT % 142))
                                  (QREFELT % 21))
                                 (QREFELT % 23)))
                               ((SPADCALL |op| '|tan| (QREFELT % 155))
                                (SEQ
                                 (LETT |ta|
                                       (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                                 (QREFELT % 121)))
                                 (LETT |tb|
                                       (SPADCALL (SPADCALL |b| (QREFELT % 121))
                                                 (QREFELT % 142)))
                                 (EXIT
                                  (SPADCALL (SPADCALL |ta| |tb| (QREFELT % 22))
                                            (SPADCALL (|spadConstant| % 38)
                                                      (SPADCALL |ta| |tb|
                                                                (QREFELT % 21))
                                                      (QREFELT % 23))
                                            (QREFELT % 26)))))
                               ((SPADCALL |op| '|cot| (QREFELT % 155))
                                (SEQ
                                 (LETT |cta|
                                       (SPADCALL (SPADCALL |a| (QREFELT % 142))
                                                 (QREFELT % 119)))
                                 (LETT |ctb|
                                       (SPADCALL (SPADCALL |b| (QREFELT % 119))
                                                 (QREFELT % 142)))
                                 (EXIT
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL |cta| |ctb| (QREFELT % 21))
                                    (|spadConstant| % 38) (QREFELT % 23))
                                   (SPADCALL |ctb| |cta| (QREFELT % 22))
                                   (QREFELT % 26)))))
                               (#5#
                                (SPADCALL |op|
                                          (PROGN
                                           (LETT #4# NIL)
                                           (SEQ
                                            (LETT #3#
                                                  (SPADCALL |k|
                                                            (QREFELT % 45)))
                                            G190
                                            (COND
                                             ((OR (ATOM #3#)
                                                  (PROGN
                                                   (LETT |x| (CAR #3#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |x|
                                                               (QREFELT % 142))
                                                     #4#))))
                                            (LETT #3# (CDR #3#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                          (QREFELT % 65)))))))
                           (#5#
                            (SPADCALL |op|
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ
                                        (LETT #1#
                                              (SPADCALL |k| (QREFELT % 45)))
                                        G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN (LETT |x| (CAR #1#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |x| (QREFELT % 142))
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#))))
                                      (QREFELT % 65))))))))))))))) 

(SDEFUN |TRMANIP;smpexp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (F)))
        (SPROG ((|ans| (F)))
               (SEQ (LETT |ans| (|spadConstant| % 37))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 184)
                                      (QREFELT % 185)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (|TRMANIP;termexp|
                                           (SPADCALL |p| (QREFELT % 183)) %)
                                          (QREFELT % 22)))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 180)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |TRMANIP;simplify0| ((|x| (F)) (% (F)))
        (SPADCALL
         (SPADCALL
          (SPADCALL |x|
                    (LIST '|tan| '|cot| '|sec| '|csc| '|tanh| '|coth| '|sech|
                          '|csch|)
                    (LIST (CONS (|function| |TRMANIP;t2t|) %)
                          (CONS (|function| |TRMANIP;c2t|) %)
                          (CONS (|function| |TRMANIP;s2c|) %)
                          (CONS (|function| |TRMANIP;c2s|) %)
                          (CONS (|function| |TRMANIP;th2th|) %)
                          (CONS (|function| |TRMANIP;ch2th|) %)
                          (CONS (|function| |TRMANIP;sh2ch|) %)
                          (CONS (|function| |TRMANIP;ch2sh|) %))
                    (QREFELT % 188))
          (LIST '|sin| '|sinh|) (LIST 2 2)
          (LIST (CONS (|function| |TRMANIP;s2c2|) %)
                (CONS (|function| |TRMANIP;sh2ch2|) %))
          (QREFELT % 190))
         (QREFELT % 96))) 

(DECLAIM (NOTINLINE |TranscendentalManipulations;|)) 

(DEFUN |TranscendentalManipulations| (&REST #1=#:G371)
  (SPROG NIL
         (PROG (#2=#:G372)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TranscendentalManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |TranscendentalManipulations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TranscendentalManipulations|)))))))))) 

(DEFUN |TranscendentalManipulations;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|TranscendentalManipulations| DV$1 DV$2))
          (LETT % (GETREFV 191))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST
                                                               '|ConvertibleTo|
                                                               (LIST '|Pattern|
                                                                     (|devaluate|
                                                                      |#1|))))
                                               (|HasCategory| |#1|
                                                              (LIST
                                                               '|PatternMatchable|
                                                               (|devaluate|
                                                                |#1|)))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|ConvertibleTo|
                                                               (LIST '|Pattern|
                                                                     (|devaluate|
                                                                      |#1|))))
                                               (|HasCategory| |#2|
                                                              (LIST
                                                               '|PatternMatchable|
                                                               (|devaluate|
                                                                |#1|))))))))
          (|haddProp| |$ConstructorCache| '|TranscendentalManipulations|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 13
                    (SPADCALL (SPADCALL '|exp| (QREFELT % 11)) (QREFELT % 12)))
          (QSETREFV % 14
                    (SPADCALL (SPADCALL '|log| (QREFELT % 11)) (QREFELT % 12)))
          (COND
           ((|HasCategory| |#1| (LIST '|PatternMatchable| (|devaluate| |#1|)))
            (COND
             ((|HasCategory| |#1|
                             (LIST '|ConvertibleTo|
                                   (LIST '|Pattern| (|devaluate| |#1|))))
              (COND
               ((|HasCategory| |#2|
                               (LIST '|ConvertibleTo|
                                     (LIST '|Pattern| (|devaluate| |#1|))))
                (COND
                 ((|HasCategory| |#2|
                                 (LIST '|PatternMatchable| (|devaluate| |#1|)))
                  (PROGN
                   (QSETREFV % 17
                             (SPADCALL (SPADCALL (QREFELT % 15))
                                       (QREFELT % 16)))
                   (QSETREFV % 18
                             (SPADCALL (SPADCALL (QREFELT % 15))
                                       (QREFELT % 16)))
                   (QSETREFV % 29
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 19))
                               (SPADCALL (QREFELT % 18) (QREFELT % 20))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 20))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 20))
                                (QREFELT % 23))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 30
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 20))
                               (SPADCALL (QREFELT % 18) (QREFELT % 20))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 19))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 19))
                                (QREFELT % 23))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 31
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL (QREFELT % 17) (QREFELT % 19))
                               (SPADCALL (QREFELT % 18) (QREFELT % 19))
                               (QREFELT % 21))
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 23))
                                 (QREFELT % 19))
                                (SPADCALL
                                 (SPADCALL (QREFELT % 17) (QREFELT % 18)
                                           (QREFELT % 22))
                                 (QREFELT % 19))
                                (QREFELT % 22))
                               (SPADCALL 2 (QREFELT % 25)) (QREFELT % 26))
                              (QREFELT % 28)))
                   (QSETREFV % 36
                             (CONS
                              (|dispatchFunction|
                               |TRMANIP;expandTrigProducts;2F;1|)
                              %)))))))))))
          (COND
           ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
            (QSETREFV % 77
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;5|) %)))
           ('T
            (QSETREFV % 77
                      (CONS (|dispatchFunction| |TRMANIP;simplify;2F;6|) %))))
          %))) 

(MAKEPROP '|TranscendentalManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|BasicOperator|) (|Symbol|) (|CommonOperators|) (0 . |operator|)
              (5 . |operator|) '|opexp| '|oplog| (10 . |new|) (14 . |coerce|)
              'XX 'YY (19 . |cos|) (24 . |sin|) (29 . *) (35 . +) (41 . -)
              (|Integer|) (47 . |coerce|) (52 . /) (|RewriteRule| 6 6 7)
              (58 . |rule|) '|sinCosRule| '|sinSinRule| '|cosCosRule|
              (|List| 27) (|PositiveInteger|) (|ApplyRules| 6 6 7)
              (64 . |applyRules|) (71 . |expandTrigProducts|) (76 . |Zero|)
              (80 . |One|) (|Boolean|) (84 . |is?|) (|List| 70)
              (90 . |kernels|) (|List| 7) (|Kernel| 7) (95 . |argument|)
              |TRMANIP;simplifyLog;2F;3|
              (|Record| (|:| |coef| 24) (|:| |var| 70))
              (|Union| 47 '#1="failed") (100 . |isMult|) (105 . |is?|)
              (111 . ^) (117 . |log|) (122 . |numerator|) (127 . |denominator|)
              (132 . |freeOf?|) (138 . |is?|) (|Union| 64 '#1#)
              (144 . |isTimes|) (149 . |isPlus|)
              (|Record| (|:| |val| %) (|:| |exponent| 24)) (|Union| 60 '#1#)
              (154 . |isPower|) (159 . |operator|) (|List| %) (164 . |elt|)
              (|Union| (|Fraction| (|Polynomial| 6)) '"failed")
              (170 . |retractIfCan|) (175 . |One|) (179 . |elt|) (|Kernel| %)
              (185 . |retract|) (190 . ^) (196 . |setelt!|) (203 . |append|)
              (|AlgebraicManipulations| 6 7) (209 . |rootProduct|)
              (214 . |simplify|) (219 . |second|)
              (|SparseMultivariatePolynomial| 6 70) (224 . |numer|)
              (|SparseMultivariatePolynomial| 6 44) (229 . |One|) (233 . =)
              (239 . |coerce|) (244 . |denom|) (249 . -) (|List| 44)
              (254 . |variables|) (259 . |leadingCoefficient|) (264 . |coerce|)
              (|Mapping| 39 44) (269 . |select|) (|NonNegativeInteger|)
              (275 . |degree|) (281 . *) |TRMANIP;simplifyExp;2F;48|
              (287 . |kernel|) (293 . |monomial|) (300 . *) (306 . |exp|)
              |TRMANIP;expandPower;2F;9| (311 . |eval|) (318 . *)
              (324 . |first|) (329 . =) (335 . |setDifference|) (341 . |inv|)
              (346 . |sinh|) (351 . |cosh|) (|Mapping| % %) (356 . |eval|)
              (363 . |eval|) (371 . |sec|) |TRMANIP;cos2sec;2F;23|
              (376 . |csc|) |TRMANIP;sin2csc;2F;24| |TRMANIP;csc2sin;2F;25|
              |TRMANIP;sec2cos;2F;26| (381 . |cot|) |TRMANIP;tan2cot;2F;27|
              (386 . |tan|) |TRMANIP;cot2tan;2F;28| |TRMANIP;tan2trig;2F;29|
              |TRMANIP;cot2trig;2F;30| (391 . |sech|) |TRMANIP;cosh2sech;2F;31|
              (396 . |csch|) |TRMANIP;sinh2csch;2F;32|
              |TRMANIP;csch2sinh;2F;33| |TRMANIP;sech2cosh;2F;34|
              (401 . |coth|) |TRMANIP;tanh2coth;2F;35| (406 . |tanh|)
              |TRMANIP;coth2tanh;2F;36| |TRMANIP;tanh2trigh;2F;37|
              |TRMANIP;coth2trigh;2F;38| |TRMANIP;removeCosSq;2F;39|
              |TRMANIP;removeSinSq;2F;40| |TRMANIP;removeCoshSq;2F;41|
              |TRMANIP;removeSinhSq;2F;42| |TRMANIP;expandLog;2F;43|
              |TRMANIP;expand;2F;44| (411 . |coerce|) (|Mapping| 7 44)
              (|Mapping| 7 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 44) 44 6 81 7)
              (416 . |map|) (423 . |coerce|) |TRMANIP;htrigs;2F;49|
              (428 . |monomial?|) (433 . |height|) (438 . =) (444 . |kernel|)
              (451 . |coerce|) (456 . |is?|) (|Union| 70 '"failed")
              (462 . |mainKernel|) (|SparseUnivariatePolynomial| %)
              (467 . |univariate|) (|SparseUnivariatePolynomial| 81)
              (473 . |degree|) (478 . |Zero|) (482 . |Zero|) (486 . ~=)
              (492 . |leadingCoefficient|) (497 . |reductum|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 81)
              (|SparseUnivariatePolynomialFunctions2| 81 7) (502 . |map|)
              (508 . |elt|) (|Factored| %) (514 . |squareFree|)
              (|Record| (|:| |coef| 93) (|:| |logand| 81)) (|List| 174)
              (|Factored| 81) (|FactoredFunctions| 81) (519 . |log|)
              (524 . |nullary?|) (529 . |reductum|) (534 . /) (540 . ~=)
              (546 . |leadingMonomial|) (551 . |Zero|) (555 . ~=) (|List| 9)
              (|List| 110) (561 . |eval|) (|List| 93) (568 . |eval|))
           '#(|tanh2trigh| 576 |tanh2coth| 581 |tan2trig| 586 |tan2cot| 591
              |sinh2csch| 596 |sin2csc| 601 |simplifyLog| 606 |simplifyExp| 611
              |simplify| 616 |sech2cosh| 621 |sec2cos| 626 |removeSinhSq| 631
              |removeSinSq| 636 |removeCoshSq| 641 |removeCosSq| 646 |htrigs|
              651 |expandTrigProducts| 656 |expandPower| 661 |expandLog| 666
              |expand| 671 |csch2sinh| 676 |csc2sin| 681 |coth2trigh| 686
              |coth2tanh| 691 |cot2trig| 696 |cot2tan| 701 |cosh2sech| 706
              |cos2sec| 711)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|expand| (|#2| |#2|)) T)
                                   '((|simplify| (|#2| |#2|)) T)
                                   '((|htrigs| (|#2| |#2|)) T)
                                   '((|simplifyExp| (|#2| |#2|)) T)
                                   '((|simplifyLog| (|#2| |#2|)) T)
                                   '((|expandPower| (|#2| |#2|)) T)
                                   '((|expandLog| (|#2| |#2|)) T)
                                   '((|cos2sec| (|#2| |#2|)) T)
                                   '((|cosh2sech| (|#2| |#2|)) T)
                                   '((|cot2trig| (|#2| |#2|)) T)
                                   '((|coth2trigh| (|#2| |#2|)) T)
                                   '((|csc2sin| (|#2| |#2|)) T)
                                   '((|csch2sinh| (|#2| |#2|)) T)
                                   '((|sec2cos| (|#2| |#2|)) T)
                                   '((|sech2cosh| (|#2| |#2|)) T)
                                   '((|sin2csc| (|#2| |#2|)) T)
                                   '((|sinh2csch| (|#2| |#2|)) T)
                                   '((|tan2trig| (|#2| |#2|)) T)
                                   '((|tanh2trigh| (|#2| |#2|)) T)
                                   '((|tan2cot| (|#2| |#2|)) T)
                                   '((|tanh2coth| (|#2| |#2|)) T)
                                   '((|cot2tan| (|#2| |#2|)) T)
                                   '((|coth2tanh| (|#2| |#2|)) T)
                                   '((|removeCosSq| (|#2| |#2|)) T)
                                   '((|removeSinSq| (|#2| |#2|)) T)
                                   '((|removeCoshSq| (|#2| |#2|)) T)
                                   '((|removeSinhSq| (|#2| |#2|)) T)
                                   '((|expandTrigProducts| (|#2| |#2|))
                                     (AND (|has| 7 (|PatternMatchable| 6))
                                          (|has| 7
                                                 (|ConvertibleTo|
                                                  (|Pattern| 6)))
                                          (|has| 6
                                                 (|ConvertibleTo|
                                                  (|Pattern| 6)))
                                          (|has| 6 (|PatternMatchable| 6)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 190
                                            '(1 10 8 9 11 1 7 8 8 12 0 9 0 15 1
                                              7 0 9 16 1 7 0 0 19 1 7 0 0 20 2
                                              7 0 0 0 21 2 7 0 0 0 22 2 7 0 0 0
                                              23 1 7 0 24 25 2 7 0 0 0 26 2 27
                                              0 7 7 28 3 34 7 32 7 33 35 1 0 7
                                              7 36 0 7 0 37 0 7 0 38 2 7 39 0 9
                                              40 1 7 41 0 42 1 44 43 0 45 1 7
                                              48 0 49 2 44 39 0 9 50 2 7 0 0 24
                                              51 1 7 0 0 52 1 7 0 0 53 1 7 0 0
                                              54 2 7 39 0 9 55 2 44 39 0 8 56 1
                                              7 57 0 58 1 7 57 0 59 1 7 61 0 62
                                              1 44 8 0 63 2 7 0 8 64 65 1 7 66
                                              0 67 0 6 0 68 2 43 7 0 24 69 1 7
                                              70 0 71 2 7 0 0 0 72 3 43 7 0 24
                                              7 73 2 43 0 0 0 74 1 75 7 7 76 1
                                              0 7 7 77 1 43 7 0 78 1 7 79 0 80
                                              0 81 0 82 2 81 39 0 0 83 1 7 0 79
                                              84 1 7 79 0 85 1 7 0 0 86 1 81 87
                                              0 88 1 81 6 0 89 1 81 0 6 90 2 87
                                              0 91 0 92 2 81 93 0 44 94 2 7 0
                                              93 0 95 2 7 0 8 64 97 3 81 0 0 44
                                              93 98 2 81 0 0 0 99 1 7 0 0 100 3
                                              7 0 0 41 64 102 2 7 0 24 0 103 1
                                              43 7 0 104 2 7 39 0 0 105 2 87 0
                                              0 0 106 1 7 0 0 107 1 7 0 0 108 1
                                              7 0 0 109 3 7 0 0 9 110 111 4 7 0
                                              0 9 93 110 112 1 7 0 0 113 1 7 0
                                              0 115 1 7 0 0 119 1 7 0 0 121 1 7
                                              0 0 125 1 7 0 0 127 1 7 0 0 131 1
                                              7 0 0 133 1 7 0 6 143 3 146 7 144
                                              145 81 147 1 7 0 70 148 1 81 39 0
                                              150 1 44 93 0 151 2 8 39 0 0 152
                                              3 44 0 8 43 93 153 1 81 0 44 154
                                              2 8 39 0 9 155 1 7 156 0 157 2 81
                                              158 0 44 159 1 160 93 0 161 0 6 0
                                              162 0 160 0 163 2 160 39 0 0 164
                                              1 160 81 0 165 1 160 0 0 166 2
                                              169 167 168 160 170 2 167 7 0 7
                                              171 1 81 172 0 173 1 177 175 176
                                              178 1 8 39 0 179 1 81 0 0 180 2 7
                                              0 79 79 181 2 7 39 0 0 182 1 81 0
                                              0 183 0 81 0 184 2 81 39 0 0 185
                                              3 7 0 0 186 187 188 4 7 0 0 186
                                              189 187 190 1 0 7 7 135 1 0 7 7
                                              132 1 0 7 7 123 1 0 7 7 120 1 0 7
                                              7 128 1 0 7 7 116 1 0 7 7 46 1 0
                                              7 7 96 1 0 7 7 77 1 0 7 7 130 1 0
                                              7 7 118 1 0 7 7 140 1 0 7 7 138 1
                                              0 7 7 139 1 0 7 7 137 1 0 7 7 149
                                              1 1 7 7 36 1 0 7 7 101 1 0 7 7
                                              141 1 0 7 7 142 1 0 7 7 129 1 0 7
                                              7 117 1 0 7 7 136 1 0 7 7 134 1 0
                                              7 7 124 1 0 7 7 122 1 0 7 7 126 1
                                              0 7 7 114)))))
           '|lookupComplete|)) 
