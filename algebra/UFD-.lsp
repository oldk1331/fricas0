
(SDEFUN |UFD-;squareFreePart;2S;1| ((|x| (S)) (% (S)))
        (SPROG
         ((|s| (|Factored| S)) (|f| NIL) (#1=#:G22 NIL) (#2=#:G20 (S))
          (#3=#:G18 (S)) (#4=#:G19 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL (LETT |s| (SPADCALL |x| (QREFELT % 8))) (QREFELT % 10))
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |f| NIL) (LETT #1# (SPADCALL |s| (QREFELT % 14))) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |f| (CAR #1#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #2# (QVELT |f| 1))
                    (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 15))))
                          ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
            (COND (#4# #3#) ('T (|spadConstant| % 16))))
           (QREFELT % 15))))) 

(SDEFUN |UFD-;prime?;SB;2| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|f|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| S)
                      (|:| |exponent| (|NonNegativeInteger|))))))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 19)) NIL)
                (#1='T
                 (SEQ
                  (LETT |f|
                        (SPADCALL (SPADCALL |x| (QREFELT % 20))
                                  (QREFELT % 14)))
                  (EXIT
                   (COND
                    ((EQL (LENGTH |f|) 1) (EQL (QVELT (|SPADfirst| |f|) 2) 1))
                    (#1# NIL))))))))) 

(DECLAIM (NOTINLINE |UniqueFactorizationDomain&;|)) 

(DEFUN |UniqueFactorizationDomain&| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|UniqueFactorizationDomain&| DV$1))
          (LETT % (GETREFV 22))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|UniqueFactorizationDomain&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Factored| %)
              (0 . |squareFree|) (|Factored| 6) (5 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 11) (|:| |factor| 6)
                        (|:| |exponent| (|NonNegativeInteger|)))
              (|List| 12) (10 . |factorList|) (15 . *) (21 . |1|)
              |UFD-;squareFreePart;2S;1| (|Boolean|) (25 . |zero?|)
              (30 . |factor|) |UFD-;prime?;SB;2|)
           '#(|squareFreePart| 35 |prime?| 40) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|squareFreePart| (|#1| |#1|)) T)
                                   '((|prime?| ((|Boolean|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 21
                                            '(1 6 7 0 8 1 9 6 0 10 1 9 13 0 14
                                              2 6 0 0 0 15 0 6 0 16 1 6 18 0 19
                                              1 6 7 0 20 1 0 0 0 17 1 0 18 0
                                              21)))))
           '|lookupComplete|)) 
