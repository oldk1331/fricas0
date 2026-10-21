
(SDEFUN |ILIST;minIndex;%I;1| ((|x| (%)) (% (|Integer|))) (QREFELT % 7)) 

(SDEFUN |ILIST;maxIndex;%I;2| ((|x| (%)) (% (|Integer|)))
        (- (+ (QREFELT % 7) (SPADCALL |x| (QREFELT % 11))) 1)) 

(DECLAIM (NOTINLINE |IndexedList;|)) 

(DEFUN |IndexedList;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G11 NIL) (#2=#:G10 NIL)
    (#3=#:G9 NIL) (|pv$| NIL) (#4=#:G14 NIL) (#5=#:G15 NIL) (#6=#:G13 NIL)
    (#7=#:G12 NIL))
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
                                            #2#)
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|IndexedList| (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (LETT #4# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 8192))
    (AND (|HasCategory| |#1| '(|Hashable|)) #4# (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|SetWithZero|)) #4# (|augmentPredVector| % 32768))
    (AND
     (LETT #5#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 65536))
    (AND (OR #3# (AND #1# #4#) #5#) (|augmentPredVector| % 131072))
    (AND (OR (AND #1# #4#) #5# #2#) (|augmentPredVector| % 262144))
    (AND (OR (AND #1# #4#) #5#) (|augmentPredVector| % 524288))
    (AND
     (LETT #6#
           (AND (|HasCategory| |#1| '(|BasicType|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 1048576))
    (AND
     (OR #6# (AND #1# #4#) (AND (|HasCategory| |#1| '(|Hashable|)) #4#) #5#
         #2#)
     (|augmentPredVector| % 2097152))
    (AND (LETT #7# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 4194304))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #4# #7#
         (|augmentPredVector| % 8388608))
    (AND #4# #7# (|augmentPredVector| % 16777216))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |IndexedList| (&REST #1=#:G16)
  (SPROG NIL
         (PROG (#2=#:G17)
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

(MAKEPROP '|IndexedList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|) (|local| |#2|)
              (|Integer|) |ILIST;minIndex;%I;1| (|NonNegativeInteger|)
              (0 . |#|) |ILIST;maxIndex;%I;2| (|Boolean|) (|Mapping| 6 6)
              (|List| %) '"value" '"first" '"rest" '"last"
              (|UniversalSegment| 8) (|Mapping| 6 6 6) (|Union| 6 '"failed")
              (|Mapping| 13 6) (|List| 8) (|Mapping| 13 6 6) (|SingleInteger|)
              (|HashState|) (|List| 29) (|Equation| 6) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#(~= 5 |value| 11 |trim| 16 |third| 22 |tail| 27 |swap!| 32
              |split!| 39 |sorted?| 45 |sort!| 56 |sort| 67 |smaller?| 78
              |size?| 84 |sign| 90 |setvalue!| 95 |setrest!| 101 |setlast!| 107
              |setfirst!| 113 |setelt!| 119 |setchildren!| 161 |select!| 167
              |select| 173 |second| 179 |sample| 184 |rightTrim| 188 |reverse!|
              194 |reverse| 199 |rest| 204 |removeDuplicates!| 215
              |removeDuplicates| 220 |remove!| 225 |remove| 237 |reduce| 249
              |qsetrest!| 270 |qsetfirst!| 276 |qsetelt!| 282 |qelt| 289
              |possiblyInfinite?| 295 |positive?| 300 |position| 305 |parts|
              324 |nodes| 329 |node?| 334 |new| 340 |negative?| 346 |more?| 351
              |minIndex| 357 |min| 362 |merge_unique!| 373 |merge_unique| 380
              |merge!| 387 |merge| 400 |members| 413 |member?| 418 |maxIndex|
              424 |max| 429 |map!| 446 |map| 452 |list| 465 |less?| 470
              |leftTrim| 476 |leaves| 482 |leaf?| 487 |latex| 492 |last| 497
              |insert!| 508 |insert| 522 |indices| 536 |index?| 541
              |hashUpdate!| 547 |hash| 553 |first| 558 |find| 569 |fill!| 575
              |explicitlyFinite?| 581 |every?| 586 |eval| 592 |eq?| 618
              |entry?| 624 |entries| 630 |empty?| 635 |empty| 640 |elt| 644
              |distance| 687 |delete!| 693 |delete| 705 |cyclic?| 717
              |cycleTail| 722 |cycleSplit!| 727 |cycleLength| 732 |cycleEntry|
              737 |count| 742 |copyInto!| 754 |copy| 761 |convert| 766
              |construct| 771 |concat!| 776 |concat| 793 |coerce| 816
              |children| 821 |child?| 826 |any?| 832 >= 838 > 844 = 850 <= 856
              < 862 |#| 868)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 0 0 1 0 6 0 0 0 6 0 2 9 8 0 0 3 10 1 12
                                  8 0 0 0 0 0))
            (CONS
             '#(|ListAggregate&| NIL |ExtensibleLinearAggregate&|
                |StreamAggregate&| |LinearAggregate&| |OrderedSet&|
                |UnaryRecursiveAggregate&| NIL |Collection&|
                |IndexedAggregate&| |RecursiveAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|ListAggregate| 6) (|FiniteLinearAggregate| 6)
                 (|ExtensibleLinearAggregate| 6) (|StreamAggregate| 6)
                 (|LinearAggregate| 6) (|OrderedSet|)
                 (|UnaryRecursiveAggregate| 6) (|Comparable|) (|Collection| 6)
                 (|IndexedAggregate| 8 6) (|RecursiveAggregate| 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 8 6) (|Aggregate|) (|ConvertibleTo| 33)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 30)
                 (|InnerEvalable| 6 6) (|Eltable| 8 6) (|Type|)
                 (|Eltable| 20 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 33
                                  '(1 0 10 0 11 2 22 13 0 0 1 1 0 6 0 1 2 21 0
                                    0 6 1 1 0 6 0 1 1 0 0 0 1 3 23 32 0 8 8 1 2
                                    23 0 0 10 1 1 17 13 0 1 2 14 13 25 0 1 2 25
                                    0 25 0 1 1 24 0 0 1 1 17 0 0 1 2 14 0 25 0
                                    1 2 20 13 0 0 1 2 0 13 0 10 1 1 16 8 0 1 2
                                    23 6 0 6 1 2 23 0 0 0 1 2 23 6 0 6 1 2 23 6
                                    0 6 1 3 23 6 0 16 6 1 3 23 6 0 17 6 1 3 23
                                    0 0 18 0 1 3 23 6 0 19 6 1 3 23 6 0 20 6 1
                                    3 23 6 0 8 6 1 2 23 0 0 15 1 2 0 0 23 0 1 2
                                    14 0 23 0 1 1 0 6 0 1 0 0 0 1 2 21 0 0 6 1
                                    1 25 0 0 1 1 14 0 0 1 1 0 0 0 1 2 0 0 0 10
                                    1 1 4 0 0 1 1 21 0 0 1 2 0 0 23 0 1 2 4 0 6
                                    0 1 2 21 0 6 0 1 2 14 0 23 0 1 4 21 6 21 0
                                    6 6 1 3 14 6 21 0 6 1 2 14 6 21 0 1 2 23 0
                                    0 0 1 2 23 6 0 6 1 3 23 6 0 8 6 1 2 0 6 0 8
                                    1 1 0 13 0 1 1 16 13 0 1 3 21 8 6 0 8 1 2
                                    21 8 6 0 1 2 14 8 23 0 1 1 14 5 0 1 1 0 15
                                    0 1 2 4 13 0 0 1 2 0 0 10 6 1 1 16 13 0 1 2
                                    0 13 0 10 1 1 13 8 0 9 1 17 6 0 1 2 17 0 0
                                    0 1 3 4 0 25 0 0 1 3 21 0 25 0 0 1 3 0 0 25
                                    0 0 1 2 1 0 0 0 1 2 17 0 0 0 1 3 14 0 25 0
                                    0 1 1 14 5 0 1 2 21 13 6 0 1 1 13 8 0 12 1
                                    17 6 0 1 2 17 0 0 0 1 2 14 6 25 0 1 2 23 0
                                    14 0 1 2 0 0 14 0 1 3 0 0 21 0 0 1 1 0 0 6
                                    1 2 0 13 0 10 1 2 21 0 0 6 1 1 0 5 0 1 1 0
                                    13 0 1 1 19 31 0 1 1 0 6 0 1 2 0 0 0 10 1 3
                                    0 0 0 0 8 1 3 0 0 6 0 8 1 3 0 0 6 0 8 1 3 0
                                    0 0 0 8 1 1 0 24 0 1 2 0 13 8 0 1 2 15 27
                                    27 0 1 1 15 26 0 1 1 0 6 0 1 2 0 0 0 10 1 2
                                    0 22 23 0 1 2 23 0 0 6 1 1 0 13 0 1 2 14 13
                                    23 0 1 2 8 0 0 28 1 3 8 0 0 6 6 1 2 8 0 0
                                    29 1 3 8 0 0 5 5 1 2 0 13 0 0 1 2 21 13 6 0
                                    1 1 0 5 0 1 1 0 13 0 1 0 0 0 1 2 0 6 0 16 1
                                    2 0 6 0 17 1 2 0 0 0 18 1 2 0 6 0 19 1 2 0
                                    0 0 20 1 2 0 6 0 8 1 3 0 6 0 8 6 1 2 0 8 0
                                    0 1 2 0 0 0 20 1 2 0 0 0 8 1 2 0 0 0 8 1 2
                                    0 0 0 20 1 1 0 13 0 1 1 0 0 0 1 1 23 0 0 1
                                    1 0 10 0 1 1 0 0 0 1 2 21 10 6 0 1 2 14 10
                                    23 0 1 3 25 0 0 0 8 1 1 0 0 0 1 1 3 33 0 1
                                    1 0 0 5 1 2 0 0 0 0 1 2 0 0 0 6 1 1 23 0 15
                                    1 2 0 0 6 0 1 2 0 0 0 0 1 2 0 0 0 6 1 1 0 0
                                    15 1 1 18 30 0 1 1 0 15 0 1 2 4 13 0 0 1 2
                                    14 13 23 0 1 2 17 13 0 0 1 2 17 13 0 0 1 2
                                    22 13 0 0 1 2 17 13 0 0 1 2 17 13 0 0 1 1
                                    14 10 0 11)))))
           '|lookupComplete|)) 
