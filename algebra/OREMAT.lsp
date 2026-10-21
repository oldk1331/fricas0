
(SDEFUN |OREMAT;rowEchelon;2M;1| ((|m| (|Matrix| LO)) (% (|Matrix| LO)))
        (QCAR (SPADCALL |m| (|spadConstant| % 8) NIL (QREFELT % 13)))) 

(SDEFUN |OREMAT;rowEchelon;MFLR;2|
        ((|m| (|Matrix| LO)) (|cc| (F)) (|lv| (|List| (|Vector| F)))
         (%
          (|Record| (|:| |mat| (|Matrix| LO))
                    (|:| |vecs| (|List| (|Vector| F))))))
        (SPROG
         ((#1=#:G57 NIL) (|vv| NIL) (#2=#:G58 NIL) (|lw| (|List| (|Vector| F)))
          (|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (#3=#:G59 NIL) (|j| NIL) (#4=#:G60 NIL) (#5=#:G56 NIL) (#6=#:G61 NIL)
          (|dp1| (|NonNegativeInteger|)) (|pivk| (|Integer|))
          (|dpiv| (|Integer|)) (#7=#:G55 NIL) (|mm| (|Matrix| LO))
          (#8=#:G62 NIL) (#9=#:G63 NIL)
          (|#G14|
           (|Record| (|:| |generator| LO) (|:| |coef1| LO) (|:| |coef2| LO)
                     (|:| |coefu| LO) (|:| |coefv| LO)))
          (|mij| (LO)) (|c| (LO)) (|d| (LO)) (|u| (LO)) (|v| (LO))
          (#10=#:G64 NIL) (|el1| (LO)) (|el2| (LO)) (#11=#:G65 NIL)
          (|elf1| (F)) (|elf2| (F)) (|k| NIL) (#12=#:G66 NIL) (|mkj| (LO))
          (#13=#:G54 NIL)
          (|#G18| (|Record| (|:| |quotient| LO) (|:| |remainder| LO)))
          (|q| (LO)) (|r| (LO)) (|k1| NIL) (#14=#:G67 NIL) (|w| NIL)
          (#15=#:G68 NIL) (|i| (|Integer|)))
         (SEQ (LETT |mm| (SPADCALL |m| (QREFELT % 15)))
              (LETT |lw|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |vv| NIL) (LETT #2# |lv|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |vv| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL |vv| (QREFELT % 17)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |nc| (ANCOLS |mm|)) (LETT |nr| (ANROWS |mm|))
              (SEQ (LETT |w| NIL) (LETT #3# |lw|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |w| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (QVSIZE |w|) |nc| (QREFELT % 20))
                       (|error|
                        "rowEchelon: elements of lv must have size = ncols(m)")))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |i| 1)
              (SEQ
               (EXIT
                (SEQ (LETT |j| 1) (LETT #4# |nc|) G190
                     (COND ((|greater_SI| |j| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ
                        (COND
                         ((> |i| |nr|)
                          (PROGN (LETT #5# |$NoValue|) (GO #16=#:G51))))
                        (LETT |pivk| -1) (LETT |dpiv| -1)
                        (SEQ (LETT |k| |i|) (LETT #6# |nr|) G190
                             (COND ((> |k| #6#) (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (LETT |mkj|
                                         (SPADCALL |mm| |k| |j|
                                                   (QREFELT % 24)))
                                   (QREFELT % 25)))
                                 (SEQ
                                  (LETT |dp1| (SPADCALL |mkj| (QREFELT % 26)))
                                  (EXIT
                                   (COND
                                    ((OR (EQL |dpiv| -1) (< |dp1| |dpiv|))
                                     (SEQ (LETT |mij| |mkj|) (LETT |pivk| |k|)
                                          (EXIT (LETT |dpiv| |dp1|)))))))))))
                             (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((EQL |dpiv| -1)
                           (PROGN (LETT #7# |$NoValue|) (GO #17=#:G18)))
                          ('T
                           (SEQ
                            (LETT |mm|
                                  (SPADCALL |mm| |i| |pivk| (QREFELT % 27)))
                            (SEQ (LETT |w| NIL) (LETT #8# |lw|) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |w| (CAR #8#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SPADCALL |w| |i| |pivk| (QREFELT % 29))))
                                 (LETT #8# (CDR #8#)) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ (LETT |k| (+ |i| 1)) (LETT #9# |nr|) G190
                                 (COND ((> |k| #9#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (LETT |mkj|
                                             (SPADCALL |mm| |k| |j|
                                                       (QREFELT % 24)))
                                       (QREFELT % 25)))
                                     (SEQ
                                      (PROGN
                                       (LETT |#G14|
                                             (SPADCALL |mij| |mkj|
                                                       (QREFELT % 31)))
                                       (LETT |mij| (QVELT |#G14| 0))
                                       (LETT |c| (QVELT |#G14| 1))
                                       (LETT |d| (QVELT |#G14| 2))
                                       (LETT |u| (QVELT |#G14| 3))
                                       (LETT |v| (QVELT |#G14| 4))
                                       |#G14|)
                                      (SEQ (LETT |k1| (+ |j| 1))
                                           (LETT #10# |nc|) G190
                                           (COND ((> |k1| #10#) (GO G191)))
                                           (SEQ
                                            (LETT |el1|
                                                  (QAREF2O |mm| |i| |k1| 1 1))
                                            (LETT |el2|
                                                  (QAREF2O |mm| |k| |k1| 1 1))
                                            (QSETAREF2O |mm| |i| |k1|
                                                        (SPADCALL
                                                         (SPADCALL |c| |el1|
                                                                   (QREFELT %
                                                                            32))
                                                         (SPADCALL |d| |el2|
                                                                   (QREFELT %
                                                                            32))
                                                         (QREFELT % 33))
                                                        1 1)
                                            (EXIT
                                             (QSETAREF2O |mm| |k| |k1|
                                                         (SPADCALL
                                                          (SPADCALL |u| |el1|
                                                                    (QREFELT %
                                                                             32))
                                                          (SPADCALL |v| |el2|
                                                                    (QREFELT %
                                                                             32))
                                                          (QREFELT % 33))
                                                         1 1)))
                                           (LETT |k1| (+ |k1| 1)) (GO G190)
                                           G191 (EXIT NIL))
                                      (SEQ (LETT |w| NIL) (LETT #11# |lw|) G190
                                           (COND
                                            ((OR (ATOM #11#)
                                                 (PROGN
                                                  (LETT |w| (CAR #11#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (LETT |elf1| (QAREF1O |w| |i| 1))
                                            (LETT |elf2| (QAREF1O |w| |k| 1))
                                            (QSETAREF1O |w| |i|
                                                        (SPADCALL
                                                         (SPADCALL |c| |cc|
                                                                   |elf1|
                                                                   (QREFELT %
                                                                            34))
                                                         (SPADCALL |d| |cc|
                                                                   |elf2|
                                                                   (QREFELT %
                                                                            34))
                                                         (QREFELT % 35))
                                                        1)
                                            (EXIT
                                             (QSETAREF1O |w| |k|
                                                         (SPADCALL
                                                          (SPADCALL |u| |cc|
                                                                    |elf1|
                                                                    (QREFELT %
                                                                             34))
                                                          (SPADCALL |v| |cc|
                                                                    |elf2|
                                                                    (QREFELT %
                                                                             34))
                                                          (QREFELT % 35))
                                                         1)))
                                           (LETT #11# (CDR #11#)) (GO G190)
                                           G191 (EXIT NIL))
                                      (QSETAREF2O |mm| |i| |j| |mij| 1 1)
                                      (EXIT
                                       (QSETAREF2O |mm| |k| |j|
                                                   (|spadConstant| % 9) 1
                                                   1)))))))
                                 (LETT |k| (+ |k| 1)) (GO G190) G191
                                 (EXIT NIL))
                            (SEQ (LETT |k| 1) (LETT #12# (- |i| 1)) G190
                                 (COND ((|greater_SI| |k| #12#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL
                                      (LETT |mkj|
                                            (SPADCALL |mm| |k| |j|
                                                      (QREFELT % 24)))
                                      (QREFELT % 25))
                                     (PROGN
                                      (LETT #13# |$NoValue|)
                                      (GO #18=#:G39)))
                                    ('T
                                     (SEQ
                                      (PROGN
                                       (LETT |#G18|
                                             (SPADCALL |mkj| |mij|
                                                       (QREFELT % 37)))
                                       (LETT |q| (QCAR |#G18|))
                                       (LETT |r| (QCDR |#G18|))
                                       |#G18|)
                                      (QSETAREF2O |mm| |k| |j| |r| 1 1)
                                      (SEQ (LETT |k1| (+ |j| 1))
                                           (LETT #14# |nc|) G190
                                           (COND ((> |k1| #14#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (QSETAREF2O |mm| |k| |k1|
                                                         (SPADCALL
                                                          (QAREF2O |mm| |k|
                                                                   |k1| 1 1)
                                                          (SPADCALL |q|
                                                                    (QAREF2O
                                                                     |mm| |i|
                                                                     |k1| 1 1)
                                                                    (QREFELT %
                                                                             32))
                                                          (QREFELT % 38))
                                                         1 1)))
                                           (LETT |k1| (+ |k1| 1)) (GO G190)
                                           G191 (EXIT NIL))
                                      (EXIT
                                       (SEQ (LETT |w| NIL) (LETT #15# |lw|)
                                            G190
                                            (COND
                                             ((OR (ATOM #15#)
                                                  (PROGN
                                                   (LETT |w| (CAR #15#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (QSETAREF1O |w| |k|
                                                          (SPADCALL
                                                           (QAREF1O |w| |k| 1)
                                                           (SPADCALL |q| |cc|
                                                                     (QAREF1O
                                                                      |w| |i|
                                                                      1)
                                                                     (QREFELT %
                                                                              34))
                                                           (QREFELT % 39))
                                                          1)))
                                            (LETT #15# (CDR #15#)) (GO G190)
                                            G191 (EXIT NIL)))))))
                                  #18# (EXIT #13#))
                                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT (LETT |i| (+ |i| 1)))))))))
                      #17# (EXIT #7#))
                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL)))
               #16# (EXIT #5#))
              (EXIT (CONS |mm| |lw|))))) 

(SDEFUN |OREMAT;triangular_solve|
        ((|m| (|Matrix| LO)) (|cc| (F)) (|lv| (|List| (|Vector| F)))
         (|solf|
          (|Mapping|
           #1=(|Record|
               (|:| |particular|
                    #2=(|List|
                        (|Record| (|:| |ratpart| F)
                                  (|:| |coeffs| #3=(|Vector| F)))))
               (|:| |basis| (|List| F)))
           LO (|List| F)))
         (%
          (|Union|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| (|Vector| F))
                            (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| (|Vector| F))))
           "failed")))
        (SPROG
         ((|nc| (|NonNegativeInteger|)) (|nr| (|NonNegativeInteger|))
          (|n| #4=(|NonNegativeInteger|)) (#5=#:G139 NIL) (#6=#:G140 NIL)
          (#7=#:G141 NIL) (#8=#:G142 NIL) (#9=#:G144 NIL) (#10=#:G143 NIL)
          (|i| NIL) (#11=#:G138 NIL) (#12=#:G145 NIL) (|v| NIL)
          (#13=#:G146 NIL) (|lvi0| (|List| F)) (#14=#:G147 NIL)
          (#15=#:G148 NIL) (|nlvi| (|NonNegativeInteger|)) (|nbas| #4#)
          (#16=#:G149 NIL) (#17=#:G150 NIL) (|lvi1| (|List| F))
          (#18=#:G152 NIL) (#19=#:G151 NIL) (#20=#:G153 NIL) (|vvi| (F))
          (|lvi2| (|List| F)) (|lvi| (|List| F)) (|resi| #1#) (|be| NIL)
          (#21=#:G154 NIL) (|prl| #2#) (|nrl| (|NonNegativeInteger|))
          (#22=#:G155 NIL) (#23=#:G156 NIL) (|ncvl| (|List| #3#))
          (#24=#:G157 NIL) (|pr| NIL) (#25=#:G158 NIL) (|nsl1| (|List| F))
          (#26=#:G159 NIL) (|ncv| NIL) (#27=#:G160 NIL) (|cm1| (|Matrix| F))
          (|cm2| (|Matrix| F)) (|noff| (|NonNegativeInteger|)) (#28=#:G161 NIL)
          (|slk| NIL) (#29=#:G162 NIL) (|ss| (F)) (#30=#:G163 NIL)
          (#31=#:G164 NIL) (|nrl1| (|NonNegativeInteger|)) (#32=#:G136 NIL)
          (#33=#:G137 NIL) (|nbcv| #34=(|Vector| F)) (#35=#:G165 NIL)
          (|nbvl| (|List| (|Vector| F))) (|nsl2| (|List| F)) (|slj| NIL)
          (#36=#:G167 NIL) (|j| NIL) (#37=#:G166 NIL) (|nbcv1| #34#)
          (#38=#:G168 NIL) (|nbcv2| #34#) (|k| NIL) (#39=#:G169 NIL)
          (|bv| #34#) (|ncb| (|List| (|Vector| F))) (|na| (|Vector| F))
          (|ncba| (|List| (|Vector| F))) (|cb| (|List| #34#))
          (|cba| (|List| #34#)) (|bvl| (|List| (|Vector| F))) (#40=#:G170 NIL)
          (#41=#:G172 NIL) (|ba| NIL) (#42=#:G171 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |nc| (ANCOLS |m|)) (LETT |nr| (ANROWS |m|))
                (EXIT
                 (COND ((> |nc| |nr|) (CONS 1 "failed"))
                       ('T
                        (SEQ (LETT |n| (LENGTH |lv|)) (LETT |bvl| NIL)
                             (LETT |cb|
                                   (PROGN
                                    (LETT #5# NIL)
                                    (SEQ (LETT |i| 1) (LETT #6# |n|) G190
                                         (COND
                                          ((|greater_SI| |i| #6#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (MAKEARR1 |n|
                                                            (|spadConstant| %
                                                                            8))
                                                  #5#))))
                                         (LETT |i| (|inc_SI| |i|)) (GO G190)
                                         G191 (EXIT (NREVERSE #5#)))))
                             (LETT |cba|
                                   (PROGN
                                    (LETT #7# NIL)
                                    (SEQ (LETT #8# |cb|) G190
                                         (COND
                                          ((OR (ATOM #8#)
                                               (PROGN
                                                (LETT |bv| (CAR #8#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #7#
                                                 (CONS
                                                  (MAKEARR1 |nc|
                                                            (|spadConstant| %
                                                                            8))
                                                  #7#))))
                                         (LETT #8# (CDR #8#)) (GO G190) G191
                                         (EXIT (NREVERSE #7#)))))
                             (SEQ (LETT #9# |cb|) (LETT |i| 1) (LETT #10# |n|)
                                  G190
                                  (COND
                                   ((OR (|greater_SI| |i| #10#) (ATOM #9#)
                                        (PROGN (LETT |bv| (CAR #9#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |bv| |i| (|spadConstant| % 21)
                                              (QREFELT % 40))))
                                  (LETT |i|
                                        (PROG1 (|inc_SI| |i|)
                                          (LETT #9# (CDR #9#))))
                                  (GO G190) G191 (EXIT NIL))
                             (SEQ (LETT |i| |nc|) G190
                                  (COND ((< |i| 1) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL
                                       (SPADCALL |m| |i| |i| (QREFELT % 24))
                                       (|spadConstant| % 9) (QREFELT % 41))
                                      (PROGN
                                       (LETT #11# (CONS 1 "failed"))
                                       (GO #43=#:G135)))
                                     ('T
                                      (SEQ
                                       (LETT |lvi0|
                                             (PROGN
                                              (LETT #12# NIL)
                                              (SEQ (LETT |v| NIL)
                                                   (LETT #13# |lv|) G190
                                                   (COND
                                                    ((OR (ATOM #13#)
                                                         (PROGN
                                                          (LETT |v| (CAR #13#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #12#
                                                           (CONS
                                                            (SPADCALL |v| |i|
                                                                      (QREFELT
                                                                       % 42))
                                                            #12#))))
                                                   (LETT #13# (CDR #13#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #12#)))))
                                       (LETT |lvi1|
                                             (PROGN
                                              (LETT #14# NIL)
                                              (SEQ (LETT #15# |cb|) G190
                                                   (COND
                                                    ((OR (ATOM #15#)
                                                         (PROGN
                                                          (LETT |bv|
                                                                (CAR #15#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #14#
                                                           (CONS
                                                            (SPADCALL |bv|
                                                                      |lvi0|
                                                                      (QREFELT
                                                                       % 45))
                                                            #14#))))
                                                   (LETT #15# (CDR #15#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #14#)))))
                                       (LETT |nlvi| (LENGTH |lvi1|))
                                       (LETT |nbas| (LENGTH |bvl|))
                                       (LETT |lvi1|
                                             (SPADCALL |lvi1|
                                                       (PROGN
                                                        (LETT #16# NIL)
                                                        (SEQ (LETT #17# |bvl|)
                                                             G190
                                                             (COND
                                                              ((OR (ATOM #17#)
                                                                   (PROGN
                                                                    (LETT |bv|
                                                                          (CAR
                                                                           #17#))
                                                                    NIL))
                                                               (GO G191)))
                                                             (SEQ
                                                              (EXIT
                                                               (LETT #16#
                                                                     (CONS
                                                                      (|spadConstant|
                                                                       % 8)
                                                                      #16#))))
                                                             (LETT #17#
                                                                   (CDR #17#))
                                                             (GO G190) G191
                                                             (EXIT
                                                              (NREVERSE
                                                               #16#))))
                                                       (QREFELT % 46)))
                                       (LETT |lvi2| NIL)
                                       (SEQ (LETT #18# |lvi1|)
                                            (LETT #19#
                                                  (SPADCALL |cba| |bvl|
                                                            (QREFELT % 47)))
                                            G190
                                            (COND
                                             ((OR (ATOM #19#)
                                                  (PROGN
                                                   (LETT |bv| (CAR #19#))
                                                   NIL)
                                                  (ATOM #18#)
                                                  (PROGN
                                                   (LETT |vvi| (CAR #18#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (SEQ (LETT |j| (+ |i| 1))
                                                  (LETT #20# |nc|) G190
                                                  (COND
                                                   ((> |j| #20#) (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |vvi|
                                                          (SPADCALL |vvi|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |m| |i|
                                                                      |j|
                                                                      (QREFELT
                                                                       % 24))
                                                                     |cc|
                                                                     (SPADCALL
                                                                      |bv| |j|
                                                                      (QREFELT
                                                                       % 42))
                                                                     (QREFELT %
                                                                              34))
                                                                    (QREFELT %
                                                                             39)))))
                                                  (LETT |j| (+ |j| 1))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |lvi2|
                                                    (CONS |vvi| |lvi2|))))
                                            (LETT #19#
                                                  (PROG1 (CDR #19#)
                                                    (LETT #18# (CDR #18#))))
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |lvi| (NREVERSE |lvi2|))
                                       (LETT |resi|
                                             (SPADCALL
                                              (SPADCALL |m| |i| |i|
                                                        (QREFELT % 24))
                                              |lvi| |solf|))
                                       (LETT |nbvl| NIL)
                                       (SEQ (LETT |be| NIL)
                                            (LETT #21# (QCDR |resi|)) G190
                                            (COND
                                             ((OR (ATOM #21#)
                                                  (PROGN
                                                   (LETT |be| (CAR #21#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |bv|
                                                   (MAKEARR1 |nc|
                                                             (|spadConstant| %
                                                                             8)))
                                             (SPADCALL |bv| |i| |be|
                                                       (QREFELT % 40))
                                             (EXIT
                                              (LETT |nbvl|
                                                    (CONS |bv| |nbvl|))))
                                            (LETT #21# (CDR #21#)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |prl| (QCAR |resi|))
                                       (LETT |nrl| (LENGTH |prl|))
                                       (LETT |ncvl|
                                             (PROGN
                                              (LETT #22# NIL)
                                              (SEQ (LETT |pr| NIL)
                                                   (LETT #23# |prl|) G190
                                                   (COND
                                                    ((OR (ATOM #23#)
                                                         (PROGN
                                                          (LETT |pr|
                                                                (CAR #23#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #22#
                                                           (CONS (QCDR |pr|)
                                                                 #22#))))
                                                   (LETT #23# (CDR #23#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #22#)))))
                                       (LETT |nsl1|
                                             (PROGN
                                              (LETT #24# NIL)
                                              (SEQ (LETT |pr| NIL)
                                                   (LETT #25# |prl|) G190
                                                   (COND
                                                    ((OR (ATOM #25#)
                                                         (PROGN
                                                          (LETT |pr|
                                                                (CAR #25#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (LETT #24#
                                                           (CONS (QCAR |pr|)
                                                                 #24#))))
                                                   (LETT #25# (CDR #25#))
                                                   (GO G190) G191
                                                   (EXIT (NREVERSE #24#)))))
                                       (LETT |cm1|
                                             (SPADCALL
                                              (PROGN
                                               (LETT #26# NIL)
                                               (SEQ (LETT |ncv| NIL)
                                                    (LETT #27# |ncvl|) G190
                                                    (COND
                                                     ((OR (ATOM #27#)
                                                          (PROGN
                                                           (LETT |ncv|
                                                                 (CAR #27#))
                                                           NIL))
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (LETT #26#
                                                            (CONS
                                                             (SPADCALL |ncv|
                                                                       (QREFELT
                                                                        % 48))
                                                             #26#))))
                                                    (LETT #27# (CDR #27#))
                                                    (GO G190) G191
                                                    (EXIT (NREVERSE #26#))))
                                              (QREFELT % 51)))
                                       (LETT |cm2|
                                             (SPADCALL
                                              (SPADCALL |cm1|
                                                        (SPADCALL |nrl|
                                                                  (|spadConstant|
                                                                   % 21)
                                                                  (QREFELT %
                                                                           53))
                                                        (QREFELT % 54))
                                              (QREFELT % 55)))
                                       (LETT |nsl2| NIL)
                                       (LETT |noff| (+ (+ |nlvi| |nbas|) 1))
                                       (SEQ (LETT |j| 1) (LETT #28# |nrl|) G190
                                            (COND
                                             ((|greater_SI| |j| #28#)
                                              (GO G191)))
                                            (SEQ
                                             (LETT |ss| (|spadConstant| % 8))
                                             (SEQ (LETT |slk| NIL)
                                                  (LETT #29# |nsl1|)
                                                  (LETT |k| |noff|) G190
                                                  (COND
                                                   ((OR (ATOM #29#)
                                                        (PROGN
                                                         (LETT |slk|
                                                               (CAR #29#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (LETT |ss|
                                                          (SPADCALL |ss|
                                                                    (SPADCALL
                                                                     (SPADCALL
                                                                      |cm2| |j|
                                                                      |k|
                                                                      (QREFELT
                                                                       % 56))
                                                                     |slk|
                                                                     (QREFELT %
                                                                              57))
                                                                    (QREFELT %
                                                                             35)))))
                                                  (LETT |k|
                                                        (PROG1 (+ |k| 1)
                                                          (LETT #29#
                                                                (CDR #29#))))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (LETT |nsl2|
                                                    (CONS |ss| |nsl2|))))
                                            (LETT |j| (|inc_SI| |j|)) (GO G190)
                                            G191 (EXIT NIL))
                                       (LETT |nrl1| 0)
                                       (SEQ
                                        (EXIT
                                         (SEQ (LETT |slj| NIL)
                                              (LETT #30# |nsl2|)
                                              (LETT |j| |nrl|) G190
                                              (COND
                                               ((OR (< |j| 1) (ATOM #30#)
                                                    (PROGN
                                                     (LETT |slj| (CAR #30#))
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (SEQ
                                                (EXIT
                                                 (SEQ (LETT |k| 1)
                                                      (LETT #31# |nlvi|) G190
                                                      (COND
                                                       ((|greater_SI| |k| #31#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (EXIT
                                                        (COND
                                                         ((SPADCALL
                                                           (SPADCALL |cm2| |j|
                                                                     |k|
                                                                     (QREFELT %
                                                                              56))
                                                           (|spadConstant| % 8)
                                                           (QREFELT % 58))
                                                          (SEQ
                                                           (LETT |nrl1| |j|)
                                                           (EXIT
                                                            (PROGN
                                                             (LETT #32# 1)
                                                             (GO
                                                              #44=#:G114))))))))
                                                      (LETT |k| (|inc_SI| |k|))
                                                      (GO G190) G191
                                                      (EXIT NIL)))
                                                #44# (EXIT #32#))
                                               (EXIT
                                                (COND
                                                 ((SPADCALL |nrl1| 0
                                                            (QREFELT % 20))
                                                  (PROGN
                                                   (LETT #33# 1)
                                                   (GO #45=#:G119)))
                                                 ('T
                                                  (SEQ
                                                   (LETT |nbcv|
                                                         (MAKEARR1 |nbas|
                                                                   (|spadConstant|
                                                                    % 8)))
                                                   (SEQ (LETT |k| 1)
                                                        (LETT #35# |nbas|) G190
                                                        (COND
                                                         ((|greater_SI| |k|
                                                                        #35#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (EXIT
                                                          (SPADCALL |nbcv| |k|
                                                                    (SPADCALL
                                                                     |cm2| |j|
                                                                     (+ |k|
                                                                        |nlvi|)
                                                                     (QREFELT %
                                                                              56))
                                                                    (QREFELT %
                                                                             40))))
                                                        (LETT |k|
                                                              (|inc_SI| |k|))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (LETT |bv|
                                                         (SPADCALL |nbcv| |bvl|
                                                                   (QREFELT %
                                                                            59)))
                                                   (SPADCALL |bv| |i| |slj|
                                                             (QREFELT % 40))
                                                   (EXIT
                                                    (LETT |nbvl|
                                                          (CONS |bv|
                                                                |nbvl|))))))))
                                              (LETT |j|
                                                    (PROG1 (+ |j| -1)
                                                      (LETT #30# (CDR #30#))))
                                              (GO G190) G191 (EXIT NIL)))
                                        #45# (EXIT #33#))
                                       (LETT |nsl2| (NREVERSE |nsl2|))
                                       (LETT |ncb| NIL) (LETT |ncba| NIL)
                                       (SEQ (LETT |slj| NIL) (LETT #36# |nsl2|)
                                            (LETT |j| 1) (LETT #37# |nrl1|)
                                            G190
                                            (COND
                                             ((OR (|greater_SI| |j| #37#)
                                                  (ATOM #36#)
                                                  (PROGN
                                                   (LETT |slj| (CAR #36#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (LETT |nbcv1|
                                                   (MAKEARR1 |nbas|
                                                             (|spadConstant| %
                                                                             8)))
                                             (SEQ (LETT |k| 1)
                                                  (LETT #38# |nbas|) G190
                                                  (COND
                                                   ((|greater_SI| |k| #38#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv1| |k|
                                                              (SPADCALL |cm2|
                                                                        |j|
                                                                        (+ |k|
                                                                           |nlvi|)
                                                                        (QREFELT
                                                                         % 56))
                                                              (QREFELT % 40))))
                                                  (LETT |k| (|inc_SI| |k|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |nbcv2|
                                                   (MAKEARR1 |nlvi|
                                                             (|spadConstant| %
                                                                             8)))
                                             (SEQ (LETT |k| 1)
                                                  (LETT #39# |nlvi|) G190
                                                  (COND
                                                   ((|greater_SI| |k| #39#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (SPADCALL |nbcv2| |k|
                                                              (SPADCALL |cm2|
                                                                        |j| |k|
                                                                        (QREFELT
                                                                         % 56))
                                                              (QREFELT % 40))))
                                                  (LETT |k| (|inc_SI| |k|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |bv|
                                                   (SPADCALL |nbcv2| |cb|
                                                             (QREFELT % 59)))
                                             (LETT |ncb| (CONS |bv| |ncb|))
                                             (LETT |na|
                                                   (SPADCALL |nbcv2| |cba|
                                                             (QREFELT % 59)))
                                             (LETT |na|
                                                   (SPADCALL |nbcv1| |na| |bvl|
                                                             (QREFELT % 60)))
                                             (SPADCALL |na| |i| |slj|
                                                       (QREFELT % 40))
                                             (EXIT
                                              (LETT |ncba|
                                                    (CONS |na| |ncba|))))
                                            (LETT |j|
                                                  (PROG1 (|inc_SI| |j|)
                                                    (LETT #36# (CDR #36#))))
                                            (GO G190) G191 (EXIT NIL))
                                       (LETT |cb| (NREVERSE |ncb|))
                                       (LETT |cba| (NREVERSE |ncba|))
                                       (EXIT (LETT |bvl| |nbvl|)))))))
                                  (LETT |i| (+ |i| -1)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (CONS 0
                                    (CONS
                                     (PROGN
                                      (LETT #40# NIL)
                                      (SEQ (LETT #41# |cb|) (LETT |ba| NIL)
                                           (LETT #42# |cba|) G190
                                           (COND
                                            ((OR (ATOM #42#)
                                                 (PROGN
                                                  (LETT |ba| (CAR #42#))
                                                  NIL)
                                                 (ATOM #41#)
                                                 (PROGN
                                                  (LETT |bv| (CAR #41#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #40#
                                                   (CONS (CONS |ba| |bv|)
                                                         #40#))))
                                           (LETT #42#
                                                 (PROG1 (CDR #42#)
                                                   (LETT #41# (CDR #41#))))
                                           (GO G190) G191
                                           (EXIT (NREVERSE #40#))))
                                     |bvl|)))))))))
          #43# (EXIT #11#)))) 

(SDEFUN |OREMAT;solve;MFLMU;4|
        ((|m| (|Matrix| LO)) (|cc| (F)) (|lv| (|List| (|Vector| F)))
         (|solf|
          (|Mapping|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| F) (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| F)))
           LO (|List| F)))
         (%
          (|Union|
           (|Record|
            (|:| |particular|
                 (|List|
                  (|Record| (|:| |ratpart| (|Vector| F))
                            (|:| |coeffs| (|Vector| F)))))
            (|:| |basis| (|List| (|Vector| F))))
           "failed")))
        (SPROG
         ((|rec|
           (|Record| (|:| |mat| (|Matrix| LO))
                     (|:| |vecs| (|List| (|Vector| F))))))
         (SEQ (LETT |rec| (SPADCALL |m| |cc| |lv| (QREFELT % 13)))
              (EXIT
               (|OREMAT;triangular_solve| (QCAR |rec|) |cc| (QCDR |rec|) |solf|
                %))))) 

(DECLAIM (NOTINLINE |OrePolynomialMatrixOperations;|)) 

(DEFUN |OrePolynomialMatrixOperations;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OrePolynomialMatrixOperations| DV$1 DV$2))
          (LETT % (GETREFV 68))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrePolynomialMatrixOperations|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |OrePolynomialMatrixOperations| (&REST #1=#:G187)
  (SPROG NIL
         (PROG (#2=#:G188)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrePolynomialMatrixOperations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |OrePolynomialMatrixOperations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrePolynomialMatrixOperations|)))))))))) 

(MAKEPROP '|OrePolynomialMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |0|)
              (4 . |0|) (|Record| (|:| |mat| 11) (|:| |vecs| 12)) (|Matrix| 7)
              (|List| 16) |OREMAT;rowEchelon;MFLR;2| |OREMAT;rowEchelon;2M;1|
              (8 . |copy|) (|Vector| 6) (13 . |copy|) (|Boolean|)
              (|NonNegativeInteger|) (18 . ~=) (24 . |1|) (28 . |1|)
              (|Integer|) (32 . |elt|) (39 . |zero?|) (44 . |degree|)
              (49 . |swapRows!|) (|Void|) (56 . |swap!|)
              (|Record| (|:| |generator| %) (|:| |coef1| %) (|:| |coef2| %)
                        (|:| |coefu| %) (|:| |coefv| %))
              (63 . |right_ext_ext_GCD|) (69 . *) (75 . +) (81 . |apply|)
              (88 . +) (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (94 . |rightDivide|) (100 . -) (106 . -) (112 . |setelt!|)
              (119 . =) (125 . |elt|) (|List| 6)
              (|LinearCombinationUtilities| 6 (|SparseUnivariatePolynomial| 6))
              (131 . |lin_comb|) (137 . |concat|) (143 . |concat|)
              (149 . |parts|) (|List| 43) (|Matrix| 6) (154 . |matrix|)
              (159 . |scalarMatrix|) (165 . |scalarMatrix|)
              (171 . |horizConcat|) (177 . |rowEchelon|) (182 . |elt|)
              (189 . *) (195 . ~=) (201 . |lin_comb|) (207 . |lin_comb!|)
              (|Record| (|:| |ratpart| 16) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 61)) (|:| |basis| 12))
              (|Union| 62 '#1="failed")
              (|Record| (|:| |ratpart| 6) (|:| |coeffs| 16))
              (|Record| (|:| |particular| (|List| 64)) (|:| |basis| 43))
              (|Mapping| 65 7 43) |OREMAT;solve;MFLMU;4|)
           '#(|solve| 214 |rowEchelon| 222) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|rowEchelon|
                                 ((|Matrix| |#2|) (|Matrix| |#2|)))
                                T)
                              '((|rowEchelon|
                                 ((|Record| (|:| |mat| (|Matrix| |#2|))
                                            (|:| |vecs|
                                                 (|List| (|Vector| |#1|))))
                                  (|Matrix| |#2|) |#1|
                                  (|List| (|Vector| |#1|))))
                                T)
                              '((|solve|
                                 ((|Union|
                                   (|Record|
                                    (|:| |particular|
                                         (|List|
                                          (|Record|
                                           (|:| |ratpart| (|Vector| |#1|))
                                           (|:| |coeffs| (|Vector| |#1|)))))
                                    (|:| |basis| (|List| (|Vector| |#1|))))
                                   #1#)
                                  (|Matrix| |#2|) |#1| (|List| (|Vector| |#1|))
                                  (|Mapping|
                                   (|Record|
                                    (|:| |particular|
                                         (|List|
                                          (|Record| (|:| |ratpart| |#1|)
                                                    (|:| |coeffs|
                                                         (|Vector| |#1|)))))
                                    (|:| |basis| (|List| |#1|)))
                                   |#2| (|List| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 67
                                            '(0 6 0 8 0 7 0 9 1 11 0 0 15 1 16
                                              0 0 17 2 19 18 0 0 20 0 6 0 21 0
                                              7 0 22 3 11 7 0 23 23 24 1 7 18 0
                                              25 1 7 19 0 26 3 11 0 0 23 23 27
                                              3 16 28 0 23 23 29 2 7 30 0 0 31
                                              2 7 0 0 0 32 2 7 0 0 0 33 3 7 6 0
                                              6 6 34 2 6 0 0 0 35 2 7 36 0 0 37
                                              2 7 0 0 0 38 2 6 0 0 0 39 3 16 6
                                              0 23 6 40 2 7 18 0 0 41 2 16 6 0
                                              23 42 2 44 6 16 43 45 2 43 0 0 0
                                              46 2 12 0 0 0 47 1 16 43 0 48 1
                                              50 0 49 51 2 11 0 19 7 52 2 50 0
                                              19 6 53 2 50 0 0 0 54 1 50 0 0 55
                                              3 50 6 0 23 23 56 2 6 0 0 0 57 2
                                              6 18 0 0 58 2 44 16 16 12 59 3 44
                                              16 16 16 12 60 4 0 63 11 6 12 66
                                              67 3 0 10 11 6 12 13 1 0 11 11
                                              14)))))
           '|lookupComplete|)) 
