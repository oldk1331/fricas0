
(PUT '|U64INT;qconvert;I%;1| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |U64INT;qconvert;I%;1| ((|x| (|Integer|)) (% (%))) |x|) 

(DECLAIM (NOTINLINE |U64Int;|)) 

(DEFUN |U64Int| ()
  (SPROG NIL
         (PROG (#1=#:G2905)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|U64Int|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|U64Int|
                             (LIST (CONS NIL (CONS 1 (|U64Int;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|U64Int|)))))))))) 

(DEFUN |U64Int;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|U64Int|))
          (LETT % (GETREFV 13))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|U64Int| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|U64Int| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Integer|) |U64INT;qconvert;I%;1|
              (|NonNegativeInteger|) (|Union| % '"failed") (|Boolean|)
              (|PositiveInteger|) (|String|) (|OutputForm|))
           '#(~= 0 |zero?| 6 |subtractIfCan| 11 |sample| 17 |rightRecip| 21
              |rightPower| 26 |recip| 38 |qconvert| 43 |opposite?| 48 |one?| 54
              |leftRecip| 59 |leftPower| 64 |latex| 76 |commutator| 81 |coerce|
              87 |characteristic| 97 |associator| 101 |antiCommutator| 108
              |annihilate?| 114 ^ 120 |Zero| 132 |One| 136 = 140 - 146 + 157 *
              163)
           'NIL
           (CONS
            (|makeByteWordVec2| 1
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0))
            (CONS
             '#(NIL |Rng&| NIL NIL |NonAssociativeRing&| NIL
                |NonAssociativeRng&| NIL NIL |AbelianGroup&| NIL NIL NIL NIL
                |MagmaWithUnit&| |NonAssociativeSemiRng&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&|
                NIL)
             (CONS
              '#((|Ring|) (|Rng|) (|SemiRing|) (|SemiRng|)
                 (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|NonAssociativeRng|) (|RightModule| $$) (|LeftModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Magma|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 12))
              (|makeByteWordVec2| 12
                                  '(2 0 9 0 0 1 1 0 9 0 1 2 0 8 0 0 1 0 0 0 1 1
                                    0 8 0 1 2 0 0 0 7 1 2 0 0 0 10 1 1 0 8 0 1
                                    1 0 0 5 6 2 0 9 0 0 1 1 0 9 0 1 1 0 8 0 1 2
                                    0 0 0 7 1 2 0 0 0 10 1 1 0 11 0 1 2 0 0 0 0
                                    1 1 0 0 5 1 1 0 12 0 1 0 0 7 1 3 0 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 9 0 0 1 2 0 0 0 7 1 2 0 0
                                    0 10 1 0 0 0 1 0 0 0 1 2 0 9 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 7 0 1 2 0 0
                                    5 0 1 2 0 0 0 0 1 2 0 0 10 0 1)))))
           '|lookupComplete|)) 

(MAKEPROP '|U64Int| 'NILADIC T) 
