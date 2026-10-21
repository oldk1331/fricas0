
(SDEFUN |HANKP;HankelMatrix;LM;1| ((|l| (|List| R)) (% (|Matrix| R)))
        (SPROG
         ((#1=#:G3 NIL) (|n| (|Integer|)) (#2=#:G15 NIL) (|j| NIL)
          (#3=#:G16 NIL) (|lloc| (|List| R)) (#4=#:G17 NIL) (|i| NIL)
          (#5=#:G19 NIL) (|x| NIL) (#6=#:G18 NIL))
         (SEQ
          (COND ((NULL (ODDP (LENGTH |l|))) (|error| "n must be odd"))
                ('T
                 (SEQ
                  (LETT |n|
                        (PROG2 (LETT #1# (|exquo_INT| (+ (LENGTH |l|) 1) 2))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (|NonNegativeInteger|)
                                          (|Union| (|NonNegativeInteger|)
                                                   "failed")
                                          #1#)))
                  (LETT |lloc| (CONS (|spadConstant| % 8) |l|))
                  (EXIT
                   (SPADCALL (ELT % 10)
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |j| 1) (LETT #3# |n|) G190
                                   (COND ((|greater_SI| |j| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (SEQ (LETT |lloc| (CDR |lloc|))
                                                 (EXIT
                                                  (SPADCALL
                                                   (LIST
                                                    (PROGN
                                                     (LETT #4# NIL)
                                                     (SEQ (LETT |i| 1)
                                                          (LETT #5# |n|)
                                                          (LETT |x| NIL)
                                                          (LETT #6# |lloc|)
                                                          G190
                                                          (COND
                                                           ((OR (ATOM #6#)
                                                                (PROGN
                                                                 (LETT |x|
                                                                       (CAR
                                                                        #6#))
                                                                 NIL)
                                                                (|greater_SI|
                                                                 |i| #5#))
                                                            (GO G191)))
                                                          (SEQ
                                                           (EXIT
                                                            (LETT #4#
                                                                  (CONS |x|
                                                                        #4#))))
                                                          (LETT #6#
                                                                (PROG1
                                                                    (CDR #6#)
                                                                  (LETT |i|
                                                                        (|inc_SI|
                                                                         |i|))))
                                                          (GO G190) G191
                                                          (EXIT
                                                           (NREVERSE #4#)))))
                                                   (QREFELT % 12))))
                                            #2#))))
                                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT % 15))))))))) 

(DECLAIM (NOTINLINE |HankelPackage;|)) 

(DEFUN |HankelPackage;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|HankelPackage| DV$1))
          (LETT % (GETREFV 18))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|HankelPackage| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |HankelPackage| (#1=#:G20)
  (SPROG NIL
         (PROG (#2=#:G21)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|HankelPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|HankelPackage;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|HankelPackage|)))))))))) 

(MAKEPROP '|HankelPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |1|) (4 . |0|)
              (|Matrix| 6) (8 . |vertConcat|) (|List| 16) (14 . |matrix|)
              (|Mapping| 9 9 9) (|List| 9) (19 . |reduce|) (|List| 6)
              |HANKP;HankelMatrix;LM;1|)
           '#(|HankelMatrix| 25) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|HankelMatrix|
                                 ((|Matrix| |#1|) (|List| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 17
                                            '(0 6 0 7 0 6 0 8 2 9 0 0 0 10 1 9
                                              0 11 12 2 14 9 13 0 15 1 0 9 16
                                              17)))))
           '|lookupComplete|)) 
