
(MAKEPROP '|DBASE;coerce;L%;1| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |DBASE;coerce;L%;1| ((|u| (|List| S)) (% (%))) |u|) 

(SDEFUN |DBASE;elt;%SDl;2|
        ((|data| (%)) (|s| (|Symbol|)) (% (|DataList| (|String|))))
        (SPROG ((#1=#:G5 NIL) (|x| NIL) (#2=#:G6 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |x| NIL) (LETT #2# |data|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1#
                               (CONS (SPADCALL |x| |s| (QREFELT % 11)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 14))))) 

(SDEFUN |DBASE;elt;%Qe%;3| ((|data| (%)) (|eq| (|QueryEquation|)) (% (%)))
        (SPROG
         ((|field| (|Symbol|)) (|val| (|String|))
          (|pu| (|Union| (|LogicalMatchingAutomaton|) "failed"))
          (|pat| (|LogicalMatchingAutomaton|)) (#1=#:G18 NIL) (|x| NIL)
          (#2=#:G19 NIL))
         (SEQ (LETT |field| (SPADCALL |eq| (QREFELT % 17)))
              (LETT |val| (SPADCALL |eq| (QREFELT % 18)))
              (LETT |pu| (SPADCALL |val| NIL (QREFELT % 22)))
              (EXIT
               (COND ((QEQCAR |pu| 1) (|error| "Invalid pattern"))
                     ('T
                      (SEQ (LETT |pat| (QCDR |pu|))
                           (EXIT
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |x| NIL) (LETT #2# |data|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |x| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((SPADCALL |pat|
                                                (SPADCALL |x| |field|
                                                          (QREFELT % 11))
                                                (QREFELT % 24))
                                      (LETT #1# (CONS |x| #1#))))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))))))))) 

(SDEFUN |DBASE;+;3%;4| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 26)) (QREFELT % 27))) 

(SDEFUN |DBASE;-;3%;5| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 30))) 

(SDEFUN |DBASE;coerce;%Of;6| ((|data| (%)) (% (|OutputForm|)))
        (SPADCALL (LENGTH |data|) (QREFELT % 34))) 

(SDEFUN |DBASE;display;%V;7| ((|data| (%)) (% (|Void|)))
        (SPROG ((|x| NIL) (#1=#:G26 NIL))
               (SEQ (LETT |x| NIL) (LETT #1# |data|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |x| (QREFELT % 37))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |DBASE;fullDisplay;%V;8| ((|data| (%)) (% (|Void|)))
        (SPROG ((|x| NIL) (#1=#:G30 NIL))
               (SEQ (LETT |x| NIL) (LETT #1# |data|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ (EXIT (SPADCALL |x| (QREFELT % 39))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))) 

(SDEFUN |DBASE;fullDisplay;%2PiV;9|
        ((|data| (%)) (|n| (|PositiveInteger|)) (|m| (|PositiveInteger|))
         (% (|Void|)))
        (SPROG ((|i| NIL) (#1=#:G35 NIL) (|x| NIL) (#2=#:G34 NIL))
               (SEQ (LETT |i| 1) (LETT #1# |m|) (LETT |x| NIL)
                    (LETT #2# |data|) G190
                    (COND
                     ((OR (ATOM #2#) (PROGN (LETT |x| (CAR #2#)) NIL)
                          (|greater_SI| |i| #1#))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND ((>= |i| |n|) (SPADCALL |x| (QREFELT % 39))))))
                    (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                    (GO G190) G191 (EXIT NIL)))) 

(DECLAIM (NOTINLINE |Database;|)) 

(DEFUN |Database;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Database| DV$1))
          (LETT % (GETREFV 43))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Database| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|List| |#1|))
          %))) 

(DEFUN |Database| (#1=#:G36)
  (SPROG NIL
         (PROG (#2=#:G37)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Database|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Database;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Database|)))))))))) 

(MAKEPROP '|Database| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|) '|Rep|
              |DBASE;coerce;L%;1| (|String|) (|Symbol|) (0 . |elt|) (|List| 9)
              (|DataList| 9) (6 . |coerce|) |DBASE;elt;%SDl;2|
              (|QueryEquation|) (11 . |variable|) (16 . |value|)
              (|Union| 23 '"failed") (|Boolean|)
              (|LogicalRegularExpressionMatch|) (21 . |parse_pattern|)
              (|LogicalMatchingAutomaton|) (27 . |do_match|) |DBASE;elt;%Qe%;3|
              (33 . |merge|) (39 . |removeDuplicates!|) |DBASE;+;3%;4|
              (|MergeThing| 6) (44 . |mergeDifference|) |DBASE;-;3%;5|
              (|OutputForm|) (|NonNegativeInteger|) (50 . |coerce|)
              |DBASE;coerce;%Of;6| (|Void|) (55 . |display|)
              |DBASE;display;%V;7| (60 . |fullDisplay|)
              |DBASE;fullDisplay;%V;8| (|PositiveInteger|)
              |DBASE;fullDisplay;%2PiV;9|)
           '#(~= 65 |latex| 71 |fullDisplay| 76 |elt| 88 |display| 100 |coerce|
              105 = 115 - 121 + 127)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 32) (|BasicType|))
                        (|makeByteWordVec2| 42
                                            '(2 6 9 0 10 11 1 13 0 12 14 1 16
                                              10 0 17 1 16 9 0 18 2 21 19 9 20
                                              22 2 23 20 0 9 24 2 7 0 0 0 26 1
                                              7 0 0 27 2 29 5 5 5 30 1 33 32 0
                                              34 1 6 36 0 37 1 6 36 0 39 2 0 20
                                              0 0 1 1 0 9 0 1 1 0 36 0 40 3 0
                                              36 0 41 41 42 2 0 0 0 16 25 2 0
                                              13 0 10 15 1 0 36 0 38 1 0 32 0
                                              35 1 0 0 5 8 2 0 20 0 0 1 2 0 0 0
                                              0 31 2 0 0 0 0 28)))))
           '|lookupComplete|)) 
