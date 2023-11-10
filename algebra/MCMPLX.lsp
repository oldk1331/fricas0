
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

(DEFUN |MachineComplex| ()
  (SPROG NIL
         (PROG (#1=#:G503)
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

(DEFUN |MachineComplex;| ()
  (SPROG
   ((|dv$| NIL) (% NIL) (#1=#:G501 NIL) (#2=#:G500 NIL) (#3=#:G499 NIL)
    (#4=#:G498 NIL) (#5=#:G497 NIL) (|pv$| NIL))
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
                                         (|HasCategory| (|MachineFloat|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #1#)
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
    (AND
     (OR
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #4#)
      (|HasCategory| (|MachineFloat|) '(|CharacteristicNonZero|)))
     (|augmentPredVector| % 34359738368))
    (AND
     (OR
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|EuclideanDomain|)) #4#)
      (AND (|HasCategory| % '(|CharacteristicNonZero|))
           (|HasCategory| (|MachineFloat|) '(|FiniteFieldCategory|))))
     (|augmentPredVector| % 68719476736))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(MAKEPROP '|MachineComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Complex| 9) (|Float|) (|Complex| 6)
              (0 . |real|) (|MachineFloat|) (5 . |coerce|) (10 . |imag|)
              (15 . |complex|) |MCMPLX;coerce;C%;1| (|Integer|) (|Complex| 14)
              (21 . |real|) (26 . |coerce|) (31 . |imag|) |MCMPLX;coerce;C%;2|
              (|MachineInteger|) (|Complex| 20) (36 . |real|) (41 . |coerce|)
              (46 . |imag|) |MCMPLX;coerce;C%;3| (51 . |real|) (56 . |imag|)
              |MCMPLX;coerce;C%;4| (61 . |real|) (66 . |coerce|) (71 . |imag|)
              (76 . |complex|) |MCMPLX;coerce;%C;5| (|Fraction| 14)
              (|Record| (|:| |r| 9) (|:| |phi| 9)) (|Boolean|) (|Factored| %)
              (|SparseUnivariatePolynomial| %) (|List| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Union| 42 '#1="failed") (|List| 38) (|Factored| 38)
              (|Union| 63 '#1#) (|Matrix| %) (|Union| % '"failed")
              (|Union| 39 '#2="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 49 '#2#)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 39) (|:| |generator| %)) (|InputForm|)
              (|Pattern| 6) (|Pattern| 14) (|List| 9) (|List| 59)
              (|Equation| 9) (|SparseUnivariatePolynomial| 9) (|Fraction| 60)
              (|Matrix| 9) (|Vector| %) (|Mapping| 9 9) (|PositiveInteger|)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|Record| (|:| |factor| 14) (|:| |exponent| 52)) (|List| 67)
              (|Table| 65 52) (|OnePointCompletion| 65) (|Union| 52 '"failed")
              (|SingleInteger|) (|HashState|) (|Symbol|) (|List| 74)
              (|Union| 34 '"failed") (|Matrix| 14)
              (|Record| (|:| |mat| 77) (|:| |vec| (|Vector| 14))) (|List| 52)
              (|PatternMatchResult| 6 %) (|PatternMatchResult| 14 %)
              (|Complex| (|DoubleFloat|)) (|Vector| 9) (|Union| 9 '#3="failed")
              (|Record| (|:| |mat| 62) (|:| |vec| 83)) (|Union| 14 '#3#)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|OutputForm|) (|String|))
           '#(~= 82 |zero?| 88 |unitNormal| 93 |unitCanonical| 98 |unit?| 103
              |traceMatrix| 108 |trace| 117 |tanh| 122 |tan| 127
              |tableForDiscreteLogarithm| 132 |subtractIfCan| 137
              |squareFreePolynomial| 143 |squareFreePart| 148 |squareFree| 153
              |sqrt| 158 |solveLinearPolynomialEquation| 163 |smaller?| 169
              |sizeLess?| 175 |size| 181 |sinh| 185 |sin| 190 |sech| 195 |sec|
              200 |sample| 205 |rightRecip| 209 |rightPower| 214 |retractIfCan|
              226 |retract| 241 |represents| 256 |representationType| 267 |rem|
              271 |regularRepresentation| 277 |reducedSystem| 288 |reduce| 310
              |recip| 320 |real| 325 |rationalIfCan| 330 |rational?| 335
              |rational| 340 |rank| 345 |random| 349 |quo| 353 |principalIdeal|
              359 |primitiveElement| 364 |primitive?| 368 |primeFrobenius| 373
              |prime?| 384 |polarCoordinates| 389 |plenaryPower| 394 |pi| 400
              |patternMatch| 404 |order| 418 |opposite?| 428 |one?| 434
              |nthRoot| 439 |norm| 445 |nextItem| 450 |multiEuclidean| 455
              |minimalPolynomial| 461 |min| 466 |max| 472 |map| 478 |lookup|
              484 |log| 489 |lift| 494 |leftRecip| 499 |leftPower| 504
              |lcmCoef| 516 |lcm| 522 |latex| 533 |inv| 538 |init| 543 |index|
              547 |imaginary| 552 |imag| 556 |hashUpdate!| 561 |hash| 567
              |generator| 572 |gcdPolynomial| 576 |gcd| 582
              |factorsOfCyclicGroupSize| 593 |factorSquareFreePolynomial| 597
              |factorPolynomial| 602 |factor| 607 |extendedEuclidean| 612
              |exquo| 625 |expressIdealMember| 637 |exp| 643 |eval| 648
              |euclideanSize| 688 |enumerate| 693 |elt| 697 |divide| 703
              |discriminant| 709 |discreteLog| 718 |differentiate| 729
              |derivationCoordinates| 779 |definingPolynomial| 785 |csch| 789
              |csc| 794 |createPrimitiveElement| 799 |coth| 803 |cot| 808
              |cosh| 813 |cos| 818 |coordinates| 823 |convert| 845 |conjugate|
              890 |conditionP| 895 |complex| 900 |commutator| 906 |coerce| 912
              |charthRoot| 962 |characteristicPolynomial| 972 |characteristic|
              977 |basis| 981 |atanh| 985 |atan| 990 |associator| 995
              |associates?| 1002 |asinh| 1008 |asin| 1013 |asech| 1018 |asec|
              1023 |argument| 1028 |antiCommutator| 1033 |annihilate?| 1039
              |acsch| 1045 |acsc| 1050 |acoth| 1055 |acot| 1060 |acosh| 1065
              |acos| 1070 |abs| 1075 ^ 1080 |Zero| 1110 |One| 1114 D 1118 >=
              1168 > 1174 = 1180 <= 1186 < 1192 / 1198 - 1204 + 1215 * 1221)
           'NIL
           (CONS
            (|makeByteWordVec2| 32
                                '(0 0 2 2 4 30 16 31 16 0 31 0 0 0 0 0 3 32 0 0
                                  0 1 3 5 17 18 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0 0
                                  3 9 0 0 0 0 0 3 3 9 0 0 0 0 0 0 0 0 0 0 6 0 0
                                  0 0 0 2 22 23 0 0 0 0 0 7 8 10 20 0 0 0 0 0 0
                                  0 0 0 0 3 3 8 11 10 10 10 10 10 12 13 13 14
                                  15 19 20 21 24 25))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |FramedAlgebra&| NIL |DifferentialExtension&|
                |FiniteRankAlgebra&| |DivisionRing&| NIL |Algebra&|
                |EntireRing&| |Algebra&| NIL |Algebra&| NIL
                |PartialDifferentialRing&| |DifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| |Rng&| NIL
                |NonAssociativeAlgebra&| |FullyLinearlyExplicitOver&| |Module&|
                |Module&| NIL |Module&| NIL |FramedModule&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&|
                NIL |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |FullyEvalableOver&| |FullyRetractableTo&| NIL
                |Magma&| |AbelianSemiGroup&| NIL NIL NIL NIL |RetractableTo&|
                |RetractableTo&| NIL |SetCategory&| |Hashable&|
                |RetractableTo&| |TranscendentalFunctionCategory&| |Evalable&|
                NIL NIL NIL NIL |PartialOrder&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL
                NIL)
             (CONS
              '#((|ComplexCategory| 9) (|MonogenicAlgebra| 9 60)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|FortranMachineTypeCategory|)
                 (|GcdDomain|) (|IntegralDomain|) (|FramedAlgebra| 9 60)
                 (|CommutativeRing|) (|DifferentialExtension| 9)
                 (|FiniteRankAlgebra| 9 60) (|DivisionRing|) (|LeftOreRing|)
                 (|Algebra| 9) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicZero|) (|Algebra| 34)
                 (|CharacteristicNonZero|) (|PartialDifferentialRing| 74)
                 (|DifferentialRing|) (|Ring|) (|NonAssociativeAlgebra| 9)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRing|)
                 (|NonAssociativeAlgebra| 34) (|FullyLinearlyExplicitOver| 9)
                 (|Module| 9) (|Module| $$) (|SemiRng|) (|Module| 34)
                 (|LinearlyExplicitOver| 9) (|FramedModule| 9) (|BiModule| 9 9)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 34 34)
                 (|LinearlyExplicitOver| 14) (|RightModule| 9) (|LeftModule| 9)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| 34) (|RightModule| 34) (|RightModule| 14)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|FullyPatternMatchable| 9)
                 (|OrderedSet|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|FullyEvalableOver| 9) (|FullyRetractableTo| 9)
                 (|Comparable|) (|Magma|) (|AbelianSemiGroup|) (|StepThrough|)
                 (|PatternMatchable| 6) (|PatternMatchable| 14)
                 (|Patternable| 9) (|RetractableTo| 9) (|RetractableTo| 14)
                 (|CommutativeStar|) (|SetCategory|) (|Hashable|)
                 (|RetractableTo| 34) (|TranscendentalFunctionCategory|)
                 (|Evalable| 9) (|Type|) (|CoercibleFrom| 9)
                 (|ConvertibleTo| 60) (|CoercibleFrom| 14) (|PartialOrder|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 88) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 34) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 7) (|ConvertibleTo| 82) (|ConvertibleTo| 54)
                 (|multiplicativeValuation|) (|InnerEvalable| 74 9)
                 (|InnerEvalable| 9 9) (|Eltable| 9 $$) (|ConvertibleTo| 55)
                 (|ConvertibleTo| 56))
              (|makeByteWordVec2| 89
                                  '(1 7 6 0 8 1 9 0 6 10 1 7 6 0 11 2 0 0 9 9
                                    12 1 15 14 0 16 1 9 0 14 17 1 15 14 0 18 1
                                    21 20 0 22 1 9 0 20 23 1 21 20 0 24 1 5 9 0
                                    26 1 5 9 0 27 1 0 9 0 29 1 9 6 0 30 1 0 9 0
                                    31 2 7 0 6 6 32 2 0 36 0 0 1 1 0 36 0 1 1 0
                                    87 0 1 1 0 0 0 1 1 0 36 0 1 1 0 62 63 1 0 0
                                    62 1 1 0 9 0 1 1 10 0 0 1 1 10 0 0 1 1 2 69
                                    14 1 2 0 46 0 0 1 1 30 43 38 1 1 32 0 0 1 1
                                    32 37 0 1 1 11 0 0 1 2 30 41 42 38 1 2 0 36
                                    0 0 1 2 26 36 0 0 1 0 6 52 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 1 10 0 0 1 0 0 0 1 1 0
                                    46 0 1 2 0 0 0 52 1 2 0 0 0 65 1 1 8 76 0 1
                                    1 0 84 0 1 1 0 86 0 1 1 8 34 0 1 1 0 9 0 1
                                    1 0 14 0 1 2 0 0 83 63 1 1 0 0 83 1 0 2 66
                                    1 2 26 0 0 0 1 2 0 62 0 63 1 1 0 62 0 1 1 9
                                    77 45 1 2 9 78 45 63 1 2 0 85 45 63 1 1 0
                                    62 45 1 1 3 46 61 1 1 0 0 60 1 1 0 46 0 1 1
                                    0 9 0 29 1 15 76 0 1 1 15 36 0 1 1 15 34 0
                                    1 0 0 65 1 0 6 0 1 2 26 0 0 0 1 1 26 53 39
                                    1 0 2 0 1 1 2 36 0 1 1 2 0 0 1 2 2 0 0 52 1
                                    1 32 36 0 1 1 34 35 0 1 2 0 0 0 65 1 0 10 0
                                    1 3 22 80 0 55 80 1 3 23 81 0 56 81 1 1 2
                                    65 0 1 1 2 70 0 1 2 0 36 0 0 1 1 0 36 0 1 2
                                    11 0 0 14 1 1 0 9 0 1 1 2 46 0 1 2 26 47 39
                                    0 1 1 3 60 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0
                                    0 64 0 1 1 6 65 0 1 1 10 0 0 1 1 0 60 0 1 1
                                    0 46 0 1 2 0 0 0 52 1 2 0 0 0 65 1 2 32 40
                                    0 0 1 2 32 0 0 0 1 1 32 0 39 1 1 0 89 0 1 1
                                    3 0 0 1 0 2 0 1 1 6 0 65 1 0 0 0 1 1 0 9 0
                                    31 2 7 73 73 0 1 1 7 72 0 1 0 0 0 1 2 32 38
                                    38 38 1 2 32 0 0 0 1 1 32 0 39 1 0 2 68 1 1
                                    30 43 38 1 1 30 43 38 1 1 32 37 0 1 2 26 48
                                    0 0 1 3 26 50 0 0 0 1 2 35 46 0 9 1 2 0 46
                                    0 0 1 2 26 47 39 0 1 1 10 0 0 1 3 20 0 0 57
                                    57 1 3 20 0 0 9 9 1 2 20 0 0 58 1 2 20 0 0
                                    59 1 3 19 0 0 74 9 1 3 19 0 0 75 57 1 1 26
                                    52 0 1 0 6 39 1 2 21 0 0 9 1 2 26 51 0 0 1
                                    1 0 9 63 1 0 0 9 1 1 2 52 0 1 2 2 71 0 0 1
                                    1 18 0 0 1 2 18 0 0 52 1 2 17 0 0 74 1 3 17
                                    0 0 74 52 1 2 17 0 0 75 1 3 17 0 0 75 79 1
                                    2 0 0 0 64 1 3 0 0 0 64 52 1 2 3 62 63 64 1
                                    0 0 60 1 1 10 0 0 1 1 10 0 0 1 0 2 0 1 1 10
                                    0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 2 0
                                    83 0 63 1 2 0 62 63 63 1 1 0 62 63 1 1 0 83
                                    0 1 1 14 54 0 1 1 24 55 0 1 1 25 56 0 1 1
                                    13 7 0 1 1 13 82 0 1 1 0 0 83 1 1 0 83 0 1
                                    1 0 60 0 1 1 0 0 60 1 1 0 0 0 1 1 37 44 45
                                    1 2 0 0 9 9 12 2 0 0 0 0 1 1 27 0 34 1 1 0
                                    7 0 33 1 0 0 5 28 1 0 0 21 25 1 0 0 15 19 1
                                    0 0 7 13 1 0 0 9 1 1 0 0 14 1 1 0 0 0 1 1 0
                                    88 0 1 1 36 46 0 1 1 2 0 0 1 1 0 60 0 1 0 0
                                    52 1 0 0 63 1 1 10 0 0 1 1 10 0 0 1 3 0 0 0
                                    0 0 1 2 0 36 0 0 1 1 10 0 0 1 1 10 0 0 1 1
                                    10 0 0 1 1 10 0 0 1 1 10 9 0 1 2 0 0 0 0 1
                                    2 0 36 0 0 1 1 10 0 0 1 1 10 0 0 1 1 10 0 0
                                    1 1 10 0 0 1 1 10 0 0 1 1 10 0 0 1 1 33 0 0
                                    1 2 11 0 0 34 1 2 3 0 0 14 1 2 10 0 0 0 1 2
                                    0 0 0 52 1 2 0 0 0 65 1 0 0 0 1 0 0 0 1 1
                                    18 0 0 1 2 18 0 0 52 1 2 17 0 0 74 1 3 17 0
                                    0 74 52 1 2 17 0 0 75 1 3 17 0 0 75 79 1 2
                                    0 0 0 64 1 3 0 0 0 64 52 1 2 0 36 0 0 1 2 0
                                    36 0 0 1 2 0 36 0 0 1 2 0 36 0 0 1 2 0 36 0
                                    0 1 2 3 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 3 0 0 34 1 2 3 0 34 0 1 2 9 0 0 14
                                    1 2 0 0 9 0 1 2 0 0 0 9 1 2 0 0 52 0 1 2 0
                                    0 14 0 1 2 0 0 0 0 1 2 0 0 65 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineComplex| 'NILADIC T) 
