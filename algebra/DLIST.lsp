
(SDEFUN |DLIST;elt;%unique%;1| ((|x| (%)) (T3 ("unique")) (% (%)))
        (SPADCALL |x| (QREFELT % 7))) 

(SDEFUN |DLIST;elt;%sort%;2| ((|x| (%)) (T4 ("sort")) (% (%)))
        (SPADCALL |x| (QREFELT % 10))) 

(SDEFUN |DLIST;elt;%countNni;3|
        ((|x| (%)) (T5 ("count")) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 14))) 

(MAKEPROP '|DLIST;coerce;L%;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;L%;4| ((|x| (|List| S)) (% (%))) |x|) 

(MAKEPROP '|DLIST;coerce;%L;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;%L;5| ((|x| (%)) (% (|List| S))) |x|) 

(SDEFUN |DLIST;coerce;%Of;6| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 20))) 

(SDEFUN |DLIST;datalist;L%;7| ((|x| (|List| S)) (% (%)))
        (SPADCALL |x| (QREFELT % 17))) 

(DECLAIM (NOTINLINE |DataList;|)) 

(DEFUN |DataList;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G16 NIL) (#2=#:G15 NIL) (#3=#:G14 NIL)
    (|pv$| NIL) (#4=#:G19 NIL) (#5=#:G20 NIL) (#6=#:G18 NIL) (#7=#:G17 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|DataList| DV$1))
    (LETT % (GETREFV 44))
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
    (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
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

(DEFUN |DataList| (#1=#:G21)
  (SPROG NIL
         (PROG (#2=#:G22)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|DataList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|DataList;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|DataList|)))))))))) 

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;%unique%;1|
              (5 . |sort|) '"sort" |DLIST;elt;%sort%;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;%countNni;3| |DLIST;coerce;L%;4|
              |DLIST;coerce;%L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;%Of;6| |DLIST;datalist;L%;7| (|Boolean|)
              (|Mapping| 6 6) (|List| %) '"value" (|Integer|) '"first" '"rest"
              '"last" (|UniversalSegment| 27) (|Mapping| 6 6 6)
              (|Union| 6 '"failed") (|Mapping| 23 6) (|List| 27)
              (|Mapping| 23 6 6) (|SingleInteger|) (|HashState|) (|List| 40)
              (|Equation| 6) (|String|) (|Void|) (|InputForm|))
           '#(~= 20 |value| 26 |trim| 31 |third| 37 |tail| 42 |swap!| 47
              |split!| 54 |sorted?| 60 |sort!| 71 |sort| 82 |smaller?| 93
              |size?| 99 |sign| 105 |setvalue!| 110 |setrest!| 116 |setlast!|
              122 |setfirst!| 128 |setelt!| 134 |setchildren!| 176 |select!|
              182 |select| 188 |second| 194 |sample| 199 |rightTrim| 203
              |reverse!| 209 |reverse| 214 |rest| 219 |removeDuplicates!| 230
              |removeDuplicates| 235 |remove!| 240 |remove| 252 |reduce| 264
              |qsetrest!| 285 |qsetfirst!| 291 |qsetelt!| 297 |qelt| 304
              |possiblyInfinite?| 310 |positive?| 315 |position| 320 |parts|
              339 |nodes| 344 |node?| 349 |new| 355 |negative?| 361 |more?| 366
              |minIndex| 372 |min| 377 |merge_unique!| 388 |merge_unique| 395
              |merge!| 402 |merge| 415 |members| 428 |member?| 433 |maxIndex|
              439 |max| 444 |map!| 461 |map| 467 |list| 480 |less?| 485
              |leftTrim| 491 |leaves| 497 |leaf?| 502 |latex| 507 |last| 512
              |insert!| 523 |insert| 537 |indices| 551 |index?| 556
              |hashUpdate!| 562 |hash| 568 |first| 573 |find| 584 |fill!| 590
              |explicitlyFinite?| 596 |every?| 601 |eval| 607 |eq?| 633
              |entry?| 639 |entries| 645 |empty?| 650 |empty| 655 |elt| 659
              |distance| 720 |delete!| 726 |delete| 738 |datalist| 750
              |cyclic?| 755 |cycleTail| 760 |cycleSplit!| 765 |cycleLength| 770
              |cycleEntry| 775 |count| 780 |copyInto!| 792 |copy| 799 |convert|
              804 |construct| 809 |concat!| 814 |concat| 831 |coerce| 854
              |children| 869 |child?| 874 |any?| 880 >= 886 > 892 = 898 <= 904
              < 910 |#| 916)
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
                 (|IndexedAggregate| 27 6) (|RecursiveAggregate| 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 27 6) (|Aggregate|) (|ConvertibleTo| 43)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 19)
                 (|InnerEvalable| 6 6) (|Eltable| 27 6) (|Type|)
                 (|Eltable| 31 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 43
                                  '(1 0 0 0 7 1 0 0 0 10 1 0 13 0 14 1 5 19 0
                                    20 2 22 23 0 0 1 1 0 6 0 1 2 21 0 0 6 1 1 0
                                    6 0 1 1 0 0 0 1 3 23 42 0 27 27 1 2 23 0 0
                                    13 1 1 17 23 0 1 2 14 23 36 0 1 2 25 0 36 0
                                    1 1 24 0 0 1 1 17 0 0 10 2 14 0 36 0 1 2 20
                                    23 0 0 1 2 0 23 0 13 1 1 16 27 0 1 2 23 6 0
                                    6 1 2 23 0 0 0 1 2 23 6 0 6 1 2 23 6 0 6 1
                                    3 23 6 0 26 6 1 3 23 6 0 28 6 1 3 23 0 0 29
                                    0 1 3 23 6 0 30 6 1 3 23 6 0 31 6 1 3 23 6
                                    0 27 6 1 2 23 0 0 25 1 2 0 0 34 0 1 2 14 0
                                    34 0 1 1 0 6 0 1 0 0 0 1 2 21 0 0 6 1 1 25
                                    0 0 1 1 14 0 0 1 1 0 0 0 1 2 0 0 0 13 1 1 4
                                    0 0 1 1 21 0 0 7 2 0 0 34 0 1 2 4 0 6 0 1 2
                                    21 0 6 0 1 2 14 0 34 0 1 4 21 6 32 0 6 6 1
                                    2 14 6 32 0 1 3 14 6 32 0 6 1 2 23 0 0 0 1
                                    2 23 6 0 6 1 3 23 6 0 27 6 1 2 0 6 0 27 1 1
                                    0 23 0 1 1 16 23 0 1 2 21 27 6 0 1 3 21 27
                                    6 0 27 1 2 14 27 34 0 1 1 14 5 0 1 1 0 25 0
                                    1 2 4 23 0 0 1 2 0 0 13 6 1 1 16 23 0 1 2 0
                                    23 0 13 1 1 13 27 0 1 1 17 6 0 1 2 17 0 0 0
                                    1 3 4 0 36 0 0 1 3 21 0 36 0 0 1 3 0 0 36 0
                                    0 1 2 1 0 0 0 1 2 17 0 0 0 1 3 14 0 36 0 0
                                    1 1 14 5 0 1 2 21 23 6 0 1 1 13 27 0 1 1 17
                                    6 0 1 2 17 0 0 0 1 2 14 6 36 0 1 2 23 0 24
                                    0 1 2 0 0 24 0 1 3 0 0 32 0 0 1 1 0 0 6 1 2
                                    0 23 0 13 1 2 21 0 0 6 1 1 0 5 0 1 1 0 23 0
                                    1 1 19 41 0 1 1 0 6 0 1 2 0 0 0 13 1 3 0 0
                                    6 0 27 1 3 0 0 0 0 27 1 3 0 0 6 0 27 1 3 0
                                    0 0 0 27 1 1 0 35 0 1 2 0 23 27 0 1 2 15 38
                                    38 0 1 1 15 37 0 1 1 0 6 0 1 2 0 0 0 13 1 2
                                    0 33 34 0 1 2 23 0 0 6 1 1 0 23 0 1 2 14 23
                                    34 0 1 2 8 0 0 39 1 2 8 0 0 40 1 3 8 0 0 5
                                    5 1 3 8 0 0 6 6 1 2 0 23 0 0 1 2 21 23 6 0
                                    1 1 0 5 0 1 1 0 23 0 1 0 0 0 1 2 0 6 0 26 1
                                    2 0 6 0 28 1 2 0 0 0 29 1 2 0 6 0 30 1 2 0
                                    0 0 31 1 2 0 6 0 27 1 3 0 6 0 27 6 1 2 0 0
                                    0 8 9 2 0 13 0 15 16 2 0 0 0 11 12 2 0 27 0
                                    0 1 2 0 0 0 27 1 2 0 0 0 31 1 2 0 0 0 27 1
                                    2 0 0 0 31 1 1 0 0 5 22 1 0 23 0 1 1 0 0 0
                                    1 1 23 0 0 1 1 0 13 0 1 1 0 0 0 1 2 21 13 6
                                    0 1 2 14 13 34 0 1 3 25 0 0 0 27 1 1 0 0 0
                                    1 1 3 43 0 1 1 0 0 5 1 2 0 0 0 6 1 2 0 0 0
                                    0 1 1 23 0 25 1 2 0 0 0 0 1 2 0 0 6 0 1 2 0
                                    0 0 6 1 1 0 0 25 1 1 0 5 0 18 1 0 0 5 17 1
                                    18 19 0 21 1 0 25 0 1 2 4 23 0 0 1 2 14 23
                                    34 0 1 2 17 23 0 0 1 2 17 23 0 0 1 2 22 23
                                    0 0 1 2 17 23 0 0 1 2 17 23 0 0 1 1 14 13 0
                                    14)))))
           '|lookupComplete|)) 
