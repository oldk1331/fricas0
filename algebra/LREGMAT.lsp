
(SDEFUN |LREGMAT;get_token| ((|st| (|s_R|)) (% (U)))
        (SPROG
         ((|s| (|String|)) (|n| (|NonNegativeInteger|)) (|c| #1=(|Character|))
          (|has_escape| #2=(|Boolean|)) (|i| (|Integer|)) (#3=#:G61 NIL)
          (|no_escape| #2#) (|cl| (|List| #1#)) (|s1| (|String|)))
         (SEQ (LETT |s| (QCAR |st|)) (LETT |n| (QCSIZE |s|))
              (LETT |i| (QCDR |st|))
              (EXIT
               (COND ((< |n| |i|) (CONS 0 (QREFELT % 15)))
                     (#4='T
                      (SEQ (LETT |c| (SPADCALL |s| |i| (QREFELT % 25)))
                           (LETT |i| (+ |i| 1))
                           (SEQ G190
                                (COND
                                 ((NULL
                                   (COND ((< |n| |i|) NIL)
                                         ('T (|eql_SI| |c| (QREFELT % 12)))))
                                  (GO G191)))
                                (SEQ
                                 (LETT |c| (SPADCALL |s| |i| (QREFELT % 25)))
                                 (EXIT (LETT |i| (+ |i| 1))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (COND
                            ((|eql_SI| |c| (QREFELT % 12))
                             (COND
                              ((< |n| |i|)
                               (EXIT
                                (SEQ (PROGN (RPLACD |st| |i|) (QCDR |st|))
                                     (EXIT (CONS 0 (QREFELT % 15)))))))))
                           (PROGN (RPLACD |st| |i|) (QCDR |st|))
                           (EXIT
                            (COND
                             ((|eql_SI| |c| (QREFELT % 13))
                              (CONS 0 (QREFELT % 18)))
                             ((|eql_SI| |c| (QREFELT % 10))
                              (CONS 0 (QREFELT % 16)))
                             ((|eql_SI| |c| (QREFELT % 11))
                              (CONS 0 (QREFELT % 17)))
                             (#4#
                              (SEQ (LETT |has_escape| NIL)
                                   (LETT |cl| (LIST |c|))
                                   (COND
                                    ((|eql_SI| |c| (QREFELT % 14))
                                     (SEQ (LETT |has_escape| 'T)
                                          (EXIT (LETT |cl| NIL)))))
                                   (LETT |no_escape| (NULL |has_escape|))
                                   (SEQ
                                    (EXIT
                                     (SEQ G190 NIL
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((> |i| |n|)
                                              (PROGN
                                               (LETT #3# |$NoValue|)
                                               (GO #5=#:G50)))
                                             ('T
                                              (SEQ
                                               (LETT |c|
                                                     (SPADCALL |s| |i|
                                                               (QREFELT % 25)))
                                               (LETT |i| (+ |i| 1))
                                               (EXIT
                                                (COND
                                                 (|has_escape|
                                                  (SEQ
                                                   (COND
                                                    ((NULL
                                                      (|eql_SI| |c|
                                                                (QREFELT %
                                                                         10)))
                                                     (COND
                                                      ((NULL
                                                        (|eql_SI| |c|
                                                                  (QREFELT %
                                                                           11)))
                                                       (COND
                                                        ((NULL
                                                          (|eql_SI| |c|
                                                                    (QREFELT %
                                                                             12)))
                                                         (COND
                                                          ((NULL
                                                            (|eql_SI| |c|
                                                                      (QREFELT
                                                                       % 13)))
                                                           (COND
                                                            ((NULL
                                                              (|eql_SI| |c|
                                                                        (QREFELT
                                                                         %
                                                                         14)))
                                                             (COND
                                                              ((NULL
                                                                (NULL |cl|))
                                                               (LETT |cl|
                                                                     (CONS
                                                                      (QREFELT
                                                                       % 14)
                                                                      |cl|))))))))))))))
                                                   (LETT |cl| (CONS |c| |cl|))
                                                   (EXIT
                                                    (LETT |has_escape| NIL))))
                                                 ((|eql_SI| |c| (QREFELT % 14))
                                                  (SEQ (LETT |no_escape| NIL)
                                                       (EXIT
                                                        (LETT |has_escape|
                                                              'T))))
                                                 ('T
                                                  (COND
                                                   ((OR
                                                     (OR
                                                      (OR
                                                       (|eql_SI| |c|
                                                                 (QREFELT %
                                                                          10))
                                                       (|eql_SI| |c|
                                                                 (QREFELT %
                                                                          11)))
                                                      (|eql_SI| |c|
                                                                (QREFELT %
                                                                         12)))
                                                     (|eql_SI| |c|
                                                               (QREFELT % 13)))
                                                    (SEQ (LETT |i| (- |i| 1))
                                                         (EXIT
                                                          (PROGN
                                                           (LETT #3#
                                                                 |$NoValue|)
                                                           (GO #5#)))))
                                                   ('T
                                                    (LETT |cl|
                                                          (CONS |c|
                                                                |cl|))))))))))))
                                          NIL (GO G190) G191 (EXIT NIL)))
                                    #5# (EXIT #3#))
                                   (PROGN (RPLACD |st| |i|) (QCDR |st|))
                                   (COND
                                    (|has_escape|
                                     (SEQ (LETT |no_escape| NIL)
                                          (EXIT
                                           (LETT |cl|
                                                 (CONS (QREFELT % 14)
                                                       |cl|))))))
                                   (LETT |s1|
                                         (SPADCALL (NREVERSE |cl|)
                                                   (QREFELT % 27)))
                                   (COND
                                    (|no_escape|
                                     (COND
                                      ((EQUAL |s1| "and")
                                       (EXIT (CONS 0 (QREFELT % 19)))))))
                                   (COND
                                    (|no_escape|
                                     (COND
                                      ((EQUAL |s1| "or")
                                       (EXIT (CONS 0 (QREFELT % 20)))))))
                                   (COND
                                    (|no_escape|
                                     (COND
                                      ((EQUAL |s1| "not")
                                       (EXIT (CONS 0 (QREFELT % 21)))))))
                                   (EXIT (CONS 1 |s1|))))))))))))) 

(SDEFUN |LREGMAT;reduce_stack|
        ((|stack| (|List| U2)) (|sym| (|Symbol|)) (|priority| (|Integer|))
         (% (|Union| (|List| U2) "failed")))
        (SPROG
         ((|topu| (U2)) (|o_stack| (|List| U2)) (|opu| (U2)) (|op| (|t_R|))
          (|t0u| (U2)) (|t0| (|LogicalMatchingAutomaton|))
          (|top| (|LogicalMatchingAutomaton|)) (#1=#:G97 NIL))
         (SEQ
          (EXIT
           (COND
            ((NULL |stack|)
             (COND ((EQUAL |sym| '|not|) (CONS 0 |stack|))
                   (#2='T (CONS 1 "failed"))))
            (#2#
             (SEQ (LETT |topu| (|SPADfirst| |stack|))
                  (LETT |stack| (CDR |stack|))
                  (EXIT
                   (COND
                    ((QEQCAR |topu| 2)
                     (SEQ (LETT |top| (QCDR |topu|))
                          (EXIT
                           (SEQ G190 NIL
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL |stack|)
                                    (COND
                                     ((EQUAL |sym| '|rpar|)
                                      (PROGN
                                       (LETT #1# (CONS 1 "failed"))
                                       (GO #3=#:G96)))
                                     ('T
                                      (PROGN
                                       (LETT #1#
                                             (CONS 0 (LIST (CONS 2 |top|))))
                                       (GO #3#)))))
                                   ('T
                                    (SEQ (LETT |o_stack| |stack|)
                                         (LETT |opu| (|SPADfirst| |stack|))
                                         (LETT |stack| (CDR |stack|))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |opu| 0)
                                            (SEQ (LETT |op| (QCDR |opu|))
                                                 (EXIT
                                                  (COND
                                                   ((EQUAL (QCAR |op|) '|lpar|)
                                                    (COND
                                                     ((EQUAL |sym| '|rpar|)
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0
                                                                   (CONS
                                                                    (CONS 2
                                                                          |top|)
                                                                    |stack|)))
                                                       (GO #3#)))
                                                     ('T
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0
                                                                   (CONS
                                                                    (CONS 2
                                                                          |top|)
                                                                    |o_stack|)))
                                                       (GO #3#)))))
                                                   ((EQUAL (QCAR |op|) '|not|)
                                                    (LETT |top|
                                                          (SPADCALL |top|
                                                                    (QREFELT %
                                                                             30))))
                                                   ((< (QCDR |op|) |priority|)
                                                    (PROGN
                                                     (LETT #1#
                                                           (CONS 0
                                                                 (CONS
                                                                  (CONS 2
                                                                        |top|)
                                                                  |o_stack|)))
                                                     (GO #3#)))
                                                   ((NULL |stack|)
                                                    (PROGN
                                                     (LETT #1#
                                                           (CONS 1 "failed"))
                                                     (GO #3#)))
                                                   ('T
                                                    (SEQ
                                                     (LETT |t0u|
                                                           (|SPADfirst|
                                                            |stack|))
                                                     (LETT |stack|
                                                           (CDR |stack|))
                                                     (EXIT
                                                      (COND
                                                       ((QEQCAR |t0u| 2)
                                                        (SEQ
                                                         (LETT |t0|
                                                               (QCDR |t0u|))
                                                         (EXIT
                                                          (LETT |top|
                                                                (COND
                                                                 ((EQUAL
                                                                   (QCAR |op|)
                                                                   '|and|)
                                                                  (SPADCALL
                                                                   (LIST |t0|
                                                                         |top|)
                                                                   (QREFELT %
                                                                            32)))
                                                                 ((EQUAL
                                                                   (QCAR |op|)
                                                                   '|or|)
                                                                  (SPADCALL
                                                                   (LIST |t0|
                                                                         |top|)
                                                                   (QREFELT %
                                                                            33)))
                                                                 ('T
                                                                  (|error|
                                                                   "unhandled operator in pattern")))))))
                                                       ('T
                                                        (PROGN
                                                         (LETT #1#
                                                               (CONS 1
                                                                     "failed"))
                                                         (GO #3#)))))))))))
                                           ('T
                                            (PROGN
                                             (LETT #1# (CONS 1 "failed"))
                                             (GO #3#))))))))))
                                NIL (GO G190) G191 (EXIT NIL)))))
                    (#2# (PROGN (LETT #1# (CONS 1 "failed")) (GO #3#)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |LREGMAT;parse_pattern;SBU;3|
        ((|s| (|String|)) (|downcase| (|Boolean|))
         (% (|Union| (|LogicalMatchingAutomaton|) "failed")))
        (SPROG
         ((|st| (|s_R|)) (|string_priority| (|PositiveInteger|)) (|t| (U))
          (|s1| (|String|)) (|tr| (|t_R|)) (|post_wild| #1=(|Boolean|))
          (#2=#:G140 NIL) (|sl| (|List| (|String|))) (|need_star| #1#)
          (#3=#:G141 NIL) (|ba| (|BasicMatchingAutomaton|))
          (|stack_priority| (|NonNegativeInteger|)) (#4=#:G143 NIL)
          (#5=#:G144 NIL) (#6=#:G142 NIL)
          (|stacku| (|Union| (|List| U2) "failed")) (|stack| (|List| U2))
          (|top| (U2)))
         (SEQ
          (EXIT
           (COND
            ((EQUAL |s| "*")
             (SEQ (LETT |ba| (SPADCALL NIL 'T NIL (QREFELT % 37)))
                  (EXIT (CONS 0 (SPADCALL |ba| (QREFELT % 38))))))
            (#7='T
             (SEQ (LETT |st| (CONS |s| 1)) (LETT |stack| NIL)
                  (LETT |string_priority| 9) (LETT |stack_priority| 0)
                  (SEQ
                   (EXIT
                    (SEQ G190 NIL
                         (SEQ
                          (EXIT
                           (SEQ (LETT |t| (|LREGMAT;get_token| |st| %))
                                (EXIT
                                 (COND
                                  ((QEQCAR |t| 1)
                                   (SEQ
                                    (LETT |stack_priority| |string_priority|)
                                    (LETT |s1| (QCDR |t|))
                                    (COND
                                     (|downcase|
                                      (LETT |s1|
                                            (SPADCALL |s1| (QREFELT % 40)))))
                                    (EXIT
                                     (LETT |stack|
                                           (CONS (CONS 1 |s1|) |stack|)))))
                                  ('T
                                   (SEQ (LETT |tr| (QCDR |t|))
                                        (EXIT
                                         (COND
                                          ((EQUAL (QCAR |tr|) '|star|)
                                           (SEQ
                                            (LETT |stack_priority|
                                                  |string_priority|)
                                            (EXIT
                                             (LETT |stack|
                                                   (CONS (CONS 0 |tr|)
                                                         |stack|)))))
                                          ('T
                                           (SEQ
                                            (COND
                                             ((EQL |stack_priority|
                                                   |string_priority|)
                                              (COND
                                               ((NULL |stack|)
                                                (PROGN
                                                 (LETT #5# (CONS 1 "failed"))
                                                 (GO #8=#:G139)))
                                               ('T
                                                (SEQ
                                                 (LETT |top|
                                                       (|SPADfirst| |stack|))
                                                 (LETT |stack| (CDR |stack|))
                                                 (LETT |post_wild|
                                                       (NULL (QEQCAR |top| 1)))
                                                 (COND
                                                  (|post_wild|
                                                   (COND
                                                    ((QEQCAR |top| 0)
                                                     (COND
                                                      ((OR
                                                        (NULL
                                                         (EQUAL
                                                          (QCAR (QCDR |top|))
                                                          '|star|))
                                                        (NULL |stack|))
                                                       (PROGN
                                                        (LETT #5#
                                                              (CONS 1
                                                                    "failed"))
                                                        (GO #8#)))
                                                      ('T
                                                       (SEQ
                                                        (LETT |top|
                                                              (|SPADfirst|
                                                               |stack|))
                                                        (EXIT
                                                         (LETT |stack|
                                                               (CDR
                                                                |stack|)))))))
                                                    ('T
                                                     (PROGN
                                                      (LETT #5#
                                                            (CONS 1 "failed"))
                                                      (GO #8#))))))
                                                 (LETT |sl| NIL)
                                                 (LETT |need_star| NIL)
                                                 (SEQ
                                                  (EXIT
                                                   (SEQ G190 NIL
                                                        (SEQ
                                                         (EXIT
                                                          (COND
                                                           (|need_star|
                                                            (COND
                                                             ((QEQCAR |top| 0)
                                                              (COND
                                                               ((NULL
                                                                 (EQUAL
                                                                  (QCAR
                                                                   (QCDR
                                                                    |top|))
                                                                  '|star|))
                                                                (SEQ
                                                                 (LETT |stack|
                                                                       (CONS
                                                                        |top|
                                                                        |stack|))
                                                                 (EXIT
                                                                  (PROGN
                                                                   (LETT #3#
                                                                         |$NoValue|)
                                                                   (GO
                                                                    #9=#:G122)))))
                                                               ('T
                                                                (SEQ
                                                                 (LETT
                                                                  |need_star|
                                                                  NIL)
                                                                 (EXIT
                                                                  (COND
                                                                   ((NULL
                                                                     |stack|)
                                                                    (PROGN
                                                                     (LETT #3#
                                                                           1)
                                                                     (GO #9#)))
                                                                   ('T
                                                                    (SEQ
                                                                     (LETT
                                                                      |top|
                                                                      (|SPADfirst|
                                                                       |stack|))
                                                                     (LETT
                                                                      |stack|
                                                                      (CDR
                                                                       |stack|))
                                                                     (EXIT
                                                                      (PROGN
                                                                       (LETT
                                                                        #2#
                                                                        |$NoValue|)
                                                                       (GO
                                                                        #10=#:G113)))))))))))
                                                             ('T
                                                              (SEQ
                                                               (LETT |stack|
                                                                     (CONS
                                                                      |top|
                                                                      |stack|))
                                                               (EXIT
                                                                (PROGN
                                                                 (LETT #3#
                                                                       |$NoValue|)
                                                                 (GO #9#)))))))
                                                           ((QEQCAR |top| 1)
                                                            (SEQ
                                                             (LETT |sl|
                                                                   (CONS
                                                                    (QCDR
                                                                     |top|)
                                                                    |sl|))
                                                             (LETT |need_star|
                                                                   'T)
                                                             (EXIT
                                                              (COND
                                                               ((NULL |stack|)
                                                                (PROGN
                                                                 (LETT #3# 1)
                                                                 (GO #9#)))
                                                               ('T
                                                                (SEQ
                                                                 (LETT |top|
                                                                       (|SPADfirst|
                                                                        |stack|))
                                                                 (EXIT
                                                                  (LETT |stack|
                                                                        (CDR
                                                                         |stack|)))))))))
                                                           ('T
                                                            (SEQ
                                                             (LETT |stack|
                                                                   (CONS |top|
                                                                         |stack|))
                                                             (EXIT
                                                              (PROGN
                                                               (LETT #3#
                                                                     |$NoValue|)
                                                               (GO #9#)))))))
                                                         #10# (EXIT #2#))
                                                        NIL (GO G190) G191
                                                        (EXIT NIL)))
                                                  #9# (EXIT #3#))
                                                 (EXIT
                                                  (COND
                                                   ((NULL |sl|)
                                                    (PROGN
                                                     (LETT #5#
                                                           (CONS 1 "failed"))
                                                     (GO #8#)))
                                                   ('T
                                                    (SEQ
                                                     (LETT |ba|
                                                           (SPADCALL |sl|
                                                                     (NULL
                                                                      |need_star|)
                                                                     |post_wild|
                                                                     (QREFELT %
                                                                              37)))
                                                     (LETT |stack|
                                                           (CONS
                                                            (CONS 2
                                                                  (SPADCALL
                                                                   |ba|
                                                                   (QREFELT %
                                                                            38)))
                                                            |stack|))
                                                     (EXIT
                                                      (LETT |stack_priority|
                                                            0)))))))))))
                                            (EXIT
                                             (COND
                                              ((EQUAL (QCAR |tr|) '|lpar|)
                                               (LETT |stack|
                                                     (CONS (CONS 0 |tr|)
                                                           |stack|)))
                                              ((EQUAL (QCAR |tr|) '|eos|)
                                               (PROGN
                                                (LETT #4# 1)
                                                (GO #11=#:G132)))
                                              ('T
                                               (SEQ
                                                (LETT |stacku|
                                                      (|LREGMAT;reduce_stack|
                                                       |stack| (QCAR |tr|)
                                                       (QCDR |tr|) %))
                                                (EXIT
                                                 (COND
                                                  ((QEQCAR |stacku| 1)
                                                   (PROGN
                                                    (LETT #5#
                                                          (CONS 1 "failed"))
                                                    (GO #8#)))
                                                  ('T
                                                   (SEQ
                                                    (LETT |stack|
                                                          (QCDR |stacku|))
                                                    (EXIT
                                                     (COND
                                                      ((EQUAL (QCAR |tr|)
                                                              '|rpar|)
                                                       (PROGN
                                                        (LETT #6# |$NoValue|)
                                                        (GO #12=#:G107)))
                                                      ('T
                                                       (LETT |stack|
                                                             (CONS
                                                              (CONS 0 |tr|)
                                                              (QCDR
                                                               |stacku|))))))))))))))))))))))))
                          #12# (EXIT #6#))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #11# (EXIT #4#))
                  (LETT |stacku| (|LREGMAT;reduce_stack| |stack| '|eos| 0 %))
                  (EXIT
                   (COND ((QEQCAR |stacku| 1) (CONS 1 "failed"))
                         (#7#
                          (SEQ (LETT |stack| (QCDR |stacku|))
                               (COND
                                ((NULL (EQL (LENGTH |stack|) 1))
                                 (EXIT (CONS 1 "failed"))))
                               (LETT |top| (|SPADfirst| |stack|))
                               (EXIT
                                (COND ((QEQCAR |top| 2) (CONS 0 (QCDR |top|)))
                                      (#7# (CONS 1 "failed"))))))))))))
          #8# (EXIT #5#)))) 

(DECLAIM (NOTINLINE |LogicalRegularExpressionMatch;|)) 

(DEFUN |LogicalRegularExpressionMatch;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|LogicalRegularExpressionMatch|))
          (LETT % (GETREFV 43))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LogicalRegularExpressionMatch| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
          (QSETREFV % 7
                    (|Record| (|:| |sym| (|Symbol|))
                              (|:| |priority| (|Integer|))))
          (QSETREFV % 8 (|Union| (QREFELT % 7) (|String|)))
          (QSETREFV % 9 (|STR_to_CHAR| "."))
          (QSETREFV % 10 (|STR_to_CHAR| "("))
          (QSETREFV % 11 (|STR_to_CHAR| ")"))
          (QSETREFV % 12 (|STR_to_CHAR| " "))
          (QSETREFV % 13 (|STR_to_CHAR| "*"))
          (QSETREFV % 14 (|STR_to_CHAR| "_"))
          (QSETREFV % 15 (CONS '|eos| 0))
          (QSETREFV % 16 (CONS '|lpar| 10))
          (QSETREFV % 17 (CONS '|rpar| 1))
          (QSETREFV % 18 (CONS '|star| 8))
          (QSETREFV % 19 (CONS '|and| 5))
          (QSETREFV % 20 (CONS '|or| 4))
          (QSETREFV % 21 (CONS '|not| 6))
          (QSETREFV % 28
                    (|Union| (QREFELT % 7) (|String|)
                             (|LogicalMatchingAutomaton|)))
          %))) 

(DEFUN |LogicalRegularExpressionMatch| ()
  (SPROG NIL
         (PROG (#1=#:G146)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache|
                          '|LogicalRegularExpressionMatch|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|LogicalRegularExpressionMatch|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|LogicalRegularExpressionMatch;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|LogicalRegularExpressionMatch|)))))))))) 

(MAKEPROP '|LogicalRegularExpressionMatch| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|s_R| '|t_R| 'U '|char_dot| '|char_lpar|
              '|char_rpar| '|char_space| '|char_star| '|char_under| '|eos_tok|
              '|lpar_tok| '|rpar_tok| '|star_tok| '|and_tok| '|or_tok|
              '|not_tok| (|Character|) (|Integer|) (|String|) (0 . |elt|)
              (|List| 22) (6 . |construct|) 'U2 (|LogicalMatchingAutomaton|)
              (11 . |make_not|) (|List| %) (16 . |make_and|) (21 . |make_or|)
              (|List| 24) (|Boolean|) (|BasicMatchingAutomaton|)
              (26 . |make_automaton|) (33 . |convert|) (|BrowserInformation|)
              (38 . |downcase|) (|Union| 29 '#1="failed")
              |LREGMAT;parse_pattern;SBU;3|)
           '#(|parse_pattern| 43) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|parse_pattern|
                                 ((|Union| (|LogicalMatchingAutomaton|) #1#)
                                  (|String|) (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 42
                                            '(2 24 22 0 23 25 1 24 0 26 27 1 29
                                              0 0 30 1 29 0 31 32 1 29 0 31 33
                                              3 36 0 34 35 35 37 1 29 0 36 38 1
                                              39 24 24 40 2 0 41 24 35 42)))))
           '|lookupComplete|)) 
