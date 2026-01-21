
(SDEFUN |JBX;coerce;JB%;1| ((|jv| (JB)) (% (%)))
        (COND
         ((SPADCALL (SPADCALL |jv| (QREFELT % 9)) '|Indep| (QREFELT % 11))
          (|error| "Only functions of independent variables allowed"))
         ('T (SPADCALL |jv| (QREFELT % 12))))) 

(SDEFUN |JBX;retractIfCan;JbeU;2|
        ((|p| (|JetBundleExpression| JB)) (% (|Union| % "failed")))
        (SPROG ((#1=#:G38 NIL) (|jv| NIL) (#2=#:G37 NIL))
               (SEQ
                (COND
                 ((SPADCALL (ELT % 16)
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |jv| NIL)
                                  (LETT #1# (SPADCALL |p| (QREFELT % 15))) G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |jv| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (EQUAL (SPADCALL |jv| (QREFELT % 9))
                                                  '|Indep|)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
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

(DECLAIM (NOTINLINE |JetBundleXExpression;|)) 

(DEFUN |JetBundleXExpression| (#1=#:G131)
  (SPROG NIL
         (PROG (#2=#:G132)
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

(DEFUN |JetBundleXExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G130 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
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
                                                             '(|CommutativeRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Ring|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Group|))
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
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|RetractableTo|
                                                                     (|Integer|))))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))))
          (|haddProp| |$ConstructorCache| '|JetBundleXExpression| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 32768))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 65536))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|JetBundleExpression| |#1|))
          %))) 

(MAKEPROP '|JetBundleXExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|JetBundleExpression| 6) (|local| |#1|)
              '|Rep| (|Symbol|) (0 . |type|) (|Boolean|) (5 . ~=)
              (11 . |coerce|) |JBX;coerce;JB%;1| (|List| 6)
              (16 . |jetVariables|) (21 . |and|) (|Mapping| 10 10 10)
              (|List| 10) (27 . |reduce|) (|Union| % '"failed")
              |JBX;retractIfCan;JbeU;2| |JBX;retract;Jbe%;3| (|OutputForm|)
              (|String|) (|PositiveInteger|) (|Integer|) (|NonNegativeInteger|)
              (|List| 8) (|List| 27) (|SparseUnivariatePolynomial| %)
              (|List| %)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Union| 6 '#1="failed") (|Void|) (|SparseEchelonMatrix| 6 %)
              (|List| 14) (|Record| (|:| |DPhi| %) (|:| |JVars| 14))
              (|Record| (|:| |DSys| 31) (|:| |JVars| 37))
              (|Union| '"failed" (|List| 29))
              (|Record| (|:| |Sys| 31) (|:| JM 36) (|:| |Depend| 40))
              (|Union| 26 '#1#) (|Union| 8 '#1#) (|BasicOperator|)
              (|Mapping| % %) (|Mapping| % 31) (|List| 44) (|List| 45)
              (|List| 46) (|Kernel| %) (|List| 50) (|Union| 50 '"failed")
              (|Equation| %) (|List| 53) (|Polynomial| %) (|Fraction| 26)
              (|Factored| %) (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 58 '#2="failed") (|Union| 31 '#2#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|Record| (|:| |coef| 31) (|:| |generator| %))
              (|SegmentBinding| %) (|Expression| 26) (|Union| 56 '#1#)
              (|Record| (|:| |coef| 26) (|:| |var| 50))
              (|Union| 67 '#3="failed") (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 26) (|Fraction| 83) (|Union| 72 '#1#) (|Fraction| 76)
              (|Fraction| 30) (|Polynomial| 56)
              (|SparseMultivariatePolynomial| 26 50)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 26 %)
              (|AlgebraicNumber|) (|Union| 80 '#1#) (|Union| 83 '#1#)
              (|Polynomial| 26) (|Record| (|:| |var| 50) (|:| |exponent| 26))
              (|Union| 84 '#3#) (|Record| (|:| |val| %) (|:| |exponent| 26))
              (|Union| 86 '#3#)
              (|Record| (|:| |mat| 91) (|:| |vec| (|Vector| 26))) (|Matrix| %)
              (|Vector| %) (|Matrix| 26))
           '#(~= 34 |zerosOf| 40 |zeroOf| 67 |zero?| 94 |whittakerW| 99
              |whittakerM| 106 |weierstrassZeta| 113 |weierstrassSigma| 120
              |weierstrassPPrime| 127 |weierstrassPInverse| 134 |weierstrassP|
              141 |weberE| 148 |variables| 154 |univariate| 164 |unitStep| 170
              |unitNormal| 175 |unitCanonical| 180 |unit?| 185 |tower| 190
              |tanh| 200 |tan| 205 |symbol| 210 |summation| 215 |subtractIfCan|
              227 |subst| 233 |struveL| 259 |struveH| 265 |squareFreePart| 271
              |squareFree| 276 |sqrt| 281 |sortLD| 286 |solveFor| 291
              |smaller?| 297 |sizeLess?| 303 |sinh| 309 |sin| 314 |simplify|
              319 |simpOne| 325 |simpMod| 330 |sign| 343 |setNotation| 348
              |sech| 353 |sec| 358 |sample| 363 |rootsOf| 367 |rootSum| 394
              |rootOf| 401 |rightRecip| 428 |rightPower| 433 |riemannZeta| 445
              |retractIfCan| 450 |retract| 495 |rem| 540 |reducedSystem| 546
              |reduceMod| 557 |reduce| 563 |recip| 568 |quo| 573 |product| 579
              |principalIdeal| 591 |prime?| 596 |polylog| 601 |polygamma| 607
              |plenaryPower| 613 |pi| 619 |permutation| 623 |patternMatch| 629
              |paren| 643 |orderDim| 648 |order| 655 |opposite?| 660
              |operators| 666 |operator| 671 |one?| 676 |odd?| 681 |numerator|
              686 |numer| 691 |numIndVar| 696 |numDepVar| 700 |nthRoot| 704
              |multiEuclidean| 710 |minPoly| 716 |meixnerM| 721 |meijerG| 729
              |map| 738 |mainKernel| 744 |lommelS2| 749 |lommelS1| 756 |log|
              763 |li| 768 |lerchPhi| 773 |legendreQ| 780 |legendreP| 787
              |leftRecip| 794 |leftPower| 799 |leadingDer| 811 |lcmCoef| 816
              |lcm| 822 |latex| 833 |lambertW| 838 |laguerreL| 843 |kummerU|
              850 |kummerM| 857 |kernels| 864 |kernel| 874 |kelvinKer| 886
              |kelvinKei| 892 |kelvinBer| 898 |kelvinBei| 904 |jetVariables|
              910 |jacobiZeta| 915 |jacobiTheta| 921 |jacobiSn| 927 |jacobiP|
              933 |jacobiMatrix| 941 |jacobiDn| 952 |jacobiCn| 958 |isTimes|
              964 |isPower| 969 |isPlus| 974 |isMult| 979 |isExpt| 984 |is?|
              1001 |inv| 1013 |integral| 1018 |hypergeometricF| 1030 |hermiteH|
              1037 |height| 1043 |hankelH2| 1048 |hankelH1| 1054 |ground?| 1060
              |ground| 1065 |getNotation| 1070 |gcdPolynomial| 1074 |gcd| 1080
              |function| 1091 |fresnelS| 1097 |fresnelC| 1102 |freeOf?| 1107
              |fractionPart| 1125 |formalDiff2| 1130 |formalDiff| 1144 |floor|
              1162 |factorials| 1167 |factorial| 1178 |factor| 1183
              |extractSymbol| 1188 |extendedEuclidean| 1193 |exquo| 1206
              |expressIdealMember| 1212 |exp| 1218 |even?| 1223 |eval| 1228
              |euclideanSize| 1372 |erfi| 1377 |erf| 1382 |elt| 1387
              |ellipticPi| 1483 |ellipticK| 1490 |ellipticF| 1495 |ellipticE|
              1501 |divide| 1512 |distribute| 1518 |diracDelta| 1529
              |dimension| 1534 |dilog| 1541 |digamma| 1546 |differentiate| 1551
              |denominator| 1583 |denom| 1588 |definingPolynomial| 1593
              |dSubst| 1598 |csch| 1605 |csc| 1610 |coth| 1615 |cot| 1620
              |cosh| 1625 |cos| 1630 |convert| 1635 |const?| 1655 |conjugate|
              1660 |commutator| 1671 |coerce| 1677 |class| 1752 |charthRoot|
              1757 |charlierC| 1762 |characteristic| 1769 |ceiling| 1773 |box|
              1778 |binomial| 1783 |besselY| 1789 |besselK| 1795 |besselJ| 1801
              |besselI| 1807 |belong?| 1813 |autoReduce| 1818 |atanh| 1823
              |atan| 1828 |associator| 1833 |associates?| 1840 |asinh| 1846
              |asin| 1851 |asech| 1856 |asec| 1861 |applyQuote| 1866
              |antiCommutator| 1902 |annihilate?| 1908 |angerJ| 1914 |algtower|
              1920 |airyBiPrime| 1930 |airyBi| 1935 |airyAiPrime| 1940 |airyAi|
              1945 |acsch| 1950 |acsc| 1955 |acoth| 1960 |acot| 1965 |acosh|
              1970 |acos| 1975 |abs| 1980 ^ 1985 |Zero| 2015 X 2019 U 2028 |Si|
              2037 |Shi| 2042 P 2047 |One| 2069 |Gamma| 2073 |Ei| 2084 D 2089
              |Ci| 2115 |Chi| 2120 |Beta| 2125 = 2138 / 2144 - 2156 + 2167 *
              2173)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 3 2 0 0 0 0 0 2
                                  0 0 0 0 5 2 0 0 0 5 2 0 0 0 5 2 0 0 0 0 0 6 0
                                  0 0 0 0 0 0 0 0 0 11 10 0 0 0 0 0 12 5 1 13 0
                                  0 0 0 0 0 0 0 0 0 12 9 8 7 5 1 13 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |FunctionSpace&|
                |AlgebraicallyClosedField&| |Field&|
                |JetBundleBaseFunctionCategory&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| |UniqueFactorizationDomain&| NIL
                |GcdDomain&| NIL NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |Algebra&| |EntireRing&| |PartialDifferentialRing&| |Algebra&|
                NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| NIL |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |Group&| |AbelianGroup&| NIL
                NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |ExpressionSpace&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| NIL |FullyRetractableTo&| NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |RetractableTo&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |TranscendentalFunctionCategory&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 26) (|FunctionSpace| 26)
                 (|AlgebraicallyClosedField|) (|Field|)
                 (|JetBundleBaseFunctionCategory| 6) (|EuclideanDomain|)
                 (|JetBundleFunctionCategory| 6) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DivisionRing|)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|Algebra| 26) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 8) (|Algebra| 56) (|Ring|)
                 (|NonAssociativeAlgebra| 26) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 56)
                 (|FullyLinearlyExplicitOver| 26) (|Module| 26) (|SemiRng|)
                 (|Module| $$) (|Module| 56) (|LinearlyExplicitOver| 26)
                 (|BiModule| 26 26) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 56 56) (|RightModule| 26) (|LeftModule| 26)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 56) (|RightModule| 56) (|Group|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|ExpressionSpace|) (|FullyPatternMatchable| 26)
                 (|PatternMatchable| 26) (|PatternMatchable| (|Float|))
                 (|AbelianSemiGroup|) (|Magma|) (|Comparable|)
                 (|FullyRetractableTo| 26) (|LiouvillianFunctionCategory|)
                 (|RetractableTo| 80) (|RetractableTo| 83) (|RetractableTo| 72)
                 (|RetractableTo| 56) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|RetractableTo| (|Kernel| $$))
                 (|Evalable| $$) (|RetractableTo| 8) (|Patternable| 26)
                 (|RetractableTo| 26) (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|CoercibleFrom| 80)
                 (|ConvertibleTo| 71) (|ConvertibleTo| 70) (|ConvertibleTo| 69)
                 (|CoercibleFrom| 83) (|CoercibleFrom| 72) (|CoercibleFrom| 56)
                 (|CoercibleTo| 23) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleFrom| (|Kernel| $$))
                 (|InnerEvalable| (|Kernel| $$) $$) (|InnerEvalable| $$ $$)
                 (|canonicalUnitNormal|) (|canonicalsClosed|)
                 (|CoercibleFrom| 8) (|Type|) (|CoercibleFrom| 26)
                 (|RadicalCategory|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|))
              (|makeByteWordVec2| 91
                                  '(1 6 8 0 9 2 8 10 0 0 11 1 5 0 6 12 1 0 14 0
                                    15 2 10 0 0 0 16 3 18 10 17 0 10 19 2 0 10
                                    0 0 1 2 0 31 0 8 1 1 0 31 0 1 2 0 31 30 8 1
                                    1 0 31 55 1 1 0 31 30 1 2 0 0 0 8 1 1 0 0 0
                                    1 2 0 0 30 8 1 1 0 0 55 1 1 0 0 30 1 1 0 10
                                    0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    3 0 0 0 0 0 1 2 0 0 0 0 1 1 0 28 31 1 1 0
                                    28 0 1 2 1 75 0 50 1 1 0 0 0 1 1 0 33 0 1 1
                                    0 0 0 1 1 0 10 0 1 1 0 51 31 1 1 0 51 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 36 31 1 2 0 0 0 64 1
                                    2 0 0 0 8 1 2 0 20 0 0 1 3 0 0 0 6 0 1 3 0
                                    0 0 51 31 1 2 0 0 0 53 1 2 0 0 0 54 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 57 0 1 1 0
                                    0 0 1 1 0 31 31 1 2 0 20 0 6 1 2 0 10 0 0 1
                                    2 0 10 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 41 31
                                    36 1 1 0 0 0 1 3 0 41 31 36 31 1 2 0 31 31
                                    31 1 1 0 0 0 1 1 0 35 8 1 1 0 0 0 1 1 0 0 0
                                    1 0 0 0 1 2 0 31 0 8 1 1 0 31 0 1 2 0 31 30
                                    8 1 1 0 31 55 1 1 0 31 30 1 3 0 0 0 30 8 1
                                    2 0 0 0 8 1 1 0 0 0 1 2 0 0 30 8 1 1 0 0 55
                                    1 1 0 0 30 1 1 0 20 0 1 2 0 0 0 25 1 2 0 0
                                    0 27 1 1 0 0 0 1 1 0 34 0 1 1 0 42 0 1 1 0
                                    43 0 1 1 0 52 0 1 1 0 20 5 21 1 13 66 0 1 1
                                    1 73 0 1 1 12 81 0 1 1 5 82 0 1 1 0 6 0 1 1
                                    0 26 0 1 1 0 8 0 1 1 0 50 0 1 1 0 0 5 22 1
                                    13 56 0 1 1 1 72 0 1 1 12 80 0 1 1 5 83 0 1
                                    2 0 0 0 0 1 2 5 88 89 90 1 1 5 91 89 1 2 0
                                    31 31 31 1 1 0 0 0 1 1 0 20 0 1 2 0 0 0 0 1
                                    2 0 0 0 8 1 2 0 0 0 64 1 1 0 63 31 1 1 0 10
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 25 1 0
                                    0 0 1 2 0 0 0 0 1 3 10 78 0 70 78 1 3 11 79
                                    0 71 79 1 1 0 0 0 1 3 0 27 31 36 27 1 1 0
                                    27 0 1 2 0 10 0 0 1 1 0 47 0 1 1 0 44 44 1
                                    1 0 10 0 1 1 17 10 0 1 1 0 0 0 1 1 5 77 0 1
                                    0 0 25 1 0 0 25 1 2 0 0 0 26 1 2 0 60 31 0
                                    1 1 16 30 50 1 4 0 0 0 0 0 0 1 5 17 0 31 31
                                    31 31 0 1 2 0 0 45 50 1 1 0 52 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0
                                    20 0 1 2 0 0 0 25 1 2 0 0 0 27 1 1 0 6 0 1
                                    2 0 32 0 0 1 2 0 0 0 0 1 1 0 0 31 1 1 0 24
                                    0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 51 0 1 1 0 51 31 1 2 0 0 44
                                    0 1 2 0 0 44 31 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 1 0 14 0 15 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 2
                                    0 36 31 37 1 1 0 36 31 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 15 60 0 1 1 5 87 0 1 1 14 60 0 1 1
                                    14 68 0 1 2 5 85 0 8 1 2 5 85 0 44 1 1 15
                                    85 0 1 2 0 10 0 8 1 2 0 10 0 44 1 1 0 0 0 1
                                    2 0 0 0 8 1 2 0 0 0 64 1 3 17 0 31 31 0 1 2
                                    0 0 0 0 1 1 0 27 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 10 0 1 1 0 26 0 1 0 0 8 1 2 0 30 30
                                    30 1 1 0 0 31 1 2 0 0 0 0 1 2 0 0 8 31 1 1
                                    0 0 0 1 1 0 0 0 1 2 0 10 0 6 1 2 0 10 0 0 1
                                    2 0 10 0 8 1 1 0 0 0 1 3 0 38 0 25 36 1 3 0
                                    39 31 25 36 1 2 0 0 0 25 1 2 0 31 31 25 1 2
                                    0 0 0 29 1 1 0 0 0 1 2 0 0 0 8 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 57 0 1 1 0 36 36 1 3 0 59 0 0
                                    0 1 2 0 61 0 0 1 2 0 20 0 0 1 2 0 60 31 0 1
                                    1 0 0 0 1 1 17 10 0 1 3 0 0 0 44 45 1 3 0 0
                                    0 44 46 1 3 0 0 0 47 48 1 3 0 0 0 47 49 1 3
                                    0 0 0 8 45 1 3 0 0 0 28 49 1 3 0 0 0 8 46 1
                                    3 0 0 0 28 48 1 3 0 0 0 31 31 1 3 0 0 0 0 0
                                    1 2 0 0 0 54 1 2 0 0 0 53 1 3 0 0 0 51 31 1
                                    3 0 0 0 50 0 1 4 7 0 0 44 0 8 1 4 7 0 0 47
                                    31 8 1 4 5 0 0 8 27 45 1 4 5 0 0 28 29 49 1
                                    4 5 0 0 8 27 46 1 4 5 0 0 28 29 48 1 1 0 27
                                    0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 44 31 1 9 0 0
                                    44 0 0 0 0 0 0 0 0 1 10 0 0 44 0 0 0 0 0 0
                                    0 0 0 1 7 0 0 44 0 0 0 0 0 0 1 8 0 0 44 0 0
                                    0 0 0 0 0 1 6 0 0 44 0 0 0 0 0 1 4 0 0 44 0
                                    0 0 1 5 0 0 44 0 0 0 0 1 3 0 0 44 0 0 1 2 0
                                    0 44 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 62 0 0 1 2 0 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 27 31 36 27 1
                                    1 0 0 0 1 1 0 0 0 1 2 0 0 0 28 1 2 0 0 0 8
                                    1 3 0 0 0 8 27 1 3 0 0 0 28 29 1 2 0 0 0 6
                                    1 1 0 0 0 1 1 1 77 0 1 1 16 0 0 1 3 0 0 0 6
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 7 69 0 1 1 8 70 0 1 1
                                    9 71 0 1 1 1 0 57 1 1 0 10 0 1 1 0 0 0 1 2
                                    6 0 0 0 1 2 0 0 0 0 1 1 0 23 0 1 1 0 0 26 1
                                    1 0 0 0 1 1 0 0 6 13 1 0 0 8 1 1 0 0 50 1 1
                                    0 0 56 1 1 0 0 65 1 1 0 65 0 1 1 1 0 72 1 1
                                    1 0 74 1 1 1 0 76 1 1 12 0 80 1 1 5 0 83 1
                                    1 5 0 77 1 1 0 27 0 1 1 3 20 0 1 3 0 0 0 0
                                    0 1 0 0 27 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 0 10 44 1 1 0 31 31 1 1 0 0 0 1 1 0
                                    0 0 1 3 0 0 0 0 0 1 2 0 10 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 8 31 1
                                    4 0 0 8 0 0 0 1 5 0 0 8 0 0 0 0 1 3 0 0 8 0
                                    0 1 2 0 0 8 0 1 2 0 0 0 0 1 2 0 10 0 0 1 2
                                    0 0 0 0 1 1 1 51 0 1 1 1 51 31 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 25 1 2 0 0 0 27 1 2 0 0
                                    0 56 1 2 0 0 0 26 1 2 0 0 0 0 1 0 0 0 1 1 0
                                    0 25 1 0 0 0 1 1 0 0 25 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 25 29 1 1 0 0 29 1 1 0 0 27
                                    1 2 0 0 25 27 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 8 1 2 0 0 0 28 1 3 0 0
                                    0 28 29 1 3 0 0 0 8 27 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 3 0 0 0 0 0 1 2 0 10 0 0 1 2
                                    0 0 0 0 1 2 1 0 77 77 1 1 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 25 0 1 2 0 0 0 0 1 2 0
                                    0 26 0 1 2 0 0 27 0 1 2 0 0 0 56 1 2 0 0 56
                                    0 1 2 5 0 0 26 1)))))
           '|lookupComplete|)) 
