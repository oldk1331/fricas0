
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
        (SPROG ((#1=#:G29 NIL) (|k| NIL) (#2=#:G28 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |t| (QREFELT % 14)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS (QCAR |k|) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

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
        (SPADCALL (SPADCALL |p| (SPADCALL |t| (QREFELT % 14)) (QREFELT % 25))
                  (QREFELT % 11))) 

(SDEFUN |ALIST;setrest!;3%;11| ((|a| (%)) (|b| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |a| (QREFELT % 14)) (SPADCALL |b| (QREFELT % 14))
                   (QREFELT % 27))
         (QREFELT % 11))) 

(SDEFUN |ALIST;setfirst!;%2R;12|
        ((|a| (%)) (|p| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|)))
         (% (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
        (SPADCALL (SPADCALL |a| (QREFELT % 14)) |p| (QREFELT % 29))) 

(SDEFUN |ALIST;minIndex;%I;13| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 14)) (QREFELT % 32))) 

(SDEFUN |ALIST;maxIndex;%I;14| ((|a| (%)) (% (|Integer|)))
        (SPADCALL (SPADCALL |a| (QREFELT % 14)) (QREFELT % 34))) 

(SDEFUN |ALIST;search;Key%U;15|
        ((|k| (|Key|)) (|t| (%)) (% (|Union| |Entry| "failed")))
        (SPROG ((#1=#:G53 NIL) (#2=#:G54 NIL) (#3=#:G55 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL)
                         (LETT #3# (SPADCALL |t| (QREFELT % 14))) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| (QCAR |r|) (QREFELT % 36))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 0 (QCDR |r|)))
                                     (GO #4=#:G52)))
                              (GO #5=#:G47))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |ALIST;assoc;Key%U;16|
        ((|k| (|Key|)) (|t| (%))
         (%
          (|Union| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
                   "failed")))
        (SPROG ((#1=#:G67 NIL) (#2=#:G68 NIL) (#3=#:G69 NIL) (|r| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |r| NIL)
                         (LETT #3# (SPADCALL |t| (QREFELT % 14))) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |r| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k| (QCAR |r|) (QREFELT % 36))
                             (PROGN
                              (LETT #1#
                                    (PROGN
                                     (LETT #2# (CONS 0 |r|))
                                     (GO #4=#:G66)))
                              (GO #5=#:G61))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #4# (EXIT #2#)))) 

(SDEFUN |ALIST;setelt!;%Key2Entry;17|
        ((|t| (%)) (|k| (|Key|)) (|e| (|Entry|)) (% (|Entry|)))
        (SPROG
         ((|r|
           (|Union| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))
                    "failed")))
         (SEQ (LETT |r| (SPADCALL |k| |t| (QREFELT % 40)))
              (EXIT
               (COND
                ((QEQCAR |r| 0) (PROGN (RPLACD #1=(QCDR |r|) |e|) (QCDR #1#)))
                ('T
                 (SEQ
                  (SPADCALL |t|
                            (SPADCALL (CONS |k| |e|)
                                      (SPADCALL |t| (QREFELT % 14))
                                      (QREFELT % 25))
                            (QREFELT % 41))
                  (EXIT |e|)))))))) 

(SDEFUN |ALIST;remove!;Key%U;18|
        ((|k| (|Key|)) (|t| (%)) (% (|Union| |Entry| "failed")))
        (SPROG
         ((|curr| (|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
          (|prev|
           #1=(|List| (|Record| (|:| |key| |Key|) (|:| |entry| |Entry|))))
          (|l| #1#))
         (SEQ
          (COND
           ((NULL (LETT |l| (SPADCALL |t| (QREFELT % 14)))) (CONS 1 "failed"))
           ((SPADCALL |k| (QCAR (|SPADfirst| |l|)) (QREFELT % 36))
            (SEQ (SPADCALL |t| (CDR |l|) (QREFELT % 41))
                 (EXIT (CONS 0 (QCDR (|SPADfirst| |l|))))))
           (#2='T
            (SEQ (LETT |prev| |l|) (LETT |curr| (CDR |l|))
                 (SEQ G190
                      (COND
                       ((NULL
                         (COND ((NULL |curr|) NIL)
                               ('T
                                (SPADCALL (QCAR (|SPADfirst| |curr|)) |k|
                                          (QREFELT % 43)))))
                        (GO G191)))
                      (SEQ (LETT |prev| |curr|)
                           (EXIT (LETT |curr| (CDR |curr|))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (COND ((NULL |curr|) (CONS 1 "failed"))
                        (#2#
                         (SEQ (SPADCALL |prev| (CDR |curr|) (QREFELT % 27))
                              (EXIT
                               (CONS 0 (QCDR (|SPADfirst| |curr|)))))))))))))) 

(DECLAIM (NOTINLINE |AssociationList;|)) 

(DEFUN |AssociationList| (&REST #1=#:G167)
  (SPROG NIL
         (PROG (#2=#:G168)
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

(DEFUN |AssociationList;| (|#1| |#2|)
  (SPROG
   ((#1=#:G164 NIL) (#2=#:G166 NIL) (#3=#:G165 NIL) (|pv$| NIL) (#4=#:G159 NIL)
    (#5=#:G160 NIL) (#6=#:G161 NIL) (#7=#:G162 NIL) (#8=#:G163 NIL) (% NIL)
    (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|AssociationList| DV$1 DV$2))
    (LETT % (GETREFV 71))
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
                                        (LETT #8#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|Comparable|)))
                                        (OR #8#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|)))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|SetCategory|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         #7#)
                                        (LETT #6#
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
                                         #6#)
                                        (OR #7# #8#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|))
                                            #6#)
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #5#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|CoercibleTo|
                                                 (|OutputForm|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         #7# #5# #8#
                                         (|HasCategory|
                                          (|Record| (|:| |key| |#1|)
                                                    (|:| |entry| |#2|))
                                          '(|OrderedSet|))
                                         #6#)
                                        (LETT #4#
                                              (|HasCategory|
                                               (|Record| (|:| |key| |#1|)
                                                         (|:| |entry| |#2|))
                                               '(|BasicType|)))
                                        (OR (|HasCategory| |#2| '(|BasicType|))
                                            #7# #4# #8#
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|Hashable|))
                                            (|HasCategory|
                                             (|Record| (|:| |key| |#1|)
                                                       (|:| |entry| |#2|))
                                             '(|OrderedSet|))
                                            #6#)))))
    (|haddProp| |$ConstructorCache| '|AssociationList| (LIST DV$1 DV$2)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND (LETT #3# (|HasCategory| % '(|finiteAggregate|)))
         (|augmentPredVector| % 524288))
    (AND (|HasCategory| |#2| '(|BasicType|)) #3#
         (|augmentPredVector| % 1048576))
    (AND (|HasCategory| |#2| '(|OrderedSet|)) #3#
         (|augmentPredVector| % 2097152))
    (AND #3#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|Hashable|))
         (|augmentPredVector| % 4194304))
    (AND #3# #4# (|augmentPredVector| % 8388608))
    (AND
     (LETT #2#
           (AND (|HasCategory| % '(|finiteAggregate|))
                (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                               '(|OrderedSet|))))
     (|augmentPredVector| % 16777216))
    (AND (OR (AND #3# #8#) #2#) (|augmentPredVector| % 33554432))
    (AND (OR #7# (AND #3# #8#) #2# #6#) (|augmentPredVector| % 67108864))
    (AND
     (OR (|HasCategory| |#2| '(|CoercibleTo| (|OutputForm|))) (AND #3# #8#) #2#
         #5#)
     (|augmentPredVector| % 134217728))
    (AND
     (OR (AND (|HasCategory| |#2| '(|BasicType|)) #3#) #7# (AND #3# #4#)
         (AND #3# #8#)
         (AND #3#
              (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                             '(|Hashable|)))
         #2# #6#)
     (|augmentPredVector| % 268435456))
    (AND (LETT #1# (|HasCategory| % '(|shallowlyMutable|)))
         (|augmentPredVector| % 536870912))
    (AND #3# #1# (|augmentPredVector| % 1073741824))
    (AND #3# #1#
         (|HasCategory| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|))
                        '(|OrderedSet|))
         (|augmentPredVector| % 2147483648))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 8
              (|Reference|
               (|List| (|Record| (|:| |key| |#1|) (|:| |entry| |#2|)))))
    %))) 

(MAKEPROP '|AssociationList| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Record| (|:| |key| 6) (|:| |entry| 7)) (|List| 9) (0 . |ref|)
              |ALIST;dictionary;%;1| |ALIST;empty;%;2| (5 . |deref|)
              (|Boolean|) |ALIST;empty?;%B;3| |ALIST;entries;%L;4|
              |ALIST;parts;%L;5| (|List| 6) |ALIST;keys;%L;6|
              (|NonNegativeInteger|) |ALIST;#;%Nni;7| |ALIST;first;%R;8|
              |ALIST;rest;2%;9| (10 . |concat|) |ALIST;concat;R2%;10|
              (16 . |setrest!|) |ALIST;setrest!;3%;11| (22 . |setfirst!|)
              |ALIST;setfirst!;%2R;12| (|Integer|) (28 . |minIndex|)
              |ALIST;minIndex;%I;13| (33 . |maxIndex|) |ALIST;maxIndex;%I;14|
              (38 . =) (|Union| 7 '"failed") |ALIST;search;Key%U;15|
              (|Union| 9 '"failed") |ALIST;assoc;Key%U;16| (44 . |setref|)
              |ALIST;setelt!;%Key2Entry;17| (50 . ~=) |ALIST;remove!;Key%U;18|
              (|List| 46) (|Equation| 9) (|Mapping| 9 9 9) (|HashState|)
              (|SingleInteger|) (|Mapping| 15 9 9) (|List| 52) (|Equation| 7)
              (|List| 7) (|OutputForm|) (|String|) (|InputForm|)
              (|Mapping| 15 9) (|Mapping| 15 7) (|Mapping| 15 7 7)
              (|Mapping| 9 9) '"value" (|List| %) '"first" '"rest" '"last"
              (|UniversalSegment| 31) (|Void|) (|Mapping| 7 7) (|List| 31)
              (|Mapping| 7 7 7))
           '#(~= 56 |value| 62 |trim| 67 |third| 73 |tail| 78 |table| 83
              |swap!| 92 |split!| 106 |sorted?| 112 |sort!| 123 |sort| 134
              |smaller?| 145 |size?| 151 |setvalue!| 157 |setrest!| 163
              |setlast!| 169 |setfirst!| 175 |setelt!| 181 |setchildren!| 230
              |select!| 236 |select| 248 |second| 254 |search| 259 |sample| 265
              |rightTrim| 269 |reverse!| 275 |reverse| 280 |rest| 285
              |removeDuplicates!| 296 |removeDuplicates| 301 |remove!| 306
              |remove| 336 |reduce| 348 |qsetrest!| 369 |qsetfirst!| 375
              |qsetelt!| 381 |qelt| 395 |possiblyInfinite?| 407 |position| 412
              |parts| 431 |nodes| 441 |node?| 446 |new| 452 |more?| 458
              |minIndex| 464 |min| 474 |merge!| 490 |merge| 503 |members| 516
              |member?| 526 |maxIndex| 538 |max| 548 |map!| 576 |map| 588
              |list| 614 |less?| 619 |leftTrim| 625 |leaves| 631 |leaf?| 636
              |latex| 641 |last| 646 |keys| 657 |key?| 662 |inspect| 668
              |insert!| 673 |insert| 693 |indices| 707 |index?| 717
              |hashUpdate!| 729 |hash| 735 |first| 740 |find| 756 |fill!| 762
              |extract!| 774 |explicitlyFinite?| 779 |every?| 784 |eval| 796
              |eq?| 848 |entry?| 854 |entries| 866 |empty?| 876 |empty| 881
              |elt| 885 |distance| 941 |dictionary| 947 |delete!| 956 |delete|
              968 |cyclic?| 980 |cycleTail| 985 |cycleSplit!| 990 |cycleLength|
              995 |cycleEntry| 1000 |count| 1005 |copyInto!| 1029 |copy| 1036
              |convert| 1041 |construct| 1046 |concat!| 1051 |concat| 1068
              |coerce| 1091 |children| 1096 |child?| 1101 |assoc| 1107 |any?|
              1113 >= 1125 > 1131 = 1137 <= 1143 < 1149 |#| 1155)
           'NIL
           (CONS
            (|makeByteWordVec2| 19
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 9 0 0 0
                                  13 11 14 2 0 0 0 0 0 0 13 11 17 1 19 3))
            (CONS
             '#(|AssociationListAggregate&| |TableAggregate&|
                |KeyedDictionary&| |Dictionary&| |ListAggregate&|
                |DictionaryOperations&| |ExtensibleLinearAggregate&| NIL
                |StreamAggregate&| |BagAggregate&| |LinearAggregate&|
                |UnaryRecursiveAggregate&| |IndexedAggregate&| |Collection&|
                |RecursiveAggregate&| |IndexedAggregate&| |OrderedSet&|
                |HomogeneousAggregate&| |HomogeneousAggregate&| NIL
                |EltableAggregate&| |EltableAggregate&| |Aggregate&|
                |Evalable&| |Evalable&| |SetCategory&| |Hashable&| NIL NIL NIL
                NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL
                |PartialOrder&| |BasicType&| NIL)
             (CONS
              '#((|AssociationListAggregate| 6 7) (|TableAggregate| 6 7)
                 (|KeyedDictionary| 6 7)
                 (|Dictionary| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ListAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|ExtensibleLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|FiniteLinearAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|StreamAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|BagAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|LinearAggregate| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|UnaryRecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 31
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Collection| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|RecursiveAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|IndexedAggregate| 6 7) (|OrderedSet|)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|HomogeneousAggregate| 7) (|Comparable|)
                 (|EltableAggregate| 31
                                     (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|EltableAggregate| 6 7) (|Aggregate|)
                 (|Evalable| (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Evalable| 7) (|SetCategory|) (|Hashable|)
                 (|finiteAggregate|) (|Eltable| 66 $$)
                 (|Eltable| 31 (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|Eltable| 6 7) (|Type|) (|shallowlyMutable|)
                 (|InnerEvalable| (|Record| (|:| |key| 6) (|:| |entry| 7))
                                  (|Record| (|:| |key| 6) (|:| |entry| 7)))
                 (|InnerEvalable| 7 7) (|CoercibleTo| 54) (|PartialOrder|)
                 (|BasicType|) (|ConvertibleTo| 56))
              (|makeByteWordVec2| 70
                                  '(1 8 0 10 11 1 8 10 0 14 2 10 0 9 0 25 2 10
                                    0 0 0 27 2 10 9 0 9 29 1 10 31 0 32 1 10 31
                                    0 34 2 6 15 0 0 36 2 8 10 0 10 41 2 6 15 0
                                    0 43 2 29 15 0 0 1 1 0 9 0 1 2 24 0 0 9 1 1
                                    0 9 0 1 1 0 0 0 1 0 0 0 1 1 0 0 10 1 3 30
                                    67 0 31 31 1 3 30 67 0 6 6 1 2 30 0 0 21 1
                                    1 25 15 0 1 2 20 15 50 0 1 1 32 0 0 1 2 31
                                    0 50 0 1 1 25 0 0 1 2 20 0 50 0 1 2 26 15 0
                                    0 1 2 0 15 0 21 1 2 30 9 0 9 1 2 30 0 0 0
                                    28 2 30 9 0 9 1 2 30 9 0 9 30 3 30 9 0 61 9
                                    1 3 30 9 0 63 9 1 3 30 0 0 64 0 1 3 30 9 0
                                    65 9 1 3 30 9 0 66 9 1 3 30 9 0 31 9 1 3 0
                                    7 0 6 7 42 2 30 0 0 62 1 2 20 0 57 0 1 2 0
                                    0 57 0 1 2 20 0 57 0 1 1 0 9 0 1 2 0 37 6 0
                                    38 0 0 0 1 2 24 0 0 9 1 1 31 0 0 1 1 20 0 0
                                    1 1 0 0 0 24 2 0 0 0 21 1 1 18 0 0 1 1 24 0
                                    0 1 2 24 0 9 0 1 2 18 0 9 0 1 2 20 0 57 0 1
                                    2 0 0 57 0 1 2 0 37 6 0 44 2 24 0 9 0 1 2
                                    20 0 57 0 1 4 24 9 47 0 9 9 1 2 20 9 47 0 1
                                    3 20 9 47 0 9 1 2 30 0 0 0 1 2 30 9 0 9 1 3
                                    30 9 0 31 9 1 3 30 7 0 6 7 1 2 0 9 0 31 1 2
                                    0 7 0 6 1 1 0 15 0 1 2 24 31 9 0 1 3 24 31
                                    9 0 31 1 2 20 31 57 0 1 1 20 10 0 18 1 20
                                    53 0 1 1 0 62 0 1 2 18 15 0 0 1 2 0 0 21 9
                                    1 2 0 15 0 21 1 1 7 31 0 33 1 4 6 0 1 1 25
                                    9 0 1 2 25 0 0 0 1 1 22 7 0 1 2 1 0 0 0 1 3
                                    0 0 50 0 0 1 2 25 0 0 0 1 3 20 0 50 0 0 1 1
                                    20 10 0 1 1 20 53 0 1 2 24 15 9 0 1 2 21 15
                                    7 0 1 1 7 31 0 35 1 4 6 0 1 1 25 9 0 1 2 25
                                    0 0 0 1 1 22 7 0 1 2 20 9 50 0 1 2 20 7 59
                                    0 1 2 30 0 60 0 1 2 30 0 68 0 1 2 0 0 60 0
                                    1 3 0 0 47 0 0 1 3 0 0 70 0 0 1 2 0 0 68 0
                                    1 1 0 0 9 1 2 0 15 0 21 1 2 24 0 0 9 1 1 0
                                    10 0 1 1 0 15 0 1 1 27 55 0 1 1 0 9 0 1 2 0
                                    0 0 21 1 1 0 19 0 20 2 0 15 6 0 1 1 0 9 0 1
                                    3 0 0 0 0 31 1 3 0 0 9 0 31 1 2 0 0 9 0 1 3
                                    0 0 9 0 31 1 3 0 0 0 0 31 1 1 0 69 0 1 1 0
                                    19 0 1 2 0 15 31 0 1 2 0 15 6 0 1 2 23 48
                                    48 0 1 1 23 49 0 1 1 4 7 0 1 1 0 9 0 23 2 0
                                    0 0 21 1 2 0 39 57 0 1 2 30 0 0 9 1 2 30 0
                                    0 7 1 1 0 9 0 1 1 0 15 0 1 2 20 15 57 0 1 2
                                    20 15 58 0 1 2 13 0 0 45 1 3 13 0 0 9 9 1 2
                                    13 0 0 46 1 3 13 0 0 10 10 1 2 11 0 0 51 1
                                    2 11 0 0 52 1 3 11 0 0 53 53 1 3 11 0 0 7 7
                                    1 2 0 15 0 0 1 2 24 15 9 0 1 2 21 15 7 0 1
                                    1 0 10 0 17 1 0 53 0 1 1 0 15 0 16 0 0 0 13
                                    2 0 9 0 61 1 2 0 9 0 63 1 2 0 0 0 64 1 2 0
                                    9 0 65 1 2 0 0 0 66 1 3 0 9 0 31 9 1 2 0 9
                                    0 31 1 2 0 7 0 6 1 3 0 7 0 6 7 1 2 0 31 0 0
                                    1 0 0 0 12 1 0 0 10 1 2 0 0 0 31 1 2 0 0 0
                                    66 1 2 0 0 0 31 1 2 0 0 0 66 1 1 0 15 0 1 1
                                    0 0 0 1 1 30 0 0 1 1 0 21 0 1 1 0 0 0 1 2
                                    24 21 9 0 1 2 21 21 7 0 1 2 20 21 57 0 1 2
                                    20 21 58 0 1 3 31 0 0 0 31 1 1 0 0 0 1 1 3
                                    56 0 1 1 0 0 10 1 1 30 0 62 1 2 0 0 0 0 1 2
                                    0 0 0 9 1 2 0 0 9 0 26 2 0 0 0 0 1 2 0 0 0
                                    9 1 1 0 0 62 1 1 28 54 0 1 1 0 62 0 1 2 18
                                    15 0 0 1 2 0 39 6 0 40 2 20 15 57 0 1 2 20
                                    15 58 0 1 2 25 15 0 0 1 2 25 15 0 0 1 2 29
                                    15 0 0 1 2 25 15 0 0 1 2 25 15 0 0 1 1 20
                                    21 0 22)))))
           '|lookupComplete|)) 
