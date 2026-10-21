
(SDEFUN |COMPCODE;genCatHeader|
        ((|shortName| (|String|)) (|longName| (|String|))
         (% (|List| (|String|))))
        (LIST
         (SPADCALL (LIST ")abbrev category " |shortName| " " |longName|)
                   (QREFELT % 8))
         ""
         (SPADCALL (LIST |longName| "() : Category == Type with")
                   (QREFELT % 8))
         "" "")) 

(SDEFUN |COMPCODE;genFuncDeclar|
        ((|content| (|ILogic|)) (|numb| (|NonNegativeInteger|))
         (% (|List| (|String|))))
        (SPROG
         ((|fac| (|List| (|ILogic|))) (#1=#:G17 NIL)
          (|deduct| (|List| (|ILogic|))) (|resType| (|ILogic|))
          (|thisTerm| NIL) (#2=#:G18 NIL) (|notfst| (|Boolean|))
          (|resStr| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |fac| (SPADCALL |content| (QREFELT % 10)))
                (COND
                 ((NULL |fac|)
                  (PROGN
                   (LETT #1#
                         (LIST
                          (SPADCALL
                           (LIST "  -- error"
                                 (SPADCALL |content| (QREFELT % 11)))
                           (QREFELT % 8))))
                   (GO #3=#:G16))))
                (LETT |deduct| (SPADCALL |fac| (QREFELT % 12)))
                (COND ((NULL |deduct|) (LETT |deduct| |fac|)))
                (LETT |resType| (|SPADfirst| |deduct|))
                (LETT |resStr|
                      (SPADCALL (LIST "  fn" (STRINGIMAGE |numb|) ":(")
                                (QREFELT % 8)))
                (LETT |notfst| 'NIL)
                (SEQ (LETT |thisTerm| NIL) (LETT #2# |fac|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |thisTerm| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND (|notfst| (LETT |resStr| (STRCONC |resStr| ","))))
                      (LETT |resStr|
                            (STRCONC |resStr|
                                     (SPADCALL |thisTerm| (QREFELT % 13))))
                      (EXIT (LETT |notfst| 'T)))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (LETT |resStr|
                      (SPADCALL
                       (LIST |resStr| ") -> "
                             (SPADCALL |resType| (QREFELT % 13)))
                       (QREFELT % 8)))
                (EXIT (LIST |resStr|))))
          #3# (EXIT #1#)))) 

(MAKEPROP '|COMPCODE;genCatFooter| '|SPADreplace| '(XLAM NIL (LIST "" "@"))) 

(SDEFUN |COMPCODE;genCatFooter| ((% (|List| (|String|)))) (LIST "" "@")) 

(SDEFUN |COMPCODE;genPackageHeader|
        ((|shortName| (|String|)) (|longName| (|String|))
         (|catName| (|String|)) (% (|List| (|String|))))
        (LIST
         (SPADCALL (LIST ")abbrev package " |shortName| " " |longName|)
                   (QREFELT % 8))
         ""
         (SPADCALL (LIST |longName| "(): Exports == Implementation where")
                   (QREFELT % 8))
         "" (SPADCALL (LIST " Exports ==> " |catName| " with") (QREFELT % 8))
         "" " Implementation ==> add" "")) 

(SDEFUN |COMPCODE;genLambdaTerm|
        ((|n| (|Lambda| (|Typed|))) (|boundL| (|List| (|String|)))
         (% (|String|)))
        (SPROG
         ((|i| (|NonNegativeInteger|)) (#1=#:G33 NIL) (|varName| (|String|))
          (|boundL2| (|List| (|String|))) (|ch| (|List| (|Lambda| (|Typed|))))
          (|s| (|String|)))
         (SEQ
          (EXIT
           (SEQ (LETT |s| "")
                (COND
                 ((SPADCALL |n| (QREFELT % 16))
                  (SEQ (LETT |i| (+ (SPADCALL |n| (QREFELT % 18)) 1))
                       (COND
                        ((> |i| 0)
                         (COND
                          ((<= |i| (LENGTH |boundL|))
                           (PROGN
                            (LETT #1# (SPADCALL |boundL| |i| (QREFELT % 21)))
                            (GO #2=#:G32))))))
                       (EXIT (LETT |s| (STRINGIMAGE (- |i| 1)))))))
                (COND
                 ((SPADCALL |n| (QREFELT % 22))
                  (LETT |s|
                        (SPADCALL (SPADCALL |n| (QREFELT % 24))
                                  (QREFELT % 25)))))
                (COND
                 ((SPADCALL |n| (QREFELT % 26))
                  (SEQ (LETT |ch| (SPADCALL |n| (QREFELT % 27)))
                       (EXIT
                        (LETT |s|
                              (SPADCALL
                               (LIST " "
                                     (|COMPCODE;genLambdaTerm|
                                      (|SPADfirst| |ch|) |boundL| %)
                                     "("
                                     (|COMPCODE;genLambdaTerm|
                                      (SPADCALL |ch| (QREFELT % 29)) |boundL|
                                      %)
                                     ")")
                               (QREFELT % 8)))))))
                (COND
                 ((SPADCALL |n| (QREFELT % 30))
                  (SEQ
                   (LETT |varName|
                         (SPADCALL (SPADCALL |n| (QREFELT % 24))
                                   (QREFELT % 25)))
                   (SEQ G190
                        (COND
                         ((NULL (SPADCALL |varName| |boundL| (QREFELT % 31)))
                          (GO G191)))
                        (SEQ (EXIT (LETT |varName| (STRCONC |varName| "'"))))
                        NIL (GO G190) G191 (EXIT NIL))
                   (LETT |boundL2|
                         (SPADCALL |boundL| |varName| (QREFELT % 32)))
                   (LETT |ch| (SPADCALL |n| (QREFELT % 27)))
                   (EXIT
                    (LETT |s|
                          (SPADCALL
                           (LIST " " |varName| "+->("
                                 (|COMPCODE;genLambdaTerm| (|SPADfirst| |ch|)
                                  |boundL2| %)
                                 ")")
                           (QREFELT % 8)))))))
                (EXIT |s|)))
          #2# (EXIT #1#)))) 

(SDEFUN |COMPCODE;genFuncDefn|
        ((|content| (|Lambda| (|Typed|))) (|numb| (|NonNegativeInteger|))
         (% (|List| (|String|))))
        (SPROG
         ((|sl| (|List| (|String|))) (|var| (|Typed|)) (|lhs| (|String|))
          (|lhsn| (|String|)) (|lhst| (|String|)) (#1=#:G38 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |sl| (LIST ""))
                (COND
                 ((SPADCALL |content| (QREFELT % 30))
                  (SEQ (LETT |var| (SPADCALL |content| (QREFELT % 24)))
                       (LETT |lhs| (SPADCALL |var| (QREFELT % 33)))
                       (LETT |lhsn| (SPADCALL |var| (QREFELT % 25)))
                       (LETT |lhst|
                             (SPADCALL (SPADCALL |var| (QREFELT % 34))
                                       (QREFELT % 13)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (LIST
                                (SPADCALL
                                 (LIST "  fn" (STRINGIMAGE |numb|) "(" |lhs|
                                       "):" |lhst| " == "
                                       (|COMPCODE;genLambdaTerm|
                                        (|SPADfirst|
                                         (SPADCALL |content| (QREFELT % 27)))
                                        (LIST |lhsn|) %))
                                 (QREFELT % 8))))
                         (GO #2=#:G37))))))
                (EXIT |sl|)))
          #2# (EXIT #1#)))) 

(MAKEPROP '|COMPCODE;genPackageFooter| '|SPADreplace| '(XLAM NIL (LIST "" "@"))) 

(SDEFUN |COMPCODE;genPackageFooter| ((% (|List| (|String|)))) (LIST "" "@")) 

(SDEFUN |COMPCODE;writeCategory;L3SV;8|
        ((|content| (|List| (|ILogic|))) (|filename| (|String|))
         (|shortName| (|String|)) (|longName| (|String|)) (% (|Void|)))
        (SPROG
         ((|f1| (|TextFile|)) (|thisEq| NIL) (#1=#:G47 NIL)
          (|fnNum| (|NonNegativeInteger|)) (|lines| (|List| (|String|)))
          (|line| NIL) (#2=#:G48 NIL))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT % 36)) "output"
                          (QREFELT % 38)))
          (LETT |lines| (|COMPCODE;genCatHeader| |shortName| |longName| %))
          (LETT |fnNum| 1)
          (SEQ (LETT |thisEq| NIL) (LETT #1# |content|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |thisEq| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lines|
                      (SPADCALL |lines|
                                (|COMPCODE;genFuncDeclar| |thisEq| |fnNum| %)
                                (QREFELT % 39)))
                (EXIT (LETT |fnNum| (+ |fnNum| 1))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (LETT |lines|
                (SPADCALL |lines| (|COMPCODE;genCatFooter| %) (QREFELT % 39)))
          (SEQ (LETT |line| NIL) (LETT #2# |lines|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |f1| |line| (QREFELT % 40))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT % 41)))))) 

(SDEFUN |COMPCODE;writePackage;L4SV;9|
        ((|content| (|List| (|Lambda| (|Typed|)))) (|filename| (|String|))
         (|shortName| (|String|)) (|longName| (|String|))
         (|catName| (|String|)) (% (|Void|)))
        (SPROG
         ((|f1| (|TextFile|)) (|thisEq| NIL) (#1=#:G56 NIL)
          (|fnNum| (|NonNegativeInteger|)) (|lines| (|List| (|String|)))
          (|line| NIL) (#2=#:G57 NIL))
         (SEQ
          (LETT |f1|
                (SPADCALL (SPADCALL |filename| (QREFELT % 36)) "output"
                          (QREFELT % 38)))
          (LETT |lines|
                (|COMPCODE;genPackageHeader| |shortName| |longName| |catName|
                 %))
          (LETT |fnNum| 1)
          (SEQ (LETT |thisEq| NIL) (LETT #1# |content|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |thisEq| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (LETT |lines|
                      (SPADCALL |lines|
                                (|COMPCODE;genFuncDefn| |thisEq| |fnNum| %)
                                (QREFELT % 39)))
                (EXIT (LETT |fnNum| (+ |fnNum| 1))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (LETT |lines|
                (SPADCALL |lines| (|COMPCODE;genPackageFooter| %)
                          (QREFELT % 39)))
          (SEQ (LETT |line| NIL) (LETT #2# |lines|) G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |line| (CAR #2#)) NIL))
                 (GO G191)))
               (SEQ (EXIT (SPADCALL |f1| |line| (QREFELT % 40))))
               (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |f1| (QREFELT % 41)))))) 

(DECLAIM (NOTINLINE |compCode;|)) 

(DEFUN |compCode;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|compCode|))
          (LETT % (GETREFV 46))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|compCode| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |compCode| ()
  (SPROG NIL
         (PROG (#1=#:G59)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|compCode|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|compCode|
                             (LIST (CONS NIL (CONS 1 (|compCode;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|compCode|)))))))))) 

(MAKEPROP '|compCode| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|List| %) (|String|) (0 . |concat|)
              (|ILogic|) (5 . |factor|) (10 . |toString|) (15 . |deductions|)
              (20 . |toStringUnwrapped|) (|Boolean|) (|Lambda| 23)
              (25 . |isBoundNode?|) (|NonNegativeInteger|)
              (30 . |getBoundValue|) (|Integer|) (|List| 7) (35 . |elt|)
              (41 . |isFreeNode?|) (|Typed|) (46 . |getVariable|)
              (51 . |getName|) (56 . |isCompound?|) (61 . |getChildren|)
              (|List| 15) (66 . |second|) (71 . |isLambda?|) (76 . |member?|)
              (82 . |concat|) (88 . |toString|) (93 . |getType|) (|FileName|)
              (98 . |coerce|) (|TextFile|) (103 . |open|) (109 . |concat|)
              (115 . |writeLine!|) (121 . |close!|) (|Void|) (|List| 9)
              |COMPCODE;writeCategory;L3SV;8| |COMPCODE;writePackage;L4SV;9|)
           '#(|writePackage| 126 |writeCategory| 135) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|writeCategory|
                                 ((|Void|) (|List| (|ILogic|)) (|String|)
                                  (|String|) (|String|)))
                                T)
                              '((|writePackage|
                                 ((|Void|) (|List| (|Lambda| (|Typed|)))
                                  (|String|) (|String|) (|String|) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 45
                                            '(1 7 0 6 8 1 9 6 0 10 1 9 7 0 11 1
                                              9 6 6 12 1 9 7 0 13 1 15 14 0 16
                                              1 15 17 0 18 2 20 7 0 19 21 1 15
                                              14 0 22 1 15 23 0 24 1 23 7 0 25
                                              1 15 14 0 26 1 15 6 0 27 1 28 15
                                              0 29 1 15 14 0 30 2 20 14 7 0 31
                                              2 20 0 0 7 32 1 23 7 0 33 1 23 9
                                              0 34 1 35 0 7 36 2 37 0 35 7 38 2
                                              20 0 0 0 39 2 37 7 0 7 40 1 37 0
                                              0 41 5 0 42 28 7 7 7 7 45 4 0 42
                                              43 7 7 7 44)))))
           '|lookupComplete|)) 
