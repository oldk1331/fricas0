
(SDEFUN |GUESS;guessExpRat;LL;1| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 15))) 

(SDEFUN |GUESS;guessExpRat;LLL;2|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| |options| (QREFELT % 15))) 

(SDEFUN |GUESS;guessBinRat;LL;3| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 18))) 

(SDEFUN |GUESS;guessBinRat;LLL;4|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| |options| (QREFELT % 18))) 

(SDEFUN |GUESS;guessExpRat;SM;5|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPADCALL |q| (QREFELT % 23))) 

(SDEFUN |GUESS;guessBinRat;SM;6|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPADCALL |q| (QREFELT % 25))) 

(SDEFUN |GUESS;getVariables| ((|lF| (|List| F)) (% (|List| EXPRR)))
        (SPROG
         ((|ll| (|List| (|List| (|Symbol|)))) (|lvar| (|List| (|Symbol|))))
         (SEQ (LETT |lvar| NIL)
              (COND
               ((|HasSignature| (QREFELT % 7)
                                (LIST '|variables|
                                      (LIST (LIST '|List| '(|Symbol|))
                                            (|devaluate| (QREFELT % 7)))))
                (SEQ
                 (COND
                  ((|domainEqual| (QREFELT % 6) (QREFELT % 7))
                   (LETT |ll| (SPADCALL (ELT % 28) |lF| (QREFELT % 33))))
                  ((|domainEqual| (QREFELT % 6) (|Fraction| (QREFELT % 7)))
                   (LETT |ll|
                         (SPADCALL (CONS #'|GUESS;getVariables!0| %) |lF|
                                   (QREFELT % 40))))
                  (#1='T
                   (|error|
                    (SPADCALL "Guess: type parameter F should be either"
                              " equal to S or equal to Fraction S"
                              (QREFELT % 42)))))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT % 37) |ll| (QREFELT % 44))))))
               (#1# (LETT |lvar| NIL)))
              (EXIT (SPADCALL (ELT % 45) |lvar| (QREFELT % 48)))))) 

(SDEFUN |GUESS;getVariables!0| ((|g| NIL) (% NIL))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 35)) (QREFELT % 28))
                  (SPADCALL (SPADCALL |g| (QREFELT % 36)) (QREFELT % 28))
                  (QREFELT % 37))) 

(SDEFUN |GUESS;SUPS2SUPF|
        ((|p| (|SparseUnivariatePolynomial| S))
         (% (|SparseUnivariatePolynomial| F)))
        (COND ((|domainEqual| (QREFELT % 6) (QREFELT % 7)) |p|)
              ((|domainEqual| (QREFELT % 6) (|Fraction| (QREFELT % 7)))
               (SPADCALL (ELT % 49) |p| (QREFELT % 54)))
              ('T
               (|error|
                (SPADCALL "Guess: type parameter F should be either"
                          " equal to S or equal to Fraction S"
                          (QREFELT % 42)))))) 

(SDEFUN |GUESS;FilteredPartitionStream|
        ((|options| (|List| (|GuessOption|)))
         (% (|Stream| (|List| (|Integer|)))))
        (SPROG
         ((|homo| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|Somo| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|s1| (|Stream| (|Integer|)))
          (|s2| (|Stream| (|Stream| (|List| (|Integer|)))))
          (|s3| (|Stream| (|List| (|Integer|))))
          (|s| (|Stream| (|List| (|Integer|)))))
         (SEQ (LETT |maxP| (SPADCALL |options| (QREFELT % 57)))
              (LETT |homo| (SPADCALL |options| (QREFELT % 59)))
              (COND
               ((QEQCAR |homo| 1)
                (COND
                 ((QCDR |homo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - homogeneous should not"
                              " be true in FilteredPartitionStream"
                              (QREFELT % 42)))))))
               (#1='T (LETT |maxP| (CONS 0 (QCDR |homo|)))))
              (LETT |maxD| (SPADCALL |options| (QREFELT % 61)))
              (LETT |Somo| (SPADCALL |options| (QREFELT % 62)))
              (COND
               ((QEQCAR |Somo| 1)
                (COND
                 ((QCDR |Somo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - Somos should not be"
                              " true in FilteredPartitionStream"
                              (QREFELT % 42)))))))
               ((QEQCAR |maxD| 0)
                (LETT |maxD| (CONS 0 (MIN (QCDR |maxD|) (QCDR |Somo|)))))
               (#1# (LETT |maxD| (CONS 0 (QCDR |Somo|)))))
              (COND
               ((QEQCAR |maxD| 0)
                (COND
                 ((QEQCAR |maxP| 0)
                  (LETT |s|
                        (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|)
                                  (QREFELT % 66))))
                 (#1#
                  (SEQ (LETT |s1| (SPADCALL (ELT % 67) 1 (QREFELT % 70)))
                       (LETT |s2|
                             (COND
                              ((QEQCAR |maxD| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!0|
                                      (VECTOR % |maxD|))
                                |s1| (QREFELT % 81)))
                              ((QEQCAR |maxP| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!1|
                                      (VECTOR % |maxP|))
                                |s1| (QREFELT % 81)))
                              (#1# (SPADCALL (ELT % 82) |s1| (QREFELT % 81)))))
                       (LETT |s3| (SPADCALL |s2| (QREFELT % 84)))
                       (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT % 86))))))))
               (#1#
                (SEQ (LETT |s1| (SPADCALL (ELT % 67) 1 (QREFELT % 70)))
                     (LETT |s2|
                           (COND
                            ((QEQCAR |maxD| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!2|
                                    (VECTOR % |maxD|))
                              |s1| (QREFELT % 81)))
                            ((QEQCAR |maxP| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!3|
                                    (VECTOR % |maxP|))
                              |s1| (QREFELT % 81)))
                            (#1# (SPADCALL (ELT % 82) |s1| (QREFELT % 81)))))
                     (LETT |s3| (SPADCALL |s2| (QREFELT % 84)))
                     (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT % 86)))))))
              (LETT |s| (SPADCALL |s| (QREFELT % 87)))
              (COND
               ((QEQCAR |homo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!4|
                             (VECTOR |maxP| %))
                       |s| (QREFELT % 92)))))
              (COND
               ((QEQCAR |Somo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!5|
                             (VECTOR |Somo| %))
                       |s| (QREFELT % 92)))))
              (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG (% |Somo|)
          (LETT % (QREFELT $$ 1))
          (LETT |Somo| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT % 94) |z1| (|spadConstant| % 95) (QREFELT % 97))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT % 88))
                       (QREFELT % 76))
             (QREFELT % 98)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG (% |maxP|)
          (LETT % (QREFELT $$ 1))
          (LETT |maxP| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G151 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT % 88))
                             (PROG2 (LETT #1# |maxP|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|PositiveInteger|)
                                               (|Union| (|PositiveInteger|)
                                                        "arbitrary")
                                               #1#))
                             (QREFELT % 90))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| %)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT % 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| %)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| % 74) (QREFELT % 76)) |z1|
             |z1| (QREFELT % 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| %)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT % 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| %)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| % 74) (QREFELT % 76)) |z1|
             |z1| (QREFELT % 77)))))) 

(SDEFUN |GUESS;termAsEXPRR|
        ((|f| (EXPRR)) (|xx| (|Symbol|)) (|partition| (|List| (|Integer|)))
         (DX (|Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|)))
         (D1X (|Mapping| EXPRR (|Symbol|))) (% (EXPRR)))
        (SPROG
         ((|ll| (|List| (|List| (|Integer|)))) (#1=#:G208 NIL) (|part| NIL)
          (#2=#:G209 NIL) (#3=#:G199 NIL) (#4=#:G200 NIL)
          (|fl| (|List| EXPRR)))
         (SEQ
          (COND ((NULL |partition|) (SPADCALL |xx| D1X))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f| |xx|
                                                      (PROG1
                                                          (LETT #3#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                                      DX)
                                            (PROG1
                                                (LETT #4#
                                                      (SPADCALL |part|
                                                                (QREFELT %
                                                                         102)))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 103))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (SPADCALL (ELT % 104) |fl| (QREFELT % 106))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff|
        ((|f| (|U32Vector|)) (|partition| (|List| (|Integer|)))
         (|prime| (|Integer|)) (|degreeLoss| (|NonNegativeInteger|))
         (% (|U32Vector|)))
        (SPROG
         ((#1=#:G222 NIL) (|i| NIL) (#2=#:G223 NIL) (#3=#:G212 NIL)
          (|d| (|NonNegativeInteger|)) (|ll| (|List| (|List| (|Integer|))))
          (#4=#:G224 NIL) (|part| NIL) (#5=#:G225 NIL) (#6=#:G214 NIL)
          (#7=#:G215 NIL) (|fl| (|List| (|U32Vector|))))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| (+ |degreeLoss| 2))
                         (LETT #2# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ (EXIT (LETT #1# (CONS 0 #1#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #1#)))))
             (QREFELT % 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #3# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #5# |ll|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |part| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |f|
                                             (PROG1
                                                 (LETT #6#
                                                       (- (|SPADfirst| |part|)
                                                          1))
                                               (|check_subtype2| (>= #6# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #6#))
                                             |prime| (QREFELT % 110))
                                   (PROG1
                                       (LETT #7#
                                             (SPADCALL |part| (QREFELT % 102)))
                                     (|check_subtype2| (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #7#))
                                   |d| |prime| (QREFELT % 111))
                                  #4#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR % |prime| |d|))
               |fl| (QREFELT % 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| %)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT % 112)))))) 

(SDEFUN |GUESS;termAsU32VectorShift|
        ((|f| (|U32Vector|)) (|partition| (|List| (|Integer|)))
         (|prime| (|Integer|)) (|degreeLoss| (|NonNegativeInteger|))
         (% (|U32Vector|)))
        (SPROG
         ((#1=#:G241 NIL) (#2=#:G242 NIL) (#3=#:G228 NIL)
          (|d| (|NonNegativeInteger|)) (|ll| (|List| (|List| (|Integer|))))
          (#4=#:G243 NIL) (|part| NIL) (#5=#:G244 NIL) (#6=#:G245 NIL)
          (|j| NIL) (#7=#:G246 NIL) (#8=#:G231 NIL)
          (|fl| (|List| (|U32Vector|))) (|r| (|U32Vector|)) (|i| NIL)
          (#9=#:G247 NIL) (|e| NIL) (#10=#:G248 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (PROGN
              (LETT #1# NIL)
              (SEQ (LETT |i| (+ |degreeLoss| 1)) (LETT #2# (QV_LEN_U32 |f|))
                   G190 (COND ((> |i| #2#) (GO G191)))
                   (SEQ (EXIT (LETT #1# (CONS 1 #1#)))) (LETT |i| (+ |i| 1))
                   (GO G190) G191 (EXIT (NREVERSE #1#))))
             (QREFELT % 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #3# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #5# |ll|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |part| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (PROGN
                                    (LETT #6# NIL)
                                    (SEQ (LETT |j| (- (|SPADfirst| |part|) 1))
                                         (LETT #7#
                                               (+ (- (|SPADfirst| |part|) 1)
                                                  |d|))
                                         G190 (COND ((> |j| #7#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #6#
                                                 (CONS
                                                  (REM
                                                   (EXPT (ELT_U32 |f| |j|)
                                                         (PROG1
                                                             (LETT #8#
                                                                   (SPADCALL
                                                                    |part|
                                                                    (QREFELT %
                                                                             102)))
                                                           (|check_subtype2|
                                                            (> #8# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #8#)))
                                                   |prime|)
                                                  #6#))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT (NREVERSE #6#))))
                                   (QREFELT % 108))
                                  #4#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0))
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT % 117))
             (SEQ (LETT |i| 0) (LETT #9# |d|) G190
                  (COND ((|greater_SI| |i| #9#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL) (LETT #10# (CDR |fl|)) G190
                         (COND
                          ((OR (ATOM #10#) (PROGN (LETT |e| (CAR #10#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT_U32 |r| |i|
                                       (QSMULMOD32 (ELT_U32 |r| |i|)
                                                   (ELT_U32 |e| |i|)
                                                   |prime|))))
                         (LETT #10# (CDR #10#)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |GUESS;termAsUFPSF|
        ((|f| (|UnivariateFormalPowerSeries| F))
         (|partition| (|List| (|Integer|)))
         (DS
          (|Mapping| (|UnivariateFormalPowerSeries| F)
                     (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|)))
         (D1 (|UnivariateFormalPowerSeries| F))
         (% (|UnivariateFormalPowerSeries| F)))
        (SPROG
         ((|ll| (|List| (|List| (|Integer|)))) (#1=#:G266 NIL) (|part| NIL)
          (#2=#:G267 NIL) (#3=#:G257 NIL) (#4=#:G258 NIL)
          (|fl| (|List| (|UnivariateFormalPowerSeries| F))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #3#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                                      DS)
                                            (PROG1
                                                (LETT #4#
                                                      (SPADCALL |part|
                                                                (QREFELT %
                                                                         102)))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 119))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (SPADCALL (ELT % 120) |fl| (QREFELT % 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2|
        ((|f| (|UnivariateFormalPowerSeries| F))
         (|partition| (|List| (|Integer|)))
         (DS
          (|Mapping| (|UnivariateFormalPowerSeries| F)
                     (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|)))
         (D1 (|UnivariateFormalPowerSeries| F))
         (% (|UnivariateFormalPowerSeries| F)))
        (SPROG
         ((|ll| (|List| (|List| (|Integer|)))) (#1=#:G280 NIL) (|part| NIL)
          (#2=#:G281 NIL) (#3=#:G272 NIL)
          (|fl| (|List| (|UnivariateFormalPowerSeries| F))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSF2!0|
                                                  (VECTOR % |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #3#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                                      DS)
                                            (QREFELT % 126))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (SPADCALL (ELT % 128) |fl| (QREFELT % 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| %)
          (LETT |part| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G270 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT % 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT % 124))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2|
        ((|f|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|partition| (|List| (|Integer|)))
         (DSF
          (|Mapping|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|NonNegativeInteger|)))
         (D1F
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((|ll| (|List| (|List| (|Integer|)))) (#1=#:G294 NIL) (|part| NIL)
          (#2=#:G295 NIL) (#3=#:G285 NIL)
          (|fl|
           (|List|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))))
         (SEQ
          (COND ((NULL |partition|) D1F)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSSUPF2!0|
                                                  (VECTOR % |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #3#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #3# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #3#))
                                                      DSF)
                                            (QREFELT % 133))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (SPADCALL (ELT % 135) |fl| (QREFELT % 138))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| %)
          (LETT |part| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G283 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT % 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT % 130))))))) 

(SDEFUN |GUESS;ADEguessStream|
        ((|f| (|UnivariateFormalPowerSeries| F))
         (|partitions| (|Stream| (|List| (|Integer|))))
         (DS
          (|Mapping| (|UnivariateFormalPowerSeries| F)
                     (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|)))
         (D1 (|UnivariateFormalPowerSeries| F))
         (% (|Stream| (|UnivariateFormalPowerSeries| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR % D1 DS |f|))
                         |partitions| (QREFELT % 142)))) 

(SDEFUN |GUESS;ADEguessStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 %)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF| |f| |z1| DS D1 %))))) 

(SDEFUN |GUESS;ADEguessStream2|
        ((|f| (|UnivariateFormalPowerSeries| F))
         (|partitions| (|Stream| (|List| (|Integer|))))
         (DS
          (|Mapping| (|UnivariateFormalPowerSeries| F)
                     (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|)))
         (D1 (|UnivariateFormalPowerSeries| F))
         (% (|Stream| (|UnivariateFormalPowerSeries| F))))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEguessStream2!0| (VECTOR % D1 DS |f|))
                |partitions| (QREFELT % 142)))) 

(SDEFUN |GUESS;ADEguessStream2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 %)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF2| |f| |z1| DS D1 %))))) 

(SDEFUN |GUESS;guessModGenCached|
        ((|cache| (|PrimitiveArray| (|U32Vector|)))
         (|np| (|NonNegativeInteger|)) (|sigma| (|Integer|))
         (|addOne| (|Boolean|)) (|maxD| (|NonNegativeInteger|))
         (|prodl| (|List| (|List| (|Integer|)))) (|terml| (|List| (|Integer|)))
         (|prime| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|pp| NIL) (#1=#:G318 NIL) (#2=#:G317 NIL)
          (|nt| (|NonNegativeInteger|)) (#3=#:G308 NIL) (|res1| (|U32Vector|))
          (#4=#:G320 NIL) (#5=#:G319 NIL) (|res| (|Vector| (|U32Vector|)))
          (|r| NIL) (#6=#:G322 NIL) (|i| NIL) (#7=#:G321 NIL))
         (SEQ
          (SEQ (LETT |pp| NIL) (LETT #1# |prodl|) (LETT |i| (+ |maxD| 1))
               (LETT #2# (+ |maxD| |np|)) G190
               (COND
                ((OR (> |i| #2#) (ATOM #1#) (PROGN (LETT |pp| (CAR #1#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT % 102)))
                                      (- |sigma| 1) |prime| (QREFELT % 112)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #1# (CDR #1#)))) (GO G190) G191
               (EXIT NIL))
          (LETT |nt| (LENGTH |terml|))
          (COND
           (|addOne|
            (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (GETREFV_U32 0 0)))
                 (LETT |res1|
                       (GETREFV_U32
                        (PROG1 (LETT #3# |sigma|)
                          (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #3#))
                        0))
                 (SETELT_U32 |res1| 0 1)
                 (SPADCALL |res| 1 |res1| (QREFELT % 146))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                       (LETT #5# (+ |nt| 1)) G190
                       (COND
                        ((OR (|greater_SI| |i| #5#) (ATOM #4#)
                             (PROGN (LETT |r| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT % 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |res| (MAKEARR1 |nt| (GETREFV_U32 0 0)))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #6# |terml|) (LETT |i| 1)
                       (LETT #7# |nt|) G190
                       (COND
                        ((OR (|greater_SI| |i| #7#) (ATOM #6#)
                             (PROGN (LETT |r| (CAR #6#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT % 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #6# (CDR #6#))))
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT |res|)))) 

(SDEFUN |GUESS;DEPguessModGenCached|
        ((|fl| (|List| (|U32Vector|))) (|addOne| (|Boolean|))
         (|maxD| (|NonNegativeInteger|))
         (|prodl| (|List| (|List| (|Integer|)))) (|terml| (|List| (|Integer|)))
         (|prime| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|f| (|U32Vector|)) (|sigma| (|NonNegativeInteger|))
          (|np| (|NonNegativeInteger|))
          (|cache| (|PrimitiveArray| (|U32Vector|))) (#1=#:G329 NIL) (|i| NIL)
          (#2=#:G328 NIL))
         (SEQ
          (COND
           ((< (LENGTH |fl|) (+ |maxD| 1))
            (|error| "DEPguessModGenCached: #fl < maxD + 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (SEQ (LETT #1# |fl|) (LETT |i| 0) (LETT #2# |maxD|) G190
                      (COND
                       ((OR (|greater_SI| |i| #2#) (ATOM #1#)
                            (PROGN (LETT |f| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (QSETAREF1 |cache| |i| |f|)))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #1# (CDR #1#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| %)))))))) 

(SDEFUN |GUESS;ADEguessModGenCached|
        ((|fl| (|List| (|U32Vector|))) (|addOne| (|Boolean|))
         (|maxD| (|NonNegativeInteger|))
         (|prodl| (|List| (|List| (|Integer|)))) (|terml| (|List| (|Integer|)))
         (|prime| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|f| (|U32Vector|)) (|sigma| (|Integer|))
          (|np| (|NonNegativeInteger|))
          (|cache| (|PrimitiveArray| (|U32Vector|))) (|i| NIL) (#1=#:G335 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT % 147))
            (|error| "ADEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|))
                 (LETT |sigma| (- (QV_LEN_U32 |f|) |maxD|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (SPADCALL (QAREF1 |cache| (- |i| 1)) |prime|
                                             (QREFELT % 148)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| %)))))))) 

(SDEFUN |GUESS;ADEtestGenCached|
        ((|f|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|addOne| (|Boolean|)) (|maxD| (|NonNegativeInteger|))
         (|prodl| (|List| (|List| (|Integer|)))) (|terml| (|List| (|Integer|)))
         (DSF
          (|Mapping|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|NonNegativeInteger|)))
         (D1F
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (%
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))))
        (SPROG
         ((|np| (|NonNegativeInteger|))
          (|cache|
           (|PrimitiveArray|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#1=#:G348 NIL) (|pp| NIL) (#2=#:G350 NIL) (#3=#:G349 NIL)
          (|nt| (|NonNegativeInteger|)) (#4=#:G352 NIL) (#5=#:G351 NIL)
          (|res|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|r| NIL) (#6=#:G354 NIL) (|i| NIL) (#7=#:G353 NIL))
         (SEQ (LETT |np| (LENGTH |prodl|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| % 149)))
              (QSETAREF1 |cache| 0 |f|)
              (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| 0) |i| DSF))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |pp| NIL) (LETT #2# |prodl|) (LETT |i| (+ |maxD| 1))
                   (LETT #3# (+ |maxD| |np|)) G190
                   (COND
                    ((OR (> |i| #3#) (ATOM #2#)
                         (PROGN (LETT |pp| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                          (QAREF1 |cache|
                                                  (SPADCALL |pp|
                                                            (QREFELT % 102)))
                                          (QREFELT % 150)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|))
              (COND
               (|addOne|
                (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| % 149)))
                     (SPADCALL |res| 1 D1F (QREFELT % 152))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                           (LETT #5# (+ |nt| 1)) G190
                           (COND
                            ((OR (|greater_SI| |i| #5#) (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT % 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| % 149)))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #6# |terml|) (LETT |i| 1)
                           (LETT #7# |nt|) G190
                           (COND
                            ((OR (|greater_SI| |i| #7#) (ATOM #6#)
                                 (PROGN (LETT |r| (CAR #6#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT % 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #6# (CDR #6#))))
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT |res|)))) 

(SDEFUN |GUESS;multiplyExponents|
        ((|f| (|U32Vector|)) (|n| (|NonNegativeInteger|)) (% (|U32Vector|)))
        (SPROG
         ((|nn| (|NonNegativeInteger|)) (|f0| (|U32Vector|))
          (|deg| (|Integer|)) (|i| NIL) (#1=#:G359 NIL))
         (SEQ (LETT |nn| (QV_LEN_U32 |f|)) (LETT |f0| (GETREFV_U32 |nn| 0))
              (LETT |deg| (- |nn| 1))
              (SEQ (LETT |i| 0) (LETT #1# |deg|) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (NULL (<= (* |n| |i|) |deg|)))
                     (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f0|)))) 

(SDEFUN |GUESS;FEguessModGenCached|
        ((|fl| (|List| (|U32Vector|))) (|addOne| (|Boolean|))
         (|maxD| (|NonNegativeInteger|))
         (|prodl| (|List| (|List| (|Integer|)))) (|terml| (|List| (|Integer|)))
         (|prime| (|Integer|)) (% (|Vector| (|U32Vector|))))
        (SPROG
         ((|f| (|U32Vector|)) (|sigma| (|NonNegativeInteger|))
          (|np| (|NonNegativeInteger|))
          (|cache| (|PrimitiveArray| (|U32Vector|))) (|i| NIL) (#1=#:G365 NIL))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT % 147))
            (|error| "FEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (|GUESS;multiplyExponents|
                                    (QAREF1 |cache| 0) (+ |i| 1) %))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| %)))))))) 

(SDEFUN |GUESS;optimiseFactor|
        ((|partition| (|Partition|)) (|partitions| (|List| (|Partition|)))
         (% (|Union| (|List| (|Integer|)) "failed")))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|i| NIL) (#1=#:G391 NIL) (|p| NIL)
          (#2=#:G390 NIL) (|r| (|Union| (|Partition|) "failed"))
          (|j| (|Integer|)) (#3=#:G389 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |partitions|))
                (SEQ (LETT |i| 1) (LETT #1# |n|) (LETT |p| NIL)
                     (LETT #2# |partitions|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)
                           (|greater_SI| |i| #1#))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |partition| |p| (QREFELT % 154)))
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (SEQ
                              (LETT |j|
                                    (SPADCALL (QCDR |r|) |partitions|
                                              (QREFELT % 156)))
                              (EXIT
                               (COND
                                ((> |j| 0)
                                 (PROGN
                                  (LETT #3# (CONS 0 (LIST |i| |j|)))
                                  (GO #4=#:G388))))))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #4# (EXIT #3#)))) 

(SDEFUN |GUESS;optimiseProducts1|
        ((|p| (|Partition|))
         (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
         (|parts0| (|Reference| (|List| (|Partition|)))) (% (|Void|)))
        (SPROG
         ((|r| (|Union| (|List| (|Integer|)) "failed"))
          (|lp0| (|NonNegativeInteger|)))
         (SEQ
          (SEQ
           (LETT |r|
                 (|GUESS;optimiseFactor| |p|
                  (SPADCALL |parts0| (QREFELT % 158)) %))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT % 159))) (QREFELT % 160))
                |prods0| |parts0| %)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT % 158)) %))))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT % 158))))
                  (SPADCALL |prods0|
                            (CONS
                             (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                                   (- |lp0|
                                      (SPADCALL (QCDR |r|) (QREFELT % 102))))
                             (SPADCALL |prods0| (QREFELT % 162)))
                            (QREFELT % 163))
                  (EXIT
                   (SPADCALL |parts0|
                             (CONS |p| (SPADCALL |parts0| (QREFELT % 158)))
                             (QREFELT % 164)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| (|List| (|List| (|Integer|))))
         (%
          (|Record| (|:| |addOne| (|Boolean|))
                    (|:| |maxDiff| (|NonNegativeInteger|))
                    (|:| |prods| (|List| (|List| (|Integer|))))
                    (|:| |terms| (|List| (|Integer|))))))
        (SPROG
         ((|addOne0| (|Boolean|)) (#1=#:G413 NIL) (|maxD0| (|Integer|))
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (#2=#:G414 NIL) (|i| NIL)
          (|parts0| (|Reference| (|List| (|Partition|)))) (|p| NIL)
          (#3=#:G415 NIL) (|terms0| (|List| (|Integer|))) (#4=#:G410 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |addOne0| (NULL (|SPADfirst| |partitions|)))
                (COND
                 (|addOne0|
                  (SEQ (LETT |partitions| (CDR |partitions|))
                       (EXIT
                        (COND
                         ((NULL |partitions|)
                          (PROGN
                           (LETT #1# (VECTOR |addOne0| 0 NIL NIL))
                           (GO #5=#:G412))))))))
                (LETT |maxD0|
                      (SPADCALL (ELT % 165)
                                (SPADCALL (ELT % 166) |partitions|
                                          (QREFELT % 169))
                                (QREFELT % 170)))
                (LETT |prods0| (SPADCALL NIL (QREFELT % 171)))
                (LETT |terms0| NIL)
                (LETT |parts0|
                      (SPADCALL
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |i| |maxD0|) G190
                             (COND ((< |i| 1) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (SPADCALL (LIST |i|) (QREFELT % 160))
                                      #2#))))
                             (LETT |i| (+ |i| -1)) (GO G190) G191
                             (EXIT (NREVERSE #2#))))
                       (QREFELT % 172)))
                (SEQ (LETT |p| NIL) (LETT #3# |partitions|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |p|) 1)
                         (LETT |terms0|
                               (CONS (- (|SPADfirst| |p|) 1) |terms0|)))
                        ('T
                         (SEQ
                          (|GUESS;optimiseProducts1|
                           (SPADCALL |p| (QREFELT % 160)) |prods0| |parts0| %)
                          (EXIT
                           (LETT |terms0|
                                 (CONS
                                  (-
                                   (LENGTH (SPADCALL |parts0| (QREFELT % 158)))
                                   1)
                                  |terms0|))))))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (VECTOR |addOne0|
                         (PROG1 (LETT #4# (- |maxD0| 1))
                           (|check_subtype2| (>= #4# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #4#))
                         (NREVERSE (SPADCALL |prods0| (QREFELT % 162)))
                         (NREVERSE |terms0|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen|
        ((|partitions| (|List| (|List| (|Integer|))))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| %))
              (EXIT
               (CONS #'|GUESS;ADEguessModOptimisedGen!0| (VECTOR % |r|)))))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| %))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen|
        ((|partitions| (|List| (|List| (|Integer|))))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| %))
              (EXIT (CONS #'|GUESS;FEguessModOptimisedGen!0| (VECTOR % |r|)))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| %))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen|
        ((|partitions| (|List| (|List| (|Integer|))))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| %))
              (EXIT
               (CONS #'|GUESS;DEPguessModOptimisedGen!0| (VECTOR % |r|)))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| %))))) 

(SDEFUN |GUESS;ADEguessModGen2|
        ((|partitions| (|List| (|List| (|Integer|))))
         (|d| (|NonNegativeInteger|))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2!0|
                      (VECTOR |d| |partitions| %))))) 

(SDEFUN |GUESS;ADEguessModGen2!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (% |partitions| |d|)
          (LETT % (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f| NIL) (#1=#:G439 NIL) (|p| NIL) (#2=#:G440 NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT % 173))
                                (|spadConstant| % 174) (QREFELT % 147))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT % 175)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |p| NIL) (LETT #2# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |p| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (|GUESS;termAsU32VectorShift| |f|
                                             |p| |prime| |d| %)
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#))))
                             (QREFELT % 176)))))))))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen|
        ((|partitions| (|List| (|List| (|Integer|))))
         (DSF
          (|Mapping|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|NonNegativeInteger|)))
         (D1F
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (%
          (|Mapping|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| %))
              (EXIT
               (CONS #'|GUESS;ADEtestOptimisedGen!0| (VECTOR % D1F DSF |r|)))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|r| DSF D1F %)
          (LETT |r| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestGenCached| |f| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) DSF D1F %))))) 

(SDEFUN |GUESS;ADEtestGen2|
        ((|partitions| (|List| (|List| (|Integer|))))
         (DSF
          (|Mapping|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
           (|NonNegativeInteger|)))
         (D1F
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (%
          (|Mapping|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestGen2!0|
                      (VECTOR % D1F DSF |partitions|))))) 

(SDEFUN |GUESS;ADEtestGen2!0| ((|f| NIL) ($$ NIL))
        (PROG (|partitions| DSF D1F %)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G453 NIL) (|p| NIL) (#2=#:G454 NIL))
                   (SEQ
                    (SPADCALL
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |p| NIL) (LETT #2# |partitions|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (|GUESS;termAsUFPSSUPF2| |f| |p| DSF D1F %)
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (QREFELT % 177)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| (EXPRR)) (|xx| (|Symbol|))
         (|partitions| (|Stream| (|List| (|Integer|))))
         (DX (|Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|)))
         (D1X (|Mapping| EXPRR (|Symbol|))) (% (|Stream| EXPRR)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR % D1X DX |xx| |f|))
                |partitions| (QREFELT % 181)))) 

(SDEFUN |GUESS;ADEEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| |xx| DX D1X %)
          (LETT |f| (QREFELT $$ 4))
          (LETT |xx| (QREFELT $$ 3))
          (LETT DX (QREFELT $$ 2))
          (LETT D1X (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsEXPRR| |f| |xx| |z1| DX D1X %))))) 

(SDEFUN |GUESS;ADEdegreeStream|
        ((|partitions| (|Stream| (|List| (|Integer|))))
         (% (|Stream| (|NonNegativeInteger|))))
        (SPADCALL 0 (CONS #'|GUESS;ADEdegreeStream!0| %) |partitions|
                  (QREFELT % 188))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) (% NIL))
        (SPROG ((#1=#:G463 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT % 182)) (|spadConstant| % 95))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT % 166))
                                           (|spadConstant| % 174)
                                           (QREFELT % 183)))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                |z2| (QREFELT % 184)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| (EXPRR)) (|x| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (EXPRR)))
        (SPADCALL |expr| |x| |n| (QREFELT % 189))) 

(SDEFUN |GUESS;diffDS|
        ((|s| (|UnivariateFormalPowerSeries| F)) (|n| (|NonNegativeInteger|))
         (% (|UnivariateFormalPowerSeries| F)))
        (SPADCALL |s| |n| (QREFELT % 190))) 

(SDEFUN |GUESS;diffDSF|
        ((|s|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|n| (|NonNegativeInteger|))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (COND
         ((|HasSignature|
           (|SparseMultivariatePolynomial| (QREFELT % 6)
                                           (|NonNegativeInteger|))
           (LIST '*
                 (LIST
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT % 6)) '(|NonNegativeInteger|))
                  '(|NonNegativeInteger|)
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT % 6)) '(|NonNegativeInteger|)))))
          (SPADCALL |s| |n| (QREFELT % 191))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| (|NonNegativeInteger|)) (|x| (|Symbol|)) (|f| (EXPRR))
         (% (EXPRR)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 45)) |l| (QREFELT % 103))
                  |f| (QREFELT % 104))) 

(SDEFUN |GUESS;diffA|
        ((|k| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|f| (|SparseUnivariatePolynomial| S)) (% (S)))
        (SPADCALL |k| |l| |f| (QREFELT % 193))) 

(SDEFUN |GUESS;diffAF|
        ((|k| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|f|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (% (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |k| |l| |f| (QREFELT % 195))) 

(SDEFUN |GUESS;diffC| ((|total| (|NonNegativeInteger|)) (% (|List| S)))
        (SPADCALL |total| (QREFELT % 196))) 

(SDEFUN |GUESS;diff1X| ((|x| (|Symbol|)) (% (EXPRR))) (|spadConstant| % 197)) 

(SDEFUN |GUESS;diffHP;LR;43|
        ((|options| (|List| (|GuessOption|)))
         (%
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))))
        (SPROG
         ((|dk| (|Symbol|)) (|partitions| (|Stream| (|List| (|Integer|))))
          (|degrees| (|Stream| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT % 198))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in differential"
                       " equations" (QREFELT % 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| %))
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| %))
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;diffHP;LR;43!0| (VECTOR % |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!1| (VECTOR % |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!2| (VECTOR % |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!3| (VECTOR % |partitions|))
                       '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) %)
                       (CONS (|function| |GUESS;diffAF|) %)
                       (CONS (|function| |GUESS;diffAX|) %)
                       (CONS (|function| |GUESS;diffC|) %)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))) 

(SDEFUN |GUESS;diffHP;LR;43!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) %)
             (CONS (|function| |GUESS;diff1X|) %) %))))) 

(SDEFUN |GUESS;diffHP;LR;43!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G491 NIL) (|i| NIL) (#2=#:G492 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (CONS (|function| |GUESS;diffDSF|) %)
                     (|spadConstant| % 205) %))))))) 

(SDEFUN |GUESS;diffHP;LR;43!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             %))))) 

(SDEFUN |GUESS;diffHP;LR;43!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) %) (|spadConstant| % 200) %))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| (|List| EXPRR)) (|partition| (|List| (|Integer|))) (% (EXPRR)))
        (SPROG
         ((|ll| (|List| (|List| (|Integer|)))) (#1=#:G536 NIL) (|part| NIL)
          (#2=#:G537 NIL) (#3=#:G528 NIL) (#4=#:G529 NIL)
          (|fl| (|List| EXPRR)))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| % 197))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #1# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #1#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |fl0|
                                                      (PROG1
                                                          (LETT #3#
                                                                (|SPADfirst|
                                                                 |part|))
                                                        (|check_subtype2|
                                                         (> #3# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #3#))
                                                      (QREFELT % 218))
                                            (PROG1
                                                (LETT #4#
                                                      (SPADCALL |part|
                                                                (QREFELT %
                                                                         102)))
                                              (|check_subtype2| (>= #4# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #4#))
                                            (QREFELT % 103))
                                           #1#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #1#)))))
                      (EXIT (SPADCALL (ELT % 104) |fl| (QREFELT % 106))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| (|List| EXPRR)) (|partitions| (|Stream| (|List| (|Integer|))))
         (% (|Stream| EXPRR)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR % |fl|))
                         |partitions| (QREFELT % 181)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| %)
          (LETT |fl| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| %))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| (|Integer|)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|n1| (|NonNegativeInteger|)) (#1=#:G550 NIL) (|q| NIL)
          (#2=#:G551 NIL) (|snums| (|List| (|String|))) (#3=#:G552 NIL)
          (|i| NIL) (#4=#:G553 NIL) (|syms| (|List| (|Symbol|)))
          (#5=#:G554 NIL) (|sym| NIL) (#6=#:G555 NIL))
         (SEQ (LETT |syms| (SPADCALL |options| (QREFELT % 219)))
              (LETT |n1| (LENGTH |syms|))
              (COND
               ((> |n1| 0)
                (COND
                 ((SPADCALL |n1| |n| (QREFELT % 220))
                  (EXIT
                   (|error|
                    "numbers of sequences and names are different"))))))
              (COND
               ((EQL |n1| 0)
                (SEQ
                 (LETT |snums|
                       (PROGN
                        (LETT #1# NIL)
                        (SEQ (LETT |q| 1) (LETT #2# |n|) G190
                             (COND ((|greater_SI| |q| #2#) (GO G191)))
                             (SEQ
                              (EXIT (LETT #1# (CONS (STRINGIMAGE |q|) #1#))))
                             (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                             (EXIT (NREVERSE #1#)))))
                 (EXIT
                  (LETT |syms|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |i| NIL) (LETT #4# |snums|) G190
                              (COND
                               ((OR (ATOM #4#)
                                    (PROGN (LETT |i| (CAR #4#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (SPADCALL
                                        (STRCONC "%" (STRCONC "f" |i|))
                                        (QREFELT % 221))
                                       #3#))))
                              (LETT #4# (CDR #4#)) (GO G190) G191
                              (EXIT (NREVERSE #3#)))))))))
              (EXIT
               (PROGN
                (LETT #5# NIL)
                (SEQ (LETT |sym| NIL) (LETT #6# |syms|) G190
                     (COND
                      ((OR (ATOM #6#) (PROGN (LETT |sym| (CAR #6#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #5# (CONS (SPADCALL |sym| (QREFELT % 45)) #5#))))
                     (LETT #6# (CDR #6#)) (GO G190) G191
                     (EXIT (NREVERSE #5#)))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47|
        ((|lists| (|List| (|List| F))) (|options| (|List| (|GuessOption|)))
         (%
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))))
        (SPROG
         ((|dk| (|Symbol|)) (|partitions| (|Stream| (|List| (|Integer|))))
          (|fl| (|List| EXPRR))
          (|fakeDS|
           (|Mapping| (|UnivariateFormalPowerSeries| F)
                      (|UnivariateFormalPowerSeries| F)
                      (|NonNegativeInteger|)))
          (|fakeDSF|
           (|Mapping|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT % 198))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in algebraic"
                       " dependencies" (QREFELT % 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT % 222))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| %))
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| %))
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;47!0| (VECTOR % |lists|)))
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;47!1| (VECTOR % |lists|)))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;47!2| %) |partitions|
                          (QREFELT % 226))
                (CONS #'|GUESS;algDepHP;LLR;47!3|
                      (VECTOR % |fakeDS| |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!4| (VECTOR % |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!5|
                      (VECTOR |fakeDSF| % |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!6| (VECTOR % |partitions| |fl|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) %)
                (CONS (|function| |GUESS;diffAF|) %)
                (CONS (|function| |GUESS;diffAX|) %)
                (CONS (|function| |GUESS;diffC|) %)))))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!6| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|fl| |partitions| %)
          (LETT |fl| (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| %))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| % |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |fakeDSF| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G575 NIL) (|i| NIL) (#2=#:G576 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     |fakeDSF| (|spadConstant| % 205) %))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             %))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| %)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |fakeDS| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| % 200) %))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!2| ((|c| NIL) (% NIL)) (|spadConstant| % 95)) 

(SDEFUN |GUESS;algDepHP;LLR;47!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| %)
          (LETT |lists| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| % 174) (QREFELT % 76))
                       (QREFELT % 224))
             %))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| %)
          (LETT |lists| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| % 174) (QREFELT % 76))
                       (QREFELT % 224))
             %))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| (EXPRR)) (|x| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (EXPRR)))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT % 45))
                  (SPADCALL (SPADCALL |x| (QREFELT % 45)) (+ |n| 1)
                            (QREFELT % 103))
                  (QREFELT % 228))) 

(SDEFUN |GUESS;substDS|
        ((|s| (|UnivariateFormalPowerSeries| F)) (|n| (|NonNegativeInteger|))
         (% (|UnivariateFormalPowerSeries| F)))
        (SPROG ((#1=#:G592 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT % 229)))) 

(SDEFUN |GUESS;substDSF|
        ((|s|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|n| (|NonNegativeInteger|))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G594 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT % 230)))) 

(SDEFUN |GUESS;substHP;LR;51|
        ((|options| (|List| (|GuessOption|)))
         (%
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))))
        (SPROG
         ((|dk| (|Symbol|)) (|partitions| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT % 198))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| %))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;51!0| %) |partitions|
                          (QREFELT % 226))
                (CONS #'|GUESS;substHP;LR;51!1| (VECTOR % |partitions|))
                (CONS #'|GUESS;substHP;LR;51!2| (VECTOR % |partitions|))
                (CONS #'|GUESS;substHP;LR;51!3| (VECTOR % |partitions|))
                (CONS #'|GUESS;substHP;LR;51!4| (VECTOR % |partitions|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) %)
                (CONS (|function| |GUESS;diffAF|) %)
                (CONS (|function| |GUESS;diffAX|) %)
                (CONS (|function| |GUESS;diffC|) %)))))
            ('T (|error| "Guess: guessSubst supports only displayAsGF"))))))) 

(SDEFUN |GUESS;substHP;LR;51!4| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) %)
             (CONS (|function| |GUESS;diff1X|) %) %))))) 

(SDEFUN |GUESS;substHP;LR;51!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G612 NIL) (|i| NIL) (#2=#:G613 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (CONS (|function| |GUESS;substDSF|) %)
                     (|spadConstant| % 205) %))))))) 

(SDEFUN |GUESS;substHP;LR;51!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             %))))) 

(SDEFUN |GUESS;substHP;LR;51!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) %) (|spadConstant| % 200) %))))) 

(SDEFUN |GUESS;substHP;LR;51!0| ((|c| NIL) (% NIL)) (|spadConstant| % 95)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| (|Symbol|)) (|expr| (EXPRR)) (|x| (|Symbol|))
         (|n| (|NonNegativeInteger|)) (% (EXPRR)))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT % 45))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT % 45)) |n| (QREFELT % 103))
                   (SPADCALL |x| (QREFELT % 45)) (QREFELT % 104))
                  (QREFELT % 228))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| (|Symbol|)) (|s| (|UnivariateFormalPowerSeries| F))
         (|n| (|NonNegativeInteger|)) (% (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| % |q|)) |s|
                         (QREFELT % 235)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| % |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G634 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT % 232))
                             (PROG1
                                 (LETT #1# (SPADCALL |n| |z1| (QREFELT % 233)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT % 124))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| (|U32Vector|)) (|n| (|NonNegativeInteger|)) (|prime| (|Integer|))
         (|q| (|Integer|)) (% (|U32Vector|)))
        (SPROG
         ((|d| (|Integer|)) (#1=#:G639 NIL) (|r| (|U32Vector|))
          (|qn| (|Integer|)) (|i| NIL) (#2=#:G647 NIL) (Q (|Integer|)))
         (SEQ
          (COND ((ZEROP |n|) |f|)
                ('T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1))
                      (LETT |r|
                            (GETREFV_U32
                             (+
                              (PROG1 (LETT #1# |d|)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              1)
                             0))
                      (SETELT_U32 |r| 0 (ELT_U32 |f| 0))
                      (COND
                       ((> |d| 0)
                        (SEQ (LETT Q 1)
                             (LETT |qn| (REM (EXPT |q| |n|) |prime|))
                             (EXIT
                              (SEQ (LETT |i| 1) (LETT #2# |d|) G190
                                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                                   (SEQ (LETT Q (QSMULMOD32 |qn| Q |prime|))
                                        (EXIT
                                         (SETELT_U32 |r| |i|
                                                     (QSMULMOD32
                                                      (ELT_U32 |f| |i|) Q
                                                      |prime|))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))))))
                      (EXIT |r|))))))) 

(SDEFUN |GUESS;qDiffDSF|
        ((|q| (|Symbol|))
         (|s|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|n| (|NonNegativeInteger|))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDSF!0| (VECTOR |n| % |q|)) |s|
                         (QREFELT % 238)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| % |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G648 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT % 232)) (QREFELT % 236))
                    (PROG1 (LETT #1# (SPADCALL |n| |z1| (QREFELT % 233)))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    (QREFELT % 130))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| (|U32Vector|)) (|partition| (|List| (|Integer|)))
         (|prime| (|Integer|)) (|q| (|Integer|)) (|dl| (|NonNegativeInteger|))
         (% (|U32Vector|)))
        (SPROG
         ((#1=#:G664 NIL) (|i| NIL) (#2=#:G665 NIL) (#3=#:G654 NIL)
          (|d| (|NonNegativeInteger|)) (|ll| (|List| (|List| (|Integer|))))
          (#4=#:G666 NIL) (|part| NIL) (#5=#:G667 NIL) (#6=#:G656 NIL)
          (#7=#:G657 NIL) (|fl| (|List| (|U32Vector|))))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #1# NIL)
                    (SEQ (LETT |i| (+ |dl| 2)) (LETT #2# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ (EXIT (LETT #1# (CONS 0 #1#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #1#)))))
             (QREFELT % 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #3# (- (- (QV_LEN_U32 |f|) |dl|) 1))
                     (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #3#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT % 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #5# |ll|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |part| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (|GUESS;qDiffDSV| |f|
                                    (PROG1
                                        (LETT #6# (- (|SPADfirst| |part|) 1))
                                      (|check_subtype2| (>= #6# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #6#))
                                    |prime| |q| %)
                                   (PROG1
                                       (LETT #7#
                                             (SPADCALL |part| (QREFELT % 102)))
                                     (|check_subtype2| (> #7# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #7#))
                                   |d| |prime| (QREFELT % 111))
                                  #4#))))
                         (LETT #5# (CDR #5#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR % |prime| |d|))
               |fl| (QREFELT % 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| %)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT % 112)))))) 

(SDEFUN |GUESS;ADEguessModGenq|
        ((|partitions| (|List| (|List| (|Integer|))))
         (|d| (|NonNegativeInteger|))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGenq!0|
                      (VECTOR |d| |partitions| %))))) 

(SDEFUN |GUESS;ADEguessModGenq!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (% |partitions| |d|)
          (LETT % (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f| NIL) (#1=#:G673 NIL) (|p| NIL) (#2=#:G674 NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT % 173))
                                (|spadConstant| % 174) (QREFELT % 147))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT % 175)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #1# NIL)
                              (SEQ (LETT |p| NIL) (LETT #2# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |p| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #1#
                                           (CONS
                                            (|GUESS;termAsU32VectorqDiff| |f|
                                             |p| |prime| |q| |d| %)
                                            #1#))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT (NREVERSE #1#))))
                             (QREFELT % 176)))))))))))) 

(SDEFUN |GUESS;diffHP;SM;58|
        ((|q| (|Symbol|))
         (%
          (|Mapping|
           (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                     (|:| |guessStream|
                          (|Mapping|
                           (|Stream| (|UnivariateFormalPowerSeries| F))
                           (|UnivariateFormalPowerSeries| F)))
                     (|:| |guessModGen|
                          (|Mapping|
                           (|Mapping| (|Vector| (|U32Vector|))
                                      (|List| (|U32Vector|)) (|Integer|)
                                      (|Integer|))
                           (|NonNegativeInteger|)))
                     (|:| |testGen|
                          (|Mapping|
                           (|Mapping|
                            (|Vector|
                             (|UnivariateFormalPowerSeries|
                              (|SparseMultivariatePolynomial| F
                                                              (|NonNegativeInteger|))))
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|List| (|PositiveInteger|))))
                     (|:| |exprStream|
                          (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                     (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                     (|:| A
                          (|Mapping| S (|NonNegativeInteger|)
                                     (|NonNegativeInteger|)
                                     (|SparseUnivariatePolynomial| S)))
                     (|:| AF
                          (|Mapping|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|))
                           (|NonNegativeInteger|) (|NonNegativeInteger|)
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|)))))
                     (|:| AX
                          (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                     EXPRR))
                     (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
           (|List| (|GuessOption|)))))
        (SPROG NIL (SEQ (CONS #'|GUESS;diffHP;SM;58!8| (VECTOR |q| %))))) 

(SDEFUN |GUESS;diffHP;SM;58!8| ((|l1| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT % 198))
                                 (QREFELT % 239)))
                      (|error|
                       (SPADCALL "Guess: no support for mixed shifts in"
                                 " differential equations" (QREFELT % 42)))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT % 199)) '|displayAsGF|
                                 (QREFELT % 240))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| %))
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;58!0| %)
                                    |partitions| (QREFELT % 226))
                          (CONS #'|GUESS;diffHP;SM;58!2|
                                (VECTOR |q| % |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!3|
                                (VECTOR % |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!5|
                                (VECTOR |q| % |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!7|
                                (VECTOR |q| % |partitions|))
                          '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) %)
                          (CONS (|function| |GUESS;diffAF|) %)
                          (CONS (|function| |GUESS;diffAX|) %)
                          (CONS (|function| |GUESS;diffC|) %)))))
                      ('T
                       (|error|
                        "Guess: guessADE supports only displayAsGF")))))))))) 

(SDEFUN |GUESS;diffHP;SM;58!7| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| % |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!6| (VECTOR % |q|))
                    (CONS (|function| |GUESS;diff1X|) %) %)))))) 

(SDEFUN |GUESS;diffHP;SM;58!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| %))))) 

(SDEFUN |GUESS;diffHP;SM;58!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| % |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G690 NIL) (|i| NIL) (#2=#:G691 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (CONS #'|GUESS;diffHP;SM;58!4| (VECTOR % |q|))
                     (|spadConstant| % 205) %))))))) 

(SDEFUN |GUESS;diffHP;SM;58!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| %))))) 

(SDEFUN |GUESS;diffHP;SM;58!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             (|spadConstant| % 95) %))))) 

(SDEFUN |GUESS;diffHP;SM;58!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| % |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!1| (VECTOR % |q|))
                    (|spadConstant| % 200) %)))))) 

(SDEFUN |GUESS;diffHP;SM;58!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| %))))) 

(SDEFUN |GUESS;diffHP;SM;58!0| ((|c| NIL) (% NIL)) (|spadConstant| % 95)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| (EXPRR)) (|x| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (EXPRR)))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT % 45))
                  (SPADCALL (SPADCALL |x| (QREFELT % 45))
                            (SPADCALL |n| (QREFELT % 243)) (QREFELT % 93))
                  (QREFELT % 228))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| (EXPRR)) (|x| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (% (EXPRR)))
        (SPROG ((#1=#:G718 NIL) (|i| NIL) (#2=#:G719 NIL) (|l| (|List| EXPRR)))
               (SEQ
                (COND ((ZEROP |n|) |expr|)
                      ('T
                       (SEQ
                        (LETT |l|
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |i| 0) (LETT #2# (- |n| 1)) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |expr| |x| |i|
                                                          (QREFELT % 189))
                                                (SPADCALL
                                                 (SPADCALL |i| (QREFELT % 244))
                                                 (QREFELT % 243))
                                                (QREFELT % 245))
                                               (SPADCALL |x| (QREFELT % 45))
                                               (|spadConstant| % 246)
                                               (QREFELT % 228))
                                              (SPADCALL
                                               (SPADCALL |x| (QREFELT % 45))
                                               |i| (QREFELT % 103))
                                              (QREFELT % 104))
                                             #1#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #1#)))))
                        (EXIT
                         (SPADCALL
                          (SPADCALL |expr|
                                    (SPADCALL (ELT % 93) |l| (QREFELT % 106))
                                    (QREFELT % 247))
                          (SPADCALL (SPADCALL |x| (QREFELT % 45)) |n|
                                    (QREFELT % 103))
                          (QREFELT % 245))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| (|UnivariateFormalPowerSeries| F)) (|n| (|NonNegativeInteger|))
         (% (|UnivariateFormalPowerSeries| F)))
        (SPADCALL |s| (SPADCALL (ELT % 248) |n| (QREFELT % 251)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (|n| (|NonNegativeInteger|))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPADCALL |s| (SPADCALL (ELT % 252) |n| (QREFELT % 255)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| (|NonNegativeInteger|)) (|n| (|Symbol|)) (|f| (EXPRR))
         (% (EXPRR)))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT % 45)) |l| (QREFELT % 103))
                  |f| (QREFELT % 104))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| (|NonNegativeInteger|)) (|x| (|Symbol|)) (|f| (EXPRR))
         (% (EXPRR)))
        (SPROG ((#1=#:G732 NIL) (|i| NIL) (#2=#:G733 NIL) (|s| (|List| EXPRR)))
               (SEQ
                (COND ((ZEROP |l|) |f|)
                      ('T
                       (SEQ
                        (LETT |s|
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |i| 1) (LETT #2# |l|) G190
                                    (COND ((|greater_SI| |i| #2#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT #1#
                                            (CONS
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |l| |i|
                                                          (QREFELT % 257))
                                                (QREFELT % 243))
                                               (SPADCALL
                                                (SPADCALL |x| (QREFELT % 45))
                                                |i| (QREFELT % 103))
                                               (QREFELT % 104))
                                              (SPADCALL |f| |x| |i|
                                                        (QREFELT % 189))
                                              (QREFELT % 104))
                                             #1#))))
                                    (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                    (EXIT (NREVERSE #1#)))))
                        (EXIT (SPADCALL (ELT % 93) |s| (QREFELT % 106))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|f| (|SparseUnivariatePolynomial| S)) (% (S)))
        (SPADCALL |k| |l| |f| (QREFELT % 258))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|f|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (% (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |k| |l| |f| (QREFELT % 259))) 

(SDEFUN |GUESS;ShiftC| ((|total| (|NonNegativeInteger|)) (% (|List| S)))
        (SPADCALL |total| (QREFELT % 260))) 

(SDEFUN |GUESS;shiftHP;LR;68|
        ((|options| (|List| (|GuessOption|)))
         (%
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))))
        (SPROG
         ((|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|))
          (|degrees| (|Stream| (|NonNegativeInteger|))) (#1=#:G740 NIL)
          (|x_inv1| (|UnivariateFormalPowerSeries| F)) (#2=#:G743 NIL)
          (|x_inv2|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT % 198))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| %))
          (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT % 222))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| %))
                  (LETT |x_inv1|
                        (PROG2
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 200)
                                             (SPADCALL (|spadConstant| % 71) 1
                                                       (QREFELT % 262))
                                             (QREFELT % 263))
                                   (QREFELT % 264)))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0)
                                          (|UnivariateFormalPowerSeries|
                                           (QREFELT % 6))
                                          (|Union|
                                           (|UnivariateFormalPowerSeries|
                                            (QREFELT % 6))
                                           #3="failed")
                                          #1#)))
                  (LETT |x_inv2|
                        (PROG2
                            (LETT #2#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 205)
                                             (SPADCALL (|spadConstant| % 265) 1
                                                       (QREFELT % 266))
                                             (QREFELT % 267))
                                   (QREFELT % 268)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial|
                                            (QREFELT % 6)
                                            (|NonNegativeInteger|)))
                                          (|Union|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial|
                                             (QREFELT % 6)
                                             (|NonNegativeInteger|)))
                                           #3#)
                                          #2#)))
                  (EXIT
                   (VECTOR |degrees|
                           (CONS #'|GUESS;shiftHP;LR;68!0|
                                 (VECTOR |x_inv1| % |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!1|
                                 (VECTOR |degrees| % |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!2|
                                 (VECTOR |x_inv2| % |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!3|
                                 (VECTOR % |partitions|))
                           '|shiftHP| '|dummy|
                           (CONS (|function| |GUESS;ShiftA|) %)
                           (CONS (|function| |GUESS;ShiftAF|) %)
                           (CONS (|function| |GUESS;ShiftAX|) %)
                           (CONS (|function| |GUESS;ShiftC|) %)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) %)
             (CONS (|function| |GUESS;diff1X|) %) %))))) 

(SDEFUN |GUESS;shiftHP;LR;68!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| % |x_inv2|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x_inv2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G758 NIL) (|i| NIL) (#2=#:G759 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (CONS (|function| |GUESS;ShiftSF|) %) |x_inv2| %))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| % |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             (SPADCALL |degrees| |o| (QREFELT % 269)) %))))) 

(SDEFUN |GUESS;shiftHP;LR;68!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| % |x_inv1|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x_inv1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) %) |x_inv1| %))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| (|Symbol|)) (|l| (|NonNegativeInteger|)) (|n| (|Symbol|))
         (|f| (EXPRR)) (% (EXPRR)))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT % 45))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT % 45)) (QREFELT % 271))
                   (QREFELT % 272))
         |f| (QREFELT % 104))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| (|Symbol|)) (|k| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|f| (|SparseUnivariatePolynomial| S))
         (% (S)))
        (SPADCALL (SPADCALL |q| (QREFELT % 273)) |k| |l| |f| (QREFELT % 274))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| (|Symbol|)) (|k| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|))
         (|f|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
         (% (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 232)) (QREFELT % 236)) |k|
                  |l| |f| (QREFELT % 275))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| (|Symbol|)) (|total| (|NonNegativeInteger|)) (% (|List| S)))
        (SPADCALL (SPADCALL |q| (QREFELT % 273)) |total| (QREFELT % 276))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| (|Symbol|)) (|s| (|UnivariateFormalPowerSeries| F))
         (|maxMD| (|NonNegativeInteger|))
         (% (|List| (|UnivariateFormalPowerSeries| F))))
        (SPROG ((#1=#:G785 NIL) (|i| NIL) (#2=#:G786 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0) (LETT #2# |maxMD|) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT % 232)) |i|
                                           (QREFELT % 124))
                                          (SPADCALL (|spadConstant| % 71) 1
                                                    (QREFELT % 262))
                                          (QREFELT % 277))
                                         (QREFELT % 278))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| (|Symbol|)) (|xx| (|Symbol|)) (|s| (EXPRR))
         (|maxMD| (|NonNegativeInteger|)) (% (|List| EXPRR)))
        (SPROG ((#1=#:G790 NIL) (|i| NIL) (#2=#:G791 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |i| 0) (LETT #2# |maxMD|) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT % 45))
                                          (SPADCALL |i|
                                                    (SPADCALL |xx|
                                                              (QREFELT % 45))
                                                    (QREFELT % 271))
                                          (QREFELT % 272))
                                |s| (QREFELT % 104))
                               #1#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift|
        ((|q| (|Symbol|)) (|f| (|UnivariateFormalPowerSeries| F))
         (|partitions| (|Stream| (|List| (|Integer|))))
         (|maxMD| (|NonNegativeInteger|))
         (% (|Stream| (|UnivariateFormalPowerSeries| F))))
        (SPROG
         ((#1=#:G793 NIL) (|x_inv1| (|UnivariateFormalPowerSeries| F))
          (|s| (|Stream| (|UnivariateFormalPowerSeries| F))))
         (SEQ
          (LETT |x_inv1|
                (PROG2
                    (LETT #1#
                          (SPADCALL
                           (SPADCALL (|spadConstant| % 200)
                                     (SPADCALL (|spadConstant| % 71) 1
                                               (QREFELT % 262))
                                     (QREFELT % 263))
                           (QREFELT % 264)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0)
                                  (|UnivariateFormalPowerSeries| (QREFELT % 6))
                                  (|Union|
                                   (|UnivariateFormalPowerSeries|
                                    (QREFELT % 6))
                                   "failed")
                                  #1#)))
          (LETT |s|
                (|GUESS;ADEguessStream2| |f| |partitions|
                 (CONS (|function| |GUESS;ShiftSS|) %) |x_inv1| %))
          (EXIT
           (SPADCALL |s|
                     (CONS #'|GUESS;ADEguessStreamMixShift!0|
                           (VECTOR % |maxMD| |q|))
                     (QREFELT % 281)))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |maxMD| %)
          (LETT |q| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstUFPSF| |q| |z1| |maxMD| %))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed|
        ((|partitions| (|Stream| (|List| (|Integer|))))
         (|dl| (|NonNegativeInteger|)) (|maxMD| (|NonNegativeInteger|))
         (|o| (|NonNegativeInteger|))
         (%
          (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                     (|Integer|) (|Integer|))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2Mixed!0|
                      (VECTOR |partitions| |maxMD| |o| |dl| %))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (% |dl| |o| |maxMD| |partitions|)
          (LETT % (QREFELT $$ 4))
          (LETT |dl| (QREFELT $$ 3))
          (LETT |o| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT |partitions| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|f| NIL) (#1=#:G801 NIL) (|d| NIL) (|qv| NIL) (#2=#:G824 NIL)
              (#3=#:G804 NIL) (O NIL) (#4=#:G825 NIL) (|p| NIL) (#5=#:G826 NIL)
              (|vv1| NIL) (|w| NIL) (#6=#:G828 NIL) (|v| NIL) (#7=#:G827 NIL)
              (|lastv| NIL) (#8=#:G829 NIL) (#9=#:G830 NIL) (|r| NIL) (|i| NIL)
              (#10=#:G831 NIL) (|vn| NIL) (|e| NIL) (#11=#:G832 NIL) (|vv| NIL)
              (|l| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT % 173))
                          (|spadConstant| % 174) (QREFELT % 147))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT % 175)))
                     (LETT |d|
                           (PROG1
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT % 282))
                                                |dl| (QREFELT % 183))
                                      (|spadConstant| % 174) (QREFELT % 183)))
                             (|check_subtype2| (>= #1# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #1#)))
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| % 174)
                                      (QREFELT % 76))
                            (|spadConstant| % 174) (QREFELT % 283)))
                     (SEQ (LETT |i| (|spadConstant| % 174)) (LETT #2# |d|) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT % 286))
                                       |prime| (QREFELT % 287))
                                      (QREFELT % 288))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #3#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| %
                                                                          174)
                                                          (QREFELT % 76))
                                                (QREFELT % 290))
                                      (QREFELT % 291)))
                             (|check_subtype2| (>= #3# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #3#)))
                     (LETT |vv1|
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |p| NIL)
                                 (LETT #5#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |partitions| O
                                                   (QREFELT % 201))
                                         (QREFELT % 202))
                                        (QREFELT % 203)))
                                 G190
                                 (COND
                                  ((OR (ATOM #5#)
                                       (PROGN (LETT |p| (CAR #5#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (|GUESS;termAsU32VectorShift| |f| |p|
                                           |prime| |dl| %)
                                          #4#))))
                                 (LETT #5# (CDR #5#)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))
                     (LETT |l| NIL)
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT % 175)))
                     (SEQ (LETT |w| NIL)
                          (LETT #6# (SPADCALL |vv1| (QREFELT % 292)))
                          (LETT |v| NIL) (LETT #7# |vv1|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |v| (CAR #7#)) NIL)
                                (ATOM #6#) (PROGN (LETT |w| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w|) (LETT |vv| (LIST |v|))
                               (LETT |vn| |v|)
                               (SEQ (LETT |i| (|spadConstant| % 174))
                                    (LETT #8# |maxMD|) G190
                                    (COND ((> |i| #8#) (GO G191)))
                                    (SEQ
                                     (LETT |vn|
                                           (SPADCALL |vn| (QREFELT % 293)))
                                     (SEQ (LETT |e| (|spadConstant| % 174))
                                          (LETT #9# |d|) G190
                                          (COND ((> |e| #9#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT %
                                                                          294))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT %
                                                                          294))
                                                       |prime|)
                                                      (QREFELT % 288))))
                                          (LETT |e| (+ |e| 1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT % 295)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT % 296))
                                        (QREFELT % 176))
                                       |l| (QREFELT % 298)))))
                          (LETT #7# (PROG1 (CDR #7#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|)) (LETT |vn| |lastv|)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| % 174)
                                                (QREFELT % 76))
                                      (QREFELT % 299))
                            (|spadConstant| % 174) (QREFELT % 183)))
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| % 285)
                                           (QREFELT % 300))
                                 (QREFELT % 98))
                       (LETT |r| |maxMD|)))
                     (SEQ (LETT |i| (|spadConstant| % 174)) (LETT #10# |r|)
                          G190 (COND ((> |i| #10#) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT % 293)))
                               (SEQ (LETT |e| (|spadConstant| % 174))
                                    (LETT #11# |d|) G190
                                    (COND ((> |e| #11#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT % 294))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT % 294))
                                                 |prime|)
                                                (QREFELT % 288))))
                                    (LETT |e| (+ |e| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv|
                                      (SPADCALL |vn| |vv| (QREFELT % 295)))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT % 296))
                                      (QREFELT % 176))
                            |l| (QREFELT % 298)))
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT % 301))
                                (QREFELT % 303)))))))))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift|
        ((|partitions| (|Stream| (|List| (|Integer|))))
         (|maxMD| (|NonNegativeInteger|))
         (% (|Stream| (|NonNegativeInteger|))))
        (SPROG ((|s| (|Stream| (|NonNegativeInteger|))))
               (SEQ (LETT |s| (|GUESS;ADEdegreeStream| |partitions| %))
                    (EXIT
                     (SPADCALL |s|
                               (CONS #'|GUESS;ADEdegreeStreamMixShift!0|
                                     (VECTOR |maxMD| %))
                               (QREFELT % 307)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (% |maxMD|)
          (LETT % (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G837 NIL) (|i| NIL) (#2=#:G838 NIL))
                   (SEQ
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |i| (|spadConstant| % 95)) (LETT #2# |maxMD|)
                          G190 (COND ((> |i| #2#) (GO G191)))
                          (SEQ (EXIT (LETT #1# (CONS |z1| #1#))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT (NREVERSE #1#)))))))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen|
        ((|q| (|Symbol|)) (|partitions| (|Stream| (|List| (|Integer|))))
         (|maxMD| (|NonNegativeInteger|)) (|l| (|List| (|PositiveInteger|)))
         (%
          (|Mapping|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestMixShiftGen!0|
                      (VECTOR |q| |partitions| (QREFELT % 6) |maxMD| % |l|))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|l| % |maxMD| F |partitions| |q|)
          (LETT |l| (QREFELT $$ 5))
          (LETT % (QREFELT $$ 4))
          (LETT |maxMD| (QREFELT $$ 3))
          (LETT F (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((#1=#:G842 NIL) (#2=#:G844 NIL) (|x_inv2| NIL) (|p| NIL)
              (#3=#:G868 NIL) (#4=#:G847 NIL) (|newPartition| NIL)
              (#5=#:G869 NIL) (#6=#:G870 NIL) (|oldPartition| NIL)
              (#7=#:G856 NIL) (|exponents| NIL) (|f0| NIL) (#8=#:G871 NIL)
              (|i| NIL) (#9=#:G872 NIL) (|res| NIL))
             (SEQ (LETT |res| NIL) (LETT |exponents| NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #1#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT % 309))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| % 74)
                                                       (QREFELT % 76))
                                             (QREFELT % 290))
                                   (QREFELT % 291)))
                          (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                            '(|Integer|) #1#)))
                  (LETT |x_inv2|
                        (PROG2
                            (LETT #2#
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| % 205)
                                             (SPADCALL (|spadConstant| % 265)
                                                       (|spadConstant| % 74)
                                                       (QREFELT % 266))
                                             (QREFELT % 267))
                                   (QREFELT % 268)))
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0)
                                          (|UnivariateFormalPowerSeries|
                                           (|SparseMultivariatePolynomial| F
                                                                           (|NonNegativeInteger|)))
                                          (|Union|
                                           (|UnivariateFormalPowerSeries|
                                            (|SparseMultivariatePolynomial| F
                                                                            (|NonNegativeInteger|)))
                                           "failed")
                                          #2#)))
                  (SEQ (LETT |p| NIL) (LETT #3# |l|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newPartition|
                              (PROG1
                                  (LETT #4#
                                        (SPADCALL
                                         (SPADCALL |p|
                                                   (SPADCALL |maxMD|
                                                             (|spadConstant| %
                                                                             74)
                                                             (QREFELT % 76))
                                                   (QREFELT % 290))
                                         (QREFELT % 291)))
                                (|check_subtype2| (> #4# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #4#)))
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT % 310))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT % 204))
                                  (CONS (|function| |GUESS;ShiftSF|) %)
                                  |x_inv2| %))
                           (LETT |res|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |i| NIL) (LETT #6# |exponents|)
                                        G190
                                        (COND
                                         ((OR (ATOM #6#)
                                              (PROGN (LETT |i| (CAR #6#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |f0|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |q|
                                                                        (QREFELT
                                                                         %
                                                                         232))
                                                              |i|
                                                              (QREFELT % 124))
                                                             (QREFELT % 236))
                                                            (SPADCALL
                                                             (|spadConstant| %
                                                                             265)
                                                             (|spadConstant| %
                                                                             74)
                                                             (QREFELT % 266))
                                                            (QREFELT % 311))
                                                           (QREFELT % 312))
                                                 #5#))))
                                        (LETT #6# (CDR #6#)) (GO G190) G191
                                        (EXIT (NREVERSE #5#))))
                                  |res| (QREFELT % 313)))
                           (LETT |exponents| NIL)
                           (EXIT (LETT |oldPartition| |newPartition|)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #7#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| % 74)
                                                     (QREFELT % 183))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| % 74)
                                                     (QREFELT % 76))
                                           (QREFELT % 287)))
                                  (|check_subtype2| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #7#))
                                |exponents| (QREFELT % 315)))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT % 204))
                         (CONS (|function| |GUESS;ShiftSF|) %) |x_inv2| %))
                  (LETT |res|
                        (SPADCALL
                         (PROGN
                          (LETT #8# NIL)
                          (SEQ (LETT |i| NIL) (LETT #9# |exponents|) G190
                               (COND
                                ((OR (ATOM #9#)
                                     (PROGN (LETT |i| (CAR #9#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #8#
                                       (CONS
                                        (SPADCALL |f0|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |q|
                                                               (QREFELT % 232))
                                                     |i| (QREFELT % 124))
                                                    (QREFELT % 236))
                                                   (SPADCALL
                                                    (|spadConstant| % 265)
                                                    (|spadConstant| % 74)
                                                    (QREFELT % 266))
                                                   (QREFELT % 311))
                                                  (QREFELT % 312))
                                        #8#))))
                               (LETT #9# (CDR #9#)) (GO G190) G191
                               (EXIT (NREVERSE #8#))))
                         |res| (QREFELT % 313)))
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT % 316))
                             (QREFELT % 177))))))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift|
        ((|q| (|Symbol|)) (|f| (EXPRR)) (|xx| (|Symbol|))
         (|partitions| (|Stream| (|List| (|Integer|))))
         (|maxMD| (|NonNegativeInteger|)) (% (|Stream| EXPRR)))
        (SPROG ((|s| (|Stream| EXPRR)))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEEXPRRStream| |f| |xx| |partitions|
                       (CONS (|function| |GUESS;ShiftSX|) %)
                       (CONS (|function| |GUESS;diff1X|) %) %))
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEEXPRRStreamMixShift!0|
                                 (VECTOR % |maxMD| |xx| |q|))
                           (QREFELT % 319)))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |xx| |maxMD| %)
          (LETT |q| (QREFELT $$ 3))
          (LETT |xx| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstEXPRR| |q| |xx| |z1| |maxMD| %))))) 

(SDEFUN |GUESS;shift_hp_aux|
        ((|q| (|Symbol|)) (|l1| (|List| (|GuessOption|)))
         (%
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))))
        (SPROG
         ((|partitions| (|Stream| (|List| (|Integer|))))
          (|maxMD| (|NonNegativeInteger|)) (#1=#:G884 NIL)
          (|x_inv1| (|UnivariateFormalPowerSeries| F)) (#2=#:G887 NIL)
          (|x_inv2|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|degrees| (|Stream| (|NonNegativeInteger|))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |l1| (QREFELT % 199)) '|displayAsRec|
                      (QREFELT % 222))
            (|error|
             (SPADCALL "Guess: no support for the qShift operator"
                       " with displayAsGF" (QREFELT % 42))))
           (#3='T
            (SEQ (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| %))
                 (LETT |maxMD| (SPADCALL |l1| (QREFELT % 198)))
                 (EXIT
                  (COND
                   ((ZEROP |maxMD|)
                    (SEQ
                     (LETT |x_inv1|
                           (PROG2
                               (LETT #1#
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 200)
                                                (SPADCALL (|spadConstant| % 71)
                                                          1 (QREFELT % 262))
                                                (QREFELT % 263))
                                      (QREFELT % 264)))
                               (QCDR #1#)
                             (|check_union2| (QEQCAR #1# 0)
                                             (|UnivariateFormalPowerSeries|
                                              (QREFELT % 6))
                                             (|Union|
                                              (|UnivariateFormalPowerSeries|
                                               (QREFELT % 6))
                                              #4="failed")
                                             #1#)))
                     (LETT |x_inv2|
                           (PROG2
                               (LETT #2#
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 205)
                                                (SPADCALL
                                                 (|spadConstant| % 265) 1
                                                 (QREFELT % 266))
                                                (QREFELT % 267))
                                      (QREFELT % 268)))
                               (QCDR #2#)
                             (|check_union2| (QEQCAR #2# 0)
                                             (|UnivariateFormalPowerSeries|
                                              (|SparseMultivariatePolynomial|
                                               (QREFELT % 6)
                                               (|NonNegativeInteger|)))
                                             (|Union|
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                (QREFELT % 6)
                                                (|NonNegativeInteger|)))
                                              #4#)
                                             #2#)))
                     (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| %))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!0|
                                    (VECTOR |x_inv1| % |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!1|
                                    (VECTOR |degrees| % |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!2|
                                    (VECTOR |x_inv2| % |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!3|
                                    (VECTOR % |partitions|))
                              '|qshiftHP| |q|
                              (CONS #'|GUESS;shift_hp_aux!4| (VECTOR % |q|))
                              (CONS #'|GUESS;shift_hp_aux!5| (VECTOR % |q|))
                              (CONS #'|GUESS;shift_hp_aux!6| (VECTOR % |q|))
                              (CONS #'|GUESS;shift_hp_aux!7|
                                    (VECTOR % |q|))))))
                   (#3#
                    (SEQ
                     (LETT |degrees|
                           (|GUESS;ADEdegreeStreamMixShift| |partitions|
                            |maxMD| %))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!8|
                                    (VECTOR % |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!9|
                                    (VECTOR |maxMD| % |degrees| |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!10|
                                    (VECTOR % |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!11|
                                    (VECTOR % |maxMD| |partitions| |q|))
                              '|qmixed| |q|
                              (CONS (|function| |GUESS;ShiftA|) %)
                              (CONS (|function| |GUESS;ShiftAF|) %)
                              (CONS (|function| |GUESS;ShiftAX|) %)
                              (CONS (|function| |GUESS;ShiftC|) %))))))))))))) 

(SDEFUN |GUESS;shift_hp_aux!11| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| %)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD|
             %))))) 

(SDEFUN |GUESS;shift_hp_aux!10| ((|l| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| %)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| %))))) 

(SDEFUN |GUESS;shift_hp_aux!9| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| |degrees| % |maxMD|)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT |degrees| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2Mixed| |partitions|
             (SPADCALL |degrees| |o| (QREFELT % 269)) |maxMD| |o| %))))) 

(SDEFUN |GUESS;shift_hp_aux!8| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| %)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| %))))) 

(SDEFUN |GUESS;shift_hp_aux!7| ((|z1| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| %))))) 

(SDEFUN |GUESS;shift_hp_aux!6| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| %))))) 

(SDEFUN |GUESS;shift_hp_aux!5| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| %))))) 

(SDEFUN |GUESS;shift_hp_aux!4| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| %))))) 

(SDEFUN |GUESS;shift_hp_aux!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| %)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) %)
             (CONS (|function| |GUESS;diff1X|) %) %))))) 

(SDEFUN |GUESS;shift_hp_aux!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| % |x_inv2|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x_inv2| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G902 NIL) (|i| NIL) (#2=#:G903 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #1# NIL)
                      (SEQ (LETT |i| NIL) (LETT #2# |l|) G190
                           (COND
                            ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #1#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT % 204))
                                    #1#))))
                           (LETT #2# (CDR #2#)) (GO G190) G191
                           (EXIT (NREVERSE #1#))))
                     (CONS (|function| |GUESS;ShiftSF|) %) |x_inv2| %))))))) 

(SDEFUN |GUESS;shift_hp_aux!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| % |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT % 201))
                        (QREFELT % 202))
              (QREFELT % 203))
             (SPADCALL |degrees| |o| (QREFELT % 269)) %))))) 

(SDEFUN |GUESS;shift_hp_aux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| % |x_inv1|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT % (QREFELT $$ 1))
          (LETT |x_inv1| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) %) |x_inv1| %))))) 

(SDEFUN |GUESS;shiftHP;SM;81|
        ((|q| (|Symbol|))
         (%
          (|Mapping|
           (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                     (|:| |guessStream|
                          (|Mapping|
                           (|Stream| (|UnivariateFormalPowerSeries| F))
                           (|UnivariateFormalPowerSeries| F)))
                     (|:| |guessModGen|
                          (|Mapping|
                           (|Mapping| (|Vector| (|U32Vector|))
                                      (|List| (|U32Vector|)) (|Integer|)
                                      (|Integer|))
                           (|NonNegativeInteger|)))
                     (|:| |testGen|
                          (|Mapping|
                           (|Mapping|
                            (|Vector|
                             (|UnivariateFormalPowerSeries|
                              (|SparseMultivariatePolynomial| F
                                                              (|NonNegativeInteger|))))
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|List| (|PositiveInteger|))))
                     (|:| |exprStream|
                          (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                     (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                     (|:| A
                          (|Mapping| S (|NonNegativeInteger|)
                                     (|NonNegativeInteger|)
                                     (|SparseUnivariatePolynomial| S)))
                     (|:| AF
                          (|Mapping|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|))
                           (|NonNegativeInteger|) (|NonNegativeInteger|)
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|)))))
                     (|:| AX
                          (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                     EXPRR))
                     (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
           (|List| (|GuessOption|)))))
        (SPROG NIL (CONS #'|GUESS;shiftHP;SM;81!0| (VECTOR % |q|)))) 

(SDEFUN |GUESS;shiftHP;SM;81!0| ((|l1| NIL) ($$ NIL))
        (PROG (|q| %)
          (LETT |q| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;shift_hp_aux| |q| |l1| %))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
         (|x| (|Symbol|)) (|p| (|SparseUnivariatePolynomial| F))
         (|expr| (EXPRR)) (% (EXPRR)))
        (COND ((SPADCALL |p| (QREFELT % 321)) (|spadConstant| % 246))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT % 322)) (QREFELT % 10))
                 (SPADCALL (SPADCALL |p| (QREFELT % 323)) |x| |expr| DAX)
                 (QREFELT % 104))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT % 324))
                 |expr| %)
                (QREFELT % 93))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| (|List| F)) (% (|UnivariateFormalPowerSeries| F)))
        (SPADCALL (SPADCALL |list| (QREFELT % 326)) (QREFELT % 327))) 

(SDEFUN |GUESS;list2UFPSSUPF|
        ((|list| (|List| F))
         (%
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G952 NIL) (|e| NIL) (#2=#:G953 NIL)
          (|l1|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|s1| (|Stream| (|Integer|)))
          (|l2|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
         (SEQ
          (LETT |l1|
                (SPADCALL
                 (PROGN
                  (LETT #1# NIL)
                  (SEQ (LETT |e| NIL) (LETT #2# |list|) G190
                       (COND
                        ((OR (ATOM #2#) (PROGN (LETT |e| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #1# (CONS (SPADCALL |e| (QREFELT % 236)) #1#))))
                       (LETT #2# (CDR #2#)) (GO G190) G191
                       (EXIT (NREVERSE #1#))))
                 (QREFELT % 330)))
          (LETT |s1| (SPADCALL (ELT % 67) 0 (QREFELT % 70)))
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| %) |s1|
                          (QREFELT % 335)))
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT % 336)) (QREFELT % 337)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) (% NIL))
        (SPROG ((#1=#:G948 NIL))
               (SPADCALL (|spadConstant| % 71)
                         (SPADCALL (|spadConstant| % 174)
                                   (PROG1 (LETT #1# |i|)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT % 332))
                         (QREFELT % 333)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| (|SparseUnivariatePolynomial| F))
         (%
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPADCALL (ELT % 236) |p| (QREFELT % 341))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| (|UnivariateFormalPowerSeries| F)) (|deg| (|NonNegativeInteger|))
         (% (|SparseUnivariatePolynomial| F)))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT % 343)) (QREFELT % 344))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| (|List| (|UnivariateFormalPowerSeries| F)))
         (|deg| (|NonNegativeInteger|))
         (% (|List| (|SparseUnivariatePolynomial| F))))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR % |deg|)) |s|
                         (QREFELT % 348)))) 

(SDEFUN |GUESS;getListSUPF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|deg| %)
          (LETT |deg| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;UFPSF2SUPF| |z1| |deg| %))))) 

(SDEFUN |GUESS;guessInterpolateModular|
        ((|lists| (|List| (|List| F))) (|degs| (|List| (|Integer|)))
         (|o| (|NonNegativeInteger|)) (|degreeLoss| (|Integer|))
         (|guessDegree| (|NonNegativeInteger|))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|)))
         (% (|Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|))))
        (SPROG
         ((|list| (|List| F)) (#1=#:G965 NIL) (|sigma| (|NonNegativeInteger|))
          (|el| NIL) (#2=#:G1026 NIL) (|leadingZeros| (|Integer|))
          (|del| (|Integer|)) (#3=#:G1025 NIL) (#4=#:G968 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#5=#:G1027 NIL) (#6=#:G1028 NIL) (#7=#:G1029 NIL) (#8=#:G1030 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#9=#:G1031 NIL) (|i| NIL) (#10=#:G1032 NIL)
          (|check|
           (|Mapping| (|Union| "good" "reject" "no_solution")
                      (|List| (|SparseUnivariatePolynomial| S)))))
         (SEQ
          (EXIT
           (SEQ (LETT |list| (|SPADfirst| |lists|))
                (LETT |sigma|
                      (PROG1 (LETT #1# (- (LENGTH |list|) |degreeLoss|))
                        (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #1#)))
                (LETT |leadingZeros| 0)
                (SEQ (LETT |el| NIL) (LETT #2# |list|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |el| (CAR #2#)) NIL)
                           (NULL (SPADCALL |el| (QREFELT % 349))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((> |leadingZeros| |degreeLoss|)
                  (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|))
                       (EXIT
                        (COND
                         ((> |del| |guessDegree|)
                          (PROGN (LETT #3# (CONS 1 NIL)) (GO #11=#:G1024)))
                         (#12='T
                          (LETT |guessDegree|
                                (PROG1 (LETT #4# (- |guessDegree| |del|))
                                  (|check_subtype2| (>= #4# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #4#)))))))))
                (COND
                 ((NULL (SPADCALL |options| (QREFELT % 350)))
                  (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT % 351)))
                       (EXIT
                        (COND
                         ((QEQCAR |maxD| 0)
                          (COND
                           ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                            (LETT |degs|
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |i| 1) (LETT #6# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #6#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5# (CONS (QCDR |maxD|) #5#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #5#))))))
                           (#12#
                            (SEQ (LETT |deg| (|divide_INT| |guessDegree| |o|))
                                 (EXIT
                                  (LETT |degs|
                                        (PROGN
                                         (LETT #7# NIL)
                                         (SEQ (LETT |i| 1) (LETT #8# |o|) G190
                                              (COND
                                               ((|greater_SI| |i| #8#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #7#
                                                      (CONS
                                                       (COND
                                                        ((<= |i| (QCDR |deg|))
                                                         (+ (QCAR |deg|) 1))
                                                        ('T (QCAR |deg|)))
                                                       #7#))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #7#))))))))))
                         (#12#
                          (SEQ (LETT |deg| (|divide_INT| |guessDegree| |o|))
                               (EXIT
                                (LETT |degs|
                                      (PROGN
                                       (LETT #9# NIL)
                                       (SEQ (LETT |i| 1) (LETT #10# |o|) G190
                                            (COND
                                             ((|greater_SI| |i| #10#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #9#
                                                    (CONS
                                                     (COND
                                                      ((<= |i| (QCDR |deg|))
                                                       (+ (QCAR |deg|) 1))
                                                      ('T (QCAR |deg|)))
                                                     #9#))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191
                                            (EXIT (NREVERSE #9#)))))))))))))
                (LETT |check|
                      (CONS #'|GUESS;guessInterpolateModular!0|
                            (VECTOR % |sigma| |options| D |o| |list|)))
                (COND
                 ((QEQCAR (SPADCALL |options| (QREFELT % 353)) 1)
                  (LETT |check|
                        (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6)
                                  |sigma| (SPADCALL |o| (QVELT D 2))
                                  (QREFELT % 357))))
                 ((QEQCAR (SPADCALL |options| (QREFELT % 353)) 0)
                  (SEQ
                   (COND
                    ((SPADCALL |options| (QREFELT % 358))
                     (SPADCALL "Guess: skipping checks" (QREFELT % 360))))
                   (EXIT
                    (LETT |check|
                          (LIST #'|GUESS;guessInterpolateModular!1|)))))
                 (#12#
                  (LETT |check|
                        (CONS #'|GUESS;guessInterpolateModular!2|
                              (VECTOR % |sigma| |options| D |o| |list|)))))
                (EXIT
                 (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                           (SPADCALL |o| (QVELT D 2)) |check|
                           (QREFELT % 362)))))
          #11# (EXIT #3#)))) 

(SDEFUN |GUESS;guessInterpolateModular!2| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| %)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| %))))) 

(SDEFUN |GUESS;guessInterpolateModular!1| ((|x| NIL) ($$ NIL)) (CONS 0 "good")) 

(SDEFUN |GUESS;guessInterpolateModular!0| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| %)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| %))))) 

(SDEFUN |GUESS;guessInterpolateFFFG|
        ((|lists| (|List| (|List| F))) (|degs| (|List| (|Integer|)))
         (|o| (|NonNegativeInteger|)) (|guessDegree| (|NonNegativeInteger|))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          #1=(|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|)))
         (% (|Matrix| (|SparseUnivariatePolynomial| S))))
        (SPROG
         ((|list| (|List| F)) (#2=#:G1134 NIL) (|d| NIL) (#3=#:G1135 NIL)
          (#4=#:G1036 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#5=#:G1136 NIL) (#6=#:G1137 NIL) (#7=#:G1049 NIL) (#8=#:G1138 NIL)
          (#9=#:G1139 NIL) (#10=#:G1061 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#11=#:G1140 NIL) (#12=#:G1141 NIL)
          (|eta| (|List| (|NonNegativeInteger|)))
          (|sumEta| (|NonNegativeInteger|)) (|guessS| #1#)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (#13=#:G1101 NIL)
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (|i| NIL)
          (#14=#:G1142 NIL) (|rl| (|List| (|Integer|)))
          (|m| (|NonNegativeInteger|))
          (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S))) (|i2| NIL)
          (#15=#:G1144 NIL) (|i1| NIL) (#16=#:G1143 NIL) (#17=#:G1145 NIL)
          (#18=#:G1146 NIL) (#19=#:G1147 NIL) (|cl| (|List| S)) (|c| (S))
          (|j| NIL) (#20=#:G1148 NIL) (#21=#:G1126 NIL))
         (SEQ (LETT |list| (|SPADfirst| |lists|))
              (COND
               ((SPADCALL |options| (QREFELT % 358))
                (SPADCALL "Guess: using FFFG" (QREFELT % 360))))
              (COND
               ((SPADCALL |options| (QREFELT % 350))
                (SEQ
                 (LETT |eta|
                       (PROGN
                        (LETT #2# NIL)
                        (SEQ (LETT |d| NIL) (LETT #3# |degs|) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |d| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #2#
                                     (CONS
                                      (PROG1 (LETT #4# |d|)
                                        (|check_subtype2| (>= #4# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #4#))
                                      #2#))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #2#)))))
                 (EXIT
                  (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT % 363)) 1)
                            (QREFELT % 364)))))
               (#22='T
                (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT % 351)))
                     (EXIT
                      (COND
                       ((QEQCAR |maxD| 0)
                        (COND
                         ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                          (LETT |eta|
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |i| 1) (LETT #6# |o|) G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (COND
                                                ((< |i| |o|)
                                                 (+ (QCDR |maxD|) 1))
                                                ('T (QCDR |maxD|)))
                                               #5#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #5#))))))
                         (#22#
                          (SEQ
                           (LETT |deg|
                                 (|divide_INT|
                                  (PROG1 (LETT #7# (- (+ |guessDegree| |o|) 1))
                                    (|check_subtype2| (>= #7# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #7#))
                                  |o|))
                           (EXIT
                            (LETT |eta|
                                  (PROGN
                                   (LETT #8# NIL)
                                   (SEQ (LETT |i| 1) (LETT #9# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #9#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #8#
                                                (CONS
                                                 (COND
                                                  ((<= |i| (QCDR |deg|))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #8#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #8#))))))))))
                       (#22#
                        (SEQ
                         (LETT |deg|
                               (|divide_INT|
                                (PROG1 (LETT #10# (- (+ |guessDegree| |o|) 1))
                                  (|check_subtype2| (>= #10# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #10#))
                                |o|))
                         (EXIT
                          (LETT |eta|
                                (PROGN
                                 (LETT #11# NIL)
                                 (SEQ (LETT |i| 1) (LETT #12# |o|) G190
                                      (COND
                                       ((|greater_SI| |i| #12#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #11#
                                              (CONS
                                               (COND
                                                ((<= |i| (QCDR |deg|))
                                                 (+ (QCAR |deg|) 1))
                                                ('T (QCAR |deg|)))
                                               #11#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #11#)))))))))))))
              (LETT |sumEta| (SPADCALL (ELT % 76) |eta| (QREFELT % 371)))
              (LETT |guessS|
                    (SPADCALL (|GUESS;list2UFPSF| |list| %) (QVELT D 1)))
              (LETT |guessList|
                    (SPADCALL
                     (SPADCALL (SPADCALL |guessS| |o| (QREFELT % 372))
                               (QREFELT % 373))
                     (QREFELT % 374)))
              (LETT |guessPolys|
                    (|GUESS;getListSUPF| |guessList|
                     (PROG1 (LETT #13# (- |sumEta| 1))
                       (|check_subtype2| (>= #13# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #13#))
                     %))
              (COND
               ((|domainEqual| (QREFELT % 6) (QREFELT % 7))
                (SEQ
                 (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT % 377)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessList| |eta| (QREFELT % 379))))))
               ((|domainEqual| (QREFELT % 6) (|Fraction| (QREFELT % 7)))
                (SEQ
                 (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT % 381)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessListF| |eta| (QREFELT % 383))))))
               (#22#
                (|error|
                 (SPADCALL "Guess: type parameter F should be either equal to"
                           " S or equal to Fraction S" (QREFELT % 42)))))
              (LETT |rl| NIL)
              (SEQ (LETT |i| 1) (LETT #14# (ANCOLS M)) G190
                   (COND ((|greater_SI| |i| #14#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((QEQCAR
                        (|GUESS;checkInterpolant| |list| |o|
                         (SPADCALL (SPADCALL M |i| (QREFELT % 384))
                                   (QREFELT % 385))
                         D |options| |guessDegree| %)
                        0)
                       (LETT |rl| (CONS |i| |rl|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |rl|) (MAKE_MATRIX 0 0))
                     (#22#
                      (SEQ (LETT |rl| (NREVERSE |rl|)) (LETT |m| (ANROWS M))
                           (LETT |Mr|
                                 (MAKE_MATRIX1 |m| (LENGTH |rl|)
                                               (|spadConstant| % 386)))
                           (SEQ (LETT |i2| NIL) (LETT #15# |rl|) (LETT |i1| 1)
                                (LETT #16# (LENGTH |rl|)) G190
                                (COND
                                 ((OR (|greater_SI| |i1| #16#) (ATOM #15#)
                                      (PROGN (LETT |i2| (CAR #15#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (COND
                                  ((|HasCategory| (QREFELT % 7) '(|Field|))
                                   (SEQ (LETT |c| (|spadConstant| % 144))
                                        (EXIT
                                         (SEQ (LETT |j| 1) (LETT #17# |m|) G190
                                              (COND
                                               ((OR (|greater_SI| |j| #17#)
                                                    (NULL
                                                     (SPADCALL |c|
                                                               (QREFELT %
                                                                        387))))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |c|
                                                      (SPADCALL
                                                       (SPADCALL M |j| |i2|
                                                                 (QREFELT %
                                                                          388))
                                                       (QREFELT % 389)))))
                                              (LETT |j| (|inc_SI| |j|))
                                              (GO G190) G191 (EXIT NIL)))))
                                  ('T
                                   (SEQ
                                    (LETT |cl|
                                          (PROGN
                                           (LETT #18# NIL)
                                           (SEQ (LETT |j| 1) (LETT #19# |m|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #19#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #18#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL M |j| |i2|
                                                                    (QREFELT %
                                                                             388))
                                                          (QREFELT % 390))
                                                         #18#))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #18#)))))
                                    (EXIT
                                     (LETT |c|
                                           (SPADCALL |cl| (QREFELT % 391)))))))
                                 (EXIT
                                  (SEQ (LETT |j| 1) (LETT #20# |m|) G190
                                       (COND
                                        ((|greater_SI| |j| #20#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |Mr| |j| |i1|
                                                   (PROG2
                                                       (LETT #21#
                                                             (SPADCALL
                                                              (SPADCALL M |j|
                                                                        |i2|
                                                                        (QREFELT
                                                                         %
                                                                         388))
                                                              |c|
                                                              (QREFELT % 392)))
                                                       (QCDR #21#)
                                                     (|check_union2|
                                                      (QEQCAR #21# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT % 7))
                                                      (|Union|
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT % 7))
                                                       "failed")
                                                      #21#))
                                                   (QREFELT % 393))))
                                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |i1|
                                      (PROG1 (|inc_SI| |i1|)
                                        (LETT #15# (CDR #15#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |Mr|)))))))) 

(SDEFUN |GUESS;guessInterpolate3|
        ((|lists| (|List| (|List| F))) (|o| (|NonNegativeInteger|))
         (|degreeLoss| (|Integer|)) (|guessDegree| (|NonNegativeInteger|))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|)))
         (|vs| (|Stream| (|List| (|Integer|))))
         (% (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S)))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GUESS;guessInterpolate3!1|
                       (VECTOR |options| D |guessDegree| |degreeLoss| |o|
                               |lists| % |vs|))
                 (QREFELT % 405))))) 

(SDEFUN |GUESS;guessInterpolate3!1| (($$ NIL))
        (PROG (|vs| % |lists| |o| |degreeLoss| |guessDegree| D |options|)
          (LETT |vs| (QREFELT $$ 7))
          (LETT % (QREFELT $$ 6))
          (LETT |lists| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT |degreeLoss| (QREFELT $$ 3))
          (LETT |guessDegree| (QREFELT $$ 2))
          (LETT D (QREFELT $$ 1))
          (LETT |options| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|degs| NIL) (M0 NIL) (#1=#:G1168 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT % 394))
                           (SPADCALL |vs| (QREFELT % 397)))
                       (SPADCALL (QREFELT % 396)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT % 398)))
                            (LETT M0
                                  (|GUESS;guessInterpolateModular| |lists|
                                   |degs| |o| |degreeLoss| |guessDegree| D
                                   |options| %))
                            (LETT M
                                  (COND
                                   ((QEQCAR M0 1)
                                    (SEQ
                                     (COND
                                      ((QCDR M0)
                                       (COND
                                        ((SPADCALL
                                          (CONS #'|GUESS;guessInterpolate3!0|
                                                %)
                                          |degs| (QREFELT % 401))
                                         (EXIT
                                          (|GUESS;guessInterpolateFFFG| |lists|
                                           |degs| |o| |guessDegree| D |options|
                                           %))))))
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (|GUESS;guessInterpolate3| |lists|
                                              |o| |degreeLoss| |guessDegree| D
                                              |options|
                                              (SPADCALL |vs| (QREFELT % 402))
                                              %))
                                       (GO #2=#:G1167)))))
                                   ('T (QCDR M0))))
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT % 402)) %)
                                       (QREFELT % 403)))))))
                    #2# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) (% NIL))
        (SPADCALL |x| (|spadConstant| % 95) (QREFELT % 399))) 

(SDEFUN |GUESS;listDecr|
        ((|l| (|List| (|NonNegativeInteger|))) (% (|List| (|Integer|))))
        (SPADCALL (CONS #'|GUESS;listDecr!0| %) |l| (QREFELT % 408))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) (% NIL))
        (SPADCALL |x| (|spadConstant| % 174) (QREFELT % 183))) 

(SDEFUN |GUESS;guessInterpolate2|
        ((|lists| (|List| (|List| F))) (|o| (|NonNegativeInteger|))
         (|degreeLoss| (|Integer|)) (|guessDegree| (|NonNegativeInteger|))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|)))
         (% (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S)))))
        (SPROG
         ((|maxD0| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|maxD| (|NonNegativeInteger|))
          (|vs0| (|Stream| (|List| (|NonNegativeInteger|))))
          (|vs| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (LETT |vs|
                (COND
                 ((SPADCALL |options| (QREFELT % 350))
                  (SEQ (LETT |maxD0| (SPADCALL |options| (QREFELT % 351)))
                       (LETT |maxD|
                             (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                                   (#1='T (- (+ |guessDegree| |o|) 2))))
                       (LETT |vs0|
                             (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                       (QREFELT % 410)))
                       (EXIT
                        (SPADCALL (CONS (|function| |GUESS;listDecr|) %) |vs0|
                                  (QREFELT % 413)))))
                 (#1#
                  (SPADCALL NIL (SPADCALL (QREFELT % 414)) (QREFELT % 415)))))
          (EXIT
           (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
            |options| |vs| %))))) 

(SDEFUN |GUESS;precCheck|
        ((|list| (|List| F)) (|resi| (|List| (|SparseUnivariatePolynomial| S)))
         (|options| (|List| (|GuessOption|))) (|sigma| (|Integer|))
         (|bad| (|Boolean|)) (% (|Union| "good" "reject" "no_solution")))
        (SPROG
         ((|homp| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|homo| (|Boolean|))
          (|resv| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|gl0| (|Vector| F))
          (|degree_loss| #1=(|Integer|)) (|max_ind| #1#)
          (|svar| (|SingletonAsOrderedSet|)) (|j0| (|Integer|))
          (#2=#:G1240 NIL) (#3=#:G1241 NIL) (|vi| (F)) (|vd| (S)) (|pp| (S))
          (|c1| (S)) (#4=#:G1195 NIL) (|c2| (S)) (|cden| (S)) (#5=#:G1235 NIL)
          (#6=#:G1242 NIL) (#7=#:G1243 NIL) (#8=#:G1233 NIL) (#9=#:G1244 NIL)
          (#10=#:G1234 NIL) (|gl| (|Vector| S)) (#11=#:G1245 NIL)
          (#12=#:G1246 NIL) (|res1| (S)) (#13=#:G1238 NIL) (|i| NIL)
          (#14=#:G1247 NIL) (|si| (S)) (#15=#:G1248 NIL) (#16=#:G1236 NIL)
          (|j| NIL) (#17=#:G1249 NIL) (|p2| (|SparseUnivariatePolynomial| S))
          (|p2val| (S)) (|res2| (S)) (#18=#:G1237 NIL) (#19=#:G1239 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |homp| (SPADCALL |options| (QREFELT % 59)))
                (LETT |homo|
                      (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#20='T 'T)))
                (LETT |resv| (SPADCALL |resi| (QREFELT % 377)))
                (LETT |m| (QVSIZE |resv|))
                (LETT |gl0| (SPADCALL |list| (QREFELT % 417)))
                (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#20# (- |m| 2))))
                (COND
                 ((SPADCALL |options| (QREFELT % 418))
                  (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1)))
                 (#20# (LETT |max_ind| (- |sigma| 1))))
                (LETT |svar| (SPADCALL (QREFELT % 420)))
                (LETT |j0| (COND (|homo| 1) (#20# 2)))
                (EXIT
                 (COND
                  ((|domainEqual| (QREFELT % 6) (|Fraction| (QREFELT % 7)))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #2# |max_ind|) G190
                             (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| % 144))
                                    (LETT |cden| (|spadConstant| % 72))
                                    (LETT |si| (SPADCALL |i| (QREFELT % 421)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT % 422))
                                              |svar| |si| (QREFELT % 423))
                                             (QREFELT % 424)))))
                                    (SEQ (LETT |j| |j0|) (LETT #3# |m|) G190
                                         (COND ((> |j| #3#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT % 422)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT % 423))
                                                 (QREFELT % 424)))
                                          (LETT |vi|
                                                (SPADCALL |gl|
                                                          (+
                                                           (- (+ |i| |j|) |j0|)
                                                           1)
                                                          (QREFELT % 425)))
                                          (LETT |vd|
                                                (SPADCALL |vi| (QREFELT % 36)))
                                          (LETT |pp|
                                                (SPADCALL |cden| |vd|
                                                          (QREFELT % 426)))
                                          (LETT |c1|
                                                (PROG2
                                                    (LETT #4#
                                                          (SPADCALL |cden| |pp|
                                                                    (QREFELT %
                                                                             427)))
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0) (QREFELT % 7)
                                                   (|Union| (QREFELT % 7)
                                                            #21="failed")
                                                   #4#)))
                                          (LETT |c2|
                                                (PROG2
                                                    (LETT #4#
                                                          (SPADCALL |vd| |pp|
                                                                    (QREFELT %
                                                                             427)))
                                                    (QCDR #4#)
                                                  (|check_union2|
                                                   (QEQCAR #4# 0) (QREFELT % 7)
                                                   (|Union| (QREFELT % 7) #21#)
                                                   #4#)))
                                          (LETT |res1|
                                                (SPADCALL
                                                 (SPADCALL |c2| |res1|
                                                           (QREFELT % 428))
                                                 (SPADCALL
                                                  (SPADCALL |p2val| |c1|
                                                            (QREFELT % 428))
                                                  (SPADCALL |vi|
                                                            (QREFELT % 35))
                                                  (QREFELT % 428))
                                                 (QREFELT % 367)))
                                          (EXIT
                                           (LETT |cden|
                                                 (SPADCALL |cden| |c2|
                                                           (QREFELT % 428)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| % 144)
                                                 (QREFELT % 429))
                                       (PROGN
                                        (LETT #5#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #19#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22=#:G1232)))
                                               ('T
                                                (PROGN
                                                 (LETT #19# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #23=#:G1199)))))))
                              #23# (EXIT #5#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT % 418)))
                          (PROGN (LETT #19# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #19# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #6# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT % 421)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #7# |m|)
                                         G190 (COND ((> |j| #7#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT % 422)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT % 423))
                                                   (QREFELT % 424)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| % 144)
                                                         (QREFELT % 429))
                                               (PROGN
                                                (LETT #8#
                                                      (PROGN
                                                       (LETT #19#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #24=#:G1204)))))))
                                          #24# (EXIT #8#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| % 143))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |resv| 1
                                                         (QREFELT % 422))
                                               |svar| |si| (QREFELT % 423))
                                              (QREFELT % 424))
                                             (QREFELT % 49)))))
                                    (SEQ (LETT |j| |j0|) (LETT #9# (- |m| |i|))
                                         G190 (COND ((> |j| #9#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT % 422)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT % 423))
                                                 (QREFELT % 424)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       % 425))
                                                                     (QREFELT %
                                                                              430))
                                                           (QREFELT % 431)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| % 143)
                                                 (QREFELT % 432))
                                       (PROGN
                                        (LETT #10#
                                              (PROGN
                                               (LETT #19# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #25=#:G1209)))))))
                                  #25# (EXIT #10#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #19# (CONS 0 "good"))
                              (GO #22#)))))))))
                  ((|domainEqual| (QREFELT % 6) (QREFELT % 7))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #11# |max_ind|) G190
                             (COND ((|greater_SI| |i| #11#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| % 144))
                                    (LETT |si| (SPADCALL |i| (QREFELT % 421)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT % 422))
                                              |svar| |si| (QREFELT % 423))
                                             (QREFELT % 424)))))
                                    (SEQ (LETT |j| |j0|) (LETT #12# |m|) G190
                                         (COND ((> |j| #12#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT % 422)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT % 423))
                                                 (QREFELT % 424)))
                                          (EXIT
                                           (LETT |res1|
                                                 (SPADCALL |res1|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+ |i|
                                                                           |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       % 434))
                                                                     (QREFELT %
                                                                              428))
                                                           (QREFELT % 367)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| % 144)
                                                 (QREFELT % 429))
                                       (PROGN
                                        (LETT #13#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #19#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22#)))
                                               ('T
                                                (PROGN
                                                 (LETT #19# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #26=#:G1217)))))))
                              #26# (EXIT #13#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT % 418)))
                          (PROGN (LETT #19# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #19# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #14# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #14#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT % 421)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #15# |m|)
                                         G190 (COND ((> |j| #15#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT % 422)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT % 423))
                                                   (QREFELT % 424)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| % 144)
                                                         (QREFELT % 429))
                                               (PROGN
                                                (LETT #16#
                                                      (PROGN
                                                       (LETT #19#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #27=#:G1222)))))))
                                          #27# (EXIT #16#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| % 144))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT % 422))
                                              |svar| |si| (QREFELT % 423))
                                             (QREFELT % 424)))))
                                    (SEQ (LETT |j| |j0|)
                                         (LETT #17# (- |m| |i|)) G190
                                         (COND ((> |j| #17#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT % 422)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT % 423))
                                                 (QREFELT % 424)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       % 434))
                                                                     (QREFELT %
                                                                              428))
                                                           (QREFELT % 367)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| % 144)
                                                 (QREFELT % 429))
                                       (PROGN
                                        (LETT #18#
                                              (PROGN
                                               (LETT #19# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #28=#:G1227)))))))
                                  #28# (EXIT #18#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #19# (CONS 0 "good"))
                              (GO #22#)))))))))
                  (#20# (|error| "F must be S or Fraction(S)"))))))
          #22# (EXIT #19#)))) 

(SDEFUN |GUESS;checkInterpolant|
        ((|list| (|List| F)) (|o| (|NonNegativeInteger|))
         (|resi| (|List| (|SparseUnivariatePolynomial| S)))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           #1=(|Vector|
                               (|UnivariateFormalPowerSeries|
                                (|SparseMultivariatePolynomial| F
                                                                (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|))) (|sigma| (|Integer|))
         (% (|Union| "good" "reject" "no_solution")))
        (SPROG
         ((#2=#:G1308 NIL)
          (|nonZeroCoefficients| (|Union| "one" "several" "none"))
          (#3=#:G1306 NIL) (|reject_one_term| (|Boolean|))
          (|len| (|NonNegativeInteger|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|maxPow| (|Integer|)) (#4=#:G1309 NIL) (#5=#:G1310 NIL)
          (#6=#:G1284 NIL) (|flist| (|List| (|PositiveInteger|)))
          (|testList| #1#) (#7=#:G1311 NIL) (|i| NIL) (#8=#:G1312 NIL)
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|dmax| (|NonNegativeInteger|)) (|d| NIL)
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|order| (|Integer|)) (#9=#:G1305 NIL) (#10=#:G1307 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT % 358))
              (SPADCALL "Guess: checking solution" (QREFELT % 360))))
            (LETT |nonZeroCoefficients| (CONS 2 "none"))
            (LETT |reject_one_term| NIL)
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1) (LETT #2# (LENGTH |resi|)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT % 435))
                                  (QREFELT % 436)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one")))
                        ('T
                         (SEQ (LETT |nonZeroCoefficients| (CONS 1 "several"))
                              (EXIT
                               (PROGN
                                (LETT #3# |$NoValue|)
                                (GO #11=#:G1259))))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #3#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT % 349) |list| (QREFELT % 443)))
                (SEQ (LETT |reject_one_term| 'T)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT % 358))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT % 360))))))))))
            (LETT |len| (LENGTH |list|))
            (LETT |maxP| (SPADCALL |options| (QREFELT % 57)))
            (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|)))
                  (#12='T (LETT |maxPow| (+ |len| 2))))
            (COND
             ((EQL |maxPow| 1)
              (COND
               ((EQUAL (QVELT D 5) '|shiftHP|)
                (EXIT
                 (|GUESS;precCheck| |list| |resi| |options| |sigma|
                  |reject_one_term| %))))))
            (LETT |flist|
                  (PROGN
                   (LETT #4# NIL)
                   (SEQ (LETT |i| 1) (LETT #5# |o|) G190
                        (COND ((|greater_SI| |i| #5#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |resi| |i| (QREFELT % 435))
                                       (QREFELT % 436)))
                            (LETT #4#
                                  (CONS
                                   (PROG1 (LETT #6# |i|)
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #6#))
                                   #4#))))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #4#)))))
            (LETT |testList|
                  (SPADCALL (|GUESS;list2UFPSSUPF| |list| %)
                            (SPADCALL |flist| (QVELT D 3))))
            (LETT |resiSUPF|
                  (PROGN
                   (LETT #7# NIL)
                   (SEQ (LETT |i| NIL) (LETT #8# |flist|) G190
                        (COND
                         ((OR (ATOM #8#) (PROGN (LETT |i| (CAR #8#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #7#
                                (CONS
                                 (|GUESS;SUPF2SUPSUPF|
                                  (|GUESS;SUPS2SUPF|
                                   (SPADCALL |resi| |i| (QREFELT % 435)) %)
                                  %)
                                 #7#))))
                        (LETT #8# (CDR #8#)) (GO G190) G191
                        (EXIT (NREVERSE #7#)))))
            (LETT |order| 0) (LETT |dmax| (* 10 (LENGTH |list|)))
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT % 418)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN
                         (LETT #10# (CONS 0 "good"))
                         (GO #13=#:G1304))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #10# (CONS 1 "reject")) (GO #13#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT % 446))
                                    (QREFELT % 447)))
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT % 448)))
                      (SEQ (LETT |order| |d|)
                           (EXIT
                            (PROGN (LETT #9# |$NoValue|) (GO #14=#:G1297))))))
                    (EXIT
                     (COND
                      ((> |d| |dmax|)
                       (SEQ
                        (SPADCALL
                         (SPADCALL "bailing out from checkInterpolant"
                                   (QREFELT % 450))
                         (QREFELT % 451))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "please report the input to "
                                    "fricas-devel@googlegroups.com"
                                    (QREFELT % 42))
                          (QREFELT % 450))
                         (QREFELT % 451))
                        (LETT |order| |d|)
                        (EXIT (PROGN (LETT #9# |$NoValue|) (GO #14#))))))))
                   (LETT |d| (|inc_SI| |d|)) (GO G190) G191 (EXIT NIL)))
             #14# (EXIT #9#))
            (EXIT
             (COND
              ((< |order| |sigma|)
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL "Order too low: " (QREFELT % 450))
                           (SPADCALL |order| (QREFELT % 452)) (QREFELT % 453))
                 (QREFELT % 451))
                (SPADCALL
                 (SPADCALL (SPADCALL "sigma: " (QREFELT % 450))
                           (SPADCALL |sigma| (QREFELT % 452)) (QREFELT % 453))
                 (QREFELT % 451))
                (EXIT (PROGN (LETT #10# (CONS 2 "no_solution")) (GO #13#)))))
              ((SPADCALL |c| (QREFELT % 454))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT % 358))
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "Proposed solution does not fit coefficient "
                               (QREFELT % 450))
                     (SPADCALL |order| (QREFELT % 452)) (QREFELT % 453))
                    (QREFELT % 451))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL "sigma: " (QREFELT % 450))
                               (SPADCALL |sigma| (QREFELT % 452))
                               (QREFELT % 453))
                     (QREFELT % 451))))))
                (EXIT (PROGN (LETT #10# (CONS 1 "reject")) (GO #13#)))))
              (#12# (CONS 0 "good"))))))
          #13# (EXIT #10#)))) 

(SDEFUN |GUESS;wrapInterpolant|
        ((|resi| (|List| (|SparseUnivariatePolynomial| S)))
         (|exprList| (|List| EXPRR)) (|initials| (|List| F))
         (D
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|op| (|BasicOperator|)) (|options| (|List| (|GuessOption|)))
         (% (EXPRR)))
        (SPROG
         ((|dk| (|Symbol|)) (#1=#:G1343 NIL) (#2=#:G1345 NIL) (#3=#:G1344 NIL)
          (|eq| (EXPRR)) (#4=#:G1346 NIL) (|e| NIL) (#5=#:G1348 NIL) (|p| NIL)
          (#6=#:G1347 NIL) (|ex| (|List| EXPRR)))
         (SEQ (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
              (COND
               ((OR (EQUAL |dk| '|displayAsGF|) (EQUAL |dk| '|displayAsEQ|))
                (EXIT
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |e| NIL) (LETT #2# |exprList|)
                              (LETT |p| NIL) (LETT #3# |resi|) G190
                              (COND
                               ((OR (ATOM #3#) (PROGN (LETT |p| (CAR #3#)) NIL)
                                    (ATOM #2#)
                                    (PROGN (LETT |e| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT % 455))
                                        (|GUESS;SUPS2SUPF| |p| %) |e| %)
                                       #1#))))
                              (LETT #3# (PROG1 (CDR #3#) (LETT #2# (CDR #2#))))
                              (GO G190) G191 (EXIT (NREVERSE #1#)))))
                  (LETT |eq|
                        (SPADCALL (SPADCALL (ELT % 93) |ex| (QREFELT % 106))
                                  (QREFELT % 456)))
                  (EXIT
                   (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                         (#7='T
                          (SPADCALL |op| (SPADCALL |options| (QREFELT % 455))
                                    (SPADCALL |options| (QREFELT % 457)) |eq|
                                    (|GUESS;getVariables| |initials| %)
                                    (SPADCALL (QREFELT % 10)
                                              (SPADCALL |initials|
                                                        (QREFELT % 326))
                                              (QREFELT % 460))
                                    (QREFELT % 463)))))))))
              (EXIT
               (COND
                ((EQUAL |dk| '|displayAsRec|)
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |e| NIL) (LETT #5# |exprList|)
                              (LETT |p| NIL) (LETT #6# |resi|) G190
                              (COND
                               ((OR (ATOM #6#) (PROGN (LETT |p| (CAR #6#)) NIL)
                                    (ATOM #5#)
                                    (PROGN (LETT |e| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT % 457))
                                        (|GUESS;SUPS2SUPF| |p| %) |e| %)
                                       #4#))))
                              (LETT #6# (PROG1 (CDR #6#) (LETT #5# (CDR #5#))))
                              (GO G190) G191 (EXIT (NREVERSE #4#)))))
                  (EXIT
                   (SPADCALL |op| (SPADCALL |options| (QREFELT % 457))
                             (SPADCALL
                              (SPADCALL (ELT % 93) |ex| (QREFELT % 106))
                              (QREFELT % 456))
                             (|GUESS;getVariables| |initials| %)
                             (SPADCALL (QREFELT % 10)
                                       (SPADCALL |initials| (QREFELT % 326))
                                       (QREFELT % 460))
                             (QREFELT % 464)))))
                (#7# (|error| "wrapInterpolant: unsupported display kind"))))))) 

(SDEFUN |GUESS;guessHPaux|
        ((|lists| (|List| (|List| F)))
         (D
          (|Record| (|:| |degreeStream| #1=(|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| #2=(|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
         (|options| (|List| (|GuessOption|))) (% (|List| EXPRR)))
        (SPROG
         ((|list| (|List| F)) (|listDegree| #3=(|Integer|))
          (|op| (|BasicOperator|)) (|degreeS| #1#) (|dk| (|Symbol|))
          (#4=#:G1422 NIL) (|exprS| #2#) (|o| NIL) (#5=#:G1354 NIL)
          (#6=#:G1427 NIL) (|degreeLoss| (|Integer|)) (|guessDegree| #3#)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#7=#:G1363 NIL) (#8=#:G1423 NIL) (#9=#:G1429 NIL) (#10=#:G1406 NIL)
          (#11=#:G1426 NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (|exprList| (|List| EXPRR)) (|i| NIL) (#12=#:G1430 NIL)
          (|res| (EXPRR)) (|reslist| (|List| EXPRR)) (#13=#:G1428 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL) (LETT |list| (|SPADfirst| |lists|))
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT % 465))))
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #13# |reslist|) (GO #14=#:G1421))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT % 466))
                                (QREFELT % 467)))
                (LETT |degreeS| (QVELT D 0))
                (LETT |dk| (SPADCALL |options| (QREFELT % 199)))
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT % 455))
                                      (QREFELT % 45))
                                     (QREFELT % 468))
                           (SPADCALL |options| (QREFELT % 455)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #4#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT % 457))
                                             (QREFELT % 45))
                                            (QREFELT % 468))
                                  (SPADCALL |options| (QREFELT % 457))
                                  (QVELT D 4)))
                           (GO #15=#:G1352)))))
                       #15# (EXIT #4#)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |o| 2) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |degreeS|
                                      (PROG1 (LETT #5# (- |o| 1))
                                        (|check_subtype2| (>= #5# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #5#))
                                      (QREFELT % 469))
                            (QREFELT % 470))
                           (PROGN (LETT #6# 1) (GO #16=#:G1419)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT % 269)))
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|))
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT % 358))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT % 360))))
                               (EXIT
                                (PROGN (LETT #13# |reslist|) (GO #14#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT % 358))
                              (SPADCALL
                               (SPADCALL
                                (LIST
                                 (SPADCALL "Guess: trying order "
                                           (QREFELT % 450))
                                 (SPADCALL |o| (QREFELT % 471))
                                 (SPADCALL ", guessDegree is " (QREFELT % 450))
                                 (SPADCALL |guessDegree| (QREFELT % 452)))
                                (QREFELT % 472))
                               (QREFELT % 473))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT % 351)))
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT % 469))
                                    (QREFELT % 470))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (<= (* (QCDR |maxD|) (+ |o| 1))
                                       (-
                                        (- (+ |listDegree| 2)
                                           (SPADCALL |degreeS| (+ |o| 1)
                                                     (QREFELT % 269)))
                                        (+ |o| 1)))))
                                 (SEQ (LETT |exprList| NIL)
                                      (COND
                                       ((SPADCALL |options| (QREFELT % 358))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT % 474))
                                                 (QREFELT % 475))
                                                (QREFELT % 476)))
                                         (SPADCALL
                                          #17="Guess: The list of expressions is"
                                          (QREFELT % 360))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT % 477))
                                           (QREFELT % 473))))))
                                      (LETT MS
                                            (|GUESS;guessInterpolate2| |lists|
                                             |o| |degreeLoss|
                                             (PROG1 (LETT #7# |guessDegree|)
                                               (|check_subtype2| (>= #7# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #7#))
                                             D |options| %))
                                      (EXIT
                                       (SEQ
                                        (EXIT
                                         (SEQ G190 NIL
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL MS (QREFELT % 478))
                                                  (PROGN
                                                   (LETT #8# 1)
                                                   (GO #18=#:G1372)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT %
                                                                            479)))
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT %
                                                                            480)))
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        % 474))
                                                             (QREFELT % 475))
                                                            (QREFELT % 476)))))
                                                   (SEQ (LETT |i| 1)
                                                        (LETT #9# (ANCOLS M))
                                                        G190
                                                        (COND
                                                         ((|greater_SI| |i|
                                                                        #9#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |res|
                                                               (|GUESS;wrapInterpolant|
                                                                (SPADCALL
                                                                 (SPADCALL M
                                                                           |i|
                                                                           (QREFELT
                                                                            %
                                                                            384))
                                                                 (QREFELT %
                                                                          385))
                                                                |exprList|
                                                                |list| D |op|
                                                                |options| %))
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (SPADCALL |res|
                                                                       |reslist|
                                                                       (QREFELT
                                                                        %
                                                                        481)))
                                                            (LETT |reslist|
                                                                  (CONS |res|
                                                                        |reslist|))))))
                                                        (LETT |i|
                                                              (|inc_SI| |i|))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL |reslist|))
                                                      (COND
                                                       ((SPADCALL |options|
                                                                  (QREFELT %
                                                                           482))
                                                        (PROGN
                                                         (LETT #13# |reslist|)
                                                         (GO #14#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #18# (EXIT #8#)))))
                                ((SPADCALL |options| (QREFELT % 358))
                                 (SPADCALL "Guess: iterating"
                                           (QREFELT % 360)))))
                              ('T
                               (SEQ (LETT |exprList| NIL)
                                    (COND
                                     ((SPADCALL |options| (QREFELT % 358))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT % 474))
                                               (QREFELT % 475))
                                              (QREFELT % 476)))
                                       (SPADCALL #17# (QREFELT % 360))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT % 477))
                                         (QREFELT % 473))))))
                                    (LETT MS
                                          (|GUESS;guessInterpolate2| |lists|
                                           |o| |degreeLoss|
                                           (PROG1 (LETT #10# |guessDegree|)
                                             (|check_subtype2| (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                           D |options| %))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL MS (QREFELT % 478))
                                                (PROGN
                                                 (LETT #11# 1)
                                                 (GO #19=#:G1415)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT %
                                                                          479)))
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT %
                                                                          480)))
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT %
                                                                              474))
                                                           (QREFELT % 475))
                                                          (QREFELT % 476)))))
                                                 (SEQ (LETT |i| 1)
                                                      (LETT #12# (ANCOLS M))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #12#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |res|
                                                             (|GUESS;wrapInterpolant|
                                                              (SPADCALL
                                                               (SPADCALL M |i|
                                                                         (QREFELT
                                                                          %
                                                                          384))
                                                               (QREFELT % 385))
                                                              |exprList| |list|
                                                              D |op| |options|
                                                              %))
                                                       (EXIT
                                                        (COND
                                                         ((NULL
                                                           (SPADCALL |res|
                                                                     |reslist|
                                                                     (QREFELT %
                                                                              481)))
                                                          (LETT |reslist|
                                                                (CONS |res|
                                                                      |reslist|))))))
                                                      (LETT |i| (|inc_SI| |i|))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (COND
                                                   ((NULL (NULL |reslist|))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT %
                                                                         482))
                                                      (PROGN
                                                       (LETT #13# |reslist|)
                                                       (GO #14#))))))))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #19# (EXIT #11#))))))))))))
                       (LETT |o| (|inc_SI| |o|)) (GO G190) G191 (EXIT NIL)))
                 #16# (EXIT #6#))
                (EXIT |reslist|)))
          #14# (EXIT #13#)))) 

(SDEFUN |GUESS;processOptions|
        ((|options| (|List| (|GuessOption|)))
         (% (|List| (|List| (|GuessOption|)))))
        (SPROG
         ((|Som?| (|Union| (|PositiveInteger|) (|Boolean|))) (#1=#:G1435 NIL)
          (|maxD| (|NonNegativeInteger|)) (#2=#:G1441 NIL) (#3=#:G1443 NIL)
          (#4=#:G1432 NIL) (|maxSomos| (|PositiveInteger|)) (#5=#:G1483 NIL)
          (#6=#:G1484 NIL) (#7=#:G1448 NIL)
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|minP| (|PositiveInteger|)) (#8=#:G1485 NIL) (|i| NIL)
          (#9=#:G1438 NIL) (#10=#:G1486 NIL) (#11=#:G1474 NIL)
          (#12=#:G1476 NIL) (#13=#:G1482 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |Som?| (SPADCALL |options| (QREFELT % 62)))
                 (EXIT
                  (COND
                   ((QEQCAR |Som?| 1)
                    (COND
                     ((QCDR |Som?|)
                      (SEQ
                       (LETT |maxD|
                             (PROG2
                                 (LETT #1# (SPADCALL |options| (QREFELT % 61)))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "arbitrary")
                                               #1#)))
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT % 57)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #2# |maxD|)
                                  (|check_subtype2| (> #2# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #2#))
                                (PROG2
                                    (LETT #9#
                                          (SPADCALL |options| (QREFELT % 57)))
                                    (QCDR #9#)
                                  (|check_union2| (QEQCAR #9# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           #14="arbitrary")
                                                  #9#)))))
                        ((QEQCAR (SPADCALL |options| (QREFELT % 59)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #3# |maxD|)
                                  (|check_subtype2| (> #3# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #3#))
                                (PROG2
                                    (LETT #4#
                                          (SPADCALL |options| (QREFELT % 59)))
                                    (QCDR #4#)
                                  (|check_union2| (QEQCAR #4# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           (|Boolean|))
                                                  #4#)))))
                        (#15='T
                         (|error|
                          "Guess: internal error - inconsistent options")))
                       (EXIT
                        (PROGN
                         (LETT #13#
                               (SPADCALL
                                (PROGN
                                 (LETT #5# NIL)
                                 (SEQ (LETT |i| 2) (LETT #6# |maxSomos|) G190
                                      (COND ((|greater_SI| |i| #6#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #5#
                                              (CONS
                                               (|GUESS;processOptions|
                                                (CONS
                                                 (SPADCALL
                                                  (CONS 0
                                                        (PROG1 (LETT #7# |i|)
                                                          (|check_subtype2|
                                                           (> #7# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #7#)))
                                                  (QREFELT % 484))
                                                 |options|)
                                                %)
                                               #5#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #5#))))
                                (QREFELT % 486)))
                         (GO #16=#:G1481))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT % 59)))
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT % 62)) 0)
                         (LETT |minP| 2))
                        (#15# (LETT |minP| 1)))
                       (EXIT
                        (PROGN
                         (LETT #13#
                               (PROGN
                                (LETT #8# NIL)
                                (SEQ (LETT |i| |minP|)
                                     (LETT #10#
                                           (PROG2
                                               (LETT #9#
                                                     (SPADCALL |options|
                                                               (QREFELT % 57)))
                                               (QCDR #9#)
                                             (|check_union2| (QEQCAR #9# 0)
                                                             (|PositiveInteger|)
                                                             (|Union|
                                                              (|PositiveInteger|)
                                                              #14#)
                                                             #9#)))
                                     G190 (COND ((> |i| #10#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #8#
                                             (CONS
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #11# |i|)
                                                         (|check_subtype2|
                                                          (> #11# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #11#)))
                                                 (QREFELT % 487))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #12# |i|)
                                                         (|check_subtype2|
                                                          (> #12# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #12#)))
                                                 (QREFELT % 488)))
                                               |options| (QREFELT % 489))
                                              #8#))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #8#)))))
                         (GO #16#))))))))))
            (EXIT (LIST |options|))))
          #16# (EXIT #13#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;98|
        ((|lists| (|List| (|List| F))) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|l| (|List| F)) (|rl| (|List| (|List| F)))
          (|nn| (|NonNegativeInteger|)) (|li| NIL) (#1=#:G1505 NIL)
          (#2=#:G1503 NIL) (#3=#:G1493 NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (|opts| NIL)
          (#4=#:G1506 NIL) (|res| (|List| EXPRR)) (#5=#:G1504 NIL)
          (|lres| (|List| EXPRR)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT % 490))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ (LETT |l| (|SPADfirst| |lists|))
                        (LETT |rl| (CDR |lists|)) (LETT |nn| (LENGTH |l|))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |li| NIL) (LETT #1# |rl|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |li| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (LENGTH |li|) |nn|
                                             (QREFELT % 147))
                                   (PROGN
                                    (LETT #2#
                                          (|error|
                                           "guessAlgDep: lists must have equal length"))
                                    (GO #6=#:G1489))))))
                               (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #2#))
                        (LETT |lopts|
                              (|GUESS;processOptions|
                               (SPADCALL
                                (LIST (SPADCALL '|displayAsEQ| (QREFELT % 491))
                                      (SPADCALL
                                       (CONS 0
                                             (PROG1 (LETT #3# (LENGTH |lists|))
                                               (|check_subtype2| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #3#)))
                                       (QREFELT % 492)))
                                |options| (QREFELT % 493))
                               %))
                        (LETT |lres| NIL) (LETT |res| NIL)
                        (SEQ (LETT |opts| NIL) (LETT #4# |lopts|) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |opts| (CAR #4#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |res|
                                    (|GUESS;guessHPaux| |lists|
                                     (SPADCALL |lists| |opts| (QREFELT % 227))
                                     |opts| %))
                              (COND
                               ((NULL (NULL |res|))
                                (COND
                                 ((SPADCALL |options| (QREFELT % 482))
                                  (PROGN (LETT #5# |res|) (GO #7=#:G1502))))))
                              (EXIT
                               (LETT |lres|
                                     (SPADCALL |res| |lres| (QREFELT % 494)))))
                             (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (NREVERSE |lres|))))))))
          #7# (EXIT #5#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;99|
        ((|lists| (|List| (|List| F))) (% (|List| EXPRR)))
        (SPADCALL |lists| NIL (QREFELT % 495))) 

(SDEFUN |GUESS;guessADE;LLL;100|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|lopts| (|List| (|List| (|GuessOption|)))) (|opts| NIL)
          (#1=#:G1517 NIL) (|res| (|List| EXPRR)) (#2=#:G1516 NIL)
          (|lres| (|List| EXPRR)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT % 490))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT % 491))
                             |options|)
                       %))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #1# |lopts|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |opts| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT % 217)) |opts| %))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT % 482))
                          (PROGN (LETT #2# |res|) (GO #3=#:G1515))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT % 494)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #2#)))) 

(SDEFUN |GUESS;guessADE;LL;101| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 497))) 

(SDEFUN |GUESS;guessAlg;LLL;102|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT % 499)) |options|)
                  (QREFELT % 497))) 

(SDEFUN |GUESS;guessAlg;LL;103| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 500))) 

(SDEFUN |GUESS;guessHolo;LLL;104|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT % 488)) |options|)
                  (QREFELT % 497))) 

(SDEFUN |GUESS;guessHolo;LL;105| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 502))) 

(SDEFUN |GUESS;guessPade;LLL;106|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT % 499))
                              (SPADCALL (CONS 0 1) (QREFELT % 488)))
                        |options| (LIST (SPADCALL 'T (QREFELT % 504))))
                       (QREFELT % 505)))
                (EXIT (SPADCALL |list| |opts| (QREFELT % 497)))))) 

(SDEFUN |GUESS;guessPade;LL;107| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 506))) 

(SDEFUN |GUESS;guessFE;LLL;108|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|lopts| (|List| (|List| (|GuessOption|)))) (|opts| NIL)
          (#1=#:G1547 NIL) (|res| (|List| EXPRR)) (#2=#:G1546 NIL)
          (|lres| (|List| EXPRR)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT % 490))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT % 491))
                             |options|)
                       %))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #1# |lopts|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |opts| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT % 231)) |opts| %))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT % 482))
                          (PROGN (LETT #2# |res|) (GO #3=#:G1545))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT % 494)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #2#)))) 

(SDEFUN |GUESS;guessFE;LL;109| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 508))) 

(SDEFUN |GUESS;guessADE;SM;110|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;110!0| (VECTOR |q| %))))) 

(SDEFUN |GUESS;guessADE;SM;110!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lopts| NIL) (|opts| NIL) (#1=#:G1558 NIL) (|res| NIL)
              (#2=#:G1557 NIL) (|lres| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT % 490))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT % 491))
                                     |options| (QREFELT % 510))
                           %))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #1# |lopts|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |opts| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT % 242)))
                                 |opts| %))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT % 511)))
                            (COND
                             ((SPADCALL |options| (QREFELT % 482))
                              (PROGN (LETT #2# |res|) (GO #3=#:G1556))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT % 494)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT % 512)))))
              #3# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessHolo;SM;111|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;111!0| (VECTOR |q| %)))) 

(SDEFUN |GUESS;guessHolo;SM;111!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| % 74))
                                 (QREFELT % 488))
                       |z2| (QREFELT % 510))
                      (SPADCALL |q| (QREFELT % 513))))))) 

(SDEFUN |GUESS;guessRec;LLL;112|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|lopts| (|List| (|List| (|GuessOption|)))) (|opts| NIL)
          (#1=#:G1574 NIL) (|res| (|List| EXPRR)) (#2=#:G1573 NIL)
          (|lres| (|List| EXPRR)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT % 490))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT % 491))
                             |options|)
                       %))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #1# |lopts|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |opts| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT % 270)) |opts| %))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT % 482))
                          (PROGN (LETT #2# |res|) (GO #3=#:G1572))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT % 494)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #2#)))) 

(SDEFUN |GUESS;guessRec;LL;113| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 515))) 

(SDEFUN |GUESS;guessPRec;LLL;114|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT % 488)) |options|)
                  (QREFELT % 515))) 

(SDEFUN |GUESS;guessPRec;LL;115| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 517))) 

(SDEFUN |GUESS;guessRat;LLL;116|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT % 519))
                              (SPADCALL (CONS 0 1) (QREFELT % 488)))
                        |options| (LIST (SPADCALL 'T (QREFELT % 504))))
                       (QREFELT % 505)))
                (EXIT (SPADCALL |list| |opts| (QREFELT % 515)))))) 

(SDEFUN |GUESS;guessRat;LL;117| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| NIL (QREFELT % 520))) 

(SDEFUN |GUESS;guessRec;SM;118|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;118!0| (VECTOR |q| %))))) 

(SDEFUN |GUESS;guessRec;SM;118!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lopts| NIL) (|opts| NIL) (#1=#:G1599 NIL) (|res| NIL)
              (#2=#:G1598 NIL) (|lres| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT % 490))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT % 491))
                                     |options| (QREFELT % 510))
                           %))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #1# |lopts|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |opts| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT % 320)))
                                 |opts| %))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT % 511)))
                            (COND
                             ((SPADCALL |options| (QREFELT % 482))
                              (PROGN (LETT #2# |res|) (GO #3=#:G1597))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT % 494)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT % 512)))))
              #3# (EXIT #2#))))))) 

(SDEFUN |GUESS;guessPRec;SM;119|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;119!0| (VECTOR |q| %)))) 

(SDEFUN |GUESS;guessPRec;SM;119!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| % 74))
                                 (QREFELT % 488))
                       |z2| (QREFELT % 510))
                      (SPADCALL |q| (QREFELT % 522))))))) 

(SDEFUN |GUESS;guessRat;SM;120|
        ((|q| (|Symbol|))
         (% (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;120!0| (VECTOR |q| %)))) 

(SDEFUN |GUESS;guessRat;SM;120!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (% |q|)
          (LETT % (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| % 95))
                                   (QREFELT % 519))
                         (SPADCALL (CONS 0 (|spadConstant| % 74))
                                   (QREFELT % 488)))
                        |z2| (LIST (SPADCALL 'T (QREFELT % 504))))
                       (QREFELT % 505))
                      (SPADCALL |q| (QREFELT % 522))))))) 

(SDEFUN |GUESS;guess;LLLLL;121|
        ((|list| (|List| F))
         (|guessers|
          (|List|
           (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
         (|ops| (|List| (|Symbol|))) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPROG
         ((|xx| (EXPRR)) (#1=#:G1618 NIL) (|len| (|PositiveInteger|))
          (|guesser| NIL) (#2=#:G1706 NIL) (#3=#:G1623 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#4=#:G1707 NIL) (#5=#:G1708 NIL) (|prodList| (|List| F))
          (#6=#:G1709 NIL) (|prod| (EXPRR)) (|prodGuess| (|List| EXPRR))
          (#7=#:G1710 NIL) (#8=#:G1705 NIL) (#9=#:G1711 NIL) (|i| NIL)
          (#10=#:G1712 NIL) (|sumList| (|List| F)) (|var| (|Symbol|))
          (#11=#:G1713 NIL) (|init| (EXPRR)) (|summ| (EXPRR))
          (|sumGuess| (|List| EXPRR)) (|guess| NIL) (#12=#:G1714 NIL)
          (|res| (|List| EXPRR)))
         (SEQ
          (EXIT
           (SEQ (LETT |newMaxLevel| (SPADCALL |options| (QREFELT % 525)))
                (LETT |xx|
                      (SPADCALL (SPADCALL |options| (QREFELT % 457))
                                (QREFELT % 45)))
                (COND
                 ((SPADCALL |options| (QREFELT % 358))
                  (COND
                   ((QEQCAR |newMaxLevel| 0)
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL "Guess: guessing level " (QREFELT % 450))
                      (SPADCALL |newMaxLevel| (QREFELT % 526)) (QREFELT % 453))
                     (QREFELT % 473))))))
                (LETT |res| NIL)
                (LETT |len|
                      (PROG1 (LETT #1# (LENGTH |list|))
                        (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #1#)))
                (COND ((<= |len| 1) (PROGN (LETT #8# |res|) (GO #13=#:G1704))))
                (SEQ (LETT |guesser| NIL) (LETT #2# |guessers|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |guesser| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (SPADCALL (SPADCALL |list| |options| |guesser|)
                                      |res| (QREFELT % 494)))
                      (EXIT
                       (COND
                        ((SPADCALL |options| (QREFELT % 482))
                         (COND
                          ((NULL (NULL |res|))
                           (PROGN (LETT #8# |res|) (GO #13#))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((QEQCAR |newMaxLevel| 0)
                  (COND
                   ((ZEROP (QCDR |newMaxLevel|))
                    (PROGN (LETT #8# |res|) (GO #13#)))
                   (#14='T
                    (LETT |newMaxLevel|
                          (CONS 0
                                (PROG1 (LETT #3# (- (QCDR |newMaxLevel|) 1))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))))))))
                (COND
                 ((SPADCALL '|guessProduct| |ops| (QREFELT % 527))
                  (COND
                   ((SPADCALL (|spadConstant| % 143) |list| (QREFELT % 528))
                    (SEQ (|spadConstant| % 143)
                         (EXIT
                          (COND
                           ((SPADCALL |options| (QREFELT % 358))
                            (SPADCALL
                             "Guess: cannot use guessProduct because of zeros"
                             (QREFELT % 360)))))))
                   (#14#
                    (SEQ
                     (LETT |prodList|
                           (PROGN
                            (LETT #4# NIL)
                            (SEQ (LETT |i| 1) (LETT #5# (- |len| 1)) G190
                                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #4#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |list| (+ |i| 1)
                                                     (QREFELT % 529))
                                           (SPADCALL |list| |i|
                                                     (QREFELT % 529))
                                           (QREFELT % 530))
                                          #4#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #4#)))))
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (ELT % 539) |prodList| (QREFELT % 443)))
                        (SEQ
                         (LETT |var|
                               (SPADCALL '|p|
                                         (LIST
                                          (SPADCALL |len| (QREFELT % 540)))
                                         (QREFELT % 542)))
                         (LETT |prodGuess| NIL)
                         (SEQ (LETT |guess| NIL)
                              (LETT #6#
                                    (SPADCALL |prodList| |guessers| |ops|
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL |var|
                                                          (QREFELT % 543))
                                                (SPADCALL |newMaxLevel|
                                                          (QREFELT % 544)))
                                               |options| (QREFELT % 493))
                                              (QREFELT % 546)))
                              G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |guess| (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |init|
                                     (SPADCALL
                                      (SPADCALL |list| 1 (QREFELT % 529))
                                      (QREFELT % 10)))
                               (LETT |prod|
                                     (SPADCALL |guess|
                                               (SPADCALL |var|
                                                         (SPADCALL
                                                          (|spadConstant| %
                                                                          246)
                                                          (SPADCALL |xx|
                                                                    (|spadConstant|
                                                                     % 197)
                                                                    (QREFELT %
                                                                             247))
                                                          (QREFELT % 548))
                                                         (QREFELT % 550))
                                               (QREFELT % 552)))
                               (EXIT
                                (LETT |prodGuess|
                                      (CONS
                                       (SPADCALL |init| |prod| (QREFELT % 104))
                                       |prodGuess|))))
                              (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |guess| NIL) (LETT #7# |prodGuess|) G190
                               (COND
                                ((OR (ATOM #7#)
                                     (PROGN (LETT |guess| (CAR #7#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL |guess| |res| (QREFELT % 481)))
                                   (LETT |res| (CONS |guess| |res|))))))
                               (LETT #7# (CDR #7#)) (GO G190) G191
                               (EXIT NIL))))))))))))
                (COND
                 ((SPADCALL |options| (QREFELT % 482))
                  (COND
                   ((NULL (NULL |res|)) (PROGN (LETT #8# |res|) (GO #13#))))))
                (COND
                 ((SPADCALL '|guessSum| |ops| (QREFELT % 527))
                  (SEQ
                   (LETT |sumList|
                         (PROGN
                          (LETT #9# NIL)
                          (SEQ (LETT |i| 1) (LETT #10# (- |len| 1)) G190
                               (COND ((|greater_SI| |i| #10#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #9#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |list| (+ |i| 1)
                                                   (QREFELT % 529))
                                         (SPADCALL |list| |i| (QREFELT % 529))
                                         (QREFELT % 553))
                                        #9#))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #9#)))))
                   (EXIT
                    (COND
                     ((NULL
                       (SPADCALL
                        (CONS #'|GUESS;guess;LLLLL;121!0| (VECTOR % |sumList|))
                        |sumList| (QREFELT % 443)))
                      (SEQ
                       (LETT |var|
                             (SPADCALL '|s|
                                       (LIST (SPADCALL |len| (QREFELT % 540)))
                                       (QREFELT % 542)))
                       (LETT |sumGuess| NIL)
                       (SEQ (LETT |guess| NIL)
                            (LETT #11#
                                  (SPADCALL |sumList| |guessers| |ops|
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |var| (QREFELT % 543))
                                              (SPADCALL |newMaxLevel|
                                                        (QREFELT % 544)))
                                             |options| (QREFELT % 493))
                                            (QREFELT % 546)))
                            G190
                            (COND
                             ((OR (ATOM #11#)
                                  (PROGN (LETT |guess| (CAR #11#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |init|
                                   (SPADCALL
                                    (SPADCALL |list| 1 (QREFELT % 529))
                                    (QREFELT % 10)))
                             (LETT |summ|
                                   (SPADCALL |guess|
                                             (SPADCALL |var|
                                                       (SPADCALL
                                                        (|spadConstant| % 246)
                                                        (SPADCALL |xx|
                                                                  (|spadConstant|
                                                                   % 197)
                                                                  (QREFELT %
                                                                           247))
                                                        (QREFELT % 548))
                                                       (QREFELT % 550))
                                             (QREFELT % 555)))
                             (EXIT
                              (LETT |sumGuess|
                                    (CONS
                                     (SPADCALL |init| |summ| (QREFELT % 93))
                                     |sumGuess|))))
                            (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |guess| NIL) (LETT #12# |sumGuess|) G190
                             (COND
                              ((OR (ATOM #12#)
                                   (PROGN (LETT |guess| (CAR #12#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |guess| |res| (QREFELT % 481)))
                                 (LETT |res| (CONS |guess| |res|))))))
                             (LETT #12# (CDR #12#)) (GO G190) G191
                             (EXIT NIL))))))))))
                (EXIT |res|)))
          #13# (EXIT #8#)))) 

(SDEFUN |GUESS;guess;LLLLL;121!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| %)
          (LETT |sumList| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| % 74)
                                (QREFELT % 529))
                      (QREFELT % 554)))))) 

(SDEFUN |GUESS;guess;LL;122| ((|list| (|List| F)) (% (|List| EXPRR)))
        (SPADCALL |list| (LIST (ELT % 520)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT % 546))) 

(SDEFUN |GUESS;guess;LLL;123|
        ((|list| (|List| F)) (|options| (|List| (|GuessOption|)))
         (% (|List| EXPRR)))
        (SPADCALL |list| (LIST (ELT % 520)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT % 546))) 

(SDEFUN |GUESS;guess;LLLL;124|
        ((|list| (|List| F))
         (|guessers|
          (|List|
           (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|)))))
         (|ops| (|List| (|Symbol|))) (% (|List| EXPRR)))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT % 546))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (DV$5 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 |#4|)
    (LETT DV$5 |#5|)
    (LETT |dv$| (LIST '|Guess| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT % (GETREFV 559))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|Guess| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 %))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (QSETREFV % 10 |#5|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV % 24 (CONS (|dispatchFunction| |GUESS;guessExpRat;SM;5|) %))
         (QSETREFV % 26
                   (CONS (|dispatchFunction| |GUESS;guessBinRat;SM;6|) %)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV % 242
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;58|) %)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV % 320
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;81|) %)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV % 513 (CONS (|dispatchFunction| |GUESS;guessADE;SM;110|) %))
         (QSETREFV % 514
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;111|) %)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV % 522 (CONS (|dispatchFunction| |GUESS;guessRec;SM;118|) %))
         (QSETREFV % 523
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;119|) %))
         (QSETREFV % 524
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;120|) %)))))))
    %))) 

(DEFUN |Guess| (&REST #1=#:G1722)
  (SPROG NIL
         (PROG (#2=#:G1723)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction|
                     (|devaluate_sig| #1# '(T T T NIL NIL))
                     (HGET |$ConstructorCache| '|Guess|) '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Guess;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Guess|)))))))))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 8)
              (|List| 6) (|List| 483)
              (|GuessExpBin| 6 7 8 (NRTEVAL (QREFELT % 9))
                             (NRTEVAL (QREFELT % 10)))
              (0 . |guessExpRat|) |GUESS;guessExpRat;LL;1|
              |GUESS;guessExpRat;LLL;2| (6 . |guessBinRat|)
              |GUESS;guessBinRat;LL;3| |GUESS;guessBinRat;LLL;4|
              (|Mapping| 11 12 13) (|Symbol|) (12 . |guessExpRat|)
              (17 . |guessExpRat|) (22 . |guessBinRat|) (27 . |guessBinRat|)
              (|List| 22) (32 . |variables|) (|List| 27) (|Mapping| 27 7)
              (|List| 7) (|ListFunctions2| 7 27) (37 . |map|) (|Fraction| 7)
              (43 . |numer|) (48 . |denom|) (53 . |setUnion|) (|Mapping| 27 6)
              (|ListFunctions2| 6 27) (59 . |map|) (|String|) (65 . |elt|)
              (|Mapping| 27 27 27) (71 . |reduce|) (77 . |coerce|)
              (|Mapping| 8 22) (|ListFunctions2| 22 8) (82 . |map|)
              (88 . |coerce|) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (93 . |map|)
              (|Union| 73 '"arbitrary") (|GuessOptionFunctions0|)
              (99 . |maxPower|) (|Union| 73 89) (104 . |homogeneous|)
              (|Union| 75 '"arbitrary") (109 . |maxDerivative|) (114 . |Somos|)
              (|Stream| 85) (|Integer|) (|PartitionsAndPermutations|)
              (119 . |partitions|) (125 . |inc|) (|Mapping| 64 64)
              (|Stream| 64) (130 . |stream|) (136 . |1|) (140 . |1|)
              (|PositiveInteger|) (144 . |1|) (|NonNegativeInteger|) (148 . +)
              (154 . |partitions|) (|Stream| 63) (|Mapping| 63 64)
              (|StreamFunctions2| 64 63) (161 . |map|) (167 . |partitions|)
              (|StreamFunctions1| 85) (172 . |concat|) (|List| 64)
              (177 . |cons|) (183 . |conjugates|) (188 . |#|) (|Boolean|)
              (193 . =) (|Mapping| 89 85) (199 . |select|) (205 . +) (211 . +)
              (217 . |0|) (|Mapping| 64 64 64) (221 . |reduce|) (228 . =)
              (|List| 85) (|Partition|) (234 . |powers|) (239 . |second|)
              (244 . ^) (250 . *) (|Mapping| 8 8 8) (256 . |reduce|)
              (|U32Vector|) (262 . |construct|)
              (|U32VectorPolynomialOperations|) (267 . |differentiate|)
              (274 . |pow|) (282 . |truncated_multiplication|)
              (|Mapping| 107 107 107) (|List| 107) (290 . |reduce|) (|Void|)
              (296 . |copy_first|) (|UnivariateFormalPowerSeries| 6) (303 . ^)
              (309 . *) (|Mapping| 118 118 118) (|List| 118) (315 . |reduce|)
              (321 . ^) (|Mapping| 6 6) (327 . |map|)
              (|UnivariateFormalPowerSeriesFunctions| 6) (333 . |hadamard|)
              (|SparseMultivariatePolynomial| 6 75) (339 . ^)
              (|Mapping| 129 129) (|UnivariateFormalPowerSeries| 129)
              (345 . |map|) (|UnivariateFormalPowerSeriesFunctions| 129)
              (351 . |hadamard|) (|Mapping| 132 132 132) (|List| 132)
              (357 . |reduce|) (|Stream| 118) (|Mapping| 118 85)
              (|StreamFunctions2| 85 118) (363 . |map|) (369 . |0|) (373 . |0|)
              (|Vector| 107) (377 . |setelt!|) (384 . ~=)
              (390 . |differentiate|) (396 . |0|) (400 . *) (|Vector| 132)
              (406 . |setelt!|) (|Union| % '"failed") (413 . |subtractIfCan|)
              (|List| 100) (419 . |position|) (|Reference| 155) (425 . |deref|)
              (430 . |coerce|) (435 . |partition|) (|Reference| 99)
              (440 . |deref|) (445 . |setref|) (451 . |setref|) (457 . |max|)
              (463 . |first|) (|Mapping| 64 85) (|ListFunctions2| 85 64)
              (468 . |map|) (474 . |reduce|) (480 . |ref|) (485 . |ref|)
              (490 . |#|) (495 . |1|) (499 . |first|) (504 . |vector|)
              (509 . |vector|) (|Stream| 8) (|Mapping| 8 85)
              (|StreamFunctions2| 85 8) (514 . |map|) (520 . |empty?|)
              (525 . -) (531 . |max|) (|Stream| 75) (|Mapping| 75 85 75)
              (|StreamFunctions2| 85 75) (537 . |scan|) (544 . D) (551 . D)
              (557 . D) (|FractionFreeFastGaussian| 7 52) (563 . |DiffAction|)
              (|FractionFreeFastGaussian| 129 132) (570 . |DiffAction|)
              (577 . |DiffC|) (582 . |1|) (586 . |maxMixedDegree|)
              (591 . |displayKind|) (596 . |1|) (600 . |first|)
              (606 . |complete|) (611 . |entries|) (616 . |elt|) (622 . |1|)
              (|Mapping| 139 118) (|Mapping| 145 114 64 64) (|Mapping| 207 75)
              (|Mapping| 151 132) (|Mapping| 209 308) (|Mapping| 178 8 22)
              (|Mapping| 7 75 75 52) (|Mapping| 129 75 75 132)
              (|Mapping| 8 75 22 8) (|Mapping| 31 75)
              (|Record| (|:| |degreeStream| 185) (|:| |guessStream| 206)
                        (|:| |guessModGen| 208) (|:| |testGen| 210)
                        (|:| |exprStream| 211) (|:| |kind| 22) (|:| |qvar| 22)
                        (|:| A 212) (|:| AF 213) (|:| AX 214) (|:| C 215))
              |GUESS;diffHP;LR;43| (626 . |elt|) (632 . |functionNames|)
              (637 . ~=) (643 . |coerce|) (648 . ~=) (|List| 12) (654 . |elt|)
              (|Mapping| 75 85) (660 . |map|) |GUESS;algDepHP;LLR;47|
              (666 . |eval|) (673 . |multiplyExponents|)
              (679 . |multiplyExponents|) |GUESS;substHP;LR;51|
              (685 . |coerce|) (690 . *) (|Mapping| 6 64)
              (696 . |multiplyCoefficients|) (702 . |coerce|)
              (|Mapping| 129 64) (707 . |multiplyCoefficients|) (713 . |zero?|)
              (718 . =) (|Mapping| 216 13) (724 . |diffHP|) (729 . |coerce|)
              (734 . |factorial|) (739 . /) (745 . |0|) (749 . -)
              (755 . |quoByVar|) (|Mapping| 118 118) (|MappingPackage1| 118)
              (760 . ^) (766 . |quoByVar|) (|Mapping| 132 132)
              (|MappingPackage1| 132) (771 . ^)
              (|IntegerCombinatoricFunctions| 64) (777 . |stirling2|)
              (783 . |ShiftAction|) (790 . |ShiftAction|) (797 . |ShiftC|)
              (802 . |1|) (806 . |monomial|) (812 . -) (818 . |recip|)
              (823 . |1|) (827 . |monomial|) (833 . -) (839 . |recip|)
              (844 . |elt|) |GUESS;shiftHP;LR;68| (850 . *) (856 . ^)
              (862 . |coerce|) (867 . |qShiftAction|) (875 . |qShiftAction|)
              (883 . |qShiftC|) (889 . *) (895 . |elt|) (|Mapping| 122 118)
              (|StreamTensor| 118) (901 . |tensorMap|) (907 . |#|)
              (912 . |new|) (|SingleInteger|) (918 . |1|) (922 . ^)
              (928 . |rem|) (934 . |setelt!|) (|Fraction| 64) (941 . /)
              (947 . |ceiling|) (952 . |rest|) (957 . |copy|) (962 . |elt|)
              (968 . |cons|) (974 . |reverse!|) (|List| 145) (979 . |cons|)
              (985 . |rem|) (991 . -) (996 . |reverse!|) (|List| %)
              (1001 . |concat|) (1006 . |0|) (|Mapping| 314 75)
              (|StreamTensor| 75) (1010 . |tensorMap|) (|List| 73)
              (1016 . |first|) (1021 . >) (1027 . *) (1033 . |elt|)
              (1039 . |concat|) (|List| 75) (1045 . |cons|) (1051 . |reverse!|)
              (|Mapping| 11 8) (|StreamTensor| 8) (1056 . |tensorMap|)
              (1062 . |shiftHP|) (1067 . |zero?|) (1072 . |leadingCoefficient|)
              (1077 . |degree|) (1082 . |reductum|) (|Stream| 6)
              (1087 . |coerce|) (1092 . |series|) (|List| 129) (|Stream| 129)
              (1097 . |coerce|) (|IndexedExponents| 75) (1102 . |monomial|)
              (1108 . |monomial|) (|StreamFunctions2| 64 129) (1114 . |map|)
              (1120 . |concat|) (1126 . |series|)
              (|SparseUnivariatePolynomial| 129) (|Mapping| 129 6)
              (|SparseUnivariatePolynomialFunctions2| 6 129) (1131 . |map|)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1137 . |univariatePolynomial|) (1143 . |makeSUP|) (|List| 50)
              (|Mapping| 50 118) (|ListFunctions2| 118 50) (1148 . |map|)
              (1154 . |zero?|) (1159 . |allDegrees|) (1164 . |maxDegree|)
              (|Union| '"skip" '"MonteCarlo" '"deterministic") (1169 . |check|)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 354 375)
              (|ModularHermitePadeSolver| 6 7) (1174 . |gen_Monte_Carlo_check|)
              (1184 . |debug|) (|OutputPackage|) (1189 . |output|)
              (|Union| 378 89) (1194 . |HP_solve|) (1205 . |elt|)
              (1211 . |setelt!|) (1218 . +) (1224 . +) (1230 . +) (1236 . +)
              (1242 . +) (|Mapping| 75 75 75) (1248 . |reduce|)
              (1254 . |first|) (1260 . |complete|) (1265 . |entries|)
              (|List| 52) (|Vector| 52) (1270 . |vector|) (|Matrix| 52)
              (1275 . |generalInterpolation|) (|Vector| 50) (1283 . |vector|)
              (|FractionFreeFastGaussianFractions| 7 52 50)
              (1288 . |generalInterpolation|) (1296 . |column|)
              (1302 . |entries|) (1307 . |0|) (1311 . |zero?|) (1316 . |elt|)
              (1323 . |leadingCoefficient|) (1328 . |content|) (1333 . |gcd|)
              (1338 . |exquo|) (1344 . |setelt!|) (1352 . |explicitlyEmpty?|)
              (|Stream| 378) (1357 . |empty|) (1361 . |empty?|) (1366 . |frst|)
              (1371 . >=) (|Mapping| 89 64) (1377 . |every?|) (1383 . |rst|)
              (1388 . |concat|) (|Mapping| %) (1394 . |delay|)
              (|Mapping| 64 75) (|ListFunctions2| 75 64) (1399 . |map|)
              (|Stream| 314) (1405 . |genVectorStream|) (|Mapping| 85 314)
              (|StreamFunctions2| 314 85) (1412 . |map|) (1418 . |empty|)
              (1422 . |concat|) (|Vector| 6) (1428 . |vector|)
              (1433 . |checkExtraValues|) (|SingletonAsOrderedSet|)
              (1438 . |create|) (1442 . |coerce|) (1447 . |elt|)
              (1453 . |eval|) (1460 . |retract|) (1465 . |elt|) (1471 . |gcd|)
              (1477 . |exquo|) (1483 . *) (1489 . ~=) (1495 . *) (1501 . +)
              (1507 . ~=) (|Vector| 7) (1513 . |elt|) (1519 . |elt|)
              (1525 . |zero?|) (1530 . |zero?|) (1535 . |zero?|)
              (1540 . |zero?|) (1545 . |zero?|) (1550 . |zero?|)
              (|Mapping| 89 6) (1555 . |every?|) (|List| 338) (|Vector| 338)
              (1561 . |vector|) (1566 . |generalCoefficient|) (1574 . |zero?|)
              (|OutputForm|) (1579 . |message|) (1584 . |print|)
              (1589 . |coerce|) (1594 . |hconcat|) (1600 . |ground?|)
              (1605 . |variableName|) (1610 . |numerator|) (1615 . |indexName|)
              (|Mapping| 8 6) (|StreamFunctions2| 6 8) (1620 . |map|)
              (|BasicOperator|) (|RecurrenceOperator| 64 8) (1626 . |makeFEq|)
              (1636 . |makeRec|) (1645 . |safety|) (1650 . |functionName|)
              (1655 . |operator|) (1660 . |elt|) (1666 . |rest|)
              (1672 . |empty?|) (1677 . |coerce|) (1682 . |hconcat|)
              (1687 . |output|) (1692 . |first|) (1698 . |complete|)
              (1703 . |entries|) (1708 . |coerce|) (1713 . |empty?|)
              (1718 . |first|) (1723 . |rst|) (1728 . |member?|) (1734 . |one|)
              (|GuessOption|) (1739 . |Somos|) (|List| 13) (1744 . |concat|)
              (1749 . |homogeneous|) (1754 . |maxPower|) (1759 . |concat|)
              (1765 . |checkOptions|) (1770 . |displayKind|)
              (1775 . |maxSubst|) (1780 . |append|) (1786 . |append|)
              |GUESS;guessAlgDep;LLL;98| |GUESS;guessAlgDep;LL;99|
              |GUESS;guessADE;LLL;100| |GUESS;guessADE;LL;101|
              (1792 . |maxDerivative|) |GUESS;guessAlg;LLL;102|
              |GUESS;guessAlg;LL;103| |GUESS;guessHolo;LLL;104|
              |GUESS;guessHolo;LL;105| (1797 . |allDegrees|) (1802 . |concat|)
              |GUESS;guessPade;LLL;106| |GUESS;guessPade;LL;107|
              |GUESS;guessFE;LLL;108| |GUESS;guessFE;LL;109| (1807 . |cons|)
              (1813 . |empty?|) (1818 . |reverse!|) (1823 . |guessADE|)
              (1828 . |guessHolo|) |GUESS;guessRec;LLL;112|
              |GUESS;guessRec;LL;113| |GUESS;guessPRec;LLL;114|
              |GUESS;guessPRec;LL;115| (1833 . |maxShift|)
              |GUESS;guessRat;LLL;116| |GUESS;guessRat;LL;117|
              (1838 . |guessRec|) (1843 . |guessPRec|) (1848 . |guessRat|)
              (1853 . |maxLevel|) (1858 . |coerce|) (1863 . |member?|)
              (1869 . |member?|) (1875 . |elt|) (1881 . /) (1887 . |one?|)
              (1892 . |one?|) (1897 . |one?|) (1902 . |one?|) (1907 . |one?|)
              (1912 . |one?|) (1917 . |one?|) (1922 . |one?|) (1927 . |one?|)
              (1932 . |coerce|) (|List| 449) (1937 . |subscript|)
              (1943 . |indexName|) (1948 . |maxLevel|) (|List| 21)
              |GUESS;guess;LLLLL;121| (|Segment| 8) (1953 . SEGMENT)
              (|SegmentBinding| 8) (1959 . |equation|) (|SegmentBinding| %)
              (1965 . |product|) (1971 . -) (1977 . =) (1983 . |summation|)
              |GUESS;guess;LL;122| |GUESS;guess;LLL;123|
              |GUESS;guess;LLLL;124|)
           '#(|substHP| 1989 |shiftHP| 1994 |guessRec| 2004 |guessRat| 2020
              |guessPade| 2036 |guessPRec| 2047 |guessHolo| 2063 |guessFE| 2079
              |guessExpRat| 2090 |guessBinRat| 2106 |guessAlgDep| 2122
              |guessAlg| 2133 |guessADE| 2144 |guess| 2160 |diffHP| 2186
              |algDepHP| 2196)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|guess| ((|List| |#3|) (|List| |#1|))) T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List|
                                        (|Mapping| (|List| |#3|) (|List| |#1|)
                                                   (|List| (|GuessOption|))))
                                       (|List| (|Symbol|))))
                                     T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List|
                                        (|Mapping| (|List| |#3|) (|List| |#1|)
                                                   (|List| (|GuessOption|))))
                                       (|List| (|Symbol|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessExpRat|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessExpRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessBinRat|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessBinRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessExpRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessBinRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessAlgDep|
                                      ((|List| |#3|) (|List| (|List| |#1|))))
                                     T)
                                   '((|guessAlgDep|
                                      ((|List| |#3|) (|List| (|List| |#1|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessADE| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessADE|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessFE| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessFE|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessAlg| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessAlg|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessHolo|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessHolo|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPade|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPade|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRec| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRec|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPRec|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPRec|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessRat| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|algDepHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|List| |#1|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|diffHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|substHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|shiftHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|shiftHP|
                                      ((|Mapping|
                                        (|Record|
                                         (|:| |degreeStream|
                                              (|Stream|
                                               (|NonNegativeInteger|)))
                                         (|:| |guessStream|
                                              (|Mapping|
                                               (|Stream|
                                                (|UnivariateFormalPowerSeries|
                                                 |#1|))
                                               (|UnivariateFormalPowerSeries|
                                                |#1|)))
                                         (|:| |guessModGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector| (|U32Vector|))
                                                (|List| (|U32Vector|))
                                                (|Integer|) (|Integer|))
                                               (|NonNegativeInteger|)))
                                         (|:| |testGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector|
                                                 (|UnivariateFormalPowerSeries|
                                                  (|SparseMultivariatePolynomial|
                                                   |#1|
                                                   (|NonNegativeInteger|))))
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|List| (|PositiveInteger|))))
                                         (|:| |exprStream|
                                              (|Mapping| (|Stream| |#3|) |#3|
                                                         (|Symbol|)))
                                         (|:| |kind| (|Symbol|))
                                         (|:| |qvar| (|Symbol|))
                                         (|:| A
                                              (|Mapping| |#2|
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)
                                                         (|SparseUnivariatePolynomial|
                                                          |#2|)))
                                         (|:| AF
                                              (|Mapping|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|))
                                               (|NonNegativeInteger|)
                                               (|NonNegativeInteger|)
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1|
                                                 (|NonNegativeInteger|)))))
                                         (|:| AX
                                              (|Mapping| |#3|
                                                         (|NonNegativeInteger|)
                                                         (|Symbol|) |#3|))
                                         (|:| C
                                              (|Mapping| (|List| |#2|)
                                                         (|NonNegativeInteger|))))
                                        (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|diffHP|
                                      ((|Mapping|
                                        (|Record|
                                         (|:| |degreeStream|
                                              (|Stream|
                                               (|NonNegativeInteger|)))
                                         (|:| |guessStream|
                                              (|Mapping|
                                               (|Stream|
                                                (|UnivariateFormalPowerSeries|
                                                 |#1|))
                                               (|UnivariateFormalPowerSeries|
                                                |#1|)))
                                         (|:| |guessModGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector| (|U32Vector|))
                                                (|List| (|U32Vector|))
                                                (|Integer|) (|Integer|))
                                               (|NonNegativeInteger|)))
                                         (|:| |testGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector|
                                                 (|UnivariateFormalPowerSeries|
                                                  (|SparseMultivariatePolynomial|
                                                   |#1|
                                                   (|NonNegativeInteger|))))
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|List| (|PositiveInteger|))))
                                         (|:| |exprStream|
                                              (|Mapping| (|Stream| |#3|) |#3|
                                                         (|Symbol|)))
                                         (|:| |kind| (|Symbol|))
                                         (|:| |qvar| (|Symbol|))
                                         (|:| A
                                              (|Mapping| |#2|
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)
                                                         (|SparseUnivariatePolynomial|
                                                          |#2|)))
                                         (|:| AF
                                              (|Mapping|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|))
                                               (|NonNegativeInteger|)
                                               (|NonNegativeInteger|)
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1|
                                                 (|NonNegativeInteger|)))))
                                         (|:| AX
                                              (|Mapping| |#3|
                                                         (|NonNegativeInteger|)
                                                         (|Symbol|) |#3|))
                                         (|:| C
                                              (|Mapping| (|List| |#2|)
                                                         (|NonNegativeInteger|))))
                                        (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessRec|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessPRec|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessADE|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessHolo|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 558
                                            '(2 14 11 12 13 15 2 14 11 12 13 18
                                              1 14 21 22 23 1 0 21 22 24 1 14
                                              21 22 25 1 0 21 22 26 1 7 27 0 28
                                              2 32 29 30 31 33 1 34 7 0 35 1 34
                                              7 0 36 2 27 0 0 0 37 2 39 29 38
                                              12 40 2 41 0 0 0 42 2 29 27 43 0
                                              44 1 8 0 22 45 2 47 11 46 27 48 1
                                              34 0 7 49 2 53 50 51 52 54 1 56
                                              55 13 57 1 56 58 13 59 1 56 60 13
                                              61 1 56 58 13 62 2 65 63 64 64 66
                                              1 64 0 0 67 2 69 0 68 64 70 0 6 0
                                              71 0 7 0 72 0 73 0 74 2 75 0 0 0
                                              76 3 65 63 64 64 64 77 2 80 78 79
                                              69 81 1 65 63 64 82 1 83 63 78 84
                                              2 63 0 85 0 86 1 65 63 63 87 1 85
                                              75 0 88 2 75 89 0 0 90 2 63 0 91
                                              0 92 2 8 0 0 0 93 2 64 0 0 0 94 0
                                              75 0 95 3 85 64 96 0 64 97 2 64
                                              89 0 0 98 1 100 99 85 101 1 85 64
                                              0 102 2 8 0 0 75 103 2 8 0 0 0
                                              104 2 11 8 105 0 106 1 107 0 85
                                              108 3 109 107 107 75 64 110 4 109
                                              107 107 73 75 64 111 4 109 107
                                              107 107 64 64 112 2 114 107 113 0
                                              115 3 109 116 107 107 64 117 2
                                              118 0 0 75 119 2 118 0 0 0 120 2
                                              122 118 121 0 123 2 6 0 0 75 124
                                              2 118 0 125 0 126 2 127 118 118
                                              118 128 2 129 0 0 75 130 2 132 0
                                              131 0 133 2 134 132 132 132 135 2
                                              137 132 136 0 138 2 141 139 140
                                              63 142 0 6 0 143 0 7 0 144 3 145
                                              107 0 64 107 146 2 75 89 0 0 147
                                              2 109 107 107 64 148 0 132 0 149
                                              2 132 0 0 0 150 3 151 132 0 64
                                              132 152 2 100 153 0 0 154 2 155
                                              64 100 0 156 1 157 155 0 158 1
                                              100 85 0 159 1 100 0 85 160 1 161
                                              99 0 162 2 161 99 0 99 163 2 157
                                              155 0 155 164 2 64 0 0 0 165 1 85
                                              64 0 166 2 168 85 167 99 169 2 85
                                              64 96 0 170 1 161 0 99 171 1 157
                                              0 155 172 1 114 75 0 173 0 75 0
                                              174 1 114 107 0 175 1 145 0 114
                                              176 1 151 0 137 177 2 180 178 179
                                              63 181 1 85 89 0 182 2 64 0 0 0
                                              183 2 75 0 0 0 184 3 187 185 75
                                              186 63 188 3 8 0 0 22 75 189 2
                                              118 0 0 75 190 2 132 0 0 75 191 3
                                              192 7 75 75 52 193 3 194 129 75
                                              75 132 195 1 192 31 75 196 0 8 0
                                              197 1 56 75 13 198 1 56 22 13 199
                                              0 118 0 200 2 63 0 0 75 201 1 63
                                              0 0 202 1 63 99 0 203 2 63 85 0
                                              64 204 0 132 0 205 2 11 8 0 64
                                              218 1 56 27 13 219 2 64 89 0 0
                                              220 1 22 0 41 221 2 22 89 0 0 222
                                              2 223 12 0 64 224 2 187 185 225
                                              63 226 3 8 0 0 0 0 228 2 118 0 0
                                              73 229 2 132 0 0 73 230 1 6 0 22
                                              232 2 64 0 75 0 233 2 118 0 234 0
                                              235 1 129 0 6 236 2 132 0 237 0
                                              238 1 64 89 0 239 2 22 89 0 0 240
                                              1 0 241 22 242 1 8 0 64 243 1 64
                                              0 0 244 2 8 0 0 0 245 0 8 0 246 2
                                              8 0 0 0 247 1 118 0 0 248 2 250
                                              249 249 75 251 1 132 0 0 252 2
                                              254 253 253 75 255 2 256 64 64 64
                                              257 3 192 7 75 75 52 258 3 194
                                              129 75 75 132 259 1 192 31 75 260
                                              0 50 0 261 2 118 0 6 75 262 2 118
                                              0 0 0 263 1 118 153 0 264 0 129 0
                                              265 2 132 0 129 75 266 2 132 0 0
                                              0 267 1 132 153 0 268 2 185 75 0
                                              64 269 2 8 0 75 0 271 2 8 0 0 0
                                              272 1 7 0 22 273 4 192 7 7 75 75
                                              52 274 4 194 129 129 75 75 132
                                              275 2 192 31 7 75 276 2 118 0 6 0
                                              277 2 118 0 0 0 278 2 280 139 139
                                              279 281 1 107 75 0 282 2 107 0 75
                                              64 283 0 284 0 285 2 64 0 0 75
                                              286 2 64 0 0 0 287 3 107 64 0 64
                                              64 288 2 289 0 64 64 290 1 289 64
                                              0 291 1 114 0 0 292 1 107 0 0 293
                                              2 107 64 0 64 294 2 114 0 107 0
                                              295 1 114 0 0 296 2 297 0 145 0
                                              298 2 75 0 0 0 299 1 284 0 0 300
                                              1 297 0 0 301 1 145 0 302 303 0
                                              284 0 304 2 306 185 185 305 307 1
                                              308 73 0 309 2 73 89 0 0 310 2
                                              132 0 129 0 311 2 132 0 0 0 312 2
                                              137 0 0 0 313 2 314 0 75 0 315 1
                                              137 0 0 316 2 318 178 178 317 319
                                              1 0 241 22 320 1 50 89 0 321 1 50
                                              6 0 322 1 50 75 0 323 1 50 0 0
                                              324 1 325 0 12 326 1 118 0 325
                                              327 1 329 0 328 330 2 331 0 75 75
                                              332 2 129 0 6 331 333 2 334 329
                                              237 69 335 2 329 0 0 0 336 1 132
                                              0 329 337 2 340 338 339 50 341 2
                                              118 342 0 75 343 1 342 50 0 344 2
                                              347 345 346 122 348 1 6 89 0 349
                                              1 56 89 13 350 1 56 60 13 351 1
                                              56 352 13 353 6 356 355 355 223
                                              22 22 75 207 357 1 56 89 13 358 1
                                              359 116 41 360 7 356 361 223 85
                                              22 22 75 207 355 362 2 314 75 0
                                              64 363 3 314 75 0 64 75 364 2 118
                                              0 0 0 365 2 132 0 0 0 366 2 7 0 0
                                              0 367 2 50 0 0 0 368 2 6 0 0 0
                                              369 2 314 75 370 0 371 2 139 0 0
                                              75 372 1 139 0 0 373 1 139 122 0
                                              374 1 376 0 375 377 4 192 378 31
                                              212 376 314 379 1 380 0 345 381 4
                                              382 378 31 212 380 314 383 2 378
                                              376 0 64 384 1 376 375 0 385 0 52
                                              0 386 1 7 89 0 387 3 378 52 0 64
                                              64 388 1 52 7 0 389 1 52 7 0 390
                                              1 7 0 302 391 2 52 153 0 7 392 4
                                              378 52 0 64 64 52 393 1 63 89 0
                                              394 0 395 0 396 1 63 89 0 397 1
                                              63 85 0 398 2 64 89 0 0 399 2 85
                                              89 400 0 401 1 63 0 0 402 2 395 0
                                              378 0 403 1 395 0 404 405 2 407
                                              85 406 314 408 3 192 409 75 75 75
                                              410 2 412 63 411 409 413 0 63 0
                                              414 2 63 0 85 0 415 1 416 0 12
                                              417 1 56 89 13 418 0 419 0 420 1
                                              7 0 64 421 2 376 52 0 64 422 3 52
                                              0 0 419 7 423 1 52 7 0 424 2 416
                                              6 0 64 425 2 7 0 0 0 426 2 7 153
                                              0 0 427 2 7 0 0 0 428 2 7 89 0 0
                                              429 2 34 0 7 0 430 2 34 0 0 0 431
                                              2 34 89 0 0 432 2 433 7 0 64 434
                                              2 375 52 0 64 435 1 52 89 0 436 1
                                              8 89 0 437 1 118 89 0 438 1 132
                                              89 0 439 1 75 89 0 440 1 378 89 0
                                              441 2 12 89 442 0 443 1 445 0 444
                                              446 4 194 129 213 151 75 445 447
                                              1 129 89 0 448 1 449 0 41 450 1
                                              449 116 0 451 1 64 449 0 452 2
                                              449 0 0 0 453 1 129 89 0 454 1 56
                                              22 13 455 1 8 0 0 456 1 56 22 13
                                              457 2 459 178 458 325 460 6 462 8
                                              461 22 22 8 11 178 463 5 462 8
                                              461 22 8 11 178 464 1 56 75 13
                                              465 1 56 22 13 466 1 461 0 22 467
                                              2 8 0 461 0 468 2 185 0 0 75 469
                                              1 185 89 0 470 1 75 449 0 471 1
                                              449 0 302 472 1 359 116 449 473 2
                                              178 0 0 75 474 1 178 0 0 475 1
                                              178 11 0 476 1 11 449 0 477 1 395
                                              89 0 478 1 395 378 0 479 1 395 0
                                              0 480 2 11 89 8 0 481 1 56 89 13
                                              482 1 483 0 58 484 1 485 0 302
                                              486 1 483 0 58 487 1 483 0 55 488
                                              2 13 0 0 0 489 1 56 116 13 490 1
                                              483 0 22 491 1 483 0 55 492 2 13
                                              0 0 0 493 2 11 0 0 0 494 1 483 0
                                              60 499 1 483 0 89 504 1 13 0 302
                                              505 2 13 0 483 0 510 1 11 89 0
                                              511 1 11 0 0 512 1 0 21 22 513 1
                                              0 21 22 514 1 483 0 60 519 1 0 21
                                              22 522 1 0 21 22 523 1 0 21 22
                                              524 1 56 60 13 525 1 60 449 0 526
                                              2 27 89 22 0 527 2 12 89 6 0 528
                                              2 12 6 0 64 529 2 6 0 0 0 530 1 8
                                              89 0 531 1 118 89 0 532 1 64 89 0
                                              533 1 132 89 0 534 1 75 89 0 535
                                              1 7 89 0 536 1 50 89 0 537 1 52
                                              89 0 538 1 6 89 0 539 1 73 449 0
                                              540 2 22 0 0 541 542 1 483 0 22
                                              543 1 483 0 60 544 2 547 0 8 8
                                              548 2 549 0 22 547 550 2 8 0 0
                                              551 552 2 6 0 0 0 553 2 6 89 0 0
                                              554 2 8 0 0 551 555 1 0 216 13
                                              231 1 0 216 13 270 1 1 241 22 320
                                              1 0 11 12 516 2 0 11 12 13 515 1
                                              1 21 22 522 1 0 11 12 521 2 0 11
                                              12 13 520 1 1 21 22 524 1 0 11 12
                                              507 2 0 11 12 13 506 2 0 11 12 13
                                              517 1 0 11 12 518 1 1 21 22 523 2
                                              0 11 12 13 502 1 0 11 12 503 1 1
                                              21 22 514 1 0 11 12 509 2 0 11 12
                                              13 508 1 0 11 12 16 2 0 11 12 13
                                              17 1 1 21 22 24 2 0 11 12 13 20 1
                                              0 11 12 19 1 1 21 22 26 2 0 11
                                              223 13 495 1 0 11 223 496 2 0 11
                                              12 13 500 1 0 11 12 501 1 0 11 12
                                              498 2 0 11 12 13 497 1 1 21 22
                                              513 3 0 11 12 545 27 558 4 0 11
                                              12 545 27 13 546 1 0 11 12 556 2
                                              0 11 12 13 557 1 0 216 13 217 1 1
                                              241 22 242 2 0 216 223 13
                                              227)))))
           '|lookupComplete|)) 
