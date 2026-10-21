
(SDEFUN |MCMPLX;coerce;C%;1| ((|u| (|Complex| (|Float|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 8)) (QREFELT % 10))
                  (SPADCALL (SPADCALL |u| (QREFELT % 11)) (QREFELT % 10))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;2| ((|u| (|Complex| (|Integer|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 16)) (QREFELT % 17))
                  (SPADCALL (SPADCALL |u| (QREFELT % 18)) (QREFELT % 17))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;3| ((|u| (|Complex| (|MachineInteger|))) (% (%)))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 22)) (QREFELT % 23))
                  (SPADCALL (SPADCALL |u| (QREFELT % 24)) (QREFELT % 23))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;C%;4| ((|u| (|Complex| (|MachineFloat|))) (% (%)))
        (SPADCALL (SPADCALL |u| (QREFELT % 26)) (SPADCALL |u| (QREFELT % 27))
                  (QREFELT % 12))) 

(SDEFUN |MCMPLX;coerce;%C;5| ((|u| (%)) (% (|Complex| (|Float|))))
        (SPADCALL (SPADCALL (SPADCALL |u| (QREFELT % 29)) (QREFELT % 30))
                  (SPADCALL (SPADCALL |u| (QREFELT % 31)) (QREFELT % 30))
                  (QREFELT % 32))) 

(DECLAIM (NOTINLINE |MachineComplex;|)) 

(DEFUN |MachineComplex;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G53 NIL) (#2=#:G52 NIL) (#3=#:G51 NIL)
    (#4=#:G50 NIL) (#5=#:G49 NIL) (|pv$| NIL))
   (PROGN
    (LETT |dv$| '(|MachineComplex|))
    (LETT % (GETREFV 90))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|FiniteFieldCategory|))
                                        (LETT #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|Field|)))
                                        (OR #1#
                                            (|HasCategory| (|MachineFloat|)
                                                           '(|FiniteFieldCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|CharacteristicZero|))
                                          #1#)
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|CharacteristicZero|))
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|FiniteFieldCategory|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Finite|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Hashable|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (LETT #2#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|TranscendentalFunctionCategory|)))
                                        (AND
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RadicalCategory|))
                                         #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|RealConstant|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #3#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|IntegerNumberSystem|)))
                                        (OR #1#
                                            (|HasCategory| (|MachineFloat|)
                                                           '(|FiniteFieldCategory|))
                                            #3#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|DifferentialRing|))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|InnerEvalable|
                                                         (|Symbol|)
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Evalable|
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|Eltable|
                                                         (|MachineFloat|)
                                                         (|MachineFloat|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (OR #1# #3#)
                                        (OR
                                         (AND #1#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|OrderedRing|))
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|RadicalCategory|)))
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|RadicalCategory|))
                                          #2#))
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|EuclideanDomain|))
                                        (LETT #4#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         #1#
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|FiniteFieldCategory|))
                                         #3#)
                                        (OR
                                         (AND
                                          (|HasCategory| (|MachineFloat|)
                                                         '(|EuclideanDomain|))
                                          #4#)
                                         #1# #3#)
                                        (LETT #5#
                                              (|HasCategory| (|MachineFloat|)
                                                             '(|RealNumberSystem|)))
                                        (AND #5# #2#)
                                        (|HasCategory| (|MachineFloat|)
                                                       '(|IntegralDomain|))))))
    (|haddProp| |$ConstructorCache| '|MachineComplex| NIL (CONS 1 %))
    (|stuffDomainSlots| %)
    (AND (|HasCategory| % '(|SetWithZero|))
         (|augmentPredVector| % 68719476736))
    (AND
     (OR (AND (|HasCategory| % '(|CharacteristicZero|)) #1#)
         (AND (|HasCategory| % '(|CharacteristicZero|))
              (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| % 137438953472))
    (AND
     (OR (AND (|HasCategory| % '(|CharacteristicZero|)) #1#)
         (AND (|HasCategory| % '(|CharacteristicZero|))
              (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|)))
         (|HasCategory| (|MachineFloat|)
                        '(|RetractableTo| (|Fraction| (|Integer|)))))
     (|augmentPredVector| % 274877906944))
    (AND
     (OR
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #4#)
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| % 549755813888))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MachineComplex| ()
  (SPROG NIL
         (PROG (#1=#:G55)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineComplex|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineComplex|
                             (LIST (CONS NIL (CONS 1 (|MachineComplex;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineComplex|)))))))))) 

(MAKEPROP '|MachineComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Complex| 9) (|Float|) (|Complex| 6)
              (0 . |real|) (|MachineFloat|) (5 . |coerce|) (10 . |imag|)
              (15 . |complex|) |MCMPLX;coerce;C%;1| (|Integer|) (|Complex| 14)
              (21 . |real|) (26 . |coerce|) (31 . |imag|) |MCMPLX;coerce;C%;2|
              (|MachineInteger|) (|Complex| 20) (36 . |real|) (41 . |coerce|)
              (46 . |imag|) |MCMPLX;coerce;C%;3| (51 . |real|) (56 . |imag|)
              |MCMPLX;coerce;C%;4| (61 . |real|) (66 . |coerce|) (71 . |imag|)
              (76 . |complex|) |MCMPLX;coerce;%C;5| (|Boolean|) (|String|)
              (|OutputForm|) (|PositiveInteger|) (|Union| % '"failed")
              (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 14 '#1="failed") (|Mapping| 9 9)
              (|SparseUnivariatePolynomial| 9)
              (|Record| (|:| |mat| 47) (|:| |vec| 49)) (|Matrix| %)
              (|Vector| %) (|Matrix| 9) (|Union| 9 '#1#) (|Vector| 9)
              (|Fraction| 14) (|Record| (|:| |r| 9) (|:| |phi| 9))
              (|Union| 46 '#2="failed")
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %) (|Factored| %)
              (|Factored| 55) (|Union| 59 '#2#) (|List| 55)
              (|Union| 54 '"failed")
              (|Record| (|:| |coef| 54) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 63 '"failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|InputForm|) (|Pattern| 6) (|Pattern| 14) (|Equation| 9)
              (|List| 69) (|List| 9) (|Fraction| 43) (|OnePointCompletion| 37)
              (|Union| 39 '"failed")
              (|Record| (|:| |factor| 14) (|:| |exponent| 39)) (|List| 75)
              (|Table| 37 39)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|SingleInteger|) (|HashState|) (|Symbol|) (|List| 81)
              (|Union| 50 '"failed")
              (|Record| (|:| |mat| 85) (|:| |vec| (|Vector| 14))) (|Matrix| 14)
              (|List| 39) (|PatternMatchResult| 6 %)
              (|PatternMatchResult| 14 %) (|Complex| (|DoubleFloat|)))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sign| 195 |sech|
              200 |sec| 205 |sample| 210 |rightRecip| 214 |rightPower| 219
              |retractIfCan| 231 |retract| 246 |represents| 261
              |representationType| 272 |rem| 276 |regularRepresentation| 282
              |reducedSystem| 293 |reduce| 315 |recip| 325 |real| 330
              |rationalIfCan| 335 |rational?| 340 |rational| 345 |rank| 350
              |random| 354 |quo| 358 |principalIdeal| 364 |primitiveElement|
              369 |primitive?| 373 |primeFrobenius| 378 |prime?| 389
              |positive?| 394 |polarCoordinates| 399 |plenaryPower| 404 |pi|
              410 |patternMatch| 414 |order| 428 |opposite?| 438 |one?| 444
              |nthRoot| 449 |norm| 455 |nextItem| 460 |negative?| 465
              |multiEuclidean| 470 |minimalPolynomial| 476 |min| 481 |max| 487
              |map| 493 |lookup| 499 |log| 504 |lift| 509 |leftRecip| 514
              |leftPower| 519 |lcmCoef| 531 |lcm| 537 |latex| 548 |inv| 553
              |init| 558 |index| 562 |imaginary| 567 |imag| 571 |hashUpdate!|
              576 |hash| 582 |generator| 587 |gcdPolynomial| 591 |gcd| 597
              |factorsOfCyclicGroupSize| 608 |factorSquareFreePolynomial| 612
              |factorPolynomial| 617 |factor| 622 |extendedEuclidean| 627
              |exquo| 640 |expressIdealMember| 652 |exp| 658 |eval| 663
              |euclideanSize| 703 |enumerate| 708 |elt| 712 |divide| 718
              |discriminant| 724 |discreteLog| 733 |differentiate| 744
              |derivationCoordinates| 794 |definingPolynomial| 800 |csch| 804
              |csc| 809 |createPrimitiveElement| 814 |coth| 818 |cot| 823
              |cosh| 828 |cos| 833 |coordinates| 838 |convert| 860 |conjugate|
              905 |conditionP| 910 |complex| 915 |commutator| 921 |coerce| 927
              |charthRoot| 977 |characteristicPolynomial| 987 |characteristic|
              992 |basis| 996 |atanh| 1000 |atan| 1005 |associator| 1010
              |associates?| 1017 |asinh| 1023 |asin| 1028 |asech| 1033 |asec|
              1038 |argument| 1043 |antiCommutator| 1048 |annihilate?| 1054
              |acsch| 1060 |acsc| 1065 |acoth| 1070 |acot| 1075 |acosh| 1080
              |acos| 1085 |abs| 1090 ^ 1095 D 1125 >= 1175 > 1181 = 1187 <=
              1193 < 1199 |1| 1205 |0| 1209 / 1213 - 1219 + 1230 * 1236)
           'NIL
           (CONS
            (|makeByteWordVec2| 33
                                '(0 0 2 2 4 17 31 17 32 32 0 0 0 33 3 0 0 0 19
                                  18 5 0 0 0 0 5 0 0 0 0 5 0 0 0 0 10 5 0 0 0 0
                                  0 10 5 5 0 0 0 0 0 0 7 0 0 0 0 0 0 0 0 0 0 24
                                  23 2 0 0 0 0 0 0 21 11 9 8 0 0 0 0 0 26 25 22
                                  21 20 16 15 14 14 13 11 11 11 11 11 12 9 6 3
                                  3 1 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |FramedAlgebra&|
                NIL NIL |DivisionRing&| |FiniteRankAlgebra&|
                |DifferentialExtension&| NIL |DifferentialRing&|
                |PartialDifferentialRing&| |Algebra&| |Algebra&| |EntireRing&|
                |Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Module&| NIL
                |Module&| |Module&| |FullyLinearlyExplicitOver&| NIL NIL
                |NonAssociativeRing&| NIL NIL |FramedModule&| NIL NIL NIL NIL
                NIL |NonAssociativeRng&| NIL NIL NIL |AbelianGroup&| |Finite&|
                NIL NIL NIL |OrderedSet&| |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL NIL NIL NIL
                NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| NIL
                |FullyRetractableTo&| |FullyEvalableOver&| |Evalable&|
                |TranscendentalFunctionCategory&| |RetractableTo&| |Hashable&|
                |SetCategory&| NIL |RetractableTo&| |RetractableTo&| NIL NIL
                NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&| NIL NIL NIL
                NIL NIL NIL |BasicType&| NIL NIL NIL |PartialOrder&| NIL NIL
                NIL NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 43)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|)
                 (|FortranMachineTypeCategory|) (|FramedAlgebra| 9 43)
                 (|IntegralDomain|) (|LeftOreRing|) (|DivisionRing|)
                 (|FiniteRankAlgebra| 9 43) (|DifferentialExtension| 9)
                 (|CommutativeRing|) (|DifferentialRing|)
                 (|PartialDifferentialRing| 81) (|Algebra| 50) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 9) (|Ring|)
                 (|NonAssociativeAlgebra| 50) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 9)
                 (|Module| 50) (|SemiRng|) (|Module| $$) (|Module| 9)
                 (|FullyLinearlyExplicitOver| 9) (|LinearlyExplicitOver| 14)
                 (|BiModule| 50 50) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 9 9) (|FramedModule| 9) (|LinearlyExplicitOver| 9)
                 (|RightModule| 14) (|RightModule| 50) (|LeftModule| 50)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 9) (|RightModule| 9) (|AbelianGroup|) (|Finite|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|Comparable|) (|FullyPatternMatchable| 9)
                 (|PatternMatchable| 14) (|PatternMatchable| 6) (|StepThrough|)
                 (|AbelianSemiGroup|) (|SetWithZero|) (|Magma|)
                 (|ComparableRepresentation|) (|FullyRetractableTo| 9)
                 (|FullyEvalableOver| 9) (|Evalable| 9)
                 (|TranscendentalFunctionCategory|) (|RetractableTo| 50)
                 (|Hashable|) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 14) (|RetractableTo| 9) (|Patternable| 9)
                 (|ConvertibleTo| 68) (|ConvertibleTo| 67) (|Eltable| 9 $$)
                 (|InnerEvalable| 9 9) (|InnerEvalable| 81 9)
                 (|multiplicativeValuation|) (|ConvertibleTo| 66)
                 (|ConvertibleTo| 89) (|ConvertibleTo| 7)
                 (|arbitraryPrecision|) (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|CoercibleFrom| 50) (|CharacteristicNonZero|)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|CharacteristicZero|) (|CoercibleTo| 36) (|BasicType|)
                 (|unitsKnown|) (|TwoSidedRecip|) (|noZeroDivisors|)
                 (|PartialOrder|) (|CoercibleFrom| 14) (|ConvertibleTo| 43)
                 (|CoercibleFrom| 9) (|Type|))
              (|makeByteWordVec2| 89
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 34 0 0 1 1 0 34 0 1 1 0
                                    40 0 1 1 0 0 0 1 1 0 34 0 1 0 0 47 1 1 0 47
                                    46 1 1 0 9 0 1 1 11 0 0 1 1 11 0 0 1 1 2 77
                                    14 1 2 0 38 0 0 1 1 31 57 55 1 1 33 0 0 1 1
                                    33 56 0 1 1 28 0 0 1 2 31 58 59 55 1 2 0 34
                                    0 0 1 2 27 34 0 0 1 0 7 39 1 1 11 0 0 1 1
                                    11 0 0 1 1 37 14 0 1 1 11 0 0 1 1 11 0 0 1
                                    0 0 0 1 1 0 38 0 1 2 0 0 0 37 1 2 0 0 0 39
                                    1 1 0 41 0 1 1 0 48 0 1 1 9 83 0 1 1 0 14 0
                                    1 1 0 9 0 1 1 9 50 0 1 1 0 0 49 1 2 0 0 49
                                    46 1 0 2 78 1 2 27 0 0 0 1 1 0 47 0 1 2 0
                                    47 0 46 1 2 0 44 45 46 1 1 0 47 45 1 2 10
                                    84 45 46 1 1 10 85 45 1 1 0 0 43 1 1 3 38
                                    72 1 1 0 38 0 1 1 0 9 0 29 1 16 83 0 1 1 16
                                    34 0 1 1 16 50 0 1 0 0 37 1 0 7 0 1 2 27 0
                                    0 0 1 1 27 61 54 1 0 2 0 1 1 2 34 0 1 1 2 0
                                    0 1 2 2 0 0 39 1 1 33 34 0 1 1 37 34 0 1 1
                                    35 51 0 1 2 0 0 0 37 1 0 11 0 1 3 23 87 0
                                    67 87 1 3 24 88 0 68 88 1 1 2 73 0 1 1 2 37
                                    0 1 2 0 34 0 0 1 1 0 34 0 1 2 12 0 0 14 1 1
                                    0 9 0 1 1 2 38 0 1 1 37 34 0 1 2 27 60 54 0
                                    1 1 3 43 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    42 0 1 1 7 37 0 1 1 11 0 0 1 1 0 43 0 1 1 0
                                    38 0 1 2 0 0 0 37 1 2 0 0 0 39 1 2 33 53 0
                                    0 1 2 33 0 0 0 1 1 33 0 54 1 1 0 35 0 1 1 3
                                    0 0 1 0 2 0 1 1 7 0 37 1 0 0 0 1 1 0 9 0 31
                                    2 8 80 80 0 1 1 8 79 0 1 0 0 0 1 2 33 55 55
                                    55 1 1 33 0 54 1 2 33 0 0 0 1 0 2 76 1 1 31
                                    57 55 1 1 31 57 55 1 1 33 56 0 1 3 27 64 0
                                    0 0 1 2 27 65 0 0 1 2 0 38 0 0 1 2 36 38 0
                                    9 1 2 27 60 54 0 1 1 11 0 0 1 2 21 0 0 69 1
                                    2 21 0 0 70 1 3 21 0 0 71 71 1 3 21 0 0 9 9
                                    1 3 20 0 0 81 9 1 3 20 0 0 82 71 1 1 27 39
                                    0 1 0 7 54 1 2 22 0 0 9 1 2 27 62 0 0 1 0 0
                                    9 1 1 0 9 46 1 2 2 74 0 0 1 1 2 39 0 1 2 0
                                    0 0 42 1 3 0 0 0 42 39 1 2 19 0 0 39 1 1 19
                                    0 0 1 3 18 0 0 82 86 1 2 18 0 0 82 1 3 18 0
                                    0 81 39 1 2 18 0 0 81 1 2 3 47 46 42 1 0 0
                                    43 1 1 11 0 0 1 1 11 0 0 1 0 2 0 1 1 11 0 0
                                    1 1 11 0 0 1 1 11 0 0 1 1 11 0 0 1 1 0 47
                                    46 1 1 0 49 0 1 2 0 49 0 46 1 2 0 47 46 46
                                    1 1 0 0 43 1 1 0 43 0 1 1 0 0 49 1 1 0 49 0
                                    1 1 15 66 0 1 1 25 67 0 1 1 26 68 0 1 1 14
                                    89 0 1 1 14 7 0 1 1 0 0 0 1 1 40 52 45 1 2
                                    0 0 9 9 12 2 0 0 0 0 1 1 0 36 0 1 1 0 0 14
                                    1 1 0 0 0 1 1 0 0 9 1 1 0 0 15 19 1 0 0 7
                                    13 1 0 0 21 25 1 0 0 5 28 1 0 7 0 33 1 39 0
                                    50 1 1 40 38 0 1 1 2 0 0 1 1 0 43 0 1 0 0
                                    39 1 0 0 46 1 1 11 0 0 1 1 11 0 0 1 3 0 0 0
                                    0 0 1 2 0 34 0 0 1 1 11 0 0 1 1 11 0 0 1 1
                                    11 0 0 1 1 11 0 0 1 1 11 9 0 1 2 0 0 0 0 1
                                    2 0 34 0 0 1 1 11 0 0 1 1 11 0 0 1 1 11 0 0
                                    1 1 11 0 0 1 1 11 0 0 1 1 11 0 0 1 1 34 9 0
                                    1 2 0 0 0 37 1 2 0 0 0 39 1 2 12 0 0 50 1 2
                                    3 0 0 14 1 2 11 0 0 0 1 3 0 0 0 42 39 1 2 0
                                    0 0 42 1 2 19 0 0 39 1 1 19 0 0 1 3 18 0 0
                                    81 39 1 3 18 0 0 82 86 1 2 18 0 0 81 1 2 18
                                    0 0 82 1 2 0 34 0 0 1 2 0 34 0 0 1 2 0 34 0
                                    0 1 2 0 34 0 0 1 2 0 34 0 0 1 0 0 0 1 0 0 0
                                    1 2 3 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 37 0 1 2 0 0 0 0 1 2 0 0 14 0 1 2
                                    0 0 39 0 1 2 0 0 9 0 1 2 0 0 0 9 1 2 38 0 0
                                    50 1 2 38 0 50 0 1 2 10 0 0 14 1)))))
           '|lookupComplete|)) 
