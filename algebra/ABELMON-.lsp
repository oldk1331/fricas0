
(SDEFUN |ABELMON-;*;Pi2S;1| ((|n| (|PositiveInteger|)) (|x| (S)) (% (S)))
        (SPADCALL |n| |x| (QREFELT % 8))) 

(SDEFUN |ABELMON-;*;Nni2S;2| ((|n| (|NonNegativeInteger|)) (|x| (S)) (% (S)))
        (COND ((ZEROP |n|) (|spadConstant| % 11))
              ('T (SPADCALL |n| |x| (QREFELT % 13))))) 

(SDEFUN |ABELMON-;opposite?;2SB;3| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL (SPADCALL |x| |y| (QREFELT % 15)) (QREFELT % 17))) 

(DECLAIM (NOTINLINE |AbelianMonoid&;|)) 

(DEFUN |AbelianMonoid&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|AbelianMonoid&| DV$1))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND ((|HasCategory| |#1| '(|Ring|)))
                ('T
                 (QSETREFV % 14
                           (CONS (|dispatchFunction| |ABELMON-;*;Nni2S;2|)
                                 %))))
          %))) 

(MAKEPROP '|AbelianMonoid&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . *) (|PositiveInteger|) |ABELMON-;*;Pi2S;1| (6 . |0|)
              (|RepeatedDoubling| 6) (10 . |double|) (16 . *) (22 . +)
              (|Boolean|) (28 . |zero?|) |ABELMON-;opposite?;2SB;3|)
           '#(|opposite?| 33 * 39) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|opposite?| ((|Boolean|) |#1| |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 18
                                            '(2 6 0 7 0 8 0 6 0 11 2 12 6 9 6
                                              13 2 0 0 7 0 14 2 6 0 0 0 15 1 6
                                              16 0 17 2 0 16 0 0 18 2 0 0 7 0
                                              14 2 0 0 9 0 10)))))
           '|lookupComplete|)) 
