
(SDEFUN |DLIST;elt;%unique%;1| ((|x| (%)) (T1 ("unique")) (% (%)))
        (SPADCALL |x| (QREFELT % 7))) 

(SDEFUN |DLIST;elt;%sort%;2| ((|x| (%)) (T2 ("sort")) (% (%)))
        (SPADCALL |x| (QREFELT % 10))) 

(SDEFUN |DLIST;elt;%countNni;3|
        ((|x| (%)) (T3 ("count")) (% (|NonNegativeInteger|)))
        (SPADCALL |x| (QREFELT % 14))) 

(PUT '|DLIST;coerce;L%;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;L%;4| ((|x| (|List| S)) (% (%))) |x|) 

(PUT '|DLIST;coerce;%L;5| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |DLIST;coerce;%L;5| ((|x| (%)) (% (|List| S))) |x|) 

(SDEFUN |DLIST;coerce;%Of;6| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 18)) (QREFELT % 20))) 

(SDEFUN |DLIST;datalist;L%;7| ((|x| (|List| S)) (% (%)))
        (SPADCALL |x| (QREFELT % 17))) 

(DECLAIM (NOTINLINE |DataList;|)) 

(DEFUN |DataList| (#1=#:G32)
  (SPROG NIL
         (PROG (#2=#:G33)
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

(DEFUN |DataList;| (|#1|)
  (SPROG
   ((#1=#:G28 NIL) (#2=#:G29 NIL) (#3=#:G31 NIL) (#4=#:G30 NIL) (|pv$| NIL)
    (#5=#:G25 NIL) (#6=#:G26 NIL) (#7=#:G27 NIL) (% NIL) (|dv$| NIL)
    (DV$1 NIL))
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
    (|haddProp| |$ConstructorCache| '|DataList| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
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

(MAKEPROP '|DataList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|List| 6) (|local| |#1|)
              (0 . |removeDuplicates|) '"unique" |DLIST;elt;%unique%;1|
              (5 . |sort|) '"sort" |DLIST;elt;%sort%;2| (|NonNegativeInteger|)
              (10 . |#|) '"count" |DLIST;elt;%countNni;3| |DLIST;coerce;L%;4|
              |DLIST;coerce;%L;5| (|OutputForm|) (15 . |coerce|)
              |DLIST;coerce;%Of;6| |DLIST;datalist;L%;7| (|Integer|)
              (|Mapping| 25 6 6) (|Boolean|) (|Mapping| 6 6 6) (|HashState|)
              (|SingleInteger|) (|Equation| 6) (|List| 29) (|String|)
              (|Mapping| 25 6) (|Void|) (|UniversalSegment| 23) '"last" '"rest"
              '"first" (|List| %) '"value" (|Mapping| 6 6) (|InputForm|)
              (|List| 23) (|Union| 6 '"failed"))
           '#(~= 20 |value| 26 |trim| 31 |third| 37 |tail| 42 |swap!| 47
              |split!| 54 |sorted?| 60 |sort!| 71 |sort| 82 |smaller?| 93
              |size?| 99 |setvalue!| 105 |setrest!| 111 |setlast!| 117
              |setfirst!| 123 |setelt!| 129 |setchildren!| 171 |select!| 177
              |select| 183 |second| 189 |sample| 194 |rightTrim| 198 |reverse!|
              204 |reverse| 209 |rest| 214 |removeDuplicates!| 225
              |removeDuplicates| 230 |remove!| 235 |remove| 247 |reduce| 259
              |qsetrest!| 280 |qsetfirst!| 286 |qsetelt!| 292 |qelt| 299
              |possiblyInfinite?| 305 |position| 310 |parts| 329 |nodes| 334
              |node?| 339 |new| 345 |more?| 351 |minIndex| 357 |min| 362
              |merge!| 373 |merge| 386 |members| 399 |member?| 404 |maxIndex|
              410 |max| 415 |map!| 432 |map| 438 |list| 451 |less?| 456
              |leftTrim| 462 |leaves| 468 |leaf?| 473 |latex| 478 |last| 483
              |insert!| 494 |insert| 508 |indices| 522 |index?| 527
              |hashUpdate!| 533 |hash| 539 |first| 544 |find| 555 |fill!| 561
              |explicitlyFinite?| 567 |every?| 572 |eval| 578 |eq?| 604
              |entry?| 610 |entries| 616 |empty?| 621 |empty| 626 |elt| 630
              |distance| 691 |delete!| 697 |delete| 709 |datalist| 721
              |cyclic?| 726 |cycleTail| 731 |cycleSplit!| 736 |cycleLength| 741
              |cycleEntry| 746 |count| 751 |copyInto!| 763 |copy| 770 |convert|
              775 |construct| 780 |concat!| 785 |concat| 802 |coerce| 825
              |children| 840 |child?| 845 |any?| 851 >= 857 > 863 = 869 <= 875
              < 881 |#| 887)
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
                 (|RecursiveAggregate| 6) (|IndexedAggregate| 23 6)
                 (|Collection| 6) (|OrderedSet|) (|HomogeneousAggregate| 6)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 23 6)
                 (|Evalable| 6) (|SetCategory|) (|Hashable|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 34 $$)
                 (|Type|) (|Eltable| 23 6) (|InnerEvalable| 6 6)
                 (|CoercibleTo| 19) (|PartialOrder|) (|BasicType|)
                 (|ConvertibleTo| 41))
              (|makeByteWordVec2| 43
                                  '(1 0 0 0 7 1 0 0 0 10 1 0 13 0 14 1 5 19 0
                                    20 2 21 25 0 0 1 1 0 6 0 1 2 20 0 0 6 1 1 0
                                    6 0 1 1 0 0 0 1 3 22 33 0 23 23 1 2 22 0 0
                                    13 1 1 16 25 0 1 2 14 25 24 0 1 1 23 0 0 1
                                    2 24 0 24 0 1 1 16 0 0 10 2 14 0 24 0 1 2
                                    19 25 0 0 1 2 0 25 0 13 1 2 22 6 0 6 1 2 22
                                    0 0 0 1 2 22 6 0 6 1 2 22 6 0 6 1 3 22 6 0
                                    23 6 1 3 22 6 0 34 6 1 3 22 6 0 35 6 1 3 22
                                    0 0 36 0 1 3 22 6 0 37 6 1 3 22 6 0 39 6 1
                                    2 22 0 0 38 1 2 0 0 32 0 1 2 14 0 32 0 1 1
                                    0 6 0 1 0 0 0 1 2 20 0 0 6 1 1 24 0 0 1 1
                                    14 0 0 1 2 0 0 0 13 1 1 0 0 0 1 1 4 0 0 1 1
                                    20 0 0 7 2 4 0 6 0 1 2 0 0 32 0 1 2 20 0 6
                                    0 1 2 14 0 32 0 1 4 20 6 26 0 6 6 1 3 14 6
                                    26 0 6 1 2 14 6 26 0 1 2 22 0 0 0 1 2 22 6
                                    0 6 1 3 22 6 0 23 6 1 2 0 6 0 23 1 1 0 25 0
                                    1 2 20 23 6 0 1 3 20 23 6 0 23 1 2 14 23 32
                                    0 1 1 14 5 0 1 1 0 38 0 1 2 4 25 0 0 1 2 0
                                    0 13 6 1 2 0 25 0 13 1 1 13 23 0 1 2 16 0 0
                                    0 1 1 16 6 0 1 2 1 0 0 0 1 3 0 0 24 0 0 1 2
                                    16 0 0 0 1 3 14 0 24 0 0 1 1 14 5 0 1 2 20
                                    25 6 0 1 1 13 23 0 1 2 16 0 0 0 1 1 16 6 0
                                    1 2 14 6 24 0 1 2 22 0 40 0 1 3 0 0 26 0 0
                                    1 2 0 0 40 0 1 1 0 0 6 1 2 0 25 0 13 1 2 20
                                    0 0 6 1 1 0 5 0 1 1 0 25 0 1 1 18 31 0 1 2
                                    0 0 0 13 1 1 0 6 0 1 3 0 0 6 0 23 1 3 0 0 0
                                    0 23 1 3 0 0 0 0 23 1 3 0 0 6 0 23 1 1 0 42
                                    0 1 2 0 25 23 0 1 2 15 27 27 0 1 1 15 28 0
                                    1 2 0 0 0 13 1 1 0 6 0 1 2 0 43 32 0 1 2 22
                                    0 0 6 1 1 0 25 0 1 2 14 25 32 0 1 3 8 0 0 5
                                    5 1 2 8 0 0 29 1 3 8 0 0 6 6 1 2 8 0 0 30 1
                                    2 0 25 0 0 1 2 20 25 6 0 1 1 0 5 0 1 1 0 25
                                    0 1 0 0 0 1 2 0 0 0 11 12 2 0 13 0 15 16 2
                                    0 0 0 8 9 3 0 6 0 23 6 1 2 0 6 0 23 1 2 0 0
                                    0 34 1 2 0 6 0 35 1 2 0 0 0 36 1 2 0 6 0 37
                                    1 2 0 6 0 39 1 2 0 23 0 0 1 2 0 0 0 34 1 2
                                    0 0 0 23 1 2 0 0 0 34 1 2 0 0 0 23 1 1 0 0
                                    5 22 1 0 25 0 1 1 0 0 0 1 1 22 0 0 1 1 0 13
                                    0 1 1 0 0 0 1 2 20 13 6 0 1 2 14 13 32 0 1
                                    3 24 0 0 0 23 1 1 0 0 0 1 1 3 41 0 1 1 0 0
                                    5 1 1 22 0 38 1 2 0 0 0 0 1 2 0 0 0 6 1 1 0
                                    0 38 1 2 0 0 0 6 1 2 0 0 0 0 1 2 0 0 6 0 1
                                    1 17 19 0 21 1 0 0 5 17 1 0 5 0 18 1 0 38 0
                                    1 2 4 25 0 0 1 2 14 25 32 0 1 2 16 25 0 0 1
                                    2 16 25 0 0 1 2 21 25 0 0 1 2 16 25 0 0 1 2
                                    16 25 0 0 1 1 14 13 0 14)))))
           '|lookupComplete|)) 
