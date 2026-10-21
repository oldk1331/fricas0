
(SDEFUN |DPMM;*;R2%;1| ((|r| (R)) (|x| (%)) (% (%)))
        (SPROG ((#1=#:G4 NIL) (|i| NIL) (#2=#:G5 NIL) (#3=#:G3 NIL))
               (SEQ
                (PROGN
                 (LETT #1# (GETREFV #4=(QREFELT % 6)))
                 (SEQ (LETT |i| 1) (LETT #2# #4#) (LETT #3# 0) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SETELT #1# #3#
                                (SPADCALL |r| (SPADCALL |x| |i| (QREFELT % 12))
                                          (QREFELT % 13)))))
                      (LETT #3#
                            (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                      (GO G190) G191 (EXIT NIL))
                 #1#)))) 

(SDEFUN |DPMM;*;M2%;2| ((|m| (M)) (|x| (%)) (% (%)))
        (SPROG
         ((#1=#:G13 NIL) (|i| NIL) (#2=#:G14 NIL) (#3=#:G12 NIL) (|j| NIL)
          (#4=#:G15 NIL) (#5=#:G9 (S)) (#6=#:G7 (S)) (#7=#:G8 NIL))
         (SEQ
          (PROGN
           (LETT #1# (GETREFV #8=(QREFELT % 6)))
           (SEQ (LETT |i| 1) (LETT #2# #8#) (LETT #3# 0) G190
                (COND ((|greater_SI| |i| #2#) (GO G191)))
                (SEQ
                 (EXIT
                  (SETELT #1# #3#
                          (PROGN
                           (LETT #7# NIL)
                           (SEQ (LETT |j| 1) (LETT #4# (QREFELT % 6)) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (PROGN
                                   (LETT #5#
                                         (SPADCALL
                                          (SPADCALL |m| |i| |j| (QREFELT % 15))
                                          (SPADCALL |x| |j| (QREFELT % 12))
                                          (QREFELT % 13)))
                                   (COND
                                    (#7#
                                     (LETT #6#
                                           (SPADCALL #6# #5# (QREFELT % 16))))
                                    ('T
                                     (PROGN (LETT #6# #5#) (LETT #7# 'T)))))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))
                           (COND (#7# #6#) ('T (|spadConstant| % 17)))))))
                (LETT #3# (PROG1 (|inc_SI| #3#) (LETT |i| (|inc_SI| |i|))))
                (GO G190) G191 (EXIT NIL))
           #1#)))) 

(DECLAIM (NOTINLINE |DirectProductMatrixModule;|)) 

(DEFUN |DirectProductMatrixModule;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (#1=#:G41 NIL) (#2=#:G40 NIL) (#3=#:G39 NIL) (#4=#:G38 NIL) (#5=#:G36 NIL)
    (#6=#:G37 NIL) (#7=#:G35 NIL) (#8=#:G34 NIL) (#9=#:G33 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|DirectProductMatrixModule| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 51))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#4|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (|HasCategory| |#4| '(|OrderedSet|))
                                        (|HasCategory| |#4| '(|unitsKnown|))
                                        (|HasCategory| |#4|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#4| '(|SemiRng|))
                                        (|HasCategory| |#4| '(|Ring|))
                                        (|HasCategory| |#4| '(|Monoid|))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         (|HasCategory| |#4| '(|SemiRng|)))
                                        (AND
                                         (|HasCategory| |#4|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|)))
                                        (|HasCategory| |#4| '(|Finite|))
                                        (OR (|HasCategory| |#4| '(|Ring|))
                                            (|HasCategory| |#4| '(|SemiRng|)))
                                        (|HasCategory| |#4|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (LETT #1#
                                              (|HasCategory| |#4|
                                                             '(|DifferentialRing|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#4| '(|Ring|))
                                         (|HasCategory| |#4| '(|SemiRng|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#4| '(|Ring|)))
                                        (|HasCategory| |#4| '(|SetCategory|))
                                        (AND
                                         (|HasCategory| |#4|
                                                        (LIST '|Evalable|
                                                              (|devaluate|
                                                               |#4|)))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#4| '(|BasicType|))
                                        (|HasCategory| (|Integer|)
                                                       '(|OrderedSet|))
                                        (LETT #2#
                                              (|HasCategory| |#4|
                                                             '(|OrderedAbelianSemiGroup|)))
                                        (OR (|HasCategory| |#4| '(|Finite|))
                                            (|HasCategory| |#4|
                                                           '(|OrderedAbelianMonoidSup|))
                                            #2#
                                            (|HasCategory| |#4|
                                                           '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#4| '(|OrderedSet|)))
                                        (OR
                                         (|HasCategory| |#4|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#)
                                        (OR (|HasCategory| |#4| '(|Finite|))
                                            (|HasCategory| |#4|
                                                           '(|OrderedSet|)))
                                        (AND #1#
                                             (|HasCategory| |#4| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#4| '(|Ring|)))
                                        (LETT #3#
                                              (|HasCategory| |#4|
                                                             '(|SemiGroup|)))
                                        (OR (|HasCategory| |#4| '(|Monoid|))
                                            #3#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory| |#4|
                                                              '(|SetCategory|))))
                                        (OR #4# (|HasCategory| |#4| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#4|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#4| '(|SetCategory|)))
                                        (|HasCategory| |#2| '(|AbelianMonoid|))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#4|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#4|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#4| '(|Ring|))))
                                        (OR
                                         (AND #5#
                                              (|HasCategory| |#4|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #5#
                                              (|HasCategory| |#4|
                                                             '(|CommutativeRing|)))
                                         (AND #5# #1#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #7#
                                              (|HasCategory| |#4|
                                                             '(|AbelianMonoid|)))
                                        (AND #7#
                                             (|HasCategory| |#4| '(|Monoid|)))
                                        (AND #7#
                                             (|HasCategory| |#4| '(|SemiRng|)))
                                        (|HasCategory| |#2| '(|AbelianGroup|))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #8#
                                              (|HasCategory| |#4|
                                                             '(|AbelianGroup|)))
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#2|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (AND #8#
                                              (|HasCategory| |#4|
                                                             '(|SemiRng|)))
                                         #7#)
                                        (LETT #9#
                                              (|HasCategory| |#4|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#4|)))
                                          (|HasCategory| |#4|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#4|
                                                         '(|SetCategory|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #9#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|CommutativeRing|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|Finite|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|Monoid|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4|
                                                         '(|OrderedAbelianMonoidSup|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|OrderedSet|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #3#)
                                         (AND
                                          (|HasCategory| |#4|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#4| '(|SemiRng|)))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8# #9#)
                                        (OR
                                         (|HasCategory| |#2| '(|AbelianGroup|))
                                         (|HasCategory| |#2|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#4|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         #8# #7# #9#)))))
    (|haddProp| |$ConstructorCache| '|DirectProductMatrixModule|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| |#4| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#4| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#4| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#4| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# (|HasCategory| % '(|SetWithZero|)))
      (AND (|HasCategory| |#4| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianMonoid|))
         (|HasCategory| |#3| '(|AbelianMonoid|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
         #7#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         (AND #8# (|HasCategory| |#4| '(|Ring|)))
         (AND #8# (|HasCategory| |#4| '(|SemiRng|))) #9#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR (|HasCategory| |#2| '(|AbelianGroup|))
         (|HasCategory| |#3| '(|AbelianGroup|))
         (AND #5# (|HasCategory| |#4| '(|Ring|))
              (|HasCategory| (|Integer|) '(|AbelianGroup|)))
         #8#
         (AND (|HasCategory| |#4| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 1152921504606846976))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 10 (|Vector| |#4|))
    %))) 

(DEFUN |DirectProductMatrixModule| (&REST #1=#:G42)
  (SPROG NIL
         (PROG (#2=#:G43)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL T T T))
                     (HGET |$ConstructorCache| '|DirectProductMatrixModule|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DirectProductMatrixModule;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|DirectProductMatrixModule|)))))))))) 

(MAKEPROP '|DirectProductMatrixModule| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 9)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) (|local| |#4|)
              '|Rep| (|Integer|) (0 . |elt|) (6 . *) |DPMM;*;R2%;1|
              (12 . |elt|) (19 . +) (25 . |0|) |DPMM;*;M2%;2| (|Boolean|)
              (|NonNegativeInteger|) (|Mapping| 9 9) (|List| 9) (|List| 11)
              (|Vector| 9) (|PositiveInteger|) (|String|) (|OutputForm|)
              (|Equation| 9) (|List| 28) (|Matrix| 11) (|Matrix| %)
              (|Record| (|:| |mat| 30) (|:| |vec| (|Vector| 11))) (|Vector| %)
              (|List| 35) (|Symbol|) (|List| 20) (|Union| 38 '#1="failed")
              (|Fraction| 11) (|Union| 11 '#1#) (|Union| % '"failed")
              (|Mapping| 19 9) (|Mapping| 19 9 9) (|Void|) (|List| %)
              (|HashState|) (|SingleInteger|) (|InputForm|)
              (|Record| (|:| |mat| 49) (|:| |vec| 24)) (|Matrix| 9)
              (|Union| 9 '#1#))
           '#(~= 29 |zero?| 35 |unitVector| 40 |swap!| 45 |sup| 52
              |subtractIfCan| 58 |smaller?| 64 |size?| 70 |size| 76 |sign| 80
              |setelt!| 85 |sample| 92 |rightRecip| 96 |rightPower| 101
              |retractIfCan| 113 |retract| 128 |reducedSystem| 143 |recip| 165
              |random| 170 |qsetelt!| 174 |qelt| 181 |positive?| 187
              |plenaryPower| 192 |parts| 198 |opposite?| 203 |one?| 209
              |negative?| 214 |more?| 219 |minIndex| 225 |min| 230 |members|
              241 |member?| 246 |maxIndex| 252 |max| 257 |map!| 274 |map| 280
              |lookup| 286 |less?| 291 |leftRecip| 297 |leftPower| 302 |latex|
              314 |inf| 319 |indices| 325 |index?| 330 |index| 336
              |hashUpdate!| 341 |hash| 347 |first| 352 |fill!| 357 |every?| 363
              |eval| 369 |eq?| 395 |enumerate| 401 |entry?| 405 |entries| 411
              |empty?| 416 |empty| 421 |elt| 425 |dot| 438 |directProduct| 444
              |differentiate| 449 |count| 499 |copy| 511 |convert| 516
              |commutator| 521 |coerce| 527 |characteristic| 557 |associator|
              561 |any?| 568 |antiCommutator| 574 |annihilate?| 580 |abs| 586 ^
              591 D 603 >= 653 > 659 = 665 <= 671 < 677 |1| 683 |0| 687 - 691 +
              702 * 708 |#| 762)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 6 4 13 12 4 4 15 15 4 4 6 6 4 4 5 36 6 8 8
                                  6 15 36 11 8 8 5 1 0 0 0 45 23 51 10 7 6 22
                                  52 14 28 7 21 0 46 16 28 21 0 0 50 49 16 10 4
                                  48 0 0 0 50 49 16 10 9 4 3 2 48 0 0 0 0 0 0))
            (CONS
             '#(|DirectProductCategory&| |DifferentialExtension&| NIL
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |Algebra&| NIL |Rng&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| NIL |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |NonAssociativeRing&|
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
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
              '#((|DirectProductCategory| 6 9) (|DifferentialExtension| 9)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 35) (|Algebra| 9) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 9)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 9) (|Module| 9) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 11)
                 (|LinearlyExplicitOver| 9) (|BiModule| 9 9) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|)
                 (|RightModule| 11) (|RightModule| 9) (|LeftModule| 9)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 9)
                 (|LeftModule| 7) (|LeftModule| 8) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|Finite|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|OrderedSet|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|Comparable|)
                 (|IndexedAggregate| 11 9) (|SetWithZero|)
                 (|FullyRetractableTo| 9) (|Magma|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|HomogeneousAggregate| 9) (|RetractableTo| 11)
                 (|RetractableTo| 38) (|RetractableTo| 9) (|Hashable|)
                 (|CommutativeStar|) (|Evalable| 9) (|EltableAggregate| 11 9)
                 (|SetCategory|) (|Aggregate|) (|CoercibleFrom| 11)
                 (|CoercibleFrom| 38) (|CoercibleFrom| 9) (|ConvertibleTo| 47)
                 (|CharacteristicZero|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|PartialOrder|) (|InnerEvalable| 9 9) (|Eltable| 11 9)
                 (|CoercibleTo| (|Vector| 9)) (|finiteAggregate|) (|BasicType|)
                 (|CoercibleTo| 27) (|Type|))
              (|makeByteWordVec2| 61
                                  '(2 0 9 0 11 12 2 9 0 7 0 13 3 8 7 0 11 11 15
                                    2 9 0 0 0 16 0 9 0 17 2 0 19 0 0 1 1 59 19
                                    0 1 1 39 0 25 1 3 56 43 0 11 11 1 2 1 0 0 0
                                    1 2 60 40 0 0 1 2 24 19 0 0 1 2 0 19 0 20 1
                                    0 10 20 1 1 58 11 0 1 3 56 9 0 11 9 1 0 0 0
                                    1 1 7 40 0 1 2 7 0 0 20 1 2 27 0 0 25 1 1
                                    31 37 0 1 1 29 39 0 1 1 16 50 0 1 1 31 38 0
                                    1 1 29 11 0 1 1 16 9 0 1 1 35 30 31 1 2 35
                                    32 31 33 1 2 6 48 31 33 1 1 6 49 31 1 1 7
                                    40 0 1 0 10 0 1 3 56 9 0 11 9 1 2 0 9 0 11
                                    1 1 58 19 0 1 2 4 0 0 25 1 1 53 22 0 1 2 59
                                    19 0 0 1 1 7 19 0 1 1 58 19 0 1 2 0 19 0 20
                                    1 1 19 11 0 1 1 54 9 0 1 2 2 0 0 0 1 1 53
                                    22 0 1 2 55 19 9 0 1 1 19 11 0 1 1 54 9 0 1
                                    2 53 9 42 0 1 2 2 0 0 0 1 2 56 0 21 0 1 2 0
                                    0 21 0 1 1 10 25 0 1 2 0 19 0 20 1 1 7 40 0
                                    1 2 7 0 0 20 1 2 27 0 0 25 1 1 0 26 0 1 2 1
                                    0 0 0 1 1 0 23 0 1 2 0 19 11 0 1 1 10 0 25
                                    1 2 10 45 45 0 1 1 10 46 0 1 1 19 9 0 1 2
                                    56 0 0 9 1 2 53 19 41 0 1 2 17 0 0 28 1 2
                                    17 0 0 29 1 3 17 0 0 22 22 1 3 17 0 0 9 9 1
                                    2 0 19 0 0 1 0 10 44 1 2 55 19 9 0 1 1 0 22
                                    0 1 1 0 19 0 1 0 0 0 1 3 0 9 0 11 9 1 2 0 9
                                    0 11 12 2 40 9 0 0 1 1 0 0 24 1 1 25 0 0 1
                                    2 25 0 0 20 1 2 26 0 0 34 1 2 26 0 0 35 1 3
                                    26 0 0 34 36 1 3 26 0 0 35 20 1 2 6 0 0 21
                                    1 3 6 0 0 21 20 1 2 55 20 9 0 1 2 53 20 41
                                    0 1 1 0 0 0 1 1 10 47 0 1 2 6 0 0 0 1 1 0
                                    24 0 1 1 0 27 0 1 1 31 0 38 1 1 30 0 11 1 1
                                    4 0 0 1 1 16 0 9 1 0 6 20 1 3 6 0 0 0 0 1 2
                                    53 19 41 0 1 2 5 0 0 0 1 2 6 19 0 0 1 1 57
                                    0 0 1 2 7 0 0 20 1 2 27 0 0 25 1 1 25 0 0 1
                                    2 25 0 0 20 1 2 26 0 0 34 1 2 26 0 0 35 1 3
                                    26 0 0 34 36 1 3 26 0 0 35 20 1 2 6 0 0 21
                                    1 3 6 0 0 21 20 1 2 2 19 0 0 1 2 2 19 0 0 1
                                    2 0 19 0 0 1 2 2 19 0 0 1 2 2 19 0 0 1 0 7
                                    0 1 0 59 0 1 2 61 0 0 0 1 1 61 0 0 1 2 0 0
                                    0 0 1 2 0 0 25 0 1 2 0 0 7 0 14 2 0 0 8 0
                                    18 2 35 0 0 11 1 2 61 0 11 0 1 2 59 0 20 0
                                    1 2 27 0 9 0 1 2 27 0 0 9 1 2 27 0 0 0 1 1
                                    53 20 0 1)))))
           '|lookupComplete|)) 
