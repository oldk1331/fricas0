
(SDEFUN |IBITS;minIndex;%I;1| ((|u| (%)) (% (|Integer|))) (QREFELT % 6)) 

(SDEFUN |IBITS;range| ((|v| (%)) (|i| (|Integer|)) (% (|Integer|)))
        (SEQ
         (COND
          ((>= |i| 0)
           (COND ((< |i| (SPADCALL |v| (QREFELT % 10))) (EXIT |i|)))))
         (EXIT (|error| "Index out of range")))) 

(SDEFUN |IBITS;coerce;%Of;3| ((|v| (%)) (% (|OutputForm|)))
        (SPROG
         ((|t| #1=(|Character|)) (|f| #1#) (|s| (|String|)) (|j| NIL) (|i| NIL)
          (#2=#:G17 NIL))
         (SEQ (LETT |t| (|STR_to_CHAR| "1")) (LETT |f| (|STR_to_CHAR| "0"))
              (LETT |s|
                    (|make_string_code| (SPADCALL |v| (QREFELT % 10))
                                        (SPADCALL (QREFELT % 12))))
              (SEQ (LETT |j| (QREFELT % 6))
                   (LETT |i| (SPADCALL |s| (QREFELT % 14)))
                   (LETT #2# (SPADCALL |s| (QREFELT % 15))) G190
                   (COND ((> |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |s| |i|
                               (COND ((SPADCALL |v| |j| (QREFELT % 17)) |t|)
                                     ('T |f|))
                               (QREFELT % 18))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT % 20)))))) 

(SDEFUN |IBITS;new;NniB%;4|
        ((|n| (|NonNegativeInteger|)) (|b| (|Boolean|)) (% (%)))
        (|make_BVEC| |n| (|bool_to_bit| |b|))) 

(MAKEPROP '|IBITS;empty;%;5| '|SPADreplace| '(XLAM NIL (|make_BVEC| 0 0))) 

(SDEFUN |IBITS;empty;%;5| ((% (%))) (|make_BVEC| 0 0)) 

(MAKEPROP '|IBITS;copy;2%;6| '|SPADreplace| '|copy_BVEC|) 

(SDEFUN |IBITS;copy;2%;6| ((|v| (%)) (% (%))) (|copy_BVEC| |v|)) 

(MAKEPROP '|IBITS;#;%Nni;7| '|SPADreplace| '|size_BVEC|) 

(SDEFUN |IBITS;#;%Nni;7| ((|v| (%)) (% (|NonNegativeInteger|)))
        (|size_BVEC| |v|)) 

(MAKEPROP '|IBITS;=;2%B;8| '|SPADreplace| '|equal_BVEC|) 

(SDEFUN |IBITS;=;2%B;8| ((|v| (%)) (|u| (%)) (% (|Boolean|)))
        (|equal_BVEC| |v| |u|)) 

(MAKEPROP '|IBITS;<;2%B;9| '|SPADreplace|
          '(XLAM (|v| |u|) (|greater_BVEC| |u| |v|))) 

(SDEFUN |IBITS;<;2%B;9| ((|v| (%)) (|u| (%)) (% (|Boolean|)))
        (|greater_BVEC| |u| |v|)) 

(SDEFUN |IBITS;and;3%;10| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 27) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;or;3%;11| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 31) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;xor;3%;12| ((|v| (%)) (|u| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|xor_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 33) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;setelt!;%I2B;13|
        ((|v| (%)) (|i| (|Integer|)) (|f| #1=(|Boolean|)) (% #1#))
        (SETELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT % 6)) %)
                     (|bool_to_bit| |f|))) 

(SDEFUN |IBITS;elt;%IB;14| ((|v| (%)) (|i| (|Integer|)) (% (|Boolean|)))
        (|bit_to_bool|
         (ELT_BVEC |v| (|IBITS;range| |v| (- |i| (QREFELT % 6)) %)))) 

(MAKEPROP '|IBITS;Not;2%;15| '|SPADreplace| '|not_BVEC|) 

(SDEFUN |IBITS;Not;2%;15| ((|v| (%)) (% (%))) (|not_BVEC| |v|)) 

(SDEFUN |IBITS;And;3%;16| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|and_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 27) |v| |u| (QREFELT % 29))))) 

(SDEFUN |IBITS;Or;3%;17| ((|u| (%)) (|v| (%)) (% (%)))
        (COND
         ((EQL (SPADCALL |v| (QREFELT % 10)) (SPADCALL |u| (QREFELT % 10)))
          (|or_BVEC| |v| |u|))
         ('T (SPADCALL (ELT % 31) |v| |u| (QREFELT % 29))))) 

(DECLAIM (NOTINLINE |IndexedBits;|)) 

(DEFUN |IndexedBits;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL) (#1=#:G52 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|IndexedBits| DV$1))
          (LETT % (GETREFV 51))
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
          (|haddProp| |$ConstructorCache| '|IndexedBits| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
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

(DEFUN |IndexedBits| (#1=#:G53)
  (SPROG NIL
         (PROG (#2=#:G54)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|IndexedBits|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedBits;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|IndexedBits|)))))))))) 

(MAKEPROP '|IndexedBits| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Integer|)
              |IBITS;minIndex;%I;1| (|NonNegativeInteger|) |IBITS;#;%Nni;7|
              (|Character|) (0 . |space|) (|String|) (4 . |minIndex|)
              (9 . |maxIndex|) (|Boolean|) |IBITS;elt;%IB;14| (14 . |setelt!|)
              (|OutputForm|) (21 . |coerce|) |IBITS;coerce;%Of;3|
              |IBITS;new;NniB%;4| |IBITS;empty;%;5| |IBITS;copy;2%;6|
              |IBITS;=;2%B;8| |IBITS;<;2%B;9| (26 . |and|) (|Mapping| 16 16 16)
              (32 . |map|) |IBITS;and;3%;10| (39 . |or|) |IBITS;or;3%;11|
              (45 . |xor|) |IBITS;xor;3%;12| |IBITS;setelt!;%I2B;13|
              |IBITS;Not;2%;15| |IBITS;And;3%;16| |IBITS;Or;3%;17|
              (|UniversalSegment| 7) (|List| %) (|List| 16)
              (|Union| 16 '"failed") (|Mapping| 16 16) (|List| 7) (|HashState|)
              (|SingleInteger|) (|Equation| 16) (|List| 47) (|Void|)
              (|InputForm|))
           '#(~= 51 ~ 57 |xor| 62 |true| 68 |trim| 72 |swap!| 78 |sorted?| 85
              |sort!| 96 |sort| 107 |smaller?| 118 |size?| 124 |sign| 130
              |setelt!| 135 |select| 149 |sample| 155 |rightTrim| 159
              |reverse!| 165 |reverse| 170 |removeDuplicates| 175 |remove| 180
              |reduce| 192 |qsetelt!| 213 |qelt| 220 |positive?| 226 |position|
              231 |parts| 250 |or| 255 |not| 261 |nor| 266 |new| 272
              |negative?| 278 |nand| 283 |more?| 289 |minIndex| 295 |min| 300
              |merge_unique| 311 |merge| 318 |members| 331 |member?| 336
              |maxIndex| 342 |max| 347 |map!| 364 |map| 370 |less?| 383
              |leftTrim| 389 |latex| 395 |insert| 400 |indices| 414 |index?|
              419 |hashUpdate!| 425 |hash| 431 |first| 436 |find| 447 |fill!|
              453 |false| 459 |every?| 463 |eval| 469 |eq?| 495 |entry?| 501
              |entries| 507 |empty?| 512 |empty| 517 |elt| 521 |delete| 540
              |count| 552 |copyInto!| 564 |copy| 571 |convert| 576 |construct|
              581 |concat| 586 |coerce| 609 |any?| 614 |and| 620 |_\|_| 626
              |\\/| 630 T 636 |Or| 640 |Not| 646 |And| 651 >= 657 > 663 = 669
              <= 675 < 681 |/\\| 687 |#| 693)
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
              '#((|BitAggregate|) (|OneDimensionalArrayAggregate| 16) (|Logic|)
                 (|FiniteLinearAggregate| 16) (|BoundedDistributiveLattice|)
                 (|LinearAggregate| 16) (|BoundedLattice|)
                 (|DistributiveLattice|) (|OrderedSet|)
                 (|BoundedMeetSemilattice|) (|BoundedJoinSemilattice|)
                 (|Lattice|) (|IndexedAggregate| 7 16) (|Collection| 16)
                 (|Comparable|) (|MeetSemilattice|) (|JoinSemilattice|)
                 (|HomogeneousAggregate| 16) (|ComparableRepresentation|)
                 (|Hashable|) (|Evalable| 16) (|SetCategory|) (|Aggregate|)
                 (|EltableAggregate| 7 16) (|ConvertibleTo| 50)
                 (|InnerEvalable| 16 16) (|CoercibleTo| 19) (|PartialOrder|)
                 (|BasicType|) (|Type|) (|Eltable| 7 16) (|Eltable| 39 $$)
                 (|finiteAggregate|) (|shallowlyMutable|))
              (|makeByteWordVec2| 50
                                  '(0 11 0 12 1 13 7 0 14 1 13 7 0 15 3 13 11 0
                                    7 11 18 1 13 19 0 20 2 16 0 0 0 27 3 0 0 28
                                    0 0 29 2 16 0 0 0 31 2 16 0 0 0 33 2 0 16 0
                                    0 1 1 0 0 0 1 2 0 0 0 0 34 0 0 0 1 2 13 0 0
                                    16 1 3 8 49 0 7 7 1 1 14 16 0 1 2 9 16 28 0
                                    1 2 12 0 28 0 1 1 11 0 0 1 1 14 0 0 1 2 9 0
                                    28 0 1 2 0 16 0 0 1 2 0 16 0 9 1 1 7 7 0 1
                                    3 8 16 0 39 16 1 3 8 16 0 7 16 35 2 9 0 43
                                    0 1 0 0 0 1 2 13 0 0 16 1 1 12 0 0 1 1 9 0
                                    0 1 1 13 0 0 1 2 13 0 16 0 1 2 9 0 43 0 1 4
                                    13 16 28 0 16 16 1 3 9 16 28 0 16 1 2 9 16
                                    28 0 1 3 8 16 0 7 16 1 2 0 16 0 7 1 1 7 16
                                    0 1 3 13 7 16 0 7 1 2 13 7 16 0 1 2 9 7 43
                                    0 1 1 9 41 0 1 2 0 0 0 0 32 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 9 16 22 1 7 16 0 1 2 0 0 0 0 1
                                    2 0 16 0 9 1 1 5 7 0 8 2 0 0 0 0 1 1 14 16
                                    0 1 3 13 0 28 0 0 1 2 14 0 0 0 1 3 9 0 28 0
                                    0 1 1 9 41 0 1 2 13 16 16 0 1 1 5 7 0 1 2 0
                                    0 0 0 1 1 14 16 0 1 2 9 16 28 0 1 2 8 0 43
                                    0 1 3 0 0 28 0 0 29 2 0 0 43 0 1 2 0 16 0 9
                                    1 2 13 0 0 16 1 1 0 13 0 1 3 0 0 16 0 7 1 3
                                    0 0 0 0 7 1 1 0 44 0 1 2 0 16 7 0 1 2 10 45
                                    45 0 1 1 10 46 0 1 2 0 0 0 9 1 1 5 16 0 1 2
                                    0 42 43 0 1 2 8 0 0 16 1 0 0 0 1 2 9 16 43
                                    0 1 3 1 0 0 41 41 1 2 1 0 0 47 1 3 1 0 0 16
                                    16 1 2 1 0 0 48 1 2 0 16 0 0 1 2 13 16 16 0
                                    1 1 0 41 0 1 1 0 16 0 1 0 0 0 23 2 0 0 0 39
                                    1 2 0 16 0 7 17 3 0 16 0 7 16 1 2 0 0 0 39
                                    1 2 0 0 0 7 1 2 13 9 16 0 1 2 9 9 43 0 1 3
                                    12 0 0 0 7 1 1 0 0 0 24 1 3 50 0 1 1 0 0 41
                                    1 1 0 0 40 1 2 0 0 16 0 1 2 0 0 0 0 1 2 0 0
                                    0 16 1 1 0 19 0 21 2 9 16 43 0 1 2 0 0 0 0
                                    30 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0 0 38
                                    1 0 0 0 36 2 0 0 0 0 37 2 0 16 0 0 1 2 0 16
                                    0 0 1 2 0 16 0 0 25 2 0 16 0 0 1 2 0 16 0 0
                                    26 2 0 0 0 0 1 1 9 9 0 10)))))
           '|lookupComplete|)) 
