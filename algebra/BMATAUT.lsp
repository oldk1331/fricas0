
(SDEFUN |BMATAUT;do_match1|
        ((|str| (|String|)) (|s0| #1=(|MatchingAutomatonNode|))
         (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#2=#:G34 NIL) (|c| (|Character|)) (#3=#:G35 NIL)
          (|s1| (|MatchingAutomatonNode|))
          (|su| (|Union| (|MatchingAutomatonNode|) "none")) (#4=#:G31 NIL)
          (|s| (|MatchingAutomatonNode|)) (|sl| (|List| #1#)) (#5=#:G32 NIL)
          (|nsl| (|List| (|MatchingAutomatonNode|))) (#6=#:G36 NIL)
          (#7=#:G33 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |sl| (LIST |s0|)) (LETT |nsl| NIL)
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| 1) (LETT #2# (QCSIZE |str|)) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ (LETT |c| (STR_ELT1 |str| |i|))
                            (SEQ (LETT #3# |sl|) G190
                                 (COND
                                  ((OR (ATOM #3#)
                                       (PROGN (LETT |s| (CAR #3#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ G190 NIL
                                        (SEQ
                                         (LETT |su|
                                               (SPADCALL |s| |c|
                                                         (QREFELT % 10)))
                                         (COND
                                          ((QEQCAR |su| 0)
                                           (SEQ (LETT |s1| (QCDR |su|))
                                                (EXIT
                                                 (COND
                                                  ((NULL
                                                    (EQL
                                                     (SPADCALL |s1| |i|
                                                               (QREFELT % 12))
                                                     |i|))
                                                   (LETT |nsl|
                                                         (CONS |s1|
                                                               |nsl|))))))))
                                         (LETT |su|
                                               (SPADCALL |s| (QREFELT % 13)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |su| 1)
                                            (PROGN
                                             (LETT #4# |$NoValue|)
                                             (GO #8=#:G22)))
                                           ('T (LETT |s| (QCDR |su|))))))
                                        NIL (GO G190) G191 (EXIT NIL)))
                                  #8# (EXIT #4#))
                                 (LETT #3# (CDR #3#)) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |sl| |nsl|)
                            (EXIT
                             (COND
                              ((NULL |sl|) (PROGN (LETT #5# 1) (GO #9=#:G25)))
                              ('T (LETT |nsl| NIL)))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
                 #9# (EXIT #5#))
                (SEQ (LETT #6# |sl|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |s| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |s| (QREFELT % 15))
                         (PROGN (LETT #7# 'T) (GO #10=#:G30))))))
                     (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                (EXIT NIL)))
          #10# (EXIT #7#)))) 

(SDEFUN |BMATAUT;do_match;%SB;2| ((|a| (%)) (|str| (|String|)) (% (|Boolean|)))
        (SPROG
         ((|ra| (|Rep|)) (|sv| (|PrimitiveArray| (|MatchingAutomatonNode|)))
          (|i| NIL) (#1=#:G42 NIL))
         (SEQ (LETT |ra| |a|) (LETT |sv| (QCDR |ra|))
              (SEQ (LETT |i| 0) (LETT #1# (- (QVSIZE |sv|) 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (EXIT (SPADCALL (QAREF1 |sv| |i|) 0 (QREFELT % 12))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (|BMATAUT;do_match1| |str| (QCAR |ra|) %))))) 

(SDEFUN |BMATAUT;make_automaton;L2B%;3|
        ((|pat| (|List| (|String|))) (|pre_wild| (|Boolean|))
         (|post_wild| (|Boolean|)) (% (%)))
        (SPROG
         ((|p1| NIL) (#1=#:G59 NIL) (|start| #2=(|MatchingAutomatonNode|))
          (|i| NIL) (#3=#:G60 NIL) (|c| (|Character|)) (|prev| #2#) (|n| #2#)
          (|sl| (|List| (|MatchingAutomatonNode|)))
          (|sv| (|PrimitiveArray| (|MatchingAutomatonNode|))) (|ra| (%)))
         (SEQ
          (COND
           ((NULL |pat|)
            (COND
             ((OR |pre_wild| |post_wild|)
              (SEQ
               (LETT |n| (SPADCALL 'T (|STR_to_CHAR| " ") 'T (QREFELT % 18)))
               (SPADCALL |n| |n| (QREFELT % 20))
               (LETT |sv| (SPADCALL (LIST |n|) (QREFELT % 23)))
               (EXIT (LETT |ra| (CONS |n| |sv|)))))
             ('T (|error| "empty pattern"))))
           ('T
            (SEQ (LETT |sl| NIL)
                 (SEQ (LETT |p1| NIL) (LETT #1# |pat|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |p1| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (COND
                        (|pre_wild|
                         (SEQ
                          (LETT |n|
                                (SPADCALL 'T (|STR_to_CHAR| " ") NIL
                                          (QREFELT % 18)))
                          (SPADCALL |n| |n| (QREFELT % 20))
                          (COND ((NULL |sl|) (LETT |start| |n|))
                                ('T (SPADCALL |prev| |n| (QREFELT % 20))))
                          (LETT |sl| (CONS |n| |sl|))
                          (EXIT (LETT |prev| |n|)))))
                       (EXIT
                        (COND
                         ((SPADCALL |p1| (QREFELT % 24))
                          (|error| "empty string in pattern"))
                         ('T
                          (SEQ (LETT |c| (SPADCALL |p1| 1 (QREFELT % 25)))
                               (LETT |n| (SPADCALL NIL |c| NIL (QREFELT % 18)))
                               (COND ((NULL |sl|) (LETT |start| |n|)))
                               (LETT |sl| (CONS |n| |sl|))
                               (COND
                                (|pre_wild|
                                 (SPADCALL |prev| |n| (QREFELT % 26))))
                               (LETT |prev| |n|) (LETT |pre_wild| 'T)
                               (EXIT
                                (SEQ (LETT |i| 2) (LETT #3# (QCSIZE |p1|)) G190
                                     (COND ((|greater_SI| |i| #3#) (GO G191)))
                                     (SEQ
                                      (LETT |c|
                                            (SPADCALL |p1| |i| (QREFELT % 25)))
                                      (LETT |n|
                                            (SPADCALL NIL |c| NIL
                                                      (QREFELT % 18)))
                                      (LETT |sl| (CONS |n| |sl|))
                                      (SPADCALL |prev| |n| (QREFELT % 20))
                                      (EXIT (LETT |prev| |n|)))
                                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                     (EXIT NIL))))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (LETT |n| (SPADCALL 'T (|STR_to_CHAR| " ") 'T (QREFELT % 18)))
                 (LETT |sl| (CONS |n| |sl|))
                 (SPADCALL |prev| |n| (QREFELT % 20))
                 (COND (|post_wild| (SPADCALL |n| |n| (QREFELT % 20))))
                 (LETT |sv| (SPADCALL |sl| (QREFELT % 23)))
                 (EXIT (LETT |ra| (CONS |start| |sv|))))))))) 

(DECLAIM (NOTINLINE |BasicMatchingAutomaton;|)) 

(DEFUN |BasicMatchingAutomaton;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|BasicMatchingAutomaton|))
          (LETT % (GETREFV 29))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BasicMatchingAutomaton| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |start| (|MatchingAutomatonNode|))
                              (|:| |states|
                                   (|PrimitiveArray|
                                    (|MatchingAutomatonNode|)))))
          %))) 

(DEFUN |BasicMatchingAutomaton| ()
  (SPROG NIL
         (PROG (#1=#:G62)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|BasicMatchingAutomaton|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|BasicMatchingAutomaton|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|BasicMatchingAutomaton;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|BasicMatchingAutomaton|)))))))))) 

(MAKEPROP '|BasicMatchingAutomaton| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Union| % '"none") (|Character|)
              (|MatchingAutomatonNode|) (0 . |next|) (|Integer|)
              (6 . |set_gen!|) (12 . |alt|) (|Boolean|) (17 . |accepting?|)
              (|String|) |BMATAUT;do_match;%SB;2| (22 . |new|) (|Void|)
              (29 . |set_next!|) (|List| 9) (|PrimitiveArray| 9)
              (35 . |construct|) (40 . |empty?|) (45 . |elt|) (51 . |set_alt!|)
              (|List| 16) |BMATAUT;make_automaton;L2B%;3|)
           '#(|make_automaton| 57 |do_match| 64) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|do_match| ((|Boolean|) $$ (|String|))) T)
                              '((|make_automaton|
                                 ($$ (|List| (|String|)) (|Boolean|)
                                  (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 28
                                            '(2 9 7 0 8 10 2 9 11 0 11 12 1 9 7
                                              0 13 1 9 14 0 15 3 9 0 14 8 14 18
                                              2 9 19 0 0 20 1 22 0 21 23 1 16
                                              14 0 24 2 16 8 0 11 25 2 9 19 0 0
                                              26 3 0 0 27 14 14 28 2 0 14 0 16
                                              17)))))
           '|lookupComplete|)) 
