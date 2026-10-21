
(SDEFUN |CLINDEP;kmap|
        ((|k| (|Kernel| F)) (|ldmvar| (|List| (|Kernel| F)))
         (|ldmval| (|List| (|Expression| F))) (|ld| (|List| (|Mapping| F F)))
         (% (|Expression| F)))
        (SPROG
         ((|dmval| NIL) (#1=#:G37 NIL) (|dmvar| NIL) (#2=#:G36 NIL)
          (#3=#:G35 NIL) (|kf| (F)) (|d| NIL) (#4=#:G38 NIL)
          (|is_const| (|Boolean|)) (#5=#:G34 NIL) (|op| (|BasicOperator|))
          (|args| (|List| F)) (|u| (|Union| (|None|) "failed"))
          (|n| (|NonNegativeInteger|)) (|a1| (F)) (|da| #6=(|Kernel| F))
          (|sa1| #7=(|Symbol|)) (|a2| (F)) (|da2| #6#) (|sa2| #7#)
          (|kmap1| (|Mapping| (|Expression| F) (|Kernel| F))) (#8=#:G39 NIL)
          (|a| NIL) (#9=#:G40 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |dmval| NIL) (LETT #1# |ldmval|) (LETT |dmvar| NIL)
                 (LETT #2# |ldmvar|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |dmvar| (CAR #2#)) NIL)
                       (ATOM #1#) (PROGN (LETT |dmval| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |k| |dmvar| (QREFELT % 11))
                     (PROGN (LETT #3# |dmval|) (GO #10=#:G33))))))
                 (LETT #2# (PROG1 (CDR #2#) (LETT #1# (CDR #1#)))) (GO G190)
                 G191 (EXIT NIL))
            (LETT |is_const| 'T) (LETT |kf| (SPADCALL |k| (QREFELT % 13)))
            (SEQ
             (EXIT
              (SEQ (LETT |d| NIL) (LETT #4# |ld|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |d| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |kf| |d|) (|spadConstant| % 14)
                                 (QREFELT % 15))
                       (SEQ (LETT |is_const| NIL)
                            (EXIT (PROGN (LETT #5# 1) (GO #11=#:G11))))))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #5#))
            (EXIT
             (COND (|is_const| (SPADCALL |kf| (QREFELT % 17)))
                   ('T
                    (SEQ
                     (LETT |op|
                           (SPADCALL (SPADCALL |k| (QREFELT % 19))
                                     (QREFELT % 20)))
                     (LETT |args| (SPADCALL |k| (QREFELT % 22)))
                     (SEQ
                      (LETT |u| (SPADCALL |op| (QREFELT % 8) (QREFELT % 25)))
                      (EXIT
                       (COND
                        ((QEQCAR |u| 0)
                         (SEQ (LETT |n| (QCDR |u|))
                              (LETT |da|
                                    (SPADCALL
                                     (LETT |a1|
                                           (SPADCALL |args| (QREFELT % 26)))
                                     (QREFELT % 27)))
                              (COND
                               ((NULL (SPADCALL |da| |ldmvar| (QREFELT % 29)))
                                (SEQ (LETT |ldmvar| (CONS |da| |ldmvar|))
                                     (LETT |ldmval|
                                           (CONS
                                            (SPADCALL (SPADCALL (QREFELT % 30))
                                                      (QREFELT % 31))
                                            |ldmval|))
                                     (LETT |sa1|
                                           (SPADCALL |a1| (QREFELT % 32)))
                                     (EXIT
                                      (LETT |ld|
                                            (CONS
                                             (CONS #'|CLINDEP;kmap!0|
                                                   (VECTOR % |sa1|))
                                             |ld|))))))
                              (EXIT
                               (COND
                                ((EQL |n| 2)
                                 (SEQ
                                  (LETT |da2|
                                        (SPADCALL
                                         (LETT |a2|
                                               (SPADCALL |args| 3
                                                         (QREFELT % 35)))
                                         (QREFELT % 27)))
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL |da2| |ldmvar| (QREFELT % 29)))
                                     (SEQ (LETT |ldmvar| (CONS |da2| |ldmvar|))
                                          (LETT |ldmval|
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL (QREFELT % 30))
                                                  (QREFELT % 31))
                                                 |ldmval|))
                                          (LETT |sa2|
                                                (SPADCALL |a2| (QREFELT % 32)))
                                          (EXIT
                                           (LETT |ld|
                                                 (CONS
                                                  (CONS #'|CLINDEP;kmap!1|
                                                        (VECTOR % |sa2|))
                                                  |ld|))))))))))))))))
                     (LETT |kmap1|
                           (CONS #'|CLINDEP;kmap!2|
                                 (VECTOR % |ld| |ldmval| |ldmvar|)))
                     (EXIT
                      (SPADCALL |op|
                                (PROGN
                                 (LETT #8# NIL)
                                 (SEQ (LETT |a| NIL)
                                      (LETT #9# (SPADCALL |k| (QREFELT % 22)))
                                      G190
                                      (COND
                                       ((OR (ATOM #9#)
                                            (PROGN (LETT |a| (CAR #9#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #8#
                                              (CONS
                                               (|CLINDEP;F_to_EF1| |a| |kmap1|
                                                %)
                                               #8#))))
                                      (LETT #9# (CDR #9#)) (GO G190) G191
                                      (EXIT (NREVERSE #8#))))
                                (QREFELT % 37)))))))))
          #10# (EXIT #3#)))) 

(SDEFUN |CLINDEP;kmap!2| ((|kk| NIL) ($$ NIL))
        (PROG (|ldmvar| |ldmval| |ld| %)
          (LETT |ldmvar| (QREFELT $$ 3))
          (LETT |ldmval| (QREFELT $$ 2))
          (LETT |ld| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|CLINDEP;kmap| |kk| |ldmvar| |ldmval| |ld| %))))) 

(SDEFUN |CLINDEP;kmap!1| ((|ff| NIL) ($$ NIL))
        (PROG (|sa2| %)
          (LETT |sa2| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |ff| |sa2| (QREFELT % 33)))))) 

(SDEFUN |CLINDEP;kmap!0| ((|ff| NIL) ($$ NIL))
        (PROG (|sa1| %)
          (LETT |sa1| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |ff| |sa1| (QREFELT % 33)))))) 

(SDEFUN |CLINDEP;F_to_EF1|
        ((|f| (F)) (|kmap1| (|Mapping| (|Expression| F) (|Kernel| F)))
         (% (|Expression| F)))
        (SPADCALL
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!0| %)
                   (SPADCALL |f| (QREFELT % 40)) (QREFELT % 45))
         (SPADCALL |kmap1| (CONS #'|CLINDEP;F_to_EF1!1| %)
                   (SPADCALL |f| (QREFELT % 46)) (QREFELT % 45))
         (QREFELT % 47))) 

(SDEFUN |CLINDEP;F_to_EF1!1| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 38)) (QREFELT % 17))) 

(SDEFUN |CLINDEP;F_to_EF1!0| ((|c| NIL) (% NIL))
        (SPADCALL (SPADCALL |c| (QREFELT % 38)) (QREFELT % 17))) 

(SDEFUN |CLINDEP;F_to_EF|
        ((|f| (F)) (|ld| (|List| (|Mapping| F F))) (% (|Expression| F)))
        (SPROG NIL
               (|CLINDEP;F_to_EF1| |f|
                (CONS #'|CLINDEP;F_to_EF!0| (VECTOR % |ld|)) %))) 

(SDEFUN |CLINDEP;F_to_EF!0| ((|k| NIL) ($$ NIL))
        (PROG (|ld| %)
          (LETT |ld| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|CLINDEP;kmap| |k| NIL NIL |ld| %))))) 

(SDEFUN |CLINDEP;VF_to_VEF|
        ((|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Vector| (|Expression| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|CLINDEP;VF_to_VEF!0| (VECTOR % |ld|)) |v|
                         (QREFELT % 52)))) 

(SDEFUN |CLINDEP;VF_to_VEF!0| ((|x| NIL) ($$ NIL))
        (PROG (|ld| %)
          (LETT |ld| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|CLINDEP;F_to_EF| |x| |ld| %))))) 

(SDEFUN |CLINDEP;MF_to_MEF|
        ((|m| (|Matrix| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Matrix| (|Expression| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|CLINDEP;MF_to_MEF!0| (VECTOR % |ld|)) |m|
                         (QREFELT % 56)))) 

(SDEFUN |CLINDEP;MF_to_MEF!0| ((|x| NIL) ($$ NIL))
        (PROG (|ld| %)
          (LETT |ld| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|CLINDEP;F_to_EF| |x| |ld| %))))) 

(SDEFUN |CLINDEP;linearlyDependentOverConstants?;VLB;6|
        ((|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F))) (% (|Boolean|)))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| %) (QREFELT % 58))) 

(SDEFUN |CLINDEP;linearDependenceOverConstants;VLU;7|
        ((|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Union| (|Vector| F) "failed")))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| %) (QREFELT % 63))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;VFLU;8|
        ((|v| (|Vector| F)) (|u| (F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Union| (|Vector| F) "failed")))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| %)
                  (|CLINDEP;F_to_EF| |u| |ld| %) (QREFELT % 65))) 

(SDEFUN |CLINDEP;particularSolutionOverConstants;MVLU;9|
        ((|m| (|Matrix| F)) (|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Union| (|Vector| F) "failed")))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| %)
                  (|CLINDEP;VF_to_VEF| |v| |ld| %) (QREFELT % 67))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;VFLR;10|
        ((|v| (|Vector| F)) (|u| (F)) (|ld| (|List| (|Mapping| F F)))
         (%
          (|Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
                    (|:| |basis| (|List| (|Vector| F))))))
        (SPADCALL (|CLINDEP;VF_to_VEF| |v| |ld| %)
                  (|CLINDEP;F_to_EF| |u| |ld| %) (QREFELT % 70))) 

(SDEFUN |CLINDEP;solveLinearOverConstants;MVLR;11|
        ((|m| (|Matrix| F)) (|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F)))
         (%
          (|Record| (|:| |particular| (|Union| (|Vector| F) "failed"))
                    (|:| |basis| (|List| (|Vector| F))))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| %)
                  (|CLINDEP;VF_to_VEF| |v| |ld| %) (QREFELT % 72))) 

(SDEFUN |CLINDEP;reducedSystem;MLM;12|
        ((|m| (|Matrix| F)) (|ld| (|List| (|Mapping| F F))) (% (|Matrix| F)))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| %) (QREFELT % 75))) 

(SDEFUN |CLINDEP;reducedSystem;MVLR;13|
        ((|m| (|Matrix| F)) (|v| (|Vector| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|Record| (|:| |mat| (|Matrix| F)) (|:| |vec| (|Vector| F)))))
        (SPADCALL (|CLINDEP;MF_to_MEF| |m| |ld| %)
                  (|CLINDEP;VF_to_VEF| |v| |ld| %) (QREFELT % 79))) 

(SDEFUN |CLINDEP;nullSpaceOverConstants;MLL;14|
        ((|m| (|Matrix| F)) (|ld| (|List| (|Mapping| F F)))
         (% (|List| (|Vector| F))))
        (QCDR
         (SPADCALL |m| (MAKEARR1 (ANROWS |m|) (|spadConstant| % 14)) |ld|
                   (QREFELT % 73)))) 

(SDEFUN |CLINDEP;constant_subspace;LLR;15|
        ((|b| (|List| (|Vector| F))) (|ld| (|List| (|Mapping| F F)))
         (%
          (|Record| (|:| |transform| (|Matrix| F))
                    (|:| |basis| (|List| (|Vector| F))))))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (#1=#:G117 NIL) (#2=#:G118 NIL) (|m0b| #3=(|Matrix| F))
          (|m0| (|Matrix| F)) (|m1| (|Matrix| F)) (#4=#:G119 NIL)
          (|k1| #5=(|Integer|)) (#6=#:G116 NIL) (|k| #5#)
          (|lri| (|List| (|Integer|))) (|lpiv| (|List| (|Integer|)))
          (#7=#:G120 NIL) (|j| NIL) (#8=#:G121 NIL) (|kk| (|Integer|))
          (|lpiv1| (|List| (|Integer|))) (|d1| NIL) (#9=#:G122 NIL)
          (|ll1| (|List| F)) (|ll| (|List| (|List| F)))
          (|lr| (|List| (|Vector| F))) (|m| (|Matrix| F))
          (|s1| (|List| (|Vector| F))) (#10=#:G123 NIL) (#11=#:G124 NIL)
          (|l3| (|List| (|Vector| F))) (#12=#:G125 NIL) (#13=#:G126 NIL)
          (#14=#:G127 NIL) (|i| NIL) (#15=#:G128 NIL) (|m2| #3#)
          (#16=#:G129 NIL) (|bv| NIL) (#17=#:G130 NIL))
         (SEQ
          (COND
           ((NULL |b|) (CONS (MAKE_MATRIX1 0 0 (|spadConstant| % 84)) NIL))
           ('T
            (SEQ (LETT |nc| (QVSIZE (|SPADfirst| |b|)))
                 (LETT |nr| (LENGTH |b|))
                 (LETT |m0b|
                       (SPADCALL
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |bv| NIL) (LETT #2# |b|) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |bv| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |bv| (QREFELT % 85))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#))))
                        (QREFELT % 87)))
                 (LETT |m0|
                       (SPADCALL |m0b|
                                 (SPADCALL |nr| (|spadConstant| % 84)
                                           (QREFELT % 90))
                                 (QREFELT % 91)))
                 (LETT |m1| (SPADCALL |m0| (QREFELT % 92))) (LETT |k| 1)
                 (LETT |lpiv| NIL) (LETT |lri| NIL)
                 (SEQ (LETT |i| 1) (LETT #4# (ANROWS |m1|)) G190
                      (COND ((|greater_SI| |i| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |k1| |k|)
                             (SEQ G190
                                  (COND
                                   ((NULL
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |m1| |i| |k1| (QREFELT % 93))
                                        (|spadConstant| % 14) (QREFELT % 94))
                                       (<= |k1| |nc|))
                                      ('T NIL)))
                                    (GO G191)))
                                  (SEQ (EXIT (LETT |k1| (+ |k1| 1)))) NIL
                                  (GO G190) G191 (EXIT NIL))
                             (EXIT
                              (COND
                               ((< |nc| |k1|)
                                (PROGN (LETT #6# |$NoValue|) (GO #18=#:G88)))
                               ('T
                                (SEQ (LETT |k| |k1|)
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |m1| |i| |k| (QREFELT % 93))
                                         (|spadConstant| % 84) (QREFELT % 15))
                                        (|error| "impossible"))
                                       ('T
                                        (SEQ (LETT |lri| (CONS |i| |lri|))
                                             (EXIT
                                              (LETT |lpiv|
                                                    (CONS |k|
                                                          |lpiv|)))))))))))))
                       #18# (EXIT #6#))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (LETT |lpiv| (CONS (+ |nc| 1) |lpiv|))
                 (LETT |lpiv| (NREVERSE |lpiv|)) (LETT |lr| NIL)
                 (LETT |ll| NIL)
                 (SEQ (LETT |i| NIL) (LETT #7# |lri|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |lpiv1| |lpiv|)
                           (LETT |kk| (|SPADfirst| |lpiv1|))
                           (LETT |lpiv1| (CDR |lpiv1|)) (LETT |ll1| NIL)
                           (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                (COND ((|greater_SI| |j| #8#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((EQL |j| |kk|)
                                    (SEQ (LETT |kk| (|SPADfirst| |lpiv1|))
                                         (EXIT (LETT |lpiv1| (CDR |lpiv1|)))))
                                   ('T
                                    (SEQ (LETT |d1| NIL) (LETT #9# |ld|) G190
                                         (COND
                                          ((OR (ATOM #9#)
                                               (PROGN
                                                (LETT |d1| (CAR #9#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT |ll1|
                                                 (CONS
                                                  (SPADCALL
                                                   (SPADCALL |m1| |i| |j|
                                                             (QREFELT % 93))
                                                   |d1|)
                                                  |ll1|))))
                                         (LETT #9# (CDR #9#)) (GO G190) G191
                                         (EXIT NIL))))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |ll| (CONS |ll1| |ll|))
                           (EXIT
                            (LETT |lr|
                                  (CONS (SPADCALL |m1| |i| (QREFELT % 95))
                                        |lr|))))
                      (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                 (LETT |m|
                       (SPADCALL (SPADCALL |ll| (QREFELT % 87))
                                 (QREFELT % 96)))
                 (LETT |s1| (SPADCALL |m| |ld| (QREFELT % 82)))
                 (LETT |l3|
                       (PROGN
                        (LETT #10# NIL)
                        (SEQ (LETT |bv| NIL) (LETT #11# |s1|) G190
                             (COND
                              ((OR (ATOM #11#)
                                   (PROGN (LETT |bv| (CAR #11#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #10#
                                     (CONS (SPADCALL |bv| |lr| (QREFELT % 98))
                                           #10#))))
                             (LETT #11# (CDR #11#)) (GO G190) G191
                             (EXIT (NREVERSE #10#)))))
                 (LETT |m2|
                       (SPADCALL
                        (PROGN
                         (LETT #12# NIL)
                         (SEQ (LETT |bv| NIL) (LETT #13# |l3|) G190
                              (COND
                               ((OR (ATOM #13#)
                                    (PROGN (LETT |bv| (CAR #13#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #12#
                                      (CONS
                                       (PROGN
                                        (LETT #14# NIL)
                                        (SEQ (LETT |i| (+ |nc| 1))
                                             (LETT #15# (ANCOLS |m0|)) G190
                                             (COND ((> |i| #15#) (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #14#
                                                     (CONS
                                                      (SPADCALL |bv| |i|
                                                                (QREFELT % 99))
                                                      #14#))))
                                             (LETT |i| (+ |i| 1)) (GO G190)
                                             G191 (EXIT (NREVERSE #14#))))
                                       #12#))))
                              (LETT #13# (CDR #13#)) (GO G190) G191
                              (EXIT (NREVERSE #12#))))
                        (QREFELT % 87)))
                 (EXIT
                  (CONS |m2|
                        (PROGN
                         (LETT #16# NIL)
                         (SEQ (LETT |bv| NIL) (LETT #17# |l3|) G190
                              (COND
                               ((OR (ATOM #17#)
                                    (PROGN (LETT |bv| (CAR #17#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #16#
                                      (CONS
                                       (SPADCALL |bv|
                                                 (SPADCALL 1 |nc|
                                                           (QREFELT % 101))
                                                 (QREFELT % 102))
                                       #16#))))
                              (LETT #17# (CDR #17#)) (GO G190) G191
                              (EXIT (NREVERSE #16#)))))))))))) 

(DECLAIM (NOTINLINE |ConstantLinearDependence;|)) 

(DEFUN |ConstantLinearDependence;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|ConstantLinearDependence| DV$1 DV$2))
          (LETT % (GETREFV 105))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ConstantLinearDependence|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|%dummyVar|)
          %))) 

(DEFUN |ConstantLinearDependence| (&REST #1=#:G131)
  (SPROG NIL
         (PROG (#2=#:G132)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ConstantLinearDependence|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ConstantLinearDependence;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ConstantLinearDependence|)))))))))) 

(MAKEPROP '|ConstantLinearDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'DUMMYVAR
              (|Boolean|) (|Kernel| 7) (0 . =) (|Kernel| %) (6 . |coerce|)
              (11 . |0|) (15 . ~=) (|Expression| 7) (21 . |coerce|)
              (|BasicOperator|) (26 . |operator|) (31 . |operator|) (|List| 7)
              (36 . |argument|) (|Union| (|None|) '"failed") (|Symbol|)
              (41 . |property|) (47 . |second|) (52 . |retract|) (|List| 10)
              (57 . |member?|) (63 . |new|) (67 . |coerce|) (72 . |retract|)
              (77 . |differentiate|) (|Integer|) (83 . |elt|) (|List| %)
              (89 . |kernel|) (95 . |coerce|)
              (|SparseMultivariatePolynomial| 6 12) (100 . |numer|)
              (|Mapping| 16 10) (|Mapping| 16 6)
              (|SparseMultivariatePolynomial| 6 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 10) 10 6 43 16)
              (105 . |map|) (112 . |denom|) (117 . /) (|Vector| 16)
              (|Mapping| 16 7) (|Vector| 7) (|VectorFunctions2| 7 16)
              (123 . |map|) (|Matrix| 16) (|Matrix| 7)
              (|TwoDimensionalArrayFunctions| 7 50 50 54 16 48 48 53)
              (129 . |map|) (|LinearDependence| 7 16)
              (135 . |linearlyDependent?|) (|Mapping| 7 7) (|List| 59)
              |CLINDEP;linearlyDependentOverConstants?;VLB;6|
              (|Union| 50 '"failed") (140 . |linearDependence|)
              |CLINDEP;linearDependenceOverConstants;VLU;7|
              (145 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;VFLU;8|
              (151 . |particularSolution|)
              |CLINDEP;particularSolutionOverConstants;MVLU;9|
              (|Record| (|:| |particular| 62) (|:| |basis| 81))
              (157 . |solveLinear|) |CLINDEP;solveLinearOverConstants;VFLR;10|
              (163 . |solveLinear|) |CLINDEP;solveLinearOverConstants;MVLR;11|
              (|Matrix| %) (169 . |reducedSystem|)
              |CLINDEP;reducedSystem;MLM;12|
              (|Record| (|:| |mat| 54) (|:| |vec| 50)) (|Vector| %)
              (174 . |reducedSystem|) |CLINDEP;reducedSystem;MVLR;13|
              (|List| 50) |CLINDEP;nullSpaceOverConstants;MLL;14| (180 . |0|)
              (184 . |1|) (188 . |entries|) (|List| 21) (193 . |matrix|)
              (198 . |1|) (|NonNegativeInteger|) (202 . |scalarMatrix|)
              (208 . |horizConcat|) (214 . |rowEchelon|) (219 . |elt|)
              (226 . =) (232 . |row|) (238 . |transpose|)
              (|LinearCombinationUtilities| 7 (|SparseUnivariatePolynomial| 7))
              (243 . |lin_comb|) (249 . |elt|) (|UniversalSegment| 34)
              (255 . SEGMENT) (261 . |elt|)
              (|Record| (|:| |transform| 54) (|:| |basis| 81))
              |CLINDEP;constant_subspace;LLR;15|)
           '#(|solveLinearOverConstants| 267 |reducedSystem| 281
              |particularSolutionOverConstants| 294 |nullSpaceOverConstants|
              308 |linearlyDependentOverConstants?| 314
              |linearDependenceOverConstants| 320 |constant_subspace| 326)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|linearlyDependentOverConstants?|
                                 ((|Boolean|) (|Vector| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|linearDependenceOverConstants|
                                 ((|Union| (|Vector| |#2|) "failed")
                                  (|Vector| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|particularSolutionOverConstants|
                                 ((|Union| (|Vector| |#2|) #1="failed")
                                  (|Vector| |#2|) |#2|
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|particularSolutionOverConstants|
                                 ((|Union| (|Vector| |#2|) #1#) (|Matrix| |#2|)
                                  (|Vector| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|solveLinearOverConstants|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| |#2|) #1#))
                                   (|:| |basis| (|List| (|Vector| |#2|))))
                                  (|Vector| |#2|) |#2|
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|solveLinearOverConstants|
                                 ((|Record|
                                   (|:| |particular|
                                        (|Union| (|Vector| |#2|) #1#))
                                   (|:| |basis| (|List| (|Vector| |#2|))))
                                  (|Matrix| |#2|) (|Vector| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|reducedSystem|
                                 ((|Record| (|:| |mat| (|Matrix| |#2|))
                                            (|:| |vec| (|Vector| |#2|)))
                                  (|Matrix| |#2|) (|Vector| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|reducedSystem|
                                 ((|Matrix| |#2|) (|Matrix| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|nullSpaceOverConstants|
                                 ((|List| (|Vector| |#2|)) (|Matrix| |#2|)
                                  (|List| (|Mapping| |#2| |#2|))))
                                T)
                              '((|constant_subspace|
                                 ((|Record| (|:| |transform| (|Matrix| |#2|))
                                            (|:| |basis|
                                                 (|List| (|Vector| |#2|))))
                                  (|List| (|Vector| |#2|))
                                  (|List| (|Mapping| |#2| |#2|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 104
                                            '(2 10 9 0 0 11 1 7 0 12 13 0 7 0
                                              14 2 7 9 0 0 15 1 16 0 7 17 1 10
                                              18 0 19 1 16 18 18 20 1 10 21 0
                                              22 2 18 23 0 24 25 1 21 7 0 26 1
                                              7 12 0 27 2 28 9 10 0 29 0 24 0
                                              30 1 16 0 24 31 1 7 24 0 32 2 7 0
                                              0 24 33 2 21 7 0 34 35 2 16 0 18
                                              36 37 1 7 0 6 38 1 7 39 0 40 3 44
                                              16 41 42 43 45 1 7 39 0 46 2 16 0
                                              0 0 47 2 51 48 49 50 52 2 55 53
                                              49 54 56 1 57 9 48 58 1 57 62 48
                                              63 2 57 62 48 16 65 2 57 62 53 48
                                              67 2 57 69 48 16 70 2 57 69 53 48
                                              72 1 16 54 74 75 2 16 77 74 78 79
                                              0 6 0 83 0 7 0 84 1 50 21 0 85 1
                                              54 0 86 87 0 6 0 88 2 54 0 89 7
                                              90 2 54 0 0 0 91 1 54 0 0 92 3 54
                                              7 0 34 34 93 2 7 9 0 0 94 2 54 50
                                              0 34 95 1 54 0 0 96 2 97 50 50 81
                                              98 2 50 7 0 34 99 2 100 0 34 34
                                              101 2 50 0 0 100 102 3 0 69 54 50
                                              60 73 3 0 69 50 7 60 71 2 0 54 54
                                              60 76 3 0 77 54 50 60 80 3 0 62
                                              54 50 60 68 3 0 62 50 7 60 66 2 0
                                              81 54 60 82 2 0 9 50 60 61 2 0 62
                                              50 60 64 2 0 103 81 60 104)))))
           '|lookupComplete|)) 
