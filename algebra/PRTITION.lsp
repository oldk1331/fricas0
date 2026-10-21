
(MAKEPROP '|PRTITION;0;%;1| '|SPADreplace| '(XLAM NIL NIL)) 

(SDEFUN |PRTITION;0;%;1| ((% (%))) NIL) 

(MAKEPROP '|PRTITION;coerce;%L;2| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |PRTITION;coerce;%L;2| ((|s| (%)) (% (|List| (|Integer|)))) |s|) 

(SDEFUN |PRTITION;convert;%L;3| ((|x| (%)) (% (|List| (|Integer|))))
        (SPADCALL |x| (QREFELT % 10))) 

(SDEFUN |PRTITION;partition;L%;4| ((|list| (|List| (|Integer|))) (% (%)))
        (SPADCALL (CONS #'|PRTITION;partition;L%;4!0| %) |list| (QREFELT % 16))) 

(SDEFUN |PRTITION;partition;L%;4!0| ((|i1| NIL) (|i2| NIL) (% NIL))
        (SPADCALL |i2| |i1| (QREFELT % 14))) 

(SDEFUN |PRTITION;<;2%B;5| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((NULL |x|) (NULL (NULL |y|))) ((NULL |y|) NIL)
              ((EQL (|SPADfirst| |x|) (|SPADfirst| |y|))
               (SPADCALL (CDR |x|) (CDR |y|) (QREFELT % 18)))
              ('T (< (|SPADfirst| |x|) (|SPADfirst| |y|))))) 

(MAKEPROP '|PRTITION;=;2%B;6| '|SPADreplace| 'EQUAL) 

(SDEFUN |PRTITION;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (EQUAL |x| |y|)) 

(SDEFUN |PRTITION;+;3%;7| ((|x| (%)) (|y| (%)) (% (%)))
        (COND ((NULL |x|) |y|) ((NULL |y|) |x|)
              ((> (|SPADfirst| |x|) (|SPADfirst| |y|))
               (CONS (|SPADfirst| |x|)
                     (SPADCALL (CDR |x|) |y| (QREFELT % 20))))
              ('T
               (CONS (|SPADfirst| |y|)
                     (SPADCALL |x| (CDR |y|) (QREFELT % 20)))))) 

(SDEFUN |PRTITION;*;Nni2%;8| ((|n| (|NonNegativeInteger|)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G41 NIL))
               (COND ((ZEROP |n|) (|spadConstant| % 7))
                     ('T
                      (SPADCALL |x|
                                (SPADCALL
                                 (PROG2
                                     (LETT #1# (SPADCALL |n| 1 (QREFELT % 23)))
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0)
                                                   (|NonNegativeInteger|)
                                                   (|Union|
                                                    (|NonNegativeInteger|)
                                                    "failed")
                                                   #1#))
                                 |x| (QREFELT % 24))
                                (QREFELT % 20)))))) 

(SDEFUN |PRTITION;dp| ((|i| (|Integer|)) (|x| (%)) (% (%)))
        (COND ((NULL |x|) (|spadConstant| % 7))
              ((EQL (|SPADfirst| |x|) |i|) (CDR |x|))
              ('T (CONS (|SPADfirst| |x|) (|PRTITION;dp| |i| (CDR |x|) %))))) 

(SDEFUN |PRTITION;remv| ((|i| (|Integer|)) (|x| (%)) (% (|Union| % "failed")))
        (COND
         ((SPADCALL |i| |x| (QREFELT % 25)) (CONS 0 (|PRTITION;dp| |i| |x| %)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |PRTITION;subtractIfCan;2%U;11|
        ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|aa| (|Union| % "failed")))
               (SEQ
                (COND
                 ((NULL |x|)
                  (COND ((NULL |y|) (CONS 0 (|spadConstant| % 7)))
                        (#1='T (CONS 1 "failed"))))
                 ((NULL |y|) (CONS 0 |x|))
                 (#1#
                  (SEQ (LETT |aa| (|PRTITION;remv| (|SPADfirst| |y|) |x| %))
                       (EXIT
                        (COND ((QEQCAR |aa| 1) (CONS 1 "failed"))
                              (#1#
                               (SPADCALL (QCDR |aa|) (CDR |y|)
                                         (QREFELT % 26))))))))))) 

(SDEFUN |PRTITION;bite|
        ((|i| (|Integer|)) (|li| (|List| (|Integer|)))
         (% (|List| (|Integer|))))
        (SPROG ((|li1| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |li|) (CONS 0 NIL))
                      ((EQL (|SPADfirst| |li|) |i|)
                       (SEQ (LETT |li1| (|PRTITION;bite| |i| (CDR |li|) %))
                            (EXIT
                             (CONS (+ (|SPADfirst| |li1|) 1) (CDR |li1|)))))
                      ('T (CONS 0 |li|)))))) 

(SDEFUN |PRTITION;powers;LL;13|
        ((|l| (|List| (|Integer|))) (% (|List| (|List| (|Integer|)))))
        (SPROG ((|li| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |l|) NIL)
                      ('T
                       (SEQ
                        (LETT |li|
                              (|PRTITION;bite| (|SPADfirst| |l|) (CDR |l|) %))
                        (EXIT
                         (CONS
                          (LIST (|SPADfirst| |l|) (+ (|SPADfirst| |li|) 1))
                          (SPADCALL (CDR |li|) (QREFELT % 28)))))))))) 

(SDEFUN |PRTITION;conjugate;2%;14| ((|x| (%)) (% (%)))
        (SPADCALL |x| (QREFELT % 30))) 

(SDEFUN |PRTITION;mkterm|
        ((|i1| (|Integer|)) (|i2| (|Integer|)) (% (|OutputForm|)))
        (COND
         ((EQL |i2| 1)
          (SPADCALL (SPADCALL |i1| (QREFELT % 33))
                    (SPADCALL " " (QREFELT % 35)) (QREFELT % 36)))
         ('T
          (SPADCALL (SPADCALL |i1| (QREFELT % 33))
                    (SPADCALL |i2| (QREFELT % 33)) (QREFELT % 36))))) 

(SDEFUN |PRTITION;mkexp1|
        ((|lli| (|List| (|List| (|Integer|)))) (% (|List| (|OutputForm|))))
        (SPROG ((|li| (|List| (|Integer|))))
               (SEQ
                (COND ((NULL |lli|) NIL)
                      ('T
                       (SEQ (LETT |li| (|SPADfirst| |lli|))
                            (COND
                             ((NULL (CDR |lli|))
                              (COND
                               ((EQL (SPADCALL |li| (QREFELT % 37)) 1)
                                (EXIT
                                 (CONS
                                  (SPADCALL (|SPADfirst| |li|) (QREFELT % 33))
                                  NIL))))))
                            (EXIT
                             (CONS
                              (|PRTITION;mkterm| (|SPADfirst| |li|)
                               (SPADCALL |li| (QREFELT % 37)) %)
                              (|PRTITION;mkexp1| (CDR |lli|) %))))))))) 

(SDEFUN |PRTITION;coerce;%Of;17| ((|x| (%)) (% (|OutputForm|)))
        (COND ((NULL |x|) (SPADCALL |x| (QREFELT % 38)))
              ('T
               (SPADCALL
                (SPADCALL (ELT % 39)
                          (|PRTITION;mkexp1| (SPADCALL |x| (QREFELT % 28)) %)
                          (QREFELT % 42))
                (QREFELT % 43))))) 

(SDEFUN |PRTITION;pdct;%I;18| ((|x| (%)) (% (|Integer|)))
        (SPROG
         ((|a| NIL) (#1=#:G84 NIL) (#2=#:G82 #3=(|Integer|)) (#4=#:G80 #3#)
          (#5=#:G81 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |a| NIL) (LETT #1# (SPADCALL |x| (QREFELT % 28))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2#
                         (*
                          (SPADCALL (SPADCALL |a| (QREFELT % 37))
                                    (QREFELT % 45))
                          (EXPT (|SPADfirst| |a|)
                                (SPADCALL |a| (QREFELT % 37)))))
                   (COND (#5# (LETT #4# (* #4# #2#)))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T 1)))))) 

(DECLAIM (NOTINLINE |Partition;|)) 

(DEFUN |Partition;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|Partition|))
          (LETT % (GETREFV 48))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Partition| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|List| (|Integer|)))
          %))) 

(DEFUN |Partition| ()
  (SPROG NIL
         (PROG (#1=#:G86)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Partition|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Partition|
                             (LIST (CONS NIL (CONS 1 (|Partition;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|Partition|)))))))))) 

(MAKEPROP '|Partition| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |PRTITION;0;%;1|) %))
              (|List| 13) |PRTITION;coerce;%L;2| (0 . |copy|)
              |PRTITION;convert;%L;3| (|Boolean|) (|Integer|) (5 . <)
              (|Mapping| 12 13 13) (11 . |sort|) |PRTITION;partition;L%;4|
              |PRTITION;<;2%B;5| |PRTITION;=;2%B;6| |PRTITION;+;3%;7|
              (|Union| % '"failed") (|NonNegativeInteger|)
              (17 . |subtractIfCan|) |PRTITION;*;Nni2%;8| (23 . |member?|)
              |PRTITION;subtractIfCan;2%U;11| (|List| 8)
              |PRTITION;powers;LL;13| (|PartitionsAndPermutations|)
              (29 . |conjugate|) |PRTITION;conjugate;2%;14| (|OutputForm|)
              (34 . |coerce|) (|String|) (39 . |message|) (44 . ^)
              (50 . |second|) (55 . |coerce|) (60 . *) (|Mapping| 32 32 32)
              (|List| 32) (66 . |reduce|) (72 . |paren|)
              |PRTITION;coerce;%Of;17| (77 . |factorial|) |PRTITION;pdct;%I;18|
              (|PositiveInteger|))
           '#(~= 82 |zero?| 88 |subtractIfCan| 93 |smaller?| 99 |sign| 105
              |sample| 110 |powers| 114 |positive?| 119 |pdct| 124 |partition|
              129 |opposite?| 134 |negative?| 140 |min| 145 |max| 151 |latex|
              157 |convert| 162 |conjugate| 167 |coerce| 172 |abs| 182 >= 187 >
              193 = 199 <= 205 < 211 |0| 217 + 221 * 227)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedAbelianSemiGroup&| |OrderedSet&| NIL NIL
                     |AbelianMonoid&| |SetWithZero&| NIL |AbelianSemiGroup&|
                     |SetCategory&| NIL |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|OrderedAbelianSemiGroup|) (|OrderedSet|)
                      (|CancellationAbelianMonoid|) (|Comparable|)
                      (|AbelianMonoid|) (|SetWithZero|)
                      (|ComparableRepresentation|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|CoercibleTo| 32) (|BasicType|)
                      (|PartialOrder|) (|ConvertibleTo| 8))
                   (|makeByteWordVec2| 47
                                       '(1 8 0 0 10 2 13 12 0 0 14 2 6 0 15 0
                                         16 2 22 21 0 0 23 2 6 12 13 0 25 1 29
                                         8 8 30 1 13 32 0 33 1 32 0 34 35 2 32
                                         0 0 0 36 1 6 13 0 37 1 6 32 0 38 2 32
                                         0 0 0 39 2 41 32 40 0 42 1 32 0 0 43 1
                                         13 0 0 45 2 0 12 0 0 1 1 0 12 0 1 2 0
                                         21 0 0 26 2 0 12 0 0 1 1 2 13 0 1 0 0
                                         0 1 1 0 27 8 28 1 2 12 0 1 1 0 13 0 46
                                         1 0 0 8 17 2 0 12 0 0 1 1 2 12 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 1 0 34 0 1 1 0 8 0
                                         11 1 0 0 0 31 1 0 32 0 44 1 0 8 0 9 1
                                         1 0 0 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0
                                         12 0 0 19 2 0 12 0 0 1 2 0 12 0 0 18 0
                                         0 0 7 2 0 0 0 0 20 2 0 0 47 0 1 2 0 0
                                         22 0 24)))))
           '|lookupComplete|)) 
