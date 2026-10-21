
(SDEFUN |HDUTIL;constructor_to_string;SeS;1|
        ((|c| (|SExpression|)) (% (|String|)))
        (SPADCALL (NREVERSE (SPADCALL |c| NIL NIL (QREFELT % 9)))
                  (QREFELT % 12))) 

(SDEFUN |HDUTIL;con_to_strings;SeB2L;2|
        ((|con| (|SExpression|)) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPADCALL |con| (SPADCALL NIL (QREFELT % 14)) 'T |do_link| |acc|
                  (QREFELT % 15))) 

(SDEFUN |HDUTIL;has_to_strings|
        ((|cl| #1=(|List| (|SExpression|))) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG
         ((|#G9| #1#) (|dom| NIL) (|#G10| #1#) (|op| (|SExpression|))
          (|n| (|Integer|)) (|ops| (|Symbol|)) (|ns| (|String|))
          (|cat| (|SExpression|)) (|mt| (|List| (|SExpression|))))
         (SEQ
          (PROGN
           (LETT |#G9| |cl|)
           (LETT |#G10| |#G9|)
           (LETT |dom| (|SPADfirst| |#G10|))
           (LETT |#G10| (CDR |#G10|))
           (LETT |cat| (|SPADfirst| |#G10|))
           |#G9|)
          (LETT |acc| (SPADCALL |dom| |do_link| |acc| (QREFELT % 9)))
          (LETT |acc| (CONS " has " |acc|))
          (EXIT
           (COND
            ((OR (SPADCALL |cat| (QREFELT % 16))
                 (NULL
                  (|HDUTIL;is_symbol?| (SPADCALL |cat| (QREFELT % 17))
                   'SIGNATURE %)))
             (SPADCALL |cat| |do_link| |acc| (QREFELT % 9)))
            ('T
             (SEQ (LETT |cat| (SPADCALL |cat| (QREFELT % 18)))
                  (LETT |op| (SPADCALL |cat| (QREFELT % 17)))
                  (LETT |ops|
                        (COND
                         ((SPADCALL |op| (QREFELT % 16))
                          (SPADCALL |op| (QREFELT % 20)))
                         ((SPADCALL |op| (QREFELT % 21))
                          (SEQ (LETT |n| (SPADCALL |op| (QREFELT % 23)))
                               (EXIT
                                (COND ((EQL |n| 0) '|0|) ((EQL |n| 1) '|1|)
                                      (#2='T
                                       (|error|
                                        "unexpected integer as operation"))))))
                         (#2# (|error| "unexpected operation"))))
                  (LETT |ns| (SPADCALL |ops| (QREFELT % 24)))
                  (LETT |cat|
                        (SPADCALL (SPADCALL |cat| (QREFELT % 25)) 2
                                  (QREFELT % 27)))
                  (LETT |mt|
                        (CONS (SPADCALL '|Mapping| (QREFELT % 28))
                              (SPADCALL |cat| (QREFELT % 25))))
                  (LETT |acc| (CONS |ns| |acc|))
                  (LETT |acc| (CONS " : " |acc|))
                  (EXIT
                   (SPADCALL (SPADCALL |mt| (QREFELT % 14)) |do_link| |acc|
                             (QREFELT % 9)))))))))) 

(SDEFUN |HDUTIL;predicate_list_to_strings|
        ((|word| (|String|)) (|pl| (|List| (|SExpression|)))
         (|do_link| (|Boolean|)) (|acc| (|List| (|String|)))
         (% (|List| (|String|))))
        (SPROG ((|p| NIL) (#1=#:G76 NIL) (|first| (|Boolean|)))
               (SEQ (LETT |first| 'T)
                    (SEQ (LETT |p| NIL) (LETT #1# |pl|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((NULL |first|)
                            (LETT |acc|
                                  (SPADCALL (LIST " " |word| " ") |acc|
                                            (QREFELT % 29)))))
                          (LETT |first| NIL)
                          (EXIT
                           (LETT |acc|
                                 (SPADCALL |p| |do_link| |acc|
                                           (QREFELT % 30)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |acc|)))) 

(SDEFUN |HDUTIL;predicate_to_strings;SeB2L;5|
        ((|p| (|SExpression|)) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG ((|op| (|Symbol|)))
               (SEQ
                (LETT |op|
                      (SPADCALL (SPADCALL |p| (QREFELT % 17)) (QREFELT % 20)))
                (COND
                 ((OR (EQUAL |op| 'OR) (EQUAL |op| '|or|))
                  (EXIT
                   (|HDUTIL;predicate_list_to_strings| "or"
                    (SPADCALL (SPADCALL |p| (QREFELT % 18)) (QREFELT % 25))
                    |do_link| |acc| %))))
                (COND
                 ((OR (EQUAL |op| 'AND) (EQUAL |op| '|and|))
                  (EXIT
                   (|HDUTIL;predicate_list_to_strings| "and"
                    (SPADCALL (SPADCALL |p| (QREFELT % 18)) (QREFELT % 25))
                    |do_link| |acc| %))))
                (COND
                 ((OR (EQUAL |op| 'NOT) (EQUAL |op| '|not|))
                  (EXIT
                   (SEQ (LETT |acc| (CONS " not " |acc|))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |p| (QREFELT % 25)) 2
                                    (QREFELT % 27))
                          |do_link| |acc| (QREFELT % 30)))))))
                (EXIT
                 (COND
                  ((EQUAL |op| '|has|)
                   (|HDUTIL;has_to_strings|
                    (SPADCALL (SPADCALL |p| (QREFELT % 18)) (QREFELT % 25))
                    |do_link| |acc| %))
                  ('T (|error| "predicate_to_strings: unimplemented"))))))) 

(SDEFUN |HDUTIL;condition_to_string;SeS;6|
        ((|p| (|SExpression|)) (% (|String|)))
        (SPROG ((|ls| (|List| (|String|))))
               (SEQ (LETT |ls| (SPADCALL |p| NIL NIL (QREFELT % 30)))
                    (EXIT (SPADCALL (NREVERSE |ls|) (QREFELT % 12)))))) 

(SDEFUN |HDUTIL;unquote| ((|x| (|SExpression|)) (% (|SExpression|)))
        (SPROG
         ((|xl| (|List| (|SExpression|))) (|op1| (|SExpression|))
          (#1=#:G99 NIL) (|x1| NIL) (#2=#:G100 NIL))
         (SEQ
          (COND
           ((OR (SPADCALL |x| (QREFELT % 32))
                (NULL (SPADCALL |x| (QREFELT % 33))))
            |x|)
           ('T
            (SEQ (LETT |xl| (SPADCALL |x| (QREFELT % 25)))
                 (LETT |op1| (|SPADfirst| |xl|))
                 (EXIT
                  (COND
                   ((|HDUTIL;is_symbol?| |op1| 'QUOTE %)
                    (SPADCALL |xl| 2 (QREFELT % 27)))
                   ('T
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |x1| NIL) (LETT #2# |xl|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |x1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1# (CONS (|HDUTIL;unquote| |x1| %) #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 14))))))))))) 

(SDEFUN |HDUTIL;outform_to_string;OfS;8| ((|o| (|OutputForm|)) (% (|String|)))
        (SPADCALL (SPADCALL (SPADCALL |o| (QREFELT % 37)) (QREFELT % 38))
                  (QREFELT % 12))) 

(SDEFUN |HDUTIL;typed_val_to_string1|
        ((|val| (|SExpression|)) (|t| (|SExpression|)) (% (|String|)))
        (SPROG ((|o| (|OutputForm|)))
               (SEQ
                (LETT |o|
                      (|algCoerceInteractive| |val| |t| (LIST '|OutputForm|)))
                (EXIT (SPADCALL |o| (QREFELT % 39)))))) 

(SDEFUN |HDUTIL;typed_val_to_string|
        ((|val| (|SExpression|)) (|t_op| (|Symbol|))
         (|t_args| (|List| (|SExpression|))) (|k| (|Integer|)) (% (|String|)))
        (SPROG
         ((#1=#:G108 NIL) (|t_arg| NIL) (#2=#:G109 NIL)
          (|la| (|List| (|SExpression|))) (|t_sig| (|SExpression|))
          (|tal| (|List| (|SExpression|))))
         (SEQ
          (LETT |la|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |t_arg| NIL) (LETT #2# |t_args|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t_arg| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1# (CONS (|HDUTIL;unquote| |t_arg| %) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (LETT |t_sig| (SPADCALL |t_op| |la| (QREFELT % 41)))
          (LETT |tal|
                (SPADCALL (SPADCALL |t_sig| (QREFELT % 18)) (QREFELT % 25)))
          (EXIT
           (|HDUTIL;typed_val_to_string1| |val|
            (SPADCALL |tal| |k| (QREFELT % 27)) %))))) 

(SDEFUN |HDUTIL;cons_list_to|
        ((|l| (|List| (|String|))) (|acc| (|List| (|String|)))
         (% (|List| (|String|))))
        (SPROG ((|s| NIL) (#1=#:G114 NIL))
               (SEQ
                (SEQ (LETT |s| NIL) (LETT #1# |l|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ (EXIT (LETT |acc| (CONS |s| |acc|))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |acc|)))) 

(SDEFUN |HDUTIL;is_symbol?|
        ((|se| (|SExpression|)) (|sy| (|Symbol|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |se| (QREFELT % 16))
          (EQUAL (SPADCALL |se| (QREFELT % 20)) |sy|))
         ('T NIL))) 

(SDEFUN |HDUTIL;has_op?|
        ((|se| (|SExpression|)) (|sy| (|Symbol|)) (% (|Boolean|)))
        (COND ((NULL (SPADCALL |se| (QREFELT % 33))) NIL)
              ('T (|HDUTIL;is_symbol?| (SPADCALL |se| (QREFELT % 17)) |sy| %)))) 

(SDEFUN |HDUTIL;list_to_string|
        ((|ty| (|SExpression|)) (|l| (|List| (|SExpression|))) (% (|String|)))
        (SPROG
         ((|ty1| (|SExpression|)) (|s1| NIL) (#1=#:G132 NIL)
          (|first1| (|Boolean|)) (|lss| (|List| (|String|))))
         (SEQ
          (LETT |ty1|
                (SPADCALL (SPADCALL |ty| (QREFELT % 25)) 2 (QREFELT % 27)))
          (COND
           ((|HDUTIL;has_op?| |ty1| '|Symbol| %)
            (COND
             ((SPADCALL (ELT % 16) |l| (QREFELT % 43))
              (EXIT
               (SEQ (LETT |lss| (LIST "[")) (LETT |first1| 'T)
                    (SEQ (LETT |s1| NIL) (LETT #1# |l|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |s1| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (COND
                           ((NULL |first1|) (LETT |lss| (CONS ", " |lss|))))
                          (LETT |first1| NIL)
                          (EXIT
                           (LETT |lss|
                                 (CONS
                                  (SPADCALL (SPADCALL |s1| (QREFELT % 20))
                                            (QREFELT % 24))
                                  |lss|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (LETT |lss| (CONS "]" |lss|))
                    (EXIT (SPADCALL (NREVERSE |lss|) (QREFELT % 12)))))))))
          (PRETTYPRINT |ty|) (PRETTYPRINT |l|)
          (EXIT (|error| "list_to_string: unexpected form of list"))))) 

(SDEFUN |HDUTIL;con_arg_to_strings;BSL2SeIB2L;15|
        ((|k?| (|Boolean|)) (|op| (|Symbol|)) (|lef| (|List| (|SExpression|)))
         (|form| (|SExpression|)) (|ef| (|SExpression|)) (|k| (|Integer|))
         (|do_link| (|Boolean|)) (|acc| (|List| (|String|)))
         (% (|List| (|String|))))
        (SPROG
         ((|efl| #1=(|List| (|SExpression|))) (|sig| (|List| (|SExpression|)))
          (|a_type| #2=(|SExpression|)) (|fl| #1#) (|op1| (|SExpression|))
          (|ls1l| #1#) (|s1| NIL) (#3=#:G169 NIL) (|first1| (|Boolean|))
          (|lss| (|List| (|String|))) (|ls1| #2#) (|s| (|String|)))
         (SEQ
          (COND
           (|k?|
            (COND
             ((SPADCALL |form| (QREFELT % 33))
              (EXIT
               (LETT |acc|
                     (SPADCALL |form| |ef| 'T |do_link| |acc|
                               (QREFELT % 15))))))))
          (LETT |s|
                (COND
                 ((SPADCALL |form| (QREFELT % 44))
                  (SPADCALL (LIST "\"" (SPADCALL |form| (QREFELT % 45)) "\"")
                            (QREFELT % 12)))
                 (#4='T
                  (SEQ
                   (COND
                    ((NULL |k?|)
                     (COND
                      ((NULL (SPADCALL |ef| (QREFELT % 32)))
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |ef| (QREFELT % 33)))
                          (|HDUTIL;typed_val_to_string| |ef| |op| |lef| |k| %))
                         ('T
                          (SEQ (LETT |efl| (SPADCALL |ef| (QREFELT % 25)))
                               (LETT |op1| (|SPADfirst| |efl|))
                               (EXIT
                                (COND
                                 ((|HDUTIL;is_symbol?| |op1| 'QUOTE %)
                                  (|HDUTIL;typed_val_to_string|
                                   (SPADCALL (SPADCALL |ef| (QREFELT % 18))
                                             (QREFELT % 17))
                                   |op| |lef| |k| %))
                                 (#4#
                                  (SEQ (PRETTYPRINT |ef|)
                                       (EXIT
                                        (|error|
                                         "con_args_to_strings: unexpected argument value1"))))))))))))))
                   (EXIT
                    (COND
                     ((SPADCALL |form| (QREFELT % 16))
                      (COND ((EQUAL (SPADCALL |form| (QREFELT % 20)) 'T$) "T")
                            (#4#
                             (SPADCALL (SPADCALL |form| (QREFELT % 20))
                                       (QREFELT % 24)))))
                     ((SPADCALL |form| (QREFELT % 21))
                      (STRINGIMAGE (SPADCALL |form| (QREFELT % 23))))
                     (#4#
                      (SEQ
                       (LETT |sig|
                             (CDR
                              (SPADCALL (SPADCALL |op| (QREFELT % 46))
                                        (QREFELT % 25))))
                       (EXIT
                        (COND
                         ((> |k| (LENGTH |sig|))
                          (|error|
                           "con_arg_to_strings: wrong argument number"))
                         (#4#
                          (SEQ
                           (LETT |a_type| (SPADCALL |sig| |k| (QREFELT % 27)))
                           (EXIT
                            (COND
                             ((SPADCALL |form| (QREFELT % 33))
                              (SEQ (LETT |fl| (SPADCALL |form| (QREFELT % 25)))
                                   (LETT |op1| (|SPADfirst| |fl|))
                                   (COND
                                    ((|HDUTIL;is_symbol?| |op1| '|#| %)
                                     (COND
                                      ((EQL (LENGTH |fl|) 2)
                                       (EXIT
                                        (SEQ
                                         (LETT |ls1|
                                               (SPADCALL |fl| 2
                                                         (QREFELT % 27)))
                                         (EXIT
                                          (COND
                                           ((SPADCALL |ls1| (QREFELT % 16))
                                            (STRCONC "\\# "
                                                     (SPADCALL
                                                      (SPADCALL |ls1|
                                                                (QREFELT % 20))
                                                      (QREFELT % 24))))
                                           ((SPADCALL |ls1| (QREFELT % 33))
                                            (SEQ
                                             (LETT |ls1l|
                                                   (SPADCALL |ls1|
                                                             (QREFELT % 25)))
                                             (COND
                                              ((NULL
                                                (SPADCALL (ELT % 44) |ls1l|
                                                          (QREFELT % 43)))
                                               (EXIT
                                                (SEQ (PRETTYPRINT |form|)
                                                     (EXIT
                                                      (|error|
                                                       (SPADCALL
                                                        "con_args_to_strings: "
                                                        "unexpected argument value4"
                                                        (QREFELT % 47))))))))
                                             (LETT |lss| (LIST "["))
                                             (LETT |first1| 'T)
                                             (SEQ (LETT |s1| NIL)
                                                  (LETT #3# |ls1l|) G190
                                                  (COND
                                                   ((OR (ATOM #3#)
                                                        (PROGN
                                                         (LETT |s1| (CAR #3#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (COND
                                                    ((NULL |first1|)
                                                     (LETT |lss|
                                                           (CONS ", " |lss|))))
                                                   (LETT |first1| NIL)
                                                   (EXIT
                                                    (LETT |lss|
                                                          (CONS
                                                           (SPADCALL |s1|
                                                                     (QREFELT %
                                                                              45))
                                                           |lss|))))
                                                  (LETT #3# (CDR #3#))
                                                  (GO G190) G191 (EXIT NIL))
                                             (LETT |lss| (CONS "]" |lss|))
                                             (LETT |lss| (NREVERSE |lss|))
                                             (EXIT
                                              (SPADCALL (CONS "\\#" |lss|)
                                                        (QREFELT %
                                                                 12)))))))))))))
                                   (COND
                                    ((|HDUTIL;is_symbol?| |op1| 'QUOTE %)
                                     (COND
                                      ((EQL (LENGTH |fl|) 2)
                                       (EXIT
                                        (SEQ
                                         (LETT |ls1|
                                               (SPADCALL |fl| 2
                                                         (QREFELT % 27)))
                                         (COND
                                          ((SPADCALL |ls1| (QREFELT % 16))
                                           (COND
                                            ((|HDUTIL;has_op?| |a_type|
                                              '|Symbol| %)
                                             (EXIT
                                              (SPADCALL
                                               (SPADCALL |ls1| (QREFELT % 20))
                                               (QREFELT % 24)))))))
                                         (COND
                                          ((|HDUTIL;has_op?| |a_type| '|List|
                                            %)
                                           (COND
                                            ((SPADCALL |ls1| (QREFELT % 33))
                                             (EXIT
                                              (|HDUTIL;list_to_string| |a_type|
                                               (SPADCALL |ls1| (QREFELT % 25))
                                               %))))))
                                         (PRETTYPRINT |form|)
                                         (EXIT
                                          (|error|
                                           (SPADCALL "con_args_to_strings: "
                                                     "unexpected argument value5"
                                                     (QREFELT % 47))))))))))
                                   (EXIT
                                    (COND
                                     ((|HDUTIL;has_op?| |a_type| '|List| %)
                                      (|HDUTIL;list_to_string| |a_type| |fl|
                                       %))
                                     (#4#
                                      (SEQ (PRETTYPRINT |a_type|)
                                           (PRETTYPRINT |form|)
                                           (EXIT
                                            (|error|
                                             "con_args_to_strings: unexpected argument value2"))))))))
                             (#4#
                              (SEQ (PRETTYPRINT |form|)
                                   (EXIT
                                    (|error|
                                     "con_args_to_strings: unexpected argument value3"))))))))))))))))))
          (EXIT (LETT |acc| (CONS |s| |acc|)))))) 

(SDEFUN |HDUTIL;con_args_to_strings;S2LB2L;16|
        ((|op| (|Symbol|)) (|lf| (|List| (|SExpression|)))
         (|lef| (|List| (|SExpression|))) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG
         ((#1=#:G182 NIL) (#2=#:G183 NIL) (|co_sig| (|List| (|Boolean|)))
          (|k| NIL) (|ef| NIL) (#3=#:G186 NIL) (|form| NIL) (#4=#:G185 NIL)
          (|k?| NIL) (#5=#:G184 NIL) (|first| (|Boolean|)))
         (SEQ
          (LETT |co_sig|
                (COND
                 ((OR (EQUAL |op| '|Mapping|) (EQUAL |op| '|Union|))
                  (PROGN
                   (LETT #1# NIL)
                   (SEQ (LETT |form| NIL) (LETT #2# |lf|) G190
                        (COND
                         ((OR (ATOM #2#) (PROGN (LETT |form| (CAR #2#)) NIL))
                          (GO G191)))
                        (SEQ (EXIT (LETT #1# (CONS 'T #1#))))
                        (LETT #2# (CDR #2#)) (GO G190) G191
                        (EXIT (NREVERSE #1#)))))
                 ('T (CDR (|get_database| |op| 'COSIG)))))
          (LETT |acc| (CONS "(" |acc|)) (LETT |first| 'T)
          (SEQ (LETT |k| 1) (LETT |ef| NIL) (LETT #3# |lef|) (LETT |form| NIL)
               (LETT #4# |lf|) (LETT |k?| NIL) (LETT #5# |co_sig|) G190
               (COND
                ((OR (ATOM #5#) (PROGN (LETT |k?| (CAR #5#)) NIL) (ATOM #4#)
                     (PROGN (LETT |form| (CAR #4#)) NIL) (ATOM #3#)
                     (PROGN (LETT |ef| (CAR #3#)) NIL))
                 (GO G191)))
               (SEQ (COND ((NULL |first|) (LETT |acc| (CONS ", " |acc|))))
                    (LETT |first| NIL)
                    (EXIT
                     (LETT |acc|
                           (SPADCALL |k?| |op| |lef| |form| |ef| |k| |do_link|
                                     |acc| (QREFELT % 48)))))
               (LETT #5#
                     (PROG1 (CDR #5#)
                       (LETT #4#
                             (PROG1 (CDR #4#)
                               (LETT #3#
                                     (PROG1 (CDR #3#)
                                       (LETT |k| (|inc_SI| |k|))))))))
               (GO G190) G191 (EXIT NIL))
          (EXIT (CONS ")" |acc|))))) 

(SDEFUN |HDUTIL;convert_arg| ((|arg| (|SExpression|)) (% (|SExpression|)))
        (COND
         ((OR (SPADCALL |arg| (QREFELT % 33))
              (OR (SPADCALL |arg| (QREFELT % 44))
                  (SPADCALL |arg| (SPADCALL '% (QREFELT % 28))
                            (QREFELT % 50))))
          |arg|)
         ('T (SPADCALL (LIST |arg|) (QREFELT % 14))))) 

(SDEFUN |HDUTIL;con_page_link|
        ((|label| (|String|)) (|op| (|Symbol|)) (|acc| (|List| (|String|)))
         (% (|List| (|String|))))
        (SEQ
         (LETT |acc|
               (|HDUTIL;cons_list_to| (LIST "\\lispdownlink{" |label| "}{")
                |acc| %))
         (EXIT
          (|HDUTIL;cons_list_to|
           (LIST "(|conPage| '(|" (SPADCALL |op| (QREFELT % 24)) "|))}") |acc|
           %)))) 

(SDEFUN |HDUTIL;record_args_to_strings|
        ((|args| (|List| (|SExpression|))) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG
         ((|arg| NIL) (#1=#:G198 NIL) (|first| (|Boolean|))
          (|#G77| #2=(|List| (|SExpression|))) (|col| NIL) (|lab| NIL)
          (|#G78| #2#) (|type| NIL))
         (SEQ (LETT |acc| (CONS "(" |acc|)) (LETT |first| 'T)
              (SEQ (LETT |arg| NIL) (LETT #1# |args|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |arg| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (COND ((NULL |first|) (LETT |acc| (CONS ", " |acc|))))
                        (LETT |first| NIL)
                        (PROGN
                         (LETT |#G77| (SPADCALL |arg| (QREFELT % 25)))
                         (LETT |#G78| |#G77|)
                         (LETT |col| (|SPADfirst| |#G78|))
                         (LETT |#G78| (CDR |#G78|))
                         (LETT |lab| (|SPADfirst| |#G78|))
                         (LETT |#G78| (CDR |#G78|))
                         (LETT |type| (|SPADfirst| |#G78|))
                         |#G77|)
                        (LETT |acc|
                              (CONS
                               (SPADCALL (SPADCALL |lab| (QREFELT % 20))
                                         (QREFELT % 24))
                               |acc|))
                        (LETT |acc| (CONS " : " |acc|))
                        (EXIT
                         (LETT |acc|
                               (SPADCALL |type| |do_link| |acc|
                                         (QREFELT % 9)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS ")" |acc|))))) 

(SDEFUN |HDUTIL;union_args_to_strings|
        ((|args| (|List| (|SExpression|))) (|efa| (|List| (|SExpression|)))
         (|do_link| (|Boolean|)) (|acc| (|List| (|String|)))
         (% (|List| (|String|))))
        (SPROG
         ((|a1| (|SExpression|)) (|l1| (|List| (|SExpression|)))
          (#1=#:G207 NIL) (#2=#:G208 NIL) (|arg| NIL) (#3=#:G209 NIL))
         (SEQ
          (COND ((NULL |args|) (CONS "()" |acc|))
                ('T
                 (SEQ
                  (EXIT
                   (SEQ (LETT |a1| (|SPADfirst| |args|))
                        (COND
                         ((SPADCALL |a1| (QREFELT % 33))
                          (SEQ (LETT |l1| (SPADCALL |a1| (QREFELT % 25)))
                               (EXIT
                                (COND
                                 ((EQL (LENGTH |l1|) 3)
                                  (COND
                                   ((SPADCALL (|SPADfirst| |l1|)
                                              (SPADCALL '|:| (QREFELT % 28))
                                              (QREFELT % 50))
                                    (PROGN
                                     (LETT #1#
                                           (|HDUTIL;record_args_to_strings|
                                            |args| |do_link| |acc| %))
                                     (GO #4=#:G204))))))))))
                        (LETT |args|
                              (PROGN
                               (LETT #2# NIL)
                               (SEQ (LETT |arg| NIL) (LETT #3# |args|) G190
                                    (COND
                                     ((OR (ATOM #3#)
                                          (PROGN (LETT |arg| (CAR #3#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #2#
                                            (CONS
                                             (|HDUTIL;convert_arg| |arg| %)
                                             #2#))))
                                    (LETT #3# (CDR #3#)) (GO G190) G191
                                    (EXIT (NREVERSE #2#)))))
                        (EXIT
                         (SPADCALL '|Union| |args| |efa| |do_link| |acc|
                                   (QREFELT % 49)))))
                  #4# (EXIT #1#))))))) 

(SDEFUN |HDUTIL;con_to_strings;S2Se2B2L;21|
        ((|label| (|String|)) (|form| (|SExpression|)) (|ef| (|SExpression|))
         (|do_args| (|Boolean|)) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG
         ((|s| (|String|)) (|op| (|Symbol|)) (#1=#:G231 NIL) (|f1| NIL)
          (#2=#:G232 NIL) (|efa| (|List| (|SExpression|)))
          (|target| (|SExpression|)) (#3=#:G233 NIL) (#4=#:G234 NIL)
          (|args| (|List| (|SExpression|))) (|arg| NIL) (#5=#:G235 NIL)
          (|first| (|Boolean|)))
         (SEQ
          (COND
           ((SPADCALL |form| (QREFELT % 44))
            (SEQ
             (LETT |s|
                   (SPADCALL (LIST "\"" (SPADCALL |form| (QREFELT % 45)) "\"")
                             (QREFELT % 12)))
             (EXIT (CONS |s| |acc|))))
           ((SPADCALL |form| (QREFELT % 16))
            (COND
             ((SPADCALL |form| (SPADCALL '% (QREFELT % 28)) (QREFELT % 50))
              (CONS "%" |acc|))
             (#6='T
              (SPADCALL |label| (SPADCALL (LIST |form|) (QREFELT % 14))
                        (SPADCALL NIL (QREFELT % 14)) |do_link| NIL |acc|
                        (QREFELT % 51)))))
           (#6#
            (SEQ
             (LETT |op|
                   (SPADCALL (SPADCALL |form| (QREFELT % 17)) (QREFELT % 20)))
             (LETT |efa|
                   (COND
                    ((SPADCALL |ef| (QREFELT % 32))
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |f1| NIL)
                           (LETT #2#
                                 (SPADCALL (SPADCALL |form| (QREFELT % 18))
                                           (QREFELT % 25)))
                           G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |f1| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ (EXIT (LETT #1# (CONS |ef| #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#)))))
                    (#6#
                     (SPADCALL (SPADCALL |ef| (QREFELT % 18))
                               (QREFELT % 25)))))
             (EXIT
              (COND
               ((EQUAL |op| '|Mapping|)
                (SEQ (LETT |form| (SPADCALL |form| (QREFELT % 18)))
                     (LETT |target| (SPADCALL |form| (QREFELT % 17)))
                     (LETT |args|
                           (PROGN
                            (LETT #3# NIL)
                            (SEQ (LETT |arg| NIL)
                                 (LETT #4#
                                       (SPADCALL
                                        (SPADCALL |form| (QREFELT % 18))
                                        (QREFELT % 25)))
                                 G190
                                 (COND
                                  ((OR (ATOM #4#)
                                       (PROGN (LETT |arg| (CAR #4#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #3#
                                         (CONS (|HDUTIL;convert_arg| |arg| %)
                                               #3#))))
                                 (LETT #4# (CDR #4#)) (GO G190) G191
                                 (EXIT (NREVERSE #3#)))))
                     (LETT |acc|
                           (SPADCALL |op| |args| (CDR |efa|) |do_link| |acc|
                                     (QREFELT % 49)))
                     (LETT |acc| (CONS "->" |acc|))
                     (EXIT
                      (SPADCALL (|HDUTIL;convert_arg| |target| %) |do_link|
                                |acc| (QREFELT % 9)))))
               (#6#
                (SEQ
                 (LETT |acc|
                       (COND
                        (|do_link|
                         (|HDUTIL;con_page_link| |label| |op| |acc| %))
                        (#6# (CONS |label| |acc|))))
                 (LETT |args|
                       (SPADCALL (SPADCALL |form| (QREFELT % 18))
                                 (QREFELT % 25)))
                 (EXIT
                  (COND
                   ((EQUAL |op| '|Record|)
                    (|HDUTIL;record_args_to_strings| |args| |do_link| |acc| %))
                   ((EQUAL |op| '|Union|)
                    (|HDUTIL;union_args_to_strings| |args| |efa| |do_link|
                     |acc| %))
                   ((EQUAL |op| '|Enumeration|)
                    (SEQ (LETT |acc| (CONS "(" |acc|)) (LETT |first| 'T)
                         (SEQ (LETT |arg| NIL) (LETT #5# |args|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |arg| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (COND
                                ((NULL |first|)
                                 (LETT |acc| (CONS ", " |acc|))))
                               (LETT |first| NIL)
                               (EXIT
                                (LETT |acc|
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL |arg| (QREFELT % 20))
                                        (QREFELT % 24))
                                       |acc|))))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                         (EXIT (LETT |acc| (CONS ")" |acc|)))))
                   (#6#
                    (SEQ
                     (COND
                      ((NULL (NULL |args|))
                       (COND
                        (|do_args|
                         (EXIT
                          (SPADCALL |op| |args| |efa| |do_link| |acc|
                                    (QREFELT % 49)))))))
                     (EXIT |acc|))))))))))))))) 

(SDEFUN |HDUTIL;con_to_strings;2Se2B2L;22|
        ((|form| (|SExpression|)) (|ef| (|SExpression|))
         (|do_args| (|Boolean|)) (|do_link| (|Boolean|))
         (|acc| (|List| (|String|))) (% (|List| (|String|))))
        (SPROG ((|s| (|String|)) (|op| (|Symbol|)))
               (SEQ
                (COND
                 ((SPADCALL |form| (QREFELT % 44))
                  (SEQ
                   (LETT |s|
                         (SPADCALL
                          (LIST "\"" (SPADCALL |form| (QREFELT % 45)) "\"")
                          (QREFELT % 12)))
                   (EXIT (CONS |s| |acc|))))
                 ((SPADCALL |form| (QREFELT % 16))
                  (COND
                   ((SPADCALL |form| (SPADCALL '% (QREFELT % 28))
                              (QREFELT % 50))
                    (CONS "%" |acc|))
                   (#1='T
                    (SPADCALL (SPADCALL (LIST |form|) (QREFELT % 14))
                              (SPADCALL NIL (QREFELT % 14)) NIL |do_link| |acc|
                              (QREFELT % 15)))))
                 (#1#
                  (SEQ
                   (LETT |op|
                         (SPADCALL (SPADCALL |form| (QREFELT % 17))
                                   (QREFELT % 20)))
                   (EXIT
                    (SPADCALL (SPADCALL |op| (QREFELT % 24)) |form| |ef|
                              |do_args| |do_link| |acc| (QREFELT % 51))))))))) 

(SDEFUN |HDUTIL;con_to_strings;SLL;23|
        ((|name| (|Symbol|)) (|con| (|List| (|SExpression|)))
         (% (|List| (|String|))))
        (SPROG
         ((|lc| (|List| (|SExpression|))) (#1=#:G246 NIL) (|c1| NIL)
          (#2=#:G247 NIL) (|elc| (|List| (|SExpression|)))
          (|res1| (|List| (|String|))))
         (SEQ (LETT |lc| (CDR |con|))
              (LETT |elc|
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |c1| NIL) (LETT #2# |lc|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT |c1| (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #1#
                                  (CONS (SPADCALL NIL (QREFELT % 14)) #1#))))
                          (LETT #2# (CDR #2#)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))
              (LETT |res1|
                    (SPADCALL |name| |lc| |elc| 'T
                              (LIST (SPADCALL |name| (QREFELT % 24)))
                              (QREFELT % 49)))
              (EXIT (NREVERSE |res1|))))) 

(DECLAIM (NOTINLINE |HyperdocUtilities;|)) 

(DEFUN |HyperdocUtilities;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|HyperdocUtilities|))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HyperdocUtilities| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |HyperdocUtilities| ()
  (SPROG NIL
         (PROG (#1=#:G249)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|HyperdocUtilities|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|HyperdocUtilities|
                             (LIST
                              (CONS NIL (CONS 1 (|HyperdocUtilities;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|HyperdocUtilities|)))))))))) 

(MAKEPROP '|HyperdocUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| 11) (|SExpression|) (|Boolean|)
              |HDUTIL;con_to_strings;SeB2L;2| (|List| %) (|String|)
              (0 . |concat|) |HDUTIL;constructor_to_string;SeS;1|
              (5 . |convert|) |HDUTIL;con_to_strings;2Se2B2L;22|
              (10 . |symbol?|) (15 . |car|) (20 . |cdr|) (|Symbol|)
              (25 . |symbol|) (30 . |integer?|) (|Integer|) (35 . |integer|)
              (40 . |string|) (45 . |destruct|) (|List| 7) (50 . |elt|)
              (56 . |convert|) (61 . |concat|)
              |HDUTIL;predicate_to_strings;SeB2L;5|
              |HDUTIL;condition_to_string;SeS;6| (67 . |null?|) (72 . |list?|)
              (|OutputBox|) (|OutputForm|) (|Format1D|)
              (77 . |formatExpression|) (82 . |lines|)
              |HDUTIL;outform_to_string;OfS;8| (|BrowserInformation|)
              (87 . |constructor_signature|) (|Mapping| 8 7) (93 . |every?|)
              (99 . |string?|) (104 . |string|) (109 . |constructor_signature|)
              (114 . |elt|) |HDUTIL;con_arg_to_strings;BSL2SeIB2L;15|
              |HDUTIL;con_args_to_strings;S2LB2L;16| (120 . =)
              |HDUTIL;con_to_strings;S2Se2B2L;21|
              |HDUTIL;con_to_strings;SLL;23|)
           '#(|predicate_to_strings| 126 |outform_to_string| 133
              |constructor_to_string| 138 |condition_to_string| 143
              |con_to_strings| 148 |con_args_to_strings| 180
              |con_arg_to_strings| 189)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|constructor_to_string|
                                 ((|String|) (|SExpression|)))
                                T)
                              '((|condition_to_string|
                                 ((|String|) (|SExpression|)))
                                T)
                              '((|con_to_strings|
                                 ((|List| (|String|)) (|SExpression|)
                                  (|Boolean|) (|List| (|String|))))
                                T)
                              '((|con_to_strings|
                                 ((|List| (|String|)) (|SExpression|)
                                  (|SExpression|) (|Boolean|) (|Boolean|)
                                  (|List| (|String|))))
                                T)
                              '((|con_to_strings|
                                 ((|List| (|String|)) (|String|)
                                  (|SExpression|) (|SExpression|) (|Boolean|)
                                  (|Boolean|) (|List| (|String|))))
                                T)
                              '((|con_to_strings|
                                 ((|List| (|String|)) (|Symbol|)
                                  (|List| (|SExpression|))))
                                T)
                              '((|con_arg_to_strings|
                                 ((|List| (|String|)) (|Boolean|) (|Symbol|)
                                  (|List| (|SExpression|)) (|SExpression|)
                                  (|SExpression|) (|Integer|) (|Boolean|)
                                  (|List| (|String|))))
                                T)
                              '((|con_args_to_strings|
                                 ((|List| (|String|)) (|Symbol|)
                                  (|List| (|SExpression|))
                                  (|List| (|SExpression|)) (|Boolean|)
                                  (|List| (|String|))))
                                T)
                              '((|predicate_to_strings|
                                 ((|List| (|String|)) (|SExpression|)
                                  (|Boolean|) (|List| (|String|))))
                                T)
                              '((|outform_to_string|
                                 ((|String|) (|OutputForm|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 52
                                            '(1 11 0 10 12 1 7 0 10 14 1 7 8 0
                                              16 1 7 0 0 17 1 7 0 0 18 1 7 19 0
                                              20 1 7 8 0 21 1 7 22 0 23 1 19 11
                                              0 24 1 7 10 0 25 2 26 7 0 22 27 1
                                              7 0 19 28 2 6 0 0 0 29 1 7 8 0 32
                                              1 7 8 0 33 1 36 34 35 37 1 34 6 0
                                              38 2 40 7 19 26 41 2 26 8 42 0 43
                                              1 7 8 0 44 1 7 11 0 45 1 40 7 19
                                              46 2 11 0 0 0 47 2 7 8 0 0 50 3 0
                                              6 7 8 6 30 1 0 11 35 39 1 0 11 7
                                              13 1 0 11 7 31 2 0 6 19 26 52 5 0
                                              6 7 7 8 8 6 15 6 0 6 11 7 7 8 8 6
                                              51 3 0 6 7 8 6 9 5 0 6 19 26 26 8
                                              6 49 8 0 6 8 19 26 7 7 22 8 6
                                              48)))))
           '|lookupComplete|)) 
