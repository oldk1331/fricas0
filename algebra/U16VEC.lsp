
(MAKEPROP '|U16VEC;#;%Nni;1| '|SPADreplace| 'QV_LEN_U16) 

(SDEFUN |U16VEC;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|)))
        (QV_LEN_U16 |x|)) 

(MAKEPROP '|U16VEC;minIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |U16VEC;minIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(MAKEPROP '|U16VEC;empty;%;3| '|SPADreplace| '(XLAM NIL (GETREFV_U16 0 0))) 

(SDEFUN |U16VEC;empty;%;3| ((% (%))) (GETREFV_U16 0 0)) 

(MAKEPROP '|U16VEC;new;NniI%;4| '|SPADreplace| 'GETREFV_U16) 

(SDEFUN |U16VEC;new;NniI%;4|
        ((|n| (|NonNegativeInteger|)) (|x| (|Integer|)) (% (%)))
        (GETREFV_U16 |n| |x|)) 

(MAKEPROP '|U16VEC;qelt;%2I;5| '|SPADreplace| 'ELT_U16) 

(SDEFUN |U16VEC;qelt;%2I;5| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_U16 |x| |i|)) 

(MAKEPROP '|U16VEC;elt;%2I;6| '|SPADreplace| 'ELT_U16) 

(SDEFUN |U16VEC;elt;%2I;6| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_U16 |x| |i|)) 

(MAKEPROP '|U16VEC;qsetelt!;%3I;7| '|SPADreplace| 'SETELT_U16) 

(SDEFUN |U16VEC;qsetelt!;%3I;7|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_U16 |x| |i| |s|)) 

(MAKEPROP '|U16VEC;setelt!;%3I;8| '|SPADreplace| 'SETELT_U16) 

(SDEFUN |U16VEC;setelt!;%3I;8|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_U16 |x| |i| |s|)) 

(SDEFUN |U16VEC;fill!;%I%;9| ((|x| (%)) (|s| (|Integer|)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G12 NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| (QV_LEN_U16 |x|) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SETELT_U16 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |U16Vector;|)) 

(DEFUN |U16Vector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G22 NIL) (#2=#:G21 NIL) (#3=#:G20 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|U16Vector|))
    (LETT % (GETREFV 34))
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
    (|haddProp| |$ConstructorCache| '|U16Vector| NIL (CONS 1 %))
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
    (AND (|HasCategory| % '(|SetWithZero|))
         (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 131072))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|OrderedSet|))
         (|augmentPredVector| % 262144))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|))))
     (|augmentPredVector| % 524288))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #2#)
     (|augmentPredVector| % 1048576))
    (AND
     (OR (AND (|HasCategory| % '(|finiteAggregate|)) #1#)
         (AND (|HasCategory| % '(|finiteAggregate|))
              (|HasCategory| (|Integer|) '(|OrderedSet|)))
         #3#)
     (|augmentPredVector| % 2097152))
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|HasCategory| (|Integer|) '(|Hashable|))
         (|augmentPredVector| % 4194304))
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
     (|augmentPredVector| % 8388608))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |U16Vector| ()
  (SPROG NIL
         (PROG (#1=#:G24)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|U16Vector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|U16Vector|
                             (LIST (CONS NIL (CONS 1 (|U16Vector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|U16Vector|)))))))))) 

(MAKEPROP '|U16Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |U16VEC;#;%Nni;1|
              (|Integer|) |U16VEC;minIndex;%I;2| |U16VEC;empty;%;3|
              |U16VEC;new;NniI%;4| |U16VEC;qelt;%2I;5| |U16VEC;elt;%2I;6|
              |U16VEC;qsetelt!;%3I;7| |U16VEC;setelt!;%3I;8|
              |U16VEC;fill!;%I%;9| (|Boolean|) (|Mapping| 8 8) (|List| 8)
              (|Union| 8 '"failed") (|Mapping| 17 8) (|UniversalSegment| 8)
              (|Mapping| 8 8 8) (|List| %) (|Mapping| 17 8 8) (|HashState|)
              (|SingleInteger|) (|Equation| 8) (|List| 28) (|OutputForm|)
              (|String|) (|Void|) (|InputForm|))
           '#(~= 0 |trim| 6 |swap!| 12 |sorted?| 19 |sort!| 30 |sort| 41
              |smaller?| 52 |size?| 58 |sign| 64 |setelt!| 69 |select| 83
              |sample| 89 |rightTrim| 93 |reverse!| 99 |reverse| 104
              |removeDuplicates| 109 |remove| 114 |reduce| 126 |qsetelt!| 147
              |qelt| 154 |positive?| 160 |position| 165 |parts| 184 |new| 189
              |negative?| 195 |more?| 200 |minIndex| 206 |min| 211
              |merge_unique| 222 |merge| 229 |members| 242 |member?| 247
              |maxIndex| 253 |max| 258 |map!| 275 |map| 281 |less?| 294
              |leftTrim| 300 |latex| 306 |insert| 311 |indices| 325 |index?|
              330 |hashUpdate!| 336 |hash| 342 |first| 347 |find| 358 |fill!|
              364 |every?| 370 |eval| 376 |eq?| 402 |entry?| 408 |entries| 414
              |empty?| 419 |empty| 424 |elt| 428 |delete| 447 |count| 459
              |copyInto!| 471 |copy| 478 |convert| 483 |construct| 488 |concat|
              493 |coerce| 516 |any?| 521 >= 527 > 533 = 539 <= 545 < 551 |#|
              557)
           'NIL
           (CONS
            (|makeByteWordVec2| 12
                                '(0 0 0 1 6 0 0 6 0 2 9 8 0 0 3 10 1 12 8 0 0 0
                                  0 0))
            (CONS
             '#(|OneDimensionalArrayAggregate&| NIL |LinearAggregate&|
                |OrderedSet&| NIL |Collection&| |IndexedAggregate&| NIL
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL |BasicType&|
                |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL)
             (CONS
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|OrderedSet|) (|Comparable|)
                 (|Collection| 8) (|IndexedAggregate| 8 8)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 8)
                 (|Hashable|) (|SetCategory|) (|Evalable| 8)
                 (|EltableAggregate| 8 8) (|Aggregate|) (|ConvertibleTo| 33)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 30)
                 (|InnerEvalable| 8 8) (|Eltable| 8 8) (|Type|)
                 (|Eltable| 22 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 33
                                  '(2 24 17 0 0 1 2 15 0 0 8 1 3 13 32 0 8 8 1
                                    1 19 17 0 1 2 14 17 25 0 1 2 16 0 25 0 1 1
                                    17 0 0 1 1 19 0 0 1 2 14 0 25 0 1 2 20 17 0
                                    0 1 2 0 17 0 6 1 1 18 8 0 1 3 13 8 0 8 8 15
                                    3 13 8 0 22 8 1 2 14 0 21 0 1 0 0 0 1 2 15
                                    0 0 8 1 1 16 0 0 1 1 14 0 0 1 1 15 0 0 1 2
                                    15 0 8 0 1 2 14 0 21 0 1 4 15 8 23 0 8 8 1
                                    2 14 8 23 0 1 3 14 8 23 0 8 1 3 13 8 0 8 8
                                    14 2 0 8 0 8 12 1 18 17 0 1 2 15 8 8 0 1 3
                                    15 8 8 0 8 1 2 14 8 21 0 1 1 14 19 0 1 2 0
                                    0 6 8 11 1 18 17 0 1 2 0 17 0 6 1 1 1 8 0 9
                                    1 19 8 0 1 2 19 0 0 0 1 3 15 0 25 0 0 1 2
                                    19 0 0 0 1 3 14 0 25 0 0 1 1 14 19 0 1 2 15
                                    17 8 0 1 1 1 8 0 1 1 19 8 0 1 2 19 0 0 0 1
                                    2 14 8 25 0 1 2 13 0 18 0 1 2 0 0 18 0 1 3
                                    0 0 23 0 0 1 2 0 17 0 6 1 2 15 0 0 8 1 1 21
                                    31 0 1 3 0 0 8 0 8 1 3 0 0 0 0 8 1 1 0 19 0
                                    1 2 0 17 8 0 1 2 23 26 26 0 1 1 23 27 0 1 2
                                    0 0 0 6 1 1 1 8 0 1 2 0 20 21 0 1 2 13 0 0
                                    8 16 2 14 17 21 0 1 2 8 0 0 28 1 2 8 0 0 29
                                    1 3 8 0 0 8 8 1 3 8 0 0 19 19 1 2 0 17 0 0
                                    1 2 15 17 8 0 1 1 0 19 0 1 1 0 17 0 1 0 0 0
                                    10 3 0 8 0 8 8 1 2 0 8 0 8 13 2 0 0 0 22 1
                                    2 0 0 0 8 1 2 0 0 0 22 1 2 15 6 8 0 1 2 14
                                    6 21 0 1 3 16 0 0 0 8 1 1 0 0 0 1 1 3 33 0
                                    1 1 0 0 19 1 2 0 0 8 0 1 2 0 0 0 8 1 2 0 0
                                    0 0 1 1 0 0 24 1 1 22 30 0 1 2 14 17 21 0 1
                                    2 19 17 0 0 1 2 19 17 0 0 1 2 24 17 0 0 1 2
                                    19 17 0 0 1 2 19 17 0 0 1 1 14 6 0 7)))))
           '|lookupComplete|)) 
