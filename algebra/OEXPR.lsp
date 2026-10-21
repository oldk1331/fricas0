
(MAKEPROP '|OEXPR;retract;E%;1| '|SPADreplace| '(XLAM (|e|) |e|)) 

(SDEFUN |OEXPR;retract;E%;1| ((|e| (|Expression| (|Integer|))) (% (%))) |e|) 

(MAKEPROP '|OEXPR;coerce;%E;2| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |OEXPR;coerce;%E;2| ((|x| (%)) (% (|Expression| (|Integer|)))) |x|) 

(SDEFUN |OEXPR;retractIfCan;EU;3|
        ((|x| (|Expression| (|Integer|))) (% (|Union| % "failed")))
        (CONS 0 (SPADCALL |x| (QREFELT % 7)))) 

(SDEFUN |OEXPR;<;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (SPROG ((|di| (%)) (|s| (|Union| (|Integer|) "failed")))
               (SEQ (LETT |di| (SPADCALL |y| |x| (QREFELT % 11)))
                    (EXIT
                     (COND
                      ((SPADCALL |di| (|spadConstant| % 12) (QREFELT % 15))
                       NIL)
                      (#1='T
                       (SEQ (LETT |s| (SPADCALL |di| (QREFELT % 18)))
                            (EXIT
                             (COND ((QEQCAR |s| 0) (EQL (QCDR |s|) 1))
                                   (#1#
                                    (|error| "can not determine sign"))))))))))) 

(DECLAIM (NOTINLINE |OrderedExpression;|)) 

(DEFUN |OrderedExpression;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|OrderedExpression|))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|OrderedExpression| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6 (|Expression| (|Integer|)))
          %))) 

(DEFUN |OrderedExpression| ()
  (SPROG NIL
         (PROG (#1=#:G19)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|OrderedExpression|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|OrderedExpression|
                             (LIST
                              (CONS NIL (CONS 1 (|OrderedExpression;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|OrderedExpression|)))))))))) 

(MAKEPROP '|OrderedExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 23) '|Rep| |OEXPR;retract;E%;1|
              |OEXPR;coerce;%E;2| (|Union| % '"failed")
              |OEXPR;retractIfCan;EU;3| (0 . -) (6 . |0|) (10 . |0|)
              (|Boolean|) (14 . =) (|Union| 23 '"failed")
              (|ElementaryFunctionSign| 23 5) (20 . |sign|) |OEXPR;<;2%B;4|
              (|String|) (|OutputForm|) (|PositiveInteger|) (|Integer|)
              (|NonNegativeInteger|) (|Fraction| 23))
           '#(~= 25 |zero?| 31 |subtractIfCan| 36 |smaller?| 42 |sign| 48
              |sample| 53 |rightRecip| 57 |rightPower| 62 |retractIfCan| 74
              |retract| 79 |recip| 84 |positive?| 89 |plenaryPower| 94
              |opposite?| 100 |one?| 106 |negative?| 111 |min| 116 |max| 122
              |leftRecip| 128 |leftPower| 133 |latex| 145 |commutator| 150
              |coerce| 156 |characteristic| 176 |associator| 180
              |antiCommutator| 187 |annihilate?| 193 |abs| 199 ^ 204 >= 216 >
              222 = 228 <= 234 < 240 |1| 246 |0| 250 - 254 + 265 * 271)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL NIL NIL |Rng&| |NonAssociativeAlgebra&| NIL
                |Module&| NIL |NonAssociativeRing&| NIL NIL NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&|
                |OrderedAbelianSemiGroup&| NIL NIL NIL NIL |OrderedSet&|
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                NIL NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| NIL
                |SetCategory&| |RetractableFrom&| NIL |BasicType&| NIL
                |PartialOrder&| NIL NIL)
             (CONS
              '#((|Algebra| 25) (|OrderedRing|) (|Ring|) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| 25) (|SemiRng|) (|Module| 25)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|BiModule| 25 25)
                 (|LeftModule| $$) (|RightModule| $$) (|NonAssociativeRng|)
                 (|LeftModule| 25) (|RightModule| 25) (|AbelianGroup|)
                 (|OrderedAbelianSemiGroup|) (|OrderedMagmaWithZero|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|SemiGroup|)
                 (|Comparable|) (|MagmaWithZero|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|ComparableRepresentation|)
                 (|SetCategory|) (|RetractableFrom| 5) (|CoercibleTo| 21)
                 (|BasicType|) (|unitsKnown|) (|PartialOrder|)
                 (|CharacteristicZero|) (|CoercibleTo| 5))
              (|makeByteWordVec2| 25
                                  '(2 0 0 0 0 11 0 0 0 12 0 6 0 13 2 0 14 0 0
                                    15 1 17 16 5 18 2 0 14 0 0 1 1 0 14 0 1 2 0
                                    9 0 0 1 2 0 14 0 0 1 1 2 23 0 1 0 0 0 1 1 0
                                    9 0 1 2 0 0 0 22 1 2 0 0 0 24 1 1 0 9 5 10
                                    1 0 0 5 7 1 0 9 0 1 1 2 14 0 1 2 0 0 0 22 1
                                    2 0 14 0 0 1 1 0 14 0 1 1 2 14 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 9 0 1 2 0 0 0 22 1 2 0
                                    0 0 24 1 1 0 20 0 1 2 0 0 0 0 1 1 0 21 0 1
                                    1 0 0 23 1 1 0 0 25 1 1 0 5 0 8 0 0 24 1 3
                                    0 0 0 0 0 1 2 0 0 0 0 1 2 0 14 0 0 1 1 1 0
                                    0 1 2 0 0 0 22 1 2 0 0 0 24 1 2 0 14 0 0 1
                                    2 0 14 0 0 1 2 0 14 0 0 15 2 0 14 0 0 1 2 0
                                    14 0 0 19 0 0 0 1 0 0 0 12 2 0 0 0 0 11 1 0
                                    0 0 1 2 0 0 0 0 1 2 0 0 22 0 1 2 0 0 0 0 1
                                    2 0 0 23 0 1 2 0 0 24 0 1 2 0 0 25 0 1 2 0
                                    0 0 25 1)))))
           '|lookupComplete|)) 
