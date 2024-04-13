
(SDEFUN |BITS;bits;NniB%;1|
        ((|n| (|NonNegativeInteger|)) (|b| (|Boolean|)) (% (%)))
        (SPADCALL |n| |b| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |Bits;|)) 

(DEFUN |Bits| ()
  (SPROG NIL
         (PROG (#1=#:G19)
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

(DEFUN |Bits;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G17 NIL))
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
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 64))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 128))
          (AND #1# (|HasCategory| (|Boolean|) '(|Hashable|))
               (|augmentPredVector| % 256))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 512))
          (AND #1# (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 1024))
          (AND #1# (|HasCategory| (|Boolean|) '(|BasicType|))
               (|augmentPredVector| % 2048))
          (AND #1# (|HasCategory| (|Boolean|) '(|OrderedSet|))
               (|augmentPredVector| % 4096))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|Bits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedBits| (NRTEVAL 1))
              (|NonNegativeInteger|) (|Boolean|) (0 . |new|)
              |BITS;bits;NniB%;1| (|List| 11) (|Equation| 7) (|List| 7)
              (|Mapping| 7 7 7) (|Integer|) (|SingleInteger|) (|HashState|)
              (|InputForm|) (|Mapping| 7 7) (|Void|) (|UniversalSegment| 14)
              (|List| 14) (|Union| 7 '"failed") (|List| %) (|OutputForm|)
              (|String|))
           '#(~= 6 ~ 12 |xor| 17 |true| 23 |trim| 27 |swap!| 33 |sorted?| 40
              |sort!| 51 |sort| 62 |smaller?| 73 |size?| 79 |setelt!| 85
              |select| 99 |sample| 105 |rightTrim| 109 |reverse!| 115 |reverse|
              120 |removeDuplicates| 125 |remove| 130 |reduce| 142 |qsetelt!|
              163 |qelt| 170 |position| 176 |parts| 195 |or| 200 |not| 206
              |nor| 211 |new| 217 |nand| 223 |more?| 229 |minIndex| 235 |min|
              240 |merge| 251 |members| 264 |member?| 269 |maxIndex| 275 |max|
              280 |map!| 297 |map| 303 |less?| 316 |leftTrim| 322 |latex| 328
              |insert| 333 |indices| 347 |index?| 352 |hashUpdate!| 358 |hash|
              364 |first| 369 |find| 380 |fill!| 386 |false| 392 |every?| 396
              |eval| 402 |eq?| 428 |entry?| 434 |entries| 440 |empty?| 445
              |empty| 450 |elt| 454 |delete| 473 |count| 485 |copyInto!| 497
              |copy| 504 |convert| 509 |construct| 514 |concat| 519 |coerce|
              542 |bits| 547 |any?| 553 |and| 559 |_\|_| 565 |\\/| 569 T$ 575
              >= 579 > 585 = 591 <= 597 < 603 |/\\| 609 |#| 615)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2
                                  0 0 0 0 0 0 0 0 1 3))
            (CONS
             '#(|BitAggregate&| |OneDimensionalArrayAggregate&| |Logic&| NIL
                NIL |LinearAggregate&| NIL NIL |OrderedSet&| |Collection&|
                |IndexedAggregate&| NIL NIL NIL NIL |HomogeneousAggregate&| NIL
                NIL |EltableAggregate&| |Aggregate&| |SetCategory&| |Evalable&|
                |Hashable&| NIL NIL NIL NIL NIL |BasicType&| |PartialOrder&|
                NIL |InnerEvalable&| NIL)
             (CONS
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 7) (|Logic|)
                 (|FiniteLinearAggregate| 7) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 7) (|DistributiveLattice|)
                 (|BoundedLattice|) (|OrderedSet|) (|Collection| 7)
                 (|IndexedAggregate| 14 7) (|Lattice|)
                 (|BoundedJoinSemilattice|) (|BoundedMeetSemilattice|)
                 (|Comparable|) (|HomogeneousAggregate| 7) (|JoinSemilattice|)
                 (|MeetSemilattice|) (|EltableAggregate| 14 7) (|Aggregate|)
                 (|SetCategory|) (|Evalable| 7) (|Hashable|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 20 $$)
                 (|Eltable| 14 7) (|Type|) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 24) (|InnerEvalable| 7 7) (|ConvertibleTo| 17))
              (|makeByteWordVec2| 25
                                  '(2 0 0 6 7 8 2 0 7 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 0 0 0 1 2 12 0 0 7 1 3 7 19 0 14 14 1 1
                                    13 7 0 1 2 8 7 13 0 1 1 10 0 0 1 2 11 0 13
                                    0 1 1 13 0 0 1 2 8 0 13 0 1 2 0 7 0 0 1 2 0
                                    7 0 6 1 3 7 7 0 14 7 1 3 7 7 0 20 7 1 2 8 0
                                    18 0 1 0 0 0 1 2 12 0 0 7 1 1 11 0 0 1 1 8
                                    0 0 1 1 12 0 0 1 2 12 0 7 0 1 2 8 0 18 0 1
                                    4 12 7 13 0 7 7 1 3 8 7 13 0 7 1 2 8 7 13 0
                                    1 3 7 7 0 14 7 1 2 0 7 0 14 1 2 12 14 7 0 1
                                    3 12 14 7 0 14 1 2 8 14 18 0 1 1 8 12 0 1 2
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 6 7 8
                                    2 0 0 0 0 1 2 0 7 0 6 1 1 5 14 0 1 1 13 7 0
                                    1 2 0 0 0 0 1 2 13 0 0 0 1 3 8 0 13 0 0 1 1
                                    8 12 0 1 2 12 7 7 0 1 1 5 14 0 1 1 13 7 0 1
                                    2 8 7 13 0 1 2 0 0 0 0 1 2 7 0 18 0 1 2 0 0
                                    18 0 1 3 0 0 13 0 0 1 2 0 7 0 6 1 2 12 0 0
                                    7 1 1 0 25 0 1 3 0 0 7 0 14 1 3 0 0 0 0 14
                                    1 1 0 21 0 1 2 0 7 14 0 1 2 9 16 16 0 1 1 9
                                    15 0 1 1 5 7 0 1 2 0 0 0 6 1 2 0 22 18 0 1
                                    2 7 0 0 7 1 0 0 0 1 2 8 7 18 0 1 2 1 0 0 10
                                    1 2 1 0 0 11 1 3 1 0 0 12 12 1 3 1 0 0 7 7
                                    1 2 0 7 0 0 1 2 12 7 7 0 1 1 0 12 0 1 1 0 7
                                    0 1 0 0 0 1 2 0 7 0 14 1 3 0 7 0 14 7 1 2 0
                                    0 0 20 1 2 0 0 0 14 1 2 0 0 0 20 1 2 12 6 7
                                    0 1 2 8 6 18 0 1 3 11 0 0 0 14 1 1 0 0 0 1
                                    1 3 17 0 1 1 0 0 12 1 2 0 0 0 7 1 2 0 0 7 0
                                    1 1 0 0 23 1 2 0 0 0 0 1 1 0 24 0 1 2 0 0 6
                                    7 9 2 8 7 18 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0
                                    0 0 1 0 0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 7
                                    0 0 1 2 0 7 0 0 1 2 0 7 0 0 1 2 0 0 0 0 1 1
                                    8 6 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|Bits| 'NILADIC T) 
