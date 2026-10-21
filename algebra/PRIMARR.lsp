
(MAKEPROP '|PRIMARR;#;%Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |PRIMARR;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|))) (QVSIZE |x|)) 

(MAKEPROP '|PRIMARR;minIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |PRIMARR;minIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(MAKEPROP '|PRIMARR;empty;%;3| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |PRIMARR;empty;%;3| ((% (%))) (MAKE-ARRAY 0)) 

(MAKEPROP '|PRIMARR;new;NniS%;4| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |PRIMARR;new;NniS%;4| ((|n| (|NonNegativeInteger|)) (|x| (S)) (% (%)))
        (MAKEARR1 |n| |x|)) 

(MAKEPROP '|PRIMARR;qelt;%IS;5| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;qelt;%IS;5| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(MAKEPROP '|PRIMARR;elt;%IS;6| '|SPADreplace| 'QAREF1) 

(SDEFUN |PRIMARR;elt;%IS;6| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(MAKEPROP '|PRIMARR;qsetelt!;%I2S;7| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;qsetelt!;%I2S;7|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETAREF1 |x| |i| |s|)) 

(MAKEPROP '|PRIMARR;setelt!;%I2S;8| '|SPADreplace| 'QSETAREF1) 

(SDEFUN |PRIMARR;setelt!;%I2S;8|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETAREF1 |x| |i| |s|)) 

(SDEFUN |PRIMARR;fill!;%S%;9| ((|x| (%)) (|s| (S)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G12 NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETAREF1 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |PRIMARR;hashUpdate!;Hs%Hs;10|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG ((|i| NIL) (#1=#:G17 NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT % 19)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(DECLAIM (NOTINLINE |PrimitiveArray;|)) 

(DEFUN |PrimitiveArray;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G27 NIL) (#2=#:G26 NIL) (#3=#:G25 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|PrimitiveArray| DV$1))
    (LETT % (GETREFV 38))
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
    (|haddProp| |$ConstructorCache| '|PrimitiveArray| (LIST DV$1) (CONS 1 %))
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
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV % 20
                (CONS (|dispatchFunction| |PRIMARR;hashUpdate!;Hs%Hs;10|) %))))
    %))) 

(DEFUN |PrimitiveArray| (#1=#:G28)
  (SPROG NIL
         (PROG (#2=#:G29)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|PrimitiveArray;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveArray|)))))))))) 

(MAKEPROP '|PrimitiveArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              |PRIMARR;#;%Nni;1| (|Integer|) |PRIMARR;minIndex;%I;2|
              |PRIMARR;empty;%;3| |PRIMARR;new;NniS%;4| |PRIMARR;qelt;%IS;5|
              |PRIMARR;elt;%IS;6| |PRIMARR;qsetelt!;%I2S;7|
              |PRIMARR;setelt!;%I2S;8| |PRIMARR;fill!;%S%;9| (|HashState|)
              (0 . |hashUpdate!|) (6 . |hashUpdate!|) (|Boolean|)
              (|Mapping| 6 6) (|List| 6) (|List| 9) (|Union| 6 '"failed")
              (|Mapping| 21 6) (|UniversalSegment| 9) (|Mapping| 6 6 6)
              (|List| %) (|Mapping| 21 6 6) (|SingleInteger|) (|Equation| 6)
              (|List| 32) (|OutputForm|) (|String|) (|Void|) (|InputForm|))
           '#(~= 12 |trim| 18 |swap!| 24 |sorted?| 31 |sort!| 42 |sort| 53
              |smaller?| 64 |size?| 70 |sign| 76 |setelt!| 81 |select| 95
              |sample| 101 |rightTrim| 105 |reverse!| 111 |reverse| 116
              |removeDuplicates| 121 |remove| 126 |reduce| 138 |qsetelt!| 159
              |qelt| 166 |positive?| 172 |position| 177 |parts| 196 |new| 201
              |negative?| 207 |more?| 212 |minIndex| 218 |min| 223
              |merge_unique| 234 |merge| 241 |members| 254 |member?| 259
              |maxIndex| 265 |max| 270 |map!| 287 |map| 293 |less?| 306
              |leftTrim| 312 |latex| 318 |insert| 323 |indices| 337 |index?|
              342 |hashUpdate!| 348 |hash| 354 |first| 359 |find| 370 |fill!|
              376 |every?| 382 |eval| 388 |eq?| 414 |entry?| 420 |entries| 426
              |empty?| 431 |empty| 436 |elt| 440 |delete| 459 |count| 471
              |copyInto!| 483 |copy| 490 |convert| 495 |construct| 500 |concat|
              505 |coerce| 528 |any?| 533 >= 539 > 545 = 551 <= 557 < 563 |#|
              569)
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
                 (|Collection| 6) (|IndexedAggregate| 9 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 9 6) (|Aggregate|) (|ConvertibleTo| 37)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 34)
                 (|InnerEvalable| 6 6) (|Eltable| 9 6) (|Type|)
                 (|Eltable| 27 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 37
                                  '(2 6 18 18 0 19 2 0 18 18 0 20 2 25 21 0 0 1
                                    2 16 0 0 6 1 3 14 36 0 9 9 1 1 20 21 0 1 2
                                    15 21 30 0 1 2 17 0 30 0 1 1 18 0 0 1 1 20
                                    0 0 1 2 15 0 30 0 1 2 21 21 0 0 1 2 0 21 0
                                    7 1 1 19 9 0 1 3 14 6 0 9 6 16 3 14 6 0 27
                                    6 1 2 15 0 26 0 1 0 0 0 1 2 16 0 0 6 1 1 17
                                    0 0 1 1 15 0 0 1 1 16 0 0 1 2 16 0 6 0 1 2
                                    15 0 26 0 1 4 16 6 28 0 6 6 1 2 15 6 28 0 1
                                    3 15 6 28 0 6 1 3 14 6 0 9 6 15 2 0 6 0 9
                                    13 1 19 21 0 1 2 16 9 6 0 1 3 16 9 6 0 9 1
                                    2 15 9 26 0 1 1 15 23 0 1 2 0 0 7 6 12 1 19
                                    21 0 1 2 0 21 0 7 1 1 4 9 0 10 1 20 6 0 1 2
                                    20 0 0 0 1 3 16 0 30 0 0 1 2 20 0 0 0 1 3
                                    15 0 30 0 0 1 1 15 23 0 1 2 16 21 6 0 1 1 4
                                    9 0 1 1 20 6 0 1 2 20 0 0 0 1 2 15 6 30 0 1
                                    2 14 0 22 0 1 2 0 0 22 0 1 3 0 0 28 0 0 1 2
                                    0 21 0 7 1 2 16 0 0 6 1 1 22 35 0 1 3 0 0 6
                                    0 9 1 3 0 0 0 0 9 1 1 0 24 0 1 2 0 21 9 0 1
                                    2 24 18 18 0 20 1 24 31 0 1 2 0 0 0 7 1 1 4
                                    6 0 1 2 0 25 26 0 1 2 14 0 0 6 17 2 15 21
                                    26 0 1 2 9 0 0 32 1 2 9 0 0 33 1 3 9 0 0 6
                                    6 1 3 9 0 0 23 23 1 2 0 21 0 0 1 2 16 21 6
                                    0 1 1 0 23 0 1 1 0 21 0 1 0 0 0 11 3 0 6 0
                                    9 6 1 2 0 6 0 9 14 2 0 0 0 27 1 2 0 0 0 9 1
                                    2 0 0 0 27 1 2 16 7 6 0 1 2 15 7 26 0 1 3
                                    17 0 0 0 9 1 1 0 0 0 1 1 3 37 0 1 1 0 0 23
                                    1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0 1 1 0 0
                                    29 1 1 23 34 0 1 2 15 21 26 0 1 2 20 21 0 0
                                    1 2 20 21 0 0 1 2 25 21 0 0 1 2 20 21 0 0 1
                                    2 20 21 0 0 1 1 15 7 0 8)))))
           '|lookupComplete|)) 
