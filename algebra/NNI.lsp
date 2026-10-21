
(MAKEPROP '|NNI;sup;3%;1| '|SPADreplace| 'MAX) 

(SDEFUN |NNI;sup;3%;1| ((|x| (%)) (|y| (%)) (% (%))) (MAX |x| |y|)) 

(MAKEPROP '|NNI;inf;3%;2| '|SPADreplace| 'MIN) 

(SDEFUN |NNI;inf;3%;2| ((|x| (%)) (|y| (%)) (% (%))) (MIN |x| |y|)) 

(MAKEPROP '|NNI;shift;%I%;3| '|SPADreplace| 'ASH) 

(SDEFUN |NNI;shift;%I%;3| ((|x| (%)) (|n| (|Integer|)) (% (%))) (ASH |x| |n|)) 

(MAKEPROP '|NNI;qcoerce;I%;4| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |NNI;qcoerce;I%;4| ((|n| (|Integer|)) (% (%))) |n|) 

(SDEFUN |NNI;subtractIfCan;2%U;5|
        ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|c| (|Integer|)))
               (SEQ (LETT |c| (- |x| |y|))
                    (EXIT
                     (COND ((< |c| 0) (CONS 1 "failed")) ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeInteger;|)) 

(DEFUN |NonNegativeInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeInteger|))
          (LETT % (GETREFV 21))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NonNegativeInteger| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |NonNegativeInteger| ()
  (SPROG NIL
         (PROG (#1=#:G14)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NonNegativeInteger|
                             (LIST
                              (CONS NIL (CONS 1 (|NonNegativeInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NonNegativeInteger|)))))))))) 

(MAKEPROP '|NonNegativeInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) |NNI;sup;3%;1| |NNI;inf;3%;2|
              |NNI;shift;%I%;3| |NNI;qcoerce;I%;4| (|Union| % '"failed")
              |NNI;subtractIfCan;2%U;5| (|Boolean|) (|String|) (|OutputForm|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|SingleInteger|)
              (|HashState|) (|InputForm|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %)))
           '#(~= 0 |zero?| 6 |sup| 11 |subtractIfCan| 17 |smaller?| 23 |sign|
              29 |shift| 34 |sample| 40 |rightRecip| 44 |rightPower| 49 |rem|
              61 |recip| 67 |random| 72 |quo| 77 |qcoerce| 83 |positive?| 88
              |opposite?| 93 |one?| 99 |negative?| 104 |min| 109 |max| 115
              |leftRecip| 121 |leftPower| 126 |latex| 138 |inf| 143
              |hashUpdate!| 149 |hash| 155 |gcd| 160 |exquo| 166 |divide| 172
              |convert| 178 |coerce| 183 |antiCommutator| 188 |abs| 194 ^ 199
              >= 211 > 217 = 223 <= 229 < 235 |1| 241 |0| 245 - 249 + 260 *
              266)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL |OrderedAbelianSemiGroup&| NIL
                |OrderedSet&| NIL NIL |AbelianMonoid&| NIL NIL
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| NIL |Magma&| |SetCategory&|
                |Hashable&| NIL NIL |PartialOrder&| |BasicType&| NIL NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|BiModule| $$ $$) (|LeftModule| $$)
                 (|RightModule| $$) (|OrderedAbelianMonoidSup|)
                 (|OrderedMagmaWithZero|) (|OrderedAbelianSemiGroup|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|AbelianMonoid|)
                 (|Comparable|) (|MagmaWithZero|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|ComparableRepresentation|) (|Magma|)
                 (|SetCategory|) (|Hashable|) (|CommutativeStar|)
                 (|CoercibleTo| 14) (|PartialOrder|) (|BasicType|)
                 (|TwoSidedRecip|) (|ConvertibleTo| 19))
              (|makeByteWordVec2| 20
                                  '(2 0 12 0 0 1 1 0 12 0 1 2 0 0 0 0 6 2 0 10
                                    0 0 11 2 0 12 0 0 1 1 1 5 0 1 2 0 0 0 5 8 0
                                    0 0 1 1 0 10 0 1 2 0 0 0 15 1 2 0 0 0 16 1
                                    2 0 0 0 0 1 1 0 10 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 5 9 1 1 12 0 1 2 0 12 0 0 1 1 0 12
                                    0 1 1 1 12 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    10 0 1 2 0 0 0 15 1 2 0 0 0 16 1 1 0 13 0 1
                                    2 0 0 0 0 7 2 0 18 18 0 1 1 0 17 0 1 2 0 0
                                    0 0 1 2 0 10 0 0 1 2 0 20 0 0 1 1 0 19 0 1
                                    1 0 14 0 1 2 0 0 0 0 1 1 2 0 0 1 2 0 0 0 15
                                    1 2 0 0 0 16 1 2 0 12 0 0 1 2 0 12 0 0 1 2
                                    0 12 0 0 1 2 0 12 0 0 1 2 0 12 0 0 1 0 0 0
                                    1 0 0 0 1 1 2 0 0 1 2 2 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 15 0 1 2 0 0 16 0 1 2 0 0 0 0 1 2 2 0
                                    5 0 1)))))
           '|lookupComplete|)) 
