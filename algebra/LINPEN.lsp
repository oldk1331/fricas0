
(SDEFUN |LINPEN;qnew;3Nni%;1|
        ((|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|A_ref| (|Matrix| R)) (|A_lst| (|List| (|Matrix| R))) (|k| NIL)
          (#1=#:G135 NIL))
         (SEQ (LETT |A_ref| (MAKE_MATRIX1 |m| |n| (|spadConstant| % 8)))
              (LETT |A_lst| (SPADCALL |l| |A_ref| (QREFELT % 12)))
              (SEQ (LETT |k| 2) (LETT #1# |l|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |A_lst| |k|
                               (MAKE_MATRIX1 |m| |n| (|spadConstant| % 8))
                               (QREFELT % 14))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT (VECTOR |m| |n| |A_lst|))))) 

(SDEFUN |LINPEN;copy;2%;2| ((|p| (%)) (% (%)))
        (SPROG ((|A_lst| (|List| (|Matrix| R))) (|k| NIL) (#1=#:G141 NIL))
               (SEQ (LETT |A_lst| (SPADCALL (QVELT |p| 2) (QREFELT % 16)))
                    (SEQ (LETT |k| 1) (LETT #1# (LENGTH |A_lst|)) G190
                         (COND ((|greater_SI| |k| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SPADCALL |A_lst| |k|
                                     (SPADCALL
                                      (SPADCALL (QVELT |p| 2) |k|
                                                (QREFELT % 17))
                                      (QREFELT % 18))
                                     (QREFELT % 14))))
                         (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                    (EXIT (VECTOR (QVELT |p| 0) (QVELT |p| 1) |A_lst|))))) 

(SDEFUN |LINPEN;append;%Nni%;3|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|A_ref| (|Matrix| R)) (|A_lst| (|List| (|Matrix| R)))
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|))
          (#1=#:G149 NIL) (|k| NIL) (#2=#:G150 NIL))
         (SEQ
          (LETT |A_ref|
                (SPADCALL (SPADCALL (QVELT |p| 2) 1 (QREFELT % 17))
                          (QREFELT % 18)))
          (LETT |A_lst|
                (SPADCALL (+ (LENGTH (QVELT |p| 2)) |l|) |A_ref|
                          (QREFELT % 12)))
          (LETT |m| (ANROWS |A_ref|)) (LETT |n| (ANCOLS |A_ref|))
          (SEQ (LETT |k| 2) (LETT #1# (LENGTH (QVELT |p| 2))) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |A_lst| |k|
                           (SPADCALL
                            (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17))
                            (QREFELT % 18))
                           (QREFELT % 14))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| 1) (LETT #2# |l|) G190
               (COND ((|greater_SI| |k| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (SPADCALL |A_lst| (+ (LENGTH (QVELT |p| 2)) |k|)
                           (MAKE_MATRIX1 |m| |n| (|spadConstant| % 8))
                           (QREFELT % 14))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT (VECTOR (QVELT |p| 0) (QVELT |p| 1) |A_lst|))))) 

(SDEFUN |LINPEN;append!;%Nni%;4|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|A_ref| (|Matrix| R)) (|A_lst| (|List| (|Matrix| R)))
          (|m| (|NonNegativeInteger|)) (|n| (|NonNegativeInteger|)) (|k| NIL)
          (#1=#:G156 NIL))
         (SEQ (LETT |A_ref| (SPADCALL (QVELT |p| 2) 1 (QREFELT % 17)))
              (LETT |A_lst| (SPADCALL |l| |A_ref| (QREFELT % 12)))
              (LETT |m| (ANROWS |A_ref|)) (LETT |n| (ANCOLS |A_ref|))
              (SEQ (LETT |k| 1) (LETT #1# |l|) G190
                   (COND ((|greater_SI| |k| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |A_lst| |k|
                               (MAKE_MATRIX1 |m| |n| (|spadConstant| % 8))
                               (QREFELT % 14))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (QSETVELT |p| 2 (SPADCALL (QVELT |p| 2) |A_lst| (QREFELT % 22)))
              (EXIT |p|)))) 

(SDEFUN |LINPEN;coerce;%Of;5| ((|p| (%)) (% (|OutputForm|)))
        (SPADCALL (QVELT |p| 2) (QREFELT % 25))) 

(MAKEPROP '|LINPEN;nrows;%Nni;6| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 0))) 

(SDEFUN |LINPEN;nrows;%Nni;6| ((|p| (%)) (% (|NonNegativeInteger|)))
        (QVELT |p| 0)) 

(MAKEPROP '|LINPEN;ncols;%Nni;7| '|SPADreplace| '(XLAM (|p|) (QVELT |p| 1))) 

(SDEFUN |LINPEN;ncols;%Nni;7| ((|p| (%)) (% (|NonNegativeInteger|)))
        (QVELT |p| 1)) 

(SDEFUN |LINPEN;nelem;%Nni;8| ((|p| (%)) (% (|NonNegativeInteger|)))
        (LENGTH (QVELT |p| 2))) 

(SDEFUN |LINPEN;=;2%B;9| ((|p| (%)) (|q| (%)) (% (|Boolean|)))
        (SPROG
         ((#1=#:G172 NIL) (|k| NIL) (#2=#:G173 NIL) (|flg_wrk| (|Boolean|))
          (#3=#:G171 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |flg_wrk| 'T)
                (COND
                 ((NULL (EQL (LENGTH (QVELT |p| 2)) (LENGTH (QVELT |q| 2))))
                  (COND
                   ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
                    (COND
                     ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                      (PROGN (LETT #1# NIL) (GO #4=#:G170))))))))
                (SEQ
                 (EXIT
                  (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                       (COND ((|greater_SI| |k| #2#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17))
                             (SPADCALL (QVELT |q| 2) |k| (QREFELT % 17))
                             (QREFELT % 31)))
                           (SEQ (LETT |flg_wrk| NIL)
                                (EXIT
                                 (PROGN
                                  (LETT #3# |$NoValue|)
                                  (GO #5=#:G168))))))))
                       (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL)))
                 #5# (EXIT #3#))
                (EXIT |flg_wrk|)))
          #4# (EXIT #1#)))) 

(SDEFUN |LINPEN;equal?;%L%LB;10|
        ((|p| (%)) (|lst_p| (|List| (|NonNegativeInteger|))) (|q| (%))
         (|lst_q| (|List| (|NonNegativeInteger|))) (% (|Boolean|)))
        (SPROG
         ((|flg_p| #1=(|List| (|Boolean|))) (|flg_q| #1#) (#2=#:G193 NIL)
          (|l_p| #3=(|NonNegativeInteger|)) (|l_q| #3#) (#4=#:G194 NIL)
          (|k| NIL) (#5=#:G195 NIL) (#6=#:G192 NIL))
         (SEQ
          (EXIT
           (COND
            ((SPADCALL (SPADCALL |lst_p| (QREFELT % 34))
                       (SPADCALL |lst_q| (QREFELT % 34)) (QREFELT % 35))
             (|error|
              "LINPEN: equal?(%,lst_p,%,lst_q) - index lists have different lengths."))
            ('T
             (SEQ
              (COND
               ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
                (COND
                 ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                  (PROGN (LETT #6# NIL) (GO #7=#:G191))))))
              (LETT |flg_p|
                    (SPADCALL (LENGTH (QVELT |p| 2)) 'T (QREFELT % 37)))
              (LETT |flg_q|
                    (SPADCALL (LENGTH (QVELT |q| 2)) 'T (QREFELT % 37)))
              (SEQ (LETT |k| 1) (LETT #2# (SPADCALL |lst_p| (QREFELT % 34)))
                   G190 (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ (LETT |l_p| (SPADCALL |lst_p| |k| (QREFELT % 38)))
                        (LETT |l_q| (SPADCALL |lst_q| |k| (QREFELT % 38)))
                        (COND
                         ((NULL
                           (SPADCALL
                            (SPADCALL (QVELT |p| 2) |l_p| (QREFELT % 17))
                            (SPADCALL (QVELT |q| 2) |l_q| (QREFELT % 17))
                            (QREFELT % 31)))
                          (PROGN (LETT #6# NIL) (GO #7#))))
                        (SPADCALL |flg_p| |l_p| NIL (QREFELT % 39))
                        (EXIT (SPADCALL |flg_q| |l_q| NIL (QREFELT % 39))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #4# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |flg_p| |k| (QREFELT % 40))
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17))
                                    (QREFELT % 41)))
                         (PROGN (LETT #6# NIL) (GO #7#))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #5# (LENGTH (QVELT |q| 2))) G190
                   (COND ((|greater_SI| |k| #5#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |flg_q| |k| (QREFELT % 40))
                       (COND
                        ((NULL
                          (SPADCALL (SPADCALL (QVELT |q| 2) |k| (QREFELT % 17))
                                    (QREFELT % 41)))
                         (PROGN (LETT #6# NIL) (GO #7#))))))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT 'T)))))
          #7# (EXIT #6#)))) 

(SDEFUN |LINPEN;qequal?;%L%LNniB;11|
        ((|p| (%)) (|lst_p| (|List| (|NonNegativeInteger|))) (|q| (%))
         (|lst_q| (|List| (|NonNegativeInteger|)))
         (|off| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((|flg_p| #1=(|List| (|Boolean|))) (|flg_q| #1#) (#2=#:G218 NIL)
          (|l_p| #3=(|NonNegativeInteger|)) (|l_q| #3#) (|A_p| #4=(|Matrix| R))
          (|A_q| #4#) (|i| NIL) (#5=#:G219 NIL) (|j| NIL) (#6=#:G220 NIL)
          (#7=#:G221 NIL) (|k| NIL) (#8=#:G222 NIL) (#9=#:G217 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((NULL (EQL (QVELT |p| 1) (QVELT |q| 1)))
              (COND
               ((NULL (EQL (QVELT |p| 0) (QVELT |q| 0)))
                (PROGN (LETT #9# NIL) (GO #10=#:G216))))))
            (LETT |flg_p| (SPADCALL (LENGTH (QVELT |p| 2)) 'T (QREFELT % 37)))
            (LETT |flg_q| (SPADCALL (LENGTH (QVELT |q| 2)) 'T (QREFELT % 37)))
            (SEQ (LETT |k| 1) (LETT #2# (SPADCALL |lst_p| (QREFELT % 34))) G190
                 (COND ((|greater_SI| |k| #2#) (GO G191)))
                 (SEQ (LETT |l_p| (SPADCALL |lst_p| |k| (QREFELT % 38)))
                      (LETT |l_q| (SPADCALL |lst_q| |k| (QREFELT % 38)))
                      (LETT |A_p|
                            (SPADCALL (QVELT |p| 2) |l_p| (QREFELT % 17)))
                      (LETT |A_q|
                            (SPADCALL (QVELT |q| 2) |l_q| (QREFELT % 17)))
                      (SEQ (LETT |i| |off|) (LETT #5# (QVELT |p| 0)) G190
                           (COND ((> |i| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| |off|) (LETT #6# (QVELT |p| 1))
                                  G190 (COND ((> |j| #6#) (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (COND
                                     ((NULL
                                       (SPADCALL (QAREF2O |A_p| |i| |j| 1 1)
                                                 (QAREF2O |A_q| |i| |j| 1 1)
                                                 (QREFELT % 43)))
                                      (PROGN (LETT #9# NIL) (GO #10#))))))
                                  (LETT |j| (+ |j| 1)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                      (SPADCALL |flg_p| |l_p| NIL (QREFELT % 39))
                      (EXIT (SPADCALL |flg_q| |l_q| NIL (QREFELT % 39))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #7# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |k| #7#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |flg_p| |k| (QREFELT % 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17))
                                  (QREFELT % 41)))
                       (PROGN (LETT #9# NIL) (GO #10#))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (SEQ (LETT |k| 1) (LETT #8# (LENGTH (QVELT |q| 2))) G190
                 (COND ((|greater_SI| |k| #8#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((SPADCALL |flg_q| |k| (QREFELT % 40))
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL (QVELT |q| 2) |k| (QREFELT % 17))
                                  (QREFELT % 41)))
                       (PROGN (LETT #9# NIL) (GO #10#))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #10# (EXIT #9#)))) 

(SDEFUN |LINPEN;qzero?;%2NniB;12|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG ((|l| NIL) (#1=#:G229 NIL) (#2=#:G228 NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |l| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                       (COND ((|greater_SI| |l| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL
                             (QAREF2O
                              (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i|
                              |j| 1 1)
                             (QREFELT % 45)))
                           (PROGN (LETT #2# NIL) (GO #3=#:G227))))))
                       (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                  (EXIT 'T)))
                #3# (EXIT #2#)))) 

(SDEFUN |LINPEN;qzero?;%4NniB;13|
        ((|p| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (% (|Boolean|)))
        (SPROG
         ((|l| NIL) (#1=#:G242 NIL) (|A_wrk| (|Matrix| R)) (|i| NIL)
          (#2=#:G243 NIL) (|j| NIL) (#3=#:G244 NIL) (#4=#:G241 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |l| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |l| #1#) (GO G191)))
                 (SEQ
                  (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                  (EXIT
                   (SEQ (LETT |i| |i_min|) (LETT #2# |i_max|) G190
                        (COND ((> |i| #2#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |j| |j_min|) (LETT #3# |j_max|) G190
                               (COND ((> |j| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                              (QREFELT % 45)))
                                   (PROGN (LETT #4# NIL) (GO #5=#:G240))))))
                               (LETT |j| (+ |j| 1)) (GO G190) G191
                               (EXIT NIL))))
                        (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))))
                 (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #4#)))) 

(SDEFUN |LINPEN;qzero?;%5NniB;14|
        ((|p| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (|i| NIL) (#1=#:G254 NIL) (|j| NIL)
          (#2=#:G255 NIL) (#3=#:G253 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                (SEQ (LETT |i| |i_min|) (LETT #1# |i_max|) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |j_min|) (LETT #2# |j_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                           (QREFELT % 45)))
                                (PROGN (LETT #3# NIL) (GO #4=#:G252))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;qsemizero?;%5NniB;15|
        ((|p| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|k| NIL) (#1=#:G268 NIL) (|A_wrk| (|Matrix| R)) (|i| NIL)
          (#2=#:G269 NIL) (|j| NIL) (#3=#:G270 NIL) (#4=#:G267 NIL))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                 (COND ((|greater_SI| |k| #1#) (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (EQL |k| |l|))
                     (SEQ
                      (LETT |A_wrk|
                            (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                      (EXIT
                       (SEQ (LETT |i| |i_min|) (LETT #2# |i_max|) G190
                            (COND ((> |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (SEQ (LETT |j| |j_min|) (LETT #3# |j_max|) G190
                                   (COND ((> |j| #3#) (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (COND
                                      ((NULL
                                        (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                                  (QREFELT % 45)))
                                       (PROGN
                                        (LETT #4# NIL)
                                        (GO #5=#:G266))))))
                                   (LETT |j| (+ |j| 1)) (GO G190) G191
                                   (EXIT NIL))))
                            (LETT |i| (+ |i| 1)) (GO G190) G191
                            (EXIT NIL))))))))
                 (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
            (EXIT 'T)))
          #5# (EXIT #4#)))) 

(SDEFUN |LINPEN;zero?;%2NniB;16|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|l| NIL) (#1=#:G280 NIL) (|flg_wrk| (|Boolean|)) (#2=#:G279 NIL))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: zero?(%,i,j) - index out of range."))
           ('T
            (SEQ (LETT |flg_wrk| 'T)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |l| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                        (COND ((|greater_SI| |l| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((SPADCALL
                             (QAREF2O
                              (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i|
                              |j| 1 1)
                             (|spadConstant| % 8) (QREFELT % 50))
                            (SEQ (LETT |flg_wrk| NIL)
                                 (EXIT
                                  (PROGN (LETT #2# 1) (GO #3=#:G276))))))))
                        (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL)))
                  #3# (EXIT #2#))
                 (EXIT |flg_wrk|))))))) 

(SDEFUN |LINPEN;diagonal?;%NniB;17|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (|Boolean|)))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: diagonal?(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT % 52))))) 

(SDEFUN |LINPEN;qdiagonal?;%3NniB;18|
        ((|p| (%)) (|k_min| (|NonNegativeInteger|))
         (|k_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (|i| NIL) (#1=#:G292 NIL) (|j| NIL)
          (#2=#:G293 NIL) (#3=#:G291 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                (SEQ (LETT |i| |k_min|) (LETT #1# |k_max|) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL (EQL |i| |j|))
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT % 45)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G290))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;diagonal;%NniL;19|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (|List| R)))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: diagonal(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT % 55))))) 

(SDEFUN |LINPEN;qdiagonal;%3NniL;20|
        ((|p| (%)) (|k_min| (|NonNegativeInteger|))
         (|k_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|List| R)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (#1=#:G297 NIL) (|n| (|NonNegativeInteger|))
          (|lst_wrk| (|List| R)) (|k| NIL) (#2=#:G302 NIL))
         (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
              (LETT |n|
                    (PROG1 (LETT #1# (- (+ |k_max| 1) |k_min|))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#)))
              (LETT |lst_wrk|
                    (SPADCALL |n| (|spadConstant| % 8) (QREFELT % 57)))
              (SEQ (LETT |k| 0) (LETT #2# (- |n| 1)) G190
                   (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SPADCALL |lst_wrk| (+ |k| 1)
                               (QAREF2O |A_wrk| (+ |k_min| |k|) (+ |k_min| |k|)
                                        1 1)
                               (QREFELT % 58))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lst_wrk|)))) 

(SDEFUN |LINPEN;uppertriangular?;%NniB;21|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (|Boolean|)))
        (COND
         ((> |l| (LENGTH (QVELT |p| 2)))
          (|error| "LINPEN: uppertriangular?(%,l) - index out of range."))
         ('T
          (SPADCALL |p| 1 (MIN (QVELT |p| 0) (QVELT |p| 1)) |l|
                    (QREFELT % 59))))) 

(SDEFUN |LINPEN;quppertriangular?;%3NniB;22|
        ((|p| (%)) (|k_min| (|NonNegativeInteger|))
         (|k_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (|i| NIL) (#1=#:G314 NIL) (|j| NIL)
          (#2=#:G315 NIL) (#3=#:G313 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                (SEQ (LETT |i| |k_min|) (LETT #1# |k_max|) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((< |j| |i|)
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT % 45)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G312))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;qnilpotent?;%3NniB;23|
        ((|p| (%)) (|k_min| (|NonNegativeInteger|))
         (|k_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Boolean|)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (|i| NIL) (#1=#:G325 NIL) (|j| NIL)
          (#2=#:G326 NIL) (#3=#:G324 NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                (SEQ (LETT |i| |k_min|) (LETT #1# |k_max|) G190
                     (COND ((> |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| |k_min|) (LETT #2# |k_max|) G190
                            (COND ((> |j| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((<= |j| |i|)
                                (COND
                                 ((NULL
                                   (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                             (QREFELT % 45)))
                                  (PROGN (LETT #3# NIL) (GO #4=#:G323))))))))
                            (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                     (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;qcolumnIndices;%2NniL;24|
        ((|p| (%)) (|off| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G327 NIL) (|n| (|NonNegativeInteger|))
          (|lst_row| (|List| (|List| (|NonNegativeInteger|))))
          (|A_wrk| (|Matrix| R)) (|i| NIL) (#2=#:G339 NIL) (|j| NIL)
          (#3=#:G340 NIL) (#4=#:G331 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#5=#:G334 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #1# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |lst_row| (SPADCALL |n| NIL (QREFELT % 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
          (SEQ (LETT |i| |off|) (LETT #2# (QVELT |p| 0)) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |j| (QVELT |p| 1)) (LETT #3# |off|) G190
                         (COND ((< |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                        (QREFELT % 45)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #4# (- (+ |j| 1) |off|))
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    |lst_tmp|))))))
                         (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #5# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (EXIT (SPADCALL |lst_row| |k| |lst_tmp| (QREFELT % 64))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_row|)))) 

(SDEFUN |LINPEN;qcolumnIndices;%3NniL;25|
        ((|p| (%)) (|off| (|NonNegativeInteger|)) (|i| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G341 NIL) (|n| (|NonNegativeInteger|)) (#2=#:G342 NIL)
          (|i_wrk| (|NonNegativeInteger|)) (|A_wrk| (|Matrix| R)) (|j| NIL)
          (#3=#:G350 NIL) (#4=#:G345 NIL)
          (|lst_col| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #1# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |i_wrk|
                (PROG1 (LETT #2# (- (+ |off| |i|) 1))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT % 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
          (LETT |lst_col| NIL)
          (SEQ (LETT |j| (QVELT |p| 1)) (LETT #3# |off|) G190
               (COND ((< |j| #3#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (QAREF2O |A_wrk| |i_wrk| |j| 1 1)
                              (QREFELT % 45)))
                   (LETT |lst_col|
                         (CONS
                          (PROG1 (LETT #4# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #4# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #4#))
                          |lst_col|))))))
               (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qcolumnIndices;%NniL;26|
        ((|p| (%)) (|off| (|NonNegativeInteger|))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G351 NIL) (|n| (|NonNegativeInteger|))
          (|lst_row| (|List| (|List| (|NonNegativeInteger|)))) (|i| NIL)
          (#2=#:G363 NIL) (|j| NIL) (#3=#:G364 NIL) (#4=#:G354 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#5=#:G357 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #1# (- (+ (QVELT |p| 0) 1) |off|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |lst_row| (SPADCALL |n| NIL (QREFELT % 63)))
          (SEQ (LETT |i| |off|) (LETT #2# (QVELT |p| 0)) G190
               (COND ((> |i| #2#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |j| (QVELT |p| 1)) (LETT #3# |off|) G190
                         (COND ((< |j| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |p| |i| |j| (QREFELT % 46)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #4# (- (+ |j| 1) |off|))
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    |lst_tmp|))))))
                         (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #5# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (EXIT (SPADCALL |lst_row| |k| |lst_tmp| (QREFELT % 64))))
               (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_row|)))) 

(SDEFUN |LINPEN;qrowIndices;%3NniL;27|
        ((|p| (%)) (|off| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (|List| (|NonNegativeInteger|))))
        (SPROG
         ((#1=#:G365 NIL) (|j_wrk| (|NonNegativeInteger|))
          (|A_wrk| (|Matrix| R)) (|i| NIL) (#2=#:G373 NIL) (#3=#:G368 NIL)
          (|lst_col| (|List| (|NonNegativeInteger|))))
         (SEQ
          (LETT |j_wrk|
                (PROG1 (LETT #1# (- (+ |off| |j|) 1))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
          (LETT |lst_col| NIL)
          (SEQ (LETT |i| (QVELT |p| 0)) (LETT #2# |off|) G190
               (COND ((< |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL
                    (SPADCALL (QAREF2O |A_wrk| |i| |j_wrk| 1 1)
                              (QREFELT % 45)))
                   (LETT |lst_col|
                         (CONS
                          (PROG1 (LETT #3# (- (+ |i| 1) |off|))
                            (|check_subtype2| (>= #3# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #3#))
                          |lst_col|))))))
               (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qrowIndices;%2NniL;28|
        ((|p| (%)) (|off| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G374 NIL) (|n| (|NonNegativeInteger|))
          (|lst_col| (|List| (|List| (|NonNegativeInteger|))))
          (|A_wrk| (|Matrix| R)) (|j| NIL) (#2=#:G386 NIL) (|i| NIL)
          (#3=#:G387 NIL) (#4=#:G378 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#5=#:G381 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #1# (- (+ (QVELT |p| 1) 1) |off|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT % 63)))
          (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
          (SEQ (LETT |j| |off|) (LETT #2# (QVELT |p| 1)) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |i| (QVELT |p| 0)) (LETT #3# |off|) G190
                         (COND ((< |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL
                              (SPADCALL (QAREF2O |A_wrk| |i| |j| 1 1)
                                        (QREFELT % 45)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #4# (- (+ |i| 1) |off|))
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    |lst_tmp|))))))
                         (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #5# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (EXIT (SPADCALL |lst_col| |k| |lst_tmp| (QREFELT % 64))))
               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qrowIndices;%NniL;29|
        ((|p| (%)) (|off| (|NonNegativeInteger|))
         (% (|List| (|List| (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G388 NIL) (|n| (|NonNegativeInteger|))
          (|lst_col| (|List| (|List| (|NonNegativeInteger|)))) (|j| NIL)
          (#2=#:G400 NIL) (|i| NIL) (#3=#:G401 NIL) (#4=#:G391 NIL)
          (|lst_tmp| (|List| (|NonNegativeInteger|))) (#5=#:G394 NIL)
          (|k| (|NonNegativeInteger|)))
         (SEQ
          (LETT |n|
                (PROG1 (LETT #1# (- (+ (QVELT |p| 1) 1) |off|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
          (LETT |lst_col| (SPADCALL |n| NIL (QREFELT % 63)))
          (SEQ (LETT |j| |off|) (LETT #2# (QVELT |p| 1)) G190
               (COND ((> |j| #2#) (GO G191)))
               (SEQ (LETT |lst_tmp| NIL)
                    (SEQ (LETT |i| (QVELT |p| 0)) (LETT #3# |off|) G190
                         (COND ((< |i| #3#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((NULL (SPADCALL |p| |i| |j| (QREFELT % 46)))
                             (LETT |lst_tmp|
                                   (CONS
                                    (PROG1 (LETT #4# (- (+ |i| 1) |off|))
                                      (|check_subtype2| (>= #4# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #4#))
                                    |lst_tmp|))))))
                         (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
                    (LETT |k|
                          (PROG1 (LETT #5# (- (+ |j| 1) |off|))
                            (|check_subtype2| (>= #5# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #5#)))
                    (EXIT (SPADCALL |lst_col| |k| |lst_tmp| (QREFELT % 64))))
               (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_col|)))) 

(SDEFUN |LINPEN;qelt;%3NniR;30|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (R)))
        (QAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i| |j| 1 1)) 

(SDEFUN |LINPEN;elt;%3NniR;31|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (% (R)))
        (SPROG ((|A_wrk| (|Matrix| R)))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                              (> |l| (LENGTH (QVELT |p| 2))))))
                  (|error| "LINPEN: elt(%,i,j,l) - index out of range."))
                 ('T
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                   (EXIT (QAREF2O |A_wrk| |i| |j| 1 1)))))))) 

(SDEFUN |LINPEN;elt;%2NniL;32|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|List| R)))
        (SPROG
         ((|lst_wrk| (|List| R)) (|k| NIL) (#1=#:G418 NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: elt(%,i,j) - index out of range."))
           ('T
            (SEQ
             (LETT |lst_wrk|
                   (SPADCALL (LENGTH (QVELT |p| 2)) (|spadConstant| % 8)
                             (QREFELT % 57)))
             (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                  (COND ((|greater_SI| |k| #1#) (GO G191)))
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                   (EXIT
                    (SPADCALL |lst_wrk| |k| (QAREF2O |A_wrk| |i| |j| 1 1)
                              (QREFELT % 58))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT |lst_wrk|))))))) 

(SDEFUN |LINPEN;qelt;%2NniL;33|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (|List| R)))
        (SPROG
         ((|lst_wrk| (|List| R)) (|k| NIL) (#1=#:G425 NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (LETT |lst_wrk|
                (SPADCALL (LENGTH (QVELT |p| 2)) (|spadConstant| % 8)
                          (QREFELT % 57)))
          (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
               (COND ((|greater_SI| |k| #1#) (GO G191)))
               (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (EXIT
                     (SPADCALL |lst_wrk| |k| (QAREF2O |A_wrk| |i| |j| 1 1)
                               (QREFELT % 58))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_wrk|)))) 

(SDEFUN |LINPEN;matrix;%NniM;34|
        ((|p| (%)) (|l| (|NonNegativeInteger|)) (% (|Matrix| R)))
        (COND
         ((OR (< |l| 1) (> |l| (LENGTH (QVELT |p| 2))))
          (|error| "LINPEN: matrix(%,l) - index out of range."))
         ('T (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17))))) 

(SDEFUN |LINPEN;subMatrix;%5NniM;35|
        ((|p| (%)) (|r_min| (|NonNegativeInteger|))
         (|r_max| (|NonNegativeInteger|)) (|c_min| (|NonNegativeInteger|))
         (|c_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (% (|Matrix| R)))
        (COND
         ((OR (OR (< |r_min| 1) (> |r_min| |r_max|))
              (OR
               (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                   (> |c_min| |c_max|))
               (OR (OR (> |c_max| (QVELT |p| 1)) (< |l| 1))
                   (> |l| (LENGTH (QVELT |p| 2))))))
          (|error|
           "LINPEN: subMatrix(%,r_min,r_max,c_min,c_max,l) - index out of range."))
         ('T
          (SPADCALL (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |r_min| |r_max|
                    |c_min| |c_max| (QREFELT % 76))))) 

(SDEFUN |LINPEN;subPencil;%4Nni%;36|
        ((|p| (%)) (|r_min| (|NonNegativeInteger|))
         (|r_max| (|NonNegativeInteger|)) (|c_min| (|NonNegativeInteger|))
         (|c_max| (|NonNegativeInteger|)) (% (%)))
        (SPROG
         ((|A_lst| (|List| (|Matrix| R))) (|k| NIL) (#1=#:G443 NIL)
          (#2=#:G439 NIL) (|m_new| (|NonNegativeInteger|)) (#3=#:G440 NIL)
          (|n_new| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((OR (OR (< |r_min| 1) (> |r_min| |r_max|))
                (OR
                 (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                     (> |c_min| |c_max|))
                 (> |c_max| (QVELT |p| 1))))
            (|error|
             "LINPEN: subPencil(%,r_min,r_max,c_min,c_max) - index out of range."))
           ('T
            (SEQ (LETT |A_lst| (SPADCALL (QVELT |p| 2) (QREFELT % 16)))
                 (SEQ (LETT |k| 1) (LETT #1# (LENGTH |A_lst|)) G190
                      (COND ((|greater_SI| |k| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (SPADCALL |A_lst| |k|
                                  (SPADCALL
                                   (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17))
                                   |r_min| |r_max| |c_min| |c_max|
                                   (QREFELT % 76))
                                  (QREFELT % 14))))
                      (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                 (LETT |m_new|
                       (PROG1 (LETT #2# (- (+ |r_max| 1) |r_min|))
                         (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #2#)))
                 (LETT |n_new|
                       (PROG1 (LETT #3# (- (+ |c_max| 1) |c_min|))
                         (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #3#)))
                 (EXIT (VECTOR |m_new| |n_new| |A_lst|)))))))) 

(SDEFUN |LINPEN;subPencil;%2L%;37|
        ((|p| (%)) (|lst_row| (|List| (|NonNegativeInteger|)))
         (|lst_col| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|r_min| #1=(|NonNegativeInteger|)) (|r_max| #1#) (|c_min| #1#)
          (|c_max| #1#) (|lp_new| (%)) (|k| NIL) (#2=#:G465 NIL)
          (|A_new| #3=(|Matrix| R)) (|A_wrk| #3#) (|i| NIL) (#4=#:G466 NIL)
          (|j| NIL) (#5=#:G467 NIL))
         (SEQ (LETT |r_min| (SPADCALL (ELT % 79) |lst_row| (QREFELT % 81)))
              (LETT |r_max| (SPADCALL (ELT % 82) |lst_row| (QREFELT % 81)))
              (LETT |c_min| (SPADCALL (ELT % 79) |lst_col| (QREFELT % 81)))
              (LETT |c_max| (SPADCALL (ELT % 82) |lst_col| (QREFELT % 81)))
              (COND
               ((OR (< |r_min| 1)
                    (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                        (> |c_max| (QVELT |p| 1))))
                (EXIT
                 (|error|
                  "LINPEN: subPencil(%,lst_row,lst_col) - invalid indices."))))
              (LETT |lp_new|
                    (SPADCALL (SPADCALL |lst_row| (QREFELT % 34))
                              (SPADCALL |lst_col| (QREFELT % 34))
                              (LENGTH (QVELT |p| 2)) (QREFELT % 15)))
              (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (LETT |A_new|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT % 17)))
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #4# (QVELT |lp_new| 0)) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #5# (QVELT |lp_new| 1))
                                 G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_new| |i| |j|
                                               (QAREF2O |A_wrk|
                                                        (SPADCALL |lst_row| |i|
                                                                  (QREFELT %
                                                                           38))
                                                        (SPADCALL |lst_col| |j|
                                                                  (QREFELT %
                                                                           38))
                                                        1 1)
                                               1 1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;removeRowsColumns;%2L%;38|
        ((|p| (%)) (|lst_row| (|List| (|NonNegativeInteger|)))
         (|lst_col| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|r_min| #1=(|NonNegativeInteger|)) (|r_max| #1#) (|c_min| #1#)
          (|c_max| #1#) (|l_row| (|List| (|NonNegativeInteger|)))
          (|l_col| (|List| (|NonNegativeInteger|))) (|lp_new| (%)) (|k| NIL)
          (#2=#:G494 NIL) (|A_new| #3=(|Matrix| R)) (|A_wrk| #3#) (|i| NIL)
          (#4=#:G495 NIL) (|j| NIL) (#5=#:G496 NIL))
         (SEQ (LETT |r_min| (SPADCALL (ELT % 79) |lst_row| (QREFELT % 81)))
              (LETT |r_max| (SPADCALL (ELT % 82) |lst_row| (QREFELT % 81)))
              (LETT |c_min| (SPADCALL (ELT % 79) |lst_col| (QREFELT % 81)))
              (LETT |c_max| (SPADCALL (ELT % 82) |lst_col| (QREFELT % 81)))
              (COND
               ((OR (< |r_min| 1)
                    (OR (OR (> |r_max| (QVELT |p| 0)) (< |c_min| 1))
                        (> |c_max| (QVELT |p| 1))))
                (EXIT
                 (|error|
                  "LINPEN: removeRowsColumns(%,lst_row,lst_col) - invalid indices."))))
              (LETT |l_row| NIL)
              (SEQ (LETT |i| (QVELT |p| 0)) G190 (COND ((< |i| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |i| |lst_row| (QREFELT % 84)) 0)
                       (LETT |l_row| (CONS |i| |l_row|))))))
                   (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |l_col| NIL)
              (SEQ (LETT |j| (QVELT |p| 1)) G190 (COND ((< |j| 1) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL |j| |lst_col| (QREFELT % 84)) 0)
                       (LETT |l_col| (CONS |j| |l_col|))))))
                   (LETT |j| (+ |j| -1)) (GO G190) G191 (EXIT NIL))
              (LETT |lp_new|
                    (SPADCALL (SPADCALL |l_row| (QREFELT % 34))
                              (SPADCALL |l_col| (QREFELT % 34))
                              (LENGTH (QVELT |p| 2)) (QREFELT % 15)))
              (SEQ (LETT |k| 1) (LETT #2# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #2#) (GO G191)))
                   (SEQ
                    (LETT |A_new|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT % 17)))
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #4# (QVELT |lp_new| 0)) G190
                          (COND ((|greater_SI| |i| #4#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #5# (QVELT |lp_new| 1))
                                 G190 (COND ((|greater_SI| |j| #5#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_new| |i| |j|
                                               (QAREF2O |A_wrk|
                                                        (SPADCALL |l_row| |i|
                                                                  (QREFELT %
                                                                           38))
                                                        (SPADCALL |l_col| |j|
                                                                  (QREFELT %
                                                                           38))
                                                        1 1)
                                               1 1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;insertRowsColumns;%2L%;39|
        ((|p| (%)) (|lst_row| (|List| (|NonNegativeInteger|)))
         (|lst_col| (|List| (|NonNegativeInteger|))) (% (%)))
        (SPROG
         ((|r_max| #1=(|NonNegativeInteger|)) (|c_max| #1#)
          (|m| #2=(|NonNegativeInteger|)) (|n| #2#) (|lp_new| (%))
          (|l_row| #3=(|List| (|NonNegativeInteger|))) (#4=#:G527 NIL)
          (|i_ins| #5=(|NonNegativeInteger|)) (|i_dst| #5#)
          (|l_tmp| (|List| (|NonNegativeInteger|))) (|l_col| #3#)
          (#6=#:G528 NIL) (|j_ins| #5#) (|j_dst| #5#) (|k| NIL) (#7=#:G529 NIL)
          (|A_src| #8=(|Matrix| R)) (|A_dst| #8#) (|i| NIL) (#9=#:G530 NIL)
          (|j| NIL) (#10=#:G531 NIL))
         (SEQ (LETT |r_max| (SPADCALL (ELT % 82) |lst_row| (QREFELT % 81)))
              (LETT |c_max| (SPADCALL (ELT % 82) |lst_col| (QREFELT % 81)))
              (COND
               ((OR (> |r_max| (QVELT |p| 0)) (> |c_max| (QVELT |p| 1)))
                (EXIT
                 (|error|
                  "LINPEN: insertRowsColumns(%,lst_row,lst_col) - invalid indices."))))
              (LETT |m| (+ (QVELT |p| 0) (SPADCALL |lst_row| (QREFELT % 34))))
              (LETT |n| (+ (QVELT |p| 1) (SPADCALL |lst_col| (QREFELT % 34))))
              (LETT |lp_new|
                    (SPADCALL |m| |n| (LENGTH (QVELT |p| 2)) (QREFELT % 15)))
              (LETT |l_tmp| (SPADCALL |lst_row| (QREFELT % 86)))
              (LETT |l_row| (SPADCALL (QVELT |p| 0) 0 (QREFELT % 87)))
              (LETT |i_dst| 1) (LETT |i_ins| 1)
              (SEQ (LETT |i| 1) (LETT #4# (QVELT |p| 0)) G190
                   (COND ((|greater_SI| |i| #4#) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((<= |i_ins| (SPADCALL |lst_row| (QREFELT % 34)))
                              (< (SPADCALL |l_tmp| |i_ins| (QREFELT % 38))
                                 |i|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |i_ins| (+ |i_ins| 1))
                              (EXIT (LETT |i_dst| (+ |i_dst| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (SPADCALL |l_row| |i| |i_dst| (QREFELT % 88))
                    (EXIT (LETT |i_dst| (+ |i_dst| 1))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |l_tmp| (SPADCALL |lst_col| (QREFELT % 86)))
              (LETT |l_col| (SPADCALL (QVELT |p| 1) 0 (QREFELT % 87)))
              (LETT |j_dst| 1) (LETT |j_ins| 1)
              (SEQ (LETT |j| 1) (LETT #6# (QVELT |p| 1)) G190
                   (COND ((|greater_SI| |j| #6#) (GO G191)))
                   (SEQ
                    (SEQ G190
                         (COND
                          ((NULL
                            (COND
                             ((<= |j_ins| (SPADCALL |lst_col| (QREFELT % 34)))
                              (< (SPADCALL |l_tmp| |j_ins| (QREFELT % 38))
                                 |j|))
                             ('T NIL)))
                           (GO G191)))
                         (SEQ (LETT |j_ins| (+ |j_ins| 1))
                              (EXIT (LETT |j_dst| (+ |j_dst| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (SPADCALL |l_col| |j| |j_dst| (QREFELT % 88))
                    (EXIT (LETT |j_dst| (+ |j_dst| 1))))
                   (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |k| 1) (LETT #7# (LENGTH (QVELT |p| 2))) G190
                   (COND ((|greater_SI| |k| #7#) (GO G191)))
                   (SEQ
                    (LETT |A_src| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (LETT |A_dst|
                          (SPADCALL (QVELT |lp_new| 2) |k| (QREFELT % 17)))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #9# (QVELT |p| 0)) G190
                          (COND ((|greater_SI| |i| #9#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| 1) (LETT #10# (QVELT |p| 1)) G190
                                 (COND ((|greater_SI| |j| #10#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (QSETAREF2O |A_dst|
                                               (SPADCALL |l_row| |i|
                                                         (QREFELT % 38))
                                               (SPADCALL |l_col| |j|
                                                         (QREFELT % 38))
                                               (QAREF2O |A_src| |i| |j| 1 1) 1
                                               1)))
                                 (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;qswapRows!;%2Nni%;40|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|A_wrk| NIL) (#1=#:G540 NIL) (|k| NIL) (#2=#:G541 NIL)
          (|a_tmp| (R)))
         (SEQ
          (COND
           ((NULL (EQL |i| |j|))
            (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 1)) G190
                        (COND ((|greater_SI| |k| #2#) (GO G191)))
                        (SEQ (LETT |a_tmp| (QAREF2O |A_wrk| |i| |k| 1 1))
                             (QSETAREF2O |A_wrk| |i| |k|
                                         (QAREF2O |A_wrk| |j| |k| 1 1) 1 1)
                             (EXIT (QSETAREF2O |A_wrk| |j| |k| |a_tmp| 1 1)))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
          (EXIT |p|)))) 

(SDEFUN |LINPEN;swapRows!;%2Nni%;41|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1)) (> |j| (QVELT |p| 0))))
           (|error| "LINPEN: swapRows!(%,i,j) - index/indices out of range."))
          ('T (SEQ (SPADCALL |p| |i| |j| (QREFELT % 90)) (EXIT |p|)))))) 

(SDEFUN |LINPEN;qaddRows!;%2NniR%;42|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (R)) (% (%)))
        (SPROG ((|A_wrk| NIL) (#1=#:G553 NIL) (|k| NIL) (#2=#:G554 NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 1)) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |j| |k|
                                          (SPADCALL
                                           (QAREF2O |A_wrk| |j| |k| 1 1)
                                           (SPADCALL |alpha|
                                                     (QAREF2O |A_wrk| |i| |k| 1
                                                              1)
                                                     (QREFELT % 92))
                                           (QREFELT % 93))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;addRows!;%2NniR%;43|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (R)) (% (%)))
        (SEQ
         (COND
          ((EQL |i| |j|)
           (|error|
            "LINPEN: addRows!(%,i,j,alpha) - indices must be different."))
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1)) (> |j| (QVELT |p| 0))))
           (|error|
            "LINPEN: addRows!(%,i,j,alpha) - index/indices out of range."))
          ('T (SEQ (SPADCALL |p| |i| |j| |alpha| (QREFELT % 94)) (EXIT |p|)))))) 

(SDEFUN |LINPEN;qmultiplyRow!;%NniR%;44|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (R)) (% (%)))
        (SPROG ((|A_wrk| NIL) (#1=#:G566 NIL) (|k| NIL) (#2=#:G567 NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 1)) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |i| |k|
                                          (SPADCALL |alpha|
                                                    (QAREF2O |A_wrk| |i| |k| 1
                                                             1)
                                                    (QREFELT % 92))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;multiplyRow!;%NniR%;45|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|alpha| (R)) (% (%)))
        (COND
         ((OR (< |i| 1) (> |i| (QVELT |p| 0)))
          (|error| "LINPEN: multiplyRow!(%,i,alpha) - index out of range."))
         ('T (SPADCALL |p| |i| |alpha| (QREFELT % 96))))) 

(SDEFUN |LINPEN;qswapColumns!;%2Nni%;46|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (SPROG
         ((|A_wrk| NIL) (#1=#:G579 NIL) (|k| NIL) (#2=#:G580 NIL)
          (|a_tmp| (R)))
         (SEQ
          (COND
           ((NULL (EQL |i| |j|))
            (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 0)) G190
                        (COND ((|greater_SI| |k| #2#) (GO G191)))
                        (SEQ (LETT |a_tmp| (QAREF2O |A_wrk| |k| |i| 1 1))
                             (QSETAREF2O |A_wrk| |k| |i|
                                         (QAREF2O |A_wrk| |k| |j| 1 1) 1 1)
                             (EXIT (QSETAREF2O |A_wrk| |k| |j| |a_tmp| 1 1)))
                        (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))))
                 (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
          (EXIT |p|)))) 

(SDEFUN |LINPEN;swapColumns!;%2Nni%;47|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (% (%)))
        (COND
         ((OR (< |i| 1)
              (OR (OR (> |i| (QVELT |p| 1)) (< |j| 1)) (> |j| (QVELT |p| 1))))
          (|error|
           "LINPEN: swapColumns!(%,i,j) - index/indices out of range."))
         ('T (SPADCALL |p| |i| |j| (QREFELT % 98))))) 

(SDEFUN |LINPEN;qaddColumns!;%2NniR%;48|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (R)) (% (%)))
        (SPROG ((|A_wrk| NIL) (#1=#:G592 NIL) (|k| NIL) (#2=#:G593 NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 0)) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |k| |j|
                                          (SPADCALL
                                           (QAREF2O |A_wrk| |k| |j| 1 1)
                                           (SPADCALL |alpha|
                                                     (QAREF2O |A_wrk| |k| |i| 1
                                                              1)
                                                     (QREFELT % 92))
                                           (QREFELT % 93))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;addColumns!;%2NniR%;49|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|alpha| (R)) (% (%)))
        (COND
         ((EQL |i| |j|)
          (|error|
           "LINPEN: addColumns!(%,i,j,alpha) - indices must be different."))
         ((OR (< |i| 1)
              (OR (OR (> |i| (QVELT |p| 1)) (< |j| 1)) (> |j| (QVELT |p| 1))))
          (|error|
           "LINPEN: addColumns!(%,i,j,alpha) - index/indices out of range."))
         ('T (SPADCALL |p| |i| |j| |alpha| (QREFELT % 100))))) 

(SDEFUN |LINPEN;qmultiplyColumn!;%NniR%;50|
        ((|p| (%)) (|j| (|NonNegativeInteger|)) (|alpha| (R)) (% (%)))
        (SPROG ((|A_wrk| NIL) (#1=#:G605 NIL) (|k| NIL) (#2=#:G606 NIL))
               (SEQ
                (SEQ (LETT |A_wrk| NIL) (LETT #1# (QVELT |p| 2)) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |A_wrk| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |k| 1) (LETT #2# (QVELT |p| 0)) G190
                            (COND ((|greater_SI| |k| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (QSETAREF2O |A_wrk| |k| |j|
                                          (SPADCALL |alpha|
                                                    (QAREF2O |A_wrk| |k| |j| 1
                                                             1)
                                                    (QREFELT % 92))
                                          1 1)))
                            (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                            (EXIT NIL))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;multiplyColumn!;%NniR%;51|
        ((|p| (%)) (|j| (|NonNegativeInteger|)) (|alpha| (R)) (% (%)))
        (COND
         ((OR (< |j| 1) (> |j| (QVELT |p| 1)))
          (|error| "LINPEN: multiplyColumn!(%,j,alpha) - index out of range."))
         ('T (SPADCALL |p| |j| |alpha| (QREFELT % 102))))) 

(SDEFUN |LINPEN;qscaleBlock!;%5NniR%;52|
        ((|p| (%)) (|i_min| (|NonNegativeInteger|))
         (|i_max| (|NonNegativeInteger|)) (|j_min| (|NonNegativeInteger|))
         (|j_max| (|NonNegativeInteger|)) (|l| (|NonNegativeInteger|))
         (|alpha| (R)) (% (%)))
        (SPROG
         ((|A_wrk| (|Matrix| R)) (|i| NIL) (#1=#:G617 NIL) (|j| NIL)
          (#2=#:G618 NIL))
         (SEQ (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
              (SEQ (LETT |i| |i_min|) (LETT #1# |i_max|) G190
                   (COND ((> |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| |j_min|) (LETT #2# |j_max|) G190
                          (COND ((> |j| #2#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O |A_wrk| |i| |j|
                                        (SPADCALL |alpha|
                                                  (QAREF2O |A_wrk| |i| |j| 1 1)
                                                  (QREFELT % 92))
                                        1 1)))
                          (LETT |j| (+ |j| 1)) (GO G190) G191 (EXIT NIL))))
                   (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
              (EXIT |p|)))) 

(SDEFUN |LINPEN;*;%M%;53| ((|p| (%)) (U (|Matrix| R)) (% (%)))
        (SPROG ((|lp_new| (%)))
               (SEQ (LETT |lp_new| (SPADCALL |p| (QREFELT % 19)))
                    (SPADCALL |lp_new| U (QREFELT % 105)) (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;*;M2%;54| ((T$ (|Matrix| R)) (|p| (%)) (% (%)))
        (SPROG ((|lp_new| (%)))
               (SEQ (LETT |lp_new| (SPADCALL |p| (QREFELT % 19)))
                    (SPADCALL |lp_new| T$ (QREFELT % 107)) (EXIT |lp_new|)))) 

(SDEFUN |LINPEN;transformRows!;%M%;55| ((|p| (%)) (T$ (|Matrix| R)) (% (%)))
        (SPROG ((|A_lst| (|List| (|Matrix| R))) (|k| NIL) (#1=#:G630 NIL))
               (SEQ
                (COND
                 ((EQL (ANROWS T$) (ANCOLS T$))
                  (COND
                   ((NULL (EQL (ANROWS T$) (QVELT |p| 0)))
                    (EXIT
                     (|error|
                      #2="LINPEN: transformRows!(%,T) - wrong matrix size.")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |A_lst| (QVELT |p| 2))
                (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |A_lst| |k|
                                 (SPADCALL T$
                                           (SPADCALL |A_lst| |k|
                                                     (QREFELT % 17))
                                           (QREFELT % 109))
                                 (QREFELT % 14))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;transformColumns!;%M%;56| ((|p| (%)) (U (|Matrix| R)) (% (%)))
        (SPROG ((|A_lst| (|List| (|Matrix| R))) (|k| NIL) (#1=#:G638 NIL))
               (SEQ
                (COND
                 ((EQL (ANROWS U) (ANCOLS U))
                  (COND
                   ((NULL (EQL (ANROWS U) (QVELT |p| 1)))
                    (EXIT
                     (|error|
                      #2="LINPEN: transformColumns!(%,U) - wrong matrix size.")))))
                 ('T (EXIT (|error| #2#))))
                (LETT |A_lst| (QVELT |p| 2))
                (SEQ (LETT |k| 1) (LETT #1# (LENGTH (QVELT |p| 2))) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |A_lst| |k|
                                 (SPADCALL
                                  (SPADCALL |A_lst| |k| (QREFELT % 17)) U
                                  (QREFELT % 109))
                                 (QREFELT % 14))))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |p|)))) 

(SDEFUN |LINPEN;leftIdentity;%M;57| ((|p| (%)) (% (|Matrix| R)))
        (SPROG ((|trf_mtx| (|Matrix| R)) (|k| NIL) (#1=#:G644 NIL))
               (SEQ
                (LETT |trf_mtx|
                      (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                                    (|spadConstant| % 8)))
                (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 0)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O |trf_mtx| |k| |k| (|spadConstant| % 20) 1
                                   1)))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |trf_mtx|)))) 

(SDEFUN |LINPEN;rightIdentity;%M;58| ((|p| (%)) (% (|Matrix| R)))
        (SPROG ((|trf_mtx| (|Matrix| R)) (|k| NIL) (#1=#:G650 NIL))
               (SEQ
                (LETT |trf_mtx|
                      (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                                    (|spadConstant| % 8)))
                (SEQ (LETT |k| 1) (LETT #1# (QVELT |p| 1)) G190
                     (COND ((|greater_SI| |k| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O |trf_mtx| |k| |k| (|spadConstant| % 20) 1
                                   1)))
                     (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
                (EXIT |trf_mtx|)))) 

(SDEFUN |LINPEN;qsetelt!;%3Nni2R;59|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|alpha| (R)) (% (R)))
        (SEQ
         (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i| |j|
                     |alpha| 1 1)
         (EXIT |alpha|))) 

(SDEFUN |LINPEN;qsetelt!;%2Nni2L;60|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|lst| (|List| R)) (% (|List| R)))
        (SPROG ((|l| NIL) (#1=#:G659 NIL))
               (SEQ
                (SEQ (LETT |l| 1) (LETT #1# (LENGTH |lst|)) G190
                     (COND ((|greater_SI| |l| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17))
                                   |i| |j| (SPADCALL |lst| |l| (QREFELT % 113))
                                   1 1)))
                     (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                (EXIT |lst|)))) 

(SDEFUN |LINPEN;setelt!;%3Nni2R;61|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|alpha| (R)) (% (R)))
        (SEQ
         (COND
          ((OR (< |i| 1)
               (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                   (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                       (> |l| (LENGTH (QVELT |p| 2))))))
           (|error| "LINPEN: setelt!(%,i,j,l,alpha) - index out of range."))
          ('T
           (SEQ
            (QSETAREF2O (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i| |j|
                        |alpha| 1 1)
            (EXIT |alpha|)))))) 

(SDEFUN |LINPEN;setelt!;%2Nni2L;62|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|lst| (|List| R)) (% (|List| R)))
        (SPROG ((|l| NIL) (#1=#:G674 NIL))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (> |j| (QVELT |p| 1))))
                  (|error| "LINPEN: setelt!(%,i,j,lst) - index out of range."))
                 ('T
                  (COND
                   ((> (LENGTH |lst|) (LENGTH (QVELT |p| 2)))
                    (|error|
                     "LINPEN: setelt!(%,i,j,lst) - list of elements too long."))
                   ('T
                    (SEQ
                     (SEQ (LETT |l| 1) (LETT #1# (LENGTH |lst|)) G190
                          (COND ((|greater_SI| |l| #1#) (GO G191)))
                          (SEQ
                           (EXIT
                            (QSETAREF2O
                             (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)) |i|
                             |j| (SPADCALL |lst| |l| (QREFELT % 113)) 1 1)))
                          (LETT |l| (|inc_SI| |l|)) (GO G190) G191 (EXIT NIL))
                     (EXIT |lst|))))))))) 

(SDEFUN |LINPEN;setsubMatrix!;%3Nni2M;63|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|l| (|NonNegativeInteger|)) (|a| (|Matrix| R)) (% (|Matrix| R)))
        (SPROG ((|A_wrk| (|Matrix| R)))
               (SEQ
                (COND
                 ((OR (< |i| 1)
                      (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                          (OR (OR (> |j| (QVELT |p| 1)) (< |l| 1))
                              (> |l| (LENGTH (QVELT |p| 2))))))
                  (|error|
                   "LINPEN: setsubMatrix!(%,i,j,l,a) - index out of range."))
                 ('T
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |l| (QREFELT % 17)))
                   (EXIT (SPADCALL |A_wrk| |i| |j| |a| (QREFELT % 117))))))))) 

(SDEFUN |LINPEN;setsubPencil!;%2Nni2%;64|
        ((|p| (%)) (|i| (|NonNegativeInteger|)) (|j| (|NonNegativeInteger|))
         (|q| (%)) (% (%)))
        (SPROG
         ((#1=#:G683 NIL) (#2=#:G684 NIL) (|k| NIL) (#3=#:G694 NIL)
          (|A_wrk| (|Matrix| R)))
         (SEQ
          (COND
           ((OR (< |i| 1)
                (OR (OR (> |i| (QVELT |p| 0)) (< |j| 1))
                    (> |j| (QVELT |p| 1))))
            (|error| "LINPEN: setsubPencil!(%,i,j,%) - index out of range."))
           ((OR
             (> (QVELT |q| 0)
                (PROG1 (LETT #1# (- (+ (QVELT |p| 0) 1) |i|))
                  (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #1#)))
             (> (QVELT |q| 1)
                (PROG1 (LETT #2# (- (+ (QVELT |p| 1) 1) |j|))
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))))
            (|error| "LINPEN: setsubPencil!(%,i,j,%) - pencil too big."))
           ((NULL (EQL (LENGTH (QVELT |p| 2)) (LENGTH (QVELT |q| 2))))
            (|error|
             "LINPEN: setsubPencil!(%,i,j,%) - different number of matrices."))
           ('T
            (SEQ
             (SEQ (LETT |k| 1) (LETT #3# (LENGTH (QVELT |p| 2))) G190
                  (COND ((|greater_SI| |k| #3#) (GO G191)))
                  (SEQ
                   (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                   (EXIT
                    (SPADCALL |A_wrk| |i| |j|
                              (SPADCALL (QVELT |q| 2) |k| (QREFELT % 17))
                              (QREFELT % 117))))
                  (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
             (EXIT |p|))))))) 

(SDEFUN |LINPEN;blockElimination;%6LL;65|
        ((|p| (%)) (|rsrc| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|rext| (|List| (|NonNegativeInteger|)))
         (|csrc| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|)))
         (|cext| (|List| (|NonNegativeInteger|))) (% (|List| (|Matrix| R))))
        (SPROG
         ((|row_src| (|List| (|NonNegativeInteger|)))
          (|row_dst| (|List| (|NonNegativeInteger|)))
          (|row_ext| (|List| (|NonNegativeInteger|)))
          (|col_src| (|List| (|NonNegativeInteger|)))
          (|col_dst| (|List| (|NonNegativeInteger|)))
          (|col_ext| (|List| (|NonNegativeInteger|)))
          (|nc_fct| #1=(|NonNegativeInteger|)) (|nr_fct| #1#)
          (|n_fct| #2=(|NonNegativeInteger|)) (|n_col| #2#) (|n_row| #2#)
          (|n_eqn| #1#) (|n_var| (|NonNegativeInteger|))
          (|mtx_sys| #3=(|Matrix| R)) (|lst_rhs| (|List| R)) (|k| NIL)
          (#4=#:G914 NIL) (|A_wrk| (|Matrix| R)) (#5=#:G710 NIL) (|k_off| #1#)
          (#6=#:G915 NIL) (#7=#:G725 NIL) (|i_off| #1#) (#8=#:G726 NIL)
          (#9=#:G916 NIL) (#10=#:G729 NIL) (|idx_eqn| #2#) (#11=#:G917 NIL)
          (#12=#:G771 NIL) (#13=#:G918 NIL) (#14=#:G820 NIL)
          (|sol_wrk|
           (|Record| (|:| |particular| (|Union| (|Vector| R) #15="failed"))
                     (|:| |basis| (|List| (|Vector| R)))))
          (|T_wrk| #3#) (#16=#:G919 NIL) (|U_wrk| #3#) (#17=#:G920 NIL)
          (#18=#:G835 NIL) (|lst_coe| (|List| R)) (|i| NIL) (#19=#:G921 NIL)
          (|i_wrk| #20=(|NonNegativeInteger|)) (#21=#:G922 NIL)
          (|i_src| #22=(|NonNegativeInteger|)) (#23=#:G882 NIL) (|j| NIL)
          (#24=#:G923 NIL) (|j_wrk| #20#) (|l| NIL) (#25=#:G924 NIL)
          (|j_src| #22#) (#26=#:G905 NIL) (|idx_fct| #2#)
          (|lst_trn| (|List| (|Matrix| R))))
         (SEQ (LETT |row_src| |rsrc|) (LETT |row_dst| |rdst|)
              (LETT |row_ext| |rext|) (LETT |col_src| |csrc|)
              (LETT |col_dst| |cdst|) (LETT |col_ext| |cext|)
              (LETT |nc_fct|
                    (* (SPADCALL |col_src| (QREFELT % 34))
                       (SPADCALL |col_dst| (QREFELT % 34))))
              (LETT |nr_fct|
                    (* (SPADCALL |row_src| (QREFELT % 34))
                       (SPADCALL |row_dst| (QREFELT % 34))))
              (LETT |n_fct| (+ |nc_fct| |nr_fct|))
              (LETT |n_col|
                    (+ (SPADCALL |col_dst| (QREFELT % 34))
                       (SPADCALL |col_ext| (QREFELT % 34))))
              (LETT |n_row|
                    (+ (SPADCALL |row_dst| (QREFELT % 34))
                       (SPADCALL |row_ext| (QREFELT % 34))))
              (LETT |n_eqn| (* |n_row| |n_col|))
              (LETT |n_var| (LENGTH (QVELT |p| 2)))
              (LETT |mtx_sys|
                    (MAKE_MATRIX1 (* |n_var| |n_eqn|) |n_fct|
                                  (|spadConstant| % 8)))
              (LETT |lst_rhs|
                    (SPADCALL (* |n_var| |n_eqn|) (|spadConstant| % 8)
                              (QREFELT % 57)))
              (SEQ (LETT |k| 1) (LETT #4# |n_var|) G190
                   (COND ((|greater_SI| |k| #4#) (GO G191)))
                   (SEQ
                    (LETT |A_wrk| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (LETT |k_off|
                          (*
                           (PROG1 (LETT #5# (- |k| 1))
                             (|check_subtype2| (>= #5# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #5#))
                           |n_eqn|))
                    (EXIT
                     (SEQ (LETT |i| 1) (LETT #6# |n_row|) G190
                          (COND ((|greater_SI| |i| #6#) (GO G191)))
                          (SEQ (LETT |i_wrk| 0)
                               (LETT |i_off|
                                     (*
                                      (PROG1 (LETT #7# (- |i| 1))
                                        (|check_subtype2| (>= #7# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #7#))
                                      |n_col|))
                               (COND
                                ((<= |i| (SPADCALL |row_dst| (QREFELT % 34)))
                                 (LETT |i_wrk|
                                       (SPADCALL |row_dst| |i|
                                                 (QREFELT % 38))))
                                ('T
                                 (LETT |i_wrk|
                                       (SPADCALL |row_ext|
                                                 (PROG1
                                                     (LETT #8#
                                                           (- |i|
                                                              (SPADCALL
                                                               |row_dst|
                                                               (QREFELT %
                                                                        34))))
                                                   (|check_subtype2| (>= #8# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #8#))
                                                 (QREFELT % 38)))))
                               (EXIT
                                (SEQ (LETT |j| 1) (LETT #9# |n_col|) G190
                                     (COND ((|greater_SI| |j| #9#) (GO G191)))
                                     (SEQ (LETT |j_wrk| 0)
                                          (COND
                                           ((<= |j|
                                                (SPADCALL |col_dst|
                                                          (QREFELT % 34)))
                                            (LETT |j_wrk|
                                                  (SPADCALL |col_dst| |j|
                                                            (QREFELT % 38))))
                                           ('T
                                            (LETT |j_wrk|
                                                  (SPADCALL |col_ext|
                                                            (PROG1
                                                                (LETT #10#
                                                                      (- |j|
                                                                         (SPADCALL
                                                                          |col_dst|
                                                                          (QREFELT
                                                                           %
                                                                           34))))
                                                              (|check_subtype2|
                                                               (>= #10# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #10#))
                                                            (QREFELT % 38)))))
                                          (LETT |idx_eqn|
                                                (+ (+ |k_off| |i_off|) |j|))
                                          (SPADCALL |lst_rhs| |idx_eqn|
                                                    (SPADCALL
                                                     (QAREF2O |A_wrk| |i_wrk|
                                                              |j_wrk| 1 1)
                                                     (QREFELT % 120))
                                                    (QREFELT % 58))
                                          (COND
                                           ((<= |i|
                                                (SPADCALL |row_dst|
                                                          (QREFELT % 34)))
                                            (SEQ (LETT |l| 1)
                                                 (LETT #11#
                                                       (SPADCALL |row_src|
                                                                 (QREFELT %
                                                                          34)))
                                                 G190
                                                 (COND
                                                  ((|greater_SI| |l| #11#)
                                                   (GO G191)))
                                                 (SEQ
                                                  (LETT |i_src|
                                                        (SPADCALL |row_src| |l|
                                                                  (QREFELT %
                                                                           38)))
                                                  (LETT |idx_fct|
                                                        (+
                                                         (*
                                                          (PROG1
                                                              (LETT #12#
                                                                    (- |i| 1))
                                                            (|check_subtype2|
                                                             (>= #12# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #12#))
                                                          (SPADCALL |row_src|
                                                                    (QREFELT %
                                                                             34)))
                                                         |l|))
                                                  (EXIT
                                                   (QSETAREF2O |mtx_sys|
                                                               |idx_eqn|
                                                               |idx_fct|
                                                               (QAREF2O |A_wrk|
                                                                        |i_src|
                                                                        |j_wrk|
                                                                        1 1)
                                                               1 1)))
                                                 (LETT |l| (|inc_SI| |l|))
                                                 (GO G190) G191 (EXIT NIL))))
                                          (EXIT
                                           (COND
                                            ((<= |j|
                                                 (SPADCALL |col_dst|
                                                           (QREFELT % 34)))
                                             (SEQ (LETT |l| 1)
                                                  (LETT #13#
                                                        (SPADCALL |col_src|
                                                                  (QREFELT %
                                                                           34)))
                                                  G190
                                                  (COND
                                                   ((|greater_SI| |l| #13#)
                                                    (GO G191)))
                                                  (SEQ
                                                   (LETT |j_src|
                                                         (SPADCALL |col_src|
                                                                   |l|
                                                                   (QREFELT %
                                                                            38)))
                                                   (LETT |idx_fct|
                                                         (+
                                                          (+ |nr_fct|
                                                             (*
                                                              (PROG1
                                                                  (LETT #14#
                                                                        (- |j|
                                                                           1))
                                                                (|check_subtype2|
                                                                 (>= #14# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #14#))
                                                              (SPADCALL
                                                               |col_src|
                                                               (QREFELT %
                                                                        34))))
                                                          |l|))
                                                   (EXIT
                                                    (QSETAREF2O |mtx_sys|
                                                                |idx_eqn|
                                                                |idx_fct|
                                                                (QAREF2O
                                                                 |A_wrk|
                                                                 |i_wrk|
                                                                 |j_src| 1 1)
                                                                1 1)))
                                                  (LETT |l| (|inc_SI| |l|))
                                                  (GO G190) G191
                                                  (EXIT NIL))))))
                                     (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                     (EXIT NIL))))
                          (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                          (EXIT NIL))))
                   (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
              (LETT |sol_wrk|
                    (SPADCALL |mtx_sys| (SPADCALL |lst_rhs| (QREFELT % 122))
                              (QREFELT % 126)))
              (LETT |lst_trn| NIL)
              (COND
               ((NULL (QEQCAR (QCAR |sol_wrk|) 1))
                (SEQ
                 (LETT |T_wrk|
                       (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                                     (|spadConstant| % 8)))
                 (SEQ (LETT |i| 1) (LETT #16# (QVELT |p| 0)) G190
                      (COND ((|greater_SI| |i| #16#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |T_wrk| |i| |i| (|spadConstant| % 20) 1
                                    1)))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (LETT |U_wrk|
                       (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                                     (|spadConstant| % 8)))
                 (SEQ (LETT |j| 1) (LETT #17# (QVELT |p| 1)) G190
                      (COND ((|greater_SI| |j| #17#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF2O |U_wrk| |j| |j| (|spadConstant| % 20) 1
                                    1)))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                 (LETT |lst_coe|
                       (SPADCALL
                        (PROG2 (LETT #18# (QCAR |sol_wrk|))
                            (QCDR #18#)
                          (|check_union2| (QEQCAR #18# 0)
                                          (|Vector| (QREFELT % 6))
                                          (|Union| (|Vector| (QREFELT % 6))
                                                   #15#)
                                          #18#))
                        (QREFELT % 127)))
                 (SEQ (LETT |i| 1)
                      (LETT #19# (SPADCALL |row_dst| (QREFELT % 34))) G190
                      (COND ((|greater_SI| |i| #19#) (GO G191)))
                      (SEQ
                       (LETT |i_wrk| (SPADCALL |row_dst| |i| (QREFELT % 38)))
                       (EXIT
                        (SEQ (LETT |l| 1)
                             (LETT #21# (SPADCALL |row_src| (QREFELT % 34)))
                             G190 (COND ((|greater_SI| |l| #21#) (GO G191)))
                             (SEQ
                              (LETT |i_src|
                                    (SPADCALL |row_src| |l| (QREFELT % 38)))
                              (LETT |idx_fct|
                                    (+
                                     (*
                                      (PROG1 (LETT #23# (- |i| 1))
                                        (|check_subtype2| (>= #23# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #23#))
                                      (SPADCALL |row_src| (QREFELT % 34)))
                                     |l|))
                              (EXIT
                               (QSETAREF2O |T_wrk| |i_wrk| |i_src|
                                           (SPADCALL |lst_coe| |idx_fct|
                                                     (QREFELT % 113))
                                           1 1)))
                             (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (SEQ (LETT |j| 1)
                      (LETT #24# (SPADCALL |col_dst| (QREFELT % 34))) G190
                      (COND ((|greater_SI| |j| #24#) (GO G191)))
                      (SEQ
                       (LETT |j_wrk| (SPADCALL |col_dst| |j| (QREFELT % 38)))
                       (EXIT
                        (SEQ (LETT |l| 1)
                             (LETT #25# (SPADCALL |col_src| (QREFELT % 34)))
                             G190 (COND ((|greater_SI| |l| #25#) (GO G191)))
                             (SEQ
                              (LETT |j_src|
                                    (SPADCALL |col_src| |l| (QREFELT % 38)))
                              (LETT |idx_fct|
                                    (+
                                     (+ |nr_fct|
                                        (*
                                         (PROG1 (LETT #26# (- |j| 1))
                                           (|check_subtype2| (>= #26# 0)
                                                             '(|NonNegativeInteger|)
                                                             '(|Integer|)
                                                             #26#))
                                         (SPADCALL |col_src| (QREFELT % 34))))
                                     |l|))
                              (EXIT
                               (QSETAREF2O |U_wrk| |j_src| |j_wrk|
                                           (SPADCALL |lst_coe| |idx_fct|
                                                     (QREFELT % 113))
                                           1 1)))
                             (LETT |l| (|inc_SI| |l|)) (GO G190) G191
                             (EXIT NIL))))
                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191 (EXIT NIL))
                 (LETT |lst_trn| (CONS |U_wrk| |lst_trn|))
                 (EXIT (LETT |lst_trn| (CONS |T_wrk| |lst_trn|))))))
              (EXIT |lst_trn|)))) 

(SDEFUN |LINPEN;eliminationTransformations;%2LS2LSL;66|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|))) (|sym_P| (|Symbol|))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|))) (|sym_Q| (|Symbol|))
         (% (|List| (|Matrix| (|Polynomial| R)))))
        (SPROG
         ((|P_wrk| #1=(|Matrix| (|Polynomial| R))) (|Q_wrk| #1#)
          (#2=#:G943 NIL) (#3=#:G944 NIL) (#4=#:G945 NIL) (#5=#:G946 NIL)
          (|idx_P| #6=(|NonNegativeInteger|)) (|i| NIL) (#7=#:G947 NIL)
          (|j| NIL) (#8=#:G948 NIL) (|idx_Q| #6#))
         (SEQ
          (LETT |P_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                              (|spadConstant| % 130)))
          (LETT |Q_wrk|
                (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                              (|spadConstant| % 130)))
          (SEQ (LETT |i| 1) (LETT #2# (QVELT |p| 0)) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |P_wrk| |i| |i| (|spadConstant| % 131) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |i| 1) (LETT #3# (QVELT |p| 1)) G190
               (COND ((|greater_SI| |i| #3#) (GO G191)))
               (SEQ
                (EXIT (QSETAREF2O |Q_wrk| |i| |i| (|spadConstant| % 131) 1 1)))
               (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
          (LETT |idx_P| 0)
          (SEQ (LETT |i| NIL) (LETT #4# |row_P|) G190
               (COND
                ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| NIL) (LETT #5# |col_P|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |j| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |idx_P| (+ |idx_P| 1))
                           (EXIT
                            (QSETAREF2O |P_wrk| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |sym_P|
                                                   (LIST
                                                    (SPADCALL |idx_P|
                                                              (QREFELT % 132)))
                                                   (QREFELT % 135))
                                         (QREFELT % 136))
                                        1 1)))
                      (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
               (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
          (LETT |idx_Q| 0)
          (SEQ (LETT |i| NIL) (LETT #7# |row_Q|) G190
               (COND
                ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL)) (GO G191)))
               (SEQ
                (EXIT
                 (SEQ (LETT |j| NIL) (LETT #8# |col_Q|) G190
                      (COND
                       ((OR (ATOM #8#) (PROGN (LETT |j| (CAR #8#)) NIL))
                        (GO G191)))
                      (SEQ (LETT |idx_Q| (+ |idx_Q| 1))
                           (EXIT
                            (QSETAREF2O |Q_wrk| |i| |j|
                                        (SPADCALL
                                         (SPADCALL |sym_Q|
                                                   (LIST
                                                    (SPADCALL |idx_Q|
                                                              (QREFELT % 132)))
                                                   (QREFELT % 135))
                                         (QREFELT % 136))
                                        1 1)))
                      (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))))
               (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
          (EXIT (LIST |P_wrk| |Q_wrk|))))) 

(SDEFUN |LINPEN;eliminationTransformations;%4LL;67|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (% (|List| (|Matrix| (|Polynomial| R)))))
        (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                  (QREFELT % 138))) 

(SDEFUN |LINPEN;eliminationTransformations;%4LLL;68|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (|sol| (|List| (|Equation| (|Polynomial| R))))
         (% (|List| (|Matrix| R))))
        (SPROG
         ((|P_wrk| #1=(|Matrix| R)) (|Q_wrk| #1#) (|sym_P| (|Symbol|))
          (|sym_Q| (|Symbol|)) (#2=#:G968 NIL) (#3=#:G969 NIL) (#4=#:G970 NIL)
          (#5=#:G971 NIL) (|idx_P| #6=(|NonNegativeInteger|)) (|i| NIL)
          (#7=#:G972 NIL) (|j| NIL) (#8=#:G973 NIL) (|idx_Q| #6#)
          (|val_wrk| (|Polynomial| R)))
         (SEQ (SPADCALL |p| |row_P| |col_P| |row_Q| |col_Q| (QREFELT % 139))
              (LETT |P_wrk|
                    (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 0)
                                  (|spadConstant| % 8)))
              (LETT |Q_wrk|
                    (MAKE_MATRIX1 (QVELT |p| 1) (QVELT |p| 1)
                                  (|spadConstant| % 8)))
              (LETT |sym_P| '|a|) (LETT |sym_Q| '|b|)
              (SEQ (LETT |i| 1) (LETT #2# (QVELT |p| 0)) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |P_wrk| |i| |i| (|spadConstant| % 20) 1 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |i| 1) (LETT #3# (QVELT |p| 1)) G190
                   (COND ((|greater_SI| |i| #3#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF2O |Q_wrk| |i| |i| (|spadConstant| % 20) 1 1)))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (LETT |idx_P| 0)
              (SEQ (LETT |i| NIL) (LETT #4# |row_P|) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |j| NIL) (LETT #5# |col_P|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |j| (CAR #5#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |idx_P| (+ |idx_P| 1))
                               (LETT |val_wrk|
                                     (SPADCALL
                                      (SPADCALL
                                       (SPADCALL |sym_P|
                                                 (LIST
                                                  (SPADCALL |idx_P|
                                                            (QREFELT % 132)))
                                                 (QREFELT % 135))
                                       (QREFELT % 136))
                                      |sol| (QREFELT % 141)))
                               (EXIT
                                (COND
                                 ((< (SPADCALL |val_wrk| (QREFELT % 142)) 1)
                                  (QSETAREF2O |P_wrk| |i| |j|
                                              (SPADCALL |val_wrk|
                                                        (QREFELT % 143))
                                              1 1)))))
                          (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((< (SPADCALL |P_wrk| (QREFELT % 144)) (QVELT |p| 0))
                 (|error|
                  "LINPEN: eliminationTransformations(p,...) - row transformation matrix not invertible."))
                (#9='T
                 (SEQ (LETT |idx_Q| 0)
                      (SEQ (LETT |i| NIL) (LETT #7# |row_Q|) G190
                           (COND
                            ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SEQ (LETT |j| NIL) (LETT #8# |col_Q|) G190
                                  (COND
                                   ((OR (ATOM #8#)
                                        (PROGN (LETT |j| (CAR #8#)) NIL))
                                    (GO G191)))
                                  (SEQ (LETT |idx_Q| (+ |idx_Q| 1))
                                       (LETT |val_wrk|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |sym_Q|
                                                         (LIST
                                                          (SPADCALL |idx_Q|
                                                                    (QREFELT %
                                                                             132)))
                                                         (QREFELT % 135))
                                               (QREFELT % 136))
                                              |sol| (QREFELT % 141)))
                                       (EXIT
                                        (COND
                                         ((<
                                           (SPADCALL |val_wrk| (QREFELT % 142))
                                           1)
                                          (QSETAREF2O |Q_wrk| |i| |j|
                                                      (SPADCALL |val_wrk|
                                                                (QREFELT %
                                                                         143))
                                                      1 1)))))
                                  (LETT #8# (CDR #8#)) (GO G190) G191
                                  (EXIT NIL))))
                           (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                      (EXIT
                       (COND
                        ((< (SPADCALL |Q_wrk| (QREFELT % 144)) (QVELT |p| 1))
                         (|error|
                          "LINPEN: eliminationTransformations(p,...) - column transformation matrix not invertible."))
                        (#9# (LIST |P_wrk| |Q_wrk|))))))))))) 

(SDEFUN |LINPEN;eliminationEquations;%6LL;69|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|)))
         (% (|List| (|Matrix| (|Polynomial| R)))))
        (SPROG
         ((|lst_trn| (|List| (|Matrix| (|Polynomial| R))))
          (|A_wrk| (|Matrix| (|Polynomial| R))) (|k| NIL)
          (|A_tmp| (|Matrix| R)) (#1=#:G988 NIL) (#2=#:G989 NIL)
          (|B_wrk| (|Matrix| (|Polynomial| R)))
          (|E_wrk| (|Matrix| (|Polynomial| R))) (|i| NIL) (#3=#:G990 NIL)
          (|j| NIL) (#4=#:G991 NIL)
          (|lst_mtx| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT % 138)))
          (LETT |lst_mtx| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| % 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (SEQ (LETT |i| 1) (LETT #1# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT % 147))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 149))
                                     |A_wrk| (QREFELT % 150))
                           (SPADCALL |lst_trn| 2 (QREFELT % 149))
                           (QREFELT % 150)))
                    (LETT |E_wrk|
                          (SPADCALL (QVELT |p| 0) (QVELT |p| 1)
                                    (QREFELT % 151)))
                    (SEQ (LETT |i| NIL) (LETT #3# |rdst|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #4# |cdst|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |j| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |lst_mtx| (CONS |E_wrk| |lst_mtx|))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_mtx|)))) 

(SDEFUN |LINPEN;eliminationEquations;%10LL;70|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|)))
         (|rex1| (|List| (|NonNegativeInteger|)))
         (|cex1| (|List| (|NonNegativeInteger|)))
         (|rex2| (|List| (|NonNegativeInteger|)))
         (|cex2| (|List| (|NonNegativeInteger|)))
         (% (|List| (|Matrix| (|Polynomial| R)))))
        (SPROG
         ((|lst_trn| (|List| (|Matrix| (|Polynomial| R))))
          (|A_wrk| (|Matrix| (|Polynomial| R))) (|k| NIL)
          (|A_tmp| (|Matrix| R)) (#1=#:G1014 NIL) (#2=#:G1015 NIL)
          (|B_wrk| (|Matrix| (|Polynomial| R)))
          (|E_wrk| (|Matrix| (|Polynomial| R))) (#3=#:G1016 NIL)
          (#4=#:G1017 NIL) (#5=#:G1018 NIL) (#6=#:G1019 NIL) (|i| NIL)
          (#7=#:G1020 NIL) (|j| NIL) (#8=#:G1021 NIL)
          (|lst_mtx| (|List| (|Matrix| (|Polynomial| R)))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT % 138)))
          (LETT |lst_mtx| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| % 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (SEQ (LETT |i| 1) (LETT #1# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT % 147))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 149))
                                     |A_wrk| (QREFELT % 150))
                           (SPADCALL |lst_trn| 2 (QREFELT % 149))
                           (QREFELT % 150)))
                    (LETT |E_wrk|
                          (SPADCALL (QVELT |p| 0) (QVELT |p| 1)
                                    (QREFELT % 151)))
                    (SEQ (LETT |i| NIL) (LETT #3# |rdst|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #4# |cdst|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |j| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #5# |rex1|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #6# |cex1|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |j| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #7# |rex2|) G190
                         (COND
                          ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #8# |cex2|) G190
                                (COND
                                 ((OR (ATOM #8#)
                                      (PROGN (LETT |j| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |E_wrk| |i| |j|
                                              (QAREF2O |B_wrk| |i| |j| 1 1) 1
                                              1)))
                                (LETT #8# (CDR #8#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (LETT |lst_mtx| (CONS |E_wrk| |lst_mtx|))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (EXIT |lst_mtx|)))) 

(SDEFUN |LINPEN;eliminationEquations;%10LL;71|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|)))
         (|rex1| (|List| (|NonNegativeInteger|)))
         (|cex1| (|List| (|NonNegativeInteger|)))
         (|rex2| (|List| (|NonNegativeInteger|)))
         (|cex2| (|List| (|NonNegativeInteger|)))
         (% (|List| (|Polynomial| R))))
        (SPROG
         ((|lst_trn| (|List| (|Matrix| (|Polynomial| R))))
          (|A_wrk| (|Matrix| (|Polynomial| R))) (|k| NIL)
          (|A_tmp| (|Matrix| R)) (#1=#:G1049 NIL) (#2=#:G1050 NIL)
          (|B_wrk| (|Matrix| (|Polynomial| R))) (#3=#:G1051 NIL)
          (#4=#:G1052 NIL) (#5=#:G1053 NIL) (#6=#:G1054 NIL) (|i| NIL)
          (#7=#:G1055 NIL) (|j| NIL) (#8=#:G1056 NIL)
          (|det_P| #9=(|Polynomial| R)) (|det_Q| #9#)
          (|lst_eqn| (|List| (|Polynomial| R))))
         (SEQ
          (LETT |lst_trn|
                (SPADCALL |p| |row_P| |col_P| '|a| |row_Q| |col_Q| '|b|
                          (QREFELT % 138)))
          (LETT |lst_eqn| NIL)
          (LETT |A_wrk|
                (MAKE_MATRIX1 (QVELT |p| 0) (QVELT |p| 1)
                              (|spadConstant| % 130)))
          (SEQ (LETT |k| (LENGTH (QVELT |p| 2))) G190
               (COND ((< |k| 1) (GO G191)))
               (SEQ (LETT |A_tmp| (SPADCALL (QVELT |p| 2) |k| (QREFELT % 17)))
                    (SEQ (LETT |i| 1) (LETT #1# (QVELT |p| 0)) G190
                         (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| 1) (LETT #2# (QVELT |p| 1)) G190
                                (COND ((|greater_SI| |j| #2#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (QSETAREF2O |A_wrk| |i| |j|
                                              (SPADCALL
                                               (QAREF2O |A_tmp| |i| |j| 1 1)
                                               (QREFELT % 147))
                                              1 1)))
                                (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (LETT |B_wrk|
                          (SPADCALL
                           (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 149))
                                     |A_wrk| (QREFELT % 150))
                           (SPADCALL |lst_trn| 2 (QREFELT % 149))
                           (QREFELT % 150)))
                    (SEQ (LETT |i| NIL) (LETT #3# |rdst|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |i| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #4# |cdst|) G190
                                (COND
                                 ((OR (ATOM #4#)
                                      (PROGN (LETT |j| (CAR #4#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                               (QREFELT % 154)))
                                    (LETT |lst_eqn|
                                          (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                |lst_eqn|))))))
                                (LETT #4# (CDR #4#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                    (SEQ (LETT |i| NIL) (LETT #5# |rex1|) G190
                         (COND
                          ((OR (ATOM #5#) (PROGN (LETT |i| (CAR #5#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SEQ (LETT |j| NIL) (LETT #6# |cex1|) G190
                                (COND
                                 ((OR (ATOM #6#)
                                      (PROGN (LETT |j| (CAR #6#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((NULL
                                     (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                               (QREFELT % 154)))
                                    (LETT |lst_eqn|
                                          (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                |lst_eqn|))))))
                                (LETT #6# (CDR #6#)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (SEQ (LETT |i| NIL) (LETT #7# |rex2|) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ (LETT |j| NIL) (LETT #8# |cex2|) G190
                                 (COND
                                  ((OR (ATOM #8#)
                                       (PROGN (LETT |j| (CAR #8#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (COND
                                    ((NULL
                                      (SPADCALL (QAREF2O |B_wrk| |i| |j| 1 1)
                                                (QREFELT % 154)))
                                     (LETT |lst_eqn|
                                           (CONS (QAREF2O |B_wrk| |i| |j| 1 1)
                                                 |lst_eqn|))))))
                                 (LETT #8# (CDR #8#)) (GO G190) G191
                                 (EXIT NIL))))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
               (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
          (LETT |det_P|
                (SPADCALL (|spadConstant| % 131)
                          (SPADCALL (SPADCALL |lst_trn| 1 (QREFELT % 149))
                                    (QREFELT % 155))
                          (QREFELT % 156)))
          (LETT |det_Q|
                (SPADCALL (|spadConstant| % 131)
                          (SPADCALL (SPADCALL |lst_trn| 2 (QREFELT % 149))
                                    (QREFELT % 155))
                          (QREFELT % 156)))
          (COND
           ((NULL (SPADCALL |det_P| (QREFELT % 154)))
            (LETT |lst_eqn| (CONS |det_P| |lst_eqn|))))
          (COND
           ((NULL (SPADCALL |det_Q| (QREFELT % 154)))
            (LETT |lst_eqn| (CONS |det_Q| |lst_eqn|))))
          (EXIT |lst_eqn|)))) 

(SDEFUN |LINPEN;eliminationGroebner;%10LL;72|
        ((|p| (%)) (|row_P| (|List| (|NonNegativeInteger|)))
         (|col_P| (|List| (|NonNegativeInteger|)))
         (|row_Q| (|List| (|NonNegativeInteger|)))
         (|col_Q| (|List| (|NonNegativeInteger|)))
         (|rdst| (|List| (|NonNegativeInteger|)))
         (|cdst| (|List| (|NonNegativeInteger|)))
         (|rex1| (|List| (|NonNegativeInteger|)))
         (|cex1| (|List| (|NonNegativeInteger|)))
         (|rex2| (|List| (|NonNegativeInteger|)))
         (|cex2| (|List| (|NonNegativeInteger|)))
         (% (|List| (|Polynomial| R))))
        (SPROG
         ((|lst_eqn| (|List| (|Polynomial| R)))
          (|tmp_var| (|List| (|List| (|Symbol|))))
          (|lst_var| (|List| (|Symbol|)))
          (|tDMP|
           (|Join|
            (|PolynomialCategory| R
                                  (|DirectProduct| (|#| |lst_var|)
                                                   (|NonNegativeInteger|))
                                  (|OrderedVariableList| |lst_var|))
            (CATEGORY |domain|
             (SIGNATURE |reorder| (% % (|List| (|Integer|)))))))
          (|tPRD|
           (|Join|
            (|DirectProductCategory| (|call| LENGTH |lst_var|)
                                     #1=(|NonNegativeInteger|))
            (CATEGORY |package|
             (IF (|has| #1# (|Hashable|))
                 (ATTRIBUTE (|Hashable|))
                 |noBranch|))))
          (#2=#:G1065 NIL) (#3=#:G1066 NIL) (|eqn_wrk| (|List| |tDMP|))
          (|bas_gro| (|List| |tDMP|)) (#4=#:G1067 NIL) (|eqn| NIL)
          (#5=#:G1068 NIL) (|lst_gro| (|List| (|Polynomial| R))))
         (SEQ
          (LETT |lst_eqn|
                (SPADCALL |p| |row_P| |col_P| |row_Q| |col_Q| |rdst| |cdst|
                          |rex1| |cex1| |rex2| |cex2| (QREFELT % 158)))
          (LETT |tmp_var| (SPADCALL (ELT % 160) |lst_eqn| (QREFELT % 164)))
          (LETT |lst_var|
                (SPADCALL (SPADCALL |tmp_var| (QREFELT % 166))
                          (QREFELT % 167)))
          (LETT |tDMP|
                (|DistributedMultivariatePolynomial| |lst_var| (QREFELT % 6)))
          (LETT |tPRD|
                (|DirectProduct| (LENGTH |lst_var|) (|NonNegativeInteger|)))
          (LETT |eqn_wrk|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |eqn| NIL) (LETT #3# |lst_eqn|) G190
                      (COND
                       ((OR (ATOM #3#) (PROGN (LETT |eqn| (CAR #3#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |eqn|
                                         (|compiledLookupCheck| '|pToDmp|
                                                                (LIST
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lst_var|
                                                                  (|devaluate|
                                                                   (ELT % 6)))
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT % 6))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT % 6))))
                               #2#))))
                      (LETT #3# (CDR #3#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (LETT |bas_gro|
                (SPADCALL |eqn_wrk|
                          (|compiledLookupCheck| '|groebner|
                                                 (LIST
                                                  (LIST '|List|
                                                        (|devaluate| |tDMP|))
                                                  (LIST '|List|
                                                        (|devaluate| |tDMP|)))
                                                 (|GroebnerPackage| (ELT % 6)
                                                                    |tPRD|
                                                                    |tDMP|))))
          (LETT |lst_gro|
                (PROGN
                 (LETT #4# NIL)
                 (SEQ (LETT |eqn| NIL) (LETT #5# |bas_gro|) G190
                      (COND
                       ((OR (ATOM #5#) (PROGN (LETT |eqn| (CAR #5#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #4#
                              (CONS
                               (SPADCALL |eqn|
                                         (|compiledLookupCheck| '|dmpToP|
                                                                (LIST
                                                                 (LIST
                                                                  '|Polynomial|
                                                                  (|devaluate|
                                                                   (ELT % 6)))
                                                                 (LIST
                                                                  '|DistributedMultivariatePolynomial|
                                                                  |lst_var|
                                                                  (|devaluate|
                                                                   (ELT % 6))))
                                                                (|PolToPol|
                                                                 |lst_var|
                                                                 (ELT % 6))))
                               #4#))))
                      (LETT #5# (CDR #5#)) (GO G190) G191
                      (EXIT (NREVERSE #4#)))))
          (EXIT |lst_gro|)))) 

(SDEFUN |LINPEN;eliminationSolve;PLL;73|
        ((|eqn| (|Polynomial| R)) (|lst_val| (|List| R))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPADCALL |eqn| |lst_val| NIL (QREFELT % 170))) 

(SDEFUN |LINPEN;solveEquation|
        ((|eqn| (|Polynomial| R)) (|var| (|Symbol|))
         (|lst_add| (|List| (|Equation| (|Polynomial| R))))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPROG
         ((|sol_wrk|
           (|List| (|List| (|Equation| (|Fraction| (|Polynomial| R))))))
          (|sol1| NIL) (#1=#:G1086 NIL)
          (|sol_tst| (|Equation| (|Fraction| (|Polynomial| R))))
          (|lhs_tst| (|Fraction| (|Polynomial| R)))
          (|rhs_tst| (|Fraction| (|Polynomial| R))) (|sol2| NIL)
          (#2=#:G1087 NIL) (|sol_tmp| (|List| (|Equation| (|Polynomial| R))))
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R))))))
         (SEQ (LETT |lst_sol| NIL)
              (LETT |sol_wrk|
                    (SPADCALL
                     (SPADCALL (SPADCALL |eqn| (QREFELT % 173))
                               (QREFELT % 175))
                     (LIST |var|) (QREFELT % 178)))
              (SEQ (LETT |sol1| NIL) (LETT #1# |sol_wrk|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |sol1| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |sol_tst| (|SPADfirst| |sol1|))
                        (LETT |lhs_tst| (SPADCALL |sol_tst| (QREFELT % 180)))
                        (LETT |rhs_tst| (SPADCALL |sol_tst| (QREFELT % 181)))
                        (EXIT
                         (COND
                          ((QEQCAR (SPADCALL |lhs_tst| (QREFELT % 183)) 0)
                           (COND
                            ((SPADCALL (SPADCALL |rhs_tst| (QREFELT % 184))
                                       (|spadConstant| % 131) (QREFELT % 185))
                             (SEQ
                              (LETT |sol_tmp|
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |lhs_tst| (QREFELT % 186))
                                      (SPADCALL |rhs_tst| (QREFELT % 186))
                                      (QREFELT % 188))
                                     (QREFELT % 189)))
                              (SEQ (LETT |sol2| NIL) (LETT #2# |lst_add|) G190
                                   (COND
                                    ((OR (ATOM #2#)
                                         (PROGN (LETT |sol2| (CAR #2#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT |sol_tmp| (CONS |sol2| |sol_tmp|))))
                                   (LETT #2# (CDR #2#)) (GO G190) G191
                                   (EXIT NIL))
                              (EXIT
                               (LETT |lst_sol|
                                     (CONS |sol_tmp| |lst_sol|))))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |lst_sol|)))) 

(SDEFUN |LINPEN;equalEquation?|
        ((|sol| (|List| (|Equation| (|Polynomial| R))))
         (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R)))))
         (% (|Boolean|)))
        (SPROG
         ((#1=#:G1102 NIL) (|tmp| NIL) (#2=#:G1103 NIL) (|pos| (|Integer|))
          (#3=#:G1101 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((ZEROP (LENGTH |sol|))
              (SEQ
               (SEQ (LETT |tmp| NIL) (LETT #1# |lst_sol|) G190
                    (COND
                     ((OR (ATOM #1#) (PROGN (LETT |tmp| (CAR #1#)) NIL))
                      (GO G191)))
                    (SEQ
                     (EXIT
                      (COND
                       ((ZEROP (LENGTH |tmp|))
                        (PROGN (LETT #3# 'T) (GO #4=#:G1100))))))
                    (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
               (EXIT (PROGN (LETT #3# NIL) (GO #4#))))))
            (SEQ (LETT |tmp| NIL) (LETT #2# |lst_sol|) G190
                 (COND
                  ((OR (ATOM #2#) (PROGN (LETT |tmp| (CAR #2#)) NIL))
                   (GO G191)))
                 (SEQ
                  (LETT |pos|
                        (SPADCALL (|SPADfirst| |sol|) |tmp| (QREFELT % 191)))
                  (EXIT
                   (COND
                    ((NULL (ZEROP |pos|))
                     (COND
                      ((EQL (LENGTH (SPADCALL |sol| |tmp| (QREFELT % 192)))
                            (MAX (LENGTH |sol|) (LENGTH |tmp|)))
                       (PROGN (LETT #3# 'T) (GO #4#))))))))
                 (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
            (EXIT NIL)))
          #4# (EXIT #3#)))) 

(SDEFUN |LINPEN;eliminationSolve;PLLL;76|
        ((|eqn| (|Polynomial| R)) (|lst_val| (|List| R))
         (|sub| (|List| (|Equation| (|Polynomial| R))))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPROG
         ((|k_val| (|NonNegativeInteger|)) (|ele| NIL) (#1=#:G1141 NIL)
          (|var_sub| (|List| (|Symbol|))) (|lst_var| (|List| (|Symbol|)))
          (#2=#:G1142 NIL) (#3=#:G1140 NIL) (|var| NIL) (#4=#:G1143 NIL)
          (|vars| (|List| (|Symbol|))) (|i| NIL) (#5=#:G1144 NIL) (|j| NIL)
          (#6=#:G1145 NIL) (#7=#:G1125 NIL) (#8=#:G1126 NIL)
          (|idx_val| (|NonNegativeInteger|))
          (|lst_tmp| (|List| (|Equation| (|Polynomial| R))))
          (|eqn_tmp| (|Polynomial| R))
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|sol| NIL) (#9=#:G1146 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R))))))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_sol| NIL) (LETT |lst_tmp| NIL)
                (LETT |lst_var| (SPADCALL |eqn| (QREFELT % 160)))
                (LETT |k_val| (LENGTH |lst_val|))
                (COND
                 ((ZEROP (LENGTH |lst_var|))
                  (PROGN (LETT #3# |lst_sol|) (GO #10=#:G1139))))
                (EXIT
                 (COND
                  ((ZEROP |k_val|)
                   (|error|
                    "LINPEN: eliminationSolve(eqn, lst_val) - missing values."))
                  ('T
                   (SEQ
                    (COND
                     ((EQL (LENGTH |lst_var|) 1)
                      (COND
                       ((ZEROP (LENGTH |sub|))
                        (SEQ
                         (LETT |lst_sol|
                               (|LINPEN;solveEquation| |eqn|
                                (|SPADfirst| |lst_var|) NIL %))
                         (EXIT (PROGN (LETT #3# |lst_sol|) (GO #10#))))))))
                    (LETT |var_sub| NIL)
                    (SEQ (LETT |ele| NIL) (LETT #1# |sub|) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |ele| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |var_sub|
                                 (SPADCALL
                                  (SPADCALL |var_sub|
                                            (SPADCALL
                                             (SPADCALL |ele| (QREFELT % 193))
                                             (QREFELT % 160))
                                            (QREFELT % 194))
                                  (QREFELT % 167)))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                    (LETT |lst_var|
                          (SPADCALL |lst_var| |var_sub| (QREFELT % 195)))
                    (COND
                     ((ZEROP (LENGTH |lst_var|))
                      (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                           (EXIT (PROGN (LETT #3# |lst_sol|) (GO #10#))))))
                    (COND
                     ((EQL (LENGTH |lst_var|) 1)
                      (SEQ
                       (LETT |eqn_tmp| (SPADCALL |eqn| |sub| (QREFELT % 141)))
                       (COND
                        ((SPADCALL |eqn_tmp| (QREFELT % 154))
                         (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                              (EXIT (PROGN (LETT #3# |lst_sol|) (GO #10#))))))
                       (LETT |sol_wrk|
                             (|LINPEN;solveEquation| |eqn_tmp|
                              (|SPADfirst| |lst_var|) |sub| %))
                       (SEQ (LETT |sol| NIL) (LETT #2# |sol_wrk|) G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |sol| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((> (LENGTH |sol|) 0)
                                (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                       (EXIT (PROGN (LETT #3# |lst_sol|) (GO #10#))))))
                    (LETT |eqn_tmp| (SPADCALL |eqn| |sub| (QREFELT % 141)))
                    (COND
                     ((SPADCALL |eqn_tmp| (QREFELT % 154))
                      (SEQ (LETT |lst_sol| (CONS |sub| |lst_sol|))
                           (EXIT (PROGN (LETT #3# |lst_sol|) (GO #10#))))))
                    (SEQ (LETT |var| NIL) (LETT #4# |lst_var|) G190
                         (COND
                          ((OR (ATOM #4#) (PROGN (LETT |var| (CAR #4#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |vars|
                                (SPADCALL |var| |lst_var| (QREFELT % 196)))
                          (EXIT
                           (SEQ (LETT |i| 1)
                                (LETT #5# (EXPT |k_val| (LENGTH |vars|))) G190
                                (COND ((|greater_SI| |i| #5#) (GO G191)))
                                (SEQ
                                 (LETT |lst_tmp|
                                       (SPADCALL |sub| (QREFELT % 197)))
                                 (SEQ (LETT |j| 1) (LETT #6# (LENGTH |vars|))
                                      G190
                                      (COND ((|greater_SI| |j| #6#) (GO G191)))
                                      (SEQ
                                       (LETT |idx_val|
                                             (|quotient_INT|
                                              (PROG1 (LETT #7# (- |i| 1))
                                                (|check_subtype2| (>= #7# 0)
                                                                  '(|NonNegativeInteger|)
                                                                  '(|Integer|)
                                                                  #7#))
                                              (EXPT |k_val|
                                                    (PROG1 (LETT #8# (- |j| 1))
                                                      (|check_subtype2|
                                                       (>= #8# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #8#)))))
                                       (LETT |idx_val| (REM |idx_val| |k_val|))
                                       (EXIT
                                        (LETT |lst_tmp|
                                              (CONS
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |vars| |j|
                                                           (QREFELT % 199))
                                                 (QREFELT % 136))
                                                (SPADCALL
                                                 (SPADCALL |lst_val|
                                                           (+ |idx_val| 1)
                                                           (QREFELT % 113))
                                                 (QREFELT % 147))
                                                (QREFELT % 188))
                                               |lst_tmp|))))
                                      (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                      (EXIT NIL))
                                 (LETT |eqn_tmp|
                                       (SPADCALL |eqn| |lst_tmp|
                                                 (QREFELT % 141)))
                                 (EXIT
                                  (COND
                                   ((SPADCALL |eqn_tmp| (QREFELT % 154))
                                    (LETT |lst_sol|
                                          (CONS |lst_tmp| |lst_sol|)))
                                   ('T
                                    (SEQ
                                     (LETT |eqn_tmp|
                                           (SPADCALL |eqn| |lst_tmp|
                                                     (QREFELT % 141)))
                                     (LETT |sol_wrk|
                                           (|LINPEN;solveEquation| |eqn_tmp|
                                            |var| |lst_tmp| %))
                                     (EXIT
                                      (SEQ (LETT |sol| NIL)
                                           (LETT #9# |sol_wrk|) G190
                                           (COND
                                            ((OR (ATOM #9#)
                                                 (PROGN
                                                  (LETT |sol| (CAR #9#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (COND
                                              ((NULL
                                                (|LINPEN;equalEquation?| |sol|
                                                 |lst_sol| %))
                                               (LETT |lst_sol|
                                                     (CONS |sol|
                                                           |lst_sol|))))))
                                           (LETT #9# (CDR #9#)) (GO G190) G191
                                           (EXIT NIL))))))))
                                (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                (EXIT NIL))))
                         (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                    (EXIT |lst_sol|)))))))
          #10# (EXIT #3#)))) 

(SDEFUN |LINPEN;eliminationSolve;PL2L;77|
        ((|eqn| (|Polynomial| R)) (|lst_val| (|List| R))
         (|lst_sub| (|List| (|List| (|Equation| (|Polynomial| R)))))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G1161 NIL) (#2=#:G1160 NIL) (|sub| NIL) (#3=#:G1162 NIL)
          (|lst_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|sol| NIL) (#4=#:G1163 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R))))))
         (SEQ
          (EXIT
           (SEQ (LETT |lst_sol| NIL)
                (COND
                 ((ZEROP (LENGTH |lst_sub|))
                  (SEQ
                   (LETT |lst_wrk|
                         (SPADCALL |eqn| |lst_val| NIL (QREFELT % 200)))
                   (SEQ (LETT |sol| NIL) (LETT #1# |lst_wrk|) G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL (|LINPEN;equalEquation?| |sol| |lst_sol| %))
                            (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                        (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                   (EXIT (PROGN (LETT #2# |lst_sol|) (GO #5=#:G1159))))))
                (SEQ (LETT |sub| NIL) (LETT #3# |lst_sub|) G190
                     (COND
                      ((OR (ATOM #3#) (PROGN (LETT |sub| (CAR #3#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |lst_wrk|
                            (SPADCALL |eqn| |lst_val| |sub| (QREFELT % 200)))
                      (EXIT
                       (SEQ (LETT |sol| NIL) (LETT #4# |lst_wrk|) G190
                            (COND
                             ((OR (ATOM #4#)
                                  (PROGN (LETT |sol| (CAR #4#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((NULL
                                 (|LINPEN;equalEquation?| |sol| |lst_sol| %))
                                (LETT |lst_sol| (CONS |sol| |lst_sol|))))))
                            (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))))
                     (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
                (EXIT |lst_sol|)))
          #5# (EXIT #2#)))) 

(SDEFUN |LINPEN;eliminationSolve;LL2L;78|
        ((|lst_eqn| (|List| (|Polynomial| R))) (|lst_val| (|List| R))
         (|lst_sub| (|List| (|List| (|Equation| (|Polynomial| R)))))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPROG
         ((#1=#:G1191 NIL) (#2=#:G1192 NIL) (#3=#:G1189 NIL) (#4=#:G1190 NIL)
          (|sub| NIL) (#5=#:G1193 NIL)
          (|lst_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (|sol| NIL) (#6=#:G1194 NIL) (|eqn| NIL) (#7=#:G1195 NIL)
          (|eqn_tmp| (|Polynomial| R)) (|flg_sol| (|Boolean|)) (#8=#:G1188 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R))))))
         (SEQ
          (EXIT
           (COND
            ((ZEROP (LENGTH |lst_eqn|))
             (|error|
              "LINPEN: eliminationSolve(lst_eqn, lst_val, lst_sub) - missing equation(s)."))
            ('T
             (SEQ (LETT |lst_sol| NIL)
                  (COND
                   ((ZEROP (LENGTH |lst_sub|))
                    (SEQ
                     (LETT |lst_wrk|
                           (SPADCALL (|SPADfirst| |lst_eqn|) |lst_val| NIL
                                     (QREFELT % 200)))
                     (SEQ (LETT |sol| NIL) (LETT #1# |lst_wrk|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |sol| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |flg_sol| 'T)
                               (SEQ
                                (EXIT
                                 (SEQ (LETT |eqn| NIL)
                                      (LETT #2# (CDR |lst_eqn|)) G190
                                      (COND
                                       ((OR (ATOM #2#)
                                            (PROGN (LETT |eqn| (CAR #2#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (LETT |eqn_tmp|
                                             (SPADCALL |eqn| |sol|
                                                       (QREFELT % 141)))
                                       (EXIT
                                        (COND
                                         ((NULL
                                           (SPADCALL |eqn_tmp|
                                                     (QREFELT % 154)))
                                          (SEQ (LETT |flg_sol| NIL)
                                               (EXIT
                                                (PROGN
                                                 (LETT #3# 1)
                                                 (GO #9=#:G1168))))))))
                                      (LETT #2# (CDR #2#)) (GO G190) G191
                                      (EXIT NIL)))
                                #9# (EXIT #3#))
                               (EXIT
                                (COND
                                 (|flg_sol|
                                  (COND
                                   ((NULL
                                     (|LINPEN;equalEquation?| |sol| |lst_sol|
                                      %))
                                    (LETT |lst_sol|
                                          (CONS |sol| |lst_sol|))))))))
                          (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                     (EXIT (PROGN (LETT #4# |lst_sol|) (GO #10=#:G1187))))))
                  (SEQ (LETT |sub| NIL) (LETT #5# |lst_sub|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |sub| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |lst_wrk|
                              (SPADCALL (|SPADfirst| |lst_eqn|) |lst_val| |sub|
                                        (QREFELT % 200)))
                        (EXIT
                         (SEQ (LETT |sol| NIL) (LETT #6# |lst_wrk|) G190
                              (COND
                               ((OR (ATOM #6#)
                                    (PROGN (LETT |sol| (CAR #6#)) NIL))
                                (GO G191)))
                              (SEQ (LETT |flg_sol| 'T)
                                   (SEQ
                                    (EXIT
                                     (SEQ (LETT |eqn| NIL)
                                          (LETT #7# (CDR |lst_eqn|)) G190
                                          (COND
                                           ((OR (ATOM #7#)
                                                (PROGN
                                                 (LETT |eqn| (CAR #7#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (LETT |eqn_tmp|
                                                 (SPADCALL |eqn| |sol|
                                                           (QREFELT % 141)))
                                           (EXIT
                                            (COND
                                             ((NULL
                                               (SPADCALL |eqn_tmp|
                                                         (QREFELT % 154)))
                                              (SEQ (LETT |flg_sol| NIL)
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #8# |$NoValue|)
                                                     (GO #11=#:G1179))))))))
                                          (LETT #7# (CDR #7#)) (GO G190) G191
                                          (EXIT NIL)))
                                    #11# (EXIT #8#))
                                   (EXIT
                                    (COND
                                     (|flg_sol|
                                      (COND
                                       ((NULL
                                         (|LINPEN;equalEquation?| |sol|
                                          |lst_sol| %))
                                        (LETT |lst_sol|
                                              (CONS |sol| |lst_sol|))))))))
                              (LETT #6# (CDR #6#)) (GO G190) G191 (EXIT NIL))))
                       (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
                  (EXIT |lst_sol|)))))
          #10# (EXIT #4#)))) 

(SDEFUN |LINPEN;eliminationSolve;LL;79|
        ((|lst_eqn| (|List| (|Polynomial| R)))
         (% (|List| (|List| (|Equation| (|Polynomial| R))))))
        (SPROG
         ((|lst_val| (|List| R)) (|k| NIL)
          (|lst_wrk| (|List| (|Polynomial| R)))
          (|sol_wrk| (|List| (|List| (|Equation| (|Polynomial| R)))))
          (#1=#:G1202 NIL)
          (|lst_sol| (|List| (|List| (|Equation| (|Polynomial| R))))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |lst_val| (LIST (|spadConstant| % 8) (|spadConstant| % 20)))
            (LETT |lst_wrk| NIL) (LETT |lst_sol| NIL)
            (SEQ (LETT |k| (LENGTH |lst_eqn|)) G190
                 (COND ((< |k| 1) (GO G191)))
                 (SEQ
                  (LETT |lst_wrk|
                        (CONS (SPADCALL |lst_eqn| |k| (QREFELT % 203))
                              |lst_wrk|))
                  (LETT |sol_wrk|
                        (SPADCALL |lst_wrk| |lst_val| |lst_sol|
                                  (QREFELT % 201)))
                  (COND
                   ((ZEROP (LENGTH |sol_wrk|))
                    (PROGN (LETT #1# NIL) (GO #2=#:G1201))))
                  (EXIT (LETT |lst_sol| (SPADCALL |sol_wrk| (QREFELT % 204)))))
                 (LETT |k| (+ |k| -1)) (GO G190) G191 (EXIT NIL))
            (EXIT |lst_sol|)))
          #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |LinearMultivariateMatrixPencil;|)) 

(DEFUN |LinearMultivariateMatrixPencil;| (|#1|)
  (SPROG ((DV$1 NIL) (|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|LinearMultivariateMatrixPencil| DV$1))
          (LETT % (GETREFV 206))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|Field|))))))
          (|haddProp| |$ConstructorCache| '|LinearMultivariateMatrixPencil|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7
                    (|Record| (|:| |nr| (|NonNegativeInteger|))
                              (|:| |nc| (|NonNegativeInteger|))
                              (|:| A (|List| (|Matrix| |#1|)))))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV % 128
                       (CONS
                        (|dispatchFunction| |LINPEN;blockElimination;%6LL;65|)
                        %))
             (QSETREFV % 138
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;%2LS2LSL;66|)
                        %))
             (QSETREFV % 139
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;%4LL;67|)
                        %))
             (QSETREFV % 146
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationTransformations;%4LLL;68|)
                        %))
             (QSETREFV % 152
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;%6LL;69|)
                        %))
             (QSETREFV % 153
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;%10LL;70|)
                        %))
             (QSETREFV % 158
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationEquations;%10LL;71|)
                        %))
             (QSETREFV % 168
                       (CONS
                        (|dispatchFunction|
                         |LINPEN;eliminationGroebner;%10LL;72|)
                        %))
             (QSETREFV % 171
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PLL;73|)
                        %))
             (QSETREFV % 200
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PLLL;76|)
                        %))
             (QSETREFV % 170
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;PL2L;77|)
                        %))
             (QSETREFV % 201
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;LL2L;78|)
                        %))
             (QSETREFV % 205
                       (CONS
                        (|dispatchFunction| |LINPEN;eliminationSolve;LL;79|)
                        %)))))
          %))) 

(DEFUN |LinearMultivariateMatrixPencil| (#1=#:G1203)
  (SPROG NIL
         (PROG (#2=#:G1204)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|LinearMultivariateMatrixPencil|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|LinearMultivariateMatrixPencil;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LinearMultivariateMatrixPencil|)))))))))) 

(MAKEPROP '|LinearMultivariateMatrixPencil| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep| (0 . |0|)
              (|NonNegativeInteger|) (|Matrix| 6) (|List| 10) (4 . |new|)
              (|Integer|) (10 . |setelt!|) |LINPEN;qnew;3Nni%;1| (17 . |copy|)
              (22 . |elt|) (28 . |copy|) |LINPEN;copy;2%;2| (33 . |1|)
              |LINPEN;append;%Nni%;3| (37 . |append|) |LINPEN;append!;%Nni%;4|
              (|OutputForm|) (43 . |coerce|) |LINPEN;coerce;%Of;5|
              |LINPEN;nrows;%Nni;6| |LINPEN;ncols;%Nni;7| |LINPEN;nelem;%Nni;8|
              (|Boolean|) (48 . =) |LINPEN;=;2%B;9| (|List| 9) (54 . |#|)
              (59 . ~=) (|List| 30) (65 . |new|) (71 . |elt|) (77 . |setelt!|)
              (84 . |elt|) (90 . |zero?|) |LINPEN;equal?;%L%LB;10| (95 . =)
              |LINPEN;qequal?;%L%LNniB;11| (101 . |zero?|)
              |LINPEN;qzero?;%2NniB;12| |LINPEN;qzero?;%4NniB;13|
              |LINPEN;qzero?;%5NniB;14| |LINPEN;qsemizero?;%5NniB;15|
              (106 . ~=) |LINPEN;zero?;%2NniB;16| |LINPEN;qdiagonal?;%3NniB;18|
              |LINPEN;diagonal?;%NniB;17| (|List| 6)
              |LINPEN;qdiagonal;%3NniL;20| |LINPEN;diagonal;%NniL;19|
              (112 . |new|) (118 . |setelt!|)
              |LINPEN;quppertriangular?;%3NniB;22|
              |LINPEN;uppertriangular?;%NniB;21| |LINPEN;qnilpotent?;%3NniB;23|
              (|List| 33) (125 . |new|) (131 . |setelt!|)
              |LINPEN;qcolumnIndices;%2NniL;24|
              |LINPEN;qcolumnIndices;%3NniL;25|
              |LINPEN;qcolumnIndices;%NniL;26| |LINPEN;qrowIndices;%3NniL;27|
              |LINPEN;qrowIndices;%2NniL;28| |LINPEN;qrowIndices;%NniL;29|
              |LINPEN;qelt;%3NniR;30| |LINPEN;elt;%3NniR;31|
              |LINPEN;elt;%2NniL;32| |LINPEN;qelt;%2NniL;33|
              |LINPEN;matrix;%NniM;34| (138 . |subMatrix|)
              |LINPEN;subMatrix;%5NniM;35| |LINPEN;subPencil;%4Nni%;36|
              (147 . |min|) (|Mapping| 9 9 9) (153 . |reduce|) (159 . |max|)
              |LINPEN;subPencil;%2L%;37| (165 . |position|)
              |LINPEN;removeRowsColumns;%2L%;38| (171 . |sort|) (176 . |new|)
              (182 . |setelt!|) |LINPEN;insertRowsColumns;%2L%;39|
              |LINPEN;qswapRows!;%2Nni%;40| |LINPEN;swapRows!;%2Nni%;41|
              (189 . *) (195 . +) |LINPEN;qaddRows!;%2NniR%;42|
              |LINPEN;addRows!;%2NniR%;43| |LINPEN;qmultiplyRow!;%NniR%;44|
              |LINPEN;multiplyRow!;%NniR%;45| |LINPEN;qswapColumns!;%2Nni%;46|
              |LINPEN;swapColumns!;%2Nni%;47| |LINPEN;qaddColumns!;%2NniR%;48|
              |LINPEN;addColumns!;%2NniR%;49|
              |LINPEN;qmultiplyColumn!;%NniR%;50|
              |LINPEN;multiplyColumn!;%NniR%;51|
              |LINPEN;qscaleBlock!;%5NniR%;52|
              |LINPEN;transformColumns!;%M%;56| |LINPEN;*;%M%;53|
              |LINPEN;transformRows!;%M%;55| |LINPEN;*;M2%;54| (201 . *)
              |LINPEN;leftIdentity;%M;57| |LINPEN;rightIdentity;%M;58|
              |LINPEN;qsetelt!;%3Nni2R;59| (207 . |elt|)
              |LINPEN;qsetelt!;%2Nni2L;60| |LINPEN;setelt!;%3Nni2R;61|
              |LINPEN;setelt!;%2Nni2L;62| (213 . |setsubMatrix!|)
              |LINPEN;setsubMatrix!;%3Nni2M;63|
              |LINPEN;setsubPencil!;%2Nni2%;64| (221 . -) (|Vector| 6)
              (226 . |vector|) (|Union| 121 '"failed")
              (|Record| (|:| |particular| 123) (|:| |basis| (|List| 121)))
              (|LinearSystemMatrixPackage1| 6) (231 . |solve|) (237 . |parts|)
              (242 . |blockElimination|) (|Polynomial| 6) (253 . |0|)
              (257 . |1|) (261 . |coerce|) (|List| 24) (|Symbol|) (266 . |elt|)
              (272 . |coerce|) (|List| 148)
              (277 . |eliminationTransformations|)
              (288 . |eliminationTransformations|) (|List| (|Equation| %))
              (297 . |eval|) (303 . |totalDegree|) (308 . |retract|)
              (313 . |rank|) (|List| 187) (318 . |eliminationTransformations|)
              (328 . |coerce|) (|Matrix| 129) (333 . |elt|) (339 . *)
              (345 . |zero|) (351 . |eliminationEquations|)
              (362 . |eliminationEquations|) (377 . |zero?|)
              (382 . |determinant|) (387 . -) (|List| 129)
              (393 . |eliminationEquations|) (|List| 134) (408 . |variables|)
              (|List| 159) (|Mapping| 159 129) (|ListFunctions2| 129 159)
              (413 . |map|) (|List| %) (419 . |concat|)
              (424 . |removeDuplicates|) (429 . |eliminationGroebner|)
              (|List| 145) (444 . |eliminationSolve|)
              (451 . |eliminationSolve|) (|Fraction| 129) (457 . |coerce|)
              (|List| 172) (462 . |list|) (|List| (|List| 179))
              (|SystemSolvePackage| 6) (467 . |solve|) (|Equation| 172)
              (473 . |lhs|) (478 . |rhs|) (|Union| 134 '"failed")
              (483 . |retractIfCan|) (488 . |denom|) (493 . =) (499 . |numer|)
              (|Equation| 129) (504 . |equation|) (510 . |list|)
              (515 . |first|) (520 . |position|) (526 . |setUnion|)
              (532 . |lhs|) (537 . |concat|) (543 . |setDifference|)
              (549 . |remove|) (555 . |copy|) (560 . |1|) (564 . |elt|)
              (570 . |eliminationSolve|) (577 . |eliminationSolve|) (584 . |0|)
              (588 . |elt|) (594 . |copy|) (599 . |eliminationSolve|))
           '#(|zero?| 604 |uppertriangular?| 611 |transformRows!| 617
              |transformColumns!| 623 |swapRows!| 629 |swapColumns!| 636
              |subPencil| 643 |subMatrix| 659 |setsubPencil!| 669
              |setsubMatrix!| 677 |setelt!| 686 |rightIdentity| 703
              |removeRowsColumns| 708 |qzero?| 715 |quppertriangular?| 741
              |qswapRows!| 749 |qswapColumns!| 756 |qsetelt!| 763 |qsemizero?|
              780 |qscaleBlock!| 790 |qrowIndices| 801 |qnilpotent?| 822 |qnew|
              830 |qmultiplyRow!| 837 |qmultiplyColumn!| 844 |qequal?| 851
              |qelt| 860 |qdiagonal?| 875 |qdiagonal| 883 |qcolumnIndices| 891
              |qaddRows!| 912 |qaddColumns!| 920 |nrows| 928 |nelem| 933
              |ncols| 938 |multiplyRow!| 943 |multiplyColumn!| 950 |matrix| 957
              |leftIdentity| 963 |insertRowsColumns| 968 |equal?| 975 |elt| 983
              |eliminationTransformations| 998 |eliminationSolve| 1028
              |eliminationGroebner| 1060 |eliminationEquations| 1075
              |diagonal?| 1116 |diagonal| 1122 |copy| 1128 |coerce| 1133
              |blockElimination| 1138 |append!| 1149 |append| 1155 |addRows!|
              1161 |addColumns!| 1169 = 1177 * 1183)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|qnew|
                                 ($$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|copy| ($$ $$)) T)
                              '((|append| ($$ $$ (|NonNegativeInteger|))) T)
                              '((|append!| ($$ $$ (|NonNegativeInteger|))) T)
                              '((|coerce| ((|OutputForm|) $$)) T)
                              '((= ((|Boolean|) $$ $$)) T)
                              '((|equal?|
                                 ((|Boolean|) $$
                                  (|List| (|NonNegativeInteger|)) $$
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|qequal?|
                                 ((|Boolean|) $$
                                  (|List| (|NonNegativeInteger|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|NonNegativeInteger|)))
                                T)
                              '((|nrows| ((|NonNegativeInteger|) $$)) T)
                              '((|ncols| ((|NonNegativeInteger|) $$)) T)
                              '((|nelem| ((|NonNegativeInteger|) $$)) T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qzero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qsemizero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|zero?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|diagonal?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|qdiagonal?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|diagonal|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|qdiagonal|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|uppertriangular?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|quppertriangular?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qnilpotent?|
                                 ((|Boolean|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|NonNegativeInteger|)) $$
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qcolumnIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|NonNegativeInteger|)) $$
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qrowIndices|
                                 ((|List| (|List| (|NonNegativeInteger|))) $$
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qelt|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|elt|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qelt|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|elt|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|matrix|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)))
                                T)
                              '((|subMatrix|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|subPencil|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|subPencil|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|removeRowsColumns|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|insertRowsColumns|
                                 ($$ $$ (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                T)
                              '((|swapRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|qswapRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|addRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qaddRows!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qmultiplyRow!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|multiplyRow!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qswapColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|swapColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|)))
                                T)
                              '((|addColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qaddColumns!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) |#1|))
                                T)
                              '((|multiplyColumn!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qmultiplyColumn!|
                                 ($$ $$ (|NonNegativeInteger|) |#1|))
                                T)
                              '((|qscaleBlock!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((* ($$ $$ (|Matrix| |#1|))) T)
                              '((* ($$ (|Matrix| |#1|) $$)) T)
                              '((|transformRows!| ($$ $$ (|Matrix| |#1|))) T)
                              '((|transformColumns!| ($$ $$ (|Matrix| |#1|)))
                                T)
                              '((|leftIdentity| ((|Matrix| |#1|) $$)) T)
                              '((|rightIdentity| ((|Matrix| |#1|) $$)) T)
                              '((|qsetelt!|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((|qsetelt!|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|List| |#1|)))
                                T)
                              '((|setelt!|
                                 (|#1| $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  |#1|))
                                T)
                              '((|setelt!|
                                 ((|List| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|List| |#1|)))
                                T)
                              '((|setsubMatrix!|
                                 ((|Matrix| |#1|) $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) (|NonNegativeInteger|)
                                  (|Matrix| |#1|)))
                                T)
                              '((|setsubPencil!|
                                 ($$ $$ (|NonNegativeInteger|)
                                  (|NonNegativeInteger|) $$))
                                T)
                              '((|blockElimination|
                                 ((|List| (|Matrix| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|)) (|Symbol|)
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|)) (|Symbol|)))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationTransformations|
                                 ((|List| (|Matrix| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|Equation| (|Polynomial| |#1|)))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Matrix| (|Polynomial| |#1|))) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationEquations|
                                 ((|List| (|Polynomial| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationGroebner|
                                 ((|List| (|Polynomial| |#1|)) $$
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))
                                  (|List| (|NonNegativeInteger|))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)
                                  (|List| (|Equation| (|Polynomial| |#1|)))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|Polynomial| |#1|) (|List| |#1|)
                                  (|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List| (|Polynomial| |#1|)) (|List| |#1|)
                                  (|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))))
                                (|has| 6 (|Field|)))
                              '((|eliminationSolve|
                                 ((|List|
                                   (|List| (|Equation| (|Polynomial| |#1|))))
                                  (|List| (|Polynomial| |#1|))))
                                (|has| 6 (|Field|))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 205
                                            '(0 6 0 8 2 11 0 9 10 12 3 11 10 0
                                              13 10 14 1 11 0 0 16 2 11 10 0 13
                                              17 1 10 0 0 18 0 6 0 20 2 11 0 0
                                              0 22 1 11 24 0 25 2 10 30 0 0 31
                                              1 33 9 0 34 2 9 30 0 0 35 2 36 0
                                              9 30 37 2 33 9 0 13 38 3 36 30 0
                                              13 30 39 2 36 30 0 13 40 1 10 30
                                              0 41 2 6 30 0 0 43 1 6 30 0 45 2
                                              6 30 0 0 50 2 54 0 9 6 57 3 54 6
                                              0 13 6 58 2 62 0 9 33 63 3 62 33
                                              0 13 33 64 5 10 0 0 13 13 13 13
                                              76 2 9 0 0 0 79 2 33 9 80 0 81 2
                                              9 0 0 0 82 2 33 13 9 0 84 1 33 0
                                              0 86 2 33 0 9 9 87 3 33 9 0 13 9
                                              88 2 6 0 0 0 92 2 6 0 0 0 93 2 10
                                              0 0 0 109 2 54 6 0 13 113 4 10 0
                                              0 13 13 0 117 1 6 0 0 120 1 121 0
                                              54 122 2 125 124 10 121 126 1 121
                                              54 0 127 7 0 11 0 33 33 33 33 33
                                              33 128 0 129 0 130 0 129 0 131 1
                                              9 24 0 132 2 134 0 0 133 135 1
                                              129 0 134 136 7 0 137 0 33 33 134
                                              33 33 134 138 5 0 137 0 33 33 33
                                              33 139 2 129 0 0 140 141 1 129 9
                                              0 142 1 129 6 0 143 1 10 9 0 144
                                              6 0 11 0 33 33 33 33 145 146 1
                                              129 0 6 147 2 137 148 0 13 149 2
                                              148 0 0 0 150 2 148 0 9 9 151 7 0
                                              137 0 33 33 33 33 33 33 152 11 0
                                              137 0 33 33 33 33 33 33 33 33 33
                                              33 153 1 129 30 0 154 1 148 129 0
                                              155 2 129 0 0 0 156 11 0 157 0 33
                                              33 33 33 33 33 33 33 33 33 158 1
                                              129 159 0 160 2 163 161 162 157
                                              164 1 159 0 165 166 1 159 0 0 167
                                              11 0 157 0 33 33 33 33 33 33 33
                                              33 33 33 168 3 0 169 129 54 169
                                              170 2 0 169 129 54 171 1 172 0
                                              129 173 1 174 0 172 175 2 177 176
                                              174 159 178 1 179 172 0 180 1 179
                                              172 0 181 1 172 182 0 183 1 172
                                              129 0 184 2 129 30 0 0 185 1 172
                                              129 0 186 2 187 0 129 129 188 1
                                              145 0 187 189 1 145 187 0 190 2
                                              145 13 187 0 191 2 145 0 0 0 192
                                              1 187 129 0 193 2 159 0 0 0 194 2
                                              159 0 0 0 195 2 159 0 134 0 196 1
                                              145 0 0 197 0 187 0 198 2 159 134
                                              0 13 199 3 0 169 129 54 145 200 3
                                              0 169 157 54 169 201 0 187 0 202
                                              2 157 129 0 13 203 1 169 0 0 204
                                              1 0 169 157 205 3 0 30 0 9 9 51 2
                                              0 30 0 9 60 2 0 0 0 10 107 2 0 0
                                              0 10 105 3 0 0 0 9 9 91 3 0 0 0 9
                                              9 99 3 0 0 0 33 33 83 5 0 0 0 9 9
                                              9 9 78 6 0 10 0 9 9 9 9 9 77 4 0
                                              0 0 9 9 0 119 5 0 10 0 9 9 9 10
                                              118 5 0 6 0 9 9 9 6 115 4 0 54 0
                                              9 9 54 116 1 0 10 0 111 3 0 0 0
                                              33 33 85 5 0 30 0 9 9 9 9 47 6 0
                                              30 0 9 9 9 9 9 48 3 0 30 0 9 9 46
                                              4 0 30 0 9 9 9 59 3 0 0 0 9 9 90
                                              3 0 0 0 9 9 98 4 0 54 0 9 9 54
                                              114 5 0 6 0 9 9 9 6 112 6 0 30 0
                                              9 9 9 9 9 49 7 0 0 0 9 9 9 9 9 6
                                              104 2 0 62 0 9 70 4 0 33 0 9 9 9
                                              68 3 0 62 0 9 9 69 4 0 30 0 9 9 9
                                              61 3 0 0 9 9 9 15 3 0 0 0 9 6 96
                                              3 0 0 0 9 6 102 5 0 30 0 33 0 33
                                              9 44 3 0 54 0 9 9 74 4 0 6 0 9 9
                                              9 71 4 0 30 0 9 9 9 52 4 0 54 0 9
                                              9 9 55 2 0 62 0 9 67 3 0 62 0 9 9
                                              65 4 0 33 0 9 9 9 66 4 0 0 0 9 9
                                              6 94 4 0 0 0 9 9 6 100 1 0 9 0 27
                                              1 0 9 0 29 1 0 9 0 28 3 0 0 0 9 6
                                              97 3 0 0 0 9 6 103 2 0 10 0 9 75
                                              1 0 10 0 110 3 0 0 0 33 33 89 4 0
                                              30 0 33 0 33 42 3 0 54 0 9 9 73 4
                                              0 6 0 9 9 9 72 6 1 11 0 33 33 33
                                              33 145 146 7 1 137 0 33 33 134 33
                                              33 134 138 5 1 137 0 33 33 33 33
                                              139 3 1 169 157 54 169 201 1 1
                                              169 157 205 3 1 169 129 54 169
                                              170 2 1 169 129 54 171 3 1 169
                                              129 54 145 200 11 1 157 0 33 33
                                              33 33 33 33 33 33 33 33 168 11 1
                                              157 0 33 33 33 33 33 33 33 33 33
                                              33 158 11 1 137 0 33 33 33 33 33
                                              33 33 33 33 33 153 7 1 137 0 33
                                              33 33 33 33 33 152 2 0 30 0 9 53
                                              2 0 54 0 9 56 1 0 0 0 19 1 0 24 0
                                              26 7 1 11 0 33 33 33 33 33 33 128
                                              2 0 0 0 9 23 2 0 0 0 9 21 4 0 0 0
                                              9 9 6 95 4 0 0 0 9 9 6 101 2 0 30
                                              0 0 32 2 0 0 0 10 106 2 0 0 10 0
                                              108)))))
           '|lookupComplete|)) 
