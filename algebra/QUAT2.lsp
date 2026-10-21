
(SDEFUN |QUAT2;0;%;1| ((% (%)))
        (VECTOR (|spadConstant| % 10) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(SDEFUN |QUAT2;1;%;2| ((% (%)))
        (VECTOR (|spadConstant| % 12) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(MAKEPROP '|QUAT2;real;%R;3| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QUAT2;real;%R;3| ((|x| (%)) (% (R))) (QVELT |x| 0)) 

(MAKEPROP '|QUAT2;imagI;%R;4| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QUAT2;imagI;%R;4| ((|x| (%)) (% (R))) (QVELT |x| 1)) 

(MAKEPROP '|QUAT2;imagJ;%R;5| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QUAT2;imagJ;%R;5| ((|x| (%)) (% (R))) (QVELT |x| 2)) 

(MAKEPROP '|QUAT2;imagK;%R;6| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 3))) 

(SDEFUN |QUAT2;imagK;%R;6| ((|x| (%)) (% (R))) (QVELT |x| 3)) 

(MAKEPROP '|QUAT2;quatern;4R%;7| '|SPADreplace| 'VECTOR) 

(SDEFUN |QUAT2;quatern;4R%;7| ((|a| (R)) (|b| (R)) (|c| (R)) (|d| (R)) (% (%)))
        (VECTOR |a| |b| |c| |d|)) 

(SDEFUN |QUAT2;*;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (VECTOR
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 0) (QREFELT % 19))
                     (SPADCALL
                      (SPADCALL (QREFELT % 7) (QVELT |x| 1) (QREFELT % 19))
                      (QVELT |y| 1) (QREFELT % 19))
                     (QREFELT % 20))
           (SPADCALL (SPADCALL (QREFELT % 8) (QVELT |x| 2) (QREFELT % 19))
                     (QVELT |y| 2) (QREFELT % 19))
           (QREFELT % 20))
          (SPADCALL
           (SPADCALL (SPADCALL (QREFELT % 7) (QREFELT % 8) (QREFELT % 19))
                     (QVELT |x| 3) (QREFELT % 19))
           (QVELT |y| 3) (QREFELT % 19))
          (QREFELT % 21))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 1) (QREFELT % 19))
                    (SPADCALL (QVELT |x| 1) (QVELT |y| 0) (QREFELT % 19))
                    (QREFELT % 20))
          (SPADCALL (QREFELT % 8)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 2) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 2) (QVELT |y| 3) (QREFELT % 19))
                     (QREFELT % 21))
                    (QREFELT % 19))
          (QREFELT % 20))
         (SPADCALL
          (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 2) (QREFELT % 19))
                    (SPADCALL (QVELT |x| 2) (QVELT |y| 0) (QREFELT % 19))
                    (QREFELT % 20))
          (SPADCALL (QREFELT % 7)
                    (SPADCALL
                     (SPADCALL (QVELT |x| 1) (QVELT |y| 3) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 1) (QREFELT % 19))
                     (QREFELT % 21))
                    (QREFELT % 19))
          (QREFELT % 20))
         (SPADCALL
          (SPADCALL
           (SPADCALL (SPADCALL (QVELT |x| 0) (QVELT |y| 3) (QREFELT % 19))
                     (SPADCALL (QVELT |x| 3) (QVELT |y| 0) (QREFELT % 19))
                     (QREFELT % 20))
           (SPADCALL (QVELT |x| 1) (QVELT |y| 2) (QREFELT % 19))
           (QREFELT % 20))
          (SPADCALL (QVELT |x| 2) (QVELT |y| 1) (QREFELT % 19))
          (QREFELT % 21)))) 

(DECLAIM (NOTINLINE |GeneralQuaternion;|)) 

(DEFUN |GeneralQuaternion;| (|#1| |#2| |#3|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (|dv$| NIL) (% NIL) (#1=#:G26 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 |#2|)
    (LETT DV$3 |#3|)
    (LETT |dv$| (LIST '|GeneralQuaternion| DV$1 DV$2 DV$3))
    (LETT % (GETREFV 49))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                        (OR #1#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (|HasCategory| |#1| '(|Field|)))
                                        (|HasCategory| |#1| '(|OrderedSet|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
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
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|RealNumberSystem|))
                                        (|HasCategory| |#1|
                                                       '(|IntegerNumberSystem|))))))
    (|haddProp| |$ConstructorCache| '|GeneralQuaternion| (LIST DV$1 DV$2 DV$3)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (AND (|HasCategory| |#1| '(|Field|))
         (|HasCategory| % '(|CharacteristicZero|))
         (|augmentPredVector| % 262144))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Fraction| (|Integer|))))
         (AND (|HasCategory| |#1| '(|Field|))
              (|HasCategory| % '(|CharacteristicZero|))))
     (|augmentPredVector| % 524288))
    (AND (|HasCategory| |#1| '(|OrderedSet|))
         (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1048576))
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9
              (|Record| (|:| |r| |#1|) (|:| |i| |#1|) (|:| |j| |#1|)
                        (|:| |k| |#1|)))
    %))) 

(DEFUN |GeneralQuaternion| (&REST #1=#:G27)
  (SPROG NIL
         (PROG (#2=#:G28)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T NIL NIL))
                     (HGET |$ConstructorCache| '|GeneralQuaternion|)
                     '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |GeneralQuaternion;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GeneralQuaternion|)))))))))) 

(MAKEPROP '|GeneralQuaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (0 . |0|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;0;%;1|) %))
              (4 . |1|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;1;%;2|) %))
              |QUAT2;real;%R;3| |QUAT2;imagI;%R;4| |QUAT2;imagJ;%R;5|
              |QUAT2;imagK;%R;6| |QUAT2;quatern;4R%;7| (8 . *) (14 . +)
              (20 . -) |QUAT2;*;3%;8| (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|Integer|) (|Union| % '"failed")
              (|NonNegativeInteger|) (|Union| 6 '#1="failed") (|Mapping| 6 6)
              (|Record| (|:| |mat| 35) (|:| |vec| (|Vector| 6))) (|Matrix| %)
              (|Vector| %) (|Matrix| 6) (|Fraction| 27) (|InputForm|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|List| 6) (|List| 41) (|Equation| 6) (|List| 43) (|Symbol|)
              (|Union| 36 '"failed") (|Matrix| 27)
              (|Record| (|:| |mat| 45) (|:| |vec| (|Vector| 27))) (|List| 29)
              (|Union| 27 '#1#))
           '#(~= 26 |zero?| 32 |unitNormal| 37 |unitCanonical| 42 |unit?| 47
              |subtractIfCan| 52 |smaller?| 58 |sign| 64 |sample| 69
              |rightRecip| 73 |rightPower| 78 |retractIfCan| 90 |retract| 105
              |reducedSystem| 120 |recip| 142 |real| 147 |rationalIfCan| 152
              |rational?| 157 |rational| 162 |quatern| 167 |positive?| 175
              |plenaryPower| 180 |opposite?| 186 |one?| 192 |norm| 197
              |negative?| 202 |min| 207 |max| 213 |map| 219 |leftRecip| 225
              |leftPower| 230 |latex| 242 |inv| 247 |imagK| 252 |imagJ| 257
              |imagI| 262 |exquo| 267 |eval| 273 |elt| 313 |differentiate| 319
              |convert| 369 |conjugate| 374 |commutator| 379 |coerce| 385
              |characteristic| 405 |associator| 409 |associates?| 416
              |antiCommutator| 422 |annihilate?| 428 |abs| 434 ^ 439 D 457 >=
              507 > 513 = 519 <= 525 < 531 |1| 537 |0| 541 - 545 + 556 * 562)
           'NIL
           (CONS
            (|makeByteWordVec2| 16
                                '(0 4 0 12 11 7 6 0 0 7 0 0 0 7 0 0 0 16 7 0 0
                                  0 0 16 7 7 0 0 0 0 0 0 8 0 0 0 8 0 0 0 0 8 0
                                  0 0 0 0 14 10 9 0 0 15 14 13 10 9 8 4 5 3 2 1
                                  0 0 0 0))
            (CONS
             '#(|QuaternionCategory&| |DivisionRing&| |DifferentialExtension&|
                |DifferentialRing&| |PartialDifferentialRing&| |Algebra&|
                |EntireRing&| |Algebra&| NIL |NonAssociativeAlgebra&| NIL
                |NonAssociativeAlgebra&| |Rng&| |Module&| NIL |Module&|
                |FullyLinearlyExplicitOver&| NIL NIL NIL |NonAssociativeRing&|
                NIL NIL NIL NIL NIL NIL NIL |NonAssociativeRng&| NIL NIL
                |AbelianGroup&| |OrderedSet&| NIL NIL NIL NIL |AbelianMonoid&|
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&|
                |FullyRetractableTo&| |FullyEvalableOver&| |Evalable&|
                |RetractableTo&| |RetractableTo&| |SetCategory&|
                |RetractableTo&| NIL |InnerEvalable&| |InnerEvalable&| NIL NIL
                |PartialOrder&| NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DivisionRing|)
                 (|DifferentialExtension| 6) (|DifferentialRing|)
                 (|PartialDifferentialRing| 43) (|Algebra| 36) (|EntireRing|)
                 (|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 36)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6) (|Rng|) (|Module| 36)
                 (|SemiRng|) (|Module| 6) (|FullyLinearlyExplicitOver| 6)
                 (|LinearlyExplicitOver| 27) (|BiModule| 36 36)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 6 6)
                 (|LinearlyExplicitOver| 6) (|RightModule| 27)
                 (|RightModule| 36) (|LeftModule| 36) (|LeftModule| $$)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| 6)
                 (|RightModule| 6) (|AbelianGroup|) (|OrderedSet|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|Comparable|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|ComparableRepresentation|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|FullyRetractableTo| 6)
                 (|FullyEvalableOver| 6) (|Evalable| 6) (|RetractableTo| 27)
                 (|RetractableTo| 36) (|SetCategory|) (|RetractableTo| 6)
                 (|Eltable| 6 $$) (|InnerEvalable| 6 6) (|InnerEvalable| 43 6)
                 (|CoercibleFrom| 27) (|CoercibleFrom| 36) (|PartialOrder|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|ConvertibleTo| 37)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CoercibleTo| 25) (|BasicType|) (|unitsKnown|)
                 (|CoercibleFrom| 6))
              (|makeByteWordVec2| 48
                                  '(0 6 0 10 0 6 0 12 2 6 0 0 0 19 2 6 0 0 0 20
                                    2 6 0 0 0 21 2 0 23 0 0 1 1 0 23 0 1 1 5 38
                                    0 1 1 5 0 0 1 1 5 23 0 1 2 0 28 0 0 1 2 8
                                    23 0 0 1 1 21 27 0 1 0 0 0 1 1 0 28 0 1 2 0
                                    0 0 26 1 2 0 0 0 29 1 1 0 30 0 1 1 9 44 0 1
                                    1 10 48 0 1 1 0 6 0 1 1 9 36 0 1 1 10 27 0
                                    1 2 0 32 33 34 1 1 0 35 33 1 1 16 45 33 1 2
                                    16 46 33 34 1 1 0 28 0 1 1 0 6 0 14 1 18 44
                                    0 1 1 18 23 0 1 1 18 36 0 1 4 0 0 6 6 6 6
                                    18 1 21 23 0 1 2 0 0 0 26 1 2 0 23 0 0 1 1
                                    0 23 0 1 1 0 6 0 1 1 21 23 0 1 2 8 0 0 0 1
                                    2 8 0 0 0 1 2 0 0 31 0 1 1 0 28 0 1 2 0 0 0
                                    26 1 2 0 0 0 29 1 1 0 24 0 1 1 4 0 0 1 1 0
                                    6 0 17 1 0 6 0 16 1 0 6 0 15 2 5 28 0 0 1 3
                                    14 0 0 39 39 1 3 14 0 0 6 6 1 2 14 0 0 40 1
                                    2 14 0 0 41 1 3 13 0 0 42 39 1 3 13 0 0 43
                                    6 1 2 15 0 0 6 1 3 0 0 0 31 29 1 2 0 0 0 31
                                    1 1 12 0 0 1 2 12 0 0 29 1 2 11 0 0 43 1 2
                                    11 0 0 42 1 3 11 0 0 42 47 1 3 11 0 0 43 29
                                    1 1 3 37 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 25 0
                                    1 1 0 0 27 1 1 0 0 6 1 1 20 0 36 1 0 0 29 1
                                    3 0 0 0 0 0 1 2 5 23 0 0 1 2 0 0 0 0 1 2 0
                                    23 0 0 1 1 17 6 0 1 2 0 0 0 26 1 2 0 0 0 29
                                    1 2 4 0 0 27 1 3 0 0 0 31 29 1 2 0 0 0 31 1
                                    1 12 0 0 1 2 12 0 0 29 1 2 11 0 0 43 1 3 11
                                    0 0 43 29 1 2 11 0 0 42 1 3 11 0 0 42 47 1
                                    2 8 23 0 0 1 2 8 23 0 0 1 2 0 23 0 0 1 2 8
                                    23 0 0 1 2 8 23 0 0 1 0 0 0 13 0 0 0 11 2 0
                                    0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 26 0 1
                                    2 0 0 0 0 22 2 0 0 27 0 1 2 0 0 29 0 1 2 0
                                    0 6 0 1 2 0 0 0 6 1 2 19 0 36 0 1 2 19 0 0
                                    36 1 2 16 0 0 27 1)))))
           '|lookupComplete|)) 
