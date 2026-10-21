
(MAKEPROP '|IVARS;to_i| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |IVARS;to_i| ((|x| (%)) (% (|Integer|))) |x|) 

(SDEFUN |IVARS;=;2%B;2| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (EQL (|IVARS;to_i| |x| %) (|IVARS;to_i| |y| %))) 

(SDEFUN |IVARS;<;2%B;3| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (< (|IVARS;to_i| |x| %) (|IVARS;to_i| |y| %))) 

(SDEFUN |IVARS;variable;SIU;4|
        ((|s| (|Symbol|)) (|n| (|Integer|)) (% (|Union| % "failed")))
        (SPROG ((|k| (|Integer|)))
               (SEQ (LETT |k| (SPADCALL |s| (QREFELT % 6) (QREFELT % 14)))
                    (EXIT
                     (COND ((EQL |k| 0) (CONS 1 "failed"))
                           ('T
                            (CONS 0 (- (+ (* (QREFELT % 7) |n|) |k|) 1)))))))) 

(SDEFUN |IVARS;coerce;%Of;5| ((|x| (%)) (% (|OutputForm|)))
        (SPROG
         ((|qr|
           (|Record| (|:| |quotient| (|Integer|))
                     (|:| |remainder| (|Integer|))))
          (|s| (|Symbol|)))
         (SEQ (LETT |qr| (|divide_INT| (|IVARS;to_i| |x| %) (QREFELT % 7)))
              (LETT |s|
                    (SPADCALL (QREFELT % 6) (+ (QCDR |qr|) 1) (QREFELT % 17)))
              (EXIT
               (SPADCALL (SPADCALL |s| (QREFELT % 19))
                         (SPADCALL (QCAR |qr|) (QREFELT % 20))
                         (QREFELT % 21)))))) 

(DECLAIM (NOTINLINE |IndexedVariables;|)) 

(DEFUN |IndexedVariables;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IndexedVariables| DV$1))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|IndexedVariables| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (LENGTH |#1|))
          %))) 

(DEFUN |IndexedVariables| (#1=#:G15)
  (SPROG NIL
         (PROG (#2=#:G16)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedVariables|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedVariables;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedVariables|)))))))))) 

(MAKEPROP '|IndexedVariables| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|m| (|Boolean|)
              |IVARS;=;2%B;2| |IVARS;<;2%B;3| (|Integer|) (|Symbol|)
              (|List| 12) (0 . |position|) (|Union| % '"failed")
              |IVARS;variable;SIU;4| (6 . |elt|) (|OutputForm|) (12 . |coerce|)
              (17 . |coerce|) (22 . |hconcat|) |IVARS;coerce;%Of;5| (|String|))
           '#(~= 28 |variable| 34 |smaller?| 40 |sign| 46 |positive?| 51
              |negative?| 56 |min| 61 |max| 67 |latex| 73 |coerce| 78 >= 83 >
              89 = 95 <= 101 < 107)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|CoercibleTo| 18) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 23
                                       '(2 13 11 12 0 14 2 13 12 0 11 17 1 12
                                         18 0 19 1 11 18 0 20 2 18 0 0 0 21 2 0
                                         8 0 0 1 2 0 15 12 11 16 2 0 8 0 0 1 1
                                         1 11 0 1 1 1 8 0 1 1 1 8 0 1 2 0 0 0 0
                                         1 2 0 0 0 0 1 1 0 23 0 1 1 0 18 0 22 2
                                         0 8 0 0 1 2 0 8 0 0 1 2 0 8 0 0 9 2 0
                                         8 0 0 1 2 0 8 0 0 10)))))
           '|lookupComplete|)) 
