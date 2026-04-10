
(SDEFUN |TEXPARSE;peek_token|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                         (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                         (|:| |dmath| #4="dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| #5="eos") (|:| |error| #6="error")))))
         (%
          (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                   (|:| |rbrace| #2#) (|:| |tmath| #3#) (|:| |dmath| #4#)
                   (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                   (|:| |eos| #5#) (|:| |error| #6#))))
        (SPROG
         ((|tok|
           (|Union| (|:| |text| (|String|)) (|:| |lbrace| "lbrace")
                    (|:| |rbrace| "rbrace") (|:| |tmath| "tmath")
                    (|:| |dmath| "dmath")
                    (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                    (|:| |eos| "eos") (|:| |error| "error"))))
         (SEQ
          (COND
           ((|eql_SI| (QVELT |sr| 1) 0)
            (SEQ (QSETVELT |sr| 1 1)
                 (LETT |tok| (SPADCALL (QVELT |sr| 0) (QREFELT % 10)))
                 (QSETVELT |sr| 3 |tok|) (EXIT |tok|)))
           ('T (QVELT |sr| 3)))))) 

(SDEFUN |TEXPARSE;unget_token|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                         (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                         (|:| |dmath| #4="dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| #5="eos") (|:| |error| #6="error")))))
         (|tok|
          (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                   (|:| |rbrace| #2#) (|:| |tmath| #3#) (|:| |dmath| #4#)
                   (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                   (|:| |eos| #5#) (|:| |error| #6#)))
         (% (|Void|)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |sr| 1) 0 (QREFELT % 13))
           (|error| "unget_token: already have look-ahead token"))
          ('T (SEQ (QSETVELT |sr| 1 1) (EXIT (QSETVELT |sr| 3 |tok|))))))) 

(SDEFUN |TEXPARSE;get_token|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                         (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                         (|:| |dmath| #4="dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| #5="eos") (|:| |error| #6="error")))))
         (%
          (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                   (|:| |rbrace| #2#) (|:| |tmath| #3#) (|:| |dmath| #4#)
                   (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                   (|:| |eos| #5#) (|:| |error| #6#))))
        (SEQ
         (COND
          ((|eql_SI| (QVELT |sr| 1) 0)
           (SPADCALL (QVELT |sr| 0) (QREFELT % 10)))
          ('T (SEQ (QSETVELT |sr| 1 0) (EXIT (QVELT |sr| 3))))))) 

(SDEFUN |TEXPARSE;parse_item|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                         (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                         (|:| |dmath| #4="dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| #5="eos") (|:| |error| #6="error")))))
         (% (|TeXTree|)))
        (SPROG
         ((#7=#:G15 NIL)
          (|cr|
           (|Record| (|:| |name| (|String|))
                     (|:| |args| (|List| (|TeXTree|)))))
          (#8=#:G20 NIL)
          (|tok|
           (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                    (|:| |rbrace| #2#) (|:| |tmath| #3#) (|:| |dmath| #4#)
                    (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                    (|:| |eos| #5#) (|:| |error| #6#)))
          (|v| (|TeXTree|)) (|lv| (|List| (|TeXTree|))))
         (SEQ (LETT |tok| (|TEXPARSE;get_token| |sr| %))
              (EXIT
               (COND
                ((QEQCAR |tok| 6)
                 (|error| "parse_item: Unexpected end of string"))
                ((QEQCAR |tok| 2)
                 (|error| "parse_item: Unexpected right brace"))
                ((QEQCAR |tok| 1)
                 (SEQ (LETT |lv| (|TEXPARSE;parse_items| |sr| %))
                      (LETT |tok| (|TEXPARSE;get_token| |sr| %))
                      (EXIT
                       (COND ((QEQCAR |tok| 2) (SPADCALL |lv| (QREFELT % 16)))
                             (#9='T
                              (|error|
                               "parse_item: Braced group did not end in right brace"))))))
                ((QEQCAR |tok| 3)
                 (COND
                  ((OR
                    (SPADCALL (QVELT |sr| 2) (CONS 1 "tmath") (QREFELT % 18))
                    (SPADCALL (QVELT |sr| 2) (CONS 2 "dmath") (QREFELT % 18)))
                   (|error|
                    "parse_item: internal error, math mode re-entered"))
                  (#10='T
                   (SEQ (QSETVELT |sr| 2 (CONS 1 "tmath"))
                        (LETT |v|
                              (SPADCALL (|TEXPARSE;parse_items| |sr| %)
                                        (QREFELT % 16)))
                        (LETT |tok| (|TEXPARSE;get_token| |sr| %))
                        (QSETVELT |sr| 2 (CONS 0 "normal"))
                        (EXIT
                         (COND ((QEQCAR |tok| 3) (SPADCALL |v| (QREFELT % 19)))
                               (#9#
                                (|error|
                                 "parse_item: text math did not end in a $"))))))))
                ((QEQCAR |tok| 4)
                 (COND
                  ((OR
                    (SPADCALL (QVELT |sr| 2) (CONS 1 "tmath") (QREFELT % 18))
                    (SPADCALL (QVELT |sr| 2) (CONS 2 "dmath") (QREFELT % 18)))
                   (|error|
                    "parse_item: internal error, math mode re-entered"))
                  (#10#
                   (SEQ (QSETVELT |sr| 2 (CONS 2 "dmath"))
                        (LETT |v|
                              (SPADCALL (|TEXPARSE;parse_items| |sr| %)
                                        (QREFELT % 16)))
                        (LETT |tok| (|TEXPARSE;get_token| |sr| %))
                        (QSETVELT |sr| 2 (CONS 0 "normal"))
                        (EXIT
                         (COND ((QEQCAR |tok| 4) (SPADCALL |v| (QREFELT % 20)))
                               (#9#
                                (|error|
                                 "parse_item: display math did not end in a $$"))))))))
                ((QEQCAR |tok| 5)
                 (SEQ
                  (LETT |cr|
                        (|TEXPARSE;parse_macro| |sr|
                         (QCAR
                          (PROG2 (LETT #8# |tok|)
                              (QCDR #8#)
                            (|check_union2| (QEQCAR #8# 5)
                                            (|Record| (|:| |name| (|String|)))
                                            (|Union| (|:| |text| (|String|))
                                                     (|:| |lbrace| #1#)
                                                     (|:| |rbrace| #2#)
                                                     (|:| |tmath| #3#)
                                                     (|:| |dmath| #4#)
                                                     (|:| |macro_name|
                                                          (|Record|
                                                           (|:| |name|
                                                                (|String|))))
                                                     (|:| |eos| #5#)
                                                     (|:| |error| #6#))
                                            #8#)))
                         %))
                  (COND
                   ((NULL (NULL (QCDR |cr|)))
                    (EXIT
                     (|error| "parse_item: Macro call needing arguments"))))
                  (EXIT (SPADCALL (QCAR |cr|) (QCDR |cr|) (QREFELT % 22)))))
                ((QEQCAR |tok| 0)
                 (SPADCALL
                  (PROG2 (LETT #7# |tok|)
                      (QCDR #7#)
                    (|check_union2| (QEQCAR #7# 0) (|String|)
                                    (|Union| (|:| |text| (|String|))
                                             (|:| |lbrace| #1#)
                                             (|:| |rbrace| #2#)
                                             (|:| |tmath| #3#)
                                             (|:| |dmath| #4#)
                                             (|:| |macro_name|
                                                  (|Record|
                                                   (|:| |name| (|String|))))
                                             (|:| |eos| #5#) (|:| |error| #6#))
                                    #7#))
                  (QREFELT % 23)))))))) 

(SDEFUN |TEXPARSE;parse_items|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                         (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                         (|:| |dmath| #4="dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| #5="eos") (|:| |error| #6="error")))))
         (% (|List| (|TeXTree|))))
        (SPROG
         ((|lv| (|List| (|TeXTree|))) (#7=#:G73 NIL)
          (|cr|
           (|Record| (|:| |name| (|String|))
                     (|:| |args| (|List| (|TeXTree|)))))
          (|name| (|String|))
          (|tok|
           (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                    (|:| |rbrace| #2#) (|:| |tmath| #3#) (|:| |dmath| #4#)
                    (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                    (|:| |eos| #5#) (|:| |error| #6#))))
         (SEQ
          (EXIT
           (SEQ (LETT |lv| NIL)
                (EXIT
                 (SEQ G190 NIL
                      (SEQ (LETT |tok| (|TEXPARSE;get_token| |sr| %))
                           (EXIT
                            (COND
                             ((QEQCAR |tok| 5)
                              (SEQ (LETT |name| (QCAR (CDR |tok|)))
                                   (LETT |cr|
                                         (|TEXPARSE;parse_macro| |sr|
                                          (QCAR (CDR |tok|)) %))
                                   (EXIT
                                    (LETT |lv|
                                          (CONS
                                           (SPADCALL (QCAR |cr|) (QCDR |cr|)
                                                     (QREFELT % 22))
                                           |lv|)))))
                             ('T
                              (SEQ (|TEXPARSE;unget_token| |sr| |tok| %)
                                   (COND
                                    ((OR (QEQCAR |tok| 2) (QEQCAR |tok| 6))
                                     (EXIT
                                      (PROGN
                                       (LETT #7# (NREVERSE |lv|))
                                       (GO #8=#:G72))))
                                    ((OR
                                      (SPADCALL (QVELT |sr| 2) (CONS 1 "tmath")
                                                (QREFELT % 18))
                                      (SPADCALL (QVELT |sr| 2) (CONS 2 "dmath")
                                                (QREFELT % 18)))
                                     (COND
                                      ((OR (QEQCAR |tok| 3) (QEQCAR |tok| 4))
                                       (EXIT
                                        (PROGN
                                         (LETT #7# (NREVERSE |lv|))
                                         (GO #8#)))))))
                                   (EXIT
                                    (LETT |lv|
                                          (CONS (|TEXPARSE;parse_item| |sr| %)
                                                |lv|))))))))
                      NIL (GO G190) G191 (EXIT NIL)))))
          #8# (EXIT #7#)))) 

(SDEFUN |TEXPARSE;parse_macro|
        ((|sr|
          (|Record|
           (|:| |st| (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
           (|:| |n_tok| (|SingleInteger|))
           (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
           (|:| |next_tok|
                (|Union| (|:| |text| (|String|)) (|:| |lbrace| "lbrace")
                         (|:| |rbrace| "rbrace") (|:| |tmath| "tmath")
                         (|:| |dmath| "dmath")
                         (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                         (|:| |eos| "eos") (|:| |error| "error")))))
         (|name| (|String|))
         (%
          (|Record| (|:| |name| (|String|))
                    (|:| |args| (|List| (|TeXTree|))))))
        (SPROG
         ((|args| (|List| (|TeXTree|))) (#1=#:G84 NIL) (|i| NIL)
          (|n| (|Integer|)))
         (SEQ
          (LETT |n|
                (COND ((SPADCALL |name| (QREFELT % 24) (QREFELT % 28)) 0)
                      ((SPADCALL |name| (QREFELT % 25) (QREFELT % 28)) 1)
                      ((SPADCALL |name| (QREFELT % 26) (QREFELT % 28)) 2)
                      ('T
                       (SEQ
                        (SPADCALL (SPADCALL |name| (QREFELT % 30))
                                  (QREFELT % 32))
                        (EXIT (|error| "parse_macro: unknown macro name"))))))
          (LETT |args| NIL)
          (SEQ (LETT |i| 1) (LETT #1# |n|) G190
               (COND ((|greater_SI| |i| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |args| (CONS (|TEXPARSE;parse_item| |sr| %) |args|))))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |args| (NREVERSE |args|)) (EXIT (CONS |name| |args|))))) 

(SDEFUN |TEXPARSE;parse;STxt;7| ((|s| (|String|)) (% (|TeXTree|)))
        (SPROG
         ((|tok|
           (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1="lbrace")
                    (|:| |rbrace| #2="rbrace") (|:| |tmath| #3="tmath")
                    (|:| |dmath| #4="dmath")
                    (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                    (|:| |eos| #5="eos") (|:| |error| #6="error")))
          (|lv| (|List| (|TeXTree|)))
          (|sr|
           (|Record|
            (|:| |st|
                 (|Record| (|:| |str| (|String|)) (|:| |pos| (|Integer|))))
            (|:| |n_tok| (|SingleInteger|))
            (|:| |tex_mode| (|Union| "normal" "tmath" "dmath"))
            (|:| |next_tok|
                 (|Union| (|:| |text| (|String|)) (|:| |lbrace| #1#)
                          (|:| |rbrace| #2#) (|:| |tmath| #3#)
                          (|:| |dmath| #4#)
                          (|:| |macro_name| (|Record| (|:| |name| (|String|))))
                          (|:| |eos| #5#) (|:| |error| #6#))))))
         (SEQ
          (LETT |sr| (VECTOR (CONS |s| 1) 0 (CONS 0 "normal") (CONS 6 #5#)))
          (LETT |lv| (|TEXPARSE;parse_items| |sr| %))
          (LETT |tok| (|TEXPARSE;get_token| |sr| %))
          (EXIT
           (COND ((QEQCAR |tok| 2) (|error| "parse: Spurious right brace"))
                 ((QEQCAR |tok| 6)
                  (COND ((EQL (LENGTH |lv|) 1) (|SPADfirst| |lv|))
                        (#7='T (SPADCALL |lv| (QREFELT % 16)))))
                 (#7# (|error| "parse: not all string parsed"))))))) 

(SDEFUN |TEXPARSE;parse;TfTxt;8| ((|f| (|TextFile|)) (% (|TeXTree|)))
        (SPROG
         ((|s| (|String|)) (|ls| (|List| (|String|))) (#1=#:G103 NIL)
          (|su| (|Union| (|String|) "failed")) (|nls| (|String|)))
         (SEQ (LETT |ls| NIL)
              (LETT |nls| (|make_string_code| 1 (SPADCALL (QREFELT % 35))))
              (SEQ
               (EXIT
                (SEQ G190 NIL
                     (SEQ (LETT |su| (SPADCALL |f| (QREFELT % 38)))
                          (EXIT
                           (COND
                            ((QEQCAR |su| 1)
                             (PROGN (LETT #1# |$NoValue|) (GO #2=#:G100)))
                            ('T
                             (SEQ (LETT |ls| (CONS (QCDR |su|) |ls|))
                                  (EXIT (LETT |ls| (CONS |nls| |ls|))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #2# (EXIT #1#))
              (LETT |ls| (NREVERSE |ls|))
              (LETT |s| (SPADCALL |ls| (QREFELT % 39)))
              (EXIT (SPADCALL |s| (QREFELT % 33)))))) 

(DECLAIM (NOTINLINE |TexParser;|)) 

(DEFUN |TexParser;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|TexParser|))
          (LETT % (GETREFV 41))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TexParser| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 24
                    (LIST "\\blankline" "\\newline" "\\em" "\\it"
                          "\\undocumented" "\\LaTeX" "\\TeX" "\\sigma"
                          "\\delta" "\\times" "\\leq" "\\pi" "\\sum"
                          "\\Language" "\\$" "\\%" "\\#" "\\^" "\\~" "\\{"
                          "\\}" "\\\"" "\\=" "\\/" "\\\\" "\\<" "\\dot"
                          "\\item" "\\int" "\\par"))
          (QSETREFV % 25
                    (LIST "\\spad" "\\spadop" "\\spadfun" "\\spadtype" "\\tab"
                          "\\space" "\\spadignore" "\\spadgloss" "\\spadvar"
                          "\\userfun" "\\spadsys" "\\url" "\\centerline"
                          "\\begin" "\\end" "\\indent" "\\pspadfun"))
          (QSETREFV % 26
                    (LIST "\\spadfunFrom" "\\spadopFrom" "\\indented"
                          "\\spadglossSee"))
          %))) 

(DEFUN |TexParser| ()
  (SPROG NIL
         (PROG (#1=#:G105)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|TexParser|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|TexParser|
                             (LIST (CONS NIL (CONS 1 (|TexParser;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|TexParser|)))))))))) 

(MAKEPROP '|TexParser| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Record| (|:| |name| 21))
              (|Union| (|:| |text| 21) (|:| |lbrace| '"lbrace")
                       (|:| |rbrace| '"rbrace") (|:| |tmath| '"tmath")
                       (|:| |dmath| '"dmath") (|:| |macro_name| 6)
                       (|:| |eos| '"eos") (|:| |error| '"error"))
              (|Record| (|:| |str| 21) (|:| |pos| (|Integer|))) (|TeXScanner|)
              (0 . |get_token!|) (|Boolean|) (|SingleInteger|) (5 . >)
              (|List| %) (|TeXTree|) (11 . |group|)
              (|Union| '"normal" '"tmath" '"dmath") (16 . =) (22 . |text_math|)
              (27 . |display_math|) (|String|) (32 . |m_call|) (38 . |text|)
              '|macro0| '|macro1| '|macro2| (|List| 21) (43 . |member?|)
              (|OutputForm|) (49 . |message|) (|Void|) (54 . |print|)
              |TEXPARSE;parse;STxt;7| (|Character|) (59 . |newline|)
              (|Union| 21 '"failed") (|TextFile|) (63 . |readLineIfCan!|)
              (68 . |concat|) |TEXPARSE;parse;TfTxt;8|)
           '#(|parse| 73) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|parse| ((|TeXTree|) (|String|))) T)
                                   '((|parse| ((|TeXTree|) (|TextFile|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 40
                                            '(1 9 7 8 10 2 12 11 0 0 13 1 15 0
                                              14 16 2 17 11 0 0 18 1 15 0 0 19
                                              1 15 0 0 20 2 15 0 21 14 22 1 15
                                              0 21 23 2 27 11 21 0 28 1 29 0 21
                                              30 1 29 31 0 32 0 34 0 35 1 37 36
                                              0 38 1 21 0 14 39 1 0 15 21 33 1
                                              0 15 37 40)))))
           '|lookupComplete|)) 
