
(SDEFUN |INDE;coerceOF| ((|t| (|Term|)) (% (|OutputForm|)))
        (COND ((EQL (QCDR |t|) 1) (SPADCALL (QCAR |t|) (QREFELT % 10)))
              ('T
               (SPADCALL (SPADCALL (QCAR |t|) (QREFELT % 10))
                         (SPADCALL (QCDR |t|) (QREFELT % 12)) (QREFELT % 13))))) 

(SDEFUN |INDE;coerce;%Of;2| ((|x| (%)) (% (|OutputForm|)))
        (SPROG ((#1=#:G18 NIL) (|t| NIL) (#2=#:G19 NIL))
               (SEQ
                (COND ((NULL |x|) (SPADCALL 1 (QREFELT % 15)))
                      ((NULL (CDR |x|)) (|INDE;coerceOF| (|SPADfirst| |x|) %))
                      ('T
                       (SPADCALL (ELT % 16)
                                 (PROGN
                                  (LETT #1# NIL)
                                  (SEQ (LETT |t| NIL) (LETT #2# |x|) G190
                                       (COND
                                        ((OR (ATOM #2#)
                                             (PROGN (LETT |t| (CAR #2#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #1#
                                               (CONS (|INDE;coerceOF| |t| %)
                                                     #1#))))
                                       (LETT #2# (CDR #2#)) (GO G190) G191
                                       (EXIT (NREVERSE #1#))))
                                 (QREFELT % 19))))))) 

(DECLAIM (NOTINLINE |IndexedExponents;|)) 

(DEFUN |IndexedExponents;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|IndexedExponents| DV$1))
          (LETT % (GETREFV 28))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|AbelianGroup|))
                                              (|HasCategory| |#1|
                                                             '(|Comparable|))))))
          (|haddProp| |$ConstructorCache| '|IndexedExponents| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|SetWithZero|)) (|augmentPredVector| % 4))
          (AND (|HasCategory| % '(|AbelianGroup|)) (|augmentPredVector| % 8))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |k| |#1|) (|:| |c| (|NonNegativeInteger|))))
          (QSETREFV % 8 (|List| (QREFELT % 7)))
          %))) 

(DEFUN |IndexedExponents| (#1=#:G26)
  (SPROG NIL
         (PROG (#2=#:G27)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedExponents|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|IndexedExponents;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedExponents|)))))))))) 

(MAKEPROP '|IndexedExponents| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedDirectProductObject| 11 6)
              (|local| |#1|) '|Term| '|Rep| (|OutputForm|) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |coerce|) (10 . ^) (|Integer|)
              (16 . |coerce|) (21 . *) (|Mapping| 9 9 9) (|List| 9)
              (27 . |reduce|) |INDE;coerce;%Of;2| (|Boolean|) (|String|)
              (|PositiveInteger|) (|Union| % '"failed")
              (|Record| (|:| |k| 6) (|:| |c| 11)) (|List| 25)
              (|Mapping| 11 11))
           '#(~= 33 |zero?| 39 |sup| 44 |subtractIfCan| 50 |smaller?| 56 |sign|
              62 |sample| 67 |reductum| 71 |positive?| 76 |opposite?| 81
              |numberOfMonomials| 87 |negative?| 92 |monomial?| 97 |monomial|
              102 |min| 108 |max| 114 |map| 120 |listOfTerms| 126 |leadingTerm|
              131 |leadingSupport| 136 |leadingMonomial| 141
              |leadingCoefficient| 146 |latex| 151 |inf| 156 |constructOrdered|
              162 |construct| 167 |coerce| 172 |abs| 177 >= 182 > 188 = 194 <=
              200 < 206 |0| 212 - 216 + 227 * 233)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL |AbelianGroup&| |OrderedAbelianSemiGroup&|
                     NIL |OrderedSet&| |AbelianMonoid&| NIL |AbelianSemiGroup&|
                     |SetWithZero&| NIL |SetCategory&| NIL |PartialOrder&|
                     |BasicType&|)
                  (CONS
                   '#((|IndexedDirectProductCategory| 11 6)
                      (|IndexedProductCategory| 11 6)
                      (|AbelianProductCategory| 11) (|OrderedAbelianMonoidSup|)
                      (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetWithZero|) (|ComparableRepresentation|)
                      (|SetCategory|) (|CoercibleTo| 9) (|PartialOrder|)
                      (|BasicType|))
                   (|makeByteWordVec2| 27
                                       '(1 6 9 0 10 1 11 9 0 12 2 9 0 0 0 13 1
                                         14 9 0 15 2 9 0 0 0 16 2 18 9 17 0 19
                                         2 0 21 0 0 1 1 0 21 0 1 2 0 0 0 0 1 2
                                         0 24 0 0 1 2 0 21 0 0 1 1 3 14 0 1 0 0
                                         0 1 1 2 0 0 1 1 3 21 0 1 2 0 21 0 0 1
                                         1 0 11 0 1 1 3 21 0 1 1 0 21 0 1 2 0 0
                                         11 6 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0
                                         27 0 1 1 0 26 0 1 1 2 25 0 1 1 2 6 0 1
                                         1 2 0 0 1 1 2 11 0 1 1 0 22 0 1 2 0 0
                                         0 0 1 1 2 0 26 1 1 0 0 26 1 1 0 9 0 20
                                         1 4 0 0 1 2 0 21 0 0 1 2 0 21 0 0 1 2
                                         0 21 0 0 1 2 0 21 0 0 1 2 0 21 0 0 1 0
                                         0 0 1 1 1 0 0 1 2 1 0 0 0 1 2 0 0 0 0
                                         1 2 0 0 23 0 1 2 0 0 11 0 1 2 1 0 14 0
                                         1)))))
           '|lookupComplete|)) 
