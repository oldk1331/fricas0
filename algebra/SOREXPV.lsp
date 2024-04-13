
(DECLAIM (NOTINLINE |SortedExponentVector;|)) 

(DEFUN |SortedExponentVector| ()
  (SPROG NIL
         (PROG (#1=#:G2899)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SortedExponentVector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SortedExponentVector|
                             (LIST
                              (CONS NIL (CONS 1 (|SortedExponentVector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|SortedExponentVector|)))))))))) 

(DEFUN |SortedExponentVector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2897 NIL) (#2=#:G2896 NIL) (#3=#:G2895 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|SortedExponentVector|))
    (LETT % (GETREFV 25))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|BasicType|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| (|Integer|)
                                                        '(|Evalable|
                                                          (|Integer|)))
                                         #2#)
                                        (OR #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|BasicType|))
                                         #1#
                                         (|HasCategory| (|Integer|)
                                                        '(|Hashable|))
                                         (|HasCategory| (|Integer|)
                                                        '(|OrderedSet|))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory| (|Integer|)
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #3# #1#
                                            (|HasCategory| (|Integer|)
                                                           '(|OrderedSet|))
                                            #2#)))))
    (|haddProp| |$ConstructorCache| '|SortedExponentVector| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 4096))
    (AND (|HasCategory| % '(|finiteAggregate|)) (|augmentPredVector| % 8192))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|BasicType|))
         (|augmentPredVector| % 16384))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|)) (|augmentPredVector| % 32768))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| % '(|shallowlyMutable|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 65536))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| % 262144))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 1048576))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|Hashable|))
         (|augmentPredVector| % 2097152))
    (AND
     (OR
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|BasicType|)))
      (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|Hashable|)))
      (AND (|HasCategory| % '(|finiteAggregate|))
           (|HasCategory| (|Integer|) '(|OrderedSet|)))
      #2#)
     (|augmentPredVector| % 4194304))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|SortedExponentVector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|U32Vector|) (|Integer|) (|List| 6)
              (|List| 9) (|Equation| 6) (|Mapping| 6 6 6) (|Boolean|)
              (|NonNegativeInteger|) (|SingleInteger|) (|HashState|)
              (|Mapping| 11 6 6) (|OutputForm|) (|String|) (|InputForm|)
              (|Mapping| 11 6) (|UniversalSegment| 6) (|Void|) (|Mapping| 6 6)
              (|List| %) (|Union| 6 '"failed"))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 1 0 6 0 0 8 9 2 0 0 0 0 0 8 12 1 10
                                  3))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |IndexedAggregate&| |Collection&| |OrderedSet&|
                |HomogeneousAggregate&| NIL |Aggregate&| |EltableAggregate&|
                |Evalable&| |SetCategory&| |Hashable&| NIL NIL NIL NIL NIL
                |InnerEvalable&| NIL |PartialOrder&| |BasicType&| NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|LinearAggregate| 6) (|IndexedAggregate| 6 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 6 6)
                 (|Evalable| 6) (|SetCategory|) (|Hashable|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 20 $$)
                 (|Type|) (|Eltable| 6 6) (|InnerEvalable| 6 6)
                 (|CoercibleTo| 16) (|PartialOrder|) (|BasicType|)
                 (|ConvertibleTo| 18))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 

(MAKEPROP '|SortedExponentVector| 'NILADIC T) 
