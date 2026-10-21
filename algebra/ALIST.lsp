
(SDEFUN |ALIST;dictionary;%;1| ((% (%))) (SPADCALL NIL (QREFELT % 11))) 

(SDEFUN |ALIST;empty;%;2| ((% (%))) (SPADCALL (QREFELT % 12))) 

(SDEFUN |ALIST;empty?;%B;3| ((|t| (%)) (% (|Boolean|)))
        (NULL (SPADCALL |t| (QREFELT % 14)))) 

(SDEFUN |ALIST;entries;%L;4|
        ((|t| (%))
         (% (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))))
        (SPADCALL |t| (QREFELT % 14))) 

(SDEFUN |ALIST;parts;%L;5|
        ((|t| (%))
         (% (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))))
        (SPADCALL |t| (QREFELT % 14))) 

(SDEFUN |ALIST;keys;%L;6| ((|t| (%)) (% (|List| |Key|)))
        (SPROG ((#1=#:G22 NIL) (|k| NIL) (#2=#:G23 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |k| NIL) (LETT #2# (SPADCALL |t| (QREFELT % 14)))
                      G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #1# (CONS (QCAR |k|) #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |ALIST;#;%Nni;7| ((|t| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |t| (QREFELT % 14)))) 

(SDEFUN |ALIST;first;%R;8|
        ((|t| (%)) (% (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
        (|SPADfirst| (SPADCALL |t| (QREFELT % 14)))) 

(SDEFUN |ALIST;rest;2%;9| ((|t| (%)) (% (%)))
        (SPADCALL (CDR (SPADCALL |t| (QREFELT % 14))) (QREFELT % 11))) 

(SDEFUN |ALIST;concat;R2%;10|
        ((|p| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))) (|t| (%))
         (% (%)))
        (SPADCALL (CONS |p| (SPADCALL |t| (QREFELT % 14))) (QREFELT % 11))) 

(SDEFUN |ALIST;setrest!;3%;11| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 14)) (SPADCALL |b| (QREFELT % 14))
                   (QREFELT % 26))
         (QREFELT % 11))) 

(SDEFUN |ALIST;setfirst!;%2R;12|
        ((|a| (%)) (|p| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
         (% (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
        (SPADCALL (SPADCALL |a| (QREFELT % 14)) |p| (QREFELT % 28))) 

(SDEFUN |ALIST;minIndex;%I;13| ((|a| (%)) (% (|Integer|)))
        (PROGN (SPADCALL |a| (QREFELT % 14)) 1)) 

(SDEFUN |ALIST;maxIndex;%I;14| ((|a| (%)) (% (|Integer|)))
        (LENGTH (SPADCALL |a| (QREFELT % 14)))) 

(SDEFUN |ALIST;search;Key%U;15|
        ((|k| (|Key|)) (|t| (%)) (% (|Union| |Entry| "failed")))
        (SPROG ((|r| NIL) (#1=#:G48 NIL) (#2=#:G47 NIL) (#3=#:G46 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL)
                         (LETT #1# (SPADCALL |t| (QREFELT % 14))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| (QCAR |r|) (QREFELT % 33))
                             (PROGN
                              (LETT #3#
                                    (PROGN
                                     (LETT #2# (CONS 0 (QCDR |r|)))
                                     (GO #4=#:G45)))
                              (GO #5=#:G40))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |ALIST;assoc;Key%U;16|
        ((|k| (|Key|)) (|t| (%))
         (%
          (|Union| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
                   "failed")))
        (SPROG ((|r| NIL) (#1=#:G62 NIL) (#2=#:G61 NIL) (#3=#:G60 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL)
                         (LETT #1# (SPADCALL |t| (QREFELT % 14))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |r| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| (QCAR |r|) (QREFELT % 33))
                             (PROGN
                              (LETT #3#
                                    (PROGN
                                     (LETT #2# (CONS 0 |r|))
                                     (GO #4=#:G59)))
                              (GO #5=#:G54))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |ALIST;setelt!;%Key2Entry;17|
        ((|t| (%)) (|k| (|Key|)) (|e| (|Entry|)) (% (|Entry|)))
        (SPROG
         ((|r|
           (|Union| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
                    "failed")))
         (SEQ (LETT |r| (SPADCALL |k| |t| (QREFELT % 37)))
              (EXIT
               (COND
                ((QEQCAR |r| 0) (PROGN (RPLACD #1=(QCDR |r|) |e|) (QCDR #1#)))
                ('T
                 (SEQ
                  (SPADCALL |t|
                            (CONS (CONS |k| |e|) (SPADCALL |t| (QREFELT % 14)))
                            (QREFELT % 38))
                  (EXIT |e|)))))))) 

(SDEFUN |ALIST;remove!;Key%U;18|
        ((|k| (|Key|)) (|t| (%)) (% (|Union| |Entry| "failed")))
        (SPROG
         ((|l| #1=(|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
          (|prev| #1#)
          (|curr| (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))))
         (SEQ
          (COND
           ((NULL (LETT |l| (SPADCALL |t| (QREFELT % 14)))) (CONS 1 "failed"))
           ((SPADCALL |k| (QCAR (|SPADfirst| |l|)) (QREFELT % 33))
            (SEQ (SPADCALL |t| (CDR |l|) (QREFELT % 38))
                 (EXIT (CONS 0 (QCDR (|SPADfirst| |l|))))))
           (#2='T
            (SEQ (LETT |prev| |l|) (LETT |curr| (CDR |l|))
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |curr|) NIL)
                               ('T
                                (SPADCALL (QCAR (|SPADfirst| |curr|)) |k|
                                          (QREFELT % 40)))))
                        (GO G191)))
                      (SEQ (LETT |prev| |curr|)
                           (EXIT (LETT |curr| (CDR |curr|))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND ((NULL |curr|) (CONS 1 "failed"))
                        (#2#
                         (SEQ (SPADCALL |prev| (CDR |curr|) (QREFELT % 26))
                              (EXIT
                               (CONS 0 (QCDR (|SPADfirst| |curr|)))))))))))))) 

(DECLAIM (NOTINLINE |AssociationList;|)) 

(DEFUN |AssociationList;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G155 NIL) (#2=#:G154 NIL)
    (#3=#:G153 NIL) (#4=#:G152 NIL) (#5=#:G151 NIL) (|pv$| NIL) (#6=#:G157 NIL)
    (#7=#:G158 NIL) (#8=#:G156 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|AssociationList| DV$1 DV$2))
    (LETT % (GETREFV 68))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|OrderedSet|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|Hashable|))
                                        (|HasCategory|
                                         (|Record| (|:| |key| |#1|)
                                                   (|:| |entry| |#2|))
                                         '(|ConvertibleTo| (|InputForm|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #1#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         #2#)
                                        (LETT #3#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|SetCategory|)))
                                        (AND
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          (LIST '|Evalable|
                                                (LIST '|Record|
                                                      (LIST '|:| '|key|
                                                            (|devaluate| |#1|))
                                                      (LIST '|:| '|entry|
                                                            (|devaluate|
                                                             |#2|)))))
                                         #3#)
                                        (OR #2# #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|))
                                            #3#)
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #4#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|CoercibleTo|
                                                 (|OutputForm|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #2# #4# #1#
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|OrderedSet|))
                                         #3#)
                                        (LETT #5#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|BasicType|)))
                                        (OR (|HasCategory| |#2| '(|BasicType|))
                                            #2# #5# #1#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|Hashable|))
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|))
                                            #3#)))))
    (|haddProp| |$ConstructorCache| '|AssociationList| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (LETT #6# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| |#2| '(|BasicType|)) #6#
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #6#
         (|augmentPredVector| % 2097152))
    (AND (|HasCategory| % '(|SetWithZero|)) #6#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 4194304))
    (AND #6#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|Hashable|))
         (|augmentPredVector| % 8388608))
    (AND #6# #5# (|augmentPredVector| % 16777216))
    (AND
     (LETT #7#
           (AND (|HasCategory| % '(|finiteAggregate|))
                (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                               '(|OrderedSet|))))
     (|augmentPredVector| % 33554432))
    (AND (OR (AND #6# #1#) #7#) (|augmentPredVector| % 67108864))
    (AND (OR #2# (AND #6# #1#) #7# #3#) (|augmentPredVector| % 134217728))
    (AND
     (OR (|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|))) (AND #6# #1#) #7#
         #4#)
     (|augmentPredVector| % 268435456))
    (AND
     (OR (AND (|HasCategory| |#2| '(|BasicType|)) #6#) #2# (AND #6# #5#)
         (AND #6# #1#)
         (AND #6#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|Hashable|)))
         #7# #3#)
     (|augmentPredVector| % 536870912))
    (AND (LETT #8# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 1073741824))
    (AND #6# #8# (|augmentPredVector| % 2147483648))
    (AND #6# #8#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 4294967296))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|Reference|
               (|List| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|)))))
    %))) 

(DEFUN |AssociationList| (&REST #1=#:G159)
  (SPROG NIL
         (PROG (#2=#:G160)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|AssociationList|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |AssociationList;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|AssociationList|)))))))))) 

(MAKEPROP '|AssociationList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Record| (|:| |key| 6) (|:| |entry| 7)) (|List| 9) (0 . |ref|)
              |ALIST;dictionary;%;1| |ALIST;empty;%;2| (5 . |deref|)
              (|Boolean|) |ALIST;empty?;%B;3| |ALIST;entries;%L;4|
              |ALIST;parts;%L;5| (|List| 6) |ALIST;keys;%L;6|
              (|NonNegativeInteger|) |ALIST;#;%Nni;7| |ALIST;first;%R;8|
              |ALIST;rest;2%;9| |ALIST;concat;R2%;10| (10 . |setrest!|)
              |ALIST;setrest!;3%;11| (16 . |setfirst!|)
              |ALIST;setfirst!;%2R;12| (|Integer|) |ALIST;minIndex;%I;13|
              |ALIST;maxIndex;%I;14| (22 . =) (|Union| 7 '"failed")
              |ALIST;search;Key%U;15| (|Union| 9 '"failed")
              |ALIST;assoc;Key%U;16| (28 . |setref|)
              |ALIST;setelt!;%Key2Entry;17| (34 . ~=) |ALIST;remove!;Key%U;18|
              (|Mapping| 9 9) (|Mapping| 15 9) (|List| 7) (|Mapping| 7 7)
              (|Mapping| 7 7 7) (|UniversalSegment| 30) (|Mapping| 15 9 9)
              (|List| 30) (|List| %) (|Mapping| 9 9 9) '"last" '"rest" '"first"
              '"value" (|HashState|) (|SingleInteger|) (|Equation| 7)
              (|List| 58) (|Equation| 9) (|List| 60) (|OutputForm|) (|String|)
              (|Mapping| 15 7 7) (|Mapping| 15 7) (|Void|) (|InputForm|))
           '#(~= 40 |value| 46 |trim| 51 |third| 57 |tail| 62 |table| 67
              |swap!| 76 |split!| 90 |sorted?| 96 |sort!| 107 |sort| 118
              |smaller?| 129 |size?| 135 |sign| 141 |setvalue!| 146 |setrest!|
              152 |setlast!| 158 |setfirst!| 164 |setelt!| 170 |setchildren!|
              219 |select!| 225 |select| 237 |second| 243 |search| 248 |sample|
              254 |rightTrim| 258 |reverse!| 264 |reverse| 269 |rest| 274
              |removeDuplicates!| 285 |removeDuplicates| 290 |remove!| 295
              |remove| 325 |reduce| 337 |qsetrest!| 358 |qsetfirst!| 364
              |qsetelt!| 370 |qelt| 384 |possiblyInfinite?| 396 |positive?| 401
              |position| 406 |parts| 425 |nodes| 435 |node?| 440 |new| 446
              |negative?| 452 |more?| 457 |minIndex| 463 |min| 473
              |merge_unique!| 489 |merge_unique| 496 |merge!| 503 |merge| 516
              |members| 529 |member?| 539 |maxIndex| 551 |max| 561 |map!| 589
              |map| 601 |list| 627 |less?| 632 |leftTrim| 638 |leaves| 644
              |leaf?| 649 |latex| 654 |last| 659 |keys| 670 |key?| 675
              |inspect| 681 |insert!| 686 |insert| 706 |indices| 720 |index?|
              730 |hashUpdate!| 742 |hash| 748 |first| 753 |find| 769 |fill!|
              775 |extract!| 787 |explicitlyFinite?| 792 |every?| 797 |eval|
              809 |eq?| 861 |entry?| 867 |entries| 879 |empty?| 889 |empty| 894
              |elt| 898 |distance| 954 |dictionary| 960 |delete!| 969 |delete|
              981 |cyclic?| 993 |cycleTail| 998 |cycleSplit!| 1003
              |cycleLength| 1008 |cycleEntry| 1013 |count| 1018 |copyInto!|
              1042 |copy| 1049 |convert| 1054 |construct| 1059 |concat!| 1064
              |concat| 1081 |coerce| 1104 |children| 1109 |child?| 1114 |assoc|
              1120 |any?| 1126 >= 1138 > 1144 = 1150 <= 1156 < 1162 |#| 1168)
           'NIL
           (CONS
            (|makeByteWordVec2| 19
                                '(0 0 0 0 0 0 0 0 0 0 1 0 0 9 0 0 0 0 9 0 0 2
                                  14 11 13 0 0 0 3 19 1 17 11 13 0 0 0 0 0 0))
            (CONS
             '#(|AssociationListAggregate&| |TableAggregate&| |ListAggregate&|
                |KeyedDictionary&| |StreamAggregate&| NIL
                |ExtensibleLinearAggregate&| |Dictionary&| |LinearAggregate&|
                |DictionaryOperations&| |OrderedSet&|
                |UnaryRecursiveAggregate&| |BagAggregate&| NIL
                |IndexedAggregate&| |RecursiveAggregate&| |Collection&|
                |IndexedAggregate&| NIL |HomogeneousAggregate&|
                |HomogeneousAggregate&| |Hashable&| |SetCategory&| |Evalable&|
                |Evalable&| |Aggregate&| |EltableAggregate&|
                |EltableAggregate&| NIL |BasicType&| |PartialOrder&| NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|AssociationListAggregate| 6 7) (|TableAggregate| 6 7)
                 (|ListAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|KeyedDictionary| 6 7)
                 (|StreamAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|FiniteLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ExtensibleLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|LinearAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|OrderedSet|)
                 (|UnaryRecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Comparable|) (|IndexedAggregate| 6 7)
                 (|RecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 30
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 7)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Hashable|) (|SetCategory|) (|Evalable| 7)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Aggregate|) (|EltableAggregate| 6 7)
                 (|EltableAggregate| 30
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ConvertibleTo| 67) (|BasicType|) (|PartialOrder|)
                 (|CoercibleTo| 62) (|InnerEvalable| 7 7)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|shallowlyMutable|) (|Type|) (|Eltable| 6 7)
                 (|Eltable| 30 (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Eltable| 47 $$) (|finiteAggregate|))
              (|makeByteWordVec2| 67
                                  '(1 8 0 10 11 1 8 10 0 14 2 10 0 0 0 26 2 10
                                    9 0 9 28 2 6 15 0 0 33 2 8 10 0 10 38 2 6
                                    15 0 0 40 2 30 15 0 0 1 1 0 9 0 1 2 25 0 0
                                    9 1 1 0 9 0 1 1 0 0 0 1 0 0 0 1 1 0 0 10 1
                                    3 31 66 0 6 6 1 3 31 66 0 30 30 1 2 31 0 0
                                    21 1 1 26 15 0 1 2 20 15 48 0 1 2 32 0 48 0
                                    1 1 33 0 0 1 1 26 0 0 1 2 20 0 48 0 1 2 27
                                    15 0 0 1 2 0 15 0 21 1 1 23 30 0 1 2 31 9 0
                                    9 1 2 31 0 0 0 27 2 31 9 0 9 1 2 31 9 0 9
                                    29 3 0 7 0 6 7 39 3 31 9 0 30 9 1 3 31 9 0
                                    47 9 1 3 31 9 0 52 9 1 3 31 0 0 53 0 1 3 31
                                    9 0 54 9 1 3 31 9 0 55 9 1 2 31 0 0 50 1 2
                                    0 0 43 0 1 2 20 0 43 0 1 2 20 0 43 0 1 1 0
                                    9 0 1 2 0 34 6 0 35 0 0 0 1 2 25 0 0 9 1 1
                                    32 0 0 1 1 20 0 0 1 2 0 0 0 21 1 1 0 0 0 24
                                    1 18 0 0 1 1 25 0 0 1 2 0 34 6 0 41 2 0 0
                                    43 0 1 2 25 0 9 0 1 2 20 0 43 0 1 2 18 0 9
                                    0 1 2 25 0 9 0 1 2 20 0 43 0 1 4 25 9 51 0
                                    9 9 1 2 20 9 51 0 1 3 20 9 51 0 9 1 2 31 0
                                    0 0 1 2 31 9 0 9 1 3 31 7 0 6 7 1 3 31 9 0
                                    30 9 1 2 0 7 0 6 1 2 0 9 0 30 1 1 0 15 0 1
                                    1 23 15 0 1 2 25 30 9 0 1 3 25 30 9 0 30 1
                                    2 20 30 43 0 1 1 20 10 0 18 1 20 44 0 1 1 0
                                    50 0 1 2 18 15 0 0 1 2 0 0 21 9 1 1 23 15 0
                                    1 2 0 15 0 21 1 1 4 6 0 1 1 7 30 0 31 1 22
                                    7 0 1 1 26 9 0 1 2 26 0 0 0 1 3 18 0 48 0 0
                                    1 3 25 0 48 0 0 1 3 0 0 48 0 0 1 2 1 0 0 0
                                    1 2 26 0 0 0 1 3 20 0 48 0 0 1 1 20 10 0 1
                                    1 20 44 0 1 2 21 15 7 0 1 2 25 15 9 0 1 1 4
                                    6 0 1 1 7 30 0 32 1 22 7 0 1 1 26 9 0 1 2
                                    26 0 0 0 1 2 20 9 48 0 1 2 20 7 64 0 1 2 31
                                    0 42 0 1 2 31 0 45 0 1 2 0 0 42 0 1 2 0 0
                                    45 0 1 3 0 0 46 0 0 1 3 0 0 51 0 0 1 1 0 0
                                    9 1 2 0 15 0 21 1 2 25 0 0 9 1 1 0 10 0 1 1
                                    0 15 0 1 1 28 63 0 1 2 0 0 0 21 1 1 0 9 0 1
                                    1 0 19 0 20 2 0 15 6 0 1 1 0 9 0 1 2 0 0 9
                                    0 1 3 0 0 9 0 30 1 3 0 0 0 0 30 1 3 0 0 0 0
                                    30 1 3 0 0 9 0 30 1 1 0 19 0 1 1 0 49 0 1 2
                                    0 15 6 0 1 2 0 15 30 0 1 2 24 56 56 0 1 1
                                    24 57 0 1 2 0 0 0 21 1 1 0 9 0 23 1 4 7 0 1
                                    2 0 36 43 0 1 2 31 0 0 7 1 2 31 0 0 9 1 1 0
                                    9 0 1 1 0 15 0 1 2 20 15 43 0 1 2 20 15 65
                                    0 1 3 11 0 0 44 44 1 2 11 0 0 58 1 3 11 0 0
                                    7 7 1 2 11 0 0 59 1 2 13 0 0 60 1 2 13 0 0
                                    61 1 3 13 0 0 10 10 1 3 13 0 0 9 9 1 2 0 15
                                    0 0 1 2 21 15 7 0 1 2 25 15 9 0 1 1 0 44 0
                                    1 1 0 10 0 17 1 0 15 0 16 0 0 0 13 2 0 7 0
                                    6 1 3 0 7 0 6 7 1 2 0 9 0 30 1 3 0 9 0 30 9
                                    1 2 0 0 0 47 1 2 0 9 0 52 1 2 0 0 0 53 1 2
                                    0 9 0 54 1 2 0 9 0 55 1 2 0 30 0 0 1 0 0 0
                                    12 1 0 0 10 1 2 0 0 0 30 1 2 0 0 0 47 1 2 0
                                    0 0 30 1 2 0 0 0 47 1 1 0 15 0 1 1 0 0 0 1
                                    1 31 0 0 1 1 0 21 0 1 1 0 0 0 1 2 21 21 7 0
                                    1 2 25 21 9 0 1 2 20 21 43 0 1 2 20 21 65 0
                                    1 3 32 0 0 0 30 1 1 0 0 0 1 1 3 67 0 1 1 0
                                    0 10 1 2 0 0 0 9 1 2 0 0 0 0 1 1 31 0 50 1
                                    1 0 0 50 1 2 0 0 0 9 1 2 0 0 9 0 25 2 0 0 0
                                    0 1 1 29 62 0 1 1 0 50 0 1 2 18 15 0 0 1 2
                                    0 36 6 0 37 2 20 15 43 0 1 2 20 15 65 0 1 2
                                    26 15 0 0 1 2 26 15 0 0 1 2 30 15 0 0 1 2
                                    26 15 0 0 1 2 26 15 0 0 1 1 20 21 0 22)))))
           '|lookupComplete|)) 
