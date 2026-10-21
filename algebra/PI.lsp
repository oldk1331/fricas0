
(MAKEPROP '|PI;qcoerce;I%;1| '|SPADreplace| '(XLAM (|n|) |n|)) 

(SDEFUN |PI;qcoerce;I%;1| ((|n| (|Integer|)) (% (%))) |n|) 

(DECLAIM (NOTINLINE |PositiveInteger;|)) 

(DEFUN |PositiveInteger;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|PositiveInteger|))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|PositiveInteger| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |PositiveInteger| ()
  (SPROG NIL
         (PROG (#1=#:G5)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|PositiveInteger|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|PositiveInteger|
                             (LIST (CONS NIL (CONS 1 (|PositiveInteger;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|PositiveInteger|)))))))))) 

(MAKEPROP '|PositiveInteger| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Integer|)
              |PI;qcoerce;I%;1| (|Boolean|) (|OutputForm|) (|String|)
              (|PositiveInteger|) (|Union| % '"failed") (|InputForm|)
              (|SingleInteger|) (|HashState|))
           '#(~= 0 |smaller?| 6 |sign| 12 |sample| 17 |rightRecip| 21
              |rightPower| 26 |recip| 38 |qcoerce| 43 |positive?| 48 |one?| 53
              |negative?| 58 |min| 63 |max| 69 |leftRecip| 75 |leftPower| 80
              |latex| 92 |hashUpdate!| 97 |hash| 103 |gcd| 108 |convert| 114
              |coerce| 119 |abs| 124 ^ 129 >= 141 > 147 = 153 <= 159 < 165 |1|
              171 + 175 * 181)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(|OrderedAbelianSemiGroup&| NIL |OrderedSet&| NIL
                     |MagmaWithUnit&| NIL NIL |Magma&| NIL |AbelianSemiGroup&|
                     |SetCategory&| NIL |Hashable&| NIL |BasicType&|
                     |PartialOrder&| NIL NIL)
                  (CONS
                   '#((|OrderedAbelianSemiGroup|) (|OrderedMagma|)
                      (|OrderedSet|) (|Monoid|) (|MagmaWithUnit|)
                      (|Comparable|) (|SemiGroup|) (|Magma|)
                      (|ComparableRepresentation|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|CommutativeStar|) (|Hashable|)
                      (|CoercibleTo| 9) (|BasicType|) (|PartialOrder|)
                      (|TwoSidedRecip|) (|ConvertibleTo| 13))
                   (|makeByteWordVec2| 15
                                       '(2 0 8 0 0 1 2 0 8 0 0 1 1 2 6 0 1 0 0
                                         0 1 1 0 12 0 1 2 0 0 0 11 1 2 0 0 0 5
                                         1 1 0 12 0 1 1 0 0 6 7 1 2 8 0 1 1 0 8
                                         0 1 1 2 8 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                         1 0 12 0 1 2 0 0 0 11 1 2 0 0 0 5 1 1
                                         0 10 0 1 2 0 15 15 0 1 1 0 14 0 1 2 0
                                         0 0 0 1 1 0 13 0 1 1 0 9 0 1 1 1 0 0 1
                                         2 0 0 0 11 1 2 0 0 0 5 1 2 0 8 0 0 1 2
                                         0 8 0 0 1 2 0 8 0 0 1 2 0 8 0 0 1 2 0
                                         8 0 0 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                         1 2 0 0 11 0 1)))))
           '|lookupComplete|)) 
