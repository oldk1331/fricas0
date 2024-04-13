
(SDEFUN |HDP;<;2%B;1| ((|v1| (%)) (|v2| (%)) (% (|Boolean|)))
        (SPROG ((#1=#:G20 NIL) (|i| NIL) (|n2| (S)) (|n1| (S)) (#2=#:G21 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |n1| (|spadConstant| % 9))
                      (LETT |n2| (|spadConstant| % 9))
                      (SEQ (LETT |i| 1) (LETT #2# (QREFELT % 6)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |n1|
                                  (SPADCALL |n1|
                                            (SPADCALL |v1| |i| (QREFELT % 11))
                                            (QREFELT % 12)))
                            (EXIT
                             (LETT |n2|
                                   (SPADCALL |n2|
                                             (SPADCALL |v2| |i| (QREFELT % 11))
                                             (QREFELT % 12)))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND ((SPADCALL |n1| |n2| (QREFELT % 14)) 'T)
                             ((SPADCALL |n2| |n1| (QREFELT % 14)) NIL)
                             ('T
                              (SEQ
                               (SEQ (LETT |i| (QREFELT % 6)) G190
                                    (COND ((< |i| 1) (GO G191)))
                                    (SEQ
                                     (COND
                                      ((SPADCALL
                                        (SPADCALL |v2| |i| (QREFELT % 11))
                                        (SPADCALL |v1| |i| (QREFELT % 11))
                                        (QREFELT % 14))
                                       (PROGN (LETT #1# 'T) (GO #3=#:G19))))
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (SPADCALL |v1| |i| (QREFELT % 11))
                                         (SPADCALL |v2| |i| (QREFELT % 11))
                                         (QREFELT % 14))
                                        (PROGN (LETT #1# NIL) (GO #3#))))))
                                    (LETT |i| (+ |i| -1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT NIL)))))))
                #3# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |HomogeneousDirectProduct;|)) 

(DEFUN |HomogeneousDirectProduct| (&REST #1=#:G59)
  (SPROG NIL
         (PROG (#2=#:G60)
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

(DEFUN |HomogeneousDirectProduct;| (|#1| |#2|)
  (SPROG
   ((|pv$| NIL) (#1=#:G49 NIL) (#2=#:G50 NIL) (#3=#:G51 NIL) (#4=#:G52 NIL)
    (#5=#:G53 NIL) (#6=#:G55 NIL) (#7=#:G54 NIL) (#8=#:G56 NIL) (#9=#:G57 NIL)
    (#10=#:G58 NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 |#1|)
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|HomogeneousDirectProduct| DV$1 DV$2))
    (LETT % (GETREFV 47))
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
    (|haddProp| |$ConstructorCache| '|HomogeneousDirectProduct|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
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
    (QSETREFV % 8 (|Vector| |#2|))
    %))) 

(MAKEPROP '|HomogeneousDirectProduct| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|DirectProduct| (NRTEVAL (QREFELT % 6)) 7)
              (|local| |#1|) (|local| |#2|) '|Rep| (0 . |Zero|) (|Integer|)
              (4 . |qelt|) (10 . +) (|Boolean|) (16 . <) |HDP;<;2%B;1|
              (|NonNegativeInteger|) (|PositiveInteger|) (|List| 7)
              (|Equation| 7) (|List| 19)
              (|Record| (|:| |mat| 24) (|:| |vec| (|Vector| 10))) (|Matrix| %)
              (|Vector| %) (|Matrix| 10) (|Symbol|) (|List| 25) (|List| 16)
              (|Union| 29 '#1="failed") (|Fraction| 10) (|Union| 10 '#1#)
              (|Union| % '"failed") (|Mapping| 13 7 7) (|Mapping| 13 7)
              (|Void|) (|Mapping| 7 7) (|OutputForm|) (|InputForm|)
              (|SingleInteger|) (|HashState|) (|List| %) (|Matrix| 7)
              (|Record| (|:| |mat| 41) (|:| |vec| 45)) (|Union| 7 '#1#)
              (|String|) (|Vector| 7) (|List| 10))
           '#(~= 22 |zero?| 28 |unitVector| 33 |swap!| 38 |sup| 45
              |subtractIfCan| 51 |smaller?| 57 |size?| 63 |size| 69 |setelt!|
              73 |sample| 80 |rightRecip| 84 |rightPower| 89 |retractIfCan| 101
              |retract| 116 |reducedSystem| 131 |recip| 153 |random| 158
              |qsetelt!| 162 |qelt| 169 |plenaryPower| 175 |parts| 181
              |opposite?| 186 |one?| 192 |more?| 197 |minIndex| 203 |min| 208
              |members| 219 |member?| 224 |maxIndex| 230 |max| 235 |map!| 252
              |map| 258 |lookup| 264 |less?| 269 |leftRecip| 275 |leftPower|
              280 |latex| 292 |inf| 297 |indices| 303 |index?| 308 |index| 314
              |hashUpdate!| 319 |hash| 325 |first| 330 |fill!| 335 |every?| 341
              |eval| 347 |eq?| 373 |enumerate| 379 |entry?| 383 |entries| 389
              |empty?| 394 |empty| 399 |elt| 403 |dot| 416 |directProduct| 422
              |differentiate| 427 |count| 477 |copy| 489 |convert| 494
              |commutator| 499 |coerce| 505 |characteristic| 535 |associator|
              539 |any?| 546 |antiCommutator| 552 |annihilate?| 558 ^ 564
              |Zero| 576 |One| 580 D 584 >= 634 > 640 = 646 <= 652 < 658 - 664
              + 675 * 681 |#| 723)
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
                 (|PartialDifferentialRing| 25) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|NonAssociativeAlgebra| $$)
                 (|NonAssociativeAlgebra| 7) (|Rng|) (|SemiRng|) (|Module| $$)
                 (|Module| 7) (|FullyLinearlyExplicitOver| 7)
                 (|OrderedAbelianMonoidSup|) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|BiModule| 7 7) (|LinearlyExplicitOver| 7)
                 (|LinearlyExplicitOver| 10) (|AbelianProductCategory| 7)
                 (|OrderedCancellationAbelianMonoid|) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 7) (|RightModule| 7)
                 (|RightModule| 10) (|NonAssociativeRng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|IndexedAggregate| 10 7) (|OrderedSet|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Finite|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|HomogeneousAggregate| 7)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|)
                 (|FullyRetractableTo| 7) (|Aggregate|)
                 (|EltableAggregate| 10 7) (|Evalable| 7) (|CommutativeStar|)
                 (|Hashable|) (|SetCategory|) (|RetractableTo| 7)
                 (|RetractableTo| 29) (|RetractableTo| 10) (|Type|)
                 (|finiteAggregate|) (|CoercibleTo| (|Vector| 7))
                 (|Eltable| 10 7) (|InnerEvalable| 7 7) (|CoercibleTo| 36)
                 (|PartialOrder|) (|unitsKnown|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 37) (|BasicType|) (|CoercibleFrom| 7)
                 (|CoercibleFrom| 29) (|CoercibleFrom| 10))
              (|makeByteWordVec2| 58
                                  '(0 7 0 9 2 0 7 0 10 11 2 7 0 0 0 12 2 7 13 0
                                    0 14 2 58 13 0 0 1 1 55 13 0 1 1 31 0 17 1
                                    3 54 34 0 10 10 1 2 1 0 0 0 1 2 56 31 0 0 1
                                    2 23 13 0 0 1 2 0 13 0 16 1 0 12 16 1 3 54
                                    7 0 10 7 1 0 0 0 1 1 10 31 0 1 2 10 0 0 16
                                    1 2 38 0 0 17 1 1 48 28 0 1 1 45 30 0 1 1
                                    19 43 0 1 1 48 29 0 1 1 45 10 0 1 1 19 7 0
                                    1 2 27 21 22 23 1 1 27 24 22 1 1 9 41 22 1
                                    2 9 42 22 23 1 1 10 31 0 1 0 12 0 1 3 54 7
                                    0 10 7 1 2 0 7 0 10 11 2 6 0 0 17 1 1 51 18
                                    0 1 2 55 13 0 0 1 1 10 13 0 1 2 0 13 0 16 1
                                    1 22 10 0 1 1 52 7 0 1 2 3 0 0 0 1 1 51 18
                                    0 1 2 53 13 7 0 1 1 22 10 0 1 1 52 7 0 1 2
                                    51 7 32 0 1 2 3 0 0 0 1 2 54 0 35 0 1 2 0 0
                                    35 0 1 1 12 17 0 1 2 0 13 0 16 1 1 10 31 0
                                    1 2 10 0 0 16 1 2 38 0 0 17 1 1 19 44 0 1 2
                                    1 0 0 0 1 1 0 46 0 1 2 0 13 10 0 1 1 12 0
                                    17 1 2 12 39 39 0 1 1 12 38 0 1 1 22 7 0 1
                                    2 54 0 0 7 1 2 51 13 33 0 1 3 20 0 0 18 18
                                    1 2 20 0 0 19 1 3 20 0 0 7 7 1 2 20 0 0 20
                                    1 2 0 13 0 0 1 0 12 40 1 2 53 13 7 0 1 1 0
                                    18 0 1 1 0 13 0 1 0 0 0 1 3 0 7 0 10 7 1 2
                                    0 7 0 10 1 2 32 7 0 0 1 1 0 0 45 1 2 24 0 0
                                    16 1 1 24 0 0 1 3 25 0 0 25 16 1 3 25 0 0
                                    26 27 1 2 25 0 0 25 1 2 25 0 0 26 1 3 9 0 0
                                    35 16 1 2 9 0 0 35 1 2 53 16 7 0 1 2 51 16
                                    33 0 1 1 0 0 0 1 1 12 37 0 1 2 9 0 0 0 1 1
                                    48 0 29 1 1 47 0 10 1 1 44 36 0 1 1 6 0 0 1
                                    1 19 0 7 1 1 0 45 0 1 0 9 16 1 3 9 0 0 0 0
                                    1 2 51 13 33 0 1 2 8 0 0 0 1 2 9 13 0 0 1 2
                                    10 0 0 16 1 2 38 0 0 17 1 0 55 0 1 0 10 0 1
                                    2 24 0 0 16 1 1 24 0 0 1 3 25 0 0 25 16 1 3
                                    25 0 0 26 27 1 2 25 0 0 25 1 2 25 0 0 26 1
                                    3 9 0 0 35 16 1 2 9 0 0 35 1 2 3 13 0 0 1 2
                                    3 13 0 0 1 2 58 13 0 0 1 2 3 13 0 0 1 2 3
                                    13 0 0 15 1 57 0 0 1 2 57 0 0 0 1 2 43 0 0
                                    0 1 2 27 0 0 10 1 2 57 0 10 0 1 2 55 0 16 0
                                    1 2 43 0 17 0 1 2 38 0 0 0 1 2 38 0 0 7 1 2
                                    38 0 7 0 1 1 51 16 0 1)))))
           '|lookupComplete|)) 
