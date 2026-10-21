
(MAKEPROP '|SEQU;rep| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |SEQU;rep| ((|x| (%)) (% (|Rep|))) |x|) 

(MAKEPROP '|SEQU;per| '|SPADreplace| '(XLAM (|r|) |r|)) 

(SDEFUN |SEQU;per| ((|r| (|Rep|)) (% (%))) |r|) 

(SDEFUN |SEQU;0;%;3| ((% (%)))
        (|SEQU;per| (SPADCALL (LIST (|spadConstant| % 8)) (QREFELT % 10)) %)) 

(SDEFUN |SEQU;elt;%IR;4| ((|mm| (%)) (|n| (|Integer|)) (% (R)))
        (COND ((< |n| 1) (|error| "no such element"))
              ('T (SPADCALL (|SEQU;rep| |mm| %) |n| (QREFELT % 14))))) 

(SDEFUN |SEQU;apply;%PR;5| ((|mm| (%)) (|pi| (|Partition|)) (% (R)))
        (SPROG
         ((|pil| (|List| (|Integer|))) (#1=#:G19 NIL) (|k| NIL) (#2=#:G20 NIL))
         (SEQ (LETT |pil| (SPADCALL |pi| (QREFELT % 18)))
              (EXIT
               (SPADCALL (ELT % 19)
                         (PROGN
                          (LETT #1# NIL)
                          (SEQ (LETT |k| NIL) (LETT #2# |pil|) G190
                               (COND
                                ((OR (ATOM #2#)
                                     (PROGN (LETT |k| (CAR #2#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #1#
                                       (CONS (SPADCALL |mm| |k| (QREFELT % 15))
                                             #1#))))
                               (LETT #2# (CDR #2#)) (GO G190) G191
                               (EXIT (NREVERSE #1#))))
                         (QREFELT % 21)))))) 

(SDEFUN |SEQU;cons;R2%;6| ((|r| (R)) (|s| (%)) (% (%)))
        (|SEQU;per| (SPADCALL |r| (|SEQU;rep| |s| %) (QREFELT % 23)) %)) 

(SDEFUN |SEQU;+;3%;7| ((|x| (%)) (|y| (%)) (% (%)))
        (|SEQU;per|
         (SPADCALL (ELT % 25) (|SEQU;rep| |x| %) (|SEQU;rep| |y| %)
                   (QREFELT % 26))
         %)) 

(SDEFUN |SEQU;-;2%;8| ((|x| (%)) (% (%)))
        (|SEQU;per| (SPADCALL (ELT % 28) (|SEQU;rep| |x| %) (QREFELT % 30)) %)) 

(SDEFUN |SEQU;multiply| ((|x| (%)) (|y| (%)) (% (%)))
        (|SEQU;per|
         (SPADCALL (ELT % 19) (|SEQU;rep| |x| %) (|SEQU;rep| |y| %)
                   (QREFELT % 26))
         %)) 

(SDEFUN |SEQU;*;R2%;10| ((|x| (R)) (|y| (%)) (% (%)))
        (SPROG NIL
               (|SEQU;per|
                (SPADCALL (CONS #'|SEQU;*;R2%;10!0| (VECTOR % |x|))
                          (|SEQU;rep| |y| %) (QREFELT % 30))
                %))) 

(SDEFUN |SEQU;*;R2%;10!0| ((|t| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |t| (QREFELT % 19)))))) 

(SDEFUN |SEQU;=;2%B;11| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL (|SEQU;rep| |x| %) (|SEQU;rep| |y| %) (QREFELT % 34))) 

(SDEFUN |SEQU;coerce;S%;12| ((|x| (|Stream| R)) (% (%))) (|SEQU;per| |x| %)) 

(SDEFUN |SEQU;sequence;S%;13| ((|x| (|Stream| R)) (% (%))) (|SEQU;per| |x| %)) 

(SDEFUN |SEQU;stream;%S;14| ((|x| (%)) (% (|Stream| R))) (|SEQU;rep| |x| %)) 

(SDEFUN |SEQU;first;%Nni%;15| ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (%)))
        (|SEQU;per| (SPADCALL (|SEQU;rep| |x| %) |n| (QREFELT % 39)) %)) 

(SDEFUN |SEQU;firstn;%NniL;16|
        ((|x| (%)) (|n| (|NonNegativeInteger|)) (% (|List| R)))
        (SPADCALL
         (SPADCALL (SPADCALL (|SEQU;rep| |x| %) |n| (QREFELT % 39))
                   (QREFELT % 41))
         (QREFELT % 42))) 

(SDEFUN |SEQU;sequence;MR%;17| ((|f| (|Mapping| R R)) (|r| (R)) (% (%)))
        (|SEQU;per| (SPADCALL |f| |r| (QREFELT % 44)) %)) 

(SDEFUN |SEQU;coerce;%Of;18| ((|mm| (%)) (% (|OutputForm|)))
        (SPADCALL (|SEQU;rep| |mm| %) (QREFELT % 47))) 

(SDEFUN |SEQU;dilate;R2%;19| ((|a| (R)) (|mm| (%)) (% (%)))
        (SPROG ((|apow| (%)))
               (SEQ
                (LETT |apow|
                      (SPADCALL (CONS #'|SEQU;dilate;R2%;19!0| (VECTOR % |a|))
                                |a| (QREFELT % 45)))
                (EXIT (|SEQU;multiply| |apow| |mm| %))))) 

(SDEFUN |SEQU;dilate;R2%;19!0| ((|x| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |x| |a| (QREFELT % 19)))))) 

(DECLAIM (NOTINLINE |Sequence;|)) 

(DEFUN |Sequence;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G48 NIL) (|pv$| NIL) (#2=#:G50 NIL)
    (#3=#:G51 NIL) (#4=#:G49 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Sequence| DV$1))
    (LETT % (GETREFV 68))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#1|)))
                                         (|HasCategory| |#1| '(|SetCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)
                                        (|HasCategory| |#1| '(|BasicType|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))))))
    (|haddProp| |$ConstructorCache| '|Sequence| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (LETT #2# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 1024))
    (AND (|HasCategory| |#1| '(|Hashable|)) #2# (|augmentPredVector| % 2048))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|SetWithZero|)) #2# (|augmentPredVector| % 4096))
    (AND
     (LETT #3#
           (AND (|HasCategory| |#1| '(|OrderedSet|))
                (|HasCategory| % '(|finiteAggregate|))))
     (|augmentPredVector| % 8192))
    (AND (OR (AND (|HasCategory| |#1| '(|Comparable|)) #2#) #3#)
         (|augmentPredVector| % 16384))
    (AND (|HasCategory| |#1| '(|BasicType|)) #2# (|augmentPredVector| % 32768))
    (AND (LETT #4# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 65536))
    (AND (|HasCategory| |#1| '(|OrderedSet|)) #2# #4#
         (|augmentPredVector| % 131072))
    (AND #2# #4# (|augmentPredVector| % 262144))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Stream| |#1|))
    %))) 

(DEFUN |Sequence| (#1=#:G52)
  (SPROG NIL
         (PROG (#2=#:G53)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Sequence|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Sequence;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Sequence|)))))))))) 

(MAKEPROP '|Sequence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Stream| 6) (|local| |#1|) '|Rep| (0 . |0|)
              (|List| 6) (4 . |repeating|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SEQU;0;%;3|) %))
              (9 . |1|) (|Integer|) (13 . |elt|) |SEQU;elt;%IR;4| (|List| 13)
              (|Partition|) (19 . |convert|) (24 . *) (|Mapping| 6 6 6)
              (30 . |reduce|) |SEQU;apply;%PR;5| (36 . |cons|)
              |SEQU;cons;R2%;6| (42 . +) (48 . |map|) |SEQU;+;3%;7| (55 . -)
              (|Mapping| 6 6) (60 . |map|) |SEQU;-;2%;8| |SEQU;*;R2%;10|
              (|Boolean|) |SEQU;=;2%B;11| |SEQU;coerce;S%;12|
              |SEQU;sequence;S%;13| |SEQU;stream;%S;14| (|NonNegativeInteger|)
              (66 . |first|) |SEQU;first;%Nni%;15| (72 . |complete|)
              (77 . |entries|) |SEQU;firstn;%NniL;16| (82 . |stream|)
              |SEQU;sequence;MR%;17| (|OutputForm|) (88 . |coerce|)
              |SEQU;coerce;%Of;18| |SEQU;dilate;R2%;19| (|List| %) '"value"
              '"first" '"rest" '"last" (|UniversalSegment| 13)
              (|Union| 6 '"failed") (|Mapping| 33 6) (|PositiveInteger|)
              (|String|) (|Mapping| 33 6 6) (|HashState|) (|SingleInteger|)
              (|Equation| 6) (|List| 63) (|Void|) (|Union| % '"failed")
              (|InputForm|))
           '#(~= 93 |zero?| 99 |value| 104 |trim| 109 |third| 115 |tail| 120
              |swap!| 125 |subtractIfCan| 132 |stream| 138 |split!| 143
              |sorted?| 149 |sort!| 160 |sort| 171 |smaller?| 182 |size?| 188
              |sign| 194 |setvalue!| 199 |setrest!| 205 |setlast!| 211
              |setfirst!| 217 |setelt!| 223 |setchildren!| 265 |sequence| 271
              |select| 282 |second| 288 |sample| 293 |rst| 297 |rightTrim| 302
              |reverse!| 308 |reverse| 313 |rest| 318 |removeDuplicates| 329
              |remove| 334 |reduce| 346 |qsetrest!| 367 |qsetfirst!| 373
              |qsetelt!| 379 |qelt| 386 |possiblyInfinite?| 392 |positive?| 397
              |position| 402 |parts| 421 |opposite?| 426
              |numberOfComputedEntries| 432 |nodes| 437 |node?| 442 |new| 448
              |negative?| 454 |more?| 459 |minIndex| 465 |min| 470
              |merge_unique| 481 |merge| 488 |members| 501 |member?| 506
              |maxIndex| 512 |max| 517 |map!| 534 |map| 540 |less?| 553
              |leftTrim| 559 |leaves| 565 |leaf?| 570 |lazyEvaluate| 575
              |lazy?| 580 |latex| 585 |last| 590 |insert| 601 |indices| 615
              |index?| 620 |hashUpdate!| 626 |hash| 632 |frst| 637 |firstn| 642
              |first| 648 |find| 659 |fill!| 665 |extend| 671
              |explicitlyFinite?| 677 |explicitlyEmpty?| 682 |explicitEntries?|
              687 |every?| 692 |eval| 698 |eq?| 724 |entry?| 730 |entries| 736
              |empty?| 741 |empty| 746 |elt| 750 |distance| 793 |dilate| 799
              |delete| 805 |cyclic?| 817 |cycleTail| 822 |cycleSplit!| 827
              |cycleLength| 832 |cycleEntry| 837 |count| 842 |copyInto!| 854
              |copy| 861 |convert| 866 |construct| 871 |cons| 876 |concat!| 882
              |concat| 899 |complete| 922 |coerce| 927 |children| 937 |child?|
              942 |apply| 948 |any?| 954 >= 960 > 966 = 972 <= 978 < 984 |0|
              990 - 994 + 1005 * 1011 |#| 1041)
           'NIL
           (CONS
            (|makeByteWordVec2| 5
                                '(0 0 0 0 0 0 0 3 0 3 0 5 0 0 0 4 0 0 1 0 0 0 2
                                  1 0 0 0 0 0))
            (CONS
             '#(NIL |Module&| NIL |LazyStreamAggregate&| NIL NIL
                |StreamAggregate&| |AbelianGroup&| |LinearAggregate&| NIL
                |UnaryRecursiveAggregate&| |AbelianMonoid&| |IndexedAggregate&|
                |Collection&| |RecursiveAggregate&| |SetWithZero&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| |Evalable&|
                |Aggregate&| |EltableAggregate&| |SetCategory&| NIL
                |InnerEvalable&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|SequenceCategory| 6) (|Module| 6) (|BiModule| 6 6)
                 (|LazyStreamAggregate| 6) (|LeftModule| 6) (|RightModule| 6)
                 (|StreamAggregate| 6) (|AbelianGroup|) (|LinearAggregate| 6)
                 (|CancellationAbelianMonoid|) (|UnaryRecursiveAggregate| 6)
                 (|AbelianMonoid|) (|IndexedAggregate| 13 6) (|Collection| 6)
                 (|RecursiveAggregate| 6) (|SetWithZero|)
                 (|HomogeneousAggregate| 6) (|AbelianSemiGroup|) (|Evalable| 6)
                 (|Aggregate|) (|EltableAggregate| 13 6) (|SetCategory|)
                 (|ConvertibleTo| 67) (|InnerEvalable| 6 6) (|Type|)
                 (|Eltable| 13 6) (|Eltable| 55 $$) (|BasicType|)
                 (|CoercibleTo| 46))
              (|makeByteWordVec2| 67
                                  '(0 6 0 8 1 7 0 9 10 0 6 0 12 2 7 6 0 13 14 1
                                    17 16 0 18 2 6 0 0 0 19 2 9 6 20 0 21 2 7 0
                                    6 0 23 2 6 0 0 0 25 3 0 0 20 0 0 26 1 6 0 0
                                    28 2 0 0 29 0 30 2 7 0 0 38 39 1 0 0 0 41 1
                                    0 9 0 42 2 7 0 29 6 44 1 7 46 0 47 2 0 33 0
                                    0 1 1 4 33 0 1 1 0 6 0 1 2 16 0 0 6 1 1 0 6
                                    0 1 1 0 0 0 1 3 17 65 0 13 13 1 2 3 66 0 0
                                    1 1 0 5 0 37 2 17 0 0 38 1 1 14 33 0 1 2 11
                                    33 60 0 1 2 19 0 60 0 1 1 18 0 0 1 1 14 0 0
                                    1 2 11 0 60 0 1 2 15 33 0 0 1 2 0 33 0 38 1
                                    1 13 13 0 1 2 17 6 0 6 1 2 17 0 0 0 1 2 17
                                    6 0 6 1 2 17 6 0 6 1 3 17 6 0 51 6 1 3 17 6
                                    0 52 6 1 3 17 0 0 53 0 1 3 17 6 0 54 6 1 3
                                    17 6 0 55 6 1 3 17 6 0 13 6 1 2 17 0 0 50 1
                                    1 0 0 5 36 2 0 0 29 6 45 2 0 0 57 0 1 1 0 6
                                    0 1 0 0 0 1 1 0 0 0 1 2 16 0 0 6 1 1 19 0 0
                                    1 1 11 0 0 1 1 0 0 0 1 2 0 0 0 38 1 1 16 0
                                    0 1 2 0 0 57 0 1 2 16 0 6 0 1 4 16 6 20 0 6
                                    6 1 3 11 6 20 0 6 1 2 11 6 20 0 1 2 17 0 0
                                    0 1 2 17 6 0 6 1 3 17 6 0 13 6 1 2 0 6 0 13
                                    1 1 0 33 0 1 1 13 33 0 1 3 16 13 6 0 13 1 2
                                    16 13 6 0 1 2 11 13 57 0 1 1 11 9 0 1 2 4
                                    33 0 0 1 1 0 38 0 1 1 0 50 0 1 2 6 33 0 0 1
                                    2 0 0 38 6 1 1 13 33 0 1 2 0 33 0 38 1 1 10
                                    13 0 1 1 14 6 0 1 2 14 0 0 0 1 3 16 0 60 0
                                    0 1 2 14 0 0 0 1 3 11 0 60 0 0 1 1 11 9 0 1
                                    2 16 33 6 0 1 1 10 13 0 1 1 14 6 0 1 2 14 0
                                    0 0 1 2 11 6 60 0 1 2 17 0 29 0 1 2 0 0 29
                                    0 30 3 0 0 20 0 0 26 2 0 33 0 38 1 2 16 0 0
                                    6 1 1 0 9 0 1 1 0 33 0 1 1 0 0 0 1 1 0 33 0
                                    1 1 0 59 0 1 1 0 6 0 1 2 0 0 0 38 1 3 0 0 6
                                    0 13 1 3 0 0 0 0 13 1 1 0 16 0 1 2 0 33 13
                                    0 1 2 12 61 61 0 1 1 12 62 0 1 1 0 6 0 1 2
                                    0 9 0 38 43 1 0 6 0 1 2 0 0 0 38 40 2 0 56
                                    57 0 1 2 17 0 0 6 1 2 0 0 0 13 1 1 0 33 0 1
                                    1 0 33 0 1 1 0 33 0 1 2 11 33 57 0 1 2 1 0
                                    0 63 1 2 1 0 0 64 1 3 1 0 0 6 6 1 3 1 0 0 9
                                    9 1 2 0 33 0 0 1 2 16 33 6 0 1 1 0 9 0 42 1
                                    0 33 0 1 0 0 0 1 2 0 6 0 51 1 2 0 6 0 52 1
                                    2 0 0 0 53 1 2 0 6 0 54 1 2 0 0 0 55 1 2 0
                                    6 0 13 15 3 0 6 0 13 6 1 2 0 13 0 0 1 2 0 0
                                    6 0 49 2 0 0 0 55 1 2 0 0 0 13 1 1 0 33 0 1
                                    1 0 0 0 1 1 17 0 0 1 1 0 38 0 1 1 0 0 0 1 2
                                    16 38 6 0 1 2 11 38 57 0 1 3 19 0 0 0 13 1
                                    1 0 0 0 1 1 2 67 0 1 1 0 0 9 1 2 0 0 6 0 24
                                    2 17 0 0 0 1 1 17 0 50 1 2 17 0 0 6 1 2 0 0
                                    0 0 1 2 0 0 6 0 1 2 0 0 0 6 1 1 0 0 50 1 1
                                    0 0 0 41 1 0 46 0 48 1 0 0 5 35 1 0 50 0 1
                                    2 6 33 0 0 1 2 0 6 0 17 22 2 11 33 57 0 1 2
                                    14 33 0 0 1 2 14 33 0 0 1 2 0 33 0 0 34 2
                                    14 33 0 0 1 2 14 33 0 0 1 0 4 0 11 1 3 0 0
                                    31 2 3 0 0 0 1 2 0 0 0 0 27 2 0 0 0 6 1 2 0
                                    0 58 0 1 2 0 0 6 0 32 2 3 0 13 0 1 2 4 0 38
                                    0 1 1 11 38 0 1)))))
           '|lookupComplete|)) 
