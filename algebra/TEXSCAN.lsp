
(SDEFUN |TEXSCAN;at_eos?;RB;1|
        ((|st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
         (% (|Boolean|)))
        (< (QCSIZE (QCAR |st|)) (QCDR |st|))) 

(SDEFUN |TEXSCAN;handle_verb|
        ((|st| (|Record| (|:| |str| #1=(|String|)) (|:| |pos| #2=(|Integer|))))
         (%
          (|Union| (|:| |text| (|String|)) (|:| |lbrace| "lbrace")
                   (|:| |rbrace| "rbrace") (|:| |tmath| "tmath")
                   (|:| |dmath| "dmath")
                   (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                   (|:| |eos| "eos") (|:| |error| "error"))))
        (SPROG
         ((|c_pos| #2#) (#3=#:G35 NIL) (|o_pos| (|Integer|))
          (|c0| (|Character|)) (|s| #1#))
         (SEQ
          (EXIT
           (SEQ (LETT |c_pos| (QCDR |st|)) (LETT |s| (QCAR |st|))
                (EXIT
                 (COND
                  ((< (QCSIZE |s|) |c_pos|)
                   (|error| "handle_verb: Unexpected end of string"))
                  ('T
                   (SEQ (LETT |c0| (SPADCALL |s| |c_pos| (QREFELT % 20)))
                        (LETT |o_pos| (LETT |c_pos| (+ |c_pos| 1)))
                        (EXIT
                         (SEQ G190 NIL
                              (SEQ
                               (EXIT
                                (COND
                                 ((< (QCSIZE |s|) |c_pos|)
                                  (|error|
                                   "handle_verb: Unexpected end of string"))
                                 ((|eql_SI|
                                   (SPADCALL |s| |c_pos| (QREFELT % 20)) |c0|)
                                  (SEQ
                                   (PROGN
                                    (RPLACD |st| (+ |c_pos| 1))
                                    (QCDR |st|))
                                   (EXIT
                                    (PROGN
                                     (LETT #3#
                                           (CONS 0
                                                 (SPADCALL |s|
                                                           (SPADCALL |o_pos|
                                                                     (- |c_pos|
                                                                        1)
                                                                     (QREFELT %
                                                                              22))
                                                           (QREFELT % 23))))
                                     (GO #4=#:G34)))))
                                 ('T (LETT |c_pos| (+ |c_pos| 1))))))
                              NIL (GO G190) G191 (EXIT NIL)))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |TEXSCAN;skip_comment|
        ((|st| (|Record| (|:| |str| #1=(|String|)) (|:| |pos| #2=(|Integer|))))
         (% (|Void|)))
        (SPROG ((#3=#:G43 NIL) (|c_pos| #2#) (|cc| (|Character|)) (|s| #1#))
               (SEQ (LETT |s| (QCAR |st|)) (LETT |c_pos| (QCDR |st|))
                    (SEQ
                     (EXIT
                      (SEQ G190
                           (COND
                            ((NULL (NULL (< (QCSIZE |s|) |c_pos|))) (GO G191)))
                           (SEQ
                            (LETT |cc| (SPADCALL |s| |c_pos| (QREFELT % 20)))
                            (LETT |c_pos| (+ |c_pos| 1))
                            (EXIT
                             (COND
                              ((|eql_SI| |cc| (QREFELT % 14))
                               (PROGN (LETT #3# |$NoValue|) (GO #4=#:G40))))))
                           NIL (GO G190) G191 (EXIT NIL)))
                     #4# (EXIT #3#))
                    (EXIT (PROGN (RPLACD |st| |c_pos|) (QCDR |st|)))))) 

(SDEFUN |TEXSCAN;get_token!;RU;4|
        ((|st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
         (%
          (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                   (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                   (|:| |dmath| #4="dmath")
                   (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                   (|:| |eos| #5="eos") (|:| |error| #6="error"))))
        (SPROG
         ((|c_pos| #7=(|Integer|)) (#8=#:G88 NIL) (#9=#:G89 NIL)
          (|cc| (|Character|)) (#10=#:G87 NIL) (|name| (|String|))
          (|s| (|String|)) (|o_pos| #7#))
         (SEQ
          (EXIT
           (SEQ (LETT |o_pos| (LETT |c_pos| (QCDR |st|)))
                (LETT |s| (QCAR |st|))
                (EXIT
                 (COND ((< (QCSIZE |s|) |c_pos|) (CONS 6 #5#))
                       (#11='T
                        (SEQ (LETT |cc| (SPADCALL |s| |c_pos| (QREFELT % 20)))
                             (LETT |c_pos| (+ |c_pos| 1))
                             (COND
                              ((|eql_SI| |cc| (QREFELT % 11))
                               (SEQ (PROGN (RPLACD |st| |c_pos|) (QCDR |st|))
                                    (|TEXSCAN;skip_comment| |st| %)
                                    (LETT |c_pos| (QCDR |st|))
                                    (EXIT
                                     (COND
                                      ((< (QCSIZE |s|) |c_pos|)
                                       (PROGN
                                        (LETT #9# (CONS 6 #5#))
                                        (GO #12=#:G86)))
                                      (#11#
                                       (SEQ
                                        (LETT |cc|
                                              (SPADCALL |s| |c_pos|
                                                        (QREFELT % 20)))
                                        (EXIT
                                         (LETT |c_pos| (+ |c_pos| 1))))))))))
                             (EXIT
                              (COND
                               ((|eql_SI| |cc| (QREFELT % 6))
                                (SEQ (PROGN (RPLACD |st| |c_pos|) (QCDR |st|))
                                     (EXIT (CONS 1 #1#))))
                               ((|eql_SI| |cc| (QREFELT % 7))
                                (SEQ (PROGN (RPLACD |st| |c_pos|) (QCDR |st|))
                                     (EXIT (CONS 2 #2#))))
                               ((|eql_SI| |cc| (QREFELT % 10))
                                (SEQ (PROGN (RPLACD |st| |c_pos|) (QCDR |st|))
                                     (EXIT
                                      (COND
                                       ((< (QCSIZE |s|) |c_pos|) (CONS 3 #3#))
                                       (#11#
                                        (SEQ
                                         (LETT |cc|
                                               (SPADCALL |s| |c_pos|
                                                         (QREFELT % 20)))
                                         (EXIT
                                          (COND
                                           ((|eql_SI| |cc| (QREFELT % 10))
                                            (SEQ
                                             (PROGN
                                              (RPLACD |st| (+ |c_pos| 1))
                                              (QCDR |st|))
                                             (EXIT (CONS 4 #4#))))
                                           (#11# (CONS 3 #3#))))))))))
                               ((|eql_SI| |cc| (QREFELT % 8))
                                (COND ((< (QCSIZE |s|) |c_pos|) (CONS 7 #6#))
                                      (#11#
                                       (SEQ
                                        (LETT |cc|
                                              (SPADCALL |s| |c_pos|
                                                        (QREFELT % 20)))
                                        (COND
                                         ((NULL (SPADCALL |cc| (QREFELT % 24)))
                                          (EXIT
                                           (SEQ
                                            (PROGN
                                             (RPLACD |st| (+ |c_pos| 1))
                                             (QCDR |st|))
                                            (EXIT
                                             (CONS 5
                                                   (LIST
                                                    (SPADCALL |s|
                                                              (SPADCALL |o_pos|
                                                                        |c_pos|
                                                                        (QREFELT
                                                                         % 22))
                                                              (QREFELT %
                                                                       23)))))))))
                                        (EXIT
                                         (SEQ G190 NIL
                                              (SEQ
                                               (EXIT
                                                (SEQ
                                                 (LETT |c_pos| (+ |c_pos| 1))
                                                 (EXIT
                                                  (COND
                                                   ((OR
                                                     (< (QCSIZE |s|) |c_pos|)
                                                     (NULL
                                                      (SPADCALL
                                                       (SPADCALL |s| |c_pos|
                                                                 (QREFELT %
                                                                          20))
                                                       (QREFELT % 24))))
                                                    (PROGN
                                                     (LETT #10#
                                                           (SEQ
                                                            (PROGN
                                                             (RPLACD |st|
                                                                     |c_pos|)
                                                             (QCDR |st|))
                                                            (LETT |name|
                                                                  (SPADCALL |s|
                                                                            (SPADCALL
                                                                             |o_pos|
                                                                             (-
                                                                              |c_pos|
                                                                              1)
                                                                             (QREFELT
                                                                              %
                                                                              22))
                                                                            (QREFELT
                                                                             %
                                                                             23)))
                                                            (EXIT
                                                             (COND
                                                              ((EQUAL |name|
                                                                      "\\verb")
                                                               (PROGN
                                                                (LETT #9#
                                                                      (|TEXSCAN;handle_verb|
                                                                       |st| %))
                                                                (GO #12#)))
                                                              ('T
                                                               (PROGN
                                                                (LETT #9#
                                                                      (CONS 5
                                                                            (LIST
                                                                             |name|)))
                                                                (GO #12#)))))))
                                                     (GO #13=#:G58)))))))
                                               #13# (EXIT #10#))
                                              NIL (GO G190) G191
                                              (EXIT NIL)))))))
                               (#11#
                                (SEQ G190 NIL
                                     (SEQ
                                      (EXIT
                                       (SEQ
                                        (COND
                                         ((|eql_SI| |cc| (QREFELT % 9))
                                          (COND
                                           ((NULL (< (QCSIZE |s|) |c_pos|))
                                            (COND
                                             ((|eql_SI|
                                               (SPADCALL |s| |c_pos|
                                                         (QREFELT % 20))
                                               (QREFELT % 8))
                                              (LETT |c_pos|
                                                    (+ |c_pos| 1))))))))
                                        (COND
                                         ((< (QCSIZE |s|) |c_pos|)
                                          (EXIT
                                           (SEQ
                                            (PROGN
                                             (RPLACD |st| |c_pos|)
                                             (QCDR |st|))
                                            (EXIT
                                             (PROGN
                                              (LETT #9#
                                                    (CONS 0
                                                          (SPADCALL |s|
                                                                    (SPADCALL
                                                                     |o_pos|
                                                                     (- |c_pos|
                                                                        1)
                                                                     (QREFELT %
                                                                              22))
                                                                    (QREFELT %
                                                                             23))))
                                              (GO #12#))))))
                                         ('T
                                          (SEQ
                                           (LETT |cc|
                                                 (SPADCALL |s| |c_pos|
                                                           (QREFELT % 20)))
                                           (EXIT
                                            (COND
                                             ((OR
                                               (OR
                                                (OR
                                                 (OR
                                                  (|eql_SI| |cc| (QREFELT % 6))
                                                  (|eql_SI| |cc|
                                                            (QREFELT % 7)))
                                                 (|eql_SI| |cc| (QREFELT % 8)))
                                                (|eql_SI| |cc| (QREFELT % 11)))
                                               (|eql_SI| |cc| (QREFELT % 10)))
                                              (PROGN
                                               (LETT #8#
                                                     (SEQ
                                                      (PROGN
                                                       (RPLACD |st| |c_pos|)
                                                       (QCDR |st|))
                                                      (EXIT
                                                       (PROGN
                                                        (LETT #9#
                                                              (CONS 0
                                                                    (SPADCALL
                                                                     |s|
                                                                     (SPADCALL
                                                                      |o_pos|
                                                                      (-
                                                                       |c_pos|
                                                                       1)
                                                                      (QREFELT
                                                                       % 22))
                                                                     (QREFELT %
                                                                              23))))
                                                        (GO #12#)))))
                                               (GO #14=#:G73))))))))
                                        (EXIT (LETT |c_pos| (+ |c_pos| 1)))))
                                      #14# (EXIT #8#))
                                     NIL (GO G190) G191 (EXIT NIL)))))))))))
          #12# (EXIT #9#)))) 

(DECLAIM (NOTINLINE |TeXScanner;|)) 

(DEFUN |TeXScanner;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TeXScanner|))
          (LETT % (GETREFV 28))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TeXScanner| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|STR_to_CHAR| "{"))
          (QSETREFV % 7 (|STR_to_CHAR| "}"))
          (QSETREFV % 8 (|STR_to_CHAR| "\\"))
          (QSETREFV % 9 (|STR_to_CHAR| "/"))
          (QSETREFV % 10 (|STR_to_CHAR| "$"))
          (QSETREFV % 11 (|STR_to_CHAR| "%"))
          (QSETREFV % 14 (SPADCALL (QREFELT % 13)))
          %))) 

(DEFUN |TeXScanner| ()
  (SPROG NIL
         (PROG (#1=#:G91)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TeXScanner|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TeXScanner|
                             (LIST (CONS NIL (CONS 1 (|TeXScanner;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TeXScanner|)))))))))) 

(MAKEPROP '|TeXScanner| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|char_lbrace| '|char_rbrace|
              '|char_backslash| '|char_slash| '|char_dollar| '|char_percent|
              (|Character|) (0 . |newline|) '|char_newline| (|Boolean|)
              (|Record| (|:| |str| 19) (|:| |pos| 18)) |TEXSCAN;at_eos?;RB;1|
              (|Integer|) (|String|) (4 . |elt|) (|UniversalSegment| 18)
              (10 . SEGMENT) (16 . |elt|) (22 . |alphabetic?|)
              (|Record| (|:| |name| 19))
              (|Union| (|:| |text| 19) (|:| |lbrace| '#1="lbrace")
                       (|:| |rbrace| '#2="rbrace") (|:| |tmath| '#3="tmath")
                       (|:| |dmath| '#4="dmath") (|:| |macro_name| 25)
                       (|:| |eos| '#5="eos") (|:| |error| '#6="error"))
              |TEXSCAN;get_token!;RU;4|)
           '#(|get_token!| 27 |at_eos?| 32) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|at_eos?|
                                 ((|Boolean|)
                                  (|Record| (|:| |str| (|String|))
                                            (|:| |pos| (|Integer|)))))
                                T)
                              '((|get_token!|
                                 ((|Union| (|:| |text| (|String|))
                                           (|:| |lbrace| #1#)
                                           (|:| |rbrace| #2#) (|:| |tmath| #3#)
                                           (|:| |dmath| #4#)
                                           (|:| |macro_name|
                                                (|Record|
                                                 (|:| |name| (|String|))))
                                           (|:| |eos| #5#) (|:| |error| #6#))
                                  (|Record| (|:| |str| (|String|))
                                            (|:| |pos| (|Integer|)))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 27
                                            '(0 12 0 13 2 19 12 0 18 20 2 21 0
                                              18 18 22 2 19 0 0 21 23 1 12 15 0
                                              24 1 0 26 16 27 1 0 15 16 17)))))
           '|lookupComplete|)) 
