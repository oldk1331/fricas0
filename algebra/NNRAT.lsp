
(SDEFUN |NNRAT;sup;3%;1| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 10))) 

(SDEFUN |NNRAT;inf;3%;2| ((|x| (%)) (|y| (%)) (% (%)))
        (SPADCALL |x| |y| (QREFELT % 12))) 

(SDEFUN |NNRAT;subtractIfCan;2%U;3|
        ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (SPROG ((|c| (|Fraction| (|Integer|))))
               (SEQ (LETT |c| (SPADCALL |x| |y| (QREFELT % 14)))
                    (EXIT
                     (COND
                      ((SPADCALL |c| (|spadConstant| % 7) (QREFELT % 15))
                       (CONS 1 "failed"))
                      ('T (CONS 0 |c|))))))) 

(DECLAIM (NOTINLINE |NonNegativeRational;|)) 

(DEFUN |NonNegativeRational;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|NonNegativeRational|))
          (LETT % (GETREFV 24))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NonNegativeRational| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 2))
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |NonNegativeRational| ()
  (SPROG NIL
         (PROG (#1=#:G11)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|NonNegativeRational|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|NonNegativeRational|
                             (LIST
                              (CONS NIL (CONS 1 (|NonNegativeRational;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|NonNegativeRational|)))))))))) 

(MAKEPROP '|NonNegativeRational| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Fraction| 23) (0 . |0|) (4 . |0|)
              (|Boolean|) (8 . >=) (14 . |max|) |NNRAT;sup;3%;1| (20 . |min|)
              |NNRAT;inf;3%;2| (26 . -) (32 . <) (|Union| % '"failed")
              |NNRAT;subtractIfCan;2%U;3| (|OutputForm|) (|String|)
              (|PositiveInteger|) (|NonNegativeInteger|) (|InputForm|)
              (|Integer|))
           '#(~= 38 |zero?| 44 |sup| 49 |subtractIfCan| 55 |smaller?| 61 |sign|
              67 |sample| 72 |rightRecip| 76 |rightPower| 81 |recip| 93
              |positive?| 98 |opposite?| 103 |one?| 109 |negative?| 114 |min|
              119 |max| 125 |leftRecip| 131 |leftPower| 136 |latex| 148 |inf|
              153 |convert| 159 |coerce| 164 |antiCommutator| 169 |abs| 175 ^
              180 >= 192 > 198 = 204 <= 210 < 216 |1| 222 |0| 226 - 230 + 241 *
              247)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0))
            (CONS
             '#(NIL NIL NIL NIL NIL NIL NIL |OrderedAbelianSemiGroup&| NIL
                |OrderedSet&| NIL NIL |AbelianMonoid&| NIL NIL
                |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| NIL |Magma&| |SetCategory&|
                NIL NIL |PartialOrder&| |BasicType&| NIL NIL)
             (CONS
              '#((|SemiRing|) (|SemiRng|) (|BiModule| $$ $$) (|LeftModule| $$)
                 (|RightModule| $$) (|OrderedAbelianMonoidSup|)
                 (|OrderedMagmaWithZero|) (|OrderedAbelianSemiGroup|)
                 (|CancellationAbelianMonoid|) (|OrderedSet|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|AbelianMonoid|)
                 (|Comparable|) (|MagmaWithZero|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|ComparableRepresentation|) (|Magma|)
                 (|SetCategory|) (|CommutativeStar|) (|CoercibleTo| 18)
                 (|PartialOrder|) (|BasicType|) (|TwoSidedRecip|)
                 (|ConvertibleTo| 22))
              (|makeByteWordVec2| 23
                                  '(0 0 0 6 0 5 0 7 2 5 8 0 0 9 2 0 0 0 0 10 2
                                    0 0 0 0 12 2 5 0 0 0 14 2 5 8 0 0 15 2 0 8
                                    0 0 1 1 0 8 0 1 2 0 0 0 0 11 2 0 16 0 0 17
                                    2 0 8 0 0 1 1 1 23 0 1 0 0 0 1 1 0 16 0 1 2
                                    0 0 0 20 1 2 0 0 0 21 1 1 0 16 0 1 1 1 8 0
                                    1 2 0 8 0 0 1 1 0 8 0 1 1 1 8 0 1 2 0 0 0 0
                                    12 2 0 0 0 0 10 1 0 16 0 1 2 0 0 0 20 1 2 0
                                    0 0 21 1 1 0 19 0 1 2 0 0 0 0 13 1 0 22 0 1
                                    1 0 18 0 1 2 0 0 0 0 1 1 2 0 0 1 2 0 0 0 20
                                    1 2 0 0 0 21 1 2 0 8 0 0 1 2 0 8 0 0 1 2 0
                                    8 0 0 1 2 0 8 0 0 1 2 0 8 0 0 1 0 0 0 1 0 0
                                    0 6 1 2 0 0 1 2 2 0 0 0 1 2 0 0 0 0 1 2 0 0
                                    20 0 1 2 0 0 21 0 1 2 0 0 0 0 1 2 2 0 23 0
                                    1)))))
           '|lookupComplete|)) 
