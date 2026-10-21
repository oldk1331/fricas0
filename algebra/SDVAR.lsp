
(MAKEPROP '|SDVAR;makeVariable;SNni%;1| '|SPADreplace| 'CONS) 

(SDEFUN |SDVAR;makeVariable;SNni%;1|
        ((|s| (S)) (|n| (|NonNegativeInteger|)) (% (%))) (CONS |s| |n|)) 

(MAKEPROP '|SDVAR;variable;%S;2| '|SPADreplace| 'QCAR) 

(SDEFUN |SDVAR;variable;%S;2| ((|v| (%)) (% (S))) (QCAR |v|)) 

(MAKEPROP '|SDVAR;order;%Nni;3| '|SPADreplace| 'QCDR) 

(SDEFUN |SDVAR;order;%Nni;3| ((|v| (%)) (% (|NonNegativeInteger|))) (QCDR |v|)) 

(SDEFUN |SDVAR;<;2%B;4| ((|v| (%)) (|u| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10))
                    (QREFELT % 13))
          (< (SPADCALL |v| (QREFELT % 11)) (SPADCALL |u| (QREFELT % 11))))
         ('T
          (SPADCALL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10))
                    (QREFELT % 14))))) 

(DECLAIM (NOTINLINE |SequentialDifferentialVariable;|)) 

(DEFUN |SequentialDifferentialVariable;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SequentialDifferentialVariable| DV$1))
          (LETT % (GETREFV 20))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SequentialDifferentialVariable|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |var| |#1|)
                              (|:| |ord| (|NonNegativeInteger|))))
          %))) 

(DEFUN |SequentialDifferentialVariable| (#1=#:G12)
  (SPROG NIL
         (PROG (#2=#:G13)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SequentialDifferentialVariable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SequentialDifferentialVariable;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SequentialDifferentialVariable|)))))))))) 

(MAKEPROP '|SequentialDifferentialVariable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (|NonNegativeInteger|) |SDVAR;makeVariable;SNni%;1|
              |SDVAR;variable;%S;2| |SDVAR;order;%Nni;3| (|Boolean|) (0 . =)
              (6 . <) |SDVAR;<;2%B;4| (|OutputForm|) (|String|)
              (|Union| 6 '"failed") (|Integer|))
           '#(~= 12 |weight| 18 |variable| 23 |smaller?| 28 |sign| 34
              |retractIfCan| 39 |retract| 44 |positive?| 49 |order| 54
              |negative?| 59 |min| 64 |max| 70 |makeVariable| 76 |latex| 82
              |differentiate| 87 |coerce| 98 >= 108 > 114 = 120 <= 126 < 132)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|DifferentialVariableCategory&| |OrderedSet&| NIL NIL
                     |RetractableTo&| |SetCategory&| NIL |PartialOrder&| NIL
                     |BasicType&|)
                  (CONS
                   '#((|DifferentialVariableCategory| 6) (|OrderedSet|)
                      (|Comparable|) (|ComparableRepresentation|)
                      (|RetractableTo| 6) (|SetCategory|) (|CoercibleTo| 16)
                      (|PartialOrder|) (|CoercibleFrom| 6) (|BasicType|))
                   (|makeByteWordVec2| 19
                                       '(2 6 12 0 0 13 2 6 12 0 0 14 2 0 12 0 0
                                         1 1 0 8 0 1 1 0 6 0 10 2 0 12 0 0 1 1
                                         1 19 0 1 1 0 18 0 1 1 0 6 0 1 1 1 12 0
                                         1 1 0 8 0 11 1 1 12 0 1 2 0 0 0 0 1 2
                                         0 0 0 0 1 2 0 0 6 8 9 1 0 17 0 1 2 0 0
                                         0 8 1 1 0 0 0 1 1 0 16 0 1 1 0 0 6 1 2
                                         0 12 0 0 1 2 0 12 0 0 1 2 0 12 0 0 1 2
                                         0 12 0 0 1 2 0 12 0 0 15)))))
           '|lookupComplete|)) 
