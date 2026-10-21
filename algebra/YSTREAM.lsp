
(SDEFUN |YSTREAM;Y;MS;1|
        ((|f| (|Mapping| #1=(|Stream| A) (|Stream| A))) (% (|Stream| A)))
        (SPROG ((|y| (|Stream| A)) (|j| #1#))
               (SEQ (LETT |y| (CONS (QREFELT % 7) 0))
                    (LETT |j| (SPADCALL |y| |f|))
                    (RPLACA |y| (SPADCALL |j| (QREFELT % 9)))
                    (RPLACD |y| (SPADCALL |j| (QREFELT % 10))) (EXIT |y|)))) 

(SDEFUN |YSTREAM;Y;MIL;2|
        ((|g| (|Mapping| #1=(|List| (|Stream| A)) (|List| (|Stream| A))))
         (|n| (|Integer|)) (% (|List| (|Stream| A))))
        (SPROG
         ((#2=#:G11 NIL) (|i| NIL) (#3=#:G12 NIL) (|x| (|List| (|Stream| A)))
          (|j| #1#) (|ji| NIL) (#4=#:G14 NIL) (|xi| NIL) (#5=#:G13 NIL))
         (SEQ
          (LETT |x|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                      (COND ((|greater_SI| |i| #3#) (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (CONS (QREFELT % 7) 0) #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |j| (SPADCALL |x| |g|))
          (SEQ (LETT |ji| NIL) (LETT #4# |j|) (LETT |xi| NIL) (LETT #5# |x|)
               G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |xi| (CAR #5#)) NIL) (ATOM #4#)
                     (PROGN (LETT |ji| (CAR #4#)) NIL))
                 (GO G191)))
               (SEQ (RPLACA |xi| (SPADCALL |ji| (QREFELT % 9)))
                    (EXIT (RPLACD |xi| (SPADCALL |ji| (QREFELT % 10)))))
               (LETT #5# (PROG1 (CDR #5#) (LETT #4# (CDR #4#)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(DECLAIM (NOTINLINE |ParadoxicalCombinatorsForStreams;|)) 

(DEFUN |ParadoxicalCombinatorsForStreams;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ParadoxicalCombinatorsForStreams| DV$1))
          (LETT % (GETREFV 17))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ParadoxicalCombinatorsForStreams|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 |$UninitializedStream|)
          %))) 

(DEFUN |ParadoxicalCombinatorsForStreams| (#1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ParadoxicalCombinatorsForStreams|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ParadoxicalCombinatorsForStreams;| #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ParadoxicalCombinatorsForStreams|)))))))))) 

(MAKEPROP '|ParadoxicalCombinatorsForStreams| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|UninitializedStream|
              (|Stream| 6) (0 . |frst|) (5 . |rst|) (|Mapping| 8 8)
              |YSTREAM;Y;MS;1| (|List| 8) (|Mapping| 13 13) (|Integer|)
              |YSTREAM;Y;MIL;2|)
           '#(Y 10) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((Y
                                 ((|Stream| |#1|)
                                  (|Mapping| (|Stream| |#1|) (|Stream| |#1|))))
                                T)
                              '((Y
                                 ((|List| (|Stream| |#1|))
                                  (|Mapping| (|List| (|Stream| |#1|))
                                             (|List| (|Stream| |#1|)))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 16
                                            '(1 8 6 0 9 1 8 0 0 10 1 0 8 11 12
                                              2 0 13 14 15 16)))))
           '|lookupComplete|)) 
