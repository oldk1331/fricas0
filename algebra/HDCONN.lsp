
(SDEFUN |HDCONN;send_line;SV;1| ((|l| (|String|)) (% (|Void|)))
        (SEQ (|sockSendInt| |$MenuServer| 98)
             (EXIT (|sockSendString| |$MenuServer| |l|)))) 

(MAKEPROP '|HDCONN;end_page;V;2| '|SPADreplace|
          '(XLAM NIL (|sockSendInt| |$MenuServer| 99))) 

(SDEFUN |HDCONN;end_page;V;2| ((% (|Void|))) (|sockSendInt| |$MenuServer| 99)) 

(DECLAIM (NOTINLINE |HyperdocConnection;|)) 

(DEFUN |HyperdocConnection;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HyperdocConnection|))
          (LETT % (GETREFV 10))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HyperdocConnection| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |HyperdocConnection| ()
  (SPROG NIL
         (PROG (#1=#:G4)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocConnection|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocConnection|
                             (LIST
                              (CONS NIL (CONS 1 (|HyperdocConnection;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|HyperdocConnection|)))))))))) 

(MAKEPROP '|HyperdocConnection| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Void|) (|String|)
              |HDCONN;send_line;SV;1| |HDCONN;end_page;V;2|)
           '#(|send_line| 0 |end_page| 5) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|send_line| ((|Void|) (|String|))) T)
                                   '((|end_page| ((|Void|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 9 '(1 0 6 7 8 0 0 6 9)))))
           '|lookupComplete|)) 
