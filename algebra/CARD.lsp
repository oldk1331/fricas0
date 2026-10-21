
(MAKEPROP '|CARD;0;%;1| '|SPADreplace| '(XLAM NIL (CONS -1 0))) 

(SDEFUN |CARD;0;%;1| ((% (%))) (CONS -1 0)) 

(MAKEPROP '|CARD;1;%;2| '|SPADreplace| '(XLAM NIL (CONS -1 1))) 

(SDEFUN |CARD;1;%;2| ((% (%))) (CONS -1 1)) 

(MAKEPROP '|CARD;coerce;Nni%;3| '|SPADreplace| '(XLAM (|n|) (CONS -1 |n|))) 

(SDEFUN |CARD;coerce;Nni%;3| ((|n| (|NonNegativeInteger|)) (% (%)))
        (CONS -1 |n|)) 

(MAKEPROP '|CARD;Aleph;Nni%;4| '|SPADreplace| '(XLAM (|n|) (CONS |n| -1))) 

(SDEFUN |CARD;Aleph;Nni%;4| ((|n| (|NonNegativeInteger|)) (% (%)))
        (CONS |n| -1)) 

(SDEFUN |CARD;coerce;%Of;5| ((|x| (%)) (% (|OutputForm|)))
        (COND ((EQL (QCAR |x|) -1) (SPADCALL (QCDR |x|) (QREFELT % 18)))
              ('T
               (SPADCALL (QREFELT % 16)
                         (LIST (SPADCALL (QCAR |x|) (QREFELT % 18)))
                         (QREFELT % 20))))) 

(SDEFUN |CARD;=;2%B;6| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((SPADCALL (QCAR |x|) (QCAR |y|) (QREFELT % 23)) NIL)
              ((SPADCALL |x| (QREFELT % 24)) (EQL (QCDR |x|) (QCDR |y|)))
              ('T 'T))) 

(SDEFUN |CARD;<;2%B;7| ((|x| (%)) (|y| (%)) (% (|Boolean|)))
        (COND ((< (QCAR |x|) (QCAR |y|)) 'T)
              ((OR (> (QCAR |x|) (QCAR |y|))
                   (NULL (SPADCALL |x| (QREFELT % 24))))
               NIL)
              ('T (< (QCDR |x|) (QCDR |y|))))) 

(SDEFUN |CARD;+;3%;8| ((|x| (%)) (|y| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT % 24))
           (COND
            ((SPADCALL |y| (QREFELT % 24))
             (EXIT (CONS -1 (+ (QCDR |x|) (QCDR |y|))))))))
         (EXIT (SPADCALL |x| |y| (QREFELT % 27))))) 

(SDEFUN |CARD;-;2%U;9| ((|x| (%)) (|y| (%)) (% (|Union| % "failed")))
        (COND ((SPADCALL |x| |y| (QREFELT % 26)) (CONS 1 "failed"))
              ((SPADCALL |x| (QREFELT % 24))
               (CONS 0 (CONS -1 (- (QCDR |x|) (QCDR |y|)))))
              ((SPADCALL |x| |y| (QREFELT % 29)) (CONS 0 |x|))
              ('T (CONS 1 "failed")))) 

(SDEFUN |CARD;*;3%;10| ((|x| (%)) (|y| (%)) (% (%)))
        (SEQ
         (COND
          ((SPADCALL |x| (QREFELT % 24))
           (COND
            ((SPADCALL |y| (QREFELT % 24))
             (EXIT (CONS -1 (* (QCDR |x|) (QCDR |y|))))))))
         (COND
          ((OR (SPADCALL |x| (|spadConstant| % 9) (QREFELT % 25))
               (SPADCALL |y| (|spadConstant| % 9) (QREFELT % 25)))
           (EXIT (|spadConstant| % 9))))
         (EXIT (SPADCALL |x| |y| (QREFELT % 27))))) 

(SDEFUN |CARD;*;Nni2%;11| ((|n| (|NonNegativeInteger|)) (|x| (%)) (% (%)))
        (COND ((SPADCALL |x| (QREFELT % 24)) (CONS -1 (* |n| (QCDR |x|))))
              ((EQL |n| 0) (|spadConstant| % 9)) ('T |x|))) 

(SDEFUN |CARD;^;3%;12| ((|x| (%)) (|y| (%)) (% (%)))
        (SPROG ((#1=#:G54 NIL))
               (COND
                ((SPADCALL |y| (|spadConstant| % 9) (QREFELT % 25))
                 (|spadConstant| % 8))
                ((SPADCALL |y| (QREFELT % 24))
                 (COND ((NULL (SPADCALL |x| (QREFELT % 24))) |x|)
                       ('T
                        (CONS -1
                              (EXPT (QCDR |x|)
                                    (PROG1 (LETT #1# (QCDR |y|))
                                      (|check_subtype2| (>= #1# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #1#)))))))
                ((SPADCALL |x| (|spadConstant| % 9) (QREFELT % 25))
                 (|spadConstant| % 9))
                ((SPADCALL |x| (|spadConstant| % 8) (QREFELT % 25))
                 (|spadConstant| % 8))
                ((QREFELT % 7)
                 (CONS (+ (MAX (- (QCAR |x|) 1) (QCAR |y|)) 1) -1))
                ('T
                 (|error|
                  "Transfinite exponentiation only implemented under GCH"))))) 

(SDEFUN |CARD;finite?;%B;13| ((|x| (%)) (% (|Boolean|))) (EQL (QCAR |x|) -1)) 

(SDEFUN |CARD;countable?;%B;14| ((|x| (%)) (% (|Boolean|))) (< (QCAR |x|) 1)) 

(SDEFUN |CARD;retract;%Nni;15| ((|x| (%)) (% (|NonNegativeInteger|)))
        (SPROG ((#1=#:G63 NIL))
               (COND
                ((SPADCALL |x| (QREFELT % 24))
                 (PROG1 (LETT #1# (QCDR |x|))
                   (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                     '(|Integer|) #1#)))
                ('T (|error| "Not finite"))))) 

(SDEFUN |CARD;retractIfCan;%U;16|
        ((|x| (%)) (% (|Union| (|NonNegativeInteger|) "failed")))
        (SPROG ((#1=#:G69 NIL))
               (COND
                ((SPADCALL |x| (QREFELT % 24))
                 (CONS 0
                       (PROG1 (LETT #1# (QCDR |x|))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                ('T (CONS 1 "failed"))))) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed?;B;17| ((% (|Boolean|)))
        (QREFELT % 7)) 

(SDEFUN |CARD;generalizedContinuumHypothesisAssumed;2B;18|
        ((|b| (|Boolean|)) (% (|Boolean|))) (SETELT % 7 |b|)) 

(DECLAIM (NOTINLINE |CardinalNumber;|)) 

(DEFUN |CardinalNumber;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|CardinalNumber|))
          (LETT % (GETREFV 43))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CardinalNumber| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 1))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 6
                    (|Record| (|:| |order| (|Integer|))
                              (|:| |ival| (|Integer|))))
          (QSETREFV % 7 NIL)
          (QSETREFV % 16 (SPADCALL '|Aleph| (QREFELT % 15)))
          %))) 

(DEFUN |CardinalNumber| ()
  (SPROG NIL
         (PROG (#1=#:G78)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|CardinalNumber|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|CardinalNumber|
                             (LIST (CONS NIL (CONS 1 (|CardinalNumber;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|CardinalNumber|)))))))))) 

(MAKEPROP '|CardinalNumber| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL '|Rep| '|GCHypothesis|
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;1;%;2|) %))
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |CARD;0;%;1|) %))
              (|NonNegativeInteger|) |CARD;coerce;Nni%;3| |CARD;Aleph;Nni%;4|
              (|OutputForm|) (|Symbol|) (0 . |coerce|) '|ALEPHexpr| (|Integer|)
              (5 . |coerce|) (|List| %) (10 . |prefix|) |CARD;coerce;%Of;5|
              (|Boolean|) (16 . ~=) |CARD;finite?;%B;13| |CARD;=;2%B;6|
              |CARD;<;2%B;7| (22 . |max|) |CARD;+;3%;8| (28 . >)
              (|Union| % '"failed") |CARD;-;2%U;9| |CARD;*;3%;10|
              |CARD;*;Nni2%;11| |CARD;^;3%;12| |CARD;countable?;%B;14|
              |CARD;retract;%Nni;15| (|Union| 10 '"failed")
              |CARD;retractIfCan;%U;16|
              |CARD;generalizedContinuumHypothesisAssumed?;B;17|
              |CARD;generalizedContinuumHypothesisAssumed;2B;18| (|String|)
              (|PositiveInteger|))
           '#(~= 34 |zero?| 40 |smaller?| 45 |sign| 51 |sample| 56 |rightRecip|
              60 |rightPower| 65 |retractIfCan| 77 |retract| 82 |recip| 87
              |positive?| 92 |opposite?| 97 |one?| 103 |negative?| 108 |min|
              113 |max| 119 |leftRecip| 125 |leftPower| 130 |latex| 142
              |generalizedContinuumHypothesisAssumed?| 147
              |generalizedContinuumHypothesisAssumed| 151 |finite?| 156
              |countable?| 161 |coerce| 166 ^ 176 |Aleph| 194 >= 199 > 205 =
              211 <= 217 < 223 |1| 229 |0| 233 - 237 + 243 * 249)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL |OrderedSet&| |AbelianMonoid&| NIL |MagmaWithUnit&|
                     NIL |AbelianSemiGroup&| |SetWithZero&| |Magma&| NIL
                     |SetCategory&| |RetractableTo&| NIL NIL |PartialOrder&|
                     |BasicType&| NIL NIL)
                  (CONS
                   '#((|Monoid|) (|OrderedSet|) (|AbelianMonoid|) (|SemiGroup|)
                      (|MagmaWithUnit|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetWithZero|) (|Magma|) (|ComparableRepresentation|)
                      (|SetCategory|) (|RetractableTo| 10) (|CommutativeStar|)
                      (|CoercibleTo| 13) (|PartialOrder|) (|BasicType|)
                      (|CoercibleFrom| 10) (|TwoSidedRecip|))
                   (|makeByteWordVec2| 42
                                       '(1 14 13 0 15 1 17 13 0 18 2 13 0 0 19
                                         20 2 17 22 0 0 23 2 0 0 0 0 27 2 0 22
                                         0 0 29 2 0 22 0 0 1 1 0 22 0 1 2 0 22
                                         0 0 1 1 1 17 0 1 0 0 0 1 1 0 30 0 1 2
                                         0 0 0 10 1 2 0 0 0 42 1 1 0 37 0 38 1
                                         0 10 0 36 1 0 30 0 1 1 1 22 0 1 2 0 22
                                         0 0 1 1 0 22 0 1 1 1 22 0 1 2 0 0 0 0
                                         1 2 0 0 0 0 27 1 0 30 0 1 2 0 0 0 10 1
                                         2 0 0 0 42 1 1 0 41 0 1 0 0 22 39 1 0
                                         22 22 40 1 0 22 0 24 1 0 22 0 35 1 0
                                         13 0 21 1 0 0 10 11 2 0 0 0 10 1 2 0 0
                                         0 42 1 2 0 0 0 0 34 1 0 0 10 12 2 0 22
                                         0 0 1 2 0 22 0 0 29 2 0 22 0 0 25 2 0
                                         22 0 0 1 2 0 22 0 0 26 0 0 0 8 0 0 0 9
                                         2 0 30 0 0 31 2 0 0 0 0 28 2 0 0 10 0
                                         33 2 0 0 42 0 1 2 0 0 0 0 32)))))
           '|lookupComplete|)) 
