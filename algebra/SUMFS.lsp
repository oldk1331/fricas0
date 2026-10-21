
(SDEFUN |SUMFS;newk| ((% (|Kernel| F)))
        (SPADCALL (SPADCALL (QREFELT % 9)) (QREFELT % 11))) 

(SDEFUN |SUMFS;sum;FSbF;2| ((|x| (F)) (|s| (|SegmentBinding| F)) (% (F)))
        (SPROG ((|k| (|Kernel| F)) (|u| (|Union| F "failed")))
               (SEQ
                (LETT |k|
                      (SPADCALL (SPADCALL |s| (QREFELT % 13)) (QREFELT % 11)))
                (LETT |u| (|SUMFS;innersum| |x| |k| %))
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |x| |s| (QREFELT % 15)))
                       ('T
                        (SPADCALL
                         (SPADCALL (QCDR |u|) |k|
                                   (SPADCALL (|spadConstant| % 17)
                                             (SPADCALL
                                              (SPADCALL |s| (QREFELT % 19))
                                              (QREFELT % 20))
                                             (QREFELT % 21))
                                   (QREFELT % 23))
                         (SPADCALL (QCDR |u|) |k|
                                   (SPADCALL (SPADCALL |s| (QREFELT % 19))
                                             (QREFELT % 24))
                                   (QREFELT % 23))
                         (QREFELT % 25)))))))) 

(SDEFUN |SUMFS;sum;FSF;3| ((|x| (F)) (|v| (|Symbol|)) (% (F)))
        (SPROG ((|u| (|Union| F "failed")))
               (SEQ
                (LETT |u|
                      (|SUMFS;innersum| |x| (SPADCALL |v| (QREFELT % 11)) %))
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |x| |v| (QREFELT % 27)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |SUMFS;notRF?| ((|f| (F)) (|k| (|Kernel| F)) (% (|Boolean|)))
        (SPROG ((|kk| NIL) (#1=#:G30 NIL) (#2=#:G29 NIL) (#3=#:G28 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |kk| NIL)
                         (LETT #1# (SPADCALL |f| (QREFELT % 30))) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |kk| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |k|
                                       (SPADCALL (SPADCALL |kk| (QREFELT % 31))
                                                 (QREFELT % 30))
                                       (QREFELT % 34))
                             (COND
                              ((QEQCAR (SPADCALL |kk| (QREFELT % 36)) 1)
                               (PROGN
                                (LETT #3# (PROGN (LETT #2# 'T) (GO #4=#:G27)))
                                (GO #5=#:G25))))))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                   #5# (EXIT #3#))
                  (EXIT NIL)))
                #4# (EXIT #2#)))) 

(SDEFUN |SUMFS;innersum|
        ((|x| (F)) (|k| (|Kernel| F)) (% (|Union| F "failed")))
        (SPROG ((|x1| (F)) (|f| (F)) (|u| (|Union| F "failed")))
               (SEQ
                (COND
                 ((SPADCALL |x| (QREFELT % 37)) (CONS 0 (|spadConstant| % 38)))
                 ((|SUMFS;notRF?|
                   (LETT |f|
                         (SPADCALL
                          (SPADCALL |x|
                                    (LETT |x1|
                                          (SPADCALL |x| |k|
                                                    (SPADCALL
                                                     (SPADCALL |k|
                                                               (QREFELT % 31))
                                                     (|spadConstant| % 17)
                                                     (QREFELT % 25))
                                                    (QREFELT % 23)))
                                    (QREFELT % 39))
                          (QREFELT % 41)))
                   |k| %)
                  (CONS 1 "failed"))
                 (#1='T
                  (SEQ
                   (LETT |u|
                         (SPADCALL |f| |k| (CONS (|function| |SUMFS;newk|) %)
                                   (QREFELT % 45)))
                   (EXIT
                    (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                          (#1#
                           (CONS 0
                                 (SPADCALL |x1|
                                           (SPADCALL (QCDR |u|) |k|
                                                     (SPADCALL
                                                      (SPADCALL |k|
                                                                (QREFELT % 31))
                                                      (|spadConstant| % 17)
                                                      (QREFELT % 25))
                                                     (QREFELT % 23))
                                           (QREFELT % 46)))))))))))) 

(DECLAIM (NOTINLINE |FunctionSpaceSum;|)) 

(DEFUN |FunctionSpaceSum;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|FunctionSpaceSum| DV$1 DV$2))
          (LETT % (GETREFV 47))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FunctionSpaceSum| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FunctionSpaceSum| (&REST #1=#:G42)
  (SPROG NIL
         (PROG (#2=#:G43)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionSpaceSum|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FunctionSpaceSum;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FunctionSpaceSum|)))))))))) 

(MAKEPROP '|FunctionSpaceSum| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|Symbol|)
              (0 . |new|) (|Kernel| 7) (4 . |kernel|) (|SegmentBinding| 7)
              (9 . |variable|) (|SegmentBinding| %) (14 . |summation|)
              (20 . |1|) (24 . |1|) (|Segment| 7) (28 . |segment|)
              (33 . |high|) (38 . +) (|Kernel| %) (44 . |eval|) (51 . |low|)
              (56 . -) |SUMFS;sum;FSbF;2| (62 . |summation|) |SUMFS;sum;FSF;3|
              (|List| 22) (68 . |tower|) (73 . |coerce|) (|Boolean|)
              (|List| 10) (78 . |member?|) (|Union| 8 '"failed")
              (84 . |symbolIfCan|) (89 . |zero?|) (94 . |0|) (98 . /)
              (|ElementaryFunctionStructurePackage| 6 7) (104 . |normalize|)
              (|Union| 7 '"failed") (|Mapping| 10)
              (|GosperSummationMethod| (|IndexedExponents| 10) 10 6
                                       (|SparseMultivariatePolynomial| 6 10) 7)
              (109 . |GospersMethod|) (116 . *))
           '#(|sum| 122) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|sum| (|#2| |#2| (|Symbol|))) T)
                                   '((|sum|
                                      (|#2| |#2| (|SegmentBinding| |#2|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(0 8 0 9 1 10 0 8 11 1 12 8 0 13 2
                                              7 0 0 14 15 0 6 0 16 0 7 0 17 1
                                              12 18 0 19 1 18 7 0 20 2 7 0 0 0
                                              21 3 7 0 0 22 0 23 1 18 7 0 24 2
                                              7 0 0 0 25 2 7 0 0 8 27 1 7 29 0
                                              30 1 7 0 22 31 2 33 32 10 0 34 1
                                              10 35 0 36 1 7 32 0 37 0 7 0 38 2
                                              7 0 0 0 39 1 40 7 7 41 3 44 42 7
                                              10 43 45 2 7 0 0 0 46 2 0 7 7 8
                                              28 2 0 7 7 12 26)))))
           '|lookupComplete|)) 
