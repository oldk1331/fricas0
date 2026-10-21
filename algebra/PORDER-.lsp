
(SDEFUN |PORDER-;>=;2SB;1| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL |y| |x| (QREFELT % 8))) 

(SDEFUN |PORDER-;>;2SB;2| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL |y| |x| (QREFELT % 10))) 

(SDEFUN |PORDER-;<;2SB;3| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (COND
         ((SPADCALL |x| |y| (QREFELT % 8))
          (NULL (SPADCALL |y| |x| (QREFELT % 8))))
         ('T NIL))) 

(DECLAIM (NOTINLINE |PartialOrder&;|)) 

(DEFUN |PartialOrder&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|PartialOrder&| DV$1))
          (LETT % (GETREFV 13))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND ((|HasCategory| |#1| '(|OrderedSet|)))
                ('T
                 (QSETREFV % 12
                           (CONS (|dispatchFunction| |PORDER-;<;2SB;3|) %))))
          %))) 

(MAKEPROP '|PartialOrder&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . <=)
              |PORDER-;>=;2SB;1| (6 . <) |PORDER-;>;2SB;2| (12 . <))
           '#(>= 18 > 24 < 30) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((> ((|Boolean|) |#1| |#1|)) T)
                                   '((>= ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 12
                                            '(2 6 7 0 0 8 2 6 7 0 0 10 2 0 7 0
                                              0 12 2 0 7 0 0 9 2 0 7 0 0 11 2 0
                                              7 0 0 12)))))
           '|lookupComplete|)) 
