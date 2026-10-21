
(SDEFUN |FINITE-;random;S;1| ((% (S)))
        (SPROG ((#1=#:G6 NIL))
               (SPADCALL
                (PROG1 (LETT #1# (+ 1 (RANDOM (SPADCALL (QREFELT % 8)))))
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #1#))
                (QREFELT % 10)))) 

(SDEFUN |FINITE-;enumerate;L;2| ((% (|List| S)))
        (SPROG ((#1=#:G13 NIL) (|i| NIL) (#2=#:G14 NIL) (#3=#:G10 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (SPADCALL (QREFELT % 8))) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #3# |i|)
                                  (|check_subtype2| (> #3# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                (QREFELT % 10))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |FINITE-;convert;SIf;3| ((|x| (S)) (% (|InputForm|)))
        (SPADCALL '|index|
                  (LIST
                   (SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 17)))
                  (QREFELT % 21))) 

(SDEFUN |FINITE-;hashUpdate!;HsSHs;4|
        ((|s| (|HashState|)) (|x| (S)) (% (|HashState|)))
        (SPADCALL |s| (SPADCALL |x| (QREFELT % 14)) (QREFELT % 24))) 

(SDEFUN |FINITE-;smaller?;2SB;5| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (< (SPADCALL |x| (QREFELT % 14)) (SPADCALL |y| (QREFELT % 14)))) 

(DECLAIM (NOTINLINE |Finite&;|)) 

(DEFUN |Finite&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Finite&| DV$1))
          (LETT % (GETREFV 28))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND ((|HasCategory| |#1| '(|OrderedSet|)))
                ('T
                 (QSETREFV % 27
                           (CONS (|dispatchFunction| |FINITE-;smaller?;2SB;5|)
                                 %))))
          %))) 

(MAKEPROP '|Finite&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |size|) (|PositiveInteger|) (4 . |index|)
              |FINITE-;random;S;1| (|List| %) |FINITE-;enumerate;L;2|
              (9 . |lookup|) (|Integer|) (|InputForm|) (14 . |convert|)
              (|Symbol|) (|List| 16) (|InputFormFunctions1| 6)
              (19 . |packageCall|) |FINITE-;convert;SIf;3| (|HashState|)
              (25 . |hashUpdate!|) |FINITE-;hashUpdate!;HsSHs;4| (|Boolean|)
              (31 . |smaller?|))
           '#(|smaller?| 37 |random| 43 |hashUpdate!| 47 |enumerate| 53
              |convert| 57)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|enumerate| ((|List| |#1|))) T)
                                   '((|random| (|#1|)) T)
                                   '((|hashUpdate!|
                                      ((|HashState|) (|HashState|) |#1|))
                                     T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|convert| ((|InputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 27
                                            '(0 6 7 8 1 6 0 9 10 1 6 9 0 14 1
                                              16 0 15 17 2 20 16 18 19 21 2 15
                                              23 23 0 24 2 0 26 0 0 27 2 0 26 0
                                              0 27 0 0 0 11 2 0 23 23 0 25 0 0
                                              12 13 1 0 16 0 22)))))
           '|lookupComplete|)) 
