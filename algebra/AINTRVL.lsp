
(PUT '|AINTRVL;inf;%R;1| '|SPADreplace| 'QCAR) 

(SDEFUN |AINTRVL;inf;%R;1| ((|x| (%)) (% (R))) (QCAR |x|)) 

(PUT '|AINTRVL;sup;%R;2| '|SPADreplace| 'QCDR) 

(SDEFUN |AINTRVL;sup;%R;2| ((|x| (%)) (% (R))) (QCDR |x|)) 

(PUT '|AINTRVL;qinterval;2R%;3| '|SPADreplace| 'CONS) 

(SDEFUN |AINTRVL;qinterval;2R%;3| ((|i| (R)) (|s| (R)) (% (%))) (CONS |i| |s|)) 

(SDEFUN |AINTRVL;Zero;%;4| ((% (%)))
        (CONS (|spadConstant| % 10) (|spadConstant| % 10))) 

(SDEFUN |AINTRVL;One;%;5| ((% (%)))
        (CONS (|spadConstant| % 12) (|spadConstant| % 12))) 

(DECLAIM (NOTINLINE |AInterval;|)) 

(DEFUN |AInterval;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G14 NIL) (#2=#:G13 NIL) (#3=#:G15 NIL) (% NIL)
    (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT |dv$| (LIST '|AInterval| DV$1))
    (LETT % (GETREFV 22))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|OrderedAbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|OrderedAbelianGroup|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory| |#1|
                                                            '(|OrderedRing|)))
                                        (|HasCategory| |#1| '(|OrderedMonoid|))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|OrderedMonoid|))
                                         #3#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|OrderedAbelianMonoid|))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMonoid|))
                                          #3#))
                                        (|HasCategory| |#1|
                                                       '(|OrderedSemiGroup|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|SemiRng|)))
                                        (LETT #1#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|OrderedSemiGroup|))
                                               (|HasCategory| |#1|
                                                              '(|SemiRng|))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|OrderedMonoid|))
                                          #3#)
                                         #1#)))))
    (|haddProp| |$ConstructorCache| '|AInterval| (LIST DV$1) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (AND
     (OR
      (AND (|HasCategory| |#1| '(|OrderedMonoid|)) #3#
           (|HasCategory| % '(|AbelianGroup|)))
      (AND (|HasCategory| |#1| '(|OrderedSemiGroup|)) #2#
           (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 2048))
    (AND
     (OR (|HasCategory| |#1| '(|OrderedAbelianGroup|))
         (AND (|HasCategory| |#1| '(|OrderedMonoid|)) #3#
              (|HasCategory| % '(|AbelianGroup|)))
         (AND (|HasCategory| |#1| '(|OrderedSemiGroup|)) #2#
              (|HasCategory| % '(|AbelianGroup|))))
     (|augmentPredVector| % 4096))
    (AND
     (OR (|HasCategory| |#1| '(|OrderedAbelianMonoid|))
         (AND (|HasCategory| |#1| '(|OrderedMonoid|)) #3#)
         (AND (|HasCategory| |#1| '(|OrderedSemiGroup|)) #2#
              (|HasCategory| % '(|AbelianMonoid|))))
     (|augmentPredVector| % 8192))
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#1| '(|AbelianMonoid|))
      (QSETREFV % 11
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |AINTRVL;Zero;%;4|) % 11)))))
    (COND
     ((|HasCategory| |#1| '(|Monoid|))
      (QSETREFV % 13
                (CONS #'|makeSpadConstant|
                      (LIST (|dispatchFunction| |AINTRVL;One;%;5|) % 13)))))
    %))) 

(DEFUN |AInterval| (#1=#:G16)
  (SPROG NIL
         (PROG (#2=#:G17)
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
              |AINTRVL;sup;%R;2| |AINTRVL;qinterval;2R%;3| (0 . |Zero|)
              (4 . |Zero|) (8 . |One|) (12 . |One|) (|Boolean|) (|OutputForm|)
              (|String|) (|PositiveInteger|) (|List| 6) (|NonNegativeInteger|)
              (|Union| % '"failed") (|Integer|))
           '#(~= 16 |zero?| 22 |width| 27 |unit?| 32 |sup| 37 |subtractIfCan|
              42 |sample| 48 |rightRecip| 52 |rightPower| 57 |recip| 69
              |qinterval| 74 |positive?| 80 |opposite?| 85 |one?| 91
              |negative?| 96 |leftRecip| 101 |leftPower| 106 |latex| 118 |inv|
              123 |interval| 128 |inf| 134 |error?| 139 |contains?| 144
              |coerce| 156 |antiCommutator| 166 |abs| 172 ^ 177 |Zero| 189
              |One| 193 = 197 / 203 - 209 + 220 * 232)
           'NIL
           (CONS
            (|makeByteWordVec2| 11 '(0 6 11 11 11 11 6 6 11 11 6 7 11 0 0 0 0))
            (CONS
             '#(|AIntervalCategory&| NIL NIL NIL NIL NIL NIL NIL NIL
                |NonAssociativeSemiRng&| |MagmaWithUnit&| |AbelianMonoid&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&| NIL |BasicType&|)
             (CONS
              '#((|AIntervalCategory| 6) (|SemiRing|) (|SemiRng|)
                 (|BiModule| $$ $$) (|RightModule| $$) (|LeftModule| $$)
                 (|Monoid|) (|NonAssociativeSemiRing|) (|SemiGroup|)
                 (|NonAssociativeSemiRng|) (|MagmaWithUnit|) (|AbelianMonoid|)
                 (|Magma|) (|AbelianSemiGroup|) (|SetCategory|)
                 (|CoercibleTo| 15) (|BasicType|))
              (|makeByteWordVec2| 21
                                  '(0 6 0 10 0 0 0 11 0 6 0 12 0 0 0 13 2 0 14
                                    0 0 1 1 14 14 0 1 1 2 6 0 1 1 3 14 0 1 1 0
                                    6 0 8 2 12 20 0 0 1 0 14 0 1 1 6 20 0 1 2 6
                                    0 0 19 1 2 11 0 0 17 1 1 6 20 0 1 2 0 0 6 6
                                    9 1 1 14 0 1 2 14 14 0 0 1 1 6 14 0 1 1 1
                                    14 0 1 1 6 20 0 1 2 6 0 0 19 1 2 11 0 0 17
                                    1 1 0 16 0 1 1 3 0 0 1 2 0 0 6 6 1 1 0 6 0
                                    7 1 0 14 0 1 2 0 14 0 0 1 2 0 14 0 6 1 1 0
                                    15 0 1 1 0 18 0 1 2 11 0 0 0 1 1 2 0 0 1 2
                                    6 0 0 19 1 2 11 0 0 17 1 0 14 0 11 0 6 0 13
                                    2 0 14 0 0 1 2 3 0 0 0 1 2 13 0 0 0 1 1 13
                                    0 0 1 2 0 0 0 0 1 2 0 0 0 6 1 2 0 0 17 0 1
                                    2 10 0 6 0 1 2 13 0 21 0 1 2 14 0 19 0 1 2
                                    11 0 0 0 1)))))
           '|lookupComplete|)) 
