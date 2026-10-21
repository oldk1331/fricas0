
(SDEFUN |MODMONOM;<;2%B;1| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(MAKEPROP '|MODMONOM;exponent;%E;2| '|SPADreplace| 'QCDR) 

(SDEFUN |MODMONOM;exponent;%E;2| ((|x| (%)) (% (E))) (QCDR |x|)) 

(MAKEPROP '|MODMONOM;index;%IS;3| '|SPADreplace| 'QCAR) 

(SDEFUN |MODMONOM;index;%IS;3| ((|x| (%)) (% (IS))) (QCAR |x|)) 

(MAKEPROP '|MODMONOM;coerce;%R;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MODMONOM;coerce;%R;4|
        ((|x| (%)) (% (|Record| (|:| |index| IS) (|:| |exponent| E)))) |x|) 

(MAKEPROP '|MODMONOM;coerce;R%;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |MODMONOM;coerce;R%;5|
        ((|x| (|Record| (|:| |index| IS) (|:| |exponent| E))) (% (%))) |x|) 

(MAKEPROP '|MODMONOM;construct;ISE%;6| '|SPADreplace| 'CONS) 

(SDEFUN |MODMONOM;construct;ISE%;6| ((|i| (IS)) (|e| (E)) (% (%)))
        (CONS |i| |e|)) 

(DECLAIM (NOTINLINE |ModuleMonomial;|)) 

(DEFUN |ModuleMonomial;| (|#1| |#2| |#3|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 |#3|)
          (LETT |dv$| (LIST '|ModuleMonomial| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 20))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModuleMonomial|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 (|Record| (|:| |index| |#1|) (|:| |exponent| |#2|)))
          %))) 

(DEFUN |ModuleMonomial| (&REST #1=#:G13)
  (SPROG NIL
         (PROG (#2=#:G14)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|ModuleMonomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ModuleMonomial;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ModuleMonomial|)))))))))) 

(MAKEPROP '|ModuleMonomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Record| (|:| |index| 6) (|:| |exponent| 7))
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|)
              |MODMONOM;<;2%B;1| |MODMONOM;exponent;%E;2|
              |MODMONOM;index;%IS;3| |MODMONOM;coerce;%R;4|
              |MODMONOM;coerce;R%;5| |MODMONOM;construct;ISE%;6| (|OutputForm|)
              (|String|) (|Integer|))
           '#(~= 0 |smaller?| 6 |sign| 12 |positive?| 17 |negative?| 22 |min|
              27 |max| 33 |latex| 39 |index| 44 |exponent| 49 |construct| 54
              |coerce| 60 >= 75 > 81 = 87 <= 93 < 99)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedSet&| NIL NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|OrderedSet|) (|Comparable|)
                      (|ComparableRepresentation|) (|SetCategory|)
                      (|CoercibleTo| 17) (|PartialOrder|) (|BasicType|))
                   (|makeByteWordVec2| 19
                                       '(2 0 10 0 0 1 2 0 10 0 0 1 1 1 19 0 1 1
                                         1 10 0 1 1 1 10 0 1 2 0 0 0 0 1 2 0 0
                                         0 0 1 1 0 18 0 1 1 0 6 0 13 1 0 7 0 12
                                         2 0 0 6 7 16 1 0 17 0 1 1 0 0 5 15 1 0
                                         5 0 14 2 0 10 0 0 1 2 0 10 0 0 1 2 0
                                         10 0 0 1 2 0 10 0 0 1 2 0 10 0 0
                                         11)))))
           '|lookupComplete|)) 
