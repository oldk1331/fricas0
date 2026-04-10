
(SDEFUN |MTHING;mergeDifference;3L;1|
        ((|x| (|List| S)) (|y| (|List| S)) (% (|List| S)))
        (SPROG ((|res| (|List| S)) (#1=#:G13 NIL) (|fy| (S)) (|fx| (S)))
               (SEQ (LETT |res| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND ((NULL |x|) NIL) ('T (NULL (NULL |y|)))))
                           (GO G191)))
                         (SEQ (LETT |fx| (|SPADfirst| |x|))
                              (LETT |fy| (|SPADfirst| |y|))
                              (EXIT
                               (COND
                                ((SPADCALL |fx| |fy| (QREFELT % 8))
                                 (SEQ (LETT |res| (CONS |fx| |res|))
                                      (EXIT (LETT |x| (CDR |x|)))))
                                ('T
                                 (SEQ (LETT |y| (CDR |y|))
                                      (EXIT
                                       (COND
                                        ((SPADCALL |fy| |fx| (QREFELT % 9))
                                         (LETT |x| (CDR |x|))))))))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT #1# |x|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |fx| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT |res| (CONS |fx| |res|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (NREVERSE |res|))))) 

(DECLAIM (NOTINLINE |MergeThing;|)) 

(DEFUN |MergeThing;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|MergeThing| DV$1))
          (LETT % (GETREFV 12))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MergeThing| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |MergeThing| (#1=#:G14)
  (SPROG NIL
         (PROG (#2=#:G15)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|MergeThing|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|MergeThing;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|MergeThing|)))))))))) 

(MAKEPROP '|MergeThing| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Boolean|) (0 . <)
              (6 . =) (|List| 6) |MTHING;mergeDifference;3L;1|)
           '#(|mergeDifference| 12) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|mergeDifference|
                                 ((|List| |#1|) (|List| |#1|) (|List| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 11
                                            '(2 6 7 0 0 8 2 6 7 0 0 9 2 0 10 10
                                              10 11)))))
           '|lookupComplete|)) 
