
(SDEFUN |LAPLACE;laplace;F2SF;1|
        ((|f| (F)) (|t| (|Symbol|)) (|s| (|Symbol|)) (% (F)))
        (|LAPLACE;locallaplace| (SPADCALL |f| |t| (QREFELT % 15)) |t|
         (SPADCALL |t| (QREFELT % 16)) |s| (SPADCALL |s| (QREFELT % 16)) %)) 

(SDEFUN |LAPLACE;algebraic?| ((|f| (F)) (|t| (|Symbol|)) (% (|Boolean|)))
        (SPROG
         ((|l| (|List| (|Kernel| F))) (#1=#:G50 NIL) (#2=#:G51 NIL)
          (|m| (|NonNegativeInteger|)) (|k| NIL) (#3=#:G52 NIL) (#4=#:G49 NIL)
          (#5=#:G48 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |l|
                  (SPADCALL (SPADCALL |f| (QREFELT % 19)) |t| (QREFELT % 22)))
            (LETT |m|
                  (SPADCALL (ELT % 23)
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |k| NIL) (LETT #2# |l|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |k| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS (SPADCALL |k| (QREFELT % 25))
                                                #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#))))
                            0 (QREFELT % 28)))
            (SEQ
             (EXIT
              (SEQ (LETT |k| NIL) (LETT #3# |l|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |k| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |k| (QREFELT % 25)) |m|)
                       (COND
                        ((SPADCALL (SPADCALL |k| (QREFELT % 29)) (QREFELT % 8)
                                   (QREFELT % 31))
                         (PROGN
                          (LETT #5# (PROGN (LETT #4# 'T) (GO #6=#:G47)))
                          (GO #7=#:G45))))))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
             #7# (EXIT #5#))
            (EXIT NIL)))
          #6# (EXIT #4#)))) 

(SDEFUN |LAPLACE;dvlap| ((|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((|l1| (F)) (|l2| (F)) (|l3| (F)) (|v| (|Symbol|)) (|e| (F)))
               (SEQ (LETT |l1| (|SPADfirst| |l|))
                    (LETT |l2| (SPADCALL |l| (QREFELT % 33)))
                    (LETT |v|
                          (SPADCALL (LETT |l3| (SPADCALL |l| (QREFELT % 34)))
                                    (QREFELT % 35)))
                    (EXIT
                     (COND
                      ((EQUAL |x| |v|)
                       (SPADCALL
                        (SPADCALL (QREFELT % 13)
                                  (SPADCALL |l2| |l1| (QREFELT % 36)) |l2| |l3|
                                  (QREFELT % 37))
                        (QREFELT % 38)))
                      ('T
                       (SEQ
                        (LETT |e|
                              (SPADCALL
                               (SPADCALL (SPADCALL |l3| |l2| (QREFELT % 36))
                                         (QREFELT % 38))
                               (QREFELT % 39)))
                        (EXIT
                         (|LAPLACE;locallaplace|
                          (SPADCALL
                           (SPADCALL (SPADCALL |e| |l1| (QREFELT % 36)) |x|
                                     (QREFELT % 40))
                           |e| (QREFELT % 41))
                          (SPADCALL |l2| (QREFELT % 35)) |l2| |v| |l3|
                          %))))))))) 

(SDEFUN |LAPLACE;isLinear|
        ((|f| (F)) (|t| (|Symbol|))
         (% (|Union| (|Record| (|:| |const| F) (|:| |nconst| F)) "failed")))
        (SPROG
         ((|ff| (|Fraction| (|SparseUnivariatePolynomial| F)))
          (|d| (|Union| F "failed")) (#1=#:G73 NIL) (|b| (F)) (|c| (F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ff|
                  (SPADCALL |f| (SPADCALL |t| (QREFELT % 42)) (QREFELT % 45)))
            (SEQ
             (LETT |d|
                   (SPADCALL (SPADCALL |ff| (QREFELT % 48)) (QREFELT % 50)))
             (EXIT
              (COND
               ((OR (QEQCAR |d| 1)
                    (> (SPADCALL (SPADCALL |ff| (QREFELT % 51)) (QREFELT % 52))
                       1))
                (PROGN (LETT #1# (CONS 1 "failed")) (GO #2=#:G71))))))
            (COND
             ((SPADCALL
               (LETT |b|
                     (SPADCALL
                      (SPADCALL (SPADCALL |ff| (QREFELT % 51)) 0
                                (QREFELT % 53))
                      (QCDR |d|) (QREFELT % 41)))
               |t| (QREFELT % 54))
              (COND
               ((SPADCALL
                 (LETT |c|
                       (SPADCALL
                        (SPADCALL (SPADCALL |ff| (QREFELT % 51)) 1
                                  (QREFELT % 53))
                        (QCDR |d|) (QREFELT % 41)))
                 |t| (QREFELT % 54))
                (EXIT (CONS 0 (CONS |b| |c|)))))))
            (EXIT (CONS 1 "failed"))))
          #2# (EXIT #1#)))) 

(SDEFUN |LAPLACE;atn|
        ((|f| (F)) (|t| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                   #1="failed")))
        (SPROG
         ((|v|
           (|Union|
            (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|)))
            #2="failed"))
          (|w|
           (|Record| (|:| |var| (|Kernel| F)) (|:| |exponent| (|Integer|))))
          (|vv| (|Union| (|Symbol|) "failed")) (#3=#:G92 NIL) (#4=#:G113 NIL)
          (#5=#:G112 NIL) (|u| (|Union| (|List| F) #2#)) (|g| NIL)
          (#6=#:G114 NIL)
          (|rec|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    #1#))
          (|r| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|))))
          (|d| (|NonNegativeInteger|)) (|c| (F)) (#7=#:G108 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |v| (SPADCALL |f| (QREFELT % 57)))
                 (EXIT
                  (COND
                   ((QEQCAR |v| 0)
                    (SEQ (LETT |w| (QCDR |v|))
                         (EXIT
                          (COND
                           ((> (QCDR |w|) 0)
                            (SEQ
                             (EXIT
                              (SEQ
                               (LETT |vv| (SPADCALL (QCAR |w|) (QREFELT % 59)))
                               (EXIT
                                (COND
                                 ((QEQCAR |vv| 0)
                                  (COND
                                   ((EQUAL (QCDR |vv|) |t|)
                                    (PROGN
                                     (LETT #5#
                                           (PROGN
                                            (LETT #4#
                                                  (CONS 0
                                                        (CONS
                                                         (|spadConstant| % 61)
                                                         (PROG1
                                                             (LETT #3#
                                                                   (QCDR |w|))
                                                           (|check_subtype2|
                                                            (> #3# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|)
                                                            #3#)))))
                                            (GO #8=#:G111)))
                                     (GO #9=#:G94)))))))))
                             #9# (EXIT #5#))))))))))
            (LETT |u| (SPADCALL |f| (QREFELT % 63)))
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ (LETT |c| (|spadConstant| % 61)) (LETT |d| 0)
                    (SEQ (LETT |g| NIL) (LETT #6# (QCDR |u|)) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |g| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ (LETT |rec| (|LAPLACE;atn| |g| |t| %))
                              (EXIT
                               (COND
                                ((QEQCAR |rec| 0)
                                 (SEQ (LETT |r| (QCDR |rec|))
                                      (LETT |c|
                                            (SPADCALL |c| (QCAR |r|)
                                                      (QREFELT % 36)))
                                      (EXIT (LETT |d| (+ |d| (QCDR |r|))))))
                                ('T
                                 (LETT |c|
                                       (SPADCALL |c| |g| (QREFELT % 36)))))))
                         (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (COND ((ZEROP |d|) (CONS 1 "failed"))
                           (#10='T
                            (CONS 0
                                  (CONS |c|
                                        (PROG1 (LETT #7# |d|)
                                          (|check_subtype2| (> #7# 0)
                                                            '(|PositiveInteger|)
                                                            '(|NonNegativeInteger|)
                                                            #7#)))))))))
              (#10# (CONS 1 "failed"))))))
          #8# (EXIT #4#)))) 

(SDEFUN |LAPLACE;is_root|
        ((|k| (|Kernel| F)) (|t| (|Symbol|)) (% (|Union| F "failed")))
        (SPROG ((|args| (|List| F)) (|a| (F)))
               (SEQ
                (COND
                 ((SPADCALL |k| '|nthRoot| (QREFELT % 64))
                  (SEQ (LETT |args| (SPADCALL |k| (QREFELT % 65)))
                       (EXIT
                        (COND
                         ((OR
                           (SPADCALL (SPADCALL |args| 2 (QREFELT % 67))
                                     (SPADCALL 2 (QREFELT % 68))
                                     (QREFELT % 69))
                           (NULL
                            (SPADCALL
                             (LETT |a|
                                   (SPADCALL (SPADCALL |args| 1 (QREFELT % 67))
                                             (SPADCALL |t| (QREFELT % 16))
                                             (QREFELT % 41)))
                             |t| (QREFELT % 54))))
                          (CONS 1 "failed"))
                         ('T (CONS 0 |a|))))))
                 ('T (CONS 1 "failed")))))) 

(SDEFUN |LAPLACE;athalf|
        ((|f| (F)) (|t| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|)))
                   "failed")))
        (SPROG
         ((#1=#:G140 NIL) (|k| NIL) (#2=#:G141 NIL)
          (|vkl| (|List| (|Kernel| F))) (|nk| (|NonNegativeInteger|))
          (|rk| (|Kernel| F)) (|rru| (|Union| F "failed")) (|nf| (F))
          (|v|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    "failed"))
          (|vv| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))))
         (SEQ
          (LETT |vkl|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |k| NIL) (LETT #2# (SPADCALL |f| (QREFELT % 19)))
                       G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |k| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL |t|
                                     (SPADCALL (SPADCALL |k| (QREFELT % 70))
                                               (QREFELT % 72))
                                     (QREFELT % 73))
                           (LETT #1# (CONS |k| #1#))))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 74)))
          (LETT |nk| (LENGTH |vkl|))
          (EXIT
           (COND ((> |nk| 2) (CONS 1 "failed"))
                 (#3='T
                  (SEQ
                   (LETT |rru|
                         (|LAPLACE;is_root|
                          (LETT |rk| (SPADCALL |vkl| |nk| (QREFELT % 75))) |t|
                          %))
                   (EXIT
                    (COND ((QEQCAR |rru| 1) (CONS 1 "failed"))
                          (#3#
                           (SEQ
                            (LETT |nf|
                                  (SPADCALL |f| (SPADCALL |rk| (QREFELT % 70))
                                            (QREFELT % 36)))
                            (COND
                             ((NULL
                               (SPADCALL |t| (SPADCALL |nf| (QREFELT % 72))
                                         (QREFELT % 73)))
                              (EXIT
                               (CONS 0
                                     (CONS
                                      (SPADCALL |nf| (QCDR |rru|)
                                                (QREFELT % 41))
                                      0)))))
                            (LETT |v|
                                  (|LAPLACE;atn|
                                   (SPADCALL |f| (SPADCALL |rk| (QREFELT % 70))
                                             (QREFELT % 36))
                                   |t| %))
                            (EXIT
                             (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                                   (#3#
                                    (SEQ (LETT |vv| (QCDR |v|))
                                         (EXIT
                                          (COND
                                           ((SPADCALL (QCAR |vv|) |t|
                                                      (QREFELT % 54))
                                            (CONS 0
                                                  (CONS
                                                   (SPADCALL (QCAR |vv|)
                                                             (QCDR |rru|)
                                                             (QREFELT % 41))
                                                   (QCDR |vv|))))
                                           (#3#
                                            (CONS 1 "failed"))))))))))))))))))) 

(SDEFUN |LAPLACE;aexp|
        ((|f| (F)) (|t| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
                   #1="failed")))
        (SPROG
         ((|u| (|Union| (|List| F) #2="failed")) (|g| NIL) (#3=#:G179 NIL)
          (|c0| (F)) (|c1| (F)) (|c| (F))
          (|v|
           (|Union| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))) #2#))
          (|w| (|Record| (|:| |val| F) (|:| |exponent| (|Integer|))))
          (|r|
           (|Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
                    #1#))
          (|rec| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F)))
          (#4=#:G178 NIL) (#5=#:G177 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL |f| '|exp| (QREFELT % 76))
             (SEQ
              (LETT |v|
                    (|LAPLACE;isLinear|
                     (|SPADfirst|
                      (SPADCALL (SPADCALL |f| (QREFELT % 77)) (QREFELT % 65)))
                     |t| %))
              (EXIT
               (COND ((QEQCAR |v| 1) (CONS 1 "failed"))
                     (#6='T
                      (CONS 0
                            (VECTOR (|spadConstant| % 61) (QCDR (QCDR |v|))
                                    (QCAR (QCDR |v|)))))))))
            (#6#
             (SEQ (LETT |u| (SPADCALL |f| (QREFELT % 63)))
                  (EXIT
                   (COND
                    ((QEQCAR |u| 0)
                     (SEQ (LETT |c| (|spadConstant| % 61))
                          (LETT |c1| (LETT |c0| (|spadConstant| % 78)))
                          (SEQ (LETT |g| NIL) (LETT #3# (QCDR |u|)) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |g| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ (LETT |r| (|LAPLACE;aexp| |g| |t| %))
                                    (EXIT
                                     (COND
                                      ((QEQCAR |r| 0)
                                       (SEQ (LETT |rec| (QCDR |r|))
                                            (LETT |c|
                                                  (SPADCALL |c| (QVELT |rec| 0)
                                                            (QREFELT % 36)))
                                            (LETT |c0|
                                                  (SPADCALL |c0|
                                                            (QVELT |rec| 2)
                                                            (QREFELT % 79)))
                                            (EXIT
                                             (LETT |c1|
                                                   (SPADCALL |c1|
                                                             (QVELT |rec| 1)
                                                             (QREFELT %
                                                                      79))))))
                                      ('T
                                       (LETT |c|
                                             (SPADCALL |c| |g|
                                                       (QREFELT % 36)))))))
                               (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                          (COND
                           ((SPADCALL |c0| (QREFELT % 80))
                            (COND
                             ((SPADCALL |c1| (QREFELT % 80))
                              (EXIT (CONS 1 "failed"))))))
                          (EXIT (CONS 0 (VECTOR |c| |c1| |c0|)))))
                    (#6#
                     (SEQ
                      (SEQ (LETT |v| (SPADCALL |f| (QREFELT % 83)))
                           (EXIT
                            (COND
                             ((QEQCAR |v| 0)
                              (SEQ (LETT |w| (QCDR |v|))
                                   (EXIT
                                    (COND
                                     ((SPADCALL (QCDR |w|) 1 (QREFELT % 84))
                                      (SEQ
                                       (EXIT
                                        (SEQ
                                         (LETT |r|
                                               (|LAPLACE;aexp| (QCAR |w|) |t|
                                                %))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |r| 0)
                                            (PROGN
                                             (LETT #5#
                                                   (SEQ (LETT |rec| (QCDR |r|))
                                                        (EXIT
                                                         (PROGN
                                                          (LETT #4#
                                                                (CONS 0
                                                                      (VECTOR
                                                                       (SPADCALL
                                                                        (QVELT
                                                                         |rec|
                                                                         0)
                                                                        (QCDR
                                                                         |w|)
                                                                        (QREFELT
                                                                         % 85))
                                                                       (SPADCALL
                                                                        (QCDR
                                                                         |w|)
                                                                        (QVELT
                                                                         |rec|
                                                                         1)
                                                                        (QREFELT
                                                                         % 86))
                                                                       (SPADCALL
                                                                        (QCDR
                                                                         |w|)
                                                                        (QVELT
                                                                         |rec|
                                                                         2)
                                                                        (QREFELT
                                                                         %
                                                                         86)))))
                                                          (GO #7=#:G176)))))
                                             (GO #8=#:G170)))))))
                                       #8# (EXIT #5#))))))))))
                      (EXIT (CONS 1 "failed"))))))))))
          #7# (EXIT #4#)))) 

(SDEFUN |LAPLACE;mkPlus| ((|f| (F)) (% (|Union| (|List| F) "failed")))
        (SPROG
         ((|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed"))
          (|d| (|SparseMultivariatePolynomial| R (|Kernel| F))) (#1=#:G191 NIL)
          (|p| NIL) (#2=#:G192 NIL))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |f| (QREFELT % 88)) (QREFELT % 90)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |d| (SPADCALL |f| (QREFELT % 91)))
                       (EXIT
                        (CONS 0
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |p| NIL) (LETT #2# (QCDR |u|)) G190
                                    (COND
                                     ((OR (ATOM #2#)
                                          (PROGN (LETT |p| (CAR #2#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL |p| |d| (QREFELT % 92))
                                             #1#))))
                                    (LETT #2# (CDR #2#)) (GO G190) G191
                                    (EXIT (NREVERSE #1#))))))))))))) 

(SDEFUN |LAPLACE;tdenom| ((|f| (F)) (|t| (F)) (% (|Union| F "failed")))
        (COND
         ((QEQCAR
           (SPADCALL (SPADCALL |f| (QREFELT % 91))
                     (SPADCALL |t| (QREFELT % 88)) (QREFELT % 94))
           1)
          (CONS 1 "failed"))
         ('T (CONS 0 (SPADCALL |t| |f| (QREFELT % 36)))))) 

(SDEFUN |LAPLACE;intlaplace|
        ((|f| (F)) (|ss| (F)) (|g| (F)) (|v| (|Symbol|)) (|vv| (F))
         (% (|Union| F "failed")))
        (SPROG
         ((|i| (|Union| F (|List| F))) (#1=#:G226 NIL)
          (|u|
           #2=(|Union| (|OrderedCompletion| F)
                       (|Record|
                        (|:| |leftHandLimit|
                             (|Union| (|OrderedCompletion| F) #3="failed"))
                        (|:| |rightHandLimit|
                             (|Union| (|OrderedCompletion| F) #3#)))
                       "failed"))
          (|l| #2#) (|uu| (|OrderedCompletion| F))
          (|ll| (|OrderedCompletion| F)) (|u1| #4=(|SingleInteger|))
          (|l1| #4#))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |g| (QREFELT % 13) (QREFELT % 95))
              (EXIT (CONS 1 #5="failed")))
             (#6='T
              (SEQ (LETT |i| (SPADCALL |g| |v| (QREFELT % 98)))
                   (EXIT
                    (COND
                     ((QEQCAR |i| 1)
                      (PROGN (LETT #1# (CONS 1 #5#)) (GO #7=#:G224))))))))
            (LETT |u|
                  (SPADCALL (QCDR |i|)
                            (SPADCALL (SPADCALL |vv| (QREFELT % 100))
                                      (SPADCALL (QREFELT % 101))
                                      (QREFELT % 103))
                            (QREFELT % 108)))
            (EXIT
             (COND
              ((QEQCAR |u| 0)
               (SEQ
                (LETT |l|
                      (SPADCALL (QCDR |i|)
                                (SPADCALL (SPADCALL |vv| (QREFELT % 100))
                                          (SPADCALL |ss| (QREFELT % 100))
                                          (QREFELT % 103))
                                (QREFELT % 108)))
                (EXIT
                 (COND
                  ((QEQCAR |l| 0)
                   (SEQ (LETT |uu| (QCDR |u|)) (LETT |ll| (QCDR |l|))
                        (LETT |u1| (SPADCALL |uu| (QREFELT % 110)))
                        (LETT |l1| (SPADCALL |ll| (QREFELT % 110)))
                        (COND
                         ((|eql_SI| |u1| 0)
                          (COND
                           ((|eql_SI| |l1| 0)
                            (EXIT
                             (CONS 0
                                   (SPADCALL (SPADCALL |uu| (QREFELT % 112))
                                             (SPADCALL |ll| (QREFELT % 112))
                                             (QREFELT % 113))))))))
                        (EXIT (CONS 1 "failed"))))
                  (#6# (CONS 1 "failed"))))))
              (#6# (CONS 1 "failed"))))))
          #7# (EXIT #1#)))) 

(SDEFUN |LAPLACE;lapkernel|
        ((|f| (F)) (|t| (|Symbol|)) (|tt| (F)) (|ss| (F))
         (% (|Union| F "failed")))
        (SPROG
         ((|k| (|Union| (|Kernel| F) "failed")) (|arg| (|List| F)) (|fint| (F))
          (|s| (|Symbol|)) (|a| (F)) (|op| (|BasicOperator|)))
         (SEQ (LETT |k| (SPADCALL |f| (QREFELT % 115)))
              (EXIT
               (COND
                ((OR (QEQCAR |k| 1)
                     (NULL (LETT |arg| (SPADCALL (QCDR |k|) (QREFELT % 65)))))
                 (CONS 1 "failed"))
                ((SPADCALL (LETT |op| (SPADCALL (QCDR |k|) (QREFELT % 29)))
                           '|%diff| (QREFELT % 116))
                 (COND
                  ((OR (NULL (EQL (LENGTH |arg|) 3))
                       (NULL
                        (SPADCALL (SPADCALL |arg| 3 (QREFELT % 67)) |t|
                                  (QREFELT % 76))))
                   (CONS 1 "failed"))
                  ('T
                   (SEQ
                    (LETT |fint|
                          (SPADCALL (SPADCALL |arg| 1 (QREFELT % 67))
                                    (SPADCALL |arg| 2 (QREFELT % 67)) |tt|
                                    (QREFELT % 117)))
                    (LETT |s|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ss| (QREFELT % 19)) 1
                                      (QREFELT % 75))
                            (QREFELT % 29))
                           (QREFELT % 118)))
                    (EXIT
                     (CONS 0
                           (SPADCALL
                            (SPADCALL |ss|
                                      (|LAPLACE;locallaplace| |fint| |t| |tt|
                                       |s| |ss| %)
                                      (QREFELT % 36))
                            (SPADCALL |fint|
                                      (SPADCALL |tt| (|spadConstant| % 78)
                                                (QREFELT % 121))
                                      (QREFELT % 123))
                            (QREFELT % 113))))))))
                ((NULL (NULL (CDR |arg|))) (CONS 1 "failed"))
                ((OR (SPADCALL |op| '|erf| (QREFELT % 116))
                     (OR (SPADCALL |op| '|fresnelS| (QREFELT % 116))
                         (SPADCALL |op| '|fresnelC| (QREFELT % 116))))
                 (COND
                  ((SPADCALL |t|
                             (SPADCALL
                              (LETT |a|
                                    (SPADCALL (|SPADfirst| |arg|)
                                              (SPADCALL |tt| (QREFELT % 124))
                                              (QREFELT % 41)))
                              (QREFELT % 72))
                             (QREFELT % 73))
                   (CONS 1 "failed"))
                  (#1='T
                   (SEQ
                    (LETT |s|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ss| (QREFELT % 19)) 1
                                      (QREFELT % 75))
                            (QREFELT % 29))
                           (QREFELT % 118)))
                    (EXIT
                     (CONS 0
                           (SPADCALL
                            (SPADCALL (SPADCALL |f| |t| (QREFELT % 125)) |t|
                                      |s| (QREFELT % 17))
                            |ss| (QREFELT % 41))))))))
                ('T
                 (COND
                  ((SPADCALL |t|
                             (SPADCALL
                              (LETT |a|
                                    (SPADCALL (|SPADfirst| |arg|) |tt|
                                              (QREFELT % 41)))
                              (QREFELT % 72))
                             (QREFELT % 73))
                   (CONS 1 "failed"))
                  ((SPADCALL (LETT |op| (SPADCALL (QCDR |k|) (QREFELT % 29)))
                             '|Si| (QREFELT % 116))
                   (CONS 0
                         (SPADCALL
                          (SPADCALL (SPADCALL |a| |ss| (QREFELT % 41))
                                    (QREFELT % 126))
                          |ss| (QREFELT % 41))))
                  ((SPADCALL |op| '|Ci| (QREFELT % 116))
                   (CONS 0
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |ss| 2 (QREFELT % 128))
                                      (SPADCALL |a| 2 (QREFELT % 128))
                                      (QREFELT % 79))
                            (SPADCALL |a| 2 (QREFELT % 128)) (QREFELT % 41))
                           (QREFELT % 129))
                          (SPADCALL 2 |ss| (QREFELT % 130)) (QREFELT % 41))))
                  ((SPADCALL |op| '|Ei| (QREFELT % 116))
                   (CONS 0
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |ss| |a| (QREFELT % 79)) |a|
                                     (QREFELT % 41))
                           (QREFELT % 129))
                          |ss| (QREFELT % 41))))
                  (#1#
                   (SEQ
                    (COND
                     ((|HasCategory| (QREFELT % 7)
                                     '(|SpecialFunctionCategory|))
                      (COND
                       ((SPADCALL |op| '|log| (QREFELT % 116))
                        (EXIT
                         (CONS 0
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL
                                  (SPADCALL (|spadConstant| % 61)
                                            (QREFELT % 131))
                                  (SPADCALL |a| (QREFELT % 129))
                                  (QREFELT % 113))
                                 (SPADCALL |ss| (QREFELT % 129))
                                 (QREFELT % 113))
                                |ss| (QREFELT % 41))))))))
                    (EXIT (CONS 1 "failed"))))))))))) 

(SDEFUN |LAPLACE;locallaplace|
        ((|f| (F)) (|t| (|Symbol|)) (|tt| (F)) (|s| (|Symbol|)) (|ss| (F))
         (% (F)))
        (SPROG
         ((|vvv| (F)) (|g| (F)) (|u| (|Union| (|List| F) "failed"))
          (#1=#:G285 NIL) (#2=#:G262 (F)) (#3=#:G260 (F)) (#4=#:G261 NIL)
          (|rec| (|Record| (|:| |const| F) (|:| |nconst| F)))
          (|v|
           (|Union| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|)))
                    "failed"))
          (|vv| (|Record| (|:| |coef| F) (|:| |deg| (|PositiveInteger|))))
          (|la| (F))
          (|w|
           (|Union| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F))
                    "failed"))
          (|ww| (|Record| (|:| |coef| F) (|:| |coef1| F) (|:| |coef0| F)))
          (|v2|
           (|Union|
            (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|)))
            "failed"))
          (|vv2| (|Record| (|:| |coef| F) (|:| |deg| (|NonNegativeInteger|))))
          (|res1| (F)) (|x| (|Union| F "failed")))
         (SEQ
          (COND ((SPADCALL |f| (QREFELT % 80)) (|spadConstant| % 78))
                ((SPADCALL |f| (|spadConstant| % 61) (QREFELT % 119))
                 (SPADCALL |ss| (QREFELT % 132)))
                (#5='T
                 (SEQ (LETT |x| (|LAPLACE;tdenom| |f| |tt| %))
                      (EXIT
                       (COND
                        ((QEQCAR |x| 0)
                         (SEQ
                          (LETT |g|
                                (|LAPLACE;locallaplace| (QCDR |x|) |t| |tt|
                                 (LETT |vv| (SPADCALL (QREFELT % 133)))
                                 (LETT |vvv| (SPADCALL |vv| (QREFELT % 16)))
                                 %))
                          (LETT |x|
                                (|LAPLACE;intlaplace| |f| |ss| |g| |vv| |vvv|
                                 %))
                          (EXIT
                           (COND ((QEQCAR |x| 0) (QCDR |x|))
                                 (#5#
                                  (SPADCALL (QREFELT % 13) |f| |tt| |ss|
                                            (QREFELT % 37)))))))
                        (#5#
                         (SEQ (LETT |u| (|LAPLACE;mkPlus| |f| %))
                              (EXIT
                               (COND
                                ((QEQCAR |u| 0)
                                 (PROGN
                                  (LETT #4# NIL)
                                  (SEQ (LETT #1# (QCDR |u|)) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN (LETT |g| (CAR #1#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (PROGN
                                          (LETT #2#
                                                (|LAPLACE;locallaplace| |g| |t|
                                                 |tt| |s| |ss| %))
                                          (COND
                                           (#4#
                                            (LETT #3#
                                                  (SPADCALL #3# #2#
                                                            (QREFELT % 79))))
                                           ('T
                                            (PROGN
                                             (LETT #3# #2#)
                                             (LETT #4# 'T)))))))
                                       (LETT #1# (CDR #1#)) (GO G190) G191
                                       (EXIT NIL))
                                  (COND (#4# #3#)
                                        (#5# (|spadConstant| % 78)))))
                                ((SPADCALL
                                  (QCAR
                                   (LETT |rec|
                                         (SPADCALL |f| |t| (QREFELT % 136))))
                                  (|spadConstant| % 61) (QREFELT % 69))
                                 (SPADCALL (QCAR |rec|)
                                           (|LAPLACE;locallaplace| (QCDR |rec|)
                                            |t| |tt| |s| |ss| %)
                                           (QREFELT % 36)))
                                (#5#
                                 (SEQ (LETT |v| (|LAPLACE;atn| |f| |t| %))
                                      (EXIT
                                       (COND
                                        ((QEQCAR |v| 0)
                                         (SEQ (LETT |vv| (QCDR |v|))
                                              (EXIT
                                               (COND
                                                ((SPADCALL
                                                  (LETT |la|
                                                        (|LAPLACE;locallaplace|
                                                         (QCAR |vv|) |t| |tt|
                                                         |s| |ss| %))
                                                  (QREFELT % 13)
                                                  (QREFELT % 95))
                                                 (SPADCALL (QREFELT % 13) |f|
                                                           |tt| |ss|
                                                           (QREFELT % 37)))
                                                (#5#
                                                 (SPADCALL
                                                  (EXPT -1 (QCDR |vv|))
                                                  (SPADCALL |la| |s|
                                                            (QCDR |vv|)
                                                            (QREFELT % 137))
                                                  (QREFELT % 86)))))))
                                        (#5#
                                         (SEQ
                                          (LETT |w| (|LAPLACE;aexp| |f| |t| %))
                                          (EXIT
                                           (COND
                                            ((QEQCAR |w| 0)
                                             (SEQ (LETT |ww| (QCDR |w|))
                                                  (EXIT
                                                   (SPADCALL
                                                    (SPADCALL (QVELT |ww| 2)
                                                              (QREFELT % 39))
                                                    (|LAPLACE;locallaplace|
                                                     (QVELT |ww| 0) |t| |tt|
                                                     |s|
                                                     (SPADCALL |ss|
                                                               (QVELT |ww| 1)
                                                               (QREFELT % 113))
                                                     %)
                                                    (QREFELT % 36)))))
                                            (#5#
                                             (SEQ
                                              (LETT |v2|
                                                    (|LAPLACE;athalf| |f| |t|
                                                     %))
                                              (EXIT
                                               (COND
                                                ((QEQCAR |v2| 0)
                                                 (SEQ (LETT |vv2| (QCDR |v2|))
                                                      (LETT |res1|
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (QREFELT % 138))
                                                              (QREFELT % 124))
                                                             (SPADCALL
                                                              (SPADCALL
                                                               (|spadConstant|
                                                                % 61)
                                                               (SPADCALL |ss|
                                                                         (QREFELT
                                                                          %
                                                                          124))
                                                               (QREFELT % 41))
                                                              |s| (QCDR |vv2|)
                                                              (QREFELT % 137))
                                                             (QREFELT % 36)))
                                                      (EXIT
                                                       (SPADCALL
                                                        (SPADCALL
                                                         (EXPT -1 (QCDR |vv2|))
                                                         (QCAR |vv2|)
                                                         (QREFELT % 86))
                                                        |res1|
                                                        (QREFELT % 36)))))
                                                (#5#
                                                 (SEQ
                                                  (LETT |x|
                                                        (|LAPLACE;lapkernel|
                                                         |f| |t| |tt| |ss| %))
                                                  (EXIT
                                                   (COND
                                                    ((QEQCAR |x| 0) (QCDR |x|))
                                                    (#5#
                                                     (SPADCALL (QREFELT % 13)
                                                               |f| |tt| |ss|
                                                               (QREFELT %
                                                                        37))))))))))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |LaplaceTransform;|)) 

(DEFUN |LaplaceTransform;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|LaplaceTransform| DV$1 DV$2))
          (LETT % (GETREFV 141))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|LaplaceTransform| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 8 '|%alg|)
          (QSETREFV % 13 (SPADCALL '|laplace| 3 (QREFELT % 12)))
          (SPADCALL (QREFELT % 13) '|%specialDiff|
                    (CONS (|function| |LAPLACE;dvlap|) %) (QREFELT % 140))
          %))) 

(DEFUN |LaplaceTransform| (&REST #1=#:G290)
  (SPROG NIL
         (PROG (#2=#:G291)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LaplaceTransform|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LaplaceTransform;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|LaplaceTransform|)))))))))) 

(MAKEPROP '|LaplaceTransform| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ALGOP
              (|Symbol|) (|NonNegativeInteger|) (|BasicOperator|)
              (0 . |operator|) '|oplap| (|TrigonometricManipulations| 6 7)
              (6 . |complexElementary|) (12 . |coerce|)
              |LAPLACE;laplace;F2SF;1| (|List| 44) (17 . |kernels|) (|List| 24)
              (|IntegrationTools| 6 7) (22 . |varselect|) (28 . |max|)
              (|Kernel| 7) (34 . |height|) (|Mapping| 10 10 10) (|List| 10)
              (39 . |reduce|) (46 . |operator|) (|Boolean|) (51 . |has?|)
              (|List| 7) (57 . |second|) (62 . |third|) (67 . |retract|)
              (72 . *) (78 . |elt|) (86 . -) (91 . |exp|)
              (96 . |differentiate|) (102 . /) (108 . |kernel|)
              (|Fraction| (|SparseUnivariatePolynomial| %)) (|Kernel| %)
              (113 . |univariate|) (|SparseUnivariatePolynomial| 7)
              (|Fraction| 46) (119 . |denom|) (|Union| 7 '"failed")
              (124 . |retractIfCan|) (129 . |numer|) (134 . |degree|)
              (139 . |coefficient|) (145 . |freeOf?|)
              (|Record| (|:| |var| 44) (|:| |exponent| 66))
              (|Union| 55 '#1="failed") (151 . |isExpt|) (|Union| 9 '"failed")
              (156 . |symbolIfCan|) (161 . |1|) (165 . |1|)
              (|Union| (|List| %) '#1#) (169 . |isTimes|) (174 . |is?|)
              (180 . |argument|) (|Integer|) (185 . |elt|) (191 . |coerce|)
              (196 . ~=) (202 . |coerce|) (|List| 9) (207 . |variables|)
              (212 . |member?|) (218 . |sort|) (223 . |elt|) (229 . |is?|)
              (235 . |retract|) (240 . |0|) (244 . +) (250 . |zero?|)
              (|Record| (|:| |val| %) (|:| |exponent| 66)) (|Union| 81 '#1#)
              (255 . |isPower|) (260 . ~=) (266 . ^) (272 . *)
              (|SparseMultivariatePolynomial| 6 44) (278 . |numer|)
              (|SparseMultivariatePolynomial| 6 24) (283 . |isPlus|)
              (288 . |denom|) (293 . /) (|Union| % '"failed") (299 . |exquo|)
              (305 . |is?|) (|Union| 7 32) (|FunctionSpaceIntegration| 6 7)
              (311 . |integrate|) (|OrderedCompletion| 7) (317 . |coerce|)
              (322 . |plusInfinity|) (|Equation| 99) (326 . |equation|)
              (|Union| 99 '"failed")
              (|Record| (|:| |leftHandLimit| 104) (|:| |rightHandLimit| 104))
              (|Union| 99 105 '"failed") (|PowerSeriesLimitPackage| 6 7)
              (332 . |limit|) (|SingleInteger|) (338 . |whatInfinity|)
              (343 . |0|) (347 . |retract|) (352 . -) (|Union| 44 '"failed")
              (358 . |retractIfCan|) (363 . |is?|) (369 . |eval|)
              (376 . |name|) (381 . =) (|Equation| 7) (387 . =) (|Equation| %)
              (393 . |eval|) (399 . |sqrt|) (404 . D) (410 . |atan|)
              (|PositiveInteger|) (415 . ^) (421 . |log|) (426 . *)
              (432 . |digamma|) (437 . |inv|) (442 . |new|)
              (|Record| (|:| |const| 7) (|:| |nconst| 7))
              (|PatternMatchIntegration| 6 7) (446 . |splitConstant|)
              (452 . |differentiate|) (459 . |pi|) (|None|)
              (463 . |setProperty|))
           '#(|laplace| 470) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|laplace| (|#2| |#2| (|Symbol|) (|Symbol|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 140
                                            '(2 11 0 9 10 12 2 14 7 7 9 15 1 7
                                              0 9 16 1 7 18 0 19 2 21 20 20 9
                                              22 2 10 0 0 0 23 1 24 10 0 25 3
                                              27 10 26 0 10 28 1 24 11 0 29 2
                                              11 30 0 9 31 1 32 7 0 33 1 32 7 0
                                              34 1 7 9 0 35 2 7 0 0 0 36 4 7 0
                                              11 0 0 0 37 1 7 0 0 38 1 7 0 0 39
                                              2 7 0 0 9 40 2 7 0 0 0 41 1 24 0
                                              9 42 2 7 43 0 44 45 1 47 46 0 48
                                              1 46 49 0 50 1 47 46 0 51 1 46 10
                                              0 52 2 46 7 0 10 53 2 7 30 0 9 54
                                              1 7 56 0 57 1 24 58 0 59 0 6 0 60
                                              0 7 0 61 1 7 62 0 63 2 24 30 0 9
                                              64 1 24 32 0 65 2 32 7 0 66 67 1
                                              7 0 66 68 2 7 30 0 0 69 1 7 0 44
                                              70 1 7 71 0 72 2 71 30 9 0 73 1
                                              20 0 0 74 2 20 24 0 66 75 2 7 30
                                              0 9 76 1 7 44 0 77 0 7 0 78 2 7 0
                                              0 0 79 1 7 30 0 80 1 7 82 0 83 2
                                              66 30 0 0 84 2 7 0 0 66 85 2 7 0
                                              66 0 86 1 7 87 0 88 1 89 62 0 90
                                              1 7 87 0 91 2 7 0 87 87 92 2 89
                                              93 0 0 94 2 7 30 0 11 95 2 97 96
                                              7 9 98 1 99 0 7 100 0 99 0 101 2
                                              102 0 99 99 103 2 107 106 7 102
                                              108 1 99 109 0 110 0 6 0 111 1 99
                                              7 0 112 2 7 0 0 0 113 1 7 114 0
                                              115 2 11 30 0 9 116 3 7 0 0 0 0
                                              117 1 11 9 0 118 2 7 30 0 0 119 2
                                              120 0 7 7 121 2 7 0 0 122 123 1 7
                                              0 0 124 2 7 0 0 9 125 1 7 0 0 126
                                              2 7 0 0 127 128 1 7 0 0 129 2 7 0
                                              127 0 130 1 7 0 0 131 1 7 0 0 132
                                              0 9 0 133 2 135 134 7 9 136 3 7 0
                                              0 9 10 137 0 7 0 138 3 11 0 0 9
                                              139 140 3 0 7 7 9 9 17)))))
           '|lookupComplete|)) 
