
(SDEFUN |LOOP;loop;L%;1| ((|lis| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|li| #1=(|List| (|NonNegativeInteger|)))
          (|lx| #2=(|List| (|NonNegativeInteger|)))
          (|minValue| (|NonNegativeInteger|)) (|l2| #2#) (|l1| #1#)
          (#3=#:G465 NIL) (|x| NIL) (#4=#:G464 NIL))
         (SEQ
          (LETT |li|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |x| NIL) (LETT #3# |lis|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |x| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #4# (CONS |x| #4#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT
           (COND ((NULL |li|) (|error| "cannot form empty loop"))
                 ('T
                  (SEQ (LETT |minValue| (|SPADfirst| |li|)) (LETT |lx| NIL)
                       (LETT |l1| |li|) (LETT |l2| |lx|)
                       (SEQ G190 (COND ((NULL (NULL (NULL |li|))) (GO G191)))
                            (SEQ
                             (COND
                              ((< (|SPADfirst| |li|) |minValue|)
                               (SEQ (LETT |l1| |li|) (LETT |l2| |lx|)
                                    (EXIT
                                     (LETT |minValue| (|SPADfirst| |li|))))))
                             (LETT |lx| (CONS (|SPADfirst| |li|) |lx|))
                             (EXIT (LETT |li| (CDR |li|))))
                            NIL (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SPADCALL (SPADCALL |l1| (REVERSE |l2|) (QREFELT % 8))
                                  (QREFELT % 9)))))))))) 

(SDEFUN |LOOP;entries;%L;2| ((|lp| (%)) (% (|List| (|NonNegativeInteger|))))
        (SPADCALL |lp| (QREFELT % 11))) 

(PUT '|LOOP;hash| '|SPADreplace| '(XLAM (|s|) 0)) 

(SDEFUN |LOOP;hash| ((|s| (%)) (% (|SingleInteger|))) 0) 

(SDEFUN |LOOP;latex;%S;4| ((|lp| (%)) (% (|String|)))
        (SPROG
         ((|res| (|String|)) (|x| (|NonNegativeInteger|)) (#1=#:G473 NIL)
          (|i| NIL))
         (SEQ (LETT |res| "")
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |lp| (QREFELT % 14))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL (LIST |res| "->" (STRINGIMAGE |x|))
                                         (QREFELT % 17)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (LIST "[" |res| "]") (QREFELT % 17)))))) 

(SDEFUN |LOOP;=;2%B;5| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G480 NIL) (#2=#:G481 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL (SPADCALL |x| (QREFELT % 14))
                              (SPADCALL |y| (QREFELT % 14)) (QREFELT % 20))
                    (PROGN (LETT #1# NIL) (GO #3=#:G479))))
                  (SEQ (LETT |i| 1) (LETT #2# (SPADCALL |x| (QREFELT % 14)))
                       G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1 |x| (- |i| 1))
                                     (QAREF1 |y| (- |i| 1)) (QREFELT % 20))
                           (PROGN (LETT #1# NIL) (GO #3#))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #1#)))) 

(SDEFUN |LOOP;coerce;%Of;6| ((|lp| (%)) (% (|OutputForm|)))
        (SPROG
         ((|res| (|OutputForm|)) (|x| (|NonNegativeInteger|)) (#1=#:G487 NIL)
          (|i| NIL))
         (SEQ (LETT |res| (SPADCALL (QREFELT % 23)))
              (SEQ (LETT |i| 1) (LETT #1# (SPADCALL |lp| (QREFELT % 14))) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |lp| (- |i| 1)))
                        (EXIT
                         (LETT |res|
                               (SPADCALL
                                (LIST |res| (SPADCALL '-> (QREFELT % 25))
                                      (SPADCALL |x| (QREFELT % 26)))
                                (QREFELT % 27)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |res| (QREFELT % 28)))))) 

(DECLAIM (NOTINLINE |Loop;|)) 

(DEFUN |Loop| ()
  (SPROG NIL
         (PROG (#1=#:G489)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Loop|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Loop|
                             (LIST (CONS NIL (CONS 1 (|Loop;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Loop|)))))))))) 

(DEFUN |Loop;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Loop|))
          (LETT % (GETREFV 30))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Loop| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|PrimitiveArray| (|NonNegativeInteger|)))
          %))) 

(MAKEPROP '|Loop| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|List| 13) (0 . |concat|)
              (6 . |construct|) |LOOP;loop;L%;1| (11 . |entries|)
              |LOOP;entries;%L;2| (|NonNegativeInteger|) (16 . |#|) (|List| %)
              (|String|) (21 . |concat|) |LOOP;latex;%S;4| (|Boolean|)
              (26 . ~=) |LOOP;=;2%B;5| (|OutputForm|) (32 . |empty|) (|Symbol|)
              (36 . |outputForm|) (41 . |coerce|) (46 . |hconcat|)
              (51 . |bracket|) |LOOP;coerce;%Of;6|)
           '#(~= 56 |loop| 62 |latex| 67 |entries| 72 |coerce| 77 = 82) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 22))
                        (|makeByteWordVec2| 29
                                            '(2 7 0 0 0 8 1 6 0 7 9 1 6 7 0 11
                                              1 6 13 0 14 1 16 0 15 17 2 13 19
                                              0 0 20 0 22 0 23 1 22 0 24 25 1
                                              13 22 0 26 1 22 0 15 27 1 22 0 0
                                              28 2 0 19 0 0 1 1 0 0 7 10 1 0 16
                                              0 18 1 0 7 0 12 1 0 22 0 29 2 0
                                              19 0 0 21)))))
           '|lookupComplete|)) 

(MAKEPROP '|Loop| 'NILADIC T) 
