
(SDEFUN |FPS-;float;2IS;1| ((|ma| (|Integer|)) (|ex| (|Integer|)) (% (S)))
        (SPADCALL |ma| |ex| (SPADCALL (QREFELT % 8)) (QREFELT % 10))) 

(SDEFUN |FPS-;digits;Pi;2| ((% (|PositiveInteger|)))
        (SPROG ((#1=#:G7 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (|quotient_INT|
                               (* 4004 (- (SPADCALL (QREFELT % 13)) 1))
                               13301)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FPS-;toString;SS;3| ((|x| (S)) (% (|String|)))
        (SPADCALL |x| (QREFELT % 16))) 

(SDEFUN |FPS-;toString;SNniS;4|
        ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (|String|)))
        (SPADCALL
         (CONS (SPADCALL |x| (QREFELT % 18)) (SPADCALL |x| (QREFELT % 19))) |n|
         (VECTOR NIL NIL "fixed" 0 (SPADCALL (QREFELT % 22))) (QREFELT % 26))) 

(DECLAIM (NOTINLINE |FloatingPointSystem&;|)) 

(DEFUN |FloatingPointSystem&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FloatingPointSystem&| DV$1))
          (LETT % (GETREFV 29))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|arbitraryExponent|))
                                              (|HasCategory| |#1|
                                                             '(|arbitraryPrecision|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FloatingPointSystem&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |base|) (|Integer|) (4 . |float|) |FPS-;float;2IS;1|
              (11 . |1|) (15 . |bits|) |FPS-;digits;Pi;2| (|String|)
              (19 . |convert|) |FPS-;toString;SS;3| (24 . |mantissa|)
              (29 . |exponent|) (34 . |0|) (|Character|) (38 . |underscore|)
              (|Record| (|:| |mantissa| 9) (|:| |exponent| 9))
              (|Record| (|:| |default?| (|Boolean|))
                        (|:| |trim_trailing_zeros?| (|Boolean|))
                        (|:| |out_mode| 15) (|:| |spacing| 9)
                        (|:| |separator| 21))
              (|FloatingPointConvertion|) (42 . |fixed_mr|)
              (|NonNegativeInteger|) |FPS-;toString;SNniS;4|)
           '#(|toString| 49 |float| 60 |digits| 66) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|digits|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|digits| ((|PositiveInteger|))) T)
                              '((|toString|
                                 ((|String|) |#1| (|NonNegativeInteger|)))
                                T)
                              '((|toString| ((|String|) |#1|)) T)
                              '((|float|
                                 (|#1| (|Integer|) (|Integer|)
                                  (|PositiveInteger|)))
                                T)
                              '((|float| (|#1| (|Integer|) (|Integer|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 28
                                            '(0 6 7 8 3 6 0 9 9 7 10 0 6 0 12 0
                                              6 7 13 1 6 15 0 16 1 6 9 0 18 1 6
                                              9 0 19 0 6 0 20 0 21 0 22 3 25 15
                                              23 9 24 26 1 0 15 0 17 2 0 15 0
                                              27 28 2 0 0 9 9 11 0 0 7 14)))))
           '|lookupComplete|)) 
