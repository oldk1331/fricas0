
(SDEFUN |TREEOUT;outputNofLeaves;Nni;1| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 10) (QREFELT % 11))) 

(SDEFUN |TREEOUT;outputNofLeaves;2Nni;2|
        ((|n| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SEQ (SETELT % 10 (SPADCALL |n| (QREFELT % 9))) (EXIT |n|))) 

(SDEFUN |TREEOUT;outputDepth;Nni;3| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 14) (QREFELT % 11))) 

(SDEFUN |TREEOUT;outputDepth;2Nni;4|
        ((|d| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SEQ (SETELT % 14 (SPADCALL |d| (QREFELT % 9))) (EXIT |d|))) 

(SDEFUN |TREEOUT;arrayToOutputForm|
        ((|ar| (|TwoDimensionalArray| (|OutputForm|))) (% (|OutputForm|)))
        (SPROG
         ((|lili| (|List| (|List| (|OutputForm|)))) (#1=#:G19 NIL) (|li| NIL)
          (#2=#:G20 NIL) (#3=#:G21 NIL) (|lie| NIL) (#4=#:G22 NIL)
          (|lr| (|List| (|OutputForm|))))
         (SEQ
          (LETT |lili|
                (SPADCALL (SPADCALL |ar| (QREFELT % 18)) (QREFELT % 20)))
          (LETT |lr|
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |li| NIL) (LETT #2# |lili|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |li| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (SPADCALL
                                (PROGN
                                 (LETT #3# NIL)
                                 (SEQ (LETT |lie| NIL) (LETT #4# |li|) G190
                                      (COND
                                       ((OR (ATOM #4#)
                                            (PROGN (LETT |lie| (CAR #4#)) NIL))
                                        (GO G191)))
                                      (SEQ (EXIT (LETT #3# (CONS |lie| #3#))))
                                      (LETT #4# (CDR #4#)) (GO G190) G191
                                      (EXIT (NREVERSE #3#))))
                                (QREFELT % 23))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#)))))
          (EXIT (SPADCALL |lr| (QREFELT % 24)))))) 

(SDEFUN |TREEOUT;join|
        ((|lf|
          (|List|
           (|Record| (|:| |arrP| (|TwoDimensionalArray| (|OutputForm|)))
                     (|:| |cP| (|List| (|Integer|))))))
         (|v| (S))
         (%
          (|Record| (|:| |arrP| (|TwoDimensionalArray| (|OutputForm|)))
                    (|:| |cP| (|List| (|Integer|))))))
        (SPROG
         ((|p1| #1=(|Integer|)) (|lm| (|List| #2=(|Integer|))) (|f2| NIL)
          (#3=#:G48 NIL) (|r1| #4=(|Integer|)) (|m| (|Integer|)) (|m'| #2#)
          (|mC| (|Boolean|)) (|lp| (|List| #1#)) (|c1| #5=(|Integer|))
          (|r2| #4#) (|c2| #5#) (|r| #2#) (|c| (|Integer|)) (#6=#:G28 NIL)
          (#7=#:G29 NIL) (#8=#:G31 NIL) (#9=#:G32 NIL) (#10=#:G33 NIL)
          (|rightColumns| (|TwoDimensionalArray| (|OutputForm|)))
          (|cv| (|OutputForm|)) (#11=#:G37 NIL)
          (|leftColumns| (|TwoDimensionalArray| (|OutputForm|))) (|i| NIL)
          (#12=#:G49 NIL) (#13=#:G50 NIL) (|p| NIL) (#14=#:G51 NIL))
         (SEQ
          (COND
           ((NULL |lf|) (|error| "join: first argument should not be empty."))
           ((NULL (CDR |lf|)) (|SPADfirst| |lf|))
           ('T
            (SEQ
             (LETT |rightColumns|
                   (SPADCALL (QCAR (|SPADfirst| |lf|)) (QREFELT % 25)))
             (LETT |p1| (|SPADfirst| (QCDR (|SPADfirst| |lf|))))
             (LETT |lp| (LIST |p1|))
             (LETT |r1| (SPADCALL |rightColumns| (QREFELT % 27)))
             (LETT |lm| (LIST (+ |r1| 1))) (LETT |m| 0) (LETT |m'| (+ |r1| 1))
             (LETT |mC| 'T)
             (SEQ (LETT |f2| NIL) (LETT #3# (CDR |lf|)) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |f2| (CAR #3#)) NIL))
                    (GO G191)))
                  (SEQ (LETT |r1| (SPADCALL |rightColumns| (QREFELT % 27)))
                       (COND
                        (|mC|
                         (SEQ (LETT |m| |m'|)
                              (LETT |m'| (+ |m| (|SPADfirst| (QCDR |f2|))))
                              (EXIT (LETT |mC| NIL))))
                        ('T
                         (SEQ (LETT |m| |m'|) (LETT |m'| (+ |r1| 1))
                              (EXIT (LETT |mC| 'T)))))
                       (LETT |lp|
                             (SPADCALL |lp|
                                       (+ (+ |r1| (|SPADfirst| (QCDR |f2|))) 1)
                                       (QREFELT % 29)))
                       (LETT |c1| (SPADCALL |rightColumns| (QREFELT % 30)))
                       (LETT |r2| (SPADCALL (QCAR |f2|) (QREFELT % 27)))
                       (LETT |c2| (SPADCALL (QCAR |f2|) (QREFELT % 30)))
                       (LETT |r| (+ (+ |r1| |r2|) 1))
                       (LETT |c| (MAX |c1| |c2|))
                       (COND
                        ((< |c1| |c|)
                         (LETT |rightColumns|
                               (SPADCALL |rightColumns|
                                         (MAKE_MATRIX1
                                          (PROG1 (LETT #6# |r1|)
                                            (|check_subtype2| (>= #6# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #6#))
                                          (PROG1 (LETT #7# (- |c| |c1|))
                                            (|check_subtype2| (>= #7# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #7#))
                                          (SPADCALL " " (QREFELT % 32)))
                                         (QREFELT % 33)))))
                       (COND
                        ((< |c2| |c|)
                         (PROGN
                          (RPLACA |f2|
                                  (SPADCALL
                                   (SPADCALL (QCAR |f2|) (QREFELT % 25))
                                   (MAKE_MATRIX1
                                    (PROG1 (LETT #8# |r2|)
                                      (|check_subtype2| (>= #8# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #8#))
                                    (PROG1 (LETT #9# (- |c| |c2|))
                                      (|check_subtype2| (>= #9# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #9#))
                                    (SPADCALL " " (QREFELT % 32)))
                                   (QREFELT % 33)))
                          (QCAR |f2|))))
                       (LETT |rightColumns|
                             (SPADCALL |rightColumns|
                                       (MAKE_MATRIX1 1
                                                     (PROG1 (LETT #10# |c|)
                                                       (|check_subtype2|
                                                        (>= #10# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #10#))
                                                     (SPADCALL " "
                                                               (QREFELT % 32)))
                                       (QREFELT % 34)))
                       (EXIT
                        (LETT |rightColumns|
                              (SPADCALL |rightColumns| (QCAR |f2|)
                                        (QREFELT % 34)))))
                  (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
             (LETT |cv| (SPADCALL |v| (QREFELT % 35)))
             (LETT |leftColumns|
                   (MAKE_MATRIX1
                    (PROG1 (LETT #11# |r|)
                      (|check_subtype2| (>= #11# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #11#))
                    4 (SPADCALL " " (QREFELT % 32))))
             (SPADCALL |leftColumns| |m| 1 |cv| (QREFELT % 36))
             (SEQ (LETT |i| (|SPADfirst| |lp|))
                  (LETT #12# (SPADCALL |lp| (QREFELT % 37))) G190
                  (COND ((> |i| #12#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |leftColumns| |i| 3 (SPADCALL "|" (QREFELT % 32))
                              (QREFELT % 36))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (SPADCALL |leftColumns| |m| 2 (SPADCALL "-" (QREFELT % 32))
                       (QREFELT % 36))
             (SPADCALL |leftColumns| |m| 3 (SPADCALL "+" (QREFELT % 32))
                       (QREFELT % 36))
             (SEQ (LETT |p| NIL) (LETT #13# |lp|) G190
                  (COND
                   ((OR (ATOM #13#) (PROGN (LETT |p| (CAR #13#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |leftColumns| |p| 3 (SPADCALL "+" (QREFELT % 32))
                              (QREFELT % 36))))
                  (LETT #13# (CDR #13#)) (GO G190) G191 (EXIT NIL))
             (SEQ (LETT |p| NIL) (LETT #14# |lp|) G190
                  (COND
                   ((OR (ATOM #14#) (PROGN (LETT |p| (CAR #14#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |leftColumns| |p| 4 (SPADCALL "-" (QREFELT % 32))
                              (QREFELT % 36))))
                  (LETT #14# (CDR #14#)) (GO G190) G191 (EXIT NIL))
             (EXIT
              (CONS (SPADCALL |leftColumns| |rightColumns| (QREFELT % 33))
                    (LIST |m| |r| (+ 4 |c|)))))))))) 

(SDEFUN |TREEOUT;treeToArray|
        ((|t| (|Tree| S)) (|d| (|NonNegativeInteger|))
         (%
          (|Record| (|:| |arrP| (|TwoDimensionalArray| (|OutputForm|)))
                    (|:| |cP| (|List| (|Integer|))))))
        (SPROG
         ((|v| (S)) (#1=#:G67 NIL) (#2=#:G68 NIL) (|cV| (|List| S))
          (|lcv'| (|List| (|OutputForm|))) (|cv| NIL) (#3=#:G69 NIL)
          (|cv'| (|OutputForm|)) (|lcv| (|List| (|OutputForm|)))
          (|ar| (|TwoDimensionalArray| (|OutputForm|))) (|ch| NIL)
          (#4=#:G71 NIL) (|j| NIL) (#5=#:G70 NIL) (|lcd| (|List| (|Tree| S)))
          (#6=#:G72 NIL) (|cd| NIL) (#7=#:G73 NIL))
         (SEQ (LETT |v| (SPADCALL |t| (QREFELT % 39)))
              (LETT |lcv| (LIST (SPADCALL |v| (QREFELT % 35))))
              (LETT |ar| (MAKE_MATRIX 0 0))
              (EXIT
               (COND
                ((SPADCALL |t| (QREFELT % 41))
                 (SEQ
                  (LETT |ar| (MAKE_MATRIX1 1 3 (SPADCALL ">" (QREFELT % 32))))
                  (SPADCALL |ar| 1 1 (SPADCALL "<" (QREFELT % 32))
                            (QREFELT % 36))
                  (SPADCALL |ar| 1 2 (SPADCALL |v| (QREFELT % 35))
                            (QREFELT % 36))
                  (EXIT (CONS |ar| (LIST 1 1 3)))))
                ((EQL |d| (SPADCALL (QREFELT % 14) (QREFELT % 11)))
                 (SEQ
                  (LETT |cV|
                        (PROGN
                         (LETT #1# NIL)
                         (SEQ (LETT |ch| NIL)
                              (LETT #2# (SPADCALL |t| (QREFELT % 42))) G190
                              (COND
                               ((OR (ATOM #2#)
                                    (PROGN (LETT |ch| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #1#
                                      (CONS (SPADCALL |ch| (QREFELT % 39))
                                            #1#))))
                              (LETT #2# (CDR #2#)) (GO G190) G191
                              (EXIT (NREVERSE #1#)))))
                  (LETT |lcv'|
                        (LIST (SPADCALL "-" (QREFELT % 32))
                              (SPADCALL "[" (QREFELT % 32))))
                  (LETT |lcv| (SPADCALL |lcv| |lcv'| (QREFELT % 44)))
                  (SEQ (LETT |cv| NIL) (LETT #3# |cV|) G190
                       (COND
                        ((OR (ATOM #3#) (PROGN (LETT |cv| (CAR #3#)) NIL))
                         (GO G191)))
                       (SEQ (LETT |cv'| (SPADCALL |cv| (QREFELT % 35)))
                            (LETT |lcv| (SPADCALL |lcv| |cv'| (QREFELT % 45)))
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL |cv| (SPADCALL |cV| (QREFELT % 47))
                                          (QREFELT % 48)))
                               (LETT |lcv|
                                     (SPADCALL |lcv|
                                               (SPADCALL " " (QREFELT % 32))
                                               (QREFELT % 45)))))))
                       (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                  (LETT |lcv|
                        (SPADCALL |lcv| (SPADCALL "]" (QREFELT % 32))
                                  (QREFELT % 45)))
                  (LETT |ar|
                        (MAKE_MATRIX1 1 (LENGTH |lcv|)
                                      (SPADCALL " " (QREFELT % 32))))
                  (SEQ (LETT |ch| NIL) (LETT #4# |lcv|) (LETT |j| 1)
                       (LETT #5# (LENGTH |lcv|)) G190
                       (COND
                        ((OR (|greater_SI| |j| #5#) (ATOM #4#)
                             (PROGN (LETT |ch| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (SPADCALL |ar| 1 |j| |ch| (QREFELT % 36))))
                       (LETT |j| (PROG1 (|inc_SI| |j|) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT (CONS |ar| (LIST 1 1 (LENGTH |lcv|))))))
                ('T
                 (SEQ (LETT |lcd| (SPADCALL |t| (QREFELT % 42)))
                      (EXIT
                       (|TREEOUT;join|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |cd| NIL) (LETT #7# |lcd|) G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |cd| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (|TREEOUT;treeToArray| |cd| (+ |d| 1) %)
                                       #6#))))
                              (LETT #7# (CDR #7#)) (GO G190) G191
                              (EXIT (NREVERSE #6#))))
                        |v| %))))))))) 

(SDEFUN |TREEOUT;to_output;TOf;8| ((|t| (|Tree| S)) (% (|OutputForm|)))
        (SPROG
         ((|saveDepth| (|NonNegativeInteger|)) (|d| (|NonNegativeInteger|))
          (|out| (|OutputForm|)))
         (SEQ (LETT |saveDepth| (SPADCALL (QREFELT % 14) (QREFELT % 11)))
              (LETT |d| 0) (LETT |out| (SPADCALL (QREFELT % 49)))
              (SEQ G190
                   (COND
                    ((NULL
                      (COND
                       ((< (SPADCALL |t| (+ |d| 1) (QREFELT % 50))
                           (SPADCALL (QREFELT % 10) (QREFELT % 11)))
                        (COND
                         ((< |d| (SPADCALL |t| (QREFELT % 51)))
                          (< |d| (SPADCALL (QREFELT % 14) (QREFELT % 11))))
                         ('T NIL)))
                       ('T NIL)))
                     (GO G191)))
                   (SEQ (EXIT (LETT |d| (+ |d| 1)))) NIL (GO G190) G191
                   (EXIT NIL))
              (SETELT % 14 (SPADCALL |d| (QREFELT % 9)))
              (LETT |out|
                    (|TREEOUT;arrayToOutputForm|
                     (QCAR (|TREEOUT;treeToArray| |t| 0 %)) %))
              (SPADCALL |saveDepth| (QREFELT % 16)) (EXIT |out|)))) 

(DECLAIM (NOTINLINE |TreeOutput;|)) 

(DEFUN |TreeOutput;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|TreeOutput| DV$1))
          (LETT % (GETREFV 53))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|TreeOutput| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 10 (SPADCALL 1000 (QREFELT % 9)))
          (QSETREFV % 14 (SPADCALL 2 (QREFELT % 9)))
          %))) 

(DEFUN |TreeOutput| (#1=#:G80)
  (SPROG NIL
         (PROG (#2=#:G81)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|TreeOutput|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|TreeOutput;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#) (HREM |$ConstructorCache| '|TreeOutput|)))))))))) 

(MAKEPROP '|TreeOutput| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (|Reference| 7) (0 . |ref|) '|nofLeaves| (5 . |deref|)
              |TREEOUT;outputNofLeaves;Nni;1| |TREEOUT;outputNofLeaves;2Nni;2|
              '|depth| |TREEOUT;outputDepth;Nni;3| |TREEOUT;outputDepth;2Nni;4|
              (|TwoDimensionalArray| 22) (10 . |transpose|) (|List| 43)
              (15 . |listOfLists|) (|List| %) (|OutputForm|) (20 . |vconcat|)
              (25 . |hconcat|) (30 . |copy|) (|Integer|) (35 . |maxRowIndex|)
              (|List| 26) (40 . |concat|) (46 . |maxColIndex|) (|String|)
              (51 . |message|) (56 . |horizConcat|) (62 . |vertConcat|)
              (68 . |coerce|) (73 . |setelt!|) (81 . |last|) (|Tree| 6)
              (86 . |value|) (|Boolean|) (91 . |leaf?|) (96 . |children|)
              (|List| 22) (101 . |concat|) (107 . |concat|) (|List| 6)
              (113 . |last|) (118 . =) (124 . |empty|) (128 . |numberOfNodes|)
              (134 . |depth|) |TREEOUT;to_output;TOf;8|)
           '#(|to_output| 139 |outputNofLeaves| 144 |outputDepth| 153) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|outputDepth| ((|NonNegativeInteger|))) T)
                              '((|outputDepth|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|outputNofLeaves| ((|NonNegativeInteger|))) T)
                              '((|outputNofLeaves|
                                 ((|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|to_output| ((|OutputForm|) (|Tree| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 52
                                            '(1 8 0 7 9 1 8 7 0 11 1 17 0 0 18
                                              1 17 19 0 20 1 22 0 21 23 1 22 0
                                              21 24 1 17 0 0 25 1 17 26 0 27 2
                                              28 0 0 26 29 1 17 26 0 30 1 22 0
                                              31 32 2 17 0 0 0 33 2 17 0 0 0 34
                                              1 6 22 0 35 4 17 22 0 26 26 22 36
                                              1 28 26 0 37 1 38 6 0 39 1 38 40
                                              0 41 1 38 21 0 42 2 43 0 0 0 44 2
                                              43 0 0 22 45 1 46 6 0 47 2 6 40 0
                                              0 48 0 22 0 49 2 38 7 0 7 50 1 38
                                              7 0 51 1 0 22 38 52 1 0 7 7 13 0
                                              0 7 12 0 0 7 15 1 0 7 7 16)))))
           '|lookupComplete|)) 
