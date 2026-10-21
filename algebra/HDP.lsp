
(SDEFUN |HDP;<;2%B;1| ((|v1| (%)) (|v2| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G13 NIL) (|n1| (S)) (|n2| (S)) (|i| NIL) (#2=#:G12 NIL))
               (SEQ
                (EXIT
                 (COND ((< (QREFELT % 6) 1) NIL)
                       (#3='T
                        (SEQ (LETT |n1| (SPADCALL |v1| 1 (QREFELT % 10)))
                             (LETT |n2| (SPADCALL |v2| 1 (QREFELT % 10)))
                             (SEQ (LETT |i| 2) (LETT #1# (QREFELT % 6)) G190
                                  (COND ((|greater_SI| |i| #1#) (GO G191)))
                                  (SEQ
                                   (LETT |n1|
                                         (SPADCALL |n1|
                                                   (SPADCALL |v1| |i|
                                                             (QREFELT % 10))
                                                   (QREFELT % 11)))
                                   (EXIT
                                    (LETT |n2|
                                          (SPADCALL |n2|
                                                    (SPADCALL |v2| |i|
                                                              (QREFELT % 10))
                                                    (QREFELT % 11)))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT NIL))
                             (EXIT
                              (COND ((SPADCALL |n1| |n2| (QREFELT % 13)) 'T)
                                    ((SPADCALL |n2| |n1| (QREFELT % 13)) NIL)
                                    (#3#
                                     (SEQ
                                      (SEQ (LETT |i| (QREFELT % 6)) G190
                                           (COND ((< |i| 1) (GO G191)))
                                           (SEQ
                                            (COND
                                             ((SPADCALL
                                               (SPADCALL |v2| |i|
                                                         (QREFELT % 10))
                                               (SPADCALL |v1| |i|
                                                         (QREFELT % 10))
                                               (QREFELT % 13))
                                              (PROGN
                                               (LETT #2# 'T)
                                               (GO #4=#:G11))))
                                            (EXIT
                                             (COND
                                              ((SPADCALL
                                                (SPADCALL |v1| |i|
                                                          (QREFELT % 10))
                                                (SPADCALL |v2| |i|
                                                          (QREFELT % 10))
                                                (QREFELT % 13))
                                               (PROGN
                                                (LETT #2# NIL)
                                                (GO #4#))))))
                                           (LETT |i| (+ |i| -1)) (GO G190) G191
                                           (EXIT NIL))
                                      (EXIT NIL)))))))))
                #4# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |HomogeneousDirectProduct;|)) 

(DEFUN |HomogeneousDirectProduct;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G38 NIL) (#2=#:G37 NIL)
    (#3=#:G35 NIL) (#4=#:G36 NIL) (#5=#:G34 NIL) (#6=#:G33 NIL) (#7=#:G32 NIL)
    (#8=#:G31 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|HomogeneousDirectProduct| DV$1 DV$2))
    (LETT % (GETREFV 46))
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
    (|haddProp| |$ConstructorCache| '|HomogeneousDirectProduct|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
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
    (QSETREFV % 8 (|Vector| |#2|))
    %))) 

(DEFUN |HomogeneousDirectProduct| (&REST #1=#:G39)
  (SPROG NIL
         (PROG (#2=#:G40)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|HomogeneousDirectProduct|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |HomogeneousDirectProduct;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|HomogeneousDirectProduct|)))))))))) 

(MAKEPROP '|HomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (|Integer|) (0 . |qelt|)
              (6 . +) (|Boolean|) (12 . <) |HDP;<;2%B;1| (|NonNegativeInteger|)
              (|Mapping| 7 7) (|List| 7) (|List| 9) (|Vector| 7)
              (|PositiveInteger|) (|Equation| 7) (|List| 21) (|Matrix| 9)
              (|Matrix| %) (|Record| (|:| |mat| 23) (|:| |vec| (|Vector| 9)))
              (|Vector| %) (|List| 28) (|Symbol|) (|List| 15)
              (|Union| 31 '#1="failed") (|Fraction| 9) (|Union| 9 '#1#)
              (|Union| % '"failed") (|Mapping| 12 7) (|Mapping| 12 7 7)
              (|Void|) (|OutputForm|) (|List| %) (|SingleInteger|)
              (|HashState|) (|InputForm|)
              (|Record| (|:| |mat| 43) (|:| |vec| 19)) (|Matrix| 7) (|String|)
              (|Union| 7 '#1#))
           '#(~= 18 |zero?| 24 |unitVector| 29 |swap!| 34 |sup| 41
              |subtractIfCan| 47 |smaller?| 53 |size?| 59 |size| 65 |sign| 69
              |setelt!| 74 |sample| 81 |rightRecip| 85 |rightPower| 90
              |retractIfCan| 102 |retract| 117 |reducedSystem| 132 |recip| 154
              |random| 159 |qsetelt!| 163 |qelt| 170 |positive?| 176
              |plenaryPower| 181 |parts| 187 |opposite?| 192 |one?| 198
              |negative?| 203 |more?| 208 |minIndex| 214 |min| 219 |members|
              230 |member?| 235 |maxIndex| 241 |max| 246 |map!| 263 |map| 269
              |lookup| 275 |less?| 280 |leftRecip| 286 |leftPower| 291 |latex|
              303 |inf| 308 |indices| 314 |index?| 319 |index| 325
              |hashUpdate!| 330 |hash| 336 |first| 341 |fill!| 346 |every?| 352
              |eval| 358 |eq?| 384 |enumerate| 390 |entry?| 394 |entries| 400
              |empty?| 405 |empty| 410 |elt| 414 |dot| 427 |directProduct| 433
              |differentiate| 438 |count| 488 |copy| 500 |convert| 505
              |commutator| 510 |coerce| 516 |characteristic| 546 |associator|
              550 |any?| 557 |antiCommutator| 563 |annihilate?| 569 |abs| 575 ^
              580 D 592 >= 642 > 648 = 654 <= 660 < 666 |1| 672 |0| 676 - 680 +
              691 * 697 |#| 739)
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
                 (|PartialDifferentialRing| 28) (|Algebra| 7) (|Algebra| $$)
                 (|Ring|) (|Rng|) (|NonAssociativeAlgebra| 7)
                 (|NonAssociativeAlgebra| $$) (|SemiRing|)
                 (|FullyLinearlyExplicitOver| 7) (|Module| 7) (|Module| $$)
                 (|SemiRng|) (|LinearlyExplicitOver| 9)
                 (|LinearlyExplicitOver| 7) (|BiModule| 7 7) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|NonAssociativeRng|) (|RightModule| 9)
                 (|RightModule| 7) (|LeftModule| 7) (|LeftModule| $$)
                 (|RightModule| $$) (|OrderedAbelianMonoidSup|)
                 (|AbelianProductCategory| 7) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Finite|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|Comparable|)
                 (|IndexedAggregate| 9 7) (|FullyRetractableTo| 7)
                 (|AbelianSemiGroup|) (|Magma|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|HomogeneousAggregate| 7)
                 (|RetractableTo| 9) (|RetractableTo| 31) (|RetractableTo| 7)
                 (|SetCategory|) (|Hashable|) (|CommutativeStar|)
                 (|Evalable| 7) (|EltableAggregate| 9 7) (|Aggregate|)
                 (|CoercibleFrom| 9) (|CoercibleFrom| 31) (|CoercibleFrom| 7)
                 (|BasicType|) (|ConvertibleTo| 41) (|CharacteristicZero|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|PartialOrder|)
                 (|CoercibleTo| 37) (|InnerEvalable| 7 7) (|Eltable| 9 7)
                 (|CoercibleTo| (|Vector| 7)) (|finiteAggregate|) (|Type|))
              (|makeByteWordVec2| 62
                                  '(2 0 7 0 9 10 2 7 0 0 0 11 2 7 12 0 0 13 2
                                    62 12 0 0 1 1 59 12 0 1 1 22 0 20 1 3 56 36
                                    0 9 9 1 2 1 0 0 0 1 2 60 33 0 0 1 2 28 12 0
                                    0 1 2 0 12 0 15 1 0 12 15 1 1 58 9 0 1 3 56
                                    7 0 9 7 1 0 0 0 1 1 9 33 0 1 2 9 0 0 15 1 2
                                    40 0 0 20 1 1 50 30 0 1 1 47 32 0 1 1 18 45
                                    0 1 1 50 31 0 1 1 47 9 0 1 1 18 7 0 1 1 32
                                    23 24 1 2 32 25 24 26 1 2 8 42 24 26 1 1 8
                                    43 24 1 1 9 33 0 1 0 12 0 1 3 56 7 0 9 7 1
                                    2 0 7 0 9 10 1 58 12 0 1 2 5 0 0 20 1 1 53
                                    17 0 1 2 59 12 0 0 1 1 9 12 0 1 1 58 12 0 1
                                    2 0 12 0 15 1 1 21 9 0 1 1 54 7 0 1 2 2 0 0
                                    0 1 1 53 17 0 1 2 55 12 7 0 1 1 21 9 0 1 1
                                    54 7 0 1 2 53 7 35 0 1 2 2 0 0 0 1 2 56 0
                                    16 0 1 2 0 0 16 0 1 1 12 20 0 1 2 0 12 0 15
                                    1 1 9 33 0 1 2 9 0 0 15 1 2 40 0 0 20 1 1
                                    18 44 0 1 2 1 0 0 0 1 1 0 18 0 1 2 0 12 9 0
                                    1 1 12 0 20 1 2 12 40 40 0 1 1 12 39 0 1 1
                                    21 7 0 1 2 56 0 0 7 1 2 53 12 34 0 1 2 19 0
                                    0 21 1 2 19 0 0 22 1 3 19 0 0 17 17 1 3 19
                                    0 0 7 7 1 2 0 12 0 0 1 0 12 38 1 2 55 12 7
                                    0 1 1 0 17 0 1 1 0 12 0 1 0 0 0 1 3 0 7 0 9
                                    7 1 2 0 7 0 9 1 2 23 7 0 0 1 1 0 0 19 1 1
                                    29 0 0 1 2 29 0 0 15 1 2 30 0 0 27 1 2 30 0
                                    0 28 1 3 30 0 0 27 29 1 3 30 0 0 28 15 1 2
                                    8 0 0 16 1 3 8 0 0 16 15 1 2 55 15 7 0 1 2
                                    53 15 34 0 1 1 0 0 0 1 1 12 41 0 1 2 8 0 0
                                    0 1 1 0 19 0 1 1 50 0 31 1 1 49 0 9 1 1 46
                                    37 0 1 1 5 0 0 1 1 18 0 7 1 0 8 15 1 3 8 0
                                    0 0 0 1 2 53 12 34 0 1 2 7 0 0 0 1 2 8 12 0
                                    0 1 1 57 0 0 1 2 9 0 0 15 1 2 40 0 0 20 1 1
                                    29 0 0 1 2 29 0 0 15 1 2 30 0 0 27 1 2 30 0
                                    0 28 1 3 30 0 0 27 29 1 3 30 0 0 28 15 1 2
                                    8 0 0 16 1 3 8 0 0 16 15 1 2 2 12 0 0 1 2 2
                                    12 0 0 1 2 62 12 0 0 1 2 2 12 0 0 1 2 2 12
                                    0 0 14 0 9 0 1 0 59 0 1 1 61 0 0 1 2 61 0 0
                                    0 1 2 45 0 0 0 1 2 32 0 0 9 1 2 61 0 9 0 1
                                    2 59 0 15 0 1 2 45 0 20 0 1 2 40 0 7 0 1 2
                                    40 0 0 7 1 2 40 0 0 0 1 1 53 15 0 1)))))
           '|lookupComplete|)) 
