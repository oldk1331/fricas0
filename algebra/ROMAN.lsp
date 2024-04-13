
(SDEFUN |ROMAN;roman;I%;1| ((|n| (|Integer|)) (% (%)))
        (SPADCALL |n| (QREFELT % 6))) 

(SDEFUN |ROMAN;roman;S%;2| ((|sy| (|Symbol|)) (% (%)))
        (SPADCALL |sy| (QREFELT % 9))) 

(SDEFUN |ROMAN;convert;S%;3| ((|sy| (|Symbol|)) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |sy| (QREFELT % 12)) (QREFELT % 15))
                  (QREFELT % 6))) 

(SDEFUN |ROMAN;coerce;%Of;4| ((|r| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G31 NIL) (|n| (|Integer|)))
               (SEQ (LETT |n| (SPADCALL |r| (QREFELT % 16)))
                    (EXIT
                     (COND ((ZEROP |n|) (SPADCALL |n| (QREFELT % 18)))
                           ((MINUSP |n|)
                            (SPADCALL
                             (SPADCALL (SPADCALL |r| (QREFELT % 19))
                                       (QREFELT % 20))
                             (QREFELT % 21)))
                           ('T
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (PROG1 (LETT #1# |n|)
                                 (|check_subtype2| (> #1# 0)
                                                   '(|PositiveInteger|)
                                                   '(|Integer|) #1#))
                               (QREFELT % 22))
                              (QREFELT % 23))
                             (QREFELT % 24)))))))) 

(DECLAIM (NOTINLINE |RomanNumeral;|)) 

(DEFUN |RomanNumeral| ()
  (SPROG NIL
         (PROG (#1=#:G76)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|RomanNumeral|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|RomanNumeral|
                             (LIST (CONS NIL (CONS 1 (|RomanNumeral;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|RomanNumeral|)))))))))) 

(DEFUN |RomanNumeral;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|RomanNumeral|))
          (LETT % (GETREFV 47))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|RomanNumeral| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|RomanNumeral| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) (0 . |coerce|) |ROMAN;roman;I%;1|
              (|Symbol|) |ROMAN;convert;S%;3| |ROMAN;roman;S%;2| (|String|)
              (5 . |string|) (|PositiveInteger|) (|NumberFormats|)
              (10 . |ScanRoman|) (15 . |convert|) (|OutputForm|)
              (20 . |coerce|) (25 . -) |ROMAN;coerce;%Of;4| (30 . -)
              (35 . |FormatRoman|) (40 . |coerce|) (45 . |coerce|)
              (|Union| 26 '"failed") (|Fraction| 5) (|Boolean|)
              (|Union| % '"failed") (|Float|) (|DoubleFloat|) (|Pattern| 5)
              (|PatternMatchResult| 5 %) (|InputForm|) (|Union| 5 '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 37) (|:| |generator| %)) (|List| %)
              (|Union| 37 '"failed")
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 41 '"failed")
              (|Factored| %) (|SparseUnivariatePolynomial| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %)
                        (|:| |associate| %)))
           '#(~= 50 |zero?| 56 |unitNormal| 61 |unitCanonical| 66 |unit?| 71
              |symmetricRemainder| 76 |subtractIfCan| 82 |submod| 88
              |squareFreePart| 95 |squareFree| 100 |smaller?| 105 |sizeLess?|
              111 |sign| 117 |shift| 122 |sample| 128 |roman| 132 |rightRecip|
              142 |rightPower| 147 |retractIfCan| 159 |retract| 164 |rem| 169
              |recip| 175 |rationalIfCan| 180 |rational?| 185 |rational| 190
              |random| 195 |quo| 200 |principalIdeal| 206 |prime?| 211 |powmod|
              216 |positiveRemainder| 223 |positive?| 229 |plenaryPower| 234
              |permutation| 240 |patternMatch| 246 |opposite?| 253 |one?| 259
              |odd?| 264 |nextItem| 269 |negative?| 274 |multiEuclidean| 279
              |mulmod| 285 |min| 292 |max| 298 |mask| 304 |length| 309
              |leftRecip| 314 |leftPower| 319 |lcmCoef| 331 |lcm| 337 |latex|
              348 |invmod| 353 |init| 359 |inc| 363 |gcdPolynomial| 368 |gcd|
              374 |factorial| 385 |factor| 390 |extendedEuclidean| 395 |exquo|
              408 |expressIdealMember| 414 |even?| 420 |euclideanSize| 425
              |divide| 430 |differentiate| 436 |dec| 447 |copy| 452 |convert|
              457 |commutator| 487 |coerce| 493 |characteristic| 508 |bit?| 512
              |binomial| 518 |base| 524 |associator| 528 |associates?| 535
              |antiCommutator| 541 |annihilate?| 547 |addmod| 553 |abs| 560 ^
              565 |Zero| 577 |One| 581 D 585 >= 596 > 602 = 608 <= 614 < 620 -
              626 + 637 * 643)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DifferentialRing&| NIL |EntireRing&|
                |Algebra&| NIL |NonAssociativeAlgebra&| |Rng&| NIL |Module&|
                NIL NIL NIL |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL NIL |Magma&| |AbelianSemiGroup&| NIL |RetractableTo&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|UniqueFactorizationDomain|) (|PrincipalIdealDomain|)
                 (|OrderedIntegralDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|OrderedRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|DifferentialRing|) (|CharacteristicZero|) (|EntireRing|)
                 (|Algebra| $$) (|Ring|) (|NonAssociativeAlgebra| $$) (|Rng|)
                 (|SemiRing|) (|Module| $$) (|SemiRng|) (|OrderedAbelianGroup|)
                 (|BiModule| $$ $$) (|NonAssociativeRing|)
                 (|OrderedCancellationAbelianMonoid|) (|LeftModule| $$)
                 (|NonAssociativeRng|) (|RightModule| $$)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|StepThrough|)
                 (|PatternMatchable| 5) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|RealConstant|) (|RetractableTo| 5)
                 (|CommutativeStar|) (|SetCategory|) (|canonicalsClosed|)
                 (|Canonical|) (|multiplicativeValuation|)
                 (|canonicalUnitNormal|) (|ConvertibleTo| 29)
                 (|ConvertibleTo| 30) (|CombinatorialFunctionCategory|)
                 (|ConvertibleTo| 31) (|ConvertibleTo| 33) (|CoercibleFrom| 5)
                 (|ConvertibleTo| 5) (|PartialOrder|) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 17))
              (|makeByteWordVec2| 46
                                  '(1 0 0 5 6 1 8 11 0 12 1 14 13 11 15 1 0 5 0
                                    16 1 5 17 0 18 1 0 0 0 19 1 17 0 0 21 1 14
                                    11 13 22 1 8 0 11 23 1 8 17 0 24 2 0 27 0 0
                                    1 1 0 27 0 1 1 0 46 0 1 1 0 0 0 1 1 0 27 0
                                    1 2 0 0 0 0 1 2 0 28 0 0 1 3 0 0 0 0 0 1 1
                                    0 0 0 1 1 0 43 0 1 2 0 27 0 0 1 2 0 27 0 0
                                    1 1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 0 5 7 1
                                    0 0 8 10 1 0 28 0 1 2 0 0 0 35 1 2 0 0 0 13
                                    1 1 0 34 0 1 1 0 5 0 1 2 0 0 0 0 1 1 0 28 0
                                    1 1 0 25 0 1 1 0 27 0 1 1 0 26 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 1 0 36 37 1 1 0 27 0 1 3 0 0
                                    0 0 0 1 2 0 0 0 0 1 1 0 27 0 1 2 0 0 0 13 1
                                    2 0 0 0 0 1 3 0 32 0 31 32 1 2 0 27 0 0 1 1
                                    0 27 0 1 1 0 27 0 1 1 0 28 0 1 1 0 27 0 1 2
                                    0 38 37 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 28 0 1 2 0 0
                                    0 35 1 2 0 0 0 13 1 2 0 45 0 0 1 2 0 0 0 0
                                    1 1 0 0 37 1 1 0 11 0 1 2 0 0 0 0 1 0 0 0 1
                                    1 0 0 0 1 2 0 44 44 44 1 1 0 0 37 1 2 0 0 0
                                    0 1 1 0 0 0 1 1 0 43 0 1 2 0 40 0 0 1 3 0
                                    42 0 0 0 1 2 0 28 0 0 1 2 0 38 37 0 1 1 0
                                    27 0 1 1 0 35 0 1 2 0 39 0 0 1 1 0 0 0 1 2
                                    0 0 0 35 1 1 0 0 0 1 1 0 0 0 1 1 0 0 8 9 1
                                    0 29 0 1 1 0 30 0 1 1 0 31 0 1 1 0 33 0 1 1
                                    0 5 0 16 2 0 0 0 0 1 1 0 0 5 6 1 0 0 0 1 1
                                    0 17 0 20 0 0 35 1 2 0 27 0 0 1 2 0 0 0 0 1
                                    0 0 0 1 3 0 0 0 0 0 1 2 0 27 0 0 1 2 0 0 0
                                    0 1 2 0 27 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 35 1 2 0 0 0 13 1 0 0 0 1 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 35 1 2 0 27 0 0 1 2 0 27 0 0
                                    1 2 0 27 0 0 1 2 0 27 0 0 1 2 0 27 0 0 1 2
                                    0 0 0 0 1 1 0 0 0 19 2 0 0 0 0 1 2 0 0 35 0
                                    1 2 0 0 5 0 1 2 0 0 0 0 1 2 0 0 13 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|RomanNumeral| 'NILADIC T) 
