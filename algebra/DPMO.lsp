
(SDEFUN |DPMO;*;R2%;1| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G11 NIL) (#2=#:G13 NIL) (|i| NIL) (#3=#:G12 NIL))
               (SEQ
                (PROGN
                 (LETT #3# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #1# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #3# #1#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT % 11))
                                          (QREFELT % 12)))))
                      (LETT #1#
                            (PROG1 (|inc_SI| #1#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #3#)))) 

(DECLAIM (NOTINLINE |DirectProductModule;|)) 

(DEFUN |DirectProductModule| (&REST #1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T T))
                                               (HGET |$ConstructorCache|
                                                     '|DirectProductModule|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductModule;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DirectProductModule|)))))))))) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G41 NIL) (#2=#:G42 NIL) (#3=#:G43 NIL) (#4=#:G45 NIL)
    (#5=#:G44 NIL) (#6=#:G46 NIL) (#7=#:G47 NIL) (#8=#:G48 NIL) (#9=#:G49 NIL)
    (#10=#:G50 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|DirectProductModule| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 46))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|)))
                                        (LETT #10#
                                              (|HasCategory| |#3|
                                                             '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10#)
                                        (|HasCategory| |#3| '(|unitsKnown|))
                                        (|HasCategory| |#3|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#3| '(|SemiRng|))
                                        (|HasCategory| |#3| '(|Ring|))
                                        (|HasCategory| |#3| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (LETT #9#
                                              (|HasCategory| |#3| '(|Finite|)))
                                        (OR #9#
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoid|))
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #10#)
                                        (OR (|HasCategory| |#3| '(|Ring|))
                                            (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #8#
                                              (|HasCategory| |#3|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|)))
                                        (|HasCategory| |#3| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#3|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#3|)))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#3| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (OR #9# #10#)
                                        (AND #8#
                                             (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #7#
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                        (OR #6# (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#3|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         (AND #5# #8#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|Monoid|)))
                                        (AND #3#
                                             (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2#)
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #8#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoid|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #10#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #7#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #6#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #1#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #2# #3# #1#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductModule|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 140737488355328))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 281474976710656))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 562949953421312))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 1125899906842624))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #3#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 2251799813685248))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #2# (|HasCategory| |#3| '(|Ring|)))
         (AND #2# (|HasCategory| |#3| '(|SemiRng|))) #1#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 4503599627370496))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #2#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 9007199254740992))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#3|))
    %))) 

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMO;*;R2%;1| (|Boolean|)
              (|NonNegativeInteger|) (|PositiveInteger|) (|List| 8)
              (|Equation| 8) (|List| 18)
              (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 10))) (|Matrix| %)
              (|Vector| %) (|Matrix| 10) (|Symbol|) (|List| 24) (|List| 15)
              (|Fraction| 10) (|Union| 27 '#1="failed") (|Union| 10 '#1#)
              (|Union| % '"failed") (|Mapping| 14 8 8) (|Mapping| 14 8)
              (|Void|) (|Mapping| 8 8) (|InputForm|) (|SingleInteger|)
              (|HashState|) (|List| %) (|Matrix| 8)
              (|Record| (|:| |mat| 39) (|:| |vec| 44)) (|Union| 8 '#1#)
              (|OutputForm|) (|String|) (|Vector| 8) (|List| 10))
           '#(~= 12 |zero?| 18 |unitVector| 23 |swap!| 28 |sup| 35
              |subtractIfCan| 41 |smaller?| 47 |size?| 53 |size| 59 |setelt!|
              63 |sample| 70 |rightRecip| 74 |rightPower| 79 |retractIfCan| 91
              |retract| 106 |reducedSystem| 121 |recip| 143 |random| 148
              |qsetelt!| 152 |qelt| 159 |plenaryPower| 165 |parts| 171
              |opposite?| 176 |one?| 182 |more?| 187 |minIndex| 193 |min| 198
              |members| 209 |member?| 214 |maxIndex| 220 |max| 225 |map!| 242
              |map| 248 |lookup| 254 |less?| 259 |leftRecip| 265 |leftPower|
              270 |latex| 282 |inf| 287 |indices| 293 |index?| 298 |index| 304
              |hashUpdate!| 309 |hash| 315 |first| 320 |fill!| 325 |every?| 331
              |eval| 337 |eq?| 363 |enumerate| 369 |entry?| 373 |entries| 379
              |empty?| 384 |empty| 389 |elt| 393 |dot| 406 |directProduct| 412
              |differentiate| 417 |count| 467 |copy| 479 |convert| 484
              |commutator| 489 |coerce| 495 |characteristic| 525 |associator|
              529 |any?| 536 |antiCommutator| 542 |annihilate?| 548 ^ 554
              |Zero| 566 |One| 570 D 574 >= 624 > 630 = 636 <= 642 < 648 - 654
              + 665 * 671 |#| 719)
           'NIL
           (CONS
            (|makeByteWordVec2| 47
                                '(0 6 8 6 6 14 15 17 8 6 6 17 7 6 6 8 1 8 10 10
                                  8 33 0 0 1 7 10 10 13 33 17 2 41 2 8 9 46 0 4
                                  9 11 26 16 47 0 0 12 26 18 0 0 0 43 6 11 18
                                  44 45 0 0 0 0 0 0 43 3 5 6 11 18 44 45))
            (CONS
             '#(|DirectProductCategory&| NIL |DifferentialExtension&|
                |Algebra&| |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |Rng&| NIL |Module&| |Module&|
                |FullyLinearlyExplicitOver&| NIL |NonAssociativeRing&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL |AbelianGroup&| NIL NIL NIL NIL |IndexedAggregate&|
                |OrderedSet&| |MagmaWithUnit&| |Finite&| NIL
                |NonAssociativeSemiRng&| |AbelianMonoid&|
                |HomogeneousAggregate&| |AbelianSemiGroup&| NIL |Magma&|
                |FullyRetractableTo&| |Aggregate&| |SetCategory&|
                |EltableAggregate&| |Evalable&| NIL |Hashable&|
                |RetractableTo&| |RetractableTo&| |RetractableTo&| NIL NIL
                |BasicType&| NIL NIL NIL |InnerEvalable&| |PartialOrder&| NIL
                NIL NIL NIL NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 8) (|CommutativeRing|)
                 (|DifferentialExtension| 8) (|Algebra| $$) (|Algebra| 8)
                 (|PartialDifferentialRing| 24) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 8) (|Rng|) (|SemiRng|) (|Module| $$)
                 (|Module| 8) (|FullyLinearlyExplicitOver| 8)
                 (|OrderedAbelianMonoidSup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 8 8) (|LinearlyExplicitOver| 8)
                 (|LinearlyExplicitOver| 10) (|LeftModule| 7)
                 (|AbelianProductCategory| 8)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 8) (|RightModule| 8)
                 (|RightModule| 10) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|CancellationAbelianMonoid|)
                 (|IndexedAggregate| 10 8) (|OrderedSet|) (|MagmaWithUnit|)
                 (|Finite|) (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|HomogeneousAggregate| 8)
                 (|AbelianSemiGroup|) (|Comparable|) (|Magma|)
                 (|FullyRetractableTo| 8) (|Aggregate|) (|SetCategory|)
                 (|EltableAggregate| 10 8) (|Evalable| 8) (|CommutativeStar|)
                 (|Hashable|) (|RetractableTo| 8) (|RetractableTo| 27)
                 (|RetractableTo| 10) (|Type|) (|CoercibleTo| 42) (|BasicType|)
                 (|finiteAggregate|) (|CoercibleTo| (|Vector| 8))
                 (|Eltable| 10 8) (|InnerEvalable| 8 8) (|PartialOrder|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|ConvertibleTo| 35)
                 (|CoercibleFrom| 8) (|CoercibleFrom| 27) (|CoercibleFrom| 10))
              (|makeByteWordVec2| 54
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 14 0 0 1 1
                                    52 14 0 1 1 36 0 16 1 3 51 33 0 10 10 1 2 1
                                    0 0 0 1 2 53 30 0 0 1 2 22 14 0 0 1 2 0 14
                                    0 15 1 0 11 15 1 3 51 8 0 10 8 1 0 0 0 1 1
                                    9 30 0 1 2 9 0 0 15 1 2 25 0 0 16 1 1 29 28
                                    0 1 1 27 29 0 1 1 18 41 0 1 1 29 27 0 1 1
                                    27 10 0 1 1 18 8 0 1 2 32 20 21 22 1 1 32
                                    23 21 1 1 8 39 21 1 2 8 40 21 22 1 1 9 30 0
                                    1 0 11 0 1 3 51 8 0 10 8 1 2 0 8 0 10 1 2 6
                                    0 0 16 1 1 48 17 0 1 2 52 14 0 0 1 1 9 14 0
                                    1 2 0 14 0 15 1 1 21 10 0 1 1 49 8 0 1 2 3
                                    0 0 0 1 1 48 17 0 1 2 50 14 8 0 1 1 21 10 0
                                    1 1 49 8 0 1 2 48 8 31 0 1 2 3 0 0 0 1 2 51
                                    0 34 0 1 2 0 0 34 0 1 1 11 16 0 1 2 0 14 0
                                    15 1 1 9 30 0 1 2 9 0 0 15 1 2 25 0 0 16 1
                                    1 0 43 0 1 2 1 0 0 0 1 1 0 45 0 1 2 0 14 10
                                    0 1 1 11 0 16 1 2 11 37 37 0 1 1 11 36 0 1
                                    1 21 8 0 1 2 51 0 0 8 1 2 48 14 32 0 1 3 19
                                    0 0 17 17 1 2 19 0 0 18 1 3 19 0 0 8 8 1 2
                                    19 0 0 19 1 2 0 14 0 0 1 0 11 38 1 2 50 14
                                    8 0 1 1 0 17 0 1 1 0 14 0 1 0 0 0 1 3 0 8 0
                                    10 8 1 2 0 8 0 10 11 2 37 8 0 0 1 1 0 0 44
                                    1 2 23 0 0 15 1 1 23 0 0 1 3 24 0 0 24 15 1
                                    3 24 0 0 25 26 1 2 24 0 0 24 1 2 24 0 0 25
                                    1 3 8 0 0 34 15 1 2 8 0 0 34 1 2 50 15 8 0
                                    1 2 48 15 32 0 1 1 0 0 0 1 1 11 35 0 1 2 8
                                    0 0 0 1 1 29 0 27 1 1 28 0 10 1 1 6 0 0 1 1
                                    18 0 8 1 1 0 42 0 1 1 0 44 0 1 0 8 15 1 3 8
                                    0 0 0 0 1 2 48 14 32 0 1 2 7 0 0 0 1 2 8 14
                                    0 0 1 2 9 0 0 15 1 2 25 0 0 16 1 0 52 0 1 0
                                    9 0 1 2 23 0 0 15 1 1 23 0 0 1 3 24 0 0 24
                                    15 1 3 24 0 0 25 26 1 2 24 0 0 24 1 2 24 0
                                    0 25 1 3 8 0 0 34 15 1 2 8 0 0 34 1 2 3 14
                                    0 0 1 2 3 14 0 0 1 2 0 14 0 0 1 2 3 14 0 0
                                    1 2 3 14 0 0 1 2 54 0 0 0 1 1 54 0 0 1 2 0
                                    0 0 0 1 2 32 0 0 10 1 2 54 0 10 0 1 2 52 0
                                    15 0 1 2 25 0 0 0 1 2 25 0 0 8 1 2 25 0 8 0
                                    1 2 0 0 7 0 13 2 0 0 16 0 1 1 48 15 0
                                    1)))))
           '|lookupComplete|)) 
