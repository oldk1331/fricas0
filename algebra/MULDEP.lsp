
(SDEFUN |MULDEP;solveOverQ|
        ((|m| (|Matrix| (|Fraction| (|Integer|))))
         (|v| (|Vector| (|Fraction| (|Integer|))))
         (% (|Union| (|Vector| (|Fraction| (|Integer|))) "failed")))
        (SPADCALL |m| |v| (QREFELT % 10))) 

(SDEFUN |MULDEP;logDependenceQ;LFU;2|
        ((|lq| (|List| (|Fraction| (|Integer|))))
         (|q| (|Fraction| (|Integer|)))
         (% (|Union| (|Vector| (|Fraction| (|Integer|))) "failed")))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|v| #1=(|Vector| (|Fraction| (|Integer|))))
          (|dr|
           (|Record| (|:| |basis| #2=(|Vector| (|Integer|)))
                     (|:| |transform| #3=(|Matrix| (|Integer|)))))
          (|bas| #2#) (|k0| (|NonNegativeInteger|)) (#4=#:G25 NIL)
          (#5=#:G26 NIL) (|li| (|List| (|NonNegativeInteger|))) (|tm| #3#)
          (#6=#:G27 NIL) (#7=#:G28 NIL) (#8=#:G29 NIL) (|j| NIL) (#9=#:G30 NIL)
          (|m| (|Matrix| (|Fraction| (|Integer|)))) (#10=#:G31 NIL) (|i| NIL)
          (#11=#:G32 NIL) (|qv| #1#))
         (SEQ
          (COND ((NULL |lq|) (CONS 1 "failed"))
                (#12='T
                 (SEQ (LETT |n| (LENGTH |lq|))
                      (LETT |v|
                            (SPADCALL (SPADCALL |lq| (LIST |q|) (QREFELT % 12))
                                      (QREFELT % 13)))
                      (LETT |dr| (SPADCALL |v| (QREFELT % 16)))
                      (LETT |bas| (QCAR |dr|)) (LETT |k0| (QVSIZE |bas|))
                      (LETT |li|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |i| 1) (LETT #5# |k0|) G190
                                  (COND ((|greater_SI| |i| #5#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL
                                        (SPADCALL |bas| |i| (QREFELT % 19))
                                        (QREFELT % 21)))
                                      (LETT #4# (CONS |i| #4#))))))
                                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT
                       (COND ((NULL |li|) (CONS 1 "failed"))
                             (#12#
                              (SEQ (LETT |tm| (QCDR |dr|))
                                   (LETT |m|
                                         (SPADCALL
                                          (PROGN
                                           (LETT #6# NIL)
                                           (SEQ (LETT |i| NIL) (LETT #7# |li|)
                                                G190
                                                (COND
                                                 ((OR (ATOM #7#)
                                                      (PROGN
                                                       (LETT |i| (CAR #7#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #6#
                                                        (CONS
                                                         (PROGN
                                                          (LETT #8# NIL)
                                                          (SEQ (LETT |j| 1)
                                                               (LETT #9# |n|)
                                                               G190
                                                               (COND
                                                                ((|greater_SI|
                                                                  |j| #9#)
                                                                 (GO G191)))
                                                               (SEQ
                                                                (EXIT
                                                                 (LETT #8#
                                                                       (CONS
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |tm|
                                                                          |i|
                                                                          |j|
                                                                          (QREFELT
                                                                           %
                                                                           23))
                                                                         (QREFELT
                                                                          %
                                                                          25))
                                                                        #8#))))
                                                               (LETT |j|
                                                                     (|inc_SI|
                                                                      |j|))
                                                               (GO G190) G191
                                                               (EXIT
                                                                (NREVERSE
                                                                 #8#))))
                                                         #6#))))
                                                (LETT #7# (CDR #7#)) (GO G190)
                                                G191 (EXIT (NREVERSE #6#))))
                                          (QREFELT % 27)))
                                   (LETT |qv|
                                         (SPADCALL
                                          (PROGN
                                           (LETT #10# NIL)
                                           (SEQ (LETT |i| NIL) (LETT #11# |li|)
                                                G190
                                                (COND
                                                 ((OR (ATOM #11#)
                                                      (PROGN
                                                       (LETT |i| (CAR #11#))
                                                       NIL))
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #10#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL |tm| |i|
                                                                    (+ |n| 1)
                                                                    (QREFELT %
                                                                             23))
                                                          (QREFELT % 25))
                                                         #10#))))
                                                (LETT #11# (CDR #11#))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #10#))))
                                          (QREFELT % 13)))
                                   (EXIT
                                    (|MULDEP;solveOverQ| |m| |qv| %)))))))))))) 

(DECLAIM (NOTINLINE |MultiplicativeDependence;|)) 

(DEFUN |MultiplicativeDependence;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|MultiplicativeDependence|))
          (LETT % (GETREFV 30))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|MultiplicativeDependence| NIL
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |MultiplicativeDependence| ()
  (SPROG NIL
         (PROG (#1=#:G34)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|MultiplicativeDependence|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|MultiplicativeDependence|
                             (LIST
                              (CONS NIL
                                    (CONS 1 (|MultiplicativeDependence;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|MultiplicativeDependence|)))))))))) 

(MAKEPROP '|MultiplicativeDependence| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Union| 8 '"failed") (|Matrix| 24)
              (|Vector| 24) (|LinearSystemMatrixPackage| 24 8 8 7)
              (0 . |particularSolution|) (|List| 24) (6 . |concat|)
              (12 . |vector|) (|Record| (|:| |basis| 18) (|:| |transform| 22))
              (|GcdBasis| 17) (17 . |gcdDecomposition|) (|Integer|)
              (|Vector| 17) (22 . |elt|) (|Boolean|) (28 . |unit?|)
              (|Matrix| 17) (33 . |elt|) (|Fraction| 17) (40 . |coerce|)
              (|List| 11) (45 . |matrix|) (50 . |1|)
              |MULDEP;logDependenceQ;LFU;2|)
           '#(|logDependenceQ| 54) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|logDependenceQ|
                                 ((|Union| (|Vector| (|Fraction| (|Integer|)))
                                           "failed")
                                  (|List| (|Fraction| (|Integer|)))
                                  (|Fraction| (|Integer|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 29
                                            '(2 9 6 7 8 10 2 11 0 0 0 12 1 8 0
                                              11 13 1 15 14 8 16 2 18 17 0 17
                                              19 1 17 20 0 21 3 22 17 0 17 17
                                              23 1 24 0 17 25 1 7 0 26 27 0 24
                                              0 28 2 0 6 11 24 29)))))
           '|lookupComplete|)) 
