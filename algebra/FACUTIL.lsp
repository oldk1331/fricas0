
(SDEFUN |FACUTIL;lowerPolynomial;SupSup;1|
        ((|f| (|SparseUnivariatePolynomial| P))
         (% (|SparseUnivariatePolynomial| R)))
        (COND ((SPADCALL |f| (QREFELT % 12)) (|spadConstant| % 14))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT % 15)) (QREFELT % 16))
                 (SPADCALL |f| (QREFELT % 18)) (QREFELT % 19))
                (SPADCALL (SPADCALL |f| (QREFELT % 20)) (QREFELT % 21))
                (QREFELT % 22))))) 

(SDEFUN |FACUTIL;raisePolynomial;SupSup;2|
        ((|u| (|SparseUnivariatePolynomial| R))
         (% (|SparseUnivariatePolynomial| P)))
        (COND ((SPADCALL |u| (QREFELT % 23)) (|spadConstant| % 24))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |u| (QREFELT % 25)) (QREFELT % 26))
                 (SPADCALL |u| (QREFELT % 27)) (QREFELT % 28))
                (SPADCALL (SPADCALL |u| (QREFELT % 29)) (QREFELT % 30))
                (QREFELT % 31))))) 

(SDEFUN |FACUTIL;completeEval;SupLLSup;3|
        ((|f| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (|lval| (|List| R)) (% (|SparseUnivariatePolynomial| R)))
        (COND ((SPADCALL |f| (QREFELT % 12)) (|spadConstant| % 14))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT % 15)) |lvar| |lval|
                            (QREFELT % 34))
                  (QREFELT % 16))
                 (SPADCALL |f| (QREFELT % 18)) (QREFELT % 19))
                (SPADCALL (SPADCALL |f| (QREFELT % 20)) |lvar| |lval|
                          (QREFELT % 35))
                (QREFELT % 22))))) 

(SDEFUN |FACUTIL;degree;SupLL;4|
        ((|f| (|SparseUnivariatePolynomial| P)) (|lvar| (|List| OV))
         (% #1=(|List| (|NonNegativeInteger|))))
        (SPROG
         ((|coefs| (|List| P)) (#2=#:G16 NIL) (|xx| NIL) (#3=#:G17 NIL)
          (|fc| NIL) (#4=#:G18 NIL) (#5=#:G12 #6=(|NonNegativeInteger|))
          (#7=#:G10 #6#) (#8=#:G11 NIL) (|ldeg| #1#))
         (SEQ (LETT |coefs| (SPADCALL |f| (QREFELT % 37)))
              (EXIT
               (LETT |ldeg|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |xx| NIL) (LETT #3# |lvar|) G190
                           (COND
                            ((OR (ATOM #3#) (PROGN (LETT |xx| (CAR #3#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (PROGN
                                     (LETT #8# NIL)
                                     (SEQ (LETT |fc| NIL) (LETT #4# |coefs|)
                                          G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |fc| (CAR #4#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (PROGN
                                             (LETT #5#
                                                   (SPADCALL |fc| |xx|
                                                             (QREFELT % 38)))
                                             (COND
                                              (#8# (LETT #7# (MAX #7# #5#)))
                                              ('T
                                               (PROGN
                                                (LETT #7# #5#)
                                                (LETT #8# 'T)))))))
                                          (LETT #4# (CDR #4#)) (GO G190) G191
                                          (EXIT NIL))
                                     (COND (#8# #7#)
                                           ('T (|IdentityError| '|max|))))
                                    #2#))))
                           (LETT #3# (CDR #3#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FACUTIL;variables;SupL;5|
        ((|f| (|SparseUnivariatePolynomial| P)) (% (|List| OV)))
        (SPROG
         ((|cf| NIL) (#1=#:G23 NIL) (#2=#:G21 #3=(|List| OV)) (#4=#:G19 #3#)
          (#5=#:G20 NIL))
         (SEQ
          (PROGN
           (LETT #5# NIL)
           (SEQ (LETT |cf| NIL) (LETT #1# (SPADCALL |f| (QREFELT % 37))) G190
                (COND
                 ((OR (ATOM #1#) (PROGN (LETT |cf| (CAR #1#)) NIL)) (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #2# (SPADCALL |cf| (QREFELT % 41)))
                   (COND (#5# (LETT #4# (SPADCALL #4# #2# (QREFELT % 42))))
                         ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
           (COND (#5# #4#) ('T (|IdentityError| '|setUnion|))))))) 

(SDEFUN |FACUTIL;ran;IR;6| ((|k| (|Integer|)) (% (R)))
        (SPADCALL (QREFELT % 44))) 

(SDEFUN |FACUTIL;ran;IR;7| ((|k| (|Integer|)) (% (R)))
        (SPADCALL (- (RANDOM (+ (* 2 |k|) 1)) |k|) (QREFELT % 47))) 

(SDEFUN |FACUTIL;normalDeriv;SupISup;8|
        ((|f| (|SparseUnivariatePolynomial| P)) (|m| (|Integer|))
         (% (|SparseUnivariatePolynomial| P)))
        (SPROG
         ((|#G1| (|NonNegativeInteger|)) (|k| (|Integer|))
          (|n1| #1=(|Integer|)) (#2=#:G30 NIL)
          (|ris| (|SparseUnivariatePolynomial| P)) (|n| #1#))
         (SEQ (LETT |#G1| (SPADCALL |f| (QREFELT % 18))) (LETT |n1| |#G1|)
              (EXIT
               (COND ((< |#G1| |m|) (|spadConstant| % 24))
                     ((EQL |n1| |m|)
                      (SPADCALL (SPADCALL |f| (QREFELT % 15)) (QREFELT % 48)))
                     ('T
                      (SEQ (LETT |k| (SPADCALL |n1| |m| (QREFELT % 49)))
                           (LETT |ris| (|spadConstant| % 24)) (LETT |n| |n1|)
                           (SEQ G190 (COND ((NULL (>= |n| |m|)) (GO G191)))
                                (SEQ
                                 (SEQ G190
                                      (COND ((NULL (> |n1| |n|)) (GO G191)))
                                      (SEQ
                                       (LETT |k|
                                             (|quotient_INT|
                                              (* |k| (- |n1| |m|)) |n1|))
                                       (EXIT (LETT |n1| (- |n1| 1))))
                                      NIL (GO G190) G191 (EXIT NIL))
                                 (LETT |ris|
                                       (SPADCALL |ris|
                                                 (SPADCALL
                                                  (SPADCALL |k|
                                                            (SPADCALL |f|
                                                                      (QREFELT
                                                                       % 15))
                                                            (QREFELT % 52))
                                                  (PROG1 (LETT #2# (- |n| |m|))
                                                    (|check_subtype2|
                                                     (>= #2# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #2#))
                                                  (QREFELT % 28))
                                                 (QREFELT % 31)))
                                 (LETT |f| (SPADCALL |f| (QREFELT % 20)))
                                 (EXIT
                                  (LETT |n| (SPADCALL |f| (QREFELT % 18)))))
                                NIL (GO G190) G191 (EXIT NIL))
                           (EXIT |ris|)))))))) 

(DECLAIM (NOTINLINE |FactoringUtilities;|)) 

(DEFUN |FactoringUtilities;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|FactoringUtilities| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 54))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|FactoringUtilities|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#3| '(|FiniteFieldCategory|))
      (QSETREFV % 46 (CONS (|dispatchFunction| |FACUTIL;ran;IR;6|) %)))
     ('T (QSETREFV % 46 (CONS (|dispatchFunction| |FACUTIL;ran;IR;7|) %))))
    %))) 

(DEFUN |FactoringUtilities| (&REST #1=#:G36)
  (SPROG NIL
         (PROG (#2=#:G37)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FactoringUtilities|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |FactoringUtilities;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FactoringUtilities|)))))))))) 

(MAKEPROP '|FactoringUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|)
              (|SparseUnivariatePolynomial| 9) (0 . |zero?|)
              (|SparseUnivariatePolynomial| 8) (5 . |0|)
              (9 . |leadingCoefficient|) (14 . |ground|) (|NonNegativeInteger|)
              (19 . |degree|) (24 . |monomial|) (30 . |reductum|)
              |FACUTIL;lowerPolynomial;SupSup;1| (35 . +) (41 . |zero?|)
              (46 . |0|) (50 . |leadingCoefficient|) (55 . |coerce|)
              (60 . |degree|) (65 . |monomial|) (71 . |reductum|)
              |FACUTIL;raisePolynomial;SupSup;2| (76 . +) (|List| 7) (|List| 8)
              (82 . |eval|) |FACUTIL;completeEval;SupLLSup;3| (|List| 9)
              (89 . |coefficients|) (94 . |degree|) (|List| 17)
              |FACUTIL;degree;SupLL;4| (100 . |variables|) (105 . |setUnion|)
              |FACUTIL;variables;SupL;5| (111 . |random|) (|Integer|)
              (115 . |ran|) (120 . |coerce|) (125 . |coerce|)
              (130 . |binomial|) (136 . |1|) (140 . |1|) (144 . *)
              |FACUTIL;normalDeriv;SupISup;8|)
           '#(|variables| 150 |ran| 155 |raisePolynomial| 160 |normalDeriv| 165
              |lowerPolynomial| 171 |degree| 176 |completeEval| 182)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|completeEval|
                                 ((|SparseUnivariatePolynomial| |#3|)
                                  (|SparseUnivariatePolynomial| |#4|)
                                  (|List| |#2|) (|List| |#3|)))
                                T)
                              '((|degree|
                                 ((|List| (|NonNegativeInteger|))
                                  (|SparseUnivariatePolynomial| |#4|)
                                  (|List| |#2|)))
                                T)
                              '((|variables|
                                 ((|List| |#2|)
                                  (|SparseUnivariatePolynomial| |#4|)))
                                T)
                              '((|lowerPolynomial|
                                 ((|SparseUnivariatePolynomial| |#3|)
                                  (|SparseUnivariatePolynomial| |#4|)))
                                T)
                              '((|raisePolynomial|
                                 ((|SparseUnivariatePolynomial| |#4|)
                                  (|SparseUnivariatePolynomial| |#3|)))
                                T)
                              '((|normalDeriv|
                                 ((|SparseUnivariatePolynomial| |#4|)
                                  (|SparseUnivariatePolynomial| |#4|)
                                  (|Integer|)))
                                T)
                              '((|ran| (|#3| (|Integer|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 53
                                            '(1 11 10 0 12 0 13 0 14 1 11 9 0
                                              15 1 9 8 0 16 1 11 17 0 18 2 13 0
                                              8 17 19 1 11 0 0 20 2 13 0 0 0 22
                                              1 13 10 0 23 0 11 0 24 1 13 8 0
                                              25 1 9 0 8 26 1 13 17 0 27 2 11 0
                                              9 17 28 1 13 0 0 29 2 11 0 0 0 31
                                              3 9 0 0 32 33 34 1 11 36 0 37 2 9
                                              17 0 7 38 1 9 32 0 41 2 32 0 0 0
                                              42 0 8 0 44 1 0 8 45 46 1 8 0 45
                                              47 1 11 0 9 48 2 45 0 0 0 49 0 8
                                              0 50 0 9 0 51 2 9 0 45 0 52 1 0
                                              32 11 43 1 0 8 45 46 1 0 11 13 30
                                              2 0 11 11 45 53 1 0 13 11 21 2 0
                                              39 11 32 40 3 0 13 11 32 33
                                              35)))))
           '|lookupComplete|)) 
