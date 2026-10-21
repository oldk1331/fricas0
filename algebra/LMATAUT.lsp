
(MAKEPROP '|LMATAUT;convert;Bma%;1| '|SPADreplace| '(XLAM (|ba|) (CONS 1 |ba|))) 

(SDEFUN |LMATAUT;convert;Bma%;1| ((|ba| (|BasicMatchingAutomaton|)) (% (%)))
        (CONS 1 |ba|)) 

(SDEFUN |LMATAUT;make_and;L%;2| ((|al| (|List| %)) (% (%)))
        (CONS 0 (CONS '|and| |al|))) 

(SDEFUN |LMATAUT;make_or;L%;3| ((|al| (|List| %)) (% (%)))
        (CONS 0 (CONS '|or| |al|))) 

(SDEFUN |LMATAUT;make_not;2%;4| ((|a| (%)) (% (%)))
        (CONS 0 (CONS '|not| (LIST |a|)))) 

(SDEFUN |LMATAUT;do_match;%SB;5| ((|a| (%)) (|s| (|String|)) (% (|Boolean|)))
        (SPROG
         ((|ar| (%))
          (|r| (|Record| (|:| |op| (|Symbol|)) (|:| |al| (|List| %))))
          (#1=#:G50 NIL) (|a1| NIL) (#2=#:G51 NIL) (#3=#:G49 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |ar| |a|)
                (EXIT
                 (COND
                  ((QEQCAR |ar| 1) (SPADCALL (QCDR |ar|) |s| (QREFELT % 15)))
                  (#4='T
                   (SEQ (LETT |r| (QCDR |ar|))
                        (EXIT
                         (COND
                          ((EQUAL (QCAR |r|) '|and|)
                           (SEQ
                            (SEQ (LETT |a1| NIL) (LETT #1# (QCDR |r|)) G190
                                 (COND
                                  ((OR (ATOM #1#)
                                       (PROGN (LETT |a1| (CAR #1#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL (SPADCALL |a1| |s| (QREFELT % 16)))
                                     (PROGN (LETT #3# NIL) (GO #5=#:G48))))))
                                 (LETT #1# (CDR #1#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT 'T)))
                          ((EQUAL (QCAR |r|) '|or|)
                           (SEQ
                            (SEQ (LETT |a1| NIL) (LETT #2# (QCDR |r|)) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |a1| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((SPADCALL |a1| |s| (QREFELT % 16))
                                     (PROGN (LETT #3# 'T) (GO #5#))))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT NIL)))
                          ((EQUAL (QCAR |r|) '|not|)
                           (COND
                            ((NULL
                              (EQL (SPADCALL (QCDR |r|) (QREFELT % 19)) 1))
                             (|error| "do_match: wrong representation"))
                            ('T
                             (NULL
                              (SPADCALL (SPADCALL (QCDR |r|) (QREFELT % 20))
                                        |s| (QREFELT % 16))))))
                          (#4#
                           (|error| "do_match: wrong representation"))))))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |LogicalMatchingAutomaton;|)) 

(DEFUN |LogicalMatchingAutomaton;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LogicalMatchingAutomaton|))
          (LETT % (GETREFV 21))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LogicalMatchingAutomaton| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Union|
                     (|Record| (|:| |op| (|Symbol|)) (|:| |al| (|List| %)))
                     (|BasicMatchingAutomaton|)))
          %))) 

(DEFUN |LogicalMatchingAutomaton| ()
  (SPROG NIL
         (PROG (#1=#:G53)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|LogicalMatchingAutomaton|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|LogicalMatchingAutomaton|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|LogicalMatchingAutomaton;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|LogicalMatchingAutomaton|)))))))))) 

(MAKEPROP '|LogicalMatchingAutomaton| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|BasicMatchingAutomaton|)
              |LMATAUT;convert;Bma%;1| (|List| %) |LMATAUT;make_and;L%;2|
              |LMATAUT;make_or;L%;3| |LMATAUT;make_not;2%;4| (|Boolean|)
              (|String|) (0 . |do_match|) |LMATAUT;do_match;%SB;5|
              (|NonNegativeInteger|) (|List| $$) (6 . |#|) (11 . |first|))
           '#(|make_or| 16 |make_not| 21 |make_and| 26 |do_match| 31 |convert|
              37)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|do_match| ((|Boolean|) $$ (|String|))) T)
                              '((|convert| ($$ (|BasicMatchingAutomaton|))) T)
                              '((|make_and| ($$ (|List| $$))) T)
                              '((|make_or| ($$ (|List| $$))) T)
                              '((|make_not| ($$ $$)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 20
                                            '(2 7 13 0 14 15 1 18 17 0 19 1 18
                                              2 0 20 1 0 0 9 11 1 0 0 0 12 1 0
                                              0 9 10 2 0 13 0 14 16 1 0 0 7
                                              8)))))
           '|lookupComplete|)) 
