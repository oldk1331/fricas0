
(SDEFUN |INNMFACT;convertPUP|
        ((|lfg|
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         (%
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr| (|SparseUnivariatePolynomial| P))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG ((#1=#:G37 NIL) (|lff| NIL) (#2=#:G38 NIL))
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

(SDEFUN |INNMFACT;supFactor|
        ((|um| (|SparseUnivariatePolynomial| P))
         (|ufactor|
          (|Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (%
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record|
                           (|:| |irr| (|SparseUnivariatePolynomial| P))
                           (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|cf| NIL) (#2=#:G107 NIL) (#3=#:G43 #4=(|List| OV)) (#5=#:G41 #4#)
          (#6=#:G42 NIL) (|lvar| #4#) (|umv| (|SparseUnivariatePolynomial| R))
          (|lfact| #1#) (#7=#:G108 NIL) (|ff| NIL) (#8=#:G109 NIL)
          (|mdeg| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| P)) (#9=#:G64 NIL)
          (#10=#:G106 NIL)
          (|uum|
           (|Record| (|:| |unit| (|SparseUnivariatePolynomial| P))
                     (|:| |canonical| (|SparseUnivariatePolynomial| P))
                     (|:| |associate| (|SparseUnivariatePolynomial| P))))
          (|sqfacs| (|Factored| (|SparseUnivariatePolynomial| P)))
          (|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           #11=(|Record|
                                (|:| |irr| (|SparseUnivariatePolynomial| P))
                                (|:| |pow| (|NonNegativeInteger|)))))))
          (|sqqfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| #12=(|SparseUnivariatePolynomial| P))
                      (|:| |exponent| #13=(|NonNegativeInteger|)))))
          (|fact| NIL) (#14=#:G110 NIL) (|ffactor| #12#) (|ffexp| #13#)
          (|lfg|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|)))))))
          (|lcont| (P)) (#15=#:G111 NIL) (|lff| NIL) (#16=#:G112 NIL)
          (|coefs| (|List| P)) (#17=#:G113 NIL) (|xx| NIL) (#18=#:G114 NIL)
          (|fc| NIL) (#19=#:G115 NIL) (#20=#:G86 #21=(|NonNegativeInteger|))
          (#22=#:G84 #21#) (#23=#:G85 NIL) (|ldeg| (|List| #21#))
          (|lf| (|List| (|SparseUnivariatePolynomial| P))) (#24=#:G116 NIL)
          (|lfp| NIL) (#25=#:G117 NIL) (|auxfl| (|List| #11#))
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| (|SparseUnivariatePolynomial| P))
                      (|:| |pow| (|NonNegativeInteger|)))))
          (|f| NIL) (#26=#:G118 NIL) (#27=#:G98 (R)) (#28=#:G96 (R))
          (#29=#:G97 NIL) (|lcfacs| (R)) (|uum1| (R)) (#30=#:G100 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |um| (QREFELT % 14))
             (|INNMFACT;convertPUP|
              (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT % 15)) |ufactor| %)
              %))
            (#31='T
             (SEQ
              (LETT |lvar|
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT |cf| NIL)
                          (LETT #2# (SPADCALL |um| (QREFELT % 17))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |cf| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# (SPADCALL |cf| (QREFELT % 19)))
                             (COND
                              (#6#
                               (LETT #5# (SPADCALL #5# #3# (QREFELT % 20))))
                              ('T (PROGN (LETT #5# #3#) (LETT #6# 'T)))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                     (COND (#6# #5#) (#31# (|IdentityError| '|setUnion|)))))
              (EXIT
               (COND
                ((NULL |lvar|)
                 (SEQ (LETT |umv| (SPADCALL (ELT % 21) |um| (QREFELT % 25)))
                      (LETT |lfact| (SPADCALL |umv| |ufactor|))
                      (EXIT
                       (CONS
                        (SPADCALL (SPADCALL |lfact| (QREFELT % 27))
                                  (QREFELT % 28))
                        (PROGN
                         (LETT #7# NIL)
                         (SEQ (LETT |ff| NIL)
                              (LETT #8# (SPADCALL |lfact| (QREFELT % 32))) G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |ff| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #7#
                                      (CONS
                                       (CONS
                                        (SPADCALL (ELT % 33) (QVELT |ff| 1)
                                                  (QREFELT % 36))
                                        (QVELT |ff| 2))
                                       #7#))))
                              (LETT #8# (CDR #8#)) (GO G190) G191
                              (EXIT (NREVERSE #7#))))))))
                (#31#
                 (SEQ (LETT |flead| (CONS (|spadConstant| % 38) NIL))
                      (LETT |factorlist| NIL)
                      (LETT |mdeg| (SPADCALL |um| (QREFELT % 40)))
                      (COND
                       ((> |mdeg| 0)
                        (SEQ
                         (LETT |f1|
                               (SPADCALL (|spadConstant| % 42) |mdeg|
                                         (QREFELT % 43)))
                         (LETT |um|
                               (PROG2
                                   (LETT #9#
                                         (SPADCALL |um| |f1| (QREFELT % 45)))
                                   (QCDR #9#)
                                 (|check_union2| (QEQCAR #9# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 9))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 9))
                                                  "failed")
                                                 #9#)))
                         (LETT |factorlist|
                               (CONS
                                (CONS
                                 (SPADCALL (|spadConstant| % 42) 1
                                           (QREFELT % 43))
                                 |mdeg|)
                                |factorlist|))
                         (EXIT
                          (COND
                           ((EQL (SPADCALL |um| (QREFELT % 46)) 0)
                            (PROGN
                             (LETT #10#
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;convertPUP|
                                           (|INNMFACT;mFactor|
                                            (SPADCALL |um| (QREFELT % 15))
                                            |ufactor| %)
                                           %))
                                    (EXIT
                                     (CONS (QCAR |lfg|)
                                           (SPADCALL |factorlist| (QCDR |lfg|)
                                                     (QREFELT % 49))))))
                             (GO #32=#:G105))))))))
                      (LETT |uum| (SPADCALL |um| (QREFELT % 51)))
                      (LETT |um| (QVELT |uum| 1))
                      (LETT |sqfacs| (SPADCALL |um| (QREFELT % 54)))
                      (LETT |lcont|
                            (SPADCALL
                             (SPADCALL (QVELT |uum| 0)
                                       (SPADCALL |sqfacs| (QREFELT % 55))
                                       (QREFELT % 56))
                             (QREFELT % 15)))
                      (LETT |flead|
                            (|INNMFACT;convertPUP|
                             (|INNMFACT;mFactor| |lcont| |ufactor| %) %))
                      (LETT |factorlist|
                            (SPADCALL (QCDR |flead|) |factorlist|
                                      (QREFELT % 49)))
                      (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT % 59)))
                      (SEQ (LETT |fact| NIL) (LETT #14# |sqqfact|) G190
                           (COND
                            ((OR (ATOM #14#)
                                 (PROGN (LETT |fact| (CAR #14#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |ffactor| (QVELT |fact| 1))
                                (LETT |ffexp| (QVELT |fact| 2))
                                (EXIT
                                 (COND
                                  ((ZEROP (SPADCALL |ffactor| (QREFELT % 46)))
                                   (SEQ
                                    (LETT |lfg|
                                          (|INNMFACT;mFactor|
                                           (SPADCALL |ffactor| (QREFELT % 15))
                                           |ufactor| %))
                                    (LETT |lcont|
                                          (SPADCALL (QCAR |lfg|) |lcont|
                                                    (QREFELT % 60)))
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist|
                                                     (PROGN
                                                      (LETT #15# NIL)
                                                      (SEQ (LETT |lff| NIL)
                                                           (LETT #16#
                                                                 (QCDR |lfg|))
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #16#)
                                                                 (PROGN
                                                                  (LETT |lff|
                                                                        (CAR
                                                                         #16#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #15#
                                                                   (CONS
                                                                    (CONS
                                                                     (SPADCALL
                                                                      (QCAR
                                                                       |lff|)
                                                                      (QREFELT
                                                                       % 12))
                                                                     (*
                                                                      (QCDR
                                                                       |lff|)
                                                                      |ffexp|))
                                                                    #15#))))
                                                           (LETT #16#
                                                                 (CDR #16#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #15#))))
                                                     (QREFELT % 49))))))
                                  ('T
                                   (SEQ
                                    (LETT |coefs|
                                          (SPADCALL |ffactor| (QREFELT % 17)))
                                    (LETT |ldeg|
                                          (PROGN
                                           (LETT #17# NIL)
                                           (SEQ (LETT |xx| NIL)
                                                (LETT #18# |lvar|) G190
                                                (COND
                                                 ((OR (ATOM #18#)
                                                      (PROGN
                                                       (LETT |xx| (CAR #18#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #17#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #23# NIL)
                                                          (SEQ (LETT |fc| NIL)
                                                               (LETT #19#
                                                                     |coefs|)
                                                               G190
                                                               (COND
                                                                ((OR
                                                                  (ATOM #19#)
                                                                  (PROGN
                                                                   (LETT |fc|
                                                                         (CAR
                                                                          #19#))
                                                                   NIL))
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (PROGN
                                                                  (LETT #20#
                                                                        (SPADCALL
                                                                         |fc|
                                                                         |xx|
                                                                         (QREFELT
                                                                          %
                                                                          61)))
                                                                  (COND
                                                                   (#23#
                                                                    (LETT #22#
                                                                          (MAX
                                                                           #22#
                                                                           #20#)))
                                                                   ('T
                                                                    (PROGN
                                                                     (LETT #22#
                                                                           #20#)
                                                                     (LETT #23#
                                                                           'T)))))))
                                                               (LETT #19#
                                                                     (CDR
                                                                      #19#))
                                                               (GO G190) G191
                                                               (EXIT NIL))
                                                          (COND (#23# #22#)
                                                                ('T
                                                                 (|IdentityError|
                                                                  '|max|))))
                                                         #17#))))
                                                (LETT #18# (CDR #18#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #17#)))))
                                    (LETT |lf|
                                          (COND
                                           ((SPADCALL
                                             (SPADCALL |ffactor|
                                                       (QREFELT % 62))
                                             (QREFELT % 63))
                                            (|INNMFACT;mfconst| |ffactor|
                                             |lvar| |ldeg| |ufactor| %))
                                           ('T
                                            (|INNMFACT;mfpol| |ffactor| |lvar|
                                             |ldeg| |ufactor| %))))
                                    (LETT |auxfl|
                                          (PROGN
                                           (LETT #24# NIL)
                                           (SEQ (LETT |lfp| NIL)
                                                (LETT #25# |lf|) G190
                                                (COND
                                                 ((OR (ATOM #25#)
                                                      (PROGN
                                                       (LETT |lfp| (CAR #25#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #24#
                                                        (CONS
                                                         (CONS |lfp| |ffexp|)
                                                         #24#))))
                                                (LETT #25# (CDR #25#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #24#)))))
                                    (EXIT
                                     (LETT |factorlist|
                                           (SPADCALL |factorlist| |auxfl|
                                                     (QREFELT % 49)))))))))
                           (LETT #14# (CDR #14#)) (GO G190) G191 (EXIT NIL))
                      (LETT |lcfacs|
                            (PROGN
                             (LETT #29# NIL)
                             (SEQ (LETT |f| NIL) (LETT #26# |factorlist|) G190
                                  (COND
                                   ((OR (ATOM #26#)
                                        (PROGN (LETT |f| (CAR #26#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (PROGN
                                     (LETT #27#
                                           (SPADCALL
                                            (SPADCALL
                                             (SPADCALL (QCAR |f|)
                                                       (QREFELT % 62))
                                             (QREFELT % 64))
                                            (QCDR |f|) (QREFELT % 65)))
                                     (COND
                                      (#29#
                                       (LETT #28#
                                             (SPADCALL #28# #27#
                                                       (QREFELT % 66))))
                                      ('T
                                       (PROGN
                                        (LETT #28# #27#)
                                        (LETT #29# 'T)))))))
                                  (LETT #26# (CDR #26#)) (GO G190) G191
                                  (EXIT NIL))
                             (COND (#29# #28#) (#31# (|spadConstant| % 41)))))
                      (LETT |uum1|
                            (SPADCALL (SPADCALL (QVELT |uum| 0) (QREFELT % 67))
                                      (QREFELT % 68)))
                      (EXIT
                       (CONS
                        (SPADCALL |uum1|
                                  (PROG2
                                      (LETT #30#
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT % 62))
                                              (QREFELT % 64))
                                             |lcfacs| (QREFELT % 69)))
                                      (QCDR #30#)
                                    (|check_union2| (QEQCAR #30# 0)
                                                    (QREFELT % 8)
                                                    (|Union| (QREFELT % 8)
                                                             "failed")
                                                    #30#))
                                  (QREFELT % 66))
                        |factorlist|))))))))))
          #32# (EXIT #10#)))) 

(SDEFUN |INNMFACT;factor;SupMF;3|
        ((|um| (|SparseUnivariatePolynomial| P))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|Factored| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record|
                            (|:| |irr| (|SparseUnivariatePolynomial| P))
                            (|:| |pow| (|NonNegativeInteger|)))))))
          (|u| NIL) (#1=#:G127 NIL)
          (#2=#:G123 #3=(|Factored| (|SparseUnivariatePolynomial| P)))
          (#4=#:G121 #3#) (#5=#:G122 NIL))
         (SEQ (LETT |flist| (|INNMFACT;supFactor| |um| |ufactor| %))
              (EXIT
               (SPADCALL
                (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT % 33))
                          (QREFELT % 12))
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |u| NIL) (LETT #1# (QCDR |flist|)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2#
                               (SPADCALL (QCAR |u|) (QCDR |u|) (QREFELT % 70)))
                         (COND
                          (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 71))))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) ('T (|spadConstant| % 72))))
                (QREFELT % 73)))))) 

(SDEFUN |INNMFACT;varChoose|
        ((|m| (P)) (|lvar| (|List| OV))
         (|ldeg| (|List| #1=(|NonNegativeInteger|)))
         (%
          (|Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
                    (|:| |nvar| (|List| OV))
                    (|:| |newdeg| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|d| NIL) (#2=#:G135 NIL) (#3=#:G131 #1#) (#4=#:G129 #1#)
          (#5=#:G130 NIL) (|k| #1#) (|i| (|Integer|)) (|x| (OV)))
         (SEQ
          (LETT |k|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |d| NIL) (LETT #2# |ldeg|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |d| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #3# |d|)
                         (COND (#5# (LETT #4# (MIN #4# #3#)))
                               ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                      (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) (#6='T (|IdentityError| '|min|)))))
          (EXIT
           (COND
            ((EQL |k| (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT % 61)))
             (VECTOR (SPADCALL |m| (|SPADfirst| |lvar|) (QREFELT % 77)) |lvar|
                     |ldeg|))
            (#6#
             (SEQ (LETT |i| (SPADCALL |k| |ldeg| (QREFELT % 80)))
                  (LETT |x| (SPADCALL |lvar| |i| (QREFELT % 81)))
                  (LETT |ldeg| (CONS |k| (SPADCALL |ldeg| |i| (QREFELT % 82))))
                  (LETT |lvar| (CONS |x| (SPADCALL |lvar| |i| (QREFELT % 83))))
                  (EXIT
                   (VECTOR (SPADCALL |m| |x| (QREFELT % 77)) |lvar|
                           |ldeg|))))))))) 

(SDEFUN |INNMFACT;localNorm|
        ((|lum| (|List| (|SparseUnivariatePolynomial| R))) (% #1=(|Integer|)))
        (SPROG
         ((#2=#:G146 NIL) (#3=#:G138 #1#) (#4=#:G136 #1#) (#5=#:G137 NIL)
          (|ff| NIL) (#6=#:G147 NIL) (|i| NIL) (#7=#:G148 NIL) (|cc| (R))
          (#8=#:G144 #1#) (#9=#:G142 #1#) (#10=#:G143 NIL) (#11=#:G141 #1#)
          (#12=#:G139 #1#) (#13=#:G140 NIL))
         (SEQ
          (COND
           ((|domainEqual| (QREFELT % 8) (|AlgebraicNumber|))
            (PROGN
             (LETT #5# NIL)
             (SEQ (LETT |ff| NIL) (LETT #2# |lum|) G190
                  (COND
                   ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #3# (SPADCALL |ff| (QREFELT % 84)))
                     (COND (#5# (LETT #4# (MAX #4# #3#)))
                           ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                  (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
             (COND (#5# #4#) (#14='T (|IdentityError| '|max|)))))
           (#14#
            (PROGN
             (LETT #13# NIL)
             (SEQ (LETT |ff| NIL) (LETT #6# |lum|) G190
                  (COND
                   ((OR (ATOM #6#) (PROGN (LETT |ff| (CAR #6#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #11#
                           (PROGN
                            (LETT #10# NIL)
                            (SEQ (LETT |i| 0)
                                 (LETT #7# (SPADCALL |ff| (QREFELT % 85))) G190
                                 (COND ((|greater_SI| |i| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |cc|
                                            (SPADCALL |ff| |i| (QREFELT % 86)))
                                      (|spadConstant| % 38) (QREFELT % 87))
                                     (PROGN
                                      (LETT #8# (SPADCALL |cc| (QREFELT % 88)))
                                      (COND (#10# (LETT #9# (+ #9# #8#)))
                                            ('T
                                             (PROGN
                                              (LETT #9# #8#)
                                              (LETT #10# 'T)))))))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (COND (#10# #9#) ('T 0))))
                     (COND (#13# (LETT #12# (MAX #12# #11#)))
                           ('T (PROGN (LETT #12# #11#) (LETT #13# 'T)))))))
                  (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
             (COND (#13# #12#) (#14# (|IdentityError| '|max|))))))))) 

(SDEFUN |INNMFACT;intChoose|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|clc| (R)) (|plist| (|List| P)) (|ltry| (|List| (|List| R)))
         (|ufactor|
          (|Mapping| #1=(|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (%
          (|Union|
           (|Record| (|:| |inval| (|List| (|List| R)))
                     (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lu| R) (|:| |complead| (|List| R)))
           "failed")))
        (SPROG
         ((|degum| (|NonNegativeInteger|)) (|nvar1| (|NonNegativeInteger|))
          (|testp| (|Boolean|)) (#2=#:G202 NIL) (#3=#:G203 NIL) (|i| NIL)
          (#4=#:G204 NIL) (|lval| (|List| R)) (#5=#:G205 NIL) (|pol| NIL)
          (#6=#:G206 NIL) (|leadcomp1| #7=(|List| R)) (|epl| NIL)
          (#8=#:G207 NIL) (#9=#:G162 #10=(|Boolean|)) (#11=#:G160 #10#)
          (#12=#:G161 NIL) (#13=#:G167 NIL)
          (|newm| (|SparseUnivariatePolynomial| R))
          (|range| (|NonNegativeInteger|)) (|luniv| #1#)
          (|lunivf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|lffc1| (R)) (|nf| (|NonNegativeInteger|)) (#14=#:G208 NIL)
          (#15=#:G209 NIL) (#16=#:G210 NIL) (|ff| NIL) (#17=#:G211 NIL)
          (#18=#:G212 NIL) (#19=#:G213 NIL) (#20=#:G214 NIL) (#21=#:G215 NIL)
          (#22=#:G201 NIL) (#23=#:G216 NIL) (#24=#:G217 NIL)
          (|leadtest| (|Boolean|)) (#25=#:G218 NIL) (|uf| NIL) (#26=#:G219 NIL)
          (|unifact| (|List| (|SparseUnivariatePolynomial| R))) (|lffc| (R))
          (|leadcomp| #7#) (|int| #7#) (|nfatt| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |degum| (SPADCALL |um| (QREFELT % 46)))
                (LETT |nvar1| (LENGTH |lvar|)) (LETT |range| 5)
                (LETT |testp| (NULL (NULL |plist|)))
                (LETT |leadcomp| (LETT |leadcomp1| NIL))
                (LETT |nfatt| (+ |degum| 1))
                (LETT |lffc| (|spadConstant| % 41)) (LETT |lffc1| |lffc|)
                (LETT |leadtest| 'T) (LETT |int| NIL)
                (SEQ
                 (EXIT
                  (SEQ G190 (COND ((NULL 'T) (GO G191)))
                       (SEQ
                        (COND
                         (|testp|
                          (COND
                           ((> (LENGTH |ltry|) 10)
                            (EXIT
                             (PROGN
                              (LETT #2# (CONS 1 "failed"))
                              (GO #27=#:G200)))))))
                        (LETT |lval|
                              (PROGN
                               (LETT #3# NIL)
                               (SEQ (LETT |i| 1) (LETT #4# |nvar1|) G190
                                    (COND ((|greater_SI| |i| #4#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #3#
                                            (CONS
                                             (SPADCALL |range| (QREFELT % 90))
                                             #3#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #3#)))))
                        (EXIT
                         (COND
                          ((SPADCALL |lval| |ltry| (QREFELT % 93))
                           (LETT |range| (* 2 |range|)))
                          ('T
                           (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                (LETT |leadcomp1|
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |pol| NIL) (LETT #6# |plist|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |pol| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL
                                                      (SPADCALL |pol| |lvar|
                                                                |lval|
                                                                (QREFELT % 94))
                                                      (QREFELT % 68))
                                                     #5#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#)))))
                                (COND
                                 (|testp|
                                  (COND
                                   ((PROGN
                                     (LETT #12# NIL)
                                     (SEQ (LETT |epl| NIL)
                                          (LETT #8# |leadcomp1|) G190
                                          (COND
                                           ((OR (ATOM #8#)
                                                (PROGN
                                                 (LETT |epl| (CAR #8#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #9#
                                                   (SPADCALL |epl|
                                                             (QREFELT % 95)))
                                             (COND
                                              (#12#
                                               (LETT #11#
                                                     (COND (#11# 'T)
                                                           ('T #9#))))
                                              ('T
                                               (PROGN
                                                (LETT #11# #9#)
                                                (LETT #12# 'T)))))))
                                          (LETT #8# (CDR #8#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#12# #11#) ('T NIL)))
                                    (EXIT (LETT |range| (* 2 |range|)))))))
                                (LETT |newm|
                                      (SPADCALL |um| |lvar| |lval|
                                                (QREFELT % 96)))
                                (COND
                                 ((OR
                                   (SPADCALL |degum|
                                             (SPADCALL |newm| (QREFELT % 85))
                                             (QREFELT % 97))
                                   (SPADCALL (SPADCALL |newm| (QREFELT % 98)) 0
                                             (QREFELT % 97)))
                                  (EXIT (LETT |range| (* 2 |range|)))))
                                (LETT |lffc1| (SPADCALL |newm| (QREFELT % 99)))
                                (LETT |newm|
                                      (PROG2
                                          (LETT #13#
                                                (SPADCALL |newm| |lffc1|
                                                          (QREFELT % 100)))
                                          (QCDR #13#)
                                        (|check_union2| (QEQCAR #13# 0)
                                                        (|SparseUnivariatePolynomial|
                                                         (QREFELT % 8))
                                                        (|Union|
                                                         (|SparseUnivariatePolynomial|
                                                          (QREFELT % 8))
                                                         "failed")
                                                        #13#)))
                                (COND
                                 (|testp|
                                  (COND
                                   (|leadtest|
                                    (COND
                                     ((NULL
                                       (SPADCALL
                                        (SPADCALL |lffc1| |clc| (QREFELT % 66))
                                        (LENGTH |plist|) |leadcomp1|
                                        (QREFELT % 102)))
                                      (EXIT (LETT |range| (* 2 |range|)))))))))
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (SPADCALL
                                     (SPADCALL
                                      (LIST |newm|
                                            (SPADCALL |newm| (QREFELT % 103)))
                                      (QREFELT % 105))
                                     (QREFELT % 85))
                                    0 (QREFELT % 97))
                                   (LETT |range| (* 2 |range|)))
                                  ('T
                                   (SEQ
                                    (LETT |luniv| (SPADCALL |newm| |ufactor|))
                                    (LETT |lunivf|
                                          (SPADCALL |luniv| (QREFELT % 32)))
                                    (LETT |lffc1|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |luniv| (QREFELT % 27))
                                            (QREFELT % 28))
                                           |lffc1| (QREFELT % 66)))
                                    (LETT |nf| (LENGTH |lunivf|))
                                    (COND
                                     ((OR (EQL |nf| 0) (> |nf| |nfatt|))
                                      (EXIT "next values")))
                                    (COND
                                     ((EQL |nf| 1)
                                      (SEQ (LETT |unifact| (LIST |newm|))
                                           (EXIT
                                            (PROGN
                                             (LETT #22# |$NoValue|)
                                             (GO #28=#:G198))))))
                                    (EXIT
                                     (COND
                                      ((EQL |nfatt| |nf|)
                                       (SEQ
                                        (COND
                                         (|leadtest|
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #14# NIL)
                                                  (SEQ (LETT |uf| NIL)
                                                       (LETT #15# |lunivf|)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #15#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #15#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #14#
                                                               (CONS
                                                                (QVELT |uf| 1)
                                                                #14#))))
                                                       (LETT #15# (CDR #15#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #14#)))))
                                           (LETT |int| |lval|)
                                           (LETT |lffc| |lffc1|)
                                           (EXIT
                                            (COND
                                             (|testp|
                                              (LETT |leadcomp|
                                                    |leadcomp1|))))))
                                         ((> (|INNMFACT;localNorm| |unifact| %)
                                             (|INNMFACT;localNorm|
                                              (PROGN
                                               (LETT #16# NIL)
                                               (SEQ (LETT |ff| NIL)
                                                    (LETT #17# |lunivf|) G190
                                                    (COND
                                                     ((OR (ATOM #17#)
                                                          (PROGN
                                                           (LETT |ff|
                                                                 (CAR #17#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #16#
                                                            (CONS
                                                             (QVELT |ff| 1)
                                                             #16#))))
                                                    (LETT #17# (CDR #17#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #16#))))
                                              %))
                                          (COND
                                           (|testp|
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |lffc1| |clc|
                                                         (QREFELT % 66))
                                               (LENGTH |plist|) |leadcomp1|
                                               (QREFELT % 102))
                                              (SEQ
                                               (LETT |unifact|
                                                     (PROGN
                                                      (LETT #18# NIL)
                                                      (SEQ (LETT |uf| NIL)
                                                           (LETT #19# |lunivf|)
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #19#)
                                                                 (PROGN
                                                                  (LETT |uf|
                                                                        (CAR
                                                                         #19#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #18#
                                                                   (CONS
                                                                    (QVELT |uf|
                                                                           1)
                                                                    #18#))))
                                                           (LETT #19#
                                                                 (CDR #19#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #18#)))))
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
                                                    (LETT #20# NIL)
                                                    (SEQ (LETT |uf| NIL)
                                                         (LETT #21# |lunivf|)
                                                         G190
                                                         (COND
                                                          ((OR (ATOM #21#)
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
                                                                  (QVELT |uf|
                                                                         1)
                                                                  #20#))))
                                                         (LETT #21# (CDR #21#))
                                                         (GO G190) G191
                                                         (EXIT
                                                          (NREVERSE #20#)))))
                                             (LETT |int| |lval|)
                                             (LETT |lffc| |lffc1|)
                                             (EXIT
                                              (COND
                                               (|testp|
                                                (LETT |leadcomp|
                                                      |leadcomp1|)))))))))
                                        (EXIT
                                         (PROGN
                                          (LETT #22# |$NoValue|)
                                          (GO #28#)))))
                                      ((> |nfatt| |degum|)
                                       (SEQ
                                        (LETT |unifact|
                                              (PROGN
                                               (LETT #23# NIL)
                                               (SEQ (LETT |uf| NIL)
                                                    (LETT #24# |lunivf|) G190
                                                    (COND
                                                     ((OR (ATOM #24#)
                                                          (PROGN
                                                           (LETT |uf|
                                                                 (CAR #24#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #23#
                                                            (CONS
                                                             (QVELT |uf| 1)
                                                             #23#))))
                                                    (LETT #24# (CDR #24#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #23#)))))
                                        (LETT |lffc| |lffc1|)
                                        (COND
                                         (|testp|
                                          (LETT |leadcomp| |leadcomp1|)))
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
                                                  (SPADCALL |lffc| |clc|
                                                            (QREFELT % 66))
                                                  (LENGTH |plist|) |leadcomp|
                                                  (QREFELT % 102)))))
                                         ('T (LETT |leadtest| NIL)))
                                        (COND
                                         ((NULL |leadtest|)
                                          (SEQ
                                           (LETT |unifact|
                                                 (PROGN
                                                  (LETT #25# NIL)
                                                  (SEQ (LETT |uf| NIL)
                                                       (LETT #26# |lunivf|)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #26#)
                                                             (PROGN
                                                              (LETT |uf|
                                                                    (CAR #26#))
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #25#
                                                               (CONS
                                                                (QVELT |uf| 1)
                                                                #25#))))
                                                       (LETT #26# (CDR #26#))
                                                       (GO G190) G191
                                                       (EXIT
                                                        (NREVERSE #25#)))))
                                           (LETT |lffc| |lffc1|)
                                           (COND
                                            (|testp|
                                             (LETT |leadcomp| |leadcomp1|)))
                                           (EXIT (LETT |int| |lval|)))))
                                        (EXIT (LETT |nfatt| |nf|)))))))))))))))
                       NIL (GO G190) G191 (EXIT NIL)))
                 #28# (EXIT #22#))
                (EXIT
                 (CONS 0
                       (VECTOR (CONS |int| |ltry|) |unifact| |lffc|
                               |leadcomp|)))))
          #27# (EXIT #2#)))) 

(SDEFUN |INNMFACT;simplify|
        ((|m| (P)) (|lvar| (|List| OV))
         (|lmdeg| (|List| (|NonNegativeInteger|)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (%
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|x| NIL) (#1=#:G235 NIL) (|i| (|NonNegativeInteger|)) (|pol1| (P))
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))
          (#2=#:G227 NIL)
          (|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ (LETT |factorlist| NIL) (LETT |pol1| (|spadConstant| % 42))
              (SEQ (LETT |x| NIL) (LETT #1# |lvar|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |i|
                          (SPADCALL |lmdeg|
                                    (SPADCALL |x| |lvar| (QREFELT % 106))
                                    (QREFELT % 107)))
                    (EXIT
                     (COND ((EQL |i| 0) "next value")
                           ('T
                            (SEQ
                             (LETT |pol1|
                                   (SPADCALL |pol1|
                                             (SPADCALL (|spadConstant| % 42)
                                                       |x| |i| (QREFELT % 108))
                                             (QREFELT % 109)))
                             (EXIT
                              (LETT |factorlist|
                                    (CONS
                                     (CONS (SPADCALL |x| (QREFELT % 110)) |i|)
                                     |factorlist|))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |m|
                    (PROG2 (LETT #2# (SPADCALL |m| |pol1| (QREFELT % 111)))
                        (QCDR #2#)
                      (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                      (|Union| (QREFELT % 9) "failed") #2#)))
              (EXIT
               (COND
                ((SPADCALL |m| (QREFELT % 63))
                 (CONS (SPADCALL |m| (QREFELT % 68)) |factorlist|))
                ('T
                 (SEQ (LETT |flead| (|INNMFACT;mFactor| |m| |ufactor| %))
                      (PROGN
                       (RPLACD |flead|
                               (SPADCALL |factorlist| (QCDR |flead|)
                                         (QREFELT % 114)))
                       (QCDR |flead|))
                      (EXIT |flead|)))))))) 

(SDEFUN |INNMFACT;next_mod| ((|m| (|Integer|)) (% (|Integer|)))
        (SPROG ((#1=#:G240 NIL))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |m| (SPADCALL |m| (QREFELT % 116)))
                           (EXIT
                            (COND
                             ((EQL (REM (- |m| 3) 4) 0)
                              (PROGN (LETT #1# |m|) (GO #2=#:G239))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |INNMFACT;intfact1|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (|tleadpol|
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         (|ltry| (|List| (|List| R)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (|npmod| (|Integer|)) (% (|List| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|polcase| (|Boolean|)) (#1=#:G403 NIL) (#2=#:G404 NIL)
          (|leadpol| (|List| P))
          (|check|
           (|Union|
            (|Record| (|:| |inval| (|List| (|List| R)))
                      (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                      (|:| |lu| R) (|:| |complead| (|List| R)))
            #3="failed"))
          (#4=#:G151 NIL)
          (|vfchoo|
           (|Record| (|:| |inval| (|List| (|List| R)))
                     (|:| |unvfact| (|List| (|SparseUnivariatePolynomial| R)))
                     (|:| |lu| R) (|:| |complead| (|List| R))))
          (|nfact| (|NonNegativeInteger|)) (|lval| (|List| R))
          (|leadval| (|List| R))
          (|distf|
           (|Union|
            (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                      (|:| |corrfact|
                           (|List| (|SparseUnivariatePolynomial| R))))
            "failed"))
          (#5=#:G402 NIL)
          (|dist|
           (|Record| (|:| |polfac| (|List| P)) (|:| |correct| R)
                     (|:| |corrfact|
                          (|List| (|SparseUnivariatePolynomial| R)))))
          (|lpol| (|List| P)) (|dd| (R)) (#6=#:G405 NIL) (|unif| NIL)
          (#7=#:G406 NIL) (|unifact| (|List| (|SparseUnivariatePolynomial| R)))
          (#8=#:G385 NIL) (|umd| (|SparseUnivariatePolynomial| P))
          (|ffin| (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (#9=#:G407 NIL) (|ff| NIL) (#10=#:G408 NIL)
          (|factfin| (|List| (|SparseUnivariatePolynomial| P))))
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
                         (LETT |check|
                               (|INNMFACT;intChoose| |um| |lvar|
                                (QCAR |tleadpol|) |leadpol| |ltry| |ufactor|
                                %))
                         (EXIT
                          (COND
                           ((QEQCAR |check| 1)
                            (PROGN
                             (LETT #5#
                                   (|INNMFACT;monicMfpol| |um| |lvar| |ldeg|
                                    |ufactor| %))
                             (GO #11=#:G401)))
                           (#12='T (QCDR |check|))))))
                       (#12#
                        (PROG2
                            (LETT #4#
                                  (|INNMFACT;intChoose| |um| |lvar|
                                   (|spadConstant| % 41) NIL NIL |ufactor| %))
                            (QCDR #4#)
                          (|check_union2| (QEQCAR #4# 0)
                                          (|Record|
                                           (|:| |inval|
                                                (|List|
                                                 (|List| (QREFELT % 8))))
                                           (|:| |unvfact|
                                                (|List|
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 8))))
                                           (|:| |lu| (QREFELT % 8))
                                           (|:| |complead|
                                                (|List| (QREFELT % 8))))
                                          (|Union|
                                           (|Record|
                                            (|:| |inval|
                                                 (|List|
                                                  (|List| (QREFELT % 8))))
                                            (|:| |unvfact|
                                                 (|List|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 8))))
                                            (|:| |lu| (QREFELT % 8))
                                            (|:| |complead|
                                                 (|List| (QREFELT % 8))))
                                           #3#)
                                          #4#)))))
                (LETT |unifact| (QVELT |vfchoo| 1))
                (LETT |nfact| (LENGTH |unifact|))
                (EXIT
                 (COND ((EQL |nfact| 1) (LIST |um|))
                       (#12#
                        (SEQ (LETT |ltry| (QVELT |vfchoo| 0))
                             (LETT |lval| (|SPADfirst| |ltry|))
                             (LETT |dd| (QVELT |vfchoo| 2))
                             (LETT |leadval| NIL) (LETT |lpol| NIL)
                             (COND
                              (|polcase|
                               (SEQ (LETT |leadval| (QVELT |vfchoo| 3))
                                    (LETT |distf|
                                          (SPADCALL (QVELT |vfchoo| 2)
                                                    |unifact| |tleadpol|
                                                    |leadval| |lvar| |lval|
                                                    (QREFELT % 121)))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |distf| 1)
                                       (PROGN
                                        (LETT #5#
                                              (|INNMFACT;intfact1| |um| |lvar|
                                               |ldeg| |tleadpol| |ltry|
                                               |ufactor|
                                               (|INNMFACT;next_mod|
                                                (QREFELT % 10) %)
                                               %))
                                        (GO #11#)))
                                      (#12#
                                       (SEQ (LETT |dist| (QCDR |distf|))
                                            (LETT |lpol| (QVELT |dist| 0))
                                            (LETT |dd| (QVELT |dist| 1))
                                            (EXIT
                                             (LETT |unifact|
                                                   (QVELT |dist| 2))))))))))
                             (COND
                              ((SPADCALL |dd| (|spadConstant| % 41)
                                         (QREFELT % 87))
                               (SEQ
                                (LETT |unifact|
                                      (PROGN
                                       (LETT #6# NIL)
                                       (SEQ (LETT |unif| NIL)
                                            (LETT #7# |unifact|) G190
                                            (COND
                                             ((OR (ATOM #7#)
                                                  (PROGN
                                                   (LETT |unif| (CAR #7#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #6#
                                                    (CONS
                                                     (SPADCALL |dd| |unif|
                                                               (QREFELT % 122))
                                                     #6#))))
                                            (LETT #7# (CDR #7#)) (GO G190) G191
                                            (EXIT (NREVERSE #6#)))))
                                (EXIT
                                 (LETT |umd|
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |dd|
                                                   (PROG1
                                                       (LETT #8# (- |nfact| 1))
                                                     (|check_subtype2|
                                                      (>= #8# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #8#))
                                                   (QREFELT % 65))
                                         (QREFELT % 33))
                                        |um| (QREFELT % 123))))))
                              (#12# (LETT |umd| |um|)))
                             (LETT |ffin|
                                   (SPADCALL |umd| |lvar| |unifact| |lval|
                                             |lpol| |ldeg|
                                             (SPADCALL |npmod| (QREFELT % 124))
                                             (QREFELT % 127)))
                             (EXIT
                              (COND
                               ((QEQCAR |ffin| 1)
                                (|INNMFACT;intfact1| |um| |lvar| |ldeg|
                                 |tleadpol| |ltry| |ufactor|
                                 (|INNMFACT;next_mod| (QREFELT % 10) %) %))
                               (#12#
                                (SEQ (LETT |factfin| (QCDR |ffin|))
                                     (COND
                                      ((SPADCALL |dd| (|spadConstant| % 41)
                                                 (QREFELT % 87))
                                       (LETT |factfin|
                                             (PROGN
                                              (LETT #9# NIL)
                                              (SEQ (LETT |ff| NIL)
                                                   (LETT #10# |factfin|) G190
                                                   (COND
                                                    ((OR (ATOM #10#)
                                                         (PROGN
                                                          (LETT |ff|
                                                                (CAR #10#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #9#
                                                           (CONS
                                                            (SPADCALL |ff|
                                                                      (QREFELT
                                                                       % 128))
                                                            #9#))))
                                                   (LETT #10# (CDR #10#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #9#)))))))
                                     (EXIT |factfin|)))))))))))
          #11# (EXIT #5#)))) 

(SDEFUN |INNMFACT;intfact|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (|tleadpol|
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|)))))))
         (|ltry| (|List| (|List| R)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|List| (|SparseUnivariatePolynomial| P))))
        (|INNMFACT;intfact1| |um| |lvar| |ldeg| |tleadpol| |ltry| |ufactor|
         (QREFELT % 10) %)) 

(SDEFUN |INNMFACT;mfconst|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|List| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|lum|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G422 NIL) (|uf| NIL) (#2=#:G423 NIL))
         (SEQ
          (COND
           ((NULL |lvar|)
            (SEQ
             (LETT |lum|
                   (SPADCALL
                    (SPADCALL (SPADCALL (ELT % 21) |um| (QREFELT % 25))
                              |ufactor|)
                    (QREFELT % 32)))
             (EXIT
              (PROGN
               (LETT #1# NIL)
               (SEQ (LETT |uf| NIL) (LETT #2# |lum|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |uf| (CAR #2#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (LETT #1#
                            (CONS
                             (SPADCALL (ELT % 33) (QVELT |uf| 1)
                                       (QREFELT % 36))
                             #1#))))
                    (LETT #2# (CDR #2#)) (GO G190) G191
                    (EXIT (NREVERSE #1#)))))))
           ('T
            (|INNMFACT;intfact| |um| |lvar| |ldeg|
             (CONS (|spadConstant| % 38) NIL) NIL |ufactor| %)))))) 

(SDEFUN |INNMFACT;monicize|
        ((|um| (|SparseUnivariatePolynomial| P)) (|c| (P))
         (% (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((#1=#:G424 NIL) (|i| #2=(|NonNegativeInteger|)) (|lc| (P)) (|n| #2#)
          (#3=#:G427 NIL) (|prod| (P))
          (|ans| (|SparseUnivariatePolynomial| P)))
         (SEQ (LETT |n| (SPADCALL |um| (QREFELT % 46)))
              (LETT |ans| (SPADCALL (|spadConstant| % 42) |n| (QREFELT % 43)))
              (LETT |n|
                    (PROG1 (LETT #1# (- |n| 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |prod| (|spadConstant| % 42))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL (LETT |um| (SPADCALL |um| (QREFELT % 129)))
                                (|spadConstant| % 130) (QREFELT % 131)))
                     (GO G191)))
                   (SEQ (LETT |i| (SPADCALL |um| (QREFELT % 46)))
                        (LETT |lc| (SPADCALL |um| (QREFELT % 62)))
                        (LETT |prod|
                              (SPADCALL |prod|
                                        (SPADCALL |c|
                                                  (PROG1
                                                      (LETT #3#
                                                            (- |n|
                                                               (LETT |n| |i|)))
                                                    (|check_subtype2|
                                                     (>= #3# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #3#))
                                                  (QREFELT % 132))
                                        (QREFELT % 109)))
                        (EXIT
                         (LETT |ans|
                               (SPADCALL |ans|
                                         (SPADCALL
                                          (SPADCALL |prod| |lc|
                                                    (QREFELT % 109))
                                          |i| (QREFELT % 43))
                                         (QREFELT % 133)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |INNMFACT;unmonicize|
        ((|m| (|SparseUnivariatePolynomial| P)) (|c| (P))
         (% (|SparseUnivariatePolynomial| P)))
        (SPADCALL
         (SPADCALL |m| (SPADCALL |c| 1 (QREFELT % 43)) (QREFELT % 134))
         (QREFELT % 128))) 

(SDEFUN |INNMFACT;monicMfpol|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|List| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|l| (P)) (|monpol| (|SparseUnivariatePolynomial| P))
          (|nldeg| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |l| (SPADCALL |um| (QREFELT % 62)))
              (LETT |monpol| (|INNMFACT;monicize| |um| |l| %))
              (LETT |nldeg| (SPADCALL |monpol| |lvar| (QREFELT % 135)))
              (EXIT
               (SPADCALL (CONS #'|INNMFACT;monicMfpol!0| (VECTOR % |l|))
                         (|INNMFACT;mfconst| |monpol| |lvar| |nldeg| |ufactor|
                          %)
                         (QREFELT % 138)))))) 

(SDEFUN |INNMFACT;monicMfpol!0| ((|z1| NIL) ($$ NIL))
        (PROG (|l| %)
          (LETT |l| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|INNMFACT;unmonicize| |z1| |l| %))))) 

(SDEFUN |INNMFACT;mfpol|
        ((|um| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ldeg| (|List| (|NonNegativeInteger|)))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|List| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|tleadpol|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|))))))))
         (SEQ
          (COND
           ((|HasCategory| (QREFELT % 8) '(|Field|))
            (|INNMFACT;monicMfpol| |um| |lvar| |ldeg| |ufactor| %))
           ('T
            (SEQ
             (LETT |tleadpol|
                   (|INNMFACT;mFactor| (SPADCALL |um| (QREFELT % 62)) |ufactor|
                    %))
             (EXIT
              (|INNMFACT;intfact| |um| |lvar| |ldeg| |tleadpol| NIL |ufactor|
               %)))))))) 

(SDEFUN |INNMFACT;mFactor|
        ((|m| (P))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (%
          (|Record| (|:| |contp| R)
                    (|:| |factors|
                         (|List|
                          (|Record| (|:| |irr| P)
                                    (|:| |pow| (|NonNegativeInteger|))))))))
        (SPROG
         ((|lmdeg| (|List| (|NonNegativeInteger|))) (|n| NIL) (#1=#:G501 NIL)
          (#2=#:G446 #3=(|Boolean|)) (#4=#:G444 #3#) (#5=#:G445 NIL)
          (|sqfacs| (|Factored| P))
          (|flead|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           #6=(|Record| (|:| |irr| P)
                                        (|:| |pow| (|NonNegativeInteger|)))))))
          (|sqqfact|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| #7=(|NonNegativeInteger|)))))
          (|fact| NIL) (#8=#:G502 NIL) (|ffexp| #7#) (|lcont| (P))
          (#9=#:G459 NIL) (#10=#:G503 NIL)
          (|varch|
           (|Record| (|:| |npol| (|SparseUnivariatePolynomial| P))
                     (|:| |nvar| (|List| OV))
                     (|:| |newdeg| (|List| (|NonNegativeInteger|)))))
          (|x| (OV)) (|lvar| (|List| OV)) (|pc| (P)) (#11=#:G472 NIL)
          (|ffactor| (P)) (|lcterm| NIL) (#12=#:G504 NIL)
          (|ldeg| (|List| (|NonNegativeInteger|)))
          (|um| (|SparseUnivariatePolynomial| P))
          (|lf| (|List| (|SparseUnivariatePolynomial| P))) (#13=#:G505 NIL)
          (|lfp| NIL) (#14=#:G506 NIL) (|auxfl| (|List| #6#))
          (|factorlist|
           (|List|
            (|Record| (|:| |irr| P) (|:| |pow| (|NonNegativeInteger|)))))
          (|f| NIL) (#15=#:G507 NIL) (#16=#:G493 (R)) (#17=#:G491 (R))
          (#18=#:G492 NIL) (|lcfacs| (R)) (#19=#:G495 NIL))
         (SEQ
          (COND
           ((SPADCALL |m| (QREFELT % 63))
            (CONS (SPADCALL |m| (QREFELT % 68)) NIL))
           (#20='T
            (SEQ (LETT |lvar| (SPADCALL |m| (QREFELT % 19)))
                 (LETT |flead| (CONS (|spadConstant| % 38) NIL))
                 (LETT |factorlist| NIL)
                 (LETT |lmdeg| (SPADCALL |m| |lvar| (QREFELT % 139)))
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
                     (COND (#5# #4#) (#20# NIL)))
                    (|INNMFACT;simplify| |m| |lvar| |lmdeg| |ufactor| %))
                   (#20#
                    (SEQ (LETT |sqfacs| (SPADCALL |m| (QREFELT % 141)))
                         (LETT |lcont| (SPADCALL |sqfacs| (QREFELT % 143)))
                         (COND
                          ((SPADCALL |lcont| (QREFELT % 63))
                           (PROGN
                            (RPLACA |flead| (SPADCALL |lcont| (QREFELT % 68)))
                            (QCAR |flead|)))
                          (#20#
                           (LETT |flead|
                                 (|INNMFACT;mFactor| |lcont| |ufactor| %))))
                         (LETT |factorlist| (QCDR |flead|))
                         (LETT |sqqfact| (SPADCALL |sqfacs| (QREFELT % 146)))
                         (SEQ (LETT |fact| NIL) (LETT #8# |sqqfact|) G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |fact| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |ffactor| (QVELT |fact| 1))
                                   (LETT |ffexp| (QVELT |fact| 2))
                                   (LETT |lvar|
                                         (SPADCALL |ffactor| (QREFELT % 19)))
                                   (LETT |x| (|SPADfirst| |lvar|))
                                   (LETT |ldeg|
                                         (SPADCALL |ffactor| |lvar|
                                                   (QREFELT % 147)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL 1 |ldeg| (QREFELT % 149))
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
                                                         (QREFELT % 77))
                                               (QREFELT % 17))
                                              (QREFELT % 150)))
                                       (LETT |ffactor|
                                             (PROG2
                                                 (LETT #9#
                                                       (SPADCALL |ffactor|
                                                                 |lcont|
                                                                 (QREFELT %
                                                                          111)))
                                                 (QCDR #9#)
                                               (|check_union2| (QEQCAR #9# 0)
                                                               (QREFELT % 9)
                                                               (|Union|
                                                                (QREFELT % 9)
                                                                #21="failed")
                                                               #9#)))
                                       (LETT |factorlist|
                                             (CONS (CONS |ffactor| |ffexp|)
                                                   |factorlist|))
                                       (EXIT
                                        (SEQ (LETT |lcterm| NIL)
                                             (LETT #10#
                                                   (QCDR
                                                    (|INNMFACT;mFactor| |lcont|
                                                     |ufactor| %)))
                                             G190
                                             (COND
                                              ((OR (ATOM #10#)
                                                   (PROGN
                                                    (LETT |lcterm| (CAR #10#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT |factorlist|
                                                     (CONS
                                                      (CONS (QCAR |lcterm|)
                                                            (* (QCDR |lcterm|)
                                                               |ffexp|))
                                                      |factorlist|))))
                                             (LETT #10# (CDR #10#)) (GO G190)
                                             G191 (EXIT NIL)))))
                                     ('T
                                      (SEQ
                                       (LETT |varch|
                                             (|INNMFACT;varChoose| |ffactor|
                                              |lvar| |ldeg| %))
                                       (LETT |um| (QVELT |varch| 0))
                                       (LETT |x| (|SPADfirst| |lvar|))
                                       (LETT |ldeg| (CDR |ldeg|))
                                       (LETT |lvar| (CDR |lvar|))
                                       (COND
                                        ((SPADCALL
                                          (|SPADfirst| (QVELT |varch| 1)) |x|
                                          (QREFELT % 151))
                                         (SEQ (LETT |lvar| (QVELT |varch| 1))
                                              (LETT |x| (|SPADfirst| |lvar|))
                                              (EXIT
                                               (LETT |lvar| (CDR |lvar|))))))
                                       (LETT |pc|
                                             (SPADCALL
                                              (SPADCALL |um| (QREFELT % 17))
                                              (QREFELT % 150)))
                                       (COND
                                        ((SPADCALL |pc| (|spadConstant| % 42)
                                                   (QREFELT % 152))
                                         (SEQ
                                          (LETT |um|
                                                (PROG2
                                                    (LETT #11#
                                                          (SPADCALL |um| |pc|
                                                                    (QREFELT %
                                                                             153)))
                                                    (QCDR #11#)
                                                  (|check_union2|
                                                   (QEQCAR #11# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT % 9))
                                                    "failed")
                                                   #11#)))
                                          (LETT |ffactor|
                                                (SPADCALL |um| |x|
                                                          (QREFELT % 154)))
                                          (EXIT
                                           (SEQ (LETT |lcterm| NIL)
                                                (LETT #12#
                                                      (QCDR
                                                       (|INNMFACT;mFactor| |pc|
                                                        |ufactor| %)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #12#)
                                                      (PROGN
                                                       (LETT |lcterm|
                                                             (CAR #12#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT |factorlist|
                                                        (CONS
                                                         (CONS (QCAR |lcterm|)
                                                               (*
                                                                (QCDR |lcterm|)
                                                                |ffexp|))
                                                         |factorlist|))))
                                                (LETT #12# (CDR #12#))
                                                (GO G190) G191 (EXIT NIL))))))
                                       (LETT |ldeg|
                                             (SPADCALL |ffactor| |lvar|
                                                       (QREFELT % 147)))
                                       (LETT |um|
                                             (SPADCALL |um| (QREFELT % 155)))
                                       (COND
                                        ((SPADCALL
                                          (SPADCALL |um| (QREFELT % 62))
                                          (QREFELT % 63))
                                         (LETT |lf|
                                               (|INNMFACT;mfconst| |um| |lvar|
                                                |ldeg| |ufactor| %)))
                                        ('T
                                         (LETT |lf|
                                               (|INNMFACT;mfpol| |um| |lvar|
                                                |ldeg| |ufactor| %))))
                                       (LETT |auxfl|
                                             (PROGN
                                              (LETT #13# NIL)
                                              (SEQ (LETT |lfp| NIL)
                                                   (LETT #14# |lf|) G190
                                                   (COND
                                                    ((OR (ATOM #14#)
                                                         (PROGN
                                                          (LETT |lfp|
                                                                (CAR #14#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #13#
                                                           (CONS
                                                            (CONS
                                                             (SPADCALL
                                                              (SPADCALL |lfp|
                                                                        |x|
                                                                        (QREFELT
                                                                         %
                                                                         154))
                                                              (QREFELT % 156))
                                                             |ffexp|)
                                                            #13#))))
                                                   (LETT #14# (CDR #14#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #13#)))))
                                       (EXIT
                                        (LETT |factorlist|
                                              (SPADCALL |factorlist| |auxfl|
                                                        (QREFELT % 114)))))))))
                              (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                         (LETT |lcfacs|
                               (PROGN
                                (LETT #18# NIL)
                                (SEQ (LETT |f| NIL) (LETT #15# |factorlist|)
                                     G190
                                     (COND
                                      ((OR (ATOM #15#)
                                           (PROGN (LETT |f| (CAR #15#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #16#
                                              (SPADCALL
                                               (SPADCALL (QCAR |f|)
                                                         (QREFELT % 64))
                                               (QCDR |f|) (QREFELT % 65)))
                                        (COND
                                         (#18#
                                          (LETT #17#
                                                (SPADCALL #17# #16#
                                                          (QREFELT % 66))))
                                         ('T
                                          (PROGN
                                           (LETT #17# #16#)
                                           (LETT #18# 'T)))))))
                                     (LETT #15# (CDR #15#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#18# #17#)
                                      (#20# (|spadConstant| % 41)))))
                         (EXIT
                          (CONS
                           (PROG2
                               (LETT #19#
                                     (SPADCALL (SPADCALL |m| (QREFELT % 64))
                                               |lcfacs| (QREFELT % 69)))
                               (QCDR #19#)
                             (|check_union2| (QEQCAR #19# 0) (QREFELT % 8)
                                             (|Union| (QREFELT % 8) #21#)
                                             #19#))
                           |factorlist|)))))))))))) 

(SDEFUN |INNMFACT;factor;PMF;17|
        ((|m| (P))
         (|ufactor|
          (|Mapping| (|Factored| (|SparseUnivariatePolynomial| R))
                     (|SparseUnivariatePolynomial| R)))
         (% (|Factored| P)))
        (SPROG
         ((|flist|
           (|Record| (|:| |contp| R)
                     (|:| |factors|
                          (|List|
                           (|Record| (|:| |irr| P)
                                     (|:| |pow| (|NonNegativeInteger|)))))))
          (|u| NIL) (#1=#:G515 NIL) (#2=#:G512 #3=(|Factored| P))
          (#4=#:G510 #3#) (#5=#:G511 NIL))
         (SEQ (LETT |flist| (|INNMFACT;mFactor| |m| |ufactor| %))
              (EXIT
               (SPADCALL (SPADCALL (QCAR |flist|) (QREFELT % 33))
                         (PROGN
                          (LETT #5# NIL)
                          (SEQ (LETT |u| NIL) (LETT #1# (QCDR |flist|)) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |u| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (PROGN
                                  (LETT #2#
                                        (SPADCALL (QCAR |u|) (QCDR |u|)
                                                  (QREFELT % 157)))
                                  (COND
                                   (#5#
                                    (LETT #4#
                                          (SPADCALL #4# #2# (QREFELT % 158))))
                                   ('T
                                    (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                          (COND (#5# #4#) ('T (|spadConstant| % 159))))
                         (QREFELT % 160)))))) 

(DECLAIM (NOTINLINE |InnerMultFact;|)) 

(DEFUN |InnerMultFact;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|InnerMultFact| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 162))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|InnerMultFact| (LIST DV$1 DV$2 DV$3 DV$4)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 8388619)
    %))) 

(DEFUN |InnerMultFact| (&REST #1=#:G516)
  (SPROG NIL
         (PROG (#2=#:G517)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerMultFact|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InnerMultFact;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|InnerMultFact|)))))))))) 

(MAKEPROP '|InnerMultFact| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|pmod|
              (|SparseUnivariatePolynomial| 9) (0 . |coerce|) (|Boolean|)
              (5 . |ground?|) (10 . |ground|) (|List| 9) (15 . |coefficients|)
              (|List| 6) (20 . |variables|) (25 . |setUnion|) (31 . |ground|)
              (|SparseUnivariatePolynomial| 8) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 11 8 22) (36 . |map|)
              (|Factored| 22) (42 . |unit|) (47 . |retract|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 29) (|:| |factor| 22) (|:| |exponent| 39))
              (|List| 30) (52 . |factorList|) (57 . |coerce|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 22 9 11) (62 . |map|)
              (68 . |0|) (72 . |0|) (|NonNegativeInteger|)
              (76 . |minimumDegree|) (81 . |1|) (85 . |1|) (89 . |monomial|)
              (|Union| % '"failed") (95 . |exquo|) (101 . |degree|)
              (|Record| (|:| |irr| 11) (|:| |pow| 39)) (|List| 47)
              (106 . |append|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (112 . |unitNormal|) (|Factored| 11)
              (|MultivariateSquareFree| 7 6 8 9) (117 . |squareFree|)
              (122 . |unit|) (127 . *)
              (|Record| (|:| |flag| 29) (|:| |factor| 11) (|:| |exponent| 39))
              (|List| 57) (133 . |factorList|) (138 . *) (144 . |degree|)
              (150 . |leadingCoefficient|) (155 . |ground?|)
              (160 . |leadingCoefficient|) (165 . ^) (171 . *)
              (177 . |retract|) (182 . |retract|) (187 . |exquo|)
              (193 . |primeFactor|) (199 . *) (205 . |1|) (209 . *)
              (|Mapping| 26 22) |INNMFACT;factor;SupMF;3|
              (|SparseUnivariatePolynomial| %) (215 . |univariate|) (|Integer|)
              (|List| 39) (221 . |position|) (227 . |elt|) (233 . |delete|)
              (239 . |delete|) (245 . |numberOfMonomials|) (250 . |degree|)
              (255 . |coefficient|) (261 . ~=) (267 . |euclideanSize|)
              (|FactoringUtilities| 7 6 8 9) (272 . |ran|) (|List| 8)
              (|List| 91) (277 . |member?|) (283 . |eval|) (290 . |unit?|)
              (295 . |completeEval|) (302 . ~=) (308 . |minimumDegree|)
              (313 . |content|) (318 . |exquo|)
              (|LeadingCoefDetermination| 6 7 8 9) (324 . |polCase|)
              (331 . |differentiate|) (|List| %) (336 . |gcd|)
              (341 . |position|) (347 . |elt|) (353 . |monomial|) (360 . *)
              (366 . |coerce|) (371 . |exquo|)
              (|Record| (|:| |irr| 9) (|:| |pow| 39)) (|List| 112)
              (377 . |append|) (|IntegerPrimesPackage| 78) (383 . |nextPrime|)
              (|Record| (|:| |polfac| 16) (|:| |correct| 8)
                        (|:| |corrfact| 119))
              (|Union| 117 '"failed") (|List| 22)
              (|Record| (|:| |contp| 8) (|:| |factors| 113)) (388 . |distFact|)
              (398 . *) (404 . *) (410 . |coerce|) (|Union| 137 '"failed")
              (|MultivariateLifting| 7 6 8 9) (415 . |lifting|)
              (426 . |primitivePart|) (431 . |reductum|) (436 . |0|) (440 . ~=)
              (446 . ^) (452 . +) (458 . |elt|) (464 . |degree|)
              (|Mapping| 11 11) (|List| 11) (470 . |map|)
              (476 . |minimumDegree|) (|Factored| %) (482 . |squareFree|)
              (|Factored| 9) (487 . |unit|)
              (|Record| (|:| |flag| 29) (|:| |factor| 9) (|:| |exponent| 39))
              (|List| 144) (492 . |factorList|) (497 . |degree|) (503 . |1|)
              (507 . |member?|) (513 . |gcd|) (518 . ~=) (524 . ~=)
              (530 . |exquo|) (536 . |multivariate|) (542 . |unitCanonical|)
              (547 . |unitCanonical|) (552 . |primeFactor|) (558 . *)
              (564 . |1|) (568 . *) |INNMFACT;factor;PMF;17|)
           '#(|factor| 574) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|factor|
                                 ((|Factored| |#4|) |#4|
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial| |#3|))
                                   (|SparseUnivariatePolynomial| |#3|))))
                                T)
                              '((|factor|
                                 ((|Factored|
                                   (|SparseUnivariatePolynomial| |#4|))
                                  (|SparseUnivariatePolynomial| |#4|)
                                  (|Mapping|
                                   (|Factored|
                                    (|SparseUnivariatePolynomial| |#3|))
                                   (|SparseUnivariatePolynomial| |#3|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 161
                                            '(1 11 0 9 12 1 11 13 0 14 1 11 9 0
                                              15 1 11 16 0 17 1 9 18 0 19 2 18
                                              0 0 0 20 1 9 8 0 21 2 24 22 23 11
                                              25 1 26 22 0 27 1 22 8 0 28 1 26
                                              31 0 32 1 9 0 8 33 2 35 11 34 22
                                              36 0 7 0 37 0 8 0 38 1 11 39 0 40
                                              0 8 0 41 0 9 0 42 2 11 0 9 39 43
                                              2 11 44 0 0 45 1 11 39 0 46 2 48
                                              0 0 0 49 1 11 50 0 51 1 53 52 11
                                              54 1 52 11 0 55 2 11 0 0 0 56 1
                                              52 58 0 59 2 9 0 8 0 60 2 9 39 0
                                              6 61 1 11 9 0 62 1 9 13 0 63 1 9
                                              8 0 64 2 8 0 0 39 65 2 8 0 0 0 66
                                              1 11 9 0 67 1 9 8 0 68 2 8 44 0 0
                                              69 2 52 0 11 39 70 2 52 0 0 0 71
                                              0 52 0 72 2 52 0 11 0 73 2 9 76 0
                                              6 77 2 79 78 39 0 80 2 18 6 0 78
                                              81 2 79 0 0 78 82 2 18 0 0 78 83
                                              1 22 39 0 84 1 22 39 0 85 2 22 8
                                              0 39 86 2 8 13 0 0 87 1 8 39 0 88
                                              1 89 8 78 90 2 92 13 91 0 93 3 9
                                              0 0 18 91 94 1 8 13 0 95 3 89 22
                                              11 18 91 96 2 39 13 0 0 97 1 22
                                              39 0 98 1 22 8 0 99 2 22 44 0 8
                                              100 3 101 13 8 39 91 102 1 22 0 0
                                              103 1 22 0 104 105 2 18 78 6 0
                                              106 2 79 39 0 78 107 3 9 0 0 6 39
                                              108 2 9 0 0 0 109 1 9 0 6 110 2 9
                                              44 0 0 111 2 113 0 0 0 114 1 115
                                              78 78 116 6 101 118 8 119 120 91
                                              18 91 121 2 22 0 8 0 122 2 11 0 9
                                              0 123 1 8 0 78 124 7 126 125 11
                                              18 119 91 16 79 8 127 1 11 0 0
                                              128 1 11 0 0 129 0 11 0 130 2 11
                                              13 0 0 131 2 9 0 0 39 132 2 11 0
                                              0 0 133 2 11 0 0 0 134 2 89 79 11
                                              18 135 2 137 0 136 0 138 2 9 79 0
                                              18 139 1 9 140 0 141 1 142 9 0
                                              143 1 142 145 0 146 2 9 79 0 18
                                              147 0 11 0 148 2 79 13 39 0 149 1
                                              9 0 104 150 2 6 13 0 0 151 2 9 13
                                              0 0 152 2 11 44 0 9 153 2 9 0 76
                                              6 154 1 11 0 0 155 1 9 0 0 156 2
                                              142 0 9 39 157 2 142 0 0 0 158 0
                                              142 0 159 2 142 0 9 0 160 2 0 142
                                              9 74 161 2 0 52 11 74 75)))))
           '|lookupComplete|)) 
