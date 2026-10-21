
(SDEFUN |ORDSET-;smaller?;2SB;1| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(SDEFUN |ORDSET-;max;3S;2| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| |y| (QREFELT % 10)) |x|) ('T |y|))) 

(SDEFUN |ORDSET-;min;3S;3| ((|x| (S)) (|y| (S)) (% (S)))
        (COND ((SPADCALL |x| |y| (QREFELT % 10)) |y|) ('T |x|))) 

(SDEFUN |ORDSET-;>;2SB;4| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (SPADCALL |y| |x| (QREFELT % 8))) 

(SDEFUN |ORDSET-;>=;2SB;5| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (NULL (SPADCALL |x| |y| (QREFELT % 8)))) 

(SDEFUN |ORDSET-;<=;2SB;6| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (NULL (SPADCALL |y| |x| (QREFELT % 8)))) 

(SDEFUN |ORDSET-;positive?;SB;7| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 16) (QREFELT % 10))) 

(SDEFUN |ORDSET-;negative?;SB;8| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 16) (QREFELT % 8))) 

(SDEFUN |ORDSET-;sign;SI;9| ((|x| (S)) (% (|Integer|)))
        (COND ((SPADCALL |x| (QREFELT % 19)) 1)
              ((SPADCALL |x| (QREFELT % 20)) -1)
              ((SPADCALL |x| (QREFELT % 21)) 0)
              ('T
               (|error| "x satisfies neither positive?, negative? or zero?")))) 

(DECLAIM (NOTINLINE |OrderedSet&;|)) 

(DEFUN |OrderedSet&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrderedSet&| DV$1))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|SetWithZero|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 17
                       (CONS (|dispatchFunction| |ORDSET-;positive?;SB;7|) %))
             (QSETREFV % 18
                       (CONS (|dispatchFunction| |ORDSET-;negative?;SB;8|) %))
             (QSETREFV % 23
                       (CONS (|dispatchFunction| |ORDSET-;sign;SI;9|) %)))))
          %))) 

(MAKEPROP '|OrderedSet&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . <)
              |ORDSET-;smaller?;2SB;1| (6 . >) |ORDSET-;max;3S;2|
              |ORDSET-;min;3S;3| |ORDSET-;>;2SB;4| |ORDSET-;>=;2SB;5|
              |ORDSET-;<=;2SB;6| (12 . |0|) (16 . |positive?|)
              (21 . |negative?|) (26 . |positive?|) (31 . |negative?|)
              (36 . |zero?|) (|Integer|) (41 . |sign|))
           '#(|smaller?| 46 |sign| 52 |positive?| 57 |negative?| 62 |min| 67
              |max| 73 >= 79 > 85 <= 91)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|sign| ((|Integer|) |#1|)) T)
                                   '((|negative?| ((|Boolean|) |#1|)) T)
                                   '((|positive?| ((|Boolean|) |#1|)) T)
                                   '((|min| (|#1| |#1| |#1|)) T)
                                   '((|max| (|#1| |#1| |#1|)) T)
                                   '((<= ((|Boolean|) |#1| |#1|)) T)
                                   '((>= ((|Boolean|) |#1| |#1|)) T)
                                   '((> ((|Boolean|) |#1| |#1|)) T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 23
                                            '(2 6 7 0 0 8 2 6 7 0 0 10 0 6 0 16
                                              1 0 7 0 17 1 0 7 0 18 1 6 7 0 19
                                              1 6 7 0 20 1 6 7 0 21 1 0 22 0 23
                                              2 0 7 0 0 9 1 0 22 0 23 1 0 7 0
                                              17 1 0 7 0 18 2 0 0 0 0 12 2 0 0
                                              0 0 11 2 0 7 0 0 14 2 0 7 0 0 13
                                              2 0 7 0 0 15)))))
           '|lookupComplete|)) 
