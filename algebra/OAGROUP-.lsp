
(SDEFUN |OAGROUP-;positive?;SB;1| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 9))) 

(SDEFUN |OAGROUP-;negative?;SB;2| ((|x| (S)) (% (|Boolean|)))
        (SPADCALL |x| (|spadConstant| % 7) (QREFELT % 11))) 

(SDEFUN |OAGROUP-;sign;SI;3| ((|x| (S)) (% (|Integer|)))
        (COND ((SPADCALL |x| (QREFELT % 13)) 1)
              ((SPADCALL |x| (QREFELT % 14)) -1)
              ((SPADCALL |x| (QREFELT % 15)) 0)
              ('T
               (|error| "x satisfies neither positive?, negative? or zero?")))) 

(SDEFUN |OAGROUP-;abs;2S;4| ((|x| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 13)) |x|)
              ((SPADCALL |x| (QREFELT % 14)) (SPADCALL |x| (QREFELT % 18)))
              ((SPADCALL |x| (QREFELT % 15)) (|spadConstant| % 7))
              ('T
               (|error| "x satisfies neither positive?, negative? or zero?")))) 

(DECLAIM (NOTINLINE |OrderedAbelianGroup&;|)) 

(DEFUN |OrderedAbelianGroup&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrderedAbelianGroup&| DV$1))
          (LETT % (GETREFV 20))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|OrderedAbelianGroup&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |Zero|) (|Boolean|)
              (4 . >) |OAGROUP-;positive?;SB;1| (10 . <)
              |OAGROUP-;negative?;SB;2| (16 . |positive?|) (21 . |negative?|)
              (26 . |zero?|) (|Integer|) |OAGROUP-;sign;SI;3| (31 . -)
              |OAGROUP-;abs;2S;4|)
           '#(|sign| 36 |positive?| 41 |negative?| 46 |abs| 51) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|abs| (|#1| |#1|)) T)
                                   '((|sign| ((|Integer|) |#1|)) T)
                                   '((|negative?| ((|Boolean|) |#1|)) T)
                                   '((|positive?| ((|Boolean|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 19
                                            '(0 6 0 7 2 6 8 0 0 9 2 6 8 0 0 11
                                              1 6 8 0 13 1 6 8 0 14 1 6 8 0 15
                                              1 6 0 0 18 1 0 16 0 17 1 0 8 0 10
                                              1 0 8 0 12 1 0 0 0 19)))))
           '|lookupComplete|)) 
