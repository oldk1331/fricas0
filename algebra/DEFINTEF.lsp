
(SDEFUN |DEFINTEF;innerint;FS2OcBU;1|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|ignor?| (|Boolean|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| #1="failed") (|:| |pole| #2="potentialPole"))))
        (SPROG
         ((|u|
           (|Union| (|:| |f1| (|OrderedCompletion| F))
                    (|:| |f2| (|List| (|OrderedCompletion| F)))
                    (|:| |fail| #1#) (|:| |pole| #2#)))
          (|v| (|Union| F "failed")) (#3=#:G71 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| %))
                 (EXIT
                  (COND
                   ((OR (QEQCAR |u| 0) (QEQCAR |u| 1))
                    (PROGN (LETT #3# |u|) (GO #4=#:G65)))
                   ('T
                    (SEQ (LETT |v| (SPADCALL |f| |x| |a| |b| (QREFELT % 12)))
                         (EXIT
                          (COND
                           ((QEQCAR |v| 1)
                            (PROGN (LETT #3# |u|) (GO #4#))))))))))
            (EXIT (CONS 0 (SPADCALL (QCDR |v|) (QREFELT % 13))))))
          #4# (EXIT #3#)))) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;2|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|ignor?| (|Boolean|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| "potentialPole"))))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| %)) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;3|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|ignor?| (|Boolean|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| "potentialPole"))))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| %)) 

(SDEFUN |DEFINTEF;innerint;FS2OcBU;4|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|ignor?| (|Boolean|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| "potentialPole"))))
        (|DEFINTEF;int| |f| |x| |a| |b| |ignor?| %)) 

(SDEFUN |DEFINTEF;integrate;FSbU;5|
        ((|f| (F)) (|s| (|SegmentBinding| (|OrderedCompletion| F)))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| "potentialPole"))))
        (SPADCALL |f| (SPADCALL |s| (QREFELT % 18))
                  (SPADCALL (SPADCALL |s| (QREFELT % 20)) (QREFELT % 21))
                  (SPADCALL (SPADCALL |s| (QREFELT % 20)) (QREFELT % 22)) NIL
                  (QREFELT % 16))) 

(SDEFUN |DEFINTEF;integrate;FSbSU;6|
        ((|f| (F)) (|s| (|SegmentBinding| (|OrderedCompletion| F)))
         (|str| (|String|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| "potentialPole"))))
        (SPADCALL |f| (SPADCALL |s| (QREFELT % 18))
                  (SPADCALL (SPADCALL |s| (QREFELT % 20)) (QREFELT % 21))
                  (SPADCALL (SPADCALL |s| (QREFELT % 20)) (QREFELT % 22))
                  (SPADCALL |str| (QREFELT % 26)) (QREFELT % 16))) 

(SDEFUN |DEFINTEF;int|
        ((|f| (F)) (|x| (|Symbol|)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (|ignor?| (|Boolean|))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| "failed") (|:| |pole| #1="potentialPole"))))
        (SPROG ((|k| (|Kernel| F)) (|z| (|Union| (|Boolean|) "failed")))
               (SEQ
                (COND
                 ((SPADCALL |a| |b| (QREFELT % 28))
                  (CONS 0 (SPADCALL (|spadConstant| % 29) (QREFELT % 13))))
                 (#2='T
                  (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 31)))
                       (LETT |z|
                             (|DEFINTEF;checkForPole| |f| |x| |k| |a| |b| %))
                       (EXIT
                        (COND
                         ((QEQCAR |z| 1)
                          (COND
                           (|ignor?| (|DEFINTEF;nopole| |f| |x| |k| |a| |b| %))
                           (#2# (CONS 3 #1#))))
                         ((QCDR |z|)
                          (|error| "integrate: pole in path of integration"))
                         (#2# (|DEFINTEF;nopole| |f| |x| |k| |a| |b| %)))))))))) 

(SDEFUN |DEFINTEF;checkForPole|
        ((|f| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|a| (|OrderedCompletion| F)) (|b| (|OrderedCompletion| F))
         (% (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|d| (|SparseMultivariatePolynomial| R (|Kernel| F)))
          (|u| (|Union| (|Boolean|) "failed")) (#1=#:G116 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u|
                   (|DEFINTEF;checkFor0|
                    (LETT |d| (SPADCALL |f| (QREFELT % 33))) |k| |a| |b| %))
             (EXIT
              (COND
               ((OR (QEQCAR |u| 1) (QCDR |u|))
                (PROGN (LETT #1# |u|) (GO #2=#:G114))))))
            (SEQ (LETT |u| (|DEFINTEF;checkSMP| |d| |x| |k| |a| |b| %))
                 (EXIT
                  (COND
                   ((OR (QEQCAR |u| 1) (QCDR |u|))
                    (PROGN (LETT #1# |u|) (GO #2#))))))
            (EXIT
             (|DEFINTEF;checkSMP| (SPADCALL |f| (QREFELT % 34)) |x| |k| |a| |b|
              %))))
          #2# (EXIT #1#)))) 

(SDEFUN |DEFINTEF;checkFor0|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|x| (|Kernel| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (% (|Union| (|Boolean|) #1="failed")))
        (SPROG
         ((|u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (|v|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed"))
          (|t| NIL) (#2=#:G159 NIL) (#3=#:G158 NIL) (#4=#:G156 NIL)
          (|z|
           (|Union|
            (|Record| (|:| |var| #5=(|Kernel| F))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|k| #5#) (|w| (|Union| (|Boolean|) #1#)) (#6=#:G157 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |u| (|DEFINTEF;polyIfCan| |p| |x| %))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (SPADCALL (QCDR |u|) |a| |b| NIL (QREFELT % 37)))
                  (#7='T
                   (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 40)))
                        (EXIT
                         (COND
                          ((QEQCAR |v| 0)
                           (SEQ
                            (SEQ
                             (EXIT
                              (SEQ (LETT |t| NIL) (LETT #2# (QCDR |v|)) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |t| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |w|
                                          (|DEFINTEF;checkFor0| |t| |x| |a| |b|
                                           %))
                                    (EXIT
                                     (COND
                                      ((OR (QEQCAR |w| 1) (QCDR |w|))
                                       (PROGN
                                        (LETT #4#
                                              (PROGN
                                               (LETT #3# |w|)
                                               (GO #8=#:G155)))
                                        (GO #9=#:G135))))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT NIL)))
                             #9# (EXIT #4#))
                            (EXIT (CONS 0 NIL))))
                          (#7#
                           (SEQ (LETT |z| (SPADCALL |p| (QREFELT % 43)))
                                (EXIT
                                 (COND ((QEQCAR |z| 1) (CONS 1 "failed"))
                                       (#7#
                                        (SEQ (LETT |k| (QCAR (QCDR |z|)))
                                             (COND
                                              ((OR
                                                (SPADCALL |k| '|exp|
                                                          (QREFELT % 44))
                                                (OR
                                                 (SPADCALL |k| '|acot|
                                                           (QREFELT % 44))
                                                 (SPADCALL |k| '|cosh|
                                                           (QREFELT % 44))))
                                               (EXIT (CONS 0 NIL))))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |k| '|log|
                                                          (QREFELT % 44))
                                                (SEQ
                                                 (EXIT
                                                  (SEQ
                                                   (SEQ
                                                    (LETT |w|
                                                          (|DEFINTEF;moreThan|
                                                           |b|
                                                           (|spadConstant| %
                                                                           46)
                                                           %))
                                                    (EXIT
                                                     (COND
                                                      ((OR (QEQCAR |w| 1)
                                                           (NULL (QCDR |w|)))
                                                       (PROGN
                                                        (LETT #6# |w|)
                                                        (GO #10=#:G150))))))
                                                   (EXIT
                                                    (|DEFINTEF;moreThan|
                                                     (SPADCALL |a|
                                                               (QREFELT % 47))
                                                     (SPADCALL
                                                      (|spadConstant| % 46)
                                                      (QREFELT % 50))
                                                     %))))
                                                 #10# (EXIT #6#)))
                                               (#7#
                                                (CONS 1
                                                      "failed"))))))))))))))))))
          #8# (EXIT #3#)))) 

(SDEFUN |DEFINTEF;moreThan|
        ((|a| (|OrderedCompletion| F)) (|b| (|Fraction| (|Integer|)))
         (% (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|r| (|Union| F "failed"))
          (|u| (|Union| (|Fraction| (|Integer|)) "failed")))
         (SEQ (LETT |r| (SPADCALL |a| (QREFELT % 51)))
              (EXIT
               (COND
                ((QEQCAR |r| 1) (CONS 0 (> (SPADCALL |a| (QREFELT % 53)) 0)))
                (#1='T
                 (SEQ (LETT |u| (SPADCALL (QCDR |r|) (QREFELT % 55)))
                      (EXIT
                       (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                             (#1#
                              (CONS 0
                                    (SPADCALL (QCDR |u|) |b|
                                              (QREFELT % 56))))))))))))) 

(SDEFUN |DEFINTEF;checkSMP|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|x| (|Symbol|))
         (|k| (|Kernel| F)) (|a| (|OrderedCompletion| F))
         (|b| (|OrderedCompletion| F)) (% (|Union| (|Boolean|) #1="failed")))
        (SPROG
         ((|u| (|Union| (|SparseUnivariatePolynomial| F) "failed"))
          (#2=#:G292 NIL) (#3=#:G278 NIL)
          (|v|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F)))
                    "failed"))
          (|t| NIL) (#4=#:G293 NIL) (#5=#:G291 NIL) (|n| (R))
          (|z|
           (|Union|
            (|Record| (|:| |var| #6=(|Kernel| F))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed"))
          (|kk| #6#) (|ak| (|List| F)) (|f| (F)) (#7=#:G288 NIL)
          (#8=#:G279 NIL) (#9=#:G282 NIL) (#10=#:G281 NIL) (|f2| (F))
          (|w| (|Union| (|Boolean|) #1#)) (#11=#:G280 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |u| (|DEFINTEF;polyIfCan| |p| |k| %))
                (EXIT
                 (COND ((QEQCAR |u| 0) (CONS 0 NIL))
                       (#12='T
                        (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 40)))
                             (EXIT
                              (COND
                               ((QEQCAR |v| 0)
                                (SEQ
                                 (SEQ
                                  (EXIT
                                   (SEQ (LETT |t| NIL) (LETT #2# (QCDR |v|))
                                        G190
                                        (COND
                                         ((OR (ATOM #2#)
                                              (PROGN (LETT |t| (CAR #2#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |w|
                                               (|DEFINTEF;checkSMP| |t| |x| |k|
                                                |a| |b| %))
                                         (EXIT
                                          (COND
                                           ((OR (QEQCAR |w| 1) (QCDR |w|))
                                            (PROGN
                                             (LETT #3#
                                                   (PROGN
                                                    (LETT #5# |w|)
                                                    (GO #13=#:G277)))
                                             (GO #14=#:G187))))))
                                        (LETT #2# (CDR #2#)) (GO G190) G191
                                        (EXIT NIL)))
                                  #14# (EXIT #3#))
                                 (EXIT (CONS 0 NIL))))
                               (#12#
                                (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 57)))
                                     (EXIT
                                      (COND
                                       ((QEQCAR |v| 0)
                                        (SEQ (LETT |n| (|spadConstant| % 58))
                                             (SEQ (LETT |t| NIL)
                                                  (LETT #4# (QCDR |v|)) G190
                                                  (COND
                                                   ((OR (ATOM #4#)
                                                        (PROGN
                                                         (LETT |t| (CAR #4#))
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |w|
                                                         (|DEFINTEF;checkSMP|
                                                          |t| |x| |k| |a| |b|
                                                          %))
                                                   (EXIT
                                                    (COND
                                                     ((QEQCAR |w| 1)
                                                      (PROGN
                                                       (LETT #5# |w|)
                                                       (GO #13#)))
                                                     ((QCDR |w|)
                                                      (LETT |n|
                                                            (SPADCALL |n|
                                                                      (|spadConstant|
                                                                       % 48)
                                                                      (QREFELT
                                                                       %
                                                                       59)))))))
                                                  (LETT #4# (CDR #4#))
                                                  (GO G190) G191 (EXIT NIL))
                                             (EXIT
                                              (COND
                                               ((SPADCALL |n| (QREFELT % 60))
                                                (CONS 0 NIL))
                                               ((SPADCALL |n|
                                                          (|spadConstant| % 48)
                                                          (QREFELT % 61))
                                                (CONS 0 'T))
                                               (#12# (CONS 1 "failed"))))))
                                       (#12#
                                        (SEQ
                                         (LETT |z|
                                               (SPADCALL |p| (QREFELT % 43)))
                                         (EXIT
                                          (COND
                                           ((QEQCAR |z| 1) (CONS 1 "failed"))
                                           (#12#
                                            (SEQ (LETT |kk| (QCAR (QCDR |z|)))
                                                 (EXIT
                                                  (COND
                                                   ((SPADCALL
                                                     (SPADCALL |kk|
                                                               (QREFELT % 63))
                                                     (QREFELT % 64))
                                                    (CONS 0 NIL))
                                                   (#12#
                                                    (SEQ
                                                     (LETT |ak|
                                                           (SPADCALL |kk|
                                                                     (QREFELT %
                                                                              66)))
                                                     (LETT |f|
                                                           (|SPADfirst| |ak|))
                                                     (COND
                                                      ((OR
                                                        (SPADCALL |kk| '|exp|
                                                                  (QREFELT %
                                                                           44))
                                                        (OR
                                                         (SPADCALL |kk| '|sin|
                                                                   (QREFELT %
                                                                            44))
                                                         (OR
                                                          (SPADCALL |kk| '|cos|
                                                                    (QREFELT %
                                                                             44))
                                                          (OR
                                                           (SPADCALL |kk|
                                                                     '|sinh|
                                                                     (QREFELT %
                                                                              44))
                                                           (OR
                                                            (SPADCALL |kk|
                                                                      '|cosh|
                                                                      (QREFELT
                                                                       % 44))
                                                            (OR
                                                             (SPADCALL |kk|
                                                                       '|tanh|
                                                                       (QREFELT
                                                                        % 44))
                                                             (OR
                                                              (SPADCALL |kk|
                                                                        '|sech|
                                                                        (QREFELT
                                                                         % 44))
                                                              (OR
                                                               (SPADCALL |kk|
                                                                         '|atan|
                                                                         (QREFELT
                                                                          %
                                                                          44))
                                                               (OR
                                                                (SPADCALL |kk|
                                                                          '|acot|
                                                                          (QREFELT
                                                                           %
                                                                           44))
                                                                (OR
                                                                 (SPADCALL |kk|
                                                                           '|asinh|
                                                                           (QREFELT
                                                                            %
                                                                            44))
                                                                 (OR
                                                                  (SPADCALL
                                                                   |kk| '|erf|
                                                                   (QREFELT %
                                                                            44))
                                                                  (OR
                                                                   (SPADCALL
                                                                    |kk|
                                                                    '|erfi|
                                                                    (QREFELT %
                                                                             44))
                                                                   (OR
                                                                    (SPADCALL
                                                                     |kk|
                                                                     '|fresnelC|
                                                                     (QREFELT %
                                                                              44))
                                                                    (OR
                                                                     (SPADCALL
                                                                      |kk|
                                                                      '|fresnelS|
                                                                      (QREFELT
                                                                       % 44))
                                                                     (OR
                                                                      (SPADCALL
                                                                       |kk|
                                                                       '|Si|
                                                                       (QREFELT
                                                                        % 44))
                                                                      (SPADCALL
                                                                       |kk|
                                                                       '|Shi|
                                                                       (QREFELT
                                                                        %
                                                                        44)))))))))))))))))
                                                       (EXIT
                                                        (|DEFINTEF;checkForPole|
                                                         |f| |x| |k| |a| |b|
                                                         %))))
                                                     (COND
                                                      ((OR
                                                        (SPADCALL |kk| '|asin|
                                                                  (QREFELT %
                                                                           44))
                                                        (OR
                                                         (SPADCALL |kk| '|acos|
                                                                   (QREFELT %
                                                                            44))
                                                         (SPADCALL |kk|
                                                                   '|atanh|
                                                                   (QREFELT %
                                                                            44))))
                                                       (EXIT
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ
                                                           (SEQ
                                                            (LETT |w|
                                                                  (|DEFINTEF;checkForPole|
                                                                   |f| |x| |k|
                                                                   |a| |b| %))
                                                            (EXIT
                                                             (COND
                                                              ((OR
                                                                (QEQCAR |w| 1)
                                                                (QCDR |w|))
                                                               (PROGN
                                                                (LETT #7# |w|)
                                                                (GO
                                                                 #15=#:G218))))))
                                                           (SEQ
                                                            (LETT |w|
                                                                  (|DEFINTEF;posit|
                                                                   (SPADCALL
                                                                    |f|
                                                                    (|spadConstant|
                                                                     % 49)
                                                                    (QREFELT %
                                                                             67))
                                                                   |x| |k| |a|
                                                                   |b| %))
                                                            (EXIT
                                                             (COND
                                                              ((OR
                                                                (QEQCAR |w| 1)
                                                                (QCDR |w|))
                                                               (PROGN
                                                                (LETT #7# |w|)
                                                                (GO #15#))))))
                                                           (EXIT
                                                            (|DEFINTEF;negat|
                                                             (SPADCALL |f|
                                                                       (|spadConstant|
                                                                        % 49)
                                                                       (QREFELT
                                                                        % 68))
                                                             |x| |k| |a| |b|
                                                             %))))
                                                         #15# (EXIT #7#)))))
                                                     (EXIT
                                                      (COND
                                                       ((SPADCALL |kk| '|acosh|
                                                                  (QREFELT %
                                                                           44))
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ
                                                           (SEQ
                                                            (LETT |w|
                                                                  (|DEFINTEF;checkForPole|
                                                                   |f| |x| |k|
                                                                   |a| |b| %))
                                                            (EXIT
                                                             (COND
                                                              ((OR
                                                                (QEQCAR |w| 1)
                                                                (QCDR |w|))
                                                               (PROGN
                                                                (LETT #8# |w|)
                                                                (GO
                                                                 #16=#:G234))))))
                                                           (EXIT
                                                            (|DEFINTEF;negat|
                                                             (SPADCALL |f|
                                                                       (|spadConstant|
                                                                        % 49)
                                                                       (QREFELT
                                                                        % 67))
                                                             |x| |k| |a| |b|
                                                             %))))
                                                         #16# (EXIT #8#)))
                                                       ((OR
                                                         (SPADCALL |kk| '|log|
                                                                   (QREFELT %
                                                                            44))
                                                         (OR
                                                          (SPADCALL |kk|
                                                                    '|nthRoot|
                                                                    (QREFELT %
                                                                             44))
                                                          (OR
                                                           (SPADCALL |kk| '|Ei|
                                                                     (QREFELT %
                                                                              44))
                                                           (OR
                                                            (SPADCALL |kk|
                                                                      '|Ci|
                                                                      (QREFELT
                                                                       % 44))
                                                            (OR
                                                             (SPADCALL |kk|
                                                                       '|Chi|
                                                                       (QREFELT
                                                                        % 44))
                                                             (SPADCALL |kk|
                                                                       '|dilog|
                                                                       (QREFELT
                                                                        %
                                                                        44)))))))
                                                        (SEQ
                                                         (EXIT
                                                          (SEQ
                                                           (SEQ
                                                            (LETT |w|
                                                                  (|DEFINTEF;checkForPole|
                                                                   |f| |x| |k|
                                                                   |a| |b| %))
                                                            (EXIT
                                                             (COND
                                                              ((OR
                                                                (QEQCAR |w| 1)
                                                                (QCDR |w|))
                                                               (PROGN
                                                                (LETT #9# |w|)
                                                                (GO
                                                                 #17=#:G237))))))
                                                           (EXIT
                                                            (|DEFINTEF;negat|
                                                             |f| |x| |k| |a|
                                                             |b| %))))
                                                         #17# (EXIT #9#)))
                                                       ('T
                                                        (SEQ
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|Gamma|
                                                                     (QREFELT %
                                                                              44))
                                                           (COND
                                                            ((EQL (LENGTH |ak|)
                                                                  2)
                                                             (COND
                                                              ((SPADCALL
                                                                (SPADCALL |f|
                                                                          |x|
                                                                          (QREFELT
                                                                           %
                                                                           69))
                                                                (|spadConstant|
                                                                 % 29)
                                                                (QREFELT % 70))
                                                               (EXIT
                                                                (SEQ
                                                                 (EXIT
                                                                  (SEQ
                                                                   (LETT |f2|
                                                                         (SPADCALL
                                                                          |ak|
                                                                          2
                                                                          (QREFELT
                                                                           %
                                                                           72)))
                                                                   (SEQ
                                                                    (LETT |w|
                                                                          (|DEFINTEF;checkForPole|
                                                                           |f2|
                                                                           |x|
                                                                           |k|
                                                                           |a|
                                                                           |b|
                                                                           %))
                                                                    (EXIT
                                                                     (COND
                                                                      ((OR
                                                                        (QEQCAR
                                                                         |w| 1)
                                                                        (QCDR
                                                                         |w|))
                                                                       (PROGN
                                                                        (LETT
                                                                         #10#
                                                                         |w|)
                                                                        (GO
                                                                         #18=#:G261))))))
                                                                   (EXIT
                                                                    (|DEFINTEF;negat|
                                                                     |f2| |x|
                                                                     |k| |a|
                                                                     |b| %))))
                                                                 #18#
                                                                 (EXIT
                                                                  #10#)))))))))
                                                         (COND
                                                          ((SPADCALL |kk|
                                                                     '|polylog|
                                                                     (QREFELT %
                                                                              44))
                                                           (COND
                                                            ((SPADCALL
                                                              (SPADCALL |f| |x|
                                                                        (QREFELT
                                                                         % 69))
                                                              (|spadConstant| %
                                                                              29)
                                                              (QREFELT % 70))
                                                             (EXIT
                                                              (SEQ
                                                               (EXIT
                                                                (SEQ
                                                                 (LETT |f2|
                                                                       (SPADCALL
                                                                        |ak| 2
                                                                        (QREFELT
                                                                         %
                                                                         72)))
                                                                 (SEQ
                                                                  (LETT |w|
                                                                        (|DEFINTEF;checkForPole|
                                                                         |f2|
                                                                         |x|
                                                                         |k|
                                                                         |a|
                                                                         |b|
                                                                         %))
                                                                  (EXIT
                                                                   (COND
                                                                    ((OR
                                                                      (QEQCAR
                                                                       |w| 1)
                                                                      (QCDR
                                                                       |w|))
                                                                     (PROGN
                                                                      (LETT
                                                                       #11#
                                                                       |w|)
                                                                      (GO
                                                                       #19=#:G267))))))
                                                                 (EXIT
                                                                  (|DEFINTEF;posit|
                                                                   (SPADCALL
                                                                    |f|
                                                                    (|spadConstant|
                                                                     % 49)
                                                                    (QREFELT %
                                                                             67))
                                                                   |x| |k| |a|
                                                                   |b| %))))
                                                               #19#
                                                               (EXIT
                                                                #11#)))))))
                                                         (EXIT
                                                          (CONS 1
                                                                "failed"))))))))))))))))))))))))))))
          #13# (EXIT #5#)))) 

(SDEFUN |DEFINTEF;posit|
        ((|f| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|a| (|OrderedCompletion| F)) (|b| (|OrderedCompletion| F))
         (% (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|b1| #1=(|Boolean|)) (|r| (|Union| F "failed"))
          (|z| (|Union| (|Integer|) #2="failed")) (|b2| #1#) (#3=#:G304 NIL)
          (#4=#:G316 NIL) (|w| (|Union| (|Boolean|) "failed")) (#5=#:G315 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |a| (QREFELT % 51)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT % 75)))
                         (#6='T
                          (SPADCALL |f| |x| (QCDR |r|) "right"
                                    (QREFELT % 76)))))))
            (SEQ (LETT |b1| (QEQCAR |z| 0))
                 (EXIT
                  (COND
                   (|b1|
                    (COND
                     ((>
                       (PROG2 (LETT #3# |z|)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #2#) #3#))
                       0)
                      (PROGN (LETT #4# (CONS 0 'T)) (GO #7=#:G313))))))))
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |b| (QREFELT % 51)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT % 75)))
                         (#6#
                          (SPADCALL |f| |x| (QCDR |r|) "left"
                                    (QREFELT % 76)))))))
            (SEQ (LETT |b2| (QEQCAR |z| 0))
                 (EXIT
                  (COND
                   (|b2|
                    (COND
                     ((>
                       (PROG2 (LETT #3# |z|)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #2#) #3#))
                       0)
                      (PROGN (LETT #4# (CONS 0 'T)) (GO #7#))))))))
            (COND
             (|b1|
              (COND
               (|b2|
                (EXIT
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |w|
                           (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT % 34))
                            |k| |a| |b| %))
                     (EXIT
                      (COND
                       ((OR (QEQCAR |w| 1) (QCDR |w|))
                        (PROGN (LETT #5# (CONS 1 "failed")) (GO #8=#:G312))))))
                    (EXIT (CONS 0 NIL))))
                  #8# (EXIT #5#)))))))
            (EXIT (CONS 1 "failed"))))
          #7# (EXIT #4#)))) 

(SDEFUN |DEFINTEF;negat|
        ((|f| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|a| (|OrderedCompletion| F)) (|b| (|OrderedCompletion| F))
         (% (|Union| (|Boolean|) "failed")))
        (SPROG
         ((|b1| #1=(|Boolean|)) (|r| (|Union| F "failed"))
          (|z| (|Union| (|Integer|) #2="failed")) (|b2| #1#) (#3=#:G324 NIL)
          (#4=#:G336 NIL) (|w| (|Union| (|Boolean|) "failed")) (#5=#:G335 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |a| (QREFELT % 51)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |a| (QREFELT % 75)))
                         (#6='T
                          (SPADCALL |f| |x| (QCDR |r|) "right"
                                    (QREFELT % 76)))))))
            (SEQ (LETT |b1| (QEQCAR |z| 0))
                 (EXIT
                  (COND
                   (|b1|
                    (COND
                     ((<
                       (PROG2 (LETT #3# |z|)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #2#) #3#))
                       0)
                      (PROGN (LETT #4# (CONS 0 'T)) (GO #7=#:G333))))))))
            (LETT |z|
                  (SEQ (LETT |r| (SPADCALL |b| (QREFELT % 51)))
                       (EXIT
                        (COND
                         ((QEQCAR |r| 1) (SPADCALL |f| |x| |b| (QREFELT % 75)))
                         (#6#
                          (SPADCALL |f| |x| (QCDR |r|) "left"
                                    (QREFELT % 76)))))))
            (SEQ (LETT |b2| (QEQCAR |z| 0))
                 (EXIT
                  (COND
                   (|b2|
                    (COND
                     ((<
                       (PROG2 (LETT #3# |z|)
                           (QCDR #3#)
                         (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                         (|Union| (|Integer|) #2#) #3#))
                       0)
                      (PROGN (LETT #4# (CONS 0 'T)) (GO #7#))))))))
            (COND
             (|b1|
              (COND
               (|b2|
                (EXIT
                 (SEQ
                  (EXIT
                   (SEQ
                    (SEQ
                     (LETT |w|
                           (|DEFINTEF;checkFor0| (SPADCALL |f| (QREFELT % 34))
                            |k| |a| |b| %))
                     (EXIT
                      (COND
                       ((OR (QEQCAR |w| 1) (QCDR |w|))
                        (PROGN (LETT #5# (CONS 1 "failed")) (GO #8=#:G332))))))
                    (EXIT (CONS 0 NIL))))
                  #8# (EXIT #5#)))))))
            (EXIT (CONS 1 "failed"))))
          #7# (EXIT #4#)))) 

(SDEFUN |DEFINTEF;polyIfCan|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|x| (|Kernel| F))
         (% (|Union| (|SparseUnivariatePolynomial| F) "failed")))
        (SPROG
         ((|c| (F)) (#1=#:G346 NIL) (|ans| (|SparseUnivariatePolynomial| F))
          (|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)))))
         (SEQ
          (EXIT
           (SEQ (LETT |q| (SPADCALL |p| |x| (QREFELT % 78)))
                (LETT |ans| (|spadConstant| % 79))
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL |q| (|spadConstant| % 81) (QREFELT % 82)))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |x|
                                   (SPADCALL
                                    (LETT |c|
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT % 83))
                                           (QREFELT % 84)))
                                    (QREFELT % 86))
                                   (QREFELT % 88))
                         (PROGN (LETT #1# (CONS 1 "failed")) (GO #2=#:G345)))
                        ('T
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL |c|
                                                    (SPADCALL |q|
                                                              (QREFELT % 90))
                                                    (QREFELT % 91))
                                          (QREFELT % 92)))
                          (EXIT (LETT |q| (SPADCALL |q| (QREFELT % 93)))))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 0 |ans|))))
          #2# (EXIT #1#)))) 

(SDEFUN |DEFINTEF;nopole|
        ((|f| (F)) (|x| (|Symbol|)) (|k| (|Kernel| F))
         (|a| (|OrderedCompletion| F)) (|b| (|OrderedCompletion| F))
         (%
          (|Union| (|:| |f1| (|OrderedCompletion| F))
                   (|:| |f2| (|List| (|OrderedCompletion| F)))
                   (|:| |fail| #1="failed") (|:| |pole| "potentialPole"))))
        (SPROG
         ((|u| (|Union| F (|List| F))) (|g| NIL) (#2=#:G371 NIL)
          (|v| (|Union| (|OrderedCompletion| F) "failed")) (#3=#:G370 NIL)
          (|ans| (|List| (|OrderedCompletion| F))))
         (SEQ
          (EXIT
           (SEQ (LETT |u| (SPADCALL |f| |x| (QREFELT % 96)))
                (EXIT
                 (COND
                  ((QEQCAR |u| 0)
                   (SEQ
                    (LETT |v|
                          (SPADCALL |k| (QCDR |u|) |a| |b| NIL (QREFELT % 98)))
                    (EXIT
                     (COND ((QEQCAR |v| 1) (CONS 2 #1#))
                           (#4='T (CONS 0 (QCDR |v|)))))))
                  (#4#
                   (SEQ (LETT |ans| NIL)
                        (SEQ (LETT |g| NIL) (LETT #2# (QCDR |u|)) G190
                             (COND
                              ((OR (ATOM #2#) (PROGN (LETT |g| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |v|
                                    (SPADCALL |k| |g| |a| |b| NIL
                                              (QREFELT % 98)))
                              (EXIT
                               (COND
                                ((QEQCAR |v| 1)
                                 (PROGN
                                  (LETT #3# (CONS 2 #1#))
                                  (GO #5=#:G369)))
                                ('T
                                 (LETT |ans|
                                       (SPADCALL |ans| (LIST (QCDR |v|))
                                                 (QREFELT % 100)))))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (CONS 1 |ans|))))))))
          #5# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |ElementaryFunctionDefiniteIntegration;|)) 

(DEFUN |ElementaryFunctionDefiniteIntegration;| (|#1| |#2|)
  (SPROG ((DV$1 NIL) (DV$2 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$|
                (LIST '|ElementaryFunctionDefiniteIntegration| DV$1 DV$2))
          (LETT % (GETREFV 101))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache|
                      '|ElementaryFunctionDefiniteIntegration| (LIST DV$1 DV$2)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          (COND
           ((|HasCategory| |#1| '(|ConvertibleTo| (|Pattern| (|Integer|))))
            (COND
             ((|HasCategory| |#1| '(|PatternMatchable| (|Integer|)))
              (COND
               ((|HasCategory| |#2| '(|SpecialFunctionCategory|))
                (PROGN
                 (QSETREFV % 16
                           (CONS
                            (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;1|)
                            %))))
               ('T
                (QSETREFV % 16
                          (CONS
                           (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;2|)
                           %)))))
             ('T
              (QSETREFV % 16
                        (CONS
                         (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;3|)
                         %)))))
           ('T
            (QSETREFV % 16
                      (CONS (|dispatchFunction| |DEFINTEF;innerint;FS2OcBU;4|)
                            %))))
          %))) 

(DEFUN |ElementaryFunctionDefiniteIntegration| (&REST #1=#:G372)
  (SPROG NIL
         (PROG (#2=#:G373)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionDefiniteIntegration|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function| |ElementaryFunctionDefiniteIntegration;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionDefiniteIntegration|)))))))))) 

(MAKEPROP '|ElementaryFunctionDefiniteIntegration| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| 7 '"failed") (|Symbol|) (|OrderedCompletion| 7)
              (|PatternMatchIntegration| 6 7) (0 . |pmintegrate|)
              (8 . |coerce|)
              (|Union| (|:| |f1| 10) (|:| |f2| 99) (|:| |fail| '#1="failed")
                       (|:| |pole| '#2="potentialPole"))
              (|Boolean|) (13 . |innerint|) (|SegmentBinding| 10)
              (22 . |variable|) (|Segment| 10) (27 . |segment|) (32 . |low|)
              (37 . |high|) |DEFINTEF;integrate;FSbU;5| (|String|)
              (|DefiniteIntegrationTools| 6 7) (42 . |ignore?|)
              |DEFINTEF;integrate;FSbSU;6| (47 . =) (53 . |0|) (|Kernel| 7)
              (57 . |kernel|) (|SparseMultivariatePolynomial| 6 (|Kernel| %))
              (62 . |denom|) (67 . |numer|) (|Union| 15 '"failed")
              (|SparseUnivariatePolynomial| 7) (72 . |checkForZero|)
              (|Union| (|List| %) '"failed")
              (|SparseMultivariatePolynomial| 6 30) (80 . |isTimes|)
              (|Record| (|:| |var| 30) (|:| |exponent| 89))
              (|Union| 41 '"failed") (85 . |isExpt|) (90 . |is?|)
              (|Fraction| 71) (96 . |1|) (100 . -) (105 . |1|) (109 . |1|)
              (113 . -) (118 . |retractIfCan|) (|SingleInteger|)
              (123 . |whatInfinity|) (|Union| 45 '"failed")
              (128 . |retractIfCan|) (133 . >) (139 . |isPlus|) (144 . |0|)
              (148 . +) (154 . |zero?|) (159 . =) (|BasicOperator|)
              (165 . |operator|) (170 . |nullary?|) (|List| 7)
              (175 . |argument|) (180 . -) (186 . +) (192 . D) (198 . =)
              (|Integer|) (204 . |elt|) (|Union| 71 '"failed")
              (|ElementaryFunctionSign| 6 7) (210 . |sign|) (217 . |sign|)
              (|SparseUnivariatePolynomial| %) (225 . |univariate|) (231 . |0|)
              (|SparseUnivariatePolynomial| 39) (235 . |0|) (239 . ~=)
              (245 . |leadingCoefficient|) (250 . |coerce|)
              (|List| (|Kernel| %)) (255 . |tower|) (|List| 30)
              (260 . |member?|) (|NonNegativeInteger|) (266 . |degree|)
              (271 . |monomial|) (277 . +) (283 . |reductum|) (|Union| 7 65)
              (|FunctionSpaceIntegration| 6 7) (288 . |integrate|)
              (|Union| 10 '"failed") (294 . |computeInt|) (|List| 10)
              (303 . |concat!|))
           '#(|integrate| 309 |innerint| 322) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|integrate|
                                 ((|Union|
                                   (|:| |f1| (|OrderedCompletion| |#2|))
                                   (|:| |f2|
                                        (|List| (|OrderedCompletion| |#2|)))
                                   (|:| |fail| #1#) (|:| |pole| #2#))
                                  |#2|
                                  (|SegmentBinding|
                                   (|OrderedCompletion| |#2|))))
                                T)
                              '((|integrate|
                                 ((|Union|
                                   (|:| |f1| (|OrderedCompletion| |#2|))
                                   (|:| |f2|
                                        (|List| (|OrderedCompletion| |#2|)))
                                   (|:| |fail| #1#) (|:| |pole| #2#))
                                  |#2|
                                  (|SegmentBinding| (|OrderedCompletion| |#2|))
                                  (|String|)))
                                T)
                              '((|innerint|
                                 ((|Union|
                                   (|:| |f1| (|OrderedCompletion| |#2|))
                                   (|:| |f2|
                                        (|List| (|OrderedCompletion| |#2|)))
                                   (|:| |fail| #1#) (|:| |pole| #2#))
                                  |#2| (|Symbol|) (|OrderedCompletion| |#2|)
                                  (|OrderedCompletion| |#2|) (|Boolean|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 100
                                            '(4 11 8 7 9 10 10 12 1 10 0 7 13 5
                                              0 14 7 9 10 10 15 16 1 17 9 0 18
                                              1 17 19 0 20 1 19 10 0 21 1 19 10
                                              0 22 1 25 15 24 26 2 10 15 0 0 28
                                              0 7 0 29 1 30 0 9 31 1 7 32 0 33
                                              1 7 32 0 34 4 25 35 36 10 10 15
                                              37 1 39 38 0 40 1 39 42 0 43 2 30
                                              15 0 9 44 0 45 0 46 1 10 0 0 47 0
                                              6 0 48 0 7 0 49 1 45 0 0 50 1 10
                                              8 0 51 1 10 52 0 53 1 7 54 0 55 2
                                              45 15 0 0 56 1 39 38 0 57 0 6 0
                                              58 2 6 0 0 0 59 1 6 15 0 60 2 6
                                              15 0 0 61 1 30 62 0 63 1 62 15 0
                                              64 1 30 65 0 66 2 7 0 0 0 67 2 7
                                              0 0 0 68 2 7 0 0 9 69 2 7 15 0 0
                                              70 2 65 7 0 71 72 3 74 73 7 9 10
                                              75 4 74 73 7 9 7 24 76 2 39 77 0
                                              30 78 0 36 0 79 0 80 0 81 2 80 15
                                              0 0 82 1 80 39 0 83 1 7 0 32 84 1
                                              7 85 0 86 2 87 15 30 0 88 1 80 89
                                              0 90 2 36 0 7 89 91 2 36 0 0 0 92
                                              1 80 0 0 93 2 95 94 7 9 96 5 25
                                              97 30 7 10 10 15 98 2 99 0 0 0
                                              100 3 0 14 7 17 24 27 2 0 14 7 17
                                              23 5 0 14 7 9 10 10 15 16)))))
           '|lookupComplete|)) 
