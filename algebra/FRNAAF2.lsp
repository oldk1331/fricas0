
(SDEFUN |FRNAAF2;map;MARAS;1| ((|fn| (|Mapping| S R)) (|u| (AR)) (% (AS)))
        (SPROG
         ((|vr| (|Vector| R)) (|vs| (|Vector| S)) (|ba| (|Vector| AS))
          (#1=#:G8 NIL) (|i| NIL) (#2=#:G9 NIL) (#3=#:G7 NIL))
         (SEQ
          (COND
           ((> (SPADCALL (QREFELT % 11)) (SPADCALL (QREFELT % 12)))
            (|error| "map: ranks of algebras do not fit"))
           (#4='T
            (SEQ (LETT |vr| (SPADCALL |u| (QREFELT % 14)))
                 (LETT |vs| (SPADCALL |fn| |vr| (QREFELT % 18)))
                 (EXIT
                  (COND
                   ((EQL (SPADCALL (QREFELT % 11)) (SPADCALL (QREFELT % 12)))
                    (SPADCALL |vs| (QREFELT % 19)))
                   (#4#
                    (SEQ (LETT |ba| (SPADCALL (QREFELT % 21)))
                         (EXIT
                          (SPADCALL |vs|
                                    (PROGN
                                     (LETT #1#
                                           (GETREFV
                                            #5=(SPADCALL (QREFELT % 11))))
                                     (SEQ (LETT |i| 1) (LETT #2# #5#)
                                          (LETT #3# 0) G190
                                          (COND
                                           ((|greater_SI| |i| #2#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SETELT #1# #3#
                                                    (SPADCALL |ba| |i|
                                                              (QREFELT %
                                                                       24)))))
                                          (LETT #3#
                                                (PROG1 (|inc_SI| #3#)
                                                  (LETT |i| (|inc_SI| |i|))))
                                          (GO G190) G191 (EXIT NIL))
                                     #1#)
                                    (QREFELT % 25))))))))))))) 

(DECLAIM (NOTINLINE |FramedNonAssociativeAlgebraFunctions2;|)) 

(DEFUN |FramedNonAssociativeAlgebraFunctions2;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$|
          (LIST '|FramedNonAssociativeAlgebraFunctions2| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 27))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|FramedNonAssociativeAlgebraFunctions2|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |FramedNonAssociativeAlgebraFunctions2| (&REST #1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FramedNonAssociativeAlgebraFunctions2|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |FramedNonAssociativeAlgebraFunctions2;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FramedNonAssociativeAlgebraFunctions2|)))))))))) 

(MAKEPROP '|FramedNonAssociativeAlgebraFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|PositiveInteger|) (0 . |rank|)
              (4 . |rank|) (|Vector| 7) (8 . |coordinates|) (|Vector| 9)
              (|Mapping| 9 7) (|VectorFunctions2| 7 9) (13 . |map|)
              (19 . |represents|) (|Vector| %) (24 . |basis|) (|Integer|)
              (|Vector| 8) (28 . |elt|) (34 . |represents|)
              |FRNAAF2;map;MARAS;1|)
           '#(|map| 40) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|map| (|#3| (|Mapping| |#4| |#2|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(0 6 10 11 0 8 10 12 1 6 13 0 14 2
                                              17 15 16 13 18 1 8 0 15 19 0 8 20
                                              21 2 23 8 0 22 24 2 8 0 15 20 25
                                              2 0 8 16 6 26)))))
           '|lookupComplete|)) 
