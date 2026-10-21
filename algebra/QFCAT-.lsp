
(SDEFUN |QFCAT-;numerator;2A;1| ((|x| (A)) (% (A)))
        (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 9))) 

(SDEFUN |QFCAT-;denominator;2A;2| ((|x| (A)) (% (A)))
        (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 9))) 

(SDEFUN |QFCAT-;init;A;3| ((% (A)))
        (SPADCALL (|spadConstant| % 13) (|spadConstant| % 14) (QREFELT % 15))) 

(SDEFUN |QFCAT-;nextItem;AU;4| ((|n| (A)) (% (|Union| A #1="failed")))
        (SPROG ((|m| (|Union| S #1#)))
               (SEQ
                (LETT |m|
                      (SPADCALL (SPADCALL |n| (QREFELT % 8)) (QREFELT % 18)))
                (EXIT
                 (COND
                  ((QEQCAR |m| 1)
                   (|error| "We seem to have a Fraction of a finite object"))
                  ('T
                   (CONS 0
                         (SPADCALL (QCDR |m|) (|spadConstant| % 14)
                                   (QREFELT % 15))))))))) 

(SDEFUN |QFCAT-;map;M2A;5| ((|fn| (|Mapping| S S)) (|x| (A)) (% (A)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 8)) |fn|)
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) |fn|) (QREFELT % 15))) 

(SDEFUN |QFCAT-;reducedSystem;MM;6| ((|m| (|Matrix| A)) (% (|Matrix| S)))
        (SPROG
         ((|nrm| (|NonNegativeInteger|)) (|ncm| (|NonNegativeInteger|))
          (|ans| (|Matrix| S)) (|i| NIL) (#1=#:G36 NIL) (|d| (S)) (|j| NIL)
          (#2=#:G37 NIL) (|ell| (A)) (#3=#:G28 NIL))
         (SEQ (LETT |nrm| (ANROWS |m|)) (LETT |ncm| (ANCOLS |m|))
              (LETT |ans| (MAKE_MATRIX1 |nrm| |ncm| (|spadConstant| % 24)))
              (SEQ (LETT |i| 1) (LETT #1# |nrm|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (LETT |d|
                          (SPADCALL (SPADCALL |m| |i| (QREFELT % 28))
                                    (QREFELT % 30)))
                    (EXIT
                     (SEQ (LETT |j| 1) (LETT #2# |ncm|) G190
                          (COND ((|greater_SI| |j| #2#) (GO G191)))
                          (SEQ (LETT |ell| (QAREF2O |m| |i| |j| 1 1))
                               (EXIT
                                (QSETAREF2O |ans| |i| |j|
                                            (SPADCALL
                                             (PROG2
                                                 (LETT #3#
                                                       (SPADCALL |d|
                                                                 (SPADCALL
                                                                  |ell|
                                                                  (QREFELT %
                                                                           11))
                                                                 (QREFELT %
                                                                          31)))
                                                 (QCDR #3#)
                                               (|check_union2| (QEQCAR #3# 0)
                                                               (QREFELT % 7)
                                                               (|Union|
                                                                (QREFELT % 7)
                                                                "failed")
                                                               #3#))
                                             (SPADCALL |ell| (QREFELT % 8))
                                             (QREFELT % 32))
                                            1 1)))
                          (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |QFCAT-;characteristic;Nni;7| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 37))) 

(SDEFUN |QFCAT-;differentiate;AMA;8|
        ((|x| (A)) (|deriv| (|Mapping| S S)) (% (A)))
        (SPROG ((|n| (S)) (|d| (S)))
               (SEQ (LETT |n| (SPADCALL |x| (QREFELT % 8)))
                    (LETT |d| (SPADCALL |x| (QREFELT % 11)))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (SPADCALL |n| |deriv|) |d| (QREFELT % 32))
                       (SPADCALL |n| (SPADCALL |d| |deriv|) (QREFELT % 32))
                       (QREFELT % 39))
                      (SPADCALL |d| 2 (QREFELT % 41)) (QREFELT % 15)))))) 

(SDEFUN |QFCAT-;convert;AIf;9| ((|x| (A)) (% (|InputForm|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 44))
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 44))
                  (QREFELT % 45))) 

(SDEFUN |QFCAT-;convert;AF;10| ((|x| (A)) (% (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 48))
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 48))
                  (QREFELT % 49))) 

(SDEFUN |QFCAT-;convert;ADf;11| ((|x| (A)) (% (|DoubleFloat|)))
        (|div_DF| (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 52))
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 52)))) 

(SDEFUN |QFCAT-;<;2AB;12| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (SPADCALL
         (SPADCALL (SPADCALL |x| (QREFELT % 8)) (SPADCALL |y| (QREFELT % 11))
                   (QREFELT % 32))
         (SPADCALL (SPADCALL |y| (QREFELT % 8)) (SPADCALL |x| (QREFELT % 11))
                   (QREFELT % 32))
         (QREFELT % 55))) 

(SDEFUN |QFCAT-;smaller?;2AB;13| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (SPADCALL |x| |y| (QREFELT % 57))) 

(SDEFUN |QFCAT-;smaller?;2AB;14| ((|x| (A)) (|y| (A)) (% (|Boolean|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 11)) (SPADCALL |y| (QREFELT % 11))
                    (QREFELT % 59))
          'T)
         ((SPADCALL (SPADCALL |y| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 11))
                    (QREFELT % 59))
          NIL)
         ('T
          (SPADCALL (SPADCALL |x| (QREFELT % 8)) (SPADCALL |y| (QREFELT % 8))
                    (QREFELT % 59))))) 

(SDEFUN |QFCAT-;fractionPart;2A;15| ((|x| (A)) (% (A)))
        (SPADCALL |x| (SPADCALL (SPADCALL |x| (QREFELT % 60)) (QREFELT % 9))
                  (QREFELT % 61))) 

(SDEFUN |QFCAT-;coerce;SA;16| ((|s| (|Symbol|)) (% (A)))
        (SPADCALL (SPADCALL |s| (QREFELT % 64)) (QREFELT % 9))) 

(SDEFUN |QFCAT-;retract;AS;17| ((|x| (A)) (% (|Symbol|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 66)) (QREFELT % 67))) 

(SDEFUN |QFCAT-;retractIfCan;AU;18|
        ((|x| (A)) (% (|Union| (|Symbol|) "failed")))
        (SPROG ((|r| (|Union| S "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 70)))
                    (EXIT
                     (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |r|) (QREFELT % 72)))))))) 

(SDEFUN |QFCAT-;convert;AP;19| ((|x| (A)) (% (|Pattern| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 75))
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 75))
                  (QREFELT % 76))) 

(SDEFUN |QFCAT-;patternMatch;AP2Pmr;20|
        ((|x| (A)) (|p| (|Pattern| (|Integer|)))
         (|l| (|PatternMatchResult| (|Integer|) A))
         (% (|PatternMatchResult| (|Integer|) A)))
        (SPADCALL |x| |p| |l| (QREFELT % 80))) 

(SDEFUN |QFCAT-;convert;AP;21| ((|x| (A)) (% (|Pattern| (|Float|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 8)) (QREFELT % 84))
                  (SPADCALL (SPADCALL |x| (QREFELT % 11)) (QREFELT % 84))
                  (QREFELT % 85))) 

(SDEFUN |QFCAT-;patternMatch;AP2Pmr;22|
        ((|x| (A)) (|p| (|Pattern| (|Float|)))
         (|l| (|PatternMatchResult| (|Float|) A))
         (% (|PatternMatchResult| (|Float|) A)))
        (SPADCALL |x| |p| |l| (QREFELT % 89))) 

(SDEFUN |QFCAT-;coerce;FA;23| ((|x| (|Fraction| (|Integer|))) (% (A)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 93)) (QREFELT % 94))
                  (SPADCALL (SPADCALL |x| (QREFELT % 95)) (QREFELT % 94))
                  (QREFELT % 96))) 

(SDEFUN |QFCAT-;retract;AI;24| ((|x| (A)) (% (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT % 66)) (QREFELT % 98))) 

(SDEFUN |QFCAT-;retractIfCan;AU;25|
        ((|x| (A)) (% (|Union| (|Integer|) "failed")))
        (SPROG ((|u| (|Union| S "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 70)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |u|) (QREFELT % 101)))))))) 

(SDEFUN |QFCAT-;reducedSystem;MVR;26|
        ((|m| (|Matrix| A)) (|v| (|Vector| A))
         (% (|Record| (|:| |mat| (|Matrix| S)) (|:| |vec| (|Vector| S)))))
        (SPROG ((|n| (|Matrix| S)))
               (SEQ
                (LETT |n|
                      (SPADCALL
                       (SPADCALL (SPADCALL |v| (QREFELT % 103)) |m|
                                 (QREFELT % 104))
                       (QREFELT % 105)))
                (EXIT
                 (CONS
                  (SPADCALL |n| (PROGN |n| 1) (SPADCALL |n| (QREFELT % 106))
                            (+ 1 (PROGN |n| 1)) (SPADCALL |n| (QREFELT % 107))
                            (QREFELT % 108))
                  (SPADCALL |n| (PROGN |n| 1) (QREFELT % 110))))))) 

(DECLAIM (NOTINLINE |QuotientFieldCategory&;|)) 

(DEFUN |QuotientFieldCategory&| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|QuotientFieldCategory&| DV$1 DV$2))
          (LETT % (GETREFV 120))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|PolynomialFactorizationExplicit|))
                                              (|HasCategory| |#2|
                                                             '(|IntegerNumberSystem|))
                                              (|HasCategory| |#2|
                                                             '(|EuclideanDomain|))
                                              (|HasCategory| |#2|
                                                             '(|RetractableTo|
                                                               (|Symbol|)))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| |#2|
                                                             '(|RealConstant|))
                                              (|HasCategory| |#2|
                                                             '(|OrderedRing|))
                                              (|HasCategory| |#2|
                                                             '(|ComparableRepresentation|))
                                              (|HasCategory| |#2|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|StepThrough|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 12)
            (PROGN
             (QSETREFV % 16 (CONS (|dispatchFunction| |QFCAT-;init;A;3|) %))
             (QSETREFV % 20
                       (CONS (|dispatchFunction| |QFCAT-;nextItem;AU;4|) %)))))
          (COND
           ((|testBitVector| |pv$| 7)
            (QSETREFV % 46
                      (CONS (|dispatchFunction| |QFCAT-;convert;AIf;9|) %))))
          (COND
           ((|testBitVector| |pv$| 8)
            (PROGN
             (QSETREFV % 50
                       (CONS (|dispatchFunction| |QFCAT-;convert;AF;10|) %))
             (QSETREFV % 53
                       (CONS (|dispatchFunction| |QFCAT-;convert;ADf;11|)
                             %)))))
          (COND
           ((|testBitVector| |pv$| 9)
            (QSETREFV % 56 (CONS (|dispatchFunction| |QFCAT-;<;2AB;12|) %))))
          (COND
           ((|testBitVector| |pv$| 10)
            (COND
             ((|testBitVector| |pv$| 9)
              (QSETREFV % 58
                        (CONS (|dispatchFunction| |QFCAT-;smaller?;2AB;13|)
                              %)))
             ('T
              (QSETREFV % 58
                        (CONS (|dispatchFunction| |QFCAT-;smaller?;2AB;14|)
                              %))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV % 62
                      (CONS (|dispatchFunction| |QFCAT-;fractionPart;2A;15|)
                            %))))
          (COND
           ((|testBitVector| |pv$| 4)
            (PROGN
             (QSETREFV % 65
                       (CONS (|dispatchFunction| |QFCAT-;coerce;SA;16|) %))
             (QSETREFV % 68
                       (CONS (|dispatchFunction| |QFCAT-;retract;AS;17|) %))
             (QSETREFV % 73
                       (CONS (|dispatchFunction| |QFCAT-;retractIfCan;AU;18|)
                             %)))))
          (COND
           ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
            (PROGN
             (QSETREFV % 77
                       (CONS (|dispatchFunction| |QFCAT-;convert;AP;19|) %))
             (COND
              ((|HasCategory| |#2| '(|PatternMatchable| (|Integer|)))
               (QSETREFV % 82
                         (CONS
                          (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;20|)
                          %)))))))
          (COND
           ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
            (PROGN
             (QSETREFV % 86
                       (CONS (|dispatchFunction| |QFCAT-;convert;AP;21|) %))
             (COND
              ((|HasCategory| |#2| '(|PatternMatchable| (|Float|)))
               (QSETREFV % 91
                         (CONS
                          (|dispatchFunction| |QFCAT-;patternMatch;AP2Pmr;22|)
                          %)))))))
          (COND
           ((|testBitVector| |pv$| 11)
            (PROGN
             (QSETREFV % 97
                       (CONS (|dispatchFunction| |QFCAT-;coerce;FA;23|) %))
             (COND ((|domainEqual| |#2| (|Integer|)))
                   ('T
                    (PROGN
                     (QSETREFV % 99
                               (CONS
                                (|dispatchFunction| |QFCAT-;retract;AI;24|) %))
                     (QSETREFV % 102
                               (CONS
                                (|dispatchFunction|
                                 |QFCAT-;retractIfCan;AU;25|)
                                %))))))))
          %))) 

(MAKEPROP '|QuotientFieldCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (0 . |numer|) (5 . |coerce|) |QFCAT-;numerator;2A;1|
              (10 . |denom|) |QFCAT-;denominator;2A;2| (15 . |init|) (19 . |1|)
              (23 . /) (29 . |init|) (|Union| % '#1="failed") (33 . |nextItem|)
              (38 . |1|) (42 . |nextItem|) (|Mapping| 7 7) |QFCAT-;map;M2A;5|
              (47 . |0|) (51 . |0|) (|Vector| 6) (|Integer|) (|Matrix| 6)
              (55 . |row|) (|CommonDenominator| 7 6 25)
              (61 . |commonDenominator|) (66 . |exquo|) (72 . *) (|Matrix| 7)
              (|Matrix| %) |QFCAT-;reducedSystem;MM;6| (|NonNegativeInteger|)
              (78 . |characteristic|) |QFCAT-;characteristic;Nni;7| (82 . -)
              (|PositiveInteger|) (88 . ^) |QFCAT-;differentiate;AMA;8|
              (|InputForm|) (94 . |convert|) (99 . /) (105 . |convert|)
              (|Float|) (110 . |convert|) (115 . /) (121 . |convert|)
              (|DoubleFloat|) (126 . |convert|) (131 . |convert|) (|Boolean|)
              (136 . <) (142 . <) (148 . <) (154 . |smaller?|)
              (160 . |smaller?|) (166 . |wholePart|) (171 . -)
              (177 . |fractionPart|) (|Symbol|) (182 . |coerce|)
              (187 . |coerce|) (192 . |retract|) (197 . |retract|)
              (202 . |retract|) (|Union| 7 '#2="failed") (207 . |retractIfCan|)
              (|Union| 63 '#2#) (212 . |retractIfCan|) (217 . |retractIfCan|)
              (|Pattern| 26) (222 . |convert|) (227 . /) (233 . |convert|)
              (|PatternMatchResult| 26 6)
              (|PatternMatchQuotientFieldCategory| 26 7 6)
              (238 . |patternMatch|) (|PatternMatchResult| 26 %)
              (245 . |patternMatch|) (|Pattern| 47) (252 . |convert|) (257 . /)
              (263 . |convert|) (|PatternMatchResult| 47 6)
              (|PatternMatchQuotientFieldCategory| 47 7 6)
              (268 . |patternMatch|) (|PatternMatchResult| 47 %)
              (275 . |patternMatch|) (|Fraction| 26) (282 . |numer|)
              (287 . |coerce|) (292 . |denom|) (297 . /) (303 . |coerce|)
              (308 . |retract|) (313 . |retract|) (|Union| 26 '#2#)
              (318 . |retractIfCan|) (323 . |retractIfCan|) (328 . |coerce|)
              (333 . |horizConcat|) (339 . |reducedSystem|)
              (344 . |maxRowIndex|) (349 . |maxColIndex|) (354 . |subMatrix|)
              (|Vector| 7) (363 . |column|)
              (|Record| (|:| |mat| 33) (|:| |vec| 109)) (|Vector| %)
              |QFCAT-;reducedSystem;MVR;26| (|OutputForm|) (|List| 63)
              (|List| 36) (|Record| (|:| |mat| 118) (|:| |vec| (|Vector| 26)))
              (|Matrix| 26) (|Union| 92 '#2#))
           '#(|smaller?| 369 |retractIfCan| 375 |retract| 385 |reducedSystem|
              395 |patternMatch| 406 |numerator| 420 |nextItem| 425 |map| 430
              |init| 436 |fractionPart| 440 |differentiate| 445 |denominator|
              451 |convert| 456 |coerce| 481 |characteristic| 491 < 495)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|init| (|#1|)) T)
                                   '((|nextItem| ((|Union| |#1| #1#) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #2#) |#1|))
                                     T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|coerce| (|#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #2#)
                                       |#1|))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((< ((|Boolean|) |#1| |#1|)) T)
                                   '((|convert| ((|DoubleFloat|) |#1|)) T)
                                   '((|convert| ((|Float|) |#1|)) T)
                                   '((|convert| ((|InputForm|) |#1|)) T)
                                   '((|coerce| (|#1| (|Symbol|))) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Symbol|) #2#) |#1|))
                                     T)
                                   '((|retract| ((|Symbol|) |#1|)) T)
                                   '((|fractionPart| (|#1| |#1|)) T)
                                   '((|denominator| (|#1| |#1|)) T)
                                   '((|numerator| (|#1| |#1|)) T)
                                   '((|patternMatch|
                                      ((|PatternMatchResult| (|Float|) |#1|)
                                       |#1| (|Pattern| (|Float|))
                                       (|PatternMatchResult| (|Float|) |#1|)))
                                     T)
                                   '((|patternMatch|
                                      ((|PatternMatchResult| (|Integer|) |#1|)
                                       |#1| (|Pattern| (|Integer|))
                                       (|PatternMatchResult| (|Integer|)
                                                             |#1|)))
                                     T)
                                   '((|convert| ((|Pattern| (|Float|)) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Integer|)) |#1|))
                                     T)
                                   '((|reducedSystem|
                                      ((|Matrix| |#2|) (|Matrix| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record| (|:| |mat| (|Matrix| |#2|))
                                                 (|:| |vec| (|Vector| |#2|)))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Record|
                                        (|:| |mat| (|Matrix| (|Integer|)))
                                        (|:| |vec| (|Vector| (|Integer|))))
                                       (|Matrix| |#1|) (|Vector| |#1|)))
                                     T)
                                   '((|reducedSystem|
                                      ((|Matrix| (|Integer|)) (|Matrix| |#1|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|Mapping| |#2| |#2|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|Mapping| |#2| |#2|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))))
                                     T)
                                   '((|differentiate| (|#1| |#1| (|Symbol|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate| (|#1| |#1|)) T)
                                   '((|map| (|#1| (|Mapping| |#2| |#2|) |#1|))
                                     T)
                                   '((|retractIfCan| ((|Union| |#2| #2#) |#1|))
                                     T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|coerce| (|#1| |#2|)) T)
                                   '((|coerce| (|#1| |#1|)) T)
                                   '((|characteristic|
                                      ((|NonNegativeInteger|)))
                                     T)
                                   '((|coerce| (|#1| (|Integer|))) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 113
                                            '(1 6 7 0 8 1 6 0 7 9 1 6 7 0 11 0
                                              7 0 13 0 7 0 14 2 6 0 7 7 15 0 0
                                              0 16 1 7 17 0 18 0 6 0 19 1 0 17
                                              0 20 0 6 0 23 0 7 0 24 2 27 25 0
                                              26 28 1 29 7 25 30 2 7 17 0 0 31
                                              2 7 0 0 0 32 0 7 36 37 2 7 0 0 0
                                              39 2 7 0 0 40 41 1 7 43 0 44 2 43
                                              0 0 0 45 1 0 43 0 46 1 7 47 0 48
                                              2 47 0 0 0 49 1 0 47 0 50 1 7 51
                                              0 52 1 0 51 0 53 2 7 54 0 0 55 2
                                              0 54 0 0 56 2 6 54 0 0 57 2 0 54
                                              0 0 58 2 7 54 0 0 59 1 6 7 0 60 2
                                              6 0 0 0 61 1 0 0 0 62 1 7 0 63 64
                                              1 0 0 63 65 1 6 7 0 66 1 7 63 0
                                              67 1 0 63 0 68 1 6 69 0 70 1 7 71
                                              0 72 1 0 71 0 73 1 7 74 0 75 2 74
                                              0 0 0 76 1 0 74 0 77 3 79 78 6 74
                                              78 80 3 0 81 0 74 81 82 1 7 83 0
                                              84 2 83 0 0 0 85 1 0 83 0 86 3 88
                                              87 6 83 87 89 3 0 90 0 83 90 91 1
                                              92 26 0 93 1 6 0 26 94 1 92 26 0
                                              95 2 6 0 0 0 96 1 0 0 92 97 1 7
                                              26 0 98 1 0 26 0 99 1 7 100 0 101
                                              1 0 100 0 102 1 27 0 25 103 2 27
                                              0 0 0 104 1 6 33 34 105 1 33 26 0
                                              106 1 33 26 0 107 5 33 0 0 26 26
                                              26 26 108 2 33 109 0 26 110 2 0
                                              54 0 0 58 1 0 71 0 73 1 0 100 0
                                              102 1 0 63 0 68 1 0 26 0 99 2 0
                                              111 34 112 113 1 0 33 34 35 3 0
                                              81 0 74 81 82 3 0 90 0 83 90 91 1
                                              0 0 0 10 1 0 17 0 20 2 0 0 21 0
                                              22 0 0 0 16 1 0 0 0 62 2 0 0 0 21
                                              42 1 0 0 0 12 1 0 74 0 77 1 0 83
                                              0 86 1 0 47 0 50 1 0 43 0 46 1 0
                                              51 0 53 1 0 0 63 65 1 0 0 92 97 0
                                              0 36 38 2 0 54 0 0 56)))))
           '|lookupComplete|)) 
