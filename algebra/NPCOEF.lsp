
(SDEFUN |NPCOEF;npcoef;SupLLR;1|
        ((|u| (|SparseUnivariatePolynomial| P)) (|factlist| (|List| BP))
         (|leadlist| (|List| P))
         (%
          (|Record| (|:| |deter| (|List| (|SparseUnivariatePolynomial| P)))
                    (|:| |dterm|
                         (|List|
                          (|List|
                           (|Record| (|:| |expt| (|NonNegativeInteger|))
                                     (|:| |pcoef| P)))))
                    (|:| |nfacts| (|List| BP)) (|:| |nlead| (|List| P)))))
        (SPROG
         ((#1=#:G66 NIL) (|v| NIL) (#2=#:G67 NIL) (#3=#:G68 NIL) (#4=#:G69 NIL)
          (|ulist| (|Vector| P)) (#5=#:G70 NIL) (|lcu| NIL) (#6=#:G72 NIL)
          (#7=#:G71 NIL)
          (|ldtcf|
           (|List|
            (|List|
             #8=(|Record| (|:| |expt| (|NonNegativeInteger|))
                          (|:| |pcoef| P)))))
          (#9=#:G73 NIL) (|ep| NIL) (#10=#:G74 NIL)
          (|lexp| (|List| (|List| (|NonNegativeInteger|))))
          (|dt| (|NonNegativeInteger|)) (#11=#:G75 NIL)
          (|cf|
           (|Union|
            (|Record| (|:| |valexp| #12=(|NonNegativeInteger|))
                      (|:| |valcoef| P)
                      (|:| |posit| #13=(|NonNegativeInteger|)))
            "failed" "reject"))
          (|celtf|
           (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                     (|:| |posit| (|NonNegativeInteger|))))
          (|vpos| #13#) (|vexp| #12#) (|nterm| #8#) (#14=#:G37 NIL)
          (|ndet| (|NonNegativeInteger|)) (|changed| (|Boolean|))
          (#15=#:G76 NIL)
          (|tablecoef|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P))))))))
          (|ltochange| #16=(|List| (|NonNegativeInteger|))) (|pol| NIL)
          (#17=#:G77 NIL) (#18=#:G49 #19=(|SparseUnivariatePolynomial| P))
          (#20=#:G47 #19#) (#21=#:G48 NIL)
          (|uu| (|Union| (|SparseUnivariatePolynomial| P) "failed"))
          (#22=#:G65 NIL)
          (|detufact| (|List| (|SparseUnivariatePolynomial| P)))
          (|ltodel| #16#) (|i| NIL) (#23=#:G78 NIL)
          (|detcoef|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))))
         (SEQ
          (EXIT
           (SEQ (LETT |detcoef| NIL) (LETT |detufact| NIL)
                (LETT |lexp|
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |v| NIL) (LETT #2# |factlist|) G190
                            (COND
                             ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1# (CONS (|NPCOEF;listexp| |v| %) #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))
                (LETT |ulist|
                      (SPADCALL
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |i| 0)
                             (LETT #4# (SPADCALL |u| (QREFELT % 13))) G190
                             (COND ((|greater_SI| |i| #4#) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS (SPADCALL |u| |i| (QREFELT % 14))
                                           #3#))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT % 17)))
                (LETT |tablecoef|
                      (|NPCOEF;buildtable| |ulist| |lexp| |leadlist| %))
                (LETT |detcoef|
                      (PROGN
                       (LETT #5# NIL)
                       (SEQ (LETT |lcu| NIL) (LETT #6# |leadlist|)
                            (LETT |ep| NIL) (LETT #7# |lexp|) G190
                            (COND
                             ((OR (ATOM #7#) (PROGN (LETT |ep| (CAR #7#)) NIL)
                                  (ATOM #6#)
                                  (PROGN (LETT |lcu| (CAR #6#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #5#
                                    (CONS
                                     (LIST (CONS (|SPADfirst| |ep|) |lcu|))
                                     #5#))))
                            (LETT #7# (PROG1 (CDR #7#) (LETT #6# (CDR #6#))))
                            (GO G190) G191 (EXIT (NREVERSE #5#)))))
                (LETT |ldtcf| |detcoef|)
                (LETT |lexp|
                      (PROGN
                       (LETT #9# NIL)
                       (SEQ (LETT |ep| NIL) (LETT #10# |lexp|) G190
                            (COND
                             ((OR (ATOM #10#)
                                  (PROGN (LETT |ep| (CAR #10#)) NIL))
                              (GO G191)))
                            (SEQ (EXIT (LETT #9# (CONS (CDR |ep|) #9#))))
                            (LETT #10# (CDR #10#)) (GO G190) G191
                            (EXIT (NREVERSE #9#)))))
                (LETT |ndet| (LENGTH |factlist|)) (LETT |changed| 'T)
                (LETT |ltochange| NIL) (LETT |ltodel| NIL)
                (SEQ G190
                     (COND
                      ((NULL
                        (COND (|changed| (SPADCALL |ndet| 1 (QREFELT % 21)))
                              ('T NIL)))
                       (GO G191)))
                     (SEQ (LETT |changed| NIL) (LETT |dt| (LENGTH |tablecoef|))
                          (SEQ (LETT |i| 1) (LETT #11# |dt|) G190
                               (COND
                                ((OR (|greater_SI| |i| #11#)
                                     (NULL (NULL |changed|)))
                                 (GO G191)))
                               (SEQ
                                (LETT |cf|
                                      (|NPCOEF;check|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT % 26))
                                       |ulist| %))
                                (EXIT
                                 (COND ((QEQCAR |cf| 1) "next i")
                                       ((QEQCAR |cf| 2)
                                        (PROGN
                                         (LETT #22#
                                               (VECTOR NIL NIL |factlist|
                                                       |leadlist|))
                                         (GO #24=#:G64)))
                                       ('T
                                        (SEQ
                                         (LETT |ltochange|
                                               (CONS |i| |ltochange|))
                                         (LETT |celtf| (QCDR |cf|))
                                         (LETT |tablecoef|
                                               (|NPCOEF;modify| |tablecoef|
                                                |celtf| %))
                                         (LETT |vpos| (QVELT |celtf| 2))
                                         (LETT |vexp| (QVELT |celtf| 0))
                                         (LETT |nterm|
                                               (CONS |vexp| (QVELT |celtf| 1)))
                                         (SPADCALL |detcoef| |vpos|
                                                   (CONS |nterm|
                                                         (SPADCALL |detcoef|
                                                                   |vpos|
                                                                   (QREFELT %
                                                                            29)))
                                                   (QREFELT % 30))
                                         (SPADCALL |lexp| |vpos|
                                                   (SPADCALL
                                                    (SPADCALL |lexp| |vpos|
                                                              (QREFELT % 33))
                                                    (SPADCALL |vexp|
                                                              (SPADCALL |lexp|
                                                                        |vpos|
                                                                        (QREFELT
                                                                         % 33))
                                                              (QREFELT % 34))
                                                    (QREFELT % 35))
                                                   (QREFELT % 36))
                                         (COND
                                          ((SPADCALL
                                            (SPADCALL |lexp| |vpos|
                                                      (QREFELT % 33))
                                            NIL (QREFELT % 37))
                                           (SEQ
                                            (LETT |ltodel|
                                                  (CONS |vpos| |ltodel|))
                                            (LETT |ndet|
                                                  (PROG1
                                                      (LETT #14# (- |ndet| 1))
                                                    (|check_subtype2|
                                                     (>= #14# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #14#)))
                                            (EXIT
                                             (LETT |detufact|
                                                   (CONS
                                                    (|NPCOEF;constructp|
                                                     (SPADCALL |detcoef| |vpos|
                                                               (QREFELT % 29))
                                                     %)
                                                    |detufact|))))))
                                         (EXIT (LETT |changed| 'T)))))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (SEQ (LETT |i| NIL) (LETT #15# |ltochange|) G190
                               (COND
                                ((OR (ATOM #15#)
                                     (PROGN (LETT |i| (CAR #15#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |tablecoef|
                                       (SPADCALL |tablecoef| |i|
                                                 (QREFELT % 38)))))
                               (LETT #15# (CDR #15#)) (GO G190) G191
                               (EXIT NIL))
                          (EXIT (LETT |ltochange| NIL)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((EQL |ndet| 1)
                  (SEQ
                   (LETT |uu|
                         (SPADCALL |u|
                                   (PROGN
                                    (LETT #21# NIL)
                                    (SEQ (LETT |pol| NIL)
                                         (LETT #17# |detufact|) G190
                                         (COND
                                          ((OR (ATOM #17#)
                                               (PROGN
                                                (LETT |pol| (CAR #17#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (PROGN
                                            (LETT #18# |pol|)
                                            (COND
                                             (#21#
                                              (LETT #20#
                                                    (SPADCALL #20# #18#
                                                              (QREFELT % 39))))
                                             ('T
                                              (PROGN
                                               (LETT #20# #18#)
                                               (LETT #21# 'T)))))))
                                         (LETT #17# (CDR #17#)) (GO G190) G191
                                         (EXIT NIL))
                                    (COND (#21# #20#)
                                          (#25='T (|spadConstant| % 40))))
                                   (QREFELT % 42)))
                   (EXIT
                    (COND
                     ((QEQCAR |uu| 1)
                      (PROGN
                       (LETT #22# (VECTOR NIL |ldtcf| |factlist| |leadlist|))
                       (GO #24#)))
                     (#25# (LETT |detufact| (CONS (QCDR |uu|) |detufact|)))))))
                 (#25#
                  (SEQ
                   (LETT |ltodel|
                         (SPADCALL (ELT % 43) |ltodel| (QREFELT % 45)))
                   (EXIT
                    (SEQ (LETT |i| NIL) (LETT #23# |ltodel|) G190
                         (COND
                          ((OR (ATOM #23#) (PROGN (LETT |i| (CAR #23#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |detcoef|
                                (SPADCALL |detcoef| |i| (QREFELT % 46)))
                          (LETT |factlist|
                                (SPADCALL |factlist| |i| (QREFELT % 48)))
                          (EXIT
                           (LETT |leadlist|
                                 (SPADCALL |leadlist| |i| (QREFELT % 49)))))
                         (LETT #23# (CDR #23#)) (GO G190) G191 (EXIT NIL))))))
                (EXIT (VECTOR |detufact| |detcoef| |factlist| |leadlist|))))
          #24# (EXIT #22#)))) 

(SDEFUN |NPCOEF;check|
        ((|tterm|
          (|Record| (|:| |coefu| P)
                    (|:| |detfacts|
                         #1=(|List|
                             (|List|
                              (|Record| (|:| |expt| (|NonNegativeInteger|))
                                        (|:| |pcoef| P)))))))
         (|ulist| (|Vector| P))
         (%
          (|Union|
           (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                     (|:| |posit| (|NonNegativeInteger|)))
           "failed" "reject")))
        (SPROG
         ((|termlist| #1#)
          (|vterm|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
          (|elterm| NIL) (#2=#:G102 NIL) (|cu1| (P)) (|cfu| (P))
          (|doit| #3=(|NonNegativeInteger|)) (#4=#:G93 NIL) (|poselt| #3#)
          (|pp| (|Union| P "failed")))
         (SEQ (LETT |cfu| (|spadConstant| % 52)) (LETT |doit| 0)
              (LETT |poselt| 0) (LETT |termlist| (QCDR |tterm|))
              (LETT |vterm| NIL)
              (EXIT
               (COND
                ((EQL (LENGTH |termlist|) 1)
                 (SEQ (LETT |vterm| (|SPADfirst| |termlist|))
                      (SEQ (LETT |elterm| NIL) (LETT #2# |vterm|) G190
                           (COND
                            ((OR (ATOM #2#)
                                 (PROGN (LETT |elterm| (CAR #2#)) NIL)
                                 (NULL (< |doit| 2)))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL (LETT |cu1| (QCDR |elterm|))
                                         (|spadConstant| % 53) (QREFELT % 54))
                               (LETT |cfu|
                                     (SPADCALL |cu1| |cfu| (QREFELT % 55))))
                              ('T
                               (SEQ (LETT |doit| (+ |doit| 1))
                                    (EXIT
                                     (LETT |poselt|
                                           (PROG1
                                               (LETT #4#
                                                     (SPADCALL |elterm| |vterm|
                                                               (QREFELT % 56)))
                                             (|check_subtype2| (>= #4# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #4#)))))))))
                           (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((EQL |doit| 2) (CONS 1 "failed"))
                             ((EQL |doit| 0)
                              (COND
                               ((SPADCALL (QCAR |tterm|) |cfu| (QREFELT % 59))
                                (CONS 1 "failed"))
                               (#5='T (CONS 2 "reject"))))
                             (#5#
                              (SEQ
                               (LETT |pp|
                                     (SPADCALL (QCAR |tterm|) |cfu|
                                               (QREFELT % 60)))
                               (EXIT
                                (COND ((QEQCAR |pp| 1) (CONS 2 "reject"))
                                      (#5#
                                       (CONS 0
                                             (VECTOR
                                              (QCAR
                                               (SPADCALL |vterm| |poselt|
                                                         (QREFELT % 61)))
                                              (QCDR |pp|) |poselt|)))))))))))
                (#5# (CONS 1 "failed"))))))) 

(SDEFUN |NPCOEF;buildvect|
        ((|lvterm|
          (|List|
           (|List|
            (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
         (|n| (|NonNegativeInteger|))
         (%
          (|Vector|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|))
                       (|:| |pcoef| P)))))))
        (SPROG
         ((#1=#:G121 NIL)
          (|vtable|
           #2=(|Vector|
               (|List|
                (|List|
                 (|Record| (|:| |expt| (|NonNegativeInteger|))
                           (|:| |pcoef| P))))))
          (|ntable| #2#) (|term| NIL) (#3=#:G122 NIL)
          (|nexp| (|NonNegativeInteger|)) (|i| NIL) (#4=#:G123 NIL)
          (#5=#:G124 NIL) (#6=#:G125 NIL))
         (SEQ (LETT |vtable| (MAKEARR1 |n| NIL))
              (EXIT
               (COND
                ((EQL (LENGTH |lvterm|) 1)
                 (SEQ
                  (SEQ (LETT |term| NIL) (LETT #1# (|SPADfirst| |lvterm|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |vtable| (+ (QCAR |term|) 1)
                                   (LIST (LIST |term|)) (QREFELT % 63))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |vtable|)))
                ('T
                 (SEQ (LETT |vtable| (|NPCOEF;buildvect| (CDR |lvterm|) |n| %))
                      (LETT |ntable| (MAKEARR1 |n| NIL))
                      (SEQ (LETT |term| NIL) (LETT #3# (|SPADfirst| |lvterm|))
                           G190
                           (COND
                            ((OR (ATOM #3#)
                                 (PROGN (LETT |term| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |nexp| (QCAR |term|))
                                (EXIT
                                 (SEQ (LETT |i| 1) (LETT #4# |n|) G190
                                      (COND
                                       ((OR (|greater_SI| |i| #4#)
                                            (NULL
                                             (< (+ |nexp| |i|) (+ |n| 1))))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SPADCALL |ntable| (+ |nexp| |i|)
                                                  (SPADCALL
                                                   (PROGN
                                                    (LETT #5# NIL)
                                                    (SEQ
                                                     (LETT #6#
                                                           (SPADCALL |vtable|
                                                                     |i|
                                                                     (QREFELT %
                                                                              64)))
                                                     G190
                                                     (COND
                                                      ((OR (ATOM #6#)
                                                           (PROGN
                                                            (LETT |lvterm|
                                                                  (CAR #6#))
                                                            NIL))
                                                       (GO G191)))
                                                     (SEQ
                                                      (EXIT
                                                       (LETT #5#
                                                             (CONS
                                                              (CONS |term|
                                                                    |lvterm|)
                                                              #5#))))
                                                     (LETT #6# (CDR #6#))
                                                     (GO G190) G191
                                                     (EXIT (NREVERSE #5#))))
                                                   (SPADCALL |ntable|
                                                             (+ |nexp| |i|)
                                                             (QREFELT % 64))
                                                   (QREFELT % 65))
                                                  (QREFELT % 63))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT |ntable|)))))))) 

(SDEFUN |NPCOEF;buildtable|
        ((|vu| (|Vector| P)) (|lvect| (|List| (|List| (|NonNegativeInteger|))))
         (|leadlist| (|List| P))
         (%
          (|List|
           (|Record| (|:| |coefu| P)
                     (|:| |detfacts|
                          (|List|
                           (|List|
                            (|Record| (|:| |expt| (|NonNegativeInteger|))
                                      (|:| |pcoef| P)))))))))
        (SPROG
         ((|nfact| (|NonNegativeInteger|)) (#1=#:G127 NIL)
          (|degu| (|NonNegativeInteger|)) (#2=#:G139 NIL) (|lv| NIL)
          (#3=#:G140 NIL) (#4=#:G141 NIL) (|e| NIL) (#5=#:G142 NIL)
          (|prelim|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (#6=#:G143 NIL)
          (|partialv|
           (|Vector|
            (|List|
             (|List|
              (|Record| (|:| |expt| (|NonNegativeInteger|))
                        (|:| |pcoef| P))))))
          (|i| NIL) (#7=#:G144 NIL)
          (|table|
           (|List|
            (|Record| (|:| |coefu| P)
                      (|:| |detfacts|
                           (|List|
                            (|List|
                             (|Record| (|:| |expt| (|NonNegativeInteger|))
                                       (|:| |pcoef| P)))))))))
         (SEQ (LETT |nfact| (LENGTH |leadlist|)) (LETT |table| NIL)
              (LETT |degu|
                    (PROG1 (LETT #1# (- (QVSIZE |vu|) 1))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |prelim|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |lv| NIL) (LETT #3# |lvect|) G190
                          (COND
                           ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |e| NIL) (LETT #5# |lv|) G190
                                         (COND
                                          ((OR (ATOM #5#)
                                               (PROGN
                                                (LETT |e| (CAR #5#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (CONS |e|
                                                        (|spadConstant| % 53))
                                                  #4#))))
                                         (LETT #5# (CDR #5#)) (GO G190) G191
                                         (EXIT (NREVERSE #4#))))
                                   #2#))))
                          (LETT #3# (CDR #3#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (SEQ (LETT |i| 1) (LETT #6# |nfact|) G190
                   (COND ((|greater_SI| |i| #6#) (GO G191)))
                   (SEQ
                    (EXIT
                     (PROGN
                      (RPLACD
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT % 29)))
                       (SPADCALL |leadlist| |i| (QREFELT % 66)))
                      (QCDR
                       (|SPADfirst| (SPADCALL |prelim| |i| (QREFELT % 29)))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |partialv| (MAKEARR1 |nfact| NIL))
              (LETT |partialv| (|NPCOEF;buildvect| |prelim| |degu| %))
              (SEQ (LETT |i| 1) (LETT #7# |degu|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |partialv| |i| (QREFELT % 64)))
                       "next i")
                      ('T
                       (LETT |table|
                             (CONS
                              (CONS (SPADCALL |vu| |i| (QREFELT % 67))
                                    (SPADCALL |partialv| |i| (QREFELT % 64)))
                              |table|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |table|)))) 

(SDEFUN |NPCOEF;modify|
        ((|tablecoef|
          (|List|
           (|Record| (|:| |coefu| P)
                     (|:| |detfacts|
                          (|List|
                           (|List|
                            (|Record| (|:| |expt| (|NonNegativeInteger|))
                                      (|:| |pcoef| P))))))))
         (|cfter|
          (|Record| (|:| |valexp| (|NonNegativeInteger|)) (|:| |valcoef| P)
                    (|:| |posit| (|NonNegativeInteger|))))
         (%
          (|List|
           (|Record| (|:| |coefu| P)
                     (|:| |detfacts|
                          (|List|
                           (|List|
                            (|Record| (|:| |expt| (|NonNegativeInteger|))
                                      (|:| |pcoef| P)))))))))
        (SPROG
         ((|cfexp| (|NonNegativeInteger|)) (|cfcoef| (P))
          (|cfpos| (|NonNegativeInteger|)) (|cterm| NIL) (#1=#:G201 NIL)
          (|term| NIL) (#2=#:G202 NIL) (#3=#:G173 #4=(|NonNegativeInteger|))
          (#5=#:G171 #4#) (#6=#:G172 NIL) (|celt| NIL) (#7=#:G203 NIL)
          (#8=#:G204 NIL) (#9=#:G177 #10=(|Boolean|)) (#11=#:G175 #10#)
          (#12=#:G176 NIL) (#13=#:G185 NIL) (|k| (|NonNegativeInteger|))
          (|cc| NIL) (#14=#:G205 NIL) (#15=#:G188 (P)) (#16=#:G186 (P))
          (#17=#:G187 NIL) (|i| NIL) (#18=#:G206 NIL)
          (|ctdet|
           (|List|
            (|List|
             (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P)))))
          (|lterase| (|List| (|NonNegativeInteger|))))
         (SEQ (LETT |cfexp| (QVELT |cfter| 0))
              (LETT |cfcoef| (QVELT |cfter| 1))
              (LETT |cfpos| (QVELT |cfter| 2)) (LETT |lterase| NIL)
              (SEQ (LETT |cterm| NIL) (LETT #1# |tablecoef|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |cterm| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (NULL (LETT |ctdet| (QCDR |cterm|))))
                       (COND
                        ((<
                          (PROGN
                           (LETT #6# NIL)
                           (SEQ (LETT |term| NIL)
                                (LETT #2# (|SPADfirst| |ctdet|)) G190
                                (COND
                                 ((OR (ATOM #2#)
                                      (PROGN (LETT |term| (CAR #2#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #3# (QCAR |term|))
                                   (COND (#6# (LETT #5# (+ #5# #3#)))
                                         ('T
                                          (PROGN
                                           (LETT #5# #3#)
                                           (LETT #6# 'T)))))))
                                (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                           (COND (#6# #5#) ('T 0)))
                          |cfexp|)
                         "next term")
                        ('T
                         (SEQ
                          (SEQ (LETT |celt| NIL) (LETT #7# |ctdet|) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |celt| (CAR #7#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((EQL
                                    (QCAR
                                     (SPADCALL |celt| |cfpos| (QREFELT % 61)))
                                    |cfexp|)
                                   (SEQ
                                    (PROGN
                                     (RPLACD
                                      (SPADCALL |celt| |cfpos| (QREFELT % 61))
                                      |cfcoef|)
                                     (QCDR
                                      (SPADCALL |celt| |cfpos|
                                                (QREFELT % 61))))
                                    (EXIT
                                     (COND
                                      ((PROGN
                                        (LETT #12# NIL)
                                        (SEQ (LETT |cc| NIL) (LETT #8# |celt|)
                                             G190
                                             (COND
                                              ((OR (ATOM #8#)
                                                   (PROGN
                                                    (LETT |cc| (CAR #8#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (PROGN
                                                (LETT #9#
                                                      (SPADCALL (QCDR |cc|)
                                                                (|spadConstant|
                                                                 % 53)
                                                                (QREFELT %
                                                                         54)))
                                                (COND
                                                 (#12#
                                                  (LETT #11#
                                                        (COND (#11# #9#)
                                                              ('T NIL))))
                                                 ('T
                                                  (PROGN
                                                   (LETT #11# #9#)
                                                   (LETT #12# 'T)))))))
                                             (LETT #8# (CDR #8#)) (GO G190)
                                             G191 (EXIT NIL))
                                        (COND (#12# #11#) ('T 'T)))
                                       (SEQ
                                        (LETT |k|
                                              (PROG1
                                                  (LETT #13#
                                                        (SPADCALL |celt|
                                                                  |ctdet|
                                                                  (QREFELT %
                                                                           68)))
                                                (|check_subtype2| (>= #13# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #13#)))
                                        (LETT |lterase| (CONS |k| |lterase|))
                                        (EXIT
                                         (PROGN
                                          (RPLACA |cterm|
                                                  (SPADCALL (QCAR |cterm|)
                                                            (PROGN
                                                             (LETT #17# NIL)
                                                             (SEQ
                                                              (LETT |cc| NIL)
                                                              (LETT #14#
                                                                    |celt|)
                                                              G190
                                                              (COND
                                                               ((OR (ATOM #14#)
                                                                    (PROGN
                                                                     (LETT |cc|
                                                                           (CAR
                                                                            #14#))
                                                                     NIL))
                                                                (GO G191)))
                                                              (SEQ
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #15#
                                                                       (QCDR
                                                                        |cc|))
                                                                 (COND
                                                                  (#17#
                                                                   (LETT #16#
                                                                         (SPADCALL
                                                                          #16#
                                                                          #15#
                                                                          (QREFELT
                                                                           %
                                                                           55))))
                                                                  ('T
                                                                   (PROGN
                                                                    (LETT #16#
                                                                          #15#)
                                                                    (LETT #17#
                                                                          'T)))))))
                                                              (LETT #14#
                                                                    (CDR #14#))
                                                              (GO G190) G191
                                                              (EXIT NIL))
                                                             (COND (#17# #16#)
                                                                   ('T
                                                                    (|spadConstant|
                                                                     % 52))))
                                                            (QREFELT % 69)))
                                          (QCAR |cterm|))))))))))))
                               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            ((NULL (NULL |lterase|))
                             (SEQ
                              (LETT |lterase|
                                    (SPADCALL (ELT % 43) |lterase|
                                              (QREFELT % 45)))
                              (SEQ (LETT |i| NIL) (LETT #18# |lterase|) G190
                                   (COND
                                    ((OR (ATOM #18#)
                                         (PROGN (LETT |i| (CAR #18#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |ctdet|
                                           (SPADCALL |ctdet| |i|
                                                     (QREFELT % 46)))))
                                   (LETT #18# (CDR #18#)) (GO G190) G191
                                   (EXIT NIL))
                              (PROGN (RPLACD |cterm| |ctdet|) (QCDR |cterm|))
                              (EXIT (LETT |lterase| NIL)))))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |tablecoef|)))) 

(SDEFUN |NPCOEF;listexp| ((|up| (BP)) (% (|List| (|NonNegativeInteger|))))
        (COND ((EQL (SPADCALL |up| (QREFELT % 70)) 0) (LIST 0))
              ('T
               (CONS (SPADCALL |up| (QREFELT % 70))
                     (|NPCOEF;listexp| (SPADCALL |up| (QREFELT % 71)) %))))) 

(SDEFUN |NPCOEF;constructp|
        ((|lterm|
          (|List|
           (|Record| (|:| |expt| (|NonNegativeInteger|)) (|:| |pcoef| P))))
         (% (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|term| NIL) (#1=#:G213 NIL)
          (#2=#:G211 #3=(|SparseUnivariatePolynomial| P)) (#4=#:G209 #3#)
          (#5=#:G210 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |term| NIL) (LETT #1# |lterm|) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (SPADCALL (QCDR |term|) (QCAR |term|) (QREFELT % 72)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 73))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|spadConstant| % 74))))))) 

(DECLAIM (NOTINLINE |NPCoef;|)) 

(DEFUN |NPCoef;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|NPCoef| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 75))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|NPCoef| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |NPCoef| (&REST #1=#:G214)
  (SPROG NIL
         (PROG (#2=#:G215)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|NPCoef|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |NPCoef;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|NPCoef|)))))))))) 

(MAKEPROP '|NPCoef| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|NonNegativeInteger|) (|SparseUnivariatePolynomial| 10)
              (0 . |degree|) (5 . |coefficient|) (|List| 10) (|Vector| 10)
              (11 . |vector|) (16 . |1|) (20 . |1|) (|Boolean|) (24 . ~=)
              (|Record| (|:| |expt| 11) (|:| |pcoef| 10))
              (|Record| (|:| |coefu| 10) (|:| |detfacts| 28)) (|Integer|)
              (|List| 23) (30 . |elt|) (|List| 22) (|List| 27) (36 . |elt|)
              (42 . |setelt!|) (|List| 11) (|List| 31) (49 . |elt|)
              (55 . |position|) (61 . |delete|) (67 . |setelt!|) (74 . =)
              (80 . |delete|) (86 . *) (92 . |1|) (|Union| % '"failed")
              (96 . |exquo|) (102 . >) (|Mapping| 20 11 11) (108 . |sort|)
              (114 . |delete|) (|List| 6) (120 . |delete|) (126 . |delete|)
              (|Record| (|:| |deter| (|List| 12)) (|:| |dterm| 28)
                        (|:| |nfacts| 47) (|:| |nlead| 15))
              |NPCOEF;npcoef;SupLLR;1| (132 . |1|) (136 . |0|) (140 . ~=)
              (146 . *) (152 . |position|) (158 . |0|) (162 . |0|) (166 . =)
              (172 . |exquo|) (178 . |elt|) (|Vector| 28) (184 . |setelt!|)
              (191 . |elt|) (197 . |append|) (203 . |elt|) (209 . |elt|)
              (215 . |position|) (221 . -) (227 . |degree|) (232 . |reductum|)
              (237 . |monomial|) (243 . +) (249 . |0|))
           '#(|npcoef| 253) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|npcoef|
                                 ((|Record|
                                   (|:| |deter|
                                        (|List|
                                         (|SparseUnivariatePolynomial| |#5|)))
                                   (|:| |dterm|
                                        (|List|
                                         (|List|
                                          (|Record|
                                           (|:| |expt| (|NonNegativeInteger|))
                                           (|:| |pcoef| |#5|)))))
                                   (|:| |nfacts| (|List| |#1|))
                                   (|:| |nlead| (|List| |#5|)))
                                  (|SparseUnivariatePolynomial| |#5|)
                                  (|List| |#1|) (|List| |#5|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 74
                                            '(1 12 11 0 13 2 12 10 0 11 14 1 16
                                              0 15 17 0 6 0 18 0 9 0 19 2 11 20
                                              0 0 21 2 25 23 0 24 26 2 28 27 0
                                              24 29 3 28 27 0 24 27 30 2 32 31
                                              0 24 33 2 31 24 11 0 34 2 31 0 0
                                              24 35 3 32 31 0 24 31 36 2 31 20
                                              0 0 37 2 25 0 0 24 38 2 12 0 0 0
                                              39 0 12 0 40 2 12 41 0 0 42 2 11
                                              20 0 0 43 2 31 0 44 0 45 2 28 0 0
                                              24 46 2 47 0 0 24 48 2 15 0 0 24
                                              49 0 10 0 52 0 10 0 53 2 10 20 0
                                              0 54 2 10 0 0 0 55 2 27 24 22 0
                                              56 0 6 0 57 0 7 0 58 2 10 20 0 0
                                              59 2 10 41 0 0 60 2 27 22 0 24 61
                                              3 62 28 0 24 28 63 2 62 28 0 24
                                              64 2 28 0 0 0 65 2 15 10 0 24 66
                                              2 16 10 0 24 67 2 28 24 27 0 68 2
                                              10 0 0 0 69 1 6 11 0 70 1 6 0 0
                                              71 2 12 0 10 11 72 2 12 0 0 0 73
                                              0 12 0 74 3 0 50 12 47 15 51)))))
           '|lookupComplete|)) 
