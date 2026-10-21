
(SDEFUN |DPMO;*;R2%;1| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G4 NIL) (|i| NIL) (#2=#:G5 NIL) (#3=#:G3 NIL))
               (SEQ
                (PROGN
                 (LETT #1# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT % 11))
                                          (QREFELT % 12)))))
                      (LETT #3#
                            (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(DECLAIM (NOTINLINE |DirectProductModule;|)) 

(DEFUN |DirectProductModule;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G31 NIL)
    (#2=#:G30 NIL) (#3=#:G29 NIL) (#4=#:G28 NIL) (#5=#:G26 NIL) (#6=#:G27 NIL)
    (#7=#:G25 NIL) (#8=#:G24 NIL) (#9=#:G23 NIL) (|pv$| NIL))
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
                                        (|HasCategory| |#3| '(|OrderedSet|))
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
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|)))
                                        (|HasCategory| |#3| '(|Finite|))
                                        (OR (|HasCategory| |#3| '(|Ring|))
                                            (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #1#
                                              (|HasCategory| |#3|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#3| '(|Ring|)))
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
                                        (LETT #2#
                                              (|HasCategory| |#3|
                                                             '(|OrderedAbelianSemiGroup|)))
                                        (OR (|HasCategory| |#3| '(|Finite|))
                                            (|HasCategory| |#3|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #2#
                                            (|HasCategory| |#3|
                                                           '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#3| '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#)
                                        (OR (|HasCategory| |#3| '(|Finite|))
                                            (|HasCategory| |#3|
                                                           '(|OrderedSet|)))
                                        (AND #1#
                                             (|HasCategory| |#3| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #3#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                        (OR #4# (|HasCategory| |#3| '(|Ring|)))
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
                                        (LETT #6#
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
                                         (AND #5# #1#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #7#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|)))
                                        (AND #7#
                                             (|HasCategory| |#3| '(|Monoid|)))
                                        (AND #7#
                                             (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #8#
                                              (|HasCategory| |#3|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (AND #8#
                                              (|HasCategory| |#3|
                                                             '(|SemiRng|)))
                                         #7#)
                                        (LETT #9#
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
                                          #9#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3| '(|OrderedSet|)))
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
                                          #3#)
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
                                          #9#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|OrderedSet|)))
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
                                          #3#)
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
                                          #9#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8# #9#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8# #7# #9#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductModule|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1125899906842624))
    (AND (|HasCategory| |#3| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# (|HasCategory| % '(|SetWithZero|)))
      (AND (|HasCategory| |#3| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #7#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #8# (|HasCategory| |#3| '(|Ring|)))
         (AND #8# (|HasCategory| |#3| '(|SemiRng|))) #9#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#3| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #8#
         (AND (|HasCategory| |#3| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 288230376151711744))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#3|))
    %))) 

(DEFUN |DirectProductModule| (&REST #1=#:G32)
  (SPROG NIL
         (PROG (#2=#:G33)
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

(MAKEPROP '|DirectProductModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |elt|) (6 . *) |DPMO;*;R2%;1| (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 8 8) (|List| 8) (|List| 10)
              (|Vector| 8) (|PositiveInteger|) (|OutputForm|) (|String|)
              (|Equation| 8) (|List| 23)
              (|Record| (|:| |mat| 28) (|:| |vec| (|Vector| 10))) (|Matrix| %)
              (|Vector| %) (|Matrix| 10) (|Symbol|) (|List| 29) (|List| 15)
              (|Fraction| 10) (|Union| 32 '#1="failed") (|Union| 10 '#1#)
              (|Union| % '"failed") (|Mapping| 14 8) (|Mapping| 14 8 8)
              (|Void|) (|List| %) (|SingleInteger|) (|HashState|) (|InputForm|)
              (|Matrix| 8) (|Record| (|:| |mat| 43) (|:| |vec| 19))
              (|Union| 8 '#1#))
           '#(~= 12 |zero?| 18 |unitVector| 23 |swap!| 28 |sup| 35
              |subtractIfCan| 41 |smaller?| 47 |size?| 53 |size| 59 |sign| 63
              |setelt!| 68 |sample| 75 |rightRecip| 79 |rightPower| 84
              |retractIfCan| 96 |retract| 111 |reducedSystem| 126 |recip| 148
              |random| 153 |qsetelt!| 157 |qelt| 164 |positive?| 170
              |plenaryPower| 175 |parts| 181 |opposite?| 186 |one?| 192
              |negative?| 197 |more?| 202 |minIndex| 208 |min| 213 |members|
              224 |member?| 229 |maxIndex| 235 |max| 240 |map!| 257 |map| 263
              |lookup| 269 |less?| 274 |leftRecip| 280 |leftPower| 285 |latex|
              297 |inf| 302 |indices| 308 |index?| 313 |index| 319
              |hashUpdate!| 324 |hash| 330 |first| 335 |fill!| 340 |every?| 346
              |eval| 352 |eq?| 378 |enumerate| 384 |entry?| 388 |entries| 394
              |empty?| 399 |empty| 404 |elt| 408 |dot| 421 |directProduct| 427
              |differentiate| 432 |count| 482 |copy| 494 |convert| 499
              |commutator| 504 |coerce| 510 |characteristic| 540 |associator|
              544 |any?| 551 |antiCommutator| 557 |annihilate?| 563 |abs| 569 ^
              574 D 586 >= 636 > 642 = 648 <= 654 < 660 |1| 666 |0| 670 - 674 +
              685 * 691 |#| 739)
           'NIL
           (CONS
            (|makeByteWordVec2| 50
                                '(0 6 4 13 12 4 4 15 15 4 4 6 6 4 4 5 35 6 8 8
                                  6 15 35 11 8 8 5 1 0 0 43 23 49 10 7 6 22 50
                                  14 28 7 21 0 44 16 28 21 0 0 48 47 16 10 4 46
                                  0 0 0 48 47 16 10 9 4 3 2 46 0 0 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| |OrderedAbelianSemiGroup&| NIL |Finite&| NIL
                NIL |OrderedSet&| |AbelianMonoid&| |NonAssociativeSemiRng&| NIL
                |MagmaWithUnit&| NIL |IndexedAggregate&| |SetWithZero&|
                |FullyRetractableTo&| |Magma&| NIL |AbelianSemiGroup&|
                |HomogeneousAggregate&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |Hashable&| NIL |Evalable&|
                |EltableAggregate&| |SetCategory&| |Aggregate&| NIL NIL NIL NIL
                NIL NIL NIL |PartialOrder&| |InnerEvalable&| NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|DirectProductCategory| 6 8) (|DifferentialExtension| 8)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 29) (|Algebra| 8) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 8)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 8) (|Module| 8) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 10)
                 (|LinearlyExplicitOver| 8) (|BiModule| 8 8) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|)
                 (|RightModule| 10) (|RightModule| 8) (|LeftModule| 8)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 8)
                 (|LeftModule| 7) (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                 (|CancellationAbelianMonoid|) (|Finite|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|Comparable|) (|IndexedAggregate| 10 8) (|SetWithZero|)
                 (|FullyRetractableTo| 8) (|Magma|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|HomogeneousAggregate| 8) (|RetractableTo| 10)
                 (|RetractableTo| 32) (|RetractableTo| 8) (|Hashable|)
                 (|CommutativeStar|) (|Evalable| 8) (|EltableAggregate| 10 8)
                 (|SetCategory|) (|Aggregate|) (|CoercibleFrom| 10)
                 (|CoercibleFrom| 32) (|CoercibleFrom| 8) (|ConvertibleTo| 42)
                 (|CharacteristicZero|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|InnerEvalable| 8 8) (|Eltable| 10 8)
                 (|CoercibleTo| (|Vector| 8)) (|finiteAggregate|) (|BasicType|)
                 (|CoercibleTo| 21) (|Type|))
              (|makeByteWordVec2| 59
                                  '(2 0 8 0 10 11 2 8 0 7 0 12 2 0 14 0 0 1 1
                                    57 14 0 1 1 38 0 20 1 3 54 38 0 10 10 1 2 1
                                    0 0 0 1 2 58 35 0 0 1 2 24 14 0 0 1 2 0 14
                                    0 15 1 0 10 15 1 1 56 10 0 1 3 54 8 0 10 8
                                    1 0 0 0 1 1 7 35 0 1 2 7 0 0 15 1 2 27 0 0
                                    20 1 1 31 33 0 1 1 29 34 0 1 1 16 45 0 1 1
                                    31 32 0 1 1 29 10 0 1 1 16 8 0 1 2 34 25 26
                                    27 1 1 34 28 26 1 1 6 43 26 1 2 6 44 26 27
                                    1 1 7 35 0 1 0 10 0 1 3 54 8 0 10 8 1 2 0 8
                                    0 10 1 1 56 14 0 1 2 4 0 0 20 1 1 51 17 0 1
                                    2 57 14 0 0 1 1 7 14 0 1 1 56 14 0 1 2 0 14
                                    0 15 1 1 19 10 0 1 1 52 8 0 1 2 2 0 0 0 1 1
                                    51 17 0 1 2 53 14 8 0 1 1 19 10 0 1 1 52 8
                                    0 1 2 51 8 37 0 1 2 2 0 0 0 1 2 54 0 16 0 1
                                    2 0 0 16 0 1 1 10 20 0 1 2 0 14 0 15 1 1 7
                                    35 0 1 2 7 0 0 15 1 2 27 0 0 20 1 1 0 22 0
                                    1 2 1 0 0 0 1 1 0 18 0 1 2 0 14 10 0 1 1 10
                                    0 20 1 2 10 41 41 0 1 1 10 40 0 1 1 19 8 0
                                    1 2 54 0 0 8 1 2 51 14 36 0 1 2 17 0 0 23 1
                                    2 17 0 0 24 1 3 17 0 0 17 17 1 3 17 0 0 8 8
                                    1 2 0 14 0 0 1 0 10 39 1 2 53 14 8 0 1 1 0
                                    17 0 1 1 0 14 0 1 0 0 0 1 3 0 8 0 10 8 1 2
                                    0 8 0 10 11 2 39 8 0 0 1 1 0 0 19 1 1 25 0
                                    0 1 2 25 0 0 15 1 2 26 0 0 29 1 3 26 0 0 29
                                    15 1 2 26 0 0 30 1 3 26 0 0 30 31 1 3 6 0 0
                                    16 15 1 2 6 0 0 16 1 2 53 15 8 0 1 2 51 15
                                    36 0 1 1 0 0 0 1 1 10 42 0 1 2 6 0 0 0 1 1
                                    0 19 0 1 1 0 21 0 1 1 31 0 32 1 1 30 0 10 1
                                    1 4 0 0 1 1 16 0 8 1 0 6 15 1 3 6 0 0 0 0 1
                                    2 51 14 36 0 1 2 5 0 0 0 1 2 6 14 0 0 1 1
                                    55 0 0 1 2 7 0 0 15 1 2 27 0 0 20 1 1 25 0
                                    0 1 2 25 0 0 15 1 2 26 0 0 29 1 3 26 0 0 29
                                    15 1 2 26 0 0 30 1 3 26 0 0 30 31 1 3 6 0 0
                                    16 15 1 2 6 0 0 16 1 2 2 14 0 0 1 2 2 14 0
                                    0 1 2 0 14 0 0 1 2 2 14 0 0 1 2 2 14 0 0 1
                                    0 7 0 1 0 57 0 1 2 59 0 0 0 1 1 59 0 0 1 2
                                    0 0 0 0 1 2 0 0 7 0 13 2 0 0 20 0 1 2 34 0
                                    0 10 1 2 59 0 10 0 1 2 57 0 15 0 1 2 27 0 8
                                    0 1 2 27 0 0 8 1 2 27 0 0 0 1 1 51 15 0
                                    1)))))
           '|lookupComplete|)) 
