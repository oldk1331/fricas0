
(SDEFUN |OCT;0;%;1| ((% (%)))
        (CONS (|spadConstant| % 11) (|spadConstant| % 11))) 

(SDEFUN |OCT;1;%;2| ((% (%)))
        (CONS (|spadConstant| % 14) (|spadConstant| % 11))) 

(SDEFUN |OCT;real;%R;3| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 15))) 

(SDEFUN |OCT;imagi;%R;4| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 17))) 

(SDEFUN |OCT;imagj;%R;5| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 19))) 

(SDEFUN |OCT;imagk;%R;6| ((|x| (%)) (% (R)))
        (SPADCALL (QCAR |x|) (QREFELT % 21))) 

(SDEFUN |OCT;imagE;%R;7| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 15))) 

(SDEFUN |OCT;imagI;%R;8| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 17))) 

(SDEFUN |OCT;imagJ;%R;9| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 19))) 

(SDEFUN |OCT;imagK;%R;10| ((|x| (%)) (% (R)))
        (SPADCALL (QCDR |x|) (QREFELT % 21))) 

(SDEFUN |OCT;octon;8R%;11|
        ((|a| (R)) (|b| (R)) (|c| (R)) (|d| (R)) (|f| (R)) (|g| (R)) (|h| (R))
         (|i| (R)) (% (%)))
        (CONS (SPADCALL |a| |b| |c| |d| (QREFELT % 27))
              (SPADCALL |f| |g| |h| |i| (QREFELT % 27)))) 

(MAKEPROP '|OCT;octon;2Q%;12| '|SPADreplace| 'CONS) 

(SDEFUN |OCT;octon;2Q%;12|
        ((|p| (|Quaternion| R)) (|q| (|Quaternion| R)) (% (%))) (CONS |p| |q|)) 

(SDEFUN |OCT;coerce;Q%;13| ((|q| (|Quaternion| R)) (% (%)))
        (CONS |q| (|spadConstant| % 11))) 

(SDEFUN |OCT;retract;%Q;14| ((|x| (%)) (% (|Quaternion| R)))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 23)) (QREFELT % 32))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 24)) (QREFELT % 32))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 25)) (QREFELT % 32))
               (COND
                ((NULL (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 32)))
                 (EXIT
                  (|error| #1="Cannot retract octonion to quaternion.")))))
              (#2='T (EXIT (|error| #1#)))))
            (#2# (EXIT (|error| #1#)))))
          (#2# (EXIT (|error| #1#))))
         (EXIT
          (SPADCALL (SPADCALL |x| (QREFELT % 16)) (SPADCALL |x| (QREFELT % 18))
                    (SPADCALL |x| (QREFELT % 20)) (SPADCALL |x| (QREFELT % 22))
                    (QREFELT % 27))))) 

(SDEFUN |OCT;retractIfCan;%U;15|
        ((|x| (%)) (% (|Union| (|Quaternion| R) "failed")))
        (SEQ
         (COND
          ((SPADCALL (SPADCALL |x| (QREFELT % 23)) (QREFELT % 32))
           (COND
            ((SPADCALL (SPADCALL |x| (QREFELT % 24)) (QREFELT % 32))
             (COND
              ((SPADCALL (SPADCALL |x| (QREFELT % 25)) (QREFELT % 32))
               (COND
                ((NULL (SPADCALL (SPADCALL |x| (QREFELT % 26)) (QREFELT % 32)))
                 (EXIT (CONS 1 #1="failed")))))
              (#2='T (EXIT (CONS 1 #1#)))))
            (#2# (EXIT (CONS 1 #1#)))))
          (#2# (EXIT (CONS 1 #1#))))
         (EXIT
          (CONS 0
                (SPADCALL (SPADCALL |x| (QREFELT % 16))
                          (SPADCALL |x| (QREFELT % 18))
                          (SPADCALL |x| (QREFELT % 20))
                          (SPADCALL |x| (QREFELT % 22)) (QREFELT % 27)))))) 

(SDEFUN |OCT;*;3%;16| ((|x| (%)) (|y| (%)) (% (%)))
        (CONS
         (SPADCALL (SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 36))
                   (SPADCALL (SPADCALL (QCDR |y|) (QREFELT % 37)) (QCDR |x|)
                             (QREFELT % 36))
                   (QREFELT % 38))
         (SPADCALL (SPADCALL (QCDR |y|) (QCAR |x|) (QREFELT % 36))
                   (SPADCALL (QCDR |x|) (SPADCALL (QCAR |y|) (QREFELT % 37))
                             (QREFELT % 36))
                   (QREFELT % 39)))) 

(DECLAIM (NOTINLINE |Octonion;|)) 

(DEFUN |Octonion;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G69 NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Octonion| DV$1))
          (LETT % (GETREFV 71))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#1|
                                                             '(|Hashable|))
                                              (|HasCategory| |#1| '(|Finite|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (LETT #1#
                                                    (|HasCategory| |#1|
                                                                   '(|OrderedSet|)))
                                              (OR
                                               (|HasCategory| |#1| '(|Finite|))
                                               #1#)
                                              (|HasCategory| |#1|
                                                             (LIST
                                                              '|InnerEvalable|
                                                              '(|Symbol|)
                                                              (|devaluate|
                                                               |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Evalable|
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (|HasCategory| |#1|
                                                             (LIST '|Eltable|
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   (|devaluate|
                                                                    |#1|)))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (|HasCategory|
                                                (|Quaternion| |#1|)
                                                '(|RetractableTo|
                                                  (|Fraction| (|Integer|)))))
                                              (OR
                                               (|HasCategory| |#1|
                                                              '(|RetractableTo|
                                                                (|Integer|)))
                                               (|HasCategory|
                                                (|Quaternion| |#1|)
                                                '(|RetractableTo|
                                                  (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RealNumberSystem|))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|Octonion| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND #1# (|HasCategory| % '(|SetWithZero|))
               (|augmentPredVector| % 65536))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |e| (|Quaternion| |#1|))
                              (|:| E (|Quaternion| |#1|))))
          %))) 

(DEFUN |Octonion| (#1=#:G70)
  (SPROG NIL
         (PROG (#2=#:G71)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Octonion|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Octonion;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Octonion|)))))))))) 

(MAKEPROP '|Octonion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;0;%;1|) %))
              (0 . |0|) (|Quaternion| 6) (4 . |0|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |OCT;1;%;2|) %))
              (8 . |1|) (12 . |1|) (16 . |real|) |OCT;real;%R;3| (21 . |imagI|)
              |OCT;imagi;%R;4| (26 . |imagJ|) |OCT;imagj;%R;5| (31 . |imagK|)
              |OCT;imagk;%R;6| |OCT;imagE;%R;7| |OCT;imagI;%R;8|
              |OCT;imagJ;%R;9| |OCT;imagK;%R;10| (36 . |quatern|)
              |OCT;octon;8R%;11| |OCT;octon;2Q%;12| |OCT;coerce;Q%;13|
              (|Boolean|) (44 . |zero?|) |OCT;retract;%Q;14|
              (|Union| 10 '"failed") |OCT;retractIfCan;%U;15| (49 . *)
              (55 . |conjugate|) (60 . -) (66 . +) |OCT;*;3%;16| (|OutputForm|)
              (|String|) (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|) (|Vector| %) (|Vector| 50)
              (|List| (|Polynomial| 6)) (|Matrix| 6) (|Vector| 6)
              (|SparseUnivariatePolynomial| 6) (|Union| 6 '#1="failed")
              (|Mapping| 6 6) (|Fraction| 44) (|Union| 55 '#1#)
              (|Union| 44 '#1#) (|InputForm|) (|List| 6) (|List| 61)
              (|Equation| 6) (|SparseUnivariatePolynomial| (|Polynomial| 6))
              (|List| %) (|HashState|) (|SingleInteger|) (|Symbol|) (|List| 66)
              (|List| 51) (|Record| (|:| |particular| %) (|:| |basis| 63))
              (|Union| 69 '"failed"))
           '#(~= 72 |zero?| 78 |unit| 83 |subtractIfCan| 87
              |structuralConstants| 93 |someBasis| 102 |smaller?| 106 |size|
              112 |sign| 116 |sample| 121 |rightUnits| 125 |rightUnit| 129
              |rightTraceMatrix| 133 |rightTrace| 142
              |rightRegularRepresentation| 147 |rightRecip| 158
              |rightRankPolynomial| 163 |rightPower| 167 |rightNorm| 179
              |rightMinimalPolynomial| 184 |rightDiscriminant| 189
              |rightCharacteristicPolynomial| 198 |rightAlternative?| 203
              |retractIfCan| 207 |retract| 227 |represents| 247 |recip| 258
              |real| 263 |rationalIfCan| 268 |rational?| 273 |rational| 278
              |rank| 283 |random| 287 |powerAssociative?| 291 |positive?| 295
              |plenaryPower| 300 |opposite?| 306 |one?| 312 |octon| 317 |norm|
              335 |noncommutativeJordanAlgebra?| 340 |negative?| 344 |min| 349
              |max| 355 |map| 361 |lookup| 367 |lieAlgebra?| 372
              |lieAdmissible?| 376 |leftUnits| 380 |leftUnit| 384
              |leftTraceMatrix| 388 |leftTrace| 397 |leftRegularRepresentation|
              402 |leftRecip| 413 |leftRankPolynomial| 418 |leftPower| 422
              |leftNorm| 434 |leftMinimalPolynomial| 439 |leftDiscriminant| 444
              |leftCharacteristicPolynomial| 453 |leftAlternative?| 458 |latex|
              462 |jordanAlgebra?| 467 |jordanAdmissible?| 471
              |jacobiIdentity?| 475 |inv| 479 |index| 484 |imagk| 489 |imagj|
              494 |imagi| 499 |imagK| 504 |imagJ| 509 |imagI| 514 |imagE| 519
              |hashUpdate!| 524 |hash| 530 |flexible?| 535 |eval| 539
              |enumerate| 579 |elt| 583 |coordinates| 595 |convert| 617
              |conjugate| 632 |conditionsForIdempotents| 637 |commutator| 646
              |commutative?| 652 |coerce| 656 |characteristic| 681 |basis| 685
              |associatorDependence| 689 |associator| 693 |associative?| 700
              |apply| 704 |antiCommutator| 710 |antiCommutative?| 716
              |antiAssociative?| 720 |alternative?| 724 |abs| 728 ^ 733 >= 745
              > 751 = 757 <= 763 < 769 |1| 775 |0| 779 - 783 + 794 * 800)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 7 3 0 0 8 0 0 0 8 0 0
                                  0 0 0 0 13 12 10 2 0 0 0 13 12 11 10 9 7 6 5
                                  4 1 0 0 0 0))
            (CONS
             '#(|OctonionCategory&| |FramedNonAssociativeAlgebra&|
                |FiniteRankNonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |Module&| NIL |FramedModule&| |NonAssociativeRing&| NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| |OrderedSet&| |Finite&|
                NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |AbelianSemiGroup&| |SetWithZero&|
                |Magma&| |FullyRetractableTo&| |FullyEvalableOver&|
                |FullyRetractableTo&| |RetractableTo&| |RetractableTo&|
                |Evalable&| |Hashable&| |SetCategory&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |InnerEvalable&| |InnerEvalable&|
                |PartialOrder&| NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|OctonionCategory| 6) (|FramedNonAssociativeAlgebra| 6)
                 (|FiniteRankNonAssociativeAlgebra| 6)
                 (|NonAssociativeAlgebra| 6) (|Module| 6) (|BiModule| 6 6)
                 (|FramedModule| 6) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|AbelianGroup|)
                 (|OrderedSet|) (|Finite|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyRetractableTo| 6)
                 (|FullyEvalableOver| 6)
                 (|FullyRetractableTo| (|Quaternion| 6)) (|RetractableTo| 44)
                 (|RetractableTo| 55) (|Evalable| 6) (|Hashable|)
                 (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| (|Quaternion| 6)) (|CoercibleFrom| 44)
                 (|CoercibleFrom| 55) (|Eltable| 6 $$) (|InnerEvalable| 6 6)
                 (|InnerEvalable| 66 6) (|PartialOrder|) (|ConvertibleTo| 58)
                 (|CharacteristicZero|) (|CharacteristicNonZero|)
                 (|unitsKnown|) (|CoercibleTo| 41) (|BasicType|)
                 (|CoercibleFrom| 6) (|CoercibleFrom| (|Quaternion| 6)))
              (|makeByteWordVec2| 70
                                  '(0 6 0 9 0 10 0 11 0 6 0 13 0 10 0 14 1 10 6
                                    0 15 1 10 6 0 17 1 10 6 0 19 1 10 6 0 21 4
                                    10 0 6 6 6 6 27 1 6 31 0 32 2 10 0 0 0 36 1
                                    10 0 0 37 2 10 0 0 0 38 2 10 0 0 0 39 2 0
                                    31 0 0 1 1 0 31 0 1 0 1 45 1 2 0 45 0 0 1 1
                                    0 48 47 1 0 0 48 1 0 0 47 1 2 8 31 0 0 1 0
                                    3 46 1 1 17 44 0 1 0 0 0 1 0 1 70 1 0 1 45
                                    1 1 0 50 47 1 0 0 50 1 1 0 6 0 1 2 0 50 0
                                    47 1 1 0 50 0 1 1 0 45 0 1 0 16 62 1 2 0 0
                                    0 43 1 2 0 0 0 46 1 1 0 6 0 1 1 1 52 0 1 1
                                    0 6 47 1 0 0 6 1 1 0 52 0 1 0 0 31 1 1 0 53
                                    0 1 1 0 34 0 35 1 12 56 0 1 1 13 57 0 1 1 0
                                    6 0 1 1 0 10 0 33 1 12 55 0 1 1 13 44 0 1 2
                                    0 0 51 47 1 1 0 0 51 1 1 0 45 0 1 1 0 6 0
                                    16 1 15 56 0 1 1 15 31 0 1 1 15 55 0 1 0 0
                                    43 1 0 3 0 1 0 0 31 1 1 17 31 0 1 2 0 0 0
                                    43 1 2 0 31 0 0 1 1 0 31 0 1 8 0 0 6 6 6 6
                                    6 6 6 6 28 2 0 0 10 10 29 1 0 6 0 1 0 0 31
                                    1 1 17 31 0 1 2 7 0 0 0 1 2 7 0 0 0 1 2 0 0
                                    54 0 1 1 3 43 0 1 0 0 31 1 0 0 31 1 0 1 70
                                    1 0 1 45 1 1 0 50 47 1 0 0 50 1 1 0 6 0 1 2
                                    0 50 0 47 1 1 0 50 0 1 1 0 45 0 1 0 16 62 1
                                    2 0 0 0 43 1 2 0 0 0 46 1 1 0 6 0 1 1 1 52
                                    0 1 1 0 6 47 1 0 0 6 1 1 0 52 0 1 0 0 31 1
                                    1 0 42 0 1 0 0 31 1 0 0 31 1 0 0 31 1 1 16
                                    0 0 1 1 3 0 43 1 1 0 6 0 22 1 0 6 0 20 1 0
                                    6 0 18 1 0 6 0 26 1 0 6 0 25 1 0 6 0 24 1 0
                                    6 0 23 2 2 64 64 0 1 1 2 65 0 1 0 0 31 1 3
                                    10 0 0 6 6 1 3 10 0 0 59 59 1 2 10 0 0 60 1
                                    2 10 0 0 61 1 3 9 0 0 66 6 1 3 9 0 0 67 59
                                    1 0 3 63 1 2 0 6 0 44 1 2 11 0 0 6 1 2 0 51
                                    0 47 1 2 0 50 47 47 1 1 0 50 47 1 1 0 51 0
                                    1 1 0 0 51 1 1 0 51 0 1 1 6 58 0 1 1 0 0 0
                                    1 1 0 49 47 1 0 0 49 1 2 0 0 0 0 1 0 0 31 1
                                    1 0 41 0 1 1 0 0 44 1 1 0 0 6 1 1 0 0 10 30
                                    1 12 0 55 1 0 0 46 1 0 0 47 1 0 1 68 1 3 0
                                    0 0 0 0 1 0 0 31 1 2 0 0 50 0 1 2 0 0 0 0 1
                                    0 0 31 1 0 0 31 1 0 0 31 1 1 14 6 0 1 2 0 0
                                    0 43 1 2 0 0 0 46 1 2 7 31 0 0 1 2 7 31 0 0
                                    1 2 0 31 0 0 1 2 7 31 0 0 1 2 7 31 0 0 1 0
                                    0 0 12 0 0 0 8 2 0 0 0 0 1 1 0 0 0 1 2 0 0
                                    0 0 1 2 0 0 43 0 1 2 0 0 0 0 40 2 0 0 44 0
                                    1 2 0 0 46 0 1 2 0 0 6 0 1 2 0 0 0 6 1)))))
           '|lookupComplete|)) 
