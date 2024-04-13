
(SDEFUN |MINT;maxint;Pi;1| ((% (|PositiveInteger|))) (QREFELT % 6)) 

(SDEFUN |MINT;maxint;2Pi;2|
        ((|new| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((|old| (|PositiveInteger|)))
               (SEQ (LETT |old| (QREFELT % 6)) (SETELT % 6 |new|)
                    (EXIT |old|)))) 

(SDEFUN |MINT;coerce;EE;3|
        ((|u| (|Expression| (|Integer|))) (% (|Expression| %)))
        (SPADCALL (ELT % 10) |u| (QREFELT % 15))) 

(SDEFUN |MINT;coerce;I%;4| ((|u| (|Integer|)) (% (%)))
        (SPROG ((|message| (|String|)))
               (SEQ
                (COND
                 ((> (ABS |u|) (QREFELT % 6))
                  (SEQ
                   (LETT |message|
                         (SPADCALL
                          (LIST (STRINGIMAGE |u|) "  > MAXINT("
                                (STRINGIMAGE (QREFELT % 6)) ")")
                          (QREFELT % 20)))
                   (EXIT (|error| |message|))))
                 ('T |u|))))) 

(PUT '|MINT;retract;%I;5| '|SPADreplace| '(XLAM (|u|) |u|)) 

(SDEFUN |MINT;retract;%I;5| ((|u| (%)) (% (|Integer|))) |u|) 

(PUT '|MINT;retractIfCan;%U;6| '|SPADreplace| '(XLAM (|u|) (CONS 0 |u|))) 

(SDEFUN |MINT;retractIfCan;%U;6| ((|u| (%)) (% (|Union| (|Integer|) "failed")))
        (CONS 0 |u|)) 

(DECLAIM (NOTINLINE |MachineInteger;|)) 

(DEFUN |MachineInteger| ()
  (SPROG NIL
         (PROG (#1=#:G68)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MachineInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MachineInteger|
                             (LIST (CONS NIL (CONS 1 (|MachineInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|MachineInteger|)))))))))) 

(DEFUN |MachineInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MachineInteger|))
          (LETT % (GETREFV 45))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MachineInteger| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (EXPT 2 32))
          %))) 

(MAKEPROP '|MachineInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) 'MAXINT (|PositiveInteger|)
              |MINT;maxint;Pi;1| |MINT;maxint;2Pi;2| |MINT;coerce;I%;4|
              (|Expression| $$) (|Mapping| $$ 5) (|Expression| 5)
              (|ExpressionFunctions2| 5 $$) (0 . |map|) (|Expression| %)
              |MINT;coerce;EE;3| (|List| %) (|String|) (6 . |concat|)
              |MINT;retract;%I;5| (|Union| 5 '"failed")
              |MINT;retractIfCan;%U;6|
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Boolean|) (|SparseUnivariatePolynomial| %) (|Factored| %)
              (|Union| 18 '#1="failed")
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 29 '#1#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (|NonNegativeInteger|)
              (|Record| (|:| |coef| 18) (|:| |generator| %)) (|InputForm|)
              (|PatternMatchResult| 5 %) (|Pattern| 5) (|DoubleFloat|)
              (|Float|) (|Union| % '"failed") (|Fraction| 5)
              (|Union| 41 '"failed")
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|OutputForm|))
           '#(~= 11 |zero?| 17 |unitNormal| 22 |unitCanonical| 27 |unit?| 32
              |symmetricRemainder| 37 |subtractIfCan| 43 |submod| 49
              |squareFreePart| 56 |squareFree| 61 |smaller?| 66 |sizeLess?| 72
              |sign| 78 |shift| 83 |sample| 89 |rightRecip| 93 |rightPower| 98
              |retractIfCan| 110 |retract| 115 |rem| 120 |recip| 126
              |rationalIfCan| 131 |rational?| 136 |rational| 141 |random| 146
              |quo| 151 |principalIdeal| 157 |prime?| 162 |powmod| 167
              |positiveRemainder| 174 |positive?| 180 |plenaryPower| 185
              |permutation| 191 |patternMatch| 197 |opposite?| 204 |one?| 210
              |odd?| 215 |nextItem| 220 |negative?| 225 |multiEuclidean| 230
              |mulmod| 236 |min| 243 |maxint| 249 |max| 258 |mask| 264 |length|
              269 |leftRecip| 274 |leftPower| 279 |lcmCoef| 291 |lcm| 297
              |latex| 308 |invmod| 313 |init| 319 |inc| 323 |gcdPolynomial| 328
              |gcd| 334 |factorial| 345 |factor| 350 |extendedEuclidean| 355
              |exquo| 368 |expressIdealMember| 374 |even?| 380 |euclideanSize|
              385 |divide| 390 |differentiate| 396 |dec| 407 |copy| 412
              |convert| 417 |commutator| 442 |coerce| 448 |characteristic| 468
              |bit?| 472 |binomial| 478 |base| 484 |associator| 488
              |associates?| 495 |antiCommutator| 501 |annihilate?| 507 |addmod|
              513 |abs| 520 ^ 525 |Zero| 537 |One| 541 D 545 >= 556 > 562 = 568
              <= 574 < 580 - 586 + 597 * 603)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|IntegerNumberSystem&| |EuclideanDomain&| NIL
                |UniqueFactorizationDomain&| NIL NIL |GcdDomain&| NIL
                |OrderedRing&| NIL NIL |DifferentialRing&| NIL |EntireRing&|
                |Algebra&| NIL |NonAssociativeAlgebra&| |Rng&| NIL |Module&|
                NIL NIL NIL |NonAssociativeRing&| NIL NIL |NonAssociativeRng&|
                NIL NIL |AbelianGroup&| NIL NIL NIL NIL |OrderedSet&| NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&| NIL
                NIL NIL |Magma&| |AbelianSemiGroup&| NIL |RetractableTo&| NIL
                |SetCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |PartialOrder&| NIL NIL NIL |BasicType&| NIL)
             (CONS
              '#((|IntegerNumberSystem|) (|EuclideanDomain|)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|FortranMachineTypeCategory|) (|OrderedIntegralDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|OrderedRing|)
                 (|LeftOreRing|) (|CommutativeRing|) (|DifferentialRing|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| $$) (|Ring|)
                 (|NonAssociativeAlgebra| $$) (|Rng|) (|SemiRing|)
                 (|Module| $$) (|SemiRng|) (|OrderedAbelianGroup|)
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
                 (|CommutativeStar|) (|SetCategory|)
                 (|multiplicativeValuation|) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 39) (|ConvertibleTo| 38)
                 (|CombinatorialFunctionCategory|) (|ConvertibleTo| 37)
                 (|ConvertibleTo| 35) (|ConvertibleTo| 5) (|CoercibleFrom| 5)
                 (|PartialOrder|) (|noZeroDivisors|) (|TwoSidedRecip|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 44))
              (|makeByteWordVec2| 44
                                  '(2 14 11 12 13 15 1 19 0 18 20 2 0 25 0 0 1
                                    1 0 25 0 1 1 0 43 0 1 1 0 0 0 1 1 0 25 0 1
                                    2 0 0 0 0 1 2 0 40 0 0 1 3 0 0 0 0 0 1 1 0
                                    0 0 1 1 0 27 0 1 2 0 25 0 0 1 2 0 25 0 0 1
                                    1 0 5 0 1 2 0 0 0 0 1 0 0 0 1 1 0 40 0 1 2
                                    0 0 0 33 1 2 0 0 0 7 1 1 0 22 0 23 1 0 5 0
                                    21 2 0 0 0 0 1 1 0 40 0 1 1 0 42 0 1 1 0 25
                                    0 1 1 0 41 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 34
                                    18 1 1 0 25 0 1 3 0 0 0 0 0 1 2 0 0 0 0 1 1
                                    0 25 0 1 2 0 0 0 7 1 2 0 0 0 0 1 3 0 36 0
                                    37 36 1 2 0 25 0 0 1 1 0 25 0 1 1 0 25 0 1
                                    1 0 40 0 1 1 0 25 0 1 2 0 28 18 0 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 7 7 9 0 0 7 8 2 0 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 40 0 1 2 0 0 0
                                    33 1 2 0 0 0 7 1 2 0 24 0 0 1 2 0 0 0 0 1 1
                                    0 0 18 1 1 0 19 0 1 2 0 0 0 0 1 0 0 0 1 1 0
                                    0 0 1 2 0 26 26 26 1 2 0 0 0 0 1 1 0 0 18 1
                                    1 0 0 0 1 1 0 27 0 1 3 0 30 0 0 0 1 2 0 31
                                    0 0 1 2 0 40 0 0 1 2 0 28 18 0 1 1 0 25 0 1
                                    1 0 33 0 1 2 0 32 0 0 1 2 0 0 0 33 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 35 0 1 1 0 5 0
                                    1 1 0 37 0 1 1 0 38 0 1 1 0 39 0 1 2 0 0 0
                                    0 1 1 0 16 13 17 1 0 0 5 10 1 0 0 0 1 1 0
                                    44 0 1 0 0 33 1 2 0 25 0 0 1 2 0 0 0 0 1 0
                                    0 0 1 3 0 0 0 0 0 1 2 0 25 0 0 1 2 0 0 0 0
                                    1 2 0 25 0 0 1 3 0 0 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 33 1 2 0 0 0 7 1 0 0 0 1 0 0 0 1 2 0 0
                                    0 33 1 1 0 0 0 1 2 0 25 0 0 1 2 0 25 0 0 1
                                    2 0 25 0 0 1 2 0 25 0 0 1 2 0 25 0 0 1 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 33 0 1
                                    2 0 0 5 0 1 2 0 0 0 0 1 2 0 0 7 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|MachineInteger| 'NILADIC T) 
