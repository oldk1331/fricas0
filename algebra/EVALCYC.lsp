
(SDEFUN |EVALCYC;evp|
        ((|fn| (|Mapping| F (|Integer|))) (|pt| (|Partition|)) (% (F)))
        (SPROG
         ((|i| NIL) (#1=#:G4 NIL) (#2=#:G2 (F)) (#3=#:G0 (F)) (#4=#:G1 NIL))
         (SEQ
          (PROGN
           (LETT #4# NIL)
           (SEQ (LETT |i| NIL) (LETT #1# (SPADCALL |pt| (QREFELT % 9))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2# (SPADCALL |i| |fn|))
                   (COND (#4# (LETT #3# (SPADCALL #3# #2# (QREFELT % 10))))
                         ('T (PROGN (LETT #3# #2#) (LETT #4# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#4# #3#) ('T (|spadConstant| % 11))))))) 

(SDEFUN |EVALCYC;eval;MSpF;2|
        ((|fn| (|Mapping| F (|Integer|)))
         (|spol| (|SymmetricPolynomial| (|Fraction| (|Integer|)))) (% (F)))
        (COND
         ((SPADCALL |spol| (|spadConstant| % 15) (QREFELT % 17))
          (|spadConstant| % 12))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |spol| (QREFELT % 19))
                     (|EVALCYC;evp| |fn| (SPADCALL |spol| (QREFELT % 20)) %)
                     (QREFELT % 21))
           (SPADCALL |fn| (SPADCALL |spol| (QREFELT % 22)) (QREFELT % 24))
           (QREFELT % 25))))) 

(DECLAIM (NOTINLINE |EvaluateCycleIndicators;|)) 

(DEFUN |EvaluateCycleIndicators;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|EvaluateCycleIndicators| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|EvaluateCycleIndicators|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |EvaluateCycleIndicators| (#1=#:G9)
  (SPROG NIL
         (PROG (#2=#:G10)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|EvaluateCycleIndicators|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|EvaluateCycleIndicators;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|EvaluateCycleIndicators|)))))))))) 

(MAKEPROP '|EvaluateCycleIndicators| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|List| (|Integer|))
              (|Partition|) (0 . |coerce|) (5 . *) (11 . |1|) (15 . |0|)
              (19 . |0|) (|SymmetricPolynomial| 18) (23 . |0|) (|Boolean|)
              (27 . =) (|Fraction| (|Integer|)) (33 . |leadingCoefficient|)
              (38 . |degree|) (43 . *) (49 . |reductum|)
              (|Mapping| 6 (|Integer|)) |EVALCYC;eval;MSpF;2| (54 . +))
           '#(|eval| 60) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|eval|
                                 (|#1| (|Mapping| |#1| (|Integer|))
                                  (|SymmetricPolynomial|
                                   (|Fraction| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(1 8 7 0 9 2 6 0 0 0 10 0 6 0 11 0
                                              6 0 12 0 8 0 13 0 14 0 15 2 14 16
                                              0 0 17 1 14 18 0 19 1 14 8 0 20 2
                                              6 0 18 0 21 1 14 0 0 22 2 6 0 0 0
                                              25 2 0 6 23 14 24)))))
           '|lookupComplete|)) 
