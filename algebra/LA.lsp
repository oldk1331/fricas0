
(SDEFUN |LA;1;%;1| ((% (%)))
        (SPADCALL (|spadConstant| % 8) (|spadConstant| % 9) (QREFELT % 10))) 

(SDEFUN |LA;*;3%;2| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 12)) (SPADCALL |y| (QREFELT % 12))
                   (QREFELT % 13))
         (SPADCALL (SPADCALL |x| (QREFELT % 14)) (SPADCALL |y| (QREFELT % 14))
                   (QREFELT % 15))
         (QREFELT % 10))) 

(SDEFUN |LA;characteristic;Nni;3| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 18))) 

(SDEFUN |LA;<;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND
         ((|BooleanEquality|
           (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 14)) (QREFELT % 20))
                     (|spadConstant| % 22) (QREFELT % 24))
           (SPADCALL (SPADCALL (SPADCALL |y| (QREFELT % 14)) (QREFELT % 20))
                     (|spadConstant| % 22) (QREFELT % 24)))
          (SPADCALL
           (SPADCALL (SPADCALL |y| (QREFELT % 14))
                     (SPADCALL |x| (QREFELT % 12)) (QREFELT % 25))
           (SPADCALL (SPADCALL |x| (QREFELT % 14))
                     (SPADCALL |y| (QREFELT % 12)) (QREFELT % 25))
           (QREFELT % 26)))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |y| (QREFELT % 14))
                     (SPADCALL |x| (QREFELT % 12)) (QREFELT % 25))
           (SPADCALL (SPADCALL |x| (QREFELT % 14))
                     (SPADCALL |y| (QREFELT % 12)) (QREFELT % 25))
           (QREFELT % 24))))) 

(DECLAIM (NOTINLINE |LocalAlgebra;|)) 

(DEFUN |LocalAlgebra;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|LocalAlgebra| DV$1 DV$2))
          (LETT % (GETREFV 33))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|OrderedRing|))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|OrderedRing|))
                                               (|HasCategory| |#2|
                                                              '(|CharacteristicZero|)))))))
          (|haddProp| |$ConstructorCache| '|LocalAlgebra| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (AND (|HasCategory| |#1| '(|OrderedRing|))
               (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 4))
          (AND (|HasCategory| |#1| '(|OrderedRing|))
               (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 8))
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 27 (CONS (|dispatchFunction| |LA;<;2%B;4|) %))))
          %))) 

(DEFUN |LocalAlgebra| (&REST #1=#:G9)
  (SPROG NIL
         (PROG (#2=#:G10)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LocalAlgebra|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LocalAlgebra;|) #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|LocalAlgebra|)))))))))) 

(MAKEPROP '|LocalAlgebra| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Localize| 6 7) (|local| |#1|)
              (|local| |#2|) (0 . |1|) (4 . |1|) (8 . /)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |LA;1;%;1|) %))
              (14 . |numer|) (19 . *) (25 . |denom|) (30 . *) |LA;*;3%;2|
              (|NonNegativeInteger|) (36 . |characteristic|)
              |LA;characteristic;Nni;3| (40 . |coerce|) (45 . |0|) (49 . |0|)
              (|Boolean|) (53 . >) (59 . *) (65 . <) (71 . <) (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Integer|)
              (|Union| % '"failed"))
           '#(|numer| 77 |denom| 82 |characteristic| 87 < 91 |1| 97 |0| 101 /
              105 * 111)
           'NIL
           (CONS
            (|makeByteWordVec2| 2
                                '(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0 0 0
                                  1 1 0 0 0 0 1 0 0 0 0 2 1 0 0 0))
            (CONS
             '#(NIL |Algebra&| NIL NIL |NonAssociativeAlgebra&| |Rng&| NIL
                |Module&| NIL |NonAssociativeRing&| NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |OrderedAbelianSemiGroup&|
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| |SetCategory&|
                NIL |PartialOrder&| NIL |BasicType&| NIL)
             (CONS
              '#((|OrderedRing|) (|Algebra| 7) (|Ring|) (|SemiRing|)
                 (|NonAssociativeAlgebra| 7) (|Rng|) (|SemiRng|) (|Module| 7)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 7 7)
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| 7) (|RightModule| 7) (|OrderedMagmaWithZero|)
                 (|OrderedAbelianSemiGroup|) (|AbelianGroup|) (|OrderedSet|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|MagmaWithZero|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|SetCategory|)
                 (|CharacteristicZero|) (|PartialOrder|) (|CoercibleTo| 29)
                 (|BasicType|) (|unitsKnown|))
              (|makeByteWordVec2| 27
                                  '(0 6 0 8 0 7 0 9 2 0 0 6 7 10 1 0 6 0 12 2 6
                                    0 0 0 13 1 0 7 0 14 2 7 0 0 0 15 0 6 17 18
                                    1 6 0 7 20 0 0 0 21 0 6 0 22 2 6 23 0 0 24
                                    2 6 0 7 0 25 2 6 23 0 0 26 2 0 23 0 0 27 1
                                    0 6 0 12 1 0 7 0 14 0 0 17 19 2 1 23 0 0 27
                                    0 0 0 11 0 0 0 21 2 0 0 6 7 10 2 0 0 0 0
                                    16)))))
           '|lookupIncomplete|)) 
