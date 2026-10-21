
(SDEFUN |GUESSF1;F2EXPRR;FE;1| ((|p| (F)) (% (|Expression| (|Integer|))))
        (SPADCALL (SPADCALL |p| (QREFELT % 8)) (QREFELT % 10))) 

(SDEFUN |GUESSF1;expr_to_F| ((|p| (|Expression| (|Integer|))) (% (F)))
        (SPADCALL (SPADCALL |p| (QREFELT % 12)) (QREFELT % 13))) 

(SDEFUN |GUESSF1;EXPRR2F;EF;3| ((|p| (|Expression| (|Integer|))) (% (F)))
        (SPADCALL
         (|GUESSF1;expr_to_F|
          (SPADCALL (SPADCALL |p| (QREFELT % 15)) (QREFELT % 16)) %)
         (|GUESSF1;expr_to_F|
          (SPADCALL (SPADCALL |p| (QREFELT % 17)) (QREFELT % 16)) %)
         (QREFELT % 18))) 

(DECLAIM (NOTINLINE |GuessFiniteFunctions;|)) 

(DEFUN |GuessFiniteFunctions;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GuessFiniteFunctions| DV$1))
          (LETT % (GETREFV 20))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GuessFiniteFunctions| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GuessFiniteFunctions| (#1=#:G3)
  (SPROG NIL
         (PROG (#2=#:G4)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GuessFiniteFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GuessFiniteFunctions;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GuessFiniteFunctions|)))))))))) 

(MAKEPROP '|GuessFiniteFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              (0 . |convert|) (|Expression| 7) (5 . |coerce|)
              |GUESSF1;F2EXPRR;FE;1| (10 . |retract|) (15 . |coerce|)
              (|SparseMultivariatePolynomial| 7 (|Kernel| %)) (20 . |numer|)
              (25 . |coerce|) (30 . |denom|) (35 . /) |GUESSF1;EXPRR2F;EF;3|)
           '#(F2EXPRR 41 EXPRR2F 46) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((F2EXPRR ((|Expression| (|Integer|)) |#1|)) T)
                              '((EXPRR2F (|#1| (|Expression| (|Integer|)))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 19
                                            '(1 6 7 0 8 1 9 0 7 10 1 9 7 0 12 1
                                              6 0 7 13 1 9 14 0 15 1 9 0 14 16
                                              1 9 14 0 17 2 6 0 0 0 18 1 0 9 6
                                              11 1 0 6 9 19)))))
           '|lookupComplete|)) 
