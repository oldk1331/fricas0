
(SDEFUN |ORTHPOL;laguerreL;Nni2R;1|
        ((|n| (|NonNegativeInteger|)) (|x| (R)) (% (R)))
        (SPROG
         ((|#G5| (R)) (|#G6| (R)) (|i| NIL) (#1=#:G4 NIL) (|#G8| (R))
          (|#G9| (R)) (|p1| (R)) (|p0| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| % 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G5|
                         (SPADCALL (SPADCALL |x| (QREFELT % 9))
                                   (|spadConstant| % 8) (QREFELT % 10)))
                   (LETT |#G6| (|spadConstant| % 8))
                   (LETT |p1| |#G5|)
                   (LETT |p0| |#G6|))
                  (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G8|
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL 2 (SPADCALL |i| (QREFELT % 12))
                                              (QREFELT % 14))
                                    (|spadConstant| % 8) (QREFELT % 10))
                                   |x| (QREFELT % 15))
                                  |p1| (QREFELT % 16))
                                 (SPADCALL (EXPT |i| 2) |p0| (QREFELT % 17))
                                 (QREFELT % 15)))
                          (LETT |#G9| |p1|)
                          (LETT |p1| |#G8|)
                          (LETT |p0| |#G9|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;laguerreL;2Nni2R;2|
        ((|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)) (|x| (R))
         (% (R)))
        (SPROG
         ((|ni| (|Integer|)) (|mi| (|Integer|)) (|j| NIL) (#1=#:G13 NIL)
          (#2=#:G7 NIL) (|cx| (|Integer|)) (|p0| (R)) (|p1| (R)))
         (SEQ (LETT |ni| |n|) (LETT |mi| |m|)
              (LETT |cx|
                    (*
                     (* (EXPT -1 |m|)
                        (SPADCALL |ni| (- |ni| |mi|) (QREFELT % 20)))
                     (SPADCALL |ni| (QREFELT % 22))))
              (LETT |p0| (|spadConstant| % 8))
              (LETT |p1| (SPADCALL |cx| (QREFELT % 12)))
              (SEQ (LETT |j| 1) (LETT #1# (- |ni| |mi|)) G190
                   (COND ((|greater_SI| |j| #1#) (GO G191)))
                   (SEQ (LETT |cx| (- (* |cx| (+ (- (- |ni| |mi|) |j|) 1))))
                        (LETT |cx|
                              (PROG2
                                  (LETT #2#
                                        (|exquo_INT| |cx|
                                                     (* (+ |mi| |j|) |j|)))
                                  (QCDR #2#)
                                (|check_union2| (QEQCAR #2# 0) (|Integer|)
                                                (|Union| (|Integer|) "failed")
                                                #2#)))
                        (LETT |p0| (SPADCALL |p0| |x| (QREFELT % 16)))
                        (EXIT
                         (LETT |p1|
                               (SPADCALL |p1|
                                         (SPADCALL |cx| |p0| (QREFELT % 17))
                                         (QREFELT % 10)))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (EXIT |p1|)))) 

(SDEFUN |ORTHPOL;chebyshevT;Nni2R;3|
        ((|n| (|NonNegativeInteger|)) (|x| (R)) (% (R)))
        (SPROG
         ((|#G16| (R)) (|#G17| (R)) (|i| NIL) (#1=#:G18 NIL) (|#G19| (R))
          (|#G20| (R)) (|p1| (R)) (|p0| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| % 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G16| |x|)
                   (LETT |#G17| (|spadConstant| % 8))
                   (LETT |p1| |#G16|)
                   (LETT |p0| |#G17|))
                  (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G19|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT % 14)) |p1|
                                           (QREFELT % 16))
                                 |p0| (QREFELT % 15)))
                          (LETT |#G20| |p1|)
                          (LETT |p1| |#G19|)
                          (LETT |p0| |#G20|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;chebyshevU;Nni2R;4|
        ((|n| (|NonNegativeInteger|)) (|x| (R)) (% (R)))
        (SPROG
         ((|#G23| (R)) (|#G24| (R)) (|i| NIL) (#1=#:G23 NIL) (|#G26| (R))
          (|#G27| (R)) (|p1| (R)) (|p0| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| % 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G23| (SPADCALL 2 |x| (QREFELT % 14)))
                   (LETT |#G24| (|spadConstant| % 8))
                   (LETT |p1| |#G23|)
                   (LETT |p0| |#G24|))
                  (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G26|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT % 14)) |p1|
                                           (QREFELT % 16))
                                 |p0| (QREFELT % 15)))
                          (LETT |#G27| |p1|)
                          (LETT |p1| |#G26|)
                          (LETT |p0| |#G27|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;hermiteH;Nni2R;5|
        ((|n| (|NonNegativeInteger|)) (|x| (R)) (% (R)))
        (SPROG
         ((|#G30| (R)) (|#G31| (R)) (|i| NIL) (#1=#:G28 NIL) (|#G33| (R))
          (|#G34| (R)) (|p1| (R)) (|p0| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| % 8))
                ('T
                 (SEQ
                  (PROGN
                   (LETT |#G30| (SPADCALL 2 |x| (QREFELT % 14)))
                   (LETT |#G31| (|spadConstant| % 8))
                   (LETT |p1| |#G30|)
                   (LETT |p0| |#G31|))
                  (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT |#G33|
                                (SPADCALL
                                 (SPADCALL (SPADCALL 2 |x| (QREFELT % 14)) |p1|
                                           (QREFELT % 16))
                                 (SPADCALL (* 2 |i|) |p0| (QREFELT % 17))
                                 (QREFELT % 15)))
                          (LETT |#G34| |p1|)
                          (LETT |p1| |#G33|)
                          (LETT |p0| |#G34|))))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT |p1|))))))) 

(SDEFUN |ORTHPOL;legendreP;Nni2R;6|
        ((|n| (|NonNegativeInteger|)) (|x| (R)) (% (R)))
        (SPROG
         ((|i| NIL) (#1=#:G34 NIL) (|c| (|Fraction| (|Integer|))) (|#G38| (R))
          (|#G39| (R)) (|p1| (R)) (|p0| (R)))
         (SEQ
          (COND ((EQL |n| 0) (|spadConstant| % 8))
                ('T
                 (SEQ (LETT |p0| (|spadConstant| % 8)) (LETT |p1| |x|)
                      (SEQ (LETT |i| 1) (LETT #1# (- |n| 1)) G190
                           (COND ((|greater_SI| |i| #1#) (GO G191)))
                           (SEQ
                            (LETT |c| (SPADCALL 1 (+ |i| 1) (QREFELT % 28)))
                            (EXIT
                             (PROGN
                              (LETT |#G38|
                                    (SPADCALL |c|
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL (+ (* 2 |i|) 1) |x|
                                                          (QREFELT % 17))
                                                |p1| (QREFELT % 16))
                                               (SPADCALL |i| |p0|
                                                         (QREFELT % 29))
                                               (QREFELT % 15))
                                              (QREFELT % 30)))
                              (LETT |#G39| |p1|)
                              (LETT |p1| |#G38|)
                              (LETT |p0| |#G39|))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                      (EXIT |p1|))))))) 

(DECLAIM (NOTINLINE |OrthogonalPolynomialFunctions;|)) 

(DEFUN |OrthogonalPolynomialFunctions;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|OrthogonalPolynomialFunctions| DV$1))
          (LETT % (GETREFV 32))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))))))
          (|haddProp| |$ConstructorCache| '|OrthogonalPolynomialFunctions|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (QSETREFV % 31
                      (CONS (|dispatchFunction| |ORTHPOL;legendreP;Nni2R;6|)
                            %))))
          %))) 

(DEFUN |OrthogonalPolynomialFunctions| (#1=#:G35)
  (SPROG NIL
         (PROG (#2=#:G36)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OrthogonalPolynomialFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OrthogonalPolynomialFunctions;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|OrthogonalPolynomialFunctions|)))))))))) 

(MAKEPROP '|OrthogonalPolynomialFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |0|) (4 . |1|)
              (8 . -) (13 . +) (|Integer|) (19 . |coerce|) (|PositiveInteger|)
              (24 . *) (30 . -) (36 . *) (42 . *) (|NonNegativeInteger|)
              |ORTHPOL;laguerreL;Nni2R;1| (48 . |binomial|) (54 . ^)
              (60 . |factorial|) |ORTHPOL;laguerreL;2Nni2R;2|
              |ORTHPOL;chebyshevT;Nni2R;3| |ORTHPOL;chebyshevU;Nni2R;4|
              |ORTHPOL;hermiteH;Nni2R;5| (|Fraction| 11) (65 . /) (71 . *)
              (77 . *) (83 . |legendreP|))
           '#(|legendreP| 89 |laguerreL| 95 |hermiteH| 108 |chebyshevU| 114
              |chebyshevT| 120)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|chebyshevT|
                                 (|#1| (|NonNegativeInteger|) |#1|))
                                T)
                              '((|chebyshevU|
                                 (|#1| (|NonNegativeInteger|) |#1|))
                                T)
                              '((|hermiteH| (|#1| (|NonNegativeInteger|) |#1|))
                                T)
                              '((|laguerreL|
                                 (|#1| (|NonNegativeInteger|) |#1|))
                                T)
                              '((|laguerreL|
                                 (|#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|legendreP|
                                 (|#1| (|NonNegativeInteger|) |#1|))
                                (|has| 6 (|Algebra| 27))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 31
                                            '(0 6 0 7 0 6 0 8 1 6 0 0 9 2 6 0 0
                                              0 10 1 6 0 11 12 2 6 0 13 0 14 2
                                              6 0 0 0 15 2 6 0 0 0 16 2 6 0 11
                                              0 17 2 11 0 0 0 20 2 6 0 0 18 21
                                              1 11 0 0 22 2 27 0 11 11 28 2 6 0
                                              18 0 29 2 6 0 27 0 30 2 0 6 18 6
                                              31 2 1 6 18 6 31 3 0 6 18 18 6 23
                                              2 0 6 18 6 19 2 0 6 18 6 26 2 0 6
                                              18 6 25 2 0 6 18 6 24)))))
           '|lookupComplete|)) 
