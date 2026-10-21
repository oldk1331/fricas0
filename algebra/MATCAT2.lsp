
(SDEFUN |MATCAT2;map;MM1M2;1| ((|f| (|Mapping| R2 R1)) (|m| (M1)) (% (M2)))
        (SPROG
         ((|ans| (M2)) (|k| NIL) (#1=#:G8 NIL) (|i| NIL) (#2=#:G7 NIL)
          (|l| NIL) (#3=#:G10 NIL) (|j| NIL) (#4=#:G9 NIL))
         (SEQ
          (LETT |ans|
                (SPADCALL (SPADCALL |m| (QREFELT % 15))
                          (SPADCALL |m| (QREFELT % 16)) (|spadConstant| % 17)
                          (QREFELT % 18)))
          (SEQ (LETT |k| (SPADCALL |ans| (QREFELT % 22)))
               (LETT #1# (SPADCALL |ans| (QREFELT % 23)))
               (LETT |i| (SPADCALL |m| (QREFELT % 20)))
               (LETT #2# (SPADCALL |m| (QREFELT % 21))) G190
               (COND ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |l| (SPADCALL |ans| (QREFELT % 26)))
                      (LETT #3# (SPADCALL |ans| (QREFELT % 27)))
                      (LETT |j| (SPADCALL |m| (QREFELT % 24)))
                      (LETT #4# (SPADCALL |m| (QREFELT % 25))) G190
                      (COND ((OR (> |j| #4#) (> |l| #3#)) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |ans| |k| |l|
                                  (SPADCALL
                                   (SPADCALL |m| |i| |j| (QREFELT % 28)) |f|)
                                  (QREFELT % 29))))
                      (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                      (GO G190) G191 (EXIT NIL))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |ans|)))) 

(SDEFUN |MATCAT2;map;MM1U;2|
        ((|f| (|Mapping| (|Union| R2 "failed") R1)) (|m| (M1))
         (% (|Union| M2 "failed")))
        (SPROG
         ((|ans| (M2)) (|k| NIL) (#1=#:G33 NIL) (|i| NIL) (#2=#:G32 NIL)
          (|l| NIL) (#3=#:G35 NIL) (|j| NIL) (#4=#:G34 NIL)
          (|r| (|Union| R2 #5="failed")) (#6=#:G31 NIL) (#7=#:G17 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |m| (QREFELT % 15))
                            (SPADCALL |m| (QREFELT % 16)) (|spadConstant| % 17)
                            (QREFELT % 18)))
            (SEQ (LETT |k| (SPADCALL |ans| (QREFELT % 22)))
                 (LETT #1# (SPADCALL |ans| (QREFELT % 23)))
                 (LETT |i| (SPADCALL |m| (QREFELT % 20)))
                 (LETT #2# (SPADCALL |m| (QREFELT % 21))) G190
                 (COND ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |l| (SPADCALL |ans| (QREFELT % 26)))
                        (LETT #3# (SPADCALL |ans| (QREFELT % 27)))
                        (LETT |j| (SPADCALL |m| (QREFELT % 24)))
                        (LETT #4# (SPADCALL |m| (QREFELT % 25))) G190
                        (COND ((OR (> |j| #4#) (> |l| #3#)) (GO G191)))
                        (SEQ
                         (LETT |r|
                               (SPADCALL (SPADCALL |m| |i| |j| (QREFELT % 28))
                                         |f|))
                         (EXIT
                          (COND
                           ((SPADCALL |r| (CONS 1 "failed") (QREFELT % 34))
                            (PROGN (LETT #6# (CONS 1 "failed")) (GO #8=#:G30)))
                           ('T
                            (SPADCALL |ans| |k| |l|
                                      (PROG2 (LETT #7# |r|)
                                          (QCDR #7#)
                                        (|check_union2| (QEQCAR #7# 0)
                                                        (QREFELT % 10)
                                                        (|Union| (QREFELT % 10)
                                                                 #5#)
                                                        #7#))
                                      (QREFELT % 29))))))
                        (LETT |j| (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                        (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                 G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #8# (EXIT #6#)))) 

(SDEFUN |MATCAT2;reduce;MM12R2;3|
        ((|f| (|Mapping| R2 R1 R2)) (|m| (M1)) (|ident| (R2)) (% (R2)))
        (SPROG ((|i| NIL) (#1=#:G43 NIL) (|j| NIL) (#2=#:G44 NIL) (|s| (R2)))
               (SEQ (LETT |s| |ident|)
                    (SEQ (LETT |i| (SPADCALL |m| (QREFELT % 20)))
                         (LETT #1# (SPADCALL |m| (QREFELT % 21))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| (SPADCALL |m| (QREFELT % 24)))
                                (LETT #2# (SPADCALL |m| (QREFELT % 25))) G190
                                (COND ((> |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT |s|
                                        (SPADCALL
                                         (SPADCALL |m| |i| |j| (QREFELT % 28))
                                         |s| |f|))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |s|)))) 

(DECLAIM (NOTINLINE |MatrixCategoryFunctions2;|)) 

(DEFUN |MatrixCategoryFunctions2;| (|#1| |#2| |#3| |#4| |#5| |#6| |#7| |#8|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (DV$6 NIL)
    (DV$7 NIL) (DV$8 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT DV$6 (|devaluate| |#6|))
    (LETT DV$7 (|devaluate| |#7|))
    (LETT DV$8 (|devaluate| |#8|))
    (LETT |dv$|
          (LIST '|MatrixCategoryFunctions2| DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7
                DV$8))
    (LETT % (GETREFV 40))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MatrixCategoryFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5 DV$6 DV$7 DV$8) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (QSETREFV % 11 |#6|)
    (QSETREFV % 12 |#7|)
    (QSETREFV % 13 |#8|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MatrixCategoryFunctions2| (&REST #1=#:G45)
  (SPROG NIL
         (PROG (#2=#:G46)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MatrixCategoryFunctions2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MatrixCategoryFunctions2;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|MatrixCategoryFunctions2|)))))))))) 

(MAKEPROP '|MatrixCategoryFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|local| |#6|)
              (|local| |#7|) (|local| |#8|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (10 . |0|) (14 . |new|) (|Integer|)
              (21 . |minRowIndex|) (26 . |maxRowIndex|) (31 . |minRowIndex|)
              (36 . |maxRowIndex|) (41 . |minColIndex|) (46 . |maxColIndex|)
              (51 . |minColIndex|) (56 . |maxColIndex|) (61 . |qelt|)
              (68 . |qsetelt!|) (|Mapping| 10 6) |MATCAT2;map;MM1M2;1|
              (|Boolean|) (|Union| 10 '"failed") (76 . =)
              (|Union| 13 '"failed") (|Mapping| 33 6) |MATCAT2;map;MM1U;2|
              (|Mapping| 10 6 10) |MATCAT2;reduce;MM12R2;3|)
           '#(|reduce| 82 |map| 89) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|map| (|#8| (|Mapping| |#5| |#1|) |#4|)) T)
                              '((|map|
                                 ((|Union| |#8| "failed")
                                  (|Mapping| (|Union| |#5| "failed") |#1|)
                                  |#4|))
                                T)
                              '((|reduce|
                                 (|#5| (|Mapping| |#5| |#1| |#5|) |#4| |#5|))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 39
                                            '(1 9 14 0 15 1 9 14 0 16 0 10 0 17
                                              3 13 0 14 14 10 18 1 9 19 0 20 1
                                              9 19 0 21 1 13 19 0 22 1 13 19 0
                                              23 1 9 19 0 24 1 9 19 0 25 1 13
                                              19 0 26 1 13 19 0 27 3 9 6 0 19
                                              19 28 4 13 10 0 19 19 10 29 2 33
                                              32 0 0 34 3 0 10 38 9 10 39 2 0
                                              35 36 9 37 2 0 13 30 9 31)))))
           '|lookupComplete|)) 
