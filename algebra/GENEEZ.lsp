
(SDEFUN |GENEEZ;compBound;BPLNni;1|
        ((|m| (BP)) (|listpolys| (|List| BP)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G29 NIL) (#2=#:G30 NIL)
          (|ldeg| (|List| #3=(|NonNegativeInteger|))) (#4=#:G31 NIL)
          (#5=#:G13 #3#) (#6=#:G11 #3#) (#7=#:G12 NIL) (|n| #3#) (#8=#:G32 NIL)
          (|f| NIL) (#9=#:G33 NIL) (#10=#:G34 NIL)
          (#11=#:G17 #12=(|NonNegativeInteger|)) (#13=#:G15 #12#)
          (#14=#:G16 NIL) (|normlist| (|List| #12#)) (|u| NIL) (#15=#:G35 NIL)
          (#16=#:G21 #12#) (#17=#:G19 #12#) (#18=#:G20 NIL) (|nm| #12#)
          (|df| NIL) (#19=#:G37 NIL) (|g| NIL) (#20=#:G36 NIL) (#21=#:G25 NIL)
          (#22=#:G24 #12#) (#23=#:G22 #12#) (#24=#:G23 NIL) (|normprod| #12#)
          (#25=#:G26 NIL))
         (SEQ
          (LETT |ldeg|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |f| NIL) (LETT #2# |listpolys|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |f| (QREFELT % 9)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |n|
                (PROGN
                 (LETT #7# NIL)
                 (SEQ (LETT |df| NIL) (LETT #4# |ldeg|) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |df| (CAR #4#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #5# |df|)
                         (COND (#7# (LETT #6# (+ #6# #5#)))
                               ('T (PROGN (LETT #6# #5#) (LETT #7# 'T)))))))
                      (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                 (COND (#7# #6#) (#26='T 0))))
          (LETT |normlist|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |f| NIL) (LETT #9# |listpolys|) G190
                      (COND
                       ((OR (ATOM #9#) (PROGN (LETT |f| (CAR #9#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (PROGN
                                (LETT #14# NIL)
                                (SEQ (LETT |u| NIL)
                                     (LETT #10# (SPADCALL |f| (QREFELT % 11)))
                                     G190
                                     (COND
                                      ((OR (ATOM #10#)
                                           (PROGN (LETT |u| (CAR #10#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #11#
                                              (EXPT
                                               (SPADCALL |u| (QREFELT % 12))
                                               2))
                                        (COND (#14# (LETT #13# (+ #13# #11#)))
                                              ('T
                                               (PROGN
                                                (LETT #13# #11#)
                                                (LETT #14# 'T)))))))
                                     (LETT #10# (CDR #10#)) (GO G190) G191
                                     (EXIT NIL))
                                (COND (#14# #13#) ('T 0)))
                               #8#))))
                      (LETT #9# (CDR #9#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |nm|
                (PROGN
                 (LETT #18# NIL)
                 (SEQ (LETT |u| NIL) (LETT #15# (SPADCALL |m| (QREFELT % 11)))
                      G190
                      (COND
                       ((OR (ATOM #15#) (PROGN (LETT |u| (CAR #15#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #16# (EXPT (SPADCALL |u| (QREFELT % 12)) 2))
                         (COND (#18# (LETT #17# (+ #17# #16#)))
                               ('T (PROGN (LETT #17# #16#) (LETT #18# 'T)))))))
                      (LETT #15# (CDR #15#)) (GO G190) G191 (EXIT NIL))
                 (COND (#18# #17#) (#26# 0))))
          (LETT |normprod|
                (PROGN
                 (LETT #24# NIL)
                 (SEQ (LETT |df| NIL) (LETT #19# |ldeg|) (LETT |g| NIL)
                      (LETT #20# |normlist|) G190
                      (COND
                       ((OR (ATOM #20#) (PROGN (LETT |g| (CAR #20#)) NIL)
                            (ATOM #19#) (PROGN (LETT |df| (CAR #19#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #22#
                               (EXPT |g|
                                     (PROG1 (LETT #21# (- |n| |df|))
                                       (|check_subtype2| (>= #21# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #21#))))
                         (COND (#24# (LETT #23# (* #23# #22#)))
                               ('T (PROGN (LETT #23# #22#) (LETT #24# 'T)))))))
                      (LETT #20# (PROG1 (CDR #20#) (LETT #19# (CDR #19#))))
                      (GO G190) G191 (EXIT NIL))
                 (COND (#24# #23#) (#26# 1))))
          (EXIT
           (* 2
              (PROG1 (LETT #25# (SPADCALL (* |normprod| |nm|) (QREFELT % 15)))
                (|check_subtype2| (>= #25# 0) '(|NonNegativeInteger|)
                                  '(|Integer|) #25#))))))) 

(SDEFUN |GENEEZ;compBound;BPLNni;2|
        ((|m| (BP)) (|listpolys| (|List| BP)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G48 NIL) (#2=#:G40 #3=(|NonNegativeInteger|)) (#4=#:G38 #3#)
          (#5=#:G39 NIL) (|p| NIL) (#6=#:G49 NIL) (|u| NIL) (#7=#:G50 NIL)
          (#8=#:G46 #3#) (#9=#:G44 #3#) (#10=#:G45 NIL) (#11=#:G43 #3#)
          (#12=#:G41 #3#) (#13=#:G42 NIL))
         (SEQ
          (+
           (PROGN
            (LETT #5# NIL)
            (SEQ (LETT |u| NIL) (LETT #1# (SPADCALL |m| (QREFELT % 11))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #2# (SPADCALL |u| (QREFELT % 12)))
                    (COND (#5# (LETT #4# (MAX #4# #2#)))
                          ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (COND (#5# #4#) (#14='T (|IdentityError| '|max|))))
           (PROGN
            (LETT #13# NIL)
            (SEQ (LETT |p| NIL) (LETT #6# |listpolys|) G190
                 (COND
                  ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #11#
                          (PROGN
                           (LETT #10# NIL)
                           (SEQ (LETT |u| NIL)
                                (LETT #7# (SPADCALL |p| (QREFELT % 11))) G190
                                (COND
                                 ((OR (ATOM #7#)
                                      (PROGN (LETT |u| (CAR #7#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #8# (SPADCALL |u| (QREFELT % 12)))
                                   (COND (#10# (LETT #9# (MAX #9# #8#)))
                                         ('T
                                          (PROGN
                                           (LETT #9# #8#)
                                           (LETT #10# 'T)))))))
                                (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                           (COND (#10# #9#) ('T (|IdentityError| '|max|)))))
                    (COND (#13# (LETT #12# (+ #12# #11#)))
                          ('T (PROGN (LETT #12# #11#) (LETT #13# 'T)))))))
                 (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
            (COND (#13# #12#) (#14# 0))))))) 

(MAKEPROP '|GENEEZ;compBound;BPLNni;3| '|SPADreplace|
          '(XLAM (|m| |listpolys|)
            (|error|
             "attempt to use compBound without a well-understood valuation"))) 

(SDEFUN |GENEEZ;compBound;BPLNni;3|
        ((|m| (BP)) (|listpolys| (|List| BP)) (% (|NonNegativeInteger|)))
        (|error|
         "attempt to use compBound without a well-understood valuation")) 

(SDEFUN |GENEEZ;reduction;BPRBP;4| ((|u| (BP)) (|p| (R)) (% (BP)))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| % 18) (QREFELT % 21)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;4!0| (VECTOR % |p|)) |u|
                       (QREFELT % 24)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;4!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT % 22)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5| ((|u| (BP)) (|p| (R)) (% (BP)))
        (SPROG NIL
               (COND ((SPADCALL |p| (|spadConstant| % 18) (QREFELT % 21)) |u|)
                     ('T
                      (SPADCALL
                       (CONS #'|GENEEZ;reduction;BPRBP;5!0| (VECTOR % |p|)) |u|
                       (QREFELT % 24)))))) 

(SDEFUN |GENEEZ;reduction;BPRBP;5!0| ((|x| NIL) ($$ NIL))
        (PROG (|p| %)
          (LETT |p| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |p| (QREFELT % 26)))))) 

(SDEFUN |GENEEZ;merge| ((|p| (R)) (|q| (R)) (% (|Union| R "failed")))
        (COND ((SPADCALL |p| |q| (QREFELT % 21)) (CONS 0 |p|))
              ((SPADCALL |p| (|spadConstant| % 18) (QREFELT % 21))
               (CONS 0 |q|))
              ((SPADCALL |q| (|spadConstant| % 18) (QREFELT % 21))
               (CONS 0 |p|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |GENEEZ;modInverse| ((|c| (R)) (|p| (R)) (% (R)))
        (SPROG ((#1=#:G67 NIL))
               (QCAR
                (PROG2
                    (LETT #1#
                          (SPADCALL |c| |p| (|spadConstant| % 27)
                                    (QREFELT % 31)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|Record| (|:| |coef1| (QREFELT % 6))
                                            (|:| |coef2| (QREFELT % 6)))
                                  (|Union|
                                   (|Record| (|:| |coef1| (QREFELT % 6))
                                             (|:| |coef2| (QREFELT % 6)))
                                   "failed")
                                  #1#))))) 

(SDEFUN |GENEEZ;exactquo|
        ((|u| (BP)) (|v| (BP)) (|p| (R)) (% (|Union| BP "failed")))
        (SPROG
         ((|invlcv| (R))
          (|r| (|Record| (|:| |quotient| BP) (|:| |remainder| BP))))
         (SEQ
          (LETT |invlcv|
                (|GENEEZ;modInverse| (SPADCALL |v| (QREFELT % 32)) |p| %))
          (LETT |r|
                (SPADCALL |u|
                          (SPADCALL (SPADCALL |invlcv| |v| (QREFELT % 33)) |p|
                                    (QREFELT % 25))
                          (QREFELT % 35)))
          (EXIT
           (COND
            ((SPADCALL (SPADCALL (QCDR |r|) |p| (QREFELT % 25))
                       (|spadConstant| % 19) (QREFELT % 36))
             (CONS 1 "failed"))
            ('T
             (CONS 0
                   (SPADCALL (SPADCALL |invlcv| (QCAR |r|) (QREFELT % 33)) |p|
                             (QREFELT % 25))))))))) 

(SDEFUN |GENEEZ;reduceList| ((|lp| (|List| BP)) (|lmod| (R)) (% (|List| FP)))
        (SPROG ((#1=#:G94 NIL) (|ff| NIL) (#2=#:G95 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |ff| NIL) (LETT #2# |lp|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |ff| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS (SPADCALL |ff| |lmod| (QREFELT % 38))
                                    #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GENEEZ;coerceLFP| ((|lf| (|List| FP)) (% (|List| BP)))
        (SPROG ((#1=#:G99 NIL) (|fm| NIL) (#2=#:G100 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |fm| NIL) (LETT #2# |lf|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |fm| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (SPADCALL |fm| (QREFELT % 39)) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GENEEZ;liftSol|
        ((|oldsol| (|List| BP)) (|err| (BP)) (|lmod| (R)) (|lmodk| (R))
         (|lpolys| (|List| BP)) (|ftab| (|Vector| (|List| FP))) (|m| (BP))
         (|bound| (|NonNegativeInteger|)) (% (|Union| (|List| BP) "failed")))
        (SPROG
         ((|d| (|NonNegativeInteger|)) (#1=#:G127 NIL) (|xx| NIL)
          (#2=#:G128 NIL) (|i| NIL) (#3=#:G129 NIL) (|cc| (R)) (#4=#:G130 NIL)
          (#5=#:G132 NIL) (|pp| NIL) (#6=#:G131 NIL) (|sln| (|List| FP))
          (#7=#:G133 NIL) (#8=#:G135 NIL) (#9=#:G134 NIL) (#10=#:G136 NIL)
          (|slp| NIL) (#11=#:G137 NIL) (|nsol| (|List| BP)) (|g| NIL)
          (#12=#:G139 NIL) (|f| NIL) (#13=#:G138 NIL) (#14=#:G117 (BP))
          (#15=#:G115 (BP)) (#16=#:G116 NIL) (|fs| (BP)) (#17=#:G126 NIL)
          (#18=#:G71 NIL))
         (SEQ
          (EXIT
           (SEQ G190 NIL
                (SEQ
                 (EXIT
                  (COND
                   ((> (SPADCALL |lmodk| (QREFELT % 12)) |bound|)
                    (PROGN (LETT #17# (CONS 1 "failed")) (GO #19=#:G125)))
                   ('T
                    (SEQ (LETT |d| (SPADCALL |err| (QREFELT % 9)))
                         (LETT |sln|
                               (PROGN
                                (LETT #1# NIL)
                                (SEQ (LETT |xx| NIL)
                                     (LETT #2#
                                           (SPADCALL |ftab| 1 (QREFELT % 42)))
                                     G190
                                     (COND
                                      ((OR (ATOM #2#)
                                           (PROGN (LETT |xx| (CAR #2#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #1#
                                             (CONS (|spadConstant| % 43)
                                                   #1#))))
                                     (LETT #2# (CDR #2#)) (GO G190) G191
                                     (EXIT (NREVERSE #1#)))))
                         (SEQ (LETT |i| 0) (LETT #3# |d|) G190
                              (COND ((|greater_SI| |i| #3#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (LETT |cc|
                                         (SPADCALL |err| |i| (QREFELT % 44)))
                                   (|spadConstant| % 18) (QREFELT % 45))
                                  (LETT |sln|
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |slp| NIL) (LETT #5# |sln|)
                                              (LETT |pp| NIL)
                                              (LETT #6#
                                                    (SPADCALL |ftab| (+ |i| 1)
                                                              (QREFELT % 42)))
                                              G190
                                              (COND
                                               ((OR (ATOM #6#)
                                                    (PROGN
                                                     (LETT |pp| (CAR #6#))
                                                     NIL)
                                                    (ATOM #5#)
                                                    (PROGN
                                                     (LETT |slp| (CAR #5#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (SPADCALL |slp|
                                                                 (SPADCALL
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |cc|
                                                                    (QREFELT %
                                                                             46))
                                                                   |lmod|
                                                                   (QREFELT %
                                                                            38))
                                                                  |pp|
                                                                  (QREFELT %
                                                                           47))
                                                                 (QREFELT %
                                                                          48))
                                                       #4#))))
                                              (LETT #6#
                                                    (PROG1 (CDR #6#)
                                                      (LETT #5# (CDR #5#))))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#)))))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (LETT |nsol|
                               (PROGN
                                (LETT #7# NIL)
                                (SEQ (LETT |g| NIL) (LETT #8# |sln|)
                                     (LETT |f| NIL) (LETT #9# |oldsol|) G190
                                     (COND
                                      ((OR (ATOM #9#)
                                           (PROGN (LETT |f| (CAR #9#)) NIL)
                                           (ATOM #8#)
                                           (PROGN (LETT |g| (CAR #8#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #7#
                                             (CONS
                                              (SPADCALL |f|
                                                        (SPADCALL |lmodk|
                                                                  (SPADCALL
                                                                   (SPADCALL
                                                                    |g|
                                                                    (QREFELT %
                                                                             39))
                                                                   |lmod|
                                                                   (QREFELT %
                                                                            25))
                                                                  (QREFELT %
                                                                           33))
                                                        (QREFELT % 49))
                                              #7#))))
                                     (LETT #9#
                                           (PROG1 (CDR #9#)
                                             (LETT #8# (CDR #8#))))
                                     (GO G190) G191 (EXIT (NREVERSE #7#)))))
                         (LETT |lmodk|
                               (SPADCALL |lmod| |lmodk| (QREFELT % 50)))
                         (LETT |nsol|
                               (PROGN
                                (LETT #10# NIL)
                                (SEQ (LETT |slp| NIL) (LETT #11# |nsol|) G190
                                     (COND
                                      ((OR (ATOM #11#)
                                           (PROGN (LETT |slp| (CAR #11#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #10#
                                             (CONS
                                              (SPADCALL |slp| |lmodk|
                                                        (QREFELT % 25))
                                              #10#))))
                                     (LETT #11# (CDR #11#)) (GO G190) G191
                                     (EXIT (NREVERSE #10#)))))
                         (LETT |fs|
                               (PROGN
                                (LETT #16# NIL)
                                (SEQ (LETT |g| NIL) (LETT #12# |nsol|)
                                     (LETT |f| NIL) (LETT #13# |lpolys|) G190
                                     (COND
                                      ((OR (ATOM #13#)
                                           (PROGN (LETT |f| (CAR #13#)) NIL)
                                           (ATOM #12#)
                                           (PROGN (LETT |g| (CAR #12#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (PROGN
                                        (LETT #14#
                                              (SPADCALL |f| |g|
                                                        (QREFELT % 51)))
                                        (COND
                                         (#16#
                                          (LETT #15#
                                                (SPADCALL #15# #14#
                                                          (QREFELT % 52))))
                                         ('T
                                          (PROGN
                                           (LETT #15# #14#)
                                           (LETT #16# 'T)))))))
                                     (LETT #13#
                                           (PROG1 (CDR #13#)
                                             (LETT #12# (CDR #12#))))
                                     (GO G190) G191 (EXIT NIL))
                                (COND (#16# #15#) ('T (|spadConstant| % 19)))))
                         (EXIT
                          (COND
                           ((SPADCALL |fs| |m| (QREFELT % 53))
                            (PROGN (LETT #17# (CONS 0 |nsol|)) (GO #19#)))
                           ('T
                            (SEQ
                             (LETT |err|
                                   (PROG2
                                       (LETT #18#
                                             (SPADCALL
                                              (SPADCALL |fs| |m|
                                                        (QREFELT % 49))
                                              |lmodk| (QREFELT % 55)))
                                       (QCDR #18#)
                                     (|check_union2| (QEQCAR #18# 0)
                                                     (QREFELT % 7)
                                                     (|Union| (QREFELT % 7)
                                                              "failed")
                                                     #18#)))
                             (EXIT (LETT |oldsol| |nsol|)))))))))))
                NIL (GO G190) G191 (EXIT NIL)))
          #19# (EXIT #17#)))) 

(SDEFUN |GENEEZ;makeProducts| ((|listPol| (|List| BP)) (% (|List| BP)))
        (SPROG
         ((|f| (BP)) (|ll| (|List| BP)) (#1=#:G0 NIL) (#2=#:G149 NIL)
          (#3=#:G142 (BP)) (#4=#:G140 (BP)) (#5=#:G141 NIL) (#6=#:G150 NIL)
          (|g| NIL) (#7=#:G151 NIL))
         (SEQ
          (COND ((< (LENGTH |listPol|) 2) |listPol|)
                ((EQL (LENGTH |listPol|) 2) (REVERSE |listPol|))
                (#8='T
                 (SEQ (LETT |f| (|SPADfirst| |listPol|))
                      (LETT |ll| (CDR |listPol|))
                      (EXIT
                       (CONS
                        (PROGN
                         (LETT #5# NIL)
                         (SEQ (LETT #1# NIL) (LETT #2# |ll|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT #1# (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #3# #1#)
                                 (COND
                                  (#5#
                                   (LETT #4#
                                         (SPADCALL #4# #3# (QREFELT % 51))))
                                  ('T (PROGN (LETT #4# #3#) (LETT #5# 'T)))))))
                              (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                         (COND (#5# #4#) (#8# (|spadConstant| % 28))))
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |g| NIL)
                              (LETT #7# (|GENEEZ;makeProducts| |ll| %)) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |g| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS (SPADCALL |f| |g| (QREFELT % 51))
                                            #6#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #6#)))))))))))) 

(SDEFUN |GENEEZ;testModulus;RLB;13|
        ((|pmod| (R)) (|listPol| (|List| BP)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G168 NIL) (|pol| NIL) (#2=#:G167 NIL) (#3=#:G165 NIL)
          (|rpol| (FP)) (|redListPol| (|List| FP)) (|rpol2| NIL)
          (#4=#:G169 NIL) (#5=#:G166 NIL) (#6=#:G164 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |redListPol| (|GENEEZ;reduceList| |listPol| |pmod| %))
                (SEQ
                 (EXIT
                  (SEQ (LETT #1# |redListPol|) (LETT |pol| NIL)
                       (LETT #2# |listPol|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#)) NIL)
                             (ATOM #1#) (PROGN (LETT |rpol| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |pol| (QREFELT % 9))
                                     (SPADCALL (SPADCALL |rpol| (QREFELT % 39))
                                               (QREFELT % 9))
                                     (QREFELT % 56))
                           (PROGN
                            (LETT #3# (PROGN (LETT #5# NIL) (GO #7=#:G163)))
                            (GO #8=#:G154))))))
                       (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#))))
                       (GO G190) G191 (EXIT NIL)))
                 #8# (EXIT #3#))
                (SEQ G190 (COND ((NULL (NULL (NULL |redListPol|))) (GO G191)))
                     (SEQ (LETT |rpol| (|SPADfirst| |redListPol|))
                          (LETT |redListPol| (CDR |redListPol|))
                          (EXIT
                           (SEQ
                            (EXIT
                             (SEQ (LETT |rpol2| NIL) (LETT #4# |redListPol|)
                                  G190
                                  (COND
                                   ((OR (ATOM #4#)
                                        (PROGN (LETT |rpol2| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |rpol| |rpol2| (QREFELT % 57))
                                       (|spadConstant| % 58) (QREFELT % 59))
                                      (PROGN
                                       (LETT #6#
                                             (PROGN (LETT #5# NIL) (GO #7#)))
                                       (GO #9=#:G159))))))
                                  (LETT #4# (CDR #4#)) (GO G190) G191
                                  (EXIT NIL)))
                            #9# (EXIT #6#))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #5#)))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;14|
        ((|mdeg| (|NonNegativeInteger|)) (|pmod| (R)) (|listPol| (|List| BP))
         (% (|Union| (|Vector| (|List| BP)) "failed")))
        (SPROG
         ((|multiE| (|Union| (|List| BP) "failed"))
          (|ptable| (|Vector| (|List| BP))) (|x| (BP)) (|i| NIL)
          (#1=#:G186 NIL) (#2=#:G187 NIL) (|fpol| NIL) (#3=#:G189 NIL)
          (|tpol| NIL) (#4=#:G188 NIL))
         (SEQ
          (LETT |multiE|
                (SPADCALL |listPol| (|spadConstant| % 28) (QREFELT % 63)))
          (EXIT
           (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |ptable| (MAKEARR1 (+ |mdeg| 1) NIL))
                       (SPADCALL |ptable| 1 (QCDR |multiE|) (QREFELT % 65))
                       (LETT |x|
                             (SPADCALL (|spadConstant| % 27) 1 (QREFELT % 66)))
                       (SEQ (LETT |i| 2) (LETT #1# |mdeg|) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SPADCALL |ptable| |i|
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ (LETT |fpol| NIL)
                                              (LETT #3# |listPol|)
                                              (LETT |tpol| NIL)
                                              (LETT #4#
                                                    (SPADCALL |ptable|
                                                              (- |i| 1)
                                                              (QREFELT % 67)))
                                              G190
                                              (COND
                                               ((OR (ATOM #4#)
                                                    (PROGN
                                                     (LETT |tpol| (CAR #4#))
                                                     NIL)
                                                    (ATOM #3#)
                                                    (PROGN
                                                     (LETT |fpol| (CAR #3#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL
                                                        (SPADCALL |tpol| |x|
                                                                  (QREFELT %
                                                                           51))
                                                        |fpol| (QREFELT % 68))
                                                       #2#))))
                                              (LETT #4#
                                                    (PROG1 (CDR #4#)
                                                      (LETT #3# (CDR #3#))))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        (QREFELT % 65))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (SPADCALL |ptable| (+ |mdeg| 1)
                                 (|GENEEZ;makeProducts| |listPol| %)
                                 (QREFELT % 65))
                       (EXIT (CONS 0 |ptable|))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;15|
        ((|m| (BP)) (|pmod| (R)) (|table| (|Vector| (|List| BP)))
         (% (|Union| (|List| BP) "failed")))
        (SPROG
         ((|d| (|NonNegativeInteger|)) (#1=#:G201 NIL) (|xx| NIL)
          (#2=#:G202 NIL) (|i| NIL) (#3=#:G203 NIL) (#4=#:G204 NIL) (|slp| NIL)
          (#5=#:G206 NIL) (|pp| NIL) (#6=#:G205 NIL) (|sln| (|List| BP)))
         (SEQ (LETT |d| (SPADCALL |m| (QREFELT % 9)))
              (LETT |sln|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |xx| NIL)
                          (LETT #2# (SPADCALL |table| 1 (QREFELT % 67))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |xx| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #1# (CONS (|spadConstant| % 19) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |i| 0) (LETT #3# |d|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |m| |i| (QREFELT % 44))
                                 (|spadConstant| % 18) (QREFELT % 45))
                       (LETT |sln|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |slp| NIL) (LETT #5# |sln|)
                                   (LETT |pp| NIL)
                                   (LETT #6#
                                         (SPADCALL |table| (+ |i| 1)
                                                   (QREFELT % 67)))
                                   G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |pp| (CAR #6#)) NIL)
                                         (ATOM #5#)
                                         (PROGN (LETT |slp| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |slp|
                                                      (SPADCALL
                                                       (SPADCALL |m| |i|
                                                                 (QREFELT %
                                                                          44))
                                                       |pp| (QREFELT % 33))
                                                      (QREFELT % 52))
                                            #4#))))
                                   (LETT #6#
                                         (PROG1 (CDR #6#)
                                           (LETT #5# (CDR #5#))))
                                   (GO G190) G191 (EXIT (NREVERSE #4#)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS 0 |sln|))))) 

(SDEFUN |GENEEZ;tablePow;NniRLU;16|
        ((|mdeg| (|NonNegativeInteger|)) (|pmod| (R)) (|listPol| (|List| BP))
         (% (|Union| (|Vector| (|List| BP)) "failed")))
        (SPROG
         ((#1=#:G228 NIL) (#2=#:G229 NIL) (|listP| (|List| FP)) (|pol| NIL)
          (#3=#:G231 NIL) (|rpol| NIL) (#4=#:G230 NIL) (#5=#:G227 NIL)
          (|multiE| (|Union| (|List| FP) "failed"))
          (|ftable| (|Vector| (|List| FP))) (|fl| (|List| FP)) (|x| (FP))
          (|i| NIL) (#6=#:G232 NIL) (#7=#:G233 NIL) (|fpol| NIL)
          (#8=#:G235 NIL) (|tpol| NIL) (#9=#:G234 NIL)
          (|ptable| (|Vector| (|List| BP))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |listP|
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |pol| NIL) (LETT #2# |listPol|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |pol| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #1#
                                (CONS (SPADCALL |pol| |pmod| (QREFELT % 38))
                                      #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
            (SEQ (LETT |pol| NIL) (LETT #3# |listPol|) (LETT |rpol| NIL)
                 (LETT #4# |listP|) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |rpol| (CAR #4#)) NIL)
                       (ATOM #3#) (PROGN (LETT |pol| (CAR #3#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((<
                      (SPADCALL (SPADCALL |rpol| (QREFELT % 39)) (QREFELT % 9))
                      (SPADCALL |pol| (QREFELT % 9)))
                     (PROGN (LETT #5# (CONS 1 "failed")) (GO #10=#:G226))))))
                 (LETT #4# (PROG1 (CDR #4#) (LETT #3# (CDR #3#)))) (GO G190)
                 G191 (EXIT NIL))
            (LETT |multiE|
                  (SPADCALL |listP| (|spadConstant| % 58) (QREFELT % 73)))
            (EXIT
             (COND ((QEQCAR |multiE| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |ftable| (MAKEARR1 (+ |mdeg| 1) NIL))
                         (LETT |fl| (QCDR |multiE|))
                         (SPADCALL |ftable| 1 |fl| (QREFELT % 74))
                         (LETT |x|
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 27) 1
                                          (QREFELT % 66))
                                |pmod| (QREFELT % 38)))
                         (SEQ (LETT |i| 2) (LETT #6# |mdeg|) G190
                              (COND ((|greater_SI| |i| #6#) (GO G191)))
                              (SEQ
                               (EXIT
                                (SPADCALL |ftable| |i|
                                          (PROGN
                                           (LETT #7# NIL)
                                           (SEQ (LETT |fpol| NIL)
                                                (LETT #8# |listP|)
                                                (LETT |tpol| NIL)
                                                (LETT #9#
                                                      (SPADCALL |ftable|
                                                                (- |i| 1)
                                                                (QREFELT %
                                                                         42)))
                                                G190
                                                (COND
                                                 ((OR (ATOM #9#)
                                                      (PROGN
                                                       (LETT |tpol| (CAR #9#))
                                                       NIL)
                                                      (ATOM #8#)
                                                      (PROGN
                                                       (LETT |fpol| (CAR #8#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #7#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL |tpol| |x|
                                                                    (QREFELT %
                                                                             47))
                                                          |fpol|
                                                          (QREFELT % 75))
                                                         #7#))))
                                                (LETT #9#
                                                      (PROG1 (CDR #9#)
                                                        (LETT #8# (CDR #8#))))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #7#))))
                                          (QREFELT % 74))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (LETT |ptable|
                               (SPADCALL
                                (CONS (|function| |GENEEZ;coerceLFP|) %)
                                |ftable| (QREFELT % 78)))
                         (SPADCALL |ptable| (+ |mdeg| 1)
                                   (|GENEEZ;makeProducts| |listPol| %)
                                   (QREFELT % 65))
                         (EXIT (CONS 0 |ptable|))))))))
          #10# (EXIT #5#)))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17|
        ((|m| (BP)) (|pmod| (R)) (|table| (|Vector| (|List| BP)))
         (% (|Union| (|List| BP) "failed")))
        (SPROG
         ((|d| (|NonNegativeInteger|)) (|ftab| (|Vector| (|List| FP)))
          (|lpolys| (|List| BP)) (#1=#:G252 NIL) (|xx| NIL) (#2=#:G253 NIL)
          (|i| NIL) (#3=#:G254 NIL) (#4=#:G255 NIL) (#5=#:G257 NIL) (|pp| NIL)
          (#6=#:G256 NIL) (|sln| (|List| FP)) (#7=#:G258 NIL) (|slp| NIL)
          (#8=#:G259 NIL) (|soln| (|List| BP)) (|g| NIL) (#9=#:G261 NIL)
          (|f| NIL) (#10=#:G260 NIL) (#11=#:G248 (BP)) (#12=#:G246 (BP))
          (#13=#:G247 NIL) (|fs| (BP)) (|bound| (|NonNegativeInteger|))
          (#14=#:G71 NIL) (|a| (BP)))
         (SEQ (LETT |d| (SPADCALL |m| (QREFELT % 9)))
              (LETT |ftab|
                    (SPADCALL
                     (CONS #'|GENEEZ;solveid;BPRVU;17!0| (VECTOR % |pmod|))
                     |table| (QREFELT % 81)))
              (LETT |lpolys|
                    (SPADCALL |table| (QVSIZE |table|) (QREFELT % 67)))
              (LETT |sln|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |xx| NIL)
                          (LETT #2# (SPADCALL |ftab| 1 (QREFELT % 42))) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |xx| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT (LETT #1# (CONS (|spadConstant| % 43) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (SEQ (LETT |i| 0) (LETT #3# |d|) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |m| |i| (QREFELT % 44))
                                 (|spadConstant| % 18) (QREFELT % 45))
                       (LETT |sln|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |slp| NIL) (LETT #5# |sln|)
                                   (LETT |pp| NIL)
                                   (LETT #6#
                                         (SPADCALL |ftab| (+ |i| 1)
                                                   (QREFELT % 42)))
                                   G190
                                   (COND
                                    ((OR (ATOM #6#)
                                         (PROGN (LETT |pp| (CAR #6#)) NIL)
                                         (ATOM #5#)
                                         (PROGN (LETT |slp| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |slp|
                                                      (SPADCALL
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (SPADCALL |m| |i|
                                                                   (QREFELT %
                                                                            44))
                                                         (QREFELT % 46))
                                                        |pmod| (QREFELT % 38))
                                                       |pp| (QREFELT % 47))
                                                      (QREFELT % 48))
                                            #4#))))
                                   (LETT #6#
                                         (PROG1 (CDR #6#)
                                           (LETT #5# (CDR #5#))))
                                   (GO G190) G191 (EXIT (NREVERSE #4#)))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |soln|
                    (PROGN
                     (LETT #7# NIL)
                     (SEQ (LETT |slp| NIL) (LETT #8# |sln|) G190
                          (COND
                           ((OR (ATOM #8#) (PROGN (LETT |slp| (CAR #8#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #7#
                                  (CONS (SPADCALL |slp| (QREFELT % 39)) #7#))))
                          (LETT #8# (CDR #8#)) (GO G190) G191
                          (EXIT (NREVERSE #7#)))))
              (LETT |fs|
                    (PROGN
                     (LETT #13# NIL)
                     (SEQ (LETT |g| NIL) (LETT #9# |soln|) (LETT |f| NIL)
                          (LETT #10# |lpolys|) G190
                          (COND
                           ((OR (ATOM #10#) (PROGN (LETT |f| (CAR #10#)) NIL)
                                (ATOM #9#) (PROGN (LETT |g| (CAR #9#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #11# (SPADCALL |f| |g| (QREFELT % 51)))
                             (COND
                              (#13#
                               (LETT #12# (SPADCALL #12# #11# (QREFELT % 52))))
                              ('T (PROGN (LETT #12# #11#) (LETT #13# 'T)))))))
                          (LETT #10# (PROG1 (CDR #10#) (LETT #9# (CDR #9#))))
                          (GO G190) G191 (EXIT NIL))
                     (COND (#13# #12#) (#15='T (|spadConstant| % 19)))))
              (EXIT
               (COND ((SPADCALL |fs| |m| (QREFELT % 53)) (CONS 0 |soln|))
                     (#15#
                      (SEQ
                       (LETT |bound| (SPADCALL |m| |lpolys| (QREFELT % 17)))
                       (LETT |a|
                             (PROG2
                                 (LETT #14#
                                       (SPADCALL
                                        (SPADCALL |fs| |m| (QREFELT % 49))
                                        |pmod| (QREFELT % 55)))
                                 (QCDR #14#)
                               (|check_union2| (QEQCAR #14# 0) (QREFELT % 7)
                                               (|Union| (QREFELT % 7) "failed")
                                               #14#)))
                       (EXIT
                        (|GENEEZ;liftSol| |soln| |a| |pmod| |pmod| |lpolys|
                         |ftab| |m| |bound| %))))))))) 

(SDEFUN |GENEEZ;solveid;BPRVU;17!0| ((|x| NIL) ($$ NIL))
        (PROG (|pmod| %)
          (LETT |pmod| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GENEEZ;reduceList| |x| |pmod| %))))) 

(DECLAIM (NOTINLINE |GenExEuclid;|)) 

(DEFUN |GenExEuclid;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GenExEuclid| DV$1 DV$2))
          (LETT % (GETREFV 82))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GenExEuclid| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#1| '(|multiplicativeValuation|))
            (QSETREFV % 17
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;1|)
                            %)))
           ((|HasCategory| |#1| '(|additiveValuation|))
            (QSETREFV % 17
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;2|)
                            %)))
           ('T
            (QSETREFV % 17
                      (CONS (|dispatchFunction| |GENEEZ;compBound;BPLNni;3|)
                            %))))
          (COND
           ((|HasCategory| |#1| '(|IntegerNumberSystem|))
            (QSETREFV % 25
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;4|)
                            %)))
           ('T
            (QSETREFV % 25
                      (CONS (|dispatchFunction| |GENEEZ;reduction;BPRBP;5|)
                            %))))
          (QSETREFV % 37
                    (|EuclideanModularRing| |#1| |#2| |#1| (ELT % 25)
                                            (CONS (|function| |GENEEZ;merge|)
                                                  %)
                                            (CONS
                                             (|function| |GENEEZ;exactquo|)
                                             %)))
          (COND
           ((|HasCategory| |#1| '(|Field|))
            (PROGN
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;14|)
                             %))
             (QSETREFV % 72
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;15|)
                             %))))
           ('T
            (PROGN
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |GENEEZ;tablePow;NniRLU;16|)
                             %))
             (QSETREFV % 72
                       (CONS (|dispatchFunction| |GENEEZ;solveid;BPRVU;17|)
                             %)))))
          %))) 

(DEFUN |GenExEuclid| (&REST #1=#:G262)
  (SPROG NIL
         (PROG (#2=#:G263)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GenExEuclid|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GenExEuclid;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|GenExEuclid|)))))))))) 

(MAKEPROP '|GenExEuclid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |degree|) (|List| 6)
              (5 . |coefficients|) (10 . |euclideanSize|) (|Integer|)
              (|IntegerRoots| 13) (15 . |approxSqrt|) (|List| 7)
              (20 . |compBound|) (26 . |0|) (30 . |0|) (|Boolean|) (34 . =)
              (40 . |symmetricRemainder|) (|Mapping| 6 6) (46 . |map|)
              (52 . |reduction|) (58 . |rem|) (64 . |1|) (68 . |1|)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 29 '#1="failed") (72 . |extendedEuclidean|)
              (79 . |leadingCoefficient|) (84 . *)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (90 . |monicDivide|) (96 . ~=) 'FP (102 . |reduce|)
              (108 . |coerce|) (|List| 37) (|Vector| 40) (113 . |elt|)
              (119 . |0|) (123 . |coefficient|) (129 . ~=) (135 . |coerce|)
              (140 . *) (146 . +) (152 . -) (158 . *) (164 . *) (170 . +)
              (176 . =) (|Union| % '"failed") (182 . |exquo|) (188 . ~=)
              (194 . |gcd|) (200 . |1|) (204 . ~=) |GENEEZ;testModulus;RLB;13|
              (|Union| 62 '#1#) (|List| %) (210 . |multiEuclidean|)
              (|Vector| 16) (216 . |setelt!|) (223 . |monomial|) (229 . |elt|)
              (235 . |rem|) (|Union| 64 '#2="failed") (241 . |tablePow|)
              (|Union| 16 '"failed") (248 . |solveid|) (255 . |multiEuclidean|)
              (261 . |setelt!|) (268 . |rem|) (|Mapping| 16 40)
              (|VectorFunctions2| 40 16) (274 . |map|) (|Mapping| 40 16)
              (|VectorFunctions2| 16 40) (280 . |map|))
           '#(|testModulus| 286 |tablePow| 292 |solveid| 299 |reduction| 306
              |compBound| 312)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|reduction| (|#2| |#2| |#1|)) T)
                                   '((|compBound|
                                      ((|NonNegativeInteger|) |#2|
                                       (|List| |#2|)))
                                     T)
                                   '((|tablePow|
                                      ((|Union| (|Vector| (|List| |#2|)) #2#)
                                       (|NonNegativeInteger|) |#1|
                                       (|List| |#2|)))
                                     T)
                                   '((|solveid|
                                      ((|Union| (|List| |#2|) "failed") |#2|
                                       |#1| (|Vector| (|List| |#2|))))
                                     T)
                                   '((|testModulus|
                                      ((|Boolean|) |#1| (|List| |#2|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 81
                                            '(1 7 8 0 9 1 7 10 0 11 1 6 8 0 12
                                              1 14 13 13 15 2 0 8 7 16 17 0 6 0
                                              18 0 7 0 19 2 6 20 0 0 21 2 6 0 0
                                              0 22 2 7 0 23 0 24 2 0 7 7 6 25 2
                                              6 0 0 0 26 0 6 0 27 0 7 0 28 3 6
                                              30 0 0 0 31 1 7 6 0 32 2 7 0 6 0
                                              33 2 7 34 0 0 35 2 7 20 0 0 36 2
                                              37 0 7 6 38 1 37 7 0 39 2 41 40 0
                                              13 42 0 37 0 43 2 7 6 0 8 44 2 6
                                              20 0 0 45 1 7 0 6 46 2 37 0 0 0
                                              47 2 37 0 0 0 48 2 7 0 0 0 49 2 6
                                              0 0 0 50 2 7 0 0 0 51 2 7 0 0 0
                                              52 2 7 20 0 0 53 2 7 54 0 6 55 2
                                              8 20 0 0 56 2 37 0 0 0 57 0 37 0
                                              58 2 37 20 0 0 59 2 7 61 62 0 63
                                              3 64 16 0 13 16 65 2 7 0 6 8 66 2
                                              64 16 0 13 67 2 7 0 0 0 68 3 0 69
                                              8 6 16 70 3 0 71 7 6 64 72 2 37
                                              61 62 0 73 3 41 40 0 13 40 74 2
                                              37 0 0 0 75 2 77 64 76 41 78 2 80
                                              41 79 64 81 2 0 20 6 16 60 3 0 69
                                              8 6 16 70 3 0 71 7 6 64 72 2 0 7
                                              7 6 25 2 0 8 7 16 17)))))
           '|lookupComplete|)) 
