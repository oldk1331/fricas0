
(SDEFUN |BITS;bits;NniB%;1|
        ((|n| (|NonNegativeInteger|)) (|b| (|Boolean|)) (% (%)))
        (SPADCALL |n| |b| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |Bits;|)) 

(DEFUN |Bits;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G6 NIL))
         (PROGN
          (LETT |dv$| '(|Bits|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory| (|Boolean|)
                                                              '(|Evalable|
                                                                (|Boolean|)))
                                               (|HasCategory| (|Boolean|)
                                                              '(|SetCategory|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|Hashable|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Boolean|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Integer|)
                                                             '(|OrderedSet|))
                                              (|HasCategory| (|Boolean|)
                                                             '(|BasicType|))))))
          (|haddProp| |$ConstructorCache| '|Bits| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 64))
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 128))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 256))
          (AND #1# (|HasCategory| (|Boolean|) '(|Hashable|))
               (|augmentPredVector| % 512))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 1024))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 2048))
          (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| % 4096))
          (AND #1# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 8192))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Bits| ()
  (SPROG NIL
         (PROG (#1=#:G8)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|Bits|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|Bits|
                             (LIST (CONS NIL (CONS 1 (|Bits;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|Bits|)))))))))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB%;1| (|String|) (|OutputForm|) (|Integer|)
              (|UniversalSegment| 12) (|Mapping| 7 7 7) (|List| %) (|List| 7)
              (|Union| 7 '"failed") (|Mapping| 7 7) (|List| 12) (|HashState|)
              (|SingleInteger|) (|List| 23) (|Equation| 7) (|Void|)
              (|InputForm|))
           '#(~= 6 ~ 12 |xor| 17 |true| 23 |trim| 27 |swap!| 33 |sorted?| 40
              |sort!| 51 |sort| 62 |smaller?| 73 |size?| 79 |sign| 85 |setelt!|
              90 |select| 104 |sample| 110 |rightTrim| 114 |reverse!| 120
              |reverse| 125 |removeDuplicates| 130 |remove| 135 |reduce| 147
              |qsetelt!| 168 |qelt| 175 |positive?| 181 |position| 186 |parts|
              205 |or| 210 |not| 216 |nor| 221 |new| 227 |negative?| 233 |nand|
              238 |more?| 244 |minIndex| 250 |min| 255 |merge_unique| 266
              |merge| 273 |members| 286 |member?| 291 |maxIndex| 297 |max| 302
              |map!| 319 |map| 325 |less?| 338 |leftTrim| 344 |latex| 350
              |insert| 355 |indices| 369 |index?| 374 |hashUpdate!| 380 |hash|
              386 |first| 391 |find| 402 |fill!| 408 |false| 414 |every?| 418
              |eval| 424 |eq?| 450 |entry?| 456 |entries| 462 |empty?| 467
              |empty| 472 |elt| 476 |delete| 495 |count| 507 |copyInto!| 519
              |copy| 526 |convert| 531 |construct| 536 |concat| 541 |coerce|
              564 |bits| 569 |any?| 575 |and| 581 |_\|_| 587 |\\/| 591 T 597 >=
              601 > 607 = 613 <= 619 < 625 |/\\| 631 |#| 637)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 0 0
                                  0 3 1 0 0 0 0 0 0 0 0))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&| |Logic&| NIL
                NIL |LinearAggregate&| NIL NIL |OrderedSet&| NIL NIL NIL
                |IndexedAggregate&| |Collection&| NIL NIL NIL
                |HomogeneousAggregate&| NIL |Hashable&| |Evalable&|
                |SetCategory&| |Aggregate&| |EltableAggregate&| NIL
                |InnerEvalable&| NIL |PartialOrder&| |BasicType&| NIL NIL NIL
                NIL NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7) (|Logic|)
                 (|FiniteLinearAggregate| 7) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 7) (|BoundedLattice|)
                 (|DistributiveLattice|) (|OrderedSet|)
                 (|BoundedMeetSemilattice|) (|BoundedJoinSemilattice|)
                 (|Lattice|) (|IndexedAggregate| 12 7) (|Collection| 7)
                 (|Comparable|) (|MeetSemilattice|) (|JoinSemilattice|)
                 (|HomogeneousAggregate| 7) (|ComparableRepresentation|)
                 (|Hashable|) (|Evalable| 7) (|SetCategory|) (|Aggregate|)
                 (|EltableAggregate| 12 7) (|ConvertibleTo| 25)
                 (|InnerEvalable| 7 7) (|CoercibleTo| 11) (|PartialOrder|)
                 (|BasicType|) (|Type|) (|Eltable| 12 7) (|Eltable| 13 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 13 0 0 7 1 3 8 24 0 12 12 1 1
                                    14 7 0 1 2 9 7 14 0 1 2 12 0 14 0 1 1 11 0
                                    0 1 1 14 0 0 1 2 9 0 14 0 1 2 0 7 0 0 1 2 0
                                    7 0 6 1 1 7 12 0 1 3 8 7 0 13 7 1 3 8 7 0
                                    12 7 1 2 9 0 18 0 1 0 0 0 1 2 13 0 0 7 1 1
                                    12 0 0 1 1 9 0 0 1 1 13 0 0 1 2 13 0 7 0 1
                                    2 9 0 18 0 1 4 13 7 14 0 7 7 1 2 9 7 14 0 1
                                    3 9 7 14 0 7 1 3 8 7 0 12 7 1 2 0 7 0 12 1
                                    1 7 7 0 1 3 13 12 7 0 12 1 2 13 12 7 0 1 2
                                    9 12 18 0 1 1 9 16 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 6 7 8 1 7 7 0 1 2 0 0 0
                                    0 1 2 0 7 0 6 1 1 5 12 0 1 2 0 0 0 0 1 1 14
                                    7 0 1 3 13 0 14 0 0 1 2 14 0 0 0 1 3 9 0 14
                                    0 0 1 1 9 16 0 1 2 13 7 7 0 1 1 5 12 0 1 2
                                    0 0 0 0 1 1 14 7 0 1 2 9 7 14 0 1 2 8 0 18
                                    0 1 3 0 0 14 0 0 1 2 0 0 18 0 1 2 0 7 0 6 1
                                    2 13 0 0 7 1 1 0 10 0 1 3 0 0 7 0 12 1 3 0
                                    0 0 0 12 1 1 0 19 0 1 2 0 7 12 0 1 2 10 20
                                    20 0 1 1 10 21 0 1 2 0 0 0 6 1 1 5 7 0 1 2
                                    0 17 18 0 1 2 8 0 0 7 1 0 0 0 1 2 9 7 18 0
                                    1 3 1 0 0 7 7 1 3 1 0 0 16 16 1 2 1 0 0 22
                                    1 2 1 0 0 23 1 2 0 7 0 0 1 2 13 7 7 0 1 1 0
                                    16 0 1 1 0 7 0 1 0 0 0 1 2 0 0 0 13 1 3 0 7
                                    0 12 7 1 2 0 7 0 12 1 2 0 0 0 13 1 2 0 0 0
                                    12 1 2 13 6 7 0 1 2 9 6 18 0 1 3 12 0 0 0
                                    12 1 1 0 0 0 1 1 3 25 0 1 1 0 0 16 1 1 0 0
                                    15 1 2 0 0 7 0 1 2 0 0 0 0 1 2 0 0 0 7 1 1
                                    0 11 0 1 2 0 0 6 7 9 2 9 7 18 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 7 0 0 1 2
                                    0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7 0 0
                                    1 2 0 0 0 0 1 1 9 6 0 1)))))
           '|lookupComplete|)) 
