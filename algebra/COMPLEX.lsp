
(SDEFUN |COMPLEX;writeOMComplex|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (% (|Void|)))
        (SEQ (SPADCALL |dev| (QREFELT % 10))
             (SPADCALL |dev| "complex1" "complex_cartesian" (QREFELT % 12))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT % 13)) (QREFELT % 14))
             (SPADCALL |dev| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 14))
             (EXIT (SPADCALL |dev| (QREFELT % 16))))) 

(SDEFUN |COMPLEX;OMwrite;Omd%BV;2|
        ((|dev| (|OpenMathDevice|)) (|x| (%)) (|wholeObj| (|Boolean|))
         (% (|Void|)))
        (SEQ (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 17))))
             (|COMPLEX;writeOMComplex| |dev| |x| %)
             (EXIT (COND (|wholeObj| (SPADCALL |dev| (QREFELT % 18))))))) 

(SDEFUN |COMPLEX;Zero;%;3| ((% (%)))
        (CONS (|spadConstant| % 22) (|spadConstant| % 22))) 

(SDEFUN |COMPLEX;One;%;4| ((% (%)))
        (CONS (|spadConstant| % 24) (|spadConstant| % 22))) 

(SDEFUN |COMPLEX;zero?;%B;5| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (QREFELT % 25))
          (SPADCALL (QCDR |x|) (QREFELT % 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;one?;%B;6| ((|x| (%)) (% (|Boolean|)))
        (COND
         ((SPADCALL (QCAR |x|) (|spadConstant| % 24) (QREFELT % 27))
          (SPADCALL (QCDR |x|) (QREFELT % 25)))
         ('T NIL))) 

(SDEFUN |COMPLEX;coerce;R%;7| ((|r| (R)) (% (%)))
        (CONS |r| (|spadConstant| % 22))) 

(PUT '|COMPLEX;complex;2R%;8| '|SPADreplace| 'CONS) 

(SDEFUN |COMPLEX;complex;2R%;8| ((|r| (R)) (|i| (R)) (% (%))) (CONS |r| |i|)) 

(PUT '|COMPLEX;real;%R;9| '|SPADreplace| 'QCAR) 

(SDEFUN |COMPLEX;real;%R;9| ((|x| (%)) (% (R))) (QCAR |x|)) 

(PUT '|COMPLEX;imag;%R;10| '|SPADreplace| 'QCDR) 

(SDEFUN |COMPLEX;imag;%R;10| ((|x| (%)) (% (R))) (QCDR |x|)) 

(SDEFUN |COMPLEX;+;3%;11| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (|add_DF| (QCAR |x|) (QCAR |y|))
              (|add_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;-;3%;12| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (|sub_DF| (QCAR |x|) (QCAR |y|))
              (|sub_DF| (QCDR |x|) (QCDR |y|)))) 

(SDEFUN |COMPLEX;*;3%;13| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS
         (|sub_DF| (|mul_DF| (QCAR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |x|) (QCDR |y|)))
         (|add_DF| (|mul_DF| (QCDR |x|) (QCAR |y|))
                   (|mul_DF| (QCDR |y|) (QCAR |x|))))) 

(SDEFUN |COMPLEX;+;3%;14| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 34))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 34)))) 

(SDEFUN |COMPLEX;-;3%;15| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 35))
              (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 35)))) 

(SDEFUN |COMPLEX;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS
         (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 36))
                   (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT % 36))
                   (QREFELT % 35))
         (SPADCALL (SPADCALL (QCDR |x|) (QCAR |y|) (QREFELT % 36))
                   (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT % 36))
                   (QREFELT % 34)))) 

(SDEFUN |COMPLEX;exquo;2%U;17| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (COND
         ((SPADCALL (QCDR |y|) (QREFELT % 25))
          (SPADCALL |x| (QCAR |y|) (QREFELT % 38)))
         ('T
          (SPADCALL (SPADCALL |x| (SPADCALL |y| (QREFELT % 39)) (QREFELT % 33))
                    (SPADCALL |y| (QREFELT % 40)) (QREFELT % 38))))) 

(DECLAIM (NOTINLINE |Complex;|)) 

(DEFUN |Complex| (#1=#:G2808)
  (SPROG NIL
         (PROG (#2=#:G2809)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Complex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Complex;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Complex|)))))))))) 

(DEFUN |Complex;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G2804 NIL) (#2=#:G2805 NIL) (#3=#:G2806 NIL)
    (#4=#:G2807 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|Complex| DV$1))
    (LETT % (GETREFV 97))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|FiniteFieldCategory|))
                                        (LETT #4#
                                              (|HasCategory| |#1| '(|Field|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|FiniteFieldCategory|)))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1| '(|Finite|))
                                        (|HasCategory| |#1| '(|Hashable|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|IntegralDomain|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RadicalCategory|))
                                         #3#)
                                        (|HasCategory| |#1|
                                                       '(|arbitraryPrecision|))
                                        (|HasCategory| |#1| '(|RealConstant|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|)))
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|FiniteFieldCategory|))
                                            #2#)
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (|HasCategory| |#1|
                                                       '(|DifferentialRing|))
                                        (|HasCategory| |#1|
                                                       (LIST '|InnerEvalable|
                                                             '(|Symbol|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Evalable|
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       (LIST '|Eltable|
                                                             (|devaluate| |#1|)
                                                             (|devaluate|
                                                              |#1|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| |#1|
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| |#1| '(|OpenMath|))
                                        (|HasCategory| |#1|
                                                       '(|RealNumberSystem|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RealNumberSystem|))
                                         #3#)
                                        (|HasCategory| |#1|
                                                       '(|EuclideanDomain|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         #4# #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|FiniteFieldCategory|))
                                         #2#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         #4# #2#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         #4#)
                                        (OR #4# #2#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|EuclideanDomain|))
                                          #1#)
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|)))))))
    (|haddProp| |$ConstructorCache| '|Complex| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|EuclideanDomain|)) #1#
           (|HasCategory| % '(|CharacteristicNonZero|)))
      (AND (|HasCategory| |#1| '(|FiniteFieldCategory|))
           (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 2199023255552))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|))
         (AND (|HasCategory| |#1| '(|EuclideanDomain|)) #1#
              (|HasCategory| % '(|CharacteristicNonZero|))))
     (|augmentPredVector| % 4398046511104))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|Record| (|:| |real| |#1|) (|:| |imag| |#1|)))
    (COND
     ((|testBitVector| |pv$| 29)
      (PROGN
       (QSETREFV % 20
                 (CONS (|dispatchFunction| |COMPLEX;OMwrite;Omd%BV;2|) %)))))
    (COND
     ((|domainEqual| |#1| (|DoubleFloat|))
      (PROGN
       (QSETREFV % 31 (CONS (|dispatchFunction| |COMPLEX;+;3%;11|) %))
       (QSETREFV % 32 (CONS (|dispatchFunction| |COMPLEX;-;3%;12|) %))
       (QSETREFV % 33 (CONS (|dispatchFunction| |COMPLEX;*;3%;13|) %))))
     ('T
      (PROGN
       (QSETREFV % 31 (CONS (|dispatchFunction| |COMPLEX;+;3%;14|) %))
       (QSETREFV % 32 (CONS (|dispatchFunction| |COMPLEX;-;3%;15|) %))
       (QSETREFV % 33 (CONS (|dispatchFunction| |COMPLEX;*;3%;16|) %)))))
    (COND
     ((|testBitVector| |pv$| 11)
      (QSETREFV % 41 (CONS (|dispatchFunction| |COMPLEX;exquo;2%U;17|) %))))
    %))) 

(MAKEPROP '|Complex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|Void|)
              (|OpenMathDevice|) (0 . |OMputApp|) (|String|)
              (5 . |OMputSymbol|) |COMPLEX;real;%R;9| (12 . |OMwrite|)
              |COMPLEX;imag;%R;10| (18 . |OMputEndApp|) (23 . |OMputObject|)
              (28 . |OMputEndObject|) (|Boolean|) (33 . |OMwrite|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;Zero;%;3|) %))
              (40 . |Zero|)
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |COMPLEX;One;%;4|) %))
              (44 . |One|) (48 . |zero?|) |COMPLEX;zero?;%B;5| (53 . =)
              |COMPLEX;one?;%B;6| |COMPLEX;coerce;R%;7| |COMPLEX;complex;2R%;8|
              (59 . +) (65 . -) (71 . *) (77 . +) (83 . -) (89 . *)
              (|Union| % '#1="failed") (95 . |exquo|) (101 . |conjugate|)
              (106 . |norm|) (111 . |exquo|) (|Fraction| 43) (|Integer|)
              (|Record| (|:| |r| 6) (|:| |phi| 6)) (|Union| 70 '#2="failed")
              (|Matrix| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|List| %) (|SparseUnivariatePolynomial| %) (|Factored| %)
              (|Factored| 49) (|Union| 53 '#2#) (|List| 49)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |coef| 48) (|:| |generator| %))
              (|Union| 48 '"failed") (|NonNegativeInteger|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 60 '"failed")
              (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 43) (|List| 66)
              (|Equation| 6) (|List| 6) (|Fraction| 72) (|Matrix| 6)
              (|Vector| %) (|Mapping| 6 6) (|SparseUnivariatePolynomial| 6)
              (|PositiveInteger|) (|Union| 57 '"failed")
              (|OnePointCompletion| 73) (|Table| 73 57)
              (|Record| (|:| |factor| 43) (|:| |exponent| 57)) (|List| 77)
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              (|HashState|) (|SingleInteger|) (|Symbol|) (|List| 82)
              (|Union| 42 '#1#)
              (|Record| (|:| |mat| 86) (|:| |vec| (|Vector| 43))) (|Matrix| 43)
              (|List| 57) (|PatternMatchResult| (|Float|) %)
              (|PatternMatchResult| 43 %) (|Complex| (|Float|))
              (|Complex| (|DoubleFloat|)) (|Union| 43 '#3="failed")
              (|Record| (|:| |mat| 69) (|:| |vec| 95)) (|Union| 6 '#3#)
              (|Vector| 6) (|OutputForm|))
           '#(~= 117 |zero?| 123 |unitNormal| 128 |unitCanonical| 133 |unit?|
              138 |traceMatrix| 143 |trace| 152 |tanh| 157 |tan| 162
              |tableForDiscreteLogarithm| 167 |subtractIfCan| 172
              |squareFreePolynomial| 178 |squareFreePart| 183 |squareFree| 188
              |sqrt| 193 |solveLinearPolynomialEquation| 198 |smaller?| 204
              |sizeLess?| 210 |size| 216 |sinh| 220 |sin| 225 |sech| 230 |sec|
              235 |sample| 240 |rightRecip| 244 |rightPower| 249 |retractIfCan|
              261 |retract| 276 |represents| 291 |representationType| 302 |rem|
              306 |regularRepresentation| 312 |reducedSystem| 323 |reduce| 345
              |recip| 355 |real| 360 |rationalIfCan| 365 |rational?| 370
              |rational| 375 |rank| 380 |random| 384 |quo| 388 |principalIdeal|
              394 |primitiveElement| 399 |primitive?| 403 |primeFrobenius| 408
              |prime?| 419 |polarCoordinates| 424 |plenaryPower| 429 |pi| 435
              |patternMatch| 439 |order| 453 |opposite?| 463 |one?| 469
              |nthRoot| 474 |norm| 480 |nextItem| 485 |multiEuclidean| 490
              |minimalPolynomial| 496 |map| 501 |lookup| 507 |log| 512 |lift|
              517 |leftRecip| 522 |leftPower| 527 |lcmCoef| 539 |lcm| 545
              |latex| 556 |inv| 561 |init| 566 |index| 570 |imaginary| 575
              |imag| 579 |hashUpdate!| 584 |hash| 590 |generator| 595
              |gcdPolynomial| 599 |gcd| 605 |factorsOfCyclicGroupSize| 616
              |factorSquareFreePolynomial| 620 |factorPolynomial| 625 |factor|
              630 |extendedEuclidean| 635 |exquo| 648 |expressIdealMember| 660
              |exp| 666 |eval| 671 |euclideanSize| 711 |enumerate| 716 |elt|
              720 |divide| 726 |discriminant| 732 |discreteLog| 741
              |differentiate| 752 |derivationCoordinates| 802
              |definingPolynomial| 808 |csch| 812 |csc| 817
              |createPrimitiveElement| 822 |coth| 826 |cot| 831 |cosh| 836
              |cos| 841 |coordinates| 846 |convert| 868 |conjugate| 913
              |conditionP| 918 |complex| 923 |commutator| 929 |coerce| 935
              |charthRoot| 960 |characteristicPolynomial| 970 |characteristic|
              975 |basis| 979 |atanh| 983 |atan| 988 |associator| 993
              |associates?| 1000 |asinh| 1006 |asin| 1011 |asech| 1016 |asec|
              1021 |argument| 1026 |antiCommutator| 1031 |annihilate?| 1037
              |acsch| 1043 |acsc| 1048 |acoth| 1053 |acot| 1058 |acosh| 1063
              |acos| 1068 |abs| 1073 ^ 1078 |Zero| 1108 |One| 1112 |OMwrite|
              1116 D 1140 = 1190 / 1196 - 1202 + 1213 * 1219)
           'NIL
           (CONS
            (|makeByteWordVec2| 38
                                '(0 0 2 2 4 34 18 35 18 35 0 37 0 0 0 3 36 0 0
                                  1 3 5 38 20 21 0 0 0 0 0 3 0 0 0 0 3 0 0 0 0
                                  0 3 10 0 0 0 0 0 3 3 10 0 0 0 0 0 0 0 0 0 6 0
                                  0 0 0 2 19 25 26 0 0 0 0 7 8 9 12 23 0 0 0 0
                                  0 0 0 3 3 8 9 11 13 12 12 12 12 12 14 15 15
                                  16 17 22 23 24 27 28 29))
            (CONS
             '#(|ComplexCategory&| |MonogenicAlgebra&| |FiniteFieldCategory&|
                |FieldOfPrimeCharacteristic&| |Field&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |GcdDomain&| |FramedAlgebra&|
                NIL |FiniteRankAlgebra&| |DifferentialExtension&| NIL
                |DivisionRing&| NIL |Algebra&| |Algebra&| NIL |Algebra&| NIL
                |EntireRing&| |PartialDifferentialRing&| |DifferentialRing&|
                NIL |NonAssociativeAlgebra&| |Rng&| |NonAssociativeAlgebra&|
                NIL |NonAssociativeAlgebra&| |FullyLinearlyExplicitOver&|
                |Module&| |Module&| NIL |Module&| NIL NIL |FramedModule&| NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Finite&| |FullyEvalableOver&| |FullyRetractableTo&| |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL NIL NIL |RetractableTo&| NIL
                |SetCategory&| |Hashable&| |RetractableTo&| |RetractableTo&|
                |TranscendentalFunctionCategory&| |Evalable&| NIL NIL NIL NIL
                NIL |BasicType&| NIL NIL NIL NIL NIL NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL |InnerEvalable&| |InnerEvalable&| NIL NIL
                NIL |OpenMath&|)
             (CONS
              '#((|ComplexCategory| 6)
                 (|MonogenicAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|PolynomialFactorizationExplicit|)
                 (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|)
                 (|FramedAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|IntegralDomain|)
                 (|FiniteRankAlgebra| 6 (|SparseUnivariatePolynomial| 6))
                 (|DifferentialExtension| 6) (|CommutativeRing|)
                 (|DivisionRing|) (|LeftOreRing|) (|Algebra| 6) (|Algebra| $$)
                 (|CharacteristicZero|) (|Algebra| 42)
                 (|CharacteristicNonZero|) (|EntireRing|)
                 (|PartialDifferentialRing| 82) (|DifferentialRing|) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|Rng|)
                 (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|NonAssociativeAlgebra| 42) (|FullyLinearlyExplicitOver| 6)
                 (|Module| $$) (|Module| 6) (|SemiRng|) (|Module| 42)
                 (|LinearlyExplicitOver| 6) (|BiModule| $$ $$)
                 (|FramedModule| 6) (|BiModule| 6 6) (|NonAssociativeRing|)
                 (|BiModule| 42 42) (|LinearlyExplicitOver| 43)
                 (|RightModule| 6) (|LeftModule| $$) (|LeftModule| 6)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| 42)
                 (|RightModule| 42) (|RightModule| 43) (|AbelianGroup|)
                 (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|FullyPatternMatchable| 6)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Finite|) (|FullyEvalableOver| 6)
                 (|FullyRetractableTo| 6) (|Magma|) (|AbelianSemiGroup|)
                 (|StepThrough|) (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 43) (|Patternable| 6) (|RetractableTo| 6)
                 (|CommutativeStar|) (|SetCategory|) (|Hashable|)
                 (|RetractableTo| 42) (|RetractableTo| 43)
                 (|TranscendentalFunctionCategory|) (|Evalable| 6) (|Type|)
                 (|CoercibleFrom| 6)
                 (|ConvertibleTo| (|SparseUnivariatePolynomial| 6))
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 96) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 42) (|CoercibleFrom| 43)
                 (|noZeroDivisors|) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|arbitraryPrecision|)
                 (|ConvertibleTo| 90) (|ConvertibleTo| 91) (|ConvertibleTo| 62)
                 (|multiplicativeValuation|) (|InnerEvalable| 82 6)
                 (|InnerEvalable| 6 6) (|Eltable| 6 $$) (|ConvertibleTo| 63)
                 (|ConvertibleTo| 64) (|OpenMath|))
              (|makeByteWordVec2| 96
                                  '(1 9 8 0 10 3 9 8 0 11 11 12 2 6 8 9 0 14 1
                                    9 8 0 16 1 9 8 0 17 1 9 8 0 18 3 0 8 9 0 19
                                    20 0 6 0 22 0 6 0 24 1 6 19 0 25 2 6 19 0 0
                                    27 2 0 0 0 0 31 2 0 0 0 0 32 2 0 0 0 0 33 2
                                    6 0 0 0 34 2 6 0 0 0 35 2 6 0 0 0 36 2 0 37
                                    0 6 38 1 0 0 0 39 1 0 6 0 40 2 0 37 0 0 41
                                    2 0 19 0 0 1 1 0 19 0 26 1 41 54 0 1 1 41 0
                                    0 1 1 41 19 0 1 0 0 69 1 1 0 69 70 1 1 0 6
                                    0 1 1 12 0 0 1 1 12 0 0 1 1 2 76 43 1 2 0
                                    37 0 0 1 1 34 51 49 1 1 36 0 0 1 1 36 50 0
                                    1 1 13 0 0 1 2 34 52 53 49 1 2 19 19 0 0 1
                                    2 40 19 0 0 1 0 6 57 1 1 12 0 0 1 1 12 0 0
                                    1 1 12 0 0 1 1 12 0 0 1 0 0 0 1 1 0 37 0 1
                                    2 0 0 0 57 1 2 0 0 0 73 1 1 8 84 0 1 1 9 92
                                    0 1 1 0 94 0 1 1 8 42 0 1 1 9 43 0 1 1 0 6
                                    0 1 1 0 0 95 1 2 0 0 95 70 1 0 2 79 1 2 40
                                    0 0 0 1 1 0 69 0 1 2 0 69 0 70 1 2 10 85 46
                                    70 1 1 10 86 46 1 2 0 93 46 70 1 1 0 69 46
                                    1 1 3 37 68 1 1 0 0 72 1 1 0 37 0 1 1 0 6 0
                                    13 1 17 84 0 1 1 17 19 0 1 1 17 42 0 1 0 0
                                    73 1 0 6 0 1 2 40 0 0 0 1 1 40 55 48 1 0 2
                                    0 1 1 2 19 0 1 2 2 0 0 57 1 1 2 0 0 1 1 36
                                    19 0 1 1 31 44 0 1 2 0 0 0 73 1 0 12 0 1 3
                                    25 88 0 63 88 1 3 26 89 0 64 89 1 1 2 75 0
                                    1 1 2 73 0 1 2 0 19 0 0 1 1 0 19 0 28 2 13
                                    0 0 43 1 1 0 6 0 40 1 2 37 0 1 2 40 56 48 0
                                    1 1 3 72 0 1 2 0 0 71 0 1 1 6 73 0 1 1 12 0
                                    0 1 1 0 72 0 1 1 0 37 0 1 2 0 0 0 57 1 2 0
                                    0 0 73 1 2 36 47 0 0 1 2 36 0 0 0 1 1 36 0
                                    48 1 1 0 11 0 1 1 3 0 0 1 0 2 0 1 1 6 0 73
                                    1 0 0 0 1 1 0 6 0 15 2 7 80 80 0 1 1 7 81 0
                                    1 0 0 0 1 2 36 49 49 49 1 1 36 0 48 1 2 36
                                    0 0 0 1 0 2 78 1 1 34 51 49 1 1 34 51 49 1
                                    1 36 50 0 1 2 40 59 0 0 1 3 40 61 0 0 0 1 2
                                    41 37 0 0 41 2 11 37 0 6 38 2 40 56 48 0 1
                                    1 12 0 0 1 2 23 0 0 65 1 3 23 0 0 6 6 1 2
                                    23 0 0 66 1 3 23 0 0 67 67 1 3 22 0 0 82 6
                                    1 3 22 0 0 83 67 1 1 40 57 0 1 0 6 48 1 2
                                    24 0 0 6 1 2 40 58 0 0 1 0 0 6 1 1 0 6 70 1
                                    2 2 74 0 0 1 1 2 57 0 1 2 21 0 0 57 1 1 21
                                    0 0 1 3 20 0 0 82 57 1 3 20 0 0 83 87 1 2
                                    20 0 0 82 1 2 20 0 0 83 1 2 0 0 0 71 1 3 0
                                    0 0 71 57 1 2 3 69 70 71 1 0 0 72 1 1 12 0
                                    0 1 1 12 0 0 1 0 2 0 1 1 12 0 0 1 1 12 0 0
                                    1 1 12 0 0 1 1 12 0 0 1 1 0 69 70 1 1 0 95
                                    0 1 2 0 95 0 70 1 2 0 69 70 70 1 1 16 62 0
                                    1 1 27 63 0 1 1 28 64 0 1 1 15 90 0 1 1 15
                                    91 0 1 1 0 0 72 1 1 0 72 0 1 1 0 0 95 1 1 0
                                    95 0 1 1 0 0 0 39 1 42 45 46 1 2 0 0 6 6 30
                                    2 0 0 0 0 1 1 39 0 42 1 1 0 0 0 1 1 0 0 6
                                    29 1 0 0 43 1 1 0 96 0 1 1 43 37 0 1 1 2 0
                                    0 1 1 0 72 0 1 0 0 57 1 0 0 70 1 1 12 0 0 1
                                    1 12 0 0 1 3 0 0 0 0 0 1 2 41 19 0 0 1 1 12
                                    0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12
                                    6 0 1 2 0 0 0 0 1 2 0 19 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 12 0 0 1 1 12 0 0 1 1 12 0 0 1 1
                                    12 0 0 1 1 30 0 0 1 2 13 0 0 42 1 2 3 0 0
                                    43 1 2 12 0 0 0 1 2 0 0 0 57 1 2 0 0 0 73 1
                                    0 0 0 21 0 0 0 23 1 29 11 0 1 2 29 8 9 0 1
                                    2 29 11 0 19 1 3 29 8 9 0 19 20 2 21 0 0 57
                                    1 1 21 0 0 1 3 20 0 0 83 87 1 3 20 0 0 82
                                    57 1 2 20 0 0 82 1 2 20 0 0 83 1 2 0 0 0 71
                                    1 3 0 0 0 71 57 1 2 0 19 0 0 1 2 3 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 32 2 0 0 0 0 31 2 3 0
                                    42 0 1 2 3 0 0 42 1 2 10 0 0 43 1 2 0 0 6 0
                                    1 2 0 0 0 6 1 2 0 0 57 0 1 2 0 0 43 0 1 2 0
                                    0 0 0 33 2 0 0 73 0 1)))))
           '|lookupComplete|)) 
