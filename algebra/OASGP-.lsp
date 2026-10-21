
(SDEFUN |OASGP-;abs;2S;1| ((|x| (S)) (% (S)))
        (COND ((SPADCALL |x| (QREFELT % 8)) |x|)
              ((SPADCALL |x| (QREFELT % 9)) (SPADCALL |x| (QREFELT % 10)))
              ((SPADCALL |x| (QREFELT % 11)) (|spadConstant| % 12))
              ('T
               (|error| "x satisfies neither positive?, negative? or zero?")))) 

(DECLAIM (NOTINLINE |OrderedAbelianSemiGroup&;|)) 

(DEFUN |OrderedAbelianSemiGroup&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrderedAbelianSemiGroup&| DV$1))
          (LETT % (GETREFV 14))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 13 (CONS (|dispatchFunction| |OASGP-;abs;2S;1|) %))))
          %))) 

(MAKEPROP '|OrderedAbelianSemiGroup&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|)
              (0 . |positive?|) (5 . |negative?|) (10 . -) (15 . |zero?|)
              (20 . |0|) (24 . |abs|))
           '#(|abs| 29) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory| (LIST '((|abs| (|#1| |#1|)) T))
                                          (LIST) NIL NIL)))
                        (|makeByteWordVec2| 13
                                            '(1 6 7 0 8 1 6 7 0 9 1 6 0 0 10 1
                                              6 7 0 11 0 6 0 12 1 0 0 0 13 1 0
                                              0 0 13)))))
           '|lookupComplete|)) 
