
(SDEFUN |SYMPOLY;*;3%;1| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG
         ((|t1| NIL) (#1=#:G17 NIL) (#2=#:G18 NIL) (|t2| NIL) (#3=#:G19 NIL)
          (#4=#:G10 (%)) (#5=#:G8 (%)) (#6=#:G9 NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| % 9))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT % 12))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT % 13)))
                ((SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 16)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #1# (REVERSE |p1|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t1| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #3# |p2|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |t2| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT % 17))
                                                (SPADCALL (QCDR |t1|)
                                                          (QCDR |t2|)
                                                          (QREFELT % 18)))
                                               #2#))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (COND
                           (#6# (LETT #5# (SPADCALL #5# #4# (QREFELT % 19))))
                           ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#6# #5#) (#7# (|spadConstant| % 9))))))))) 

(SDEFUN |SYMPOLY;*;3%;2| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG
         ((|t1| NIL) (#1=#:G29 NIL) (#2=#:G30 NIL) (|t2| NIL) (#3=#:G31 NIL)
          (|r| (R)) (#4=#:G22 (%)) (#5=#:G20 (%)) (#6=#:G21 NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| % 9))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT % 12))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT % 13)))
                ((SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 16)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #1# (REVERSE |p1|)) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |t1| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #4#
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #3# |p2|) G190
                                      (COND
                                       ((OR (ATOM #3#)
                                            (PROGN (LETT |t2| (CAR #3#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (COND
                                         ((SPADCALL
                                           (LETT |r|
                                                 (SPADCALL (QCDR |t1|)
                                                           (QCDR |t2|)
                                                           (QREFELT % 18)))
                                           (|spadConstant| % 21)
                                           (QREFELT % 22))
                                          (LETT #2#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |t1|)
                                                            (QCAR |t2|)
                                                            (QREFELT % 17))
                                                  |r|)
                                                 #2#))))))
                                      (LETT #3# (CDR #3#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))
                          (COND
                           (#6# (LETT #5# (SPADCALL #5# #4# (QREFELT % 19))))
                           ('T (PROGN (LETT #5# #4#) (LETT #6# 'T)))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (COND (#6# #5#) (#7# (|spadConstant| % 9))))))))) 

(DECLAIM (NOTINLINE |SymmetricPolynomial;|)) 

(DEFUN |SymmetricPolynomial;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G53 NIL) (#2=#:G52 NIL) (#3=#:G51 NIL)
    (#4=#:G50 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|SymmetricPolynomial| DV$1))
    (LETT % (GETREFV 44))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|CharacteristicZero|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|)))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#)
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (AND (|HasCategory| |#1| '(|Hashable|))
                                             (|HasCategory| (|Partition|)
                                                            '(|Hashable|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| (|Partition|)
                                                       '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (|HasCategory| |#1| '(|GcdDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|AbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #3#)
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #3# #4#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #4#)))))
    (|haddProp| |$ConstructorCache| '|SymmetricPolynomial| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 33554432))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 67108864))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| % 2147483648))
    (AND
     (OR #3# (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (AND (|HasCategory| |#1| '(|AbelianGroup|)) #1#) #4#
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 8589934592))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #1# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 17179869184))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |k| (|Partition|)) (|:| |c| |#1|)))
    (QSETREFV % 8 (|List| (QREFELT % 7)))
    (COND
     ((|testBitVector| |pv$| 8)
      (QSETREFV % 20 (CONS (|dispatchFunction| |SYMPOLY;*;3%;1|) %)))
     ('T (QSETREFV % 20 (CONS (|dispatchFunction| |SYMPOLY;*;3%;2|) %))))
    %))) 

(DEFUN |SymmetricPolynomial| (#1=#:G54)
  (SPROG NIL
         (PROG (#2=#:G55)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SymmetricPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SymmetricPolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|SymmetricPolynomial|)))))))))) 

(MAKEPROP '|SymmetricPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|)
              '|Term| '|Rep| (0 . |0|) (|Boolean|) (|Partition|) (4 . |zero?|)
              (9 . *) (15 . |1|) (19 . |1|) (23 . =) (29 . +) (35 . *) (41 . +)
              (47 . *) (53 . |0|) (57 . ~=) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Record| (|:| |k| 11) (|:| |c| 6))
              (|List| 26) (|Mapping| 6 6) (|List| %) (|List| 6) (|List| 11)
              (|NonNegativeInteger|) (|Union| 6 '#1="failed") (|Mapping| 11 11)
              (|SingleInteger|) (|HashState|) (|Integer|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 37) (|Mapping| 6 11) (|Union| 40 '#1#)
              (|Union| 37 '#1#))
           '#(= 63 |1| 69 |0| 73 + 77 * 83) 'NIL
           (CONS
            (|makeByteWordVec2| 25
                                '(0 0 4 7 8 6 7 1 11 9 11 6 7 1 0 6 7 1 0 0 10
                                  1 0 0 0 11 1 1 0 0 0 0 0 2 9 9 25 14 9 24 0 0
                                  14 22 0 0 0 15 13 12 7 0 0 16 13 12 8 10 5 7
                                  3 0 0 0 0))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL NIL
                |EntireRing&| |Algebra&| |Algebra&| |Algebra&| NIL NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |FreeModuleCategory&| |Module&|
                |Module&| |Module&| NIL NIL |NonAssociativeRing&| NIL NIL NIL
                NIL |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |AbelianMonoid&| NIL |NonAssociativeSemiRng&| NIL
                |SetWithZero&| |AbelianSemiGroup&| |Magma&|
                |FullyRetractableTo&| |Hashable&| |RetractableTo&|
                |RetractableTo&| NIL |SetCategory&| |RetractableTo&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 11) (|AbelianMonoidRing| 6 11)
                 (|IntegralDomain|) (|CommutativeRing|) (|EntireRing|)
                 (|Algebra| 6) (|Algebra| $$) (|Algebra| 40) (|Ring|)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 40)
                 (|FreeModuleCategory| 6 11) (|Module| 6) (|Module| $$)
                 (|Module| 40) (|IndexedDirectProductCategory| 6 11)
                 (|SemiRng|) (|NonAssociativeRing|) (|BiModule| 40 40)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 11) (|NonAssociativeRng|)
                 (|RightModule| 40) (|LeftModule| 40) (|LeftModule| $$)
                 (|RightModule| $$) (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|Comparable|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|)
                 (|ComparableRepresentation|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|Magma|) (|FullyRetractableTo| 6)
                 (|Hashable|) (|RetractableTo| 37) (|RetractableTo| 40)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalUnitNormal|) (|CoercibleFrom| 37)
                 (|CoercibleFrom| 40) (|noZeroDivisors|) (|unitsKnown|)
                 (|CharacteristicNonZero|) (|TwoSidedRecip|)
                 (|CharacteristicZero|) (|CoercibleTo| 23) (|BasicType|)
                 (|CoercibleFrom| 6) (|VariablesCommuteWithCoefficients|))
              (|makeByteWordVec2| 33
                                  '(0 0 0 9 1 11 10 0 12 2 0 0 6 0 13 0 0 0 14
                                    0 6 0 15 2 0 10 0 0 16 2 11 0 0 0 17 2 6 0
                                    0 0 18 2 0 0 0 0 19 2 0 0 0 0 20 0 6 0 21 2
                                    6 10 0 0 22 2 0 10 0 0 16 0 31 0 14 0 33 0
                                    9 2 0 0 0 0 19 2 0 0 0 0 20 2 0 0 6 0
                                    13)))))
           '|lookupIncomplete|)) 
