
(PUT '|I32VEC;#;%Nni;1| '|SPADreplace| 'QV_LEN_I32) 

(SDEFUN |I32VEC;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|)))
        (QV_LEN_I32 |x|)) 

(PUT '|I32VEC;minIndex;%I;2| '|SPADreplace| '(XLAM (|x|) 0)) 

(SDEFUN |I32VEC;minIndex;%I;2| ((|x| (%)) (% (|Integer|))) 0) 

(PUT '|I32VEC;empty;%;3| '|SPADreplace| '(XLAM NIL (GETREFV_I32 0 0))) 

(SDEFUN |I32VEC;empty;%;3| ((% (%))) (GETREFV_I32 0 0)) 

(PUT '|I32VEC;new;NniI%;4| '|SPADreplace| 'GETREFV_I32) 

(SDEFUN |I32VEC;new;NniI%;4|
        ((|n| (|NonNegativeInteger|)) (|x| (|Integer|)) (% (%)))
        (GETREFV_I32 |n| |x|)) 

(PUT '|I32VEC;qelt;%2I;5| '|SPADreplace| 'ELT_I32) 

(SDEFUN |I32VEC;qelt;%2I;5| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_I32 |x| |i|)) 

(PUT '|I32VEC;elt;%2I;6| '|SPADreplace| 'ELT_I32) 

(SDEFUN |I32VEC;elt;%2I;6| ((|x| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (ELT_I32 |x| |i|)) 

(PUT '|I32VEC;qsetelt!;%3I;7| '|SPADreplace| 'SETELT_I32) 

(SDEFUN |I32VEC;qsetelt!;%3I;7|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_I32 |x| |i| |s|)) 

(PUT '|I32VEC;setelt!;%3I;8| '|SPADreplace| 'SETELT_I32) 

(SDEFUN |I32VEC;setelt!;%3I;8|
        ((|x| (%)) (|i| (|Integer|)) (|s| #1=(|Integer|)) (% #1#))
        (SETELT_I32 |x| |i| |s|)) 

(SDEFUN |I32VEC;fill!;%I%;9| ((|x| (%)) (|s| (|Integer|)) (% (%)))
        (SPROG ((#1=#:G2490 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (|sub_SI| (QV_LEN_I32 |x|) 1)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (SETELT_I32 |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(DECLAIM (NOTINLINE |I32Vector;|)) 

(DEFUN |I32Vector| ()
  (SPROG NIL
         (PROG (#1=#:G2502)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|I32Vector|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|I32Vector|
                             (LIST (CONS NIL (CONS 1 (|I32Vector;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|I32Vector|)))))))))) 

(DEFUN |I32Vector;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G2500 NIL) (#2=#:G2499 NIL) (#3=#:G2498 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|I32Vector|))
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
    (|haddProp| |$ConstructorCache| '|I32Vector| NIL (CONS 1 %))
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

(MAKEPROP '|I32Vector| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) |I32VEC;#;%Nni;1|
              (|Integer|) |I32VEC;minIndex;%I;2| |I32VEC;empty;%;3|
              |I32VEC;new;NniI%;4| |I32VEC;qelt;%2I;5| |I32VEC;elt;%2I;6|
              |I32VEC;qsetelt!;%3I;7| |I32VEC;setelt!;%3I;8|
              |I32VEC;fill!;%I%;9| (|List| 8) (|List| 19) (|Equation| 8)
              (|Mapping| 8 8 8) (|Boolean|) (|SingleInteger|) (|HashState|)
              (|Mapping| 21 8 8) (|OutputForm|) (|String|) (|InputForm|)
              (|Mapping| 21 8) (|UniversalSegment| 8) (|Void|) (|Mapping| 8 8)
              (|List| %) (|Union| 8 '"failed"))
           '#(~= 0 |trim| 6 |swap!| 12 |sorted?| 19 |sort!| 30 |sort| 41
              |smaller?| 52 |size?| 58 |setelt!| 64 |select| 78 |sample| 84
              |rightTrim| 88 |reverse!| 94 |reverse| 99 |removeDuplicates| 104
              |remove| 109 |reduce| 121 |qsetelt!| 142 |qelt| 149 |position|
              155 |parts| 174 |new| 179 |more?| 185 |minIndex| 191 |min| 196
              |merge| 207 |members| 220 |member?| 225 |maxIndex| 231 |max| 236
              |map!| 253 |map| 259 |less?| 272 |leftTrim| 278 |latex| 284
              |insert| 289 |indices| 303 |index?| 308 |hashUpdate!| 314 |hash|
              320 |first| 325 |find| 336 |fill!| 342 |every?| 348 |eval| 354
              |eq?| 380 |entry?| 386 |entries| 392 |empty?| 397 |empty| 402
              |elt| 406 |delete| 425 |count| 437 |copyInto!| 449 |copy| 456
              |convert| 461 |construct| 466 |concat| 471 |coerce| 494 |any?|
              499 >= 505 > 511 = 517 <= 523 < 529 |#| 535)
           'NIL
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
              '#((|OneDimensionalArrayAggregate| 8) (|FiniteLinearAggregate| 8)
                 (|LinearAggregate| 8) (|IndexedAggregate| 8 8)
                 (|Collection| 8) (|OrderedSet|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Aggregate|) (|EltableAggregate| 8 8)
                 (|Evalable| 8) (|SetCategory|) (|Hashable|)
                 (|shallowlyMutable|) (|finiteAggregate|) (|Eltable| 29 $$)
                 (|Type|) (|Eltable| 8 8) (|InnerEvalable| 8 8)
                 (|CoercibleTo| 25) (|PartialOrder|) (|BasicType|)
                 (|ConvertibleTo| 27))
              (|makeByteWordVec2| 33
                                  '(2 23 21 0 0 1 2 15 0 0 8 1 3 13 30 0 8 8 1
                                    1 18 21 0 1 2 14 21 24 0 1 1 17 0 0 1 2 16
                                    0 24 0 1 1 18 0 0 1 2 14 0 24 0 1 2 19 21 0
                                    0 1 2 0 21 0 6 1 3 13 8 0 29 8 1 3 13 8 0 8
                                    8 15 2 14 0 28 0 1 0 0 0 1 2 15 0 0 8 1 1
                                    16 0 0 1 1 14 0 0 1 1 15 0 0 1 2 15 0 8 0 1
                                    2 14 0 28 0 1 4 15 8 20 0 8 8 1 2 14 8 20 0
                                    1 3 14 8 20 0 8 1 3 13 8 0 8 8 14 2 0 8 0 8
                                    12 2 15 8 8 0 1 3 15 8 8 0 8 1 2 14 8 28 0
                                    1 1 14 17 0 1 2 0 0 6 8 11 2 0 21 0 6 1 1 1
                                    8 0 9 2 18 0 0 0 1 1 18 8 0 1 2 18 0 0 0 1
                                    3 14 0 24 0 0 1 1 14 17 0 1 2 15 21 8 0 1 1
                                    1 8 0 1 2 18 0 0 0 1 1 18 8 0 1 2 14 8 24 0
                                    1 2 13 0 31 0 1 3 0 0 20 0 0 1 2 0 0 31 0 1
                                    2 0 21 0 6 1 2 15 0 0 8 1 1 20 26 0 1 3 0 0
                                    0 0 8 1 3 0 0 8 0 8 1 1 0 17 0 1 2 0 21 8 0
                                    1 2 22 23 23 0 1 1 22 22 0 1 1 1 8 0 1 2 0
                                    0 0 6 1 2 0 33 28 0 1 2 13 0 0 8 16 2 14 21
                                    28 0 1 3 8 0 0 8 8 1 3 8 0 0 17 17 1 2 8 0
                                    0 18 1 2 8 0 0 19 1 2 0 21 0 0 1 2 15 21 8
                                    0 1 1 0 17 0 1 1 0 21 0 1 0 0 0 10 2 0 0 0
                                    29 1 2 0 8 0 8 13 3 0 8 0 8 8 1 2 0 0 0 29
                                    1 2 0 0 0 8 1 2 15 6 8 0 1 2 14 6 28 0 1 3
                                    16 0 0 0 8 1 1 0 0 0 1 1 3 27 0 1 1 0 0 17
                                    1 1 0 0 32 1 2 0 0 8 0 1 2 0 0 0 0 1 2 0 0
                                    0 8 1 1 21 25 0 1 2 14 21 28 0 1 2 18 21 0
                                    0 1 2 18 21 0 0 1 2 23 21 0 0 1 2 18 21 0 0
                                    1 2 18 21 0 0 1 1 14 6 0 7)))))
           '|lookupComplete|)) 

(MAKEPROP '|I32Vector| 'NILADIC T) 
