
(MAKEPROP '|AINTRVL;inf;%R;1| '|SPADreplace| 'QCAR) 

(SDEFUN |AINTRVL;inf;%R;1| ((|x| (%)) (% (R))) (QCAR |x|)) 

(MAKEPROP '|AINTRVL;sup;%R;2| '|SPADreplace| 'QCDR) 

(SDEFUN |AINTRVL;sup;%R;2| ((|x| (%)) (% (R))) (QCDR |x|)) 

(MAKEPROP '|AINTRVL;qinterval;2R%;3| '|SPADreplace| 'CONS) 

(SDEFUN |AINTRVL;qinterval;2R%;3| ((|i| (R)) (|s| (R)) (% (%))) (CONS |i| |s|)) 

(DECLAIM (NOTINLINE |AInterval;|)) 

(DEFUN |AInterval;| (|#1|)
  (SPROG
   ((DV$1 NIL) (|dv$| NIL) (% NIL) (#1=#:G11 NIL) (#2=#:G10 NIL) (#3=#:G9 NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|AInterval| DV$1))
    (LETT % (GETREFV 18))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1| '(|SetWithZero|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#1|
                                                            '(|OrderedRing|)))
                                        (|HasCategory| |#1| '(|OrderedMagma|))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|SemiRng|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|OrderedMagmaWithZero|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRng|)))
                                         (|HasCategory| |#1| '(|SetWithZero|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #1#
                                          (|HasCategory| |#1| '(|SemiRing|))
                                          (|not|
                                           (|HasCategory| |#1|
                                                          '(|OrderedMagma|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #1# (|HasCategory| |#1| '(|SemiRng|))
                                          (|not|
                                           (|HasCategory| |#1|
                                                          '(|OrderedMagma|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRng|)))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1| '(|SemiRng|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (|HasCategory| |#1| '(|OrderedMagma|))
                                         (AND #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (|HasCategory| |#1| '(|OrderedMagma|))
                                         #1#)
                                        (|HasCategory| |#1| '(|MagmaWithUnit|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|MagmaWithZero|)))
                                        (OR
                                         (AND #2#
                                              (|HasCategory| |#1|
                                                             '(|OrderedMagma|)))
                                         (AND #2# #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Monoid|)))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|MagmaWithUnit|))
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|)))
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedMagma|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|MagmaWithUnit|))
                                          #1#
                                          (|not|
                                           (|HasCategory| |#1|
                                                          '(|OrderedMagma|))))
                                         (AND #3# #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedMagma|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND #3# #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (AND #3#
                                              (|HasCategory| |#1|
                                                             '(|OrderedMagma|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiGroup|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRing|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMagma|))
                                          (|HasCategory| |#1| '(|SemiRng|)))
                                         (AND #3# #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|))))
                                         (AND #1#
                                              (|HasCategory| |#1| '(|SemiRng|))
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|AbelianMonoid|))
                                          #1#)
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|MagmaWithUnit|))
                                          #1#)
                                         (AND #2# #1#) (AND #3# #1#)
                                         (|HasCategory| |#1| '(|OrderedMagma|))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiGroup|)))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SemiRng|)))
                                         (AND #1#
                                              (|HasCategory| |#1|
                                                             '(|SetWithZero|)))
                                         (AND #1#
                                              (|not|
                                               (|HasCategory| |#1|
                                                              '(|OrderedMagma|)))))))))
    (|haddProp| |$ConstructorCache| '|AInterval| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|OrderedMagma|))
           (|HasCategory| |#1| '(|SemiRing|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|OrderedMagma|))
           (|HasCategory| |#1| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|)))
      (AND #1# (|HasCategory| |#1| '(|SemiRing|))
           (|HasCategory| % '(|AbelianGroup|))
           (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
      (AND #1# (|HasCategory| |#1| '(|SemiRng|))
           (|HasCategory| % '(|AbelianGroup|))
           (|not| (|HasCategory| |#1| '(|OrderedMagma|)))))
     (|augmentPredVector| % 2097152))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRing|))
              (|HasCategory| % '(|AbelianGroup|)))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|)))
         (AND #1# (|HasCategory| |#1| '(|SemiRing|))
              (|HasCategory| % '(|AbelianGroup|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
         (AND #1# (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianGroup|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|)))))
     (|augmentPredVector| % 4194304))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRing|)))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|)))
         (AND #1# (|HasCategory| |#1| '(|SemiRing|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
         (AND #1# (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|)))))
     (|augmentPredVector| % 8388608))
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|MagmaWithUnit|))
           (|HasCategory| |#1| '(|OrderedMagma|)))
      (AND #2# (|HasCategory| |#1| '(|OrderedMagma|)))
      (AND #3# (|HasCategory| |#1| '(|OrderedMagma|)))
      (AND (|HasCategory| |#1| '(|OrderedMagma|))
           (|HasCategory| |#1| '(|SemiRing|)))
      (AND (|HasCategory| |#1| '(|OrderedMagma|))
           (|HasCategory| |#1| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|)))
      (|HasCategory| |#1| '(|SetWithZero|))
      (AND (|HasCategory| |#1| '(|MagmaWithUnit|)) #1#
           (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
      (AND #2# #1# (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
      (AND #3# #1# (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
      (AND #1# (|HasCategory| |#1| '(|SemiRing|))
           (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
      (AND #1# (|HasCategory| |#1| '(|SemiRng|))
           (|HasCategory| % '(|AbelianMonoid|))
           (|not| (|HasCategory| |#1| '(|OrderedMagma|)))))
     (|augmentPredVector| % 16777216))
    (AND
     (OR (AND #2# (|HasCategory| |#1| '(|OrderedMagma|)))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRing|)))
         (AND (|HasCategory| |#1| '(|OrderedMagma|))
              (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|)))
         (|HasCategory| |#1| '(|SetWithZero|))
         (AND #2# #1# (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
         (AND #1# (|HasCategory| |#1| '(|SemiRing|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|))))
         (AND #1# (|HasCategory| |#1| '(|SemiRng|))
              (|HasCategory| % '(|AbelianMonoid|))
              (|not| (|HasCategory| |#1| '(|OrderedMagma|)))))
     (|augmentPredVector| % 33554432))
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |AInterval| (#1=#:G12)
  (SPROG NIL
         (PROG (#2=#:G13)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|AInterval|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|AInterval;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|AInterval|)))))))))) 

(MAKEPROP '|AInterval| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) |AINTRVL;inf;%R;1|
              |AINTRVL;sup;%R;2| |AINTRVL;qinterval;2R%;3| (|Boolean|)
              (|OutputForm|) (|String|) (|PositiveInteger|) (|List| 6)
              (|Union| % '"failed") (|Integer|) (|NonNegativeInteger|))
           '#(~= 0 |zero?| 6 |width| 11 |unit?| 16 |sup| 21 |subtractIfCan| 26
              |sample| 32 |rightRecip| 36 |rightPower| 41 |recip| 53
              |qinterval| 58 |positive?| 64 |opposite?| 69 |one?| 75
              |negative?| 80 |leftRecip| 85 |leftPower| 90 |latex| 102 |inv|
              107 |interval| 112 |inf| 118 |error?| 123 |contains?| 128
              |coerce| 140 |antiCommutator| 150 |abs| 156 ^ 161 = 173 |1| 179
              |0| 183 / 187 - 193 + 204 * 216)
           'NIL
           (CONS
            (|makeByteWordVec2| 21
                                '(0 9 11 11 11 11 19 9 16 20 11 18 1 21 10 0 0
                                  0 0))
            (CONS
             '#(|AIntervalCategory&| NIL NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeSemiRng&| |MagmaWithUnit&| |AbelianMonoid&|
                |Magma&| |SetWithZero&| |AbelianSemiGroup&| |SetCategory&| NIL
                |BasicType&|)
             (CONS
              '#((|AIntervalCategory| 6) (|SemiRing|) (|SemiRng|)
                 (|BiModule| $$ $$) (|RightModule| $$) (|LeftModule| $$)
                 (|Monoid|) (|NonAssociativeSemiRing|) (|MagmaWithZero|)
                 (|SemiGroup|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|AbelianMonoid|) (|Magma|) (|SetWithZero|)
                 (|AbelianSemiGroup|) (|SetCategory|) (|CoercibleTo| 11)
                 (|BasicType|))
              (|makeByteWordVec2| 26
                                  '(2 0 10 0 0 1 1 26 10 0 1 1 3 6 0 1 1 4 10 0
                                    1 1 0 6 0 8 2 22 15 0 0 1 0 25 0 1 1 18 15
                                    0 1 2 18 0 0 17 1 2 12 0 0 13 1 1 18 15 0 1
                                    2 0 0 6 6 9 1 2 10 0 1 2 24 10 0 0 1 1 18
                                    10 0 1 1 2 10 0 1 1 18 15 0 1 2 18 0 0 17 1
                                    2 12 0 0 13 1 1 0 12 0 1 1 4 0 0 1 2 0 0 6
                                    6 1 1 0 6 0 7 1 0 10 0 1 2 0 10 0 0 1 2 0
                                    10 0 6 1 1 0 11 0 1 1 0 14 0 1 2 11 0 0 0 1
                                    1 3 0 0 1 2 18 0 0 17 1 2 13 0 0 13 1 2 0
                                    10 0 0 1 0 18 0 1 0 26 0 1 2 4 0 0 0 1 1 23
                                    0 0 1 2 23 0 0 0 1 2 0 0 0 0 1 2 0 0 0 6 1
                                    2 0 0 13 0 1 2 23 0 16 0 1 2 24 0 17 0 1 2
                                    13 0 6 0 1 2 13 0 0 0 1)))))
           '|lookupComplete|)) 
