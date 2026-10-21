
(MAKEPROP '|IARRAY1;#;%Nni;1| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;#;%Nni;1| ((|x| (%)) (% (|NonNegativeInteger|))) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;fill!;%S%;2| ((|x| (%)) (|s| (S)) (% (%)))
        (SPROG ((|i| NIL) (#1=#:G16 NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ (EXIT (QSETVELT |x| |i| |s|)))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |x|)))) 

(SDEFUN |IARRAY1;minIndex;%I;3| ((|x| (%)) (% (|Integer|))) (QREFELT % 7)) 

(MAKEPROP '|IARRAY1;empty;%;4| '|SPADreplace| '(XLAM NIL (MAKE-ARRAY 0))) 

(SDEFUN |IARRAY1;empty;%;4| ((% (%))) (MAKE-ARRAY 0)) 

(MAKEPROP '|IARRAY1;new;NniS%;5| '|SPADreplace| 'MAKEARR1) 

(SDEFUN |IARRAY1;new;NniS%;5| ((|n| (|NonNegativeInteger|)) (|s| (S)) (% (%)))
        (MAKEARR1 |n| |s|)) 

(SDEFUN |IARRAY1;map!;M2%;6| ((|f| (|Mapping| S S)) (|s1| (%)) (% (%)))
        (SPROG ((|n| (|Integer|)) (|i| NIL) (#1=#:G26 NIL))
               (SEQ (LETT |n| (QVMAXINDEX |s1|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ
                             (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (QSETVELT |s1| |i|
                                              (SPADCALL (QAREF1 |s1| |i|)
                                                        |f|))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT |s1|)))))))) 

(SDEFUN |IARRAY1;map;M2%;7| ((|f| (|Mapping| S S)) (|s1| (%)) (% (%)))
        (SPROG ((|n| (|Integer|)) (|ss2| (%)) (|i| NIL) (#1=#:G32 NIL))
               (SEQ (LETT |n| (QVMAXINDEX |s1|))
                    (EXIT
                     (COND ((< |n| 0) |s1|)
                           ('T
                            (SEQ (LETT |ss2| (MAKE-ARRAY (+ |n| 1)))
                                 (SEQ (LETT |i| 0) (LETT #1# |n|) G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETVELT |ss2| |i|
                                                  (SPADCALL (QAREF1 |s1| |i|)
                                                            |f|))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT |ss2|)))))))) 

(SDEFUN |IARRAY1;map;M3%;8|
        ((|f| (|Mapping| S S S)) (|a| (%)) (|b| (%)) (% (%)))
        (SPROG ((|maxind| (|Integer|)) (|c| (%)) (|i| NIL) (#1=#:G39 NIL))
               (SEQ (LETT |maxind| (MIN (QVMAXINDEX |a|) (QVMAXINDEX |b|)))
                    (EXIT
                     (COND ((< |maxind| 0) (SPADCALL (QREFELT % 13)))
                           ('T
                            (SEQ (LETT |c| (MAKE-ARRAY (+ |maxind| 1)))
                                 (SEQ (LETT |i| 0) (LETT #1# |maxind|) G190
                                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (QSETVELT |c| |i|
                                                  (SPADCALL (QAREF1 |a| |i|)
                                                            (QAREF1 |b| |i|)
                                                            |f|))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT |c|)))))))) 

(SDEFUN |IARRAY1;hashUpdate!;Hs%Hs;9|
        ((|s| (|HashState|)) (|x| (%)) (% (|HashState|)))
        (SPROG ((|i| NIL) (#1=#:G44 NIL))
               (SEQ
                (SEQ (LETT |i| 0) (LETT #1# (QVMAXINDEX |x|)) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |s|
                             (SPADCALL |s| (QAREF1 |x| |i|) (QREFELT % 21)))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT |s|)))) 

(MAKEPROP '|IARRAY1;qelt;%IS;10| '|SPADreplace| 'QAREF1) 

(SDEFUN |IARRAY1;qelt;%IS;10| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| |i|)) 

(MAKEPROP '|IARRAY1;qsetelt!;%I2S;11| '|SPADreplace| 'QSETVELT) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;11|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S))) (QSETVELT |x| |i| |s|)) 

(SDEFUN |IARRAY1;elt;%IS;12| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (MINUSP |i|) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT % 24))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;13|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (MINUSP |i|) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT % 25))))) 

(MAKEPROP '|IARRAY1;maxIndex;%I;14| '|SPADreplace| 'QVSIZE) 

(SDEFUN |IARRAY1;maxIndex;%I;14| ((|x| (%)) (% (|Integer|))) (QVSIZE |x|)) 

(SDEFUN |IARRAY1;qelt;%IS;15| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| (- |i| 1))) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;16|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (QSETVELT |x| (- |i| 1) |s|)) 

(SDEFUN |IARRAY1;elt;%IS;17| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (QAREF1 |x| (- |i| 1))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;18|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (|less_SI| |i| 1) (|less_SI| (QVSIZE |x|) |i|))
          (|error| "index out of range"))
         ('T (QSETVELT |x| (- |i| 1) |s|)))) 

(SDEFUN |IARRAY1;qelt;%IS;19| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (QAREF1 |x| (- |i| (QREFELT % 7)))) 

(SDEFUN |IARRAY1;qsetelt!;%I2S;20|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (QSETVELT |x| (- |i| (QREFELT % 7)) |s|)) 

(SDEFUN |IARRAY1;elt;%IS;21| ((|x| (%)) (|i| (|Integer|)) (% (S)))
        (COND
         ((OR (< |i| (QREFELT % 7)) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| (QREFELT % 24))))) 

(SDEFUN |IARRAY1;setelt!;%I2S;22|
        ((|x| (%)) (|i| (|Integer|)) (|s| (S)) (% (S)))
        (COND
         ((OR (< |i| (QREFELT % 7)) (> |i| (SPADCALL |x| (QREFELT % 26))))
          (|error| "index out of range"))
         ('T (SPADCALL |x| |i| |s| (QREFELT % 25))))) 

(DECLAIM (NOTINLINE |IndexedOneDimensionalArray;|)) 

(DEFUN |IndexedOneDimensionalArray;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G81 NIL) (#2=#:G80 NIL)
    (#3=#:G79 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT |dv$| (LIST '|IndexedOneDimensionalArray| DV$1 DV$2))
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
    (|haddProp| |$ConstructorCache| '|IndexedOneDimensionalArray|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
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
      (QSETREFV % 22
                (CONS (|dispatchFunction| |IARRAY1;hashUpdate!;Hs%Hs;9|) %))))
    (QSETREFV % 23 (ZEROP |#2|))
    (COND
     ((QREFELT % 23)
      (PROGN
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;10|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;11|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;12|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;13|) %))))
     ((EQL |#2| 1)
      (PROGN
       (QSETREFV % 26 (CONS (|dispatchFunction| |IARRAY1;maxIndex;%I;14|) %))
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;15|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;16|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;17|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;18|) %))))
     ('T
      (PROGN
       (QSETREFV % 24 (CONS (|dispatchFunction| |IARRAY1;qelt;%IS;19|) %))
       (QSETREFV % 25 (CONS (|dispatchFunction| |IARRAY1;qsetelt!;%I2S;20|) %))
       (QSETREFV % 27 (CONS (|dispatchFunction| |IARRAY1;elt;%IS;21|) %))
       (QSETREFV % 28
                 (CONS (|dispatchFunction| |IARRAY1;setelt!;%I2S;22|) %)))))
    %))) 

(DEFUN |IndexedOneDimensionalArray| (&REST #1=#:G82)
  (SPROG NIL
         (PROG (#2=#:G83)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(T NIL))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedOneDimensionalArray|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |IndexedOneDimensionalArray;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|IndexedOneDimensionalArray|)))))))))) 

(MAKEPROP '|IndexedOneDimensionalArray| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) |IARRAY1;#;%Nni;1| |IARRAY1;fill!;%S%;2|
              (|Integer|) |IARRAY1;minIndex;%I;3| |IARRAY1;empty;%;4|
              |IARRAY1;new;NniS%;5| (|Mapping| 6 6) |IARRAY1;map!;M2%;6|
              |IARRAY1;map;M2%;7| (|Mapping| 6 6 6) |IARRAY1;map;M3%;8|
              (|HashState|) (0 . |hashUpdate!|) (6 . |hashUpdate!|) '#:G10
              (12 . |qelt|) (18 . |qsetelt!|) (25 . |maxIndex|) (30 . |elt|)
              (36 . |setelt!|) (|Boolean|) (|List| 6) (|List| 11)
              (|Union| 6 '"failed") (|Mapping| 29 6) (|UniversalSegment| 11)
              (|List| %) (|Mapping| 29 6 6) (|SingleInteger|) (|Equation| 6)
              (|List| 38) (|OutputForm|) (|String|) (|Void|) (|InputForm|))
           '#(~= 43 |trim| 49 |swap!| 55 |sorted?| 62 |sort!| 73 |sort| 84
              |smaller?| 95 |size?| 101 |sign| 107 |setelt!| 112 |select| 126
              |sample| 132 |rightTrim| 136 |reverse!| 142 |reverse| 147
              |removeDuplicates| 152 |remove| 157 |reduce| 169 |qsetelt!| 190
              |qelt| 197 |positive?| 203 |position| 208 |parts| 227 |new| 232
              |negative?| 238 |more?| 243 |minIndex| 249 |min| 254
              |merge_unique| 265 |merge| 272 |members| 285 |member?| 290
              |maxIndex| 296 |max| 301 |map!| 318 |map| 324 |less?| 337
              |leftTrim| 343 |latex| 349 |insert| 354 |indices| 368 |index?|
              373 |hashUpdate!| 379 |hash| 385 |first| 390 |find| 401 |fill!|
              407 |every?| 413 |eval| 419 |eq?| 445 |entry?| 451 |entries| 457
              |empty?| 462 |empty| 467 |elt| 471 |delete| 490 |count| 502
              |copyInto!| 514 |copy| 521 |convert| 526 |construct| 531 |concat|
              536 |coerce| 559 |any?| 564 >= 570 > 576 = 582 <= 588 < 594 |#|
              600)
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
                 (|Collection| 6) (|IndexedAggregate| 11 6)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 6)
                 (|Hashable|) (|SetCategory|) (|Evalable| 6)
                 (|EltableAggregate| 11 6) (|Aggregate|) (|ConvertibleTo| 43)
                 (|BasicType|) (|PartialOrder|) (|CoercibleTo| 40)
                 (|InnerEvalable| 6 6) (|Eltable| 11 6) (|Type|)
                 (|Eltable| 34 $$) (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 43
                                  '(2 6 20 20 0 21 2 0 20 20 0 22 2 0 6 0 11 24
                                    3 0 6 0 11 6 25 1 0 11 0 26 2 0 6 0 11 27 3
                                    0 6 0 11 6 28 2 25 29 0 0 1 2 16 0 0 6 1 3
                                    14 42 0 11 11 1 1 20 29 0 1 2 15 29 36 0 1
                                    2 17 0 36 0 1 1 18 0 0 1 1 20 0 0 1 2 15 0
                                    36 0 1 2 21 29 0 0 1 2 0 29 0 8 1 1 19 11 0
                                    1 3 14 6 0 11 6 28 3 14 6 0 34 6 1 2 15 0
                                    33 0 1 0 0 0 1 2 16 0 0 6 1 1 17 0 0 1 1 15
                                    0 0 1 1 16 0 0 1 2 16 0 6 0 1 2 15 0 33 0 1
                                    4 16 6 18 0 6 6 1 2 15 6 18 0 1 3 15 6 18 0
                                    6 1 3 14 6 0 11 6 25 2 0 6 0 11 24 1 19 29
                                    0 1 2 16 11 6 0 1 3 16 11 6 0 11 1 2 15 11
                                    33 0 1 1 15 30 0 1 2 0 0 8 6 14 1 19 29 0 1
                                    2 0 29 0 8 1 1 4 11 0 12 1 20 6 0 1 2 20 0
                                    0 0 1 3 16 0 36 0 0 1 2 20 0 0 0 1 3 15 0
                                    36 0 0 1 1 15 30 0 1 2 16 29 6 0 1 1 4 11 0
                                    26 1 20 6 0 1 2 20 0 0 0 1 2 15 6 36 0 1 2
                                    14 0 15 0 16 2 0 0 15 0 17 3 0 0 18 0 0 19
                                    2 0 29 0 8 1 2 16 0 0 6 1 1 22 41 0 1 3 0 0
                                    6 0 11 1 3 0 0 0 0 11 1 1 0 31 0 1 2 0 29
                                    11 0 1 2 24 20 20 0 22 1 24 37 0 1 2 0 0 0
                                    8 1 1 4 6 0 1 2 0 32 33 0 1 2 14 0 0 6 10 2
                                    15 29 33 0 1 2 9 0 0 38 1 2 9 0 0 39 1 3 9
                                    0 0 6 6 1 3 9 0 0 30 30 1 2 0 29 0 0 1 2 16
                                    29 6 0 1 1 0 30 0 1 1 0 29 0 1 0 0 0 13 3 0
                                    6 0 11 6 1 2 0 6 0 11 27 2 0 0 0 34 1 2 0 0
                                    0 11 1 2 0 0 0 34 1 2 16 8 6 0 1 2 15 8 33
                                    0 1 3 17 0 0 0 11 1 1 0 0 0 1 1 3 43 0 1 1
                                    0 0 30 1 2 0 0 6 0 1 2 0 0 0 6 1 2 0 0 0 0
                                    1 1 0 0 35 1 1 23 40 0 1 2 15 29 33 0 1 2
                                    20 29 0 0 1 2 20 29 0 0 1 2 25 29 0 0 1 2
                                    20 29 0 0 1 2 20 29 0 0 1 1 15 8 0 9)))))
           '|lookupComplete|)) 
