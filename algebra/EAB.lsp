
(SDEFUN |EAB;=;2%B;1| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(SDEFUN |EAB;<;2%B;2| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((NULL |x|) (NULL (NULL |y|))) ((NULL |y|) NIL)
              ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
               (SPADCALL (CDR |x|) (CDR |y|) (QREFELT % 10)))
              ('T (> (|SPADfirst| |x|) (|SPADfirst| |y|))))) 

(SDEFUN |EAB;coerce;L%;3| ((|li| (|List| (|Integer|))) (% (%)))
        (SPROG ((|x| NIL) (#1=#:G19 NIL))
               (SEQ
                (SEQ (LETT |x| NIL) (LETT #1# |li|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x| 1 (QREFELT % 12))
                         (COND
                          ((SPADCALL |x| 0 (QREFELT % 12))
                           (|error| "coerce: values can only be 0 and 1")))))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |li|)))) 

(SDEFUN |EAB;degree;%Nni;4| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPROG
         ((#1=#:G0 NIL) (#2=#:G28 NIL) (#3=#:G25 #4=(|Integer|)) (#5=#:G23 #4#)
          (#6=#:G24 NIL) (#7=#:G26 NIL))
         (SEQ
          (PROG1
              (LETT #7#
                    (PROGN
                     (LETT #6# NIL)
                     (SEQ (LETT #1# NIL) (LETT #2# |x|) G190
                          (COND
                           ((OR (ATOM #2#) (PROGN (LETT #1# (CAR #2#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3# #1#)
                             (COND (#6# (LETT #5# (+ #5# #3#)))
                                   ('T
                                    (PROGN (LETT #5# #3#) (LETT #6# 'T)))))))
                          (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                     (COND (#6# #5#) ('T 0))))
            (|check_subtype2| (>= #7# 0) '(|NonNegativeInteger|) '(|Integer|)
                              #7#))))) 

(SDEFUN |EAB;exponents;%L;5| ((|x| (%)) (% (|List| (|Integer|))))
        (SPADCALL |x| (QREFELT % 17))) 

(SDEFUN |EAB;Nul;Nni%;6| ((|n| (|NonNegativeInteger|)) (% (%)))
        (SPROG ((#1=#:G33 NIL) (|i| NIL) (#2=#:G34 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS 0 #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |EAB;coerce;%Of;7| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL |x| (QREFELT % 21))) 

(DECLAIM (NOTINLINE |ExtAlgBasis;|)) 

(DEFUN |ExtAlgBasis;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ExtAlgBasis|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ExtAlgBasis| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|List| (|Integer|)))
          %))) 

(DEFUN |ExtAlgBasis| ()
  (SPROG NIL
         (PROG (#1=#:G37)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ExtAlgBasis|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ExtAlgBasis|
                             (LIST (CONS NIL (CONS 1 (|ExtAlgBasis;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|ExtAlgBasis|)))))))))) 

(MAKEPROP '|ExtAlgBasis| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| (|Boolean|) (0 . =) |EAB;=;2%B;1|
              |EAB;<;2%B;2| (|Integer|) (6 . ~=) (|List| 11) |EAB;coerce;L%;3|
              (|NonNegativeInteger|) |EAB;degree;%Nni;4| (12 . |copy|)
              |EAB;exponents;%L;5| |EAB;Nul;Nni%;6| (|OutputForm|)
              (17 . |coerce|) |EAB;coerce;%Of;7| (|String|))
           '#(~= 22 |smaller?| 28 |sign| 34 |positive?| 39 |negative?| 44 |min|
              49 |max| 55 |latex| 61 |exponents| 66 |degree| 71 |coerce| 76
              |Nul| 86 >= 91 > 97 = 103 <= 109 < 115)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|CoercibleTo| 20) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 23
                                       '(2 6 7 0 0 8 2 11 7 0 0 12 1 13 0 0 17
                                         1 13 20 0 21 2 0 7 0 0 1 2 0 7 0 0 1 1
                                         1 11 0 1 1 1 7 0 1 1 1 7 0 1 2 0 0 0 0
                                         1 2 0 0 0 0 1 1 0 23 0 1 1 0 13 0 18 1
                                         0 15 0 16 1 0 20 0 22 1 0 0 13 14 1 0
                                         0 15 19 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7
                                         0 0 9 2 0 7 0 0 1 2 0 7 0 0 10)))))
           '|lookupComplete|)) 
