
(SDEFUN |TRIMAT;UpTriBddDenomInv;MRM;1| ((A (M)) (|denom| (R)) (% (M)))
        (SPROG
         ((AI (M)) (|offset| (|Integer|)) (#1=#:G24 NIL) (#2=#:G23 NIL)
          (|i| NIL) (#3=#:G25 NIL) (|j| NIL) (#4=#:G26 NIL) (|k| NIL)
          (#5=#:G27 NIL) (#6=#:G18 (R)) (#7=#:G16 (R)) (#8=#:G17 NIL)
          (#9=#:G5 NIL))
         (SEQ
          (LETT AI
                (SPADCALL (SPADCALL A (QREFELT % 11))
                          (SPADCALL A (QREFELT % 11)) (QREFELT % 12)))
          (LETT |offset|
                (- (SPADCALL AI (QREFELT % 14)) (SPADCALL AI (QREFELT % 15))))
          (SEQ (LETT |j| (SPADCALL AI (QREFELT % 14)))
               (LETT #1# (SPADCALL AI (QREFELT % 17)))
               (LETT |i| (SPADCALL AI (QREFELT % 15)))
               (LETT #2# (SPADCALL AI (QREFELT % 16))) G190
               (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL AI |i| |j|
                           (PROG2
                               (LETT #9#
                                     (SPADCALL |denom|
                                               (SPADCALL A |i| |j|
                                                         (QREFELT % 18))
                                               (QREFELT % 20)))
                               (QCDR #9#)
                             (|check_union2| (QEQCAR #9# 0) (QREFELT % 6)
                                             (|Union| (QREFELT % 6)
                                                      #10="failed")
                                             #9#))
                           (QREFELT % 21))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |i| (SPADCALL AI (QREFELT % 15)))
               (LETT #3# (SPADCALL AI (QREFELT % 16))) G190
               (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (+ (+ |offset| |i|) 1))
                      (LETT #4# (SPADCALL AI (QREFELT % 17))) G190
                      (COND ((> |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL AI |i| |j|
                                  (SPADCALL
                                   (PROG2
                                       (LETT #9#
                                             (SPADCALL
                                              (PROGN
                                               (LETT #8# NIL)
                                               (SEQ (LETT |k| (+ |i| |offset|))
                                                    (LETT #5# (- |j| 1)) G190
                                                    (COND
                                                     ((> |k| #5#) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #6#
                                                             (SPADCALL
                                                              (SPADCALL AI |i|
                                                                        |k|
                                                                        (QREFELT
                                                                         % 18))
                                                              (SPADCALL A
                                                                        (- |k|
                                                                           |offset|)
                                                                        |j|
                                                                        (QREFELT
                                                                         % 18))
                                                              (QREFELT % 23)))
                                                       (COND
                                                        (#8#
                                                         (LETT #7#
                                                               (SPADCALL #7#
                                                                         #6#
                                                                         (QREFELT
                                                                          %
                                                                          24))))
                                                        ('T
                                                         (PROGN
                                                          (LETT #7# #6#)
                                                          (LETT #8# 'T)))))))
                                                    (LETT |k| (+ |k| 1))
                                                    (GO G190) G191 (EXIT NIL))
                                               (COND (#8# #7#)
                                                     ('T
                                                      (|spadConstant| % 25))))
                                              (SPADCALL A (- |j| |offset|) |j|
                                                        (QREFELT % 18))
                                              (QREFELT % 20)))
                                       (QCDR #9#)
                                     (|check_union2| (QEQCAR #9# 0)
                                                     (QREFELT % 6)
                                                     (|Union| (QREFELT % 6)
                                                              #10#)
                                                     #9#))
                                   (QREFELT % 26))
                                  (QREFELT % 21))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT AI)))) 

(SDEFUN |TRIMAT;LowTriBddDenomInv;MRM;2| ((A (M)) (|denom| (R)) (% (M)))
        (SPROG
         ((AI (M)) (|offset| (|Integer|)) (#1=#:G49 NIL) (#2=#:G48 NIL)
          (|i| NIL) (#3=#:G50 NIL) (|j| NIL) (#4=#:G51 NIL) (|k| NIL)
          (#5=#:G52 NIL) (#6=#:G43 (R)) (#7=#:G41 (R)) (#8=#:G42 NIL)
          (#9=#:G30 NIL))
         (SEQ
          (LETT AI
                (SPADCALL (SPADCALL A (QREFELT % 11))
                          (SPADCALL A (QREFELT % 11)) (QREFELT % 12)))
          (LETT |offset|
                (- (SPADCALL AI (QREFELT % 14)) (SPADCALL AI (QREFELT % 15))))
          (SEQ (LETT |j| (SPADCALL AI (QREFELT % 14)))
               (LETT #1# (SPADCALL AI (QREFELT % 17)))
               (LETT |i| (SPADCALL AI (QREFELT % 15)))
               (LETT #2# (SPADCALL AI (QREFELT % 16))) G190
               (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL AI |i| |j|
                           (PROG2
                               (LETT #9#
                                     (SPADCALL |denom|
                                               (SPADCALL A |i| |j|
                                                         (QREFELT % 18))
                                               (QREFELT % 20)))
                               (QCDR #9#)
                             (|check_union2| (QEQCAR #9# 0) (QREFELT % 6)
                                             (|Union| (QREFELT % 6)
                                                      #10="failed")
                                             #9#))
                           (QREFELT % 21))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190) G191
               (EXIT NIL))
          (SEQ (LETT |i| (SPADCALL AI (QREFELT % 14)))
               (LETT #3# (SPADCALL AI (QREFELT % 17))) G190
               (COND ((> |i| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| (+ (- |i| |offset|) 1))
                      (LETT #4# (SPADCALL AI (QREFELT % 16))) G190
                      (COND ((> |j| #4#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL AI |j| |i|
                                  (SPADCALL
                                   (PROG2
                                       (LETT #9#
                                             (SPADCALL
                                              (PROGN
                                               (LETT #8# NIL)
                                               (SEQ (LETT |k| (- |i| |offset|))
                                                    (LETT #5# (- |j| 1)) G190
                                                    (COND
                                                     ((> |k| #5#) (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (PROGN
                                                       (LETT #6#
                                                             (SPADCALL
                                                              (SPADCALL A |j|
                                                                        (+ |k|
                                                                           |offset|)
                                                                        (QREFELT
                                                                         % 18))
                                                              (SPADCALL AI |k|
                                                                        |i|
                                                                        (QREFELT
                                                                         % 18))
                                                              (QREFELT % 23)))
                                                       (COND
                                                        (#8#
                                                         (LETT #7#
                                                               (SPADCALL #7#
                                                                         #6#
                                                                         (QREFELT
                                                                          %
                                                                          24))))
                                                        ('T
                                                         (PROGN
                                                          (LETT #7# #6#)
                                                          (LETT #8# 'T)))))))
                                                    (LETT |k| (+ |k| 1))
                                                    (GO G190) G191 (EXIT NIL))
                                               (COND (#8# #7#)
                                                     ('T
                                                      (|spadConstant| % 25))))
                                              (SPADCALL A |j| (+ |j| |offset|)
                                                        (QREFELT % 18))
                                              (QREFELT % 20)))
                                       (QCDR #9#)
                                     (|check_union2| (QEQCAR #9# 0)
                                                     (QREFELT % 6)
                                                     (|Union| (QREFELT % 6)
                                                              #10#)
                                                     #9#))
                                   (QREFELT % 26))
                                  (QREFELT % 21))))
                      (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT AI)))) 

(DECLAIM (NOTINLINE |TriangularMatrixOperations;|)) 

(DEFUN |TriangularMatrixOperations;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|TriangularMatrixOperations| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 29))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|TriangularMatrixOperations|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |TriangularMatrixOperations| (&REST #1=#:G53)
  (SPROG NIL
         (PROG (#2=#:G54)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|TriangularMatrixOperations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |TriangularMatrixOperations;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|TriangularMatrixOperations|)))))))))) 

(MAKEPROP '|TriangularMatrixOperations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |zero|) (|Integer|) (11 . |minColIndex|)
              (16 . |minRowIndex|) (21 . |maxRowIndex|) (26 . |maxColIndex|)
              (31 . |qelt|) (|Union| % '"failed") (38 . |exquo|)
              (44 . |qsetelt!|) (52 . |1|) (56 . *) (62 . +) (68 . |0|)
              (72 . -) |TRIMAT;UpTriBddDenomInv;MRM;1|
              |TRIMAT;LowTriBddDenomInv;MRM;2|)
           '#(|UpTriBddDenomInv| 77 |LowTriBddDenomInv| 83) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|UpTriBddDenomInv| (|#4| |#4| |#1|)) T)
                                   '((|LowTriBddDenomInv| (|#4| |#4| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 28
                                            '(1 9 10 0 11 2 9 0 10 10 12 1 9 13
                                              0 14 1 9 13 0 15 1 9 13 0 16 1 9
                                              13 0 17 3 9 6 0 13 13 18 2 6 19 0
                                              0 20 4 9 6 0 13 13 6 21 0 6 0 22
                                              2 6 0 0 0 23 2 6 0 0 0 24 0 6 0
                                              25 1 6 0 0 26 2 0 9 9 6 27 2 0 9
                                              9 6 28)))))
           '|lookupComplete|)) 
