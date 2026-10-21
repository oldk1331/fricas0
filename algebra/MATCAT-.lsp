
(SDEFUN |MATCAT-;square?;SB;1| ((|x| (S)) (% (|Boolean|)))
        (EQL (SPADCALL |x| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 12)))) 

(SDEFUN |MATCAT-;diagonal?;SB;2| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G48 NIL) (|j| NIL) (#2=#:G49 NIL) (#3=#:G47 NIL)
          (#4=#:G46 NIL))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |x| (QREFELT % 15))) NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                        (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                        (COND ((> |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                               (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                               (COND ((> |j| #2#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL
                                    (- |j| (SPADCALL |x| (QREFELT % 19)))
                                    (- |i| (SPADCALL |x| (QREFELT % 17)))
                                    (QREFELT % 21))
                                   (COND
                                    ((NULL
                                      (SPADCALL
                                       (SPADCALL |x| |i| |j| (QREFELT % 22))
                                       (QREFELT % 23)))
                                     (PROGN
                                      (LETT #4#
                                            (PROGN
                                             (LETT #3# NIL)
                                             (GO #5=#:G45)))
                                      (GO #6=#:G42))))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #4#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #3#)))) 

(SDEFUN |MATCAT-;symmetric?;SB;3| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|nRows| (|Integer|)) (|mr| (|Integer|)) (|mc| (|Integer|)) (|i| NIL)
          (#1=#:G60 NIL) (|j| NIL) (#2=#:G61 NIL) (#3=#:G59 NIL)
          (#4=#:G58 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |x| (QREFELT % 12)) (QREFELT % 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT % 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT % 19)))
                  (SEQ (LETT |i| 0) (LETT #1# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| (+ |i| 1)) (LETT #2# (- |nRows| 1))
                              G190 (COND ((> |j| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                             (QREFELT % 22))
                                   (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                             (QREFELT % 22))
                                   (QREFELT % 25))
                                  (PROGN
                                   (LETT #4#
                                         (PROGN (LETT #3# NIL) (GO #5=#:G57)))
                                   (GO #6=#:G53))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #4#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #3#)))) 

(SDEFUN |MATCAT-;antisymmetric?;SB;4| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|nRows| (|Integer|)) (|mr| (|Integer|)) (|mc| (|Integer|)) (|i| NIL)
          (#1=#:G72 NIL) (|j| NIL) (#2=#:G73 NIL) (#3=#:G71 NIL)
          (#4=#:G70 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |x| (QREFELT % 12)) (QREFELT % 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT % 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT % 19)))
                  (SEQ (LETT |i| 0) (LETT #1# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| |i|) (LETT #2# (- |nRows| 1)) G190
                              (COND ((> |j| #2#) (GO G191)))
                              (SEQ
                               (EXIT
                                (COND
                                 ((SPADCALL
                                   (SPADCALL |x| (+ |mr| |i|) (+ |mc| |j|)
                                             (QREFELT % 22))
                                   (SPADCALL
                                    (SPADCALL |x| (+ |mr| |j|) (+ |mc| |i|)
                                              (QREFELT % 22))
                                    (QREFELT % 27))
                                   (QREFELT % 25))
                                  (PROGN
                                   (LETT #4#
                                         (PROGN (LETT #3# NIL) (GO #5=#:G69)))
                                   (GO #6=#:G65))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #4#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #3#)))) 

(SDEFUN |MATCAT-;zero;2NniS;5|
        ((|rows| (|NonNegativeInteger|)) (|cols| (|NonNegativeInteger|))
         (% (S)))
        (SPADCALL |rows| |cols| (|spadConstant| % 29) (QREFELT % 30))) 

(SDEFUN |MATCAT-;matrix;LS;6| ((|l| (|List| (|List| R))) (% (S)))
        (SPROG
         ((|cols| (|NonNegativeInteger|)) (#1=#:G85 NIL)
          (|rows| (|NonNegativeInteger|)) (|ans| (S)) (|ll| NIL) (#2=#:G87 NIL)
          (|i| NIL) (#3=#:G86 NIL) (|r| NIL) (#4=#:G89 NIL) (|j| NIL)
          (#5=#:G88 NIL))
         (SEQ
          (COND ((NULL |l|) (SPADCALL 0 0 (QREFELT % 32)))
                ('T
                 (SEQ (LETT |rows| 1) (LETT |cols| (LENGTH (|SPADfirst| |l|)))
                      (SEQ (LETT |ll| NIL) (LETT #1# (CDR |l|)) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |ll| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |cols| (LENGTH |ll|) (QREFELT % 33))
                               (|error| "matrix: rows of different lengths"))
                              ('T (LETT |rows| (+ |rows| 1))))))
                           (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 32)))
                      (SEQ (LETT |ll| NIL) (LETT #2# |l|)
                           (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                           (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                           (COND
                            ((OR (> |i| #3#) (ATOM #2#)
                                 (PROGN (LETT |ll| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| NIL) (LETT #4# |ll|)
                                  (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                                  (LETT #5# (SPADCALL |ans| (QREFELT % 20)))
                                  G190
                                  (COND
                                   ((OR (> |j| #5#) (ATOM #4#)
                                        (PROGN (LETT |r| (CAR #4#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |ans| |i| |j| |r|
                                              (QREFELT % 34))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT #4# (CDR #4#))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;matrix;2NniMS;7|
        ((|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
         (|f| (|Mapping| R (|Integer|) (|Integer|))) (% (S)))
        (SPROG ((|mat| (S)) (|i| NIL) (#1=#:G97 NIL) (|j| NIL) (#2=#:G98 NIL))
               (SEQ (LETT |mat| (SPADCALL |n| |m| (QREFELT % 32)))
                    (SEQ (LETT |i| (SPADCALL |mat| (QREFELT % 17)))
                         (LETT #1# (SPADCALL |mat| (QREFELT % 18))) G190
                         (COND ((> |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| (SPADCALL |mat| (QREFELT % 19)))
                                (LETT #2# (SPADCALL |mat| (QREFELT % 20))) G190
                                (COND ((> |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |mat| |i| |j|
                                            (SPADCALL |i| |j| |f|)
                                            (QREFELT % 34))))
                                (LETT |j| (+ |j| 1)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                    (EXIT |mat|)))) 

(SDEFUN |MATCAT-;get_dims|
        ((|l| (|List| S)) (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG ((#1=#:G105 NIL) (|a| NIL) (#2=#:G106 NIL))
               (SEQ
                (PROGN
                 (LETT #1# NIL)
                 (SEQ (LETT |a| NIL) (LETT #2# |l|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |a| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #1#
                              (CONS
                               (LIST (SPADCALL |a| (QREFELT % 11))
                                     (SPADCALL |a| (QREFELT % 12)))
                               #1#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #1#))))))) 

(SDEFUN |MATCAT-;zero?;SB;9| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G115 NIL) (|j| NIL) (#2=#:G116 NIL) (#3=#:G114 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 1))
                 (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (PROGN |x| 1))
                        (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (QAREF2O |x| |i| |j| 1 1)
                                      (|spadConstant| % 29) (QREFELT % 25))
                            (PROGN (LETT #3# NIL) (GO #4=#:G113))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;10|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((|ans| (S)) (|j| NIL) (#1=#:G122 NIL) (|i| NIL) (#2=#:G121 NIL))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 1))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 1))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;11| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ans| (S)) (|r| NIL) (#1=#:G129 NIL)
          (|j| NIL) (#2=#:G128 NIL) (|i| NIL) (#3=#:G127 NIL))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #1# |l|) (LETT |j| (PROGN |ans| 1))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 1))
                   (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #3#) (> |j| #2#) (ATOM #1#)
                         (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #1# (CDR #1#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;12|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|dp| (|List| (|NonNegativeInteger|)))
          (|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|a| (S)) (|m| (R))
          (#2=#:G166 NIL) (#3=#:G167 NIL) (|c_ind| (|NonNegativeInteger|))
          (#4=#:G168 NIL) (#5=#:G169 NIL) (|r_step| #6=(|NonNegativeInteger|))
          (#7=#:G170 NIL) (|rc| NIL) (#8=#:G171 NIL) (|c_step| #6#) (|i| NIL)
          (#9=#:G172 NIL) (|j| NIL) (#10=#:G173 NIL) (|aij| (R)) (|mm| (R))
          (|c_off1| (|NonNegativeInteger|)))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT % 47)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT % 47)))
              (LETT |a| (|SPADfirst| |l|))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #3# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #3#) (GO G191)))
                                         (SEQ
                                          (QSETAREF2O |res| |r_off| |c_ind|
                                                      (SPADCALL |m|
                                                                (QAREF2O |a|
                                                                         |i|
                                                                         |j| 1
                                                                         1)
                                                                (QREFELT % 48))
                                                      1 1)
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #8# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #10# |nc|) G190
                                      (COND
                                       ((|greater_SI| |j| #10#) (GO G191)))
                                      (SEQ
                                       (LETT |aij| (QAREF2O |a| |i| |j| 1 1))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (SPADCALL (QCDR |mu|) |aij|
                                                              (QREFELT %
                                                                       48)))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT % 56))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;13| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|dl| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G201 NIL)
          (#2=#:G202 NIL) (|nr| #3=(|NonNegativeInteger|)) (#4=#:G203 NIL)
          (|rc| NIL) (#5=#:G204 NIL) (|nc| #3#) (|res| (S)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT % 40) 0)
                   (MAKE_MATRIX1 1 1 (QCDR (QREFELT % 40))))
                  (#6='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                (#6#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| %))
                      (LETT |nr|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #1# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #2# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #2#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #1#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;14| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;15| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G244 NIL)
          (|nc| (|NonNegativeInteger|)) (#2=#:G245 NIL) (#3=#:G246 NIL)
          (|nrs| (|NonNegativeInteger|)) (|res| (S)) (|a| NIL) (#4=#:G247 NIL)
          (|nr| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|n2| (|NonNegativeInteger|)) (|step0| (|NonNegativeInteger|))
          (|m| NIL) (#5=#:G248 NIL) (|i| NIL) (#6=#:G249 NIL) (#7=#:G250 NIL)
          (|j| NIL) (#8=#:G251 NIL) (|vv| (R))
          (|ind_c| #9=(|NonNegativeInteger|)) (|off_r| #9#)
          (|off0| (|NonNegativeInteger|)) (|n0| (|Integer|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (ANROWS |a|))
                                     (LETT |nc| (ANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT #3# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2# (CONS |nr| #2#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #2#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #4# |l|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |a| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT % 47)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT % 49) |dl| 1
                                                     (QREFELT % 62)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #6# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #7# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #7#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #8#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #8#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (SPADCALL
                                                                         (QAREF2O
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          1 1)
                                                                         (QAREF2O
                                                                          |a|
                                                                          |i|
                                                                          |j| 1
                                                                          1)
                                                                         (QREFELT
                                                                          %
                                                                          63)))
                                                                  (QSETAREF2O
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   1 1)
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;16| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;17| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((#1=#:G265 NIL) (|rows| #2=(|NonNegativeInteger|)) (|cols| #2#)
          (|ans| (S)) (|mat| NIL) (#3=#:G266 NIL) (|hiR| #4=(|Integer|))
          (|hiC| #4#) (|k| NIL) (#5=#:G268 NIL) (|i| NIL) (#6=#:G267 NIL)
          (|l| NIL) (#7=#:G270 NIL) (|j| NIL) (#8=#:G269 NIL)
          (|loR| (|Integer|)) (|loC| (|Integer|)))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #1# |list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mat| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 1)) (LETT |loC| (PROGN |ans| 1))
              (SEQ (LETT |mat| NIL) (LETT #3# |list|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (ANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (ANCOLS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 1))
                             (LETT #5# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #6# |hiR|) G190
                             (COND ((OR (> |i| #6#) (> |k| #5#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 1))
                                    (LETT #7# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #8# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #8#) (> |l| #7#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (QSETAREF2O |ans| |i| |j|
                                                  (QAREF2O |mat| |k| |l| 1 1) 1
                                                  1)))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |loR| (+ |hiR| 1))
                        (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;18| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G279 NIL) (|j| NIL) (#2=#:G280 NIL) (#3=#:G278 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 0))
                 (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (PROGN |x| 0))
                        (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 22)) 0.0
                                      (QREFELT % 25))
                            (PROGN (LETT #3# NIL) (GO #4=#:G277))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;19|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((|ans| (S)) (|j| NIL) (#1=#:G286 NIL) (|i| NIL) (#2=#:G285 NIL))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;20| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ans| (S)) (|r| NIL) (#1=#:G293 NIL)
          (|j| NIL) (#2=#:G292 NIL) (|i| NIL) (#3=#:G291 NIL))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #1# |l|) (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #3#) (> |j| #2#) (ATOM #1#)
                         (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #1# (CDR #1#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;21|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|dp| (|List| (|NonNegativeInteger|)))
          (|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|a| (S)) (|m| (R))
          (#2=#:G326 NIL) (#3=#:G327 NIL) (|c_ind| (|NonNegativeInteger|))
          (#4=#:G328 NIL) (#5=#:G329 NIL) (|r_step| #6=(|NonNegativeInteger|))
          (#7=#:G330 NIL) (|rc| NIL) (#8=#:G331 NIL) (|c_step| #6#) (|i| NIL)
          (#9=#:G332 NIL) (|j| NIL) (#10=#:G333 NIL) (|aij| (R)) (|mm| (R))
          (|c_off1| (|NonNegativeInteger|)))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT % 47)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT % 47)))
              (LETT |a| (|SPADfirst| |l|))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #3# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #3#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |res| |r_off| |c_ind|
                                                    (|mul_DF| |m|
                                                              (SPADCALL |a| |i|
                                                                        |j|
                                                                        (QREFELT
                                                                         %
                                                                         22)))
                                                    (QREFELT % 34))
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #8# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #10# |nc|) G190
                                      (COND
                                       ((|greater_SI| |j| #10#) (GO G191)))
                                      (SEQ
                                       (LETT |aij|
                                             (SPADCALL |a| |i| |j|
                                                       (QREFELT % 22)))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (|mul_DF| (QCDR |mu|)
                                                              |aij|))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT % 56))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;22| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|dl| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G361 NIL)
          (#2=#:G362 NIL) (|nr| #3=(|NonNegativeInteger|)) (#4=#:G363 NIL)
          (|rc| NIL) (#5=#:G364 NIL) (|nc| #3#) (|res| (S)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT % 40) 0)
                   (SPADCALL 1 1 (QCDR (QREFELT % 40)) (QREFELT % 30)))
                  (#6='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                (#6#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| %))
                      (LETT |nr|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #1# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #2# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #2#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #1#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;23| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;24| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G404 NIL)
          (|nc| (|NonNegativeInteger|)) (#2=#:G405 NIL) (#3=#:G406 NIL)
          (|nrs| (|NonNegativeInteger|)) (|res| (S)) (|a| NIL) (#4=#:G407 NIL)
          (|nr| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|n2| (|NonNegativeInteger|)) (|step0| (|NonNegativeInteger|))
          (|m| NIL) (#5=#:G408 NIL) (|i| NIL) (#6=#:G409 NIL) (#7=#:G410 NIL)
          (|j| NIL) (#8=#:G411 NIL) (|vv| (R))
          (|ind_c| #9=(|NonNegativeInteger|)) (|off_r| #9#)
          (|off0| (|NonNegativeInteger|)) (|n0| (|Integer|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (DANROWS |a|))
                                     (LETT |nc| (DANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT #3# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2# (CONS |nr| #2#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #2#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #4# |l|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |a| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT % 47)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT % 49) |dl| 1
                                                     (QREFELT % 62)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #6# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #7# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #7#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #8#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #8#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (|add_DF|
                                                                         (SPADCALL
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                         (SPADCALL
                                                                          |a|
                                                                          |i|
                                                                          |j|
                                                                          (QREFELT
                                                                           %
                                                                           22))))
                                                                  (SPADCALL
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   (QREFELT %
                                                                            34))
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;25| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;26| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((#1=#:G425 NIL) (|rows| #2=(|NonNegativeInteger|)) (|cols| #2#)
          (|ans| (S)) (|mat| NIL) (#3=#:G426 NIL) (|hiR| #4=(|Integer|))
          (|hiC| #4#) (|k| NIL) (#5=#:G428 NIL) (|i| NIL) (#6=#:G427 NIL)
          (|l| NIL) (#7=#:G430 NIL) (|j| NIL) (#8=#:G429 NIL)
          (|loR| (|Integer|)) (|loC| (|Integer|)))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #1# |list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mat| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (DANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (DANCOLS |mat|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 0)) (LETT |loC| (PROGN |ans| 0))
              (SEQ (LETT |mat| NIL) (LETT #3# |list|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (DANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (DANCOLS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 0))
                             (LETT #5# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #6# |hiR|) G190
                             (COND ((OR (> |i| #6#) (> |k| #5#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 0))
                                    (LETT #7# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #8# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #8#) (> |l| #7#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |ans| |i| |j|
                                                (SPADCALL |mat| |k| |l|
                                                          (QREFELT % 22))
                                                (QREFELT % 34))))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |loR| (+ |hiR| 1))
                        (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;27| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G439 NIL) (|j| NIL) (#2=#:G440 NIL) (#3=#:G438 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 0))
                 (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (PROGN |x| 0))
                        (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 22))
                                      (|spadConstant| % 29) (QREFELT % 25))
                            (PROGN (LETT #3# NIL) (GO #4=#:G437))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;28|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((|ans| (S)) (|j| NIL) (#1=#:G446 NIL) (|i| NIL) (#2=#:G445 NIL))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;29| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ans| (S)) (|r| NIL) (#1=#:G453 NIL)
          (|j| NIL) (#2=#:G452 NIL) (|i| NIL) (#3=#:G451 NIL))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #1# |l|) (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #3#) (> |j| #2#) (ATOM #1#)
                         (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #1# (CDR #1#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;30|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|dp| (|List| (|NonNegativeInteger|)))
          (|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|a| (S)) (|m| (R))
          (#2=#:G486 NIL) (#3=#:G487 NIL) (|c_ind| (|NonNegativeInteger|))
          (#4=#:G488 NIL) (#5=#:G489 NIL) (|r_step| #6=(|NonNegativeInteger|))
          (#7=#:G490 NIL) (|rc| NIL) (#8=#:G491 NIL) (|c_step| #6#) (|i| NIL)
          (#9=#:G492 NIL) (|j| NIL) (#10=#:G493 NIL) (|aij| (R)) (|mm| (R))
          (|c_off1| (|NonNegativeInteger|)))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT % 47)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT % 47)))
              (LETT |a| (|SPADfirst| |l|))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #3# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #3#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |res| |r_off| |c_ind|
                                                    (SPADCALL |m|
                                                              (SPADCALL |a| |i|
                                                                        |j|
                                                                        (QREFELT
                                                                         % 22))
                                                              (QREFELT % 48))
                                                    (QREFELT % 34))
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #8# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #10# |nc|) G190
                                      (COND
                                       ((|greater_SI| |j| #10#) (GO G191)))
                                      (SEQ
                                       (LETT |aij|
                                             (SPADCALL |a| |i| |j|
                                                       (QREFELT % 22)))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (SPADCALL (QCDR |mu|) |aij|
                                                              (QREFELT %
                                                                       48)))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT % 56))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;31| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|dl| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G521 NIL)
          (#2=#:G522 NIL) (|nr| #3=(|NonNegativeInteger|)) (#4=#:G523 NIL)
          (|rc| NIL) (#5=#:G524 NIL) (|nc| #3#) (|res| (S)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT % 40) 0)
                   (SPADCALL 1 1 (QCDR (QREFELT % 40)) (QREFELT % 30)))
                  (#6='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                (#6#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| %))
                      (LETT |nr|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #1# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #2# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #2#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #1#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;32| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;33| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G564 NIL)
          (|nc| (|NonNegativeInteger|)) (#2=#:G565 NIL) (#3=#:G566 NIL)
          (|nrs| (|NonNegativeInteger|)) (|res| (S)) (|a| NIL) (#4=#:G567 NIL)
          (|nr| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|n2| (|NonNegativeInteger|)) (|step0| (|NonNegativeInteger|))
          (|m| NIL) (#5=#:G568 NIL) (|i| NIL) (#6=#:G569 NIL) (#7=#:G570 NIL)
          (|j| NIL) (#8=#:G571 NIL) (|vv| (R))
          (|ind_c| #9=(|NonNegativeInteger|)) (|off_r| #9#)
          (|off0| (|NonNegativeInteger|)) (|n0| (|Integer|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (DANROWS |a|))
                                     (LETT |nc| (DANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT #3# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2# (CONS |nr| #2#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #2#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #4# |l|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |a| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT % 47)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT % 49) |dl| 1
                                                     (QREFELT % 62)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #6# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #7# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #7#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #8#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #8#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                         (SPADCALL
                                                                          |a|
                                                                          |i|
                                                                          |j|
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                         (QREFELT
                                                                          %
                                                                          63)))
                                                                  (SPADCALL
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   (QREFELT %
                                                                            34))
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;34| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;35| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((#1=#:G585 NIL) (|rows| #2=(|NonNegativeInteger|)) (|cols| #2#)
          (|ans| (S)) (|mat| NIL) (#3=#:G586 NIL) (|hiR| #4=(|Integer|))
          (|hiC| #4#) (|k| NIL) (#5=#:G588 NIL) (|i| NIL) (#6=#:G587 NIL)
          (|l| NIL) (#7=#:G590 NIL) (|j| NIL) (#8=#:G589 NIL)
          (|loR| (|Integer|)) (|loC| (|Integer|)))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #1# |list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mat| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (DANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (DANCOLS |mat|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 0)) (LETT |loC| (PROGN |ans| 0))
              (SEQ (LETT |mat| NIL) (LETT #3# |list|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (DANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (DANCOLS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 0))
                             (LETT #5# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #6# |hiR|) G190
                             (COND ((OR (> |i| #6#) (> |k| #5#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 0))
                                    (LETT #7# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #8# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #8#) (> |l| #7#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |ans| |i| |j|
                                                (SPADCALL |mat| |k| |l|
                                                          (QREFELT % 22))
                                                (QREFELT % 34))))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))))
                             (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                             (GO G190) G191 (EXIT NIL))
                        (LETT |loR| (+ |hiR| 1))
                        (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;36| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((|i| NIL) (#1=#:G599 NIL) (|j| NIL) (#2=#:G600 NIL) (#3=#:G598 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                 (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                        (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL (SPADCALL |x| |i| |j| (QREFELT % 22))
                                      (|spadConstant| % 29) (QREFELT % 25))
                            (PROGN (LETT #3# NIL) (GO #4=#:G597))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;37|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((|ans| (S)) (|j| NIL) (#1=#:G606 NIL) (|i| NIL) (#2=#:G605 NIL))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #2#) (> |j| #1#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;38| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ans| (S)) (|r| NIL) (#1=#:G613 NIL)
          (|j| NIL) (#2=#:G612 NIL) (|i| NIL) (#3=#:G611 NIL))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #1# |l|)
                   (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                   (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #3#) (> |j| #2#) (ATOM #1#)
                         (PROGN (LETT |r| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #1# (CDR #1#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;39|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|dp| (|List| (|NonNegativeInteger|)))
          (|nr| #1=(|NonNegativeInteger|)) (|nc| #1#) (|a| (S)) (|m| (R))
          (#2=#:G646 NIL) (#3=#:G647 NIL) (|c_ind| (|NonNegativeInteger|))
          (#4=#:G648 NIL) (#5=#:G649 NIL) (|r_step| #6=(|NonNegativeInteger|))
          (#7=#:G650 NIL) (|rc| NIL) (#8=#:G651 NIL) (|c_step| #6#) (|i| NIL)
          (#9=#:G652 NIL) (|j| NIL) (#10=#:G653 NIL) (|aij| (R)) (|mm| (R))
          (|c_off1| (|NonNegativeInteger|)))
         (SEQ (LETT |dp| (|SPADfirst| |dl|))
              (LETT |nr| (SPADCALL |dp| 1 (QREFELT % 47)))
              (LETT |nc| (SPADCALL |dp| 2 (QREFELT % 47)))
              (LETT |a| (|SPADfirst| |l|))
              (EXIT
               (COND
                ((EQL |k| 1)
                 (COND
                  ((QEQCAR |mu| 1) (|error| "kronecker_prod1: impossible"))
                  (#11='T
                   (SEQ (LETT |m| (QCDR |mu|))
                        (EXIT
                         (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                              (COND ((|greater_SI| |i| #2#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #3# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #3#) (GO G191)))
                                         (SEQ
                                          (SPADCALL |res| |r_off| |c_ind|
                                                    (SPADCALL |m|
                                                              (SPADCALL |a| |i|
                                                                        |j|
                                                                        (QREFELT
                                                                         % 22))
                                                              (QREFELT % 48))
                                                    (QREFELT % 34))
                                          (EXIT (LETT |c_ind| (+ |c_ind| 1))))
                                         (LETT |j| (|inc_SI| |j|)) (GO G190)
                                         G191 (EXIT NIL))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT NIL)))))))
                (#11#
                 (SEQ (LETT |dl| (CDR |dl|)) (LETT |l| (CDR |l|))
                      (LETT |r_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #8# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #8#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #8#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #8# (CDR #8#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #10# |nc|) G190
                                      (COND
                                       ((|greater_SI| |j| #10#) (GO G191)))
                                      (SEQ
                                       (LETT |aij|
                                             (SPADCALL |a| |i| |j|
                                                       (QREFELT % 22)))
                                       (LETT |mm|
                                             (COND ((QEQCAR |mu| 1) |aij|)
                                                   ('T
                                                    (SPADCALL (QCDR |mu|) |aij|
                                                              (QREFELT %
                                                                       48)))))
                                       (SPADCALL |res| (- |k| 1) |dl| |l|
                                                 |r_off| |c_off1| (CONS 0 |mm|)
                                                 (QREFELT % 56))
                                       (EXIT
                                        (LETT |c_off1| (+ |c_off1| |c_step|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (EXIT (LETT |r_off| (+ |r_off| |r_step|))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT NIL)))))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;LS;40| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|))
          (|dl| (|List| (|List| (|NonNegativeInteger|)))) (#1=#:G681 NIL)
          (#2=#:G682 NIL) (|nr| #3=(|NonNegativeInteger|)) (#4=#:G683 NIL)
          (|rc| NIL) (#5=#:G684 NIL) (|nc| #3#) (|res| (S)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND
                ((EQL |k| 0)
                 (COND
                  ((QEQCAR (QREFELT % 40) 0)
                   (SPADCALL 1 1 (QCDR (QREFELT % 40)) (QREFELT % 30)))
                  (#6='T (|error| "need 1"))))
                ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                (#6#
                 (SEQ (LETT |dl| (|MATCAT-;get_dims| |l| %))
                      (LETT |nr|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #1# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #2# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #2#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #2#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #1#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #1#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #1#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #4# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #5# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #5#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #5#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #4#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #4#))))
                                            (LETT #5# (CDR #5#)) (GO G190) G191
                                            (EXIT (NREVERSE #4#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;41| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;42| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|k| (|NonNegativeInteger|)) (#1=#:G724 NIL)
          (|nc| (|NonNegativeInteger|)) (#2=#:G725 NIL) (#3=#:G726 NIL)
          (|nrs| (|NonNegativeInteger|)) (|res| (S)) (|a| NIL) (#4=#:G727 NIL)
          (|nr| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|n2| (|NonNegativeInteger|)) (|step0| (|NonNegativeInteger|))
          (|m| NIL) (#5=#:G728 NIL) (|i| NIL) (#6=#:G729 NIL) (#7=#:G730 NIL)
          (|j| NIL) (#8=#:G731 NIL) (|vv| (R))
          (|ind_c| #9=(|NonNegativeInteger|)) (|off_r| #9#)
          (|off0| (|NonNegativeInteger|)) (|n0| (|Integer|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |a| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (SPADCALL |a| (QREFELT % 11)))
                                     (LETT |nc| (SPADCALL |a| (QREFELT % 12)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #2# NIL)
                                            (SEQ (LETT #3# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #3#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #3#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #2# (CONS |nr| #2#))))
                                                 (LETT #3# (CDR #3#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #2#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #4# |l|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |a| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |off0| 0)
                                     (LETT |nr|
                                           (SPADCALL |dl| 1 (QREFELT % 47)))
                                     (LETT |dl| (CDR |dl|))
                                     (LETT |n2|
                                           (SPADCALL (ELT % 49) |dl| 1
                                                     (QREFELT % 62)))
                                     (LETT |step0| (* |nr| |n2|))
                                     (SEQ (LETT |m| 1) (LETT #5# |n0|) G190
                                          (COND
                                           ((|greater_SI| |m| #5#) (GO G191)))
                                          (SEQ (LETT |off_r| (+ |off0| 1))
                                               (SEQ (LETT |i| 1)
                                                    (LETT #6# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #6#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #7# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #7#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #8#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #8#)
                                                                   (GO G191)))
                                                                 (SEQ
                                                                  (LETT |vv|
                                                                        (SPADCALL
                                                                         (SPADCALL
                                                                          |res|
                                                                          |off_r|
                                                                          |ind_c|
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                         (SPADCALL
                                                                          |a|
                                                                          |i|
                                                                          |j|
                                                                          (QREFELT
                                                                           %
                                                                           22))
                                                                         (QREFELT
                                                                          %
                                                                          63)))
                                                                  (SPADCALL
                                                                   |res|
                                                                   |off_r|
                                                                   |ind_c| |vv|
                                                                   (QREFELT %
                                                                            34))
                                                                  (EXIT
                                                                   (LETT
                                                                    |ind_c|
                                                                    (+ |ind_c|
                                                                       |n2|))))
                                                                 (LETT |j|
                                                                       (|inc_SI|
                                                                        |j|))
                                                                 (GO G190) G191
                                                                 (EXIT NIL))
                                                            (EXIT
                                                             (LETT |off_r|
                                                                   (+ |off_r|
                                                                      1))))
                                                           (LETT |l|
                                                                 (|inc_SI|
                                                                  |l|))
                                                           (GO G190) G191
                                                           (EXIT NIL))))
                                                    (LETT |i| (|inc_SI| |i|))
                                                    (GO G190) G191 (EXIT NIL))
                                               (EXIT
                                                (LETT |off0|
                                                      (+ |off0| |step0|))))
                                          (LETT |m| (|inc_SI| |m|)) (GO G190)
                                          G191 (EXIT NIL))
                                     (EXIT (LETT |n0| (* |n0| |nr|))))
                                (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;43| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;44| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((#1=#:G745 NIL) (|rows| #2=(|NonNegativeInteger|)) (|cols| #2#)
          (|ans| (S)) (|mat| NIL) (#3=#:G746 NIL) (|hiR| #4=(|Integer|))
          (|hiC| #4#) (|k| NIL) (#5=#:G748 NIL) (|i| NIL) (#6=#:G747 NIL)
          (|l| NIL) (#7=#:G750 NIL) (|j| NIL) (#8=#:G749 NIL)
          (|loR| (|Integer|)) (|loC| (|Integer|)))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #1# |list|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |mat| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |rows| (+ |rows| (SPADCALL |mat| (QREFELT % 11))))
                    (EXIT
                     (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT % 12))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (SPADCALL |ans| (QREFELT % 17)))
              (LETT |loC| (SPADCALL |ans| (QREFELT % 19)))
              (SEQ (LETT |mat| NIL) (LETT #3# |list|) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |mat| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |hiR|
                          (- (+ |loR| (SPADCALL |mat| (QREFELT % 11))) 1))
                    (LETT |hiC|
                          (- (+ |loC| (SPADCALL |mat| (QREFELT % 12))) 1))
                    (SEQ (LETT |k| (SPADCALL |mat| (QREFELT % 17)))
                         (LETT #5# (SPADCALL |mat| (QREFELT % 18)))
                         (LETT |i| |loR|) (LETT #6# |hiR|) G190
                         (COND ((OR (> |i| #6#) (> |k| #5#)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (SPADCALL |mat| (QREFELT % 19)))
                                (LETT #7# (SPADCALL |mat| (QREFELT % 20)))
                                (LETT |j| |loC|) (LETT #8# |hiC|) G190
                                (COND ((OR (> |j| #8#) (> |l| #7#)) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (SPADCALL |ans| |i| |j|
                                            (SPADCALL |mat| |k| |l|
                                                      (QREFELT % 22))
                                            (QREFELT % 34))))
                                (LETT |j|
                                      (PROG1 (+ |j| 1) (LETT |l| (+ |l| 1))))
                                (GO G190) G191 (EXIT NIL))))
                         (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1))))
                         (GO G190) G191 (EXIT NIL))
                    (LETT |loR| (+ |hiR| 1)) (EXIT (LETT |loC| (+ |hiC| 1))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;coerce;ColS;45| ((|v| (|Col|)) (% (S)))
        (SPROG
         ((|x| (S)) (|one| (|Integer|)) (|k| NIL) (#1=#:G756 NIL) (|i| NIL)
          (#2=#:G755 NIL))
         (SEQ
          (LETT |x| (SPADCALL (SPADCALL |v| (QREFELT % 68)) 1 (QREFELT % 32)))
          (LETT |one| (SPADCALL |x| (QREFELT % 19)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 69)))
               (LETT #1# (SPADCALL |v| (QREFELT % 70)))
               (LETT |i| (SPADCALL |x| (QREFELT % 17)))
               (LETT #2# (SPADCALL |x| (QREFELT % 18))) G190
               (COND ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT % 71))
                           (QREFELT % 34))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;transpose;RowS;46| ((|v| (|Row|)) (% (S)))
        (SPROG
         ((|x| (S)) (|one| (|Integer|)) (|k| NIL) (#1=#:G762 NIL) (|j| NIL)
          (#2=#:G761 NIL))
         (SEQ
          (LETT |x| (SPADCALL 1 (SPADCALL |v| (QREFELT % 73)) (QREFELT % 32)))
          (LETT |one| (SPADCALL |x| (QREFELT % 17)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 74)))
               (LETT #1# (SPADCALL |v| (QREFELT % 75)))
               (LETT |j| (SPADCALL |x| (QREFELT % 19)))
               (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
               (COND ((OR (> |j| #2#) (> |k| #1#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT % 76))
                           (QREFELT % 34))))
               (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;+;3S;47| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|r| (|NonNegativeInteger|)) (|c| (|NonNegativeInteger|)) (|ans| (S))
          (|i| NIL) (#1=#:G773 NIL) (|j| NIL) (#2=#:G774 NIL))
         (SEQ
          (COND
           ((OR
             (SPADCALL (LETT |r| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |y| (QREFELT % 11)) (QREFELT % 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT % 12)))
                       (SPADCALL |y| (QREFELT % 12)) (QREFELT % 33)))
            (|error| "can't add matrices of different dimensions"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |r| |c| (QREFELT % 32)))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                      (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                             (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                             (COND ((> |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL
                                          (SPADCALL |x| |i| |j| (QREFELT % 22))
                                          (SPADCALL |y| |i| |j| (QREFELT % 22))
                                          (QREFELT % 63))
                                         (QREFELT % 34))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;3S;48| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|r| (|NonNegativeInteger|)) (|c| (|NonNegativeInteger|)) (|ans| (S))
          (|i| NIL) (#1=#:G785 NIL) (|j| NIL) (#2=#:G786 NIL))
         (SEQ
          (COND
           ((OR
             (SPADCALL (LETT |r| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |y| (QREFELT % 11)) (QREFELT % 33))
             (SPADCALL (LETT |c| (SPADCALL |x| (QREFELT % 12)))
                       (SPADCALL |y| (QREFELT % 12)) (QREFELT % 33)))
            (|error| "can't subtract matrices of different dimensions"))
           ('T
            (SEQ (LETT |ans| (SPADCALL |r| |c| (QREFELT % 32)))
                 (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                      (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                      (COND ((> |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                             (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                             (COND ((> |j| #2#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SPADCALL |ans| |i| |j|
                                         (SPADCALL
                                          (SPADCALL |x| |i| |j| (QREFELT % 22))
                                          (SPADCALL |y| |i| |j| (QREFELT % 22))
                                          (QREFELT % 79))
                                         (QREFELT % 34))))
                             (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                      (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                 (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;-;2S;49| ((|x| (S)) (% (S)))
        (SPADCALL (ELT % 27) |x| (QREFELT % 82))) 

(SDEFUN |MATCAT-;*;I2S;50| ((|m| (|Integer|)) (|x| (S)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;I2S;50!0| (VECTOR % |m|)) |x|
                         (QREFELT % 82)))) 

(SDEFUN |MATCAT-;*;I2S;50!0| ((|r1| NIL) ($$ NIL))
        (PROG (|m| %)
          (LETT |m| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |m| |r1| (QREFELT % 84)))))) 

(SDEFUN |MATCAT-;*;R2S;51| ((|a| (R)) (|x| (S)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;R2S;51!0| (VECTOR % |a|)) |x|
                         (QREFELT % 82)))) 

(SDEFUN |MATCAT-;*;R2S;51!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |a| |r1| (QREFELT % 48)))))) 

(SDEFUN |MATCAT-;*;SRS;52| ((|x| (S)) (|a| (R)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;*;SRS;52!0| (VECTOR % |a|)) |x|
                         (QREFELT % 82)))) 

(SDEFUN |MATCAT-;*;SRS;52!0| ((|r1| NIL) ($$ NIL))
        (PROG (|a| %)
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |a| (QREFELT % 48)))))) 

(SDEFUN |MATCAT-;*;3S;53| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G806 NIL) (|j| NIL) (#2=#:G807 NIL)
          (|l| NIL) (#3=#:G809 NIL) (|k| NIL) (#4=#:G808 NIL) (|sum| (R))
          (|entry| (R)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 12))
                      (SPADCALL |y| (QREFELT % 11)) (QREFELT % 21))
            (|error| "can't multiply matrices of incompatible dimensions"))
           ('T
            (SEQ
             (LETT |ans|
                   (SPADCALL (SPADCALL |x| (QREFELT % 11))
                             (SPADCALL |y| (QREFELT % 12)) (QREFELT % 32)))
             (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                  (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                  (COND ((> |i| #1#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 19)))
                         (LETT #2# (SPADCALL |y| (QREFELT % 20))) G190
                         (COND ((> |j| #2#) (GO G191)))
                         (SEQ
                          (LETT |entry|
                                (SEQ (LETT |sum| (|spadConstant| % 29))
                                     (SEQ
                                      (LETT |l| (SPADCALL |x| (QREFELT % 19)))
                                      (LETT #3# (SPADCALL |x| (QREFELT % 20)))
                                      (LETT |k| (SPADCALL |y| (QREFELT % 17)))
                                      (LETT #4# (SPADCALL |y| (QREFELT % 18)))
                                      G190
                                      (COND
                                       ((OR (> |k| #4#) (> |l| #3#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |sum|
                                              (SPADCALL |sum|
                                                        (SPADCALL
                                                         (SPADCALL |x| |i| |l|
                                                                   (QREFELT %
                                                                            22))
                                                         (SPADCALL |y| |k| |j|
                                                                   (QREFELT %
                                                                            22))
                                                         (QREFELT % 48))
                                                        (QREFELT % 63)))))
                                      (LETT |k|
                                            (PROG1 (+ |k| 1)
                                              (LETT |l| (+ |l| 1))))
                                      (GO G190) G191 (EXIT NIL))
                                     (EXIT |sum|)))
                          (EXIT
                           (SPADCALL |ans| |i| |j| |entry| (QREFELT % 34))))
                         (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
             (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;positivePower;SIS;54| ((|x| (S)) (|n| (|Integer|)) (% (S)))
        (SPROG ((|y| (S)))
               (SEQ
                (COND ((EQL |n| 1) |x|)
                      ((ODDP |n|)
                       (SPADCALL |x| (SPADCALL |x| (- |n| 1) (QREFELT % 89))
                                 (QREFELT % 90)))
                      ('T
                       (SEQ
                        (LETT |y|
                              (SPADCALL |x| (|quotient_INT| |n| 2)
                                        (QREFELT % 89)))
                        (EXIT (SPADCALL |y| |y| (QREFELT % 90))))))))) 

(SDEFUN |MATCAT-;^;SNniS;55| ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (S)))
        (SPROG ((|nn| (|NonNegativeInteger|)))
               (COND
                ((NULL
                  (EQL (LETT |nn| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |x| (QREFELT % 12))))
                 (|error| "^: matrix must be square"))
                ('T
                 (COND
                  ((ZEROP |n|)
                   (SPADCALL |nn| (|spadConstant| % 39) (QREFELT % 92)))
                  ('T (SPADCALL |x| |n| (QREFELT % 89)))))))) 

(SDEFUN |MATCAT-;*;S2Col;56| ((|x| (S)) (|v| (|Col|)) (% (|Col|)))
        (SPROG
         ((|w| (|Col|)) (|k| NIL) (#1=#:G825 NIL) (|i| NIL) (#2=#:G824 NIL)
          (|l| NIL) (#3=#:G827 NIL) (|j| NIL) (#4=#:G826 NIL) (|sum| (R)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 12))
                      (SPADCALL |v| (QREFELT % 68)) (QREFELT % 21))
            (|error| "can't multiply matrix A and vector v if #cols A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT % 11))
                             (|spadConstant| % 29) (QREFELT % 94)))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT % 69)))
                  (LETT #1# (SPADCALL |w| (QREFELT % 70)))
                  (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                  (LETT #2# (SPADCALL |x| (QREFELT % 18))) G190
                  (COND ((OR (> |i| #2#) (> |k| #1#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| % 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT % 69)))
                                    (LETT #3# (SPADCALL |v| (QREFELT % 70)))
                                    (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                                    (LETT #4# (SPADCALL |x| (QREFELT % 20)))
                                    G190
                                    (COND
                                     ((OR (> |j| #4#) (> |l| #3#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT %
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT %
                                                                          95))
                                                       (QREFELT % 48))
                                                      (QREFELT % 63)))))
                                    (LETT |j|
                                          (PROG1 (+ |j| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT % 96))))
                  (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;*;RowSRow;57| ((|v| (|Row|)) (|x| (S)) (% (|Row|)))
        (SPROG
         ((|w| (|Row|)) (|k| NIL) (#1=#:G837 NIL) (|j| NIL) (#2=#:G836 NIL)
          (|l| NIL) (#3=#:G839 NIL) (|i| NIL) (#4=#:G838 NIL) (|sum| (R)))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |x| (QREFELT % 11))
                      (SPADCALL |v| (QREFELT % 73)) (QREFELT % 21))
            (|error| "can't multiply vector v and matrix A if #rows A ~= #v"))
           ('T
            (SEQ
             (LETT |w|
                   (SPADCALL (SPADCALL |x| (QREFELT % 12))
                             (|spadConstant| % 29) (QREFELT % 98)))
             (SEQ (LETT |k| (SPADCALL |w| (QREFELT % 74)))
                  (LETT #1# (SPADCALL |w| (QREFELT % 75)))
                  (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                  (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                  (COND ((OR (> |j| #2#) (> |k| #1#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| % 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT % 74)))
                                    (LETT #3# (SPADCALL |v| (QREFELT % 75)))
                                    (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                                    (LETT #4# (SPADCALL |x| (QREFELT % 18)))
                                    G190
                                    (COND
                                     ((OR (> |i| #4#) (> |l| #3#)) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (LETT |sum|
                                            (SPADCALL |sum|
                                                      (SPADCALL
                                                       (SPADCALL |x| |i| |j|
                                                                 (QREFELT %
                                                                          22))
                                                       (SPADCALL |v| |l|
                                                                 (QREFELT %
                                                                          99))
                                                       (QREFELT % 48))
                                                      (QREFELT % 63)))))
                                    (LETT |i|
                                          (PROG1 (+ |i| 1)
                                            (LETT |l| (+ |l| 1))))
                                    (GO G190) G191 (EXIT NIL))
                                   (EXIT |sum|))
                              (QREFELT % 100))))
                  (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1)))) (GO G190)
                  G191 (EXIT NIL))
             (EXIT |w|))))))) 

(SDEFUN |MATCAT-;columnSpace;SL;58| ((M (S)) (% (|List| |Col|)))
        (SPROG
         ((M2 (S)) (|n| (|Integer|)) (|m| (|Integer|)) (|k| NIL)
          (#1=#:G846 NIL) (|basis| (|List| |Col|)) (|indRow| (|Integer|)))
         (SEQ (LETT M2 (SPADCALL M (QREFELT % 102))) (LETT |basis| NIL)
              (LETT |n| (SPADCALL M (QREFELT % 12)))
              (LETT |m| (SPADCALL M (QREFELT % 11))) (LETT |indRow| 1)
              (SEQ (LETT |k| 1) (LETT #1# |n|) G190
                   (COND
                    ((OR (|greater_SI| |k| #1#) (NULL (<= |indRow| |m|)))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL M2 |indRow| |k| (QREFELT % 103))
                                  (QREFELT % 23)))
                       (SEQ
                        (LETT |basis|
                              (CONS (SPADCALL M |k| (QREFELT % 104)) |basis|))
                        (EXIT (LETT |indRow| (+ |indRow| 1))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |basis|))))) 

(SDEFUN |MATCAT-;B0| ((|n| (|PositiveInteger|)) (% (S)))
        (SPROG
         ((#1=#:G858 NIL) (|i| NIL) (#2=#:G859 NIL) (#3=#:G860 NIL) (|j| NIL)
          (#4=#:G861 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |i| 1) (LETT #2# |n|) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #1#
                         (CONS
                          (PROGN
                           (LETT #3# NIL)
                           (SEQ (LETT |j| 1) (LETT #4# |n|) G190
                                (COND ((|greater_SI| |j| #4#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #3#
                                        (CONS
                                         (COND
                                          ((EQL |i| (+ |j| 1))
                                           (COND
                                            ((ODDP |j|)
                                             (SPADCALL (|spadConstant| % 39)
                                                       (QREFELT % 27)))
                                            ((EQL |i| (- |j| 1))
                                             (COND
                                              ((ODDP |i|)
                                               (|spadConstant| % 39))
                                              ('T (|spadConstant| % 29))))
                                            ('T (|spadConstant| % 29))))
                                          ((EQL |i| (- |j| 1))
                                           (COND
                                            ((ODDP |i|) (|spadConstant| % 39))
                                            ('T (|spadConstant| % 29))))
                                          ('T (|spadConstant| % 29)))
                                         #3#))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT (NREVERSE #3#))))
                          #1#))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                 (EXIT (NREVERSE #1#))))
           (QREFELT % 107))))) 

(SDEFUN |MATCAT-;PfChar| ((A (S)) (% #1=(|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (M (S)) (|r| (S)) (|s| (S)) (|p| #1#)
          (|d| (|NonNegativeInteger|)) (#2=#:G862 NIL) (B (S)) (#3=#:G875 NIL)
          (C (S)) (|g| (|List| R)) (|j| NIL) (#4=#:G877 NIL) (|i| NIL)
          (#5=#:G876 NIL) (|c| (R)) (|k| NIL) (#6=#:G879 NIL) (|e| NIL)
          (#7=#:G878 NIL) (|res| (|SparseUnivariatePolynomial| R)))
         (SEQ (LETT |n| (SPADCALL A (QREFELT % 11)))
              (EXIT
               (COND
                ((EQL |n| 2)
                 (SPADCALL (SPADCALL (|spadConstant| % 39) 2 (QREFELT % 109))
                           (SPADCALL (SPADCALL A 1 2 (QREFELT % 22))
                                     (QREFELT % 110))
                           (QREFELT % 111)))
                ('T
                 (SEQ (LETT M (SPADCALL A 3 |n| 3 |n| (QREFELT % 112)))
                      (LETT |r| (SPADCALL A 1 1 3 |n| (QREFELT % 112)))
                      (LETT |s| (SPADCALL A 3 |n| 2 2 (QREFELT % 112)))
                      (LETT |p| (|MATCAT-;PfChar| M %))
                      (LETT |d| (SPADCALL |p| (QREFELT % 113)))
                      (LETT B
                            (|MATCAT-;B0|
                             (PROG1 (LETT #2# (- |n| 2))
                               (|check_subtype2| (> #2# 0) '(|PositiveInteger|)
                                                 '(|Integer|) #2#))
                             %))
                      (LETT C (SPADCALL |r| B (QREFELT % 90)))
                      (LETT |g|
                            (LIST
                             (SPADCALL (SPADCALL C |s| (QREFELT % 90)) 1 1
                                       (QREFELT % 22))
                             (SPADCALL A 1 2 (QREFELT % 22))
                             (|spadConstant| % 39)))
                      (COND
                       ((>= |d| 4)
                        (SEQ (LETT B (SPADCALL M B (QREFELT % 90)))
                             (EXIT
                              (SEQ (LETT |i| 4) (LETT #3# |d|) G190
                                   (COND ((> |i| #3#) (GO G191)))
                                   (SEQ (LETT C (SPADCALL C B (QREFELT % 90)))
                                        (EXIT
                                         (LETT |g|
                                               (CONS
                                                (SPADCALL
                                                 (SPADCALL C |s|
                                                           (QREFELT % 90))
                                                 1 1 (QREFELT % 22))
                                                |g|))))
                                   (LETT |i| (+ |i| 2)) (GO G190) G191
                                   (EXIT NIL))))))
                      (LETT |g| (NREVERSE |g|))
                      (LETT |res| (|spadConstant| % 114))
                      (SEQ (LETT |j| 2) (LETT #4# (+ |d| 2)) (LETT |i| 0)
                           (LETT #5# |d|) G190
                           (COND
                            ((OR (> |i| #5#) (|greater_SI| |j| #4#))
                             (GO G191)))
                           (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT % 115)))
                                (EXIT
                                 (SEQ (LETT |k| 2) (LETT #6# (- |d|))
                                      (LETT |e| NIL)
                                      (LETT #7#
                                            (SPADCALL |g| |j| (QREFELT % 116)))
                                      G190
                                      (COND
                                       ((OR (ATOM #7#)
                                            (PROGN (LETT |e| (CAR #7#)) NIL)
                                            (< |k| #6#))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT |res|
                                              (SPADCALL |res|
                                                        (SPADCALL
                                                         (SPADCALL |c| |e|
                                                                   (QREFELT %
                                                                            48))
                                                         (+ |k| |i|)
                                                         (QREFELT % 109))
                                                        (QREFELT % 111)))))
                                      (LETT #7#
                                            (PROG1 (CDR #7#)
                                              (LETT |k| (+ |k| -2))))
                                      (GO G190) G191 (EXIT NIL))))
                           (LETT |i|
                                 (PROG1 (+ |i| 2) (LETT |j| (|inc_SI| |j|))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;Pfaffian;SR;61| ((A (S)) (% (R)))
        (COND
         ((SPADCALL A (QREFELT % 117))
          (COND ((ODDP (SPADCALL A (QREFELT % 11))) (|spadConstant| % 29))
                (#1='T
                 (SPADCALL (|MATCAT-;PfChar| A %) (|spadConstant| % 29)
                           (QREFELT % 118)))))
         (#1#
          (|error|
           "Pfaffian: only defined for antisymmetric square matrices!")))) 

(SDEFUN |MATCAT-;exquo;SRU;62| ((|x| (S)) (|a| (R)) (% (|Union| S "failed")))
        (SPROG
         ((|ans| (S)) (|i| NIL) (#1=#:G901 NIL) (|j| NIL) (#2=#:G902 NIL)
          (|r| (|Union| R "failed")) (#3=#:G900 NIL) (|entry| (R)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                            (SPADCALL |x| (QREFELT % 12)) (QREFELT % 32)))
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                 (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                        (LETT #2# (SPADCALL |x| (QREFELT % 20))) G190
                        (COND ((> |j| #2#) (GO G191)))
                        (SEQ
                         (LETT |entry|
                               (SEQ
                                (LETT |r|
                                      (SPADCALL
                                       (SPADCALL |x| |i| |j| (QREFELT % 22))
                                       |a| (QREFELT % 121)))
                                (EXIT
                                 (COND
                                  ((QEQCAR |r| 1)
                                   (PROGN
                                    (LETT #3# (CONS 1 "failed"))
                                    (GO #4=#:G899)))
                                  ('T (QCDR |r|))))))
                         (EXIT
                          (SPADCALL |ans| |i| |j| |entry| (QREFELT % 34))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #4# (EXIT #3#)))) 

(SDEFUN |MATCAT-;/;SRS;63| ((|x| (S)) (|r| (R)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|MATCAT-;/;SRS;63!0| (VECTOR % |r|)) |x|
                         (QREFELT % 82)))) 

(SDEFUN |MATCAT-;/;SRS;63!0| ((|r1| NIL) ($$ NIL))
        (PROG (|r| %)
          (LETT |r| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |r1| |r| (QREFELT % 123)))))) 

(SDEFUN |MATCAT-;^;SIS;64| ((|x| (S)) (|n| (|Integer|)) (% (S)))
        (SPROG ((|nn| (|NonNegativeInteger|)) (|xInv| (|Union| S "failed")))
               (SEQ
                (COND
                 ((NULL
                   (EQL (LETT |nn| (SPADCALL |x| (QREFELT % 11)))
                        (SPADCALL |x| (QREFELT % 12))))
                  (|error| "^: matrix must be square"))
                 ('T
                  (COND
                   ((ZEROP |n|)
                    (SPADCALL |nn| (|spadConstant| % 39) (QREFELT % 92)))
                   ((PLUSP |n|) (SPADCALL |x| |n| (QREFELT % 89)))
                   (#1='T
                    (SEQ (LETT |xInv| (SPADCALL |x| (QREFELT % 125)))
                         (EXIT
                          (COND
                           ((QEQCAR |xInv| 1)
                            (|error| "^: matrix must be invertible"))
                           (#1#
                            (SPADCALL (QCDR |xInv|) (- |n|)
                                      (QREFELT % 89))))))))))))) 

(DECLAIM (NOTINLINE |MatrixCategory&;|)) 

(DEFUN |MatrixCategory&| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((DV$1 NIL) (DV$2 NIL) (DV$3 NIL) (DV$4 NIL) (|dv$| NIL) (% NIL)
    (|pv$| NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT |dv$| (LIST '|MatrixCategory&| DV$1 DV$2 DV$3 DV$4))
    (LETT % (GETREFV 128))
    (QSETREFV % 0 |dv$|)
    (QSETREFV % 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST (|HasCategory| |#2| '(|Field|))
                                             (|HasCategory| |#2|
                                                            '(|CommutativeRing|))
                                             (|HasCategory| |#2| '(|Monoid|))
                                             (|HasCategory| |#2|
                                                            '(|SemiRng|))))))
    (|stuffDomainSlots| %)
    (QSETREFV % 6 |#1|)
    (QSETREFV % 7 |#2|)
    (QSETREFV % 8 |#3|)
    (QSETREFV % 9 |#4|)
    (SETF |pv$| (QREFELT % 3))
    (COND
     ((|HasCategory| |#2| '(|AbelianGroup|))
      (QSETREFV % 28
                (CONS (|dispatchFunction| |MATCAT-;antisymmetric?;SB;4|) %))))
    (QSETREFV % 40
              (COND
               ((|HasCategory| |#2| '(|SemiRing|))
                (CONS 0 (|spadConstant| % 39)))
               ('T (CONS 1 "one"))))
    (COND
     ((|domainEqual| |#1| (|Matrix| |#2|))
      (PROGN
       (QSETREFV % 41 (CONS (|dispatchFunction| |MATCAT-;zero?;SB;9|) %))
       (QSETREFV % 43
                 (CONS (|dispatchFunction| |MATCAT-;scalarMatrix;NniRS;10|) %))
       (QSETREFV % 45
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;11|) %))
       (COND
        ((|testBitVector| |pv$| 4)
         (PROGN
          (QSETREFV % 57
                    (CONS
                     (|dispatchFunction|
                      |MATCAT-;kronecker_prod1;SILL2NniUV;12|)
                     %))
          (QSETREFV % 59
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;13|)
                          %))
          (QSETREFV % 61
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;14|)
                          %)))))
       (QSETREFV % 64
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;15|) %))
       (QSETREFV % 66
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;16|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;17|)
                       %))))
     ((|domainEqual| |#1| (|DoubleFloatMatrix|))
      (COND
       ((|domainEqual| |#2| (|DoubleFloat|))
        (PROGN
         (QSETREFV % 41 (CONS (|dispatchFunction| |MATCAT-;zero?;SB;18|) %))
         (QSETREFV % 43
                   (CONS (|dispatchFunction| |MATCAT-;scalarMatrix;NniRS;19|)
                         %))
         (QSETREFV % 45
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;20|)
                         %))
         (COND
          ((|testBitVector| |pv$| 4)
           (PROGN
            (QSETREFV % 57
                      (CONS
                       (|dispatchFunction|
                        |MATCAT-;kronecker_prod1;SILL2NniUV;21|)
                       %))
            (QSETREFV % 59
                      (CONS
                       (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;22|)
                       %))
            (QSETREFV % 61
                      (CONS
                       (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;23|)
                       %)))))
         (QSETREFV % 64
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;24|) %))
         (QSETREFV % 66
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;25|) %))
         (QSETREFV % 67
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;26|)
                         %))))
       ('T
        (PROGN
         (QSETREFV % 41 (CONS (|dispatchFunction| |MATCAT-;zero?;SB;27|) %))
         (QSETREFV % 43
                   (CONS (|dispatchFunction| |MATCAT-;scalarMatrix;NniRS;28|)
                         %))
         (QSETREFV % 45
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;29|)
                         %))
         (COND
          ((|testBitVector| |pv$| 4)
           (PROGN
            (QSETREFV % 57
                      (CONS
                       (|dispatchFunction|
                        |MATCAT-;kronecker_prod1;SILL2NniUV;30|)
                       %))
            (QSETREFV % 59
                      (CONS
                       (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;31|)
                       %))
            (QSETREFV % 61
                      (CONS
                       (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;32|)
                       %)))))
         (QSETREFV % 64
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;33|) %))
         (QSETREFV % 66
                   (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;34|) %))
         (QSETREFV % 67
                   (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;35|)
                         %))))))
     ('T
      (PROGN
       (QSETREFV % 41 (CONS (|dispatchFunction| |MATCAT-;zero?;SB;36|) %))
       (QSETREFV % 43
                 (CONS (|dispatchFunction| |MATCAT-;scalarMatrix;NniRS;37|) %))
       (QSETREFV % 45
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;38|) %))
       (COND
        ((|testBitVector| |pv$| 4)
         (PROGN
          (QSETREFV % 57
                    (CONS
                     (|dispatchFunction|
                      |MATCAT-;kronecker_prod1;SILL2NniUV;39|)
                     %))
          (QSETREFV % 59
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;LS;40|)
                          %))
          (QSETREFV % 61
                    (CONS (|dispatchFunction| |MATCAT-;kroneckerProduct;3S;41|)
                          %)))))
       (QSETREFV % 64
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;LS;42|) %))
       (QSETREFV % 66
                 (CONS (|dispatchFunction| |MATCAT-;kroneckerSum;3S;43|) %))
       (QSETREFV % 67
                 (CONS (|dispatchFunction| |MATCAT-;diagonalMatrix;LS;44|)
                       %)))))
    (COND
     ((|HasCategory| |#2| '(|AbelianGroup|))
      (PROGN
       (QSETREFV % 80 (CONS (|dispatchFunction| |MATCAT-;-;3S;48|) %))
       (QSETREFV % 83 (CONS (|dispatchFunction| |MATCAT-;-;2S;49|) %))
       (QSETREFV % 85 (CONS (|dispatchFunction| |MATCAT-;*;I2S;50|) %)))))
    (COND
     ((|testBitVector| |pv$| 4)
      (PROGN
       (QSETREFV % 86 (CONS (|dispatchFunction| |MATCAT-;*;R2S;51|) %))
       (QSETREFV % 87 (CONS (|dispatchFunction| |MATCAT-;*;SRS;52|) %))
       (QSETREFV % 88 (CONS (|dispatchFunction| |MATCAT-;*;3S;53|) %))
       (QSETREFV % 91
                 (CONS (|dispatchFunction| |MATCAT-;positivePower;SIS;54|)
                       %)))))
    (COND
     ((|testBitVector| |pv$| 3)
      (QSETREFV % 93 (CONS (|dispatchFunction| |MATCAT-;^;SNniS;55|) %))))
    (COND
     ((|HasCategory| |#4| '(|shallowlyMutable|))
      (QSETREFV % 97 (CONS (|dispatchFunction| |MATCAT-;*;S2Col;56|) %))))
    (COND
     ((|HasCategory| |#3| '(|shallowlyMutable|))
      (QSETREFV % 101 (CONS (|dispatchFunction| |MATCAT-;*;RowSRow;57|) %))))
    (COND
     ((|HasCategory| |#2| '(|EuclideanDomain|))
      (QSETREFV % 106
                (CONS (|dispatchFunction| |MATCAT-;columnSpace;SL;58|) %))))
    (COND
     ((|testBitVector| |pv$| 2)
      (PROGN
       (QSETREFV % 119
                 (CONS (|dispatchFunction| |MATCAT-;Pfaffian;SR;61|) %)))))
    (COND
     ((|HasCategory| |#2| '(|IntegralDomain|))
      (QSETREFV % 122 (CONS (|dispatchFunction| |MATCAT-;exquo;SRU;62|) %))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV % 124 (CONS (|dispatchFunction| |MATCAT-;/;SRS;63|) %))
       (QSETREFV % 126 (CONS (|dispatchFunction| |MATCAT-;^;SIS;64|) %)))))
    %))) 

(MAKEPROP '|MatrixCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|NonNegativeInteger|)
              (0 . |nrows|) (5 . |ncols|) (|Boolean|) |MATCAT-;square?;SB;1|
              (10 . |square?|) (|Integer|) (15 . |minRowIndex|)
              (20 . |maxRowIndex|) (25 . |minColIndex|) (30 . |maxColIndex|)
              (35 . ~=) (41 . |qelt|) (48 . |zero?|) |MATCAT-;diagonal?;SB;2|
              (53 . ~=) |MATCAT-;symmetric?;SB;3| (59 . -)
              (64 . |antisymmetric?|) (69 . |0|) (73 . |new|)
              |MATCAT-;zero;2NniS;5| (80 . |qnew|) (86 . ~=) (92 . |qsetelt!|)
              (|List| 44) |MATCAT-;matrix;LS;6| (|Mapping| 7 16 16)
              |MATCAT-;matrix;2NniMS;7| (100 . |1|) '|maybe_1| (104 . |zero?|)
              (109 . |zero|) (115 . |scalarMatrix|) (|List| 7)
              (121 . |diagonalMatrix|) (|List| 10) (126 . |elt|) (132 . *)
              (138 . *) (|Mapping| 10 10 10) (144 . |reduce|) (|Void|)
              (|List| 46) (|List| %) (|Union| 7 '#1="one")
              (150 . |kronecker_prod1|) (161 . |kronecker_prod1|)
              (172 . |copy|) (177 . |kroneckerProduct|)
              (182 . |kroneckerProduct|) (187 . |kroneckerProduct|)
              (193 . |reduce|) (200 . +) (206 . |kroneckerSum|)
              (211 . |kroneckerSum|) (216 . |kroneckerSum|)
              (222 . |diagonalMatrix|) (227 . |#|) (232 . |minIndex|)
              (237 . |maxIndex|) (242 . |qelt|) |MATCAT-;coerce;ColS;45|
              (248 . |#|) (253 . |minIndex|) (258 . |maxIndex|) (263 . |qelt|)
              |MATCAT-;transpose;RowS;46| |MATCAT-;+;3S;47| (269 . -) (275 . -)
              (|Mapping| 7 7) (281 . |map|) (287 . -) (292 . *) (298 . *)
              (304 . *) (310 . *) (316 . *) (322 . |positivePower|) (328 . *)
              (334 . |positivePower|) (340 . |scalarMatrix|) (346 . ^)
              (352 . |new|) (358 . |elt|) (364 . |setelt!|) (371 . *)
              (377 . |new|) (383 . |elt|) (389 . |setelt!|) (396 . *)
              (402 . |rowEchelon|) (407 . |elt|) (414 . |column|) (|List| 9)
              (420 . |columnSpace|) (425 . |matrix|)
              (|SparseUnivariatePolynomial| 7) (430 . |monomial|)
              (436 . |coerce|) (441 . +) (447 . |subMatrix|) (456 . |degree|)
              (461 . |0|) (465 . |coefficient|) (471 . |first|)
              (477 . |antisymmetric?|) (482 . |elt|) (488 . |Pfaffian|)
              (|Union| % '"failed") (493 . |exquo|) (499 . |exquo|) (505 . /)
              (511 . /) (517 . |inverse|) (522 . ^) (|OutputForm|))
           '#(|zero?| 528 |zero| 533 |transpose| 539 |symmetric?| 544 |square?|
              549 |scalarMatrix| 554 |positivePower| 560 |matrix| 566
              |kronecker_prod1| 578 |kroneckerSum| 589 |kroneckerProduct| 600
              |exquo| 611 |diagonalMatrix| 617 |diagonal?| 627 |columnSpace|
              632 |coerce| 637 |antisymmetric?| 642 ^ 647 |Pfaffian| 659 / 664
              - 670 + 681 * 687)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|kronecker_prod1|
                                 ((|Void|) |#1| (|Integer|)
                                  (|List| (|List| (|NonNegativeInteger|)))
                                  (|List| |#1|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|Union| |#2| #1#)))
                                T)
                              '((^ (|#1| |#1| (|Integer|))) T)
                              '((|Pfaffian| (|#2| |#1|)) T)
                              '((^ (|#1| |#1| (|NonNegativeInteger|))) T)
                              '((|positivePower| (|#1| |#1| (|Integer|))) T)
                              '((* (|#3| |#3| |#1|)) T)
                              '((* (|#4| |#1| |#4|)) T)
                              '((|transpose| (|#1| |#3|)) T)
                              '((|coerce| (|#1| |#4|)) T)
                              '((|kroneckerSum| (|#1| (|List| |#1|))) T)
                              '((|kroneckerSum| (|#1| |#1| |#1|)) T)
                              '((|kroneckerProduct| (|#1| (|List| |#1|))) T)
                              '((|kroneckerProduct| (|#1| |#1| |#1|)) T)
                              '((|diagonalMatrix| (|#1| (|List| |#1|))) T)
                              '((|diagonalMatrix| (|#1| (|List| |#2|))) T)
                              '((|scalarMatrix|
                                 (|#1| (|NonNegativeInteger|) |#2|))
                                T)
                              '((|matrix|
                                 (|#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|Mapping| |#2| (|Integer|) (|Integer|))))
                                T)
                              '((|matrix| (|#1| (|List| (|List| |#2|)))) T)
                              '((|zero|
                                 (|#1| (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|columnSpace| ((|List| |#4|) |#1|)) T)
                              '((/ (|#1| |#1| |#2|)) T)
                              '((|exquo| ((|Union| |#1| "failed") |#1| |#2|))
                                T)
                              '((* (|#1| |#1| |#2|)) T)
                              '((* (|#1| |#2| |#1|)) T)
                              '((* (|#1| |#1| |#1|)) T)
                              '((* (|#1| (|Integer|) |#1|)) T)
                              '((- (|#1| |#1|)) T) '((- (|#1| |#1| |#1|)) T)
                              '((+ (|#1| |#1| |#1|)) T)
                              '((|antisymmetric?| ((|Boolean|) |#1|)) T)
                              '((|symmetric?| ((|Boolean|) |#1|)) T)
                              '((|zero?| ((|Boolean|) |#1|)) T)
                              '((|diagonal?| ((|Boolean|) |#1|)) T)
                              '((|square?| ((|Boolean|) |#1|)) T)
                              '((|coerce| ((|OutputForm|) |#1|)) T)
                              '((|transpose| (|#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 126
                                            '(1 6 10 0 11 1 6 10 0 12 1 6 13 0
                                              15 1 6 16 0 17 1 6 16 0 18 1 6 16
                                              0 19 1 6 16 0 20 2 16 13 0 0 21 3
                                              6 7 0 16 16 22 1 7 13 0 23 2 7 13
                                              0 0 25 1 7 0 0 27 1 0 13 0 28 0 7
                                              0 29 3 6 0 10 10 7 30 2 6 0 10 10
                                              32 2 10 13 0 0 33 4 6 7 0 16 16 7
                                              34 0 7 0 39 1 0 13 0 41 2 6 0 10
                                              10 42 2 0 0 10 7 43 1 0 0 44 45 2
                                              46 10 0 16 47 2 7 0 0 0 48 2 10 0
                                              10 0 49 2 46 10 50 0 51 7 6 52 0
                                              16 53 54 10 10 55 56 7 0 52 0 16
                                              53 54 10 10 55 57 1 6 0 0 58 1 0
                                              0 54 59 1 6 0 54 60 2 0 0 0 0 61
                                              3 46 10 50 0 10 62 2 7 0 0 0 63 1
                                              0 0 54 64 1 6 0 54 65 2 0 0 0 0
                                              66 1 0 0 54 67 1 9 10 0 68 1 9 16
                                              0 69 1 9 16 0 70 2 9 7 0 16 71 1
                                              8 10 0 73 1 8 16 0 74 1 8 16 0 75
                                              2 8 7 0 16 76 2 7 0 0 0 79 2 0 0
                                              0 0 80 2 6 0 81 0 82 1 0 0 0 83 2
                                              7 0 16 0 84 2 0 0 16 0 85 2 0 0 7
                                              0 86 2 0 0 0 7 87 2 0 0 0 0 88 2
                                              6 0 0 16 89 2 6 0 0 0 90 2 0 0 0
                                              16 91 2 6 0 10 7 92 2 0 0 0 10 93
                                              2 9 0 10 7 94 2 9 7 0 16 95 3 9 7
                                              0 16 7 96 2 0 9 0 9 97 2 8 0 10 7
                                              98 2 8 7 0 16 99 3 8 7 0 16 7 100
                                              2 0 8 8 0 101 1 6 0 0 102 3 6 7 0
                                              16 16 103 2 6 9 0 16 104 1 0 105
                                              0 106 1 6 0 35 107 2 108 0 7 10
                                              109 1 108 0 7 110 2 108 0 0 0 111
                                              5 6 0 0 16 16 16 16 112 1 108 10
                                              0 113 0 108 0 114 2 108 7 0 10
                                              115 2 44 0 0 10 116 1 6 13 0 117
                                              2 108 7 0 7 118 1 0 7 0 119 2 7
                                              120 0 0 121 2 0 120 0 7 122 2 7 0
                                              0 0 123 2 0 0 0 7 124 1 6 120 0
                                              125 2 0 0 0 16 126 1 0 13 0 41 2
                                              0 0 10 10 31 1 0 0 8 77 1 0 13 0
                                              26 1 0 13 0 14 2 0 0 10 7 43 2 0
                                              0 0 16 91 3 0 0 10 10 37 38 1 0 0
                                              35 36 7 0 52 0 16 53 54 10 10 55
                                              57 1 0 0 54 64 2 0 0 0 0 66 1 0 0
                                              54 59 2 0 0 0 0 61 2 0 120 0 7
                                              122 1 0 0 54 67 1 0 0 44 45 1 0
                                              13 0 24 1 0 105 0 106 1 0 0 9 72
                                              1 0 13 0 28 2 0 0 0 10 93 2 0 0 0
                                              16 126 1 0 7 0 119 2 0 0 0 7 124
                                              2 0 0 0 0 80 1 0 0 0 83 2 0 0 0 0
                                              78 2 0 0 16 0 85 2 0 0 0 0 88 2 0
                                              0 0 7 87 2 0 0 7 0 86 2 0 9 0 9
                                              97 2 0 8 8 0 101)))))
           '|lookupComplete|)) 
