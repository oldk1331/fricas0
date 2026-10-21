
(SDEFUN |GROUPPF1;convert;LLGp;1|
        ((|lg| (|List| S)) (|lr| (|List| (|FreeGroup| S)))
         (% (|GroupPresentation|)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|r| NIL) (#1=#:G18 NIL)
          (|fr| (|List| (|Record| (|:| |gen| S) (|:| |exp| #2=(|Integer|)))))
          (|t| NIL) (#3=#:G19 NIL) (|k| (|Integer|)) (|m| #2#) (#4=#:G20 NIL)
          (|nr| (|List| (|Integer|))) (|nlr| (|List| (|List| (|Integer|))))
          (#5=#:G21 NIL) (|l| NIL) (#6=#:G22 NIL))
         (SEQ (LETT |n| (LENGTH |lg|)) (LETT |nlr| NIL)
              (SEQ (LETT |r| NIL) (LETT #1# |lr|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |nr| NIL)
                        (LETT |fr| (SPADCALL |r| (QREFELT % 10)))
                        (SEQ (LETT |t| NIL) (LETT #3# |fr|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |t| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |k|
                                    (SPADCALL (QCAR |t|) |lg| (QREFELT % 13)))
                              (EXIT
                               (COND
                                ((< |k| 1)
                                 (|error|
                                  (SPADCALL
                                   "convert: relation contains generator"
                                   "not in list of generators"
                                   (QREFELT % 16))))
                                ('T
                                 (SEQ (LETT |m| (QCDR |t|))
                                      (LETT |k|
                                            (COND ((< |m| 0) (- |k|))
                                                  ('T |k|)))
                                      (LETT |m| (ABS |m|))
                                      (EXIT
                                       (SEQ (LETT |l| 1) (LETT #4# |m|) G190
                                            (COND
                                             ((|greater_SI| |l| #4#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT |nr| (CONS |k| |nr|))))
                                            (LETT |l| (|inc_SI| |l|)) (GO G190)
                                            G191 (EXIT NIL))))))))
                             (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (LETT |nlr| (CONS (NREVERSE |nr|) |nlr|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |l| 1) (LETT #6# |n|) G190
                      (COND ((|greater_SI| |l| #6#) (GO G191)))
                      (SEQ (EXIT (LETT #5# (CONS |l| #5#))))
                      (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                (NREVERSE |nlr|) (QREFELT % 20)))))) 

(DECLAIM (NOTINLINE |GroupPresentationFunctions1;|)) 

(DEFUN |GroupPresentationFunctions1;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|GroupPresentationFunctions1| DV$1))
          (LETT % (GETREFV 23))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GroupPresentationFunctions1|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GroupPresentationFunctions1| (#1=#:G23)
  (SPROG NIL
         (PROG (#2=#:G24)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GroupPresentationFunctions1|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GroupPresentationFunctions1;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GroupPresentationFunctions1|)))))))))) 

(MAKEPROP '|GroupPresentationFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|Record| (|:| |gen| 6) (|:| |exp| 11)) (|List| 7)
              (|FreeGroup| 6) (0 . |factors|) (|Integer|) (|List| 6)
              (5 . |position|) (11 . |1|) (|String|) (15 . |elt|)
              (|List| (|NonNegativeInteger|)) (|List| (|List| 11))
              (|GroupPresentation|) (21 . |groupPresentation|) (|List| 9)
              |GROUPPF1;convert;LLGp;1|)
           '#(|convert| 27) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|convert|
                                 ((|GroupPresentation|) (|List| |#1|)
                                  (|List| (|FreeGroup| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 22
                                            '(1 9 8 0 10 2 12 11 6 0 13 0 9 0
                                              14 2 15 0 0 0 16 2 19 0 17 18 20
                                              2 0 19 12 21 22)))))
           '|lookupComplete|)) 
