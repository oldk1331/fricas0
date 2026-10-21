
(SDEFUN |UPDECOMP;rightFactorIfCan0|
        ((|p| (UP)) (|dq| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (|lcq| (R)) (% (|Union| UP "failed")))
        (SPROG
         ((|dp| (|NonNegativeInteger|)) (|s| (|NonNegativeInteger|))
          (|lcp| (R)) (|k| NIL) (#1=#:G27 NIL) (|i| NIL) (#2=#:G28 NIL)
          (|c| (R)) (|cquo| (|Union| R "failed")) (#3=#:G26 NIL) (#4=#:G14 NIL)
          (|q| (UP)))
         (SEQ
          (EXIT
           (SEQ (LETT |dp| (SPADCALL |p| (QREFELT % 9)))
                (LETT |s|
                      (PROG2 (LETT #4# (SPADCALL |dq| 1 (QREFELT % 13)))
                          (QCDR #4#)
                        (|check_union2| (QEQCAR #4# 0) (|NonNegativeInteger|)
                                        (|Union| (|NonNegativeInteger|)
                                                 #5="failed")
                                        #4#)))
                (LETT |lcp| (SPADCALL |p| (QREFELT % 14)))
                (LETT |q| (SPADCALL |lcq| |dq| (QREFELT % 15)))
                (SEQ (LETT |k| 1) (LETT #1# |s|) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ (LETT |c| (|spadConstant| % 16))
                          (SEQ (LETT |i| 0)
                               (LETT #2#
                                     (PROG2
                                         (LETT #4#
                                               (SPADCALL |k| 1 (QREFELT % 13)))
                                         (QCDR #4#)
                                       (|check_union2| (QEQCAR #4# 0)
                                                       (|NonNegativeInteger|)
                                                       (|Union|
                                                        (|NonNegativeInteger|)
                                                        #5#)
                                                       #4#)))
                               G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT |c|
                                       (SPADCALL |c|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL |k|
                                                              (QREFELT % 18))
                                                    (SPADCALL
                                                     (SPADCALL
                                                      (SPADCALL |n|
                                                                (QREFELT % 18))
                                                      (|spadConstant| % 10)
                                                      (QREFELT % 19))
                                                     (SPADCALL |i|
                                                               (QREFELT % 18))
                                                     (QREFELT % 20))
                                                    (QREFELT % 21))
                                                   (SPADCALL |q|
                                                             (PROG2
                                                                 (LETT #4#
                                                                       (SPADCALL
                                                                        |dq|
                                                                        |i|
                                                                        (QREFELT
                                                                         %
                                                                         13)))
                                                                 (QCDR #4#)
                                                               (|check_union2|
                                                                (QEQCAR #4# 0)
                                                                (|NonNegativeInteger|)
                                                                (|Union|
                                                                 (|NonNegativeInteger|)
                                                                 #5#)
                                                                #4#))
                                                             (QREFELT % 22))
                                                   (QREFELT % 20))
                                                  (SPADCALL |p|
                                                            (PROG2
                                                                (LETT #4#
                                                                      (SPADCALL
                                                                       (+ |dp|
                                                                          |i|)
                                                                       |k|
                                                                       (QREFELT
                                                                        % 13)))
                                                                (QCDR #4#)
                                                              (|check_union2|
                                                               (QEQCAR #4# 0)
                                                               (|NonNegativeInteger|)
                                                               (|Union|
                                                                (|NonNegativeInteger|)
                                                                #5#)
                                                               #4#))
                                                            (QREFELT % 22))
                                                  (QREFELT % 20))
                                                 (QREFELT % 19)))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT NIL))
                          (LETT |cquo|
                                (SPADCALL |c|
                                          (SPADCALL
                                           (SPADCALL (* |k| |n|)
                                                     (QREFELT % 18))
                                           |lcp| (QREFELT % 20))
                                          (QREFELT % 23)))
                          (EXIT
                           (COND
                            ((QEQCAR |cquo| 1)
                             (PROGN
                              (LETT #3# (CONS 1 "failed"))
                              (GO #6=#:G25)))
                            ('T
                             (LETT |q|
                                   (SPADCALL |q|
                                             (SPADCALL (QCDR |cquo|)
                                                       (PROG2
                                                           (LETT #4#
                                                                 (SPADCALL |dq|
                                                                           |k|
                                                                           (QREFELT
                                                                            %
                                                                            13)))
                                                           (QCDR #4#)
                                                         (|check_union2|
                                                          (QEQCAR #4# 0)
                                                          (|NonNegativeInteger|)
                                                          (|Union|
                                                           (|NonNegativeInteger|)
                                                           #5#)
                                                          #4#))
                                                       (QREFELT % 15))
                                             (QREFELT % 24)))))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |q|))))
          #6# (EXIT #3#)))) 

(SDEFUN |UPDECOMP;rightFactorIfCan;UPNniRU;2|
        ((|p| (UP)) (|dq| (|NonNegativeInteger|)) (|lcq| (R))
         (% (|Union| UP "failed")))
        (SPROG
         ((|dp| (|NonNegativeInteger|))
          (|nc| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|nr| (R)) (#1=#:G34 NIL)
          (|n1| (|NonNegativeInteger|)) (|lcn| (R)) (|lcn1| (R))
          (|cc0u| #2=(|Union| R "failed")) (|cc0| (R)) (|cc1| (R)) (|cc2| (R))
          (|i| NIL) (#3=#:G54 NIL) (|qn1| (UP)) (|qn| (UP)) (|p1| (UP))
          (|k1| (|NonNegativeInteger|)) (|k| (|NonNegativeInteger|)) (|j| NIL)
          (#4=#:G55 NIL) (|c| (R)) (|cu| #2#) (#5=#:G53 NIL) (|q| (UP)))
         (SEQ
          (EXIT
           (SEQ (LETT |dp| (SPADCALL |p| (QREFELT % 9)))
                (EXIT
                 (COND
                  ((SPADCALL |lcq| (QREFELT % 28))
                   (|error|
                    "rightFactorIfCan: leading coefficient may not be zero"))
                  ((OR (ZEROP |dp|) (ZEROP |dq|)) (CONS 1 "failed"))
                  ('T
                   (SEQ (LETT |nc| (|exquo_INT| |dp| |dq|))
                        (EXIT
                         (COND ((QEQCAR |nc| 1) (CONS 1 "failed"))
                               (#6='T
                                (SEQ (LETT |n| (QCDR |nc|))
                                     (COND
                                      ((OR (EQL (QREFELT % 26) 0)
                                           (< |n| (QREFELT % 26)))
                                       (EXIT
                                        (|UPDECOMP;rightFactorIfCan0| |p| |dq|
                                         |n| |lcq| %))))
                                     (LETT |nr| (SPADCALL |n| (QREFELT % 18)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| (|spadConstant| % 16)
                                                  (QREFELT % 30))
                                        (CONS 1 "failed"))
                                       (#6#
                                        (SEQ
                                         (LETT |q|
                                               (SPADCALL |lcq| |dq|
                                                         (QREFELT % 15)))
                                         (LETT |n1|
                                               (PROG1 (LETT #1# (- |n| 1))
                                                 (|check_subtype2| (>= #1# 0)
                                                                   '(|NonNegativeInteger|)
                                                                   '(|Integer|)
                                                                   #1#)))
                                         (LETT |qn1|
                                               (SPADCALL |q| |n1|
                                                         (QREFELT % 31)))
                                         (LETT |qn|
                                               (SPADCALL |q| |qn1|
                                                         (QREFELT % 32)))
                                         (LETT |lcn|
                                               (SPADCALL |qn| (QREFELT % 14)))
                                         (LETT |lcn1|
                                               (SPADCALL |nr|
                                                         (SPADCALL |qn1|
                                                                   (QREFELT %
                                                                            14))
                                                         (QREFELT % 20)))
                                         (LETT |cc0u|
                                               (SPADCALL
                                                (SPADCALL |p| (QREFELT % 14))
                                                |lcn| (QREFELT % 23)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |cc0u| 1)
                                            (CONS 1 "failed"))
                                           (#6#
                                            (SEQ (LETT |cc0| (QCDR |cc0u|))
                                                 (LETT |cc1|
                                                       (SPADCALL |cc0| |nr|
                                                                 (QREFELT %
                                                                          20)))
                                                 (LETT |cc2|
                                                       (SPADCALL |cc0| |lcn1|
                                                                 (QREFELT %
                                                                          20)))
                                                 (LETT |p1|
                                                       (SPADCALL |p|
                                                                 (SPADCALL
                                                                  |cc0| |qn|
                                                                  (QREFELT %
                                                                           33))
                                                                 (QREFELT %
                                                                          34)))
                                                 (LETT |k1| 1) (LETT |k| 2)
                                                 (LETT |qn1|
                                                       (|spadConstant| % 29))
                                                 (SEQ (LETT |i| 1)
                                                      (LETT #3# (- |dq| 1))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #3#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (COND
                                                        ((EQL |i| |k|)
                                                         (SEQ
                                                          (LETT |qn1|
                                                                (SPADCALL |q|
                                                                          |n1|
                                                                          (QREFELT
                                                                           %
                                                                           31)))
                                                          (LETT |qn|
                                                                (SPADCALL |q|
                                                                          |qn1|
                                                                          (QREFELT
                                                                           %
                                                                           32)))
                                                          (LETT |p1|
                                                                (SPADCALL |p|
                                                                          (SPADCALL
                                                                           |cc0|
                                                                           |qn|
                                                                           (QREFELT
                                                                            %
                                                                            33))
                                                                          (QREFELT
                                                                           %
                                                                           34)))
                                                          (LETT |k1| |k|)
                                                          (EXIT
                                                           (LETT |k|
                                                                 (* 2 |k|))))))
                                                       (LETT |c|
                                                             (SPADCALL |p1|
                                                                       (- |dp|
                                                                          |i|)
                                                                       (QREFELT
                                                                        % 22)))
                                                       (SEQ (LETT |j| |k1|)
                                                            (LETT #4#
                                                                  (- |i| 1))
                                                            G190
                                                            (COND
                                                             ((> |j| #4#)
                                                              (GO G191)))
                                                            (SEQ
                                                             (EXIT
                                                              (LETT |c|
                                                                    (SPADCALL
                                                                     |c|
                                                                     (SPADCALL
                                                                      (SPADCALL
                                                                       |cc1|
                                                                       (SPADCALL
                                                                        |q|
                                                                        (- |dq|
                                                                           |j|)
                                                                        (QREFELT
                                                                         % 22))
                                                                       (QREFELT
                                                                        % 20))
                                                                      (SPADCALL
                                                                       |qn1|
                                                                       (+
                                                                        (-
                                                                         (-
                                                                          |dp|
                                                                          |dq|)
                                                                         |i|)
                                                                        |j|)
                                                                       (QREFELT
                                                                        % 22))
                                                                      (QREFELT
                                                                       % 20))
                                                                     (QREFELT %
                                                                              21)))))
                                                            (LETT |j|
                                                                  (+ |j| 1))
                                                            (GO G190) G191
                                                            (EXIT NIL))
                                                       (LETT |cu|
                                                             (SPADCALL |c|
                                                                       |cc2|
                                                                       (QREFELT
                                                                        % 23)))
                                                       (EXIT
                                                        (COND
                                                         ((QEQCAR |cu| 1)
                                                          (PROGN
                                                           (LETT #5#
                                                                 (CONS 1
                                                                       "failed"))
                                                           (GO #7=#:G52)))
                                                         ('T
                                                          (LETT |q|
                                                                (SPADCALL |q|
                                                                          (SPADCALL
                                                                           (QCDR
                                                                            |cu|)
                                                                           (-
                                                                            |dq|
                                                                            |i|)
                                                                           (QREFELT
                                                                            %
                                                                            15))
                                                                          (QREFELT
                                                                           %
                                                                           24)))))))
                                                      (LETT |i| (|inc_SI| |i|))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (CONS 0
                                                        |q|))))))))))))))))))))
          #7# (EXIT #5#)))) 

(SDEFUN |UPDECOMP;monicRightFactorIfCan;UPNniU;3|
        ((|p| (UP)) (|dq| (|NonNegativeInteger|)) (% (|Union| UP "failed")))
        (SPADCALL |p| |dq| (|spadConstant| % 10) (QREFELT % 36))) 

(SDEFUN |UPDECOMP;leftFactorIfCan;2UPU;4|
        ((|f| (UP)) (|h| (UP)) (% (|Union| UP "failed")))
        (SPROG
         ((|i| NIL)
          (|qrf|
           (|Union| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))
                    "failed"))
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP))) (|r| (UP))
          (#1=#:G74 NIL) (|g| (UP)))
         (SEQ
          (EXIT
           (SEQ (LETT |g| (|spadConstant| % 29))
                (EXIT
                 (COND ((ZEROP (SPADCALL |h| (QREFELT % 9))) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ (LETT |i| 0) G190
                              (COND
                               ((NULL (NULL (SPADCALL |f| (QREFELT % 38))))
                                (GO G191)))
                              (SEQ
                               (LETT |qrf| (SPADCALL |f| |h| (QREFELT % 42)))
                               (EXIT
                                (COND
                                 ((QEQCAR |qrf| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed"))
                                   (GO #2=#:G73)))
                                 ('T
                                  (SEQ (LETT |qr| (QCDR |qrf|))
                                       (LETT |r| (QCDR |qr|))
                                       (COND
                                        ((NULL (SPADCALL |r| (QREFELT % 43)))
                                         (EXIT
                                          (PROGN
                                           (LETT #1# (CONS 1 "failed"))
                                           (GO #2#)))))
                                       (LETT |g|
                                             (SPADCALL |g|
                                                       (SPADCALL
                                                        (SPADCALL |r|
                                                                  (QREFELT %
                                                                           44))
                                                        |i| (QREFELT % 15))
                                                       (QREFELT % 24)))
                                       (EXIT (LETT |f| (QCAR |qr|))))))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 0 |g|))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |UPDECOMP;monicDecomposeIfCan;UPU;5|
        ((|f| (UP))
         (% (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed")))
        (SPROG
         ((|df| (|NonNegativeInteger|)) (|dh| NIL) (#1=#:G81 NIL)
          (#2=#:G94 NIL) (|h| (|Union| UP "failed"))
          (|g| (|Union| UP "failed")) (#3=#:G93 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |df| (SPADCALL |f| (QREFELT % 9)))
                (EXIT
                 (COND ((ZEROP |df|) (CONS 1 "failed"))
                       ('T
                        (SEQ
                         (SEQ (LETT |dh| 2)
                              (LETT #2#
                                    (PROG2
                                        (LETT #1#
                                              (SPADCALL |df| 1 (QREFELT % 13)))
                                        (QCDR #1#)
                                      (|check_union2| (QEQCAR #1# 0)
                                                      (|NonNegativeInteger|)
                                                      (|Union|
                                                       (|NonNegativeInteger|)
                                                       "failed")
                                                      #1#)))
                              G190 (COND ((|greater_SI| |dh| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((ZEROP (REM |df| |dh|))
                                  (SEQ
                                   (LETT |h|
                                         (SPADCALL |f| |dh| (QREFELT % 37)))
                                   (EXIT
                                    (COND
                                     ((QEQCAR |h| 0)
                                      (SEQ
                                       (LETT |g|
                                             (SPADCALL |f| (QCDR |h|)
                                                       (QREFELT % 45)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR |g| 0)
                                          (PROGN
                                           (LETT #3#
                                                 (CONS 0
                                                       (CONS (QCDR |g|)
                                                             (QCDR |h|))))
                                           (GO #4=#:G92))))))))))))))
                              (LETT |dh| (|inc_SI| |dh|)) (GO G190) G191
                              (EXIT NIL))
                         (EXIT (CONS 1 "failed"))))))))
          #4# (EXIT #3#)))) 

(SDEFUN |UPDECOMP;monicCompleteDecompose;UPL;6| ((|f| (UP)) (% (|List| UP)))
        (SPROG
         ((|cf| (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|lr| (|Record| (|:| |left| UP) (|:| |right| UP))))
         (SEQ (LETT |cf| (SPADCALL |f| (QREFELT % 48)))
              (EXIT
               (COND ((QEQCAR |cf| 1) (LIST |f|))
                     ('T
                      (SEQ (LETT |lr| (QCDR |cf|))
                           (EXIT
                            (SPADCALL (SPADCALL (QCAR |lr|) (QREFELT % 50))
                                      (LIST (QCDR |lr|)) (QREFELT % 51)))))))))) 

(SDEFUN |UPDECOMP;decomposeIfCan;UPU;7|
        ((|f| (UP))
         (% (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed")))
        (SPROG
         ((|lc| (R))
          (|res1|
           (|Union| (|Record| (|:| |left| UP) (|:| |right| UP)) "failed"))
          (|lr| (|Record| (|:| |left| UP) (|:| |right| UP))))
         (SEQ (LETT |lc| (SPADCALL |f| (QREFELT % 14)))
              (LETT |f| (SPADCALL |f| |lc| (QREFELT % 52)))
              (LETT |res1| (SPADCALL |f| (QREFELT % 48)))
              (EXIT
               (COND ((QEQCAR |res1| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |lr| (QCDR |res1|))
                           (EXIT
                            (CONS 0
                                  (CONS
                                   (SPADCALL |lc| (QCAR |lr|) (QREFELT % 33))
                                   (QCDR |lr|))))))))))) 

(SDEFUN |UPDECOMP;completeDecompose;UPL;8| ((|f| (UP)) (% (|List| UP)))
        (SPROG ((|lc| (R)) (|res1| (|List| UP)))
               (SEQ (LETT |lc| (SPADCALL |f| (QREFELT % 14)))
                    (LETT |f| (SPADCALL |f| |lc| (QREFELT % 52)))
                    (LETT |res1| (SPADCALL |f| (QREFELT % 50)))
                    (EXIT
                     (CONS (SPADCALL |lc| (|SPADfirst| |res1|) (QREFELT % 33))
                           (CDR |res1|)))))) 

(DECLAIM (NOTINLINE |UnivariatePolynomialDecompositionPackage;|)) 

(DEFUN |UnivariatePolynomialDecompositionPackage;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$|
                (LIST '|UnivariatePolynomialDecompositionPackage| DV$1 DV$2))
          (LETT % (GETREFV 55))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache|
                      '|UnivariatePolynomialDecompositionPackage|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 26 (SPADCALL (QREFELT % 25)))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 53
                       (CONS
                        (|dispatchFunction| |UPDECOMP;decomposeIfCan;UPU;7|)
                        %))
             (QSETREFV % 54
                       (CONS
                        (|dispatchFunction| |UPDECOMP;completeDecompose;UPL;8|)
                        %)))))
          %))) 

(DEFUN |UnivariatePolynomialDecompositionPackage| (&REST #1=#:G111)
  (SPROG NIL
         (PROG (#2=#:G112)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePolynomialDecompositionPackage|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |UnivariatePolynomialDecompositionPackage;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePolynomialDecompositionPackage|)))))))))) 

(MAKEPROP '|UnivariatePolynomialDecompositionPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|NonNegativeInteger|) (0 . |degree|) (5 . |1|) (9 . |1|)
              (|Union| % '"failed") (13 . |subtractIfCan|)
              (19 . |leadingCoefficient|) (24 . |monomial|) (30 . |0|)
              (|Integer|) (34 . |coerce|) (39 . +) (45 . *) (51 . -)
              (57 . |coefficient|) (63 . |exquo|) (69 . +)
              (75 . |characteristic|) '|char_R| (|Boolean|) (79 . |zero?|)
              (84 . |0|) (88 . =) (94 . ^) (100 . *) (106 . *) (112 . -)
              (|Union| 7 '#1="failed") |UPDECOMP;rightFactorIfCan;UPNniRU;2|
              |UPDECOMP;monicRightFactorIfCan;UPNniU;3| (118 . |zero?|)
              (|Record| (|:| |quotient| 7) (|:| |remainder| 7))
              (|Union| 39 '"failed")
              (|UnivariatePolynomialDivisionPackage| 6 7) (123 . |divideIfCan|)
              (129 . |ground?|) (134 . |ground|)
              |UPDECOMP;leftFactorIfCan;2UPU;4|
              (|Record| (|:| |left| 7) (|:| |right| 7))
              (|Union| 46 '#2="failed") |UPDECOMP;monicDecomposeIfCan;UPU;5|
              (|List| 7) |UPDECOMP;monicCompleteDecompose;UPL;6|
              (139 . |append|) (145 . /) (151 . |decomposeIfCan|)
              (156 . |completeDecompose|))
           '#(|rightFactorIfCan| 161 |monicRightFactorIfCan| 168
              |monicDecomposeIfCan| 174 |monicCompleteDecompose| 179
              |leftFactorIfCan| 184 |decomposeIfCan| 190 |completeDecompose|
              195)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|monicRightFactorIfCan|
                                 ((|Union| |#2| "failed") |#2|
                                  (|NonNegativeInteger|)))
                                T)
                              '((|rightFactorIfCan|
                                 ((|Union| |#2| #1#) |#2|
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|leftFactorIfCan|
                                 ((|Union| |#2| "failed") |#2| |#2|))
                                T)
                              '((|monicDecomposeIfCan|
                                 ((|Union|
                                   (|Record| (|:| |left| |#2|)
                                             (|:| |right| |#2|))
                                   #2#)
                                  |#2|))
                                T)
                              '((|monicCompleteDecompose| ((|List| |#2|) |#2|))
                                T)
                              '((|decomposeIfCan|
                                 ((|Union|
                                   (|Record| (|:| |left| |#2|)
                                             (|:| |right| |#2|))
                                   "failed")
                                  |#2|))
                                (|has| 6 (|Field|)))
                              '((|completeDecompose| ((|List| |#2|) |#2|))
                                (|has| 6 (|Field|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 54
                                            '(1 7 8 0 9 0 6 0 10 0 7 0 11 2 8
                                              12 0 0 13 1 7 6 0 14 2 7 0 6 8 15
                                              0 6 0 16 1 6 0 17 18 2 6 0 0 0 19
                                              2 6 0 0 0 20 2 6 0 0 0 21 2 7 6 0
                                              8 22 2 6 12 0 0 23 2 7 0 0 0 24 0
                                              6 8 25 1 6 27 0 28 0 7 0 29 2 6
                                              27 0 0 30 2 7 0 0 8 31 2 7 0 0 0
                                              32 2 7 0 6 0 33 2 7 0 0 0 34 1 7
                                              27 0 38 2 41 40 7 7 42 1 7 27 0
                                              43 1 7 6 0 44 2 49 0 0 0 51 2 7 0
                                              0 6 52 1 0 47 7 53 1 0 49 7 54 3
                                              0 35 7 8 6 36 2 0 35 7 8 37 1 0
                                              47 7 48 1 0 49 7 50 2 0 35 7 7 45
                                              1 1 47 7 53 1 1 49 7 54)))))
           '|lookupComplete|)) 
