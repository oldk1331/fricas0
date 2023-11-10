
(DECLAIM (NOTINLINE |XPolynomial;|)) 

(DEFUN |XPolynomial| (#1=#:G466)
  (SPROG NIL
         (PROG (#2=#:G467)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|XPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|XPolynomial;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|XPolynomial|)))))))))) 

(DEFUN |XPolynomial;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G465 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|XPolynomial| DV$1))
          (LETT % (GETREFV 29))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#1|
                                                             '(|noZeroDivisors|))
                                              (LETT #1#
                                                    (|HasCategory|
                                                     (|FreeMonoid| (|Symbol|))
                                                     '(|Comparable|)))
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|Comparable|))
                                               #1#)))))
          (|haddProp| |$ConstructorCache| '|XPolynomial| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|XPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|XRecursivePolynomial| 22 6) (|local| |#1|)
              (|Boolean|) (|Record| (|:| |k| 10) (|:| |c| 6)) (|List| 8)
              (|FreeMonoid| 22) (|Mapping| 6 10) (|NonNegativeInteger|)
              (|PositiveInteger|) (|XDistributedPolynomial| 22 6)
              (|Record| (|:| |k| 22) (|:| |c| %)) (|List| 15) (|List| 10)
              (|List| 6) (|List| %) (|Mapping| 6 6) (|List| 22) (|Symbol|)
              (|Union| 10 '#1="failed") (|Union| 6 '#1#) (|Integer|)
              (|Union| % '"failed") (|String|) (|OutputForm|))
           '#() 'NIL
           (CONS
            (|makeByteWordVec2| 4
                                '(0 0 0 1 0 0 0 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(NIL NIL NIL |Algebra&| NIL |Rng&| |FreeModuleCategory&| NIL
                |NonAssociativeAlgebra&| NIL NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL |AbelianGroup&| NIL NIL NIL NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| |Magma&|
                |AbelianSemiGroup&| NIL |RetractableTo&| |RetractableTo&|
                |SetCategory&| NIL NIL NIL |BasicType&| NIL NIL)
             (CONS
              '#((|XPolynomialsCat| 22 6) (|XFreeAlgebra| 22 6) (|XAlgebra| 6)
                 (|Algebra| 6) (|Ring|) (|Rng|) (|FreeModuleCategory| 6 10)
                 (|SemiRing|) (|NonAssociativeAlgebra| 6)
                 (|IndexedDirectProductCategory| 6 10) (|SemiRng|) (|Module| 6)
                 (|IndexedProductCategory| 6 10) (|BiModule| 6 6)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|AbelianProductCategory| 6) (|LeftModule| 6)
                 (|RightModule| 6) (|NonAssociativeRng|) (|RightModule| $$)
                 (|LeftModule| $$) (|AbelianGroup|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|SemiGroup|) (|MagmaWithUnit|) (|NonAssociativeSemiRng|)
                 (|AbelianMonoid|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|RetractableTo| 10) (|RetractableTo| 6)
                 (|SetCategory|) (|CoercibleFrom| 10) (|CoercibleFrom| 6)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 28)
                 (|noZeroDivisors|))
              (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
