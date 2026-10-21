
(SDEFUN |MPCPF;push_up|
        ((|p| (|Polynomial| R)) (|nvars| (|List| (|Symbol|)))
         (|vars| (|List| OV)) (% (PPR)))
        (SPROG
         ((|nv1| (|Symbol|)) (|v1| (OV))
          (|pu| (|SparseUnivariatePolynomial| (|Polynomial| R)))
          (|ppu| (|SparseUnivariatePolynomial| PPR)))
         (SEQ
          (COND
           ((OR (SPADCALL |p| (QREFELT % 12)) (NULL |nvars|))
            (SPADCALL |p| (QREFELT % 13)))
           ('T
            (SEQ (LETT |nv1| (|SPADfirst| |nvars|))
                 (LETT |v1| (|SPADfirst| |vars|))
                 (LETT |pu| (SPADCALL |p| |nv1| (QREFELT % 16)))
                 (LETT |ppu|
                       (SPADCALL
                        (CONS #'|MPCPF;push_up!0| (VECTOR |vars| % |nvars|))
                        |pu| (QREFELT % 25)))
                 (EXIT (SPADCALL |ppu| |v1| (QREFELT % 26))))))))) 

(SDEFUN |MPCPF;push_up!0| ((|c| NIL) ($$ NIL))
        (PROG (|nvars| % |vars|)
          (LETT |nvars| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |vars| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|MPCPF;push_up| |c| (SPADCALL |nvars| (QREFELT % 18))
             (SPADCALL |vars| (QREFELT % 20)) %))))) 

(SDEFUN |MPCPF;factor;PPRF;2| ((|p| (PPR)) (% (|Factored| PPR)))
        (SPROG
         ((|c| (|Polynomial| R)) (#1=#:G13 NIL) (|vars| (|List| OV))
          (#2=#:G42 NIL) (|v| NIL) (#3=#:G43 NIL) (|nvars| (|List| (|Symbol|)))
          (#4=#:G44 NIL) (|nv| NIL) (#5=#:G45 NIL)
          (|nvals| (|List| (|Polynomial| R))) (|g| (|Polynomial| R))
          (|flist| (|Factored| (|Polynomial| R))) (#6=#:G46 NIL) (|u| NIL)
          (#7=#:G47 NIL)
          (|ffact|
           (|List|
            (|Record| (|:| |irr| PPR) (|:| |pow| (|NonNegativeInteger|)))))
          (|fcont| (PPR)) (|ff| NIL) (#8=#:G48 NIL)
          (#9=#:G38 #10=(|Factored| PPR)) (#11=#:G36 #10#) (#12=#:G37 NIL))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 27)) (SPADCALL |p| 1 (QREFELT % 32)))
                (#13='T
                 (SEQ (LETT |c| (SPADCALL |p| (QREFELT % 33)))
                      (LETT |p|
                            (PROG2 (LETT #1# (SPADCALL |p| |c| (QREFELT % 35)))
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0) (QREFELT % 9)
                                              (|Union| (QREFELT % 9) "failed")
                                              #1#)))
                      (LETT |vars| (SPADCALL |p| (QREFELT % 36)))
                      (LETT |nvars|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |v| NIL) (LETT #3# |vars|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |v| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS (SPADCALL |v| (QREFELT % 37))
                                                #2#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#)))))
                      (LETT |nvals|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |nv| NIL) (LETT #5# |nvars|) G190
                                  (COND
                                   ((OR (ATOM #5#)
                                        (PROGN (LETT |nv| (CAR #5#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL (|spadConstant| % 38) |nv|
                                                     1 (QREFELT % 39))
                                           #4#))))
                                  (LETT #5# (CDR #5#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL |p| |vars| |nvals| (QREFELT % 41))
                             (QREFELT % 42)))
                      (LETT |flist| (SPADCALL |g| (QREFELT % 45)))
                      (LETT |ffact|
                            (PROGN
                             (LETT #6# NIL)
                             (SEQ (LETT |u| NIL)
                                  (LETT #7# (SPADCALL |flist| (QREFELT % 49)))
                                  G190
                                  (COND
                                   ((OR (ATOM #7#)
                                        (PROGN (LETT |u| (CAR #7#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #6#
                                          (CONS
                                           (CONS
                                            (|MPCPF;push_up| (QVELT |u| 1)
                                             |nvars| |vars| %)
                                            (QVELT |u| 2))
                                           #6#))))
                                  (LETT #7# (CDR #7#)) (GO G190) G191
                                  (EXIT (NREVERSE #6#)))))
                      (LETT |fcont|
                            (SPADCALL (SPADCALL |flist| (QREFELT % 50))
                                      (QREFELT % 13)))
                      (EXIT
                       (SPADCALL
                        (SPADCALL (SPADCALL |c| |fcont| (QREFELT % 51)) 1
                                  (QREFELT % 32))
                        (PROGN
                         (LETT #12# NIL)
                         (SEQ (LETT |ff| NIL) (LETT #8# |ffact|) G190
                              (COND
                               ((OR (ATOM #8#)
                                    (PROGN (LETT |ff| (CAR #8#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (PROGN
                                 (LETT #9#
                                       (SPADCALL (QCAR |ff|) (QCDR |ff|)
                                                 (QREFELT % 52)))
                                 (COND
                                  (#12#
                                   (LETT #11#
                                         (SPADCALL #11# #9# (QREFELT % 53))))
                                  ('T
                                   (PROGN (LETT #11# #9#) (LETT #12# 'T)))))))
                              (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
                         (COND (#12# #11#) (#13# (|spadConstant| % 54))))
                        (QREFELT % 53))))))))) 

(DECLAIM (NOTINLINE |MPolyCatPolyFactorizer;|)) 

(DEFUN |MPolyCatPolyFactorizer;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MPolyCatPolyFactorizer| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 56))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|MPolyCatPolyFactorizer|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    %))) 

(DEFUN |MPolyCatPolyFactorizer| (&REST #1=#:G49)
  (SPROG NIL
         (PROG (#2=#:G50)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|MPolyCatPolyFactorizer|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |MPolyCatPolyFactorizer;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|MPolyCatPolyFactorizer|)))))))))) 

(MAKEPROP '|MPolyCatPolyFactorizer| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Boolean|) (|Polynomial| 8)
              (0 . |ground?|) (5 . |coerce|) (|SparseUnivariatePolynomial| %)
              (|Symbol|) (10 . |univariate|) (|List| 15) (16 . |rest|)
              (|List| 7) (21 . |rest|) (|SparseUnivariatePolynomial| 9)
              (|Mapping| 9 11) (|SparseUnivariatePolynomial| 11)
              (|SparseUnivariatePolynomialFunctions2| 11 9) (26 . |map|)
              (32 . |multivariate|) (38 . |ground?|) (43 . |1|) (47 . |1|)
              (|NonNegativeInteger|) (|Factored| 9) (51 . |nilFactor|)
              (57 . |content|) (|Union| % '"failed") (62 . |exquo|)
              (68 . |variables|) (73 . |convert|) (78 . |1|) (82 . |monomial|)
              (|List| 11) (89 . |eval|) (96 . |retract|) (|Factored| 11)
              (|GeneralizedMultivariateFactorize| 15 (|IndexedExponents| 15) 8
                                                  8 11)
              (101 . |factor|) (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 46) (|:| |factor| 11) (|:| |exponent| 30))
              (|List| 47) (106 . |factorList|) (111 . |unit|) (116 . *)
              (122 . |primeFactor|) (128 . *) (134 . |1|)
              |MPCPF;factor;PPRF;2|)
           '#(|factor| 138) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|factor| ((|Factored| |#4|) |#4|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 55
                                            '(1 11 10 0 12 1 9 0 11 13 2 11 14
                                              0 15 16 1 17 0 0 18 1 19 0 0 20 2
                                              24 21 22 23 25 2 9 0 14 7 26 1 9
                                              10 0 27 0 8 0 28 0 9 0 29 2 31 0
                                              9 30 32 1 9 11 0 33 2 9 34 0 11
                                              35 1 9 19 0 36 1 7 15 0 37 0 11 0
                                              38 3 11 0 0 15 30 39 3 9 0 0 19
                                              40 41 1 9 11 0 42 1 44 43 11 45 1
                                              43 48 0 49 1 43 11 0 50 2 9 0 11
                                              0 51 2 31 0 9 30 52 2 31 0 0 0 53
                                              0 31 0 54 1 0 31 9 55)))))
           '|lookupComplete|)) 
