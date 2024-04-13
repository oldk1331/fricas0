
(SDEFUN |ILIST;minIndex;%I;1| ((|x| (%)) (% (|Integer|))) (QREFELT % 7)) 

(SDEFUN |ILIST;maxIndex;%I;2| ((|x| (%)) (% (|Integer|)))
        (- (+ (QREFELT % 7) (SPADCALL |x| (QREFELT % 11))) 1)) 

(DECLAIM (NOTINLINE |IndexedList;|)) 

(DEFUN |IndexedList| (&REST #1=#:G26)
  (SPROG NIL
         (PROG (#2=#:G27)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedList;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedList|)))))))))) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (SPROG
   ((#1=#:G22 NIL) (#2=#:G23 NIL) (#3=#:G25 NIL) (#4=#:G24 NIL) (|pv$| NIL)
    (#5=#:G19 NIL) (#6=#:G20 NIL) (#7=#:G21 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|IndexedList| DV$1 DV$2))
    (LETT % (GETREFV 34))
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
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|)))
                                        (LETT #6#
                                              (|HasCategory| |#1|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         #6#)
                                        (OR #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (OR (|HasCategory| |#1| '(|BasicType|))
                                            #7#
                                            (|HasCategory| |#1| '(|Hashable|))
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CoercibleTo|
                                                               (|OutputForm|))))
                                        (OR #5# #7#
                                            (|HasCategory| |#1|
                                                           '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (LETT #4# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 8192))
    (AND (|HasCategory| |#1| '(|Hashable|)) #4# (|augmentPredVector| % 16384))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 32768))
    (AND (OR #5# (AND #7# #4#) #3#) (|augmentPredVector| % 65536))
    (AND (OR (AND #7# #4#) #3# #6#) (|augmentPredVector| % 131072))
    (AND (OR (AND #7# #4#) #3#) (|augmentPredVector| % 262144))
    (AND
     (LETT #2#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR #2# (AND #7# #4#) (AND (|HasCategory| |#1| '(|Hashable|)) #4#) #3#
         #6#)
     (|augmentPredVector| % 1048576))
    (AND (LETT #1# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #1#
         (|augmentPredVector| % 4194304))
    (AND #4# #1# (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|) (|local| |#2|)
              (|Integer|) |ILIST;minIndex;%I;1| (|NonNegativeInteger|)
              (0 . |#|) |ILIST;maxIndex;%I;2| (|Mapping| 14 6 6) (|Boolean|)
              (|Mapping| 6 6 6) (|SingleInteger|) (|HashState|) (|List| 19)
              (|Equation| 6) (|OutputForm|) (|String|) (|Mapping| 14 6)
              (|Void|) (|UniversalSegment| 8) '"last" '"rest" '"first"
              (|List| %) '"value" (|Mapping| 6 6) (|InputForm|) (|List| 8)
              (|Union| 6 '"failed"))
           '#(~= 5 |value| 11 |trim| 16 |third| 22 |tail| 27 |swap!| 32
              |split!| 39 |sorted?| 45 |sort!| 56 |sort| 67 |smaller?| 78
              |size?| 84 |setvalue!| 90 |setrest!| 96 |setlast!| 102
              |setfirst!| 108 |setelt!| 114 |setchildren!| 156 |select!| 162
              |select| 168 |second| 174 |sample| 179 |rightTrim| 183 |reverse!|
              189 |reverse| 194 |rest| 199 |removeDuplicates!| 210
              |removeDuplicates| 215 |remove!| 220 |remove| 232 |reduce| 244
              |qsetrest!| 265 |qsetfirst!| 271 |qsetelt!| 277 |qelt| 284
              |possiblyInfinite?| 290 |position| 295 |parts| 314 |nodes| 319
              |node?| 324 |new| 330 |more?| 336 |minIndex| 342 |min| 347
              |merge!| 358 |merge| 371 |members| 384 |member?| 389 |maxIndex|
              395 |max| 400 |map!| 417 |map| 423 |list| 436 |less?| 441
              |leftTrim| 447 |leaves| 453 |leaf?| 458 |latex| 463 |last| 468
              |insert!| 479 |insert| 493 |indices| 507 |index?| 512
              |hashUpdate!| 518 |hash| 524 |first| 529 |find| 540 |fill!| 546
              |explicitlyFinite?| 552 |every?| 557 |eval| 563 |eq?| 589
              |entry?| 595 |entries| 601 |empty?| 606 |empty| 611 |elt| 615
              |distance| 658 |delete!| 664 |delete| 676 |cyclic?| 688
              |cycleTail| 693 |cycleSplit!| 698 |cycleLength| 703 |cycleEntry|
              708 |count| 713 |copyInto!| 725 |copy| 732 |convert| 737
              |construct| 742 |concat!| 747 |concat| 764 |coerce| 787
              |children| 792 |child?| 797 |any?| 803 >= 809 > 815 = 821 <= 827
              < 833 |#| 839)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 0 0 0 0 1 0 6 0 0 8 9 2 0 0 0 0 0 8
                                  12 1 10 3))
            (CONS
             '#(|ListAggregate&| |StreamAggregate&|
                |ExtensibleLinearAggregate&| NIL |UnaryRecursiveAggregate&|
                |LinearAggregate&| |RecursiveAggregate&| |IndexedAggregate&|
                |Collection&| |OrderedSet&| |HomogeneousAggregate&| NIL
                |Aggregate&| |EltableAggregate&| |Evalable&| |SetCategory&|
                |Hashable&| NIL NIL NIL NIL NIL |InnerEvalable&| NIL
                |PartialOrder&| |BasicType&| NIL)
             (CONS
              '#((|ListAggregate| 6) (|StreamAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|UnaryRecursiveAggregate| 6) (|LinearAggregate| 6)
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 8 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 6)
                 (|Evalable| 6) (|SetCategory|) (|Hashable|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 24 $$)
                 (|Type|) (|Eltable| 8 6) (|InnerEvalable| 6 6)
                 (|CoercibleTo| 20) (|PartialOrder|) (|BasicType|)
                 (|ConvertibleTo| 31))
              (|makeByteWordVec2| 33
                                  '(1 0 10 0 11 2 21 14 0 0 1 1 0 6 0 1 2 20 0
                                    0 6 1 1 0 6 0 1 1 0 0 0 1 3 22 23 0 8 8 1 2
                                    22 0 0 10 1 1 16 14 0 1 2 14 14 13 0 1 1 23
                                    0 0 1 2 24 0 13 0 1 1 16 0 0 1 2 14 0 13 0
                                    1 2 19 14 0 0 1 2 0 14 0 10 1 2 22 6 0 6 1
                                    2 22 0 0 0 1 2 22 6 0 6 1 2 22 6 0 6 1 3 22
                                    6 0 8 6 1 3 22 6 0 24 6 1 3 22 6 0 25 6 1 3
                                    22 0 0 26 0 1 3 22 6 0 27 6 1 3 22 6 0 29 6
                                    1 2 22 0 0 28 1 2 0 0 22 0 1 2 14 0 22 0 1
                                    1 0 6 0 1 0 0 0 1 2 20 0 0 6 1 1 24 0 0 1 1
                                    14 0 0 1 2 0 0 0 10 1 1 0 0 0 1 1 4 0 0 1 1
                                    20 0 0 1 2 4 0 6 0 1 2 0 0 22 0 1 2 20 0 6
                                    0 1 2 14 0 22 0 1 4 20 6 15 0 6 6 1 2 14 6
                                    15 0 1 3 14 6 15 0 6 1 2 22 0 0 0 1 2 22 6
                                    0 6 1 3 22 6 0 8 6 1 2 0 6 0 8 1 1 0 14 0 1
                                    2 20 8 6 0 1 3 20 8 6 0 8 1 2 14 8 22 0 1 1
                                    14 5 0 1 1 0 28 0 1 2 4 14 0 0 1 2 0 0 10 6
                                    1 2 0 14 0 10 1 1 13 8 0 9 2 16 0 0 0 1 1
                                    16 6 0 1 2 1 0 0 0 1 3 0 0 13 0 0 1 2 16 0
                                    0 0 1 3 14 0 13 0 0 1 1 14 5 0 1 2 20 14 6
                                    0 1 1 13 8 0 12 2 16 0 0 0 1 1 16 6 0 1 2
                                    14 6 13 0 1 2 22 0 30 0 1 3 0 0 15 0 0 1 2
                                    0 0 30 0 1 1 0 0 6 1 2 0 14 0 10 1 2 20 0 0
                                    6 1 1 0 5 0 1 1 0 14 0 1 1 18 21 0 1 2 0 0
                                    0 10 1 1 0 6 0 1 3 0 0 6 0 8 1 3 0 0 0 0 8
                                    1 3 0 0 0 0 8 1 3 0 0 6 0 8 1 1 0 32 0 1 2
                                    0 14 8 0 1 2 15 17 17 0 1 1 15 16 0 1 2 0 0
                                    0 10 1 1 0 6 0 1 2 0 33 22 0 1 2 22 0 0 6 1
                                    1 0 14 0 1 2 14 14 22 0 1 3 8 0 0 6 6 1 3 8
                                    0 0 5 5 1 2 8 0 0 18 1 2 8 0 0 19 1 2 0 14
                                    0 0 1 2 20 14 6 0 1 1 0 5 0 1 1 0 14 0 1 0
                                    0 0 1 2 0 6 0 8 1 3 0 6 0 8 6 1 2 0 0 0 24
                                    1 2 0 6 0 25 1 2 0 0 0 26 1 2 0 6 0 27 1 2
                                    0 6 0 29 1 2 0 8 0 0 1 2 0 0 0 8 1 2 0 0 0
                                    24 1 2 0 0 0 24 1 2 0 0 0 8 1 1 0 14 0 1 1
                                    0 0 0 1 1 22 0 0 1 1 0 10 0 1 1 0 0 0 1 2
                                    20 10 6 0 1 2 14 10 22 0 1 3 24 0 0 0 8 1 1
                                    0 0 0 1 1 3 31 0 1 1 0 0 5 1 1 22 0 28 1 2
                                    0 0 0 6 1 2 0 0 0 0 1 1 0 0 28 1 2 0 0 0 6
                                    1 2 0 0 6 0 1 2 0 0 0 0 1 1 17 20 0 1 1 0
                                    28 0 1 2 4 14 0 0 1 2 14 14 22 0 1 2 16 14
                                    0 0 1 2 16 14 0 0 1 2 21 14 0 0 1 2 16 14 0
                                    0 1 2 16 14 0 0 1 1 14 10 0 11)))))
           '|lookupComplete|)) 
