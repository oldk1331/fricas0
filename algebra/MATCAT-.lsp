
(SDEFUN |MATCAT-;square?;SB;1| ((|x| (S)) (% (|Boolean|)))
        (EQL (SPADCALL |x| (QREFELT % 11)) (SPADCALL |x| (QREFELT % 12)))) 

(SDEFUN |MATCAT-;diagonal?;SB;2| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G46 NIL) (#2=#:G47 NIL) (#3=#:G49 NIL) (|j| NIL) (#4=#:G48 NIL)
          (|i| NIL))
         (SEQ
          (EXIT
           (COND ((NULL (SPADCALL |x| (QREFELT % 15))) NIL)
                 ('T
                  (SEQ
                   (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                        (LETT #4# (SPADCALL |x| (QREFELT % 18))) G190
                        (COND ((> |i| #4#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                               (LETT #3# (SPADCALL |x| (QREFELT % 20))) G190
                               (COND ((> |j| #3#) (GO G191)))
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
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# NIL)
                                             (GO #5=#:G45)))
                                      (GO #6=#:G42))))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #1#))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                   (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;symmetric?;SB;3| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G58 NIL) (#2=#:G59 NIL) (#3=#:G61 NIL) (|j| NIL) (#4=#:G60 NIL)
          (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |x| (QREFELT % 12)) (QREFELT % 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT % 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT % 19)))
                  (SEQ (LETT |i| 0) (LETT #4# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| (+ |i| 1)) (LETT #3# (- |nRows| 1))
                              G190 (COND ((> |j| #3#) (GO G191)))
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
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G57)))
                                   (GO #6=#:G53))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;antisymmetric?;SB;4| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G70 NIL) (#2=#:G71 NIL) (#3=#:G73 NIL) (|j| NIL) (#4=#:G72 NIL)
          (|i| NIL) (|mc| (|Integer|)) (|mr| (|Integer|))
          (|nRows| (|Integer|)))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (LETT |nRows| (SPADCALL |x| (QREFELT % 11)))
                       (SPADCALL |x| (QREFELT % 12)) (QREFELT % 21))
             NIL)
            ('T
             (SEQ (LETT |mr| (SPADCALL |x| (QREFELT % 17)))
                  (LETT |mc| (SPADCALL |x| (QREFELT % 19)))
                  (SEQ (LETT |i| 0) (LETT #4# (- |nRows| 1)) G190
                       (COND ((|greater_SI| |i| #4#) (GO G191)))
                       (SEQ
                        (EXIT
                         (SEQ (LETT |j| |i|) (LETT #3# (- |nRows| 1)) G190
                              (COND ((> |j| #3#) (GO G191)))
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
                                   (LETT #1#
                                         (PROGN (LETT #2# NIL) (GO #5=#:G69)))
                                   (GO #6=#:G65))))))
                              (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL)))
                        #6# (EXIT #1#))
                       (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))))
          #5# (EXIT #2#)))) 

(SDEFUN |MATCAT-;zero;2NniS;5|
        ((|rows| (|NonNegativeInteger|)) (|cols| (|NonNegativeInteger|))
         (% (S)))
        (SPADCALL |rows| |cols| (|spadConstant| % 29) (QREFELT % 30))) 

(SDEFUN |MATCAT-;matrix;LS;6| ((|l| (|List| (|List| R))) (% (S)))
        (SPROG
         ((#1=#:G88 NIL) (|j| NIL) (#2=#:G89 NIL) (|r| NIL) (#3=#:G86 NIL)
          (|i| NIL) (#4=#:G87 NIL) (|ll| NIL) (|ans| (S))
          (|rows| (|NonNegativeInteger|)) (#5=#:G85 NIL)
          (|cols| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |l|) (SPADCALL 0 0 (QREFELT % 32)))
                ('T
                 (SEQ (LETT |rows| 1) (LETT |cols| (LENGTH (|SPADfirst| |l|)))
                      (SEQ (LETT |ll| NIL) (LETT #5# (CDR |l|)) G190
                           (COND
                            ((OR (ATOM #5#) (PROGN (LETT |ll| (CAR #5#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((SPADCALL |cols| (LENGTH |ll|) (QREFELT % 33))
                               (|error| "matrix: rows of different lengths"))
                              ('T (LETT |rows| (+ |rows| 1))))))
                           (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                      (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 32)))
                      (SEQ (LETT |ll| NIL) (LETT #4# |l|)
                           (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                           (LETT #3# (SPADCALL |ans| (QREFELT % 18))) G190
                           (COND
                            ((OR (> |i| #3#) (ATOM #4#)
                                 (PROGN (LETT |ll| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |r| NIL) (LETT #2# |ll|)
                                  (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                                  (LETT #1# (SPADCALL |ans| (QREFELT % 20)))
                                  G190
                                  (COND
                                   ((OR (> |j| #1#) (ATOM #2#)
                                        (PROGN (LETT |r| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (SPADCALL |ans| |i| |j| |r|
                                              (QREFELT % 34))))
                                  (LETT |j|
                                        (PROG1 (+ |j| 1) (LETT #2# (CDR #2#))))
                                  (GO G190) G191 (EXIT NIL))))
                           (LETT |i| (PROG1 (+ |i| 1) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |MATCAT-;matrix;2NniMS;7|
        ((|n| (|NonNegativeInteger|)) (|m| (|NonNegativeInteger|))
         (|f| (|Mapping| R (|Integer|) (|Integer|))) (% (S)))
        (SPROG ((#1=#:G98 NIL) (|j| NIL) (#2=#:G97 NIL) (|i| NIL) (|mat| (S)))
               (SEQ (LETT |mat| (SPADCALL |n| |m| (QREFELT % 32)))
                    (SEQ (LETT |i| (SPADCALL |mat| (QREFELT % 17)))
                         (LETT #2# (SPADCALL |mat| (QREFELT % 18))) G190
                         (COND ((> |i| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| (SPADCALL |mat| (QREFELT % 19)))
                                (LETT #1# (SPADCALL |mat| (QREFELT % 20))) G190
                                (COND ((> |j| #1#) (GO G191)))
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
        (SPROG ((#1=#:G106 NIL) (|a| NIL) (#2=#:G105 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |a| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (LIST (SPADCALL |a| (QREFELT % 11))
                                     (SPADCALL |a| (QREFELT % 12)))
                               #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |MATCAT-;zero?;SB;9| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G114 NIL) (#2=#:G116 NIL) (|j| NIL) (#3=#:G115 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 1))
                 (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
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
                            (PROGN (LETT #1# NIL) (GO #4=#:G113))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;10|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((#1=#:G121 NIL) (|i| NIL) (#2=#:G122 NIL) (|j| NIL) (|ans| (S)))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 1))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 1))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
                   (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;11| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((#1=#:G127 NIL) (|i| NIL) (#2=#:G128 NIL) (|j| NIL) (#3=#:G129 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #3# |l|) (LETT |j| (PROGN |ans| 1))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 1))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (QSETAREF2O |ans| |i| |j| |r| 1 1)))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;12|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G169 NIL) (|j| NIL) (#2=#:G168 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G167 NIL) (|rc| NIL)
          (#5=#:G166 NIL) (|r_step| #3#) (#6=#:G165 NIL) (#7=#:G164 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G163 NIL) (#9=#:G162 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
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
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
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
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
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
         ((|res| (S)) (|nc| #1=(|NonNegativeInteger|)) (#2=#:G200 NIL)
          (|rc| NIL) (#3=#:G199 NIL) (|nr| #1#) (#4=#:G198 NIL) (#5=#:G197 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
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
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #3# NIL)
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
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #3#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;14| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;15| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G247 NIL) (|j| NIL) (#3=#:G246 NIL) (#4=#:G245 NIL) (|i| NIL)
          (#5=#:G244 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G243 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G242 NIL) (#8=#:G241 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G240 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (ANROWS |a|))
                                     (LETT |nc| (ANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
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
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
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
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;16| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;17| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G265 NIL) (|j| NIL)
          (#2=#:G266 NIL) (|l| NIL) (#3=#:G263 NIL) (|i| NIL) (#4=#:G264 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G262 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G261 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (ANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (ANCOLS |mat|)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 1)) (LETT |loC| (PROGN |ans| 1))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (ANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (ANROWS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 1))
                             (LETT #4# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #3# |hiR|) G190
                             (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 1))
                                    (LETT #2# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;18| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G274 NIL) (#2=#:G276 NIL) (|j| NIL) (#3=#:G275 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 0))
                 (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
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
                            (PROGN (LETT #1# NIL) (GO #4=#:G273))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;19|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((#1=#:G281 NIL) (|i| NIL) (#2=#:G282 NIL) (|j| NIL) (|ans| (S)))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;20| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((#1=#:G287 NIL) (|i| NIL) (#2=#:G288 NIL) (|j| NIL) (#3=#:G289 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #3# |l|) (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;21|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G329 NIL) (|j| NIL) (#2=#:G328 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G327 NIL) (|rc| NIL)
          (#5=#:G326 NIL) (|r_step| #3#) (#6=#:G325 NIL) (#7=#:G324 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G323 NIL) (#9=#:G322 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
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
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
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
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
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
         ((|res| (S)) (|nc| #1=(|NonNegativeInteger|)) (#2=#:G360 NIL)
          (|rc| NIL) (#3=#:G359 NIL) (|nr| #1#) (#4=#:G358 NIL) (#5=#:G357 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
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
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #3# NIL)
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
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #3#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;23| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;24| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G407 NIL) (|j| NIL) (#3=#:G406 NIL) (#4=#:G405 NIL) (|i| NIL)
          (#5=#:G404 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G403 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G402 NIL) (#8=#:G401 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G400 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (DANROWS |a|))
                                     (LETT |nc| (DANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
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
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
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
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;25| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;26| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G425 NIL) (|j| NIL)
          (#2=#:G426 NIL) (|l| NIL) (#3=#:G423 NIL) (|i| NIL) (#4=#:G424 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G422 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G421 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (DANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (DANCOLS |mat|)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 0)) (LETT |loC| (PROGN |ans| 0))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (DANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (DANROWS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 0))
                             (LETT #4# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #3# |hiR|) G190
                             (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 0))
                                    (LETT #2# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;27| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G434 NIL) (#2=#:G436 NIL) (|j| NIL) (#3=#:G435 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (PROGN |x| 0))
                 (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
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
                            (PROGN (LETT #1# NIL) (GO #4=#:G433))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;28|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((#1=#:G441 NIL) (|i| NIL) (#2=#:G442 NIL) (|j| NIL) (|ans| (S)))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;29| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((#1=#:G447 NIL) (|i| NIL) (#2=#:G448 NIL) (|j| NIL) (#3=#:G449 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #3# |l|) (LETT |j| (PROGN |ans| 0))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (PROGN |ans| 0))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;30|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G489 NIL) (|j| NIL) (#2=#:G488 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G487 NIL) (|rc| NIL)
          (#5=#:G486 NIL) (|r_step| #3#) (#6=#:G485 NIL) (#7=#:G484 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G483 NIL) (#9=#:G482 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
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
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
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
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
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
         ((|res| (S)) (|nc| #1=(|NonNegativeInteger|)) (#2=#:G520 NIL)
          (|rc| NIL) (#3=#:G519 NIL) (|nr| #1#) (#4=#:G518 NIL) (#5=#:G517 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
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
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #3# NIL)
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
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #3#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;32| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;33| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G567 NIL) (|j| NIL) (#3=#:G566 NIL) (#4=#:G565 NIL) (|i| NIL)
          (#5=#:G564 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G563 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G562 NIL) (#8=#:G561 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G560 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (DANROWS |a|))
                                     (LETT |nc| (DANCOLS |a|))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
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
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
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
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;34| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;35| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G585 NIL) (|j| NIL)
          (#2=#:G586 NIL) (|l| NIL) (#3=#:G583 NIL) (|i| NIL) (#4=#:G584 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G582 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G581 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |rows| (+ |rows| (DANROWS |mat|)))
                        (EXIT (LETT |cols| (+ |cols| (DANCOLS |mat|)))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (PROGN |ans| 0)) (LETT |loC| (PROGN |ans| 0))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |hiR| (- (+ |loR| (DANROWS |mat|)) 1))
                        (LETT |hiC| (- (+ |loC| (DANROWS |mat|)) 1))
                        (SEQ (LETT |k| (PROGN |mat| 0))
                             (LETT #4# (SPADCALL |mat| (QREFELT % 18)))
                             (LETT |i| |loR|) (LETT #3# |hiR|) G190
                             (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |l| (PROGN |mat| 0))
                                    (LETT #2# (SPADCALL |mat| (QREFELT % 20)))
                                    (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;zero?;SB;36| ((|x| (S)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G594 NIL) (#2=#:G596 NIL) (|j| NIL) (#3=#:G595 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                 (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
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
                            (PROGN (LETT #1# NIL) (GO #4=#:G593))))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #4# (EXIT #1#)))) 

(SDEFUN |MATCAT-;scalarMatrix;NniRS;37|
        ((|n| (|NonNegativeInteger|)) (|r| (R)) (% (S)))
        (SPROG
         ((#1=#:G601 NIL) (|i| NIL) (#2=#:G602 NIL) (|j| NIL) (|ans| (S)))
         (SEQ (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND ((OR (> |i| #1#) (> |j| #2#)) (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT |j| (+ |j| 1)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;38| ((|l| (|List| R)) (% (S)))
        (SPROG
         ((#1=#:G607 NIL) (|i| NIL) (#2=#:G608 NIL) (|j| NIL) (#3=#:G609 NIL)
          (|r| NIL) (|ans| (S)) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (LENGTH |l|))
              (LETT |ans| (SPADCALL |n| |n| (QREFELT % 42)))
              (SEQ (LETT |r| NIL) (LETT #3# |l|)
                   (LETT |j| (SPADCALL |ans| (QREFELT % 19)))
                   (LETT #2# (SPADCALL |ans| (QREFELT % 20)))
                   (LETT |i| (SPADCALL |ans| (QREFELT % 17)))
                   (LETT #1# (SPADCALL |ans| (QREFELT % 18))) G190
                   (COND
                    ((OR (> |i| #1#) (> |j| #2#) (ATOM #3#)
                         (PROGN (LETT |r| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (SPADCALL |ans| |i| |j| |r| (QREFELT % 34))))
                   (LETT |i|
                         (PROG1 (+ |i| 1)
                           (LETT |j| (PROG1 (+ |j| 1) (LETT #3# (CDR #3#))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;kronecker_prod1;SILL2NniUV;39|
        ((|res| (S)) (|k| (|Integer|))
         (|dl| (|List| (|List| (|NonNegativeInteger|)))) (|l| (|List| S))
         (|r_off| (|NonNegativeInteger|)) (|c_off| (|NonNegativeInteger|))
         (|mu| (|Union| R "one")) (% (|Void|)))
        (SPROG
         ((|c_off1| (|NonNegativeInteger|)) (|mm| (R)) (|aij| (R))
          (#1=#:G649 NIL) (|j| NIL) (#2=#:G648 NIL) (|i| NIL)
          (|c_step| #3=(|NonNegativeInteger|)) (#4=#:G647 NIL) (|rc| NIL)
          (#5=#:G646 NIL) (|r_step| #3#) (#6=#:G645 NIL) (#7=#:G644 NIL)
          (|c_ind| (|NonNegativeInteger|)) (#8=#:G643 NIL) (#9=#:G642 NIL)
          (|m| (R)) (|a| (S)) (|nc| #10=(|NonNegativeInteger|)) (|nr| #10#)
          (|dp| (|List| (|NonNegativeInteger|))))
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
                         (SEQ (LETT |i| 1) (LETT #9# |nr|) G190
                              (COND ((|greater_SI| |i| #9#) (GO G191)))
                              (SEQ (LETT |r_off| (+ |r_off| 1))
                                   (LETT |c_ind| (+ |c_off| 1))
                                   (EXIT
                                    (SEQ (LETT |j| 1) (LETT #8# |nc|) G190
                                         (COND
                                          ((|greater_SI| |j| #8#) (GO G191)))
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
                                       (LETT #7# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #6# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #6#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #6#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #7#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #7#))))
                                            (LETT #6# (CDR #6#)) (GO G190) G191
                                            (EXIT (NREVERSE #7#))))
                                      (QREFELT % 51)))
                      (LETT |c_step|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (EXIT
                       (SEQ (LETT |i| 1) (LETT #2# |nr|) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ (LETT |c_off1| |c_off|)
                                 (SEQ (LETT |j| 1) (LETT #1# |nc|) G190
                                      (COND ((|greater_SI| |j| #1#) (GO G191)))
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
         ((|res| (S)) (|nc| #1=(|NonNegativeInteger|)) (#2=#:G680 NIL)
          (|rc| NIL) (#3=#:G679 NIL) (|nr| #1#) (#4=#:G678 NIL) (#5=#:G677 NIL)
          (|dl| (|List| (|List| (|NonNegativeInteger|))))
          (|k| (|NonNegativeInteger|)))
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
                                       (LETT #5# NIL)
                                       (SEQ (LETT |rc| NIL) (LETT #4# |dl|)
                                            G190
                                            (COND
                                             ((OR (ATOM #4#)
                                                  (PROGN
                                                   (LETT |rc| (CAR #4#))
                                                   NIL))
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #5#
                                                    (CONS
                                                     (SPADCALL |rc| 1
                                                               (QREFELT % 47))
                                                     #5#))))
                                            (LETT #4# (CDR #4#)) (GO G190) G191
                                            (EXIT (NREVERSE #5#))))
                                      (QREFELT % 51)))
                      (LETT |nc|
                            (SPADCALL (ELT % 49)
                                      (PROGN
                                       (LETT #3# NIL)
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
                                              (LETT #3#
                                                    (CONS
                                                     (SPADCALL |rc| 2
                                                               (QREFELT % 47))
                                                     #3#))))
                                            (LETT #2# (CDR #2#)) (GO G190) G191
                                            (EXIT (NREVERSE #3#))))
                                      (QREFELT % 51)))
                      (LETT |res| (SPADCALL |nr| |nc| (QREFELT % 42)))
                      (SPADCALL |res| |k| |dl| |l| 0 0 (CONS 1 "one")
                                (QREFELT % 56))
                      (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerProduct;3S;41| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 60))) 

(SDEFUN |MATCAT-;kroneckerSum;LS;42| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|n0| (|Integer|)) (|off0| (|NonNegativeInteger|))
          (|off_r| #1=(|NonNegativeInteger|)) (|ind_c| #1#) (|vv| (R))
          (#2=#:G727 NIL) (|j| NIL) (#3=#:G726 NIL) (#4=#:G725 NIL) (|i| NIL)
          (#5=#:G724 NIL) (|m| NIL) (|step0| (|NonNegativeInteger|))
          (|n2| (|NonNegativeInteger|)) (|dl| (|List| (|NonNegativeInteger|)))
          (|nr| (|NonNegativeInteger|)) (#6=#:G723 NIL) (|a| NIL) (|res| (S))
          (|nrs| (|NonNegativeInteger|)) (#7=#:G722 NIL) (#8=#:G721 NIL)
          (|nc| (|NonNegativeInteger|)) (#9=#:G720 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ (LETT |k| (LENGTH |l|))
              (EXIT
               (COND ((EQL |k| 0) (SPADCALL 1 1 (QREFELT % 42)))
                     ((EQL |k| 1) (SPADCALL (|SPADfirst| |l|) (QREFELT % 58)))
                     ('T
                      (SEQ (LETT |dl| NIL)
                           (SEQ (LETT |a| NIL) (LETT #9# |l|) G190
                                (COND
                                 ((OR (ATOM #9#)
                                      (PROGN (LETT |a| (CAR #9#)) NIL))
                                  (GO G191)))
                                (SEQ (LETT |nr| (SPADCALL |a| (QREFELT % 11)))
                                     (LETT |nc| (SPADCALL |a| (QREFELT % 12)))
                                     (EXIT
                                      (COND
                                       ((SPADCALL |nr| |nc| (QREFELT % 33))
                                        (|error|
                                         "kroneckerSum: nonsquare matrix"))
                                       ('T (LETT |dl| (CONS |nr| |dl|))))))
                                (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                           (LETT |dl| (NREVERSE |dl|))
                           (LETT |nrs|
                                 (SPADCALL (ELT % 49)
                                           (PROGN
                                            (LETT #8# NIL)
                                            (SEQ (LETT #7# |dl|) G190
                                                 (COND
                                                  ((OR (ATOM #7#)
                                                       (PROGN
                                                        (LETT |nr| (CAR #7#))
                                                        NIL))
                                                   (GO G191)))
                                                 (SEQ
                                                  (EXIT
                                                   (LETT #8# (CONS |nr| #8#))))
                                                 (LETT #7# (CDR #7#)) (GO G190)
                                                 G191 (EXIT (NREVERSE #8#))))
                                           (QREFELT % 51)))
                           (LETT |res| (SPADCALL |nrs| |nrs| (QREFELT % 42)))
                           (LETT |n0| 1)
                           (SEQ (LETT |a| NIL) (LETT #6# |l|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |a| (CAR #6#)) NIL))
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
                                                    (LETT #4# |nr|) G190
                                                    (COND
                                                     ((|greater_SI| |i| #4#)
                                                      (GO G191)))
                                                    (SEQ
                                                     (EXIT
                                                      (SEQ (LETT |l| 1)
                                                           (LETT #3# |n2|) G190
                                                           (COND
                                                            ((|greater_SI| |l|
                                                                           #3#)
                                                             (GO G191)))
                                                           (SEQ
                                                            (LETT |ind_c|
                                                                  (+ |off0|
                                                                     |l|))
                                                            (SEQ (LETT |j| 1)
                                                                 (LETT #2#
                                                                       |nr|)
                                                                 G190
                                                                 (COND
                                                                  ((|greater_SI|
                                                                    |j| #2#)
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
                                (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |MATCAT-;kroneckerSum;3S;43| ((|a| (S)) (|b| (S)) (% (S)))
        (SPADCALL (LIST |a| |b|) (QREFELT % 65))) 

(SDEFUN |MATCAT-;diagonalMatrix;LS;44| ((|list| (|List| S)) (% (S)))
        (SPROG
         ((|loC| (|Integer|)) (|loR| (|Integer|)) (#1=#:G745 NIL) (|j| NIL)
          (#2=#:G746 NIL) (|l| NIL) (#3=#:G743 NIL) (|i| NIL) (#4=#:G744 NIL)
          (|k| NIL) (|hiC| #5=(|Integer|)) (|hiR| #5#) (#6=#:G742 NIL)
          (|mat| NIL) (|ans| (S)) (|cols| #7=(|NonNegativeInteger|))
          (|rows| #7#) (#8=#:G741 NIL))
         (SEQ (LETT |rows| 0) (LETT |cols| 0)
              (SEQ (LETT |mat| NIL) (LETT #8# |list|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |mat| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |rows| (+ |rows| (SPADCALL |mat| (QREFELT % 11))))
                    (EXIT
                     (LETT |cols| (+ |cols| (SPADCALL |mat| (QREFELT % 12))))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (LETT |ans| (SPADCALL |rows| |cols| (QREFELT % 42)))
              (LETT |loR| (SPADCALL |ans| (QREFELT % 17)))
              (LETT |loC| (SPADCALL |ans| (QREFELT % 19)))
              (SEQ (LETT |mat| NIL) (LETT #6# |list|) G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |mat| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |hiR|
                          (- (+ |loR| (SPADCALL |mat| (QREFELT % 11))) 1))
                    (LETT |hiC|
                          (- (+ |loC| (SPADCALL |mat| (QREFELT % 11))) 1))
                    (SEQ (LETT |k| (SPADCALL |mat| (QREFELT % 17)))
                         (LETT #4# (SPADCALL |mat| (QREFELT % 18)))
                         (LETT |i| |loR|) (LETT #3# |hiR|) G190
                         (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |l| (SPADCALL |mat| (QREFELT % 19)))
                                (LETT #2# (SPADCALL |mat| (QREFELT % 20)))
                                (LETT |j| |loC|) (LETT #1# |hiC|) G190
                                (COND ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
                   (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |MATCAT-;coerce;ColS;45| ((|v| (|Col|)) (% (S)))
        (SPROG
         ((#1=#:G751 NIL) (|i| NIL) (#2=#:G752 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x| (SPADCALL (SPADCALL |v| (QREFELT % 68)) 1 (QREFELT % 32)))
          (LETT |one| (SPADCALL |x| (QREFELT % 19)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 69)))
               (LETT #2# (SPADCALL |v| (QREFELT % 70)))
               (LETT |i| (SPADCALL |x| (QREFELT % 17)))
               (LETT #1# (SPADCALL |x| (QREFELT % 18))) G190
               (COND ((OR (> |i| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |i| |one| (SPADCALL |v| |k| (QREFELT % 71))
                           (QREFELT % 34))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;transpose;RowS;46| ((|v| (|Row|)) (% (S)))
        (SPROG
         ((#1=#:G757 NIL) (|j| NIL) (#2=#:G758 NIL) (|k| NIL)
          (|one| (|Integer|)) (|x| (S)))
         (SEQ
          (LETT |x| (SPADCALL 1 (SPADCALL |v| (QREFELT % 73)) (QREFELT % 32)))
          (LETT |one| (SPADCALL |x| (QREFELT % 17)))
          (SEQ (LETT |k| (SPADCALL |v| (QREFELT % 74)))
               (LETT #2# (SPADCALL |v| (QREFELT % 75)))
               (LETT |j| (SPADCALL |x| (QREFELT % 19)))
               (LETT #1# (SPADCALL |x| (QREFELT % 20))) G190
               (COND ((OR (> |j| #1#) (> |k| #2#)) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |x| |one| |j| (SPADCALL |v| |k| (QREFELT % 76))
                           (QREFELT % 34))))
               (LETT |j| (PROG1 (+ |j| 1) (LETT |k| (+ |k| 1)))) (GO G190) G191
               (EXIT NIL))
          (EXIT |x|)))) 

(SDEFUN |MATCAT-;+;3S;47| ((|x| (S)) (|y| (S)) (% (S)))
        (SPROG
         ((#1=#:G770 NIL) (|j| NIL) (#2=#:G769 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
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
                      (LETT #2# (SPADCALL |x| (QREFELT % 18))) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                             (LETT #1# (SPADCALL |x| (QREFELT % 20))) G190
                             (COND ((> |j| #1#) (GO G191)))
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
         ((#1=#:G782 NIL) (|j| NIL) (#2=#:G781 NIL) (|i| NIL) (|ans| (S))
          (|c| (|NonNegativeInteger|)) (|r| (|NonNegativeInteger|)))
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
                      (LETT #2# (SPADCALL |x| (QREFELT % 18))) G190
                      (COND ((> |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SEQ (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                             (LETT #1# (SPADCALL |x| (QREFELT % 20))) G190
                             (COND ((> |j| #1#) (GO G191)))
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
         ((|entry| (R)) (|sum| (R)) (#1=#:G803 NIL) (|k| NIL) (#2=#:G804 NIL)
          (|l| NIL) (#3=#:G802 NIL) (|j| NIL) (#4=#:G801 NIL) (|i| NIL)
          (|ans| (S)))
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
                  (LETT #4# (SPADCALL |x| (QREFELT % 18))) G190
                  (COND ((> |i| #4#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |j| (SPADCALL |y| (QREFELT % 19)))
                         (LETT #3# (SPADCALL |y| (QREFELT % 20))) G190
                         (COND ((> |j| #3#) (GO G191)))
                         (SEQ
                          (LETT |entry|
                                (SEQ (LETT |sum| (|spadConstant| % 29))
                                     (SEQ
                                      (LETT |l| (SPADCALL |x| (QREFELT % 19)))
                                      (LETT #2# (SPADCALL |x| (QREFELT % 20)))
                                      (LETT |k| (SPADCALL |y| (QREFELT % 17)))
                                      (LETT #1# (SPADCALL |y| (QREFELT % 18)))
                                      G190
                                      (COND
                                       ((OR (> |k| #1#) (> |l| #2#))
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
                              (SPADCALL |x| (QUOTIENT2 |n| 2) (QREFELT % 89)))
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
         ((|sum| (R)) (#1=#:G821 NIL) (|j| NIL) (#2=#:G822 NIL) (|l| NIL)
          (#3=#:G819 NIL) (|i| NIL) (#4=#:G820 NIL) (|k| NIL) (|w| (|Col|)))
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
                  (LETT #4# (SPADCALL |w| (QREFELT % 70)))
                  (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                  (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                  (COND ((OR (> |i| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| % 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT % 69)))
                                    (LETT #2# (SPADCALL |v| (QREFELT % 70)))
                                    (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                                    (LETT #1# (SPADCALL |x| (QREFELT % 20)))
                                    G190
                                    (COND
                                     ((OR (> |j| #1#) (> |l| #2#)) (GO G191)))
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
         ((|sum| (R)) (#1=#:G833 NIL) (|i| NIL) (#2=#:G834 NIL) (|l| NIL)
          (#3=#:G831 NIL) (|j| NIL) (#4=#:G832 NIL) (|k| NIL) (|w| (|Row|)))
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
                  (LETT #4# (SPADCALL |w| (QREFELT % 75)))
                  (LETT |j| (SPADCALL |x| (QREFELT % 19)))
                  (LETT #3# (SPADCALL |x| (QREFELT % 20))) G190
                  (COND ((OR (> |j| #3#) (> |k| #4#)) (GO G191)))
                  (SEQ
                   (EXIT
                    (SPADCALL |w| |k|
                              (SEQ (LETT |sum| (|spadConstant| % 29))
                                   (SEQ
                                    (LETT |l| (SPADCALL |v| (QREFELT % 74)))
                                    (LETT #2# (SPADCALL |v| (QREFELT % 75)))
                                    (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                                    (LETT #1# (SPADCALL |x| (QREFELT % 18)))
                                    G190
                                    (COND
                                     ((OR (> |i| #1#) (> |l| #2#)) (GO G191)))
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
         ((|indRow| (|Integer|)) (|basis| (|List| |Col|)) (#1=#:G841 NIL)
          (|k| NIL) (|m| (|Integer|)) (|n| (|Integer|)) (M2 (S)))
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
         ((#1=#:G856 NIL) (|j| NIL) (#2=#:G855 NIL) (#3=#:G854 NIL) (|i| NIL)
          (#4=#:G853 NIL))
         (SEQ
          (SPADCALL
           (PROGN
            (LETT #4# NIL)
            (SEQ (LETT |i| 1) (LETT #3# |n|) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #4#
                         (CONS
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |j| 1) (LETT #1# |n|) G190
                                (COND ((|greater_SI| |j| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
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
                                         #2#))))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          #4#))))
                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                 (EXIT (NREVERSE #4#))))
           (QREFELT % 107))))) 

(SDEFUN |MATCAT-;PfChar| ((A (S)) (% #1=(|SparseUnivariatePolynomial| R)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| R)) (#2=#:G873 NIL) (|e| NIL)
          (#3=#:G874 NIL) (|k| NIL) (|c| (R)) (#4=#:G871 NIL) (|i| NIL)
          (#5=#:G872 NIL) (|j| NIL) (|g| (|List| R)) (C (S)) (#6=#:G870 NIL)
          (B (S)) (#7=#:G857 NIL) (|d| (|NonNegativeInteger|)) (|p| #1#)
          (|s| (S)) (|r| (S)) (M (S)) (|n| (|NonNegativeInteger|)))
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
                             (PROG1 (LETT #7# (- |n| 2))
                               (|check_subtype2| (> #7# 0) '(|PositiveInteger|)
                                                 '(|Integer|) #7#))
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
                              (SEQ (LETT |i| 4) (LETT #6# |d|) G190
                                   (COND ((> |i| #6#) (GO G191)))
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
                      (SEQ (LETT |j| 2) (LETT #5# (+ |d| 2)) (LETT |i| 0)
                           (LETT #4# |d|) G190
                           (COND
                            ((OR (> |i| #4#) (|greater_SI| |j| #5#))
                             (GO G191)))
                           (SEQ (LETT |c| (SPADCALL |p| |i| (QREFELT % 115)))
                                (EXIT
                                 (SEQ (LETT |k| 2) (LETT #3# (- |d|))
                                      (LETT |e| NIL)
                                      (LETT #2#
                                            (SPADCALL |g| |j| (QREFELT % 116)))
                                      G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |e| (CAR #2#)) NIL)
                                            (< |k| #3#))
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
                                      (LETT #2#
                                            (PROG1 (CDR #2#)
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
         ((|entry| (R)) (#1=#:G892 NIL) (|r| (|Union| R "failed"))
          (#2=#:G894 NIL) (|j| NIL) (#3=#:G893 NIL) (|i| NIL) (|ans| (S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ans|
                  (SPADCALL (SPADCALL |x| (QREFELT % 11))
                            (SPADCALL |x| (QREFELT % 12)) (QREFELT % 32)))
            (SEQ (LETT |i| (SPADCALL |x| (QREFELT % 17)))
                 (LETT #3# (SPADCALL |x| (QREFELT % 18))) G190
                 (COND ((> |i| #3#) (GO G191)))
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
                                    (LETT #1# (CONS 1 "failed"))
                                    (GO #4=#:G891)))
                                  ('T (QCDR |r|))))))
                         (EXIT
                          (SPADCALL |ans| |i| |j| |entry| (QREFELT % 34))))
                        (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
            (EXIT (CONS 0 |ans|))))
          #4# (EXIT #1#)))) 

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
        (SPROG ((|xInv| (|Union| S "failed")) (|nn| (|NonNegativeInteger|)))
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
   ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
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
              (64 . |antisymmetric?|) (69 . |Zero|) (73 . |new|)
              |MATCAT-;zero;2NniS;5| (80 . |qnew|) (86 . ~=) (92 . |qsetelt!|)
              (|List| 44) |MATCAT-;matrix;LS;6| (|Mapping| 7 16 16)
              |MATCAT-;matrix;2NniMS;7| (100 . |One|) '|maybe_1|
              (104 . |zero?|) (109 . |zero|) (115 . |scalarMatrix|) (|List| 7)
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
              (461 . |Zero|) (465 . |coefficient|) (471 . |first|)
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
                                              0 0 49 2 46 10 50 0 51 7 6 52 0
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
