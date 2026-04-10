
(SDEFUN |OPQUERY;get_constructors|
        ((|cl| (|List| (|Symbol|))) (|ck| (|Symbol|))
         (|acc|
          (|List|
           (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|)))))))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|sd|
           (|Record| (|:| |signature| (|SExpression|))
                     (|:| |condition| (|SExpression|))
                     (|:| |origin| (|SExpression|))
                     (|:| |documentation| (|String|))))
          (|doc| (|String|)) (|cs| (|SExpression|)) (|cf| (|SExpression|))
          (#1=#:G7 NIL) (|c| NIL))
         (SEQ
          (SEQ (LETT |c| NIL) (LETT #1# |cl|) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |c| (CAR #1#)) NIL)) (GO G191)))
               (SEQ (LETT |cf| (SPADCALL |c| (QREFELT % 9)))
                    (LETT |cs|
                          (SPADCALL |c| (CDR (SPADCALL |cf| (QREFELT % 11)))
                                    (QREFELT % 13)))
                    (LETT |doc| (SPADCALL |c| (QREFELT % 15)))
                    (LETT |sd|
                          (VECTOR |cs| (SPADCALL NIL (QREFELT % 16))
                                  (SPADCALL |cf| (QREFELT % 17)) |doc|))
                    (EXIT (LETT |acc| (CONS (VECTOR |c| |ck| |sd|) |acc|))))
               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
          (EXIT |acc|)))) 

(SDEFUN |OPQUERY;getDatabase1|
        ((|s| (|String|))
         (%
          (|List|
           (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                     (|:| |sd|
                          (|Record| (|:| |signature| (|SExpression|))
                                    (|:| |condition| (|SExpression|))
                                    (|:| |origin| (|SExpression|))
                                    (|:| |documentation| (|String|))))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |name| (|Symbol|)) (|:| |kind| (|Symbol|))
                      (|:| |sd|
                           (|Record| (|:| |signature| (|SExpression|))
                                     (|:| |condition| (|SExpression|))
                                     (|:| |origin| (|SExpression|))
                                     (|:| |documentation| (|String|)))))))
          (|cr|
           (|Record| (|:| |categories| (|List| (|Symbol|)))
                     (|:| |domains| (|List| (|Symbol|)))
                     (|:| |packages| (|List| (|Symbol|)))))
          (#1=#:G35 NIL) (|sd| NIL) (|name| #2=(|Symbol|)) (#3=#:G34 NIL)
          (|opr| NIL)
          (|opl|
           (|List|
            (|Record| (|:| |name| #2#)
                      (|:| |sdl|
                           (|List|
                            (|Record| (|:| |signature| (|SExpression|))
                                      (|:| |condition| (|SExpression|))
                                      (|:| |origin| (|SExpression|))
                                      (|:| |documentation| (|String|)))))))))
         (SEQ (LETT |res| NIL)
              (EXIT
               (COND
                ((EQUAL |s| "o")
                 (SEQ (LETT |opl| (SPADCALL (QREFELT % 21)))
                      (SEQ (LETT |opr| NIL) (LETT #3# |opl|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |opr| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ (LETT |name| (QCAR |opr|))
                                (EXIT
                                 (SEQ (LETT |sd| NIL) (LETT #1# (QCDR |opr|))
                                      G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |sd| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |res|
                                              (CONS (VECTOR |name| '|o| |sd|)
                                                    |res|))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT NIL))))
                           (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                      (EXIT (NREVERSE |res|))))
                (#4='T
                 (SEQ (LETT |cr| (SPADCALL (QREFELT % 23)))
                      (EXIT
                       (COND
                        ((EQUAL |s| "k")
                         (SEQ
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 0) '|c|
                                 |res| %))
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 1) '|d|
                                 |res| %))
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 2) '|p|
                                 |res| %))
                          (EXIT (NREVERSE |res|))))
                        ((EQUAL |s| "c")
                         (SEQ
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 0) '|c|
                                 |res| %))
                          (EXIT (NREVERSE |res|))))
                        ((EQUAL |s| "d")
                         (SEQ
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 1) '|d|
                                 |res| %))
                          (EXIT (NREVERSE |res|))))
                        ((EQUAL |s| "p")
                         (SEQ
                          (LETT |res|
                                (|OPQUERY;get_constructors| (QVELT |cr| 2) '|p|
                                 |res| %))
                          (EXIT (NREVERSE |res|))))
                        (#4# (|error| "getDatabase: wrong argument"))))))))))) 

(SDEFUN |OPQUERY;getDatabase;SD;3|
        ((|s| (|String|)) (% (|Database| (|IndexCard|))))
        (SPROG ((|db1| (|List| (|IndexCard|))))
               (SEQ (LETT |db1| (|OPQUERY;getDatabase1| |s| %))
                    (EXIT (SPADCALL |db1| (QREFELT % 25)))))) 

(DECLAIM (NOTINLINE |OperationsQuery;|)) 

(DEFUN |OperationsQuery;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OperationsQuery|))
          (LETT % (GETREFV 28))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OperationsQuery| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |OperationsQuery| ()
  (SPROG NIL
         (PROG (#1=#:G39)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OperationsQuery|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OperationsQuery|
                             (LIST (CONS NIL (CONS 1 (|OperationsQuery;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OperationsQuery|)))))))))) 

(MAKEPROP '|OperationsQuery| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|SExpression|) (|Symbol|)
              (|BrowserInformation|) (0 . |constructor_form|) (|List| %)
              (5 . |destruct|) (|List| 6) (10 . |constructor_signature|)
              (|String|) (16 . |constructor_documentation|) (21 . |convert|)
              (26 . |cdr|)
              (|Record| (|:| |signature| 6) (|:| |condition| 6)
                        (|:| |origin| 6) (|:| |documentation| 14))
              (|Record| (|:| |name| 7) (|:| |sdl| (|List| 18))) (|List| 19)
              (31 . |ops_from_exports|)
              (|Record| (|:| |categories| (|List| 7))
                        (|:| |domains| (|List| 7)) (|:| |packages| (|List| 7)))
              (35 . |all_constructors|) (|List| (|IndexCard|)) (39 . |sort!|)
              (|Database| (|IndexCard|)) |OPQUERY;getDatabase;SD;3|)
           '#(|getDatabase| 44) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|getDatabase|
                                 ((|Database| (|IndexCard|)) (|String|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 27
                                            '(1 8 6 7 9 1 6 10 0 11 2 8 6 7 12
                                              13 1 8 14 7 15 1 6 0 10 16 1 6 0
                                              0 17 0 8 20 21 0 8 22 23 1 24 0 0
                                              25 1 0 26 14 27)))))
           '|lookupComplete|)) 
