
(SDEFUN |ALAGG-;coerce;SOf;1| ((|u| (S)) (% (|OutputForm|)))
        (SPROG
         ((#1=#:G17 NIL) (|r| NIL) (#2=#:G18 NIL)
          (|l| (|List| (|OutputForm|))))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |r| NIL) (LETT #2# (SPADCALL |u| (QREFELT % 11)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |r| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL (SPADCALL (QCAR |r|) (QREFELT % 13))
                                         (SPADCALL (QCDR |r|) (QREFELT % 14))
                                         (QREFELT % 15))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT
           (SPADCALL (SPADCALL "table" (QREFELT % 17)) |l| (QREFELT % 19)))))) 

(DECLAIM (NOTINLINE |AssociationListAggregate&;|)) 

(DEFUN |AssociationListAggregate&| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|AssociationListAggregate&| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 21))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#3| '(|CoercibleTo| (|OutputForm|)))
            (QSETREFV % 20
                      (CONS (|dispatchFunction| |ALAGG-;coerce;SOf;1|) %))))
          %))) 

(MAKEPROP '|AssociationListAggregate&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Record| (|:| |key| 7) (|:| |entry| 8))
              (|List| 9) (0 . |parts|) (|OutputForm|) (5 . |coerce|)
              (10 . |coerce|) (15 . =) (|String|) (21 . |message|) (|List| %)
              (26 . |prefix|) (32 . |coerce|))
           '#(|coerce| 37) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 20
                                            '(1 6 10 0 11 1 7 12 0 13 1 8 12 0
                                              14 2 12 0 0 0 15 1 12 0 16 17 2
                                              12 0 0 18 19 1 0 12 0 20 1 0 12 0
                                              20)))))
           '|lookupComplete|)) 
