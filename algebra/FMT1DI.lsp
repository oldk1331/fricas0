
(DECLAIM (NOTINLINE |Format1DInput;|)) 

(DEFUN |Format1DInput;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Format1DInput|))
          (LETT % (GETREFV 15))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Format1DInput| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Format1DInput| ()
  (SPROG NIL
         (PROG (#1=#:G5)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Format1DInput|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Format1DInput|
                             (LIST (CONS NIL (CONS 1 (|Format1DInput;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Format1DInput|)))))))))) 

(MAKEPROP '|Format1DInput| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Format1DInternal| (NRTEVAL 'T))
              (|OutputBox|) (|String|) (|OutputForm|) (|Integer|)
              (|Mapping| 6 9 14) (|OperatorHandlers| 10) (|List| 6) (|Boolean|)
              (|List| 8))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0))
                 (CONS '#(|FormatterCategory&| NIL)
                       (CONS '#((|FormatterCategory|) (|CoercibleTo| 8))
                             (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
