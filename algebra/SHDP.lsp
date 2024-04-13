
(SDEFUN |SHDP;lessThanRlex|
        ((|v1| (%)) (|v2| (%)) (|low| (|NonNegativeInteger|))
         (|high| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G22 NIL) (#2=#:G24 NIL) (|i| NIL) (|n2| (S)) (|n1| (S))
          (#3=#:G23 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n1| (|spadConstant| % 10))
                (LETT |n2| (|spadConstant| % 10))
                (SEQ (LETT |i| |low|) (LETT #3# |high|) G190
                     (COND ((> |i| #3#) (GO G191)))
                     (SEQ
                      (LETT |n1|
                            (SPADCALL |n1| (SPADCALL |v1| |i| (QREFELT % 12))
                                      (QREFELT % 13)))
                      (EXIT
                       (LETT |n2|
                             (SPADCALL |n2| (SPADCALL |v2| |i| (QREFELT % 12))
                                       (QREFELT % 13)))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (COND ((SPADCALL |n1| |n2| (QREFELT % 15)) 'T)
                       ((SPADCALL |n2| |n1| (QREFELT % 15)) NIL)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| |high|) (LETT #2# |low|) G190
                              (COND ((< |i| #2#) (GO G191)))
                              (SEQ
                               (COND
                                ((SPADCALL (SPADCALL |v2| |i| (QREFELT % 12))
                                           (SPADCALL |v1| |i| (QREFELT % 12))
                                           (QREFELT % 15))
                                 (PROGN (LETT #1# 'T) (GO #4=#:G21))))
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT % 12))
                                            (SPADCALL |v2| |i| (QREFELT % 12))
                                            (QREFELT % 15))
                                  (PROGN (LETT #1# NIL) (GO #4#))))))
                              (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                         (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SHDP;<;2%B;2| ((|v1| (%)) (|v2| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G31 NIL) (#2=#:G32 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (COND ((|SHDP;lessThanRlex| |v1| |v2| 1 (QREFELT % 7) %) 'T)
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 7)) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL (SPADCALL |v1| |i| (QREFELT % 12))
                                            (SPADCALL |v2| |i| (QREFELT % 12))
                                            (QREFELT % 16))
                                  (PROGN (LETT #1# NIL) (GO #3=#:G30))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (|SHDP;lessThanRlex| |v1| |v2| (+ (QREFELT % 7) 1)
                           (QREFELT % 6) %))))))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |SplitHomogeneousDirectProduct;|)) 

(DEFUN |SplitHomogeneousDirectProduct| (&REST #1=#:G70)
  (SPROG NIL
         (PROG (#2=#:G71)
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

(DEFUN |SplitHomogeneousDirectProduct;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G60 NIL) (#2=#:G61 NIL) (#3=#:G62 NIL) (#4=#:G63 NIL)
    (#5=#:G64 NIL) (#6=#:G66 NIL) (#7=#:G65 NIL) (#8=#:G67 NIL) (#9=#:G68 NIL)
    (#10=#:G69 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 |#2|)
    (LETT DV$3 (|devaluate| |#3|))
    (LETT |dv$| (LIST '|SplitHomogeneousDirectProduct| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 49))
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
                                        (|HasCategory| |#3| '(|AbelianGroup|))
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
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#3|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#3| '(|Ring|))))
                                        (OR
                                         (AND #7#
                                              (|HasCategory| |#3|
                                                             '(|PartialDifferentialRing|
                                                               (|Symbol|))))
                                         (AND #7#
                                              (|HasCategory| |#3|
                                                             '(|CommutativeRing|)))
                                         (AND #7# #8#) #6#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #5#
                                              (|HasCategory| |#3|
                                                             '(|AbelianMonoid|)))
                                        (AND #5#
                                             (|HasCategory| |#3| '(|Monoid|)))
                                        (AND #5#
                                             (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #4#
                                              (|HasCategory| |#3|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #5# #4#)
                                        (OR
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #4#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# (|HasCategory| |#3| '(|Ring|))
                                         (|HasCategory| |#3| '(|SemiRng|)))
                                        (LETT #3#
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
                                          #4#)
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
                                        (OR (|HasCategory| |#3| '(|Monoid|))
                                            #3#)
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #5#
                                         (|HasCategory| |#3| '(|BasicType|))
                                         #4#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#3| '(|Monoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#3| '(|Ring|))
                                         #3# (|HasCategory| |#3| '(|SemiRng|))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (OR
                                         (|HasCategory| |#3|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#3| '(|AbelianGroup|))
                                         #5# #4#
                                         (|HasCategory| |#3|
                                                        '(|CommutativeRing|))
                                         #8# #9#
                                         (|HasCategory| |#3| '(|Monoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoid|))
                                         (|HasCategory| |#3|
                                                        '(|OrderedAbelianMonoidSup|))
                                         #10# (|HasCategory| |#3| '(|Ring|))
                                         #3# (|HasCategory| |#3| '(|SemiRng|))
                                         (|HasCategory| |#3| '(|SetCategory|)))
                                        (OR #5#
                                            (|HasCategory| |#3| '(|SemiRng|)))
                                        (|HasCategory| |#3|
                                                       '(|CoercibleTo|
                                                         (|OutputForm|)))
                                        (LETT #2#
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
                                          #4#)
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
                                          #3#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #2#)
                                        (OR #2# (|HasCategory| |#3| '(|Ring|)))
                                        (LETT #1#
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
                                         #6# #1# #2#
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|Ring|)))
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|AbelianGroup|))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         (AND #5#
                                              (|HasCategory| |#3| '(|Ring|)))
                                         (AND #5#
                                              (|HasCategory| |#3|
                                                             '(|SemiRng|))))
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
                                          #4#)
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
                                          #3#)
                                         (AND
                                          (|HasCategory| |#3|
                                                         '(|RetractableTo|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#3| '(|SemiRng|)))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|SplitHomogeneousDirectProduct|
                (LIST DV$1 DV$2 DV$3) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 1125899906842624))
    (AND #10# (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 2251799813685248))
    (AND (|HasCategory| |#3| '(|BasicType|))
         (|HasCategory| % '(|finiteAggregate|))
         (|augmentPredVector| % 4503599627370496))
    (AND (|HasCategory| % '(|shallowlyMutable|))
         (|augmentPredVector| % 9007199254740992))
    (AND
     (OR
      (AND #7# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #5#
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 18014398509481984))
    (AND
     (OR
      (AND #7# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|Ring|)))
      (AND (|HasCategory| |#3| '(|AbelianGroup|))
           (|HasCategory| |#3| '(|SemiRng|)))
      #4#
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 36028797018963968))
    (AND
     (OR
      (AND #7# (|HasCategory| |#3| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#3| '(|AbelianGroup|))
      (AND (|HasCategory| |#3| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 72057594037927936))
    (AND
     (OR
      (AND (|HasCategory| |#3| '(|BasicType|))
           (|HasCategory| % '(|finiteAggregate|)))
      (|HasCategory| |#3| '(|SetCategory|)))
     (|augmentPredVector| % 144115188075855872))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9 (|Vector| |#3|))
    %))) 

(MAKEPROP '|SplitHomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 8)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (0 . |Zero|)
              (|Integer|) (4 . |qelt|) (10 . +) (|Boolean|) (16 . <) (22 . ~=)
              |SHDP;<;2%B;2| (|NonNegativeInteger|) (|PositiveInteger|)
              (|List| 8) (|Equation| 8) (|List| 21)
              (|Record| (|:| |mat| 26) (|:| |vec| (|Vector| 11))) (|Matrix| %)
              (|Vector| %) (|Matrix| 11) (|Symbol|) (|List| 27) (|List| 18)
              (|Union| 31 '#1="failed") (|Fraction| 11) (|Union| 11 '#1#)
              (|Union| % '"failed") (|Mapping| 14 8 8) (|Mapping| 14 8)
              (|Void|) (|Mapping| 8 8) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|HashState|) (|List| %) (|Matrix| 8)
              (|Record| (|:| |mat| 43) (|:| |vec| 47)) (|Union| 8 '#1#)
              (|String|) (|Vector| 8) (|List| 11))
           '#(~= 28 |zero?| 34 |unitVector| 39 |swap!| 44 |sup| 51
              |subtractIfCan| 57 |smaller?| 63 |size?| 69 |size| 75 |setelt!|
              79 |sample| 86 |rightRecip| 90 |rightPower| 95 |retractIfCan| 107
              |retract| 122 |reducedSystem| 137 |recip| 159 |random| 164
              |qsetelt!| 168 |qelt| 175 |plenaryPower| 181 |parts| 187
              |opposite?| 192 |one?| 198 |more?| 203 |minIndex| 209 |min| 214
              |members| 225 |member?| 230 |maxIndex| 236 |max| 241 |map!| 258
              |map| 264 |lookup| 270 |less?| 275 |leftRecip| 281 |leftPower|
              286 |latex| 298 |inf| 303 |indices| 309 |index?| 314 |index| 320
              |hashUpdate!| 325 |hash| 331 |first| 336 |fill!| 341 |every?| 347
              |eval| 353 |eq?| 379 |enumerate| 385 |entry?| 389 |entries| 395
              |empty?| 400 |empty| 405 |elt| 409 |dot| 422 |directProduct| 428
              |differentiate| 433 |count| 483 |copy| 495 |convert| 500
              |commutator| 505 |coerce| 511 |characteristic| 541 |associator|
              545 |any?| 552 |antiCommutator| 558 |annihilate?| 564 ^ 570
              |Zero| 582 |One| 586 D 590 >= 640 > 646 = 652 <= 658 < 664 - 670
              + 681 * 687 |#| 729)
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
              '#((|DirectProductCategory| 6 8) (|CommutativeRing|)
                 (|DifferentialExtension| 8) (|Algebra| $$) (|Algebra| 8)
                 (|PartialDifferentialRing| 27) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 8) (|Rng|) (|SemiRng|) (|Module| $$)
                 (|Module| 8) (|FullyLinearlyExplicitOver| 8)
                 (|OrderedAbelianMonoidSup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 8 8) (|LinearlyExplicitOver| 8)
                 (|LinearlyExplicitOver| 11) (|AbelianProductCategory| 8)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 8) (|RightModule| 8)
                 (|RightModule| 11) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|IndexedAggregate| 11 8) (|OrderedSet|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 8)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 8) (|Aggregate|)
                 (|EltableAggregate| 11 8) (|Evalable| 8) (|CommutativeStar|)
                 (|Hashable|) (|SetCategory|) (|RetractableTo| 8)
                 (|RetractableTo| 31) (|RetractableTo| 11) (|Type|)
                 (|finiteAggregate|) (|CoercibleTo| (|Vector| 8))
                 (|Eltable| 11 8) (|InnerEvalable| 8 8) (|CoercibleTo| 38)
                 (|PartialOrder|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 39) (|BasicType|) (|CoercibleFrom| 8)
                 (|CoercibleFrom| 31) (|CoercibleFrom| 11))
              (|makeByteWordVec2| 58
                                  '(0 8 0 10 2 0 8 0 11 12 2 8 0 0 0 13 2 8 14
                                    0 0 15 2 8 14 0 0 16 2 58 14 0 0 1 1 55 14
                                    0 1 1 31 0 19 1 3 54 36 0 11 11 1 2 1 0 0 0
                                    1 2 56 33 0 0 1 2 23 14 0 0 1 2 0 14 0 18 1
                                    0 12 18 1 3 54 8 0 11 8 1 0 0 0 1 1 10 33 0
                                    1 2 10 0 0 18 1 2 38 0 0 19 1 1 48 30 0 1 1
                                    45 32 0 1 1 19 45 0 1 1 48 31 0 1 1 45 11 0
                                    1 1 19 8 0 1 2 27 23 24 25 1 1 27 26 24 1 1
                                    9 43 24 1 2 9 44 24 25 1 1 10 33 0 1 0 12 0
                                    1 3 54 8 0 11 8 1 2 0 8 0 11 12 2 6 0 0 19
                                    1 1 51 20 0 1 2 55 14 0 0 1 1 10 14 0 1 2 0
                                    14 0 18 1 1 22 11 0 1 1 52 8 0 1 2 3 0 0 0
                                    1 1 51 20 0 1 2 53 14 8 0 1 1 22 11 0 1 1
                                    52 8 0 1 2 51 8 34 0 1 2 3 0 0 0 1 2 54 0
                                    37 0 1 2 0 0 37 0 1 1 12 19 0 1 2 0 14 0 18
                                    1 1 10 33 0 1 2 10 0 0 18 1 2 38 0 0 19 1 1
                                    19 46 0 1 2 1 0 0 0 1 1 0 48 0 1 2 0 14 11
                                    0 1 1 12 0 19 1 2 12 41 41 0 1 1 12 40 0 1
                                    1 22 8 0 1 2 54 0 0 8 1 2 51 14 35 0 1 3 20
                                    0 0 20 20 1 2 20 0 0 21 1 3 20 0 0 8 8 1 2
                                    20 0 0 22 1 2 0 14 0 0 1 0 12 42 1 2 53 14
                                    8 0 1 1 0 20 0 1 1 0 14 0 1 0 0 0 1 3 0 8 0
                                    11 8 1 2 0 8 0 11 1 2 32 8 0 0 1 1 0 0 47 1
                                    2 24 0 0 18 1 1 24 0 0 1 3 25 0 0 27 18 1 3
                                    25 0 0 28 29 1 2 25 0 0 27 1 2 25 0 0 28 1
                                    3 9 0 0 37 18 1 2 9 0 0 37 1 2 53 18 8 0 1
                                    2 51 18 35 0 1 1 0 0 0 1 1 12 39 0 1 2 9 0
                                    0 0 1 1 48 0 31 1 1 47 0 11 1 1 44 38 0 1 1
                                    6 0 0 1 1 19 0 8 1 1 0 47 0 1 0 9 18 1 3 9
                                    0 0 0 0 1 2 51 14 35 0 1 2 8 0 0 0 1 2 9 14
                                    0 0 1 2 10 0 0 18 1 2 38 0 0 19 1 0 55 0 1
                                    0 10 0 1 2 24 0 0 18 1 1 24 0 0 1 3 25 0 0
                                    27 18 1 3 25 0 0 28 29 1 2 25 0 0 27 1 2 25
                                    0 0 28 1 3 9 0 0 37 18 1 2 9 0 0 37 1 2 3
                                    14 0 0 1 2 3 14 0 0 1 2 58 14 0 0 1 2 3 14
                                    0 0 1 2 3 14 0 0 17 1 57 0 0 1 2 57 0 0 0 1
                                    2 43 0 0 0 1 2 27 0 0 11 1 2 57 0 11 0 1 2
                                    55 0 18 0 1 2 43 0 19 0 1 2 38 0 0 0 1 2 38
                                    0 0 8 1 2 38 0 8 0 1 1 51 18 0 1)))))
           '|lookupComplete|)) 
