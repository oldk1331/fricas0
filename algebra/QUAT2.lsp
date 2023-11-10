
(SDEFUN |QUAT2;Zero;%;1| ((% (%)))
        (VECTOR (|spadConstant| % 10) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(SDEFUN |QUAT2;One;%;2| ((% (%)))
        (VECTOR (|spadConstant| % 12) (|spadConstant| % 10)
                (|spadConstant| % 10) (|spadConstant| % 10))) 

(PUT '|QUAT2;real;%R;3| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 0))) 

(SDEFUN |QUAT2;real;%R;3| ((|x| (%)) (% (R))) (QVELT |x| 0)) 

(PUT '|QUAT2;imagI;%R;4| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 1))) 

(SDEFUN |QUAT2;imagI;%R;4| ((|x| (%)) (% (R))) (QVELT |x| 1)) 

(PUT '|QUAT2;imagJ;%R;5| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 2))) 

(SDEFUN |QUAT2;imagJ;%R;5| ((|x| (%)) (% (R))) (QVELT |x| 2)) 

(PUT '|QUAT2;imagK;%R;6| '|SPADreplace| '(XLAM (|x|) (QVELT |x| 3))) 

(SDEFUN |QUAT2;imagK;%R;6| ((|x| (%)) (% (R))) (QVELT |x| 3)) 

(PUT '|QUAT2;quatern;4R%;7| '|SPADreplace| 'VECTOR) 

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

(DEFUN |GeneralQuaternion| (&REST #1=#:G475)
  (SPROG NIL
         (PROG (#2=#:G476)
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

(DEFUN |GeneralQuaternion;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G474 NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
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
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1|
                                                       '(|ConvertibleTo|
                                                         (|InputForm|)))
                                        (|HasCategory| |#1| '(|Field|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|EntireRing|)))
                                        (OR #1#
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
                                                       '(|IntegerNumberSystem|))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1| '(|Field|)))))))
    (|haddProp| |$ConstructorCache| '|GeneralQuaternion| (LIST DV$1 DV$2 DV$3)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 9
              (|Record| (|:| |r| |#1|) (|:| |i| |#1|) (|:| |j| |#1|)
                        (|:| |k| |#1|)))
    %))) 

(MAKEPROP '|GeneralQuaternion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|Rep| (0 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;Zero;%;1|) %))
              (4 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |QUAT2;One;%;2|) %))
              |QUAT2;real;%R;3| |QUAT2;imagI;%R;4| |QUAT2;imagJ;%R;5|
              |QUAT2;imagK;%R;6| |QUAT2;quatern;4R%;7| (8 . *) (14 . +)
              (20 . -) |QUAT2;*;3%;8| (|Fraction| 32) (|Union| % '"failed")
              (|InputForm|) (|NonNegativeInteger|)
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Boolean|) (|List| 30) (|Equation| 6) (|List| 6) (|Integer|)
              (|List| 34) (|Symbol|) (|Union| 23 '"failed") (|Matrix| 32)
              (|Matrix| %) (|Record| (|:| |mat| 36) (|:| |vec| (|Vector| 32)))
              (|Vector| %) (|List| 26) (|Union| 32 '#1="failed") (|Matrix| 6)
              (|Record| (|:| |mat| 42) (|:| |vec| (|Vector| 6)))
              (|Mapping| 6 6) (|Union| 6 '#1#) (|PositiveInteger|)
              (|OutputForm|) (|String|))
           '#(~= 26 |zero?| 32 |unitNormal| 37 |unitCanonical| 42 |unit?| 47
              |subtractIfCan| 52 |smaller?| 58 |sample| 64 |rightRecip| 68
              |rightPower| 73 |retractIfCan| 85 |retract| 100 |reducedSystem|
              115 |recip| 137 |real| 142 |rationalIfCan| 147 |rational?| 152
              |rational| 157 |quatern| 162 |plenaryPower| 170 |opposite?| 176
              |one?| 182 |norm| 187 |min| 192 |max| 198 |map| 204 |leftRecip|
              210 |leftPower| 215 |latex| 227 |inv| 232 |imagK| 237 |imagJ| 242
              |imagI| 247 |exquo| 252 |eval| 258 |elt| 298 |differentiate| 304
              |convert| 354 |conjugate| 359 |commutator| 364 |coerce| 370
              |charthRoot| 390 |characteristic| 395 |associator| 399
              |associates?| 406 |antiCommutator| 412 |annihilate?| 418 |abs|
              424 ^ 429 |Zero| 447 |One| 451 D 455 >= 505 > 511 = 517 <= 523 <
              529 - 535 + 546 * 552)
           'NIL
           (CONS
            (|makeByteWordVec2| 15
                                '(0 0 4 0 1 2 6 4 10 11 0 0 0 0 4 0 0 0 4 0 0 0
                                  0 4 15 0 0 0 0 0 4 4 15 0 0 0 0 0 0 0 0 7 0 0
                                  0 0 7 0 0 8 9 13 0 0 0 0 3 5 4 7 8 9 12 13
                                  14))
            (CONS
             '#(|QuaternionCategory&| |DifferentialExtension&| |DivisionRing&|
                |Algebra&| NIL NIL |EntireRing&| |Algebra&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL |Rng&|
                |NonAssociativeAlgebra&| NIL |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL |NonAssociativeRng&|
                NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |OrderedSet&| |FullyEvalableOver&| |FullyRetractableTo&|
                |Magma&| |AbelianSemiGroup&| NIL |RetractableTo&|
                |SetCategory&| |RetractableTo&| |RetractableTo&| |Evalable&|
                NIL NIL |BasicType&| NIL NIL NIL NIL |PartialOrder&| NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL)
             (CONS
              '#((|QuaternionCategory| 6) (|DifferentialExtension| 6)
                 (|DivisionRing|) (|Algebra| 6) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|EntireRing|) (|Algebra| 23)
                 (|PartialDifferentialRing| 34) (|DifferentialRing|) (|Ring|)
                 (|Rng|) (|NonAssociativeAlgebra| 6) (|SemiRing|)
                 (|NonAssociativeAlgebra| 23) (|FullyLinearlyExplicitOver| 6)
                 (|Module| 6) (|SemiRng|) (|Module| 23)
                 (|LinearlyExplicitOver| 6) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$) (|BiModule| 23 23)
                 (|LinearlyExplicitOver| 32) (|RightModule| 6) (|LeftModule| 6)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 23) (|RightModule| 23) (|RightModule| 32)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|OrderedSet|)
                 (|FullyEvalableOver| 6) (|FullyRetractableTo| 6) (|Magma|)
                 (|AbelianSemiGroup|) (|Comparable|) (|RetractableTo| 6)
                 (|SetCategory|) (|RetractableTo| 23) (|RetractableTo| 32)
                 (|Evalable| 6) (|CoercibleFrom| 6) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 47) (|ConvertibleTo| 25)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|PartialOrder|)
                 (|CoercibleFrom| 23) (|CoercibleFrom| 32)
                 (|InnerEvalable| 34 6) (|InnerEvalable| 6 6) (|Eltable| 6 $$))
              (|makeByteWordVec2| 48
                                  '(0 6 0 10 0 6 0 12 2 6 0 0 0 19 2 6 0 0 0 20
                                    2 6 0 0 0 21 2 0 28 0 0 1 1 0 28 0 1 1 5 27
                                    0 1 1 5 0 0 1 1 5 28 0 1 2 0 24 0 0 1 2 7
                                    28 0 0 1 0 0 0 1 1 0 24 0 1 2 0 0 0 26 1 2
                                    0 0 0 46 1 1 8 35 0 1 1 9 41 0 1 1 0 45 0 1
                                    1 8 23 0 1 1 9 32 0 1 1 0 6 0 1 1 15 36 37
                                    1 2 15 38 37 39 1 1 0 42 37 1 2 0 43 37 39
                                    1 1 0 24 0 1 1 0 6 0 14 1 17 35 0 1 1 17 28
                                    0 1 1 17 23 0 1 4 0 0 6 6 6 6 18 2 0 0 0 46
                                    1 2 0 28 0 0 1 1 0 28 0 1 1 0 6 0 1 2 7 0 0
                                    0 1 2 7 0 0 0 1 2 0 0 44 0 1 1 0 24 0 1 2 0
                                    0 0 26 1 2 0 0 0 46 1 1 0 48 0 1 1 4 0 0 1
                                    1 0 6 0 17 1 0 6 0 16 1 0 6 0 15 2 5 24 0 0
                                    1 2 13 0 0 29 1 3 13 0 0 6 6 1 2 13 0 0 30
                                    1 3 13 0 0 31 31 1 3 12 0 0 33 31 1 3 12 0
                                    0 34 6 1 2 14 0 0 6 1 2 11 0 0 26 1 1 11 0
                                    0 1 3 10 0 0 33 40 1 2 10 0 0 33 1 3 10 0 0
                                    34 26 1 2 10 0 0 34 1 2 0 0 0 44 1 3 0 0 0
                                    44 26 1 1 3 25 0 1 1 0 0 0 1 2 0 0 0 0 1 1
                                    18 0 23 1 1 0 0 6 1 1 0 0 32 1 1 0 47 0 1 1
                                    1 24 0 1 0 0 26 1 3 0 0 0 0 0 1 2 5 28 0 0
                                    1 2 0 0 0 0 1 2 0 28 0 0 1 1 16 6 0 1 2 4 0
                                    0 32 1 2 0 0 0 26 1 2 0 0 0 46 1 0 0 0 11 0
                                    0 0 13 2 11 0 0 26 1 1 11 0 0 1 3 10 0 0 34
                                    26 1 3 10 0 0 33 40 1 2 10 0 0 34 1 2 10 0
                                    0 33 1 3 0 0 0 44 26 1 2 0 0 0 44 1 2 7 28
                                    0 0 1 2 7 28 0 0 1 2 0 28 0 0 1 2 7 28 0 0
                                    1 2 7 28 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    0 0 1 2 4 0 23 0 1 2 4 0 0 23 1 2 15 0 0 32
                                    1 2 0 0 0 6 1 2 0 0 6 0 1 2 0 0 26 0 1 2 0
                                    0 32 0 1 2 0 0 0 0 22 2 0 0 46 0 1)))))
           '|lookupComplete|)) 
