
(SDEFUN |UGAUSS;pre_gauss0|
        ((|m| (|Matrix| (|Integer|))) (|pivotsj| (|Vector| (|Integer|)))
         (|pivotsk| (|Vector| (|Integer|))) (% (|Void|)))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (|i| NIL)
          (#1=#:G31 NIL) (#2=#:G32 NIL) (#3=#:G28 NIL) (|pv| #4=(|Integer|))
          (#5=#:G29 NIL) (#6=#:G30 NIL) (|l0| (|Integer|)) (|ml| #4#) (|n| NIL)
          (#7=#:G33 NIL) (|pp| (|Integer|)) (|l| NIL) (#8=#:G34 NIL))
         (SEQ (LETT |j| (ANROWS |m|)) (LETT |k| (ANCOLS |m|))
              (EXIT
               (SEQ (LETT |i| 1) (LETT #1# |j|) G190
                    (COND ((|greater_SI| |i| #1#) (GO G191)))
                    (SEQ
                     (EXIT
                      (SEQ
                       (SEQ
                        (EXIT
                         (SEQ (LETT |l| 1) (LETT #2# |k|) G190
                              (COND ((|greater_SI| |l| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |pivotsk| |l| (QREFELT % 8)) 0
                                   (QREFELT % 10))
                                  (PROGN (LETT #3# |$NoValue|) (GO #9=#:G9)))
                                 ('T
                                  (SEQ (LETT |pv| (QAREF2O |m| |i| |l| 1 1))
                                       (EXIT
                                        (COND
                                         ((EQL |pv| 1)
                                          (SEQ
                                           (SPADCALL |pivotsj| |i| |l|
                                                     (QREFELT % 11))
                                           (SPADCALL |pivotsk| |l| |i|
                                                     (QREFELT % 11))
                                           (EXIT
                                            (PROGN
                                             (LETT #5# |$NoValue|)
                                             (GO #10=#:G15)))))
                                         ((EQL |pv| -1)
                                          (SEQ
                                           (SPADCALL |pivotsj| |i| |l|
                                                     (QREFELT % 11))
                                           (SPADCALL |pivotsk| |l| |i|
                                                     (QREFELT % 11))
                                           (EXIT
                                            (PROGN
                                             (LETT #5# 1)
                                             (GO #10#)))))))))))
                               #9# (EXIT #3#))
                              (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                              (EXIT NIL)))
                        #10# (EXIT #5#))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |pivotsj| |i| (QREFELT % 8)) 0)
                          (PROGN (LETT #6# |$NoValue|) (GO #11=#:G8)))
                         ('T
                          (SEQ
                           (LETT |l0| (SPADCALL |pivotsj| |i| (QREFELT % 8)))
                           (LETT |ml| (QAREF2O |m| |i| |l0| 1 1))
                           (EXIT
                            (SEQ (LETT |n| 1) (LETT #7# |j|) G190
                                 (COND ((|greater_SI| |n| #7#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((EQL (QAREF1O |pivotsj| |n| 1) 0)
                                     (COND
                                      ((SPADCALL (QAREF2O |m| |n| |l0| 1 1) 0
                                                 (QREFELT % 10))
                                       (SEQ
                                        (LETT |pp|
                                              (-
                                               (* |ml|
                                                  (QAREF2O |m| |n| |l0| 1 1))))
                                        (SEQ (LETT |l| 1) (LETT #8# |k|) G190
                                             (COND
                                              ((|greater_SI| |l| #8#)
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (QSETAREF2O |m| |n| |l|
                                                           (+
                                                            (QAREF2O |m| |n|
                                                                     |l| 1 1)
                                                            (* |pp|
                                                               (QAREF2O |m| |i|
                                                                        |l| 1
                                                                        1)))
                                                           1 1)))
                                             (LETT |l| (|inc_SI| |l|))
                                             (GO G190) G191 (EXIT NIL))
                                        (EXIT 0))))))))
                                 (LETT |n| (|inc_SI| |n|)) (GO G190) G191
                                 (EXIT NIL)))))))))
                     #11# (EXIT #6#))
                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))))) 

(SDEFUN |UGAUSS;pre_lr;M2VM;2|
        ((|m| (|Matrix| (|Integer|))) (|pivotsj| (|Vector| (|Integer|)))
         (|pivotsk| (|Vector| (|Integer|))) (% (|Matrix| (|Integer|))))
        (SPROG
         ((|m2| (|Matrix| (|Integer|))) (|j| (|NonNegativeInteger|))
          (|k| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G61 NIL) (#2=#:G62 NIL)
          (#3=#:G58 NIL) (|pv| #4=(|Integer|)) (#5=#:G59 NIL) (#6=#:G60 NIL)
          (|l0| (|Integer|)) (|ml| #4#) (|n| NIL) (#7=#:G63 NIL)
          (|pp| (|Integer|)) (#8=#:G64 NIL) (|l| NIL) (#9=#:G65 NIL))
         (SEQ (LETT |m2| (SPADCALL (ANROWS |m|) 1 (QREFELT % 14)))
              (SEQ (LETT |j| (ANROWS |m|)) (LETT |k| (ANCOLS |m|))
                   (EXIT
                    (SEQ (LETT |i| 1) (LETT #1# |j|) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ
                            (SEQ
                             (EXIT
                              (SEQ (LETT |l| 1) (LETT #2# |k|) G190
                                   (COND ((|greater_SI| |l| #2#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |pivotsk| |l| (QREFELT % 8))
                                        0 (QREFELT % 10))
                                       (PROGN
                                        (LETT #3# |$NoValue|)
                                        (GO #10=#:G36)))
                                      ('T
                                       (SEQ
                                        (LETT |pv| (QAREF2O |m| |i| |l| 1 1))
                                        (EXIT
                                         (COND
                                          ((EQL |pv| 1)
                                           (SEQ
                                            (SPADCALL |pivotsj| |i| |l|
                                                      (QREFELT % 11))
                                            (SPADCALL |pivotsk| |l| |i|
                                                      (QREFELT % 11))
                                            (EXIT
                                             (PROGN
                                              (LETT #5# |$NoValue|)
                                              (GO #11=#:G42)))))
                                          ((EQL |pv| -1)
                                           (SEQ
                                            (SPADCALL |pivotsj| |i| |l|
                                                      (QREFELT % 11))
                                            (SPADCALL |pivotsk| |l| |i|
                                                      (QREFELT % 11))
                                            (EXIT
                                             (PROGN
                                              (LETT #5# 1)
                                              (GO #11#)))))))))))
                                    #10# (EXIT #3#))
                                   (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                                   (EXIT NIL)))
                             #11# (EXIT #5#))
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |pivotsj| |i| (QREFELT % 8)) 0)
                               (PROGN (LETT #6# |$NoValue|) (GO #12=#:G35)))
                              ('T
                               (SEQ
                                (LETT |l0|
                                      (SPADCALL |pivotsj| |i| (QREFELT % 8)))
                                (LETT |ml| (QAREF2O |m| |i| |l0| 1 1))
                                (EXIT
                                 (SEQ (LETT |n| 1) (LETT #7# |j|) G190
                                      (COND ((|greater_SI| |n| #7#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((EQL (QAREF1O |pivotsj| |n| 1) 0)
                                          (COND
                                           ((SPADCALL
                                             (QAREF2O |m| |n| |l0| 1 1) 0
                                             (QREFELT % 10))
                                            (SEQ
                                             (LETT |pp|
                                                   (-
                                                    (* |ml|
                                                       (QAREF2O |m| |n| |l0| 1
                                                                1))))
                                             (SEQ (LETT |l| 1) (LETT #8# |k|)
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |l| #8#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (QSETAREF2O |m| |n| |l|
                                                                (+
                                                                 (QAREF2O |m|
                                                                          |n|
                                                                          |l| 1
                                                                          1)
                                                                 (* |pp|
                                                                    (QAREF2O
                                                                     |m| |i|
                                                                     |l| 1 1)))
                                                                1 1)))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (SEQ (LETT |l| 1) (LETT #9# |j|)
                                                   G190
                                                   (COND
                                                    ((|greater_SI| |l| #9#)
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (QSETAREF2O |m2| |n| |l|
                                                                 (+
                                                                  (QAREF2O |m2|
                                                                           |n|
                                                                           |l|
                                                                           1 1)
                                                                  (* |pp|
                                                                     (QAREF2O
                                                                      |m2| |i|
                                                                      |l| 1
                                                                      1)))
                                                                 1 1)))
                                                   (LETT |l| (|inc_SI| |l|))
                                                   (GO G190) G191
                                                   (EXIT NIL))))))))))
                                      (LETT |n| (|inc_SI| |n|)) (GO G190) G191
                                      (EXIT NIL)))))))))
                          #12# (EXIT #6#))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))))
              (EXIT |m2|)))) 

(SDEFUN |UGAUSS;pre_gauss;2M;3|
        ((|m| (|Matrix| (|Integer|))) (% (|Matrix| (|Integer|))))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
          (|pivotsj| #1=(|Vector| (|Integer|))) (|pivotsk| #1#))
         (SEQ (LETT |j| (ANROWS |m|)) (LETT |k| (ANCOLS |m|))
              (LETT |pivotsj| (SPADCALL |j| (QREFELT % 16)))
              (LETT |pivotsk| (SPADCALL |k| (QREFELT % 16)))
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| %) (EXIT |m|)))) 

(SDEFUN |UGAUSS;pre_smith;2M;4|
        ((|m| (|Matrix| (|Integer|))) (% (|Matrix| (|Integer|))))
        (SPROG
         ((|j| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|))
          (|pivotsj| #1=(|Vector| (|Integer|))) (|pivotsk| #1#) (#2=#:G84 NIL)
          (|count| #3=(|NonNegativeInteger|)) (#4=#:G71 NIL) (#5=#:G72 NIL)
          (|ress| (|Matrix| (|Integer|))) (|i| NIL) (#6=#:G85 NIL) (|i0| #3#)
          (|l| NIL) (#7=#:G86 NIL) (|l0| #3#))
         (SEQ (LETT |j| (ANROWS |m|)) (LETT |k| (ANCOLS |m|))
              (LETT |pivotsj| (SPADCALL |j| (QREFELT % 16)))
              (LETT |pivotsk| (SPADCALL |k| (QREFELT % 16)))
              (|UGAUSS;pre_gauss0| |m| |pivotsj| |pivotsk| %) (LETT |count| 0)
              (SEQ (LETT |i| 1) (LETT #2# |j|) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |pivotsj| |i| (QREFELT % 8)) 0
                                 (QREFELT % 10))
                       (LETT |count| (+ |count| 1))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((EQL |count| 0) |m|)
                     ('T
                      (SEQ
                       (LETT |ress|
                             (SPADCALL
                              (PROG1 (LETT #4# (- |j| |count|))
                                (|check_subtype2| (>= #4# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #4#))
                              (PROG1 (LETT #5# (- |k| |count|))
                                (|check_subtype2| (>= #5# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #5#))
                              (QREFELT % 18)))
                       (LETT |i0| 0)
                       (SEQ (LETT |i| 1) (LETT #6# |j|) G190
                            (COND ((|greater_SI| |i| #6#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL (SPADCALL |pivotsj| |i| (QREFELT % 8)) 0)
                                (SEQ (LETT |i0| (+ |i0| 1)) (LETT |l0| 0)
                                     (EXIT
                                      (SEQ (LETT |l| 1) (LETT #7# |k|) G190
                                           (COND
                                            ((|greater_SI| |l| #7#) (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((EQL (QAREF1O |pivotsk| |l| 1)
                                                    0)
                                               (SEQ (LETT |l0| (+ |l0| 1))
                                                    (EXIT
                                                     (QSETAREF2O |ress| |i0|
                                                                 |l0|
                                                                 (QAREF2O |m|
                                                                          |i|
                                                                          |l| 1
                                                                          1)
                                                                 1 1)))))))
                                           (LETT |l| (|inc_SI| |l|)) (GO G190)
                                           G191 (EXIT NIL))))))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT |ress|)))))))) 

(DECLAIM (NOTINLINE |UnitGaussianElimination;|)) 

(DEFUN |UnitGaussianElimination;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|UnitGaussianElimination|))
          (LETT % (GETREFV 20))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|UnitGaussianElimination| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |UnitGaussianElimination| ()
  (SPROG NIL
         (PROG (#1=#:G88)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|UnitGaussianElimination|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|UnitGaussianElimination|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|UnitGaussianElimination;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|UnitGaussianElimination|)))))))))) 

(MAKEPROP '|UnitGaussianElimination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (|Vector| 6) (0 . |elt|)
              (|Boolean|) (6 . ~=) (12 . |setelt!|) (|NonNegativeInteger|)
              (|Matrix| 6) (19 . |scalarMatrix|) |UGAUSS;pre_lr;M2VM;2|
              (25 . |zero|) |UGAUSS;pre_gauss;2M;3| (30 . |zero|)
              |UGAUSS;pre_smith;2M;4|)
           '#(|pre_smith| 36 |pre_lr| 41 |pre_gauss| 48) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|pre_gauss|
                                 ((|Matrix| (|Integer|))
                                  (|Matrix| (|Integer|))))
                                T)
                              '((|pre_smith|
                                 ((|Matrix| (|Integer|))
                                  (|Matrix| (|Integer|))))
                                T)
                              '((|pre_lr|
                                 ((|Matrix| (|Integer|)) (|Matrix| (|Integer|))
                                  (|Vector| (|Integer|))
                                  (|Vector| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 19
                                            '(2 7 6 0 6 8 2 6 9 0 0 10 3 7 6 0
                                              6 6 11 2 13 0 12 6 14 1 7 0 12 16
                                              2 13 0 12 12 18 1 0 13 13 19 3 0
                                              13 13 7 7 15 1 0 13 13 17)))))
           '|lookupComplete|)) 
