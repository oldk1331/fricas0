
(SDEFUN |MFINFACT;convertPUP|
        ((|lfg|
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseMultivariatePolynomial|
                                 (|SparseUnivariatePolynomial| F) OV))
                           (|:| |pow| (|NonNegativeInteger|)))))))
         (%
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseUnivariatePolynomial|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV)))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG ((#1=#:G47 NIL) (|lff| NIL) (#2=#:G48 NIL))
               (SEQ
                (CONS (QCAR |lfg|)
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |lff| NIL) (LETT #2# (QCDR |lfg|)) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |lff| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS
                                     (CONS
                                      (SPADCALL (QCAR |lff|) (QREFELT % 12))
                                      (QCDR |lff|))
                                     #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))))) 

(SDEFUN |MFINFACT;supFactor|
        ((|um|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|var| (OV)) (|dx| (|Integer|))
         (%
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseUnivariatePolynomial|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV)))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|cf| NIL) (#1=#:G118 NIL) (#2=#:G52 #3=(|List| OV)) (#4=#:G50 #3#)
          (#5=#:G51 NIL) (|lvar| #3#) (|mdeg| (|NonNegativeInteger|))
          (|f1|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (#6=#:G58 NIL)
          (|lfg|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#7=#:G117 NIL) (|om| (|SparseUnivariatePolynomial| PG))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| PG)))
          (|lcont|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           #8=(|Record|
                               (|:| |irr|
                                    #9=(|SparseUnivariatePolynomial|
                                        (|SparseMultivariatePolynomial|
                                         (|SparseUnivariatePolynomial| F) OV)))
                               (|:| |pow| #10=(|NonNegativeInteger|)))))))
          (#11=#:G119 NIL) (|ff| NIL) (#12=#:G120 NIL) (|sqqfact| (|List| #8#))
          (|fact| NIL) (#13=#:G121 NIL) (|ffactor| #9#) (|ffexp| #10#)
          (|coefs|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (#14=#:G122 NIL) (|xx| NIL) (#15=#:G123 NIL) (|fc| NIL)
          (#16=#:G124 NIL) (#17=#:G101 #18=(|NonNegativeInteger|))
          (#19=#:G99 #18#) (#20=#:G100 NIL) (|ldeg| (|List| #18#))
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (#21=#:G125 NIL) (|lfp| NIL) (#22=#:G126 NIL) (|auxfl| (|List| #8#))
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseUnivariatePolynomial|
                   (|SparseMultivariatePolynomial|
                    (|SparseUnivariatePolynomial| F) OV)))
             (|:| |pow| (|NonNegativeInteger|)))))
          (|f| NIL) (#23=#:G127 NIL)
          (#24=#:G110 #25=(|SparseUnivariatePolynomial| F)) (#26=#:G108 #25#)
          (#27=#:G109 NIL) (|lcfacs| #25#) (#28=#:G112 NIL))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL |um| (QREFELT % 14)) 0)
             (|MFINFACT;convertPUP|
              (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT % 15)) |var| |dx| %)
              %))
            (#29='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |cf| NIL)
                          (LETT #1# (SPADCALL |um| (QREFELT % 17))) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |cf| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (SPADCALL |cf| (QREFELT % 19)))
                             (COND
                              (#5#
                               (LETT #4# (SPADCALL #4# #2# (QREFELT % 20))))
                              ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#29# (|IdentityError| '|setUnion|)))))
              (LETT |flead| (CONS (|spadConstant| % 24) NIL))
              (LETT |factorlist| NIL)
              (LETT |mdeg| (SPADCALL |um| (QREFELT % 25)))
              (COND
               ((> |mdeg| 0)
                (SEQ
                 (LETT |f1|
                       (SPADCALL (|spadConstant| % 28) |mdeg| (QREFELT % 29)))
                 (LETT |um|
                       (PROG2 (LETT #6# (SPADCALL |um| |f1| (QREFELT % 31)))
                           (QCDR #6#)
                         (|check_union2| (QEQCAR #6# 0)
                                         (|SparseUnivariatePolynomial|
                                          (|SparseMultivariatePolynomial|
                                           (|SparseUnivariatePolynomial|
                                            (QREFELT % 8))
                                           (QREFELT % 6)))
                                         (|Union|
                                          (|SparseUnivariatePolynomial|
                                           (|SparseMultivariatePolynomial|
                                            (|SparseUnivariatePolynomial|
                                             (QREFELT % 8))
                                            (QREFELT % 6)))
                                          #30="failed")
                                         #6#)))
                 (LETT |factorlist|
                       (CONS
                        (CONS (SPADCALL (|spadConstant| % 28) 1 (QREFELT % 29))
                              |mdeg|)
                        |factorlist|))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL |um| (QREFELT % 14)) 0)
                    (PROGN
                     (LETT #7#
                           (SEQ
                            (LETT |lfg|
                                  (|MFINFACT;convertPUP|
                                   (|MFINFACT;mFactor|
                                    (SPADCALL |um| (QREFELT % 15)) |var| |dx|
                                    %)
                                   %))
                            (EXIT
                             (CONS (QCAR |lfg|)
                                   (SPADCALL |factorlist| (QCDR |lfg|)
                                             (QREFELT % 34))))))
                     (GO #31=#:G116))))))))
              (LETT |om|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!0| (VECTOR % |var|))
                              |um| (QREFELT % 38)))
              (LETT |sqfacs| (SPADCALL |om| (QREFELT % 40)))
              (LETT |lcont|
                    (SPADCALL (CONS #'|MFINFACT;supFactor!1| (VECTOR % |var|))
                              (SPADCALL |sqfacs| (QREFELT % 42))
                              (QREFELT % 45)))
              (COND
               ((SPADCALL |lcont| (QREFELT % 47))
                (LETT |flead|
                      (|MFINFACT;convertPUP|
                       (|MFINFACT;constantCase|
                        (SPADCALL |lcont| (QREFELT % 15)) NIL %)
                       %)))
               (#29#
                (LETT |flead| (|MFINFACT;supFactor| |lcont| |var| |dx| %))))
              (LETT |factorlist|
                    (SPADCALL |factorlist| (QCDR |flead|) (QREFELT % 34)))
              (LETT |sqqfact|
                    (PROGN
                     (LETT #11# NIL)
                     (SEQ (LETT |ff| NIL)
                          (LETT #12# (SPADCALL |sqfacs| (QREFELT % 51))) G190
                          (COND
                           ((OR (ATOM #12#) (PROGN (LETT |ff| (CAR #12#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #11#
                                  (CONS
                                   (CONS
                                    (SPADCALL
                                     (CONS #'|MFINFACT;supFactor!2|
                                           (VECTOR % |var|))
                                     (QVELT |ff| 1) (QREFELT % 45))
                                    (QVELT |ff| 2))
                                   #11#))))
                          (LETT #12# (CDR #12#)) (GO G190) G191
                          (EXIT (NREVERSE #11#)))))
              (SEQ (LETT |fact| NIL) (LETT #13# |sqqfact|) G190
                   (COND
                    ((OR (ATOM #13#) (PROGN (LETT |fact| (CAR #13#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |ffactor| (QCAR |fact|))
                        (LETT |ffexp| (QCDR |fact|))
                        (LETT |coefs| (SPADCALL |ffactor| (QREFELT % 17)))
                        (LETT |ldeg|
                              (PROGN
                               (LETT #14# NIL)
                               (SEQ (LETT |xx| NIL) (LETT #15# |lvar|) G190
                                    (COND
                                     ((OR (ATOM #15#)
                                          (PROGN (LETT |xx| (CAR #15#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #14#
                                            (CONS
                                             (PROGN
                                              (LETT #20# NIL)
                                              (SEQ (LETT |fc| NIL)
                                                   (LETT #16# |coefs|) G190
                                                   (COND
                                                    ((OR (ATOM #16#)
                                                         (PROGN
                                                          (LETT |fc|
                                                                (CAR #16#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (PROGN
                                                      (LETT #17#
                                                            (SPADCALL |fc| |xx|
                                                                      (QREFELT
                                                                       % 52)))
                                                      (COND
                                                       (#20#
                                                        (LETT #19#
                                                              (MAX #19# #17#)))
                                                       ('T
                                                        (PROGN
                                                         (LETT #19# #17#)
                                                         (LETT #20# 'T)))))))
                                                   (LETT #16# (CDR #16#))
                                                   (GO G190) G191 (EXIT NIL))
                                              (COND (#20# #19#)
                                                    ('T
                                                     (|IdentityError|
                                                      '|max|))))
                                             #14#))))
                                    (LETT #15# (CDR #15#)) (GO G190) G191
                                    (EXIT (NREVERSE #14#)))))
                        (COND
                         ((SPADCALL (SPADCALL |ffactor| (QREFELT % 53))
                                    (QREFELT % 54))
                          (LETT |lf|
                                (|MFINFACT;mfconst| |ffactor| |dx| |lvar|
                                 |ldeg| %)))
                         ('T
                          (LETT |lf|
                                (|MFINFACT;mfpol| |ffactor| |var| |dx| |lvar|
                                 |ldeg| %))))
                        (LETT |auxfl|
                              (PROGN
                               (LETT #21# NIL)
                               (SEQ (LETT |lfp| NIL) (LETT #22# |lf|) G190
                                    (COND
                                     ((OR (ATOM #22#)
                                          (PROGN (LETT |lfp| (CAR #22#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #21#
                                            (CONS (CONS |lfp| |ffexp|) #21#))))
                                    (LETT #22# (CDR #22#)) (GO G190) G191
                                    (EXIT (NREVERSE #21#)))))
                        (EXIT
                         (LETT |factorlist|
                               (SPADCALL |auxfl| |factorlist|
                                         (QREFELT % 55)))))
                   (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
              (LETT |lcfacs|
                    (PROGN
                     (LETT #27# NIL)
                     (SEQ (LETT |f| NIL) (LETT #23# |factorlist|) G190
                          (COND
                           ((OR (ATOM #23#) (PROGN (LETT |f| (CAR #23#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #24#
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (QCAR |f|) (QREFELT % 53))
                                     (QREFELT % 56))
                                    (QCDR |f|) (QREFELT % 57)))
                             (COND
                              (#27#
                               (LETT #26# (SPADCALL #26# #24# (QREFELT % 58))))
                              ('T (PROGN (LETT #26# #24#) (LETT #27# 'T)))))))
                          (LETT #23# (CDR #23#)) (GO G190) G191 (EXIT NIL))
                     (COND (#27# #26#) (#29# (|spadConstant| % 59)))))
              (EXIT
               (CONS
                (PROG2
                    (LETT #28#
                          (SPADCALL
                           (SPADCALL (SPADCALL |um| (QREFELT % 53))
                                     (QREFELT % 56))
                           |lcfacs| (QREFELT % 60)))
                    (QCDR #28#)
                  (|check_union2| (QEQCAR #28# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT % 8))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT % 8))
                                   #30#)
                                  #28#))
                |factorlist|))))))
          #31# (EXIT #7#)))) 

(SDEFUN |MFINFACT;supFactor!2| ((|p1| NIL) ($$ NIL))
        (PROG (|var| %)
          (LETT |var| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| %))))) 

(SDEFUN |MFINFACT;supFactor!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| %)
          (LETT |var| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| %))))) 

(SDEFUN |MFINFACT;supFactor!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| %)
          (LETT |var| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| %))))) 

(SDEFUN |MFINFACT;sup_prime_factor|
        ((|pol| (|SparseUnivariatePolynomial| PG))
         (|pow| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                    (|:| |factor| (|SparseUnivariatePolynomial| PG))
                    (|:| |exponent| (|NonNegativeInteger|)))))
        (VECTOR (CONS 3 "prime") |pol| |pow|)) 

(SDEFUN |MFINFACT;factor_sup|
        ((|m| (|SparseUnivariatePolynomial| F))
         (% (|Factored| (|SparseUnivariatePolynomial| PG))))
        (SPROG
         ((|fm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| F))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#1=#:G144 NIL) (|p| NIL) (#2=#:G145 NIL)
          (|fr1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| PG))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |fm| (SPADCALL |m| (QREFELT % 64)))
              (LETT |fr1|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |p| NIL) (LETT #2# (QCDR |fm|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS
                                   (|MFINFACT;sup_prime_factor|
                                    (SPADCALL (ELT % 65) (QCAR |p|)
                                              (QREFELT % 68))
                                    (QCDR |p|) %)
                                   #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL (QCAR |fm|) (QREFELT % 65)) (QREFELT % 69))
                |fr1| (QREFELT % 70)))))) 

(SDEFUN |MFINFACT;factor;SupF;5|
        ((|um| (|SparseUnivariatePolynomial| PG))
         (% (|Factored| (|SparseUnivariatePolynomial| PG))))
        (SPROG
         ((|lv| (|List| OV)) (|ld| (|List| #1=(|NonNegativeInteger|)))
          (#2=#:G0 NIL) (#3=#:G158 NIL) (#4=#:G149 #1#) (#5=#:G147 #1#)
          (#6=#:G148 NIL) (|dx| #1#) (|var| (OV))
          (|cm|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseUnivariatePolynomial|
                                  (|SparseMultivariatePolynomial|
                                   (|SparseUnivariatePolynomial| F) OV)))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#7=#:G159 NIL) (|u| NIL) (#8=#:G160 NIL)
          (|fr1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| PG))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ (LETT |lv| (SPADCALL |um| (QREFELT % 72)))
              (EXIT
               (COND
                ((NULL |lv|)
                 (|MFINFACT;factor_sup|
                  (SPADCALL (ELT % 73) |um| (QREFELT % 76)) %))
                (#9='T
                 (SEQ (LETT |ld| (SPADCALL |um| |lv| (QREFELT % 78)))
                      (LETT |dx|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT #2# NIL) (LETT #3# |ld|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT #2# (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #4# #2#)
                                     (COND (#6# (LETT #5# (MIN #5# #4#)))
                                           ('T
                                            (PROGN
                                             (LETT #5# #4#)
                                             (LETT #6# 'T)))))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#6# #5#) (#9# (|IdentityError| '|min|)))))
                      (LETT |var|
                            (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT % 80))
                                      (QREFELT % 81)))
                      (LETT |cm|
                            (SPADCALL
                             (CONS #'|MFINFACT;factor;SupF;5!0|
                                   (VECTOR % |var|))
                             |um| (QREFELT % 45)))
                      (LETT |flist| (|MFINFACT;supFactor| |cm| |var| |dx| %))
                      (LETT |fr1|
                            (PROGN
                             (LETT #7# NIL)
                             (SEQ (LETT |u| NIL) (LETT #8# (QCDR |flist|)) G190
                                  (COND
                                   ((OR (ATOM #8#)
                                        (PROGN (LETT |u| (CAR #8#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #7#
                                          (CONS
                                           (|MFINFACT;sup_prime_factor|
                                            (SPADCALL
                                             (CONS #'|MFINFACT;factor;SupF;5!1|
                                                   (VECTOR % |var|))
                                             (QCAR |u|) (QREFELT % 38))
                                            (QCDR |u|) %)
                                           #7#))))
                                  (LETT #8# (CDR #8#)) (GO G190) G191
                                  (EXIT (NREVERSE #7#)))))
                      (EXIT
                       (SPADCALL
                        (SPADCALL
                         (|MFINFACT;pushupconst| (QCAR |flist|) |var| %)
                         (QREFELT % 69))
                        |fr1| (QREFELT % 70)))))))))) 

(SDEFUN |MFINFACT;factor;SupF;5!1| ((|p1| NIL) ($$ NIL))
        (PROG (|var| %)
          (LETT |var| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushup| |p1| |var| %))))) 

(SDEFUN |MFINFACT;factor;SupF;5!0| ((|p1| NIL) ($$ NIL))
        (PROG (|var| %)
          (LETT |var| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|MFINFACT;pushdown| |p1| |var| %))))) 

(SDEFUN |MFINFACT;mFactor|
        ((|m|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|var| (OV)) (|dx| (|Integer|))
         (%
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseMultivariatePolynomial|
                                 (|SparseUnivariatePolynomial| F) OV))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|lmdeg| (|List| (|NonNegativeInteger|))) (|n| NIL) (#1=#:G211 NIL)
          (#2=#:G165 #3=(|Boolean|)) (#4=#:G163 #3#) (#5=#:G164 NIL)
          (|om| (PG)) (|sqfacs| (|Factored| PG))
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#6=#:G212 NIL) (|ff| NIL) (#7=#:G213 NIL)
          (|sqqfact|
           (|List|
            (|Record|
             (|:| |factor|
                  #8=(|SparseMultivariatePolynomial|
                      (|SparseUnivariatePolynomial| F) OV))
             (|:| |exponent| #9=(|NonNegativeInteger|)))))
          (|fact| NIL) (#10=#:G214 NIL) (|ffexp| #9#) (|lterm| NIL)
          (#11=#:G215 NIL)
          (|lcont|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#12=#:G181 NIL) (#13=#:G216 NIL)
          (|varch|
           (|Record|
            (|:| |npol|
                 #14=(|SparseUnivariatePolynomial|
                      (|SparseMultivariatePolynomial|
                       (|SparseUnivariatePolynomial| F) OV)))
            (|:| |nvar| (|List| OV))
            (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (|x| (OV)) (|lvar| (|List| OV))
          (|pc|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (#15=#:G188 NIL) (|ffactor| #8#) (|lcterm| NIL) (#16=#:G217 NIL)
          (|ldeg| (|List| (|NonNegativeInteger|))) (|lcum| (F)) (|um| #14#)
          (|lf|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV))))
          (#17=#:G218 NIL) (|lfp| NIL) (#18=#:G219 NIL)
          (|auxfl|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|)))))
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT % 54)) (|MFINFACT;constantCase| |m| NIL %))
           (#19='T
            (SEQ (LETT |lvar| (SPADCALL |m| (QREFELT % 19)))
                 (LETT |flead| (CONS (|spadConstant| % 59) NIL))
                 (LETT |factorlist| NIL)
                 (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT % 83)))
                 (EXIT
                  (COND
                   ((PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |n| NIL) (LETT #1# |lmdeg|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |n| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #2# (> |n| 0))
                             (COND (#5# (LETT #4# (COND (#4# 'T) ('T #2#))))
                                   ('T
                                    (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (COND (#5# #4#) (#19# NIL)))
                    (|MFINFACT;simplify| |m| |var| |dx| |lvar| |lmdeg| %))
                   (#19#
                    (SEQ (LETT |om| (|MFINFACT;pushup| |m| |var| %))
                         (LETT |sqfacs| (SPADCALL |om| (QREFELT % 84)))
                         (LETT |lcont|
                               (|MFINFACT;pushdown|
                                (SPADCALL |sqfacs| (QREFELT % 86)) |var| %))
                         (COND
                          ((SPADCALL |lcont| (QREFELT % 54))
                           (LETT |flead|
                                 (|MFINFACT;constantCase| |lcont| NIL %)))
                          (#19#
                           (LETT |flead|
                                 (|MFINFACT;mFactor| |lcont| |var| |dx| %))))
                         (LETT |factorlist| (QCDR |flead|))
                         (LETT |sqqfact|
                               (PROGN
                                (LETT #6# NIL)
                                (SEQ (LETT |ff| NIL)
                                     (LETT #7#
                                           (SPADCALL |sqfacs| (QREFELT % 89)))
                                     G190
                                     (COND
                                      ((OR (ATOM #7#)
                                           (PROGN (LETT |ff| (CAR #7#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #6#
                                             (CONS
                                              (CONS
                                               (|MFINFACT;pushdown|
                                                (QVELT |ff| 1) |var| %)
                                               (QVELT |ff| 2))
                                              #6#))))
                                     (LETT #7# (CDR #7#)) (GO G190) G191
                                     (EXIT (NREVERSE #6#)))))
                         (SEQ (LETT |fact| NIL) (LETT #10# |sqqfact|) G190
                              (COND
                               ((OR (ATOM #10#)
                                    (PROGN (LETT |fact| (CAR #10#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ffactor| (QCAR |fact|))
                                   (LETT |ffexp| (QCDR |fact|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |ffactor| (QREFELT % 54))
                                      (SEQ (LETT |lterm| NIL)
                                           (LETT #11#
                                                 (QCDR
                                                  (|MFINFACT;constantCase|
                                                   |ffactor| NIL %)))
                                           G190
                                           (COND
                                            ((OR (ATOM #11#)
                                                 (PROGN
                                                  (LETT |lterm| (CAR #11#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT |factorlist|
                                                   (CONS
                                                    (CONS (QCAR |lterm|)
                                                          (* (QCDR |lterm|)
                                                             |ffexp|))
                                                    |factorlist|))))
                                           (LETT #11# (CDR #11#)) (GO G190)
                                           G191 (EXIT NIL)))
                                     ('T
                                      (SEQ
                                       (LETT |lvar|
                                             (SPADCALL |ffactor|
                                                       (QREFELT % 19)))
                                       (LETT |x|
                                             (SPADCALL |lvar| 1
                                                       (QREFELT % 81)))
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT % 90)))
                                       (EXIT
                                        (COND
                                         ((SPADCALL 1 |ldeg| (QREFELT % 92))
                                          (SEQ
                                           (LETT |x|
                                                 (SPADCALL |lvar|
                                                           (SPADCALL 1 |ldeg|
                                                                     (QREFELT %
                                                                              80))
                                                           (QREFELT % 81)))
                                           (LETT |lcont|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |ffactor| |x|
                                                             (QREFELT % 94))
                                                   (QREFELT % 17))
                                                  (QREFELT % 96)))
                                           (LETT |ffactor|
                                                 (PROG2
                                                     (LETT #12#
                                                           (SPADCALL |ffactor|
                                                                     |lcont|
                                                                     (QREFELT %
                                                                              97)))
                                                     (QCDR #12#)
                                                   (|check_union2|
                                                    (QEQCAR #12# 0)
                                                    (|SparseMultivariatePolynomial|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT % 8))
                                                     (QREFELT % 6))
                                                    (|Union|
                                                     (|SparseMultivariatePolynomial|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT % 8))
                                                      (QREFELT % 6))
                                                     "failed")
                                                    #12#)))
                                           (LETT |factorlist|
                                                 (CONS (CONS |ffactor| |ffexp|)
                                                       |factorlist|))
                                           (EXIT
                                            (SEQ (LETT |lcterm| NIL)
                                                 (LETT #13#
                                                       (QCDR
                                                        (|MFINFACT;mFactor|
                                                         |lcont| |var| |dx|
                                                         %)))
                                                 G190
                                                 (COND
                                                  ((OR (ATOM #13#)
                                                       (PROGN
                                                        (LETT |lcterm|
                                                              (CAR #13#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT |factorlist|
                                                         (CONS
                                                          (CONS (QCAR |lcterm|)
                                                                (*
                                                                 (QCDR
                                                                  |lcterm|)
                                                                 |ffexp|))
                                                          |factorlist|))))
                                                 (LETT #13# (CDR #13#))
                                                 (GO G190) G191 (EXIT NIL)))))
                                         ('T
                                          (SEQ
                                           (LETT |varch|
                                                 (|MFINFACT;varChoose|
                                                  |ffactor| |lvar| |ldeg| %))
                                           (LETT |um| (QVELT |varch| 0))
                                           (LETT |ldeg| (CDR |ldeg|))
                                           (LETT |lvar| (CDR |lvar|))
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL (QVELT |varch| 1) 1
                                                        (QREFELT % 81))
                                              |x| (QREFELT % 98))
                                             (SEQ
                                              (LETT |lvar| (QVELT |varch| 1))
                                              (LETT |x|
                                                    (SPADCALL |lvar| 1
                                                              (QREFELT % 81)))
                                              (LETT |lvar| (CDR |lvar|))
                                              (LETT |pc|
                                                    (SPADCALL
                                                     (SPADCALL |um|
                                                               (QREFELT % 17))
                                                     (QREFELT % 96)))
                                              (COND
                                               ((SPADCALL |pc|
                                                          (|spadConstant| % 28)
                                                          (QREFELT % 99))
                                                (SEQ
                                                 (LETT |um|
                                                       (PROG2
                                                           (LETT #15#
                                                                 (SPADCALL |um|
                                                                           |pc|
                                                                           (QREFELT
                                                                            %
                                                                            100)))
                                                           (QCDR #15#)
                                                         (|check_union2|
                                                          (QEQCAR #15# 0)
                                                          (|SparseUnivariatePolynomial|
                                                           (|SparseMultivariatePolynomial|
                                                            (|SparseUnivariatePolynomial|
                                                             (QREFELT % 8))
                                                            (QREFELT % 6)))
                                                          (|Union|
                                                           (|SparseUnivariatePolynomial|
                                                            (|SparseMultivariatePolynomial|
                                                             (|SparseUnivariatePolynomial|
                                                              (QREFELT % 8))
                                                             (QREFELT % 6)))
                                                           "failed")
                                                          #15#)))
                                                 (LETT |ffactor|
                                                       (SPADCALL |um| |x|
                                                                 (QREFELT %
                                                                          101)))
                                                 (EXIT
                                                  (SEQ (LETT |lcterm| NIL)
                                                       (LETT #16#
                                                             (QCDR
                                                              (|MFINFACT;mFactor|
                                                               |pc| |var| |dx|
                                                               %)))
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #16#)
                                                             (PROGN
                                                              (LETT |lcterm|
                                                                    (CAR #16#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT |factorlist|
                                                               (CONS
                                                                (CONS
                                                                 (QCAR
                                                                  |lcterm|)
                                                                 (*
                                                                  (QCDR
                                                                   |lcterm|)
                                                                  |ffexp|))
                                                                |factorlist|))))
                                                       (LETT #16# (CDR #16#))
                                                       (GO G190) G191
                                                       (EXIT NIL))))))
                                              (EXIT
                                               (LETT |ldeg|
                                                     (SPADCALL |ffactor| |lvar|
                                                               (QREFELT %
                                                                        90)))))))
                                           (LETT |lcum|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |um|
                                                             (QREFELT % 53))
                                                   (QREFELT % 56))
                                                  (QREFELT % 102)))
                                           (COND
                                            ((SPADCALL |lcum|
                                                       (|spadConstant| % 26)
                                                       (QREFELT % 103))
                                             (SEQ
                                              (LETT |um|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL
                                                       (SPADCALL |lcum|
                                                                 (QREFELT %
                                                                          104))
                                                       (QREFELT % 105))
                                                      (QREFELT % 106))
                                                     |um| (QREFELT % 107)))
                                              (EXIT
                                               (PROGN
                                                (RPLACA |flead|
                                                        (SPADCALL
                                                         (SPADCALL |lcum|
                                                                   (QREFELT %
                                                                            105))
                                                         (QCAR |flead|)
                                                         (QREFELT % 58)))
                                                (QCAR |flead|))))))
                                           (COND
                                            ((SPADCALL
                                              (SPADCALL |um| (QREFELT % 53))
                                              (QREFELT % 54))
                                             (LETT |lf|
                                                   (|MFINFACT;mfconst| |um|
                                                    |dx| |lvar| |ldeg| %)))
                                            ('T
                                             (LETT |lf|
                                                   (|MFINFACT;mfpol| |um| |var|
                                                    |dx| |lvar| |ldeg| %))))
                                           (LETT |auxfl|
                                                 (PROGN
                                                  (LETT #17# NIL)
                                                  (SEQ (LETT |lfp| NIL)
                                                       (LETT #18# |lf|) G190
                                                       (COND
                                                        ((OR (ATOM #18#)
                                                             (PROGN
                                                              (LETT |lfp|
                                                                    (CAR #18#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #17#
                                                               (CONS
                                                                (CONS
                                                                 (SPADCALL
                                                                  |lfp| |x|
                                                                  (QREFELT %
                                                                           101))
                                                                 |ffexp|)
                                                                #17#))))
                                                       (LETT #18# (CDR #18#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #17#)))))
                                           (EXIT
                                            (LETT |factorlist|
                                                  (SPADCALL |factorlist|
                                                            |auxfl|
                                                            (QREFELT %
                                                                     110)))))))))))))
                              (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))
                         (PROGN (RPLACD |flead| |factorlist|) (QCDR |flead|))
                         (EXIT |flead|))))))))))) 

(SDEFUN |MFINFACT;pM|
        ((|lum|
          (|List|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
         (% (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|x| (|SparseUnivariatePolynomial| F)) (|i| NIL) (#1=#:G247 NIL)
          (#2=#:G225 NIL) (#3=#:G245 NIL) (|e| NIL) (#4=#:G230 NIL)
          (|q| (|Union| (|SparseUnivariatePolynomial| F) #5="failed"))
          (#6=#:G236 NIL) (|p| (|SparseUnivariatePolynomial| F))
          (#7=#:G246 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |x| (SPADCALL (|spadConstant| % 26) 1 (QREFELT % 111)))
                (SEQ (LETT |i| 1) (LETT #1# (SPADCALL (QREFELT % 112))) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |p|
                              (SPADCALL |x|
                                        (SPADCALL
                                         (SPADCALL
                                          (PROG1 (LETT #2# |i|)
                                            (|check_subtype2| (> #2# 0)
                                                              '(|PositiveInteger|)
                                                              '(|NonNegativeInteger|)
                                                              #2#))
                                          (QREFELT % 114))
                                         (QREFELT % 105))
                                        (QREFELT % 115)))
                        (EXIT
                         (COND
                          ((SPADCALL |p| |lum| (QREFELT % 118))
                           (PROGN
                            (LETT #3# (PROGN (LETT #7# |p|) (GO #8=#:G244)))
                            (GO #9=#:G226)))))))
                      #9# (EXIT #3#))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (SEQ (LETT |e| 2) G190 NIL
                      (SEQ
                       (LETT |p|
                             (SPADCALL
                              (PROG1 (LETT #4# |e|)
                                (|check_subtype2| (> #4# 0)
                                                  '(|PositiveInteger|)
                                                  '(|NonNegativeInteger|) #4#))
                              (QREFELT % 120)))
                       (EXIT
                        (COND
                         ((SPADCALL |p| |lum| (QREFELT % 118))
                          (PROGN (LETT #7# |p|) (GO #8#)))
                         ('T
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SEQ
                                   (LETT |q| (SPADCALL |p| (QREFELT % 122)))
                                   (EXIT (NULL (QEQCAR |q| 1)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |p|
                                      (PROG2 (LETT #6# |q|)
                                          (QCDR #6#)
                                        (|check_union2| (QEQCAR #6# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT % 8))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 8))
                                                         #5#)
                                                        #6#)))
                                (EXIT
                                 (COND
                                  ((SPADCALL |p| |lum| (QREFELT % 118))
                                   (PROGN (LETT #7# |p|) (GO #8#))))))
                               NIL (GO G190) G191 (EXIT NIL))))))
                      (LETT |e| (|inc_SI| |e|)) (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #7#)))) 

(SDEFUN |MFINFACT;pushdcoef|
        ((|t| (PG))
         (%
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                          OV)))
        (SPADCALL (ELT % 105) |t| (QREFELT % 125))) 

(SDEFUN |MFINFACT;intfact|
        ((|um|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|lvar| (|List| OV)) (|ldeg| (|List| (|NonNegativeInteger|)))
         (|tleadpol|
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseMultivariatePolynomial|
                                 (|SparseUnivariatePolynomial| F) OV))
                           (|:| |pow| (|NonNegativeInteger|)))))))
         (|ltry| (|List| (|List| (|SparseUnivariatePolynomial| F))))
         (%
          (|List|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))))
        (SPROG
         ((|polcase| (|Boolean|)) (#1=#:G301 NIL) (#2=#:G302 NIL)
          (|leadpol|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|vfchoo|
           (|Record|
            (|:| |inval| (|List| (|List| (|SparseUnivariatePolynomial| F))))
            (|:| |unvfact|
                 (|List|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F))))
            (|:| |lu| (|SparseUnivariatePolynomial| F))
            (|:| |complead| (|List| (|SparseUnivariatePolynomial| F)))))
          (|nfact| (|NonNegativeInteger|))
          (|lval| (|List| (|SparseUnivariatePolynomial| F)))
          (|leadval| (|List| (|SparseUnivariatePolynomial| F)))
          (|distf|
           (|Union|
            (|Record|
             (|:| |polfac|
                  (|List|
                   (|SparseMultivariatePolynomial|
                    (|SparseUnivariatePolynomial| F) OV)))
             (|:| |correct| (|SparseUnivariatePolynomial| F))
             (|:| |corrfact|
                  (|List|
                   (|SparseUnivariatePolynomial|
                    (|SparseUnivariatePolynomial| F)))))
            "failed"))
          (#3=#:G300 NIL)
          (|dist|
           (|Record|
            (|:| |polfac|
                 (|List|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV)))
            (|:| |correct| (|SparseUnivariatePolynomial| F))
            (|:| |corrfact|
                 (|List|
                  (|SparseUnivariatePolynomial|
                   (|SparseUnivariatePolynomial| F))))))
          (|lpol|
           (|List|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))
          (|dd| (|SparseUnivariatePolynomial| F)) (#4=#:G303 NIL) (|i| NIL)
          (#5=#:G304 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#6=#:G280 NIL)
          (|ffin|
           (|Union|
            (|List|
             (|SparseUnivariatePolynomial|
              (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                              OV)))
            "failed"))
          (#7=#:G305 NIL) (|ff| NIL) (#8=#:G306 NIL)
          (|factfin|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                             OV)))))
         (SEQ
          (EXIT
           (SEQ (LETT |polcase| (NULL (NULL (QCDR |tleadpol|))))
                (LETT |vfchoo|
                      (COND
                       (|polcase|
                        (SEQ
                         (LETT |leadpol|
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |ff| NIL)
                                     (LETT #2# (QCDR |tleadpol|)) G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |ff| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT (LETT #1# (CONS (QCAR |ff|) #1#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #1#)))))
                         (EXIT
                          (|MFINFACT;intChoose| |um| |lvar| (QCAR |tleadpol|)
                           |leadpol| |ltry| %))))
                       (#9='T
                        (|MFINFACT;intChoose| |um| |lvar| (|spadConstant| % 59)
                         NIL NIL %))))
                (LETT |unifact| (QVELT |vfchoo| 1))
                (LETT |nfact| (LENGTH |unifact|))
                (EXIT
                 (COND ((EQL |nfact| 1) (LIST |um|))
                       (#9#
                        (SEQ (LETT |ltry| (QVELT |vfchoo| 0))
                             (LETT |lval| (|SPADfirst| |ltry|))
                             (LETT |dd| (QVELT |vfchoo| 2)) (LETT |lpol| NIL)
                             (LETT |leadval| NIL)
                             (COND
                              (|polcase|
                               (SEQ (LETT |leadval| (QVELT |vfchoo| 3))
                                    (LETT |distf|
                                          (SPADCALL (QVELT |vfchoo| 2)
                                                    |unifact| |tleadpol|
                                                    |leadval| |lvar| |lval|
                                                    (QREFELT % 131)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |distf| 1)
                                       (PROGN
                                        (LETT #3#
                                              (|MFINFACT;intfact| |um| |lvar|
                                               |ldeg| |tleadpol| |ltry| %))
                                        (GO #10=#:G299)))
                                      (#9#
                                       (SEQ (LETT |dist| (QCDR |distf|))
                                            (LETT |lpol| (QVELT |dist| 0))
                                            (LETT |dd| (QVELT |dist| 1))
                                            (EXIT
                                             (LETT |unifact|
                                                   (QVELT |dist| 2))))))))))
                             (COND
                              ((SPADCALL |dd| (|spadConstant| % 59)
                                         (QREFELT % 132))
                               (SEQ
                                (LETT |unifact|
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |i| 1) (LETT #5# |nfact|)
                                            G190
                                            (COND
                                             ((|greater_SI| |i| #5#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |dd|
                                                               (SPADCALL
                                                                |unifact| |i|
                                                                (QREFELT %
                                                                         134))
                                                               (QREFELT % 135))
                                                     #4#))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191 (EXIT (NREVERSE #4#)))))
                                (EXIT
                                 (LETT |um|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |dd|
                                                   (PROG1
                                                       (LETT #6# (- |nfact| 1))
                                                     (|check_subtype2|
                                                      (>= #6# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #6#))
                                                   (QREFELT % 57))
                                         (QREFELT % 106))
                                        |um| (QREFELT % 107)))))))
                             (LETT |ffin|
                                   (SPADCALL |um| |lvar| |unifact| |lval|
                                             |lpol| |ldeg|
                                             (|MFINFACT;pM| |unifact| %)
                                             (QREFELT % 138)))
                             (EXIT
                              (COND
                               ((QEQCAR |ffin| 1)
                                (|MFINFACT;intfact| |um| |lvar| |ldeg|
                                 |tleadpol| |ltry| %))
                               (#9#
                                (SEQ (LETT |factfin| (QCDR |ffin|))
                                     (COND
                                      ((SPADCALL |dd| (|spadConstant| % 59)
                                                 (QREFELT % 132))
                                       (LETT |factfin|
                                             (PROGN
                                              (LETT #7# NIL)
                                              (SEQ (LETT |ff| NIL)
                                                   (LETT #8# |factfin|) G190
                                                   (COND
                                                    ((OR (ATOM #8#)
                                                         (PROGN
                                                          (LETT |ff| (CAR #8#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #7#
                                                           (CONS
                                                            (SPADCALL |ff|
                                                                      (QREFELT
                                                                       % 139))
                                                            #7#))))
                                                   (LETT #8# (CDR #8#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #7#)))))))
                                     (EXIT |factfin|)))))))))))
          #10# (EXIT #3#)))) 

(SDEFUN |MFINFACT;pushup|
        ((|f|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|x| (OV)) (% (PG)))
        (SPROG
         ((|lf|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|cf| (PG)) (|lvf| (|List| OV)) (|rr| (PG)))
         (SEQ
          (COND
           ((SPADCALL |f| (QREFELT % 54))
            (|MFINFACT;pushupconst| (SPADCALL |f| (QREFELT % 140)) |x| %))
           ('T
            (SEQ (LETT |rr| (|spadConstant| % 141))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |f| (|spadConstant| % 142) (QREFELT % 99)))
                        (GO G191)))
                      (SEQ (LETT |lf| (SPADCALL |f| (QREFELT % 143)))
                           (LETT |cf|
                                 (|MFINFACT;pushupconst|
                                  (SPADCALL |f| (QREFELT % 56)) |x| %))
                           (LETT |lvf| (SPADCALL |lf| (QREFELT % 19)))
                           (LETT |rr|
                                 (SPADCALL |rr|
                                           (SPADCALL |cf| |lvf|
                                                     (SPADCALL |lf| |lvf|
                                                               (QREFELT % 90))
                                                     (QREFELT % 144))
                                           (QREFELT % 145)))
                           (EXIT (LETT |f| (SPADCALL |f| (QREFELT % 146)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;pushdown|
        ((|g| (PG)) (|x| (OV))
         (%
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                          OV)))
        (SPROG
         ((|cf| (|SparseUnivariatePolynomial| F))
          (|rf|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|ug| (|SparseUnivariatePolynomial| PG)))
         (SEQ
          (COND
           ((SPADCALL |g| (QREFELT % 147))
            (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 148)) (QREFELT % 105))
                      (QREFELT % 106)))
           ('T
            (SEQ (LETT |rf| (|spadConstant| % 142))
                 (LETT |ug| (SPADCALL |g| |x| (QREFELT % 149)))
                 (SEQ G190
                      (COND
                       ((NULL
                         (SPADCALL |ug| (|spadConstant| % 150)
                                   (QREFELT % 151)))
                        (GO G191)))
                      (SEQ
                       (LETT |cf|
                             (SPADCALL (|spadConstant| % 26)
                                       (SPADCALL |ug| (QREFELT % 152))
                                       (QREFELT % 111)))
                       (LETT |rf|
                             (SPADCALL |rf|
                                       (SPADCALL |cf|
                                                 (|MFINFACT;pushdcoef|
                                                  (SPADCALL |ug|
                                                            (QREFELT % 153))
                                                  %)
                                                 (QREFELT % 154))
                                       (QREFELT % 155)))
                       (EXIT (LETT |ug| (SPADCALL |ug| (QREFELT % 156)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |rf|))))))) 

(SDEFUN |MFINFACT;pushupconst|
        ((|r| (|SparseUnivariatePolynomial| F)) (|x| (OV)) (% (PG)))
        (SPROG ((|rr| (PG)))
               (SEQ
                (COND
                 ((SPADCALL |r| (QREFELT % 157))
                  (SPADCALL (SPADCALL |r| (QREFELT % 158)) (QREFELT % 65)))
                 ('T
                  (SEQ (LETT |rr| (|spadConstant| % 141))
                       (SEQ G190
                            (COND
                             ((NULL
                               (SPADCALL |r| (|spadConstant| % 24)
                                         (QREFELT % 132)))
                              (GO G191)))
                            (SEQ
                             (LETT |rr|
                                   (SPADCALL |rr|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |r| (QREFELT % 102))
                                               (QREFELT % 65))
                                              |x|
                                              (SPADCALL |r| (QREFELT % 159))
                                              (QREFELT % 160))
                                             (QREFELT % 145)))
                             (EXIT (LETT |r| (SPADCALL |r| (QREFELT % 161)))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT |rr|))))))) 

(SDEFUN |MFINFACT;ran|
        ((|k1| (|Integer|)) (% (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|i| NIL) (#1=#:G329 NIL)
          (#2=#:G327 #3=(|SparseUnivariatePolynomial| F)) (#4=#:G325 #3#)
          (#5=#:G326 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |i| 0) (LETT #1# |k1|) G190
                (COND ((|greater_SI| |i| #1#) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (SPADCALL (QREFELT % 162)) |i|
                                   (QREFELT % 111)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 115))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|spadConstant| % 24))))))) 

(SDEFUN |MFINFACT;varChoose|
        ((|m|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|lvar| (|List| OV)) (|ldeg| (|List| #1=(|NonNegativeInteger|)))
         (%
          (|Record|
           (|:| |npol|
                (|SparseUnivariatePolynomial|
                 (|SparseMultivariatePolynomial|
                  (|SparseUnivariatePolynomial| F) OV)))
           (|:| |nvar| (|List| OV))
           (|:| |newdeg| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((#2=#:G1 NIL) (#3=#:G337 NIL) (#4=#:G333 #1#) (#5=#:G331 #1#)
          (#6=#:G332 NIL) (|k| #1#) (|i| (|Integer|)) (|x| (OV)))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #6# NIL)
                 (SEQ (LETT #2# NIL) (LETT #3# |ldeg|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT #2# (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #4# #2#)
                         (COND (#6# (LETT #5# (MIN #5# #4#)))
                               ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                      (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                 (COND (#6# #5#) (#7='T (|IdentityError| '|min|)))))
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT % 52)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT % 94)) |lvar|
                     |ldeg|))
            (#7#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT % 80)))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT % 81)))
                  (LETT |ldeg|
                        (CONS |k| (SPADCALL |ldeg| |i| (QREFELT % 163))))
                  (LETT |lvar|
                        (CONS |x| (SPADCALL |lvar| |i| (QREFELT % 164))))
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT % 94)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |MFINFACT;norm|
        ((|lum|
          (|List|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
         (% #1=(|Integer|)))
        (SPROG
         ((|lup| NIL) (#2=#:G342 NIL) (#3=#:G340 #1#) (#4=#:G338 #1#)
          (#5=#:G339 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |lup| NIL) (LETT #2# |lum|) G190
                (COND
                 ((OR (ATOM #2#) (PROGN (LETT |lup| (CAR #2#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #3# (SPADCALL |lup| (QREFELT % 165)))
                   (COND (#5# (LETT #4# (MAX #4# #3#)))
                         ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|IdentityError| '|max|))))))) 

(SDEFUN |MFINFACT;intChoose|
        ((|um|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|lvar| (|List| OV)) (|clc| (|SparseUnivariatePolynomial| F))
         (|plist|
          (|List|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|ltry| (|List| (|List| (|SparseUnivariatePolynomial| F))))
         (%
          (|Record|
           (|:| |inval| (|List| (|List| (|SparseUnivariatePolynomial| F))))
           (|:| |unvfact|
                (|List|
                 (|SparseUnivariatePolynomial|
                  (|SparseUnivariatePolynomial| F))))
           (|:| |lu| (|SparseUnivariatePolynomial| F))
           (|:| |complead| (|List| (|SparseUnivariatePolynomial| F))))))
        (SPROG
         ((|degum| (|NonNegativeInteger|)) (|nvar1| (|NonNegativeInteger|))
          (|testp| #1=(|Boolean|)) (#2=#:G418 NIL) (|i| NIL) (#3=#:G419 NIL)
          (|lval| (|List| (|SparseUnivariatePolynomial| F))) (#4=#:G420 NIL)
          (|pol| NIL) (#5=#:G421 NIL)
          (|leadcomp1| #6=(|List| (|SparseUnivariatePolynomial| F)))
          (|epl| NIL) (#7=#:G422 NIL) (#8=#:G351 #9=(|Boolean|))
          (#10=#:G349 #9#) (#11=#:G350 NIL) (#12=#:G356 NIL)
          (|Dnewm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|D2newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|range| (|NonNegativeInteger|)) (|lcnm| (F))
          (|newm|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|nfl|
           #13=(|List|
                (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                          (|:| |factor|
                               (|SparseUnivariatePolynomial|
                                (|SparseUnivariatePolynomial| F)))
                          (|:| |exponent| (|NonNegativeInteger|)))))
          (|base_failure| (|Integer|))
          (|luniv|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|base_success| (|Integer|)) (|skip| (|Boolean|)) (#14=#:G416 NIL)
          (|lunivf| #13#) (|nf| (|NonNegativeInteger|))
          (|lffc1| #15=(|SparseUnivariatePolynomial| F)) (#16=#:G423 NIL)
          (#17=#:G424 NIL) (#18=#:G425 NIL) (|ff| NIL) (#19=#:G426 NIL)
          (#20=#:G427 NIL) (#21=#:G428 NIL) (#22=#:G429 NIL) (#23=#:G430 NIL)
          (#24=#:G417 NIL) (#25=#:G431 NIL) (#26=#:G432 NIL) (|leadtest| #1#)
          (#27=#:G433 NIL) (|uf| NIL) (#28=#:G434 NIL)
          (|unifact|
           (|List|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (|lffc| #15#) (|leadcomp| #6#) (|int| #6#)
          (|nfatt| (|NonNegativeInteger|)))
         (SEQ (LETT |degum| (SPADCALL |um| (QREFELT % 14)))
              (LETT |nvar1| (LENGTH |lvar|)) (LETT |range| 0)
              (LETT |testp| (NULL (SPADCALL |plist| NIL (QREFELT % 166))))
              (LETT |leadcomp| (LETT |leadcomp1| NIL))
              (LETT |nfatt| (+ |degum| 1)) (LETT |lffc| (|spadConstant| % 59))
              (LETT |lffc1| |lffc|) (LETT |leadtest| 'T) (LETT |int| NIL)
              (LETT |base_success| 0) (LETT |base_failure| 0)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL 'T) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (LETT |lval|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |i| 1) (LETT #3# |nvar1|) G190
                                    (COND ((|greater_SI| |i| #3#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS (|MFINFACT;ran| |range| %)
                                                  #2#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT
                         (COND
                          ((SPADCALL |lval| |ltry| (QREFELT % 168))
                           (LETT |range| (+ 1 |range|)))
                          ('T
                           (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                (LETT |leadcomp1|
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |pol| NIL) (LETT #5# |plist|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |pol| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |pol| |lvar|
                                                                |lval|
                                                                (QREFELT %
                                                                         169))
                                                      (QREFELT % 140))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#)))))
                                (COND
                                 (|testp|
                                  (COND
                                   ((PROGN
                                     (LETT #11# NIL)
                                     (SEQ (LETT |epl| NIL)
                                          (LETT #7# |leadcomp1|) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |epl| (CAR #7#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #8#
                                                   (SPADCALL |epl|
                                                             (QREFELT % 170)))
                                             (COND
                                              (#11#
                                               (LETT #10#
                                                     (COND (#10# 'T)
                                                           ('T #8#))))
                                              ('T
                                               (PROGN
                                                (LETT #10# #8#)
                                                (LETT #11# 'T)))))))
                                          (LETT #7# (CDR #7#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#11# #10#) ('T NIL)))
                                    (EXIT (LETT |range| (+ |range| 1)))))))
                                (LETT |newm|
                                      (SPADCALL |um| |lvar| |lval|
                                                (QREFELT % 172)))
                                (COND
                                 ((OR
                                   (SPADCALL |degum|
                                             (SPADCALL |newm| (QREFELT % 165))
                                             (QREFELT % 173))
                                   (SPADCALL (SPADCALL |newm| (QREFELT % 174))
                                             0 (QREFELT % 173)))
                                  (EXIT (LETT |range| (+ |range| 1)))))
                                (LETT |lffc1|
                                      (SPADCALL |newm| (QREFELT % 175)))
                                (LETT |newm|
                                      (PROG2
                                          (LETT #12#
                                                (SPADCALL |newm| |lffc1|
                                                          (QREFELT % 176)))
                                          (QCDR #12#)
                                        (|check_union2| (QEQCAR #12# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 8)))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (|SparseUnivariatePolynomial|
                                                           (QREFELT % 8)))
                                                         "failed")
                                                        #12#)))
                                (COND
                                 (|testp|
                                  (COND
                                   (|leadtest|
                                    (COND
                                     ((NULL
                                       (SPADCALL
                                        (SPADCALL |lffc1| |clc| (QREFELT % 58))
                                        (LENGTH |plist|) |leadcomp1|
                                        (QREFELT % 177)))
                                      (EXIT (LETT |range| (+ |range| 1)))))))))
                                (LETT |Dnewm|
                                      (SPADCALL |newm| (QREFELT % 178)))
                                (LETT |D2newm|
                                      (SPADCALL (ELT % 181) |newm|
                                                (QREFELT % 184)))
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL
                                     (SPADCALL (LIST |newm| |Dnewm| |D2newm|)
                                               (QREFELT % 185))
                                     (QREFELT % 165))
                                    0 (QREFELT % 173))
                                   (LETT |range| (+ |range| 1)))
                                  ('T
                                   (SEQ (LETT |lcnm| (|spadConstant| % 26))
                                        (COND
                                         ((SPADCALL
                                           (LETT |lcnm|
                                                 (SPADCALL
                                                  (SPADCALL |newm|
                                                            (QREFELT % 186))
                                                  (QREFELT % 102)))
                                           (|spadConstant| % 26)
                                           (QREFELT % 103))
                                          (LETT |newm|
                                                (SPADCALL
                                                 (SPADCALL
                                                  (SPADCALL |lcnm|
                                                            (QREFELT % 104))
                                                  (QREFELT % 105))
                                                 |newm| (QREFELT % 135)))))
                                        (LETT |luniv|
                                              (SPADCALL |newm|
                                                        (QREFELT % 189)))
                                        (LETT |nfl|
                                              (SPADCALL |luniv|
                                                        (QREFELT % 192)))
                                        (LETT |nf| (LENGTH |nfl|))
                                        (COND
                                         ((OR (EQL |nf| 0) (> |nf| |nfatt|))
                                          (EXIT "next values")))
                                        (COND
                                         ((EQL |nf| 1)
                                          (COND
                                           ((QEQCAR
                                             (QVELT
                                              (SPADCALL |nfl| 1
                                                        (QREFELT % 193))
                                              0)
                                             0)
                                            (SEQ
                                             (LETT |base_failure|
                                                   (+ |base_failure| 1))
                                             (LETT |skip|
                                                   (< |base_failure|
                                                      (+ (* 3 |base_success|)
                                                         3)))
                                             (EXIT
                                              (LETT |luniv|
                                                    (COND (|skip| |luniv|)
                                                          ('T
                                                           (SPADCALL |newm|
                                                                     (QREFELT %
                                                                              194))))))))
                                           ('T
                                            (SEQ
                                             (LETT |base_success|
                                                   (+ |base_success| 1))
                                             (EXIT (LETT |skip| NIL))))))
                                         ('T
                                          (SEQ
                                           (LETT |base_success|
                                                 (+ |base_success| 1))
                                           (EXIT (LETT |skip| NIL)))))
                                        (EXIT
                                         (COND
                                          (|skip|
                                           (PROGN
                                            (LETT #14# |$NoValue|)
                                            (GO #29=#:G344)))
                                          ('T
                                           (SEQ
                                            (LETT |lunivf|
                                                  (SPADCALL |luniv|
                                                            (QREFELT % 192)))
                                            (LETT |nf| (LENGTH |lunivf|))
                                            (COND
                                             ((OR (EQL |nf| 0)
                                                  (> |nf| |nfatt|))
                                              (EXIT "next values")))
                                            (COND
                                             ((EQL |nf| 1)
                                              (SEQ
                                               (LETT |unifact| (LIST |newm|))
                                               (EXIT
                                                (PROGN
                                                 (LETT #24# |$NoValue|)
                                                 (GO #30=#:G413))))))
                                            (LETT |lffc1|
                                                  (SPADCALL
                                                   (SPADCALL |lcnm|
                                                             (SPADCALL
                                                              (SPADCALL |luniv|
                                                                        (QREFELT
                                                                         %
                                                                         195))
                                                              (QREFELT % 196))
                                                             (QREFELT % 197))
                                                   |lffc1| (QREFELT % 58)))
                                            (EXIT
                                             (COND
                                              ((EQL |nfatt| |nf|)
                                               (SEQ
                                                (COND
                                                 (|leadtest|
                                                  (SEQ
                                                   (LETT |unifact|
                                                         (PROGN
                                                          (LETT #16# NIL)
                                                          (SEQ (LETT |uf| NIL)
                                                               (LETT #17#
                                                                     |lunivf|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #17#)
                                                                  (PROGN
                                                                   (LETT |uf|
                                                                         (CAR
                                                                          #17#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #16#
                                                                       (CONS
                                                                        (QVELT
                                                                         |uf|
                                                                         1)
                                                                        #16#))))
                                                               (LETT #17#
                                                                     (CDR
                                                                      #17#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #16#)))))
                                                   (LETT |int| |lval|)
                                                   (LETT |lffc| |lffc1|)
                                                   (EXIT
                                                    (COND
                                                     (|testp|
                                                      (LETT |leadcomp|
                                                            |leadcomp1|))))))
                                                 ((>
                                                   (|MFINFACT;norm| |unifact|
                                                    %)
                                                   (|MFINFACT;norm|
                                                    (PROGN
                                                     (LETT #18# NIL)
                                                     (SEQ (LETT |ff| NIL)
                                                          (LETT #19# |lunivf|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #19#)
                                                                (PROGN
                                                                 (LETT |ff|
                                                                       (CAR
                                                                        #19#))
                                                                 NIL))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #18#
                                                                  (CONS
                                                                   (QVELT |ff|
                                                                          1)
                                                                   #18#))))
                                                          (LETT #19#
                                                                (CDR #19#))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #18#))))
                                                    %))
                                                  (COND
                                                   (|testp|
                                                    (COND
                                                     ((SPADCALL
                                                       (SPADCALL |lffc1| |clc|
                                                                 (QREFELT %
                                                                          58))
                                                       (LENGTH |plist|)
                                                       |leadcomp1|
                                                       (QREFELT % 177))
                                                      (SEQ
                                                       (LETT |unifact|
                                                             (PROGN
                                                              (LETT #20# NIL)
                                                              (SEQ
                                                               (LETT |uf| NIL)
                                                               (LETT #21#
                                                                     |lunivf|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #21#)
                                                                  (PROGN
                                                                   (LETT |uf|
                                                                         (CAR
                                                                          #21#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #20#
                                                                       (CONS
                                                                        (QVELT
                                                                         |uf|
                                                                         1)
                                                                        #20#))))
                                                               (LETT #21#
                                                                     (CDR
                                                                      #21#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #20#)))))
                                                       (LETT |int| |lval|)
                                                       (LETT |lffc| |lffc1|)
                                                       (EXIT
                                                        (COND
                                                         (|testp|
                                                          (LETT |leadcomp|
                                                                |leadcomp1|))))))))
                                                   ('T
                                                    (SEQ
                                                     (LETT |unifact|
                                                           (PROGN
                                                            (LETT #22# NIL)
                                                            (SEQ
                                                             (LETT |uf| NIL)
                                                             (LETT #23#
                                                                   |lunivf|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #23#)
                                                                   (PROGN
                                                                    (LETT |uf|
                                                                          (CAR
                                                                           #23#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #22#
                                                                     (CONS
                                                                      (QVELT
                                                                       |uf| 1)
                                                                      #22#))))
                                                             (LETT #23#
                                                                   (CDR #23#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #22#)))))
                                                     (LETT |int| |lval|)
                                                     (LETT |lffc| |lffc1|)
                                                     (EXIT
                                                      (COND
                                                       (|testp|
                                                        (LETT |leadcomp|
                                                              |leadcomp1|)))))))))
                                                (EXIT
                                                 (PROGN
                                                  (LETT #24# |$NoValue|)
                                                  (GO #30#)))))
                                              ((> |nfatt| |degum|)
                                               (SEQ
                                                (LETT |unifact|
                                                      (PROGN
                                                       (LETT #25# NIL)
                                                       (SEQ (LETT |uf| NIL)
                                                            (LETT #26#
                                                                  |lunivf|)
                                                            G190
                                                            (COND
                                                             ((OR (ATOM #26#)
                                                                  (PROGN
                                                                   (LETT |uf|
                                                                         (CAR
                                                                          #26#))
                                                                   NIL))
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT #25#
                                                                    (CONS
                                                                     (QVELT
                                                                      |uf| 1)
                                                                     #25#))))
                                                            (LETT #26#
                                                                  (CDR #26#))
                                                            (GO G190) G191
                                                            (EXIT
                                                             (NREVERSE
                                                              #25#)))))
                                                (LETT |lffc| |lffc1|)
                                                (COND
                                                 (|testp|
                                                  (LETT |leadcomp|
                                                        |leadcomp1|)))
                                                (LETT |int| |lval|)
                                                (LETT |leadtest| NIL)
                                                (EXIT (LETT |nfatt| |nf|))))
                                              ((> |nfatt| |nf|)
                                               (SEQ
                                                (COND
                                                 (|testp|
                                                  (LETT |leadtest|
                                                        (NULL
                                                         (SPADCALL
                                                          (SPADCALL |lffc|
                                                                    |clc|
                                                                    (QREFELT %
                                                                             58))
                                                          (LENGTH |plist|)
                                                          |leadcomp|
                                                          (QREFELT % 177)))))
                                                 ('T (LETT |leadtest| NIL)))
                                                (COND
                                                 ((NULL |leadtest|)
                                                  (SEQ
                                                   (LETT |unifact|
                                                         (PROGN
                                                          (LETT #27# NIL)
                                                          (SEQ (LETT |uf| NIL)
                                                               (LETT #28#
                                                                     |lunivf|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #28#)
                                                                  (PROGN
                                                                   (LETT |uf|
                                                                         (CAR
                                                                          #28#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #27#
                                                                       (CONS
                                                                        (QVELT
                                                                         |uf|
                                                                         1)
                                                                        #27#))))
                                                               (LETT #28#
                                                                     (CDR
                                                                      #28#))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #27#)))))
                                                   (LETT |lffc| |lffc1|)
                                                   (COND
                                                    (|testp|
                                                     (LETT |leadcomp|
                                                           |leadcomp1|)))
                                                   (EXIT
                                                    (LETT |int| |lval|)))))
                                                (EXIT
                                                 (LETT |nfatt|
                                                       |nf|))))))))))))))))))))
                      #29# (EXIT #14#))
                     NIL (GO G190) G191 (EXIT NIL)))
               #30# (EXIT #24#))
              (EXIT (VECTOR (CONS |int| |ltry|) |unifact| |lffc| |leadcomp|))))) 

(SDEFUN |MFINFACT;constantCase|
        ((|m|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|factorlist|
          (|List|
           (|Record|
            (|:| |irr|
                 (|SparseMultivariatePolynomial|
                  (|SparseUnivariatePolynomial| F) OV))
            (|:| |pow| (|NonNegativeInteger|)))))
         (%
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseMultivariatePolynomial|
                                 (|SparseUnivariatePolynomial| F) OV))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|lunm|
           (|Record| (|:| |cont| F)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| F))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#1=#:G442 NIL) (|pp| NIL) (#2=#:G443 NIL))
         (SEQ
          (LETT |lunm|
                (SPADCALL (SPADCALL |m| (QREFELT % 140)) (QREFELT % 64)))
          (EXIT
           (CONS (SPADCALL (QCAR |lunm|) (QREFELT % 105))
                 (SPADCALL |factorlist|
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |pp| NIL) (LETT #2# (QCDR |lunm|)) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |pp| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS
                                          (CONS
                                           (SPADCALL (QCAR |pp|)
                                                     (QREFELT % 106))
                                           (QCDR |pp|))
                                          #1#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #1#))))
                           (QREFELT % 110))))))) 

(SDEFUN |MFINFACT;simplify|
        ((|m|
          (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F) OV))
         (|var| (OV)) (|dm| (|Integer|)) (|lvar| (|List| OV))
         (|lmdeg| (|List| (|NonNegativeInteger|)))
         (%
          (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr|
                                (|SparseMultivariatePolynomial|
                                 (|SparseUnivariatePolynomial| F) OV))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|x| NIL) (#1=#:G455 NIL) (|i| (|NonNegativeInteger|))
          (|pol1|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|factorlist|
           (|List|
            (|Record|
             (|:| |irr|
                  (|SparseMultivariatePolynomial|
                   (|SparseUnivariatePolynomial| F) OV))
             (|:| |pow| (|NonNegativeInteger|)))))
          (#2=#:G450 NIL)
          (|flead|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |factorlist| NIL) (LETT |pol1| (|spadConstant| % 28))
              (SEQ (LETT |x| NIL) (LETT #1# |lvar|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT % 198))
                                    (QREFELT % 199)))
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| % 28)
                                                       |x| |i| (QREFELT % 200))
                                             (QREFELT % 201)))
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT % 202)) |i|)
                                     |factorlist|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2 (LETT #2# (SPADCALL |m| |pol1| (QREFELT % 97)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0)
                                      (|SparseMultivariatePolynomial|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 8))
                                       (QREFELT % 6))
                                      (|Union|
                                       (|SparseMultivariatePolynomial|
                                        (|SparseUnivariatePolynomial|
                                         (QREFELT % 8))
                                        (QREFELT % 6))
                                       "failed")
                                      #2#)))
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT % 54))
                 (|MFINFACT;constantCase| |m| |factorlist| %))
                ('T
                 (SEQ (LETT |flead| (|MFINFACT;mFactor| |m| |var| |dm| %))
                      (PROGN
                       (RPLACD |flead|
                               (SPADCALL |factorlist| (QCDR |flead|)
                                         (QREFELT % 110)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |MFINFACT;mfconst|
        ((|um|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|dm| (|Integer|)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (%
          (|List|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))))
        (SPROG
         ((|um1|
           (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F)))
          (|lum|
           (|Factored|
            (|SparseUnivariatePolynomial| (|SparseUnivariatePolynomial| F))))
          (#1=#:G467 NIL) (|lumf| NIL) (#2=#:G468 NIL))
         (SEQ
          (COND
           ((NULL |lvar|)
            (SEQ (LETT |um1| (SPADCALL (ELT % 203) |um| (QREFELT % 206)))
                 (LETT |lum| (SPADCALL |um1| (QREFELT % 194)))
                 (EXIT
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |lumf| NIL)
                        (LETT #2# (SPADCALL |lum| (QREFELT % 192))) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |lumf| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS
                                 (SPADCALL (ELT % 106) (QVELT |lumf| 1)
                                           (QREFELT % 209))
                                 #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))))
           ('T
            (|MFINFACT;intfact| |um| |lvar| |ldeg|
             (CONS (|spadConstant| % 24) NIL) NIL %)))))) 

(SDEFUN |MFINFACT;mfpol|
        ((|um|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV)))
         (|var| (OV)) (|dm| (|Integer|)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (%
          (|List|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                            OV)))))
        (SPROG
         ((|tleadpol|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (LETT |tleadpol|
                (|MFINFACT;mFactor| (SPADCALL |um| (QREFELT % 53)) |var| |dm|
                 %))
          (EXIT (|MFINFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL %))))) 

(SDEFUN |MFINFACT;factor;PGF;21| ((|m| (PG)) (% (|Factored| PG)))
        (SPROG
         ((|lv| (|List| OV)) (#1=#:G489 NIL) (|x| NIL) (#2=#:G490 NIL)
          (|ld| (|List| #3=(|NonNegativeInteger|))) (#4=#:G2 NIL)
          (#5=#:G491 NIL) (#6=#:G477 #3#) (#7=#:G475 #3#) (#8=#:G476 NIL)
          (|dx| #3#) (|var| (OV))
          (|cm|
           (|SparseMultivariatePolynomial| (|SparseUnivariatePolynomial| F)
                                           OV))
          (|flist|
           (|Record| (|:| |contp| (|SparseUnivariatePolynomial| F))
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr|
                                 (|SparseMultivariatePolynomial|
                                  (|SparseUnivariatePolynomial| F) OV))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (#9=#:G492 NIL) (|u| NIL) (#10=#:G493 NIL))
         (SEQ (LETT |lv| (SPADCALL |m| (QREFELT % 210)))
              (EXIT
               (COND
                ((SPADCALL |lv| NIL (QREFELT % 211))
                 (SPADCALL |m| NIL (QREFELT % 212)))
                (#11='T
                 (SEQ
                  (LETT |ld|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |x| NIL) (LETT #2# |lv|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |x| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |m| |x| (QREFELT % 213))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (LETT |dx|
                        (PROGN
                         (LETT #8# NIL)
                         (SEQ (LETT #4# NIL) (LETT #5# |ld|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT #4# (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #6# #4#)
                                 (COND (#8# (LETT #7# (MIN #7# #6#)))
                                       ('T
                                        (PROGN
                                         (LETT #7# #6#)
                                         (LETT #8# 'T)))))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (COND (#8# #7#) (#11# (|IdentityError| '|min|)))))
                  (LETT |var|
                        (SPADCALL |lv| (SPADCALL |dx| |ld| (QREFELT % 80))
                                  (QREFELT % 81)))
                  (LETT |cm| (|MFINFACT;pushdown| |m| |var| %))
                  (LETT |flist| (|MFINFACT;mFactor| |cm| |var| |dx| %))
                  (EXIT
                   (SPADCALL (|MFINFACT;pushupconst| (QCAR |flist|) |var| %)
                             (PROGN
                              (LETT #9# NIL)
                              (SEQ (LETT |u| NIL) (LETT #10# (QCDR |flist|))
                                   G190
                                   (COND
                                    ((OR (ATOM #10#)
                                         (PROGN (LETT |u| (CAR #10#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #9#
                                           (CONS
                                            (VECTOR (CONS 3 "prime")
                                                    (|MFINFACT;pushup|
                                                     (QCAR |u|) |var| %)
                                                    (QCDR |u|))
                                            #9#))))
                                   (LETT #10# (CDR #10#)) (GO G190) G191
                                   (EXIT (NREVERSE #9#))))
                             (QREFELT % 212)))))))))) 

(DECLAIM (NOTINLINE |MultFiniteFactorize;|)) 

(DEFUN |MultFiniteFactorize;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultFiniteFactorize| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 215))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MultFiniteFactorize|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MultFiniteFactorize| (&REST #1=#:G494)
  (SPROG NIL
         (PROG (#2=#:G495)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultFiniteFactorize|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultFiniteFactorize;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultFiniteFactorize|)))))))))) 

(MAKEPROP '|MultFiniteFactorize| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|SparseMultivariatePolynomial| 23 6)
              (|SparseUnivariatePolynomial| 10) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |degree|) (10 . |ground|) (|List| 10)
              (15 . |coefficients|) (|List| 6) (20 . |variables|)
              (25 . |setUnion|) (31 . |0|) (35 . |0|)
              (|SparseUnivariatePolynomial| 8) (39 . |0|)
              (43 . |minimumDegree|) (48 . |1|) (52 . |1|) (56 . |1|)
              (60 . |monomial|) (|Union| % '"failed") (66 . |exquo|)
              (|Record| (|:| |irr| 11) (|:| |pow| 13)) (|List| 32)
              (72 . |append|) (|SparseUnivariatePolynomial| 9) (|Mapping| 9 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 9 35)
              (78 . |map|) (|Factored| %) (84 . |squareFree|) (|Factored| 35)
              (89 . |unit|) (|Mapping| 10 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 35 10 11)
              (94 . |map|) (|Boolean|) (100 . |ground?|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 48) (|:| |factor| 35) (|:| |exponent| 13))
              (|List| 49) (105 . |factorList|) (110 . |degree|)
              (116 . |leadingCoefficient|) (121 . |ground?|) (126 . |concat!|)
              (132 . |leadingCoefficient|) (137 . ^) (143 . *) (149 . |1|)
              (153 . |exquo|) (|Record| (|:| |factor| 23) (|:| |exponent| 13))
              (|Record| (|:| |cont| 8) (|:| |factors| (|List| 61)))
              (|UnivariateFiniteFieldFactorize| 8 23) (159 . |sufactor|)
              (164 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 23 9 35)
              (169 . |map|) (175 . |coerce|) (180 . |makeFR|)
              (|FactoringUtilities| 7 6 8 9) (186 . |variables|)
              (191 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 35 8 23)
              (196 . |map|) (|List| 13) (202 . |degree|) (|Integer|)
              (208 . |position|) (214 . |elt|) |MFINFACT;factor;SupF;5|
              (220 . |minimumDegree|) (226 . |squareFree|) (|Factored| 9)
              (231 . |unit|)
              (|Record| (|:| |flag| 48) (|:| |factor| 9) (|:| |exponent| 13))
              (|List| 87) (236 . |factorList|) (241 . |degree|) (247 . |1|)
              (251 . |member?|) (|SparseUnivariatePolynomial| %)
              (257 . |univariate|) (|List| %) (263 . |gcd|) (268 . |exquo|)
              (274 . ~=) (280 . ~=) (286 . |exquo|) (292 . |multivariate|)
              (298 . |leadingCoefficient|) (303 . ~=) (309 . |inv|)
              (314 . |coerce|) (319 . |coerce|) (324 . *)
              (|Record| (|:| |irr| 10) (|:| |pow| 13)) (|List| 108)
              (330 . |append|) (336 . |monomial|) (342 . |size|)
              (|PositiveInteger|) (346 . |index|) (351 . +) (|List| 133)
              (|GenExEuclid| 23 133) (357 . |testModulus|)
              (|FiniteFieldPolynomialPackage| 8)
              (363 . |createIrreduciblePoly|) (|Union| 23 '"failed")
              (368 . |nextIrreduciblePoly|) (|Mapping| 23 8)
              (|MPolyCatFunctions2| 6 7 (|IndexedExponents| 6) 8 23 9 10)
              (373 . |map|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 23)
                        (|:| |corrfact| 116))
              (|Union| 126 '"failed")
              (|Record| (|:| |contp| 23) (|:| |factors| 109)) (|List| 23)
              (|LeadingCoefDetermination| 6 (|IndexedExponents| 6) 23 10)
              (379 . |distFact|) (389 . ~=) (|SparseUnivariatePolynomial| 23)
              (395 . |elt|) (401 . *) (|Union| (|List| 11) '"failed")
              (|MultivariateLifting| (|IndexedExponents| 6) 6 23 10)
              (407 . |lifting|) (418 . |primitivePart|) (423 . |retract|)
              (428 . |0|) (432 . |0|) (436 . |leadingMonomial|)
              (441 . |monomial|) (448 . +) (454 . |reductum|) (459 . |ground?|)
              (464 . |retract|) (469 . |univariate|) (475 . |0|) (479 . ~=)
              (485 . |degree|) (490 . |leadingCoefficient|) (495 . *) (501 . +)
              (507 . |reductum|) (512 . |ground?|) (517 . |retract|)
              (522 . |degree|) (527 . |monomial|) (534 . |reductum|)
              (539 . |random|) (543 . |delete|) (549 . |delete|)
              (555 . |degree|) (560 . =) (|List| 129) (566 . |member?|)
              (572 . |eval|) (579 . |unit?|)
              (|FactoringUtilities| (|IndexedExponents| 6) 6 23 10)
              (584 . |completeEval|) (591 . ~=) (597 . |minimumDegree|)
              (602 . |content|) (607 . |exquo|) (613 . |polCase|)
              (620 . |differentiate|) (625 . |differentiate|)
              (630 . |differentiate|) (635 . |differentiate|)
              (640 . |differentiate|) (|Mapping| 23 23) (645 . |map|)
              (651 . |gcd|) (656 . |leadingCoefficient|) (|Factored| 133)
              (|TwoFactorize| 8) (661 . |tryTwoFactor|)
              (|Record| (|:| |flag| 48) (|:| |factor| 133) (|:| |exponent| 13))
              (|List| 190) (666 . |factorList|) (671 . |elt|)
              (677 . |generalTwoFactor|) (682 . |unit|) (687 . |retract|)
              (692 . *) (698 . |position|) (704 . |elt|) (710 . |monomial|)
              (717 . *) (723 . |coerce|) (728 . |ground|) (|Mapping| 23 10)
              (|UnivariatePolynomialCategoryFunctions2| 10 11 23 133)
              (733 . |map|) (|Mapping| 10 23)
              (|UnivariatePolynomialCategoryFunctions2| 23 133 10 11)
              (739 . |map|) (745 . |variables|) (750 . =) (756 . |makeFR|)
              (762 . |degree|) |MFINFACT;factor;PGF;21|)
           '#(|factor| 768) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#4|) |#4|)) T)
                                   '((|factor|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#4|))
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 214
                                            '(1 11 0 10 12 1 11 13 0 14 1 11 10
                                              0 15 1 11 16 0 17 1 10 18 0 19 2
                                              18 0 0 0 20 0 7 0 21 0 8 0 22 0
                                              23 0 24 1 11 13 0 25 0 8 0 26 0 9
                                              0 27 0 10 0 28 2 11 0 10 13 29 2
                                              11 30 0 0 31 2 33 0 0 0 34 2 37
                                              35 36 11 38 1 35 39 0 40 1 41 35
                                              0 42 2 44 11 43 35 45 1 11 46 0
                                              47 1 41 50 0 51 2 10 13 0 6 52 1
                                              11 10 0 53 1 10 46 0 54 2 33 0 0
                                              0 55 1 10 23 0 56 2 23 0 0 13 57
                                              2 23 0 0 0 58 0 23 0 59 2 23 30 0
                                              0 60 1 63 62 23 64 1 9 0 8 65 2
                                              67 35 66 23 68 1 35 0 9 69 2 41 0
                                              35 50 70 1 71 18 35 72 1 9 8 0 73
                                              2 75 23 74 35 76 2 71 77 35 18 78
                                              2 77 79 13 0 80 2 18 6 0 79 81 2
                                              10 77 0 18 83 1 9 39 0 84 1 85 9
                                              0 86 1 85 88 0 89 2 10 77 0 18 90
                                              0 11 0 91 2 77 46 13 0 92 2 10 93
                                              0 6 94 1 10 0 95 96 2 10 30 0 0
                                              97 2 6 46 0 0 98 2 10 46 0 0 99 2
                                              11 30 0 10 100 2 10 0 93 6 101 1
                                              23 8 0 102 2 8 46 0 0 103 1 8 0 0
                                              104 1 23 0 8 105 1 10 0 23 106 2
                                              11 0 10 0 107 2 109 0 0 0 110 2
                                              23 0 8 13 111 0 8 13 112 1 8 0
                                              113 114 2 23 0 0 0 115 2 117 46
                                              23 116 118 1 119 23 113 120 1 119
                                              121 23 122 2 124 10 123 9 125 6
                                              130 127 23 116 128 129 18 129 131
                                              2 23 46 0 0 132 2 116 133 0 79
                                              134 2 133 0 23 0 135 7 137 136 11
                                              18 116 129 16 77 23 138 1 11 0 0
                                              139 1 10 23 0 140 0 9 0 141 0 10
                                              0 142 1 10 0 0 143 3 9 0 0 18 77
                                              144 2 9 0 0 0 145 1 10 0 0 146 1
                                              9 46 0 147 1 9 8 0 148 2 9 93 0 6
                                              149 0 35 0 150 2 35 46 0 0 151 1
                                              35 13 0 152 1 35 9 0 153 2 10 0
                                              23 0 154 2 10 0 0 0 155 1 35 0 0
                                              156 1 23 46 0 157 1 23 8 0 158 1
                                              23 13 0 159 3 9 0 0 6 13 160 1 23
                                              0 0 161 0 8 0 162 2 77 0 0 79 163
                                              2 18 0 0 79 164 1 133 13 0 165 2
                                              16 46 0 0 166 2 167 46 129 0 168
                                              3 10 0 0 18 129 169 1 23 46 0 170
                                              3 171 133 11 18 129 172 2 13 46 0
                                              0 173 1 133 13 0 174 1 133 23 0
                                              175 2 133 30 0 23 176 3 130 46 23
                                              13 129 177 1 133 0 0 178 1 8 0 0
                                              179 1 35 0 0 180 1 23 0 0 181 1
                                              11 0 0 182 2 133 0 183 0 184 1
                                              133 0 95 185 1 133 23 0 186 1 188
                                              187 133 189 1 187 191 0 192 2 191
                                              190 0 79 193 1 188 187 133 194 1
                                              187 133 0 195 1 133 23 0 196 2 23
                                              0 8 0 197 2 18 79 6 0 198 2 77 13
                                              0 79 199 3 10 0 0 6 13 200 2 10 0
                                              0 0 201 1 10 0 6 202 1 10 23 0
                                              203 2 205 133 204 11 206 2 208 11
                                              207 133 209 1 9 18 0 210 2 18 46
                                              0 0 211 2 85 0 9 88 212 2 9 13 0
                                              6 213 1 0 85 9 214 1 0 41 35
                                              82)))))
           '|lookupComplete|)) 
