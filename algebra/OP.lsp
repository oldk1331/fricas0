
(DECLAIM (NOTINLINE |Operator;|)) 

(DEFUN |Operator;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Operator| DV$1))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#1|
                                                             '(|CharacteristicNonZero|))))))
          (|haddProp| |$ConstructorCache| '|Operator| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Operator| (#1=#:G10)
  (SPROG NIL
         (PROG (#2=#:G11)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|Operator|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Operator;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Operator|)))))))))) 

(MAKEPROP '|Operator| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|ModuleOperator| 6 6) (|local| |#1|)
              (|Boolean|) (|String|) (|OutputForm|) (|PositiveInteger|)
              (|Integer|) (|Union| % '"failed") (|NonNegativeInteger|)
              (|Union| 6 '#1="failed") (|Union| 16 '#1#) (|BasicOperator|)
              (|Mapping| 6 6) (|FreeGroup| 16))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(1 0 1 0 0 1 0 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 3 2 0 0 0 0 0 0))
            (CONS
             '#(|Algebra&| NIL |NonAssociativeAlgebra&| NIL |Rng&| |Module&|
                NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |AbelianMonoid&| |NonAssociativeSemiRng&| |MagmaWithUnit&| NIL
                |AbelianSemiGroup&| |SetWithZero&| |Magma&| |SetCategory&|
                |RetractableTo&| |RetractableTo&| NIL NIL NIL |BasicType&| NIL
                NIL NIL NIL)
             (CONS
              '#((|Algebra| 6) (|Ring|) (|NonAssociativeAlgebra| 6)
                 (|SemiRing|) (|Rng|) (|Module| 6) (|SemiRng|) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|LeftModule| $$) (|RightModule| $$)
                 (|NonAssociativeRng|) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|NonAssociativeSemiRing|)
                 (|Monoid|) (|AbelianMonoid|) (|NonAssociativeSemiRng|)
                 (|MagmaWithUnit|) (|SemiGroup|) (|AbelianSemiGroup|)
                 (|SetWithZero|) (|Magma|) (|SetCategory|) (|RetractableTo| 6)
                 (|RetractableTo| 16) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|CoercibleTo| 9) (|BasicType|)
                 (|unitsKnown|) (|CoercibleFrom| 6) (|CoercibleFrom| 16)
                 (|Eltable| 6 6))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
