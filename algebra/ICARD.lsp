
(SDEFUN |ICARD;sig_to_string| ((|sig| (|SExpression|)) (% (|String|)))
        (SPROG ((|sl| (|List| (|SExpression|))))
               (SEQ
                (LETT |sl|
                      (CONS (SPADCALL '|Mapping| (QREFELT % 9))
                            (SPADCALL |sig| (QREFELT % 11))))
                (EXIT
                 (SPADCALL (SPADCALL |sl| (QREFELT % 12)) (QREFELT % 15)))))) 

(SDEFUN |ICARD;get_origin_op| ((|xr| (|Rep|)) (% (|Symbol|)))
        (SPADCALL (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 16))
                  (QREFELT % 17))) 

(SDEFUN |ICARD;get_abbreviation| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|abbr| (|SExpression|)))
               (SEQ
                (COND ((EQUAL (QVELT |xr| 1) '|o|) "")
                      ('T
                       (SEQ
                        (LETT |abbr|
                              (|get_database| (QVELT |xr| 0) 'ABBREVIATION))
                        (COND
                         ((NULL (SPADCALL |abbr| (QREFELT % 19)))
                          (EXIT
                           (SPADCALL (SPADCALL |abbr| (QREFELT % 17))
                                     (QREFELT % 20)))))
                        (EXIT ""))))))) 

(SDEFUN |ICARD;get_condition| ((|xr| (|Rep|)) (% (|String|)))
        (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
              ('T
               (COND ((SPADCALL (QVELT (QVELT |xr| 2) 1) 'T (QREFELT % 21)) "")
                     ('T (SPADCALL (QVELT (QVELT |xr| 2) 1) (QREFELT % 22))))))) 

(SDEFUN |ICARD;get_exposed1| ((|c| (|Symbol|)) (% (|String|)))
        (COND ((SPADCALL |c| (QREFELT % 24)) "x") ('T "n"))) 

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
                  (SPADCALL (QVELT |xr| 1) (QREFELT % 20)))
                 ('T
                  (SEQ
                   (LETT |o_kind|
                         (SPADCALL (|ICARD;get_origin_op| |xr| %)
                                   (QREFELT % 25)))
                   (EXIT
                    (COND ((EQUAL |o_kind| '|category|) "c")
                          ((EQUAL |o_kind| '|domain|) "d")
                          ((EQUAL |o_kind| '|package|) "p")
                          ('T (|error| "get_kind: impossible")))))))))) 

(SDEFUN |ICARD;get_origin| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|oe| (|SExpression|)) (|os| (|SExpression|)))
               (SEQ
                (COND ((NULL (EQUAL (QVELT |xr| 1) '|o|)) "")
                      ('T
                       (SEQ (LETT |oe| (QVELT (QVELT |xr| 2) 2))
                            (COND
                             ((NULL (SPADCALL |oe| (QREFELT % 26))) (EXIT "")))
                            (LETT |os| (SPADCALL |oe| (QREFELT % 16)))
                            (EXIT
                             (COND
                              ((SPADCALL |os| (QREFELT % 27))
                               (SPADCALL (SPADCALL |os| (QREFELT % 17))
                                         (QREFELT % 20)))
                              ('T ""))))))))) 

(SDEFUN |ICARD;convert_params|
        ((|params| (|List| (|SExpression|))) (% (|String|)))
        (SPROG
         ((|a1| NIL) (#1=#:G73 NIL) (|first| (|Boolean|))
          (|rl| (|List| (|String|))))
         (SEQ
          (COND ((NULL |params|) "")
                ('T
                 (SEQ (LETT |rl| (LIST "(")) (LETT |first| 'T)
                      (SEQ (LETT |a1| NIL) (LETT #1# |params|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |a1| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (COND
                             ((NULL |first|) (LETT |rl| (CONS ", " |rl|))))
                            (LETT |first| NIL)
                            (EXIT
                             (LETT |rl|
                                   (CONS
                                    (SPADCALL (SPADCALL |a1| (QREFELT % 17))
                                              (QREFELT % 20))
                                    |rl|))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |rl| (CONS ")" |rl|))
                      (EXIT (SPADCALL (NREVERSE |rl|) (QREFELT % 28))))))))) 

(SDEFUN |ICARD;get_params| ((|xr| (|Rep|)) (% (|String|)))
        (SPROG ((|op| (|Symbol|)) (|cf| (|SExpression|)))
               (SEQ
                (COND
                 ((NULL (EQUAL (QVELT |xr| 1) '|o|))
                  (COND
                   ((OR (EQUAL (QVELT |xr| 0) '|Union|)
                        (EQUAL (QVELT |xr| 0) '|Record|))
                    "(a : A, b : B)")
                   (#1='T
                    (|ICARD;convert_params|
                     (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 11)) %))))
                 (#1#
                  (SEQ
                   (LETT |op|
                         (SPADCALL
                          (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 16))
                          (QREFELT % 17)))
                   (LETT |cf| (SPADCALL |op| (QREFELT % 29)))
                   (EXIT
                    (|ICARD;convert_params|
                     (CDR (SPADCALL |cf| (QREFELT % 11))) %)))))))) 

(SDEFUN |ICARD;short_oform| ((|xr| (|Rep|)) (% (|OutputForm|)))
        (SPADCALL
         (LIST (SPADCALL (QVELT |xr| 0) (QREFELT % 31))
               (SPADCALL " : " (QREFELT % 32))
               (SPADCALL (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %)
                         (QREFELT % 32)))
         (QREFELT % 33))) 

(SDEFUN |ICARD;display;%V;12| ((|x| (%)) (% (|Void|)))
        (SPROG ((|xr| (|Rep|)))
               (SEQ (LETT |xr| |x|)
                    (EXIT
                     (SPADCALL (|ICARD;short_oform| |xr| %) (QREFELT % 36)))))) 

(SDEFUN |ICARD;fullDisplay;%V;13| ((|x| (%)) (% (|Void|)))
        (SPROG
         ((|xr| (|Rep|)) (|of1| (|OutputForm|)) (|cs| (|String|))
          (|cf| (|OutputForm|)) (|ef| (|OutputForm|)) (|os| (|String|))
          (|ff| (|OutputForm|)) (|of2| (|OutputForm|)))
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
              (LETT |os| (SPADCALL (QVELT (QVELT |xr| 2) 2) (QREFELT % 15)))
              (LETT |ff|
                    (SPADCALL (SPADCALL " from " (QREFELT % 32))
                              (SPADCALL |os| (QREFELT % 32)) (QREFELT % 39)))
              (LETT |of2| (SPADCALL (LIST |ff| |cf| |ef|) (QREFELT % 33)))
              (EXIT
               (SPADCALL (SPADCALL |of1| |of2| (QREFELT % 39))
                         (QREFELT % 36)))))) 

(SDEFUN |ICARD;=;2%B;14| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((OR (SPADCALL |x| |y| (QREFELT % 41))
              (SPADCALL |y| |x| (QREFELT % 41)))
          NIL)
         ('T 'T))) 

(SDEFUN |ICARD;<;2%B;15| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG
         ((|xr| (|Rep|)) (|yr| (|Rep|)) (|nx| #1=(|Integer|)) (|ny| #1#)
          (|xe| #2=(|String|)) (|ye| #2#) (|xs| #3=(|String|)) (|ys| #3#)
          (|xo| #4=(|String|)) (|yo| #4#) (|xp| #5=(|String|)) (|yp| #5#)
          (|xc| #6=(|String|)) (|yc| #6#) (#7=#:G107 NIL))
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
                 (LETT |nx| (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 45)))
                 (LETT |ny| (SPADCALL (QVELT (QVELT |yr| 2) 0) (QREFELT % 45)))
                 (EXIT
                  (COND
                   ((NULL (EQL |nx| |ny|))
                    (PROGN (LETT #7# (< |nx| |ny|)) (GO #8=#:G105))))))
                (SEQ (LETT |xe| (|ICARD;get_exposed| |xr| %))
                     (LETT |ye| (|ICARD;get_exposed| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xe| |ye|))
                        (PROGN (LETT #7# (CGREATERP |ye| |xe|)) (GO #8#))))))
                (SEQ
                 (LETT |xs| (|ICARD;sig_to_string| (QVELT (QVELT |xr| 2) 0) %))
                 (LETT |ys| (|ICARD;sig_to_string| (QVELT (QVELT |yr| 2) 0) %))
                 (EXIT
                  (COND
                   ((NULL (EQUAL |xs| |ys|))
                    (PROGN (LETT #7# (CGREATERP |ys| |xs|)) (GO #8#))))))
                (SEQ (LETT |xo| (|ICARD;get_origin| |xr| %))
                     (LETT |yo| (|ICARD;get_origin| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xo| |yo|))
                        (PROGN (LETT #7# (CGREATERP |yo| |xo|)) (GO #8#))))))
                (SEQ (LETT |xp| (|ICARD;get_params| |xr| %))
                     (LETT |yp| (|ICARD;get_params| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xp| |yp|))
                        (PROGN (LETT #7# (CGREATERP |yp| |xp|)) (GO #8#))))))
                (SEQ (LETT |xc| (|ICARD;get_condition| |xr| %))
                     (LETT |yc| (|ICARD;get_condition| |yr| %))
                     (EXIT
                      (COND
                       ((NULL (EQUAL |xc| |yc|))
                        (PROGN (LETT #7# (CGREATERP |yc| |xc|)) (GO #8#))))))
                (EXIT
                 (CGREATERP (QVELT (QVELT |yr| 2) 3)
                            (QVELT (QVELT |xr| 2) 3)))))
          #8# (EXIT #7#)))) 

(SDEFUN |ICARD;coerce;%Of;16| ((|x| (%)) (% (|OutputForm|)))
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

(SDEFUN |ICARD;elt;%SS;17| ((|x| (%)) (|s| (|Symbol|)) (% (|String|)))
        (SPROG ((|xr| (|Rep|)) (#1=#:G122 NIL))
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
                       (SPADCALL (QVELT |xr| 0) (QREFELT % 20)))
                      ((EQUAL |s| '|nargs|)
                       (STRINGIMAGE
                        (- (SPADCALL (QVELT (QVELT |xr| 2) 0) (QREFELT % 45))
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
                            (GO #2=#:G111)))))
                        #2# (EXIT #1#)))))))) 

(DECLAIM (NOTINLINE |IndexCard;|)) 

(DEFUN |IndexCard;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|IndexCard|))
          (LETT % (GETREFV 48))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IndexCard| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
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
         (PROG (#1=#:G124)
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
              (0 . |convert|) (|List| %) (5 . |destruct|) (10 . |convert|)
              (|String|) (|HyperdocUtilities|) (15 . |constructor_to_string|)
              (20 . |car|) (25 . |symbol|) (|Boolean|) (30 . |null?|)
              (35 . |string|) (40 . =) (46 . |condition_to_string|)
              (|BrowserInformation|) (51 . |exposed_constructor?|)
              (56 . |constructor_kind|) (61 . |list?|) (66 . |symbol?|)
              (71 . |concat|) (76 . |constructor_form|) (|OutputForm|)
              (81 . |coerce|) (86 . |message|) (91 . |hconcat|) (|Void|)
              (|OutputPackage|) (96 . |output|) |ICARD;display;%V;12|
              (101 . |empty|) (105 . |hconcat|) |ICARD;fullDisplay;%V;13|
              |ICARD;<;2%B;15| |ICARD;=;2%B;14| (111 . <) (|Integer|)
              (117 . |#|) |ICARD;coerce;%Of;16| |ICARD;elt;%SS;17|)
           '#(~= 122 |smaller?| 128 |sign| 134 |positive?| 139 |negative?| 144
              |min| 149 |max| 155 |latex| 161 |fullDisplay| 166 |elt| 171
              |display| 177 |coerce| 182 >= 187 > 193 = 199 <= 205 < 211)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|CoercibleTo| 30) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 47
                                       '(1 8 0 7 9 1 8 10 0 11 1 8 0 10 12 1 14
                                         13 8 15 1 8 0 0 16 1 8 7 0 17 1 8 18 0
                                         19 1 7 13 0 20 2 8 18 0 0 21 1 14 13 8
                                         22 1 23 18 7 24 1 23 7 7 25 1 8 18 0
                                         26 1 8 18 0 27 1 13 0 10 28 1 23 8 7
                                         29 1 7 30 0 31 1 30 0 13 32 1 30 0 10
                                         33 1 35 34 30 36 0 30 0 38 2 30 0 0 0
                                         39 2 7 18 0 0 43 1 8 44 0 45 2 0 18 0
                                         0 1 2 0 18 0 0 1 1 1 44 0 1 1 1 18 0 1
                                         1 1 18 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                         13 0 1 1 0 34 0 40 2 0 13 0 7 47 1 0
                                         34 0 37 1 0 30 0 46 2 0 18 0 0 1 2 0
                                         18 0 0 1 2 0 18 0 0 42 2 0 18 0 0 1 2
                                         0 18 0 0 41)))))
           '|lookupComplete|)) 
