
(SDEFUN |ODP;<;2%B;1| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 8))) 

(DECLAIM (NOTINLINE |OrderedDirectProduct;|)) 

(DEFUN |OrderedDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G25 NIL)
    (#2=#:G24 NIL) (#3=#:G22 NIL) (#4=#:G23 NIL) (#5=#:G21 NIL) (#6=#:G20 NIL)
    (#7=#:G19 NIL) (#8=#:G18 NIL) (|pv$| NIL))
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
                                        (|HasCategory| |#2| '(|OrderedSet|))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
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
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|)))
                                        (|HasCategory| |#2| '(|Finite|))
                                        (OR (|HasCategory| |#2| '(|Ring|))
                                            (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #1#
                                              (|HasCategory| |#2|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Ring|)))
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
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|Monoid|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #2#
                                              (|HasCategory| |#2|
                                                             '(|OrderedAbelianSemiGroup|)))
                                        (OR (|HasCategory| |#2| '(|Finite|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #2#
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#)
                                        (OR (|HasCategory| |#2| '(|Finite|))
                                            (|HasCategory| |#2|
                                                           '(|OrderedSet|)))
                                        (AND #1#
                                             (|HasCategory| |#2| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#2|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#2|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#2| '(|Ring|))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #3#
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|)))
                                         (AND #3# #1#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#2|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# #2# (|HasCategory| |#2| '(|Ring|))
                                         (|HasCategory| |#2| '(|SemiRng|)))
                                        (LETT #6#
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
                                          #5#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#2|)))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
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
                                          #6#)
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
                                            #6#)
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#2| '(|BasicType|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Finite|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|))
                                         (|HasCategory| |#2| '(|Ring|)) #6#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#2|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#2| '(|Finite|))
                                         (|HasCategory| |#2| '(|Monoid|))
                                         (|HasCategory| |#2|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#2| '(|OrderedSet|))
                                         (|HasCategory| |#2| '(|Ring|)) #6#
                                         (|HasCategory| |#2| '(|SemiRng|))
                                         (|HasCategory| |#2| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         #2# (|HasCategory| |#2| '(|SemiRng|)))
                                        (|HasCategory| |#2|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #7#
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
                                          #5#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #6#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #7#)
                                        (OR #7# (|HasCategory| |#2| '(|Ring|)))
                                        (LETT #8#
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
                                         #4# #8# #7#
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#2| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#2|
                                                         '(|CommutativeRing|))))
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
                                          #5#)
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
                                          #1#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|Finite|)))
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
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|OrderedSet|)))
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
                                          #6#)
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#2| '(|SemiRng|)))
                                         #8#)))))
    (|haddProp| |$ConstructorCache| '|OrderedDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| |#2| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#2| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# (|HasCategory| % '(|SetWithZero|)))
      (AND (|HasCategory| |#2| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#2| '(|AbelianMonoid|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|Ring|)))
      (AND (|HasCategory| |#2| '(|AbelianGroup|))
           (|HasCategory| |#2| '(|SemiRng|)))
      #5#
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #3# (|HasCategory| |#2| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#2| '(|AbelianGroup|))
      (AND (|HasCategory| |#2| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR
      (AND (|HasCategory| |#2| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#2| '(|SetCategory|)))
     (|augmentPredVector| % 2305843009213693952))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#2|))
    %))) 

(DEFUN |OrderedDirectProduct| (&REST #1=#:G26)
  (SPROG NIL
         (PROG (#2=#:G27)
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

(MAKEPROP '|OrderedDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|)
              |ODP;<;2%B;1| (|NonNegativeInteger|) (|Mapping| 7 7) (|Integer|)
              (|List| 7) (|List| 14) (|Vector| 7) (|PositiveInteger|)
              (|Equation| 7) (|List| 19) (|Matrix| 14) (|Matrix| %)
              (|Record| (|:| |mat| 21) (|:| |vec| (|Vector| 14))) (|Vector| %)
              (|List| 26) (|Symbol|) (|List| 12) (|Union| 29 '#1="failed")
              (|Fraction| 14) (|Union| 14 '#1#) (|Union| % '"failed")
              (|Mapping| 10 7) (|Mapping| 10 7 7) (|Void|) (|OutputForm|)
              (|List| %) (|SingleInteger|) (|HashState|) (|InputForm|)
              (|Record| (|:| |mat| 41) (|:| |vec| 17)) (|Matrix| 7) (|String|)
              (|Union| 7 '#1#))
           '#(~= 0 |zero?| 6 |unitVector| 11 |swap!| 16 |sup| 23
              |subtractIfCan| 29 |smaller?| 35 |size?| 41 |size| 47 |sign| 51
              |setelt!| 56 |sample| 63 |rightRecip| 67 |rightPower| 72
              |retractIfCan| 84 |retract| 99 |reducedSystem| 114 |recip| 136
              |random| 141 |qsetelt!| 145 |qelt| 152 |positive?| 158
              |plenaryPower| 163 |parts| 169 |opposite?| 174 |one?| 180
              |negative?| 185 |more?| 190 |minIndex| 196 |min| 201 |members|
              212 |member?| 217 |maxIndex| 223 |max| 228 |map!| 245 |map| 251
              |lookup| 257 |less?| 262 |leftRecip| 268 |leftPower| 273 |latex|
              285 |inf| 290 |indices| 296 |index?| 301 |index| 307
              |hashUpdate!| 312 |hash| 318 |first| 323 |fill!| 328 |every?| 334
              |eval| 340 |eq?| 366 |enumerate| 372 |entry?| 376 |entries| 382
              |empty?| 387 |empty| 392 |elt| 396 |dot| 409 |directProduct| 415
              |differentiate| 420 |count| 470 |copy| 482 |convert| 487
              |commutator| 492 |coerce| 498 |characteristic| 528 |associator|
              532 |any?| 539 |antiCommutator| 545 |annihilate?| 551 |abs| 557 ^
              562 D 574 >= 624 > 630 = 636 <= 642 < 648 |1| 654 |0| 658 - 662 +
              673 * 679 |#| 721)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 8 5 15 14 5 5 17 17 5 5 8 8 5 5 7 33 8 10
                                  10 8 17 33 13 10 10 7 1 0 6 27 12 9 8 37 26
                                  16 38 42 9 25 0 18 39 42 3 25 0 48 52 18 44
                                  12 5 41 0 0 48 52 18 43 12 11 5 4 2 51 41 0 0
                                  0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| |OrderedAbelianSemiGroup&| |Finite&| NIL NIL
                NIL |OrderedSet&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                |MagmaWithUnit&| NIL |IndexedAggregate&| |FullyRetractableTo&|
                |AbelianSemiGroup&| |Magma&| |SetWithZero&| NIL
                |HomogeneousAggregate&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| |Hashable&| NIL |Evalable&|
                |EltableAggregate&| |Aggregate&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL |PartialOrder&| NIL |InnerEvalable&| NIL NIL NIL
                NIL)
             (CONS
              '#((|DirectProductCategory| 6 7) (|DifferentialExtension| 7)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 26) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 14)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|)
                 (|RightModule| 14) (|RightModule| 7) (|LeftModule| 7)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 7)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|Finite|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|Comparable|) (|IndexedAggregate| 14 7)
                 (|FullyRetractableTo| 7) (|AbelianSemiGroup|) (|Magma|)
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|HomogeneousAggregate| 7) (|RetractableTo| 14)
                 (|RetractableTo| 29) (|RetractableTo| 7) (|SetCategory|)
                 (|Hashable|) (|CommutativeStar|) (|Evalable| 7)
                 (|EltableAggregate| 14 7) (|Aggregate|) (|CoercibleFrom| 14)
                 (|CoercibleFrom| 29) (|CoercibleFrom| 7) (|BasicType|)
                 (|ConvertibleTo| 39) (|CharacteristicZero|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|PartialOrder|) (|CoercibleTo| 35)
                 (|InnerEvalable| 7 7) (|Eltable| 14 7)
                 (|CoercibleTo| (|Vector| 7)) (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 62
                                  '(2 62 10 0 0 1 1 59 10 0 1 1 22 0 18 1 3 56
                                    34 0 14 14 1 2 1 0 0 0 1 2 60 31 0 0 1 2 28
                                    10 0 0 1 2 0 10 0 12 1 0 12 12 1 1 58 14 0
                                    1 3 56 7 0 14 7 1 0 0 0 1 1 9 31 0 1 2 9 0
                                    0 12 1 2 40 0 0 18 1 1 50 28 0 1 1 47 30 0
                                    1 1 18 43 0 1 1 50 29 0 1 1 47 14 0 1 1 18
                                    7 0 1 1 32 21 22 1 2 32 23 22 24 1 2 8 40
                                    22 24 1 1 8 41 22 1 1 9 31 0 1 0 12 0 1 3
                                    56 7 0 14 7 1 2 0 7 0 14 1 1 58 10 0 1 2 5
                                    0 0 18 1 1 53 15 0 1 2 59 10 0 0 1 1 9 10 0
                                    1 1 58 10 0 1 2 0 10 0 12 1 1 21 14 0 1 1
                                    54 7 0 1 2 2 0 0 0 1 1 53 15 0 1 2 55 10 7
                                    0 1 1 21 14 0 1 1 54 7 0 1 2 53 7 33 0 1 2
                                    2 0 0 0 1 2 56 0 13 0 1 2 0 0 13 0 1 1 12
                                    18 0 1 2 0 10 0 12 1 1 9 31 0 1 2 9 0 0 12
                                    1 2 40 0 0 18 1 1 18 42 0 1 2 1 0 0 0 1 1 0
                                    16 0 1 2 0 10 14 0 1 1 12 0 18 1 2 12 38 38
                                    0 1 1 12 37 0 1 1 21 7 0 1 2 56 0 0 7 1 2
                                    53 10 32 0 1 2 19 0 0 19 1 2 19 0 0 20 1 3
                                    19 0 0 15 15 1 3 19 0 0 7 7 1 2 0 10 0 0 1
                                    0 12 36 1 2 55 10 7 0 1 1 0 15 0 1 1 0 10 0
                                    1 0 0 0 1 3 0 7 0 14 7 1 2 0 7 0 14 1 2 23
                                    7 0 0 1 1 0 0 17 1 1 29 0 0 1 2 29 0 0 12 1
                                    2 30 0 0 25 1 2 30 0 0 26 1 3 30 0 0 25 27
                                    1 3 30 0 0 26 12 1 2 8 0 0 13 1 3 8 0 0 13
                                    12 1 2 55 12 7 0 1 2 53 12 32 0 1 1 0 0 0 1
                                    1 12 39 0 1 2 8 0 0 0 1 1 0 17 0 1 1 50 0
                                    29 1 1 49 0 14 1 1 46 35 0 1 1 5 0 0 1 1 18
                                    0 7 1 0 8 12 1 3 8 0 0 0 0 1 2 53 10 32 0 1
                                    2 7 0 0 0 1 2 8 10 0 0 1 1 57 0 0 1 2 9 0 0
                                    12 1 2 40 0 0 18 1 1 29 0 0 1 2 29 0 0 12 1
                                    2 30 0 0 25 1 2 30 0 0 26 1 3 30 0 0 25 27
                                    1 3 30 0 0 26 12 1 2 8 0 0 13 1 3 8 0 0 13
                                    12 1 2 2 10 0 0 1 2 2 10 0 0 1 2 62 10 0 0
                                    1 2 2 10 0 0 1 2 2 10 0 0 11 0 9 0 1 0 59 0
                                    1 1 61 0 0 1 2 61 0 0 0 1 2 45 0 0 0 1 2 32
                                    0 0 14 1 2 61 0 14 0 1 2 59 0 12 0 1 2 45 0
                                    18 0 1 2 40 0 7 0 1 2 40 0 0 7 1 2 40 0 0 0
                                    1 1 53 12 0 1)))))
           '|lookupComplete|)) 
