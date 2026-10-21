
(SDEFUN |ORDFUNS;pureLex;2VB;1|
        ((|v1| (|Vector| S)) (|v2| (|Vector| S)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G13 NIL) (#2=#:G12 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 8)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QAREF1O |v1| |i| 1) (QAREF1O |v2| |i| 1)
                                    (QREFELT % 10))
                          (PROGN (LETT #2# 'T) (GO #3=#:G11))))
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1O |v2| |i| 1) (QAREF1O |v1| |i| 1)
                                     (QREFELT % 10))
                           (PROGN (LETT #2# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT NIL)))
                #3# (EXIT #2#)))) 

(SDEFUN |ORDFUNS;totalLex;2VB;2|
        ((|v1| (|Vector| S)) (|v2| (|Vector| S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G25 NIL) (|n1| (S)) (|n2| (S)) (|i| NIL) (#2=#:G26 NIL)
          (#3=#:G24 NIL))
         (SEQ
          (EXIT
           (COND ((< (QREFELT % 8) 1) NIL)
                 (#4='T
                  (SEQ (LETT |n1| (QAREF1O |v1| 1 1))
                       (LETT |n2| (QAREF1O |v2| 1 1))
                       (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 8)) G190
                            (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (LETT |n1|
                                   (SPADCALL |n1| (QAREF1O |v1| |i| 1)
                                             (QREFELT % 13)))
                             (EXIT
                              (LETT |n2|
                                    (SPADCALL |n2| (QAREF1O |v2| |i| 1)
                                              (QREFELT % 13)))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL))
                       (EXIT
                        (COND ((SPADCALL |n1| |n2| (QREFELT % 10)) 'T)
                              ((SPADCALL |n2| |n1| (QREFELT % 10)) NIL)
                              (#4#
                               (SEQ
                                (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 8)) G190
                                     (COND ((|greater_SI| |i| #2#) (GO G191)))
                                     (SEQ
                                      (COND
                                       ((SPADCALL (QAREF1O |v1| |i| 1)
                                                  (QAREF1O |v2| |i| 1)
                                                  (QREFELT % 10))
                                        (PROGN (LETT #3# 'T) (GO #5=#:G23))))
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QAREF1O |v2| |i| 1)
                                                   (QAREF1O |v1| |i| 1)
                                                   (QREFELT % 10))
                                         (PROGN (LETT #3# NIL) (GO #5#))))))
                                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT NIL)))))))))
          #5# (EXIT #3#)))) 

(SDEFUN |ORDFUNS;reverseLex;2VB;3|
        ((|v1| (|Vector| S)) (|v2| (|Vector| S)) (% (|Boolean|)))
        (SPROG ((#1=#:G38 NIL) (|n1| (S)) (|n2| (S)) (|i| NIL) (#2=#:G37 NIL))
               (SEQ
                (EXIT
                 (COND ((< (QREFELT % 8) 1) NIL)
                       (#3='T
                        (SEQ (LETT |n1| (QAREF1O |v1| 1 1))
                             (LETT |n2| (QAREF1O |v2| 1 1))
                             (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 8)) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |n1|
                                         (SPADCALL |n1| (QAREF1O |v1| |i| 1)
                                                   (QREFELT % 13)))
                                   (EXIT
                                    (LETT |n2|
                                          (SPADCALL |n2| (QAREF1O |v2| |i| 1)
                                                    (QREFELT % 13)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND ((SPADCALL |n1| |n2| (QREFELT % 10)) 'T)
                                    ((SPADCALL |n2| |n1| (QREFELT % 10)) NIL)
                                    (#3#
                                     (SEQ
                                      (SEQ (LETT |i| (QREFELT % 8)) G190
                                           (COND ((< |i| 1) (GO G191)))
                                           (SEQ
                                            (COND
                                             ((SPADCALL (QAREF1O |v2| |i| 1)
                                                        (QAREF1O |v1| |i| 1)
                                                        (QREFELT % 10))
                                              (PROGN
                                               (LETT #2# 'T)
                                               (GO #4=#:G36))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL (QAREF1O |v1| |i| 1)
                                                         (QAREF1O |v2| |i| 1)
                                                         (QREFELT % 10))
                                               (PROGN
                                                (LETT #2# NIL)
                                                (GO #4#))))))
                                           (LETT |i| (+ |i| -1)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT NIL)))))))))
                #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |OrderingFunctions;|)) 

(DEFUN |OrderingFunctions;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|OrderingFunctions| DV$1 DV$2))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrderingFunctions| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 |#1|)
          %))) 

(DEFUN |OrderingFunctions| (&REST #1=#:G39)
  (SPROG NIL
         (PROG (#2=#:G40)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|OrderingFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrderingFunctions;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OrderingFunctions|)))))))))) 

(MAKEPROP '|OrderingFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|n|
              (|Boolean|) (0 . <) (|Vector| 7) |ORDFUNS;pureLex;2VB;1| (6 . +)
              |ORDFUNS;totalLex;2VB;2| |ORDFUNS;reverseLex;2VB;3|)
           '#(|totalLex| 12 |reverseLex| 18 |pureLex| 24) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|pureLex|
                                 ((|Boolean|) (|Vector| |#2|) (|Vector| |#2|)))
                                T)
                              '((|totalLex|
                                 ((|Boolean|) (|Vector| |#2|) (|Vector| |#2|)))
                                T)
                              '((|reverseLex|
                                 ((|Boolean|) (|Vector| |#2|) (|Vector| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 15
                                            '(2 7 9 0 0 10 2 7 0 0 0 13 2 0 9
                                              11 11 14 2 0 9 11 11 15 2 0 9 11
                                              11 12)))))
           '|lookupComplete|)) 
