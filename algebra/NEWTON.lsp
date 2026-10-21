
(SDEFUN |NEWTON;differences| ((|yl| (|List| F)) (% (|List| F)))
        (SPROG
         ((#1=#:G4 NIL) (|y2| NIL) (#2=#:G6 NIL) (|y1| NIL) (#3=#:G5 NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL)
           (SEQ (LETT |y2| NIL) (LETT #2# (CDR |yl|)) (LETT |y1| NIL)
                (LETT #3# |yl|) G190
                (COND
                 ((OR (ATOM #3#) (PROGN (LETT |y1| (CAR #3#)) NIL) (ATOM #2#)
                      (PROGN (LETT |y2| (CAR #2#)) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (LETT #1# (CONS (SPADCALL |y2| |y1| (QREFELT % 7)) #1#))))
                (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#)))) (GO G190)
                G191 (EXIT (NREVERSE #1#))))))) 

(SDEFUN |NEWTON;newtonAux|
        ((|k| (F)) (|fact| (F)) (|yl| (|List| F))
         (% (|SparseUnivariatePolynomial| F)))
        (SPROG ((#1=#:G11 NIL))
               (COND
                ((NULL (CDR |yl|))
                 (SPADCALL
                  (PROG2
                      (LETT #1#
                            (SPADCALL (SPADCALL |yl| 1 (QREFELT % 16)) |fact|
                                      (QREFELT % 18)))
                      (QCDR #1#)
                    (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                    (|Union| (QREFELT % 6) #2="failed") #1#))
                  (QREFELT % 19)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (PROG2
                       (LETT #1#
                             (SPADCALL (SPADCALL |yl| 1 (QREFELT % 16)) |fact|
                                       (QREFELT % 18)))
                       (QCDR #1#)
                     (|check_union2| (QEQCAR #1# 0) (QREFELT % 6)
                                     (|Union| (QREFELT % 6) #2#) #1#))
                   (QREFELT % 19))
                  (SPADCALL
                   (SPADCALL (QREFELT % 13) (SPADCALL |k| (QREFELT % 19))
                             (QREFELT % 20))
                   (|NEWTON;newtonAux|
                    (SPADCALL |k| (|spadConstant| % 8) (QREFELT % 21))
                    (SPADCALL |fact| |k| (QREFELT % 22))
                    (|NEWTON;differences| |yl| %) %)
                   (QREFELT % 23))
                  (QREFELT % 24)))))) 

(SDEFUN |NEWTON;newton;LSup;3|
        ((|yl| (|List| F)) (% (|SparseUnivariatePolynomial| F)))
        (|NEWTON;newtonAux| (|spadConstant| % 8) (|spadConstant| % 8) |yl| %)) 

(DECLAIM (NOTINLINE |NewtonInterpolation;|)) 

(DEFUN |NewtonInterpolation;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|NewtonInterpolation| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|NewtonInterpolation| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 13 (SPADCALL (|spadConstant| % 8) 1 (QREFELT % 12)))
          %))) 

(DEFUN |NewtonInterpolation| (#1=#:G16)
  (SPROG NIL
         (PROG (#2=#:G17)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NewtonInterpolation|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|NewtonInterpolation;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NewtonInterpolation|)))))))))) 

(MAKEPROP '|NewtonInterpolation| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . -) (6 . |1|)
              (|SparseUnivariatePolynomial| 6) (10 . |1|)
              (|NonNegativeInteger|) (14 . |monomial|) '|z| (|Integer|)
              (|List| 6) (20 . |elt|) (|Union| % '"failed") (26 . |exquo|)
              (32 . |coerce|) (37 . -) (43 . +) (49 . *) (55 . *) (61 . +)
              |NEWTON;newton;LSup;3|)
           '#(|newton| 67) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|newton|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|List| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(2 6 0 0 0 7 0 6 0 8 0 9 0 10 2 9
                                              0 6 11 12 2 15 6 0 14 16 2 6 17 0
                                              0 18 1 9 0 6 19 2 9 0 0 0 20 2 6
                                              0 0 0 21 2 6 0 0 0 22 2 9 0 0 0
                                              23 2 9 0 0 0 24 1 0 9 15 25)))))
           '|lookupComplete|)) 
