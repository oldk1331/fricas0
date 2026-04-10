
(SDEFUN |ICARD;sig_to_string| ((|sig| (|SExpression|)) (% (|String|)))
        (SPROG ((|sl| (|List| (|SExpression|))))
               (SEQ
                (LETT |sl|
                      (CONS (SPADCALL '|Mapping| (QREFELT % 9))
                            (SPADCALL |sig| (QREFELT % 11))))
                (EXIT (|form2LispString| |sl|))))) 

(SDEFUN |ICARD;get_origin_op| ((|xr| (|Rep|)) (% (|Symbol|)))
        (SPADCALL (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 12))
                  (QREFELT % 13))) 

(SDEFUN |ICARD;get_abbreviation| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|abbr| (|SExpression|)))
               (SEQ
                (COND ((EQUAL (QVELT |xr| 1) '|o|) "")
                      ('T
                       (SEQ
                        (LETT |abbr|
                              (|get_database| (QVELT |xr| 0) 'ABBREVIATION))
                        (COND
                         ((NULL (SPADCALL |abbr| (QREFELT % 15)))
                          (EXIT
                           (SPADCALL (SPADCALL |abbr| (QREFELT % 13))
                                     (QREFELT % 17)))))
                        (EXIT ""))))))) 

(SDEFUN |ICARD;get_condition| ((|xr| (|Rep|)) (% (|String|)))
        (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
              ('T
               (COND ((SPADCALL (QVELT (QVELT |xr| 2) 1) 'T (QREFELT % 18)) "")
                     ('T (|form2LispString| (QVELT (QVELT |xr| 2) 1))))))) 

(SDEFUN |ICARD;get_exposed1| ((|c| (|Symbol|)) (% (|String|)))
        (COND ((SPADCALL |c| (QREFELT % 20)) "x") ('T "n"))) 

(SDEFUN |ICARD;get_exposed| ((|xr| (|Rep|)) (% (|String|)))
        (COND
         ((NULL (EQUAL (QVELT |xr| 1) '|o|))
          (|ICARD;get_exposed1| (QVELT |xr| 0) %))
         ('T (|ICARD;get_exposed1| (|ICARD;get_origin_op| |xr| %) %)))) 

(SDEFUN |ICARD;get_kind| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|o_kind| (|Symbol|)))
               (SEQ
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                  (SPADCALL (QVELT |xr| 1) (QREFELT % 17)))
                 ('T
                  (SEQ
                   (LETT |o_kind|
                         (SPADCALL (|ICARD;get_origin_op| |xr| %)
                                   (QREFELT % 21)))
                   (EXIT
                    (COND ((EQUAL |o_kind| '|category|) "c")
                          ((EQUAL |o_kind| '|domain|) "d")
                          ((EQUAL |o_kind| '|package|) "p")
                          ('T (|error| "get_kind: impossible")))))))))) 

(SDEFUN |ICARD;get_origin| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|os| (|SExpression|)) (|oe| (|SExpression|)))
               (SEQ
                (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
                      ('T
                       (SEQ (LETT |oe| (QVELT (QVELT |xr| 2) 2))
                            (COND
                             ((NULL (SPADCALL |oe| (QREFELT % 22))) (EXIT "")))
                            (LETT |os| (SPADCALL |oe| (QREFELT % 12)))
                            (EXIT
                             (COND
                              ((SPADCALL |os| (QREFELT % 23))
                               (SPADCALL (SPADCALL |os| (QREFELT % 13))
                                         (QREFELT % 17)))
                              ('T ""))))))))) 

(SDEFUN |ICARD;get_params| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG
         ((|s2| (|String|)) (|al| (|List| (|SExpression|))) (|k| (|Integer|))
          (|s1| (|String|)))
         (SEQ
          (COND
           ((EQUAL (QVELT |xr| 1) '|o|)
            (SEQ (LETT |s1| (|form2LispString| (QVELT (QVELT |xr| 2) 2)))
                 (LETT |k| (SPADCALL (|STR_to_CHAR| "(") |s1| (QREFELT % 26)))
                 (EXIT
                  (COND ((< |k| 1) "")
                        (#1='T
                         (SPADCALL |s1| (SPADCALL |k| (QREFELT % 28))
                                   (QREFELT % 29)))))))
           (#1#
            (SEQ
             (LETT |al|
                   (CDR (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 11))))
             (EXIT
              (COND ((NULL |al|) "")
                    (#1#
                     (SEQ
                      (LETT |s2|
                            (|form2LispString|
                             (CONS (SPADCALL '|f| (QREFELT % 9)) |al|)))
                      (EXIT
                       (SPADCALL |s2| (SPADCALL 2 (QREFELT % 28))
                                 (QREFELT % 29))))))))))))) 

(SDEFUN |ICARD;short_oform| ((|xr| (|Rep|)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL (QVELT |xr| 0) (QREFELT % 31))
               (SPADCALL " : " (QREFELT % 32))
               (SPADCALL (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %)
                         (QREFELT % 32)))
         (QREFELT % 33))) 

(SDEFUN |ICARD;display;%V;11| ((|x| (%)) (% (|Void|)))
        (SPROG ((|xr| (|Rep|)))
               (SEQ (LETT |xr| |x|)
                    (EXIT
                     (SPADCALL (|ICARD;short_oform| |xr| %) (QREFELT % 36)))))) 

(SDEFUN |ICARD;fullDisplay;%V;12| ((|x| (%)) (% (|Void|)))
        (SPROG
         ((|of2| (|OutputForm|)) (|ff| (|OutputForm|)) (|os| (|String|))
          (|ef| (|OutputForm|)) (|cf| (|OutputForm|)) (|cs| (|String|))
          (|of1| (|OutputForm|)) (|xr| (|Rep|)))
         (SEQ (LETT |xr| |x|) (LETT |of1| (|ICARD;short_oform| |xr| %))
              (COND
               ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                (EXIT (SPADCALL |of1| (QREFELT % 36)))))
              (LETT |ef|
                    (COND
                     ((EQUAL (|ICARD;get_exposed| |xr| %) "n")
                      (SPADCALL " (unexposed)" (QREFELT % 32)))
                     (#1='T (SPADCALL (QREFELT % 38)))))
              (LETT |cf|
                    (SEQ (LETT |cs| (|ICARD;get_condition| |xr| %))
                         (EXIT
                          (COND ((EQUAL |cs| "") (SPADCALL (QREFELT % 38)))
                                (#1#
                                 (SPADCALL (SPADCALL " if " (QREFELT % 32))
                                           (SPADCALL |cs| (QREFELT % 32))
                                           (QREFELT % 39)))))))
              (LETT |ef|
                    (COND
                     ((EQUAL (|ICARD;get_exposed| |xr| %) "n")
                      (SPADCALL " (unexposed)" (QREFELT % 32)))
                     (#1# (SPADCALL (QREFELT % 38)))))
              (LETT |os| (|form2LispString| (QVELT (QVELT |xr| 2) 2)))
              (LETT |ff|
                    (SPADCALL (SPADCALL " from " (QREFELT % 32))
                              (SPADCALL |os| (QREFELT % 32)) (QREFELT % 39)))
              (LETT |of2| (SPADCALL (LIST |ff| |cf| |ef|) (QREFELT % 33)))
              (EXIT
               (SPADCALL (SPADCALL |of1| |of2| (QREFELT % 39))
                         (QREFELT % 36)))))) 

(SDEFUN |ICARD;=;2%B;13| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((OR (SPADCALL |x| |y| (QREFELT % 41))
              (SPADCALL |y| |x| (QREFELT % 41)))
          NIL)
         ('T 'T))) 

(SDEFUN |ICARD;<;2%B;14| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G96 NIL) (|yc| #2=(|String|)) (|xc| #2#) (|yp| #3=(|String|))
          (|xp| #3#) (|yo| #4=(|String|)) (|xo| #4#) (|ys| #5=(|String|))
          (|xs| #5#) (|ye| #6=(|String|)) (|xe| #6#) (|ny| #7=(|Integer|))
          (|nx| #7#) (|yr| (|Rep|)) (|xr| (|Rep|)))
         (SEQ
          (EXIT
           (SEQ (LETT |xr| |x|) (LETT |yr| |y|)
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) (QVELT |yr| 1)))
                  (EXIT
                   (SPADCALL (QVELT |xr| 1) (QVELT |yr| 1) (QREFELT % 43)))))
                (COND
                 ((NULL (EQUAL (QVELT |xr| 0) (QVELT |yr| 0)))
                  (EXIT
                   (SPADCALL (QVELT |xr| 0) (QVELT |yr| 0) (QREFELT % 43)))))
                (SEQ
                 (LETT |nx| (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 44)))
                 (LETT |ny| (SPADCALL (QVELT (QVELT |yr| 2) 0) (QREFELT % 44)))
                 (EXIT
                  (COND
                   ((NULL (EQL |nx| |ny|))
                    (PROGN (LETT #1# (< |nx| |ny|)) (GO #8=#:G94))))))
                (SEQ (LETT |xe| (|ICARD;get_exposed| |xr| %))
                     (LETT |ye| (|ICARD;get_exposed| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xe| |ye|))
                        (PROGN (LETT #1# (CGREATERP |ye| |xe|)) (GO #8#))))))
                (SEQ
                 (LETT |xs| (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %))
                 (LETT |ys| (|ICARD;sig_to_string| (QVELT (QVELT |yr| 2) 0) %))
                 (EXIT
                  (COND
                   ((NULL (EQUAL |xs| |ys|))
                    (PROGN (LETT #1# (CGREATERP |ys| |xs|)) (GO #8#))))))
                (SEQ (LETT |xo| (|ICARD;get_origin| |xr| %))
                     (LETT |yo| (|ICARD;get_origin| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xo| |yo|))
                        (PROGN (LETT #1# (CGREATERP |yo| |xo|)) (GO #8#))))))
                (SEQ (LETT |xp| (|ICARD;get_params| |xr| %))
                     (LETT |yp| (|ICARD;get_params| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xp| |yp|))
                        (PROGN (LETT #1# (CGREATERP |yp| |xp|)) (GO #8#))))))
                (SEQ (LETT |xc| (|ICARD;get_condition| |xr| %))
                     (LETT |yc| (|ICARD;get_condition| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xc| |yc|))
                        (PROGN (LETT #1# (CGREATERP |yc| |xc|)) (GO #8#))))))
                (EXIT
                 (CGREATERP (QVELT (QVELT |yr| 2) 3)
                            (QVELT (QVELT |xr| 2) 3)))))
          #8# (EXIT #1#)))) 

(SDEFUN |ICARD;coerce;%Of;15| ((|x| (%)) (% (|OutputForm|)))
        (|coerceRe2E| |x|
                      (ELT
                       (|Record| (|:| |name| (|Symbol|))
                                 (|:| |kind| (|Symbol|))
                                 (|:| |sd|
                                      (|Record|
                                       (|:| |signature| (|SExpression|))
                                       (|:| |condition| (|SExpression|))
                                       (|:| |origin| (|SExpression|))
                                       (|:| |documentation| (|String|)))))
                       0))) 

(SDEFUN |ICARD;elt;%SS;16| ((|x| (%)) (|s| (|Symbol|)) (% (|String|)))
        (SPROG ((#1=#:G111 NIL) (|xr| (|Rep|)))
               (SEQ (LETT |xr| |x|)
                    (EXIT
                     (COND
                      ((EQUAL |s| '|abbreviation|)
                       (|ICARD;get_abbreviation| |xr| %))
                      ((EQUAL |s| '|condition|) (|ICARD;get_condition| |xr| %))
                      ((EQUAL |s| '|exposed|) (|ICARD;get_exposed| |xr| %))
                      ((EQUAL |s| '|doc|) (QVELT (QVELT |xr| 2) 3))
                      ((EQUAL |s| '|kind|) (|ICARD;get_kind| |xr| %))
                      ((EQUAL |s| '|name|)
                       (SPADCALL (QVELT |xr| 0) (QREFELT % 17)))
                      ((EQUAL |s| '|nargs|)
                       (STRINGIMAGE
                        (- (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 44))
                           1)))
                      ((EQUAL |s| '|origin|) (|ICARD;get_origin| |xr| %))
                      ((EQUAL |s| '|params|) (|ICARD;get_params| |xr| %))
                      ('T
                       (SEQ
                        (EXIT
                         (COND
                          ((EQUAL |s| '|type|)
                           (PROGN
                            (LETT #1#
                                  (|ICARD;sig_to_string|
                                   (QVELT (QVELT |xr| 2) 0) %))
                            (GO #2=#:G100)))))
                        #2# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |IndexCard;|)) 

(DEFUN |IndexCard;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IndexCard|))
          (LETT % (GETREFV 47))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IndexCard| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                              (|:| |sd|
                                   (|Record| (|:| |signature| (|SExpression|))
                                             (|:| |condition| (|SExpression|))
                                             (|:| |origin| (|SExpression|))
                                             (|:| |documentation|
                                                  (|String|))))))
          %))) 

(DEFUN |IndexCard| ()
  (SPROG NIL
         (PROG (#1=#:G113)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|IndexCard|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|IndexCard|
                             (LIST (CONS NIL (CONS 1 (|IndexCard;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|IndexCard|)))))))))) 

(MAKEPROP '|IndexCard| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Symbol|) (|SExpression|)
              (0 . |convert|) (|List| %) (5 . |destruct|) (10 . |car|)
              (15 . |symbol|) (|Boolean|) (20 . |null?|) (|String|)
              (25 . |string|) (30 . =) (|BrowserInformation|)
              (36 . |exposed_constructor?|) (41 . |constructor_kind|)
              (46 . |list?|) (51 . |symbol?|) (|Integer|) (|Character|)
              (56 . |position|) (|UniversalSegment| 24) (62 . SEGMENT)
              (67 . |elt|) (|OutputForm|) (73 . |coerce|) (78 . |message|)
              (83 . |hconcat|) (|Void|) (|OutputPackage|) (88 . |output|)
              |ICARD;display;%V;11| (93 . |empty|) (97 . |hconcat|)
              |ICARD;fullDisplay;%V;12| |ICARD;<;2%B;14| |ICARD;=;2%B;13|
              (103 . <) (109 . |#|) |ICARD;coerce;%Of;15| |ICARD;elt;%SS;16|)
           '#(~= 114 |smaller?| 120 |min| 126 |max| 132 |latex| 138
              |fullDisplay| 143 |elt| 148 |display| 154 |coerce| 159 >= 164 >
              170 = 176 <= 182 < 188)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|) (|SetCategory|)
                      (|CoercibleTo| 30) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 46
                                       '(1 8 0 7 9 1 8 10 0 11 1 8 0 0 12 1 8 7
                                         0 13 1 8 14 0 15 1 7 16 0 17 2 8 14 0
                                         0 18 1 19 14 7 20 1 19 7 7 21 1 8 14 0
                                         22 1 8 14 0 23 2 16 24 25 0 26 1 27 0
                                         24 28 2 16 0 0 27 29 1 7 30 0 31 1 30
                                         0 16 32 1 30 0 10 33 1 35 34 30 36 0
                                         30 0 38 2 30 0 0 0 39 2 7 14 0 0 43 1
                                         8 24 0 44 2 0 14 0 0 1 2 0 14 0 0 1 2
                                         0 0 0 0 1 2 0 0 0 0 1 1 0 16 0 1 1 0
                                         34 0 40 2 0 16 0 7 46 1 0 34 0 37 1 0
                                         30 0 45 2 0 14 0 0 1 2 0 14 0 0 1 2 0
                                         14 0 0 42 2 0 14 0 0 1 2 0 14 0 0
                                         41)))))
           '|lookupComplete|)) 
