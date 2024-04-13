
(PUT '|COCHNC;coChainComplex;L%;1| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |COCHNC;coChainComplex;L%;1|
        ((|v| (|List| (|Matrix| (|Integer|)))) (% (%))) |v|) 

(SDEFUN |COCHNC;coChainComplex;Cc%;2| ((|s| (|ChainComplex|)) (% (%)))
        (SPROG ((|tm| (%)))
               (SEQ (LETT |tm| (SPADCALL |s| (QREFELT % 11)))
                    (LETT |tm| (NREVERSE |tm|))
                    (EXIT (SPADCALL (ELT % 13) |tm| (QREFELT % 15)))))) 

(SDEFUN |COCHNC;validate;%B;3| ((|a| (%)) (% (|Boolean|)))
        (SPROG
         ((|last| (|Matrix| (|Integer|))) (#1=#:G27 NIL)
          (|prod| (|Matrix| (|Integer|))) (#2=#:G28 NIL) (|m| NIL)
          (|len| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |len| (LENGTH |a|))
                (COND ((< |len| 2) (PROGN (LETT #1# 'T) (GO #3=#:G26))))
                (LETT |last| (|SPADfirst| |a|))
                (SEQ (LETT |m| NIL) (LETT #2# (CDR |a|)) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |m| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (COND
                       ((SPADCALL (SPADCALL |m| (QREFELT % 18))
                                  (SPADCALL |last| (QREFELT % 19))
                                  (QREFELT % 21))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL "validate failed nRows=" (QREFELT % 24))
                             (SPADCALL (SPADCALL |m| (QREFELT % 18))
                                       (QREFELT % 25))
                             (QREFELT % 26))
                            (SPADCALL " not equal to nCols " (QREFELT % 24))
                            (QREFELT % 26))
                           (SPADCALL (SPADCALL |last| (QREFELT % 19))
                                     (QREFELT % 25))
                           (QREFELT % 26))
                          (QREFELT % 28))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (LETT |prod| (SPADCALL |last| |m| (QREFELT % 29)))
                      (COND
                       ((NULL (SPADCALL |prod| (QREFELT % 30)))
                        (SEQ
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                "validate failed: product of adjacent maps should be zero"
                                (QREFELT % 24))
                               (SPADCALL |last| (QREFELT % 31)) (QREFELT % 26))
                              (SPADCALL " * " (QREFELT % 24)) (QREFELT % 26))
                             (SPADCALL |m| (QREFELT % 31)) (QREFELT % 26))
                            (SPADCALL " = " (QREFELT % 24)) (QREFELT % 26))
                           (SPADCALL |prod| (QREFELT % 31)) (QREFELT % 26))
                          (QREFELT % 28))
                         (EXIT (PROGN (LETT #1# NIL) (GO #3#))))))
                      (EXIT (LETT |last| |m|)))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #3# (EXIT #1#)))) 

(SDEFUN |COCHNC;coboundary;%Nni2L;4|
        ((|a| (%)) (|n| (|NonNegativeInteger|)) (|inp| (|List| VS))
         (% (|List| VS)))
        (SPROG
         ((|res| (|List| VS)) (#1=#:G56 NIL) (|i| NIL) (#2=#:G55 NIL)
          (|res1| (|List| VS)) (|val| (VS)) (#3=#:G54 NIL) (|v| NIL)
          (|vs| (|Vector| (|Integer|))) (|m| (|Matrix| (|Integer|)))
          (|b| (|Vector| (|Integer|))) (|base| (|List| (|Integer|)))
          (#4=#:G53 NIL) (|x| NIL) (#5=#:G52 NIL) (#6=#:G51 NIL) (|p| NIL)
          (|inpn| (|NonNegativeInteger|))
          (|maps| (|List| (|Matrix| (|Integer|)))))
         (SEQ (LETT |maps| (REVERSE |a|)) (LETT |res| NIL)
              (LETT |inpn| (LENGTH |inp|))
              (SEQ (LETT |p| 1) (LETT #6# |inpn|) G190
                   (COND ((|greater_SI| |p| #6#) (GO G191)))
                   (SEQ
                    (LETT |base|
                          (PROGN
                           (LETT #5# NIL)
                           (SEQ (LETT |x| 1) (LETT #4# |inpn|) G190
                                (COND ((|greater_SI| |x| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #5#
                                        (CONS (COND ((EQL |x| |p|) 1) ('T 0))
                                              #5#))))
                                (LETT |x| (|inc_SI| |x|)) (GO G190) G191
                                (EXIT (NREVERSE #5#)))))
                    (LETT |b| (SPADCALL |base| (QREFELT % 35)))
                    (LETT |m|
                          (SPADCALL (SPADCALL |maps| |n| (QREFELT % 36))
                                    (QREFELT % 13)))
                    (LETT |vs| (SPADCALL |b| |m| (QREFELT % 37)))
                    (LETT |res1| NIL)
                    (SEQ (LETT |v| NIL)
                         (LETT #3# (SPADCALL |vs| (QREFELT % 38))) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |v| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |val| (SPADCALL |inp| |p| (QREFELT % 40)))
                              (COND
                               ((EQL |v| 0)
                                (LETT |res1|
                                      (SPADCALL |res1| (|spadConstant| % 41)
                                                (QREFELT % 42)))))
                              (COND
                               ((> |v| 0)
                                (LETT |res1|
                                      (SPADCALL |res1|
                                                (SPADCALL |val| (QREFELT % 43))
                                                (QREFELT % 42)))))
                              (EXIT
                               (COND
                                ((< |v| 0)
                                 (LETT |res1|
                                       (SPADCALL |res1| |val|
                                                 (QREFELT % 42)))))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((NULL |res|) (LETT |res| |res1|))
                           ('T
                            (LETT |res|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |i| 1) (LETT #1# (LENGTH |res1|))
                                        G190
                                        (COND
                                         ((|greater_SI| |i| #1#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL
                                                  (SPADCALL |res| |i|
                                                            (QREFELT % 40))
                                                  (SPADCALL |res1| |i|
                                                            (QREFELT % 40))
                                                  (QREFELT % 44))
                                                 #2#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #2#)))))))))
                   (LETT |p| (|inc_SI| |p|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coHomology;%L;5| ((|a| (%)) (% (|List| (|Homology|))))
        (SPROG
         ((|prev| (|Matrix| (|Integer|))) (|notFirst| (|Boolean|))
          (|res| (|List| (|Homology|))) (|m2| (|Homology|)) (#1=#:G63 NIL)
          (|m1| NIL))
         (SEQ (LETT |res| NIL) (LETT |prev| (MAKE_MATRIX 0 0))
              (LETT |notFirst| NIL)
              (SEQ (LETT |m1| NIL) (LETT #1# |a|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |m1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|notFirst|
                      (SEQ (LETT |m2| (SPADCALL |m1| |prev| (QREFELT % 48)))
                           (EXIT
                            (LETT |res|
                                  (SPADCALL |res| |m2| (QREFELT % 50)))))))
                    (LETT |notFirst| 'T) (EXIT (LETT |prev| |m1|)))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |COCHNC;coerce;%Of;6| ((|s| (%)) (% (|OutputForm|)))
        (SPROG
         ((|lst| (|List| (|OutputForm|))) (#1=#:G69 NIL) (|x| NIL)
          (#2=#:G68 NIL))
         (SEQ
          (LETT |lst|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |x| NIL) (LETT #1# |s|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |x| (QREFELT % 31)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT (SPADCALL |lst| (QREFELT % 53)))))) 

(DECLAIM (NOTINLINE |CoChainComplex;|)) 

(DEFUN |CoChainComplex| (#1=#:G70)
  (SPROG NIL
         (PROG (#2=#:G71)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|CoChainComplex|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|CoChainComplex;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|CoChainComplex|)))))))))) 

(DEFUN |CoChainComplex;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|CoChainComplex| DV$1))
          (LETT % (GETREFV 55))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|CoChainComplex| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|List| (|Matrix| (|Integer|))))
          %))) 

(MAKEPROP '|CoChainComplex| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (|List| 12)
              |COCHNC;coChainComplex;L%;1| (|ChainComplex|)
              (0 . |transition_matrices|) (|Matrix| 17) (5 . |transpose|)
              (|Mapping| 12 12) (10 . |map|) |COCHNC;coChainComplex;Cc%;2|
              (|Integer|) (16 . |maxRowIndex|) (21 . |maxColIndex|) (|Boolean|)
              (26 . ~=) (|String|) (|OutputForm|) (32 . |message|)
              (37 . |coerce|) (42 . |hconcat|) (|Void|) (48 . |print|) (53 . *)
              (59 . |zero?|) (64 . |coerce|) |COCHNC;validate;%B;3| (|List| 17)
              (|Vector| 17) (69 . |vector|) (74 . |elt|) (80 . *)
              (86 . |entries|) (|List| 6) (91 . |elt|) (97 . |Zero|)
              (101 . |concat|) (107 . -) (112 . +) (|NonNegativeInteger|)
              |COCHNC;coboundary;%Nni2L;4| (|Homology|) (118 . |homologyGroup|)
              (|List| 47) (124 . |concat|) |COCHNC;coHomology;%L;5| (|List| %)
              (130 . |commaSeparate|) |COCHNC;coerce;%Of;6|)
           '#(~= 135 |validate| 141 |latex| 146 |coerce| 151 |coboundary| 156
              |coHomology| 163 |coChainComplex| 168 = 178)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 23))
                        (|makeByteWordVec2| 54
                                            '(1 10 8 0 11 1 12 0 0 13 2 7 0 14
                                              0 15 1 12 17 0 18 1 12 17 0 19 2
                                              17 20 0 0 21 1 23 0 22 24 1 17 23
                                              0 25 2 23 0 0 0 26 1 23 27 0 28 2
                                              12 0 0 0 29 1 12 20 0 30 1 12 23
                                              0 31 1 34 0 33 35 2 7 12 0 17 36
                                              2 12 34 34 0 37 1 34 33 0 38 2 39
                                              6 0 17 40 0 6 0 41 2 39 0 0 6 42
                                              1 6 0 0 43 2 6 0 0 0 44 2 47 0 12
                                              12 48 2 49 0 0 47 50 1 23 0 52 53
                                              2 0 20 0 0 1 1 0 20 0 32 1 0 22 0
                                              1 1 0 23 0 54 3 0 39 0 45 39 46 1
                                              0 49 0 51 1 0 0 10 16 1 0 0 8 9 2
                                              0 20 0 0 1)))))
           '|lookupComplete|)) 
