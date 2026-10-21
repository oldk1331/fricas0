
(SDEFUN |FACTFUNC;nthRoot;FNniR;1|
        ((|ff| (|Factored| M)) (|n| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |coef| M)
                    (|:| |radicand| (|List| M)))))
        (SPROG
         ((|lf|
           (|List|
            (|Record| (|:| |flag| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |factor| M)
                      (|:| |exponent| (|NonNegativeInteger|)))))
          (#1=#:G31 NIL) (|t| NIL) (#2=#:G32 NIL) (#3=#:G21 NIL)
          (|d| (|NonNegativeInteger|)) (|term| NIL) (#4=#:G33 NIL)
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|coeff| (M)) (|radi| (|List| M)) (#5=#:G30 NIL))
         (SEQ (LETT |coeff| (|spadConstant| % 7))
              (LETT |radi|
                    (COND
                     ((SPADCALL (SPADCALL |ff| (QREFELT % 9))
                                (|spadConstant| % 7) (QREFELT % 11))
                      NIL)
                     (#6='T (LIST (SPADCALL |ff| (QREFELT % 9))))))
              (LETT |lf| (SPADCALL |ff| (QREFELT % 15)))
              (LETT |d|
                    (COND
                     ((NULL |radi|)
                      (PROG1
                          (LETT #3#
                                (SPADCALL
                                 (CONS |n|
                                       (PROGN
                                        (LETT #1# NIL)
                                        (SEQ (LETT |t| NIL) (LETT #2# |lf|)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |t| (CAR #2#))
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (LETT #1#
                                                     (CONS (QVELT |t| 2)
                                                           #1#))))
                                             (LETT #2# (CDR #2#)) (GO G190)
                                             G191 (EXIT (NREVERSE #1#)))))
                                 (QREFELT % 18)))
                        (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #3#)))
                     (#6# 1)))
              (LETT |n| (|quotient_INT| |n| |d|))
              (SEQ (LETT |term| NIL) (LETT #4# |lf|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |term| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ
                      (LETT |qr|
                            (|divide_INT| (|quotient_INT| (QVELT |term| 2) |d|)
                                          |n|))
                      (LETT |coeff|
                            (SPADCALL |coeff|
                                      (SPADCALL (QVELT |term| 1) (QCAR |qr|)
                                                (QREFELT % 20))
                                      (QREFELT % 21)))
                      (EXIT
                       (COND
                        ((NULL (ZEROP (QCDR |qr|)))
                         (PROGN
                          (LETT #5#
                                (LETT |radi|
                                      (SPADCALL |radi|
                                                (SPADCALL (QVELT |term| 1)
                                                          (QCDR |qr|)
                                                          (QREFELT % 20))
                                                (QREFELT % 23))))
                          (GO #7=#:G25)))))))
                    #7# (EXIT #5#))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |n| |coeff| |radi|))))) 

(SDEFUN |FACTFUNC;log;FL;2|
        ((|ff| (|Factored| M))
         (%
          (|List|
           (|Record| (|:| |coef| (|NonNegativeInteger|)) (|:| |logand| M)))))
        (SPROG ((#1=#:G41 NIL) (|term| NIL) (#2=#:G42 NIL))
               (SEQ
                (CONS (CONS 1 (SPADCALL |ff| (QREFELT % 9)))
                      (PROGN
                       (LETT #1# NIL)
                       (SEQ (LETT |term| NIL)
                            (LETT #2# (SPADCALL |ff| (QREFELT % 15))) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |term| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #1#
                                    (CONS
                                     (CONS (QVELT |term| 2) (QVELT |term| 1))
                                     #1#))))
                            (LETT #2# (CDR #2#)) (GO G190) G191
                            (EXIT (NREVERSE #1#)))))))) 

(DECLAIM (NOTINLINE |FactoredFunctions;|)) 

(DEFUN |FactoredFunctions;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FactoredFunctions| DV$1))
          (LETT % (GETREFV 30))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FactoredFunctions| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FactoredFunctions| (#1=#:G43)
  (SPROG NIL
         (PROG (#2=#:G44)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FactoredFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FactoredFunctions;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FactoredFunctions|)))))))))) 

(MAKEPROP '|FactoredFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |1|) (|Factored| 6)
              (4 . |unit|) (|Boolean|) (9 . =)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 12) (|:| |factor| 6) (|:| |exponent| 19))
              (|List| 13) (15 . |factorList|) (|List| %) (|Integer|)
              (20 . |gcd|) (|NonNegativeInteger|) (25 . ^) (31 . *) (|List| 6)
              (37 . |concat!|)
              (|Record| (|:| |exponent| 19) (|:| |coef| 6) (|:| |radicand| 22))
              |FACTFUNC;nthRoot;FNniR;1| (43 . |1|)
              (|Record| (|:| |coef| 19) (|:| |logand| 6)) (|List| 27)
              |FACTFUNC;log;FL;2|)
           '#(|nthRoot| 47 |log| 53) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|nthRoot|
                                 ((|Record|
                                   (|:| |exponent| (|NonNegativeInteger|))
                                   (|:| |coef| |#1|)
                                   (|:| |radicand| (|List| |#1|)))
                                  (|Factored| |#1|) (|NonNegativeInteger|)))
                                T)
                              '((|log|
                                 ((|List|
                                   (|Record|
                                    (|:| |coef| (|NonNegativeInteger|))
                                    (|:| |logand| |#1|)))
                                  (|Factored| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 29
                                            '(0 6 0 7 1 8 6 0 9 2 6 10 0 0 11 1
                                              8 14 0 15 1 17 0 16 18 2 6 0 0 19
                                              20 2 6 0 0 0 21 2 22 0 0 6 23 0 8
                                              0 26 2 0 24 8 19 25 1 0 28 8
                                              29)))))
           '|lookupComplete|)) 
