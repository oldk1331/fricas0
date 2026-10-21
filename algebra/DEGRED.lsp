
(SDEFUN |DEGRED;degrees|
        ((|u| (|SparseUnivariatePolynomial| R1)) (% (|List| (|Integer|))))
        (SPROG ((|l| (|List| (|Integer|))))
               (SEQ (LETT |l| NIL)
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |u| (|spadConstant| % 11)
                                      (QREFELT % 13)))
                           (GO G191)))
                         (SEQ
                          (LETT |l| (CONS (SPADCALL |u| (QREFELT % 15)) |l|))
                          (EXIT (LETT |u| (SPADCALL |u| (QREFELT % 16)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |l|)))) 

(SDEFUN |DEGRED;reduce;SupR;2|
        ((|u| (|SparseUnivariatePolynomial| R1))
         (%
          (|Record| (|:| |pol| (|SparseUnivariatePolynomial| R1))
                    (|:| |deg| (|PositiveInteger|)))))
        (SPROG
         ((|d| NIL) (#1=#:G26 NIL) (#2=#:G9 #3=(|Integer|)) (#4=#:G7 #3#)
          (#5=#:G8 NIL) (|g| #3#) (#6=#:G14 NIL) (#7=#:G19 NIL) (#8=#:G22 NIL))
         (SEQ
          (LETT |g|
                (PROGN
                 (LETT #5# NIL)
                 (SEQ (LETT |d| NIL) (LETT #1# (|DEGRED;degrees| |u| %)) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |d| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (PROGN
                         (LETT #2# |d|)
                         (COND (#5# (LETT #4# (GCD #4# #2#)))
                               ('T (PROGN (LETT #4# #2#) (LETT #5# 'T)))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                 (COND (#5# #4#) ('T 0))))
          (LETT |u|
                (PROG2
                    (LETT #7#
                          (SPADCALL |u|
                                    (PROG1 (LETT #6# |g|)
                                      (|check_subtype2| (> #6# 0)
                                                        '(|PositiveInteger|)
                                                        '(|Integer|) #6#))
                                    (QREFELT % 18)))
                    (QCDR #7#)
                  (|check_union2| (QEQCAR #7# 0)
                                  (|SparseUnivariatePolynomial| (QREFELT % 6))
                                  (|Union|
                                   (|SparseUnivariatePolynomial| (QREFELT % 6))
                                   "failed")
                                  #7#)))
          (EXIT
           (CONS |u|
                 (PROG1 (LETT #8# |g|)
                   (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                     '(|Integer|) #8#))))))) 

(SDEFUN |DEGRED;rootOfUnity|
        ((|j| (|Integer|)) (|n| (|Integer|)) (% (|Expression| R2)))
        (SPROG ((|arg| (|Expression| R2)))
               (SEQ
                (COND ((EQL |j| 0) (|spadConstant| % 22))
                      ('T
                       (SEQ
                        (LETT |arg|
                              (SPADCALL
                               (SPADCALL (* 2 |j|) (SPADCALL (QREFELT % 23))
                                         (QREFELT % 25))
                               (SPADCALL |n| (QREFELT % 26)) (QREFELT % 27)))
                        (EXIT
                         (SPADCALL (SPADCALL |arg| (QREFELT % 28))
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| % 22)
                                               (QREFELT % 35))
                                     (SPADCALL 1 2 (QREFELT % 34))
                                     (QREFELT % 38))
                                    (SPADCALL |arg| (QREFELT % 39))
                                    (QREFELT % 40))
                                   (QREFELT % 41))))))))) 

(SDEFUN |DEGRED;even_part| ((|gp| (|PositiveInteger|)) (% (|PositiveInteger|)))
        (SPROG ((|g| (|NonNegativeInteger|)) (|res| (|PositiveInteger|)))
               (SEQ (LETT |g| |gp|) (LETT |res| 1)
                    (SEQ G190 (COND ((NULL (EVENP |g|)) (GO G191)))
                         (SEQ (LETT |g| (|quotient_INT| |g| 2))
                              (EXIT (LETT |res| (* |res| 2))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |res|)))) 

(SDEFUN |DEGRED;expand;EPiL;5|
        ((|s| (|Expression| R2)) (|g| (|PositiveInteger|))
         (% (|List| (|Expression| R2))))
        (SPROG
         ((|g2| (|PositiveInteger|)) (|sr| (|Expression| R2)) (#1=#:G40 NIL)
          (|i| NIL) (#2=#:G41 NIL))
         (SEQ
          (COND ((EQL |g| 1) (LIST |s|))
                (#3='T
                 (SEQ
                  (LETT |sr|
                        (COND
                         ((SPADCALL |s|
                                    (SPADCALL (|spadConstant| % 22)
                                              (QREFELT % 35))
                                    (QREFELT % 42))
                          (SEQ (LETT |g2| (|DEGRED;even_part| |g| %))
                               (EXIT
                                (COND ((EQL |g2| 1) |s|)
                                      (#3#
                                       (SPADCALL |s|
                                                 (SPADCALL 1 |g2|
                                                           (QREFELT % 34))
                                                 (QREFELT % 38)))))))
                         (#3#
                          (SPADCALL |s| (SPADCALL 1 |g| (QREFELT % 34))
                                    (QREFELT % 38)))))
                  (EXIT
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| 0) (LETT #2# (- |g| 1)) G190
                         (COND ((|greater_SI| |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #1#
                                 (CONS
                                  (SPADCALL (|DEGRED;rootOfUnity| |i| |g| %)
                                            |sr| (QREFELT % 40))
                                  #1#))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                         (EXIT (NREVERSE #1#))))))))))) 

(SDEFUN |DEGRED;cyclotomic_roots;PiL;6|
        ((|n| (|PositiveInteger|)) (% (|List| (|Expression| R2))))
        (SPROG ((#1=#:G45 NIL) (|i| NIL) (#2=#:G46 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL (GCD |i| |n|) 1)
                          (LETT #1#
                                (CONS (|DEGRED;rootOfUnity| |i| |n| %)
                                      #1#))))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(DECLAIM (NOTINLINE |DegreeReductionPackage;|)) 

(DEFUN |DegreeReductionPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|DegreeReductionPackage| DV$1 DV$2))
          (LETT % (GETREFV 47))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|DegreeReductionPackage|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |DegreeReductionPackage| (&REST #1=#:G47)
  (SPROG NIL
         (PROG (#2=#:G48)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|DegreeReductionPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |DegreeReductionPackage;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|DegreeReductionPackage|)))))))))) 

(MAKEPROP '|DegreeReductionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (0 . |0|)
              (4 . |0|) (|SparseUnivariatePolynomial| 6) (8 . |0|) (|Boolean|)
              (12 . ~=) (|NonNegativeInteger|) (18 . |degree|)
              (23 . |reductum|) (|Union| % '"failed") (28 . |divideExponents|)
              (|Record| (|:| |pol| 10) (|:| |deg| 44)) |DEGRED;reduce;SupR;2|
              (|Expression| 7) (34 . |1|) (38 . |pi|) (|Integer|) (42 . *)
              (48 . |coerce|) (53 . /) (59 . |cos|) (64 . |1|) (68 . |1|)
              (72 . -) (77 . -) (|Fraction| 24) (82 . /) (88 . -)
              (|SparseMultivariatePolynomial| 7 (|Kernel| 21)) (93 . |1|)
              (97 . ^) (103 . |sin|) (108 . *) (114 . +) (120 . =) (|List| 21)
              (|PositiveInteger|) |DEGRED;expand;EPiL;5|
              |DEGRED;cyclotomic_roots;PiL;6|)
           '#(|reduce| 126 |expand| 131 |cyclotomic_roots| 137) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|reduce|
                                 ((|Record|
                                   (|:| |pol|
                                        (|SparseUnivariatePolynomial| |#1|))
                                   (|:| |deg| (|PositiveInteger|)))
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|expand|
                                 ((|List| (|Expression| |#2|))
                                  (|Expression| |#2|) (|PositiveInteger|)))
                                T)
                              '((|cyclotomic_roots|
                                 ((|List| (|Expression| |#2|))
                                  (|PositiveInteger|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 46
                                            '(0 6 0 8 0 7 0 9 0 10 0 11 2 10 12
                                              0 0 13 1 10 14 0 15 1 10 0 0 16 2
                                              10 17 0 14 18 0 21 0 22 0 21 0 23
                                              2 21 0 24 0 25 1 21 0 24 26 2 21
                                              0 0 0 27 1 21 0 0 28 0 6 0 29 0 7
                                              0 30 1 7 0 0 31 1 6 0 0 32 2 33 0
                                              24 24 34 1 21 0 0 35 0 36 0 37 2
                                              21 0 0 33 38 1 21 0 0 39 2 21 0 0
                                              0 40 2 21 0 0 0 41 2 21 12 0 0 42
                                              1 0 19 10 20 2 0 43 21 44 45 1 0
                                              43 44 46)))))
           '|lookupComplete|)) 
