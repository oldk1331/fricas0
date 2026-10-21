
(SDEFUN |POLYCATQ;univariate;FVF;1|
        ((|f| (F)) (|x| (V)) (% (|Fraction| (|SparseUnivariatePolynomial| F))))
        (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 11)) |x| %)
                  (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 12)) |x| %)
                  (QREFELT % 15))) 

(SDEFUN |POLYCATQ;univ_root|
        ((|f| (F)) (|x| (V)) (|a| (F)) (|k| (|Integer|))
         (|modulus| (|SparseUnivariatePolynomial| F))
         (% (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|nf| #1=(|SparseUnivariatePolynomial| F)) (|df| #1#) (|c2| (F))
          (|c1| (F)) (|c0| (F)) (|cf1| #2=(|SparseUnivariatePolynomial| F))
          (|nd1| (|SparseUnivariatePolynomial| F))
          (|ndu| (|Union| (|SparseUnivariatePolynomial| F) #3="failed"))
          (#4=#:G13 NIL) (|cf2| #2#)
          (|cofact| (|SparseUnivariatePolynomial| F)) (|nd| (F)))
         (SEQ
          (LETT |nf|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 11)) |x| %)
                          |modulus| (QREFELT % 20)))
          (LETT |df|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 12)) |x| %)
                          |modulus| (QREFELT % 20)))
          (LETT |cofact|
                (COND ((EQL |k| 1) (|spadConstant| % 23))
                      ((EQL |k| 2)
                       (SPADCALL |df| (QREFELT % 19)
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 24)
                                            (QREFELT % 25))
                                  1 (QREFELT % 27))
                                 (QREFELT % 28)))
                      ((EQL |k| 3)
                       (SEQ (LETT |c2| (SPADCALL |df| 2 (QREFELT % 29)))
                            (LETT |c1| (SPADCALL |df| 1 (QREFELT % 29)))
                            (LETT |c0| (SPADCALL |df| 0 (QREFELT % 29)))
                            (EXIT
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |c0| 2 (QREFELT % 33))
                                          (SPADCALL
                                           (SPADCALL |c2| |c1| (QREFELT % 34))
                                           |a| (QREFELT % 34))
                                          (QREFELT % 35))
                                (QREFELT % 36))
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |c2| 2 (QREFELT % 33)) |a|
                                           (QREFELT % 34))
                                 (SPADCALL |c0| |c1| (QREFELT % 34))
                                 (QREFELT % 35))
                                1 (QREFELT % 27))
                               (QREFELT % 37))
                              (SPADCALL
                               (SPADCALL (SPADCALL |c1| 2 (QREFELT % 33))
                                         (SPADCALL |c0| |c2| (QREFELT % 34))
                                         (QREFELT % 35))
                               2 (QREFELT % 27))
                              (QREFELT % 37)))))
                      ((EQL |k| 4)
                       (SEQ
                        (LETT |cf1|
                              (SPADCALL |df| (QREFELT % 19)
                                        (SPADCALL
                                         (SPADCALL (|spadConstant| % 24)
                                                   (QREFELT % 25))
                                         1 (QREFELT % 27))
                                        (QREFELT % 28)))
                        (LETT |nd1| (SPADCALL |df| |cf1| (QREFELT % 38)))
                        (LETT |ndu| (SPADCALL |nd1| 2 (QREFELT % 40)))
                        (LETT |cf2|
                              (SPADCALL
                               (PROG2 (LETT #4# |ndu|)
                                   (QCDR #4#)
                                 (|check_union2| (QEQCAR #4# 0)
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 10))
                                                 (|Union|
                                                  (|SparseUnivariatePolynomial|
                                                   (QREFELT % 10))
                                                  #3#)
                                                 #4#))
                               (QREFELT % 19)
                               (SPADCALL
                                (SPADCALL (|spadConstant| % 24) (QREFELT % 25))
                                2 (QREFELT % 27))
                               (QREFELT % 28)))
                        (EXIT (SPADCALL |cf1| |cf2| (QREFELT % 38)))))))
          (LETT |nd|
                (SPADCALL
                 (SPADCALL (SPADCALL |df| |cofact| (QREFELT % 38)) |modulus|
                           (QREFELT % 20))
                 (QREFELT % 41)))
          (EXIT
           (SPADCALL
            (SPADCALL (SPADCALL |nf| |cofact| (QREFELT % 38)) |modulus|
                      (QREFELT % 20))
            |nd| (QREFELT % 42)))))) 

(SDEFUN |POLYCATQ;univariate;FV2Sup;3|
        ((|f| (F)) (|x| (V)) (|modulus| (|SparseUnivariatePolynomial| F))
         (% (|SparseUnivariatePolynomial| F)))
        (SPROG
         ((|m0| (|SparseUnivariatePolynomial| F))
          (|bc|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed")))
         (SEQ
          (COND
           ((<= (SPADCALL |modulus| (QREFELT % 43)) 4)
            (COND
             ((SPADCALL (LETT |m0| (SPADCALL |modulus| (QREFELT % 44)))
                        (QREFELT % 46))
              (EXIT
               (|POLYCATQ;univ_root| |f| |x|
                (SPADCALL
                 (SPADCALL (SPADCALL |m0| (QREFELT % 47))
                           (SPADCALL |modulus| (QREFELT % 48)) (QREFELT % 49))
                 (QREFELT % 25))
                (SPADCALL |modulus| (QREFELT % 43)) |modulus| %))))))
          (LETT |bc|
                (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 12)) |x| %)
                          |modulus| (|spadConstant| % 23) (QREFELT % 52)))
          (EXIT
           (COND
            ((QEQCAR |bc| 1) (|error| "univariate: denominator is 0 mod p"))
            ('T
             (SPADCALL
              (SPADCALL (|POLYCATQ;P2UP| (SPADCALL |f| (QREFELT % 11)) |x| %)
                        (QCAR (QCDR |bc|)) (QREFELT % 38))
              |modulus| (QREFELT % 20)))))))) 

(SDEFUN |POLYCATQ;multivariate;FVF;4|
        ((|f| (|Fraction| (|SparseUnivariatePolynomial| F))) (|x| (V)) (% (F)))
        (SPROG ((|v| (F)))
               (SEQ
                (LETT |v|
                      (SPADCALL (SPADCALL |x| (QREFELT % 54)) (QREFELT % 55)))
                (EXIT
                 (SPADCALL
                  (SPADCALL (SPADCALL |f| (QREFELT % 56)) |v| (QREFELT % 57))
                  (SPADCALL (SPADCALL |f| (QREFELT % 58)) |v| (QREFELT % 57))
                  (QREFELT % 49)))))) 

(SDEFUN |POLYCATQ;variables;FL;5| ((|f| (F)) (% (|List| V)))
        (SPADCALL (SPADCALL |f| (QREFELT % 11)) (SPADCALL |f| (QREFELT % 12))
                  (QREFELT % 61))) 

(SDEFUN |POLYCATQ;isPower;FU;6|
        ((|f| (F))
         (%
          (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|den| (P))
          (|ur|
           (|Union|
            (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|r|
           (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))))
         (SEQ
          (COND
           ((SPADCALL (LETT |den| (SPADCALL |f| (QREFELT % 12)))
                      (|spadConstant| % 22) (QREFELT % 63))
            (COND
             ((SPADCALL (SPADCALL |f| (QREFELT % 11)) (|spadConstant| % 22)
                        (QREFELT % 63))
              (CONS 1 "failed"))
             (#1='T
              (SEQ (LETT |ur| (SPADCALL |den| (QREFELT % 66)))
                   (EXIT
                    (COND
                     ((QEQCAR |ur| 1)
                      (CONS 0 (CONS (SPADCALL |den| (QREFELT % 55)) -1)))
                     (#1#
                      (SEQ (LETT |r| (QCDR |ur|))
                           (EXIT
                            (CONS 0
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (QCAR |r|) (QREFELT % 54))
                                    (QREFELT % 55))
                                   (- (QCDR |r|)))))))))))))
           (#1#
            (SEQ
             (LETT |ur|
                   (SPADCALL (SPADCALL |f| (QREFELT % 11)) (QREFELT % 66)))
             (EXIT
              (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                    (#1#
                     (SEQ (LETT |r| (QCDR |ur|))
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL (QCAR |r|) (QREFELT % 54))
                                   (QREFELT % 55))
                                  (QCDR |r|)))))))))))))) 

(SDEFUN |POLYCATQ;isExpt;FU;7|
        ((|f| (F))
         (%
          (|Union| (|Record| (|:| |var| V) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|ur|
           (|Union|
            (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|r|
           (|Record| (|:| |var| V) (|:| |exponent| (|NonNegativeInteger|)))))
         (SEQ
          (LETT |ur| (SPADCALL (SPADCALL |f| (QREFELT % 11)) (QREFELT % 66)))
          (EXIT
           (COND
            ((QEQCAR |ur| 1)
             (COND
              ((SPADCALL (SPADCALL |f| (QREFELT % 11)) (|spadConstant| % 22)
                         (QREFELT % 70))
               (SEQ
                (LETT |ur|
                      (SPADCALL (SPADCALL |f| (QREFELT % 12)) (QREFELT % 66)))
                (EXIT
                 (COND ((QEQCAR |ur| 1) (CONS 1 "failed"))
                       (#1='T
                        (SEQ (LETT |r| (QCDR |ur|))
                             (EXIT
                              (CONS 0 (CONS (QCAR |r|) (- (QCDR |r|)))))))))))
              (#1# (CONS 1 "failed"))))
            (#1#
             (SEQ (LETT |r| (QCDR |ur|))
                  (EXIT
                   (COND
                    ((SPADCALL (SPADCALL |f| (QREFELT % 12))
                               (|spadConstant| % 22) (QREFELT % 70))
                     (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))
                    (#1# (CONS 1 "failed"))))))))))) 

(SDEFUN |POLYCATQ;isTimes;FU;8| ((|f| (F)) (% (|Union| (|List| F) "failed")))
        (SPROG
         ((|num| (P)) (|t| (|Union| (|List| P) "failed")) (#1=#:G91 NIL)
          (|x| NIL) (#2=#:G92 NIL) (|l| (|Union| (|List| F) "failed"))
          (|den| (P)) (|d| (F)))
         (SEQ
          (LETT |t|
                (SPADCALL (LETT |num| (SPADCALL |f| (QREFELT % 11)))
                          (QREFELT % 75)))
          (LETT |l|
                (COND ((QEQCAR |t| 1) (CONS 1 "failed"))
                      (#3='T
                       (CONS 0
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |x| NIL) (LETT #2# (QCDR |t|)) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |x| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS (SPADCALL |x| (QREFELT % 55))
                                                 #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#))))))))
          (LETT |den| (SPADCALL |f| (QREFELT % 12)))
          (EXIT
           (COND ((SPADCALL |den| (|spadConstant| % 22) (QREFELT % 70)) |l|)
                 ((SPADCALL |num| (|spadConstant| % 22) (QREFELT % 70))
                  (CONS 1 "failed"))
                 (#3#
                  (SEQ
                   (LETT |d|
                         (SPADCALL (SPADCALL |den| (QREFELT % 55))
                                   (QREFELT % 76)))
                   (EXIT
                    (COND
                     ((QEQCAR |l| 1)
                      (CONS 0 (LIST (SPADCALL |num| (QREFELT % 55)) |d|)))
                     (#3#
                      (CONS 0
                            (SPADCALL (QCDR |l|) |d| (QREFELT % 78))))))))))))) 

(SDEFUN |POLYCATQ;isPlus;FU;9| ((|f| (F)) (% (|Union| (|List| F) "failed")))
        (SPROG
         ((|s| (|Union| (|List| P) "failed")) (#1=#:G104 NIL) (|x| NIL)
          (#2=#:G105 NIL))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |f| (QREFELT % 12)) (|spadConstant| % 22)
                      (QREFELT % 63))
            (CONS 1 "failed"))
           (#3='T
            (SEQ
             (LETT |s| (SPADCALL (SPADCALL |f| (QREFELT % 11)) (QREFELT % 81)))
             (EXIT
              (COND ((QEQCAR |s| 1) (CONS 1 "failed"))
                    (#3#
                     (CONS 0
                           (PROGN
                            (LETT #1# NIL)
                            (SEQ (LETT |x| NIL) (LETT #2# (QCDR |s|)) G190
                                 (COND
                                  ((OR (ATOM #2#)
                                       (PROGN (LETT |x| (CAR #2#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #1#
                                         (CONS (SPADCALL |x| (QREFELT % 55))
                                               #1#))))
                                 (LETT #2# (CDR #2#)) (GO G190) G191
                                 (EXIT (NREVERSE #1#)))))))))))))) 

(SDEFUN |POLYCATQ;mainVariable;FU;10| ((|f| (F)) (% (|Union| V "failed")))
        (SPROG ((|a| #1=(|Union| V "failed")) (|b| #1#))
               (SEQ
                (LETT |a|
                      (SPADCALL (SPADCALL |f| (QREFELT % 11)) (QREFELT % 84)))
                (LETT |b|
                      (SPADCALL (SPADCALL |f| (QREFELT % 12)) (QREFELT % 84)))
                (EXIT
                 (COND ((QEQCAR |b| 1) |a|) ((QEQCAR |a| 1) |b|)
                       ('T
                        (CONS 0
                              (SPADCALL (QCDR |a|) (QCDR |b|)
                                        (QREFELT % 85))))))))) 

(SDEFUN |POLYCATQ;P2UP|
        ((|p| (P)) (|x| (V)) (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL (ELT % 55) (SPADCALL |p| |x| (QREFELT % 88)) (QREFELT % 92))) 

(DECLAIM (NOTINLINE |PolynomialCategoryQuotientFunctions;|)) 

(DEFUN |PolynomialCategoryQuotientFunctions;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$|
          (LIST '|PolynomialCategoryQuotientFunctions| DV$1 DV$2 DV$3 DV$4
                DV$5))
    (LETT % (GETREFV 93))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
    (|haddProp| |$ConstructorCache| '|PolynomialCategoryQuotientFunctions|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (QSETREFV % 19 (SPADCALL (QREFELT % 18)))
    %))) 

(DEFUN |PolynomialCategoryQuotientFunctions| (&REST #1=#:G116)
  (SPROG NIL
         (PROG (#2=#:G117)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialCategoryQuotientFunctions|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |PolynomialCategoryQuotientFunctions;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialCategoryQuotientFunctions|)))))))))) 

(MAKEPROP '|PolynomialCategoryQuotientFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (0 . |numer|)
              (5 . |denom|) (|SparseUnivariatePolynomial| 10) (|Fraction| 13)
              (10 . /) |POLYCATQ;univariate;FVF;1| (|SingletonAsOrderedSet|)
              (16 . |create|) '|dummys| (20 . |rem|) (26 . |1|) (30 . |1|)
              (34 . |1|) (38 . |1|) (42 . -) (|NonNegativeInteger|)
              (47 . |monomial|) (53 . |eval|) (60 . |coefficient|) (66 . |0|)
              (70 . |0|) (|PositiveInteger|) (74 . ^) (80 . *) (86 . -)
              (92 . |coerce|) (97 . +) (103 . *) (|Union| % '"failed")
              (109 . |divideExponents|) (115 . |retract|) (120 . /)
              (126 . |degree|) (131 . |reductum|) (|Boolean|) (136 . |ground?|)
              (141 . |ground|) (146 . |leadingCoefficient|) (151 . /)
              (|Record| (|:| |coef1| %) (|:| |coef2| %)) (|Union| 50 '"failed")
              (157 . |extendedEuclidean|) |POLYCATQ;univariate;FV2Sup;3|
              (164 . |coerce|) (169 . |coerce|) (174 . |numer|) (179 . |elt|)
              (185 . |denom|) |POLYCATQ;multivariate;FVF;4| (|List| 7)
              (190 . |variables|) |POLYCATQ;variables;FL;5| (196 . ~=)
              (|Record| (|:| |var| 7) (|:| |exponent| 26))
              (|Union| 64 '#1="failed") (202 . |isExpt|)
              (|Record| (|:| |val| 10) (|:| |exponent| (|Integer|)))
              (|Union| 67 '#2="failed") |POLYCATQ;isPower;FU;6| (207 . =)
              (|Record| (|:| |var| 7) (|:| |exponent| (|Integer|)))
              (|Union| 71 '#3="failed") |POLYCATQ;isExpt;FU;7|
              (|Union| (|List| %) '#1#) (213 . |isTimes|) (218 . |inv|)
              (|List| 10) (223 . |concat!|) (|Union| 77 '#4="failed")
              |POLYCATQ;isTimes;FU;8| (229 . |isPlus|) |POLYCATQ;isPlus;FU;9|
              (|Union| 7 '"failed") (234 . |mainVariable|) (239 . |max|)
              |POLYCATQ;mainVariable;FU;10| (|SparseUnivariatePolynomial| %)
              (245 . |univariate|) (|Mapping| 10 9)
              (|SparseUnivariatePolynomial| 9)
              (|SparseUnivariatePolynomialFunctions2| 9 10) (251 . |map|))
           '#(|variables| 257 |univariate| 262 |multivariate| 275
              |mainVariable| 281 |isTimes| 286 |isPower| 291 |isPlus| 296
              |isExpt| 301)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|variables| ((|List| |#2|) |#5|)) T)
                                   '((|mainVariable|
                                      ((|Union| |#2| "failed") |#5|))
                                     T)
                                   '((|univariate|
                                      ((|Fraction|
                                        (|SparseUnivariatePolynomial| |#5|))
                                       |#5| |#2|))
                                     T)
                                   '((|multivariate|
                                      (|#5|
                                       (|Fraction|
                                        (|SparseUnivariatePolynomial| |#5|))
                                       |#2|))
                                     T)
                                   '((|univariate|
                                      ((|SparseUnivariatePolynomial| |#5|) |#5|
                                       |#2|
                                       (|SparseUnivariatePolynomial| |#5|)))
                                     T)
                                   '((|isPlus|
                                      ((|Union| (|List| |#5|) "failed") |#5|))
                                     T)
                                   '((|isTimes|
                                      ((|Union| (|List| |#5|) #4#) |#5|))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| |#2|)
                                                  (|:| |exponent| (|Integer|)))
                                        #3#)
                                       |#5|))
                                     T)
                                   '((|isPower|
                                      ((|Union|
                                        (|Record| (|:| |val| |#5|)
                                                  (|:| |exponent| (|Integer|)))
                                        #2#)
                                       |#5|))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 92
                                            '(1 10 9 0 11 1 10 9 0 12 2 14 0 13
                                              13 15 0 17 0 18 2 13 0 0 0 20 0 8
                                              0 21 0 9 0 22 0 13 0 23 0 10 0 24
                                              1 10 0 0 25 2 13 0 10 26 27 3 13
                                              0 0 17 0 28 2 13 10 0 26 29 0 6 0
                                              30 0 8 0 31 2 10 0 0 32 33 2 10 0
                                              0 0 34 2 10 0 0 0 35 1 13 0 10 36
                                              2 13 0 0 0 37 2 13 0 0 0 38 2 13
                                              39 0 26 40 1 13 10 0 41 2 13 0 0
                                              10 42 1 13 26 0 43 1 13 0 0 44 1
                                              13 45 0 46 1 13 10 0 47 1 13 10 0
                                              48 2 10 0 0 0 49 3 13 51 0 0 0 52
                                              1 9 0 7 54 1 10 0 9 55 1 14 13 0
                                              56 2 13 10 0 10 57 1 14 13 0 58 2
                                              9 60 0 0 61 2 9 45 0 0 63 1 9 65
                                              0 66 2 9 45 0 0 70 1 9 74 0 75 1
                                              10 0 0 76 2 77 0 0 10 78 1 9 74 0
                                              81 1 9 83 0 84 2 7 0 0 0 85 2 9
                                              87 0 7 88 2 91 13 89 90 92 1 0 60
                                              10 62 3 0 13 10 7 13 53 2 0 14 10
                                              7 16 2 0 10 14 7 59 1 0 83 10 86
                                              1 0 79 10 80 1 0 68 10 69 1 0 79
                                              10 82 1 0 72 10 73)))))
           '|lookupComplete|)) 
