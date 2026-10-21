
(SDEFUN |MULTSQFR;next_mod| ((|m| (|Integer|)) (% (|Integer|)))
        (SPROG ((#1=#:G26 NIL))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |m| (SPADCALL |m| (QREFELT % 13)))
                           (EXIT
                            (COND
                             ((EQL (REM (- |m| 3) 4) 0)
                              (PROGN (LETT #1# |m|) (GO #2=#:G25))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(SDEFUN |MULTSQFR;nsqfree1|
        ((|oldf| #1=(|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ltry| (|List| (|List| R))) (|npmod| (|Integer|))
         (%
          (|Record| (|:| |unitPart| P)
                    (|:| |suPart|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| P))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (SPROG
         ((|univPol|
           (|Record| (|:| |upol| #2=(|SparseUnivariatePolynomial| R))
                     (|:| |Lval| #3=(|List| R))
                     (|:| |Lfact|
                          #4=(|List|
                              (|Record|
                               (|:| |factor| (|SparseUnivariatePolynomial| R))
                               (|:| |exponent| (|NonNegativeInteger|)))))
                     (|:| |ctpol| R)))
          (|lval| #3#) (|ctf| (R)) (|lcf| (P)) (|leadpol| (|Boolean|))
          (|sqlc| (|Factored| P))
          (|pfact|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|#G11| #5=(|SparseUnivariatePolynomial| R))
          (|#G12| (|NonNegativeInteger|)) (|exp0| (|NonNegativeInteger|))
          (|lfact| #4#) (#6=#:G53 NIL)
          (|gg|
           (|Record| (|:| |unit| P) (|:| |canonical| P) (|:| |associate| P)))
          (|g0| #5#)
          (|npol|
           (|Record| (|:| |pol| #7=(|SparseUnivariatePolynomial| P))
                     (|:| |polval| #8=(|SparseUnivariatePolynomial| R))))
          (|#G13| #7#) (|#G14| #8#) (|d| #7#) (|d0| #8#) (|lcoef| (P))
          (|ldeg| (|List| (|NonNegativeInteger|))) (#9=#:G62 NIL)
          (|result|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|result0| (|SparseUnivariatePolynomial| P))
          (|r1| (|SparseUnivariatePolynomial| P))
          (|h| (|Union| (|SparseUnivariatePolynomial| P) #10="failed"))
          (#11=#:G94 NIL)
          (|sqdec|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|f| #1#) (|f0| #2#) (|lpfact| NIL) (#12=#:G95 NIL) (|unitsq| (P))
          (|h1| (|Union| P #13="failed")) (#14=#:G77 NIL) (|hh1| (P))
          (#15=#:G93 NIL) (|lcr| (P)) (|nff| (P))
          (|nsqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#16=#:G79 NIL)
          (|sqlead|
           (|List|
            (|Record| (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#17=#:G73 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |f| |oldf|)
                (LETT |univPol| (SPADCALL |f| |lvar| |ltry| (QREFELT % 19)))
                (LETT |f0| (QVELT |univPol| 0))
                (EXIT
                 (COND
                  ((SPADCALL |f0| (|spadConstant| % 21) (QREFELT % 23))
                   (CONS (|spadConstant| % 24) (LIST (CONS |f| 1))))
                  ('T
                   (SEQ (LETT |lfact| (QVELT |univPol| 2))
                        (LETT |lval| (QVELT |univPol| 1))
                        (LETT |ctf| (QVELT |univPol| 3)) (LETT |leadpol| NIL)
                        (LETT |sqdec| NIL) (LETT |exp0| 0)
                        (LETT |unitsq| (|spadConstant| % 24))
                        (LETT |lcf| (SPADCALL |f| (QREFELT % 26)))
                        (COND
                         ((SPADCALL |ctf| (|spadConstant| % 25) (QREFELT % 27))
                          (SEQ (LETT |f0| (SPADCALL |ctf| |f0| (QREFELT % 28)))
                               (LETT |f|
                                     (SPADCALL (SPADCALL |ctf| (QREFELT % 29))
                                               |f| (QREFELT % 30)))
                               (EXIT
                                (LETT |lcf|
                                      (SPADCALL |ctf| |lcf|
                                                (QREFELT % 31)))))))
                        (LETT |sqlead| NIL) (LETT |sqlc| (|spadConstant| % 33))
                        (COND
                         ((SPADCALL |lcf| (|spadConstant| % 24) (QREFELT % 34))
                          (SEQ (LETT |leadpol| 'T)
                               (LETT |sqlc| (SPADCALL |lcf| (QREFELT % 35)))
                               (LETT |unitsq|
                                     (SPADCALL |unitsq|
                                               (SPADCALL |sqlc| (QREFELT % 36))
                                               (QREFELT % 37)))
                               (EXIT
                                (LETT |sqlead|
                                      (SPADCALL |sqlc| (QREFELT % 40)))))))
                        (LETT |lfact|
                              (SPADCALL (CONS #'|MULTSQFR;nsqfree1!0| %)
                                        |lfact| (QREFELT % 45)))
                        (SEQ G190
                             (COND
                              ((NULL (SPADCALL |lfact| NIL (QREFELT % 46)))
                               (GO G191)))
                             (SEQ (LETT |pfact| (|SPADfirst| |lfact|))
                                  (PROGN
                                   (LETT |#G11| (QCAR |pfact|))
                                   (LETT |#G12| (QCDR |pfact|))
                                   (LETT |g0| |#G11|)
                                   (LETT |exp0| |#G12|))
                                  (LETT |lfact| (CDR |lfact|))
                                  (COND
                                   ((SPADCALL |lfact| NIL (QREFELT % 47))
                                    (COND
                                     ((EQL |exp0| 1)
                                      (EXIT
                                       (SEQ
                                        (LETT |f|
                                              (PROG2
                                                  (LETT #6#
                                                        (SPADCALL |f|
                                                                  (SPADCALL
                                                                   |ctf|
                                                                   (QREFELT %
                                                                            29))
                                                                  (QREFELT %
                                                                           49)))
                                                  (QCDR #6#)
                                                (|check_union2| (QEQCAR #6# 0)
                                                                (|SparseUnivariatePolynomial|
                                                                 (QREFELT % 9))
                                                                (|Union|
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT %
                                                                           9))
                                                                 "failed")
                                                                #6#)))
                                        (LETT |gg|
                                              (SPADCALL
                                               (SPADCALL |f| (QREFELT % 26))
                                               (QREFELT % 51)))
                                        (LETT |sqdec|
                                              (CONS
                                               (CONS
                                                (SPADCALL (QVELT |gg| 2) |f|
                                                          (QREFELT % 30))
                                                |exp0|)
                                               |sqdec|))
                                        (EXIT
                                         (PROGN
                                          (LETT #11#
                                                (CONS (QVELT |gg| 0) |sqdec|))
                                          (GO #18=#:G92)))))))))
                                  (COND
                                   ((SPADCALL |ctf| (|spadConstant| % 25)
                                              (QREFELT % 27))
                                    (LETT |g0|
                                          (SPADCALL |ctf| |g0|
                                                    (QREFELT % 28)))))
                                  (LETT |npol|
                                        (SPADCALL |f| |f0| |exp0|
                                                  (QREFELT % 53)))
                                  (PROGN
                                   (LETT |#G13| (QCAR |npol|))
                                   (LETT |#G14| (QCDR |npol|))
                                   (LETT |d| |#G13|)
                                   (LETT |d0| |#G14|))
                                  (COND
                                   (|leadpol|
                                    (LETT |lcoef|
                                          (SPADCALL |exp0| |unitsq| |sqlead|
                                                    (QREFELT % 54))))
                                   ('T (LETT |lcoef| (|spadConstant| % 24))))
                                  (LETT |ldeg|
                                        (SPADCALL |f| |lvar| |exp0|
                                                  (QREFELT % 56)))
                                  (LETT |result|
                                        (SPADCALL |d| |g0|
                                                  (PROG2
                                                      (LETT #9#
                                                            (SPADCALL |d0| |g0|
                                                                      (QREFELT
                                                                       % 57)))
                                                      (QCDR #9#)
                                                    (|check_union2|
                                                     (QEQCAR #9# 0)
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT % 8))
                                                     (|Union|
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT % 8))
                                                      #10#)
                                                     #9#))
                                                  |lcoef| |lvar| |ldeg| |lval|
                                                  (SPADCALL |npmod|
                                                            (QREFELT % 58))
                                                  (QREFELT % 61)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |result| 1)
                                     (PROGN
                                      (LETT #11#
                                            (|MULTSQFR;nsqfree1| |oldf| |lvar|
                                             |ltry|
                                             (|MULTSQFR;next_mod| |npmod| %)
                                             %))
                                      (GO #18#)))
                                    ('T
                                     (SEQ
                                      (LETT |result0|
                                            (SPADCALL (QCDR |result|) 1
                                                      (QREFELT % 63)))
                                      (LETT |r1|
                                            (SPADCALL |result0| |exp0|
                                                      (QREFELT % 64)))
                                      (SEQ
                                       (LETT |h|
                                             (SPADCALL |f| |r1|
                                                       (QREFELT % 65)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |h| 1)
                                          (PROGN
                                           (LETT #11#
                                                 (|MULTSQFR;nsqfree1| |oldf|
                                                  |lvar| NIL
                                                  (|MULTSQFR;next_mod| |npmod|
                                                   %)
                                                  %))
                                           (GO #18#))))))
                                      (LETT |sqdec|
                                            (CONS (CONS |result0| |exp0|)
                                                  |sqdec|))
                                      (LETT |f| (QCDR |h|))
                                      (LETT |f0|
                                            (SPADCALL (QCDR |h|) |lvar| |lval|
                                                      (QREFELT % 67)))
                                      (LETT |lcr|
                                            (SPADCALL |result0|
                                                      (QREFELT % 26)))
                                      (LETT |nsqlead| |sqlead|)
                                      (SEQ (LETT |lpfact| NIL)
                                           (LETT #12# |sqlead|) G190
                                           (COND
                                            ((OR (ATOM #12#)
                                                 (PROGN
                                                  (LETT |lpfact| (CAR #12#))
                                                  NIL)
                                                 (NULL
                                                  (SPADCALL |lcr|
                                                            (|spadConstant| %
                                                                            24)
                                                            (QREFELT % 34))))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((SPADCALL |lcr| (QREFELT % 68))
                                               (SEQ
                                                (LETT |unitsq|
                                                      (PROG2
                                                          (LETT #17#
                                                                (SPADCALL
                                                                 |unitsq| |lcr|
                                                                 (QREFELT %
                                                                          69)))
                                                          (QCDR #17#)
                                                        (|check_union2|
                                                         (QEQCAR #17# 0)
                                                         (QREFELT % 9)
                                                         (|Union| (QREFELT % 9)
                                                                  #13#)
                                                         #17#)))
                                                (EXIT
                                                 (LETT |lcr|
                                                       (|spadConstant| %
                                                                       24)))))
                                              ('T
                                               (SEQ
                                                (EXIT
                                                 (SEQ G190 NIL
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((< (QCDR |lpfact|)
                                                             |exp0|)
                                                          (PROGN
                                                           (LETT #15# 1)
                                                           (GO #19=#:G84)))
                                                         ('T
                                                          (SEQ
                                                           (LETT |h1|
                                                                 (SPADCALL
                                                                  |lcr|
                                                                  (QCAR
                                                                   |lpfact|)
                                                                  (QREFELT %
                                                                           69)))
                                                           (EXIT
                                                            (COND
                                                             ((QEQCAR |h1| 0)
                                                              (SEQ
                                                               (LETT |lcr|
                                                                     (QCDR
                                                                      |h1|))
                                                               (EXIT
                                                                (PROGN
                                                                 (RPLACD
                                                                  |lpfact|
                                                                  (PROG1
                                                                      (LETT
                                                                       #14#
                                                                       (-
                                                                        (QCDR
                                                                         |lpfact|)
                                                                        |exp0|))
                                                                    (|check_subtype2|
                                                                     (>= #14#
                                                                         0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #14#)))
                                                                 (QCDR
                                                                  |lpfact|)))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |hh1|
                                                                     (SPADCALL
                                                                      |lcr|
                                                                      (QCAR
                                                                       |lpfact|)
                                                                      (QREFELT
                                                                       % 70)))
                                                               (EXIT
                                                                (COND
                                                                 ((SPADCALL
                                                                   |hh1|
                                                                   (|spadConstant|
                                                                    % 24)
                                                                   (QREFELT %
                                                                            71))
                                                                  (PROGN
                                                                   (LETT #15#
                                                                         1)
                                                                   (GO #19#)))
                                                                 ('T
                                                                  (SEQ
                                                                   (LETT |lcr|
                                                                         (PROG2
                                                                             (LETT
                                                                              #17#
                                                                              (SPADCALL
                                                                               |lcr|
                                                                               |hh1|
                                                                               (QREFELT
                                                                                %
                                                                                69)))
                                                                             (QCDR
                                                                              #17#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #17#
                                                                             0)
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             #13#)
                                                                            #17#)))
                                                                   (LETT |nff|
                                                                         (PROG2
                                                                             (LETT
                                                                              #17#
                                                                              (SPADCALL
                                                                               (QCAR
                                                                                |lpfact|)
                                                                               |hh1|
                                                                               (QREFELT
                                                                                %
                                                                                69)))
                                                                             (QCDR
                                                                              #17#)
                                                                           (|check_union2|
                                                                            (QEQCAR
                                                                             #17#
                                                                             0)
                                                                            (QREFELT
                                                                             %
                                                                             9)
                                                                            (|Union|
                                                                             (QREFELT
                                                                              %
                                                                              9)
                                                                             #13#)
                                                                            #17#)))
                                                                   (LETT
                                                                    |nsqlead|
                                                                    (CONS
                                                                     (CONS
                                                                      |nff|
                                                                      (QCDR
                                                                       |lpfact|))
                                                                     |nsqlead|))
                                                                   (PROGN
                                                                    (RPLACA
                                                                     |lpfact|
                                                                     |hh1|)
                                                                    (QCAR
                                                                     |lpfact|))
                                                                   (EXIT
                                                                    (PROGN
                                                                     (RPLACD
                                                                      |lpfact|
                                                                      (PROG1
                                                                          (LETT
                                                                           #16#
                                                                           (-
                                                                            (QCDR
                                                                             |lpfact|)
                                                                            |exp0|))
                                                                        (|check_subtype2|
                                                                         (>=
                                                                          #16#
                                                                          0)
                                                                         '(|NonNegativeInteger|)
                                                                         '(|Integer|)
                                                                         #16#)))
                                                                     (QCDR
                                                                      |lpfact|))))))))))))))))
                                                      NIL (GO G190) G191
                                                      (EXIT NIL)))
                                                #19# (EXIT #15#))))))
                                           (LETT #12# (CDR #12#)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT (LETT |sqlead| |nsqlead|)))))))
                             NIL (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (CONS
                          (PROG2
                              (LETT #17#
                                    (SPADCALL (SPADCALL |f| (QREFELT % 74))
                                              |ctf| (QREFELT % 75)))
                              (QCDR #17#)
                            (|check_union2| (QEQCAR #17# 0) (QREFELT % 9)
                                            (|Union| (QREFELT % 9) #13#) #17#))
                          |sqdec|))))))))
          #18# (EXIT #11#)))) 

(SDEFUN |MULTSQFR;nsqfree1!0| ((|z1| NIL) (|z2| NIL) (% NIL))
        (SPADCALL (QCDR |z1|) (QCDR |z2|) (QREFELT % 42))) 

(SDEFUN |MULTSQFR;nsqfree;SupLLR;3|
        ((|oldf| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ltry| (|List| (|List| R)))
         (%
          (|Record| (|:| |unitPart| P)
                    (|:| |suPart|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| P))
                           (|:| |exponent| (|NonNegativeInteger|))))))))
        (|MULTSQFR;nsqfree1| |oldf| |lvar| |ltry| (QREFELT % 10) %)) 

(SDEFUN |MULTSQFR;squareFree;SupF;4|
        ((|f| (|SparseUnivariatePolynomial| P))
         (% (|Factored| (|SparseUnivariatePolynomial| P))))
        (SPROG
         ((|fu| #1=(|Factored| P)) (#2=#:G144 NIL) (#3=#:G145 NIL) (|cf| NIL)
          (#4=#:G146 NIL) (#5=#:G120 #6=(|List| OV)) (#7=#:G118 #6#)
          (#8=#:G119 NIL) (|lvar| #6#)
          (|upol| (|SparseUnivariatePolynomial| R))
          (|usqfr| (|Factored| (|SparseUnivariatePolynomial| R)))
          (#9=#:G147 NIL) (#10=#:G148 NIL) (|lcf| (P)) (#11=#:G133 NIL)
          (|lcSq| #1#) (#12=#:G149 NIL) (|ff| NIL) (#13=#:G150 NIL)
          (|partSq|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#14=#:G151 NIL) (#15=#:G152 NIL)
          (|lfs|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| (|SparseUnivariatePolynomial| P))
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND
           ((EQL (SPADCALL |f| (QREFELT % 79)) 0)
            (SEQ
             (LETT |fu|
                   (SPADCALL (SPADCALL |f| (QREFELT % 74)) (QREFELT % 35)))
             (EXIT
              (SPADCALL
               (SPADCALL (SPADCALL |fu| (QREFELT % 36)) (QREFELT % 80))
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |ff| NIL) (LETT #3# (SPADCALL |fu| (QREFELT % 84)))
                     G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |ff| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2#
                             (CONS
                              (VECTOR (CONS 1 "sqfr")
                                      (SPADCALL (QVELT |ff| 1) (QREFELT % 80))
                                      (QVELT |ff| 2))
                              #2#))))
                     (LETT #3# (CDR #3#)) (GO G190) G191
                     (EXIT (NREVERSE #2#))))
               (QREFELT % 88)))))
           (#16='T
            (SEQ
             (LETT |lvar|
                   (PROGN
                    (LETT #8# NIL)
                    (SEQ (LETT |cf| NIL)
                         (LETT #4# (SPADCALL |f| (QREFELT % 90))) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |cf| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (PROGN
                            (LETT #5# (SPADCALL |cf| (QREFELT % 91)))
                            (COND
                             (#8# (LETT #7# (SPADCALL #7# #5# (QREFELT % 92))))
                             ('T (PROGN (LETT #7# #5#) (LETT #8# 'T)))))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (COND (#8# #7#) (#16# (|IdentityError| '|setUnion|)))))
             (EXIT
              (COND
               ((NULL |lvar|)
                (SEQ (LETT |upol| (SPADCALL (ELT % 93) |f| (QREFELT % 96)))
                     (LETT |usqfr| (SPADCALL |upol| (QREFELT % 98)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL (ELT % 29) (SPADCALL |usqfr| (QREFELT % 100))
                                 (QREFELT % 103))
                       (PROGN
                        (LETT #9# NIL)
                        (SEQ (LETT |ff| NIL)
                             (LETT #10# (SPADCALL |usqfr| (QREFELT % 106)))
                             G190
                             (COND
                              ((OR (ATOM #10#)
                                   (PROGN (LETT |ff| (CAR #10#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #9#
                                     (CONS
                                      (VECTOR (CONS 1 "sqfr")
                                              (SPADCALL (ELT % 29)
                                                        (QVELT |ff| 1)
                                                        (QREFELT % 103))
                                              (QVELT |ff| 2))
                                      #9#))))
                             (LETT #10# (CDR #10#)) (GO G190) G191
                             (EXIT (NREVERSE #9#))))
                       (QREFELT % 88)))))
               (#16#
                (SEQ (LETT |lcf| (SPADCALL |f| (QREFELT % 107)))
                     (LETT |f|
                           (PROG2
                               (LETT #11# (SPADCALL |f| |lcf| (QREFELT % 49)))
                               (QCDR #11#)
                             (|check_union2| (QEQCAR #11# 0)
                                             (|SparseUnivariatePolynomial|
                                              (QREFELT % 9))
                                             (|Union|
                                              (|SparseUnivariatePolynomial|
                                               (QREFELT % 9))
                                              "failed")
                                             #11#)))
                     (LETT |lcSq| (SPADCALL |lcf| (QREFELT % 35)))
                     (LETT |lfs|
                           (PROGN
                            (LETT #12# NIL)
                            (SEQ (LETT |ff| NIL)
                                 (LETT #13# (SPADCALL |lcSq| (QREFELT % 84)))
                                 G190
                                 (COND
                                  ((OR (ATOM #13#)
                                       (PROGN (LETT |ff| (CAR #13#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #12#
                                         (CONS
                                          (VECTOR (CONS 1 "sqfr")
                                                  (SPADCALL (QVELT |ff| 1)
                                                            (QREFELT % 80))
                                                  (QVELT |ff| 2))
                                          #12#))))
                                 (LETT #13# (CDR #13#)) (GO G190) G191
                                 (EXIT (NREVERSE #12#)))))
                     (LETT |partSq| (SPADCALL |f| |lvar| NIL (QREFELT % 78)))
                     (LETT |lfs|
                           (SPADCALL
                            (PROGN
                             (LETT #14# NIL)
                             (SEQ (LETT #15# (QCDR |partSq|)) G190
                                  (COND
                                   ((OR (ATOM #15#)
                                        (PROGN (LETT |fu| (CAR #15#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #14#
                                          (CONS
                                           (VECTOR (CONS 1 "sqfr") (QCAR |fu|)
                                                   (QCDR |fu|))
                                           #14#))))
                                  (LETT #15# (CDR #15#)) (GO G190) G191
                                  (EXIT (NREVERSE #14#))))
                            |lfs| (QREFELT % 108)))
                     (EXIT
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |lcSq| (QREFELT % 36))
                                  (QCAR |partSq|) (QREFELT % 37))
                        (QREFELT % 80))
                       |lfs| (QREFELT % 88))))))))))))) 

(SDEFUN |MULTSQFR;squareFree;PF;5| ((|f| (P)) (% (|Factored| P)))
        (SPROG
         ((|lmdeg| (|List| (|NonNegativeInteger|))) (|im| NIL) (#1=#:G187 NIL)
          (|n| (|NonNegativeInteger|)) (|y| (OV)) (|p| (P)) (#2=#:G164 NIL)
          (#3=#:G186 NIL) (|result| (|Factored| P))
          (|ldeg| (|List| #4=(|NonNegativeInteger|))) (#5=#:G188 NIL)
          (#6=#:G172 #4#) (#7=#:G170 #4#) (#8=#:G171 NIL) (|m| #4#) (|j| NIL)
          (#9=#:G189 NIL) (|i| (|Integer|)) (|x| (OV)) (|lvar| (|List| OV))
          (|f0| (|SparseUnivariatePolynomial| P)) (|lcont| (P))
          (#10=#:G176 NIL)
          (|nsqfftot|
           (|Record| (|:| |unitPart| P)
                     (|:| |suPart|
                          (|List|
                           (|Record|
                            (|:| |factor| (|SparseUnivariatePolynomial| P))
                            (|:| |exponent| (|NonNegativeInteger|)))))))
          (#11=#:G190 NIL) (|fu| NIL) (#12=#:G191 NIL)
          (|nsqff|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|result1|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| P)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|sqlead| (|Factored| P)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| (QREFELT % 68)) (SPADCALL |f| NIL (QREFELT % 110)))
            (#13='T
             (SEQ (LETT |lvar| (SPADCALL |f| (QREFELT % 91)))
                  (LETT |result1| NIL)
                  (LETT |lmdeg| (SPADCALL |f| |lvar| (QREFELT % 111)))
                  (LETT |p| (|spadConstant| % 24))
                  (SEQ (LETT |im| 1) (LETT #1# (LENGTH |lvar|)) G190
                       (COND ((|greater_SI| |im| #1#) (GO G191)))
                       (SEQ (LETT |n| (SPADCALL |lmdeg| |im| (QREFELT % 112)))
                            (EXIT
                             (COND ((EQL |n| 0) "next im")
                                   ('T
                                    (SEQ
                                     (LETT |y|
                                           (SPADCALL |lvar| |im|
                                                     (QREFELT % 115)))
                                     (LETT |p|
                                           (SPADCALL |p|
                                                     (SPADCALL
                                                      (|spadConstant| % 24) |y|
                                                      |n| (QREFELT % 116))
                                                     (QREFELT % 37)))
                                     (EXIT
                                      (LETT |result1|
                                            (CONS
                                             (VECTOR (CONS 1 "sqfr")
                                                     (SPADCALL |y|
                                                               (QREFELT % 117))
                                                     |n|)
                                             |result1|))))))))
                       (LETT |im| (|inc_SI| |im|)) (GO G190) G191 (EXIT NIL))
                  (COND
                   ((SPADCALL |p| (|spadConstant| % 24) (QREFELT % 34))
                    (SEQ
                     (LETT |f|
                           (PROG2 (LETT #2# (SPADCALL |f| |p| (QREFELT % 69)))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0) (QREFELT % 9)
                                             (|Union| (QREFELT % 9) "failed")
                                             #2#)))
                     (COND
                      ((SPADCALL |f| (QREFELT % 68))
                       (PROGN
                        (LETT #3# (SPADCALL |f| |result1| (QREFELT % 110)))
                        (GO #14=#:G185))))
                     (EXIT (LETT |lvar| (SPADCALL |f| (QREFELT % 91)))))))
                  (EXIT
                   (COND
                    ((EQL (LENGTH |lvar|) 1)
                     (SEQ
                      (LETT |result|
                            (SPADCALL |f| (|SPADfirst| |lvar|)
                                      (QREFELT % 118)))
                      (EXIT
                       (SPADCALL (SPADCALL |result| (QREFELT % 36))
                                 (SPADCALL |result1|
                                           (SPADCALL |result| (QREFELT % 84))
                                           (QREFELT % 119))
                                 (QREFELT % 110)))))
                    (#13#
                     (SEQ (LETT |ldeg| (SPADCALL |f| |lvar| (QREFELT % 120)))
                          (LETT |m|
                                (PROGN
                                 (LETT #8# NIL)
                                 (SEQ (LETT |j| NIL) (LETT #5# |ldeg|) G190
                                      (COND
                                       ((OR (ATOM #5#)
                                            (PROGN (LETT |j| (CAR #5#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL |j| 0 (QREFELT % 121))
                                          (PROGN
                                           (LETT #6# |j|)
                                           (COND (#8# (LETT #7# (MIN #7# #6#)))
                                                 ('T
                                                  (PROGN
                                                   (LETT #7# #6#)
                                                   (LETT #8# 'T)))))))))
                                      (LETT #5# (CDR #5#)) (GO G190) G191
                                      (EXIT NIL))
                                 (COND (#8# #7#)
                                       (#13# (|IdentityError| '|min|)))))
                          (LETT |i| 1)
                          (SEQ (LETT |j| NIL) (LETT #9# |ldeg|) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |j| (CAR #9#)) NIL)
                                     (NULL (> |j| |m|)))
                                 (GO G191)))
                               (SEQ (EXIT (LETT |i| (+ |i| 1))))
                               (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                          (LETT |x| (SPADCALL |lvar| |i| (QREFELT % 115)))
                          (LETT |lvar| (SPADCALL |lvar| |i| (QREFELT % 122)))
                          (LETT |f0| (SPADCALL |f| |x| (QREFELT % 124)))
                          (LETT |lcont| (SPADCALL |f0| (QREFELT % 107)))
                          (LETT |nsqfftot|
                                (SPADCALL
                                 (PROG2
                                     (LETT #10#
                                           (SPADCALL |f0| |lcont|
                                                     (QREFELT % 49)))
                                     (QCDR #10#)
                                   (|check_union2| (QEQCAR #10# 0)
                                                   (|SparseUnivariatePolynomial|
                                                    (QREFELT % 9))
                                                   (|Union|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT % 9))
                                                    "failed")
                                                   #10#))
                                 |lvar| NIL (QREFELT % 78)))
                          (LETT |nsqff|
                                (PROGN
                                 (LETT #11# NIL)
                                 (SEQ (LETT |fu| NIL)
                                      (LETT #12# (QCDR |nsqfftot|)) G190
                                      (COND
                                       ((OR (ATOM #12#)
                                            (PROGN (LETT |fu| (CAR #12#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11#
                                              (CONS
                                               (VECTOR (CONS 1 "sqfr")
                                                       (SPADCALL (QCAR |fu|)
                                                                 |x|
                                                                 (QREFELT %
                                                                          125))
                                                       (QCDR |fu|))
                                               #11#))))
                                      (LETT #12# (CDR #12#)) (GO G190) G191
                                      (EXIT (NREVERSE #11#)))))
                          (LETT |result1|
                                (SPADCALL |result1| |nsqff| (QREFELT % 119)))
                          (EXIT
                           (COND
                            ((SPADCALL |lcont| (QREFELT % 68))
                             (SPADCALL
                              (SPADCALL |lcont| (QCAR |nsqfftot|)
                                        (QREFELT % 37))
                              |result1| (QREFELT % 110)))
                            (#13#
                             (SEQ
                              (LETT |sqlead| (SPADCALL |lcont| (QREFELT % 35)))
                              (EXIT
                               (SPADCALL
                                (SPADCALL (SPADCALL |sqlead| (QREFELT % 36))
                                          (QCAR |nsqfftot|) (QREFELT % 37))
                                (SPADCALL |result1|
                                          (SPADCALL |sqlead| (QREFELT % 84))
                                          (QREFELT % 119))
                                (QREFELT % 110)))))))))))))))
          #14# (EXIT #3#)))) 

(SDEFUN |MULTSQFR;intChoose;SupLLR;6|
        ((|f| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|ltry| (|List| (|List| R)))
         (%
          (|Record| (|:| |upol| (|SparseUnivariatePolynomial| R))
                    (|:| |Lval| (|List| R))
                    (|:| |Lfact|
                         (|List|
                          (|Record|
                           (|:| |factor| (|SparseUnivariatePolynomial| R))
                           (|:| |exponent| (|NonNegativeInteger|)))))
                    (|:| |ctpol| R))))
        (SPROG
         ((|degf| (|NonNegativeInteger|)) (|nvr| (|NonNegativeInteger|))
          (|range| (|Integer|)) (#1=#:G212 NIL) (|i| NIL) (#2=#:G213 NIL)
          (|lval| (|List| R)) (|f0| (|SparseUnivariatePolynomial| R))
          (|ctf| (R)) (#3=#:G198 NIL)
          (|lfact|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|d0| #4=(|Integer|)) (#5=#:G211 NIL)
          (|try_n| (|NonNegativeInteger|))
          (|f1| (|SparseUnivariatePolynomial| R))
          (|lfact1|
           (|List|
            (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (|ctf1| (R)) (|lval1| (|List| R)) (|d1| #4#))
         (SEQ
          (EXIT
           (SEQ (LETT |degf| (SPADCALL |f| (QREFELT % 79))) (LETT |try_n| 0)
                (LETT |nvr| (LENGTH |lvar|)) (LETT |range| 10)
                (LETT |lfact1| NIL) (LETT |lval1| NIL)
                (LETT |ctf1| (|spadConstant| % 25))
                (LETT |f1| (|spadConstant| % 21))
                (EXIT
                 (SEQ G190 (COND ((NULL (< |range| 10000000000)) (GO G191)))
                      (SEQ (LETT |range| (* 2 |range|))
                           (LETT |lval|
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |i| 1) (LETT #2# |nvr|) G190
                                       (COND
                                        ((|greater_SI| |i| #2#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS
                                                (SPADCALL |range|
                                                          (QREFELT % 126))
                                                #1#))))
                                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                       (EXIT (NREVERSE #1#)))))
                           (EXIT
                            (COND
                             ((SPADCALL |lval| |ltry| (QREFELT % 127))
                              "new integer")
                             ('T
                              (SEQ (LETT |ltry| (CONS |lval| |ltry|))
                                   (LETT |f0|
                                         (SPADCALL |f| |lvar| |lval|
                                                   (QREFELT % 67)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (SPADCALL |f0| (QREFELT % 128))
                                                |degf| (QREFELT % 121))
                                      "new integer")
                                     ('T
                                      (SEQ
                                       (LETT |ctf|
                                             (SPADCALL |f0| (QREFELT % 129)))
                                       (LETT |lfact|
                                             (SPADCALL
                                              (SPADCALL
                                               (PROG2
                                                   (LETT #3#
                                                         (SPADCALL |f0|
                                                                   (SPADCALL
                                                                    |ctf|
                                                                    (QREFELT %
                                                                             130))
                                                                   (QREFELT %
                                                                            57)))
                                                   (QCDR #3#)
                                                 (|check_union2| (QEQCAR #3# 0)
                                                                 (|SparseUnivariatePolynomial|
                                                                  (QREFELT %
                                                                           8))
                                                                 (|Union|
                                                                  (|SparseUnivariatePolynomial|
                                                                   (QREFELT %
                                                                            8))
                                                                  "failed")
                                                                 #3#))
                                               (QREFELT % 98))
                                              (QREFELT % 131)))
                                       (COND
                                        ((EQL (LENGTH |lfact|) 1)
                                         (COND
                                          ((EQL
                                            (QCDR
                                             (SPADCALL |lfact| 1
                                                       (QREFELT % 132)))
                                            1)
                                           (PROGN
                                            (LETT #5#
                                                  (VECTOR (|spadConstant| % 21)
                                                          |lval| |lfact|
                                                          (|spadConstant| %
                                                                          25)))
                                            (GO #6=#:G210))))))
                                       (LETT |d0|
                                             (SPADCALL |lfact|
                                                       (QREFELT % 133)))
                                       (EXIT
                                        (COND
                                         ((EQL |try_n| 0)
                                          (SEQ (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (LETT |d1| |d0|)
                                               (EXIT (LETT |try_n| 1))))
                                         ((EQL |d0| |d1|)
                                          (PROGN
                                           (LETT #5#
                                                 (VECTOR |f1| |lval1| |lfact1|
                                                         |ctf1|))
                                           (GO #6#)))
                                         ((< |d0| |d1|)
                                          (SEQ (LETT |try_n| 1)
                                               (LETT |f1| |f0|)
                                               (LETT |lfact1| |lfact|)
                                               (LETT |ctf1| |ctf|)
                                               (LETT |lval1| |lval|)
                                               (EXIT
                                                (LETT |d1| |d0|)))))))))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #6# (EXIT #5#)))) 

(SDEFUN |MULTSQFR;coefChoose;IPLP;7|
        ((|exp| (|Integer|)) (|unitsq| (P))
         (|sqlead|
          (|List|
           (|Record| (|:| |factor| P)
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (% (P)))
        (SPROG
         ((|term| NIL) (#1=#:G222 NIL) (|texp| (|NonNegativeInteger|))
          (#2=#:G217 NIL) (|lcoef| (P)))
         (SEQ (LETT |lcoef| |unitsq|)
              (SEQ (LETT |term| NIL) (LETT #1# |sqlead|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |texp| (QCDR |term|))
                        (EXIT
                         (COND ((< |texp| |exp|) "next term")
                               ((EQL |texp| |exp|)
                                (LETT |lcoef|
                                      (SPADCALL |lcoef| (QCAR |term|)
                                                (QREFELT % 37))))
                               ('T
                                (LETT |lcoef|
                                      (SPADCALL |lcoef|
                                                (SPADCALL (QCAR |term|)
                                                          (PROG1
                                                              (LETT #2#
                                                                    (|quotient_INT|
                                                                     |texp|
                                                                     |exp|))
                                                            (|check_subtype2|
                                                             (>= #2# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|) #2#))
                                                          (QREFELT % 134))
                                                (QREFELT % 37)))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |lcoef|)))) 

(SDEFUN |MULTSQFR;consnewpol;SupSupIR;8|
        ((|g| (|SparseUnivariatePolynomial| P))
         (|g0| (|SparseUnivariatePolynomial| R)) (|deg| (|Integer|))
         (%
          (|Record| (|:| |pol| (|SparseUnivariatePolynomial| P))
                    (|:| |polval| (|SparseUnivariatePolynomial| R)))))
        (SEQ
         (COND ((EQL |deg| 1) (CONS |g| |g0|))
               ('T
                (SEQ (LETT |deg| (- |deg| 1))
                     (EXIT
                      (CONS (SPADCALL |g| |deg| (QREFELT % 135))
                            (SPADCALL |g0| |deg| (QREFELT % 136))))))))) 

(SDEFUN |MULTSQFR;lift;Sup2SupPLLLRU;9|
        ((|ud| (|SparseUnivariatePolynomial| P))
         (|g0| (|SparseUnivariatePolynomial| R))
         (|g1| (|SparseUnivariatePolynomial| R)) (|lcoef| (P))
         (|lvar| (|List| OV)) (|ldeg| (|List| (|NonNegativeInteger|)))
         (|lval| (|List| R)) (|npmod| (R))
         (% (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed")))
        (SPROG
         ((|lcd| (P)) (|lcg0| (R)) (#1=#:G230 NIL) (|leadlist| (|List| P))
          (|plist|
           (|Union| (|List| (|SparseUnivariatePolynomial| P)) "failed"))
          (|#G63| #2=(|SparseUnivariatePolynomial| P)) (|#G64| #2#)
          (|#G65| #2#) (|#G66| #2#) (|p0| #2#) (|p1| #2#))
         (SEQ (LETT |lcd| (SPADCALL |ud| (QREFELT % 26))) (LETT |leadlist| NIL)
              (COND
               ((NULL (SPADCALL (SPADCALL |ud| (QREFELT % 26)) (QREFELT % 68)))
                (SEQ (LETT |ud| (SPADCALL |lcoef| |ud| (QREFELT % 30)))
                     (LETT |lcg0| (SPADCALL |g0| (QREFELT % 137)))
                     (COND
                      ((SPADCALL |lcoef| (QREFELT % 68))
                       (LETT |g0|
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL |lcoef| (QREFELT % 138))
                                         |lcg0| (QREFELT % 139)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                                (|Union| (QREFELT % 8)
                                                         #3="failed")
                                                #1#))
                              |g0| (QREFELT % 28))))
                      (#4='T
                       (LETT |g0|
                             (SPADCALL
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |lcoef| |lvar| |lval|
                                                    (QREFELT % 140))
                                          (QREFELT % 138))
                                         |lcg0| (QREFELT % 139)))
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                                (|Union| (QREFELT % 8) #3#)
                                                #1#))
                              |g0| (QREFELT % 28)))))
                     (LETT |g1| (SPADCALL |lcg0| |g1| (QREFELT % 28)))
                     (EXIT (LETT |leadlist| (LIST |lcoef| |lcd|))))))
              (LETT |plist|
                    (SPADCALL |ud| |lvar| (LIST |g0| |g1|) |lval| |leadlist|
                              |ldeg| |npmod| (QREFELT % 143)))
              (EXIT
               (COND ((QEQCAR |plist| 1) (CONS 1 "failed"))
                     (#4#
                      (SEQ
                       (PROGN
                        (LETT |#G63|
                              (SPADCALL (QCDR |plist|) 1 (QREFELT % 63)))
                        (LETT |#G64|
                              (SPADCALL (QCDR |plist|) 2 (QREFELT % 63)))
                        (LETT |p0| |#G63|)
                        (LETT |p1| |#G64|))
                       (COND
                        ((SPADCALL (SPADCALL |p0| |lvar| |lval| (QREFELT % 67))
                                   |g0| (QREFELT % 144))
                         (PROGN
                          (LETT |#G65| |p1|)
                          (LETT |#G66| |p0|)
                          (LETT |p0| |#G65|)
                          (LETT |p1| |#G66|))))
                       (EXIT
                        (CONS 0
                              (LIST (SPADCALL |p0| (QREFELT % 145))
                                    (SPADCALL |p1| (QREFELT % 145)))))))))))) 

(SDEFUN |MULTSQFR;univcase;POVF;10| ((|f| (P)) (|x| (OV)) (% (|Factored| P)))
        (SPROG
         ((|cf| (R)) (#1=#:G244 NIL) (|uf| (|SparseUnivariatePolynomial| R))
          (|result| (|Factored| (|SparseUnivariatePolynomial| R)))
          (#2=#:G257 NIL) (|term| NIL) (#3=#:G258 NIL))
         (SEQ (LETT |uf| (SPADCALL |f| (QREFELT % 146)))
              (LETT |cf| (SPADCALL |uf| (QREFELT % 129)))
              (LETT |uf|
                    (PROG2 (LETT #1# (SPADCALL |uf| |cf| (QREFELT % 147)))
                        (QCDR #1#)
                      (|check_union2| (QEQCAR #1# 0)
                                      (|SparseUnivariatePolynomial|
                                       (QREFELT % 8))
                                      (|Union|
                                       (|SparseUnivariatePolynomial|
                                        (QREFELT % 8))
                                       "failed")
                                      #1#)))
              (LETT |result| (SPADCALL |uf| (QREFELT % 98)))
              (EXIT
               (SPADCALL
                (SPADCALL
                 (SPADCALL |cf| (SPADCALL |result| (QREFELT % 100))
                           (QREFELT % 28))
                 |x| (QREFELT % 148))
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |term| NIL)
                      (LETT #3# (SPADCALL |result| (QREFELT % 106))) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (VECTOR (CONS 1 "sqfr")
                                       (SPADCALL (QVELT |term| 1) |x|
                                                 (QREFELT % 148))
                                       (QVELT |term| 2))
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT % 110)))))) 

(SDEFUN |MULTSQFR;compdegd;LI;11|
        ((|lfact|
          (|List|
           (|Record| (|:| |factor| (|SparseUnivariatePolynomial| R))
                     (|:| |exponent| (|NonNegativeInteger|)))))
         (% (|Integer|)))
        (SPROG ((|pfact| NIL) (#1=#:G264 NIL) (|ris| (|Integer|)))
               (SEQ (LETT |ris| 0)
                    (SEQ (LETT |pfact| NIL) (LETT #1# |lfact|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |pfact| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |ris|
                                 (+ |ris|
                                    (* (- (QCDR |pfact|) 1)
                                       (SPADCALL (QCAR |pfact|)
                                                 (QREFELT % 128)))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |ris|)))) 

(SDEFUN |MULTSQFR;normDeriv2;SupISup;12|
        ((|f| (|SparseUnivariatePolynomial| R)) (|m| (|Integer|))
         (% (|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|#G1| (|NonNegativeInteger|)) (|k| (|Integer|))
          (|n1| #1=(|Integer|)) (#2=#:G269 NIL)
          (|ris| (|SparseUnivariatePolynomial| R)) (|n| #1#))
         (SEQ (LETT |#G1| (SPADCALL |f| (QREFELT % 128))) (LETT |n1| |#G1|)
              (EXIT
               (COND ((< |#G1| |m|) (|spadConstant| % 149))
                     ((EQL |n1| |m|)
                      (SPADCALL (SPADCALL |f| (QREFELT % 137))
                                (QREFELT % 130)))
                     ('T
                      (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT % 150)))
                           (LETT |ris| (|spadConstant| % 149)) (LETT |n| |n1|)
                           (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                                (SEQ
                                 (SEQ G190
                                      (COND ((NULL (> |n1| |n|)) (GO G191)))
                                      (SEQ
                                       (LETT |k|
                                             (|quotient_INT|
                                              (* |k| (- |n1| |m|)) |n1|))
                                       (EXIT (LETT |n1| (- |n1| 1))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |ris|
                                       (SPADCALL |ris|
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (SPADCALL |f|
                                                                      (QREFELT
                                                                       % 137))
                                                            (QREFELT % 151))
                                                  (PROG1 (LETT #2# (- |n| |m|))
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT % 152))
                                                 (QREFELT % 153)))
                                 (LETT |f| (SPADCALL |f| (QREFELT % 154)))
                                 (EXIT
                                  (LETT |n| (SPADCALL |f| (QREFELT % 128)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |ris|)))))))) 

(SDEFUN |MULTSQFR;myDegree;SupLNniL;13|
        ((|f| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|exp| (|NonNegativeInteger|)) (% (|List| (|NonNegativeInteger|))))
        (SPROG ((#1=#:G278 NIL) (|n| NIL) (#2=#:G279 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |n| NIL)
                      (LETT #2# (SPADCALL |f| |lvar| (QREFELT % 155))) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |n| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #1# (CONS (|quotient_INT| |n| |exp|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(DECLAIM (NOTINLINE |MultivariateSquareFree;|)) 

(DEFUN |MultivariateSquareFree;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MultivariateSquareFree| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 156))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MultivariateSquareFree|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 8388619)
    %))) 

(DEFUN |MultivariateSquareFree| (&REST #1=#:G280)
  (SPROG NIL
         (PROG (#2=#:G281)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MultivariateSquareFree|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MultivariateSquareFree;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MultivariateSquareFree|)))))))))) 

(MAKEPROP '|MultivariateSquareFree| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) '|pmod| (|Integer|)
              (|IntegerPrimesPackage| 11) (0 . |nextPrime|)
              (|Record| (|:| |factor| 20) (|:| |exponent| 41))
              (|Record| (|:| |upol| 20) (|:| |Lval| 60) (|:| |Lfact| 44)
                        (|:| |ctpol| 8))
              (|SparseUnivariatePolynomial| 9) (|List| 7) (|List| 60)
              |MULTSQFR;intChoose;SupLLR;6| (|SparseUnivariatePolynomial| 8)
              (5 . |1|) (|Boolean|) (9 . =) (15 . |1|) (19 . |1|)
              (23 . |leadingCoefficient|) (28 . ~=) (34 . *) (40 . |coerce|)
              (45 . *) (51 . *) (|Factored| 9) (57 . |1|) (61 . ~=)
              |MULTSQFR;squareFree;PF;5| (67 . |unit|) (72 . *)
              (|Record| (|:| |factor| 9) (|:| |exponent| 41)) (|List| 38)
              (78 . |factors|) (|NonNegativeInteger|) (83 . >)
              (|Mapping| 22 14 14) (|List| 14) (89 . |sort|) (95 . ~=)
              (101 . =) (|Union| % '"failed") (107 . |exquo|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (113 . |unitNormal|) (|Record| (|:| |pol| 16) (|:| |polval| 20))
              |MULTSQFR;consnewpol;SupSupIR;8| |MULTSQFR;coefChoose;IPLP;7|
              (|List| 41) |MULTSQFR;myDegree;SupLNniL;13| (118 . |exquo|)
              (124 . |coerce|) (|Union| 62 '#1="failed") (|List| 8)
              |MULTSQFR;lift;Sup2SupPLLLRU;9| (|List| 16) (129 . |elt|)
              (135 . ^) (141 . |exquo|) (|FactoringUtilities| 6 7 8 9)
              (147 . |completeEval|) (154 . |ground?|) (159 . |exquo|)
              (165 . |gcd|) (171 . =) (|SingletonAsOrderedSet|)
              (177 . |retract|) (182 . |retract|) (187 . |exquo|)
              (|Record| (|:| |factor| 16) (|:| |exponent| 41))
              (|Record| (|:| |unitPart| 9) (|:| |suPart| (|List| 76)))
              |MULTSQFR;nsqfree;SupLLR;3| (193 . |degree|) (198 . |coerce|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 81) (|:| |factor| 9) (|:| |exponent| 41))
              (|List| 82) (203 . |factorList|)
              (|Record| (|:| |flag| 81) (|:| |factor| 16) (|:| |exponent| 41))
              (|List| 85) (|Factored| 16) (208 . |makeFR|) (|List| 9)
              (214 . |coefficients|) (219 . |variables|) (224 . |setUnion|)
              (230 . |ground|) (|Mapping| 8 9)
              (|UnivariatePolynomialCategoryFunctions2| 9 16 8 20)
              (235 . |map|) (|Factored| %) (241 . |squareFree|) (|Factored| 20)
              (246 . |unit|) (|Mapping| 9 8)
              (|UnivariatePolynomialCategoryFunctions2| 8 20 9 16)
              (251 . |map|)
              (|Record| (|:| |flag| 81) (|:| |factor| 20) (|:| |exponent| 41))
              (|List| 104) (257 . |factorList|) (262 . |content|)
              (267 . |append|) |MULTSQFR;squareFree;SupF;4| (273 . |makeFR|)
              (279 . |minimumDegree|) (285 . |elt|) (291 . |0|) (295 . |0|)
              (299 . |elt|) (305 . |monomial|) (312 . |coerce|)
              |MULTSQFR;univcase;POVF;10| (317 . |append|) (323 . |degree|)
              (329 . ~=) (335 . |delete|) (|SparseUnivariatePolynomial| %)
              (341 . |univariate|) (347 . |multivariate|) (353 . |ran|)
              (358 . |member?|) (364 . |degree|) (369 . |content|)
              (374 . |coerce|) (379 . |factors|) (384 . |elt|)
              |MULTSQFR;compdegd;LI;11| (390 . ^) (396 . |normalDeriv|)
              |MULTSQFR;normDeriv2;SupISup;12| (402 . |leadingCoefficient|)
              (407 . |retract|) (412 . |exquo|) (418 . |eval|) (|List| 20)
              (|MultivariateLifting| 6 7 8 9) (425 . |lifting|) (436 . ~=)
              (442 . |primitivePart|) (447 . |univariate|) (452 . |exquo|)
              (458 . |multivariate|) (464 . |0|) (468 . |binomial|) (474 . *)
              (480 . |monomial|) (486 . +) (492 . |reductum|) (497 . |degree|))
           '#(|univcase| 503 |squareFree| 509 |nsqfree| 519 |normDeriv2| 526
              |myDegree| 532 |lift| 539 |intChoose| 551 |consnewpol| 558
              |compdegd| 565 |coefChoose| 570 |check| 577)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|squareFree| ((|Factored| |#4|) |#4|)) T)
                                   '((|squareFree|
                                      ((|Factored|
                                        (|SparseUnivariatePolynomial| |#4|))
                                       (|SparseUnivariatePolynomial| |#4|)))
                                     T)
                                   '((|compdegd|
                                      ((|Integer|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|univcase| ((|Factored| |#4|) |#4| |#2|))
                                     T)
                                   '((|consnewpol|
                                      ((|Record|
                                        (|:| |pol|
                                             (|SparseUnivariatePolynomial|
                                              |#4|))
                                        (|:| |polval|
                                             (|SparseUnivariatePolynomial|
                                              |#3|)))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T)
                                   '((|nsqfree|
                                      ((|Record| (|:| |unitPart| |#4|)
                                                 (|:| |suPart|
                                                      (|List|
                                                       (|Record|
                                                        (|:| |factor|
                                                             (|SparseUnivariatePolynomial|
                                                              |#4|))
                                                        (|:| |exponent|
                                                             (|NonNegativeInteger|))))))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|intChoose|
                                      ((|Record|
                                        (|:| |upol|
                                             (|SparseUnivariatePolynomial|
                                              |#3|))
                                        (|:| |Lval| (|List| |#3|))
                                        (|:| |Lfact|
                                             (|List|
                                              (|Record|
                                               (|:| |factor|
                                                    (|SparseUnivariatePolynomial|
                                                     |#3|))
                                               (|:| |exponent|
                                                    (|NonNegativeInteger|)))))
                                        (|:| |ctpol| |#3|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|List| (|List| |#3|))))
                                     T)
                                   '((|coefChoose|
                                      (|#4| (|Integer|) |#4|
                                       (|List|
                                        (|Record| (|:| |factor| |#4|)
                                                  (|:| |exponent|
                                                       (|NonNegativeInteger|))))))
                                     T)
                                   '((|check|
                                      ((|Boolean|)
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))
                                       (|List|
                                        (|Record|
                                         (|:| |factor|
                                              (|SparseUnivariatePolynomial|
                                               |#3|))
                                         (|:| |exponent|
                                              (|NonNegativeInteger|))))))
                                     T)
                                   '((|lift|
                                      ((|Union|
                                        (|List|
                                         (|SparseUnivariatePolynomial| |#4|))
                                        #1#)
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|) |#4|
                                       (|List| |#2|)
                                       (|List| (|NonNegativeInteger|))
                                       (|List| |#3|) |#3|))
                                     T)
                                   '((|myDegree|
                                      ((|List| (|NonNegativeInteger|))
                                       (|SparseUnivariatePolynomial| |#4|)
                                       (|List| |#2|) (|NonNegativeInteger|)))
                                     T)
                                   '((|normDeriv2|
                                      ((|SparseUnivariatePolynomial| |#3|)
                                       (|SparseUnivariatePolynomial| |#3|)
                                       (|Integer|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 155
                                            '(1 12 11 11 13 0 20 0 21 2 20 22 0
                                              0 23 0 9 0 24 0 8 0 25 1 16 9 0
                                              26 2 8 22 0 0 27 2 20 0 8 0 28 1
                                              9 0 8 29 2 16 0 9 0 30 2 9 0 8 0
                                              31 0 32 0 33 2 9 22 0 0 34 1 32 9
                                              0 36 2 9 0 0 0 37 1 32 39 0 40 2
                                              41 22 0 0 42 2 44 0 43 0 45 2 44
                                              22 0 0 46 2 44 22 0 0 47 2 16 48
                                              0 9 49 1 9 50 0 51 2 20 48 0 0 57
                                              1 8 0 11 58 2 62 16 0 11 63 2 16
                                              0 0 41 64 2 16 48 0 0 65 3 66 20
                                              16 17 60 67 1 9 22 0 68 2 9 48 0
                                              0 69 2 9 0 0 0 70 2 9 22 0 0 71 1
                                              16 72 0 73 1 16 9 0 74 2 9 48 0 8
                                              75 1 16 41 0 79 1 16 0 9 80 1 32
                                              83 0 84 2 87 0 16 86 88 1 16 89 0
                                              90 1 9 17 0 91 2 17 0 0 0 92 1 9
                                              8 0 93 2 95 20 94 16 96 1 20 97 0
                                              98 1 99 20 0 100 2 102 16 101 20
                                              103 1 99 105 0 106 1 16 9 0 107 2
                                              86 0 0 0 108 2 32 0 9 83 110 2 9
                                              55 0 17 111 2 55 41 0 11 112 0 6
                                              0 113 0 8 0 114 2 17 7 0 11 115 3
                                              9 0 0 7 41 116 1 9 0 7 117 2 83 0
                                              0 0 119 2 9 55 0 17 120 2 41 22 0
                                              0 121 2 17 0 0 11 122 2 9 123 0 7
                                              124 2 9 0 123 7 125 1 66 8 11 126
                                              2 18 22 60 0 127 1 20 41 0 128 1
                                              20 8 0 129 1 20 0 8 130 1 99 44 0
                                              131 2 44 14 0 11 132 2 9 0 0 41
                                              134 2 66 16 16 11 135 1 20 8 0
                                              137 1 9 8 0 138 2 8 48 0 0 139 3
                                              9 0 0 17 60 140 7 142 59 16 17
                                              141 60 89 55 8 143 2 20 22 0 0
                                              144 1 16 0 0 145 1 9 20 0 146 2
                                              20 48 0 8 147 2 9 0 20 7 148 0 20
                                              0 149 2 11 0 0 0 150 2 8 0 11 0
                                              151 2 20 0 8 41 152 2 20 0 0 0
                                              153 1 20 0 0 154 2 66 55 16 17
                                              155 2 0 32 9 7 118 1 0 87 16 109
                                              1 0 32 9 35 3 0 77 16 17 18 78 2
                                              0 20 20 11 136 3 0 55 16 17 41 56
                                              8 0 59 16 20 20 9 17 55 60 8 61 3
                                              0 15 16 17 18 19 3 0 52 16 20 11
                                              53 1 0 11 44 133 3 0 9 11 9 39 54
                                              2 0 22 44 44 1)))))
           '|lookupComplete|)) 
