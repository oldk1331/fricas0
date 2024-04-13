
(SDEFUN |SYMPOLY;*;3%;1| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG
         ((#1=#:G20 NIL) (#2=#:G19 (%)) (#3=#:G21 (%)) (#4=#:G30 NIL)
          (|t2| NIL) (#5=#:G29 NIL) (#6=#:G28 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| % 9))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT % 12))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT % 13)))
                ((SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 16)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# (REVERSE |p1|)) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (CONS
                                                (SPADCALL (QCAR |t1|)
                                                          (QCAR |t2|)
                                                          (QREFELT % 17))
                                                (SPADCALL (QCDR |t1|)
                                                          (QCDR |t2|)
                                                          (QREFELT % 18)))
                                               #5#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 19))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| % 9))))))))) 

(SDEFUN |SYMPOLY;*;3%;2| ((|p1| (%)) (|p2| (%)) (% (%)))
        (SPROG
         ((#1=#:G32 NIL) (#2=#:G31 (%)) (#3=#:G33 (%)) (|r| (R)) (#4=#:G46 NIL)
          (|t2| NIL) (#5=#:G45 NIL) (#6=#:G44 NIL) (|t1| NIL))
         (SEQ
          (COND ((OR (NULL |p1|) (NULL |p2|)) (|spadConstant| % 9))
                ((SPADCALL (QCAR (|SPADfirst| |p1|)) (QREFELT % 12))
                 (SPADCALL (QCDR (|SPADfirst| |p1|)) |p2| (QREFELT % 13)))
                ((SPADCALL |p2| (|spadConstant| % 14) (QREFELT % 16)) |p1|)
                (#7='T
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |t1| NIL) (LETT #6# (REVERSE |p1|)) G190
                       (COND
                        ((OR (ATOM #6#) (PROGN (LETT |t1| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3#
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |t2| NIL) (LETT #4# |p2|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |t2| (CAR #4#)) NIL))
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
                                          (LETT #5#
                                                (CONS
                                                 (CONS
                                                  (SPADCALL (QCAR |t1|)
                                                            (QCAR |t2|)
                                                            (QREFELT % 17))
                                                  |r|)
                                                 #5#))))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #5#)))))
                          (COND
                           (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 19))))
                           ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                       (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#7# (|spadConstant| % 9))))))))) 

(DECLAIM (NOTINLINE |SymmetricPolynomial;|)) 

(DEFUN |SymmetricPolynomial| (#1=#:G70)
  (SPROG NIL
         (PROG (#2=#:G71)
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

(DEFUN |SymmetricPolynomial;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G67 NIL) (#2=#:G68 NIL) (#3=#:G69 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
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
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                        (OR #3#
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
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #3#
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
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #1#
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
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #1#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|SymmetricPolynomial| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 16777216))
    (AND
     (OR (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 33554432))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 67108864))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 134217728))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| % 268435456))
    (AND
     (OR (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 536870912))
    (AND
     (OR (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         #2#)
     (|augmentPredVector| % 1073741824))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 2147483648))
    (AND
     (OR (AND (|HasCategory| |#1| '(|AbelianGroup|)) #3#) #1#
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #3# (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 8589934592))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |k| (|Partition|)) (|:| |c| |#1|)))
    (QSETREFV % 8 (|List| (QREFELT % 7)))
    (COND
     ((|testBitVector| |pv$| 8)
      (QSETREFV % 20 (CONS (|dispatchFunction| |SYMPOLY;*;3%;1|) %)))
     ('T (QSETREFV % 20 (CONS (|dispatchFunction| |SYMPOLY;*;3%;2|) %))))
    %))) 

(MAKEPROP '|SymmetricPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|)
              '|Term| '|Rep| (0 . |Zero|) (|Boolean|) (|Partition|)
              (4 . |zero?|) (9 . *) (15 . |One|) (19 . |One|) (23 . =) (29 . +)
              (35 . *) (41 . +) (47 . *) (53 . |Zero|) (57 . ~=) (|HashState|)
              (|SingleInteger|) (|PositiveInteger|) (|Integer|)
              (|NonNegativeInteger|) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 26) (|Record| (|:| |k| 11) (|:| |c| 6)) (|List| 31)
              (|Mapping| 6 11) (|Union| 30 '#1="failed") (|Union| 26 '#1#)
              (|Mapping| 11 11) (|Union| 6 '#1#) (|List| 11) (|List| 6)
              (|List| %) (|Mapping| 6 6) (|String|) (|OutputForm|))
           '#(|Zero| 63 |One| 67 = 71 + 77 * 83) 'NIL
           (CONS
            (|makeByteWordVec2| 24
                                '(0 0 3 7 1 7 4 5 6 8 11 0 1 7 6 11 9 0 0 1 7 6
                                  0 0 0 1 10 0 0 0 0 0 1 1 11 2 24 9 9 0 0 23 9
                                  0 0 0 14 0 0 7 12 13 15 0 0 0 0 7 10 8 12 13
                                  16))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL NIL
                |Algebra&| |Algebra&| NIL NIL |Algebra&| |EntireRing&| NIL
                |FreeModuleCategory&| |NonAssociativeAlgebra&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Rng&| NIL
                NIL NIL |Module&| |Module&| |Module&| NIL NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |FullyRetractableTo&| |Magma&| |AbelianSemiGroup&| NIL
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |RetractableTo&| |Hashable&| NIL NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL NIL)
             (CONS
              '#((|FiniteAbelianMonoidRing| 6 11) (|AbelianMonoidRing| 6 11)
                 (|IntegralDomain|) (|CommutativeRing|) (|Algebra| 30)
                 (|Algebra| $$) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6) (|EntireRing|) (|Ring|)
                 (|FreeModuleCategory| 6 11) (|NonAssociativeAlgebra| 30)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 6)
                 (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|IndexedDirectProductCategory| 6 11) (|Module| 30)
                 (|Module| $$) (|Module| 6) (|IndexedProductCategory| 6 11)
                 (|BiModule| 6 6) (|BiModule| $$ $$) (|BiModule| 30 30)
                 (|NonAssociativeRing|) (|AbelianProductCategory| 6)
                 (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 30) (|RightModule| 30)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|NonAssociativeSemiRng|) (|SemiGroup|)
                 (|AbelianMonoid|) (|MagmaWithUnit|) (|FullyRetractableTo| 6)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|)
                 (|RetractableTo| 6) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 30) (|RetractableTo| 26) (|Hashable|)
                 (|VariablesCommuteWithCoefficients|) (|CoercibleFrom| 6)
                 (|BasicType|) (|CoercibleTo| 43) (|TwoSidedRecip|)
                 (|unitsKnown|) (|noZeroDivisors|) (|CoercibleFrom| 30)
                 (|CoercibleFrom| 26) (|canonicalUnitNormal|))
              (|makeByteWordVec2| 32
                                  '(0 0 0 9 1 11 10 0 12 2 0 0 6 0 13 0 0 0 14
                                    0 6 0 15 2 0 10 0 0 16 2 11 0 0 0 17 2 6 0
                                    0 0 18 2 0 0 0 0 19 2 0 0 0 0 20 0 6 0 21 2
                                    6 10 0 0 22 0 32 0 9 0 30 0 14 2 0 10 0 0
                                    16 2 0 0 0 0 19 2 0 0 6 0 13 2 0 0 0 0
                                    20)))))
           '|lookupIncomplete|)) 
