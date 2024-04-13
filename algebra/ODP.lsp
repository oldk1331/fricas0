
(SDEFUN |ODP;<;2%B;1| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |OrderedDirectProduct;|)) 

(DEFUN |OrderedDirectProduct| (&REST #1=#:G46)
  (SPROG NIL
         (PROG (#2=#:G47)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T NIL))
                     (HGET |$ConstructorCache| '|OrderedDirectProduct|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrderedDirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OrderedDirectProduct|)))))))))) 

(DEFUN |OrderedDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G36 NIL) (#2=#:G37 NIL) (#3=#:G38 NIL) (#4=#:G39 NIL)
    (#5=#:G40 NIL) (#6=#:G42 NIL) (#7=#:G41 NIL) (#8=#:G43 NIL) (#9=#:G44 NIL)
    (#10=#:G45 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|OrderedDirectProduct| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 44))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#2|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#2|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#2| '(|unitsKnown|))
                                        (|HasCategory| |#2|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#2| '(|SemiRng|))
                                        (|HasCategory| |#2| '(|Ring|))
                                        (|HasCategory| |#2| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#2| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|)))
                                        (|HasCategory| |#2| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#2|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#2|)))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #7#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #7# #8#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|AbelianMonoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|Monoid|)))
                                        (AND #5#
                                             (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #4#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|))))
                                        (OR (|HasCategory| |#2| '(|Monoid|))
                                            #3#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#2| '(|Ring|))
                                         #3# (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR #5#
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #2#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #2#)
                                        (OR #2# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#2|
                                                              '(|SetCategory|))))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2|
                                                         '(|SetCategory|)))
                                         #6# #1# #2#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND #5#
                                              (|HasCategory| |#2| '(|Ring|)))
                                         (AND #5#
                                              (|HasCategory| |#2|
                                                             '(|SemiRng|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #4#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|OrderedDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1125899906842624))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #5#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #7# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#2|))
    %))) 

(MAKEPROP '|OrderedDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|)
              |ODP;<;2%B;1| (|NonNegativeInteger|) (|PositiveInteger|)
              (|List| 7) (|Equation| 7) (|List| 15)
              (|Record| (|:| |mat| 21) (|:| |vec| (|Vector| 20))) (|Matrix| %)
              (|Vector| %) (|Integer|) (|Matrix| 20) (|Symbol|) (|List| 22)
              (|List| 12) (|Union| 26 '#1="failed") (|Fraction| 20)
              (|Union| 20 '#1#) (|Union| % '"failed") (|Mapping| 10 7 7)
              (|Mapping| 10 7) (|Void|) (|Mapping| 7 7) (|OutputForm|)
              (|InputForm|) (|SingleInteger|) (|HashState|) (|List| %)
              (|Matrix| 7) (|Record| (|:| |mat| 38) (|:| |vec| 42))
              (|Union| 7 '#1#) (|String|) (|Vector| 7) (|List| 20))
           '#(~= 0 |zero?| 6 |unitVector| 11 |swap!| 16 |sup| 23
              |subtractIfCan| 29 |smaller?| 35 |size?| 41 |size| 47 |setelt!|
              51 |sample| 58 |rightRecip| 62 |rightPower| 67 |retractIfCan| 79
              |retract| 94 |reducedSystem| 109 |recip| 131 |random| 136
              |qsetelt!| 140 |qelt| 147 |plenaryPower| 153 |parts| 159
              |opposite?| 164 |one?| 170 |more?| 175 |minIndex| 181 |min| 186
              |members| 197 |member?| 202 |maxIndex| 208 |max| 213 |map!| 230
              |map| 236 |lookup| 242 |less?| 247 |leftRecip| 253 |leftPower|
              258 |latex| 270 |inf| 275 |indices| 281 |index?| 286 |index| 292
              |hashUpdate!| 297 |hash| 303 |first| 308 |fill!| 313 |every?| 319
              |eval| 325 |eq?| 351 |enumerate| 357 |entry?| 361 |entries| 367
              |empty?| 372 |empty| 377 |elt| 381 |dot| 394 |directProduct| 400
              |differentiate| 405 |count| 455 |copy| 467 |convert| 472
              |commutator| 477 |coerce| 483 |characteristic| 513 |associator|
              517 |any?| 524 |antiCommutator| 530 |annihilate?| 536 ^ 542
              |Zero| 554 |One| 558 D 562 >= 612 > 618 = 624 <= 630 < 636 - 642
              + 653 * 659 |#| 701)
           'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 6 9 6 6 15 16 18 9 6 6 18 8 6 6 9 1 9 11 11
                                  9 28 0 1 8 11 11 14 28 18 2 7 2 36 9 10 0 4
                                  35 10 12 40 17 0 13 40 37 19 0 0 39 6 12 42
                                  19 50 46 0 0 0 0 39 49 3 5 6 12 41 19 50 46))
            (CONS
             '#(|DirectProductCategory&| NIL |DifferentialExtension&|
                |Algebra&| |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |Rng&| NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL
                |AbelianGroup&| NIL NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| |AbelianMonoid&| |MagmaWithUnit&| |Finite&| NIL
                |NonAssociativeSemiRng&| |HomogeneousAggregate&| NIL |Magma&|
                |AbelianSemiGroup&| |FullyRetractableTo&| |Aggregate&|
                |EltableAggregate&| |Evalable&| NIL |Hashable&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                NIL |InnerEvalable&| NIL |PartialOrder&| NIL NIL NIL
                |BasicType&| NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|CommutativeRing|)
                 (|DifferentialExtension| 7) (|Algebra| $$) (|Algebra| 7)
                 (|PartialDifferentialRing| 22) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 7) (|Rng|) (|SemiRng|) (|Module| $$)
                 (|Module| 7) (|FullyLinearlyExplicitOver| 7)
                 (|OrderedAbelianMonoidSup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 7 7) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 20) (|AbelianProductCategory| 7)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 7) (|RightModule| 7)
                 (|RightModule| 20) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|IndexedAggregate| 20 7) (|OrderedSet|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 7) (|Aggregate|)
                 (|EltableAggregate| 20 7) (|Evalable| 7) (|CommutativeStar|)
                 (|Hashable|) (|SetCategory|) (|RetractableTo| 7)
                 (|RetractableTo| 26) (|RetractableTo| 20) (|Type|)
                 (|finiteAggregate|) (|CoercibleTo| (|Vector| 7))
                 (|Eltable| 20 7) (|InnerEvalable| 7 7) (|CoercibleTo| 33)
                 (|PartialOrder|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 34) (|BasicType|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| 26) (|CoercibleFrom| 20))
              (|makeByteWordVec2| 58
                                  '(2 58 10 0 0 1 1 55 10 0 1 1 31 0 13 1 3 54
                                    31 0 20 20 1 2 1 0 0 0 1 2 56 28 0 0 1 2 23
                                    10 0 0 1 2 0 10 0 12 1 0 12 12 1 3 54 7 0
                                    20 7 1 0 0 0 1 1 10 28 0 1 2 10 0 0 12 1 2
                                    38 0 0 13 1 1 48 25 0 1 1 45 27 0 1 1 19 40
                                    0 1 1 48 26 0 1 1 45 20 0 1 1 19 7 0 1 2 27
                                    17 18 19 1 1 27 21 18 1 1 9 38 18 1 2 9 39
                                    18 19 1 1 10 28 0 1 0 12 0 1 3 54 7 0 20 7
                                    1 2 0 7 0 20 1 2 6 0 0 13 1 1 51 14 0 1 2
                                    55 10 0 0 1 1 10 10 0 1 2 0 10 0 12 1 1 22
                                    20 0 1 1 52 7 0 1 2 3 0 0 0 1 1 51 14 0 1 2
                                    53 10 7 0 1 1 22 20 0 1 1 52 7 0 1 2 51 7
                                    29 0 1 2 3 0 0 0 1 2 54 0 32 0 1 2 0 0 32 0
                                    1 1 12 13 0 1 2 0 10 0 12 1 1 10 28 0 1 2
                                    10 0 0 12 1 2 38 0 0 13 1 1 19 41 0 1 2 1 0
                                    0 0 1 1 0 43 0 1 2 0 10 20 0 1 1 12 0 13 1
                                    2 12 36 36 0 1 1 12 35 0 1 1 22 7 0 1 2 54
                                    0 0 7 1 2 51 10 30 0 1 3 20 0 0 14 14 1 2
                                    20 0 0 15 1 3 20 0 0 7 7 1 2 20 0 0 16 1 2
                                    0 10 0 0 1 0 12 37 1 2 53 10 7 0 1 1 0 14 0
                                    1 1 0 10 0 1 0 0 0 1 3 0 7 0 20 7 1 2 0 7 0
                                    20 1 2 32 7 0 0 1 1 0 0 42 1 2 24 0 0 12 1
                                    1 24 0 0 1 3 25 0 0 22 12 1 3 25 0 0 23 24
                                    1 2 25 0 0 22 1 2 25 0 0 23 1 3 9 0 0 32 12
                                    1 2 9 0 0 32 1 2 53 12 7 0 1 2 51 12 30 0 1
                                    1 0 0 0 1 1 12 34 0 1 2 9 0 0 0 1 1 48 0 26
                                    1 1 47 0 20 1 1 44 33 0 1 1 6 0 0 1 1 19 0
                                    7 1 1 0 42 0 1 0 9 12 1 3 9 0 0 0 0 1 2 51
                                    10 30 0 1 2 8 0 0 0 1 2 9 10 0 0 1 2 10 0 0
                                    12 1 2 38 0 0 13 1 0 55 0 1 0 10 0 1 2 24 0
                                    0 12 1 1 24 0 0 1 3 25 0 0 22 12 1 3 25 0 0
                                    23 24 1 2 25 0 0 22 1 2 25 0 0 23 1 3 9 0 0
                                    32 12 1 2 9 0 0 32 1 2 3 10 0 0 1 2 3 10 0
                                    0 1 2 58 10 0 0 1 2 3 10 0 0 1 2 3 10 0 0
                                    11 1 57 0 0 1 2 57 0 0 0 1 2 43 0 0 0 1 2
                                    27 0 0 20 1 2 57 0 20 0 1 2 55 0 12 0 1 2
                                    43 0 13 0 1 2 38 0 0 0 1 2 38 0 0 7 1 2 38
                                    0 7 0 1 1 51 12 0 1)))))
           '|lookupComplete|)) 
