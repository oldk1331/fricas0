
(SDEFUN |PDO;adjoint;2%;1| ((|x| (%)) (% (%)))
        (SPROG
         ((#1=#:G13 NIL) (|v| (|Var|)) (|d| (|NonNegativeInteger|))
          (|sign| (%)) (|res| (%)) (|xu| (|Sup|)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT % 15)) |x|)
                ('T
                 (SEQ
                  (LETT |v|
                        (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 17)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                          (|Union| (QREFELT % 7) "failed")
                                          #1#)))
                  (LETT |xu| (SPADCALL |x| |v| (QREFELT % 20)))
                  (LETT |res| (|spadConstant| % 21))
                  (LETT |xu| (SPADCALL (ELT % 22) |xu| (QREFELT % 24)))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |xu| (|spadConstant| % 26) (QREFELT % 27)))
                         (GO G191)))
                       (SEQ (LETT |d| (SPADCALL |xu| (QREFELT % 29)))
                            (LETT |sign|
                                  (COND
                                   ((ODDP |d|)
                                    (SPADCALL (|spadConstant| % 30)
                                              (QREFELT % 32)))
                                   ('T (|spadConstant| % 30))))
                            (LETT |res|
                                  (SPADCALL |res|
                                            (SPADCALL
                                             (SPADCALL |sign|
                                                       (SPADCALL
                                                        (|spadConstant| % 30)
                                                        |v| |d| (QREFELT % 33))
                                                       (QREFELT % 34))
                                             (SPADCALL |xu| (QREFELT % 35))
                                             (QREFELT % 34))
                                            (QREFELT % 36)))
                            (EXIT (LETT |xu| (SPADCALL |xu| (QREFELT % 37)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |res|))))))) 

(DECLAIM (NOTINLINE |PartialDifferentialOperator;|)) 

(DEFUN |PartialDifferentialOperator;| (|#1| |#2|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (#1=#:G50 NIL) (#2=#:G49 NIL)
    (#3=#:G47 NIL) (#4=#:G48 NIL) (#5=#:G46 NIL) (#6=#:G45 NIL) (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT |dv$| (LIST '|PartialDifferentialOperator| DV$1 DV$2))
    (LETT % (GETREFV 64))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
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
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (|HasCategory| |#1|
                                                       '(|CommutativeRing|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|Comparable|)))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|ComparableRepresentation|)))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|LeftOreRing|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #2# (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory|
                                         (|IndexedExponents| |#2|)
                                         '(|Comparable|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
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
                                        (OR
                                         (AND #1#
                                              (|HasCategory|
                                               (|IndexedExponents| |#2|)
                                               '(|Comparable|)))
                                         (|HasCategory| |#1|
                                                        '(|ComparableRepresentation|)))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|LinearlyExplicitOver|
                                                               (|Integer|))))
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|LinearlyExplicitOver|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          #3#)
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|)))
                                         (AND #3# #2#) #4#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianGroup|))
                                        (LETT #5#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|)))
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #5#)
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianMonoid|))
                                        (LETT #6#
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
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #6# #5#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #6#)
                                        (OR #2#
                                            (|HasCategory|
                                             (|IndexedExponents| |#2|)
                                             '(|Comparable|)))))))
    (|haddProp| |$ConstructorCache| '|PartialDifferentialOperator|
                (LIST DV$1 DV$2) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (AND
     (OR (|HasCategory| |#1| '(|Algebra| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 4294967296))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 8589934592))
    (AND (|HasCategory| % '(|CommutativeRing|))
         (|augmentPredVector| % 17179869184))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (|HasCategory| |#1| '(|AbelianGroup|))
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 68719476736))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|CommutativeRing|)))
      (AND (|HasCategory| |#1| '(|AbelianGroup|))
           (|HasCategory| |#1| '(|Ring|)))
      #5#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianGroup|)))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR
      (AND #3# (|HasCategory| |#1| '(|Ring|))
           (|HasCategory| (|Integer|) '(|AbelianMonoid|)))
      #6#
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| % '(|AbelianMonoid|)))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| % 549755813888))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND (|HasCategory| |#1| '(|CommutativeRing|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 1099511627776))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|CommutativeRing|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (AND (|HasCategory| |#1| '(|IntegralDomain|))
           (|HasCategory| % '(|VariablesCommuteWithCoefficients|)))
      (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| % 2199023255552))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 13 (|SparseUnivariatePolynomial| %))
    %))) 

(DEFUN |PartialDifferentialOperator| (&REST #1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PartialDifferentialOperator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |PartialDifferentialOperator;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PartialDifferentialOperator|)))))))))) 

(MAKEPROP '|PartialDifferentialOperator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL
              (|SparseMultivariateSkewPolynomial| 6 7 (NRTEVAL (ELT % 10))
                                                  (NRTEVAL (ELT % 12)))
              (|local| |#1|) (|local| |#2|) (|Automorphism| 6)
              (|PartialDifferentialOperatorHelper| 6 7) (0 . |id_map|)
              (|Mapping| 6 6) (5 . |diff_map|) '|Sup| (|Boolean|)
              (10 . |ground?|) (|Union| 7 '"failed") (15 . |mainVariable|)
              (|SparseUnivariatePolynomial| %)
              (|SparseMultivariatePolynomial| 6 7) (20 . |univariate|)
              (26 . |0|) |PDO;adjoint;2%;1| (|Mapping| $$ $$) (30 . |map|)
              (36 . |0|) (40 . |0|) (44 . ~=) (|NonNegativeInteger|)
              (50 . |degree|) (55 . |1|) (59 . |1|) (63 . -) (68 . |monomial|)
              (75 . *) (81 . |leadingCoefficient|) (86 . +) (92 . |reductum|)
              (|String|) (|OutputForm|) (|PositiveInteger|)
              (|Record| (|:| |k| 43) (|:| |c| 6)) (|List| 41)
              (|IndexedExponents| 7) (|List| 43) (|List| %) (|List| 6)
              (|Union| 6 '#1="failed") (|Mapping| 43 43) (|List| 28) (|List| 7)
              (|Integer|) (|Record| (|:| |mat| 55) (|:| |vec| (|Vector| 51)))
              (|Matrix| %) (|Vector| %) (|Matrix| 51) (|Union| % '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Fraction| 51) (|Mapping| 6 43) (|Union| 58 '#1#)
              (|Union| 51 '#1#)
              (|Record| (|:| |mat| 63) (|:| |vec| (|Vector| 6))) (|Matrix| 6))
           '#(~= 97 |zero?| 103 |variables| 108 |unitNormal| 119
              |unitCanonical| 124 |unit?| 129 |totalDegreeSorted| 134
              |totalDegree| 140 |support| 151 |subtractIfCan| 156 |smaller?|
              162 |sample| 168 |rightRecip| 172 |rightPower| 177 |retractIfCan|
              189 |retract| 204 |reductum| 219 |reducedSystem| 224 |recip| 246
              |primitivePart| 251 |primitiveMonomials| 256 |pomopo!| 261
              |plenaryPower| 269 |opposite?| 275 |one?| 281 |numberOfMonomials|
              286 |monomials| 291 |monomial?| 296 |monomial| 301
              |minimumDegree| 321 |mapExponents| 326 |map| 332 |mainVariable|
              338 |listOfTerms| 343 |linearExtend| 348 |leftRecip| 354
              |leftPower| 359 |leadingTerm| 371 |leadingSupport| 376
              |leadingMonomial| 381 |leadingCoefficient| 386 |latex| 391
              |ground?| 396 |ground| 401 |fmecg| 406 |exquo| 414 |degree| 426
              |content| 443 |constructOrdered| 448 |construct| 453 |commutator|
              458 |coerce| 464 |coefficients| 489 |coefficient| 494
              |characteristic| 514 |binomThmExpt| 518 |associator| 525
              |associates?| 532 |antiCommutator| 538 |annihilate?| 544
              |adjoint| 550 ^ 555 D 567 = 572 |1| 578 |0| 582 / 586 - 592 + 603
              * 609)
           'NIL
           (CONS
            (|makeByteWordVec2| 31
                                '(0 0 0 0 12 4 1 13 15 13 1 0 11 5 1 0 0 11 24
                                  11 1 0 0 0 13 24 1 1 0 0 0 0 0 14 15 15 27 15
                                  30 9 0 0 31 10 0 0 0 7 6 0 0 11 8 7 6 4 3 2 0
                                  0 0))
            (CONS
             '#(NIL |MaybeSkewPolynomialCategory&| |FiniteAbelianMonoidRing&|
                |AbelianMonoidRing&| NIL |EntireRing&| |Algebra&| NIL NIL
                |Rng&| |NonAssociativeAlgebra&| |FreeModuleCategory&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL NIL NIL NIL NIL NIL
                |AbelianGroup&| NIL NIL NIL |MagmaWithUnit&| |AbelianMonoid&|
                NIL NIL |NonAssociativeSemiRng&| |SetWithZero&| NIL
                |AbelianSemiGroup&| |Magma&| |FullyRetractableTo&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL NIL NIL NIL NIL NIL NIL NIL |BasicType&|
                NIL)
             (CONS
              '#((|MultivariateSkewPolynomialCategory| 6 (|IndexedExponents| 7)
                                                       7)
                 (|MaybeSkewPolynomialCategory| 6 (|IndexedExponents| 7) 7)
                 (|FiniteAbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|AbelianMonoidRing| 6 (|IndexedExponents| 7))
                 (|SolvableSkewPolynomialCategory| 6 (|IndexedExponents| 7))
                 (|EntireRing|) (|Algebra| 58) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 58)
                 (|FreeModuleCategory| 6 (|IndexedExponents| 7))
                 (|FullyLinearlyExplicitOver| 6) (|Module| 6) (|Module| 58)
                 (|IndexedDirectProductCategory| 6 (|IndexedExponents| 7))
                 (|SemiRng|) (|NonAssociativeRing|) (|LinearlyExplicitOver| 51)
                 (|LinearlyExplicitOver| 6) (|BiModule| 58 58)
                 (|BiModule| $$ $$) (|BiModule| 6 6)
                 (|IndexedProductCategory| 6 (|IndexedExponents| 7))
                 (|NonAssociativeRng|) (|RightModule| 51) (|RightModule| 58)
                 (|LeftModule| 58) (|LeftModule| $$) (|RightModule| $$)
                 (|RightModule| 6) (|LeftModule| 6)
                 (|AbelianProductCategory| 6) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|MagmaWithUnit|) (|AbelianMonoid|) (|Comparable|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|SetWithZero|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|) (|Magma|)
                 (|FullyRetractableTo| 6) (|RetractableTo| 51)
                 (|RetractableTo| 58) (|SetCategory|) (|RetractableTo| 6)
                 (|unitsKnown|) (|canonicalUnitNormal|) (|CoercibleFrom| 51)
                 (|CoercibleFrom| 58) (|noZeroDivisors|)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 39) (|BasicType|) (|CoercibleFrom| 6))
              (|makeByteWordVec2| 63
                                  '(1 9 8 7 10 1 9 11 7 12 1 0 14 0 15 1 0 16 0
                                    17 2 19 18 0 7 20 0 0 0 21 2 13 0 23 0 24 0
                                    6 0 25 0 13 0 26 2 13 14 0 0 27 1 13 28 0
                                    29 0 0 0 30 0 6 0 31 1 0 0 0 32 3 0 0 0 7
                                    28 33 2 0 0 0 0 34 1 13 2 0 35 2 0 0 0 0 36
                                    1 13 0 0 37 2 0 14 0 0 1 1 39 14 0 1 2 0 50
                                    0 0 1 1 0 50 0 1 1 36 57 0 1 1 36 0 0 1 1
                                    36 14 0 1 2 0 28 0 50 1 1 0 28 0 1 2 0 28 0
                                    50 1 1 0 44 0 1 2 38 56 0 0 1 2 21 14 0 0 1
                                    0 39 0 1 1 40 56 0 1 2 0 0 0 40 1 2 40 0 0
                                    28 1 1 0 47 0 1 1 6 60 0 1 1 7 61 0 1 1 0 6
                                    0 1 1 6 58 0 1 1 7 51 0 1 1 32 0 0 1 2 23
                                    52 53 54 1 1 23 55 53 1 2 11 62 53 54 1 1
                                    11 63 53 1 1 40 56 0 1 1 20 0 0 1 1 15 45 0
                                    1 4 0 0 0 6 43 0 1 2 33 0 0 40 1 2 39 14 0
                                    0 1 1 40 14 0 1 1 0 28 0 1 1 0 45 0 1 1 0
                                    14 0 1 2 0 0 6 43 1 3 0 0 0 50 49 1 3 0 0 0
                                    7 28 33 1 0 43 0 1 2 0 0 48 0 1 2 0 0 11 0
                                    1 1 0 16 0 17 1 0 42 0 1 2 5 6 59 0 1 1 40
                                    56 0 1 2 0 0 0 40 1 2 40 0 0 28 1 1 16 41 0
                                    1 1 16 43 0 1 1 32 0 0 1 1 32 6 0 1 1 0 38
                                    0 1 1 0 14 0 15 1 0 6 0 1 4 11 0 0 43 6 0 1
                                    2 36 56 0 0 1 2 4 56 0 6 1 1 0 43 0 1 2 0
                                    28 0 7 1 2 0 49 0 50 1 1 20 6 0 1 1 16 0 42
                                    1 1 0 0 42 1 2 42 0 0 0 1 1 0 39 0 1 1 0 0
                                    6 1 1 34 0 0 1 1 41 0 51 1 1 19 0 58 1 1 0
                                    46 0 1 2 0 6 0 43 1 3 0 0 0 50 49 1 3 0 0 0
                                    7 28 1 0 42 28 1 3 35 0 0 0 28 1 3 42 0 0 0
                                    0 1 2 36 14 0 0 1 2 0 0 0 0 1 2 42 14 0 0 1
                                    1 0 0 0 22 2 0 0 0 40 1 2 40 0 0 28 1 1 0 0
                                    7 1 2 0 14 0 0 1 0 40 0 30 0 39 0 21 2 17 0
                                    0 6 1 2 37 0 0 0 1 1 37 0 0 32 2 0 0 0 0 36
                                    2 0 0 40 0 1 2 0 0 0 0 34 2 0 0 0 6 1 2 0 0
                                    6 0 1 2 23 0 0 51 1 2 37 0 51 0 1 2 39 0 28
                                    0 1 2 1 0 58 0 1 2 1 0 0 58 1)))))
           '|lookupComplete|)) 
