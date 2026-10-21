
(SDEFUN |ODEPAL;rat_solve|
        ((|l| (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP)))
         (|lf| (|List| (|Fraction| UP)))
         (%
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| (|Fraction| UP))
                           (|:| |coeffs| (|Vector| (|Fraction| UP))))))
           (|:| |basis| (|List| (|Fraction| UP))))))
        (SPROG
         ((|sol|
           (|Record| (|:| |basis| #1=(|List| (|Fraction| UP)))
                     (|:| |mat| (|Matrix| F))))
          (|bas| #1#) (|ker| (|List| (|Vector| F)))
          (|nb| #2=(|NonNegativeInteger|)) (#3=#:G29 NIL) (|kv| NIL)
          (#4=#:G30 NIL) (|m1| (|Matrix| F)) (|nn| #2#)
          (|nc| (|NonNegativeInteger|)) (|m3| (|Matrix| F))
          (|nr| (|NonNegativeInteger|)) (#5=#:G31 NIL) (|j| (|Integer|))
          (|i0| (|Integer|)) (#6=#:G28 NIL) (|cv| (|Vector| (|Fraction| UP)))
          (#7=#:G32 NIL) (#8=#:G34 NIL) (#9=#:G33 NIL)
          (|sl|
           (|List|
            (|Record| (|:| |ratpart| (|Fraction| UP))
                      (|:| |coeffs| (|Vector| (|Fraction| UP))))))
          (|i| NIL) (#10=#:G35 NIL) (|bf| NIL) (#11=#:G37 NIL) (|k| NIL)
          (#12=#:G36 NIL) (|s| (|Fraction| UP))
          (|bl| (|List| (|Fraction| UP))))
         (SEQ (LETT |sol| (SPADCALL |l| |lf| (QREFELT % 14)))
              (LETT |bas| (QCAR |sol|))
              (LETT |ker| (SPADCALL (QCDR |sol|) (QREFELT % 17)))
              (EXIT
               (COND ((NULL |ker|) (CONS NIL NIL))
                     ('T
                      (SEQ (LETT |nn| (LENGTH |lf|)) (LETT |nb| (LENGTH |bas|))
                           (COND
                            ((SPADCALL |nb| (ANCOLS (QCDR |sol|))
                                       (QREFELT % 20))
                             (|error| "rat_solve: nb ~= ncols(sol.mat)")))
                           (LETT |m1|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #3# NIL)
                                   (SEQ (LETT |kv| NIL) (LETT #4# |ker|) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |kv| (CAR #4#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #3#
                                                (CONS
                                                 (SPADCALL |kv| (QREFELT % 23))
                                                 #3#))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT (NREVERSE #3#))))
                                  (QREFELT % 25)))
                           (LETT |nn| (LENGTH |lf|)) (LETT |nc| (ANCOLS |m1|))
                           (LETT |m3| (SPADCALL |m1| (QREFELT % 26)))
                           (LETT |nr| (ANROWS |m3|)) (LETT |j| 1)
                           (LETT |i0| (+ |nr| 1)) (LETT |sl| NIL)
                           (SEQ
                            (EXIT
                             (SEQ (LETT |i| 1) (LETT #5# |nr|) G190
                                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                                  (SEQ
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (COND
                                            ((<= |j| |nn|)
                                             (SPADCALL
                                              (SPADCALL |m3| |i| |j|
                                                        (QREFELT % 30))
                                              (|spadConstant| % 31)
                                              (QREFELT % 32)))
                                            ('T NIL)))
                                          (GO G191)))
                                        (SEQ (EXIT (LETT |j| (+ |j| 1)))) NIL
                                        (GO G190) G191 (EXIT NIL))
                                   (COND
                                    ((> |j| |nn|)
                                     (SEQ (LETT |i0| |i|)
                                          (EXIT
                                           (PROGN
                                            (LETT #6# |$NoValue|)
                                            (GO #13=#:G19))))))
                                   (LETT |cv|
                                         (MAKEARR1 |nn| (|spadConstant| % 35)))
                                   (SEQ (LETT |k| 1) (LETT #7# |nn|) G190
                                        (COND
                                         ((|greater_SI| |k| #7#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (SPADCALL |cv| |k|
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |m3| |i| |k|
                                                                (QREFELT % 30))
                                                      (QREFELT % 36))
                                                     (QREFELT % 37))
                                                    (QREFELT % 39))))
                                        (LETT |k| (|inc_SI| |k|)) (GO G190)
                                        G191 (EXIT NIL))
                                   (LETT |s| (|spadConstant| % 35))
                                   (SEQ (LETT |bf| NIL) (LETT #8# |bas|)
                                        (LETT |k| 1) (LETT #9# |nc|) G190
                                        (COND
                                         ((OR (|greater_SI| |k| #9#) (ATOM #8#)
                                              (PROGN
                                               (LETT |bf| (CAR #8#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT |s|
                                                (SPADCALL |s|
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (SPADCALL |m3| |i|
                                                                      |k|
                                                                      (QREFELT
                                                                       % 30))
                                                            (QREFELT % 36))
                                                           |bf| (QREFELT % 40))
                                                          (QREFELT % 41)))))
                                        (LETT |k|
                                              (PROG1 (|inc_SI| |k|)
                                                (LETT #8# (CDR #8#))))
                                        (GO G190) G191 (EXIT NIL))
                                   (EXIT
                                    (LETT |sl| (CONS (CONS |s| |cv|) |sl|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL)))
                            #13# (EXIT #6#))
                           (LETT |bl| NIL)
                           (SEQ (LETT |i| |i0|) (LETT #10# |nr|) G190
                                (COND ((> |i| #10#) (GO G191)))
                                (SEQ (LETT |s| (|spadConstant| % 35))
                                     (SEQ (LETT |bf| NIL) (LETT #11# |bas|)
                                          (LETT |k| 1) (LETT #12# |nc|) G190
                                          (COND
                                           ((OR (|greater_SI| |k| #12#)
                                                (ATOM #11#)
                                                (PROGN
                                                 (LETT |bf| (CAR #11#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT |s|
                                                  (SPADCALL |s|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |m3|
                                                                        |i| |k|
                                                                        (QREFELT
                                                                         % 30))
                                                              (QREFELT % 36))
                                                             |bf|
                                                             (QREFELT % 40))
                                                            (QREFELT % 41)))))
                                          (LETT |k|
                                                (PROG1 (|inc_SI| |k|)
                                                  (LETT #11# (CDR #11#))))
                                          (GO G190) G191 (EXIT NIL))
                                     (EXIT (LETT |bl| (CONS |s| |bl|))))
                                (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                           (EXIT (CONS |sl| |bl|))))))))) 

(SDEFUN |ODEPAL;RF_to_F| ((|rf| (|Fraction| UP)) (% (F)))
        (SPADCALL (SPADCALL |rf| (QREFELT % 42)) (QREFELT % 43))) 

(SDEFUN |ODEPAL;V_to_VF| ((|v| (|Vector| (|Fraction| UP))) (% (|Vector| F)))
        (SPADCALL (CONS (|function| |ODEPAL;RF_to_F|) %) |v| (QREFELT % 46))) 

(SDEFUN |ODEPAL;algDsolve;LodoLR;4|
        ((|l| (|LinearOrdinaryDifferentialOperator1| R)) (|lg| (|List| R))
         (%
          (|Record|
           (|:| |particular|
                (|List|
                 (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
           (|:| |basis| (|List| R)))))
        (SPROG
         ((|rec|
           (|Record|
            (|:| |mat|
                 (|Matrix|
                  (|LinearOrdinaryDifferentialOperator1| (|Fraction| UP))))
            (|:| |vecs| (|List| (|Vector| (|Fraction| UP))))))
          (|sol|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| (|Vector| (|Fraction| UP)))
                            (|:| |coeffs| (|Vector| (|Fraction| UP))))))
            (|:| |basis| (|List| (|Vector| (|Fraction| UP))))))
          (#1=#:G63 NIL) (|v| NIL) (#2=#:G64 NIL) (|bas| (|List| R))
          (#3=#:G65 NIL) (|be| NIL) (#4=#:G66 NIL)
          (|part|
           (|List| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))))
         (SEQ (LETT |rec| (SPADCALL |l| |lg| (QREFELT % 51)))
              (LETT |sol|
                    (SPADCALL (QCAR |rec|) (QCDR |rec|)
                              (CONS (|function| |ODEPAL;rat_solve|) %)
                              (QREFELT % 60)))
              (LETT |bas|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |v| NIL) (LETT #2# (QCDR |sol|)) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |v| (QREFELT % 61)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |part|
                    (PROGN
                     (LETT #3# NIL)
                     (SEQ (LETT |be| NIL) (LETT #4# (QCAR |sol|)) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |be| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #3#
                                  (CONS
                                   (CONS (SPADCALL (QCAR |be|) (QREFELT % 61))
                                         (|ODEPAL;V_to_VF| (QCDR |be|) %))
                                   #3#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #3#)))))
              (EXIT (CONS |part| |bas|))))) 

(SDEFUN |ODEPAL;algDsolve;LodoRR;5|
        ((|l| (|LinearOrdinaryDifferentialOperator1| R)) (|g| (R))
         (%
          (|Record| (|:| |particular| (|Union| R "failed"))
                    (|:| |basis| (|List| R)))))
        (SPROG
         ((|rec1|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| #1=(|List| R))))
          (|bas| #1#)
          (|part1| (|Record| (|:| |ratpart| R) (|:| |coeffs| (|Vector| F))))
          (|c1inv| (F)) (|s0| (R)) (|s1| (R)))
         (SEQ (LETT |rec1| (SPADCALL |l| (LIST |g|) (QREFELT % 64)))
              (LETT |bas| (QCDR |rec1|))
              (EXIT
               (COND ((NULL (QCAR |rec1|)) (CONS (CONS 1 "failed") |bas|))
                     ('T
                      (SEQ (LETT |part1| (|SPADfirst| (QCAR |rec1|)))
                           (LETT |c1inv|
                                 (SPADCALL
                                  (SPADCALL (QCDR |part1|) 1 (QREFELT % 65))
                                  (QREFELT % 66)))
                           (LETT |s0| (QCAR |part1|))
                           (LETT |s1|
                                 (SPADCALL
                                  (SPADCALL (SPADCALL |c1inv| (QREFELT % 36))
                                            (QREFELT % 37))
                                  |s0| (QREFELT % 67)))
                           (EXIT (CONS (CONS 0 |s1|) |bas|))))))))) 

(DECLAIM (NOTINLINE |PureAlgebraicLODE;|)) 

(DEFUN |PureAlgebraicLODE;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|PureAlgebraicLODE| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 71))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PureAlgebraicLODE|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |PureAlgebraicLODE| (&REST #1=#:G80)
  (SPROG NIL
         (PROG (#2=#:G81)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PureAlgebraicLODE|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PureAlgebraicLODE;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PureAlgebraicLODE|)))))))))) 

(MAKEPROP '|PureAlgebraicLODE| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|)
              (|Record| (|:| |basis| 12) (|:| |mat| 16))
              (|LinearOrdinaryDifferentialOperator1| 34) (|List| 34)
              (|RationalLODE| 6 7) (0 . |ratDsolve|) (|List| 22) (|Matrix| 6)
              (6 . |nullSpace|) (|Boolean|) (|NonNegativeInteger|) (11 . ~=)
              (|List| 6) (|Vector| 6) (17 . |entries|) (|List| 21)
              (22 . |matrix|) (27 . |rowEchelon|) (32 . |1|) (36 . |1|)
              (|Integer|) (40 . |elt|) (47 . |0|) (51 . =) (57 . |0|)
              (|Fraction| 7) (61 . |0|) (65 . |coerce|) (70 . |coerce|)
              (|Vector| 34) (75 . |setelt!|) (82 . *) (88 . +) (94 . |retract|)
              (99 . |ground|) (|Mapping| 6 34) (|VectorFunctions2| 34 6)
              (104 . |map|) (|Record| (|:| |mat| 54) (|:| |vecs| 55))
              (|LinearOrdinaryDifferentialOperator1| 9) (|List| 9)
              (|ReduceLODE| 34 11 8 9 48) (110 . |reduceLODE|)
              (|Record| (|:| |ratpart| 38) (|:| |coeffs| 38))
              (|Record| (|:| |particular| (|List| 52)) (|:| |basis| 55))
              (|Matrix| 11) (|List| 38)
              (|Record| (|:| |ratpart| 34) (|:| |coeffs| 38))
              (|Record| (|:| |particular| (|List| 56)) (|:| |basis| 12))
              (|Mapping| 57 11 12) (|SystemODESolver| 34 11)
              (116 . |solveInField|) (123 . |represents|)
              (|Record| (|:| |ratpart| 9) (|:| |coeffs| 22))
              (|Record| (|:| |particular| (|List| 62)) (|:| |basis| 49))
              |ODEPAL;algDsolve;LodoLR;4| (128 . |elt|) (134 . |inv|) (139 . *)
              (|Union| 9 '#1="failed")
              (|Record| (|:| |particular| 68) (|:| |basis| 49))
              |ODEPAL;algDsolve;LodoRR;5|)
           '#(|algDsolve| 145) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|algDsolve|
                                 ((|Record|
                                   (|:| |particular| (|Union| |#4| #1#))
                                   (|:| |basis| (|List| |#4|)))
                                  (|LinearOrdinaryDifferentialOperator1| |#4|)
                                  |#4|))
                                T)
                              '((|algDsolve|
                                 ((|Record|
                                   (|:| |particular|
                                        (|List|
                                         (|Record| (|:| |ratpart| |#4|)
                                                   (|:| |coeffs|
                                                        (|Vector| |#1|)))))
                                   (|:| |basis| (|List| |#4|)))
                                  (|LinearOrdinaryDifferentialOperator1| |#4|)
                                  (|List| |#4|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 70
                                            '(2 13 10 11 12 14 1 16 15 0 17 2
                                              19 18 0 0 20 1 22 21 0 23 1 16 0
                                              24 25 1 16 0 0 26 0 6 0 27 0 7 0
                                              28 3 16 6 0 29 29 30 0 6 0 31 2 6
                                              18 0 0 32 0 7 0 33 0 34 0 35 1 7
                                              0 6 36 1 34 0 7 37 3 38 34 0 29
                                              34 39 2 34 0 7 0 40 2 34 0 0 0 41
                                              1 34 7 0 42 1 7 6 0 43 2 45 22 44
                                              38 46 2 50 47 48 49 51 3 59 53 54
                                              55 58 60 1 9 0 38 61 2 22 6 0 29
                                              65 1 6 0 0 66 2 9 0 34 0 67 2 0
                                              69 48 9 70 2 0 63 48 49 64)))))
           '|lookupComplete|)) 
