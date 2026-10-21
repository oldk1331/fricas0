
(SDEFUN |KAFILE;=;2%B;1| ((|f1| (%)) (|f2| (%)) (% (|Boolean|)))
        (SPADCALL (QVELT |f1| 0) (QVELT |f2| 0) (QREFELT % 11))) 

(SDEFUN |KAFILE;coerce;%Of;2| ((|f| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |f| 0) (QREFELT % 14))) 

(SDEFUN |KAFILE;open;Fn%;3| ((|fname| (|FileName|)) (% (%)))
        (SPADCALL |fname| "input" (QREFELT % 17))) 

(SDEFUN |KAFILE;openIfCan;FnU;4|
        ((|fname| (|FileName|)) (% (|Union| % "failed")))
        (SPADCALL |fname| "input" (QREFELT % 20))) 

(SDEFUN |KAFILE;openIfCan;FnSU;5|
        ((|fname| (|FileName|)) (|mode| (|String|))
         (% (|Union| % #1="failed")))
        (SPROG
         ((|res1| (|Union| % #1#))
          (|res0| (|Union| (|BasicKeyedAccessFile|) "failed")))
         (SEQ
          (COND
           ((EQUAL |mode| "either")
            (SEQ (LETT |res1| (SPADCALL |fname| "input" (QREFELT % 20)))
                 (EXIT
                  (COND ((QEQCAR |res1| 0) |res1|)
                        (#2='T
                         (SEQ
                          (LETT |res1|
                                (SPADCALL |fname| "output" (QREFELT % 20)))
                          (EXIT
                           (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                                 (#2#
                                  (CONS 0
                                        (SPADCALL (QCDR |res1|) "input"
                                                  (QREFELT % 22))))))))))))
           (#2#
            (SEQ (LETT |res0| (SPADCALL |fname| |mode| (QREFELT % 24)))
                 (EXIT
                  (COND ((QEQCAR |res0| 1) (CONS 1 "failed"))
                        (#2#
                         (CONS 0
                               (VECTOR |fname| (QCDR |res0|) |mode| 0))))))))))) 

(SDEFUN |KAFILE;open;FnS%;6|
        ((|fname| (|FileName|)) (|mode| (|String|)) (% (%)))
        (SPROG ((|res1| (|Union| % "failed")))
               (SEQ (LETT |res1| (SPADCALL |fname| |mode| (QREFELT % 20)))
                    (EXIT
                     (COND
                      ((QEQCAR |res1| 1)
                       (|error|
                        (LIST '|mathprint|
                              (LIST 'CONCAT
                                    (SPADCALL "Can not open: " (QREFELT % 25))
                                    (SPADCALL |mode| (QREFELT % 25))))))
                      ('T (QCDR |res1|))))))) 

(SDEFUN |KAFILE;reopen!;%S%;7| ((|f| (%)) (|mode| (|String|)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 26))
             (COND
              ((SPADCALL |mode| "closed" (QREFELT % 27))
               (SEQ
                (QSETVELT |f| 1 (SPADCALL (QVELT |f| 0) |mode| (QREFELT % 28)))
                (EXIT (QSETVELT |f| 2 |mode|)))))
             (EXIT |f|))) 

(SDEFUN |KAFILE;close!;2%;8| ((|f| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "closed" (QREFELT % 27))
           (SEQ (SPADCALL (QVELT |f| 1) (QREFELT % 30))
                (EXIT (QSETVELT |f| 2 "closed")))))
         (EXIT |f|))) 

(SDEFUN |KAFILE;read!;%R;9|
        ((|f| (%)) (% (|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|))))
        (SPROG ((|ks| (|List| (|String|))) (|k| (|String|)))
               (SEQ
                (COND
                 ((SPADCALL (QVELT |f| 2) "input" (QREFELT % 27))
                  (|error|
                   (LIST '|mathprint|
                         (LIST 'CONCAT
                               (SPADCALL "File not in read state"
                                         (QREFELT % 25))
                               (SPADCALL |f| (QREFELT % 15))))))
                 (#1='T
                  (SEQ (LETT |ks| (SPADCALL (QVELT |f| 1) (QREFELT % 32)))
                       (EXIT
                        (COND
                         ((< (LENGTH |ks|) (QVELT |f| 3))
                          (|error|
                           (LIST '|mathprint|
                                 (LIST 'CONCAT
                                       (SPADCALL
                                        "Attempt to read beyond end of file"
                                        (QREFELT % 25))
                                       (SPADCALL |f| (QREFELT % 15))))))
                         (#1#
                          (SEQ
                           (LETT |k|
                                 (SPADCALL |ks| (QVELT |f| 3) (QREFELT % 34)))
                           (QSETVELT |f| 3 (+ (QVELT |f| 3) 1))
                           (EXIT
                            (CONS |k|
                                  (SPADCALL (QVELT |f| 1) |k|
                                            (QREFELT % 36)))))))))))))) 

(SDEFUN |KAFILE;write!;%2R;10|
        ((|f| (%))
         (|pr| #1=(|Record| (|:| |key| (|String|)) (|:| |entry| |Entry|)))
         (% #1#))
        (SEQ
         (COND
          ((SPADCALL (QVELT |f| 2) "output" (QREFELT % 27))
           (|error|
            (LIST '|mathprint|
                  (LIST 'CONCAT
                        (SPADCALL "File not in write state" (QREFELT % 25))
                        (SPADCALL |f| (QREFELT % 15))))))
          ('T
           (SEQ (SPADCALL (QVELT |f| 1) (QCAR |pr|) (QCDR |pr|) (QREFELT % 39))
                (EXIT |pr|)))))) 

(MAKEPROP '|KAFILE;name;%Fn;11| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 0))) 

(SDEFUN |KAFILE;name;%Fn;11| ((|f| (%)) (% (|FileName|))) (QVELT |f| 0)) 

(MAKEPROP '|KAFILE;iomode;%S;12| '|SPADreplace| '(XLAM (|f|) (QVELT |f| 2))) 

(SDEFUN |KAFILE;iomode;%S;12| ((|f| (%)) (% (|String|))) (QVELT |f| 2)) 

(SDEFUN |KAFILE;empty;%;13| ((% (%)))
        (SPROG ((|fn| (|FileName|)))
               (SEQ (LETT |fn| (SPADCALL "" "kaf" "sdata" (QREFELT % 43)))
                    (EXIT (SPADCALL |fn| "either" (QREFELT % 17)))))) 

(SDEFUN |KAFILE;keys;%L;14| ((|f| (%)) (% (|List| (|String|))))
        (SEQ (SPADCALL |f| "input" (QREFELT % 22))
             (EXIT (SPADCALL (QVELT |f| 1) (QREFELT % 32))))) 

(SDEFUN |KAFILE;#;%Nni;15| ((|f| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (SPADCALL |f| (QREFELT % 45)))) 

(SDEFUN |KAFILE;elt;%SEntry;16| ((|f| (%)) (|k| (|String|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "input" (QREFELT % 22))
             (EXIT (SPADCALL (QVELT |f| 1) |k| (QREFELT % 36))))) 

(SDEFUN |KAFILE;setelt!;%S2Entry;17|
        ((|f| (%)) (|k| (|String|)) (|e| (|Entry|)) (% (|Entry|)))
        (SEQ (SPADCALL |f| "output" (QREFELT % 22))
             (UNWIND-PROTECT (SPADCALL |f| (CONS |k| |e|) (QREFELT % 40))
               (SPADCALL |f| (QREFELT % 26)))
             (SPADCALL |f| (QREFELT % 26)) (EXIT |e|))) 

(SDEFUN |KAFILE;search;S%U;18|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| "failed")))
        (SEQ
         (COND
          ((NULL (SPADCALL |k| (SPADCALL |f| (QREFELT % 45)) (QREFELT % 50)))
           (CONS 1 "failed"))
          ('T
           (SEQ (SPADCALL |f| "input" (QREFELT % 22))
                (EXIT (CONS 0 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 36))))))))) 

(SDEFUN |KAFILE;remove!;S%U;19|
        ((|k| (|String|)) (|f| (%)) (% (|Union| |Entry| #1="failed")))
        (SPROG ((|result| (|Union| |Entry| #1#)))
               (SEQ (LETT |result| (SPADCALL |k| |f| (QREFELT % 52)))
                    (EXIT
                     (COND ((QEQCAR |result| 1) |result|)
                           ('T
                            (SEQ (SPADCALL |f| "output" (QREFELT % 22))
                                 (SPADCALL (QVELT |f| 1) |k| (QREFELT % 53))
                                 (SPADCALL |f| (QREFELT % 26))
                                 (EXIT |result|)))))))) 

(SDEFUN |KAFILE;pack!;2%;20| ((|f| (%)) (% (%)))
        (SEQ (SPADCALL |f| (QREFELT % 26)) (EXIT |f|))) 

(DECLAIM (NOTINLINE |KeyedAccessFile;|)) 

(DEFUN |KeyedAccessFile;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G136 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|KeyedAccessFile| DV$1))
          (LETT % (GETREFV 72))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (AND
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                (LIST '|Evalable|
                                                      (LIST '|Record|
                                                            '(|:| |key|
                                                                  (|String|))
                                                            (LIST '|:| '|entry|
                                                                  (|devaluate|
                                                                   |#1|)))))
                                               (|HasCategory|
                                                (|Record|
                                                 (|:| |key| (|String|))
                                                 (|:| |entry| |#1|))
                                                '(|SetCategory|)))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|ConvertibleTo|
                                                 (|InputForm|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              (LIST '|Evalable|
                                                                    (|devaluate|
                                                                     |#1|)))
                                               (|HasCategory| |#1|
                                                              '(|SetCategory|)))
                                              (|HasCategory| |#1|
                                                             '(|OrderedSet|))
                                              (|HasCategory| |#1|
                                                             '(|BasicType|))
                                              (|HasCategory| (|String|)
                                                             '(|OrderedSet|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|BasicType|))
                                              (|HasCategory|
                                               (|Record| (|:| |key| (|String|))
                                                         (|:| |entry| |#1|))
                                               '(|OrderedSet|))))))
          (|haddProp| |$ConstructorCache| '|KeyedAccessFile| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|shallowlyMutable|))
               (|augmentPredVector| % 256))
          (AND (LETT #1# (|HasCategory| % '(|finiteAggregate|)))
               (|augmentPredVector| % 512))
          (AND (|HasCategory| |#1| '(|OrderedSet|)) #1#
               (|augmentPredVector| % 1024))
          (AND (|HasCategory| |#1| '(|BasicType|)) #1#
               (|augmentPredVector| % 2048))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|BasicType|))
               (|augmentPredVector| % 4096))
          (AND #1#
               (|HasCategory|
                (|Record| (|:| |key| (|String|)) (|:| |entry| |#1|))
                '(|OrderedSet|))
               (|augmentPredVector| % 8192))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |car| (|SExpression|))
                              (|:| |cdr| (|SExpression|))))
          (QSETREFV % 8
                    (|Record| (|:| |fileName| (|FileName|))
                              (|:| |fileState| (|BasicKeyedAccessFile|))
                              (|:| |fileIOmode| (|String|))
                              (|:| |rpos| (|Integer|))))
          %))) 

(DEFUN |KeyedAccessFile| (#1=#:G137)
  (SPROG NIL
         (PROG (#2=#:G138)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|KeyedAccessFile|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|KeyedAccessFile;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|KeyedAccessFile|)))))))))) 

(MAKEPROP '|KeyedAccessFile| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Cons| '|Rep| (|Boolean|)
              (|FileName|) (0 . =) |KAFILE;=;2%B;1| (|OutputForm|)
              (6 . |coerce|) |KAFILE;coerce;%Of;2| (|String|)
              |KAFILE;open;FnS%;6| |KAFILE;open;Fn%;3| (|Union| % '"failed")
              |KAFILE;openIfCan;FnSU;5| |KAFILE;openIfCan;FnU;4|
              |KAFILE;reopen!;%S%;7| (|BasicKeyedAccessFile|)
              (11 . |openIfCan|) (17 . |coerce|) |KAFILE;close!;2%;8| (22 . ~=)
              (28 . |open|) (|Void|) (34 . |close!|) (|List| 16) (39 . |keys|)
              (|Integer|) (44 . |elt|) (|None|) (50 . |read|)
              (|Record| (|:| |key| 16) (|:| |entry| 6)) |KAFILE;read!;%R;9|
              (56 . |write!|) |KAFILE;write!;%2R;10| |KAFILE;name;%Fn;11|
              |KAFILE;iomode;%S;12| (63 . |new|) |KAFILE;empty;%;13|
              |KAFILE;keys;%L;14| (|NonNegativeInteger|) |KAFILE;#;%Nni;15|
              |KAFILE;elt;%SEntry;16| |KAFILE;setelt!;%S2Entry;17|
              (70 . |member?|) (|Union| 6 '"failed") |KAFILE;search;S%U;18|
              (76 . |remove!|) |KAFILE;remove!;S%U;19| |KAFILE;pack!;2%;20|
              (|List| 37) (|Mapping| 6 6 6) (|Mapping| 6 6) (|List| 6)
              (|Union| 37 '"failed") (|Mapping| 9 37) (|Mapping| 37 37)
              (|Mapping| 37 37 37) (|List| 65) (|Equation| 6) (|List| 67)
              (|Equation| 37) (|Mapping| 9 6) (|Mapping| 9 6 6)
              (|Mapping| 9 37 37) (|InputForm|))
           '#(~= 82 |write!| 88 |table| 94 |swap!| 103 |size?| 110 |setelt!|
              116 |select!| 123 |select| 129 |search| 135 |sample| 141
              |reopen!| 145 |removeDuplicates| 151 |remove!| 156 |remove| 174
              |reduce| 186 |read!| 207 |qsetelt!| 212 |qelt| 219 |parts| 225
              |pack!| 235 |openIfCan| 240 |open| 251 |name| 262 |more?| 267
              |minIndex| 273 |min| 278 |members| 288 |member?| 298 |maxIndex|
              310 |max| 315 |map!| 337 |map| 349 |less?| 368 |latex| 374 |keys|
              379 |key?| 384 |iomode| 390 |inspect| 395 |insert!| 400 |indices|
              406 |index?| 411 |flush| 417 |first| 422 |find| 427 |fill!| 433
              |extract!| 439 |every?| 444 |eval| 456 |eq?| 508 |entry?| 514
              |entries| 520 |empty?| 525 |empty| 530 |elt| 534 |dictionary| 547
              |count| 556 |copy| 580 |convert| 585 |construct| 590 |coerce| 595
              |close!| 600 |any?| 605 = 617 |#| 623)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 0 0 0 0 0 0 0 0 3 1 0 0 0 3 2 1 0 0 0 0 0
                                  0))
            (CONS
             '#(|TableAggregate&| |KeyedDictionary&| |Dictionary&|
                |DictionaryOperations&| |BagAggregate&| |Collection&|
                |IndexedAggregate&| |HomogeneousAggregate&|
                |HomogeneousAggregate&| NIL |Evalable&| |Evalable&|
                |Aggregate&| |EltableAggregate&| |SetCategory&|
                |InnerEvalable&| NIL |InnerEvalable&| NIL NIL NIL NIL NIL
                |BasicType&|)
             (CONS
              '#((|TableAggregate| 16 6) (|KeyedDictionary| 16 6)
                 (|Dictionary| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|DictionaryOperations|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|BagAggregate| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Collection| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|IndexedAggregate| 16 6)
                 (|HomogeneousAggregate|
                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|HomogeneousAggregate| 6)
                 (|FileCategory| 10 (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Evalable| 6)
                 (|Evalable| (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|Aggregate|) (|EltableAggregate| 16 6) (|SetCategory|)
                 (|InnerEvalable| 6 6) (|ConvertibleTo| 71)
                 (|InnerEvalable| (|Record| (|:| |key| 16) (|:| |entry| 6))
                                  (|Record| (|:| |key| 16) (|:| |entry| 6)))
                 (|CoercibleTo| 13) (|Type|) (|shallowlyMutable|)
                 (|Eltable| 16 6) (|finiteAggregate|) (|BasicType|))
              (|makeByteWordVec2| 71
                                  '(2 10 9 0 0 11 1 10 13 0 14 2 23 19 10 16 24
                                    1 16 13 0 25 2 16 9 0 0 27 2 23 0 10 16 28
                                    1 23 29 0 30 1 23 31 0 32 2 31 16 0 33 34 2
                                    23 35 0 16 36 3 23 29 0 16 35 39 3 10 0 16
                                    16 16 43 2 31 9 16 0 50 2 23 29 0 16 53 2 0
                                    9 0 0 1 2 0 37 0 37 40 1 0 0 56 1 0 0 0 1 3
                                    9 29 0 16 16 1 2 0 9 0 46 1 3 0 6 0 16 6 49
                                    2 10 0 61 0 1 2 10 0 61 0 1 2 0 51 16 0 52
                                    0 0 0 1 2 0 0 0 16 22 1 13 0 0 1 2 0 51 16
                                    0 54 2 13 0 37 0 1 2 10 0 61 0 1 2 13 0 37
                                    0 1 2 10 0 61 0 1 4 13 37 63 0 37 37 1 2 10
                                    37 63 0 1 3 10 37 63 0 37 1 1 0 37 0 38 3 9
                                    6 0 16 6 1 2 0 6 0 16 1 1 10 59 0 1 1 10 56
                                    0 1 1 0 0 0 55 1 0 19 10 21 2 0 19 10 16 20
                                    1 0 0 10 18 2 0 0 10 16 17 1 0 10 0 41 2 0
                                    9 0 46 1 1 6 16 0 1 1 11 6 0 1 1 14 37 0 1
                                    1 10 59 0 1 1 10 56 0 1 2 12 9 6 0 1 2 13 9
                                    37 0 1 1 6 16 0 1 1 11 6 0 1 1 14 37 0 1 2
                                    10 6 69 0 1 2 10 37 70 0 1 2 9 0 58 0 1 2 9
                                    0 62 0 1 3 0 0 57 0 0 1 2 0 0 58 0 1 2 0 0
                                    62 0 1 2 0 9 0 46 1 1 0 16 0 1 1 0 31 0 45
                                    2 0 9 16 0 1 1 0 16 0 42 1 0 37 0 1 2 0 0
                                    37 0 1 1 0 31 0 1 2 0 9 16 0 1 1 0 29 0 1 1
                                    6 6 0 1 2 0 60 61 0 1 2 9 0 0 6 1 1 0 37 0
                                    1 2 10 9 68 0 1 2 10 9 61 0 1 2 3 0 0 64 1
                                    2 3 0 0 65 1 3 3 0 0 59 59 1 3 3 0 0 6 6 1
                                    3 1 0 0 56 56 1 3 1 0 0 37 37 1 2 1 0 0 66
                                    1 2 1 0 0 67 1 2 0 9 0 0 1 2 12 9 6 0 1 1 0
                                    59 0 1 1 0 9 0 1 0 0 0 44 3 0 6 0 16 6 1 2
                                    0 6 0 16 48 1 0 0 56 1 0 0 0 1 2 12 46 6 0
                                    1 2 13 46 37 0 1 2 10 46 68 0 1 2 10 46 61
                                    0 1 1 0 0 0 1 1 2 71 0 1 1 0 0 56 1 1 0 13
                                    0 15 1 0 0 0 26 2 10 9 68 0 1 2 10 9 61 0 1
                                    2 0 9 0 0 12 1 10 46 0 47)))))
           '|lookupComplete|)) 
