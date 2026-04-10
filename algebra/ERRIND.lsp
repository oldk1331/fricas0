
(PUT '|ERRIND;coerce;L%;1| '|SPADreplace| '(XLAM (|l|) |l|)) 

(SDEFUN |ERRIND;coerce;L%;1| ((|l| (|List| (|String|))) (% (%))) |l|) 

(PUT '|ERRIND;retract;%L;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |ERRIND;retract;%L;2| ((|x| (%)) (% (|List| (|String|)))) |x|) 

(SDEFUN |ERRIND;retractIfCan;%U;3|
        ((|x| (%)) (% (|Union| (|List| (|String|)) "failed")))
        (CONS 0 (SPADCALL |x| (QREFELT % 8)))) 

(SDEFUN |ERRIND;coerce;%Of;4| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 12))) 

(DECLAIM (NOTINLINE |ErrorIndicator;|)) 

(DEFUN |ErrorIndicator;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ErrorIndicator|))
          (LETT % (GETREFV 14))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ErrorIndicator| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |ErrorIndicator| ()
  (SPROG NIL
         (PROG (#1=#:G11)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ErrorIndicator|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ErrorIndicator|
                             (LIST (CONS NIL (CONS 1 (|ErrorIndicator;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ErrorIndicator|)))))))))) 

(MAKEPROP '|ErrorIndicator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| (|String|)) |ERRIND;coerce;L%;1|
              |ERRIND;retract;%L;2| (|Union| 6 '"failed")
              |ERRIND;retractIfCan;%U;3| (|OutputForm|) (0 . |coerce|)
              |ERRIND;coerce;%Of;4|)
           '#(|retractIfCan| 5 |retract| 10 |coerce| 15) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|RetractableTo&| NIL NIL)
                       (CONS
                        '#((|RetractableTo| 6) (|CoercibleTo| 11)
                           (|CoercibleFrom| 6))
                        (|makeByteWordVec2| 13
                                            '(1 6 11 0 12 1 0 9 0 10 1 0 6 0 8
                                              1 0 0 6 7 1 0 11 0 13)))))
           '|lookupComplete|)) 
