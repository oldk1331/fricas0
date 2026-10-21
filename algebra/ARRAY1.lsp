
(MAKEPROP '|ARRAY1;qelt;%IS;1| '|SPADreplace|
          '(XLAM (|x| |i|) (QAREF1O |x| |i| 1))) 

(SDEFUN |ARRAY1;qelt;%IS;1| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1O |x| |i| 1)) 

(MAKEPROP '|ARRAY1;qsetelt!;%I2S;2| '|SPADreplace|
          '(XLAM (|x| |i| |s|) (QSETAREF1O |x| |i| |s| 1))) 

(SDEFUN |ARRAY1;qsetelt!;%I2S;2|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (QSETAREF1O |x| |i| |s| 1)) 

(SDEFUN |ARRAY1;oneDimensionalArray;L%;3| ((|u| (|List| S)) (% (%)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|a| (%)) (|x| NIL) (#1=#:G9 NIL)
          (|i| NIL) (#2=#:G8 NIL))
         (SEQ (LETT |n| (LENGTH |u|))
              (EXIT
               (COND ((EQL |n| 0) (MAKE-ARRAY 0))
                     ('T
                      (SEQ (LETT |a| (MAKEARR1 |n| (|SPADfirst| |u|)))
                           (SEQ (LETT |x| NIL) (LETT #1# (CDR |u|))
                                (LETT |i| 2) (LETT #2# |n|) G190
                                (COND
                                 ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT (SPADCALL |a| |i| |x| (QREFELT % 10))))
                                (LETT |i|
                                      (PROG1 (|inc_SI| |i|)
                                        (LETT #1# (CDR #1#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |a|)))))))) 

(MAKEPROP '|ARRAY1;oneDimensionalArray;NniS%;4| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |ARRAY1;oneDimensionalArray;NniS%;4|
        ((|n| (|NonNegativeInteger|)) (|s| (S)) (% (%))) (MAKEARR1 |n| |s|)) 

(DECLAIM (NOTINLINE |OneDimensionalArray;|)) 

(DEFUN |OneDimensionalArray;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G20 NIL) (#2=#:G19 NIL) (#3=#:G18 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|OneDimensionalArray| DV$1))
    (LETT % (GETREFV 32))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #1#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #1#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|OneDimensionalArray| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|SetWithZero|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 262144))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 524288))
    (AND
     (OR (AND #1# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 1048576))
    (AND
     (OR (AND #1# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|)))
         #2#)
     (|augmentPredVector| % 2097152))
    (AND
     (OR #3# (AND #1# (|HasCategory| % '(|finiteAggregate|)))
         (AND (|HasCategory| |#1| '(|OrderedSet|))
              (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 4194304))
    (AND (|HasCategory| |#1| '(|Hashable|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 8388608))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND #1# (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|Hashable|))
           (|HasCategory| % '(|finiteAggregate|)))
      (AND (|HasCategory| |#1| '(|OrderedSet|))
           (|HasCategory| % '(|finiteAggregate|)))
      #2#)
     (|augmentPredVector| % 16777216))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |OneDimensionalArray| (#1=#:G21)
  (SPROG NIL
         (PROG (#2=#:G22)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OneDimensionalArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|OneDimensionalArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OneDimensionalArray|)))))))))) 

(MAKEPROP '|OneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedOneDimensionalArray| 6 (NRTEVAL 1))
              (|local| |#1|) (|Integer|) |ARRAY1;qelt;%IS;1|
              |ARRAY1;qsetelt!;%I2S;2| (0 . |setelt!|) (|List| 6)
              |ARRAY1;oneDimensionalArray;L%;3| (|NonNegativeInteger|)
              |ARRAY1;oneDimensionalArray;NniS%;4| (|Boolean|) (|Mapping| 6 6)
              (|List| 7) (|Union| 6 '"failed") (|Mapping| 15 6)
              (|UniversalSegment| 7) (|List| %) (|Mapping| 6 6 6)
              (|Mapping| 15 6 6) (|SingleInteger|) (|HashState|) (|List| 27)
              (|Equation| 6) (|OutputForm|) (|String|) (|Void|) (|InputForm|))
           '#(|setelt!| 7 |qsetelt!| 14 |qelt| 21 |oneDimensionalArray| 27)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 1 7 0 0 7 0 2 10 9 0 0 3 11 1 13 9 0 0
                                  0 0 0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| NIL |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|) (|Comparable|)
                 (|Collection| 6) (|IndexedAggregate| 7 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 7 6) (|Aggregate|) (|ConvertibleTo| 31)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 28)
                 (|InnerEvalable| 6 6) (|Eltable| 7 6) (|Type|)
                 (|Eltable| 20 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 14
                                  '(3 0 6 0 7 6 10 3 14 6 0 7 6 10 3 14 6 0 7 6
                                    9 2 0 6 0 7 8 1 0 0 11 12 2 0 0 13 6
                                    14)))))
           '|lookupIncomplete|)) 
