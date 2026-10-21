
(SDEFUN |SCACHE;compactCache| ((% (|Void|)))
        (SEQ
         (COND ((EQL (QREFELT % 8) 0) (SPADCALL (QREFELT % 11)))
               ('T
                (SEQ
                 (WITHOUT_INTERRUPTS
                  (SETELT % 9
                          (COMPACT_WEAK_ARRAY (QREFELT % 7) (QREFELT % 9)
                                              (QAREF1 (QREFELT % 7) 0))))
                 (EXIT (SPADCALL (QREFELT % 11)))))))) 

(SDEFUN |SCACHE;expandCache| ((|x| (S)) (% (|Void|)))
        (SPROG
         ((|ncache_size| (|NonNegativeInteger|)) (|elem| (S))
          (|ncache| (|PrimitiveArray| S)) (|k| NIL) (#1=#:G18 NIL))
         (SEQ
          (COND
           ((EQL (QREFELT % 8) (QREFELT % 9))
            (SEQ (|SCACHE;compactCache| %)
                 (LETT |ncache_size|
                       (+ (QREFELT % 9) (MIN (MAX (QREFELT % 9) 1000) 10000)))
                 (EXIT
                  (COND
                   ((< |ncache_size| (QVSIZE (QREFELT % 7)))
                    (SETELT % 8 |ncache_size|))
                   (#2='T
                    (SEQ
                     (LETT |elem|
                           (COND ((EQL (QREFELT % 9) 0) |x|)
                                 (#2# (QAREF1 (QREFELT % 7) 0))))
                     (LETT |ncache| (MAKEARR1 |ncache_size| |elem|))
                     (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT % 9) 1)) G190
                          (COND ((|greater_SI| |k| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF1 |ncache| |k|
                                       (QAREF1 (QREFELT % 7) |k|))))
                          (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                     (SETELT % 7 |ncache|)
                     (EXIT (SETELT % 8 |ncache_size|)))))))))
          (EXIT (SPADCALL (QREFELT % 11)))))) 

(SDEFUN |SCACHE;insertBefore|
        ((|l| (|NonNegativeInteger|)) (|x| (S)) (% (|Void|)))
        (SPROG ((|vscan| (|PrimitiveArray| S)) (|k| NIL) (#1=#:G23 NIL))
               (SEQ (LETT |vscan| (QREFELT % 7))
                    (SEQ (LETT |k| 0) (LETT #1# (- (- (QREFELT % 9) |l|) 1))
                         G190 (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (QSETAREF1 |vscan| (- (QREFELT % 9) |k|)
                                      (QAREF1 |vscan|
                                              (- (- (QREFELT % 9) |k|) 1)))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (QSETAREF1 |vscan| |l| |x|)
                    (SETELT % 9 (+ (QREFELT % 9) 1))
                    (EXIT (SPADCALL (QREFELT % 11)))))) 

(SDEFUN |SCACHE;shiftCache|
        ((|l| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (% (|Void|)))
        (SPROG
         ((|vscan| (|PrimitiveArray| S)) (|k| NIL) (#1=#:G29 NIL) (|x| (S)))
         (SEQ (LETT |vscan| (QREFELT % 7))
              (SEQ (LETT |k| |l|) (LETT #1# (- (QREFELT % 9) 1)) G190
                   (COND ((> |k| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |vscan| |k|))
                        (EXIT
                         (SPADCALL |x| (+ |n| (SPADCALL |x| (QREFELT % 13)))
                                   (QREFELT % 14))))
                   (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL (QREFELT % 11)))))) 

(SDEFUN |SCACHE;clearCache;V;5| ((% (|Void|)))
        (SPROG
         ((|vscan| (|PrimitiveArray| S)) (|k| NIL) (#1=#:G35 NIL) (|x| (S)))
         (SEQ (LETT |vscan| (QREFELT % 7))
              (SEQ (LETT |k| 0) (LETT #1# (- (QREFELT % 9) 1)) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ (LETT |x| (QAREF1 |vscan| |k|))
                        (EXIT (SPADCALL |x| 0 (QREFELT % 14))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SETELT % 7 (MAKE-ARRAY 0)) (SETELT % 8 0) (SETELT % 9 0)
              (EXIT (SPADCALL (QREFELT % 11)))))) 

(SDEFUN |SCACHE;insertAtEnd|
        ((|x| (S)) (|diff| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((|y| (S)) (|pos| (|NonNegativeInteger|)))
               (SEQ (|SCACHE;expandCache| |x| %)
                    (LETT |pos|
                          (COND ((EQL (QREFELT % 9) 0) |diff|)
                                ('T
                                 (SEQ
                                  (LETT |y|
                                        (QAREF1 (QREFELT % 7)
                                                (- (QREFELT % 9) 1)))
                                  (EXIT
                                   (+ |diff|
                                      (SPADCALL |y| (QREFELT % 13))))))))
                    (SPADCALL |x| |pos| (QREFELT % 14))
                    (QSETAREF1 (QREFELT % 7) (QREFELT % 9) |x|)
                    (SETELT % 9 (+ (QREFELT % 9) 1)) (EXIT |x|)))) 

(SDEFUN |SCACHE;get_index| ((|elem| (S)) (|idx| (|Integer|)) (% (|Integer|)))
        (SPROG ((|vscan| (|PrimitiveArray| S)) (|y| (S)))
               (SEQ
                (COND
                 ((>= |idx| (QREFELT % 9)) (LETT |idx| (- (QREFELT % 9) 1))))
                (LETT |vscan| (QREFELT % 7)) (LETT |y| (QAREF1 |vscan| |idx|))
                (EXIT
                 (COND ((EQ |elem| |y|) |idx|)
                       ((> (SPADCALL |elem| (QREFELT % 13))
                           (SPADCALL |y| (QREFELT % 13)))
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (NULL (EQ |elem| (QAREF1 |vscan| |idx|))))
                                (GO G191)))
                              (SEQ (EXIT (LETT |idx| (+ |idx| 1)))) NIL
                              (GO G190) G191 (EXIT NIL))
                         (EXIT |idx|)))
                       ('T
                        (SEQ
                         (SEQ G190
                              (COND
                               ((NULL
                                 (NULL (EQ |elem| (QAREF1 |vscan| |idx|))))
                                (GO G191)))
                              (SEQ (EXIT (LETT |idx| (- |idx| 1)))) NIL
                              (GO G190) G191 (EXIT NIL))
                         (EXIT |idx|)))))))) 

(SDEFUN |SCACHE;linearSearch;MU;8|
        ((|equal?| (|Mapping| (|Boolean|) S)) (% (|Union| S "failed")))
        (SPROG ((|y| (S)) (|k| (|Integer|)) (#1=#:G62 NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |k| 0)
                      (SEQ G190 (COND ((NULL (< |k| (QREFELT % 9))) (GO G191)))
                           (SEQ (LETT |y| (QAREF1 (QREFELT % 7) |k|))
                                (EXIT
                                 (COND
                                  ((SPADCALL |y| |equal?|)
                                   (PROGN
                                    (LETT #1# (CONS 0 |y|))
                                    (GO #2=#:G61)))
                                  ('T
                                   (LETT |k|
                                         (+ 1
                                            (|SCACHE;get_index| |y| |k|
                                             %)))))))
                           NIL (GO G190) G191 (EXIT NIL))
                      (EXIT (PROGN (LETT #1# (CONS 1 "failed")) (GO #2#)))))
                #2# (EXIT #1#)))) 

(SDEFUN |SCACHE;enterInCache;SMS;9|
        ((|x| (S)) (|equal?| (|Mapping| (|Boolean|) S)) (% (S)))
        (SPROG ((|res| (|Union| S "failed")))
               (SEQ (LETT |res| (SPADCALL |equal?| (QREFELT % 18)))
                    (EXIT
                     (COND ((QEQCAR |res| 0) (QCDR |res|))
                           ('T (|SCACHE;insertAtEnd| |x| 1 %))))))) 

(SDEFUN |SCACHE;binarySearch;SMU;10|
        ((|x| (S)) (|triage| (|Mapping| (|Integer|) S S))
         (% (|Union| S "failed")))
        (SPROG
         ((|has_vm| (|Boolean|)) (|y| (S)) (|cp| (|Integer|)) (#1=#:G83 NIL)
          (|vscan| (|PrimitiveArray| S)) (|i| (|Integer|)) (|m| (|Integer|))
          (|vm| (S)) (|l| (|Integer|)) (|vl| (S)))
         (SEQ
          (EXIT
           (COND ((ZEROP (QREFELT % 9)) (CONS 1 "failed"))
                 ('T
                  (SEQ
                   (SEQ (LETT |vscan| (QREFELT % 7)) (LETT |l| -1)
                        (LETT |m| (QREFELT % 9))
                        (EXIT
                         (SEQ G190 (COND ((NULL (< (+ |l| 1) |m|)) (GO G191)))
                              (SEQ (LETT |has_vm| (< |m| (QREFELT % 9)))
                                   (LETT |i| (ASH (+ |l| |m|) -1))
                                   (LETT |cp|
                                         (SPADCALL |x|
                                                   (LETT |y|
                                                         (QAREF1 |vscan| |i|))
                                                   |triage|))
                                   (EXIT
                                    (COND
                                     ((ZEROP |cp|)
                                      (PROGN
                                       (LETT #1# (CONS 0 |y|))
                                       (GO #2=#:G82)))
                                     ('T
                                      (SEQ (LETT |vscan| (QREFELT % 7))
                                           (COND
                                            ((NULL (< |l| 0))
                                             (LETT |l|
                                                   (|SCACHE;get_index| |vl| |l|
                                                    %))))
                                           (LETT |i|
                                                 (|SCACHE;get_index| |y| |i|
                                                  %))
                                           (COND
                                            (|has_vm|
                                             (LETT |m|
                                                   (|SCACHE;get_index| |vm| |m|
                                                    %)))
                                            ('T (LETT |m| (QREFELT % 9))))
                                           (EXIT
                                            (COND
                                             ((< |cp| 0)
                                              (SEQ (LETT |m| |i|)
                                                   (EXIT (LETT |vm| |y|))))
                                             ('T
                                              (SEQ (LETT |l| |i|)
                                                   (EXIT
                                                    (LETT |vl| |y|)))))))))))
                              NIL (GO G190) G191 (EXIT NIL))))
                   (EXIT (CONS 1 "failed"))))))
          #2# (EXIT #1#)))) 

(SDEFUN |SCACHE;enterInCache;SMS;11|
        ((|x| (S)) (|triage| (|Mapping| (|Integer|) S S)) (% (S)))
        (SPROG
         ((|has_vm| (|Boolean|)) (|y| (S)) (|cp| (|Integer|)) (#1=#:G96 NIL)
          (|vscan| (|PrimitiveArray| S)) (|i| (|Integer|)) (|m| (|Integer|))
          (|vm| (S)) (|l| (|Integer|)) (|vl| (S))
          (|pos| (|NonNegativeInteger|)) (#2=#:G91 NIL))
         (SEQ
          (EXIT
           (COND ((ZEROP (QREFELT % 9)) (|SCACHE;insertAtEnd| |x| 1024 %))
                 (#3='T
                  (SEQ
                   (SEQ (LETT |vscan| (QREFELT % 7)) (LETT |l| -1)
                        (LETT |m| (QREFELT % 9))
                        (EXIT
                         (SEQ G190 (COND ((NULL (< (+ |l| 1) |m|)) (GO G191)))
                              (SEQ (LETT |has_vm| (< |m| (QREFELT % 9)))
                                   (LETT |i| (ASH (+ |l| |m|) -1))
                                   (LETT |cp|
                                         (SPADCALL |x|
                                                   (LETT |y|
                                                         (QAREF1 |vscan| |i|))
                                                   |triage|))
                                   (EXIT
                                    (COND
                                     ((ZEROP |cp|)
                                      (PROGN (LETT #1# |y|) (GO #4=#:G95)))
                                     ('T
                                      (SEQ (LETT |vscan| (QREFELT % 7))
                                           (COND
                                            ((NULL (< |l| 0))
                                             (LETT |l|
                                                   (|SCACHE;get_index| |vl| |l|
                                                    %))))
                                           (LETT |i|
                                                 (|SCACHE;get_index| |y| |i|
                                                  %))
                                           (COND
                                            (|has_vm|
                                             (LETT |m|
                                                   (|SCACHE;get_index| |vm| |m|
                                                    %)))
                                            ('T (LETT |m| (QREFELT % 9))))
                                           (EXIT
                                            (COND
                                             ((< |cp| 0)
                                              (SEQ (LETT |m| |i|)
                                                   (EXIT (LETT |vm| |y|))))
                                             ('T
                                              (SEQ (LETT |l| |i|)
                                                   (EXIT
                                                    (LETT |vl| |y|)))))))))))
                              NIL (GO G190) G191 (EXIT NIL))))
                   (EXIT
                    (COND
                     ((EQL |m| (QREFELT % 9))
                      (|SCACHE;insertAtEnd| |x| 1024 %))
                     (#3#
                      (SEQ
                       (LETT |pos|
                             (COND ((< |l| 0) 0)
                                   (#3# (SPADCALL |vl| (QREFELT % 13)))))
                       (EXIT
                        (|SCACHE;insertInCache|
                         (PROG1 (LETT #2# |m|)
                           (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #2#))
                         |x| |pos| %))))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |SCACHE;insertInCache|
        ((|before| (|NonNegativeInteger|)) (|x| (S))
         (|pos| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((|y| (S)) (#1=#:G97 NIL) (#2=#:G99 NIL))
               (SEQ (LETT |y| (QAREF1 (QREFELT % 7) |before|))
                    (|SCACHE;expandCache| |x| %)
                    (LETT |before|
                          (PROG1 (LETT #1# (|SCACHE;get_index| |y| |before| %))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#)))
                    (COND
                     ((EQL (+ |pos| 1) (SPADCALL |y| (QREFELT % 13)))
                      (WITHOUT_INTERRUPTS
                       (|SCACHE;shiftCache| |before| 1024 %))))
                    (SPADCALL |x|
                              (+ |pos|
                                 (|quotient_INT|
                                  (PROG1
                                      (LETT #2#
                                            (- (SPADCALL |y| (QREFELT % 13))
                                               |pos|))
                                    (|check_subtype2| (>= #2# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #2#))
                                  2))
                              (QREFELT % 14))
                    (WITHOUT_INTERRUPTS (|SCACHE;insertBefore| |before| |x| %))
                    (EXIT |x|)))) 

(DECLAIM (NOTINLINE |SortedCache;|)) 

(DEFUN |SortedCache;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|SortedCache| DV$1))
          (LETT % (GETREFV 23))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SortedCache| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (MAKE-ARRAY 0))
          (QSETREFV % 8 0)
          (QSETREFV % 9 0)
          %))) 

(DEFUN |SortedCache| (#1=#:G102)
  (SPROG NIL
         (PROG (#2=#:G103)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SortedCache|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|SortedCache;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|SortedCache|)))))))))) 

(MAKEPROP '|SortedCache| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|cache| '|cache_size|
              '|cache_use| (|Void|) (0 . |void|) (|NonNegativeInteger|)
              (4 . |position|) (9 . |setPosition|) |SCACHE;clearCache;V;5|
              (|Union| 6 '#1="failed") (|Mapping| (|Boolean|) 6)
              |SCACHE;linearSearch;MU;8| |SCACHE;enterInCache;SMS;9|
              (|Mapping| (|Integer|) 6 6) |SCACHE;binarySearch;SMU;10|
              |SCACHE;enterInCache;SMS;11|)
           '#(|linearSearch| 15 |enterInCache| 20 |clearCache| 32
              |binarySearch| 36)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|clearCache| ((|Void|))) T)
                                   '((|enterInCache|
                                      (|#1| |#1| (|Mapping| (|Boolean|) |#1|)))
                                     T)
                                   '((|linearSearch|
                                      ((|Union| |#1| #1#)
                                       (|Mapping| (|Boolean|) |#1|)))
                                     T)
                                   '((|enterInCache|
                                      (|#1| |#1|
                                       (|Mapping| (|Integer|) |#1| |#1|)))
                                     T)
                                   '((|binarySearch|
                                      ((|Union| |#1| "failed") |#1|
                                       (|Mapping| (|Integer|) |#1| |#1|)))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 22
                                            '(0 10 0 11 1 6 12 0 13 2 6 10 0 12
                                              14 1 0 16 17 18 2 0 6 6 20 22 2 0
                                              6 6 17 19 0 0 10 15 2 0 16 6 20
                                              21)))))
           '|lookupComplete|)) 
