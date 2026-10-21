
(SDEFUN |SOLVETRA;solve;EL;1|
        ((|oside| (|Expression| R)) (% (|List| (|Equation| (|Expression| R)))))
        (SPROG ((|lv| (|List| (|Symbol|))))
               (SEQ
                (COND
                 ((SPADCALL |oside| (QREFELT % 9))
                  (|error| "equation is always satisfied"))
                 (#1='T
                  (SEQ (LETT |lv| (SPADCALL |oside| (QREFELT % 11)))
                       (EXIT
                        (COND ((NULL |lv|) (|error| "inconsistent equation"))
                              ((> (LENGTH |lv|) 1)
                               (|error| "too many variables"))
                              (#1#
                               (SPADCALL |oside| (|SPADfirst| |lv|)
                                         (QREFELT % 15))))))))))) 

(SDEFUN |SOLVETRA;solve;EL;2|
        ((|equ| (|Equation| (|Expression| R)))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPADCALL
         (SPADCALL (SPADCALL |equ| (QREFELT % 18))
                   (SPADCALL |equ| (QREFELT % 19)) (QREFELT % 20))
         (QREFELT % 16))) 

(SDEFUN |SOLVETRA;solve;ESL;3|
        ((|equ| (|Equation| (|Expression| R))) (|x| (|Symbol|))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG ((|oneside| (|Expression| R)))
               (SEQ
                (LETT |oneside|
                      (SPADCALL (SPADCALL |equ| (QREFELT % 18))
                                (SPADCALL |equ| (QREFELT % 19))
                                (QREFELT % 20)))
                (EXIT (SPADCALL |oneside| |x| (QREFELT % 15)))))) 

(SDEFUN |SOLVETRA;testZero?|
        ((|lside| (|Expression| R)) (|sol| (|Equation| (|Expression| R)))
         (% (|Boolean|)))
        (SEQ
         (COND
          ((|HasCategory| (QREFELT % 6)
                          (LIST '|QuotientFieldCategory| '(|Integer|)))
           (COND
            ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT % 19)) (QREFELT % 24))
                     1)
             (EXIT 'T))))
          ((QEQCAR (SPADCALL (SPADCALL |sol| (QREFELT % 19)) (QREFELT % 26)) 1)
           (EXIT 'T)))
         (EXIT
          (COND
           ((SPADCALL
             (SPADCALL (SPADCALL |lside| |sol| (QREFELT % 28)) (QREFELT % 30))
             (QREFELT % 9))
            'T)
           ('T NIL))))) 

(SDEFUN |SOLVETRA;solve;ESL;5|
        ((|lside| (|Expression| R)) (|x| (|Symbol|))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG ((#1=#:G115 NIL) (|sol| NIL) (#2=#:G116 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |sol| NIL)
                      (LETT #2# (|SOLVETRA;solveInner| |lside| |x| %)) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |sol| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((|SOLVETRA;testZero?| |lside| |sol| %)
                          (LETT #1# (CONS |sol| #1#))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |SOLVETRA;solveInner|
        ((|lside| (|Expression| R)) (|x| (|Symbol|))
         (% (|List| (|Equation| (|Expression| R)))))
        (SPROG
         ((|ausgabe1| #1=(|List| (|Expression| R))) (X (|Symbol|))
          (|bigX| (|Expression| R)) (|eq1| (|Expression| R)) (|fatt| NIL)
          (#2=#:G161 NIL) (#3=#:G128 #4=(|List| (|Expression| R)))
          (#5=#:G126 #4#) (#6=#:G127 NIL) (|lr| #4#) (#7=#:G162 NIL)
          (|finv| (|Union| (|Expression| R) #8="failed"))
          (|r1| (|List| (|Expression| R))) (#9=#:G131 NIL)
          (|bigX_back| (|Expression| R)) (|ri| NIL) (#10=#:G163 NIL)
          (#11=#:G137 #12=(|List| (|Equation| (|Expression| R))))
          (#13=#:G135 #12#) (#14=#:G136 NIL) (|i| NIL) (#15=#:G164 NIL)
          (|elR| (|Expression| R))
          (|f| (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|lfatt|
           (|List|
            (|Record|
             (|:| |flag|
                  (|Union| #16="nil" #17="sqfr" #18="irred" #19="prime"))
             (|:| |factor| (|SparseUnivariatePolynomial| (|Expression| R)))
             (|:| |exponent| (|NonNegativeInteger|)))))
          (|ff| NIL) (#20=#:G165 NIL) (#21=#:G143 #4#) (#22=#:G141 #4#)
          (#23=#:G142 NIL) (|secondsol| #4#) (|j| NIL) (#24=#:G166 NIL)
          (|newlist| (|List| (|Equation| (|Expression| R))))
          (|newlside| (|Expression| R)) (|listofkernels| #1#)
          (|lfacts|
           (|List|
            (|Record| (|:| |flag| (|Union| #16# #17# #18# #19#))
                      (|:| |factor|
                           (|SparseMultivariatePolynomial| R
                                                           (|Kernel|
                                                            (|Expression| R))))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|frec| NIL) (#25=#:G167 NIL)
          (|sols| (|List| (|Equation| (|Expression| R)))) (#26=#:G160 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |lside| (|SOLVETRA;eliminateRoot| |lside| |x| %))
                (LETT |ausgabe1| (|SOLVETRA;tableXkernels| |lside| |x| %))
                (LETT X (SPADCALL (QREFELT % 31)))
                (EXIT
                 (COND
                  ((EQL (LENGTH |ausgabe1|) 1)
                   (SEQ (LETT |bigX| (|SPADfirst| |ausgabe1|))
                        (LETT |eq1|
                              (SPADCALL |lside|
                                        (SPADCALL |bigX|
                                                  (SPADCALL X (QREFELT % 32))
                                                  (QREFELT % 33))
                                        (QREFELT % 28)))
                        (LETT |f|
                              (SPADCALL |eq1| (SPADCALL X (QREFELT % 36))
                                        (QREFELT % 39)))
                        (LETT |lfatt|
                              (SPADCALL
                               (SPADCALL (SPADCALL |f| (QREFELT % 42))
                                         (QREFELT % 45))
                               (QREFELT % 49)))
                        (LETT |lr|
                              (PROGN
                               (LETT #6# NIL)
                               (SEQ (LETT |fatt| NIL) (LETT #2# |lfatt|) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |fatt| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (PROGN
                                       (LETT #3#
                                             (SPADCALL (QVELT |fatt| 1) |x|
                                                       (QREFELT % 52)))
                                       (COND
                                        (#6#
                                         (LETT #5#
                                               (SPADCALL #5# #3#
                                                         (QREFELT % 54))))
                                        ('T
                                         (PROGN
                                          (LETT #5# #3#)
                                          (LETT #6# 'T)))))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT NIL))
                               (COND (#6# #5#) (#27='T NIL))))
                        (LETT |r1| NIL)
                        (SEQ (LETT |i| 1) (LETT #7# (LENGTH |lr|)) G190
                             (COND ((|greater_SI| |i| #7#) (GO G191)))
                             (SEQ
                              (LETT |finv|
                                    (|SOLVETRA;funcinv| |bigX|
                                     (SPADCALL |lr| |i| (QREFELT % 56)) %))
                              (EXIT
                               (COND
                                ((QEQCAR |finv| 0)
                                 (LETT |r1| (CONS (QCDR |finv|) |r1|))))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (LETT |bigX_back|
                              (PROG2
                                  (LETT #9#
                                        (|SOLVETRA;funcinv| |bigX| |bigX| %))
                                  (QCDR #9#)
                                (|check_union2| (QEQCAR #9# 0)
                                                (|Expression| (QREFELT % 6))
                                                (|Union|
                                                 (|Expression| (QREFELT % 6))
                                                 #8#)
                                                #9#)))
                        (COND
                         ((NULL (|SOLVETRA;testkernel| |bigX_back| |x| %))
                          (SEQ
                           (COND
                            ((SPADCALL |bigX| |bigX_back| (QREFELT % 34))
                             (PROGN (LETT #26# NIL) (GO #28=#:G159))))
                           (EXIT
                            (PROGN
                             (LETT #26#
                                   (PROGN
                                    (LETT #14# NIL)
                                    (SEQ (LETT |ri| NIL) (LETT #10# |r1|) G190
                                         (COND
                                          ((OR (ATOM #10#)
                                               (PROGN
                                                (LETT |ri| (CAR #10#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #11#
                                                  (SPADCALL
                                                   (SPADCALL |bigX_back| |ri|
                                                             (QREFELT % 20))
                                                   |x| (QREFELT % 15)))
                                            (COND
                                             (#14#
                                              (LETT #13#
                                                    (SPADCALL #13# #11#
                                                              (QREFELT % 57))))
                                             ('T
                                              (PROGN
                                               (LETT #13# #11#)
                                               (LETT #14# 'T)))))))
                                         (LETT #10# (CDR #10#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#14# #13#) (#27# NIL))))
                             (GO #28#))))))
                        (LETT |newlist| NIL)
                        (SEQ (LETT |i| 1) (LETT #15# (LENGTH |r1|)) G190
                             (COND ((|greater_SI| |i| #15#) (GO G191)))
                             (SEQ
                              (LETT |elR|
                                    (|SOLVETRA;eliminateRoot|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |bigX_back|
                                                 (SPADCALL |r1| |i|
                                                           (QREFELT % 56))
                                                 (QREFELT % 20))
                                       (QREFELT % 59))
                                      (QREFELT % 60))
                                     |x| %))
                              (LETT |f|
                                    (SPADCALL |elR|
                                              (SPADCALL |x| (QREFELT % 36))
                                              (QREFELT % 39)))
                              (LETT |lfatt|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |f| (QREFELT % 42))
                                               (QREFELT % 62))
                                     (QREFELT % 49)))
                              (LETT |secondsol|
                                    (PROGN
                                     (LETT #23# NIL)
                                     (SEQ (LETT |ff| NIL) (LETT #20# |lfatt|)
                                          G190
                                          (COND
                                           ((OR (ATOM #20#)
                                                (PROGN
                                                 (LETT |ff| (CAR #20#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #21#
                                                   (SPADCALL (QVELT |ff| 1) |x|
                                                             (QREFELT % 52)))
                                             (COND
                                              (#23#
                                               (LETT #22#
                                                     (SPADCALL #22# #21#
                                                               (QREFELT %
                                                                        54))))
                                              ('T
                                               (PROGN
                                                (LETT #22# #21#)
                                                (LETT #23# 'T)))))))
                                          (LETT #20# (CDR #20#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#23# #22#) ('T NIL))))
                              (EXIT
                               (SEQ (LETT |j| 1)
                                    (LETT #24# (LENGTH |secondsol|)) G190
                                    (COND ((|greater_SI| |j| #24#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |newlist|
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL |x| (QREFELT % 32))
                                              (SPADCALL
                                               (SPADCALL |secondsol| |j|
                                                         (QREFELT % 56))
                                               (QREFELT % 64))
                                              (QREFELT % 33))
                                             |newlist|))))
                                    (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                    (EXIT NIL))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT |newlist|)))
                  (#27#
                   (SEQ (LETT |newlside| (|SOLVETRA;tryToTrans| |lside| |x| %))
                        (LETT |listofkernels|
                              (|SOLVETRA;tableXkernels| |newlside| |x| %))
                        (EXIT
                         (COND
                          ((EQL (LENGTH |listofkernels|) 1)
                           (SPADCALL |newlside| |x| (QREFELT % 15)))
                          (#27#
                           (SEQ
                            (LETT |lfacts|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |lside| (QREFELT % 59))
                                             (QREFELT % 68))
                                   (QREFELT % 71)))
                            (EXIT
                             (COND
                              ((> (LENGTH |lfacts|) 1)
                               (SEQ (LETT |sols| NIL)
                                    (SEQ (LETT |frec| NIL) (LETT #25# |lfacts|)
                                         G190
                                         (COND
                                          ((OR (ATOM #25#)
                                               (PROGN
                                                (LETT |frec| (CAR #25#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |sols|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL (QVELT |frec| 1)
                                                             (QREFELT % 60))
                                                   |x| (QREFELT % 15))
                                                  |sols| (QREFELT % 57)))))
                                         (LETT #25# (CDR #25#)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT |sols|)))
                              (#27#
                               (PROGN (LETT #26# NIL) (GO #28#)))))))))))))))
          #28# (EXIT #26#)))) 

(SDEFUN |SOLVETRA;simplifyingLog| ((|f| (|Expression| R)) (% (|Expression| R)))
        (SPROG
         ((|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                      (|:| |exponent| (|Integer|)))
            "failed"))
          (|rec|
           (|Record| (|:| |var| (|Kernel| (|Expression| R)))
                     (|:| |exponent| (|Integer|)))))
         (SEQ (LETT |u| (SPADCALL |f| '|exp| (QREFELT % 74)))
              (EXIT
               (COND
                ((QEQCAR |u| 0)
                 (SEQ (LETT |rec| (QCDR |u|))
                      (EXIT
                       (SPADCALL (QCDR |rec|)
                                 (|SPADfirst|
                                  (SPADCALL (QCAR |rec|) (QREFELT % 75)))
                                 (QREFELT % 76)))))
                ('T (SPADCALL |f| (QREFELT % 77)))))))) 

(SDEFUN |SOLVETRA;testkernel|
        ((|var1| (|Expression| R)) (|y| (|Symbol|)) (% (|Boolean|)))
        (SPROG ((|listvar1| (|List| (|Expression| R))))
               (SEQ (LETT |var1| (|SOLVETRA;eliminateRoot| |var1| |y| %))
                    (LETT |listvar1| (|SOLVETRA;tableXkernels| |var1| |y| %))
                    (EXIT
                     (COND
                      ((EQL (LENGTH |listvar1|) 1)
                       (COND
                        ((OR
                          (SPADCALL (SPADCALL |listvar1| 1 (QREFELT % 56))
                                    (SPADCALL |y| (QREFELT % 32))
                                    (QREFELT % 34))
                          (EQL (LENGTH |listvar1|) 0))
                         'T)
                        ('T NIL)))
                      ((EQL (LENGTH |listvar1|) 0) 'T) ('T NIL)))))) 

(SDEFUN |SOLVETRA;solveRetract|
        ((|lexpr| (|List| (|Expression| R))) (|lvar| (|List| (|Symbol|)))
         (%
          (|Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed")))
        (SPROG
         ((|expr| NIL) (#1=#:G199 NIL)
          (|rf| (|Union| (|Fraction| (|Polynomial| R)) "failed"))
          (#2=#:G198 NIL) (|nlexpr| (|List| (|Fraction| (|Polynomial| R)))))
         (SEQ
          (EXIT
           (SEQ (LETT |nlexpr| NIL)
                (SEQ (LETT |expr| NIL) (LETT #1# |lexpr|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |expr| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (LETT |rf| (SPADCALL |expr| (QREFELT % 81)))
                          (EXIT
                           (COND
                            ((QEQCAR |rf| 1)
                             (PROGN
                              (LETT #2# (CONS 1 "failed"))
                              (GO #3=#:G197)))
                            ('T (LETT |nlexpr| (CONS (QCDR |rf|) |nlexpr|))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 (SPADCALL |nlexpr| |lvar| (QREFELT % 85))))))
          #3# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;tryToTrans|
        ((|lside| (|Expression| R)) (|x| (|Symbol|)) (% (|Expression| R)))
        (SPROG
         ((|convLside| #1=(|Expression| R)) (|NormConvLside| (|Expression| R))
          (|listConvLside| #2=(|List| (|Expression| R)))
          (|cnormConvLside| (|Expression| R)) (|listcnorm| #2#)
          (|numlside| (|Expression| R)) (|resultLside| #1#))
         (SEQ
          (COND
           ((OR (|SOLVETRA;testTrig| |lside| |x| %)
                (|SOLVETRA;testHTrig| |lside| |x| %))
            (SEQ (LETT |convLside| (SPADCALL |lside| (QREFELT % 87)))
                 (LETT |resultLside| |convLside|)
                 (LETT |listConvLside|
                       (|SOLVETRA;tableXkernels| |convLside| |x| %))
                 (EXIT
                  (COND
                   ((> (LENGTH |listConvLside|) 1)
                    (SEQ
                     (LETT |NormConvLside|
                           (SPADCALL |convLside| |x| (QREFELT % 88)))
                     (LETT |NormConvLside| |NormConvLside|)
                     (EXIT
                      (LETT |resultLside|
                            (|SOLVETRA;subsTan| |NormConvLside| |x| %)))))))))
           ((|SOLVETRA;testLog| |lside| |x| %)
            (SEQ
             (LETT |numlside|
                   (SPADCALL (SPADCALL |lside| (QREFELT % 59)) (QREFELT % 60)))
             (EXIT
              (LETT |resultLside| (|SOLVETRA;combineLog| |numlside| |x| %)))))
           ('T
            (SEQ (LETT |NormConvLside| (SPADCALL |lside| |x| (QREFELT % 88)))
                 (LETT |NormConvLside| |NormConvLside|)
                 (LETT |resultLside| |NormConvLside|)
                 (LETT |listConvLside|
                       (|SOLVETRA;tableXkernels| |NormConvLside| |x| %))
                 (EXIT
                  (COND
                   ((> (LENGTH |listConvLside|) 1)
                    (SEQ
                     (LETT |cnormConvLside|
                           (SPADCALL |lside| |x| (QREFELT % 90)))
                     (LETT |cnormConvLside| |cnormConvLside|)
                     (LETT |resultLside| |cnormConvLside|)
                     (LETT |listcnorm|
                           (|SOLVETRA;tableXkernels| |cnormConvLside| |x| %))
                     (EXIT
                      (COND
                       ((> (LENGTH |listcnorm|) 1)
                        (COND
                         ((|SOLVETRA;testLog| |cnormConvLside| |x| %)
                          (SEQ
                           (LETT |numlside|
                                 (SPADCALL
                                  (SPADCALL |cnormConvLside| (QREFELT % 59))
                                  (QREFELT % 60)))
                           (EXIT
                            (LETT |resultLside|
                                  (|SOLVETRA;combineLog| |numlside| |x|
                                   %))))))))))))))))
          (EXIT |resultLside|)))) 

(SDEFUN |SOLVETRA;subsTan|
        ((|exprvar| (|Expression| R)) (|y| (|Symbol|)) (% (|Expression| R)))
        (SPROG
         ((Z (|Symbol|)) (|listofkern| (|List| (|Expression| R)))
          (|varkern| (|Expression| R)) (Y #1=(|Expression| R))
          (|test| (|Boolean|)) (|fZ| #2=(|Expression| R)) (|fN| #1#)
          (|f| #3=(|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|secondfun| (|Expression| R)) (|g| #3#) (H (|Expression| R))
          (|newH| #3#)
          (|result|
           (|Fraction| (|SparseUnivariatePolynomial| (|Expression| R))))
          (|result1| (|Expression| R)) (|resultnew| #2#) (#4=#:G218 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT Z (SPADCALL (QREFELT % 31)))
                (LETT |listofkern| (|SOLVETRA;tableXkernels| |exprvar| |y| %))
                (LETT |varkern| (|SPADfirst| |listofkern|))
                (LETT Y
                      (SPADCALL
                       (|SPADfirst|
                        (SPADCALL
                         (|SPADfirst| (SPADCALL |varkern| (QREFELT % 92)))
                         (QREFELT % 75)))
                       (QREFELT % 93)))
                (LETT |test|
                      (SPADCALL |varkern|
                                (SPADCALL
                                 (SPADCALL Y (SPADCALL 2 (QREFELT % 94))
                                           (QREFELT % 95))
                                 (QREFELT % 96))
                                (QREFELT % 34)))
                (COND
                 ((EQL (LENGTH |listofkern|) 1)
                  (COND
                   ((NULL |test|)
                    (PROGN (LETT #4# |exprvar|) (GO #5=#:G217)))))
                 (#6='T (PROGN (LETT #4# |exprvar|) (GO #5#))))
                (LETT |fZ|
                      (SPADCALL |exprvar|
                                (SPADCALL |varkern| (SPADCALL Z (QREFELT % 32))
                                          (QREFELT % 33))
                                (QREFELT % 28)))
                (LETT |fN| (SPADCALL |fZ| (QREFELT % 93)))
                (LETT |f|
                      (SPADCALL |fN| (SPADCALL Z (QREFELT % 36))
                                (QREFELT % 39)))
                (LETT |secondfun|
                      (SPADCALL
                       (SPADCALL (SPADCALL 2 Y (QREFELT % 98))
                                 (SPADCALL (SPADCALL Y 2 (QREFELT % 99))
                                           (|spadConstant| % 102)
                                           (QREFELT % 20))
                                 (QREFELT % 95))
                       (QREFELT % 103)))
                (LETT |g|
                      (SPADCALL |secondfun| (SPADCALL |y| (QREFELT % 36))
                                (QREFELT % 39)))
                (LETT H (SPADCALL (SPADCALL (QREFELT % 31)) (QREFELT % 32)))
                (LETT |newH|
                      (SPADCALL H (SPADCALL Z (QREFELT % 36)) (QREFELT % 39)))
                (LETT |result| (SPADCALL |f| |g| |newH| (QREFELT % 105)))
                (EXIT
                 (COND
                  ((SPADCALL |result| |f| (QREFELT % 106))
                   (SEQ (LETT |result1| (SPADCALL |result| H (QREFELT % 108)))
                        (EXIT
                         (LETT |resultnew|
                               (SPADCALL |result1|
                                         (SPADCALL H
                                                   (SPADCALL Y (QREFELT % 96))
                                                   (QREFELT % 33))
                                         (QREFELT % 28))))))
                  (#6# (PROGN (LETT #4# |exprvar|) (GO #5#)))))))
          #5# (EXIT #4#)))) 

(SDEFUN |SOLVETRA;eliminateKernRoot|
        ((|var| (|Expression| R)) (|varkern| (|Kernel| (|Expression| R)))
         (% (|Expression| R)))
        (SPROG
         ((X (|Symbol|)) (|var1| (|Expression| R))
          (|var2| (|SparseUnivariatePolynomial| (|Expression| R)))
          (#1=#:G229 NIL)
          (|var3| (|SparseUnivariatePolynomial| (|Expression| R)))
          (|resultvar| (|Expression| R)))
         (SEQ (LETT X (SPADCALL (QREFELT % 31)))
              (LETT |var1|
                    (SPADCALL |var|
                              (SPADCALL (SPADCALL |varkern| (QREFELT % 109))
                                        (SPADCALL X (QREFELT % 32))
                                        (QREFELT % 33))
                              (QREFELT % 28)))
              (LETT |var2|
                    (SPADCALL
                     (SPADCALL |var1| (SPADCALL X (QREFELT % 36))
                               (QREFELT % 39))
                     (QREFELT % 42)))
              (LETT |var3|
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 102)
                               (PROG1
                                   (LETT #1#
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |varkern| (QREFELT % 75))
                                           (QREFELT % 110))
                                          (QREFELT % 111)))
                                 (|check_subtype2| (>= #1# 0)
                                                   '(|NonNegativeInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT % 113))
                     (SPADCALL
                      (|SPADfirst| (SPADCALL |varkern| (QREFELT % 75))) 0
                      (QREFELT % 113))
                     (QREFELT % 114)))
              (EXIT
               (LETT |resultvar| (SPADCALL |var2| |var3| (QREFELT % 115))))))) 

(SDEFUN |SOLVETRA;eliminateRoot|
        ((|var| #1=(|Expression| R)) (|y| (|Symbol|)) (% (|Expression| R)))
        (SPROG
         ((|varlistk1| (|List| (|Expression| R))) (|i| NIL) (#2=#:G240 NIL)
          (|var1| #1#))
         (SEQ (LETT |var1| |var|)
              (SEQ G190
                   (COND
                    ((NULL (|SOLVETRA;testRootk| |var1| |y| %)) (GO G191)))
                   (SEQ
                    (LETT |varlistk1| (|SOLVETRA;tableXkernels| |var1| |y| %))
                    (EXIT
                     (SEQ (LETT |i| NIL) (LETT #2# |varlistk1|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL |i| '|nthRoot| (QREFELT % 116))
                              (LETT |var1|
                                    (|SOLVETRA;eliminateKernRoot| |var1|
                                     (|SPADfirst|
                                      (SPADCALL |i| (QREFELT % 92)))
                                     %))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |var1|)))) 

(SDEFUN |SOLVETRA;logsumtolog| ((|var| (|Expression| R)) (% (|Expression| R)))
        (SPROG
         ((|listofexpr| (|Union| (|List| (|Expression| R)) "failed"))
          (#1=#:G258 NIL) (|exprcoeff| (R)) (|listforgcd| (|List| R))
          (|gcdcoeff| (|Expression| R)) (#2=#:G259 NIL)
          (|exprlist| (|List| (|Expression| R))) (|newexpr| (|Expression| R))
          (|kernelofvar| (|List| (|Kernel| (|Expression| R)))) (|i| NIL)
          (#3=#:G260 NIL) (|var2| (|Expression| R)))
         (SEQ (LETT |listofexpr| (SPADCALL |var| (QREFELT % 118)))
              (EXIT
               (COND ((QEQCAR |listofexpr| 1) |var|)
                     ('T
                      (SEQ (LETT |listofexpr| (CONS 0 (QCDR |listofexpr|)))
                           (LETT |listforgcd| NIL)
                           (SEQ (LETT |i| NIL) (LETT #1# (QCDR |listofexpr|))
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |i| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |exprcoeff|
                                       (SPADCALL (SPADCALL |i| (QREFELT % 59))
                                                 (QREFELT % 119)))
                                 (EXIT
                                  (LETT |listforgcd|
                                        (CONS |exprcoeff| |listforgcd|))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |gcdcoeff|
                                 (SPADCALL
                                  (SPADCALL |listforgcd| (QREFELT % 120))
                                  (QREFELT % 121)))
                           (LETT |newexpr| (|spadConstant| % 122))
                           (SEQ (LETT |i| NIL) (LETT #2# (QCDR |listofexpr|))
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |i| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |exprlist| (|SOLVETRA;splitExpr| |i| %))
                                 (EXIT
                                  (LETT |newexpr|
                                        (SPADCALL |newexpr|
                                                  (|SOLVETRA;logexpp|
                                                   (SPADCALL |exprlist| 2
                                                             (QREFELT % 56))
                                                   (SPADCALL
                                                    (SPADCALL |exprlist| 1
                                                              (QREFELT % 56))
                                                    |gcdcoeff| (QREFELT % 95))
                                                   %)
                                                  (QREFELT % 123)))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (LETT |kernelofvar|
                                 (SPADCALL |newexpr| (QREFELT % 92)))
                           (LETT |var2| (|spadConstant| % 102))
                           (SEQ (LETT |i| NIL) (LETT #3# |kernelofvar|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |i| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |var2|
                                        (SPADCALL |var2|
                                                  (|SPADfirst|
                                                   (SPADCALL |i|
                                                             (QREFELT % 75)))
                                                  (QREFELT % 124)))))
                                (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (SPADCALL |gcdcoeff|
                                      (SPADCALL |var2| (QREFELT % 77))
                                      (QREFELT % 124)))))))))) 

(SDEFUN |SOLVETRA;testLog|
        ((|expr| (|Expression| R)) (Z (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|testList| (|List| (|Symbol|)))
          (|kernelofexpr| (|List| (|Expression| R))) (|i| NIL) (#1=#:G269 NIL)
          (#2=#:G268 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |testList| (LIST '|log|))
                (LETT |kernelofexpr| (|SOLVETRA;tableXkernels| |expr| Z %))
                (COND
                 ((EQL (LENGTH |kernelofexpr|) 0)
                  (PROGN (LETT #2# NIL) (GO #3=#:G267))))
                (SEQ (LETT |i| NIL) (LETT #1# |kernelofexpr|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL
                          (SPADCALL (|SPADfirst| (SPADCALL |i| (QREFELT % 92)))
                                    (QREFELT % 126))
                          |testList| (QREFELT % 127))
                         (COND
                          ((NULL
                            (|SOLVETRA;testkernel|
                             (|SPADfirst|
                              (SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT % 92)))
                               (QREFELT % 75)))
                             Z %))
                           (PROGN (LETT #2# NIL) (GO #3#)))))
                        ('T (PROGN (LETT #2# NIL) (GO #3#))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;splitExpr|
        ((|expr| #1=(|Expression| R)) (% (|List| (|Expression| R))))
        (SPROG
         ((|lcoeff| (R)) (|exprwcoeff| #1#)
          (|listexpr| (|Union| (|List| (|Expression| R)) "failed")))
         (SEQ
          (LETT |lcoeff|
                (SPADCALL (SPADCALL |expr| (QREFELT % 59)) (QREFELT % 119)))
          (LETT |exprwcoeff| |expr|)
          (LETT |listexpr| (SPADCALL |exprwcoeff| (QREFELT % 128)))
          (EXIT
           (COND ((QEQCAR |listexpr| 1) (LIST (|spadConstant| % 102) |expr|))
                 ('T
                  (SEQ
                   (LETT |listexpr|
                         (CONS 0
                               (SPADCALL (SPADCALL |lcoeff| (QREFELT % 121))
                                         (QCDR |listexpr|) (QREFELT % 129))))
                   (EXIT
                    (CONS (SPADCALL |lcoeff| (QREFELT % 121))
                          (QCDR |listexpr|)))))))))) 

(SDEFUN |SOLVETRA;buildnexpr|
        ((|expr| (|Expression| R)) (Z (|Symbol|))
         (% (|List| (|Expression| R))))
        (SPROG
         ((|nlist| (|List| (|Expression| R)))
          (|n2list| (|List| (|Expression| R))) (|i| NIL) (#1=#:G285 NIL)
          (|anscoeff| (|Expression| R)) (|ansmant| (|Expression| R)))
         (SEQ (LETT |nlist| (|SOLVETRA;splitExpr| |expr| %))
              (LETT |n2list|
                    (SPADCALL (SPADCALL |nlist| 1 (QREFELT % 56)) |nlist|
                              (QREFELT % 129)))
              (LETT |anscoeff| (|spadConstant| % 102))
              (LETT |ansmant| (|spadConstant| % 122))
              (SEQ (LETT |i| NIL) (LETT #1# |n2list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |i| Z (QREFELT % 131))
                       (LETT |anscoeff|
                             (SPADCALL |i| |anscoeff| (QREFELT % 124))))
                      ('T (LETT |ansmant| |i|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (LIST |anscoeff|
                     (SPADCALL |ansmant| (SPADCALL |nlist| 1 (QREFELT % 56))
                               (QREFELT % 124))))))) 

(SDEFUN |SOLVETRA;logexpp|
        ((|expr1| (|Expression| R)) (|expr2| (|Expression| R))
         (% (|Expression| R)))
        (SPADCALL
         (SPADCALL
          (|SPADfirst|
           (SPADCALL (|SPADfirst| (SPADCALL |expr1| (QREFELT % 92)))
                     (QREFELT % 75)))
          |expr2| (QREFELT % 132))
         (QREFELT % 77))) 

(SDEFUN |SOLVETRA;combineLog|
        ((|expr| (|Expression| R)) (Y (|Symbol|)) (% (|Expression| R)))
        (SPROG
         ((|exprtable| (|Table| (|Expression| R) (|Expression| R)))
          (|loopexpr| (|Expression| R)) (|exprr| (|List| (|Expression| R)))
          (|ans| #1=(|Expression| R)) (|i| NIL) (#2=#:G308 NIL)
          (|ansexpr| #1#))
         (SEQ (LETT |exprtable| (SPADCALL (QREFELT % 134)))
              (EXIT
               (COND ((QEQCAR (SPADCALL |expr| (QREFELT % 118)) 1) |expr|)
                     ('T
                      (SEQ (LETT |ans| (|spadConstant| % 122))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (SPADCALL |expr| (|spadConstant| % 122)
                                             (QREFELT % 135)))
                                  (GO G191)))
                                (SEQ
                                 (LETT |loopexpr|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |expr| (QREFELT % 59))
                                         (QREFELT % 136))
                                        (QREFELT % 60)))
                                 (COND
                                  ((|SOLVETRA;testLog| |loopexpr| Y %)
                                   (COND
                                    ((EQL
                                      (LENGTH
                                       (|SOLVETRA;tableXkernels| |loopexpr| Y
                                        %))
                                      1)
                                     (SEQ
                                      (LETT |exprr|
                                            (|SOLVETRA;buildnexpr| |loopexpr| Y
                                             %))
                                      (COND
                                       ((QEQCAR
                                         (SPADCALL
                                          (SPADCALL |exprr| 1 (QREFELT % 56))
                                          |exprtable| (QREFELT % 138))
                                         1)
                                        (SPADCALL |exprtable|
                                                  (SPADCALL |exprr| 1
                                                            (QREFELT % 56))
                                                  (|spadConstant| % 122)
                                                  (QREFELT % 139))))
                                      (EXIT
                                       (SPADCALL |exprtable|
                                                 (SPADCALL |exprr| 1
                                                           (QREFELT % 56))
                                                 (SPADCALL
                                                  (SPADCALL |exprtable|
                                                            (SPADCALL |exprr| 1
                                                                      (QREFELT
                                                                       % 56))
                                                            (QREFELT % 140))
                                                  (SPADCALL |exprr| 2
                                                            (QREFELT % 56))
                                                  (QREFELT % 123))
                                                 (QREFELT % 139)))))
                                    ('T
                                     (LETT |ans|
                                           (SPADCALL |ans| |loopexpr|
                                                     (QREFELT % 123))))))
                                  ('T
                                   (LETT |ans|
                                         (SPADCALL |ans| |loopexpr|
                                                   (QREFELT % 123)))))
                                 (EXIT
                                  (LETT |expr|
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |expr| (QREFELT % 59))
                                          (QREFELT % 141))
                                         (QREFELT % 60)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (LETT |ansexpr| (|spadConstant| % 122))
                           (SEQ (LETT |i| NIL)
                                (LETT #2#
                                      (SPADCALL |exprtable| (QREFELT % 142)))
                                G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |i| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |ansexpr|
                                        (SPADCALL |ansexpr|
                                                  (SPADCALL
                                                   (|SOLVETRA;logsumtolog|
                                                    (SPADCALL |exprtable| |i|
                                                              (QREFELT % 140))
                                                    %)
                                                   |i| (QREFELT % 124))
                                                  (QREFELT % 123)))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (EXIT
                            (LETT |ansexpr|
                                  (SPADCALL |ansexpr| |ans|
                                            (QREFELT % 123))))))))))) 

(SDEFUN |SOLVETRA;testRootk|
        ((|varlistk| (|Expression| R)) (|y| (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|kernelofeqnvar| (|List| (|Expression| R))) (|i| NIL)
          (#1=#:G316 NIL) (#2=#:G315 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |varlistk| |y| %))
            (EXIT
             (COND ((NULL |kernelofeqnvar|) NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| NIL) (LETT #1# |kernelofeqnvar|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (COND
                             ((SPADCALL
                               (|SPADfirst| (SPADCALL |i| (QREFELT % 92)))
                               '|nthRoot| (QREFELT % 143))
                              (PROGN (LETT #2# 'T) (GO #3=#:G314))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (EXIT NIL)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;tableXkernels|
        ((|evar| (|Expression| R)) (Z (|Symbol|))
         (% (|List| (|Expression| R))))
        (SPROG
         ((|kOfvar| (|List| (|Kernel| (|Expression| R)))) (|i| NIL)
          (#1=#:G322 NIL) (|listkOfvar| (|List| (|Expression| R))))
         (SEQ (LETT |kOfvar| (SPADCALL |evar| (QREFELT % 92)))
              (LETT |listkOfvar| NIL)
              (SEQ (LETT |i| NIL) (LETT #1# |kOfvar|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |i| (QREFELT % 109)) Z
                                  (QREFELT % 131)))
                       (LETT |listkOfvar|
                             (CONS (SPADCALL |i| (QREFELT % 109))
                                   |listkOfvar|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |listkOfvar|)))) 

(SDEFUN |SOLVETRA;testTrig|
        ((|eqnvar| (|Expression| R)) (Z (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))) (|i| NIL) (#1=#:G331 NIL)
          (#2=#:G330 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z %))
                (EXIT
                 (COND ((NULL |kernelofeqnvar|) NIL)
                       ('T
                        (SEQ
                         (LETT |testList|
                               (LIST '|sin| '|cos| '|tan| '|cot| '|sec|
                                     '|csc|))
                         (SEQ (LETT |i| NIL) (LETT #1# |kernelofeqnvar|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |i| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT % 92)))
                                    (QREFELT % 126))
                                   |testList| (QREFELT % 127))
                                  (COND
                                   ((NULL
                                     (|SOLVETRA;testkernel|
                                      (|SPADfirst|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL |i| (QREFELT % 92)))
                                        (QREFELT % 75)))
                                      Z %))
                                    (PROGN (LETT #2# NIL) (GO #3=#:G329)))))
                                 ('T (PROGN (LETT #2# NIL) (GO #3#))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;testHTrig|
        ((|eqnvar| (|Expression| R)) (Z (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|kernelofeqnvar| (|List| (|Expression| R)))
          (|testList| (|List| (|Symbol|))) (|i| NIL) (#1=#:G340 NIL)
          (#2=#:G339 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |kernelofeqnvar| (|SOLVETRA;tableXkernels| |eqnvar| Z %))
                (EXIT
                 (COND ((NULL |kernelofeqnvar|) NIL)
                       ('T
                        (SEQ
                         (LETT |testList|
                               (LIST '|sinh| '|cosh| '|tanh| '|coth| '|sech|
                                     '|csch|))
                         (SEQ (LETT |i| NIL) (LETT #1# |kernelofeqnvar|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |i| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL
                                    (|SPADfirst| (SPADCALL |i| (QREFELT % 92)))
                                    (QREFELT % 126))
                                   |testList| (QREFELT % 127))
                                  (COND
                                   ((NULL
                                     (|SOLVETRA;testkernel|
                                      (|SPADfirst|
                                       (SPADCALL
                                        (|SPADfirst|
                                         (SPADCALL |i| (QREFELT % 92)))
                                        (QREFELT % 75)))
                                      Z %))
                                    (PROGN (LETT #2# NIL) (GO #3=#:G338)))))
                                 ('T (PROGN (LETT #2# NIL) (GO #3#))))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                         (EXIT 'T)))))))
          #3# (EXIT #2#)))) 

(SDEFUN |SOLVETRA;makeInterval|
        ((|l| (R)) (% (|Complex| (|Interval| (|Float|)))))
        (COND
         ((|HasCategory| (QREFELT % 6)
                         (LIST '|ConvertibleTo| (LIST '|Complex| '(|Float|))))
          (SPADCALL (ELT % 146) (SPADCALL |l| (QREFELT % 148))
                    (QREFELT % 152)))
         ('T (|error| "This should never happen")))) 

(SDEFUN |SOLVETRA;dropfun| ((|x| (|Expression| R)) (% (|Expression| R)))
        (SPROG
         ((|k| (|Union| (|Kernel| (|Expression| R)) "failed")) (#1=#:G354 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 154)))
                 (EXIT
                  (COND
                   ((OR (QEQCAR |k| 1)
                        (NULL (SPADCALL (QCDR |k|) (QREFELT % 75))))
                    (PROGN
                     (LETT #1# (|spadConstant| % 122))
                     (GO #2=#:G352))))))
            (EXIT (|SPADfirst| (SPADCALL (QCDR |k|) (QREFELT % 75))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SOLVETRA;funcinv|
        ((|k| (|Expression| R)) (|l| (|Expression| R))
         (% (|Union| (|Expression| R) "failed")))
        (SPROG
         ((|ze| (|Expression| (|Complex| (|Interval| (|Float|)))))
          (|z| (|Union| (|Complex| (|Interval| (|Float|))) "failed"))
          (|im| (|Interval| (|Float|))) (|fpi| (|Float|))
          (|t| (|Expression| R)))
         (SEQ
          (COND
           ((SPADCALL |k| '|sin| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|sin| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1='T (CONS 0 (SPADCALL |l| (QREFELT % 155))))))
           ((SPADCALL |k| '|cos| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|cos| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 156))))))
           ((SPADCALL |k| '|tan| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|tan| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 157))))))
           ((SPADCALL |k| '|cot| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|cot| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 158))))))
           ((SPADCALL |k| '|sec| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|sec| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 159))))))
           ((SPADCALL |k| '|csc| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             ((SPADCALL |l| '|csc| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 160))))))
           ((SPADCALL |k| '|sinh| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|sinh| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 161))))))
           ((SPADCALL |k| '|cosh| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|cosh| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 162))))))
           ((SPADCALL |k| '|tanh| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|tanh| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 163))))))
           ((SPADCALL |k| '|coth| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|coth| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 164))))))
           ((SPADCALL |k| '|sech| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|sech| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 165))))))
           ((SPADCALL |k| '|csch| (QREFELT % 116))
            (COND
             ((SPADCALL |l| '|csch| (QREFELT % 116))
              (CONS 0 (|SOLVETRA;dropfun| |l| %)))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 166))))))
           ((SPADCALL |k| '|atan| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 96))))
           ((SPADCALL |k| '|acot| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 167))))))
           ((SPADCALL |k| '|asin| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 168))))
           ((SPADCALL |k| '|acos| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 169))))
           ((SPADCALL |k| '|asec| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 170))))
           ((SPADCALL |k| '|acsc| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 171))))))
           ((SPADCALL |k| '|asinh| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 172))))
           ((SPADCALL |k| '|acosh| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 173))))
           ((SPADCALL |k| '|atanh| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 174))))
           ((SPADCALL |k| '|acoth| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 175))))))
           ((SPADCALL |k| '|asech| (QREFELT % 116))
            (CONS 0 (SPADCALL |l| (QREFELT % 176))))
           ((SPADCALL |k| '|acsch| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 177))))))
           ((SPADCALL |k| '|exp| (QREFELT % 116))
            (COND
             ((SPADCALL |l| (|spadConstant| % 122) (QREFELT % 34))
              (CONS 1 "failed"))
             (#1# (CONS 0 (|SOLVETRA;simplifyingLog| |l| %)))))
           ((SPADCALL |k| '|log| (QREFELT % 116))
            (COND
             ((|HasCategory| (QREFELT % 6)
                             (LIST '|ConvertibleTo|
                                   (LIST '|Complex| '(|Float|))))
              (SEQ
               (LETT |ze|
                     (SPADCALL (CONS (|function| |SOLVETRA;makeInterval|) %)
                               |l| (QREFELT % 181)))
               (LETT |z| (SPADCALL |ze| (QREFELT % 183)))
               (EXIT
                (COND ((QEQCAR |z| 1) (CONS 0 (SPADCALL |l| (QREFELT % 184))))
                      (#1#
                       (SEQ (LETT |im| (SPADCALL (QCDR |z|) (QREFELT % 185)))
                            (LETT |fpi| (SPADCALL (QREFELT % 186)))
                            (COND
                             ((SPADCALL (SPADCALL |fpi| (QREFELT % 187))
                                        (SPADCALL |im| (QREFELT % 188))
                                        (QREFELT % 189))
                              (COND
                               ((SPADCALL (SPADCALL |im| (QREFELT % 190)) |fpi|
                                          (QREFELT % 191))
                                (EXIT
                                 (CONS 0 (SPADCALL |l| (QREFELT % 184))))))))
                            (EXIT (CONS 1 "failed"))))))))
             (#1# (CONS 0 (SPADCALL |l| (QREFELT % 184))))))
           ((SPADCALL |k| '|%power| (QREFELT % 116))
            (SEQ (LETT |t| (SPADCALL |l| (QREFELT % 30)))
                 (EXIT
                  (COND
                   ((SPADCALL |t| (|spadConstant| % 122) (QREFELT % 34))
                    (CONS 1 "failed"))
                   (#1# (CONS 0 (SPADCALL |t| (QREFELT % 77))))))))
           (#1# (CONS 0 |l|)))))) 

(SDEFUN |SOLVETRA;ker2Poly|
        ((|k| (|Kernel| (|Expression| R))) (|lvar| (|List| (|Symbol|)))
         (% (|Polynomial| (|Expression| R))))
        (SPROG ((|nm| (|Symbol|)))
               (COND
                ((SPADCALL (LETT |nm| (SPADCALL |k| (QREFELT % 126))) |lvar|
                           (QREFELT % 127))
                 (SPADCALL |nm| (QREFELT % 193)))
                ('T
                 (SPADCALL (SPADCALL |k| (QREFELT % 109)) (QREFELT % 194)))))) 

(SDEFUN |SOLVETRA;smp2Poly|
        ((|pol| (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R))))
         (|lvar| (|List| (|Symbol|))) (% (|Polynomial| (|Expression| R))))
        (SPROG NIL
               (SPADCALL (CONS #'|SOLVETRA;smp2Poly!0| (VECTOR % |lvar|))
                         (CONS #'|SOLVETRA;smp2Poly!1| %) |pol|
                         (QREFELT % 198)))) 

(SDEFUN |SOLVETRA;smp2Poly!1| ((|y| NIL) (% NIL))
        (SPADCALL (SPADCALL |y| (QREFELT % 121)) (QREFELT % 194))) 

(SDEFUN |SOLVETRA;smp2Poly!0| ((|x| NIL) ($$ NIL))
        (PROG (|lvar| %)
          (LETT |lvar| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|SOLVETRA;ker2Poly| |x| |lvar| %))))) 

(SDEFUN |SOLVETRA;makeFracPoly|
        ((|expr| (|Expression| R)) (|lvar| (|List| (|Symbol|)))
         (% (|Fraction| (|Polynomial| (|Expression| R)))))
        (SPADCALL
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT % 59)) |lvar| %)
         (|SOLVETRA;smp2Poly| (SPADCALL |expr| (QREFELT % 199)) |lvar| %)
         (QREFELT % 201))) 

(SDEFUN |SOLVETRA;makeREpol|
        ((|pol| (|Polynomial| (|Expression| R))) (% (|Expression| R)))
        (SPROG
         ((|lvar| (|List| (|Symbol|))) (#1=#:G423 NIL) (|v| NIL)
          (#2=#:G424 NIL) (|lval| (|List| (|Expression| R))))
         (SEQ (LETT |lvar| (SPADCALL |pol| (QREFELT % 202)))
              (LETT |lval|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |v| NIL) (LETT #2# |lvar|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |v| (QREFELT % 32)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT
               (SPADCALL (SPADCALL |pol| |lvar| |lval| (QREFELT % 203))
                         (QREFELT % 204)))))) 

(SDEFUN |SOLVETRA;makeRE|
        ((|frac| (|Fraction| (|Polynomial| (|Expression| R))))
         (% (|Expression| R)))
        (SPADCALL (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT % 205)) %)
                  (|SOLVETRA;makeREpol| (SPADCALL |frac| (QREFELT % 206)) %)
                  (QREFELT % 95))) 

(SDEFUN |SOLVETRA;solve1Pol|
        ((|pol| (|Polynomial| (|Expression| R))) (|var| (|Symbol|))
         (|sol| (|List| (|Equation| (|Expression| R))))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((|repol| (|Expression| R))
          (|vsols| (|List| (|Equation| (|Expression| R)))) (#1=#:G430 NIL)
          (|vsol| NIL) (#2=#:G431 NIL))
         (SEQ
          (LETT |repol|
                (SPADCALL (|SOLVETRA;makeREpol| |pol| %) |sol|
                          (QREFELT % 208)))
          (LETT |vsols| (SPADCALL |repol| |var| (QREFELT % 15)))
          (EXIT
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |vsol| NIL) (LETT #2# |vsols|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |vsol| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ (EXIT (LETT #1# (CONS (CONS |vsol| |sol|) #1#))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |SOLVETRA;solve1Sys|
        ((|plist| (|List| (|Polynomial| (|Expression| R))))
         (|lvar| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((|rplist| (|List| (|Polynomial| (|Expression| R))))
          (|rlvar| (|List| (|Symbol|))) (|v| NIL) (#1=#:G440 NIL) (|p| NIL)
          (#2=#:G439 NIL) (|sol| NIL) (#3=#:G441 NIL)
          (#4=#:G435 #5=(|List| (|List| (|Equation| (|Expression| R)))))
          (#6=#:G433 #5#) (#7=#:G434 NIL)
          (|sols| (|List| (|List| (|Equation| (|Expression| R))))))
         (SEQ (LETT |rplist| (REVERSE |plist|)) (LETT |rlvar| (REVERSE |lvar|))
              (LETT |sols| (SPADCALL NIL (QREFELT % 209)))
              (SEQ (LETT |v| NIL) (LETT #1# |rlvar|) (LETT |p| NIL)
                   (LETT #2# |rplist|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL) (ATOM #1#)
                         (PROGN (LETT |v| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |sols|
                           (PROGN
                            (LETT #7# NIL)
                            (SEQ (LETT |sol| NIL) (LETT #3# |sols|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |sol| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (PROGN
                                    (LETT #4#
                                          (|SOLVETRA;solve1Pol| |p| |v| |sol|
                                           %))
                                    (COND
                                     (#7#
                                      (LETT #6#
                                            (SPADCALL #6# #4#
                                                      (QREFELT % 210))))
                                     ('T
                                      (PROGN (LETT #6# #4#) (LETT #7# 'T)))))))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#7# #6#) ('T NIL))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |sols|)))) 

(SDEFUN |SOLVETRA;frac_to_expr|
        ((|q|
          (|Fraction|
           (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
         (% (|Expression| R)))
        (SPADCALL (SPADCALL |q| (QREFELT % 212)) (SPADCALL |q| (QREFELT % 213))
                  (QREFELT % 214))) 

(SDEFUN |SOLVETRA;tryLinear|
        ((|lexpr| (|List| (|Expression| R))) (|lvar| (|List| (|Symbol|)))
         (%
          (|Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed")))
        (SPROG
         ((#1=#:G509 NIL) (|v| NIL) (#2=#:G510 NIL)
          (|lvk| (|List| (|Kernel| (|Expression| R)))) (#3=#:G511 NIL)
          (#4=#:G447 #5=(|Boolean|)) (#6=#:G445 #5#) (#7=#:G446 NIL)
          (#8=#:G512 NIL) (#9=#:G450 #10=(|Boolean|)) (#11=#:G448 #10#)
          (#12=#:G449 NIL) (#13=#:G513 NIL) (#14=#:G514 NIL)
          (|llk| (|List| (|List| (|Kernel| (|Expression| R)))))
          (|kers| (|List| (|Kernel| (|Expression| R)))) (|ker| NIL)
          (#15=#:G515 NIL) (#16=#:G507 NIL) (#17=#:G508 NIL) (#18=#:G516 NIL)
          (|expr| NIL) (#19=#:G517 NIL)
          (|ps|
           (|List|
            (|SparseMultivariatePolynomial| R (|Kernel| (|Expression| R)))))
          (|r|
           (|Record|
            (|:| |mat|
                 (|Matrix|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))
            (|:| |vec|
                 (|Vector|
                  (|Fraction|
                   (|SparseMultivariatePolynomial| R
                                                   (|Kernel|
                                                    (|Expression| R))))))))
          (#20=#:G518 NIL) (|row| NIL) (#21=#:G519 NIL) (#22=#:G520 NIL)
          (#23=#:G521 NIL) (|mate| (|Matrix| (|Expression| R)))
          (#24=#:G522 NIL) (|q| NIL) (#25=#:G523 NIL)
          (|vece| (|Vector| (|Expression| R)))
          (|sol|
           (|Record|
            (|:| |particular|
                 (|Union| (|Vector| (|Expression| R)) #26="failed"))
            (|:| |basis| (|List| (|Vector| (|Expression| R))))))
          (#27=#:G493 NIL) (|rhs| (|Vector| (|Expression| R)))
          (|zeron| (|Vector| (|Expression| R))) (|p| NIL) (#28=#:G524 NIL)
          (|sym| (|Expression| R)) (#29=#:G525 NIL) (|i| NIL) (#30=#:G526 NIL)
          (|eqs| (|List| (|Equation| (|Expression| R)))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lvk|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |v| NIL) (LETT #2# |lvar|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1# (CONS (SPADCALL |v| (QREFELT % 36)) #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (EXIT
             (COND
              ((OR
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #3# |lexpr|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |expr| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4#
                               (>
                                (SPADCALL (SPADCALL |expr| (QREFELT % 59))
                                          |lvk| (QREFELT % 216))
                                1))
                         (COND (#7# (LETT #6# (COND (#6# 'T) ('T #4#))))
                               ('T (PROGN (LETT #6# #4#) (LETT #7# 'T)))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (COND (#7# #6#) (#31='T NIL)))
                (PROGN
                 (LETT #12# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #8# |lexpr|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |expr| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #9#
                               (NULL
                                (NULL
                                 (SPADCALL |lvk|
                                           (SPADCALL
                                            (SPADCALL |expr| (QREFELT % 199))
                                            (QREFELT % 217))
                                           (QREFELT % 218)))))
                         (COND (#12# (LETT #11# (COND (#11# 'T) ('T #9#))))
                               ('T (PROGN (LETT #11# #9#) (LETT #12# 'T)))))))
                      (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                 (COND (#12# #11#) (#31# NIL))))
               (CONS 1 "failed"))
              ('T
               (SEQ
                (LETT |llk|
                      (PROGN
                       (LETT #13# NIL)
                       (SEQ (LETT |expr| NIL) (LETT #14# |lexpr|) G190
                            (COND
                             ((OR (ATOM #14#)
                                  (PROGN (LETT |expr| (CAR #14#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #13#
                                    (CONS (SPADCALL |expr| (QREFELT % 219))
                                          #13#))))
                            (LETT #14# (CDR #14#)) (GO G190) G191
                            (EXIT (NREVERSE #13#)))))
                (LETT |kers| (SPADCALL (ELT % 221) |llk| (QREFELT % 224)))
                (SEQ (LETT |ker| NIL) (LETT #15# |kers|) G190
                     (COND
                      ((OR (ATOM #15#) (PROGN (LETT |ker| (CAR #15#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((QEQCAR (SPADCALL |ker| (QREFELT % 226)) 0)
                         (PROGN (LETT #16# |$NoValue|) (GO #32=#:G467)))
                        ((NULL
                          (NULL
                           (SPADCALL |lvar|
                                     (SPADCALL (SPADCALL |ker| (QREFELT % 109))
                                               (QREFELT % 11))
                                     (QREFELT % 227))))
                         (PROGN
                          (LETT #17# (CONS 1 "failed"))
                          (GO #33=#:G506)))))
                      #32# (EXIT #16#))
                     (LETT #15# (CDR #15#)) (GO G190) G191 (EXIT NIL))
                (LETT |ps|
                      (PROGN
                       (LETT #18# NIL)
                       (SEQ (LETT |expr| NIL) (LETT #19# |lexpr|) G190
                            (COND
                             ((OR (ATOM #19#)
                                  (PROGN (LETT |expr| (CAR #19#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #18#
                                    (CONS (SPADCALL |expr| (QREFELT % 59))
                                          #18#))))
                            (LETT #19# (CDR #19#)) (GO G190) G191
                            (EXIT (NREVERSE #18#)))))
                (LETT |r| (SPADCALL |ps| |lvk| (QREFELT % 231)))
                (LETT |mate|
                      (SPADCALL
                       (PROGN
                        (LETT #20# NIL)
                        (SEQ (LETT |row| NIL)
                             (LETT #21# (SPADCALL (QCAR |r|) (QREFELT % 234)))
                             G190
                             (COND
                              ((OR (ATOM #21#)
                                   (PROGN (LETT |row| (CAR #21#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #20#
                                     (CONS
                                      (PROGN
                                       (LETT #22# NIL)
                                       (SEQ (LETT |q| NIL) (LETT #23# |row|)
                                            G190
                                            (COND
                                             ((OR (ATOM #23#)
                                                  (PROGN
                                                   (LETT |q| (CAR #23#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #22#
                                                    (CONS
                                                     (|SOLVETRA;frac_to_expr|
                                                      |q| %)
                                                     #22#))))
                                            (LETT #23# (CDR #23#)) (GO G190)
                                            G191 (EXIT (NREVERSE #22#))))
                                      #20#))))
                             (LETT #21# (CDR #21#)) (GO G190) G191
                             (EXIT (NREVERSE #20#))))
                       (QREFELT % 237)))
                (LETT |vece|
                      (SPADCALL
                       (PROGN
                        (LETT #24# NIL)
                        (SEQ (LETT |q| NIL)
                             (LETT #25# (SPADCALL (QCDR |r|) (QREFELT % 240)))
                             G190
                             (COND
                              ((OR (ATOM #25#)
                                   (PROGN (LETT |q| (CAR #25#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #24#
                                     (CONS (|SOLVETRA;frac_to_expr| |q| %)
                                           #24#))))
                             (LETT #25# (CDR #25#)) (GO G190) G191
                             (EXIT (NREVERSE #24#))))
                       (QREFELT % 242)))
                (LETT |sol| (SPADCALL |mate| |vece| (QREFELT % 246)))
                (EXIT
                 (COND ((QEQCAR (QCAR |sol|) 1) (CONS 0 NIL))
                       (#31#
                        (SEQ
                         (LETT |rhs|
                               (PROG2 (LETT #27# (QCAR |sol|))
                                   (QCDR #27#)
                                 (|check_union2| (QEQCAR #27# 0)
                                                 (|Vector|
                                                  (|Expression| (QREFELT % 6)))
                                                 (|Union|
                                                  (|Vector|
                                                   (|Expression|
                                                    (QREFELT % 6)))
                                                  #26#)
                                                 #27#)))
                         (LETT |zeron|
                               (SPADCALL (LENGTH |lvar|) (QREFELT % 247)))
                         (SEQ (LETT |p| NIL) (LETT #28# (QCDR |sol|)) G190
                              (COND
                               ((OR (ATOM #28#)
                                    (PROGN (LETT |p| (CAR #28#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL |p| |zeron| (QREFELT % 248))
                                  (SEQ
                                   (LETT |sym|
                                         (SPADCALL (SPADCALL (QREFELT % 31))
                                                   (QREFELT % 32)))
                                   (EXIT
                                    (SEQ (LETT |i| 1)
                                         (LETT #29# (LENGTH |lvar|)) G190
                                         (COND
                                          ((|greater_SI| |i| #29#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SPADCALL |rhs| |i|
                                                     (SPADCALL
                                                      (SPADCALL |rhs| |i|
                                                                (QREFELT %
                                                                         249))
                                                      (SPADCALL |sym|
                                                                (SPADCALL |p|
                                                                          |i|
                                                                          (QREFELT
                                                                           %
                                                                           249))
                                                                (QREFELT %
                                                                         124))
                                                      (QREFELT % 123))
                                                     (QREFELT % 250))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT NIL))))))))
                              (LETT #28# (CDR #28#)) (GO G190) G191 (EXIT NIL))
                         (LETT |eqs| NIL)
                         (SEQ (LETT |i| 1) (LETT #30# (LENGTH |lvar|)) G190
                              (COND ((|greater_SI| |i| #30#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |eqs|
                                      (SPADCALL |eqs|
                                                (LIST
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |lvar| |i|
                                                             (QREFELT % 251))
                                                   (QREFELT % 32))
                                                  (SPADCALL |rhs| |i|
                                                            (QREFELT % 249))
                                                  (QREFELT % 33)))
                                                (QREFELT % 57)))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 (LIST |eqs|)))))))))))))
          #33# (EXIT #17#)))) 

(SDEFUN |SOLVETRA;solveList|
        ((|lexpr| (|List| (|Expression| R))) (|lvar| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((|ans1|
           (|Union| (|List| (|List| (|Equation| (|Expression| R)))) "failed"))
          (#1=#:G538 NIL) (|expr| NIL) (#2=#:G539 NIL)
          (|lfrac| (|List| (|Fraction| (|Polynomial| (|Expression| R)))))
          (|trianglist| (|List| (|List| (|Polynomial| (|Expression| R)))))
          (#3=#:G540 NIL) (|plist| NIL) (#4=#:G541 NIL)
          (|l| (|List| (|List| (|List| (|Equation| (|Expression| R)))))))
         (SEQ (LETT |ans1| (|SOLVETRA;solveRetract| |lexpr| |lvar| %))
              (EXIT
               (COND
                ((QEQCAR |ans1| 1)
                 (SEQ (LETT |ans1| (|SOLVETRA;tryLinear| |lexpr| |lvar| %))
                      (EXIT
                       (COND
                        ((QEQCAR |ans1| 1)
                         (SEQ
                          (LETT |lfrac|
                                (PROGN
                                 (LETT #1# NIL)
                                 (SEQ (LETT |expr| NIL) (LETT #2# |lexpr|) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN
                                             (LETT |expr| (CAR #2#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #1#
                                              (CONS
                                               (|SOLVETRA;makeFracPoly| |expr|
                                                |lvar| %)
                                               #1#))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT (NREVERSE #1#)))))
                          (LETT |trianglist|
                                (SPADCALL |lfrac| |lvar| (QREFELT % 255)))
                          (LETT |l|
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |plist| NIL)
                                      (LETT #4# |trianglist|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN
                                             (LETT |plist| (CAR #4#))
                                             NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #3#
                                              (CONS
                                               (|SOLVETRA;solve1Sys| |plist|
                                                |lvar| %)
                                               #3#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#)))))
                          (EXIT
                           (SPADCALL (ELT % 210) |l| NIL (QREFELT % 258)))))
                        (#5='T (QCDR |ans1|))))))
                (#5# (QCDR |ans1|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;37|
        ((|leqs| (|List| (|Equation| (|Expression| R))))
         (|lvar| (|List| (|Symbol|)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G546 NIL) (|eq| NIL) (#2=#:G547 NIL)
          (|lexpr| (|List| (|Expression| R))))
         (SEQ
          (LETT |lexpr|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |eq| NIL) (LETT #2# |leqs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT % 18))
                                         (SPADCALL |eq| (QREFELT % 19))
                                         (QREFELT % 20))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (|SOLVETRA;solveList| |lexpr| |lvar| %))))) 

(SDEFUN |SOLVETRA;solve;LLL;38|
        ((|leqs| (|List| (|Equation| (|Expression| R))))
         (|lker| (|List| (|Kernel| (|Expression| R))))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G568 NIL) (|eq| NIL) (#2=#:G569 NIL)
          (|lexpr| (|List| (|Expression| R))) (#3=#:G570 NIL) (#4=#:G571 NIL)
          (|lvar| (|List| (|Symbol|))) (#5=#:G572 NIL) (#6=#:G573 NIL)
          (|lval| (|List| (|Expression| R))) (#7=#:G574 NIL) (|expr| NIL)
          (#8=#:G575 NIL) (|nlexpr| (|List| (|Expression| R)))
          (|ans| (|List| (|List| (|Equation| (|Expression| R)))))
          (#9=#:G576 NIL) (|v| NIL) (#10=#:G577 NIL)
          (|lker2| (|List| (|Kernel| (|Expression| R)))) (#11=#:G578 NIL)
          (|k| NIL) (#12=#:G579 NIL) (|lval2| (|List| (|Expression| R)))
          (#13=#:G580 NIL) (|sol| NIL) (#14=#:G581 NIL) (#15=#:G582 NIL)
          (|neq| NIL) (#16=#:G583 NIL))
         (SEQ
          (LETT |lexpr|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |eq| NIL) (LETT #2# |leqs|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL |eq| (QREFELT % 18))
                                         (SPADCALL |eq| (QREFELT % 19))
                                         (QREFELT % 20))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |lvar|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |k| NIL) (LETT #4# |lker|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #3# (CONS (SPADCALL (QREFELT % 31)) #3#))))
                      (LETT #4# (CDR #4#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (LETT |lval|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |v| NIL) (LETT #6# |lvar|) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |v| (CAR #6#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5# (CONS (SPADCALL |v| (QREFELT % 32)) #5#))))
                      (LETT #6# (CDR #6#)) (GO G190) G191
                      (EXIT (NREVERSE #5#)))))
          (LETT |nlexpr|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |expr| NIL) (LETT #8# |lexpr|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |expr| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #7#
                              (CONS
                               (SPADCALL |expr| |lker| |lval| (QREFELT % 260))
                               #7#))))
                      (LETT #8# (CDR #8#)) (GO G190) G191
                      (EXIT (NREVERSE #7#)))))
          (LETT |ans| (|SOLVETRA;solveList| |nlexpr| |lvar| %))
          (LETT |lker2|
                (PROGN
                 (LETT #9# NIL)
                 (SEQ (LETT |v| NIL) (LETT #10# |lvar|) G190
                      (COND
                       ((OR (ATOM #10#) (PROGN (LETT |v| (CAR #10#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #9# (CONS (SPADCALL |v| (QREFELT % 36)) #9#))))
                      (LETT #10# (CDR #10#)) (GO G190) G191
                      (EXIT (NREVERSE #9#)))))
          (LETT |lval2|
                (PROGN
                 (LETT #11# NIL)
                 (SEQ (LETT |k| NIL) (LETT #12# |lker|) G190
                      (COND
                       ((OR (ATOM #12#) (PROGN (LETT |k| (CAR #12#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #11#
                              (CONS (SPADCALL |k| (QREFELT % 109)) #11#))))
                      (LETT #12# (CDR #12#)) (GO G190) G191
                      (EXIT (NREVERSE #11#)))))
          (EXIT
           (PROGN
            (LETT #13# NIL)
            (SEQ (LETT |sol| NIL) (LETT #14# |ans|) G190
                 (COND
                  ((OR (ATOM #14#) (PROGN (LETT |sol| (CAR #14#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #13#
                         (CONS
                          (PROGN
                           (LETT #15# NIL)
                           (SEQ (LETT |neq| NIL) (LETT #16# |sol|) G190
                                (COND
                                 ((OR (ATOM #16#)
                                      (PROGN (LETT |neq| (CAR #16#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #15#
                                        (CONS
                                         (SPADCALL
                                          (CONS #'|SOLVETRA;solve;LLL;38!0|
                                                (VECTOR % |lval2| |lker2|))
                                          |neq| (QREFELT % 262))
                                         #15#))))
                                (LETT #16# (CDR #16#)) (GO G190) G191
                                (EXIT (NREVERSE #15#))))
                          #13#))))
                 (LETT #14# (CDR #14#)) (GO G190) G191
                 (EXIT (NREVERSE #13#)))))))) 

(SDEFUN |SOLVETRA;solve;LLL;38!0| ((|e| NIL) ($$ NIL))
        (PROG (|lker2| |lval2| %)
          (LETT |lker2| (QREFELT $$ 2))
          (LETT |lval2| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |e| |lker2| |lval2| (QREFELT % 260)))))) 

(SDEFUN |SOLVETRA;retract2|
        ((|e| (|Expression| R)) (% (|Kernel| (|Expression| R))))
        (SPROG ((|k| (|Union| (|Kernel| (|Expression| R)) "failed")))
               (SEQ (LETT |k| (SPADCALL |e| (QREFELT % 154)))
                    (EXIT
                     (COND
                      ((QEQCAR |k| 1)
                       (|error|
                        "solve$TransSolvePackage: variable is not a single kernel"))
                      ('T (QCDR |k|))))))) 

(SDEFUN |SOLVETRA;solve;LLL;40|
        ((|leqs| (|List| (|Equation| (|Expression| R))))
         (|lexpr| (|List| (|Expression| R)))
         (% (|List| (|List| (|Equation| (|Expression| R))))))
        (SPROG
         ((#1=#:G593 NIL) (|e| NIL) (#2=#:G594 NIL)
          (|lker| (|List| (|Kernel| (|Expression| R)))))
         (SEQ
          (LETT |lker|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |e| NIL) (LETT #2# |lexpr|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (|SOLVETRA;retract2| |e| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (SPADCALL |leqs| |lker| (QREFELT % 263)))))) 

(DECLAIM (NOTINLINE |TransSolvePackage;|)) 

(DEFUN |TransSolvePackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TransSolvePackage| DV$1))
          (LETT % (GETREFV 265))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TransSolvePackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |TransSolvePackage| (#1=#:G595)
  (SPROG NIL
         (PROG (#2=#:G596)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TransSolvePackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TransSolvePackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|TransSolvePackage|)))))))))) 

(MAKEPROP '|TransSolvePackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (|Expression| 6) (0 . |zero?|) (|List| 14) (5 . |variables|)
              (10 . |1|) (|List| 17) (|Symbol|) |SOLVETRA;solve;ESL;5|
              |SOLVETRA;solve;EL;1| (|Equation| 8) (14 . |lhs|) (19 . |rhs|)
              (24 . -) |SOLVETRA;solve;EL;2| |SOLVETRA;solve;ESL;3|
              (|Union| 55 '#1="failed") (30 . |retractIfCan|)
              (|Union| (|Fraction| 55) '#1#) (35 . |retractIfCan|)
              (|Equation| %) (40 . |eval|)
              (|ElementaryFunctionStructurePackage| 6 8) (46 . |normalize|)
              (51 . |new|) (55 . |coerce|) (60 . =) (66 . =) (|Kernel| 8)
              (72 . |kernel|) (|Fraction| 51) (|Kernel| %) (77 . |univariate|)
              (|SparseUnivariatePolynomial| 8) (|Fraction| 40) (83 . |numer|)
              (|Factored| 40) (|ExpressionFactorPolynomial| 6 8)
              (88 . |factorPolynomial|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 46) (|:| |factor| 40) (|:| |exponent| 112))
              (|List| 47) (93 . |factorList|) (|List| %)
              (|SparseUnivariatePolynomial| %) (98 . |zerosOf|) (|List| 8)
              (104 . |append|) (|Integer|) (110 . |elt|) (116 . |append|)
              (|SparseMultivariatePolynomial| 6 38) (122 . |numer|)
              (127 . |coerce|) (|Factored| 51) (132 . |factorPolynomial|)
              (|AlgebraicManipulations| 6 8) (137 . |rootSimp|) (|Factored| 66)
              (|SparseMultivariatePolynomial| 6 35)
              (|MultivariateFactorize| 35 (|IndexedExponents| 35) 6 66)
              (142 . |factor|)
              (|Record| (|:| |flag| 46) (|:| |factor| 66) (|:| |exponent| 112))
              (|List| 69) (147 . |factorList|)
              (|Record| (|:| |var| 38) (|:| |exponent| 55))
              (|Union| 72 '"failed") (152 . |isExpt|) (158 . |argument|)
              (163 . *) (169 . |log|) (|SparseUnivariatePolynomial| 6)
              (174 . |1|) (|Union| (|Fraction| (|Polynomial| 6)) '#1#)
              (178 . |retractIfCan|) (|List| 13)
              (|List| (|Fraction| (|Polynomial| 6))) (|RadicalSolvePackage| 6)
              (183 . |radicalSolve|) (|TranscendentalManipulations| 6 8)
              (189 . |simplify|) (194 . |normalize|)
              (|TrigonometricManipulations| 6 8) (200 . |complexNormalize|)
              (|List| 38) (206 . |kernels|) (211 . |numerator|)
              (216 . |coerce|) (221 . /) (227 . |tan|) (|PositiveInteger|)
              (232 . *) (238 . ^) (244 . |1|) (248 . -) (254 . |1|) (258 . -)
              (|TransSolvePackageService| 6) (263 . |decomposeFunc|) (270 . ~=)
              (|Fraction| %) (276 . |elt|) (282 . |coerce|) (287 . |second|)
              (292 . |retract|) (|NonNegativeInteger|) (297 . |monomial|)
              (303 . -) (309 . |resultant|) (315 . |is?|)
              (|Union| 50 '"failed") (321 . |isPlus|)
              (326 . |leadingCoefficient|) (331 . |gcd|) (336 . |coerce|)
              (341 . |0|) (345 . +) (351 . *) (357 . |0|) (361 . |name|)
              (366 . |member?|) (372 . |isTimes|) (377 . |remove!|) (383 . |1|)
              (387 . |freeOf?|) (393 . ^) (|Table| 8 8) (399 . |table|)
              (403 . ~=) (409 . |leadingMonomial|) (|Union| 8 '"failed")
              (414 . |search|) (420 . |setelt!|) (427 . |elt|)
              (433 . |reductum|) (438 . |keys|) (443 . |is?|) (|Float|)
              (|Interval| 144) (449 . |interval|) (|Complex| 144)
              (454 . |convert|) (|Complex| 145) (|Mapping| 145 144)
              (|ComplexFunctions2| 144 145) (459 . |map|) (|Union| 38 '#1#)
              (465 . |retractIfCan|) (470 . |asin|) (475 . |acos|)
              (480 . |atan|) (485 . |acot|) (490 . |asec|) (495 . |acsc|)
              (500 . |asinh|) (505 . |acosh|) (510 . |atanh|) (515 . |acoth|)
              (520 . |asech|) (525 . |acsch|) (530 . |cot|) (535 . |sin|)
              (540 . |cos|) (545 . |sec|) (550 . |csc|) (555 . |sinh|)
              (560 . |cosh|) (565 . |tanh|) (570 . |coth|) (575 . |sech|)
              (580 . |csch|) (|Expression| 149) (|Mapping| 149 6)
              (|ExpressionFunctions2| 6 149) (585 . |map|) (|Union| 149 '#1#)
              (591 . |retractIfCan|) (596 . |exp|) (601 . |imag|) (606 . |pi|)
              (610 . -) (615 . |inf|) (620 . <) (626 . |sup|) (631 . <=)
              (|Polynomial| 8) (637 . |coerce|) (642 . |coerce|)
              (|Mapping| 192 35) (|Mapping| 192 6)
              (|PolynomialCategoryLifting| (|IndexedExponents| 35) 35 6 66 192)
              (647 . |map|) (654 . |denom|) (|Fraction| 192) (659 . /)
              (665 . |variables|) (670 . |eval|) (677 . |ground|)
              (682 . |numer|) (687 . |denom|) (|List| 27) (692 . |eval|)
              (698 . |list|) (703 . |append|) (|Fraction| 66) (709 . |numer|)
              (714 . |denom|) (719 . /) (|List| 35) (725 . |totalDegree|)
              (731 . |variables|) (736 . |setIntersection|) (742 . |tower|)
              (747 . |setUnion|) (753 . |setUnion|) (|Mapping| 215 215 215)
              (|List| 215) (759 . |reduce|) (|Union| 14 '"failed")
              (765 . |symbolIfCan|) (770 . |setIntersection|)
              (|Record| (|:| |mat| 233) (|:| |vec| 239)) (|List| 66)
              (|LinearSystemPolynomialPackage| 6 (|IndexedExponents| 35) 35 66)
              (776 . |intoMatrix|) (|List| 238) (|Matrix| 211)
              (782 . |listOfLists|) (|List| 53) (|Matrix| 8) (787 . |matrix|)
              (|List| 211) (|Vector| 211) (792 . |parts|) (|Vector| 8)
              (797 . |vector|) (|Union| 241 '"failed")
              (|Record| (|:| |particular| 243) (|:| |basis| (|List| 241)))
              (|LinearSystemMatrixPackage| 8 241 241 236) (802 . |solve|)
              (808 . |zero|) (813 . ~=) (819 . |elt|) (825 . |setelt!|)
              (832 . |elt|) (|List| (|List| 192)) (|List| 200)
              (|SystemSolvePackage| 8) (838 . |triangularSystems|)
              (|Mapping| 82 82 82) (|List| 82) (844 . |reduce|)
              |SOLVETRA;solve;LLL;37| (851 . |eval|) (|Mapping| 8 8)
              (858 . |map|) |SOLVETRA;solve;LLL;38| |SOLVETRA;solve;LLL;40|)
           '#(|solve| 864) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Expression| |#1|)))
                                T)
                              '((|solve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Equation| (|Expression| |#1|))))
                                T)
                              '((|solve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Equation| (|Expression| |#1|)) (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List| (|Equation| (|Expression| |#1|)))
                                  (|Expression| |#1|) (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List| (|Equation| (|Expression| |#1|)))
                                  (|List| (|Symbol|))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List| (|Equation| (|Expression| |#1|)))
                                  (|List| (|Kernel| (|Expression| |#1|)))))
                                T)
                              '((|solve|
                                 ((|List|
                                   (|List| (|Equation| (|Expression| |#1|))))
                                  (|List| (|Equation| (|Expression| |#1|)))
                                  (|List| (|Expression| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 264
                                            '(1 8 7 0 9 1 8 10 0 11 0 6 0 12 1
                                              17 8 0 18 1 17 8 0 19 2 8 0 0 0
                                              20 1 8 23 0 24 1 8 25 0 26 2 8 0
                                              0 27 28 1 29 8 8 30 0 14 0 31 1 8
                                              0 14 32 2 17 0 8 8 33 2 8 7 0 0
                                              34 1 35 0 14 36 2 8 37 0 38 39 1
                                              41 40 0 42 1 44 43 40 45 1 43 48
                                              0 49 2 8 50 51 14 52 2 53 0 0 0
                                              54 2 53 8 0 55 56 2 13 0 0 0 57 1
                                              8 58 0 59 1 8 0 58 60 1 8 61 51
                                              62 1 63 8 8 64 1 67 65 66 68 1 65
                                              70 0 71 2 8 73 0 14 74 1 35 53 0
                                              75 2 8 0 55 0 76 1 8 0 0 77 0 78
                                              0 79 1 8 80 0 81 2 84 82 83 10 85
                                              1 86 8 8 87 2 29 8 8 14 88 2 89 8
                                              8 14 90 1 8 91 0 92 1 8 0 0 93 1
                                              8 0 55 94 2 8 0 0 0 95 1 8 0 0 96
                                              2 8 0 97 0 98 2 8 0 0 97 99 0 17
                                              0 100 2 17 0 8 0 101 0 8 0 102 1
                                              8 0 0 103 3 104 41 41 41 41 105 2
                                              41 7 0 0 106 2 40 8 107 8 108 1 8
                                              0 38 109 1 53 8 0 110 1 8 55 0
                                              111 2 40 0 8 112 113 2 40 0 0 0
                                              114 2 40 8 0 0 115 2 8 7 0 14 116
                                              1 8 117 0 118 1 66 6 0 119 1 6 0
                                              50 120 1 8 0 6 121 0 8 0 122 2 8
                                              0 0 0 123 2 8 0 0 0 124 0 6 0 125
                                              1 35 14 0 126 2 10 7 14 0 127 1 8
                                              117 0 128 2 53 0 8 0 129 0 55 0
                                              130 2 8 7 0 14 131 2 8 0 0 0 132
                                              0 133 0 134 2 8 7 0 0 135 1 66 0
                                              0 136 2 133 137 8 0 138 3 133 8 0
                                              8 8 139 2 133 8 0 8 140 1 66 0 0
                                              141 1 133 53 0 142 2 35 7 0 14
                                              143 1 145 0 144 146 1 6 147 0 148
                                              2 151 149 150 147 152 1 8 153 0
                                              154 1 8 0 0 155 1 8 0 0 156 1 8 0
                                              0 157 1 8 0 0 158 1 8 0 0 159 1 8
                                              0 0 160 1 8 0 0 161 1 8 0 0 162 1
                                              8 0 0 163 1 8 0 0 164 1 8 0 0 165
                                              1 8 0 0 166 1 8 0 0 167 1 8 0 0
                                              168 1 8 0 0 169 1 8 0 0 170 1 8 0
                                              0 171 1 8 0 0 172 1 8 0 0 173 1 8
                                              0 0 174 1 8 0 0 175 1 8 0 0 176 1
                                              8 0 0 177 2 180 178 179 8 181 1
                                              178 182 0 183 1 8 0 0 184 1 149
                                              145 0 185 0 144 0 186 1 144 0 0
                                              187 1 145 144 0 188 2 144 7 0 0
                                              189 1 145 144 0 190 2 144 7 0 0
                                              191 1 192 0 14 193 1 192 0 8 194
                                              3 197 192 195 196 66 198 1 8 58 0
                                              199 2 200 0 192 192 201 1 192 10
                                              0 202 3 192 0 0 10 53 203 1 192 8
                                              0 204 1 200 192 0 205 1 200 192 0
                                              206 2 8 0 0 207 208 1 82 0 13 209
                                              2 82 0 0 0 210 1 211 66 0 212 1
                                              211 66 0 213 2 8 0 58 58 214 2 66
                                              112 0 215 216 1 66 215 0 217 2
                                              215 0 0 0 218 1 8 91 0 219 2 13 0
                                              0 0 220 2 215 0 0 0 221 2 223 215
                                              222 0 224 1 35 225 0 226 2 10 0 0
                                              0 227 2 230 228 229 215 231 1 233
                                              232 0 234 1 236 0 235 237 1 239
                                              238 0 240 1 241 0 53 242 2 245
                                              244 236 241 246 1 241 0 112 247 2
                                              241 7 0 0 248 2 241 8 0 55 249 3
                                              241 8 0 55 8 250 2 10 14 0 55 251
                                              2 254 252 253 10 255 3 257 82 256
                                              0 82 258 3 8 0 0 91 50 260 2 17 0
                                              261 0 262 2 0 82 13 215 263 2 0
                                              82 13 53 264 2 0 13 8 14 15 2 0
                                              82 13 10 259 1 0 13 17 21 2 0 13
                                              17 14 22 1 0 13 8 16)))))
           '|lookupComplete|)) 
