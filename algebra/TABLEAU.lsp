
(MAKEPROP '|TABLEAU;tableau;L%;1| '|SPADreplace| '(XLAM (|lls|) |lls|)) 

(SDEFUN |TABLEAU;tableau;L%;1| ((|lls| (|List| (|List| S))) (% (%))) |lls|) 

(MAKEPROP '|TABLEAU;listOfLists;%L;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |TABLEAU;listOfLists;%L;2| ((|x| (%)) (% (|List| (|List| S)))) |x|) 

(SDEFUN |TABLEAU;makeupv|
        ((|n| (|NonNegativeInteger|)) (|ls| (|List| S))
         (% (|List| (|OutputForm|))))
        (SPROG
         ((|v| (|List| (|OutputForm|))) (|s| NIL) (#1=#:G8 NIL) (|i| NIL)
          (#2=#:G7 NIL))
         (SEQ
          (LETT |v|
                (SPADCALL |n| (SPADCALL " " (QREFELT % 13)) (QREFELT % 16)))
          (SEQ (LETT |s| NIL) (LETT #1# |ls|) (LETT |i| 1)
               (LETT #2# (LENGTH |ls|)) G190
               (COND
                ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                     (PROGN (LETT |s| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |v| |i|
                           (SPADCALL (SPADCALL |s| (QREFELT % 17))
                                     (QREFELT % 18))
                           (QREFELT % 20))))
               (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#)))) (GO G190)
               G191 (EXIT NIL))
          (EXIT |v|)))) 

(SDEFUN |TABLEAU;maketab| ((|lls| (|List| (|List| S))) (% (|OutputForm|)))
        (SPROG
         ((|sz| (|NonNegativeInteger|)) (#1=#:G15 NIL) (|i| NIL) (#2=#:G16 NIL)
          (|ll| (|List| (|OutputForm|))))
         (SEQ
          (LETT |ll|
                (COND ((NULL |lls|) (LIST (SPADCALL (QREFELT % 21))))
                      ('T
                       (SEQ (LETT |sz| (LENGTH (|SPADfirst| |lls|)))
                            (EXIT
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |i| NIL) (LETT #2# |lls|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |i| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (SPADCALL
                                             (|TABLEAU;makeupv| |sz| |i| %)
                                             (QREFELT % 23))
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#)))))))))
          (EXIT (SPADCALL |ll| (QREFELT % 24)))))) 

(SDEFUN |TABLEAU;coerce;%Of;5| ((|x| (%)) (% (|OutputForm|)))
        (|TABLEAU;maketab| (SPADCALL |x| (QREFELT % 10)) %)) 

(DECLAIM (NOTINLINE |Tableau;|)) 

(DEFUN |Tableau;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Tableau| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Tableau| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|List| (|List| |#1|)))
          %))) 

(DEFUN |Tableau| (#1=#:G18)
  (SPROG NIL
         (PROG (#2=#:G19)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Tableau|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Tableau;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Tableau|)))))))))) 

(MAKEPROP '|Tableau| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| (|List| 6))
              |TABLEAU;tableau;L%;1| |TABLEAU;listOfLists;%L;2| (|String|)
              (|OutputForm|) (0 . |message|) (|NonNegativeInteger|) (|List| 12)
              (5 . |new|) (11 . |coerce|) (16 . |box|) (|Integer|)
              (21 . |setelt!|) (28 . |empty|) (|List| %) (32 . |blankSeparate|)
              (37 . |pile|) |TABLEAU;coerce;%Of;5|)
           '#(|tableau| 42 |listOfLists| 47 |coerce| 52) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|CoercibleTo| 12))
                             (|makeByteWordVec2| 25
                                                 '(1 12 0 11 13 2 15 0 14 12 16
                                                   1 6 12 0 17 1 12 0 0 18 3 15
                                                   12 0 19 12 20 0 12 0 21 1 12
                                                   0 22 23 1 12 0 22 24 1 0 0 8
                                                   9 1 0 8 0 10 1 0 12 0
                                                   25)))))
           '|lookupComplete|)) 
