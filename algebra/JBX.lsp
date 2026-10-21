
(SDEFUN |JBX;coerce;JB%;1| ((|jv| (JB)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT % 9)) '|Indep| (QREFELT % 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT % 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG ((#1=#:G20 NIL) (|jv| NIL) (#2=#:G21 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT % 16)
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |jv| NIL)
                                  (LETT #2# (SPADCALL |p| (QREFELT % 15))) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |jv| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT % 9))
                                                  '|Indep|)
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#))))
                            'T (QREFELT % 19))
                  (CONS 0 |p|))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |JBX;retract;Jbe%;3| ((|p| (|JetBundleExpression| JB)) (% (%)))
        (SPROG ((|px| (|Union| % "failed")))
               (SEQ (LETT |px| (SPADCALL |p| (QREFELT % 21)))
                    (EXIT
                     (COND
                      ((QEQCAR |px| 1)
                       (|error|
                        "Only functions of independent variables allowed"))
                      ('T (QCDR |px|))))))) 

(MAKEPROP '|JBX;coerce;%Jbe;4| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |JBX;coerce;%Jbe;4| ((|x| (%)) (% (|JetBundleExpression| JB))) |x|) 

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G87 NIL) (|pv$| NIL) (#2=#:G88 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|JetBundleXExpression| DV$1))
    (LETT % (GETREFV 92))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|IntegralDomain|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Integer|) '(|Ring|))
                                        (|HasCategory| (|Integer|) '(|Group|))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Float|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|ConvertibleTo|
                                                         (|Pattern|
                                                          (|Integer|))))
                                        (|HasCategory| (|Integer|)
                                                       '(|PatternMatchable|
                                                         (|Float|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|PatternMatchable|
                                                         (|Integer|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                        (OR #1#
                                            (AND
                                             (|HasCategory| (|Integer|)
                                                            '(|RetractableTo|
                                                              (|Integer|)))
                                             (|HasCategory| (|Integer|)
                                                            '(|IntegralDomain|))))))))
    (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 65536))
    (AND (LETT #2# (|HasCategory| % '(|CharacteristicZero|)))
         (|augmentPredVector| % 131072))
    (AND (OR #2# #1# (|HasCategory| (|Integer|) '(|IntegralDomain|)))
         (|augmentPredVector| % 262144))
    (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| % 524288))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 7 (|JetBundleExpression| |#1|))
    %))) 

(DEFUN |JetBundleXExpression| (#1=#:G89)
  (SPROG NIL
         (PROG (#2=#:G90)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleXExpression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleXExpression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleXExpression|)))))))))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB%;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| % '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe%;3|
              |JBX;coerce;%Jbe;4| (|String|) (|OutputForm|) (|PositiveInteger|)
              (|Integer|) (|NonNegativeInteger|) (|List| 8) (|List| 28)
              (|SparseUnivariatePolynomial| %) (|List| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '#1="failed") (|SparseEchelonMatrix| 6 %) (|List| 14)
              (|Record| (|:| |DPhi| %) (|:| |JVars| 14))
              (|Record| (|:| |DSys| 32) (|:| |JVars| 37))
              (|Union| '"failed" (|List| 30))
              (|Record| (|:| |Sys| 32) (|:| JM 36) (|:| |Depend| 40))
              (|Union| 27 '#1#) (|Union| 8 '#1#) (|BasicOperator|)
              (|Mapping| % 32) (|Mapping| % %) (|List| 44) (|List| 45)
              (|List| 46) (|Kernel| %) (|List| 50) (|Union| 50 '"failed")
              (|List| 54) (|Equation| %) (|Polynomial| %) (|Fraction| 27)
              (|Factored| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 58 '#2="failed") (|Union| 32 '#2#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 32) (|:| |generator| %))
              (|SegmentBinding| %) (|Expression| 27) (|Union| 56 '#1#)
              (|Record| (|:| |coef| 27) (|:| |var| 50))
              (|Union| 67 '#3="failed") (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 27) (|Fraction| 82) (|Union| 72 '#1#) (|Fraction| 76)
              (|Fraction| 31) (|Polynomial| 56)
              (|SparseMultivariatePolynomial| 27 50)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 27 %)
              (|AlgebraicNumber|) (|Union| 80 '#1#) (|Polynomial| 27)
              (|Union| 82 '#1#) (|Record| (|:| |var| 50) (|:| |exponent| 27))
              (|Union| 84 '#3#) (|Record| (|:| |val| %) (|:| |exponent| 27))
              (|Union| 86 '#3#)
              (|Record| (|:| |mat| 91) (|:| |vec| (|Vector| 27))) (|Matrix| %)
              (|Vector| %) (|Matrix| 27))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |wilsonW| 99
              |whittakerW| 109 |whittakerM| 116 |weierstrassZeta| 123
              |weierstrassSigma| 130 |weierstrassPPrime| 137
              |weierstrassPInverse| 144 |weierstrassP| 151 |weberE| 158
              |variables| 164 |univariate| 174 |unitStep| 180 |unitNormal| 185
              |unitCanonical| 190 |unit?| 195 |tower| 200 |tanh| 210 |tan| 215
              |symbol| 220 |summation| 225 |subtractIfCan| 237 |subst| 243
              |struveL| 269 |struveH| 275 |squareFreePart| 281 |squareFree| 286
              |sqrt| 291 |sortLD| 296 |solveFor| 301 |smaller?| 307 |sizeLess?|
              313 |sinh| 319 |sin| 324 |simplify| 329 |simpOne| 335 |simpMod|
              340 |sign| 353 |setNotation| 358 |sech| 363 |sec| 368 |sample|
              373 |rootsOf| 377 |rootSum| 404 |rootOf| 411 |rightRecip| 438
              |rightPower| 443 |riemannZeta| 455 |retractIfCan| 460 |retract|
              505 |rem| 550 |reducedSystem| 556 |reduceMod| 567 |reduce| 573
              |recip| 578 |racahR| 583 |quo| 593 |product| 599 |principalIdeal|
              611 |prime?| 616 |polylog| 621 |polygamma| 627 |plenaryPower| 633
              |pi| 639 |permutation| 643 |patternMatch| 649 |paren| 663
              |orderDim| 668 |order| 675 |opposite?| 680 |operators| 686
              |operator| 691 |one?| 696 |odd?| 701 |numerator| 706 |numer| 711
              |numIndVar| 716 |numDepVar| 720 |nthRoot| 724 |multiEuclidean|
              730 |minPoly| 736 |meixnerP| 741 |meixnerM| 749 |meijerG| 757
              |map| 766 |mainKernel| 772 |lommelS2| 777 |lommelS1| 784 |log|
              791 |li| 796 |lerchPhi| 801 |legendreQ| 808 |legendreP| 815
              |leftRecip| 822 |leftPower| 827 |leadingDer| 839 |lcmCoef| 844
              |lcm| 850 |latex| 861 |lambertW| 866 |laguerreL| 871 |kummerU|
              878 |kummerM| 885 |krawtchoukK| 892 |kernels| 900 |kernel| 910
              |kelvinKer| 922 |kelvinKei| 928 |kelvinBer| 934 |kelvinBei| 940
              |jetVariables| 946 |jacobiZeta| 951 |jacobiTheta| 957 |jacobiSn|
              963 |jacobiP| 969 |jacobiMatrix| 977 |jacobiDn| 988 |jacobiCn|
              994 |isTimes| 1000 |isPower| 1005 |isPlus| 1010 |isMult| 1015
              |isExpt| 1020 |is?| 1037 |inv| 1049 |integral| 1054
              |hypergeometricF| 1066 |hermiteH| 1073 |height| 1079 |hankelH2|
              1084 |hankelH1| 1090 |hahn_p| 1096 |hahnS| 1106 |hahnR| 1115
              |hahnQ| 1124 |ground?| 1133 |ground| 1138 |getNotation| 1143
              |gcdPolynomial| 1147 |gcd| 1153 |function| 1164 |fresnelS| 1170
              |fresnelC| 1175 |freeOf?| 1180 |fractionPart| 1198 |formalDiff2|
              1203 |formalDiff| 1217 |floor| 1235 |factorials| 1240 |factorial|
              1251 |factor| 1256 |extractSymbol| 1261 |extendedEuclidean| 1266
              |exquo| 1279 |expressIdealMember| 1285 |exp| 1291 |even?| 1296
              |eval| 1301 |euclideanSize| 1445 |erfi| 1450 |erf| 1455 |elt|
              1460 |ellipticPi| 1556 |ellipticK| 1563 |ellipticF| 1568
              |ellipticE| 1574 |divide| 1585 |distribute| 1591 |diracDelta|
              1602 |dimension| 1607 |dilog| 1614 |digamma| 1619 |differentiate|
              1624 |denominator| 1656 |denom| 1661 |definingPolynomial| 1666
              |dSubst| 1671 |csch| 1678 |csc| 1683 |coth| 1688 |cot| 1693
              |cosh| 1698 |cos| 1703 |convert| 1708 |const?| 1728 |conjugate|
              1733 |commutator| 1744 |coerce| 1750 |class| 1830 |charlierC|
              1835 |characteristic| 1842 |ceiling| 1846 |box| 1851 |binomial|
              1856 |besselY| 1862 |besselK| 1868 |besselJ| 1874 |besselI| 1880
              |belong?| 1886 |autoReduce| 1891 |atanh| 1896 |atan| 1901
              |associator| 1906 |associates?| 1913 |asinh| 1919 |asin| 1924
              |asech| 1929 |asec| 1934 |applyQuote| 1939 |antiCommutator| 1975
              |annihilate?| 1981 |angerJ| 1987 |algtower| 1993 |airyBiPrime|
              2003 |airyBi| 2008 |airyAiPrime| 2013 |airyAi| 2018 |acsch| 2023
              |acsc| 2028 |acoth| 2033 |acot| 2038 |acosh| 2043 |acos| 2048
              |abs| 2053 ^ 2058 X 2088 U 2097 |Si| 2106 |Shi| 2111 P 2116
              |Gamma| 2138 |Ei| 2149 D 2154 |Ci| 2180 |Chi| 2185 |Beta| 2190 =
              2203 |1| 2209 |0| 2213 / 2217 - 2229 + 2240 * 2246)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 2 0 0 0 0 3 2
                                  0 0 0 5 3 2 0 0 5 3 2 0 0 5 3 2 2 0 0 0 6 0 0
                                  0 0 0 0 0 0 0 0 0 11 10 0 0 0 0 0 0 12 5 1 16
                                  0 0 0 0 0 0 0 0 0 0 0 12 9 8 7 5 4 2 1 16 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| NIL |FunctionSpace2&|
                |AlgebraicallyClosedField&| |Field&|
                |JetBundleBaseFunctionCategory&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| |Algebra&| |Algebra&|
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| NIL
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |FullyLinearlyExplicitOver&| |Module&|
                |Module&| NIL |Module&| NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL |Group&|
                |AbelianGroup&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |ExpressionSpace2&| NIL NIL NIL |AbelianSemiGroup&|
                |SetWithZero&| |Magma&| NIL |FullyRetractableTo&| NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |RetractableTo&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |TranscendentalFunctionCategory&| NIL
                |RetractableFrom&| NIL NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL NIL NIL NIL NIL |InnerEvalable&|
                |InnerEvalable&| NIL NIL NIL NIL NIL |RadicalCategory&|
                |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 27) (|FunctionSpace| 27)
                 (|FunctionSpace2| 27 (|Kernel| $$))
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|JetBundleBaseFunctionCategory| 6) (|EuclideanDomain|)
                 (|JetBundleFunctionCategory| 6) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|Algebra| 27) (|Algebra| 56) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 8) (|Ring|)
                 (|NonAssociativeAlgebra| 27) (|NonAssociativeAlgebra| 56)
                 (|SemiRing|) (|Rng|) (|NonAssociativeAlgebra| $$)
                 (|FullyLinearlyExplicitOver| 27) (|Module| 27) (|Module| 56)
                 (|SemiRng|) (|Module| $$) (|LinearlyExplicitOver| 27)
                 (|BiModule| 27 27) (|BiModule| 56 56) (|NonAssociativeRing|)
                 (|BiModule| $$ $$) (|RightModule| 27) (|LeftModule| 27)
                 (|RightModule| 56) (|LeftModule| 56) (|RightModule| $$)
                 (|NonAssociativeRng|) (|LeftModule| $$) (|Group|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|ExpressionSpace2| (|Kernel| $$))
                 (|FullyPatternMatchable| 27) (|PatternMatchable| 27)
                 (|PatternMatchable| (|Float|)) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|ComparableRepresentation|)
                 (|FullyRetractableTo| 27) (|LiouvillianFunctionCategory|)
                 (|RetractableTo| 80) (|RetractableTo| 82) (|RetractableTo| 72)
                 (|RetractableTo| 56) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|RetractableTo| (|Kernel| $$))
                 (|Evalable| $$) (|RetractableTo| 8) (|Patternable| 27)
                 (|RetractableTo| 27) (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|)
                 (|RetractableFrom| (|JetBundleExpression| 6))
                 (|CoercibleFrom| 80) (|ConvertibleTo| 71) (|ConvertibleTo| 70)
                 (|ConvertibleTo| 69) (|CoercibleFrom| 82)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleFrom| 72) (|CoercibleFrom| 56) (|CoercibleTo| 25)
                 (|BasicType|) (|unitsKnown|) (|JetBundleOperationsCategory|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleFrom| (|Kernel| $$))
                 (|InnerEvalable| (|Kernel| $$) $$) (|InnerEvalable| $$ $$)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 8) (|Type|) (|CoercibleFrom| 27)
                 (|RadicalCategory|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|)
                 (|CoercibleFrom| 65) (|CoercibleTo| 65)
                 (|CoercibleTo| (|JetBundleExpression| 6)))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 2 0 32 0 8 1 1 0 32 0 1 2 0 32 31 8 1
                                    1 0 32 55 1 1 0 32 31 1 2 0 0 0 8 1 1 0 0 0
                                    1 2 0 0 31 8 1 1 0 0 55 1 1 0 0 31 1 1 0 10
                                    0 1 6 0 0 0 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 29 32 1 1 0 29 0 1 2 1 75 0 50 1 1 0
                                    0 0 1 1 0 34 0 1 1 0 0 0 1 1 0 10 0 1 1 0
                                    51 0 1 1 0 51 32 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    36 32 1 2 0 0 0 64 1 2 0 0 0 8 1 2 0 20 0 0
                                    1 3 0 0 0 6 0 1 3 0 0 0 51 32 1 2 0 0 0 53
                                    1 2 0 0 0 54 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    0 0 1 1 0 57 0 1 1 0 0 0 1 1 0 32 32 1 2 0
                                    20 0 6 1 2 0 10 0 0 1 2 0 10 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 41 32 36 1 1 0 0 0 1 2 0 32
                                    32 32 1 3 0 41 32 36 32 1 1 0 0 0 1 1 0 8 8
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 2 0 32 0 8 1
                                    1 0 32 0 1 2 0 32 31 8 1 1 0 32 55 1 1 0 32
                                    31 1 3 0 0 0 31 8 1 2 0 0 0 8 1 1 0 0 0 1 2
                                    0 0 31 8 1 1 0 0 55 1 1 0 0 31 1 1 0 20 0 1
                                    2 0 0 0 26 1 2 0 0 0 28 1 1 0 0 0 1 1 0 35
                                    0 1 1 0 42 0 1 1 0 43 0 1 1 0 52 0 1 1 0 20
                                    5 21 1 16 66 0 1 1 1 73 0 1 1 12 81 0 1 1 5
                                    83 0 1 1 0 6 0 1 1 0 27 0 1 1 0 8 0 1 1 0
                                    50 0 1 1 0 0 5 22 1 16 56 0 1 1 1 72 0 1 1
                                    12 80 0 1 1 5 82 0 1 2 0 0 0 0 1 2 5 88 89
                                    90 1 1 5 91 89 1 2 0 32 32 32 1 1 0 0 0 1 1
                                    0 20 0 1 6 0 0 0 0 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 64 1 2 0 0 0 8 1 1 0 63 32 1 1 0 10 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 26 1 0 0
                                    0 1 2 0 0 0 0 1 3 10 78 0 70 78 1 3 11 79 0
                                    71 79 1 1 0 0 0 1 3 0 28 32 36 28 1 1 0 28
                                    0 1 2 0 10 0 0 1 1 0 47 0 1 1 0 44 44 1 1 0
                                    10 0 1 1 20 10 0 1 1 0 0 0 1 1 5 77 0 1 0 0
                                    26 1 0 0 26 1 2 0 0 0 27 1 2 0 60 32 0 1 1
                                    17 31 50 1 4 0 0 0 0 0 0 1 4 0 0 0 0 0 0 1
                                    5 20 0 32 32 32 32 0 1 2 0 0 46 50 1 1 0 52
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 1 0 20 0 1 2 0 0 0 26 1 2 0 0 0 28 1
                                    1 0 6 0 1 2 0 33 0 0 1 1 0 0 32 1 2 0 0 0 0
                                    1 1 0 24 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0
                                    51 32 1 1 0 51 0 1 2 0 0 44 32 1 2 0 0 44 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 14 0 15 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 4 0 0 0 0 0 0 1 1 0 36 32 1 2 0
                                    36 32 37 1 2 0 0 0 0 1 2 0 0 0 0 1 1 14 60
                                    0 1 1 5 87 0 1 1 13 60 0 1 1 13 68 0 1 2 5
                                    85 0 8 1 2 5 85 0 44 1 1 14 85 0 1 2 0 10 0
                                    8 1 2 0 10 0 44 1 1 0 0 0 1 2 0 0 0 8 1 2 0
                                    0 0 64 1 3 20 0 32 32 0 1 2 0 0 0 0 1 1 0
                                    28 0 1 2 0 0 0 0 1 2 0 0 0 0 1 6 0 0 0 0 0
                                    0 0 0 1 5 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 0 1
                                    5 0 0 0 0 0 0 0 1 1 0 10 0 1 1 0 27 0 1 0 0
                                    8 1 2 0 31 31 31 1 1 0 0 32 1 2 0 0 0 0 1 2
                                    0 0 8 32 1 1 0 0 0 1 1 0 0 0 1 2 0 10 0 6 1
                                    2 0 10 0 8 1 2 0 10 0 0 1 1 0 0 0 1 3 0 38
                                    0 26 36 1 3 0 39 32 26 36 1 2 0 0 0 26 1 2
                                    0 0 0 30 1 2 0 32 32 26 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 8 1 1 0 0 0 1 1 0 57 0 1 1 0 36
                                    36 1 3 0 59 0 0 0 1 2 0 61 0 0 1 2 0 20 0 0
                                    1 2 0 60 32 0 1 1 0 0 0 1 1 20 10 0 1 3 0 0
                                    0 44 45 1 3 0 0 0 44 46 1 3 0 0 0 47 48 1 3
                                    0 0 0 8 46 1 3 0 0 0 47 49 1 3 0 0 0 8 45 1
                                    3 0 0 0 29 49 1 3 0 0 0 29 48 1 3 0 0 0 0 0
                                    1 3 0 0 0 32 32 1 2 0 0 0 53 1 2 0 0 0 54 1
                                    3 0 0 0 51 32 1 3 0 0 0 50 0 1 4 7 0 0 44 0
                                    8 1 4 7 0 0 47 32 8 1 4 5 0 0 8 28 46 1 4 5
                                    0 0 29 30 48 1 4 5 0 0 8 28 45 1 4 5 0 0 29
                                    30 49 1 1 0 28 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 44 32 1 10 0 0 44 0 0 0 0 0 0 0 0 0 1 8 0
                                    0 44 0 0 0 0 0 0 0 1 9 0 0 44 0 0 0 0 0 0 0
                                    0 1 7 0 0 44 0 0 0 0 0 0 1 5 0 0 44 0 0 0 0
                                    1 6 0 0 44 0 0 0 0 0 1 4 0 0 44 0 0 0 1 2 0
                                    0 44 0 1 3 0 0 44 0 0 1 3 0 0 0 0 0 1 1 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0
                                    62 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 3
                                    0 28 32 36 28 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    8 1 3 0 0 0 8 28 1 2 0 0 0 29 1 3 0 0 0 29
                                    30 1 2 0 0 0 6 1 1 0 0 0 1 1 1 77 0 1 1 17
                                    0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 7 69
                                    0 1 1 8 70 0 1 1 9 71 0 1 1 1 0 57 1 1 0 10
                                    0 1 1 0 0 0 1 2 6 0 0 0 1 2 0 0 0 0 1 1 0
                                    25 0 1 1 0 0 27 1 1 0 0 0 1 1 0 0 6 13 1 0
                                    0 8 1 1 0 0 50 1 1 0 0 65 1 1 0 65 0 1 1 0
                                    5 0 23 1 19 0 56 1 1 1 0 72 1 1 1 0 74 1 1
                                    1 0 76 1 1 12 0 80 1 1 5 0 82 1 1 5 0 77 1
                                    1 0 28 0 1 3 0 0 0 0 0 1 0 0 28 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 10 44 1 1 0
                                    32 32 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2
                                    0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 2 0 0 8 32 1 4 0 0 8 0 0 0 1 5 0 0
                                    8 0 0 0 0 1 3 0 0 8 0 0 1 2 0 0 8 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 0 0 0 0 1 1 1 51 0 1 1
                                    1 51 32 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 26
                                    1 2 0 0 0 28 1 2 0 0 0 56 1 2 0 0 0 27 1 2
                                    0 0 0 0 1 1 0 0 26 1 0 0 0 1 1 0 0 26 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 26 30 1 1 0 0
                                    30 1 2 0 0 26 28 1 1 0 0 28 1 1 0 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 29 1 2 0 0 0 8 1
                                    3 0 0 0 8 28 1 3 0 0 0 29 30 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 2 0 10 0
                                    0 1 0 0 0 1 0 0 0 1 2 0 0 0 0 1 2 1 0 77 77
                                    1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    26 0 1 2 0 0 0 0 1 2 0 0 27 0 1 2 0 0 28 0
                                    1 2 18 0 56 0 1 2 18 0 0 56 1 2 5 0 0 27
                                    1)))))
           '|lookupComplete|)) 
