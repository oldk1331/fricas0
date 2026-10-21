
(SDEFUN |BRILL;squaredPolynomial| ((|p| (UP)) (% (|Boolean|)))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (SEQ (LETT |d| (SPADCALL |p| (QREFELT % 8)))
                    (EXIT
                     (COND ((EQL |d| 0) 'T) ((ODDP |d|) NIL)
                           ('T
                            (|BRILL;squaredPolynomial|
                             (SPADCALL |p| (QREFELT % 10)) %))))))) 

(SDEFUN |BRILL;primeEnough?|
        ((|n| (|Integer|)) (|b| (|Integer|)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G27 NIL) (|d| (|Union| (|Integer|) #2="failed"))
          (#3=#:G18 NIL) (|bb| (|Float|)) (#4=#:G26 NIL) (#5=#:G25 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |bb| (SPADCALL |b| (QREFELT % 13)))
                (SEQ (LETT |i| 2) (LETT #1# |b|) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ G190
                            (COND
                             ((NULL
                               (QEQCAR (LETT |d| (|exquo_INT| |n| |i|)) 0))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |n|
                                     (PROG2 (LETT #3# |d|)
                                         (QCDR #3#)
                                       (|check_union2| (QEQCAR #3# 0)
                                                       (|Integer|)
                                                       (|Union| (|Integer|)
                                                                #2#)
                                                       #3#)))
                               (LETT |bb|
                                     (SPADCALL |bb|
                                               (SPADCALL |i| (QREFELT % 13))
                                               (QREFELT % 14)))
                               (EXIT
                                (COND
                                 ((SPADCALL |bb| (|spadConstant| % 15)
                                            (QREFELT % 17))
                                  (PROGN
                                   (LETT #5#
                                         (PROGN (LETT #4# NIL) (GO #6=#:G24)))
                                   (GO #7=#:G20)))))))
                             #7# (EXIT #5#))
                            NIL (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                (EXIT (SPADCALL |n| (QREFELT % 18)))))
          #6# (EXIT #4#)))) 

(SDEFUN |BRILL;brillhartTrials;Nni;3| ((% (|NonNegativeInteger|)))
        (QREFELT % 19)) 

(SDEFUN |BRILL;brillhartTrials;2Nni;4|
        ((|n| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG ((|#G8| (|NonNegativeInteger|)) (|#G9| (|NonNegativeInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G8| |n|)
                 (LETT |#G9| (QREFELT % 19))
                 (SETELT % 19 |#G8|)
                 (LETT |n| |#G9|))
                (EXIT |n|)))) 

(SDEFUN |BRILL;brillhartIrreducible?;UPB;5| ((|p| (UP)) (% (|Boolean|)))
        (SPADCALL |p| (SPADCALL |p| (QREFELT % 22)) (QREFELT % 23))) 

(SDEFUN |BRILL;brillhartIrreducible?;UP2B;6|
        ((|p| (UP)) (|noLinears| (|Boolean|)) (% (|Boolean|)))
        (SPROG
         ((|origBound| #1=(|Integer|)) (|even0| #2=(|Boolean|)) (|even1| #2#)
          (|polyx2| (|Boolean|)) (|largeEnough| #1#) (|count| #1#) (|i| NIL)
          (#3=#:G47 NIL) (|small| (|Integer|)) (#4=#:G46 NIL) (#5=#:G45 NIL))
         (SEQ
          (EXIT
           (COND ((ZEROP (QREFELT % 19)) NIL)
                 (#6='T
                  (SEQ
                   (LETT |origBound|
                         (LETT |largeEnough|
                               (+ (SPADCALL |p| (QREFELT % 26)) 1)))
                   (LETT |even0| (EVENP (SPADCALL |p| 0 (QREFELT % 27))))
                   (LETT |even1| (EVENP (SPADCALL |p| 1 (QREFELT % 29))))
                   (LETT |polyx2| (|BRILL;squaredPolynomial| |p| %))
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |p| |largeEnough| (QREFELT % 29))
                                (QREFELT % 18))
                      'T)
                     (#6#
                      (SEQ
                       (COND
                        ((NULL |polyx2|)
                         (COND
                          ((SPADCALL
                            (SPADCALL |p| (- |largeEnough|) (QREFELT % 29))
                            (QREFELT % 18))
                           (EXIT 'T)))))
                       (EXIT
                        (COND ((EQL (QREFELT % 19) 1) NIL)
                              (#6#
                               (SEQ (LETT |largeEnough| (+ |largeEnough| 1))
                                    (EXIT
                                     (COND
                                      ((|BRILL;primeEnough?|
                                        (SPADCALL |p| |largeEnough|
                                                  (QREFELT % 29))
                                        (COND (|noLinears| 4) (#6# 2)) %)
                                       'T)
                                      (#6#
                                       (SEQ
                                        (COND
                                         ((NULL |polyx2|)
                                          (COND
                                           ((|BRILL;primeEnough?|
                                             (SPADCALL |p| (- |largeEnough|)
                                                       (QREFELT % 29))
                                             (COND (|noLinears| 4) (#6# 2)) %)
                                            (EXIT 'T)))))
                                        (COND
                                         ((ODDP |largeEnough|)
                                          (COND
                                           (|even0|
                                            (LETT |largeEnough|
                                                  (+ |largeEnough| 1)))))
                                         (|even1|
                                          (LETT |largeEnough|
                                                (+ |largeEnough| 1))))
                                        (LETT |count|
                                              (+
                                               (* (COND (|polyx2| 2) (#6# 1))
                                                  (- (QREFELT % 19) 2))
                                               |largeEnough|))
                                        (SEQ (LETT |i| (+ |largeEnough| 1))
                                             (LETT #3# |count|) G190
                                             (COND ((> |i| #3#) (GO G191)))
                                             (SEQ
                                              (LETT |small|
                                                    (COND
                                                     (|noLinears|
                                                      (EXPT (- |i| |origBound|)
                                                            2))
                                                     ('T (- |i| |origBound|))))
                                              (EXIT
                                               (COND
                                                ((|BRILL;primeEnough?|
                                                  (SPADCALL |p| |i|
                                                            (QREFELT % 29))
                                                  |small| %)
                                                 (PROGN
                                                  (LETT #4# 'T)
                                                  (GO #7=#:G44)))
                                                ((NULL |polyx2|)
                                                 (SEQ
                                                  (EXIT
                                                   (COND
                                                    ((|BRILL;primeEnough?|
                                                      (SPADCALL |p| (- |i|)
                                                                (QREFELT % 29))
                                                      |small| %)
                                                     (PROGN
                                                      (LETT #5#
                                                            (PROGN
                                                             (LETT #4# 'T)
                                                             (GO #7#)))
                                                      (GO #8=#:G36)))))
                                                  #8# (EXIT #5#))))))
                                             (LETT |i| (+ |i| 1)) (GO G190)
                                             G191 (EXIT NIL))
                                        (EXIT NIL)))))))))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |BRILL;noLinearFactor?;UPB;7| ((|p| (UP)) (% (|Boolean|)))
        (COND
         ((ODDP (SPADCALL |p| (QREFELT % 30)))
          (COND
           ((ODDP (SPADCALL |p| 0 (QREFELT % 27)))
            (ODDP (SPADCALL |p| 1 (QREFELT % 29))))
           (#1='T NIL)))
         (#1# NIL))) 

(DECLAIM (NOTINLINE |BrillhartTests;|)) 

(DEFUN |BrillhartTests;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|BrillhartTests| DV$1))
          (LETT % (GETREFV 31))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|BrillhartTests| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 19 6)
          %))) 

(DEFUN |BrillhartTests| (#1=#:G51)
  (SPROG NIL
         (PROG (#2=#:G52)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BrillhartTests|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|BrillhartTests;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BrillhartTests|)))))))))) 

(MAKEPROP '|BrillhartTests| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |degree|) (5 . |0|) (9 . |reductum|) (|Integer|) (|Float|)
              (14 . |coerce|) (19 . /) (25 . |1|) (|Boolean|) (29 . <)
              (35 . |prime?|) '|brillharttrials| |BRILL;brillhartTrials;Nni;3|
              |BRILL;brillhartTrials;2Nni;4| |BRILL;noLinearFactor?;UPB;7|
              |BRILL;brillhartIrreducible?;UP2B;6|
              |BRILL;brillhartIrreducible?;UPB;5|
              (|GaloisGroupFactorizationUtilities| 11 6 12) (40 . |rootBound|)
              (45 . |coefficient|) (51 . |1|) (55 . |elt|)
              (61 . |leadingCoefficient|))
           '#(|noLinearFactor?| 66 |brillhartTrials| 71 |brillhartIrreducible?|
              80)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|brillhartIrreducible?| ((|Boolean|) |#1|)) T)
                              '((|brillhartIrreducible?|
                                 ((|Boolean|) |#1| (|Boolean|)))
                                T)
                              '((|brillhartTrials| ((|NonNegativeInteger|))) T)
                              '((|brillhartTrials|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|noLinearFactor?| ((|Boolean|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 30
                                            '(1 6 7 0 8 0 6 0 9 1 6 0 0 10 1 12
                                              0 11 13 2 12 0 0 0 14 0 12 0 15 2
                                              12 16 0 0 17 1 11 16 0 18 1 25 11
                                              6 26 2 6 11 0 7 27 0 6 0 28 2 6
                                              11 0 11 29 1 6 11 0 30 1 0 16 6
                                              22 1 0 7 7 21 0 0 7 20 1 0 16 6
                                              24 2 0 16 6 16 23)))))
           '|lookupComplete|)) 
