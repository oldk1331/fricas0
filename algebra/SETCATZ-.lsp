
(SDEFUN |SETCATZ-;zero?;SB;1| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 9))) 

(SDEFUN |SETCATZ-;sample;S;2| ((% (S))) (|spadConstant| % 7)) 

(DECLAIM (NOTINLINE |SetWithZero&;|)) 

(DEFUN |SetWithZero&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SetWithZero&| DV$1))
          (LETT % (GETREFV 12))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|SetWithZero&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |0|) (|Boolean|)
              (4 . =) |SETCATZ-;zero?;SB;1| |SETCATZ-;sample;S;2|)
           '#(|zero?| 10 |sample| 15) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|zero?| ((|Boolean|) |#1|)) T)
                                   '((|sample| (|#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 11
                                            '(0 6 0 7 2 6 8 0 0 9 1 0 8 0 10 0
                                              0 0 11)))))
           '|lookupComplete|)) 
