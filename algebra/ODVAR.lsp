
(MAKEPROP '|ODVAR;makeVariable;SNni%;1| '|SPADreplace| 'CONS) 

(SDEFUN |ODVAR;makeVariable;SNni%;1|
        ((|s| (S)) (|n| (|NonNegativeInteger|)) (% (%))) (CONS |s| |n|)) 

(MAKEPROP '|ODVAR;variable;%S;2| '|SPADreplace| 'QCAR) 

(SDEFUN |ODVAR;variable;%S;2| ((|v| (%)) (% (S))) (QCAR |v|)) 

(MAKEPROP '|ODVAR;order;%Nni;3| '|SPADreplace| 'QCDR) 

(SDEFUN |ODVAR;order;%Nni;3| ((|v| (%)) (% (|NonNegativeInteger|))) (QCDR |v|)) 

(DECLAIM (NOTINLINE |OrderlyDifferentialVariable;|)) 

(DEFUN |OrderlyDifferentialVariable;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrderlyDifferentialVariable| DV$1))
          (LETT % (GETREFV 17))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrderlyDifferentialVariable|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |var| |#1|)
                              (|:| |ord| (|NonNegativeInteger|))))
          %))) 

(DEFUN |OrderlyDifferentialVariable| (#1=#:G8)
  (SPROG NIL
         (PROG (#2=#:G9)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OrderlyDifferentialVariable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OrderlyDifferentialVariable;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrderlyDifferentialVariable|)))))))))) 

(MAKEPROP '|OrderlyDifferentialVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |ODVAR;makeVariable;SNni%;1|
              |ODVAR;variable;%S;2| |ODVAR;order;%Nni;3| (|Boolean|)
              (|OutputForm|) (|String|) (|Union| 6 '"failed") (|Integer|))
           '#(~= 0 |weight| 6 |variable| 11 |smaller?| 16 |sign| 22
              |retractIfCan| 27 |retract| 32 |positive?| 37 |order| 42
              |negative?| 47 |min| 52 |max| 58 |makeVariable| 64 |latex| 70
              |differentiate| 75 |coerce| 86 >= 96 > 102 = 108 <= 114 < 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|DifferentialVariableCategory&| |OrderedSet&| NIL NIL
                     |RetractableTo&| |SetCategory&| NIL |PartialOrder&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|DifferentialVariableCategory| 6) (|OrderedSet|)
                      (|Comparable|) (|ComparableRepresentation|)
                      (|RetractableTo| 6) (|SetCategory|) (|CoercibleTo| 13)
                      (|PartialOrder|) (|CoercibleFrom| 6) (|BasicType|))
                   (|makeByteWordVec2| 16
                                       '(2 0 12 0 0 1 1 0 8 0 1 1 0 6 0 10 2 0
                                         12 0 0 1 1 1 16 0 1 1 0 15 0 1 1 0 6 0
                                         1 1 1 12 0 1 1 0 8 0 11 1 1 12 0 1 2 0
                                         0 0 0 1 2 0 0 0 0 1 2 0 0 6 8 9 1 0 14
                                         0 1 2 0 0 0 8 1 1 0 0 0 1 1 0 13 0 1 1
                                         0 0 6 1 2 0 12 0 0 1 2 0 12 0 0 1 2 0
                                         12 0 0 1 2 0 12 0 0 1 2 0 12 0 0
                                         1)))))
           '|lookupComplete|)) 
