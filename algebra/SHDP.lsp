
(SDEFUN |SHDP;lessThanRlex|
        ((|v1| (%)) (|v2| (%)) (|low| (|NonNegativeInteger|))
         (|high| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G16 NIL) (|n1| (S)) (|n2| (S)) (|i| NIL) (#2=#:G17 NIL)
          (#3=#:G15 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n1| (SPADCALL |v1| |low| (QREFELT % 11)))
                (LETT |n2| (SPADCALL |v2| |low| (QREFELT % 11)))
                (SEQ (LETT |i| (+ |low| 1)) (LETT #1# |high|) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (LETT |n1|
                            (SPADCALL |n1| (SPADCALL |v1| |i| (QREFELT % 11))
                                      (QREFELT % 12)))
                      (EXIT
                       (LETT |n2|
                             (SPADCALL |n2| (SPADCALL |v2| |i| (QREFELT % 11))
                                       (QREFELT % 12)))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n1| |n2| (QREFELT % 14)) 'T)
                       ((SPADCALL |n2| |n1| (QREFELT % 14)) NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| |high|) (LETT #2# |low|) G190
                              (COND ((< |i| #2#) (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |v2| |i| (QREFELT % 11))
                                           (SPADCALL |v1| |i| (QREFELT % 11))
                                           (QREFELT % 14))
                                 (PROGN (LETT #3# 'T) (GO #4=#:G14))))
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT % 11))
                                            (SPADCALL |v2| |i| (QREFELT % 11))
                                            (QREFELT % 14))
                                  (PROGN (LETT #3# NIL) (GO #4#))))))
                              (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))))
          #4# (EXIT #3#)))) 

(SDEFUN |SHDP;<;2%B;2| ((|v1| (%)) (|v2| (%)) (% (|Boolean|)))
        (SPROG ((|i| NIL) (#1=#:G25 NIL) (#2=#:G24 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((> (QREFELT % 7) 0)
                    (COND
                     ((|SHDP;lessThanRlex| |v1| |v2| 1 (QREFELT % 7) %)
                      (EXIT 'T)))))
                  (SEQ (LETT |i| 1) (LETT #1# (QREFELT % 7)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |v1| |i| (QREFELT % 11))
                                     (SPADCALL |v2| |i| (QREFELT % 11))
                                     (QREFELT % 15))
                           (PROGN (LETT #2# NIL) (GO #3=#:G23))))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((< (QREFELT % 6) (+ (QREFELT % 7) 1)) NIL)
                         ('T
                          (|SHDP;lessThanRlex| |v1| |v2| (+ (QREFELT % 7) 1)
                           (QREFELT % 6) %))))))
                #3# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |SplitHomogeneousDirectProduct;|)) 

(DEFUN |SplitHomogeneousDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G50 NIL)
    (#2=#:G49 NIL) (#3=#:G47 NIL) (#4=#:G48 NIL) (#5=#:G46 NIL) (#6=#:G45 NIL)
    (#7=#:G44 NIL) (#8=#:G43 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 |#2|)
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|SplitHomogeneousDirectProduct| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 48))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#3|
                                                       '(|OrderedAbelianMonoidSup|))
                                        (|HasCategory| |#3| '(|OrderedSet|))
                                        (|HasCategory| |#3| '(|AbelianMonoid|))
                                        (|HasCategory| |#3| '(|unitsKnown|))
                                        (|HasCategory| |#3|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#3| '(|AbelianGroup|))
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
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3| '(|Monoid|)))
                                        (AND
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #3#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         (AND #3# #1#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #5#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #1# #2# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (LETT #6#
                                              (|HasCategory| |#3|
                                                             '(|SemiGroup|)))
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
                                          #5#)
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
                                          #6#)
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
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #6#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#3| '(|BasicType|))
                                         #5#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#3| '(|Finite|))
                                         (|HasCategory| |#3| '(|Monoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#3| '(|OrderedSet|))
                                         (|HasCategory| |#3| '(|Ring|)) #6#
                                         (|HasCategory| |#3| '(|SemiRng|))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #5#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #1# (|HasCategory| |#3| '(|Finite|))
                                         (|HasCategory| |#3| '(|Monoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #2#
                                         (|HasCategory| |#3| '(|OrderedSet|))
                                         (|HasCategory| |#3| '(|Ring|)) #6#
                                         (|HasCategory| |#3| '(|SemiRng|))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|AbelianMonoid|))
                                         #2# (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
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
                                          #5#)
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
                                          #6#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #7#)
                                        (OR #7# (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #8#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory| |#3|
                                                              '(|SetCategory|))))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|CoercibleTo|
                                                          (|OutputForm|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         (LIST '|Evalable|
                                                               (|devaluate|
                                                                |#3|)))
                                          (|HasCategory| |#3|
                                                         '(|SetCategory|)))
                                         #4# #8# #7#
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| |#3|
                                                         '(|CommutativeRing|))))
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
                                          #5#)
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
                                          #6#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #8#)))))
    (|haddProp| |$ConstructorCache| '|SplitHomogeneousDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| |#3| '(|OrderedSet|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 9007199254740992))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 18014398509481984))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #2# (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|OrderedAbelianMonoidSup|))
           (|HasCategory| % '(|SetWithZero|)))
      (AND #2# (|HasCategory| % '(|SetWithZero|)))
      (AND (|HasCategory| |#3| '(|OrderedSet|))
           (|HasCategory| % '(|SetWithZero|))))
     (|augmentPredVector| % 144115188075855872))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      (|HasCategory| |#3| '(|AbelianMonoid|))
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 288230376151711744))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|Ring|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|SemiRng|)))
      #5#
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 576460752303423488))
    (AND
     (OR
      (AND #3# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#3| '(|AbelianGroup|))
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 1152921504606846976))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#3| '(|SetCategory|)))
     (|augmentPredVector| % 2305843009213693952))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#3|))
    %))) 

(DEFUN |SplitHomogeneousDirectProduct| (&REST #1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(NIL NIL T))
                     (HGET |$ConstructorCache|
                           '|SplitHomogeneousDirectProduct|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SplitHomogeneousDirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SplitHomogeneousDirectProduct|)))))))))) 

(MAKEPROP '|SplitHomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |qelt|) (6 . +) (|Boolean|) (12 . <) (18 . ~=)
              |SHDP;<;2%B;2| (|NonNegativeInteger|) (|Mapping| 8 8) (|List| 8)
              (|List| 10) (|Vector| 8) (|PositiveInteger|) (|Equation| 8)
              (|List| 23) (|Matrix| 10) (|Matrix| %)
              (|Record| (|:| |mat| 25) (|:| |vec| (|Vector| 10))) (|Vector| %)
              (|List| 30) (|Symbol|) (|List| 17) (|Union| 33 '#1="failed")
              (|Fraction| 10) (|Union| 10 '#1#) (|Union| % '"failed")
              (|Mapping| 13 8) (|Mapping| 13 8 8) (|Void|) (|OutputForm|)
              (|List| %) (|SingleInteger|) (|HashState|) (|InputForm|)
              (|Record| (|:| |mat| 45) (|:| |vec| 21)) (|Matrix| 8) (|String|)
              (|Union| 8 '#1#))
           '#(~= 24 |zero?| 30 |unitVector| 35 |swap!| 40 |sup| 47
              |subtractIfCan| 53 |smaller?| 59 |size?| 65 |size| 71 |sign| 75
              |setelt!| 80 |sample| 87 |rightRecip| 91 |rightPower| 96
              |retractIfCan| 108 |retract| 123 |reducedSystem| 138 |recip| 160
              |random| 165 |qsetelt!| 169 |qelt| 176 |positive?| 182
              |plenaryPower| 187 |parts| 193 |opposite?| 198 |one?| 204
              |negative?| 209 |more?| 214 |minIndex| 220 |min| 225 |members|
              236 |member?| 241 |maxIndex| 247 |max| 252 |map!| 269 |map| 275
              |lookup| 281 |less?| 286 |leftRecip| 292 |leftPower| 297 |latex|
              309 |inf| 314 |indices| 320 |index?| 325 |index| 331
              |hashUpdate!| 336 |hash| 342 |first| 347 |fill!| 352 |every?| 358
              |eval| 364 |eq?| 390 |enumerate| 396 |entry?| 400 |entries| 406
              |empty?| 411 |empty| 416 |elt| 420 |dot| 433 |directProduct| 439
              |differentiate| 444 |count| 494 |copy| 506 |convert| 511
              |commutator| 516 |coerce| 522 |characteristic| 552 |associator|
              556 |any?| 563 |antiCommutator| 569 |annihilate?| 575 |abs| 581 ^
              586 D 598 >= 648 > 654 = 660 <= 666 < 672 |1| 678 |0| 682 - 686 +
              697 * 703 |#| 745)
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
              '#((|DirectProductCategory| 6 8) (|DifferentialExtension| 8)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 30) (|Algebra| 8) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 8)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 8) (|Module| 8) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 10)
                 (|LinearlyExplicitOver| 8) (|BiModule| 8 8) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|)
                 (|RightModule| 10) (|RightModule| 8) (|LeftModule| 8)
                 (|LeftModule| $$) (|RightModule| $$)
                 (|OrderedAbelianMonoidSup|) (|AbelianProductCategory| 8)
                 (|AbelianGroup|) (|OrderedAbelianSemiGroup|) (|Finite|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|Comparable|) (|IndexedAggregate| 10 8)
                 (|FullyRetractableTo| 8) (|AbelianSemiGroup|) (|Magma|)
                 (|SetWithZero|) (|ComparableRepresentation|)
                 (|HomogeneousAggregate| 8) (|RetractableTo| 10)
                 (|RetractableTo| 33) (|RetractableTo| 8) (|SetCategory|)
                 (|Hashable|) (|CommutativeStar|) (|Evalable| 8)
                 (|EltableAggregate| 10 8) (|Aggregate|) (|CoercibleFrom| 10)
                 (|CoercibleFrom| 33) (|CoercibleFrom| 8) (|BasicType|)
                 (|ConvertibleTo| 43) (|CharacteristicZero|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|PartialOrder|) (|CoercibleTo| 39)
                 (|InnerEvalable| 8 8) (|Eltable| 10 8)
                 (|CoercibleTo| (|Vector| 8)) (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 62
                                  '(2 0 8 0 10 11 2 8 0 0 0 12 2 8 13 0 0 14 2
                                    8 13 0 0 15 2 62 13 0 0 1 1 59 13 0 1 1 22
                                    0 22 1 3 56 38 0 10 10 1 2 1 0 0 0 1 2 60
                                    35 0 0 1 2 28 13 0 0 1 2 0 13 0 17 1 0 12
                                    17 1 1 58 10 0 1 3 56 8 0 10 8 1 0 0 0 1 1
                                    9 35 0 1 2 9 0 0 17 1 2 40 0 0 22 1 1 50 32
                                    0 1 1 47 34 0 1 1 18 47 0 1 1 50 33 0 1 1
                                    47 10 0 1 1 18 8 0 1 1 32 25 26 1 2 32 27
                                    26 28 1 2 8 44 26 28 1 1 8 45 26 1 1 9 35 0
                                    1 0 12 0 1 3 56 8 0 10 8 1 2 0 8 0 10 11 1
                                    58 13 0 1 2 5 0 0 22 1 1 53 19 0 1 2 59 13
                                    0 0 1 1 9 13 0 1 1 58 13 0 1 2 0 13 0 17 1
                                    1 21 10 0 1 1 54 8 0 1 2 2 0 0 0 1 1 53 19
                                    0 1 2 55 13 8 0 1 1 21 10 0 1 1 54 8 0 1 2
                                    53 8 37 0 1 2 2 0 0 0 1 2 56 0 18 0 1 2 0 0
                                    18 0 1 1 12 22 0 1 2 0 13 0 17 1 1 9 35 0 1
                                    2 9 0 0 17 1 2 40 0 0 22 1 1 18 46 0 1 2 1
                                    0 0 0 1 1 0 20 0 1 2 0 13 10 0 1 1 12 0 22
                                    1 2 12 42 42 0 1 1 12 41 0 1 1 21 8 0 1 2
                                    56 0 0 8 1 2 53 13 36 0 1 2 19 0 0 23 1 2
                                    19 0 0 24 1 3 19 0 0 19 19 1 3 19 0 0 8 8 1
                                    2 0 13 0 0 1 0 12 40 1 2 55 13 8 0 1 1 0 19
                                    0 1 1 0 13 0 1 0 0 0 1 3 0 8 0 10 8 1 2 0 8
                                    0 10 1 2 23 8 0 0 1 1 0 0 21 1 1 29 0 0 1 2
                                    29 0 0 17 1 2 30 0 0 29 1 2 30 0 0 30 1 3
                                    30 0 0 29 31 1 3 30 0 0 30 17 1 2 8 0 0 18
                                    1 3 8 0 0 18 17 1 2 55 17 8 0 1 2 53 17 36
                                    0 1 1 0 0 0 1 1 12 43 0 1 2 8 0 0 0 1 1 0
                                    21 0 1 1 50 0 33 1 1 49 0 10 1 1 46 39 0 1
                                    1 5 0 0 1 1 18 0 8 1 0 8 17 1 3 8 0 0 0 0 1
                                    2 53 13 36 0 1 2 7 0 0 0 1 2 8 13 0 0 1 1
                                    57 0 0 1 2 9 0 0 17 1 2 40 0 0 22 1 1 29 0
                                    0 1 2 29 0 0 17 1 2 30 0 0 29 1 2 30 0 0 30
                                    1 3 30 0 0 29 31 1 3 30 0 0 30 17 1 2 8 0 0
                                    18 1 3 8 0 0 18 17 1 2 2 13 0 0 1 2 2 13 0
                                    0 1 2 62 13 0 0 1 2 2 13 0 0 1 2 2 13 0 0
                                    16 0 9 0 1 0 59 0 1 1 61 0 0 1 2 61 0 0 0 1
                                    2 45 0 0 0 1 2 32 0 0 10 1 2 61 0 10 0 1 2
                                    59 0 17 0 1 2 45 0 22 0 1 2 40 0 8 0 1 2 40
                                    0 0 8 1 2 40 0 0 0 1 1 53 17 0 1)))))
           '|lookupComplete|)) 
